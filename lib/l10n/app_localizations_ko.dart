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
  String get animeMarkerFiller => '필러';

  @override
  String get animeMarkerMixed => '혼합';

  @override
  String get animeMarkerAnimeCanon => '애니 정사';

  @override
  String get animeMarkerMangaCanon => '만화 정사';

  @override
  String get animeMarkerSubbed => '자막';

  @override
  String get animeMarkerDubbed => '더빙';

  @override
  String get animeMarkerSubbedAndDubbed => '자막/더빙';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => '대기 중';

  @override
  String get animeMarkerRecap => '총집편';

  @override
  String get interfaceLanguage => '인터페이스 언어';

  @override
  String get systemLanguageDefault => '시스템 기본값';

  @override
  String get signIn => '로그인';

  @override
  String get signingIn => 'Signing in...';

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
  String get quickConnectScanHint =>
      'Or scan this with a phone that\'s signed in to your server';

  @override
  String get quickConnectTapOrScanHint =>
      'Tap to approve in your browser, or scan this with another device';

  @override
  String get timesUpTitle => 'Time\'s up';

  @override
  String get timesUpMessage => 'This account isn\'t available right now.';

  @override
  String timesUpResumesToday(String time) {
    return 'You can use it again today at $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'You can use it again tomorrow at $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'You can use it again on $day at $time.';
  }

  @override
  String get waitingForAuthorization => '승인을 기다리는 중...';

  @override
  String get back => '뒤로';

  @override
  String get serverUnavailable => '서버를 사용할 수 없습니다';

  @override
  String get loginFailed => '로그인 실패';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
  String get signedInOnThisDevice => 'Signed in on this device';

  @override
  String get pinRequired => 'PIN required';

  @override
  String get passwordRequired => 'Password required';

  @override
  String continueAsUser(String name) {
    return 'Continue as $name';
  }

  @override
  String switchToUser(String name) {
    return 'Switch to $name';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return 'Signed in as $user on $server';
  }

  @override
  String get accountActive => 'Active';

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
  String get connect => '연결';

  @override
  String get secureStorageUnavailable => '보안 저장소를 사용할 수 없음';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin이 시스템 키링에 액세스할 수 없습니다. 로그인은 계속할 수 있지만 키링이 잠금 해제될 때까지 보안 토큰 저장을 사용하지 못할 수 있습니다.';

  @override
  String get ok => '확인';

  @override
  String get settingsAppearanceTheme => '앱 테마';

  @override
  String get detailScreenStyle => '상세 화면 스타일';

  @override
  String get detailScreenStyleSubtitle =>
      '클래식은 기존의 가운데 정렬 Moonfin 레이아웃입니다. 모던은 반응형 시네마틱 레이아웃입니다. Spotlight는 대표 이미지를 앞세우고 팝업 콘텐츠 카드를 사용하는 레이아웃입니다. Nouveau는 섹션이 페이지 아래로 차례로 쌓이는 전체 화면 레이아웃입니다. Minimalist는 아트워크, 재생 버튼 하나, 에피소드로만 구성됩니다.';

  @override
  String get detailScreenStyleMoonfin => '클래식';

  @override
  String get detailScreenStyleModern => '모던';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => '추가 작업';

  @override
  String get spotlightCastCrewStudios => '출연진, 제작진 및 스튜디오';

  @override
  String get spotlightChaptersExtras => '챕터 및 부가 영상';

  @override
  String get spotlightFileDetails => '파일 정보';

  @override
  String get spotlightSimilarRecommendations => '비슷한 작품 및 추천';

  @override
  String get spotlightSeasonsEpisodes => '시즌 및 에피소드';

  @override
  String get spotlightMoreEpisodes => '다른 에피소드';

  @override
  String get spotlightFilmography => '필모그래피';

  @override
  String get spotlightCollectionsCard => '컬렉션';

  @override
  String get spotlightPlaylistOrder => '재생 순서';

  @override
  String get spotlightMoviesAndShows => '영화 및 TV 프로그램';

  @override
  String get spotlightSimilarSeerr => '비슷한 작품(Seerr)';

  @override
  String get spotlightRecommendationsSeerr => '추천(Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count명',
      one: '1명',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '정보 $count개',
      one: '정보 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '태그 $count개',
      one: '태그 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '스튜디오 $count개',
      one: '스튜디오 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '챕터 $count개',
      one: '챕터 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '부가 영상 $count개',
      one: '부가 영상 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '시즌 $count개',
      one: '시즌 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '에피소드 $count개',
      one: '에피소드 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '영화 $count편',
      one: '영화 1편',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'TV 프로그램 $count개',
      one: 'TV 프로그램 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '트랙 $count개',
      one: '트랙 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '항목 $count개',
      one: '항목 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '앨범 $count개',
      one: '앨범 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '컬렉션 $count개',
      one: '컬렉션 1개',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '작품 $count개',
      one: '작품 1개',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalist';

  @override
  String get expandedTabs => '탭 자동 펼치기';

  @override
  String get expandedTabsSubtitle =>
      '탭을 넘길 때 탭 내용을 자동으로 표시합니다. 끄면 각 탭을 직접 열고 닫습니다.';

  @override
  String get showTechnicalDetails => '기술 정보 표시';

  @override
  String get showTechnicalDetailsSubtitle => '배너 요약에 코덱, 해상도, 스트림 정보를 표시합니다';

  @override
  String get recommendationSystem => '추천 시스템';

  @override
  String get recommendationSystemSubtitle =>
      '로컬 라이브러리 기반 Moonfin 추천 알고리즘, Jellyfin 추천 서버 엔진 또는 온라인 TMDb 유사도 지표를 사용합니다. 참고: 온라인 추천에는 Seerr 연동이 필요합니다.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin 추천';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin 추천';

  @override
  String get recommendationSystemTmdb => 'TMDb 유사도';

  @override
  String get recommendationsApplyParentalRatingCap => '추천에 시청 등급 제한 적용';

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
  String get interfaceLayout => '인터페이스 레이아웃';

  @override
  String get interfaceLayoutSubtitle =>
      '이 기기에서 잘못 읽히는 경우 감지된 레이아웃을 재정의합니다. 변경 사항을 적용하려면 Moonfin을 다시 시작하세요.';

  @override
  String get interfaceLayoutAutomatic => '자동';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => '데스크톱';

  @override
  String get interfaceLayoutPhone => '스마트폰';

  @override
  String get glassQuality => '글래스 품질';

  @override
  String get oledMode => 'OLED 모드';

  @override
  String get oledModeSubtitle =>
      '더욱 깊은 블랙과 생생한 아트워크를 제공합니다. OLED 디스플레이에 최적화되어 있습니다.';

  @override
  String get oledModeSubtle => '은은하게';

  @override
  String get oledModeVivid => '선명하게';

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
  String get performanceMode => '성능';

  @override
  String get performanceModeSubtitle =>
      '자동은 이 기기의 성능을 측정해 메모리가 부족한 기기에서는 사용량을 줄입니다. 메모리에 보관하는 이미지를 줄이고 예고편을 정지 이미지로 표시합니다. 다음 실행부터 완전히 적용됩니다.';

  @override
  String get performanceModeAuto => '자동';

  @override
  String get performanceModeStandard => '표준';

  @override
  String get performanceModeReduced => '낮음';

  @override
  String get rendererMode => '렌더러';

  @override
  String get rendererModeSubtitle =>
      '자동은 그래픽 성능이 충분한 기기에서는 Impeller를, 그 외에는 Skia를 사용합니다. 애니메이션이나 영상이 이상하게 보이면 Skia를 선택하세요. 다음 실행부터 적용됩니다.';

  @override
  String get rendererModeAuto => '자동';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack => '이 기기의 성능이 \'낮음\'으로 설정되어 있어 꺼져 있습니다';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '완전한 사용자 지정 테마를 적용하고 Apple 또는 Material 스타일의 사용자 인터페이스로 전환합니다.';

  @override
  String get customThemeTitle => '사용자 지정 테마';

  @override
  String get customThemeSubtitle =>
      '사용자 지정 테마는 Moonfin 전반의 시각 요소를 바꿉니다. 취향에 맞는 테마를 선택하세요.';

  @override
  String get keyboardStyle => 'Keyboard Style';

  @override
  String get keyboardStyleDescription =>
      'Native uses your TV\'s own keyboard. Classic is the original Moonfin keyboard. Glass is a frosted panel with larger keys. Docked fills the bottom of the screen and shows what you type above the keys.';

  @override
  String get keyboardStyleNative => 'Native';

  @override
  String get keyboardStyleClassic => 'Classic';

  @override
  String get keyboardStyleGlass => 'Glass';

  @override
  String get keyboardStyleDocked => 'Docked';

  @override
  String get keyboardSpace => 'space';

  @override
  String get keyboardHoldForAccents => 'hold for accents';

  @override
  String get keyboardClose => 'close';

  @override
  String get controller => '컨트롤러';

  @override
  String get gamepadNavigation => '게임패드 탐색';

  @override
  String get gamepadNavigationDescription => '연결된 게임 컨트롤러로 포커스를 이동하고 항목을 선택합니다';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '깔끔한 기본 Moonfin 스타일입니다.';

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
  String get noLinkedServers => '이 Emby Connect 계정에 연결된 서버가 없습니다';

  @override
  String get invalidEmbyConnectCredentials => '잘못된 Emby Connect 자격 증명';

  @override
  String get invalidEmbyConnectLogin => '잘못된 Emby Connect 사용자 이름 또는 비밀번호';

  @override
  String get embyConnectExchangeNotSupported =>
      '서버가 Emby Connect 교환을 지원하지 않습니다';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect 또는 선택한 서버에 접속하는 중 네트워크 오류가 발생했습니다';

  @override
  String get signInWithPlex => 'Sign in with Plex';

  @override
  String get plexLinkInstructions =>
      'Go to plex.tv/link on any device and enter this code';

  @override
  String get plexOpenLink => 'Open plex.tv/link';

  @override
  String get plexWaitingForApproval => 'Waiting for you to approve the code...';

  @override
  String get plexSignInWithPassword => 'Sign in with a password';

  @override
  String get plexVerificationCode => 'Verification code';

  @override
  String get plexNoServers => 'No Plex servers found on this account';

  @override
  String get loadingLinkedServers => '연결된 서버를 로드하는 중...';

  @override
  String get connectingToServerEllipsis => '서버에 연결하는 중...';

  @override
  String get noReachableAddress => '연결 가능한 주소가 제공되지 않았습니다';

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
  String get exit => '종료';

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
  String get gameOrientation => '게임 화면 방향';

  @override
  String get gameOrientationSubtitle => '게임을 플레이할 때의 화면 방향';

  @override
  String get landscape => '가로';

  @override
  String get portrait => '세로';

  @override
  String get gameEmulatorSettings => '에뮬레이터 설정';

  @override
  String get gameNoCoreOptions => '이 코어에는 조정할 수 있는 옵션이 없습니다.';

  @override
  String get gameHoldToOpenMenu => '길게 눌러 메뉴 열기';

  @override
  String get gameKeepPlaying => '계속 플레이';

  @override
  String get gameSaveAndExit => '저장 후 종료';

  @override
  String get gameExitGame => '게임 종료';

  @override
  String get gameSavingBeforeExit => '저장 중…';

  @override
  String get gameSaveFailedStillPlaying => '상태를 저장하지 못했습니다. 게임을 계속합니다.';

  @override
  String get gamePlaybackUnsupported => '이 기기에서는 아직 게임 플레이를 지원하지 않습니다.';

  @override
  String get noHomeRowsLoaded => '홈 행을 로드할 수 없습니다';

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
  String get collectionPlaceholder => '컬렉션 항목이 여기에 표시됩니다';

  @override
  String get browseByLetter => '글자별로 찾아보기';

  @override
  String get alphabeticalBrowsePlaceholder => '여기에 알파벳순 검색이 표시됩니다';

  @override
  String get suggestions => '제안';

  @override
  String get suggestionsPlaceholder => '추천 항목이 여기에 표시됩니다';

  @override
  String get failedToLoadLibraries => '라이브러리를 로드하지 못했습니다';

  @override
  String get noLibrariesFound => '라이브러리를 찾을 수 없습니다';

  @override
  String get library => '라이브러리';

  @override
  String get displaySettings => '디스플레이 설정';

  @override
  String get allGenres => '모든 장르';

  @override
  String get noGenresFound => '장르를 찾을 수 없습니다';

  @override
  String failedToLoadFolderError(String error) {
    return '폴더를 불러오지 못했습니다: $error';
  }

  @override
  String get thisFolderIsEmpty => '이 폴더는 비어 있습니다';

  @override
  String itemCountLabel(int count) {
    return '$count개 항목';
  }

  @override
  String get failedToLoadFavorites => '즐겨찾기를 로드하지 못했습니다';

  @override
  String get retry => '다시 시도';

  @override
  String get noFavoritesYet => '아직 즐겨찾기가 없습니다';

  @override
  String get favorites => '즐겨찾기';

  @override
  String totalCountItems(int count) {
    return '$count개 항목';
  }

  @override
  String get continuing => '방영 중';

  @override
  String get ended => '종료됨';

  @override
  String get sortAndFilter => '정렬 및 필터';

  @override
  String get type => '유형';

  @override
  String get sortBy => '정렬 기준';

  @override
  String get display => '표시';

  @override
  String get imageType => '이미지 유형';

  @override
  String get posterSize => '포스터 크기';

  @override
  String get small => '작게';

  @override
  String get medium => '보통';

  @override
  String get large => '크게';

  @override
  String get extraLarge => '매우 크게';

  @override
  String get uiScaleGrandparents => '아주 크게';

  @override
  String get uiScaleGreatGrandparents => '가장 크게';

  @override
  String get scrollDirection => '스크롤 방향';

  @override
  String get scrollDirectionVertical => '세로';

  @override
  String get scrollDirectionHorizontal => '가로';

  @override
  String libraryGenresTitle(String name) {
    return '$name — 장르';
  }

  @override
  String get views => '보기';

  @override
  String get albums => '앨범';

  @override
  String get albumArtists => '앨범 아티스트';

  @override
  String get artists => '아티스트';

  @override
  String get bookmarks => '북마크';

  @override
  String get noSavedBookmarks => '아직 이 작품에 저장된 북마크가 없습니다.';

  @override
  String get openBook => '도서 열기';

  @override
  String get chapter => '챕터';

  @override
  String get page => '페이지';

  @override
  String get bookmark => '북마크';

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
  String get discoverySubjects => '둘러보기 주제';

  @override
  String get apply => '적용';

  @override
  String get openLink => '링크 열기';

  @override
  String get scanWithYourPhone => '휴대폰으로 스캔하세요';

  @override
  String get audiobookGenres => '오디오북 장르';

  @override
  String get scrollLeft => '왼쪽으로 스크롤';

  @override
  String get scrollRight => '오른쪽으로 스크롤';

  @override
  String get scrollToTop => '맨 위로 스크롤';

  @override
  String get couldNotLoadGenre => '지금은 이 장르를 로드할 수 없습니다.';

  @override
  String get continueReading => '계속 읽기';

  @override
  String get savedHighlights => '저장된 하이라이트';

  @override
  String get continueListening => '계속 듣기';

  @override
  String get listen => '듣기';

  @override
  String get resume => '이어하기';

  @override
  String get failedToLoadLibrary => '라이브러리를 로드하지 못했습니다';

  @override
  String get popularNow => '지금 인기';

  @override
  String get savedForLater => '나중에 읽을 책';

  @override
  String get topListens => '인기 오디오북';

  @override
  String get unreadDiscoveries => '새로운 읽을거리';

  @override
  String get pickUpAgain => '다시 읽기';

  @override
  String get bookHighlightsDescription => '하이라이트, 즐겨찾기 또는 읽기 진행 상황이 포함된 책입니다.';

  @override
  String get handPickedFromLibrary => '라이브러리에서 직접 선택했습니다.';

  @override
  String get handPickedFromListeningQueue => '청취 대기열에서 직접 선택했습니다.';

  @override
  String get booksWithHighlights => '하이라이트, 즐겨찾기 또는 읽기 진행 상황이 포함된 책입니다.';

  @override
  String get jumpBackNarration => '위치를 찾을 필요 없이 바로 이어 들으세요.';

  @override
  String get unreadBooksReady => '여유로운 시간에 읽을, 아직 읽지 않은 책입니다.';

  @override
  String get quickAccessFavorites => '계속해서 읽고 있는 책에 빠르게 액세스하세요.';

  @override
  String get searchAudiobooks => '오디오북 검색';

  @override
  String get searchYourLibrary => '라이브러리 검색';

  @override
  String get pickUpStory => '중단한 이야기를 다시 시작하세요';

  @override
  String get savedPlacesChapters => '저장한 위치와 다 읽지 못한 챕터';

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
  String get readyWhenYouAre => '준비되면 시작하세요';

  @override
  String get details => '상세 정보';

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
  String get browseByAuthor => '저자별로 찾아보기';

  @override
  String get browseByGenre => '장르별로 찾아보기';

  @override
  String get discover => '둘러보기';

  @override
  String get noBookmarkedItems => '아직 북마크한 항목이 없습니다';

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
  String get folder => '폴더';

  @override
  String get filters => '필터';

  @override
  String get readingStatus => '읽기 상태';

  @override
  String get playedStatus => '시청 상태';

  @override
  String get readStatus => '읽음';

  @override
  String get watched => '시청함';

  @override
  String get unread => '읽지 않음';

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
  String get latestComics => '최신 만화';

  @override
  String get comics => '만화';

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
  String get bookFormatComic => '만화';

  @override
  String get noBooksFound => '이 저자에 대한 도서를 찾을 수 없습니다.';

  @override
  String get noBooksFoundDescription => '이 라이브러리에는 아직 도서, 오디오북 또는 만화가 없습니다.';

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
  String get unknownAuthor => '알 수 없는 저자';

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
  String get downloadZip => 'ZIP 다운로드';

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
  String get subjects => '주제';

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
  String get itemListPlaceholder => '여기에 항목 목록이 표시됩니다';

  @override
  String get failedToLoad => '로드하지 못했습니다';

  @override
  String get delete => '삭제';

  @override
  String get save => '저장';

  @override
  String get moreLikeThis => '비슷한 콘텐츠';

  @override
  String get castAndCrew => '출연진 및 제작진';

  @override
  String get collection => '컬렉션';

  @override
  String get episodes => '에피소드';

  @override
  String get nextUp => '다음 볼 항목';

  @override
  String get seasons => '시즌';

  @override
  String get chapters => '챕터';

  @override
  String get features => '특별 영상';

  @override
  String get movies => '영화';

  @override
  String get musicVideos => '뮤직비디오';

  @override
  String get other => '기타';

  @override
  String get discography => '디스코그래피';

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
  String get biography => '약력';

  @override
  String get authorDetails => '저자 정보';

  @override
  String get noOverviewAvailable => '아직 이 타이틀에 대한 개요가 없습니다.';

  @override
  String get noBiographyAvailable => '이 저자의 약력이 없습니다.';

  @override
  String get unableToLoadAuthorDetails => '지금은 저자 정보를 로드할 수 없습니다.';

  @override
  String published(int year) {
    return '$year년 출간';
  }

  @override
  String get publicationDateUnknown => '출판일 알 수 없음';

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
  String get additionalParts => '추가 파트';

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
  String get view => '보기';

  @override
  String get resumeReading => '읽기 재개';

  @override
  String get read => '읽기';

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
  String get playOffline => '오프라인으로 재생';

  @override
  String get audio => '오디오';

  @override
  String get subtitles => '자막';

  @override
  String get version => '버전';

  @override
  String get cast => '전송';

  @override
  String get castMembers => '출연진';

  @override
  String get trailer => '예고편';

  @override
  String get finished => '완료됨';

  @override
  String get favorited => '즐겨찾기';

  @override
  String get favorite => '즐겨찾기';

  @override
  String get playlist => '재생목록';

  @override
  String get downloaded => '다운로드됨';

  @override
  String get finalizingDownload => '마무리 중…';

  @override
  String get queuedDownload => '대기 중';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 더 대기 중',
      one: '1개 더 대기 중',
    );
    return '$_temp0';
  }

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
  String get less => '간략히';

  @override
  String get more => '더 보기';

  @override
  String get deleteItem => '항목 삭제';

  @override
  String get deletePlaylist => '재생목록 삭제';

  @override
  String get deletePlaylistMessage => '서버에서 이 재생목록을 삭제하시겠습니까?';

  @override
  String get deleteItemMessage => '이 항목을 서버에서 삭제하시겠습니까?';

  @override
  String get failedToDeletePlaylist => '재생목록을 삭제하지 못했습니다';

  @override
  String get failedToDeleteItem => '항목을 삭제하지 못했습니다';

  @override
  String failedToDeleteItemWithError(String error) {
    return '다음 오류로 인해 삭제 작업에 실패했습니다: $error';
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
  String get downloadedTracksDeleted => '다운로드한 트랙이 삭제되었습니다';

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
  String get searchingSubtitles => '자막 검색 중…';

  @override
  String get fetchingSubtitles => '자막 불러오는 중';

  @override
  String get downloadingSubtitle => '자막 다운로드 중…';

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
  String get downloadQuality => '다운로드 품질';

  @override
  String get originalFileNoReencoding => '원본 파일, 재인코딩 없음';

  @override
  String get originalFilesNoReencoding => '원본 파일, 재인코딩 없음';

  @override
  String get noEpisodesLoaded => '로드된 에피소드가 없습니다.';

  @override
  String get downloadScopeTitle => '다운로드할 항목';

  @override
  String get downloadAllEpisodes => '모든 에피소드';

  @override
  String get downloadUnwatchedEpisodes => '시청하지 않은 모든 에피소드';

  @override
  String get downloadAllMovies => '모든 영화';

  @override
  String get downloadUnwatchedMovies => '시청하지 않은 모든 영화';

  @override
  String get downloadScopeLoading => '항목을 불러오는 중...';

  @override
  String get downloadScopeLoadFailed => '다운로드할 항목을 불러오지 못했습니다';

  @override
  String downloadEstimateTotal(String size) {
    return '총 약 $size';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received / $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return '총 $size';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count개 알 수 없음';
  }

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
  String get starring => '주연';

  @override
  String get directors => '감독';

  @override
  String get writer => '각본';

  @override
  String get writers => '각본가';

  @override
  String get studio => '스튜디오';

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
  String get readMore => '더 보기';

  @override
  String get shuffle => '셔플';

  @override
  String get shuffleAll => '전체 셔플';

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
  String get aiTranslated => 'AI 번역';

  @override
  String get machineTranslated => '기계 번역';

  @override
  String get hearingImpaired => 'SDH';

  @override
  String framerateFps(String rate) {
    return '$rate fps';
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
    return '전송 음량을 조절하지 못했습니다: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label 제어';
  }

  @override
  String get deviceVolume => '기기 음량';

  @override
  String get unavailable => '사용할 수 없음';

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
  String get castingViaAirPlay => 'AirPlay로 전송 중';

  @override
  String get castingViaDlna => 'DLNA로 전송 중';

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
  String get unknown => '알 수 없음';

  @override
  String get playbackInformation => '재생 정보';

  @override
  String get showMpvStats => 'mpv 통계 표시(Shift+I)';

  @override
  String get hideMpvStats => 'mpv 통계 숨기기(Shift+I)';

  @override
  String get keyboardShortcutsTitle => '키보드 단축키';

  @override
  String get keyboardShortcutsSubtitle => '앱, 비디오 플레이어, 리더에서 쓰는 키';

  @override
  String get keyboardShortcutsPlayerHint =>
      '영상 재생 중에 ? 또는 F1을 누르면 플레이어를 나가지 않고 이 목록을 볼 수 있습니다.';

  @override
  String get keyboardShortcutsSectionApp => '공통';

  @override
  String get keyboardShortcutsSectionAppScope => '모든 화면에서';

  @override
  String get keyboardShortcutsSectionPlayer => '비디오 플레이어';

  @override
  String get keyboardShortcutsSectionPlayerScope => '영상이 열려 있거나 재생·일시정지 중일 때';

  @override
  String get keyboardShortcutsSectionReader => '도서 및 만화 리더';

  @override
  String get keyboardShortcutsSectionReaderScope => '도서나 만화를 읽는 중일 때';

  @override
  String get keyNameArrowKeys => '방향키';

  @override
  String get keyNameSpace => 'Space';

  @override
  String get keyNameEnter => 'Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

  @override
  String get keyNameDelete => 'Delete';

  @override
  String get keyNamePageUp => 'Page Up';

  @override
  String get keyNamePageDown => 'Page Down';

  @override
  String get keyNameHome => 'Home';

  @override
  String get keyNameEnd => 'End';

  @override
  String get keyNameShift => 'Shift';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => '마우스 휠';

  @override
  String get shortcutMoveFocus => '항목 간 이동';

  @override
  String get shortcutActivate => '선택한 항목 열기';

  @override
  String get shortcutGoBack => '뒤로 가기';

  @override
  String get shortcutToggleFullscreen => '전체 화면 켜기/끄기';

  @override
  String get shortcutQuit => 'Moonfin 종료';

  @override
  String get shortcutPlayPause => '재생/일시정지';

  @override
  String get shortcutShowControlsOrPlayPause => '컨트롤 표시(표시 중이면 재생/일시정지)';

  @override
  String get shortcutSeekBack => '뒤로 탐색(길게 누르면 더 크게 이동)';

  @override
  String get shortcutSeekForward => '앞으로 탐색(길게 누르면 더 크게 이동)';

  @override
  String get shortcutVolumeUp => '음량 높이기';

  @override
  String get shortcutVolumeDown => '음량 낮추기';

  @override
  String get shortcutMute => '음소거/음소거 해제';

  @override
  String get shortcutToggleSubtitles => '자막 켜기/끄기';

  @override
  String get shortcutSlower => '느리게';

  @override
  String get shortcutFaster => '빠르게';

  @override
  String get shortcutPlaybackInfo => '재생 정보 표시';

  @override
  String get shortcutMpvStats => 'mpv 통계 켜기/끄기';

  @override
  String get shortcutRecropBlackBars => '검은 여백 다시 자르기';

  @override
  String get shortcutLeaveFullscreenOrStop => '전체 화면 종료(전체 화면이 아니면 정지)';

  @override
  String get shortcutHideControls => 'Hide controls';

  @override
  String get shortcutStopPlayback => '재생 정지';

  @override
  String get shortcutNextItem => '다음 항목';

  @override
  String get shortcutPreviousItem => '이전 항목';

  @override
  String get shortcutSkipSegment => '인트로나 크레딧 건너뛰기(버튼이 표시될 때)';

  @override
  String get shortcutShowShortcuts => '이 목록 표시';

  @override
  String get shortcutNextPage => '다음 페이지';

  @override
  String get shortcutPreviousPage => '이전 페이지';

  @override
  String get shortcutScrollPage => '페이지 스크롤(전자책)';

  @override
  String get shortcutFirstPage => '첫 페이지 또는 챕터 처음';

  @override
  String get shortcutLastPage => '마지막 페이지 또는 챕터 끝';

  @override
  String get shortcutZoom => '확대/축소(만화)';

  @override
  String get shortcutResetZoom => '확대/축소 초기화(만화)';

  @override
  String get playback => '재생';

  @override
  String get playMethod => '재생 방법';

  @override
  String get directPlay => '다이렉트 재생';

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
  String get resolution => '해상도';

  @override
  String get hdr => 'HDR';

  @override
  String get videoRenderer => '비디오 렌더러';

  @override
  String get videoRendererDescription =>
      '네이티브 창은 가장 부드러운 움직임을 제공하고 HDR을 그대로 디스플레이에 전달합니다. 영상에 문제가 있으면 다른 옵션을 사용해 보세요.';

  @override
  String get videoRendererNativeWindow => '네이티브 창(권장)';

  @override
  String get videoRendererNativeHdrOnly => 'HDR만 네이티브 창';

  @override
  String get videoRendererInApp => '앱 내부(레거시)';

  @override
  String get track => '트랙';

  @override
  String get channels => '채널';

  @override
  String get format => '형식';

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
      '이 플랫폼에서는 아직 앱 내 EPUB 렌더링을 사용할 수 없습니다.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get themeLight => '테마: 라이트';

  @override
  String get themeDark => '테마: 다크';

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
      '지원되는 플랫폼 대상(Android, iOS, macOS)으로 전환한 후 \'리더 다시 로드\'를 사용하세요.';

  @override
  String get openExternally => '외부에서 열기';

  @override
  String get noEpubChaptersFound => 'EPUB 챕터를 찾을 수 없습니다.';

  @override
  String get readerNotReady => '리더가 준비되지 않았습니다.';

  @override
  String get seriesRecordings => '시리즈 녹화';

  @override
  String get now => '지금';

  @override
  String get sports => '스포츠';

  @override
  String get news => '뉴스';

  @override
  String get kids => '어린이';

  @override
  String get premiere => '첫 방송';

  @override
  String get guideRepeatBadge => '재방송';

  @override
  String get guideTimeline => '가이드 타임라인';

  @override
  String failedToLoadGuide(String error) {
    return '편성표를 불러오지 못했습니다: $error';
  }

  @override
  String get noChannelsFound => '채널을 찾을 수 없습니다';

  @override
  String get noProgramData => '프로그램 정보 없음';

  @override
  String get liveBadge => 'LIVE';

  @override
  String get liveTvJumpToLive => '실시간으로 이동';

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
  String get unfavoriteChannel => '채널 즐겨찾기 해제';

  @override
  String get favoriteChannel => '채널 즐겨찾기';

  @override
  String get record => '녹화 예약';

  @override
  String nextSeriesRecording(String dateTime) {
    return '다음 시리즈 녹화: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      '시리즈 녹화가 예약되어 있지만 편성표에 예정된 에피소드가 없습니다';

  @override
  String get seriesRecordingSkipsShowing =>
      'The series recording will skip this showing';

  @override
  String get seriesRecordingEpisodesQuestion =>
      'Which episodes should be recorded?';

  @override
  String get seriesRecordingAllEpisodes => 'All Episodes';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Every showing, including repeats';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Episodes Not Already Recorded';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Skips episodes already in your library and records each episode once';

  @override
  String get seriesRecordingNewEpisodesOnly => 'New Episodes Only';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'First airings only, no repeats';

  @override
  String get seriesRecordingSettings => 'Series Settings';

  @override
  String get seriesRecordingUpdated => 'Series recording updated';

  @override
  String get failedToUpdateSeriesRecording =>
      'Unable to update series recording';

  @override
  String get recordCurrentEpisode => '이 에피소드 녹화';

  @override
  String get recordCurrentProgram => '이 프로그램 녹화';

  @override
  String get cancelCurrentRecording => '이 녹화 취소';

  @override
  String get cancelRecordingAction => '녹화 취소';

  @override
  String get programSetToRecord => '녹화가 예약되었습니다';

  @override
  String get recordingCancelled => '녹화가 취소되었습니다';

  @override
  String get unableToCreateRecording => '녹화를 예약할 수 없습니다';

  @override
  String get recordSeries => '시리즈 녹화';

  @override
  String get seriesSetToRecord => '시리즈 녹화 예약됨';

  @override
  String get seriesRecordingCancelled => '시리즈 녹화 취소됨';

  @override
  String get unableToCreateSeriesRecording => '시리즈 녹화를 생성할 수 없습니다';

  @override
  String get watch => '시청';

  @override
  String get watchChannelLive => '채널 실시간 시청';

  @override
  String get close => '닫기';

  @override
  String failedToPlayChannel(String name) {
    return '$name을(를) 재생하지 못했습니다';
  }

  @override
  String get playbackStreamLost => '재생이 중지되었으며 복구하지 못했습니다.';

  @override
  String get playbackVideoUnsupported =>
      '이 기기에서는 이 영상의 형식을 재생할 수 없습니다. 외부 플레이어를 사용해 보세요.';

  @override
  String liveReconnecting(int attempt, int total) {
    return '다시 연결하는 중… ($total회 중 $attempt회)';
  }

  @override
  String get failedToLoadRecordings => '녹화를 로드하지 못했습니다';

  @override
  String get scheduledInNext24Hours => '향후 24시간 내 예약';

  @override
  String get recentRecordings => '최근 녹화';

  @override
  String get tvSeries => 'TV 시리즈';

  @override
  String get failedToLoadSchedule => '일정을 로드하지 못했습니다.';

  @override
  String get noScheduledRecordings => '예약된 녹화가 없습니다.';

  @override
  String get cancelRecording => '녹화를 취소하시겠습니까?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\"의 예약 녹화를 취소할까요?';
  }

  @override
  String get no => '아니요';

  @override
  String get yesCancel => '예, 취소합니다';

  @override
  String get failedToCancelRecording => '녹화를 취소하지 못했습니다';

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
  String get searchEllipsis => '검색...';

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
  String get localAccount => '로컬';

  @override
  String get savedMedia => '다운로드';

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
  String get activeDownloads => '진행 중인 다운로드';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '항목 $count개',
      one: '항목 1개',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used / $limit';
  }

  @override
  String get savedMediaSelectItems => '항목 선택';

  @override
  String get savedMediaNoDownloads => '아직 저장한 항목이 없습니다';

  @override
  String get savedMediaNoDownloadsDetail =>
      '다운로드한 항목이 여기에 표시되며 인터넷 연결 없이 재생할 수 있습니다.';

  @override
  String get savedMediaNoActiveDownloads => '다운로드 중인 항목이 없습니다';

  @override
  String get savedMediaNoResults => '검색과 일치하는 다운로드가 없습니다';

  @override
  String get savedMediaPlayFromStart => '처음부터 재생';

  @override
  String get savedMediaGoToDetails => '상세 정보로 이동';

  @override
  String get savedMediaDeleteDownload => '다운로드 삭제';

  @override
  String savedMediaDeleteSeason(String season) {
    return '$season 삭제';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '에피소드 $count개 삭제',
      one: '에피소드 1개 삭제',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => '프로그램 열기';

  @override
  String get savedMediaPlayNextUnwatched => '시청하지 않은 다음 에피소드 재생';

  @override
  String get savedMediaRead => '읽기';

  @override
  String get savedMediaCancelDownload => '다운로드 취소';

  @override
  String get sortBySize => '크기';

  @override
  String get sortByName => '이름';

  @override
  String get sortByDateAdded => '추가된 날짜';

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
  String get database => '데이터베이스';

  @override
  String ofStorageLimit(String limit) {
    return '/ $limit 한도';
  }

  @override
  String get settings => '설정';

  @override
  String get settingsSearchHint => '설정 검색';

  @override
  String get authentication => '인증';

  @override
  String get autoLoginServerManagement => '자동 로그인, 서버 관리';

  @override
  String get pinCode => 'PIN 코드';

  @override
  String get setUpPinCodeProtection => 'PIN 코드 보호 설정';

  @override
  String get parentalControls => '자녀 보호';

  @override
  String get contentRatingRestrictions => '콘텐츠 등급 제한';

  @override
  String get bitRateResolutionBehavior => '비트 전송률, 해상도, 동작';

  @override
  String get languageSizeAppearance => '언어, 크기, 모양';

  @override
  String get qualityStorage => '품질, 저장 공간';

  @override
  String get mediaRequestIntegration => '미디어 요청 통합';

  @override
  String get switchServer => '서버 전환';

  @override
  String get signOut => '로그아웃';

  @override
  String get versionLicenses => '버전, 라이선스';

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
  String get focusBorderColor => '포커스 테두리 색상';

  @override
  String get watchedIndicators => '시청 표시';

  @override
  String get always => '항상';

  @override
  String get mixedRowsOnly => '혼합 행만';

  @override
  String get hideUnwatched => '보지 않은 항목 숨기기';

  @override
  String get episodesOnly => '에피소드만';

  @override
  String get never => '안 함';

  @override
  String get focusExpansionAnimation => '포커스 확장 애니메이션';

  @override
  String get desktopUiScale => 'UI 배율';

  @override
  String get scaleFocusedCards => '포커스되거나 마우스를 올린 카드 및 타일 크기 조정';

  @override
  String get seriesThumbnails => '시리즈 썸네일 표시';

  @override
  String get seriesThumbnailsDescription =>
      'TV 시리즈는 에피소드 썸네일 대신 시리즈 대표 아트워크를 사용합니다.';

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
  String get seasonalEffects => '계절 효과';

  @override
  String get seasonalEffectsDescription => '시각 효과 및 계절 장식';

  @override
  String get loadingAnimation => '로딩 애니메이션';

  @override
  String get loadingAnimationDescription =>
      'Moonfin 전체에서 사용하는 로딩 애니메이션을 사용자 지정합니다';

  @override
  String get loadingAnimationConfiguration => '로딩 애니메이션 설정';

  @override
  String get loadingAnimationImage => '이미지';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin 로고';

  @override
  String get loadingAnimationImageSpinner => '스피너';

  @override
  String get loadingAnimationImageRunner => '러너';

  @override
  String get loadingAnimationImageMoonPhases => '달의 위상';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin 위상';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfin 위상';

  @override
  String get loadingAnimationSize => '애니메이션 크기';

  @override
  String get loadingAnimationSizeThumbnail => '썸네일';

  @override
  String get loadingAnimationSizeSmall => '작게';

  @override
  String get loadingAnimationSizeMedium => '보통';

  @override
  String get loadingAnimationSizeLarge => '크게';

  @override
  String get loadingAnimationPosition => '애니메이션 위치';

  @override
  String get loadingAnimationPositionTopLeft => '왼쪽 위';

  @override
  String get loadingAnimationPositionTopCenter => '가운데 위';

  @override
  String get loadingAnimationPositionTopRight => '오른쪽 위';

  @override
  String get loadingAnimationPositionMiddleLeft => '왼쪽 가운데';

  @override
  String get loadingAnimationPositionMiddle => '가운데';

  @override
  String get loadingAnimationPositionMiddleRight => '오른쪽 가운데';

  @override
  String get loadingAnimationPositionBottomLeft => '왼쪽 아래';

  @override
  String get loadingAnimationPositionBottomCenter => '가운데 아래';

  @override
  String get loadingAnimationPositionBottomRight => '오른쪽 아래';

  @override
  String get loadingAnimationPositionBouncing => '튕기기';

  @override
  String get loadingAnimationSpeed => '애니메이션 속도';

  @override
  String get loadingAnimationSpeedSlow => '느리게';

  @override
  String get loadingAnimationSpeedModerate => '보통';

  @override
  String get loadingAnimationSpeedFast => '빠르게';

  @override
  String get loadingAnimationSpeedUltra => '매우 빠르게';

  @override
  String get showLoadingAnimationText => '텍스트 표시';

  @override
  String get loadingAnimationPreview => '미리보기';

  @override
  String get snow => '눈';

  @override
  String get fireworks => '불꽃놀이';

  @override
  String get confetti => '색종이 조각';

  @override
  String get fallingLeaves => '떨어지는 나뭇잎';

  @override
  String get seasonalChristmas => '크리스마스';

  @override
  String get seasonalPetals => '봄 꽃잎';

  @override
  String get seasonalFireflies => '반딧불이';

  @override
  String get seasonalHalloween => '핼러윈';

  @override
  String get seasonalDensity => '밀도';

  @override
  String get seasonalDensityLight => '적게';

  @override
  String get seasonalDensityNormal => '보통';

  @override
  String get seasonalDensityHeavy => '많이';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => '시즌 테마 행';

  @override
  String get seasonalRowDescription =>
      '라이브러리의 명절·기념일 영화를 행으로 표시하며, 가능하면 Seerr 추천도 함께 보여줍니다.';

  @override
  String get seasonalRowSubtitle => '시즌 테마';

  @override
  String get seasonalRowCountry => '국가';

  @override
  String get seasonalRowCountryAuto => '자동';

  @override
  String get countryUnitedStates => '미국';

  @override
  String get countryCanada => '캐나다';

  @override
  String get seasonalRowCountryOther => '기타';

  @override
  String get seasonalRowHolidays => '기념일';

  @override
  String get seasonalRowHolidaysHint => '기념일 체크를 해제하면 해당 행이 숨겨집니다.';

  @override
  String get holidayNewYear => '새해';

  @override
  String get holidayValentines => '밸런타인데이';

  @override
  String get holidayEaster => '부활절';

  @override
  String get holidayPride => '프라이드';

  @override
  String get holidayHalloween => '핼러윈';

  @override
  String get holidayThanksgiving => '추수감사절';

  @override
  String get holidayChristmas => '크리스마스 영화';

  @override
  String get holidayLunarNewYear => '설날';

  @override
  String get holidayDiwali => '디왈리';

  @override
  String get themeMusic => '테마 음악';

  @override
  String get playThemeMusicOnDetailPages => '세부 정보 페이지에서 테마 음악 재생';

  @override
  String get themeMusicVolume => '테마 음악 볼륨';

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
  String get detailsBackgroundBlur => '상세 정보 배경 흐림';

  @override
  String get detailsBackgroundOpacity => '상세 정보 배경 불투명도';

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
  String get fit => '맞춤';

  @override
  String get autoCrop => '확대하여 채우기';

  @override
  String get cropBlackBars => '검은 여백 자르기';

  @override
  String get settingsCropBlackBarsDescription =>
      '재생이 시작되면 영상에 포함된 레터박스 여백을 감지해 잘라내고 화면을 채웁니다. 플레이어의 확대/축소 버튼에서 다시 자를 수 있습니다.';

  @override
  String get cropBlackBarsRecropInterval => '다시 자르기 간격';

  @override
  String get cropBlackBarsOnce => '시작할 때 한 번';

  @override
  String get cropBlackBarsEverySecond => '매초';

  @override
  String get settingsCropBlackBarsIntervalDescription => '재생 중 화면비가 바뀌면 따라갑니다.';

  @override
  String get playerRecroppingBlackBars => '검은 여백을 다시 자르는 중';

  @override
  String get stretch => '늘이기';

  @override
  String get refreshRateSwitching => '새로 고침 빈도 전환';

  @override
  String get disabled => '사용 안 함';

  @override
  String get manual => '수동';

  @override
  String get autoDetect => '자동 감지';

  @override
  String get scaleOnTv => 'TV에서 스케일링';

  @override
  String get scaleOnDevice => '기기에서 스케일링';

  @override
  String get trickPlay => 'Trickplay';

  @override
  String get showPreviewThumbnailsWhenSeeking => '탐색 시 미리보기 썸네일 표시';

  @override
  String get trickplayDisplayStyleSingle => '단일 썸네일';

  @override
  String get trickplayDisplayStyleStrip => '필름 스트립';

  @override
  String get trickplayModeFull => '전체 화면';

  @override
  String get trickplaySettingsPreviewHint => '슬라이더를 드래그해 탐색 미리보기를 확인하세요';

  @override
  String get trickplayPreviewScale => '미리보기 크기';

  @override
  String get trickplayVerticalOffset => '탐색 바와의 간격';

  @override
  String get trickplayFollowScrubPosition => '탐색 위치 따라가기';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      '미리보기를 가운데에 고정하지 않고 탐색 위치를 따라 탐색 바 위에서 움직입니다';

  @override
  String get trickplayPauseWhileScrubbing => '탐색 중 일시정지';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      '탐색하는 동안 재생이 일시정지되고, 재생 버튼을 누르면 다시 재생됩니다. 끄면 재생을 유지한 채 새 위치로 바로 이동합니다';

  @override
  String get showDescriptionOnPause => '일시중지 시 설명 표시';

  @override
  String get dimVideoShowOverview => '일시중지된 동안 비디오를 어둡게 하고 개요 텍스트를 표시합니다.';

  @override
  String get showChapterMarkers => '챕터 표시';

  @override
  String get showChapterMarkersDescription => '탐색 바에 각 챕터의 시작 위치를 표시합니다';

  @override
  String get osdLockButton => 'OSD 잠금 버튼';

  @override
  String get osdLockButtonDescription => '길게 누를 때까지 터치 입력을 차단하는 잠금 버튼 표시';

  @override
  String get playerSwipeGestures => '음량 및 밝기 스와이프';

  @override
  String get playerSwipeGesturesDescription =>
      '플레이어에서 위아래로 밀어 왼쪽은 밝기, 오른쪽은 음량을 조절합니다';

  @override
  String get invertGestureIndicators => 'Invert Gesture Indicators';

  @override
  String get invertGestureIndicatorsDescription =>
      'Place brightness and volume visual indicators on same or opposite side of screen from swipe';

  @override
  String get gestureIndicatorSame => 'Same';

  @override
  String get gestureIndicatorInverted => 'Inverted';

  @override
  String get osdButtons => '플레이어 버튼';

  @override
  String get osdButtonsDescription => '플레이어에 표시할 버튼을 선택합니다';

  @override
  String get osdButtonsSectionDescription =>
      '재생 컨트롤은 항상 표시됩니다. 아래 항목은 원하는 대로 설정할 수 있으며, 기기 종류별로 목록이 각각 저장됩니다.';

  @override
  String get detailButtons => '작업 버튼';

  @override
  String get detailButtonsDescription => '상세 화면에 표시할 버튼을 선택합니다';

  @override
  String get detailButtonsSectionDescription =>
      '재생 버튼은 항상 첫 번째로 표시되며 잠긴 버튼은 항상 표시됩니다. 그 외의 항목은 원하는 대로 설정할 수 있으며, 기기 종류별로 목록이 각각 저장됩니다.';

  @override
  String get actionButtonsOnScreen => '화면에 표시할 작업 버튼';

  @override
  String get actionButtonsOnScreenDescription =>
      '\'추가 작업\' 메뉴로 접히기 전에 표시할 작업 버튼 수를 설정합니다.';

  @override
  String get actionButtonsOnScreenAuto => '자동(테마 기본값)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1개(재생만)';

  @override
  String get actionButtonsOnScreenAll => '모두(가로 스크롤)';

  @override
  String get detailMetadata => '메타데이터 행';

  @override
  String get detailMetadataDescription => '상세 화면에 표시할 메타데이터를 선택하고 순서를 바꿉니다';

  @override
  String get detailMetadataSectionDescription =>
      '메타데이터 항목을 켜거나 끄고 상세 화면에 표시되는 순서를 정합니다. 기기 종류별로 목록이 각각 저장됩니다.';

  @override
  String get detailMetadataYear => '출시 연도';

  @override
  String get detailMetadataParentalRating => '시청 등급';

  @override
  String get detailMetadataRuntimeAndSeasons => '상영 시간 및 시즌';

  @override
  String get detailMetadataStatus => '시리즈 상태';

  @override
  String get detailMetadataStatusSubtitle =>
      '시리즈가 방영 중인지, 종영했는지, 새 시즌이 예정됐는지 표시합니다';

  @override
  String get detailMetadataGenres => '장르';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr 이용 가능 여부';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Seerr의 요청 및 미디어 이용 가능 상태를 표시합니다';

  @override
  String get detailMetadataUpcomingEpisodeDate => '예정된 에피소드';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Sonarr와 TMDB를 사용해 예정된 공개일을 표시합니다';

  @override
  String get detailSections => '섹션';

  @override
  String get detailSectionsDescription => '상세 화면에 표시할 부분을 선택합니다';

  @override
  String get detailSectionsScreenDescription =>
      '현재 상세 화면 스타일에서 표시할 수 있는 섹션만 나열됩니다. 섹션을 숨기면 그 섹션이 있는 모든 스타일에서 숨겨집니다.';

  @override
  String get detailSectionGroupHeader => '헤더';

  @override
  String get detailSectionGroupSections => '섹션';

  @override
  String get detailSectionGroupPerson => '인물 페이지';

  @override
  String get detailSectionGroupCollection => '컬렉션 페이지';

  @override
  String get detailSectionGroupOther => '기타';

  @override
  String get detailSectionLogo => '로고';

  @override
  String get detailSectionLogoSubtitle => '끄면 제목을 텍스트로 표시합니다';

  @override
  String get detailSectionTagline => '태그라인';

  @override
  String get detailSectionPoster => '포스터';

  @override
  String get detailSectionVersionBadge => '버전 배지';

  @override
  String get detailSectionUpNext => '다음 볼 항목';

  @override
  String get detailSectionLyrics => '가사';

  @override
  String get detailSectionCast => '출연진';

  @override
  String get detailSectionCastSubtitle => '컬렉션 페이지에도 표시';

  @override
  String get detailSectionCrew => '감독 및 작가';

  @override
  String get detailSectionStudios => '스튜디오';

  @override
  String get detailSectionChapters => '챕터';

  @override
  String get detailSectionExtras => '부가 영상';

  @override
  String get detailSectionCollections => '컬렉션';

  @override
  String get detailSectionMoreLikeThis => '비슷한 콘텐츠';

  @override
  String get detailSectionMoreLikeThisSubtitle => '비슷한 앨범 및 아티스트 포함';

  @override
  String get detailSectionMoreEpisodes => '다른 에피소드';

  @override
  String get detailSectionMoreEpisodesSubtitle => '에피소드 페이지에 표시';

  @override
  String get detailSectionMediaInfo => '미디어 정보';

  @override
  String get detailSectionMediaInfoSubtitle => '파일, 스트림 및 다이렉트 재생 확인';

  @override
  String get detailSectionSeerrGenresTags => '장르 및 태그';

  @override
  String get detailSectionSeerrStats => '통계';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => '추천';

  @override
  String get detailSectionSeerrSimilar => '비슷한 작품';

  @override
  String get detailSectionSeerrCollection => '컬렉션 배너';

  @override
  String get detailSectionSeerrPersonAppearances => '출연작';

  @override
  String get detailSectionSeerrPersonCrew => '제작 참여작';

  @override
  String get detailSectionPersonPagesSubtitle => '인물 페이지에 표시';

  @override
  String get detailSectionBiography => '약력';

  @override
  String get detailSectionBirthplace => '출생지';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => '특별 출연';

  @override
  String get detailSectionMusicVideos => '뮤직비디오';

  @override
  String get detailSectionPlaylistOrder => '재생 순서';

  @override
  String get detailSectionBookGenres => '도서 장르';

  @override
  String get detailSectionPhotoExif => '사진 정보';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return '다음: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => '오늘';

  @override
  String get upcomingEpisodeTomorrow => '내일';

  @override
  String get moveUp => '위로 이동';

  @override
  String get moveDown => '아래로 이동';

  @override
  String get buttonOrderHint =>
      '화살표를 사용하여 순서를 변경하세요. 리모컨에서는 좌우 버튼으로 선택한 버튼을 이동합니다. 버튼을 끄면 나머지 버튼 아래로 이동합니다.';

  @override
  String get buttonShownInSyncPlayGroup => 'SyncPlay 그룹에 참여 중일 때만 표시됩니다';

  @override
  String get orientationLock => '화면 방향 잠금';

  @override
  String get fullscreen => '전체 화면';

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
  String get autoServerDefault => '자동(서버 기본값)';

  @override
  String get english => '영어';

  @override
  String get spanish => '스페인어';

  @override
  String get french => '프랑스어';

  @override
  String get german => '독일어';

  @override
  String get italian => '이탈리아어';

  @override
  String get portuguese => '포르투갈어';

  @override
  String get japanese => '일본어';

  @override
  String get korean => '한국어';

  @override
  String get chinese => '중국어';

  @override
  String get russian => '러시아어';

  @override
  String get arabic => '아랍어';

  @override
  String get hindi => '힌디어';

  @override
  String get dutch => '네덜란드어';

  @override
  String get swedish => '스웨덴어';

  @override
  String get norwegian => '노르웨이어';

  @override
  String get danish => '덴마크어';

  @override
  String get finnish => '핀란드어';

  @override
  String get polish => '폴란드어';

  @override
  String get ac3Passthrough => 'AC3 패스스루';

  @override
  String get dtsPassthrough => 'DTS 패스스루';

  @override
  String get trueHdSupport => 'TrueHD 지원';

  @override
  String get enableDtsPassthrough =>
      'DTS 오디오를 AVR로만 비트스트림 전송합니다. 리시버 지원과 DTS 소스 트랙이 필요합니다';

  @override
  String get settingsAudioFallbackCodec => '대체 오디오 코덱';

  @override
  String get settingsAudioFallbackCodecDescription =>
      '원본 스트림을 다이렉트 재생하거나 패스스루할 수 없을 때 멀티채널 오디오를 트랜스코딩할 대상 형식을 선택하세요.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto => '자동 감지\n(권장)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(기본값)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

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
  String get settingsAudioDtsCorePassthrough => 'DTS 코어 패스스루';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA 패스스루';

  @override
  String get settingsAudioPassthroughMode => '패스스루';

  @override
  String get settingsAudioPassthroughModeDescription =>
      '압축된 서라운드 사운드를 TV 또는 리시버로 전송하는 방식입니다.';

  @override
  String get settingsAudioPassthroughModeDisabled => '사용 안 함(항상 이 기기에서 디코딩)';

  @override
  String get settingsAudioPassthroughModeAuto => '자동(감지된 기기 지원에 맞춤)';

  @override
  String get settingsAudioPassthroughModeManual => '수동(아래에서 형식 선택)';

  @override
  String get settingsAudioPassthroughOutput => '패스스루 출력';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'HDMI로 보낼 비트스트림을 어디서 패킹할지 선택합니다. 이 기기에서 패스스루 시 소리가 나지 않거나 끊기면 앱 패커를 사용해 보세요.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      '자동, 시스템 패커(AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec => '앱 패커(AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => '앱(IEC)';

  @override
  String get settingsDownmixToStereoDescription => '디코딩된 모든 오디오를 2채널로 다운믹스합니다.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Dolby Atmos(JOC)를 포함한 E-AC-3을 비트스트림으로 전송합니다.';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'DTS:X를 포함한 DTS-HD를 비트스트림으로 전송합니다.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Dolby Atmos를 포함한 TrueHD를 비트스트림으로 전송합니다.';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD 패스스루';

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
      '성능이 향상될 수 있지만 일부 기기에서는 재생 문제가 발생할 수 있습니다.';

  @override
  String get nextUpAndQueuing => '다음 볼 항목 및 대기열';

  @override
  String get nextUpDisplay => '다음 볼 항목 표시';

  @override
  String get extended => '확장';

  @override
  String get minimal => '최소';

  @override
  String get nextUpTimeout => '다음 볼 항목 표시 시간';

  @override
  String secondsValue(int value) {
    return '$value초';
  }

  @override
  String get mediaQueuing => '미디어 대기열';

  @override
  String get autoQueueNextEpisodes => '다음 에피소드를 자동으로 대기열에 추가';

  @override
  String get stillWatchingPrompt => '시청 확인 알림';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes편 재생 또는 $hours시간 후';
  }

  @override
  String get resumeAndSkip => '재개 및 건너뛰기';

  @override
  String get resumeRewind => '이어보기 시 되감기';

  @override
  String get unpauseRewind => '일시정지 해제 시 되감기';

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
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      '스타일 설정(크기, 색상, 오프셋)은 텍스트 기반 자막(SRT, VTT, TTML)에 적용됩니다. ASS/SSA 자막은 \"ASS/SSA 다이렉트 재생\"이 꺼져 있지 않으면 자체 내장 스타일을 사용합니다. 비트맵 자막(PGS, DVB, VobSub)은 스타일을 변경할 수 없습니다.';

  @override
  String get defaultSubtitleLanguage => '기본 자막 언어';

  @override
  String get subtitleDownloadLanguages => '자막 다운로드 언어';

  @override
  String get subtitleDownloadLanguagesDescription =>
      '자막을 다운로드할 때 검색할 언어입니다(최대 5개). 자동은 기본 자막 언어나 영상에서 고른 언어 하나로 검색합니다.';

  @override
  String get preferredSecondarySubtitleLanguage => '선호하는 보조 자막 언어';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Show a second subtitle track at the same time. The subtitle menu then asks for the primary or secondary track first';

  @override
  String get defaultToNoSubtitles => '기본으로 자막 끄기';

  @override
  String get turnOffSubtitlesByDefault => '기본적으로 자막 끄기';

  @override
  String get subtitleSize => '자막 크기';

  @override
  String get primarySubtitleSlot => '기본';

  @override
  String get secondarySubtitleSlot => '보조';

  @override
  String get secondarySubtitleTrack => '보조 자막 트랙';

  @override
  String get secondaryDelayAdjustment => 'Secondary Delay Adjustment';

  @override
  String decreaseValue(String setting) {
    return '$setting 줄이기';
  }

  @override
  String increaseValue(String setting) {
    return '$setting 늘리기';
  }

  @override
  String get textFillColor => '텍스트 채우기 색상';

  @override
  String get backgroundColor => '배경색';

  @override
  String get textStrokeColor => '텍스트 외곽선 색상';

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
  String get pgsDirectPlay => 'PGS 다이렉트 재생';

  @override
  String get directPlayPgsSubtitles => 'PGS 자막 다이렉트 재생';

  @override
  String get assSsaDirectPlay => 'ASS/SSA 다이렉트 재생';

  @override
  String get directPlayAssSsaSubtitles => 'ASS/SSA 자막 다이렉트 재생';

  @override
  String get white => '흰색';

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
  String get transparent => '투명';

  @override
  String get semiTransparentBlack => '반투명 검정색';

  @override
  String get semiTransparentWhite => '반투명 흰색';

  @override
  String get lightGray => '밝은 회색';

  @override
  String get darkGray => '어두운 회색';

  @override
  String get blue => '파란색';

  @override
  String get magenta => '마젠타';

  @override
  String get global => '글로벌';

  @override
  String get desktop => '데스크톱';

  @override
  String get mobile => '모바일';

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
  String get syncing => '동기화 중...';

  @override
  String resetProfileTitle(String profile) {
    return '$profile을(를) 초기화할까요?';
  }

  @override
  String resetProfileDescription(String profile) {
    return '서버에서 $profile 프로필을 삭제하고 이 기기의 동기화된 모든 설정을 기본값으로 되돌립니다.';
  }

  @override
  String get resetGlobalProfileDescription =>
      '서버에서 저장된 모든 프로필을 삭제하고 이 기기의 동기화된 모든 설정을 기본값으로 되돌립니다.';

  @override
  String profileReset(String profile) {
    return '$profile 프로필을 기본값으로 초기화했습니다.';
  }

  @override
  String get resetRatingsTitle => '평가를 초기화할까요?';

  @override
  String get resetRatingsDescription =>
      '표시할 소스 및 표시 순서를 포함한 모든 평가 설정을 기본값으로 되돌립니다.';

  @override
  String get ratingsReset => '평가 설정을 기본값으로 초기화했습니다.';

  @override
  String failedToResetProfile(String profile) {
    return '$profile 프로필을 초기화하지 못했습니다.';
  }

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
  String get network => '네트워크';

  @override
  String get wifiOnlyDownloads => 'Wi-Fi 전용 다운로드';

  @override
  String get tvOfflineDownloads => '오프라인 다운로드 활성화';

  @override
  String get tvOfflineDownloadsSubtitle => '항목 페이지에 다운로드 작업 표시';

  @override
  String get reportDownloadsActivity => '서버에 다운로드 표시';

  @override
  String get reportDownloadsActivitySubtitle =>
      '서버 관리자가 대시보드에서 내 트랜스코딩 다운로드를 볼 수 있도록 합니다';

  @override
  String get onlyDownloadOnWifi => 'Wi-Fi에 연결된 경우에만 다운로드';

  @override
  String get storage => '저장 공간';

  @override
  String get storageUsed => '사용된 저장소';

  @override
  String get manage => '관리';

  @override
  String get calculating => '계산 중...';

  @override
  String get downloadLocation => '다운로드 위치';

  @override
  String get defaultLabel => '기본';

  @override
  String get sdCard => 'SD 카드';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android에서는 Moonfin이 소유한 폴더에만 쓸 수 있도록 제한하고 있으며, 이 기기에는 이동식 저장소가 없습니다. 다른 앱이 접근할 수 있는 위치에 다운로드 항목을 보관하려면 위의 \'다운로드 폴더에 저장\'을 켜세요.';

  @override
  String get saveToDownloadsFolder => '다운로드 폴더에 저장';

  @override
  String get downloadsVisibleToOtherApps => '다운로드/Moonfin — 다른 앱에 표시';

  @override
  String get dangerZone => '위험 구역';

  @override
  String get clearAllDownloads => '모든 다운로드 지우기';

  @override
  String get original => '원본';

  @override
  String get changeDownloadLocation => '다운로드 위치 변경';

  @override
  String get changeDownloadLocationDescription =>
      '새로운 다운로드는 선택한 폴더에 저장됩니다. 기존 다운로드는 현재 위치에 유지되며 저장소 설정에서 관리할 수 있습니다.';

  @override
  String get confirm => '확인';

  @override
  String get cannotWriteToFolder =>
      '선택한 폴더에 쓸 수 없습니다. 다른 위치를 선택하거나 저장 권한을 부여하세요.';

  @override
  String get saveToDownloadsFolderQuestion => '다운로드 폴더에 저장하시겠습니까?';

  @override
  String get saveToDownloadsFolderDescription =>
      '다운로드한 미디어는 기기의 Downloads/Moonfin에 저장됩니다. 이러한 파일은 갤러리나 음악 플레이어와 같은 다른 앱에 표시됩니다.\n\n기존 다운로드는 현재 위치에 유지됩니다.';

  @override
  String get transcodingTimeRemainingUnavailable => '트랜스코딩 중: 남은 시간 알 수 없음';

  @override
  String get enable => '활성화';

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
  String get showLiveTvButton => '라이브 TV 버튼 표시';

  @override
  String get showDownloadsButton => '다운로드 버튼 표시';

  @override
  String get showLibrariesInToolbar => '툴바에 라이브러리 표시';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded => '탐색 바 라벨 항상 표시';

  @override
  String get showSeerrButton => 'Seerr 버튼 표시';

  @override
  String get navbarOpacity => '탐색 바 불투명도';

  @override
  String get navbarColor => '탐색 바 색상';

  @override
  String get gray => '회색';

  @override
  String get darkBlue => '진한 파란색';

  @override
  String get purple => '보라색';

  @override
  String get teal => '틸';

  @override
  String get navy => '네이비';

  @override
  String get charcoal => '차콜';

  @override
  String get brown => '갈색';

  @override
  String get darkRed => '진한 빨간색';

  @override
  String get darkGreen => '진한 녹색';

  @override
  String get slate => '슬레이트';

  @override
  String get indigo => '인디고';

  @override
  String get libraryDisplay => '라이브러리 표시';

  @override
  String get posterLabel => '포스터';

  @override
  String get thumbnailLabel => '썸네일';

  @override
  String get bannerLabel => '배너';

  @override
  String get overridePerLibrarySettings => '라이브러리별 설정 재정의';

  @override
  String get applyImageTypeToAllLibraries => '모든 라이브러리에 이미지 유형 적용';

  @override
  String get multiServerLibraries => '다중 서버 라이브러리';

  @override
  String get showLibrariesFromAllServers => '연결된 모든 서버의 라이브러리 표시';

  @override
  String get mergeRecentRowsByType => '유형별 최근 행 병합';

  @override
  String get mergeRecentRowsByTypeDescription =>
      '\'최근 추가됨\' 및 \'최근 출시됨\' 홈 행에서 동일한 유형의 개별 라이브러리를 하나로 결합합니다.';

  @override
  String get libraryView => '라이브러리 보기';

  @override
  String get libraryStyle => '메인 라이브러리 스타일';

  @override
  String get libraryStyleDescription =>
      '클래식은 아이콘 버튼이 있는 기존 헤더입니다. 모던은 검색과 이름이 붙은 정렬·그룹·필터 버튼을 한 줄에 배치합니다. 도킹은 컨트롤과 글자 목록을 측면 패널로 옮깁니다.';

  @override
  String get libraryStyleDescriptionPhone =>
      '클래식은 아이콘 버튼이 있는 기존 헤더입니다. 모던은 검색 아래에 이름이 붙은 정렬·그룹·필터 칩을 추가합니다. 도킹은 컨트롤을 화면 하단 바에 둡니다.';

  @override
  String get libraryStyleClassic => '클래식';

  @override
  String get libraryStyleModern => '모던';

  @override
  String get libraryStyleDocked => '도킹';

  @override
  String get bookLibraryStyle => '도서 라이브러리 스타일';

  @override
  String get bookLibraryStyleDescription =>
      '클래식은 추천 작품 아래에 책장을 두는 기존 방식입니다. 독서실은 읽고 있는 책을 큰 카드로 먼저 보여줍니다. 서점은 전체 라이브러리를 그리드로 둘러봅니다.';

  @override
  String get bookLibraryStyleClassic => '클래식';

  @override
  String get bookLibraryStyleReadingRoom => '독서실';

  @override
  String get bookLibraryStyleBookstore => '서점';

  @override
  String get musicLibraryStyle => 'Music Library Style';

  @override
  String get musicLibraryStyleDescription =>
      'Classic is the original rows under a Jump Back In card. Quick Access starts with a grid of your recent albums and playlists. Immersive leads with the album you\'re listening to.';

  @override
  String get musicLibraryStyleClassic => 'Classic';

  @override
  String get musicLibraryStyleQuickAccess => 'Quick Access';

  @override
  String get musicLibraryStyleImmersive => 'Immersive';

  @override
  String get jumpBackIn => 'Jump Back In';

  @override
  String get yourPlaylists => 'Your Playlists';

  @override
  String get fromThisAlbum => 'From This Album';

  @override
  String get searchMusic => 'Search Music';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '시리즈 $count개',
      one: '시리즈 1개',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count권 읽는 중';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '작품 $count개 모두 둘러보기',
      one: '작품 1개 둘러보기',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => '도서 검색';

  @override
  String get libraryShowLabel => '표시';

  @override
  String get libraryAToZ => '가나다';

  @override
  String get libraryJumpToLetter => '글자로 이동';

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
  String get libraryVisibility => '라이브러리 표시 여부';

  @override
  String get libraryVisibilityDescription =>
      '라이브러리별로 홈 페이지 표시 여부를 전환합니다. 변경 사항을 적용하려면 Moonfin을 다시 시작하세요.';

  @override
  String get showInNavigation => '탐색에 표시';

  @override
  String get showInLatestMedia => '최근 추가/출시된 미디어에 표시';

  @override
  String get libraryOrder => '라이브러리 순서';

  @override
  String get libraryOrderSubtitle => '라이브러리 표시 순서를 정합니다';

  @override
  String get libraryOrderDescription =>
      '라이브러리는 내 미디어, 최근 추가된 항목 행, 탐색 바에 이 순서로 표시됩니다. 순서는 서버 계정에 저장되므로 같은 계정으로 로그인한 다른 앱에도 적용됩니다.';

  @override
  String get libraryOrderTvHint => '왼쪽 또는 오른쪽을 눌러 선택한 라이브러리를 이동하세요.';

  @override
  String get libraryOrderSaveFailed => '라이브러리 순서를 저장하지 못했습니다';

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
  String get mediaBar => '미디어 바';

  @override
  String get mediaSources => '미디어 소스';

  @override
  String get behavior => '동작';

  @override
  String get seconds => '초';

  @override
  String get mediaBarMode => '미디어 바 스타일';

  @override
  String get mediaBarModeDescription => '다양한 미디어 바 스타일 중 하나를 선택하거나 미디어 바를 끕니다';

  @override
  String get peekHomeRows => 'Peek Home Rows';

  @override
  String get peekHomeRowsDescription =>
      'Show the top half of the first row along the bottom of the media bar';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => '끔';

  @override
  String get mediaBarModeBookshelf => '책장';

  @override
  String get mediaBarModeGallery => '갤러리';

  @override
  String get mediaBarModeBanner => '배너';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => '미디어 바 활성화';

  @override
  String get showFeaturedContentSlideshow => '홈에서 추천 콘텐츠 슬라이드쇼 표시';

  @override
  String get contentType => '콘텐츠 유형';

  @override
  String get mediaBarSourceType => '소스';

  @override
  String get mediaBarSourceRandom => '무작위';

  @override
  String get moviesAndTvShows => '영화 및 TV 프로그램';

  @override
  String get moviesOnly => '영화만';

  @override
  String get tvShowsOnly => 'TV 프로그램만';

  @override
  String get itemCount => '항목 수';

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
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => '예고편 자막';

  @override
  String get trailerCaptionsDescription => '미디어 바의 YouTube 예고편에 자막을 표시합니다';

  @override
  String get episodePreview => '에피소드 미리보기';

  @override
  String get mediaPreview => '미디어 미리보기';

  @override
  String get episodePreviewDescription =>
      '포커스하거나 마우스를 올리거나 길게 누른 카드에서 30초 미리보기를 재생합니다';

  @override
  String get mediaPreviewDescription =>
      '포커스하거나 마우스를 올리거나 길게 누른 카드에서 30초 미리보기를 재생합니다';

  @override
  String get previewAudio => '오디오 미리보기';

  @override
  String get enablePreviewAudio => '예고편 및 에피소드 미리보기에 오디오 활성화';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => '최근 추가된 미디어';

  @override
  String get recentlyReleased => '최근 출시됨';

  @override
  String get recentlyReleasedSeriesType => '최근 출시된 시리즈 정렬 기준';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      '\'최근 출시된 시리즈\' 홈 행을 시리즈, 최신 시즌 또는 최신 에피소드 방영일 기준으로 정렬합니다';

  @override
  String get myMedia => '내 미디어';

  @override
  String get myMediaSmall => '내 미디어(소형)';

  @override
  String get continueWatching => '계속 시청하기';

  @override
  String get resumeAudio => '오디오 재개';

  @override
  String get resumeBooks => '이어볼 도서';

  @override
  String get activeRecordings => '녹화 중';

  @override
  String get playlists => '재생목록';

  @override
  String get liveTV => '라이브 TV';

  @override
  String get favoriteChannels => '즐겨찾는 채널';

  @override
  String get resetToDefaults => '기본값으로 재설정';

  @override
  String get homeRowPosterSize => '홈 행 포스터 크기';

  @override
  String get configureImageTypeForEachRow => '활성화된 각 홈 행에 대한 이미지 유형 구성';

  @override
  String get mergeContinueWatchingAndNextUp => '계속 시청과 다음 볼 항목 합치기';

  @override
  String get combineBothRows => '두 행을 단일 홈 섹션으로 결합';

  @override
  String get continueWatchingDefaultAction => 'Default Action';

  @override
  String get continueWatchingDefaultActionDescription =>
      'What selecting a Continue Watching or Next Up item does';

  @override
  String get goToDetailsScreen => 'Go to Details';

  @override
  String get playImmediately => 'Play immediately';

  @override
  String get nextUpMaxDays => '다음 볼 항목 최대 일수';

  @override
  String get nextUpMaxDaysDescription =>
      '마지막으로 시청한 후 프로그램이 다음 볼 항목에 유지되는 기간입니다';

  @override
  String daysValue(int days) {
    return '$days일';
  }

  @override
  String get fullScreenRows => '홈 행 크게 보기';

  @override
  String get fullScreenRowsDescription => '화면당 홈 행을 1개로 제한합니다';

  @override
  String get homeRowsPadding => '홈 행 여백';

  @override
  String get homeRowsPaddingDescription => '홈 행 사이의 여백을 사용자 지정합니다';

  @override
  String get homeRowsGenresAndStudios => '장르 및 스튜디오';

  @override
  String get homeRowsExternalLists => '외부 목록';

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
  String get showConfirmationBeforeExiting => '종료 전에 확인 표시';

  @override
  String get blockContentWithRatings => '다음 등급의 콘텐츠를 차단합니다.';

  @override
  String get noContentRatingsFound => '이 서버에는 아직 콘텐츠 등급이 없습니다.';

  @override
  String get couldNotLoadServerRatings =>
      '서버 시청 등급을 불러오지 못했습니다. 저장된 등급만 표시합니다.';

  @override
  String get couldNotRefreshRatings =>
      '서버에서 시청 등급을 새로고침하지 못했습니다. 저장된 등급을 표시합니다.';

  @override
  String get enablePinCode => 'PIN 코드 활성화';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get libraryArt => '라이브러리 아트워크';

  @override
  String get logo => '로고';

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
  String get any => '전체';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => '연령 등급 필요';

  @override
  String get onlyShowRatedContent => '등급이 지정된 콘텐츠만 표시';

  @override
  String get displayClockDuringScreensaver => '화면 보호기 동안 시계 표시';

  @override
  String get clockModeStatic => '고정';

  @override
  String get clockModeBouncing => '움직임';

  @override
  String get screensaverGeneralSettings => '일반 설정';

  @override
  String get screensaverVisualComponents => '시각 요소';

  @override
  String get screensaverLibraryContent => '라이브러리 콘텐츠';

  @override
  String get screensaverBackdrop => '배경';

  @override
  String get screensaverBackdropBlack => '검은색';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => '차분함';

  @override
  String get screensaverBackdropNeonPulse => '네온 펄스';

  @override
  String get screensaverBackdropAurora => '오로라';

  @override
  String get screensaverAdditionalComponent => '추가 요소';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin 로고';

  @override
  String get screensaverComponentRunner => '러너';

  @override
  String get screensaverComponentMovement => '요소 움직임';

  @override
  String get screensaverComponentPosition => '요소 위치';

  @override
  String get screensaverComponentSize => '요소 크기';

  @override
  String get screensaverSourceLibrariesDefault => '전체(기본값)';

  @override
  String get rottenTomatoesCritics => '로튼 토마토(비평가)';

  @override
  String get rottenTomatoesAudience => '로튼 토마토(관객)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => '메타크리틱';

  @override
  String get metacriticUser => '메타크리틱(사용자)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => '커뮤니티 평가';

  @override
  String get ratings => '평가';

  @override
  String get additionalRatings => '추가 평가';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList 및 TMDB 평가 표시';

  @override
  String get ratingLabels => '평가 라벨';

  @override
  String get showLabelsNextToIcons => '평가 아이콘 옆에 라벨 표시';

  @override
  String get ratingBadges => '평가 배지';

  @override
  String get showDecorativeBadges => '평가 뒤에 장식 배지 표시';

  @override
  String get episodeRatings => '에피소드 평가';

  @override
  String get showRatingsOnEpisodes => '개별 에피소드에 대한 평가 표시';

  @override
  String get ratingSources => '평가 소스';

  @override
  String get ratingSourcesDescription => '앱 전체에 표시되는 평가 소스를 활성화하고 재정렬합니다.';

  @override
  String get pluginDetected => '플러그인이 감지되었습니다';

  @override
  String get pluginNotDetected => '플러그인이 감지되지 않음';

  @override
  String get pluginNotDetectedDescription =>
      '서버 플러그인이 현재 감지되지 않습니다. 로컬 설정은 저장된 값이나 기본값을 계속 사용합니다.';

  @override
  String get moonbaseAddress => 'Moonbase Address';

  @override
  String get pluginConnected => '연결됨';

  @override
  String pluginConnectedVersion(String version) {
    return '연결됨, 버전 $version';
  }

  @override
  String get pluginSyncOn => '동기화 켜짐';

  @override
  String get pluginSyncOff => '동기화 꺼짐';

  @override
  String get syncProfileDescription =>
      '다른 프로필을 선택하기 전까지 이 기기는 선택한 프로필과 동기화됩니다.';

  @override
  String get profileAppliesEverywhere => '모든 기기에 적용';

  @override
  String get profileOverridesGlobal => '글로벌 설정보다 우선';

  @override
  String get profileThisDevice => '이 기기';

  @override
  String get profileLoad => '불러오기';

  @override
  String get profileLoadSubtitle => '서버 → 이 기기';

  @override
  String get profileSaveSubtitle => '이 기기 → 서버';

  @override
  String resetNamedProfile(String profile) {
    return '$profile 프로필 초기화';
  }

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
  String get upcomingMovies => '개봉 예정 영화';

  @override
  String get studios => '스튜디오';

  @override
  String get popularSeries => '인기 시리즈';

  @override
  String get seriesGenres => '시리즈 장르';

  @override
  String get upcomingSeries => '방영 예정 시리즈';

  @override
  String get networks => '네트워크';

  @override
  String get tags => '태그';

  @override
  String get genresAndTags => '장르 및 태그';

  @override
  String get seerrDiscoveryRows => 'Seerr 둘러보기 행';

  @override
  String get seerrDiscoverSliders => 'Seerr 둘러보기 슬라이더';

  @override
  String get yourWatchlist => '내 관심 목록';

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
  String get showMissingCollectionItems => '컬렉션의 누락 항목 표시';

  @override
  String get showMissingCollectionItemsDesc => '컬렉션 페이지에 라이브러리에 없는 항목도 포함합니다';

  @override
  String get showSeerrAvailabilityBadges => 'Seerr 이용 가능 배지 표시';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      '미디어 상세 페이지에 시즌별 이용 가능 배지를 표시합니다';

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
  String get seerrNotifyIssuesTitle => '문제 상태 알림';

  @override
  String get seerrNotifyIssuesSubtitle => '새 문제, 댓글, 해결 알림';

  @override
  String get seerrNotifyNewMediaTitle => '새 미디어 추가 알림';

  @override
  String get seerrNotifyNewMediaSubtitle => '서버 라이브러리에 새로 추가된 모든 항목';

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
  String get hidden => '숨김';

  @override
  String get aboutTitle => '정보';

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
  String get checkForUpdatesNow => '지금 업데이트 확인';

  @override
  String get checksLatestDesktopRelease => '이 플랫폼의 최신 데스크톱 릴리스를 확인합니다.';

  @override
  String get youAreUpToDate => '최신 버전입니다.';

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
  String get navigation => '탐색';

  @override
  String get watchedIndicatorsBackdrops => '시청 표시, 배경 이미지';

  @override
  String get focusColorWatchedIndicatorsBackdrops => '포커스 색상, 시청 표시, 배경 이미지';

  @override
  String get navbarStyleToolbarAppearance => '탐색 바 스타일, 도구 모음 버튼, 모양';

  @override
  String get featuredContentAppearance => '추천 콘텐츠, 모양';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => '이미지 캐시 한도';

  @override
  String get clearImageCache => '이미지 캐시 지우기';

  @override
  String get imageCacheCleared => '이미지 캐시를 지웠습니다';

  @override
  String get clear => '지우기';

  @override
  String get browse => '찾아보기';

  @override
  String get noResults => '결과 없음';

  @override
  String get seerrAvailableStatus => '사용 가능';

  @override
  String get seerrRequestedStatus => '요청됨';

  @override
  String get seerrDownloading => '다운로드 중';

  @override
  String seerrDownloadingSize(String done, String total) {
    return '다운로드 중 · $done / $total';
  }

  @override
  String seerrDownloadedOfTotal(String done, String total) {
    return '$done / $total';
  }

  @override
  String seerrPercentValue(int percent) {
    return '$percent%';
  }

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
  String get requestMore4k => '4K로 추가 요청';

  @override
  String get request => '요청';

  @override
  String get request4k => '4K 요청';

  @override
  String get requested4k => '4K 요청됨';

  @override
  String get cancelRequest => '요청 취소';

  @override
  String get cancelRequest4k => '4K 요청 취소';

  @override
  String get playInMoonfin => 'Moonfin에서 재생';

  @override
  String get requestedByLabel => '요청자';

  @override
  String requestedByName(String name) {
    return '$name 요청';
  }

  @override
  String get manageRequests => '요청 관리';

  @override
  String get watchlist => '관심 목록';

  @override
  String get onWatchlist => '관심 목록에 있음';

  @override
  String get approve => '승인';

  @override
  String get declineAction => '거절';

  @override
  String get similar => '비슷한 작품';

  @override
  String get recommendations => '추천';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\" 요청을 취소할까요?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\"의 요청 $count건을 취소할까요?';
  }

  @override
  String get keep => '유지';

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
  String requestSeriesOrMovie4k(String type) {
    return '4K $type 요청';
  }

  @override
  String get submitRequest => '요청 제출';

  @override
  String get allSeasons => '모든 시즌';

  @override
  String get seerrSeriesContinuing => '시리즈 계속 방영 중 · 후속 시즌을 요청할 수 있습니다';

  @override
  String get advancedOptions => '고급 옵션';

  @override
  String get noServiceServersConfigured => '구성된 서비스 서버가 없습니다.';

  @override
  String get server => '서버';

  @override
  String get qualityProfile => '품질 프로필';

  @override
  String get rootFolder => '루트 폴더';

  @override
  String get showMore => '더보기';

  @override
  String get appearances => '출연작';

  @override
  String get crewSection => '제작진';

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
  String get runtimeLabel => '상영 시간';

  @override
  String get budgetLabel => '예산';

  @override
  String get originalLanguageLabel => '원어';

  @override
  String get seasonsLabel => '시즌';

  @override
  String get episodesLabel => '에피소드';

  @override
  String get access => '액세스';

  @override
  String get add => '추가';

  @override
  String get address => '주소';

  @override
  String get analytics => '분석';

  @override
  String get catalog => '목록';

  @override
  String get content => '콘텐츠';

  @override
  String get copy => '복사';

  @override
  String get create => '만들기';

  @override
  String get disable => '비활성화';

  @override
  String get done => '완료';

  @override
  String get edit => '편집';

  @override
  String get encoding => '인코딩';

  @override
  String get error => '오류';

  @override
  String get forward => '앞으로';

  @override
  String get general => '일반';

  @override
  String get go => '이동';

  @override
  String get install => '설치';

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
  String get path => '경로';

  @override
  String get paused => '일시중지됨';

  @override
  String get permissions => '권한';

  @override
  String get processing => '처리 중';

  @override
  String get profile => '프로필';

  @override
  String get provider => '제공자';

  @override
  String get refresh => '새로 고침';

  @override
  String get remote => '원격';

  @override
  String get rename => '이름 바꾸기';

  @override
  String get revoke => '취소';

  @override
  String get role => '역할';

  @override
  String get root => '루트';

  @override
  String get run => '실행';

  @override
  String get search => '검색';

  @override
  String get select => '선택';

  @override
  String get send => '보내기';

  @override
  String get sessions => '세션';

  @override
  String get set => '설정';

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
  String get adminDrawerDashboard => '대시보드';

  @override
  String get adminDrawerAnalytics => '분석';

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
  String get adminDrawerDevices => '기기';

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
  String get adminPremiereNoteLiveTv =>
      '라이브 TV를 사용하려면 Emby Premiere가 필요합니다. Premiere가 없으면 서버가 채널을 가져오거나 녹화하지 않습니다.';

  @override
  String get adminPremiereNoteBackups =>
      '평가판 기간이 끝나면 백업 및 복원에 Emby Premiere가 필요합니다.';

  @override
  String get adminGeneralRunAtStartup => '시작 시 서버 실행';

  @override
  String get adminGeneralLaunchWebApp => '서버가 시작되면 브라우저에서 웹 앱 열기';

  @override
  String get adminGeneralBannerText => '홈 화면 배너 텍스트';

  @override
  String get adminGeneralBannerTextHelp => '모든 사용자의 홈 화면에 표시됩니다';

  @override
  String get adminGeneralSectionMaintenance => '유지 관리 모드';

  @override
  String get adminGeneralMaintenanceMode => '서버를 유지 관리 모드로 전환';

  @override
  String get adminGeneralMaintenanceModeHelp => '사용자에게는 유지 관리 메시지만 표시됩니다.';

  @override
  String get adminGeneralMaintenanceMessage => '유지 관리 메시지';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      '비워 두면 각 사용자의 언어로 된 기본 메시지가 표시됩니다.';

  @override
  String get adminGeneralSectionUpdates => '자동 업데이트';

  @override
  String get adminGeneralAutoUpdate => '서버 자동 업데이트';

  @override
  String get adminGeneralAutoRestart => '업데이트 적용을 위해 자동으로 다시 시작';

  @override
  String get adminGeneralAutoRestartHelp => '활성 사용자가 없을 때만 서버가 다시 시작됩니다.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return '시스템 이벤트 후($event)';
  }

  @override
  String get adminPluginNeedsPremiere => '14일 무료 평가판 이후 Emby Premiere 필요';

  @override
  String get adminEmbyBackupsHelp => 'Emby는 백업 및 복원 플러그인으로 백업합니다.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      '백업 및 복원 플러그인이 설치되어 있지 않습니다. 이 서버를 백업하려면 플러그인 카탈로그에서 설치하세요.';

  @override
  String get adminEmbyBackupNow => '지금 백업';

  @override
  String get adminEmbyFullBackup => '전체 백업';

  @override
  String get adminEmbyLightBackups => '데이터베이스 백업';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return '$name을(를) 복원할까요? 이 서버의 라이브러리, 설정, 사용자, 비밀번호가 대체되며 복원이 끝나면 서버가 종료됩니다. 서버를 직접 다시 시작해야 할 수도 있습니다.';
  }

  @override
  String get adminEmbyRestoreServerId => '서버 ID 복원';

  @override
  String get adminEmbyRestoreServerIdHelp => '같은 백업을 여러 서버에 복원할 때는 이 옵션을 끄세요.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      '복원이 완료되어 서버가 종료되는 중입니다. 자동으로 다시 시작되지 않으면 직접 시작하세요.';

  @override
  String get adminHiddenRemotely => '원격으로 연결할 때 로그인 화면에서 숨기기';

  @override
  String get adminHiddenFromUnusedDevices => '로그인한 적 없는 기기의 로그인 화면에서 숨기기';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      '이 사용자가 동시에 재생할 수 있는 영상 수를 제한합니다.';

  @override
  String get adminUnlimited => '무제한';

  @override
  String get adminAutoRemoteQuality => '원격 자동 품질(Mbps)';

  @override
  String get adminAutoRemoteQualityHelp =>
      '플레이어가 자동 품질로 설정된 경우 원격 연결에서 사용됩니다. 비워 두면 자동으로 감지합니다.';

  @override
  String get adminAllowCameraUpload => '카메라 업로드 허용';

  @override
  String get adminAllowSubtitleDownloading => '자막 다운로드 허용';

  @override
  String get adminAllowMediaConversion => '미디어 변환 허용';

  @override
  String get adminAllowSyncTranscoding => '트랜스코딩이 필요한 다운로드 허용';

  @override
  String get adminAllowSharingPersonalItems => '다른 사용자와 재생목록 공유 허용';

  @override
  String get adminAllowPreferenceAccess => '본인 비밀번호 및 프로필 이미지 변경 허용';

  @override
  String get adminTagMode => '태그 모드';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby Connect 사용자 이름 또는 이메일';

  @override
  String get adminEmbyConnectHelp =>
      '이 사용자가 서버 주소를 몰라도 모든 Emby 앱에서 로그인할 수 있게 합니다.';

  @override
  String get adminEmbyConnectLink => '연결';

  @override
  String get adminEmbyConnectUnlink => '연결 해제';

  @override
  String get adminEmbyConnectLinked => 'Emby Connect에 연결됨';

  @override
  String get adminEmbyConnectPending => '초대를 보냈습니다. 상대방이 수락하면 연결됩니다.';

  @override
  String get adminEmbyConnectUnlinked => 'Emby Connect 연결을 해제했습니다';

  @override
  String get adminEmbyConnectNotFound =>
      '해당 사용자 이름이나 이메일을 가진 Emby Connect 계정이 없습니다.';

  @override
  String get adminLibImportPlaylists => '재생목록 파일 가져오기';

  @override
  String get adminLibExcludeFromSearch => '전체 검색에서 제외';

  @override
  String get adminLibForcedSubtitlesOnly => '강제 자막만 다운로드';

  @override
  String get adminLibImportCollections => '메타데이터 다운로더에서 컬렉션 가져오기';

  @override
  String get adminLibThumbnailInterval => '미리보기 썸네일 간격';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return '$count초마다';
  }

  @override
  String get adminLibThumbnailAtChapters => '챕터 위치마다';

  @override
  String get adminLibSaveThumbnailsWithMedia => '미리보기 썸네일을 미디어 폴더에 저장';

  @override
  String get adminLibrarySectionMarkers => '인트로 표시';

  @override
  String get adminLibIntroDetection => '인트로 감지';

  @override
  String get adminLibIntroDetectionDuringScan => '라이브러리 스캔 중 인트로 감지';

  @override
  String get adminProviderEmbyGuide => 'Emby 편성표 데이터';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      '편성표를 선택하세요. 목록이 없으면 우편번호를 확인하세요. 편성표를 사용하려면 Emby Premiere가 필요합니다.';

  @override
  String get adminLiveTvWakeServer => '녹화를 위해 서버 깨우기';

  @override
  String get adminDrawerLiveTvChannels => '라이브 TV 채널';

  @override
  String get adminPageDescLiveTvChannels => '채널을 켜고 끄며 순서를 정합니다';

  @override
  String get adminLiveTvChannelsEmpty =>
      '아직 채널이 없습니다. 튜너를 설정하고 서버가 채널을 가져오면 여기에 표시됩니다.';

  @override
  String get adminTranscodingHwaAdvanced => '고급';

  @override
  String get adminTranscodingHwaHelp => '고급에서는 하드웨어 코덱을 선택하고 순서를 정할 수 있습니다.';

  @override
  String get adminTranscodingHwDecoders => '선호 하드웨어 디코더';

  @override
  String get adminTranscodingHwEncoders => '선호 하드웨어 인코더';

  @override
  String get adminTranscodingTempPathHelp =>
      '트랜스코더가 작업 파일을 보관하는 위치입니다. 비워 두면 서버의 데이터 폴더를 사용합니다.';

  @override
  String get adminTranscodingThrottleHelp =>
      '충분히 버퍼링되면 트랜스코딩 속도를 낮춰 CPU 사용량을 줄입니다.';

  @override
  String get adminTranscodingDownmixHelp =>
      '오디오를 다운믹스할 때 음량을 높입니다. 1이면 원래 음량을 유지합니다.';

  @override
  String get adminTranscodingFontExtraction => '실시간 글꼴 추출 허용';

  @override
  String get adminTranscodingMaxResolution => '최대 트랜스코딩 해상도';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      '앱이 요청하는 품질과 관계없이 모든 트랜스코딩에 적용되는 제한입니다.';

  @override
  String get adminTranscodingToneMapSoftware => '소프트웨어 트랜스코딩 시 톤 매핑';

  @override
  String get adminTranscodingToneMapHardware => '하드웨어 트랜스코딩 시 톤 매핑';

  @override
  String get adminTranscodingToneMapHelp =>
      'HDR 영상을 트랜스코딩할 때 어둡고 색이 바래 보이지 않게 합니다.';

  @override
  String get adminNetworkingLocalAddress => '로컬 IP 주소';

  @override
  String get adminNetworkingLocalAddressHelp =>
      '서버가 앱에 알려주는 로컬 주소입니다. 비워 두면 자동으로 감지합니다.';

  @override
  String get adminNetworkingBehindProxy => '역방향 프록시에서 HTTPS 처리';

  @override
  String get adminNetworkingExternalDomain => '외부 도메인';

  @override
  String get adminNetworkingExternalDomainHelp =>
      '원격 연결에 사용할 도메인 또는 동적 DNS 이름입니다(프로토콜과 포트 제외). 사용자 지정 인증서를 쓰려면 필요합니다.';

  @override
  String get adminNetworkingUpnp => '자동 포트 매핑 사용';

  @override
  String get adminNetworkingUpnpHelp =>
      'UPnP로 공용 포트를 로컬 포트에 매핑합니다. 일부 공유기는 지원하지 않습니다.';

  @override
  String get adminNetworkingProxyHeaders => '프록시 헤더에서 클라이언트 주소 읽기';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'X-Forwarded-For 같은 헤더로 각 클라이언트의 주소를 확인합니다. 역방향 프록시를 사용할 때만 켜세요.';

  @override
  String get adminNetworkingProxyHeadersRemote => '원격 주소가 있는 경우에만';

  @override
  String get adminNetworkingIpv4Only => '외부 요청에 IPv4 사용';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      '메타데이터 제공자 등 외부 서비스에 IPv6로 연결할 수 없을 때 사용합니다.';

  @override
  String get adminOnePerLine => '한 줄에 하나씩';

  @override
  String get adminStreamingStreamLimit => '최대 동시 영상 스트림';

  @override
  String get adminStreamingStreamLimitHelp =>
      '서버 전체에서 동시에 재생할 수 있는 영상 수입니다. 0이면 제한이 없습니다.';

  @override
  String get adminSyncJobsConversions => '변환 작업';

  @override
  String get adminSyncJobsDownloads => '다운로드 작업';

  @override
  String get adminSyncJobsEmpty => '작업 없음';

  @override
  String get adminSyncJobCancel => '작업 취소';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return '$name을(를) 취소하고 목록에서 제거할까요?';
  }

  @override
  String get adminSyncJobConverting => '변환 중';

  @override
  String get adminSyncJobReady => '전송 준비됨';

  @override
  String get adminSyncJobTransferring => '전송 중';

  @override
  String get adminSyncJobCompletedWithError => '오류와 함께 완료됨';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '항목 $count개',
      one: '항목 1개',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => '데이터베이스';

  @override
  String get adminPageDescDatabase => '캐시 크기 및 유지 관리';

  @override
  String get adminDatabaseWarning => '고급 옵션입니다. 바꿀 이유가 없다면 기본값으로 두세요.';

  @override
  String get adminDatabaseCacheSize => '데이터베이스 캐시 크기(MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      '서버가 각 데이터베이스 파일을 메모리에 얼마나 보관할지 정합니다. 늘리면 서버가 빨라질 수 있습니다. 다시 시작한 후 적용됩니다.';

  @override
  String get adminDatabaseOptimize => '서버 종료 시 데이터베이스 최적화';

  @override
  String get adminDatabaseOptimizeHelp =>
      '대부분은 아무 작업도 하지 않지만, 가끔 서버의 쿼리에 도움이 되는 분석을 실행합니다. 종료 시간이 길어질 수 있습니다.';

  @override
  String get adminDatabaseAnalysisLimit => '분석 행 제한';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      '최적화 단계에서 각 인덱스를 대략 몇 행까지 읽을지 정합니다. 많을수록 효과가 좋지만 종료가 느려질 수 있습니다.';

  @override
  String get adminDatabaseVacuum => '다음 시작 시 데이터베이스 정리(VACUUM)';

  @override
  String get adminDatabaseVacuumHelp =>
      '데이터베이스 파일을 다시 만들어 공간을 최소화하며 성능 향상에 도움이 될 수 있습니다. 실행 중에는 서버를 사용할 수 없고 진행 상황도 표시되지 않으니 강제로 종료하지 마세요. 해당 시작 이후에는 자동으로 다시 꺼집니다.';

  @override
  String get adminDrawerCinemaIntros => '시네마 인트로';

  @override
  String get adminPageDescCinemaIntros => '재생 전 예고편 및 인트로';

  @override
  String get adminCinemaIntrosPlayBefore => '인트로 재생 대상';

  @override
  String get adminCinemaIntrosUpcoming => '신작 및 개봉 예정 영화의 예고편 포함';

  @override
  String get adminCinemaIntrosOlder => '오래된 영화의 예고편 포함';

  @override
  String get adminCinemaIntrosLibrary => '내 라이브러리에 있는 영화의 예고편 포함';

  @override
  String get adminCinemaIntrosLibraryHelp => '로컬 예고편을 설정해야 합니다.';

  @override
  String get adminCinemaIntrosCount => '재생할 예고편 수';

  @override
  String get adminCinemaIntrosParental => '스마트 자녀 보호';

  @override
  String get adminCinemaIntrosParentalHelp =>
      '시청 중인 콘텐츠와 같거나 낮은 등급의 예고편만 고릅니다.';

  @override
  String get adminCinemaIntrosUnwatchedOnly => '시청하지 않은 콘텐츠 전에만 인트로 재생';

  @override
  String get adminCinemaIntrosSimilarOnly => '시청 중인 콘텐츠와 비슷한 예고편만 재생';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      '공통된 장르, 태그, 스튜디오 등을 기준으로 합니다.';

  @override
  String get adminCinemaIntrosCustom => '사용자 지정 인트로';

  @override
  String get adminCinemaIntrosCustomPath => '사용자 지정 인트로 폴더';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      '영상이 들어 있는 폴더입니다. 그중 하나가 무작위로 선택되어 예고편 다음에 재생됩니다.';

  @override
  String get adminCinemaIntrosCodecPath => '코덱 인트로 폴더';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      '영상이 들어 있는 폴더입니다. 파일 이름이 비디오 코덱, 오디오 코덱, 오디오 프로필 또는 태그와 일치하는 영상이 본편 전에 재생됩니다.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To 및 DLNA 서버';

  @override
  String get adminDlnaPlayTo => 'DLNA Play To 사용';

  @override
  String get adminDlnaPlayToHelp => 'Emby가 네트워크의 기기를 찾아 원격으로 제어할 수 있습니다.';

  @override
  String get adminDlnaServer => 'DLNA 서버 사용';

  @override
  String get adminDlnaServerHelp => '서버가 DLNA 기기로 미디어를 스트리밍할 수 있게 합니다.';

  @override
  String get adminDlnaDefaultUser => '기본 사용자';

  @override
  String get adminDlnaDefaultUserHelp =>
      '연결된 기기에 표시할 라이브러리의 사용자입니다. 기기 프로필에서 따로 지정할 수 있습니다.';

  @override
  String get adminDlnaDebugLog => 'DLNA 디버그 로그 사용';

  @override
  String get adminDlnaDebugLogHelp => '로그 파일이 매우 커집니다. 문제를 해결할 때만 켜세요.';

  @override
  String get adminDrawerCameraUpload => '카메라 업로드';

  @override
  String get adminPageDescCameraUpload => '휴대폰 사진을 저장할 위치';

  @override
  String get adminCameraUploadPath => '카메라 업로드 폴더';

  @override
  String get adminCameraUploadPathHelp =>
      '비워 두면 기본 폴더를 사용합니다. 사용자 지정 폴더는 라이브러리로도 추가해야 합니다.';

  @override
  String get adminCameraUploadSubfolders => '기기별 하위 폴더 만들기';

  @override
  String get adminDrawerConversions => '변환';

  @override
  String get adminPageDescConversions => '변환된 미디어 및 다운로드';

  @override
  String get adminConversionsTempPath => '임시 파일 폴더';

  @override
  String get adminConversionsTempPathHelp => '변환하는 동안 미디어를 보관하는 위치입니다.';

  @override
  String get adminConversionsFullSpeed => '최대 속도로 변환';

  @override
  String get adminConversionsFullSpeedHelp => '기본적으로 부하를 줄이기 위해 변환을 느리게 실행합니다.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => '라이선스 상태 및 키';

  @override
  String get adminPremiereActive => '이 서버에서 Premiere가 활성화되어 있습니다.';

  @override
  String get adminPremiereInactive => '이 서버에 Premiere 키가 없습니다.';

  @override
  String get adminPremiereKeyInvalid =>
      '키가 설정되어 있지만 활성화되지 않았습니다. 잘못 입력했거나 만료되었을 수 있습니다.';

  @override
  String get adminPremiereCurrentKey => '현재 키';

  @override
  String get adminPremiereNewKey => '새 키';

  @override
  String get adminPremiereNewKeyHint => 'Emby Premiere 이메일에 있는 키를 붙여 넣으세요.';

  @override
  String get adminPremiereSaveKey => '키 저장';

  @override
  String get adminPremiereRemoveKey => '키 제거';

  @override
  String get adminPremiereKeyRejected => 'Emby가 키를 저장했지만 승인하지 않았습니다.';

  @override
  String get adminPremiereLoadFailed => 'Premiere 상태를 불러오지 못했습니다';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere 필요';

  @override
  String get embyPremiereRequiredBody =>
      '이 기능을 사용하려면 서버에 활성화된 Emby Premiere 구독이 필요합니다.';

  @override
  String get embyPremiereRequiredSaveBody =>
      '이 기능을 사용하려면 활성화된 Emby Premiere 구독이 필요합니다. 설정은 저장되지만 Premiere가 활성화될 때까지 사용되지 않습니다.';

  @override
  String get embyPremiereLearnMore => '자세히 알아보기';

  @override
  String get embyPremiereSaveAnyway => '그래도 저장';

  @override
  String get embyPremiereEnterKey => '키 입력';

  @override
  String get adminPremiereNote =>
      'Emby Premiere가 필요합니다. 서버는 이 설정을 저장하지만 Premiere가 활성화될 때까지 사용하지 않습니다.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name ID';
  }

  @override
  String get adminExternalIdTypePerson => '인물';

  @override
  String get adminExternalIdTypeArtist => '아티스트';

  @override
  String get adminExternalIdTypeAlbumArtist => '앨범 아티스트';

  @override
  String get adminExternalIdTypeOtherArtist => '기타 아티스트';

  @override
  String get adminExternalIdTypeReleaseGroup => '릴리스 그룹';

  @override
  String get adminExternalIdTypeBook => '도서';

  @override
  String get adminPlaybackHwAccelWarning =>
      '일부 시스템에서는 하드웨어 가속이 불안정할 수 있습니다. 운영체제와 비디오 드라이버를 최신 상태로 유지하고, 영상이 재생되지 않으면 \'없음\'으로 되돌리세요.';

  @override
  String get adminLibMetadataChangeHelp =>
      '메타데이터 설정 변경은 새 콘텐츠에 적용됩니다. 기존 콘텐츠를 업데이트하려면 상세 페이지에서 새로 고치거나 라이브러리를 새로 고치세요.';

  @override
  String get adminLibFetcherSettings => '수집기 설정';

  @override
  String adminLibImageOptionsTitle(String type) {
    return '$type 이미지 옵션';
  }

  @override
  String get adminLibFetchImages => '이미지 가져오기';

  @override
  String get adminLibMaxBackdrops => '항목당 최대 배경 이미지 수';

  @override
  String get adminLibMinBackdropWidth => '배경 이미지 최소 다운로드 너비';

  @override
  String get adminImageTypeArt => '클리어아트';

  @override
  String get adminImageTypeBox => '패키지';

  @override
  String get adminImageTypeBoxRear => '패키지(뒷면)';

  @override
  String get adminImageTypeDisc => '디스크';

  @override
  String get adminImageTypeMenu => '메뉴';

  @override
  String get adminActivityMediaDetails => '미디어 정보';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      '예: 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => '원어';

  @override
  String get adminMetadataFieldDateAdded => '추가된 날짜';

  @override
  String get adminMetadataFieldArtists => '아티스트';

  @override
  String get adminMetadataFieldAlbumArtists => '앨범 아티스트';

  @override
  String get adminMetadataFieldAlbum => '앨범';

  @override
  String get adminMetadataFieldSeriesName => '시리즈 이름';

  @override
  String get adminMetadataFieldEpisodeNumber => '에피소드 번호';

  @override
  String get adminMetadataFieldSeasonNumber => '시즌 번호';

  @override
  String get adminMetadataFieldTrackNumber => '트랙 번호';

  @override
  String get adminMetadataFieldDiscNumber => '디스크 번호';

  @override
  String get adminMetadataFieldAirTime => '방영 시간';

  @override
  String get adminMetadataFieldRuntime => '상영 시간(분)';

  @override
  String get adminMetadataFieldPlaceOfBirth => '출생지';

  @override
  String get adminMetadataFieldBirthDate => '생년월일';

  @override
  String get adminMetadataFieldBirthYear => '출생 연도';

  @override
  String get adminMetadataFieldDeathDate => '사망일';

  @override
  String get adminMetadataFieldAspectRatio => '원본 화면비';

  @override
  String get adminMetadataFieldAirsBeforeSeason => '다음 시즌 이전에 방영';

  @override
  String get adminMetadataFieldAirsAfterSeason => '다음 시즌 이후에 방영';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => '다음 에피소드 이전에 방영';

  @override
  String get adminMetadataNamesHelp => '여러 이름은 세미콜론(;)으로 구분하세요.';

  @override
  String get adminMetadataSectionRatings => '등급 및 평가';

  @override
  String get adminMetadataItemLocked =>
      '이 항목의 메타데이터가 잠겨 있습니다. 식별하기 전에 잠금을 해제하세요.';

  @override
  String get adminMetadataNameOrIdRequired => '이름이나 외부 ID를 입력하세요.';

  @override
  String get adminLibMetadataReaders => '메타데이터 리더';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return '비슷한 항목 제공자: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => '미디어 구간 제공자';

  @override
  String get adminLibEnableLibrary => '라이브러리 사용';

  @override
  String get adminLibEnableLibraryHelp => '라이브러리를 끄면 모든 사용자 화면에서 숨겨집니다.';

  @override
  String get adminLibSaveLyricsWithMedia => '가사를 미디어 폴더에 저장';

  @override
  String get adminLibUseCustomTagDelimiters => '사용자 지정 태그 구분자 사용';

  @override
  String get adminLibCustomTagDelimiters => '사용자 지정 태그 구분자';

  @override
  String get adminLibCustomTagDelimitersHelp => '태그를 나누는 구분자로 사용할 문자입니다.';

  @override
  String get adminLibDelimiterWhitelist => '구분자 예외 목록';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      '태그 분리에서 제외할 항목입니다. 한 줄에 하나씩 입력하세요.';

  @override
  String get adminLibDownloadLanguages => '다운로드 언어';

  @override
  String get adminLibraryFolderRequired => '이 라이브러리에 폴더를 하나 이상 추가하세요.';

  @override
  String get adminRenameLibraryWarning =>
      '라이브러리 이름을 바꾸면 모든 메타데이터가 사라집니다. 신중하게 진행하세요.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return '\"$name\" 라이브러리를 제거할까요? 디스크의 파일은 삭제되지 않습니다.';
  }

  @override
  String get adminDeleteLibraryLocations => '다음 미디어 위치가 라이브러리에서 제거됩니다:';

  @override
  String get adminRefreshMode => '새로 고침 방식';

  @override
  String get adminRefreshModeScan => '새 파일 및 변경된 파일 스캔';

  @override
  String get adminRefreshModeMissing => '누락된 메타데이터 검색';

  @override
  String get adminReplaceTrickplayImages => '기존 Trickplay 이미지 바꾸기';

  @override
  String get adminRefreshDialogHelp =>
      '대시보드에서 사용하도록 설정한 설정과 인터넷 서비스에 따라 메타데이터를 새로 고칩니다.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$total개 중 $shown개';
  }

  @override
  String get adminLiveTvTabSources => '튜너 및 편성표';

  @override
  String get adminLiveTvTabRecordings => '녹화';

  @override
  String get adminLiveTvAddTuner => '튜너 장치 추가';

  @override
  String get adminLiveTvEditTuner => '튜너 장치 편집';

  @override
  String get adminLiveTvTunerType => '튜너 유형';

  @override
  String get adminLiveTvDetectDevices => '내 장치 감지';

  @override
  String get adminLiveTvNoNewDevices => '새 장치를 찾지 못했습니다';

  @override
  String get adminLiveTvDrmNote => 'DRM이 적용된 채널은 가져오지 않습니다.';

  @override
  String get adminLiveTvTunerSaved => '튜너를 저장했습니다';

  @override
  String get adminLiveTvDeleteTuner => '튜너 장치 삭제';

  @override
  String get adminLiveTvDeleteTunerConfirm => '이 튜너 장치를 삭제할까요?';

  @override
  String get adminLiveTvDeleteProvider => '편성표 제공자 삭제';

  @override
  String get adminLiveTvDeleteProviderConfirm => '이 편성표 제공자를 삭제할까요?';

  @override
  String get adminLiveTvProviderSaved => '편성표 제공자를 저장했습니다';

  @override
  String get adminLiveTvAddProvider => '제공자 추가';

  @override
  String get adminLiveTvRefreshGuide => '편성표 데이터 새로 고침';

  @override
  String get adminLiveTvMapChannels => '채널 매핑';

  @override
  String get adminLiveTvNoTunerChannels => '튜너 채널을 찾을 수 없습니다';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'XMLTV 파일의 경로나 URL입니다. 서버가 파일을 읽고 업데이트를 확인합니다. 파일의 생성과 업데이트는 직접 관리해야 합니다.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return '$url에서 계정 만들기';
  }

  @override
  String get adminLiveTvSdSignIn => '로그인';

  @override
  String get adminLiveTvSdLineup => '편성표';

  @override
  String get adminLiveTvSdSelectLineup =>
      '편성표를 선택하세요. 목록이 없으면 사용자 이름, 비밀번호, 우편번호를 확인하세요.';

  @override
  String get adminLiveTvGuideDays => '다운로드할 편성표 데이터 일수';

  @override
  String get adminLiveTvGuideDaysHelp =>
      '일수를 늘리면 더 먼 일정까지 예약하고 더 많은 편성표를 볼 수 있지만 다운로드 시간이 길어집니다. 자동은 채널 수에 따라 값을 정합니다.';

  @override
  String get adminLiveTvRecordingPath => '기본 녹화 경로';

  @override
  String get adminLiveTvRecordingPathHelp =>
      '녹화가 저장되는 위치입니다. 비워 두면 서버의 프로그램 데이터 폴더를 사용합니다.';

  @override
  String get adminLiveTvStartWhenPossible => '가능하면 시작';

  @override
  String get adminLiveTvStopWhenPossible => '가능하면 종료';

  @override
  String get adminLiveTvMinutesBefore => '분 전';

  @override
  String get adminLiveTvMinutesAfter => '분 후';

  @override
  String get adminLiveTvSectionGuide => '편성표 데이터';

  @override
  String get adminLiveTvSectionDefaultRecording => '기본 녹화 설정';

  @override
  String get adminLiveTvSectionMetadata => '녹화 메타데이터';

  @override
  String adminUserLastActivity(String time) {
    return '마지막 활동: $time';
  }

  @override
  String get adminCurrentPassword => '현재 비밀번호';

  @override
  String get adminChannelAccess => '채널 액세스';

  @override
  String get adminDeviceAccess => '기기 액세스';

  @override
  String get adminDeleteFromAllLibraries => '모든 라이브러리';

  @override
  String get adminUserDisabledBanner =>
      '비활성화된 사용자입니다. 다시 로그인할 수 있게 하려면 권한에서 \'비활성화\'를 끄세요.';

  @override
  String get adminNewPasswordEmpty => '새 비밀번호는 비워 둘 수 없습니다';

  @override
  String get adminScheduleStartBeforeEnd => '시작 시간은 종료 시간보다 빨라야 합니다';

  @override
  String get adminDashboardAlerts => '알림';

  @override
  String get adminSessionGoHome => '홈 화면으로 이동';

  @override
  String get adminPlayMethodRemux => '리먹스 중';

  @override
  String get adminPlayMethodDirectStream => '다이렉트 스트리밍 중';

  @override
  String get adminPlayMethodDirectPlay => '다이렉트 재생 중';

  @override
  String get adminLogLevelTrace => '추적';

  @override
  String get adminLogLevelDebug => '디버그';

  @override
  String get adminLogLevelInformation => '정보';

  @override
  String get adminLogLevelWarning => '경고';

  @override
  String get adminLogLevelError => '오류';

  @override
  String get adminLogLevelCritical => '심각';

  @override
  String get adminLogLevelNone => '없음';

  @override
  String get adminActivityAllUsers => '모든 사용자';

  @override
  String adminTaskLastRan(String time, String duration) {
    return '마지막 실행: $time, 소요 시간: $duration';
  }

  @override
  String get adminTaskResultFailed => '실패';

  @override
  String get adminTaskResultCancelled => '취소됨';

  @override
  String get adminTaskResultAborted => '서버 종료로 중단됨';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '$seconds초';
  }

  @override
  String get adminDeleteTaskTrigger => '작업 트리거 삭제';

  @override
  String get adminDeleteTaskTriggerConfirm => '이 작업 트리거를 삭제할까요?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return '$minutes분마다';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return '$hours시간마다';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes분';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours시간';
  }

  @override
  String get adminTimeLimitHours => '시간 제한(시간)';

  @override
  String get adminTranscodingDecodingFor => '하드웨어 디코딩 사용 대상';

  @override
  String get adminTranscodingThreadCountHelp =>
      '트랜스코딩에 사용할 최대 스레드 수입니다. 줄이면 CPU 사용량이 줄지만 원활한 재생에 너무 느릴 수 있습니다.';

  @override
  String get adminTranscodingThreadMax => '최대';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg 경로';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      '서버가 실행하는 FFmpeg입니다. 여기가 아니라 서버에서 설정합니다.';

  @override
  String get adminTranscodingAudioSeek => '오디오 탐색 방식';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'HLS 스트림에서 탐색할 때 서버가 오디오를 처리하는 방식입니다.';

  @override
  String get adminTranscodingTrimCopiedAudio => '복사된 오디오 자르기';

  @override
  String get adminTranscodingTranscodeAudio => '오디오 트랜스코딩';

  @override
  String get adminResumeMinAudiobookMinutes => '오디오북 이어듣기 최소 시간(분)';

  @override
  String get adminResumeMinAudiobookHelp =>
      '이 시간 전에 멈춘 오디오북은 재생하지 않은 것으로 간주합니다.';

  @override
  String get adminResumeAudiobookRemaining => '오디오북 이어듣기 남은 시간(분)';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      '남은 시간이 이보다 적을 때 멈춘 오디오북은 재생한 것으로 간주합니다.';

  @override
  String get adminBrandingSplashSection => '시작 화면';

  @override
  String get adminBrandingSectionWebClient => '웹 클라이언트';

  @override
  String get adminBrandingSplashSizeHint =>
      '사용자 지정 이미지는 16:9 비율, 최소 1920x1080 크기여야 합니다.';

  @override
  String get adminNetworkingSectionServerAddress => '서버 주소 설정';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS 설정';

  @override
  String get adminNetworkingSectionRemoteAccess => '원격 액세스 설정';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP 프로토콜';

  @override
  String get adminNetworkingSectionDiscovery => '네트워크 검색';

  @override
  String get adminNetworkingSectionFirewall => '방화벽 및 프록시 설정';

  @override
  String get adminNetworkingLocalHttpPort => '로컬 HTTP 포트 번호';

  @override
  String get adminNetworkingLocalHttpPortHelp => 'HTTP 서버의 TCP 포트 번호입니다.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'HTTPS 포트에서 연결을 받습니다. 적용하려면 유효한 인증서도 설정해야 합니다.';

  @override
  String get adminNetworkingLocalHttpsPort => '로컬 HTTPS 포트 번호';

  @override
  String get adminNetworkingLocalHttpsPortHelp => 'HTTPS 서버의 TCP 포트 번호입니다.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      '서버 URL에 하위 디렉터리를 추가합니다. 예: https://example.com/jellyfin';

  @override
  String get adminNetworkingBindAddress => '로컬 네트워크 주소에 바인딩';

  @override
  String get adminNetworkingBindAddressHelp =>
      'HTTP 서버의 로컬 IP 주소를 직접 지정합니다. 비워 두면 모든 주소에 바인딩합니다. 변경하면 다시 시작해야 합니다.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      '대역폭 및 원격 액세스 제한에서 로컬로 취급할 네트워크의 IP 주소 또는 IP/넷마스크입니다. 비워 두면 모든 RFC1918 주소를 로컬로 취급합니다.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      '이 서버 앞에 있는 프록시의 IP 주소 또는 호스트 이름입니다. X-Forwarded-For 헤더를 읽으려면 필요합니다. 변경하면 다시 시작해야 합니다.';

  @override
  String get adminNetworkingCustomCertPath => '사용자 지정 SSL 인증서 경로';

  @override
  String get adminNetworkingCertPathHelp =>
      '사용자 지정 도메인의 TLS에 사용할 인증서와 개인 키가 담긴 PKCS #12 파일 경로입니다.';

  @override
  String get adminNetworkingCertPasswordHelp => '인증서에 비밀번호가 있으면 입력하세요.';

  @override
  String get adminNetworkingAllowRemote => '이 서버에 대한 원격 연결 허용';

  @override
  String get adminNetworkingAllowRemoteHelp => '끄면 모든 원격 연결이 차단됩니다.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      '원격 네트워크의 IP 주소 또는 IP/넷마스크입니다. 비워 두면 모든 원격 주소를 허용합니다.';

  @override
  String get adminNetworkingRemoteIpFilterMode => '원격 IP 주소 필터 모드';

  @override
  String get adminNetworkingPublicHttpPortHelp => '로컬 HTTP 포트에 매핑된 공용 포트입니다.';

  @override
  String get adminNetworkingPublicHttpsPortHelp => '로컬 HTTPS 포트에 매핑된 공용 포트입니다.';

  @override
  String get adminNetworkingAutoDiscoveryLabel => '자동 검색 사용';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      '앱이 UDP 포트 7359에서 이 서버를 찾을 수 있게 합니다.';

  @override
  String get adminNetworkingSamePublishedUri => '내부 및 외부 접속에 같은 게시 서버 URI 사용';

  @override
  String get adminNetworkingPublishedUri => '게시 서버 URI';

  @override
  String get adminNetworkingPublishedUriHelp =>
      '인터페이스나 클라이언트 IP 주소에 따라 서버가 알려주는 URI를 직접 지정합니다.';

  @override
  String get adminNetworkingInternalUri => '내부 URI';

  @override
  String get adminNetworkingInternalUriHelp => '내부 접속용 게시 서버 URI입니다.';

  @override
  String get adminNetworkingExternalUri => '외부 URI';

  @override
  String get adminNetworkingExternalUriHelp => '외부 접속용 게시 서버 URI입니다.';

  @override
  String get adminNetworkingOtherPublishedUris => '기타 게시 URI';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      '특정 서브넷이나 인터페이스용 URI입니다. 서브넷=URI 형식으로 입력하세요.';

  @override
  String get adminBackupsHelp =>
      '서버 스냅샷을 만들고 복원합니다. 데이터베이스, 메타데이터, 자막, Trickplay 이미지를 포함할 수 있습니다.';

  @override
  String get adminBackupDisclaimer => '라이브러리 크기에 따라 백업에 시간이 걸릴 수 있습니다.';

  @override
  String get adminBackupTasksWarningTitle => '예약된 작업이 실행 중입니다';

  @override
  String get adminBackupTasksWarning => '백업을 만들기 전에 이 작업을 중지하거나 끝날 때까지 기다리세요.';

  @override
  String get adminBackupArchiveNotFound => '서버에서 이 백업 파일을 찾을 수 없습니다.';

  @override
  String get adminRestoreInProgress => '복원 진행 중';

  @override
  String get adminRestoreWaitingForServer => '서버가 다시 시작되기를 기다리는 중입니다.';

  @override
  String get adminRestoreSucceeded => '복원 완료';

  @override
  String get adminLogWatch => '실시간 보기';

  @override
  String get adminLogStopWatching => '실시간 보기 중지';

  @override
  String get adminPluginInstallConfirmTitle => '플러그인 설치 확인';

  @override
  String get adminPluginInstallDisclaimer =>
      '서드파티 플러그인 설치에는 위험이 따릅니다. 불안정하거나 악성인 코드가 포함될 수 있으며 언제든지 바뀔 수 있습니다. 신뢰할 수 있는 개발자의 플러그인만 설치하고, 외부 서비스 조회, 라이브러리 스캔 지연, 백그라운드 작업 추가 등 플러그인이 할 수 있는 일을 확인하세요.';

  @override
  String get adminGroupOverview => '개요';

  @override
  String get adminGroupLibrary => '라이브러리';

  @override
  String get adminGroupPlayback => '재생';

  @override
  String get adminGroupPeople => '사용자';

  @override
  String get adminGroupSystem => '시스템';

  @override
  String get adminAreasLabel => '관리 영역';

  @override
  String get adminPagesLabel => '페이지';

  @override
  String get adminPageDescDashboard => '서버 상태, 세션 및 최근 활동';

  @override
  String get adminPageDescAnalytics => '라이브러리 크기, 코덱 및 형식';

  @override
  String get adminPageDescActivity => '서버에서 일어난 모든 일';

  @override
  String get adminPageDescTasks => '스캔, 정리 작업 및 트리거';

  @override
  String get adminPageDescLibraries => '폴더, 스캐너 및 메타데이터 수집기';

  @override
  String get adminPageDescDisplay => '사용자에게 라이브러리를 표시하는 방식';

  @override
  String get adminPageDescMetadata => '기본 언어, 국가 및 이미지';

  @override
  String get adminPageDescNfo => 'Kodi NFO 읽기 및 저장';

  @override
  String get adminPageDescLiveTv => '튜너, 편성표 데이터 및 녹화';

  @override
  String get adminPageDescTranscoding => '하드웨어 가속, 인코더, 톤 매핑';

  @override
  String get adminPageDescResume => '항목을 시작함 또는 재생함으로 간주하는 기준';

  @override
  String get adminPageDescStreaming => '원격 비트 전송률 제한';

  @override
  String get adminPageDescTrickplay => '탐색 미리보기 썸네일';

  @override
  String get adminPageDescUsers => '계정, 액세스 및 자녀 보호';

  @override
  String get adminPageDescDevices => '로그인한 기기 및 이름';

  @override
  String get adminPageDescApiKeys => '앱 및 스크립트용 키';

  @override
  String get adminPageDescSettings => '서버 이름, 언어, 경로, 성능';

  @override
  String get adminPageDescBranding => '로그인 메시지, 사용자 정의 CSS, 시작 화면';

  @override
  String get adminPageDescNetworking => '포트, HTTPS, LAN 및 원격 액세스';

  @override
  String get adminPageDescPlugins => '설치된 플러그인 및 카탈로그';

  @override
  String get adminPageDescRepositories => '플러그인을 가져오는 곳';

  @override
  String get adminPageDescBackups => '서버 백업 생성 및 복원';

  @override
  String get adminPageDescLogs => '서버 로그 파일';

  @override
  String adminSearchSettingsHint(int count) {
    return '설정 $count개 검색';
  }

  @override
  String get adminSearchNoResults => '일치하는 설정이 없습니다';

  @override
  String get adminSearchClear => '검색 지우기';

  @override
  String get adminUnsavedChanges => '저장하지 않은 변경 사항';

  @override
  String get adminDiscard => '버리기';

  @override
  String get adminLeaveTitle => '저장하지 않은 변경 사항을 버릴까요?';

  @override
  String get adminLeaveMessage => '이 페이지의 변경 사항이 아직 저장되지 않았습니다.';

  @override
  String get adminKeepEditing => '계속 편집';

  @override
  String get adminDashboardLoadFailed => '대시보드를 로드하지 못했습니다.';

  @override
  String get adminMediaOverview => '미디어 개요';

  @override
  String get adminMediaTotalsError => '서버 미디어 총계를 로드할 수 없습니다.';

  @override
  String get adminMediaOverviewSubtitle => '이 서버에 있는 콘텐츠 규모를 한눈에 보여줍니다.';

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
  String get analyticsMediaDistribution => '미디어 분포';

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
  String get analyticsRuntimeBuckets => '재생 시간 분포';

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
  String get adminLibraryScanStarted => '라이브러리 스캔이 시작되었습니다.';

  @override
  String errorGeneric(String error) {
    return '오류: $error';
  }

  @override
  String get adminServerRebootInProgress => '서버 재부팅 진행 중';

  @override
  String get adminServerRebootMessage => '서버 재부팅이 진행 중입니다. Moonfin을 다시 시작해주세요.';

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
  String get sessionVolumeDown => '음량 -';

  @override
  String get sessionVolumeUp => '음량 +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => '지금 재생 중';

  @override
  String get volume => '음량';

  @override
  String get actions => '작업';

  @override
  String get videoCodec => '비디오 코덱';

  @override
  String get audioCodec => '오디오 코덱';

  @override
  String get hwAccel => '하드웨어 가속';

  @override
  String get completion => '진행률';

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
  String get adminEditDeviceName => '기기 이름 편집';

  @override
  String get adminCustomName => '맞춤 이름';

  @override
  String get adminDeviceNameUpdated => '기기 이름이 업데이트되었습니다.';

  @override
  String adminDeviceUpdateFailed(String error) {
    return '기기를 업데이트하지 못했습니다: $error';
  }

  @override
  String get adminDeleteDevice => '기기 삭제';

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
  String get adminThisDevice => '이 기기';

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
    return '스캔을 시작하지 못했습니다: $error';
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
  String get adminLibraryLoadFailed => '라이브러리를 로드하지 못했습니다.';

  @override
  String get adminNoMediaPaths => '구성된 미디어 경로가 없습니다.';

  @override
  String get adminAddPath => '경로 추가';

  @override
  String get adminBrowseFilesystem => '서버 파일 시스템 찾아보기:';

  @override
  String get adminPreferredMetadataLanguage => '선호하는 메타데이터 언어';

  @override
  String get adminMetadataLanguageHint => '예: en, de, fr';

  @override
  String get adminMetadataCountryCode => '메타데이터 국가 코드';

  @override
  String get adminMetadataCountryHint => '예: US, DE, FR';

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
  String get adminLibDateAddedImport => '라이브러리에 스캔된 날짜';

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
  String get adminLibChapterImagesDuringScan => '라이브러리 스캔 중 챕터 이미지 추출';

  @override
  String get adminLibTrickplayExtraction => 'Trickplay 이미지 추출 사용';

  @override
  String get adminLibTrickplayDuringScan => '라이브러리 스캔 중 Trickplay 이미지 추출';

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
  String get adminLibraryName => '라이브러리 이름';

  @override
  String get adminSelectedPaths => '선택한 경로:';

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
  String adminSaveFailed(String error) {
    return '저장하지 못했습니다: $error';
  }

  @override
  String get adminPasswordsMismatch => '비밀번호가 일치하지 않습니다.';

  @override
  String adminFailed(String error) {
    return '실패: $error';
  }

  @override
  String get adminUserLoadFailed => '사용자를 로드하지 못했습니다.';

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
  String get adminAllowRemuxing => '리먹스 허용';

  @override
  String get adminForceRemoteTranscoding => '원격 소스 트랜스코딩 강제';

  @override
  String get adminAllowContentDownloading => '콘텐츠 다운로드 허용';

  @override
  String get adminAllowPublicSharing => '공개 공유 허용';

  @override
  String get adminAllowRemoteControl => '다른 사용자의 원격 제어 허용';

  @override
  String get adminAllowSharedDeviceControl => '공유 기기 제어 허용';

  @override
  String get adminAllowRemoteAccess => '원격 액세스 허용';

  @override
  String get adminLeaveEmptyNoLimit => '제한하지 않으려면 비워 두세요';

  @override
  String get adminMaxActiveSessions => '최대 활성 세션';

  @override
  String get adminAllowLiveTvAccess => '라이브 TV 액세스 허용';

  @override
  String get adminAllowLiveTvManagement => '라이브 TV 관리 허용';

  @override
  String get adminAllowCollectionManagement => '컬렉션 관리 허용';

  @override
  String get adminAllowSubtitleManagement => '자막 관리 허용';

  @override
  String get adminAllowLyricManagement => '가사 관리 허용';

  @override
  String get adminEnableAllLibraryAccess => '모든 라이브러리에 대한 액세스 활성화';

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
  String get adminLibraryAccess => '라이브러리 접근 권한';

  @override
  String get adminEnableAllDevices => '모든 기기에 대한 액세스 활성화';

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
  String get adminUnratedLiveTvChannel => '라이브 TV';

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
  String get adminAuthProvider => '인증 제공자';

  @override
  String get adminPasswordResetProvider => '비밀번호 재설정 제공자';

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
  String get restore => '복원';

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
  String get continueAction => '계속';

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
  String get adminRepositoryNameHint => '예: Jellyfin Stable';

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
  String get adminBrandingLoadFailed => '브랜딩 설정을 로드하지 못했습니다.';

  @override
  String get adminLoginDisclaimer => '로그인 면책조항';

  @override
  String get adminLoginDisclaimerHint => '로그인 양식 아래에 표시되는 HTML';

  @override
  String get adminCustomCss => '맞춤 CSS';

  @override
  String get adminCustomCssHint => '웹 인터페이스에 적용할 사용자 정의 CSS';

  @override
  String get adminEnableSplashScreen => '스플래시 화면 활성화';

  @override
  String get adminStreamingLoadFailed => '스트리밍 설정을 로드하지 못했습니다.';

  @override
  String get adminStreamingDescription => '원격 연결에 대한 전역 스트리밍 비트 전송률 제한을 설정합니다.';

  @override
  String get adminRemoteBitrateLimitMbps => '원격 클라이언트 비트 전송률 제한(Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => '무제한으로 하려면 비워 두거나 0을 입력하세요';

  @override
  String get adminPlaybackLoadFailed => '재생 설정을 로드하지 못했습니다.';

  @override
  String get adminHardwareAcceleration => '하드웨어 가속';

  @override
  String get adminVaapiDevice => 'VA-API 장치';

  @override
  String get adminEnableHardwareEncoding => '하드웨어 인코딩 활성화';

  @override
  String get adminEnableHardwareDecoding => '하드웨어 디코딩 사용 대상:';

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
  String get adminTileWidth => '타일 너비';

  @override
  String get adminTileHeight => '타일 높이';

  @override
  String get adminQualitySubtitle => '낮은 값 = 더 나은 품질, 더 큰 파일';

  @override
  String get adminProcessThreads => '프로세스 스레드';

  @override
  String get adminResumeLoadFailed => '이어보기 설정을 로드하지 못했습니다.';

  @override
  String get adminResumeDescription =>
      '콘텐츠가 부분적으로 재생되거나 완전히 재생된 것으로 표시되어야 하는 시점을 구성합니다.';

  @override
  String get adminMinResumePercentage => '최소 이어보기 비율';

  @override
  String get adminMinResumeSubtitle => '진행 상황을 저장하려면 콘텐츠를 이 비율 이상으로 재생해야 합니다.';

  @override
  String get adminMaxResumePercentage => '최대 이어보기 비율';

  @override
  String get adminMaxResumeSubtitle => '이 비율 이후에는 콘텐츠가 완전히 재생된 것으로 간주됩니다.';

  @override
  String get adminMinResumeDuration => '이어보기 최소 길이(초)';

  @override
  String get adminMinResumeDurationSubtitle => '이보다 짧은 항목은 이어볼 수 없습니다';

  @override
  String get adminMinAudiobookResume => '오디오북 최소 이어보기 비율';

  @override
  String get adminMaxAudiobookResume => '오디오북 최대 이어보기 비율';

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
  String get adminBaseUrlHint => '예: /jellyfin';

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
  String adminMetadataLoadFailed(String error) {
    return '메타데이터를 불러오지 못했습니다: $error';
  }

  @override
  String get adminRefreshMetadata => '메타데이터 새로 고침';

  @override
  String get recursive => '재귀적';

  @override
  String get adminReplaceAllMetadata => '모든 메타데이터 교체';

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
  String get adminAllProviders => '모든 제공자';

  @override
  String get adminNoRemoteImages => '원격 이미지를 찾을 수 없습니다.';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return '튜너를 검색하지 못했습니다: $error';
  }

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
  String get adminEnableAllTuners => '모든 튜너 사용';

  @override
  String adminTunerRemoveFailed(String error) {
    return '튜너를 제거하지 못했습니다: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return '제공자를 제거하지 못했습니다: $error';
  }

  @override
  String get adminSeriesRecordingPath => '시리즈 녹화 경로';

  @override
  String get adminMovieRecordingPath => '영화 녹화 경로';

  @override
  String get adminGuideDaysAuto => '자동';

  @override
  String get adminRecordingPostProcessor => '후처리 프로그램 경로';

  @override
  String get adminRecordingPostProcessorArgs => '후처리 인수';

  @override
  String get adminSaveRecordingNfo => '녹화 NFO 메타데이터 저장';

  @override
  String get adminSaveRecordingImages => '녹화 이미지 저장';

  @override
  String get adminLiveTvSectionPaths => '녹화 경로';

  @override
  String get adminLiveTvSectionPostProcessing => '후처리';

  @override
  String adminSettingsSaveFailed(String error) {
    return '설정을 저장하지 못했습니다: $error';
  }

  @override
  String get adminLiveTvLoadFailed => '라이브 TV 관리를 로드하지 못했습니다';

  @override
  String get adminTunerDevices => '튜너 장치';

  @override
  String get adminNoTunerHosts => '구성된 튜너 호스트가 없습니다.';

  @override
  String get adminGuideProviders => '편성표 제공자';

  @override
  String get adminGuideRefreshStarted => '편성표 데이터 새로고침을 시작했습니다';

  @override
  String get adminGuideRefreshUnavailable => '이 서버에서는 편성표 새로고침 작업을 사용할 수 없습니다.';

  @override
  String get adminNoListingProviders => '구성된 편성표 제공자가 없습니다';

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
  String get adminBackupsTitle => '백업';

  @override
  String get adminUnknownDate => '날짜를 알 수 없음';

  @override
  String get adminUnnamedBackup => '이름 없는 백업';

  @override
  String get adminApply => '적용';

  @override
  String get adminLogsTitle => '서버 로그';

  @override
  String get adminLogsNewestFirst => '최신순';

  @override
  String get adminLogsOldestFirst => '오래된순';

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
  String get adminMetadataDetails => '상세 정보';

  @override
  String get adminMetadataExternalIds => '외부 ID';

  @override
  String get adminMetadataImages => '이미지';

  @override
  String get adminMetadataFieldTitle => '제목';

  @override
  String get adminMetadataFieldSortTitle => '정렬용 제목';

  @override
  String get adminMetadataFieldOriginalTitle => '원제';

  @override
  String get adminMetadataFieldPremiereDate => '개봉 날짜(YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => '종료일(YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => '제작 연도';

  @override
  String get adminMetadataFieldOfficialRating => '공식 등급';

  @override
  String get adminMetadataFieldCommunityRating => '커뮤니티 평가';

  @override
  String get adminMetadataFieldCriticRating => '비평가 평가';

  @override
  String get adminMetadataFieldCustomRating => '사용자 지정 등급';

  @override
  String get adminMetadataFieldTagline => '태그라인';

  @override
  String get adminMetadataFieldOverview => '개요';

  @override
  String get adminMetadataFieldDisplayOrder => '표시 순서';

  @override
  String get adminMetadataDisplayOrderAired => '방영순';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate => '최초 방영일순';

  @override
  String get adminMetadataDisplayOrderAbsolute => '절대 순서';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => '디지털';

  @override
  String get adminMetadataDisplayOrderStoryArc => '스토리 아크';

  @override
  String get adminMetadataDisplayOrderProduction => '제작순';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => '대체 순서';

  @override
  String get adminMetadataDisplayOrderRegional => '지역순';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => '대체 DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => '수정일순';

  @override
  String get adminMetadataDisplayOrderSortName => '정렬 이름순';

  @override
  String get adminMetadataDisplayOrderReleaseDate => '출시일순';

  @override
  String get adminMetadataSettings => '메타데이터 설정';

  @override
  String get adminMetadataDownloadLanguage => '선호하는 다운로드 언어';

  @override
  String get adminMetadataCountryRegion => '국가/지역';

  @override
  String get adminMetadataInheritHelp =>
      '상위 항목 또는 서버 기본값의 설정을 상속받으려면 기본값으로 두세요.';

  @override
  String get adminMetadataField3DFormat => '3D 형식';

  @override
  String get adminMetadataPersonKindActor => '배우';

  @override
  String get adminMetadataPersonKindDirector => '감독';

  @override
  String get adminMetadataPersonKindComposer => '작곡가';

  @override
  String get adminMetadataPersonKindWriter => '작가';

  @override
  String get adminMetadataPersonKindGuestStar => '게스트 출연';

  @override
  String get adminMetadataPersonKindProducer => '프로듀서';

  @override
  String get adminMetadataPersonKindConductor => '지휘자';

  @override
  String get adminMetadataPersonKindLyricist => '작사가';

  @override
  String get adminMetadataPersonKindArranger => '편곡가';

  @override
  String get adminMetadataPersonKindEngineer => '엔지니어';

  @override
  String get adminMetadataPersonKindMixer => '믹서';

  @override
  String get adminMetadataPersonKindRemixer => '리믹서';

  @override
  String get adminMetadataPersonKindCreator => '제작자';

  @override
  String get adminMetadataPersonKindArtist => '아티스트';

  @override
  String get adminMetadataPersonKindAlbumArtist => '앨범 아티스트';

  @override
  String get adminMetadataPersonKindAuthor => '저자';

  @override
  String get adminMetadataPersonKindIllustrator => '일러스트레이터';

  @override
  String get adminMetadataPersonKindPenciller => '펜슬러';

  @override
  String get adminMetadataPersonKindInker => '잉커';

  @override
  String get adminMetadataPersonKindColorist => '컬러리스트';

  @override
  String get adminMetadataPersonKindLetterer => '레터러';

  @override
  String get adminMetadataPersonKindCoverArtist => '커버 아티스트';

  @override
  String get adminMetadataPersonKindEditor => '편집자';

  @override
  String get adminMetadataPersonKindTranslator => '번역가';

  @override
  String get adminMetadataPersonKindNarrator => '내레이터';

  @override
  String get adminMetadataAirDays => '방영 요일';

  @override
  String get adminMetadataLockItem => '향후 메타데이터 변경을 방지하기 위해 이 항목을 잠급니다';

  @override
  String get adminMetadataEnabledFields => '활성화된 필드';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      '필드를 체크 해제하면 잠금 처리되어 데이터 변경을 방지합니다.';

  @override
  String get adminMetadataLockFieldName => '이름';

  @override
  String get adminMetadataLockFieldOverview => '개요';

  @override
  String get adminMetadataLockFieldGenres => '장르';

  @override
  String get adminMetadataLockFieldOfficialRating => '시청 등급';

  @override
  String get adminMetadataLockFieldCast => '인물';

  @override
  String get adminMetadataLockFieldProductionLocations => '제작 위치';

  @override
  String get adminMetadataLockFieldBirthLocation => '출생지';

  @override
  String get adminMetadataLockFieldRuntime => '재생 시간';

  @override
  String get adminMetadataLockFieldStudios => '스튜디오';

  @override
  String get adminMetadataLockFieldTags => '태그';

  @override
  String get adminMetadataGenres => '장르';

  @override
  String get adminMetadataTags => '태그';

  @override
  String get adminMetadataStudios => '스튜디오';

  @override
  String get adminMetadataPeople => '인물';

  @override
  String get adminMetadataAddGenre => '장르 추가';

  @override
  String get adminMetadataAddTag => '태그 추가';

  @override
  String get adminMetadataAddStudio => '스튜디오 추가';

  @override
  String get adminMetadataAddPerson => '인물 추가';

  @override
  String get adminMetadataEditPerson => '인물 편집';

  @override
  String get adminMetadataRole => '역할';

  @override
  String get adminMetadataImagePrimary => '기본';

  @override
  String get adminMetadataImageBackdrop => '배경';

  @override
  String get adminMetadataImageLogo => '로고';

  @override
  String get adminMetadataImageBanner => '배너';

  @override
  String get adminMetadataImageThumb => '썸네일';

  @override
  String get adminMetadataProvider => '제공자';

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
  String get adminMetadataDeleteImageContent => '항목에서 현재 이미지를 제거합니다.';

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
  String get adminPluginsActive => '활성';

  @override
  String get adminPluginsRestart => '다시 시작';

  @override
  String get adminPluginsRestartRequired => '재시작 필요';

  @override
  String get adminPluginsNoSearchResults => '검색어와 일치하는 플러그인이 없습니다';

  @override
  String get adminPluginsNoneInstalled => '플러그인이 설치되지 않았습니다.';

  @override
  String get adminPluginsNoneActive => '활성 플러그인 없음';

  @override
  String get adminPluginsNoneRequireRestart => '서버 재시작이 필요한 플러그인이 없습니다';

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
  String get adminPluginsEnable => '활성화';

  @override
  String get adminPluginsDisable => '비활성화';

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
  String get adminPluginDetailDetails => '상세 정보';

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
  String get adminReposNameHint => '예: Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => '잘못된 URL';

  @override
  String get adminGeneralSettingsTitle => '일반 설정';

  @override
  String get adminGeneralMetadataLanguage => '선호하는 메타데이터 언어';

  @override
  String get adminGeneralMetadataLanguageHint => '예: en, de, fr';

  @override
  String get adminGeneralMetadataCountry => '선호하는 메타데이터 국가';

  @override
  String get adminGeneralMetadataCountryHint => '예: US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency => '라이브러리 스캔 동시성';

  @override
  String get adminGeneralImageEncodingLimit => '병렬 이미지 인코딩 제한';

  @override
  String get adminUnknownError => '알 수 없는 오류';

  @override
  String get adminBrowse => '찾아보기';

  @override
  String get adminCloseBrowser => '브라우저 닫기';

  @override
  String get adminNetworkingTitle => '네트워킹';

  @override
  String get adminNetworkingRestartWarning =>
      '네트워킹 설정을 변경하면 서버를 다시 시작해야 할 수도 있습니다.';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS 활성화';

  @override
  String get adminNetworkingAddressHint => '예: 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => '알려진 프록시';

  @override
  String get adminNetworkingProxyHint => '예: 10.0.0.1';

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
  String get adminBrandingCustomCssHint => '웹 인터페이스에 적용할 사용자 정의 CSS';

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
  String get adminPlaybackQsvDevice => 'QSV 장치';

  @override
  String get adminPlaybackEnhancedNvdec => '향상된 NVDEC 디코더 사용';

  @override
  String get adminPlaybackPreferNativeDecoder => '시스템 기본 하드웨어 디코더 우선';

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
  String get adminPlaybackEncoding => '인코딩';

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
  String get adminStreamingBitrateLimit => '원격 클라이언트 비트 전송률 제한(Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => '무제한으로 하려면 비워 두거나 0을 입력하세요';

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
  String get adminTrickplayPriorityHigh => '높음';

  @override
  String get adminTrickplayPriorityAboveNormal => '보통 이상';

  @override
  String get adminTrickplayPriorityNormal => '보통';

  @override
  String get adminTrickplayPriorityBelowNormal => '보통 미만';

  @override
  String get adminTrickplayPriorityIdle => '유휴';

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
  String get adminTrickplayQScale => '품질 스케일';

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
  String get adminTaskRunning => '실행 중...';

  @override
  String get adminTaskNeverRun => '실행 안 함';

  @override
  String get adminTaskStop => '정지';

  @override
  String get adminRunningTasks => '실행 중인 작업';

  @override
  String get adminTaskRun => '실행';

  @override
  String get adminTaskDetailLastExecution => '마지막 실행';

  @override
  String get adminTaskDetailStarted => '시작됨';

  @override
  String get adminTaskDetailEnded => '종료됨';

  @override
  String get adminTaskDetailDuration => '소요 시간';

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
  String get adminTaskTriggerStartup => '응용 프로그램 시작 시';

  @override
  String get adminTaskTriggerTypeDaily => '일일';

  @override
  String get adminTaskTriggerTypeWeekly => '주간';

  @override
  String get adminTaskTriggerTypeInterval => '일정 간격';

  @override
  String get adminTaskTriggerIntervalLabel => '간격';

  @override
  String get adminTaskTriggerEveryHour => '매시간';

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
  String get adminActivityJustNow => '방금';

  @override
  String get adminActivityLastHour => '최근 1시간';

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
  String get adminNetworkingBaseUrlHint => '예: /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => '공용 HTTP 포트';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS 필수';

  @override
  String get adminNetworkingRequireHttpsHint =>
      '모든 원격 요청을 HTTPS로 리디렉션합니다. 서버에 유효한 인증서가 없으면 적용되지 않습니다.';

  @override
  String get adminNetworkingCertPassword => '인증서 비밀번호';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 사용';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 사용';

  @override
  String get adminNetworkingLocalSubnets => 'LAN 네트워크';

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
  String get adminPlaybackThrottleDelay => '스로틀 지연 시간(초)';

  @override
  String get adminPlaybackEnableSubtitleExtraction => '실시간 자막 추출 허용';

  @override
  String get adminResumeMinPct => '최소 이어보기 비율';

  @override
  String get adminResumeMinPctSubtitle =>
      '진행 상황을 저장하려면 콘텐츠를 이 비율 이상으로 재생해야 합니다.';

  @override
  String get adminResumeMaxPct => '최대 이어보기 비율';

  @override
  String get adminResumeMaxPctSubtitle => '이 비율 이후에는 콘텐츠가 완전히 재생된 것으로 간주됩니다.';

  @override
  String get adminResumeMinDuration => '이어보기 최소 길이(초)';

  @override
  String get adminResumeMinDurationSubtitle => '이보다 짧은 항목은 이어볼 수 없습니다';

  @override
  String get adminTrickplayScanBehavior => '스캔 동작';

  @override
  String get adminTrickplayProcessPriority => '프로세스 우선순위';

  @override
  String get adminTrickplayTileWidth => '타일 너비';

  @override
  String get adminTrickplayTileHeight => '타일 높이';

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
  String get syncPlayIgnoreWait => '대기 무시';

  @override
  String get syncPlayIgnoreWaitSubtitle => '이 기기가 버퍼링하는 동안 그룹이 기다리지 않게 합니다';

  @override
  String get syncPlayContinueLocallyNoWait => '느린 참가자를 기다리지 않고 로컬에서 계속 재생';

  @override
  String get syncPlayRepeat => '반복';

  @override
  String get syncPlayRepeatOne => '한 항목';

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
  String get syncPlayPlayNow => '지금 재생';

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
  String get syncPlayJoinGroupQuestion => 'SyncPlay 그룹에 참여하시겠습니까?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay 그룹에 참여하면 현재 재생 대기열이 대체될 수 있습니다. 계속할까요?';

  @override
  String get syncPlayJoin => '참여';

  @override
  String get syncPlayStateIdle => '유휴';

  @override
  String get syncPlayStateWaiting => '대기 중';

  @override
  String get syncPlayStatePaused => '일시중지됨';

  @override
  String get syncPlayStatePlaying => '재생 중';

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
      '이 Dolby Vision 스트림의 다이렉트 재생을 시작하지 못했습니다. 서버 트랜스코딩으로 다시 시도하시겠습니까?';

  @override
  String get retryWithTranscode => '트랜스코드로 다시 시도';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision 지원되지 않음';

  @override
  String get dolbyVisionNotSupportedMessage =>
      '이 기기는 Dolby Vision 콘텐츠를 직접 디코딩할 수 없습니다. HDR10 대체를 사용하거나 서버 트랜스코딩을 요청하세요.';

  @override
  String get rememberMyChoice => '이 선택 기억하기';

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
  String get mediaBarLoading => '미디어 바 로드 중...';

  @override
  String get mediaBarError => '미디어 바를 로드하지 못했습니다';

  @override
  String get offlineServerUnavailable => '인터넷에 연결되어 있지만 현재 서버를 사용할 수 없습니다.';

  @override
  String get offlineNoInternet => '오프라인 상태입니다. 다운로드한 콘텐츠만 이용할 수 있습니다.';

  @override
  String get offlineFileNotAvailable => '파일을 사용할 수 없음';

  @override
  String get offlineSwitchServer => '서버 전환';

  @override
  String get offlineSavedMedia => '다운로드';

  @override
  String get offlineBannerTitle => '오프라인 상태입니다';

  @override
  String get offlineBannerSubtitle => '다운로드한 항목을 표시합니다';

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
    return '전송 제어에 실패했습니다: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind 제어';
  }

  @override
  String get castDeviceVolume => '기기 음량';

  @override
  String get castVolumeUnavailable => '사용할 수 없음';

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
  String get kidsMode => '키즈 모드';

  @override
  String get kidsModeSubtitle => '앱을 단순하게 바꾸고 PIN으로 나가는 길을 잠급니다';

  @override
  String get kidsModeExit => '키즈 모드 종료';

  @override
  String get kidsModeExitSubtitle => 'PIN을 입력하면 전체 앱으로 돌아갑니다';

  @override
  String get pinIncorrect => '잘못된 PIN';

  @override
  String pinTryAgainIn(String wait) {
    return '시도 횟수가 너무 많습니다. $wait 후에 다시 시도하세요.';
  }

  @override
  String get pinMismatch => 'PIN이 일치하지 않습니다.';

  @override
  String get pinForgot => 'PIN을 잊으셨나요?';

  @override
  String get pinClear => '지우기';

  @override
  String get pinBackspace => '지우기';

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
  String get quickConnectForbidden => '이 계정으로는 이 Quick Connect 요청을 승인할 수 없습니다.';

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
  String get quickConnectAuthorize => '승인';

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
  String get remoteStartPlayback => '다른 기기에서 재생 시작';

  @override
  String get unknownUser => '알 수 없음';

  @override
  String get unknownItem => '알 수 없음';

  @override
  String get remoteNothingPlaying => '이 세션에서는 재생 중인 항목이 없습니다.';

  @override
  String get castingStarted => '선택한 기기에서 전송이 시작되었습니다.';

  @override
  String castingFailed(String error) {
    return '전송을 시작하지 못했습니다: $error';
  }

  @override
  String get noRemoteDevices => '사용할 수 있는 원격 재생 기기가 없습니다.';

  @override
  String get noRemoteDevicesIos =>
      '사용할 수 있는 원격 재생 기기가 없습니다.\n\niOS에서는 시뮬레이터에서 AirPlay 대상을 사용하지 못할 수 있습니다.';

  @override
  String get trackActionPlayNext => '다음 곡 재생';

  @override
  String get trackActionViewDetails => '상세 정보 보기';

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
  String get posterDisplayTitle => '표시';

  @override
  String get posterImageType => '이미지 유형';

  @override
  String get imageTypePoster => '포스터';

  @override
  String get imageTypeThumbnail => '썸네일';

  @override
  String get imageTypeBanner => '배너';

  @override
  String get playlistAddFailed => '재생목록에 추가하지 못했습니다.';

  @override
  String get playlistCreateFailed => '재생목록을 생성하지 못했습니다.';

  @override
  String get playlistNew => '새 재생목록';

  @override
  String get playlistCreate => '만들기';

  @override
  String get playlistCreateNew => '새 재생목록 만들기';

  @override
  String get playlistNoneFound => '재생목록을 찾을 수 없습니다.';

  @override
  String get addToPlaylist => '재생목록에 추가';

  @override
  String get lyricsNotAvailable => '사용 가능한 가사가 없습니다.';

  @override
  String get upNext => '다음 볼 항목';

  @override
  String get playNext => '다음에 재생';

  @override
  String get stillWatchingContent => '재생이 일시중지되었습니다. 아직도 보고 있나요?';

  @override
  String get stillWatchingStop => '정지';

  @override
  String get stillWatchingContinue => '계속';

  @override
  String skipSegment(String segment) {
    return '$segment 건너뛰기';
  }

  @override
  String get liveTv => '라이브 TV';

  @override
  String get continueWatchingAndNextUp => '계속 시청 및 다음 볼 항목';

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
  String get moreFromThisSeason => '이 시즌의 다른 에피소드';

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
  String get playerTooltipFloatOnTop => '항상 위에 표시';

  @override
  String get playerTooltipExitFloatOnTop => '항상 위에 표시 끄기';

  @override
  String get playerTooltipLockLandscape => '가로 모드 고정';

  @override
  String get playerTooltipUnlockOrientation => '화면 회전 허용';

  @override
  String get playerTooltipPrevious => '이전';

  @override
  String get playerTooltipSeekBack => '뒤로 탐색';

  @override
  String get playerTooltipSeekForward => '앞으로 탐색';

  @override
  String get playerTooltipMinimize => '플레이어 최소화';

  @override
  String get miniPlayerOpenPlayer => '플레이어 열기';

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
  String get contextMenuHideFromContinueWatching => '계속 시청에서 숨기기';

  @override
  String get contextMenuHideFromNextUp => '다음 볼 항목에서 숨기기';

  @override
  String get contextMenuAddToCollection => '컬렉션에 추가';

  @override
  String get contextMenuRemoveFromCollection => '컬렉션에서 제거';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return '$collection에서 $item을(를) 제거할까요? 항목은 라이브러리에 그대로 남습니다.';
  }

  @override
  String get removeFromCollectionFailed => '컬렉션에서 제거하지 못했습니다';

  @override
  String get settingsAdministrationSubtitle => '서버 관리 패널에 액세스';

  @override
  String get settingsDynamicContent => '동적 콘텐츠';

  @override
  String get settingsDynamicContentSubtitle => '미디어 바와 시각적 오버레이';

  @override
  String get settingsAboutSubtitle => '앱 버전, 법적 정보, 크레딧';

  @override
  String get settingsSortServersBy => '서버 정렬 기준';

  @override
  String get settingsLastUsed => '최근 사용순';

  @override
  String get settingsAlphabetical => '알파벳순';

  @override
  String get settingsAllowSelfSignedCerts => '자체 서명 인증서 허용';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      '자체 서명 또는 사설 CA TLS 인증서를 사용하는 서버를 신뢰합니다. 직접 관리하는 서버에만 사용하세요. 이 설정을 켜면 모든 연결에서 인증서 검증이 해제됩니다.';

  @override
  String get untrustedServerCertificate =>
      '이 서버의 인증서를 신뢰할 수 없습니다. 자체 서명 인증서나 사설 인증서를 사용하는 내 서버라면 여기에서 허용할 수 있습니다.';

  @override
  String get clientCertTitle => '클라이언트 인증서';

  @override
  String clientCertHost(String host) {
    return '$host용 인증서';
  }

  @override
  String get clientCertChooseFile => '파일 선택';

  @override
  String get clientCertPassword => '인증서 비밀번호';

  @override
  String get clientCertStartUpload => '휴대폰에서 보내기';

  @override
  String get clientCertUploadHint =>
      '휴대폰으로 이 코드를 스캔하거나 휴대폰 브라우저에서 주소를 연 다음, 파일을 선택하고 비밀번호를 입력하세요.';

  @override
  String get clientCertStopUpload => '기다리기 중지';

  @override
  String get clientCertNoFileData => '파일을 읽지 못했습니다. 다시 시도하세요.';

  @override
  String get clientCertPickFailed => '파일 선택기를 열지 못했습니다.';

  @override
  String get clientCertUploadFailed => '업로드 페이지를 시작하지 못했습니다. 다시 시도하세요.';

  @override
  String get clientCertNoSecureStorage =>
      '이 기기에는 보안 저장소가 없어 인증서를 저장할 수 없습니다. Linux에서는 libsecret을 설치한 후 다시 시도하세요.';

  @override
  String get clientCertDecodeFailed =>
      '이 파일을 인증서로 읽을 수 없습니다. .p12 또는 .pfx 파일인지 확인하세요.';

  @override
  String get clientCertWrongPassword => '비밀번호가 맞지 않아 인증서를 열 수 없습니다.';

  @override
  String get clientCertRequired =>
      '이 서버에는 클라이언트 인증서(mTLS)가 필요합니다. 계속하려면 이 호스트용 인증서를 추가하세요.';

  @override
  String clientCertExpired(String date) {
    return '이 서버의 인증서가 $date에 만료되었습니다. 계속하려면 인증서를 교체하세요.';
  }

  @override
  String get clientCertAddButton => '클라이언트 인증서 추가';

  @override
  String get settingsClientCertificates => '클라이언트 인증서';

  @override
  String get settingsClientCertificatesSubtitle =>
      '인증서가 필요한 서버(mTLS)에 이 앱이 제시하는 인증서';

  @override
  String get clientCertSubject => '주체';

  @override
  String clientCertExpires(String date) {
    return '만료: $date';
  }

  @override
  String get clientCertReplace => '교체';

  @override
  String get clientCertAdd => '인증서 추가';

  @override
  String get clientCertAddHostPrompt => '인증서가 필요한 서버 호스트는 무엇인가요?';

  @override
  String get itemBlockedByParentalControls => '이용할 수 없는 콘텐츠입니다';

  @override
  String get blockedRatingsCeilingHint => '등급을 차단하면 그보다 높은 등급도 모두 차단됩니다.';

  @override
  String get blockedRatingsUnrankedSection => '해당 등급만 차단';

  @override
  String get settingsHomePage => '홈 페이지';

  @override
  String get settingsTwentyFourHourClock => '24시간제 시계';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      '시계가 표시되는 모든 곳에 24시간 형식을 사용합니다';

  @override
  String get settingsShowShuffleButtonInNavigation => '탐색 바에 셔플 버튼 표시';

  @override
  String get settingsShowGenresButtonInNavigation => '탐색 바에 장르 버튼 표시';

  @override
  String get settingsShowFavoritesButtonInNavigation => '탐색 바에 즐겨찾기 버튼 표시';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      '서버에 라이브 TV 라이브러리가 있으면 탐색 바에 라이브 TV 버튼 표시';

  @override
  String get settingsShowLibrariesButtonInNavigation => '탐색 바에 라이브러리 버튼 표시';

  @override
  String get settingsShowSeerrButtonInNavigation => '탐색 바에 Seerr 버튼을 표시합니다';

  @override
  String get settingsAlwaysExpandNavbarLabels => '상단 탐색 바에 텍스트 라벨을 항상 표시합니다';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      '라이브러리별로 홈 페이지 표시 여부를 전환합니다. 변경 사항을 적용하려면 Moonfin을 다시 시작하세요.';

  @override
  String get settingsMediaBarAndLocalPreviews => '미디어 바 및 로컬 미리보기';

  @override
  String get settingsVisualOverlays => '시각적 오버레이';

  @override
  String get settingsSeasonalSurprise => '계절 깜짝 이벤트';

  @override
  String get useNativeEmulator => '네이티브 에뮬레이션';

  @override
  String get useNativeEmulatorSubtitle =>
      'EmulatorJS 웹 플레이어 대신 네이티브 코어로 게임을 플레이합니다';

  @override
  String get emulatorCores => '에뮬레이터 코어';

  @override
  String get emulatorCoresSubtitle => '게임을 네이티브로 플레이할 시스템 다운로드';

  @override
  String get emulatorCoresDescription =>
      '설치할 시스템을 선택하세요. 코어는 libretro 프로젝트에서 제공하며 브라우저 보기 대신 게임을 네이티브로 실행할 수 있게 해줍니다.';

  @override
  String get emulatorCoreDownloading => '다운로드 중';

  @override
  String get emulatorCoreUnavailable => '이 기기에서는 지원되지 않음';

  @override
  String get emulatorCoreDownloadFailed =>
      '코어를 다운로드하지 못했습니다. 연결을 확인하고 다시 시도하세요.';

  @override
  String emulatorCoreResetSettings(String system) {
    return '$system 설정을 기본값으로 초기화';
  }

  @override
  String get emulatorCoreSettingsReset => '설정을 기본값으로 초기화했습니다.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      '설정을 초기화하지 못했습니다. 연결을 확인하고 다시 시도하세요.';

  @override
  String get downloadedGames => '다운로드한 게임';

  @override
  String get downloadedGamesSubtitle => '게임 파일이 사용하는 공간 확보';

  @override
  String get downloadedGamesDescription =>
      '게임은 플레이하기 전에 이 기기로 복사됩니다. 공간을 확보하려면 완료한 게임을 삭제하세요. 저장 데이터는 서버에 보관되며 삭제되지 않습니다.';

  @override
  String get downloadedGamesEmpty => '아직 이 기기에 다운로드된 게임이 없습니다.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '게임 $count개, $size';
  }

  @override
  String get removeAllDownloadedGames => '모두 삭제';

  @override
  String removeDownloadedGameConfirm(String title) {
    return '이 기기에서 $title을(를) 삭제할까요? 다음에 플레이할 때 다시 다운로드됩니다.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      '이 기기에서 다운로드한 모든 게임을 삭제할까요? 다음에 플레이할 때 다시 다운로드됩니다.';

  @override
  String get settingsHigh => '높음';

  @override
  String get settingsLow => '낮음';

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
  String get settingsJoinDiscord => 'Discord 참여하기';

  @override
  String get settingsJoinDiscordSubtitle => '커뮤니티와 채팅';

  @override
  String get settingsJoinTheDiscord => 'Discord 참여하기';

  @override
  String get settingsSupportMoonfin => 'Moonfin 후원';

  @override
  String get settingsSupportMoonfinSubtitle => '개발자에게 커피 한 잔 후원하기';

  @override
  String get settingsLegal => '법적 고지';

  @override
  String get settingsLicenses => '라이선스';

  @override
  String get settingsOpenSourceLicenseNotices => '오픈소스 라이선스 공지';

  @override
  String get settingsPrivacyPolicy => '개인 정보 보호 정책';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin이 데이터를 처리하는 방법';

  @override
  String get settingsCheckForUpdates => '업데이트 확인';

  @override
  String get settingsCheckForUpdatesSubtitle => '최신 Moonfin 릴리스를 확인합니다';

  @override
  String get settingsBoth => '둘 다';

  @override
  String get settingsShuffleContentTypeFilter => '셔플 콘텐츠 유형 필터';

  @override
  String get settingsAudioPreferencesSubtitle => '오디오 트랙, 처리 및 패스스루 옵션';

  @override
  String get settingsAutomationAndQueueSubtitle => '자동 재생 및 시퀀싱';

  @override
  String get settingsSyncplaySubtitle => '그룹 세션의 동기화 로직';

  @override
  String get settingsSkipIntrosAndOutros => '인트로와 아웃트로를 건너뛰시겠습니까?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment 구간';
  }

  @override
  String get settingsMediaSegmentCountdown => '미디어 구간 카운트다운';

  @override
  String get settingsProgressBar => '진행 바';

  @override
  String get settingsTimer => '타이머';

  @override
  String get settingsNone => '없음';

  @override
  String get settingsSkipButtonAutoHide => '건너뛰기 버튼 자동 숨김';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      '몇 초 후에 오프닝 및 엔딩 건너뛰기 버튼을 자동으로 닫습니다.';

  @override
  String get settingsPromptUser => '사용자에게 묻기';

  @override
  String get settingsSkip => '건너뛰기';

  @override
  String get settingsDoNothing => '아무것도 하지 않음';

  @override
  String get settingsMaxBitrateDescription =>
      '스트리밍 비트 전송률을 제한합니다. 이 임계값을 초과하는 콘텐츠는 이에 맞게 트랜스코딩됩니다.';

  @override
  String get settingsMaxResolutionDescription =>
      '플레이어가 요청할 최대 해상도를 제한합니다. 고해상도 콘텐츠는 트랜스코딩됩니다.';

  @override
  String get settingsPlayerZoomDescription =>
      '화면에 맞게 비디오 크기를 조정하는 방법입니다. 확대하여 채우기는 화면이 가득 찰 때까지 영상을 확대하며 가장자리가 잘립니다. 검은 여백(레터박스)은 감지하지 않습니다.';

  @override
  String get settingsPlaybackEngineAndroidTv => '재생 엔진(Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV 기기에서 기본 재생 엔진을 선택하세요. 변경 사항은 다음 재생 세션에 적용됩니다.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3(권장)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv(레거시)';

  @override
  String get settingsRedetectDisplay => '디스플레이 다시 감지';

  @override
  String get settingsRedetectDisplayDescription =>
      'TV가 지원하는 HDR 형식을 다시 확인합니다. TV나 리시버를 늦게 켜서 Dolby Vision 또는 HDR10 작품이 트랜스코딩될 때 사용하세요.';

  @override
  String get settingsDisplayIsSdr => 'HDR을 지원하지 않는 TV';

  @override
  String get settingsDisplayIsSdrDescription =>
      '이 디스플레이의 HDR 지원을 알리지 않습니다. TV가 실제로 표시할 수 없는 HDR이 계속 감지될 때만 사용하세요.';

  @override
  String settingsDisplayRedetected(String formats) {
    return '디스플레이를 다시 감지했습니다: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => '감지된 HDR 형식이 없습니다';

  @override
  String get settingsDisplayMarkedSdr => '디스플레이를 SDR로 저장했습니다';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision 대체';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision 디코딩이 없는 기기에서 Dolby Vision 타이틀의 동작입니다.';

  @override
  String get settingsAskEachTime => '매번 묻기';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 대체 우선';

  @override
  String get settingsPreferServerTranscode => '서버 트랜스코딩 우선';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision 프로필 7 다이렉트 재생';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision 프로필 7 향상 레이어 스트림을 다이렉트 재생할지 설정합니다.';

  @override
  String get settingsAutoAftkrtEnabled => '자동';

  @override
  String get settingsEnabledOnThisDevice => '사용';

  @override
  String get settingsDisabledPreferTranscode => '끔';

  @override
  String get settingsResumeRewindDescription =>
      '재생을 이어갈 때(계속 시청 또는 미디어 항목 페이지에서) 되감을 시간(초)입니다';

  @override
  String get settingsUnpauseRewindDescription =>
      '일시정지 후 재생을 다시 시작할 때 되감을 시간(초)입니다';

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
  String get settingsBitstreamAc3ToExternalDecoder => 'AC3를 외부 디코더로 비트스트림 전송';

  @override
  String get settingsCinemaMode => '시네마 모드';

  @override
  String get settingsCinemaModeSubtitle => '본편 재생 전에 예고편/프리롤 재생';

  @override
  String get settingsCinemaModeEpisodes => '에피소드 시네마 모드';

  @override
  String get settingsCinemaModeEpisodesSubtitle => 'TV 에피소드 재생 전에도 프리롤을 재생합니다';

  @override
  String get settingsNextUpDisplayDescription =>
      '확장은 에피소드 아트워크와 설명이 담긴 전체 카드를 표시합니다. 최소는 간단한 카운트다운 오버레이를 표시합니다. 사용 안 함은 알림을 완전히 숨깁니다.';

  @override
  String get settingsShort => '짧게';

  @override
  String get settingsLong => '길게';

  @override
  String get settingsVeryLong => '매우 길게';

  @override
  String get settingsVideoStartDelay => '비디오 시작 지연';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => '라이브 TV 다이렉트 재생';

  @override
  String get settingsLiveTvDirectSubtitle => '라이브 TV 다이렉트 재생 활성화';

  @override
  String get settingsOpenGroups => '그룹 열기';

  @override
  String get settingsOpenGroupsSubtitle => 'SyncPlay 그룹 생성, 참여 또는 관리';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay 활성화됨';

  @override
  String get settingsSyncplayEnabledSubtitle => '그룹 시청 기능 활성화';

  @override
  String get settingsSyncplayButton => 'SyncPlay 버튼';

  @override
  String get settingsSyncplayButtonSubtitle => '탐색 바에 SyncPlay 버튼 표시';

  @override
  String get settingsSyncplayAdvancedCorrection => '고급 교정';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle => '세분화된 동기화 로직 활성화';

  @override
  String get settingsSyncplaySyncCorrection => '동기화 보정';

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
  String get settingsSyncplaySkipToSyncSubtitle => '탐색으로 동기화';

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
  String get onNow => '지금 방송 중';

  @override
  String get collections => '컬렉션';

  @override
  String get lastPlayed => '최근 재생';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return '최근 추가된 $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '최근 출시된 $libraryName';
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
  String get mapDolbyVisionP7Title => 'Dolby Vision 프로필 7을 항상 HDR10으로 재생';

  @override
  String get mapDolbyVisionP7Subtitle =>
      '프로필 8 변환을 건너뛰고 Dolby Vision 프로필 7 스트림을 HDR10 호환 HEVC로 변환합니다. 변환된 스트림이 이상하게 보일 때 사용하세요.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get rowsType => '행 유형';

  @override
  String get rowsTypeDescription =>
      '클래식은 행별 이미지 유형과 정보 오버레이를 유지합니다. 모던은 세로형에서 가로형으로 이어지는 행을 사용합니다.';

  @override
  String get modernCardsOnMyMediaRow => '내 미디어 행에 모던 카드 사용';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      '포커스하면 펼쳐지는 사용자 지정 포스터를 표시합니다. 끄면 항상 가로형 썸네일을 표시합니다.';

  @override
  String get sortOrder => '정렬 순서';

  @override
  String get ascending => '오름차순';

  @override
  String get descending => '내림차순';

  @override
  String get displayFavoritesRows => '즐겨찾기 행 표시';

  @override
  String get displayFavoritesRowsSubtitle => '홈 섹션에 즐겨찾는 영화, 시리즈 등의 행을 표시합니다.';

  @override
  String get favoritesRowSorting => '즐겨찾기 행 정렬';

  @override
  String get favoritesRowSortingDescription =>
      '즐겨찾기 행을 추가된 날짜, 출시일, 가나다순 등으로 정렬합니다.';

  @override
  String get favoritesRowSortOrderDescription =>
      '즐겨찾기 행을 오름차순 또는 내림차순으로 정렬합니다.';

  @override
  String get displayCollectionsRows => '컬렉션 행 표시';

  @override
  String get displayCollectionsRowsSubtitle => '홈 섹션에 컬렉션 행을 표시합니다.';

  @override
  String get collectionsRowSorting => '컬렉션 행 정렬';

  @override
  String get collectionsRowSortingDescription =>
      '컬렉션 행을 추가된 날짜, 출시일, 가나다순 등으로 정렬합니다.';

  @override
  String get collectionsRowSortOrderDescription =>
      '컬렉션 행을 오름차순 또는 내림차순으로 정렬합니다.';

  @override
  String get collectionsRowShowEpisodes => '개별 에피소드 표시';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'TV 프로그램을 펼쳐 각 에피소드를 별도로 표시합니다.';

  @override
  String get displayGenresRows => '장르 행 표시';

  @override
  String get displayGenresRowsSubtitle => '홈 섹션에 장르 행을 표시합니다.';

  @override
  String get genresRowSorting => '장르 행 정렬';

  @override
  String get genresRowSortingDescription =>
      '장르 행을 추가된 날짜, 출시일, 가나다순 등으로 정렬합니다.';

  @override
  String get genresRowSortOrderDescription => '장르 행을 오름차순 또는 내림차순으로 정렬합니다.';

  @override
  String get genresRowItems => '장르 행 항목';

  @override
  String get genresRowItemsDescription => '장르 행에 영화, 시리즈 또는 둘 다를 표시합니다.';

  @override
  String get displayStudiosRows => '스튜디오 행 표시';

  @override
  String get displayStudiosRowsSubtitle => '홈 섹션에 스튜디오 행을 표시합니다.';

  @override
  String get studiosRowSorting => '스튜디오 행 정렬';

  @override
  String get studiosRowSortingDescription => '스튜디오 행을 이름순, 최근 추가순 등으로 정렬합니다.';

  @override
  String get studiosRowSortOrderDescription => '오름차순 또는 내림차순 정렬 순서를 선택하세요.';

  @override
  String get selectStudiosToInclude => '포함할 스튜디오 선택';

  @override
  String get selectStudiosToIncludeDescription => '홈 행에 포함할 스튜디오를 선택하세요.';

  @override
  String get selectAllStudios => '모두 선택';

  @override
  String get deselectAllStudios => '모두 선택 해제';

  @override
  String get tvStudiosFilter => 'TV 스튜디오';

  @override
  String get movieStudiosFilter => '영화 스튜디오';

  @override
  String get selectedStudiosFilter => '선택된 스튜디오';

  @override
  String get unselectedStudiosFilter => '선택되지 않은 스튜디오';

  @override
  String get filtersHeader => '필터';

  @override
  String get showHeader => '표시';

  @override
  String get displayPlaylistsRows => '재생목록 행 표시';

  @override
  String get displayPlaylistsRowsSubtitle => '홈 섹션에 재생목록 행을 표시합니다.';

  @override
  String get playlistsRowSorting => '재생목록 행 정렬';

  @override
  String get playlistsRowSortingDescription =>
      '재생목록 행을 추가된 날짜, 출시일, 가나다순 등으로 정렬합니다.';

  @override
  String get playlistsRowSortOrderDescription =>
      '재생목록 행을 오름차순 또는 내림차순으로 정렬합니다.';

  @override
  String get playlistsRowShowEpisodes => '개별 에피소드 표시';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'TV 프로그램을 펼쳐 각 에피소드를 별도로 표시합니다.';

  @override
  String get displayAudioRows => '오디오 행 표시';

  @override
  String get displayAudioRowsSubtitle => '홈 섹션에 오디오 행을 표시합니다.';

  @override
  String get audioRowsSorting => '오디오 행 정렬';

  @override
  String get audioRowsSortingDescription =>
      '오디오 행을 추가된 날짜, 출시일, 가나다순 등으로 정렬합니다.';

  @override
  String get audioRowsSortOrderDescription => '오디오 행을 오름차순 또는 내림차순으로 정렬합니다.';

  @override
  String get sorting => 'Sorting';

  @override
  String get imdbRowsSorting => 'IMDb Row Sorting';

  @override
  String get imdbRowsSortingDescription =>
      'Sort IMDb rows by name, release date, rating, and more.';

  @override
  String get imdbRowsSortOrderDescription =>
      'Sort IMDb rows in ascending or descending order.';

  @override
  String get tmdbRowsSorting => 'TMDB Row Sorting';

  @override
  String get tmdbRowsSortingDescription =>
      'Sort TMDB rows by name, release date, rating, and more.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'Sort TMDB rows in ascending or descending order.';

  @override
  String get seerrRowsSorting => 'Seerr Row Sorting';

  @override
  String get seerrRowsSortingDescription =>
      'Sort Seerr rows by name, release date, rating, and more.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Sort Seerr rows in ascending or descending order.';

  @override
  String get externalRowSortDefault => 'Default (List Order)';

  @override
  String get externalRowSortName => 'Name';

  @override
  String get externalRowSortReleaseDate => 'Release Date';

  @override
  String get externalRowSortRating => 'Rating';

  @override
  String get externalRowSortPopularity => 'Popularity';

  @override
  String get externalRowSortShuffle => 'Shuffle';

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
  String get cardSize => '카드 크기';

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
  String get locallyDecodedCodecs => '로컬에서 디코딩하는 코덱';

  @override
  String get transcodeTargetCodecs => '트랜스코딩 대상 코덱';

  @override
  String get passthrough => '패스스루';

  @override
  String get supportedOnThisDevice => '이 기기에서 지원됨';

  @override
  String get notSupportedOnThisDevice => '이 기기에서 지원되지 않음';

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
  String get hevcSoftwareDirectPlay => 'Direct Play HEVC (Software Decode)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'Play HEVC up to 1080p from the original file instead of asking the server to transcode it. This Apple TV decodes it in software, so heavy 10-bit or high bitrate files may stutter.';

  @override
  String get av1SoftwareUhdDirectPlay => 'Direct Play 4K AV1 (Software Decode)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      'Play AV1 above 1080p, including HDR10, from the original file instead of asking the server to transcode it. This device decodes AV1 in software, so heavy 4K or high bitrate files may stutter.';

  @override
  String get useExternalPlayer => '항상 외부 플레이어 사용';

  @override
  String get useExternalPlayerSubtitle => 'Android TV에서 선택한 외부 앱으로 영상을 재생합니다.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => '자동 대기열 추가';

  @override
  String get preferSdhSubtitles => 'SDH 자막 우선';

  @override
  String get preferSdhSubtitlesSubtitle => '자막을 자동으로 선택할 때 SDH/CC 트랙을 우선합니다.';

  @override
  String get preferTextSubtitles => '텍스트 자막 우선';

  @override
  String get preferTextSubtitlesSubtitle =>
      '이미지 기반 형식(PGS, VobSub)보다 텍스트 기반 자막(SRT, VTT)을 우선합니다.';

  @override
  String get preferExternalSubtitles => '외부 자막 우선';

  @override
  String get preferExternalSubtitlesSubtitle => '내장 트랙보다 외부 자막 파일을 우선합니다.';

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
  String get recentlyReleasedEpisodes => '최근 출시된 에피소드';

  @override
  String get watchAgain => '다시 보기';

  @override
  String get guestAppearances => '특별 출연';

  @override
  String get appearancesSeerr => '출연작(Seerr)';

  @override
  String get crewContributionsSeerr => '제작 참여작(Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => '그룹과 함께 보기';

  @override
  String get watchPartyGroupSubtitles => 'Subtitles for everyone';

  @override
  String get watchPartyOwnSubtitles => 'Each person\'s choice';

  @override
  String get watchPartyLobby => 'In the lobby';

  @override
  String get watchPartyUpNextLabel => 'Up next';

  @override
  String get watchPartyRoomSettings => 'Room settings';

  @override
  String get watchPartyCodeOrLink => 'Room code or invite link';

  @override
  String get watchPartyCopyInvite => 'Copy invite link';

  @override
  String get watchPartyInviteCopied => 'Invite link copied';

  @override
  String get watchPartyLetEveryoneVote => 'Let everyone vote on movies';

  @override
  String get watchPartyVoteHelp =>
      'Add movies for everyone to vote on, then play the one you want. TV episodes are still your pick.';

  @override
  String get watchPartyGuestVoteHelp =>
      'Vote for what you want to watch. The host plays one.';

  @override
  String get watchPartySearchMovies => 'Search movies';

  @override
  String get watchPartyNoSuggestions => 'No movies to vote on yet.';

  @override
  String get watchPartySuggested => 'Added to the Watch Party vote';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count votes',
      one: '$count vote',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => 'Watch Party';

  @override
  String get watchPartyUnavailable => 'This server doesn\'t offer Watch Party.';

  @override
  String get watchPartyRoomCode => 'Room code';

  @override
  String get watchPartyStart => 'Start a Watch Party';

  @override
  String get watchPartyPickTitle =>
      'Open a title and choose Watch with group to pick what everyone watches.';

  @override
  String get watchPartyWaitingForHost =>
      'Waiting for the host to pick something.';

  @override
  String get watchPartyShareCode =>
      'Others join with this code from their Watch Party screen.';

  @override
  String get watchPartyReconnecting => 'Reconnecting...';

  @override
  String get watchPartyOffline => 'offline';

  @override
  String get watchPartyStartForEveryone => 'Start for everyone';

  @override
  String get watchPartyBackToLobby => 'Back to the lobby';

  @override
  String get watchPartyGuestsCanPause => 'Guests can play and pause';

  @override
  String get watchPartyEnd => 'End Watch Party';

  @override
  String get watchPartyEnded => 'The Watch Party has ended.';

  @override
  String get watchPartyStaged => 'Picked for the Watch Party';

  @override
  String watchPartyUpNext(String title) {
    return 'Up next: $title';
  }

  @override
  String get disk => '디스크';

  @override
  String get openInBrowser => '브라우저에서 열기';

  @override
  String get achievementBadges => '업적 배지';

  @override
  String get achievementBadgesSubtitle => '시청 기록으로 얻은 배지, 등급, 퀘스트';

  @override
  String get achievementsBadges => '배지';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '배지 $total개 중 $unlocked개';
  }

  @override
  String get achievementsUnlockToasts => '달성 알림';

  @override
  String get achievementsUnlockToastsSubtitle => '배지를 얻으면 알림을 표시합니다';

  @override
  String get achievementsUnlockedNotification => '업적 달성';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '업적 $count개 달성',
      one: '업적 $count개 달성',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count개 더';
  }

  @override
  String get achievementsQuests => '퀘스트';

  @override
  String achievementsQuestCount(int count) {
    return '$count개 완료';
  }

  @override
  String get achievementsLeaderboard => '순위표';

  @override
  String get achievementsLeaderboardSubtitle => '이 서버의 다른 사용자와 비교한 내 순위';

  @override
  String get achievementsRecap => '요약';

  @override
  String get achievementsRecapSubtitle => '최근에 시청한 콘텐츠';

  @override
  String get achievementsLibraryCompletion => '라이브러리 달성률';

  @override
  String achievementsLibraryCount(int count) {
    return '라이브러리 $count개';
  }

  @override
  String achievementsScore(int score) {
    return '$score점';
  }

  @override
  String get achievementsScoreLabel => '점수';

  @override
  String get achievementsTopRank => '최고 등급 달성';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$tier까지 $points점';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days일 연속';
  }

  @override
  String achievementsBestStreak(int days) {
    return '최고 기록: $days일';
  }

  @override
  String get achievementsShowcase => '쇼케이스';

  @override
  String get achievementsUnlocked => '달성';

  @override
  String get achievementsLocked => '미달성';

  @override
  String get achievementsNothingHere => '아직 아무것도 없습니다.';

  @override
  String get achievementsHiddenBadge => '숨겨진 업적';

  @override
  String achievementsUnlockedOn(String date) {
    return '$date 달성';
  }

  @override
  String achievementsPoints(int points) {
    return '$points점';
  }

  @override
  String get achievementsDailyQuests => '일일';

  @override
  String get achievementsWeeklyQuests => '주간';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => '일일 퀘스트 다시 뽑기';

  @override
  String get achievementsRerollWeekly => '주간 퀘스트 다시 뽑기';

  @override
  String get achievementsRerollOffer => '이 퀘스트 세트를 다른 세트로 바꿉니다';

  @override
  String get achievementsRerollSpentDaily => '오늘 사용함, UTC 자정에 다시 사용 가능';

  @override
  String get achievementsRerollSpentWeekly => '이번 주 사용함, UTC 기준 월요일에 다시 사용 가능';

  @override
  String get achievementsRerollConfirm => '퀘스트를 다시 뽑을까요?';

  @override
  String get achievementsRerollConfirmBody =>
      '다시 뽑기는 일일·주간 각각 한 번만 할 수 있으며, 지금 사용하게 됩니다.';

  @override
  String get achievementsRerollFailed => '퀘스트를 다시 뽑지 못했습니다.';

  @override
  String get achievementsSuggested => '추천 시청 항목';

  @override
  String get achievementsNoSuggestions => '이 배지에 추천할 항목이 없습니다.';

  @override
  String get achievementsProgressLabel => '진행률';

  @override
  String get achievementsLoadout => '보유 아이템';

  @override
  String get achievementsLoadoutSubtitle => '사용할 수 있는 점수와 보유한 부스트';

  @override
  String get achievementsAppearance => '꾸미기';

  @override
  String get achievementsAppearanceSubtitle => '프로필의 아바타와 칭호';

  @override
  String get achievementsAvatars => '아바타';

  @override
  String get achievementsTitles => '칭호';

  @override
  String get achievementsEquipped => '착용 중';

  @override
  String get achievementsOwned => '보유';

  @override
  String achievementsEarnedAt(int score) {
    return '누적 점수 $score점 달성 시 획득';
  }

  @override
  String get achievementsAppearanceEmpty => '이 서버에는 사용할 수 있는 아바타나 칭호가 없습니다.';

  @override
  String get achievementsAppearanceFailed => '프로필 꾸미기를 변경하지 못했습니다.';

  @override
  String get achievementsPowerUps => '파워업';

  @override
  String get achievementsStats => '통계';

  @override
  String get achievementsStatsSubtitle => '내 기록과 서버 현황';

  @override
  String get achievementsStatsWatched => '시청';

  @override
  String get achievementsStatsBests => '최고 기록';

  @override
  String get achievementsStatsHabits => '시청 습관';

  @override
  String get achievementsStatsVariety => '다양성';

  @override
  String get achievementsStatsServer => '이 서버';

  @override
  String get achievementsStatsClock => '시청 시간대';

  @override
  String get achievementsStatItems => '시청한 항목';

  @override
  String get achievementsStatMovies => '시청한 영화';

  @override
  String get achievementsStatSeries => '완주한 시리즈';

  @override
  String get achievementsStatHours => '시청 시간';

  @override
  String get achievementsStatDays => '시청한 날';

  @override
  String get achievementsStatRewatches => '다시 본 횟수';

  @override
  String get achievementsStatBestWatchStreak => '최장 연속 시청';

  @override
  String get achievementsStatBestLoginStreak => '최장 연속 로그인';

  @override
  String get achievementsStatMostEpisodes => '하루 최다 에피소드';

  @override
  String get achievementsStatMostMovies => '하루 최다 영화';

  @override
  String get achievementsStatLongestItem => '가장 긴 단일 항목';

  @override
  String get achievementsStatBestCombo => '최고 콤보';

  @override
  String get achievementsStatLateNight => '심야 시청';

  @override
  String get achievementsStatEarlyMorning => '새벽 시청';

  @override
  String get achievementsStatWeekend => '주말 시청';

  @override
  String get achievementsStatDaysSignedIn => '로그인한 날';

  @override
  String get achievementsStatLibraries => '방문한 라이브러리';

  @override
  String get achievementsStatGenres => '시청한 장르';

  @override
  String get achievementsStatDecades => '시청한 연대';

  @override
  String get achievementsStatCountries => '시청한 국가';

  @override
  String get achievementsStatLanguages => '시청한 언어';

  @override
  String get achievementsStatUsers => '사용자';

  @override
  String get achievementsStatBadgesUnlocked => '획득한 배지';

  @override
  String get achievementsStatScoreEarned => '획득한 점수';

  @override
  String get achievementsStatCommonBadge => '가장 흔한 배지';

  @override
  String get achievementsActivity => '활동';

  @override
  String get achievementsActivitySubtitle => '서버에서 최근 달성된 업적';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user님이 $badge 획득';
  }

  @override
  String get achievementsShop => '상점';

  @override
  String get achievementsShopSubtitle => '점수로 부스트 구매';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => '지금은 판매 중인 항목이 없습니다.';

  @override
  String get achievementsBuyConfirm => '구매할까요?';

  @override
  String get achievementsBuyConfirmBody => '보유 점수에서 바로 차감됩니다.';

  @override
  String get achievementsBuyFailed => '구매하지 못했습니다.';

  @override
  String get achievementsScoreBank => '보유 점수';

  @override
  String get achievementsBoost => 'XP 부스트';

  @override
  String get achievementsBoostBody =>
      '1시간 동안 점수가 두 배가 됩니다. 다시 사용하면 1시간이 새로 시작됩니다.';

  @override
  String get achievementsDoubleCredit => '더블 크레딧';

  @override
  String get achievementsDoubleCreditBody => '다음에 완료하는 항목이 배지 진행에 두 번 반영됩니다.';

  @override
  String get achievementsStreakFreeze => '연속 기록 보호';

  @override
  String get achievementsStreakFreezeBody =>
      '하루를 놓쳐도 연속 기록을 유지합니다. 한 번에 하나만 보유할 수 있습니다.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 보유',
      one: '1개 보유',
      zero: '보유 안 함',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => '사용 중';

  @override
  String get achievementsUsePowerUp => '이 파워업을 사용할까요?';

  @override
  String get achievementsUsePowerUpBody => '확인하는 즉시 사용됩니다.';

  @override
  String get achievementsPowerUpFailed => '파워업을 사용하지 못했습니다.';

  @override
  String get achievementsHours => '시간';

  @override
  String get achievementsStreak => '연속 기록';

  @override
  String get achievementsPeriodWeek => '주';

  @override
  String get achievementsPeriodMonth => '월';

  @override
  String get achievementsPeriodYear => '연';

  @override
  String achievementsDaysWatched(int count) {
    return '$count일 시청';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '배지 $count개 획득';
  }

  @override
  String get achievementsTopDirectors => '가장 많이 본 감독';

  @override
  String get achievementsTopActors => '가장 많이 본 배우';

  @override
  String get achievementsLoadFailed => '업적을 불러오지 못했습니다.';

  @override
  String get friends => '친구';

  @override
  String get friendsSubtitle => '이 서버에서 접속 중인 사람을 확인하고 채팅합니다';

  @override
  String get friendsShowButton => '친구 버튼 표시';

  @override
  String get friendsShowButtonSubtitle => 'Achievement Badges 플러그인의 친구 및 채팅';

  @override
  String get friendsMessages => '메시지';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '읽지 않은 메시지 $count개',
      one: '읽지 않은 메시지 1개',
      zero: '읽지 않은 메시지 없음',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => '친구 요청';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '대기 중인 요청 $count개',
      one: '대기 중인 요청 1개',
      zero: '대기 중인 요청 없음',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => '친구 추가';

  @override
  String get friendsAddSubtitle => '이 서버의 사용자 찾기';

  @override
  String get friendsPrivacy => '개인 정보 보호';

  @override
  String get friendsPrivacySubtitle => '친구에게 보이는 정보';

  @override
  String get friendsOnline => '온라인';

  @override
  String get friendsOffline => '오프라인';

  @override
  String get friendsNone => '아직 친구가 없습니다. 이 서버의 사용자를 추가하면 여기에 표시됩니다.';

  @override
  String friendsWatching(String title) {
    return '$title 시청 중';
  }

  @override
  String friendsLastWatched(String title) {
    return '마지막 시청: $title';
  }

  @override
  String friendsLastSeen(String time) {
    return '마지막 접속: $time';
  }

  @override
  String get friendsLoadFailed => '불러오지 못했습니다. 연결을 확인하고 다시 시도하세요.';

  @override
  String get friendsActionFailed => '작업에 실패했습니다. 잠시 후 다시 시도하세요.';

  @override
  String get friendsIncoming => '받은 요청';

  @override
  String get friendsOutgoing => '보낸 요청';

  @override
  String get friendsNoRequests => '친구 요청이 없습니다.';

  @override
  String get friendsAccept => '수락';

  @override
  String get friendsDecline => '거절';

  @override
  String get friendsCancelRequest => '요청 취소';

  @override
  String friendsRequestFrom(String name) {
    return '$name님이 친구 요청을 보냈습니다';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return '$name님에게 보낸 요청을 취소할까요?';
  }

  @override
  String get friendsSearchHint => '사용자 검색';

  @override
  String get friendsNoMatches => '일치하는 사용자가 없습니다.';

  @override
  String friendsRequestSent(String name) {
    return '$name님에게 요청을 보냈습니다';
  }

  @override
  String get friendsSendRequest => '친구 추가';

  @override
  String get friendsSendMessage => '메시지 보내기';

  @override
  String friendsOpenItem(String title) {
    return '$title 열기';
  }

  @override
  String get friendsRemove => '친구 삭제';

  @override
  String friendsRemoveBody(String name) {
    return '$name님을 친구에서 삭제할까요? 나중에 다시 추가할 수 있습니다.';
  }

  @override
  String get friendsBlock => '차단';

  @override
  String get friendsUnblock => '차단 해제';

  @override
  String friendsBlockBody(String name) {
    return '$name님을 차단할까요? 서로 직접 메시지를 보낼 수 없게 됩니다. 함께 있는 그룹 채팅은 그대로 유지됩니다.';
  }

  @override
  String friendsUnblockBody(String name) {
    return '$name님을 차단 해제할까요?';
  }

  @override
  String get friendsBlocked => '차단한 사용자';

  @override
  String friendsProfileHidden(String name) {
    return '$name님은 프로필을 비공개로 설정했습니다.';
  }

  @override
  String get friendsAppearOffline => '오프라인으로 표시';

  @override
  String get friendsAppearOfflineSubtitle => '친구에게 항상 오프라인으로 보입니다';

  @override
  String get friendsHideNowPlaying => '시청 중인 항목 숨기기';

  @override
  String get friendsHideNowPlayingSubtitle =>
      '친구에게 온라인으로는 보이지만 재생 중인 항목은 보이지 않습니다';

  @override
  String get friendsHideLastWatched => '마지막 시청 항목 숨기기';

  @override
  String get friendsHideLastWatchedSubtitle =>
      '오프라인일 때 친구에게 마지막으로 본 항목이 보이지 않습니다';

  @override
  String get friendsMessageNotifications => '메시지 알림';

  @override
  String get friendsMessageNotificationsSubtitle => '친구가 메시지를 보내면 배너를 표시합니다';

  @override
  String get friendsMuteDuringPlayback => '재생 중 알림 끄기';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      '영상이나 게임을 플레이하는 동안 메시지 배너를 표시하지 않습니다';

  @override
  String get friendsSaveFailed => '설정을 저장하지 못했습니다.';

  @override
  String get chatNew => '새 메시지';

  @override
  String get chatNewSubtitle => '친구와 채팅 시작';

  @override
  String get chatNewGroup => '새 그룹';

  @override
  String get chatNewGroupSubtitle => '여러 친구와 함께 채팅';

  @override
  String get chatNone => '아직 메시지가 없습니다.';

  @override
  String get chatYou => '나';

  @override
  String chatYouSaid(String text) {
    return '나: $text';
  }

  @override
  String get chatPhoto => '사진';

  @override
  String get chatEmoji => '이모지';

  @override
  String get chatEmojiSearch => '이모지 검색';

  @override
  String get chatNoRecentEmoji => '최근 사용한 이모지 없음';

  @override
  String get chatViewPhoto => '사진 보기';

  @override
  String get chatHint => '메시지 입력';

  @override
  String get chatAttach => '사진 보내기';

  @override
  String get chatEdited => '수정됨';

  @override
  String get chatSeen => '읽음';

  @override
  String get chatSent => '보냄';

  @override
  String get chatEditing => '메시지 수정 중';

  @override
  String get chatMessageOptions => '메시지 옵션';

  @override
  String get chatDeleteBody => '모든 사람에게서 이 메시지를 삭제할까요?';

  @override
  String get chatClear => '대화 내용 지우기';

  @override
  String get chatClearBody => '이 채팅의 모든 메시지를 참여자 전원에게서 삭제할까요?';

  @override
  String get chatGroupInfo => '그룹 정보';

  @override
  String get chatGroupName => '그룹 이름';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 $count명',
      one: '멤버 1명',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => '소유자';

  @override
  String get chatAdmin => '관리자';

  @override
  String get chatMakeAdmin => '관리자로 지정';

  @override
  String get chatRemoveAdmin => '관리자 해제';

  @override
  String get chatRemoveMember => '그룹에서 내보내기';

  @override
  String get chatAddMember => '사람 추가';

  @override
  String get chatNobodyToAdd => '추가할 사람이 없습니다.';

  @override
  String get chatLeave => '그룹 나가기';

  @override
  String get chatLeaveBody => '이 그룹을 나갈까요? 다시 참여하려면 다른 사람이 추가해 줘야 합니다.';

  @override
  String get chatCreate => '그룹 만들기';

  @override
  String get chatPickMembers => '친구를 두 명 이상 선택하세요';

  @override
  String chatNewMessageFrom(String name) {
    return '$name님의 새 메시지';
  }

  @override
  String get chatImageTooLarge => '이미지가 8MB를 넘습니다.';

  @override
  String get chatImageUnsupported => 'PNG, JPEG, GIF, WebP 이미지만 보낼 수 있습니다.';

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
  String get analyticsLibraryShare => '라이브러리별 항목 비율';

  @override
  String get analyticsTopRating => '가장 많은 등급';

  @override
  String get analyticsTypicalRuntime => '일반적인 상영 시간';

  @override
  String analyticsShareOfItems(String percent) {
    return '항목의 $percent%';
  }

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
  String get homeVideos => '홈 비디오';

  @override
  String get mixedContent => '혼합 콘텐츠';

  @override
  String get homeVideosAndPhotos => '홈 비디오 및 사진';

  @override
  String get mixedMoviesAndShows => '영화 및 TV 프로그램 혼합';

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
  String get audiobookFullTimeline => '전체 타임라인';

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
  String get subtitlePreferencesDescription =>
      '자막 모드, 기본 언어, 모양, 렌더링 옵션을 변경합니다.';

  @override
  String get subtitleRendering => '자막 렌더링';

  @override
  String get displayOptions => '표시 옵션';

  @override
  String get releaseDateAscending => '출시일순(오름차순)';

  @override
  String get releaseDateDescending => '출시일순(내림차순)';

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
  String get replay => '다시 재생';

  @override
  String get fileInformation => '파일 정보';

  @override
  String fileSizeFormat(Object size, Object format) {
    return '크기: $size  •  형식: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return '추가된 날짜: $date';
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
  String transcodeAudioCodecWithCodec(String codec) {
    return '오디오 코덱($codec)을 직접 지원하지 않습니다.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return '팁: 오디오 리시버나 사운드바가 $codec을(를) 지원하면 오디오 설정에서 오디오 패스스루를 켜세요.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return '오디오 채널 수(${channels}ch)가 플레이어 한도를 초과합니다.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      '팁: 오디오 설정에서 \'최대 오디오 채널\' 또는 멀티채널 다운믹스를 조정하세요.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      '다이렉트 재생이 꺼져 있어 ASS/SSA 자막을 트랜스코딩해야 합니다.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      '팁: 재생 설정에서 \'ASS/SSA 다이렉트 재생\'을 켜면 트랜스코딩 없이 바로 재생할 수 있습니다.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      '다이렉트 재생이 꺼져 있어 PGS 자막을 트랜스코딩해야 합니다.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      '팁: 재생 설정에서 \'PGS 다이렉트 재생\'을 켜면 트랜스코딩 없이 바로 재생할 수 있습니다.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return '자막 형식($codec)을 직접 지원하지 않아 영상에 입혀야 합니다.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return '파일 비트레이트($fileBitrate)가 설정된 스트리밍 한도($maxBitrate)를 초과합니다.';
  }

  @override
  String get transcodeBitrateHint =>
      '팁: 재생 설정에서 \'최대 비트 전송률\'을 높이면 다이렉트 스트리밍이 가능합니다.';

  @override
  String get transcodeResolutionHint =>
      '팁: 재생 설정에서 \'최대 해상도\'를 높이면 다이렉트 스트리밍이 가능합니다.';

  @override
  String get transcodeVideoRangeNotSupported =>
      '이 디스플레이는 영상의 다이내믹 레인지(예: Dolby Vision / HDR)를 지원하지 않습니다.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Dolby Vision 프로필 7 향상 레이어의 다이렉트 재생이 꺼져 있습니다.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      '팁: 디스플레이가 지원하면 재생 설정에서 \'Dolby Vision 프로필 7 다이렉트 재생\'을 켜세요.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      '사용자 설정에 따라 Dolby Vision 대체 시 트랜스코딩을 우선합니다.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      '팁: 트랜스코딩을 피하려면 재생 설정에서 \'Dolby Vision 대체\'를 \'HDR10으로 재생\'으로 설정하세요.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      '연결된 디스플레이가 HDR 또는 Dolby Vision 지원을 알리지 않습니다.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      '연결된 디스플레이가 Dolby Vision 대체에 필요한 HDR10을 지원하지 않습니다.';

  @override
  String get transcodeAudioSampleRateNotSupported => '지원하지 않는 오디오 샘플링 속도입니다.';

  @override
  String get transcodeAudioBitDepthNotSupported => '지원하지 않는 오디오 비트 심도입니다.';

  @override
  String get transcodeRefFramesNotSupported => '영상의 참조 프레임 수가 플레이어 한도를 초과합니다.';

  @override
  String get transcodeAnamorphicVideoNotSupported => '애너모픽 영상은 지원하지 않습니다.';

  @override
  String get transcodeInterlacedVideoNotSupported => '인터레이스 영상은 지원하지 않습니다.';

  @override
  String get transcodeSecondaryAudioNotSupported => '보조 오디오 스트림은 트랜스코딩이 필요합니다.';

  @override
  String get transcodeDirectPlayError => '이 미디어 형식은 다이렉트 재생을 지원하지 않습니다.';

  @override
  String get sortServerOrder => 'Server Order';

  @override
  String get sortAlphabetical => '가나다순';

  @override
  String get sortReleaseAscending => '출시순(오름차순)';

  @override
  String get sortReleaseDescending => '출시순(내림차순)';

  @override
  String get sortCustomDragDrop => '사용자 지정(끌어서 놓기)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

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

  @override
  String get addToWatchlist => '관심 목록에 추가';

  @override
  String get removeFromWatchlist => '관심 목록에서 제거';

  @override
  String get watchlistUpdateFailed => '관심 목록을 업데이트하지 못했습니다';

  @override
  String get adminSearchParameters => '검색 매개변수';

  @override
  String get adminCurrentMetadata => '현재 메타데이터';

  @override
  String get adminLabelYear => '연도';

  @override
  String get adminReplaceImages => '기존 이미지 바꾸기';

  @override
  String get adminBackToSearch => '검색 조건으로 돌아가기';

  @override
  String get grouping => '그룹화';

  @override
  String get groupByType => '유형별로 그룹화';

  @override
  String get playlistTypes => '재생목록 유형';

  @override
  String get playlistTypeVideo => '비디오';

  @override
  String get playlistTypeMusicVideo => '뮤직비디오';

  @override
  String get playlistTypeAudio => '오디오(음악)';

  @override
  String get playlistTypeAudiobook => '오디오북';

  @override
  String get playlistTypeBook => '도서';

  @override
  String get playlistTypePhoto => '사진';

  @override
  String get playlistTypeMixed => '혼합';

  @override
  String get videoPlaylistsSection => '비디오 재생목록';

  @override
  String get musicVideoPlaylistsSection => '뮤직비디오 재생목록';

  @override
  String get audioPlaylistsSection => '오디오 재생목록';

  @override
  String get audiobookPlaylistsSection => '오디오북 재생목록';

  @override
  String get bookPlaylistsSection => '도서 재생목록';

  @override
  String get photoPlaylistsSection => '사진 재생목록';

  @override
  String get mixedPlaylistsSection => '혼합 재생목록';

  @override
  String get currentTime => '현재 시각';

  @override
  String get playbackTimeDisplay => '진행 바 시간';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      '재생 진행 바 주변에 표시할 시간 레이블을 선택하세요.';

  @override
  String get playbackTimeTotal => '총 재생 시간';

  @override
  String get playbackTimeRemaining => '남은 시간';

  @override
  String get playbackTimeEndsAt => '종료 시각';

  @override
  String get playbackTimeElapsed => '경과 시간';

  @override
  String get playbackTimeVideoSection => '비디오 플레이어';

  @override
  String get playbackTimeMusicSection => '음악 플레이어';

  @override
  String get playbackTimeSlotDescription => '여기에 표시할 항목을 선택하거나 숨깁니다.';

  @override
  String get playbackTimeAboveBarLeft => '바 위, 왼쪽';

  @override
  String get playbackTimeAboveBarCenter => '바 위, 가운데';

  @override
  String get playbackTimeAboveBarRight => '바 위, 오른쪽';

  @override
  String get playbackTimeBelowBarLeft => '바 아래, 왼쪽';

  @override
  String get playbackTimeBelowBarCenter => '바 아래, 가운데';

  @override
  String get playbackTimeBelowBarRight => '바 아래, 오른쪽';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      '음악 진행 바 오른쪽에 표시할 항목을 선택하세요.';

  @override
  String get groupByTitle => '그룹화 기준';

  @override
  String get groupByDecade => '연대(연도)';

  @override
  String get groupByParentalRating => '시청 등급';

  @override
  String get groupByStudio => '스튜디오';

  @override
  String get showAlphabeticalFilters => '알파벳 표시';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => '내 평가 방식';

  @override
  String get personalRatingThumbs => '좋아요 / 싫어요';

  @override
  String get personalRatingStars => '별점 5개';

  @override
  String get personalRatingNumeric => '10점 만점 점수';

  @override
  String get rate => '평가';

  @override
  String get like => '좋아요';

  @override
  String get dislike => '싫어요';

  @override
  String get personalRatingClear => '평가 지우기';

  @override
  String get personalRatingRated => '평가됨';

  @override
  String get personalRatingMine => '내 평가';

  @override
  String get personalRatingSaveFailed => '평가를 저장하지 못했습니다';

  @override
  String get increase => '증가';

  @override
  String get decrease => '감소';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => '진행 중';

  @override
  String get filterUnreleased => '미출시';

  @override
  String get filterTrailers => '예고편';

  @override
  String get filterExtras => '부가 영상';

  @override
  String get filterThemeSongs => '테마곡';

  @override
  String get filterThemeVideos => '테마 영상';

  @override
  String get source => '소스';

  @override
  String get years => '연도';

  @override
  String get audioLanguage => '오디오 언어';

  @override
  String get subtitleLanguage => '자막 언어';

  @override
  String get clearFilters => '필터 지우기';

  @override
  String get seerrShortcutsRow => 'Seerr 탐색';

  @override
  String get seerrReleased => '출시일';

  @override
  String get seerrMinRating => '최소 평점';

  @override
  String get seerrMinVotes => '최소 투표수';

  @override
  String get seerrOriginalLanguage => '원어';

  @override
  String get seerrRuntime => '재생 시간';

  @override
  String get subtitleHdrSeparate => '별도 HDR 스타일';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'HDR에서는 SDR보다 흰색이 훨씬 밝으므로, 더 어두운 스타일을 사용해 눈부심을 방지합니다';

  @override
  String get scrollSensitivity => '스크롤 민감도';

  @override
  String get scrollSensitivitySubtitle => '마우스 휠 한 칸당 스크롤되는 거리';

  @override
  String get mediaDetailsAndSpoilers => '미디어 상세 정보 및 스포일러';

  @override
  String get openTrailersExternally => '외부 앱에서 예고편 열기';

  @override
  String get openTrailersExternallySubtitle =>
      '내장 플레이어 대신 YouTube 앱 또는 브라우저에서 예고편을 엽니다';

  @override
  String get hideDetailsMediaDescription => '상세 페이지에서 미디어 설명 숨기기';

  @override
  String get hideDetailsMediaDescriptionSubtitle => '영화 또는 에피소드의 설명 텍스트를 숨깁니다.';

  @override
  String get detailUseSeriesThumbnails => '상세 페이지에서 시리즈 썸네일 사용';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      '클래식 상세 페이지의 모든 썸네일을 시리즈 썸네일로 대체합니다';

  @override
  String get hideHomeMediaDescription => '홈 화면에서 미디어 설명 숨기기';

  @override
  String get hideHomeMediaDescriptionSubtitle => '영화 또는 에피소드의 설명 텍스트를 숨깁니다.';

  @override
  String get hideHomeWatchProgress => 'Hide Watch Progress';

  @override
  String get hideHomeWatchProgressSubtitle =>
      'Hide the progress bar on posters you\'ve started watching.';

  @override
  String get hideHomeUnwatchedCount => 'Hide Unwatched Count';

  @override
  String get hideHomeUnwatchedCountSubtitle =>
      'Hide the badge showing how many episodes are left to watch.';

  @override
  String get continueWatchingAndNextUpHeader => '계속 시청 및 다음 볼 항목';

  @override
  String get setupSkip => '설정 건너뛰기';

  @override
  String get setupNavbarQuestion => '탐색 바를 어디에 배치할까요?';

  @override
  String get setupMediaBarQuestion => '홈 화면 상단을 어떻게 표시할까요?';

  @override
  String get setupHomeRowsQuestion => '홈 행을 어떻게 표시할까요?';

  @override
  String get setupDetailQuestion => '영화나 프로그램을 열었을 때 어떻게 표시할까요?';

  @override
  String get setupTourQuestion => '설정이 완료되었습니다. 그 밖의 기능을 살펴보세요.';

  @override
  String get setupPlaybackLanguages => '재생 언어';

  @override
  String get setupOptional => '선택 사항';

  @override
  String get setupStyleClassic => '클래식';

  @override
  String get setupStyleModern => '모던';

  @override
  String get setupRowsClassicHint => '간결한 레이아웃. 한 화면에 더 많은 행을 표시합니다.';

  @override
  String get setupRowsModernHint => '제목이 아래에 표시되는 더 큰 카드 레이아웃.';

  @override
  String get setupDetailClassicHint => '모든 정보가 중앙에 한 번에 정렬된 레이아웃.';

  @override
  String get setupDetailModernHint => '출연진 및 부가 영상 탭이 있는 시네마틱 레이아웃.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      '대표 이미지를 앞세우고 출연진과 부가 영상을 팝업 카드로 보여줍니다.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint => '전체 화면에 탭 대신 섹션을 차례로 쌓아 보여줍니다.';

  @override
  String get setupStyleMinimalist => 'Minimalist';

  @override
  String get setupDetailMinimalistHint => '아트워크, 재생 버튼 하나, 에피소드로만 구성됩니다.';

  @override
  String get setupNavbarStyleQuestion => '하단 바를 어떻게 표시할까요?';

  @override
  String get setupNavbarStyleDockHint => '모든 탭 아래에 이름이 표시되는 떠 있는 알약 모양 바입니다.';

  @override
  String get setupNavbarStyleSplitHint => '검색 버튼이 따로 있고, 스크롤하면 바가 작아집니다.';

  @override
  String get setupNavbarStyleStripHint => '화면 하단 가장자리를 따라 꽉 차는 바입니다.';

  @override
  String get setupPickALook => '스타일 선택';

  @override
  String get setupTourMoreHeader => '설정에서 더 많은 기능을 확인할 수 있습니다';

  @override
  String get setupTourBulletRequests => 'Seerr 미디어 요청';

  @override
  String get setupTourBulletSyncPlay => 'SyncPlay 함께 시청';

  @override
  String get setupTourBulletThemes => '사용자 지정 테마';

  @override
  String get setupTourBulletDownloads => '오프라인 다운로드';

  @override
  String get setupTourBulletMore => '그 외 다양한 기능';

  @override
  String setupStepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get setupCurrent => 'Current';

  @override
  String get setupTvHint =>
      'Up and down to preview · OK to choose · Back twice to skip';

  @override
  String get setupNavbarTopHint => 'Tabs across the top of the screen.';

  @override
  String get setupNavbarLeftHint => 'A slim rail of icons down the left side.';

  @override
  String get setupNavbarBottomHint =>
      'Tabs along the bottom edge, in easy reach of your thumb.';

  @override
  String get setupMediaBarMoonfinHint =>
      'Large artwork with the title, details and overview laid over it.';

  @override
  String get setupMediaBarMakdHint => 'Large artwork led by a big title logo.';

  @override
  String get setupMediaBarBookshelfHint =>
      'Titles shelved as book spines, with the featured one face out.';

  @override
  String get setupMediaBarGalleryHint =>
      'The featured title opened up, with the next few lined up beside it.';

  @override
  String get setupMediaBarBannerHint =>
      'A shorter banner above your rows, so more of them fit on screen.';

  @override
  String get setupMediaBarAyaHint =>
      'Artwork first in a framed panel, with your rows right underneath.';

  @override
  String get setupMediaBarOffHint =>
      'No featured area. Home opens straight onto your rows.';

  @override
  String get runSetupAgain => '초기 설정 다시 실행';

  @override
  String get serverMessages => '메시지';

  @override
  String get serverMessagesEmpty => '아직 서버에서 받은 메시지가 없습니다';

  @override
  String get serverMessagesMarkAllRead => '모두 읽음으로 표시';

  @override
  String get serverMessagesShowButton => '메시지 버튼 표시';

  @override
  String get serverMessagesShowButtonSubtitle =>
      '서버 관리자가 보낸 메시지를 보는 버튼을 메뉴에 추가합니다';

  @override
  String get showBookDiscoverTab => '도서 라이브러리 둘러보기 표시';

  @override
  String get showBookDiscoverTabDescription =>
      '도서 및 오디오북 라이브러리에서 Open Library와 LibriVox의 작품을 둘러봅니다';

  @override
  String get autoDownloadNewEpisodes => '새 에피소드 자동 다운로드';

  @override
  String get autoDownloadStop => '자동 다운로드 중지';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '시청하지 않은 에피소드를 최대 $count개까지 유지하며 새 에피소드를 다운로드합니다',
      one: '시청하지 않은 에피소드를 최대 1개까지 유지하며 새 에피소드를 다운로드합니다',
      zero: '새 에피소드를 모두 다운로드합니다',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return '켜짐 • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      '트랜스코딩 품질은 Moonfin이 열려 있을 때만 다운로드됩니다. 원본 품질은 백그라운드에서도 다운로드됩니다.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      '트랜스코딩 다운로드는 중단되면 이어받을 수 없어 처음부터 다시 시작합니다. 원본 품질은 이어받을 수 있습니다.';

  @override
  String get autoDownloadForegroundOnly => 'Moonfin이 열려 있을 때만 다운로드';

  @override
  String get autoDownloadQualityTitle => '자동 다운로드 품질';

  @override
  String autoDownloadEnabledFor(String title) {
    return '$title 자동 다운로드를 켰습니다';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return '$title 자동 다운로드를 중지했습니다';
  }

  @override
  String get smartDownloadsSection => '스마트 다운로드';

  @override
  String get smartDownloadsEnable => '다음 에피소드 다운로드';

  @override
  String get smartDownloadsEnableDescription =>
      'When you finish an episode on any device, Moonfin downloads the next ones. Episodes it downloads are deleted once watched.';

  @override
  String get smartDownloadsKeepReady => '다운로드해 둘 에피소드 수';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '다음 에피소드 $count개를 다운로드해 둡니다',
      one: '다음 에피소드 1개를 다운로드해 둡니다',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      '이미 다운로드한 에피소드는 기기에 그대로 남습니다. 새 개수는 이후 다운로드부터 적용됩니다.';

  @override
  String get autoDownloadSection => '자동 다운로드';

  @override
  String get autoDownloadEnable => '자동 다운로드 사용';

  @override
  String get autoDownloadEnableSubtitle =>
      '팔로우한 시리즈의 새 에피소드를 다운로드합니다. 기존 에피소드는 계속 직접 다운로드할 수 있습니다.';

  @override
  String get autoDownloadKeepUnwatched => '시청하지 않은 에피소드 유지';

  @override
  String get autoDownloadKeepAll => '전체';

  @override
  String get autoDownloadDelete => '다운로드한 에피소드 삭제';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'When to remove episodes downloaded for series you follow, after you watch them';

  @override
  String get removeWatchedDownloads => 'Remove Watched Downloads';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'When to remove episodes and movies you downloaded yourself. Only those you watch after turning this on are removed';

  @override
  String get keepDownloaded => 'Keep Downloaded';

  @override
  String get keepDownloadedSubtitle =>
      'Never remove this automatically after watching';

  @override
  String get autoDownloadDeleteNever => '안 함';

  @override
  String get autoDownloadDeleteImmediately => '시청 직후';

  @override
  String get autoDownloadDeleteAfterDay => '시청 1일 후';

  @override
  String get autoDownloadDeleteAfterWeek => '시청 1주일 후';

  @override
  String get autoDownloadBackgroundRefresh => '백그라운드에서 확인';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Moonfin이 닫혀 있어도 시스템이 주기적으로 새 에피소드를 확인할 수 있게 합니다';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Moonfin의 백그라운드 앱 새로 고침이 꺼져 있습니다. iOS 설정에서 켜세요.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Android 설정에서 Moonfin의 백그라운드 사용이 제한되어 있습니다.';

  @override
  String get autoDownloadCheckNow => '지금 확인';

  @override
  String get autoDownloadChecking => '확인 중...';

  @override
  String get autoDownloadNeverChecked => '아직 확인하지 않음';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '에피소드 $queued개 대기열에 추가',
      one: '에피소드 1개 대기열에 추가',
      zero: '새 항목 없음',
    );
    return '마지막 확인 $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return '마지막 확인 $when 실패: $error';
  }

  @override
  String get autoDownloadFollowedSeries => '팔로우한 시리즈';

  @override
  String get autoDownloadNoSubscriptions =>
      '시리즈를 열고 다운로드 메뉴에서 \"새 에피소드 자동 다운로드\"를 선택하세요';

  @override
  String get autoDownloadRemove => '팔로우 해제';

  @override
  String get autoDownloadStorageFull => '저장 공간 부족';

  @override
  String get autoDownloadWaitingForWifi => 'Wi-Fi 연결 대기 중';

  @override
  String get downloadNotificationRunning => '다운로드 중';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return '다운로드 중($done/$total)';
  }

  @override
  String downloadNotificationProgress(String name, int percent) {
    return '$name — $percent%';
  }

  @override
  String downloadNotificationTransfer(
    String name,
    String progress,
    String timeRemaining,
  ) {
    return '$name — $progress · $timeRemaining';
  }

  @override
  String downloadNotificationStarting(String name) {
    return '$name...';
  }

  @override
  String downloadNotificationCompleteTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '다운로드 완료',
      one: '다운로드 완료',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name을(를) 오프라인용으로 저장했습니다';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '항목 $count개를 오프라인용으로 저장했습니다',
      one: '항목 1개를 오프라인용으로 저장했습니다',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '에피소드 $count개',
      one: '에피소드 1개',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => '다운로드 실패';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => '원격 메시지';

  @override
  String get serverMessagesNotificationReceived => '메시지를 받았습니다';

  @override
  String get downloadStorageLimitReached =>
      '저장 한도에 도달했습니다. 공간을 확보하거나 한도를 늘리세요.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return '저장 공간 부족: $needed 필요, $free 남음';
  }

  @override
  String get autoDownloadStorageFullTitle => '새 에피소드를 저장할 공간이 부족합니다';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '에피소드 $count개가 공간을 기다리고 있습니다.',
      one: '$name에 $size이(가) 필요합니다.',
    );
    return '$_temp0 공간을 확보하거나 다운로드 한도를 늘리세요.';
  }

  @override
  String get pageTransitions => '페이지 전환';

  @override
  String get pageTransitionsSubtitle => '페이지를 이동할 때 페이드 시간을 조정합니다';

  @override
  String get navigationSpeed => '탐색 속도';

  @override
  String get navigationSpeedSubtitle => '포커스 표시가 항목과 행 사이를 이동하는 속도를 조정합니다';

  @override
  String get modernCardsTransitionSpeed => '모던 카드 전환 속도';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      '포커스된 모던 카드가 펼쳐질 때의 애니메이션 속도를 조정합니다';

  @override
  String get delayCardExpansionOnRapidScroll => '빠른 스크롤 시 카드 펼치기 지연';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      '포커스 이동이 멈춘 뒤에 모던 카드를 펼칩니다';

  @override
  String get animationSpeedExtraSlow => '매우 느리게';

  @override
  String get animationSpeedSlow => '느리게';

  @override
  String get animationSpeedMedium => '보통';

  @override
  String get animationSpeedFast => '빠르게';

  @override
  String get animationSpeedOff => '끔';

  @override
  String get pageTransitionFadeNone => '페이드 없음';

  @override
  String get pageTransitionFadeShort => '짧은 페이드';

  @override
  String get pageTransitionFadeMedium => '보통 페이드';

  @override
  String get pageTransitionFadeLong => '긴 페이드';

  @override
  String get siriRemoteSwipeSensitivity => '터치패드 스와이프 감도';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'Siri Remote 터치패드를 한 번 스와이프할 때 포커스가 이동하는 거리';

  @override
  String get appleTvHomeScreen => 'Apple TV 홈 화면';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'Moonfin 아이콘을 선택했을 때 Apple TV 홈 화면에서 아이콘 위에 표시되는 내용입니다. 이 설정은 이 기기에만 저장됩니다.';

  @override
  String get topShelfLatestMedia => '최신 미디어';

  @override
  String get topShelfAppBanner => 'Moonfin 배너';

  @override
  String get keepVideoClearOfDynamicIsland => 'Dynamic Island를 피해 영상 표시';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      '가로 모드에서는 카메라 부분이 화면 한쪽을 가립니다. 이 설정은 영상을 그 부분에서 떨어뜨려 표시하며, 그만큼 넓은 영상에서만 차이가 있습니다.';

  @override
  String get bottomNavbarStyle => '하단 바 스타일';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Split';

  @override
  String get bottomNavbarStyleStrip => 'Strip';

  @override
  String get bottomNavbarTabs => '하단 바 탭';

  @override
  String get bottomNavbarTabsDescription =>
      '홈과 \'나\' 사이에 탭을 최대 3개까지 고정할 수 있습니다. 나머지는 하단 바 허브에 있습니다.';

  @override
  String get bottomNavbarTabsAutomatic => '자동';

  @override
  String get bottomNavbarTabsPinned => '고정됨';

  @override
  String get bottomNavbarTabsAvailable => '추가 가능';

  @override
  String get bottomNavbarTabsReset => '자동으로 초기화';

  @override
  String get bottomNavbarTabsLimit =>
      '탭은 최대 3개까지 고정할 수 있습니다. 다른 탭을 고정하려면 하나를 제거하세요.';

  @override
  String get bottomNavbarTabTurnedOff => '버튼 설정에서 꺼져 있음';

  @override
  String get bottomNavbarSplitSearchNote => 'Split 스타일에서는 검색 버튼이 항상 따로 표시됩니다.';

  @override
  String get bottomNavbarButtonsNote =>
      '하단 바 허브에 표시할 항목과 하단 바에 고정할 수 있는 탭을 정합니다. 이미 바에 있는 탭은 여기에 나열되지 않습니다.';

  @override
  String get navYou => '나';

  @override
  String get cinemaSkipPrerolls => 'Cinema Mode Skip Button';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Show a Skip button during Cinema Mode trailers, commercials, and other pre-rolls.';

  @override
  String get detailsPage => '상세 페이지';

  @override
  String get storageAndDownloads => '저장 공간 및 다운로드';

  @override
  String get integrations => '통합';

  @override
  String get settingsSync => '설정 동기화';

  @override
  String get settingsSyncSubtitle => 'Moonbase 플러그인 동기화 및 사용자 지정 프로필';

  @override
  String get navigationBar => '탐색 바';

  @override
  String get homeRows => '행';

  @override
  String get homeRowsSubtitle => '행을 켜거나 끄고 순서를 바꿉니다';

  @override
  String get rowOptions => '행 옵션';

  @override
  String get rowOptionsSubtitle => '행별 정렬 및 콘텐츠';

  @override
  String get imageTypePerRow => '행별 이미지 유형';

  @override
  String get externalSources => '외부 소스';

  @override
  String get qualityAndDecoding => '품질 및 디코딩';

  @override
  String get qualityAndDecodingSubtitle =>
      '비트 전송률, 해상도, 디코딩, HDR 및 Dolby Vision';

  @override
  String get skippingAndAutoplay => '건너뛰기 및 자동 재생';

  @override
  String get advancedPlayback => '고급 재생';

  @override
  String get advancedPlaybackSubtitle => '플레이어 라우팅, 외부 플레이어 및 mpv';

  @override
  String get settingsAccountSubtitle => '로그인, PIN 코드, 키즈 모드, 자녀 보호 및 설정 동기화';

  @override
  String get settingsGeneralSubtitle => '언어, 시계, 입력 및 성능';

  @override
  String get settingsAppearanceSubtitle => '탐색, 홈 화면, 라이브러리, 상세 페이지 및 테마';

  @override
  String get settingsHomeScreenSubtitle => '행, 미디어 바, 모양 및 외부 소스';

  @override
  String get settingsLibrariesEntrySubtitle => '라이브러리 표시 여부, 순서 및 라이브러리 페이지';

  @override
  String get settingsDetailsPageSubtitle => '레이아웃, 버튼, 섹션, 평가 및 테마 음악';

  @override
  String get settingsPlaybackSubtitle => '플레이어, 품질, 오디오, 자막, 건너뛰기 및 SyncPlay';

  @override
  String get settingsStorageSubtitle => '다운로드, 저장 위치 및 이미지 캐시';

  @override
  String get settingsServicesSubtitle => 'Seerr 및 Achievement Badges';

  @override
  String get settingsSignInSection => '로그인';

  @override
  String get settingsFamilySection => '가족';

  @override
  String get settingsServersSection => '서버';

  @override
  String get settingsLanguageSection => '언어';

  @override
  String get settingsInputSection => '입력';

  @override
  String get settingsMotionSection => '모션';

  @override
  String get settingsContentsSection => '콘텐츠';

  @override
  String get settingsLooksSection => '모양';

  @override
  String get settingsAudioAndSubtitlesSection => '오디오 및 자막';

  @override
  String get settingsSkippingAndQueueSection => '건너뛰기 및 대기열';

  @override
  String get settingsWatchTogetherSection => '함께 보기';

  @override
  String get settingsAdvancedSection => '고급';

  @override
  String get playerSettingsSubtitle => '컨트롤, 탐색, 플레이어 버튼 및 Trickplay';

  @override
  String get siloPasswordChangeTitle => 'Choose a new password';

  @override
  String get siloPasswordChangeMessage =>
      'This account has a temporary password. Choose a new one to finish signing in.';

  @override
  String get siloPasswordChangeNew => 'New password';

  @override
  String get siloPasswordChangeConfirm => 'Confirm new password';

  @override
  String get siloPasswordChangeSubmit => 'Change password';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Use at least $count characters',
      one: 'Use at least 1 character',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => 'That password is too long';

  @override
  String get siloPasswordChangeMismatch => 'The passwords don\'t match';

  @override
  String get siloPasswordChangeSameAsTemporary =>
      'Choose a password different from the temporary one';

  @override
  String get siloPasswordChangeFailed =>
      'Couldn\'t change the password. Try again.';

  @override
  String get siloPasswordChangeUnavailable =>
      'This account has a temporary password, and this server doesn\'t allow changing it here. Change it in Silo\'s web app, then sign in again.';

  @override
  String get siloPasswordChangedSignInAgain =>
      'Your password was changed. Sign in with the new password.';

  @override
  String get siloServerRowSubtitle => 'From your server';

  @override
  String get playlistSortReleaseDate => '출시일';

  @override
  String get playlistSortCriticRating => '비평가 평가';

  @override
  String get playlistSortRuntime => '상영 시간';

  @override
  String get playlistSortLastPlayed => '최근 재생';

  @override
  String get playlistSortPlayCount => '재생 횟수';

  @override
  String get playlistSortRandom => '무작위';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 적용 중',
      one: '1개 적용 중',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks => '적용된 필터와 일치하는 트랙이 없습니다';

  @override
  String get librarySortPlaylistOrder => '재생목록 순서';

  @override
  String get librarySortDateAdded => '추가된 날짜';

  @override
  String get librarySortDateEpisodeAdded => '에피소드 추가 날짜';

  @override
  String get librarySortParentalRating => '시청 등급';

  @override
  String get librarySortMyRating => '내 평가';

  @override
  String get librarySortAlbumArtist => '앨범 아티스트';

  @override
  String get librarySortAlbum => '앨범';

  @override
  String get librarySortArtist => '아티스트';

  @override
  String get librarySortTrackNumber => '트랙 번호';

  @override
  String get librarySortGenre => '장르';

  @override
  String get librarySortFoldersFirst => '폴더 먼저';

  @override
  String get librarySortLength => '길이';

  @override
  String get homeScreenBackdrop => 'Home Screen Backdrop';

  @override
  String get homeScreenBackdropFullScreen => 'Full Screen';

  @override
  String get homeScreenBackdropCorner => 'Corner';

  @override
  String get homeScreenBackdropTop => 'Top';

  @override
  String get detailsScreenBackdrop => 'Details Screen Backdrop';

  @override
  String get detailsBackdropSize => 'Backdrop Size';

  @override
  String get detailsBackdropFullScreen => 'Full Screen';

  @override
  String get detailsBackdropFit => 'Fit';

  @override
  String get libraryBackdrops => 'Library Backdrops';

  @override
  String get playbackInfoChannel => 'Channel';

  @override
  String get playbackInfoProgram => 'Program';

  @override
  String get playbackInfoWhy => 'Why';

  @override
  String get playbackInfoQualityLimit => 'Quality Limit';

  @override
  String get playbackInfoFrameRate => 'Frame Rate';

  @override
  String get playbackInfoDelivery => 'Delivery';

  @override
  String get playbackInfoFile => 'File';

  @override
  String get playbackInfoTechnical => 'Technical';

  @override
  String get playbackInfoDevice => 'Device';

  @override
  String get playbackInfoAudioRoute => 'Audio Route';

  @override
  String get playbackInfoSurround51 => '5.1 surround';

  @override
  String get playbackInfoSurround71 => '7.1 surround';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count channels';
  }

  @override
  String get playbackInfoBurnedIn => 'Burned in by the server';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value (original $original)';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value (converted from $source)';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name ($size, converted from $source)';
  }

  @override
  String get playbackInfoNoteDirectPlay => 'Playing the original file as is.';

  @override
  String get playbackInfoNoteDirectStream =>
      'The server is repackaging the file without converting it.';

  @override
  String get playbackInfoNoteTranscodeVideo =>
      'The server is converting the video so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeAudio =>
      'The server is converting the audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeBoth =>
      'The server is converting the video and audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeUnknown =>
      'The server is converting this file so this device can play it.';

  @override
  String get playbackInfoNoteOffline => 'Playing a downloaded copy.';

  @override
  String get playbackInfoWhyForced => 'Transcoding is forced in settings';

  @override
  String get playbackInfoWhyBitrate =>
      'The bitrate is above the streaming limit';

  @override
  String get playbackInfoWhyContainer =>
      'This device can\'t play this file type';

  @override
  String get playbackInfoWhyVideo =>
      'This device can\'t play this video format';

  @override
  String get playbackInfoWhyHdr => 'This device can\'t display this HDR format';

  @override
  String get playbackInfoWhyAudio =>
      'This device can\'t play this audio format';

  @override
  String get playbackInfoWhySubtitles =>
      'Subtitles are being burned into the video';

  @override
  String get playbackInfoWhyOther => 'The file couldn\'t be played directly';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate is above the $limit streaming limit';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return 'This device can\'t open $container files';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return 'This device can\'t play $codec video';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return 'This device can\'t play $codec $profile video';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return 'This device can\'t play $codec level $level video';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return 'This device can\'t play $bits-bit video';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return 'This device can\'t play $resolution video';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return 'This device can\'t play $fps fps video';
  }

  @override
  String get playbackInfoWhyInterlaced =>
      'This device can\'t play interlaced video';

  @override
  String get playbackInfoWhyAnamorphic =>
      'This device can\'t play anamorphic video';

  @override
  String playbackInfoWhyHdrName(String range) {
    return 'This device can\'t display $range';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return 'This device can\'t play $format audio';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return 'This device can\'t play $fullFormat';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return 'This device can\'t play $channels audio';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return 'This device can\'t play $rate kHz audio';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return 'This device can\'t play $bits-bit audio';
  }

  @override
  String get playbackInfoWhyAudioExternal =>
      'The audio track is in a separate file';

  @override
  String get playbackInfoWhySecondaryAudio =>
      'This device can only play the first audio track';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return '$format subtitles are being burned into the video';
  }

  @override
  String get playbackInfoDroppedFrames => 'Dropped Frames';

  @override
  String get playFromServer => 'Play from Server';

  @override
  String get settingsApplePlayerUi => 'Video player';

  @override
  String get settingsApplePlayerUiDescription =>
      'The native Apple style player has no casting, audio delay or PiP button, and its rotation lock is only in Live TV';

  @override
  String get settingsApplePlayerUiStandard => 'Standard';

  @override
  String get settingsApplePlayerUiNative => 'Native Apple style';

  @override
  String get playerTransportPosition => 'Play buttons';

  @override
  String get playerTransportPositionDescription =>
      'Show play, skip and seek in the middle of the video or docked in the bottom bar';

  @override
  String get playerTransportOnScreen => 'On screen';

  @override
  String get playerTransportDocked => 'Docked';

  @override
  String get incompleteRecording => 'Incomplete';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '$recorded of $expected min';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return 'Complete showing scheduled $dateTime';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return 'Complete copy recorded $dateTime';
  }

  @override
  String get noCompleteShowingFound => 'No complete showing found';

  @override
  String get keepAsComplete => 'Keep as Complete';

  @override
  String get keptAsComplete => 'Marked as complete';

  @override
  String get unableToKeepAsComplete => 'Unable to mark as complete';

  @override
  String recordPromptTitle(String name) {
    return 'Record $name';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'This showing started $minutes minutes ago, so the recording will miss the start.',
      one: 'This showing started 1 minute ago, so the recording will miss the start.',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater =>
      'Also record the future showing to get a complete recording?';

  @override
  String get recordPromptSearchLater =>
      'Also record a future showing automatically once one is found, to get a complete recording?';

  @override
  String get recordPromptNow => 'Now';

  @override
  String get recordPromptLater => 'Future showing';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min already aired',
      one: '1 min already aired',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch =>
      'Matched by title and description only. Check it\'s the same program.';

  @override
  String get recordPromptDescriptionsDiffer =>
      'The descriptions differ, so this may be a different program.';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return 'Same episode (S${season}E$episode)';
  }

  @override
  String get recordPromptAlreadyScheduled => 'Already set to record';

  @override
  String get recordPromptTomorrow => 'Tomorrow';

  @override
  String get recordNowOnly => 'Record Now Only';

  @override
  String recordNowAnd(String when) {
    return 'Record Now and $when';
  }

  @override
  String get recordNowAndLater => 'Record Now and Future Showing';

  @override
  String recordOnlyLater(String when) {
    return 'Record $when Only';
  }

  @override
  String get recordLaterShowingOnly => 'Record Future Showing Only';

  @override
  String get laterShowingOnlyRequested =>
      'The future showing will be recorded.';

  @override
  String get unableToRequestLaterShowingOnly =>
      'Couldn\'t request the future showing, so nothing will be recorded.';

  @override
  String get laterShowingRequested =>
      'Recording started. A future showing will be recorded too.';

  @override
  String get unableToRequestLaterShowing =>
      'Recording started, but couldn\'t request a future showing.';

  @override
  String get siloCodeSignIn => 'Sign in with a code';

  @override
  String siloCodeSignInInstruction(String address) {
    return 'Scan the QR code with your phone, or go to $address on any signed-in device and enter this code:';
  }

  @override
  String get siloCodeSignInInstructionNoLink =>
      'Enter this code in Silo on a device where you\'re signed in:';

  @override
  String get siloCodeSignInOpened =>
      'Code found. Approve the sign-in on your other device.';

  @override
  String get siloCodeSignInDenied => 'This sign-in was declined.';

  @override
  String get siloCodeSignInNewCode => 'Get a new code';

  @override
  String get siloCodeSignInOff =>
      'Signing in with a code is turned off on this server.';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      'This account has a temporary password. Sign in with the password once to replace it.';

  @override
  String get siloApproveSignIn => 'Approve a sign-in';

  @override
  String get siloApproveSignInHint => 'Code shown on the other device';

  @override
  String get siloApproveSignInApprove => 'Approve';

  @override
  String get siloApproveSignInDone =>
      'Approved. The other device is signing in.';

  @override
  String get siloApproveSignInNoRequest =>
      'No sign-in is waiting with that code. Check it, or get a new code on the other device.';

  @override
  String get siloNativeOfferTitle => 'Connect to Silo directly?';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return 'This address is the Jellyfin-compatible service of $serverName. Moonfin can connect to Silo directly at $address, with Silo\'s own features.';
  }

  @override
  String get siloNativeOfferUse => 'Use Silo';

  @override
  String get siloNativeOfferKeep => 'Keep Jellyfin';

  @override
  String get siloAppUpdateRequired =>
      'This Silo server needs a newer version of Moonfin. Update Moonfin to use it.';

  @override
  String get siloServerUpdateRequired =>
      'This Silo server is too old for this version of Moonfin. Update Silo to use it.';

  @override
  String get siloTooManyAttempts => 'Too many attempts. Try again later.';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get siloServerBusy =>
      'The server is busy or still starting. Try again later.';

  @override
  String siloServerBusyWait(String wait) {
    return 'The server is busy or still starting. Try again in $wait.';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable =>
      'Playback isn\'t available on this Silo server.';

  @override
  String get siloPlaybackUpdateRequired =>
      'This Silo server needs a newer version of Moonfin to play.';

  @override
  String get siloPlaybackEndedOnServer =>
      'Playback was ended on the Silo server.';

  @override
  String siloPinTitle(String name) {
    return 'PIN for $name';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => 'Unlock';

  @override
  String get siloPinWrong => 'That PIN isn\'t right.';

  @override
  String get siloPinLocked => 'Too many wrong PINs. Try again later.';

  @override
  String siloPinLockedWait(String wait) {
    return 'Too many wrong PINs. Try again in $wait.';
  }

  @override
  String get siloPinFailed => 'The PIN couldn\'t be checked. Try again.';

  @override
  String get siloSignOutAccount => 'Sign out of the Silo account';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trailers',
      one: '1 trailer',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return 'Trailer $number';
  }

  @override
  String get subtitled => 'Subtitled';

  @override
  String get rommAccount => 'RomM account';

  @override
  String get rommAccountIntro =>
      'Link your RomM account to play from your own RomM library and keep your saves in RomM.';

  @override
  String get rommLinkAccount => 'Link RomM account';

  @override
  String get rommLinkInstructions =>
      'Sign in to RomM and enter this code to link your account.';

  @override
  String rommLinkScanOrVisit(String url) {
    return 'Scan the QR code with your phone, or go to $url';
  }

  @override
  String get rommOpen => 'Open RomM';

  @override
  String get rommWaitingForApproval =>
      'Waiting for you to approve the code in RomM...';

  @override
  String rommLinkedAs(String username) {
    return 'Linked as $username';
  }

  @override
  String get rommLinked => 'Your RomM account is linked.';

  @override
  String get rommUnlinkNote =>
      'Unlinking stops Moonfin from using your RomM key. The key stays in RomM until you remove it from your API tokens there.';

  @override
  String get rommUnlink => 'Unlink';

  @override
  String get rommLinkExpired =>
      'The code expired before it was approved. Link again to get a new one.';

  @override
  String get rommLinkDenied => 'The link was turned down in RomM.';

  @override
  String get rommUnreachable =>
      'Moonfin couldn\'t reach RomM. Try again in a moment.';

  @override
  String get rommNotAvailable => 'This server has no RomM library.';

  @override
  String get rommAccountLoadFailed => 'Couldn\'t load your RomM account.';

  @override
  String get reviews => 'Reviews';

  @override
  String get detailSectionReviews => 'Reviews';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '1 review',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => 'Read on TMDB';

  @override
  String get addServerButtonSubtitle =>
      'By address, or with a Plex or Emby Connect account';

  @override
  String get addServerChooseHow => 'Choose how you\'d like to connect.';

  @override
  String get addServerAddressChoice =>
      'Jellyfin, Emby or Silo on your network or online';

  @override
  String get addServerPlexChoice => 'Use your Plex account to find its servers';

  @override
  String get addServerAddressHelp =>
      'The same address you\'d open in a browser, including the port.';

  @override
  String get addServerDetectNote =>
      'Works with Jellyfin, Emby and Silo. A Plex address opens the Plex sign-in.';

  @override
  String addServerChecking(String address) {
    return 'Checking $address';
  }

  @override
  String get addServerUnreachableDetail =>
      'Check the address and port, and that the server is running.';

  @override
  String get addServerFound => 'Server found';

  @override
  String get addServerFoundNote => 'Continue to choose who\'s signing in.';

  @override
  String get addServerUseDifferentAddress => 'Use a different address';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artists',
      one: '1 artist',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs',
      one: '1 song',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count playlists',
      one: '1 playlist',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plays',
      one: '1 play',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => 'All Artists';

  @override
  String get libraryZToA => 'Z to A';

  @override
  String get musicSortYear => 'Year';

  @override
  String get musicFilter => 'Filter';

  @override
  String get musicGenreFilterTitle => 'Filter by Genre';

  @override
  String get openAlbum => 'Open Album';

  @override
  String get openPlaylist => 'Open Playlist';

  @override
  String get allSongsAToZ => 'All Songs A to Z';

  @override
  String get musicMix => 'Mix';

  @override
  String get musicMixEverything => 'Everything';

  @override
  String get musicMixEverythingSubtitle => '300 songs at random';

  @override
  String get mostPlayed => 'Most Played';

  @override
  String get musicMixMostPlayedSubtitle => 'Your top 100';

  @override
  String get musicMixFreshArrivals => 'Fresh Arrivals';

  @override
  String get musicMixFreshArrivalsSubtitle => 'The newest 100 songs';

  @override
  String get musicMixRediscover => 'Rediscover';

  @override
  String get musicMixRediscoverSubtitle =>
      'Favorites you haven\'t played lately';

  @override
  String get musicSortMostAlbums => 'Most Albums';

  @override
  String bookSeriesPosition(int index, int total) {
    return 'Book $index of $total';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count favorites',
      one: '1 favorite',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Z to A';

  @override
  String get bookSortMostTitles => 'Most Titles';

  @override
  String get bookSurpriseMe => 'Surprise Me';

  @override
  String get bookShuffleAudiobooks => 'Shuffle Audiobooks';

  @override
  String get bookStartReading => 'Start Reading';

  @override
  String get bookOtherBooks => 'Other Books';

  @override
  String get bookDiscoverSearchBooks => 'Search Open Library';

  @override
  String get bookDiscoverSearchAudiobooks => 'Search LibriVox';

  @override
  String get bookDiscoverFeatured => 'Featured';

  @override
  String get bookReaderControlsAutoHide => 'Controls hide automatically';

  @override
  String get bookReaderControlsStayVisible => 'Controls stay visible';

  @override
  String get settingsLivePreview => 'Live preview';

  @override
  String settingsPreviewShowsOn(String screen) {
    return 'Shows on the $screen preview';
  }

  @override
  String get settingsPreviewNotShown => 'Not shown in the preview';

  @override
  String get settingsPreviewSaved => 'Saved';
}
