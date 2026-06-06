// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yue Chinese Cantonese (`yue`).
class AppLocalizationsYue extends AppLocalizations {
  AppLocalizationsYue([String locale = 'yue']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'Account Preferences';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => '登入';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => '快速連接';

  @override
  String get password => '密碼';

  @override
  String get username => '使用者名稱';

  @override
  String get email => '電子郵件';

  @override
  String get quickConnectInstruction => '在伺服器的 Web 儀表板上輸入以下程式碼：';

  @override
  String get waitingForAuthorization => '等待授權...';

  @override
  String get back => '後退';

  @override
  String get serverUnavailable => '伺服器不可用';

  @override
  String get loginFailed => '登入失敗';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => '誰在看？';

  @override
  String get addUser => '新增用戶';

  @override
  String get selectServer => '選擇伺服器';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => '已儲存的伺服器';

  @override
  String get discoveredServers => '發現的伺服器';

  @override
  String get noneFound => '沒有找到';

  @override
  String get unableToConnectToServer => '無法連接到伺服器';

  @override
  String get addServer => '新增伺服器';

  @override
  String get embyConnect => 'Emby 連接';

  @override
  String get removeServer => '刪除伺服器';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => '取消';

  @override
  String get remove => '消除';

  @override
  String get connectToServer => '連接到伺服器';

  @override
  String get serverAddress => '伺服器位址';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => '連接';

  @override
  String get secureStorageUnavailable => '安全儲存不可用';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin 無法存取您的系統金鑰環。登入可以繼續，但在密鑰環解鎖之前，安全令牌儲存可能不可用。';

  @override
  String get ok => '好的';

  @override
  String get settingsAppearanceTheme => '應用主題';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '在 Moonfin 和 Neon Pulse 之間切換，無需重新啟動應用程式';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '目前的 Moonfin 外觀你們都喜歡';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle => 'Synthwave 風格具有洋紅色發光、青色文字和更強的鍍鉻對比度';

  @override
  String get embyConnectSignInSubtitle => '使用您的 Emby Connect 帳戶登入';

  @override
  String get emailOrUsername => '電子郵件或使用者名稱';

  @override
  String get selectAServer => '選擇伺服器';

  @override
  String get tryAgain => '再試一次';

  @override
  String get noLinkedServers => '沒有伺服器連結到該 Emby Connect 帳戶';

  @override
  String get invalidEmbyConnectCredentials => 'Emby Connect 憑證無效';

  @override
  String get invalidEmbyConnectLogin => 'Emby Connect 使用者名稱或密碼無效';

  @override
  String get embyConnectExchangeNotSupported => '伺服器不支援 Emby Connect 交換';

  @override
  String get embyConnectNetworkError => '聯絡 Emby Connect 或所選伺服器時發生網路錯誤';

  @override
  String get loadingLinkedServers => '正在載入連結伺服器...';

  @override
  String get connectingToServerEllipsis => '正在連接到伺服器...';

  @override
  String get noReachableAddress => '未提供可到達的地址';

  @override
  String get invalidServerExchangeResponse => '來自伺服器交換端點的無效回應';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => '退出Moonfin？';

  @override
  String get exitAppConfirmation => '您確定要退出嗎？';

  @override
  String get exit => '出口';

  @override
  String get noHomeRowsLoaded => '無法載入主行';

  @override
  String get noHomeRowsHint => '嘗試刷新或減少活躍的主頁部分。';

  @override
  String get retryHomeRows => '重試主行';

  @override
  String get guide => '指導';

  @override
  String get recordings => '錄音';

  @override
  String get schedule => '行程';

  @override
  String get series => '系列';

  @override
  String get noItemsFound => '沒有找到物品';

  @override
  String get home => '家';

  @override
  String get browseAll => '瀏覽全部';

  @override
  String get genres => '流派';

  @override
  String get collectionPlaceholder => '收藏品會出現在這裡';

  @override
  String get browseByLetter => '按字母瀏覽';

  @override
  String get alphabeticalBrowsePlaceholder => '按字母順序瀏覽將會出現在這裡';

  @override
  String get suggestions => '建議';

  @override
  String get suggestionsPlaceholder => '建議的項目將出現在此處';

  @override
  String get failedToLoadLibraries => '載入庫失敗';

  @override
  String get noLibrariesFound => '沒有找到庫';

  @override
  String get library => '圖書館';

  @override
  String get displaySettings => '顯示設定';

  @override
  String get allGenres => '所有流派';

  @override
  String get noGenresFound => '沒有找到流派';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => '該資料夾是空的';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => '無法加載收藏夾';

  @override
  String get retry => '重試';

  @override
  String get noFavoritesYet => '還沒有收藏夾';

  @override
  String get favorites => '收藏夾';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => '繼續';

  @override
  String get ended => '結束';

  @override
  String get sortAndFilter => '排序和過濾';

  @override
  String get type => '類型';

  @override
  String get sortBy => '排序方式';

  @override
  String get display => '展示';

  @override
  String get imageType => '圖片類型';

  @override
  String get posterSize => '海報尺寸';

  @override
  String get small => '小的';

  @override
  String get medium => '中等的';

  @override
  String get large => '大的';

  @override
  String get extraLarge => '特大號';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => '意見';

  @override
  String get albums => '專輯';

  @override
  String get albumArtists => '專輯藝人';

  @override
  String get artists => '藝術家';

  @override
  String get bookmarks => '書籤';

  @override
  String get noSavedBookmarks => '尚未儲存該標題的書籤。';

  @override
  String get openBook => '打開書本';

  @override
  String get chapter => '章';

  @override
  String get page => '頁';

  @override
  String get bookmark => '書籤';

  @override
  String get justNow => '現在';

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
  String get discoverySubjects => '發現主題';

  @override
  String get pickDiscoverySubjects => '選擇要在「發現」中顯示的主題來源。';

  @override
  String get apply => '申請';

  @override
  String get openLink => '打開連結';

  @override
  String get scanWithYourPhone => '用手機掃描';

  @override
  String get audiobookGenres => '有聲書流派';

  @override
  String get pickAudiobookGenres => '選擇要在有聲書探索中顯示的流派。';

  @override
  String get discoverAudiobooks => '發現有聲書';

  @override
  String get librivoxDescription => '來自 LibriVox 的熱門公共領域標題。';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => '向左滾動';

  @override
  String get scrollRight => '向右滾動';

  @override
  String get couldNotLoadGenre => '目前無法載入此類型。';

  @override
  String get continueReading => '繼續閱讀';

  @override
  String get savedHighlights => '已保存的精彩集錦';

  @override
  String get continueListening => '繼續收聽';

  @override
  String get listen => '聽';

  @override
  String get resume => '恢復';

  @override
  String get failedToLoadLibrary => '載入庫失敗';

  @override
  String get popularNow => '現在流行';

  @override
  String get savedForLater => '儲存以供稍後使用';

  @override
  String get topListens => '熱門收聽';

  @override
  String get unreadDiscoveries => '未讀的發現';

  @override
  String get pickUpAgain => '再次拾起';

  @override
  String get bookHighlightsDescription => '您的書籍包含亮點、收藏夾或閱讀進度。';

  @override
  String get handPickedFromLibrary => '從您的圖書館中精心挑選的。';

  @override
  String get handPickedFromListeningQueue => '從您的收聽隊列中精心挑選。';

  @override
  String get booksWithHighlights => '包含亮點、最愛或閱讀進度的書籍。';

  @override
  String get jumpBackNarration => '跳回旁白，無需尋找自己的位置。';

  @override
  String get unreadBooksReady => '未讀的書準備好迎接下一個安靜的時刻。';

  @override
  String get quickAccessFavorites => '快速存取您經​​常閱讀的書籍。';

  @override
  String get searchAudiobooks => '搜尋有聲書';

  @override
  String get searchYourLibrary => '搜尋您的圖書館';

  @override
  String get pickUpStory => '從上次停下的地方繼續講故事';

  @override
  String get savedPlacesChapters => '您保存的地點和未完成的章節';

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
  String get readyWhenYouAre => '當你準備好時';

  @override
  String get details => '細節';

  @override
  String get listeningRoom => '聽音室';

  @override
  String get bookmarksAndProgress => '書籤和進度';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => '標題';

  @override
  String get allTitles => '所有標題';

  @override
  String get authors => '作者';

  @override
  String get browseByAuthor => '按作者瀏覽';

  @override
  String get browseByGenre => '按類型瀏覽';

  @override
  String get discover => '發現';

  @override
  String get trendingTitlesOpenLibrary => 'Open Library 中按主題劃分的熱門標題。';

  @override
  String get noBookmarkedItems => '還沒有加書籤的項目';

  @override
  String get nothingMatchesSection => '還沒有與此部分相符的內容。嘗試另一個選項卡或在庫同步完成後返回。';

  @override
  String get audiobooks => '有聲書';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => '資料夾';

  @override
  String get filters => '過濾器';

  @override
  String get readingStatus => '閱讀狀態';

  @override
  String get playedStatus => '播放狀態';

  @override
  String get readStatus => '讀';

  @override
  String get watched => '看過';

  @override
  String get unread => '未讀';

  @override
  String get unwatched => '無人看管';

  @override
  String get seriesStatus => '系列狀態';

  @override
  String get allLibraries => '所有圖書館';

  @override
  String get books => '圖書';

  @override
  String get author => '作者';

  @override
  String get unknownAuthor => '作者未知';

  @override
  String get uncategorized => '未分類';

  @override
  String get overview => '概述';

  @override
  String get noLibrivoxDescription => 'LibriVox 尚未為此標題提供任何描述。';

  @override
  String get readers => '讀者';

  @override
  String get openLinks => '打開連結';

  @override
  String get librivoxPage => 'LibriVox 頁';

  @override
  String get internetArchive => '互聯網檔案館';

  @override
  String get rssFeed => 'RSS 來源';

  @override
  String get downloadZip => '下載郵編';

  @override
  String sectionCountLabel(int count) {
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
  }

  @override
  String get noOpenLibraryOverview => 'Open Library 尚未提供此標題的概述。';

  @override
  String get subjects => '科目';

  @override
  String get all => '全部';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => '目前無法載入該主題。';

  @override
  String get audiobookDetails => '有聲書詳情';

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
  String get trackList => '曲目表';

  @override
  String get itemListPlaceholder => '項目清單將會出現在這裡';

  @override
  String get favoriteTracksPlaceholder => '最喜歡的曲目將會出現在這裡';

  @override
  String get failedToLoad => '載入失敗';

  @override
  String get delete => '刪除';

  @override
  String get save => '節省';

  @override
  String get moreLikeThis => '更多類似的';

  @override
  String get castAndCrew => '演職人員';

  @override
  String get collection => '收藏';

  @override
  String get episodes => '劇集數';

  @override
  String get nextUp => '下一步';

  @override
  String get seasons => '季節';

  @override
  String get chapters => '章節';

  @override
  String get features => '特徵';

  @override
  String get movies => '電影';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => '其他';

  @override
  String get discography => '唱片目錄';

  @override
  String get similarArtists => '類似的藝術家';

  @override
  String get tableOfContents => '目錄';

  @override
  String get tracklist => '曲目表';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => '傳';

  @override
  String get authorDetails => '作者詳細信息';

  @override
  String get noOverviewAvailable => '尚無此標題的概述。';

  @override
  String get noBiographyAvailable => '沒有該作者的傳記。';

  @override
  String get noBooksFound => '沒有找到該作者的書籍。';

  @override
  String get unableToLoadAuthorDetails => '目前無法載入作者詳細資料。';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => '出版日期未知';

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
  String get view => '看法';

  @override
  String get resumeReading => '繼續閱讀';

  @override
  String get read => '讀';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => '玩';

  @override
  String get startOver => '重新開始';

  @override
  String get restart => '重新啟動';

  @override
  String get readOffline => '離線閱讀';

  @override
  String get playOffline => '離線玩';

  @override
  String get audio => '聲音的';

  @override
  String get subtitles => '字幕';

  @override
  String get version => '版本';

  @override
  String get cast => '投擲';

  @override
  String get trailer => '拖車';

  @override
  String get finished => '完成的';

  @override
  String get favorited => '已收藏';

  @override
  String get favorite => '最喜歡的';

  @override
  String get playlist => '播放清單';

  @override
  String get downloaded => '已下載';

  @override
  String get downloadAll => '下載全部';

  @override
  String get download => '下載';

  @override
  String get deleteDownloaded => '刪除已下載';

  @override
  String get goToSeries => '前往系列';

  @override
  String get editMetadata => '編輯元數據';

  @override
  String get less => '較少的';

  @override
  String get more => '更多的';

  @override
  String get deleteItem => '刪除項目';

  @override
  String get deletePlaylist => '刪除播放清單';

  @override
  String get deletePlaylistMessage => '從伺服器刪除此播放清單？';

  @override
  String get deleteItemMessage => '從伺服器刪除此項目？';

  @override
  String get failedToDeletePlaylist => '刪除播放清單失敗';

  @override
  String get failedToDeleteItem => '刪除項目失敗';

  @override
  String get renamePlaylist => '重新命名播放列表';

  @override
  String get playlistName => '播放清單名稱';

  @override
  String get deleteDownloadedAlbum => '刪除下載的相冊';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => '下載的曲目已刪除';

  @override
  String get downloadedTracksDeleteFailed => '某些下載的曲目無法刪除';

  @override
  String get noTracksLoaded => '未載入曲目';

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
  String get itemDeleted => '項目已刪除';

  @override
  String get noPlayableTrailerFound => '找不到可播放的預告片。';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => '音軌';

  @override
  String get subtitleTrack => '字幕軌道';

  @override
  String get none => '沒有任何';

  @override
  String get downloadSubtitlesLabel => '下載字幕...';

  @override
  String get searchOpenSubtitlesPlugin => '使用 OpenSubtitles 插件進行搜尋';

  @override
  String get downloadSubtitles => '下載字幕';

  @override
  String get selectedSubtitleInvalid => '所選的字幕無效。';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      '字幕已下載。當 Jellyfin 刷新項目時，可能需要一些時間才會出現。';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => '選擇版本';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => '下載全部 — 質量';

  @override
  String get downloadQuality => '下載品質';

  @override
  String get originalFileNoReencoding => '原始文件，無需重新編碼';

  @override
  String get originalFilesNoReencoding => '原始文件，無需重新編碼';

  @override
  String get noEpisodesLoaded => '沒有載入劇集';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => '刪除下載的文件';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => '下載的檔案已刪除';

  @override
  String get failedToDeleteFiles => '刪除檔案失敗';

  @override
  String get deleteFiles => '刪除文件';

  @override
  String get director => '導演';

  @override
  String get writers => '作家';

  @override
  String get studio => '工作室';

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
  String get showLess => '顯示更少';

  @override
  String get readMore => '閱讀更多';

  @override
  String get shuffle => '隨機播放';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => '完美搭配';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => '單核白血球增多症';

  @override
  String get stereo => '立體聲';

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
  String get deleteSeasonFiles => '本季所有下載的劇集';

  @override
  String get stillWatching => '還在觀看嗎？';

  @override
  String get unableToLoadTrailerStream => '無法載入預告片流。';

  @override
  String get trailerTimedOut => '拖車加載時逾時。';

  @override
  String get playbackFailedForTrailer => '該預告片播放失敗。';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline => '離線播放時無法進行投射。';

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
  String get deviceVolume => '裝置音量';

  @override
  String get unavailable => '不可用';

  @override
  String get pause => '暫停';

  @override
  String get syncPosition => '同步位置';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => '隊列為空';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => '遠端回放';

  @override
  String get castingToGoogleCast => '轉換為 Google Cast';

  @override
  String get castingViaAirPlay => '透過 AirPlay 進行投射';

  @override
  String get castingViaDlna => '透過 DLNA 進行投射';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => '長按解鎖';

  @override
  String get off => '離開';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => '汽車';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => '比特率覆蓋';

  @override
  String get audioDelay => '音訊延遲';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => '字幕延遲';

  @override
  String get reset => '重置';

  @override
  String get unknown => '未知';

  @override
  String get playbackInformation => '播放訊息';

  @override
  String get playback => '回放';

  @override
  String get playMethod => '玩法';

  @override
  String get directPlay => '直接播放';

  @override
  String get directStream => '直接串流';

  @override
  String get transcoding => '轉碼';

  @override
  String get transcodeReasons => '轉碼原因';

  @override
  String get player => '玩家';

  @override
  String get container => '容器';

  @override
  String get bitrate => '位元率';

  @override
  String get video => '影片';

  @override
  String get resolution => '解決';

  @override
  String get hdr => '高動態範圍';

  @override
  String get codec => '編解碼器';

  @override
  String get videoBitrate => '視訊比特率';

  @override
  String get track => '追蹤';

  @override
  String get channels => '頻道';

  @override
  String get audioBitrate => '音訊比特率';

  @override
  String get sampleRate => '取樣率';

  @override
  String get format => '格式';

  @override
  String get external => '外部的';

  @override
  String get embedded => '嵌入式';

  @override
  String castSessionError(String protocol) {
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform => '應用程式內 EPUB 渲染在此平台上尚不可用。';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable => '嵌入式文件渲染在此平台上不可用。';

  @override
  String get couldNotOpenExternalViewer => '無法開啟外部檢視器。';

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
  String get noBookmarksYet => '還沒有書籤。\n閱讀時點擊書籤圖示即可儲存您的位置。';

  @override
  String get noTableOfContentsAvailable => '沒有可用的目錄';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => '位置';

  @override
  String get bookReader => '圖書閱讀器';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => '更新中...';

  @override
  String get markUnread => '標記為未讀';

  @override
  String get markAsRead => '標記為已讀';

  @override
  String get reloadReader => '重新加載閱讀器';

  @override
  String get noPagesFound => '未找到頁面。';

  @override
  String get failedToDecodePageImage => '無法解碼頁面圖像。';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => '單頁';

  @override
  String get twoPageSpread => '兩頁跨頁';

  @override
  String get addBookmark => '新增書籤';

  @override
  String get bookmarksEllipsis => '書籤...';

  @override
  String get markedAsRead => '標記為已讀';

  @override
  String get markedAsUnread => '標記為未讀';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => '主題：系統';

  @override
  String get themeLight => '主題：光';

  @override
  String get themeDark => '主題：黑暗';

  @override
  String get themeSepia => '主題： 棕褐色';

  @override
  String get invertColorsFixedLayout => '反轉顏色（固定佈局）';

  @override
  String get invertColorsPdf => '反轉顏色 (PDF)';

  @override
  String get preparingInAppReader => '正在準備應用程式內閱讀器...';

  @override
  String get pdfDataNotAvailable => 'PDF 數據不可用。';

  @override
  String get readerFallbackModeActive => '讀卡機回退模式已激活';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      '切換到支援的平台目標（Android、iOS、macOS）後使用 Reload Reader。';

  @override
  String get openExternally => '對外開放';

  @override
  String get noEpubChaptersFound => '未找到 EPUB 章節。';

  @override
  String get readerNotReady => '讀者還沒準備好。';

  @override
  String get seriesRecordings => '系列錄音';

  @override
  String get now => '現在';

  @override
  String get sports => '運動的';

  @override
  String get news => '訊息';

  @override
  String get kids => '孩子們';

  @override
  String get premiere => '首播';

  @override
  String get guideTimeline => '指南時間表';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => '沒有找到頻道';

  @override
  String get liveBadge => '居住';

  @override
  String get movie => '電影';

  @override
  String get removedFromFavoriteChannels => '已從喜愛的頻道中刪除';

  @override
  String get addedToFavoriteChannels => '加入到喜愛的頻道';

  @override
  String get failedToUpdateFavoriteChannel => '更新收藏頻道失敗';

  @override
  String get unfavoriteChannel => '不喜歡的頻道';

  @override
  String get favoriteChannel => '最喜歡的頻道';

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
  String get watch => '手錶';

  @override
  String get close => '關閉';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => '載入錄音失敗';

  @override
  String get scheduledInNext24Hours => '預計未來 24 小時內';

  @override
  String get recentRecordings => '最近的錄音';

  @override
  String get tvSeries => '電視劇';

  @override
  String get failedToLoadSchedule => '加載時間表失敗';

  @override
  String get noScheduledRecordings => '沒有預定的錄音';

  @override
  String get cancelRecording => '取消錄音？';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => '不';

  @override
  String get yesCancel => '是，取消';

  @override
  String get failedToCancelRecording => '取消錄音失敗';

  @override
  String get failedToLoadSeriesRecordings => '無法載入系列錄音';

  @override
  String get noSeriesRecordings => '沒有系列錄音';

  @override
  String get cancelSeriesRecording => '取消系列錄音';

  @override
  String get cancelSeriesRecordingQuestion => '取消系列錄製？';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => '取消連續錄製失敗';

  @override
  String get searchThisLibrary => '搜尋這個圖書館...';

  @override
  String get searchEllipsis => '搜尋...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => '塞爾';

  @override
  String get seerrAccountType => '西爾帳戶類型';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => '當地的';

  @override
  String get savedMedia => '保存的媒體';

  @override
  String get tvShows => '電視節目';

  @override
  String get music => '音樂';

  @override
  String get musicAlbums => '音樂專輯';

  @override
  String get noMediaInFilter => '此過濾器中沒有介質';

  @override
  String get noDownloadedMediaYet => '還沒下載的媒體';

  @override
  String get browseLibrary => '瀏覽圖書館';

  @override
  String get deleteDownload => '刪除下載';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => '專輯';

  @override
  String get playAlbum => '播放專輯';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => '季節';

  @override
  String get errorLoadingEpisodes => '載入劇集時出錯';

  @override
  String get noDownloadedEpisodes => '沒有下載的劇集';

  @override
  String get deleteEpisode => '刪除劇集';

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
  String get seriesNotFound => '未找到系列';

  @override
  String get errorLoadingSeries => '載入系列時出錯';

  @override
  String get downloadedEpisodes => '下載劇集';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => '特價商品';

  @override
  String get deleteSeason => '刪除季節';

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
  String get storageManagement => '儲存管理';

  @override
  String get storageBreakdown => '儲存細分';

  @override
  String get downloadedItems => '下載的項目';

  @override
  String get storageLimit => '儲存限制';

  @override
  String get noLimit => '無限制';

  @override
  String get deleteAllDownloads => '刪除所有下載';

  @override
  String get deleteAllDownloadsWarning => '這將刪除所有下載的媒體檔案並且無法撤銷。';

  @override
  String get deleteAll => '全部刪除';

  @override
  String get deleteSelected => '刪除所選內容';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => '音樂和有聲讀物';

  @override
  String get images => '圖片';

  @override
  String get database => '資料庫';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => '設定';

  @override
  String get authentication => '驗證';

  @override
  String get autoLoginServerManagement => '自動登入、伺服器管理';

  @override
  String get pinCode => '密碼';

  @override
  String get setUpPinCodeProtection => '設定 PIN 碼保護';

  @override
  String get parentalControls => '家長監護';

  @override
  String get contentRatingRestrictions => '內容分級限制';

  @override
  String get bitRateResolutionBehavior => '比特率、解析度、行為';

  @override
  String get languageSizeAppearance => '語言、大小、外觀';

  @override
  String get qualityStorage => '品質、儲存';

  @override
  String get serverSyncAndPluginStatus => '伺服器同步和插件狀態';

  @override
  String get mediaRequestIntegration => '媒體請求集成';

  @override
  String get switchServer => '切換伺服器';

  @override
  String get signOut => '登出';

  @override
  String get versionLicenses => '版本、許可證';

  @override
  String get account => '帳戶';

  @override
  String get signInAndSecurity => '登入和安全';

  @override
  String get administration => '行政';

  @override
  String get serverSettingsUsersLibraries => '伺服器設定、使用者、函式庫';

  @override
  String get customization => '客製化';

  @override
  String get themeAndLayout => '主題和佈局';

  @override
  String get videoAndSubtitles => '視訊和字幕';

  @override
  String get integrations => '整合';

  @override
  String get pluginAndRequests => '插件和請求';

  @override
  String get customizeAccountPlaybackInterface => '自訂帳戶、播放和介面行為';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => '主題與外觀';

  @override
  String get focusBorderColor => '焦點邊框顏色';

  @override
  String get watchedIndicators => '觀察指標';

  @override
  String get always => '總是';

  @override
  String get hideUnwatched => '隱藏無人監視';

  @override
  String get episodesOnly => '僅限劇集';

  @override
  String get never => '絕不';

  @override
  String get focusExpansionAnimation => '焦點擴展動畫';

  @override
  String get desktopUiScale => '桌面 UI 比例';

  @override
  String get scaleFocusedCards => '縮放聚焦或懸停的卡片和圖塊';

  @override
  String get backgroundBackdrops => '背景背景';

  @override
  String get showBackdropImages => '顯示內容後面的背景影像';

  @override
  String get seriesThumbnails => '系列縮圖';

  @override
  String get seriesThumbnailsDescription => '僅劇集：使用與每行影像類型相符的系列圖稿';

  @override
  String get homeRowInfoOverlay => '主行資訊疊加';

  @override
  String get showTitleMetadataOnHomeRows => '瀏覽主行時顯示標題和元數據';

  @override
  String get clockDisplay => '時鐘顯示';

  @override
  String get inMenus => '在選單中';

  @override
  String get inVideo => '影片中';

  @override
  String get seasonalEffects => '季節性影響';

  @override
  String get seasonalEffectsDescription => '視覺效果和季節性裝飾';

  @override
  String get snow => '雪';

  @override
  String get fireworks => '煙火';

  @override
  String get confetti => '五彩紙屑';

  @override
  String get fallingLeaves => '落葉';

  @override
  String get themeMusic => '主題音樂';

  @override
  String get playThemeMusicOnDetailPages => '在詳情頁播放主題音樂';

  @override
  String get themeMusicVolume => '主題音樂音量';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => '主行主題音樂';

  @override
  String get playWhenBrowsingHomeScreen => '瀏覽主畫面時播放';

  @override
  String get detailsBackgroundBlur => '細節背景模糊';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => '正在瀏覽背景模糊';

  @override
  String get maxStreamingBitrate => '最大串流媒體位元率';

  @override
  String get maxResolution => '最大解析度';

  @override
  String get playerZoomMode => '播放器縮放模式';

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
  String get fit => '合身';

  @override
  String get autoCrop => '自動裁切';

  @override
  String get stretch => '拉緊';

  @override
  String get refreshRateSwitching => '刷新率切換';

  @override
  String get disabled => '殘障人士';

  @override
  String get scaleOnTv => '在電視上縮放';

  @override
  String get scaleOnDevice => '在裝置上擴展';

  @override
  String get trickPlay => '特技遊戲';

  @override
  String get showPreviewThumbnailsWhenSeeking => '搜尋時顯示預覽縮圖';

  @override
  String get showDescriptionOnPause => '顯示暫停說明';

  @override
  String get dimVideoShowOverview => '暫停時調暗影片並顯示概述文本';

  @override
  String get osdLockButton => 'OSD 鎖定按鈕';

  @override
  String get osdLockButtonDescription => '顯示一個鎖定按鈕，該按鈕會阻止觸控輸入，直到長按為止';

  @override
  String get audioBehavior => '音訊行為';

  @override
  String get downmixToStereo => '縮混至立體聲';

  @override
  String get defaultAudioLanguage => '預設音訊語言';

  @override
  String get autoServerDefault => '自動（伺服器預設）';

  @override
  String get english => '英語';

  @override
  String get spanish => '西班牙語';

  @override
  String get french => '法語';

  @override
  String get german => '德文';

  @override
  String get italian => '義大利語';

  @override
  String get portuguese => '葡萄牙語';

  @override
  String get japanese => '日本人';

  @override
  String get korean => '韓國人';

  @override
  String get chinese => '中國人';

  @override
  String get russian => '俄文';

  @override
  String get arabic => '阿拉伯';

  @override
  String get hindi => '印地語';

  @override
  String get dutch => '荷蘭語';

  @override
  String get swedish => '瑞典';

  @override
  String get norwegian => '挪威';

  @override
  String get danish => '丹麥語';

  @override
  String get finnish => '芬蘭';

  @override
  String get polish => '拋光';

  @override
  String get ac3Passthrough => 'AC3直通';

  @override
  String get dtsPassthrough => 'DTS直通';

  @override
  String get trueHdSupport => 'TrueHD 支持';

  @override
  String get enableDtsPassthrough => '僅限 AVR 的比特流 DTS 音訊；需要接收器支援和 DTS 源軌道';

  @override
  String get enableTrueHdAudio => '啟用 TrueHD 音訊（可能不適用於所有平台）';

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
  String get nightMode => '夜間模式';

  @override
  String get compressDynamicRange => '壓縮動態範圍';

  @override
  String get advancedMpv => '進階 mpv';

  @override
  String get enableCustomMpvConf => '啟用自訂 mpv.conf';

  @override
  String get applyMpvConfBeforePlayback => '在播放開始之前應用使用者指定的 mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => '不安全的進階 mpv 選項';

  @override
  String get unsafeMpvOptionsDescription => '允許更廣泛的 mpv 選項。可能會破壞播放行為。';

  @override
  String get hardwareDecoding => '硬體解碼';

  @override
  String get hardwareDecodingSubtitle => '可能會提高效能，但可能會導致某些裝置上的播放問題。';

  @override
  String get nextUpAndQueuing => '下次和排隊';

  @override
  String get nextUpDisplay => '下一個顯示';

  @override
  String get extended => '擴充';

  @override
  String get minimal => '最小';

  @override
  String get nextUpTimeout => '下一個超時';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => '媒體排隊';

  @override
  String get autoQueueNextEpisodes => '自動排隊下一集';

  @override
  String get stillWatchingPrompt => '仍在觀看提示';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => '繼續和跳過';

  @override
  String get resumeRewind => '恢復倒帶';

  @override
  String get unpauseRewind => '取消暫停倒帶';

  @override
  String get fiveSeconds => '5秒';

  @override
  String get tenSeconds => '10秒';

  @override
  String get fifteenSeconds => '15秒';

  @override
  String get thirtySeconds => '30秒';

  @override
  String get skipBackLength => '向後跳長度';

  @override
  String get skipForwardLength => '向前跳過長度';

  @override
  String get customMpvConfPath => '自訂 mpv.conf 路徑';

  @override
  String get notSetMpvConf => '未設定。 Moonfin 將嘗試應用程式/資料資料夾中的預設 mpv.conf。';

  @override
  String get selectMpvConf => '選擇mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      '樣式設定（大小、顏色、偏移）適用於基於文字的字幕（SRT、VTT、TTML）。除非關閉“ASS/SSA Direct Play”，否則 ASS/SSA 字幕將使用自己的嵌入樣式。點陣圖字幕（PGS、DVB、VobSub）無法重新設計樣式。';

  @override
  String get defaultSubtitleLanguage => '預設字幕語言';

  @override
  String get defaultToNoSubtitles => '預設為無字幕';

  @override
  String get turnOffSubtitlesByDefault => '預設關閉字幕';

  @override
  String get subtitleSize => '字幕大小';

  @override
  String get textFillColor => '文字填滿顏色';

  @override
  String get backgroundColor => '背景顏色';

  @override
  String get textStrokeColor => '文字描邊顏色';

  @override
  String get subtitleCustomization => '字幕客製';

  @override
  String get subtitleCustomizationDescription => '自訂字幕外觀';

  @override
  String get subtitlePreviewText => '敏捷的棕色狐狸跳過了懶狗';

  @override
  String get verticalOffset => '垂直偏移';

  @override
  String get pgsDirectPlay => 'PGS 直接比賽';

  @override
  String get directPlayPgsSubtitles => '直接播放PGS字幕';

  @override
  String get assSsaDirectPlay => 'ASS/SSA 直接播放';

  @override
  String get directPlayAssSsaSubtitles => '直接播放ASS/SSA字幕';

  @override
  String get white => '白色的';

  @override
  String get black => '黑色的';

  @override
  String get yellow => '黃色的';

  @override
  String get green => '綠色的';

  @override
  String get cyan => '青色';

  @override
  String get red => '紅色的';

  @override
  String get transparent => '透明的';

  @override
  String get semiTransparentBlack => '半透明黑色';

  @override
  String get global => '全球的';

  @override
  String get desktop => '桌面';

  @override
  String get mobile => '移動的';

  @override
  String get tv => '電視';

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
  String get customizationProfile => '客製化簡介';

  @override
  String get customizationProfileDescription =>
      '選擇要載入、編輯和同步的設定檔。全域適用於任何地方，除非設備設定檔覆蓋它。綠點標記您目前的設備設定檔。';

  @override
  String get loadProfile => '負載曲線';

  @override
  String get syncing => '正在同步...';

  @override
  String get syncToProfile => '同步到設定檔';

  @override
  String get profileSyncHidden => '設定檔同步隱藏';

  @override
  String get enablePluginSyncDescription => '在插件設定中啟用伺服器插件同步以在此處顯示設定檔控制項。';

  @override
  String get quality => '品質';

  @override
  String get defaultDownloadQuality => '預設下載品質';

  @override
  String get network => '網路';

  @override
  String get wifiOnlyDownloads => '僅 WiFi 下載';

  @override
  String get onlyDownloadOnWifi => '僅在連接 WiFi 時下載';

  @override
  String get storage => '貯存';

  @override
  String get storageUsed => '已用儲存空間';

  @override
  String get manage => '管理';

  @override
  String get calculating => '正在計算...';

  @override
  String get downloadLocation => '下載位置';

  @override
  String get defaultLabel => '預設';

  @override
  String get saveToDownloadsFolder => '儲存到下載資料夾';

  @override
  String get downloadsVisibleToOtherApps => 'Downloads/Moonfin — 對其他應用程式可見';

  @override
  String get dangerZone => '危險區';

  @override
  String get clearAllDownloads => '清除所有下載';

  @override
  String get original => '原來的';

  @override
  String get changeDownloadLocation => '更改下載位置';

  @override
  String get changeDownloadLocationDescription =>
      '新下載的內容將會儲存到所選資料夾中。現有下載將保留在目前位置，並且可以透過儲存設定進行管理。';

  @override
  String get confirm => '確認';

  @override
  String get cannotWriteToFolder => '無法寫入選定的資料夾。請選擇其他位置或授予儲存權限。';

  @override
  String get saveToDownloadsFolderQuestion => '儲存到下載資料夾嗎？';

  @override
  String get saveToDownloadsFolderDescription =>
      '下載的媒體將會儲存到您裝置上的 Downloads/Moonfin 中。這些檔案將對其他應用程式可見，例如您的圖庫或音樂播放器。\n\n現有下載將保留在目前位置。';

  @override
  String get enable => '使能夠';

  @override
  String get clearAllDownloadsWarning => '這將刪除所有下載的媒體並且無法撤銷。';

  @override
  String get clearAll => '全部清除';

  @override
  String get navigationStyle => '導航風格';

  @override
  String get topBar => '頂欄';

  @override
  String get leftSidebar => '左側邊欄';

  @override
  String get showShuffleButton => '顯示隨機播放鈕';

  @override
  String get showGenresButton => '顯示流派按鈕';

  @override
  String get showFavoritesButton => '顯示收藏夾按鈕';

  @override
  String get showLibrariesInToolbar => '在工具列中顯示庫';

  @override
  String get navbarOpacity => '導覽列不透明度';

  @override
  String get navbarColor => '導覽列顏色';

  @override
  String get gray => '灰色的';

  @override
  String get darkBlue => '深藍色';

  @override
  String get purple => '紫色的';

  @override
  String get teal => '青色';

  @override
  String get navy => '海軍';

  @override
  String get charcoal => '木炭';

  @override
  String get brown => '棕色的';

  @override
  String get darkRed => '深紅色';

  @override
  String get darkGreen => '深綠色';

  @override
  String get slate => '石板';

  @override
  String get indigo => '靛青';

  @override
  String get libraryDisplay => '圖書館展示';

  @override
  String get posterLabel => '海報';

  @override
  String get thumbnailLabel => '縮圖';

  @override
  String get bannerLabel => '橫幅';

  @override
  String get overridePerLibrarySettings => '覆蓋每個庫的設置';

  @override
  String get applyImageTypeToAllLibraries => '將影像類型套用至所有函式庫';

  @override
  String get multiServerLibraries => '多伺服器庫';

  @override
  String get showLibrariesFromAllServers => '顯示所有連接伺服器的庫';

  @override
  String get enableFolderView => '啟用資料夾視圖';

  @override
  String get showFolderBrowsingOption => '顯示資料夾瀏覽選項';

  @override
  String get libraryVisibility => '圖書館可見性';

  @override
  String get libraryVisibilityDescription => '切換每個庫的主頁可見性。重新啟動 Moonfin 以使變更生效。';

  @override
  String get showInNavigation => '在導航中顯示';

  @override
  String get showInLatestMedia => '在最新媒體上展示';

  @override
  String get sourceLibraries => '來源庫';

  @override
  String get sourceCollections => '來源集';

  @override
  String get excludedGenres => '排除的類型';

  @override
  String get selectAll => '選擇全部';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => '媒體欄';

  @override
  String get mediaSources => '媒體來源';

  @override
  String get behavior => '行為';

  @override
  String get seconds => '秒';

  @override
  String get localPreviews => '本地預覽';

  @override
  String get localPreviewsDescription => '配置預告片、媒體和音訊預覽。';

  @override
  String get mediaBarMode => '媒體欄風格';

  @override
  String get mediaBarModeDescription => '在 Moonfin、MakD 之間進行選擇，或關閉媒體列';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => '馬克D';

  @override
  String get mediaBarModeOff => '離開';

  @override
  String get enableMediaBar => '啟用媒體欄';

  @override
  String get showFeaturedContentSlideshow => '在首頁顯示特色內容投影片';

  @override
  String get contentType => '內容類型';

  @override
  String get moviesAndTvShows => '電影和電視節目';

  @override
  String get moviesOnly => '僅限電影';

  @override
  String get tvShowsOnly => '限電視節目';

  @override
  String get itemCount => '商品數量';

  @override
  String get noneSelected => '未選擇';

  @override
  String get noneExcluded => '沒有排除';

  @override
  String get autoAdvance => '自動前進';

  @override
  String get autoAdvanceSlides => '自動前進到下一張幻燈片';

  @override
  String get autoAdvanceInterval => '自動前進間隔';

  @override
  String get trailerPreview => '預告片預覽';

  @override
  String get autoPlayTrailers => '3 秒後在媒體列中自動播放預告片';

  @override
  String get episodePreview => '劇集預覽';

  @override
  String get mediaPreview => '媒體預覽';

  @override
  String get episodePreviewDescription => '在聚焦、懸停或長按的卡片上播放 30 秒的內嵌預覽';

  @override
  String get mediaPreviewDescription => '在聚焦、懸停或長按的卡片上播放 30 秒的內嵌預覽';

  @override
  String get previewAudio => '預覽音訊';

  @override
  String get enablePreviewAudio => '為預告片和劇集預覽啟用音訊';

  @override
  String get latestMedia => '最新媒體';

  @override
  String get recentlyReleased => '最近發布';

  @override
  String get myMedia => '我的媒體';

  @override
  String get myMediaSmall => '我的媒體（小）';

  @override
  String get continueWatching => '繼續觀看';

  @override
  String get resumeAudio => '恢復音訊';

  @override
  String get resumeBooks => '履歷書籍';

  @override
  String get activeRecordings => '活動錄音';

  @override
  String get playlists => '播放清單';

  @override
  String get liveTV => '電視直播';

  @override
  String get homeSections => '首頁 欄目';

  @override
  String get resetToDefaults => '重設為預設值';

  @override
  String get homeRowPosterSize => '主排海報尺寸';

  @override
  String get perRowImageTypeSelection => '每行影像類型選擇';

  @override
  String get configureImageTypeForEachRow => '為每個啟用的主行配置影像類型';

  @override
  String get mergeContinueWatchingAndNextUp => '合併繼續觀看和下一步';

  @override
  String get combineBothRows => '將兩行合併為一個主頁部分';

  @override
  String get perRowImageType => '每行圖像類型';

  @override
  String get perRowSettings => '每行設定';

  @override
  String get autoLogin => '自動登入';

  @override
  String get lastUser => '最後一個用戶';

  @override
  String get specificUser => '特定用戶';

  @override
  String get alwaysAuthenticate => '始終進行身份驗證';

  @override
  String get requirePasswordWithToken => '即使使用儲存的令牌也需要密碼';

  @override
  String get confirmExit => '確認退出';

  @override
  String get showConfirmationBeforeExiting => '退出前顯示確認訊息';

  @override
  String get blockContentWithRatings => '阻止具有以下評級的內容：';

  @override
  String get noContentRatingsFound => '在此伺服器上尚未找到內容分級。';

  @override
  String get couldNotLoadServerRatings => '無法載入伺服器評級。僅顯示已儲存的評分。';

  @override
  String get couldNotRefreshRatings => '無法刷新伺服器的評級。顯示已儲存的評分。';

  @override
  String get enablePinCode => '啟用 PIN 碼';

  @override
  String get requirePinToAccess => '需要 PIN 碼才能存取您的帳戶';

  @override
  String get changePin => '更改密碼';

  @override
  String get setNewPinCode => '設定新的 PIN 碼';

  @override
  String get removePin => '刪除 PIN 碼';

  @override
  String get removePinProtection => '刪除 PIN 碼保護';

  @override
  String get screensaver => '螢幕保護程式';

  @override
  String get inAppScreensaver => '應用程式內螢幕保護程式';

  @override
  String get enableBuiltInScreensaver => '啟用內建螢幕保護程式';

  @override
  String get mode => '模式';

  @override
  String get libraryArt => '圖書館藝術';

  @override
  String get logo => '標識';

  @override
  String get clock => '鐘';

  @override
  String get timeout => '暫停';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => '調光等級';

  @override
  String get maxAgeRating => '最大年齡等級';

  @override
  String get any => '任何';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => '需要年齡分級';

  @override
  String get onlyShowRatedContent => '只顯示評分內容';

  @override
  String get showClock => '顯示時鐘';

  @override
  String get displayClockDuringScreensaver => '螢幕保護期間顯示時鐘';

  @override
  String get rottenTomatoesCritics => '爛番茄（評論家）';

  @override
  String get rottenTomatoesAudience => '爛番茄（觀眾）';

  @override
  String get imdb => '網路醫學資料庫';

  @override
  String get tmdb => 'TM資料庫';

  @override
  String get metacritic => '元評論家';

  @override
  String get metacriticUser => '元評論家（使用者）';

  @override
  String get trakt => '特拉克特';

  @override
  String get letterboxd => '信箱';

  @override
  String get myAnimeList => '我的動漫列表';

  @override
  String get aniList => '動畫列表';

  @override
  String get communityRating => '社區評級';

  @override
  String get ratings => '評級';

  @override
  String get additionalRatings => '附加評級';

  @override
  String get showMdbListAndTmdbRatings => '顯示 MDBList 和 TMDB 評級';

  @override
  String get ratingLabels => '評級標籤';

  @override
  String get showLabelsNextToIcons => '在評級圖示旁顯示標籤';

  @override
  String get ratingBadges => '評級徽章';

  @override
  String get showDecorativeBadges => '顯示評分背後的裝飾徽章';

  @override
  String get episodeRatings => '劇集收視率';

  @override
  String get showRatingsOnEpisodes => '顯示個別劇集的收視率';

  @override
  String get ratingSources => '評級來源';

  @override
  String get ratingSourcesDescription => '啟用並重新排序整個應用程式中顯示的評級來源';

  @override
  String get pluginLabel => '外掛';

  @override
  String get pluginDetected => '偵測到插件';

  @override
  String get pluginNotDetected => '未偵測到插件';

  @override
  String get pluginDetectedDescription => '檢測到伺服器插件。第一次找到外掛時會自動啟用同步。';

  @override
  String get pluginNotDetectedDescription => '目前未偵測到伺服器插件。本地設定仍然使用其保存的值或內建預設值。';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => '可用服務';

  @override
  String get serverPluginSync => '伺服器插件同步';

  @override
  String get syncSettingsWithPlugin => '與伺服器插件同步設定';

  @override
  String get whatSyncControls => '同步控制什麼';

  @override
  String get syncControlsDescription =>
      '同步僅控制插件支援的設定是否推送到伺服器或從伺服器拉出。啟用插件同步後，設定檔選擇和設定檔同步操作位於自訂設定中。';

  @override
  String get recentRequests => '最近的請求';

  @override
  String get recentlyAdded => '最近新增';

  @override
  String get trending => '流行趨勢';

  @override
  String get popularMovies => '熱門電影';

  @override
  String get movieGenres => '電影類型';

  @override
  String get upcomingMovies => '即將上映的電影';

  @override
  String get studios => '工作室';

  @override
  String get popularSeries => '熱門系列';

  @override
  String get seriesGenres => '系列流派';

  @override
  String get upcomingSeries => '即將推出的系列';

  @override
  String get networks => '網路';

  @override
  String get resetRowsToDefaults => '將行重設為預設值';

  @override
  String get enableSeerr => '啟用搜尋器';

  @override
  String get showSeerrInNavigation => '在導航中顯示 Seerr（需要伺服器插件）';

  @override
  String get seerrUnavailable => '不可用，因為伺服器插件 Seerr 支援已停用。';

  @override
  String get nsfwFilter => 'NSFW 過濾器';

  @override
  String get hideAdultContent => '在結果中隱藏成人內容';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => '發現行';

  @override
  String get discoverRowsDescriptionPlugin =>
      '拖曳以重新排序。啟用或停用行。啟用與 Moonfin 插件的行順序同步。';

  @override
  String get discoverRowsDescription => '拖曳以重新排序。啟用或停用行。';

  @override
  String get enabled => '啟用';

  @override
  String get hidden => '隱';

  @override
  String get aboutTitle => '關於';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => '開源許可證';

  @override
  String get sourceCode => '原始碼';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => '立即檢查更新';

  @override
  String get checksLatestDesktopRelease => '檢查該平台的最新桌面版本';

  @override
  String get youAreUpToDate => '你是最新的。';

  @override
  String get couldNotCheckForUpdates => '目前無法檢查更新。';

  @override
  String get noCompatibleUpdate => '找不到該平台的兼容更新包。';

  @override
  String get updateChecksNotSupported => '此平台不支援更新檢查。';

  @override
  String get updateNotificationsDisabled => '更新通知已被停用。';

  @override
  String get pleaseWaitBeforeChecking => '請稍候再檢查。';

  @override
  String get latestUpdateAlreadyShown => '最新更新已經顯示。';

  @override
  String get updateAvailable => '可用更新。';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => '更新通知';

  @override
  String get showWhenUpdatesAvailable => '顯示更新何時可用';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => '閱讀發行說明';

  @override
  String get downloadingUpdate => '正在下載更新...';

  @override
  String get updateDownloadFailed => '更新下載失敗。請再試一次。';

  @override
  String get openReleasesPage => '開啟發布頁面';

  @override
  String get navigation => '導航';

  @override
  String get watchedIndicatorsBackdrops => '觀看指標、背景';

  @override
  String get focusColorWatchedIndicatorsBackdrops => '焦點顏色、觀察指標、背景';

  @override
  String get navbarStyleToolbarAppearance => '導覽列樣式、工具列按鈕、外觀';

  @override
  String get reorderToggleHomeRows => '重新排序和切換主行';

  @override
  String get featuredContentAppearance => '特色內容、外觀';

  @override
  String get posterSizeImageTypeFolderView => '海報尺寸、圖像類型、資料夾視圖';

  @override
  String get mdbListTmdbRatingSources => 'MDBList、TMDB 和評級來源';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => '清除';

  @override
  String get browse => '瀏覽';

  @override
  String get noResults => '沒有結果';

  @override
  String get seerrAvailableStatus => '可用的';

  @override
  String get seerrRequestedStatus => '已請求';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => '搜尋者設定';

  @override
  String get requestMore => '請求更多';

  @override
  String get request => '要求';

  @override
  String get cancelRequest => '取消請求';

  @override
  String get playInMoonfin => '玩 Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => '核准';

  @override
  String get declineAction => '衰退';

  @override
  String get similar => '相似的';

  @override
  String get recommendations => '建議';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => '保持';

  @override
  String get itemNotFoundInLibrary => '在您的 Moonfin 庫中找不到項目';

  @override
  String get errorSearchingLibrary => '搜尋庫時出錯';

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
  String get submitRequest => '提交請求';

  @override
  String get allSeasons => '所有季節';

  @override
  String get advancedOptions => '進階選項';

  @override
  String get noServiceServersConfigured => '未配置服務伺服器';

  @override
  String get server => '伺服器';

  @override
  String get qualityProfile => '品質概況';

  @override
  String get rootFolder => '根資料夾';

  @override
  String get showMore => '顯示更多';

  @override
  String get appearances => '出場次數';

  @override
  String get crewSection => '全體人員';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => '沒有要求';

  @override
  String get pendingStatus => '待辦的';

  @override
  String get declinedStatus => '拒絕';

  @override
  String get partiallyAvailable => '部分可用';

  @override
  String get downloadingStatus => '正在下載';

  @override
  String get approvedStatus => '得到正式認可的';

  @override
  String get notRequestedStatus => '未要求';

  @override
  String get blocklistedStatus => '列入黑名單';

  @override
  String get deletedStatus => '已刪除';

  @override
  String get tmdbScore => 'TMDB分數';

  @override
  String get releaseDateLabel => '發布日期';

  @override
  String get firstAirDateLabel => '首播日期';

  @override
  String get revenueLabel => '收入';

  @override
  String get runtimeLabel => '運行時';

  @override
  String get budgetLabel => '預算';

  @override
  String get originalLanguageLabel => '原始語言';

  @override
  String get seasonsLabel => '季節';

  @override
  String get episodesLabel => '劇集數';

  @override
  String get access => '使用權';

  @override
  String get add => '添加';

  @override
  String get address => '地址';

  @override
  String get analytics => '分析';

  @override
  String get catalog => '目錄';

  @override
  String get content => '內容';

  @override
  String get copy => '複製';

  @override
  String get create => '創造';

  @override
  String get disable => '停用';

  @override
  String get done => '完畢';

  @override
  String get edit => '編輯';

  @override
  String get encoding => '編碼';

  @override
  String get error => '錯誤';

  @override
  String get forward => '向前';

  @override
  String get general => '一般的';

  @override
  String get go => '去';

  @override
  String get install => '安裝';

  @override
  String get installed => '已安裝';

  @override
  String get interval => '間隔';

  @override
  String get name => '姓名';

  @override
  String get networking => '聯網';

  @override
  String get next => '下一個';

  @override
  String get path => '小路';

  @override
  String get paused => '已暫停';

  @override
  String get permissions => '權限';

  @override
  String get processing => '加工';

  @override
  String get profile => '輪廓';

  @override
  String get provider => '提供者';

  @override
  String get refresh => '重新整理';

  @override
  String get remote => '偏僻的';

  @override
  String get rename => '重新命名';

  @override
  String get revoke => '撤銷';

  @override
  String get role => '角色';

  @override
  String get root => '根';

  @override
  String get run => '跑步';

  @override
  String get search => '搜尋';

  @override
  String get select => '選擇';

  @override
  String get send => '傳送';

  @override
  String get sessions => '會議';

  @override
  String get set => '放';

  @override
  String get status => '地位';

  @override
  String get stop => '停止';

  @override
  String get streaming => '串流媒體';

  @override
  String get time => '時間';

  @override
  String get trickplay => '特技遊戲';

  @override
  String get uninstall => '解除安裝';

  @override
  String get up => '向上';

  @override
  String get update => '更新';

  @override
  String get upload => '上傳';

  @override
  String get unmute => '取消靜音';

  @override
  String get mute => '沉默的';

  @override
  String get branding => '品牌推廣';

  @override
  String get adminDrawerDashboard => '儀表板';

  @override
  String get adminDrawerAnalytics => '分析';

  @override
  String get adminDrawerSettings => '設定';

  @override
  String get adminDrawerBranding => '品牌推廣';

  @override
  String get adminDrawerUsers => '使用者';

  @override
  String get adminDrawerLibraries => '圖書館';

  @override
  String get adminDrawerTranscoding => '轉碼';

  @override
  String get adminDrawerResume => '恢復';

  @override
  String get adminDrawerStreaming => '串流媒體';

  @override
  String get adminDrawerTrickplay => '特技遊戲';

  @override
  String get adminDrawerDevices => '裝置';

  @override
  String get adminDrawerActivity => '活動';

  @override
  String get adminDrawerNetworking => '聯網';

  @override
  String get adminDrawerApiKeys => 'API 金鑰';

  @override
  String get adminDrawerBackups => '備份';

  @override
  String get adminDrawerLogs => '紀錄';

  @override
  String get adminDrawerScheduledTasks => '計劃任務';

  @override
  String get adminDrawerPlugins => '外掛';

  @override
  String get adminDrawerRepositories => '儲存庫';

  @override
  String get adminDrawerLiveTv => '電視直播';

  @override
  String get adminExitTooltip => '退出管理';

  @override
  String get adminDashboardLoadFailed => '無法載入儀表板';

  @override
  String get adminMediaOverview => '媒體概覽';

  @override
  String get adminMediaTotalsError => '無法載入伺服器媒體總數。';

  @override
  String get adminMediaOverviewSubtitle => '快速了解該伺服器上有多少內容。';

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
  String get analyticsMediaDistribution => '媒體發行';

  @override
  String get analyticsVideoCodecs => '視訊編解碼器';

  @override
  String get analyticsAudioCodecs => '音訊編解碼器';

  @override
  String get analyticsContainers => '貨櫃';

  @override
  String get analyticsTopGenres => '熱門流派';

  @override
  String get analyticsReleaseYears => '發布年份';

  @override
  String get analyticsContentRatings => '內容評級';

  @override
  String get analyticsRuntimeBuckets => '運行時桶';

  @override
  String get analyticsFileFormats => '文件格式';

  @override
  String get analyticsNoData => '無可用數據。';

  @override
  String get adminServerInfo => '伺服器資訊';

  @override
  String get adminRestartPending => '重啟待定';

  @override
  String get adminServerPaths => '伺服器路徑';

  @override
  String get adminServerActions => '伺服器操作';

  @override
  String get adminRestartServer => '重啟伺服器';

  @override
  String get adminShutdownServer => '關閉伺服器';

  @override
  String get adminScanLibraries => '掃描函式庫';

  @override
  String get adminLibraryScanStarted => '圖書館掃描開始';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => '伺服器正在重啟';

  @override
  String get adminServerRebootMessage => '伺服器正在重新啟動，請重新啟動 Moonfin';

  @override
  String get adminActiveSessions => '活躍會話';

  @override
  String get adminSessionsLoadFailed => '無法載入會話';

  @override
  String get adminNoActiveSessions => '沒有活動會話';

  @override
  String get adminRecentActivity => '最近的活動';

  @override
  String get adminNoRecentActivity => '最近沒有活動';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => '發送訊息';

  @override
  String get adminMessageTextHint => '留言內容';

  @override
  String get adminSetVolume => '設定音量';

  @override
  String get sessionPrev => '上一篇';

  @override
  String get sessionRewind => '倒帶';

  @override
  String get sessionForward => '向前';

  @override
  String get sessionNext => '下一個';

  @override
  String get sessionVolumeDown => '卷 –';

  @override
  String get sessionVolumeUp => '卷+';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => '正在播放';

  @override
  String get volume => '體積';

  @override
  String get actions => '行動';

  @override
  String get videoCodec => '視訊編解碼器';

  @override
  String get audioCodec => '音訊編解碼器';

  @override
  String get hwAccel => '硬體加速';

  @override
  String get completion => '完成';

  @override
  String get direct => '直接的';

  @override
  String get adminDisconnect => '斷開';

  @override
  String get adminClearDates => '明確日期';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => '沒有活動條目';

  @override
  String get adminEditDeviceName => '編輯設備名稱';

  @override
  String get adminCustomName => '自訂名稱';

  @override
  String get adminDeviceNameUpdated => '設備名稱已更新';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => '刪除設備';

  @override
  String get adminDeviceDeleted => '設備已刪除';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => '載入設備失敗';

  @override
  String get adminSearchDevices => '搜尋設備';

  @override
  String get adminThisDevice => '本設備';

  @override
  String get adminEditName => '編輯姓名';

  @override
  String get adminLibrariesLoadFailed => '載入庫失敗';

  @override
  String get adminNoLibraries => '沒有配置庫';

  @override
  String get adminScanAllLibraries => '掃描所有圖書館';

  @override
  String get adminAddLibrary => '新增庫';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => '重新命名庫';

  @override
  String get adminNewName => '新名稱';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => '刪除庫';

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
  String get adminRemovePath => '刪除路徑';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => '已儲存庫選項';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => '載入庫失敗';

  @override
  String get adminNoMediaPaths => '未配置媒體路徑';

  @override
  String get adminAddPath => '新增路徑';

  @override
  String get adminBrowseFilesystem => '瀏覽伺服器檔案系統：';

  @override
  String get adminSaveOptions => '儲存選項';

  @override
  String get adminPreferredMetadataLanguage => '首選元資料語言';

  @override
  String get adminMetadataLanguageHint => '例如英語、德語、法語';

  @override
  String get adminMetadataCountryCode => '元數據國家代碼';

  @override
  String get adminMetadataCountryHint => '例如美國、德國、法國';

  @override
  String get adminLibraryNameRequired => '庫名稱為必填項';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => '圖書館名稱';

  @override
  String get adminSelectedPaths => '選定的路徑：';

  @override
  String get adminNoPathsAdded => '未新增路徑（可以稍後新增）';

  @override
  String get adminCreateLibrary => '建立庫';

  @override
  String get paths => '路徑：';

  @override
  String get adminDisableUser => '停用用戶';

  @override
  String get adminEnableUser => '啟用用戶';

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
  String get adminUsersLoadFailed => '載入用戶失敗';

  @override
  String get adminSearchUsers => '搜尋用戶';

  @override
  String get adminEditUser => '編輯使用者';

  @override
  String get adminAddUser => '新增用戶';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => '創建用戶';

  @override
  String get adminPasswordOptional => '密碼（可選）';

  @override
  String get adminUsernameRequired => '使用者名稱不能為空';

  @override
  String get adminNoProfileChanges => '沒有要儲存的設定檔更改';

  @override
  String get adminProfileSaved => '個人資料已儲存';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => '權限已儲存';

  @override
  String get adminPasswordsMismatch => '密碼不匹配';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => '載入用戶失敗';

  @override
  String get adminBackToUsers => '返回用戶';

  @override
  String get adminSaveProfile => '儲存個人資料';

  @override
  String get adminDeleteUser => '刪除用戶';

  @override
  String get admin => '行政';

  @override
  String get adminFullAccessWarning => '管理員擁有伺服器的完全存取權限。謹慎授予。';

  @override
  String get administrator => '行政人員';

  @override
  String get adminHiddenUser => '隱藏用戶';

  @override
  String get adminAllowMediaPlayback => '允許媒體播放';

  @override
  String get adminAllowAudioTranscoding => '允許音訊轉碼';

  @override
  String get adminAllowVideoTranscoding => '允許視訊轉碼';

  @override
  String get adminAllowRemuxing => '允許重新復用';

  @override
  String get adminForceRemoteTranscoding => '強制遠端來源轉碼';

  @override
  String get adminAllowContentDeletion => '允許內容刪除';

  @override
  String get adminAllowContentDownloading => '允許內容下載';

  @override
  String get adminAllowPublicSharing => '允許公開分享';

  @override
  String get adminAllowRemoteControl => '允許其他使用者遠端控制';

  @override
  String get adminAllowSharedDeviceControl => '允許共享設備控制';

  @override
  String get adminAllowRemoteAccess => '允許遠端存取';

  @override
  String get adminRemoteBitrateLimit => '遠端客戶端位元速率限制 (bps)';

  @override
  String get adminLeaveEmptyNoLimit => '留空則無限制';

  @override
  String get adminMaxActiveSessions => '最大活躍會話數';

  @override
  String get adminAllowLiveTvAccess => '允許存取直播電視';

  @override
  String get adminAllowLiveTvManagement => '允許直播電視管理';

  @override
  String get adminAllowCollectionManagement => '允許集合管理';

  @override
  String get adminAllowSubtitleManagement => '允許字幕管理';

  @override
  String get adminAllowLyricManagement => '允許歌詞管理';

  @override
  String get adminSavePermissions => '保存權限';

  @override
  String get adminEnableAllLibraryAccess => '允許存取所有庫';

  @override
  String get adminSaveAccess => '儲存存取權限';

  @override
  String get adminChangePassword => '更改密碼';

  @override
  String get adminNewPassword => '新密碼';

  @override
  String get adminConfirmPassword => '確認密碼';

  @override
  String get adminSetPassword => '設定密碼';

  @override
  String get adminResetPassword => '重設密碼';

  @override
  String get adminPasswordReset => '密碼重設';

  @override
  String get adminPasswordUpdated => '密碼已更新';

  @override
  String get adminUserSettings => '使用者設定';

  @override
  String get adminLibraryAccess => '圖書館訪問';

  @override
  String get adminDeviceAndChannelAccess => '設備和通道訪問';

  @override
  String get adminEnableAllDevices => '啟用對所有裝置的訪問';

  @override
  String get adminEnableAllChannels => '允許存取所有頻道';

  @override
  String get adminResetPasswordWarning => '這將刪除密碼。用戶無需密碼即可登入。';

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
  String get adminCreateApiKey => '建立 API 金鑰';

  @override
  String get adminAppName => '應用程式名稱';

  @override
  String get adminApiKeyCreated => 'API 金鑰已建立';

  @override
  String get adminApiKeyCreatedNoToken => '密鑰創建成功。伺服器沒有回傳令牌。檢查伺服器 API 金鑰。';

  @override
  String get adminKeyCopied => '密鑰已複製到剪貼簿';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => '伺服器回應中缺少密鑰令牌';

  @override
  String get adminRevokeApiKey => '撤銷 API 金鑰';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API 金鑰已撤銷';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => '無法載入 API 金鑰';

  @override
  String get adminApiKeysTitle => 'API 金鑰';

  @override
  String get adminCreateKey => '建立密鑰';

  @override
  String get adminNoApiKeys => '未找到 API 金鑰';

  @override
  String get adminUnknownApp => '未知應用程式';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => '正在建立備份...';

  @override
  String get adminBackupCreated => '備份建立成功';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => '伺服器回應中缺少備份路徑';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => '確認恢復';

  @override
  String get adminRestoringBackup => '正在恢復備份...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => '無法載入備份';

  @override
  String get adminCreateBackup => '建立備份';

  @override
  String get adminNoBackups => '未找到備份';

  @override
  String get adminViewDetails => '看詳情';

  @override
  String get restore => '恢復';

  @override
  String get adminLogsLoadFailed => '載入伺服器日誌失敗';

  @override
  String get adminNoLogFiles => '未找到日誌文件';

  @override
  String get adminLogCopied => '日誌已複製到剪貼簿';

  @override
  String get adminSaveLogFile => '保存日誌文件';

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
  String get adminSearchInLog => '在日誌中搜尋';

  @override
  String get adminNoMatchingLines => '沒有匹配的線';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => '沒有找到計劃任務';

  @override
  String get adminNoTasksMatchFilter => '沒有任務與當前過濾器匹配';

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
  String get adminRunNow => '立即運行';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => '最後執行';

  @override
  String get adminTriggers => '觸發器';

  @override
  String get adminAddTrigger => '新增觸發器';

  @override
  String get adminNoTriggers => '沒有配置觸發器';

  @override
  String get adminTriggerType => '觸發類型';

  @override
  String get adminTimeLimit => '時間限制（可選）';

  @override
  String get adminNoLimit => '無限制';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => '星期幾';

  @override
  String get adminSearchPlugins => '搜尋插件...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => '解除安裝插件';

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
  String get adminNoPluginsMatchSearch => '沒有符合您搜尋條件的插件';

  @override
  String get adminNoPluginsInstalled => '沒有安裝插件';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => '沒有符合您搜尋條件的軟體包';

  @override
  String get adminNoPackagesAvailable => '沒有可用的套餐';

  @override
  String get adminExperimentalIntegration => '實驗整合';

  @override
  String get adminExperimentalWarning => '插件設定整合仍處於實驗階段。某些設定頁面可能無法正確呈現。';

  @override
  String get continueAction => '繼續';

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
  String get adminMissingAuthToken => '無法開啟設定：缺少身份驗證令牌。';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => '找不到插件';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => '啟用插件';

  @override
  String get adminPluginSettingsPage => '插件設定頁面';

  @override
  String get adminRevisionHistory => '修訂歷史';

  @override
  String get adminNoChangelog => '沒有可用的變更日誌。';

  @override
  String get adminRemoveRepository => '刪除儲存庫';

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
  String get adminRepositoryNameHint => '例如Jellyfin 穩定';

  @override
  String get adminRepositoryUrl => '儲存庫網址';

  @override
  String get adminAddEntry => '新增條目';

  @override
  String get adminInvalidUrl => '無效網址';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => '在瀏覽器中開啟';

  @override
  String get adminOpenExternally => '對外開放';

  @override
  String get adminGeneralSettings => '常規設定';

  @override
  String get adminServerName => '伺服器名稱';

  @override
  String get adminPreferredMetadataCountry => '首選元數據國家/地區';

  @override
  String get adminCachePath => '快取路徑';

  @override
  String get adminMetadataPath => '元資料路徑';

  @override
  String get adminLibraryScanConcurrency => '庫掃描並行';

  @override
  String get adminParallelImageEncodingLimit => '並行圖像編碼限制';

  @override
  String get adminSlowResponseThreshold => '慢響應閾值（毫秒）';

  @override
  String get adminBrandingSaved => '已儲存品牌設定';

  @override
  String get adminBrandingLoadFailed => '無法加載品牌設置';

  @override
  String get adminLoginDisclaimer => '登入免責聲明';

  @override
  String get adminLoginDisclaimerHint => 'HTML 顯示在登入表單下方';

  @override
  String get adminCustomCss => '自訂CSS';

  @override
  String get adminCustomCssHint => '應用於 Web 介面的自訂 CSS';

  @override
  String get adminEnableSplashScreen => '啟用啟動畫面';

  @override
  String get adminStreamingSaved => '已儲存串流媒體設定';

  @override
  String get adminStreamingLoadFailed => '無法加載串流媒體設置';

  @override
  String get adminStreamingDescription => '設定遠端連線的全域流比特率限制。';

  @override
  String get adminRemoteBitrateLimitMbps => '遠端客戶端位元速率限制 (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => '留空或 0 表示無限制';

  @override
  String get adminPlaybackSaved => '已儲存播放設定';

  @override
  String get adminPlaybackLoadFailed => '無法載入播放設定';

  @override
  String get adminPlaybackTranscoding => '播放/轉碼';

  @override
  String get adminHardwareAcceleration => '硬體加速';

  @override
  String get adminVaapiDevice => 'VA-API裝置';

  @override
  String get adminEnableHardwareEncoding => '啟用硬體編碼';

  @override
  String get adminEnableHardwareDecoding => '啟用硬體解碼：';

  @override
  String get adminEncodingThreads => '編碼線程';

  @override
  String get adminAutomatic => '0 = 自動';

  @override
  String get adminTranscodingTempPath => '轉碼臨時路徑';

  @override
  String get adminEnableFallbackFont => '啟用後備字體';

  @override
  String get adminFallbackFontPath => '後備字體路徑';

  @override
  String get adminAllowSegmentDeletion => '允許段刪除';

  @override
  String get adminSegmentKeepSeconds => '段保持（秒）';

  @override
  String get adminThrottleBuffering => '油門緩衝';

  @override
  String get adminTrickplaySaved => '已儲存特技播放設定';

  @override
  String get adminTrickplayLoadFailed => '無法載入特技播放設置';

  @override
  String get adminEnableHardwareAcceleration => '啟用硬體加速';

  @override
  String get adminEnableKeyFrameExtraction => '啟用僅提取關鍵幀';

  @override
  String get adminKeyFrameSubtitle => '速度較快但精度較低';

  @override
  String get adminScanBehavior => '掃描行為';

  @override
  String get adminProcessPriority => '行程優先權';

  @override
  String get adminImageSettings => '影像設定';

  @override
  String get adminIntervalMs => '間隔（毫秒）';

  @override
  String get adminCaptureFrameSubtitle => '捕獲幀的頻率';

  @override
  String get adminWidthResolutions => '寬度解析度';

  @override
  String get adminTileWidth => '磁磚寬度';

  @override
  String get adminTileHeight => '瓷磚高度';

  @override
  String get adminQualitySubtitle => '較低的值=更好的質量，更大的文件';

  @override
  String get adminProcessThreads => '處理線程';

  @override
  String get adminResumeSaved => '恢復已儲存的設定';

  @override
  String get adminResumeLoadFailed => '無法載入恢復設定';

  @override
  String get adminResumeDescription => '配置何時應將內容標記為部分播放或完全播放。';

  @override
  String get adminMinResumePercentage => '最低履歷百分比';

  @override
  String get adminMinResumeSubtitle => '播放內容必須超過此百分比才能保存進度';

  @override
  String get adminMaxResumePercentage => '最大履歷百分比';

  @override
  String get adminMaxResumeSubtitle => '在此百分比之後，內容被視為已完全播放';

  @override
  String get adminMinResumeDuration => '最短恢復持續時間（秒）';

  @override
  String get adminMinResumeDurationSubtitle => '比這短的項目不可恢復';

  @override
  String get adminMinAudiobookResume => '有聲書最低履歷百分比';

  @override
  String get adminMaxAudiobookResume => '最大有聲書恢復百分比';

  @override
  String get adminNetworkingSaved => '已儲存網路設定。可能需要重新啟動伺服器。';

  @override
  String get adminNetworkingLoadFailed => '無法載入網路設定';

  @override
  String get adminNetworkingWarning => '更改網路設定可能需要重新啟動伺服器。';

  @override
  String get adminEnableRemoteAccess => '啟用遠端存取';

  @override
  String get ports => '港口';

  @override
  String get adminHttpPort => 'HTTP連接埠';

  @override
  String get adminHttpsPort => 'HTTPS連接埠';

  @override
  String get adminPublicHttpsPort => '公共 HTTPS 連接埠';

  @override
  String get adminBaseUrl => '基本網址';

  @override
  String get adminBaseUrlHint => '例如/果凍';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => '啟用 HTTPS';

  @override
  String get adminLocalNetwork => '本地網路';

  @override
  String get adminLocalNetworkAddresses => '本地網路位址';

  @override
  String get adminKnownProxies => '已知代理';

  @override
  String get adminRemoteIpFilter => '遠端IP過濾';

  @override
  String get adminRemoteIpFilterEntries => '遠端IP過濾器';

  @override
  String get adminCertificatePath => '證書路徑';

  @override
  String get whitelist => '白名單';

  @override
  String get blacklist => '黑名單';

  @override
  String get notSet => '未設定';

  @override
  String get adminMetadataSaved => '元資料已儲存';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => '重新整理元數據';

  @override
  String get recursive => '遞迴';

  @override
  String get adminReplaceAllMetadata => '替換所有元數據';

  @override
  String get adminReplaceAllImages => '替換所有圖像';

  @override
  String get adminMetadataRefreshRequested => '請求元資料刷新';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => '搜尋遠端人員';

  @override
  String get adminNoRemoteMatches => '未找到遠端匹配項';

  @override
  String get adminRemoteResults => '遠程結果';

  @override
  String get adminRemoteMetadataApplied => '應用遠端元數據';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => '更新內容類型';

  @override
  String get adminContentType => '內容類型';

  @override
  String get adminContentTypeUpdated => '內容類型已更新';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => '無法載入元資料編輯器';

  @override
  String get adminNoPeopleEntries => '沒有人員條目';

  @override
  String get adminNoExternalIds => '沒有可用的外部 ID';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => '不支援的圖像格式';

  @override
  String get adminImageReadFailed => '無法讀取所選影像';

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
  String get adminAllProviders => '所有提供者';

  @override
  String get adminNoRemoteImages => '未找到遠端影像';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => '新增調音器';

  @override
  String get adminTunerType => '調音器類型';

  @override
  String get adminTunerTypeHint => 'HDHomeRun、M3U、其他';

  @override
  String get adminUrlPath => '網址/路徑';

  @override
  String get adminNameOptional => '姓名（可選）';

  @override
  String get adminTunerAdded => '新增了調音器';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => '新增嚮導提供者';

  @override
  String get adminProviderType => '提供者類型';

  @override
  String get adminProviderTypeHint => 'ScheduleDirect 或 XMLTV';

  @override
  String get adminUsernameOptional => '使用者名稱（可選）';

  @override
  String get adminRefreshInterval => '刷新間隔（小時）';

  @override
  String get adminProviderAdded => '提供者已新增';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => '請求重置調諧器';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => '錄音設定';

  @override
  String get adminPrePadding => '預填（分鐘）';

  @override
  String get adminPostPadding => '後填充（分鐘）';

  @override
  String get adminRecordingPath => '錄音路徑';

  @override
  String get adminSeriesRecordingPath => '系列錄音路徑';

  @override
  String get adminRecordingSettingsSaved => '已儲存錄音設定';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => '設定通道映射';

  @override
  String get adminMappingJson => '映射 JSON';

  @override
  String get adminMappingJsonHint => '範例：映射 JSON 負載';

  @override
  String get adminChannelMappingsUpdated => '頻道映射已更新';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => '無法載入直播電視管理';

  @override
  String get adminTunerDevices => '調諧器設備';

  @override
  String get adminNoTunerHosts => '未配置調諧器主機';

  @override
  String get adminGuideProviders => '導遊提供者';

  @override
  String get adminAddProvider => '新增提供者';

  @override
  String get adminNoListingProviders => '未配置清單提供者';

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
  String get adminTunerDiscovery => '調音器發現';

  @override
  String get adminChannelMappings => '通道映射';

  @override
  String get adminNoDiscoveredTuners => '尚未發現調諧器';

  @override
  String get adminSettingsSaved => '設定已儲存';

  @override
  String get adminBackupsNotAvailable => '備份在此伺服器版本上不可用。';

  @override
  String get adminRestoreWarning1 => '恢復將用備份資料替換所有當前伺服器資料。';

  @override
  String get adminRestoreWarning2 => '目前的伺服器設定、使用者和庫資料將被覆蓋。';

  @override
  String get adminRestoreWarning3 => '恢復後伺服器將重新啟動。';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested => '已請求恢復。伺服器重新啟動可能會中斷此會話。';

  @override
  String get adminBackupsTitle => '備份';

  @override
  String get adminUnknownDate => '日期未知';

  @override
  String get adminUnnamedBackup => '未命名備份';

  @override
  String get adminLiveTvNotAvailable => '直播電視管理在此伺服器版本上不可用。';

  @override
  String get adminLiveTvTitle => '直播電視管理';

  @override
  String get adminApply => '申請';

  @override
  String get adminNotSet => '未設定';

  @override
  String get adminReset => '重置';

  @override
  String get adminLogsTitle => '伺服器日誌';

  @override
  String get adminLogsNewestFirst => '最新第一';

  @override
  String get adminLogsOldestFirst => '最舊的在前';

  @override
  String get adminLogsJustNow => '現在';

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
  String get adminLogViewerNoMatches => '沒有匹配的線';

  @override
  String get adminMetadataEditorTitle => '元資料編輯器';

  @override
  String get adminMetadataRemote => '偏僻的';

  @override
  String get adminMetadataType => '類型';

  @override
  String get adminMetadataDetails => '細節';

  @override
  String get adminMetadataExternalIds => '外部 ID';

  @override
  String get adminMetadataImages => '圖片';

  @override
  String get adminMetadataFieldTitle => '標題';

  @override
  String get adminMetadataFieldSortTitle => '排序標題';

  @override
  String get adminMetadataFieldOriginalTitle => '原標題';

  @override
  String get adminMetadataFieldPremiereDate => '首播日期（年-月-日）';

  @override
  String get adminMetadataFieldEndDate => '結束日期（年-月-日）';

  @override
  String get adminMetadataFieldProductionYear => '生產年份';

  @override
  String get adminMetadataFieldOfficialRating => '官方評級';

  @override
  String get adminMetadataFieldCommunityRating => '社區評級';

  @override
  String get adminMetadataFieldCriticRating => '評論家評級';

  @override
  String get adminMetadataFieldTagline => '標語';

  @override
  String get adminMetadataFieldOverview => '概述';

  @override
  String get adminMetadataGenres => '流派';

  @override
  String get adminMetadataTags => '標籤';

  @override
  String get adminMetadataStudios => '工作室';

  @override
  String get adminMetadataPeople => '人們';

  @override
  String get adminMetadataAddGenre => '添加流派';

  @override
  String get adminMetadataAddTag => '添加標籤';

  @override
  String get adminMetadataAddStudio => '新增工作室';

  @override
  String get adminMetadataAddPerson => '新增人員';

  @override
  String get adminMetadataEditPerson => '編輯人物';

  @override
  String get adminMetadataRole => '角色';

  @override
  String get adminMetadataImagePrimary => '基本的';

  @override
  String get adminMetadataImageBackdrop => '背景';

  @override
  String get adminMetadataImageLogo => '標識';

  @override
  String get adminMetadataImageBanner => '橫幅';

  @override
  String get adminMetadataImageThumb => '大拇指';

  @override
  String get adminMetadataRecursive => '遞迴';

  @override
  String get adminMetadataProvider => '提供者';

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
  String get adminMetadataImageReadFailed => '無法讀取所選影像';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent => '這將從項目中刪除當前圖像。';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => '上傳';

  @override
  String get adminMetadataUpdate => '更新';

  @override
  String get adminMetadataRemoteImage => '遠端影像';

  @override
  String get adminPluginsInstalled => '已安裝';

  @override
  String get adminPluginsCatalog => '目錄';

  @override
  String get adminPluginsActive => '積極的';

  @override
  String get adminPluginsRestart => '重新啟動';

  @override
  String get adminPluginsNoSearchResults => '沒有符合您搜尋條件的插件';

  @override
  String get adminPluginsNoneInstalled => '沒有安裝插件';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => '可用更新';

  @override
  String get adminPluginsPendingRemoval => '重新啟動後等待刪除';

  @override
  String get adminPluginsChangesPending => '更改待重啟';

  @override
  String get adminPluginsEnable => '使能夠';

  @override
  String get adminPluginsDisable => '停用';

  @override
  String get adminPluginsInstallUpdate => '安裝更新';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '沒有符合您搜尋條件的軟體包';

  @override
  String get adminPluginsCatalogEmpty => '沒有可用的套餐';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => '實驗整合';

  @override
  String get adminPluginDetailExperimentalContent =>
      '插件設定整合仍處於實驗階段。某些欄位或佈局可能尚未正確呈現。';

  @override
  String get adminPluginDetailToggle404 => '無法切換插件。伺服器找不到此插件版本。嘗試刷新插件，然後重試。';

  @override
  String get adminPluginDetailToggleDioError => '無法切換插件。請檢查伺服器日誌以了解詳細資訊。';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => '細節';

  @override
  String get adminPluginDetailDeveloper => '開發商';

  @override
  String get adminPluginDetailRepository => '儲存庫';

  @override
  String get adminPluginDetailBundled => '捆綁式';

  @override
  String get adminPluginDetailEnablePlugin => '啟用插件';

  @override
  String get adminPluginDetailRestartRequired => '需要重新啟動伺服器才能使變更生效。';

  @override
  String get adminPluginDetailRemovalPending => '伺服器重啟後該插件將被刪除。';

  @override
  String get adminPluginDetailMalfunctioned => '該插件故障，可能無法正常運作。';

  @override
  String get adminPluginDetailNotSupported => '當前伺服器版本不支援此插件。';

  @override
  String get adminPluginDetailSuperseded => '該插件已被新版本取代。';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => '刪除儲存庫';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => '消除';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => '沒有配置儲存庫';

  @override
  String get adminReposEmptySubtitle => '新增儲存庫以瀏覽可用插件';

  @override
  String get adminReposUnnamed => '（未命名）';

  @override
  String get adminReposEditTitle => '編輯儲存庫';

  @override
  String get adminReposAddTitle => '新增儲存庫';

  @override
  String get adminReposUrl => '儲存庫網址';

  @override
  String get adminReposNameHint => '例如Jellyfin 穩定';

  @override
  String get adminPluginSettingsInvalidUrl => '無效網址';

  @override
  String get adminGeneralSettingsTitle => '常規設定';

  @override
  String get adminGeneralMetadataLanguage => '首選元資料語言';

  @override
  String get adminGeneralMetadataLanguageHint => '例如英語、德語、法語';

  @override
  String get adminGeneralMetadataCountry => '首選元數據國家/地區';

  @override
  String get adminGeneralMetadataCountryHint => '例如美國、德國、法國';

  @override
  String get adminGeneralLibraryScanConcurrency => '庫掃描並行';

  @override
  String get adminGeneralImageEncodingLimit => '並行圖像編碼限制';

  @override
  String get adminUnknownError => '未知錯誤';

  @override
  String get adminBrowse => '瀏覽';

  @override
  String get adminCloseBrowser => '關閉瀏覽器';

  @override
  String get adminNetworkingTitle => '聯網';

  @override
  String get adminNetworkingRestartWarning => '更改網路設定可能需要重新啟動伺服器。';

  @override
  String get adminNetworkingRemoteAccess => '啟用遠端存取';

  @override
  String get adminNetworkingPorts => '港口';

  @override
  String get adminNetworkingHttpPort => 'HTTP連接埠';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS連接埠';

  @override
  String get adminNetworkingEnableHttps => '啟用 HTTPS';

  @override
  String get adminNetworkingLocalNetwork => '本地網路';

  @override
  String get adminNetworkingLocalAddresses => '本地網路位址';

  @override
  String get adminNetworkingAddressHint => '例如192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => '已知代理';

  @override
  String get adminNetworkingProxyHint => '例如10.0.0.1';

  @override
  String get adminNetworkingWhitelist => '白名單';

  @override
  String get adminNetworkingBlacklist => '黑名單';

  @override
  String get adminNetworkingAddEntry => '新增條目';

  @override
  String get adminBrandingTitle => '品牌推廣';

  @override
  String get adminBrandingLoginDisclaimer => '登入免責聲明';

  @override
  String get adminBrandingLoginDisclaimerHint => 'HTML 顯示在登入表單下方';

  @override
  String get adminBrandingCustomCss => '自訂CSS';

  @override
  String get adminBrandingCustomCssHint => '應用於 Web 介面的自訂 CSS';

  @override
  String get adminBrandingEnableSplash => '啟用啟動畫面';

  @override
  String get adminPlaybackHwAccel => '硬體加速';

  @override
  String get adminPlaybackHwAccelLabel => '硬體加速';

  @override
  String get adminPlaybackEnableHwEncoding => '啟用硬體編碼';

  @override
  String get adminPlaybackEnableHwDecoding => '啟用硬體解碼：';

  @override
  String get adminPlaybackEncoding => '編碼';

  @override
  String get adminPlaybackEncodingThreads => '編碼線程';

  @override
  String get adminPlaybackFallbackFont => '啟用後備字體';

  @override
  String get adminPlaybackFallbackFontPath => '後備字體路徑';

  @override
  String get adminPlaybackStreaming => '串流媒體';

  @override
  String get adminResumeVideo => '影片';

  @override
  String get adminResumeAudiobooks => '有聲書';

  @override
  String get adminResumeMinAudiobookPct => '有聲書最低履歷百分比';

  @override
  String get adminResumeMaxAudiobookPct => '最大有聲書恢復百分比';

  @override
  String get adminStreamingBitrateLimit => '遠端客戶端位元速率限制 (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => '留空或 0 表示無限制';

  @override
  String get adminTrickplayHwAccel => '啟用硬體加速';

  @override
  String get adminTrickplayHwEncoding => '啟用硬體編碼';

  @override
  String get adminTrickplayKeyFrameOnly => '啟用僅提取關鍵幀';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => '速度較快但精度較低';

  @override
  String get adminTrickplayNonBlocking => '非阻塞';

  @override
  String get adminTrickplayBlocking => '阻塞';

  @override
  String get adminTrickplayPriorityHigh => '高的';

  @override
  String get adminTrickplayPriorityAboveNormal => '高於正常水平';

  @override
  String get adminTrickplayPriorityNormal => '普通的';

  @override
  String get adminTrickplayPriorityBelowNormal => '低於正常水平';

  @override
  String get adminTrickplayPriorityIdle => '閒置的';

  @override
  String get adminTrickplayImageSettings => '影像設定';

  @override
  String get adminTrickplayInterval => '間隔（毫秒）';

  @override
  String get adminTrickplayIntervalSubtitle => '捕獲幀的頻率';

  @override
  String get adminTrickplayWidthResolutionsHint => '以逗號分隔的像素寬度（例如 320）';

  @override
  String get adminTrickplayQuality => '品質';

  @override
  String get adminTrickplayQScale => '品質規模';

  @override
  String get adminTrickplayQScaleSubtitle => '較低的值=更好的質量，更大的文件';

  @override
  String get adminTrickplayJpegQuality => 'JPEG 質量';

  @override
  String get adminTrickplayProcessing => '加工';

  @override
  String get adminTasksEmpty => '沒有找到計劃任務';

  @override
  String get adminTasksNoFilterMatch => '沒有任務與當前過濾器匹配';

  @override
  String get adminTaskCancelling => '正在取消...';

  @override
  String get adminTaskRunning => '跑步...';

  @override
  String get adminTaskNeverRun => '永遠不要跑';

  @override
  String get adminTaskStop => '停止';

  @override
  String get adminTaskRun => '跑步';

  @override
  String get adminTaskDetailLastExecution => '最後執行';

  @override
  String get adminTaskDetailStarted => '開始';

  @override
  String get adminTaskDetailEnded => '結束';

  @override
  String get adminTaskDetailDuration => '期間';

  @override
  String get adminTaskDetailErrorLabel => '錯誤：';

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
  String get adminTaskTriggerStartup => '應用程式啟動時';

  @override
  String get adminTaskTriggerTypeDaily => '日常的';

  @override
  String get adminTaskTriggerTypeWeekly => '每週';

  @override
  String get adminTaskTriggerTypeInterval => '在一個間隔上';

  @override
  String get adminTaskTriggerIntervalLabel => '間隔';

  @override
  String get adminTaskTriggerEveryHour => '每小時';

  @override
  String get adminTaskTriggerEvery6Hours => '每 6 小時';

  @override
  String get adminTaskTriggerEvery12Hours => '每12小時一次';

  @override
  String get adminTaskTriggerEvery24Hours => '每24小時一次';

  @override
  String get adminTaskTriggerEvery2Days => '每2天一次';

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
  String get adminTaskTriggerTime => '時間';

  @override
  String get adminTaskTriggerNoLimit => '無限制';

  @override
  String get adminActivityJustNow => '現在';

  @override
  String get adminActivityLastHour => '最後一小時';

  @override
  String get adminActivityToday => '今天';

  @override
  String get adminActivityYesterday => '昨天';

  @override
  String get adminActivityOlder => '年長的';

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
  String get adminActivityNow => '現在';

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
  String get adminTrickplayDescription => '配置搜尋預覽縮圖的特技播放影像生成。';

  @override
  String get adminNetworkingPublicHttpsPort => '公共 HTTPS 連接埠';

  @override
  String get adminNetworkingBaseUrl => '基本網址';

  @override
  String get adminNetworkingBaseUrlHint => '例如/果凍';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => '證書路徑';

  @override
  String get adminNetworkingRemoteIpFilter => '遠端IP過濾';

  @override
  String get adminNetworkingRemoteIpFilterLabel => '遠端IP過濾器';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API裝置';

  @override
  String get adminPlaybackAutomatic => '0 = 自動';

  @override
  String get adminPlaybackTranscodeTempPath => '轉碼臨時路徑';

  @override
  String get adminPlaybackSegmentDeletion => '允許段刪除';

  @override
  String get adminPlaybackSegmentKeep => '段保持（秒）';

  @override
  String get adminPlaybackThrottleBuffering => '油門緩衝';

  @override
  String get adminResumeMinPct => '最低履歷百分比';

  @override
  String get adminResumeMinPctSubtitle => '播放內容必須超過此百分比才能保存進度';

  @override
  String get adminResumeMaxPct => '最大履歷百分比';

  @override
  String get adminResumeMaxPctSubtitle => '在此百分比之後，內容被視為已完全播放';

  @override
  String get adminResumeMinDuration => '最短恢復持續時間（秒）';

  @override
  String get adminResumeMinDurationSubtitle => '比這短的項目不可恢復';

  @override
  String get adminTrickplayScanBehavior => '掃描行為';

  @override
  String get adminTrickplayProcessPriority => '行程優先權';

  @override
  String get adminTrickplayTileWidth => '磁磚寬度';

  @override
  String get adminTrickplayTileHeight => '瓷磚高度';

  @override
  String get adminTrickplayProcessThreads => '處理線程';

  @override
  String get adminTrickplayWidthResolutions => '寬度解析度';

  @override
  String get adminMetadataDefault => '預設';

  @override
  String get adminMetadataContentTypeUpdated => '內容類型已更新';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '慢響應閾值（毫秒）';

  @override
  String get adminGeneralCachePath => '快取路徑';

  @override
  String get adminGeneralMetadataPath => '元資料路徑';

  @override
  String get adminGeneralServerName => '伺服器名稱';

  @override
  String get adminSettingsLoadFailed => '無法載入設定';

  @override
  String get adminDiscover => '發現';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => '資料夾';

  @override
  String get libraries => '圖書館';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay 已停用';

  @override
  String get syncPlayDisabledMessage => '在「設定」中啟用 SyncPlay 以使用同步播放。';

  @override
  String get syncPlayServerUnsupportedTitle => '伺服器不受支援';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay 需要 Jellyfin 伺服器。目前的伺服器不支援。';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay 組';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay 組';

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
  String get syncPlayIgnoreWait => '忽略等待';

  @override
  String get syncPlayIgnoreWaitSubtitle => '當該設備緩衝時，請勿阻止該組';

  @override
  String get syncPlayContinueLocallyNoWait => '在本地繼續，無需等待慢速成員';

  @override
  String get syncPlayRepeat => '重複';

  @override
  String get syncPlayRepeatOne => '一';

  @override
  String get syncPlayShuffleModeShuffled => '洗牌';

  @override
  String get syncPlayShuffleModeSorted => '已排序';

  @override
  String get syncPlaySyncCurrentQueue => '同步目前播放隊列';

  @override
  String get syncPlaySyncCurrentQueueSubtitle => '將群組隊列替換為本機正在播放的內容';

  @override
  String get syncPlayLeaveGroup => '離開群組';

  @override
  String get syncPlayGroupQueue => '群組佇列';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => '立即播放';

  @override
  String get syncPlayCreateNewGroup => '建立一個新群組';

  @override
  String get syncPlayGroupName => '團體名稱';

  @override
  String get syncPlayDefaultGroupName => '我的 SyncPlay 群組';

  @override
  String get syncPlayCreateGroup => '建立群組';

  @override
  String get syncPlayAvailableGroups => '可用群組';

  @override
  String get syncPlayNoGroupsAvailable => '沒有可用的群組';

  @override
  String get syncPlayJoinGroupQuestion => '加入 SyncPlay 群組？';

  @override
  String get syncPlayJoinGroupWarning => '加入 SyncPlay 群組可能會取代您目前的播放佇列。繼續？';

  @override
  String get syncPlayJoin => '加入';

  @override
  String get syncPlayStateIdle => '閒置的';

  @override
  String get syncPlayStateWaiting => '等待';

  @override
  String get syncPlayStatePaused => '已暫停';

  @override
  String get syncPlayStatePlaying => '演奏';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay 存取被拒絕';

  @override
  String get syncPlayAccessDeniedMessage =>
      '您無權存取此 SyncPlay 群組中的一項或多項。請群組擁有者驗證庫權限或選擇其他佇列。';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => '語音搜尋不可用。';

  @override
  String get dolbyVisionDirectPlayFailedTitle => 'Dolby Vision 直接播放失敗';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      '無法啟動此 Dolby Vision 流的直接播放。使用伺服器轉碼重試？';

  @override
  String get retryWithTranscode => '重試轉碼';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision 不支持';

  @override
  String get dolbyVisionNotSupportedMessage =>
      '本設備無法直接解碼 Dolby Vision 內容。使用 HDR10 後備或請求伺服器轉碼。';

  @override
  String get rememberMyChoice => '記住我的選擇';

  @override
  String get playHdr10Fallback => '播放 HDR10 後備';

  @override
  String get requestTranscode => '請求轉碼';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      '偵測 IAmParadox27 的「主螢幕部分」外掛程式暴露的行。可以在下面啟用行並重新排序。';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      '尚無 Jellyfin 伺服器報告該外掛程式。';

  @override
  String get kefinTweaksIntegrationDescription =>
      '偵測透過 ranaldsgift 的「KefinTweaks」插件配置的行。自訂部分、最近發布的、再次觀看的、季節性的以及最近添加到庫中的內容均從每個 Jellyfin 伺服器上的 KefinTweaks 配置進行鏡像。';

  @override
  String get kefinTweaksIntegrationNoServers =>
      '尚無 Jellyfin 伺服器報告 KefinTweaks。';

  @override
  String get integrationOpenHomeSections => '開放主頁部分';

  @override
  String get integrationOpenHomeSectionsSubtitle => '啟用、停用和重新排序行';

  @override
  String get integrationInstalledButDisabled => '已安裝但已停用';

  @override
  String get integrationNotInstalled => '未安裝';

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
  String get seeAll => '看全部';

  @override
  String get noItems => '沒有商品';

  @override
  String get switchUser => '切換用戶';

  @override
  String get remoteControl => '遙控';

  @override
  String get mediaBarLoading => '正在加載媒體欄...';

  @override
  String get mediaBarError => '媒體欄載入失敗';

  @override
  String get offlineServerUnavailable => '已連接到互聯網，但目前伺服器無法使用。';

  @override
  String get offlineNoInternet => '您已離線。僅下載的內容可用。';

  @override
  String get offlineFileNotAvailable => '文件不可用';

  @override
  String get offlineSwitchServer => '切換伺服器';

  @override
  String get offlineSavedMedia => '保存的媒體';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => '遠端回放';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => '裝置音量';

  @override
  String get castVolumeUnavailable => '不可用';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => '聲音的';

  @override
  String get subtitlesLabel => '字幕';

  @override
  String get pinConfirmTitle => '確認密碼';

  @override
  String get pinSetTitle => '設定密碼';

  @override
  String get pinEnterTitle => '輸入密碼';

  @override
  String get pinReenterToConfirm => '重新輸入您的 PIN 碼進行確認';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN 碼不正確';

  @override
  String get pinMismatch => 'PIN 碼不匹配';

  @override
  String get pinForgot => '忘記密碼？';

  @override
  String get pinClear => '清除';

  @override
  String get pinBackspace => '退格鍵';

  @override
  String get quickConnectAuthorized => '快速連線請求已獲授權。';

  @override
  String get quickConnectInvalidOrExpired => '快速連線代碼無效或已過期。';

  @override
  String get quickConnectNotSupported => '此伺服器不支援快速連線。';

  @override
  String get quickConnectAuthorizeFailed => '無法授權快速連線代碼。';

  @override
  String get quickConnectDisabled => '此伺服器上禁用了快速連線。';

  @override
  String get quickConnectForbidden => '您的帳戶無法授權此快速連線要求。';

  @override
  String get quickConnectNotFound => '未找到快速連線代碼。嘗試新的程式碼。';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => '輸入代碼';

  @override
  String get quickConnectAuthorize => '授權';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => '遙控';

  @override
  String get remoteFailedToLoadSessions => '無法載入會話';

  @override
  String get remoteNoSessions => '沒有可控的會話';

  @override
  String get remoteStartPlayback => '在另一台裝置上開始播放';

  @override
  String get unknownUser => '未知';

  @override
  String get unknownItem => '未知';

  @override
  String get remoteNothingPlaying => '此會話中沒有播放任何內容';

  @override
  String get castingStarted => '在選定的裝置上開始投射';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => '沒有可用的遠端播放設備。';

  @override
  String get noRemoteDevicesIos =>
      '沒有可用的遠端播放設備。\n\n在 iOS 上，AirPlay 目標在模擬器中可能無法使用。';

  @override
  String get trackActionPlayNext => '播放下一個';

  @override
  String get trackActionAddToQueue => '添加到隊列';

  @override
  String get trackActionAddToPlaylist => '新增到播放列表';

  @override
  String get trackActionCancelDownload => '取消下載';

  @override
  String get trackActionDeleteFromPlaylist => '從播放清單中刪除';

  @override
  String get trackActionMoveUp => '向上移動';

  @override
  String get trackActionMoveDown => '下移';

  @override
  String get trackActionRemoveFromFavorites => '從收藏夾中刪除';

  @override
  String get trackActionAddToFavorites => '加入收藏夾';

  @override
  String get trackActionGoToAlbum => '前往相簿';

  @override
  String get trackActionGoToArtist => '前往藝術家';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => '已刪除下載的文件';

  @override
  String get trackActionDeleteFileFailed => '無法刪除下載的文件';

  @override
  String get shuffleBy => '隨機播放';

  @override
  String get shuffleSelectLibrary => '選擇庫';

  @override
  String get shuffleSelectGenre => '選擇類型';

  @override
  String get shuffleLibrary => '圖書館';

  @override
  String get shuffleGenre => '類型';

  @override
  String get shuffleNoLibraries => '沒有可用的相容庫。';

  @override
  String get shuffleNoGenres => '沒有找到適合此隨機播放模式的流派。';

  @override
  String get posterDisplayTitle => '展示';

  @override
  String get posterImageType => '圖片類型';

  @override
  String get imageTypePoster => '海報';

  @override
  String get imageTypeThumbnail => '縮圖';

  @override
  String get imageTypeBanner => '橫幅';

  @override
  String get playlistAddFailed => '無法新增到播放列表';

  @override
  String get playlistCreateFailed => '建立播放清單失敗';

  @override
  String get playlistNew => '新播放列表';

  @override
  String get playlistCreate => '創造';

  @override
  String get playlistCreateNew => '建立新的播放列表';

  @override
  String get playlistNoneFound => '未找到播放列表';

  @override
  String get addToPlaylist => '新增到播放列表';

  @override
  String get lyricsNotAvailable => '沒有可用的歌詞';

  @override
  String get upNext => '下一個';

  @override
  String get playNext => '播放下一個';

  @override
  String get stillWatchingContent => '播放已暫停。你還在看嗎？';

  @override
  String get stillWatchingStop => '停止';

  @override
  String get stillWatchingContinue => '繼續';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => '電視直播';

  @override
  String get continueWatchingAndNextUp => '繼續觀看並繼續觀看';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => '下一集';

  @override
  String get moreFromThisSeason => '本季更多內容';

  @override
  String get playerTooltipPlaybackSpeed => '播放速度';

  @override
  String get playerTooltipCastControls => '投射控制';

  @override
  String get playerTooltipPlaybackQuality => '位元率';

  @override
  String get playerTooltipEnterFullscreen => '進入全螢幕';

  @override
  String get playerTooltipExitFullscreen => '退出全螢幕';

  @override
  String get playerTooltipFloatOnTop => '浮在上面';

  @override
  String get playerTooltipExitFloatOnTop => '禁用頂部浮動';

  @override
  String get playerTooltipLockLandscape => '鎖風景';

  @override
  String get playerTooltipUnlockOrientation => '允許旋轉';

  @override
  String get playerTooltipPrevious => '以前的';

  @override
  String get playerTooltipSeekBack => '回頭尋找';

  @override
  String get playerTooltipSeekForward => '向前尋求';

  @override
  String get contextMenuMarkWatched => '標記為已觀看';

  @override
  String get contextMenuMarkUnwatched => '標記為未觀看';

  @override
  String get contextMenuAddToFavorites => '加入收藏夾';

  @override
  String get contextMenuRemoveFromFavorites => '從收藏夾中刪除';

  @override
  String get contextMenuGoToSeries => '前往系列';

  @override
  String get settingsAdministrationSubtitle => '存取伺服器管理面板';

  @override
  String get settingsAccountSecurity => '帳戶與安全';

  @override
  String get settingsAccountSecuritySubtitle => '身份驗證、PIN 碼和家長控制';

  @override
  String get settingsPersonalization => '個人化';

  @override
  String get settingsPersonalizationSubtitle => '主題、導航、主行和庫可見性';

  @override
  String get settingsDynamicContent => '動態內容';

  @override
  String get settingsDynamicContentSubtitle => '媒體欄和視覺覆蓋';

  @override
  String get settingsPlaybackSyncplay => '回放 & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle => '音訊/視訊設定、字幕、下載和 SyncPlay 控件';

  @override
  String get settingsIntegrationsSubtitle => '插件同步、Seerr、評級等';

  @override
  String get settingsAboutSubtitle => '應用程式版本、法律資訊和製作人員';

  @override
  String get settingsAuthenticationSection => '驗證';

  @override
  String get settingsSortServersBy => '伺服器排序依據';

  @override
  String get settingsLastUsed => '最後使用';

  @override
  String get settingsAlphabetical => '按字母順序';

  @override
  String get settingsPrivacyAndSafetySection => '隱私與安全';

  @override
  String get settingsBlockedRatings => '屏蔽評級';

  @override
  String get settingsGeneralStyle => '通用風格';

  @override
  String get settingsGeneralStyleSubtitle => '主題口音、背景、觀看指示器和主題音樂';

  @override
  String get settingsHomePage => '首頁';

  @override
  String get settingsHomePageSubtitle => '部分、圖像類型、疊加和媒體預覽';

  @override
  String get settingsLibrariesSubtitle => '庫可見性、資料夾視圖和多伺服器行為';

  @override
  String get settingsTwentyFourHourClock => '24 小時制';

  @override
  String get settingsTwentyFourHourClockSubtitle => '無論何時顯示時鐘，都使用 24 小時時間格式';

  @override
  String get settingsShowShuffleButtonInNavigation => '在導覽列中顯示隨機播放按鈕';

  @override
  String get settingsShowGenresButtonInNavigation => '在導覽列中顯示流派按鈕';

  @override
  String get settingsShowFavoritesButtonInNavigation => '在導覽列中顯示收藏夾按鈕';

  @override
  String get settingsShowLibrariesButtonInNavigation => '在導覽列中顯示庫按鈕';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      '切換每個庫的主頁可見性。重新啟動 Moonfin 以使變更生效。';

  @override
  String get settingsMediaBarAndLocalPreviews => '媒體欄和本地預覽';

  @override
  String get settingsVisualOverlays => '視覺疊加';

  @override
  String get settingsSeasonalSurprise => '季節性驚喜';

  @override
  String get settingsMetadataAndRatings => '元數據和評級';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase 支援伺服器端集成，包括附加評級來源、Seerr 請求和同步首選項。';

  @override
  String get settingsOfflineDownloads => '離線下載';

  @override
  String get settingsHigh => '高的';

  @override
  String get settingsLow => '低的';

  @override
  String get settingsCustomPath => '自訂路徑';

  @override
  String get settingsEnterDownloadFolderPath => '輸入下載資料夾路徑';

  @override
  String get settingsConcurrentDownloads => '並發下載';

  @override
  String get settingsConcurrentDownloadsDescription => '一次下載的最大項目數。';

  @override
  String get settingsAppInfo => '應用程式訊息';

  @override
  String get settingsReportAnIssue => '報告問題';

  @override
  String get settingsReportAnIssueSubtitle => '開啟 GitHub 上的問題追蹤器';

  @override
  String get settingsJoinDiscord => '加入 Discord';

  @override
  String get settingsJoinDiscordSubtitle => '與社群聊天';

  @override
  String get settingsJoinTheDiscord => '加入 Discord';

  @override
  String get settingsSupportMoonfin => '支援Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => '合法的';

  @override
  String get settingsLicenses => '許可證';

  @override
  String get settingsOpenSourceLicenseNotices => '開源授權聲明';

  @override
  String get settingsPrivacyPolicy => '隱私權政策';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin 如何處理您的數據';

  @override
  String get settingsCheckForUpdates => '檢查更新';

  @override
  String get settingsCheckForUpdatesSubtitle => '檢查最新的 Moonfin 版本';

  @override
  String get settingsPoweredByFlutter => '由顫動提供支持';

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
  String get settingsBoth => '兩個都';

  @override
  String get settingsShuffleContentTypeFilter => '隨機播放內容類型過濾器';

  @override
  String get settingsVideoPlaybackPreferences => '影片播放首選項';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle => '核心視訊引擎和串流品質設置';

  @override
  String get settingsAudioPreferences => '音訊首選項';

  @override
  String get settingsAudioPreferencesSubtitle => '音軌、處理和直通選項';

  @override
  String get settingsAutomationAndQueue => '自動化和隊列';

  @override
  String get settingsAutomationAndQueueSubtitle => '自動播放和排序';

  @override
  String get settingsOfflineDownloadsSubtitle => '下載品質、儲存限制和佇列大小';

  @override
  String get settingsSyncplaySubtitle => '群組會話的同步邏輯';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      '專業的播放器功能。請謹慎使用，因為某些選項可能會導致播放問題';

  @override
  String get settingsSkipIntrosAndOutros => '跳過片頭和片尾？';

  @override
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

  @override
  String get settingsPromptUser => '提示用戶';

  @override
  String get settingsSkip => '跳過';

  @override
  String get settingsDoNothing => '什麼都不做';

  @override
  String get settingsMaxBitrateDescription => '限制串流媒體比特率。高於此閾值的內容將進行轉碼以適應。';

  @override
  String get settingsMaxResolutionDescription =>
      '限製播放器請求的最大解析度。更高解析度的內容將會被轉碼下來。';

  @override
  String get settingsPlayerZoomDescription => '如何縮放影片以適合螢幕。';

  @override
  String get settingsPlaybackEngineAndroidTv => '播放引擎 (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      '選擇 Android TV 裝置上的預設播放引擎。變更適用於下一個播放會話。';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3（建議）';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv（舊版）';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision 後備';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      '沒有 Dolby Vision 解碼的裝置上 Dolby Vision 標題的行為。';

  @override
  String get settingsAskEachTime => '每次都詢問';

  @override
  String get settingsPreferHdr10Fallback => '偏好 HDR10 後備';

  @override
  String get settingsPreferServerTranscode => '首選伺服器轉碼';

  @override
  String get settingsDolbyVisionProfile7DirectPlay => 'Dolby Vision 設定檔 7 直接播放';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      '控制 Dolby Vision 設定檔 7 增強層流是否應直接播放。';

  @override
  String get settingsAutoAftkrtEnabled => '自動（AFTKRT 已啟用）';

  @override
  String get settingsEnabledOnThisDevice => '在此裝置上啟用';

  @override
  String get settingsDisabledPreferTranscode => '已停用（首選轉碼）';

  @override
  String get settingsResumeRewindDescription => '恢復播放時（從「繼續觀看」或媒體項目頁面），應倒回多少秒？';

  @override
  String get settingsUnpauseRewindDescription => '按下暫停按鈕後恢復播放時，該倒回幾秒？';

  @override
  String get settingsSkipBackLengthDescription => '按下快退按鈕後跳回多少秒。';

  @override
  String get settingsOneSecond => '1秒';

  @override
  String get settingsThreeSeconds => '3秒';

  @override
  String get settingsFortyFiveSeconds => '45秒';

  @override
  String get settingsSixtySeconds => '60秒';

  @override
  String get settingsSkipForwardLengthDescription => '按下快轉按鈕後快轉多少秒。';

  @override
  String get settingsBitstreamAc3ToExternalDecoder => '位元流 AC3 到外部解碼器';

  @override
  String get settingsCinemaMode => '影院模式';

  @override
  String get settingsCinemaModeSubtitle => '在主要功能之前播放預告片/預卷';

  @override
  String get settingsNextUpDisplayDescription =>
      '擴展顯示包含劇集插圖和描述的完整卡片。最小顯示緊湊的倒數疊加。禁用會完全隱藏提示。';

  @override
  String get settingsShort => '短的';

  @override
  String get settingsLong => '長的';

  @override
  String get settingsVeryLong => '很長';

  @override
  String get settingsVideoStartDelay => '視訊開始延遲';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => '直播電視直播';

  @override
  String get settingsLiveTvDirectSubtitle => '啟用直播電視直接播放';

  @override
  String get settingsOpenGroups => '公開組';

  @override
  String get settingsOpenGroupsSubtitle => '建立、加入或管理 SyncPlay 群組';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay 已啟用';

  @override
  String get settingsSyncplayEnabledSubtitle => '啟用群組觀看功能';

  @override
  String get settingsSyncplayButton => 'SyncPlay 按鈕';

  @override
  String get settingsSyncplayButtonSubtitle => '在導覽列上顯示 SyncPlay 按鈕';

  @override
  String get settingsSyncplayAdvancedCorrection => '進階修正';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle => '啟用細粒度同步邏輯';

  @override
  String get settingsSyncplaySyncCorrection => '同步校正';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle => '自動調整播放以保持同步';

  @override
  String get settingsSyncplaySpeedToSync => '同步速度';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle => '使用播放速度調整來同步';

  @override
  String get settingsSyncplaySkipToSync => '跳至同步';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => '使用搜尋來同步';

  @override
  String get settingsSyncplayMinimumSpeedDelay => '最小速度延遲';

  @override
  String get settingsSyncplayMaximumSpeedDelay => '最大速度延遲';

  @override
  String get settingsSyncplaySpeedDuration => '速度持續時間';

  @override
  String get settingsSyncplayMinimumSkipDelay => '最小跳躍延遲';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay 額外偏移';

  @override
  String get onNow => '現在播出';

  @override
  String get collections => '收藏';

  @override
  String get lastPlayed => '上次玩過';

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

/// The translations for Yue Chinese Cantonese, as used in China (`yue_CN`).
class AppLocalizationsYueCn extends AppLocalizationsYue {
  AppLocalizationsYueCn() : super('yue_CN');

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => '登入';

  @override
  String connectingToServer(String serverName) {
    return '连接到$serverName';
  }

  @override
  String get quickConnect => '快速连接';

  @override
  String get password => '密码';

  @override
  String get username => '用户名';

  @override
  String get email => '电子邮件';

  @override
  String get quickConnectInstruction => '在服务器的 Web 仪表板上输入以下代码：';

  @override
  String get waitingForAuthorization => '等待授权...';

  @override
  String get back => '后退';

  @override
  String get serverUnavailable => '服务器不可用';

  @override
  String get loginFailed => '登录失败';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect 不可用：$detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect 不可用 ($status)：$detail';
  }

  @override
  String get whosWatching => '谁在看？';

  @override
  String get addUser => '添加用户';

  @override
  String get selectServer => '选择服务器';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin 版本$version';
  }

  @override
  String get savedServers => '已保存的服务器';

  @override
  String get discoveredServers => '发现的服务器';

  @override
  String get noneFound => '没有找到';

  @override
  String get unableToConnectToServer => '无法连接到服务器';

  @override
  String get addServer => '添加服务器';

  @override
  String get embyConnect => 'Emby 连接';

  @override
  String get removeServer => '删除服务器';

  @override
  String removeServerConfirmation(String serverName) {
    return '从您的服务器中删除“$serverName”？';
  }

  @override
  String get cancel => '取消';

  @override
  String get remove => '消除';

  @override
  String get connectToServer => '连接到服务器';

  @override
  String get serverAddress => '服务器地址';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => '连接';

  @override
  String get secureStorageUnavailable => '安全存储不可用';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin 无法访问您的系统密钥环。登录可以继续，但在密钥环解锁之前，安全令牌存储可能不可用。';

  @override
  String get ok => '好的';

  @override
  String get settingsAppearanceTheme => '应用主题';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '在 Moonfin 和 Neon Pulse 之间切换，无需重新启动应用程序';

  @override
  String get keyboardPreferSystemIme => '更喜欢系统键盘';

  @override
  String get keyboardPreferSystemImeDescription => '默认情况下使用您的设备输入法进行文本输入';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '目前的 Moonfin 外观你们都喜欢';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle => 'Synthwave 样式具有洋红色发光、青色文本和更强的镀铬对比度';

  @override
  String get embyConnectSignInSubtitle => '使用您的 Emby Connect 帐户登录';

  @override
  String get emailOrUsername => '电子邮件或用户名';

  @override
  String get selectAServer => '选择服务器';

  @override
  String get tryAgain => '再试一次';

  @override
  String get noLinkedServers => '没有服务器链接到该 Emby Connect 帐户';

  @override
  String get invalidEmbyConnectCredentials => 'Emby Connect 凭据无效';

  @override
  String get invalidEmbyConnectLogin => 'Emby Connect 用户名或密码无效';

  @override
  String get embyConnectExchangeNotSupported => '服务器不支持 Emby Connect 交换';

  @override
  String get embyConnectNetworkError => '联系 Emby Connect 或所选服务器时出现网络错误';

  @override
  String get loadingLinkedServers => '正在加载链接服务器...';

  @override
  String get connectingToServerEllipsis => '正在连接到服务器...';

  @override
  String get noReachableAddress => '未提供可到达的地址';

  @override
  String get invalidServerExchangeResponse => '来自服务器交换端点的无效响应';

  @override
  String unableToConnectTo(String target) {
    return '无法连接到$target';
  }

  @override
  String get exitApp => '退出Moonfin？';

  @override
  String get exitAppConfirmation => '您确定要退出吗？';

  @override
  String get exit => '出口';

  @override
  String get noHomeRowsLoaded => '无法加载主行';

  @override
  String get noHomeRowsHint => '尝试刷新或减少活跃的主页部分。';

  @override
  String get retryHomeRows => '重试主行';

  @override
  String get guide => '指导';

  @override
  String get recordings => '录音';

  @override
  String get schedule => '日程';

  @override
  String get series => '系列';

  @override
  String get noItemsFound => '没有找到物品';

  @override
  String get home => '家';

  @override
  String get browseAll => '浏览全部';

  @override
  String get genres => '流派';

  @override
  String get collectionPlaceholder => '收藏品会出现在这里';

  @override
  String get browseByLetter => '按字母浏览';

  @override
  String get alphabeticalBrowsePlaceholder => '按字母顺序浏览将出现在这里';

  @override
  String get suggestions => '建议';

  @override
  String get suggestionsPlaceholder => '建议的项目将出现在此处';

  @override
  String get failedToLoadLibraries => '加载库失败';

  @override
  String get noLibrariesFound => '没有找到库';

  @override
  String get library => '图书馆';

  @override
  String get displaySettings => '显示设置';

  @override
  String get allGenres => '所有流派';

  @override
  String get noGenresFound => '没有找到流派';

  @override
  String failedToLoadFolderError(String error) {
    return '无法加载文件夹：$error';
  }

  @override
  String get thisFolderIsEmpty => '该文件夹是空的';

  @override
  String itemCountLabel(int count) {
    return '$count 项目';
  }

  @override
  String get failedToLoadFavorites => '无法加载收藏夹';

  @override
  String get retry => '重试';

  @override
  String get noFavoritesYet => '还没有收藏夹';

  @override
  String get favorites => '收藏夹';

  @override
  String totalCountItems(int count) {
    return '$count 物品';
  }

  @override
  String get continuing => '继续';

  @override
  String get ended => '结束';

  @override
  String get sortAndFilter => '排序和过滤';

  @override
  String get type => '类型';

  @override
  String get sortBy => '排序方式';

  @override
  String get display => '展示';

  @override
  String get imageType => '图片类型';

  @override
  String get posterSize => '海报尺寸';

  @override
  String get small => '小的';

  @override
  String get medium => '中等的';

  @override
  String get large => '大的';

  @override
  String get extraLarge => '特大号';

  @override
  String libraryGenresTitle(String name) {
    return '$name — 流派';
  }

  @override
  String get views => '意见';

  @override
  String get albums => '专辑';

  @override
  String get albumArtists => '专辑艺人';

  @override
  String get artists => '艺术家';

  @override
  String get bookmarks => '书签';

  @override
  String get noSavedBookmarks => '尚未保存该标题的书签。';

  @override
  String get openBook => '打开书本';

  @override
  String get chapter => '章';

  @override
  String get page => '页';

  @override
  String get bookmark => '书签';

  @override
  String get justNow => '现在';

  @override
  String minutesAgo(int count) {
    return '$count分钟前';
  }

  @override
  String hoursAgo(int count) {
    return '$count小时前';
  }

  @override
  String daysAgo(int count) {
    return '${count}d 前';
  }

  @override
  String get discoverySubjects => '发现主题';

  @override
  String get pickDiscoverySubjects => '选择要在“发现”中显示的主题源。';

  @override
  String get apply => '申请';

  @override
  String get openLink => '打开链接';

  @override
  String get scanWithYourPhone => '用手机扫描';

  @override
  String get audiobookGenres => '有声读物流派';

  @override
  String get pickAudiobookGenres => '选择要在有声读物探索中显示的流派。';

  @override
  String get discoverAudiobooks => '发现有声读物';

  @override
  String get librivoxDescription => '来自 LibriVox 的热门公共领域标题。';

  @override
  String titlesCount(int count) {
    return '$count 标题';
  }

  @override
  String get scrollLeft => '向左滚动';

  @override
  String get scrollRight => '向右滚动';

  @override
  String get couldNotLoadGenre => '目前无法加载此类型。';

  @override
  String get continueReading => '继续阅读';

  @override
  String get savedHighlights => '已保存的精彩集锦';

  @override
  String get continueListening => '继续收听';

  @override
  String get listen => '听';

  @override
  String get resume => '恢复';

  @override
  String get failedToLoadLibrary => '加载库失败';

  @override
  String get popularNow => '现在流行';

  @override
  String get savedForLater => '保存以供稍后使用';

  @override
  String get topListens => '热门收听';

  @override
  String get unreadDiscoveries => '未读的发现';

  @override
  String get pickUpAgain => '再次拾起';

  @override
  String get bookHighlightsDescription => '您的书籍包含亮点、收藏夹或阅读进度。';

  @override
  String get handPickedFromLibrary => '从您的图书馆中精心挑选的。';

  @override
  String get handPickedFromListeningQueue => '从您的收听队列中精心挑选。';

  @override
  String get booksWithHighlights => '包含亮点、最爱或阅读进度的书籍。';

  @override
  String get jumpBackNarration => '跳回旁白，无需寻找自己的位置。';

  @override
  String get unreadBooksReady => '未读的书准备好迎接下一个安静的时刻。';

  @override
  String get quickAccessFavorites => '快速访问您经常阅读的书籍。';

  @override
  String get searchAudiobooks => '搜索有声读物';

  @override
  String get searchYourLibrary => '搜索您的图书馆';

  @override
  String get pickUpStory => '从上次停下的地方继续讲故事';

  @override
  String get savedPlacesChapters => '您保存的地点和未完成的章节';

  @override
  String authorsCount(int count) {
    return '$count 作者';
  }

  @override
  String genresCount(int count) {
    return '$count 流派';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% 已完成';
  }

  @override
  String get readyWhenYouAre => '当你准备好时';

  @override
  String get details => '细节';

  @override
  String get listeningRoom => '听音室';

  @override
  String get bookmarksAndProgress => '书签和进度';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count 标题安排为先读浏览。';
  }

  @override
  String get titles => '标题';

  @override
  String get allTitles => '所有标题';

  @override
  String get authors => '作者';

  @override
  String get browseByAuthor => '按作者浏览';

  @override
  String get browseByGenre => '按类型浏览';

  @override
  String get discover => '发现';

  @override
  String get trendingTitlesOpenLibrary => 'Open Library 中按主题划分的热门标题。';

  @override
  String get noBookmarkedItems => '还没有添加书签的项目';

  @override
  String get nothingMatchesSection => '还没有与此部分匹配的内容。尝试另一个选项卡或在库同步完成后返回。';

  @override
  String get audiobooks => '有声读物';

  @override
  String noLabelFound(String label) {
    return '未找到$label';
  }

  @override
  String get folder => '文件夹';

  @override
  String get filters => '过滤器';

  @override
  String get readingStatus => '阅读状态';

  @override
  String get playedStatus => '播放状态';

  @override
  String get readStatus => '读';

  @override
  String get watched => '看过';

  @override
  String get unread => '未读';

  @override
  String get unwatched => '无人看管';

  @override
  String get seriesStatus => '系列状态';

  @override
  String get allLibraries => '所有图书馆';

  @override
  String get books => '图书';

  @override
  String get author => '作者';

  @override
  String get unknownAuthor => '作者未知';

  @override
  String get uncategorized => '未分类';

  @override
  String get overview => '概述';

  @override
  String get noLibrivoxDescription => 'LibriVox 尚未为此标题提供任何描述。';

  @override
  String get readers => '读者';

  @override
  String get openLinks => '打开链接';

  @override
  String get librivoxPage => 'LibriVox 页';

  @override
  String get internetArchive => '互联网档案馆';

  @override
  String get rssFeed => 'RSS 源';

  @override
  String get downloadZip => '下载邮编';

  @override
  String sectionCountLabel(int count) {
    return '$count 部分';
  }

  @override
  String firstPublished(int year) {
    return '首次发布$year';
  }

  @override
  String get noOpenLibraryOverview => 'Open Library 尚未提供此标题的概述。';

  @override
  String get subjects => '科目';

  @override
  String get all => '全部';

  @override
  String booksCount(int count) {
    return '$count 书籍';
  }

  @override
  String get couldNotLoadSubject => '目前无法加载该主题。';

  @override
  String get audiobookDetails => '有声读物详情';

  @override
  String authorsCountTitle(int count) {
    return '$count 作者';
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
  String get trackList => '曲目列表';

  @override
  String get itemListPlaceholder => '项目列表将出现在这里';

  @override
  String get favoriteTracksPlaceholder => '最喜欢的曲目将出现在这里';

  @override
  String get failedToLoad => '加载失败';

  @override
  String get delete => '删除';

  @override
  String get save => '节省';

  @override
  String get moreLikeThis => '更多类似的';

  @override
  String get castAndCrew => '演职人员';

  @override
  String get collection => '收藏';

  @override
  String get episodes => '剧集数';

  @override
  String get nextUp => '下一步';

  @override
  String get seasons => '季节';

  @override
  String get chapters => '章节';

  @override
  String get features => '特征';

  @override
  String get movies => '电影';

  @override
  String get musicVideos => '音乐视频';

  @override
  String get other => '其他';

  @override
  String get discography => '唱片目录';

  @override
  String get similarArtists => '类似的艺术家';

  @override
  String get tableOfContents => '目录';

  @override
  String get tracklist => '曲目列表';

  @override
  String discNumber(int number) {
    return '光盘$number';
  }

  @override
  String get biography => '传';

  @override
  String get authorDetails => '作者详细信息';

  @override
  String get noOverviewAvailable => '尚无此标题的概述。';

  @override
  String get noBiographyAvailable => '没有该作者的传记。';

  @override
  String get noBooksFound => '没有找到该作者的书籍。';

  @override
  String get unableToLoadAuthorDetails => '目前无法加载作者详细信息。';

  @override
  String published(int year) {
    return '已发布$year';
  }

  @override
  String get publicationDateUnknown => '出版日期未知';

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
    return '结束于$time';
  }

  @override
  String get view => '看法';

  @override
  String get resumeReading => '继续阅读';

  @override
  String get read => '读';

  @override
  String resumeFrom(String position) {
    return '来自$position的简历';
  }

  @override
  String get play => '玩';

  @override
  String get startOver => '重新开始';

  @override
  String get restart => '重新启动';

  @override
  String get readOffline => '离线阅读';

  @override
  String get playOffline => '离线玩';

  @override
  String get audio => '声音的';

  @override
  String get subtitles => '字幕';

  @override
  String get version => '版本';

  @override
  String get cast => '投掷';

  @override
  String get trailer => '拖车';

  @override
  String get finished => '完成的';

  @override
  String get favorited => '已收藏';

  @override
  String get favorite => '最喜欢的';

  @override
  String get playlist => '播放列表';

  @override
  String get downloaded => '已下载';

  @override
  String get downloadAll => '下载全部';

  @override
  String get download => '下载';

  @override
  String get deleteDownloaded => '删除已下载';

  @override
  String get goToSeries => '前往系列';

  @override
  String get editMetadata => '编辑元数据';

  @override
  String get less => '较少的';

  @override
  String get more => '更多的';

  @override
  String get deleteItem => '删除项目';

  @override
  String get deletePlaylist => '删除播放列表';

  @override
  String get deletePlaylistMessage => '从服务器删除此播放列表？';

  @override
  String get deleteItemMessage => '从服务器删除此项？';

  @override
  String get failedToDeletePlaylist => '删除播放列表失败';

  @override
  String get failedToDeleteItem => '删除项目失败';

  @override
  String get renamePlaylist => '重命名播放列表';

  @override
  String get playlistName => '播放列表名称';

  @override
  String get deleteDownloadedAlbum => '删除下载的相册';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '删除“$title”的下载曲目？';
  }

  @override
  String get downloadedTracksDeleted => '下载的曲目已删除';

  @override
  String get downloadedTracksDeleteFailed => '某些下载的曲目无法删除';

  @override
  String get noTracksLoaded => '未加载曲目';

  @override
  String noItemsLoaded(String itemLabel) {
    return '未加载$itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '正在下载$title（$count 项）...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '您确定要从服务器删除“$name”吗？此操作无法撤消。';
  }

  @override
  String get itemDeleted => '项目已删除';

  @override
  String get noPlayableTrailerFound => '找不到可播放的预告片。';

  @override
  String unsupportedBookFormat(String extension) {
    return '不支持的图书格式：.$extension';
  }

  @override
  String get audioTrack => '音轨';

  @override
  String get subtitleTrack => '字幕轨道';

  @override
  String get none => '没有任何';

  @override
  String get downloadSubtitlesLabel => '下载字幕...';

  @override
  String get searchOpenSubtitlesPlugin => '使用 OpenSubtitles 插件进行搜索';

  @override
  String get downloadSubtitles => '下载字幕';

  @override
  String get selectedSubtitleInvalid => '所选的字幕无效。';

  @override
  String subtitleDownloadedSelected(String name) {
    return '下载并选择字幕：$name';
  }

  @override
  String get subtitleDownloadedPending =>
      '字幕已下载。当 Jellyfin 刷新项目时，可能需要一些时间才会出现。';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '找不到 $language 的远程字幕。';
  }

  @override
  String get selectVersion => '选择版本';

  @override
  String versionNumber(int number) {
    return '版本$number';
  }

  @override
  String get downloadAllQuality => '下载全部 — 质量';

  @override
  String get downloadQuality => '下载质量';

  @override
  String get originalFileNoReencoding => '原始文件，无需重新编码';

  @override
  String get originalFilesNoReencoding => '原始文件，无需重新编码';

  @override
  String get noEpisodesLoaded => '没有加载剧集';

  @override
  String downloadingItem(String name, String quality) {
    return '正在下载$name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => '删除下载的文件';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '删除 $typeLabel 的本地文件？\n\n这将释放存储空间。您可以稍后重新下载。';
  }

  @override
  String get downloadedFilesDeleted => '下载的文件已删除';

  @override
  String get failedToDeleteFiles => '删除文件失败';

  @override
  String get deleteFiles => '删除文件';

  @override
  String get director => '导演';

  @override
  String get writers => '作家';

  @override
  String get studio => '工作室';

  @override
  String studioMoreCount(int count) {
    return '+$count 更多';
  }

  @override
  String totalEpisodes(int count) {
    return '$count 剧集';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '剧集$number';
  }

  @override
  String chapterNumber(int number) {
    return '第$number章';
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
    return '出生$date';
  }

  @override
  String died(String date) {
    return '死了$date';
  }

  @override
  String age(int age) {
    return '年龄$age';
  }

  @override
  String get showLess => '显示更少';

  @override
  String get readMore => '阅读更多';

  @override
  String get shuffle => '随机播放';

  @override
  String downloadsCount(int count) {
    return '$count 下载';
  }

  @override
  String get perfectMatch => '完美搭配';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => '单核细胞增多症';

  @override
  String get stereo => '立体声';

  @override
  String remoteSubtitlePermissionError(String action) {
    return '远程字幕$action 需要该用户的Jellyfin 字幕管理权限。';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return '在远程字幕 $action 的服务器上找不到此项。';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '远程字幕$action失败：$detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '远程字幕 $action 失败 (HTTP $status)。';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '$action远程字幕失败。';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '“$name”的所有下载剧集';
  }

  @override
  String get deleteSeasonFiles => '本季所有下载的剧集';

  @override
  String get stillWatching => '还在观看吗？';

  @override
  String get unableToLoadTrailerStream => '无法加载预告片流。';

  @override
  String get trailerTimedOut => '拖车加载时超时。';

  @override
  String get playbackFailedForTrailer => '该预告片播放失败。';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline => '离线播放时无法进行投射。';

  @override
  String castActionFailed(String label, String error) {
    return '$label 操作失败：$error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return '设置施法量失败：$error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label 控件';
  }

  @override
  String get deviceVolume => '设备音量';

  @override
  String get unavailable => '不可用';

  @override
  String get pause => '暂停';

  @override
  String get syncPosition => '同步位置';

  @override
  String stopCast(String label) {
    return '停止$label';
  }

  @override
  String get queueIsEmpty => '队列为空';

  @override
  String trackNumber(int number) {
    return '追踪$number';
  }

  @override
  String get remotePlayback => '远程回放';

  @override
  String get castingToGoogleCast => '转换为 Google Cast';

  @override
  String get castingViaAirPlay => '通过 AirPlay 进行投射';

  @override
  String get castingViaDlna => '通过 DLNA 进行投射';

  @override
  String secondsCount(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get longPressToUnlock => '长按解锁';

  @override
  String get off => '离开';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => '汽车';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => '比特率覆盖';

  @override
  String get audioDelay => '音频延迟';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => '字幕延迟';

  @override
  String get reset => '重置';

  @override
  String get unknown => '未知';

  @override
  String get playbackInformation => '播放信息';

  @override
  String get playback => '回放';

  @override
  String get playMethod => '玩法';

  @override
  String get directPlay => '直接播放';

  @override
  String get directStream => '直接串流';

  @override
  String get transcoding => '转码';

  @override
  String get transcodeReasons => '转码原因';

  @override
  String get player => '玩家';

  @override
  String get container => '容器';

  @override
  String get bitrate => '比特率';

  @override
  String get video => '视频';

  @override
  String get resolution => '解决';

  @override
  String get hdr => '高动态范围';

  @override
  String get codec => '编解码器';

  @override
  String get videoBitrate => '视频比特率';

  @override
  String get track => '追踪';

  @override
  String get channels => '渠道';

  @override
  String get audioBitrate => '音频比特率';

  @override
  String get sampleRate => '采样率';

  @override
  String get format => '格式';

  @override
  String get external => '外部的';

  @override
  String get embedded => '嵌入式';

  @override
  String castSessionError(String protocol) {
    return '$protocol 会话错误';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return '无法加载图书详细信息：$error';
  }

  @override
  String get epubUnavailableOnPlatform => '应用内 EPUB 渲染在此平台上尚不可用。';

  @override
  String formatCannotRenderInApp(String extension) {
    return '此格式 (.$extension) 尚无法在应用程序内呈现。';
  }

  @override
  String get embeddedRenderingUnavailable => '嵌入式文档渲染在此平台上不可用。';

  @override
  String get couldNotOpenExternalViewer => '无法打开外部查看器。';

  @override
  String failedToOpenInAppReader(String error) {
    return '无法打开应用内阅读器：$error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '书签已保存在$label。';
  }

  @override
  String bookmarkAdded(String label) {
    return '已添加书签：$label';
  }

  @override
  String get noBookmarksYet => '还没有书签。\n阅读时点击书签图标即可保存您的位置。';

  @override
  String get noTableOfContentsAvailable => '没有可用的目录';

  @override
  String pageLabel(int number) {
    return '页面$number';
  }

  @override
  String get position => '位置';

  @override
  String get bookReader => '图书阅读器';

  @override
  String formatExtension(String extension) {
    return '格式：.$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% 已读';
  }

  @override
  String get updating => '更新中...';

  @override
  String get markUnread => '标记为未读';

  @override
  String get markAsRead => '标记为已读';

  @override
  String get reloadReader => '重新加载阅读器';

  @override
  String get noPagesFound => '未找到页面。';

  @override
  String get failedToDecodePageImage => '无法解码页面图像。';

  @override
  String resetZoom(String zoom) {
    return '重置缩放 (${zoom}x)';
  }

  @override
  String get singlePage => '单页';

  @override
  String get twoPageSpread => '两页跨页';

  @override
  String get addBookmark => '添加书签';

  @override
  String get bookmarksEllipsis => '书签...';

  @override
  String get markedAsRead => '标记为已读';

  @override
  String get markedAsUnread => '标记为未读';

  @override
  String failedToUpdateReadState(String error) {
    return '无法更新读取状态：$error';
  }

  @override
  String get themeSystem => '主题：系统';

  @override
  String get themeLight => '主题：光';

  @override
  String get themeDark => '主题：黑暗';

  @override
  String get themeSepia => '主题： 棕褐色';

  @override
  String get invertColorsFixedLayout => '反转颜色（固定布局）';

  @override
  String get invertColorsPdf => '反转颜色 (PDF)';

  @override
  String get preparingInAppReader => '正在准备应用内阅读器...';

  @override
  String get pdfDataNotAvailable => 'PDF 数据不可用。';

  @override
  String get readerFallbackModeActive => '读卡器回退模式已激活';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return '此平台无法托管 $extension 文件的嵌入式文档引擎。';
  }

  @override
  String get reloadReaderPlatformHint =>
      '切换到支持的平台目标（Android、iOS、macOS）后使用 Reload Reader。';

  @override
  String get openExternally => '对外开放';

  @override
  String get noEpubChaptersFound => '未找到 EPUB 章节。';

  @override
  String get readerNotReady => '读者还没准备好。';

  @override
  String get seriesRecordings => '系列录音';

  @override
  String get now => '现在';

  @override
  String get sports => '运动的';

  @override
  String get news => '消息';

  @override
  String get kids => '孩子们';

  @override
  String get premiere => '首映';

  @override
  String get guideTimeline => '指南时间表';

  @override
  String failedToLoadGuide(String error) {
    return '无法加载指南：$error';
  }

  @override
  String get noChannelsFound => '没有找到频道';

  @override
  String get liveBadge => '居住';

  @override
  String get movie => '电影';

  @override
  String get removedFromFavoriteChannels => '已从喜爱的频道中删除';

  @override
  String get addedToFavoriteChannels => '添加到喜爱的频道';

  @override
  String get failedToUpdateFavoriteChannel => '更新收藏频道失败';

  @override
  String get unfavoriteChannel => '不喜欢的频道';

  @override
  String get favoriteChannel => '最喜欢的频道';

  @override
  String get record => '记录';

  @override
  String get cancelRecordingAction => '取消录音';

  @override
  String get programSetToRecord => '节目设置为录制';

  @override
  String get recordingCancelled => '录音已取消';

  @override
  String get unableToCreateRecording => 'Unable to create recording';

  @override
  String get watch => '手表';

  @override
  String get close => '关闭';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => '加载录音失败';

  @override
  String get scheduledInNext24Hours => '预计未来 24 小时内';

  @override
  String get recentRecordings => '最近的录音';

  @override
  String get tvSeries => '电视剧';

  @override
  String get failedToLoadSchedule => '加载时间表失败';

  @override
  String get noScheduledRecordings => '没有预定的录音';

  @override
  String get cancelRecording => '取消录音？';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => '不';

  @override
  String get yesCancel => '是，取消';

  @override
  String get failedToCancelRecording => '取消录音失败';

  @override
  String get failedToLoadSeriesRecordings => '无法加载系列录音';

  @override
  String get noSeriesRecordings => '没有系列录音';

  @override
  String get cancelSeriesRecording => '取消系列录音';

  @override
  String get cancelSeriesRecordingQuestion => '取消系列录制？';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => '取消连续录制失败';

  @override
  String get searchThisLibrary => '搜索这个图书馆...';

  @override
  String get searchEllipsis => '搜索...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => '塞尔';

  @override
  String get seerrAccountType => '西尔账户类型';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => '当地的';

  @override
  String get savedMedia => '保存的媒体';

  @override
  String get tvShows => '电视节目';

  @override
  String get music => '音乐';

  @override
  String get musicAlbums => '音乐专辑';

  @override
  String get noMediaInFilter => '此过滤器中没有介质';

  @override
  String get noDownloadedMediaYet => '还没有下载的媒体';

  @override
  String get browseLibrary => '浏览图书馆';

  @override
  String get deleteDownload => '删除下载';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => '专辑';

  @override
  String get playAlbum => '播放专辑';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => '季节';

  @override
  String get errorLoadingEpisodes => '加载剧集时出错';

  @override
  String get noDownloadedEpisodes => '没有下载的剧集';

  @override
  String get deleteEpisode => '删除剧集';

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
  String get seriesNotFound => '未找到系列';

  @override
  String get errorLoadingSeries => '加载系列时出错';

  @override
  String get downloadedEpisodes => '下载剧集';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => '特价商品';

  @override
  String get deleteSeason => '删除季节';

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
  String get storageManagement => '存储管理';

  @override
  String get storageBreakdown => '存储细分';

  @override
  String get downloadedItems => '下载的项目';

  @override
  String get storageLimit => '存储限制';

  @override
  String get noLimit => '无限制';

  @override
  String get deleteAllDownloads => '删除所有下载';

  @override
  String get deleteAllDownloadsWarning => '这将删除所有下载的媒体文件并且无法撤消。';

  @override
  String get deleteAll => '全部删除';

  @override
  String get deleteSelected => '删除所选内容';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => '音乐和有声读物';

  @override
  String get images => '图片';

  @override
  String get database => '数据库';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => '设置';

  @override
  String get authentication => '验证';

  @override
  String get autoLoginServerManagement => '自动登录、服务器管理';

  @override
  String get pinCode => '密码';

  @override
  String get setUpPinCodeProtection => '设置 PIN 码保护';

  @override
  String get parentalControls => '家长控制';

  @override
  String get contentRatingRestrictions => '内容分级限制';

  @override
  String get bitRateResolutionBehavior => '比特率、分辨率、行为';

  @override
  String get languageSizeAppearance => '语言、大小、外观';

  @override
  String get qualityStorage => '质量、储存';

  @override
  String get serverSyncAndPluginStatus => '服务器同步和插件状态';

  @override
  String get mediaRequestIntegration => '媒体请求集成';

  @override
  String get switchServer => '切换服务器';

  @override
  String get signOut => '登出';

  @override
  String get versionLicenses => '版本、许可证';

  @override
  String get account => '帐户';

  @override
  String get signInAndSecurity => '登录和安全';

  @override
  String get administration => '行政';

  @override
  String get serverSettingsUsersLibraries => '服务器设置、用户、库';

  @override
  String get customization => '定制化';

  @override
  String get themeAndLayout => '主题和布局';

  @override
  String get videoAndSubtitles => '视频和字幕';

  @override
  String get integrations => '集成';

  @override
  String get pluginAndRequests => '插件和请求';

  @override
  String get customizeAccountPlaybackInterface => '自定义帐户、播放和界面行为';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => '主题与外观';

  @override
  String get focusBorderColor => '焦点边框颜色';

  @override
  String get watchedIndicators => '观察指标';

  @override
  String get always => '总是';

  @override
  String get hideUnwatched => '隐藏无人监视';

  @override
  String get episodesOnly => '仅剧集';

  @override
  String get never => '绝不';

  @override
  String get focusExpansionAnimation => '焦点扩展动画';

  @override
  String get desktopUiScale => '桌面 UI 比例';

  @override
  String get scaleFocusedCards => '缩放聚焦或悬停的卡片和图块';

  @override
  String get backgroundBackdrops => '背景背景';

  @override
  String get showBackdropImages => '显示内容后面的背景图像';

  @override
  String get seriesThumbnails => '系列缩略图';

  @override
  String get seriesThumbnailsDescription => '仅剧集：使用与每行图像类型匹配的系列图稿';

  @override
  String get homeRowInfoOverlay => '主行信息叠加';

  @override
  String get showTitleMetadataOnHomeRows => '浏览主行时显示标题和元数据';

  @override
  String get clockDisplay => '时钟显示';

  @override
  String get inMenus => '在菜单中';

  @override
  String get inVideo => '视频中';

  @override
  String get seasonalEffects => '季节性影响';

  @override
  String get seasonalEffectsDescription => '视觉效果和季节性装饰';

  @override
  String get snow => '雪';

  @override
  String get fireworks => '烟花';

  @override
  String get confetti => '五彩纸屑';

  @override
  String get fallingLeaves => '落叶';

  @override
  String get themeMusic => '主题音乐';

  @override
  String get playThemeMusicOnDetailPages => '在详情页播放主题音乐';

  @override
  String get themeMusicVolume => '主题音乐音量';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => '主行主题音乐';

  @override
  String get playWhenBrowsingHomeScreen => '浏览主屏幕时播放';

  @override
  String get detailsBackgroundBlur => '细节背景模糊';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => '正在浏览背景模糊';

  @override
  String get maxStreamingBitrate => '最大流媒体比特率';

  @override
  String get maxResolution => '最大分辨率';

  @override
  String get playerZoomMode => '播放器缩放模式';

  @override
  String get fit => '合身';

  @override
  String get autoCrop => '自动裁剪';

  @override
  String get stretch => '拉紧';

  @override
  String get refreshRateSwitching => '刷新率切换';

  @override
  String get disabled => '残疾人';

  @override
  String get scaleOnTv => '在电视上缩放';

  @override
  String get scaleOnDevice => '在设备上扩展';

  @override
  String get trickPlay => '特技游戏';

  @override
  String get showPreviewThumbnailsWhenSeeking => '搜索时显示预览缩略图';

  @override
  String get showDescriptionOnPause => '显示暂停说明';

  @override
  String get dimVideoShowOverview => '暂停时调暗视频并显示概述文本';

  @override
  String get osdLockButton => 'OSD 锁定按钮';

  @override
  String get osdLockButtonDescription => '显示一个锁定按钮，该按钮会阻止触摸输入，直到长按为止';

  @override
  String get audioBehavior => '音频行为';

  @override
  String get downmixToStereo => '缩混至立体声';

  @override
  String get defaultAudioLanguage => '默认音频语言';

  @override
  String get autoServerDefault => '自动（服务器默认）';

  @override
  String get english => '英语';

  @override
  String get spanish => '西班牙语';

  @override
  String get french => '法语';

  @override
  String get german => '德语';

  @override
  String get italian => '意大利语';

  @override
  String get portuguese => '葡萄牙语';

  @override
  String get japanese => '日本人';

  @override
  String get korean => '韩国人';

  @override
  String get chinese => '中国人';

  @override
  String get russian => '俄语';

  @override
  String get arabic => '阿拉伯';

  @override
  String get hindi => '印地语';

  @override
  String get dutch => '荷兰语';

  @override
  String get swedish => '瑞典';

  @override
  String get norwegian => '挪威';

  @override
  String get danish => '丹麦语';

  @override
  String get finnish => '芬兰';

  @override
  String get polish => '抛光';

  @override
  String get ac3Passthrough => 'AC3直通';

  @override
  String get dtsPassthrough => 'DTS直通';

  @override
  String get trueHdSupport => 'TrueHD 支持';

  @override
  String get enableDtsPassthrough => '仅限 AVR 的比特流 DTS 音频；需要接收器支持和 DTS 源轨道';

  @override
  String get enableTrueHdAudio => '启用 TrueHD 音频（可能不适用于所有平台）';

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
  String get nightMode => '夜间模式';

  @override
  String get compressDynamicRange => '压缩动态范围';

  @override
  String get advancedMpv => '高级 mpv';

  @override
  String get enableCustomMpvConf => '启用自定义 mpv.conf';

  @override
  String get applyMpvConfBeforePlayback => '在播放开始之前应用用户指定的 mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => '不安全的高级 mpv 选项';

  @override
  String get unsafeMpvOptionsDescription => '允许更广泛的 mpv 选项。可能会破坏播放行为。';

  @override
  String get hardwareDecoding => '硬件解码';

  @override
  String get hardwareDecodingSubtitle => '可能会提高性能，但可能会导致某些设备上的播放问题。';

  @override
  String get nextUpAndQueuing => '下一个和排队';

  @override
  String get nextUpDisplay => '下一个显示';

  @override
  String get extended => '扩展';

  @override
  String get minimal => '最小';

  @override
  String get nextUpTimeout => '下一个超时';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => '媒体排队';

  @override
  String get autoQueueNextEpisodes => '自动排队下一集';

  @override
  String get stillWatchingPrompt => '仍在观看提示';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => '继续和跳过';

  @override
  String get resumeRewind => '恢复倒带';

  @override
  String get unpauseRewind => '取消暂停倒带';

  @override
  String get fiveSeconds => '5秒';

  @override
  String get tenSeconds => '10秒';

  @override
  String get fifteenSeconds => '15秒';

  @override
  String get thirtySeconds => '30秒';

  @override
  String get skipBackLength => '向后跳长度';

  @override
  String get skipForwardLength => '向前跳过长度';

  @override
  String get customMpvConfPath => '自定义 mpv.conf 路径';

  @override
  String get notSetMpvConf => '未设置。 Moonfin 将尝试应用程序/数据文件夹中的默认 mpv.conf。';

  @override
  String get selectMpvConf => '选择mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      '样式设置（大小、颜色、偏移）适用于基于文本的字幕（SRT、VTT、TTML）。除非关闭“ASS/SSA Direct Play”，否则 ASS/SSA 字幕将使用其自己的嵌入样式。位图字幕（PGS、DVB、VobSub）无法重新设计样式。';

  @override
  String get defaultSubtitleLanguage => '默认字幕语言';

  @override
  String get defaultToNoSubtitles => '默认为无字幕';

  @override
  String get turnOffSubtitlesByDefault => '默认关闭字幕';

  @override
  String get subtitleSize => '字幕大小';

  @override
  String get textFillColor => '文本填充颜色';

  @override
  String get backgroundColor => '背景颜色';

  @override
  String get textStrokeColor => '文字描边颜色';

  @override
  String get subtitleCustomization => '字幕定制';

  @override
  String get subtitleCustomizationDescription => '自定义字幕外观';

  @override
  String get subtitlePreviewText => '敏捷的棕色狐狸跳过了懒狗';

  @override
  String get verticalOffset => '垂直偏移';

  @override
  String get pgsDirectPlay => 'PGS 直接比赛';

  @override
  String get directPlayPgsSubtitles => '直接播放PGS字幕';

  @override
  String get assSsaDirectPlay => 'ASS/SSA 直接播放';

  @override
  String get directPlayAssSsaSubtitles => '直接播放ASS/SSA字幕';

  @override
  String get white => '白色的';

  @override
  String get black => '黑色的';

  @override
  String get yellow => '黄色的';

  @override
  String get green => '绿色的';

  @override
  String get cyan => '青色';

  @override
  String get red => '红色的';

  @override
  String get transparent => '透明的';

  @override
  String get semiTransparentBlack => '半透明黑色';

  @override
  String get global => '全球的';

  @override
  String get desktop => '桌面';

  @override
  String get mobile => '移动的';

  @override
  String get tv => '电视';

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
  String get customizationProfile => '定制简介';

  @override
  String get customizationProfileDescription =>
      '选择要加载、编辑和同步的配置文件。全局适用于任何地方，除非设备配置文件覆盖它。绿点标记您当前的设备配置文件。';

  @override
  String get loadProfile => '负载曲线';

  @override
  String get syncing => '正在同步...';

  @override
  String get syncToProfile => '同步到配置文件';

  @override
  String get profileSyncHidden => '配置文件同步隐藏';

  @override
  String get enablePluginSyncDescription => '在插件设置中启用服务器插件同步以在此处显示配置文件控件。';

  @override
  String get quality => '质量';

  @override
  String get defaultDownloadQuality => '默认下载质量';

  @override
  String get network => '网络';

  @override
  String get wifiOnlyDownloads => '仅 WiFi 下载';

  @override
  String get onlyDownloadOnWifi => '仅在连接 WiFi 时下载';

  @override
  String get storage => '贮存';

  @override
  String get storageUsed => '已用存储空间';

  @override
  String get manage => '管理';

  @override
  String get calculating => '正在计算...';

  @override
  String get downloadLocation => '下载位置';

  @override
  String get defaultLabel => '默认';

  @override
  String get saveToDownloadsFolder => '保存到下载文件夹';

  @override
  String get downloadsVisibleToOtherApps => 'Downloads/Moonfin — 对其他应用程序可见';

  @override
  String get dangerZone => '危险区';

  @override
  String get clearAllDownloads => '清除所有下载';

  @override
  String get original => '原来的';

  @override
  String get changeDownloadLocation => '更改下载位置';

  @override
  String get changeDownloadLocationDescription =>
      '新下载的内容将保存到所选文件夹中。现有下载将保留在当前位置，并且可以通过存储设置进行管理。';

  @override
  String get confirm => '确认';

  @override
  String get cannotWriteToFolder => '无法写入选定的文件夹。请选择其他位置或授予存储权限。';

  @override
  String get saveToDownloadsFolderQuestion => '保存到下载文件夹吗？';

  @override
  String get saveToDownloadsFolderDescription =>
      '下载的媒体将保存到您设备上的 Downloads/Moonfin 中。这些文件将对其他应用程序可见，例如您的图库或音乐播放器。\n\n现有下载将保留在当前位置。';

  @override
  String get enable => '使能够';

  @override
  String get clearAllDownloadsWarning => '这将删除所有下载的媒体并且无法撤消。';

  @override
  String get clearAll => '全部清除';

  @override
  String get navigationStyle => '导航风格';

  @override
  String get topBar => '顶栏';

  @override
  String get leftSidebar => '左侧边栏';

  @override
  String get showShuffleButton => '显示随机播放按钮';

  @override
  String get showGenresButton => '显示流派按钮';

  @override
  String get showFavoritesButton => '显示收藏夹按钮';

  @override
  String get showLibrariesInToolbar => '在工具栏中显示库';

  @override
  String get navbarOpacity => '导航栏不透明度';

  @override
  String get navbarColor => '导航栏颜色';

  @override
  String get gray => '灰色的';

  @override
  String get darkBlue => '深蓝色';

  @override
  String get purple => '紫色的';

  @override
  String get teal => '青色';

  @override
  String get navy => '海军';

  @override
  String get charcoal => '木炭';

  @override
  String get brown => '棕色的';

  @override
  String get darkRed => '深红色';

  @override
  String get darkGreen => '深绿色';

  @override
  String get slate => '石板';

  @override
  String get indigo => '靛青';

  @override
  String get libraryDisplay => '图书馆展示';

  @override
  String get posterLabel => '海报';

  @override
  String get thumbnailLabel => '缩略图';

  @override
  String get bannerLabel => '横幅';

  @override
  String get overridePerLibrarySettings => '覆盖每个库的设置';

  @override
  String get applyImageTypeToAllLibraries => '将图像类型应用于所有库';

  @override
  String get multiServerLibraries => '多服务器库';

  @override
  String get showLibrariesFromAllServers => '显示所有连接服务器的库';

  @override
  String get enableFolderView => '启用文件夹视图';

  @override
  String get showFolderBrowsingOption => '显示文件夹浏览选项';

  @override
  String get libraryVisibility => '图书馆可见性';

  @override
  String get libraryVisibilityDescription => '切换每个库的主页可见性。重新启动 Moonfin 以使更改生效。';

  @override
  String get showInNavigation => '在导航中显示';

  @override
  String get showInLatestMedia => '在最新媒体上展示';

  @override
  String get sourceLibraries => '源库';

  @override
  String get sourceCollections => '源集';

  @override
  String get excludedGenres => '排除的类型';

  @override
  String get selectAll => '选择全部';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => '媒体栏';

  @override
  String get mediaSources => '媒体来源';

  @override
  String get behavior => '行为';

  @override
  String get seconds => '秒';

  @override
  String get localPreviews => '本地预览';

  @override
  String get localPreviewsDescription => '配置预告片、媒体和音频预览。';

  @override
  String get mediaBarMode => '媒体栏风格';

  @override
  String get mediaBarModeDescription => '在 Moonfin、MakD 之间进行选择，或关闭媒体栏';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => '马克D';

  @override
  String get mediaBarModeOff => '离开';

  @override
  String get enableMediaBar => '启用媒体栏';

  @override
  String get showFeaturedContentSlideshow => '在主页上显示特色内容幻灯片';

  @override
  String get contentType => '内容类型';

  @override
  String get moviesAndTvShows => '电影和电视节目';

  @override
  String get moviesOnly => '仅限电影';

  @override
  String get tvShowsOnly => '仅限电视节目';

  @override
  String get itemCount => '商品数量';

  @override
  String get noneSelected => '未选择';

  @override
  String get noneExcluded => '没有排除';

  @override
  String get autoAdvance => '自动前进';

  @override
  String get autoAdvanceSlides => '自动前进到下一张幻灯片';

  @override
  String get autoAdvanceInterval => '自动前进间隔';

  @override
  String get trailerPreview => '预告片预览';

  @override
  String get autoPlayTrailers => '3 秒后在媒体栏中自动播放预告片';

  @override
  String get episodePreview => '剧集预览';

  @override
  String get mediaPreview => '媒体预览';

  @override
  String get episodePreviewDescription => '在聚焦、悬停或长按的卡片上播放 30 秒的内联预览';

  @override
  String get mediaPreviewDescription => '在聚焦、悬停或长按的卡片上播放 30 秒的内联预览';

  @override
  String get previewAudio => '预览音频';

  @override
  String get enablePreviewAudio => '为预告片和剧集预览启用音频';

  @override
  String get latestMedia => '最新媒体';

  @override
  String get recentlyReleased => '最近发布';

  @override
  String get myMedia => '我的媒体';

  @override
  String get myMediaSmall => '我的媒体（小）';

  @override
  String get continueWatching => '继续观看';

  @override
  String get resumeAudio => '恢复音频';

  @override
  String get resumeBooks => '简历书籍';

  @override
  String get activeRecordings => '活动录音';

  @override
  String get playlists => '播放列表';

  @override
  String get liveTV => '电视直播';

  @override
  String get homeSections => '首页 栏目';

  @override
  String get resetToDefaults => '重置为默认值';

  @override
  String get homeRowPosterSize => '主排海报尺寸';

  @override
  String get perRowImageTypeSelection => '每行图像类型选择';

  @override
  String get configureImageTypeForEachRow => '为每个启用的主行配置图像类型';

  @override
  String get mergeContinueWatchingAndNextUp => '合并继续观看和下一步';

  @override
  String get combineBothRows => '将两行合并为一个主页部分';

  @override
  String get perRowImageType => '每行图像类型';

  @override
  String get perRowSettings => '每行设置';

  @override
  String get autoLogin => '自动登录';

  @override
  String get lastUser => '最后一个用户';

  @override
  String get specificUser => '特定用户';

  @override
  String get alwaysAuthenticate => '始终进行身份验证';

  @override
  String get requirePasswordWithToken => '即使使用存储的令牌也需要密码';

  @override
  String get confirmExit => '确认退出';

  @override
  String get showConfirmationBeforeExiting => '退出前显示确认信息';

  @override
  String get blockContentWithRatings => '阻止具有以下评级的内容：';

  @override
  String get noContentRatingsFound => '在此服务器上尚未找到内容分级。';

  @override
  String get couldNotLoadServerRatings => '无法加载服务器评级。仅显示已保存的评分。';

  @override
  String get couldNotRefreshRatings => '无法刷新服务器的评级。显示已保存的评分。';

  @override
  String get enablePinCode => '启用 PIN 码';

  @override
  String get requirePinToAccess => '需要 PIN 码才能访问您的帐户';

  @override
  String get changePin => '更改密码';

  @override
  String get setNewPinCode => '设置新的 PIN 码';

  @override
  String get removePin => '删除 PIN 码';

  @override
  String get removePinProtection => '删除 PIN 码保护';

  @override
  String get screensaver => '屏幕保护程序';

  @override
  String get inAppScreensaver => '应用程序内屏幕保护程序';

  @override
  String get enableBuiltInScreensaver => '启用内置屏幕保护程序';

  @override
  String get mode => '模式';

  @override
  String get libraryArt => '图书馆艺术';

  @override
  String get logo => '标识';

  @override
  String get clock => '钟';

  @override
  String get timeout => '暂停';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => '调光等级';

  @override
  String get maxAgeRating => '最大年龄等级';

  @override
  String get any => '任何';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => '需要年龄分级';

  @override
  String get onlyShowRatedContent => '只显示评分内容';

  @override
  String get showClock => '显示时钟';

  @override
  String get displayClockDuringScreensaver => '屏幕保护期间显示时钟';

  @override
  String get rottenTomatoesCritics => '烂番茄（评论家）';

  @override
  String get rottenTomatoesAudience => '烂番茄（观众）';

  @override
  String get imdb => '互联网医学数据库';

  @override
  String get tmdb => 'TM数据库';

  @override
  String get metacritic => '元评论家';

  @override
  String get metacriticUser => '元评论家（用户）';

  @override
  String get trakt => '特拉克特';

  @override
  String get letterboxd => '信箱';

  @override
  String get myAnimeList => '我的动漫列表';

  @override
  String get aniList => '动画列表';

  @override
  String get communityRating => '社区评级';

  @override
  String get ratings => '评级';

  @override
  String get additionalRatings => '附加评级';

  @override
  String get showMdbListAndTmdbRatings => '显示 MDBList 和 TMDB 评级';

  @override
  String get ratingLabels => '评级标签';

  @override
  String get showLabelsNextToIcons => '在评级图标旁边显示标签';

  @override
  String get ratingBadges => '评级徽章';

  @override
  String get showDecorativeBadges => '显示评级背后的装饰徽章';

  @override
  String get episodeRatings => '剧集收视率';

  @override
  String get showRatingsOnEpisodes => '显示个别剧集的收视率';

  @override
  String get ratingSources => '评级来源';

  @override
  String get ratingSourcesDescription => '启用并重新排序整个应用程序中显示的评级来源';

  @override
  String get pluginLabel => '插件';

  @override
  String get pluginDetected => '检测到插件';

  @override
  String get pluginNotDetected => '未检测到插件';

  @override
  String get pluginDetectedDescription => '检测到服务器插件。第一次找到插件时会自动启用同步。';

  @override
  String get pluginNotDetectedDescription => '当前未检测到服务器插件。本地设置仍然使用其保存的值或内置默认值。';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => '可用服务';

  @override
  String get serverPluginSync => '服务器插件同步';

  @override
  String get syncSettingsWithPlugin => '与服务器插件同步设置';

  @override
  String get whatSyncControls => '同步控制什么';

  @override
  String get syncControlsDescription =>
      '同步仅控制插件支持的设置是否推送到服务器或从服务器拉出。启用插件同步后，配置文件选择和配置文件同步操作位于自定义设置中。';

  @override
  String get recentRequests => '最近的请求';

  @override
  String get recentlyAdded => '最近添加';

  @override
  String get trending => '流行趋势';

  @override
  String get popularMovies => '热门电影';

  @override
  String get movieGenres => '电影类型';

  @override
  String get upcomingMovies => '即将上映的电影';

  @override
  String get studios => '工作室';

  @override
  String get popularSeries => '热门系列';

  @override
  String get seriesGenres => '系列流派';

  @override
  String get upcomingSeries => '即将推出的系列';

  @override
  String get networks => '网络';

  @override
  String get resetRowsToDefaults => '将行重置为默认值';

  @override
  String get enableSeerr => '启用搜索器';

  @override
  String get showSeerrInNavigation => '在导航中显示 Seerr（需要服务器插件）';

  @override
  String get seerrUnavailable => '不可用，因为服务器插件 Seerr 支持被禁用。';

  @override
  String get nsfwFilter => 'NSFW 过滤器';

  @override
  String get hideAdultContent => '在结果中隐藏成人内容';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => '发现行';

  @override
  String get discoverRowsDescriptionPlugin =>
      '拖动以重新排序。启用或禁用行。启用与 Moonfin 插件的行顺序同步。';

  @override
  String get discoverRowsDescription => '拖动以重新排序。启用或禁用行。';

  @override
  String get enabled => '启用';

  @override
  String get hidden => '隐';

  @override
  String get aboutTitle => '关于';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => '开源许可证';

  @override
  String get sourceCode => '源代码';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => '立即检查更新';

  @override
  String get checksLatestDesktopRelease => '检查该平台的最新桌面版本';

  @override
  String get youAreUpToDate => '你是最新的。';

  @override
  String get couldNotCheckForUpdates => '目前无法检查更新。';

  @override
  String get noCompatibleUpdate => '找不到该平台的兼容更新包。';

  @override
  String get updateChecksNotSupported => '此平台不支持更新检查。';

  @override
  String get updateNotificationsDisabled => '更新通知被禁用。';

  @override
  String get pleaseWaitBeforeChecking => '请稍候再检查。';

  @override
  String get latestUpdateAlreadyShown => '最新更新已经显示。';

  @override
  String get updateAvailable => '可用更新。';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => '更新通知';

  @override
  String get showWhenUpdatesAvailable => '显示更新何时可用';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => '阅读发行说明';

  @override
  String get downloadingUpdate => '正在下载更新...';

  @override
  String get updateDownloadFailed => '更新下载失败。请再试一次。';

  @override
  String get openReleasesPage => '打开发布页面';

  @override
  String get navigation => '导航';

  @override
  String get watchedIndicatorsBackdrops => '观看指标、背景';

  @override
  String get focusColorWatchedIndicatorsBackdrops => '焦点颜色、观察指标、背景';

  @override
  String get navbarStyleToolbarAppearance => '导航栏样式、工具栏按钮、外观';

  @override
  String get reorderToggleHomeRows => '重新排序和切换主行';

  @override
  String get featuredContentAppearance => '特色内容、外观';

  @override
  String get posterSizeImageTypeFolderView => '海报尺寸、图像类型、文件夹视图';

  @override
  String get mdbListTmdbRatingSources => 'MDBList、TMDB 和评级源';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => '清除';

  @override
  String get browse => '浏览';

  @override
  String get noResults => '没有结果';

  @override
  String get seerrAvailableStatus => '可用的';

  @override
  String get seerrRequestedStatus => '已请求';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => '搜索者设置';

  @override
  String get requestMore => '请求更多';

  @override
  String get request => '要求';

  @override
  String get cancelRequest => '取消请求';

  @override
  String get playInMoonfin => '玩 Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => '批准';

  @override
  String get declineAction => '衰退';

  @override
  String get similar => '相似的';

  @override
  String get recommendations => '建议';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => '保持';

  @override
  String get itemNotFoundInLibrary => '在您的 Moonfin 库中找不到项目';

  @override
  String get errorSearchingLibrary => '搜索库时出错';

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
  String get submitRequest => '提交请求';

  @override
  String get allSeasons => '所有季节';

  @override
  String get advancedOptions => '高级选项';

  @override
  String get noServiceServersConfigured => '未配置服务服务器';

  @override
  String get server => '服务器';

  @override
  String get qualityProfile => '质量概况';

  @override
  String get rootFolder => '根文件夹';

  @override
  String get showMore => '显示更多';

  @override
  String get appearances => '出场次数';

  @override
  String get crewSection => '全体人员';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => '没有要求';

  @override
  String get pendingStatus => '待办的';

  @override
  String get declinedStatus => '拒绝';

  @override
  String get partiallyAvailable => '部分可用';

  @override
  String get downloadingStatus => '正在下载';

  @override
  String get approvedStatus => '得到正式认可的';

  @override
  String get notRequestedStatus => '未要求';

  @override
  String get blocklistedStatus => '列入黑名单';

  @override
  String get deletedStatus => '已删除';

  @override
  String get tmdbScore => 'TMDB分数';

  @override
  String get releaseDateLabel => '发布日期';

  @override
  String get firstAirDateLabel => '首播日期';

  @override
  String get revenueLabel => '收入';

  @override
  String get runtimeLabel => '运行时';

  @override
  String get budgetLabel => '预算';

  @override
  String get originalLanguageLabel => '原始语言';

  @override
  String get seasonsLabel => '季节';

  @override
  String get episodesLabel => '剧集数';

  @override
  String get access => '使用权';

  @override
  String get add => '添加';

  @override
  String get address => '地址';

  @override
  String get analytics => '分析';

  @override
  String get catalog => '目录';

  @override
  String get content => '内容';

  @override
  String get copy => '复制';

  @override
  String get create => '创造';

  @override
  String get disable => '禁用';

  @override
  String get done => '完毕';

  @override
  String get edit => '编辑';

  @override
  String get encoding => '编码';

  @override
  String get error => '错误';

  @override
  String get forward => '向前';

  @override
  String get general => '一般的';

  @override
  String get go => '去';

  @override
  String get install => '安装';

  @override
  String get installed => '已安装';

  @override
  String get interval => '间隔';

  @override
  String get name => '姓名';

  @override
  String get networking => '联网';

  @override
  String get next => '下一个';

  @override
  String get path => '小路';

  @override
  String get paused => '已暂停';

  @override
  String get permissions => '权限';

  @override
  String get processing => '加工';

  @override
  String get profile => '轮廓';

  @override
  String get provider => '提供者';

  @override
  String get refresh => '刷新';

  @override
  String get remote => '偏僻的';

  @override
  String get rename => '重命名';

  @override
  String get revoke => '撤销';

  @override
  String get role => '角色';

  @override
  String get root => '根';

  @override
  String get run => '跑步';

  @override
  String get search => '搜索';

  @override
  String get select => '选择';

  @override
  String get send => '发送';

  @override
  String get sessions => '会议';

  @override
  String get set => '放';

  @override
  String get status => '地位';

  @override
  String get stop => '停止';

  @override
  String get streaming => '流媒体';

  @override
  String get time => '时间';

  @override
  String get trickplay => '特技游戏';

  @override
  String get uninstall => '卸载';

  @override
  String get up => '向上';

  @override
  String get update => '更新';

  @override
  String get upload => '上传';

  @override
  String get unmute => '取消静音';

  @override
  String get mute => '沉默的';

  @override
  String get branding => '品牌推广';

  @override
  String get adminDrawerDashboard => '仪表板';

  @override
  String get adminDrawerAnalytics => '分析';

  @override
  String get adminDrawerSettings => '设置';

  @override
  String get adminDrawerBranding => '品牌推广';

  @override
  String get adminDrawerUsers => '用户';

  @override
  String get adminDrawerLibraries => '图书馆';

  @override
  String get adminDrawerTranscoding => '转码';

  @override
  String get adminDrawerResume => '恢复';

  @override
  String get adminDrawerStreaming => '流媒体';

  @override
  String get adminDrawerTrickplay => '特技游戏';

  @override
  String get adminDrawerDevices => '设备';

  @override
  String get adminDrawerActivity => '活动';

  @override
  String get adminDrawerNetworking => '联网';

  @override
  String get adminDrawerApiKeys => 'API 密钥';

  @override
  String get adminDrawerBackups => '备份';

  @override
  String get adminDrawerLogs => '日志';

  @override
  String get adminDrawerScheduledTasks => '计划任务';

  @override
  String get adminDrawerPlugins => '插件';

  @override
  String get adminDrawerRepositories => '存储库';

  @override
  String get adminDrawerLiveTv => '电视直播';

  @override
  String get adminExitTooltip => '退出管理';

  @override
  String get adminDashboardLoadFailed => '无法加载仪表板';

  @override
  String get adminMediaOverview => '媒体概览';

  @override
  String get adminMediaTotalsError => '无法加载服务器媒体总数。';

  @override
  String get adminMediaOverviewSubtitle => '快速了解该服务器上有多少内容。';

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
  String get analyticsMediaDistribution => '媒体发行';

  @override
  String get analyticsVideoCodecs => '视频编解码器';

  @override
  String get analyticsAudioCodecs => '音频编解码器';

  @override
  String get analyticsContainers => '集装箱';

  @override
  String get analyticsTopGenres => '热门流派';

  @override
  String get analyticsReleaseYears => '发布年份';

  @override
  String get analyticsContentRatings => '内容评级';

  @override
  String get analyticsRuntimeBuckets => '运行时桶';

  @override
  String get analyticsFileFormats => '文件格式';

  @override
  String get analyticsNoData => '无可用数据。';

  @override
  String get adminServerInfo => '服务器信息';

  @override
  String get adminRestartPending => '重启待定';

  @override
  String get adminServerPaths => '服务器路径';

  @override
  String get adminServerActions => '服务器操作';

  @override
  String get adminRestartServer => '重启服务器';

  @override
  String get adminShutdownServer => '关闭服务器';

  @override
  String get adminScanLibraries => '扫描库';

  @override
  String get adminLibraryScanStarted => '图书馆扫描开始';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => '服务器正在重启';

  @override
  String get adminServerRebootMessage => '服务器正在重新启动，请重新启动 Moonfin';

  @override
  String get adminActiveSessions => '活跃会话';

  @override
  String get adminSessionsLoadFailed => '无法加载会话';

  @override
  String get adminNoActiveSessions => '没有活动会话';

  @override
  String get adminRecentActivity => '最近的活动';

  @override
  String get adminNoRecentActivity => '最近没有活动';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => '发送消息';

  @override
  String get adminMessageTextHint => '留言内容';

  @override
  String get adminSetVolume => '设置音量';

  @override
  String get sessionPrev => '上一篇';

  @override
  String get sessionRewind => '倒带';

  @override
  String get sessionForward => '向前';

  @override
  String get sessionNext => '下一个';

  @override
  String get sessionVolumeDown => '卷 –';

  @override
  String get sessionVolumeUp => '卷+';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => '正在播放';

  @override
  String get volume => '体积';

  @override
  String get actions => '行动';

  @override
  String get videoCodec => '视频编解码器';

  @override
  String get audioCodec => '音频编解码器';

  @override
  String get hwAccel => '硬件加速';

  @override
  String get completion => '完成';

  @override
  String get direct => '直接的';

  @override
  String get adminDisconnect => '断开';

  @override
  String get adminClearDates => '明确日期';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => '没有活动条目';

  @override
  String get adminEditDeviceName => '编辑设备名称';

  @override
  String get adminCustomName => '自定义名称';

  @override
  String get adminDeviceNameUpdated => '设备名称已更新';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => '删除设备';

  @override
  String get adminDeviceDeleted => '设备已删除';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => '加载设备失败';

  @override
  String get adminSearchDevices => '搜索设备';

  @override
  String get adminThisDevice => '本设备';

  @override
  String get adminEditName => '编辑姓名';

  @override
  String get adminLibrariesLoadFailed => '加载库失败';

  @override
  String get adminNoLibraries => '没有配置库';

  @override
  String get adminScanAllLibraries => '扫描所有图书馆';

  @override
  String get adminAddLibrary => '添加库';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => '重命名库';

  @override
  String get adminNewName => '新名称';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => '删除库';

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
  String get adminRemovePath => '删除路径';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => '已保存库选项';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => '加载库失败';

  @override
  String get adminNoMediaPaths => '未配置媒体路径';

  @override
  String get adminAddPath => '添加路径';

  @override
  String get adminBrowseFilesystem => '浏览服务器文件系统：';

  @override
  String get adminSaveOptions => '保存选项';

  @override
  String get adminPreferredMetadataLanguage => '首选元数据语言';

  @override
  String get adminMetadataLanguageHint => '例如英语、德语、法语';

  @override
  String get adminMetadataCountryCode => '元数据国家代码';

  @override
  String get adminMetadataCountryHint => '例如美国、德国、法国';

  @override
  String get adminLibraryNameRequired => '库名称为必填项';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => '图书馆名称';

  @override
  String get adminSelectedPaths => '选定的路径：';

  @override
  String get adminNoPathsAdded => '未添加路径（可以稍后添加）';

  @override
  String get adminCreateLibrary => '创建库';

  @override
  String get paths => '路径：';

  @override
  String get adminDisableUser => '禁用用户';

  @override
  String get adminEnableUser => '启用用户';

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
  String get adminUsersLoadFailed => '加载用户失败';

  @override
  String get adminSearchUsers => '搜索用户';

  @override
  String get adminEditUser => '编辑用户';

  @override
  String get adminAddUser => '添加用户';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => '创建用户';

  @override
  String get adminPasswordOptional => '密码（可选）';

  @override
  String get adminUsernameRequired => '用户名不能为空';

  @override
  String get adminNoProfileChanges => '没有要保存的配置文件更改';

  @override
  String get adminProfileSaved => '个人资料已保存';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => '权限已保存';

  @override
  String get adminPasswordsMismatch => '密码不匹配';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => '加载用户失败';

  @override
  String get adminBackToUsers => '返回用户';

  @override
  String get adminSaveProfile => '保存个人资料';

  @override
  String get adminDeleteUser => '删除用户';

  @override
  String get admin => '行政';

  @override
  String get adminFullAccessWarning => '管理员拥有服务器的完全访问权限。谨慎授予。';

  @override
  String get administrator => '行政人员';

  @override
  String get adminHiddenUser => '隐藏用户';

  @override
  String get adminAllowMediaPlayback => '允许媒体播放';

  @override
  String get adminAllowAudioTranscoding => '允许音频转码';

  @override
  String get adminAllowVideoTranscoding => '允许视频转码';

  @override
  String get adminAllowRemuxing => '允许重新复用';

  @override
  String get adminForceRemoteTranscoding => '强制远程源转码';

  @override
  String get adminAllowContentDeletion => '允许内容删除';

  @override
  String get adminAllowContentDownloading => '允许内容下载';

  @override
  String get adminAllowPublicSharing => '允许公开共享';

  @override
  String get adminAllowRemoteControl => '允许其他用户远程控制';

  @override
  String get adminAllowSharedDeviceControl => '允许共享设备控制';

  @override
  String get adminAllowRemoteAccess => '允许远程访问';

  @override
  String get adminRemoteBitrateLimit => '远程客户端比特率限制 (bps)';

  @override
  String get adminLeaveEmptyNoLimit => '留空则无限制';

  @override
  String get adminMaxActiveSessions => '最大活跃会话数';

  @override
  String get adminAllowLiveTvAccess => '允许访问直播电视';

  @override
  String get adminAllowLiveTvManagement => '允许直播电视管理';

  @override
  String get adminAllowCollectionManagement => '允许集合管理';

  @override
  String get adminAllowSubtitleManagement => '允许字幕管理';

  @override
  String get adminAllowLyricManagement => '允许歌词管理';

  @override
  String get adminSavePermissions => '保存权限';

  @override
  String get adminEnableAllLibraryAccess => '允许访问所有库';

  @override
  String get adminSaveAccess => '保存访问权限';

  @override
  String get adminChangePassword => '更改密码';

  @override
  String get adminNewPassword => '新密码';

  @override
  String get adminConfirmPassword => '确认密码';

  @override
  String get adminSetPassword => '设置密码';

  @override
  String get adminResetPassword => '重置密码';

  @override
  String get adminPasswordReset => '密码重置';

  @override
  String get adminPasswordUpdated => '密码已更新';

  @override
  String get adminUserSettings => '用户设置';

  @override
  String get adminLibraryAccess => '图书馆访问';

  @override
  String get adminDeviceAndChannelAccess => '设备和通道访问';

  @override
  String get adminEnableAllDevices => '启用对所有设备的访问';

  @override
  String get adminEnableAllChannels => '允许访问所有频道';

  @override
  String get adminResetPasswordWarning => '这将删除密码。用户无需密码即可登录。';

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
  String get adminCreateApiKey => '创建 API 密钥';

  @override
  String get adminAppName => '应用名称';

  @override
  String get adminApiKeyCreated => 'API 密钥已创建';

  @override
  String get adminApiKeyCreatedNoToken => '密钥创建成功。服务器没有返回令牌。检查服务器 API 密钥。';

  @override
  String get adminKeyCopied => '密钥已复制到剪贴板';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => '服务器响应中缺少密钥令牌';

  @override
  String get adminRevokeApiKey => '撤销 API 密钥';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API 密钥已撤销';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => '无法加载 API 密钥';

  @override
  String get adminApiKeysTitle => 'API 密钥';

  @override
  String get adminCreateKey => '创建密钥';

  @override
  String get adminNoApiKeys => '未找到 API 密钥';

  @override
  String get adminUnknownApp => '未知应用程序';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => '正在创建备份...';

  @override
  String get adminBackupCreated => '备份创建成功';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => '服务器响应中缺少备份路径';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => '确认恢复';

  @override
  String get adminRestoringBackup => '正在恢复备份...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => '无法加载备份';

  @override
  String get adminCreateBackup => '创建备份';

  @override
  String get adminNoBackups => '未找到备份';

  @override
  String get adminViewDetails => '查看详情';

  @override
  String get restore => '恢复';

  @override
  String get adminLogsLoadFailed => '加载服务器日志失败';

  @override
  String get adminNoLogFiles => '未找到日志文件';

  @override
  String get adminLogCopied => '日志已复制到剪贴板';

  @override
  String get adminSaveLogFile => '保存日志文件';

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
  String get adminSearchInLog => '在日志中搜索';

  @override
  String get adminNoMatchingLines => '没有匹配的线';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => '没有找到计划任务';

  @override
  String get adminNoTasksMatchFilter => '没有任务与当前过滤器匹配';

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
  String get adminRunNow => '立即运行';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => '最后执行';

  @override
  String get adminTriggers => '触发器';

  @override
  String get adminAddTrigger => '添加触发器';

  @override
  String get adminNoTriggers => '没有配置触发器';

  @override
  String get adminTriggerType => '触发类型';

  @override
  String get adminTimeLimit => '时间限制（可选）';

  @override
  String get adminNoLimit => '无限制';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => '星期几';

  @override
  String get adminSearchPlugins => '搜索插件...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => '卸载插件';

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
  String get adminNoPluginsMatchSearch => '没有符合您搜索条件的插件';

  @override
  String get adminNoPluginsInstalled => '没有安装插件';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => '没有符合您搜索条件的软件包';

  @override
  String get adminNoPackagesAvailable => '没有可用的套餐';

  @override
  String get adminExperimentalIntegration => '实验整合';

  @override
  String get adminExperimentalWarning => '插件设置集成仍处于实验阶段。某些设置页面可能无法正确呈现。';

  @override
  String get continueAction => '继续';

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
  String get adminMissingAuthToken => '无法打开设置：缺少身份验证令牌。';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => '找不到插件';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => '启用插件';

  @override
  String get adminPluginSettingsPage => '插件设置页面';

  @override
  String get adminRevisionHistory => '修订历史';

  @override
  String get adminNoChangelog => '没有可用的变更日志。';

  @override
  String get adminRemoveRepository => '删除存储库';

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
  String get adminRepositoryNameHint => '例如Jellyfin 稳定';

  @override
  String get adminRepositoryUrl => '存储库网址';

  @override
  String get adminAddEntry => '添加条目';

  @override
  String get adminInvalidUrl => '无效网址';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => '在浏览器中打开';

  @override
  String get adminOpenExternally => '对外开放';

  @override
  String get adminGeneralSettings => '常规设置';

  @override
  String get adminServerName => '服务器名称';

  @override
  String get adminPreferredMetadataCountry => '首选元数据国家/地区';

  @override
  String get adminCachePath => '缓存路径';

  @override
  String get adminMetadataPath => '元数据路径';

  @override
  String get adminLibraryScanConcurrency => '库扫描并发';

  @override
  String get adminParallelImageEncodingLimit => '并行图像编码限制';

  @override
  String get adminSlowResponseThreshold => '慢响应阈值（毫秒）';

  @override
  String get adminBrandingSaved => '已保存品牌设置';

  @override
  String get adminBrandingLoadFailed => '无法加载品牌设置';

  @override
  String get adminLoginDisclaimer => '登录免责声明';

  @override
  String get adminLoginDisclaimerHint => 'HTML 显示在登录表单下方';

  @override
  String get adminCustomCss => '自定义CSS';

  @override
  String get adminCustomCssHint => '应用于 Web 界面的自定义 CSS';

  @override
  String get adminEnableSplashScreen => '启用启动画面';

  @override
  String get adminStreamingSaved => '已保存流媒体设置';

  @override
  String get adminStreamingLoadFailed => '无法加载流媒体设置';

  @override
  String get adminStreamingDescription => '设置远程连接的全局流比特率限制。';

  @override
  String get adminRemoteBitrateLimitMbps => '远程客户端比特率限制 (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => '留空或 0 表示无限制';

  @override
  String get adminPlaybackSaved => '已保存播放设置';

  @override
  String get adminPlaybackLoadFailed => '无法加载播放设置';

  @override
  String get adminPlaybackTranscoding => '播放/转码';

  @override
  String get adminHardwareAcceleration => '硬件加速';

  @override
  String get adminVaapiDevice => 'VA-API装置';

  @override
  String get adminEnableHardwareEncoding => '启用硬件编码';

  @override
  String get adminEnableHardwareDecoding => '启用硬件解码：';

  @override
  String get adminEncodingThreads => '编码线程';

  @override
  String get adminAutomatic => '0 = 自动';

  @override
  String get adminTranscodingTempPath => '转码临时路径';

  @override
  String get adminEnableFallbackFont => '启用后备字体';

  @override
  String get adminFallbackFontPath => '后备字体路径';

  @override
  String get adminAllowSegmentDeletion => '允许段删除';

  @override
  String get adminSegmentKeepSeconds => '段保持（秒）';

  @override
  String get adminThrottleBuffering => '油门缓冲';

  @override
  String get adminTrickplaySaved => '已保存特技播放设置';

  @override
  String get adminTrickplayLoadFailed => '无法加载特技播放设置';

  @override
  String get adminEnableHardwareAcceleration => '启用硬件加速';

  @override
  String get adminEnableKeyFrameExtraction => '启用仅提取关键帧';

  @override
  String get adminKeyFrameSubtitle => '速度更快但精度较低';

  @override
  String get adminScanBehavior => '扫描行为';

  @override
  String get adminProcessPriority => '进程优先级';

  @override
  String get adminImageSettings => '图像设置';

  @override
  String get adminIntervalMs => '间隔（毫秒）';

  @override
  String get adminCaptureFrameSubtitle => '捕获帧的频率';

  @override
  String get adminWidthResolutions => '宽度分辨率';

  @override
  String get adminTileWidth => '瓷砖宽度';

  @override
  String get adminTileHeight => '瓷砖高度';

  @override
  String get adminQualitySubtitle => '较低的值=更好的质量，更大的文件';

  @override
  String get adminProcessThreads => '处理线程';

  @override
  String get adminResumeSaved => '恢复已保存的设置';

  @override
  String get adminResumeLoadFailed => '无法加载恢复设置';

  @override
  String get adminResumeDescription => '配置何时应将内容标记为部分播放或完全播放。';

  @override
  String get adminMinResumePercentage => '最低简历百分比';

  @override
  String get adminMinResumeSubtitle => '播放内容必须超过此百分比才能保存进度';

  @override
  String get adminMaxResumePercentage => '最大简历百分比';

  @override
  String get adminMaxResumeSubtitle => '在此百分比之后，内容被视为已完全播放';

  @override
  String get adminMinResumeDuration => '最短恢复持续时间（秒）';

  @override
  String get adminMinResumeDurationSubtitle => '比这短的项目不可恢复';

  @override
  String get adminMinAudiobookResume => '有声读物最低简历百分比';

  @override
  String get adminMaxAudiobookResume => '最大有声读物恢复百分比';

  @override
  String get adminNetworkingSaved => '已保存网络设置。可能需要重新启动服务器。';

  @override
  String get adminNetworkingLoadFailed => '无法加载网络设置';

  @override
  String get adminNetworkingWarning => '更改网络设置可能需要重新启动服务器。';

  @override
  String get adminEnableRemoteAccess => '启用远程访问';

  @override
  String get ports => '港口';

  @override
  String get adminHttpPort => 'HTTP端口';

  @override
  String get adminHttpsPort => 'HTTPS端口';

  @override
  String get adminPublicHttpsPort => '公共 HTTPS 端口';

  @override
  String get adminBaseUrl => '基本网址';

  @override
  String get adminBaseUrlHint => '例如/果冻';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => '启用 HTTPS';

  @override
  String get adminLocalNetwork => '本地网络';

  @override
  String get adminLocalNetworkAddresses => '本地网络地址';

  @override
  String get adminKnownProxies => '已知代理';

  @override
  String get adminRemoteIpFilter => '远程IP过滤';

  @override
  String get adminRemoteIpFilterEntries => '远程IP过滤器';

  @override
  String get adminCertificatePath => '证书路径';

  @override
  String get whitelist => '白名单';

  @override
  String get blacklist => '黑名单';

  @override
  String get notSet => '未设置';

  @override
  String get adminMetadataSaved => '元数据已保存';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => '刷新元数据';

  @override
  String get recursive => '递归';

  @override
  String get adminReplaceAllMetadata => '替换所有元数据';

  @override
  String get adminReplaceAllImages => '替换所有图像';

  @override
  String get adminMetadataRefreshRequested => '请求元数据刷新';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => '搜索远程人员';

  @override
  String get adminNoRemoteMatches => '未找到远程匹配项';

  @override
  String get adminRemoteResults => '远程结果';

  @override
  String get adminRemoteMetadataApplied => '应用远程元数据';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => '更新内容类型';

  @override
  String get adminContentType => '内容类型';

  @override
  String get adminContentTypeUpdated => '内容类型已更新';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => '无法加载元数据编辑器';

  @override
  String get adminNoPeopleEntries => '没有人员条目';

  @override
  String get adminNoExternalIds => '没有可用的外部 ID';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => '不支持的图像格式';

  @override
  String get adminImageReadFailed => '无法读取所选图像';

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
  String get adminAllProviders => '所有提供商';

  @override
  String get adminNoRemoteImages => '未找到远程图像';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => '添加调音器';

  @override
  String get adminTunerType => '调音器类型';

  @override
  String get adminTunerTypeHint => 'HDHomeRun、M3U、其他';

  @override
  String get adminUrlPath => '网址/路径';

  @override
  String get adminNameOptional => '姓名（可选）';

  @override
  String get adminTunerAdded => '添加了调音器';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => '添加向导提供者';

  @override
  String get adminProviderType => '提供商类型';

  @override
  String get adminProviderTypeHint => 'ScheduleDirect 或 XMLTV';

  @override
  String get adminUsernameOptional => '用户名（可选）';

  @override
  String get adminRefreshInterval => '刷新间隔（小时）';

  @override
  String get adminProviderAdded => '提供商已添加';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => '请求重置调谐器';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => '录音设置';

  @override
  String get adminPrePadding => '预填充（分钟）';

  @override
  String get adminPostPadding => '后填充（分钟）';

  @override
  String get adminRecordingPath => '录音路径';

  @override
  String get adminSeriesRecordingPath => '系列录音路径';

  @override
  String get adminRecordingSettingsSaved => '已保存录音设置';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => '设置通道映射';

  @override
  String get adminMappingJson => '映射 JSON';

  @override
  String get adminMappingJsonHint => '示例：映射 JSON 负载';

  @override
  String get adminChannelMappingsUpdated => '频道映射已更新';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => '无法加载直播电视管理';

  @override
  String get adminTunerDevices => '调谐器设备';

  @override
  String get adminNoTunerHosts => '未配置调谐器主机';

  @override
  String get adminGuideProviders => '导游提供者';

  @override
  String get adminAddProvider => '添加提供商';

  @override
  String get adminNoListingProviders => '未配置列表提供商';

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
  String get adminTunerDiscovery => '调音器发现';

  @override
  String get adminChannelMappings => '通道映射';

  @override
  String get adminNoDiscoveredTuners => '尚未发现调谐器';

  @override
  String get adminSettingsSaved => '设置已保存';

  @override
  String get adminBackupsNotAvailable => '备份在此服务器版本上不可用。';

  @override
  String get adminRestoreWarning1 => '恢复将用备份数据替换所有当前服务器数据。';

  @override
  String get adminRestoreWarning2 => '当前的服务器设置、用户和库数据将被覆盖。';

  @override
  String get adminRestoreWarning3 => '恢复后服务器将重新启动。';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested => '已请求恢复。服务器重新启动可能会断开此会话。';

  @override
  String get adminBackupsTitle => '备份';

  @override
  String get adminUnknownDate => '日期未知';

  @override
  String get adminUnnamedBackup => '未命名备份';

  @override
  String get adminLiveTvNotAvailable => '直播电视管理在此服务器版本上不可用。';

  @override
  String get adminLiveTvTitle => '直播电视管理';

  @override
  String get adminApply => '申请';

  @override
  String get adminNotSet => '未设置';

  @override
  String get adminReset => '重置';

  @override
  String get adminLogsTitle => '服务器日志';

  @override
  String get adminLogsNewestFirst => '最新第一';

  @override
  String get adminLogsOldestFirst => '最旧的在前';

  @override
  String get adminLogsJustNow => '现在';

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
  String get adminLogViewerNoMatches => '没有匹配的线';

  @override
  String get adminMetadataEditorTitle => '元数据编辑器';

  @override
  String get adminMetadataRemote => '偏僻的';

  @override
  String get adminMetadataType => '类型';

  @override
  String get adminMetadataDetails => '细节';

  @override
  String get adminMetadataExternalIds => '外部 ID';

  @override
  String get adminMetadataImages => '图片';

  @override
  String get adminMetadataFieldTitle => '标题';

  @override
  String get adminMetadataFieldSortTitle => '排序标题';

  @override
  String get adminMetadataFieldOriginalTitle => '原标题';

  @override
  String get adminMetadataFieldPremiereDate => '首播日期（年-月-日）';

  @override
  String get adminMetadataFieldEndDate => '结束日期（年-月-日）';

  @override
  String get adminMetadataFieldProductionYear => '生产年份';

  @override
  String get adminMetadataFieldOfficialRating => '官方评级';

  @override
  String get adminMetadataFieldCommunityRating => '社区评级';

  @override
  String get adminMetadataFieldCriticRating => '评论家评级';

  @override
  String get adminMetadataFieldTagline => '标语';

  @override
  String get adminMetadataFieldOverview => '概述';

  @override
  String get adminMetadataGenres => '流派';

  @override
  String get adminMetadataTags => '标签';

  @override
  String get adminMetadataStudios => '工作室';

  @override
  String get adminMetadataPeople => '人们';

  @override
  String get adminMetadataAddGenre => '添加流派';

  @override
  String get adminMetadataAddTag => '添加标签';

  @override
  String get adminMetadataAddStudio => '添加工作室';

  @override
  String get adminMetadataAddPerson => '添加人员';

  @override
  String get adminMetadataEditPerson => '编辑人物';

  @override
  String get adminMetadataRole => '角色';

  @override
  String get adminMetadataImagePrimary => '基本的';

  @override
  String get adminMetadataImageBackdrop => '背景';

  @override
  String get adminMetadataImageLogo => '标识';

  @override
  String get adminMetadataImageBanner => '横幅';

  @override
  String get adminMetadataImageThumb => '拇指';

  @override
  String get adminMetadataRecursive => '递归';

  @override
  String get adminMetadataProvider => '提供者';

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
  String get adminMetadataImageReadFailed => '无法读取所选图像';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent => '这将从项目中删除当前图像。';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => '上传';

  @override
  String get adminMetadataUpdate => '更新';

  @override
  String get adminMetadataRemoteImage => '远程图像';

  @override
  String get adminPluginsInstalled => '已安装';

  @override
  String get adminPluginsCatalog => '目录';

  @override
  String get adminPluginsActive => '积极的';

  @override
  String get adminPluginsRestart => '重新启动';

  @override
  String get adminPluginsNoSearchResults => '没有符合您搜索条件的插件';

  @override
  String get adminPluginsNoneInstalled => '没有安装插件';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => '可用更新';

  @override
  String get adminPluginsPendingRemoval => '重启后等待删除';

  @override
  String get adminPluginsChangesPending => '更改待重启';

  @override
  String get adminPluginsEnable => '使能够';

  @override
  String get adminPluginsDisable => '禁用';

  @override
  String get adminPluginsInstallUpdate => '安装更新';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '没有符合您搜索条件的软件包';

  @override
  String get adminPluginsCatalogEmpty => '没有可用的套餐';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => '实验整合';

  @override
  String get adminPluginDetailExperimentalContent =>
      '插件设置集成仍处于实验阶段。某些字段或布局可能尚未正确呈现。';

  @override
  String get adminPluginDetailToggle404 => '无法切换插件。服务器找不到此插件版本。尝试刷新插件，然后重试。';

  @override
  String get adminPluginDetailToggleDioError => '无法切换插件。请检查服务器日志以了解详细信息。';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => '细节';

  @override
  String get adminPluginDetailDeveloper => '开发商';

  @override
  String get adminPluginDetailRepository => '存储库';

  @override
  String get adminPluginDetailBundled => '捆绑式';

  @override
  String get adminPluginDetailEnablePlugin => '启用插件';

  @override
  String get adminPluginDetailRestartRequired => '需要重新启动服务器才能使更改生效。';

  @override
  String get adminPluginDetailRemovalPending => '服务器重启后该插件将被删除。';

  @override
  String get adminPluginDetailMalfunctioned => '该插件出现故障，可能无法正常工作。';

  @override
  String get adminPluginDetailNotSupported => '当前服务器版本不支持此插件。';

  @override
  String get adminPluginDetailSuperseded => '该插件已被新版本取代。';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => '删除存储库';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => '消除';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => '没有配置存储库';

  @override
  String get adminReposEmptySubtitle => '添加存储库以浏览可用插件';

  @override
  String get adminReposUnnamed => '（未命名）';

  @override
  String get adminReposEditTitle => '编辑存储库';

  @override
  String get adminReposAddTitle => '添加存储库';

  @override
  String get adminReposUrl => '存储库网址';

  @override
  String get adminReposNameHint => '例如Jellyfin 稳定';

  @override
  String get adminPluginSettingsInvalidUrl => '无效网址';

  @override
  String get adminGeneralSettingsTitle => '常规设置';

  @override
  String get adminGeneralMetadataLanguage => '首选元数据语言';

  @override
  String get adminGeneralMetadataLanguageHint => '例如英语、德语、法语';

  @override
  String get adminGeneralMetadataCountry => '首选元数据国家/地区';

  @override
  String get adminGeneralMetadataCountryHint => '例如美国、德国、法国';

  @override
  String get adminGeneralLibraryScanConcurrency => '库扫描并发';

  @override
  String get adminGeneralImageEncodingLimit => '并行图像编码限制';

  @override
  String get adminUnknownError => '未知错误';

  @override
  String get adminBrowse => '浏览';

  @override
  String get adminCloseBrowser => '关闭浏览器';

  @override
  String get adminNetworkingTitle => '联网';

  @override
  String get adminNetworkingRestartWarning => '更改网络设置可能需要重新启动服务器。';

  @override
  String get adminNetworkingRemoteAccess => '启用远程访问';

  @override
  String get adminNetworkingPorts => '港口';

  @override
  String get adminNetworkingHttpPort => 'HTTP端口';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS端口';

  @override
  String get adminNetworkingEnableHttps => '启用 HTTPS';

  @override
  String get adminNetworkingLocalNetwork => '本地网络';

  @override
  String get adminNetworkingLocalAddresses => '本地网络地址';

  @override
  String get adminNetworkingAddressHint => '例如192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => '已知代理';

  @override
  String get adminNetworkingProxyHint => '例如10.0.0.1';

  @override
  String get adminNetworkingWhitelist => '白名单';

  @override
  String get adminNetworkingBlacklist => '黑名单';

  @override
  String get adminNetworkingAddEntry => '添加条目';

  @override
  String get adminBrandingTitle => '品牌推广';

  @override
  String get adminBrandingLoginDisclaimer => '登录免责声明';

  @override
  String get adminBrandingLoginDisclaimerHint => 'HTML 显示在登录表单下方';

  @override
  String get adminBrandingCustomCss => '自定义CSS';

  @override
  String get adminBrandingCustomCssHint => '应用于 Web 界面的自定义 CSS';

  @override
  String get adminBrandingEnableSplash => '启用启动画面';

  @override
  String get adminPlaybackHwAccel => '硬件加速';

  @override
  String get adminPlaybackHwAccelLabel => '硬件加速';

  @override
  String get adminPlaybackEnableHwEncoding => '启用硬件编码';

  @override
  String get adminPlaybackEnableHwDecoding => '启用硬件解码：';

  @override
  String get adminPlaybackEncoding => '编码';

  @override
  String get adminPlaybackEncodingThreads => '编码线程';

  @override
  String get adminPlaybackFallbackFont => '启用后备字体';

  @override
  String get adminPlaybackFallbackFontPath => '后备字体路径';

  @override
  String get adminPlaybackStreaming => '流媒体';

  @override
  String get adminResumeVideo => '视频';

  @override
  String get adminResumeAudiobooks => '有声读物';

  @override
  String get adminResumeMinAudiobookPct => '有声读物最低简历百分比';

  @override
  String get adminResumeMaxAudiobookPct => '最大有声读物恢复百分比';

  @override
  String get adminStreamingBitrateLimit => '远程客户端比特率限制 (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => '留空或 0 表示无限制';

  @override
  String get adminTrickplayHwAccel => '启用硬件加速';

  @override
  String get adminTrickplayHwEncoding => '启用硬件编码';

  @override
  String get adminTrickplayKeyFrameOnly => '启用仅提取关键帧';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => '速度更快但精度较低';

  @override
  String get adminTrickplayNonBlocking => '非阻塞';

  @override
  String get adminTrickplayBlocking => '阻塞';

  @override
  String get adminTrickplayPriorityHigh => '高的';

  @override
  String get adminTrickplayPriorityAboveNormal => '高于正常水平';

  @override
  String get adminTrickplayPriorityNormal => '普通的';

  @override
  String get adminTrickplayPriorityBelowNormal => '低于正常水平';

  @override
  String get adminTrickplayPriorityIdle => '闲置的';

  @override
  String get adminTrickplayImageSettings => '图像设置';

  @override
  String get adminTrickplayInterval => '间隔（毫秒）';

  @override
  String get adminTrickplayIntervalSubtitle => '捕获帧的频率';

  @override
  String get adminTrickplayWidthResolutionsHint => '以逗号分隔的像素宽度（例如 320）';

  @override
  String get adminTrickplayQuality => '质量';

  @override
  String get adminTrickplayQScale => '质量规模';

  @override
  String get adminTrickplayQScaleSubtitle => '较低的值=更好的质量，更大的文件';

  @override
  String get adminTrickplayJpegQuality => 'JPEG 质量';

  @override
  String get adminTrickplayProcessing => '加工';

  @override
  String get adminTasksEmpty => '没有找到计划任务';

  @override
  String get adminTasksNoFilterMatch => '没有任务与当前过滤器匹配';

  @override
  String get adminTaskCancelling => '正在取消...';

  @override
  String get adminTaskRunning => '跑步...';

  @override
  String get adminTaskNeverRun => '永远不要跑';

  @override
  String get adminTaskStop => '停止';

  @override
  String get adminTaskRun => '跑步';

  @override
  String get adminTaskDetailLastExecution => '最后执行';

  @override
  String get adminTaskDetailStarted => '开始';

  @override
  String get adminTaskDetailEnded => '结束';

  @override
  String get adminTaskDetailDuration => '期间';

  @override
  String get adminTaskDetailErrorLabel => '错误：';

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
  String get adminTaskTriggerStartup => '应用程序启动时';

  @override
  String get adminTaskTriggerTypeDaily => '日常的';

  @override
  String get adminTaskTriggerTypeWeekly => '每周';

  @override
  String get adminTaskTriggerTypeInterval => '在一个间隔上';

  @override
  String get adminTaskTriggerIntervalLabel => '间隔';

  @override
  String get adminTaskTriggerEveryHour => '每小时';

  @override
  String get adminTaskTriggerEvery6Hours => '每 6 小时';

  @override
  String get adminTaskTriggerEvery12Hours => '每12小时一次';

  @override
  String get adminTaskTriggerEvery24Hours => '每24小时一次';

  @override
  String get adminTaskTriggerEvery2Days => '每2天一次';

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
  String get adminTaskTriggerTime => '时间';

  @override
  String get adminTaskTriggerNoLimit => '无限制';

  @override
  String get adminActivityJustNow => '现在';

  @override
  String get adminActivityLastHour => '最后一小时';

  @override
  String get adminActivityToday => '今天';

  @override
  String get adminActivityYesterday => '昨天';

  @override
  String get adminActivityOlder => '年长的';

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
  String get adminActivityNow => '现在';

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
  String get adminTrickplayDescription => '配置搜索预览缩略图的特技播放图像生成。';

  @override
  String get adminNetworkingPublicHttpsPort => '公共 HTTPS 端口';

  @override
  String get adminNetworkingBaseUrl => '基本网址';

  @override
  String get adminNetworkingBaseUrlHint => '例如/果冻';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => '证书路径';

  @override
  String get adminNetworkingRemoteIpFilter => '远程IP过滤';

  @override
  String get adminNetworkingRemoteIpFilterLabel => '远程IP过滤器';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API装置';

  @override
  String get adminPlaybackAutomatic => '0 = 自动';

  @override
  String get adminPlaybackTranscodeTempPath => '转码临时路径';

  @override
  String get adminPlaybackSegmentDeletion => '允许段删除';

  @override
  String get adminPlaybackSegmentKeep => '段保持（秒）';

  @override
  String get adminPlaybackThrottleBuffering => '油门缓冲';

  @override
  String get adminResumeMinPct => '最低简历百分比';

  @override
  String get adminResumeMinPctSubtitle => '播放内容必须超过此百分比才能保存进度';

  @override
  String get adminResumeMaxPct => '最大简历百分比';

  @override
  String get adminResumeMaxPctSubtitle => '在此百分比之后，内容被视为已完全播放';

  @override
  String get adminResumeMinDuration => '最短恢复持续时间（秒）';

  @override
  String get adminResumeMinDurationSubtitle => '比这短的项目不可恢复';

  @override
  String get adminTrickplayScanBehavior => '扫描行为';

  @override
  String get adminTrickplayProcessPriority => '进程优先级';

  @override
  String get adminTrickplayTileWidth => '瓷砖宽度';

  @override
  String get adminTrickplayTileHeight => '瓷砖高度';

  @override
  String get adminTrickplayProcessThreads => '处理线程';

  @override
  String get adminTrickplayWidthResolutions => '宽度分辨率';

  @override
  String get adminMetadataDefault => '默认';

  @override
  String get adminMetadataContentTypeUpdated => '内容类型已更新';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '慢响应阈值（毫秒）';

  @override
  String get adminGeneralCachePath => '缓存路径';

  @override
  String get adminGeneralMetadataPath => '元数据路径';

  @override
  String get adminGeneralServerName => '服务器名称';

  @override
  String get adminSettingsLoadFailed => '无法加载设置';

  @override
  String get adminDiscover => '发现';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => '文件夹';

  @override
  String get libraries => '图书馆';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay 已禁用';

  @override
  String get syncPlayDisabledMessage => '在“设置”中启用 SyncPlay 以使用同步播放。';

  @override
  String get syncPlayServerUnsupportedTitle => '服务器不受支持';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay 需要 Jellyfin 服务器。目前的服务器不支持。';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay 组';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay 组';

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
  String get syncPlayIgnoreWait => '忽略等待';

  @override
  String get syncPlayIgnoreWaitSubtitle => '当该设备缓冲时，请勿阻止该组';

  @override
  String get syncPlayContinueLocallyNoWait => '在本地继续，无需等待慢速成员';

  @override
  String get syncPlayRepeat => '重复';

  @override
  String get syncPlayRepeatOne => '一';

  @override
  String get syncPlayShuffleModeShuffled => '洗牌';

  @override
  String get syncPlayShuffleModeSorted => '已排序';

  @override
  String get syncPlaySyncCurrentQueue => '同步当前播放队列';

  @override
  String get syncPlaySyncCurrentQueueSubtitle => '将组队列替换为本地正在播放的内容';

  @override
  String get syncPlayLeaveGroup => '离开群组';

  @override
  String get syncPlayGroupQueue => '群组队列';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => '立即播放';

  @override
  String get syncPlayCreateNewGroup => '创建一个新组';

  @override
  String get syncPlayGroupName => '团体名称';

  @override
  String get syncPlayDefaultGroupName => '我的 SyncPlay 群组';

  @override
  String get syncPlayCreateGroup => '创建群组';

  @override
  String get syncPlayAvailableGroups => '可用组';

  @override
  String get syncPlayNoGroupsAvailable => '没有可用的组';

  @override
  String get syncPlayJoinGroupQuestion => '加入 SyncPlay 群组？';

  @override
  String get syncPlayJoinGroupWarning => '加入 SyncPlay 群组可能会取代您当前的播放队列。继续？';

  @override
  String get syncPlayJoin => '加入';

  @override
  String get syncPlayStateIdle => '闲置的';

  @override
  String get syncPlayStateWaiting => '等待';

  @override
  String get syncPlayStatePaused => '已暂停';

  @override
  String get syncPlayStatePlaying => '演奏';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay 访问被拒绝';

  @override
  String get syncPlayAccessDeniedMessage =>
      '您无权访问此 SyncPlay 组中的一项或多项。请组所有者验证库权限或选择其他队列。';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => '语音搜索不可用。';

  @override
  String get dolbyVisionDirectPlayFailedTitle => 'Dolby Vision 直接播放失败';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      '无法启动此 Dolby Vision 流的直接播放。使用服务器转码重试？';

  @override
  String get retryWithTranscode => '重试转码';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision 不支持';

  @override
  String get dolbyVisionNotSupportedMessage =>
      '该设备无法直接解码 Dolby Vision 内容。使用 HDR10 后备或请求服务器转码。';

  @override
  String get rememberMyChoice => '记住我的选择';

  @override
  String get playHdr10Fallback => '播放 HDR10 后备';

  @override
  String get requestTranscode => '请求转码';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      '检测 IAmParadox27 的“主屏幕部分”插件暴露的行。可以在下面启用行并重新排序。';

  @override
  String get homeScreenSectionsIntegrationNoServers => '尚无 Jellyfin 服务器报告该插件。';

  @override
  String get kefinTweaksIntegrationDescription =>
      '检测通过 ranaldsgift 的“KefinTweaks”插件配置的行。自定义部分、最近发布的、再次观看的、季节性的以及最近添加到库中的内容均从每个 Jellyfin 服务器上的 KefinTweaks 配置进行镜像。';

  @override
  String get kefinTweaksIntegrationNoServers =>
      '尚无 Jellyfin 服务器报告 KefinTweaks。';

  @override
  String get integrationOpenHomeSections => '开放主页部分';

  @override
  String get integrationOpenHomeSectionsSubtitle => '启用、禁用和重新排序行';

  @override
  String get integrationInstalledButDisabled => '已安装但已禁用';

  @override
  String get integrationNotInstalled => '未安装';

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
  String get seeAll => '查看全部';

  @override
  String get noItems => '没有商品';

  @override
  String get switchUser => '切换用户';

  @override
  String get remoteControl => '遥控';

  @override
  String get mediaBarLoading => '正在加载媒体栏...';

  @override
  String get mediaBarError => '媒体栏加载失败';

  @override
  String get offlineServerUnavailable => '已连接到互联网，但当前服务器不可用。';

  @override
  String get offlineNoInternet => '您已离线。仅下载的内容可用。';

  @override
  String get offlineFileNotAvailable => '文件不可用';

  @override
  String get offlineSwitchServer => '切换服务器';

  @override
  String get offlineSavedMedia => '保存的媒体';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => '远程回放';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => '设备音量';

  @override
  String get castVolumeUnavailable => '不可用';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => '声音的';

  @override
  String get subtitlesLabel => '字幕';

  @override
  String get pinConfirmTitle => '确认密码';

  @override
  String get pinSetTitle => '设置密码';

  @override
  String get pinEnterTitle => '输入密码';

  @override
  String get pinReenterToConfirm => '重新输入您的 PIN 码进行确认';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN 码不正确';

  @override
  String get pinMismatch => 'PIN 码不匹配';

  @override
  String get pinForgot => '忘记密码？';

  @override
  String get pinClear => '清除';

  @override
  String get pinBackspace => '退格键';

  @override
  String get quickConnectAuthorized => '快速连接请求已获授权。';

  @override
  String get quickConnectInvalidOrExpired => '快速连接代码无效或已过期。';

  @override
  String get quickConnectNotSupported => '此服务器不支持快速连接。';

  @override
  String get quickConnectAuthorizeFailed => '无法授权快速连接代码。';

  @override
  String get quickConnectDisabled => '此服务器上禁用了快速连接。';

  @override
  String get quickConnectForbidden => '您的帐户无法授权此快速连接请求。';

  @override
  String get quickConnectNotFound => '未找到快速连接代码。尝试新的代码。';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => '输入代码';

  @override
  String get quickConnectAuthorize => '授权';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => '遥控';

  @override
  String get remoteFailedToLoadSessions => '无法加载会话';

  @override
  String get remoteNoSessions => '没有可控的会话';

  @override
  String get remoteStartPlayback => '在另一台设备上开始播放';

  @override
  String get unknownUser => '未知';

  @override
  String get unknownItem => '未知';

  @override
  String get remoteNothingPlaying => '此会话中没有播放任何内容';

  @override
  String get castingStarted => '在选定的设备上开始投射';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => '没有可用的远程播放设备。';

  @override
  String get noRemoteDevicesIos =>
      '没有可用的远程播放设备。\n\n在 iOS 上，AirPlay 目标在模拟器中可能不可用。';

  @override
  String get trackActionPlayNext => '播放下一个';

  @override
  String get trackActionAddToQueue => '添加到队列';

  @override
  String get trackActionAddToPlaylist => '添加到播放列表';

  @override
  String get trackActionCancelDownload => '取消下载';

  @override
  String get trackActionDeleteFromPlaylist => '从播放列表中删除';

  @override
  String get trackActionMoveUp => '向上移动';

  @override
  String get trackActionMoveDown => '下移';

  @override
  String get trackActionRemoveFromFavorites => '从收藏夹中删除';

  @override
  String get trackActionAddToFavorites => '添加到收藏夹';

  @override
  String get trackActionGoToAlbum => '前往相册';

  @override
  String get trackActionGoToArtist => '前往艺术家';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => '已删除下载的文件';

  @override
  String get trackActionDeleteFileFailed => '无法删除下载的文件';

  @override
  String get shuffleBy => '随机播放';

  @override
  String get shuffleSelectLibrary => '选择库';

  @override
  String get shuffleSelectGenre => '选择类型';

  @override
  String get shuffleLibrary => '图书馆';

  @override
  String get shuffleGenre => '类型';

  @override
  String get shuffleNoLibraries => '没有可用的兼容库。';

  @override
  String get shuffleNoGenres => '没有找到适合此随机播放模式的流派。';

  @override
  String get posterDisplayTitle => '展示';

  @override
  String get posterImageType => '图片类型';

  @override
  String get imageTypePoster => '海报';

  @override
  String get imageTypeThumbnail => '缩略图';

  @override
  String get imageTypeBanner => '横幅';

  @override
  String get playlistAddFailed => '无法添加到播放列表';

  @override
  String get playlistCreateFailed => '创建播放列表失败';

  @override
  String get playlistNew => '新播放列表';

  @override
  String get playlistCreate => '创造';

  @override
  String get playlistCreateNew => '创建新的播放列表';

  @override
  String get playlistNoneFound => '未找到播放列表';

  @override
  String get addToPlaylist => '添加到播放列表';

  @override
  String get lyricsNotAvailable => '没有可用的歌词';

  @override
  String get upNext => '下一个';

  @override
  String get playNext => '播放下一个';

  @override
  String get stillWatchingContent => '播放已暂停。你还在看吗？';

  @override
  String get stillWatchingStop => '停止';

  @override
  String get stillWatchingContinue => '继续';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => '电视直播';

  @override
  String get continueWatchingAndNextUp => '继续观看并继续观看';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => '下一集';

  @override
  String get moreFromThisSeason => '本季更多内容';

  @override
  String get playerTooltipPlaybackSpeed => '播放速度';

  @override
  String get playerTooltipCastControls => '投射控制';

  @override
  String get playerTooltipPlaybackQuality => '比特率';

  @override
  String get playerTooltipEnterFullscreen => '进入全屏';

  @override
  String get playerTooltipExitFullscreen => '退出全屏';

  @override
  String get playerTooltipFloatOnTop => '浮在上面';

  @override
  String get playerTooltipExitFloatOnTop => '禁用顶部浮动';

  @override
  String get playerTooltipLockLandscape => '锁风景';

  @override
  String get playerTooltipUnlockOrientation => '允许旋转';

  @override
  String get playerTooltipPrevious => '以前的';

  @override
  String get playerTooltipSeekBack => '回头寻找';

  @override
  String get playerTooltipSeekForward => '向前寻求';

  @override
  String get contextMenuMarkWatched => '标记为已观看';

  @override
  String get contextMenuMarkUnwatched => '标记为未观看';

  @override
  String get contextMenuAddToFavorites => '添加到收藏夹';

  @override
  String get contextMenuRemoveFromFavorites => '从收藏夹中删除';

  @override
  String get contextMenuGoToSeries => '前往系列';

  @override
  String get settingsAdministrationSubtitle => '访问服务器管理面板';

  @override
  String get settingsAccountSecurity => '账户与安全';

  @override
  String get settingsAccountSecuritySubtitle => '身份验证、PIN 码和家长控制';

  @override
  String get settingsPersonalization => '个性化';

  @override
  String get settingsPersonalizationSubtitle => '主题、导航、主行和库可见性';

  @override
  String get settingsDynamicContent => '动态内容';

  @override
  String get settingsDynamicContentSubtitle => '媒体栏和视觉覆盖';

  @override
  String get settingsPlaybackSyncplay => '回放 & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle => '音频/视频设置、字幕、下载和 SyncPlay 控件';

  @override
  String get settingsIntegrationsSubtitle => '插件同步、Seerr、评级等';

  @override
  String get settingsAboutSubtitle => '应用程序版本、法律信息和制作人员';

  @override
  String get settingsAuthenticationSection => '验证';

  @override
  String get settingsSortServersBy => '服务器排序依据';

  @override
  String get settingsLastUsed => '最后使用';

  @override
  String get settingsAlphabetical => '按字母顺序';

  @override
  String get settingsPrivacyAndSafetySection => '隐私与安全';

  @override
  String get settingsBlockedRatings => '屏蔽评级';

  @override
  String get settingsGeneralStyle => '通用风格';

  @override
  String get settingsGeneralStyleSubtitle => '主题口音、背景、观看指示器和主题音乐';

  @override
  String get settingsHomePage => '主页';

  @override
  String get settingsHomePageSubtitle => '部分、图像类型、叠加和媒体预览';

  @override
  String get settingsLibrariesSubtitle => '库可见性、文件夹视图和多服务器行为';

  @override
  String get settingsTwentyFourHourClock => '24 小时制';

  @override
  String get settingsTwentyFourHourClockSubtitle => '无论何时显示时钟，都使用 24 小时时间格式';

  @override
  String get settingsShowShuffleButtonInNavigation => '在导航栏中显示随机播放按钮';

  @override
  String get settingsShowGenresButtonInNavigation => '在导航栏中显示流派按钮';

  @override
  String get settingsShowFavoritesButtonInNavigation => '在导航栏中显示收藏夹按钮';

  @override
  String get settingsShowLibrariesButtonInNavigation => '在导航栏中显示库按钮';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      '切换每个库的主页可见性。重新启动 Moonfin 以使更改生效。';

  @override
  String get settingsMediaBarAndLocalPreviews => '媒体栏和本地预览';

  @override
  String get settingsVisualOverlays => '视觉叠加';

  @override
  String get settingsSeasonalSurprise => '季节性惊喜';

  @override
  String get settingsMetadataAndRatings => '元数据和评级';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase 支持服务器端集成，包括附加评级源、Seerr 请求和同步首选项。';

  @override
  String get settingsOfflineDownloads => '离线下载';

  @override
  String get settingsHigh => '高的';

  @override
  String get settingsLow => '低的';

  @override
  String get settingsCustomPath => '自定义路径';

  @override
  String get settingsEnterDownloadFolderPath => '输入下载文件夹路径';

  @override
  String get settingsConcurrentDownloads => '并发下载';

  @override
  String get settingsConcurrentDownloadsDescription => '一次下载的最大项目数。';

  @override
  String get settingsAppInfo => '应用程序信息';

  @override
  String get settingsReportAnIssue => '报告问题';

  @override
  String get settingsReportAnIssueSubtitle => '打开 GitHub 上的问题跟踪器';

  @override
  String get settingsJoinDiscord => '加入 Discord';

  @override
  String get settingsJoinDiscordSubtitle => '与社区聊天';

  @override
  String get settingsJoinTheDiscord => '加入 Discord';

  @override
  String get settingsSupportMoonfin => '支持Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => '合法的';

  @override
  String get settingsLicenses => '许可证';

  @override
  String get settingsOpenSourceLicenseNotices => '开源许可声明';

  @override
  String get settingsPrivacyPolicy => '隐私政策';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin 如何处理您的数据';

  @override
  String get settingsCheckForUpdates => '检查更新';

  @override
  String get settingsCheckForUpdatesSubtitle => '检查最新的 Moonfin 版本';

  @override
  String get settingsPoweredByFlutter => '由颤动提供支持';

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
  String get settingsBoth => '两个都';

  @override
  String get settingsShuffleContentTypeFilter => '随机播放内容类型过滤器';

  @override
  String get settingsVideoPlaybackPreferences => '视频播放首选项';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle => '核心视频引擎和流媒体质量设置';

  @override
  String get settingsAudioPreferences => '音频首选项';

  @override
  String get settingsAudioPreferencesSubtitle => '音轨、处理和直通选项';

  @override
  String get settingsAutomationAndQueue => '自动化和队列';

  @override
  String get settingsAutomationAndQueueSubtitle => '自动播放和排序';

  @override
  String get settingsOfflineDownloadsSubtitle => '下载质量、存储限制和队列大小';

  @override
  String get settingsSyncplaySubtitle => '群组会话的同步逻辑';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      '专业的播放器功能。请谨慎使用，因为某些选项可能会导致播放问题';

  @override
  String get settingsSkipIntrosAndOutros => '跳过片头和片尾？';

  @override
  String get settingsPromptUser => '提示用户';

  @override
  String get settingsSkip => '跳过';

  @override
  String get settingsDoNothing => '什么都不做';

  @override
  String get settingsMaxBitrateDescription => '限制流媒体比特率。高于此阈值的内容将进行转码以适应。';

  @override
  String get settingsMaxResolutionDescription =>
      '限制播放器请求的最大分辨率。更高分辨率的内容将被转码下来。';

  @override
  String get settingsPlayerZoomDescription => '如何缩放视频以适合屏幕。';

  @override
  String get settingsPlaybackEngineAndroidTv => '播放引擎 (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      '选择 Android TV 设备上的默认播放引擎。更改适用于下一个播放会话。';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3（推荐）';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv（旧版）';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision 后备';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      '没有 Dolby Vision 解码的设备上 Dolby Vision 标题的行为。';

  @override
  String get settingsAskEachTime => '每次都询问';

  @override
  String get settingsPreferHdr10Fallback => '更喜欢 HDR10 后备';

  @override
  String get settingsPreferServerTranscode => '首选服务器转码';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision 配置文件 7 直接播放';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      '控制 Dolby Vision 配置文件 7 增强层流是否应直接播放。';

  @override
  String get settingsAutoAftkrtEnabled => '自动（AFTKRT 已启用）';

  @override
  String get settingsEnabledOnThisDevice => '在此设备上启用';

  @override
  String get settingsDisabledPreferTranscode => '已禁用（首选转码）';

  @override
  String get settingsResumeRewindDescription => '恢复播放时（从“继续观看”或媒体项目页面），应倒回多少秒？';

  @override
  String get settingsUnpauseRewindDescription => '按下暂停按钮后恢复播放时，应该倒回多少秒？';

  @override
  String get settingsSkipBackLengthDescription => '按快退按钮后跳回多少秒。';

  @override
  String get settingsOneSecond => '1秒';

  @override
  String get settingsThreeSeconds => '3秒';

  @override
  String get settingsFortyFiveSeconds => '45秒';

  @override
  String get settingsSixtySeconds => '60秒';

  @override
  String get settingsSkipForwardLengthDescription => '按快进按钮后快进多少秒。';

  @override
  String get settingsBitstreamAc3ToExternalDecoder => '比特流 AC3 到外部解码器';

  @override
  String get settingsCinemaMode => '影院模式';

  @override
  String get settingsCinemaModeSubtitle => '在主要功能之前播放预告片/预卷';

  @override
  String get settingsNextUpDisplayDescription =>
      '扩展显示包含剧集插图和​​描述的完整卡片。最小显示紧凑的倒计时叠加。禁用会完全隐藏提示。';

  @override
  String get settingsShort => '短的';

  @override
  String get settingsLong => '长的';

  @override
  String get settingsVeryLong => '很长';

  @override
  String get settingsVideoStartDelay => '视频开始延迟';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => '直播电视直播';

  @override
  String get settingsLiveTvDirectSubtitle => '启用直播电视直接播放';

  @override
  String get settingsOpenGroups => '公开组';

  @override
  String get settingsOpenGroupsSubtitle => '创建、加入或管理 SyncPlay 组';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay 已启用';

  @override
  String get settingsSyncplayEnabledSubtitle => '启用群组观看功能';

  @override
  String get settingsSyncplayButton => 'SyncPlay 按钮';

  @override
  String get settingsSyncplayButtonSubtitle => '在导航栏上显示 SyncPlay 按钮';

  @override
  String get settingsSyncplayAdvancedCorrection => '高级修正';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle => '启用细粒度同步逻辑';

  @override
  String get settingsSyncplaySyncCorrection => '同步校正';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle => '自动调整播放以保持同步';

  @override
  String get settingsSyncplaySpeedToSync => '同步速度';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle => '使用播放速度调整来同步';

  @override
  String get settingsSyncplaySkipToSync => '跳至同步';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => '使用搜索来同步';

  @override
  String get settingsSyncplayMinimumSpeedDelay => '最小速度延迟';

  @override
  String get settingsSyncplayMaximumSpeedDelay => '最大速度延迟';

  @override
  String get settingsSyncplaySpeedDuration => '速度持续时间';

  @override
  String get settingsSyncplayMinimumSkipDelay => '最小跳跃延迟';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay 额外偏移';

  @override
  String get onNow => '现在播出';

  @override
  String get collections => '收藏';

  @override
  String get lastPlayed => '上次玩过';

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

/// The translations for Yue Chinese Cantonese, as used in Hong Kong (`yue_HK`).
class AppLocalizationsYueHk extends AppLocalizationsYue {
  AppLocalizationsYueHk() : super('yue_HK');

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => '登入';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => '快速連接';

  @override
  String get password => '密碼';

  @override
  String get username => '使用者名稱';

  @override
  String get email => '電子郵件';

  @override
  String get quickConnectInstruction => '在伺服器的 Web 儀表板上輸入以下程式碼：';

  @override
  String get waitingForAuthorization => '等待授權...';

  @override
  String get back => '後退';

  @override
  String get serverUnavailable => '伺服器不可用';

  @override
  String get loginFailed => '登入失敗';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => '誰在看？';

  @override
  String get addUser => '新增用戶';

  @override
  String get selectServer => '選擇伺服器';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => '已儲存的伺服器';

  @override
  String get discoveredServers => '發現的伺服器';

  @override
  String get noneFound => '沒有找到';

  @override
  String get unableToConnectToServer => '無法連接到伺服器';

  @override
  String get addServer => '新增伺服器';

  @override
  String get embyConnect => 'Emby 連接';

  @override
  String get removeServer => '刪除伺服器';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => '取消';

  @override
  String get remove => '消除';

  @override
  String get connectToServer => '連接到伺服器';

  @override
  String get serverAddress => '伺服器位址';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => '連接';

  @override
  String get secureStorageUnavailable => '安全儲存不可用';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin 無法存取您的系統金鑰環。登入可以繼續，但在密鑰環解鎖之前，安全令牌儲存可能不可用。';

  @override
  String get ok => '好的';

  @override
  String get settingsAppearanceTheme => '應用主題';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '在 Moonfin 和 Neon Pulse 之間切換，無需重新啟動應用程式';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '目前的 Moonfin 外觀你們都喜歡';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle => 'Synthwave 風格具有洋紅色發光、青色文字和更強的鍍鉻對比度';

  @override
  String get embyConnectSignInSubtitle => '使用您的 Emby Connect 帳戶登入';

  @override
  String get emailOrUsername => '電子郵件或使用者名稱';

  @override
  String get selectAServer => '選擇伺服器';

  @override
  String get tryAgain => '再試一次';

  @override
  String get noLinkedServers => '沒有伺服器連結到該 Emby Connect 帳戶';

  @override
  String get invalidEmbyConnectCredentials => 'Emby Connect 憑證無效';

  @override
  String get invalidEmbyConnectLogin => 'Emby Connect 使用者名稱或密碼無效';

  @override
  String get embyConnectExchangeNotSupported => '伺服器不支援 Emby Connect 交換';

  @override
  String get embyConnectNetworkError => '聯絡 Emby Connect 或所選伺服器時發生網路錯誤';

  @override
  String get loadingLinkedServers => '正在載入連結伺服器...';

  @override
  String get connectingToServerEllipsis => '正在連接到伺服器...';

  @override
  String get noReachableAddress => '未提供可到達的地址';

  @override
  String get invalidServerExchangeResponse => '來自伺服器交換端點的無效回應';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => '退出Moonfin？';

  @override
  String get exitAppConfirmation => '您確定要退出嗎？';

  @override
  String get exit => '出口';

  @override
  String get noHomeRowsLoaded => '無法載入主行';

  @override
  String get noHomeRowsHint => '嘗試刷新或減少活躍的主頁部分。';

  @override
  String get retryHomeRows => '重試主行';

  @override
  String get guide => '指導';

  @override
  String get recordings => '錄音';

  @override
  String get schedule => '行程';

  @override
  String get series => '系列';

  @override
  String get noItemsFound => '沒有找到物品';

  @override
  String get home => '家';

  @override
  String get browseAll => '瀏覽全部';

  @override
  String get genres => '流派';

  @override
  String get collectionPlaceholder => '收藏品會出現在這裡';

  @override
  String get browseByLetter => '按字母瀏覽';

  @override
  String get alphabeticalBrowsePlaceholder => '按字母順序瀏覽將會出現在這裡';

  @override
  String get suggestions => '建議';

  @override
  String get suggestionsPlaceholder => '建議的項目將出現在此處';

  @override
  String get failedToLoadLibraries => '載入庫失敗';

  @override
  String get noLibrariesFound => '沒有找到庫';

  @override
  String get library => '圖書館';

  @override
  String get displaySettings => '顯示設定';

  @override
  String get allGenres => '所有流派';

  @override
  String get noGenresFound => '沒有找到流派';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => '該資料夾是空的';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => '無法加載收藏夾';

  @override
  String get retry => '重試';

  @override
  String get noFavoritesYet => '還沒有收藏夾';

  @override
  String get favorites => '收藏夾';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => '繼續';

  @override
  String get ended => '結束';

  @override
  String get sortAndFilter => '排序和過濾';

  @override
  String get type => '類型';

  @override
  String get sortBy => '排序方式';

  @override
  String get display => '展示';

  @override
  String get imageType => '圖片類型';

  @override
  String get posterSize => '海報尺寸';

  @override
  String get small => '小的';

  @override
  String get medium => '中等的';

  @override
  String get large => '大的';

  @override
  String get extraLarge => '特大號';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => '意見';

  @override
  String get albums => '專輯';

  @override
  String get albumArtists => '專輯藝人';

  @override
  String get artists => '藝術家';

  @override
  String get bookmarks => '書籤';

  @override
  String get noSavedBookmarks => '尚未儲存該標題的書籤。';

  @override
  String get openBook => '打開書本';

  @override
  String get chapter => '章';

  @override
  String get page => '頁';

  @override
  String get bookmark => '書籤';

  @override
  String get justNow => '現在';

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
  String get discoverySubjects => '發現主題';

  @override
  String get pickDiscoverySubjects => '選擇要在「發現」中顯示的主題來源。';

  @override
  String get apply => '申請';

  @override
  String get openLink => '打開連結';

  @override
  String get scanWithYourPhone => '用手機掃描';

  @override
  String get audiobookGenres => '有聲書流派';

  @override
  String get pickAudiobookGenres => '選擇要在有聲書探索中顯示的流派。';

  @override
  String get discoverAudiobooks => '發現有聲書';

  @override
  String get librivoxDescription => '來自 LibriVox 的熱門公共領域標題。';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => '向左滾動';

  @override
  String get scrollRight => '向右滾動';

  @override
  String get couldNotLoadGenre => '目前無法載入此類型。';

  @override
  String get continueReading => '繼續閱讀';

  @override
  String get savedHighlights => '已保存的精彩集錦';

  @override
  String get continueListening => '繼續收聽';

  @override
  String get listen => '聽';

  @override
  String get resume => '恢復';

  @override
  String get failedToLoadLibrary => '載入庫失敗';

  @override
  String get popularNow => '現在流行';

  @override
  String get savedForLater => '儲存以供稍後使用';

  @override
  String get topListens => '熱門收聽';

  @override
  String get unreadDiscoveries => '未讀的發現';

  @override
  String get pickUpAgain => '再次拾起';

  @override
  String get bookHighlightsDescription => '您的書籍包含亮點、收藏夾或閱讀進度。';

  @override
  String get handPickedFromLibrary => '從您的圖書館中精心挑選的。';

  @override
  String get handPickedFromListeningQueue => '從您的收聽隊列中精心挑選。';

  @override
  String get booksWithHighlights => '包含亮點、最愛或閱讀進度的書籍。';

  @override
  String get jumpBackNarration => '跳回旁白，無需尋找自己的位置。';

  @override
  String get unreadBooksReady => '未讀的書準備好迎接下一個安靜的時刻。';

  @override
  String get quickAccessFavorites => '快速存取您經​​常閱讀的書籍。';

  @override
  String get searchAudiobooks => '搜尋有聲書';

  @override
  String get searchYourLibrary => '搜尋您的圖書館';

  @override
  String get pickUpStory => '從上次停下的地方繼續講故事';

  @override
  String get savedPlacesChapters => '您保存的地點和未完成的章節';

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
  String get readyWhenYouAre => '當你準備好時';

  @override
  String get details => '細節';

  @override
  String get listeningRoom => '聽音室';

  @override
  String get bookmarksAndProgress => '書籤和進度';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => '標題';

  @override
  String get allTitles => '所有標題';

  @override
  String get authors => '作者';

  @override
  String get browseByAuthor => '按作者瀏覽';

  @override
  String get browseByGenre => '按類型瀏覽';

  @override
  String get discover => '發現';

  @override
  String get trendingTitlesOpenLibrary => 'Open Library 中按主題劃分的熱門標題。';

  @override
  String get noBookmarkedItems => '還沒有加書籤的項目';

  @override
  String get nothingMatchesSection => '還沒有與此部分相符的內容。嘗試另一個選項卡或在庫同步完成後返回。';

  @override
  String get audiobooks => '有聲書';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => '資料夾';

  @override
  String get filters => '過濾器';

  @override
  String get readingStatus => '閱讀狀態';

  @override
  String get playedStatus => '播放狀態';

  @override
  String get readStatus => '讀';

  @override
  String get watched => '看過';

  @override
  String get unread => '未讀';

  @override
  String get unwatched => '無人看管';

  @override
  String get seriesStatus => '系列狀態';

  @override
  String get allLibraries => '所有圖書館';

  @override
  String get books => '圖書';

  @override
  String get author => '作者';

  @override
  String get unknownAuthor => '作者未知';

  @override
  String get uncategorized => '未分類';

  @override
  String get overview => '概述';

  @override
  String get noLibrivoxDescription => 'LibriVox 尚未為此標題提供任何描述。';

  @override
  String get readers => '讀者';

  @override
  String get openLinks => '打開連結';

  @override
  String get librivoxPage => 'LibriVox 頁';

  @override
  String get internetArchive => '互聯網檔案館';

  @override
  String get rssFeed => 'RSS 來源';

  @override
  String get downloadZip => '下載郵編';

  @override
  String sectionCountLabel(int count) {
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
  }

  @override
  String get noOpenLibraryOverview => 'Open Library 尚未提供此標題的概述。';

  @override
  String get subjects => '科目';

  @override
  String get all => '全部';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => '目前無法載入該主題。';

  @override
  String get audiobookDetails => '有聲書詳情';

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
  String get trackList => '曲目表';

  @override
  String get itemListPlaceholder => '項目清單將會出現在這裡';

  @override
  String get favoriteTracksPlaceholder => '最喜歡的曲目將會出現在這裡';

  @override
  String get failedToLoad => '載入失敗';

  @override
  String get delete => '刪除';

  @override
  String get save => '節省';

  @override
  String get moreLikeThis => '更多類似的';

  @override
  String get castAndCrew => '演職人員';

  @override
  String get collection => '收藏';

  @override
  String get episodes => '劇集數';

  @override
  String get nextUp => '下一步';

  @override
  String get seasons => '季節';

  @override
  String get chapters => '章節';

  @override
  String get features => '特徵';

  @override
  String get movies => '電影';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => '其他';

  @override
  String get discography => '唱片目錄';

  @override
  String get similarArtists => '類似的藝術家';

  @override
  String get tableOfContents => '目錄';

  @override
  String get tracklist => '曲目表';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => '傳';

  @override
  String get authorDetails => '作者詳細信息';

  @override
  String get noOverviewAvailable => '尚無此標題的概述。';

  @override
  String get noBiographyAvailable => '沒有該作者的傳記。';

  @override
  String get noBooksFound => '沒有找到該作者的書籍。';

  @override
  String get unableToLoadAuthorDetails => '目前無法載入作者詳細資料。';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => '出版日期未知';

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
  String get view => '看法';

  @override
  String get resumeReading => '繼續閱讀';

  @override
  String get read => '讀';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => '玩';

  @override
  String get startOver => '重新開始';

  @override
  String get restart => '重新啟動';

  @override
  String get readOffline => '離線閱讀';

  @override
  String get playOffline => '離線玩';

  @override
  String get audio => '聲音的';

  @override
  String get subtitles => '字幕';

  @override
  String get version => '版本';

  @override
  String get cast => '投擲';

  @override
  String get trailer => '拖車';

  @override
  String get finished => '完成的';

  @override
  String get favorited => '已收藏';

  @override
  String get favorite => '最喜歡的';

  @override
  String get playlist => '播放清單';

  @override
  String get downloaded => '已下載';

  @override
  String get downloadAll => '下載全部';

  @override
  String get download => '下載';

  @override
  String get deleteDownloaded => '刪除已下載';

  @override
  String get goToSeries => '前往系列';

  @override
  String get editMetadata => '編輯元數據';

  @override
  String get less => '較少的';

  @override
  String get more => '更多的';

  @override
  String get deleteItem => '刪除項目';

  @override
  String get deletePlaylist => '刪除播放清單';

  @override
  String get deletePlaylistMessage => '從伺服器刪除此播放清單？';

  @override
  String get deleteItemMessage => '從伺服器刪除此項目？';

  @override
  String get failedToDeletePlaylist => '刪除播放清單失敗';

  @override
  String get failedToDeleteItem => '刪除項目失敗';

  @override
  String get renamePlaylist => '重新命名播放列表';

  @override
  String get playlistName => '播放清單名稱';

  @override
  String get deleteDownloadedAlbum => '刪除下載的相冊';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => '下載的曲目已刪除';

  @override
  String get downloadedTracksDeleteFailed => '某些下載的曲目無法刪除';

  @override
  String get noTracksLoaded => '未載入曲目';

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
  String get itemDeleted => '項目已刪除';

  @override
  String get noPlayableTrailerFound => '找不到可播放的預告片。';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => '音軌';

  @override
  String get subtitleTrack => '字幕軌道';

  @override
  String get none => '沒有任何';

  @override
  String get downloadSubtitlesLabel => '下載字幕...';

  @override
  String get searchOpenSubtitlesPlugin => '使用 OpenSubtitles 插件進行搜尋';

  @override
  String get downloadSubtitles => '下載字幕';

  @override
  String get selectedSubtitleInvalid => '所選的字幕無效。';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      '字幕已下載。當 Jellyfin 刷新項目時，可能需要一些時間才會出現。';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => '選擇版本';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => '下載全部 — 質量';

  @override
  String get downloadQuality => '下載品質';

  @override
  String get originalFileNoReencoding => '原始文件，無需重新編碼';

  @override
  String get originalFilesNoReencoding => '原始文件，無需重新編碼';

  @override
  String get noEpisodesLoaded => '沒有載入劇集';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => '刪除下載的文件';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => '下載的檔案已刪除';

  @override
  String get failedToDeleteFiles => '刪除檔案失敗';

  @override
  String get deleteFiles => '刪除文件';

  @override
  String get director => '導演';

  @override
  String get writers => '作家';

  @override
  String get studio => '工作室';

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
  String get showLess => '顯示更少';

  @override
  String get readMore => '閱讀更多';

  @override
  String get shuffle => '隨機播放';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => '完美搭配';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => '單核白血球增多症';

  @override
  String get stereo => '立體聲';

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
  String get deleteSeasonFiles => '本季所有下載的劇集';

  @override
  String get stillWatching => '還在觀看嗎？';

  @override
  String get unableToLoadTrailerStream => '無法載入預告片流。';

  @override
  String get trailerTimedOut => '拖車加載時逾時。';

  @override
  String get playbackFailedForTrailer => '該預告片播放失敗。';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline => '離線播放時無法進行投射。';

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
  String get deviceVolume => '裝置音量';

  @override
  String get unavailable => '不可用';

  @override
  String get pause => '暫停';

  @override
  String get syncPosition => '同步位置';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => '隊列為空';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => '遠端回放';

  @override
  String get castingToGoogleCast => '轉換為 Google Cast';

  @override
  String get castingViaAirPlay => '透過 AirPlay 進行投射';

  @override
  String get castingViaDlna => '透過 DLNA 進行投射';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => '長按解鎖';

  @override
  String get off => '離開';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => '汽車';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => '比特率覆蓋';

  @override
  String get audioDelay => '音訊延遲';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => '字幕延遲';

  @override
  String get reset => '重置';

  @override
  String get unknown => '未知';

  @override
  String get playbackInformation => '播放訊息';

  @override
  String get playback => '回放';

  @override
  String get playMethod => '玩法';

  @override
  String get directPlay => '直接播放';

  @override
  String get directStream => '直接串流';

  @override
  String get transcoding => '轉碼';

  @override
  String get transcodeReasons => '轉碼原因';

  @override
  String get player => '玩家';

  @override
  String get container => '容器';

  @override
  String get bitrate => '位元率';

  @override
  String get video => '影片';

  @override
  String get resolution => '解決';

  @override
  String get hdr => '高動態範圍';

  @override
  String get codec => '編解碼器';

  @override
  String get videoBitrate => '視訊比特率';

  @override
  String get track => '追蹤';

  @override
  String get channels => '頻道';

  @override
  String get audioBitrate => '音訊比特率';

  @override
  String get sampleRate => '取樣率';

  @override
  String get format => '格式';

  @override
  String get external => '外部的';

  @override
  String get embedded => '嵌入式';

  @override
  String castSessionError(String protocol) {
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform => '應用程式內 EPUB 渲染在此平台上尚不可用。';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable => '嵌入式文件渲染在此平台上不可用。';

  @override
  String get couldNotOpenExternalViewer => '無法開啟外部檢視器。';

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
  String get noBookmarksYet => '還沒有書籤。\n閱讀時點擊書籤圖示即可儲存您的位置。';

  @override
  String get noTableOfContentsAvailable => '沒有可用的目錄';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => '位置';

  @override
  String get bookReader => '圖書閱讀器';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => '更新中...';

  @override
  String get markUnread => '標記為未讀';

  @override
  String get markAsRead => '標記為已讀';

  @override
  String get reloadReader => '重新加載閱讀器';

  @override
  String get noPagesFound => '未找到頁面。';

  @override
  String get failedToDecodePageImage => '無法解碼頁面圖像。';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => '單頁';

  @override
  String get twoPageSpread => '兩頁跨頁';

  @override
  String get addBookmark => '新增書籤';

  @override
  String get bookmarksEllipsis => '書籤...';

  @override
  String get markedAsRead => '標記為已讀';

  @override
  String get markedAsUnread => '標記為未讀';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => '主題：系統';

  @override
  String get themeLight => '主題：光';

  @override
  String get themeDark => '主題：黑暗';

  @override
  String get themeSepia => '主題： 棕褐色';

  @override
  String get invertColorsFixedLayout => '反轉顏色（固定佈局）';

  @override
  String get invertColorsPdf => '反轉顏色 (PDF)';

  @override
  String get preparingInAppReader => '正在準備應用程式內閱讀器...';

  @override
  String get pdfDataNotAvailable => 'PDF 數據不可用。';

  @override
  String get readerFallbackModeActive => '讀卡機回退模式已激活';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      '切換到支援的平台目標（Android、iOS、macOS）後使用 Reload Reader。';

  @override
  String get openExternally => '對外開放';

  @override
  String get noEpubChaptersFound => '未找到 EPUB 章節。';

  @override
  String get readerNotReady => '讀者還沒準備好。';

  @override
  String get seriesRecordings => '系列錄音';

  @override
  String get now => '現在';

  @override
  String get sports => '運動的';

  @override
  String get news => '訊息';

  @override
  String get kids => '孩子們';

  @override
  String get premiere => '首播';

  @override
  String get guideTimeline => '指南時間表';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => '沒有找到頻道';

  @override
  String get liveBadge => '居住';

  @override
  String get movie => '電影';

  @override
  String get removedFromFavoriteChannels => '已從喜愛的頻道中刪除';

  @override
  String get addedToFavoriteChannels => '加入到喜愛的頻道';

  @override
  String get failedToUpdateFavoriteChannel => '更新收藏頻道失敗';

  @override
  String get unfavoriteChannel => '不喜歡的頻道';

  @override
  String get favoriteChannel => '最喜歡的頻道';

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
  String get watch => '手錶';

  @override
  String get close => '關閉';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => '載入錄音失敗';

  @override
  String get scheduledInNext24Hours => '預計未來 24 小時內';

  @override
  String get recentRecordings => '最近的錄音';

  @override
  String get tvSeries => '電視劇';

  @override
  String get failedToLoadSchedule => '加載時間表失敗';

  @override
  String get noScheduledRecordings => '沒有預定的錄音';

  @override
  String get cancelRecording => '取消錄音？';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => '不';

  @override
  String get yesCancel => '是，取消';

  @override
  String get failedToCancelRecording => '取消錄音失敗';

  @override
  String get failedToLoadSeriesRecordings => '無法載入系列錄音';

  @override
  String get noSeriesRecordings => '沒有系列錄音';

  @override
  String get cancelSeriesRecording => '取消系列錄音';

  @override
  String get cancelSeriesRecordingQuestion => '取消系列錄製？';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => '取消連續錄製失敗';

  @override
  String get searchThisLibrary => '搜尋這個圖書館...';

  @override
  String get searchEllipsis => '搜尋...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => '塞爾';

  @override
  String get seerrAccountType => '西爾帳戶類型';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => '當地的';

  @override
  String get savedMedia => '保存的媒體';

  @override
  String get tvShows => '電視節目';

  @override
  String get music => '音樂';

  @override
  String get musicAlbums => '音樂專輯';

  @override
  String get noMediaInFilter => '此過濾器中沒有介質';

  @override
  String get noDownloadedMediaYet => '還沒下載的媒體';

  @override
  String get browseLibrary => '瀏覽圖書館';

  @override
  String get deleteDownload => '刪除下載';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => '專輯';

  @override
  String get playAlbum => '播放專輯';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => '季節';

  @override
  String get errorLoadingEpisodes => '載入劇集時出錯';

  @override
  String get noDownloadedEpisodes => '沒有下載的劇集';

  @override
  String get deleteEpisode => '刪除劇集';

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
  String get seriesNotFound => '未找到系列';

  @override
  String get errorLoadingSeries => '載入系列時出錯';

  @override
  String get downloadedEpisodes => '下載劇集';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => '特價商品';

  @override
  String get deleteSeason => '刪除季節';

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
  String get storageManagement => '儲存管理';

  @override
  String get storageBreakdown => '儲存細分';

  @override
  String get downloadedItems => '下載的項目';

  @override
  String get storageLimit => '儲存限制';

  @override
  String get noLimit => '無限制';

  @override
  String get deleteAllDownloads => '刪除所有下載';

  @override
  String get deleteAllDownloadsWarning => '這將刪除所有下載的媒體檔案並且無法撤銷。';

  @override
  String get deleteAll => '全部刪除';

  @override
  String get deleteSelected => '刪除所選內容';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => '音樂和有聲讀物';

  @override
  String get images => '圖片';

  @override
  String get database => '資料庫';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => '設定';

  @override
  String get authentication => '驗證';

  @override
  String get autoLoginServerManagement => '自動登入、伺服器管理';

  @override
  String get pinCode => '密碼';

  @override
  String get setUpPinCodeProtection => '設定 PIN 碼保護';

  @override
  String get parentalControls => '家長監護';

  @override
  String get contentRatingRestrictions => '內容分級限制';

  @override
  String get bitRateResolutionBehavior => '比特率、解析度、行為';

  @override
  String get languageSizeAppearance => '語言、大小、外觀';

  @override
  String get qualityStorage => '品質、儲存';

  @override
  String get serverSyncAndPluginStatus => '伺服器同步和插件狀態';

  @override
  String get mediaRequestIntegration => '媒體請求集成';

  @override
  String get switchServer => '切換伺服器';

  @override
  String get signOut => '登出';

  @override
  String get versionLicenses => '版本、許可證';

  @override
  String get account => '帳戶';

  @override
  String get signInAndSecurity => '登入和安全';

  @override
  String get administration => '行政';

  @override
  String get serverSettingsUsersLibraries => '伺服器設定、使用者、函式庫';

  @override
  String get customization => '客製化';

  @override
  String get themeAndLayout => '主題和佈局';

  @override
  String get videoAndSubtitles => '視訊和字幕';

  @override
  String get integrations => '整合';

  @override
  String get pluginAndRequests => '插件和請求';

  @override
  String get customizeAccountPlaybackInterface => '自訂帳戶、播放和介面行為';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => '主題與外觀';

  @override
  String get focusBorderColor => '焦點邊框顏色';

  @override
  String get watchedIndicators => '觀察指標';

  @override
  String get always => '總是';

  @override
  String get hideUnwatched => '隱藏無人監視';

  @override
  String get episodesOnly => '僅限劇集';

  @override
  String get never => '絕不';

  @override
  String get focusExpansionAnimation => '焦點擴展動畫';

  @override
  String get desktopUiScale => '桌面 UI 比例';

  @override
  String get scaleFocusedCards => '縮放聚焦或懸停的卡片和圖塊';

  @override
  String get backgroundBackdrops => '背景背景';

  @override
  String get showBackdropImages => '顯示內容後面的背景影像';

  @override
  String get seriesThumbnails => '系列縮圖';

  @override
  String get seriesThumbnailsDescription => '僅劇集：使用與每行影像類型相符的系列圖稿';

  @override
  String get homeRowInfoOverlay => '主行資訊疊加';

  @override
  String get showTitleMetadataOnHomeRows => '瀏覽主行時顯示標題和元數據';

  @override
  String get clockDisplay => '時鐘顯示';

  @override
  String get inMenus => '在選單中';

  @override
  String get inVideo => '影片中';

  @override
  String get seasonalEffects => '季節性影響';

  @override
  String get seasonalEffectsDescription => '視覺效果和季節性裝飾';

  @override
  String get snow => '雪';

  @override
  String get fireworks => '煙火';

  @override
  String get confetti => '五彩紙屑';

  @override
  String get fallingLeaves => '落葉';

  @override
  String get themeMusic => '主題音樂';

  @override
  String get playThemeMusicOnDetailPages => '在詳情頁播放主題音樂';

  @override
  String get themeMusicVolume => '主題音樂音量';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => '主行主題音樂';

  @override
  String get playWhenBrowsingHomeScreen => '瀏覽主畫面時播放';

  @override
  String get detailsBackgroundBlur => '細節背景模糊';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => '正在瀏覽背景模糊';

  @override
  String get maxStreamingBitrate => '最大串流媒體位元率';

  @override
  String get maxResolution => '最大解析度';

  @override
  String get playerZoomMode => '播放器縮放模式';

  @override
  String get fit => '合身';

  @override
  String get autoCrop => '自動裁切';

  @override
  String get stretch => '拉緊';

  @override
  String get refreshRateSwitching => '刷新率切換';

  @override
  String get disabled => '殘障人士';

  @override
  String get scaleOnTv => '在電視上縮放';

  @override
  String get scaleOnDevice => '在裝置上擴展';

  @override
  String get trickPlay => '特技遊戲';

  @override
  String get showPreviewThumbnailsWhenSeeking => '搜尋時顯示預覽縮圖';

  @override
  String get showDescriptionOnPause => '顯示暫停說明';

  @override
  String get dimVideoShowOverview => '暫停時調暗影片並顯示概述文本';

  @override
  String get osdLockButton => 'OSD 鎖定按鈕';

  @override
  String get osdLockButtonDescription => '顯示一個鎖定按鈕，該按鈕會阻止觸控輸入，直到長按為止';

  @override
  String get audioBehavior => '音訊行為';

  @override
  String get downmixToStereo => '縮混至立體聲';

  @override
  String get defaultAudioLanguage => '預設音訊語言';

  @override
  String get autoServerDefault => '自動（伺服器預設）';

  @override
  String get english => '英語';

  @override
  String get spanish => '西班牙語';

  @override
  String get french => '法語';

  @override
  String get german => '德文';

  @override
  String get italian => '義大利語';

  @override
  String get portuguese => '葡萄牙語';

  @override
  String get japanese => '日本人';

  @override
  String get korean => '韓國人';

  @override
  String get chinese => '中國人';

  @override
  String get russian => '俄文';

  @override
  String get arabic => '阿拉伯';

  @override
  String get hindi => '印地語';

  @override
  String get dutch => '荷蘭語';

  @override
  String get swedish => '瑞典';

  @override
  String get norwegian => '挪威';

  @override
  String get danish => '丹麥語';

  @override
  String get finnish => '芬蘭';

  @override
  String get polish => '拋光';

  @override
  String get ac3Passthrough => 'AC3直通';

  @override
  String get dtsPassthrough => 'DTS直通';

  @override
  String get trueHdSupport => 'TrueHD 支持';

  @override
  String get enableDtsPassthrough => '僅限 AVR 的比特流 DTS 音訊；需要接收器支援和 DTS 源軌道';

  @override
  String get enableTrueHdAudio => '啟用 TrueHD 音訊（可能不適用於所有平台）';

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
  String get nightMode => '夜間模式';

  @override
  String get compressDynamicRange => '壓縮動態範圍';

  @override
  String get advancedMpv => '進階 mpv';

  @override
  String get enableCustomMpvConf => '啟用自訂 mpv.conf';

  @override
  String get applyMpvConfBeforePlayback => '在播放開始之前應用使用者指定的 mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => '不安全的進階 mpv 選項';

  @override
  String get unsafeMpvOptionsDescription => '允許更廣泛的 mpv 選項。可能會破壞播放行為。';

  @override
  String get hardwareDecoding => '硬體解碼';

  @override
  String get hardwareDecodingSubtitle => '可能會提高效能，但可能會導致某些裝置上的播放問題。';

  @override
  String get nextUpAndQueuing => '下次和排隊';

  @override
  String get nextUpDisplay => '下一個顯示';

  @override
  String get extended => '擴充';

  @override
  String get minimal => '最小';

  @override
  String get nextUpTimeout => '下一個超時';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => '媒體排隊';

  @override
  String get autoQueueNextEpisodes => '自動排隊下一集';

  @override
  String get stillWatchingPrompt => '仍在觀看提示';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => '繼續和跳過';

  @override
  String get resumeRewind => '恢復倒帶';

  @override
  String get unpauseRewind => '取消暫停倒帶';

  @override
  String get fiveSeconds => '5秒';

  @override
  String get tenSeconds => '10秒';

  @override
  String get fifteenSeconds => '15秒';

  @override
  String get thirtySeconds => '30秒';

  @override
  String get skipBackLength => '向後跳長度';

  @override
  String get skipForwardLength => '向前跳過長度';

  @override
  String get customMpvConfPath => '自訂 mpv.conf 路徑';

  @override
  String get notSetMpvConf => '未設定。 Moonfin 將嘗試應用程式/資料資料夾中的預設 mpv.conf。';

  @override
  String get selectMpvConf => '選擇mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      '樣式設定（大小、顏色、偏移）適用於基於文字的字幕（SRT、VTT、TTML）。除非關閉“ASS/SSA Direct Play”，否則 ASS/SSA 字幕將使用自己的嵌入樣式。點陣圖字幕（PGS、DVB、VobSub）無法重新設計樣式。';

  @override
  String get defaultSubtitleLanguage => '預設字幕語言';

  @override
  String get defaultToNoSubtitles => '預設為無字幕';

  @override
  String get turnOffSubtitlesByDefault => '預設關閉字幕';

  @override
  String get subtitleSize => '字幕大小';

  @override
  String get textFillColor => '文字填滿顏色';

  @override
  String get backgroundColor => '背景顏色';

  @override
  String get textStrokeColor => '文字描邊顏色';

  @override
  String get subtitleCustomization => '字幕客製';

  @override
  String get subtitleCustomizationDescription => '自訂字幕外觀';

  @override
  String get subtitlePreviewText => '敏捷的棕色狐狸跳過了懶狗';

  @override
  String get verticalOffset => '垂直偏移';

  @override
  String get pgsDirectPlay => 'PGS 直接比賽';

  @override
  String get directPlayPgsSubtitles => '直接播放PGS字幕';

  @override
  String get assSsaDirectPlay => 'ASS/SSA 直接播放';

  @override
  String get directPlayAssSsaSubtitles => '直接播放ASS/SSA字幕';

  @override
  String get white => '白色的';

  @override
  String get black => '黑色的';

  @override
  String get yellow => '黃色的';

  @override
  String get green => '綠色的';

  @override
  String get cyan => '青色';

  @override
  String get red => '紅色的';

  @override
  String get transparent => '透明的';

  @override
  String get semiTransparentBlack => '半透明黑色';

  @override
  String get global => '全球的';

  @override
  String get desktop => '桌面';

  @override
  String get mobile => '移動的';

  @override
  String get tv => '電視';

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
  String get customizationProfile => '客製化簡介';

  @override
  String get customizationProfileDescription =>
      '選擇要載入、編輯和同步的設定檔。全域適用於任何地方，除非設備設定檔覆蓋它。綠點標記您目前的設備設定檔。';

  @override
  String get loadProfile => '負載曲線';

  @override
  String get syncing => '正在同步...';

  @override
  String get syncToProfile => '同步到設定檔';

  @override
  String get profileSyncHidden => '設定檔同步隱藏';

  @override
  String get enablePluginSyncDescription => '在插件設定中啟用伺服器插件同步以在此處顯示設定檔控制項。';

  @override
  String get quality => '品質';

  @override
  String get defaultDownloadQuality => '預設下載品質';

  @override
  String get network => '網路';

  @override
  String get wifiOnlyDownloads => '僅 WiFi 下載';

  @override
  String get onlyDownloadOnWifi => '僅在連接 WiFi 時下載';

  @override
  String get storage => '貯存';

  @override
  String get storageUsed => '已用儲存空間';

  @override
  String get manage => '管理';

  @override
  String get calculating => '正在計算...';

  @override
  String get downloadLocation => '下載位置';

  @override
  String get defaultLabel => '預設';

  @override
  String get saveToDownloadsFolder => '儲存到下載資料夾';

  @override
  String get downloadsVisibleToOtherApps => 'Downloads/Moonfin — 對其他應用程式可見';

  @override
  String get dangerZone => '危險區';

  @override
  String get clearAllDownloads => '清除所有下載';

  @override
  String get original => '原來的';

  @override
  String get changeDownloadLocation => '更改下載位置';

  @override
  String get changeDownloadLocationDescription =>
      '新下載的內容將會儲存到所選資料夾中。現有下載將保留在目前位置，並且可以透過儲存設定進行管理。';

  @override
  String get confirm => '確認';

  @override
  String get cannotWriteToFolder => '無法寫入選定的資料夾。請選擇其他位置或授予儲存權限。';

  @override
  String get saveToDownloadsFolderQuestion => '儲存到下載資料夾嗎？';

  @override
  String get saveToDownloadsFolderDescription =>
      '下載的媒體將會儲存到您裝置上的 Downloads/Moonfin 中。這些檔案將對其他應用程式可見，例如您的圖庫或音樂播放器。\n\n現有下載將保留在目前位置。';

  @override
  String get enable => '使能夠';

  @override
  String get clearAllDownloadsWarning => '這將刪除所有下載的媒體並且無法撤銷。';

  @override
  String get clearAll => '全部清除';

  @override
  String get navigationStyle => '導航風格';

  @override
  String get topBar => '頂欄';

  @override
  String get leftSidebar => '左側邊欄';

  @override
  String get showShuffleButton => '顯示隨機播放鈕';

  @override
  String get showGenresButton => '顯示流派按鈕';

  @override
  String get showFavoritesButton => '顯示收藏夾按鈕';

  @override
  String get showLibrariesInToolbar => '在工具列中顯示庫';

  @override
  String get navbarOpacity => '導覽列不透明度';

  @override
  String get navbarColor => '導覽列顏色';

  @override
  String get gray => '灰色的';

  @override
  String get darkBlue => '深藍色';

  @override
  String get purple => '紫色的';

  @override
  String get teal => '青色';

  @override
  String get navy => '海軍';

  @override
  String get charcoal => '木炭';

  @override
  String get brown => '棕色的';

  @override
  String get darkRed => '深紅色';

  @override
  String get darkGreen => '深綠色';

  @override
  String get slate => '石板';

  @override
  String get indigo => '靛青';

  @override
  String get libraryDisplay => '圖書館展示';

  @override
  String get posterLabel => '海報';

  @override
  String get thumbnailLabel => '縮圖';

  @override
  String get bannerLabel => '橫幅';

  @override
  String get overridePerLibrarySettings => '覆蓋每個庫的設置';

  @override
  String get applyImageTypeToAllLibraries => '將影像類型套用至所有函式庫';

  @override
  String get multiServerLibraries => '多伺服器庫';

  @override
  String get showLibrariesFromAllServers => '顯示所有連接伺服器的庫';

  @override
  String get enableFolderView => '啟用資料夾視圖';

  @override
  String get showFolderBrowsingOption => '顯示資料夾瀏覽選項';

  @override
  String get libraryVisibility => '圖書館可見性';

  @override
  String get libraryVisibilityDescription => '切換每個庫的主頁可見性。重新啟動 Moonfin 以使變更生效。';

  @override
  String get showInNavigation => '在導航中顯示';

  @override
  String get showInLatestMedia => '在最新媒體上展示';

  @override
  String get sourceLibraries => '來源庫';

  @override
  String get sourceCollections => '來源集';

  @override
  String get excludedGenres => '排除的類型';

  @override
  String get selectAll => '選擇全部';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => '媒體欄';

  @override
  String get mediaSources => '媒體來源';

  @override
  String get behavior => '行為';

  @override
  String get seconds => '秒';

  @override
  String get localPreviews => '本地預覽';

  @override
  String get localPreviewsDescription => '配置預告片、媒體和音訊預覽。';

  @override
  String get mediaBarMode => '媒體欄風格';

  @override
  String get mediaBarModeDescription => '在 Moonfin、MakD 之間進行選擇，或關閉媒體列';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => '馬克D';

  @override
  String get mediaBarModeOff => '離開';

  @override
  String get enableMediaBar => '啟用媒體欄';

  @override
  String get showFeaturedContentSlideshow => '在首頁顯示特色內容投影片';

  @override
  String get contentType => '內容類型';

  @override
  String get moviesAndTvShows => '電影和電視節目';

  @override
  String get moviesOnly => '僅限電影';

  @override
  String get tvShowsOnly => '限電視節目';

  @override
  String get itemCount => '商品數量';

  @override
  String get noneSelected => '未選擇';

  @override
  String get noneExcluded => '沒有排除';

  @override
  String get autoAdvance => '自動前進';

  @override
  String get autoAdvanceSlides => '自動前進到下一張幻燈片';

  @override
  String get autoAdvanceInterval => '自動前進間隔';

  @override
  String get trailerPreview => '預告片預覽';

  @override
  String get autoPlayTrailers => '3 秒後在媒體列中自動播放預告片';

  @override
  String get episodePreview => '劇集預覽';

  @override
  String get mediaPreview => '媒體預覽';

  @override
  String get episodePreviewDescription => '在聚焦、懸停或長按的卡片上播放 30 秒的內嵌預覽';

  @override
  String get mediaPreviewDescription => '在聚焦、懸停或長按的卡片上播放 30 秒的內嵌預覽';

  @override
  String get previewAudio => '預覽音訊';

  @override
  String get enablePreviewAudio => '為預告片和劇集預覽啟用音訊';

  @override
  String get latestMedia => '最新媒體';

  @override
  String get recentlyReleased => '最近發布';

  @override
  String get myMedia => '我的媒體';

  @override
  String get myMediaSmall => '我的媒體（小）';

  @override
  String get continueWatching => '繼續觀看';

  @override
  String get resumeAudio => '恢復音訊';

  @override
  String get resumeBooks => '履歷書籍';

  @override
  String get activeRecordings => '活動錄音';

  @override
  String get playlists => '播放清單';

  @override
  String get liveTV => '電視直播';

  @override
  String get homeSections => '首頁 欄目';

  @override
  String get resetToDefaults => '重設為預設值';

  @override
  String get homeRowPosterSize => '主排海報尺寸';

  @override
  String get perRowImageTypeSelection => '每行影像類型選擇';

  @override
  String get configureImageTypeForEachRow => '為每個啟用的主行配置影像類型';

  @override
  String get mergeContinueWatchingAndNextUp => '合併繼續觀看和下一步';

  @override
  String get combineBothRows => '將兩行合併為一個主頁部分';

  @override
  String get perRowImageType => '每行圖像類型';

  @override
  String get perRowSettings => '每行設定';

  @override
  String get autoLogin => '自動登入';

  @override
  String get lastUser => '最後一個用戶';

  @override
  String get specificUser => '特定用戶';

  @override
  String get alwaysAuthenticate => '始終進行身份驗證';

  @override
  String get requirePasswordWithToken => '即使使用儲存的令牌也需要密碼';

  @override
  String get confirmExit => '確認退出';

  @override
  String get showConfirmationBeforeExiting => '退出前顯示確認訊息';

  @override
  String get blockContentWithRatings => '阻止具有以下評級的內容：';

  @override
  String get noContentRatingsFound => '在此伺服器上尚未找到內容分級。';

  @override
  String get couldNotLoadServerRatings => '無法載入伺服器評級。僅顯示已儲存的評分。';

  @override
  String get couldNotRefreshRatings => '無法刷新伺服器的評級。顯示已儲存的評分。';

  @override
  String get enablePinCode => '啟用 PIN 碼';

  @override
  String get requirePinToAccess => '需要 PIN 碼才能存取您的帳戶';

  @override
  String get changePin => '更改密碼';

  @override
  String get setNewPinCode => '設定新的 PIN 碼';

  @override
  String get removePin => '刪除 PIN 碼';

  @override
  String get removePinProtection => '刪除 PIN 碼保護';

  @override
  String get screensaver => '螢幕保護程式';

  @override
  String get inAppScreensaver => '應用程式內螢幕保護程式';

  @override
  String get enableBuiltInScreensaver => '啟用內建螢幕保護程式';

  @override
  String get mode => '模式';

  @override
  String get libraryArt => '圖書館藝術';

  @override
  String get logo => '標識';

  @override
  String get clock => '鐘';

  @override
  String get timeout => '暫停';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => '調光等級';

  @override
  String get maxAgeRating => '最大年齡等級';

  @override
  String get any => '任何';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => '需要年齡分級';

  @override
  String get onlyShowRatedContent => '只顯示評分內容';

  @override
  String get showClock => '顯示時鐘';

  @override
  String get displayClockDuringScreensaver => '螢幕保護期間顯示時鐘';

  @override
  String get rottenTomatoesCritics => '爛番茄（評論家）';

  @override
  String get rottenTomatoesAudience => '爛番茄（觀眾）';

  @override
  String get imdb => '網路醫學資料庫';

  @override
  String get tmdb => 'TM資料庫';

  @override
  String get metacritic => '元評論家';

  @override
  String get metacriticUser => '元評論家（使用者）';

  @override
  String get trakt => '特拉克特';

  @override
  String get letterboxd => '信箱';

  @override
  String get myAnimeList => '我的動漫列表';

  @override
  String get aniList => '動畫列表';

  @override
  String get communityRating => '社區評級';

  @override
  String get ratings => '評級';

  @override
  String get additionalRatings => '附加評級';

  @override
  String get showMdbListAndTmdbRatings => '顯示 MDBList 和 TMDB 評級';

  @override
  String get ratingLabels => '評級標籤';

  @override
  String get showLabelsNextToIcons => '在評級圖示旁顯示標籤';

  @override
  String get ratingBadges => '評級徽章';

  @override
  String get showDecorativeBadges => '顯示評分背後的裝飾徽章';

  @override
  String get episodeRatings => '劇集收視率';

  @override
  String get showRatingsOnEpisodes => '顯示個別劇集的收視率';

  @override
  String get ratingSources => '評級來源';

  @override
  String get ratingSourcesDescription => '啟用並重新排序整個應用程式中顯示的評級來源';

  @override
  String get pluginLabel => '外掛';

  @override
  String get pluginDetected => '偵測到插件';

  @override
  String get pluginNotDetected => '未偵測到插件';

  @override
  String get pluginDetectedDescription => '檢測到伺服器插件。第一次找到外掛時會自動啟用同步。';

  @override
  String get pluginNotDetectedDescription => '目前未偵測到伺服器插件。本地設定仍然使用其保存的值或內建預設值。';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => '可用服務';

  @override
  String get serverPluginSync => '伺服器插件同步';

  @override
  String get syncSettingsWithPlugin => '與伺服器插件同步設定';

  @override
  String get whatSyncControls => '同步控制什麼';

  @override
  String get syncControlsDescription =>
      '同步僅控制插件支援的設定是否推送到伺服器或從伺服器拉出。啟用插件同步後，設定檔選擇和設定檔同步操作位於自訂設定中。';

  @override
  String get recentRequests => '最近的請求';

  @override
  String get recentlyAdded => '最近新增';

  @override
  String get trending => '流行趨勢';

  @override
  String get popularMovies => '熱門電影';

  @override
  String get movieGenres => '電影類型';

  @override
  String get upcomingMovies => '即將上映的電影';

  @override
  String get studios => '工作室';

  @override
  String get popularSeries => '熱門系列';

  @override
  String get seriesGenres => '系列流派';

  @override
  String get upcomingSeries => '即將推出的系列';

  @override
  String get networks => '網路';

  @override
  String get resetRowsToDefaults => '將行重設為預設值';

  @override
  String get enableSeerr => '啟用搜尋器';

  @override
  String get showSeerrInNavigation => '在導航中顯示 Seerr（需要伺服器插件）';

  @override
  String get seerrUnavailable => '不可用，因為伺服器插件 Seerr 支援已停用。';

  @override
  String get nsfwFilter => 'NSFW 過濾器';

  @override
  String get hideAdultContent => '在結果中隱藏成人內容';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => '發現行';

  @override
  String get discoverRowsDescriptionPlugin =>
      '拖曳以重新排序。啟用或停用行。啟用與 Moonfin 插件的行順序同步。';

  @override
  String get discoverRowsDescription => '拖曳以重新排序。啟用或停用行。';

  @override
  String get enabled => '啟用';

  @override
  String get hidden => '隱';

  @override
  String get aboutTitle => '關於';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => '開源許可證';

  @override
  String get sourceCode => '原始碼';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => '立即檢查更新';

  @override
  String get checksLatestDesktopRelease => '檢查該平台的最新桌面版本';

  @override
  String get youAreUpToDate => '你是最新的。';

  @override
  String get couldNotCheckForUpdates => '目前無法檢查更新。';

  @override
  String get noCompatibleUpdate => '找不到該平台的兼容更新包。';

  @override
  String get updateChecksNotSupported => '此平台不支援更新檢查。';

  @override
  String get updateNotificationsDisabled => '更新通知已被停用。';

  @override
  String get pleaseWaitBeforeChecking => '請稍候再檢查。';

  @override
  String get latestUpdateAlreadyShown => '最新更新已經顯示。';

  @override
  String get updateAvailable => '可用更新。';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => '更新通知';

  @override
  String get showWhenUpdatesAvailable => '顯示更新何時可用';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => '閱讀發行說明';

  @override
  String get downloadingUpdate => '正在下載更新...';

  @override
  String get updateDownloadFailed => '更新下載失敗。請再試一次。';

  @override
  String get openReleasesPage => '開啟發布頁面';

  @override
  String get navigation => '導航';

  @override
  String get watchedIndicatorsBackdrops => '觀看指標、背景';

  @override
  String get focusColorWatchedIndicatorsBackdrops => '焦點顏色、觀察指標、背景';

  @override
  String get navbarStyleToolbarAppearance => '導覽列樣式、工具列按鈕、外觀';

  @override
  String get reorderToggleHomeRows => '重新排序和切換主行';

  @override
  String get featuredContentAppearance => '特色內容、外觀';

  @override
  String get posterSizeImageTypeFolderView => '海報尺寸、圖像類型、資料夾視圖';

  @override
  String get mdbListTmdbRatingSources => 'MDBList、TMDB 和評級來源';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => '清除';

  @override
  String get browse => '瀏覽';

  @override
  String get noResults => '沒有結果';

  @override
  String get seerrAvailableStatus => '可用的';

  @override
  String get seerrRequestedStatus => '已請求';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => '搜尋者設定';

  @override
  String get requestMore => '請求更多';

  @override
  String get request => '要求';

  @override
  String get cancelRequest => '取消請求';

  @override
  String get playInMoonfin => '玩 Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => '核准';

  @override
  String get declineAction => '衰退';

  @override
  String get similar => '相似的';

  @override
  String get recommendations => '建議';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => '保持';

  @override
  String get itemNotFoundInLibrary => '在您的 Moonfin 庫中找不到項目';

  @override
  String get errorSearchingLibrary => '搜尋庫時出錯';

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
  String get submitRequest => '提交請求';

  @override
  String get allSeasons => '所有季節';

  @override
  String get advancedOptions => '進階選項';

  @override
  String get noServiceServersConfigured => '未配置服務伺服器';

  @override
  String get server => '伺服器';

  @override
  String get qualityProfile => '品質概況';

  @override
  String get rootFolder => '根資料夾';

  @override
  String get showMore => '顯示更多';

  @override
  String get appearances => '出場次數';

  @override
  String get crewSection => '全體人員';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => '沒有要求';

  @override
  String get pendingStatus => '待辦的';

  @override
  String get declinedStatus => '拒絕';

  @override
  String get partiallyAvailable => '部分可用';

  @override
  String get downloadingStatus => '正在下載';

  @override
  String get approvedStatus => '得到正式認可的';

  @override
  String get notRequestedStatus => '未要求';

  @override
  String get blocklistedStatus => '列入黑名單';

  @override
  String get deletedStatus => '已刪除';

  @override
  String get tmdbScore => 'TMDB分數';

  @override
  String get releaseDateLabel => '發布日期';

  @override
  String get firstAirDateLabel => '首播日期';

  @override
  String get revenueLabel => '收入';

  @override
  String get runtimeLabel => '運行時';

  @override
  String get budgetLabel => '預算';

  @override
  String get originalLanguageLabel => '原始語言';

  @override
  String get seasonsLabel => '季節';

  @override
  String get episodesLabel => '劇集數';

  @override
  String get access => '使用權';

  @override
  String get add => '添加';

  @override
  String get address => '地址';

  @override
  String get analytics => '分析';

  @override
  String get catalog => '目錄';

  @override
  String get content => '內容';

  @override
  String get copy => '複製';

  @override
  String get create => '創造';

  @override
  String get disable => '停用';

  @override
  String get done => '完畢';

  @override
  String get edit => '編輯';

  @override
  String get encoding => '編碼';

  @override
  String get error => '錯誤';

  @override
  String get forward => '向前';

  @override
  String get general => '一般的';

  @override
  String get go => '去';

  @override
  String get install => '安裝';

  @override
  String get installed => '已安裝';

  @override
  String get interval => '間隔';

  @override
  String get name => '姓名';

  @override
  String get networking => '聯網';

  @override
  String get next => '下一個';

  @override
  String get path => '小路';

  @override
  String get paused => '已暫停';

  @override
  String get permissions => '權限';

  @override
  String get processing => '加工';

  @override
  String get profile => '輪廓';

  @override
  String get provider => '提供者';

  @override
  String get refresh => '重新整理';

  @override
  String get remote => '偏僻的';

  @override
  String get rename => '重新命名';

  @override
  String get revoke => '撤銷';

  @override
  String get role => '角色';

  @override
  String get root => '根';

  @override
  String get run => '跑步';

  @override
  String get search => '搜尋';

  @override
  String get select => '選擇';

  @override
  String get send => '傳送';

  @override
  String get sessions => '會議';

  @override
  String get set => '放';

  @override
  String get status => '地位';

  @override
  String get stop => '停止';

  @override
  String get streaming => '串流媒體';

  @override
  String get time => '時間';

  @override
  String get trickplay => '特技遊戲';

  @override
  String get uninstall => '解除安裝';

  @override
  String get up => '向上';

  @override
  String get update => '更新';

  @override
  String get upload => '上傳';

  @override
  String get unmute => '取消靜音';

  @override
  String get mute => '沉默的';

  @override
  String get branding => '品牌推廣';

  @override
  String get adminDrawerDashboard => '儀表板';

  @override
  String get adminDrawerAnalytics => '分析';

  @override
  String get adminDrawerSettings => '設定';

  @override
  String get adminDrawerBranding => '品牌推廣';

  @override
  String get adminDrawerUsers => '使用者';

  @override
  String get adminDrawerLibraries => '圖書館';

  @override
  String get adminDrawerTranscoding => '轉碼';

  @override
  String get adminDrawerResume => '恢復';

  @override
  String get adminDrawerStreaming => '串流媒體';

  @override
  String get adminDrawerTrickplay => '特技遊戲';

  @override
  String get adminDrawerDevices => '裝置';

  @override
  String get adminDrawerActivity => '活動';

  @override
  String get adminDrawerNetworking => '聯網';

  @override
  String get adminDrawerApiKeys => 'API 金鑰';

  @override
  String get adminDrawerBackups => '備份';

  @override
  String get adminDrawerLogs => '紀錄';

  @override
  String get adminDrawerScheduledTasks => '計劃任務';

  @override
  String get adminDrawerPlugins => '外掛';

  @override
  String get adminDrawerRepositories => '儲存庫';

  @override
  String get adminDrawerLiveTv => '電視直播';

  @override
  String get adminExitTooltip => '退出管理';

  @override
  String get adminDashboardLoadFailed => '無法載入儀表板';

  @override
  String get adminMediaOverview => '媒體概覽';

  @override
  String get adminMediaTotalsError => '無法載入伺服器媒體總數。';

  @override
  String get adminMediaOverviewSubtitle => '快速了解該伺服器上有多少內容。';

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
  String get analyticsMediaDistribution => '媒體發行';

  @override
  String get analyticsVideoCodecs => '視訊編解碼器';

  @override
  String get analyticsAudioCodecs => '音訊編解碼器';

  @override
  String get analyticsContainers => '貨櫃';

  @override
  String get analyticsTopGenres => '熱門流派';

  @override
  String get analyticsReleaseYears => '發布年份';

  @override
  String get analyticsContentRatings => '內容評級';

  @override
  String get analyticsRuntimeBuckets => '運行時桶';

  @override
  String get analyticsFileFormats => '文件格式';

  @override
  String get analyticsNoData => '無可用數據。';

  @override
  String get adminServerInfo => '伺服器資訊';

  @override
  String get adminRestartPending => '重啟待定';

  @override
  String get adminServerPaths => '伺服器路徑';

  @override
  String get adminServerActions => '伺服器操作';

  @override
  String get adminRestartServer => '重啟伺服器';

  @override
  String get adminShutdownServer => '關閉伺服器';

  @override
  String get adminScanLibraries => '掃描函式庫';

  @override
  String get adminLibraryScanStarted => '圖書館掃描開始';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => '伺服器正在重啟';

  @override
  String get adminServerRebootMessage => '伺服器正在重新啟動，請重新啟動 Moonfin';

  @override
  String get adminActiveSessions => '活躍會話';

  @override
  String get adminSessionsLoadFailed => '無法載入會話';

  @override
  String get adminNoActiveSessions => '沒有活動會話';

  @override
  String get adminRecentActivity => '最近的活動';

  @override
  String get adminNoRecentActivity => '最近沒有活動';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => '發送訊息';

  @override
  String get adminMessageTextHint => '留言內容';

  @override
  String get adminSetVolume => '設定音量';

  @override
  String get sessionPrev => '上一篇';

  @override
  String get sessionRewind => '倒帶';

  @override
  String get sessionForward => '向前';

  @override
  String get sessionNext => '下一個';

  @override
  String get sessionVolumeDown => '卷 –';

  @override
  String get sessionVolumeUp => '卷+';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => '正在播放';

  @override
  String get volume => '體積';

  @override
  String get actions => '行動';

  @override
  String get videoCodec => '視訊編解碼器';

  @override
  String get audioCodec => '音訊編解碼器';

  @override
  String get hwAccel => '硬體加速';

  @override
  String get completion => '完成';

  @override
  String get direct => '直接的';

  @override
  String get adminDisconnect => '斷開';

  @override
  String get adminClearDates => '明確日期';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => '沒有活動條目';

  @override
  String get adminEditDeviceName => '編輯設備名稱';

  @override
  String get adminCustomName => '自訂名稱';

  @override
  String get adminDeviceNameUpdated => '設備名稱已更新';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => '刪除設備';

  @override
  String get adminDeviceDeleted => '設備已刪除';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => '載入設備失敗';

  @override
  String get adminSearchDevices => '搜尋設備';

  @override
  String get adminThisDevice => '本設備';

  @override
  String get adminEditName => '編輯姓名';

  @override
  String get adminLibrariesLoadFailed => '載入庫失敗';

  @override
  String get adminNoLibraries => '沒有配置庫';

  @override
  String get adminScanAllLibraries => '掃描所有圖書館';

  @override
  String get adminAddLibrary => '新增庫';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => '重新命名庫';

  @override
  String get adminNewName => '新名稱';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => '刪除庫';

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
  String get adminRemovePath => '刪除路徑';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => '已儲存庫選項';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => '載入庫失敗';

  @override
  String get adminNoMediaPaths => '未配置媒體路徑';

  @override
  String get adminAddPath => '新增路徑';

  @override
  String get adminBrowseFilesystem => '瀏覽伺服器檔案系統：';

  @override
  String get adminSaveOptions => '儲存選項';

  @override
  String get adminPreferredMetadataLanguage => '首選元資料語言';

  @override
  String get adminMetadataLanguageHint => '例如英語、德語、法語';

  @override
  String get adminMetadataCountryCode => '元數據國家代碼';

  @override
  String get adminMetadataCountryHint => '例如美國、德國、法國';

  @override
  String get adminLibraryNameRequired => '庫名稱為必填項';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => '圖書館名稱';

  @override
  String get adminSelectedPaths => '選定的路徑：';

  @override
  String get adminNoPathsAdded => '未新增路徑（可以稍後新增）';

  @override
  String get adminCreateLibrary => '建立庫';

  @override
  String get paths => '路徑：';

  @override
  String get adminDisableUser => '停用用戶';

  @override
  String get adminEnableUser => '啟用用戶';

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
  String get adminUsersLoadFailed => '載入用戶失敗';

  @override
  String get adminSearchUsers => '搜尋用戶';

  @override
  String get adminEditUser => '編輯使用者';

  @override
  String get adminAddUser => '新增用戶';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => '創建用戶';

  @override
  String get adminPasswordOptional => '密碼（可選）';

  @override
  String get adminUsernameRequired => '使用者名稱不能為空';

  @override
  String get adminNoProfileChanges => '沒有要儲存的設定檔更改';

  @override
  String get adminProfileSaved => '個人資料已儲存';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => '權限已儲存';

  @override
  String get adminPasswordsMismatch => '密碼不匹配';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => '載入用戶失敗';

  @override
  String get adminBackToUsers => '返回用戶';

  @override
  String get adminSaveProfile => '儲存個人資料';

  @override
  String get adminDeleteUser => '刪除用戶';

  @override
  String get admin => '行政';

  @override
  String get adminFullAccessWarning => '管理員擁有伺服器的完全存取權限。謹慎授予。';

  @override
  String get administrator => '行政人員';

  @override
  String get adminHiddenUser => '隱藏用戶';

  @override
  String get adminAllowMediaPlayback => '允許媒體播放';

  @override
  String get adminAllowAudioTranscoding => '允許音訊轉碼';

  @override
  String get adminAllowVideoTranscoding => '允許視訊轉碼';

  @override
  String get adminAllowRemuxing => '允許重新復用';

  @override
  String get adminForceRemoteTranscoding => '強制遠端來源轉碼';

  @override
  String get adminAllowContentDeletion => '允許內容刪除';

  @override
  String get adminAllowContentDownloading => '允許內容下載';

  @override
  String get adminAllowPublicSharing => '允許公開分享';

  @override
  String get adminAllowRemoteControl => '允許其他使用者遠端控制';

  @override
  String get adminAllowSharedDeviceControl => '允許共享設備控制';

  @override
  String get adminAllowRemoteAccess => '允許遠端存取';

  @override
  String get adminRemoteBitrateLimit => '遠端客戶端位元速率限制 (bps)';

  @override
  String get adminLeaveEmptyNoLimit => '留空則無限制';

  @override
  String get adminMaxActiveSessions => '最大活躍會話數';

  @override
  String get adminAllowLiveTvAccess => '允許存取直播電視';

  @override
  String get adminAllowLiveTvManagement => '允許直播電視管理';

  @override
  String get adminAllowCollectionManagement => '允許集合管理';

  @override
  String get adminAllowSubtitleManagement => '允許字幕管理';

  @override
  String get adminAllowLyricManagement => '允許歌詞管理';

  @override
  String get adminSavePermissions => '保存權限';

  @override
  String get adminEnableAllLibraryAccess => '允許存取所有庫';

  @override
  String get adminSaveAccess => '儲存存取權限';

  @override
  String get adminChangePassword => '更改密碼';

  @override
  String get adminNewPassword => '新密碼';

  @override
  String get adminConfirmPassword => '確認密碼';

  @override
  String get adminSetPassword => '設定密碼';

  @override
  String get adminResetPassword => '重設密碼';

  @override
  String get adminPasswordReset => '密碼重設';

  @override
  String get adminPasswordUpdated => '密碼已更新';

  @override
  String get adminUserSettings => '使用者設定';

  @override
  String get adminLibraryAccess => '圖書館訪問';

  @override
  String get adminDeviceAndChannelAccess => '設備和通道訪問';

  @override
  String get adminEnableAllDevices => '啟用對所有裝置的訪問';

  @override
  String get adminEnableAllChannels => '允許存取所有頻道';

  @override
  String get adminResetPasswordWarning => '這將刪除密碼。用戶無需密碼即可登入。';

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
  String get adminCreateApiKey => '建立 API 金鑰';

  @override
  String get adminAppName => '應用程式名稱';

  @override
  String get adminApiKeyCreated => 'API 金鑰已建立';

  @override
  String get adminApiKeyCreatedNoToken => '密鑰創建成功。伺服器沒有回傳令牌。檢查伺服器 API 金鑰。';

  @override
  String get adminKeyCopied => '密鑰已複製到剪貼簿';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => '伺服器回應中缺少密鑰令牌';

  @override
  String get adminRevokeApiKey => '撤銷 API 金鑰';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API 金鑰已撤銷';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => '無法載入 API 金鑰';

  @override
  String get adminApiKeysTitle => 'API 金鑰';

  @override
  String get adminCreateKey => '建立密鑰';

  @override
  String get adminNoApiKeys => '未找到 API 金鑰';

  @override
  String get adminUnknownApp => '未知應用程式';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => '正在建立備份...';

  @override
  String get adminBackupCreated => '備份建立成功';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => '伺服器回應中缺少備份路徑';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => '確認恢復';

  @override
  String get adminRestoringBackup => '正在恢復備份...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => '無法載入備份';

  @override
  String get adminCreateBackup => '建立備份';

  @override
  String get adminNoBackups => '未找到備份';

  @override
  String get adminViewDetails => '看詳情';

  @override
  String get restore => '恢復';

  @override
  String get adminLogsLoadFailed => '載入伺服器日誌失敗';

  @override
  String get adminNoLogFiles => '未找到日誌文件';

  @override
  String get adminLogCopied => '日誌已複製到剪貼簿';

  @override
  String get adminSaveLogFile => '保存日誌文件';

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
  String get adminSearchInLog => '在日誌中搜尋';

  @override
  String get adminNoMatchingLines => '沒有匹配的線';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => '沒有找到計劃任務';

  @override
  String get adminNoTasksMatchFilter => '沒有任務與當前過濾器匹配';

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
  String get adminRunNow => '立即運行';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => '最後執行';

  @override
  String get adminTriggers => '觸發器';

  @override
  String get adminAddTrigger => '新增觸發器';

  @override
  String get adminNoTriggers => '沒有配置觸發器';

  @override
  String get adminTriggerType => '觸發類型';

  @override
  String get adminTimeLimit => '時間限制（可選）';

  @override
  String get adminNoLimit => '無限制';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => '星期幾';

  @override
  String get adminSearchPlugins => '搜尋插件...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => '解除安裝插件';

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
  String get adminNoPluginsMatchSearch => '沒有符合您搜尋條件的插件';

  @override
  String get adminNoPluginsInstalled => '沒有安裝插件';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => '沒有符合您搜尋條件的軟體包';

  @override
  String get adminNoPackagesAvailable => '沒有可用的套餐';

  @override
  String get adminExperimentalIntegration => '實驗整合';

  @override
  String get adminExperimentalWarning => '插件設定整合仍處於實驗階段。某些設定頁面可能無法正確呈現。';

  @override
  String get continueAction => '繼續';

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
  String get adminMissingAuthToken => '無法開啟設定：缺少身份驗證令牌。';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => '找不到插件';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => '啟用插件';

  @override
  String get adminPluginSettingsPage => '插件設定頁面';

  @override
  String get adminRevisionHistory => '修訂歷史';

  @override
  String get adminNoChangelog => '沒有可用的變更日誌。';

  @override
  String get adminRemoveRepository => '刪除儲存庫';

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
  String get adminRepositoryNameHint => '例如Jellyfin 穩定';

  @override
  String get adminRepositoryUrl => '儲存庫網址';

  @override
  String get adminAddEntry => '新增條目';

  @override
  String get adminInvalidUrl => '無效網址';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => '在瀏覽器中開啟';

  @override
  String get adminOpenExternally => '對外開放';

  @override
  String get adminGeneralSettings => '常規設定';

  @override
  String get adminServerName => '伺服器名稱';

  @override
  String get adminPreferredMetadataCountry => '首選元數據國家/地區';

  @override
  String get adminCachePath => '快取路徑';

  @override
  String get adminMetadataPath => '元資料路徑';

  @override
  String get adminLibraryScanConcurrency => '庫掃描並行';

  @override
  String get adminParallelImageEncodingLimit => '並行圖像編碼限制';

  @override
  String get adminSlowResponseThreshold => '慢響應閾值（毫秒）';

  @override
  String get adminBrandingSaved => '已儲存品牌設定';

  @override
  String get adminBrandingLoadFailed => '無法加載品牌設置';

  @override
  String get adminLoginDisclaimer => '登入免責聲明';

  @override
  String get adminLoginDisclaimerHint => 'HTML 顯示在登入表單下方';

  @override
  String get adminCustomCss => '自訂CSS';

  @override
  String get adminCustomCssHint => '應用於 Web 介面的自訂 CSS';

  @override
  String get adminEnableSplashScreen => '啟用啟動畫面';

  @override
  String get adminStreamingSaved => '已儲存串流媒體設定';

  @override
  String get adminStreamingLoadFailed => '無法加載串流媒體設置';

  @override
  String get adminStreamingDescription => '設定遠端連線的全域流比特率限制。';

  @override
  String get adminRemoteBitrateLimitMbps => '遠端客戶端位元速率限制 (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => '留空或 0 表示無限制';

  @override
  String get adminPlaybackSaved => '已儲存播放設定';

  @override
  String get adminPlaybackLoadFailed => '無法載入播放設定';

  @override
  String get adminPlaybackTranscoding => '播放/轉碼';

  @override
  String get adminHardwareAcceleration => '硬體加速';

  @override
  String get adminVaapiDevice => 'VA-API裝置';

  @override
  String get adminEnableHardwareEncoding => '啟用硬體編碼';

  @override
  String get adminEnableHardwareDecoding => '啟用硬體解碼：';

  @override
  String get adminEncodingThreads => '編碼線程';

  @override
  String get adminAutomatic => '0 = 自動';

  @override
  String get adminTranscodingTempPath => '轉碼臨時路徑';

  @override
  String get adminEnableFallbackFont => '啟用後備字體';

  @override
  String get adminFallbackFontPath => '後備字體路徑';

  @override
  String get adminAllowSegmentDeletion => '允許段刪除';

  @override
  String get adminSegmentKeepSeconds => '段保持（秒）';

  @override
  String get adminThrottleBuffering => '油門緩衝';

  @override
  String get adminTrickplaySaved => '已儲存特技播放設定';

  @override
  String get adminTrickplayLoadFailed => '無法載入特技播放設置';

  @override
  String get adminEnableHardwareAcceleration => '啟用硬體加速';

  @override
  String get adminEnableKeyFrameExtraction => '啟用僅提取關鍵幀';

  @override
  String get adminKeyFrameSubtitle => '速度較快但精度較低';

  @override
  String get adminScanBehavior => '掃描行為';

  @override
  String get adminProcessPriority => '行程優先權';

  @override
  String get adminImageSettings => '影像設定';

  @override
  String get adminIntervalMs => '間隔（毫秒）';

  @override
  String get adminCaptureFrameSubtitle => '捕獲幀的頻率';

  @override
  String get adminWidthResolutions => '寬度解析度';

  @override
  String get adminTileWidth => '磁磚寬度';

  @override
  String get adminTileHeight => '瓷磚高度';

  @override
  String get adminQualitySubtitle => '較低的值=更好的質量，更大的文件';

  @override
  String get adminProcessThreads => '處理線程';

  @override
  String get adminResumeSaved => '恢復已儲存的設定';

  @override
  String get adminResumeLoadFailed => '無法載入恢復設定';

  @override
  String get adminResumeDescription => '配置何時應將內容標記為部分播放或完全播放。';

  @override
  String get adminMinResumePercentage => '最低履歷百分比';

  @override
  String get adminMinResumeSubtitle => '播放內容必須超過此百分比才能保存進度';

  @override
  String get adminMaxResumePercentage => '最大履歷百分比';

  @override
  String get adminMaxResumeSubtitle => '在此百分比之後，內容被視為已完全播放';

  @override
  String get adminMinResumeDuration => '最短恢復持續時間（秒）';

  @override
  String get adminMinResumeDurationSubtitle => '比這短的項目不可恢復';

  @override
  String get adminMinAudiobookResume => '有聲書最低履歷百分比';

  @override
  String get adminMaxAudiobookResume => '最大有聲書恢復百分比';

  @override
  String get adminNetworkingSaved => '已儲存網路設定。可能需要重新啟動伺服器。';

  @override
  String get adminNetworkingLoadFailed => '無法載入網路設定';

  @override
  String get adminNetworkingWarning => '更改網路設定可能需要重新啟動伺服器。';

  @override
  String get adminEnableRemoteAccess => '啟用遠端存取';

  @override
  String get ports => '港口';

  @override
  String get adminHttpPort => 'HTTP連接埠';

  @override
  String get adminHttpsPort => 'HTTPS連接埠';

  @override
  String get adminPublicHttpsPort => '公共 HTTPS 連接埠';

  @override
  String get adminBaseUrl => '基本網址';

  @override
  String get adminBaseUrlHint => '例如/果凍';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => '啟用 HTTPS';

  @override
  String get adminLocalNetwork => '本地網路';

  @override
  String get adminLocalNetworkAddresses => '本地網路位址';

  @override
  String get adminKnownProxies => '已知代理';

  @override
  String get adminRemoteIpFilter => '遠端IP過濾';

  @override
  String get adminRemoteIpFilterEntries => '遠端IP過濾器';

  @override
  String get adminCertificatePath => '證書路徑';

  @override
  String get whitelist => '白名單';

  @override
  String get blacklist => '黑名單';

  @override
  String get notSet => '未設定';

  @override
  String get adminMetadataSaved => '元資料已儲存';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => '重新整理元數據';

  @override
  String get recursive => '遞迴';

  @override
  String get adminReplaceAllMetadata => '替換所有元數據';

  @override
  String get adminReplaceAllImages => '替換所有圖像';

  @override
  String get adminMetadataRefreshRequested => '請求元資料刷新';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => '搜尋遠端人員';

  @override
  String get adminNoRemoteMatches => '未找到遠端匹配項';

  @override
  String get adminRemoteResults => '遠程結果';

  @override
  String get adminRemoteMetadataApplied => '應用遠端元數據';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => '更新內容類型';

  @override
  String get adminContentType => '內容類型';

  @override
  String get adminContentTypeUpdated => '內容類型已更新';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => '無法載入元資料編輯器';

  @override
  String get adminNoPeopleEntries => '沒有人員條目';

  @override
  String get adminNoExternalIds => '沒有可用的外部 ID';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => '不支援的圖像格式';

  @override
  String get adminImageReadFailed => '無法讀取所選影像';

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
  String get adminAllProviders => '所有提供者';

  @override
  String get adminNoRemoteImages => '未找到遠端影像';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => '新增調音器';

  @override
  String get adminTunerType => '調音器類型';

  @override
  String get adminTunerTypeHint => 'HDHomeRun、M3U、其他';

  @override
  String get adminUrlPath => '網址/路徑';

  @override
  String get adminNameOptional => '姓名（可選）';

  @override
  String get adminTunerAdded => '新增了調音器';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => '新增嚮導提供者';

  @override
  String get adminProviderType => '提供者類型';

  @override
  String get adminProviderTypeHint => 'ScheduleDirect 或 XMLTV';

  @override
  String get adminUsernameOptional => '使用者名稱（可選）';

  @override
  String get adminRefreshInterval => '刷新間隔（小時）';

  @override
  String get adminProviderAdded => '提供者已新增';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => '請求重置調諧器';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => '錄音設定';

  @override
  String get adminPrePadding => '預填（分鐘）';

  @override
  String get adminPostPadding => '後填充（分鐘）';

  @override
  String get adminRecordingPath => '錄音路徑';

  @override
  String get adminSeriesRecordingPath => '系列錄音路徑';

  @override
  String get adminRecordingSettingsSaved => '已儲存錄音設定';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => '設定通道映射';

  @override
  String get adminMappingJson => '映射 JSON';

  @override
  String get adminMappingJsonHint => '範例：映射 JSON 負載';

  @override
  String get adminChannelMappingsUpdated => '頻道映射已更新';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => '無法載入直播電視管理';

  @override
  String get adminTunerDevices => '調諧器設備';

  @override
  String get adminNoTunerHosts => '未配置調諧器主機';

  @override
  String get adminGuideProviders => '導遊提供者';

  @override
  String get adminAddProvider => '新增提供者';

  @override
  String get adminNoListingProviders => '未配置清單提供者';

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
  String get adminTunerDiscovery => '調音器發現';

  @override
  String get adminChannelMappings => '通道映射';

  @override
  String get adminNoDiscoveredTuners => '尚未發現調諧器';

  @override
  String get adminSettingsSaved => '設定已儲存';

  @override
  String get adminBackupsNotAvailable => '備份在此伺服器版本上不可用。';

  @override
  String get adminRestoreWarning1 => '恢復將用備份資料替換所有當前伺服器資料。';

  @override
  String get adminRestoreWarning2 => '目前的伺服器設定、使用者和庫資料將被覆蓋。';

  @override
  String get adminRestoreWarning3 => '恢復後伺服器將重新啟動。';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested => '已請求恢復。伺服器重新啟動可能會中斷此會話。';

  @override
  String get adminBackupsTitle => '備份';

  @override
  String get adminUnknownDate => '日期未知';

  @override
  String get adminUnnamedBackup => '未命名備份';

  @override
  String get adminLiveTvNotAvailable => '直播電視管理在此伺服器版本上不可用。';

  @override
  String get adminLiveTvTitle => '直播電視管理';

  @override
  String get adminApply => '申請';

  @override
  String get adminNotSet => '未設定';

  @override
  String get adminReset => '重置';

  @override
  String get adminLogsTitle => '伺服器日誌';

  @override
  String get adminLogsNewestFirst => '最新第一';

  @override
  String get adminLogsOldestFirst => '最舊的在前';

  @override
  String get adminLogsJustNow => '現在';

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
  String get adminLogViewerNoMatches => '沒有匹配的線';

  @override
  String get adminMetadataEditorTitle => '元資料編輯器';

  @override
  String get adminMetadataRemote => '偏僻的';

  @override
  String get adminMetadataType => '類型';

  @override
  String get adminMetadataDetails => '細節';

  @override
  String get adminMetadataExternalIds => '外部 ID';

  @override
  String get adminMetadataImages => '圖片';

  @override
  String get adminMetadataFieldTitle => '標題';

  @override
  String get adminMetadataFieldSortTitle => '排序標題';

  @override
  String get adminMetadataFieldOriginalTitle => '原標題';

  @override
  String get adminMetadataFieldPremiereDate => '首播日期（年-月-日）';

  @override
  String get adminMetadataFieldEndDate => '結束日期（年-月-日）';

  @override
  String get adminMetadataFieldProductionYear => '生產年份';

  @override
  String get adminMetadataFieldOfficialRating => '官方評級';

  @override
  String get adminMetadataFieldCommunityRating => '社區評級';

  @override
  String get adminMetadataFieldCriticRating => '評論家評級';

  @override
  String get adminMetadataFieldTagline => '標語';

  @override
  String get adminMetadataFieldOverview => '概述';

  @override
  String get adminMetadataGenres => '流派';

  @override
  String get adminMetadataTags => '標籤';

  @override
  String get adminMetadataStudios => '工作室';

  @override
  String get adminMetadataPeople => '人們';

  @override
  String get adminMetadataAddGenre => '添加流派';

  @override
  String get adminMetadataAddTag => '添加標籤';

  @override
  String get adminMetadataAddStudio => '新增工作室';

  @override
  String get adminMetadataAddPerson => '新增人員';

  @override
  String get adminMetadataEditPerson => '編輯人物';

  @override
  String get adminMetadataRole => '角色';

  @override
  String get adminMetadataImagePrimary => '基本的';

  @override
  String get adminMetadataImageBackdrop => '背景';

  @override
  String get adminMetadataImageLogo => '標識';

  @override
  String get adminMetadataImageBanner => '橫幅';

  @override
  String get adminMetadataImageThumb => '大拇指';

  @override
  String get adminMetadataRecursive => '遞迴';

  @override
  String get adminMetadataProvider => '提供者';

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
  String get adminMetadataImageReadFailed => '無法讀取所選影像';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Failed to upload image: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Delete $imageType image';
  }

  @override
  String get adminMetadataDeleteImageContent => '這將從項目中刪除當前圖像。';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => '上傳';

  @override
  String get adminMetadataUpdate => '更新';

  @override
  String get adminMetadataRemoteImage => '遠端影像';

  @override
  String get adminPluginsInstalled => '已安裝';

  @override
  String get adminPluginsCatalog => '目錄';

  @override
  String get adminPluginsActive => '積極的';

  @override
  String get adminPluginsRestart => '重新啟動';

  @override
  String get adminPluginsNoSearchResults => '沒有符合您搜尋條件的插件';

  @override
  String get adminPluginsNoneInstalled => '沒有安裝插件';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => '可用更新';

  @override
  String get adminPluginsPendingRemoval => '重新啟動後等待刪除';

  @override
  String get adminPluginsChangesPending => '更改待重啟';

  @override
  String get adminPluginsEnable => '使能夠';

  @override
  String get adminPluginsDisable => '停用';

  @override
  String get adminPluginsInstallUpdate => '安裝更新';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '沒有符合您搜尋條件的軟體包';

  @override
  String get adminPluginsCatalogEmpty => '沒有可用的套餐';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => '實驗整合';

  @override
  String get adminPluginDetailExperimentalContent =>
      '插件設定整合仍處於實驗階段。某些欄位或佈局可能尚未正確呈現。';

  @override
  String get adminPluginDetailToggle404 => '無法切換插件。伺服器找不到此插件版本。嘗試刷新插件，然後重試。';

  @override
  String get adminPluginDetailToggleDioError => '無法切換插件。請檢查伺服器日誌以了解詳細資訊。';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => '細節';

  @override
  String get adminPluginDetailDeveloper => '開發商';

  @override
  String get adminPluginDetailRepository => '儲存庫';

  @override
  String get adminPluginDetailBundled => '捆綁式';

  @override
  String get adminPluginDetailEnablePlugin => '啟用插件';

  @override
  String get adminPluginDetailRestartRequired => '需要重新啟動伺服器才能使變更生效。';

  @override
  String get adminPluginDetailRemovalPending => '伺服器重啟後該插件將被刪除。';

  @override
  String get adminPluginDetailMalfunctioned => '該插件故障，可能無法正常運作。';

  @override
  String get adminPluginDetailNotSupported => '當前伺服器版本不支援此插件。';

  @override
  String get adminPluginDetailSuperseded => '該插件已被新版本取代。';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => '刪除儲存庫';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => '消除';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => '沒有配置儲存庫';

  @override
  String get adminReposEmptySubtitle => '新增儲存庫以瀏覽可用插件';

  @override
  String get adminReposUnnamed => '（未命名）';

  @override
  String get adminReposEditTitle => '編輯儲存庫';

  @override
  String get adminReposAddTitle => '新增儲存庫';

  @override
  String get adminReposUrl => '儲存庫網址';

  @override
  String get adminReposNameHint => '例如Jellyfin 穩定';

  @override
  String get adminPluginSettingsInvalidUrl => '無效網址';

  @override
  String get adminGeneralSettingsTitle => '常規設定';

  @override
  String get adminGeneralMetadataLanguage => '首選元資料語言';

  @override
  String get adminGeneralMetadataLanguageHint => '例如英語、德語、法語';

  @override
  String get adminGeneralMetadataCountry => '首選元數據國家/地區';

  @override
  String get adminGeneralMetadataCountryHint => '例如美國、德國、法國';

  @override
  String get adminGeneralLibraryScanConcurrency => '庫掃描並行';

  @override
  String get adminGeneralImageEncodingLimit => '並行圖像編碼限制';

  @override
  String get adminUnknownError => '未知錯誤';

  @override
  String get adminBrowse => '瀏覽';

  @override
  String get adminCloseBrowser => '關閉瀏覽器';

  @override
  String get adminNetworkingTitle => '聯網';

  @override
  String get adminNetworkingRestartWarning => '更改網路設定可能需要重新啟動伺服器。';

  @override
  String get adminNetworkingRemoteAccess => '啟用遠端存取';

  @override
  String get adminNetworkingPorts => '港口';

  @override
  String get adminNetworkingHttpPort => 'HTTP連接埠';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS連接埠';

  @override
  String get adminNetworkingEnableHttps => '啟用 HTTPS';

  @override
  String get adminNetworkingLocalNetwork => '本地網路';

  @override
  String get adminNetworkingLocalAddresses => '本地網路位址';

  @override
  String get adminNetworkingAddressHint => '例如192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => '已知代理';

  @override
  String get adminNetworkingProxyHint => '例如10.0.0.1';

  @override
  String get adminNetworkingWhitelist => '白名單';

  @override
  String get adminNetworkingBlacklist => '黑名單';

  @override
  String get adminNetworkingAddEntry => '新增條目';

  @override
  String get adminBrandingTitle => '品牌推廣';

  @override
  String get adminBrandingLoginDisclaimer => '登入免責聲明';

  @override
  String get adminBrandingLoginDisclaimerHint => 'HTML 顯示在登入表單下方';

  @override
  String get adminBrandingCustomCss => '自訂CSS';

  @override
  String get adminBrandingCustomCssHint => '應用於 Web 介面的自訂 CSS';

  @override
  String get adminBrandingEnableSplash => '啟用啟動畫面';

  @override
  String get adminPlaybackHwAccel => '硬體加速';

  @override
  String get adminPlaybackHwAccelLabel => '硬體加速';

  @override
  String get adminPlaybackEnableHwEncoding => '啟用硬體編碼';

  @override
  String get adminPlaybackEnableHwDecoding => '啟用硬體解碼：';

  @override
  String get adminPlaybackEncoding => '編碼';

  @override
  String get adminPlaybackEncodingThreads => '編碼線程';

  @override
  String get adminPlaybackFallbackFont => '啟用後備字體';

  @override
  String get adminPlaybackFallbackFontPath => '後備字體路徑';

  @override
  String get adminPlaybackStreaming => '串流媒體';

  @override
  String get adminResumeVideo => '影片';

  @override
  String get adminResumeAudiobooks => '有聲書';

  @override
  String get adminResumeMinAudiobookPct => '有聲書最低履歷百分比';

  @override
  String get adminResumeMaxAudiobookPct => '最大有聲書恢復百分比';

  @override
  String get adminStreamingBitrateLimit => '遠端客戶端位元速率限制 (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => '留空或 0 表示無限制';

  @override
  String get adminTrickplayHwAccel => '啟用硬體加速';

  @override
  String get adminTrickplayHwEncoding => '啟用硬體編碼';

  @override
  String get adminTrickplayKeyFrameOnly => '啟用僅提取關鍵幀';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => '速度較快但精度較低';

  @override
  String get adminTrickplayNonBlocking => '非阻塞';

  @override
  String get adminTrickplayBlocking => '阻塞';

  @override
  String get adminTrickplayPriorityHigh => '高的';

  @override
  String get adminTrickplayPriorityAboveNormal => '高於正常水平';

  @override
  String get adminTrickplayPriorityNormal => '普通的';

  @override
  String get adminTrickplayPriorityBelowNormal => '低於正常水平';

  @override
  String get adminTrickplayPriorityIdle => '閒置的';

  @override
  String get adminTrickplayImageSettings => '影像設定';

  @override
  String get adminTrickplayInterval => '間隔（毫秒）';

  @override
  String get adminTrickplayIntervalSubtitle => '捕獲幀的頻率';

  @override
  String get adminTrickplayWidthResolutionsHint => '以逗號分隔的像素寬度（例如 320）';

  @override
  String get adminTrickplayQuality => '品質';

  @override
  String get adminTrickplayQScale => '品質規模';

  @override
  String get adminTrickplayQScaleSubtitle => '較低的值=更好的質量，更大的文件';

  @override
  String get adminTrickplayJpegQuality => 'JPEG 質量';

  @override
  String get adminTrickplayProcessing => '加工';

  @override
  String get adminTasksEmpty => '沒有找到計劃任務';

  @override
  String get adminTasksNoFilterMatch => '沒有任務與當前過濾器匹配';

  @override
  String get adminTaskCancelling => '正在取消...';

  @override
  String get adminTaskRunning => '跑步...';

  @override
  String get adminTaskNeverRun => '永遠不要跑';

  @override
  String get adminTaskStop => '停止';

  @override
  String get adminTaskRun => '跑步';

  @override
  String get adminTaskDetailLastExecution => '最後執行';

  @override
  String get adminTaskDetailStarted => '開始';

  @override
  String get adminTaskDetailEnded => '結束';

  @override
  String get adminTaskDetailDuration => '期間';

  @override
  String get adminTaskDetailErrorLabel => '錯誤：';

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
  String get adminTaskTriggerStartup => '應用程式啟動時';

  @override
  String get adminTaskTriggerTypeDaily => '日常的';

  @override
  String get adminTaskTriggerTypeWeekly => '每週';

  @override
  String get adminTaskTriggerTypeInterval => '在一個間隔上';

  @override
  String get adminTaskTriggerIntervalLabel => '間隔';

  @override
  String get adminTaskTriggerEveryHour => '每小時';

  @override
  String get adminTaskTriggerEvery6Hours => '每 6 小時';

  @override
  String get adminTaskTriggerEvery12Hours => '每12小時一次';

  @override
  String get adminTaskTriggerEvery24Hours => '每24小時一次';

  @override
  String get adminTaskTriggerEvery2Days => '每2天一次';

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
  String get adminTaskTriggerTime => '時間';

  @override
  String get adminTaskTriggerNoLimit => '無限制';

  @override
  String get adminActivityJustNow => '現在';

  @override
  String get adminActivityLastHour => '最後一小時';

  @override
  String get adminActivityToday => '今天';

  @override
  String get adminActivityYesterday => '昨天';

  @override
  String get adminActivityOlder => '年長的';

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
  String get adminActivityNow => '現在';

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
  String get adminTrickplayDescription => '配置搜尋預覽縮圖的特技播放影像生成。';

  @override
  String get adminNetworkingPublicHttpsPort => '公共 HTTPS 連接埠';

  @override
  String get adminNetworkingBaseUrl => '基本網址';

  @override
  String get adminNetworkingBaseUrlHint => '例如/果凍';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => '證書路徑';

  @override
  String get adminNetworkingRemoteIpFilter => '遠端IP過濾';

  @override
  String get adminNetworkingRemoteIpFilterLabel => '遠端IP過濾器';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API裝置';

  @override
  String get adminPlaybackAutomatic => '0 = 自動';

  @override
  String get adminPlaybackTranscodeTempPath => '轉碼臨時路徑';

  @override
  String get adminPlaybackSegmentDeletion => '允許段刪除';

  @override
  String get adminPlaybackSegmentKeep => '段保持（秒）';

  @override
  String get adminPlaybackThrottleBuffering => '油門緩衝';

  @override
  String get adminResumeMinPct => '最低履歷百分比';

  @override
  String get adminResumeMinPctSubtitle => '播放內容必須超過此百分比才能保存進度';

  @override
  String get adminResumeMaxPct => '最大履歷百分比';

  @override
  String get adminResumeMaxPctSubtitle => '在此百分比之後，內容被視為已完全播放';

  @override
  String get adminResumeMinDuration => '最短恢復持續時間（秒）';

  @override
  String get adminResumeMinDurationSubtitle => '比這短的項目不可恢復';

  @override
  String get adminTrickplayScanBehavior => '掃描行為';

  @override
  String get adminTrickplayProcessPriority => '行程優先權';

  @override
  String get adminTrickplayTileWidth => '磁磚寬度';

  @override
  String get adminTrickplayTileHeight => '瓷磚高度';

  @override
  String get adminTrickplayProcessThreads => '處理線程';

  @override
  String get adminTrickplayWidthResolutions => '寬度解析度';

  @override
  String get adminMetadataDefault => '預設';

  @override
  String get adminMetadataContentTypeUpdated => '內容類型已更新';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '慢響應閾值（毫秒）';

  @override
  String get adminGeneralCachePath => '快取路徑';

  @override
  String get adminGeneralMetadataPath => '元資料路徑';

  @override
  String get adminGeneralServerName => '伺服器名稱';

  @override
  String get adminSettingsLoadFailed => '無法載入設定';

  @override
  String get adminDiscover => '發現';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => '資料夾';

  @override
  String get libraries => '圖書館';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay 已停用';

  @override
  String get syncPlayDisabledMessage => '在「設定」中啟用 SyncPlay 以使用同步播放。';

  @override
  String get syncPlayServerUnsupportedTitle => '伺服器不受支援';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay 需要 Jellyfin 伺服器。目前的伺服器不支援。';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay 組';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay 組';

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
  String get syncPlayIgnoreWait => '忽略等待';

  @override
  String get syncPlayIgnoreWaitSubtitle => '當該設備緩衝時，請勿阻止該組';

  @override
  String get syncPlayContinueLocallyNoWait => '在本地繼續，無需等待慢速成員';

  @override
  String get syncPlayRepeat => '重複';

  @override
  String get syncPlayRepeatOne => '一';

  @override
  String get syncPlayShuffleModeShuffled => '洗牌';

  @override
  String get syncPlayShuffleModeSorted => '已排序';

  @override
  String get syncPlaySyncCurrentQueue => '同步目前播放隊列';

  @override
  String get syncPlaySyncCurrentQueueSubtitle => '將群組隊列替換為本機正在播放的內容';

  @override
  String get syncPlayLeaveGroup => '離開群組';

  @override
  String get syncPlayGroupQueue => '群組佇列';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => '立即播放';

  @override
  String get syncPlayCreateNewGroup => '建立一個新群組';

  @override
  String get syncPlayGroupName => '團體名稱';

  @override
  String get syncPlayDefaultGroupName => '我的 SyncPlay 群組';

  @override
  String get syncPlayCreateGroup => '建立群組';

  @override
  String get syncPlayAvailableGroups => '可用群組';

  @override
  String get syncPlayNoGroupsAvailable => '沒有可用的群組';

  @override
  String get syncPlayJoinGroupQuestion => '加入 SyncPlay 群組？';

  @override
  String get syncPlayJoinGroupWarning => '加入 SyncPlay 群組可能會取代您目前的播放佇列。繼續？';

  @override
  String get syncPlayJoin => '加入';

  @override
  String get syncPlayStateIdle => '閒置的';

  @override
  String get syncPlayStateWaiting => '等待';

  @override
  String get syncPlayStatePaused => '已暫停';

  @override
  String get syncPlayStatePlaying => '演奏';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay 存取被拒絕';

  @override
  String get syncPlayAccessDeniedMessage =>
      '您無權存取此 SyncPlay 群組中的一項或多項。請群組擁有者驗證庫權限或選擇其他佇列。';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => '語音搜尋不可用。';

  @override
  String get dolbyVisionDirectPlayFailedTitle => 'Dolby Vision 直接播放失敗';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      '無法啟動此 Dolby Vision 流的直接播放。使用伺服器轉碼重試？';

  @override
  String get retryWithTranscode => '重試轉碼';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision 不支持';

  @override
  String get dolbyVisionNotSupportedMessage =>
      '本設備無法直接解碼 Dolby Vision 內容。使用 HDR10 後備或請求伺服器轉碼。';

  @override
  String get rememberMyChoice => '記住我的選擇';

  @override
  String get playHdr10Fallback => '播放 HDR10 後備';

  @override
  String get requestTranscode => '請求轉碼';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      '偵測 IAmParadox27 的「主螢幕部分」外掛程式暴露的行。可以在下面啟用行並重新排序。';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      '尚無 Jellyfin 伺服器報告該外掛程式。';

  @override
  String get kefinTweaksIntegrationDescription =>
      '偵測透過 ranaldsgift 的「KefinTweaks」插件配置的行。自訂部分、最近發布的、再次觀看的、季節性的以及最近添加到庫中的內容均從每個 Jellyfin 伺服器上的 KefinTweaks 配置進行鏡像。';

  @override
  String get kefinTweaksIntegrationNoServers =>
      '尚無 Jellyfin 伺服器報告 KefinTweaks。';

  @override
  String get integrationOpenHomeSections => '開放主頁部分';

  @override
  String get integrationOpenHomeSectionsSubtitle => '啟用、停用和重新排序行';

  @override
  String get integrationInstalledButDisabled => '已安裝但已停用';

  @override
  String get integrationNotInstalled => '未安裝';

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
  String get seeAll => '看全部';

  @override
  String get noItems => '沒有商品';

  @override
  String get switchUser => '切換用戶';

  @override
  String get remoteControl => '遙控';

  @override
  String get mediaBarLoading => '正在加載媒體欄...';

  @override
  String get mediaBarError => '媒體欄載入失敗';

  @override
  String get offlineServerUnavailable => '已連接到互聯網，但目前伺服器無法使用。';

  @override
  String get offlineNoInternet => '您已離線。僅下載的內容可用。';

  @override
  String get offlineFileNotAvailable => '文件不可用';

  @override
  String get offlineSwitchServer => '切換伺服器';

  @override
  String get offlineSavedMedia => '保存的媒體';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => '遠端回放';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => '裝置音量';

  @override
  String get castVolumeUnavailable => '不可用';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => '聲音的';

  @override
  String get subtitlesLabel => '字幕';

  @override
  String get pinConfirmTitle => '確認密碼';

  @override
  String get pinSetTitle => '設定密碼';

  @override
  String get pinEnterTitle => '輸入密碼';

  @override
  String get pinReenterToConfirm => '重新輸入您的 PIN 碼進行確認';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN 碼不正確';

  @override
  String get pinMismatch => 'PIN 碼不匹配';

  @override
  String get pinForgot => '忘記密碼？';

  @override
  String get pinClear => '清除';

  @override
  String get pinBackspace => '退格鍵';

  @override
  String get quickConnectAuthorized => '快速連線請求已獲授權。';

  @override
  String get quickConnectInvalidOrExpired => '快速連線代碼無效或已過期。';

  @override
  String get quickConnectNotSupported => '此伺服器不支援快速連線。';

  @override
  String get quickConnectAuthorizeFailed => '無法授權快速連線代碼。';

  @override
  String get quickConnectDisabled => '此伺服器上禁用了快速連線。';

  @override
  String get quickConnectForbidden => '您的帳戶無法授權此快速連線要求。';

  @override
  String get quickConnectNotFound => '未找到快速連線代碼。嘗試新的程式碼。';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => '輸入代碼';

  @override
  String get quickConnectAuthorize => '授權';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => '遙控';

  @override
  String get remoteFailedToLoadSessions => '無法載入會話';

  @override
  String get remoteNoSessions => '沒有可控的會話';

  @override
  String get remoteStartPlayback => '在另一台裝置上開始播放';

  @override
  String get unknownUser => '未知';

  @override
  String get unknownItem => '未知';

  @override
  String get remoteNothingPlaying => '此會話中沒有播放任何內容';

  @override
  String get castingStarted => '在選定的裝置上開始投射';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => '沒有可用的遠端播放設備。';

  @override
  String get noRemoteDevicesIos =>
      '沒有可用的遠端播放設備。\n\n在 iOS 上，AirPlay 目標在模擬器中可能無法使用。';

  @override
  String get trackActionPlayNext => '播放下一個';

  @override
  String get trackActionAddToQueue => '添加到隊列';

  @override
  String get trackActionAddToPlaylist => '新增到播放列表';

  @override
  String get trackActionCancelDownload => '取消下載';

  @override
  String get trackActionDeleteFromPlaylist => '從播放清單中刪除';

  @override
  String get trackActionMoveUp => '向上移動';

  @override
  String get trackActionMoveDown => '下移';

  @override
  String get trackActionRemoveFromFavorites => '從收藏夾中刪除';

  @override
  String get trackActionAddToFavorites => '加入收藏夾';

  @override
  String get trackActionGoToAlbum => '前往相簿';

  @override
  String get trackActionGoToArtist => '前往藝術家';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => '已刪除下載的文件';

  @override
  String get trackActionDeleteFileFailed => '無法刪除下載的文件';

  @override
  String get shuffleBy => '隨機播放';

  @override
  String get shuffleSelectLibrary => '選擇庫';

  @override
  String get shuffleSelectGenre => '選擇類型';

  @override
  String get shuffleLibrary => '圖書館';

  @override
  String get shuffleGenre => '類型';

  @override
  String get shuffleNoLibraries => '沒有可用的相容庫。';

  @override
  String get shuffleNoGenres => '沒有找到適合此隨機播放模式的流派。';

  @override
  String get posterDisplayTitle => '展示';

  @override
  String get posterImageType => '圖片類型';

  @override
  String get imageTypePoster => '海報';

  @override
  String get imageTypeThumbnail => '縮圖';

  @override
  String get imageTypeBanner => '橫幅';

  @override
  String get playlistAddFailed => '無法新增到播放列表';

  @override
  String get playlistCreateFailed => '建立播放清單失敗';

  @override
  String get playlistNew => '新播放列表';

  @override
  String get playlistCreate => '創造';

  @override
  String get playlistCreateNew => '建立新的播放列表';

  @override
  String get playlistNoneFound => '未找到播放列表';

  @override
  String get addToPlaylist => '新增到播放列表';

  @override
  String get lyricsNotAvailable => '沒有可用的歌詞';

  @override
  String get upNext => '下一個';

  @override
  String get playNext => '播放下一個';

  @override
  String get stillWatchingContent => '播放已暫停。你還在看嗎？';

  @override
  String get stillWatchingStop => '停止';

  @override
  String get stillWatchingContinue => '繼續';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => '電視直播';

  @override
  String get continueWatchingAndNextUp => '繼續觀看並繼續觀看';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => '下一集';

  @override
  String get moreFromThisSeason => '本季更多內容';

  @override
  String get playerTooltipPlaybackSpeed => '播放速度';

  @override
  String get playerTooltipCastControls => '投射控制';

  @override
  String get playerTooltipPlaybackQuality => '位元率';

  @override
  String get playerTooltipEnterFullscreen => '進入全螢幕';

  @override
  String get playerTooltipExitFullscreen => '退出全螢幕';

  @override
  String get playerTooltipFloatOnTop => '浮在上面';

  @override
  String get playerTooltipExitFloatOnTop => '禁用頂部浮動';

  @override
  String get playerTooltipLockLandscape => '鎖風景';

  @override
  String get playerTooltipUnlockOrientation => '允許旋轉';

  @override
  String get playerTooltipPrevious => '以前的';

  @override
  String get playerTooltipSeekBack => '回頭尋找';

  @override
  String get playerTooltipSeekForward => '向前尋求';

  @override
  String get contextMenuMarkWatched => '標記為已觀看';

  @override
  String get contextMenuMarkUnwatched => '標記為未觀看';

  @override
  String get contextMenuAddToFavorites => '加入收藏夾';

  @override
  String get contextMenuRemoveFromFavorites => '從收藏夾中刪除';

  @override
  String get contextMenuGoToSeries => '前往系列';

  @override
  String get settingsAdministrationSubtitle => '存取伺服器管理面板';

  @override
  String get settingsAccountSecurity => '帳戶與安全';

  @override
  String get settingsAccountSecuritySubtitle => '身份驗證、PIN 碼和家長控制';

  @override
  String get settingsPersonalization => '個人化';

  @override
  String get settingsPersonalizationSubtitle => '主題、導航、主行和庫可見性';

  @override
  String get settingsDynamicContent => '動態內容';

  @override
  String get settingsDynamicContentSubtitle => '媒體欄和視覺覆蓋';

  @override
  String get settingsPlaybackSyncplay => '回放 & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle => '音訊/視訊設定、字幕、下載和 SyncPlay 控件';

  @override
  String get settingsIntegrationsSubtitle => '插件同步、Seerr、評級等';

  @override
  String get settingsAboutSubtitle => '應用程式版本、法律資訊和製作人員';

  @override
  String get settingsAuthenticationSection => '驗證';

  @override
  String get settingsSortServersBy => '伺服器排序依據';

  @override
  String get settingsLastUsed => '最後使用';

  @override
  String get settingsAlphabetical => '按字母順序';

  @override
  String get settingsPrivacyAndSafetySection => '隱私與安全';

  @override
  String get settingsBlockedRatings => '屏蔽評級';

  @override
  String get settingsGeneralStyle => '通用風格';

  @override
  String get settingsGeneralStyleSubtitle => '主題口音、背景、觀看指示器和主題音樂';

  @override
  String get settingsHomePage => '首頁';

  @override
  String get settingsHomePageSubtitle => '部分、圖像類型、疊加和媒體預覽';

  @override
  String get settingsLibrariesSubtitle => '庫可見性、資料夾視圖和多伺服器行為';

  @override
  String get settingsTwentyFourHourClock => '24 小時制';

  @override
  String get settingsTwentyFourHourClockSubtitle => '無論何時顯示時鐘，都使用 24 小時時間格式';

  @override
  String get settingsShowShuffleButtonInNavigation => '在導覽列中顯示隨機播放按鈕';

  @override
  String get settingsShowGenresButtonInNavigation => '在導覽列中顯示流派按鈕';

  @override
  String get settingsShowFavoritesButtonInNavigation => '在導覽列中顯示收藏夾按鈕';

  @override
  String get settingsShowLibrariesButtonInNavigation => '在導覽列中顯示庫按鈕';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      '切換每個庫的主頁可見性。重新啟動 Moonfin 以使變更生效。';

  @override
  String get settingsMediaBarAndLocalPreviews => '媒體欄和本地預覽';

  @override
  String get settingsVisualOverlays => '視覺疊加';

  @override
  String get settingsSeasonalSurprise => '季節性驚喜';

  @override
  String get settingsMetadataAndRatings => '元數據和評級';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase 支援伺服器端集成，包括附加評級來源、Seerr 請求和同步首選項。';

  @override
  String get settingsOfflineDownloads => '離線下載';

  @override
  String get settingsHigh => '高的';

  @override
  String get settingsLow => '低的';

  @override
  String get settingsCustomPath => '自訂路徑';

  @override
  String get settingsEnterDownloadFolderPath => '輸入下載資料夾路徑';

  @override
  String get settingsConcurrentDownloads => '並發下載';

  @override
  String get settingsConcurrentDownloadsDescription => '一次下載的最大項目數。';

  @override
  String get settingsAppInfo => '應用程式訊息';

  @override
  String get settingsReportAnIssue => '報告問題';

  @override
  String get settingsReportAnIssueSubtitle => '開啟 GitHub 上的問題追蹤器';

  @override
  String get settingsJoinDiscord => '加入 Discord';

  @override
  String get settingsJoinDiscordSubtitle => '與社群聊天';

  @override
  String get settingsJoinTheDiscord => '加入 Discord';

  @override
  String get settingsSupportMoonfin => '支援Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => '合法的';

  @override
  String get settingsLicenses => '許可證';

  @override
  String get settingsOpenSourceLicenseNotices => '開源授權聲明';

  @override
  String get settingsPrivacyPolicy => '隱私權政策';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin 如何處理您的數據';

  @override
  String get settingsCheckForUpdates => '檢查更新';

  @override
  String get settingsCheckForUpdatesSubtitle => '檢查最新的 Moonfin 版本';

  @override
  String get settingsPoweredByFlutter => '由顫動提供支持';

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
  String get settingsBoth => '兩個都';

  @override
  String get settingsShuffleContentTypeFilter => '隨機播放內容類型過濾器';

  @override
  String get settingsVideoPlaybackPreferences => '影片播放首選項';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle => '核心視訊引擎和串流品質設置';

  @override
  String get settingsAudioPreferences => '音訊首選項';

  @override
  String get settingsAudioPreferencesSubtitle => '音軌、處理和直通選項';

  @override
  String get settingsAutomationAndQueue => '自動化和隊列';

  @override
  String get settingsAutomationAndQueueSubtitle => '自動播放和排序';

  @override
  String get settingsOfflineDownloadsSubtitle => '下載品質、儲存限制和佇列大小';

  @override
  String get settingsSyncplaySubtitle => '群組會話的同步邏輯';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      '專業的播放器功能。請謹慎使用，因為某些選項可能會導致播放問題';

  @override
  String get settingsSkipIntrosAndOutros => '跳過片頭和片尾？';

  @override
  String get settingsPromptUser => '提示用戶';

  @override
  String get settingsSkip => '跳過';

  @override
  String get settingsDoNothing => '什麼都不做';

  @override
  String get settingsMaxBitrateDescription => '限制串流媒體比特率。高於此閾值的內容將進行轉碼以適應。';

  @override
  String get settingsMaxResolutionDescription =>
      '限製播放器請求的最大解析度。更高解析度的內容將會被轉碼下來。';

  @override
  String get settingsPlayerZoomDescription => '如何縮放影片以適合螢幕。';

  @override
  String get settingsPlaybackEngineAndroidTv => '播放引擎 (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      '選擇 Android TV 裝置上的預設播放引擎。變更適用於下一個播放會話。';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3（建議）';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv（舊版）';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision 後備';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      '沒有 Dolby Vision 解碼的裝置上 Dolby Vision 標題的行為。';

  @override
  String get settingsAskEachTime => '每次都詢問';

  @override
  String get settingsPreferHdr10Fallback => '偏好 HDR10 後備';

  @override
  String get settingsPreferServerTranscode => '首選伺服器轉碼';

  @override
  String get settingsDolbyVisionProfile7DirectPlay => 'Dolby Vision 設定檔 7 直接播放';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      '控制 Dolby Vision 設定檔 7 增強層流是否應直接播放。';

  @override
  String get settingsAutoAftkrtEnabled => '自動（AFTKRT 已啟用）';

  @override
  String get settingsEnabledOnThisDevice => '在此裝置上啟用';

  @override
  String get settingsDisabledPreferTranscode => '已停用（首選轉碼）';

  @override
  String get settingsResumeRewindDescription => '恢復播放時（從「繼續觀看」或媒體項目頁面），應倒回多少秒？';

  @override
  String get settingsUnpauseRewindDescription => '按下暫停按鈕後恢復播放時，該倒回幾秒？';

  @override
  String get settingsSkipBackLengthDescription => '按下快退按鈕後跳回多少秒。';

  @override
  String get settingsOneSecond => '1秒';

  @override
  String get settingsThreeSeconds => '3秒';

  @override
  String get settingsFortyFiveSeconds => '45秒';

  @override
  String get settingsSixtySeconds => '60秒';

  @override
  String get settingsSkipForwardLengthDescription => '按下快轉按鈕後快轉多少秒。';

  @override
  String get settingsBitstreamAc3ToExternalDecoder => '位元流 AC3 到外部解碼器';

  @override
  String get settingsCinemaMode => '影院模式';

  @override
  String get settingsCinemaModeSubtitle => '在主要功能之前播放預告片/預卷';

  @override
  String get settingsNextUpDisplayDescription =>
      '擴展顯示包含劇集插圖和描述的完整卡片。最小顯示緊湊的倒數疊加。禁用會完全隱藏提示。';

  @override
  String get settingsShort => '短的';

  @override
  String get settingsLong => '長的';

  @override
  String get settingsVeryLong => '很長';

  @override
  String get settingsVideoStartDelay => '視訊開始延遲';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => '直播電視直播';

  @override
  String get settingsLiveTvDirectSubtitle => '啟用直播電視直接播放';

  @override
  String get settingsOpenGroups => '公開組';

  @override
  String get settingsOpenGroupsSubtitle => '建立、加入或管理 SyncPlay 群組';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay 已啟用';

  @override
  String get settingsSyncplayEnabledSubtitle => '啟用群組觀看功能';

  @override
  String get settingsSyncplayButton => 'SyncPlay 按鈕';

  @override
  String get settingsSyncplayButtonSubtitle => '在導覽列上顯示 SyncPlay 按鈕';

  @override
  String get settingsSyncplayAdvancedCorrection => '進階修正';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle => '啟用細粒度同步邏輯';

  @override
  String get settingsSyncplaySyncCorrection => '同步校正';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle => '自動調整播放以保持同步';

  @override
  String get settingsSyncplaySpeedToSync => '同步速度';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle => '使用播放速度調整來同步';

  @override
  String get settingsSyncplaySkipToSync => '跳至同步';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => '使用搜尋來同步';

  @override
  String get settingsSyncplayMinimumSpeedDelay => '最小速度延遲';

  @override
  String get settingsSyncplayMaximumSpeedDelay => '最大速度延遲';

  @override
  String get settingsSyncplaySpeedDuration => '速度持續時間';

  @override
  String get settingsSyncplayMinimumSkipDelay => '最小跳躍延遲';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay 額外偏移';

  @override
  String get onNow => '現在播出';

  @override
  String get collections => '收藏';

  @override
  String get lastPlayed => '上次玩過';

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
