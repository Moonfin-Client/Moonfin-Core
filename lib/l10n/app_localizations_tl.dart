// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tagalog (`tl`).
class AppLocalizationsTl extends AppLocalizations {
  AppLocalizationsTl([String locale = 'tl']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'MGA KAGUSTUHAN SA ACCOUNT';

  @override
  String get interfaceLanguage => 'Wika ng Interface';

  @override
  String get systemLanguageDefault => 'Default ng System';

  @override
  String get signIn => 'Mag-sign In';

  @override
  String get empty => 'Walang laman';

  @override
  String connectingToServer(String serverName) {
    return 'Kumokonekta sa $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Password';

  @override
  String get username => 'Username';

  @override
  String get email => 'Email';

  @override
  String get quickConnectInstruction =>
      'Ilagay ang code na ito sa web dashboard ng iyong server:';

  @override
  String get waitingForAuthorization => 'Naghihintay ng awtorisasyon...';

  @override
  String get back => 'Bumalik';

  @override
  String get serverUnavailable => 'Hindi available ang server';

  @override
  String get loginFailed => 'Nabigo ang pag-login';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Hindi available ang QuickConnect: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Hindi available ang QuickConnect ($status): $detail';
  }

  @override
  String get whosWatching => 'Sino nanonood?';

  @override
  String get addUser => 'Magdagdag ng User';

  @override
  String get selectServer => 'Piliin ang Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin bersyon $version';
  }

  @override
  String get savedServers => 'Mga Naka-save na Server';

  @override
  String get discoveredServers => 'Mga Natuklasan na Server';

  @override
  String get noneFound => 'Walang nahanap';

  @override
  String get unableToConnectToServer => 'Hindi makakonekta sa server';

  @override
  String get addServer => 'Magdagdag ng Server';

  @override
  String get embyConnect => 'Emby Kumonekta';

