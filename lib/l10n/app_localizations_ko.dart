// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '달지느러미';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => '로그인';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => '빠른 연결';

  @override
  String get password => '비밀번호';

  @override
  String get username => '사용자 이름';

  @override
  String get email => '이메일';

  @override
  String get quickConnectInstruction => '서버의 웹 대시보드에 다음 코드를 입력하세요.';

  @override
  String get waitingForAuthorization => '승인을 기다리는 중...';

  @override
  String get back => '뒤쪽에';

  @override
  String get serverUnavailable => '서버를 사용할 수 없습니다';

  @override
  String get loginFailed => '로그인 실패';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => '누가 보고 있나요?';

  @override
  String get addUser => '사용자 추가';

  @override
  String get selectServer => '서버 선택';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => '저장된 서버';

  @override
  String get discoveredServers => '검색된 서버';

  @override
  String get noneFound => '찾을 수 없음';

  @override
  String get unableToConnectToServer => '서버에 연결할 수 없습니다';

  @override
  String get addServer => '서버 추가';

  @override
  String get embyConnect => 'Emby 연결';

  @override
  String get removeServer => '서버 제거';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => '취소';

  @override
  String get remove => '제거하다';

  @override
  String get connectToServer => '서버에 연결';

  @override
  String get serverAddress => '서버 주소';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => '연결하다';

  @override
  String get secureStorageUnavailable => '보안 저장소를 사용할 수 없음';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin이 시스템 키링에 액세스할 수 없습니다. 로그인은 계속할 수 있지만 키링이 잠금 해제될 때까지 보안 토큰 저장을 사용하지 못할 수 있습니다.';

  @override
  String get ok => '좋아요';

  @override
  String get settingsAppearanceTheme => '앱 테마';

  @override
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Classic is the original centered moonfin layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Classic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'Expanded Tabs';

  @override
  String get expandedTabsSubtitle =>
      'Automatically show tab content while browsing tabs. Turn off to open and close each tab manually.';

  @override
  String get recommendationSystem => 'Recommendation System';

  @override
  String get recommendationSystemSubtitle =>
      'Use the Moonfin Recommends local-library algorithm or the online TMDb\'s Similarity Metrics. Note: Online recommendations require Seerr integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb Similarity';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Apply Parental Rating Cap?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limit Moonfin Recommends suggestions by parental rating of target media';

  @override
  String get interfaceStyle => '';

  @override
  String get interfaceStyleSubtitle => '';

  @override
  String get interfaceStyleAutomatic => '';

  @override
  String get interfaceStyleApple => '';

  @override
  String get interfaceStyleMaterial => '';

  @override
  String get glassQuality => 'Glass Quality';

  @override
  String get glassQualitySubtitle =>
      'Auto picks the best glass effect for this device. Full forces real blur; Reduced uses a lightweight glass that saves GPU power.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Reduced';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '앱을 다시 시작하지 않고도 Moonfin과 Neon Pulse 간에 전환할 수 있습니다.';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => '달지느러미';

  @override
  String get themeMoonfinSubtitle => '현재 Moonfin 룩은 여러분 모두가 좋아하게 되었습니다.';

  @override
  String get themeNeonPulse => '네온 펄스';

  @override
  String get themeNeonPulseSubtitle =>
      '마젠타 빛, 청록색 텍스트 및 더 강한 크롬 대비를 사용한 신스웨이브 스타일';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art styling with a chunky palette, blocky borders, hard drop-shadows, and a pixel font';

  @override
  String get embyConnectSignInSubtitle => 'Emby Connect 계정으로 로그인하세요';

  @override
  String get emailOrUsername => '이메일 또는 사용자 이름';

  @override
  String get selectAServer => '서버 선택';

  @override
  String get tryAgain => '다시 시도';

  @override
  String get noLinkedServers => '이 Emby Connect 계정에 연결된 서버가 없습니다.';

  @override
  String get invalidEmbyConnectCredentials => '잘못된 Emby Connect 자격 증명';

  @override
  String get invalidEmbyConnectLogin => '잘못된 Emby Connect 사용자 이름 또는 비밀번호';

  @override
  String get embyConnectExchangeNotSupported =>
      '서버는 Emby Connect 교환을 지원하지 않습니다.';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect 또는 선택한 서버에 접속하는 중 네트워크 오류가 발생했습니다.';

  @override
  String get loadingLinkedServers => '연결된 서버를 로드하는 중...';

  @override
  String get connectingToServerEllipsis => '서버에 연결하는 중...';

  @override
  String get noReachableAddress => '연락 가능한 주소가 제공되지 않았습니다.';

  @override
  String get invalidServerExchangeResponse => '서버 교환 엔드포인트의 잘못된 응답';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin을(를) 종료하시겠습니까?';

  @override
  String get exitAppConfirmation => '종료하시겠습니까?';

  @override
  String get exit => '출구';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Paused';

  @override
  String get gameSaveState => 'Save state';

  @override
  String get gameLoadState => 'Load state';

  @override
  String get gameFastForward => 'Fast-forward';

  @override
  String get gameEmulatorSettings => 'Emulator settings';

  @override
  String get gameNoCoreOptions => 'This core has no adjustable options.';

  @override
  String get gameHoldToOpenMenu => 'Hold to open menu';

  @override
  String get gamePlaybackUnsupported =>
      'Game playback is not supported on this device yet.';

  @override
  String get noHomeRowsLoaded => '홈 행을 로드할 수 없습니다.';

  @override
  String get noHomeRowsHint => '활성 홈 섹션을 새로 고치거나 줄여보세요.';

  @override
  String get retryHomeRows => '홈 행 재시도';

  @override
  String get guide => '가이드';

  @override
  String get recordings => '녹음';

  @override
  String get schedule => '일정';

  @override
  String get series => '시리즈';

  @override
  String get noItemsFound => '항목을 찾을 수 없습니다';

  @override
  String get home => '집';

  @override
  String get browseAll => '모두 찾아보기';

  @override
  String get genres => '장르';

  @override
  String get collectionPlaceholder => '컬렉션 항목이 여기에 표시됩니다.';

  @override
  String get browseByLetter => '글자별로 찾아보기';

  @override
  String get alphabeticalBrowsePlaceholder => '여기에 알파벳순 검색이 표시됩니다.';

  @override
  String get suggestions => '제안';

  @override
  String get suggestionsPlaceholder => '추천 항목이 여기에 표시됩니다.';

  @override
  String get failedToLoadLibraries => '라이브러리를 로드하지 못했습니다.';

  @override
  String get noLibrariesFound => '라이브러리를 찾을 수 없습니다.';

  @override
  String get library => '도서관';

  @override
  String get displaySettings => '디스플레이 설정';

  @override
  String get allGenres => '모든 장르';

  @override
  String get noGenresFound => '장르를 찾을 수 없습니다.';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => '이 폴더는 비어 있습니다.';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => '즐겨찾기를 로드하지 못했습니다.';

  @override
  String get retry => '다시 해 보다';

  @override
  String get noFavoritesYet => '아직 즐겨찾기가 없습니다.';

  @override
  String get favorites => '즐겨찾기';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => '계속';

  @override
  String get ended => '종료됨';

  @override
  String get sortAndFilter => '정렬 및 필터';

  @override
  String get type => '유형';

  @override
  String get sortBy => '정렬 기준';

  @override
  String get display => '표시하다';

  @override
  String get imageType => '이미지 유형';

  @override
  String get posterSize => '포스터 크기';

  @override
  String get small => '작은';

  @override
  String get medium => '중간';

  @override
  String get large => '크기가 큰';

  @override
  String get extraLarge => '특대';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => '조회수';

  @override
  String get albums => '앨범';

  @override
  String get albumArtists => '앨범 아티스트';

  @override
  String get artists => '아티스트';

  @override
  String get bookmarks => '북마크';

  @override
  String get noSavedBookmarks => '아직 이 제목에 대해 저장된 북마크가 없습니다.';

  @override
  String get openBook => '오픈북';

  @override
  String get chapter => '장';

  @override
  String get page => '페이지';

  @override
  String get bookmark => '서표';

  @override
  String get justNow => '방금';

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
  String get discoverySubjects => '발견 주제';

  @override
  String get pickDiscoverySubjects => 'Discover에 표시할 주제 피드를 선택하세요.';

  @override
  String get apply => '적용하다';

  @override
  String get openLink => '링크 열기';

  @override
  String get scanWithYourPhone => '휴대폰으로 스캔하세요';

  @override
  String get audiobookGenres => '오디오북 장르';

  @override
  String get pickAudiobookGenres => 'Audiobook Discover에 표시할 장르를 선택하세요.';

  @override
  String get discoverAudiobooks => '오디오북을 찾아보세요';

  @override
  String get librivoxDescription => 'LibriVox의 인기 공개 도메인 타이틀.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => '왼쪽으로 스크롤';

  @override
  String get scrollRight => '오른쪽으로 스크롤';

  @override
  String get couldNotLoadGenre => '지금은 이 장르를 로드할 수 없습니다.';

  @override
  String get continueReading => '계속 읽기';

  @override
  String get savedHighlights => '저장된 하이라이트';

  @override
  String get continueListening => '계속 듣기';

  @override
  String get listen => '듣다';

  @override
  String get resume => '재개하다';

  @override
  String get failedToLoadLibrary => '라이브러리를 로드하지 못했습니다.';

  @override
  String get popularNow => '지금 인기 있는';

  @override
  String get savedForLater => '나중을 위해 저장됨';

  @override
  String get topListens => '인기 청취';

  @override
  String get unreadDiscoveries => '읽지 않은 발견';

  @override
  String get pickUpAgain => '다시 픽업';

  @override
  String get bookHighlightsDescription => '하이라이트, 즐겨찾기 또는 읽기 진행 상황이 포함된 책입니다.';

  @override
  String get handPickedFromLibrary => '도서관에서 직접 고른 것입니다.';

  @override
  String get handPickedFromListeningQueue => '청취 대기열에서 직접 선택했습니다.';

  @override
  String get booksWithHighlights => '하이라이트, 즐겨찾기 또는 읽기 진행 상황이 포함된 책입니다.';

  @override
  String get jumpBackNarration => '자리를 찾지 않고 다시 내레이션으로 돌아가세요.';

  @override
  String get unreadBooksReady => '읽지 않은 책은 다음 조용한 시간을 위해 준비됩니다.';

  @override
  String get quickAccessFavorites => '계속해서 읽고 있는 책에 빠르게 액세스하세요.';

  @override
  String get searchAudiobooks => '오디오북 검색';

  @override
  String get searchYourLibrary => '라이브러리 검색';

  @override
  String get pickUpStory => '중단한 이야기를 다시 시작하세요.';

  @override
  String get savedPlacesChapters => '저장한 장소와 완료하지 않은 챕터';

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
  String get readyWhenYouAre => '당신이 준비되면';

  @override
  String get details => '세부';

  @override
  String get listeningRoom => '청취실';

  @override
  String get bookmarksAndProgress => '북마크 및 진행 상황';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => '제목';

  @override
  String get allTitles => '모든 타이틀';

  @override
  String get authors => '저자';

  @override
  String get browseByAuthor => '작성자별로 찾아보기';

  @override
  String get browseByGenre => '장르별로 찾아보기';

  @override
  String get discover => '발견하다';

  @override
  String get trendingTitlesOpenLibrary => 'Open Library의 주제별 인기 도서.';

  @override
  String get noBookmarkedItems => '아직 북마크한 항목이 없습니다.';

  @override
  String get nothingMatchesSection =>
      '아직 이 섹션과 일치하는 항목이 없습니다. 다른 탭을 시도하거나 라이브러리 동기화가 완료된 후 다시 돌아오세요.';

  @override
  String get audiobooks => '오디오북';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => '접는 사람';

  @override
  String get filters => '필터';

  @override
  String get readingStatus => '읽기 상태';

  @override
  String get playedStatus => '플레이 상태';

  @override
  String get readStatus => '읽다';

  @override
  String get watched => '시청함';

  @override
  String get unread => '읽히지 않는';

  @override
  String get unwatched => '시청하지 않음';

  @override
  String get seriesStatus => '시리즈 현황';

  @override
  String get allLibraries => '모든 라이브러리';

  @override
  String get books => '서적';

  @override
  String get latestBooks => 'Latest Books';

  @override
  String get latestAudiobooks => 'Latest Audiobooks';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Book';

  @override
  String get bookFormatAudiobook => 'Audiobook';

  @override
  String bookPercentRead(int percent) {
    return '$percent% read';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get bookHeroRead => 'Read';

  @override
  String get bookHeroListen => 'Listen';

  @override
  String get author => '작가';

  @override
  String get unknownAuthor => '알 수 없는 작성자';

  @override
  String get uncategorized => '분류되지 않음';

  @override
  String get overview => '개요';

  @override
  String get noLibrivoxDescription => '아직 이 타이틀에 대해 LibriVox에서 제공한 설명이 없습니다.';

  @override
  String get readers => '독자';

  @override
  String get openLinks => '링크 열기';

  @override
  String get librivoxPage => 'LibriVox 페이지';

  @override
  String get internetArchive => '인터넷 아카이브';

  @override
  String get rssFeed => 'RSS 피드';

  @override
  String get downloadZip => '우편번호 다운로드';

  @override
  String sectionCountLabel(int count) {
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
  }

  @override
  String get noOpenLibraryOverview => 'Open Library에는 아직 이 타이틀에 대한 개요가 없습니다.';

  @override
  String get subjects => '과목';

  @override
  String get all => '모두';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => '지금은 이 주제를 로드할 수 없습니다.';

  @override
  String get audiobookDetails => '오디오북 세부정보';

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
  String get trackList => '트랙 목록';

  @override
  String get itemListPlaceholder => '여기에 항목 목록이 표시됩니다.';

  @override
  String get favoriteTracksPlaceholder => '즐겨찾는 트랙이 여기에 표시됩니다.';

  @override
  String get failedToLoad => '로드하지 못했습니다.';

  @override
  String get delete => '삭제';

  @override
  String get save => '구하다';

  @override
  String get moreLikeThis => '비슷한 제품 더 보기';

  @override
  String get castAndCrew => '출연진 및 제작진';

  @override
  String get collection => '수집';

  @override
  String get episodes => '에피소드';

  @override
  String get nextUp => '다음';

  @override
  String get seasons => '계절';

  @override
  String get chapters => '장';

  @override
  String get features => '특징';

  @override
  String get movies => '영화 산업';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => '다른';

  @override
  String get discography => '음반';

  @override
  String get similarArtists => '유사 아티스트';

  @override
  String get tableOfContents => '목차';

  @override
  String get tracklist => '트랙리스트';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => '전기';

  @override
  String get authorDetails => '작성자 세부정보';

  @override
  String get noOverviewAvailable => '아직 이 타이틀에 대한 개요가 없습니다.';

  @override
  String get noBiographyAvailable => '이 저자의 전기가 없습니다.';

  @override
  String get noBooksFound => '이 저자에 대한 도서를 찾을 수 없습니다.';

  @override
  String get unableToLoadAuthorDetails => '지금은 작성자 세부정보를 로드할 수 없습니다.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => '출판일은 알 수 없음';

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
  String get items => 'Items';

  @override
  String get extras => 'Extras';

  @override
  String get behindTheScenes => 'Behind the Scenes';

  @override
  String get deletedScenes => 'Deleted Scenes';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scenes';

  @override
  String get shorts => 'Shorts';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => '보다';

  @override
  String get resumeReading => '읽기 재개';

  @override
  String get read => '읽다';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => '놀다';

  @override
  String get startOver => '다시 시작';

  @override
  String get restart => '다시 시작';

  @override
  String get readOffline => '오프라인으로 읽기';

  @override
  String get playOffline => '오프라인으로 플레이';

  @override
  String get audio => '오디오';

  @override
  String get subtitles => '자막';

  @override
  String get version => '버전';

  @override
  String get cast => '깁스';

  @override
  String get trailer => '트레일러';

  @override
  String get finished => '완성된';

  @override
  String get favorited => '즐겨찾기';

  @override
  String get favorite => '가장 좋아하는';

  @override
  String get playlist => '재생목록';

  @override
  String get downloaded => '다운로드됨';

  @override
  String get downloadAll => '모두 다운로드';

  @override
  String get download => '다운로드';

  @override
  String get deleteDownloaded => '다운로드한 항목 삭제';

  @override
  String get goToSeries => '시리즈로 이동';

  @override
  String get editMetadata => '메타데이터 편집';

  @override
  String get less => '더 적은';

  @override
  String get more => '더';

  @override
  String get deleteItem => '항목 삭제';

  @override
  String get deletePlaylist => '재생목록 삭제';

  @override
  String get deletePlaylistMessage => '서버에서 이 재생목록을 삭제하시겠습니까?';

  @override
  String get deleteItemMessage => '이 항목을 서버에서 삭제하시겠습니까?';

  @override
  String get failedToDeletePlaylist => '재생목록을 삭제하지 못했습니다.';

  @override
  String get failedToDeleteItem => '항목을 삭제하지 못했습니다.';

  @override
  String get renamePlaylist => '재생목록 이름 바꾸기';

  @override
  String get playlistName => '재생목록 이름';

  @override
  String get deleteDownloadedAlbum => '다운로드한 앨범 삭제';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => '다운로드한 트랙이 삭제되었습니다.';

  @override
  String get downloadedTracksDeleteFailed => '다운로드한 트랙 중 일부를 삭제할 수 없습니다.';

  @override
  String get noTracksLoaded => '로드된 트랙이 없습니다.';

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
  String get itemDeleted => '항목이 삭제되었습니다.';

  @override
  String get noPlayableTrailerFound => '재생 가능한 예고편이 없습니다.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => '오디오 트랙';

  @override
  String get subtitleTrack => '자막 트랙';

  @override
  String get none => '없음';

  @override
  String get downloadSubtitlesLabel => '자막 다운로드...';

  @override
  String get searchOpenSubtitlesPlugin => 'OpenSubtitles 플러그인을 사용하여 검색';

  @override
  String get downloadSubtitles => '자막 다운로드';

  @override
  String get selectedSubtitleInvalid => '선택한 자막이 잘못되었습니다.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      '자막이 다운로드되었습니다. Jellyfin이 항목을 새로 고치는 동안 표시되는 데 잠시 시간이 걸릴 수 있습니다.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => '버전 선택';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => '모두 다운로드 - 품질';

  @override
  String get downloadQuality => '품질 다운로드';

  @override
  String get originalFileNoReencoding => '원본 파일, 재인코딩 없음';

  @override
  String get originalFilesNoReencoding => '원본 파일, 재인코딩 없음';

  @override
  String get noEpisodesLoaded => '로드된 에피소드가 없습니다.';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => '다운로드한 파일 삭제';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => '다운로드한 파일이 삭제되었습니다.';

  @override
  String get failedToDeleteFiles => '파일을 삭제하지 못했습니다.';

  @override
  String get deleteFiles => '파일 삭제';

  @override
  String get director => '감독';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => '작가';

  @override
  String get studio => '사진관';

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
  String get showLess => '간략히 표시';

  @override
  String get readMore => '자세히 알아보기';

  @override
  String get shuffle => '혼합';

  @override
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => '완벽한 일치';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => '단핵증';

  @override
  String get stereo => '스테레오 재생';

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
  String get deleteSeasonFiles => '이번 시즌에 다운로드된 모든 에피소드';

  @override
  String get stillWatching => '아직 시청 중이신가요?';

  @override
  String get unableToLoadTrailerStream => '예고편 스트림을 로드할 수 없습니다.';

  @override
  String get trailerTimedOut => '예고편을 로드하는 동안 시간이 초과되었습니다.';

  @override
  String get playbackFailedForTrailer => '이 예고편을 재생하지 못했습니다.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline => '오프라인 재생 중에는 전송할 수 없습니다.';

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
  String get deviceVolume => '장치 볼륨';

  @override
  String get unavailable => '없는';

  @override
  String get pause => '정지시키다';

  @override
  String get syncPosition => '동기화 위치';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => '대기열이 비어 있습니다.';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => '원격 재생';

  @override
  String get castingToGoogleCast => 'Google Cast로 전송 중';

  @override
  String get castingViaAirPlay => 'AirPlay를 통해 전송';

  @override
  String get castingViaDlna => 'DLNA를 통해 캐스팅';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => '잠금을 해제하려면 길게 누르세요.';

  @override
  String get off => '끄다';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => '자동';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => '비트레이트 재정의';

  @override
  String get audioDelay => '오디오 지연';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => '자막 지연';

  @override
  String get reset => '다시 놓기';

  @override
  String get unknown => '알려지지 않은';

  @override
  String get playbackInformation => '재생정보';

  @override
  String get playback => '재생';

  @override
  String get playMethod => '플레이 방법';

  @override
  String get directPlay => '다이렉트 플레이';

  @override
  String get directStream => '다이렉트 스트림';

  @override
  String get transcoding => '트랜스코딩';

  @override
  String get transcodeReasons => '트랜스코드 이유';

  @override
  String get player => '플레이어';

  @override
  String get container => '컨테이너';

  @override
  String get bitrate => '비트레이트';

  @override
  String get video => '동영상';

  @override
  String get resolution => '해결';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => '코덱';

  @override
  String get videoBitrate => '비디오 비트레이트';

  @override
  String get track => '길';

  @override
  String get channels => '채널';

  @override
  String get audioBitrate => '오디오 비트 전송률';

  @override
  String get sampleRate => '샘플링 속도';

  @override
  String get format => '체재';

  @override
  String get external => '외부';

  @override
  String get embedded => '임베디드';

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
      '이 플랫폼에서는 아직 EPUB 렌더링 인앱을 사용할 수 없습니다.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable => '이 플랫폼에서는 포함된 문서 렌더링을 사용할 수 없습니다.';

  @override
  String get couldNotOpenExternalViewer => '외부 뷰어를 열 수 없습니다.';

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
  String get noBookmarksYet => '아직 북마크가 없습니다.\n위치를 저장하려면 읽는 동안 북마크 아이콘을 탭하세요.';

  @override
  String get noTableOfContentsAvailable => '목차가 없습니다.';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => '위치';

  @override
  String get bookReader => '책 리더';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => '업데이트 중...';

  @override
  String get markUnread => '읽지 않은 것으로 표시';

  @override
  String get markAsRead => '읽음으로 표시';

  @override
  String get reloadReader => '리더 다시 로드';

  @override
  String get noPagesFound => '페이지를 찾을 수 없습니다.';

  @override
  String get failedToDecodePageImage => '페이지 이미지를 디코딩하지 못했습니다.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => '단일 페이지';

  @override
  String get twoPageSpread => '두 페이지 펼치기';

  @override
  String get addBookmark => '북마크 추가';

  @override
  String get bookmarksEllipsis => '북마크...';

  @override
  String get markedAsRead => '읽음으로 표시됨';

  @override
  String get markedAsUnread => '읽지 않은 것으로 표시됨';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => '테마: 시스템';

  @override
  String get themeLight => '테마: 빛';

  @override
  String get themeDark => '테마: 어두운';

  @override
  String get themeSepia => '테마: 세피아';

  @override
  String get invertColorsFixedLayout => '색상 반전(고정 레이아웃)';

  @override
  String get invertColorsPdf => '색상 반전(PDF)';

  @override
  String get preparingInAppReader => '인앱 리더 준비 중...';

  @override
  String get pdfDataNotAvailable => 'PDF 데이터를 사용할 수 없습니다.';

  @override
  String get readerFallbackModeActive => '리더 대체 모드 활성화';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      '지원되는 플랫폼 대상(Android, iOS, macOS)으로 전환한 후 Reload Reader를 사용하세요.';

  @override
  String get openExternally => '외부에서 열기';

  @override
  String get noEpubChaptersFound => 'EPUB 챕터를 찾을 수 없습니다.';

  @override
  String get readerNotReady => '리더가 준비되지 않았습니다.';

  @override
  String get seriesRecordings => '시리즈 녹음';

  @override
  String get now => '지금';

  @override
  String get sports => '스포츠';

  @override
  String get news => '소식';

  @override
  String get kids => '어린이';

  @override
  String get premiere => '첫날';

  @override
  String get guideTimeline => '가이드 타임라인';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => '채널을 찾을 수 없습니다';

  @override
  String get liveBadge => '살다';

  @override
  String guideNextProgram(String time, String title) {
    return 'Next: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m left';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h left';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m left';
  }

  @override
  String get movie => '영화';

  @override
  String get removedFromFavoriteChannels => '즐겨찾는 채널에서 삭제됨';

  @override
  String get addedToFavoriteChannels => '즐겨찾는 채널에 추가됨';

  @override
  String get failedToUpdateFavoriteChannel => '즐겨찾는 채널을 업데이트하지 못했습니다.';

  @override
  String get unfavoriteChannel => '즐겨찾지 않는 채널';

  @override
  String get favoriteChannel => '즐겨찾는 채널';

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
  String get watch => '보다';

  @override
  String get close => '닫다';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => '녹음을 로드하지 못했습니다.';

  @override
  String get scheduledInNext24Hours => '다음 24시간 후에 예약됨';

  @override
  String get recentRecordings => '최근 녹음';

  @override
  String get tvSeries => 'TV 시리즈';

  @override
  String get failedToLoadSchedule => '일정을 로드하지 못했습니다.';

  @override
  String get noScheduledRecordings => '예약된 녹화가 없습니다.';

  @override
  String get cancelRecording => '녹음을 취소하시겠습니까?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => '아니요';

  @override
  String get yesCancel => '예, 취소합니다';

  @override
  String get failedToCancelRecording => '녹음을 취소하지 못했습니다.';

  @override
  String get failedToLoadSeriesRecordings => '시리즈 녹화물을 로드하지 못했습니다.';

  @override
  String get noSeriesRecordings => '시리즈 녹화 없음';

  @override
  String get cancelSeriesRecording => '시리즈 녹화 취소';

  @override
  String get cancelSeriesRecordingQuestion => '시리즈 녹화를 취소하시겠습니까?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => '시리즈 녹화를 취소하지 못했습니다.';

  @override
  String get searchThisLibrary => '이 라이브러리를 검색해 보세요...';

  @override
  String get searchEllipsis => '찾다...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr 계정 유형';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => '현지의';

  @override
  String get savedMedia => '저장된 미디어';

  @override
  String get tvShows => 'TV 프로그램';

  @override
  String get music => '음악';

  @override
  String get musicAlbums => '음악 앨범';

  @override
  String get noMediaInFilter => '이 필터에는 미디어가 없습니다.';

  @override
  String get noDownloadedMediaYet => '아직 다운로드한 미디어가 없습니다.';

  @override
  String get browseLibrary => '라이브러리 찾아보기';

  @override
  String get deleteDownload => '다운로드 삭제';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => '앨범';

  @override
  String get playAlbum => '앨범 재생';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => '계절';

  @override
  String get errorLoadingEpisodes => '에피소드를 로드하는 중에 오류가 발생했습니다.';

  @override
  String get noDownloadedEpisodes => '다운로드한 에피소드가 없습니다.';

  @override
  String get deleteEpisode => '에피소드 삭제';

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
  String get seriesNotFound => '시리즈를 찾을 수 없습니다';

  @override
  String get errorLoadingSeries => '시리즈를 로드하는 중에 오류가 발생했습니다.';

  @override
  String get downloadedEpisodes => '다운로드한 에피소드';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => '스페셜';

  @override
  String get deleteSeason => '시즌 삭제';

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
  String get storageManagement => '스토리지 관리';

  @override
  String get storageBreakdown => '스토리지 분석';

  @override
  String get downloadedItems => '다운로드한 항목';

  @override
  String get storageLimit => '저장 한도';

  @override
  String get noLimit => '제한 없음';

  @override
  String get deleteAllDownloads => '모든 다운로드 삭제';

  @override
  String get deleteAllDownloadsWarning => '다운로드한 모든 미디어 파일이 제거되며 취소할 수 없습니다.';

  @override
  String get deleteAll => '모두 삭제';

  @override
  String get deleteSelected => '선택 항목 삭제';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => '음악 및 오디오북';

  @override
  String get images => '이미지';

  @override
  String get database => '데이터 베이스';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => '설정';

  @override
  String get authentication => '입증';

  @override
  String get autoLoginServerManagement => '자동 로그인, 서버 관리';

  @override
  String get pinCode => '핀 코드';

  @override
  String get setUpPinCodeProtection => 'PIN 코드 보호 설정';

  @override
  String get parentalControls => '자녀 보호';

  @override
  String get contentRatingRestrictions => '콘텐츠 등급 제한';

  @override
  String get bitRateResolutionBehavior => '비트 전송률, 해상도, 동작';

  @override
  String get languageSizeAppearance => '언어, 크기, 외관';

  @override
  String get qualityStorage => '품질, 저장';

  @override
  String get serverSyncAndPluginStatus => '서버 동기화 및 플러그인 상태';

  @override
  String get mediaRequestIntegration => '미디어 요청 통합';

  @override
  String get switchServer => '서버 전환';

  @override
  String get signOut => '로그아웃';

  @override
  String get versionLicenses => '버전, 라이센스';

  @override
  String get account => '계정';

  @override
  String get signInAndSecurity => '로그인 및 보안';

  @override
  String get administration => '관리';

  @override
  String get serverSettingsUsersLibraries => '서버 설정, 사용자, 라이브러리';

  @override
  String get customization => '맞춤화';

  @override
  String get themeAndLayout => '테마 및 레이아웃';

  @override
  String get videoAndSubtitles => '비디오 및 자막';

  @override
  String get integrations => '통합';

  @override
  String get pluginAndRequests => '플러그인 및 요청';

  @override
  String get customizeAccountPlaybackInterface => '계정, 재생 및 인터페이스 동작 사용자 정의';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => '테마 및 모양';

  @override
  String get focusBorderColor => '초점 테두리 색상';

  @override
  String get watchedIndicators => '시청 지표';

  @override
  String get always => '언제나';

  @override
  String get hideUnwatched => '보지 않은 항목 숨기기';

  @override
  String get episodesOnly => '에피소드만';

  @override
  String get never => '절대';

  @override
  String get focusExpansionAnimation => '초점 확장 애니메이션';

  @override
  String get desktopUiScale => '데스크탑 UI 규모';

  @override
  String get scaleFocusedCards => '초점을 맞추거나 가리킨 카드 및 타일 크기 조정';

  @override
  String get backgroundBackdrops => '배경 배경';

  @override
  String get showBackdropImages => '콘텐츠 뒤에 배경 이미지 표시';

  @override
  String get seriesThumbnails => '시리즈 썸네일';

  @override
  String get seriesThumbnailsDescription =>
      '에피소드만: 각 행의 이미지 유형과 일치하는 시리즈 아트워크를 사용하세요.';

  @override
  String get homeRowInfoOverlay => '홈 행 정보 오버레이';

  @override
  String get showTitleMetadataOnHomeRows => '홈 행을 탐색할 때 제목 및 메타데이터 표시';

  @override
  String get clockDisplay => '시계 표시';

  @override
  String get inMenus => '메뉴에서';

  @override
  String get inVideo => '비디오에서';

  @override
  String get seasonalEffects => '계절적 영향';

  @override
  String get seasonalEffectsDescription => '시각 효과 및 계절 장식';

  @override
  String get snow => '눈';

  @override
  String get fireworks => '불꽃';

  @override
  String get confetti => '색종이 조각';

  @override
  String get fallingLeaves => '떨어지는 나뭇잎';

  @override
  String get themeMusic => '테마 음악';

  @override
  String get playThemeMusicOnDetailPages => '세부 정보 페이지에서 테마 음악 재생';

  @override
  String get themeMusicVolume => '테마 음악 볼륨';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => '홈 행의 테마 음악';

  @override
  String get playWhenBrowsingHomeScreen => '홈 화면 탐색 시 재생';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => '세부 배경 흐림';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => '브라우징 배경 흐림';

  @override
  String get maxStreamingBitrate => '최대 스트리밍 비트 전송률';

  @override
  String get maxResolution => '최대 해상도';

  @override
  String get playerZoomMode => '플레이어 줌 모드';

  @override
  String get settingsScrollWheelAction => '';

  @override
  String get settingsScrollWheelActionDescription => '';

  @override
  String get scrollWheelActionOff => '';

  @override
  String get scrollWheelActionSeek => '';

  @override
  String get scrollWheelActionVolume => '';

  @override
  String get playerTooltipVolume => '';

  @override
  String get fit => '맞다';

  @override
  String get autoCrop => '자동 자르기';

  @override
  String get stretch => '뻗기';

  @override
  String get refreshRateSwitching => '새로 고침 빈도 전환';

  @override
  String get disabled => '장애가 있는';

  @override
  String get scaleOnTv => 'TV의 규모';

  @override
  String get scaleOnDevice => '장치에 따라 확장';

  @override
  String get trickPlay => '트릭 플레이';

  @override
  String get showPreviewThumbnailsWhenSeeking => '검색 시 미리보기 썸네일 표시';

  @override
  String get showDescriptionOnPause => '일시중지 시 설명 표시';

  @override
  String get dimVideoShowOverview => '일시중지된 동안 비디오를 어둡게 하고 개요 텍스트를 표시합니다.';

  @override
  String get osdLockButton => 'OSD 잠금 버튼';

  @override
  String get osdLockButtonDescription => '길게 누를 때까지 터치 입력을 차단하는 잠금 버튼 표시';

  @override
  String get audioBehavior => '오디오 동작';

  @override
  String get downmixToStereo => '스테레오로 다운믹스';

  @override
  String get defaultAudioLanguage => '기본 오디오 언어';

  @override
  String get fallbackAudioLanguage => '';

  @override
  String get preferDefaultAudioTrack => '';

  @override
  String get preferDefaultAudioTrackDescription => '';

  @override
  String get preferAudioDescription => '';

  @override
  String get preferAudioDescriptionDescription => '';

  @override
  String get transcodingAudio => '';

  @override
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcoding (Bitrate or Resolution)';

  @override
  String get transcodingVideoAndAudio => 'Transcoding (Video & Audio)';

  @override
  String get transcodingVideo => 'Transcoding (Video)';

  @override
  String get autoServerDefault => '자동(서버 기본값)';

  @override
  String get english => '영어';

  @override
  String get spanish => '스페인 사람';

  @override
  String get french => '프랑스 국민';

  @override
  String get german => '독일 사람';

  @override
  String get italian => '이탈리아 사람';

  @override
  String get portuguese => '포르투갈 인';

  @override
  String get japanese => '일본어';

  @override
  String get korean => '한국인';

  @override
  String get chinese => '중국인';

  @override
  String get russian => '러시아인';

  @override
  String get arabic => '아라비아 말';

  @override
  String get hindi => '힌디 어';

  @override
  String get dutch => '네덜란드 사람';

  @override
  String get swedish => '스웨덴어';

  @override
  String get norwegian => '노르웨이 인';

  @override
  String get danish => '덴마크 말';

  @override
  String get finnish => '핀란드어';

  @override
  String get polish => '광택';

  @override
  String get ac3Passthrough => 'AC3 패스스루';

  @override
  String get dtsPassthrough => 'DTS 패스스루';

  @override
  String get trueHdSupport => 'TrueHD 지원';

  @override
  String get enableDtsPassthrough =>
      'AVR 전용 비트스트림 DTS 오디오; 수신기 지원 및 DTS 소스 트랙이 필요합니다.';

  @override
  String get enableTrueHdAudio => 'TrueHD 오디오 활성화(일부 플랫폼에서는 작동하지 않을 수 있음)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackCodecDescription => '';

  @override
  String get settingsAudioFallbackCodecAuto => '';

  @override
  String get settingsAudioFallbackCodecAac => '';

  @override
  String get settingsAudioFallbackCodecAc3 => '';

  @override
  String get settingsAudioFallbackCodecEac3 => '';

  @override
  String get settingsAudioFallbackCodecTrueHd => '';

  @override
  String get settingsAudioFallbackCodecMp3 => '';

  @override
  String get settingsAudioFallbackCodecOpus => '';

  @override
  String get settingsAudioFallbackCodecFlac => '';

  @override
  String get settingsMaxAudioChannels => '';

  @override
  String get settingsMaxAudioChannelsDescription => '';

  @override
  String get settingsMaxAudioChannelsAuto => '';

  @override
  String get settingsMaxAudioChannelsMono => '';

  @override
  String get settingsMaxAudioChannelsStereo => '';

  @override
  String get settingsMaxAudioChannels3_0 => '';

  @override
  String get settingsMaxAudioChannels4_0 => '';

  @override
  String get settingsMaxAudioChannels5_0 => '';

  @override
  String get settingsMaxAudioChannels5_1 => '';

  @override
  String get settingsMaxAudioChannels6_1 => '';

  @override
  String get settingsMaxAudioChannels7_1 => '';

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
  String get settingsAudioRouteHeadphones => 'Headphones';

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
  String get nightMode => '야간 모드';

  @override
  String get compressDynamicRange => '다이내믹 레인지 압축';

  @override
  String get advancedMpv => '고급 mpv';

  @override
  String get enableCustomMpvConf => '사용자 정의 mpv.conf 활성화';

  @override
  String get applyMpvConfBeforePlayback => '재생이 시작되기 전에 사용자 지정 mpv.conf 적용';

  @override
  String get unsafeAdvancedMpvOptions => '안전하지 않은 고급 mpv 옵션';

  @override
  String get unsafeMpvOptionsDescription =>
      '더 넓은 mpv 옵션 세트를 허용합니다. 재생 동작이 중단될 수 있습니다.';

  @override
  String get hardwareDecoding => '하드웨어 디코딩';

  @override
  String get hardwareDecodingSubtitle =>
      '성능이 향상될 수 있지만 일부 장치에서는 재생 문제가 발생할 수 있습니다.';

  @override
  String get nextUpAndQueuing => '다음 작업 및 대기열';

  @override
  String get nextUpDisplay => '다음 디스플레이';

  @override
  String get extended => '펼친';

  @override
  String get minimal => '최소한의';

  @override
  String get nextUpTimeout => '다음 시간 초과';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => '미디어 대기열';

  @override
  String get autoQueueNextEpisodes => '다음 에피소드 자동 대기열';

  @override
  String get stillWatchingPrompt => '아직 프롬프트를 보고 있는 중';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => '재개 및 건너뛰기';

  @override
  String get resumeRewind => '이력서 되감기';

  @override
  String get unpauseRewind => '되감기 일시중지 해제';

  @override
  String get fiveSeconds => '5초';

  @override
  String get tenSeconds => '10초';

  @override
  String get fifteenSeconds => '15초';

  @override
  String get thirtySeconds => '30초';

  @override
  String get skipBackLength => '뒤로 건너뛰기 길이';

  @override
  String get skipForwardLength => '앞으로 건너뛰기 길이';

  @override
  String get customMpvConfPath => '사용자 정의 mpv.conf 경로';

  @override
  String get notSetMpvConf =>
      '설정되지 않았습니다. Moonfin은 app/data 폴더에서 기본 mpv.conf를 시도합니다.';

  @override
  String get selectMpvConf => 'mpv.conf를 선택하세요.';

  @override
  String get pathToMpvConf => '/경로/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      '스타일 설정(크기, 색상, 오프셋)은 텍스트 기반 자막(SRT, VTT, TTML)에 적용됩니다. ASS/SSA 자막은 \"ASS/SSA Direct Play\"가 꺼지지 않는 한 자체 내장 스타일을 사용합니다. 비트맵 자막(PGS, DVB, VobSub)은 스타일을 변경할 수 없습니다.';

  @override
  String get defaultSubtitleLanguage => '기본 자막 언어';

  @override
  String get defaultToNoSubtitles => '자막 없음이 기본값입니다.';

  @override
  String get turnOffSubtitlesByDefault => '기본적으로 자막 끄기';

  @override
  String get subtitleSize => '자막 크기';

  @override
  String get textFillColor => '텍스트 채우기 색상';

  @override
  String get backgroundColor => '배경색';

  @override
  String get textStrokeColor => '텍스트 획 색상';

  @override
  String get subtitleCustomization => '자막 사용자 정의';

  @override
  String get subtitleCustomizationDescription => '자막 모양 맞춤설정';

  @override
  String get subtitleMode => '';

  @override
  String get subtitleModeFlagged => '';

  @override
  String get subtitleModeAlways => '';

  @override
  String get subtitleModeForeign => '';

  @override
  String get subtitleModeForced => '';

  @override
  String get subtitleModeFlaggedDescription => '';

  @override
  String get subtitleModeAlwaysDescription => '';

  @override
  String get subtitleModeForeignDescription => '';

  @override
  String get subtitleModeForcedDescription => '';

  @override
  String get subtitleModeNoneDescription => '';

  @override
  String get fallbackSubtitleLanguage => '';

  @override
  String get subtitleStream => '';

  @override
  String get subtitlePreviewText => '날렵한 갈색여우는 게으른 개를 뛰어넘는다';

  @override
  String get verticalOffset => '수직 오프셋';

  @override
  String get pgsDirectPlay => 'PGS 다이렉트 플레이';

  @override
  String get directPlayPgsSubtitles => '직접 플레이 PGS 자막';

  @override
  String get assSsaDirectPlay => 'ASS/SSA 다이렉트 플레이';

  @override
  String get directPlayAssSsaSubtitles => '직접 재생 ASS/SSA 자막';

  @override
  String get white => '하얀색';

  @override
  String get black => '검은색';

  @override
  String get yellow => '노란색';

  @override
  String get green => '녹색';

  @override
  String get cyan => '청록색';

  @override
  String get red => '빨간색';

  @override
  String get transparent => '투명한';

  @override
  String get semiTransparentBlack => '반투명 검정색';

  @override
  String get global => '글로벌';

  @override
  String get desktop => '데스크탑';

  @override
  String get mobile => '이동하는';

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
  String get customizationProfile => '사용자 정의 프로필';

  @override
  String get customizationProfileDescription =>
      '로드, 편집, 동기화할 프로필을 선택하세요. 장치 프로필이 이를 재정의하지 않는 한 전역은 모든 곳에 적용됩니다. 녹색 점은 현재 장치 프로필을 표시합니다.';

  @override
  String get loadProfile => '프로필 로드';

  @override
  String get syncing => '동기화 중...';

  @override
  String get syncToProfile => '프로필에 동기화';

  @override
  String get profileSyncHidden => '프로필 동기화 숨김';

  @override
  String get enablePluginSyncDescription =>
      '여기에 프로필 컨트롤을 표시하려면 플러그인 설정에서 서버 플러그인 동기화를 활성화하세요.';

  @override
  String get quality => '품질';

  @override
  String get defaultDownloadQuality => '기본 다운로드 품질';

  @override
  String get network => '회로망';

  @override
  String get wifiOnlyDownloads => 'WiFi 전용 다운로드';

  @override
  String get onlyDownloadOnWifi => 'Wi-Fi에 연결된 경우에만 다운로드';

  @override
  String get storage => '저장';

  @override
  String get storageUsed => '사용된 저장소';

  @override
  String get manage => '관리하다';

  @override
  String get calculating => '계산 중...';

  @override
  String get downloadLocation => '다운로드 위치';

  @override
  String get defaultLabel => '기본';

  @override
  String get saveToDownloadsFolder => '다운로드 폴더에 저장';

  @override
  String get downloadsVisibleToOtherApps => '다운로드/Moonfin — 다른 앱에 표시';

  @override
  String get dangerZone => '위험지대';

  @override
  String get clearAllDownloads => '모든 다운로드 지우기';

  @override
  String get original => '원래의';

  @override
  String get changeDownloadLocation => '다운로드 위치 변경';

  @override
  String get changeDownloadLocationDescription =>
      '새로운 다운로드는 선택한 폴더에 저장됩니다. 기존 다운로드는 현재 위치에 유지되며 저장소 설정에서 관리할 수 있습니다.';

  @override
  String get confirm => '확인하다';

  @override
  String get cannotWriteToFolder =>
      '선택한 폴더에 쓸 수 없습니다. 다른 위치를 선택하거나 저장 권한을 부여하세요.';

  @override
  String get saveToDownloadsFolderQuestion => '다운로드 폴더에 저장하시겠습니까?';

  @override
  String get saveToDownloadsFolderDescription =>
      '다운로드한 미디어는 기기의 Downloads/Moonfin에 저장됩니다. 이러한 파일은 갤러리나 음악 플레이어와 같은 다른 앱에 표시됩니다.\n\n기존 다운로드는 현재 위치에 유지됩니다.';

  @override
  String get enable => '할 수 있게 하다';

  @override
  String get clearAllDownloadsWarning => '다운로드한 모든 미디어가 삭제되며 취소할 수 없습니다.';

  @override
  String get clearAll => '모두 지우기';

  @override
  String get navigationStyle => '탐색 스타일';

  @override
  String get topBar => '상단 바';

  @override
  String get leftSidebar => '왼쪽 사이드바';

  @override
  String get showShuffleButton => '셔플 버튼 표시';

  @override
  String get showGenresButton => '장르 버튼 표시';

  @override
  String get showFavoritesButton => '즐겨찾기 버튼 표시';

  @override
  String get showLibrariesInToolbar => '툴바에 라이브러리 표시';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => '탐색바 불투명도';

  @override
  String get navbarColor => '탐색바 색상';

  @override
  String get gray => '회색';

  @override
  String get darkBlue => '진한 파란색';

  @override
  String get purple => '보라';

  @override
  String get teal => '물오리';

  @override
  String get navy => '해군';

  @override
  String get charcoal => '숯';

  @override
  String get brown => '갈색';

  @override
  String get darkRed => '진한 빨간색';

  @override
  String get darkGreen => '암록색';

  @override
  String get slate => '슬레이트';

  @override
  String get indigo => '남빛';

  @override
  String get libraryDisplay => '도서관 전시';

  @override
  String get posterLabel => '포스터';

  @override
  String get thumbnailLabel => '썸네일';

  @override
  String get bannerLabel => '기치';

  @override
  String get overridePerLibrarySettings => '라이브러리별 설정 재정의';

  @override
  String get applyImageTypeToAllLibraries => '모든 라이브러리에 이미지 유형 적용';

  @override
  String get multiServerLibraries => '다중 서버 라이브러리';

  @override
  String get showLibrariesFromAllServers => '연결된 모든 서버의 라이브러리 표시';

  @override
  String get enableFolderView => '폴더 보기 활성화';

  @override
  String get showFolderBrowsingOption => '폴더 탐색 옵션 표시';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => '도서관 가시성';

  @override
  String get libraryVisibilityDescription =>
      '라이브러리별로 홈 페이지 가시성을 전환합니다. 변경 사항을 적용하려면 Moonfin을 다시 시작하세요.';

  @override
  String get showInNavigation => '탐색에 표시';

  @override
  String get showInLatestMedia => '최신 미디어에 표시';

  @override
  String get sourceLibraries => '소스 라이브러리';

  @override
  String get sourceCollections => '소스 컬렉션';

  @override
  String get excludedGenres => '제외 장르';

  @override
  String get selectAll => '모두 선택';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => '미디어바';

  @override
  String get mediaSources => '미디어 소스';

  @override
  String get behavior => '행동';

  @override
  String get seconds => '초';

  @override
  String get localPreviews => '현지 미리보기';

  @override
  String get localPreviewsDescription => '예고편, 미디어 및 오디오 미리 보기를 구성합니다.';

  @override
  String get mediaBarMode => '미디어 바 스타일';

  @override
  String get mediaBarModeDescription => '다양한 미디어 바 스타일 중 하나를 선택하거나 미디어 바를 끄십시오';

  @override
  String get mediaBarModeMoonfin => '달지느러미';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => '끄다';

  @override
  String get enableMediaBar => '미디어 바 활성화';

  @override
  String get showFeaturedContentSlideshow => '집에서 추천 콘텐츠 슬라이드쇼 표시';

  @override
  String get contentType => '콘텐츠 유형';

  @override
  String get moviesAndTvShows => '영화 및 TV 프로그램';

  @override
  String get moviesOnly => '영화만';

  @override
  String get tvShowsOnly => 'TV 프로그램만';

  @override
  String get itemCount => '아이템 수';

  @override
  String get noneSelected => '선택한 항목 없음';

  @override
  String get noneExcluded => '제외 없음';

  @override
  String get autoAdvance => '자동 진행';

  @override
  String get autoAdvanceSlides => '자동으로 다음 슬라이드로 이동';

  @override
  String get autoAdvanceInterval => '자동 진행 간격';

  @override
  String get trailerPreview => '예고편 미리보기';

  @override
  String get autoPlayTrailers => '3초 후에 미디어 바에서 예고편 자동 재생';

  @override
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

  @override
  String get episodePreview => '에피소드 미리보기';

  @override
  String get mediaPreview => '미디어 미리보기';

  @override
  String get episodePreviewDescription =>
      '초점이 맞춰져 있거나 마우스를 가져가거나 길게 누른 카드에 대해 30초 인라인 미리보기 재생';

  @override
  String get mediaPreviewDescription =>
      '초점이 맞춰져 있거나 마우스를 가져가거나 길게 누른 카드에 대해 30초 인라인 미리보기 재생';

  @override
  String get previewAudio => '오디오 미리보기';

  @override
  String get enablePreviewAudio => '예고편 및 에피소드 미리보기에 오디오 활성화';

  @override
  String get latestMedia => '최신 미디어';

  @override
  String get recentlyReleased => '최근 출시됨';

  @override
  String get myMedia => '내 미디어';

  @override
  String get myMediaSmall => '내 미디어(소형)';

  @override
  String get continueWatching => '계속 시청하기';

  @override
  String get resumeAudio => '오디오 재개';

  @override
  String get resumeBooks => '이력서 도서';

  @override
  String get activeRecordings => '활성 녹음';

  @override
  String get playlists => '재생목록';

  @override
  String get liveTV => '라이브 TV';

  @override
  String get homeSections => '홈 섹션';

  @override
  String get resetToDefaults => '기본값으로 재설정';

  @override
  String get homeRowPosterSize => '홈 행 포스터 크기';

  @override
  String get perRowImageTypeSelection => '행별 이미지 유형 선택';

  @override
  String get configureImageTypeForEachRow => '활성화된 각 홈 행에 대한 이미지 유형 구성';

  @override
  String get mergeContinueWatchingAndNextUp => '계속 시청 및 다음 작업 병합';

  @override
  String get combineBothRows => '두 행을 단일 홈 섹션으로 결합';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => '행별 이미지 유형';

  @override
  String get perRowSettings => '행별 설정';

  @override
  String get autoLogin => '자동 로그인';

  @override
  String get lastUser => '마지막 사용자';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => '항상 인증';

  @override
  String get requirePasswordWithToken => '저장된 토큰이 있어도 비밀번호가 필요합니다';

  @override
  String get confirmExit => '종료 확인';

  @override
  String get showConfirmationBeforeExiting => '나가기 전에 확인 표시';

  @override
  String get blockContentWithRatings => '다음 등급의 콘텐츠를 차단합니다.';

  @override
  String get noContentRatingsFound => '이 서버에는 아직 콘텐츠 등급이 없습니다.';

  @override
  String get couldNotLoadServerRatings => '서버 등급을 로드할 수 없습니다. 저장된 평가만 표시됩니다.';

  @override
  String get couldNotRefreshRatings => '서버에서 평가를 새로 고칠 수 없습니다. 저장된 평가를 표시합니다.';

  @override
  String get enablePinCode => 'PIN 코드 활성화';

  @override
  String get requirePinToAccess => '계정에 액세스하려면 PIN이 필요합니다.';

  @override
  String get changePin => 'PIN 변경';

  @override
  String get setNewPinCode => '새 PIN 코드 설정';

  @override
  String get removePin => 'PIN 삭제';

  @override
  String get removePinProtection => 'PIN 코드 보호 제거';

  @override
  String get screensaver => '화면 보호기';

  @override
  String get inAppScreensaver => '인앱 화면 보호기';

  @override
  String get enableBuiltInScreensaver => '내장 화면 보호기 활성화';

  @override
  String get mode => '방법';

  @override
  String get libraryArt => '도서관 예술';

  @override
  String get logo => '심벌 마크';

  @override
  String get clock => '시계';

  @override
  String get timeout => '시간 초과';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => '디밍 레벨';

  @override
  String get maxAgeRating => '최대 연령 등급';

  @override
  String get any => '어느';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => '연령 등급 필요';

  @override
  String get onlyShowRatedContent => '평가된 콘텐츠만 표시';

  @override
  String get showClock => '시계 표시';

  @override
  String get displayClockDuringScreensaver => '화면 보호기 동안 시계 표시';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => '로튼 토마토(비평가)';

  @override
  String get rottenTomatoesAudience => '로튼 토마토(관객)';

  @override
  String get imdb => 'IMDB';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => '메타크리틱';

  @override
  String get metacriticUser => '메타크리틱(사용자)';

  @override
  String get trakt => '트랙트';

  @override
  String get letterboxd => '레터박스d';

  @override
  String get myAnimeList => '내애니메이션목록';

  @override
  String get aniList => '애니리스트';

  @override
  String get communityRating => '커뮤니티 평가';

  @override
  String get ratings => '평가';

  @override
  String get additionalRatings => '추가 평가';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList 및 TMDB 등급 표시';

  @override
  String get ratingLabels => '등급 라벨';

  @override
  String get showLabelsNextToIcons => '평가 아이콘 옆에 라벨 표시';

  @override
  String get ratingBadges => '평가 배지';

  @override
  String get showDecorativeBadges => '평가 뒤에 장식 배지 표시';

  @override
  String get episodeRatings => '에피소드 등급';

  @override
  String get showRatingsOnEpisodes => '개별 에피소드에 대한 평가 표시';

  @override
  String get ratingSources => '평가 소스';

  @override
  String get ratingSourcesDescription => '앱 전체에 표시되는 평가 소스를 활성화하고 재정렬합니다.';

  @override
  String get pluginLabel => '플러그인';

  @override
  String get pluginDetected => '플러그인이 감지되었습니다';

  @override
  String get pluginNotDetected => '플러그인이 감지되지 않음';

  @override
  String get pluginDetectedDescription =>
      '서버 플러그인이 감지되었습니다. 플러그인이 처음 발견되면 동기화가 자동으로 활성화됩니다.';

  @override
  String get pluginNotDetectedDescription =>
      '서버 플러그인이 현재 감지되지 않습니다. 로컬 설정은 여전히 ​​저장된 값이나 기본 제공 기본값을 사용합니다.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => '이용 가능한 서비스';

  @override
  String get serverPluginSync => '서버 플러그인 동기화';

  @override
  String get syncSettingsWithPlugin => '서버 플러그인과 설정 동기화';

  @override
  String get whatSyncControls => '어떤 동기화 제어';

  @override
  String get syncControlsDescription =>
      '동기화는 플러그인 지원 설정을 서버에 푸시하고 서버에서 가져올지 여부만 제어합니다. 플러그인 동기화가 활성화되면 프로필 선택 및 프로필 동기화 작업이 사용자 정의 설정에 있습니다.';

  @override
  String get recentRequests => '최근 요청';

  @override
  String get recentlyAdded => '최근 추가됨';

  @override
  String get trending => '인기 급상승';

  @override
  String get popularMovies => '인기 영화';

  @override
  String get movieGenres => '영화 장르';

  @override
  String get upcomingMovies => '다가오는 영화';

  @override
  String get studios => '스튜디오';

  @override
  String get popularSeries => '인기 시리즈';

  @override
  String get seriesGenres => '시리즈 장르';

  @override
  String get upcomingSeries => '다가오는 시리즈';

  @override
  String get networks => '네트워크';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => '행을 기본값으로 재설정';

  @override
  String get enableSeerr => 'Seerr 활성화';

  @override
  String get showSeerrInNavigation => '탐색에 Seerr 표시(서버 플러그인 필요)';

  @override
  String get seerrUnavailable => '서버 플러그인 Seerr 지원이 비활성화되어 있으므로 사용할 수 없습니다.';

  @override
  String get nsfwFilter => 'NSFW 필터';

  @override
  String get hideAdultContent => '검색결과에서 성인용 콘텐츠 숨기기';

  @override
  String get seerrNotificationsSection => 'Notifications';

  @override
  String get seerrNotifyNewRequestsTitle => 'New request notifications';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Alert me when someone submits a request';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Request updates';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Approved, declined, and added to your library';

  @override
  String get seerrNotifyIssuesTitle => 'Issue updates';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'New issues, replies, and resolutions';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => '행 검색';

  @override
  String get discoverRowsDescriptionPlugin =>
      '재정렬하려면 드래그하세요. 행을 활성화하거나 비활성화합니다. 활성화된 행 순서는 Moonfin 플러그인과 동기화됩니다.';

  @override
  String get discoverRowsDescription => '재정렬하려면 드래그하세요. 행을 활성화하거나 비활성화합니다.';

  @override
  String get enabled => '활성화됨';

  @override
  String get hidden => '숨겨진';

  @override
  String get aboutTitle => '에 대한';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => '오픈 소스 라이선스';

  @override
  String get sourceCode => '소스 코드';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => '지금 업데이트를 확인하세요';

  @override
  String get checksLatestDesktopRelease => '이 플랫폼의 최신 데스크톱 릴리스를 확인합니다.';

  @override
  String get youAreUpToDate => '당신은 최신 상태입니다.';

  @override
  String get couldNotCheckForUpdates => '지금은 업데이트를 확인할 수 없습니다.';

  @override
  String get noCompatibleUpdate => '이 플랫폼과 호환되는 업데이트 패키지를 찾을 수 없습니다.';

  @override
  String get updateChecksNotSupported => '이 플랫폼에서는 업데이트 확인이 지원되지 않습니다.';

  @override
  String get updateNotificationsDisabled => '업데이트 알림이 비활성화되었습니다.';

  @override
  String get pleaseWaitBeforeChecking => '다시 확인하기 전에 잠시 기다려 주세요.';

  @override
  String get latestUpdateAlreadyShown => '최신 업데이트가 이미 표시되었습니다.';

  @override
  String get updateAvailable => '업데이트가 가능합니다.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => '업데이트 알림';

  @override
  String get showWhenUpdatesAvailable => '업데이트가 있을 때 표시';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => '릴리스 노트 읽기';

  @override
  String get downloadingUpdate => '업데이트 다운로드 중...';

  @override
  String get updateDownloadFailed => '업데이트 다운로드에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get openReleasesPage => '릴리스 페이지 열기';

  @override
  String get navigation => '항해';

  @override
  String get watchedIndicatorsBackdrops => '시청한 지표, 배경';

  @override
  String get focusColorWatchedIndicatorsBackdrops => '초점 색상, 시청 표시기, 배경화면';

  @override
  String get navbarStyleToolbarAppearance => 'Navbar 스타일, 도구 모음 버튼, 모양';

  @override
  String get reorderToggleHomeRows => '홈 행 재정렬 및 ​​전환';

  @override
  String get featuredContentAppearance => '주요 내용, 외관';

  @override
  String get posterSizeImageTypeFolderView => '포스터 크기, 이미지 유형, 폴더 보기';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB 및 평가 소스';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => '분명한';

  @override
  String get browse => '먹다';

  @override
  String get noResults => '결과 없음';

  @override
  String get seerrAvailableStatus => '사용 가능';

  @override
  String get seerrRequestedStatus => '요청됨';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => '시르 설정';

  @override
  String get requestMore => '더 요청하기';

  @override
  String get request => '요구';

  @override
  String get cancelRequest => '요청 취소';

  @override
  String get playInMoonfin => 'Moonfin에 플레이';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => '승인하다';

  @override
  String get declineAction => '감소';

  @override
  String get similar => '비슷한';

  @override
  String get recommendations => '권장 사항';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => '유지하다';

  @override
  String get itemNotFoundInLibrary => 'Moonfin 라이브러리에서 항목을 찾을 수 없습니다.';

  @override
  String get errorSearchingLibrary => '라이브러리 검색 중 오류 발생';

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
  String get submitRequest => '요청 제출';

  @override
  String get allSeasons => '올 시즌';

  @override
  String get advancedOptions => '고급 옵션';

  @override
  String get noServiceServersConfigured => '구성된 서비스 서버가 없습니다.';

  @override
  String get server => '섬기는 사람';

  @override
  String get qualityProfile => '품질 프로필';

  @override
  String get rootFolder => '루트 폴더';

  @override
  String get showMore => '더보기';

  @override
  String get appearances => '형세';

  @override
  String get crewSection => '승무원';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => '요청 없음';

  @override
  String get pendingStatus => '보류 중';

  @override
  String get declinedStatus => '거절됨';

  @override
  String get partiallyAvailable => '부분적으로 사용 가능';

  @override
  String get downloadingStatus => '다운로드 중';

  @override
  String get approvedStatus => '승인됨';

  @override
  String get notRequestedStatus => '요청되지 않음';

  @override
  String get blocklistedStatus => '차단됨';

  @override
  String get deletedStatus => '삭제됨';

  @override
  String get failedStatus => 'Failed';

  @override
  String get processingStatus => 'Processing';

  @override
  String modifiedByName(String name) {
    return 'Modified by $name';
  }

  @override
  String get completedStatus => 'Completed';

  @override
  String get requestErrorDuplicate => 'This title was already requested';

  @override
  String get requestErrorQuota => 'Request limit reached';

  @override
  String get requestErrorBlocklisted => 'This title is blocklisted';

  @override
  String get requestErrorNoSeasons => 'No seasons left to request';

  @override
  String get requestErrorPermission =>
      'You don\'t have permission to make this request';

  @override
  String get seerrRequestsTitle => 'Requests';

  @override
  String get seerrIssuesTitle => 'Issues';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortLastModified => 'Last Modified';

  @override
  String get noIssues => 'No issues';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit movie requests remaining';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit season requests remaining';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Part of $name';
  }

  @override
  String get viewCollection => 'View Collection';

  @override
  String get requestCollection => 'Request Collection';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total movies · $available available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Request $count movies';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Requesting $current of $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Requested $count movies';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Requested $ok of $total movies';
  }

  @override
  String get collectionAllRequested =>
      'All movies are already available or requested';

  @override
  String get reportIssue => 'Report Issue';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'What\'s wrong?';

  @override
  String get allEpisodes => 'All Episodes';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Open';

  @override
  String get resolvedStatus => 'Resolved';

  @override
  String get resolveAction => 'Resolve';

  @override
  String get reopenAction => 'Reopen';

  @override
  String reportedByName(String name) {
    return 'Reported by $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comments';
  }

  @override
  String get addComment => 'Add a comment';

  @override
  String get deleteIssueConfirm => 'Delete this issue?';

  @override
  String get submitReport => 'Submit Report';

  @override
  String get tmdbScore => 'TMDB 점수';

  @override
  String get releaseDateLabel => '출시일';

  @override
  String get firstAirDateLabel => '첫 방송 날짜';

  @override
  String get revenueLabel => '수익';

  @override
  String get runtimeLabel => '실행 시간';

  @override
  String get budgetLabel => '예산';

  @override
  String get originalLanguageLabel => '원어';

  @override
  String get seasonsLabel => '계절';

  @override
  String get episodesLabel => '에피소드';

  @override
  String get access => '입장';

  @override
  String get add => '추가하다';

  @override
  String get address => '주소';

  @override
  String get analytics => '해석학';

  @override
  String get catalog => '목록';

  @override
  String get content => '콘텐츠';

  @override
  String get copy => '복사';

  @override
  String get create => '만들다';

  @override
  String get disable => '장애를 입히다';

  @override
  String get done => '완료';

  @override
  String get edit => '편집하다';

  @override
  String get encoding => '부호화';

  @override
  String get error => '오류';

  @override
  String get forward => '앞으로';

  @override
  String get general => '일반적인';

  @override
  String get go => '가다';

  @override
  String get install => '설치하다';

  @override
  String get installed => '설치됨';

  @override
  String get interval => '간격';

  @override
  String get name => '이름';

  @override
  String get networking => '네트워킹';

  @override
  String get next => '다음';

  @override
  String get path => '길';

  @override
  String get paused => '일시중지됨';

  @override
  String get permissions => '권한';

  @override
  String get processing => '처리';

  @override
  String get profile => '윤곽';

  @override
  String get provider => '공급자';

  @override
  String get refresh => '새로 고치다';

  @override
  String get remote => '원격';

  @override
  String get rename => '이름 바꾸기';

  @override
  String get revoke => '취소';

  @override
  String get role => '역할';

  @override
  String get root => '뿌리';

  @override
  String get run => '달리다';

  @override
  String get search => '찾다';

  @override
  String get select => '선택하다';

  @override
  String get send => '보내다';

  @override
  String get sessions => '세션';

  @override
  String get set => '세트';

  @override
  String get status => '상태';

  @override
  String get stop => '멈추다';

  @override
  String get streaming => '스트리밍';

  @override
  String get time => '시간';

  @override
  String get trickplay => '트릭플레이';

  @override
  String get uninstall => '제거';

  @override
  String get up => '위로';

  @override
  String get update => '업데이트';

  @override
  String get upload => '업로드';

  @override
  String get unmute => '음소거 해제';

  @override
  String get mute => '무음';

  @override
  String get branding => '브랜딩';

  @override
  String get adminDrawerDashboard => '계기반';

  @override
  String get adminDrawerAnalytics => '해석학';

  @override
  String get adminDrawerSettings => '설정';

  @override
  String get adminDrawerBranding => '브랜딩';

  @override
  String get adminDrawerUsers => '사용자';

  @override
  String get adminDrawerLibraries => '도서관';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => '트랜스코딩';

  @override
  String get adminDrawerResume => '재개하다';

  @override
  String get adminDrawerStreaming => '스트리밍';

  @override
  String get adminDrawerTrickplay => '트릭플레이';

  @override
  String get adminDrawerDevices => '장치';

  @override
  String get adminDrawerActivity => '활동';

  @override
  String get adminDrawerNetworking => '네트워킹';

  @override
  String get adminDrawerApiKeys => 'API 키';

  @override
  String get adminDrawerBackups => '백업';

  @override
  String get adminDrawerLogs => '로그';

  @override
  String get adminDrawerScheduledTasks => '예약된 작업';

  @override
  String get adminDrawerPlugins => '플러그인';

  @override
  String get adminDrawerRepositories => '저장소';

  @override
  String get adminDrawerLiveTv => '라이브 TV';

  @override
  String get adminExitTooltip => '관리자 종료';

  @override
  String get adminDashboardLoadFailed => '대시보드를 로드하지 못했습니다.';

  @override
  String get adminMediaOverview => '미디어 개요';

  @override
  String get adminMediaTotalsError => '서버 미디어 총계를 로드할 수 없습니다.';

  @override
  String get adminMediaOverviewSubtitle => '이 서버에 얼마나 많은 콘텐츠가 있는지 빠르게 읽어보세요.';

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
  String get analyticsMediaDistribution => '미디어 배포';

  @override
  String get analyticsVideoCodecs => '비디오 코덱';

  @override
  String get analyticsAudioCodecs => '오디오 코덱';

  @override
  String get analyticsContainers => '컨테이너';

  @override
  String get analyticsTopGenres => '상위 장르';

  @override
  String get analyticsReleaseYears => '출시 연도';

  @override
  String get analyticsContentRatings => '콘텐츠 등급';

  @override
  String get analyticsRuntimeBuckets => '런타임 버킷';

  @override
  String get analyticsFileFormats => '파일 형식';

  @override
  String get analyticsNoData => '사용 가능한 데이터가 없습니다.';

  @override
  String get adminServerInfo => '서버 정보';

  @override
  String get adminRestartPending => '재시작 보류 중';

  @override
  String get adminServerPaths => '서버 경로';

  @override
  String get adminServerActions => '서버 작업';

  @override
  String get adminRestartServer => '서버 다시 시작';

  @override
  String get adminShutdownServer => '서버 종료';

  @override
  String get adminScanLibraries => '스캔 라이브러리';

  @override
  String get adminLibraryScanStarted => '라이브러리 스캔이 시작되었습니다.';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => '서버 재부팅 진행 중';

  @override
  String get adminServerRebootMessage => '서버 재부팅이 진행 중입니다. Moonfin을 다시 시작해주세요';

  @override
  String get adminActiveSessions => '활성 세션';

  @override
  String get adminSessionsLoadFailed => '세션을 로드하지 못했습니다.';

  @override
  String get adminNoActiveSessions => '활성 세션 없음';

  @override
  String get adminRecentActivity => '최근 활동';

  @override
  String get adminNoRecentActivity => '최근 활동 없음';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => '메시지 보내기';

  @override
  String get adminMessageTextHint => '메시지 텍스트';

  @override
  String get adminSetVolume => '볼륨 설정';

  @override
  String get sessionPrev => '이전';

  @override
  String get sessionRewind => '되감기';

  @override
  String get sessionForward => '앞으로';

  @override
  String get sessionNext => '다음';

  @override
  String get sessionVolumeDown => '권 –';

  @override
  String get sessionVolumeUp => '권 +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => '지금 재생 중';

  @override
  String get volume => '용량';

  @override
  String get actions => '행위';

  @override
  String get videoCodec => '비디오 코덱';

  @override
  String get audioCodec => '오디오 코덱';

  @override
  String get hwAccel => '하드웨어 가속';

  @override
  String get completion => '완성';

  @override
  String get direct => '직접';

  @override
  String get adminDisconnect => '연결 끊기';

  @override
  String get adminClearDates => '날짜 지우기';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => '활동 항목이 없습니다.';

  @override
  String get adminEditDeviceName => '장치 이름 편집';

  @override
  String get adminCustomName => '맞춤 이름';

  @override
  String get adminDeviceNameUpdated => '기기 이름이 업데이트되었습니다.';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => '장치 삭제';

  @override
  String get adminDeviceDeleted => '기기가 삭제되었습니다.';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Remove device \'$name\'? The user will need to sign in again on this device.';
  }

  @override
  String get adminDeleteAllDevices => 'Delete all devices';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remove $count devices? Affected users will need to sign in again. Your current device is not affected.';
  }

  @override
  String get adminDevicesDeletedAll => 'Devices removed';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Removed some devices; $count could not be removed.';
  }

  @override
  String get adminDevicesLoadFailed => '기기를 로드하지 못했습니다.';

  @override
  String get adminSearchDevices => '기기 검색';

  @override
  String get adminThisDevice => '이 장치';

  @override
  String get adminEditName => '이름 수정';

  @override
  String get adminLibrariesLoadFailed => '라이브러리를 로드하지 못했습니다.';

  @override
  String get adminNoLibraries => '구성된 라이브러리가 없습니다.';

  @override
  String get adminScanAllLibraries => '모든 라이브러리 스캔';

  @override
  String get adminAddLibrary => '라이브러리 추가';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => '라이브러리 이름 바꾸기';

  @override
  String get adminNewName => '새 이름';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => '라이브러리 삭제';

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
  String get adminRemovePath => '경로 제거';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => '라이브러리 옵션이 저장되었습니다.';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => '라이브러리를 로드하지 못했습니다.';

  @override
  String get adminNoMediaPaths => '구성된 미디어 경로가 없습니다.';

  @override
  String get adminAddPath => '경로 추가';

  @override
  String get adminBrowseFilesystem => '서버 파일 시스템 찾아보기:';

  @override
  String get adminSaveOptions => '저장 옵션';

  @override
  String get adminPreferredMetadataLanguage => '선호하는 메타데이터 언어';

  @override
  String get adminMetadataLanguageHint => '예를 들어 엔, 드, 프랑스';

  @override
  String get adminMetadataCountryCode => '메타데이터 국가 코드';

  @override
  String get adminMetadataCountryHint => '예를 들어 미국, 독일, 프랑스';

  @override
  String get adminLibraryTabPaths => 'Paths';

  @override
  String get adminLibraryTabOptions => 'Options';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Metadata savers';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitle downloaders';

  @override
  String get adminLibLyricDownloaders => 'Lyric downloaders';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadata downloaders: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Image fetchers: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'This server exposes no downloaders for this library type.';

  @override
  String get adminLibrarySectionGeneral => 'General';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Embedded Info';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitles';

  @override
  String get adminLibrarySectionImages => 'Images';

  @override
  String get adminLibrarySectionSeries => 'Series';

  @override
  String get adminLibrarySectionMusic => 'Music';

  @override
  String get adminLibrarySectionMovies => 'Movies';

  @override
  String get adminLibRealtimeMonitor => 'Enable real-time monitoring';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detect file changes and process them automatically.';

  @override
  String get adminLibArchiveMediaFiles => 'Treat archives as media files';

  @override
  String get adminLibEnablePhotos => 'Display photos';

  @override
  String get adminLibSaveLocalMetadata => 'Save artwork into media folders';

  @override
  String get adminLibRefreshInterval => 'Automatic metadata refresh';

  @override
  String get adminLibRefreshNever => 'Never';

  @override
  String get adminLibDefault => 'Default';

  @override
  String get adminLibDisplayTitle => 'Display';

  @override
  String get adminLibDisplaySection => 'Library display';

  @override
  String get adminLibFolderView =>
      'Display a folder view to show plain media folders';

  @override
  String get adminLibSpecialsInSeasons =>
      'Display specials within seasons they aired in';

  @override
  String get adminLibGroupMovies => 'Group movies into collections';

  @override
  String get adminLibGroupShows => 'Group shows into collections';

  @override
  String get adminLibExternalSuggestions =>
      'Show external content in suggestions';

  @override
  String get adminLibDateAddedSection => 'Date added behavior';

  @override
  String get adminLibDateAddedLabel => 'Use date added from';

  @override
  String get adminLibDateAddedImport => 'Date scanned into the library';

  @override
  String get adminLibDateAddedFile => 'Date the file was created';

  @override
  String get adminLibMetadataTitle => 'Metadata and Images';

  @override
  String get adminLibMetadataLangSection => 'Preferred metadata language';

  @override
  String get adminLibChaptersSection => 'Chapters';

  @override
  String get adminLibDummyChapterDuration => 'Dummy chapter duration (seconds)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Length of chapters generated for media that has none. Set to 0 to disable.';

  @override
  String get adminLibChapterImageResolution => 'Chapter image resolution';

  @override
  String get adminLibNfoTitle => 'NFO Settings';

  @override
  String get adminLibNfoHelp =>
      'NFO metadata is compatible with Kodi and similar clients. Settings apply to all libraries that save NFO metadata.';

  @override
  String get adminLibKodiUser => 'User to store watch data for in NFO files';

  @override
  String get adminLibSaveImagePaths => 'Save image paths within NFO files';

  @override
  String get adminLibPathSubstitution =>
      'Enable path substitution for NFO image paths';

  @override
  String get adminLibExtraThumbs =>
      'Copy extrafanart images into an extrathumbs folder';

  @override
  String get adminLibNone => 'None';

  @override
  String adminLibRefreshDays(int days) {
    return '$days days';
  }

  @override
  String get adminLibEmbeddedTitles => 'Use embedded titles';

  @override
  String get adminLibEmbeddedExtrasTitles => 'Use embedded titles for extras';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Use embedded episode information';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Allow embedded subtitles';

  @override
  String get adminLibEmbeddedAllowAll => 'Allow all';

  @override
  String get adminLibEmbeddedAllowText => 'Text only';

  @override
  String get adminLibEmbeddedAllowImage => 'Image only';

  @override
  String get adminLibEmbeddedAllowNone => 'None';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Skip download if embedded subtitles are present';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Skip download if the audio track matches the download language';

  @override
  String get adminLibRequirePerfectMatch => 'Require a perfect subtitle match';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Save subtitles into media folders';

  @override
  String get adminLibChapterImageExtraction => 'Extract chapter images';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extract chapter images during the library scan';

  @override
  String get adminLibTrickplayExtraction => 'Enable trickplay image extraction';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extract trickplay images during the library scan';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Save trickplay images into media folders';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatically merge series that are spread across multiple folders';

  @override
  String get adminLibSeasonZeroName => 'Season zero display name';

  @override
  String get adminLibLufsScan => 'Enable LUFS scan for audio normalization';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Prefer non-standard artists tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatically add movies to collections';

  @override
  String get adminLibraryNameRequired => '라이브러리 이름은 필수 항목입니다.';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => '도서관 이름';

  @override
  String get adminSelectedPaths => '선택한 경로:';

  @override
  String get adminNoPathsAdded => '추가된 경로 없음(나중에 추가 가능)';

  @override
  String get adminCreateLibrary => '라이브러리 생성';

  @override
  String get paths => '경로:';

  @override
  String get adminDisableUser => '사용자 비활성화';

  @override
  String get adminEnableUser => '사용자 활성화';

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
  String get adminUsersLoadFailed => '사용자를 로드하지 못했습니다.';

  @override
  String get adminSearchUsers => '사용자 검색';

  @override
  String get adminEditUser => '사용자 편집';

  @override
  String get adminAddUser => '사용자 추가';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => '사용자 생성';

  @override
  String get adminPasswordOptional => '비밀번호(선택사항)';

  @override
  String get adminUsernameRequired => '사용자 이름은 비워둘 수 없습니다.';

  @override
  String get adminNoProfileChanges => '저장할 프로필 변경사항이 없습니다.';

  @override
  String get adminProfileSaved => '프로필이 저장되었습니다';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => '권한이 저장되었습니다';

  @override
  String get adminPasswordsMismatch => '비밀번호가 일치하지 않습니다.';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => '사용자를 로드하지 못했습니다.';

  @override
  String get adminBackToUsers => '사용자로 돌아가기';

  @override
  String get adminSaveProfile => '프로필 저장';

  @override
  String get adminDeleteUser => '사용자 삭제';

  @override
  String get admin => '관리자';

  @override
  String get adminFullAccessWarning =>
      '관리자는 서버에 대한 완전한 액세스 권한을 갖습니다. 신중하게 부여하십시오.';

  @override
  String get administrator => '관리자';

  @override
  String get adminHiddenUser => '숨겨진 사용자';

  @override
  String get adminAllowMediaPlayback => '미디어 재생 허용';

  @override
  String get adminAllowAudioTranscoding => '오디오 트랜스코딩 허용';

  @override
  String get adminAllowVideoTranscoding => '비디오 트랜스코딩 허용';

  @override
  String get adminAllowRemuxing => '재다중화 허용';

  @override
  String get adminForceRemoteTranscoding => '원격 소스 트랜스코딩 강제';

  @override
  String get adminAllowContentDeletion => '콘텐츠 삭제 허용';

  @override
  String get adminAllowContentDownloading => '콘텐츠 다운로드 허용';

  @override
  String get adminAllowPublicSharing => '공개 공유 허용';

  @override
  String get adminAllowRemoteControl => '다른 사용자의 원격 제어 허용';

  @override
  String get adminAllowSharedDeviceControl => '공유 장치 제어 허용';

  @override
  String get adminAllowRemoteAccess => '원격 액세스 허용';

  @override
  String get adminRemoteBitrateLimit => '원격 클라이언트 비트 전송률 제한(bps)';

  @override
  String get adminLeaveEmptyNoLimit => '제한 없이 비워 두세요.';

  @override
  String get adminMaxActiveSessions => '최대 활성 세션';

  @override
  String get adminAllowLiveTvAccess => '실시간 TV 액세스 허용';

  @override
  String get adminAllowLiveTvManagement => '실시간 TV 관리 허용';

  @override
  String get adminAllowCollectionManagement => '컬렉션 관리 허용';

  @override
  String get adminAllowSubtitleManagement => '자막 관리 허용';

  @override
  String get adminAllowLyricManagement => '가사 관리 허용';

  @override
  String get adminSavePermissions => '저장 권한';

  @override
  String get adminEnableAllLibraryAccess => '모든 라이브러리에 대한 액세스 활성화';

  @override
  String get adminSaveAccess => '액세스 저장';

  @override
  String get adminChangePassword => '비밀번호 변경';

  @override
  String get adminNewPassword => '새 비밀번호';

  @override
  String get adminConfirmPassword => '비밀번호 확인';

  @override
  String get adminSetPassword => '비밀번호 설정';

  @override
  String get adminResetPassword => '비밀번호 재설정';

  @override
  String get adminPasswordReset => '비밀번호 재설정';

  @override
  String get adminPasswordUpdated => '비밀번호가 업데이트되었습니다.';

  @override
  String get adminUserSettings => '사용자 설정';

  @override
  String get adminLibraryAccess => '도서관 이용';

  @override
  String get adminDeviceAndChannelAccess => '장치 및 채널 액세스';

  @override
  String get adminEnableAllDevices => '모든 장치에 대한 액세스 활성화';

  @override
  String get adminEnableAllChannels => '모든 채널에 대한 액세스 활성화';

  @override
  String get adminParentalControl => 'Parental Control';

  @override
  String get adminMaxParentalRating => 'Maximum allowed parental rating';

  @override
  String get adminMaxParentalRatingHint =>
      'Content with a higher rating will be hidden from this user.';

  @override
  String get adminParentalRatingNone => 'None';

  @override
  String get adminBlockUnratedItems =>
      'Block items with no or unrecognized rating information';

  @override
  String get adminUnratedBook => 'Books';

  @override
  String get adminUnratedChannelContent => 'Channels';

  @override
  String get adminUnratedLiveTvChannel => 'Live TV';

  @override
  String get adminUnratedMovie => 'Movies';

  @override
  String get adminUnratedMusic => 'Music';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Shows';

  @override
  String get adminAccessSchedules => 'Access Schedules';

  @override
  String get adminAccessSchedulesHint =>
      'Allow access only during the scheduled times below. Access is allowed all day when no schedule is set.';

  @override
  String get adminAddSchedule => 'Add Schedule';

  @override
  String get adminScheduleDay => 'Day';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'End';

  @override
  String get adminDayEveryday => 'Every day';

  @override
  String get adminDayWeekday => 'Weekday';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Sunday';

  @override
  String get adminDayMonday => 'Monday';

  @override
  String get adminDayTuesday => 'Tuesday';

  @override
  String get adminDayWednesday => 'Wednesday';

  @override
  String get adminDayThursday => 'Thursday';

  @override
  String get adminDayFriday => 'Friday';

  @override
  String get adminDaySaturday => 'Saturday';

  @override
  String get adminAllowedTags => 'Allowed tags';

  @override
  String get adminAllowedTagsHint =>
      'Only content with these tags is shown. Leave empty to allow all.';

  @override
  String get adminBlockedTags => 'Blocked tags';

  @override
  String get adminBlockedTagsHint =>
      'Content with these tags is hidden from this user.';

  @override
  String get adminAddTag => 'Add tag';

  @override
  String get adminEnabledDevices => 'Enabled devices';

  @override
  String get adminEnabledChannels => 'Enabled channels';

  @override
  String get adminAuthProvider => 'Authentication provider';

  @override
  String get adminPasswordResetProvider => 'Password reset provider';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximum failed login attempts before lockout';

  @override
  String get adminLoginAttemptsHint =>
      'Set to 0 for the default, or -1 to disable lockout.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay access';

  @override
  String get adminSyncPlayCreateAndJoin => 'Allow creating and joining groups';

  @override
  String get adminSyncPlayJoin => 'Allow joining groups';

  @override
  String get adminSyncPlayNone => 'No access';

  @override
  String get adminContentDeletionFolders => 'Allow content deletion from';

  @override
  String get adminResetPasswordWarning =>
      '그러면 비밀번호가 제거됩니다. 사용자는 비밀번호 없이 로그인할 수 있습니다.';

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
  String get adminCreateApiKey => 'API 키 생성';

  @override
  String get adminAppName => '앱 이름';

  @override
  String get adminApiKeyCreated => 'API 키가 생성되었습니다.';

  @override
  String get adminApiKeyCreatedNoToken =>
      '키가 성공적으로 생성되었습니다. 서버가 토큰을 반환하지 않았습니다. 서버 API 키를 확인하세요.';

  @override
  String get adminKeyCopied => '키가 클립보드에 복사되었습니다.';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => '서버 응답에서 키 토큰이 누락되었습니다.';

  @override
  String get adminRevokeApiKey => 'API 키 취소';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API 키가 취소되었습니다.';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API 키를 로드하지 못했습니다.';

  @override
  String get adminApiKeysTitle => 'API 키';

  @override
  String get adminCreateKey => '키 생성';

  @override
  String get adminNoApiKeys => 'API 키를 찾을 수 없습니다.';

  @override
  String get adminUnknownApp => '알 수 없는 앱';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Create Backup';

  @override
  String get adminBackupInclude => 'Choose what to include in the backup.';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Always included';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Subtitles';

  @override
  String get adminBackupTrickplay => 'Trickplay images';

  @override
  String get adminCreatingBackup => '백업 생성 중...';

  @override
  String get adminBackupCreated => '백업이 성공적으로 생성되었습니다.';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => '서버 응답에 백업 경로가 없습니다.';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => '복원 확인';

  @override
  String get adminRestoringBackup => '백업 복원 중...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => '백업을 로드하지 못했습니다.';

  @override
  String get adminCreateBackup => '백업 생성';

  @override
  String get adminNoBackups => '백업을 찾을 수 없습니다.';

  @override
  String get adminViewDetails => '세부정보 보기';

  @override
  String get restore => '복원하다';

  @override
  String get adminLogsLoadFailed => '서버 로그를 로드하지 못했습니다.';

  @override
  String get adminNoLogFiles => '로그 파일을 찾을 수 없습니다.';

  @override
  String get adminLogCopied => '로그가 클립보드에 복사되었습니다.';

  @override
  String get adminSaveLogFile => '로그 파일 저장';

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
  String get adminSearchInLog => '로그에서 검색';

  @override
  String get adminNoMatchingLines => '일치하는 줄이 없습니다.';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => '예약된 작업을 찾을 수 없습니다.';

  @override
  String get adminNoTasksMatchFilter => '현재 필터와 일치하는 작업이 없습니다.';

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
  String get adminRunNow => '지금 실행';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => '마지막 실행';

  @override
  String get adminTriggers => '트리거';

  @override
  String get adminAddTrigger => '트리거 추가';

  @override
  String get adminNoTriggers => '구성된 트리거가 없습니다.';

  @override
  String get adminTriggerType => '트리거 유형';

  @override
  String get adminTimeLimit => '시간 제한(선택 사항)';

  @override
  String get adminNoLimit => '제한 없음';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => '요일';

  @override
  String get adminSearchPlugins => '플러그인 검색...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => '플러그인 제거';

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
  String get adminNoPluginsMatchSearch => '검색어와 일치하는 플러그인이 없습니다';

  @override
  String get adminNoPluginsInstalled => '플러그인이 설치되지 않았습니다.';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => '검색과 일치하는 패키지가 없습니다.';

  @override
  String get adminNoPackagesAvailable => '사용 가능한 패키지가 없습니다.';

  @override
  String get adminExperimentalIntegration => '실험적 통합';

  @override
  String get adminExperimentalWarning =>
      '플러그인 설정 통합은 아직 실험적입니다. 일부 설정 페이지가 올바르게 렌더링되지 않을 수 있습니다.';

  @override
  String get continueAction => '계속하다';

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
  String get adminMissingAuthToken => '설정을 열 수 없습니다. 인증 토큰이 누락되었습니다.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => '플러그인을 찾을 수 없습니다';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => '플러그인 활성화';

  @override
  String get adminPluginSettingsPage => '플러그인 설정 페이지';

  @override
  String get adminRevisionHistory => '개정 내역';

  @override
  String get adminNoChangelog => '사용 가능한 변경 내역이 없습니다.';

  @override
  String get adminRemoveRepository => '저장소 제거';

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
  String get adminRepositoryNameHint => '예를 들어 Jellyfin 안정';

  @override
  String get adminRepositoryUrl => '저장소 URL';

  @override
  String get adminAddEntry => '항목 추가';

  @override
  String get adminInvalidUrl => '잘못된 URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => '브라우저에서 열기';

  @override
  String get adminOpenExternally => '외부에서 열기';

  @override
  String get adminGeneralSettings => '일반 설정';

  @override
  String get adminServerName => '서버 이름';

  @override
  String get adminPreferredMetadataCountry => '선호하는 메타데이터 국가';

  @override
  String get adminCachePath => '캐시 경로';

  @override
  String get adminMetadataPath => '메타데이터 경로';

  @override
  String get adminLibraryScanConcurrency => '라이브러리 스캔 동시성';

  @override
  String get adminParallelImageEncodingLimit => '병렬 이미지 인코딩 제한';

  @override
  String get adminSlowResponseThreshold => '느린 응답 임계값(ms)';

  @override
  String get adminBrandingSaved => '브랜딩 설정이 저장되었습니다.';

  @override
  String get adminBrandingLoadFailed => '브랜딩 설정을 로드하지 못했습니다.';

  @override
  String get adminLoginDisclaimer => '로그인 면책조항';

  @override
  String get adminLoginDisclaimerHint => '로그인 양식 아래에 표시되는 HTML';

  @override
  String get adminCustomCss => '맞춤 CSS';

  @override
  String get adminCustomCssHint => '웹 인터페이스에 적용된 사용자 정의 CSS';

  @override
  String get adminEnableSplashScreen => '스플래시 화면 활성화';

  @override
  String get adminStreamingSaved => '스트리밍 설정이 저장되었습니다.';

  @override
  String get adminStreamingLoadFailed => '스트리밍 설정을 로드하지 못했습니다.';

  @override
  String get adminStreamingDescription => '원격 연결에 대한 전역 스트리밍 비트 전송률 제한을 설정합니다.';

  @override
  String get adminRemoteBitrateLimitMbps => '원격 클라이언트 비트 전송률 제한(Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => '비워두거나 무제한인 경우 0으로 두세요.';

  @override
  String get adminPlaybackSaved => '재생 설정이 저장되었습니다.';

  @override
  String get adminPlaybackLoadFailed => '재생 설정을 로드하지 못했습니다.';

  @override
  String get adminPlaybackTranscoding => '재생/트랜스코딩';

  @override
  String get adminHardwareAcceleration => '하드웨어 가속';

  @override
  String get adminVaapiDevice => 'VA-API 장치';

  @override
  String get adminEnableHardwareEncoding => '하드웨어 인코딩 활성화';

  @override
  String get adminEnableHardwareDecoding => '다음에 대해 하드웨어 디코딩을 활성화합니다.';

  @override
  String get adminEncodingThreads => '인코딩 스레드';

  @override
  String get adminAutomatic => '0 = 자동';

  @override
  String get adminTranscodingTempPath => '트랜스코딩 임시 경로';

  @override
  String get adminEnableFallbackFont => '대체 글꼴 활성화';

  @override
  String get adminFallbackFontPath => '대체 글꼴 경로';

  @override
  String get adminAllowSegmentDeletion => '세그먼트 삭제 허용';

  @override
  String get adminSegmentKeepSeconds => '세그먼트 유지(초)';

  @override
  String get adminThrottleBuffering => '스로틀 버퍼링';

  @override
  String get adminTrickplaySaved => '트릭플레이 설정이 저장되었습니다';

  @override
  String get adminTrickplayLoadFailed => '트릭플레이 설정을 로드하지 못했습니다.';

  @override
  String get adminEnableHardwareAcceleration => '하드웨어 가속 활성화';

  @override
  String get adminEnableKeyFrameExtraction => '키프레임만 추출 활성화';

  @override
  String get adminKeyFrameSubtitle => '빠르지만 정확도가 낮음';

  @override
  String get adminScanBehavior => '스캔 동작';

  @override
  String get adminProcessPriority => '프로세스 우선순위';

  @override
  String get adminImageSettings => '이미지 설정';

  @override
  String get adminIntervalMs => '간격(밀리초)';

  @override
  String get adminCaptureFrameSubtitle => '프레임 캡처 빈도';

  @override
  String get adminWidthResolutions => '폭 해상도';

  @override
  String get adminTileWidth => '타일 ​​너비';

  @override
  String get adminTileHeight => '타일 ​​높이';

  @override
  String get adminQualitySubtitle => '낮은 값 = 더 나은 품질, 더 큰 파일';

  @override
  String get adminProcessThreads => '프로세스 스레드';

  @override
  String get adminResumeSaved => '이력서 설정이 저장되었습니다.';

  @override
  String get adminResumeLoadFailed => '이력서 설정을 로드하지 못했습니다.';

  @override
  String get adminResumeDescription =>
      '콘텐츠가 부분적으로 재생되거나 완전히 재생된 것으로 표시되어야 하는 시점을 구성합니다.';

  @override
  String get adminMinResumePercentage => '최소 이력서 비율';

  @override
  String get adminMinResumeSubtitle => '진행 상황을 저장하려면 콘텐츠를 이 비율 이상으로 재생해야 합니다.';

  @override
  String get adminMaxResumePercentage => '최대 재개 비율';

  @override
  String get adminMaxResumeSubtitle => '이 비율 이후에는 콘텐츠가 완전히 재생된 것으로 간주됩니다.';

  @override
  String get adminMinResumeDuration => '최소 재개 기간(초)';

  @override
  String get adminMinResumeDurationSubtitle => '이보다 짧은 항목은 재개할 수 없습니다.';

  @override
  String get adminMinAudiobookResume => '최소 오디오북 재개 비율';

  @override
  String get adminMaxAudiobookResume => '최대 오디오북 재개 비율';

  @override
  String get adminNetworkingSaved => '네트워킹 설정이 저장되었습니다. 서버를 다시 시작해야 할 수도 있습니다.';

  @override
  String get adminNetworkingLoadFailed => '네트워킹 설정을 로드하지 못했습니다.';

  @override
  String get adminNetworkingWarning => '네트워킹 설정을 변경하면 서버를 다시 시작해야 할 수도 있습니다.';

  @override
  String get adminEnableRemoteAccess => '원격 액세스 활성화';

  @override
  String get ports => '포트';

  @override
  String get adminHttpPort => 'HTTP 포트';

  @override
  String get adminHttpsPort => 'HTTPS 포트';

  @override
  String get adminPublicHttpsPort => '공용 HTTPS 포트';

  @override
  String get adminBaseUrl => '기본 URL';

  @override
  String get adminBaseUrlHint => '예를 들어 /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS 활성화';

  @override
  String get adminLocalNetwork => '로컬 네트워크';

  @override
  String get adminLocalNetworkAddresses => '로컬 네트워크 주소';

  @override
  String get adminKnownProxies => '알려진 프록시';

  @override
  String get adminRemoteIpFilter => '원격 IP 필터';

  @override
  String get adminRemoteIpFilterEntries => '원격 IP 필터';

  @override
  String get adminCertificatePath => '인증서 경로';

  @override
  String get whitelist => '화이트리스트';

  @override
  String get blacklist => '블랙리스트';

  @override
  String get notSet => '설정되지 않음';

  @override
  String get adminMetadataSaved => '메타데이터가 저장되었습니다';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => '메타데이터 새로 고침';

  @override
  String get recursive => '재귀적';

  @override
  String get adminReplaceAllMetadata => '모든 메타데이터 교체';

  @override
  String get adminReplaceAllImages => '모든 이미지 교체';

  @override
  String get adminMetadataRefreshRequested => '메타데이터 새로고침이 요청되었습니다.';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminNoRemoteMatches => '원격 일치 항목을 찾을 수 없습니다.';

  @override
  String get adminRemoteResults => '원격 결과';

  @override
  String get adminRemoteMetadataApplied => '원격 메타데이터가 적용됨';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => '콘텐츠 유형 업데이트';

  @override
  String get adminContentType => '콘텐츠 유형';

  @override
  String get adminContentTypeUpdated => '콘텐츠 유형이 업데이트되었습니다.';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => '메타데이터 편집기를 로드하지 못했습니다.';

  @override
  String get adminNoPeopleEntries => '인물 항목 없음';

  @override
  String get adminNoExternalIds => '사용 가능한 외부 ID가 없습니다.';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => '지원되지 않는 이미지 형식';

  @override
  String get adminImageReadFailed => '선택한 이미지를 읽지 못했습니다.';

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
  String get adminAllProviders => '모든 제공업체';

  @override
  String get adminNoRemoteImages => '원격 이미지를 찾을 수 없습니다.';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => '튜너 추가';

  @override
  String get adminTunerType => '튜너 유형';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, 기타';

  @override
  String get adminUrlPath => 'URL/경로';

  @override
  String get adminNameOptional => '이름(선택사항)';

  @override
  String get adminTunerAdded => '튜너가 추가되었습니다';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => '가이드 제공자 추가';

  @override
  String get adminProviderType => '제공자 유형';

  @override
  String get adminProviderTypeHint => '일정직접 또는 XMLTV';

  @override
  String get adminUsernameOptional => '사용자 이름(선택 사항)';

  @override
  String get adminRefreshInterval => '새로 고침 간격(시간)';

  @override
  String get adminProviderAdded => '제공업체가 추가됨';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => '튜너 재설정이 요청되었습니다.';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => '녹화 설정';

  @override
  String get adminPrePadding => '사전 패딩(분)';

  @override
  String get adminPostPadding => '사후 패딩(분)';

  @override
  String get adminRecordingPath => '녹음 경로';

  @override
  String get adminSeriesRecordingPath => '시리즈 녹화 경로';

  @override
  String get adminMovieRecordingPath => 'Movie recording path';

  @override
  String get adminGuideDays => 'Guide data days';

  @override
  String get adminGuideDaysAuto => 'Automatic';

  @override
  String adminGuideDaysValue(int days) {
    return '$days days';
  }

  @override
  String get adminRecordingPostProcessor => 'Post-processing application path';

  @override
  String get adminRecordingPostProcessorArgs => 'Post-processor arguments';

  @override
  String get adminSaveRecordingNfo => 'Save recording NFO metadata';

  @override
  String get adminSaveRecordingImages => 'Save recording images';

  @override
  String get adminLiveTvSectionTiming => 'Timing';

  @override
  String get adminLiveTvSectionPaths => 'Recording paths';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-processing';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Guide data: $value';
  }

  @override
  String get adminRecordingSettingsSaved => '녹화 설정이 저장되었습니다.';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => '채널 매핑 설정';

  @override
  String get adminMappingJson => 'JSON 매핑';

  @override
  String get adminMappingJsonHint => '예: JSON 페이로드 매핑';

  @override
  String get adminChannelMappingsUpdated => '채널 매핑이 업데이트되었습니다.';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => '실시간 TV 관리를 로드하지 못했습니다.';

  @override
  String get adminTunerDevices => '튜너 장치';

  @override
  String get adminNoTunerHosts => '구성된 튜너 호스트가 없습니다.';

  @override
  String get adminGuideProviders => '가이드 제공업체';

  @override
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => '공급자 추가';

  @override
  String get adminNoListingProviders => '구성된 목록 제공업체가 없습니다.';

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
  String get adminTunerDiscovery => '튜너 발견';

  @override
  String get adminChannelMappings => '채널 매핑';

  @override
  String get adminNoDiscoveredTuners => '아직 검색된 튜너가 없습니다.';

  @override
  String get adminSettingsSaved => '설정이 저장되었습니다.';

  @override
  String get adminBackupsNotAvailable => '이 서버 빌드에서는 백업을 사용할 수 없습니다.';

  @override
  String get adminRestoreWarning1 => '복원하면 현재 서버 데이터가 모두 백업 데이터로 대체됩니다.';

  @override
  String get adminRestoreWarning2 => '현재 서버 설정, 사용자 및 라이브러리 데이터를 덮어씁니다.';

  @override
  String get adminRestoreWarning3 => '복원 후 서버가 다시 시작됩니다.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      '복원을 요청했습니다. 서버를 다시 시작하면 이 세션의 연결이 끊어질 수 있습니다.';

  @override
  String get adminBackupsTitle => '백업';

  @override
  String get adminUnknownDate => '날짜를 알 수 없음';

  @override
  String get adminUnnamedBackup => '이름 없는 백업';

  @override
  String get adminLiveTvNotAvailable => '이 서버 빌드에서는 라이브 TV 관리를 사용할 수 없습니다.';

  @override
  String get adminLiveTvTitle => '라이브 TV 관리';

  @override
  String get adminApply => '적용하다';

  @override
  String get adminNotSet => '설정되지 않음';

  @override
  String get adminReset => '다시 놓기';

  @override
  String get adminLogsTitle => '서버 로그';

  @override
  String get adminLogsNewestFirst => '최신순';

  @override
  String get adminLogsOldestFirst => '오래된 것부터';

  @override
  String get adminLogsJustNow => '방금';

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
  String get adminLogViewerNoMatches => '일치하는 줄이 없습니다.';

  @override
  String get adminMetadataEditorTitle => '메타데이터 편집기';

  @override
  String get adminMetadataIdentify => 'Identify';

  @override
  String get adminMetadataType => '유형';

  @override
  String get adminMetadataDetails => '세부';

  @override
  String get adminMetadataExternalIds => '외부 ID';

  @override
  String get adminMetadataImages => '이미지';

  @override
  String get adminMetadataFieldTitle => '제목';

  @override
  String get adminMetadataFieldSortTitle => '제목 정렬';

  @override
  String get adminMetadataFieldOriginalTitle => '원래 제목';

  @override
  String get adminMetadataFieldPremiereDate => '개봉 날짜(YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => '종료일(YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => '생산연도';

  @override
  String get adminMetadataFieldOfficialRating => '공식 등급';

  @override
  String get adminMetadataFieldCommunityRating => '커뮤니티 평가';

  @override
  String get adminMetadataFieldCriticRating => '비평가 평가';

  @override
  String get adminMetadataFieldTagline => '태그라인';

  @override
  String get adminMetadataFieldOverview => '개요';

  @override
  String get adminMetadataGenres => '장르';

  @override
  String get adminMetadataTags => '태그';

  @override
  String get adminMetadataStudios => '스튜디오';

  @override
  String get adminMetadataPeople => '사람들';

  @override
  String get adminMetadataAddGenre => '장르 추가';

  @override
  String get adminMetadataAddTag => '태그 추가';

  @override
  String get adminMetadataAddStudio => '스튜디오 추가';

  @override
  String get adminMetadataAddPerson => '사람 추가';

  @override
  String get adminMetadataEditPerson => '개인 편집';

  @override
  String get adminMetadataRole => '역할';

  @override
  String get adminMetadataImagePrimary => '주요한';

  @override
  String get adminMetadataImageBackdrop => '배경';

  @override
  String get adminMetadataImageLogo => '심벌 마크';

  @override
  String get adminMetadataImageBanner => '기치';

  @override
  String get adminMetadataImageThumb => '무지';

  @override
  String get adminMetadataRecursive => '재귀적';

  @override
  String get adminMetadataProvider => '공급자';

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
  String get adminMetadataImageReadFailed => '선택한 이미지를 읽지 못했습니다.';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent => '그러면 항목에서 현재 이미지가 제거됩니다.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => '업로드';

  @override
  String get adminMetadataUpdate => '업데이트';

  @override
  String get adminMetadataRemoteImage => '원격 이미지';

  @override
  String get adminPluginsInstalled => '설치됨';

  @override
  String get adminPluginsCatalog => '목록';

  @override
  String get adminPluginsActive => '활동적인';

  @override
  String get adminPluginsRestart => '다시 시작';

  @override
  String get adminPluginsNoSearchResults => '검색어와 일치하는 플러그인이 없습니다';

  @override
  String get adminPluginsNoneInstalled => '플러그인이 설치되지 않았습니다.';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => '업데이트 가능';

  @override
  String get adminPluginsPendingRemoval => '다시 시작한 후 제거 보류 중';

  @override
  String get adminPluginsChangesPending => '재시작 보류 중인 변경사항';

  @override
  String get adminPluginsEnable => '할 수 있게 하다';

  @override
  String get adminPluginsDisable => '장애를 입히다';

  @override
  String get adminPluginsInstallUpdate => '업데이트 설치';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '검색과 일치하는 패키지가 없습니다.';

  @override
  String get adminPluginsCatalogEmpty => '사용 가능한 패키지가 없습니다.';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => '실험적 통합';

  @override
  String get adminPluginDetailExperimentalContent =>
      '플러그인 설정 통합은 아직 실험적입니다. 일부 필드 또는 레이아웃은 아직 올바르게 렌더링되지 않을 수 있습니다.';

  @override
  String get adminPluginDetailToggle404 =>
      '플러그인을 전환하지 못했습니다. 서버가 이 플러그인 버전을 찾을 수 없습니다. 플러그인을 새로 고친 후 다시 시도해 보세요.';

  @override
  String get adminPluginDetailToggleDioError =>
      '플러그인을 전환하지 못했습니다. 자세한 내용은 서버 로그를 확인하세요.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => '세부';

  @override
  String get adminPluginDetailDeveloper => '개발자';

  @override
  String get adminPluginDetailRepository => '저장소';

  @override
  String get adminPluginDetailBundled => '번들로 제공';

  @override
  String get adminPluginDetailEnablePlugin => '플러그인 활성화';

  @override
  String get adminPluginDetailRestartRequired =>
      '변경 사항을 적용하려면 서버를 다시 시작해야 합니다.';

  @override
  String get adminPluginDetailRemovalPending => '이 플러그인은 서버가 다시 시작되면 제거됩니다.';

  @override
  String get adminPluginDetailMalfunctioned =>
      '이 플러그인은 오작동을 일으켜 제대로 작동하지 않을 수 있습니다.';

  @override
  String get adminPluginDetailNotSupported => '이 플러그인은 현재 서버 버전에서 지원되지 않습니다.';

  @override
  String get adminPluginDetailSuperseded => '이 플러그인은 최신 버전으로 대체되었습니다.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => '저장소 제거';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => '제거하다';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => '구성된 저장소가 없습니다.';

  @override
  String get adminReposEmptySubtitle => '사용 가능한 플러그인을 찾아보려면 저장소를 추가하세요.';

  @override
  String get adminReposUnnamed => '(이름 없음)';

  @override
  String get adminReposEditTitle => '저장소 편집';

  @override
  String get adminReposAddTitle => '저장소 추가';

  @override
  String get adminReposUrl => '저장소 URL';

  @override
  String get adminReposNameHint => '예를 들어 Jellyfin 안정';

  @override
  String get adminPluginSettingsInvalidUrl => '잘못된 URL';

  @override
  String get adminGeneralSettingsTitle => '일반 설정';

  @override
  String get adminGeneralMetadataLanguage => '선호하는 메타데이터 언어';

  @override
  String get adminGeneralMetadataLanguageHint => '예를 들어 엔, 드, 프랑스';

  @override
  String get adminGeneralMetadataCountry => '선호하는 메타데이터 국가';

  @override
  String get adminGeneralMetadataCountryHint => '예를 들어 미국, 독일, 프랑스';

  @override
  String get adminGeneralLibraryScanConcurrency => '라이브러리 스캔 동시성';

  @override
  String get adminGeneralImageEncodingLimit => '병렬 이미지 인코딩 제한';

  @override
  String get adminUnknownError => '알 수 없는 오류';

  @override
  String get adminBrowse => '먹다';

  @override
  String get adminCloseBrowser => '브라우저 닫기';

  @override
  String get adminNetworkingTitle => '네트워킹';

  @override
  String get adminNetworkingRestartWarning =>
      '네트워킹 설정을 변경하면 서버를 다시 시작해야 할 수도 있습니다.';

  @override
  String get adminNetworkingRemoteAccess => '원격 액세스 활성화';

  @override
  String get adminNetworkingPorts => '포트';

  @override
  String get adminNetworkingHttpPort => 'HTTP 포트';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS 포트';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS 활성화';

  @override
  String get adminNetworkingLocalNetwork => '로컬 네트워크';

  @override
  String get adminNetworkingLocalAddresses => '로컬 네트워크 주소';

  @override
  String get adminNetworkingAddressHint => '예를 들어 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => '알려진 프록시';

  @override
  String get adminNetworkingProxyHint => '예를 들어 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => '화이트리스트';

  @override
  String get adminNetworkingBlacklist => '블랙리스트';

  @override
  String get adminNetworkingAddEntry => '항목 추가';

  @override
  String get adminBrandingTitle => '브랜딩';

  @override
  String get adminBrandingLoginDisclaimer => '로그인 면책조항';

  @override
  String get adminBrandingLoginDisclaimerHint => '로그인 양식 아래에 표시되는 HTML';

  @override
  String get adminBrandingCustomCss => '맞춤 CSS';

  @override
  String get adminBrandingCustomCssHint => '웹 인터페이스에 적용된 사용자 정의 CSS';

  @override
  String get adminBrandingEnableSplash => '스플래시 화면 활성화';

  @override
  String get adminBrandingSplashUpload => 'Upload image';

  @override
  String get adminBrandingSplashUploaded => 'Splashscreen updated';

  @override
  String get adminBrandingSplashUploadFailed => 'Failed to upload splashscreen';

  @override
  String get adminBrandingSplashDeleted => 'Splashscreen removed';

  @override
  String get adminBrandingNoSplash => 'No custom splashscreen';

  @override
  String get adminPlaybackHwAccel => '하드웨어 가속';

  @override
  String get adminPlaybackHwAccelLabel => '하드웨어 가속';

  @override
  String get adminPlaybackEnableHwEncoding => '하드웨어 인코딩 활성화';

  @override
  String get adminPlaybackEnableHwDecoding => '다음에 대해 하드웨어 디코딩을 활성화합니다.';

  @override
  String get adminPlaybackQsvDevice => 'QSV device';

  @override
  String get adminPlaybackEnhancedNvdec => 'Enable enhanced NVDEC decoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Prefer system native hardware decoder';

  @override
  String get adminPlaybackColorDepth => 'Hardware decoding color depth';

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
  String get adminPlaybackAllowHevcEncoding => 'Allow HEVC encoding';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Allow AV1 encoding';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Enable Intel low-power H.264 encoder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Enable Intel low-power HEVC encoder';

  @override
  String get adminPlaybackToneMapping => 'Tone Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Enable tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Enable VPP tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Enable VideoToolbox tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tone mapping algorithm';

  @override
  String get adminPlaybackTonemappingMode => 'Tone mapping mode';

  @override
  String get adminPlaybackTonemappingRange => 'Tone mapping range';

  @override
  String get adminPlaybackTonemappingDesat => 'Tone mapping desaturation';

  @override
  String get adminPlaybackTonemappingPeak => 'Tone mapping peak';

  @override
  String get adminPlaybackTonemappingParam => 'Tone mapping parameter';

  @override
  String get adminPlaybackPresetsQuality => 'Presets & Quality';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder preset';

  @override
  String get adminPlaybackH264Crf => 'H.264 encoding CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) encoding CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlace method';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Enable audio VBR encoding';

  @override
  String get adminPlaybackDownmixBoost => 'Audio downmix boost';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo downmix algorithm';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Max muxing queue size';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => '부호화';

  @override
  String get adminPlaybackEncodingThreads => '인코딩 스레드';

  @override
  String get adminPlaybackFallbackFont => '대체 글꼴 활성화';

  @override
  String get adminPlaybackFallbackFontPath => '대체 글꼴 경로';

  @override
  String get adminPlaybackStreaming => '스트리밍';

  @override
  String get adminResumeVideo => '동영상';

  @override
  String get adminResumeAudiobooks => '오디오북';

  @override
  String get adminResumeMinAudiobookPct => '최소 오디오북 재개 비율';

  @override
  String get adminResumeMaxAudiobookPct => '최대 오디오북 재개 비율';

  @override
  String get adminStreamingBitrateLimit => '원격 클라이언트 비트 전송률 제한(Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => '비워두거나 무제한인 경우 0으로 두세요.';

  @override
  String get adminTrickplayHwAccel => '하드웨어 가속 활성화';

  @override
  String get adminTrickplayHwEncoding => '하드웨어 인코딩 활성화';

  @override
  String get adminTrickplayKeyFrameOnly => '키프레임만 추출 활성화';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => '빠르지만 정확도가 낮음';

  @override
  String get adminTrickplayNonBlocking => '논블로킹';

  @override
  String get adminTrickplayBlocking => '블로킹';

  @override
  String get adminTrickplayPriorityHigh => '높은';

  @override
  String get adminTrickplayPriorityAboveNormal => '정상 이상';

  @override
  String get adminTrickplayPriorityNormal => '정상';

  @override
  String get adminTrickplayPriorityBelowNormal => '정상 이하';

  @override
  String get adminTrickplayPriorityIdle => '게으른';

  @override
  String get adminTrickplayImageSettings => '이미지 설정';

  @override
  String get adminTrickplayInterval => '간격(밀리초)';

  @override
  String get adminTrickplayIntervalSubtitle => '프레임 캡처 빈도';

  @override
  String get adminTrickplayWidthResolutionsHint => '쉼표로 구분된 픽셀 너비(예: 320)';

  @override
  String get adminTrickplayQuality => '품질';

  @override
  String get adminTrickplayQScale => '품질 규모';

  @override
  String get adminTrickplayQScaleSubtitle => '낮은 값 = 더 나은 품질, 더 큰 파일';

  @override
  String get adminTrickplayJpegQuality => 'JPEG 품질';

  @override
  String get adminTrickplayProcessing => '처리';

  @override
  String get adminTasksEmpty => '예약된 작업을 찾을 수 없습니다.';

  @override
  String get adminTasksNoFilterMatch => '현재 필터와 일치하는 작업이 없습니다.';

  @override
  String get adminTaskCancelling => '취소 중...';

  @override
  String get adminTaskRunning => '달리기...';

  @override
  String get adminTaskNeverRun => '절대 뛰지 마세요';

  @override
  String get adminTaskStop => '멈추다';

  @override
  String get adminRunningTasks => 'Running Tasks';

  @override
  String get adminTaskRun => '달리다';

  @override
  String get adminTaskDetailLastExecution => '마지막 실행';

  @override
  String get adminTaskDetailStarted => '시작됨';

  @override
  String get adminTaskDetailEnded => '종료됨';

  @override
  String get adminTaskDetailDuration => '지속';

  @override
  String get adminTaskDetailErrorLabel => '오류:';

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
  String get adminTaskTriggerStartup => '응용 프로그램 시작 시';

  @override
  String get adminTaskTriggerTypeDaily => '일일';

  @override
  String get adminTaskTriggerTypeWeekly => '주간';

  @override
  String get adminTaskTriggerTypeInterval => '간격으로';

  @override
  String get adminTaskTriggerIntervalLabel => '간격';

  @override
  String get adminTaskTriggerEveryHour => '매시간';

  @override
  String get adminTaskTriggerEvery6Hours => '6시간마다';

  @override
  String get adminTaskTriggerEvery12Hours => '12시간마다';

  @override
  String get adminTaskTriggerEvery24Hours => '24시간마다';

  @override
  String get adminTaskTriggerEvery2Days => '2일마다';

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
  String get adminTaskTriggerTime => '시간';

  @override
  String get adminTaskTriggerNoLimit => '제한 없음';

  @override
  String get adminActivityJustNow => '방금';

  @override
  String get adminActivityLastHour => '지난 시간';

  @override
  String get adminActivityToday => '오늘';

  @override
  String get adminActivityYesterday => '어제';

  @override
  String get adminActivityOlder => '이전';

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
  String get adminActivityNow => '지금';

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
      '미리보기 썸네일 탐색을 위한 트릭플레이 이미지 생성을 구성합니다.';

  @override
  String get adminNetworkingPublicHttpsPort => '공용 HTTPS 포트';

  @override
  String get adminNetworkingBaseUrl => '기본 URL';

  @override
  String get adminNetworkingBaseUrlHint => '예를 들어 /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Public HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Require HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirect all remote requests to HTTPS. Has no effect if the server has no valid certificate.';

  @override
  String get adminNetworkingCertPassword => 'Certificate password';

  @override
  String get adminNetworkingIpSettings => 'IP Settings';

  @override
  String get adminNetworkingEnableIpv4 => 'Enable IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Enable IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'Enable automatic port mapping';

  @override
  String get adminNetworkingLocalSubnets => 'LAN networks';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Comma or line separated list of IP addresses or CIDR subnets treated as being on the local network.';

  @override
  String get adminNetworkingPublishedUris => 'Published server URIs';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Map a subnet or address to a published URL, e.g. all=https://example.com';

  @override
  String get adminNetworkingCertPath => '인증서 경로';

  @override
  String get adminNetworkingRemoteIpFilter => '원격 IP 필터';

  @override
  String get adminNetworkingRemoteIpFilterLabel => '원격 IP 필터';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API 장치';

  @override
  String get adminPlaybackAutomatic => '0 = 자동';

  @override
  String get adminPlaybackTranscodeTempPath => '트랜스코딩 임시 경로';

  @override
  String get adminPlaybackSegmentDeletion => '세그먼트 삭제 허용';

  @override
  String get adminPlaybackSegmentKeep => '세그먼트 유지(초)';

  @override
  String get adminPlaybackThrottleBuffering => '스로틀 버퍼링';

  @override
  String get adminResumeMinPct => '최소 이력서 비율';

  @override
  String get adminResumeMinPctSubtitle =>
      '진행 상황을 저장하려면 콘텐츠를 이 비율 이상으로 재생해야 합니다.';

  @override
  String get adminResumeMaxPct => '최대 재개 비율';

  @override
  String get adminResumeMaxPctSubtitle => '이 비율 이후에는 콘텐츠가 완전히 재생된 것으로 간주됩니다.';

  @override
  String get adminResumeMinDuration => '최소 재개 기간(초)';

  @override
  String get adminResumeMinDurationSubtitle => '이보다 짧은 항목은 재개할 수 없습니다.';

  @override
  String get adminTrickplayScanBehavior => '스캔 동작';

  @override
  String get adminTrickplayProcessPriority => '프로세스 우선순위';

  @override
  String get adminTrickplayTileWidth => '타일 ​​너비';

  @override
  String get adminTrickplayTileHeight => '타일 ​​높이';

  @override
  String get adminTrickplayProcessThreads => '프로세스 스레드';

  @override
  String get adminTrickplayWidthResolutions => '폭 해상도';

  @override
  String get adminMetadataDefault => '기본';

  @override
  String get adminMetadataContentTypeUpdated => '콘텐츠 유형이 업데이트되었습니다.';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '느린 응답 임계값(ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'Enable slow response warnings';

  @override
  String get adminGeneralQuickConnect => 'Enable Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Paths';

  @override
  String get adminGeneralSectionPerformance => 'Performance';

  @override
  String get adminGeneralCachePath => '캐시 경로';

  @override
  String get adminGeneralMetadataPath => '메타데이터 경로';

  @override
  String get adminGeneralServerName => '서버 이름';

  @override
  String get adminSettingsLoadFailed => '설정을 로드하지 못했습니다.';

  @override
  String get adminDiscover => '발견하다';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => '폴더';

  @override
  String get libraries => '도서관';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay가 비활성화되었습니다.';

  @override
  String get syncPlayDisabledMessage => '동기화된 재생을 사용하려면 설정에서 SyncPlay를 활성화하세요.';

  @override
  String get syncPlayServerUnsupportedTitle => '지원되지 않는 서버';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay에는 Jellyfin 서버가 필요합니다. 현재 서버에서는 지원하지 않습니다.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay 그룹';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay 그룹';

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
  String get syncPlayIgnoreWait => '무시하고 기다리세요';

  @override
  String get syncPlayIgnoreWaitSubtitle => '이 장치가 버퍼링되는 동안 그룹을 보류하지 마십시오.';

  @override
  String get syncPlayContinueLocallyNoWait => '느린 회원을 기다리지 않고 로컬에서 계속 진행';

  @override
  String get syncPlayRepeat => '반복하다';

  @override
  String get syncPlayRepeatOne => '하나';

  @override
  String get syncPlayShuffleModeShuffled => '섞임';

  @override
  String get syncPlayShuffleModeSorted => '정렬됨';

  @override
  String get syncPlaySyncCurrentQueue => '현재 재생 대기열 동기화';

  @override
  String get syncPlaySyncCurrentQueueSubtitle => '그룹 대기열을 로컬에서 재생 중인 항목으로 교체';

  @override
  String get syncPlayLeaveGroup => '그룹 탈퇴';

  @override
  String get syncPlayGroupQueue => '그룹 대기열';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => '지금 플레이';

  @override
  String get syncPlayCreateNewGroup => '새 그룹 만들기';

  @override
  String get syncPlayGroupName => '그룹 이름';

  @override
  String get syncPlayDefaultGroupName => '내 SyncPlay 그룹';

  @override
  String get syncPlayCreateGroup => '그룹 만들기';

  @override
  String get syncPlayAvailableGroups => '사용 가능한 그룹';

  @override
  String get syncPlayNoGroupsAvailable => '사용 가능한 그룹이 없습니다.';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay 그룹에 가입하시겠습니까?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay 그룹에 가입하면 현재 재생 대기열이 대체될 수 있습니다. 계속하다?';

  @override
  String get syncPlayJoin => '가입하다';

  @override
  String get syncPlayStateIdle => '게으른';

  @override
  String get syncPlayStateWaiting => '대기 중';

  @override
  String get syncPlayStatePaused => '일시중지됨';

  @override
  String get syncPlayStatePlaying => '재생';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay 액세스가 거부되었습니다.';

  @override
  String get syncPlayAccessDeniedMessage =>
      '이 SyncPlay 그룹에 있는 하나 이상의 항목에 대한 액세스 권한이 없습니다. 그룹 소유자에게 라이브러리 권한을 확인하거나 다른 대기열을 선택하도록 요청하세요.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => '음성 검색을 사용할 수 없습니다.';

  @override
  String get dolbyVisionDirectPlayFailedTitle => 'Dolby Vision 다이렉트 재생 실패';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      '이 Dolby Vision 스트림에 대해 직접 재생을 시작하지 못했습니다. 서버 트랜스코드를 사용하여 다시 시도하시겠습니까?';

  @override
  String get retryWithTranscode => '트랜스코드로 다시 시도';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision 지원되지 않음';

  @override
  String get dolbyVisionNotSupportedMessage =>
      '이 장치는 Dolby Vision 콘텐츠를 직접 디코딩할 수 없습니다. HDR10 대체를 사용하거나 서버 트랜스코딩을 요청하세요.';

  @override
  String get rememberMyChoice => '내 선택을 기억해';

  @override
  String get playHdr10Fallback => 'HDR10 대체 재생';

  @override
  String get requestTranscode => '트랜스코드 요청';

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
  String get seeAll => '모두 보기';

  @override
  String get noItems => '항목 없음';

  @override
  String get switchUser => '사용자 전환';

  @override
  String get remoteControl => '원격 제어';

  @override
  String get mediaBarLoading => '미디어바 로드 중...';

  @override
  String get mediaBarError => '미디어바를 로드하지 못했습니다.';

  @override
  String get offlineServerUnavailable => '인터넷에 연결되어 있지만 현재 서버를 사용할 수 없습니다.';

  @override
  String get offlineNoInternet => '귀하는 오프라인 상태입니다. 다운로드한 콘텐츠만 이용 가능합니다.';

  @override
  String get offlineFileNotAvailable => '파일을 사용할 수 없음';

  @override
  String get offlineSwitchServer => '서버 전환';

  @override
  String get offlineSavedMedia => '저장된 미디어';

  @override
  String get offlineBannerTitle => 'You\'re offline';

  @override
  String get offlineBannerSubtitle => 'Showing your downloads';

  @override
  String get offlineBannerAction => 'Downloads';

  @override
  String get serverUnreachableBannerTitle => 'Can\'t reach your server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Playing from downloads until it\'s back';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => '원격 재생';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => '장치 볼륨';

  @override
  String get castVolumeUnavailable => '없는';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => '오디오';

  @override
  String get subtitlesLabel => '자막';

  @override
  String get pinConfirmTitle => 'PIN 확인';

  @override
  String get pinSetTitle => 'PIN 설정';

  @override
  String get pinEnterTitle => 'PIN 입력';

  @override
  String get pinReenterToConfirm => '확인을 위해 PIN을 다시 입력하세요.';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => '잘못된 PIN';

  @override
  String get pinMismatch => 'PIN이 일치하지 않습니다.';

  @override
  String get pinForgot => 'PIN을 잊으셨나요?';

  @override
  String get pinClear => '분명한';

  @override
  String get pinBackspace => '역행 키이';

  @override
  String get quickConnectAuthorized => '빠른 연결 요청이 승인되었습니다.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect 코드가 유효하지 않거나 만료되었습니다.';

  @override
  String get quickConnectNotSupported => '이 서버에서는 Quick Connect가 지원되지 않습니다.';

  @override
  String get quickConnectAuthorizeFailed => 'Quick Connect 코드를 승인하지 못했습니다.';

  @override
  String get quickConnectDisabled => '이 서버에서는 빠른 연결이 비활성화되어 있습니다.';

  @override
  String get quickConnectForbidden => '귀하의 계정은 이 Quick Connect 요청을 승인할 수 없습니다.';

  @override
  String get quickConnectNotFound => '빠른 연결 코드를 찾을 수 없습니다. 새 코드를 사용해 보세요.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => '코드 입력';

  @override
  String get quickConnectAuthorize => '승인하다';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => '원격 제어';

  @override
  String get remoteFailedToLoadSessions => '세션을 로드하지 못했습니다.';

  @override
  String get remoteNoSessions => '제어 가능한 세션 없음';

  @override
  String get remoteStartPlayback => '다른 장치에서 재생 시작';

  @override
  String get unknownUser => '알려지지 않은';

  @override
  String get unknownItem => '알려지지 않은';

  @override
  String get remoteNothingPlaying => '이 세션에서는 재생 중인 항목이 없습니다.';

  @override
  String get castingStarted => '선택한 기기에서 전송이 시작되었습니다.';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => '사용할 수 있는 원격 재생 장치가 없습니다.';

  @override
  String get noRemoteDevicesIos =>
      '사용할 수 있는 원격 재생 장치가 없습니다.\n\niOS에서는 시뮬레이터에서 AirPlay 대상을 사용하지 못할 수 있습니다.';

  @override
  String get trackActionPlayNext => '다음 플레이';

  @override
  String get trackActionAddToQueue => '대기열에 추가';

  @override
  String get trackActionAddToPlaylist => '재생목록에 추가';

  @override
  String get trackActionCancelDownload => '다운로드 취소';

  @override
  String get trackActionDeleteFromPlaylist => '재생목록에서 삭제';

  @override
  String get trackActionMoveUp => '위로 이동';

  @override
  String get trackActionMoveDown => '아래로 이동';

  @override
  String get trackActionRemoveFromFavorites => '즐겨찾기에서 제거';

  @override
  String get trackActionAddToFavorites => '즐겨찾기에 추가';

  @override
  String get trackActionGoToAlbum => '앨범으로 이동';

  @override
  String get trackActionGoToArtist => '아티스트로 이동';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => '다운로드한 파일을 삭제했습니다.';

  @override
  String get trackActionDeleteFileFailed => '다운로드한 파일을 삭제할 수 없습니다.';

  @override
  String get shuffleBy => '셔플 기준';

  @override
  String get shuffleSelectLibrary => '라이브러리 선택';

  @override
  String get shuffleSelectGenre => '장르 선택';

  @override
  String get shuffleLibrary => '도서관';

  @override
  String get shuffleGenre => '장르';

  @override
  String get shuffleNoLibraries => '호환되는 라이브러리가 없습니다.';

  @override
  String get shuffleNoGenres => '이 셔플 모드에 대한 장르를 찾을 수 없습니다.';

  @override
  String get posterDisplayTitle => '표시하다';

  @override
  String get posterImageType => '이미지 유형';

  @override
  String get imageTypePoster => '포스터';

  @override
  String get imageTypeThumbnail => '썸네일';

  @override
  String get imageTypeBanner => '기치';

  @override
  String get playlistAddFailed => '재생목록에 추가하지 못했습니다.';

  @override
  String get playlistCreateFailed => '재생목록을 생성하지 못했습니다.';

  @override
  String get playlistNew => '새 재생목록';

  @override
  String get playlistCreate => '만들다';

  @override
  String get playlistCreateNew => '새 재생목록 만들기';

  @override
  String get playlistNoneFound => '재생목록을 찾을 수 없습니다.';

  @override
  String get addToPlaylist => '재생목록에 추가';

  @override
  String get lyricsNotAvailable => '사용 가능한 가사가 없습니다.';

  @override
  String get upNext => '다음';

  @override
  String get playNext => '다음 플레이';

  @override
  String get stillWatchingContent => '재생이 일시중지되었습니다. 아직도 보고 있나요?';

  @override
  String get stillWatchingStop => '멈추다';

  @override
  String get stillWatchingContinue => '계속하다';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => '라이브 TV';

  @override
  String get continueWatchingAndNextUp => '계속 시청하고 다음 편';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => '다음 에피소드';

  @override
  String get moreFromThisSeason => '이번 시즌의 콘텐츠 더보기';

  @override
  String get playerTooltipPlaybackSpeed => '재생 속도';

  @override
  String get playerTooltipCastControls => '전송 컨트롤';

  @override
  String get playerTooltipPlaybackQuality => '비트레이트';

  @override
  String get playerTooltipEnterFullscreen => '전체 화면으로 전환';

  @override
  String get playerTooltipExitFullscreen => '전체 화면 종료';

  @override
  String get playerTooltipFloatOnTop => '위에 뜨다';

  @override
  String get playerTooltipExitFloatOnTop => '상단에 플로트 비활성화';

  @override
  String get playerTooltipLockLandscape => '풍경 잠금';

  @override
  String get playerTooltipUnlockOrientation => '순환 허용';

  @override
  String get playerTooltipPrevious => '이전의';

  @override
  String get playerTooltipSeekBack => '뒤로 탐색';

  @override
  String get playerTooltipSeekForward => '앞으로 탐색';

  @override
  String get contextMenuMarkWatched => '시청한 것으로 표시';

  @override
  String get contextMenuMarkUnwatched => '시청하지 않음으로 표시';

  @override
  String get contextMenuAddToFavorites => '즐겨찾기에 추가';

  @override
  String get contextMenuRemoveFromFavorites => '즐겨찾기에서 제거';

  @override
  String get contextMenuGoToSeries => '시리즈로 이동';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle => '서버 관리 패널에 액세스';

  @override
  String get settingsAccountSecurity => '계정 및 보안';

  @override
  String get settingsAccountSecuritySubtitle => '인증, PIN 코드, 자녀 보호 기능';

  @override
  String get settingsPersonalization => '개인화';

  @override
  String get settingsPersonalizationSubtitle => '테마, 탐색, 홈 행 및 라이브러리 가시성';

  @override
  String get settingsDynamicContent => '동적 콘텐츠';

  @override
  String get settingsDynamicContentSubtitle => '미디어 바와 시각적 오버레이';

  @override
  String get settingsPlaybackSyncplay => '재생 및 SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      '오디오/비디오 설정, 자막, 다운로드 및 SyncPlay 컨트롤';

  @override
  String get settingsIntegrationsSubtitle => '플러그인 동기화, Seerr, 등급 등';

  @override
  String get settingsAboutSubtitle => '앱 버전, 법적 정보, 크레딧';

  @override
  String get settingsAuthenticationSection => '입증';

  @override
  String get settingsSortServersBy => '서버 정렬 기준';

  @override
  String get settingsLastUsed => '마지막으로 사용됨';

  @override
  String get settingsAlphabetical => '알파벳순';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => '개인정보 보호 및 안전';

  @override
  String get settingsBlockedRatings => '차단된 등급';

  @override
  String get settingsGeneralStyle => '일반 스타일';

  @override
  String get settingsGeneralStyleSubtitle => '테마 악센트, 배경, 시청 표시기 및 테마 음악';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => '홈 페이지';

  @override
  String get settingsHomePageSubtitle => '섹션, 이미지 유형, 오버레이 및 미디어 미리보기';

  @override
  String get settingsLibrariesSubtitle => '라이브러리 가시성, 폴더 보기 및 다중 서버 동작';

  @override
  String get settingsTwentyFourHourClock => '24시간제 시계';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      '시계가 표시되는 곳마다 24시간 형식을 사용하세요.';

  @override
  String get settingsShowShuffleButtonInNavigation => '탐색 모음에 임의 재생 버튼 표시';

  @override
  String get settingsShowGenresButtonInNavigation => '탐색 표시줄에 장르 버튼 표시';

  @override
  String get settingsShowFavoritesButtonInNavigation => '탐색 표시줄에 즐겨찾기 버튼 표시';

  @override
  String get settingsShowLibrariesButtonInNavigation => '탐색 모음에 라이브러리 버튼 표시';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      '라이브러리별로 홈 페이지 가시성을 전환합니다. 변경 사항을 적용하려면 Moonfin을 다시 시작하세요.';

  @override
  String get settingsMediaBarAndLocalPreviews => '미디어 바 및 로컬 미리보기';

  @override
  String get settingsVisualOverlays => '시각적 오버레이';

  @override
  String get settingsSeasonalSurprise => '계절별 깜짝 선물';

  @override
  String get settingsMetadataAndRatings => '메타데이터 및 평가';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase는 추가 평가 소스, Seerr 요청 및 동기화된 기본 설정을 포함한 서버 측 통합을 지원합니다.';

  @override
  String get settingsOfflineDownloads => '오프라인 다운로드';

  @override
  String get settingsHigh => '높은';

  @override
  String get settingsLow => '낮은';

  @override
  String get settingsCustomPath => '사용자 정의 경로';

  @override
  String get settingsEnterDownloadFolderPath => '다운로드 폴더 경로를 입력하세요';

  @override
  String get settingsConcurrentDownloads => '동시 다운로드';

  @override
  String get settingsConcurrentDownloadsDescription =>
      '한 번에 다운로드할 수 있는 최대 항목 수입니다.';

  @override
  String get settingsAppInfo => '앱 정보';

  @override
  String get settingsReportAnIssue => '문제 신고';

  @override
  String get settingsReportAnIssueSubtitle => 'GitHub에서 이슈 트래커 열기';

  @override
  String get settingsJoinDiscord => 'Discord에 가입하세요';

  @override
  String get settingsJoinDiscordSubtitle => '커뮤니티와 채팅';

  @override
  String get settingsJoinTheDiscord => 'Discord에 가입하세요';

  @override
  String get settingsSupportMoonfin => 'Moonfin 지원';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => '합법적인';

  @override
  String get settingsLicenses => '라이센스';

  @override
  String get settingsOpenSourceLicenseNotices => '오픈소스 라이선스 공지';

  @override
  String get settingsPrivacyPolicy => '개인 정보 보호 정책';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin이 데이터를 처리하는 방법';

  @override
  String get settingsCheckForUpdates => '업데이트 확인';

  @override
  String get settingsCheckForUpdatesSubtitle => '최신 Moonfin 릴리스를 확인하세요.';

  @override
  String get settingsPoweredByFlutter => 'Flutter에서 제공';

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
  String get settingsBoth => '둘 다';

  @override
  String get settingsShuffleContentTypeFilter => '셔플 콘텐츠 유형 필터';

  @override
  String get settingsVideoPlaybackPreferences => '비디오 재생 기본 설정';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      '핵심 비디오 엔진 및 스트리밍 품질 설정';

  @override
  String get settingsAudioPreferences => '오디오 환경설정';

  @override
  String get settingsAudioPreferencesSubtitle => '오디오 트랙, 처리 및 패스스루 옵션';

  @override
  String get settingsAutomationAndQueue => '자동화 및 대기열';

  @override
  String get settingsAutomationAndQueueSubtitle => '자동 재생 및 시퀀싱';

  @override
  String get settingsOfflineDownloadsSubtitle => '다운로드 품질, 저장 용량 한도 및 대기열 크기';

  @override
  String get settingsSyncplaySubtitle => '그룹 세션의 동기화 논리';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      '전문화된 플레이어 기능. 일부 옵션은 재생 문제를 일으킬 수 있으므로 주의해서 사용하세요.';

  @override
  String get settingsSkipIntrosAndOutros => '인트로와 아웃트로를 건너뛰시겠습니까?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => '사용자에게 프롬프트';

  @override
  String get settingsSkip => '건너뛰다';

  @override
  String get settingsDoNothing => '아무것도 하지 않음';

  @override
  String get settingsMaxBitrateDescription =>
      '스트리밍 비트 전송률을 제한합니다. 이 임계값을 초과하는 콘텐츠는 이에 맞게 트랜스코딩됩니다.';

  @override
  String get settingsMaxResolutionDescription =>
      '플레이어가 요청할 최대 해상도를 제한합니다. 고해상도 콘텐츠는 트랜스코딩됩니다.';

  @override
  String get settingsPlayerZoomDescription => '화면에 맞게 비디오 크기를 조정하는 방법입니다.';

  @override
  String get settingsPlaybackEngineAndroidTv => '재생 엔진(안드로이드 TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV 기기에서 기본 재생 엔진을 선택하세요. 변경 사항은 다음 재생 세션에 적용됩니다.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3(권장)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv(레거시)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision 폴백';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision 디코딩이 없는 기기에서 Dolby Vision 타이틀의 동작입니다.';

  @override
  String get settingsAskEachTime => '매번 물어보세요';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 폴백 선호';

  @override
  String get settingsPreferServerTranscode => '서버 트랜스코드 선호';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision 프로필 7 직접 재생';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision 프로필 7 향상 레이어 스트림이 직접 재생되어야 하는지 여부를 제어합니다.';

  @override
  String get settingsAutoAftkrtEnabled => '자동(AFTKRT 사용)';

  @override
  String get settingsEnabledOnThisDevice => '이 기기에서 활성화되었습니다.';

  @override
  String get settingsDisabledPreferTranscode => '비활성화됨(트랜스코딩 선호)';

  @override
  String get settingsResumeRewindDescription =>
      '재생을 재개할 때(계속 시청 또는 미디어 항목 페이지에서) 몇 초 동안 되감아야 합니까?';

  @override
  String get settingsUnpauseRewindDescription =>
      '일시 정지 버튼을 누른 후 재생을 재개할 때 몇 초 동안 되감아야 합니까?';

  @override
  String get settingsSkipBackLengthDescription =>
      '되감기 버튼을 누른 후 뒤로 이동할 시간(초)입니다.';

  @override
  String get settingsOneSecond => '1초';

  @override
  String get settingsThreeSeconds => '3초';

  @override
  String get settingsFortyFiveSeconds => '45초';

  @override
  String get settingsSixtySeconds => '60초';

  @override
  String get settingsSkipForwardLengthDescription =>
      '빨리감기 버튼을 누른 후 앞으로 이동할 시간(초)입니다.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder => '외부 디코더에 대한 비트스트림 AC3';

  @override
  String get settingsCinemaMode => '시네마 모드';

  @override
  String get settingsCinemaModeSubtitle => '주요 기능 이전에 예고편/프리롤 재생';

  @override
  String get settingsNextUpDisplayDescription =>
      '확장에는 에피소드 삽화와 설명이 포함된 전체 카드가 표시됩니다. Minimal은 컴팩트한 카운트다운 오버레이를 표시합니다. 비활성화되면 프롬프트가 완전히 숨겨집니다.';

  @override
  String get settingsShort => '짧은';

  @override
  String get settingsLong => '긴';

  @override
  String get settingsVeryLong => '매우 길다';

  @override
  String get settingsVideoStartDelay => '비디오 시작 지연';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => '라이브 TV 다이렉트';

  @override
  String get settingsLiveTvDirectSubtitle => '라이브 TV에 대한 직접 재생 활성화';

  @override
  String get settingsOpenGroups => '공개 그룹';

  @override
  String get settingsOpenGroupsSubtitle => 'SyncPlay 그룹 생성, 가입 또는 관리';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay 활성화됨';

  @override
  String get settingsSyncplayEnabledSubtitle => '그룹 시청 기능 활성화';

  @override
  String get settingsSyncplayButton => 'SyncPlay 버튼';

  @override
  String get settingsSyncplayButtonSubtitle => '탐색 모음에 SyncPlay 버튼 표시';

  @override
  String get settingsSyncplayAdvancedCorrection => '고급 교정';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle => '세분화된 동기화 로직 활성화';

  @override
  String get settingsSyncplaySyncCorrection => '동기화 수정';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      '동기화 상태를 유지하도록 자동으로 재생 조정';

  @override
  String get settingsSyncplaySpeedToSync => '동기화 속도';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle => '재생 속도 조정을 사용하여 동기화';

  @override
  String get settingsSyncplaySkipToSync => '동기화로 건너뛰기';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => '동기화 탐색 사용';

  @override
  String get settingsSyncplayMinimumSpeedDelay => '최소 속도 지연';

  @override
  String get settingsSyncplayMaximumSpeedDelay => '최대 속도 지연';

  @override
  String get settingsSyncplaySpeedDuration => '속도 지속 시간';

  @override
  String get settingsSyncplayMinimumSkipDelay => '최소 건너뛰기 지연';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay 추가 오프셋';

  @override
  String get onNow => '지금 시작 중';

  @override
  String get collections => '컬렉션';

  @override
  String get lastPlayed => '마지막 플레이';

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
    return '';
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
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

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
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

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
  String get themeStore => '';

  @override
  String get themeStoreSubtitle => '';

  @override
  String get themeStoreDescription => '';

  @override
  String get themeStoreEmpty => '';

  @override
  String get themeStoreLoadFailed => '';

  @override
  String get themeStoreSave => '';

  @override
  String get themeStoreSaveAndApply => '';

  @override
  String get themeStoreSaved => '';

  @override
  String get themeStoreInvalidMessage => '';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '';
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
  String get homeRowDisplay => '';

  @override
  String get homeRowSections => '';

  @override
  String get homeRowToggles => '';

  @override
  String get homeRowTogglesSubtitle => '';

  @override
  String get homeRowTogglesDescription => '';

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
  String get displayPlaylistsRows => '';

  @override
  String get displayPlaylistsRowsSubtitle => '';

  @override
  String get playlistsRowSorting => '';

  @override
  String get playlistsRowSortingDescription => '';

  @override
  String get displayAudioRows => '';

  @override
  String get displayAudioRowsSubtitle => '';

  @override
  String get audioRowsSorting => '';

  @override
  String get audioRowsSortingDescription => '';

  @override
  String get audioPlaylists => '';

  @override
  String get appearance => 'Appearance';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Theme';

  @override
  String get keyboard => 'Keyboard';

  @override
  String get navButtons => 'Buttons';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV configuration';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

  @override
  String get externalPlayerAppDescription => '';

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
  String get crewContributionsSeerr => '';

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
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'Transcoding Limits';

  @override
  String get clearAllArtworkButton => '';

  @override
  String get clearAllArtworkWarning => '';

  @override
  String get confirmClear => '';

  @override
  String confirmClearMessage(String itemType) {
    return '';
  }

  @override
  String get uploadButton => '';

  @override
  String get resolutionLabel => '';

  @override
  String get onlyShowInterfaceLanguage => '';

  @override
  String get confirmClearAll => '';

  @override
  String get imageUploadSuccess => '';

  @override
  String imageUploadFailed(String error) {
    return '';
  }

  @override
  String imageDownloadFailed(String error) {
    return '';
  }

  @override
  String imageDeleteFailed(String error) {
    return '';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return '';
  }

  @override
  String get yes => '';

  @override
  String get posterCategory => '';

  @override
  String get backdropsCategory => '';

  @override
  String get bannerCategory => '';

  @override
  String get logoCategory => '';

  @override
  String get thumbnailCategory => '';

  @override
  String get artCategory => '';

  @override
  String get discArtCategory => '';

  @override
  String get screenshotCategory => '';

  @override
  String get boxCoverCategory => '';

  @override
  String get boxRearCoverCategory => '';

  @override
  String get menuArtCategory => '';

  @override
  String get confirmItemPoster => '';

  @override
  String get confirmItemBackdrop => '';

  @override
  String get confirmItemBanner => '';

  @override
  String get confirmItemLogo => '';

  @override
  String get confirmItemThumbnail => '';

  @override
  String get confirmItemArt => '';

  @override
  String get confirmItemDiscArt => '';

  @override
  String get confirmItemScreenshot => '';

  @override
  String get confirmItemBoxCover => '';

  @override
  String get confirmItemBoxRearCover => '';

  @override
  String get confirmItemMenuArt => '';

  @override
  String get resolutionAll => '';

  @override
  String get resolutionHigh => '';

  @override
  String get resolutionMedium => '';

  @override
  String get resolutionLow => '';

  @override
  String get sources => '';

  @override
  String get audiobookChapters => 'Chapters';

  @override
  String get audiobookBookmarks => 'Bookmarks';

  @override
  String get audiobookNotes => 'Notes';

  @override
  String get audiobookQueue => 'Queue';

  @override
  String get audiobookTimeline => 'Timeline';

  @override
  String get audiobookTimelineEmpty => 'Timeline is empty';

  @override
  String get audiobookWholeBook => 'Whole Book';

  @override
  String get audiobookFocusedTimeline => 'Focused Timeline';

  @override
  String get audiobookExportBookmarks => 'Export Bookmarks';

  @override
  String get audiobookExportNotes => 'Export Notes';

  @override
  String get audiobookExportAll => 'Export All';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exported to $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get audiobookLyrics => 'Lyrics';

  @override
  String get audiobookAddBookmark => 'Add bookmark';

  @override
  String get audiobookAddNote => 'Add note';

  @override
  String get audiobookEditNote => 'Edit note';

  @override
  String get audiobookNoteHint => 'Write a note for this moment';

  @override
  String get audiobookSleepTimer => 'Sleep timer';

  @override
  String get audiobookSleepOff => 'Off';

  @override
  String get audiobookSleepEndOfChapter => 'End of chapter';

  @override
  String get audiobookSleepCustom => 'Custom';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining left';
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
  String get audiobookPlaybackSpeed => 'Playback speed';

  @override
  String get audiobookRemainingTime => 'Remaining';

  @override
  String get audiobookElapsedTime => 'Elapsed';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Back ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Forward ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Previous chapter';

  @override
  String get audiobookNextChapter => 'Next chapter';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Chapter $current of $total';
  }

  @override
  String get audiobookNoChapters => 'No chapters';

  @override
  String get audiobookNoBookmarks => 'No bookmarks yet';

  @override
  String get audiobookNoNotes => 'No notes yet';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bookmark added at $position';
  }

  @override
  String get audiobookSpeedReset => 'Reset to 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Save';

  @override
  String get audiobookCancel => 'Cancel';

  @override
  String get audiobookDelete => 'Delete';

  @override
  String get subtitlePreferences => '';

  @override
  String get subtitlePreferencesDescription => '';

  @override
  String get subtitleRendering => '';

  @override
  String get displayOptions => '';

  @override
  String get releaseDateAscending => '';

  @override
  String get releaseDateDescending => '';

  @override
  String get groupContributions => '';

  @override
  String get groupMultipleRoles => '';

  @override
  String get libraryWriteAccessWarningTitle => '';

  @override
  String get libraryWriteAccessHowToFix => '';

  @override
  String get libraryWriteAccessFixSteps => '';

  @override
  String get dismiss => '';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '';
  }

  @override
  String get libraryWriteAccessReactiveBody => '';

  @override
  String get externalLists => 'External Lists';

  @override
  String get replay => 'Replay';

  @override
  String get fileInformation => 'File Information';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Size: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Show All ($count) Audio Tracks';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Show All ($count) Subtitle Tracks';
  }

  @override
  String get checkingDirectPlay => 'Checking Direct Play capability...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play Capability: ';

  @override
  String get forced => 'Forced';

  @override
  String get transcodeContainerNotSupported =>
      'Container format is not supported by the player.';

  @override
  String get transcodeVideoCodecNotSupported => 'Video codec is not supported.';

  @override
  String get transcodeAudioCodecNotSupported => 'Audio codec is not supported.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Subtitle format is not supported (requires burning).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Audio profile is not supported.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Video profile is not supported.';

  @override
  String get transcodeVideoLevelNotSupported => 'Video level is not supported.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Video resolution is not supported by this device.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Video bit depth is not supported.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Video framerate is not supported.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'File bitrate exceeds player streaming limit.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Video bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Audio bitrate exceeds streaming limit.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Number of audio channels is not supported.';

  @override
  String get sortAlphabetical => 'Alphabetical';

  @override
  String get sortReleaseAscending => 'Release Order (Ascending)';

  @override
  String get sortReleaseDescending => 'Release Order (Descending)';

  @override
  String get sortCustomDragDrop => 'Custom (Drag-and-Drop)';

  @override
  String get playlistSortOptions => 'Playlist Sort Options';

  @override
  String get resetSort => 'Reset Sort';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rewatch S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rewatch Playlist';

  @override
  String get noSubtitlesFound => 'No subtitles found.';

  @override
  String get adminControls => 'Admin Controls';

  @override
  String get impellerRendering => 'Rendering engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller is Flutter\'s modern GPU renderer for smoother animations and less stutter. On some TV boxes and older GPUs it can cause glitches or black video; switch it Off if you see those. Automatic picks the best default for your device. Restart Moonfin to apply.';

  @override
  String get impellerAuto => 'Automatic';

  @override
  String get impellerOn => 'On';

  @override
  String get impellerOff => 'Off';

  @override
  String get impellerRestartTitle => 'Restart required';

  @override
  String get impellerRestartMessage =>
      'Moonfin needs to restart to change the rendering engine. Close the app now, then reopen it to apply.';

  @override
  String get impellerCloseNow => 'Close app now';

  @override
  String get adminRefreshLibrary => 'Refresh Library';

  @override
  String get adminRefreshAllLibraries => 'Refresh All Libraries';

  @override
  String get adminRepoSortDateOldest => 'Date Added (Oldest First)';

  @override
  String get adminRepoSortDateNewest => 'Date Added (Newest First)';

  @override
  String get adminRepoSortNameAsc => 'Alphabetical (A to Z)';

  @override
  String get adminRepoSortNameDesc => 'Alphabetical (Z to A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Loading Server Analytics... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Match source';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Movies';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 TV Shows';

  @override
  String get imdbMostPopularMovies => 'IMDb Most Popular Movies';

  @override
  String get imdbMostPopularTvShows => 'IMDb Most Popular TV Shows';

  @override
  String get imdbLowestRatedMovies => 'IMDb Lowest Rated Movies';

  @override
  String get imdbTopEnglishMovies => 'IMDb Top Rated English Movies';
}
