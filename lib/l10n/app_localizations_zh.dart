// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get animeMarkerFiller => '原创剧情';

  @override
  String get animeMarkerMixed => '混合剧情';

  @override
  String get animeMarkerAnimeCanon => '动画原创';

  @override
  String get animeMarkerMangaCanon => '漫画原作';

  @override
  String get animeMarkerSubbed => '字幕版';

  @override
  String get animeMarkerDubbed => '配音版';

  @override
  String get animeMarkerSubbedAndDubbed => '字幕/配音版';

  @override
  String get animeMarkerSubbedShort => '字幕';

  @override
  String get animeMarkerDubbedShort => '配音';

  @override
  String get animeMarkerSubbedAndDubbedShort => '字幕/配音';

  @override
  String get animeMarkerPending => '待处理';

  @override
  String get animeMarkerRecap => '回顾';

  @override
  String get interfaceLanguage => '界面语言';

  @override
  String get systemLanguageDefault => '跟随系统';

  @override
  String get signIn => '登录';

  @override
  String get signingIn => '正在登录…';

  @override
  String get empty => '空';

  @override
  String connectingToServer(String serverName) {
    return '正在连接到 $serverName';
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
  String get quickConnectInstruction => '在服务器的 Web 控制台中输入此代码：';

  @override
  String get quickConnectScanHint => '或使用已登录服务器的手机扫描此代码';

  @override
  String get quickConnectTapOrScanHint => '在浏览器中点击以批准，或使用其他设备扫描此代码';

  @override
  String get timesUpTitle => '时间到';

  @override
  String get timesUpMessage => '此账号当前不可用。';

  @override
  String timesUpResumesToday(String time) {
    return '今天 $time 可再次使用。';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return '明天 $time 可再次使用。';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return '$day $time 可再次使用。';
  }

  @override
  String get waitingForAuthorization => '正在等待授权…';

  @override
  String get back => '返回';

  @override
  String get serverUnavailable => '服务器不可用';

  @override
  String get loginFailed => '登录失败';

  @override
  String get loginForbidden => '此账号当前无法登录。可能不在允许的时间段内、已被锁定或已禁用。请稍后重试或联系管理员。';

  @override
  String quickConnectUnavailable(String detail) {
    return '快速连接不可用：$detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return '快速连接不可用（$status）：$detail';
  }

  @override
  String get whosWatching => '谁在观看？';

  @override
  String get signedInOnThisDevice => '已在此设备登录';

  @override
  String get pinRequired => '需要 PIN';

  @override
  String get passwordRequired => '需要密码';

  @override
  String continueAsUser(String name) {
    return '以 $name 身份继续';
  }

  @override
  String switchToUser(String name) {
    return '切换到 $name';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return '已在 $server 上以 $user 身份登录';
  }

  @override
  String get accountActive => '启用中';

  @override
  String get addUser => '添加用户';

  @override
  String get selectServer => '选择服务器';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin 版本 $version';
  }

  @override
  String get savedServers => '已保存的服务器';

  @override
  String get discoveredServers => '发现的服务器';

  @override
  String get noneFound => '未找到';

  @override
  String get unableToConnectToServer => '无法连接到服务器';

  @override
  String get addServer => '添加服务器';

  @override
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => '删除服务器';

  @override
  String removeServerConfirmation(String serverName) {
    return '要从服务器列表中移除“$serverName”吗？';
  }

  @override
  String get cancel => '取消';

  @override
  String get remove => '移除';

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
      'Moonfin 无法访问系统密钥环。仍可继续登录，但在密钥环解锁前，安全令牌存储可能不可用。';

  @override
  String get ok => '确定';

  @override
  String get settingsAppearanceTheme => '应用主题';

  @override
  String get detailScreenStyle => '详情界面样式';

  @override
  String get detailScreenStyleSubtitle =>
      'Moonfin 是经典布局；Modern 是自适应影院风布局。Spotlight 是一种以主视觉区优先、带有弹出式内容卡片的布局。Nouveau 是一种全屏布局，各个版块沿页面自上而下堆叠。Minimalist 是有封面图、一个播放按钮和各集列表。';

  @override
  String get detailScreenStyleMoonfin => 'Moonfin';

  @override
  String get detailScreenStyleModern => '现代';

  @override
  String get detailScreenStyleSpotlight => '聚光灯';

  @override
  String get spotlightMoreActions => '更多操作';

  @override
  String get spotlightCastCrewStudios => '演员、工作人员和工作室';

  @override
  String get spotlightChaptersExtras => '章节和花絮';

  @override
  String get spotlightFileDetails => '文件详情';

  @override
  String get spotlightSimilarRecommendations => '相似推荐与推荐';

  @override
  String get spotlightSeasonsEpisodes => '季和集';

  @override
  String get spotlightMoreEpisodes => '更多集数';

  @override
  String get spotlightFilmography => '作品列表';

  @override
  String get spotlightCollectionsCard => '合集';

  @override
  String get spotlightPlaylistOrder => '播放列表顺序';

  @override
  String get spotlightMoviesAndShows => '电影和电视剧';

  @override
  String get spotlightSimilarSeerr => '相似推荐（Seerr）';

  @override
  String get spotlightRecommendationsSeerr => '推荐（Seerr）';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 人',
      one: '1 人',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条信息',
      one: '1 条信息',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个标签',
      one: '1 个标签',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个工作室',
      one: '1 个工作室',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个章节',
      one: '1 个章节',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 段花絮',
      one: '1 段花絮',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 季',
      one: '1 季',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 集',
      one: '1 集',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 部电影',
      one: '1 部电影',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 部电视剧',
      one: '1 部电视剧',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个曲目',
      one: '1 个曲目',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个媒体项',
      one: '1 个媒体项',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张专辑',
      one: '1 张专辑',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个合集',
      one: '1 个合集',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个标题',
      one: '1 个标题',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => '新潮';

  @override
  String get detailScreenStyleMinimalist => '极简';

  @override
  String get detailScreenStyleStage => '舞台';

  @override
  String get detailScreenStylePremiere => '首映';

  @override
  String get detailScreenStyleQuickLook => '速览';

  @override
  String get detailScreenStyleFrost => '磨砂';

  @override
  String get quickLookOpenFullPage => '打开完整页面';

  @override
  String get quickLookBackToClose => '返回以关闭';

  @override
  String quickLookSeasonPlayed(int played, int total) {
    return '$played / $total';
  }

  @override
  String get expandedTabs => '自动展开标签页';

  @override
  String get expandedTabsSubtitle => '浏览时自动加载标签内容；关闭后需手动展开/收起标签。';

  @override
  String get showTechnicalDetails => '显示媒体详情';

  @override
  String get showTechnicalDetailsSubtitle => '在顶部概览栏显示编码、分辨率及音视频流信息';

  @override
  String get recommendationSystem => '推荐系统';

  @override
  String get recommendationSystemSubtitle =>
      '使用 Moonfin Recommends 本地媒体库算法、Jellyfin Recommends 服务器引擎，或在线 TMDb 的相似度指标。注意：在线推荐需要集成 Seerr。';

  @override
  String get recommendationSystemMoonfin => 'Moonfin 智能推荐';

  @override
  String get recommendationSystemJellyfin => '服务器推荐';

  @override
  String get recommendationSystemTmdb => 'TMDb 相似影片推荐';

  @override
  String get recommendationsApplyParentalRatingCap => '启用推荐分级限制';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      '按目标媒体的家长分级限制 Moonfin 推荐内容';

  @override
  String get interfaceStyle => '界面风格';

  @override
  String get interfaceStyleSubtitle =>
      '“自动模式”会在苹果设备上原生适配苹果外观。选择“Apple”可强制启用苹果界面风格，选择“Material”则使用标准界面样式。';

  @override
  String get interfaceStyleAutomatic => '自动模式';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => '界面布局';

  @override
  String get interfaceLayoutSubtitle => '当此设备识别错误时覆盖检测到的布局。重启 Moonfin 使更改生效。';

  @override
  String get interfaceLayoutAutomatic => '自动';

  @override
  String get interfaceLayoutTv => '电视';

  @override
  String get interfaceLayoutDesktop => '桌面';

  @override
  String get interfaceLayoutPhone => '手机';

  @override
  String get glassQuality => '玻璃质感';

  @override
  String get oledMode => 'OLED 模式';

  @override
  String get oledModeSubtitle => '加深黑色，提升艺术图的色彩表现力。OLED 显示屏效果最佳。';

  @override
  String get oledModeSubtle => '柔和';

  @override
  String get oledModeVivid => '鲜艳';

  @override
  String get glassQualitySubtitle =>
      '自动为该设备选择最佳玻璃效果。完整会强制使用真实模糊；简化使用轻量级玻璃效果以节省 GPU 资源。';

  @override
  String get glassQualityAuto => '自动';

  @override
  String get glassQualityFull => '完整';

  @override
  String get glassQualityReduced => '简化';

  @override
  String get performanceMode => '性能模式';

  @override
  String get performanceModeSubtitle =>
      '自动检测设备性能，对内存不足设备进行性能限制，减少内存中缓存图片数量，预告片仅显示静态图片。设置将在下次启动完全生效。';

  @override
  String get performanceModeAuto => '自动';

  @override
  String get performanceModeStandard => '标准';

  @override
  String get performanceModeReduced => '降低';

  @override
  String get rendererMode => '渲染器';

  @override
  String get rendererModeSubtitle =>
      '自动模式会在图形处理能流畅运行 Impeller 的设备上使用 Impeller，其他设备使用 Skia。如果动画或视频显示异常，请选择 Skia。下次启动时生效。';

  @override
  String get rendererModeAuto => '自动';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack => '已关闭：当前设备性能模式设置为降低';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '可在 Moonfin 与 Neon Pulse 之间切换，无需重启应用。';

  @override
  String get customThemeTitle => '自定义主题';

  @override
  String get customThemeSubtitle => '自定义主题可更改 Moonfin 全部视觉元素，从中挑选一款贴合你的使用风格。';

  @override
  String get keyboardStyle => '键盘样式';

  @override
  String get keyboardStyleDescription =>
      '原生使用电视自带的键盘。经典是 Moonfin 原有的键盘。玻璃是带更大按键的磨砂面板。停靠式占据屏幕底部，并在按键上方显示你输入的内容。';

  @override
  String get keyboardStyleNative => '原生';

  @override
  String get keyboardStyleClassic => 'Moonfin';

  @override
  String get keyboardStyleGlass => '玻璃';

  @override
  String get keyboardStyleDocked => '停靠式';

  @override
  String get keyboardSpace => '空格';

  @override
  String get keyboardHoldForAccents => '长按可输入变音符号';

  @override
  String get keyboardClose => '关闭';

  @override
  String get controller => '手柄控制器';

  @override
  String get gamepadNavigation => '手柄导航';

  @override
  String get gamepadNavigationDescription => '允许已连接游戏手柄移动焦点并选择项目';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '原版简洁清爽的 Moonfin 默认界面。';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle => '合成波风格，带洋红光效、青色文字和更强的金属质感对比';

  @override
  String get themeGlass => '玻璃';

  @override
  String get themeGlassSubtitle => '液态玻璃风格，带流动渐变背景、磨砂表面和 Apple 蓝强调色';

  @override
  String get theme8BitHero => '8-bit 英雄';

  @override
  String get theme8BitHeroSubtitle => '复古像素艺术风格，具有粗犷的调色板、方块边框、强烈的阴影和像素字体';

  @override
  String get embyConnectSignInSubtitle => '使用你的 Emby Connect 账号登录';

  @override
  String get emailOrUsername => '电子邮件或用户名';

  @override
  String get selectAServer => '选择服务器';

  @override
  String get tryAgain => '重试';

  @override
  String get noLinkedServers => '此 Emby Connect 账号没有关联的服务器';

  @override
  String get invalidEmbyConnectCredentials => 'Emby Connect 凭据无效';

  @override
  String get invalidEmbyConnectLogin => 'Emby Connect 用户名或密码无效';

  @override
  String get embyConnectExchangeNotSupported => '服务器不支持 Emby Connect 账号交互验证';

  @override
  String get embyConnectNetworkError => '连接 Emby Connect 或所选服务器时出现网络错误';

  @override
  String get signInWithPlex => '使用 Plex 登录';

  @override
  String get plexLinkInstructions => '在任意设备上访问 plex.tv/link 并输入此代码';

  @override
  String get plexOpenLink => '打开 plex.tv/link';

  @override
  String get plexWaitingForApproval => '正在等待你批准代码…';

  @override
  String get plexSignInWithPassword => '使用密码登录';

  @override
  String get plexVerificationCode => '验证码';

  @override
  String get plexNoServers => '此账号下未找到 Plex 服务器';

  @override
  String get loadingLinkedServers => '正在加载关联服务器…';

  @override
  String get connectingToServerEllipsis => '正在连接到服务器…';

  @override
  String get noReachableAddress => '未提供可访问的地址';

  @override
  String get invalidServerExchangeResponse => '来自服务器交换端点的无效响应';

  @override
  String unableToConnectTo(String target) {
    return '无法连接到 $target';
  }

  @override
  String get exitApp => '退出 Moonfin？';

  @override
  String get exitAppConfirmation => '确定要退出吗？';

  @override
  String get exit => '退出';

  @override
  String get gameMenu => '菜单';

  @override
  String get gamePaused => '已暂停';

  @override
  String get gameSaveState => '保存存档';

  @override
  String get games => '游戏';

  @override
  String get gameLoadState => '读取存档';

  @override
  String get gameFastForward => '快进';

  @override
  String get gameOrientation => '游戏屏幕方向';

  @override
  String get gameOrientationSubtitle => '玩游戏时的屏幕方向';

  @override
  String get landscape => '横屏';

  @override
  String get portrait => '竖屏';

  @override
  String get gameEmulatorSettings => '模拟器设置';

  @override
  String get gameNoCoreOptions => '此核心没有可调整的选项。';

  @override
  String get gameHoldToOpenMenu => '按住打开菜单';

  @override
  String get gameKeepPlaying => '继续游玩';

  @override
  String get gameSaveAndExit => '保存并退出';

  @override
  String get gameExitGame => '退出游戏';

  @override
  String get gameSavingBeforeExit => '正在保存…';

  @override
  String get gameSaveFailedStillPlaying => '无法保存状态，游戏仍在进行。';

  @override
  String get gamePlaybackUnsupported => '此设备暂不支持游戏播放。';

  @override
  String get noHomeRowsLoaded => '无法加载首页行';

  @override
  String get noHomeRowsHint => '请尝试刷新，或减少启用的首页栏目。';

  @override
  String get retryHomeRows => '重试加载首页行';

  @override
  String get guide => '节目指南';

  @override
  String get recordings => '录制内容';

  @override
  String get schedule => '日程';

  @override
  String get series => '剧集';

  @override
  String get noItemsFound => '未找到媒体项';

  @override
  String get home => '首页';

  @override
  String get browseAll => '浏览全部';

  @override
  String get genres => '类型';

  @override
  String get collectionPlaceholder => '合集中的媒体项会显示在这里';

  @override
  String get browseByLetter => '按字母浏览';

  @override
  String get alphabeticalBrowsePlaceholder => '按字母浏览的内容会显示在这里';

  @override
  String get suggestions => '推荐';

  @override
  String get suggestionsPlaceholder => '推荐内容会显示在这里';

  @override
  String get failedToLoadLibraries => '加载媒体库失败';

  @override
  String get noLibrariesFound => '未找到媒体库';

  @override
  String get library => '媒体库';

  @override
  String get displaySettings => '显示设置';

  @override
  String get allGenres => '所有类型';

  @override
  String get noGenresFound => '未找到类型';

  @override
  String failedToLoadFolderError(String error) {
    return '加载文件夹失败：$error';
  }

  @override
  String get thisFolderIsEmpty => '此文件夹为空';

  @override
  String itemCountLabel(int count) {
    return '$count 个媒体项';
  }

  @override
  String get failedToLoadFavorites => '加载收藏失败';

  @override
  String get retry => '重试';

  @override
  String get noFavoritesYet => '还没有收藏';

  @override
  String get favorites => '收藏';

  @override
  String totalCountItems(int count) {
    return '共 $count 个媒体项';
  }

  @override
  String get continuing => '连载中';

  @override
  String get ended => '已完结';

  @override
  String get sortAndFilter => '排序与筛选';

  @override
  String get type => '类型';

  @override
  String get sortBy => '排序方式';

  @override
  String get display => '显示';

  @override
  String get imageType => '图片类型';

  @override
  String get posterSize => '海报尺寸';

  @override
  String get small => '小';

  @override
  String get medium => '中';

  @override
  String get large => '大';

  @override
  String get extraLarge => '超大';

  @override
  String get uiScaleGrandparents => '祖父母';

  @override
  String get uiScaleGreatGrandparents => '曾祖父母';

  @override
  String get scrollDirection => '滚动方向';

  @override
  String get scrollDirectionVertical => '垂直';

  @override
  String get scrollDirectionHorizontal => '横向';

  @override
  String libraryGenresTitle(String name) {
    return '$name - 类型';
  }

  @override
  String get views => '视图';

  @override
  String get albums => '专辑';

  @override
  String get albumArtists => '专辑艺人';

  @override
  String get artists => '艺人';

  @override
  String get bookmarks => '书签';

  @override
  String get noSavedBookmarks => '此作品还没有保存的书签。';

  @override
  String get openBook => '打开图书';

  @override
  String get chapter => '章节';

  @override
  String get page => '页';

  @override
  String get bookmark => '书签';

  @override
  String get justNow => '刚刚';

  @override
  String minutesAgo(int count) {
    return '$count 分钟前';
  }

  @override
  String hoursAgo(int count) {
    return '$count 小时前';
  }

  @override
  String daysAgo(int count) {
    return '$count 天前';
  }

  @override
  String get discoverySubjects => '发现主题';

  @override
  String get apply => '应用';

  @override
  String get openLink => '打开链接';

  @override
  String get scanWithYourPhone => '用手机扫描';

  @override
  String get audiobookGenres => '有声读物类型';

  @override
  String get scrollLeft => '向左滚动';

  @override
  String get scrollRight => '向右滚动';

  @override
  String get scrollToTop => '返回顶部';

  @override
  String get couldNotLoadGenre => '目前无法加载此类型。';

  @override
  String get continueReading => '继续阅读';

  @override
  String get savedHighlights => '已保存的标注';

  @override
  String get continueListening => '继续收听';

  @override
  String get listen => '收听';

  @override
  String get resume => '继续';

  @override
  String get failedToLoadLibrary => '加载媒体库失败';

  @override
  String get popularNow => '热门内容';

  @override
  String get savedForLater => '稍后阅读';

  @override
  String get topListens => '热门收听';

  @override
  String get unreadDiscoveries => '未读发现';

  @override
  String get pickUpAgain => '继续上次阅读';

  @override
  String get bookHighlightsDescription => '包含标注、收藏或阅读进度的图书。';

  @override
  String get handPickedFromLibrary => '从你的媒体库中精选。';

  @override
  String get handPickedFromListeningQueue => '从你的收听队列中精选。';

  @override
  String get booksWithHighlights => '包含标注、收藏或阅读进度的图书。';

  @override
  String get jumpBackNarration => '无需寻找位置，直接回到上次收听处。';

  @override
  String get unreadBooksReady => '未读图书已准备好，适合下一个安静时段。';

  @override
  String get quickAccessFavorites => '快速打开你反复回看的图书。';

  @override
  String get searchAudiobooks => '搜索有声读物';

  @override
  String get searchYourLibrary => '搜索你的媒体库';

  @override
  String get pickUpStory => '从上次停下的地方继续';

  @override
  String get savedPlacesChapters => '你保存的位置和未读完的章节';

  @override
  String authorsCount(int count) {
    return '$count 位作者';
  }

  @override
  String genresCount(int count) {
    return '$count 个类型';
  }

  @override
  String percentCompleted(int percent) {
    return '已完成 $percent%';
  }

  @override
  String get readyWhenYouAre => '准备好后即可开始';

  @override
  String get details => '详情';

  @override
  String get listeningRoom => '听音室';

  @override
  String get bookmarksAndProgress => '书签和进度';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count 部作品，按阅读优先的方式整理。';
  }

  @override
  String get titles => '作品';

  @override
  String get allTitles => '全部作品';

  @override
  String get authors => '作者';

  @override
  String get browseByAuthor => '按作者浏览';

  @override
  String get browseByGenre => '按类型浏览';

  @override
  String get discover => '发现';

  @override
  String get noBookmarkedItems => '还没有添加书签的媒体项';

  @override
  String get nothingMatchesSection => '此栏目暂无匹配内容。可尝试其他标签页，或等待媒体库同步完成后再回来查看。';

  @override
  String get audiobooks => '有声读物';

  @override
  String noLabelFound(String label) {
    return '未找到 $label';
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
  String get readStatus => '已读';

  @override
  String get watched => '已观看';

  @override
  String get unread => '未读';

  @override
  String get unwatched => '未观看';

  @override
  String get seriesStatus => '剧集状态';

  @override
  String get allLibraries => '所有媒体库';

  @override
  String get books => '图书';

  @override
  String get latestBooks => '最新图书';

  @override
  String get latestAudiobooks => '最新有声读物';

  @override
  String get latestComics => '最新漫画';

  @override
  String get comics => '漫画';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本书',
      one: '1 本书',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => '图书';

  @override
  String get bookFormatAudiobook => '有声读物';

  @override
  String get bookFormatComic => '漫画';

  @override
  String get noBooksFound => '未找到该作者的图书';

  @override
  String get noBooksFoundDescription => '此媒体库中暂无书籍、有声书或漫画。';

  @override
  String bookPercentRead(int percent) {
    return '$percent% 已读';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time 剩余';
  }

  @override
  String get bookHeroRead => '阅读';

  @override
  String get bookHeroListen => '收听';

  @override
  String get author => '作者';

  @override
  String get unknownAuthor => '作者未知';

  @override
  String get uncategorized => '未分类';

  @override
  String get overview => '简介';

  @override
  String get noLibrivoxDescription => 'LibriVox 尚未提供此作品简介。';

  @override
  String get readers => '朗读者';

  @override
  String get openLinks => '外部链接';

  @override
  String get librivoxPage => 'LibriVox 页面';

  @override
  String get internetArchive => '互联网档案馆';

  @override
  String get rssFeed => 'RSS 源';

  @override
  String get downloadZip => '下载 Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count 个分段';
  }

  @override
  String firstPublished(int year) {
    return '$year 年首次发布';
  }

  @override
  String get noOpenLibraryOverview => 'Open Library 尚未提供此作品的简介。';

  @override
  String get subjects => '主题';

  @override
  String get all => '全部';

  @override
  String booksCount(int count) {
    return '$count 本图书';
  }

  @override
  String get couldNotLoadSubject => '目前无法加载该主题。';

  @override
  String get audiobookDetails => '有声读物详情';

  @override
  String authorsCountTitle(int count) {
    return '$count 位作者';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本有声书',
      one: '1 本有声书',
    );
    return '$_temp0';
  }

  @override
  String get trackList => '曲目列表';

  @override
  String get itemListPlaceholder => '媒体项列表将出现在这里';

  @override
  String get failedToLoad => '加载失败';

  @override
  String get delete => '删除';

  @override
  String get save => '保存';

  @override
  String get moreLikeThis => '更多类似内容';

  @override
  String get castAndCrew => '演职人员';

  @override
  String get collection => '合集';

  @override
  String get episodes => '剧集';

  @override
  String get nextUp => '接下来播放';

  @override
  String get seasons => '季';

  @override
  String get chapters => '章节';

  @override
  String get features => '花絮';

  @override
  String get movies => '电影';

  @override
  String get musicVideos => '音乐视频';

  @override
  String get other => '其他';

  @override
  String get discography => '唱片目录';

  @override
  String get similarArtists => '相似艺人';

  @override
  String get tableOfContents => '目录';

  @override
  String get tracklist => '曲目列表';

  @override
  String discNumber(int number) {
    return '碟片 $number';
  }

  @override
  String get biography => '传记';

  @override
  String get authorDetails => '作者详情';

  @override
  String get noOverviewAvailable => '此作品暂无简介。';

  @override
  String get noBiographyAvailable => '此作者暂无传记。';

  @override
  String get unableToLoadAuthorDetails => '目前无法加载作者详情。';

  @override
  String published(int year) {
    return '$year 年出版';
  }

  @override
  String get publicationDateUnknown => '出版日期未知';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 季',
      one: '1 季',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time 结束';
  }

  @override
  String get items => '项目';

  @override
  String get extras => '额外';

  @override
  String get additionalParts => '附加部分';

  @override
  String get behindTheScenes => '幕后花絮';

  @override
  String get deletedScenes => '删除场景';

  @override
  String get featurettes => '短片';

  @override
  String get interviews => '访谈';

  @override
  String get scenes => '场景';

  @override
  String get shorts => '短片';

  @override
  String get trailers => '预告片';

  @override
  String timeRemaining(String time) {
    return '剩余 $time';
  }

  @override
  String endsIn(String time) {
    return '$time 后结束';
  }

  @override
  String get view => '查看';

  @override
  String get resumeReading => '继续阅读';

  @override
  String get read => '阅读';

  @override
  String resumeFrom(String position) {
    return '从 $position 继续';
  }

  @override
  String get play => '播放';

  @override
  String get startOver => '重新开始';

  @override
  String get restart => '重启';

  @override
  String get readOffline => '离线阅读';

  @override
  String get playOffline => '离线播放';

  @override
  String get audio => '音频';

  @override
  String get subtitles => '字幕';

  @override
  String get version => '版本';

  @override
  String get cast => '投屏';

  @override
  String get castMembers => '演员表';

  @override
  String get trailer => '预告片';

  @override
  String get finished => '已完成';

  @override
  String get favorited => '已收藏';

  @override
  String get favorite => '收藏';

  @override
  String get playlist => '播放列表';

  @override
  String get downloaded => '已下载';

  @override
  String get finalizingDownload => '正在整理…';

  @override
  String get queuedDownload => '已排队';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '还有$count项排队',
      one: '还有 1 项排队',
    );
    return '$_temp0';
  }

  @override
  String get downloadAll => '全部下载';

  @override
  String get download => '下载';

  @override
  String get deleteDownloaded => '删除已下载内容';

  @override
  String get goToSeries => '前往剧集';

  @override
  String get editMetadata => '编辑元数据';

  @override
  String get less => '收起';

  @override
  String get more => '更多';

  @override
  String get deleteItem => '删除媒体项';

  @override
  String get deletePlaylist => '删除播放列表';

  @override
  String get deletePlaylistMessage => '要从服务器删除此播放列表吗？';

  @override
  String get deleteItemMessage => '要从服务器删除此媒体项吗？';

  @override
  String get failedToDeletePlaylist => '删除播放列表失败';

  @override
  String get failedToDeleteItem => '删除媒体项失败';

  @override
  String failedToDeleteItemWithError(String error) {
    return '删除操作失败，错误信息如下：$error';
  }

  @override
  String get renamePlaylist => '重命名播放列表';

  @override
  String get playlistName => '播放列表名称';

  @override
  String get deleteDownloadedAlbum => '删除已下载专辑';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '要删除“$title”的已下载曲目吗？';
  }

  @override
  String get downloadedTracksDeleted => '已删除下载曲目';

  @override
  String get downloadedTracksDeleteFailed => '部分下载曲目无法删除';

  @override
  String get noTracksLoaded => '未加载曲目';

  @override
  String noItemsLoaded(String itemLabel) {
    return '未加载 $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '正在下载 $title（$count 个媒体项）…';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '确定要从服务器删除“$name”吗？此操作无法撤销。';
  }

  @override
  String get itemDeleted => '媒体项已删除';

  @override
  String get noPlayableTrailerFound => '找不到可播放的预告片。';

  @override
  String unsupportedBookFormat(String extension) {
    return '不支持的图书格式：.$extension';
  }

  @override
  String get audioTrack => '音轨';

  @override
  String get noOtherAudioTracks => '没有其他音轨';

  @override
  String get subtitleTrack => '字幕轨道';

  @override
  String get none => '无';

  @override
  String get downloadSubtitlesLabel => '下载字幕...';

  @override
  String get searchOpenSubtitlesPlugin => '使用 OpenSubtitles 搜索';

  @override
  String get downloadSubtitles => '下载字幕';

  @override
  String get searchingSubtitles => '正在搜索字幕…';

  @override
  String get fetchingSubtitles => '正在获取字幕';

  @override
  String get downloadingSubtitle => '正在下载字幕…';

  @override
  String get selectedSubtitleInvalid => '所选的字幕无效。';

  @override
  String subtitleDownloadedSelected(String name) {
    return '下载并选择字幕：$name';
  }

  @override
  String get subtitleDownloadedPending =>
      '字幕已下载。Jellyfin 刷新此媒体项时，字幕可能需要稍等片刻才会出现。';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '找不到 $language 的远程字幕。';
  }

  @override
  String get selectVersion => '选择版本';

  @override
  String versionNumber(int number) {
    return '版本 $number';
  }

  @override
  String get downloadAllQuality => '全部下载 - 画质';

  @override
  String get downloadQuality => '下载画质';

  @override
  String get originalFileNoReencoding => '原始文件，不重新编码';

  @override
  String get originalFilesNoReencoding => '原始文件，不重新编码';

  @override
  String get noEpisodesLoaded => '未加载剧集';

  @override
  String get downloadScopeTitle => '下载范围';

  @override
  String get downloadAllEpisodes => '全部剧集';

  @override
  String get downloadUnwatchedEpisodes => '全部未观看剧集';

  @override
  String get downloadAllMovies => '全部电影';

  @override
  String get downloadUnwatchedMovies => '全部未观看电影';

  @override
  String get downloadScopeLoading => '正在加载项目…';

  @override
  String get downloadScopeLoadFailed => '无法加载待下载项目';

  @override
  String downloadEstimateTotal(String size) {
    return '总计约 $size';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received / $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/秒';
  }

  @override
  String downloadSizeTotal(String size) {
    return '总计 $size';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count 项大小未知';
  }

  @override
  String downloadingItem(String name, String quality) {
    return '正在下载 $name（$quality）...';
  }

  @override
  String get deleteDownloadedFiles => '删除已下载文件';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '删除 $typeLabel 的本地文件？\n\n这将释放存储空间。你可以稍后重新下载。';
  }

  @override
  String get downloadedFilesDeleted => '已删除下载文件';

  @override
  String get failedToDeleteFiles => '删除文件失败';

  @override
  String get deleteFiles => '删除文件';

  @override
  String get director => '导演';

  @override
  String get starring => '主演';

  @override
  String get directors => '导演';

  @override
  String get writer => '编剧';

  @override
  String get writers => '编剧';

  @override
  String get episodeDirector => '本集导演';

  @override
  String episodeDirectorWithRole(String role) {
    return '$role（本集导演）';
  }

  @override
  String get episodeWriter => '本集编剧';

  @override
  String episodeWriterWithRole(String role) {
    return '$role（本集编剧）';
  }

  @override
  String get guestStar => '客串演员';

  @override
  String guestStarWithRole(String role) {
    return '$role（客串演员）';
  }

  @override
  String get studio => '制片公司';

  @override
  String studioMoreCount(int count) {
    return '+$count 个';
  }

  @override
  String totalEpisodes(int count) {
    return '$count 集';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '第 $number 集';
  }

  @override
  String chapterNumber(int number) {
    return '第 $number 章';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 首',
      one: '1 首',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 章',
      one: '1 章',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return '出生：$date';
  }

  @override
  String died(String date) {
    return '逝世：$date';
  }

  @override
  String age(int age) {
    return '年龄 $age';
  }

  @override
  String get showLess => '收起';

  @override
  String get readMore => '阅读更多';

  @override
  String get shuffle => '随机播放';

  @override
  String get shuffleAll => '随机播放全部';

  @override
  String get shuffleAllMusic => '随机播放所有音乐';

  @override
  String get carSignInPrompt => '在手机上登录 Moonfin';

  @override
  String get carServerUnreachable => '无法连接到服务器';

  @override
  String downloadsCount(int count) {
    return '$count 次下载';
  }

  @override
  String get perfectMatch => '完全匹配';

  @override
  String get aiTranslated => 'AI 翻译';

  @override
  String get machineTranslated => '机器翻译';

  @override
  String get hearingImpaired => '听障字幕';

  @override
  String framerateFps(String rate) {
    return '$rate 帧/秒';
  }

  @override
  String get mono => '单声道';

  @override
  String get stereo => '立体声';

  @override
  String remoteSubtitlePermissionError(String action) {
    return '远程字幕请求需要此用户拥有 Jellyfin 字幕管理权限（$action）。';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return '服务器上找不到这个媒体，无法处理远程字幕请求（$action）。';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '远程字幕请求失败（$action）：$detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '远程字幕请求失败（$action，HTTP $status）。';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '远程字幕请求失败（$action）。';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '“$name”的所有已下载剧集';
  }

  @override
  String get deleteSeasonFiles => '本季所有已下载剧集';

  @override
  String get stillWatching => '还在观看吗？';

  @override
  String get unableToLoadTrailerStream => '无法加载预告片流。';

  @override
  String get trailerTimedOut => '预告片加载超时。';

  @override
  String get playbackFailedForTrailer => '该预告片播放失败。';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline => '离线播放时无法投屏。';

  @override
  String castActionFailed(String label, String error) {
    return '$label 操作失败：$error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return '设置投屏音量失败：$error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label 控制';
  }

  @override
  String get deviceVolume => '设备音量';

  @override
  String get unavailable => '不可用';

  @override
  String get pause => '暂停';

  @override
  String get syncPosition => '同步进度';

  @override
  String stopCast(String label) {
    return '停止 $label';
  }

  @override
  String get queueIsEmpty => '队列为空';

  @override
  String trackNumber(int number) {
    return '曲目 $number';
  }

  @override
  String get remotePlayback => '远程播放';

  @override
  String get castingToGoogleCast => '正在投屏到 Google Cast';

  @override
  String get castingViaAirPlay => '正在通过 AirPlay 投屏';

  @override
  String get castingViaDlna => '正在通过 DLNA 投屏';

  @override
  String secondsCount(int seconds) {
    return '$seconds 秒';
  }

  @override
  String get longPressToUnlock => '长按解锁';

  @override
  String get off => '关';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => '自动';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

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
  String get showMpvStats => '显示 mpv 统计信息（Shift+I）';

  @override
  String get hideMpvStats => '隐藏 mpv 统计信息（Shift+I）';

  @override
  String get keyboardShortcutsTitle => '键盘快捷键';

  @override
  String get keyboardShortcutsSubtitle => '应用、视频播放器和阅读器的按键';

  @override
  String get keyboardShortcutsPlayerHint => '播放视频时按 ? 或 F1，即可在不退出播放器的情况下查看此列表。';

  @override
  String get keyboardShortcutsSectionApp => '所有界面';

  @override
  String get keyboardShortcutsSectionAppScope => '在任意界面';

  @override
  String get keyboardShortcutsSectionPlayer => '视频播放器';

  @override
  String get keyboardShortcutsSectionPlayerScope => '视频打开、播放或暂停时';

  @override
  String get keyboardShortcutsSectionReader => '图书和漫画阅读器';

  @override
  String get keyboardShortcutsSectionReaderScope => '阅读图书或漫画时';

  @override
  String get keyNameArrowKeys => '方向键';

  @override
  String get keyNameSpace => '空格';

  @override
  String get keyNameEnter => 'Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

  @override
  String get keyNameDelete => '删除';

  @override
  String get keyNamePageUp => 'Page Up';

  @override
  String get keyNamePageDown => 'Page Down';

  @override
  String get keyNameHome => '主页';

  @override
  String get keyNameEnd => 'End';

  @override
  String get keyNameShift => 'Shift';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => '滚轮';

  @override
  String get shortcutMoveFocus => '在媒体项之间移动';

  @override
  String get shortcutActivate => '打开所选媒体项';

  @override
  String get shortcutGoBack => '返回';

  @override
  String get shortcutToggleFullscreen => '开启或关闭全屏';

  @override
  String get shortcutQuit => '退出 Moonfin';

  @override
  String get shortcutPlayPause => '播放或暂停';

  @override
  String get shortcutShowControlsOrPlayPause => '显示控制栏；若已显示则播放/暂停';

  @override
  String get shortcutSeekBack => '快退（长按可大幅跳转）';

  @override
  String get shortcutSeekForward => '快进（长按可大幅跳转）';

  @override
  String get shortcutVolumeUp => '提高音量';

  @override
  String get shortcutVolumeDown => '降低音量';

  @override
  String get shortcutMute => '静音或取消静音';

  @override
  String get shortcutToggleSubtitles => '开启或关闭字幕';

  @override
  String get shortcutSlower => '减慢播放速度';

  @override
  String get shortcutFaster => '加快播放速度';

  @override
  String get shortcutPlaybackInfo => '显示播放信息';

  @override
  String get shortcutMpvStats => '开启或关闭 mpv 统计信息';

  @override
  String get shortcutRecropBlackBars => '重新裁剪黑边';

  @override
  String get shortcutLeaveFullscreenOrStop => '退出全屏；若非全屏则停止播放';

  @override
  String get shortcutHideControls => '隐藏控制栏';

  @override
  String get shortcutStopPlayback => '停止播放';

  @override
  String get shortcutNextItem => '下一个媒体项';

  @override
  String get shortcutPreviousItem => '上一个媒体项';

  @override
  String get shortcutSkipSegment => '出现提示时跳过片头或片尾';

  @override
  String get shortcutShowShortcuts => '显示此列表';

  @override
  String get shortcutNextPage => '下一页';

  @override
  String get shortcutPreviousPage => '上一页';

  @override
  String get shortcutScrollPage => '滚动页面（电子书）';

  @override
  String get shortcutFirstPage => '第一页，或章节开头';

  @override
  String get shortcutLastPage => '最后一页，或章节末尾';

  @override
  String get shortcutZoom => '放大或缩小（漫画）';

  @override
  String get shortcutResetZoom => '重置缩放（漫画）';

  @override
  String get playback => '播放';

  @override
  String get playMethod => '播放方式';

  @override
  String get directPlay => '直接播放';

  @override
  String get directStream => '直接串流';

  @override
  String get transcoding => '转码';

  @override
  String get transcodeReasons => '转码原因';

  @override
  String get player => '播放器';

  @override
  String get container => '封装格式';

  @override
  String get bitrate => '码率';

  @override
  String get video => '视频';

  @override
  String get resolution => '分辨率';

  @override
  String get hdr => 'HDR';

  @override
  String get videoRenderer => '视频渲染器';

  @override
  String get videoRendererDescription =>
      '原生窗口提供最流畅的动态画面，并将 HDR 原样发送到显示器。如果视频显示异常，请尝试其他选项。';

  @override
  String get videoRendererNativeWindow => '原生窗口（推荐）';

  @override
  String get videoRendererNativeHdrOnly => '仅 HDR 使用原生窗口';

  @override
  String get videoRendererInApp => '应用内（旧版）';

  @override
  String get track => '音轨';

  @override
  String get channels => '声道';

  @override
  String get format => '格式';

  @override
  String get external => '外挂';

  @override
  String get embedded => '内嵌';

  @override
  String castSessionError(String protocol) {
    return '$protocol 会话错误';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return '加载图书详情失败：$error';
  }

  @override
  String get epubUnavailableOnPlatform => '应用内 EPUB 渲染在此平台上尚不可用。';

  @override
  String get bookReadingUnavailableTitle => 'Apple TV 上无法阅读图书';

  @override
  String get bookReadingUnavailableMessage =>
      '请在手机、平板电脑或电脑上的 Moonfin 中打开阅读。有声书仍可在此播放。';

  @override
  String formatCannotRenderInApp(String extension) {
    return '应用内暂时无法渲染此格式（.$extension）。';
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
    return '已在 $label 保存书签。';
  }

  @override
  String bookmarkAdded(String label) {
    return '已添加书签：$label';
  }

  @override
  String get noBookmarksYet => '还没有书签。\n阅读时点击书签图标即可保存你的位置。';

  @override
  String get noTableOfContentsAvailable => '暂无目录';

  @override
  String pageLabel(int number) {
    return '第 $number 页';
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
  String get failedToDecodePageImage => '无法解码页面图片。';

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
  String get markedAsRead => '已标记为已读';

  @override
  String get markedAsUnread => '已标记为未读';

  @override
  String failedToUpdateReadState(String error) {
    return '无法更新阅读状态：$error';
  }

  @override
  String get themeSystem => '主题：系统';

  @override
  String get themeLight => '主题：浅色';

  @override
  String get themeDark => '主题：深色';

  @override
  String get themeSepia => '主题：护眼棕';

  @override
  String get invertColorsFixedLayout => '反转颜色（固定布局）';

  @override
  String get invertColorsPdf => '反转颜色 (PDF)';

  @override
  String get preparingInAppReader => '正在准备应用内阅读器...';

  @override
  String get pdfDataNotAvailable => 'PDF 数据不可用。';

  @override
  String get readerFallbackModeActive => '已启用阅读器备用模式';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return '此平台无法托管 $extension 文件的嵌入式文档引擎。';
  }

  @override
  String get reloadReaderPlatformHint =>
      '切换到受支持的平台目标（Android、iOS、macOS）后，请使用“重新加载阅读器”。';

  @override
  String get openExternally => '用外部应用打开';

  @override
  String get noEpubChaptersFound => '未找到 EPUB 章节。';

  @override
  String get readerNotReady => '阅读器尚未就绪。';

  @override
  String get seriesRecordings => '剧集录制';

  @override
  String get now => '现在';

  @override
  String get sports => '体育';

  @override
  String get news => '新闻';

  @override
  String get kids => '儿童';

  @override
  String get premiere => '首映';

  @override
  String get guideRepeatBadge => '重播';

  @override
  String get guideTimeline => '节目指南时间轴';

  @override
  String failedToLoadGuide(String error) {
    return '无法加载节目指南：$error';
  }

  @override
  String get noChannelsFound => '未找到频道';

  @override
  String get noProgramData => '无节目数据';

  @override
  String get liveBadge => '直播';

  @override
  String get liveTvJumpToLive => '跳转到直播';

  @override
  String guideNextProgram(String time, String title) {
    return '下一集 ：$time $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '剩余 $minutes 分钟';
  }

  @override
  String guideHoursLeft(int hours) {
    return '剩余 $hours 小时';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '剩余 $hours 小时 $minutes 分钟';
  }

  @override
  String get movie => '电影';

  @override
  String get removedFromFavoriteChannels => '已从收藏频道中移除';

  @override
  String get addedToFavoriteChannels => '已添加到收藏频道';

  @override
  String get failedToUpdateFavoriteChannel => '更新收藏频道失败';

  @override
  String get unfavoriteChannel => '取消收藏频道';

  @override
  String get favoriteChannel => '收藏频道';

  @override
  String get record => '录制';

  @override
  String nextSeriesRecording(String dateTime) {
    return '下次剧集录制：$dateTime';
  }

  @override
  String get noUpcomingSeriesRecording => '已安排剧集录制，但节目指南中没有即将播出的集数';

  @override
  String get seriesRecordingSkipsShowing => '剧集录制将跳过本次播出';

  @override
  String get seriesRecordingEpisodesQuestion => '要录制哪些集？';

  @override
  String get seriesRecordingAllEpisodes => '全季所有集数';

  @override
  String get seriesRecordingAllEpisodesDescription => '所有播出场次，包括重播';

  @override
  String get seriesRecordingNotRecordedEpisodes => '尚未录制的集数';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      '跳过媒体库中已有的集数，每集只录制一次';

  @override
  String get seriesRecordingNewEpisodesOnly => '仅新集数';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription => '仅首播，不含重播';

  @override
  String get seriesRecordingSettings => '剧集设置';

  @override
  String get seriesRecordingUpdated => '剧集录制已更新';

  @override
  String get failedToUpdateSeriesRecording => '无法更新剧集录制';

  @override
  String get recordCurrentEpisode => '录制本集';

  @override
  String get recordCurrentProgram => '录制本节目';

  @override
  String get cancelCurrentRecording => '取消此录制';

  @override
  String get cancelRecordingAction => '取消录制';

  @override
  String get programSetToRecord => '节目已设为录制';

  @override
  String get recordingCancelled => '录制已取消';

  @override
  String get unableToCreateRecording => '无法创建录制';

  @override
  String get recordSeries => '录制剧集';

  @override
  String get seriesSetToRecord => '已设置录制剧集';

  @override
  String get seriesRecordingCancelled => '剧集录制已取消';

  @override
  String get unableToCreateSeriesRecording => '无法创建剧集录制';

  @override
  String get watch => '观看';

  @override
  String get watchChannelLive => '观看频道直播';

  @override
  String get close => '关闭';

  @override
  String failedToPlayChannel(String name) {
    return '无法播放 $name';
  }

  @override
  String get playbackStreamLost => '播放已停止，无法恢复。';

  @override
  String get playbackVideoUnsupported => '此设备无法播放该视频的格式。请尝试使用外部播放器。';

  @override
  String liveReconnecting(int attempt, int total) {
    return '正在重新连接…（第 $attempt 次，共 $total 次）';
  }

  @override
  String playerMatchingDisplayRate(String fps) {
    return '正在将显示刷新率匹配至 $fps fps…';
  }

  @override
  String get failedToLoadRecordings => '加载录制内容失败';

  @override
  String get scheduledInNext24Hours => '未来 24 小时内计划录制';

  @override
  String get recentRecordings => '最近录制';

  @override
  String get tvSeries => '剧集';

  @override
  String get failedToLoadSchedule => '加载录制计划失败';

  @override
  String get noScheduledRecordings => '暂无计划录制';

  @override
  String get cancelRecording => '取消录制？';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '取消“$name”的预定录制吗？';
  }

  @override
  String get no => '否';

  @override
  String get yesCancel => '是，取消';

  @override
  String get failedToCancelRecording => '取消录制失败';

  @override
  String get failedToLoadSeriesRecordings => '无法加载剧集录制';

  @override
  String get noSeriesRecordings => '暂无剧集录制';

  @override
  String get cancelSeriesRecording => '取消剧集录制';

  @override
  String get cancelSeriesRecordingQuestion => '取消剧集录制？';

  @override
  String stopRecordingName(String name) {
    return '停止录制“$name”？';
  }

  @override
  String get failedToCancelSeriesRecording => '取消剧集录制失败';

  @override
  String get searchThisLibrary => '搜索此媒体库...';

  @override
  String get searchEllipsis => '搜索...';

  @override
  String noResultsForQuery(String query) {
    return '未找到“$query”的结果';
  }

  @override
  String searchFailedError(String error) {
    return '搜索失败：$error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr 账号类型';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => '本地';

  @override
  String get savedMedia => '下载';

  @override
  String get tvShows => '剧集';

  @override
  String get music => '音乐';

  @override
  String get musicAlbums => '音乐专辑';

  @override
  String get noMediaInFilter => '此筛选条件下没有媒体';

  @override
  String get noDownloadedMediaYet => '还没有已下载媒体';

  @override
  String get browseLibrary => '浏览媒体库';

  @override
  String get deleteDownload => '删除下载';

  @override
  String removeItemAndFiles(String name) {
    return '移除“$name”及其文件？';
  }

  @override
  String tracksCount(int count) {
    return '$count 首曲目';
  }

  @override
  String get album => '专辑';

  @override
  String get playAlbum => '播放专辑';

  @override
  String failedToLoadAlbum(String error) {
    return '加载专辑失败：$error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '未找到 $name 的已下载曲目。';
  }

  @override
  String get season => '季';

  @override
  String get errorLoadingEpisodes => '加载剧集时出错';

  @override
  String get noDownloadedEpisodes => '暂无已下载剧集';

  @override
  String get deleteEpisode => '删除剧集';

  @override
  String removeName(String name) {
    return '移除“$name”？';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return '第 $number 集';
  }

  @override
  String get seriesNotFound => '未找到剧集';

  @override
  String get errorLoadingSeries => '加载剧集时出错';

  @override
  String get downloadedEpisodes => '已下载剧集';

  @override
  String seasonNumber(int number) {
    return '第 $number 季';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => '特别篇';

  @override
  String get deleteSeason => '删除整季';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '删除 $season 中所有已下载剧集吗？';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 集',
      one: '1 集',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => '存储管理';

  @override
  String get storageBreakdown => '存储占用明细';

  @override
  String get downloadedItems => '已下载媒体项';

  @override
  String get activeDownloads => '进行中的下载';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个媒体项',
      one: '1 个媒体项',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used / $limit';
  }

  @override
  String get savedMediaSelectItems => '选择媒体项';

  @override
  String get savedMediaNoDownloads => '尚无已保存内容';

  @override
  String get savedMediaNoDownloadsDetail => '你发起的下载会显示在这里，并可在无网络连接时播放。';

  @override
  String get savedMediaNoActiveDownloads => '当前没有正在下载的内容';

  @override
  String get savedMediaNoResults => '没有符合该搜索条件的下载内容';

  @override
  String get savedMediaPlayFromStart => '从头播放';

  @override
  String get savedMediaGoToDetails => '查看详情';

  @override
  String get savedMediaDeleteDownload => '删除下载';

  @override
  String savedMediaDeleteSeason(String season) {
    return '删除 $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '删除 $count 集',
      one: '删除 1 集',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => '打开电视剧';

  @override
  String get savedMediaPlayNextUnwatched => '播放下一个未观看集数';

  @override
  String get savedMediaRead => '已读';

  @override
  String get savedMediaCancelDownload => '取消下载';

  @override
  String get sortBySize => '大小';

  @override
  String get sortByName => '名字';

  @override
  String get sortByDateAdded => '添加日期';

  @override
  String get storageLimit => '存储限制';

  @override
  String get noLimit => '无限制';

  @override
  String get deleteAllDownloads => '删除所有下载';

  @override
  String get deleteAllDownloadsWarning => '这将删除所有已下载媒体文件，且无法撤销。';

  @override
  String get deleteAll => '全部删除';

  @override
  String get deleteSelected => '删除所选内容';

  @override
  String deleteSelectedCount(int count) {
    return '删除 $count 个已下载媒体项？';
  }

  @override
  String get musicAndAudiobooks => '音乐和有声读物';

  @override
  String get images => '图片';

  @override
  String get database => '数据库';

  @override
  String ofStorageLimit(String limit) {
    return '$limit 上限';
  }

  @override
  String get settings => '设置';

  @override
  String get settingsSearchHint => '搜索设置项';

  @override
  String get authentication => '身份验证';

  @override
  String get autoLoginServerManagement => '自动登录、服务器管理';

  @override
  String get pinCode => 'PIN 码';

  @override
  String get setUpPinCodeProtection => '设置 PIN 码保护';

  @override
  String get parentalControls => '家长控制';

  @override
  String get contentRatingRestrictions => '内容分级限制';

  @override
  String get bitRateResolutionBehavior => '码率、分辨率、行为';

  @override
  String get languageSizeAppearance => '语言、大小、外观';

  @override
  String get qualityStorage => '画质、存储';

  @override
  String get mediaRequestIntegration => '媒体请求集成';

  @override
  String get switchServer => '切换服务器';

  @override
  String get signOut => '退出登录';

  @override
  String get versionLicenses => '版本、许可证';

  @override
  String get account => '账号';

  @override
  String get signInAndSecurity => '登录和安全';

  @override
  String get administration => '管理';

  @override
  String get serverSettingsUsersLibraries => '服务器设置、用户、媒体库';

  @override
  String get customization => '自定义';

  @override
  String get themeAndLayout => '主题和布局';

  @override
  String get videoAndSubtitles => '视频和字幕';

  @override
  String get pluginAndRequests => '插件和请求';

  @override
  String get customizeAccountPlaybackInterface => '自定义账号、播放和界面行为';

  @override
  String optionsCount(int count) {
    return '$count 个选项';
  }

  @override
  String get themeAndAppearance => '主题与外观';

  @override
  String get focusBorderColor => '焦点边框颜色';

  @override
  String get watchedIndicators => '已观看标记';

  @override
  String get showPosterLabels => '海报标签';

  @override
  String get showPosterLabelsSubtitle => '在海报上显示标签，例如 4K 或 HDR。';

  @override
  String get always => '总是';

  @override
  String get mixedRowsOnly => '仅混合行';

  @override
  String get hideUnwatched => '隐藏未观看';

  @override
  String get episodesOnly => '仅剧集';

  @override
  String get never => '从不';

  @override
  String get focusExpansionAnimation => '焦点放大动画';

  @override
  String get desktopUiScale => 'UI 缩放';

  @override
  String get scaleFocusedCards => '缩放聚焦或悬停的卡片和图块';

  @override
  String get seriesThumbnails => '显示剧集缩略图';

  @override
  String get seriesThumbnailsDescription => '对于电视剧，使用剧集艺术图而不是单集缩略图。';

  @override
  String get homeRowInfoOverlay => '首页行信息浮层';

  @override
  String get showTitleMetadataOnHomeRows => '浏览首页行时显示标题和元数据';

  @override
  String get clockDisplay => '时钟显示';

  @override
  String get inMenus => '在菜单中';

  @override
  String get inVideo => '视频中';

  @override
  String get seasonalEffects => '节日效果';

  @override
  String get seasonalEffectsDescription => '视觉效果和节日装饰';

  @override
  String get loadingAnimation => '加载动画';

  @override
  String get loadingAnimationDescription => '自定义 Moonfin 各处使用的加载动画';

  @override
  String get loadingAnimationConfiguration => '加载动画配置';

  @override
  String get loadingAnimationImage => '图像';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin 徽标';

  @override
  String get loadingAnimationImageSpinner => '旋转环';

  @override
  String get loadingAnimationImageRunner => '奔跑者';

  @override
  String get loadingAnimationImageMoonPhases => '月相';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin 月相';

  @override
  String get loadingAnimationImageNeonfinPhases => '霓虹月相';

  @override
  String get loadingAnimationSize => '动画尺寸';

  @override
  String get loadingAnimationSizeThumbnail => '微缩';

  @override
  String get loadingAnimationSizeSmall => '小';

  @override
  String get loadingAnimationSizeMedium => '中';

  @override
  String get loadingAnimationSizeLarge => '大';

  @override
  String get loadingAnimationPosition => '动画位置';

  @override
  String get loadingAnimationPositionTopLeft => '左上角';

  @override
  String get loadingAnimationPositionTopCenter => '顶部居中';

  @override
  String get loadingAnimationPositionTopRight => '右上角';

  @override
  String get loadingAnimationPositionMiddleLeft => '左侧居中';

  @override
  String get loadingAnimationPositionMiddle => '正中央';

  @override
  String get loadingAnimationPositionMiddleRight => '右侧居中';

  @override
  String get loadingAnimationPositionBottomLeft => '左下角';

  @override
  String get loadingAnimationPositionBottomCenter => '底部居中';

  @override
  String get loadingAnimationPositionBottomRight => '右下角';

  @override
  String get loadingAnimationPositionBouncing => '弹跳（DVD 屏保）';

  @override
  String get loadingAnimationSpeed => '动画速度';

  @override
  String get loadingAnimationSpeedSlow => '慢';

  @override
  String get loadingAnimationSpeedModerate => '适中';

  @override
  String get loadingAnimationSpeedFast => '快';

  @override
  String get loadingAnimationSpeedUltra => '极速';

  @override
  String get showLoadingAnimationText => '显示文字';

  @override
  String get loadingAnimationPreview => '预览';

  @override
  String get snow => '雪';

  @override
  String get fireworks => '烟花';

  @override
  String get confetti => '彩纸';

  @override
  String get fallingLeaves => '落叶';

  @override
  String get seasonalChristmas => '圣诞节';

  @override
  String get seasonalPetals => '春日花瓣';

  @override
  String get seasonalFireflies => '萤火虫';

  @override
  String get seasonalHalloween => '万圣节';

  @override
  String get seasonalDensity => '密度';

  @override
  String get seasonalDensityLight => '稀疏';

  @override
  String get seasonalDensityNormal => '正常';

  @override
  String get seasonalDensityHeavy => '密集';

  @override
  String get seasonalFollower => '焦点跟随';

  @override
  String get seasonalFollowerDescription => '节日装饰（如万圣节的灵应牌）会跟随你在首页上的选择';

  @override
  String get seasonalFollowerPointerDescription => '节日装饰（如万圣节的灵应牌）会替代首页上的鼠标指针';

  @override
  String get seasonalRow => '节日推荐行';

  @override
  String get seasonalRowDescription => '显示媒体库中的节日电影行，并在可用时显示 Seerr 建议。';

  @override
  String get seasonalRowSubtitle => '节日';

  @override
  String get seasonalRowCountry => '国家/地区';

  @override
  String get seasonalRowCountryAuto => '自动模式';

  @override
  String get countryUnitedStates => '美国';

  @override
  String get countryCanada => '加拿大';

  @override
  String get seasonalRowCountryOther => '其他';

  @override
  String get seasonalRowHolidays => '节日';

  @override
  String get seasonalRowHolidaysHint => '取消勾选某个节日即可隐藏其推荐行。';

  @override
  String get seasonalRowAllYear => '全年显示';

  @override
  String get seasonalRowAllYearDescription => '在节日日期之外也显示节日推荐行，每天轮换一个已勾选的节日。';

  @override
  String get holidayNewYear => '新年';

  @override
  String get holidayValentines => '情人节';

  @override
  String get holidayEaster => '复活节';

  @override
  String get holidayPride => '骄傲月';

  @override
  String get holidayHalloween => '万圣节';

  @override
  String get holidayThanksgiving => '感恩节';

  @override
  String get holidayChristmas => '圣诞电影';

  @override
  String get holidayLunarNewYear => '农历新年';

  @override
  String get holidayDiwali => '排灯节';

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
  String get themeMusicOnHomeRows => '首页行主题音乐';

  @override
  String get playWhenBrowsingHomeScreen => '浏览主屏幕时播放';

  @override
  String get loopThemeMusic => '循环播放主题音乐';

  @override
  String get loopThemeMusicSubtitle => '单曲循环，而非仅播放一次';

  @override
  String get detailsBackgroundBlur => '背景虚化';

  @override
  String get detailsBackgroundOpacity => '详情页背景不透明度';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => '浏览页背景模糊';

  @override
  String get maxStreamingBitrate => '最大串流码率';

  @override
  String get maxResolution => '最大分辨率';

  @override
  String get playerZoomMode => '播放器缩放模式';

  @override
  String get settingsScrollWheelAction => '鼠标滚轮';

  @override
  String get settingsScrollWheelActionDescription => '选择播放时在视频上滚动鼠标滚轮会触发什么操作。';

  @override
  String get scrollWheelActionOff => '关';

  @override
  String get scrollWheelActionSeek => '快进/快退';

  @override
  String get scrollWheelActionVolume => '音量';

  @override
  String get playerTooltipVolume => '音量';

  @override
  String get fit => '适应';

  @override
  String get autoCrop => '自动裁剪';

  @override
  String get cropBlackBars => '裁剪黑边';

  @override
  String get settingsCropBlackBarsDescription =>
      '播放开始后检测画面中的编码黑边，将其裁剪并铺满屏幕。可在播放器的缩放按钮中重新裁剪。';

  @override
  String get cropBlackBarsRecropInterval => '重新裁剪间隔';

  @override
  String get cropBlackBarsOnce => '开始时一次';

  @override
  String get cropBlackBarsEverySecond => '每秒';

  @override
  String get settingsCropBlackBarsIntervalDescription => '播放过程中跟随宽高比变化。';

  @override
  String get playerRecroppingBlackBars => '正在重新裁剪黑边';

  @override
  String get playerBlackBarsCropped => '已裁剪黑边';

  @override
  String get playerNoBlackBarsFound => '未发现黑边';

  @override
  String get playerBlackBarsNotDetected => '无法检测到黑边。请在较亮的场景中重试';

  @override
  String get stretch => '拉伸';

  @override
  String get refreshRateSwitching => '刷新率切换';

  @override
  String get disabled => '已禁用';

  @override
  String get manual => '手动';

  @override
  String get autoDetect => '自动检测';

  @override
  String get scaleOnTv => '在电视上缩放';

  @override
  String get scaleOnDevice => '在设备上缩放';

  @override
  String get trickPlay => 'Trickplay 预览图';

  @override
  String get showPreviewThumbnailsWhenSeeking => '拖动进度时显示预览缩略图';

  @override
  String get trickplayDisplayStyleSingle => '单张缩略图';

  @override
  String get trickplayDisplayStyleStrip => '胶片条';

  @override
  String get trickplayModeFull => '全屏';

  @override
  String get trickplaySettingsPreviewHint => '拖动滑块预览跳转效果';

  @override
  String get trickplayPreviewScale => '预览尺寸';

  @override
  String get trickplayVerticalOffset => '距离进度条高度';

  @override
  String get trickplayFollowScrubPosition => '跟随跳转滑块';

  @override
  String get trickplayFollowScrubPositionSubtitle => '预览画面跟随滑块沿进度条移动，而非固定居中';

  @override
  String get trickplayPauseWhileScrubbing => '拖动进度时暂停';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      '拖动进度时暂停播放，按播放键后恢复。关闭此选项可在跳转时继续播放并直接跳到新位置';

  @override
  String get showDescriptionOnPause => '暂停时显示简介';

  @override
  String get dimVideoShowOverview => '暂停时调暗视频并显示简介文本';

  @override
  String get showChapterMarkers => '章节标记';

  @override
  String get showChapterMarkersDescription => '在进度条上标记每一章的开始位置';

  @override
  String get osdLockButton => 'OSD 锁定按钮';

  @override
  String get osdLockButtonDescription => '显示锁定按钮，长按解锁前会阻止触摸输入';

  @override
  String get playerSwipeGestures => '音量和亮度滑动';

  @override
  String get playerSwipeGesturesDescription => '在播放器上上下滑动，左侧改变亮度，右侧改变音量';

  @override
  String get invertGestureIndicators => '反转手势指示器';

  @override
  String get invertGestureIndicatorsDescription =>
      '将亮度和音量的视觉指示器放在与滑动操作相同或相反的屏幕一侧';

  @override
  String get gestureIndicatorSame => '相同';

  @override
  String get gestureIndicatorInverted => '相反';

  @override
  String get osdButtons => '播放器按钮';

  @override
  String get osdButtonsDescription => '选择播放器显示的按钮';

  @override
  String get osdButtonsSectionDescription =>
      '播放控制按钮始终显示。其余项目可自定义，不同设备类型拥有独立配置。';

  @override
  String get detailButtons => '操作按钮';

  @override
  String get detailButtonsDescription => '选择详情页面显示的按钮';

  @override
  String get detailButtonsSectionDescription =>
      '播放按钮固定置顶，锁定按钮始终可见。其余项目可自定义，不同设备类型拥有独立配置。';

  @override
  String get actionButtonsOnScreen => '屏幕上的操作按钮';

  @override
  String get actionButtonsOnScreenDescription => '自定义在折叠到“更多操作”菜单之前显示多少个操作按钮。';

  @override
  String get actionButtonsOnScreenAuto => '自动（主题默认）';

  @override
  String get actionButtonsOnScreenPlayOnly => '1（仅播放）';

  @override
  String get actionButtonsOnScreenAll => '全部（横向滚动）';

  @override
  String get detailMetadata => '元数据行';

  @override
  String get detailMetadataDescription => '选择并重新排列详情页显示的元数据';

  @override
  String get detailMetadataSectionDescription =>
      '开启或关闭元数据项，并排列它们在详情页上的显示顺序。每种设备各自保留自己的列表。';

  @override
  String get detailMetadataYear => '发行年份';

  @override
  String get detailMetadataParentalRating => '家长评级';

  @override
  String get detailMetadataRuntimeAndSeasons => '片长与季数';

  @override
  String get detailMetadataStatus => '剧集状态';

  @override
  String get detailMetadataStatusSubtitle => '显示剧集是连载中、已完结还是即将回归';

  @override
  String get detailMetadataGenres => '类型';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr 可用状态';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle => '显示来自 Seerr 的请求和媒体可用状态';

  @override
  String get detailMetadataUpcomingEpisodeDate => '即将播出的剧集';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      '使用 Sonarr 和 TMDB 显示即将播出的日期';

  @override
  String get detailSections => '分区';

  @override
  String get detailSectionsDescription => '选择详情页要显示的部分';

  @override
  String get detailSectionsScreenDescription =>
      '仅列出当前详情页样式可以显示的分区。隐藏某个分区会在所有包含该分区的样式中将其隐藏。';

  @override
  String get detailSectionGroupHeader => '头部';

  @override
  String get detailSectionGroupSections => '分区';

  @override
  String get detailSectionGroupPerson => '人物页面';

  @override
  String get detailSectionGroupCollection => '合集页面';

  @override
  String get detailSectionGroupOther => '其他';

  @override
  String get detailSectionLogo => '徽标';

  @override
  String get detailSectionLogoSubtitle => '关闭时以文字形式显示标题';

  @override
  String get detailSectionTagline => '标语';

  @override
  String get detailSectionPoster => '海报';

  @override
  String get detailSectionVersionBadge => '版本徽章';

  @override
  String get detailSectionUpNext => '下一集';

  @override
  String get detailSectionLyrics => '歌词';

  @override
  String get detailSectionCast => '投屏';

  @override
  String get detailSectionCastSubtitle => '也显示在合集页面上';

  @override
  String get detailSectionCrew => '导演与编剧';

  @override
  String get detailSectionStudios => '工作室';

  @override
  String get detailSectionChapters => '章节';

  @override
  String get detailSectionExtras => '花絮';

  @override
  String get detailSectionCollections => '合集';

  @override
  String get detailSectionMoreLikeThis => '相似推荐';

  @override
  String get detailSectionMoreLikeThisSubtitle => '也包括相似专辑和艺人';

  @override
  String get detailSectionMoreEpisodes => '更多剧集';

  @override
  String get detailSectionMoreEpisodesSubtitle => '在剧集页面上';

  @override
  String get detailSectionMediaInfo => '媒体信息';

  @override
  String get detailSectionMediaInfoSubtitle => '文件、媒体流和直接播放检查';

  @override
  String get detailSectionSeerrGenresTags => '类型与标签';

  @override
  String get detailSectionSeerrStats => '统计';

  @override
  String get detailSectionSeerrStreaming => '流媒体服务';

  @override
  String get seerrStreamingOn => '流媒体平台';

  @override
  String get detailSectionSeerrRecommendations => '推荐';

  @override
  String get detailSectionSeerrSimilar => '相似作品';

  @override
  String get detailSectionSeerrCollection => '合集横幅';

  @override
  String get detailSectionSeerrPersonAppearances => '参演作品';

  @override
  String get detailSectionSeerrPersonCrew => '幕后作品';

  @override
  String get detailSectionPersonPagesSubtitle => '在人物页面上';

  @override
  String get detailSectionBiography => '传记';

  @override
  String get detailSectionBirthplace => '出生地';

  @override
  String get detailSectionPersonLinks => '链接';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb、TMDB 和社交媒体';

  @override
  String get detailSectionGuestAppearances => '客串演出';

  @override
  String get detailSectionMusicVideos => '音乐视频';

  @override
  String get detailSectionPlaylistOrder => '播放列表顺序';

  @override
  String get detailSectionBookGenres => '图书类型';

  @override
  String get detailSectionPhotoExif => '照片详情';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return '下一集：$date（S$season:E$episode）';
  }

  @override
  String get upcomingEpisodeToday => '今天';

  @override
  String get upcomingEpisodeTomorrow => '明天';

  @override
  String get radarrCalendarRow => '即将上映的电影（Radarr）';

  @override
  String get sonarrCalendarRow => '即将播出的电视剧（Sonarr）';

  @override
  String get mergedCalendarRow => '即将发布';

  @override
  String get arrCalendarsRowSubtitle => 'Radarr 和 Sonarr 日历';

  @override
  String get radarrCalendarRowSubtitle => 'Radarr 日历';

  @override
  String get sonarrCalendarRowSubtitle => 'Sonarr 日历';

  @override
  String calendarReleaseIn(int days, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天后',
      one: '明天',
      zero: '今天',
    );
    return '$_temp0（$date）';
  }

  @override
  String get calendarReleaseCinema => '影院上映';

  @override
  String get calendarReleaseDigital => '数字';

  @override
  String get calendarReleasePhysical => '实体发行';

  @override
  String get upcomingCalendars => '即将上线日历';

  @override
  String get upcomingCalendarsDescription => '选择 Radarr 和 Sonarr 行显示的内容。';

  @override
  String get radarrCalendarShowCinema => '显示即将在影院上映的电影';

  @override
  String get radarrCalendarShowDigital => '显示即将数字发行的电影';

  @override
  String get radarrCalendarShowPhysical => '显示即将实体发行的电影';

  @override
  String get calendarShowReleaseDate => '在首页显示发行日期';

  @override
  String get radarrCalendarHideDownloaded => '隐藏服务器上已有的电影';

  @override
  String get sonarrCalendarShowEpisodeInfo => '显示单集信息';

  @override
  String get sonarrCalendarHideDownloaded => '隐藏服务器上已有的单集';

  @override
  String get mergeRadarrSonarrCalendars => '合并 Sonarr 和 Radarr 日历';

  @override
  String get moveUp => '上移';

  @override
  String get moveDown => '下移';

  @override
  String get buttonOrderHint => '使用箭头调整顺序。遥控器可通过左右方向键移动选中按钮；关闭按钮将自动后置。';

  @override
  String get buttonShownInSyncPlayGroup => '仅在观影派对中显示';

  @override
  String get orientationLock => '方向锁定';

  @override
  String get fullscreen => '全屏';

  @override
  String get audioBehavior => '音频行为';

  @override
  String get downmixToStereo => '缩混至立体声';

  @override
  String get defaultAudioLanguage => '默认音频语言';

  @override
  String get fallbackAudioLanguage => '备用音频语言';

  @override
  String get preferDefaultAudioTrack => '优先默认音轨';

  @override
  String get preferDefaultAudioTrackDescription => '优先使用原始音轨，而非本地化配音。';

  @override
  String get preferAudioDescription => '优先音画描述音轨';

  @override
  String get preferAudioDescriptionDescription => '优先播放无障碍音画描述音轨，替代普通音轨。';

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
  String get japanese => '日语';

  @override
  String get korean => '韩语';

  @override
  String get chinese => '中文';

  @override
  String get russian => '俄语';

  @override
  String get arabic => '阿拉伯语';

  @override
  String get hindi => '印地语';

  @override
  String get dutch => '荷兰语';

  @override
  String get swedish => '瑞典语';

  @override
  String get norwegian => '挪威语';

  @override
  String get danish => '丹麦语';

  @override
  String get finnish => '芬兰语';

  @override
  String get polish => '波兰语';

  @override
  String get ac3Passthrough => 'AC3 直通';

  @override
  String get dtsPassthrough => 'DTS 直通';

  @override
  String get trueHdSupport => 'TrueHD 支持';

  @override
  String get enableDtsPassthrough => '仅将 DTS 音频以比特流直通到 AVR；需要接收器支持和 DTS 源轨道';

  @override
  String get settingsAudioFallbackCodec => '音频备用编解码器';

  @override
  String get settingsAudioFallbackCodecDescription =>
      '选择多声道源音频无法直接播放或直通时的转码目标格式。';

  @override
  String get transcodeAudioCodecs => '音频转码编解码器';

  @override
  String get transcodeAudioCodecsDescription => '服务器会转换这些格式的音频，而不是原样发送。';

  @override
  String get settingsAudioFallbackCodecAuto => '自动检测\n（推荐）';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n（默认）';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n（Dolby Digital）';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n（Dolby Digital Plus）';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n（仅立体声）';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n（高效）';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n（无损）';

  @override
  String get settingsMaxAudioChannels => '最大音频声道数';

  @override
  String get settingsMaxAudioChannelsDescription =>
      '配置音频设备支持的最大声道数。超过此限制的多声道音频流将被降混或转码。';

  @override
  String get settingsMaxAudioChannelsAuto => '自动检测\n（硬件默认）';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 单声道';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 立体声';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 环绕声';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 四声道';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 环绕声';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 环绕声';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 环绕声';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 环绕声';

  @override
  String get settingsAudioPassthroughAdvanced => '直通（高级）';

  @override
  String get settingsAudioCodecPassthrough => '编解码器直通';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      '仅启用 AVR 或 HDMI 接收器支持的格式。';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 直通';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS 核心直通';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA 直通';

  @override
  String get settingsAudioPassthroughMode => '直通';

  @override
  String get settingsAudioPassthroughModeDescription => '压缩后的环绕声如何传输到您的电视或接收器。';

  @override
  String get settingsAudioPassthroughModeDisabled => '禁用（始终在此设备上解码）';

  @override
  String get settingsAudioPassthroughModeAuto => '自动（匹配检测到的设备支持）';

  @override
  String get settingsAudioPassthroughModeManual => '手动（请在下方选择格式）';

  @override
  String get settingsAudioPassthroughOutput => '直通输出';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      '由谁为 HDMI 链路封装比特流。如果此设备上的直通没有声音或出现卡顿，请尝试使用应用封装器。';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      '自动，系统封装器（AudioTrack RAW）';

  @override
  String get settingsAudioPassthroughOutputIec => '应用封装器（AudioTrack IEC）';

  @override
  String get settingsAudioPassthroughOutputIecLabel => '应用（IEC）';

  @override
  String get settingsDownmixToStereoDescription => '将所有解码后的音频混合成两个声道。';

  @override
  String get settingsAudioEac3IncludesAtmos => '比特流 E-AC-3，包括杜比全景声 (JOC)。';

  @override
  String get settingsAudioDtsHdIncludesDtsX => '比特流 DTS-HD，包括 DTS:X。';

  @override
  String get settingsAudioTrueHdIncludesAtmos => '比特流 TrueHD，包括杜比全景声。';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD 直通';

  @override
  String get settingsDetectedAudioCapabilities => '检测到的音频功能';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable => '尚无可用的运行时功能快照。';

  @override
  String get settingsAudioRouteLabel => '路由';

  @override
  String get settingsAudioDecodeLabel => '解码';

  @override
  String get settingsAudioPassthroughLabel => '直通';

  @override
  String get settingsAudioHdRoute => '高清音频路由';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => '蓝牙';

  @override
  String get settingsAudioRouteSpeaker => '扬声器';

  @override
  String get settingsAudioRouteHeadphones => '耳机';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

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
  String get unsafeMpvOptionsDescription => '允许使用更多 mpv 选项。可能会破坏播放行为。';

  @override
  String get hardwareDecoding => '硬件解码';

  @override
  String get hardwareDecodingSubtitle => '可能会提高性能，但可能在某些设备上导致播放问题。';

  @override
  String get nextUpAndQueuing => '接下来播放与队列';

  @override
  String get nextUpDisplay => '接下来播放提示';

  @override
  String get extended => '扩展';

  @override
  String get minimal => '简洁';

  @override
  String get nextUpTimeout => '接下来播放倒计时';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => '媒体队列';

  @override
  String get autoQueueNextEpisodes => '自动将下一集加入队列';

  @override
  String get stillWatchingPrompt => '仍在观看提示';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes 集 / $hours 小时后';
  }

  @override
  String get resumeAndSkip => '恢复播放与跳过';

  @override
  String get resumeRewind => '恢复播放前回退';

  @override
  String get unpauseRewind => '暂停后回退';

  @override
  String get fiveSeconds => '5 秒';

  @override
  String get tenSeconds => '10 秒';

  @override
  String get fifteenSeconds => '15 秒';

  @override
  String get thirtySeconds => '30 秒';

  @override
  String get skipBackLength => '快退时长';

  @override
  String get skipForwardLength => '快进时长';

  @override
  String get customMpvConfPath => '自定义 mpv.conf 路径';

  @override
  String get notSetMpvConf => '未设置。Moonfin 将尝试使用应用/数据文件夹中的默认 mpv.conf。';

  @override
  String get selectMpvConf => '选择 mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      '样式设置（大小、颜色、偏移）适用于文本字幕（SRT、VTT、TTML）。除非关闭“ASS/SSA 直接播放”，否则 ASS/SSA 字幕会使用自身内嵌样式。图片字幕（PGS、DVB、VobSub）无法重新设置样式。';

  @override
  String get defaultSubtitleLanguage => '默认字幕语言';

  @override
  String get subtitleDownloadLanguages => '字幕下载语言';

  @override
  String get subtitleDownloadLanguagesDescription =>
      '下载字幕时搜索的语言，最多 5 种。自动模式会从默认字幕语言或视频中选择一种语言进行搜索。';

  @override
  String get preferredSecondarySubtitleLanguage => '首选次要字幕语言';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      '同时显示第二条字幕轨道。启用后，字幕菜单会先询问选择主轨道还是次轨道';

  @override
  String get defaultToNoSubtitles => '默认不启用字幕';

  @override
  String get turnOffSubtitlesByDefault => '默认关闭字幕';

  @override
  String get subtitleSize => '字幕大小';

  @override
  String get primarySubtitleSlot => '主轨道';

  @override
  String get secondarySubtitleSlot => '次轨道';

  @override
  String get secondarySubtitleTrack => '次要字幕';

  @override
  String get secondaryDelayAdjustment => '次要字幕延迟调整';

  @override
  String decreaseValue(String setting) {
    return '减小 $setting';
  }

  @override
  String increaseValue(String setting) {
    return '增大 $setting';
  }

  @override
  String get textFillColor => '文本填充颜色';

  @override
  String get backgroundColor => '背景颜色';

  @override
  String get textStrokeColor => '文字描边颜色';

  @override
  String get subtitleCustomization => '字幕自定义';

  @override
  String get subtitleCustomizationDescription => '自定义字幕外观';

  @override
  String get subtitleMode => '字幕模式';

  @override
  String get subtitleModeFlagged => '标记默认';

  @override
  String get subtitleModeAlways => '始终显示';

  @override
  String get subtitleModeForeign => '外语自动';

  @override
  String get subtitleModeForced => '仅强制字幕';

  @override
  String get subtitleModeFlaggedDescription => '自动加载媒体元数据内标记为「默认」或「强制」的字幕轨道。';

  @override
  String get subtitleModeAlwaysDescription => '每次播放视频时自动加载并显示字幕。';

  @override
  String get subtitleModeForeignDescription => '若默认音轨为外语，则自动开启字幕。';

  @override
  String get subtitleModeForcedDescription => '仅加载元数据标记为强制显示的字幕。';

  @override
  String get subtitleModeNoneDescription => '完全关闭自动加载字幕功能。';

  @override
  String get fallbackSubtitleLanguage => '备用字幕语言';

  @override
  String get subtitleStream => '字幕轨道';

  @override
  String get subtitlePreviewText => '字幕预览示例文本';

  @override
  String get verticalOffset => '垂直偏移';

  @override
  String get pgsDirectPlay => 'PGS 直接播放';

  @override
  String get directPlayPgsSubtitles => '直接播放 PGS 字幕';

  @override
  String get assSsaDirectPlay => 'ASS/SSA 直接播放';

  @override
  String get directPlayAssSsaSubtitles => '直接播放 ASS/SSA 字幕';

  @override
  String get white => '白色';

  @override
  String get black => '黑色';

  @override
  String get yellow => '黄色';

  @override
  String get green => '绿色';

  @override
  String get cyan => '青色';

  @override
  String get red => '红色';

  @override
  String get transparent => '透明';

  @override
  String get semiTransparentBlack => '半透明黑色';

  @override
  String get semiTransparentWhite => '半透明白色';

  @override
  String get lightGray => '浅灰色';

  @override
  String get darkGray => '深灰色';

  @override
  String get blue => '蓝色';

  @override
  String get magenta => '洋红色';

  @override
  String get global => '全局';

  @override
  String get desktop => '桌面';

  @override
  String get mobile => '移动端';

  @override
  String get tv => '电视';

  @override
  String loadedProfileSettings(String profile) {
    return '已加载 $profile 配置方案设置。';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '无法加载 $profile 配置方案设置。';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return '已将本地设置同步到 $profile 配置方案。';
  }

  @override
  String get syncing => '正在同步...';

  @override
  String resetProfileTitle(String profile) {
    return '是否重置 $profile？';
  }

  @override
  String resetProfileDescription(String profile) {
    return '此操作将从服务器删除 $profile 配置文件，并将此设备上所有已同步设置恢复为默认值。';
  }

  @override
  String get resetGlobalProfileDescription =>
      '此操作将从服务器删除所有已保存的配置文件，并将此设备上所有已同步设置恢复为默认值。';

  @override
  String profileReset(String profile) {
    return '将 $profile 配置文件重置为默认值。';
  }

  @override
  String get resetRatingsTitle => '是否重置评分？';

  @override
  String get resetRatingsDescription => '此操作将所有评分相关设置恢复为默认值，包含启用的数据源及其显示顺序。';

  @override
  String get ratingsReset => '将评分设置重置为默认值。';

  @override
  String failedToResetProfile(String profile) {
    return '重置 $profile 配置文件失败。';
  }

  @override
  String get profileSyncHidden => '配置方案同步已隐藏';

  @override
  String get enablePluginSyncDescription => '在插件设置中启用服务器插件同步后，此处会显示配置方案选项。';

  @override
  String get quality => '画质';

  @override
  String get defaultDownloadQuality => '默认下载画质';

  @override
  String get network => '网络';

  @override
  String get wifiOnlyDownloads => '仅 Wi-Fi 下载';

  @override
  String get tvOfflineDownloads => '启用离线下载';

  @override
  String get tvOfflineDownloadsSubtitle => '在条目页面显示下载操作';

  @override
  String get reportDownloadsActivity => '在服务器上显示下载';

  @override
  String get reportDownloadsActivitySubtitle => '允许服务器管理员在仪表板中查看你的转码下载';

  @override
  String get onlyDownloadOnWifi => '仅在连接 Wi-Fi 时下载';

  @override
  String get storage => '存储';

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
  String get sdCard => 'SD 卡';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android 系统只允许 Moonfin 写入其拥有的文件夹，而此设备没有可移动存储设备。请启用上方的“保存到下载文件夹”选项，将下载内容保存到其他应用可以访问的位置。';

  @override
  String get saveToDownloadsFolder => '保存到下载文件夹';

  @override
  String get downloadsVisibleToOtherApps => 'Downloads/Moonfin — 对其他应用可见';

  @override
  String get dangerZone => '危险区域';

  @override
  String get clearAllDownloads => '清除所有下载';

  @override
  String get original => '原始';

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
      '下载的媒体将保存到你设备上的 Downloads/Moonfin 中。这些文件将对其他应用可见，例如你的图库或音乐播放器。\n\n现有下载将保留在当前位置。';

  @override
  String get transcodingTimeRemainingUnavailable => '转码中：剩余时间未知';

  @override
  String get enable => '启用';

  @override
  String get clearAllDownloadsWarning => '这将删除所有已下载媒体，且无法撤销。';

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
  String get showGenresButton => '显示类型按钮';

  @override
  String get showFavoritesButton => '显示收藏按钮';

  @override
  String get showLiveTvButton => '显示直播电视按钮';

  @override
  String get showDownloadsButton => '显示下载按钮';

  @override
  String get showLibrariesInToolbar => '在工具栏中显示媒体库';

  @override
  String get showLibrariesIndividually => '单独显示媒体库';

  @override
  String get showLibrariesIndividuallySubtitle =>
      '在导航栏中将每个媒体库显示为独立按钮，而不是放在“媒体库”菜单中';

  @override
  String get navbarAlwaysExpanded => '始终展开导航栏标签';

  @override
  String get showSeerrButton => '显示 Seerr 按钮';

  @override
  String get navbarOpacity => '导航栏不透明度';

  @override
  String get navbarColor => '导航栏颜色';

  @override
  String get gray => '灰色';

  @override
  String get darkBlue => '深蓝色';

  @override
  String get purple => '紫色';

  @override
  String get teal => '青色';

  @override
  String get navy => '海军蓝';

  @override
  String get charcoal => '炭黑';

  @override
  String get brown => '棕色';

  @override
  String get darkRed => '深红色';

  @override
  String get darkGreen => '深绿色';

  @override
  String get slate => '石板灰';

  @override
  String get indigo => '靛青';

  @override
  String get libraryDisplay => '媒体库展示';

  @override
  String get posterLabel => '海报';

  @override
  String get thumbnailLabel => '缩略图';

  @override
  String get bannerLabel => '横幅';

  @override
  String get overridePerLibrarySettings => '覆盖每个媒体库的设置';

  @override
  String get applyImageTypeToAllLibraries => '将图片类型应用于所有媒体库';

  @override
  String get multiServerLibraries => '多服务器媒体库';

  @override
  String get showLibrariesFromAllServers => '显示所有已连接服务器的媒体库';

  @override
  String get mergeLibrariesByType => '合并电影和电视剧媒体库';

  @override
  String get mergeLibrariesByTypeDescription =>
      '启用多服务器媒体库后，为所有服务器显示一个“电影”媒体库和一个“电视剧”媒体库。多个服务器共有的作品只列出一次。';

  @override
  String mergedServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '在 $count 个服务器上',
    );
    return '$_temp0';
  }

  @override
  String mergedCopiesNotChanged(String servers) {
    return '在 $servers 上未更改';
  }

  @override
  String get recentlyAddedAndReleased => '最近添加和发布';

  @override
  String get hideWatchedInRecentRows => '隐藏已观看内容';

  @override
  String get hideWatchedInRecentRowsDescription =>
      '从“最近添加”和“最近发布”首页栏目中隐藏已观看的内容。';

  @override
  String get mergeRecentRowsByType => '按类型合并最近行';

  @override
  String get mergeRecentRowsByTypeDescription =>
      '将同一类型的独立媒体库合并到“最近添加”和“最近发布”主页行中。';

  @override
  String get libraryView => '媒体库视图';

  @override
  String get libraryStyle => '视频媒体库样式';

  @override
  String get libraryStyleDescription =>
      '经典为带图标按钮的原始头部。现代将搜索以及带标签的排序、分组和筛选按钮放在同一栏中。停靠将控件和字母移到侧边面板。';

  @override
  String get libraryStyleDescriptionPhone =>
      '经典为带图标按钮的原始头部。现代在搜索框下方添加带标签的排序、分组和筛选按钮组。停靠将控件保留在屏幕底部的栏中。';

  @override
  String get libraryStyleClassic => 'Moonfin';

  @override
  String get libraryStyleModern => '现代';

  @override
  String get libraryStyleDocked => '停靠';

  @override
  String get bookLibraryStyle => '图书媒体库样式';

  @override
  String get bookLibraryStyleDescription =>
      '经典为精选作品下方的原始书架。阅览室以大卡片突出你正在阅读的图书。书店以网格形式浏览整个媒体库。';

  @override
  String get bookLibraryStyleClassic => 'Moonfin';

  @override
  String get bookLibraryStyleReadingRoom => '阅览室';

  @override
  String get bookLibraryStyleBookstore => '书店';

  @override
  String get musicLibraryStyle => '音乐媒体库样式';

  @override
  String get musicLibraryStyleDescription =>
      '经典为“快速继续”卡片下方的原始列表。快捷访问以你最近的专辑和播放列表网格开始。沉浸以你正在聆听的专辑为主。';

  @override
  String get musicLibraryStyleClassic => 'Moonfin';

  @override
  String get musicLibraryStyleQuickAccess => '快捷访问';

  @override
  String get musicLibraryStyleImmersive => '沉浸式';

  @override
  String get jumpBackIn => '快速继续';

  @override
  String get yourPlaylists => '你的播放列表';

  @override
  String get fromThisAlbum => '来自此专辑';

  @override
  String get searchMusic => '搜索音乐';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 套丛书',
      one: '1 套丛书',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count 本在读';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '浏览全部 $count 本书',
      one: '浏览 1 本书',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => '搜索图书';

  @override
  String get libraryShowLabel => '显示';

  @override
  String get libraryAToZ => 'A 到 Z';

  @override
  String get libraryJumpToLetter => '跳转到字母';

  @override
  String get groupItemsIntoCollections => '将影片归类至系列合集';

  @override
  String get hideCollectionAssociatedItems => '浏览媒体库时隐藏合集内关联的单部影片';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '媒体库归类提示';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      '如需启用该功能，请前往 Jellyfin / Emby 服务器媒体库的显示设置，开启「电影合集分组」和/或「剧集系列分组」选项。';

  @override
  String get libraryVisibility => '媒体库可见性';

  @override
  String get libraryVisibilityDescription => '切换每个媒体库的主页可见性。重启 Moonfin 以使更改生效。';

  @override
  String get showInNavigation => '在导航中显示';

  @override
  String get showInLatestMedia => '在最新媒体中显示';

  @override
  String get libraryOrder => '媒体库顺序';

  @override
  String get libraryOrderSubtitle => '选择媒体库的顺序';

  @override
  String get libraryOrderDescription =>
      '你的媒体库会按此顺序显示在“我的媒体”、最近添加栏目和导航栏中。此顺序会保存到你的服务器账号，因此你登录的其他应用也会使用它。';

  @override
  String get libraryOrderTvHint => '按左或右方向键移动高亮的媒体库。';

  @override
  String get libraryOrderSaveFailed => '无法保存媒体库顺序';

  @override
  String get sourceLibraries => '源媒体库';

  @override
  String get sourceCollections => '源合集';

  @override
  String get excludedGenres => '排除的类型';

  @override
  String get selectAll => '选择全部';

  @override
  String itemsSelected(int count) {
    return '已选择 $count 项';
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
  String get mediaBarMode => '媒体栏风格';

  @override
  String get mediaBarModeDescription => '选择不同的媒体栏样式，或关闭媒体栏';

  @override
  String get peekHomeRows => '预览首页栏目';

  @override
  String get peekHomeRowsDescription => '在媒体栏底部显示第一行栏目的上半部分';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => '关';

  @override
  String get mediaBarModeBookshelf => '书架';

  @override
  String get mediaBarModeGallery => '画廊';

  @override
  String get mediaBarModeBanner => '横幅';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => '启用媒体栏';

  @override
  String get showFeaturedContentSlideshow => '在主页上显示特色内容幻灯片';

  @override
  String get contentType => '内容类型';

  @override
  String get mediaBarSourceType => '来源';

  @override
  String get mediaBarSourceRandom => '随机';

  @override
  String get mediaBarNewReleaseBanner => '新发布横幅';

  @override
  String get mediaBarNewReleaseDaysDescription => '单集播出后多长时间内仍算作新内容。';

  @override
  String get mediaBarNewSeries => '新剧集';

  @override
  String get mediaBarNewSeason => '新一季';

  @override
  String get mediaBarNewEpisodes => '新单集';

  @override
  String get mediaBarNewMovie => '新电影';

  @override
  String get mediaBarNewReleasesSection => '新发布';

  @override
  String get mediaBarSourceNewReleasesAll => '新发布';

  @override
  String get mediaBarNewReleaseBannerAllDescription => '标记新剧集、新季、新单集和新电影。';

  @override
  String get mediaBarNewReleaseKinds => '标签';

  @override
  String get mediaBarNewEpisodeDays => '新单集时间窗口';

  @override
  String get mediaBarNewMovieDays => '新电影时间窗口';

  @override
  String get mediaBarNewMovieDaysDescription =>
      '电影上映后多长时间内仍算作新内容。院线电影往往在上映一段时间后才进入服务器，因此这个时间应比单集更长。';

  @override
  String get mediaBarNewMovieDetail => '显示标语';

  @override
  String get mediaBarNewMovieDetailDescription =>
      '在“新电影”下方显示电影标语。没有标语时，标签仍单独显示。';

  @override
  String get moviesAndTvShows => '电影和剧集';

  @override
  String get moviesOnly => '仅限电影';

  @override
  String get tvShowsOnly => '仅剧集';

  @override
  String get itemCount => '媒体项数量';

  @override
  String get noneSelected => '未选择';

  @override
  String get noneExcluded => '未排除';

  @override
  String get autoAdvance => '自动切换';

  @override
  String get autoAdvanceSlides => '自动切换到下一张幻灯片';

  @override
  String get autoAdvanceInterval => '自动切换间隔';

  @override
  String get trailerPreview => '预告片预览';

  @override
  String get autoPlayTrailers => '3 秒后在媒体栏中自动播放预告片';

  @override
  String get trailerAudio => '预告片音频';

  @override
  String get enableTrailerAudio => '媒体栏预告片开启音效';

  @override
  String get trailerVolume => '预告片音量';

  @override
  String get trailerVolumeDescription => '媒体栏预告片的播放音量';

  @override
  String get trailerCaptions => '预告片字幕';

  @override
  String get trailerCaptionsDescription => '在媒体栏的 YouTube 预告片中显示字幕';

  @override
  String get episodePreview => '剧集预览';

  @override
  String get mediaPreview => '媒体预览';

  @override
  String get episodePreviewDescription => '在聚焦、悬停或长按的卡片上播放 30 秒的嵌入式预览';

  @override
  String get mediaPreviewDescription => '在聚焦、悬停或长按的卡片上播放 30 秒的嵌入式预览';

  @override
  String get previewAudio => '预览音频';

  @override
  String get enablePreviewAudio => '为预告片和剧集预览启用音频';

  @override
  String get previewVolume => '预览音量';

  @override
  String get previewVolumeDescription => '卡片上媒体预览的播放音量';

  @override
  String get latestMedia => '最新媒体';

  @override
  String get recentlyReleased => '近期发布';

  @override
  String get recentlyReleasedSeriesType => '最近发布剧集排序方式';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      '按剧集、最新季或最新集播出日期对最近发布剧集首页行排序';

  @override
  String get myMedia => '我的媒体';

  @override
  String get myMediaSmall => '我的媒体（小）';

  @override
  String get continueWatching => '继续观看';

  @override
  String get resumeAudio => '继续收听';

  @override
  String get resumeBooks => '继续阅读';

  @override
  String get activeRecordings => '正在录制';

  @override
  String get playlists => '播放列表';

  @override
  String get liveTV => '直播电视';

  @override
  String get favoriteChannels => '收藏频道';

  @override
  String get resetToDefaults => '重置为默认值';

  @override
  String get homeRowPosterSize => '首页行海报尺寸';

  @override
  String get configureImageTypeForEachRow => '为每个启用的首页行配置图片类型';

  @override
  String get mergeContinueWatchingAndNextUp => '合并继续观看和接下来播放';

  @override
  String get combineBothRows => '将两行合并为一个首页栏目';

  @override
  String get continueWatchingDefaultAction => '默认操作';

  @override
  String get continueWatchingDefaultActionDescription =>
      '选择“继续观看”或“接下来播放”中的媒体项时执行的操作';

  @override
  String get goToDetailsScreen => '前往详情页';

  @override
  String get playImmediately => '立即播放';

  @override
  String get nextUpMaxDays => '下个播放最大保留天数';

  @override
  String get nextUpMaxDaysDescription => '上次观看后，该电视剧在下个播放保留时长';

  @override
  String daysValue(int days) {
    return '$days 天';
  }

  @override
  String get fullScreenRows => '展开首页行';

  @override
  String get fullScreenRowsDescription => '将首页行限制为每屏 1 行';

  @override
  String get homeRowsPadding => '首页行内边距';

  @override
  String get homeRowsPaddingDescription => '自定义首页各行之间的内边距';

  @override
  String get homeRowsGenresAndStudios => '类型和工作室';

  @override
  String get homeRowsExternalLists => '外部榜单';

  @override
  String get homeRowsStreamingServices => '流媒体服务';

  @override
  String get perRowSettings => '每行设置';

  @override
  String get autoLogin => '自动登录';

  @override
  String get lastUser => '上次使用的用户';

  @override
  String get currentUser => '当前用户';

  @override
  String get alwaysAuthenticate => '始终进行身份验证';

  @override
  String get requirePasswordWithToken => '即使使用存储的令牌也需要密码';

  @override
  String get confirmExit => '确认退出';

  @override
  String get showConfirmationBeforeExiting => '退出前显示确认信息';

  @override
  String get blockContentWithRatings => '屏蔽以下分级的内容：';

  @override
  String get noContentRatingsFound => '在此服务器上尚未找到内容分级。';

  @override
  String get couldNotLoadServerRatings => '无法加载服务器上的分级，只显示已保存的分级。';

  @override
  String get couldNotRefreshRatings => '无法从服务器刷新分级，将显示已保存的分级。';

  @override
  String get enablePinCode => '启用 PIN 码';

  @override
  String get pinSynced => 'PIN 已同步';

  @override
  String get pinResetFailed => '无法清除服务器上的 PIN。如果 PIN 仍然存在，请让服务器管理员将其移除。';

  @override
  String get requirePinToAccess => '需要 PIN 码才能访问你的账号';

  @override
  String get changePin => '更改 PIN 码';

  @override
  String get setNewPinCode => '设置新的 PIN 码';

  @override
  String get removePin => '删除 PIN 码';

  @override
  String get removePinProtection => '删除 PIN 码保护';

  @override
  String get screensaver => '屏幕保护程序';

  @override
  String get inAppScreensaver => '应用内屏幕保护程序';

  @override
  String get enableBuiltInScreensaver => '启用内置屏幕保护程序';

  @override
  String get mode => '模式';

  @override
  String get libraryArt => '媒体库图片';

  @override
  String get logo => '徽标';

  @override
  String get clock => '时钟';

  @override
  String get timeout => '超时';

  @override
  String minutesShort(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get dimmingLevel => '变暗程度';

  @override
  String get screensaverDuringAudio => '音乐和有声书播放时显示';

  @override
  String get screensaverDuringAudioDescription =>
      '允许在音频播放时启动屏幕保护程序，避免封面图长时间停留在屏幕上。';

  @override
  String get sleepAfterIdle => '闲置后让电视休眠';

  @override
  String get sleepAfterIdleDescriptionAndroid =>
      '在无按键操作达到此时间后关闭 Moonfin，以便电视自带的屏幕保护程序和睡眠定时器接管。暂停的内容会先停止，从而保留续播进度。';

  @override
  String get sleepAfterIdleDescriptionAppleTv =>
      '在无按键操作达到此时间后，将屏幕交还给 Apple TV 自带的屏幕保护程序和睡眠设置。Moonfin 保持运行，因此你可以从上次的位置继续观看。';

  @override
  String get maxAgeRating => '最高年龄分级';

  @override
  String get any => '任意';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => '需要年龄分级';

  @override
  String get onlyShowRatedContent => '只显示有分级的内容';

  @override
  String get displayClockDuringScreensaver => '屏幕保护期间显示时钟';

  @override
  String get clockModeStatic => '静止';

  @override
  String get clockModeBouncing => '弹跳';

  @override
  String get screensaverGeneralSettings => '常规设置';

  @override
  String get screensaverVisualComponents => '视觉组件';

  @override
  String get screensaverLibraryContent => '媒体库内容';

  @override
  String get screensaverBackdrop => '背景';

  @override
  String get screensaverBackdropBlack => '纯黑';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => '静谧';

  @override
  String get screensaverBackdropNeonPulse => '霓虹脉动';

  @override
  String get screensaverBackdropAurora => '极光';

  @override
  String get screensaverAdditionalComponent => '附加组件';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin 徽标';

  @override
  String get screensaverComponentRunner => '奔跑者';

  @override
  String get screensaverComponentMovement => '组件运动';

  @override
  String get screensaverComponentPosition => '组件位置';

  @override
  String get screensaverComponentSize => '组件大小';

  @override
  String get screensaverSourceLibrariesDefault => '全部（默认）';

  @override
  String get rottenTomatoesCritics => '烂番茄（评论家）';

  @override
  String get rottenTomatoesAudience => '烂番茄（观众）';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic（用户）';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => '社区评分';

  @override
  String get ratings => '评分';

  @override
  String get additionalRatings => '附加评分';

  @override
  String get mdblistWatchingNow => '正在 MDBList 上观看';

  @override
  String watchingNowWatchersCount(int count) {
    return '$count 人正在观看';
  }

  @override
  String watchingNowLiveSummary(String users, String movies, String shows) {
    return '$users 人正在观看 · $movies 部电影 · $shows 部剧集';
  }

  @override
  String watchingNowLiveSummaryToday(
    String users,
    String movies,
    String shows,
  ) {
    return '今日 $users 人观看 · $movies 部电影 · $shows 部剧集';
  }

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
  String get episodeRatings => '单集评分';

  @override
  String get showRatingsOnEpisodes => '显示单集评分';

  @override
  String get ratingSources => '评分来源';

  @override
  String get ratingSourcesDescription => '启用并重新排序整个应用中显示的评级来源';

  @override
  String get pluginDetected => '检测到插件';

  @override
  String get pluginNotDetected => '未检测到插件';

  @override
  String get pluginNotDetectedDescription => '当前未检测到服务器插件。本地设置仍然使用其保存的值或内置默认值。';

  @override
  String get moonbaseAddress => 'Moonbase 地址';

  @override
  String get pluginConnected => '已连接';

  @override
  String pluginConnectedVersion(String version) {
    return '已连接，版本 $version';
  }

  @override
  String get pluginSyncOn => '同步已开启';

  @override
  String get pluginSyncOff => '同步已关闭';

  @override
  String get syncProfileDescription => '此设备会与所选配置方案保持同步，直到你选择另一个。';

  @override
  String get profileAppliesEverywhere => '适用于所有位置';

  @override
  String get profileOverridesGlobal => '覆盖全局';

  @override
  String get profileThisDevice => '此设备';

  @override
  String get profileLoad => '加载';

  @override
  String get profileLoadSubtitle => '从服务器到此设备';

  @override
  String get profileSaveSubtitle => '从此设备到服务器';

  @override
  String resetNamedProfile(String profile) {
    return '重置 $profile 配置方案';
  }

  @override
  String get recentRequests => '最近的请求';

  @override
  String get recentlyAdded => '最近添加';

  @override
  String get trending => '趋势';

  @override
  String get popularMovies => '热门电影';

  @override
  String get movieGenres => '电影类型';

  @override
  String get upcomingMovies => '即将上映的电影';

  @override
  String get studios => '制片公司';

  @override
  String get popularSeries => '热门剧集';

  @override
  String get seriesGenres => '剧集类型';

  @override
  String get upcomingSeries => '即将上线的剧集';

  @override
  String get networks => '电视网';

  @override
  String get tags => '标签';

  @override
  String get genresAndTags => '类型和标签';

  @override
  String get seerrDiscoveryRows => 'Seerr 发现栏目';

  @override
  String get seerrDiscoverSliders => 'Seerr 发现页滑块';

  @override
  String get yourWatchlist => '我的观看清单';

  @override
  String get resetRowsToDefaults => '将栏目重置为默认值';

  @override
  String get enableSeerr => '启用 Seerr';

  @override
  String get showSeerrInNavigation => '在导航中显示 Seerr（需要服务器插件）';

  @override
  String get seerrUnavailable => '不可用，因为服务器插件 Seerr 支持被禁用。';

  @override
  String get nsfwFilter => 'NSFW 过滤器';

  @override
  String get hideAdultContent => '在结果中隐藏成人内容';

  @override
  String get showMissingCollectionItems => '显示合集中缺失的媒体项';

  @override
  String get showMissingCollectionItemsDesc => '在合集页面中包含缺失的媒体项';

  @override
  String get showSeerrAvailabilityBadges => '显示 Seerr 可用状态徽章';

  @override
  String get showSeerrAvailabilityBadgesDescription => '在整个应用的海报和季上显示 Seerr 状态';

  @override
  String get seerrBadgeStyle => '徽章样式';

  @override
  String get seerrBadgeStyleDescription => '徽章将 Seerr 的圆点放在角落。横幅将状态显示在海报顶部。';

  @override
  String get seerrBadgeStyleBadge => '徽章';

  @override
  String get seerrNotificationsSection => '通知';

  @override
  String get seerrNotifyNewRequestsTitle => '新请求通知';

  @override
  String get seerrNotifyNewRequestsSubtitle => '有人提交请求时通知我';

  @override
  String get seerrNotifyLibraryAddedTitle => '请求更新';

  @override
  String get seerrNotifyLibraryAddedSubtitle => '已批准、已拒绝和已添加到媒体库';

  @override
  String get seerrNotifyIssuesTitle => '媒体问题通知';

  @override
  String get seerrNotifyIssuesSubtitle => '新增问题、回复及问题解决通知';

  @override
  String get seerrNotifyNewMediaTitle => '新增媒体';

  @override
  String get seerrNotifyNewMediaSubtitle => '服务器媒体库新增内容提醒';

  @override
  String get seerrTestNotification => 'Send Test Notification';

  @override
  String get seerrTestNotificationDesc =>
      'Verify in-app and background push delivery';

  @override
  String seerrTestNotificationSentBody(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString devices',
      one: '1 device',
    );
    return 'Dispatched to $_temp0.';
  }

  @override
  String get seerrTestNotificationPushDisabled =>
      'In-app notification sent. Server push is not enabled.';

  @override
  String get seerrTestNotificationFailed => 'Failed to send test notification';

  @override
  String get seerrPushServerStatus => 'Server Push';

  @override
  String get seerrPushDeviceStatus => 'Device Push';

  @override
  String get seerrPushDeviceRegistered => 'Registered';

  @override
  String get seerrPushDeviceNotRegistered => 'Not registered';

  @override
  String loggedInAs(String username) {
    return '登录身份：$username';
  }

  @override
  String get discoverRows => 'Seerr 发现页';

  @override
  String get discoverRowsDescriptionPlugin =>
      '启用要在 Seerr 首页显示的栏目，拖动可调整排序。自定义顺序将与 Moonbase 同步。';

  @override
  String get discoverRowsDescription =>
      '启用要在 Seerr 首页显示的栏目，拖动可调整排序。自定义顺序将与 Moonbase 同步。';

  @override
  String get enabled => '已启用';

  @override
  String get hidden => '已隐藏';

  @override
  String get aboutTitle => '关于';

  @override
  String versionValue(String version) {
    return '版本 $version';
  }

  @override
  String get openSourceLicenses => '开源许可证';

  @override
  String get sourceCode => '源代码';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => '立即检查更新';

  @override
  String get checksLatestDesktopRelease => '检查此平台的最新桌面版发布';

  @override
  String get youAreUpToDate => '当前已是最新版本。';

  @override
  String get couldNotCheckForUpdates => '目前无法检查更新。';

  @override
  String get noCompatibleUpdate => '找不到该平台的兼容更新包。';

  @override
  String get updateChecksNotSupported => '此平台不支持更新检查。';

  @override
  String get updateNotificationsDisabled => '更新通知已禁用。';

  @override
  String get pleaseWaitBeforeChecking => '请稍候再检查。';

  @override
  String get latestUpdateAlreadyShown => '最新更新已显示过。';

  @override
  String get updateAvailable => '有可用更新。';

  @override
  String updateAvailableVersion(String version) {
    return '可用更新：v$version';
  }

  @override
  String get updateNotifications => '更新通知';

  @override
  String get showWhenUpdatesAvailable => '有更新时显示';

  @override
  String updateAvailableTitle(String version) {
    return '可更新到 v$version';
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
  String get watchedIndicatorsBackdrops => '已观看标记、背景图';

  @override
  String get focusColorWatchedIndicatorsBackdrops => '焦点颜色、已观看标记、背景图';

  @override
  String get navbarStyleToolbarAppearance => '导航栏样式、工具栏按钮、外观';

  @override
  String get featuredContentAppearance => '特色内容、外观';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => '图片缓存上限';

  @override
  String get clearImageCache => '清除图片缓存';

  @override
  String get imageCacheCleared => '已清除图片缓存';

  @override
  String get clear => '清除';

  @override
  String get browse => '浏览';

  @override
  String get noResults => '没有结果';

  @override
  String get seerrAvailableStatus => '可用';

  @override
  String get seerrRequestedStatus => '已请求';

  @override
  String get seerrDownloading => '正在下载';

  @override
  String seerrDownloadingSize(String done, String total) {
    return '正在下载 · $done / $total';
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
    return '下载中 · $percent%';
  }

  @override
  String get seerrImportingStatus => '入库中';

  @override
  String get seerrWaitingForImport => '已下载，等待导入';

  @override
  String get seerrDownloadStalled => '已停滞';

  @override
  String get seerrDownloadFailed => '下载失败';

  @override
  String get seerrImportBlocked => '导入受阻';

  @override
  String get seerrNotFoundYet => '尚未找到';

  @override
  String get seerrSearchingIndexers => '正在搜索索引器';

  @override
  String seerrNotFoundYetSearched(String when) {
    return '尚未找到 · 已于 $when 搜索';
  }

  @override
  String get seerrNotAvailableYet => '尚不可用';

  @override
  String seerrAvailableOn(String date) {
    return '于 $date 可用';
  }

  @override
  String seerrNextEpisodeOn(String date) {
    return '下一集 $date';
  }

  @override
  String get seerrGetDifferentRelease => '获取其他版本';

  @override
  String seerrGetDifferentReleaseConfirm(String service, String release) {
    return '$service 将从下载客户端中移除 $release，阻止其再次被抓取，并搜索其他版本。';
  }

  @override
  String seerrGetDifferentReleaseDone(String service) {
    return '已移除。$service 正在搜索其他版本。';
  }

  @override
  String get seerrGetDifferentReleaseFailed => '无法移除下载任务';

  @override
  String itemsCount(int count) {
    return '$count 个媒体项';
  }

  @override
  String get seerrSettings => 'Seerr 设置';

  @override
  String get requestMore => '请求更多';

  @override
  String get requestMore4k => '请求更多 4K 版本';

  @override
  String get request => '请求';

  @override
  String get request4k => '请求 4K 版本';

  @override
  String get requested4k => '已请求 4K 版本';

  @override
  String get cancelRequest => '取消请求';

  @override
  String get cancelRequest4k => '取消 4K 版本请求';

  @override
  String get playInMoonfin => '在 Moonfin 中播放';

  @override
  String get requestedByLabel => '请求者';

  @override
  String requestedByName(String name) {
    return '由 $name 请求';
  }

  @override
  String get manageRequests => '管理请求';

  @override
  String get watchlist => '关注列表';

  @override
  String get onWatchlist => '关注列表';

  @override
  String get approve => '批准';

  @override
  String get declineAction => '拒绝';

  @override
  String get similar => '相似';

  @override
  String get recommendations => '推荐';

  @override
  String cancelRequestForTitle(String title) {
    return '取消“$title”的请求吗？';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '取消“$title”的 $count 个请求吗？';
  }

  @override
  String get keep => '保留';

  @override
  String get itemNotFoundInLibrary => '在你的 Moonfin 媒体库中未找到此媒体项';

  @override
  String get errorSearchingLibrary => '搜索媒体库时出错';

  @override
  String budgetAmount(String amount) {
    return '预算：\$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return '收入：\$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '请求 $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return '请求 4K $type版本';
  }

  @override
  String get submitRequest => '提交请求';

  @override
  String get allSeasons => '所有季';

  @override
  String get seerrSeriesContinuing => '剧集连载中・可申请后续季数';

  @override
  String get seerrSeriesMatchDescription => '我们无法自动匹配这部剧集。请在下方选择正确的剧集。';

  @override
  String get seerrSeriesNoMatch => '我们找不到这部剧集的匹配项，因此无法请求。';

  @override
  String get seerrSeriesMatchFailed =>
      'Sonarr 找不到这部剧集的匹配项，或无法连接到 Sonarr。请重试，或在 Seerr 上检查该剧集。';

  @override
  String get advancedOptions => '高级选项';

  @override
  String get noServiceServersConfigured => '未配置服务服务器';

  @override
  String get server => '服务器';

  @override
  String get qualityProfile => '质量配置';

  @override
  String get rootFolder => '根文件夹';

  @override
  String get showMore => '显示更多';

  @override
  String get appearances => '参演作品';

  @override
  String get crewSection => '幕后人员';

  @override
  String ageValue(int age) {
    return '年龄 $age';
  }

  @override
  String get noRequests => '暂无请求';

  @override
  String get pendingStatus => '待处理';

  @override
  String get declinedStatus => '已拒绝';

  @override
  String get partiallyAvailable => '部分可用';

  @override
  String get downloadingStatus => '正在下载';

  @override
  String get approvedStatus => '已批准';

  @override
  String get notRequestedStatus => '未请求';

  @override
  String get blocklistedStatus => '已列入黑名单';

  @override
  String get deletedStatus => '已删除';

  @override
  String get failedStatus => '请求失败';

  @override
  String get processingStatus => '处理中';

  @override
  String modifiedByName(String name) {
    return '操作人：$name';
  }

  @override
  String get completedStatus => '已完成';

  @override
  String get requestErrorDuplicate => '该影片已提交过请求';

  @override
  String get requestErrorQuota => '已达最大请求额度';

  @override
  String get requestErrorBlocklisted => '该影片已被屏蔽，无法请求';

  @override
  String get requestErrorNoSeasons => '全季资源已拥有或已提交请求';

  @override
  String get requestErrorPermission => '你无权限提交媒体请求';

  @override
  String get seerrRequestsTitle => '媒体请求';

  @override
  String get seerrIssuesTitle => '媒体问题反馈';

  @override
  String get sortNewest => '最新提交';

  @override
  String get sortLastModified => '最近更新';

  @override
  String get noIssues => '暂无反馈问题';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '电影剩余请求额度：$remaining/$limit';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '剧集剩余请求额度：$remaining/$limit';
  }

  @override
  String partOfCollectionName(String name) {
    return '合集：$name';
  }

  @override
  String get viewCollection => '查看完整合集';

  @override
  String get requestCollection => '请求整套合集';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '共$total部影片 · 已有$available部';
  }

  @override
  String requestMoviesCount(int count) {
    return '请求$count部影片';
  }

  @override
  String requestingProgress(int current, int total) {
    return '正在提交 $current/$total……';
  }

  @override
  String requestedMoviesCount(int count) {
    return '已提交$count部影片请求';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '成功$ok部，总计$total部';
  }

  @override
  String get collectionAllRequested => '合集全部影片已拥有或已提交请求';

  @override
  String get reportIssue => '反馈媒体问题';

  @override
  String get issueTypeVideo => '视频画面';

  @override
  String get issueTypeAudio => '音频音效';

  @override
  String get whatsWrong => '问题描述？';

  @override
  String get allEpisodes => '全季所有集数';

  @override
  String get episode => '单集';

  @override
  String get openStatus => '待处理';

  @override
  String get resolvedStatus => '已解决';

  @override
  String get resolveAction => '标记已解决';

  @override
  String get reopenAction => '重新开启反馈';

  @override
  String reportedByName(String name) {
    return '反馈人：$name';
  }

  @override
  String commentsCount(int count) {
    return '$count条评论';
  }

  @override
  String get addComment => '添加评论';

  @override
  String get deleteIssueConfirm => '确定删除这条反馈？';

  @override
  String get submitReport => '提交反馈';

  @override
  String get tmdbScore => 'TMDB 评分';

  @override
  String get releaseDateLabel => '发布日期';

  @override
  String get firstAirDateLabel => '首播日期';

  @override
  String get revenueLabel => '收入';

  @override
  String get runtimeLabel => '时长';

  @override
  String get budgetLabel => '预算';

  @override
  String get originalLanguageLabel => '原始语言';

  @override
  String get seasonsLabel => '季数';

  @override
  String get episodesLabel => '集';

  @override
  String get access => '访问';

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
  String get create => '创建';

  @override
  String get disable => '禁用';

  @override
  String get done => '完成';

  @override
  String get edit => '编辑';

  @override
  String get encoding => '编码';

  @override
  String get error => '错误';

  @override
  String get forward => '快进';

  @override
  String get general => '常规';

  @override
  String get go => '前往';

  @override
  String get install => '安装';

  @override
  String get installed => '已安装';

  @override
  String get interval => '间隔';

  @override
  String get name => '名称';

  @override
  String get networking => '网络';

  @override
  String get next => '下一个';

  @override
  String get path => '路径';

  @override
  String get paused => '已暂停';

  @override
  String get permissions => '权限';

  @override
  String get processing => '处理中';

  @override
  String get profile => '资料';

  @override
  String get provider => '提供方';

  @override
  String get refresh => '刷新';

  @override
  String get remote => '遥控';

  @override
  String get rename => '重命名';

  @override
  String get revoke => '撤销';

  @override
  String get role => '角色';

  @override
  String get root => '根';

  @override
  String get run => '运行';

  @override
  String get search => '搜索';

  @override
  String get select => '选择';

  @override
  String get send => '发送';

  @override
  String get sessions => '会话';

  @override
  String get set => '设置';

  @override
  String get status => '状态';

  @override
  String get stop => '停止';

  @override
  String get streaming => '串流';

  @override
  String get time => '时间';

  @override
  String get trickplay => 'Trickplay 预览图';

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
  String get mute => '静音';

  @override
  String get branding => '品牌';

  @override
  String get adminDrawerDashboard => '仪表板';

  @override
  String get adminDrawerAnalytics => '分析';

  @override
  String get adminDrawerSettings => '设置';

  @override
  String get adminDrawerBranding => '品牌';

  @override
  String get adminDrawerUsers => '用户';

  @override
  String get adminDrawerLibraries => '媒体库';

  @override
  String get adminDrawerDisplay => '显示';

  @override
  String get adminDrawerMetadata => '元数据';

  @override
  String get adminDrawerNfo => 'NFO 设置';

  @override
  String get adminDrawerTranscoding => '转码';

  @override
  String get adminDrawerResume => '继续播放';

  @override
  String get adminDrawerStreaming => '串流';

  @override
  String get adminDrawerTrickplay => 'Trickplay 预览图';

  @override
  String get adminDrawerDevices => '设备';

  @override
  String get adminDrawerActivity => '活动';

  @override
  String get adminDrawerNetworking => '网络';

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
  String get adminDrawerRepositories => '仓库';

  @override
  String get adminDrawerLiveTv => '直播电视';

  @override
  String get adminExitTooltip => '退出管理';

  @override
  String get adminPremiereNoteLiveTv =>
      '直播电视需要 Emby Premiere。没有它，服务器不会导入频道或录制任何内容。';

  @override
  String get adminPremiereNoteBackups => '备份与还原在试用期结束后需要 Emby Premiere。';

  @override
  String get adminGeneralRunAtStartup => '开机时自动运行服务器';

  @override
  String get adminGeneralLaunchWebApp => '服务器启动时在浏览器中打开 Web 应用';

  @override
  String get adminGeneralBannerText => '首页横幅文字';

  @override
  String get adminGeneralBannerTextHelp => '在所有用户的首页上显示';

  @override
  String get adminGeneralSectionMaintenance => '维护模式';

  @override
  String get adminGeneralMaintenanceMode => '使服务器进入维护模式';

  @override
  String get adminGeneralMaintenanceModeHelp => '用户只能看到维护消息。';

  @override
  String get adminGeneralMaintenanceMessage => '维护消息';

  @override
  String get adminGeneralMaintenanceMessageHelp => '留空则使用每种用户语言的通用消息。';

  @override
  String get adminGeneralSectionUpdates => '自动更新';

  @override
  String get adminGeneralAutoUpdate => '自动更新服务器';

  @override
  String get adminGeneralAutoRestart => '自动重启以应用更新';

  @override
  String get adminGeneralAutoRestartHelp => '服务器仅在无用户活动时重启。';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return '在系统事件（$event）之后';
  }

  @override
  String get adminPluginNeedsPremiere => '14 天免费试用后需要 Emby Premiere';

  @override
  String get adminEmbyBackupsHelp => 'Emby 通过其备份与还原插件进行备份。';

  @override
  String get adminEmbyBackupsNoPlugin => '未安装备份与还原插件。请从插件目录安装它以备份此服务器。';

  @override
  String get adminEmbyBackupNow => '立即备份';

  @override
  String get adminEmbyFullBackup => '完整备份';

  @override
  String get adminEmbyLightBackups => '数据库备份';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return '还原 $name 吗？此操作将替换此服务器的媒体库、设置、用户和密码，完成后服务器将关闭。你可能需要手动重新启动它。';
  }

  @override
  String get adminEmbyRestoreServerId => '还原服务器 ID';

  @override
  String get adminEmbyRestoreServerIdHelp => '将同一备份还原到多台服务器时，请关闭此选项。';

  @override
  String get adminEmbyRestoreShuttingDown => '还原已完成，服务器正在关闭。如果没有自动重启，请手动启动它。';

  @override
  String get adminHiddenRemotely => '远程连接时在登录屏幕上隐藏';

  @override
  String get adminHiddenFromUnusedDevices => '在从未登录过的设备上隐藏于登录屏幕';

  @override
  String get adminSimultaneousStreamLimitHelp => '限制此用户可同时播放的视频数量。';

  @override
  String get adminUnlimited => '无限制';

  @override
  String get adminAutoRemoteQuality => '自动远程画质（Mbps）';

  @override
  String get adminAutoRemoteQualityHelp => '当播放器设置为自动画质时用于远程连接。留空以自动检测。';

  @override
  String get adminAllowCameraUpload => '允许相机上传';

  @override
  String get adminAllowSubtitleDownloading => '允许下载字幕';

  @override
  String get adminAllowMediaConversion => '允许媒体转换';

  @override
  String get adminAllowSyncTranscoding => '允许需要转码的下载';

  @override
  String get adminAllowSharingPersonalItems => '允许与其他用户共享播放列表';

  @override
  String get adminAllowPreferenceAccess => '允许修改自己的密码和个人资料图片';

  @override
  String get adminTagMode => '标签模式';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby Connect 用户名或电子邮件';

  @override
  String get adminEmbyConnectHelp => '让此用户无需知道服务器地址即可从任何 Emby 应用登录。';

  @override
  String get adminEmbyConnectLink => '链接';

  @override
  String get adminEmbyConnectUnlink => '取消链接';

  @override
  String get adminEmbyConnectLinked => '已链接到 Emby Connect';

  @override
  String get adminEmbyConnectPending => '邀请已发送。对方接受后即可建立链接。';

  @override
  String get adminEmbyConnectUnlinked => 'Emby Connect 链接已移除';

  @override
  String get adminEmbyConnectNotFound => '没有与该用户名或电子邮件匹配的 Emby Connect 账户。';

  @override
  String get adminLibImportPlaylists => '导入播放列表文件';

  @override
  String get adminLibExcludeFromSearch => '从全局搜索中排除';

  @override
  String get adminLibForcedSubtitlesOnly => '仅下载强制字幕';

  @override
  String get adminLibImportCollections => '从元数据下载器导入合集';

  @override
  String get adminLibThumbnailInterval => '预览缩略图间隔';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return '每 $count 秒';
  }

  @override
  String get adminLibThumbnailAtChapters => '在章节标记处';

  @override
  String get adminLibSaveThumbnailsWithMedia => '将预览缩略图保存到媒体文件夹';

  @override
  String get adminLibrarySectionMarkers => '片头标记';

  @override
  String get adminLibIntroDetection => '检测片头';

  @override
  String get adminLibIntroDetectionDuringScan => '在媒体库扫描期间检测片头';

  @override
  String get adminProviderEmbyGuide => 'Emby 节目指南数据';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      '选择频道阵容。如果列表为空，请检查邮政编码。频道阵容需要 Emby Premiere。';

  @override
  String get adminLiveTvWakeServer => '为录制内容唤醒服务器';

  @override
  String get adminDrawerLiveTvChannels => '直播电视频道';

  @override
  String get adminPageDescLiveTvChannels => '开启或关闭频道并设置其顺序';

  @override
  String get adminLiveTvChannelsEmpty => '尚无频道。设置调谐器并由服务器导入频道后，它们会显示在此处。';

  @override
  String get adminTranscodingHwaAdvanced => '高级';

  @override
  String get adminTranscodingHwaHelp => '在“高级”中可以选择硬件编解码器并调整其顺序。';

  @override
  String get adminTranscodingHwDecoders => '首选硬件解码器';

  @override
  String get adminTranscodingHwEncoders => '首选硬件编码器';

  @override
  String get adminTranscodingTempPathHelp => '转码器存放工作文件的位置。留空则使用服务器的数据文件夹。';

  @override
  String get adminTranscodingThrottleHelp => '缓冲足够后降低转码速度，以减少 CPU 占用。';

  @override
  String get adminTranscodingDownmixHelp => '音频缩混时提高音量。1 表示保持原始音量。';

  @override
  String get adminTranscodingFontExtraction => '允许实时提取字体';

  @override
  String get adminTranscodingMaxResolution => '最大转码分辨率';

  @override
  String get adminTranscodingMaxResolutionHelp => '对所有转码设置的限制，无论应用请求何种画质。';

  @override
  String get adminTranscodingToneMapSoftware => '软件转码中的色调映射';

  @override
  String get adminTranscodingToneMapHardware => '硬件转码中的色调映射';

  @override
  String get adminTranscodingToneMapHelp => '防止 HDR 视频在转码后显得暗淡发白。';

  @override
  String get adminNetworkingLocalAddress => '本地 IP 地址';

  @override
  String get adminNetworkingLocalAddressHelp => '服务器提供给应用的本地地址。留空则自动检测。';

  @override
  String get adminNetworkingBehindProxy => 'HTTPS 由反向代理处理';

  @override
  String get adminNetworkingExternalDomain => '外部域名';

  @override
  String get adminNetworkingExternalDomainHelp =>
      '用于远程连接的域名或动态 DNS 名称，不含协议或端口。自定义证书需要此设置。';

  @override
  String get adminNetworkingUpnp => '启用自动端口映射';

  @override
  String get adminNetworkingUpnpHelp => '尝试使用 UPnP 将公共端口映射到本地端口。部分路由器不支持此功能。';

  @override
  String get adminNetworkingProxyHeaders => '读取代理标头以获取客户端地址';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      '使用 X-Forwarded-For 等标头确定各客户端的地址。仅在反向代理后方启用此选项。';

  @override
  String get adminNetworkingProxyHeadersRemote => '仅在包含远程地址时';

  @override
  String get adminNetworkingIpv4Only => '对外请求使用 IPv4';

  @override
  String get adminNetworkingIpv4OnlyHelp => '适用于元数据提供方和其他服务无法通过 IPv6 访问的情况。';

  @override
  String get adminOnePerLine => '每行一项';

  @override
  String get adminStreamingStreamLimit => '最大同时视频串流数';

  @override
  String get adminStreamingStreamLimitHelp => '整个服务器同时可播放的视频数量。0 表示无限制。';

  @override
  String get adminSyncJobsConversions => '转换任务';

  @override
  String get adminSyncJobsDownloads => '下载任务';

  @override
  String get adminSyncJobsEmpty => '暂无任务';

  @override
  String get adminSyncJobCancel => '取消任务';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return '取消“$name”并从列表中移除吗？';
  }

  @override
  String get adminSyncJobConverting => '转换中';

  @override
  String get adminSyncJobReady => '等待传输';

  @override
  String get adminSyncJobTransferring => '传输中';

  @override
  String get adminSyncJobCompletedWithError => '已完成但有错误';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个媒体项',
      one: '1 个媒体项',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => '数据库';

  @override
  String get adminPageDescDatabase => '缓存大小与维护';

  @override
  String get adminDatabaseWarning => '这些是高级选项。除非有需要，否则请保持默认值。';

  @override
  String get adminDatabaseCacheSize => '数据库缓存大小（MB）';

  @override
  String get adminDatabaseCacheSizeHelp =>
      '服务器在每个数据库文件中保留在内存中的量。增大可提升服务器速度。重启后生效。';

  @override
  String get adminDatabaseOptimize => '服务器关闭时优化数据库';

  @override
  String get adminDatabaseOptimizeHelp =>
      '通常不会执行任何操作，但偶尔会运行有助于服务器查询的分析。关闭时间可能变长。';

  @override
  String get adminDatabaseAnalysisLimit => '分析行数上限';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      '优化步骤读取每个索引的大致行数。行数越多效果越好，但可能延长关闭时间。';

  @override
  String get adminDatabaseVacuum => '下次启动时清理数据库';

  @override
  String get adminDatabaseVacuumHelp =>
      '重建数据库文件以占用最少空间，有助于提升性能。运行期间服务器不可用且不显示进度，请勿强制关闭。该选项会在那次启动后自动关闭。';

  @override
  String get adminDrawerCinemaIntros => '影院片头';

  @override
  String get adminPageDescCinemaIntros => '播放前的预告片和片头';

  @override
  String get adminCinemaIntrosPlayBefore => '在此内容前播放片头';

  @override
  String get adminCinemaIntrosUpcoming => '包含新上映和即将上映电影的预告片';

  @override
  String get adminCinemaIntrosOlder => '包含较早电影的预告片';

  @override
  String get adminCinemaIntrosLibrary => '包含我媒体库中电影的预告片';

  @override
  String get adminCinemaIntrosLibraryHelp => '需要先设置本地预告片。';

  @override
  String get adminCinemaIntrosCount => '要播放的预告片数量';

  @override
  String get adminCinemaIntrosParental => '智能家长控制';

  @override
  String get adminCinemaIntrosParentalHelp => '仅选择与正在观看内容分级相同或更低的预告片。';

  @override
  String get adminCinemaIntrosUnwatchedOnly => '仅在未观看内容前播放片头';

  @override
  String get adminCinemaIntrosSimilarOnly => '仅播放与正在观看内容相似的预告片';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp => '依据共同的类型、标签、工作室等判断。';

  @override
  String get adminCinemaIntrosCustom => '自定义片头';

  @override
  String get adminCinemaIntrosCustomPath => '自定义片头文件夹';

  @override
  String get adminCinemaIntrosCustomPathHelp => '存放视频的文件夹。会随机选择一个，在预告片之后播放。';

  @override
  String get adminCinemaIntrosCodecPath => '编解码器片头文件夹';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      '存放视频的文件夹。文件名与视频编解码器、音频编解码器、音频配置文件或标签匹配的视频会在正片之前播放。';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => '推送播放与 DLNA 服务器';

  @override
  String get adminDlnaPlayTo => '启用 DLNA 推送播放';

  @override
  String get adminDlnaPlayToHelp => 'Emby 可发现网络中的设备并对其进行远程控制。';

  @override
  String get adminDlnaServer => '启用 DLNA 服务器';

  @override
  String get adminDlnaServerHelp => '允许服务器向 DLNA 设备串流媒体。';

  @override
  String get adminDlnaDefaultUser => '默认用户';

  @override
  String get adminDlnaDefaultUserHelp => '连接设备可看到哪些用户的媒体库。设备配置文件可覆盖此设置。';

  @override
  String get adminDlnaDebugLog => '启用 DLNA 调试日志';

  @override
  String get adminDlnaDebugLogHelp => '会生成较大的日志文件。仅在排查问题时启用。';

  @override
  String get adminDrawerCameraUpload => '相机上传';

  @override
  String get adminPageDescCameraUpload => '手机照片的保存位置';

  @override
  String get adminCameraUploadPath => '相机上传文件夹';

  @override
  String get adminCameraUploadPathHelp => '留空则使用默认文件夹。自定义文件夹还需添加为媒体库。';

  @override
  String get adminCameraUploadSubfolders => '为每台设备创建子文件夹';

  @override
  String get adminDrawerConversions => '转换';

  @override
  String get adminPageDescConversions => '转换后的媒体与下载内容';

  @override
  String get adminConversionsTempPath => '临时文件文件夹';

  @override
  String get adminConversionsTempPathHelp => '转换期间媒体的存放位置。';

  @override
  String get adminConversionsFullSpeed => '全速转换';

  @override
  String get adminConversionsFullSpeedHelp => '转换默认以较慢速度运行，以降低负载。';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => '许可证状态与密钥';

  @override
  String get adminPremiereActive => '此服务器上的 Premiere 已激活。';

  @override
  String get adminPremiereInactive => '此服务器没有 Premiere 密钥。';

  @override
  String get adminPremiereKeyInvalid => '已设置密钥但未激活。可能输入错误或已过期。';

  @override
  String get adminPremiereCurrentKey => '当前密钥';

  @override
  String get adminPremiereNewKey => '新密钥';

  @override
  String get adminPremiereNewKeyHint => '粘贴 Emby Premiere 电子邮件中的密钥。';

  @override
  String get adminPremiereSaveKey => '保存密钥';

  @override
  String get adminPremiereRemoveKey => '移除密钥';

  @override
  String get adminPremiereKeyRejected => 'Emby 已保存该密钥，但未接受。';

  @override
  String get adminPremiereLoadFailed => '无法加载 Premiere 状态';

  @override
  String get embyPremiereRequiredTitle => '需要 Emby Premiere';

  @override
  String get embyPremiereRequiredBody => '此功能需要服务器上拥有有效的 Emby Premiere 订阅。';

  @override
  String get embyPremiereRequiredSaveBody =>
      '此功能需要有效的 Emby Premiere 订阅。Emby 会保留该设置，但在 Premiere 激活前不会使用它。';

  @override
  String get embyPremiereLearnMore => '了解更多';

  @override
  String get embyPremiereSaveAnyway => '仍然保存';

  @override
  String get embyPremiereEnterKey => '输入密钥';

  @override
  String get adminPremiereNote =>
      '需要 Emby Premiere。服务器会保留此设置，但在 Premiere 激活前不会使用它。';

  @override
  String adminExternalIdLabel(String name) {
    return '$name Id';
  }

  @override
  String get adminExternalIdTypePerson => '人物';

  @override
  String get adminExternalIdTypeArtist => '艺术家';

  @override
  String get adminExternalIdTypeAlbumArtist => '专辑艺术家';

  @override
  String get adminExternalIdTypeOtherArtist => '其他艺术家';

  @override
  String get adminExternalIdTypeReleaseGroup => '发行组';

  @override
  String get adminExternalIdTypeBook => '图书';

  @override
  String get adminPlaybackHwAccelWarning =>
      '硬件加速在某些系统上可能不稳定。请保持操作系统和视频驱动程序为最新版本；如果视频停止播放，请将此项重新设置为“无”。';

  @override
  String get adminLibMetadataChangeHelp =>
      '元数据设置的更改适用于新内容。要更新现有内容，请从其详情页刷新或刷新媒体库。';

  @override
  String get adminLibFetcherSettings => '获取器设置';

  @override
  String adminLibImageOptionsTitle(String type) {
    return '$type 的图片选项';
  }

  @override
  String get adminLibFetchImages => '获取图片';

  @override
  String get adminLibMaxBackdrops => '每个媒体项的背景图数量上限';

  @override
  String get adminLibMinBackdropWidth => '背景图最小下载宽度';

  @override
  String get adminImageTypeArt => '清晰艺术图';

  @override
  String get adminImageTypeBox => '盒装封面';

  @override
  String get adminImageTypeBoxRear => '盒装封面（背面）';

  @override
  String get adminImageTypeDisc => '光盘';

  @override
  String get adminImageTypeMenu => '菜单';

  @override
  String get adminActivityMediaDetails => '媒体详情';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      '例如 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => '原始语言';

  @override
  String get adminMetadataFieldDateAdded => '添加日期';

  @override
  String get adminMetadataFieldArtists => '艺术家';

  @override
  String get adminMetadataFieldAlbumArtists => '专辑艺术家';

  @override
  String get adminMetadataFieldAlbum => '专辑';

  @override
  String get adminMetadataFieldSeriesName => '剧集名称';

  @override
  String get adminMetadataFieldEpisodeNumber => '集号';

  @override
  String get adminMetadataFieldSeasonNumber => '季号';

  @override
  String get adminMetadataFieldTrackNumber => '曲目号';

  @override
  String get adminMetadataFieldDiscNumber => '光盘号';

  @override
  String get adminMetadataFieldAirTime => '播出时间';

  @override
  String get adminMetadataFieldRuntime => '时长（分钟）';

  @override
  String get adminMetadataFieldPlaceOfBirth => '出生地';

  @override
  String get adminMetadataFieldBirthDate => '出生日期';

  @override
  String get adminMetadataFieldBirthYear => '出生年份';

  @override
  String get adminMetadataFieldDeathDate => '逝世日期';

  @override
  String get adminMetadataFieldAspectRatio => '原始宽高比';

  @override
  String get adminMetadataFieldAirsBeforeSeason => '季前播出';

  @override
  String get adminMetadataFieldAirsAfterSeason => '季后播出';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => '集前播出';

  @override
  String get adminMetadataNamesHelp => '用分号分隔多个名称。';

  @override
  String get adminMetadataSectionRatings => '评分';

  @override
  String get adminMetadataItemLocked => '此媒体项的元数据已锁定。请先解锁再进行识别。';

  @override
  String get adminMetadataNameOrIdRequired => '请输入名称或外部 ID。';

  @override
  String get adminLibMetadataReaders => '元数据读取器';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return '相似媒体项提供方：$type';
  }

  @override
  String get adminLibMediaSegmentProviders => '媒体分段提供方';

  @override
  String get adminLibEnableLibrary => '启用媒体库';

  @override
  String get adminLibEnableLibraryHelp => '禁用媒体库后，它将在所有用户视图中隐藏。';

  @override
  String get adminLibSaveLyricsWithMedia => '将歌词保存到媒体文件夹';

  @override
  String get adminLibUseCustomTagDelimiters => '使用自定义标签分隔符';

  @override
  String get adminLibCustomTagDelimiters => '自定义标签分隔符';

  @override
  String get adminLibCustomTagDelimitersHelp => '用作分隔标签的分隔符的字符。';

  @override
  String get adminLibDelimiterWhitelist => '分隔符白名单';

  @override
  String get adminLibDelimiterWhitelistHelp => '不参与标签拆分的项目，每行一项。';

  @override
  String get adminLibDownloadLanguages => '下载语言';

  @override
  String get adminLibraryFolderRequired => '请为此媒体库添加至少一个文件夹。';

  @override
  String get adminRenameLibraryWarning => '重命名媒体库会丢失其所有元数据。请谨慎操作。';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return '移除媒体库“$name”吗？磁盘上的文件不会被删除。';
  }

  @override
  String get adminDeleteLibraryLocations => '以下媒体位置将从媒体库中移除：';

  @override
  String get adminRefreshMode => '刷新模式';

  @override
  String get adminRefreshModeScan => '扫描新增和更新的文件';

  @override
  String get adminRefreshModeMissing => '搜索缺失的元数据';

  @override
  String get adminReplaceTrickplayImages => '替换现有的 Trickplay 图片';

  @override
  String get adminRefreshDialogHelp => '元数据将依据仪表板中启用的设置和互联网服务进行刷新。';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown / $total';
  }

  @override
  String get adminLiveTvTabSources => '调谐器与节目指南';

  @override
  String get adminLiveTvTabRecordings => '录制内容';

  @override
  String get adminLiveTvAddTuner => '添加调谐器设备';

  @override
  String get adminLiveTvEditTuner => '编辑调谐器设备';

  @override
  String get adminLiveTvTunerType => '调谐器类型';

  @override
  String get adminLiveTvDetectDevices => '检测我的设备';

  @override
  String get adminLiveTvNoNewDevices => '未发现新设备';

  @override
  String get adminLiveTvDrmNote => '带有 DRM 的频道将不会被导入。';

  @override
  String get adminLiveTvTunerSaved => '调谐器已保存';

  @override
  String get adminLiveTvDeleteTuner => '删除调谐器设备';

  @override
  String get adminLiveTvDeleteTunerConfirm => '确定要删除此调谐器设备吗？';

  @override
  String get adminLiveTvDeleteProvider => '删除节目指南提供方';

  @override
  String get adminLiveTvDeleteProviderConfirm => '确定要删除此节目指南提供方吗？';

  @override
  String get adminLiveTvProviderSaved => '节目指南提供方已保存';

  @override
  String get adminLiveTvAddProvider => '添加提供方';

  @override
  String get adminLiveTvRefreshGuide => '刷新节目指南数据';

  @override
  String get adminLiveTvMapChannels => '映射频道';

  @override
  String get adminLiveTvNoTunerChannels => '未发现调谐器频道';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'XMLTV 文件的路径或 URL。服务器会读取并检查其更新。您需要自行创建和更新该文件。';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return '在 $url 创建账户';
  }

  @override
  String get adminLiveTvSdSignIn => '登录';

  @override
  String get adminLiveTvSdLineup => '频道阵容';

  @override
  String get adminLiveTvSdSelectLineup => '选择频道阵容。如果列表为空，请检查用户名、密码和邮政编码。';

  @override
  String get adminLiveTvGuideDays => '要下载的节目指南数据天数';

  @override
  String get adminLiveTvGuideDaysHelp =>
      '天数越多，可安排的日程越靠后、可查看的节目越多，但下载耗时更长。自动选项会根据频道数量选择一个值。';

  @override
  String get adminLiveTvRecordingPath => '默认录制路径';

  @override
  String get adminLiveTvRecordingPathHelp => '录制内容的保存位置。留空则使用服务器的程序数据文件夹。';

  @override
  String get adminLiveTvStartWhenPossible => '尽可能提前开始';

  @override
  String get adminLiveTvStopWhenPossible => '尽可能延后结束';

  @override
  String get adminLiveTvMinutesBefore => '提前（分钟）';

  @override
  String get adminLiveTvMinutesAfter => '延后（分钟）';

  @override
  String get adminLiveTvSectionGuide => '节目指南数据';

  @override
  String get adminLiveTvSectionDefaultRecording => '默认录制设置';

  @override
  String get adminLiveTvSectionMetadata => '录制元数据';

  @override
  String adminUserLastActivity(String time) {
    return '上次活动：$time';
  }

  @override
  String get adminCurrentPassword => '当前密码';

  @override
  String get adminChannelAccess => '频道访问';

  @override
  String get adminDeviceAccess => '设备访问';

  @override
  String get adminDeleteFromAllLibraries => '所有媒体库';

  @override
  String get adminUserDisabledBanner => '此用户已禁用。请在“权限”下关闭“禁用”，让其再次登录。';

  @override
  String get adminNewPasswordEmpty => '新密码不能为空';

  @override
  String get adminScheduleStartBeforeEnd => '开始时间必须早于结束时间';

  @override
  String get adminDashboardAlerts => '警报';

  @override
  String get adminSessionGoHome => '转到首页';

  @override
  String get adminPlayMethodRemux => '重新封装';

  @override
  String get adminPlayMethodDirectStream => '直接串流';

  @override
  String get adminPlayMethodDirectPlay => '直接播放';

  @override
  String get adminLogLevelTrace => '跟踪';

  @override
  String get adminLogLevelDebug => '调试';

  @override
  String get adminLogLevelInformation => '信息';

  @override
  String get adminLogLevelWarning => '警告';

  @override
  String get adminLogLevelError => '错误';

  @override
  String get adminLogLevelCritical => '严重';

  @override
  String get adminLogLevelNone => '无';

  @override
  String get adminActivityAllUsers => '所有用户';

  @override
  String adminTaskLastRan(String time, String duration) {
    return '上次运行于 $time，耗时 $duration。';
  }

  @override
  String get adminTaskResultFailed => '请求失败';

  @override
  String get adminTaskResultCancelled => '已取消';

  @override
  String get adminTaskResultAborted => '因服务器关闭而中止';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '$seconds秒';
  }

  @override
  String get adminDeleteTaskTrigger => '删除任务触发器';

  @override
  String get adminDeleteTaskTriggerConfirm => '确定要删除此任务触发器吗？';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return '每 $minutes 分钟';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return '每 $hours 小时';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes 分钟';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours 小时';
  }

  @override
  String get adminTimeLimitHours => '时间限制（小时）';

  @override
  String get adminTranscodingDecodingFor => '为以下项启用硬件解码';

  @override
  String get adminTranscodingThreadCountHelp =>
      '转码可使用的最大线程数。线程越少，CPU 占用越低，但可能过慢，无法流畅播放。';

  @override
  String get adminTranscodingThreadMax => '最大';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg 路径';

  @override
  String get adminTranscodingFfmpegPathHelp => '服务器运行的 FFmpeg。此项在服务器上设置，而非此处。';

  @override
  String get adminTranscodingAudioSeek => '音频跳转策略';

  @override
  String get adminTranscodingAudioSeekHelp => '在 HLS 串流中跳转时，服务器处理音频的方式。';

  @override
  String get adminTranscodingTrimCopiedAudio => '裁剪复制的音频';

  @override
  String get adminTranscodingTranscodeAudio => '转码音频';

  @override
  String get adminResumeMinAudiobookMinutes => '有声书最短续播时间（分钟）';

  @override
  String get adminResumeMinAudiobookHelp => '在此时间之前停止的有声书视为未播放。';

  @override
  String get adminResumeAudiobookRemaining => '有声书续播的剩余分钟数';

  @override
  String get adminResumeAudiobookRemainingHelp => '剩余时长少于此分钟数时停止的有声书视为已播放。';

  @override
  String get adminBrandingSplashSection => '启动画面';

  @override
  String get adminBrandingSectionWebClient => 'Web 客户端';

  @override
  String get adminBrandingSplashSizeHint =>
      '自定义图片应采用 16x9 宽高比，最小尺寸为 1920x1080。';

  @override
  String get adminNetworkingSectionServerAddress => '服务器地址设置';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS 设置';

  @override
  String get adminNetworkingSectionRemoteAccess => '远程访问设置';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP 协议';

  @override
  String get adminNetworkingSectionDiscovery => '网络发现';

  @override
  String get adminNetworkingSectionFirewall => '防火墙和代理设置';

  @override
  String get adminNetworkingLocalHttpPort => '本地 HTTP 端口号';

  @override
  String get adminNetworkingLocalHttpPortHelp => 'HTTP 服务器的 TCP 端口号。';

  @override
  String get adminNetworkingEnableHttpsHelp => '监听 HTTPS 端口。还需设置有效证书才能生效。';

  @override
  String get adminNetworkingLocalHttpsPort => '本地 HTTPS 端口号';

  @override
  String get adminNetworkingLocalHttpsPortHelp => 'HTTPS 服务器的 TCP 端口号。';

  @override
  String get adminNetworkingBaseUrlHelp =>
      '在服务器 URL 后添加子目录，例如 https://example.com/jellyfin。';

  @override
  String get adminNetworkingBindAddress => '绑定到本地网络地址';

  @override
  String get adminNetworkingBindAddressHelp =>
      '覆盖 HTTP 服务器的本地 IP 地址。留空则绑定到所有地址。更改后需重启。';

  @override
  String get adminNetworkingLanNetworksHelp =>
      '视为本地网络的 IP 地址或 IP/网络掩码条目，用于带宽和远程访问限制。留空则将所有 RFC1918 地址视为本地地址。';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      '位于此服务器前端的代理的 IP 地址或主机名。用于读取 X-Forwarded-For 标头。更改后需重启。';

  @override
  String get adminNetworkingCustomCertPath => '自定义 SSL 证书路径';

  @override
  String get adminNetworkingCertPathHelp =>
      '包含证书和私钥的 PKCS #12 文件路径，用于自定义域名的 TLS。';

  @override
  String get adminNetworkingCertPasswordHelp => '如果证书需要密码，请输入密码。';

  @override
  String get adminNetworkingAllowRemote => '允许远程连接到此服务器';

  @override
  String get adminNetworkingAllowRemoteHelp => '关闭后，将阻止所有远程连接。';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      '远程网络的 IP 地址或 IP/网络掩码条目。留空则允许所有远程地址。';

  @override
  String get adminNetworkingRemoteIpFilterMode => '远程 IP 地址过滤模式';

  @override
  String get adminNetworkingPublicHttpPortHelp => '映射到本地 HTTP 端口的公网端口。';

  @override
  String get adminNetworkingPublicHttpsPortHelp => '映射到本地 HTTPS 端口的公网端口。';

  @override
  String get adminNetworkingAutoDiscoveryLabel => '启用自动发现';

  @override
  String get adminNetworkingAutoDiscoveryHelp => '让应用通过 UDP 端口 7359 发现此服务器。';

  @override
  String get adminNetworkingSamePublishedUri => '内部和外部访问使用相同的已发布服务器 URI';

  @override
  String get adminNetworkingPublishedUri => '已发布的服务器 URI';

  @override
  String get adminNetworkingPublishedUriHelp => '根据接口或客户端 IP 地址覆盖服务器对外提供的 URI。';

  @override
  String get adminNetworkingInternalUri => '内部 URI';

  @override
  String get adminNetworkingInternalUriHelp => '用于内部访问的已发布服务器 URI。';

  @override
  String get adminNetworkingExternalUri => '外部 URI';

  @override
  String get adminNetworkingExternalUriHelp => '用于外部访问的已发布服务器 URI。';

  @override
  String get adminNetworkingOtherPublishedUris => '其他已发布的 URI';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      '针对某个子网或接口的 URI，格式为 subnet=URI。';

  @override
  String get adminBackupsHelp => '创建并还原服务器快照。快照可包含数据库、元数据、字幕和 Trickplay 图片。';

  @override
  String get adminBackupDisclaimer => '根据媒体库的大小，备份可能需要一段时间。';

  @override
  String get adminBackupTasksWarningTitle => '计划任务正在运行';

  @override
  String get adminBackupTasksWarning => '创建备份前，请先停止这些任务或等待其完成。';

  @override
  String get adminBackupArchiveNotFound => '服务器找不到此备份存档。';

  @override
  String get adminRestoreInProgress => '正在还原';

  @override
  String get adminRestoreWaitingForServer => '正在等待服务器恢复。';

  @override
  String get adminRestoreSucceeded => '还原完成';

  @override
  String get adminLogWatch => '观看';

  @override
  String get adminLogStopWatching => '停止观看';

  @override
  String get adminPluginInstallConfirmTitle => '确认安装插件';

  @override
  String get adminPluginInstallDisclaimer =>
      '安装第三方插件存在风险。插件可能包含不稳定或恶意代码，且随时可能发生变化。请仅安装来自你信任的作者的插件，并了解其功能，例如查询外部服务、拖慢媒体库扫描或添加后台任务。';

  @override
  String get adminGroupOverview => '简介';

  @override
  String get adminGroupLibrary => '媒体库';

  @override
  String get adminGroupPlayback => '播放';

  @override
  String get adminGroupPeople => '人物';

  @override
  String get adminGroupSystem => '系统';

  @override
  String get adminAreasLabel => '管理区域';

  @override
  String get adminPagesLabel => '页面';

  @override
  String get adminPageDescDashboard => '服务器状态、会话和最近活动';

  @override
  String get adminPageDescAnalytics => '媒体库大小、编解码器和格式';

  @override
  String get adminPageDescActivity => '服务器上发生的所有活动';

  @override
  String get adminPageDescTasks => '扫描、清理及其触发器';

  @override
  String get adminPageDescLibraries => '文件夹、扫描器和元数据获取器';

  @override
  String get adminPageDescDisplay => '媒体库向用户展示的方式';

  @override
  String get adminPageDescMetadata => '默认语言、国家和图片';

  @override
  String get adminPageDescNfo => 'Kodi NFO 的读取和保存';

  @override
  String get adminPageDescLiveTv => '调谐器、节目指南数据和录制内容';

  @override
  String get adminPageDescTranscoding => '硬件加速、编码器和色调映射';

  @override
  String get adminPageDescResume => '媒体项何时视为已开始或已播放';

  @override
  String get adminPageDescStreaming => '远程码率限制';

  @override
  String get adminPageDescTrickplay => '拖动进度时的预览缩略图';

  @override
  String get adminPageDescUsers => '账户、访问和家长控制';

  @override
  String get adminPageDescDevices => '已登录的设备及其名称';

  @override
  String get adminPageDescApiKeys => '供应用和脚本使用的密钥';

  @override
  String get adminPageDescSettings => '服务器名称、语言、路径和性能';

  @override
  String get adminPageDescBranding => '登录消息、自定义 CSS 和启动画面';

  @override
  String get adminPageDescNetworking => '端口、HTTPS、局域网和远程访问';

  @override
  String get adminPageDescPlugins => '已安装的插件和插件目录';

  @override
  String get adminPageDescRepositories => '插件来源';

  @override
  String get adminPageDescBackups => '创建和还原服务器备份';

  @override
  String get adminPageDescLogs => '服务器日志文件';

  @override
  String adminSearchSettingsHint(int count) {
    return '搜索 $count 项设置';
  }

  @override
  String get adminSearchNoResults => '没有匹配的设置';

  @override
  String get adminSearchClear => '清除搜索';

  @override
  String get adminUnsavedChanges => '未保存的更改';

  @override
  String get adminDiscard => '放弃更改';

  @override
  String get adminLeaveTitle => '放弃未保存的更改？';

  @override
  String get adminLeaveMessage => '此页面上的更改尚未保存。';

  @override
  String get adminKeepEditing => '继续编辑';

  @override
  String get adminDashboardLoadFailed => '无法加载仪表板';

  @override
  String get adminMediaOverview => '媒体概览';

  @override
  String get adminMediaTotalsError => '无法加载服务器媒体总数。';

  @override
  String get adminMediaOverviewSubtitle => '快速了解此服务器上的内容规模。';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return '插件可用更新：$count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return '需要重启的插件：$count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return '失败的计划任务：$count';
  }

  @override
  String get analyticsMediaDistribution => '媒体分布';

  @override
  String get analyticsVideoCodecs => '视频编解码器';

  @override
  String get analyticsAudioCodecs => '音频编解码器';

  @override
  String get analyticsContainers => '封装格式';

  @override
  String get analyticsTopGenres => '热门类型';

  @override
  String get analyticsReleaseYears => '发布年份';

  @override
  String get analyticsContentRatings => '内容分级';

  @override
  String get analyticsRuntimeBuckets => '时长分组';

  @override
  String get analyticsFileFormats => '文件格式';

  @override
  String get analyticsNoData => '暂无数据。';

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
  String get adminLibraryScanStarted => '媒体库扫描已开始';

  @override
  String errorGeneric(String error) {
    return '错误：$error';
  }

  @override
  String get adminServerRebootInProgress => '服务器正在重启';

  @override
  String get adminServerRebootMessage => '服务器正在重启，请重启 Moonfin';

  @override
  String get adminActiveSessions => '活跃会话';

  @override
  String get adminSessionsLoadFailed => '无法加载会话';

  @override
  String get adminNoActiveSessions => '暂无活跃会话';

  @override
  String get adminRecentActivity => '最近的活动';

  @override
  String get adminNoRecentActivity => '暂无最近活动';

  @override
  String adminCommandFailed(String error) {
    return '命令失败：$error';
  }

  @override
  String get adminSendMessage => '发送消息';

  @override
  String get adminMessageTextHint => '消息内容';

  @override
  String get adminSetVolume => '设置音量';

  @override
  String get sessionPrev => '上一项';

  @override
  String get sessionRewind => '快退';

  @override
  String get sessionForward => '快进';

  @override
  String get sessionNext => '下一个';

  @override
  String get sessionVolumeDown => '音量 -';

  @override
  String get sessionVolumeUp => '音量 +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => '正在播放';

  @override
  String get volume => '音量';

  @override
  String get actions => '操作';

  @override
  String get videoCodec => '视频编解码器';

  @override
  String get audioCodec => '音频编解码器';

  @override
  String get hwAccel => '硬件加速';

  @override
  String get completion => '完成度';

  @override
  String get adminClearDates => '清除日期';

  @override
  String get adminActivitySeverityAll => '所有级别';

  @override
  String get adminActivityDateRange => '日期范围';

  @override
  String adminActivityLoadFailed(String error) {
    return '无法加载活动日志：$error';
  }

  @override
  String get adminNoActivityEntries => '暂无活动条目';

  @override
  String get adminEditDeviceName => '编辑设备名称';

  @override
  String get adminCustomName => '自定义名称';

  @override
  String get adminDeviceNameUpdated => '设备名称已更新';

  @override
  String adminDeviceUpdateFailed(String error) {
    return '更新设备失败：$error';
  }

  @override
  String get adminDeleteDevice => '删除设备';

  @override
  String get adminDeviceDeleted => '设备已删除';

  @override
  String adminDeviceDeleteFailed(String error) {
    return '删除设备失败：$error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '移除设备 \"$name\"？该用户需要在此设备上重新登录。';
  }

  @override
  String get adminDeleteAllDevices => '删除所有设备';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '移除 $count 个设备？受影响的用户需要重新登录。当前设备不受影响。';
  }

  @override
  String get adminDevicesDeletedAll => '设备已移除';

  @override
  String adminDevicesDeletedPartial(int count) {
    return '已移除部分设备；$count 个无法移除。';
  }

  @override
  String get adminDevicesLoadFailed => '加载设备失败';

  @override
  String get adminSearchDevices => '搜索设备';

  @override
  String get adminThisDevice => '本设备';

  @override
  String get adminEditName => '编辑名称';

  @override
  String get adminLibrariesLoadFailed => '加载媒体库失败';

  @override
  String get adminNoLibraries => '未配置媒体库';

  @override
  String get adminScanAllLibraries => '扫描所有媒体库';

  @override
  String get adminAddLibrary => '添加媒体库';

  @override
  String adminScanFailed(String error) {
    return '启动扫描失败：$error';
  }

  @override
  String get adminRenameLibrary => '重命名媒体库';

  @override
  String get adminNewName => '新名称';

  @override
  String adminLibraryRenamed(String name) {
    return '媒体库重命名为“$name”';
  }

  @override
  String adminRenameFailed(String error) {
    return '重命名失败：$error';
  }

  @override
  String get adminDeleteLibrary => '删除媒体库';

  @override
  String adminLibraryDeleted(String name) {
    return '媒体库“$name”已删除';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return '删除媒体库失败：$error';
  }

  @override
  String adminAddPathFailed(String error) {
    return '添加路径失败：$error';
  }

  @override
  String get adminRemovePath => '移除路径';

  @override
  String adminRemovePathConfirm(String path) {
    return '从此媒体库中移除“$path”吗？';
  }

  @override
  String adminRemovePathFailed(String error) {
    return '无法移除路径：$error';
  }

  @override
  String get adminLibraryLoadFailed => '加载媒体库失败';

  @override
  String get adminNoMediaPaths => '未配置媒体路径';

  @override
  String get adminAddPath => '添加路径';

  @override
  String get adminBrowseFilesystem => '浏览服务器文件系统：';

  @override
  String get adminPreferredMetadataLanguage => '首选元数据语言';

  @override
  String get adminMetadataLanguageHint => '例如 en、de、fr';

  @override
  String get adminMetadataCountryCode => '元数据国家代码';

  @override
  String get adminMetadataCountryHint => '例如 US、DE、FR';

  @override
  String get adminLibraryTabPaths => '路径';

  @override
  String get adminLibraryTabOptions => '选项';

  @override
  String get adminLibraryTabDownloaders => '下载器';

  @override
  String get adminLibMetadataSavers => '元数据保存器';

  @override
  String get adminLibSubtitleDownloaders => '字幕下载器';

  @override
  String get adminLibLyricDownloaders => '歌词下载器';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return '元数据下载器：$type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return '图片获取器：$type';
  }

  @override
  String get adminLibNoDownloaders => '此服务器未为此媒体库类型公开下载器。';

  @override
  String get adminLibrarySectionGeneral => '常规';

  @override
  String get adminLibrarySectionMetadata => '元数据';

  @override
  String get adminLibrarySectionEmbedded => '内嵌信息';

  @override
  String get adminLibrarySectionSubtitles => '字幕';

  @override
  String get adminLibrarySectionImages => '图片';

  @override
  String get adminLibrarySectionSeries => '剧集';

  @override
  String get adminLibrarySectionMusic => '音乐';

  @override
  String get adminLibrarySectionMovies => '电影';

  @override
  String get adminLibRealtimeMonitor => '启用实时监控';

  @override
  String get adminLibRealtimeMonitorHint => '检测文件更改并自动处理。';

  @override
  String get adminLibEnablePhotos => '显示照片';

  @override
  String get adminLibSaveLocalMetadata => '将封面保存到媒体文件夹';

  @override
  String get adminLibRefreshInterval => '自动元数据刷新';

  @override
  String get adminLibRefreshNever => '从不';

  @override
  String get adminLibDefault => '默认';

  @override
  String get adminLibDisplayTitle => '显示';

  @override
  String get adminLibDisplaySection => '媒体库显示';

  @override
  String get adminLibFolderView => '显示文件夹视图以展示纯媒体文件夹';

  @override
  String get adminLibSpecialsInSeasons => '在播出季中显示特别篇';

  @override
  String get adminLibGroupMovies => '将电影分组到合集中';

  @override
  String get adminLibGroupShows => '将剧集分组到合集中';

  @override
  String get adminLibExternalSuggestions => '在建议中显示外部内容';

  @override
  String get adminLibDateAddedSection => '日期添加行为';

  @override
  String get adminLibDateAddedLabel => '使用日期添加自';

  @override
  String get adminLibDateAddedImport => '扫描进媒体库的日期';

  @override
  String get adminLibDateAddedFile => '文件创建日期';

  @override
  String get adminLibMetadataTitle => '元数据和图片';

  @override
  String get adminLibMetadataLangSection => '首选元数据语言';

  @override
  String get adminLibChaptersSection => '章节';

  @override
  String get adminLibDummyChapterDuration => '虚拟章节时长（秒）';

  @override
  String get adminLibDummyChapterDurationHint => '为没有章节的媒体生成的章节长度。设为0以禁用。';

  @override
  String get adminLibChapterImageResolution => '章节图片分辨率';

  @override
  String get adminLibNfoTitle => 'NFO 设置';

  @override
  String get adminLibNfoHelp => 'NFO 元数据与 Kodi 和类似客户端兼容。设置适用于所有保存 NFO 元数据的媒体库。';

  @override
  String get adminLibKodiUser => '在 NFO 文件中存储观看数据的用户';

  @override
  String get adminLibSaveImagePaths => '在 NFO 文件中保存图片路径';

  @override
  String get adminLibPathSubstitution => '启用 NFO 图片路径的路径替换';

  @override
  String get adminLibExtraThumbs => '将 extrafanart 图片复制到 extrathumbs 文件夹';

  @override
  String get adminLibNone => '无';

  @override
  String adminLibRefreshDays(int days) {
    return '$days 天';
  }

  @override
  String get adminLibEmbeddedTitles => '使用内嵌标题';

  @override
  String get adminLibEmbeddedExtrasTitles => '使用内嵌标题作为额外内容标题';

  @override
  String get adminLibEmbeddedEpisodeInfos => '使用内嵌剧集信息';

  @override
  String get adminLibAllowEmbeddedSubtitles => '允许内嵌字幕';

  @override
  String get adminLibEmbeddedAllowAll => '允许全部';

  @override
  String get adminLibEmbeddedAllowText => '仅文本';

  @override
  String get adminLibEmbeddedAllowImage => '仅图片';

  @override
  String get adminLibEmbeddedAllowNone => '无';

  @override
  String get adminLibSkipIfEmbeddedSubs => '如果存在内嵌字幕则跳过下载';

  @override
  String get adminLibSkipIfAudioMatches => '如果音轨与下载语言匹配则跳过下载';

  @override
  String get adminLibRequirePerfectMatch => '要求完美字幕匹配';

  @override
  String get adminLibSaveSubtitlesWithMedia => '将字幕保存到媒体文件夹';

  @override
  String get adminLibChapterImageExtraction => '提取章节图片';

  @override
  String get adminLibChapterImagesDuringScan => '在媒体库扫描期间提取章节图片';

  @override
  String get adminLibTrickplayExtraction => '启用 trickplay 图片提取';

  @override
  String get adminLibTrickplayDuringScan => '在媒体库扫描期间提取 trickplay 图片';

  @override
  String get adminLibSaveTrickplayWithMedia => '将 trickplay 图片保存到媒体文件夹';

  @override
  String get adminLibAutomaticSeriesGrouping => '自动合并分布在多个文件夹中的剧集';

  @override
  String get adminLibSeasonZeroName => '第零季显示名称';

  @override
  String get adminLibLufsScan => '启用 LUFS 扫描进行音频归一化';

  @override
  String get adminLibPreferNonstandardArtist => '首选非标准艺人标签';

  @override
  String get adminLibAutoAddToCollection => '自动将电影添加到合集';

  @override
  String get adminLibraryNameRequired => '必须填写媒体库名称';

  @override
  String adminLibraryCreateFailed(String error) {
    return '创建媒体库失败：$error';
  }

  @override
  String get adminLibraryName => '媒体库名称';

  @override
  String get adminSelectedPaths => '选定的路径：';

  @override
  String get adminCreateLibrary => '创建媒体库';

  @override
  String get paths => '路径：';

  @override
  String get adminDisableUser => '禁用用户';

  @override
  String get adminEnableUser => '启用用户';

  @override
  String adminDisableUserConfirm(String name) {
    return '禁用 $name？该用户将无法登录。';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '启用 $name？该用户将可以再次登录。';
  }

  @override
  String adminUserDisabled(String name) {
    return '用户“$name”已禁用';
  }

  @override
  String adminUserEnabled(String name) {
    return '用户“$name”已启用';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return '无法更新用户策略：$error';
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
    return '创建用户失败：$error';
  }

  @override
  String get adminCreateUser => '创建用户';

  @override
  String get adminPasswordOptional => '密码（可选）';

  @override
  String get adminUsernameRequired => '用户名不能为空';

  @override
  String adminSaveFailed(String error) {
    return '保存失败：$error';
  }

  @override
  String get adminPasswordsMismatch => '密码不匹配';

  @override
  String adminFailed(String error) {
    return '失败：$error';
  }

  @override
  String get adminUserLoadFailed => '加载用户失败';

  @override
  String get adminDeleteUser => '删除用户';

  @override
  String get admin => '管理员';

  @override
  String get adminFullAccessWarning => '管理员拥有服务器的完整访问权限。请谨慎授予。';

  @override
  String get administrator => '管理员';

  @override
  String get adminHiddenUser => '隐藏用户';

  @override
  String get adminAllowMediaPlayback => '允许媒体播放';

  @override
  String get adminAllowAudioTranscoding => '允许音频转码';

  @override
  String get adminAllowVideoTranscoding => '允许视频转码';

  @override
  String get adminAllowRemuxing => '允许重新封装';

  @override
  String get adminForceRemoteTranscoding => '强制远程源转码';

  @override
  String get adminAllowContentDownloading => '允许内容下载';

  @override
  String get adminAllowPublicSharing => '允许公开共享';

  @override
  String get adminAllowRemoteControl => '允许远程控制其他用户';

  @override
  String get adminAllowSharedDeviceControl => '允许控制共享设备';

  @override
  String get adminAllowRemoteAccess => '允许远程访问';

  @override
  String get adminLeaveEmptyNoLimit => '留空则无限制';

  @override
  String get adminMaxActiveSessions => '最大活跃会话数';

  @override
  String get adminAllowLiveTvAccess => '允许访问直播电视';

  @override
  String get adminAllowLiveTvManagement => '允许直播电视管理';

  @override
  String get adminAllowCollectionManagement => '允许合集管理';

  @override
  String get adminAllowSubtitleManagement => '允许字幕管理';

  @override
  String get adminAllowLyricManagement => '允许歌词管理';

  @override
  String get adminEnableAllLibraryAccess => '允许访问所有媒体库';

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
  String get adminLibraryAccess => '媒体库访问';

  @override
  String get adminEnableAllDevices => '允许访问所有设备';

  @override
  String get adminEnableAllChannels => '允许访问所有频道';

  @override
  String get adminParentalControl => '家长控制';

  @override
  String get adminMaxParentalRating => '最大允许的家长评级';

  @override
  String get adminMaxParentalRatingHint => '评级较高的内容将对该用户隐藏。';

  @override
  String get adminParentalRatingNone => '无';

  @override
  String get adminBlockUnratedItems => '阻止无评级或评级信息无法识别的内容';

  @override
  String get adminUnratedBook => '图书';

  @override
  String get adminUnratedChannelContent => '频道';

  @override
  String get adminUnratedLiveTvChannel => '直播电视';

  @override
  String get adminUnratedMovie => '电影';

  @override
  String get adminUnratedMusic => '音乐';

  @override
  String get adminUnratedTrailer => '预告片';

  @override
  String get adminUnratedSeries => '剧集';

  @override
  String get adminAccessSchedules => '访问时间表';

  @override
  String get adminAccessSchedulesHint => '仅允许在下方计划的时间段内访问。未设置时间表时，全天允许访问。';

  @override
  String get adminAddSchedule => '添加时间表';

  @override
  String get adminScheduleDay => '天';

  @override
  String get adminScheduleStart => '开始';

  @override
  String get adminScheduleEnd => '结束';

  @override
  String get adminDayEveryday => '每天';

  @override
  String get adminDayWeekday => '工作日';

  @override
  String get adminDayWeekend => '周末';

  @override
  String get adminDaySunday => '周日';

  @override
  String get adminDayMonday => '周一';

  @override
  String get adminDayTuesday => '周二';

  @override
  String get adminDayWednesday => '周三';

  @override
  String get adminDayThursday => '周四';

  @override
  String get adminDayFriday => '周五';

  @override
  String get adminDaySaturday => '周六';

  @override
  String get adminAllowedTags => '允许的标签';

  @override
  String get adminAllowedTagsHint => '仅显示带有这些标签的内容。留空则允许全部。';

  @override
  String get adminBlockedTags => '阻止的标签';

  @override
  String get adminBlockedTagsHint => '带有这些标签的内容对该用户隐藏。';

  @override
  String get adminAddTag => '添加标签';

  @override
  String get adminAuthProvider => '认证提供商';

  @override
  String get adminPasswordResetProvider => '密码重置提供商';

  @override
  String get adminLoginAttemptsBeforeLockout => '锁定前的最大失败登录尝试次数';

  @override
  String get adminLoginAttemptsHint => '设为0使用默认值，或设为-1禁用锁定。';

  @override
  String get adminSyncPlayAccess => 'SyncPlay 访问权限';

  @override
  String get adminSyncPlayCreateAndJoin => '允许创建和加入群组';

  @override
  String get adminSyncPlayJoin => '允许加入群组';

  @override
  String get adminSyncPlayNone => '无访问权限';

  @override
  String get adminContentDeletionFolders => '允许从以下位置删除内容';

  @override
  String get adminResetPasswordWarning => '这将删除密码。用户无需密码即可登录。';

  @override
  String adminServerReturnedHttp(int status) {
    return '服务器返回 HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '确定要删除 $name 吗？';
  }

  @override
  String adminUserDeleted(String name) {
    return '用户“$name”已删除';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return '删除用户失败：$error';
  }

  @override
  String get adminCreateApiKey => '创建 API 密钥';

  @override
  String get adminAppName => '应用名称';

  @override
  String get adminApiKeyCreated => 'API 密钥已创建';

  @override
  String get adminApiKeyCreatedNoToken => '密钥创建成功。服务器未返回令牌。请检查服务器 API 密钥。';

  @override
  String get adminKeyCopied => '密钥已复制到剪贴板';

  @override
  String adminApiKeyCreateFailed(String error) {
    return '无法创建密钥：$error';
  }

  @override
  String get adminKeyTokenMissing => '服务器响应中缺少密钥令牌';

  @override
  String get adminRevokeApiKey => '撤销 API 密钥';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '撤销 $name 的密钥吗？';
  }

  @override
  String get adminApiKeyRevoked => 'API 密钥已撤销';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return '无法撤销密钥：$error';
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
  String get adminUnknownApp => '未知应用';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return '令牌：$token\\n创建时间：$created';
  }

  @override
  String get adminBackupOptionsTitle => '创建备份';

  @override
  String get adminBackupDatabase => '数据库';

  @override
  String get adminBackupDatabaseAlways => '始终包含';

  @override
  String get adminBackupMetadata => '元数据';

  @override
  String get adminBackupSubtitles => '字幕';

  @override
  String get adminBackupTrickplay => 'Trickplay 图片';

  @override
  String get adminCreatingBackup => '正在创建备份...';

  @override
  String get adminBackupCreated => '备份创建成功';

  @override
  String adminBackupCreateFailed(String error) {
    return '创建备份失败：$error';
  }

  @override
  String get adminBackupPathMissing => '服务器响应中缺少备份路径';

  @override
  String adminBackupManifest(String name) {
    return '清单：$name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return '无法加载清单：$error';
  }

  @override
  String get adminConfirmRestore => '确认恢复';

  @override
  String get adminRestoringBackup => '正在恢复备份...';

  @override
  String adminRestoreFailed(String error) {
    return '恢复备份失败：$error';
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
    return '已保存到 $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return '保存文件失败：$error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '无法加载 $fileName';
  }

  @override
  String get adminSearchInLog => '在日志中搜索';

  @override
  String get adminNoMatchingLines => '无匹配行';

  @override
  String adminTasksLoadFailed(String error) {
    return '加载任务失败：$error';
  }

  @override
  String get adminNoScheduledTasks => '未找到计划任务';

  @override
  String get adminNoTasksMatchFilter => '没有任务符合当前筛选条件';

  @override
  String adminTaskStartFailed(String error) {
    return '启动任务失败：$error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return '无法停止任务：$error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return '加载任务失败：$error';
  }

  @override
  String get adminRunNow => '立即运行';

  @override
  String adminTriggerRemoveFailed(String error) {
    return '无法移除触发器：$error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return '添加触发器失败：$error';
  }

  @override
  String get adminLastExecution => '上次执行';

  @override
  String get adminTriggers => '触发器';

  @override
  String get adminAddTrigger => '添加触发器';

  @override
  String get adminNoTriggers => '未配置触发器';

  @override
  String get adminTriggerType => '触发类型';

  @override
  String get adminNoLimit => '无限制';

  @override
  String adminHours(String hours) {
    return '$hours 小时';
  }

  @override
  String get adminDayOfWeek => '星期几';

  @override
  String get adminSearchPlugins => '搜索插件...';

  @override
  String adminPluginToggleFailed(String error) {
    return '无法切换插件：$error';
  }

  @override
  String get adminUninstallPlugin => '卸载插件';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '确定要卸载“$name”吗？';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return '插件卸载失败：$error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return '安装软件包失败：$error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return '无法安装更新：$error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return '加载插件失败：$error';
  }

  @override
  String get adminNoPluginsMatchSearch => '未找到符合搜索条件的插件';

  @override
  String get adminNoPluginsInstalled => '未安装插件';

  @override
  String adminInstallUpdate(String version) {
    return '安装更新（v$version）';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return '无法加载目录：$error';
  }

  @override
  String get adminNoPackagesMatchSearch => '未找到符合搜索条件的软件包';

  @override
  String get adminNoPackagesAvailable => '没有可用的软件包';

  @override
  String get adminExperimentalIntegration => '实验性集成';

  @override
  String get adminExperimentalWarning => '插件设置集成仍是实验功能，部分设置页面可能显示不正常。';

  @override
  String get continueAction => '继续';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '服务器重启后将移除“$name”';
  }

  @override
  String adminUninstallFailed(String error) {
    return '卸载失败：$error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '正在将“$name”更新为 v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return '无法加载插件：$error';
  }

  @override
  String get adminPluginNotFound => '找不到插件';

  @override
  String adminPluginVersion(String version) {
    return '版本 $version';
  }

  @override
  String get adminEnablePlugin => '启用插件';

  @override
  String get adminPluginSettingsPage => '插件设置页面';

  @override
  String get adminRevisionHistory => '修订历史';

  @override
  String get adminNoChangelog => '暂无变更日志。';

  @override
  String get adminRemoveRepository => '移除仓库';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return '确定要移除“$name”吗？';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return '无法保存仓库：$error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return '无法加载仓库：$error';
  }

  @override
  String get adminRepositoryNameHint => '例如 Jellyfin Stable';

  @override
  String get adminRepositoryUrl => '仓库 URL';

  @override
  String get adminAddEntry => '添加条目';

  @override
  String get adminInvalidUrl => '无效 URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return '无法加载插件设置：$error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '无法打开 $uri';
  }

  @override
  String get adminOpenInBrowser => '在浏览器中打开';

  @override
  String get adminOpenExternally => '用外部应用打开';

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
  String get adminLibraryScanConcurrency => '媒体库扫描并发数';

  @override
  String get adminParallelImageEncodingLimit => '并行图片编码限制';

  @override
  String get adminSlowResponseThreshold => '慢响应阈值（毫秒）';

  @override
  String get adminBrandingLoadFailed => '无法加载品牌设置';

  @override
  String get adminLoginDisclaimer => '登录免责声明';

  @override
  String get adminLoginDisclaimerHint => 'HTML 显示在登录表单下方';

  @override
  String get adminCustomCss => '自定义 CSS';

  @override
  String get adminCustomCssHint => '应用于 Web 界面的自定义 CSS';

  @override
  String get adminEnableSplashScreen => '启用启动画面';

  @override
  String get adminStreamingLoadFailed => '无法加载串流设置';

  @override
  String get adminStreamingDescription => '设置远程连接的全局串流码率限制。';

  @override
  String get adminRemoteBitrateLimitMbps => '远程客户端码率限制（Mbps）';

  @override
  String get adminLeaveEmptyForUnlimited => '留空或 0 表示无限制';

  @override
  String get adminPlaybackLoadFailed => '无法加载播放设置';

  @override
  String get adminHardwareAcceleration => '硬件加速';

  @override
  String get adminVaapiDevice => 'VA-API 设备';

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
  String get adminEnableFallbackFont => '启用备用字体';

  @override
  String get adminFallbackFontPath => '备用字体路径';

  @override
  String get adminAllowSegmentDeletion => '允许删除分段';

  @override
  String get adminSegmentKeepSeconds => '分段保留时间（秒）';

  @override
  String get adminThrottleBuffering => '启用缓冲节流';

  @override
  String get adminTrickplayLoadFailed => '加载 Trickplay 设置失败';

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
  String get adminImageSettings => '图片设置';

  @override
  String get adminIntervalMs => '间隔（毫秒）';

  @override
  String get adminCaptureFrameSubtitle => '捕获帧的频率';

  @override
  String get adminWidthResolutions => '宽度分辨率';

  @override
  String get adminTileWidth => '拼图宽度';

  @override
  String get adminTileHeight => '拼图高度';

  @override
  String get adminQualitySubtitle => '数值越低，质量越高、文件越大';

  @override
  String get adminProcessThreads => '处理线程';

  @override
  String get adminResumeLoadFailed => '无法加载播放进度设置';

  @override
  String get adminResumeDescription => '设置内容在什么时候保存播放进度，以及什么时候标记为已看完。';

  @override
  String get adminMinResumePercentage => '保存进度的最低百分比';

  @override
  String get adminMinResumeSubtitle => '播放超过这个百分比后才会保存进度';

  @override
  String get adminMaxResumePercentage => '标记已看完的百分比';

  @override
  String get adminMaxResumeSubtitle => '播放超过这个百分比后会被视为已看完';

  @override
  String get adminMinResumeDuration => '可保存进度的最短时长（秒）';

  @override
  String get adminMinResumeDurationSubtitle => '短于此时长的内容不会保存播放进度';

  @override
  String get adminMinAudiobookResume => '有声书保存进度的最低百分比';

  @override
  String get adminMaxAudiobookResume => '有声书标记已听完的百分比';

  @override
  String get adminNetworkingLoadFailed => '无法加载网络设置';

  @override
  String get adminNetworkingWarning => '更改网络设置可能需要重启服务器。';

  @override
  String get adminEnableRemoteAccess => '启用远程访问';

  @override
  String get ports => '端口';

  @override
  String get adminHttpPort => 'HTTP 端口';

  @override
  String get adminHttpsPort => 'HTTPS 端口';

  @override
  String get adminPublicHttpsPort => '公共 HTTPS 端口';

  @override
  String get adminBaseUrl => '基础 URL';

  @override
  String get adminBaseUrlHint => '例如 /jellyfin';

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
  String get adminRemoteIpFilter => '远程 IP 过滤';

  @override
  String get adminRemoteIpFilterEntries => '远程 IP 过滤器';

  @override
  String get adminCertificatePath => '证书路径';

  @override
  String get whitelist => '白名单';

  @override
  String get blacklist => '黑名单';

  @override
  String get notSet => '未设置';

  @override
  String adminMetadataLoadFailed(String error) {
    return '无法加载元数据：$error';
  }

  @override
  String get adminRefreshMetadata => '刷新元数据';

  @override
  String get recursive => '递归';

  @override
  String get adminReplaceAllMetadata => '替换所有元数据';

  @override
  String get adminMetadataRefreshRequested => '已请求刷新元数据';

  @override
  String adminMetadataRefreshFailed(String error) {
    return '无法刷新元数据：$error';
  }

  @override
  String get adminNoRemoteMatches => '未找到远程匹配项';

  @override
  String get adminRemoteResults => '远程结果';

  @override
  String get adminRemoteMetadataApplied => '已应用远程元数据';

  @override
  String adminRemoteSearchFailed(String error) {
    return '远程搜索失败：$error';
  }

  @override
  String get adminUpdateContentType => '更新内容类型';

  @override
  String get adminContentType => '内容类型';

  @override
  String get adminContentTypeUpdated => '内容类型已更新';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return '无法更新内容类型：$error';
  }

  @override
  String get adminMetadataEditorLoadFailed => '无法加载元数据编辑器';

  @override
  String get adminNoPeopleEntries => '暂无人员条目';

  @override
  String get adminNoExternalIds => '暂无可用的外部 ID';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType 图片已更新';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return '下载图片失败：$error';
  }

  @override
  String get adminUnsupportedImageFormat => '不支持的图片格式';

  @override
  String get adminImageReadFailed => '无法读取所选图片';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType 图片已上传';
  }

  @override
  String adminImageUploadFailed(String error) {
    return '图片上传失败：$error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '删除 $imageType 图片';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType 图片已删除';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return '删除图片失败：$error';
  }

  @override
  String get adminAllProviders => '所有提供方';

  @override
  String get adminNoRemoteImages => '未找到远程图片';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return '调谐器发现失败：$error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U 直播源调谐器';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun 硬件调谐器';

  @override
  String get adminTunerFileOrUrl => '文件/网络地址';

  @override
  String get adminTunerIpAddress => '调谐器 IP 地址';

  @override
  String get adminTunerFriendlyName => '自定义名称';

  @override
  String get adminTunerUserAgent => 'UA 客户端标识';

  @override
  String get adminTunerCount => '最大并发流数量';

  @override
  String get adminTunerCountHelp => '调谐器同时允许的最大播放流，填 0 代表无限制。';

  @override
  String get adminTunerFallbackBitrate => '备用最大串流码率';

  @override
  String get adminTunerImportFavoritesOnly => '仅导入收藏频道';

  @override
  String get adminTunerAllowHwTranscoding => '启用硬件转码';

  @override
  String get adminTunerAllowFmp4 => '允许 fMP4 封装转码';

  @override
  String get adminTunerAllowStreamSharing => '开启播放流共享';

  @override
  String get adminTunerEnableStreamLooping => '启用直播循环播放';

  @override
  String get adminTunerIgnoreDts => '忽略 DTS 音轨';

  @override
  String get adminTunerReadAtNativeFramerate => '按原始帧率读取源文件';

  @override
  String get adminProviderXmltv => 'XMLTV 节目单';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct 节目源';

  @override
  String get adminXmltvPath => '文件/节目单链接';

  @override
  String get adminXmltvMoviePrefix => '电影分类前缀';

  @override
  String get adminXmltvMovieCategories => '电影分类标签';

  @override
  String get adminXmltvCategoriesHelp => '多分类使用竖线 | 分隔。';

  @override
  String get adminXmltvKidsCategories => '少儿分类标签';

  @override
  String get adminXmltvNewsCategories => '新闻分类标签';

  @override
  String get adminXmltvSportsCategories => '体育分类标签';

  @override
  String get adminSdUsername => '账号';

  @override
  String get adminSdPassword => '密码';

  @override
  String get adminSdCountry => '国家/地区';

  @override
  String get adminSdCountrySelect => '选择地区';

  @override
  String get adminSdPostalCode => '邮政编码';

  @override
  String get adminEnableAllTuners => '启用全部调谐器';

  @override
  String adminTunerRemoveFailed(String error) {
    return '无法移除调谐器：$error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return '无法移除提供方：$error';
  }

  @override
  String get adminSeriesRecordingPath => '剧集录制路径';

  @override
  String get adminMovieRecordingPath => '电影录制路径';

  @override
  String get adminGuideDaysAuto => '自动';

  @override
  String get adminRecordingPostProcessor => '后处理应用程序路径';

  @override
  String get adminRecordingPostProcessorArgs => '后处理器参数';

  @override
  String get adminSaveRecordingNfo => '保存录制 NFO 元数据';

  @override
  String get adminSaveRecordingImages => '保存录制图片';

  @override
  String get adminLiveTvSectionPaths => '录制路径';

  @override
  String get adminLiveTvSectionPostProcessing => '后处理';

  @override
  String adminSettingsSaveFailed(String error) {
    return '保存设置失败：$error';
  }

  @override
  String get adminLiveTvLoadFailed => '无法加载直播电视管理';

  @override
  String get adminTunerDevices => '调谐器设备';

  @override
  String get adminNoTunerHosts => '未配置调谐器主机';

  @override
  String get adminGuideProviders => '节目指南提供方';

  @override
  String get adminGuideRefreshStarted => '节目指南数据刷新已开始';

  @override
  String get adminGuideRefreshUnavailable => '此服务器不支持节目指南刷新任务。';

  @override
  String get adminNoListingProviders => '未配置节目单提供方';

  @override
  String get adminSettingsSaved => '设置已保存';

  @override
  String get adminBackupsNotAvailable => '备份在此服务器版本上不可用。';

  @override
  String get adminRestoreWarning1 => '恢复将用备份数据替换所有当前服务器数据。';

  @override
  String get adminRestoreWarning2 => '当前的服务器设置、用户和库数据将被覆盖。';

  @override
  String get adminRestoreWarning3 => '恢复后服务器将重启。';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '立即恢复备份 $name？';
  }

  @override
  String get adminBackupsTitle => '备份';

  @override
  String get adminUnknownDate => '日期未知';

  @override
  String get adminUnnamedBackup => '未命名备份';

  @override
  String get adminApply => '应用';

  @override
  String get adminLogsTitle => '服务器日志';

  @override
  String get adminLogsNewestFirst => '最新在前';

  @override
  String get adminLogsOldestFirst => '最旧在前';

  @override
  String get adminLogsJustNow => '刚刚';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes 分钟前';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours 小时前';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days 天前';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '无法加载 $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count 个匹配项';
  }

  @override
  String get adminLogViewerNoMatches => '无匹配行';

  @override
  String get adminMetadataEditorTitle => '元数据编辑器';

  @override
  String get adminMetadataIdentify => '识别';

  @override
  String get adminMetadataType => '类型';

  @override
  String get adminMetadataDetails => '详情';

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
  String get adminMetadataFieldProductionYear => '制作年份';

  @override
  String get adminMetadataFieldOfficialRating => '官方分级';

  @override
  String get adminMetadataFieldCommunityRating => '社区评分';

  @override
  String get adminMetadataFieldCriticRating => '影评人评分';

  @override
  String get adminMetadataFieldCustomRating => '自定义分级';

  @override
  String get adminMetadataFieldTagline => '标语';

  @override
  String get adminMetadataFieldOverview => '简介';

  @override
  String get adminMetadataFieldDisplayOrder => '显示顺序';

  @override
  String get adminMetadataDisplayOrderAired => '播出顺序';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate => '首播日期';

  @override
  String get adminMetadataDisplayOrderAbsolute => '绝对顺序';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => '数字';

  @override
  String get adminMetadataDisplayOrderStoryArc => '剧情线';

  @override
  String get adminMetadataDisplayOrderProduction => '制作';

  @override
  String get adminMetadataDisplayOrderTv => '电视';

  @override
  String get adminMetadataDisplayOrderAlternate => '备用';

  @override
  String get adminMetadataDisplayOrderRegional => '地区';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => '备用 DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => '修改日期';

  @override
  String get adminMetadataDisplayOrderSortName => '排序名称';

  @override
  String get adminMetadataDisplayOrderReleaseDate => '发布日期';

  @override
  String get adminMetadataSettings => '元数据设置';

  @override
  String get adminMetadataDownloadLanguage => '首选下载语言';

  @override
  String get adminMetadataCountryRegion => '国家/地区';

  @override
  String get adminMetadataInheritHelp => '保持为默认以从父条目或服务器默认值继承设置。';

  @override
  String get adminMetadataField3DFormat => '3D 格式';

  @override
  String get adminMetadataPersonKindActor => '演员';

  @override
  String get adminMetadataPersonKindDirector => '导演';

  @override
  String get adminMetadataPersonKindComposer => '作曲';

  @override
  String get adminMetadataPersonKindWriter => '编剧';

  @override
  String get adminMetadataPersonKindGuestStar => '客串';

  @override
  String get adminMetadataPersonKindProducer => '制片人';

  @override
  String get adminMetadataPersonKindConductor => '指挥';

  @override
  String get adminMetadataPersonKindLyricist => '作词';

  @override
  String get adminMetadataPersonKindArranger => '编曲';

  @override
  String get adminMetadataPersonKindEngineer => '工程师';

  @override
  String get adminMetadataPersonKindMixer => '混音师';

  @override
  String get adminMetadataPersonKindRemixer => '重混师';

  @override
  String get adminMetadataPersonKindCreator => '创作者';

  @override
  String get adminMetadataPersonKindArtist => '艺术家';

  @override
  String get adminMetadataPersonKindAlbumArtist => '专辑艺术家';

  @override
  String get adminMetadataPersonKindAuthor => '作者';

  @override
  String get adminMetadataPersonKindIllustrator => '插画师';

  @override
  String get adminMetadataPersonKindPenciller => '线稿师';

  @override
  String get adminMetadataPersonKindInker => '描墨师';

  @override
  String get adminMetadataPersonKindColorist => '上色师';

  @override
  String get adminMetadataPersonKindLetterer => '文字师';

  @override
  String get adminMetadataPersonKindCoverArtist => '封面艺术家';

  @override
  String get adminMetadataPersonKindEditor => '编辑';

  @override
  String get adminMetadataPersonKindTranslator => '翻译';

  @override
  String get adminMetadataPersonKindNarrator => '旁白';

  @override
  String get adminMetadataAirDays => '播出日';

  @override
  String get adminMetadataLockItem => '锁定此条目以防止未来的元数据更改';

  @override
  String get adminMetadataEnabledFields => '已启用字段';

  @override
  String get adminMetadataEnabledFieldsHelp => '取消勾选字段以锁定并防止其数据被更改。';

  @override
  String get adminMetadataLockFieldName => '名称';

  @override
  String get adminMetadataLockFieldOverview => '概览';

  @override
  String get adminMetadataLockFieldGenres => '类型';

  @override
  String get adminMetadataLockFieldOfficialRating => '家长分级';

  @override
  String get adminMetadataLockFieldCast => '人物';

  @override
  String get adminMetadataLockFieldProductionLocations => '制作地点';

  @override
  String get adminMetadataLockFieldBirthLocation => '出生地';

  @override
  String get adminMetadataLockFieldRuntime => '时长';

  @override
  String get adminMetadataLockFieldStudios => '工作室';

  @override
  String get adminMetadataLockFieldTags => '标签';

  @override
  String get adminMetadataGenres => '类型';

  @override
  String get adminMetadataTags => '标签';

  @override
  String get adminMetadataStudios => '制片公司';

  @override
  String get adminMetadataPeople => '演职人员';

  @override
  String get adminMetadataAddGenre => '添加类型';

  @override
  String get adminMetadataAddTag => '添加标签';

  @override
  String get adminMetadataAddStudio => '添加制片公司';

  @override
  String get adminMetadataAddPerson => '添加人员';

  @override
  String get adminMetadataEditPerson => '编辑人物';

  @override
  String get adminMetadataRole => '角色';

  @override
  String get adminMetadataImagePrimary => '主图';

  @override
  String get adminMetadataImageBackdrop => '背景图';

  @override
  String get adminMetadataImageLogo => '徽标';

  @override
  String get adminMetadataImageBanner => '横幅';

  @override
  String get adminMetadataImageThumb => '缩略图';

  @override
  String get adminMetadataProvider => '提供方';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType 图片已更新';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType 图片已上传';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType 图片已删除';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return '下载图片失败：$error';
  }

  @override
  String get adminMetadataImageReadFailed => '无法读取所选图片';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return '图片上传失败：$error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '删除 $imageType 图片';
  }

  @override
  String get adminMetadataDeleteImageContent => '这会从媒体项中移除当前图片。';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return '删除图片失败：$error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '选择 $imageType 图片';
  }

  @override
  String get adminMetadataUpload => '上传';

  @override
  String get adminMetadataUpdate => '更新';

  @override
  String get adminMetadataRemoteImage => '远程图片';

  @override
  String get adminPluginsInstalled => '已安装';

  @override
  String get adminPluginsCatalog => '目录';

  @override
  String get adminPluginsActive => '启用中';

  @override
  String get adminPluginsRestart => '重启';

  @override
  String get adminPluginsRestartRequired => '需要重启';

  @override
  String get adminPluginsNoSearchResults => '未找到符合搜索条件的插件';

  @override
  String get adminPluginsNoneInstalled => '未安装插件';

  @override
  String get adminPluginsNoneActive => '没有活动的插件';

  @override
  String get adminPluginsNoneRequireRestart => '没有插件需要重启服务器';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return '可用更新：v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => '可用更新';

  @override
  String get adminPluginsPendingRemoval => '重启后待移除';

  @override
  String get adminPluginsChangesPending => '更改将在重启后生效';

  @override
  String get adminPluginsEnable => '启用';

  @override
  String get adminPluginsDisable => '禁用';

  @override
  String get adminPluginsInstallUpdate => '安装更新';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return '安装更新（v$version）';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '未找到符合搜索条件的软件包';

  @override
  String get adminPluginsCatalogEmpty => '没有可用的软件包';

  @override
  String adminPluginsInstalling(String name) {
    return '正在安装“$name”...';
  }

  @override
  String get adminPluginDetailExperimental => '实验性集成';

  @override
  String get adminPluginDetailExperimentalContent =>
      '插件设置集成仍处于实验阶段。某些字段或布局可能尚未正确呈现。';

  @override
  String get adminPluginDetailToggle404 => '无法切换插件。服务器找不到这个插件版本。请先刷新插件列表，再重试。';

  @override
  String get adminPluginDetailToggleDioError => '无法切换插件。请查看服务器日志了解详情。';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name 设置';
  }

  @override
  String get adminPluginDetailDetails => '详情';

  @override
  String get adminPluginDetailDeveloper => '开发者';

  @override
  String get adminPluginDetailRepository => '仓库';

  @override
  String get adminPluginDetailBundled => '内置';

  @override
  String get adminPluginDetailEnablePlugin => '启用插件';

  @override
  String get adminPluginDetailRestartRequired => '需要重启服务器才能使更改生效。';

  @override
  String get adminPluginDetailRemovalPending => '服务器重启后将移除此插件。';

  @override
  String get adminPluginDetailMalfunctioned => '该插件出现故障，可能无法正常工作。';

  @override
  String get adminPluginDetailNotSupported => '当前服务器版本不支持此插件。';

  @override
  String get adminPluginDetailSuperseded => '该插件已被新版本取代。';

  @override
  String adminReposLoadFailed(String error) {
    return '无法加载仓库：$error';
  }

  @override
  String get adminReposRemoveTitle => '移除仓库';

  @override
  String adminReposRemoveConfirm(String name) {
    return '确定要移除“$name”吗？';
  }

  @override
  String get adminReposRemove => '移除';

  @override
  String adminReposSaveFailed(String error) {
    return '无法保存仓库：$error';
  }

  @override
  String get adminReposEmpty => '未配置仓库';

  @override
  String get adminReposEmptySubtitle => '添加仓库以浏览可用插件';

  @override
  String get adminReposUnnamed => '（未命名）';

  @override
  String get adminReposEditTitle => '编辑仓库';

  @override
  String get adminReposAddTitle => '添加仓库';

  @override
  String get adminReposUrl => '仓库 URL';

  @override
  String get adminReposNameHint => '例如 Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => '无效 URL';

  @override
  String get adminGeneralSettingsTitle => '常规设置';

  @override
  String get adminGeneralMetadataLanguage => '首选元数据语言';

  @override
  String get adminGeneralMetadataLanguageHint => '例如 en、de、fr';

  @override
  String get adminGeneralMetadataCountry => '首选元数据国家/地区';

  @override
  String get adminGeneralMetadataCountryHint => '例如 US、DE、FR';

  @override
  String get adminGeneralLibraryScanConcurrency => '媒体库扫描并发数';

  @override
  String get adminGeneralImageEncodingLimit => '并行图片编码限制';

  @override
  String get adminUnknownError => '未知错误';

  @override
  String get adminBrowse => '浏览';

  @override
  String get adminCloseBrowser => '关闭浏览器';

  @override
  String get adminNetworkingTitle => '网络';

  @override
  String get adminNetworkingRestartWarning => '更改网络设置可能需要重启服务器。';

  @override
  String get adminNetworkingEnableHttps => '启用 HTTPS';

  @override
  String get adminNetworkingAddressHint => '例如 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => '已知代理';

  @override
  String get adminNetworkingProxyHint => '例如 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => '白名单';

  @override
  String get adminNetworkingBlacklist => '黑名单';

  @override
  String get adminNetworkingAddEntry => '添加条目';

  @override
  String get adminBrandingTitle => '品牌';

  @override
  String get adminBrandingLoginDisclaimer => '登录免责声明';

  @override
  String get adminBrandingLoginDisclaimerHint => 'HTML 显示在登录表单下方';

  @override
  String get adminBrandingCustomCss => '自定义 CSS';

  @override
  String get adminBrandingCustomCssHint => '应用于 Web 界面的自定义 CSS';

  @override
  String get adminBrandingEnableSplash => '启用启动画面';

  @override
  String get adminBrandingSplashUpload => '上传图片';

  @override
  String get adminBrandingSplashUploaded => '启动画面已更新';

  @override
  String get adminBrandingSplashUploadFailed => '上传启动画面失败';

  @override
  String get adminBrandingSplashDeleted => '启动画面已移除';

  @override
  String get adminBrandingNoSplash => '无自定义启动画面';

  @override
  String get adminPlaybackHwAccel => '硬件加速';

  @override
  String get adminPlaybackHwAccelLabel => '硬件加速';

  @override
  String get adminPlaybackEnableHwEncoding => '启用硬件编码';

  @override
  String get adminPlaybackQsvDevice => 'QSV 设备';

  @override
  String get adminPlaybackEnhancedNvdec => '启用增强型 NVDEC 解码器';

  @override
  String get adminPlaybackPreferNativeDecoder => '首选系统原生硬件解码器';

  @override
  String get adminPlaybackColorDepth10Hevc => '10位 HEVC 解码';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10位 VP9 解码';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10位解码';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12位解码';

  @override
  String get adminPlaybackHwEncodingSection => '硬件编码';

  @override
  String get adminPlaybackAllowHevcEncoding => '允许 HEVC 编码';

  @override
  String get adminPlaybackAllowAv1Encoding => '允许 AV1 编码';

  @override
  String get adminPlaybackIntelLowPowerH264 => '启用 Intel 低功耗 H.264 编码器';

  @override
  String get adminPlaybackIntelLowPowerHevc => '启用 Intel 低功耗 HEVC 编码器';

  @override
  String get adminPlaybackToneMapping => '色调映射';

  @override
  String get adminPlaybackEnableTonemapping => '启用色调映射';

  @override
  String get adminPlaybackEnableVppTonemapping => '启用 VPP 色调映射';

  @override
  String get adminPlaybackEnableVtTonemapping => '启用 VideoToolbox 色调映射';

  @override
  String get adminPlaybackTonemappingAlgorithm => '色调映射算法';

  @override
  String get adminPlaybackTonemappingMode => '色调映射模式';

  @override
  String get adminPlaybackTonemappingRange => '色调映射范围';

  @override
  String get adminPlaybackTonemappingDesat => '色调映射去饱和';

  @override
  String get adminPlaybackTonemappingPeak => '色调映射峰值';

  @override
  String get adminPlaybackTonemappingParam => '色调映射参数';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'VPP 色调映射亮度';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP 色调映射对比度';

  @override
  String get adminPlaybackEncoderPreset => '编码器预设';

  @override
  String get adminPlaybackH264Crf => 'H.264 编码 CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) 编码 CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => '去隔行方法';

  @override
  String get adminPlaybackDeinterlaceDoubleRate => '去隔行时倍帧输出';

  @override
  String get adminPlaybackAudioSection => '音频';

  @override
  String get adminPlaybackEnableAudioVbr => '启用音频 VBR 编码';

  @override
  String get adminPlaybackDownmixBoost => '音频下混增益';

  @override
  String get adminPlaybackDownmixAlgorithm => '立体声下混算法';

  @override
  String get adminPlaybackMaxMuxingQueue => '最大混合队列大小';

  @override
  String get adminPlaybackAutoOption => '自动';

  @override
  String get adminPlaybackEncoding => '编码';

  @override
  String get adminPlaybackEncodingThreads => '编码线程';

  @override
  String get adminPlaybackFallbackFont => '启用备用字体';

  @override
  String get adminPlaybackFallbackFontPath => '备用字体路径';

  @override
  String get adminPlaybackStreaming => '串流';

  @override
  String get adminResumeVideo => '视频';

  @override
  String get adminResumeAudiobooks => '有声读物';

  @override
  String get adminStreamingBitrateLimit => '远程客户端码率限制（Mbps）';

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
  String get adminTrickplayPriorityHigh => '高';

  @override
  String get adminTrickplayPriorityAboveNormal => '高于正常';

  @override
  String get adminTrickplayPriorityNormal => '正常';

  @override
  String get adminTrickplayPriorityBelowNormal => '低于普通';

  @override
  String get adminTrickplayPriorityIdle => '空闲';

  @override
  String get adminTrickplayImageSettings => '图片设置';

  @override
  String get adminTrickplayInterval => '间隔（毫秒）';

  @override
  String get adminTrickplayIntervalSubtitle => '捕获帧的频率';

  @override
  String get adminTrickplayWidthResolutionsHint => '以逗号分隔的像素宽度（例如 320）';

  @override
  String get adminTrickplayQuality => '质量';

  @override
  String get adminTrickplayQScale => '质量系数';

  @override
  String get adminTrickplayQScaleSubtitle => '数值越低，质量越高、文件越大';

  @override
  String get adminTrickplayJpegQuality => 'JPEG 质量';

  @override
  String get adminTrickplayProcessing => '处理中';

  @override
  String get adminTasksEmpty => '未找到计划任务';

  @override
  String get adminTasksNoFilterMatch => '没有任务符合当前筛选条件';

  @override
  String get adminTaskCancelling => '正在取消...';

  @override
  String get adminTaskRunning => '正在运行...';

  @override
  String get adminTaskNeverRun => '从未运行';

  @override
  String get adminTaskStop => '停止';

  @override
  String get adminRunningTasks => '正在运行的任务';

  @override
  String get adminTaskRun => '运行';

  @override
  String get adminTaskDetailLastExecution => '上次执行';

  @override
  String get adminTaskDetailStarted => '开始时间';

  @override
  String get adminTaskDetailEnded => '结束时间';

  @override
  String get adminTaskDetailDuration => '持续时间';

  @override
  String get adminTaskDetailErrorLabel => '错误：';

  @override
  String adminTaskTriggerDaily(String time) {
    return '每天 $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return '每周 $day $time';
  }

  @override
  String get adminTaskTriggerStartup => '应用启动时';

  @override
  String get adminTaskTriggerTypeDaily => '每天';

  @override
  String get adminTaskTriggerTypeWeekly => '每周';

  @override
  String get adminTaskTriggerTypeInterval => '按间隔执行';

  @override
  String get adminTaskTriggerIntervalLabel => '间隔';

  @override
  String get adminTaskTriggerEveryHour => '每小时';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 小时',
      one: '1 小时',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => '时间';

  @override
  String get adminActivityJustNow => '刚刚';

  @override
  String get adminActivityLastHour => '过去一小时';

  @override
  String get adminActivityToday => '今天';

  @override
  String get adminActivityYesterday => '昨天';

  @override
  String get adminActivityOlder => '更早';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days 天前';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours 小时前';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes 分钟前';
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
  String get adminTrickplayDescription => '配置用于拖动进度预览缩略图的 Trickplay 图片生成。';

  @override
  String get adminNetworkingPublicHttpsPort => '公共 HTTPS 端口';

  @override
  String get adminNetworkingBaseUrl => '基础 URL';

  @override
  String get adminNetworkingBaseUrlHint => '例如 /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => '公共 HTTP 端口';

  @override
  String get adminNetworkingRequireHttps => '要求 HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      '将所有远程请求重定向到 HTTPS。如果服务器没有有效证书则无效。';

  @override
  String get adminNetworkingCertPassword => '证书密码';

  @override
  String get adminNetworkingEnableIpv4 => '启用 IPv4';

  @override
  String get adminNetworkingEnableIpv6 => '启用 IPv6';

  @override
  String get adminNetworkingLocalSubnets => '局域网';

  @override
  String get adminNetworkingRemoteIpFilterLabel => '远程 IP 过滤器';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API 设备';

  @override
  String get adminPlaybackAutomatic => '0 = 自动';

  @override
  String get adminPlaybackTranscodeTempPath => '转码临时路径';

  @override
  String get adminPlaybackSegmentDeletion => '允许删除分段';

  @override
  String get adminPlaybackSegmentKeep => '分段保留时间（秒）';

  @override
  String get adminPlaybackThrottleBuffering => '启用缓冲节流';

  @override
  String get adminPlaybackThrottleDelay => '播放节流延迟（秒）';

  @override
  String get adminPlaybackEnableSubtitleExtraction => '实时提取内嵌字幕';

  @override
  String get adminResumeMinPct => '保存进度的最低百分比';

  @override
  String get adminResumeMinPctSubtitle => '播放超过这个百分比后才会保存进度';

  @override
  String get adminResumeMaxPct => '标记已看完的百分比';

  @override
  String get adminResumeMaxPctSubtitle => '播放超过这个百分比后会被视为已看完';

  @override
  String get adminResumeMinDuration => '可保存进度的最短时长（秒）';

  @override
  String get adminResumeMinDurationSubtitle => '短于此时长的内容不会保存播放进度';

  @override
  String get adminTrickplayScanBehavior => '扫描行为';

  @override
  String get adminTrickplayProcessPriority => '进程优先级';

  @override
  String get adminTrickplayTileWidth => '拼图宽度';

  @override
  String get adminTrickplayTileHeight => '拼图高度';

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
    return '无法更新内容类型：$error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '慢响应阈值（毫秒）';

  @override
  String get adminGeneralEnableSlowResponse => '启用慢速响应警告';

  @override
  String get adminGeneralQuickConnect => '启用快速连接';

  @override
  String get adminGeneralSectionServer => '服务器';

  @override
  String get adminGeneralSectionMetadata => '元数据';

  @override
  String get adminGeneralSectionPaths => '路径';

  @override
  String get adminGeneralSectionPerformance => '性能';

  @override
  String get adminGeneralCachePath => '缓存路径';

  @override
  String get adminGeneralMetadataPath => '元数据路径';

  @override
  String get adminGeneralServerName => '服务器名称';

  @override
  String get adminGeneralDisplayLanguage => '界面首选语言';

  @override
  String get adminSettingsLoadFailed => '无法加载设置';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return '更新映射失败：$error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return '时间限制：$duration';
  }

  @override
  String get folders => '文件夹';

  @override
  String get libraries => '媒体库';

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
  String get syncPlayGroupFallbackName => 'SyncPlay 播放组';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay 播放组';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# 位参与者',
      one: '# 位参与者',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => '忽略等待';

  @override
  String get syncPlayIgnoreWaitSubtitle => '此设备缓冲时，不阻塞整个播放组';

  @override
  String get syncPlayContinueLocallyNoWait => '本地继续播放，不等待较慢成员';

  @override
  String get syncPlayRepeat => '重复';

  @override
  String get syncPlayRepeatSubtitle => '重播单个媒体项或整个队列';

  @override
  String get syncPlayRepeatOne => '单个循环';

  @override
  String get syncPlayShuffleSubtitle => '按顺序或随机播放队列';

  @override
  String get syncPlayShuffleModeShuffled => '随机';

  @override
  String get syncPlayShuffleModeSorted => '顺序播放';

  @override
  String get syncPlayParticipantYou => '你';

  @override
  String syncPlayGroupSubtitle(String participants, String detail) {
    return '$participants · $detail';
  }

  @override
  String get syncPlayNothingQueued => '队列中暂无内容';

  @override
  String get syncPlayOthersCanJoinHint => '此播放组存在期间，其他人可从各自的 SyncPlay 页面加入。';

  @override
  String get syncPlaySyncCurrentQueue => '同步当前播放队列';

  @override
  String get syncPlaySyncCurrentQueueSubtitle => '将组队列替换为本地正在播放的内容';

  @override
  String get syncPlayLeaveGroup => '离开播放组';

  @override
  String get syncPlayGroupQueue => '播放组队列';

  @override
  String syncPlayQueueItemFallback(int index) {
    return '媒体项 $index';
  }

  @override
  String get syncPlayPlayNow => '立即播放';

  @override
  String get syncPlayCreateNewGroup => '创建新播放组';

  @override
  String get syncPlayCreateGroupSubtitle => '与所有加入的人一起观看';

  @override
  String get syncPlayGroupName => '播放组名称';

  @override
  String get syncPlayDefaultGroupName => '我的 SyncPlay 播放组';

  @override
  String get syncPlayCreateGroup => '创建播放组';

  @override
  String get syncPlayAvailableGroups => '可用播放组';

  @override
  String syncPlayAvailableGroupsCount(int count) {
    return '可用播放组 · $count';
  }

  @override
  String get syncPlayNoGroupsAvailable => '暂无可用播放组';

  @override
  String get syncPlayNoGroupsAvailableHint => '其他人在此服务器上创建的播放组将显示在这里。';

  @override
  String get syncPlayJoinGroupQuestion => '加入 SyncPlay 播放组？';

  @override
  String get syncPlayJoinGroupWarning => '加入 SyncPlay 播放组可能会替换当前播放队列。继续吗？';

  @override
  String get syncPlayJoinReplacesQueueNote => '加入播放组可能会替换你当前的播放队列。';

  @override
  String get syncPlayJoin => '加入';

  @override
  String get syncPlayStateIdle => '空闲';

  @override
  String get syncPlayStateWaiting => '等待中';

  @override
  String get syncPlayStatePaused => '已暂停';

  @override
  String get syncPlayStatePlaying => '播放中';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName 加入了 SyncPlay 播放组';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName 离开了 SyncPlay 播放组';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay 访问被拒绝';

  @override
  String get syncPlayAccessDeniedMessage =>
      '你无权访问此 SyncPlay 组中的一个或多个媒体项。请让组所有者检查媒体库权限，或选择其他队列。';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '正在将播放同步到 $groupName';
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
  String get dolbyVisionNotSupportedTitle => '不支持 Dolby Vision';

  @override
  String get dolbyVisionNotSupportedMessage =>
      '此设备无法直接解码 Dolby Vision 内容。请改用 HDR10 兼容播放，或请求服务器转码。';

  @override
  String get rememberMyChoice => '记住我的选择';

  @override
  String get playHdr10Fallback => '以 HDR10 兼容模式播放';

  @override
  String get requestTranscode => '请求转码';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已发现 # 个栏目',
      one: '已发现 # 个栏目',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => '查看全部';

  @override
  String get noItems => '无媒体项';

  @override
  String get switchUser => '切换用户';

  @override
  String get remoteControl => '远程控制';

  @override
  String get mediaBarLoading => '正在加载媒体栏...';

  @override
  String get mediaBarError => '媒体栏加载失败';

  @override
  String get offlineServerUnavailable => '已连接到互联网，但当前服务器不可用。';

  @override
  String get offlineNoInternet => '你已离线。只有已下载内容可用。';

  @override
  String get offlineFileNotAvailable => '文件不可用';

  @override
  String get offlineSwitchServer => '切换服务器';

  @override
  String get offlineSavedMedia => '下载';

  @override
  String get offlineBannerTitle => '当前离线状态';

  @override
  String get offlineBannerSubtitle => '仅展示本地离线下载内容';

  @override
  String get serverUnreachableBannerTitle => '无法连接媒体服务器';

  @override
  String get serverUnreachableBannerSubtitle => '服务器恢复前仅播放本地缓存影片';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => '远程播放';

  @override
  String castControlFailed(String error) {
    return '投屏控制失败：$error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind 控制';
  }

  @override
  String get castDeviceVolume => '设备音量';

  @override
  String get castVolumeUnavailable => '不可用';

  @override
  String castStopKind(String kind) {
    return '停止 $kind';
  }

  @override
  String get audioLabel => '音频';

  @override
  String get subtitlesLabel => '字幕';

  @override
  String get pinConfirmTitle => '确认 PIN 码';

  @override
  String get pinSetTitle => '设置 PIN 码';

  @override
  String get pinEnterTitle => '输入 PIN 码';

  @override
  String get pinReenterToConfirm => '重新输入 PIN 码进行确认';

  @override
  String pinEnterNDigit(int length) {
    return '输入 $length 位 PIN 码';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '输入你的 $length 位 PIN 码';
  }

  @override
  String get kidsMode => '儿童模式';

  @override
  String get kidsModeSubtitle => '简化应用界面，并通过 PIN 码锁定退出';

  @override
  String get kidsModeExit => '退出儿童模式';

  @override
  String get kidsModeExitSubtitle => '输入 PIN 码以恢复完整应用';

  @override
  String kidsModePinToSwitchUser(String name) {
    return '输入儿童模式 PIN 码以切换到 $name';
  }

  @override
  String get pinIncorrect => 'PIN 码不正确';

  @override
  String pinTryAgainIn(String wait) {
    return '尝试次数过多。请在 $wait 后重试。';
  }

  @override
  String get pinMismatch => 'PIN 码不匹配';

  @override
  String get pinForgot => '忘记 PIN 码？';

  @override
  String get pinClear => '清除';

  @override
  String get pinBackspace => '退格键';

  @override
  String get quickConnectAuthorized => 'Quick Connect 请求已获授权。';

  @override
  String get quickConnectInvalidOrExpired => 'Quick Connect 代码无效或已过期。';

  @override
  String get quickConnectNotSupported => '此服务器不支持 Quick Connect。';

  @override
  String get quickConnectAuthorizeFailed => '无法授权 Quick Connect 代码。';

  @override
  String get quickConnectDisabled => '此服务器上禁用了 Quick Connect。';

  @override
  String get quickConnectForbidden => '你的账号无法授权此 Quick Connect 请求。';

  @override
  String get quickConnectNotFound => '未找到 Quick Connect 代码。请尝试新的代码。';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect 失败：$message';
  }

  @override
  String get quickConnectEnterCode => '输入代码';

  @override
  String get quickConnectAuthorize => '授权';

  @override
  String remoteCommandFailed(String error) {
    return '命令失败：$error';
  }

  @override
  String get remoteControlTitle => '远程控制';

  @override
  String get remoteFailedToLoadSessions => '无法加载会话';

  @override
  String get remoteNoSessions => '暂无可控制会话';

  @override
  String get remoteStartPlayback => '在另一台设备上开始播放';

  @override
  String get unknownUser => '未知';

  @override
  String get unknownItem => '未知';

  @override
  String get remoteNothingPlaying => '此会话没有正在播放的内容';

  @override
  String get castingStarted => '已在选定设备上开始投屏';

  @override
  String castingFailed(String error) {
    return '无法开始投屏：$error';
  }

  @override
  String get noRemoteDevices => '没有可用的远程播放设备。';

  @override
  String get noRemoteDevicesIos =>
      '没有可用的远程播放设备。\n\n在 iOS 上，AirPlay 目标在模拟器中可能不可用。';

  @override
  String get trackActionPlayNext => '接下来播放';

  @override
  String get trackActionViewDetails => '查看详情';

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
  String get trackActionMoveDown => '向下移动';

  @override
  String get trackActionRemoveFromFavorites => '从收藏中移除';

  @override
  String get trackActionAddToFavorites => '添加到收藏';

  @override
  String get trackActionGoToAlbum => '前往专辑';

  @override
  String get trackActionGoToArtist => '前往艺人';

  @override
  String trackActionDownloading(String name) {
    return '正在下载 $name...';
  }

  @override
  String get trackActionDeletedFile => '已删除下载文件';

  @override
  String get trackActionDeleteFileFailed => '无法删除下载文件';

  @override
  String get shuffleBy => '随机播放方式';

  @override
  String get shuffleSelectLibrary => '选择媒体库';

  @override
  String get shuffleSelectGenre => '选择类型';

  @override
  String get shuffleLibrary => '媒体库';

  @override
  String get shuffleGenre => '类型';

  @override
  String get shuffleNoLibraries => '没有可用的兼容媒体库。';

  @override
  String get shuffleNoGenres => '未找到适合此随机播放模式的类型。';

  @override
  String get posterDisplayTitle => '显示';

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
  String get playlistCreate => '创建';

  @override
  String get playlistCreateNew => '创建新的播放列表';

  @override
  String get playlistNoneFound => '未找到播放列表';

  @override
  String get addToPlaylist => '添加到播放列表';

  @override
  String get removeFromPlaylist => '从播放列表移除';

  @override
  String removeFromPlaylistConfirm(String item, String playlist) {
    return '要从 $playlist 中移除 $item 吗？';
  }

  @override
  String get removeFromPlaylistFailed => '从播放列表移除失败';

  @override
  String get lyricsNotAvailable => '暂无可用歌词';

  @override
  String get upNext => '接下来';

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
    return '跳过 $segment';
  }

  @override
  String get liveTv => '直播电视';

  @override
  String get continueWatchingAndNextUp => '继续观看与接下来播放';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '正在下载 $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '正在下载 $fileName';
  }

  @override
  String get nextEpisode => '下一集';

  @override
  String get moreFromThisSeason => '本季更多内容';

  @override
  String get playerTooltipPlaybackSpeed => '播放速度';

  @override
  String get playerTooltipCastControls => '投屏控制';

  @override
  String get playerTooltipPlaybackQuality => '码率';

  @override
  String get playerTooltipEnterFullscreen => '进入全屏';

  @override
  String get playerTooltipExitFullscreen => '退出全屏';

  @override
  String get playerTooltipFloatOnTop => '置顶悬浮';

  @override
  String get playerTooltipExitFloatOnTop => '取消置顶悬浮';

  @override
  String get playerTooltipPictureInPicture => '画中画';

  @override
  String get playerTooltipExitPictureInPicture => '退出画中画';

  @override
  String get playerPlayingInPictureInPicture => '正在画中画播放';

  @override
  String get playerTooltipLockLandscape => '锁定横屏';

  @override
  String get playerTooltipUnlockOrientation => '允许旋转';

  @override
  String get playerTooltipPrevious => '上一个';

  @override
  String get playerTooltipSeekBack => '快退';

  @override
  String get playerTooltipSeekForward => '快进';

  @override
  String get playerTooltipMinimize => '最小化播放器';

  @override
  String get miniPlayerOpenPlayer => '打开播放器';

  @override
  String get contextMenuMarkWatched => '标记为已观看';

  @override
  String get contextMenuMarkUnwatched => '标记为未观看';

  @override
  String get contextMenuAddToFavorites => '添加到收藏';

  @override
  String get contextMenuRemoveFromFavorites => '从收藏中移除';

  @override
  String get contextMenuGoToSeries => '前往剧集';

  @override
  String get contextMenuHideFromContinueWatching => '从继续观看列表隐藏';

  @override
  String get contextMenuHideFromNextUp => '从待播剧集列表隐藏';

  @override
  String get contextMenuAddToCollection => '添加至影片合集';

  @override
  String get contextMenuRemoveFromCollection => '从合集移除';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return '要从 $collection 中移除 $item 吗？该媒体项仍会保留在你的媒体库中。';
  }

  @override
  String get removeFromCollectionFailed => '从合集移除失败';

  @override
  String get settingsAdministrationSubtitle => '访问服务器管理面板';

  @override
  String get settingsDynamicContent => '动态内容';

  @override
  String get settingsDynamicContentSubtitle => '媒体栏和视觉浮层';

  @override
  String get settingsAboutSubtitle => '应用版本、法律信息和制作人员';

  @override
  String get settingsSortServersBy => '服务器排序依据';

  @override
  String get settingsLastUsed => '最后使用';

  @override
  String get settingsAlphabetical => '按字母顺序';

  @override
  String get settingsAllowSelfSignedCerts => '允许自签名证书';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      '信任使用自签名或私有 CA TLS 证书的服务器。仅对您控制的服务器启用。这会禁用所有连接的证书验证。';

  @override
  String get untrustedServerCertificate =>
      '此服务器的证书不受信任。如果这是你自己的服务器，且使用自签名或私有证书，你可以在此处允许它。';

  @override
  String get clientCertTitle => '客户端证书';

  @override
  String clientCertHost(String host) {
    return '$host 的证书';
  }

  @override
  String get clientCertChooseFile => '选择文件';

  @override
  String get clientCertPassword => '证书密码';

  @override
  String get clientCertStartUpload => '从手机发送';

  @override
  String get clientCertUploadHint => '用手机扫描此二维码，或在手机浏览器中打开该地址，然后选择文件并输入密码。';

  @override
  String get clientCertStopUpload => '停止等待';

  @override
  String get clientCertNoFileData => '无法读取文件。请重试。';

  @override
  String get clientCertPickFailed => '无法打开文件选择器。';

  @override
  String get clientCertUploadFailed => '无法打开上传页面。请重试。';

  @override
  String get clientCertNoSecureStorage =>
      '此设备没有安全存储，因此无法保存证书。在 Linux 上，请安装 libsecret 后重试。';

  @override
  String get clientCertDecodeFailed => '无法将该文件读取为证书。请确保它是 .p12 或 .pfx 文件。';

  @override
  String get clientCertWrongPassword => '该密码无法解锁此证书。';

  @override
  String get clientCertRequired => '此服务器需要客户端证书（mTLS）。请为此主机添加证书以继续。';

  @override
  String clientCertExpired(String date) {
    return '此服务器的证书已于 $date 过期。请更换证书以继续。';
  }

  @override
  String get clientCertAddButton => '添加客户端证书';

  @override
  String get settingsClientCertificates => '客户端证书';

  @override
  String get settingsClientCertificatesSubtitle => '此应用向需要证书的服务器（mTLS）提供的证书';

  @override
  String get clientCertSubject => '主题';

  @override
  String clientCertExpires(String date) {
    return '有效期至 $date';
  }

  @override
  String get clientCertReplace => '替换';

  @override
  String get clientCertAdd => '添加证书';

  @override
  String get clientCertAddHostPrompt => '哪个服务器主机需要证书？';

  @override
  String get itemBlockedByParentalControls => '此内容不可用';

  @override
  String get blockedRatingsCeilingHint => '屏蔽某个分级也会屏蔽比它更高的所有分级。';

  @override
  String get blockedRatingsUnrankedSection => '仅屏蔽自身';

  @override
  String get settingsHomePage => '主页';

  @override
  String get settingsTwentyFourHourClock => '24 小时制';

  @override
  String get settingsTwentyFourHourClockSubtitle => '显示时钟时使用 24 小时制';

  @override
  String get settingsDateFormat => '日期格式';

  @override
  String get settingsDateFormatDescription =>
      '在“月-日”“日-月”或区域设置默认格式之间选择，用于日历日期和发行日期';

  @override
  String get dateFormatSystem => '区域设置默认';

  @override
  String get dateFormatMonthDay => '月 / 日（11 / 10）';

  @override
  String get dateFormatDayMonth => '日 / 月（10 / 11）';

  @override
  String get settingsShowShuffleButtonInNavigation => '在导航栏中显示随机播放按钮';

  @override
  String get settingsShowGenresButtonInNavigation => '在导航栏中显示类型按钮';

  @override
  String get settingsShowFavoritesButtonInNavigation => '在导航栏中显示收藏按钮';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      '当服务器有直播电视媒体库时，在导航栏显示“直播电视”按钮';

  @override
  String get settingsShowLibrariesButtonInNavigation => '在导航栏中显示媒体库按钮';

  @override
  String get settingsShowSeerrButtonInNavigation => '在导航栏中显示 Seerr 按钮';

  @override
  String get settingsAlwaysExpandNavbarLabels => '始终显示顶部导航栏中的文本标签';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      '切换每个媒体库的主页可见性。重启 Moonfin 以使更改生效。';

  @override
  String get settingsMediaBarAndLocalPreviews => '媒体栏和本地预览';

  @override
  String get settingsVisualOverlays => '视觉叠加';

  @override
  String get settingsSeasonalSurprise => '季节性惊喜';

  @override
  String get useNativeEmulator => '原生模拟';

  @override
  String get useNativeEmulatorSubtitle => '使用原生内核运行游戏，而非 EmulatorJS 网页播放器';

  @override
  String get emulatorCores => '模拟器内核';

  @override
  String get emulatorCoresSubtitle => '下载游戏系统以原生方式运行游戏';

  @override
  String get emulatorCoresDescription =>
      '选择需要安装的游戏系统。内核由 libretro 项目提供，可脱离浏览器，以原生模式运行游戏。';

  @override
  String get emulatorCoreDownloading => '正在下载';

  @override
  String get emulatorCoreUnavailable => '当前设备不支持';

  @override
  String get emulatorCoreDownloadFailed => '内核下载失败，请检查网络连接后重试。';

  @override
  String emulatorCoreResetSettings(String system) {
    return '将 $system 设置重置为默认值';
  }

  @override
  String get emulatorCoreSettingsReset => '设置已重置为默认值。';

  @override
  String get emulatorCoreResetSettingsFailed => '无法重置设置。请检查连接后重试。';

  @override
  String get downloadedGames => '已下载游戏';

  @override
  String get downloadedGamesSubtitle => '释放游戏文件占用的存储空间';

  @override
  String get downloadedGamesDescription =>
      '游戏运行前会复制至本机。可删除已通关游戏释放空间，存档保存在服务器，不会被清除。';

  @override
  String get downloadedGamesEmpty => '暂未在本机下载任何游戏。';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count 款游戏，占用 $size';
  }

  @override
  String get removeAllDownloadedGames => '全部移除';

  @override
  String removeDownloadedGameConfirm(String title) {
    return '是否从本机移除 $title？下次游玩时将会重新下载。';
  }

  @override
  String get removeAllDownloadedGamesConfirm => '是否移除本机所有已下载游戏？下次游玩时将会重新下载。';

  @override
  String get settingsHigh => '高';

  @override
  String get settingsLow => '低';

  @override
  String get settingsCustomPath => '自定义路径';

  @override
  String get settingsEnterDownloadFolderPath => '输入下载文件夹路径';

  @override
  String get settingsConcurrentDownloads => '并发下载';

  @override
  String get settingsConcurrentDownloadsDescription => '一次下载的最大媒体项数。';

  @override
  String get settingsAppInfo => '应用信息';

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
  String get settingsSupportMoonfin => '支持 Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => '请开发者喝杯咖啡';

  @override
  String get settingsLegal => '法律信息';

  @override
  String get settingsLicenses => '许可证';

  @override
  String get settingsOpenSourceLicenseNotices => '开源许可声明';

  @override
  String get settingsPrivacyPolicy => '隐私政策';

  @override
  String get settingsPrivacyPolicySubtitle => 'Moonfin 如何处理你的数据';

  @override
  String get settingsCheckForUpdates => '检查更新';

  @override
  String get settingsCheckForUpdatesSubtitle => '检查最新的 Moonfin 版本';

  @override
  String get settingsBoth => '两者';

  @override
  String get settingsShuffleContentTypeFilter => '随机播放内容类型过滤器';

  @override
  String get settingsAudioPreferencesSubtitle => '音轨、处理和直通选项';

  @override
  String get settingsAutomationAndQueueSubtitle => '自动播放和播放顺序';

  @override
  String get settingsSyncplaySubtitle => '播放组会话的同步逻辑';

  @override
  String get settingsSkipIntrosAndOutros => '跳过片头和片尾？';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment 片段';
  }

  @override
  String get settingsMediaSegmentCountdown => '媒体片段倒计时';

  @override
  String get settingsProgressBar => '进度条';

  @override
  String get settingsTimer => '计时器';

  @override
  String get settingsNone => '无';

  @override
  String get settingsSkipButtonAutoHide => '自动隐藏跳过按钮';

  @override
  String get settingsSkipButtonAutoHideDescription => '数秒后自动关闭片头片尾跳过按钮。';

  @override
  String get settingsPromptUser => '提示用户';

  @override
  String get settingsSkip => '跳过';

  @override
  String get settingsDoNothing => '什么都不做';

  @override
  String get settingsMaxBitrateDescription => '限制串流码率。高于此阈值的内容将进行转码以适应。';

  @override
  String get settingsMaxResolutionDescription =>
      '限制播放器请求的最大分辨率。更高分辨率的内容将转码到较低分辨率。';

  @override
  String get settingsPlayerZoomDescription => '如何缩放视频以适合屏幕。';

  @override
  String get settingsPlaybackEngineAndroidTv => '播放引擎（Android TV）';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      '选择 Android TV 设备上的默认播放引擎。更改将在下次播放时生效。';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3（推荐）';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv（旧版）';

  @override
  String get settingsRedetectDisplay => '重新检测显示设备';

  @override
  String get settingsRedetectDisplayDescription =>
      '重新查询电视支持的 HDR 格式。若电视 / 功放开机较晚，导致杜比视界或 HDR10 影片被转码，可使用此选项。';

  @override
  String get settingsDisplayIsSdr => '我的电视不支持 HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      '不再声明此显示设备支持 HDR。仅当检测持续误报 HDR，但电视实际无法播放 HDR 时启用。';

  @override
  String settingsDisplayRedetected(String formats) {
    return '已重新检测显示设备：$formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => '未检测到任何 HDR 格式';

  @override
  String get settingsDisplayMarkedSdr => '已将显示设备标记为 SDR';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision 兼容播放';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      '无 Dolby Vision 解码能力的设备播放 Dolby Vision 影片时的行为。';

  @override
  String get settingsAskEachTime => '每次都询问';

  @override
  String get settingsPreferHdr10Fallback => '优先使用 HDR10 兼容播放';

  @override
  String get settingsPreferServerTranscode => '优先使用服务器转码';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 直接播放';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      '控制 Dolby Vision Profile 7 增强层视频流是否直接播放。';

  @override
  String get settingsAutoAftkrtEnabled => '自动';

  @override
  String get settingsEnabledOnThisDevice => '启用';

  @override
  String get settingsDisabledPreferTranscode => '禁用';

  @override
  String get settingsResumeRewindDescription => '从“继续观看”或详情页继续播放时，先倒回多少秒？';

  @override
  String get settingsUnpauseRewindDescription => '暂停后继续播放时，先倒回多少秒？';

  @override
  String get settingsSkipBackLengthDescription => '按快退按钮后跳回多少秒。';

  @override
  String get settingsOneSecond => '1 秒';

  @override
  String get settingsThreeSeconds => '3 秒';

  @override
  String get settingsFortyFiveSeconds => '45 秒';

  @override
  String get settingsSixtySeconds => '60 秒';

  @override
  String get settingsSkipForwardLengthDescription => '按快进按钮后快进多少秒。';

  @override
  String get settingsHideControlsAfter => '控制栏隐藏延迟';

  @override
  String get settingsHideControlsAfterDescription =>
      '在你最后一次按键、轻触或移动鼠标后，播放器控制栏在屏幕上停留的时长。';

  @override
  String get settingsHdrControlsDimming => '在 HDR 中调暗控制栏';

  @override
  String get settingsHdrControlsDimmingDescription =>
      '白色在 HDR 视频旁显得更亮，因此播放时控制栏会按此幅度调暗。';

  @override
  String get settingsBitstreamAc3ToExternalDecoder => '将 AC3 以比特流发送到外部解码器';

  @override
  String get settingsCinemaMode => '影院模式';

  @override
  String get settingsCinemaModeSubtitle => '正片播放前播放预告片/片前视频';

  @override
  String get settingsCinemaModeEpisodes => '剧集影院模式';

  @override
  String get settingsCinemaModeEpisodesSubtitle => '在电视节目播出前也播放片头广告';

  @override
  String get settingsNextUpDisplayDescription =>
      '扩展模式显示包含单集艺术图和简介的完整卡片；简洁模式显示紧凑倒计时浮层；禁用则完全隐藏提示。';

  @override
  String get settingsShort => '短';

  @override
  String get settingsLong => '长';

  @override
  String get settingsVeryLong => '很长';

  @override
  String get settingsVideoStartDelay => '视频开始延迟';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => '直播电视直接播放';

  @override
  String get settingsLiveTvDirectSubtitle => '启用直播电视直接播放';

  @override
  String get settingsOpenGroups => '打开播放组';

  @override
  String get settingsOpenGroupsSubtitle => '创建、加入或管理 SyncPlay 播放组';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay 已启用';

  @override
  String get settingsSyncplayEnabledSubtitle => '启用播放组观看功能';

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
  String get settingsSyncplaySpeedToSync => '变速同步';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle => '通过调整播放速度保持同步';

  @override
  String get settingsSyncplaySkipToSync => '跳至同步';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => '通过跳转进度保持同步';

  @override
  String get settingsSyncplayMinimumSpeedDelay => '最小速度延迟';

  @override
  String get settingsSyncplayMaximumSpeedDelay => '最大速度延迟';

  @override
  String get settingsSyncplaySpeedDuration => '速度持续时间';

  @override
  String get settingsSyncplayMinimumSkipDelay => '最小跳转延迟';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay 额外偏移';

  @override
  String get onNow => '现在播出';

  @override
  String get collections => '合集';

  @override
  String get lastPlayed => '上次播放';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return '新增 $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '新上映 $libraryName';
  }

  @override
  String get autoplayNextEpisode => '自动播放下一集';

  @override
  String get autoplayNextEpisodeSubtitle => '下一集可用时自动播放。';

  @override
  String get skipSilenceTitle => '跳过静音';

  @override
  String get skipSilenceSubtitle => '在媒体流支持时，自动跳过静音音频片段。';

  @override
  String get allowExternalAudioEffectsTitle => '允许外部音频效果';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      '允许均衡器和效果应用（例如 Wavelet）附加到 Media3 播放会话。';

  @override
  String get disableTunnelingTitle => '禁用隧道播放';

  @override
  String get disableTunnelingSubtitle => '强制使用非隧道播放。适用于隧道音频/视频存在中断的设备。';

  @override
  String get enableTunnelingTitle => '启用隧道播放';

  @override
  String get enableTunnelingSubtitle =>
      '高级设置。通过耦合的硬件路径传输音频和视频。默认关闭，因为某些设备可能出现音视频中断。';

  @override
  String get mapDolbyVisionP7Title => '始终以 HDR10 格式播放 Dolby Vision 7 profile';

  @override
  String get mapDolbyVisionP7Subtitle =>
      '跳过 Profile 8 转换，并将 Dolby Vision Profile 7 流转换为 HDR10 兼容的 HEVC 格式。如果转换后的流看起来有问题，请使用此方法。';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      '将同时含 HDR10+ 的 Dolby Vision 视频按 HDR10+ 播放';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      '从同时含 HDR10+ 的视频中移除 Dolby Vision 图层。如果这些视频播放时有声音但黑屏，请开启此项。';

  @override
  String get subtitlesUseEmbeddedStyles => '使用内嵌字幕样式';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      '应用字幕轨道中内嵌的颜色、字体和位置。关闭后改用你的字幕样式偏好。';

  @override
  String get subtitlesUseEmbeddedFontSizes => '使用内嵌字幕字号';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      '应用字幕轨道中内嵌的字号提示。关闭后使用样式偏好中的字幕大小。';

  @override
  String get showMediaDetailsOnLibraryPage => '显示媒体详情';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '在媒体库页面顶部显示所选媒体项的详情。';

  @override
  String get libraryCardTitles => '海报下方显示标题';

  @override
  String get libraryCardTitlesDescription => '在媒体库网格中，于每个媒体项的图片下方显示标题和详情。';

  @override
  String get useDetailedSubHeadings => '使用详细的子行';

  @override
  String get useDetailedSubHeadingsDescription => '在媒体库页面显示详细或简洁的子行。';

  @override
  String get savedThemesDeleteDialogTitle => '删除已保存的主题？';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '从此设备缓存中移除“$themeName”吗？';
  }

  @override
  String get themeStore => '主题商店';

  @override
  String get themeStoreSubtitle => '浏览并保存社区主题';

  @override
  String get themeStoreDescription => '保存主题后即可像其他已保存主题一样使用。';

  @override
  String get themeStoreEmpty => '当前没有可用主题。';

  @override
  String get themeStoreLoadFailed => '无法加载主题商店。请检查连接后重试。';

  @override
  String get themeStoreSave => '保存';

  @override
  String get themeStoreSaveAndApply => '保存并应用';

  @override
  String get themeStoreSaved => '已保存';

  @override
  String get themeStoreInvalidMessage => '无法加载此主题。';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '已保存“$themeName”。';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '已从此设备中移除“$themeName”。';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '无法移除“$themeName”。';
  }

  @override
  String get savedThemesTitle => '已保存的主题';

  @override
  String get savedThemesDescription =>
      '这些主题来自当前服务器的 Moonfin 插件。删除时只会移除此设备上的本地副本。';

  @override
  String get savedThemesEmpty => '找不到该服务器的已保存主题。';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • 当前启用';
  }

  @override
  String get savedThemesDeleteTooltip => '移除已保存主题';

  @override
  String get savedThemesManageSubtitle => '管理此设备上下载的插件主题';

  @override
  String get themeEditor => '主题编辑器';

  @override
  String get themeEditorSubtitle => '在浏览器中打开 Moonfin 主题编辑器';

  @override
  String get homeScreen => '主屏幕';

  @override
  String get bottomBar => '底栏';

  @override
  String get homeRowsStyleClassic => '经典';

  @override
  String get homeRowsStyleModern => '现代';

  @override
  String get homeRowsStyleCarousel => '轮播';

  @override
  String get homeRowsSection => '首页行';

  @override
  String get rowsType => '行类型';

  @override
  String get rowsTypeDescription => '经典模式保留每行的图片类型和信息浮层。现代模式使用竖版图到背景图的行布局。';

  @override
  String get modernCardsOnMyMediaRow => '“我的媒体”行使用现代卡片';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      '显示可自定义的海报，获得焦点时展开。关闭后始终显示横向缩略图。';

  @override
  String get sortOrder => '排序顺序';

  @override
  String get ascending => '升序';

  @override
  String get descending => '降序';

  @override
  String get displayFavoritesRows => '显示收藏行';

  @override
  String get displayFavoritesRowsSubtitle => '在首页栏目中显示收藏的电影、剧集和其他收藏行。';

  @override
  String get favoritesRowSorting => '收藏行排序';

  @override
  String get favoritesRowSortingDescription => '按添加日期、发布日期、字母顺序等对收藏行进行排序。';

  @override
  String get favoritesRowSortOrderDescription => '对收藏行执行升序或降序排序。';

  @override
  String get displayCollectionsRows => '显示合集行';

  @override
  String get displayCollectionsRowsSubtitle => '在首页栏目中显示合集行。';

  @override
  String get collectionsRowSorting => '合集行排序';

  @override
  String get collectionsRowSortingDescription => '按添加日期、发布日期、字母顺序等方式排序合集行。';

  @override
  String get collectionsRowSortOrderDescription => '对合集行执行升序或降序排序。';

  @override
  String get collectionsRowShowEpisodes => '显示单集';

  @override
  String get collectionsRowShowEpisodesSubtitle => '展开电视节目，将每一集单独显示。';

  @override
  String get displayGenresRows => '显示类型行';

  @override
  String get displayGenresRowsSubtitle => '在首页栏目中显示类型行。';

  @override
  String get genresRowSorting => '类型行排序';

  @override
  String get genresRowSortingDescription => '按添加日期、发布日期、字母顺序等对类型行进行排序。';

  @override
  String get genresRowSortOrderDescription => '对类型行执行升序或降序排序。';

  @override
  String get genresRowItems => '类型行媒体项';

  @override
  String get genresRowItemsDescription => '在类型行中显示电影、剧集或两者。';

  @override
  String get displayStudiosRows => '显示制作公司行';

  @override
  String get displayStudiosRowsSubtitle => '在首页分区显示制作公司行。';

  @override
  String get sinceYouWatched => '观看之后';

  @override
  String get sinceYouWatchedRowTitle => '观看之后';

  @override
  String sinceYouWatchedItemRowTitle(String title) {
    return '观看“$title”之后';
  }

  @override
  String sinceYouWatchedRowNumber(int number) {
    return '“观看之后”第 $number 行';
  }

  @override
  String get displaySinceYouWatchedRows => '显示“观看之后”行';

  @override
  String get displaySinceYouWatchedRowsSubtitle => '在首页栏目中显示并自定义“观看之后”行。';

  @override
  String get sinceYouWatchedSource => '推荐来源';

  @override
  String get sinceYouWatchedSourceDescription =>
      '选择推荐来源（Moonfin Recommends 为本地媒体库算法，Server Recommends 来自媒体服务器，TMDb 使用在线相似度指标。注意：在线推荐需要集成 Seerr）。';

  @override
  String get sinceYouWatchedSourceLocal => 'Moonfin 智能推荐';

  @override
  String get sinceYouWatchedSourceServer => '服务器推荐';

  @override
  String get sinceYouWatchedSourceOnline => 'TMDb 相似影片推荐';

  @override
  String get sinceYouWatchedSourceType => '来源类型';

  @override
  String get sinceYouWatchedSourceTypeDescription => '选择要推荐的媒体项类型';

  @override
  String get sinceYouWatchedSourceItem => '来源媒体项';

  @override
  String get sinceYouWatchedSourceItemDescription => '选择作为推荐依据的来源媒体项';

  @override
  String get sinceYouWatchedRecentlyWatched => '最近观看';

  @override
  String get sinceYouWatchedNumRows => '添加的行数';

  @override
  String get sinceYouWatchedNumRowsDescription => '选择要显示的“观看之后”行数（1-5）';

  @override
  String get sinceYouWatchedIncludeWatched => '包含已观看内容';

  @override
  String get sinceYouWatchedIncludeWatchedSubtitle => '在推荐中包含已观看的媒体项';

  @override
  String get studiosRowSorting => '制作公司行排序';

  @override
  String get studiosRowSortingDescription => '制作公司行可按名称、最近添加及更多条件排序。';

  @override
  String get studiosRowSortOrderDescription => '制作公司行可按名称、最近添加及更多条件排序。';

  @override
  String get selectStudiosToInclude => '选择要包含的制作公司';

  @override
  String get selectStudiosToIncludeDescription => '选择哪些制作公司应显示在首页行中。';

  @override
  String get selectAllStudios => '全选';

  @override
  String get deselectAllStudios => '取消全选';

  @override
  String get tvStudiosFilter => '剧集制作公司';

  @override
  String get movieStudiosFilter => '电影制作公司';

  @override
  String get selectedStudiosFilter => '已选制作公司';

  @override
  String get unselectedStudiosFilter => '未选制作公司';

  @override
  String get filtersHeader => '筛选';

  @override
  String get showHeader => '显示';

  @override
  String get displayPlaylistsRows => '显示播放列表行';

  @override
  String get displayPlaylistsRowsSubtitle => '在首页栏目中显示播放列表行。';

  @override
  String get playlistsRowSorting => '播放列表行排序';

  @override
  String get playlistsRowSortingDescription => '按添加日期、发布日期、字母顺序等方式排序播放列表行。';

  @override
  String get playlistsRowSortOrderDescription => '对播放列表行执行升序或降序排序。';

  @override
  String get playlistsRowShowEpisodes => '显示单集';

  @override
  String get playlistsRowShowEpisodesSubtitle => '展开电视节目，将每一集单独显示。';

  @override
  String get displayAudioRows => '显示音频行';

  @override
  String get displayAudioRowsSubtitle => '在首页栏目中显示音频行。';

  @override
  String get audioRowsSorting => '音频行排序';

  @override
  String get audioRowsSortingDescription => '按添加日期、发布日期、字母顺序等方式排序音频行。';

  @override
  String get audioRowsSortOrderDescription => '对音频行执行升序或降序排序。';

  @override
  String get sorting => '排序';

  @override
  String get imdbRowsSorting => 'IMDb 行排序';

  @override
  String get imdbRowsSortingDescription => '按名称、发布日期、评分等方式排序 IMDb 行。';

  @override
  String get imdbRowsSortOrderDescription => '对 IMDb 行执行升序或降序排序。';

  @override
  String get tmdbRowsSorting => 'TMDB 行排序';

  @override
  String get tmdbRowsSortingDescription => '按名称、发布日期、评分等方式排序 TMDB 行。';

  @override
  String get tmdbRowsSortOrderDescription => '对 TMDB 行执行升序或降序排序。';

  @override
  String get seerrRowsSorting => 'Seerr 行排序';

  @override
  String get seerrRowsSortingDescription => '按名称、发布日期、评分等方式排序 Seerr 行。';

  @override
  String get seerrRowsSortOrderDescription => '对 Seerr 行执行升序或降序排序。';

  @override
  String get externalRowSortDefault => '默认（列表顺序）';

  @override
  String get externalRowSortName => '名字';

  @override
  String get externalRowSortReleaseDate => '上映日期';

  @override
  String get externalRowSortRating => '评分';

  @override
  String get externalRowSortPopularity => '热度';

  @override
  String get externalRowSortShuffle => '随机播放';

  @override
  String get audioPlaylists => '音频播放列表';

  @override
  String get appearance => '外观';

  @override
  String get layout => '界面布局';

  @override
  String get theme => '主题外观';

  @override
  String get keyboard => '键盘快捷键';

  @override
  String get navButtons => '导航按钮';

  @override
  String get rendering => '渲染设置';

  @override
  String get mpvConfiguration => 'MPV 播放器参数';

  @override
  String get cardSize => '首页行卡片尺寸';

  @override
  String get externalPlayerApp => '外部播放器应用';

  @override
  String get externalPlayerAppDescription => '设置外部播放器以启用长按播放选项';

  @override
  String get externalPlayerAskEachTimeSubtitle => '播放开始时显示应用选择器。';

  @override
  String get loadingInstalledPlayers => '正在加载已安装的播放器...';

  @override
  String get connection => '连接';

  @override
  String get locallyDecodedCodecs => '本地解码的编解码器';

  @override
  String get transcodeTargetCodecs => '转码目标编解码器';

  @override
  String get passthrough => '直通';

  @override
  String get supportedOnThisDevice => '此设备支持';

  @override
  String get notSupportedOnThisDevice => '此设备不支持';

  @override
  String get mediaPlayerBehavior => '媒体播放器行为';

  @override
  String get playbackEnhancements => '播放增强功能';

  @override
  String get alwaysOn => '始终开启。';

  @override
  String get replaceSkipOutroWithNextUpDisplay => '用“接下来播放”替换“跳过片尾”';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      '显示“接下来播放”浮层，而不是“跳过片尾”按钮。';

  @override
  String get playerRouting => '播放器路由';

  @override
  String get preferSoftwareDecoders => '优先使用软件解码器';

  @override
  String get preferSoftwareDecodersSubtitle =>
      '优先使用 FFmpeg（音频）和 libgav1 (AV1)，再尝试硬件解码器。如果 HDMI 音频直通异常，请关闭此项。';

  @override
  String get hevcSoftwareDirectPlay => '直接播放 HEVC（软件解码）';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      '直接播放原始文件中的 HEVC 视频（最高 1080p），而不要求服务器转码。此 Apple TV 使用软件解码，因此高负载的 10 位或高码率文件可能卡顿。';

  @override
  String get av1SoftwareUhdDirectPlay => '直接播放 4K AV1（软件解码）';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      '直接播放原始文件中高于 1080p 的 AV1 视频（包括 HDR10），而不要求服务器转码。此设备使用软件解码 AV1，因此高负载的 4K 或高码率文件可能卡顿。';

  @override
  String get cadenceSlowdown => '在 60 Hz 电视上流畅播放 24 fps';

  @override
  String get cadenceSlowdownSubtitle =>
      '当“匹配帧率”关闭时，将 24 fps 视频放慢 0.1%，使其适配电视且不丢帧。当音频直通到功放时不使用此项。';

  @override
  String get cadenceTipTitle => '开启“匹配帧率”';

  @override
  String get cadenceTipMessage =>
      '此视频无法在你电视当前的刷新率下流畅播放。请在 Apple TV 上打开“设置”>“视频和音频”>“匹配内容”，然后开启“匹配帧率”。';

  @override
  String get cadenceTipSlowdownHint =>
      '或在 Moonfin 的“播放”>“画质与解码”下开启“在 60 Hz 电视上流畅播放 24 fps”。';

  @override
  String get useExternalPlayer => '始终使用外部播放器';

  @override
  String get useExternalPlayerSubtitle => '在 Android TV 上用你选择的外部应用打开视频播放。';

  @override
  String get externalPlayerLiveTvOnly => '仅限直播电视';

  @override
  String get externalPlayerLiveTvOnlySubtitle => '使用外部播放器播放直播电视，其余内容仍使用内置播放器。';

  @override
  String get automaticQueuing => '自动入队';

  @override
  String get preferSdhSubtitles => '优先使用 SDH 字幕';

  @override
  String get preferSdhSubtitlesSubtitle => '自动选择时优先选择 SDH/CC 字幕轨道。';

  @override
  String get preferTextSubtitles => '优先使用文本字幕';

  @override
  String get preferTextSubtitlesSubtitle =>
      '优先使用文本字幕（SRT、VTT），而非图片字幕格式（PGS、VobSub）。';

  @override
  String get preferExternalSubtitles => '优先使用外部字幕';

  @override
  String get preferExternalSubtitlesSubtitle => '优先使用外部字幕文件，而非内嵌字幕轨道。';

  @override
  String get webDiagnostics => 'Web 诊断';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web 诊断';

  @override
  String get webDiagnosticsIntro => '使用此页面可以诊断浏览器连接问题（CORS、混合内容和发现设置）。';

  @override
  String get webDiagnosticsDetectedMixedContentFailure => '检测到混合内容失败';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure => '检测到 CORS/预检失败';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin 检测到一个 HTTPS 页面试图调用 HTTP 服务器 URL。浏览器会在请求到达你的服务器之前阻止该请求。';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin 检测到浏览器请求失败，常见原因是媒体服务器缺少 CORS 或预检请求标头。';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return '目标 URL：$url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return '详情：$detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => '当前运行时上下文';

  @override
  String get webDiagnosticsOrigin => '来源';

  @override
  String get webDiagnosticsScheme => '方案';

  @override
  String get webDiagnosticsPluginMode => '插件模式';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC 扫描';

  @override
  String get webDiagnosticsForcedServerUrl => '强制服务器 URL';

  @override
  String get webDiagnosticsDefaultServerUrl => '默认服务器 URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => '发现代理 URL';

  @override
  String get notConfigured => '未配置';

  @override
  String get webDiagnosticsMixedContent => '混合内容';

  @override
  String get webDiagnosticsMixedContentDetected =>
      '此页面通过 HTTPS 加载，但有一个或多个配置的 URL 使用 HTTP。浏览器会阻止 HTTPS 页面调用 HTTP API。';

  @override
  String get webDiagnosticsMixedContentFix =>
      '修复：通过 HTTPS 为你的媒体服务器或代理端点提供服务，或仅在受信任的本地网络上通过 HTTP 加载 Moonfin。';

  @override
  String get webDiagnosticsNoMixedContentDetected => '从当前运行时设置中未检测到明显的混合内容配置。';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS 清单';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• 在 Access-Control-Allow-Origin 中允许浏览器来源。';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• 在 Access-Control-Allow-Headers 中包含 Authorization、X-Emby-Authorization 和 X-Emby-Token。';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• 公开 Content-Range 和 Accept-Ranges，以支持串流和跳转。';

  @override
  String get webDiagnosticsCorsChecklistItem4 => '• 对 OPTIONS 预检请求返回 204。';

  @override
  String get webDiagnosticsHeaderSnippetTitle => '示例标头片段（nginx 样式）';

  @override
  String get note => '备注';

  @override
  String get webDiagnosticsNonWebNote =>
      '此诊断页面面向 Web 构建。如果你在其他平台看到这些内容，检查结果可能不适用。';

  @override
  String get backToServerSelect => '返回服务器选择';

  @override
  String get signOutAllUsers => '退出所有用户登录';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      '麦克风权限被永久拒绝。请在系统设置中启用此权限。';

  @override
  String get voiceSearchPermissionRequired => '语音搜索需要麦克风权限。';

  @override
  String get voiceSearchNoMatch => '没听清，请重试。';

  @override
  String get voiceSearchNoSpeechDetected => '未检测到语音。';

  @override
  String get voiceSearchMicrophoneError => '麦克风错误。';

  @override
  String get voiceSearchNeedsInternet => '语音搜索需要互联网。';

  @override
  String get voiceSearchServiceBusy => '语音服务正忙，请重试。';

  @override
  String get microphonePermissionPermanentlyDenied => '麦克风权限被永久拒绝。';

  @override
  String get microphonePermissionDenied => '麦克风权限被拒绝。';

  @override
  String get speechRecognitionUnavailable => '此设备不支持语音识别。';

  @override
  String get openIosRoutePicker => '打开 iOS 路由选择器';

  @override
  String get airPlayRoutePickerUnavailable => '此设备上 AirPlay 路由选择器不可用。';

  @override
  String get videos => '视频';

  @override
  String get programs => '节目';

  @override
  String get songs => '歌曲';

  @override
  String get photoAlbums => '相册';

  @override
  String get photos => '照片';

  @override
  String get people => '人物';

  @override
  String get recentlyReleasedEpisodes => '最近发布的剧集';

  @override
  String get watchAgain => '再看一次';

  @override
  String get guestAppearances => '嘉宾亮相';

  @override
  String get appearancesSeerr => '出场作品（Seerr）';

  @override
  String get crewContributionsSeerr => '演职人员作品（Seerr）';

  @override
  String get personWebsite => '官方网站';

  @override
  String get watchWithGroup => '与播放组一起观看';

  @override
  String get watchPartyGroupSubtitles => '所有人共用字幕';

  @override
  String get watchPartyOwnSubtitles => '各自选择';

  @override
  String get watchPartyLobby => '在大厅中';

  @override
  String get watchPartyUpNextLabel => '接下来播放';

  @override
  String get watchPartyRoomSettings => '房间设置';

  @override
  String get watchPartyCodeOrLink => '房间码或邀请链接';

  @override
  String get watchPartyCopyInvite => '复制邀请链接';

  @override
  String get watchPartyInviteCopied => '邀请链接已复制';

  @override
  String get watchPartyLetEveryoneVote => '让大家一起投票选电影';

  @override
  String get watchPartyVoteHelp => '添加电影供大家投票，然后播放选中的那部。';

  @override
  String get watchPartyGuestVoteHelp => '为你想看的内容投票。房主会播放其中一部。';

  @override
  String get watchPartySearchMovies => '搜索电影';

  @override
  String get watchPartyNoSuggestions => '暂无可供投票的电影。';

  @override
  String get watchPartySuggested => '已加入观影派对投票';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 票',
      one: '$count 票',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => '观影派对';

  @override
  String get watchPartyUnavailable => '此服务器不支持观影派对。';

  @override
  String get watchPartyRoomCode => '房间码';

  @override
  String get watchPartyStart => '发起观影派对';

  @override
  String get watchPartyPickTitle => '打开一个媒体项并选择“与群组一起观看”，即可选择大家共同观看的内容。';

  @override
  String get watchPartyWaitingForHost => '正在等待房主选择内容。';

  @override
  String get watchPartyShareCode => '其他人可在观影派对界面输入此房间码加入。';

  @override
  String get watchPartyReconnecting => '正在重新连接…';

  @override
  String get watchPartyOffline => '离线';

  @override
  String get watchPartyStartForEveryone => '为所有人开始';

  @override
  String watchPartyResumeAt(String time) {
    return '从$time继续播放';
  }

  @override
  String get watchPartyStartFromBeginning => '从头开始';

  @override
  String watchPartyResumeWhere(String name) {
    return '从$name上次停止的位置开始，即此处所有人中最早到达的进度。';
  }

  @override
  String get watchPartyResumeEarliest => '此处所有人中最早到达的进度。';

  @override
  String get watchPartyResumeYours => '从你上次停止的位置开始。所有人都从此处开始。';

  @override
  String watchPartyResumeNotStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '还有 $count 人尚未开始。',
      one: '还有 $count 人尚未开始。',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyBackToLobby => '返回大厅';

  @override
  String get watchPartyGuestsCanPause => '访客可播放和暂停';

  @override
  String get watchPartyEnd => '为所有人结束';

  @override
  String get watchPartyEnded => '观影派对已结束。';

  @override
  String get watchPartyStaged => '已选入观影派对';

  @override
  String watchPartyUpNext(String title) {
    return '接下来播放：$title';
  }

  @override
  String get watchParties => '观影派对';

  @override
  String get watchPartyStartWith => '发起派对的方式';

  @override
  String get watchPartyServiceMoonbaseHint => '聊天、表情回应和投票。基于 Moonbase 运行。';

  @override
  String get watchPartyServiceSyncPlayHint =>
      'Jellyfin 自带。其他 Jellyfin 应用上的好友也可加入。';

  @override
  String get watchPartyServiceNote => '两种房间都可以加入。此处仅选择你发起的类型。';

  @override
  String get watchPartyDuringParty => '派对期间';

  @override
  String get watchPartyChatOverlay => '在视频上显示聊天';

  @override
  String get watchPartyChatOverlaySubtitle => '新消息会显示几秒钟';

  @override
  String get watchPartyAlerts => '派对提醒';

  @override
  String get watchPartyAlertsSubtitle => '当此服务器上有人发起派对时通知我';

  @override
  String get watchPartyJoinWithCode => '使用房间码加入';

  @override
  String get watchPartyOnThisServer => '在此服务器上';

  @override
  String watchPartyCountOnServer(int count) {
    return '此服务器上有 $count 个';
  }

  @override
  String get watchPartyRoomsHint => '你需要拥有该媒体项的访问权限才能加入。当最后一人离开时，房间会关闭。';

  @override
  String get watchPartyRoomsEmpty => '你可以观看的派对会显示在这里。拿到了别人的房间码？选择“使用房间码加入”。';

  @override
  String get watchPartyPasteHint =>
      '也可以在此粘贴邀请链接。在手机上，该链接会直接在 Moonfin 中打开并进入派对。';

  @override
  String watchPartyWatchingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 人正在观看',
      one: '$count 人正在观看',
    );
    return '$_temp0';
  }

  @override
  String watchPartyHostsParty(String name) {
    return '$name 的派对';
  }

  @override
  String get watchPartyEveryoneControlsShort => '所有人可控制';

  @override
  String get watchPartyVotingNow => '正在投票选择观看内容';

  @override
  String get watchPartyNeedsMoonbase => '观影派对需要此服务器安装 Moonbase';

  @override
  String get watchPartyNeedsMoonbaseHint =>
      '请联系服务器管理员安装 Moonbase 插件。在 Jellyfin 上，没有它 SyncPlay 仍可使用。';

  @override
  String get watchPartyWrongPin => 'PIN 码不正确。请重试。';

  @override
  String get watchPartyTooManyTries => '尝试次数过多。请稍后再试。';

  @override
  String get watchPartyFull => '该派对已满。';

  @override
  String get watchPartyNoSuchCode => '没有使用该房间码的房间。';

  @override
  String get watchPartyNoAccess => '你没有权限观看他们正在播放的内容。';

  @override
  String get watchPartyRemoved => '房主已将你移出派对。';

  @override
  String get watchPartyYours => '你的观影派对';

  @override
  String get watchPartyInviteHint =>
      '将其粘贴到任意聊天中即可。它会打开此服务器上的一个页面，其中带有“在 Moonfin 中打开”按钮。';

  @override
  String get watchPartySendInvite => '发送邀请';

  @override
  String get watchPartyScanInvite => '用手机扫描以获取邀请链接，然后从手机发送。或直接分享房间码。';

  @override
  String get watchPartyStartsTogether => '播放会等待所有人的播放器，最多 10 秒，然后倒数 3、2、1。';

  @override
  String get watchPartyStatusInSync => '已同步';

  @override
  String get watchPartyStatusCatchingUp => '正在追赶';

  @override
  String get watchPartyStatusBuffering => '正在缓冲';

  @override
  String get watchPartyStatusNotWatching => '未观看';

  @override
  String get watchPartyStatusReady => '已就绪';

  @override
  String get watchPartyStatusJoining => '正在加入';

  @override
  String get watchPartyHost => '房主';

  @override
  String watchPartyWaitingFor(String name) {
    return '正在等待 $name 的播放器';
  }

  @override
  String watchPartyWaitingForCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '正在等待 $count 个播放器',
      one: '正在等待 $count 个播放器',
    );
    return '$_temp0';
  }

  @override
  String watchPartyStartingAnyway(int seconds) {
    return '$seconds 秒后仍将开始';
  }

  @override
  String get watchPartyStartingTogether => '正在同时开始';

  @override
  String watchPartyToastPaused(String name) {
    return '$name 已暂停';
  }

  @override
  String watchPartyToastResumed(String name) {
    return '$name 已恢复播放';
  }

  @override
  String watchPartyToastSkipped(String name, String time) {
    return '$name 跳至 $time';
  }

  @override
  String watchPartyToastJoined(String name) {
    return '$name 已加入';
  }

  @override
  String watchPartyToastLeft(String name) {
    return '$name 已离开';
  }

  @override
  String watchPartyToastSwitched(String name, String title) {
    return '$name 已切换至 $title';
  }

  @override
  String get watchPartyToastYouAreHost => '你现在是房主';

  @override
  String watchPartyToastNewHost(String name) {
    return '$name 现在是房主';
  }

  @override
  String get watchPartyToastEveryoneControls => '现在所有人都可以控制播放';

  @override
  String get watchPartyToastHostControls => '现在只有房主可以控制播放';

  @override
  String get watchPartyOnlyHostControls => '只有房主可以控制播放。';

  @override
  String get watchPartyToastReconnecting => '正在重新连接到派对…';

  @override
  String get watchPartyToastReconnected => '已返回派对';

  @override
  String watchPartyToastEnded(String name) {
    return '$name 结束了派对';
  }

  @override
  String get watchPartyChat => '聊天';

  @override
  String get watchPartySendToParty => '发送到派对';

  @override
  String get watchPartyBackToClose => '返回以关闭';

  @override
  String get watchPartyType => '类型';

  @override
  String get watchPartyReplyHaha => '哈哈';

  @override
  String get watchPartyReplyNoWay => '不会吧';

  @override
  String get watchPartyReplyPausePlease => '请暂停';

  @override
  String get watchPartyReplyBrb => '马上回来';

  @override
  String get watchPartyReplyAgain => '再来一次！';

  @override
  String get watchPartyReactionLove => '喜欢';

  @override
  String get watchPartyReactionHaha => '哈哈';

  @override
  String get watchPartyReactionWow => '哇';

  @override
  String get watchPartyReactionSad => '难过';

  @override
  String get watchPartyReactionFire => '火';

  @override
  String get watchPartyReactionPopcorn => '爆米花';

  @override
  String get watchPartyMakeHost => '设为房主';

  @override
  String get watchPartyEveryoneControls => '所有人都可以控制播放';

  @override
  String get watchPartyEveryoneControlsHint => '任何人都可以播放、暂停和跳过';

  @override
  String get watchPartyRoomPin => '房间 PIN 码';

  @override
  String get watchPartyRoomPinHint => '在任何人加入前要求输入 PIN 码';

  @override
  String get watchPartyPinDigits => '4 到 8 位数字';

  @override
  String get watchPartyLeave => '离开';

  @override
  String watchPartyLeaveHandsOver(String name) {
    return '离开 · $name 接管房主';
  }

  @override
  String watchPartyStartedBy(String name) {
    return '$name 发起了一场观影派对';
  }

  @override
  String watchPartyInLobbyCount(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$title · 大厅中有 $count 人',
      one: '$title · 大厅中有 $count 人',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyFirstOnHome => '它在首页的观影派对中排在第一位';

  @override
  String watchPartyAddServerQuestion(String address) {
    return '此邀请来自你尚未添加的服务器 $address。请添加并登录该服务器后加入。';
  }

  @override
  String get disk => '磁盘';

  @override
  String get openInBrowser => '在浏览器中打开';

  @override
  String get achievementBadges => '成就徽章';

  @override
  String get achievementBadgesSubtitle => '通过观看内容获得的徽章、等级和任务';

  @override
  String get achievementsBadges => '徽章';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked / $total 个徽章';
  }

  @override
  String get achievementsUnlockToasts => '解锁通知';

  @override
  String get achievementsUnlockToastsSubtitle => '解锁徽章时显示通知';

  @override
  String get achievementsUnlockedNotification => '成就已解锁';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已解锁 $count 个成就',
      one: '已解锁 $count 个成就',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count 个';
  }

  @override
  String get achievementsQuests => '任务';

  @override
  String achievementsQuestCount(int count) {
    return '已完成 $count 个';
  }

  @override
  String get achievementsLeaderboard => '排行榜';

  @override
  String get achievementsLeaderboardSubtitle => '你与此服务器上其他用户的对比';

  @override
  String get achievementsRecap => '回顾';

  @override
  String get achievementsRecapSubtitle => '你最近观看的内容';

  @override
  String get achievementsLibraryCompletion => '媒体库完成度';

  @override
  String achievementsLibraryCount(int count) {
    return '$count 个媒体库';
  }

  @override
  String achievementsScore(int score) {
    return '$score 分';
  }

  @override
  String get achievementsScoreLabel => '积分';

  @override
  String get achievementsTopRank => '达到的最高等级';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '距离 $tier 还需 $points 分';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '连续 $days 天';
  }

  @override
  String achievementsBestStreak(int days) {
    return '最佳：$days 天';
  }

  @override
  String get achievementsShowcase => '展示柜';

  @override
  String get achievementsUnlocked => '已解锁';

  @override
  String get achievementsLocked => '未解锁';

  @override
  String get achievementsNothingHere => '这里还没有内容。';

  @override
  String get achievementsHiddenBadge => '隐藏成就';

  @override
  String achievementsUnlockedOn(String date) {
    return '于 $date 解锁';
  }

  @override
  String achievementsPoints(int points) {
    return '$points 分';
  }

  @override
  String get achievementsDailyQuests => '每天';

  @override
  String get achievementsWeeklyQuests => '每周';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => '重掷每日任务';

  @override
  String get achievementsRerollWeekly => '重掷每周任务';

  @override
  String get achievementsRerollOffer => '将这组任务换成另一组';

  @override
  String get achievementsRerollSpentDaily => '今日已使用，将在 UTC 时间午夜恢复';

  @override
  String get achievementsRerollSpentWeekly => '本周已使用，将在 UTC 时间周一恢复';

  @override
  String get achievementsRerollConfirm => '重掷这些任务？';

  @override
  String get achievementsRerollConfirmBody => '你每天和每周各有一次重掷机会，本次将消耗其中一次。';

  @override
  String get achievementsRerollFailed => '无法重掷这些任务。';

  @override
  String get achievementsSuggested => '推荐观看的媒体项';

  @override
  String get achievementsNoSuggestions => '此徽章暂无推荐内容。';

  @override
  String get achievementsProgressLabel => '进度';

  @override
  String get achievementsLoadout => '装备';

  @override
  String get achievementsLoadoutSubtitle => '可用积分与持有的增益';

  @override
  String get achievementsAppearance => '外观';

  @override
  String get achievementsAppearanceSubtitle => '个人资料上的头像和称号';

  @override
  String get achievementsAvatars => '头像';

  @override
  String get achievementsTitles => '作品';

  @override
  String get achievementsEquipped => '已装备';

  @override
  String get achievementsOwned => '已拥有';

  @override
  String achievementsEarnedAt(int score) {
    return '累计积分达到 $score 时获得';
  }

  @override
  String get achievementsAppearanceEmpty => '此服务器上没有可使用的头像或称号。';

  @override
  String get achievementsAppearanceFailed => '无法更改个人资料的外观。';

  @override
  String get achievementsPowerUps => '增益道具';

  @override
  String get achievementsStats => '统计';

  @override
  String get achievementsStatsSubtitle => '你的纪录和服务器的整体情况';

  @override
  String get achievementsStatsWatched => '已观看';

  @override
  String get achievementsStatsBests => '最佳纪录';

  @override
  String get achievementsStatsHabits => '观看习惯';

  @override
  String get achievementsStatsVariety => '多样性';

  @override
  String get achievementsStatsServer => '此服务器';

  @override
  String get achievementsStatsClock => '观看时间';

  @override
  String get achievementsStatItems => '已观看媒体项';

  @override
  String get achievementsStatMovies => '已观看电影';

  @override
  String get achievementsStatSeries => '已看完剧集';

  @override
  String get achievementsStatHours => '观看小时数';

  @override
  String get achievementsStatDays => '观看天数';

  @override
  String get achievementsStatRewatches => '重看次数';

  @override
  String get achievementsStatBestWatchStreak => '最长连续观看天数';

  @override
  String get achievementsStatBestLoginStreak => '最长连续登录天数';

  @override
  String get achievementsStatMostEpisodes => '单日最多观看集数';

  @override
  String get achievementsStatMostMovies => '单日最多观看电影数';

  @override
  String get achievementsStatLongestItem => '时长最长的媒体项';

  @override
  String get achievementsStatBestCombo => '最佳连击';

  @override
  String get achievementsStatLateNight => '深夜场次';

  @override
  String get achievementsStatEarlyMorning => '清晨场次';

  @override
  String get achievementsStatWeekend => '周末场次';

  @override
  String get achievementsStatDaysSignedIn => '登录天数';

  @override
  String get achievementsStatLibraries => '访问过的媒体库';

  @override
  String get achievementsStatGenres => '观看过的类型';

  @override
  String get achievementsStatDecades => '观看过的年代';

  @override
  String get achievementsStatCountries => '观看过的国家';

  @override
  String get achievementsStatLanguages => '观看过的语言';

  @override
  String get achievementsStatUsers => '用户';

  @override
  String get achievementsStatBadgesUnlocked => '已解锁徽章';

  @override
  String get achievementsStatScoreEarned => '已获得积分';

  @override
  String get achievementsStatCommonBadge => '最常见的徽章';

  @override
  String get achievementsActivity => '活动';

  @override
  String get achievementsActivitySubtitle => '服务器上最近解锁的内容';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user 解锁了 $badge';
  }

  @override
  String get achievementsShop => '商店';

  @override
  String get achievementsShopSubtitle => '用积分兑换更多增益道具';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => '当前暂无商品出售。';

  @override
  String get achievementsBuyConfirm => '购买此商品？';

  @override
  String get achievementsBuyConfirmBody => '费用将直接从你的积分账户中扣除。';

  @override
  String get achievementsBuyFailed => '无法购买该商品。';

  @override
  String get achievementsScoreBank => '积分账户';

  @override
  String get achievementsBoost => '经验加成';

  @override
  String get achievementsBoostBody => '积分翻倍，持续一小时。再次使用会重新计算这一小时。';

  @override
  String get achievementsDoubleCredit => '双倍积分';

  @override
  String get achievementsDoubleCreditBody => '你下一次完成的内容将按两倍计入徽章进度。';

  @override
  String get achievementsStreakFreeze => '连续天数冻结';

  @override
  String get achievementsStreakFreezeBody => '可抵消一天未观看。最多储备一个。';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '持有 $count 个',
      one: '持有 1 个',
      zero: '未持有',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => '生效中';

  @override
  String get achievementsUsePowerUp => '使用此增益道具？';

  @override
  String get achievementsUsePowerUpBody => '确认后将立即消耗。';

  @override
  String get achievementsPowerUpFailed => '无法使用该增益道具。';

  @override
  String get achievementsHours => '小时';

  @override
  String get achievementsStreak => '连续天数';

  @override
  String get achievementsPeriodWeek => '周';

  @override
  String get achievementsPeriodMonth => '月';

  @override
  String get achievementsPeriodYear => '年份';

  @override
  String achievementsDaysWatched(int count) {
    return '已观看 $count 天';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '已获得 $count 个徽章';
  }

  @override
  String get achievementsTopDirectors => '最常观看的导演';

  @override
  String get achievementsTopActors => '最常观看的演员';

  @override
  String get achievementsLoadFailed => '无法加载你的成就。';

  @override
  String get friends => '好友';

  @override
  String get friendsSubtitle => '查看谁在线，并与此服务器上的用户聊天';

  @override
  String get friendsShowButton => '显示好友按钮';

  @override
  String get friendsShowButtonSubtitle => '来自 Achievement Badges 插件的好友与聊天功能';

  @override
  String get friendsMessages => '服务器消息';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条未读消息',
      one: '1 条未读消息',
      zero: '暂无未读消息',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => '好友请求';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条待处理请求',
      one: '1 条待处理请求',
      zero: '暂无待处理请求',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => '添加好友';

  @override
  String get friendsAddSubtitle => '在此服务器上查找用户';

  @override
  String get friendsPrivacy => '隐私';

  @override
  String get friendsPrivacySubtitle => '你的好友可以看到的内容';

  @override
  String get friendsOnline => '在线';

  @override
  String get friendsOffline => '离线';

  @override
  String get friendsNone => '还没有好友。添加此服务器上的用户后，他们会显示在这里。';

  @override
  String friendsWatching(String title) {
    return '正在观看 $title';
  }

  @override
  String friendsLastWatched(String title) {
    return '最近观看 $title';
  }

  @override
  String friendsLastSeen(String time) {
    return '上次在线 $time';
  }

  @override
  String get friendsLoadFailed => '无法加载。请检查网络连接后重试。';

  @override
  String get friendsActionFailed => '操作失败。请稍后重试。';

  @override
  String get friendsIncoming => '等待你处理';

  @override
  String get friendsOutgoing => '由你发出';

  @override
  String get friendsNoRequests => '暂无好友请求。';

  @override
  String get friendsAccept => '接受';

  @override
  String get friendsDecline => '拒绝';

  @override
  String get friendsCancelRequest => '取消请求';

  @override
  String friendsRequestFrom(String name) {
    return '$name 想添加你为好友';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return '要撤回你发送给 $name 的请求吗？';
  }

  @override
  String get friendsSearchHint => '搜索用户';

  @override
  String get friendsNoMatches => '没有找到与该名称匹配的用户。';

  @override
  String friendsRequestSent(String name) {
    return '已向 $name 发送请求';
  }

  @override
  String get friendsSendRequest => '添加为好友';

  @override
  String get friendsSendMessage => '发送消息';

  @override
  String friendsOpenItem(String title) {
    return '打开 $title';
  }

  @override
  String get friendsRemove => '移除好友';

  @override
  String friendsRemoveBody(String name) {
    return '要将 $name 从好友中移除吗？之后可以重新添加。';
  }

  @override
  String get friendsBlock => '屏蔽';

  @override
  String get friendsUnblock => '取消屏蔽';

  @override
  String friendsBlockBody(String name) {
    return '要屏蔽 $name 吗？你们将无法再直接互发消息，但共同的群聊仍会保留。';
  }

  @override
  String friendsUnblockBody(String name) {
    return '要取消屏蔽 $name 吗？';
  }

  @override
  String get friendsBlocked => '已屏蔽用户';

  @override
  String friendsProfileHidden(String name) {
    return '$name 的个人资料设为私密。';
  }

  @override
  String get friendsAppearOffline => '显示为离线';

  @override
  String get friendsAppearOfflineSubtitle => '好友始终看到你处于离线状态';

  @override
  String get friendsHideNowPlaying => '隐藏正在观看的内容';

  @override
  String get friendsHideNowPlayingSubtitle => '好友仍能看到你在线，但看不到你正在播放的内容';

  @override
  String get friendsHideLastWatched => '隐藏最近观看记录';

  @override
  String get friendsHideLastWatchedSubtitle => '离线时，好友看不到你最近观看的内容';

  @override
  String get friendsMessageNotifications => '消息通知';

  @override
  String get friendsMessageNotificationsSubtitle => '好友发来消息时显示横幅通知';

  @override
  String get friendsMuteDuringPlayback => '播放时静音';

  @override
  String get friendsMuteDuringPlaybackSubtitle => '播放视频或游戏时不显示消息横幅';

  @override
  String get friendsSaveFailed => '无法保存设置。';

  @override
  String get chatNew => '新消息';

  @override
  String get chatNewSubtitle => '与好友开始聊天';

  @override
  String get chatNewGroup => '新建群组';

  @override
  String get chatNewGroupSubtitle => '与多位好友同时聊天';

  @override
  String get chatNone => '暂无消息。';

  @override
  String get chatYou => '你';

  @override
  String chatYouSaid(String text) {
    return '你：$text';
  }

  @override
  String get chatPhoto => '图片';

  @override
  String get chatEmoji => '表情符号';

  @override
  String get chatEmojiSearch => '搜索表情符号';

  @override
  String get chatNoRecentEmoji => '暂无最近使用的表情符号';

  @override
  String get chatViewPhoto => '查看图片';

  @override
  String get chatHint => '输入消息';

  @override
  String get chatAttach => '发送图片';

  @override
  String get chatEdited => '已编辑';

  @override
  String get chatSeen => '已读';

  @override
  String get chatSent => '已发送';

  @override
  String get chatEditing => '正在编辑消息';

  @override
  String get chatMessageOptions => '消息选项';

  @override
  String get chatDeleteBody => '要对所有人删除这条消息吗？';

  @override
  String get chatClear => '清空对话';

  @override
  String get chatClearBody => '要对群内所有人删除此聊天中的全部消息吗？';

  @override
  String get chatGroupInfo => '群组信息';

  @override
  String get chatGroupName => '播放组名称';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位成员',
      one: '1 位成员',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => '群主';

  @override
  String get chatAdmin => '管理员';

  @override
  String get chatMakeAdmin => '设为管理员';

  @override
  String get chatRemoveAdmin => '撤销管理员';

  @override
  String get chatRemoveMember => '移出群组';

  @override
  String get chatAddMember => '添加成员';

  @override
  String get chatNobodyToAdd => '没有可添加的用户了。';

  @override
  String get chatLeave => '离开播放组';

  @override
  String get chatLeaveBody => '要退出此群组吗？之后需要有人重新添加你才能再次加入。';

  @override
  String get chatCreate => '创建播放组';

  @override
  String get chatPickMembers => '至少选择两位好友';

  @override
  String chatNewMessageFrom(String name) {
    return '收到 $name 的新消息';
  }

  @override
  String get chatImageTooLarge => '该图片超过 8 MB。';

  @override
  String get chatImageUnsupported => '只能发送 PNG、JPEG、GIF 和 WebP 格式的图片。';

  @override
  String get embeddedBrowserNotAvailable => '嵌入式浏览器在此平台上不可用。';

  @override
  String get adminRestartServerConfirmation => '确定要重启服务器吗？';

  @override
  String get adminShutdownServerConfirmation => '确定要关闭服务器吗？之后需要手动重启服务器。';

  @override
  String get internal => '内部';

  @override
  String get idle => '空闲';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => '未找到用户';

  @override
  String get adminNoUsersMatchSearch => '没有用户符合搜索条件';

  @override
  String get adminNoDevicesFound => '未找到设备';

  @override
  String get adminNoDevicesMatchCurrentFilters => '没有设备符合当前筛选条件';

  @override
  String get remoteAccess => '远程访问';

  @override
  String get localOnly => '仅限本地';

  @override
  String get adminMediaAnalyticsLoadFailed => '无法加载媒体分析';

  @override
  String get analyticsCombinedAcrossLibraries => '跨所有媒体库的综合分析。';

  @override
  String get analyticsTopArtists => '热门艺人';

  @override
  String get analyticsTopAuthors => '热门作者';

  @override
  String get analyticsTopContributors => '热门贡献者';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个媒体库',
      one: '1 个媒体库',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals => '此选择尚无已索引的媒体总数。';

  @override
  String get analyticsLibraryDetails => '媒体库详情';

  @override
  String get analyticsLibraryBreakdown => '媒体库细分';

  @override
  String get analyticsNoLibrariesAvailable => '没有可用的媒体库。';

  @override
  String get analyticsLibraryShare => '各媒体库的媒体项占比';

  @override
  String get analyticsTopRating => '最常见的分级';

  @override
  String get analyticsTypicalRuntime => '常见时长';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent% 的媒体项';
  }

  @override
  String get adminServerAdministrationTitle => '服务器管理';

  @override
  String get adminServerPathData => '数据';

  @override
  String get adminServerPathImageCache => '图片缓存';

  @override
  String get adminServerPathCache => '缓存';

  @override
  String get adminServerPathLogs => '日志';

  @override
  String get adminServerPathMetadata => '元数据';

  @override
  String get adminServerPathTranscode => '转码';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => '此服务器未返回服务器路径。';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% 已使用';
  }

  @override
  String get userActivity => '用户活动';

  @override
  String get systemEvents => '系统事件';

  @override
  String get needsAttention => '需要处理';

  @override
  String get homeVideos => '家庭视频';

  @override
  String get mixedContent => '混合内容';

  @override
  String get homeVideosAndPhotos => '家庭视频和照片';

  @override
  String get mixedMoviesAndShows => '电影和剧集混合';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => '未找到录制内容';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension 存档内未找到图片页面。';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return '嵌入式渲染器出错（$code）：$description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB 渲染器出错（$code）：$description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return '阅读器缺少本地文件：$uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '从 $uri 打开图书数据时 HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable => '没有可读取的图书端点';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return '不支持的漫画存档格式：.$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable => 'CBR 提取插件在此平台上不可用。';

  @override
  String get failedToExtractCbrArchive => '无法提取 .cbr 存档。';

  @override
  String get cb7ExtractionUnavailable => 'CB7 提取在此平台上不可用。';

  @override
  String get cb7ExtractionPluginUnavailable => 'CB7 提取插件在此平台上不可用。';

  @override
  String get loadingShuffle => '正在加载随机内容...';

  @override
  String get libraryShuffleLabel => '媒体库随机播放';

  @override
  String get randomShuffleLabel => '随机播放';

  @override
  String get genresShuffleLabel => '按类型随机播放';

  @override
  String get autoHdrSwitching => '自动 HDR 切换';

  @override
  String get autoHdrSwitchingDescription => '播放 HDR 视频时自动启用 HDR，并在退出后恢复显示模式。';

  @override
  String get whenFullscreen => '全屏时';

  @override
  String get changeArtwork => '更换艺术图';

  @override
  String get missing => '缺失';

  @override
  String get clearAllArtworkButton => '清除所有艺术图？';

  @override
  String get clearAllArtworkWarning => '确定要清除所有已下载艺术图吗？';

  @override
  String get confirmClear => '确认清除';

  @override
  String confirmClearMessage(String itemType) {
    return '确定要清除$itemType吗？';
  }

  @override
  String get uploadButton => '上传？';

  @override
  String get resolutionLabel => '分辨率： ';

  @override
  String get onlyShowInterfaceLanguage => '仅显示界面语言对应的艺术图';

  @override
  String get confirmClearAll => '确认全部清除';

  @override
  String get imageUploadSuccess => '图片上传成功！';

  @override
  String imageUploadFailed(String error) {
    return '图片上传失败：$error';
  }

  @override
  String imageDownloadFailed(String error) {
    return '设置图片失败：$error';
  }

  @override
  String imageDeleteFailed(String error) {
    return '删除图片失败：$error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return '清除所有艺术图失败：$error';
  }

  @override
  String get yes => '是';

  @override
  String get posterCategory => '海报';

  @override
  String get backdropsCategory => '背景图';

  @override
  String get bannerCategory => '横幅';

  @override
  String get logoCategory => '徽标';

  @override
  String get thumbnailCategory => '缩略图';

  @override
  String get artCategory => '艺术图';

  @override
  String get discArtCategory => '光盘图';

  @override
  String get screenshotCategory => '截图';

  @override
  String get boxCoverCategory => '盒装封面';

  @override
  String get boxRearCoverCategory => '盒装背面';

  @override
  String get menuArtCategory => '菜单图';

  @override
  String get confirmItemPoster => '海报';

  @override
  String get confirmItemBackdrop => '背景图';

  @override
  String get confirmItemBanner => '横幅';

  @override
  String get confirmItemLogo => '徽标';

  @override
  String get confirmItemThumbnail => '缩略图';

  @override
  String get confirmItemArt => '艺术图';

  @override
  String get confirmItemDiscArt => '光盘图';

  @override
  String get confirmItemScreenshot => '截图';

  @override
  String get confirmItemBoxCover => '盒装封面';

  @override
  String get confirmItemBoxRearCover => '盒装背面';

  @override
  String get confirmItemMenuArt => '菜单图';

  @override
  String get resolutionAll => '全部';

  @override
  String get resolutionHigh => '高（1080p+）';

  @override
  String get resolutionMedium => '中（720p）';

  @override
  String get resolutionLow => '低（低于 720p）';

  @override
  String get sources => '来源';

  @override
  String get audiobookChapters => '章节';

  @override
  String get audiobookBookmarks => '书签';

  @override
  String get audiobookNotes => '笔记';

  @override
  String get audiobookQueue => '队列';

  @override
  String get audiobookTimeline => '时间轴';

  @override
  String get audiobookTimelineEmpty => '时间轴为空';

  @override
  String get audiobookFocusedTimeline => '聚焦时间轴';

  @override
  String get audiobookFullTimeline => '完整时间线';

  @override
  String get audiobookExportBookmarks => '导出书签';

  @override
  String get audiobookExportNotes => '导出笔记';

  @override
  String get audiobookExportAll => '导出全部';

  @override
  String audiobookExportSuccess(String path) {
    return '已导出到 $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return '导出失败：$error';
  }

  @override
  String get audiobookLyrics => '歌词';

  @override
  String get audiobookAddBookmark => '添加书签';

  @override
  String get audiobookAddNote => '添加笔记';

  @override
  String get audiobookEditNote => '编辑笔记';

  @override
  String get audiobookNoteHint => '为此刻写一条笔记';

  @override
  String get audiobookSleepTimer => '睡眠定时';

  @override
  String get audiobookSleepOff => '关闭';

  @override
  String get audiobookSleepEndOfChapter => '章节结束';

  @override
  String get audiobookSleepCustom => '自定义';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '剩余 $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分钟',
      one: '1 分钟',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => '播放速度';

  @override
  String get audiobookRemainingTime => '剩余时间';

  @override
  String get audiobookElapsedTime => '已播放';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '后退 $seconds秒';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '前进 $seconds秒';
  }

  @override
  String get audiobookPreviousChapter => '上一章';

  @override
  String get audiobookNextChapter => '下一章';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '第 $current / $total 章';
  }

  @override
  String get audiobookNoChapters => '无章节';

  @override
  String get audiobookNoBookmarks => '还没有书签';

  @override
  String get audiobookNoNotes => '还没有笔记';

  @override
  String audiobookBookmarkAdded(String position) {
    return '已在 $position 添加书签';
  }

  @override
  String get audiobookSpeedReset => '重置为 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => '保存';

  @override
  String get audiobookCancel => '取消';

  @override
  String get audiobookDelete => '删除';

  @override
  String get subtitlePreferencesDescription => '自定义字幕模式、默认语言、外观样式与渲染参数。';

  @override
  String get subtitleRendering => '字幕渲染';

  @override
  String get displayOptions => '显示选项';

  @override
  String get releaseDateAscending => '上映日期（升序）';

  @override
  String get releaseDateDescending => '上映日期（降序）';

  @override
  String get groupContributions => '作品分组';

  @override
  String get groupMultipleRoles => '合并同一人员多角色作品';

  @override
  String get libraryWriteAccessWarningTitle => '媒体库写入权限警告';

  @override
  String get libraryWriteAccessHowToFix => '解决方法：';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. 在服务器上为媒体库文件夹授予 Jellyfin 服务账号写入权限（Docker 环境需配置正确 PUID/PGID）。\n\n2. 或前往 Jellyfin 控制台-媒体库，编辑当前媒体库，关闭「将艺术图保存至媒体文件夹」，艺术图将统一存储在 Jellyfin 内置数据库中。';

  @override
  String get dismiss => '忽略';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '您的“$libraryName”媒体库已开启「将艺术图保存至媒体文件夹」，但 Jellyfin 检测发现无权限写入以下目录：\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin 艺术图更新失败。当前媒体库设置为直接将艺术图存入媒体文件夹，该报错通常是 Jellyfin 服务进程缺少媒体目录写入权限导致。';

  @override
  String get replay => '重播';

  @override
  String get fileInformation => '文件信息';

  @override
  String fileSizeFormat(Object size, Object format) {
    return '大小：$size  •  格式：$format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return '添加日期：$date';
  }

  @override
  String showAllAudioTracks(int count) {
    return '显示全部 ($count) 音轨';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return '显示全部 ($count) 字幕轨道';
  }

  @override
  String get checkingDirectPlay => '正在检查直接播放能力...';

  @override
  String get directPlayCapabilityLabel => '直接播放能力： ';

  @override
  String get forced => '强制';

  @override
  String get transcodeContainerNotSupported => '容器格式不受播放器支持。';

  @override
  String get transcodeVideoCodecNotSupported => '视频编解码器不受支持。';

  @override
  String get transcodeAudioCodecNotSupported => '音频编解码器不受支持。';

  @override
  String get transcodeSubtitleCodecNotSupported => '字幕格式不受支持（需要烧录）。';

  @override
  String get transcodeAudioProfileNotSupported => '音频配置文件不受支持。';

  @override
  String get transcodeVideoProfileNotSupported => '视频配置文件不受支持。';

  @override
  String get transcodeVideoLevelNotSupported => '视频级别不受支持。';

  @override
  String get transcodeVideoResolutionNotSupported => '视频分辨率不受此设备支持。';

  @override
  String get transcodeVideoBitDepthNotSupported => '视频位深不受支持。';

  @override
  String get transcodeVideoFramerateNotSupported => '视频帧率不受支持。';

  @override
  String get transcodeContainerBitrateExceedsLimit => '文件码率超过播放器串流限制。';

  @override
  String get transcodeVideoBitrateExceedsLimit => '视频码率超过串流限制。';

  @override
  String get transcodeAudioBitrateExceedsLimit => '音频码率超过串流限制。';

  @override
  String get transcodeAudioChannelsNotSupported => '音频声道数不受支持。';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return '音频编解码器（$codec）不受直接支持。';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return '提示：如果你的音频接收器或回音壁支持 $codec，请在音频设置中启用“音频直通”。';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return '音频声道数（$channels 声道）超过播放器上限。';
  }

  @override
  String get transcodeAudioChannelsHint => '提示：请在音频设置中调整“最大音频声道数”或多声道缩混。';

  @override
  String get transcodeSubtitleBurnInAssDisabled => '由于已关闭直接播放，ASS/SSA 字幕需要转码。';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      '提示：请在播放设置中启用“ASS/SSA 直接播放”，即可无需转码直接播放。';

  @override
  String get transcodeSubtitleBurnInPgsDisabled => '由于已关闭直接播放，PGS 字幕需要转码。';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      '提示：请在播放设置中启用“PGS 直接播放”，即可无需转码直接播放。';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return '不直接支持字幕格式（$codec），必须将其压制到画面中。';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return '文件码率（$fileBitrate）超过配置的串流上限（$maxBitrate）。';
  }

  @override
  String get transcodeBitrateHint => '提示：请在播放设置中提高“最大串流码率”，以允许直接串流。';

  @override
  String get transcodeResolutionHint => '提示：请在播放设置中提高“最大分辨率”，以允许直接串流。';

  @override
  String get transcodeVideoRangeNotSupported =>
      '此显示屏不支持视频动态范围（如 Dolby Vision / HDR）。';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      '已禁用 Dolby Vision Profile 7 增强层直接播放。';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      '提示：如果你的显示屏支持，请在播放设置中启用“Dolby Vision Profile 7 直接播放”。';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      '根据用户设置，Dolby Vision 回退时优先使用转码。';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      '提示：请在播放设置中将“Dolby Vision 回退”设为“按 HDR10 播放”，以避免转码。';

  @override
  String get transcodeDisplayReportsNoHdr => '连接的显示屏未报告支持 HDR 或 Dolby Vision。';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      '连接的显示屏不支持 Dolby Vision 回退所需的 HDR10。';

  @override
  String get transcodeAudioSampleRateNotSupported => '不支持音频采样率。';

  @override
  String get transcodeAudioBitDepthNotSupported => '不支持音频位深。';

  @override
  String get transcodeRefFramesNotSupported => '视频参考帧数超过播放器上限。';

  @override
  String get transcodeAnamorphicVideoNotSupported => '不支持变形宽银幕视频。';

  @override
  String get transcodeInterlacedVideoNotSupported => '不支持隔行扫描视频。';

  @override
  String get transcodeSecondaryAudioNotSupported => '次要音频流需要转码。';

  @override
  String get transcodeDirectPlayError => '此媒体格式不支持直接播放。';

  @override
  String get sortServerOrder => '服务器顺序';

  @override
  String get sortAlphabetical => '字母顺序';

  @override
  String get sortReleaseAscending => '发行顺序（升序）';

  @override
  String get sortReleaseDescending => '发行顺序（降序）';

  @override
  String get sortCustomDragDrop => '自定义（拖放）';

  @override
  String sortCurrent(String option) {
    return '排序：$option';
  }

  @override
  String get playlistSortOptions => '播放列表排序选项';

  @override
  String get resetSort => '重置排序';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return '重播 S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => '重播播放列表';

  @override
  String get noSubtitlesFound => '未找到字幕。';

  @override
  String get adminControls => '管理控制';

  @override
  String get impellerRendering => '渲染引擎（Impeller）';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller 是 Flutter 的现代 GPU 渲染器，可实现更流畅的动画和更少的卡顿。在某些电视盒子和旧款 GPU 上可能会导致故障或黑屏；如果遇到这些问题，请将其关闭。自动会为你的设备选择最佳默认值。重启 Moonfin 以应用。';

  @override
  String get impellerAuto => '自动';

  @override
  String get impellerOn => '开启';

  @override
  String get impellerOff => '关闭';

  @override
  String get impellerRestartTitle => '需要重启';

  @override
  String get impellerRestartMessage =>
      'Moonfin 需要重启以更改渲染引擎。立即关闭应用，然后重新打开以应用更改。';

  @override
  String get impellerCloseNow => '立即关闭应用';

  @override
  String get adminRefreshLibrary => '刷新媒体库';

  @override
  String get adminRefreshAllLibraries => '刷新所有媒体库';

  @override
  String get adminRepoSortDateOldest => '添加日期（最旧优先）';

  @override
  String get adminRepoSortDateNewest => '添加日期（最新优先）';

  @override
  String get adminRepoSortNameAsc => '字母顺序（A 到 Z）';

  @override
  String get adminRepoSortNameDesc => '字母顺序（Z 到 A）';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return '正在加载服务器分析... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => '匹配源';

  @override
  String get imdbTop250Movies => 'IMDb Top250 电影';

  @override
  String get imdbTop250TvShows => 'IMDb Top250 电视剧';

  @override
  String get imdbMostPopularMovies => 'IMDb 热门电影榜单';

  @override
  String get imdbMostPopularTvShows => 'IMDb 热门电视剧榜单';

  @override
  String get imdbLowestRatedMovies => 'IMDb 低分电影榜单';

  @override
  String get imdbTopEnglishMovies => 'IMDb 高分英语电影';

  @override
  String get addToWatchlist => '加入观看清单';

  @override
  String get removeFromWatchlist => '从观看清单移除';

  @override
  String get watchlistUpdateFailed => '观看清单更新失败';

  @override
  String get adminSearchParameters => '搜索参数';

  @override
  String get adminCurrentMetadata => '当前元数据';

  @override
  String get adminLabelYear => '年份';

  @override
  String get adminReplaceImages => '替换现有图片';

  @override
  String get adminBackToSearch => '返回搜索条件';

  @override
  String get grouping => '分组';

  @override
  String get groupByType => '按类型分组';

  @override
  String get playlistTypes => '播放列表类型';

  @override
  String get playlistTypeVideo => '视频';

  @override
  String get playlistTypeMusicVideo => '音乐视频';

  @override
  String get playlistTypeAudio => '音频（音乐）';

  @override
  String get playlistTypeAudiobook => '有声书';

  @override
  String get playlistTypeBook => '书';

  @override
  String get playlistTypePhoto => '图片';

  @override
  String get playlistTypeMixed => '混合';

  @override
  String get videoPlaylistsSection => '视频播放列表';

  @override
  String get musicVideoPlaylistsSection => '音乐视频播放列表';

  @override
  String get audioPlaylistsSection => '音频播放列表';

  @override
  String get audiobookPlaylistsSection => '有声书播放列表';

  @override
  String get bookPlaylistsSection => '书籍播放列表';

  @override
  String get photoPlaylistsSection => '图片播放列表';

  @override
  String get mixedPlaylistsSection => '混合播放列表';

  @override
  String get currentTime => '当前时间';

  @override
  String get playbackTimeDisplay => '进度条时间';

  @override
  String get settingsPlaybackTimeDisplayDescription => '选择播放进度条周围显示的时间标签。';

  @override
  String get playbackTimeTotal => '总时长';

  @override
  String get playbackTimeRemaining => '剩余时间';

  @override
  String get playbackTimeEndsAt => '结束于';

  @override
  String get playbackTimeElapsed => '已播时间';

  @override
  String get playbackTimeVideoSection => '视频播放';

  @override
  String get playbackTimeMusicSection => '音乐播放';

  @override
  String get playbackTimeSlotDescription => '选择显示此处显示的内容，或将其隐藏。';

  @override
  String get playbackTimeAboveBarLeft => '上方栏，左侧';

  @override
  String get playbackTimeAboveBarCenter => '上方栏，居中';

  @override
  String get playbackTimeAboveBarRight => '上方栏，右侧';

  @override
  String get playbackTimeBelowBarLeft => '下方栏，左侧';

  @override
  String get playbackTimeBelowBarCenter => '下方栏，居中';

  @override
  String get playbackTimeBelowBarRight => '下方栏，右侧';

  @override
  String get settingsMusicPlaybackTimeDescription => '选择音乐进度条右侧显示的内容。';

  @override
  String get groupByTitle => '按分组';

  @override
  String get groupByDecade => '十年（年）';

  @override
  String get groupByParentalRating => '家长评级';

  @override
  String get groupByStudio => '制片公司';

  @override
  String get showAlphabeticalFilters => '显示字母表';

  @override
  String get libraryFolderView => '文件夹视图';

  @override
  String get personalRatingStyle => '个人评分样式';

  @override
  String get personalRatingThumbs => '喜欢 / 不喜欢';

  @override
  String get personalRatingStars => '5 星';

  @override
  String get personalRatingNumeric => '10 分制数字评分';

  @override
  String get rate => '评分';

  @override
  String get like => '喜欢';

  @override
  String get dislike => '不喜欢';

  @override
  String get personalRatingClear => '清除评分';

  @override
  String get personalRatingRated => '已评分';

  @override
  String get personalRatingMine => '我的评分';

  @override
  String get personalRatingSaveFailed => '无法保存评分';

  @override
  String get increase => '增加';

  @override
  String get decrease => '减少';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => '正在观看';

  @override
  String get filterUnreleased => '未发布';

  @override
  String get filterTrailers => '预告片';

  @override
  String get filterExtras => '花絮';

  @override
  String get filterThemeSongs => '主题曲';

  @override
  String get filterThemeVideos => '主题视频';

  @override
  String get source => '来源';

  @override
  String get years => '年份';

  @override
  String get audioLanguage => '音轨语言';

  @override
  String get subtitleLanguage => '字幕语言';

  @override
  String get clearFilters => '清除筛选';

  @override
  String get seerrShortcutsRow => 'Seerr 浏览';

  @override
  String get seerrReleased => '已发布';

  @override
  String get seerrMinRating => '最低评分';

  @override
  String get seerrMinVotes => '最低投票数';

  @override
  String get seerrOriginalLanguage => '原始语言';

  @override
  String get seerrRuntime => '时长';

  @override
  String get subtitleHdrSeparate => '单独 HDR 样式';

  @override
  String get subtitleHdrSeparateSubtitle => '白色在 HDR 中比 SDR 亮得多，此处使用较暗的样式可避免刺眼';

  @override
  String get subtitleBold => '粗体文本';

  @override
  String get subtitleStrokeWidth => '文字描边宽度';

  @override
  String get subtitleFont => '字体';

  @override
  String get subtitleFontDescription => '首次选择字体时，将从 Google Fonts 下载该字体';

  @override
  String subtitleFontDownloadFailed(String font) {
    return '无法下载 $font';
  }

  @override
  String get subtitleShadow => '文字阴影';

  @override
  String get subtitleShadowIntensity => '阴影强度';

  @override
  String get subtitleShadowOffset => '阴影偏移';

  @override
  String get subtitleShadowBlur => '阴影模糊';

  @override
  String get scrollSensitivity => '滚动灵敏度';

  @override
  String get scrollSensitivitySubtitle => '鼠标滚轮一格滚动的距离';

  @override
  String get mediaDetailsAndSpoilers => '媒体详情与剧透';

  @override
  String get openTrailersExternally => '在外部应用中打开预告片';

  @override
  String get openTrailersExternallySubtitle => '预告片在 YouTube 应用或浏览器中打开，而非内置播放器';

  @override
  String get hideDetailsMediaDescription => '在详情页隐藏媒体描述';

  @override
  String get hideDetailsMediaDescriptionSubtitle => '隐藏电影或剧集的描述文字。';

  @override
  String get detailUseSeriesThumbnails => '在详情页使用剧集缩略图';

  @override
  String get detailUseSeriesThumbnailsSubtitle => '将经典详情页上的所有缩略图替换为剧集缩略图';

  @override
  String get hideHomeMediaDescription => '在详情页隐藏媒体描述';

  @override
  String get hideHomeMediaDescriptionSubtitle => '隐藏电影或剧集的描述文字。';

  @override
  String get hideHomeWatchProgress => '隐藏观看进度';

  @override
  String get hideHomeWatchProgressSubtitle => '隐藏已开始观看内容的海报上的进度条。';

  @override
  String get hideHomeUnwatchedCount => '隐藏未观看数量';

  @override
  String get hideHomeUnwatchedCountSubtitle => '隐藏显示剩余待看集数的角标。';

  @override
  String get continueWatchingAndNextUpHeader => '继续观看与下个播放';

  @override
  String get setupSkip => '跳过设置';

  @override
  String get setupNavbarQuestion => '导航栏应放在哪里？';

  @override
  String get setupMediaBarQuestion => '主屏幕顶部应是什么样？';

  @override
  String get setupHomeRowsQuestion => '你的行应是什么样？';

  @override
  String get setupDetailQuestion => '打开电影或剧集时应是什么样？';

  @override
  String get setupTourQuestion => '设置完成。这里还有更多功能。';

  @override
  String get setupPlaybackLanguages => '播放语言';

  @override
  String get setupOptional => '可选';

  @override
  String get setupStyleClassic => '经典';

  @override
  String get setupStyleModern => '现代';

  @override
  String get setupRowsClassicHint => '紧凑。屏幕上同时显示更多行。';

  @override
  String get setupRowsModernHint => '更大的卡片，标题在下方。';

  @override
  String get setupRowsCarouselHint => '海报下方带有大型详情面板。';

  @override
  String get setupDetailClassicHint => '所有内容居中堆叠。';

  @override
  String get setupDetailModernHint => '电影感，带有演职人员和花絮标签页。';

  @override
  String get setupStyleSpotlight => '聚光灯';

  @override
  String get setupDetailSpotlightHint => '以主视觉区优先，演员和花絮以弹出式卡片呈现。';

  @override
  String get setupStyleNouveau => '新潮';

  @override
  String get setupDetailNouveauHint => '全屏布局，各版块自上而下堆叠，不使用标签页。';

  @override
  String get setupStyleMinimalist => '极简';

  @override
  String get setupDetailMinimalistHint => '图片、一个播放按钮和各集列表。';

  @override
  String get setupStyleStage => '舞台';

  @override
  String get setupDetailStageHint => '海报在前，播放按钮在其下方，详情在旁边。';

  @override
  String get setupStylePremiere => '首映';

  @override
  String get setupDetailPremiereHint => '片名居中显示在全屏背景图上，其余内容沿页面向下排列。';

  @override
  String get setupStyleQuickLook => '速览';

  @override
  String get setupDetailQuickLookHint => '在当前画面上弹出抽屉，包含播放和基本信息，再按一下即可打开完整页面。';

  @override
  String get setupStyleFrost => '磨砂';

  @override
  String get setupDetailFrostHint => '片名显示在模糊图片之上的玻璃窗口中，标签页位于按钮下方。';

  @override
  String get setupNavbarStyleQuestion => '底部导航栏要呈现什么样式？';

  @override
  String get setupNavbarStyleDockHint => '悬浮的胶囊样式，每个标签下方都有文字。';

  @override
  String get setupNavbarStyleSplitHint => '搜索拥有独立按钮，滚动时导航栏会收缩。';

  @override
  String get setupNavbarStyleStripHint => '沿屏幕底边的通栏样式。';

  @override
  String get setupPickALook => '选择外观';

  @override
  String get setupTourMoreHeader => '设置中还有更多功能等你探索';

  @override
  String get setupTourBulletRequests => 'Seerr 请求';

  @override
  String get setupTourBulletSyncPlay => 'SyncPlay 观影派对';

  @override
  String get setupTourBulletThemes => '自定义主题';

  @override
  String get setupTourBulletDownloads => '离线下载';

  @override
  String get setupTourBulletMore => '以及更多';

  @override
  String setupStepOf(int current, int total) {
    return '第 $current 步，共 $total 步';
  }

  @override
  String get setupCurrent => '当前';

  @override
  String get setupMoonbaseTitle => '将 Moonbase 添加到你的服务器';

  @override
  String get setupMoonbaseHint => '一个免费的服务器插件，可解锁 Moonfin 的更多功能';

  @override
  String get setupMoonbaseIntro => 'Moonbase 免费且运行在你的服务器上。安装后，Moonfin 将获得：';

  @override
  String get setupMoonbaseAskAdmin => '只有服务器管理员才能安装。请将此链接发送给他们。';

  @override
  String get setupMoonbaseManualSteps => '安装需要在服务器上完成几个步骤，全部步骤请见此链接。';

  @override
  String get setupMoonbaseInstalling => '正在安装 Moonbase…';

  @override
  String get setupMoonbaseInstalled =>
      'Moonbase 已安装。它将在服务器重启后启用，这会中断当前正在播放的内容。';

  @override
  String get setupMoonbaseRestarting => '服务器正在重启。恢复后 Moonbase 将启用。';

  @override
  String get moonbaseFeatureSync => '设置在你所有设备间同步';

  @override
  String get moonbaseFeatureRatings => '更多评分和 TMDB 评论';

  @override
  String get moonbaseFeatureRows => '根据你喜爱的列表自定义栏目';

  @override
  String get moonbaseFeatureGames => '复古游戏，存档同步';

  @override
  String get moonbaseFeatureCalendar => '即将推出内容的日历';

  @override
  String get moonbaseFeatureCollections => '为每个合集自定义排序';

  @override
  String get moonbaseFeatureMessages => '来自服务器管理员的消息';

  @override
  String setupMoonbaseInstallFailed(String error) {
    return '无法安装 Moonbase。$error';
  }

  @override
  String get setupTvHint => '上下键预览 · 确定键选择 · 连按两次返回键跳过';

  @override
  String get setupNavbarTopHint => '标签位于屏幕顶部。';

  @override
  String get setupNavbarLeftHint => '左侧一条细长的图标栏。';

  @override
  String get setupNavbarBottomHint => '标签位于屏幕底边，方便拇指触及。';

  @override
  String get setupMediaBarMoonfinHint => '大尺寸图片，片名、详情和简介叠加显示其上。';

  @override
  String get setupMediaBarMakdHint => '大尺寸图片，以醒目的片名标识为主。';

  @override
  String get setupMediaBarBookshelfHint => '片名以书脊形式排列在书架上，精选内容正面朝外展示。';

  @override
  String get setupMediaBarGalleryHint => '精选内容展开显示，接下来几部在其旁边依次排列。';

  @override
  String get setupMediaBarBannerHint => '栏目上方显示较短的横幅，让屏幕上能容纳更多栏目。';

  @override
  String get setupMediaBarAyaHint => '图片置于带边框的面板中，栏目紧随其下。';

  @override
  String get setupMediaBarOffHint => '不显示精选区域。首页打开后直接显示各栏目。';

  @override
  String get runSetupAgain => '重新运行设置';

  @override
  String get serverMessages => '服务器消息';

  @override
  String get serverMessagesEmpty => '暂未收到服务器消息';

  @override
  String get serverMessagesMarkAllRead => '全部标为已读';

  @override
  String get serverMessagesShowButton => '显示消息按钮';

  @override
  String get serverMessagesShowButtonSubtitle => '在菜单添加按钮，用于查看服务器管理员推送消息';

  @override
  String get showBookDiscoverTab => '显示图书媒体库发现';

  @override
  String get showBookDiscoverTabDescription =>
      '在图书和有声书媒体库中浏览来自 Open Library 和 LibriVox 的作品';

  @override
  String get bookFoldersAsSeries => '将图书文件夹视为剧集';

  @override
  String get bookFoldersAsSeriesDescription => '将包含图书的文件夹视为剧集，而非依赖每本书各自的元数据';

  @override
  String get autoDownloadNewEpisodes => '自动下载新剧集';

  @override
  String get autoDownloadStop => '停止自动下载';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '自动下载新剧集，最多保留$count集未观看内容',
      one: '自动下载新剧集，最多保留1集未观看内容',
      zero: '下载全部新剧集',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return '已开启 • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      '转码画质仅在 Moonfin 运行时下载；原片画质可后台下载。';

  @override
  String get autoDownloadTranscodedRunningNote =>
      '转码下载中断后无法续传，需要从头开始；原片画质支持断点续传。';

  @override
  String get autoDownloadForegroundOnly => '仅 Moonfin 运行时才会下载';

  @override
  String get autoDownloadQualityTitle => '自动下载画质';

  @override
  String autoDownloadEnabledFor(String title) {
    return '已为「$title」开启自动下载';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return '已关闭「$title」的自动下载';
  }

  @override
  String get smartDownloadsSection => '智能下载';

  @override
  String get smartDownloadsEnable => '下载下一集';

  @override
  String get smartDownloadsEnableDescription =>
      '当你在任意设备上观看完一集后，Moonfin 会自动下载后续剧集。已下载的剧集在观看后会被删除。';

  @override
  String get smartDownloadsKeepReady => '保持下载的集数';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '保持下载后续 $count 集',
      one: '保持下载下一集',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered => '已下载的剧集会保留在你的设备上。新数量仅对之后的下载生效。';

  @override
  String get autoDownloadSection => '自动下载';

  @override
  String get autoDownloadEnable => '启用自动下载';

  @override
  String get autoDownloadEnableSubtitle => '自动下载你关注剧集的新集。已有剧集仍可手动下载。';

  @override
  String get autoDownloadKeepUnwatched => '保留未观看剧集';

  @override
  String get autoDownloadKeepAll => '全部';

  @override
  String get autoDownloadDelete => '删除已下载剧集';

  @override
  String get autoDownloadDeleteFollowedSubtitle => '观看后何时删除为已关注剧集下载的剧集';

  @override
  String get removeWatchedDownloads => '删除已观看的下载内容';

  @override
  String get removeWatchedDownloadsSubtitle => '何时删除你自己下载的剧集和电影。仅删除开启此选项后观看的内容';

  @override
  String get removeWatchedAsk => '询问我';

  @override
  String get deleteFinishedDownloadTitle => '删除此下载内容？';

  @override
  String deleteFinishedDownloadMessage(String title) {
    return '你已看完 $title。删除其下载内容可释放空间，或保留并不再提示。';
  }

  @override
  String get notNow => '暂不';

  @override
  String get keepDownloaded => '保留下载内容';

  @override
  String get keepDownloadedSubtitle => '观看后永不自动删除此内容';

  @override
  String get autoDownloadDeleteNever => '永不删除';

  @override
  String get autoDownloadDeleteImmediately => '观看完毕立即删除';

  @override
  String get autoDownloadDeleteAfterDay => '观看1天后删除';

  @override
  String get autoDownloadDeleteAfterWeek => '观看1周后删除';

  @override
  String get autoDownloadBackgroundRefresh => '后台检查更新';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      '允许系统在 Moonfin 关闭时定期检查新剧集';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Moonfin 的后台应用刷新已被禁用，请前往 iOS 设置开启。';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Android 设置限制了 Moonfin 后台运行权限。';

  @override
  String get autoDownloadCheckNow => '立即检查';

  @override
  String get autoDownloadChecking => '正在检查...';

  @override
  String get autoDownloadNeverChecked => '尚未检查';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '已排队$queued集',
      one: '已排队1集',
      zero: '暂无新内容',
    );
    return '上次检查：$when，$_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return '上次检查 $when 失败：$error';
  }

  @override
  String get autoDownloadFollowedSeries => '已关注剧集';

  @override
  String get autoDownloadNoSubscriptions => '打开剧集页面，在下载菜单中选择「自动下载新剧集」';

  @override
  String get autoDownloadRemove => '取消关注';

  @override
  String get autoDownloadStorageFull => '存储空间不足';

  @override
  String get autoDownloadWaitingForWifi => '等待 WiFi 网络';

  @override
  String get downloadNotificationRunning => '正在下载';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return '正在下载 ($done/$total)';
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
    return '$name — $progress · 剩余 $timeRemaining';
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
      other: '批量下载完成',
      one: '下载完成',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name 已缓存至本地';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count个内容已缓存至本地',
      one: '1个内容已缓存至本地',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count集',
      one: '1集',
    );
    return '$series：$_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => '下载失败';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name：$error';
  }

  @override
  String get serverMessagesNotificationTitle => '服务器消息';

  @override
  String get serverMessagesNotificationReceived => '收到消息';

  @override
  String get downloadStorageLimitReached => '已到达下载存储上限，请清理空间或调高限制。';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return '存储空间不足：需要 $needed，剩余 $free';
  }

  @override
  String get autoDownloadStorageFullTitle => '空间不足，无法下载新剧集';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '共$count集等待可用空间。',
      one: '$name 需要 $size存储空间。',
    );
    return '$_temp0请清理存储空间或调高下载上限。';
  }

  @override
  String get pageTransitions => '页面切换';

  @override
  String get pageTransitionsSubtitle => '调整页面之间切换时的淡入淡出时长';

  @override
  String get navigationSpeed => '导航速度';

  @override
  String get navigationSpeedSubtitle => '调整焦点指示器在媒体项和栏目之间移动的速度';

  @override
  String get modernCardsTransitionSpeed => '现代卡片动画速度';

  @override
  String get modernCardsTransitionSpeedSubtitle => '调整展开获得焦点的现代卡片时的动画速度';

  @override
  String get delayCardExpansionOnRapidScroll => '快速滚动时延迟展开卡片';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle => '等待焦点移动停止后再展开现代卡片';

  @override
  String get animationSpeedExtraSlow => '特慢';

  @override
  String get animationSpeedSlow => '慢';

  @override
  String get animationSpeedMedium => '中';

  @override
  String get animationSpeedFast => '快';

  @override
  String get animationSpeedOff => '关';

  @override
  String get pageTransitionFadeNone => '无淡入淡出';

  @override
  String get pageTransitionFadeShort => '短淡入淡出';

  @override
  String get pageTransitionFadeMedium => '中等淡入淡出';

  @override
  String get pageTransitionFadeLong => '长淡入淡出';

  @override
  String get siriRemoteSwipeSensitivity => '触控板滑动灵敏度';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      '在 Siri Remote 触控板上每次滑动时焦点移动的距离';

  @override
  String get appleTvHomeScreen => 'Apple TV 主屏幕';

  @override
  String get topShelf => '顶部推荐栏';

  @override
  String get topShelfDescription =>
      '选中 Moonfin 图标时，Apple TV 主屏幕上方显示的内容。此设置仅在本设备上生效。';

  @override
  String get topShelfLatestMedia => '最近媒体';

  @override
  String get topShelfAppBanner => 'Moonfin 横幅';

  @override
  String get keepVideoClearOfDynamicIsland => '视频避开灵动岛';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      '横屏时，摄像头区域会遮挡屏幕一侧。此选项会让画面避开该区域，仅对宽度足以延伸到该处的视频产生影响。';

  @override
  String get bottomNavbarStyle => '底部栏样式';

  @override
  String get bottomNavbarStyleDock => '停靠';

  @override
  String get bottomNavbarStyleSplit => '分栏';

  @override
  String get bottomNavbarStyleStrip => '条形';

  @override
  String get bottomNavbarTabs => '底部栏标签';

  @override
  String get bottomNavbarTabsDescription =>
      '在“首页”和“你”之间最多可固定 3 个标签。其余标签都在底部栏的中心页面。';

  @override
  String get bottomNavbarTabsAutomatic => '自动模式';

  @override
  String get bottomNavbarTabsPinned => '已固定';

  @override
  String get bottomNavbarTabsAvailable => '可用';

  @override
  String get bottomNavbarTabsReset => '重置为自动';

  @override
  String get bottomNavbarTabsLimit => '最多可固定 3 个标签。移除一个后才能固定其他标签。';

  @override
  String get bottomNavbarTabTurnedOff => '已在“按钮”中关闭';

  @override
  String get bottomNavbarSplitSearchNote => '在“分栏”样式中，“搜索”始终拥有独立按钮。';

  @override
  String get bottomNavbarButtonsNote =>
      '这些选项决定底部栏中心页显示的内容，以及哪些标签可以固定到底部栏。已在底部栏上的标签不会在此列出。';

  @override
  String get navYou => '你';

  @override
  String get cinemaSkipPrerolls => '影院模式跳过按钮';

  @override
  String get cinemaSkipPrerollsDescription =>
      '在影院模式的预告片、广告和其他片前内容播放期间显示“跳过”按钮。';

  @override
  String get detailsPage => '详情页面';

  @override
  String get storageAndDownloads => '存储与下载';

  @override
  String get integrations => '集成';

  @override
  String get settingsSync => '设置同步';

  @override
  String get settingsSyncSubtitle => 'Moonbase 插件同步和自定义配置方案';

  @override
  String get navigationBar => '导航栏';

  @override
  String get homeRows => '栏目';

  @override
  String get homeRowsSubtitle => '开启或关闭栏目并调整其顺序';

  @override
  String get rowOptions => '栏目选项';

  @override
  String get rowOptionsSubtitle => '每个栏目的排序和内容';

  @override
  String get imageTypePerRow => '每个栏目的图片类型';

  @override
  String get externalSources => '外部来源';

  @override
  String get qualityAndDecoding => '画质与解码';

  @override
  String get qualityAndDecodingSubtitle => '码率、分辨率、解码、HDR 和 Dolby Vision';

  @override
  String get skippingAndAutoplay => '跳过与自动播放';

  @override
  String get advancedPlayback => '高级播放';

  @override
  String get advancedPlaybackSubtitle => '播放器路由、外部播放器和 mpv';

  @override
  String get settingsAccountSubtitle => '登录、PIN 码、儿童模式、家长控制和设置同步';

  @override
  String get settingsGeneralSubtitle => '语言、时钟、输入和性能';

  @override
  String get settingsAppearanceSubtitle => '导航、主屏幕、媒体库、详情页面和主题';

  @override
  String get settingsHomeScreenSubtitle => '栏目、媒体栏、外观和外部来源';

  @override
  String get settingsLibrariesEntrySubtitle => '媒体库的可见性、顺序和媒体库页面';

  @override
  String get settingsDetailsPageSubtitle => '布局、按钮、分区、评分和主题音乐';

  @override
  String get settingsPlaybackSubtitle => '播放器、画质、音频、字幕、跳过和观影派对';

  @override
  String get settingsStorageSubtitle => '下载、存储位置和图片缓存';

  @override
  String get settingsServicesSubtitle => 'Seerr 和成就徽章';

  @override
  String get settingsSignInSection => '登录';

  @override
  String get settingsFamilySection => '家庭';

  @override
  String get settingsServersSection => '服务器';

  @override
  String get settingsLanguageSection => '语言';

  @override
  String get settingsInputSection => '输入';

  @override
  String get settingsMotionSection => '动效';

  @override
  String get settingsContentsSection => '内容';

  @override
  String get settingsLooksSection => '外观';

  @override
  String get settingsAudioAndSubtitlesSection => '音频与字幕';

  @override
  String get settingsSkippingAndQueueSection => '跳过与队列';

  @override
  String get settingsWatchTogetherSection => '观影派对';

  @override
  String get settingsAdvancedSection => '高级';

  @override
  String get settingsDecodingAndRenderingSection => '解码与渲染';

  @override
  String get settingsAudioStreamSection => '音频流';

  @override
  String get settingsAudioOutputSection => '音频输出';

  @override
  String get settingsPassthroughSettingsSection => '直通设置';

  @override
  String get settingsSeerrHomePageRowsSection => 'Seerr 首页栏目';

  @override
  String get settingsSavedCustomHomeRowsSection => '已保存的自定义首页栏目';

  @override
  String get settingsRewatchSection => '重看';

  @override
  String get favoritesSwitchViewSection => '切换视图';

  @override
  String get playerSettingsSubtitle => '控制、跳转、播放器按钮和 trickplay';

  @override
  String get siloPasswordChangeTitle => '设置新密码';

  @override
  String get siloPasswordChangeMessage => '此账户使用临时密码。请设置一个新密码以完成登录。';

  @override
  String get siloPasswordChangeNew => '新密码';

  @override
  String get siloPasswordChangeConfirm => '确认新密码';

  @override
  String get siloPasswordChangeSubmit => '更改密码';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '至少使用 $count 个字符',
      one: '至少使用 1 个字符',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => '该密码过长';

  @override
  String get siloPasswordChangeMismatch => '两次输入的密码不一致';

  @override
  String get siloPasswordChangeSameAsTemporary => '请设置一个与临时密码不同的密码';

  @override
  String get siloPasswordChangeFailed => '无法更改密码。请重试。';

  @override
  String get siloPasswordChangeUnavailable =>
      '此账户使用临时密码，但此服务器不允许在此处更改。请在 Silo 的网页应用中更改，然后重新登录。';

  @override
  String get siloPasswordChangedSignInAgain => '密码已更改。请使用新密码登录。';

  @override
  String get siloServerRowSubtitle => '来自你的服务器';

  @override
  String get playlistSortReleaseDate => '上映日期';

  @override
  String get playlistSortCriticRating => '影评人评分';

  @override
  String get playlistSortRuntime => '片长';

  @override
  String get playlistSortLastPlayed => '上次播放';

  @override
  String get playlistSortPlayCount => '播放次数';

  @override
  String get playlistSortRandom => '随机';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项启用',
      one: '1 项启用',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks => '没有符合当前筛选条件的曲目';

  @override
  String get librarySortPlaylistOrder => '播放列表顺序';

  @override
  String get librarySortDateAdded => '添加日期';

  @override
  String get librarySortDateEpisodeAdded => '剧集添加日期';

  @override
  String get librarySortParentalRating => '家长评级';

  @override
  String get librarySortMyRating => '我的评分';

  @override
  String get librarySortAlbumArtist => '专辑艺术家';

  @override
  String get librarySortAlbum => '专辑';

  @override
  String get librarySortArtist => '艺术家';

  @override
  String get librarySortTrackNumber => '曲目编号';

  @override
  String get librarySortGenre => '类型';

  @override
  String get librarySortFoldersFirst => '文件夹优先';

  @override
  String get librarySortLength => '时长';

  @override
  String get homeScreenBackdrop => '主屏幕背景图';

  @override
  String get homeScreenBackdropFullScreen => '全屏';

  @override
  String get homeScreenBackdropCorner => '角落';

  @override
  String get homeScreenBackdropTop => '顶部';

  @override
  String get detailsScreenBackdrop => '详情页面背景图';

  @override
  String get detailsBackdropSize => '背景图尺寸';

  @override
  String get detailsBackdropFullScreen => '全屏';

  @override
  String get detailsBackdropFit => '适应';

  @override
  String get libraryBackdrops => '媒体库背景图';

  @override
  String get playbackInfoChannel => '频道';

  @override
  String get playbackInfoProgram => '节目';

  @override
  String get playbackInfoWhy => '原因';

  @override
  String get playbackInfoServerCompatibilityCheck => '服务器兼容性检查';

  @override
  String get playbackInfoBitrateUnavailable => '码率不可用';

  @override
  String get playbackInfoQualityLimit => '画质限制';

  @override
  String get playbackInfoFrameRate => '帧率';

  @override
  String get playbackInfoDelivery => '传输方式';

  @override
  String get playbackInfoFile => '文件';

  @override
  String get playbackInfoTechnical => '技术信息';

  @override
  String get playbackInfoDevice => '设备';

  @override
  String get playbackInfoAudioRoute => '音频路由';

  @override
  String get playbackInfoSurround51 => '5.1 环绕声';

  @override
  String get playbackInfoSurround71 => '7.1 环绕声';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count 个声道';
  }

  @override
  String get playbackInfoBurnedIn => '由服务器压制';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value（原始 $original）';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value（由 $source 转换而来）';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name（$size，由 $source 转换而来）';
  }

  @override
  String get playbackInfoNoteDirectPlay => '正在按原样播放原始文件。';

  @override
  String get playbackInfoNoteDirectStream => '服务器正在重新封装文件，但不进行转码。';

  @override
  String get playbackInfoNoteLiveRelay => '服务器正在转发该频道，但不进行转码。';

  @override
  String playbackInfoFrameRateFrom(String rate, String source) {
    return '$rate fps（$source）';
  }

  @override
  String get playbackInfoRateSourceHeader => '流标头';

  @override
  String get playbackInfoRateSourceMeasured => '实测';

  @override
  String get playbackInfoRateSourceServer => '服务器';

  @override
  String get playbackInfoServerFrameRate => '服务器帧率';

  @override
  String get playbackInfoScan => '扫描方式';

  @override
  String get playbackInfoProgressive => '逐行';

  @override
  String get playbackInfoInterlaced => '隔行';

  @override
  String get playbackInfoRepeatedFields => '胶转磁（重复场）';

  @override
  String get playbackInfoHdmiOutput => 'HDMI 输出';

  @override
  String playbackInfoDisplayMode(String width, String height, String rate) {
    return '$width×$height @ $rate Hz';
  }

  @override
  String get playbackInfoRateCorrections => '帧率校正';

  @override
  String get playbackInfoAudioOutput => '输出';

  @override
  String playbackInfoPassthroughOf(String codec) {
    return '直通（$codec）';
  }

  @override
  String playbackInfoDecodedTo(String channels) {
    return '解码（$channels）';
  }

  @override
  String get playbackInfoNoteTranscodeVideo => '服务器正在转换视频，以便此设备播放。';

  @override
  String get playbackInfoNoteTranscodeAudio => '服务器正在转换音频，以便此设备播放。';

  @override
  String get playbackInfoNoteTranscodeBoth => '服务器正在转换视频和音频，以便此设备播放。';

  @override
  String get playbackInfoNoteTranscodeUnknown => '服务器正在转换此文件，以便此设备播放。';

  @override
  String get playbackInfoNoteOffline => '正在播放已下载的副本。';

  @override
  String get playbackInfoWhyForced => '设置中已强制转码';

  @override
  String get playbackInfoWhyBitrate => '码率超过串流限制';

  @override
  String get playbackInfoWhyContainer => '此设备无法播放此文件类型';

  @override
  String get playbackInfoWhyVideo => '此设备无法播放此视频格式';

  @override
  String get playbackInfoWhyHdr => '此设备无法显示此 HDR 格式';

  @override
  String get playbackInfoWhyAudio => '此设备无法播放此音频格式';

  @override
  String get playbackInfoWhySubtitles => '字幕正被压制到视频中';

  @override
  String get playbackInfoWhyOther => '无法直接播放此文件';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate 超过 $limit 的串流限制';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return '此设备无法打开 $container 文件';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return '此设备无法播放 $codec 视频';
  }

  @override
  String playbackInfoWhyVideoProfileUnknown(String codec) {
    return '服务器无法验证此视频流的 $codec 档次。';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return '此设备无法播放 $codec $profile 视频';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return '此设备无法播放 $codec $level 级别视频';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return '此设备无法播放 $bits 位视频';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return '此设备无法播放 $resolution 视频';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return '此设备无法播放 $fps fps 视频';
  }

  @override
  String get playbackInfoWhyInterlaced => '此设备无法播放隔行视频';

  @override
  String get playbackInfoWhyAnamorphic => '此设备无法播放变形视频';

  @override
  String playbackInfoWhyHdrName(String range) {
    return '此设备无法显示 $range';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return '此设备无法播放 $format 音频';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return '此设备无法播放 $fullFormat';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return '此设备无法播放 $channels 音频';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return '此设备无法播放 $rate kHz 音频';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return '此设备无法播放 $bits 位音频';
  }

  @override
  String get playbackInfoWhyAudioExternal => '音轨位于单独的文件中';

  @override
  String get playbackInfoWhySecondaryAudio => '此设备只能播放第一条音轨';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return '$format 字幕正被压制到视频中';
  }

  @override
  String get playbackInfoDroppedFrames => '丢帧';

  @override
  String get playFromServer => '从服务器播放';

  @override
  String get settingsApplePlayerUi => '视频播放器';

  @override
  String get settingsApplePlayerUiDescription =>
      '原生 Apple 风格播放器没有投屏、音频延迟或画中画按钮，其旋转锁定仅在直播电视中可用';

  @override
  String get settingsApplePlayerUiStandard => '标准';

  @override
  String get settingsApplePlayerUiNative => '原生 Apple 风格';

  @override
  String get playerTransportPosition => '播放按钮';

  @override
  String get playerTransportPositionDescription =>
      '将播放、跳过和跳转按钮显示在视频中央，或停靠在底部栏中';

  @override
  String get playerTransportOnScreen => '在屏幕上';

  @override
  String get playerTransportDocked => '停靠';

  @override
  String get incompleteRecording => '不完整';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '已录制 $recorded / $expected 分钟';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return '完整场次定于 $dateTime';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return '完整副本录制于 $dateTime';
  }

  @override
  String get noCompleteShowingFound => '未找到完整场次';

  @override
  String get keepAsComplete => '保留为完整';

  @override
  String get keptAsComplete => '已标记为完整';

  @override
  String get unableToKeepAsComplete => '无法标记为完整';

  @override
  String recordPromptTitle(String name) {
    return '录制 $name';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '本场于 $minutes 分钟前开始，因此录制将错过开头。',
      one: '本场于 1 分钟前开始，因此录制将错过开头。',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater => '是否也录制后续场次，以获得完整录制？';

  @override
  String get recordPromptSearchLater => '是否在找到后续场次后自动录制，以获得完整录制？';

  @override
  String get recordPromptNow => '现在';

  @override
  String get recordPromptLater => '后续场次';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '已播出 $minutes 分钟',
      one: '已播出 1 分钟',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch => '仅通过标题和简介匹配。请确认是否为同一节目。';

  @override
  String get recordPromptDescriptionsDiffer => '简介不同，因此可能是不同的节目。';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return '同一集（S${season}E$episode）';
  }

  @override
  String get recordPromptAlreadyScheduled => '已设置为录制';

  @override
  String get recordPromptTomorrow => '明天';

  @override
  String get recordNowOnly => '仅立即录制';

  @override
  String recordNowAnd(String when) {
    return '立即录制，并录制$when';
  }

  @override
  String get recordNowAndLater => '立即录制并录制后续场次';

  @override
  String recordOnlyLater(String when) {
    return '仅录制$when';
  }

  @override
  String get recordLaterShowingOnly => '仅录制后续场次';

  @override
  String get laterShowingOnlyRequested => '将录制后续场次。';

  @override
  String get unableToRequestLaterShowingOnly => '无法请求录制后续场次，因此不会进行录制。';

  @override
  String get laterShowingRequested => '录制已开始。后续场次也将被录制。';

  @override
  String get unableToRequestLaterShowing => '录制已开始，但无法请求录制后续场次。';

  @override
  String get siloCodeSignIn => '使用代码登录';

  @override
  String siloCodeSignInInstruction(String address) {
    return '使用手机扫描二维码，或在任意已登录的设备上访问 $address 并输入此代码：';
  }

  @override
  String get siloCodeSignInInstructionNoLink => '在已登录的设备上，于 Silo 中输入此代码：';

  @override
  String get siloCodeSignInOpened => '已找到代码。请在另一台设备上批准此登录。';

  @override
  String get siloCodeSignInDenied => '此登录已被拒绝。';

  @override
  String get siloCodeSignInNewCode => '获取新代码';

  @override
  String get siloCodeSignInOff => '此服务器已关闭代码登录功能。';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      '此账户使用临时密码。请先用该密码登录一次以进行更换。';

  @override
  String get siloApproveSignIn => '批准登录';

  @override
  String get siloApproveSignInHint => '另一台设备上显示的代码';

  @override
  String get siloApproveSignInApprove => '批准';

  @override
  String get siloApproveSignInDone => '已批准。另一台设备正在登录。';

  @override
  String get siloApproveSignInNoRequest =>
      '没有使用该代码等待批准的登录。请检查代码，或在另一台设备上获取新代码。';

  @override
  String get siloNativeOfferTitle => '是否直接连接到 Silo？';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return '此地址是 $serverName 的 Jellyfin 兼容服务。Moonfin 可以直接通过 $address 连接到 Silo，并使用 Silo 自有功能。';
  }

  @override
  String get siloNativeOfferUse => '使用 Silo';

  @override
  String get siloNativeOfferKeep => '保留 Jellyfin';

  @override
  String get siloAppUpdateRequired =>
      '此 Silo 服务器需要更高版本的 Moonfin。请更新 Moonfin 后再使用。';

  @override
  String get siloServerUpdateRequired =>
      '此 Silo 服务器版本过低，无法兼容当前版本的 Moonfin。请更新 Silo 后再使用。';

  @override
  String get siloTooManyAttempts => '尝试次数过多。请稍后重试。';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return '尝试次数过多。请在 $wait 后重试。';
  }

  @override
  String get siloServerBusy => '服务器繁忙或仍在启动。请稍后重试。';

  @override
  String siloServerBusyWait(String wait) {
    return '服务器繁忙或仍在启动。请在 $wait 后重试。';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 秒',
      one: '1 秒',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分钟',
      one: '1 分钟',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable => '此 Silo 服务器不支持播放。';

  @override
  String get siloPlaybackUpdateRequired => '此 Silo 服务器需要更高版本的 Moonfin 才能播放。';

  @override
  String get siloPlaybackEndedOnServer => '播放已在 Silo 服务器上结束。';

  @override
  String siloPinTitle(String name) {
    return '$name 的 PIN 码';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => '解锁';

  @override
  String get siloPinRemember => '在此设备上记住 PIN 码';

  @override
  String get siloPinWrong => 'PIN 码不正确。';

  @override
  String get siloPinLocked => 'PIN 码错误次数过多。请稍后重试。';

  @override
  String siloPinLockedWait(String wait) {
    return 'PIN 码错误次数过多。请在 $wait 后重试。';
  }

  @override
  String get siloPinFailed => '无法验证 PIN 码。请重试。';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 部预告片',
      one: '1 部预告片',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return '预告片 $number';
  }

  @override
  String get subtitled => '带字幕';

  @override
  String get rommAccount => 'RomM 账户';

  @override
  String get rommAccountIntro =>
      '关联你的 RomM 账户，即可从自己的 RomM 媒体库游玩，并将存档保存在 RomM 中。';

  @override
  String get rommLinkAccount => '关联 RomM 账户';

  @override
  String get rommLinkInstructions => '登录 RomM 并输入此代码以关联你的账户。';

  @override
  String rommLinkScanOrVisit(String url) {
    return '使用手机扫描二维码，或访问 $url';
  }

  @override
  String get rommOpen => '打开 RomM';

  @override
  String get rommWaitingForApproval => '正在等待你在 RomM 中批准代码…';

  @override
  String rommLinkedAs(String username) {
    return '已关联为 $username';
  }

  @override
  String get rommLinked => '你的 RomM 账户已关联。';

  @override
  String get rommUnlinkNote =>
      '解除关联后，Moonfin 将无法使用你的 RomM 密钥。该密钥会一直保留在 RomM 中，直到你在 RomM 的 API 令牌里将其移除。';

  @override
  String get rommUnlink => '解除关联';

  @override
  String get rommLinkExpired => '代码在批准前已过期。请重新关联以获取新代码。';

  @override
  String get rommLinkDenied => '关联请求在 RomM 中被拒绝。';

  @override
  String get rommUnreachable => 'Moonfin 无法连接到 RomM。请稍后重试。';

  @override
  String get rommNotAvailable => '此服务器没有 RomM 媒体库。';

  @override
  String get rommAccountLoadFailed => '无法加载你的 RomM 账户。';

  @override
  String get reviews => '评论';

  @override
  String get detailSectionReviews => '评论';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条评论',
      one: '1 条评论',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => '在 TMDB 上阅读';

  @override
  String get addServerButtonSubtitle => '通过地址，或使用 Plex 或 Emby Connect 账户';

  @override
  String get addServerChooseHow => '请选择连接方式。';

  @override
  String get addServerAddressChoice => '局域网或在线的 Jellyfin、Emby 或 Silo';

  @override
  String get addServerPlexChoice => '使用你的 Plex 账户查找其服务器';

  @override
  String get addServerAddressHelp => '在浏览器中打开的同一地址，包括端口。';

  @override
  String get addServerDetectNote =>
      '适用于 Jellyfin、Emby 和 Silo。Plex 地址将打开 Plex 登录界面。';

  @override
  String addServerChecking(String address) {
    return '正在检查 $address';
  }

  @override
  String get addServerUnreachableDetail => '请检查地址和端口，并确认服务器正在运行。';

  @override
  String get addServerFound => '已找到服务器';

  @override
  String get addServerFoundNote => '继续选择要登录的用户。';

  @override
  String get addServerUseDifferentAddress => '使用其他地址';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 位艺人',
      one: '1 位艺人',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 首歌曲',
      one: '1 首歌曲',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个播放列表',
      one: '1 个播放列表',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 次播放',
      one: '1 次播放',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => '所有艺人';

  @override
  String get libraryZToA => 'Z 到 A';

  @override
  String get musicSortYear => '年份';

  @override
  String get musicFilter => '筛选';

  @override
  String get musicGenreFilterTitle => '按类型筛选';

  @override
  String get openAlbum => '打开专辑';

  @override
  String get openPlaylist => '打开播放列表';

  @override
  String get allSongsAToZ => '所有歌曲 A 到 Z';

  @override
  String get musicMix => '混合';

  @override
  String get musicMixEverything => '全部';

  @override
  String get musicMixEverythingSubtitle => '随机 300 首歌曲';

  @override
  String get mostPlayed => '最常播放';

  @override
  String get musicMixMostPlayedSubtitle => '你的前 100 首';

  @override
  String get musicMixFreshArrivals => '新上架';

  @override
  String get musicMixFreshArrivalsSubtitle => '最新的 100 首歌曲';

  @override
  String get musicMixRediscover => '重新发现';

  @override
  String get musicMixRediscoverSubtitle => '你最近未播放的收藏';

  @override
  String get musicSortMostAlbums => '专辑最多';

  @override
  String bookSeriesPosition(int index, int total) {
    return '第 $index 本，共 $total 本';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个收藏',
      one: '1 个收藏',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Z 到 A';

  @override
  String get bookSortMostTitles => '作品最多';

  @override
  String get bookSurpriseMe => '给我惊喜';

  @override
  String get bookShuffleAudiobooks => '随机播放有声读物';

  @override
  String get bookStartReading => '开始阅读';

  @override
  String get bookOtherBooks => '其他图书';

  @override
  String get bookDiscoverSearchBooks => '搜索 Open Library';

  @override
  String get bookDiscoverSearchAudiobooks => '搜索 LibriVox';

  @override
  String get bookDiscoverFeatured => '精选';

  @override
  String get bookReaderControlsAutoHide => '控件自动隐藏';

  @override
  String get bookReaderControlsStayVisible => '控件保持可见';

  @override
  String get settingsLivePreview => '实时预览';

  @override
  String settingsPreviewShowsOn(String screen) {
    return '在 $screen 预览中显示';
  }

  @override
  String get settingsPreviewNotShown => '未在预览中显示';

  @override
  String settingsPreviewAudioRowsOffInHomeRows(String group, String disabled) {
    return '专辑、艺人和音频播放列表均已关闭。要显示其中一项，请前往“栏目”，在 $disabled 下打开 $group，然后将其开启。';
  }

  @override
  String settingsPreviewAudioRowsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return '要在首页显示专辑、艺人或音频播放列表，请先开启 $setting。然后前往“栏目”，在 $disabled 下打开 $group，并开启其中一项。';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRows(
    String group,
    String disabled,
  ) {
    return '合集栏目已关闭。要显示它，请前往“栏目”，在 $disabled 下打开 $group，然后将其开启。';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return '要在首页显示合集栏目，请先开启 $setting。然后前往“栏目”，在 $disabled 下打开 $group，并将其开启。';
  }

  @override
  String get settingsPreviewRowsOffInKidsMode => '儿童模式使这些栏目不显示在首页，因此这些设置不会改变它。';

  @override
  String settingsPreviewNeedsRowInRows(String disabled) {
    return '在“栏目”的 $disabled 下开启一个栏目';
  }

  @override
  String settingsPreviewNeedsSwitchAndRow(String setting) {
    return '开启 $setting，然后在“栏目”中开启一个栏目';
  }

  @override
  String get settingsPreviewKeptOffByKidsMode => '儿童模式使其不显示在首页';

  @override
  String get settingsPreviewAudioRowsEmpty => '没有可显示的音乐，因此首页会省略这些栏目。';

  @override
  String get settingsPreviewRowsEmpty => '这些栏目中没有可显示的内容，因此首页会省略它们。';

  @override
  String get settingsPreviewCollectionsEmpty => '没有可显示的合集，因此首页会省略此栏目。';

  @override
  String get settingsPreviewShowEpisodesNote =>
      '这只会更改在“栏目”中为单个合集添加的栏目。“合集”栏目本身不变。';

  @override
  String get settingsPreviewSaved => '已保存';

  @override
  String get smartSearch => '智能搜索';

  @override
  String smartSearchOnSeerr(String seerr) {
    return '$seerr 智能搜索';
  }

  @override
  String get calendar => '日历';

  @override
  String get showCalendarButton => '显示日历按钮';

  @override
  String get showCalendarButtonSubtitle => '在导航栏中显示即将播出的剧集和电影的日历';

  @override
  String get calendarFullCalendar => '完整日历';

  @override
  String get calendarUpcoming => '即将播出';

  @override
  String get calendarRecentlyAired => '最近播出';

  @override
  String get calendarRemindMe => '提醒我';

  @override
  String get calendarReminderSet => '已设置提醒';

  @override
  String get calendarReminderFailed => '无法保存提醒';

  @override
  String get calendarReadyToWatch => '可观看';

  @override
  String get calendarComingUpThisWeek => '本周即将播出';

  @override
  String get calendarNothingUpcoming => '暂无即将播出的内容';

  @override
  String get calendarNothingRecent => '暂无最近播出的内容';

  @override
  String get calendarEmptyDay => '当日无内容';

  @override
  String get calendarStartsIn => '距开始';

  @override
  String get calendarUnitDays => '天';

  @override
  String get calendarUnitHours => '小时';

  @override
  String get calendarUnitMinutes => '分钟';

  @override
  String calendarDayAtTime(String day, String time) {
    return '$day $time';
  }

  @override
  String get calendarAllDay => '全天';

  @override
  String get calendarBadgeSeriesPremiere => '剧集首播';

  @override
  String get calendarBadgeSeasonPremiere => '新一季';

  @override
  String get calendarBadgeSeasonFinale => '大结局';

  @override
  String get calendarBadgeMidseasonFinale => '季中结局';

  @override
  String get calendarBadgeSeriesFinale => '剧集大结局';

  @override
  String get calendarBadgeNew => '新';

  @override
  String get calendarStatusInLibrary => '已在媒体库';

  @override
  String get calendarNotMonitored => '未监控';

  @override
  String get calendarMovieDetails => '电影详情';

  @override
  String get calendarProblemAdminsOnly => '此服务器上的日历仅限管理员使用。';

  @override
  String get calendarProblemNeedsSeerr => '需要先在 Moonfin 中登录 Seerr，日历才能加载。';

  @override
  String get calendarProblemNotConfigured => '尚未关联 Sonarr 或 Radarr 服务器。';

  @override
  String get calendarProblemFailed => '无法加载日历。';

  @override
  String get calendarSettingsSubtitle => '日历的样式、筛选和操作';

  @override
  String get calendarSettingsView => '观看次数';

  @override
  String get calendarSettingsStyle => '日历样式';

  @override
  String get calendarSettingsStyleDescription =>
      '“日历”按钮打开的内容。两种样式下都只需再按一个按钮即可查看完整月份。';

  @override
  String get calendarSettingsStyleAgenda => '日程';

  @override
  String get calendarSettingsStyleCountdown => '倒计时';

  @override
  String get calendarSettingsWeekStart => '每周起始日';

  @override
  String get calendarSettingsWhatShows => '显示内容';

  @override
  String get calendarSettingsScope => '显示';

  @override
  String get calendarSettingsScopeDescription => '“我的剧集”仅保留你已收藏或已开始观看的剧集';

  @override
  String get calendarSettingsScopeEverything => '全部';

  @override
  String get calendarSettingsScopeMyShows => '我的剧集';

  @override
  String get calendarSettingsUnmonitored => '包含未监控内容';

  @override
  String get calendarSettingsUnmonitoredSubtitle =>
      '同时列出 Sonarr 和 Radarr 未设置为下载的剧集和电影';

  @override
  String get calendarSettingsSpecials => '特别篇';

  @override
  String get calendarSettingsSpecialsSubtitle => '第 0 季剧集，如花絮和节日特辑';

  @override
  String get calendarSettingsBadges => '首播和大结局标签';

  @override
  String get calendarSettingsBadgesSubtitle => '标记首播、大结局和新一季';

  @override
  String get calendarSettingsColorBy => '着色依据';

  @override
  String get calendarSettingsColorByDescription =>
      '“类型”可区分剧集和电影。“状态”可显示媒体库中已有的、即将播出的或缺失的内容。';

  @override
  String get calendarSettingsColorByType => '类型';

  @override
  String get calendarSettingsImageType => '卡片图片';

  @override
  String get calendarSettingsImageTypeDescription => '“倒计时”栏目中的图片';

  @override
  String get calendarSettingsSpoilerSafe => '剧透防护';

  @override
  String get calendarSettingsSpoilerSafeSubtitle => '对你尚未追上的剧集隐藏剧集标题和剧照';

  @override
  String get calendarSettingsActions => '操作';

  @override
  String get calendarSettingsSelectAction => '选择媒体项';

  @override
  String get calendarSettingsSelectActionDescription =>
      '对媒体库中已有的内容按“确定”或轻触时执行的操作';

  @override
  String get calendarSettingsSelectDetails => '打开详情';

  @override
  String get calendarSettingsSelectPlay => '媒体库中可直接播放';

  @override
  String get calendarSettingsRequestButton => '请求按钮';

  @override
  String get calendarSettingsRequestButtonSubtitle => '在缺失的电影和季上显示 Seerr 请求按钮';

  @override
  String get calendarSettingsReminders => '提醒';

  @override
  String get calendarSettingsRemindersSubtitle => '显示“提醒我”，当某部作品加入媒体库时发送通知';

  @override
  String get calendarRowSeeAll => '“查看全部”卡片';

  @override
  String get calendarRowSeeAllSubtitle => '在“即将播出”栏目末尾添加一张可打开日历的卡片';

  @override
  String get showNextAirDate => '在末尾显示下次播出日期';

  @override
  String get showNextAirDateSubtitle => '当下一集尚未加入媒体库时，剧集末尾的卡片会显示其播出时间';

  @override
  String get afterHoursTitle => '深夜档';

  @override
  String get afterHoursUnlocked => '深夜档已解锁';

  @override
  String afterHoursPressesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '再按 $count 次',
      one: '再按 1 次',
    );
    return '$_temp0';
  }

  @override
  String afterHoursTapsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '再轻触 $count 次',
      one: '再轻触 1 次',
    );
    return '$_temp0';
  }

  @override
  String get afterHoursPlay => '播放';

  @override
  String get afterHoursLeaderboards => '排行榜';

  @override
  String get afterHoursTop3 => '前三名';

  @override
  String afterHoursScoresFrom(String server) {
    return '来自 $server 的分数';
  }

  @override
  String get afterHoursScoresOnDevice => '此设备上的分数';

  @override
  String get afterHoursGameOver => '游戏结束';

  @override
  String afterHoursNewRank(int rank) {
    return '榜单新晋第 $rank 名';
  }

  @override
  String get afterHoursPlayAgain => '再玩一次';

  @override
  String get afterHoursBackToArcade => '返回街机';

  @override
  String get afterHoursArcade => '街机';

  @override
  String get afterHoursLandscapeNote => '游玩时会切换为横屏';

  @override
  String get afterHoursTouch => '轻触';

  @override
  String get afterHoursNewTag => '新';

  @override
  String get afterHoursNoScores => '暂无分数';

  @override
  String get afterHoursPerfect => '完美';

  @override
  String get afterHoursBoxSet => '套装';

  @override
  String get afterHoursBufferRun => '缓冲冲刺';

  @override
  String get afterHoursBufferRunGenre => '可翻转重力的无尽跑酷';

  @override
  String get afterHoursBufferRunPitch => '加载画面里的跑者终于有地方可去了。二段跳并翻转重力，让它跑到天花板上。';

  @override
  String get afterHoursBufferRunRemote =>
      '按“确定”跳跃，空中再按一次翻转到另一侧。按“下”滑行。在天花板上时“上”和“下”互换。';

  @override
  String get afterHoursBufferRunTouch => '轻触跳跃，在空中再次轻触即可翻转。朝当前跑道方向滑动即可滑行。';

  @override
  String get afterHoursFastForward => '快进';

  @override
  String get afterHoursFastForwardGenre => '三跑道跑酷';

  @override
  String get afterHoursFastForwardPitch => '在三排影院过道中冲刺。跳过低矮障碍，记住爆米花车可不会为任何人让路。';

  @override
  String get afterHoursFastForwardRemote => '按“上”和“下”切换跑道，按“确定”跳跃。';

  @override
  String get afterHoursFastForwardTouch => '向上或向下滑动切换跑道，轻触跳跃。';

  @override
  String get afterHoursCableCrawl => '线缆爬行';

  @override
  String get afterHoursCableCrawlGenre => '网格爬行';

  @override
  String get afterHoursCableCrawlPitch => '引导一根 HDMI 线缆绕过电视柜背面，插上信号。';

  @override
  String get afterHoursCableCrawlRemote => '方向键转向。线缆永不停歇。';

  @override
  String get afterHoursCableCrawlTouch => '滑动转向。';

  @override
  String get afterHoursCaseStack => '光盘堆叠';

  @override
  String get afterHoursCaseStackGenre => '单键叠放游戏';

  @override
  String get afterHoursCaseStackPitch =>
      '用 Blu-ray 光盘盒搭一座齐架高的塔，每个盒子都是你媒体库中的一部作品。超出边缘的部分会被削掉，所以要精准落位。';

  @override
  String get afterHoursCaseStackRemote => '按“确定”放下光盘盒。';

  @override
  String get afterHoursCaseStackTouch => '轻触任意位置放下。';

  @override
  String get afterHoursPixelPurge => '像素清除';

  @override
  String get afterHoursPixelPurgeGenre => '打砖块游戏';

  @override
  String get afterHoursPixelPurgePitch =>
      '一次糟糕的编码让画面布满方块状伪影，而且它们每秒都会向下蔓延一点。用播放按钮在进度条上弹跳，在它们到达之前将其清除。';

  @override
  String get afterHoursPixelPurgeRemote => '按“左”和“右”移动进度条滑块。球会自动发射。';

  @override
  String get afterHoursPixelPurgeTouch => '拖动以移动进度条滑块。';

  @override
  String get afterHoursHowToPlay => '玩法说明';

  @override
  String get afterHoursStart => '开始';

  @override
  String get afterHoursBackToGame => '返回游戏';

  @override
  String get afterHoursEnemies => '敌人';

  @override
  String get afterHoursObstacles => '障碍物';

  @override
  String get afterHoursPowerups => '道具';

  @override
  String get afterHoursCastShieldLine => '可抵挡一次攻击的护盾。';

  @override
  String get afterHoursCastPointsLine => '每个 25 分。';

  @override
  String get afterHoursCastLagBat => '延迟球棒';

  @override
  String get afterHoursCastLagBatLine => '在头部高度俯冲而来。从下方滑行穿过。';

  @override
  String get afterHoursCastGremlin => '静电小精灵';

  @override
  String get afterHoursCastGremlinLine => '沿着地板或天花板向你跳来。跳起躲开。';

  @override
  String get afterHoursCastCable => '线缆线圈';

  @override
  String get afterHoursCastCableLine => '贴近地板或天花板。跳起躲开。';

  @override
  String get afterHoursCastBanner => '缓冲横幅';

  @override
  String get afterHoursCastBannerLine => '从标牌下滑过。它的立柱在另一侧相当于一堵墙。';

  @override
  String get afterHoursCastSkipIntro => '跳过片头';

  @override
  String get afterHoursCastSkipIntroLine => '三秒冲刺，可撞碎一切。';

  @override
  String get afterHoursCastPopcorn => '爆米花';

  @override
  String get afterHoursCastRollingReel => '松脱的胶片卷';

  @override
  String get afterHoursCastRollingReelLine => '沿你的跑道滚下，速度比你奔跑还快。跳起躲开。';

  @override
  String get afterHoursCastUsher => '引座员';

  @override
  String get afterHoursCastUsherLine => '向你走来，并会切换一次跑道。';

  @override
  String get afterHoursCastVelvetRope => '天鹅绒围栏';

  @override
  String get afterHoursCastVelvetRopeLine => '位置较低。跳起躲开或切换跑道。';

  @override
  String get afterHoursCastPopcornCart => '爆米花车';

  @override
  String get afterHoursCastPopcornCartLine => '太高，无法跳过。切换跑道。';

  @override
  String get afterHoursCastFrontRowPass => '前排通行证';

  @override
  String get afterHoursCastMagnet => '磁铁';

  @override
  String get afterHoursCastMagnetLine => '八秒内从每条跑道吸走电影票。';

  @override
  String get afterHoursCastTicket => '电影票';

  @override
  String get afterHoursCastBug => '干扰虫';

  @override
  String get afterHoursCastBugLine => '随机游荡。';

  @override
  String get afterHoursCastTangle => '缠结';

  @override
  String get afterHoursCastTangleLine => '缓慢追逐你的插头。';

  @override
  String get afterHoursCastStatic => '静止';

  @override
  String get afterHoursCastStaticLine => '一个失效单元。每隔三个信号出现一次。';

  @override
  String get afterHoursCastBrick => '电源适配器';

  @override
  String get afterHoursCastBrickLine => '每五个信号出现一个 2×2 方块。';

  @override
  String get afterHoursCastGhost => '幽灵';

  @override
  String get afterHoursCastGhostLine => '五秒内可穿过除边缘外的所有物体。';

  @override
  String get afterHoursCastSnip => '剪刀';

  @override
  String get afterHoursCastSnipLine => '将线缆剪成两半以获得奖励分数。';

  @override
  String get afterHoursCastSignal => '信号';

  @override
  String get afterHoursCastSignalLine => '得分，并增加两段线缆。';

  @override
  String get afterHoursCastShelfCat => '架子猫';

  @override
  String get afterHoursCastShelfCatLine => '在光盘盒落下时拍击它，使其下滑得更快。';

  @override
  String get afterHoursCastBluCase => 'Blu-ray 光盘盒';

  @override
  String get afterHoursCastBluCaseLine => '你媒体库中的一部作品。超出边缘的部分会被削掉。';

  @override
  String get afterHoursCastSteelbook => '铁盒装';

  @override
  String get afterHoursCastSteelbookLine => '每十个盒子出现一个。下滑速度快得多。';

  @override
  String get afterHoursCastPerfect => '完美落位';

  @override
  String get afterHoursCastPerfectLine => '精准落下可使塔身稍微变宽。';

  @override
  String get afterHoursCastBoxSet => '套装';

  @override
  String get afterHoursCastBoxSetLine => '连续三次完美落位可使其大幅变宽。';

  @override
  String get afterHoursCastDeadPixel => '坏点';

  @override
  String get afterHoursCastDeadPixelLine => '从清除的方块中掉落。接住它可缩小进度条滑块。';

  @override
  String get afterHoursCastMacroblock => '宏块';

  @override
  String get afterHoursCastMacroblockLine => '一次撞击即可清除。';

  @override
  String get afterHoursCastKeyframe => '关键帧';

  @override
  String get afterHoursCastKeyframeLine => '需要三次撞击，并掉落一个道具。';

  @override
  String get afterHoursCastHdrLine => '八秒内进度条滑块宽度翻倍。';

  @override
  String get afterHoursCastBufferNet => '缓冲';

  @override
  String get afterHoursCastBufferNetLine => '进度条滑块下方的网，可挽救一次失误。';

  @override
  String get afterHoursBufferRunCardTouch => '轻触跳跃，空中再次轻触翻转到另一侧。朝你所在的一侧滑动即可滑行。';

  @override
  String get afterHoursPixelPurgeCardRemote => '按“左”和“右”移动进度条滑块。';

  @override
  String get remoteMediaNotificationTitle => '远程播放通知';

  @override
  String get remoteMediaNotificationSubtitle => '在另一台设备上观看时显示系统媒体控件';

  @override
  String get remoteActivityWatching => '正在 Moonfin 上观看';

  @override
  String get remoteActivityListening => '正在 Moonfin 上收听';

  @override
  String get clickpadSeeking => '允许点击板定位进度';

  @override
  String get clickpadSeekingDescription =>
      '允许按“左”“右”和在触摸板上滑动来定位进度。否则第一次操作会调出控件。';

  @override
  String get clickpadSeekingControlsVisible => '控件显示时';

  @override
  String get clickpadSeekingPausedOnly => '仅在暂停时';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'Moonfin';

  @override
  String get animeMarkerPending => '待辦的';

  @override
  String get interfaceLanguage => '介面語言';

  @override
  String get systemLanguageDefault => '系統預設';

  @override
  String get signIn => '登入';

  @override
  String get empty => '空';

  @override
  String connectingToServer(String serverName) {
    return '正在連線到 $serverName';
  }

  @override
  String get quickConnect => '快速連線';

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
  String get back => '返回';

  @override
  String get serverUnavailable => '伺服器不可用';

  @override
  String get loginFailed => '登入失敗';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect 無法使用：$detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect 無法使用（$status）：$detail';
  }

  @override
  String get whosWatching => '誰在看？';

  @override
  String get accountActive => '積極的';

  @override
  String get addUser => '新增用戶';

  @override
  String get selectServer => '選擇伺服器';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin 版本 $version';
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
    return '要將「$serverName」從您的伺服器清單中移除嗎？';
  }

  @override
  String get cancel => '取消';

  @override
  String get remove => '移除';

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
  String get detailScreenStyle => '詳細資訊頁樣式';

  @override
  String get detailScreenStyleSubtitle =>
      '「經典」是 Moonfin 原本的置中版面；「現代」是自適應的電影感版面。';

  @override
  String get detailScreenStyleMoonfin => '經典';

  @override
  String get detailScreenStyleModern => '現代';

  @override
  String get spotlightCollectionsCard => '合輯';

  @override
  String get detailScreenStylePremiere => '首播';

  @override
  String get expandedTabs => '展開分頁';

  @override
  String get expandedTabsSubtitle => '瀏覽分頁時自動顯示內容。關閉後需手動開合每個分頁。';

  @override
  String get showTechnicalDetails => '顯示技術詳細資料？';

  @override
  String get showTechnicalDetailsSubtitle => '在橫幅摘要中顯示編解碼器、解析度與串流資訊';

  @override
  String get recommendationSystem => '推薦系統';

  @override
  String get recommendationSystemSubtitle =>
      '使用 Moonfin Recommends 的本機媒體庫演算法，或線上 TMDb 的相似度指標。注意：線上推薦需要整合 Seerr。';

  @override
  String get recommendationSystemMoonfin => 'Moonfin 推薦';

  @override
  String get recommendationSystemTmdb => 'TMDb 相似度';

  @override
  String get recommendationsApplyParentalRatingCap => '套用家長分級上限？';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      '依目標媒體的家長分級限制 Moonfin Recommends 的建議';

  @override
  String get interfaceStyle => '介面風格';

  @override
  String get interfaceStyleSubtitle =>
      '「自動」會依您的裝置調整。選擇「Apple」或「Material」可指定外觀。';

  @override
  String get interfaceStyleAutomatic => '自動';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayoutAutomatic => '自動';

  @override
  String get interfaceLayoutTv => '電視';

  @override
  String get interfaceLayoutDesktop => '桌面';

  @override
  String get glassQuality => '玻璃效果品質';

  @override
  String get glassQualitySubtitle =>
      '「自動」會為此裝置選擇最合適的玻璃效果。「完整」會強制使用真實模糊；「精簡」使用輕量玻璃，可節省 GPU 電力。';

  @override
  String get glassQualityAuto => '自動';

  @override
  String get glassQualityFull => '完整';

  @override
  String get glassQualityReduced => '精簡';

  @override
  String get performanceMode => '效能';

  @override
  String get performanceModeAuto => '自動';

  @override
  String get rendererModeAuto => '自動';

  @override
  String get settingsAppearanceThemeSubtitle =>
      '在 Moonfin 和 Neon Pulse 之間切換，無需重新啟動應用程式';

  @override
  String get customThemeTitle => '自訂主題';

  @override
  String get customThemeSubtitle => '自訂主題會改變整個 Moonfin 的視覺元素。請選擇一個符合您風格的選項。';

  @override
  String get keyboardStyleClassic => '經典';

  @override
  String get keyboardStyleGlass => '玻璃';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => '目前的 Moonfin 外觀你們都喜歡';

  @override
  String get themeNeonPulse => '霓虹脈動';

  @override
  String get themeNeonPulseSubtitle => 'Synthwave 風格具有洋紅色發光、青色文字和更強的鍍鉻對比度';

  @override
  String get themeGlass => '玻璃';

  @override
  String get themeGlassSubtitle => '液態玻璃風格，搭配流動漸層背景、霧面表面與 Apple 藍點綴';

  @override
  String get theme8BitHero => '8-bit 英雄';

  @override
  String get theme8BitHeroSubtitle => '復古像素風格，搭配粗獷色盤、方塊邊框、硬陰影與像素字體';

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
    return '無法連線到 $target';
  }

  @override
  String get exitApp => '退出Moonfin？';

  @override
  String get exitAppConfirmation => '確定要退出嗎？';

  @override
  String get exit => '退出';

  @override
  String get gameMenu => '選單';

  @override
  String get gamePaused => '已暫停';

  @override
  String get gameSaveState => '即時存檔';

  @override
  String get games => '遊戲';

  @override
  String get gameLoadState => '讀取存檔';

  @override
  String get gameFastForward => '快轉';

  @override
  String get gameEmulatorSettings => '模擬器設定';

  @override
  String get gameNoCoreOptions => '此核心沒有可調整的選項。';

  @override
  String get gameHoldToOpenMenu => '按住以開啟選單';

  @override
  String get gamePlaybackUnsupported => '此裝置尚未支援遊玩遊戲。';

  @override
  String get noHomeRowsLoaded => '無法載入首頁內容';

  @override
  String get noHomeRowsHint => '請嘗試重新載入，或減少首頁啟用的區段。';

  @override
  String get retryHomeRows => '重新載入首頁';

  @override
  String get guide => '指導';

  @override
  String get recordings => '錄影內容';

  @override
  String get schedule => '行程';

  @override
  String get series => '劇集';

  @override
  String get noItemsFound => '沒有找到物品';

  @override
  String get home => '首頁';

  @override
  String get browseAll => '瀏覽全部';

  @override
  String get genres => '類型';

  @override
  String get collectionPlaceholder => '合輯內容將顯示於此';

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
  String get library => '媒體庫';

  @override
  String get displaySettings => '顯示設定';

  @override
  String get allGenres => '所有類型';

  @override
  String get noGenresFound => '沒有找到類型';

  @override
  String failedToLoadFolderError(String error) {
    return '無法載入資料夾：$error';
  }

  @override
  String get thisFolderIsEmpty => '該資料夾是空的';

  @override
  String itemCountLabel(int count) {
    return '$count 個項目';
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
    return '$count 個項目';
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
  String get small => '小';

  @override
  String get medium => '中';

  @override
  String get large => '大';

  @override
  String get extraLarge => '特大';

  @override
  String libraryGenresTitle(String name) {
    return '$name — 類型';
  }

  @override
  String get views => '意見';

  @override
  String get albums => '專輯';

  @override
  String get albumArtists => '專輯藝人';

  @override
  String get artists => '藝人';

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
    return '$count 分鐘前';
  }

  @override
  String hoursAgo(int count) {
    return '$count 小時前';
  }

  @override
  String daysAgo(int count) {
    return '$count 天前';
  }

  @override
  String get discoverySubjects => '發現主題';

  @override
  String get apply => '套用';

  @override
  String get openLink => '打開連結';

  @override
  String get scanWithYourPhone => '用手機掃描';

  @override
  String get audiobookGenres => '有聲書類型';

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
  String get resume => '繼續';

  @override
  String get failedToLoadLibrary => '載入媒體庫失敗';

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
  String get handPickedFromLibrary => '從媒體庫中精心挑選。';

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
  String get searchYourLibrary => '搜尋媒體庫';

  @override
  String get pickUpStory => '從上次停下的地方繼續講故事';

  @override
  String get savedPlacesChapters => '您保存的地點和未完成的章節';

  @override
  String authorsCount(int count) {
    return '$count 位作者';
  }

  @override
  String genresCount(int count) {
    return '$count 種類型';
  }

  @override
  String percentCompleted(int percent) {
    return '已完成 $percent%';
  }

  @override
  String get readyWhenYouAre => '當你準備好時';

  @override
  String get details => '詳情';

  @override
  String get listeningRoom => '聽音室';

  @override
  String get bookmarksAndProgress => '書籤和進度';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count 部作品，以閱讀優先的方式編排。';
  }

  @override
  String get titles => '作品';

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
  String get noBookmarkedItems => '還沒有加書籤的項目';

  @override
  String get nothingMatchesSection => '還沒有與此部分相符的內容。嘗試另一個選項卡或在庫同步完成後返回。';

  @override
  String get audiobooks => '有聲書';

  @override
  String noLabelFound(String label) {
    return '找不到$label';
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
  String get watched => '已觀看';

  @override
  String get unread => '未讀';

  @override
  String get unwatched => '未觀看';

  @override
  String get seriesStatus => '劇集狀態';

  @override
  String get allLibraries => '所有媒體庫';

  @override
  String get books => '圖書';

  @override
  String get latestBooks => '最新書籍';

  @override
  String get latestAudiobooks => '最新有聲書';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本書',
      one: '1 本書',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => '書籍';

  @override
  String get bookFormatAudiobook => '有聲書';

  @override
  String get noBooksFound => '沒有找到該作者的書籍。';

  @override
  String bookPercentRead(int percent) {
    return '已讀 $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return '還剩 $time';
  }

  @override
  String get bookHeroRead => '閱讀';

  @override
  String get bookHeroListen => '聆聽';

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
    return '$count 個章節';
  }

  @override
  String firstPublished(int year) {
    return '首次出版於 $year';
  }

  @override
  String get noOpenLibraryOverview => 'Open Library 尚未提供此標題的概述。';

  @override
  String get subjects => '科目';

  @override
  String get all => '全部';

  @override
  String booksCount(int count) {
    return '$count 本書';
  }

  @override
  String get couldNotLoadSubject => '目前無法載入該主題。';

  @override
  String get audiobookDetails => '有聲書詳情';

  @override
  String authorsCountTitle(int count) {
    return '$count 位作者';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 本有聲書',
      one: '1 本有聲書',
    );
    return '$_temp0';
  }

  @override
  String get trackList => '曲目表';

  @override
  String get itemListPlaceholder => '項目清單將會出現在這裡';

  @override
  String get failedToLoad => '載入失敗';

  @override
  String get delete => '刪除';

  @override
  String get save => '儲存';

  @override
  String get moreLikeThis => '更多類似的';

  @override
  String get castAndCrew => '演職人員';

  @override
  String get collection => '合輯';

  @override
  String get episodes => '劇集數';

  @override
  String get nextUp => '接下來播放';

  @override
  String get seasons => '季';

  @override
  String get chapters => '章節';

  @override
  String get features => '特徵';

  @override
  String get movies => '電影';

  @override
  String get musicVideos => '音樂影片';

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
    return '第 $number 片';
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
  String get unableToLoadAuthorDetails => '目前無法載入作者詳細資訊。';

  @override
  String published(int year) {
    return '$year 年出版';
  }

  @override
  String get publicationDateUnknown => '出版日期未知';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 季',
      one: '1 季',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time 結束';
  }

  @override
  String get items => '項目';

  @override
  String get extras => '特別收錄';

  @override
  String get behindTheScenes => '幕後花絮';

  @override
  String get deletedScenes => '刪除片段';

  @override
  String get featurettes => '特輯';

  @override
  String get interviews => '訪談';

  @override
  String get scenes => '片段';

  @override
  String get shorts => '短片';

  @override
  String get trailers => '預告片';

  @override
  String timeRemaining(String time) {
    return '還剩 $time';
  }

  @override
  String endsIn(String time) {
    return '$time 後結束';
  }

  @override
  String get view => '看法';

  @override
  String get resumeReading => '繼續閱讀';

  @override
  String get read => '讀';

  @override
  String resumeFrom(String position) {
    return '從 $position 繼續播放';
  }

  @override
  String get play => '播放';

  @override
  String get startOver => '重新開始';

  @override
  String get restart => '從頭播放';

  @override
  String get readOffline => '離線閱讀';

  @override
  String get playOffline => '離線播放';

  @override
  String get audio => '音訊';

  @override
  String get subtitles => '字幕';

  @override
  String get version => '版本';

  @override
  String get cast => '投放';

  @override
  String get castMembers => '卡司';

  @override
  String get trailer => '預告片';

  @override
  String get finished => '已完成';

  @override
  String get favorited => '已收藏';

  @override
  String get favorite => '收藏';

  @override
  String get playlist => '播放清單';

  @override
  String get downloaded => '已下載';

  @override
  String get finalizingDownload => '即將完成…';

  @override
  String get downloadAll => '下載全部';

  @override
  String get download => '下載';

  @override
  String get deleteDownloaded => '刪除已下載';

  @override
  String get goToSeries => '前往劇集';

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
    return '要刪除「$title」已下載的曲目嗎？';
  }

  @override
  String get downloadedTracksDeleted => '下載的曲目已刪除';

  @override
  String get downloadedTracksDeleteFailed => '某些下載的曲目無法刪除';

  @override
  String get noTracksLoaded => '未載入曲目';

  @override
  String noItemsLoaded(String itemLabel) {
    return '未載入任何$itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '正在下載 $title（$count 個項目）...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '您確定要從伺服器刪除「$name」嗎？此動作無法復原。';
  }

  @override
  String get itemDeleted => '項目已刪除';

  @override
  String get noPlayableTrailerFound => '找不到可播放的預告片。';

  @override
  String unsupportedBookFormat(String extension) {
    return '不支援的書籍格式：.$extension';
  }

  @override
  String get audioTrack => '音軌';

  @override
  String get subtitleTrack => '字幕軌道';

  @override
  String get none => '無';

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
    return '字幕已下載並選用：$name';
  }

  @override
  String get subtitleDownloadedPending =>
      '字幕已下載。當 Jellyfin 刷新項目時，可能需要一些時間才會出現。';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '找不到 $language 的遠端字幕。';
  }

  @override
  String get selectVersion => '選擇版本';

  @override
  String versionNumber(int number) {
    return '版本 $number';
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
    return '正在下載 $name（$quality）...';
  }

  @override
  String get deleteDownloadedFiles => '刪除下載的文件';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '要刪除$typeLabel的本機檔案嗎？\n\n這將釋出儲存空間。您之後可以重新下載。';
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
  String get directors => '導演';

  @override
  String get writer => '編劇';

  @override
  String get writers => '編劇';

  @override
  String get studio => '製片商';

  @override
  String studioMoreCount(int count) {
    return '+$count 個';
  }

  @override
  String totalEpisodes(int count) {
    return '$count 集';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '第 $number 集';
  }

  @override
  String chapterNumber(int number) {
    return '第 $number 章';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 首曲目',
      one: '1 首曲目',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個章節',
      one: '1 個章節',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return '$date 出生';
  }

  @override
  String died(String date) {
    return '$date 逝世';
  }

  @override
  String age(int age) {
    return '$age 歲';
  }

  @override
  String get showLess => '顯示更少';

  @override
  String get readMore => '閱讀更多';

  @override
  String get shuffle => '隨機播放';

  @override
  String get shuffleAllMusic => '隨機播放所有音樂';

  @override
  String get carSignInPrompt => '請在您的手機上登入 Moonfin';

  @override
  String get carServerUnreachable => '無法連線到您的伺服器';

  @override
  String downloadsCount(int count) {
    return '$count 次下載';
  }

  @override
  String get perfectMatch => '完美搭配';

  @override
  String get mono => '單聲道';

  @override
  String get stereo => '立體聲';

  @override
  String remoteSubtitlePermissionError(String action) {
    return '遠端字幕$action需要此使用者具備 Jellyfin 的字幕管理權限。';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return '在伺服器上找不到此項目，無法$action遠端字幕。';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return '遠端字幕$action失敗：$detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return '遠端字幕$action失敗（HTTP $status）。';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '無法$action遠端字幕。';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '「$name」所有已下載的集數';
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
    return '$label 動作失敗：$error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return '無法設定投放音量：$error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label 控制';
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
    return '停止 $label';
  }

  @override
  String get queueIsEmpty => '隊列為空';

  @override
  String trackNumber(int number) {
    return '曲目 $number';
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
    return '$seconds 秒';
  }

  @override
  String get longPressToUnlock => '長按解鎖';

  @override
  String get off => '關閉';

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
  String get reset => '重設';

  @override
  String get unknown => '未知';

  @override
  String get playbackInformation => '播放訊息';

  @override
  String get keyNameDelete => '刪除';

  @override
  String get keyNameHome => '首頁';

  @override
  String get playback => '回放';

  @override
  String get playMethod => '播放方式';

  @override
  String get directPlay => '直接播放';

  @override
  String get directStream => '直接串流';

  @override
  String get transcoding => '轉碼';

  @override
  String get transcodeReasons => '轉碼原因';

  @override
  String get player => '播放器';

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
  String get track => '音軌';

  @override
  String get channels => '頻道';

  @override
  String get format => '格式';

  @override
  String get external => '外部的';

  @override
  String get embedded => '嵌入式';

  @override
  String castSessionError(String protocol) {
    return '$protocol 工作階段錯誤';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return '無法載入書籍詳細資訊：$error';
  }

  @override
  String get epubUnavailableOnPlatform => '應用程式內 EPUB 渲染在此平台上尚不可用。';

  @override
  String formatCannotRenderInApp(String extension) {
    return '此格式（.$extension）尚無法在應用程式內顯示。';
  }

  @override
  String get embeddedRenderingUnavailable => '嵌入式文件渲染在此平台上不可用。';

  @override
  String get couldNotOpenExternalViewer => '無法開啟外部檢視器。';

  @override
  String failedToOpenInAppReader(String error) {
    return '無法開啟應用程式內閱讀器：$error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label 已有書籤。';
  }

  @override
  String bookmarkAdded(String label) {
    return '已加入書籤：$label';
  }

  @override
  String get noBookmarksYet => '還沒有書籤。\n閱讀時點擊書籤圖示即可儲存您的位置。';

  @override
  String get noTableOfContentsAvailable => '沒有可用的目錄';

  @override
  String pageLabel(int number) {
    return '第 $number 頁';
  }

  @override
  String get position => '位置';

  @override
  String get bookReader => '圖書閱讀器';

  @override
  String formatExtension(String extension) {
    return '格式：.$extension';
  }

  @override
  String percentRead(String percent) {
    return '已讀 $percent%';
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
    return '重設縮放（${zoom}x）';
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
    return '無法更新閱讀狀態：$error';
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
    return '此平台無法載入 $extension 檔案的內嵌文件引擎。';
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
  String get seriesRecordings => '劇集錄製';

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
  String get guideRepeatBadge => '重複';

  @override
  String get guideTimeline => '指南時間表';

  @override
  String failedToLoadGuide(String error) {
    return '無法載入節目表：$error';
  }

  @override
  String get noChannelsFound => '沒有找到頻道';

  @override
  String get liveBadge => '居住';

  @override
  String guideNextProgram(String time, String title) {
    return '下一個：$time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '還剩 $minutes 分鐘';
  }

  @override
  String guideHoursLeft(int hours) {
    return '還剩 $hours 小時';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '還剩 $hours 小時 $minutes 分鐘';
  }

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
  String get record => '錄影';

  @override
  String get seriesRecordingAllEpisodes => '所有集數';

  @override
  String get cancelRecordingAction => '取消錄影';

  @override
  String get programSetToRecord => '已排定錄影';

  @override
  String get recordingCancelled => '已取消錄影';

  @override
  String get unableToCreateRecording => '無法建立錄影';

  @override
  String get watch => '觀看';

  @override
  String get close => '關閉';

  @override
  String failedToPlayChannel(String name) {
    return '無法播放 $name';
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
    return '要取消「$name」的排定錄影嗎？';
  }

  @override
  String get no => '否';

  @override
  String get yesCancel => '是，取消';

  @override
  String get failedToCancelRecording => '取消錄音失敗';

  @override
  String get failedToLoadSeriesRecordings => '劇集錄製載入失敗';

  @override
  String get noSeriesRecordings => '暫無劇集錄製';

  @override
  String get cancelSeriesRecording => '取消劇集錄製';

  @override
  String get cancelSeriesRecordingQuestion => '取消劇集錄製？';

  @override
  String stopRecordingName(String name) {
    return '要停止錄影「$name」嗎？';
  }

  @override
  String get failedToCancelSeriesRecording => '取消劇集錄製失敗';

  @override
  String get searchThisLibrary => '搜尋這個媒體庫...';

  @override
  String get searchEllipsis => '搜尋...';

  @override
  String noResultsForQuery(String query) {
    return '找不到「$query」的結果';
  }

  @override
  String searchFailedError(String error) {
    return '搜尋失敗：$error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr 帳戶類型';

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
  String get browseLibrary => '瀏覽媒體庫';

  @override
  String get deleteDownload => '刪除下載';

  @override
  String removeItemAndFiles(String name) {
    return '要移除「$name」及其檔案嗎？';
  }

  @override
  String tracksCount(int count) {
    return '$count 首曲目';
  }

  @override
  String get album => '專輯';

  @override
  String get playAlbum => '播放專輯';

  @override
  String failedToLoadAlbum(String error) {
    return '無法載入專輯：$error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '找不到 $name 已下載的曲目。';
  }

  @override
  String get season => '季';

  @override
  String get errorLoadingEpisodes => '載入劇集時出錯';

  @override
  String get noDownloadedEpisodes => '沒有下載的劇集';

  @override
  String get deleteEpisode => '刪除劇集';

  @override
  String removeName(String name) {
    return '要移除「$name」嗎？';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes 分鐘';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return '第$season季 第$episode集';
  }

  @override
  String episodeNumber(int number) {
    return '第 $number 集';
  }

  @override
  String get seriesNotFound => '未找到劇集';

  @override
  String get errorLoadingSeries => '載入劇集時出錯';

  @override
  String get downloadedEpisodes => '下載劇集';

  @override
  String seasonNumber(int number) {
    return '第 $number 季';
  }

  @override
  String seasonChip(int number) {
    return '第$number季';
  }

  @override
  String get specials => '特價商品';

  @override
  String get deleteSeason => '刪除季節';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '要刪除 $season 中所有已下載的集數嗎？';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 集',
      one: '1 集',
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
  String get savedMediaRead => '讀';

  @override
  String get sortByName => '姓名';

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
    return '要刪除 $count 個已下載的項目嗎？';
  }

  @override
  String get musicAndAudiobooks => '音樂和有聲讀物';

  @override
  String get images => '圖片';

  @override
  String get database => '資料庫';

  @override
  String ofStorageLimit(String limit) {
    return '上限 $limit';
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
  String get pluginAndRequests => '插件和請求';

  @override
  String get customizeAccountPlaybackInterface => '自訂帳戶、播放和介面行為';

  @override
  String optionsCount(int count) {
    return '$count 個選項';
  }

  @override
  String get themeAndAppearance => '主題與外觀';

  @override
  String get focusBorderColor => '焦點邊框顏色';

  @override
  String get watchedIndicators => '觀看狀態標記';

  @override
  String get always => '總是';

  @override
  String get hideUnwatched => '隱藏未觀看數量';

  @override
  String get episodesOnly => '僅限單集';

  @override
  String get never => '絕不';

  @override
  String get focusExpansionAnimation => '焦點擴展動畫';

  @override
  String get desktopUiScale => '桌面 UI 比例';

  @override
  String get scaleFocusedCards => '縮放聚焦或懸停的卡片和圖塊';

  @override
  String get seriesThumbnails => '顯示劇集縮圖';

  @override
  String get seriesThumbnailsDescription => '電視劇使用劇集主圖，而非單集縮圖。';

  @override
  String get homeRowInfoOverlay => '首頁列資訊浮層';

  @override
  String get showTitleMetadataOnHomeRows => '瀏覽首頁時顯示標題與媒體資訊';

  @override
  String get clockDisplay => '顯示時間';

  @override
  String get inMenus => '在選單中';

  @override
  String get inVideo => '影片中';

  @override
  String get seasonalEffects => '季節性影響';

  @override
  String get seasonalEffectsDescription => '視覺效果和季節性裝飾';

  @override
  String get loadingAnimationSizeThumbnail => '縮圖';

  @override
  String get loadingAnimationSizeSmall => '小';

  @override
  String get loadingAnimationSizeMedium => '中';

  @override
  String get loadingAnimationSizeLarge => '大';

  @override
  String get loadingAnimationPositionBouncing => '彈跳';

  @override
  String get snow => '雪';

  @override
  String get fireworks => '煙火';

  @override
  String get confetti => '五彩紙屑';

  @override
  String get fallingLeaves => '落葉';

  @override
  String get seasonalDensityNormal => '普通的';

  @override
  String get seasonalRowCountry => '國家／地區';

  @override
  String get seasonalRowCountryAuto => '自動';

  @override
  String get seasonalRowCountryOther => '其他';

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
  String get themeMusicOnHomeRows => '首頁主題音樂';

  @override
  String get playWhenBrowsingHomeScreen => '瀏覽首頁時播放';

  @override
  String get loopThemeMusic => '循環播放主題音樂';

  @override
  String get loopThemeMusicSubtitle => '重複播放此曲目，而非只播放一次';

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
  String get settingsScrollWheelAction => '滑鼠滾輪';

  @override
  String get settingsScrollWheelActionDescription => '選擇播放時在影片上捲動滑鼠滾輪的行為。';

  @override
  String get scrollWheelActionOff => '關閉';

  @override
  String get scrollWheelActionSeek => '跳轉（前 / 後）';

  @override
  String get scrollWheelActionVolume => '音量';

  @override
  String get playerTooltipVolume => '音量';

  @override
  String get fit => '合身';

  @override
  String get autoCrop => '自動裁切';

  @override
  String get stretch => '拉緊';

  @override
  String get refreshRateSwitching => '刷新率切換';

  @override
  String get disabled => '已停用';

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
  String get detailMetadataStatus => '劇集狀態';

  @override
  String get detailMetadataGenres => '類型';

  @override
  String get detailSectionGroupOther => '其他';

  @override
  String get detailSectionLogo => '標識';

  @override
  String get detailSectionTagline => '標語';

  @override
  String get detailSectionPoster => '海報';

  @override
  String get detailSectionUpNext => '接下來播放';

  @override
  String get detailSectionLyrics => '歌詞';

  @override
  String get detailSectionCast => '投放';

  @override
  String get detailSectionStudios => '製片商';

  @override
  String get detailSectionChapters => '章節';

  @override
  String get detailSectionExtras => '特別收錄';

  @override
  String get detailSectionCollections => '合輯';

  @override
  String get detailSectionMoreLikeThis => '更多類似的';

  @override
  String get detailSectionSeerrRecommendations => '建議';

  @override
  String get detailSectionSeerrPersonAppearances => '參演作品';

  @override
  String get detailSectionBiography => '傳';

  @override
  String get upcomingEpisodeToday => '今天';

  @override
  String get moveUp => '向上移動';

  @override
  String get moveDown => '下移';

  @override
  String get audioBehavior => '音訊行為';

  @override
  String get downmixToStereo => '縮混至立體聲';

  @override
  String get defaultAudioLanguage => '預設音訊語言';

  @override
  String get fallbackAudioLanguage => '備用音訊語言';

  @override
  String get preferDefaultAudioTrack => '優先使用預設音軌';

  @override
  String get preferDefaultAudioTrackDescription => '優先使用原始音軌，而非本地化配音。';

  @override
  String get preferAudioDescription => '優先使用口述影像音軌';

  @override
  String get preferAudioDescriptionDescription => '優先使用口述影像音軌，而非一般音軌。';

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
  String get settingsAudioFallbackCodec => '備用音訊編解碼器';

  @override
  String get settingsAudioFallbackCodecDescription =>
      '選擇當來源串流無法直接播放或直通時，多聲道音訊要轉碼成的目標格式。';

  @override
  String get settingsAudioFallbackCodecAuto => '自動偵測\n（建議）';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n（預設）';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n（Dolby Digital）';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n（Dolby Digital Plus）';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n（僅支援立體聲）';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n（高效率）';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n（無損）';

  @override
  String get settingsMaxAudioChannels => '最大音訊聲道數';

  @override
  String get settingsMaxAudioChannelsDescription =>
      '設定您音響系統的最大聲道數。超過此上限的多聲道串流將會縮混或轉碼。';

  @override
  String get settingsMaxAudioChannelsAuto => '自動偵測\n（硬體預設）';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 單聲道';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 立體聲';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 環繞聲';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 四聲道';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 環繞聲';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 環繞聲';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 環繞聲';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 環繞聲';

  @override
  String get settingsAudioPassthroughAdvanced => '直通（進階）';

  @override
  String get settingsAudioCodecPassthrough => '編解碼器直通';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      '僅啟用您的 AVR 或 HDMI 接收裝置支援的格式。';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 直通';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core 直通';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA 直通';

  @override
  String get settingsAudioPassthroughMode => '直通';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD 直通';

  @override
  String get settingsDetectedAudioCapabilities => '偵測到的音訊能力';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable => '尚無可用的執行階段能力快照。';

  @override
  String get settingsAudioRouteLabel => '路由';

  @override
  String get settingsAudioDecodeLabel => '解碼';

  @override
  String get settingsAudioPassthroughLabel => '直通';

  @override
  String get settingsAudioHdRoute => 'HD 音訊路由';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => '喇叭';

  @override
  String get settingsAudioRouteHeadphones => '耳機';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count 聲道 PCM';
  }

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
  String get nextUpAndQueuing => '接下來播放與佇列';

  @override
  String get nextUpDisplay => '接下來播放提示視窗';

  @override
  String get extended => '擴展';

  @override
  String get minimal => '精簡';

  @override
  String get nextUpTimeout => '接下來播放倒數時間';

  @override
  String secondsValue(int value) {
    return '$value 秒';
  }

  @override
  String get mediaQueuing => '媒體排隊';

  @override
  String get autoQueueNextEpisodes => '自動排隊下一集';

  @override
  String get stillWatchingPrompt => '仍在觀看提示';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '在 $episodes 集 / $hours 小時之後';
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
  String get subtitleMode => '字幕模式';

  @override
  String get subtitleModeFlagged => '已標記';

  @override
  String get subtitleModeAlways => '一律顯示';

  @override
  String get subtitleModeForeign => '外語';

  @override
  String get subtitleModeForced => '強制';

  @override
  String get subtitleModeFlaggedDescription => '播放媒體檔案中繼資料標記為「預設」或「強制」的字幕軌。';

  @override
  String get subtitleModeAlwaysDescription => '每次開始播放影片時自動載入並顯示字幕。';

  @override
  String get subtitleModeForeignDescription => '若預設音軌為外語，則自動開啟字幕。';

  @override
  String get subtitleModeForcedDescription => '僅載入明確標記為「強制」的字幕。';

  @override
  String get subtitleModeNoneDescription => '完全停用自動載入字幕。';

  @override
  String get fallbackSubtitleLanguage => '備用字幕語言';

  @override
  String get subtitleStream => '字幕串流';

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
    return '已載入 $profile 設定檔的設定。';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '無法載入 $profile 設定檔的設定。';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return '已將本機設定同步至 $profile 設定檔。';
  }

  @override
  String get syncing => '正在同步...';

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
  String get reportDownloadsActivity => '在伺服器上顯示下載紀錄';

  @override
  String get reportDownloadsActivitySubtitle => '讓伺服器管理員在儀表板中看到您轉碼過的下載';

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
  String get showGenresButton => '顯示類型按鈕';

  @override
  String get showFavoritesButton => '顯示收藏夾按鈕';

  @override
  String get showLibrariesInToolbar => '在工具列中顯示庫';

  @override
  String get navbarAlwaysExpanded => '一律展開導覽列標籤';

  @override
  String get showSeerrButton => '顯示 Seerr 按鈕';

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
  String get libraryDisplay => '媒體庫顯示';

  @override
  String get posterLabel => '海報';

  @override
  String get thumbnailLabel => '縮圖';

  @override
  String get bannerLabel => '橫幅';

  @override
  String get overridePerLibrarySettings => '覆蓋每個媒體庫的設置';

  @override
  String get applyImageTypeToAllLibraries => '將影像類型套用至所有函式庫';

  @override
  String get multiServerLibraries => '多伺服器庫';

  @override
  String get showLibrariesFromAllServers => '顯示所有連接伺服器的庫';

  @override
  String get mergeRecentRowsByTypeDescription =>
      '合併相同類型的媒體庫，並顯示於首頁的「最近新增」和「最近發行」。';

  @override
  String get libraryStyleClassic => '經典';

  @override
  String get libraryStyleModern => '現代';

  @override
  String get bookLibraryStyleClassic => '經典';

  @override
  String get musicLibraryStyleClassic => '經典';

  @override
  String get groupItemsIntoCollections => '將影片歸類至系列合輯';

  @override
  String get hideCollectionAssociatedItems => '瀏覽媒體庫時隱藏已歸入合輯的項目';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '媒體庫分組須知';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      '若要使用此設定，請確保您的 Jellyfin 或 Emby 伺服器在「媒體庫」的「顯示」中，啟用「將電影分組到系列合輯」和/或「將劇集分組到系列合輯」的設定。';

  @override
  String get libraryVisibility => '媒體庫顯示狀態';

  @override
  String get libraryVisibilityDescription =>
      '切換各媒體庫在首頁的顯示狀態。重新啟動 Moonfin 後設定才會生效。';

  @override
  String get showInNavigation => '在導航中顯示';

  @override
  String get showInLatestMedia => '在最新媒體上展示';

  @override
  String get sourceLibraries => '來源庫';

  @override
  String get sourceCollections => '來源合輯';

  @override
  String get excludedGenres => '排除的類型';

  @override
  String get selectAll => '選擇全部';

  @override
  String itemsSelected(int count) {
    return '已選取 $count 個';
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
  String get mediaBarMode => '媒體欄風格';

  @override
  String get mediaBarModeDescription => '在 Moonfin、MakD 之間進行選擇，或關閉媒體列';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => '馬克D';

  @override
  String get mediaBarModeOff => '關閉';

  @override
  String get mediaBarModeBanner => '橫幅';

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
  String get trailerAudio => '預告片音訊';

  @override
  String get enableTrailerAudio => '為媒體列中的預告片啟用音訊';

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
  String get enablePreviewAudio => '為媒體預覽啟用音訊';

  @override
  String get latestMedia => '最新媒體';

  @override
  String get recentlyReleased => '最近發行';

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
  String get resetToDefaults => '重設為預設值';

  @override
  String get homeRowPosterSize => '首頁列海報尺寸';

  @override
  String get configureImageTypeForEachRow => '設定各啟用首頁列的圖片類型';

  @override
  String get mergeContinueWatchingAndNextUp => '合併繼續觀看和接下來播放';

  @override
  String get combineBothRows => '將兩列合併為單一首頁區段';

  @override
  String get nextUpMaxDays => '接下來播放最長保留天數';

  @override
  String get nextUpMaxDaysDescription => '電視劇在上次觀看後，於接下來播放中保留的時間';

  @override
  String get fullScreenRows => '展開首頁列';

  @override
  String get fullScreenRowsDescription => '每個畫面僅顯示一列首頁內容';

  @override
  String get homeRowsPadding => '首頁列內邊距';

  @override
  String get homeRowsPaddingDescription => '自訂首頁列之間的內邊距';

  @override
  String get homeRowsExternalLists => '外部清單';

  @override
  String get perRowSettings => '每行設定';

  @override
  String get autoLogin => '自動登入';

  @override
  String get lastUser => '最後一個用戶';

  @override
  String get currentUser => '目前使用者';

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
  String get libraryArt => '媒體庫圖片';

  @override
  String get logo => '標識';

  @override
  String get clock => '鐘';

  @override
  String get timeout => '暫停';

  @override
  String minutesShort(int minutes) {
    return '$minutes 分鐘';
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
  String get displayClockDuringScreensaver => '螢幕保護期間顯示時鐘';

  @override
  String get clockModeStatic => '固定';

  @override
  String get clockModeBouncing => '彈跳';

  @override
  String get screensaverGeneralSettings => '常規設定';

  @override
  String get screensaverBackdrop => '背景';

  @override
  String get screensaverBackdropBlack => '黑色的';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropNeonPulse => '霓虹脈動';

  @override
  String get rottenTomatoesCritics => '爛番茄（評論家）';

  @override
  String get rottenTomatoesAudience => '爛番茄（觀眾）';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => '元評論家';

  @override
  String get metacriticUser => '元評論家（使用者）';

  @override
  String get trakt => 'Trakt';

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
  String get pluginDetected => '偵測到插件';

  @override
  String get pluginNotDetected => '未偵測到插件';

  @override
  String get pluginNotDetectedDescription => '目前未偵測到伺服器插件。本地設定仍然使用其保存的值或內建預設值。';

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
  String get studios => '製片商';

  @override
  String get popularSeries => '熱門劇集';

  @override
  String get seriesGenres => '劇集類型';

  @override
  String get upcomingSeries => '即將推出的劇集';

  @override
  String get networks => '網路';

  @override
  String get tags => '標籤';

  @override
  String get genresAndTags => '類型與標籤';

  @override
  String get seerrDiscoveryRows => 'Seerr 探索列';

  @override
  String get resetRowsToDefaults => '將行重設為預設值';

  @override
  String get enableSeerr => '啟用 Seerr';

  @override
  String get showSeerrInNavigation => '在導航中顯示 Seerr（需要伺服器插件）';

  @override
  String get seerrUnavailable => '不可用，因為伺服器插件 Seerr 支援已停用。';

  @override
  String get nsfwFilter => 'NSFW 過濾器';

  @override
  String get hideAdultContent => '在結果中隱藏成人內容';

  @override
  String get seerrNotificationsSection => '通知';

  @override
  String get seerrNotifyNewRequestsTitle => '新請求通知';

  @override
  String get seerrNotifyNewRequestsSubtitle => '有人提交請求時通知我';

  @override
  String get seerrNotifyLibraryAddedTitle => '請求進度更新';

  @override
  String get seerrNotifyLibraryAddedSubtitle => '已核准、已拒絕，以及已加入您的媒體庫';

  @override
  String get seerrNotifyIssuesTitle => '問題更新';

  @override
  String get seerrNotifyIssuesSubtitle => '新問題、回覆與解決結果';

  @override
  String loggedInAs(String username) {
    return '登入身分：$username';
  }

  @override
  String get discoverRows => 'Seerr 探索頁';

  @override
  String get discoverRowsDescriptionPlugin =>
      '啟用要在 Seerr 主頁顯示的列。拖曳可重新排序。自訂順序會與 Moonbase 同步。';

  @override
  String get discoverRowsDescription =>
      '啟用要在 Seerr 主頁顯示的列。拖曳可重新排序。自訂順序會與 Moonbase 同步。';

  @override
  String get enabled => '已啟用';

  @override
  String get hidden => '隱';

  @override
  String get aboutTitle => '關於';

  @override
  String versionValue(String version) {
    return '版本 $version';
  }

  @override
  String get openSourceLicenses => '開源許可證';

  @override
  String get sourceCode => '原始碼';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return '有可用更新：v$version';
  }

  @override
  String get updateNotifications => '更新通知';

  @override
  String get showWhenUpdatesAvailable => '顯示更新何時可用';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version 已推出';
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
  String get featuredContentAppearance => '特色內容、外觀';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => '圖片快取上限';

  @override
  String get clearImageCache => '清除圖片快取';

  @override
  String get imageCacheCleared => '已清除圖片快取';

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
  String get seerrDownloading => '正在下載';

  @override
  String seerrDownloadingPercent(int percent) {
    return '下載中 · $percent%';
  }

  @override
  String get seerrImportingStatus => '匯入中';

  @override
  String itemsCount(int count) {
    return '$count 個項目';
  }

  @override
  String get seerrSettings => 'Seerr 設定';

  @override
  String get requestMore => '請求更多';

  @override
  String get request => '請求';

  @override
  String get cancelRequest => '取消請求';

  @override
  String get playInMoonfin => '在 Moonfin 中播放';

  @override
  String requestedByName(String name) {
    return '由 $name 請求';
  }

  @override
  String get approve => '核准';

  @override
  String get declineAction => '衰退';

  @override
  String get similar => '相似';

  @override
  String get recommendations => '建議';

  @override
  String cancelRequestForTitle(String title) {
    return '要取消「$title」的請求嗎？';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '要取消「$title」的 $count 個請求嗎？';
  }

  @override
  String get keep => '保持';

  @override
  String get itemNotFoundInLibrary => '在您的 Moonfin 媒體庫中找不到此項目';

  @override
  String get errorSearchingLibrary => '搜尋媒體庫時出錯';

  @override
  String budgetAmount(String amount) {
    return '預算：\$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return '票房：\$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return '請求 $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return '請求 4K $type';
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
  String get appearances => '參演作品';

  @override
  String get crewSection => '幕後人員';

  @override
  String ageValue(int age) {
    return '$age 歲';
  }

  @override
  String get noRequests => '沒有請求';

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
  String get notRequestedStatus => '未請求';

  @override
  String get blocklistedStatus => '列入黑名單';

  @override
  String get deletedStatus => '已刪除';

  @override
  String get failedStatus => '失敗';

  @override
  String get processingStatus => '處理中';

  @override
  String modifiedByName(String name) {
    return '由 $name 修改';
  }

  @override
  String get completedStatus => '已完成';

  @override
  String get requestErrorDuplicate => '此作品已經請求過';

  @override
  String get requestErrorQuota => '已達請求上限';

  @override
  String get requestErrorBlocklisted => '此作品已列入封鎖名單';

  @override
  String get requestErrorNoSeasons => '沒有可請求的季數';

  @override
  String get requestErrorPermission => '您沒有權限提出此請求';

  @override
  String get seerrRequestsTitle => '請求';

  @override
  String get seerrIssuesTitle => '問題';

  @override
  String get sortNewest => '最新';

  @override
  String get sortLastModified => '最後修改';

  @override
  String get noIssues => '沒有問題';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '電影請求還剩 $remaining / $limit 個';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '季數請求還剩 $remaining / $limit 個';
  }

  @override
  String partOfCollectionName(String name) {
    return '收錄於 $name';
  }

  @override
  String get viewCollection => '查看合輯';

  @override
  String get requestCollection => '請求整個合輯';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '共 $total 部電影 · $available 部可觀看';
  }

  @override
  String requestMoviesCount(int count) {
    return '請求 $count 部電影';
  }

  @override
  String requestingProgress(int current, int total) {
    return '正在請求第 $current / $total 個...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '已請求 $count 部電影';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total 部電影中已請求 $ok 部';
  }

  @override
  String get collectionAllRequested => '所有電影皆已可觀看或已請求';

  @override
  String get reportIssue => '回報問題';

  @override
  String get issueTypeVideo => '畫面';

  @override
  String get issueTypeAudio => '聲音';

  @override
  String get whatsWrong => '發生什麼問題？';

  @override
  String get allEpisodes => '所有集數';

  @override
  String get episode => '集數';

  @override
  String get openStatus => '未解決';

  @override
  String get resolvedStatus => '已解決';

  @override
  String get resolveAction => '標為已解決';

  @override
  String get reopenAction => '重新開啟';

  @override
  String reportedByName(String name) {
    return '由 $name 回報';
  }

  @override
  String commentsCount(int count) {
    return '$count 則留言';
  }

  @override
  String get addComment => '新增留言';

  @override
  String get deleteIssueConfirm => '要刪除此問題嗎？';

  @override
  String get submitReport => '提交回報';

  @override
  String get tmdbScore => 'TMDB分數';

  @override
  String get releaseDateLabel => '發行日期';

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
  String get seasonsLabel => '季數';

  @override
  String get episodesLabel => '劇集數';

  @override
  String get access => '使用權';

  @override
  String get add => '新增';

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
  String get done => '完成';

  @override
  String get edit => '編輯';

  @override
  String get encoding => '編碼';

  @override
  String get error => '錯誤';

  @override
  String get forward => '快轉';

  @override
  String get general => '一般';

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
  String get remote => '遙控';

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
  String get trickplay => 'Trickplay';

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
  String get mute => '靜音';

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
  String get adminDrawerLibraries => '媒體庫';

  @override
  String get adminDrawerDisplay => '顯示';

  @override
  String get adminDrawerMetadata => '中繼資料';

  @override
  String get adminDrawerNfo => 'NFO 設定';

  @override
  String get adminDrawerTranscoding => '轉碼';

  @override
  String get adminDrawerResume => '繼續播放';

  @override
  String get adminDrawerStreaming => '串流媒體';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminEmbyConnect => 'Emby 連接';

  @override
  String get adminTranscodingHwaAdvanced => '進階';

  @override
  String get adminExternalIdTypeBook => '書籍';

  @override
  String get adminImageTypeMenu => '選單';

  @override
  String get adminMetadataFieldArtists => '藝人';

  @override
  String get adminMetadataFieldAlbum => '專輯';

  @override
  String get adminMetadataSectionRatings => '評級';

  @override
  String get adminLiveTvTabRecordings => '錄影內容';

  @override
  String get adminLogLevelNone => '無';

  @override
  String get adminTaskResultFailed => '失敗';

  @override
  String get adminLogWatch => '觀看';

  @override
  String get adminGroupOverview => '概述';

  @override
  String get adminGroupLibrary => '媒體庫';

  @override
  String get adminGroupPlayback => '回放';

  @override
  String get adminGroupPeople => '人們';

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
    return '有可用的外掛程式更新：$count 個';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return '需要重新啟動的外掛程式：$count 個';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return '失敗的排程工作：$count 個';
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
  String get analyticsTopGenres => '熱門類型';

  @override
  String get analyticsReleaseYears => '發行年份';

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
  String get adminLibraryScanStarted => '媒體庫掃描已開始';

  @override
  String errorGeneric(String error) {
    return '錯誤：$error';
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
    return '指令失敗：$error';
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
  String get sessionForward => '快轉';

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
  String get volume => '音量';

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
  String get adminClearDates => '明確日期';

  @override
  String get adminActivitySeverityAll => '所有嚴重程度';

  @override
  String get adminActivityDateRange => '日期範圍';

  @override
  String adminActivityLoadFailed(String error) {
    return '無法載入活動紀錄：$error';
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
    return '無法更新裝置：$error';
  }

  @override
  String get adminDeleteDevice => '刪除設備';

  @override
  String get adminDeviceDeleted => '設備已刪除';

  @override
  String adminDeviceDeleteFailed(String error) {
    return '無法刪除裝置：$error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '要移除裝置「$name」嗎？該使用者需要在此裝置上重新登入。';
  }

  @override
  String get adminDeleteAllDevices => '刪除所有裝置';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '要移除 $count 部裝置嗎？受影響的使用者需要重新登入。您目前使用的裝置不受影響。';
  }

  @override
  String get adminDevicesDeletedAll => '已移除裝置';

  @override
  String adminDevicesDeletedPartial(int count) {
    return '已移除部分裝置；有 $count 部無法移除。';
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
  String get adminScanAllLibraries => '掃描所有媒體庫';

  @override
  String get adminAddLibrary => '新增媒體庫';

  @override
  String adminScanFailed(String error) {
    return '無法開始掃描：$error';
  }

  @override
  String get adminRenameLibrary => '重新命名媒體庫';

  @override
  String get adminNewName => '新名稱';

  @override
  String adminLibraryRenamed(String name) {
    return '媒體庫已重新命名為「$name」';
  }

  @override
  String adminRenameFailed(String error) {
    return '無法重新命名：$error';
  }

  @override
  String get adminDeleteLibrary => '刪除媒體庫';

  @override
  String adminLibraryDeleted(String name) {
    return '已刪除媒體庫「$name」';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return '無法刪除媒體庫：$error';
  }

  @override
  String adminAddPathFailed(String error) {
    return '無法新增路徑：$error';
  }

  @override
  String get adminRemovePath => '刪除路徑';

  @override
  String adminRemovePathConfirm(String path) {
    return '從此媒體庫中移除「$path」嗎？';
  }

  @override
  String adminRemovePathFailed(String error) {
    return '無法移除路徑：$error';
  }

  @override
  String get adminLibraryLoadFailed => '載入媒體庫失敗';

  @override
  String get adminNoMediaPaths => '未配置媒體路徑';

  @override
  String get adminAddPath => '新增路徑';

  @override
  String get adminBrowseFilesystem => '瀏覽伺服器檔案系統：';

  @override
  String get adminPreferredMetadataLanguage => '首選元資料語言';

  @override
  String get adminMetadataLanguageHint => '例如英語、德語、法語';

  @override
  String get adminMetadataCountryCode => '元數據國家代碼';

  @override
  String get adminMetadataCountryHint => '例如美國、德國、法國';

  @override
  String get adminLibraryTabPaths => '路徑';

  @override
  String get adminLibraryTabOptions => '選項';

  @override
  String get adminLibraryTabDownloaders => '下載器';

  @override
  String get adminLibMetadataSavers => '中繼資料儲存器';

  @override
  String get adminLibSubtitleDownloaders => '字幕下載器';

  @override
  String get adminLibLyricDownloaders => '歌詞下載器';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return '中繼資料下載器：$type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return '圖片擷取器：$type';
  }

  @override
  String get adminLibNoDownloaders => '此伺服器並未為這種媒體庫類型提供任何下載器。';

  @override
  String get adminLibrarySectionGeneral => '一般';

  @override
  String get adminLibrarySectionMetadata => '中繼資料';

  @override
  String get adminLibrarySectionEmbedded => '內嵌資訊';

  @override
  String get adminLibrarySectionSubtitles => '字幕';

  @override
  String get adminLibrarySectionImages => '圖片';

  @override
  String get adminLibrarySectionSeries => '劇集';

  @override
  String get adminLibrarySectionMusic => '音樂';

  @override
  String get adminLibrarySectionMovies => '電影';

  @override
  String get adminLibRealtimeMonitor => '啟用即時監控';

  @override
  String get adminLibRealtimeMonitorHint => '偵測檔案變更並自動處理。';

  @override
  String get adminLibEnablePhotos => '顯示相片';

  @override
  String get adminLibSaveLocalMetadata => '將封面圖儲存至媒體資料夾';

  @override
  String get adminLibRefreshInterval => '自動重新整理中繼資料';

  @override
  String get adminLibRefreshNever => '永不';

  @override
  String get adminLibDefault => '預設';

  @override
  String get adminLibDisplayTitle => '顯示';

  @override
  String get adminLibDisplaySection => '媒體庫顯示';

  @override
  String get adminLibFolderView => '顯示資料夾檢視以呈現原始媒體資料夾';

  @override
  String get adminLibSpecialsInSeasons => '將特別篇顯示於其首播的季別中';

  @override
  String get adminLibGroupMovies => '將電影歸入合輯';

  @override
  String get adminLibGroupShows => '將劇集歸入合輯';

  @override
  String get adminLibExternalSuggestions => '在建議中顯示外部內容';

  @override
  String get adminLibDateAddedSection => '加入日期行為';

  @override
  String get adminLibDateAddedLabel => '加入日期的依據';

  @override
  String get adminLibDateAddedImport => '掃描進媒體庫的日期';

  @override
  String get adminLibDateAddedFile => '檔案建立的日期';

  @override
  String get adminLibMetadataTitle => '中繼資料與圖片';

  @override
  String get adminLibMetadataLangSection => '偏好的中繼資料語言';

  @override
  String get adminLibChaptersSection => '章節';

  @override
  String get adminLibDummyChapterDuration => '虛擬章節長度（秒）';

  @override
  String get adminLibDummyChapterDurationHint => '為沒有章節的媒體所產生的章節長度。設為 0 即可停用。';

  @override
  String get adminLibChapterImageResolution => '章節圖片解析度';

  @override
  String get adminLibNfoTitle => 'NFO 設定';

  @override
  String get adminLibNfoHelp =>
      'NFO 中繼資料與 Kodi 及類似的用戶端相容。這些設定會套用至所有會儲存 NFO 中繼資料的媒體庫。';

  @override
  String get adminLibKodiUser => '在 NFO 檔案中儲存觀看紀錄的使用者';

  @override
  String get adminLibSaveImagePaths => '在 NFO 檔案中儲存圖片路徑';

  @override
  String get adminLibPathSubstitution => '為 NFO 圖片路徑啟用路徑替換';

  @override
  String get adminLibExtraThumbs => '將 extrafanart 圖片複製到 extrathumbs 資料夾';

  @override
  String get adminLibNone => '無';

  @override
  String adminLibRefreshDays(int days) {
    return '$days 天';
  }

  @override
  String get adminLibEmbeddedTitles => '使用內嵌標題';

  @override
  String get adminLibEmbeddedExtrasTitles => '特別收錄使用內嵌標題';

  @override
  String get adminLibEmbeddedEpisodeInfos => '使用內嵌的集數資訊';

  @override
  String get adminLibAllowEmbeddedSubtitles => '允許內嵌字幕';

  @override
  String get adminLibEmbeddedAllowAll => '全部允許';

  @override
  String get adminLibEmbeddedAllowText => '僅文字';

  @override
  String get adminLibEmbeddedAllowImage => '僅圖片';

  @override
  String get adminLibEmbeddedAllowNone => '無';

  @override
  String get adminLibSkipIfEmbeddedSubs => '若已有內嵌字幕則略過下載';

  @override
  String get adminLibSkipIfAudioMatches => '若音軌與下載語言相符則略過下載';

  @override
  String get adminLibRequirePerfectMatch => '要求字幕完全相符';

  @override
  String get adminLibSaveSubtitlesWithMedia => '將字幕儲存至媒體資料夾';

  @override
  String get adminLibChapterImageExtraction => '擷取章節圖片';

  @override
  String get adminLibChapterImagesDuringScan => '在媒體庫掃描期間擷取章節圖片';

  @override
  String get adminLibTrickplayExtraction => '啟用 Trickplay 圖片擷取';

  @override
  String get adminLibTrickplayDuringScan => '在媒體庫掃描期間擷取 Trickplay 圖片';

  @override
  String get adminLibSaveTrickplayWithMedia => '將 Trickplay 圖片儲存至媒體資料夾';

  @override
  String get adminLibAutomaticSeriesGrouping => '自動合併散落於多個資料夾的劇集';

  @override
  String get adminLibSeasonZeroName => '第零季顯示名稱';

  @override
  String get adminLibLufsScan => '啟用 LUFS 掃描以進行音量正規化';

  @override
  String get adminLibPreferNonstandardArtist => '優先使用非標準的 artists 標籤';

  @override
  String get adminLibAutoAddToCollection => '自動將電影加入合輯';

  @override
  String get adminLibraryNameRequired => '媒體庫名稱為必填項';

  @override
  String adminLibraryCreateFailed(String error) {
    return '無法建立媒體庫：$error';
  }

  @override
  String get adminLibraryName => '媒體庫名稱';

  @override
  String get adminSelectedPaths => '選定的路徑：';

  @override
  String get adminCreateLibrary => '建立媒體庫';

  @override
  String get paths => '路徑：';

  @override
  String get adminDisableUser => '停用用戶';

  @override
  String get adminEnableUser => '啟用用戶';

  @override
  String adminDisableUserConfirm(String name) {
    return '要停用 $name 嗎？該使用者將無法登入。';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '要啟用 $name 嗎？該使用者將可以再次登入。';
  }

  @override
  String adminUserDisabled(String name) {
    return '已停用使用者「$name」';
  }

  @override
  String adminUserEnabled(String name) {
    return '已啟用使用者「$name」';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return '無法更新使用者原則：$error';
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
    return '無法建立使用者：$error';
  }

  @override
  String get adminCreateUser => '創建用戶';

  @override
  String get adminPasswordOptional => '密碼（可選）';

  @override
  String get adminUsernameRequired => '使用者名稱不能為空';

  @override
  String adminSaveFailed(String error) {
    return '無法儲存：$error';
  }

  @override
  String get adminPasswordsMismatch => '密碼不匹配';

  @override
  String adminFailed(String error) {
    return '失敗：$error';
  }

  @override
  String get adminUserLoadFailed => '載入用戶失敗';

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
  String get adminLeaveEmptyNoLimit => '留空則無限制';

  @override
  String get adminMaxActiveSessions => '最大活躍會話數';

  @override
  String get adminAllowLiveTvAccess => '允許存取直播電視';

  @override
  String get adminAllowLiveTvManagement => '允許直播電視管理';

  @override
  String get adminAllowCollectionManagement => '允許合輯管理';

  @override
  String get adminAllowSubtitleManagement => '允許字幕管理';

  @override
  String get adminAllowLyricManagement => '允許歌詞管理';

  @override
  String get adminEnableAllLibraryAccess => '允許存取所有媒體庫';

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
  String get adminLibraryAccess => '媒體庫存取';

  @override
  String get adminEnableAllDevices => '啟用對所有裝置的訪問';

  @override
  String get adminEnableAllChannels => '允許存取所有頻道';

  @override
  String get adminParentalControl => '家長控制';

  @override
  String get adminMaxParentalRating => '允許的最高家長分級';

  @override
  String get adminMaxParentalRatingHint => '分級高於此設定的內容將對此使用者隱藏。';

  @override
  String get adminParentalRatingNone => '無';

  @override
  String get adminBlockUnratedItems => '封鎖沒有分級或分級無法辨識的項目';

  @override
  String get adminUnratedBook => '書籍';

  @override
  String get adminUnratedChannelContent => '頻道';

  @override
  String get adminUnratedLiveTvChannel => '直播電視';

  @override
  String get adminUnratedMovie => '電影';

  @override
  String get adminUnratedMusic => '音樂';

  @override
  String get adminUnratedTrailer => '預告片';

  @override
  String get adminUnratedSeries => '劇集';

  @override
  String get adminAccessSchedules => '存取時間表';

  @override
  String get adminAccessSchedulesHint => '僅允許在下方排定的時段內存取。未設定時間表時，全天皆可存取。';

  @override
  String get adminAddSchedule => '新增時間表';

  @override
  String get adminScheduleDay => '日期';

  @override
  String get adminScheduleStart => '開始';

  @override
  String get adminScheduleEnd => '結束';

  @override
  String get adminDayEveryday => '每天';

  @override
  String get adminDayWeekday => '平日';

  @override
  String get adminDayWeekend => '週末';

  @override
  String get adminDaySunday => '星期日';

  @override
  String get adminDayMonday => '星期一';

  @override
  String get adminDayTuesday => '星期二';

  @override
  String get adminDayWednesday => '星期三';

  @override
  String get adminDayThursday => '星期四';

  @override
  String get adminDayFriday => '星期五';

  @override
  String get adminDaySaturday => '星期六';

  @override
  String get adminAllowedTags => '允許的標籤';

  @override
  String get adminAllowedTagsHint => '僅顯示具有這些標籤的內容。留空則允許全部。';

  @override
  String get adminBlockedTags => '封鎖的標籤';

  @override
  String get adminBlockedTagsHint => '具有這些標籤的內容將對此使用者隱藏。';

  @override
  String get adminAddTag => '新增標籤';

  @override
  String get adminAuthProvider => '驗證提供者';

  @override
  String get adminPasswordResetProvider => '密碼重設提供者';

  @override
  String get adminLoginAttemptsBeforeLockout => '鎖定前允許的最多登入失敗次數';

  @override
  String get adminLoginAttemptsHint => '設為 0 使用預設值，或設為 -1 停用鎖定。';

  @override
  String get adminSyncPlayAccess => 'SyncPlay 存取權';

  @override
  String get adminSyncPlayCreateAndJoin => '允許建立及加入群組';

  @override
  String get adminSyncPlayJoin => '允許加入群組';

  @override
  String get adminSyncPlayNone => '無存取權';

  @override
  String get adminContentDeletionFolders => '允許從下列位置刪除內容';

  @override
  String get adminResetPasswordWarning => '這將刪除密碼。用戶無需密碼即可登入。';

  @override
  String adminServerReturnedHttp(int status) {
    return '伺服器回傳 HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '您確定要刪除 $name 嗎？';
  }

  @override
  String adminUserDeleted(String name) {
    return '已刪除使用者「$name」';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return '無法刪除使用者：$error';
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
    return '無法建立金鑰：$error';
  }

  @override
  String get adminKeyTokenMissing => '伺服器回應中缺少密鑰令牌';

  @override
  String get adminRevokeApiKey => '撤銷 API 金鑰';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '要撤銷 $name 的金鑰嗎？';
  }

  @override
  String get adminApiKeyRevoked => 'API 金鑰已撤銷';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return '無法撤銷金鑰：$error';
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
    return '權杖：$token\\n建立時間：$created';
  }

  @override
  String get adminBackupOptionsTitle => '建立備份';

  @override
  String get adminBackupDatabase => '資料庫';

  @override
  String get adminBackupDatabaseAlways => '一律納入';

  @override
  String get adminBackupMetadata => '中繼資料';

  @override
  String get adminBackupSubtitles => '字幕';

  @override
  String get adminBackupTrickplay => 'Trickplay 圖片';

  @override
  String get adminCreatingBackup => '正在建立備份...';

  @override
  String get adminBackupCreated => '備份建立成功';

  @override
  String adminBackupCreateFailed(String error) {
    return '無法建立備份：$error';
  }

  @override
  String get adminBackupPathMissing => '伺服器回應中缺少備份路徑';

  @override
  String adminBackupManifest(String name) {
    return '資訊清單：$name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return '無法載入資訊清單：$error';
  }

  @override
  String get adminConfirmRestore => '確認恢復';

  @override
  String get adminRestoringBackup => '正在恢復備份...';

  @override
  String adminRestoreFailed(String error) {
    return '無法還原備份：$error';
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
    return '已儲存至 $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return '無法儲存檔案：$error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '無法載入 $fileName';
  }

  @override
  String get adminSearchInLog => '在日誌中搜尋';

  @override
  String get adminNoMatchingLines => '沒有匹配的線';

  @override
  String adminTasksLoadFailed(String error) {
    return '無法載入工作：$error';
  }

  @override
  String get adminNoScheduledTasks => '沒有找到計劃任務';

  @override
  String get adminNoTasksMatchFilter => '沒有任務與當前過濾器匹配';

  @override
  String adminTaskStartFailed(String error) {
    return '無法開始工作：$error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return '無法停止工作：$error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return '無法載入工作：$error';
  }

  @override
  String get adminRunNow => '立即運行';

  @override
  String adminTriggerRemoveFailed(String error) {
    return '無法移除觸發條件：$error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return '無法新增觸發條件：$error';
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
  String get adminNoLimit => '無限制';

  @override
  String adminHours(String hours) {
    return '$hours 小時';
  }

  @override
  String get adminDayOfWeek => '星期幾';

  @override
  String get adminSearchPlugins => '搜尋插件...';

  @override
  String adminPluginToggleFailed(String error) {
    return '無法切換外掛程式：$error';
  }

  @override
  String get adminUninstallPlugin => '解除安裝插件';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '您確定要解除安裝「$name」嗎？';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return '無法解除安裝外掛程式：$error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return '無法安裝套件：$error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return '無法安裝更新：$error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return '無法載入外掛程式：$error';
  }

  @override
  String get adminNoPluginsMatchSearch => '沒有符合您搜尋條件的插件';

  @override
  String get adminNoPluginsInstalled => '沒有安裝插件';

  @override
  String adminInstallUpdate(String version) {
    return '安裝更新（v$version）';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return '無法載入目錄：$error';
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
    return '伺服器重新啟動後將會移除「$name」';
  }

  @override
  String adminUninstallFailed(String error) {
    return '無法解除安裝：$error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '正在將「$name」更新至 v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return '無法載入外掛程式：$error';
  }

  @override
  String get adminPluginNotFound => '找不到插件';

  @override
  String adminPluginVersion(String version) {
    return '版本 $version';
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
    return '您確定要移除「$name」嗎？';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return '無法儲存存放庫：$error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return '無法載入存放庫：$error';
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
    return '無法載入外掛程式設定：$error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '無法開啟 $uri';
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
  String get adminLibraryScanConcurrency => '媒體庫並行掃描數';

  @override
  String get adminParallelImageEncodingLimit => '並行圖像編碼限制';

  @override
  String get adminSlowResponseThreshold => '慢響應閾值（毫秒）';

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
  String get adminStreamingLoadFailed => '無法加載串流媒體設置';

  @override
  String get adminStreamingDescription => '設定遠端連線的全域流比特率限制。';

  @override
  String get adminRemoteBitrateLimitMbps => '遠端客戶端位元速率限制 (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => '留空或 0 表示無限制';

  @override
  String get adminPlaybackLoadFailed => '無法載入播放設定';

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
  String get adminTrickplayLoadFailed => '無法載入 Trickplay 設定';

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
  String get adminBaseUrlHint => '例如 /jellyfin';

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
  String adminMetadataLoadFailed(String error) {
    return '無法載入中繼資料：$error';
  }

  @override
  String get adminRefreshMetadata => '重新整理元數據';

  @override
  String get recursive => '遞迴';

  @override
  String get adminReplaceAllMetadata => '替換所有元數據';

  @override
  String get adminMetadataRefreshRequested => '請求元資料刷新';

  @override
  String adminMetadataRefreshFailed(String error) {
    return '無法重新整理中繼資料：$error';
  }

  @override
  String get adminNoRemoteMatches => '未找到遠端匹配項';

  @override
  String get adminRemoteResults => '遠程結果';

  @override
  String get adminRemoteMetadataApplied => '應用遠端元數據';

  @override
  String adminRemoteSearchFailed(String error) {
    return '遠端搜尋失敗：$error';
  }

  @override
  String get adminUpdateContentType => '更新內容類型';

  @override
  String get adminContentType => '內容類型';

  @override
  String get adminContentTypeUpdated => '內容類型已更新';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return '無法更新內容類型：$error';
  }

  @override
  String get adminMetadataEditorLoadFailed => '無法載入元資料編輯器';

  @override
  String get adminNoPeopleEntries => '沒有人員條目';

  @override
  String get adminNoExternalIds => '沒有可用的外部 ID';

  @override
  String adminImageUpdated(String imageType) {
    return '已更新 $imageType 圖片';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return '無法下載圖片：$error';
  }

  @override
  String get adminUnsupportedImageFormat => '不支援的圖像格式';

  @override
  String get adminImageReadFailed => '無法讀取所選影像';

  @override
  String adminImageUploaded(String imageType) {
    return '已上傳 $imageType 圖片';
  }

  @override
  String adminImageUploadFailed(String error) {
    return '無法上傳圖片：$error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '刪除 $imageType 圖片';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '已刪除 $imageType 圖片';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return '無法刪除圖片：$error';
  }

  @override
  String get adminAllProviders => '所有提供者';

  @override
  String get adminNoRemoteImages => '未找到遠端影像';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return '調諧器探索失敗：$error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U 調諧器';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => '檔案或 URL';

  @override
  String get adminTunerIpAddress => '調諧器 IP 位址';

  @override
  String get adminTunerFriendlyName => '易記名稱';

  @override
  String get adminTunerUserAgent => '使用者代理';

  @override
  String get adminTunerCount => '同時連線上限';

  @override
  String get adminTunerCountHelp => '此調諧器同時允許的最大串流數量。設為 0 表示不限制。';

  @override
  String get adminTunerFallbackBitrate => '備用的最高串流位元率';

  @override
  String get adminTunerImportFavoritesOnly => '僅匯入我的最愛頻道';

  @override
  String get adminTunerAllowHwTranscoding => '允許硬體轉碼';

  @override
  String get adminTunerAllowFmp4 => '允許 fMP4 轉碼容器';

  @override
  String get adminTunerAllowStreamSharing => '允許共用串流';

  @override
  String get adminTunerEnableStreamLooping => '啟用串流循環';

  @override
  String get adminTunerIgnoreDts => '忽略 DTS';

  @override
  String get adminTunerReadAtNativeFramerate => '以原生影格率讀取輸入';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => '檔案或 URL';

  @override
  String get adminXmltvMoviePrefix => '電影前置字串';

  @override
  String get adminXmltvMovieCategories => '電影類別';

  @override
  String get adminXmltvCategoriesHelp => '多個類別之間請以直線（|）分隔。';

  @override
  String get adminXmltvKidsCategories => '兒童類別';

  @override
  String get adminXmltvNewsCategories => '新聞類別';

  @override
  String get adminXmltvSportsCategories => '體育類別';

  @override
  String get adminSdUsername => '使用者名稱';

  @override
  String get adminSdPassword => '密碼';

  @override
  String get adminSdCountry => '國家／地區';

  @override
  String get adminSdCountrySelect => '請選擇國家／地區';

  @override
  String get adminSdPostalCode => '郵遞區號';

  @override
  String get adminEnableAllTuners => '啟用所有調諧器';

  @override
  String adminTunerRemoveFailed(String error) {
    return '無法移除調諧器：$error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return '無法移除提供者：$error';
  }

  @override
  String get adminSeriesRecordingPath => '劇集錄製路徑';

  @override
  String get adminMovieRecordingPath => '電影錄影路徑';

  @override
  String get adminGuideDaysAuto => '自動';

  @override
  String get adminRecordingPostProcessor => '後製處理程式路徑';

  @override
  String get adminRecordingPostProcessorArgs => '後製處理器引數';

  @override
  String get adminSaveRecordingNfo => '儲存錄影的 NFO 中繼資料';

  @override
  String get adminSaveRecordingImages => '儲存錄影圖片';

  @override
  String get adminLiveTvSectionPaths => '錄影路徑';

  @override
  String get adminLiveTvSectionPostProcessing => '後製處理';

  @override
  String adminSettingsSaveFailed(String error) {
    return '無法儲存設定：$error';
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
  String get adminGuideRefreshStarted => '已開始重新整理節目表資料';

  @override
  String get adminGuideRefreshUnavailable => '此伺服器沒有節目表重新整理工作。';

  @override
  String get adminNoListingProviders => '未配置清單提供者';

  @override
  String get adminSettingsSaved => '設定已儲存';

  @override
  String get adminBackupsNotAvailable => '備份在此伺服器版本上不可用。';

  @override
  String get adminRestoreWarning1 => '恢復將用備份資料替換所有當前伺服器資料。';

  @override
  String get adminRestoreWarning2 => '目前的伺服器設定、使用者和媒體庫資料將被覆蓋。';

  @override
  String get adminRestoreWarning3 => '恢復後伺服器將重新啟動。';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '要立即還原備份 $name 嗎？';
  }

  @override
  String get adminBackupsTitle => '備份';

  @override
  String get adminUnknownDate => '日期未知';

  @override
  String get adminUnnamedBackup => '未命名備份';

  @override
  String get adminApply => '套用';

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
    return '$minutes 分鐘前';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours 小時前';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days 天前';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '無法載入 $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count 個相符項目';
  }

  @override
  String get adminLogViewerNoMatches => '沒有匹配的線';

  @override
  String get adminMetadataEditorTitle => '元資料編輯器';

  @override
  String get adminMetadataIdentify => '辨識';

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
  String get adminMetadataDisplayOrderTv => '電視';

  @override
  String get adminMetadataPersonKindAuthor => '作者';

  @override
  String get adminMetadataLockFieldName => '姓名';

  @override
  String get adminMetadataLockFieldOverview => '概述';

  @override
  String get adminMetadataLockFieldGenres => '類型';

  @override
  String get adminMetadataLockFieldCast => '人們';

  @override
  String get adminMetadataLockFieldRuntime => '運行時';

  @override
  String get adminMetadataLockFieldStudios => '製片商';

  @override
  String get adminMetadataLockFieldTags => '標籤';

  @override
  String get adminMetadataGenres => '類型';

  @override
  String get adminMetadataTags => '標籤';

  @override
  String get adminMetadataStudios => '製片商';

  @override
  String get adminMetadataPeople => '人們';

  @override
  String get adminMetadataAddGenre => '添加流派';

  @override
  String get adminMetadataAddTag => '添加標籤';

  @override
  String get adminMetadataAddStudio => '新增製片商';

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
  String get adminMetadataProvider => '提供者';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '已更新 $imageType 圖片';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '已上傳 $imageType 圖片';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '已刪除 $imageType 圖片';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return '無法下載圖片：$error';
  }

  @override
  String get adminMetadataImageReadFailed => '無法讀取所選影像';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return '無法上傳圖片：$error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '刪除 $imageType 圖片';
  }

  @override
  String get adminMetadataDeleteImageContent => '這將從項目中刪除當前圖像。';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return '無法刪除圖片：$error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '選擇 $imageType 圖片';
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
    return '有可用更新：v$version';
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
    return '安裝更新（v$version）';
  }

  @override
  String get adminPluginsCatalogNoSearchResults => '沒有符合您搜尋條件的軟體包';

  @override
  String get adminPluginsCatalogEmpty => '沒有可用的套餐';

  @override
  String adminPluginsInstalling(String name) {
    return '正在安裝「$name」...';
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
    return '$name 設定';
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
    return '無法載入存放庫：$error';
  }

  @override
  String get adminReposRemoveTitle => '刪除儲存庫';

  @override
  String adminReposRemoveConfirm(String name) {
    return '您確定要移除「$name」嗎？';
  }

  @override
  String get adminReposRemove => '移除';

  @override
  String adminReposSaveFailed(String error) {
    return '無法儲存存放庫：$error';
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
  String get adminGeneralLibraryScanConcurrency => '媒體庫並行掃描數';

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
  String get adminNetworkingEnableHttps => '啟用 HTTPS';

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
  String get adminBrandingSplashUpload => '上傳圖片';

  @override
  String get adminBrandingSplashUploaded => '已更新啟動畫面';

  @override
  String get adminBrandingSplashUploadFailed => '無法上傳啟動畫面';

  @override
  String get adminBrandingSplashDeleted => '已移除啟動畫面';

  @override
  String get adminBrandingNoSplash => '沒有自訂啟動畫面';

  @override
  String get adminPlaybackHwAccel => '硬體加速';

  @override
  String get adminPlaybackHwAccelLabel => '硬體加速';

  @override
  String get adminPlaybackEnableHwEncoding => '啟用硬體編碼';

  @override
  String get adminPlaybackQsvDevice => 'QSV 裝置';

  @override
  String get adminPlaybackEnhancedNvdec => '啟用增強型 NVDEC 解碼器';

  @override
  String get adminPlaybackPreferNativeDecoder => '優先使用系統原生的硬體解碼器';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC 解碼';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 解碼';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit 解碼';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit 解碼';

  @override
  String get adminPlaybackHwEncodingSection => '硬體編碼';

  @override
  String get adminPlaybackAllowHevcEncoding => '允許 HEVC 編碼';

  @override
  String get adminPlaybackAllowAv1Encoding => '允許 AV1 編碼';

  @override
  String get adminPlaybackIntelLowPowerH264 => '啟用 Intel 低功耗 H.264 編碼器';

  @override
  String get adminPlaybackIntelLowPowerHevc => '啟用 Intel 低功耗 HEVC 編碼器';

  @override
  String get adminPlaybackToneMapping => '色調對應';

  @override
  String get adminPlaybackEnableTonemapping => '啟用色調對應';

  @override
  String get adminPlaybackEnableVppTonemapping => '啟用 VPP 色調對應';

  @override
  String get adminPlaybackEnableVtTonemapping => '啟用 VideoToolbox 色調對應';

  @override
  String get adminPlaybackTonemappingAlgorithm => '色調對應演算法';

  @override
  String get adminPlaybackTonemappingMode => '色調對應模式';

  @override
  String get adminPlaybackTonemappingRange => '色調對應範圍';

  @override
  String get adminPlaybackTonemappingDesat => '色調對應去飽和度';

  @override
  String get adminPlaybackTonemappingPeak => '色調對應峰值';

  @override
  String get adminPlaybackTonemappingParam => '色調對應參數';

  @override
  String get adminPlaybackVppTonemappingBrightness => 'VPP 色調對應亮度';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP 色調對應對比度';

  @override
  String get adminPlaybackEncoderPreset => '編碼器預設集';

  @override
  String get adminPlaybackH264Crf => 'H.264 編碼 CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265（HEVC）編碼 CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => '去交錯方式';

  @override
  String get adminPlaybackDeinterlaceDoubleRate => '去交錯時將影格率加倍';

  @override
  String get adminPlaybackAudioSection => '音訊';

  @override
  String get adminPlaybackEnableAudioVbr => '啟用音訊 VBR 編碼';

  @override
  String get adminPlaybackDownmixBoost => '音訊縮混增益';

  @override
  String get adminPlaybackDownmixAlgorithm => '立體聲縮混演算法';

  @override
  String get adminPlaybackMaxMuxingQueue => '最大混流佇列大小';

  @override
  String get adminPlaybackAutoOption => '自動';

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
  String get adminRunningTasks => '執行中的工作';

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
    return '每天 $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return '每個$day $time';
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
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 小時',
      one: '1 小時',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => '時間';

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
    return '$days 天前';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours 小時前';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes 分鐘前';
  }

  @override
  String get adminActivityNow => '現在';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes 分';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours 小時';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days 天';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription => '設定 Trickplay 圖片產生方式，用於跳轉預覽縮圖。';

  @override
  String get adminNetworkingPublicHttpsPort => '公共 HTTPS 連接埠';

  @override
  String get adminNetworkingBaseUrl => '基本網址';

  @override
  String get adminNetworkingBaseUrlHint => '例如 /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => '公開 HTTP 連接埠';

  @override
  String get adminNetworkingRequireHttps => '強制使用 HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      '將所有遠端要求重新導向至 HTTPS。若伺服器沒有有效憑證則不會生效。';

  @override
  String get adminNetworkingCertPassword => '憑證密碼';

  @override
  String get adminNetworkingEnableIpv4 => '啟用 IPv4';

  @override
  String get adminNetworkingEnableIpv6 => '啟用 IPv6';

  @override
  String get adminNetworkingLocalSubnets => '區域網路';

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
  String get adminPlaybackThrottleDelay => '節流延遲（秒）';

  @override
  String get adminPlaybackEnableSubtitleExtraction => '允許即時擷取字幕';

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
    return '無法更新內容類型：$error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => '慢響應閾值（毫秒）';

  @override
  String get adminGeneralEnableSlowResponse => '啟用回應緩慢警告';

  @override
  String get adminGeneralQuickConnect => '啟用 Quick Connect';

  @override
  String get adminGeneralSectionServer => '伺服器';

  @override
  String get adminGeneralSectionMetadata => '中繼資料';

  @override
  String get adminGeneralSectionPaths => '路徑';

  @override
  String get adminGeneralSectionPerformance => '效能';

  @override
  String get adminGeneralCachePath => '快取路徑';

  @override
  String get adminGeneralMetadataPath => '元資料路徑';

  @override
  String get adminGeneralServerName => '伺服器名稱';

  @override
  String get adminGeneralDisplayLanguage => '偏好的顯示語言';

  @override
  String get adminSettingsLoadFailed => '無法載入設定';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return '無法更新對應：$error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return '時間限制：$duration';
  }

  @override
  String get folders => '資料夾';

  @override
  String get libraries => '媒體庫';

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
      other: '# 位參與者',
      one: '# 位參與者',
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
    return '項目 $index';
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
    return '$userName 已加入 SyncPlay 群組';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName 已離開 SyncPlay 群組';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay 存取被拒絕';

  @override
  String get syncPlayAccessDeniedMessage =>
      '您無權存取此 SyncPlay 群組中的一項或多項。請群組擁有者驗證媒體庫權限或選擇其他佇列。';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '正在將播放同步至 $groupName';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已找到 # 個列',
      one: '已找到 # 個列',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => '您目前離線';

  @override
  String get offlineBannerSubtitle => '正在顯示您的下載內容';

  @override
  String get serverUnreachableBannerTitle => '無法連線到您的伺服器';

  @override
  String get serverUnreachableBannerSubtitle => '在伺服器恢復前將播放下載的內容';

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
    return '投放控制失敗：$error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind 控制';
  }

  @override
  String get castDeviceVolume => '裝置音量';

  @override
  String get castVolumeUnavailable => '不可用';

  @override
  String castStopKind(String kind) {
    return '停止 $kind';
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
    return '請輸入 $length 位數 PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '請輸入您的 $length 位數 PIN';
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
  String get quickConnectAuthorized => '已授權 Quick Connect 要求。';

  @override
  String get quickConnectInvalidOrExpired => 'Quick Connect 代碼無效或已過期。';

  @override
  String get quickConnectNotSupported => '此伺服器不支援 Quick Connect。';

  @override
  String get quickConnectAuthorizeFailed => '無法授權 Quick Connect 代碼。';

  @override
  String get quickConnectDisabled => '此伺服器已停用 Quick Connect。';

  @override
  String get quickConnectForbidden => '您的帳戶無法授權此 Quick Connect 要求。';

  @override
  String get quickConnectNotFound => '找不到此 Quick Connect 代碼。請嘗試取得新的代碼。';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect 失敗：$message';
  }

  @override
  String get quickConnectEnterCode => '輸入代碼';

  @override
  String get quickConnectAuthorize => '授權';

  @override
  String remoteCommandFailed(String error) {
    return '指令失敗：$error';
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
    return '無法開始投放：$error';
  }

  @override
  String get noRemoteDevices => '沒有可用的遠端播放設備。';

  @override
  String get noRemoteDevicesIos =>
      '沒有可用的遠端播放設備。\n\n在 iOS 上，AirPlay 目標在模擬器中可能無法使用。';

  @override
  String get trackActionPlayNext => '播放下一個';

  @override
  String get trackActionViewDetails => '看詳情';

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
    return '正在下載 $name...';
  }

  @override
  String get trackActionDeletedFile => '已刪除下載的文件';

  @override
  String get trackActionDeleteFileFailed => '無法刪除下載的文件';

  @override
  String get shuffleBy => '隨機播放';

  @override
  String get shuffleSelectLibrary => '選擇媒體庫';

  @override
  String get shuffleSelectGenre => '選擇類型';

  @override
  String get shuffleLibrary => '媒體庫';

  @override
  String get shuffleGenre => '類型';

  @override
  String get shuffleNoLibraries => '沒有可用的相容庫。';

  @override
  String get shuffleNoGenres => '未找到適合此隨機播放模式的類型。';

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
  String get upNext => '即將播放';

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
    return '跳過$segment';
  }

  @override
  String get liveTv => '電視直播';

  @override
  String get continueWatchingAndNextUp => '繼續觀看與接下來播放';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return '正在下載 $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '正在下載 $fileName';
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
  String get playerTooltipExitFloatOnTop => '取消視窗置頂';

  @override
  String get playerTooltipLockLandscape => '鎖風景';

  @override
  String get playerTooltipUnlockOrientation => '允許旋轉';

  @override
  String get playerTooltipPrevious => '上一個';

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
  String get contextMenuGoToSeries => '前往劇集';

  @override
  String get contextMenuHideFromContinueWatching => '從「繼續觀看」中隱藏';

  @override
  String get contextMenuHideFromNextUp => '從接下來播放中隱藏';

  @override
  String get contextMenuAddToCollection => '加入合輯';

  @override
  String get settingsAdministrationSubtitle => '存取伺服器管理面板';

  @override
  String get settingsDynamicContent => '動態內容';

  @override
  String get settingsDynamicContentSubtitle => '媒體欄和視覺覆蓋';

  @override
  String get settingsAboutSubtitle => '應用程式版本、法律資訊和製作人員';

  @override
  String get settingsSortServersBy => '伺服器排序依據';

  @override
  String get settingsLastUsed => '最後使用';

  @override
  String get settingsAlphabetical => '按字母順序';

  @override
  String get settingsAllowSelfSignedCerts => '允許自我簽署憑證';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      '信任使用自我簽署或私人 CA TLS 憑證的伺服器。請僅對您自己掌控的伺服器啟用。此設定會停用所有連線的憑證驗證。';

  @override
  String get settingsHomePage => '首頁';

  @override
  String get settingsTwentyFourHourClock => '24 小時制';

  @override
  String get settingsTwentyFourHourClockSubtitle => '無論何時顯示時鐘，都使用 24 小時時間格式';

  @override
  String get settingsShowShuffleButtonInNavigation => '在導覽列中顯示隨機播放按鈕';

  @override
  String get settingsShowGenresButtonInNavigation => '在導覽列中顯示類型按鈕';

  @override
  String get settingsShowFavoritesButtonInNavigation => '在導覽列中顯示收藏夾按鈕';

  @override
  String get settingsShowLibrariesButtonInNavigation => '在導覽列中顯示庫按鈕';

  @override
  String get settingsShowSeerrButtonInNavigation => '在導覽列中顯示 Seerr 按鈕';

  @override
  String get settingsAlwaysExpandNavbarLabels => '在頂端導覽列中一律顯示文字標籤';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      '切換各媒體庫在首頁的顯示狀態。重新啟動 Moonfin 後設定才會生效。';

  @override
  String get settingsMediaBarAndLocalPreviews => '媒體欄和本地預覽';

  @override
  String get settingsVisualOverlays => '視覺疊加';

  @override
  String get settingsSeasonalSurprise => '季節性驚喜';

  @override
  String get emulatorCoreDownloading => '正在下載';

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
  String get settingsSupportMoonfinSubtitle => '請開發者喝杯咖啡';

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
  String get settingsBoth => '兩個都';

  @override
  String get settingsShuffleContentTypeFilter => '隨機播放內容類型過濾器';

  @override
  String get settingsAudioPreferencesSubtitle => '音軌、處理和直通選項';

  @override
  String get settingsAutomationAndQueueSubtitle => '自動播放和排序';

  @override
  String get settingsSyncplaySubtitle => '群組會話的同步邏輯';

  @override
  String get settingsSkipIntrosAndOutros => '跳過片頭和片尾？';

  @override
  String get settingsMediaSegmentCountdown => '媒體片段倒數';

  @override
  String get settingsProgressBar => '進度列';

  @override
  String get settingsTimer => '計時器';

  @override
  String get settingsNone => '無';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv（舊版）';

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
  String get settingsAutoAftkrtEnabled => '自動';

  @override
  String get settingsEnabledOnThisDevice => '已啟用';

  @override
  String get settingsDisabledPreferTranscode => '關閉';

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
      '「擴展」模式顯示單集劇照與倒數視窗。「精簡」模式僅顯示倒數視窗。「停用」模式會完全隱藏提示。';

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
    return '$value 毫秒';
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
  String get collections => '合輯';

  @override
  String get lastPlayed => '上次播放';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName（$serverName）';
  }

  @override
  String latestLibraryName(String libraryName) {
    return '最近新增的 $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '最近發行的 $libraryName';
  }

  @override
  String get autoplayNextEpisode => '自動播放下一集';

  @override
  String get autoplayNextEpisodeSubtitle => '有下一集時自動播放。';

  @override
  String get skipSilenceTitle => '略過靜音';

  @override
  String get skipSilenceSubtitle => '在串流支援時自動略過靜音片段。';

  @override
  String get allowExternalAudioEffectsTitle => '允許外部音效';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      '允許等化器與音效應用程式（例如 Wavelet）連接至 Media3 播放工作階段。';

  @override
  String get disableTunnelingTitle => '停用穿隧';

  @override
  String get disableTunnelingSubtitle => '強制使用非穿隧播放。在穿隧會造成音訊／視訊不連續的裝置上相當實用。';

  @override
  String get enableTunnelingTitle => '啟用穿隧';

  @override
  String get enableTunnelingSubtitle =>
      '進階功能。將音訊與視訊透過耦合的硬體路徑傳送。預設為關閉，因為在部分裝置上會造成音訊／視訊中斷。';

  @override
  String get mapDolbyVisionP7Title => '將 Dolby Vision profile 7 對應至 HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      '在不支援 Dolby Vision 的裝置上，將 Dolby Vision profile 7 串流以 HDR10 相容的 HEVC 播放。';

  @override
  String get subtitlesUseEmbeddedStyles => '使用內嵌的字幕樣式';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      '套用字幕軌中內嵌的顏色、字體與位置。停用後將改用您的字幕樣式偏好設定。';

  @override
  String get subtitlesUseEmbeddedFontSizes => '使用內嵌的字幕字體大小';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      '套用字幕軌中內嵌的字體大小提示。停用後將使用您樣式偏好設定中的字幕大小。';

  @override
  String get showMediaDetailsOnLibraryPage => '顯示媒體詳細資訊';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '在媒體庫頁面頂端顯示所選項目的詳細資訊。';

  @override
  String get useDetailedSubHeadings => '使用詳細副標題';

  @override
  String get useDetailedSubHeadingsDescription => '在媒體庫頁面顯示詳細或簡潔的子列。';

  @override
  String get savedThemesDeleteDialogTitle => '要刪除已儲存的主題嗎？';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '要從此裝置的快取中移除「$themeName」嗎？';
  }

  @override
  String get themeStore => '主題商店';

  @override
  String get themeStoreSubtitle => '瀏覽並儲存社群主題';

  @override
  String get themeStoreDescription => '儲存主題後，即可像使用其他已儲存的主題一樣使用它。';

  @override
  String get themeStoreEmpty => '目前沒有可用的主題。';

  @override
  String get themeStoreLoadFailed => '無法載入主題商店。請檢查您的連線後再試一次。';

  @override
  String get themeStoreSave => '儲存';

  @override
  String get themeStoreSaveAndApply => '儲存並套用';

  @override
  String get themeStoreSaved => '已儲存';

  @override
  String get themeStoreInvalidMessage => '無法載入此主題。';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '已儲存「$themeName」。';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '已從此裝置刪除「$themeName」。';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '無法刪除「$themeName」。';
  }

  @override
  String get savedThemesTitle => '已儲存的主題';

  @override
  String get savedThemesDescription =>
      '這些是為目前伺服器從 Moonfin 外掛程式下載的主題。刪除僅會移除此本機副本。';

  @override
  String get savedThemesEmpty => '找不到此伺服器的已儲存主題。';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • 使用中';
  }

  @override
  String get savedThemesDeleteTooltip => '刪除已儲存的主題';

  @override
  String get savedThemesManageSubtitle => '管理此裝置上已下載的外掛程式主題';

  @override
  String get themeEditor => '主題編輯器';

  @override
  String get themeEditorSubtitle => '在您的瀏覽器中開啟 Moonfin 主題編輯器';

  @override
  String get homeScreen => '首頁畫面';

  @override
  String get bottomBar => '底部列';

  @override
  String get homeRowsStyleClassic => '經典';

  @override
  String get homeRowsStyleModern => '現代';

  @override
  String get homeRowsSection => '首頁列';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription => '「經典」保留各列的圖片類型與資訊覆蓋層。「現代」使用直式轉背景圖的列。';

  @override
  String get displayFavoritesRows => '顯示我的最愛列';

  @override
  String get displayFavoritesRowsSubtitle => '在首頁中顯示收藏的電影、劇集及其他收藏列。';

  @override
  String get favoritesRowSorting => '我的最愛列排序';

  @override
  String get favoritesRowSortingDescription => '依加入日期、上映日期、字母順序等方式排序我的最愛列。';

  @override
  String get displayCollectionsRows => '顯示合輯列';

  @override
  String get displayCollectionsRowsSubtitle => '在首頁中顯示合輯列。';

  @override
  String get collectionsRowSorting => '合輯列排序';

  @override
  String get collectionsRowSortingDescription => '依加入日期、上映日期、字母順序等方式排序合輯列。';

  @override
  String get collectionsRowShowEpisodes => '顯示單集';

  @override
  String get collectionsRowShowEpisodesSubtitle => '將電視劇展開，單獨顯示每一集。';

  @override
  String get displayGenresRows => '顯示類型列';

  @override
  String get displayGenresRowsSubtitle => '在首頁中顯示類型列。';

  @override
  String get genresRowSorting => '類型列排序';

  @override
  String get genresRowSortingDescription => '依加入日期、上映日期、字母順序等方式排序類型列。';

  @override
  String get genresRowItems => '類型列項目';

  @override
  String get genresRowItemsDescription => '在類型列中顯示電影、劇集或兩者。';

  @override
  String get displayStudiosRowsSubtitle => '在首頁中顯示製片商列。';

  @override
  String get sinceYouWatchedSourceLocal => 'Moonfin 推薦';

  @override
  String get sinceYouWatchedSourceOnline => 'TMDb 相似度';

  @override
  String get selectAllStudios => '選擇全部';

  @override
  String get filtersHeader => '過濾器';

  @override
  String get displayPlaylistsRows => '顯示播放清單列';

  @override
  String get displayPlaylistsRowsSubtitle => '在首頁中顯示播放清單列。';

  @override
  String get playlistsRowSorting => '播放清單列排序';

  @override
  String get playlistsRowSortingDescription => '依加入日期、上映日期、字母順序等方式排序播放清單列。';

  @override
  String get playlistsRowShowEpisodes => '顯示單集';

  @override
  String get playlistsRowShowEpisodesSubtitle => '將電視劇展開，單獨顯示每一集。';

  @override
  String get displayAudioRows => '顯示音訊列';

  @override
  String get displayAudioRowsSubtitle => '在首頁中顯示音樂列。';

  @override
  String get audioRowsSorting => '音訊列排序';

  @override
  String get audioRowsSortingDescription => '依加入日期、上映日期、字母順序等方式排序音訊列。';

  @override
  String get externalRowSortName => '姓名';

  @override
  String get externalRowSortReleaseDate => '發行日期';

  @override
  String get externalRowSortShuffle => '隨機播放';

  @override
  String get audioPlaylists => '音訊播放清單';

  @override
  String get appearance => '外觀';

  @override
  String get layout => '版面配置';

  @override
  String get theme => '主題';

  @override
  String get keyboard => '鍵盤';

  @override
  String get navButtons => '按鈕';

  @override
  String get rendering => '算圖';

  @override
  String get mpvConfiguration => 'MPV 設定';

  @override
  String get cardSize => '首頁列項目尺寸';

  @override
  String get externalPlayerApp => '外部播放器應用程式';

  @override
  String get externalPlayerAppDescription => '設定外部播放器後即可啟用長按播放選項';

  @override
  String get externalPlayerAskEachTimeSubtitle => '開始播放時顯示應用程式選擇器。';

  @override
  String get loadingInstalledPlayers => '正在載入已安裝的播放器...';

  @override
  String get connection => '連線';

  @override
  String get passthrough => '直通';

  @override
  String get supportedOnThisDevice => '此裝置支援';

  @override
  String get notSupportedOnThisDevice => '此裝置不支援';

  @override
  String get mediaPlayerBehavior => '媒體播放器行為';

  @override
  String get playbackEnhancements => '播放增強功能';

  @override
  String get alwaysOn => '一律開啟。';

  @override
  String get replaceSkipOutroWithNextUpDisplay => '用「接下來播放」取代「跳過片尾」';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      '顯示「接下來播放」覆蓋「跳過片尾」按鈕。';

  @override
  String get playerRouting => '播放器路由';

  @override
  String get preferSoftwareDecoders => '優先使用軟體解碼器';

  @override
  String get preferSoftwareDecodersSubtitle =>
      '在硬體解碼器之前優先使用 FFmpeg（音訊）與 libgav1（AV1）。若 HDMI 音訊直通發生問題請停用。';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle => '在 Android TV 上使用您所選的外部應用程式播放影片。';

  @override
  String get automaticQueuing => '自動排入佇列';

  @override
  String get preferSdhSubtitles => '優先使用 SDH 字幕';

  @override
  String get preferSdhSubtitlesSubtitle => '自動選取字幕時優先選擇 SDH/CC 字幕軌。';

  @override
  String get webDiagnostics => '網頁診斷';

  @override
  String get webDiagnosticsTitle => 'Moonfin 網頁診斷';

  @override
  String get webDiagnosticsIntro => '使用此頁面診斷瀏覽器連線問題（CORS、混合內容與探索設定）。';

  @override
  String get webDiagnosticsDetectedMixedContentFailure => '偵測到混合內容失敗';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure => '偵測到 CORS／預檢失敗';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin 偵測到 HTTPS 頁面嘗試呼叫 HTTP 的伺服器 URL。瀏覽器會在要求送達您的伺服器之前將其封鎖。';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin 偵測到瀏覽器層級的要求失敗，這通常是因為媒體伺服器缺少 CORS 或預檢標頭所造成。';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return '目標 URL：$url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return '詳細資訊：$detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => '目前的執行階段環境';

  @override
  String get webDiagnosticsOrigin => '來源';

  @override
  String get webDiagnosticsScheme => '通訊協定';

  @override
  String get webDiagnosticsPluginMode => '外掛程式模式';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC 掃描';

  @override
  String get webDiagnosticsForcedServerUrl => '強制指定的伺服器 URL';

  @override
  String get webDiagnosticsDefaultServerUrl => '預設伺服器 URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => '探索代理 URL';

  @override
  String get notConfigured => '未設定';

  @override
  String get webDiagnosticsMixedContent => '混合內容';

  @override
  String get webDiagnosticsMixedContentDetected =>
      '此頁面透過 HTTPS 載入，但有一個或多個已設定的 URL 為 HTTP。瀏覽器會封鎖 HTTPS 頁面呼叫 HTTP API。';

  @override
  String get webDiagnosticsMixedContentFix =>
      '解決方式：透過 HTTPS 提供您的媒體伺服器或代理端點，或僅在受信任的本地網路上以 HTTP 載入 Moonfin。';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      '從目前的執行階段設定中，未偵測到明顯的混合內容問題。';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS 檢查清單';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• 在 Access-Control-Allow-Origin 中允許瀏覽器的來源。';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• 在 Access-Control-Allow-Headers 中包含 Authorization、X-Emby-Authorization 與 X-Emby-Token。';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• 為串流與跳轉行為公開 Content-Range 與 Accept-Ranges。';

  @override
  String get webDiagnosticsCorsChecklistItem4 => '• 對 OPTIONS 預檢要求回傳 204。';

  @override
  String get webDiagnosticsHeaderSnippetTitle => '標頭範例片段（nginx 風格）';

  @override
  String get note => '注意';

  @override
  String get webDiagnosticsNonWebNote =>
      '此診斷路由是為網頁版建置而設計。若您在其他平台上看到此頁面，這些檢查可能不適用。';

  @override
  String get backToServerSelect => '返回伺服器選擇';

  @override
  String get signOutAllUsers => '登出所有使用者';

  @override
  String get voiceSearchPermissionPermanentlyDenied => '麥克風權限已被永久拒絕。請至系統設定中啟用。';

  @override
  String get voiceSearchPermissionRequired => '語音搜尋需要麥克風權限。';

  @override
  String get voiceSearchNoMatch => '沒有聽清楚。請再試一次。';

  @override
  String get voiceSearchNoSpeechDetected => '未偵測到語音。';

  @override
  String get voiceSearchMicrophoneError => '麥克風錯誤。';

  @override
  String get voiceSearchNeedsInternet => '語音搜尋需要網際網路連線。';

  @override
  String get voiceSearchServiceBusy => '語音服務忙碌中。請再試一次。';

  @override
  String get microphonePermissionPermanentlyDenied => '麥克風權限已被永久拒絕。';

  @override
  String get microphonePermissionDenied => '麥克風權限遭拒。';

  @override
  String get speechRecognitionUnavailable => '此裝置無法使用語音辨識。';

  @override
  String get openIosRoutePicker => '開啟 iOS 路由選擇器';

  @override
  String get airPlayRoutePickerUnavailable => '此裝置無法使用 AirPlay 路由選擇器。';

  @override
  String get videos => '影片';

  @override
  String get programs => '節目';

  @override
  String get songs => '歌曲';

  @override
  String get photoAlbums => '相簿';

  @override
  String get photos => '相片';

  @override
  String get people => '人物';

  @override
  String get recentlyReleasedEpisodes => '最近發行的單集';

  @override
  String get watchAgain => '再看一次';

  @override
  String get guestAppearances => '客串演出';

  @override
  String get appearancesSeerr => '演出（Seerr）';

  @override
  String get crewContributionsSeerr => '幕後參與（Seerr）';

  @override
  String get watchWithGroup => '與群組一起觀看';

  @override
  String get watchPartyType => '類型';

  @override
  String get disk => '磁碟';

  @override
  String get openInBrowser => '在瀏覽器中開啟';

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count 個';
  }

  @override
  String get achievementsDailyQuests => '日常的';

  @override
  String get achievementsWeeklyQuests => '每週';

  @override
  String get achievementsAppearance => '外觀';

  @override
  String get achievementsTitles => '作品';

  @override
  String get achievementsStatsWatched => '已觀看';

  @override
  String get achievementsStatUsers => '使用者';

  @override
  String get achievementsActivity => '活動';

  @override
  String get friendsDecline => '衰退';

  @override
  String get chatGroupName => '團體名稱';

  @override
  String get chatAdmin => '行政';

  @override
  String get chatLeave => '離開群組';

  @override
  String get chatCreate => '建立群組';

  @override
  String get embeddedBrowserNotAvailable => '此平台無法使用內嵌瀏覽器。';

  @override
  String get adminRestartServerConfirmation => '您確定要重新啟動伺服器嗎？';

  @override
  String get adminShutdownServerConfirmation => '您確定要關閉伺服器嗎？之後您需要手動重新啟動它。';

  @override
  String get internal => '內部';

  @override
  String get idle => '閒置';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => '找不到使用者';

  @override
  String get adminNoUsersMatchSearch => '沒有使用者符合您的搜尋';

  @override
  String get adminNoDevicesFound => '找不到裝置';

  @override
  String get adminNoDevicesMatchCurrentFilters => '沒有裝置符合目前的篩選條件';

  @override
  String get remoteAccess => '遠端存取';

  @override
  String get localOnly => '僅限本機';

  @override
  String get adminMediaAnalyticsLoadFailed => '無法載入媒體分析';

  @override
  String get analyticsCombinedAcrossLibraries => '所有媒體庫的綜合分析數據。';

  @override
  String get analyticsTopArtists => '熱門演出者';

  @override
  String get analyticsTopAuthors => '熱門作者';

  @override
  String get analyticsTopContributors => '熱門貢獻者';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個媒體庫',
      one: '1 個媒體庫',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals => '此選擇尚無可用的已建立索引媒體總數。';

  @override
  String get analyticsLibraryDetails => '媒體庫詳細資訊';

  @override
  String get analyticsLibraryBreakdown => '媒體庫細目';

  @override
  String get analyticsNoLibrariesAvailable => '沒有可用的媒體庫。';

  @override
  String get adminServerAdministrationTitle => '伺服器管理';

  @override
  String get adminServerPathData => '資料';

  @override
  String get adminServerPathImageCache => '圖片快取';

  @override
  String get adminServerPathCache => '快取';

  @override
  String get adminServerPathLogs => '紀錄';

  @override
  String get adminServerPathMetadata => '中繼資料';

  @override
  String get adminServerPathTranscode => '轉碼';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned => '此伺服器並未回傳任何伺服器路徑。';

  @override
  String adminPercentUsed(int percent) {
    return '已使用 $percent%';
  }

  @override
  String get userActivity => '使用者活動';

  @override
  String get systemEvents => '系統事件';

  @override
  String get needsAttention => '需要處理';

  @override
  String get homeVideos => '家庭影片';

  @override
  String get mixedContent => '混合內容';

  @override
  String get homeVideosAndPhotos => '家庭影片與相片';

  @override
  String get mixedMoviesAndShows => '電影與影集混合';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => '找不到錄影';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '在 .$extension 封存檔中找不到圖片頁面。';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return '內嵌算圖器失敗（$code）：$description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB 算圖器失敗（$code）：$description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return '閱讀器找不到本機檔案：$uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '從 $uri 開啟書籍資料時發生 HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable => '沒有可讀取的書籍端點';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return '不支援的漫畫封存檔格式：.$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable => '此平台無法使用 CBR 解壓縮外掛程式。';

  @override
  String get failedToExtractCbrArchive => '無法解壓縮 .cbr 封存檔。';

  @override
  String get cb7ExtractionUnavailable => '此平台無法使用 CB7 解壓縮。';

  @override
  String get cb7ExtractionPluginUnavailable => '此平台無法使用 CB7 解壓縮外掛程式。';

  @override
  String get loadingShuffle => '正在載入隨機播放...';

  @override
  String get libraryShuffleLabel => '媒體庫隨機播放';

  @override
  String get randomShuffleLabel => '隨機播放';

  @override
  String get genresShuffleLabel => '按類型隨機播放';

  @override
  String get autoHdrSwitching => '自動切換 HDR';

  @override
  String get autoHdrSwitchingDescription => '播放 HDR 影片時自動啟用 HDR，並在結束時還原顯示模式。';

  @override
  String get whenFullscreen => '全螢幕時';

  @override
  String get changeArtwork => '變更封面圖';

  @override
  String get missing => '缺少';

  @override
  String get clearAllArtworkButton => '要清除所有封面圖嗎？';

  @override
  String get clearAllArtworkWarning => '您確定要清除所有已下載的封面圖嗎？';

  @override
  String get confirmClear => '確認清除';

  @override
  String confirmClearMessage(String itemType) {
    return '您確定要清除此$itemType嗎？';
  }

  @override
  String get uploadButton => '要上傳嗎？';

  @override
  String get resolutionLabel => '解析度： ';

  @override
  String get onlyShowInterfaceLanguage => '僅顯示介面語言的封面圖';

  @override
  String get confirmClearAll => '確認全部清除';

  @override
  String get imageUploadSuccess => '圖片已成功上傳！';

  @override
  String imageUploadFailed(String error) {
    return '無法上傳圖片：$error';
  }

  @override
  String imageDownloadFailed(String error) {
    return '無法設定圖片：$error';
  }

  @override
  String imageDeleteFailed(String error) {
    return '無法刪除圖片：$error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return '無法清除所有封面圖：$error';
  }

  @override
  String get yes => '是';

  @override
  String get posterCategory => '海報';

  @override
  String get backdropsCategory => '背景圖';

  @override
  String get bannerCategory => '橫幅';

  @override
  String get logoCategory => '標誌';

  @override
  String get thumbnailCategory => '縮圖';

  @override
  String get artCategory => '美術圖';

  @override
  String get discArtCategory => '碟面圖';

  @override
  String get screenshotCategory => '螢幕擷圖';

  @override
  String get boxCoverCategory => '盒裝封面';

  @override
  String get boxRearCoverCategory => '盒裝背面';

  @override
  String get menuArtCategory => '選單美術圖';

  @override
  String get confirmItemPoster => '海報';

  @override
  String get confirmItemBackdrop => '背景圖';

  @override
  String get confirmItemBanner => '橫幅';

  @override
  String get confirmItemLogo => '標誌';

  @override
  String get confirmItemThumbnail => '縮圖';

  @override
  String get confirmItemArt => '美術圖';

  @override
  String get confirmItemDiscArt => '碟面圖';

  @override
  String get confirmItemScreenshot => '螢幕擷圖';

  @override
  String get confirmItemBoxCover => '盒裝封面';

  @override
  String get confirmItemBoxRearCover => '盒裝背面';

  @override
  String get confirmItemMenuArt => '選單美術圖';

  @override
  String get resolutionAll => '全部';

  @override
  String get resolutionHigh => '高（1080p+）';

  @override
  String get resolutionMedium => '中（720p）';

  @override
  String get resolutionLow => '低（<720p）';

  @override
  String get sources => '來源';

  @override
  String get audiobookChapters => '章節';

  @override
  String get audiobookBookmarks => '書籤';

  @override
  String get audiobookNotes => '筆記';

  @override
  String get audiobookQueue => '佇列';

  @override
  String get audiobookTimeline => '時間軸';

  @override
  String get audiobookTimelineEmpty => '時間軸是空的';

  @override
  String get audiobookFocusedTimeline => '聚焦時間軸';

  @override
  String get audiobookExportBookmarks => '匯出書籤';

  @override
  String get audiobookExportNotes => '匯出筆記';

  @override
  String get audiobookExportAll => '全部匯出';

  @override
  String audiobookExportSuccess(String path) {
    return '已匯出至 $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return '匯出失敗：$error';
  }

  @override
  String get audiobookLyrics => '歌詞';

  @override
  String get audiobookAddBookmark => '新增書籤';

  @override
  String get audiobookAddNote => '新增筆記';

  @override
  String get audiobookEditNote => '編輯筆記';

  @override
  String get audiobookNoteHint => '為此刻寫下筆記';

  @override
  String get audiobookSleepTimer => '睡眠計時器';

  @override
  String get audiobookSleepOff => '關閉';

  @override
  String get audiobookSleepEndOfChapter => '章節結束';

  @override
  String get audiobookSleepCustom => '自訂';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '還剩 $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分鐘',
      one: '1 分鐘',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => '播放速度';

  @override
  String get audiobookRemainingTime => '剩餘';

  @override
  String get audiobookElapsedTime => '已播放';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '倒退 $seconds 秒';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '快進 $seconds 秒';
  }

  @override
  String get audiobookPreviousChapter => '上一章';

  @override
  String get audiobookNextChapter => '下一章';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '第 $current 章，共 $total 章';
  }

  @override
  String get audiobookNoChapters => '沒有章節';

  @override
  String get audiobookNoBookmarks => '尚無書籤';

  @override
  String get audiobookNoNotes => '尚無筆記';

  @override
  String audiobookBookmarkAdded(String position) {
    return '已於 $position 新增書籤';
  }

  @override
  String get audiobookSpeedReset => '重設為 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => '儲存';

  @override
  String get audiobookCancel => '取消';

  @override
  String get audiobookDelete => '刪除';

  @override
  String get subtitlePreferencesDescription => '變更字幕模式、預設語言、外觀與算圖選項。';

  @override
  String get subtitleRendering => '字幕算圖';

  @override
  String get displayOptions => '顯示選項';

  @override
  String get releaseDateAscending => '上映日期（由舊到新）';

  @override
  String get releaseDateDescending => '上映日期（由新到舊）';

  @override
  String get groupContributions => '參與作品分組';

  @override
  String get groupMultipleRoles => '將多個角色分為一組';

  @override
  String get libraryWriteAccessWarningTitle => '媒體庫寫入權限警告';

  @override
  String get libraryWriteAccessHowToFix => '解決方式：';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. 在伺服器上，為您的媒體庫資料夾授予 Jellyfin 服務使用者（例如 jellyfin 或 Docker PUID/PGID）寫入權限。\n\n2. 或者前往您的 Jellyfin 儀表板 -> 媒體庫，編輯此媒體庫並停用「Save artwork into media folders」，將封面圖儲存於 Jellyfin 的內部資料庫中。';

  @override
  String get dismiss => '知道了';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '您的「$libraryName」媒體庫已設定為將封面圖直接儲存至媒體資料夾（「Save artwork into media folders」已啟用）。然而 Jellyfin 已測試寫入權限，發現沒有權限將檔案寫入此目錄：\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      '看來 Jellyfin 無法更新封面圖。您的媒體庫已設定為將封面圖直接儲存至媒體資料夾（「Save artwork into media folders」已啟用）。此錯誤通常發生於 Jellyfin 伺服器程序沒有權限將檔案寫入您的媒體目錄時。';

  @override
  String get replay => '重播';

  @override
  String get fileInformation => '檔案資訊';

  @override
  String fileSizeFormat(Object size, Object format) {
    return '大小：$size  •  格式：$format';
  }

  @override
  String showAllAudioTracks(int count) {
    return '顯示全部（$count）音軌';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return '顯示全部（$count）字幕軌';
  }

  @override
  String get checkingDirectPlay => '正在檢查直接播放能力...';

  @override
  String get directPlayCapabilityLabel => '直接播放能力： ';

  @override
  String get forced => '強制';

  @override
  String get transcodeContainerNotSupported => '播放器不支援此容器格式。';

  @override
  String get transcodeVideoCodecNotSupported => '不支援此視訊編解碼器。';

  @override
  String get transcodeAudioCodecNotSupported => '不支援此音訊編解碼器。';

  @override
  String get transcodeSubtitleCodecNotSupported => '不支援此字幕格式（需要燒錄）。';

  @override
  String get transcodeAudioProfileNotSupported => '不支援此音訊設定檔。';

  @override
  String get transcodeVideoProfileNotSupported => '不支援此視訊設定檔。';

  @override
  String get transcodeVideoLevelNotSupported => '不支援此視訊等級。';

  @override
  String get transcodeVideoResolutionNotSupported => '此裝置不支援此視訊解析度。';

  @override
  String get transcodeVideoBitDepthNotSupported => '不支援此視訊位元深度。';

  @override
  String get transcodeVideoFramerateNotSupported => '不支援此視訊影格率。';

  @override
  String get transcodeContainerBitrateExceedsLimit => '檔案位元率超出播放器的串流上限。';

  @override
  String get transcodeVideoBitrateExceedsLimit => '視訊位元率超出串流上限。';

  @override
  String get transcodeAudioBitrateExceedsLimit => '音訊位元率超出串流上限。';

  @override
  String get transcodeAudioChannelsNotSupported => '不支援此音訊聲道數。';

  @override
  String get sortAlphabetical => '依字母順序';

  @override
  String get sortReleaseAscending => '上映順序（由舊到新）';

  @override
  String get sortReleaseDescending => '上映順序（由新到舊）';

  @override
  String get sortCustomDragDrop => '自訂（拖放）';

  @override
  String get playlistSortOptions => '播放清單排序選項';

  @override
  String get resetSort => '重設排序';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return '重看 第$season季第$episode集';
  }

  @override
  String get rewatchPlaylist => '重看播放清單';

  @override
  String get noSubtitlesFound => '找不到字幕。';

  @override
  String get adminControls => '管理員控制';

  @override
  String get impellerRendering => '算圖引擎（Impeller）';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller 是 Flutter 新一代的 GPU 算圖器，可帶來更流暢的動畫並減少卡頓。在部分電視盒與較舊的 GPU 上可能造成畫面異常或黑畫面；若您遇到這些狀況請將其關閉。「自動」會為您的裝置選擇最合適的預設值。需重新啟動 Moonfin 才會生效。';

  @override
  String get impellerAuto => '自動';

  @override
  String get impellerOn => '開啟';

  @override
  String get impellerOff => '關閉';

  @override
  String get impellerRestartTitle => '需要重新啟動';

  @override
  String get impellerRestartMessage =>
      'Moonfin 需要重新啟動才能變更算圖引擎。請立即關閉應用程式，再重新開啟以套用。';

  @override
  String get impellerCloseNow => '立即關閉應用程式';

  @override
  String get adminRefreshLibrary => '重新整理媒體庫';

  @override
  String get adminRefreshAllLibraries => '重新整理所有媒體庫';

  @override
  String get adminRepoSortDateOldest => '加入日期（由舊到新）';

  @override
  String get adminRepoSortDateNewest => '加入日期（由新到舊）';

  @override
  String get adminRepoSortNameAsc => '依字母順序（A 到 Z）';

  @override
  String get adminRepoSortNameDesc => '依字母順序（Z 到 A）';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return '正在載入伺服器分析... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => '與來源相符';

  @override
  String get imdbTop250Movies => 'IMDb 250 大電影';

  @override
  String get imdbTop250TvShows => 'IMDb 250 大電視劇';

  @override
  String get imdbMostPopularMovies => 'IMDb 最熱門電影';

  @override
  String get imdbMostPopularTvShows => 'IMDb 最熱門電視劇';

  @override
  String get imdbLowestRatedMovies => 'IMDb 評分最低電影';

  @override
  String get imdbTopEnglishMovies => 'IMDb 評分最高英語電影';

  @override
  String get playlistTypeVideo => '影片';

  @override
  String get playlistTypeAudiobook => '有聲書';

  @override
  String get playlistTypeBook => '書籍';

  @override
  String get audioPlaylistsSection => '音訊播放清單';

  @override
  String get groupByStudio => '製片商';

  @override
  String get filterTrailers => '預告片';

  @override
  String get filterExtras => '特別收錄';

  @override
  String get seerrOriginalLanguage => '原始語言';

  @override
  String get seerrRuntime => '運行時';

  @override
  String get setupStyleClassic => '經典';

  @override
  String get setupStyleModern => '現代';

  @override
  String get setupStylePremiere => '首播';

  @override
  String get autoDownloadKeepAll => '全部';

  @override
  String get autoDownloadDeleteNever => '絕不';

  @override
  String get downloadNotificationRunning => '正在下載';

  @override
  String get animationSpeedMedium => '中';

  @override
  String get animationSpeedOff => '關閉';

  @override
  String get bottomNavbarTabsAutomatic => '自動';

  @override
  String get bottomNavbarTabsAvailable => '可用的';

  @override
  String get integrations => '整合';

  @override
  String get settingsAdvancedSection => '進階';

  @override
  String get playlistSortReleaseDate => '發行日期';

  @override
  String get playlistSortRuntime => '運行時';

  @override
  String get playlistSortLastPlayed => '上次播放';

  @override
  String get librarySortAlbum => '專輯';

  @override
  String get librarySortGenre => '類型';

  @override
  String get detailsBackdropFit => '合身';

  @override
  String get recordPromptNow => '現在';

  @override
  String get siloApproveSignInApprove => '核准';

  @override
  String get calendarSettingsView => '看法';

  @override
  String get calendarSettingsSpecials => '特價商品';

  @override
  String get calendarSettingsColorByType => '類型';

  @override
  String get calendarSettingsActions => '行動';

  @override
  String get afterHoursPlay => '播放';

  @override
  String get afterHoursStart => '開始';

  @override
  String get afterHoursCastStatic => '固定';
}