  @override
  String get removeServer => 'Alisin ang Server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Alisin ang \"$serverName\" sa iyong mga server?';
  }

  @override
  String get cancel => 'Kanselahin';

  @override
  String get remove => 'Alisin';

  @override
  String get connectToServer => 'Kumonekta sa Server';

  @override
  String get serverAddress => 'Address ng Server';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Kumonekta';

  @override
  String get secureStorageUnavailable =>
      'Hindi Available ang Ligtas na Imbakan';

  @override
  String get secureStorageUnavailableMessage =>
      'Hindi ma-access ng Moonfin ang keyring ng iyong system. Maaaring magpatuloy ang pag-log in, ngunit maaaring hindi available ang secure na imbakan ng token hanggang sa ma-unlock ang keyring.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema ng App';

  @override
  String get detailScreenStyle => 'Istilo ng detail screen';

  @override
  String get detailScreenStyleSubtitle =>
      'Ang Classic ay ang orihinal na nakasentrong layout ng Moonfin. Ang Modern ay isang responsive na cinematic na layout.';

  @override
  String get detailScreenStyleMoonfin => 'Classic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'Mga Naka-expand na Tab';

  @override
  String get expandedTabsSubtitle =>
      'Awtomatikong ipakita ang nilalaman ng tab habang nagba-browse ng mga tab. I-off para manu-manong buksan at isara ang bawat tab.';

  @override
  String get showTechnicalDetails => 'Ipakita ang Mga Teknikal na Detalye?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Ipakita ang impormasyon ng codec, resolution, at stream sa buod ng banner';

  @override
  String get recommendationSystem => 'Sistema ng Rekomendasyon';

  @override
  String get recommendationSystemSubtitle =>
      'Gamitin ang local-library na algorithm ng Moonfin Recommends o ang online na Similarity Metrics ng TMDb. Tandaan: Kailangan ng Seerr integration para sa mga online na rekomendasyon.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb Similarity';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Ilapat ang Limitasyon sa Parental Rating?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limitahan ang mga suhestiyon ng Moonfin Recommends ayon sa parental rating ng target na media';

  @override
  String get interfaceStyle => 'Istilo ng Interface';

  @override
  String get interfaceStyleSubtitle =>
      'Tumutugma ang Automatic sa iyong device. Pumili ng Apple o Material para piliting gamitin ang isang hitsura.';

  @override
  String get interfaceStyleAutomatic => 'Automatic';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Kalidad ng Glass';

  @override
  String get glassQualitySubtitle =>
      'Pinipili ng Auto ang pinakamahusay na glass effect para sa device na ito. Pinipilit ng Full ang tunay na blur; gumagamit ang Reduced ng magaan na glass na nakakatipid ng GPU power.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Reduced';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Lumipat sa pagitan ng Moonfin at Neon Pulse nang hindi nire-restart ang app';

  @override
  String get customThemeTitle => 'Custom na Theme';

  @override
  String get customThemeSubtitle =>
      'Binabago ng mga custom na theme ang mga visual na elemento sa buong Moonfin. Pumili ng isa sa mga opsyong ito para tumugma sa iyong istilo.';

  @override
  String get keyboardPreferSystemIme => 'Mas gusto ang keyboard ng system';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Gamitin ang paraan ng pag-input ng iyong device bilang default para sa pagpasok ng text';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Kasalukuyang hitsura ng Moonfin na nagustuhan mo';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave styling na may magenta glow, cyan text, at mas malakas na chrome contrast';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Liquid-glass na istilo na may gumagalaw na gradient na backdrop, mga frosted na surface, at Apple-blue na accent';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro na pixel-art na istilo na may makapal na palette, blocky na mga border, matitinding drop-shadow, at pixel font';

  @override
  String get embyConnectSignInSubtitle =>
      'Mag-sign in gamit ang iyong Emby Connect account';

  @override
  String get emailOrUsername => 'Email o Username';

  @override
  String get selectAServer => 'Pumili ng Server';

  @override
  String get tryAgain => 'Subukan Muli';

  @override
  String get noLinkedServers =>
      'Walang naka-link na server sa Emby Connect account na ito';

  @override
  String get invalidEmbyConnectCredentials =>
      'Di-wastong mga kredensyal ng Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Di-wastong username o password ng Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Hindi sinusuportahan ng server ang palitan ng Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Error sa network habang nakikipag-ugnayan sa Emby Connect o sa napiling server';

  @override
  String get loadingLinkedServers => 'Nilo-load ang mga naka-link na server...';

  @override
  String get connectingToServerEllipsis => 'Kumokonekta sa server...';

  @override
  String get noReachableAddress => 'Walang ibinigay na maabot na address';

  @override
  String get invalidServerExchangeResponse =>
      'Di-wastong tugon mula sa server exchange endpoint';

  @override
  String unableToConnectTo(String target) {
    return 'Hindi makakonekta sa $target';
  }

  @override
  String get exitApp => 'Lumabas sa Moonfin?';

  @override
  String get exitAppConfirmation => 'Sigurado ka bang gusto mong lumabas?';

  @override
  String get exit => 'Lumabas';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Naka-pause';

  @override
  String get gameSaveState => 'I-save ang state';

  @override
  String get games => 'Mga Laro';

  @override
  String get gameLoadState => 'I-load ang state';

  @override
  String get gameFastForward => 'Fast-forward';

  @override
  String get gameEmulatorSettings => 'Mga setting ng emulator';

  @override
  String get gameNoCoreOptions => 'Walang naaayos na opsyon ang core na ito.';

  @override
  String get gameHoldToOpenMenu => 'Pindutin nang matagal para buksan ang menu';

  @override
  String get gamePlaybackUnsupported =>
      'Hindi pa suportado ang paglalaro sa device na ito.';

  @override
  String get noHomeRowsLoaded => 'Walang mga home row ang ma-load';

  @override
  String get noHomeRowsHint =>
      'Subukang i-refresh o bawasan ang mga aktibong seksyon ng tahanan.';

  @override
  String get retryHomeRows => 'Subukan muli ang Home Rows';

  @override
  String get guide => 'Patnubay';

  @override
  String get recordings => 'Mga recording';

  @override
  String get schedule => 'Iskedyul';

  @override
  String get series => 'Serye';

  @override
  String get noItemsFound => 'Walang nakitang mga item';

  @override
  String get home => 'Home';

  @override
  String get browseAll => 'I-browse Lahat';

  @override
  String get genres => 'Mga genre';

  @override
  String get collectionPlaceholder => 'Lalabas dito ang mga item sa koleksyon';

  @override
  String get browseByLetter => 'Mag-browse sa pamamagitan ng Liham';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Ang alphabetical browse ay lalabas dito';

  @override
  String get suggestions => 'Mga mungkahi';

  @override
  String get suggestionsPlaceholder =>
      'Lalabas dito ang mga iminungkahing item';

  @override
  String get failedToLoadLibraries => 'Nabigong i-load ang mga library';

  @override
  String get noLibrariesFound => 'Walang nakitang mga aklatan';

  @override
  String get library => 'Library';

  @override
  String get displaySettings => 'Mga Setting ng Display';

  @override
  String get allGenres => 'Lahat ng Genre';

  @override
  String get noGenresFound => 'Walang nakitang genre';

  @override
  String failedToLoadFolderError(String error) {
    return 'Nabigong i-load ang folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Walang laman ang folder na ito';

  @override
  String itemCountLabel(int count) {
    return '$count aytem';
  }

  @override
  String get failedToLoadFavorites => 'Nabigong i-load ang mga paborito';

  @override
  String get retry => 'Subukan muli';

  @override
  String get noFavoritesYet => 'Wala pang paborito';

  @override
  String get favorites => 'Mga paborito';

  @override
  String totalCountItems(int count) {
    return '$count Mga Item';
  }

  @override
  String get continuing => 'nagpapatuloy';

  @override
  String get ended => 'Natapos na';

  @override
  String get sortAndFilter => 'Pagbukud-bukurin at Salain';

  @override
  String get type => 'Uri';

  @override
  String get sortBy => 'Pagbukud-bukurin Ayon';

  @override
  String get display => 'Pagpapakita';

  @override
  String get imageType => 'Uri ng Larawan';

  @override
  String get posterSize => 'Laki ng Poster';

  @override
  String get small => 'Maliit';

  @override
  String get medium => 'Katamtaman';

  @override
  String get large => 'Malaki';

  @override
  String get extraLarge => 'Napakalaki';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Mga Genre';
  }

  @override
  String get views => 'Mga view';

  @override
  String get albums => 'Mga album';

  @override
  String get albumArtists => 'Mga Artist ng Album';

  @override
  String get artists => 'Mga artist';

  @override
  String get bookmarks => 'Mga bookmark';

  @override
  String get noSavedBookmarks =>
      'Wala pang naka-save na bookmark para sa pamagat na ito.';

  @override
  String get openBook => 'Buksan ang Aklat';

  @override
  String get chapter => 'Kabanata';

  @override
  String get page => 'Pahina';

  @override
  String get bookmark => 'Bookmark';

  @override
  String get justNow => 'Ngayon lang';

  @override
  String minutesAgo(int count) {
    return '${count}m ang nakalipas';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ang nakalipas';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ang nakalipas';
  }

  @override
  String get discoverySubjects => 'Mga Paksa ng Pagtuklas';

  @override
  String get pickDiscoverySubjects =>
      'Piliin kung aling mga feed ng paksa ang ipapakita sa Discover.';

  @override
  String get apply => 'Ilapat';

  @override
  String get openLink => 'Buksan ang Link';

  @override
  String get scanWithYourPhone => 'I-scan gamit ang iyong telepono';

  @override
  String get audiobookGenres => 'Mga Genre ng Audiobook';

  @override
  String get pickAudiobookGenres =>
      'Piliin kung aling mga genre ang ipapakita sa Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Tumuklas ng Mga Audiobook';

  @override
  String get librivoxDescription =>
      'Mga sikat na pamagat ng pampublikong domain mula sa LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count mga pamagat';
  }

  @override
  String get scrollLeft => 'Mag-scroll pakaliwa';

  @override
  String get scrollRight => 'Mag-scroll pakanan';

  @override
  String get couldNotLoadGenre => 'Hindi ma-load ang genre na ito sa ngayon.';

  @override
  String get continueReading => 'Magpatuloy sa Pagbabasa';

  @override
  String get savedHighlights => 'Naka-save na Highlight';

  @override
  String get continueListening => 'Ipagpatuloy ang Pakikinig';

  @override
  String get listen => 'Makinig ka';

  @override
  String get resume => 'Ituloy';

  @override
  String get failedToLoadLibrary => 'Nabigong i-load ang library';

  @override
  String get popularNow => 'Sikat Ngayon';

  @override
  String get savedForLater => 'Nai-save Para Sa Ibang Pagkakataon';

  @override
  String get topListens => 'Mga Nangungunang Pakikinig';

  @override
  String get unreadDiscoveries => 'Mga Hindi pa nababasang Discoveries';

  @override
  String get pickUpAgain => 'Pick Up Muli';

  @override
  String get bookHighlightsDescription =>
      'Ang iyong mga aklat na may mga highlight, paborito, o progreso sa pagbabasa.';

  @override
  String get handPickedFromLibrary => 'Pinili mula sa iyong library.';

  @override
  String get handPickedFromListeningQueue =>
      'Pinili mula sa iyong queue sa pakikinig.';

  @override
  String get booksWithHighlights =>
      'Mga aklat na may mga highlight, paborito, o progreso sa pagbabasa.';

  @override
  String get jumpBackNarration =>
      'Bumalik sa pagsasalaysay nang hindi hinahanap ang iyong lugar.';

  @override
  String get unreadBooksReady =>
      'Ang mga hindi pa nababasang libro ay handa na para sa susunod na tahimik na oras.';

  @override
  String get quickAccessFavorites =>
      'Mabilis na pag-access sa mga aklat na patuloy mong binabalikan.';

  @override
  String get searchAudiobooks => 'Maghanap ng mga audiobook';

  @override
  String get searchYourLibrary => 'Hanapin ang iyong library';

  @override
  String get pickUpStory => 'Kunin ang kuwento kung saan ka tumigil';

  @override
  String get savedPlacesChapters =>
      'Ang iyong mga na-save na lugar at hindi natapos na mga kabanata';

  @override
  String authorsCount(int count) {
    return '$count mga may-akda';
  }

  @override
  String genresCount(int count) {
    return '$count mga genre';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% nakumpleto';
  }

  @override
  String get readyWhenYouAre => 'Handa kung kailan ka na';

  @override
  String get details => 'Mga Detalye';

  @override
  String get listeningRoom => 'Listening Room';

  @override
  String get bookmarksAndProgress => 'Mga Bookmark at Pag-unlad';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count mga pamagat na inayos para sa pagbabasa-unang pagba-browse.';
  }

  @override
  String get titles => 'Mga title';

  @override
  String get allTitles => 'Lahat ng Pamagat';

  @override
  String get authors => 'Mga may-akda';

  @override
  String get browseByAuthor => 'Mag-browse Ayon sa May-akda';

  @override
  String get browseByGenre => 'Mag-browse Ayon sa Genre';

  @override
  String get discover => 'Tuklasin';

  @override
  String get trendingTitlesOpenLibrary =>
      'Nagte-trend na mga pamagat ayon sa paksa mula sa Open Library.';

  @override
  String get noBookmarkedItems => 'Wala pang naka-bookmark na item';

  @override
  String get nothingMatchesSection =>
      'Wala pang tumutugma sa seksyong ito. Subukan ang isa pang tab o bumalik pagkatapos ng pag-sync ng library.';

  @override
  String get audiobooks => 'Mga Audiobook';

  @override
  String noLabelFound(String label) {
    return 'Walang nakitang $label';
  }

  @override
  String get folder => 'Folder';

  @override
  String get filters => 'Mga filter';

  @override
  String get readingStatus => 'Katayuan sa Pagbabasa';

  @override
  String get playedStatus => 'Naglaro na Katayuan';

  @override
  String get readStatus => 'Basahin';

  @override
  String get watched => 'Napanood na';

  @override
  String get unread => 'Hindi pa nababasa';

  @override
  String get unwatched => 'Hindi pa napanood';

  @override
  String get seriesStatus => 'Katayuan ng Serye';

  @override
  String get allLibraries => 'Lahat ng Aklatan';

  @override
  String get books => 'Mga libro';

  @override
  String get latestBooks => 'Mga Pinakabagong Aklat';

  @override
  String get latestAudiobooks => 'Mga Pinakabagong Audiobook';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na aklat',
      one: '1 aklat',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Aklat';

  @override
  String get bookFormatAudiobook => 'Audiobook';

  @override
  String bookPercentRead(int percent) {
    return '$percent% nabasa';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time na natitira';
  }

  @override
  String get bookHeroRead => 'Basahin';

  @override
  String get bookHeroListen => 'Pakinggan';

  @override
  String get author => 'May-akda';

  @override
  String get unknownAuthor => 'Hindi Kilalang May-akda';

  @override
  String get uncategorized => 'Hindi nakategorya';

  @override
  String get overview => 'Pangkalahatang-ideya';

  @override
  String get noLibrivoxDescription =>
      'Wala pang paglalarawan na ibinigay ng LibriVox para sa pamagat na ito.';

  @override
  String get readers => 'Mga mambabasa';

  @override
  String get openLinks => 'Buksan ang Mga Link';

  @override
  String get librivoxPage => 'Pahina ng LibriVox';

  @override
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'RSS Feed';

  @override
  String get downloadZip => 'I-download ang Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count mga seksyon';
  }

  @override
  String firstPublished(int year) {
    return 'Unang na-publish $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Wala pang available na pangkalahatang-ideya mula sa Open Library para sa pamagat na ito.';

  @override
  String get subjects => 'Mga paksa';

  @override
  String get all => 'Lahat';

  @override
  String booksCount(int count) {
    return '$count mga aklat';
  }

  @override
  String get couldNotLoadSubject => 'Hindi ma-load ang paksang ito sa ngayon.';

  @override
  String get audiobookDetails => 'Mga Detalye ng Audiobook';

  @override
  String authorsCountTitle(int count) {
    return '$count Mga May-akda';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na audiobook',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Listahan ng Track';

  @override
  String get itemListPlaceholder => 'Lalabas dito ang listahan ng item';

  @override
  String get failedToLoad => 'Nabigong mag-load';

  @override
  String get delete => 'I-delete';

  @override
  String get save => 'I-save';

  @override
  String get moreLikeThis => 'Higit pang Tulad nito';

  @override
  String get castAndCrew => 'Cast at Crew';

  @override
  String get collection => 'Koleksyon';

  @override
  String get episodes => 'Mga episode';

  @override
  String get nextUp => 'Next Up';

  @override
  String get seasons => 'Mga season';

  @override
  String get chapters => 'Mga kabanata';

  @override
  String get features => 'Mga tampok';

  @override
  String get movies => 'Mga pelikula';

  @override
  String get musicVideos => 'Mga Music Video';

  @override
  String get other => 'Iba pa';

  @override
  String get discography => 'Discography';

  @override
  String get similarArtists => 'Mga Katulad na Artista';

  @override
  String get tableOfContents => 'Talaan ng mga Nilalaman';

  @override
  String get tracklist => 'Tracklist';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Talambuhay';

  @override
  String get authorDetails => 'Mga Detalye ng May-akda';

  @override
  String get noOverviewAvailable =>
      'Wala pang available na pangkalahatang-ideya para sa pamagat na ito.';

  @override
  String get noBiographyAvailable =>
      'Walang available na talambuhay para sa may-akda na ito.';

  @override
  String get noBooksFound =>
      'Walang nakitang mga aklat para sa may-akda na ito.';

  @override
  String get unableToLoadAuthorDetails =>
      'Hindi ma-load ang mga detalye ng may-akda sa ngayon.';

  @override
  String published(int year) {
    return 'Nai-publish $year';
  }

  @override
  String get publicationDateUnknown => 'Hindi alam ang petsa ng publikasyon';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na Season',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Matatapos sa $time';
  }

  @override
  String get items => 'Mga Item';

  @override
  String get extras => 'Mga Extra';

  @override
  String get behindTheScenes => 'Behind the Scenes';

  @override
  String get deletedScenes => 'Mga Deleted Scene';

  @override
  String get featurettes => 'Mga Featurette';

  @override
  String get interviews => 'Mga Panayam';

  @override
  String get scenes => 'Mga Eksena';

  @override
  String get shorts => 'Mga Short';

  @override
  String get trailers => 'Mga trailer';

  @override
  String timeRemaining(String time) {
    return '$time na natitira';
  }

  @override
  String endsIn(String time) {
    return 'Matatapos sa $time';
  }

  @override
  String get view => 'Tingnan';

  @override
  String get resumeReading => 'Ipagpatuloy ang Pagbabasa';

  @override
  String get read => 'Basahin';

  @override
  String resumeFrom(String position) {
    return 'Ipagpatuloy mula sa $position';
  }

  @override
  String get play => 'I-play';

  @override
  String get startOver => 'Magsimulang Muli';

  @override
  String get restart => 'I-restart';

  @override
  String get readOffline => 'Magbasa Offline';

  @override
  String get playOffline => 'Maglaro ng Offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Mga subtitle';

  @override
  String get version => 'Bersyon';

  @override
  String get cast => 'I-cast';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Tapos na';

  @override
  String get favorited => 'Paborito';

  @override
  String get favorite => 'Paborito';

  @override
  String get playlist => 'Playlist';

  @override
  String get downloaded => 'Na-download';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'I-download Lahat';

  @override
  String get download => 'I-download';

  @override
  String get deleteDownloaded => 'Tanggalin ang Na-download';

  @override
  String get goToSeries => 'Pumunta sa Serye';

  @override
  String get editMetadata => 'I-edit ang Metadata';

  @override
  String get less => 'Mas kaunti';

  @override
  String get more => 'Higit pa';

  @override
  String get deleteItem => 'Tanggalin ang Item';

  @override
  String get deletePlaylist => 'Tanggalin ang Playlist';

  @override
  String get deletePlaylistMessage =>
      'Tanggalin ang playlist na ito mula sa server?';

  @override
  String get deleteItemMessage => 'Tanggalin ang item na ito mula sa server?';

  @override
  String get failedToDeletePlaylist => 'Nabigong tanggalin ang playlist';

  @override
  String get failedToDeleteItem => 'Nabigong tanggalin ang item';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Palitan ang pangalan ng Playlist';

  @override
  String get playlistName => 'Pangalan ng playlist';

  @override
  String get deleteDownloadedAlbum => 'Tanggalin ang Na-download na Album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Tanggalin ang mga na-download na track para sa \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted =>
      'Ang mga na-download na track ay tinanggal';

  @override
  String get downloadedTracksDeleteFailed =>
      'Hindi matanggal ang ilang na-download na track';

  @override
  String get noTracksLoaded => 'Walang na-load na mga track';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Walang na-load na $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Dina-download ang $title ($count aytem)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Sigurado ka bang gusto mong tanggalin ang \"$name\" mula sa server? Ang pagkilos na ito ay hindi maaaring i-undo.';
  }

  @override
  String get itemDeleted => 'Tinanggal ang item';

  @override
  String get noPlayableTrailerFound =>
      'Walang nahanap na puwedeng laruin na trailer.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Hindi sinusuportahang format ng aklat: .$extension';
  }

  @override
  String get audioTrack => 'Audio Track';

  @override
  String get subtitleTrack => 'Subtitle na Track';

  @override
  String get none => 'Wala';

  @override
  String get downloadSubtitlesLabel => 'Mag-download ng mga subtitle...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Maghanap gamit ang OpenSubtitles plugin';

  @override
  String get downloadSubtitles => 'Mag-download ng Mga Subtitle';

  @override
  String get selectedSubtitleInvalid => 'Ang napiling subtitle ay hindi wasto.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Na-download at napili ang subtitle: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Na-download ang subtitle. Maaaring tumagal ng ilang sandali upang lumitaw habang nire-refresh ng Jellyfin ang item.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Walang nakitang malayuang subtitle para sa $language.';
  }

  @override
  String get selectVersion => 'Piliin ang Bersyon';

  @override
  String versionNumber(int number) {
    return 'Bersyon $number';
  }

  @override
  String get downloadAllQuality => 'I-download Lahat — Kalidad';

  @override
  String get downloadQuality => 'Kalidad ng Pag-download';

  @override
  String get originalFileNoReencoding =>
      'Orihinal na file, walang muling pag-encode';

  @override
  String get originalFilesNoReencoding =>
      'Mga orihinal na file, walang muling pag-encode';

  @override
  String get noEpisodesLoaded => 'Walang na-load na mga episode';

  @override
  String downloadingItem(String name, String quality) {
    return 'Dina-download ang $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Tanggalin ang mga Na-download na File';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Tanggalin ang mga lokal na file para sa $typeLabel?\n\nIto ay magpapalaya ng espasyo sa imbakan. Maaari mong muling i-download sa ibang pagkakataon.';
  }

  @override
  String get downloadedFilesDeleted =>
      'Ang mga na-download na file ay tinanggal';

  @override
  String get failedToDeleteFiles => 'Nabigong tanggalin ang mga file';

  @override
  String get deleteFiles => 'Tanggalin ang mga File';

  @override
  String get director => 'DIREKTOR';

  @override
  String get directors => 'MGA DIREKTOR';

  @override
  String get writer => 'MANUNULAT';

  @override
  String get writers => 'MGA MANUNULAT';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count higit pa';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Mga Episode';
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
    return 'Kabanata $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na track',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na kabanata',
      one: '1 kabanata',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Ipinanganak $date';
  }

  @override
  String died(String date) {
    return 'Namatay $date';
  }

  @override
  String age(int age) {
    return 'Edad $age';
  }

  @override
  String get showLess => 'Magpakita ng Mas Kaunti';

  @override
  String get readMore => 'Magbasa pa';

  @override
  String get shuffle => 'I-shuffle';

  @override
  String get shuffleAllMusic => 'I-shuffle ang lahat ng musika';

  @override
  String get carSignInPrompt => 'Mag-sign in sa Moonfin sa iyong telepono';

  @override
  String get carServerUnreachable => 'Hindi maabot ang iyong server';

  @override
  String downloadsCount(int count) {
    return '$count mga pag-download';
  }

  @override
  String get perfectMatch => 'Perpektong tugma';

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
    return 'Ang malayuang subtitle na $action ay nangangailangan ng Jellyfin pahintulot sa pamamahala ng subtitle para sa user na ito.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Ang item na ito ay hindi mahanap sa server para sa malayuang subtitle $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Nabigo ang malayuang subtitle $action: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Nabigo ang remote subtitle $action (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nabigo sa $action mga malayuang subtitle.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'lahat ng na-download na episode para sa \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'lahat ng na-download na episode sa season na ito';

  @override
  String get stillWatching => 'Nanonood pa rin?';

  @override
  String get unableToLoadTrailerStream =>
      'Hindi ma-load ang stream ng trailer.';

  @override
  String get trailerTimedOut => 'Nag-time out ang trailer habang naglo-load.';

  @override
  String get playbackFailedForTrailer =>
      'Nabigo ang pag-playback para sa trailer na ito.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Hindi available ang pag-cast sa panahon ng offline na pag-playback.';

  @override
  String castActionFailed(String label, String error) {
    return '$label nabigo ang pagkilos: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nabigong itakda ang dami ng cast: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Mga kontrol';
  }

  @override
  String get deviceVolume => 'Dami ng Device';

  @override
  String get unavailable => 'Hindi magagamit';

  @override
  String get pause => 'I-pause';

  @override
  String get syncPosition => 'Posisyon ng Pag-sync';

  @override
  String stopCast(String label) {
    return 'Huminto $label';
  }

  @override
  String get queueIsEmpty => 'Walang laman ang pila';

  @override
  String trackNumber(int number) {
    return 'Subaybayan ang $number';
  }

  @override
  String get remotePlayback => 'Remote Playback';

  @override
  String get castingToGoogleCast => 'Nag-cast sa Google Cast';

  @override
  String get castingViaAirPlay => 'Pag-cast sa pamamagitan ng AirPlay';

  @override
  String get castingViaDlna => 'Pag-cast sa pamamagitan ng DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds segundo';
  }

  @override
  String get longPressToUnlock => 'Pindutin nang matagal upang i-unlock';

  @override
  String get off => 'Naka-off';

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
  String get bitrateOverride => 'Pag-override ng Bitrate';

  @override
  String get audioDelay => 'Pagkaantala ng Audio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Pagkaantala ng Subtitle';

  @override
  String get reset => 'I-reset';

  @override
  String get unknown => 'Hindi kilala';

  @override
  String get playbackInformation => 'Impormasyon sa Pag-playback';

  @override
  String get playback => 'Pag-playback';

  @override
  String get playMethod => 'Paraan ng Paglalaro';

  @override
  String get directPlay => 'Direktang Paglalaro';

  @override
  String get directStream => 'Direktang Stream';

  @override
  String get transcoding => 'Transcoding';

  @override
  String get transcodeReasons => 'Mga Dahilan ng Transcode';

  @override
  String get player => 'Player';

  @override
  String get container => 'Lalagyan';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Resolusyon';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Bitrate ng Video';

  @override
  String get track => 'Track';

  @override
  String get channels => 'Mga channel';

  @override
  String get audioBitrate => 'Audio Bitrate';

  @override
  String get sampleRate => 'Sample Rate';

  @override
  String get format => 'Format';

  @override
  String get external => 'Panlabas';

  @override
  String get embedded => 'Naka-embed';

  @override
  String castSessionError(String protocol) {
    return '$protocol error sa session';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nabigong i-load ang mga detalye ng libro: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Ang EPUB rendering in-app ay hindi pa available sa platform na ito.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ang format na ito (.$extension) ay hindi pa maaaring i-render in-app.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Hindi available ang naka-embed na pag-render ng dokumento sa platform na ito.';

  @override
  String get couldNotOpenExternalViewer =>
      'Hindi mabuksan ang panlabas na viewer.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nabigong buksan ang in-app reader: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Nai-save na ang bookmark sa $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Idinagdag ang bookmark: $label';
  }

  @override
  String get noBookmarksYet =>
      'Wala pang bookmark.\nI-tap ang icon ng bookmark habang nagbabasa para i-save ang iyong posisyon.';

  @override
  String get noTableOfContentsAvailable =>
      'Walang available na talaan ng nilalaman';

  @override
  String pageLabel(int number) {
    return 'Pahina $number';
  }

  @override
  String get position => 'Posisyon';

  @override
  String get bookReader => 'Book Reader';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% nabasa';
  }

  @override
  String get updating => 'Ina-update...';

  @override
  String get markUnread => 'Markahan na Hindi Nabasa';

  @override
  String get markAsRead => 'Markahan bilang Nabasa';

  @override
  String get reloadReader => 'I-reload ang Reader';

  @override
  String get noPagesFound => 'Walang nakitang pahina.';

  @override
  String get failedToDecodePageImage =>
      'Nabigong i-decode ang larawan ng pahina.';

  @override
  String resetZoom(String zoom) {
    return 'I-reset ang Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Isang Pahina';

  @override
  String get twoPageSpread => 'Dalawang-Pahina Spread';

  @override
  String get addBookmark => 'Magdagdag ng Bookmark';

  @override
  String get bookmarksEllipsis => 'Mga bookmark...';

  @override
  String get markedAsRead => 'Minarkahan bilang nabasa';

  @override
  String get markedAsUnread => 'Minarkahan bilang hindi pa nababasa';

  @override
  String failedToUpdateReadState(String error) {
    return 'Nabigong i-update ang read state: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Liwanag';

  @override
  String get themeDark => 'Tema: Madilim';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout =>
      'Baliktarin ang Mga Kulay (nakapirming layout)';

  @override
  String get invertColorsPdf => 'Baliktarin ang Mga Kulay (PDF)';

  @override
  String get preparingInAppReader => 'Inihahanda ang in-app reader...';

  @override
  String get pdfDataNotAvailable => 'Hindi available ang PDF data.';

  @override
  String get readerFallbackModeActive => 'Aktibo ang fallback mode ng reader';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Hindi maaaring i-host ng platform na ito ang naka-embed na document engine para sa $extension na mga file.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Gamitin ang Reload Reader pagkatapos lumipat sa isang sinusuportahang platform target (Android, iOS, macOS).';

  @override
  String get openExternally => 'Buksan ang Panlabas';

  @override
  String get noEpubChaptersFound => 'Walang nakitang mga kabanata sa EPUB.';

  @override
  String get readerNotReady => 'Hindi handa ang mambabasa.';

  @override
  String get seriesRecordings => 'Mga Pag-record ng Serye';

  @override
  String get now => 'Ngayon';

  @override
  String get sports => 'Palakasan';

  @override
  String get news => 'Balita';

  @override
  String get kids => 'Mga bata';

  @override
  String get premiere => 'Premiere';

  @override
  String get guideTimeline => 'Gabay sa Timeline';

  @override
  String failedToLoadGuide(String error) {
    return 'Nabigong i-load ang gabay: $error';
  }

  @override
  String get noChannelsFound => 'Walang nakitang mga channel';

  @override
  String get liveBadge => 'LIVE';

  @override
  String guideNextProgram(String time, String title) {
    return 'Susunod: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m na natitira';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h na natitira';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m na natitira';
  }

  @override
  String get movie => 'Pelikula';

  @override
  String get removedFromFavoriteChannels => 'Inalis sa mga paboritong channel';

  @override
  String get addedToFavoriteChannels => 'Idinagdag sa mga paboritong channel';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nabigong i-update ang paboritong channel';

  @override
  String get unfavoriteChannel => 'Hindi paboritong Channel';

  @override
  String get favoriteChannel => 'Paboritong Channel';

  @override
  String get record => 'I-record';

  @override
  String get cancelRecordingAction => 'Kanselahin ang Pagre-record';

  @override
  String get programSetToRecord => 'Nakatakdang i-record ang program';

  @override
  String get recordingCancelled => 'Kinansela ang pagre-record';

  @override
  String get unableToCreateRecording => 'Hindi makagawa ng recording';

  @override
  String get watch => 'Panoorin';

  @override
  String get close => 'Isara';

  @override
  String failedToPlayChannel(String name) {
    return 'Nabigong laruin ang $name';
  }

  @override
  String get failedToLoadRecordings => 'Nabigong i-load ang mga recording';

  @override
  String get scheduledInNext24Hours => 'Naka-iskedyul sa Susunod na 24 Oras';

  @override
  String get recentRecordings => 'Mga Kamakailang Pag-record';

  @override
  String get tvSeries => 'Serye sa TV';

  @override
  String get failedToLoadSchedule => 'Nabigong i-load ang iskedyul';

  @override
  String get noScheduledRecordings => 'Walang nakaiskedyul na pag-record';

  @override
  String get cancelRecording => 'Kanselahin ang Pagre-record?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Kanselahin ang nakaiskedyul na pag-record ng \"$name\"?';
  }

  @override
  String get no => 'Hindi';

  @override
  String get yesCancel => 'Oo, Kanselahin';

  @override
  String get failedToCancelRecording => 'Nabigong kanselahin ang pag-record';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nabigong i-load ang mga series recording';

  @override
  String get noSeriesRecordings => 'Walang mga pag-record ng serye';

  @override
  String get cancelSeriesRecording => 'Kanselahin ang Pagre-record ng Serye';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Kanselahin ang Pagre-record ng Serye?';

  @override
  String stopRecordingName(String name) {
    return 'Ihinto ang pagre-record ng \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nabigong kanselahin ang pag-record ng serye';

  @override
  String get searchThisLibrary => 'Hanapin ang library na ito...';

  @override
  String get searchEllipsis => 'Hanapin...';

  @override
  String noResultsForQuery(String query) {
    return 'Walang mga resulta para sa \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Nabigo ang paghahanap: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Uri ng Account ng Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokal';

  @override
  String get savedMedia => 'Naka-save na Media';

  @override
  String get tvShows => 'Mga Palabas sa TV';

  @override
  String get music => 'Musika';

  @override
  String get musicAlbums => 'Mga Album ng Musika';

  @override
  String get noMediaInFilter => 'Walang media sa filter na ito';

  @override
  String get noDownloadedMediaYet => 'Wala pang na-download na media';

  @override
  String get browseLibrary => 'Mag-browse sa Library';

  @override
  String get deleteDownload => 'Tanggalin ang Download';

  @override
  String removeItemAndFiles(String name) {
    return 'Alisin ang \"$name\" at ang mga file nito?';
  }

  @override
  String tracksCount(int count) {
    return '$count mga track';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'I-play ang Album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nabigong i-load ang album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Walang nakitang na-download na mga track para sa $name.';
  }

  @override
  String get season => 'Season';

  @override
  String get errorLoadingEpisodes => 'Error sa paglo-load ng mga episode';

  @override
  String get noDownloadedEpisodes => 'Walang na-download na mga episode';

  @override
  String get deleteEpisode => 'Tanggalin ang Episode';

  @override
  String removeName(String name) {
    return 'Alisin ang \"$name\"?';
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
  String get seriesNotFound => 'Hindi nakita ang serye';

  @override
  String get errorLoadingSeries => 'Error sa paglo-load ng serye';

  @override
  String get downloadedEpisodes => 'Mga Na-download na Episode';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Mga espesyal';

  @override
  String get deleteSeason => 'Tanggalin ang Season';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Tanggalin ang lahat ng na-download na episode sa $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na episode',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Pamamahala ng Imbakan';

  @override
  String get storageBreakdown => 'Breakdown ng Storage';

  @override
  String get downloadedItems => 'Mga Na-download na Item';

  @override
  String get storageLimit => 'Limitasyon sa Imbakan';

  @override
  String get noLimit => 'Walang limitasyon';

  @override
  String get deleteAllDownloads => 'Tanggalin ang Lahat ng Mga Download';

  @override
  String get deleteAllDownloadsWarning =>
      'Aalisin nito ang lahat ng na-download na media file at hindi na maa-undo.';

  @override
  String get deleteAll => 'Tanggalin Lahat';

  @override
  String get deleteSelected => 'Tanggalin ang Napili';

  @override
  String deleteSelectedCount(int count) {
    return 'Tanggalin ang $count na-download na mga item?';
  }

  @override
  String get musicAndAudiobooks => 'Musika at Audiobook';

  @override
  String get images => 'Mga imahe';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'ng $limit limitasyon';
  }

  @override
  String get settings => 'Mga setting';

  @override
  String get authentication => 'Authentication';

  @override
  String get autoLoginServerManagement => 'Auto login, pamamahala ng server';

  @override
  String get pinCode => 'PIN Code';

  @override
  String get setUpPinCodeProtection => 'I-set up ang proteksyon ng PIN code';

  @override
  String get parentalControls => 'Mga Kontrol ng Magulang';

  @override
  String get contentRatingRestrictions =>
      'Mga paghihigpit sa rating ng nilalaman';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, resolusyon, pag-uugali';

  @override
  String get languageSizeAppearance => 'Wika, laki, anyo';

  @override
  String get qualityStorage => 'Kalidad, imbakan';

  @override
  String get serverSyncAndPluginStatus =>
      'Pag-sync ng server at katayuan ng plugin';

  @override
  String get mediaRequestIntegration => 'Pagsasama ng kahilingan sa media';

  @override
  String get switchServer => 'Lumipat ng Server';

  @override
  String get signOut => 'Mag-sign Out';

  @override
  String get versionLicenses => 'Bersyon, mga lisensya';

  @override
  String get account => 'Account';

  @override
  String get signInAndSecurity => 'Pag-sign-in at seguridad';

  @override
  String get administration => 'Pangangasiwa';

  @override
  String get serverSettingsUsersLibraries =>
      'Mga setting ng server, user, library';

  @override
  String get customization => 'Pagpapasadya';

  @override
  String get themeAndLayout => 'Tema at layout';

  @override
  String get videoAndSubtitles => 'Video at mga subtitle';

  @override
  String get integrations => 'Mga pagsasama';

  @override
  String get pluginAndRequests => 'Plugin at mga kahilingan';

  @override
  String get customizeAccountPlaybackInterface =>
      'I-customize ang account, pag-playback, at gawi ng interface';

  @override
  String optionsCount(int count) {
    return '$count mga opsyon';
  }

  @override
  String get themeAndAppearance => 'Tema at Hitsura';

  @override
  String get focusBorderColor => 'Kulay ng Border ng Focus';

  @override
  String get watchedIndicators => 'Mga Napanood na Indicator';

  @override
  String get always => 'Laging';

  @override
  String get hideUnwatched => 'Itago ang Hindi Napanood';

  @override
  String get episodesOnly => 'Mga Episode Lang';

  @override
  String get never => 'Hindi kailanman';

  @override
  String get focusExpansionAnimation => 'Focus Expansion Animation';

  @override
  String get desktopUiScale => 'Scale ng Desktop UI';

  @override
  String get scaleFocusedCards =>
      'I-scale ang nakatutok o naka-hover na mga card at tile';

  @override
  String get backgroundBackdrops => 'Mga Background sa Background';

  @override
  String get showBackdropImages =>
      'Ipakita ang mga larawan sa backdrop sa likod ng nilalaman';

  @override
  String get seriesThumbnails => 'Mga Thumbnail ng Serye';

  @override
  String get seriesThumbnailsDescription =>
      'Mga episode lang: gumamit ng serye ng artwork na tumutugma sa bawat uri ng larawan ng row';

  @override
  String get homeRowInfoOverlay => 'Overlay ng Impormasyon ng Home Row';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Ipakita ang pamagat at metadata kapag nagba-browse ng mga home row';

  @override
  String get clockDisplay => 'Display ng Orasan';

  @override
  String get inMenus => 'Sa Mga Menu';

  @override
  String get inVideo => 'Sa Video';

  @override
  String get seasonalEffects => 'Pana-panahong Epekto';

  @override
  String get seasonalEffectsDescription =>
      'Mga visual effect at pana-panahong dekorasyon';

  @override
  String get snow => 'niyebe';

  @override
  String get fireworks => 'Mga paputok';

  @override
  String get confetti => 'Confetti';

  @override
  String get fallingLeaves => 'Nahuhulog na Dahon';

  @override
  String get themeMusic => 'Tema ng Musika';

  @override
  String get playThemeMusicOnDetailPages =>
      'Magpatugtog ng theme music sa mga page ng detalye';

  @override
  String get themeMusicVolume => 'Dami ng Musika ng Tema';

  @override
  String get themeMusicSettingsSubtitle =>
      'Mga detail page, home row, at volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Theme Music sa Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'I-play kapag nagba-browse sa home screen';

  @override
  String get loopThemeMusic => 'I-loop ang Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Ulitin ang track sa halip na patugtugin ito nang isang beses';

  @override
  String get detailsBackgroundBlur => 'Mga Detalye ng Background Blur';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Pag-browse sa Background Blur';

  @override
  String get maxStreamingBitrate => 'Max na Streaming Bitrate';

  @override
  String get maxResolution => 'Max na Resolusyon';

  @override
  String get playerZoomMode => 'Player Zoom Mode';

  @override
  String get settingsScrollWheelAction => 'Mouse scroll wheel';

  @override
  String get settingsScrollWheelActionDescription =>
      'Piliin kung ano ang ginagawa ng pag-scroll ng mouse wheel sa ibabaw ng video habang nagpe-playback.';

  @override
  String get scrollWheelActionOff => 'Naka-off';

  @override
  String get scrollWheelActionSeek => 'Seek (pasulong / paatras)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Angkop';

  @override
  String get autoCrop => 'Auto I-crop';

  @override
  String get stretch => 'Mag-stretch';

  @override
  String get refreshRateSwitching => 'Paglipat ng Rate ng Pag-refresh';

  @override
  String get disabled => 'Naka-disable';

  @override
  String get scaleOnTv => 'Scale sa TV';

  @override
  String get scaleOnDevice => 'Scale sa Device';

  @override
  String get trickPlay => 'Trick Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Ipakita ang mga thumbnail ng preview kapag naghahanap';

  @override
  String get showDescriptionOnPause => 'Ipakita ang Paglalarawan sa I-pause';

  @override
  String get dimVideoShowOverview =>
      'I-dim ang video at ipakita ang pangkalahatang-ideya ng teksto habang naka-pause';

  @override
  String get osdLockButton => 'OSD Lock Button';

  @override
  String get osdLockButtonDescription =>
      'Magpakita ng lock button na humaharang sa touch input hanggang sa matagal na pinindot';

  @override
  String get audioBehavior => 'Gawi sa Audio';

  @override
  String get downmixToStereo => 'I-downmix sa Stereo';

  @override
  String get defaultAudioLanguage => 'Default na Wika ng Audio';

  @override
  String get fallbackAudioLanguage => 'Fallback na Wika ng Audio';

  @override
  String get preferDefaultAudioTrack => 'Piliin ang Default na Audio Track';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Piliin ang orihinal na audio track kaysa sa localized na dub.';

  @override
  String get preferAudioDescription => 'Piliin ang Mga Audio Description Track';

  @override
  String get preferAudioDescriptionDescription =>
      'Piliin ang mga audio description track kaysa sa mga normal na track.';

  @override
  String get transcodingAudio => 'Transcoding (Audio)';

  @override
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcoding (Bitrate o Resolution)';

  @override
  String get transcodingVideoAndAudio => 'Transcoding (Video at Audio)';

  @override
  String get transcodingVideo => 'Transcoding (Video)';

  @override
  String get autoServerDefault => 'Auto (Default ng Server)';

  @override
  String get english => 'Ingles';

  @override
  String get spanish => 'Espanyol';

  @override
  String get french => 'Pranses';

  @override
  String get german => 'Aleman';

  @override
  String get italian => 'Italyano';

  @override
  String get portuguese => 'Portuges';

  @override
  String get japanese => 'Hapon';

  @override
  String get korean => 'Koreano';

  @override
  String get chinese => 'Intsik';

  @override
  String get russian => 'Ruso';

  @override
  String get arabic => 'Arabe';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Olandes';

  @override
  String get swedish => 'Suweko';

  @override
  String get norwegian => 'Norwego';

  @override
  String get danish => 'Danes';

  @override
  String get finnish => 'Finlandes';

  @override
  String get polish => 'Polako';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'Suporta sa TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio sa AVR lamang; nangangailangan ng suporta sa receiver at DTS source track';

  @override
  String get enableTrueHdAudio =>
      'Paganahin ang TrueHD audio (maaaring hindi gumana sa lahat ng platform)';

  @override
  String get settingsAudioOutputMode => 'Mode ng Audio Output';

  @override
  String get settingsAudioOutputModeDescription =>
      'Piliin kung paano ide-decode ang audio. Ipinapadala ng AVR Passthrough ang mga raw na Dolby/DTS stream sa iyong receiver; nagde-decode nang lokal ang Auto o Downmix.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Fallback na Audio Codec';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Piliin ang target na format para i-transcode ang multi-channel na audio kapag hindi maaaring direct-play o mapasa ang source stream.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Auto Detect\n(Inirerekomenda)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Default)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Lossless)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo Lang)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efficient)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Lossless)';

  @override
  String get settingsMaxAudioChannels => 'Max na Audio Channel';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'I-configure ang pinakamaraming channel ng iyong audio setup. Ang mga multichannel na stream na lumalampas sa limitasyong ito ay ida-downmix o ita-transcode.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Auto Detect\n(Default ng Hardware)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadraphonic';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Advanced)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'I-enable lang ang mga format na sinusuportahan ng iyong AVR o HDMI sink.';

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
      'Bitstream Dolby Digital Plus (EAC3) sa external decoder.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos sa EAC3 (JOC) sa external decoder.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (kasama ang DTS core) sa external decoder.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD na may metadata ng Atmos sa external decoder.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Natukoy na Mga Kakayahang Audio';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Wala pang available na snapshot ng kakayahan sa runtime.';

  @override
  String get settingsAudioRouteLabel => 'Ruta';

  @override
  String get settingsAudioDecodeLabel => 'Mag-decode';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD audio ruta';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Tagapagsalita';

  @override
  String get settingsAudioRouteHeadphones => 'Headphones';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Mga diagnostic';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Antas ng Video';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Saklaw ng Video';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Subtitle Codec';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Pinapayagan ang Audio Codecs';

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
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Aktibong Ruta ng Audio';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Suporta sa HD Audio ng Ruta';

  @override
  String get nightMode => 'Night Mode';

  @override
  String get compressDynamicRange => 'I-compress ang dynamic na hanay';

  @override
  String get advancedMpv => 'Advanced na mpv';

  @override
  String get enableCustomMpvConf => 'Paganahin ang Custom na mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Maglapat ng mpv.conf na tinukoy ng user bago magsimula ang pag-playback';

  @override
  String get unsafeAdvancedMpvOptions =>
      'Hindi Ligtas na Advanced na Mga Opsyon sa mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Payagan ang mas malawak na hanay ng mga opsyon sa mpv. Maaaring masira ang pag-uugali ng pag-playback.';

  @override
  String get hardwareDecoding => 'Pag-decode ng hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Maaaring mapabuti ang pagganap ngunit maaaring magdulot ng mga isyu sa pag-playback sa ilang device.';

  @override
  String get nextUpAndQueuing => 'Susunod at Pumila';

  @override
  String get nextUpDisplay => 'Susunod na Display';

  @override
  String get extended => 'Extended';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Next Up Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Pagpila ng Media';

  @override
  String get autoQueueNextEpisodes => 'Auto-queue sa mga susunod na episode';

  @override
  String get stillWatchingPrompt => 'Nanonood pa rin ng Prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Pagkatapos ng $episodes mga episode / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Ipagpatuloy at Laktawan';

  @override
  String get resumeRewind => 'Ipagpatuloy ang Rewind';

  @override
  String get unpauseRewind => 'I-unpause ang Rewind';

  @override
  String get fiveSeconds => '5 segundo';

  @override
  String get tenSeconds => '10 segundo';

  @override
  String get fifteenSeconds => '15 segundo';

  @override
  String get thirtySeconds => '30 segundo';

  @override
  String get skipBackLength => 'Laktawan Pabalik na Haba';

  @override
  String get skipForwardLength => 'Laktawan ang Pasulong na Haba';

  @override
  String get customMpvConfPath => 'Custom na mpv.conf Path';

  @override
  String get notSetMpvConf =>
      'Hindi nakatakda. Susubukan ng Moonfin ang isang default na mpv.conf sa mga folder ng app/data.';

  @override
  String get selectMpvConf => 'Piliin ang mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Nalalapat ang mga setting ng istilo (laki, kulay, offset) sa mga subtitle na nakabatay sa teksto (SRT, VTT, TTML). Gumagamit ang mga subtitle ng ASS/SSA ng sarili nilang naka-embed na istilo maliban kung naka-off ang \"ASS/SSA Direct Play.\" Ang mga subtitle ng bitmap (PGS, DVB, VobSub) ay hindi maaaring i-restyle.';

  @override
  String get defaultSubtitleLanguage => 'Default na Subtitle na Wika';

  @override
  String get defaultToNoSubtitles => 'Default sa Walang Subtitle';

  @override
  String get turnOffSubtitlesByDefault =>
      'I-off ang mga subtitle bilang default';

  @override
  String get subtitleSize => 'Laki ng Subtitle';

  @override
  String get textFillColor => 'Kulay ng Text Fill';

  @override
  String get backgroundColor => 'Kulay ng Background';

  @override
  String get textStrokeColor => 'Kulay ng Stroke ng Teksto';

  @override
  String get subtitleCustomization => 'Pag-customize ng Subtitle';

  @override
  String get subtitleCustomizationDescription =>
      'I-customize ang hitsura ng subtitle';

  @override
  String get subtitleMode => 'Subtitle Mode';

  @override
  String get subtitleModeFlagged => 'Flagged';

  @override
  String get subtitleModeAlways => 'Palagi';

  @override
  String get subtitleModeForeign => 'Dayuhan';

  @override
  String get subtitleModeForced => 'Forced';

  @override
  String get subtitleModeFlaggedDescription =>
      'Nagpe-play ng mga track na panloob na na-flag sa metadata ng media file bilang \"default\" o \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Awtomatikong nilo-load at ipinapakita ang mga subtitle sa tuwing magsisimula ang isang video.';

  @override
  String get subtitleModeForeignDescription =>
      'Awtomatikong ino-on ang mga subtitle kung ang default na audio track ay nasa wikang dayuhan.';

  @override
  String get subtitleModeForcedDescription =>
      'Nilo-load lang ang mga subtitle na tahasang na-tag ng forced na metadata flag.';

  @override
  String get subtitleModeNoneDescription =>
      'Ganap na hindi pinapagana ang awtomatikong pag-load ng subtitle.';

  @override
  String get fallbackSubtitleLanguage => 'Fallback na Wika ng Subtitle';

  @override
  String get subtitleStream => 'Subtitle Stream';

  @override
  String get subtitlePreviewText =>
      'Ang mabilis na brown fox ay tumalon sa ibabaw ng tamad na aso';

  @override
  String get verticalOffset => 'Vertical Offset';

  @override
  String get pgsDirectPlay => 'Direktang Paglalaro ng PGS';

  @override
  String get directPlayPgsSubtitles =>
      'Direktang paglalaro ng mga subtitle ng PGS';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles =>
      'Direktang paglalaro ng mga subtitle ng ASS/SSA';

  @override
  String get white => 'Puti';

  @override
  String get black => 'Itim';

  @override
  String get yellow => 'Dilaw';

  @override
  String get green => 'Berde';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Pula';

  @override
  String get transparent => 'Transparent';

  @override
  String get semiTransparentBlack => 'Itim na semi-transparent';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Mobile';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Na-load ang $profile mga setting ng profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nabigong i-load ang $profile mga setting ng profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Naka-sync na mga lokal na setting sa $profile profile.';
  }

  @override
  String get customizationProfile => 'Profile sa Pag-customize';

  @override
  String get customizationProfileDescription =>
      'Piliin ang profile na ilo-load, ie-edit, at isi-sync. Nalalapat ang pandaigdigan kahit saan maliban kung na-override ito ng profile ng device. Ang berdeng tuldok ay nagmamarka ng iyong kasalukuyang profile ng device.';

  @override
  String get loadProfile => 'I-load ang Profile';

  @override
  String get syncing => 'Sini-sync...';

  @override
  String get syncToProfile => 'I-sync Sa Profile';

  @override
  String get profileSyncHidden => 'Nakatago ang Profile Sync';

  @override
  String get enablePluginSyncDescription =>
      'Paganahin ang Server Plugin Sync sa mga setting ng Plugin upang ipakita ang mga kontrol sa profile dito.';

  @override
  String get quality => 'Kalidad';

  @override
  String get defaultDownloadQuality => 'Default na Kalidad ng Pag-download';

  @override
  String get network => 'Network';

  @override
  String get wifiOnlyDownloads => 'Mga Download sa WiFi Lang';

  @override
  String get reportDownloadsActivity => 'Ipakita ang mga download sa server';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Hayaang makita ng admin ng server ang iyong mga transcoded na download sa dashboard';

  @override
  String get onlyDownloadOnWifi =>
      'I-download lamang kapag nakakonekta sa WiFi';

  @override
  String get storage => 'Imbakan';

  @override
  String get storageUsed => 'Imbakan na Ginamit';

  @override
  String get manage => 'Pamahalaan';

  @override
  String get calculating => 'Kinakalkula...';

  @override
  String get downloadLocation => 'I-download ang Lokasyon';

  @override
  String get defaultLabel => 'Default';

  @override
  String get saveToDownloadsFolder => 'I-save sa folder ng Mga Download';

  @override
  String get downloadsVisibleToOtherApps =>
      'Mga Download/Moonfin — nakikita ng ibang mga app';

  @override
  String get dangerZone => 'Danger Zone';

  @override
  String get clearAllDownloads => 'I-clear ang Lahat ng Mga Download';

  @override
  String get original => 'Orihinal';

  @override
  String get changeDownloadLocation => 'Baguhin ang Lokasyon ng Pag-download';

  @override
  String get changeDownloadLocationDescription =>
      'Ang mga bagong download ay ise-save sa napiling folder. Ang mga kasalukuyang pag-download ay mananatili sa kanilang kasalukuyang lokasyon at maaaring pamahalaan mula sa mga setting ng Storage.';

  @override
  String get confirm => 'Kumpirmahin';

  @override
  String get cannotWriteToFolder =>
      'Hindi magsulat sa napiling folder. Mangyaring pumili ng ibang lokasyon o magbigay ng mga pahintulot sa storage.';

  @override
  String get saveToDownloadsFolderQuestion => 'I-save sa folder ng Downloads?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Ise-save ang na-download na media sa Downloads/Moonfin sa iyong device. Ang mga file na ito ay makikita ng ibang mga app gaya ng iyong gallery o music player.\n\nAng mga kasalukuyang pag-download ay mananatili sa kanilang kasalukuyang lokasyon.';

  @override
  String get enable => 'Paganahin';

  @override
  String get clearAllDownloadsWarning =>
      'Tatanggalin nito ang lahat ng na-download na media at hindi na maa-undo.';

  @override
  String get clearAll => 'I-clear ang Lahat';

  @override
  String get navigationStyle => 'Estilo ng Nabigasyon';

  @override
  String get topBar => 'Nangungunang Bar';

  @override
  String get leftSidebar => 'Kaliwang Sidebar';

  @override
  String get showShuffleButton => 'Ipakita ang Shuffle Button';

  @override
  String get showGenresButton => 'Button ng Ipakita ang Mga Genre';

  @override
  String get showFavoritesButton => 'Button ng Ipakita ang Mga Paborito';

  @override
  String get showLibrariesInToolbar => 'Ipakita ang Mga Aklatan sa Toolbar';

  @override
  String get navbarAlwaysExpanded =>
      'Palaging I-expand ang Mga Label ng Navbar';

  @override
  String get showSeerrButton => 'Ipakita ang Seerr Button';

  @override
  String get navbarOpacity => 'Opacity ng Navbar';

  @override
  String get navbarColor => 'Kulay ng Navbar';

  @override
  String get gray => 'Gray';

  @override
  String get darkBlue => 'Madilim na Asul';

  @override
  String get purple => 'Lila';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'Navy';

  @override
  String get charcoal => 'Uling';

  @override
  String get brown => 'kayumanggi';

  @override
  String get darkRed => 'Madilim na Pula';

  @override
  String get darkGreen => 'Madilim na Berde';

  @override
  String get slate => 'slate';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Pagpapakita ng Aklatan';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Thumbnail';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings =>
      'I-override ang Mga Setting ng Per-Library';

  @override
  String get applyImageTypeToAllLibraries =>
      'Ilapat ang uri ng larawan sa lahat ng library';

  @override
  String get multiServerLibraries => 'Mga Aklatan ng Multi-Server';

  @override
  String get showLibrariesFromAllServers =>
      'Ipakita ang mga aklatan mula sa lahat ng konektadong server';

  @override
  String get enableFolderView => 'Paganahin ang Folder View';

  @override
  String get showFolderBrowsingOption =>
      'Ipakita ang opsyon sa pagba-browse ng folder';

  @override
  String get groupItemsIntoCollections =>
      'Pagsama-samahin ang Mga Item sa Mga Collection';

  @override
  String get hideCollectionAssociatedItems =>
      'Itago ang mga library item na kaugnay ng Collection kapag nagba-browse ng mga library';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Paunawa sa Paggrupo ng Library';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Para gamitin ang setting na ito, pakisiguro na naka-enable ang mga Library setting na \"Group movies into collections\" at/o \"Group shows into collections\" sa ilalim ng Display setting ng iyong library sa iyong Jellyfin o Emby server.';

  @override
  String get libraryVisibility => 'Visibility ng Library';

  @override
  String get libraryVisibilityDescription =>
      'I-toggle ang visibility ng home page sa bawat library. I-restart ang Moonfin para magkabisa ang mga pagbabago.';

  @override
  String get showInNavigation => 'Ipakita sa nabigasyon';

  @override
  String get showInLatestMedia => 'Ipakita sa pinakabagong media';

  @override
  String get sourceLibraries => 'Pinagmulan ng mga Aklatan';

  @override
  String get sourceCollections => 'Mga Source Collection';

  @override
  String get excludedGenres => 'Mga Ibinukod na Genre';

  @override
  String get externalMedia => 'External Media';

  @override
  String get selectAll => 'Piliin ang Lahat';

  @override
  String itemsSelected(int count) {
    return '$count napili';
  }

  @override
  String get mediaBar => 'Media Bar';

  @override
  String get mediaSources => 'Mga Pinagmumulan ng Media';

  @override
  String get behavior => 'Pag-uugali';

  @override
  String get seconds => 'segundo';

  @override
  String get localPreviews => 'Mga Lokal na Preview';

  @override
  String get localPreviewsDescription =>
      'I-configure ang mga preview ng trailer, media, at audio.';

  @override
  String get mediaBarMode => 'Estilo ng Media Bar';

  @override
  String get mediaBarModeDescription =>
      'Pumili sa pagitan ng Moonfin, MakD, o i-off ang media bar';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Naka-off';

  @override
  String get enableMediaBar => 'Paganahin ang Media Bar';

  @override
  String get showFeaturedContentSlideshow =>
      'Ipakita ang itinatampok na slideshow ng nilalaman sa bahay';

  @override
  String get contentType => 'Uri ng Nilalaman';

  @override
  String get moviesAndTvShows => 'Mga Pelikula at Palabas sa TV';

  @override
  String get moviesOnly => 'Mga Pelikula Lamang';

  @override
  String get tvShowsOnly => 'Mga Palabas sa TV Lamang';

  @override
  String get itemCount => 'Bilang ng Item';

  @override
  String get noneSelected => 'Walang napili';

  @override
  String get noneExcluded => 'Walang ibinukod';

  @override
  String get autoAdvance => 'Auto Advance';

  @override
  String get autoAdvanceSlides => 'Awtomatikong sumulong sa susunod na slide';

  @override
  String get autoAdvanceInterval => 'Interval ng Auto Advance';

  @override
  String get trailerPreview => 'Preview ng Trailer';

  @override
  String get autoPlayTrailers =>
      'I-auto-play ang mga trailer sa media bar pagkatapos ng 3 segundo';

  @override
  String get trailerAudio => 'Audio ng Trailer';

  @override
  String get enableTrailerAudio =>
      'I-enable ang audio para sa mga trailer sa media bar';

  @override
  String get episodePreview => 'Preview ng Episode';

  @override
  String get mediaPreview => 'Preview ng Media';

  @override
  String get episodePreviewDescription =>
      'Magpatugtog ng 30 segundong inline na preview sa mga nakatutok, naka-hover, o matagal na pinindot na mga card';

  @override
  String get mediaPreviewDescription =>
      'Magpatugtog ng 30 segundong inline na preview sa mga nakatutok, naka-hover, o matagal na pinindot na mga card';

  @override
  String get previewAudio => 'I-preview ang Audio';

  @override
  String get enablePreviewAudio =>
      'Paganahin ang audio para sa mga preview ng trailer at episode';

  @override
  String get latestMedia => 'Pinakabagong Media';

  @override
  String get recentlyReleased => 'Kamakailang Inilabas';

  @override
  String get myMedia => 'Aking Media';

  @override
  String get myMediaSmall => 'Aking Media (Maliit)';

  @override
  String get continueWatching => 'Magpatuloy sa Panonood';

  @override
  String get resumeAudio => 'Ipagpatuloy ang Audio';

  @override
  String get resumeBooks => 'Ipagpatuloy ang Mga Aklat';

  @override
  String get activeRecordings => 'Mga Aktibong Recording';

  @override
  String get playlists => 'Mga playlist';

  @override
  String get liveTV => 'Live na TV';

  @override
  String get homeSections => 'Mga Seksyon ng Tahanan';

  @override
  String get resetToDefaults => 'I-reset sa mga default';

  @override
  String get homeRowPosterSize => 'Laki ng Poster ng Home Row';

  @override
  String get perRowImageTypeSelection =>
      'Pagpili ng Uri ng Larawan sa Bawat Hilera';

  @override
  String get configureImageTypeForEachRow =>
      'I-configure ang uri ng larawan para sa bawat pinaganang home row';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Pagsamahin ang Magpatuloy sa Panonood at Susunod';

  @override
  String get combineBothRows =>
      'Pagsamahin ang parehong mga hilera sa isang solong seksyon ng tahanan';

  @override
  String get fullScreenRows => 'Mga Naka-expand na Home Row';

  @override
  String get fullScreenRowsDescription =>
      'Limitahan ang mga home row sa 1 row bawat screen';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Uri ng Larawan sa Bawat Hilera';

  @override
  String get perRowSettings => 'Mga Setting ng Bawat Hanay';

  @override
  String get autoLogin => 'Auto Login';

  @override
  String get lastUser => 'Huling Gumagamit';

  @override
  String get currentUser => 'Kasalukuyang User';

  @override
  String get alwaysAuthenticate => 'Palaging Authenticate';

  @override
  String get requirePasswordWithToken =>
      'Mangailangan ng password kahit na may nakaimbak na token';

  @override
  String get confirmExit => 'Kumpirmahin ang Paglabas';

  @override
  String get showConfirmationBeforeExiting =>
      'Ipakita ang kumpirmasyon bago lumabas';

  @override
  String get blockContentWithRatings =>
      'I-block ang content na may mga sumusunod na rating:';

  @override
  String get noContentRatingsFound =>
      'Wala pang nakitang content rating sa server na ito.';

  @override
  String get couldNotLoadServerRatings =>
      'Hindi ma-load ang mga rating ng server. Ipinapakita lamang ang mga naka-save na rating.';

  @override
  String get couldNotRefreshRatings =>
      'Hindi ma-refresh ang mga rating mula sa server. Ipinapakita ang mga naka-save na rating.';

  @override
  String get enablePinCode => 'Paganahin ang PIN Code';

  @override
  String get requirePinToAccess =>
      'Nangangailangan ng PIN upang ma-access ang iyong account';

  @override
  String get changePin => 'Baguhin ang PIN';

  @override
  String get setNewPinCode => 'Magtakda ng bagong PIN code';

  @override
  String get removePin => 'Alisin ang PIN';

  @override
  String get removePinProtection => 'Alisin ang proteksyon ng PIN code';

  @override
  String get screensaver => 'Screensaver';

  @override
  String get inAppScreensaver => 'In-App na Screensaver';

  @override
  String get enableBuiltInScreensaver =>
      'Paganahin ang built-in na screensaver';

  @override
  String get mode => 'Mode';

  @override
  String get libraryArt => 'Sining sa Aklatan';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'orasan';

  @override
  String get timeout => 'Timeout';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Antas ng Pagdidilim';

  @override
  String get maxAgeRating => 'Max Rating ng Edad';

  @override
  String get any => 'Anuman';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Nangangailangan ng Edad Rating';

  @override
  String get onlyShowRatedContent => 'Ipakita lamang ang na-rate na nilalaman';

  @override
  String get showClock => 'Ipakita ang Orasan';

  @override
  String get displayClockDuringScreensaver =>
      'Ipakita ang orasan sa panahon ng screensaver';

  @override
  String get clockModeStatic => 'Static';

  @override
  String get clockModeBouncing => 'Bouncing';

  @override
  String get rottenTomatoesCritics => 'Mga Bulok na Kamatis (Mga Kritiko)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Audience)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (User)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Rating ng Komunidad';

  @override
  String get ratings => 'Mga rating';

  @override
  String get additionalRatings => 'Mga Karagdagang Rating';

  @override
  String get showMdbListAndTmdbRatings =>
      'Ipakita ang mga rating ng MDBList at TMDB';

  @override
  String get ratingLabels => 'Mga Label ng Rating';

  @override
  String get showLabelsNextToIcons =>
      'Ipakita ang mga label sa tabi ng mga icon ng rating';

  @override
  String get ratingBadges => 'Mga Badge ng Rating';

  @override
  String get showDecorativeBadges =>
      'Ipakita ang mga pandekorasyon na badge sa likod ng mga rating';

  @override
  String get episodeRatings => 'Mga Rating ng Episode';

  @override
  String get showRatingsOnEpisodes =>
      'Ipakita ang mga rating sa mga indibidwal na episode';

  @override
  String get ratingSources => 'Mga Pinagmumulan ng Rating';

  @override
  String get ratingSourcesDescription =>
      'I-enable at muling isaayos ang mga source ng rating na ipinapakita sa buong app';

  @override
  String get pluginLabel => 'Moonbase Plugin';

  @override
  String get pluginDetected => 'Natukoy ang Plugin';

  @override
  String get pluginNotDetected => 'Hindi Natukoy ang Plugin';

  @override
  String get pluginDetectedDescription =>
      'Natukoy ang plugin ng server. Awtomatikong pinapagana ang pag-sync sa unang pagkakataon na matagpuan ang plugin.';

  @override
  String get pluginNotDetectedDescription =>
      'Kasalukuyang hindi natukoy ang plugin ng server. Ginagamit pa rin ng mga lokal na setting ang kanilang mga naka-save na halaga o mga built-in na default.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nBersyon: $version';
  }

  @override
  String get availableServices => 'Mga Magagamit na Serbisyo';

  @override
  String get serverPluginSync => 'Pag-sync ng Plugin ng Server';

  @override
  String get syncSettingsWithPlugin =>
      'I-sync ang mga setting gamit ang server plugin';

  @override
  String get whatSyncControls => 'Ano ang kinokontrol ng pag-sync';

  @override
  String get syncControlsDescription =>
      'Kinokontrol lang ng pag-sync kung ang mga setting na naka-backup sa plugin ay itutulak at kukunin mula sa server. Ang pagpili ng profile at mga pagkilos sa pag-sync ng profile ay nasa mga setting ng Pag-customize kapag pinagana ang pag-sync ng plugin.';

  @override
  String get recentRequests => 'Mga Kamakailang Kahilingan';

  @override
  String get recentlyAdded => 'Kamakailang Idinagdag';

  @override
  String get trending => 'Trending';

  @override
  String get popularMovies => 'Mga Sikat na Pelikula';

  @override
  String get movieGenres => 'Mga Genre ng Pelikula';

  @override
  String get upcomingMovies => 'Mga Paparating na Pelikula';

  @override
  String get studios => 'Mga studio';

  @override
  String get popularSeries => 'Sikat na Serye';

  @override
  String get seriesGenres => 'Mga Genre ng Serye';

  @override
  String get upcomingSeries => 'Paparating na Serye';

  @override
  String get networks => 'Mga network';

  @override
  String get seerrDiscoveryRows => 'Mga Seerr Discovery Row';

  @override
  String get resetRowsToDefaults => 'I-reset ang mga hilera sa mga default';

  @override
  String get enableSeerr => 'Paganahin ang Seerr';

  @override
  String get showSeerrInNavigation =>
      'Ipakita ang Seerr sa nabigasyon (nangangailangan ng plugin ng server)';

  @override
  String get seerrUnavailable =>
      'Hindi available dahil naka-disable ang server plugin Seerr support.';

  @override
  String get nsfwFilter => 'Filter ng NSFW';

  @override
  String get hideAdultContent =>
      'Itago ang nilalamang pang-adulto sa mga resulta';

  @override
  String get seerrNotificationsSection => 'Mga Notification';

  @override
  String get seerrNotifyNewRequestsTitle =>
      'Mga notification ng bagong request';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Abisuhan ako kapag may nagsumite ng request';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Mga update sa request';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Naaprubahan, natanggihan, at naidagdag sa iyong library';

  @override
  String get seerrNotifyIssuesTitle => 'Mga update sa issue';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Mga bagong issue, tugon, at resolusyon';

  @override
  String loggedInAs(String username) {
    return 'Naka-log in bilang: $username';
  }

  @override
  String get discoverRows => 'Seerr Discovery Page';

  @override
  String get discoverRowsDescriptionPlugin =>
      'I-enable ang mga row na makikita sa mainpage ng Seerr. I-drag para baguhin ang pagkakasunod-sunod. Nagsi-sync ang custom na order sa Moonbase.';

  @override
  String get discoverRowsDescription =>
      'I-enable ang mga row na makikita sa mainpage ng Seerr. I-drag para baguhin ang pagkakasunod-sunod. Nagsi-sync ang custom na order sa Moonbase.';

  @override
  String get enabled => 'Naka-enable';

  @override
  String get hidden => 'Nakatago';

  @override
  String get aboutTitle => 'Tungkol sa';

  @override
  String versionValue(String version) {
    return 'Bersyon $version';
  }

  @override
  String get openSourceLicenses => 'Mga Lisensya sa Open Source';

  @override
  String get sourceCode => 'Source Code';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Tingnan ang Mga Update Ngayon';

  @override
  String get checksLatestDesktopRelease =>
      'Sinusuri ang pinakabagong release sa desktop para sa platform na ito';

  @override
  String get youAreUpToDate => 'Ikaw ay napapanahon.';

  @override
  String get couldNotCheckForUpdates =>
      'Hindi masuri ang mga update sa ngayon.';

  @override
  String get noCompatibleUpdate =>
      'Walang nakitang compatible na update package para sa platform na ito.';

  @override
  String get updateChecksNotSupported =>
      'Ang mga pagsusuri sa pag-update ay hindi suportado sa platform na ito.';

  @override
  String get updateNotificationsDisabled =>
      'Naka-disable ang mga notification sa pag-update.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Mangyaring maghintay bago suriin muli.';

  @override
  String get latestUpdateAlreadyShown =>
      'Ang pinakabagong update ay naipakita na.';

  @override
  String get updateAvailable => 'Available ang update.';

  @override
  String updateAvailableVersion(String version) {
    return 'May available na update: v$version';
  }

  @override
  String get updateNotifications => 'I-update ang Mga Notification';

  @override
  String get showWhenUpdatesAvailable =>
      'Ipakita kapag available ang mga update';

  @override
  String updateAvailableTitle(String version) {
    return 'Available na ang v$version';
  }

  @override
  String get readReleaseNotes => 'Basahin ang Mga Tala sa Paglabas';

  @override
  String get downloadingUpdate => 'Dina-download ang update...';

  @override
  String get updateDownloadFailed =>
      'Nabigo ang pag-download sa pag-update. Pakisubukang muli.';

  @override
  String get openReleasesPage => 'Buksan ang Pahina ng Mga Pagpapalabas';

  @override
  String get navigation => 'Pag-navigate';

  @override
  String get watchedIndicatorsBackdrops =>
      'Mga napanood na indicator, backdrop';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Kulay ng focus, mga napanood na indicator, mga backdrop';

  @override
  String get navbarStyleToolbarAppearance =>
      'Estilo ng Navbar, mga pindutan ng toolbar, hitsura';

  @override
  String get reorderToggleHomeRows =>
      'Muling ayusin at i-toggle ang mga home row';

  @override
  String get featuredContentAppearance => 'Itinatampok na nilalaman, hitsura';

  @override
  String get posterSizeImageTypeFolderView =>
      'Laki ng poster, uri ng larawan, view ng folder';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB, at mga mapagkukunan ng rating';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limitasyon ng image cache';

  @override
  String get clearImageCache => 'I-clear ang image cache';

  @override
  String get imageCacheCleared => 'Na-clear ang image cache';

  @override
  String get clear => 'I-clear';

  @override
  String get browse => 'Mag-browse';

  @override
  String get noResults => 'Walang resulta';

  @override
  String get seerrAvailableStatus => 'Available';

  @override
  String get seerrRequestedStatus => 'Hiniling';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Nagda-download · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Nag-i-import';

  @override
  String itemsCount(int count) {
    return '$count na Item';
  }

  @override
  String get seerrSettings => 'Mga Setting ng Seerr';

  @override
  String get requestMore => 'Humiling ng Higit Pa';

  @override
  String get request => 'Kahilingan';

  @override
  String get cancelRequest => 'Kanselahin ang Kahilingan';

  @override
  String get playInMoonfin => 'Maglaro sa Moonfin';

  @override
  String requestedByName(String name) {
    return 'Hiniling ni $name';
  }

  @override
  String get approve => 'Aprubahan';

  @override
  String get declineAction => 'Tanggihan';

  @override
  String get similar => 'Katulad';

  @override
  String get recommendations => 'Mga rekomendasyon';

  @override
  String cancelRequestForTitle(String title) {
    return 'Kanselahin ang request para sa \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Kanselahin ang $count na request para sa \"$title\"?';
  }

  @override
  String get keep => 'Panatilihin';

  @override
  String get itemNotFoundInLibrary =>
      'Hindi nakita ang item sa iyong Moonfin library';

  @override
  String get errorSearchingLibrary => 'Error sa paghahanap sa library';

  @override
  String budgetAmount(String amount) {
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Kita: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Mag-request ng $type';
  }

  @override
  String get submitRequest => 'Isumite ang Kahilingan';

  @override
  String get allSeasons => 'Lahat ng Panahon';

  @override
  String get advancedOptions => 'Mga Advanced na Opsyon';

  @override
  String get noServiceServersConfigured =>
      'Walang mga server ng serbisyo na na-configure';

  @override
  String get server => 'server';

  @override
  String get qualityProfile => 'Profile ng Kalidad';

  @override
  String get rootFolder => 'Root Folder';

  @override
  String get showMore => 'Ipakita ang Higit Pa';

  @override
  String get appearances => 'Mga appearance';

  @override
  String get crewSection => 'Crew';

  @override
  String ageValue(int age) {
    return 'edad $age';
  }

  @override
  String get noRequests => 'Walang mga kahilingan';

  @override
  String get pendingStatus => 'Nakabinbin';

  @override
  String get declinedStatus => 'Tinanggihan';

  @override
  String get partiallyAvailable => 'Bahagyang Magagamit';

  @override
  String get downloadingStatus => 'Nagda-download';

  @override
  String get approvedStatus => 'Naaprubahan';

  @override
  String get notRequestedStatus => 'Hindi Hiniling';

  @override
  String get blocklistedStatus => 'Naka-blocklist';

  @override
  String get deletedStatus => 'Tinanggal';

  @override
  String get failedStatus => 'Nabigo';

  @override
  String get processingStatus => 'Pinoproseso';

  @override
  String modifiedByName(String name) {
    return 'Binago ni $name';
  }

  @override
  String get completedStatus => 'Nakumpleto';

  @override
  String get requestErrorDuplicate => 'Na-request na ang title na ito';

  @override
  String get requestErrorQuota => 'Naabot na ang limitasyon ng request';

  @override
  String get requestErrorBlocklisted => 'Naka-blocklist ang title na ito';

  @override
  String get requestErrorNoSeasons =>
      'Wala nang natitirang season na i-request';

  @override
  String get requestErrorPermission =>
      'Wala kang pahintulot na gawin ang request na ito';

  @override
  String get seerrRequestsTitle => 'Mga Request';

  @override
  String get seerrIssuesTitle => 'Mga Issue';

  @override
  String get sortNewest => 'Pinakabago';

  @override
  String get sortLastModified => 'Huling Binago';

  @override
  String get noIssues => 'Walang issue';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining sa $limit na movie request ang natitira';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining sa $limit na season request ang natitira';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Bahagi ng $name';
  }

  @override
  String get viewCollection => 'Tingnan ang Collection';

  @override
  String get requestCollection => 'I-request ang Collection';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total na pelikula · $available available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Mag-request ng $count na pelikula';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Nire-request ang $current sa $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Na-request ang $count na pelikula';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Na-request ang $ok sa $total na pelikula';
  }

  @override
  String get collectionAllRequested =>
      'Available na o na-request na ang lahat ng pelikula';

  @override
  String get reportIssue => 'Mag-ulat ng Issue';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Ano ang mali?';

  @override
  String get allEpisodes => 'Lahat ng Episode';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Bukas';

  @override
  String get resolvedStatus => 'Naresolba';

  @override
  String get resolveAction => 'Iresolba';

  @override
  String get reopenAction => 'Buksang muli';

  @override
  String reportedByName(String name) {
    return 'Iniulat ni $name';
  }

  @override
  String commentsCount(int count) {
    return '$count na komento';
  }

  @override
  String get addComment => 'Magdagdag ng komento';

  @override
  String get deleteIssueConfirm => 'Tanggalin ang issue na ito?';

  @override
  String get submitReport => 'Isumite ang Ulat';

  @override
  String get tmdbScore => 'TMDB Score';

  @override
  String get releaseDateLabel => 'Petsa ng Paglabas';

  @override
  String get firstAirDateLabel => 'Unang Air Date';

  @override
  String get revenueLabel => 'Kita';

  @override
  String get runtimeLabel => 'Runtime';

  @override
  String get budgetLabel => 'Badyet';

  @override
  String get originalLanguageLabel => 'Orihinal na Wika';

  @override
  String get seasonsLabel => 'Mga season';

  @override
  String get episodesLabel => 'Mga episode';

  @override
  String get access => 'Access';

  @override
  String get add => 'Idagdag';

  @override
  String get address => 'Address';

  @override
  String get analytics => 'Analytics';

  @override
  String get catalog => 'Catalog';

  @override
  String get content => 'Nilalaman';

  @override
  String get copy => 'Kopyahin';

  @override
  String get create => 'Lumikha';

  @override
  String get disable => 'Huwag paganahin';

  @override
  String get done => 'Tapos na';

  @override
  String get edit => 'I-edit';

  @override
  String get encoding => 'Encoding';

  @override
  String get error => 'Error';

  @override
  String get forward => 'I-forward';

  @override
  String get general => 'Pangkalahatan';

  @override
  String get go => 'Pumunta ka';

  @override
  String get install => 'I-install';

  @override
  String get installed => 'Naka-install';

  @override
  String get interval => 'Pagitan';

  @override
  String get name => 'Pangalan';

  @override
  String get networking => 'Networking';

  @override
  String get next => 'Susunod';

  @override
  String get path => 'Daan';

  @override
  String get paused => 'Naka-pause';

  @override
  String get permissions => 'Mga Pahintulot';

  @override
  String get processing => 'Pinoproseso';

  @override
  String get profile => 'Profile';

  @override
  String get provider => 'Provider';

  @override
  String get refresh => 'I-refresh';

  @override
  String get remote => 'Remote';

  @override
  String get rename => 'Palitan ang pangalan';

  @override
  String get revoke => 'Bawiin';

  @override
  String get role => 'Tungkulin';

  @override
  String get root => 'ugat';

  @override
  String get run => 'Takbo';

  @override
  String get search => 'Maghanap';

  @override
  String get select => 'Pumili';

  @override
  String get send => 'Ipadala';

  @override
  String get sessions => 'Mga session';

  @override
  String get set => 'Itakda';

  @override
  String get status => 'Katayuan';

  @override
  String get stop => 'Ihinto';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Oras';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'I-uninstall';

  @override
  String get up => 'pataas';

  @override
  String get update => 'Update';

  @override
  String get upload => 'Mag-upload';

  @override
  String get unmute => 'I-unmute';

  @override
  String get mute => 'I-mute';

  @override
  String get branding => 'Pagba-brand';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Mga setting';

  @override
  String get adminDrawerBranding => 'Pagba-brand';

  @override
  String get adminDrawerUsers => 'Mga gumagamit';

  @override
  String get adminDrawerLibraries => 'Mga library';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'Mga Setting ng NFO';

  @override
  String get adminDrawerTranscoding => 'Transcoding';

  @override
  String get adminDrawerResume => 'Resume';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Mga device';

  @override
  String get adminDrawerActivity => 'Aktibidad';

  @override
  String get adminDrawerNetworking => 'Networking';

  @override
  String get adminDrawerApiKeys => 'Mga API Key';

  @override
  String get adminDrawerBackups => 'Mga backup';

  @override
  String get adminDrawerLogs => 'Mga log';

  @override
  String get adminDrawerScheduledTasks => 'Mga Naka-iskedyul na Gawain';

  @override
  String get adminDrawerPlugins => 'Mga Plugin';

  @override
  String get adminDrawerRepositories => 'Mga repositoryo';

  @override
  String get adminDrawerLiveTv => 'Live na TV';

  @override
  String get adminExitTooltip => 'Lumabas sa Admin';

  @override
  String get adminDashboardLoadFailed => 'Nabigong i-load ang dashboard';

  @override
  String get adminMediaOverview => 'Pangkalahatang-ideya ng Media';

  @override
  String get adminMediaTotalsError =>
      'Hindi ma-load ang mga kabuuan ng media ng server.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Isang mabilis na pagbabasa sa kung gaano karaming nilalaman ang nasa server na ito.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Mga available na update ng plugin: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Mga plugin na kailangang i-restart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Mga nabigong scheduled task: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Mga kamakailang warning/error entry: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Pamamahagi ng Media';

  @override
  String get analyticsVideoCodecs => 'Mga Video Codec';

  @override
  String get analyticsAudioCodecs => 'Mga Audio Codec';

  @override
  String get analyticsContainers => 'Mga lalagyan';

  @override
  String get analyticsTopGenres => 'Mga Nangungunang Genre';

  @override
  String get analyticsReleaseYears => 'Mga Taon ng Paglabas';

  @override
  String get analyticsContentRatings => 'Mga Rating ng Nilalaman';

  @override
  String get analyticsRuntimeBuckets => 'Runtime Bucket';

  @override
  String get analyticsFileFormats => 'Mga Format ng File';

  @override
  String get analyticsNoData => 'Walang Magagamit na Data.';

  @override
  String get adminServerInfo => 'Impormasyon ng Server';

  @override
  String get adminRestartPending => 'I-restart ang Nakabinbin';

  @override
  String get adminServerPaths => 'Mga Landas ng Server';

  @override
  String get adminServerActions => 'Mga Pagkilos ng Server';

  @override
  String get adminRestartServer => 'I-restart ang Server';

  @override
  String get adminShutdownServer => 'I-shutdown ang Server';

  @override
  String get adminScanLibraries => 'I-scan ang mga Aklatan';

  @override
  String get adminLibraryScanStarted => 'Nagsimula ang pag-scan sa library';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Kasalukuyang nag-reboot ang server';

  @override
  String get adminServerRebootMessage =>
      'Kasalukuyang nag-reboot ang server, mangyaring i-restart ang Moonfin';

  @override
  String get adminActiveSessions => 'Mga Aktibong Sesyon';

  @override
  String get adminSessionsLoadFailed => 'Nabigong i-load ang mga session';

  @override
  String get adminNoActiveSessions => 'Walang aktibong session';

  @override
  String get adminRecentActivity => 'Kamakailang Aktibidad';

  @override
  String get adminNoRecentActivity => 'Walang kamakailang aktibidad';

  @override
  String adminCommandFailed(String error) {
    return 'Nabigo ang command: $error';
  }

  @override
  String get adminSendMessage => 'Magpadala ng Mensahe';

  @override
  String get adminMessageTextHint => 'Text ng mensahe';

  @override
  String get adminSetVolume => 'Itakda ang Volume';

  @override
  String get sessionPrev => 'Nakaraan';

  @override
  String get sessionRewind => 'I-rewind';

  @override
  String get sessionForward => 'I-forward';

  @override
  String get sessionNext => 'Susunod';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Naglalaro Ngayon';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Mga aksyon';

  @override
  String get videoCodec => 'Video Codec';

  @override
  String get audioCodec => 'Audio Codec';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Pagkumpleto';

  @override
  String get direct => 'Direkta';

  @override
  String get adminDisconnect => 'Idiskonekta';

  @override
  String get adminClearDates => 'I-clear ang mga petsa';

  @override
  String get adminActivitySeverityAll => 'Lahat ng severity';

  @override
  String get adminActivityDateRange => 'Saklaw ng petsa';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nabigong i-load ang activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Walang mga entry sa aktibidad';

  @override
  String get adminEditDeviceName => 'I-edit ang Pangalan ng Device';

  @override
  String get adminCustomName => 'Custom na Pangalan';

  @override
  String get adminDeviceNameUpdated => 'Na-update ang pangalan ng device';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Nabigong i-update ang device: $error';
  }

  @override
  String get adminDeleteDevice => 'Tanggalin ang Device';

  @override
  String get adminDeviceDeleted => 'Na-delete ang device';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Nabigong tanggalin ang device: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Alisin ang device na \'$name\'? Kakailanganin ng user na mag-sign in muli sa device na ito.';
  }

  @override
  String get adminDeleteAllDevices => 'Tanggalin ang lahat ng device';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Alisin ang $count na device? Kakailanganin ng mga apektadong user na mag-sign in muli. Hindi apektado ang iyong kasalukuyang device.';
  }

  @override
  String get adminDevicesDeletedAll => 'Naalis ang mga device';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Naalis ang ilang device; $count ang hindi maalis.';
  }

  @override
  String get adminDevicesLoadFailed => 'Nabigong i-load ang mga device';

  @override
  String get adminSearchDevices => 'Maghanap ng mga device';

  @override
  String get adminThisDevice => 'Ang Device na ito';

  @override
  String get adminEditName => 'I-edit ang Pangalan';

  @override
  String get adminLibrariesLoadFailed => 'Nabigong i-load ang mga library';

  @override
  String get adminNoLibraries => 'Walang mga library na na-configure';

  @override
  String get adminScanAllLibraries => 'I-scan ang Lahat ng Aklatan';

  @override
  String get adminAddLibrary => 'Magdagdag ng Library';

  @override
  String adminScanFailed(String error) {
    return 'Nabigong simulan ang scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Palitan ang pangalan ng Library';

  @override
  String get adminNewName => 'Bagong pangalan';

  @override
  String adminLibraryRenamed(String name) {
    return 'Pinalitan ang pangalan ng library sa \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nabigong palitan ang pangalan: $error';
  }

  @override
  String get adminDeleteLibrary => 'Tanggalin ang Library';

  @override
  String adminLibraryDeleted(String name) {
    return 'Tinanggal ang library na \"$name\"';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Nabigong tanggalin ang library: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nabigong magdagdag ng path: $error';
  }

  @override
  String get adminRemovePath => 'Alisin ang Landas';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Alisin ang \"$path\" mula sa library na ito?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nabigong alisin ang path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Nai-save ang mga opsyon sa library';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Nabigong i-save ang mga opsyon: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nabigong i-load ang library';

  @override
  String get adminNoMediaPaths => 'Walang media path na na-configure';

  @override
  String get adminAddPath => 'Magdagdag ng Path';

  @override
  String get adminBrowseFilesystem => 'I-browse ang server filesystem:';

  @override
  String get adminSaveOptions => 'I-save ang Mga Opsyon';

  @override
  String get adminPreferredMetadataLanguage => 'Ginustong wika ng metadata';

  @override
  String get adminMetadataLanguageHint => 'hal. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Code ng bansa ng metadata';

  @override
  String get adminMetadataCountryHint => 'hal. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Mga Path';

  @override
  String get adminLibraryTabOptions => 'Mga Opsyon';

  @override
  String get adminLibraryTabDownloaders => 'Mga Downloader';

  @override
  String get adminLibMetadataSavers => 'Mga metadata saver';

  @override
  String get adminLibSubtitleDownloaders => 'Mga subtitle downloader';

  @override
  String get adminLibLyricDownloaders => 'Mga lyric downloader';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Mga metadata downloader: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Mga image fetcher: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Walang inilalantad na downloader ang server na ito para sa uri ng library na ito.';

  @override
  String get adminLibrarySectionGeneral => 'Pangkalahatan';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Embedded na Impormasyon';

  @override
  String get adminLibrarySectionSubtitles => 'Mga Subtitle';

  @override
  String get adminLibrarySectionImages => 'Mga Larawan';

  @override
  String get adminLibrarySectionSeries => 'Serye';

  @override
  String get adminLibrarySectionMusic => 'Musika';

  @override
  String get adminLibrarySectionMovies => 'Mga Pelikula';

  @override
  String get adminLibRealtimeMonitor => 'I-enable ang real-time na pagsubaybay';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Tuklasin ang mga pagbabago sa file at awtomatikong iproseso ang mga ito.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Ituring ang mga archive bilang media file';

  @override
  String get adminLibEnablePhotos => 'Ipakita ang mga larawan';

  @override
  String get adminLibSaveLocalMetadata =>
      'I-save ang artwork sa mga media folder';

  @override
  String get adminLibRefreshInterval => 'Awtomatikong pag-refresh ng metadata';

  @override
  String get adminLibRefreshNever => 'Hindi kailanman';

  @override
  String get adminLibDefault => 'Default';

  @override
  String get adminLibDisplayTitle => 'Display';

  @override
  String get adminLibDisplaySection => 'Display ng library';

  @override
  String get adminLibFolderView =>
      'Magpakita ng folder view para ipakita ang mga plain na media folder';

  @override
  String get adminLibSpecialsInSeasons =>
      'Ipakita ang mga special sa loob ng mga season kung saan sila unang ipinalabas';

  @override
  String get adminLibGroupMovies =>
      'Pagsama-samahin ang mga pelikula sa mga collection';

  @override
  String get adminLibGroupShows =>
      'Pagsama-samahin ang mga palabas sa mga collection';

  @override
  String get adminLibExternalSuggestions =>
      'Ipakita ang external na nilalaman sa mga suhestiyon';

  @override
  String get adminLibDateAddedSection => 'Kilos ng petsang idinagdag';

  @override
  String get adminLibDateAddedLabel => 'Gamitin ang petsang idinagdag mula sa';

  @override
  String get adminLibDateAddedImport => 'Petsang na-scan sa library';

  @override
  String get adminLibDateAddedFile => 'Petsang ginawa ang file';

  @override
  String get adminLibMetadataTitle => 'Metadata at Mga Larawan';

  @override
  String get adminLibMetadataLangSection => 'Gustong wika ng metadata';

  @override
  String get adminLibChaptersSection => 'Mga Kabanata';

  @override
  String get adminLibDummyChapterDuration => 'Tagal ng dummy chapter (segundo)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Haba ng mga kabanatang binuo para sa media na walang kabanata. Itakda sa 0 para i-disable.';

  @override
  String get adminLibChapterImageResolution =>
      'Resolution ng larawan ng kabanata';

  @override
  String get adminLibNfoTitle => 'Mga Setting ng NFO';

  @override
  String get adminLibNfoHelp =>
      'Ang NFO metadata ay compatible sa Kodi at mga katulad na client. Nalalapat ang mga setting sa lahat ng library na nagse-save ng NFO metadata.';

  @override
  String get adminLibKodiUser =>
      'User na pagta-store-an ng watch data sa mga NFO file';

  @override
  String get adminLibSaveImagePaths =>
      'I-save ang mga image path sa loob ng mga NFO file';

  @override
  String get adminLibPathSubstitution =>
      'I-enable ang path substitution para sa mga NFO image path';

  @override
  String get adminLibExtraThumbs =>
      'Kopyahin ang mga extrafanart na larawan sa isang extrathumbs folder';

  @override
  String get adminLibNone => 'Wala';

  @override
  String adminLibRefreshDays(int days) {
    return '$days na araw';
  }

  @override
  String get adminLibEmbeddedTitles => 'Gamitin ang mga embedded na title';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Gamitin ang mga embedded na title para sa mga extra';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Gamitin ang embedded na impormasyon ng episode';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Payagan ang mga embedded na subtitle';

  @override
  String get adminLibEmbeddedAllowAll => 'Payagan lahat';

  @override
  String get adminLibEmbeddedAllowText => 'Text lang';

  @override
  String get adminLibEmbeddedAllowImage => 'Larawan lang';

  @override
  String get adminLibEmbeddedAllowNone => 'Wala';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Laktawan ang download kung may mga embedded na subtitle';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Laktawan ang download kung tumutugma ang audio track sa wika ng download';

  @override
  String get adminLibRequirePerfectMatch =>
      'Mangailangan ng perpektong tugma ng subtitle';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'I-save ang mga subtitle sa mga media folder';

  @override
  String get adminLibChapterImageExtraction =>
      'I-extract ang mga larawan ng kabanata';

  @override
  String get adminLibChapterImagesDuringScan =>
      'I-extract ang mga larawan ng kabanata habang nagsa-scan ng library';

  @override
  String get adminLibTrickplayExtraction =>
      'I-enable ang pag-extract ng larawan ng Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'I-extract ang mga larawan ng Trickplay habang nagsa-scan ng library';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'I-save ang mga larawan ng Trickplay sa mga media folder';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Awtomatikong pagsamahin ang mga seryeng nakakalat sa maraming folder';

  @override
  String get adminLibSeasonZeroName => 'Display name ng season zero';

  @override
  String get adminLibLufsScan =>
      'I-enable ang LUFS scan para sa audio normalization';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Piliin ang non-standard na artists tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Awtomatikong idagdag ang mga pelikula sa mga collection';

  @override
  String get adminLibraryNameRequired =>
      'Kinakailangan ang pangalan ng library';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nabigong gumawa ng library: $error';
  }

  @override
  String get adminLibraryName => 'Pangalan ng Aklatan';

  @override
  String get adminSelectedPaths => 'Mga Piniling Path:';

  @override
  String get adminNoPathsAdded =>
      'Walang idinagdag na mga landas (maaaring idagdag sa ibang pagkakataon)';

  @override
  String get adminCreateLibrary => 'Gumawa ng Library';

  @override
  String get paths => 'Mga landas:';

  @override
  String get adminDisableUser => 'Huwag paganahin ang User';

  @override
  String get adminEnableUser => 'Paganahin ang User';

  @override
  String adminDisableUserConfirm(String name) {
    return 'I-disable si $name? Hindi na siya makakapag-sign in.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'I-enable si $name? Makakapag-sign in na siya muli.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Na-disable ang user na \"$name\"';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Na-enable ang user na \"$name\"';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Nabigong i-update ang user policy: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Nabigong i-load ang mga user';

  @override
  String get adminSearchUsers => 'Maghanap ng mga gumagamit';

  @override
  String get adminEditUser => 'I-edit ang User';

  @override
  String get adminAddUser => 'Magdagdag ng User';

  @override
  String adminUserCreateFailed(String error) {
    return 'Nabigong gumawa ng user: $error';
  }

  @override
  String get adminCreateUser => 'Lumikha ng User';

  @override
  String get adminPasswordOptional => 'Password (opsyonal)';

  @override
  String get adminUsernameRequired =>
      'Hindi maaaring walang laman ang username';

  @override
  String get adminNoProfileChanges =>
      'Walang mga pagbabago sa profile na ise-save';

  @override
  String get adminProfileSaved => 'Na-save ang profile';

  @override
  String adminSaveFailed(String error) {
    return 'Nabigong i-save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Na-save ang mga pahintulot';

  @override
  String get adminPasswordsMismatch => 'Hindi tugma ang mga password';

  @override
  String adminFailed(String error) {
    return 'Nabigo: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nabigong i-load ang user';

  @override
  String get adminBackToUsers => 'Bumalik sa Mga Gumagamit';

  @override
  String get adminSaveProfile => 'I-save ang Profile';

  @override
  String get adminDeleteUser => 'Tanggalin ang User';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Ang mga administrator ay may kumpletong access sa server. Ibigay nang may pag-iingat.';

  @override
  String get administrator => 'Tagapangasiwa';

  @override
  String get adminHiddenUser => 'Nakatagong user';

  @override
  String get adminAllowMediaPlayback => 'Payagan ang pag-playback ng media';

  @override
  String get adminAllowAudioTranscoding => 'Payagan ang audio transcoding';

  @override
  String get adminAllowVideoTranscoding => 'Payagan ang transcoding ng video';

  @override
  String get adminAllowRemuxing => 'Payagan ang remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Pilitin ang remote source transcoding';

  @override
  String get adminAllowContentDeletion => 'Payagan ang pagtanggal ng nilalaman';

  @override
  String get adminAllowContentDownloading =>
      'Payagan ang pag-download ng nilalaman';

  @override
  String get adminAllowPublicSharing => 'Payagan ang pampublikong pagbabahagi';

  @override
  String get adminAllowRemoteControl =>
      'Payagan ang remote control ng ibang mga user';

  @override
  String get adminAllowSharedDeviceControl =>
      'Payagan ang nakabahaging kontrol ng device';

  @override
  String get adminAllowRemoteAccess => 'Payagan ang malayuang pag-access';

  @override
  String get adminRemoteBitrateLimit =>
      'Malayong limitasyon sa bitrate ng kliyente (bps)';

  @override
  String get adminLeaveEmptyNoLimit =>
      'Iwanang walang laman nang walang limitasyon';

  @override
  String get adminMaxActiveSessions => 'Max aktibong session';

  @override
  String get adminAllowLiveTvAccess => 'Payagan ang Live TV access';

  @override
  String get adminAllowLiveTvManagement => 'Payagan ang pamamahala ng Live TV';

  @override
  String get adminAllowCollectionManagement =>
      'Payagan ang pamamahala ng koleksyon';

  @override
  String get adminAllowSubtitleManagement =>
      'Payagan ang pamamahala ng subtitle';

  @override
  String get adminAllowLyricManagement => 'Payagan ang pamamahala ng liriko';

  @override
  String get adminSavePermissions => 'I-save ang Mga Pahintulot';

  @override
  String get adminEnableAllLibraryAccess =>
      'Paganahin ang pag-access sa lahat ng mga aklatan';

  @override
  String get adminSaveAccess => 'I-save ang Access';

  @override
  String get adminChangePassword => 'Baguhin ang Password';

  @override
  String get adminNewPassword => 'Bagong Password';

  @override
  String get adminConfirmPassword => 'Kumpirmahin ang Password';

  @override
  String get adminSetPassword => 'Itakda ang Password';

  @override
  String get adminResetPassword => 'I-reset ang Password';

  @override
  String get adminPasswordReset => 'Pag-reset ng password';

  @override
  String get adminPasswordUpdated => 'Na-update ang password';

  @override
  String get adminUserSettings => 'Mga Setting ng User';

  @override
  String get adminLibraryAccess => 'Access sa Aklatan';

  @override
  String get adminDeviceAndChannelAccess => 'Access sa Device at Channel';

  @override
  String get adminEnableAllDevices => 'Paganahin ang access sa lahat ng device';

  @override
  String get adminEnableAllChannels =>
      'Paganahin ang access sa lahat ng channel';

  @override
  String get adminParentalControl => 'Parental Control';

  @override
  String get adminMaxParentalRating =>
      'Pinakamataas na pinapayagang parental rating';

  @override
  String get adminMaxParentalRatingHint =>
      'Itatago sa user na ito ang nilalamang may mas mataas na rating.';

  @override
  String get adminParentalRatingNone => 'Wala';

  @override
  String get adminBlockUnratedItems =>
      'I-block ang mga item na walang o hindi kilalang impormasyon ng rating';

  @override
  String get adminUnratedBook => 'Mga Aklat';

  @override
  String get adminUnratedChannelContent => 'Mga Channel';

  @override
  String get adminUnratedLiveTvChannel => 'Live na TV';

  @override
  String get adminUnratedMovie => 'Mga Pelikula';

  @override
  String get adminUnratedMusic => 'Musika';

  @override
  String get adminUnratedTrailer => 'Mga trailer';

  @override
  String get adminUnratedSeries => 'Mga Palabas';

  @override
  String get adminAccessSchedules => 'Mga Schedule ng Access';

  @override
  String get adminAccessSchedulesHint =>
      'Payagan ang access lamang sa mga nakatakdang oras sa ibaba. Pinapayagan ang access buong araw kapag walang nakatakdang schedule.';

  @override
  String get adminAddSchedule => 'Magdagdag ng Schedule';

  @override
  String get adminScheduleDay => 'Araw';

  @override
  String get adminScheduleStart => 'Simula';

  @override
  String get adminScheduleEnd => 'Katapusan';

  @override
  String get adminDayEveryday => 'Araw-araw';

  @override
  String get adminDayWeekday => 'Araw ng pasukan';

  @override
  String get adminDayWeekend => 'Katapusan ng linggo';

  @override
  String get adminDaySunday => 'Linggo';

  @override
  String get adminDayMonday => 'Lunes';

  @override
  String get adminDayTuesday => 'Martes';

  @override
  String get adminDayWednesday => 'Miyerkules';

  @override
  String get adminDayThursday => 'Huwebes';

  @override
  String get adminDayFriday => 'Biyernes';

  @override
  String get adminDaySaturday => 'Sabado';

  @override
  String get adminAllowedTags => 'Mga pinapayagang tag';

  @override
  String get adminAllowedTagsHint =>
      'Nilalamang may mga tag na ito lang ang ipinapakita. Iwanang blangko para payagan lahat.';

  @override
  String get adminBlockedTags => 'Mga naka-block na tag';

  @override
  String get adminBlockedTagsHint =>
      'Itinatago sa user na ito ang nilalamang may mga tag na ito.';

  @override
  String get adminAddTag => 'Magdagdag ng tag';

  @override
  String get adminEnabledDevices => 'Mga naka-enable na device';

  @override
  String get adminEnabledChannels => 'Mga naka-enable na channel';

  @override
  String get adminAuthProvider => 'Authentication provider';

  @override
  String get adminPasswordResetProvider => 'Password reset provider';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Pinakamaraming nabigong login attempt bago mag-lockout';

  @override
  String get adminLoginAttemptsHint =>
      'Itakda sa 0 para sa default, o -1 para i-disable ang lockout.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay access';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Payagan ang paggawa at pagsali sa mga grupo';

  @override
  String get adminSyncPlayJoin => 'Payagan ang pagsali sa mga grupo';

  @override
  String get adminSyncPlayNone => 'Walang access';

  @override
  String get adminContentDeletionFolders =>
      'Payagan ang pagtanggal ng nilalaman mula sa';

  @override
  String get adminResetPasswordWarning =>
      'Aalisin nito ang password. Ang user ay makakapag-log in nang walang password.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Nagbalik ang server ng HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Sigurado ka bang gusto mong tanggalin si $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Tinanggal ang user na \"$name\"';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nabigong tanggalin ang user: $error';
  }

  @override
  String get adminCreateApiKey => 'Lumikha ng API Key';

  @override
  String get adminAppName => 'Pangalan ng app';

  @override
  String get adminApiKeyCreated => 'Nagawa ang API Key';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Matagumpay na nagawa ang susi. Hindi ibinalik ng server ang token. Suriin ang mga server API key.';

  @override
  String get adminKeyCopied => 'Nakopya ang key sa clipboard';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Nabigong gumawa ng key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Nawawala ang key token sa tugon ng server';

  @override
  String get adminRevokeApiKey => 'Bawiin ang API Key';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Bawiin ang key para kay $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Binawi ang API key';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nabigong bawiin ang key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Nabigong i-load ang mga API key';

  @override
  String get adminApiKeysTitle => 'Mga API Key';

  @override
  String get adminCreateKey => 'Lumikha ng Key';

  @override
  String get adminNoApiKeys => 'Walang nakitang mga API key';

  @override
  String get adminUnknownApp => 'Hindi kilalang App';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nGinawa: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Gumawa ng Backup';

  @override
  String get adminBackupInclude => 'Piliin kung ano ang isasama sa backup.';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Palaging kasama';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Mga Subtitle';

  @override
  String get adminBackupTrickplay => 'Mga larawan ng Trickplay';

  @override
  String get adminCreatingBackup => 'Gumagawa ng backup...';

  @override
  String get adminBackupCreated => 'Matagumpay na nagawa ang backup';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nabigong gumawa ng backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Nawawala ang backup na landas sa tugon ng server';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nabigong i-load ang manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Kumpirmahin ang Pagpapanumbalik';

  @override
  String get adminRestoringBackup => 'Nire-restore ang backup...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nabigong ibalik ang backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nabigong i-load ang mga backup';

  @override
  String get adminCreateBackup => 'Gumawa ng Backup';

  @override
  String get adminNoBackups => 'Walang nakitang backup';

  @override
  String get adminViewDetails => 'Tingnan ang mga Detalye';

  @override
  String get restore => 'Ibalik';

  @override
  String get adminLogsLoadFailed => 'Nabigong i-load ang mga log ng server';

  @override
  String get adminNoLogFiles => 'Walang nakitang log file';

  @override
  String get adminLogCopied => 'Nakopya ang log sa clipboard';

  @override
  String get adminSaveLogFile => 'I-save ang log file';

  @override
  String adminSavedTo(String path) {
    return 'Na-save sa $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nabigong i-save ang file: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nabigong i-load ang $fileName';
  }

  @override
  String get adminSearchInLog => 'Maghanap sa log';

  @override
  String get adminNoMatchingLines => 'Walang tugmang linya';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nabigong i-load ang mga task: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Walang nakitang nakaiskedyul na gawain';

  @override
  String get adminNoTasksMatchFilter =>
      'Walang mga gawain na tumutugma sa kasalukuyang filter';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nabigong simulan ang task: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Nabigong ihinto ang task: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nabigong i-load ang task: $error';
  }

  @override
  String get adminRunNow => 'Tumakbo Ngayon';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nabigong alisin ang trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nabigong magdagdag ng trigger: $error';
  }

  @override
  String get adminLastExecution => 'Huling Pagbitay';

  @override
  String get adminTriggers => 'Mga nag-trigger';

  @override
  String get adminAddTrigger => 'Magdagdag ng Trigger';

  @override
  String get adminNoTriggers => 'Walang naka-configure na trigger';

  @override
  String get adminTriggerType => 'Uri ng Trigger';

  @override
  String get adminTimeLimit => 'Limitasyon sa oras (opsyonal)';

  @override
  String get adminNoLimit => 'Walang limitasyon';

  @override
  String adminHours(String hours) {
    return '$hours (na) oras';
  }

  @override
  String get adminDayOfWeek => 'Araw ng linggo';

  @override
  String get adminSearchPlugins => 'Maghanap ng mga plugin...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nabigong i-toggle ang plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'I-uninstall ang Plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Sigurado ka bang gusto mong i-uninstall ang \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nabigong i-uninstall ang plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nabigong i-install ang package: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nabigong i-install ang update: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nabigong i-load ang mga plugin: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Walang mga plugin na tumutugma sa iyong paghahanap';

  @override
  String get adminNoPluginsInstalled => 'Walang naka-install na plugin';

  @override
  String adminInstallUpdate(String version) {
    return 'I-install ang update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nabigong i-load ang catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Walang mga pakete na tumutugma sa iyong paghahanap';

  @override
  String get adminNoPackagesAvailable => 'Walang available na package';

  @override
  String get adminExperimentalIntegration => 'Eksperimental na Pagsasama';

  @override
  String get adminExperimentalWarning =>
      'Eksperimento pa rin ang pagsasama ng mga setting ng plugin. Maaaring hindi mai-render nang tama ang ilang page ng mga setting.';

  @override
  String get continueAction => 'Magpatuloy';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'Aalisin ang \"$name\" pagkatapos i-restart ang server';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Nabigong i-uninstall: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Ina-update ang \"$name\" sa v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Hindi mabuksan ang mga setting: nawawala ang auth token.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nabigong i-load ang plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Hindi nahanap ang plugin';

  @override
  String adminPluginVersion(String version) {
    return 'Bersyon $version';
  }

  @override
  String get adminEnablePlugin => 'Paganahin ang Plugin';

  @override
  String get adminPluginSettingsPage => 'Pahina ng mga setting ng plugin';

  @override
  String get adminRevisionHistory => 'Kasaysayan ng Pagbabago';

  @override
  String get adminNoChangelog => 'Walang available na changelog.';

  @override
  String get adminRemoveRepository => 'Alisin ang Repository';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Sigurado ka bang gusto mong alisin ang \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nabigong i-save ang mga repository: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nabigong i-load ang mga repository: $error';
  }

  @override
  String get adminRepositoryNameHint => 'hal. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL ng imbakan';

  @override
  String get adminAddEntry => 'Magdagdag ng entry';

  @override
  String get adminInvalidUrl => 'Di-wastong URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Hindi ma-load ang mga setting ng plugin: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Hindi mabuksan ang $uri';
  }

  @override
  String get adminOpenInBrowser => 'Buksan sa Browser';

  @override
  String get adminOpenExternally => 'Buksan sa labas';

  @override
  String get adminGeneralSettings => 'Mga Pangkalahatang Setting';

  @override
  String get adminServerName => 'Pangalan ng server';

  @override
  String get adminPreferredMetadataCountry => 'Ginustong metadata na bansa';

  @override
  String get adminCachePath => 'Cache path';

  @override
  String get adminMetadataPath => 'path ng metadata';

  @override
  String get adminLibraryScanConcurrency => 'Concurrency ng library scan';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limitasyon ng parallel image encoding';

  @override
  String get adminSlowResponseThreshold =>
      'Mabagal na threshold ng pagtugon (ms)';

  @override
  String get adminBrandingSaved => 'Na-save ang mga setting ng pagba-brand';

  @override
  String get adminBrandingLoadFailed =>
      'Nabigong i-load ang mga setting ng pagba-brand';

  @override
  String get adminLoginDisclaimer => 'Disclaimer sa pag-login';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML na ipinapakita sa ibaba ng login form';

  @override
  String get adminCustomCss => 'Custom na CSS';

  @override
  String get adminCustomCssHint =>
      'Inilapat ang custom na CSS sa web interface';

  @override
  String get adminEnableSplashScreen => 'Paganahin ang splash screen';

  @override
  String get adminStreamingSaved => 'Na-save ang mga setting ng streaming';

  @override
  String get adminStreamingLoadFailed =>
      'Nabigong i-load ang mga setting ng streaming';

  @override
  String get adminStreamingDescription =>
      'Magtakda ng mga limitasyon sa bitrate ng global streaming para sa mga malalayong koneksyon.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Malayong limitasyon sa bitrate ng kliyente (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Mag-iwan ng walang laman o 0 para sa walang limitasyon';

  @override
  String get adminPlaybackSaved => 'Na-save ang mga setting ng pag-playback';

  @override
  String get adminPlaybackLoadFailed =>
      'Nabigong i-load ang mga setting ng playback';

  @override
  String get adminPlaybackTranscoding => 'Pag-playback / Transcoding';

  @override
  String get adminHardwareAcceleration => 'Pagpapabilis ng hardware';

  @override
  String get adminVaapiDevice => 'VA-API device';

  @override
  String get adminEnableHardwareEncoding =>
      'Paganahin ang pag-encode ng hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Paganahin ang hardware decoding para sa:';

  @override
  String get adminEncodingThreads => 'Pag-encode ng mga thread';

  @override
  String get adminAutomatic => '0 = awtomatiko';

  @override
  String get adminTranscodingTempPath => 'Transcoding temp path';

  @override
  String get adminEnableFallbackFont => 'Paganahin ang fallback na font';

  @override
  String get adminFallbackFontPath => 'Fallback font path';

  @override
  String get adminAllowSegmentDeletion => 'Payagan ang pagtanggal ng segment';

  @override
  String get adminSegmentKeepSeconds => 'Panatilihin ang segment (segundo)';

  @override
  String get adminThrottleBuffering => 'Pag-buffer ng throttle';

  @override
  String get adminTrickplaySaved => 'Na-save ang mga setting ng trickplay';

  @override
  String get adminTrickplayLoadFailed =>
      'Nabigong i-load ang mga setting ng trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Paganahin ang hardware acceleration';

  @override
  String get adminEnableKeyFrameExtraction =>
      'I-enable ang key frame only extraction';

  @override
  String get adminKeyFrameSubtitle =>
      'Mas mabilis ngunit mas mababang katumpakan';

  @override
  String get adminScanBehavior => 'Pag-uugali ng pag-scan';

  @override
  String get adminProcessPriority => 'Priyoridad sa proseso';

  @override
  String get adminImageSettings => 'Mga Setting ng Larawan';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Gaano kadalas kumuha ng mga frame';

  @override
  String get adminWidthResolutions => 'Mga resolusyon ng lapad';

  @override
  String get adminTileWidth => 'Lapad ng tile';

  @override
  String get adminTileHeight => 'Taas ng tile';

  @override
  String get adminQualitySubtitle =>
      'Mas mababang halaga = mas mahusay na kalidad, mas malalaking file';

  @override
  String get adminProcessThreads => 'Iproseso ang mga thread';

  @override
  String get adminResumeSaved => 'Na-save ang mga setting ng resume';

  @override
  String get adminResumeLoadFailed =>
      'Nabigong i-load ang mga setting ng resume';

  @override
  String get adminResumeDescription =>
      'I-configure kung kailan dapat markahan ang nilalaman bilang bahagyang na-play o ganap na na-play.';

  @override
  String get adminMinResumePercentage => 'Minimum na porsyento ng resume';

  @override
  String get adminMinResumeSubtitle =>
      'Ang nilalaman ay dapat i-play na lampas sa porsyentong ito upang i-save ang pag-unlad';

  @override
  String get adminMaxResumePercentage => 'Pinakamataas na porsyento ng resume';

  @override
  String get adminMaxResumeSubtitle =>
      'Ang nilalaman ay itinuturing na ganap na nilalaro pagkatapos ng porsyentong ito';

  @override
  String get adminMinResumeDuration => 'Minimum na tagal ng resume (segundo)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Ang mga item na mas maikli kaysa dito ay hindi na maibabalik';

  @override
  String get adminMinAudiobookResume =>
      'Minimum na porsyento ng resume ng audiobook';

  @override
  String get adminMaxAudiobookResume =>
      'Pinakamataas na porsyento ng resume ng audiobook';

  @override
  String get adminNetworkingSaved =>
      'Na-save ang mga setting ng networking. Maaaring kailanganin ang pag-restart ng server.';

  @override
  String get adminNetworkingLoadFailed =>
      'Nabigong i-load ang mga setting ng networking';

  @override
  String get adminNetworkingWarning =>
      'Ang mga pagbabago sa mga setting ng networking ay maaaring mangailangan ng pag-restart ng server.';

  @override
  String get adminEnableRemoteAccess => 'Paganahin ang malayuang pag-access';

  @override
  String get ports => 'Mga daungan';

  @override
  String get adminHttpPort => 'HTTP port';

  @override
  String get adminHttpsPort => 'HTTPS port';

  @override
  String get adminPublicHttpsPort => 'Pampublikong HTTPS port';

  @override
  String get adminBaseUrl => 'Base URL';

  @override
  String get adminBaseUrlHint => 'hal. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Paganahin ang HTTPS';

  @override
  String get adminLocalNetwork => 'Lokal na Network';

  @override
  String get adminLocalNetworkAddresses => 'Mga address ng lokal na network';

  @override
  String get adminKnownProxies => 'Mga kilalang proxy';

  @override
  String get adminRemoteIpFilter => 'Remote IP Filter';

  @override
  String get adminRemoteIpFilterEntries => 'Remote IP filter';

  @override
  String get adminCertificatePath => 'Landas ng sertipiko';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get blacklist => 'Blacklist';

  @override
  String get notSet => 'Hindi nakatakda';

  @override
  String get adminMetadataSaved => 'Na-save ang metadata';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Nabigong i-load ang metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nabigong i-save ang metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'I-refresh ang Metadata';

  @override
  String get recursive => 'Recursive';

  @override
  String get adminReplaceAllMetadata => 'Palitan ang lahat ng metadata';

  @override
  String get adminReplaceAllImages => 'Palitan ang lahat ng mga larawan';

  @override
  String get adminMetadataRefreshRequested =>
      'Hiniling ang pag-refresh ng metadata';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Nabigong i-refresh ang metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Walang nakitang malalayong tugma';

  @override
  String get adminRemoteResults => 'Malayong Resulta';

  @override
  String get adminRemoteMetadataApplied => 'Inilapat ang malayuang metadata';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Nabigo ang remote search: $error';
  }

  @override
  String get adminUpdateContentType => 'I-update ang Uri ng Nilalaman';

  @override
  String get adminContentType => 'Uri ng nilalaman';

  @override
  String get adminContentTypeUpdated => 'Na-update ang uri ng nilalaman';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nabigong i-update ang content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nabigong i-load ang metadata editor';

  @override
  String get adminNoPeopleEntries => 'Walang entry ng mga tao';

  @override
  String get adminNoExternalIds => 'Walang available na external na ID';

  @override
  String adminImageUpdated(String imageType) {
    return 'Na-update ang larawang $imageType';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nabigong i-download ang larawan: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Hindi sinusuportahang format ng larawan';

  @override
  String get adminImageReadFailed => 'Nabigong basahin ang napiling larawan';

  @override
  String adminImageUploaded(String imageType) {
    return 'Na-upload ang larawang $imageType';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nabigong i-upload ang larawan: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Tanggalin ang larawang $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Tinanggal ang larawang $imageType';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nabigong tanggalin ang larawan: $error';
  }

  @override
  String get adminAllProviders => 'Lahat ng provider';

  @override
  String get adminNoRemoteImages => 'Walang nakitang malayuang larawan';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Nabigo ang tuner discovery: $error';
  }

  @override
  String get adminAddTuner => 'Magdagdag ng Tuner';

  @override
  String get adminEditTuner => 'I-edit ang Tuner';

  @override
  String get adminTunerTypeM3u => 'M3U Tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'File o URL';

  @override
  String get adminTunerIpAddress => 'IP address ng tuner';

  @override
  String get adminTunerFriendlyName => 'Friendly na pangalan';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limitasyon ng sabayang koneksyon';

  @override
  String get adminTunerCountHelp =>
      'Ang pinakamaraming stream na pinapayagan ng tuner nang sabay-sabay. Itakda sa 0 para sa walang limitasyon.';

  @override
  String get adminTunerFallbackBitrate => 'Fallback na max streaming bitrate';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Mag-import lang ng mga paboritong channel';

  @override
  String get adminTunerAllowHwTranscoding => 'Payagan ang hardware transcoding';

  @override
  String get adminTunerAllowFmp4 => 'Payagan ang fMP4 transcoding container';

  @override
  String get adminTunerAllowStreamSharing => 'Payagan ang stream sharing';

  @override
  String get adminTunerEnableStreamLooping => 'I-enable ang stream looping';

  @override
  String get adminTunerIgnoreDts => 'Balewalain ang DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Basahin ang input sa native frame rate';

  @override
  String get adminEditProvider => 'I-edit ang Provider';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'File o URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefix ng pelikula';

  @override
  String get adminXmltvMovieCategories => 'Mga kategorya ng pelikula';

  @override
  String get adminXmltvCategoriesHelp =>
      'Paghiwalayin ang maraming kategorya gamit ang vertical bar.';

  @override
  String get adminXmltvKidsCategories => 'Mga kategorya ng bata';

  @override
  String get adminXmltvNewsCategories => 'Mga kategorya ng balita';

  @override
  String get adminXmltvSportsCategories => 'Mga kategorya ng sports';

  @override
  String get adminSdUsername => 'Username';

  @override
  String get adminSdPassword => 'Password';

  @override
  String get adminSdCountry => 'Bansa';

  @override
  String get adminSdCountrySelect => 'Pumili ng bansa';

  @override
  String get adminSdPostalCode => 'Postal code';

  @override
  String get adminSdGetListings => 'Kunin ang mga listing';

  @override
  String get adminSdListings => 'Mga Listing';

  @override
  String get adminEnableAllTuners => 'I-enable ang lahat ng tuner';

  @override
  String get adminTunerType => 'Uri ng Tuner';

  @override
  String get adminTunerAdded => 'Idinagdag ni Tuner';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nabigong magdagdag ng tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Magdagdag ng Tagabigay ng Gabay';

  @override
  String get adminProviderType => 'Uri ng Provider';

  @override
  String get adminProviderAdded => 'Idinagdag ng provider';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nabigong magdagdag ng provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nabigong alisin ang tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Hiniling ang pag-reset ng tuner';

  @override
  String adminTunerResetFailed(String error) {
    return 'Nabigong i-reset ang tuner: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Hindi sinusuportahan ng uri ng tuner na ito ang pag-reset.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nabigong alisin ang provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Mga Setting ng Pagre-record';

  @override
  String get adminPrePadding => 'Pre-padding (minuto)';

  @override
  String get adminPostPadding => 'Post-padding (minuto)';

  @override
  String get adminRecordingPath => 'Landas sa pagre-record';

  @override
  String get adminSeriesRecordingPath => 'Landas ng pag-record ng serye';

  @override
  String get adminMovieRecordingPath => 'Path ng recording ng pelikula';

  @override
  String get adminGuideDays => 'Mga araw ng guide data';

  @override
  String get adminGuideDaysAuto => 'Automatic';

  @override
  String adminGuideDaysValue(int days) {
    return '$days na araw';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Path ng post-processing application';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Mga argumento ng post-processor';

  @override
  String get adminSaveRecordingNfo => 'I-save ang NFO metadata ng recording';

  @override
  String get adminSaveRecordingImages => 'I-save ang mga larawan ng recording';

  @override
  String get adminLiveTvSectionTiming => 'Timing';

  @override
  String get adminLiveTvSectionPaths => 'Mga path ng recording';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-processing';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Guide data: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'Na-save ang mga setting ng pag-record';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nabigong i-save ang mga setting: $error';
  }

  @override
  String get adminSetChannelMappings => 'Itakda ang Channel Mappings';

  @override
  String get adminMappingJson => 'Pagmamapa ng JSON';

  @override
  String get adminMappingJsonHint => 'Halimbawa: mappings JSON payload';

  @override
  String get adminChannelMappingsUpdated => 'Na-update ang mga channel mapping';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Nabigong i-update ang mga mapping: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nabigong i-load ang Live TV administration';

  @override
  String get adminTunerDevices => 'Mga Aparatong Tuner';

  @override
  String get adminNoTunerHosts => 'Walang tuner host na na-configure';

  @override
  String get adminGuideProviders => 'Mga Tagabigay ng Gabay';

  @override
  String get adminRefreshGuideData => 'I-refresh ang Guide Data';

  @override
  String get adminGuideRefreshStarted =>
      'Nagsimula ang pag-refresh ng guide data';

  @override
  String get adminGuideRefreshUnavailable =>
      'Hindi available ang guide refresh task sa server na ito.';

  @override
  String get adminAddProvider => 'Magdagdag ng Provider';

  @override
  String get adminNoListingProviders =>
      'Walang naka-configure na provider ng listahan';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Path ng recording: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Path ng serye: $path';
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
  String get adminTunerDiscovery => 'Pagtuklas ng Tuner';

  @override
  String get adminChannelMappings => 'Mga Channel Mapping';

  @override
  String get adminNoDiscoveredTuners => 'Wala pang natuklasang tuner';

  @override
  String get adminSettingsSaved => 'Na-save ang mga setting';

  @override
  String get adminBackupsNotAvailable =>
      'Hindi available ang mga backup sa build ng server na ito.';

  @override
  String get adminRestoreWarning1 =>
      'Papalitan ng pagpapanumbalik ang LAHAT ng kasalukuyang data ng server ng backup na data.';

  @override
  String get adminRestoreWarning2 =>
      'Ang mga kasalukuyang setting ng server, mga user, at data ng library ay mapapatungan.';

  @override
  String get adminRestoreWarning3 =>
      'Ang server ay magre-restart pagkatapos ng pagpapanumbalik.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Ibalik ang backup na $name ngayon?';
  }

  @override
  String get adminRestoreRequested =>
      'Hiniling na ibalik. Maaaring idiskonekta ng pag-restart ng server ang session na ito.';

  @override
  String get adminBackupsTitle => 'Mga backup';

  @override
  String get adminUnknownDate => 'Hindi alam na petsa';

  @override
  String get adminUnnamedBackup => 'Walang Pangalan na Backup';

  @override
  String get adminLiveTvNotAvailable =>
      'Hindi available ang live TV administration sa server build na ito.';

  @override
  String get adminLiveTvTitle => 'Administrasyon ng Live TV';

  @override
  String get adminApply => 'Ilapat';

  @override
  String get adminNotSet => 'Hindi nakatakda';

  @override
  String get adminReset => 'I-reset';

  @override
  String get adminLogsTitle => 'Mga Log ng Server';

  @override
  String get adminLogsNewestFirst => 'Pinakabago Una';

  @override
  String get adminLogsOldestFirst => 'Pinakamatanda Una';

  @override
  String get adminLogsJustNow => 'Ngayon lang';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m ang nakalipas';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h ang nakalipas';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d ang nakalipas';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nabigong i-load ang $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count na tugma';
  }

  @override
  String get adminLogViewerNoMatches => 'Walang tugmang linya';

  @override
  String get adminMetadataEditorTitle => 'Metadata Editor';

  @override
  String get adminMetadataIdentify => 'Tukuyin';

  @override
  String get adminMetadataType => 'Uri';

  @override
  String get adminMetadataDetails => 'Mga Detalye';

  @override
  String get adminMetadataExternalIds => 'Mga panlabas na ID';

  @override
  String get adminMetadataImages => 'Mga imahe';

  @override
  String get adminMetadataFieldTitle => 'Title';

  @override
  String get adminMetadataFieldSortTitle => 'Pagbukud-bukurin ang pamagat';

  @override
  String get adminMetadataFieldOriginalTitle => 'Orihinal na pamagat';

  @override
  String get adminMetadataFieldPremiereDate => 'Petsa ng premiere (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Petsa ng pagtatapos (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Taon ng produksyon';

  @override
  String get adminMetadataFieldOfficialRating => 'Opisyal na rating';

  @override
  String get adminMetadataFieldCommunityRating => 'Rating ng komunidad';

  @override
  String get adminMetadataFieldCriticRating => 'Rating ng kritiko';

  @override
  String get adminMetadataFieldTagline => 'Tagline';

  @override
  String get adminMetadataFieldOverview => 'Pangkalahatang-ideya';

  @override
  String get adminMetadataGenres => 'Mga genre';

  @override
  String get adminMetadataTags => 'Mga tag';

  @override
  String get adminMetadataStudios => 'Mga studio';

  @override
  String get adminMetadataPeople => 'Mga tao';

  @override
  String get adminMetadataAddGenre => 'Magdagdag ng genre';

  @override
  String get adminMetadataAddTag => 'Magdagdag ng tag';

  @override
  String get adminMetadataAddStudio => 'Magdagdag ng studio';

  @override
  String get adminMetadataAddPerson => 'Magdagdag ng Tao';

  @override
  String get adminMetadataEditPerson => 'I-edit ang Tao';

  @override
  String get adminMetadataRole => 'Tungkulin';

  @override
  String get adminMetadataImagePrimary => 'Pangunahin';

  @override
  String get adminMetadataImageBackdrop => 'Backdrop';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'hinlalaki';

  @override
  String get adminMetadataRecursive => 'Recursive';

  @override
  String get adminMetadataProvider => 'Provider';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Na-update ang larawang $imageType';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Na-upload ang larawang $imageType';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Tinanggal ang larawang $imageType';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nabigong i-download ang larawan: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Nabigong basahin ang napiling larawan';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nabigong i-upload ang larawan: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Tanggalin ang larawang $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Inaalis nito ang kasalukuyang larawan mula sa item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nabigong tanggalin ang larawan: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Pumili ng larawang $imageType';
  }

  @override
  String get adminMetadataUpload => 'Mag-upload';

  @override
  String get adminMetadataUpdate => 'I-update';

  @override
  String get adminMetadataRemoteImage => 'Malayong larawan';

  @override
  String get adminPluginsInstalled => 'Naka-install';

  @override
  String get adminPluginsCatalog => 'Catalog';

  @override
  String get adminPluginsActive => 'Aktibo';

  @override
  String get adminPluginsRestart => 'I-restart';

  @override
  String get adminPluginsNoSearchResults =>
      'Walang mga plugin na tumutugma sa iyong paghahanap';

  @override
  String get adminPluginsNoneInstalled => 'Walang naka-install na plugin';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'May available na update: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Available ang update';

  @override
  String get adminPluginsPendingRemoval =>
      'Nakabinbing pag-alis pagkatapos ng pag-restart';

  @override
  String get adminPluginsChangesPending =>
      'Nakabinbing pag-restart ang mga pagbabago';

  @override
  String get adminPluginsEnable => 'Paganahin';

  @override
  String get adminPluginsDisable => 'Huwag paganahin';

  @override
  String get adminPluginsInstallUpdate => 'I-install ang update';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'I-install ang update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Walang mga pakete na tumutugma sa iyong paghahanap';

  @override
  String get adminPluginsCatalogEmpty => 'Walang available na package';

  @override
  String adminPluginsInstalling(String name) {
    return 'Ini-install ang \"$name\"...';
  }

  @override
  String get adminPluginDetailExperimental => 'Eksperimental na Pagsasama';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Eksperimento pa rin ang pagsasama ng mga setting ng plugin. Ang ilang mga field o layout ay maaaring hindi pa mag-render nang tama.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nabigong i-toggle ang plugin. Hindi mahanap ng server ang bersyon ng plugin na ito. Subukan ang pag-refresh ng mga plugin, pagkatapos ay subukang muli.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nabigong i-toggle ang plugin. Pakisuri ang mga log ng server para sa mga detalye.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Mga Setting ng $name';
  }

  @override
  String get adminPluginDetailDetails => 'Mga Detalye';

  @override
  String get adminPluginDetailDeveloper => 'Developer';

  @override
  String get adminPluginDetailRepository => 'Imbakan';

  @override
  String get adminPluginDetailBundled => 'Naka-bundle';

  @override
  String get adminPluginDetailEnablePlugin => 'Paganahin ang Plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'Kinakailangan ang pag-restart ng server para magkabisa ang mga pagbabago.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Aalisin ang plugin na ito pagkatapos mag-restart ang server.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Ang plugin na ito ay hindi gumagana at maaaring hindi gumana nang tama.';

  @override
  String get adminPluginDetailNotSupported =>
      'Ang plugin na ito ay hindi sinusuportahan ng kasalukuyang bersyon ng server.';

  @override
  String get adminPluginDetailSuperseded =>
      'Ang plugin na ito ay pinalitan ng isang mas bagong bersyon.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Nabigong i-load ang mga repository: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Alisin ang Repository';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Sigurado ka bang gusto mong alisin ang \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Alisin';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nabigong i-save ang mga repository: $error';
  }

  @override
  String get adminReposEmpty => 'Walang na-configure na mga repository';

  @override
  String get adminReposEmptySubtitle =>
      'Magdagdag ng repository upang mag-browse ng mga magagamit na plugin';

  @override
  String get adminReposUnnamed => '(walang pangalan)';

  @override
  String get adminReposEditTitle => 'I-edit ang Repository';

  @override
  String get adminReposAddTitle => 'Magdagdag ng Repository';

  @override
  String get adminReposUrl => 'URL ng imbakan';

  @override
  String get adminReposNameHint => 'hal. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Di-wastong URL';

  @override
  String get adminGeneralSettingsTitle => 'Mga Pangkalahatang Setting';

  @override
  String get adminGeneralMetadataLanguage => 'Ginustong wika ng metadata';

  @override
  String get adminGeneralMetadataLanguageHint => 'hal. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Ginustong metadata na bansa';

  @override
  String get adminGeneralMetadataCountryHint => 'hal. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Concurrency ng library scan';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limitasyon ng parallel image encoding';

  @override
  String get adminUnknownError => 'Hindi kilalang error';

  @override
  String get adminBrowse => 'Mag-browse';

  @override
  String get adminCloseBrowser => 'Isara ang browser';

  @override
  String get adminNetworkingTitle => 'Networking';

  @override
  String get adminNetworkingRestartWarning =>
      'Ang mga pagbabago sa mga setting ng networking ay maaaring mangailangan ng pag-restart ng server.';

  @override
  String get adminNetworkingRemoteAccess =>
      'Paganahin ang malayuang pag-access';

  @override
  String get adminNetworkingPorts => 'Mga daungan';

  @override
  String get adminNetworkingHttpPort => 'HTTP port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS port';

  @override
  String get adminNetworkingEnableHttps => 'Paganahin ang HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Lokal na Network';

  @override
  String get adminNetworkingLocalAddresses => 'Mga address ng lokal na network';

  @override
  String get adminNetworkingAddressHint => 'hal. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Mga kilalang proxy';

  @override
  String get adminNetworkingProxyHint => 'hal. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Whitelist';

  @override
  String get adminNetworkingBlacklist => 'Blacklist';

  @override
  String get adminNetworkingAddEntry => 'Magdagdag ng entry';

  @override
  String get adminBrandingTitle => 'Pagba-brand';

  @override
  String get adminBrandingLoginDisclaimer => 'Disclaimer sa pag-login';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML na ipinapakita sa ibaba ng login form';

  @override
  String get adminBrandingCustomCss => 'Custom na CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Inilapat ang custom na CSS sa web interface';

  @override
  String get adminBrandingEnableSplash => 'Paganahin ang splash screen';

  @override
  String get adminBrandingSplashUpload => 'Mag-upload ng larawan';

  @override
  String get adminBrandingSplashUploaded => 'Na-update ang splashscreen';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Nabigong i-upload ang splashscreen';

  @override
  String get adminBrandingSplashDeleted => 'Naalis ang splashscreen';

  @override
  String get adminBrandingNoSplash => 'Walang custom na splashscreen';

  @override
  String get adminPlaybackHwAccel => 'Pagpapabilis ng Hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Pagpapabilis ng hardware';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Paganahin ang pag-encode ng hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Paganahin ang hardware decoding para sa:';

  @override
  String get adminPlaybackQsvDevice => 'QSV device';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'I-enable ang enhanced NVDEC decoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Piliin ang system native hardware decoder';

  @override
  String get adminPlaybackColorDepth => 'Color depth ng hardware decoding';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC decoding';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 decoding';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit decoding';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit decoding';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardware encoding';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Payagan ang HEVC encoding';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Payagan ang AV1 encoding';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'I-enable ang Intel low-power H.264 encoder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'I-enable ang Intel low-power HEVC encoder';

  @override
  String get adminPlaybackToneMapping => 'Tone Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'I-enable ang tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'I-enable ang VPP tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'I-enable ang VideoToolbox tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algorithm ng tone mapping';

  @override
  String get adminPlaybackTonemappingMode => 'Mode ng tone mapping';

  @override
  String get adminPlaybackTonemappingRange => 'Range ng tone mapping';

  @override
  String get adminPlaybackTonemappingDesat => 'Desaturation ng tone mapping';

  @override
  String get adminPlaybackTonemappingPeak => 'Peak ng tone mapping';

  @override
  String get adminPlaybackTonemappingParam => 'Parameter ng tone mapping';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Brightness ng VPP tone mapping';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Contrast ng VPP tone mapping';

  @override
  String get adminPlaybackPresetsQuality => 'Mga Preset at Kalidad';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder preset';

  @override
  String get adminPlaybackH264Crf => 'H.264 encoding CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) encoding CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Paraan ng deinterlace';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Doblehin ang frame rate kapag nagde-deinterlace';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'I-enable ang audio VBR encoding';

  @override
  String get adminPlaybackDownmixBoost => 'Audio downmix boost';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo downmix algorithm';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Max na laki ng muxing queue';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Encoding';

  @override
  String get adminPlaybackEncodingThreads => 'Pag-encode ng mga thread';

  @override
  String get adminPlaybackFallbackFont => 'Paganahin ang fallback na font';

  @override
  String get adminPlaybackFallbackFontPath => 'Fallback font path';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Mga Audiobook';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimum na porsyento ng resume ng audiobook';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Pinakamataas na porsyento ng resume ng audiobook';

  @override
  String get adminStreamingBitrateLimit =>
      'Malayong limitasyon sa bitrate ng kliyente (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Mag-iwan ng walang laman o 0 para sa walang limitasyon';

  @override
  String get adminTrickplayHwAccel => 'Paganahin ang hardware acceleration';

  @override
  String get adminTrickplayHwEncoding => 'Paganahin ang pag-encode ng hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'I-enable ang key frame only extraction';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Mas mabilis ngunit mas mababang katumpakan';

  @override
  String get adminTrickplayNonBlocking => 'Hindi Pagba-block';

  @override
  String get adminTrickplayBlocking => 'Hinaharang';

  @override
  String get adminTrickplayPriorityHigh => 'Mataas';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Higit sa Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Mas mababa sa Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Idle';

  @override
  String get adminTrickplayImageSettings => 'Mga Setting ng Larawan';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Gaano kadalas kumuha ng mga frame';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Mga lapad ng pixel na pinaghihiwalay ng kuwit (hal. 320)';

  @override
  String get adminTrickplayQuality => 'Kalidad';

  @override
  String get adminTrickplayQScale => 'Sukat ng kalidad';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Mas mababang halaga = mas mahusay na kalidad, mas malalaking file';

  @override
  String get adminTrickplayJpegQuality => 'kalidad ng JPEG';

  @override
  String get adminTrickplayProcessing => 'Pinoproseso';

  @override
  String get adminTasksEmpty => 'Walang nakitang nakaiskedyul na gawain';

  @override
  String get adminTasksNoFilterMatch =>
      'Walang mga gawain na tumutugma sa kasalukuyang filter';

  @override
  String get adminTaskCancelling => 'Kinakansela...';

  @override
  String get adminTaskRunning => 'Tumatakbo...';

  @override
  String get adminTaskNeverRun => 'Huwag tumakbo';

  @override
  String get adminTaskStop => 'Ihinto';

  @override
  String get adminRunningTasks => 'Mga Tumatakbong Task';

  @override
  String get adminTaskRun => 'Takbo';

  @override
  String get adminTaskDetailLastExecution => 'Huling Pagbitay';

  @override
  String get adminTaskDetailStarted => 'Nagsimula';

  @override
  String get adminTaskDetailEnded => 'Natapos na';

  @override
  String get adminTaskDetailDuration => 'Tagal';

  @override
  String get adminTaskDetailErrorLabel => 'Error:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Araw-araw nang $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Tuwing $day nang $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Tuwing $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Sa pagsisimula ng application';

  @override
  String get adminTaskTriggerTypeDaily => 'Araw-araw';

  @override
  String get adminTaskTriggerTypeWeekly => 'Linggu-linggo';

  @override
  String get adminTaskTriggerTypeInterval => 'Sa isang pagitan';

  @override
  String get adminTaskTriggerIntervalLabel => 'Pagitan';

  @override
  String get adminTaskTriggerEveryHour => 'Bawat oras';

  @override
  String get adminTaskTriggerEvery6Hours => 'Bawat 6 na oras';

  @override
  String get adminTaskTriggerEvery12Hours => 'Bawat 12 oras';

  @override
  String get adminTaskTriggerEvery24Hours => 'Tuwing 24 na oras';

  @override
  String get adminTaskTriggerEvery2Days => 'Bawat 2 araw';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na oras',
      one: '1 oras',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Oras';

  @override
  String get adminTaskTriggerNoLimit => 'Walang limitasyon';

  @override
  String get adminActivityJustNow => 'Ngayon lang';

  @override
  String get adminActivityLastHour => 'Huling oras';

  @override
  String get adminActivityToday => 'Ngayong araw';

  @override
  String get adminActivityYesterday => 'Kahapon';

  @override
  String get adminActivityOlder => 'Mas matanda';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d ang nakalipas';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h ang nakalipas';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m ang nakalipas';
  }

  @override
  String get adminActivityNow => 'ngayon';

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
      'I-configure ang pagbuo ng trickplay na larawan para sa mga thumbnail ng preview ng paghahanap.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Pampublikong HTTPS port';

  @override
  String get adminNetworkingBaseUrl => 'Base URL';

  @override
  String get adminNetworkingBaseUrlHint => 'hal. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Public HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Mangailangan ng HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'I-redirect ang lahat ng remote request sa HTTPS. Walang epekto kung walang valid na certificate ang server.';

  @override
  String get adminNetworkingCertPassword => 'Password ng certificate';

  @override
  String get adminNetworkingIpSettings => 'Mga Setting ng IP';

  @override
  String get adminNetworkingEnableIpv4 => 'I-enable ang IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'I-enable ang IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'I-enable ang awtomatikong port mapping';

  @override
  String get adminNetworkingLocalSubnets => 'Mga LAN network';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Listahan ng mga IP address o CIDR subnet na pinaghihiwalay ng kuwit o linya, na ituturing na nasa lokal na network.';

  @override
  String get adminNetworkingPublishedUris => 'Mga na-publish na server URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      'I-map ang isang subnet o address sa isang na-publish na URL, hal. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Landas ng sertipiko';

  @override
  String get adminNetworkingRemoteIpFilter => 'Remote IP Filter';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Remote IP filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API device';

  @override
  String get adminPlaybackAutomatic => '0 = awtomatiko';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transcoding temp path';

  @override
  String get adminPlaybackSegmentDeletion =>
      'Payagan ang pagtanggal ng segment';

  @override
  String get adminPlaybackSegmentKeep => 'Panatilihin ang segment (segundo)';

  @override
  String get adminPlaybackThrottleBuffering => 'Pag-buffer ng throttle';

  @override
  String get adminPlaybackThrottleDelay => 'Throttle delay (segundo)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Payagan ang subtitle extraction on the fly';

  @override
  String get adminResumeMinPct => 'Minimum na porsyento ng resume';

  @override
  String get adminResumeMinPctSubtitle =>
      'Ang nilalaman ay dapat i-play na lampas sa porsyentong ito upang i-save ang pag-unlad';

  @override
  String get adminResumeMaxPct => 'Pinakamataas na porsyento ng resume';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Ang nilalaman ay itinuturing na ganap na nilalaro pagkatapos ng porsyentong ito';

  @override
  String get adminResumeMinDuration => 'Minimum na tagal ng resume (segundo)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Ang mga item na mas maikli kaysa dito ay hindi na maibabalik';

  @override
  String get adminTrickplayScanBehavior => 'Pag-uugali ng pag-scan';

  @override
  String get adminTrickplayProcessPriority => 'Priyoridad sa proseso';

  @override
  String get adminTrickplayTileWidth => 'Lapad ng tile';

  @override
  String get adminTrickplayTileHeight => 'Taas ng tile';

  @override
  String get adminTrickplayProcessThreads => 'Iproseso ang mga thread';

  @override
  String get adminTrickplayWidthResolutions => 'Mga resolusyon ng lapad';

  @override
  String get adminMetadataDefault => 'Default';

  @override
  String get adminMetadataContentTypeUpdated =>
      'Na-update ang uri ng nilalaman';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Nabigong i-update ang content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Mabagal na threshold ng pagtugon (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'I-enable ang mga babala sa mabagal na tugon';

  @override
  String get adminGeneralQuickConnect => 'I-enable ang Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Mga Path';

  @override
  String get adminGeneralSectionPerformance => 'Performance';

  @override
  String get adminGeneralCachePath => 'Cache path';

  @override
  String get adminGeneralMetadataPath => 'path ng metadata';

  @override
  String get adminGeneralServerName => 'Pangalan ng server';

  @override
  String get adminGeneralDisplayLanguage => 'Gustong wika ng display';

  @override
  String get adminSettingsLoadFailed => 'Nabigong i-load ang mga setting';

  @override
  String get adminDiscover => 'Tuklasin';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nabigong i-update ang mga mapping: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limitasyon sa oras: $duration';
  }

  @override
  String get folders => 'Mga folder';

  @override
  String get libraries => 'Mga library';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'Hindi pinagana ang SyncPlay';

  @override
  String get syncPlayDisabledMessage =>
      'Paganahin ang SyncPlay sa Mga Setting upang magamit ang naka-synchronize na pag-playback.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Hindi suportado ang server';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Ang SyncPlay ay nangangailangan ng isang Jellyfin server. Hindi ito sinusuportahan ng kasalukuyang server.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Pangkat';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay pangkat';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# na kalahok',
      one: '# kalahok',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Huwag pansinin ang paghihintay';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Huwag hawakan ang grupo habang buffer ang device na ito';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Magpatuloy nang lokal nang hindi naghihintay ng mabagal na miyembro';

  @override
  String get syncPlayRepeat => 'Ulitin';

  @override
  String get syncPlayRepeatOne => 'Isa';

  @override
  String get syncPlayShuffleModeShuffled => 'Binasa';

  @override
  String get syncPlayShuffleModeSorted => 'Inayos';

  @override
  String get syncPlaySyncCurrentQueue =>
      'I-sync ang kasalukuyang queue ng playback';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Palitan ang pila ng pangkat ng kung ano ang lokal na naglalaro';

  @override
  String get syncPlayLeaveGroup => 'Umalis sa grupo';

  @override
  String get syncPlayGroupQueue => 'Pila ng grupo';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Maglaro ngayon';

  @override
  String get syncPlayCreateNewGroup => 'Gumawa ng bagong grupo';

  @override
  String get syncPlayGroupName => 'Pangalan ng grupo';

  @override
  String get syncPlayDefaultGroupName => 'Aking SyncPlay Group';

  @override
  String get syncPlayCreateGroup => 'Lumikha ng pangkat';

  @override
  String get syncPlayAvailableGroups => 'Magagamit na mga grupo';

  @override
  String get syncPlayNoGroupsAvailable => 'Walang available na grupo';

  @override
  String get syncPlayJoinGroupQuestion => 'Sumali sa SyncPlay group?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Maaaring palitan ng pagsali sa isang pangkat ng SyncPlay ang iyong kasalukuyang pila sa pag-playback. Magpatuloy?';

  @override
  String get syncPlayJoin => 'Sumali';

  @override
  String get syncPlayStateIdle => 'Idle';

  @override
  String get syncPlayStateWaiting => 'Naghihintay';

  @override
  String get syncPlayStatePaused => 'Naka-pause';

  @override
  String get syncPlayStatePlaying => 'Naglalaro';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return 'Sumali si $userName sa SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return 'Umalis si $userName sa SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle =>
      'Tinanggihan ang pag-access sa SyncPlay';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Wala kang access sa isa o higit pang mga item sa pangkat ng SyncPlay na ito. Hilingin sa may-ari ng grupo na i-verify ang mga pahintulot sa library o pumili ng ibang queue.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Nagsi-sync ng playback sa $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'Hindi available ang paghahanap gamit ang boses.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Nabigo ang Dolby Vision Direct Play';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nabigong magsimula ang direktang pag-play para sa Dolby Vision stream na ito. Subukang muli gamit ang transcode ng server?';

  @override
  String get retryWithTranscode => 'Subukang muli gamit ang transcode';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Hindi Sinusuportahan ang Dolby Vision';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Hindi ma-decode ng device na ito nang direkta ang nilalaman ng Dolby Vision. Gumamit ng HDR10 fallback o humiling ng server transcoding.';

  @override
  String get rememberMyChoice => 'Tandaan ang aking pinili';

  @override
  String get playHdr10Fallback => 'Maglaro ng HDR10 fallback';

  @override
  String get requestTranscode => 'Humiling ng transcode';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# na row ang natuklasan',
      one: '# row ang natuklasan',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Tingnan Lahat';

  @override
  String get noItems => 'Walang item';

  @override
  String get switchUser => 'Lumipat ng User';

  @override
  String get remoteControl => 'Remote Control';

  @override
  String get mediaBarLoading => 'Nilo-load ang media bar...';

  @override
  String get mediaBarError => 'Nabigong mag-load ang media bar';

  @override
  String get offlineServerUnavailable =>
      'Nakakonekta sa internet, ngunit hindi available ang kasalukuyang server.';

  @override
  String get offlineNoInternet =>
      'Offline ka. Tanging na-download na nilalaman ang available.';

  @override
  String get offlineFileNotAvailable => 'Hindi available ang file';

  @override
  String get offlineSwitchServer => 'Lumipat ng Server';

  @override
  String get offlineSavedMedia => 'Naka-save na Media';

  @override
  String get offlineBannerTitle => 'Offline ka';

  @override
  String get offlineBannerSubtitle => 'Ipinapakita ang iyong mga download';

  @override
  String get offlineBannerAction => 'Mga Download';

  @override
  String get serverUnreachableBannerTitle => 'Hindi maabot ang iyong server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Nagpe-play mula sa mga download hanggang sa bumalik ito';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Remote Playback';

  @override
  String castControlFailed(String error) {
    return 'Nabigo ang kontrol ng cast: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Mga Kontrol ng $kind';
  }

  @override
  String get castDeviceVolume => 'Dami ng Device';

  @override
  String get castVolumeUnavailable => 'Hindi magagamit';

  @override
  String castStopKind(String kind) {
    return 'Ihinto ang $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Mga subtitle';

  @override
  String get pinConfirmTitle => 'Kumpirmahin ang PIN';

  @override
  String get pinSetTitle => 'Itakda ang PIN';

  @override
  String get pinEnterTitle => 'Ilagay ang PIN';

  @override
  String get pinReenterToConfirm =>
      'Ipasok muli ang iyong PIN upang kumpirmahin';

  @override
  String pinEnterNDigit(int length) {
    return 'Maglagay ng $length-digit na PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Ilagay ang iyong $length-digit na PIN';
  }

  @override
  String get pinIncorrect => 'Maling PIN';

  @override
  String get pinMismatch => 'Hindi tugma ang mga PIN';

  @override
  String get pinForgot => 'Nakalimutan ang PIN?';

  @override
  String get pinClear => 'I-clear';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Pinahintulutan ang kahilingan sa Quick Connect.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Ang Quick Connect code ay hindi wasto o nag-expire.';

  @override
  String get quickConnectNotSupported =>
      'Ang Quick Connect ay hindi suportado sa server na ito.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nabigong pahintulutan ang Quick Connect code.';

  @override
  String get quickConnectDisabled =>
      'Naka-disable ang Quick Connect sa server na ito.';

  @override
  String get quickConnectForbidden =>
      'Hindi maaaring pahintulutan ng iyong account ang kahilingan sa Quick Connect na ito.';

  @override
  String get quickConnectNotFound =>
      'Hindi nahanap ang Quick Connect code. Subukan ang isang bagong code.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Nabigo ang Quick Connect: $message';
  }

  @override
  String get quickConnectEnterCode => 'Ipasok ang code';

  @override
  String get quickConnectAuthorize => 'Pahintulutan';

  @override
  String remoteCommandFailed(String error) {
    return 'Nabigo ang command: $error';
  }

  @override
  String get remoteControlTitle => 'Remote Control';

  @override
  String get remoteFailedToLoadSessions => 'Nabigong i-load ang mga session';

  @override
  String get remoteNoSessions => 'Walang nakokontrol na mga session';

  @override
  String get remoteStartPlayback => 'Simulan ang pag-playback sa ibang device';

  @override
  String get unknownUser => 'Hindi kilala';

  @override
  String get unknownItem => 'Hindi kilala';

  @override
  String get remoteNothingPlaying => 'Walang naglalaro sa session na ito';

  @override
  String get castingStarted => 'Nagsimula ang pag-cast sa napiling device';

  @override
  String castingFailed(String error) {
    return 'Nabigong simulan ang casting: $error';
  }

  @override
  String get noRemoteDevices => 'Walang available na remote playback device.';

  @override
  String get noRemoteDevicesIos =>
      'Walang available na remote playback device.\n\nSa iOS, maaaring hindi available ang mga target ng AirPlay sa simulator.';

  @override
  String get trackActionPlayNext => 'I-play Susunod';

  @override
  String get trackActionAddToQueue => 'Idagdag sa Queue';

  @override
  String get trackActionAddToPlaylist => 'Idagdag sa Playlist';

  @override
  String get trackActionCancelDownload => 'Kanselahin ang Pag-download';

  @override
  String get trackActionDeleteFromPlaylist => 'Tanggalin sa Playlist';

  @override
  String get trackActionMoveUp => 'Ilipat Pataas';

  @override
  String get trackActionMoveDown => 'Ilipat Pababa';

  @override
  String get trackActionRemoveFromFavorites => 'Alisin sa Mga Paborito';

  @override
  String get trackActionAddToFavorites => 'Idagdag sa Mga Paborito';

  @override
  String get trackActionGoToAlbum => 'Pumunta sa Album';

  @override
  String get trackActionGoToArtist => 'Pumunta sa Artist';

  @override
  String trackActionDownloading(String name) {
    return 'Nagda-download ng $name...';
  }

  @override
  String get trackActionDeletedFile => 'Tinanggal ang na-download na file';

  @override
  String get trackActionDeleteFileFailed =>
      'Hindi matanggal ang na-download na file';

  @override
  String get shuffleBy => 'Balasahin Ni';

  @override
  String get shuffleSelectLibrary => 'Piliin ang Library';

  @override
  String get shuffleSelectGenre => 'Piliin ang Genre';

  @override
  String get shuffleLibrary => 'Library';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Walang magagamit na mga katugmang aklatan.';

  @override
  String get shuffleNoGenres =>
      'Walang nakitang genre para sa shuffle mode na ito.';

  @override
  String get posterDisplayTitle => 'Pagpapakita';

  @override
  String get posterImageType => 'Uri ng Larawan';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Thumbnail';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed => 'Nabigong idagdag sa playlist';

  @override
  String get playlistCreateFailed => 'Nabigong gumawa ng playlist';

  @override
  String get playlistNew => 'Bagong Playlist';

  @override
  String get playlistCreate => 'Lumikha';

  @override
  String get playlistCreateNew => 'Gumawa ng Bagong Playlist';

  @override
  String get playlistNoneFound => 'Walang nakitang mga playlist';

  @override
  String get addToPlaylist => 'Idagdag sa Playlist';

  @override
  String get lyricsNotAvailable => 'Walang available na lyrics';

  @override
  String get upNext => 'Susunod';

  @override
  String get playNext => 'I-play Susunod';

  @override
  String get stillWatchingContent =>
      'Na-pause ang pag-playback. Nanonood ka pa ba?';

  @override
  String get stillWatchingStop => 'Ihinto';

  @override
  String get stillWatchingContinue => 'Magpatuloy';

  @override
  String skipSegment(String segment) {
    return 'Laktawan ang $segment';
  }

  @override
  String get liveTv => 'Live na TV';

  @override
  String get continueWatchingAndNextUp => 'Magpatuloy sa Panonood at Susunod';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Nagda-download ng $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Nagda-download ng $fileName';
  }

  @override
  String get nextEpisode => 'Susunod na Episode';

  @override
  String get moreFromThisSeason => 'Higit Pa Mula sa Season na Ito';

  @override
  String get playerTooltipPlaybackSpeed => 'Bilis ng playback';

  @override
  String get playerTooltipCastControls => 'Mga kontrol sa cast';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Ipasok ang fullscreen';

  @override
  String get playerTooltipExitFullscreen => 'Lumabas sa fullscreen';

  @override
  String get playerTooltipFloatOnTop => 'Lutang sa itaas';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Huwag paganahin ang float sa itaas';

  @override
  String get playerTooltipLockLandscape => 'I-lock ang landscape';

  @override
  String get playerTooltipUnlockOrientation => 'Payagan ang pag-ikot';

  @override
  String get playerTooltipPrevious => 'Nakaraan';

  @override
  String get playerTooltipSeekBack => 'Balikan';

  @override
  String get playerTooltipSeekForward => 'Humanap ng pasulong';

  @override
  String get contextMenuMarkWatched => 'Markahan bilang Napanood';

  @override
  String get contextMenuMarkUnwatched => 'Markahan bilang Hindi Napanood';

  @override
  String get contextMenuAddToFavorites => 'Idagdag sa Mga Paborito';

  @override
  String get contextMenuRemoveFromFavorites => 'Alisin sa Mga Paborito';

  @override
  String get contextMenuGoToSeries => 'Pumunta sa Serye';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Itago mula sa Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Itago mula sa Next Up';

  @override
  String get contextMenuAddToCollection => 'Idagdag sa Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'I-access ang panel ng pangangasiwa ng server';

  @override
  String get settingsAccountSecurity => 'Account at Seguridad';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Authentication, PIN code, at parental controls';

  @override
  String get settingsPersonalization => 'Personalization';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, nabigasyon, home row, at visibility ng library';

  @override
  String get settingsDynamicContent => 'Dynamic na Nilalaman';

  @override
  String get settingsDynamicContentSubtitle =>
      'Media Bar at mga visual na overlay';

  @override
  String get settingsPlaybackSyncplay => 'Playback at SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Mga setting ng audio/video, subtitle, pag-download, at mga kontrol ng SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin sync, Seerr, mga rating, at higit pa';

  @override
  String get settingsAboutSubtitle =>
      'Bersyon ng app, legal na impormasyon, at mga kredito';

  @override
  String get settingsAuthenticationSection => 'AUTENTICATION';

  @override
  String get settingsSortServersBy => 'Pagbukud-bukurin ang mga Server Ayon sa';

  @override
  String get settingsLastUsed => 'Huling Ginamit';

  @override
  String get settingsAlphabetical => 'Alpabetiko';

  @override
  String get settingsConnectionSection => 'KONEKSYON';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Payagan ang mga self-signed na certificate';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Pagkatiwalaan ang mga server na gumagamit ng self-signed o private-CA na TLS certificate. I-enable lang para sa mga server na kontrolado mo. Ide-disable nito ang certificate validation para sa lahat ng koneksyon.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACY at KALIGTASAN';

  @override
  String get settingsBlockedRatings => 'Mga Naka-block na Rating';

  @override
  String get settingsGeneralStyle => 'Pangkalahatang Estilo';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Mga accent ng tema, backdrop, napanood na indicator, at theme music';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Istilo, background blur, at kilos ng tab';

  @override
  String get settingsHomePage => 'Home Page';

  @override
  String get settingsHomePageSubtitle =>
      'Mga seksyon, uri ng larawan, overlay, at preview ng media';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibility ng library, view ng folder, at gawi ng multi-server';

  @override
  String get settingsTwentyFourHourClock => '24-Oras na Orasan';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Gumamit ng 24 na oras na pag-format ng oras saanman ipinapakita ang orasan';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Ipakita ang shuffle button sa navigation bar';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Ipakita ang pindutan ng genre sa navigation bar';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Ipakita ang pindutan ng mga paborito sa navigation bar';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Ipakita ang pindutan ng mga aklatan sa navigation bar';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Ipakita ang Seerr button sa navigation bar';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Palaging ipakita ang mga text label sa itaas na navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'I-toggle ang visibility ng home page sa bawat library. I-restart ang Moonfin para magkabisa ang mga pagbabago.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Media Bar at Local Previews';

  @override
  String get settingsVisualOverlays => 'Mga Visual na Overlay';

  @override
  String get settingsSeasonalSurprise => 'Pana-panahong Sorpresa';

  @override
  String get settingsMetadataAndRatings => 'Metadata at Mga Rating';

  @override
  String get settingsPluginScreenDescription =>
      'Pinapalakas ng Moonbase ang mga pagsasama sa panig ng server kabilang ang mga karagdagang mapagkukunan ng rating, mga kahilingan sa Seerr, at mga naka-sync na kagustuhan.';

  @override
  String get settingsOfflineDownloads => 'Mga Offline na Download';

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
  String get settingsHigh => 'Mataas';

  @override
  String get settingsLow => 'Mababa';

  @override
  String get settingsCustomPath => 'Custom na Path';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Ipasok ang landas ng pag-download ng folder';

  @override
  String get settingsConcurrentDownloads => 'Mga Kasabay na Pag-download';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Pinakamataas na bilang ng mga item na ida-download nang sabay-sabay.';

  @override
  String get settingsAppInfo => 'IMPORMASYON NG APP';

  @override
  String get settingsReportAnIssue => 'Mag-ulat ng Isyu';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Buksan ang tracker ng isyu sa GitHub';

  @override
  String get settingsJoinDiscord => 'Sumali sa Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Makipag-chat sa komunidad';

  @override
  String get settingsJoinTheDiscord => 'Sumali sa Discord';

  @override
  String get settingsSupportMoonfin => 'Suportahan ang Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Mag-donate ng kape sa developer';

  @override
  String get settingsLegal => 'LEGAL';

  @override
  String get settingsLicenses => 'Mga lisensya';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Open-source na mga paunawa sa lisensya';

  @override
  String get settingsPrivacyPolicy => 'Patakaran sa Privacy';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Paano pinangangasiwaan ng Moonfin ang iyong data';

  @override
  String get settingsCheckForUpdates => 'Tingnan ang Mga Update';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Tingnan ang pinakabagong release ng Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Pinapatakbo ng Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# na license notice',
      one: '# license notice',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'pareho';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Balasahin ang Filter ng Uri ng Nilalaman';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Mga Kagustuhan sa Pag-playback ng Video';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Mga setting ng pangunahing video engine at kalidad ng streaming';

  @override
  String get settingsAudioPreferences => 'Mga Kagustuhan sa Audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Mga pagpipilian sa audio track, pagproseso, at passthrough';

  @override
  String get settingsAutomationAndQueue => 'Automation at Queue';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automated playback at sequencing';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kalidad ng pag-download, mga limitasyon sa storage, at laki ng pila';

  @override
  String get settingsSyncplaySubtitle =>
      'Logic ng pag-synchronize para sa mga session ng grupo';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Mga tampok na dalubhasang manlalaro. Gumamit nang may pag-iingat, dahil maaaring magdulot ng mga isyu sa pag-playback ang ilang opsyon';

  @override
  String get settingsSkipIntrosAndOutros => 'Laktawan ang Intro at Outros?';

  @override
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Wala';

  @override
  String get settingsPromptUser => 'Itanong sa User';

  @override
  String get settingsSkip => 'Laktawan';

  @override
  String get settingsDoNothing => 'Walang Gawin';

  @override
  String get settingsMaxBitrateDescription =>
      'Takpan ang streaming bitrate. Ang nilalaman sa itaas ng threshold na ito ay ita-transcode upang magkasya.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limitahan ang maximum na resolution na hihilingin ng player. Ita-transcode pababa ang content na mas mataas ang resolution.';

  @override
  String get settingsPlayerZoomDescription =>
      'Paano dapat i-scale ang video upang magkasya sa screen.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Piliin ang default na playback engine sa mga Android TV device. Nalalapat ang mga pagbabago sa susunod na session ng pag-playback.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (inirerekomenda)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (legacy)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (inirerekomenda)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Fallback';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Gawi para sa mga pamagat ng Dolby Vision sa mga device na walang Dolby Vision decoding.';

  @override
  String get settingsAskEachTime => 'Magtanong sa bawat oras';

  @override
  String get settingsPreferHdr10Fallback => 'Mas gusto ang HDR10 fallback';

  @override
  String get settingsPreferServerTranscode =>
      'Mas gusto ang transcode ng server';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Direct Play';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Kinokontrol kung ang Dolby Vision profile 7 na mga stream ng enhancement-layer ay dapat magdirekta ng pag-play.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (naka-enable ang AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'Naka-enable sa device na ito';

  @override
  String get settingsDisabledPreferTranscode =>
      'Naka-disable (mas gusto ang transcode)';

  @override
  String get settingsResumeRewindDescription =>
      'Kapag ipinagpatuloy ang pag-playback (mula sa Magpatuloy sa Panonood o isang pahina ng item sa media), ilang segundo ang dapat i-rewound?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Kapag ipinagpatuloy ang pag-playback pagkatapos pindutin ang pindutan ng pause, ilang segundo ang dapat i-rewound?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Ilang segundo upang tumalon pabalik pagkatapos pindutin ang rewind button.';

  @override
  String get settingsOneSecond => '1 segundo';

  @override
  String get settingsThreeSeconds => '3 segundo';

  @override
  String get settingsFortyFiveSeconds => '45 segundo';

  @override
  String get settingsSixtySeconds => '60 segundo';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Ilang segundo upang tumalon pasulong pagkatapos pindutin ang pindutan ng fast forward.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 sa panlabas na decoder';

  @override
  String get settingsCinemaMode => 'Cinema Mode';

  @override
  String get settingsCinemaModeSubtitle =>
      'Maglaro ng mga trailer/preroll bago ang isang pangunahing tampok';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended ay nagpapakita ng isang buong card na may episode artwork at paglalarawan. Minimal ay nagpapakita ng isang compact countdown overlay. Ang hindi pinagana ay ganap na nagtatago ng prompt.';

  @override
  String get settingsShort => 'Maikli';

  @override
  String get settingsLong => 'Mahaba';

  @override
  String get settingsVeryLong => 'Napakahaba';

  @override
  String get settingsVideoStartDelay => 'Pagkaantala ng Pagsisimula ng Video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Live na TV Direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Paganahin ang direktang pag-play para sa Live TV';

  @override
  String get settingsOpenGroups => 'Buksan ang Mga Grupo';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Lumikha, sumali, o pamahalaan ang mga pangkat ng SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'Naka-enable ang SyncPlay';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Paganahin ang mga feature sa panonood ng grupo';

  @override
  String get settingsSyncplayButton => 'Pindutan ng SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Ipakita ang SyncPlay button sa navigation bar';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Advanced na Pagwawasto';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'I-enable ang fine-grained sync logic';

  @override
  String get settingsSyncplaySyncCorrection => 'Pagwawasto ng Sync';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Awtomatikong isaayos ang pag-playback upang manatiling naka-sync';

  @override
  String get settingsSyncplaySpeedToSync => 'Bilis sa Pag-sync';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Gamitin ang pagsasaayos ng bilis ng pag-playback upang mag-sync';

  @override
  String get settingsSyncplaySkipToSync => 'Lumaktaw sa Sync';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Gamitin ang paghahanap upang mag-sync';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimum na Bilis ng Pagkaantala';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Pinakamataas na Bilis ng Pagkaantala';

  @override
  String get settingsSyncplaySpeedDuration => 'Bilis ng Tagal';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Pinakamababang Pagkaantala sa Paglaktaw';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Dagdag na Offset';

  @override
  String get onNow => 'Sa Ngayon';

  @override
  String get collections => 'Mga koleksyon';

  @override
  String get lastPlayed => 'Huling Naglaro';

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
    return 'Kamakailang Inilabas na $libraryName';
  }

  @override
  String get autoplayNextEpisode =>
      'Awtomatikong I-play ang Susunod na Episode';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Awtomatikong i-play ang susunod na episode kapag available.';

  @override
  String get skipSilenceTitle => 'Laktawan ang katahimikan';

  @override
  String get skipSilenceSubtitle =>
      'Awtomatikong laktawan ang mga tahimik na audio segment kapag sinusuportahan ng stream.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Payagan ang mga external na audio effect';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Payagan ang mga equalizer at effects app (hal. Wavelet) na kumabit sa mga Media3 playback session.';

  @override
  String get disableTunnelingTitle => 'I-disable ang tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Piliting non-tunneled ang playback. Kapaki-pakinabang sa mga device na may audio/video discontinuity sa tunneling.';

  @override
  String get enableTunnelingTitle => 'I-enable ang tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Advanced. Idinadaan ang audio at video sa isang coupled na hardware path. Naka-off bilang default dahil nagdudulot ito ng audio/video dropout sa ilang device.';

  @override
  String get mapDolbyVisionP7Title =>
      'I-map ang Dolby Vision profile 7 sa HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'I-play ang mga Dolby Vision profile 7 stream bilang HDR10-compatible na HEVC sa mga non-DV device.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Gamitin ang mga embedded na estilo ng subtitle';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Ilapat ang mga kulay, font, at posisyon na naka-embed sa subtitle track. I-disable para gamitin ang iyong mga kagustuhan sa estilo ng caption.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Gamitin ang mga embedded na laki ng font ng subtitle';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Ilapat ang mga font-size hint na naka-embed sa subtitle track. I-disable para gamitin ang laki ng subtitle mula sa iyong mga kagustuhan sa estilo.';

  @override
  String get showMediaDetailsOnLibraryPage =>
      'Ipakita ang Mga Detalye ng Media';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Ipakita ang mga detalye ng napiling item sa itaas ng mga Library page.';

  @override
  String get hideBackdropsInLibraries =>
      'Itago ang Mga Backdrop habang Nagba-browse?';

  @override
  String get useDetailedSubHeadings =>
      'Gamitin ang Mga Detalyadong Sub-Heading';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Ipakita ang detalyado o minimal na subrow sa mga Library page.';

  @override
  String get savedThemesDeleteDialogTitle =>
      'Tanggalin ang naka-save na theme?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Alisin ang \"$themeName\" mula sa cache ng device na ito?';
  }

  @override
  String get themeStore => 'Theme Store';

  @override
  String get themeStoreSubtitle =>
      'Mag-browse at mag-save ng mga community theme';

  @override
  String get themeStoreDescription =>
      'Mag-save ng theme para magamit ito tulad ng iyong ibang naka-save na theme.';

  @override
  String get themeStoreEmpty => 'Walang available na theme sa ngayon.';

  @override
  String get themeStoreLoadFailed =>
      'Hindi ma-load ang Theme Store. Suriin ang iyong koneksyon at subukan muli.';

  @override
  String get themeStoreSave => 'I-save';

  @override
  String get themeStoreSaveAndApply => 'I-save at ilapat';

  @override
  String get themeStoreSaved => 'Na-save';

  @override
  String get themeStoreInvalidMessage => 'Hindi ma-load ang theme na ito.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Na-save ang \"$themeName\".';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Tinanggal ang \"$themeName\" mula sa device na ito.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Hindi matanggal ang \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Mga naka-save na theme';

  @override
  String get savedThemesDescription =>
      'Ito ang mga theme na na-download mula sa Moonfin plugin para sa kasalukuyang server. Ang pagtanggal ay nag-aalis lamang ng lokal na kopyang ito.';

  @override
  String get savedThemesEmpty =>
      'Walang nakitang naka-save na theme para sa server na ito.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Kasalukuyang aktibo';
  }

  @override
  String get savedThemesDeleteTooltip => 'Tanggalin ang naka-save na theme';

  @override
  String get savedThemesManageSubtitle =>
      'Pamahalaan ang mga na-download na plugin theme sa device na ito';

  @override
  String get themeEditor => 'Theme Editor';

  @override
  String get themeEditorSubtitle =>
      'Buksan ang Moonfin Theme Editor sa iyong browser';

  @override
  String get homeScreen => 'Home Screen';

  @override
  String get bottomBar => 'Bottom Bar';

  @override
  String get homeRowsStyleClassic => 'Classic';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Mga Home Row';

  @override
  String get homeRowDisplay => 'Display ng Home Row';

  @override
  String get homeRowSections => 'Mga Seksyon ng Home Row';

  @override
  String get homeRowToggles => 'Mga Toggle ng Home Row';

  @override
  String get homeRowTogglesSubtitle =>
      'I-enable o i-disable ang mga library-based na kategorya ng home row';

  @override
  String get homeRowTogglesDescription =>
      'I-enable ang mga sumusunod na toggle para ipakita ang mga row sa Mga Home Section.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Pinapanatili ng Classic ang per-row na uri ng larawan at info overlay. Gumagamit ang Modern ng mga portrait-to-backdrop na row.';

  @override
  String get displayFavoritesRows => 'Ipakita ang Mga Favorites Row';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Ipakita ang Mga Paboritong Pelikula, Serye, at iba pang paboritong row sa Mga Home Section.';

  @override
  String get favoritesRowSorting => 'Pag-sort ng Favorites Row';

  @override
  String get favoritesRowSortingDescription =>
      'I-sort ang mga Favorites row ayon sa petsang idinagdag, petsa ng paglabas, alpabetiko, at higit pa.';

  @override
  String get displayCollectionsRows => 'Ipakita ang Mga Collections Row';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Ipakita ang mga Collections row sa Mga Home Section.';

  @override
  String get collectionsRowSorting => 'Pag-sort ng Collections Row';

  @override
  String get collectionsRowSortingDescription =>
      'I-sort ang mga Collections row ayon sa petsang idinagdag, petsa ng paglabas, alpabetiko, at higit pa.';

  @override
  String get displayGenresRows => 'Ipakita ang Mga Genres Row';

  @override
  String get displayGenresRowsSubtitle =>
      'Ipakita ang mga Genres row sa Mga Home Section.';

  @override
  String get genresRowSorting => 'Pag-sort ng Genres Row';

  @override
  String get genresRowSortingDescription =>
      'I-sort ang mga Genres row ayon sa petsang idinagdag, petsa ng paglabas, alpabetiko, at higit pa.';

  @override
  String get genresRowItems => 'Mga Item ng Genres Row';

  @override
  String get genresRowItemsDescription =>
      'Ipakita ang Mga Pelikula, Serye, o pareho sa mga Genres row.';

  @override
  String get displayPlaylistsRows => 'Ipakita ang Mga Playlist Row';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Ipakita ang mga Playlist row sa Mga Home Section.';

  @override
  String get playlistsRowSorting => 'Pag-sort ng Playlist Row';

  @override
  String get playlistsRowSortingDescription =>
      'I-sort ang mga Playlist row ayon sa petsang idinagdag, petsa ng paglabas, alpabetiko, at higit pa.';

  @override
  String get displayAudioRows => 'Ipakita ang Mga Audio Row';

  @override
  String get displayAudioRowsSubtitle =>
      'Ipakita ang mga Audio row sa Mga Home Section.';

  @override
  String get audioRowsSorting => 'Pag-sort ng Audio Row';

  @override
  String get audioRowsSortingDescription =>
      'I-sort ang mga Audio row ayon sa petsang idinagdag, petsa ng paglabas, alpabetiko, at higit pa.';

  @override
  String get audioPlaylists => 'Mga Audio Playlist';

  @override
  String get appearance => 'Hitsura';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Theme';

  @override
  String get keyboard => 'Keyboard';

  @override
  String get navButtons => 'Mga Button';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV configuration';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

  @override
  String get externalPlayerAppDescription =>
      'Magtakda ng external player para i-enable ang long-press play na opsyon';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Ipakita ang app chooser kapag nagsimula ang playback.';

  @override
  String get loadingInstalledPlayers =>
      'Nilo-load ang mga naka-install na player...';

  @override
  String get connection => 'Koneksyon';

  @override
  String get audioTranscodeTarget => 'Audio Transcode Target';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Suportado sa device na ito';

  @override
  String get notSupportedOnThisDevice => 'Hindi Suportado sa device na ito';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Passthrough';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) sa external decoder.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD na may Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Kilos ng Media Player';

  @override
  String get playbackEnhancements => 'Mga Pagpapahusay sa Playback';

  @override
  String get alwaysOn => 'Palaging naka-on.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Palitan ang Skip Outro ng Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Ipakita ang Next Up overlay sa halip na ang Skip Outro button.';

  @override
  String get playerRouting => 'Player Routing';

  @override
  String get preferSoftwareDecoders => 'Piliin ang mga software decoder';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Gamitin ang FFmpeg (audio) at libgav1 (AV1) bago ang mga hardware decoder. I-disable kung nasisira ang HDMI audio passthrough.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Buksan ang video playback sa iyong napiling external app sa Android TV.';

  @override
  String get automaticQueuing => 'Automatic Queuing';

  @override
  String get preferSdhSubtitles => 'Piliin ang mga SDH subtitle';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Unahin ang mga SDH/CC subtitle track kapag awtomatikong pumipili.';

  @override
  String get webDiagnostics => 'Web diagnostics';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web Diagnostics';

  @override
  String get webDiagnosticsIntro =>
      'Gamitin ang page na ito para i-diagnose ang mga isyu sa connectivity ng browser (CORS, mixed content, at mga discovery setting).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Natukoy na Mixed-Content Failure';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Natukoy na CORS/Preflight Failure';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Nakakita ang Moonfin ng HTTPS page na sumusubok tumawag sa isang HTTP server URL. Bina-block ng mga browser ang request na ito bago ito umabot sa iyong server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Nakakita ang Moonfin ng browser-level na request failure na karaniwang sanhi ng kulang na CORS o preflight header sa media server.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Target na URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalye: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Kasalukuyang Runtime Context';

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
  String get webDiagnosticsDefaultServerUrl => 'Default na Server URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery Proxy URL';

  @override
  String get notConfigured => 'hindi naka-configure';

  @override
  String get webDiagnosticsMixedContent => 'Mixed Content';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Nilo-load ang page na ito sa HTTPS, ngunit isa o higit pang naka-configure na URL ang HTTP. Bina-block ng mga browser ang mga HTTPS page sa pagtawag sa mga HTTP API.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Ayos: ihatid ang iyong media server o proxy endpoint sa pamamagitan ng HTTPS, o i-load ang Moonfin sa HTTP sa mga pinagkakatiwalaang lokal na network lamang.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Walang malinaw na mixed-content na configuration na natukoy mula sa kasalukuyang mga runtime setting.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS Checklist';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Payagan ang browser origin sa Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Isama ang Authorization, X-Emby-Authorization, at X-Emby-Token sa Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Ilantad ang Content-Range at Accept-Ranges para sa streaming at seek behavior.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Magbalik ng 204 sa mga OPTIONS preflight request.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Halimbawang Header Snippet (nginx-style)';

  @override
  String get note => 'Tandaan';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ang diagnostics route na ito ay para sa mga web build. Kung nakikita mo ito sa ibang platform, maaaring hindi nalalapat ang mga pagsusuring ito.';

  @override
  String get backToServerSelect => 'Bumalik sa Pagpili ng Server';

  @override
  String get signOutAllUsers => 'I-sign Out ang Lahat ng User';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Permanenteng tinanggihan ang pahintulot sa mikropono. I-enable ito sa mga system setting.';

  @override
  String get voiceSearchPermissionRequired =>
      'Kailangan ang pahintulot sa mikropono para sa voice search.';

  @override
  String get voiceSearchNoMatch => 'Hindi ko naintindihan iyon. Subukan muli.';

  @override
  String get voiceSearchNoSpeechDetected => 'Walang natukoy na pananalita.';

  @override
  String get voiceSearchMicrophoneError => 'Error sa mikropono.';

  @override
  String get voiceSearchNeedsInternet =>
      'Kailangan ng internet ang voice search.';

  @override
  String get voiceSearchServiceBusy => 'Abala ang voice service. Subukan muli.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Permanenteng tinanggihan ang pahintulot sa mikropono.';

  @override
  String get microphonePermissionDenied =>
      'Tinanggihan ang pahintulot sa mikropono.';

  @override
  String get speechRecognitionUnavailable =>
      'Hindi available ang speech recognition sa device na ito.';

  @override
  String get openIosRoutePicker => 'Buksan ang iOS route picker';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Hindi available ang AirPlay route picker sa device na ito.';

  @override
  String get videos => 'Mga Video';

  @override
  String get programs => 'Mga Programa';

  @override
  String get songs => 'Mga Kanta';

  @override
  String get photoAlbums => 'Mga Photo Album';

  @override
  String get photos => 'Mga Larawan';

  @override
  String get people => 'Mga Tao';

  @override
  String get recentlyReleasedEpisodes => 'Kamakailang Inilabas na Mga Episode';

  @override
  String get watchAgain => 'Panoorin Muli';

  @override
  String get guestAppearances => 'Mga Guest Appearance';

  @override
  String get appearancesSeerr => 'Mga Appearance (Seerr)';

  @override
  String get crewContributionsSeerr => 'Mga Kontribusyon ng Crew (Seerr)';

  @override
  String get watchWithGroup => 'Manood kasama ang grupo';

  @override
  String get errors => 'Mga Error';

  @override
  String get warnings => 'Mga Babala';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Buksan sa Browser';

  @override
  String get embeddedBrowserNotAvailable =>
      'Hindi available ang embedded browser sa platform na ito.';

  @override
  String get adminRestartServerConfirmation =>
      'Sigurado ka bang gusto mong i-restart ang server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Sigurado ka bang gusto mong i-shut down ang server? Kakailanganin mong i-restart ito nang manu-mano.';

  @override
  String get internal => 'Internal';

  @override
  String get idle => 'Idle';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Walang nakitang user';

  @override
  String get adminNoUsersMatchSearch =>
      'Walang user na tumutugma sa iyong paghahanap';

  @override
  String get adminNoDevicesFound => 'Walang nakitang device';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Walang device na tumutugma sa kasalukuyang mga filter';

  @override
  String get passwordSet => 'Naitakda ang password';

  @override
  String get noPasswordConfigured => 'Walang naka-configure na password';

  @override
  String get remoteAccess => 'Remote Access';

  @override
  String get localOnly => 'Lokal Lamang';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Nabigong i-load ang media analytics';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Pinagsamang analytics sa lahat ng media library.';

  @override
  String get analyticsTopArtists => 'Nangungunang Mga Artist';

  @override
  String get analyticsTopAuthors => 'Nangungunang Mga May-akda';

  @override
  String get analyticsTopContributors => 'Nangungunang Mga Kontribyutor';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count na Library',
      one: '1 Library',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Wala pang available na indexed media total para sa piniling ito.';

  @override
  String get analyticsLibraryDetails => 'Mga Detalye ng Library';

  @override
  String get analyticsLibraryBreakdown => 'Breakdown ng Library';

  @override
  String get analyticsNoLibrariesAvailable => 'Walang available na library.';

  @override
  String get adminServerAdministrationTitle => 'Administrasyon ng Server';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Image Cache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Mga Log';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transcode';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Walang server path na ibinalik ng server na ito.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ang nagamit';
  }

  @override
  String get userActivity => 'Aktibidad ng User';

  @override
  String get systemEvents => 'Mga Kaganapan sa System';

  @override
  String get needsAttention => 'Kailangan ng Atensyon';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Playback';

  @override
  String get adminDrawerSectionDevices => 'Mga Device';

  @override
  String get adminDrawerSectionAdvanced => 'Advanced';

  @override
  String get adminDrawerSectionPlugins => 'Mga Plugin';

  @override
  String get adminDrawerSectionLiveTv => 'Live na TV';

  @override
  String get homeVideos => 'Mga Home Video';

  @override
  String get mixedContent => 'Mixed Content';

  @override
  String get homeVideosAndPhotos => 'Mga Home Video at Larawan';

  @override
  String get mixedMoviesAndShows => 'Halong Mga Pelikula at Palabas';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Walang nakitang recording';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Walang nakitang image page sa loob ng .$extension archive.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Nabigo ang embedded renderer ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Nabigo ang EPUB renderer ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Nawawalang lokal na file para sa reader: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status habang binubuksan ang data ng aklat mula sa $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Walang available na nababasang book endpoint';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Hindi suportadong format ng comic archive: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Hindi available ang CBR extraction plugin sa platform na ito.';

  @override
  String get failedToExtractCbrArchive =>
      'Nabigong i-extract ang .cbr archive.';

  @override
  String get cb7ExtractionUnavailable =>
      'Hindi available ang CB7 extraction sa platform na ito.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Hindi available ang CB7 extraction plugin sa platform na ito.';

  @override
  String get closeGenrePanel => 'Isara ang genre panel';

  @override
  String get loadingShuffle => 'Nilo-load ang shuffle...';

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
      'Awtomatikong i-enable ang HDR para sa HDR video playback at ibalik ang display mode pag-labas.';

  @override
  String get whenFullscreen => 'Kapag fullscreen';

  @override
  String get changeArtwork => 'Palitan ang Artwork';

  @override
  String get missing => 'Nawawala';

  @override
  String get transcodingLimits => 'Mga Limitasyon sa Transcoding';

  @override
  String get clearAllArtworkButton => 'I-clear ang lahat ng artwork?';

  @override
  String get clearAllArtworkWarning =>
      'Sigurado ka bang gusto mong i-clear ang lahat ng na-download na artwork?';

  @override
  String get confirmClear => 'Kumpirmahin ang Pag-clear';

  @override
  String confirmClearMessage(String itemType) {
    return 'Sigurado ka bang gusto mong i-clear ang $itemType na ito?';
  }

  @override
  String get uploadButton => 'I-upload?';

  @override
  String get resolutionLabel => 'Resolution: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Ipakita lang ang artwork sa wika ng interface';

  @override
  String get confirmClearAll => 'Kumpirmahin ang Pag-clear ng Lahat';

  @override
  String get imageUploadSuccess => 'Matagumpay na na-upload ang larawan!';

  @override
  String imageUploadFailed(String error) {
    return 'Nabigong i-upload ang larawan: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Nabigong itakda ang larawan: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Nabigong tanggalin ang larawan: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Nabigong i-clear ang lahat ng artwork: $error';
  }

  @override
  String get yes => 'Oo';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Mga Backdrop';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Thumbnail';

  @override
  String get artCategory => 'Art';

  @override
  String get discArtCategory => 'Disc Art';

  @override
  String get screenshotCategory => 'Screenshot';

  @override
  String get boxCoverCategory => 'Box Cover';

  @override
  String get boxRearCoverCategory => 'Box Rear Cover';

  @override
  String get menuArtCategory => 'Menu Art';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'backdrop';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'thumbnail';

  @override
  String get confirmItemArt => 'art';

  @override
  String get confirmItemDiscArt => 'disc art';

  @override
  String get confirmItemScreenshot => 'screenshot';

  @override
  String get confirmItemBoxCover => 'box cover';

  @override
  String get confirmItemBoxRearCover => 'box rear cover';

  @override
  String get confirmItemMenuArt => 'menu art';

  @override
  String get resolutionAll => 'Lahat';

  @override
  String get resolutionHigh => 'High (1080p+)';

  @override
  String get resolutionMedium => 'Medium (720p)';

  @override
  String get resolutionLow => 'Low (<720p)';

  @override
  String get sources => 'Mga Source';

  @override
  String get audiobookChapters => 'Mga Kabanata';

  @override
  String get audiobookBookmarks => 'Mga Bookmark';

  @override
  String get audiobookNotes => 'Mga Tala';

  @override
  String get audiobookQueue => 'Queue';

  @override
  String get audiobookTimeline => 'Timeline';

  @override
  String get audiobookTimelineEmpty => 'Walang laman ang timeline';

  @override
  String get audiobookWholeBook => 'Buong Aklat';

  @override
  String get audiobookFocusedTimeline => 'Focused Timeline';

  @override
  String get audiobookExportBookmarks => 'I-export ang Mga Bookmark';

  @override
  String get audiobookExportNotes => 'I-export ang Mga Tala';

  @override
  String get audiobookExportAll => 'I-export Lahat';

  @override
  String audiobookExportSuccess(String path) {
    return 'Na-export sa $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Nabigo ang pag-export: $error';
  }

  @override
  String get audiobookLyrics => 'Lyrics';

  @override
  String get audiobookAddBookmark => 'Magdagdag ng bookmark';

  @override
  String get audiobookAddNote => 'Magdagdag ng tala';

  @override
  String get audiobookEditNote => 'I-edit ang tala';

  @override
  String get audiobookNoteHint => 'Magsulat ng tala para sa sandaling ito';

  @override
  String get audiobookSleepTimer => 'Sleep timer';

  @override
  String get audiobookSleepOff => 'Naka-off';

  @override
  String get audiobookSleepEndOfChapter => 'Katapusan ng kabanata';

  @override
  String get audiobookSleepCustom => 'Custom';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining na natitira';
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
  String get audiobookPlaybackSpeed => 'Bilis ng playback';

  @override
  String get audiobookRemainingTime => 'Natitira';

  @override
  String get audiobookElapsedTime => 'Lumipas';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Paatras ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Pasulong ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Nakaraang kabanata';

  @override
  String get audiobookNextChapter => 'Susunod na kabanata';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Kabanata $current ng $total';
  }

  @override
  String get audiobookNoChapters => 'Walang kabanata';

  @override
  String get audiobookNoBookmarks => 'Wala pang bookmark';

  @override
  String get audiobookNoNotes => 'Wala pang tala';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Naidagdag ang bookmark sa $position';
  }

  @override
  String get audiobookSpeedReset => 'I-reset sa 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'I-save';

  @override
  String get audiobookCancel => 'Kanselahin';

  @override
  String get audiobookDelete => 'I-delete';

  @override
  String get subtitlePreferences => 'Mga Kagustuhan sa Subtitle';

  @override
  String get subtitlePreferencesDescription =>
      'Baguhin ang mga subtitle mode, default na wika, hitsura, at mga rendering na opsyon.';

  @override
  String get subtitleRendering => 'Subtitle Rendering';

  @override
  String get displayOptions => 'Mga Opsyon sa Display';

  @override
  String get releaseDateAscending => 'Petsa ng Paglabas (Pataas)';

  @override
  String get releaseDateDescending => 'Petsa ng Paglabas (Pababa)';

  @override
  String get groupContributions => 'Pagsama-samahin ang Mga Kontribusyon';

  @override
  String get groupMultipleRoles => 'Pagsama-samahin ang maraming role';

  @override
  String get libraryWriteAccessWarningTitle => 'Babala sa Library Write Access';

  @override
  String get libraryWriteAccessHowToFix => 'Paano ito ayusin:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Magbigay ng write permission sa Jellyfin service user (hal. jellyfin o Docker PUID/PGID) para sa mga media library folder mo sa server.\n\n2. O, pumunta sa iyong Jellyfin Dashboard -> Libraries, i-edit ang library na ito, at i-disable ang \'Save artwork into media folders\' para i-store ang artwork sa internal database ng Jellyfin.';

  @override
  String get dismiss => 'I-dismiss';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Ang iyong \'$libraryName\' library ay naka-configure na mag-save ng artwork diretso sa mga media folder (naka-enable ang \'Save artwork into media folders\'). Ngunit, sinubukan ng Jellyfin ang write access at walang pahintulot na magsulat ng mga file sa directory na ito:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Mukhang nabigo ang Jellyfin na i-update ang artwork. Ang iyong library ay naka-configure na mag-save ng artwork diretso sa mga media folder (naka-enable ang \'Save artwork into media folders\'). Karaniwang nangyayari ang error na ito kapag walang pahintulot ang Jellyfin server process na magsulat ng mga file sa iyong mga media directory.';

  @override
  String get externalLists => 'Mga External na Listahan';

  @override
  String get replay => 'I-replay';

  @override
  String get fileInformation => 'Impormasyon ng File';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Laki: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Ipakita Lahat ($count) na Audio Track';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Ipakita Lahat ($count) na Subtitle Track';
  }

  @override
  String get checkingDirectPlay => 'Sinusuri ang kakayahan sa Direct Play...';

  @override
  String get directPlayCapabilityLabel => 'Kakayahan sa Direct Play: ';

  @override
  String get forced => 'Forced';

  @override
  String get transcodeContainerNotSupported =>
      'Hindi suportado ng player ang container format.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Hindi suportado ang video codec.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Hindi suportado ang audio codec.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Hindi suportado ang format ng subtitle (nangangailangan ng burning).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Hindi suportado ang audio profile.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Hindi suportado ang video profile.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Hindi suportado ang video level.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Hindi suportado ng device na ito ang video resolution.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Hindi suportado ang video bit depth.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Hindi suportado ang video framerate.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Lumalampas ang bitrate ng file sa streaming limit ng player.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Lumalampas ang video bitrate sa streaming limit.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Lumalampas ang audio bitrate sa streaming limit.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Hindi suportado ang bilang ng mga audio channel.';

  @override
  String get sortAlphabetical => 'Alpabetiko';

  @override
  String get sortReleaseAscending => 'Pagkakasunod ng Paglabas (Pataas)';

  @override
  String get sortReleaseDescending => 'Pagkakasunod ng Paglabas (Pababa)';

  @override
  String get sortCustomDragDrop => 'Custom (Drag-and-Drop)';

  @override
  String get playlistSortOptions => 'Mga Opsyon sa Pag-sort ng Playlist';

  @override
  String get resetSort => 'I-reset ang Pag-sort';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Panoorin Muli ang S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Panoorin Muli ang Playlist';

  @override
  String get noSubtitlesFound => 'Walang nakitang subtitle.';

  @override
  String get adminControls => 'Mga Admin Control';

  @override
  String get impellerRendering => 'Rendering engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Ang Impeller ay ang modernong GPU renderer ng Flutter para sa mas maayos na animation at mas kaunting stutter. Sa ilang TV box at mas lumang GPU, maaari itong magdulot ng glitch o itim na video; i-off ito kung nakikita mo ang mga iyon. Pinipili ng Automatic ang pinakamahusay na default para sa iyong device. I-restart ang Moonfin para ilapat.';

  @override
  String get impellerAuto => 'Automatic';

  @override
  String get impellerOn => 'Naka-on';

  @override
  String get impellerOff => 'Naka-off';

  @override
  String get impellerRestartTitle => 'Kailangan ng restart';

  @override
  String get impellerRestartMessage =>
      'Kailangang mag-restart ang Moonfin para baguhin ang rendering engine. Isara ang app ngayon, pagkatapos ay buksang muli ito para ilapat.';

  @override
  String get impellerCloseNow => 'Isara ang app ngayon';

  @override
  String get adminRefreshLibrary => 'I-refresh ang Library';

  @override
  String get adminRefreshAllLibraries => 'I-refresh ang Lahat ng Library';

  @override
  String get adminRepoSortDateOldest => 'Petsang Idinagdag (Pinakaluma Muna)';

  @override
  String get adminRepoSortDateNewest => 'Petsang Idinagdag (Pinakabago Muna)';

  @override
  String get adminRepoSortNameAsc => 'Alpabetiko (A hanggang Z)';

  @override
  String get adminRepoSortNameDesc => 'Alpabetiko (Z hanggang A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Nilo-load ang Server Analytics... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Itugma sa source';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 na Pelikula';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 na TV Show';

  @override
  String get imdbMostPopularMovies => 'IMDb Pinakasikat na Mga Pelikula';

  @override
  String get imdbMostPopularTvShows => 'IMDb Pinakasikat na Mga TV Show';

  @override
  String get imdbLowestRatedMovies =>
      'IMDb Pinakamababang Rating na Mga Pelikula';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb Pinakamataas na Rating na Mga Pelikulang Ingles';
}
