// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => '계정 환경설정';

  @override
  String get interfaceLanguage => '인터페이스 언어';

  @override
  String get systemLanguageDefault => '시스템 기본값';

  @override
  String get signIn => '로그인';

  @override
  String get empty => '비어 있음';

  @override
  String connectingToServer(String serverName) {
    return '$serverName에 연결하는 중';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get back => '뒤로';

  @override
  String get serverUnavailable => '서버를 사용할 수 없습니다';

  @override
  String get loginFailed => '로그인 실패';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Quick Connect를 사용할 수 없습니다: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Quick Connect를 사용할 수 없습니다($status): $detail';
  }

  @override
  String get whosWatching => '누가 보고 있나요?';

  @override
  String get addUser => '사용자 추가';

  @override
  String get selectServer => '서버 선택';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin 버전 $version';
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
    return '서버 목록에서 \"$serverName\"을(를) 제거할까요?';
  }

  @override
  String get cancel => '취소';

  @override
  String get remove => '제거';

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
  String get detailScreenStyle => '상세 화면 스타일';

  @override
  String get detailScreenStyleSubtitle =>
      '클래식은 기존의 가운데 정렬 Moonfin 레이아웃입니다. 모던은 반응형 시네마틱 레이아웃입니다.';

  @override
  String get detailScreenStyleMoonfin => '클래식';

  @override
  String get detailScreenStyleModern => '모던';

  @override
  String get expandedTabs => '탭 자동 펼치기';

  @override
  String get expandedTabsSubtitle =>
      '탭을 넘길 때 탭 내용을 자동으로 표시합니다. 끄면 각 탭을 직접 열고 닫습니다.';

  @override
  String get showTechnicalDetails => '기술 정보를 표시할까요?';

  @override
  String get showTechnicalDetailsSubtitle => '배너 요약에 코덱, 해상도, 스트림 정보를 표시합니다';

  @override
  String get recommendationSystem => '추천 시스템';

  @override
  String get recommendationSystemSubtitle =>
      '로컬 라이브러리 기반 Moonfin 추천 알고리즘 또는 온라인 TMDb 유사도 지표를 사용합니다. 참고: 온라인 추천에는 Seerr 연동이 필요합니다.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin 추천';

  @override
  String get recommendationSystemTmdb => 'TMDb 유사도';

  @override
  String get recommendationsApplyParentalRatingCap => '시청 등급 제한을 적용할까요?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      '대상 미디어의 시청 등급에 따라 Moonfin 추천 항목을 제한합니다';

  @override
  String get interfaceStyle => '인터페이스 스타일';

  @override
  String get interfaceStyleSubtitle =>
      '자동은 기기에 맞춰집니다. Apple 또는 Material을 선택하면 해당 스타일로 고정됩니다.';

  @override
  String get interfaceStyleAutomatic => '자동';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => '글래스 품질';

  @override
  String get glassQualitySubtitle =>
      '자동은 이 기기에 가장 알맞은 글래스 효과를 선택합니다. 최고는 실제 블러를 적용하고, 낮음은 GPU 사용을 줄이는 가벼운 글래스를 사용합니다.';

  @override
  String get glassQualityAuto => '자동';

  @override
  String get glassQualityFull => '최고';

  @override
  String get glassQualityReduced => '낮음';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '앱을 다시 시작하지 않고도 Moonfin과 Neon Pulse 간에 전환할 수 있습니다.';

  @override
  String get customThemeTitle => '사용자 지정 테마';

  @override
  String get customThemeSubtitle =>
      '사용자 지정 테마는 Moonfin 전반의 시각 요소를 바꿉니다. 취향에 맞는 테마를 선택하세요.';

  @override
  String get keyboardPreferSystemIme => '시스템 키보드 우선 사용';

  @override
  String get keyboardPreferSystemImeDescription =>
      '텍스트 입력 시 기기의 입력기를 기본으로 사용합니다';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '현재 Moonfin 룩은 여러분 모두가 좋아하게 되었습니다.';

  @override
  String get themeNeonPulse => '네온 펄스';

  @override
  String get themeNeonPulseSubtitle =>
      '마젠타 빛, 청록색 텍스트 및 더 강한 크롬 대비를 사용한 신스웨이브 스타일';

  @override
  String get themeGlass => '글래스';

  @override
  String get themeGlassSubtitle =>
      '흐르는 그라데이션 배경, 서리 낀 표면, Apple 블루 강조색을 사용한 리퀴드 글래스 스타일';

  @override
  String get theme8BitHero => '8비트 히어로';

  @override
  String get theme8BitHeroSubtitle =>
      '투박한 색상, 각진 테두리, 진한 그림자, 픽셀 글꼴을 사용한 레트로 픽셀아트 스타일';

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
    return '$target에 연결할 수 없습니다';
  }

  @override
  String get exitApp => 'Moonfin을(를) 종료하시겠습니까?';

  @override
  String get exitAppConfirmation => '종료하시겠습니까?';

  @override
  String get exit => '출구';

  @override
  String get gameMenu => '메뉴';

  @override
  String get gamePaused => '일시정지됨';

  @override
  String get gameSaveState => '상태 저장';

  @override
  String get games => '게임';

  @override
  String get gameLoadState => '상태 불러오기';

  @override
  String get gameFastForward => '빨리 감기';

  @override
  String get gameEmulatorSettings => '에뮬레이터 설정';

  @override
  String get gameNoCoreOptions => '이 코어에는 조정할 수 있는 옵션이 없습니다.';

  @override
  String get gameHoldToOpenMenu => '길게 눌러 메뉴 열기';

  @override
  String get gamePlaybackUnsupported => '이 기기에서는 아직 게임 플레이를 지원하지 않습니다.';

  @override
  String get noHomeRowsLoaded => '홈 행을 로드할 수 없습니다.';

  @override
  String get noHomeRowsHint => '활성 홈 섹션을 새로 고치거나 줄여보세요.';

  @override
  String get retryHomeRows => '홈 행 재시도';

  @override
  String get guide => '가이드';

  @override
  String get recordings => '녹화';

  @override
  String get schedule => '일정';

  @override
  String get series => '시리즈';

  @override
  String get noItemsFound => '항목을 찾을 수 없습니다';

  @override
  String get home => '홈';

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
  String get library => '라이브러리';

  @override
  String get displaySettings => '디스플레이 설정';

  @override
  String get allGenres => '모든 장르';

  @override
  String get noGenresFound => '장르를 찾을 수 없습니다.';

  @override
  String failedToLoadFolderError(String error) {
    return '폴더를 불러오지 못했습니다: $error';
  }

  @override
  String get thisFolderIsEmpty => '이 폴더는 비어 있습니다.';

  @override
  String itemCountLabel(int count) {
    return '$count개 항목';
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
    return '$count개 항목';
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
    return '$name — 장르';
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
    return '$count분 전';
  }

  @override
  String hoursAgo(int count) {
    return '$count시간 전';
  }

  @override
  String daysAgo(int count) {
    return '$count일 전';
  }

  @override
  String get discoverySubjects => '발견 주제';

  @override
  String get pickDiscoverySubjects => 'Discover에 표시할 주제 피드를 선택하세요.';

  @override
  String get apply => '적용';

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
    return '$count개 작품';
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
  String get resume => '이어하기';

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
    return '저자 $count명';
  }

  @override
  String genresCount(int count) {
    return '장르 $count개';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% 완료';
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
    return '읽기 중심으로 정리된 $count개 작품입니다.';
  }

  @override
  String get titles => '타이틀';

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
    return '$label을(를) 찾을 수 없습니다';
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
  String get unwatched => '미시청';

  @override
  String get seriesStatus => '시리즈 현황';

  @override
  String get allLibraries => '모든 라이브러리';

  @override
  String get books => '서적';

  @override
  String get latestBooks => '최신 도서';

  @override
  String get latestAudiobooks => '최신 오디오북';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '도서 $count권',
      one: '도서 1권',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => '도서';

  @override
  String get bookFormatAudiobook => '오디오북';

  @override
  String bookPercentRead(int percent) {
    return '$percent% 읽음';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time 남음';
  }

  @override
  String get bookHeroRead => '읽기';

  @override
  String get bookHeroListen => '듣기';

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
    return '$count개 섹션';
  }

  @override
  String firstPublished(int year) {
    return '$year년 초판';
  }

  @override
  String get noOpenLibraryOverview => 'Open Library에는 아직 이 타이틀에 대한 개요가 없습니다.';

  @override
  String get subjects => '과목';

  @override
  String get all => '모두';

  @override
  String booksCount(int count) {
    return '$count권';
  }

  @override
  String get couldNotLoadSubject => '지금은 이 주제를 로드할 수 없습니다.';

  @override
  String get audiobookDetails => '오디오북 세부정보';

  @override
  String authorsCountTitle(int count) {
    return '저자 $count명';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '오디오북 $count개',
      one: '오디오북 1개',
    );
    return '$_temp0';
  }

  @override
  String get trackList => '트랙 목록';

  @override
  String get itemListPlaceholder => '여기에 항목 목록이 표시됩니다.';

  @override
  String get failedToLoad => '로드하지 못했습니다.';

  @override
  String get delete => '삭제';

  @override
  String get save => '저장';

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
  String get seasons => '시즌';

  @override
  String get chapters => '장';

  @override
  String get features => '특징';

  @override
  String get movies => '영화 산업';

  @override
  String get musicVideos => '뮤직비디오';

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
    return '디스크 $number';
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
    return '$year년 출간';
  }

  @override
  String get publicationDateUnknown => '출판일은 알 수 없음';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '시즌 $count개',
      one: '시즌 1개',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time에 종료';
  }

  @override
  String get items => '항목';

  @override
  String get extras => '부가 영상';

  @override
  String get behindTheScenes => '비하인드';

  @override
  String get deletedScenes => '삭제 장면';

  @override
  String get featurettes => '제작 영상';

  @override
  String get interviews => '인터뷰';

  @override
  String get scenes => '장면';

  @override
  String get shorts => '단편';

  @override
  String get trailers => '예고편';

  @override
  String timeRemaining(String time) {
    return '$time 남음';
  }

  @override
  String endsIn(String time) {
    return '$time 후 종료';
  }

  @override
  String get view => '보다';

  @override
  String get resumeReading => '읽기 재개';

  @override
  String get read => '읽다';

  @override
  String resumeFrom(String position) {
    return '$position부터 이어보기';
  }

  @override
  String get play => '재생';

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
  String get cast => '전송';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => '예고편';

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
  String get finalizingDownload => 'Finalizing…';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => '재생목록 이름 바꾸기';

  @override
  String get playlistName => '재생목록 이름';

  @override
  String get deleteDownloadedAlbum => '다운로드한 앨범 삭제';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\"의 다운로드한 트랙을 삭제할까요?';
  }

  @override
  String get downloadedTracksDeleted => '다운로드한 트랙이 삭제되었습니다.';

  @override
  String get downloadedTracksDeleteFailed => '다운로드한 트랙 중 일부를 삭제할 수 없습니다.';

  @override
  String get noTracksLoaded => '로드된 트랙이 없습니다.';

  @override
  String noItemsLoaded(String itemLabel) {
    return '불러온 $itemLabel이(가) 없습니다';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title 다운로드 중($count개 항목)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '서버에서 \"$name\"을(를) 삭제할까요? 이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String get itemDeleted => '항목이 삭제되었습니다.';

  @override
  String get noPlayableTrailerFound => '재생 가능한 예고편이 없습니다.';

  @override
  String unsupportedBookFormat(String extension) {
    return '지원하지 않는 도서 형식: .$extension';
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
    return '자막을 다운로드하고 선택했습니다: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      '자막이 다운로드되었습니다. Jellyfin이 항목을 새로 고치는 동안 표시되는 데 잠시 시간이 걸릴 수 있습니다.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language 원격 자막을 찾을 수 없습니다.';
  }

  @override
  String get selectVersion => '버전 선택';

  @override
  String versionNumber(int number) {
    return '버전 $number';
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
    return '$name 다운로드 중($quality)...';
  }

  @override
  String get deleteDownloadedFiles => '다운로드한 파일 삭제';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel의 로컬 파일을 삭제할까요?\n\n저장 공간이 확보되며, 나중에 다시 다운로드할 수 있습니다.';
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
  String get directors => '감독';

  @override
  String get writer => '각본';

  @override
  String get writers => '각본가';

  @override
  String get studio => '사진관';

  @override
  String studioMoreCount(int count) {
    return '+$count개 더';
  }

  @override
  String totalEpisodes(int count) {
    return '$count개 에피소드';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number화';
  }

  @override
  String chapterNumber(int number) {
    return '챕터 $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '트랙 $count개',
      one: '트랙 1개',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '챕터 $count개',
      one: '챕터 1개',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return '$date 출생';
  }

  @override
  String died(String date) {
    return '$date 사망';
  }

  @override
  String age(int age) {
    return '$age세';
  }

  @override
  String get showLess => '간략히 표시';

  @override
  String get readMore => '자세히 알아보기';

  @override
  String get shuffle => '셔플';

  @override
  String get shuffleAllMusic => '전체 음악 셔플 재생';

  @override
  String get carSignInPrompt => '휴대폰에서 Moonfin에 로그인하세요';

  @override
  String get carServerUnreachable => '서버에 연결할 수 없습니다';

  @override
  String downloadsCount(int count) {
    return '다운로드 $count회';
  }

  @override
  String get perfectMatch => '완벽한 일치';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => '모노';

  @override
  String get stereo => '스테레오';

  @override
  String remoteSubtitlePermissionError(String action) {
    return '원격 자막 $action 작업에는 이 사용자의 Jellyfin 자막 관리 권한이 필요합니다.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return '원격 자막 $action 작업을 위한 항목을 서버에서 찾을 수 없습니다.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '원격 자막 $action 작업에 실패했습니다: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '원격 자막 $action 작업에 실패했습니다(HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '원격 자막을 $action하지 못했습니다.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\"의 다운로드한 모든 에피소드';
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
    return '$label 작업에 실패했습니다: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return '캐스트 음량을 조절하지 못했습니다: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label 제어';
  }

  @override
  String get deviceVolume => '장치 볼륨';

  @override
  String get unavailable => '없는';

  @override
  String get pause => '일시정지';

  @override
  String get syncPosition => '동기화 위치';

  @override
  String stopCast(String label) {
    return '$label 중지';
  }

  @override
  String get queueIsEmpty => '대기열이 비어 있습니다.';

  @override
  String trackNumber(int number) {
    return '트랙 $number';
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
    return '$seconds초';
  }

  @override
  String get longPressToUnlock => '잠금을 해제하려면 길게 누르세요.';

  @override
  String get off => '끔';

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
  String get reset => '초기화';

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
  String get track => '트랙';

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
    return '$protocol 세션 오류';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return '도서 정보를 불러오지 못했습니다: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      '이 플랫폼에서는 아직 EPUB 렌더링 인앱을 사용할 수 없습니다.';

  @override
  String formatCannotRenderInApp(String extension) {
    return '이 형식(.$extension)은 아직 앱에서 표시할 수 없습니다.';
  }

  @override
  String get embeddedRenderingUnavailable => '이 플랫폼에서는 포함된 문서 렌더링을 사용할 수 없습니다.';

  @override
  String get couldNotOpenExternalViewer => '외부 뷰어를 열 수 없습니다.';

  @override
  String failedToOpenInAppReader(String error) {
    return '앱 내 리더를 열지 못했습니다: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label에 이미 북마크가 있습니다.';
  }

  @override
  String bookmarkAdded(String label) {
    return '북마크 추가됨: $label';
  }

  @override
  String get noBookmarksYet => '아직 북마크가 없습니다.\n위치를 저장하려면 읽는 동안 북마크 아이콘을 탭하세요.';

  @override
  String get noTableOfContentsAvailable => '목차가 없습니다.';

  @override
  String pageLabel(int number) {
    return '$number페이지';
  }

  @override
  String get position => '위치';

  @override
  String get bookReader => '책 리더';

  @override
  String formatExtension(String extension) {
    return '형식: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% 읽음';
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
    return '확대/축소 초기화(${zoom}x)';
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
    return '읽음 상태를 변경하지 못했습니다: $error';
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
    return '이 플랫폼에서는 $extension 파일용 내장 문서 엔진을 사용할 수 없습니다.';
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
    return '편성표를 불러오지 못했습니다: $error';
  }

  @override
  String get noChannelsFound => '채널을 찾을 수 없습니다';

  @override
  String get liveBadge => '살다';

  @override
  String guideNextProgram(String time, String title) {
    return '다음: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes분 남음';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours시간 남음';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours시간 $minutes분 남음';
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
  String get record => '녹화 예약';

  @override
  String get cancelRecordingAction => '녹화 취소';

  @override
  String get programSetToRecord => '녹화가 예약되었습니다';

  @override
  String get recordingCancelled => '녹화가 취소되었습니다';

  @override
  String get unableToCreateRecording => '녹화를 예약할 수 없습니다';

  @override
  String get watch => '시청';

  @override
  String get close => '닫기';

  @override
  String failedToPlayChannel(String name) {
    return '$name을(를) 재생하지 못했습니다';
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
    return '\"$name\"의 예약 녹화를 취소할까요?';
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
    return '\"$name\" 녹화를 중지할까요?';
  }

  @override
  String get failedToCancelSeriesRecording => '시리즈 녹화를 취소하지 못했습니다.';

  @override
  String get searchThisLibrary => '이 라이브러리를 검색해 보세요...';

  @override
  String get searchEllipsis => '찾다...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\"에 대한 검색 결과가 없습니다';
  }

  @override
  String searchFailedError(String error) {
    return '검색에 실패했습니다: $error';
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
    return '\"$name\"과(와) 해당 파일을 삭제할까요?';
  }

  @override
  String tracksCount(int count) {
    return '트랙 $count개';
  }

  @override
  String get album => '앨범';

  @override
  String get playAlbum => '앨범 재생';

  @override
  String failedToLoadAlbum(String error) {
    return '앨범을 불러오지 못했습니다: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name에 다운로드한 트랙이 없습니다.';
  }

  @override
  String get season => '시즌';

  @override
  String get errorLoadingEpisodes => '에피소드를 로드하는 중에 오류가 발생했습니다.';

  @override
  String get noDownloadedEpisodes => '다운로드한 에피소드가 없습니다.';

  @override
  String get deleteEpisode => '에피소드 삭제';

  @override
  String removeName(String name) {
    return '\"$name\"을(를) 삭제할까요?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes분';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return '$number화';
  }

  @override
  String get seriesNotFound => '시리즈를 찾을 수 없습니다';

  @override
  String get errorLoadingSeries => '시리즈를 로드하는 중에 오류가 발생했습니다.';

  @override
  String get downloadedEpisodes => '다운로드한 에피소드';

  @override
  String seasonNumber(int number) {
    return '시즌 $number';
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
    return '$season의 다운로드한 에피소드를 모두 삭제할까요?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '에피소드 $count개',
      one: '에피소드 1개',
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
    return '다운로드한 항목 $count개를 삭제할까요?';
  }

  @override
  String get musicAndAudiobooks => '음악 및 오디오북';

  @override
  String get images => '이미지';

  @override
  String get database => '데이터 베이스';

  @override
  String ofStorageLimit(String limit) {
    return '/ 제한 $limit';
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
    return '옵션 $count개';
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
  String get themeMusicSettingsSubtitle => '상세 페이지, 홈 행, 음량';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => '홈 행의 테마 음악';

  @override
  String get playWhenBrowsingHomeScreen => '홈 화면 탐색 시 재생';

  @override
  String get loopThemeMusic => '테마 음악 반복 재생';

  @override
  String get loopThemeMusicSubtitle => '한 번만 재생하지 않고 트랙을 반복합니다';

  @override
  String get detailsBackgroundBlur => '세부 배경 흐림';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

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
  String get settingsScrollWheelAction => '마우스 휠 스크롤';

  @override
  String get settingsScrollWheelActionDescription =>
      '재생 중 영상 위에서 마우스 휠을 굴렸을 때의 동작을 선택하세요.';

  @override
  String get scrollWheelActionOff => '끔';

  @override
  String get scrollWheelActionSeek => '탐색(앞/뒤로)';

  @override
  String get scrollWheelActionVolume => '음량';

  @override
  String get playerTooltipVolume => '음량';

  @override
  String get fit => '맞다';

  @override
  String get autoCrop => '자동 자르기';

  @override
  String get stretch => '뻗기';

  @override
  String get refreshRateSwitching => '새로 고침 빈도 전환';

  @override
  String get disabled => '사용 안 함';

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
  String get fallbackAudioLanguage => '대체 오디오 언어';

  @override
  String get preferDefaultAudioTrack => '기본 오디오 트랙 우선';

  @override
  String get preferDefaultAudioTrackDescription => '더빙 트랙보다 원어 오디오 트랙을 우선합니다.';

  @override
  String get preferAudioDescription => '화면 해설 트랙 우선';

  @override
  String get preferAudioDescriptionDescription => '일반 트랙보다 화면 해설 트랙을 우선합니다.';

  @override
  String get transcodingAudio => '트랜스코딩(오디오)';

  @override
  String get directStreamRemux => '다이렉트 스트림(리먹스)';

  @override
  String get transcodingBitrateOrResolution => '트랜스코딩(비트레이트 또는 해상도)';

  @override
  String get transcodingVideoAndAudio => '트랜스코딩(비디오 및 오디오)';

  @override
  String get transcodingVideo => '트랜스코딩(비디오)';

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
  String get settingsAudioOutputMode => '오디오 출력 모드';

  @override
  String get settingsAudioOutputModeDescription =>
      '오디오 디코딩 방식을 선택하세요. AVR 패스스루는 원본 Dolby/DTS 스트림을 리시버로 그대로 보내고, 자동 또는 다운믹스는 기기에서 디코딩합니다.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR 패스스루';

  @override
  String get settingsAudioFallbackCodec => '대체 오디오 코덱';

  @override
  String get settingsAudioFallbackCodecDescription =>
      '원본 스트림을 다이렉트 재생하거나 패스스루할 수 없을 때 멀티채널 오디오를 트랜스코딩할 대상 형식을 선택하세요.';

  @override
  String get settingsAudioFallbackCodecAuto => '자동 감지\n(권장)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(기본값)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(무손실)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(스테레오 전용)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(고효율)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(무손실)';

  @override
  String get settingsMaxAudioChannels => '최대 오디오 채널';

  @override
  String get settingsMaxAudioChannelsDescription =>
      '사용 중인 오디오 환경의 최대 채널 수를 설정하세요. 이 제한을 넘는 멀티채널 스트림은 다운믹스되거나 트랜스코딩됩니다.';

  @override
  String get settingsMaxAudioChannelsAuto => '자동 감지\n(하드웨어 기본값)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 모노';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 스테레오';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 서라운드';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 쿼드러포닉';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 서라운드';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 서라운드';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 서라운드';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 서라운드';

  @override
  String get settingsAudioPassthroughAdvanced => '패스스루(고급)';

  @override
  String get settingsAudioCodecPassthrough => '코덱 패스스루';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      '사용 중인 AVR 또는 HDMI 기기가 지원하는 형식만 켜세요.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 패스스루';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC(Atmos) 패스스루';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS 코어 패스스루';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA 패스스루';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD 패스스루';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos 패스스루';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus(EAC3)를 외부 디코더로 비트스트림 전송합니다.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3(JOC) 기반 Dolby Atmos를 외부 디코더로 비트스트림 전송합니다.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS-HD MA(DTS 코어 포함)를 외부 디코더로 비트스트림 전송합니다.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos 메타데이터가 포함된 Dolby TrueHD를 외부 디코더로 비트스트림 전송합니다.';

  @override
  String get settingsDetectedAudioCapabilities => '감지된 오디오 지원 정보';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      '아직 사용할 수 있는 런타임 지원 정보가 없습니다.';

  @override
  String get settingsAudioRouteLabel => '출력 경로';

  @override
  String get settingsAudioDecodeLabel => '디코딩';

  @override
  String get settingsAudioPassthroughLabel => '패스스루';

  @override
  String get settingsAudioHdRoute => 'HD 오디오 경로';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => '스피커';

  @override
  String get settingsAudioRouteHeadphones => '헤드폰';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => '진단 정보';

  @override
  String get settingsAudioDiagnosticsVideoLevel => '비디오 레벨';

  @override
  String get settingsAudioDiagnosticsVideoRange => '비디오 범위';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => '자막 코덱';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs => '허용된 오디오 코덱';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS 오디오 코덱';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs => 'HLS fMP4 오디오 코덱';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif 패스스루';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => '현재 오디오 경로';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport => '경로의 HD 오디오 지원';

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
    return '$value초';
  }

  @override
  String get mediaQueuing => '미디어 대기열';

  @override
  String get autoQueueNextEpisodes => '다음 에피소드 자동 대기열';

  @override
  String get stillWatchingPrompt => '아직 프롬프트를 보고 있는 중';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes편 재생 또는 $hours시간 후';
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
  String get subtitleMode => '자막 모드';

  @override
  String get subtitleModeFlagged => '플래그 기준';

  @override
  String get subtitleModeAlways => '항상';

  @override
  String get subtitleModeForeign => '외국어';

  @override
  String get subtitleModeForced => '강제 자막';

  @override
  String get subtitleModeFlaggedDescription =>
      '미디어 파일의 메타데이터에 \"기본\" 또는 \"강제\"로 표시된 트랙을 재생합니다.';

  @override
  String get subtitleModeAlwaysDescription => '영상을 재생할 때마다 자막을 자동으로 불러와 표시합니다.';

  @override
  String get subtitleModeForeignDescription =>
      '기본 오디오 트랙이 외국어일 때 자막을 자동으로 켭니다.';

  @override
  String get subtitleModeForcedDescription => '강제 자막 플래그가 지정된 자막만 불러옵니다.';

  @override
  String get subtitleModeNoneDescription => '자막 자동 불러오기를 완전히 끕니다.';

  @override
  String get fallbackSubtitleLanguage => '대체 자막 언어';

  @override
  String get subtitleStream => '자막 스트림';

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
    return '$profile 프로필 설정을 불러왔습니다.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile 프로필 설정을 불러오지 못했습니다.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return '로컬 설정을 $profile 프로필에 동기화했습니다.';
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
  String get reportDownloadsActivity => '서버에 다운로드 표시';

  @override
  String get reportDownloadsActivitySubtitle =>
      '서버 관리자가 대시보드에서 내 트랜스코딩 다운로드를 볼 수 있도록 합니다';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

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
  String get navbarAlwaysExpanded => '탐색 바 라벨 항상 표시';

  @override
  String get showSeerrButton => 'Seerr 버튼 표시';

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
  String get groupItemsIntoCollections => '항목을 컬렉션으로 묶기';

  @override
  String get hideCollectionAssociatedItems => '라이브러리를 탐색할 때 컬렉션에 속한 항목을 숨깁니다';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '라이브러리 그룹화 안내';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      '이 설정을 사용하려면 Jellyfin 또는 Emby 서버의 라이브러리 표시 설정에서 \"영화를 컬렉션으로 묶기\" 및/또는 \"TV 프로그램을 컬렉션으로 묶기\"가 켜져 있는지 확인하세요.';

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
    return '$count개 선택됨';
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
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => '끔';

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
  String get trailerAudio => '예고편 오디오';

  @override
  String get enableTrailerAudio => '미디어 바의 예고편에서 소리를 재생합니다';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription =>
      'Show captions on YouTube trailers in the media bar';

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
  String get fullScreenRows => '홈 행 크게 보기';

  @override
  String get fullScreenRowsDescription => '화면당 홈 행을 1개로 제한합니다';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => '행별 이미지 유형';

  @override
  String get perRowSettings => '행별 설정';

  @override
  String get autoLogin => '자동 로그인';

  @override
  String get lastUser => '마지막 사용자';

  @override
  String get currentUser => '현재 사용자';

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
  String get mode => '모드';

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
    return '$minutes분';
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
  String get clockModeStatic => '고정';

  @override
  String get clockModeBouncing => '움직임';

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
  String get trakt => 'Trakt';

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
  String get pluginLabel => 'Moonbase 플러그인';

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
    return '$status\n버전: $version';
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
  String get seerrDiscoveryRows => 'Seerr 둘러보기 행';

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
  String get seerrNotificationsSection => '알림';

  @override
  String get seerrNotifyNewRequestsTitle => '새 요청 알림';

  @override
  String get seerrNotifyNewRequestsSubtitle => '누군가 요청을 등록하면 알려줍니다';

  @override
  String get seerrNotifyLibraryAddedTitle => '요청 상태 알림';

  @override
  String get seerrNotifyLibraryAddedSubtitle => '승인, 거절, 라이브러리 추가 알림';

  @override
  String get seerrNotifyIssuesTitle => '문제 알림';

  @override
  String get seerrNotifyIssuesSubtitle => '새 문제, 댓글, 해결 알림';

  @override
  String loggedInAs(String username) {
    return '로그인 계정: $username';
  }

  @override
  String get discoverRows => 'Seerr 디스커버리 페이지';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr 메인 페이지에 표시할 행을 활성화하세요. 드래그하여 순서를 변경할 수 있습니다. 사용자 지정 순서는 Moonbase와 동기화됩니다.';

  @override
  String get discoverRowsDescription =>
      'Seerr 메인 페이지에 표시할 행을 활성화하세요. 드래그하여 순서를 변경할 수 있습니다. 사용자 지정 순서는 Moonbase와 동기화됩니다.';

  @override
  String get enabled => '사용함';

  @override
  String get hidden => '숨겨진';

  @override
  String get aboutTitle => '에 대한';

  @override
  String versionValue(String version) {
    return '버전 $version';
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
    return '업데이트 있음: v$version';
  }

  @override
  String get updateNotifications => '업데이트 알림';

  @override
  String get showWhenUpdatesAvailable => '업데이트가 있을 때 표시';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version 사용 가능';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => '이미지 캐시 제한';

  @override
  String get clearImageCache => '이미지 캐시 지우기';

  @override
  String get imageCacheCleared => '이미지 캐시를 지웠습니다';

  @override
  String get clear => '지우기';

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
    return '다운로드 중 · $percent%';
  }

  @override
  String get seerrImportingStatus => '가져오는 중';

  @override
  String itemsCount(int count) {
    return '$count개 항목';
  }

  @override
  String get seerrSettings => 'Seerr 설정';

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
    return '$name 요청';
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
    return '\"$title\" 요청을 취소할까요?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\"의 요청 $count건을 취소할까요?';
  }

  @override
  String get keep => '유지하다';

  @override
  String get itemNotFoundInLibrary => 'Moonfin 라이브러리에서 항목을 찾을 수 없습니다.';

  @override
  String get errorSearchingLibrary => '라이브러리 검색 중 오류 발생';

  @override
  String budgetAmount(String amount) {
    return '제작비: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return '수익: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '$type 요청';
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
  String get appearances => '출연작';

  @override
  String get crewSection => '승무원';

  @override
  String ageValue(int age) {
    return '$age세';
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
  String get failedStatus => '실패';

  @override
  String get processingStatus => '처리 중';

  @override
  String modifiedByName(String name) {
    return '$name이(가) 변경';
  }

  @override
  String get completedStatus => '완료됨';

  @override
  String get requestErrorDuplicate => '이미 요청한 작품입니다';

  @override
  String get requestErrorQuota => '요청 한도에 도달했습니다';

  @override
  String get requestErrorBlocklisted => '차단 목록에 있는 작품입니다';

  @override
  String get requestErrorNoSeasons => '요청할 수 있는 시즌이 없습니다';

  @override
  String get requestErrorPermission => '이 요청을 할 권한이 없습니다';

  @override
  String get seerrRequestsTitle => '요청';

  @override
  String get seerrIssuesTitle => '문제';

  @override
  String get sortNewest => '최신순';

  @override
  String get sortLastModified => '최근 변경순';

  @override
  String get noIssues => '문제 없음';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '영화 요청 $limit건 중 $remaining건 남음';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '시즌 요청 $limit건 중 $remaining건 남음';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name 컬렉션의 일부';
  }

  @override
  String get viewCollection => '컬렉션 보기';

  @override
  String get requestCollection => '컬렉션 요청';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '영화 $total편 · $available편 이용 가능';
  }

  @override
  String requestMoviesCount(int count) {
    return '영화 $count편 요청';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total건 중 $current건 요청 중...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '영화 $count편을 요청했습니다';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '영화 $total편 중 $ok편을 요청했습니다';
  }

  @override
  String get collectionAllRequested => '모든 영화가 이미 이용 가능하거나 요청되었습니다';

  @override
  String get reportIssue => '문제 신고';

  @override
  String get issueTypeVideo => '영상';

  @override
  String get issueTypeAudio => '오디오';

  @override
  String get whatsWrong => '어떤 문제인가요?';

  @override
  String get allEpisodes => '모든 에피소드';

  @override
  String get episode => '에피소드';

  @override
  String get openStatus => '미해결';

  @override
  String get resolvedStatus => '해결됨';

  @override
  String get resolveAction => '해결 처리';

  @override
  String get reopenAction => '다시 열기';

  @override
  String reportedByName(String name) {
    return '$name 신고';
  }

  @override
  String commentsCount(int count) {
    return '댓글 $count개';
  }

  @override
  String get addComment => '댓글 추가';

  @override
  String get deleteIssueConfirm => '이 문제를 삭제할까요?';

  @override
  String get submitReport => '신고 제출';

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
  String get seasonsLabel => '시즌';

  @override
  String get episodesLabel => '에피소드';

  @override
  String get access => '입장';

  @override
  String get add => '추가';

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
  String get edit => '편집';

  @override
  String get encoding => '부호화';

  @override
  String get error => '오류';

  @override
  String get forward => '앞으로';

  @override
  String get general => '일반';

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
  String get search => '검색';

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
  String get stop => '정지';

  @override
  String get streaming => '스트리밍';

  @override
  String get time => '시간';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => '음소거';

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
  String get adminDrawerLibraries => '라이브러리';

  @override
  String get adminDrawerDisplay => '표시';

  @override
  String get adminDrawerMetadata => '메타데이터';

  @override
  String get adminDrawerNfo => 'NFO 설정';

  @override
  String get adminDrawerTranscoding => '트랜스코딩';

  @override
  String get adminDrawerResume => '이어보기';

  @override
  String get adminDrawerStreaming => '스트리밍';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return '업데이트 가능한 플러그인: $count개';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return '재시작이 필요한 플러그인: $count개';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return '실패한 예약 작업: $count개';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return '최근 경고/오류 항목: $count개';
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
    return '오류: $error';
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
    return '명령을 실행하지 못했습니다: $error';
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
  String get sessionForward => '빨리 감기';

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
  String get volume => '음량';

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
  String get adminActivitySeverityAll => '모든 심각도';

  @override
  String get adminActivityDateRange => '기간';

  @override
  String adminActivityLoadFailed(String error) {
    return '활동 로그를 불러오지 못했습니다: $error';
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
    return '기기를 업데이트하지 못했습니다: $error';
  }

  @override
  String get adminDeleteDevice => '장치 삭제';

  @override
  String get adminDeviceDeleted => '기기가 삭제되었습니다.';

  @override
  String adminDeviceDeleteFailed(String error) {
    return '기기를 삭제하지 못했습니다: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '\'$name\' 기기를 삭제할까요? 이 기기에서 사용자가 다시 로그인해야 합니다.';
  }

  @override
  String get adminDeleteAllDevices => '모든 기기 삭제';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '기기 $count대를 삭제할까요? 해당 사용자는 다시 로그인해야 합니다. 현재 기기는 영향을 받지 않습니다.';
  }

  @override
  String get adminDevicesDeletedAll => '기기를 삭제했습니다';

  @override
  String adminDevicesDeletedPartial(int count) {
    return '일부 기기를 삭제했습니다. $count대는 삭제하지 못했습니다.';
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
    return '검색을 시작하지 못했습니다: $error';
  }

  @override
  String get adminRenameLibrary => '라이브러리 이름 바꾸기';

  @override
  String get adminNewName => '새 이름';

  @override
  String adminLibraryRenamed(String name) {
    return '라이브러리 이름을 \"$name\"(으)로 변경했습니다';
  }

  @override
  String adminRenameFailed(String error) {
    return '이름을 변경하지 못했습니다: $error';
  }

  @override
  String get adminDeleteLibrary => '라이브러리 삭제';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" 라이브러리를 삭제했습니다';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return '라이브러리를 삭제하지 못했습니다: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return '경로를 추가하지 못했습니다: $error';
  }

  @override
  String get adminRemovePath => '경로 제거';

  @override
  String adminRemovePathConfirm(String path) {
    return '이 라이브러리에서 \"$path\"을(를) 제거할까요?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return '경로를 제거하지 못했습니다: $error';
  }

  @override
  String get adminLibraryOptionsSaved => '라이브러리 옵션이 저장되었습니다.';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return '옵션을 저장하지 못했습니다: $error';
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
  String get adminLibraryTabPaths => '경로';

  @override
  String get adminLibraryTabOptions => '옵션';

  @override
  String get adminLibraryTabDownloaders => '다운로더';

  @override
  String get adminLibMetadataSavers => '메타데이터 저장 도구';

  @override
  String get adminLibSubtitleDownloaders => '자막 다운로더';

  @override
  String get adminLibLyricDownloaders => '가사 다운로더';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return '메타데이터 다운로더: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return '이미지 수집기: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      '이 서버에는 해당 라이브러리 유형에 사용할 수 있는 다운로더가 없습니다.';

  @override
  String get adminLibrarySectionGeneral => '일반';

  @override
  String get adminLibrarySectionMetadata => '메타데이터';

  @override
  String get adminLibrarySectionEmbedded => '내장 정보';

  @override
  String get adminLibrarySectionSubtitles => '자막';

  @override
  String get adminLibrarySectionImages => '이미지';

  @override
  String get adminLibrarySectionSeries => '시리즈';

  @override
  String get adminLibrarySectionMusic => '음악';

  @override
  String get adminLibrarySectionMovies => '영화';

  @override
  String get adminLibRealtimeMonitor => '실시간 모니터링 사용';

  @override
  String get adminLibRealtimeMonitorHint => '파일 변경을 감지해 자동으로 처리합니다.';

  @override
  String get adminLibArchiveMediaFiles => '압축 파일을 미디어 파일로 취급';

  @override
  String get adminLibEnablePhotos => '사진 표시';

  @override
  String get adminLibSaveLocalMetadata => '아트워크를 미디어 폴더에 저장';

  @override
  String get adminLibRefreshInterval => '메타데이터 자동 새로고침';

  @override
  String get adminLibRefreshNever => '안 함';

  @override
  String get adminLibDefault => '기본값';

  @override
  String get adminLibDisplayTitle => '표시';

  @override
  String get adminLibDisplaySection => '라이브러리 표시';

  @override
  String get adminLibFolderView => '일반 미디어 폴더를 보여주는 폴더 보기 표시';

  @override
  String get adminLibSpecialsInSeasons => '스페셜 에피소드를 방영된 시즌 안에 표시';

  @override
  String get adminLibGroupMovies => '영화를 컬렉션으로 묶기';

  @override
  String get adminLibGroupShows => 'TV 프로그램을 컬렉션으로 묶기';

  @override
  String get adminLibExternalSuggestions => '추천에 외부 콘텐츠 표시';

  @override
  String get adminLibDateAddedSection => '추가 날짜 처리 방식';

  @override
  String get adminLibDateAddedLabel => '추가 날짜 기준';

  @override
  String get adminLibDateAddedImport => '라이브러리에 검색된 날짜';

  @override
  String get adminLibDateAddedFile => '파일이 생성된 날짜';

  @override
  String get adminLibMetadataTitle => '메타데이터 및 이미지';

  @override
  String get adminLibMetadataLangSection => '선호 메타데이터 언어';

  @override
  String get adminLibChaptersSection => '챕터';

  @override
  String get adminLibDummyChapterDuration => '임시 챕터 길이(초)';

  @override
  String get adminLibDummyChapterDurationHint =>
      '챕터가 없는 미디어에 생성할 챕터의 길이입니다. 0으로 설정하면 사용하지 않습니다.';

  @override
  String get adminLibChapterImageResolution => '챕터 이미지 해상도';

  @override
  String get adminLibNfoTitle => 'NFO 설정';

  @override
  String get adminLibNfoHelp =>
      'NFO 메타데이터는 Kodi 및 유사한 클라이언트와 호환됩니다. 이 설정은 NFO 메타데이터를 저장하는 모든 라이브러리에 적용됩니다.';

  @override
  String get adminLibKodiUser => 'NFO 파일에 시청 기록을 저장할 사용자';

  @override
  String get adminLibSaveImagePaths => 'NFO 파일에 이미지 경로 저장';

  @override
  String get adminLibPathSubstitution => 'NFO 이미지 경로에 경로 치환 사용';

  @override
  String get adminLibExtraThumbs => 'extrafanart 이미지를 extrathumbs 폴더로 복사';

  @override
  String get adminLibNone => '없음';

  @override
  String adminLibRefreshDays(int days) {
    return '$days일';
  }

  @override
  String get adminLibEmbeddedTitles => '내장 제목 사용';

  @override
  String get adminLibEmbeddedExtrasTitles => '부가 영상에 내장 제목 사용';

  @override
  String get adminLibEmbeddedEpisodeInfos => '내장 에피소드 정보 사용';

  @override
  String get adminLibAllowEmbeddedSubtitles => '내장 자막 허용';

  @override
  String get adminLibEmbeddedAllowAll => '모두 허용';

  @override
  String get adminLibEmbeddedAllowText => '텍스트만';

  @override
  String get adminLibEmbeddedAllowImage => '이미지만';

  @override
  String get adminLibEmbeddedAllowNone => '없음';

  @override
  String get adminLibSkipIfEmbeddedSubs => '내장 자막이 있으면 다운로드 건너뛰기';

  @override
  String get adminLibSkipIfAudioMatches => '오디오 트랙이 다운로드 언어와 일치하면 건너뛰기';

  @override
  String get adminLibRequirePerfectMatch => '완전히 일치하는 자막만 사용';

  @override
  String get adminLibSaveSubtitlesWithMedia => '자막을 미디어 폴더에 저장';

  @override
  String get adminLibChapterImageExtraction => '챕터 이미지 추출';

  @override
  String get adminLibChapterImagesDuringScan => '라이브러리 검색 중 챕터 이미지 추출';

  @override
  String get adminLibTrickplayExtraction => 'Trickplay 이미지 추출 사용';

  @override
  String get adminLibTrickplayDuringScan => '라이브러리 검색 중 Trickplay 이미지 추출';

  @override
  String get adminLibSaveTrickplayWithMedia => 'Trickplay 이미지를 미디어 폴더에 저장';

  @override
  String get adminLibAutomaticSeriesGrouping => '여러 폴더에 나뉜 시리즈 자동 병합';

  @override
  String get adminLibSeasonZeroName => '시즌 0 표시 이름';

  @override
  String get adminLibLufsScan => '오디오 음량 정규화를 위한 LUFS 분석 사용';

  @override
  String get adminLibPreferNonstandardArtist => '비표준 아티스트 태그 우선';

  @override
  String get adminLibAutoAddToCollection => '영화를 컬렉션에 자동 추가';

  @override
  String get adminLibraryNameRequired => '라이브러리 이름은 필수 항목입니다.';

  @override
  String adminLibraryCreateFailed(String error) {
    return '라이브러리를 만들지 못했습니다: $error';
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
    return '$name을(를) 비활성화할까요? 로그인할 수 없게 됩니다.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name을(를) 활성화할까요? 다시 로그인할 수 있게 됩니다.';
  }

  @override
  String adminUserDisabled(String name) {
    return '\"$name\" 사용자를 비활성화했습니다';
  }

  @override
  String adminUserEnabled(String name) {
    return '\"$name\" 사용자를 활성화했습니다';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return '사용자 정책을 업데이트하지 못했습니다: $error';
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
    return '사용자를 만들지 못했습니다: $error';
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
    return '저장하지 못했습니다: $error';
  }

  @override
  String get adminPermissionsSaved => '권한이 저장되었습니다';

  @override
  String get adminPasswordsMismatch => '비밀번호가 일치하지 않습니다.';

  @override
  String adminFailed(String error) {
    return '실패: $error';
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
  String get adminParentalControl => '자녀 보호';

  @override
  String get adminMaxParentalRating => '허용할 최대 시청 등급';

  @override
  String get adminMaxParentalRatingHint => '등급이 더 높은 콘텐츠는 이 사용자에게 표시되지 않습니다.';

  @override
  String get adminParentalRatingNone => '없음';

  @override
  String get adminBlockUnratedItems => '등급 정보가 없거나 인식되지 않는 항목 차단';

  @override
  String get adminUnratedBook => '도서';

  @override
  String get adminUnratedChannelContent => '채널';

  @override
  String get adminUnratedLiveTvChannel => '실시간 TV';

  @override
  String get adminUnratedMovie => '영화';

  @override
  String get adminUnratedMusic => '음악';

  @override
  String get adminUnratedTrailer => '예고편';

  @override
  String get adminUnratedSeries => 'TV 프로그램';

  @override
  String get adminAccessSchedules => '접속 시간 설정';

  @override
  String get adminAccessSchedulesHint =>
      '아래 지정한 시간에만 접속을 허용합니다. 설정이 없으면 하루 종일 접속할 수 있습니다.';

  @override
  String get adminAddSchedule => '일정 추가';

  @override
  String get adminScheduleDay => '요일';

  @override
  String get adminScheduleStart => '시작';

  @override
  String get adminScheduleEnd => '종료';

  @override
  String get adminDayEveryday => '매일';

  @override
  String get adminDayWeekday => '평일';

  @override
  String get adminDayWeekend => '주말';

  @override
  String get adminDaySunday => '일요일';

  @override
  String get adminDayMonday => '월요일';

  @override
  String get adminDayTuesday => '화요일';

  @override
  String get adminDayWednesday => '수요일';

  @override
  String get adminDayThursday => '목요일';

  @override
  String get adminDayFriday => '금요일';

  @override
  String get adminDaySaturday => '토요일';

  @override
  String get adminAllowedTags => '허용 태그';

  @override
  String get adminAllowedTagsHint => '이 태그가 있는 콘텐츠만 표시됩니다. 비워 두면 모두 허용합니다.';

  @override
  String get adminBlockedTags => '차단 태그';

  @override
  String get adminBlockedTagsHint => '이 태그가 있는 콘텐츠는 이 사용자에게 표시되지 않습니다.';

  @override
  String get adminAddTag => '태그 추가';

  @override
  String get adminEnabledDevices => '허용된 기기';

  @override
  String get adminEnabledChannels => '허용된 채널';

  @override
  String get adminAuthProvider => '인증 공급자';

  @override
  String get adminPasswordResetProvider => '비밀번호 재설정 공급자';

  @override
  String get adminLoginAttemptsBeforeLockout => '계정 잠금 전 최대 로그인 실패 횟수';

  @override
  String get adminLoginAttemptsHint => '기본값은 0, 잠금을 사용하지 않으려면 -1로 설정하세요.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay 권한';

  @override
  String get adminSyncPlayCreateAndJoin => '그룹 생성 및 참여 허용';

  @override
  String get adminSyncPlayJoin => '그룹 참여 허용';

  @override
  String get adminSyncPlayNone => '권한 없음';

  @override
  String get adminContentDeletionFolders => '콘텐츠 삭제를 허용할 폴더';

  @override
  String get adminResetPasswordWarning =>
      '그러면 비밀번호가 제거됩니다. 사용자는 비밀번호 없이 로그인할 수 있습니다.';

  @override
  String adminServerReturnedHttp(int status) {
    return '서버가 HTTP $status을(를) 반환했습니다';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name을(를) 삭제할까요?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" 사용자를 삭제했습니다';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return '사용자를 삭제하지 못했습니다: $error';
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
    return '키를 만들지 못했습니다: $error';
  }

  @override
  String get adminKeyTokenMissing => '서버 응답에서 키 토큰이 누락되었습니다.';

  @override
  String get adminRevokeApiKey => 'API 키 취소';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name의 키를 취소할까요?';
  }

  @override
  String get adminApiKeyRevoked => 'API 키가 취소되었습니다.';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return '키를 취소하지 못했습니다: $error';
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
    return '토큰: $token\\n생성: $created';
  }

  @override
  String get adminBackupOptionsTitle => '백업 만들기';

  @override
  String get adminBackupInclude => '백업에 포함할 항목을 선택하세요.';

  @override
  String get adminBackupDatabase => '데이터베이스';

  @override
  String get adminBackupDatabaseAlways => '항상 포함됨';

  @override
  String get adminBackupMetadata => '메타데이터';

  @override
  String get adminBackupSubtitles => '자막';

  @override
  String get adminBackupTrickplay => 'Trickplay 이미지';

  @override
  String get adminCreatingBackup => '백업 생성 중...';

  @override
  String get adminBackupCreated => '백업이 성공적으로 생성되었습니다.';

  @override
  String adminBackupCreateFailed(String error) {
    return '백업을 만들지 못했습니다: $error';
  }

  @override
  String get adminBackupPathMissing => '서버 응답에 백업 경로가 없습니다.';

  @override
  String adminBackupManifest(String name) {
    return '매니페스트: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return '매니페스트를 불러오지 못했습니다: $error';
  }

  @override
  String get adminConfirmRestore => '복원 확인';

  @override
  String get adminRestoringBackup => '백업 복원 중...';

  @override
  String adminRestoreFailed(String error) {
    return '백업을 복원하지 못했습니다: $error';
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
    return '$path에 저장했습니다';
  }

  @override
  String adminFileSaveFailed(String error) {
    return '파일을 저장하지 못했습니다: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName을(를) 불러오지 못했습니다';
  }

  @override
  String get adminSearchInLog => '로그에서 검색';

  @override
  String get adminNoMatchingLines => '일치하는 줄이 없습니다.';

  @override
  String adminTasksLoadFailed(String error) {
    return '작업을 불러오지 못했습니다: $error';
  }

  @override
  String get adminNoScheduledTasks => '예약된 작업을 찾을 수 없습니다.';

  @override
  String get adminNoTasksMatchFilter => '현재 필터와 일치하는 작업이 없습니다.';

  @override
  String adminTaskStartFailed(String error) {
    return '작업을 시작하지 못했습니다: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return '작업을 중지하지 못했습니다: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return '작업을 불러오지 못했습니다: $error';
  }

  @override
  String get adminRunNow => '지금 실행';

  @override
  String adminTriggerRemoveFailed(String error) {
    return '트리거를 제거하지 못했습니다: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return '트리거를 추가하지 못했습니다: $error';
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
    return '$hours시간';
  }

  @override
  String get adminDayOfWeek => '요일';

  @override
  String get adminSearchPlugins => '플러그인 검색...';

  @override
  String adminPluginToggleFailed(String error) {
    return '플러그인을 켜거나 끄지 못했습니다: $error';
  }

  @override
  String get adminUninstallPlugin => '플러그인 제거';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '\"$name\"을(를) 제거할까요?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return '플러그인을 제거하지 못했습니다: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return '패키지를 설치하지 못했습니다: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return '업데이트를 설치하지 못했습니다: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return '플러그인을 불러오지 못했습니다: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => '검색어와 일치하는 플러그인이 없습니다';

  @override
  String get adminNoPluginsInstalled => '플러그인이 설치되지 않았습니다.';

  @override
  String adminInstallUpdate(String version) {
    return '업데이트 설치(v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return '카탈로그를 불러오지 못했습니다: $error';
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
    return '서버를 재시작하면 \"$name\"이(가) 제거됩니다';
  }

  @override
  String adminUninstallFailed(String error) {
    return '제거하지 못했습니다: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\"을(를) v$version(으)로 업데이트하는 중...';
  }

  @override
  String get adminMissingAuthToken => '설정을 열 수 없습니다. 인증 토큰이 누락되었습니다.';

  @override
  String adminPluginLoadFailed(String error) {
    return '플러그인을 불러오지 못했습니다: $error';
  }

  @override
  String get adminPluginNotFound => '플러그인을 찾을 수 없습니다';

  @override
  String adminPluginVersion(String version) {
    return '버전 $version';
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
    return '\"$name\"을(를) 제거할까요?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return '저장소를 저장하지 못했습니다: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return '저장소를 불러오지 못했습니다: $error';
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
    return '플러그인 설정을 불러올 수 없습니다: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri을(를) 열 수 없습니다';
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
  String get adminTrickplaySaved => 'Trickplay 설정이 저장되었습니다';

  @override
  String get adminTrickplayLoadFailed => 'Trickplay 설정을 로드하지 못했습니다';

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
    return '메타데이터를 불러오지 못했습니다: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return '메타데이터를 저장하지 못했습니다: $error';
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
    return '메타데이터를 새로 고치지 못했습니다: $error';
  }

  @override
  String get adminNoRemoteMatches => '원격 일치 항목을 찾을 수 없습니다.';

  @override
  String get adminRemoteResults => '원격 결과';

  @override
  String get adminRemoteMetadataApplied => '원격 메타데이터가 적용됨';

  @override
  String adminRemoteSearchFailed(String error) {
    return '원격 검색에 실패했습니다: $error';
  }

  @override
  String get adminUpdateContentType => '콘텐츠 유형 업데이트';

  @override
  String get adminContentType => '콘텐츠 유형';

  @override
  String get adminContentTypeUpdated => '콘텐츠 유형이 업데이트되었습니다.';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return '콘텐츠 유형을 변경하지 못했습니다: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => '메타데이터 편집기를 로드하지 못했습니다.';

  @override
  String get adminNoPeopleEntries => '인물 항목 없음';

  @override
  String get adminNoExternalIds => '사용 가능한 외부 ID가 없습니다.';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType 이미지를 업데이트했습니다';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return '이미지를 다운로드하지 못했습니다: $error';
  }

  @override
  String get adminUnsupportedImageFormat => '지원되지 않는 이미지 형식';

  @override
  String get adminImageReadFailed => '선택한 이미지를 읽지 못했습니다.';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType 이미지를 업로드했습니다';
  }

  @override
  String adminImageUploadFailed(String error) {
    return '이미지를 업로드하지 못했습니다: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType 이미지 삭제';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType 이미지를 삭제했습니다';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return '이미지를 삭제하지 못했습니다: $error';
  }

  @override
  String get adminAllProviders => '모든 제공업체';

  @override
  String get adminNoRemoteImages => '원격 이미지를 찾을 수 없습니다.';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return '튜너를 검색하지 못했습니다: $error';
  }

  @override
  String get adminAddTuner => '튜너 추가';

  @override
  String get adminEditTuner => '튜너 편집';

  @override
  String get adminTunerTypeM3u => 'M3U 튜너';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => '파일 또는 URL';

  @override
  String get adminTunerIpAddress => '튜너 IP 주소';

  @override
  String get adminTunerFriendlyName => '표시 이름';

  @override
  String get adminTunerUserAgent => '사용자 에이전트';

  @override
  String get adminTunerCount => '동시 연결 제한';

  @override
  String get adminTunerCountHelp =>
      '튜너가 동시에 허용하는 최대 스트림 수입니다. 0으로 설정하면 무제한입니다.';

  @override
  String get adminTunerFallbackBitrate => '대체 최대 스트리밍 비트레이트';

  @override
  String get adminTunerImportFavoritesOnly => '즐겨찾기 채널만 가져오기';

  @override
  String get adminTunerAllowHwTranscoding => '하드웨어 트랜스코딩 허용';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 트랜스코딩 컨테이너 허용';

  @override
  String get adminTunerAllowStreamSharing => '스트림 공유 허용';

  @override
  String get adminTunerEnableStreamLooping => '스트림 반복 사용';

  @override
  String get adminTunerIgnoreDts => 'DTS 무시';

  @override
  String get adminTunerReadAtNativeFramerate => '원본 프레임레이트로 입력 읽기';

  @override
  String get adminEditProvider => '공급자 편집';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => '파일 또는 URL';

  @override
  String get adminXmltvMoviePrefix => '영화 접두사';

  @override
  String get adminXmltvMovieCategories => '영화 카테고리';

  @override
  String get adminXmltvCategoriesHelp => '여러 카테고리는 세로줄(|)로 구분하세요.';

  @override
  String get adminXmltvKidsCategories => '어린이 카테고리';

  @override
  String get adminXmltvNewsCategories => '뉴스 카테고리';

  @override
  String get adminXmltvSportsCategories => '스포츠 카테고리';

  @override
  String get adminSdUsername => '사용자 이름';

  @override
  String get adminSdPassword => '비밀번호';

  @override
  String get adminSdCountry => '국가';

  @override
  String get adminSdCountrySelect => '국가를 선택하세요';

  @override
  String get adminSdPostalCode => '우편번호';

  @override
  String get adminSdGetListings => '편성 정보 가져오기';

  @override
  String get adminSdListings => '편성 정보';

  @override
  String get adminEnableAllTuners => '모든 튜너 사용';

  @override
  String get adminTunerType => '튜너 유형';

  @override
  String get adminTunerAdded => '튜너가 추가되었습니다';

  @override
  String adminTunerAddFailed(String error) {
    return '튜너를 추가하지 못했습니다: $error';
  }

  @override
  String get adminAddGuideProvider => '가이드 제공자 추가';

  @override
  String get adminProviderType => '제공자 유형';

  @override
  String get adminProviderAdded => '제공업체가 추가됨';

  @override
  String adminProviderAddFailed(String error) {
    return '공급자를 추가하지 못했습니다: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return '튜너를 제거하지 못했습니다: $error';
  }

  @override
  String get adminTunerResetRequested => '튜너 재설정이 요청되었습니다.';

  @override
  String adminTunerResetFailed(String error) {
    return '튜너를 초기화하지 못했습니다: $error';
  }

  @override
  String get adminTunerResetNotSupported => '이 튜너 유형은 초기화를 지원하지 않습니다.';

  @override
  String adminProviderRemoveFailed(String error) {
    return '공급자를 제거하지 못했습니다: $error';
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
  String get adminMovieRecordingPath => '영화 녹화 경로';

  @override
  String get adminGuideDays => '편성표 데이터 기간';

  @override
  String get adminGuideDaysAuto => '자동';

  @override
  String adminGuideDaysValue(int days) {
    return '$days일';
  }

  @override
  String get adminRecordingPostProcessor => '후처리 프로그램 경로';

  @override
  String get adminRecordingPostProcessorArgs => '후처리 인수';

  @override
  String get adminSaveRecordingNfo => '녹화 NFO 메타데이터 저장';

  @override
  String get adminSaveRecordingImages => '녹화 이미지 저장';

  @override
  String get adminLiveTvSectionTiming => '시간 설정';

  @override
  String get adminLiveTvSectionPaths => '녹화 경로';

  @override
  String get adminLiveTvSectionPostProcessing => '후처리';

  @override
  String adminGuideDaysDisplay(String value) {
    return '편성표 데이터: $value';
  }

  @override
  String get adminRecordingSettingsSaved => '녹화 설정이 저장되었습니다.';

  @override
  String adminSettingsSaveFailed(String error) {
    return '설정을 저장하지 못했습니다: $error';
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
    return '매핑을 업데이트하지 못했습니다: $error';
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
  String get adminRefreshGuideData => '편성표 데이터 새로고침';

  @override
  String get adminGuideRefreshStarted => '편성표 데이터 새로고침을 시작했습니다';

  @override
  String get adminGuideRefreshUnavailable => '이 서버에서는 편성표 새로고침 작업을 사용할 수 없습니다.';

  @override
  String get adminAddProvider => '공급자 추가';

  @override
  String get adminNoListingProviders => '구성된 목록 제공업체가 없습니다.';

  @override
  String adminRecordingPathDisplay(String path) {
    return '녹화 경로: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return '시리즈 경로: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return '시작 여유 시간: $minutes분';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return '종료 여유 시간: $minutes분';
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
    return '$name 백업을 지금 복원할까요?';
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
  String get adminApply => '적용';

  @override
  String get adminNotSet => '설정되지 않음';

  @override
  String get adminReset => '초기화';

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
    return '$minutes분 전';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours시간 전';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days일 전';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName을(를) 불러오지 못했습니다';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count개 일치';
  }

  @override
  String get adminLogViewerNoMatches => '일치하는 줄이 없습니다.';

  @override
  String get adminMetadataEditorTitle => '메타데이터 편집기';

  @override
  String get adminMetadataIdentify => '식별';

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
    return '$imageType 이미지를 업데이트했습니다';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType 이미지를 업로드했습니다';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType 이미지를 삭제했습니다';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return '이미지를 다운로드하지 못했습니다: $error';
  }

  @override
  String get adminMetadataImageReadFailed => '선택한 이미지를 읽지 못했습니다.';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return '이미지를 업로드하지 못했습니다: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType 이미지 삭제';
  }

  @override
  String get adminMetadataDeleteImageContent => '그러면 항목에서 현재 이미지가 제거됩니다.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return '이미지를 삭제하지 못했습니다: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType 이미지 선택';
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
    return '업데이트 있음: v$version';
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
    return '업데이트 설치(v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '검색과 일치하는 패키지가 없습니다.';

  @override
  String get adminPluginsCatalogEmpty => '사용 가능한 패키지가 없습니다.';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\"을(를) 설치하는 중...';
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
    return '$name 설정';
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
    return '저장소를 불러오지 못했습니다: $error';
  }

  @override
  String get adminReposRemoveTitle => '저장소 제거';

  @override
  String adminReposRemoveConfirm(String name) {
    return '\"$name\"을(를) 제거할까요?';
  }

  @override
  String get adminReposRemove => '제거';

  @override
  String adminReposSaveFailed(String error) {
    return '저장소를 저장하지 못했습니다: $error';
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
  String get adminBrandingSplashUpload => '이미지 업로드';

  @override
  String get adminBrandingSplashUploaded => '시작 화면을 업데이트했습니다';

  @override
  String get adminBrandingSplashUploadFailed => '시작 화면을 업로드하지 못했습니다';

  @override
  String get adminBrandingSplashDeleted => '시작 화면을 삭제했습니다';

  @override
  String get adminBrandingNoSplash => '사용자 지정 시작 화면 없음';

  @override
  String get adminPlaybackHwAccel => '하드웨어 가속';

  @override
  String get adminPlaybackHwAccelLabel => '하드웨어 가속';

  @override
  String get adminPlaybackEnableHwEncoding => '하드웨어 인코딩 활성화';

  @override
  String get adminPlaybackEnableHwDecoding => '다음에 대해 하드웨어 디코딩을 활성화합니다.';

  @override
  String get adminPlaybackQsvDevice => 'QSV 장치';

  @override
  String get adminPlaybackEnhancedNvdec => '향상된 NVDEC 디코더 사용';

  @override
  String get adminPlaybackPreferNativeDecoder => '시스템 기본 하드웨어 디코더 우선';

  @override
  String get adminPlaybackColorDepth => '하드웨어 디코딩 색심도';

  @override
  String get adminPlaybackColorDepth10Hevc => '10비트 HEVC 디코딩';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10비트 VP9 디코딩';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10비트 디코딩';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12비트 디코딩';

  @override
  String get adminPlaybackHwEncodingSection => '하드웨어 인코딩';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC 인코딩 허용';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 인코딩 허용';

  @override
  String get adminPlaybackIntelLowPowerH264 => 'Intel 저전력 H.264 인코더 사용';

  @override
  String get adminPlaybackIntelLowPowerHevc => 'Intel 저전력 HEVC 인코더 사용';

  @override
  String get adminPlaybackToneMapping => '톤 매핑';

  @override
  String get adminPlaybackEnableTonemapping => '톤 매핑 사용';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP 톤 매핑 사용';

  @override
  String get adminPlaybackEnableVtTonemapping => 'VideoToolbox 톤 매핑 사용';

  @override
  String get adminPlaybackTonemappingAlgorithm => '톤 매핑 알고리즘';

  @override
  String get adminPlaybackTonemappingMode => '톤 매핑 모드';

  @override
  String get adminPlaybackTonemappingRange => '톤 매핑 범위';

  @override
  String get adminPlaybackTonemappingDesat => '톤 매핑 채도 감소';

  @override
  String get adminPlaybackTonemappingPeak => '톤 매핑 피크';

  @override
  String get adminPlaybackTonemappingParam => '톤 매핑 매개변수';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'VPP 톤 매핑 밝기';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP 톤 매핑 대비';

  @override
  String get adminPlaybackPresetsQuality => '프리셋 및 품질';

  @override
  String get adminPlaybackEncoderPreset => '인코더 프리셋';

  @override
  String get adminPlaybackH264Crf => 'H.264 인코딩 CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265(HEVC) 인코딩 CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => '디인터레이스 방식';

  @override
  String get adminPlaybackDeinterlaceDoubleRate => '디인터레이스 시 프레임레이트 두 배로 설정';

  @override
  String get adminPlaybackAudioSection => '오디오';

  @override
  String get adminPlaybackEnableAudioVbr => '오디오 VBR 인코딩 사용';

  @override
  String get adminPlaybackDownmixBoost => '오디오 다운믹스 증폭';

  @override
  String get adminPlaybackDownmixAlgorithm => '스테레오 다운믹스 알고리즘';

  @override
  String get adminPlaybackMaxMuxingQueue => '최대 먹싱 큐 크기';

  @override
  String get adminPlaybackAutoOption => '자동';

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
  String get adminTaskStop => '정지';

  @override
  String get adminRunningTasks => '실행 중인 작업';

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
    return '매일 $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return '매주 $day $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return '$duration마다';
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
      other: '$count시간',
      one: '1시간',
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
    return '$days일 전';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours시간 전';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes분 전';
  }

  @override
  String get adminActivityNow => '지금';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes분';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours시간';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days일';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      '탐색 미리보기 썸네일을 위한 Trickplay 이미지 생성을 구성합니다.';

  @override
  String get adminNetworkingPublicHttpsPort => '공용 HTTPS 포트';

  @override
  String get adminNetworkingBaseUrl => '기본 URL';

  @override
  String get adminNetworkingBaseUrlHint => '예를 들어 /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => '공개 HTTP 포트';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS 필수';

  @override
  String get adminNetworkingRequireHttpsHint =>
      '모든 원격 요청을 HTTPS로 리디렉션합니다. 서버에 유효한 인증서가 없으면 적용되지 않습니다.';

  @override
  String get adminNetworkingCertPassword => '인증서 비밀번호';

  @override
  String get adminNetworkingIpSettings => 'IP 설정';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 사용';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 사용';

  @override
  String get adminNetworkingAutoDiscovery => '자동 포트 매핑 사용';

  @override
  String get adminNetworkingLocalSubnets => 'LAN 네트워크';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      '로컬 네트워크로 취급할 IP 주소 또는 CIDR 서브넷 목록입니다. 쉼표나 줄바꿈으로 구분하세요.';

  @override
  String get adminNetworkingPublishedUris => '공개 서버 URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      '서브넷이나 주소를 공개 URL에 매핑합니다. 예: all=https://example.com';

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
  String get adminPlaybackThrottleDelay => '제한 지연 시간(초)';

  @override
  String get adminPlaybackEnableSubtitleExtraction => '실시간 자막 추출 허용';

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
    return '콘텐츠 유형을 변경하지 못했습니다: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '느린 응답 임계값(ms)';

  @override
  String get adminGeneralEnableSlowResponse => '느린 응답 경고 사용';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect 사용';

  @override
  String get adminGeneralSectionServer => '서버';

  @override
  String get adminGeneralSectionMetadata => '메타데이터';

  @override
  String get adminGeneralSectionPaths => '경로';

  @override
  String get adminGeneralSectionPerformance => '성능';

  @override
  String get adminGeneralCachePath => '캐시 경로';

  @override
  String get adminGeneralMetadataPath => '메타데이터 경로';

  @override
  String get adminGeneralServerName => '서버 이름';

  @override
  String get adminGeneralDisplayLanguage => '선호 표시 언어';

  @override
  String get adminSettingsLoadFailed => '설정을 로드하지 못했습니다.';

  @override
  String get adminDiscover => '발견하다';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return '매핑을 업데이트하지 못했습니다: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return '시간 제한: $duration';
  }

  @override
  String get folders => '폴더';

  @override
  String get libraries => '라이브러리';

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
      other: '참가자 #명',
      one: '참가자 #명',
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
    return '항목 $index';
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
    return '$userName이(가) SyncPlay 그룹에 참여했습니다';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName이(가) SyncPlay 그룹에서 나갔습니다';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay 액세스가 거부되었습니다.';

  @override
  String get syncPlayAccessDeniedMessage =>
      '이 SyncPlay 그룹에 있는 하나 이상의 항목에 대한 액세스 권한이 없습니다. 그룹 소유자에게 라이브러리 권한을 확인하거나 다른 대기열을 선택하도록 요청하세요.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName에 재생을 동기화하는 중';
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
      other: '행 #개 발견',
      one: '행 #개 발견',
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
  String get offlineBannerTitle => '오프라인 상태입니다';

  @override
  String get offlineBannerSubtitle => '다운로드한 항목을 표시합니다';

  @override
  String get offlineBannerAction => '다운로드';

  @override
  String get serverUnreachableBannerTitle => '서버에 연결할 수 없습니다';

  @override
  String get serverUnreachableBannerSubtitle => '복구될 때까지 다운로드한 항목을 재생합니다';

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
    return '캐스트 제어에 실패했습니다: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind 제어';
  }

  @override
  String get castDeviceVolume => '장치 볼륨';

  @override
  String get castVolumeUnavailable => '없는';

  @override
  String castStopKind(String kind) {
    return '$kind 중지';
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
    return '$length자리 PIN을 입력하세요';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '$length자리 PIN을 입력하세요';
  }

  @override
  String get pinIncorrect => '잘못된 PIN';

  @override
  String get pinMismatch => 'PIN이 일치하지 않습니다.';

  @override
  String get pinForgot => 'PIN을 잊으셨나요?';

  @override
  String get pinClear => '지우기';

  @override
  String get pinBackspace => '역행 키이';

  @override
  String get quickConnectAuthorized => 'Quick Connect 요청이 승인되었습니다.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect 코드가 유효하지 않거나 만료되었습니다.';

  @override
  String get quickConnectNotSupported => '이 서버에서는 Quick Connect가 지원되지 않습니다.';

  @override
  String get quickConnectAuthorizeFailed => 'Quick Connect 코드를 승인하지 못했습니다.';

  @override
  String get quickConnectDisabled => '이 서버에서는 Quick Connect가 비활성화되어 있습니다.';

  @override
  String get quickConnectForbidden => '귀하의 계정은 이 Quick Connect 요청을 승인할 수 없습니다.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect 코드를 찾을 수 없습니다. 새 코드를 사용해 보세요.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect에 실패했습니다: $message';
  }

  @override
  String get quickConnectEnterCode => '코드 입력';

  @override
  String get quickConnectAuthorize => '승인하다';

  @override
  String remoteCommandFailed(String error) {
    return '명령을 실행하지 못했습니다: $error';
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
    return '캐스트를 시작하지 못했습니다: $error';
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
    return '$name 다운로드 중...';
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
  String get shuffleLibrary => '라이브러리';

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
  String get stillWatchingStop => '정지';

  @override
  String get stillWatchingContinue => '계속하다';

  @override
  String skipSegment(String segment) {
    return '$segment 건너뛰기';
  }

  @override
  String get liveTv => '라이브 TV';

  @override
  String get continueWatchingAndNextUp => '계속 시청하고 다음 편';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '$total개 중 $current개 다운로드 중 — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName 다운로드 중';
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
  String get playerTooltipPrevious => '이전';

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
  String get contextMenuHideFromContinueWatching => '이어서 보기에서 숨기기';

  @override
  String get contextMenuHideFromNextUp => '다음 볼 항목에서 숨기기';

  @override
  String get contextMenuAddToCollection => '컬렉션에 추가';

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
  String get settingsConnectionSection => '연결';

  @override
  String get settingsAllowSelfSignedCerts => '자체 서명 인증서 허용';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      '자체 서명 또는 사설 CA TLS 인증서를 사용하는 서버를 신뢰합니다. 직접 관리하는 서버에만 사용하세요. 이 설정을 켜면 모든 연결에서 인증서 검증이 해제됩니다.';

  @override
  String get settingsPrivacyAndSafetySection => '개인정보 보호 및 안전';

  @override
  String get settingsBlockedRatings => '차단된 등급';

  @override
  String get settingsGeneralStyle => '일반 스타일';

  @override
  String get settingsGeneralStyleSubtitle => '테마 악센트, 배경, 시청 표시기 및 테마 음악';

  @override
  String get settingsDetailsScreen => '상세 화면';

  @override
  String get settingsDetailsScreenSubtitle => '스타일, 배경 흐림, 탭 동작';

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
  String get settingsShowSeerrButtonInNavigation => '탐색 바에 Seerr 버튼을 표시합니다';

  @override
  String get settingsAlwaysExpandNavbarLabels => '상단 탐색 바에 텍스트 라벨을 항상 표시합니다';

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
  String get settingsSupportMoonfinSubtitle => '개발자에게 커피 한 잔 후원하기';

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
      other: '라이선스 고지 #건',
      one: '라이선스 고지 #건',
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
  String get settingsMediaSegmentCountdown => '미디어 구간 카운트다운';

  @override
  String get settingsProgressBar => '진행 바';

  @override
  String get settingsTimer => '타이머';

  @override
  String get settingsNone => '없음';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3(레거시)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv(레거시)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv(권장)';

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
    return '최근 공개된 $libraryName';
  }

  @override
  String get autoplayNextEpisode => '다음 에피소드 자동 재생';

  @override
  String get autoplayNextEpisodeSubtitle => '다음 에피소드가 있으면 자동으로 재생합니다.';

  @override
  String get skipSilenceTitle => '무음 구간 건너뛰기';

  @override
  String get skipSilenceSubtitle => '스트림이 지원하는 경우 무음 구간을 자동으로 건너뜁니다.';

  @override
  String get allowExternalAudioEffectsTitle => '외부 오디오 효과 허용';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      '이퀄라이저 및 음향 효과 앱(예: Wavelet)이 Media3 재생 세션에 연결하도록 허용합니다.';

  @override
  String get disableTunnelingTitle => '터널링 끄기';

  @override
  String get disableTunnelingSubtitle =>
      '터널링을 사용하지 않고 재생합니다. 터널링 시 오디오/영상이 끊기는 기기에서 유용합니다.';

  @override
  String get enableTunnelingTitle => '터널링 켜기';

  @override
  String get enableTunnelingSubtitle =>
      '고급 설정입니다. 오디오와 영상을 결합된 하드웨어 경로로 처리합니다. 일부 기기에서 오디오/영상 끊김이 발생하므로 기본적으로 꺼져 있습니다.';

  @override
  String get mapDolbyVisionP7Title => 'Dolby Vision 프로필 7을 HEVC로 매핑';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision을 지원하지 않는 기기에서 Dolby Vision 프로필 7 스트림을 HDR10 호환 HEVC로 재생합니다.';

  @override
  String get subtitlesUseEmbeddedStyles => '내장 자막 스타일 사용';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      '자막 트랙에 내장된 색상, 글꼴, 위치를 적용합니다. 끄면 사용자가 지정한 자막 스타일이 적용됩니다.';

  @override
  String get subtitlesUseEmbeddedFontSizes => '내장 자막 글자 크기 사용';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      '자막 트랙에 내장된 글자 크기 정보를 적용합니다. 끄면 사용자가 지정한 자막 크기가 적용됩니다.';

  @override
  String get showMediaDetailsOnLibraryPage => '미디어 정보 표시';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      '라이브러리 페이지 상단에 선택한 항목의 정보를 표시합니다.';

  @override
  String get hideBackdropsInLibraries => '탐색 중 배경 이미지를 숨길까요?';

  @override
  String get useDetailedSubHeadings => '상세 소제목 사용';

  @override
  String get useDetailedSubHeadingsDescription =>
      '라이브러리 페이지에 상세 또는 간단한 하위 행을 표시합니다.';

  @override
  String get savedThemesDeleteDialogTitle => '저장된 테마를 삭제할까요?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '이 기기의 캐시에서 \"$themeName\"을(를) 삭제할까요?';
  }

  @override
  String get themeStore => '테마 스토어';

  @override
  String get themeStoreSubtitle => '커뮤니티 테마를 둘러보고 저장하세요';

  @override
  String get themeStoreDescription => '테마를 저장하면 다른 저장된 테마처럼 사용할 수 있습니다.';

  @override
  String get themeStoreEmpty => '지금은 사용할 수 있는 테마가 없습니다.';

  @override
  String get themeStoreLoadFailed =>
      '테마 스토어를 불러올 수 없습니다. 연결 상태를 확인한 후 다시 시도하세요.';

  @override
  String get themeStoreSave => '저장';

  @override
  String get themeStoreSaveAndApply => '저장 후 적용';

  @override
  String get themeStoreSaved => '저장됨';

  @override
  String get themeStoreInvalidMessage => '이 테마를 불러올 수 없습니다.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\"을(를) 저장했습니다.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '이 기기에서 \"$themeName\"을(를) 삭제했습니다.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\"을(를) 삭제할 수 없습니다.';
  }

  @override
  String get savedThemesTitle => '저장된 테마';

  @override
  String get savedThemesDescription =>
      '현재 서버의 Moonfin 플러그인에서 다운로드한 테마입니다. 삭제해도 이 기기의 사본만 지워집니다.';

  @override
  String get savedThemesEmpty => '이 서버에 저장된 테마가 없습니다.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • 현재 사용 중';
  }

  @override
  String get savedThemesDeleteTooltip => '저장된 테마 삭제';

  @override
  String get savedThemesManageSubtitle => '이 기기에 다운로드한 플러그인 테마를 관리합니다';

  @override
  String get themeEditor => '테마 편집기';

  @override
  String get themeEditorSubtitle => '브라우저에서 Moonfin 테마 편집기를 엽니다';

  @override
  String get homeScreen => '홈 화면';

  @override
  String get bottomBar => '하단 바';

  @override
  String get homeRowsStyleClassic => '클래식';

  @override
  String get homeRowsStyleModern => '모던';

  @override
  String get homeRowsSection => '홈 행';

  @override
  String get homeRowDisplay => '홈 행 표시';

  @override
  String get homeRowSections => '홈 행 섹션';

  @override
  String get homeRowToggles => '홈 행 켜기/끄기';

  @override
  String get homeRowTogglesSubtitle => '라이브러리 기반 홈 행 카테고리를 켜거나 끕니다';

  @override
  String get homeRowTogglesDescription => '아래 항목을 켜면 홈 섹션에 해당 행이 표시됩니다.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      '클래식은 행별 이미지 유형과 정보 오버레이를 유지합니다. 모던은 세로형에서 가로형으로 이어지는 행을 사용합니다.';

  @override
  String get displayFavoritesRows => '즐겨찾기 행 표시';

  @override
  String get displayFavoritesRowsSubtitle => '홈 섹션에 즐겨찾는 영화, 시리즈 등의 행을 표시합니다.';

  @override
  String get favoritesRowSorting => '즐겨찾기 행 정렬';

  @override
  String get favoritesRowSortingDescription =>
      '즐겨찾기 행을 추가된 날짜, 공개일, 가나다순 등으로 정렬합니다.';

  @override
  String get displayCollectionsRows => '컬렉션 행 표시';

  @override
  String get displayCollectionsRowsSubtitle => '홈 섹션에 컬렉션 행을 표시합니다.';

  @override
  String get collectionsRowSorting => '컬렉션 행 정렬';

  @override
  String get collectionsRowSortingDescription =>
      '컬렉션 행을 추가된 날짜, 공개일, 가나다순 등으로 정렬합니다.';

  @override
  String get displayGenresRows => '장르 행 표시';

  @override
  String get displayGenresRowsSubtitle => '홈 섹션에 장르 행을 표시합니다.';

  @override
  String get genresRowSorting => '장르 행 정렬';

  @override
  String get genresRowSortingDescription =>
      '장르 행을 추가된 날짜, 공개일, 가나다순 등으로 정렬합니다.';

  @override
  String get genresRowItems => '장르 행 항목';

  @override
  String get genresRowItemsDescription => '장르 행에 영화, 시리즈 또는 둘 다를 표시합니다.';

  @override
  String get displayPlaylistsRows => '재생목록 행 표시';

  @override
  String get displayPlaylistsRowsSubtitle => '홈 섹션에 재생목록 행을 표시합니다.';

  @override
  String get playlistsRowSorting => '재생목록 행 정렬';

  @override
  String get playlistsRowSortingDescription =>
      '재생목록 행을 추가된 날짜, 공개일, 가나다순 등으로 정렬합니다.';

  @override
  String get displayAudioRows => '오디오 행 표시';

  @override
  String get displayAudioRowsSubtitle => '홈 섹션에 오디오 행을 표시합니다.';

  @override
  String get audioRowsSorting => '오디오 행 정렬';

  @override
  String get audioRowsSortingDescription =>
      '오디오 행을 추가된 날짜, 공개일, 가나다순 등으로 정렬합니다.';

  @override
  String get audioPlaylists => '오디오 재생목록';

  @override
  String get appearance => '모양';

  @override
  String get layout => '레이아웃';

  @override
  String get theme => '테마';

  @override
  String get keyboard => '키보드';

  @override
  String get navButtons => '버튼';

  @override
  String get rendering => '렌더링';

  @override
  String get mpvConfiguration => 'MPV 설정';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => '외부 플레이어 앱';

  @override
  String get externalPlayerAppDescription =>
      '외부 플레이어를 지정하면 길게 눌러 재생하는 옵션을 사용할 수 있습니다';

  @override
  String get externalPlayerAskEachTimeSubtitle => '재생을 시작할 때 앱 선택 창을 표시합니다.';

  @override
  String get loadingInstalledPlayers => '설치된 플레이어를 불러오는 중...';

  @override
  String get connection => '연결';

  @override
  String get audioTranscodeTarget => '오디오 트랜스코딩 대상';

  @override
  String get passthrough => '패스스루';

  @override
  String get supportedOnThisDevice => '이 기기에서 지원됨';

  @override
  String get notSupportedOnThisDevice => '이 기기에서 지원되지 않음';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X(DTS UHD) 패스스루';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X(DTS UHD)를 외부 디코더로 비트스트림 전송합니다.';

  @override
  String get settingsAudioTrueHdJocPassthrough => 'TrueHD Atmos(JOC) 패스스루';

  @override
  String get mediaPlayerBehavior => '미디어 플레이어 동작';

  @override
  String get playbackEnhancements => '재생 향상 기능';

  @override
  String get alwaysOn => '항상 켜짐.';

  @override
  String get replaceSkipOutroWithNextUpDisplay => '엔딩 건너뛰기 대신 다음 볼 항목 표시';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      '엔딩 건너뛰기 버튼 대신 다음 볼 항목 오버레이를 표시합니다.';

  @override
  String get playerRouting => '플레이어 라우팅';

  @override
  String get preferSoftwareDecoders => '소프트웨어 디코더 우선';

  @override
  String get preferSoftwareDecodersSubtitle =>
      '하드웨어 디코더보다 FFmpeg(오디오)와 libgav1(AV1)을 먼저 사용합니다. HDMI 오디오 패스스루에 문제가 생기면 끄세요.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle => 'Android TV에서 선택한 외부 앱으로 영상을 재생합니다.';

  @override
  String get automaticQueuing => '자동 대기열 추가';

  @override
  String get preferSdhSubtitles => 'SDH 자막 우선';

  @override
  String get preferSdhSubtitlesSubtitle => '자막을 자동으로 선택할 때 SDH/CC 트랙을 우선합니다.';

  @override
  String get webDiagnostics => '웹 진단';

  @override
  String get webDiagnosticsTitle => 'Moonfin 웹 진단';

  @override
  String get webDiagnosticsIntro =>
      '이 페이지에서 브라우저 연결 문제(CORS, 혼합 콘텐츠, 검색 설정)를 진단할 수 있습니다.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure => '혼합 콘텐츠 오류 감지됨';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure => 'CORS/프리플라이트 오류 감지됨';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin이 HTTPS 페이지에서 HTTP 서버 URL을 호출하려는 시도를 감지했습니다. 브라우저는 이 요청이 서버에 도달하기 전에 차단합니다.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin이 브라우저 수준의 요청 실패를 감지했습니다. 보통 미디어 서버에 CORS 또는 프리플라이트 헤더가 없을 때 발생합니다.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return '대상 URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return '상세 정보: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => '현재 실행 환경';

  @override
  String get webDiagnosticsOrigin => '출처';

  @override
  String get webDiagnosticsScheme => '스킴';

  @override
  String get webDiagnosticsPluginMode => '플러그인 모드';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC 검색';

  @override
  String get webDiagnosticsForcedServerUrl => '강제 지정 서버 URL';

  @override
  String get webDiagnosticsDefaultServerUrl => '기본 서버 URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => '검색 프록시 URL';

  @override
  String get notConfigured => '설정되지 않음';

  @override
  String get webDiagnosticsMixedContent => '혼합 콘텐츠';

  @override
  String get webDiagnosticsMixedContentDetected =>
      '이 페이지는 HTTPS로 로드되었지만 설정된 URL 중 하나 이상이 HTTP입니다. 브라우저는 HTTPS 페이지에서 HTTP API를 호출하지 못하게 차단합니다.';

  @override
  String get webDiagnosticsMixedContentFix =>
      '해결 방법: 미디어 서버나 프록시 엔드포인트를 HTTPS로 제공하거나, 신뢰할 수 있는 로컬 네트워크에서만 Moonfin을 HTTP로 사용하세요.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      '현재 실행 설정에서 뚜렷한 혼합 콘텐츠 문제가 감지되지 않았습니다.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS 점검 목록';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin에 브라우저 출처를 허용하세요.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers에 Authorization, X-Emby-Authorization, X-Emby-Token을 포함하세요.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• 스트리밍과 탐색을 위해 Content-Range와 Accept-Ranges를 노출하세요.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS 프리플라이트 요청에 204를 반환하세요.';

  @override
  String get webDiagnosticsHeaderSnippetTitle => '헤더 예시(nginx 형식)';

  @override
  String get note => '참고';

  @override
  String get webDiagnosticsNonWebNote =>
      '이 진단 페이지는 웹 빌드용입니다. 다른 플랫폼에서 보고 있다면 여기의 점검 항목이 적용되지 않을 수 있습니다.';

  @override
  String get backToServerSelect => '서버 선택으로 돌아가기';

  @override
  String get signOutAllUsers => '모든 사용자 로그아웃';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      '마이크 권한이 영구적으로 거부되었습니다. 시스템 설정에서 허용하세요.';

  @override
  String get voiceSearchPermissionRequired => '음성 검색을 사용하려면 마이크 권한이 필요합니다.';

  @override
  String get voiceSearchNoMatch => '잘 알아듣지 못했습니다. 다시 시도하세요.';

  @override
  String get voiceSearchNoSpeechDetected => '음성이 감지되지 않았습니다.';

  @override
  String get voiceSearchMicrophoneError => '마이크 오류입니다.';

  @override
  String get voiceSearchNeedsInternet => '음성 검색에는 인터넷 연결이 필요합니다.';

  @override
  String get voiceSearchServiceBusy => '음성 서비스가 사용 중입니다. 다시 시도하세요.';

  @override
  String get microphonePermissionPermanentlyDenied => '마이크 권한이 영구적으로 거부되었습니다.';

  @override
  String get microphonePermissionDenied => '마이크 권한이 거부되었습니다.';

  @override
  String get speechRecognitionUnavailable => '이 기기에서는 음성 인식을 사용할 수 없습니다.';

  @override
  String get openIosRoutePicker => 'iOS 출력 선택기 열기';

  @override
  String get airPlayRoutePickerUnavailable =>
      '이 기기에서는 AirPlay 출력 선택기를 사용할 수 없습니다.';

  @override
  String get videos => '동영상';

  @override
  String get programs => '프로그램';

  @override
  String get songs => '노래';

  @override
  String get photoAlbums => '사진 앨범';

  @override
  String get photos => '사진';

  @override
  String get people => '인물';

  @override
  String get recentlyReleasedEpisodes => '최근 공개된 에피소드';

  @override
  String get watchAgain => '다시 보기';

  @override
  String get guestAppearances => '특별 출연';

  @override
  String get appearancesSeerr => '출연작(Seerr)';

  @override
  String get crewContributionsSeerr => '제작 참여작(Seerr)';

  @override
  String get watchWithGroup => '그룹과 함께 보기';

  @override
  String get errors => '오류';

  @override
  String get warnings => '경고';

  @override
  String get disk => '디스크';

  @override
  String get openInBrowser => '브라우저에서 열기';

  @override
  String get embeddedBrowserNotAvailable => '이 플랫폼에서는 내장 브라우저를 사용할 수 없습니다.';

  @override
  String get adminRestartServerConfirmation => '서버를 재시작할까요?';

  @override
  String get adminShutdownServerConfirmation =>
      '서버를 종료할까요? 다시 시작하려면 직접 실행해야 합니다.';

  @override
  String get internal => '내부';

  @override
  String get idle => '대기 중';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => '사용자를 찾을 수 없습니다';

  @override
  String get adminNoUsersMatchSearch => '검색 조건과 일치하는 사용자가 없습니다';

  @override
  String get adminNoDevicesFound => '기기를 찾을 수 없습니다';

  @override
  String get adminNoDevicesMatchCurrentFilters => '현재 필터와 일치하는 기기가 없습니다';

  @override
  String get passwordSet => '비밀번호 설정됨';

  @override
  String get noPasswordConfigured => '설정된 비밀번호 없음';

  @override
  String get remoteAccess => '원격 접속';

  @override
  String get localOnly => '로컬 전용';

  @override
  String get adminMediaAnalyticsLoadFailed => '미디어 분석 정보를 불러오지 못했습니다';

  @override
  String get analyticsCombinedAcrossLibraries => '모든 미디어 라이브러리를 합산한 분석입니다.';

  @override
  String get analyticsTopArtists => '인기 아티스트';

  @override
  String get analyticsTopAuthors => '인기 저자';

  @override
  String get analyticsTopContributors => '주요 참여자';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '라이브러리 $count개',
      one: '라이브러리 1개',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      '아직 이 선택 항목에 대한 색인된 미디어 집계가 없습니다.';

  @override
  String get analyticsLibraryDetails => '라이브러리 상세 정보';

  @override
  String get analyticsLibraryBreakdown => '라이브러리별 분석';

  @override
  String get analyticsNoLibrariesAvailable => '사용할 수 있는 라이브러리가 없습니다.';

  @override
  String get adminServerAdministrationTitle => '서버 관리';

  @override
  String get adminServerPathData => '데이터';

  @override
  String get adminServerPathImageCache => '이미지 캐시';

  @override
  String get adminServerPathCache => '캐시';

  @override
  String get adminServerPathLogs => '로그';

  @override
  String get adminServerPathMetadata => '메타데이터';

  @override
  String get adminServerPathTranscode => '트랜스코딩';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => '이 서버에서 반환한 서버 경로가 없습니다.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% 사용 중';
  }

  @override
  String get userActivity => '사용자 활동';

  @override
  String get systemEvents => '시스템 이벤트';

  @override
  String get needsAttention => '확인 필요';

  @override
  String get adminDrawerSectionServer => '서버';

  @override
  String get adminDrawerSectionPlayback => '재생';

  @override
  String get adminDrawerSectionDevices => '기기';

  @override
  String get adminDrawerSectionAdvanced => '고급';

  @override
  String get adminDrawerSectionPlugins => '플러그인';

  @override
  String get adminDrawerSectionLiveTv => '실시간 TV';

  @override
  String get homeVideos => '홈 비디오';

  @override
  String get mixedContent => '혼합 콘텐츠';

  @override
  String get homeVideosAndPhotos => '홈 비디오 및 사진';

  @override
  String get mixedMoviesAndShows => '영화 및 TV 프로그램 혼합';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => '녹화된 항목이 없습니다';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension 압축 파일에서 이미지 페이지를 찾을 수 없습니다.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return '내장 렌더러 오류($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB 렌더러 오류($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return '리더에서 사용할 로컬 파일이 없습니다: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri에서 도서 데이터를 여는 중 HTTP $status 오류가 발생했습니다';
  }

  @override
  String get noReadableBookEndpointAvailable => '읽을 수 있는 도서 엔드포인트가 없습니다';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return '지원하지 않는 만화 압축 형식: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      '이 플랫폼에서는 CBR 압축 해제 플러그인을 사용할 수 없습니다.';

  @override
  String get failedToExtractCbrArchive => '.cbr 압축 파일을 풀지 못했습니다.';

  @override
  String get cb7ExtractionUnavailable => '이 플랫폼에서는 CB7 압축 해제를 사용할 수 없습니다.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      '이 플랫폼에서는 CB7 압축 해제 플러그인을 사용할 수 없습니다.';

  @override
  String get closeGenrePanel => '장르 패널 닫기';

  @override
  String get loadingShuffle => '셔플을 불러오는 중...';

  @override
  String get libraryShuffleLabel => '라이브러리 셔플';

  @override
  String get randomShuffleLabel => '랜덤 셔플';

  @override
  String get genresShuffleLabel => '장르 셔플';

  @override
  String get autoHdrSwitching => 'HDR 자동 전환';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR 영상을 재생할 때 HDR을 자동으로 켜고, 종료하면 원래 디스플레이 모드로 되돌립니다.';

  @override
  String get whenFullscreen => '전체 화면일 때';

  @override
  String get changeArtwork => '아트워크 변경';

  @override
  String get missing => '없음';

  @override
  String get transcodingLimits => '트랜스코딩 제한';

  @override
  String get clearAllArtworkButton => '모든 아트워크를 지울까요?';

  @override
  String get clearAllArtworkWarning => '다운로드한 아트워크를 모두 지울까요?';

  @override
  String get confirmClear => '지우기 확인';

  @override
  String confirmClearMessage(String itemType) {
    return '이 $itemType을(를) 지울까요?';
  }

  @override
  String get uploadButton => '업로드할까요?';

  @override
  String get resolutionLabel => '해상도: ';

  @override
  String get onlyShowInterfaceLanguage => '인터페이스 언어의 아트워크만 표시';

  @override
  String get confirmClearAll => '모두 지우기 확인';

  @override
  String get imageUploadSuccess => '이미지를 업로드했습니다!';

  @override
  String imageUploadFailed(String error) {
    return '이미지를 업로드하지 못했습니다: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return '이미지를 설정하지 못했습니다: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return '이미지를 삭제하지 못했습니다: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return '모든 아트워크를 지우지 못했습니다: $error';
  }

  @override
  String get yes => '예';

  @override
  String get posterCategory => '포스터';

  @override
  String get backdropsCategory => '배경 이미지';

  @override
  String get bannerCategory => '배너';

  @override
  String get logoCategory => '로고';

  @override
  String get thumbnailCategory => '썸네일';

  @override
  String get artCategory => '아트';

  @override
  String get discArtCategory => '디스크 아트';

  @override
  String get screenshotCategory => '스크린샷';

  @override
  String get boxCoverCategory => '패키지 앞면';

  @override
  String get boxRearCoverCategory => '패키지 뒷면';

  @override
  String get menuArtCategory => '메뉴 아트';

  @override
  String get confirmItemPoster => '포스터';

  @override
  String get confirmItemBackdrop => '배경 이미지';

  @override
  String get confirmItemBanner => '배너';

  @override
  String get confirmItemLogo => '로고';

  @override
  String get confirmItemThumbnail => '썸네일';

  @override
  String get confirmItemArt => '아트';

  @override
  String get confirmItemDiscArt => '디스크 아트';

  @override
  String get confirmItemScreenshot => '스크린샷';

  @override
  String get confirmItemBoxCover => '패키지 앞면';

  @override
  String get confirmItemBoxRearCover => '패키지 뒷면';

  @override
  String get confirmItemMenuArt => '메뉴 아트';

  @override
  String get resolutionAll => '전체';

  @override
  String get resolutionHigh => '높음(1080p 이상)';

  @override
  String get resolutionMedium => '보통(720p)';

  @override
  String get resolutionLow => '낮음(720p 미만)';

  @override
  String get sources => '제공처';

  @override
  String get audiobookChapters => '챕터';

  @override
  String get audiobookBookmarks => '북마크';

  @override
  String get audiobookNotes => '메모';

  @override
  String get audiobookQueue => '재생 대기열';

  @override
  String get audiobookTimeline => '타임라인';

  @override
  String get audiobookTimelineEmpty => '타임라인이 비어 있습니다';

  @override
  String get audiobookFocusedTimeline => '집중 타임라인';

  @override
  String get audiobookExportBookmarks => '북마크 내보내기';

  @override
  String get audiobookExportNotes => '메모 내보내기';

  @override
  String get audiobookExportAll => '전체 내보내기';

  @override
  String audiobookExportSuccess(String path) {
    return '$path에 내보냈습니다';
  }

  @override
  String audiobookExportFailed(String error) {
    return '내보내기에 실패했습니다: $error';
  }

  @override
  String get audiobookLyrics => '가사';

  @override
  String get audiobookAddBookmark => '북마크 추가';

  @override
  String get audiobookAddNote => '메모 추가';

  @override
  String get audiobookEditNote => '메모 편집';

  @override
  String get audiobookNoteHint => '이 지점에 대한 메모를 작성하세요';

  @override
  String get audiobookSleepTimer => '취침 타이머';

  @override
  String get audiobookSleepOff => '끔';

  @override
  String get audiobookSleepEndOfChapter => '챕터 끝까지';

  @override
  String get audiobookSleepCustom => '직접 설정';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining 남음';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분',
      one: '1분',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => '재생 속도';

  @override
  String get audiobookRemainingTime => '남은 시간';

  @override
  String get audiobookElapsedTime => '재생 시간';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$seconds초 뒤로';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$seconds초 앞으로';
  }

  @override
  String get audiobookPreviousChapter => '이전 챕터';

  @override
  String get audiobookNextChapter => '다음 챕터';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '챕터 $current/$total';
  }

  @override
  String get audiobookNoChapters => '챕터 없음';

  @override
  String get audiobookNoBookmarks => '북마크가 없습니다';

  @override
  String get audiobookNoNotes => '메모가 없습니다';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position에 북마크를 추가했습니다';
  }

  @override
  String get audiobookSpeedReset => '1.0x로 초기화';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => '저장';

  @override
  String get audiobookCancel => '취소';

  @override
  String get audiobookDelete => '삭제';

  @override
  String get subtitlePreferences => '자막 환경설정';

  @override
  String get subtitlePreferencesDescription =>
      '자막 모드, 기본 언어, 모양, 렌더링 옵션을 변경합니다.';

  @override
  String get subtitleRendering => '자막 렌더링';

  @override
  String get displayOptions => '표시 옵션';

  @override
  String get releaseDateAscending => '공개일순(오름차순)';

  @override
  String get releaseDateDescending => '공개일순(내림차순)';

  @override
  String get groupContributions => '참여작 묶기';

  @override
  String get groupMultipleRoles => '여러 역할 묶기';

  @override
  String get libraryWriteAccessWarningTitle => '라이브러리 쓰기 권한 경고';

  @override
  String get libraryWriteAccessHowToFix => '해결 방법:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. 서버의 미디어 라이브러리 폴더에 대해 Jellyfin 서비스 사용자(예: jellyfin 또는 Docker PUID/PGID)에게 쓰기 권한을 부여하세요.\n\n2. 또는 Jellyfin 대시보드 -> 라이브러리에서 이 라이브러리를 편집해 \'아트워크를 미디어 폴더에 저장\'을 끄면 아트워크가 Jellyfin 내부 데이터베이스에 저장됩니다.';

  @override
  String get dismiss => '닫기';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '\'$libraryName\' 라이브러리가 아트워크를 미디어 폴더에 직접 저장하도록 설정되어 있습니다(\'아트워크를 미디어 폴더에 저장\'이 켜져 있음). 하지만 Jellyfin이 쓰기 권한을 확인한 결과 다음 디렉터리에 파일을 쓸 권한이 없습니다:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin이 아트워크를 업데이트하지 못한 것으로 보입니다. 이 라이브러리는 아트워크를 미디어 폴더에 직접 저장하도록 설정되어 있습니다(\'아트워크를 미디어 폴더에 저장\'이 켜져 있음). 이 오류는 보통 Jellyfin 서버 프로세스가 미디어 디렉터리에 파일을 쓸 권한이 없을 때 발생합니다.';

  @override
  String get externalLists => '외부 목록';

  @override
  String get replay => '다시 재생';

  @override
  String get fileInformation => '파일 정보';

  @override
  String fileSizeFormat(Object size, Object format) {
    return '크기: $size  •  형식: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return '오디오 트랙 모두 보기($count개)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return '자막 트랙 모두 보기($count개)';
  }

  @override
  String get checkingDirectPlay => '다이렉트 재생 가능 여부 확인 중...';

  @override
  String get directPlayCapabilityLabel => '다이렉트 재생 가능 여부: ';

  @override
  String get forced => '강제 자막';

  @override
  String get transcodeContainerNotSupported => '플레이어가 지원하지 않는 컨테이너 형식입니다.';

  @override
  String get transcodeVideoCodecNotSupported => '지원하지 않는 비디오 코덱입니다.';

  @override
  String get transcodeAudioCodecNotSupported => '지원하지 않는 오디오 코덱입니다.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      '지원하지 않는 자막 형식입니다(영상에 입혀야 합니다).';

  @override
  String get transcodeAudioProfileNotSupported => '지원하지 않는 오디오 프로필입니다.';

  @override
  String get transcodeVideoProfileNotSupported => '지원하지 않는 비디오 프로필입니다.';

  @override
  String get transcodeVideoLevelNotSupported => '지원하지 않는 비디오 레벨입니다.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      '이 기기에서 지원하지 않는 영상 해상도입니다.';

  @override
  String get transcodeVideoBitDepthNotSupported => '지원하지 않는 비디오 비트 심도입니다.';

  @override
  String get transcodeVideoFramerateNotSupported => '지원하지 않는 영상 프레임레이트입니다.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      '파일 비트레이트가 플레이어의 스트리밍 한도를 초과합니다.';

  @override
  String get transcodeVideoBitrateExceedsLimit => '비디오 비트레이트가 스트리밍 한도를 초과합니다.';

  @override
  String get transcodeAudioBitrateExceedsLimit => '오디오 비트레이트가 스트리밍 한도를 초과합니다.';

  @override
  String get transcodeAudioChannelsNotSupported => '지원하지 않는 오디오 채널 수입니다.';

  @override
  String get sortAlphabetical => '가나다순';

  @override
  String get sortReleaseAscending => '공개순(오름차순)';

  @override
  String get sortReleaseDescending => '공개순(내림차순)';

  @override
  String get sortCustomDragDrop => '사용자 지정(끌어서 놓기)';

  @override
  String get playlistSortOptions => '재생목록 정렬 옵션';

  @override
  String get resetSort => '정렬 초기화';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode 다시 보기';
  }

  @override
  String get rewatchPlaylist => '재생목록 다시 보기';

  @override
  String get noSubtitlesFound => '자막을 찾을 수 없습니다.';

  @override
  String get adminControls => '관리자 제어';

  @override
  String get impellerRendering => '렌더링 엔진(Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller는 더 부드러운 애니메이션과 적은 끊김을 제공하는 Flutter의 최신 GPU 렌더러입니다. 일부 TV 박스나 오래된 GPU에서는 화면 깨짐이나 검은 영상이 나타날 수 있으며, 이 경우 끄세요. 자동은 기기에 가장 알맞은 기본값을 선택합니다. 적용하려면 Moonfin을 다시 시작하세요.';

  @override
  String get impellerAuto => '자동';

  @override
  String get impellerOn => '켬';

  @override
  String get impellerOff => '끔';

  @override
  String get impellerRestartTitle => '재시작 필요';

  @override
  String get impellerRestartMessage =>
      '렌더링 엔진을 변경하려면 Moonfin을 다시 시작해야 합니다. 지금 앱을 종료한 후 다시 실행하면 적용됩니다.';

  @override
  String get impellerCloseNow => '지금 앱 종료';

  @override
  String get adminRefreshLibrary => '라이브러리 새로고침';

  @override
  String get adminRefreshAllLibraries => '모든 라이브러리 새로고침';

  @override
  String get adminRepoSortDateOldest => '추가된 날짜(오래된순)';

  @override
  String get adminRepoSortDateNewest => '추가된 날짜(최신순)';

  @override
  String get adminRepoSortNameAsc => '가나다순(A~Z)';

  @override
  String get adminRepoSortNameDesc => '가나다 역순(Z~A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return '서버 분석 정보를 불러오는 중... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => '원본과 동일';

  @override
  String get imdbTop250Movies => 'IMDb 상위 250개 영화';

  @override
  String get imdbTop250TvShows => 'IMDb 상위 250개 TV 프로그램';

  @override
  String get imdbMostPopularMovies => 'IMDb 인기 영화';

  @override
  String get imdbMostPopularTvShows => 'IMDb 인기 TV 프로그램';

  @override
  String get imdbLowestRatedMovies => 'IMDb 최저 평점 영화';

  @override
  String get imdbTopEnglishMovies => 'IMDb 영어 영화 평점 순위';
}
