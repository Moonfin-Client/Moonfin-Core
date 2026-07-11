// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'มูนฟิน';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'เข้าสู่ระบบ';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'กำลังเชื่อมต่อกับ $serverName';
  }

  @override
  String get quickConnect => 'เชื่อมต่อด่วน';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get username => 'ชื่อผู้ใช้';

  @override
  String get email => 'อีเมล';

  @override
  String get quickConnectInstruction =>
      'ป้อนรหัสนี้บนแดชบอร์ดเว็บเซิร์ฟเวอร์ของคุณ:';

  @override
  String get waitingForAuthorization => 'กำลังรอการอนุญาต...';

  @override
  String get back => 'กลับ';

  @override
  String get serverUnavailable => 'เซิร์ฟเวอร์ไม่พร้อมใช้งาน';

  @override
  String get loginFailed => 'การเข้าสู่ระบบล้มเหลว';

  @override
  String quickConnectUnavailable(String detail) {
    return 'การเชื่อมต่อด่วนไม่พร้อมใช้งาน: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'การเชื่อมต่อด่วนไม่พร้อมใช้งาน ($status): $detail';
  }

  @override
  String get whosWatching => 'ใครกำลังดูอยู่?';

  @override
  String get addUser => 'เพิ่มผู้ใช้';

  @override
  String get selectServer => 'เลือกเซิร์ฟเวอร์';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin เวอร์ชั่น $version';
  }

  @override
  String get savedServers => 'เซิร์ฟเวอร์ที่บันทึกไว้';

  @override
  String get discoveredServers => 'เซิร์ฟเวอร์ที่ค้นพบ';

  @override
  String get noneFound => 'ไม่พบเลย';

  @override
  String get unableToConnectToServer => 'ไม่สามารถเชื่อมต่อกับเซิร์ฟเวอร์ได้';

  @override
  String get addServer => 'เพิ่มเซิร์ฟเวอร์';

  @override
  String get embyConnect => 'Emby เชื่อมต่อ';

  @override
  String get removeServer => 'ลบเซิร์ฟเวอร์';

  @override
  String removeServerConfirmation(String serverName) {
    return 'ลบ \"$serverName\" ออกจากเซิร์ฟเวอร์ของคุณหรือไม่';
  }

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get remove => 'ลบ';

  @override
  String get connectToServer => 'เชื่อมต่อกับเซิร์ฟเวอร์';

  @override
  String get serverAddress => 'ที่อยู่เซิร์ฟเวอร์';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'เชื่อมต่อ';

  @override
  String get secureStorageUnavailable =>
      'พื้นที่เก็บข้อมูลที่ปลอดภัยไม่พร้อมใช้งาน';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin ไม่สามารถเข้าถึงพวงกุญแจระบบของคุณได้ การเข้าสู่ระบบสามารถดำเนินการต่อได้ แต่พื้นที่เก็บข้อมูลโทเค็นที่ปลอดภัยอาจไม่พร้อมใช้งานจนกว่าจะปลดล็อคพวงกุญแจ';

  @override
  String get ok => 'ตกลง';

  @override
  String get settingsAppearanceTheme => 'ธีมแอป';

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
      'สลับระหว่าง Moonfin และ Neon Pulse โดยไม่ต้องรีสตาร์ทแอป';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'ต้องการแป้นพิมพ์ระบบ';

  @override
  String get keyboardPreferSystemImeDescription =>
      'ใช้วิธีการป้อนข้อมูลจากอุปกรณ์ของคุณเป็นค่าเริ่มต้นสำหรับการป้อนข้อความ';

  @override
  String get themeMoonfin => 'มูนฟิน';

  @override
  String get themeMoonfinSubtitle =>
      'ปัจจุบัน Moonfin ดูสิ พวกคุณทุกคนต้องหลงรัก';

  @override
  String get themeNeonPulse => 'นีออนพัลส์';

  @override
  String get themeNeonPulseSubtitle =>
      'สไตล์ซินธ์เวฟพร้อมเรืองแสงสีม่วงแดง ข้อความสีฟ้า และคอนทราสต์ของโครเมียมที่เข้มกว่า';

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
  String get embyConnectSignInSubtitle =>
      'ลงชื่อเข้าใช้ด้วยบัญชี Emby เชื่อมต่อของคุณ';

  @override
  String get emailOrUsername => 'อีเมลหรือชื่อผู้ใช้';

  @override
  String get selectAServer => 'เลือกเซิร์ฟเวอร์';

  @override
  String get tryAgain => 'ลองอีกครั้ง';

  @override
  String get noLinkedServers =>
      'ไม่มีเซิร์ฟเวอร์ที่เชื่อมโยงกับบัญชี Emby Connect นี้';

  @override
  String get invalidEmbyConnectCredentials =>
      'Emby เชื่อมต่อข้อมูลรับรองไม่ถูกต้อง';

  @override
  String get invalidEmbyConnectLogin =>
      'Emby เชื่อมต่อชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง';

  @override
  String get embyConnectExchangeNotSupported =>
      'เซิร์ฟเวอร์ไม่รองรับการแลกเปลี่ยน Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'เครือข่ายเกิดข้อผิดพลาดขณะติดต่อ Emby Connect หรือเซิร์ฟเวอร์ที่เลือก';

  @override
  String get loadingLinkedServers => 'กำลังโหลดเซิร์ฟเวอร์ที่เชื่อมโยง...';

  @override
  String get connectingToServerEllipsis => 'กำลังเชื่อมต่อกับเซิร์ฟเวอร์...';

  @override
  String get noReachableAddress => 'ไม่มีที่อยู่ที่สามารถติดต่อได้';

  @override
  String get invalidServerExchangeResponse =>
      'การตอบสนองไม่ถูกต้องจากจุดสิ้นสุดการแลกเปลี่ยนเซิร์ฟเวอร์';

  @override
  String unableToConnectTo(String target) {
    return 'ไม่สามารถเชื่อมต่อกับ $target';
  }

  @override
  String get exitApp => 'ออกจาก Moonfin?';

  @override
  String get exitAppConfirmation => 'คุณแน่ใจหรือไม่ว่าต้องการออก';

  @override
  String get exit => 'ออก';

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
  String get noHomeRowsLoaded => 'ไม่สามารถโหลดแถวบ้านได้';

  @override
  String get noHomeRowsHint => 'ลองรีเฟรชหรือลดส่วนของบ้านที่ใช้งานอยู่';

  @override
  String get retryHomeRows => 'ลองแถวบ้านอีกครั้ง';

  @override
  String get guide => 'แนะนำ';

  @override
  String get recordings => 'การบันทึก';

  @override
  String get schedule => 'กำหนดการ';

  @override
  String get series => 'ชุด';

  @override
  String get noItemsFound => 'ไม่พบรายการ';

  @override
  String get home => 'บ้าน';

  @override
  String get browseAll => 'เรียกดูทั้งหมด';

  @override
  String get genres => 'ประเภท';

  @override
  String get collectionPlaceholder => 'รายการคอลเลกชันจะปรากฏที่นี่';

  @override
  String get browseByLetter => 'เรียกดูตามตัวอักษร';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'การเรียกดูตามตัวอักษรจะปรากฏที่นี่';

  @override
  String get suggestions => 'ข้อเสนอแนะ';

  @override
  String get suggestionsPlaceholder => 'รายการแนะนำจะปรากฏที่นี่';

  @override
  String get failedToLoadLibraries => 'ไม่สามารถโหลดไลบรารี';

  @override
  String get noLibrariesFound => 'ไม่พบห้องสมุด';

  @override
  String get library => 'ห้องสมุด';

  @override
  String get displaySettings => 'การตั้งค่าการแสดงผล';

  @override
  String get allGenres => 'ทุกประเภท';

  @override
  String get noGenresFound => 'ไม่พบประเภท';

  @override
  String failedToLoadFolderError(String error) {
    return 'ไม่สามารถโหลดโฟลเดอร์: $error';
  }

  @override
  String get thisFolderIsEmpty => 'โฟลเดอร์นี้ว่างเปล่า';

  @override
  String itemCountLabel(int count) {
    return '$count รายการ';
  }

  @override
  String get failedToLoadFavorites => 'โหลดรายการโปรดไม่สำเร็จ';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get noFavoritesYet => 'ยังไม่มีรายการโปรด';

  @override
  String get favorites => 'รายการโปรด';

  @override
  String totalCountItems(int count) {
    return '$count รายการ';
  }

  @override
  String get continuing => 'อย่างต่อเนื่อง';

  @override
  String get ended => 'สิ้นสุดแล้ว';

  @override
  String get sortAndFilter => 'จัดเรียงและกรอง';

  @override
  String get type => 'พิมพ์';

  @override
  String get sortBy => 'เรียงตาม';

  @override
  String get display => 'แสดง';

  @override
  String get imageType => 'ประเภทรูปภาพ';

  @override
  String get posterSize => 'ขนาดโปสเตอร์';

  @override
  String get small => 'เล็ก';

  @override
  String get medium => 'ปานกลาง';

  @override
  String get large => 'ใหญ่';

  @override
  String get extraLarge => 'ใหญ่พิเศษ';

  @override
  String libraryGenresTitle(String name) {
    return '$name — ประเภท';
  }

  @override
  String get views => 'จำนวนการดู';

  @override
  String get albums => 'อัลบั้ม';

  @override
  String get albumArtists => 'ศิลปินอัลบั้ม';

  @override
  String get artists => 'ศิลปิน';

  @override
  String get bookmarks => 'บุ๊กมาร์ก';

  @override
  String get noSavedBookmarks => 'ยังไม่มีบุ๊กมาร์กที่บันทึกไว้สำหรับเรื่องนี้';

  @override
  String get openBook => 'เปิดหนังสือ';

  @override
  String get chapter => 'บท';

  @override
  String get page => 'หน้าหนังสือ';

  @override
  String get bookmark => 'บุ๊กมาร์ก';

  @override
  String get justNow => 'แค่ตอนนี้';

  @override
  String minutesAgo(int count) {
    return '${count}m ที่แล้ว';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ที่แล้ว';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ที่แล้ว';
  }

  @override
  String get discoverySubjects => 'วิชาค้นพบ';

  @override
  String get pickDiscoverySubjects => 'เลือกฟีดหัวเรื่องที่จะแสดงใน Discover';

  @override
  String get apply => 'นำมาใช้';

  @override
  String get openLink => 'เปิดลิงก์';

  @override
  String get scanWithYourPhone => 'สแกนด้วยโทรศัพท์ของคุณ';

  @override
  String get audiobookGenres => 'ประเภทหนังสือเสียง';

  @override
  String get pickAudiobookGenres =>
      'เลือกแนวเพลงที่จะแสดงใน Audiobook Discover';

  @override
  String get discoverAudiobooks => 'ค้นพบหนังสือเสียง';

  @override
  String get librivoxDescription => 'ชื่อโดเมนสาธารณะยอดนิยมจาก LibriVox';

  @override
  String titlesCount(int count) {
    return '$count ชื่อ';
  }

  @override
  String get scrollLeft => 'เลื่อนไปทางซ้าย';

  @override
  String get scrollRight => 'เลื่อนไปทางขวา';

  @override
  String get couldNotLoadGenre => 'ไม่สามารถโหลดประเภทนี้ได้ในขณะนี้';

  @override
  String get continueReading => 'อ่านต่อ';

  @override
  String get savedHighlights => 'ไฮไลท์ที่บันทึกไว้';

  @override
  String get continueListening => 'ฟังต่อ';

  @override
  String get listen => 'ฟัง';

  @override
  String get resume => 'ประวัติย่อ';

  @override
  String get failedToLoadLibrary => 'โหลดไลบรารี่ไม่สำเร็จ';

  @override
  String get popularNow => 'ยอดนิยมตอนนี้';

  @override
  String get savedForLater => 'บันทึกไว้สำหรับภายหลัง';

  @override
  String get topListens => 'ฟังยอดนิยม';

  @override
  String get unreadDiscoveries => 'การค้นพบที่ยังไม่ได้อ่าน';

  @override
  String get pickUpAgain => 'หยิบขึ้นมาอีกครั้ง';

  @override
  String get bookHighlightsDescription =>
      'หนังสือของคุณที่มีไฮไลท์ รายการโปรด หรือความคืบหน้าในการอ่าน';

  @override
  String get handPickedFromLibrary => 'คัดสรรจากห้องสมุดของคุณ';

  @override
  String get handPickedFromListeningQueue => 'เลือกด้วยมือจากคิวการฟังของคุณ';

  @override
  String get booksWithHighlights =>
      'หนังสือที่มีไฮไลท์ รายการโปรด หรือความคืบหน้าในการอ่าน';

  @override
  String get jumpBackNarration =>
      'กระโดดกลับไปสู่การบรรยายโดยไม่ต้องค้นหาตำแหน่งของคุณ';

  @override
  String get unreadBooksReady =>
      'หนังสือที่ยังไม่ได้อ่านพร้อมสำหรับชั่วโมงที่เงียบสงบถัดไป';

  @override
  String get quickAccessFavorites =>
      'เข้าถึงหนังสือที่คุณกลับมาอ่านได้อย่างรวดเร็ว';

  @override
  String get searchAudiobooks => 'ค้นหาหนังสือเสียง';

  @override
  String get searchYourLibrary => 'ค้นหาห้องสมุดของคุณ';

  @override
  String get pickUpStory => 'หยิบเรื่องราวที่คุณทิ้งไว้';

  @override
  String get savedPlacesChapters => 'สถานที่ที่บันทึกไว้และบทที่ยังไม่เสร็จ';

  @override
  String authorsCount(int count) {
    return '$count ผู้เขียน';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% เสร็จสมบูรณ์';
  }

  @override
  String get readyWhenYouAre => 'พร้อมเมื่อคุณพร้อม';

  @override
  String get details => 'รายละเอียด';

  @override
  String get listeningRoom => 'ห้องฟัง';

  @override
  String get bookmarksAndProgress => 'บุ๊กมาร์กและความคืบหน้า';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count ชื่อที่จัดเรียงเพื่อการเรียกดูก่อนการอ่าน';
  }

  @override
  String get titles => 'ชื่อเรื่อง';

  @override
  String get allTitles => 'ชื่อเรื่องทั้งหมด';

  @override
  String get authors => 'ผู้เขียน';

  @override
  String get browseByAuthor => 'เรียกดูตามผู้แต่ง';

  @override
  String get browseByGenre => 'เรียกดูตามประเภท';

  @override
  String get discover => 'ค้นพบ';

  @override
  String get trendingTitlesOpenLibrary =>
      'ชื่อที่กำลังมาแรงตามหัวเรื่องจาก Open Library';

  @override
  String get noBookmarkedItems => 'ยังไม่มีรายการที่บุ๊กมาร์กไว้';

  @override
  String get nothingMatchesSection =>
      'ยังไม่มีอะไรที่ตรงกับส่วนนี้ ลองใช้แท็บอื่นหรือกลับมาใหม่หลังจากการซิงค์ไลบรารีเสร็จสิ้น';

  @override
  String get audiobooks => 'หนังสือเสียง';

  @override
  String noLabelFound(String label) {
    return 'ไม่พบ $label';
  }

  @override
  String get folder => 'โฟลเดอร์';

  @override
  String get filters => 'ตัวกรอง';

  @override
  String get readingStatus => 'สถานะการอ่าน';

  @override
  String get playedStatus => 'สถานะการเล่น';

  @override
  String get readStatus => 'อ่าน';

  @override
  String get watched => 'ดูแล้ว';

  @override
  String get unread => 'ยังไม่ได้อ่าน';

  @override
  String get unwatched => 'ไม่ได้ดู';

  @override
  String get seriesStatus => 'สถานะซีรีส์';

  @override
  String get allLibraries => 'ห้องสมุดทั้งหมด';

  @override
  String get books => 'หนังสือ';

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
  String get author => 'ผู้เขียน';

  @override
  String get unknownAuthor => 'ผู้เขียนที่ไม่รู้จัก';

  @override
  String get uncategorized => 'ไม่มีหมวดหมู่';

  @override
  String get overview => 'ภาพรวม';

  @override
  String get noLibrivoxDescription =>
      'ยังไม่มีคำอธิบายโดย LibriVox สำหรับชื่อเรื่องนี้';

  @override
  String get readers => 'ผู้อ่าน';

  @override
  String get openLinks => 'เปิดลิงค์';

  @override
  String get librivoxPage => 'LibriVox เพจ';

  @override
  String get internetArchive => 'คลังอินเทอร์เน็ต';

  @override
  String get rssFeed => 'ฟีด RSS';

  @override
  String get downloadZip => 'ดาวน์โหลด Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count ส่วน';
  }

  @override
  String firstPublished(int year) {
    return 'เผยแพร่ครั้งแรก $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'ยังไม่มีภาพรวมจาก Open Library สำหรับชื่อนี้';

  @override
  String get subjects => 'วิชา';

  @override
  String get all => 'ทั้งหมด';

  @override
  String booksCount(int count) {
    return '$count หนังสือ';
  }

  @override
  String get couldNotLoadSubject => 'ไม่สามารถโหลดหัวข้อนี้ได้ในขณะนี้';

  @override
  String get audiobookDetails => 'รายละเอียดหนังสือเสียง';

  @override
  String authorsCountTitle(int count) {
    return '$count';
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
  String get trackList => 'รายการเพลง';

  @override
  String get itemListPlaceholder => 'รายการสินค้าจะปรากฏที่นี่';

  @override
  String get favoriteTracksPlaceholder => 'เพลงโปรดจะปรากฏที่นี่';

  @override
  String get failedToLoad => 'โหลดไม่สำเร็จ';

  @override
  String get delete => 'ลบ';

  @override
  String get save => 'บันทึก';

  @override
  String get moreLikeThis => 'เช่นนี้มากขึ้น';

  @override
  String get castAndCrew => 'นักแสดงและทีมงาน';

  @override
  String get collection => 'ของสะสม';

  @override
  String get episodes => 'ตอน';

  @override
  String get nextUp => 'ถัดไปขึ้นมา';

  @override
  String get seasons => 'ฤดูกาล';

  @override
  String get chapters => 'บท';

  @override
  String get features => 'คุณสมบัติ';

  @override
  String get movies => 'ภาพยนตร์';

  @override
  String get musicVideos => 'มิวสิควิดีโอ';

  @override
  String get other => 'อื่น';

  @override
  String get discography => 'รายชื่อจานเสียง';

  @override
  String get similarArtists => 'ศิลปินที่คล้ายกัน';

  @override
  String get tableOfContents => 'สารบัญ';

  @override
  String get tracklist => 'รายการเพลง';

  @override
  String discNumber(int number) {
    return 'ดิสก์ $number';
  }

  @override
  String get biography => 'ชีวประวัติ';

  @override
  String get authorDetails => 'รายละเอียดผู้แต่ง';

  @override
  String get noOverviewAvailable => 'ยังไม่มีภาพรวมสำหรับชื่อเรื่องนี้';

  @override
  String get noBiographyAvailable => 'ไม่มีชีวประวัติของผู้เขียนคนนี้';

  @override
  String get noBooksFound => 'ไม่พบหนังสือสำหรับผู้แต่งคนนี้';

  @override
  String get unableToLoadAuthorDetails =>
      'ไม่สามารถโหลดรายละเอียดผู้เขียนได้ในขณะนี้';

  @override
  String published(int year) {
    return 'เผยแพร่แล้ว $year';
  }

  @override
  String get publicationDateUnknown => 'ไม่ทราบวันที่ตีพิมพ์';

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
    return 'สิ้นสุดที่ $time';
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
  String get trailers => 'รถพ่วง';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return '';
  }

  @override
  String get view => 'ดู';

  @override
  String get resumeReading => 'อ่านต่อ';

  @override
  String get read => 'อ่าน';

  @override
  String resumeFrom(String position) {
    return 'ดำเนินการต่อจาก $position';
  }

  @override
  String get play => 'เล่น';

  @override
  String get startOver => 'เริ่มต้นใหม่';

  @override
  String get restart => 'รีสตาร์ท';

  @override
  String get readOffline => 'อ่านแบบออฟไลน์';

  @override
  String get playOffline => 'เล่นแบบออฟไลน์';

  @override
  String get audio => 'เสียง';

  @override
  String get subtitles => 'คำบรรยาย';

  @override
  String get version => 'เวอร์ชัน';

  @override
  String get cast => 'หล่อ';

  @override
  String get trailer => 'ตัวอย่าง';

  @override
  String get finished => 'ที่เสร็จเรียบร้อย';

  @override
  String get favorited => 'รายการโปรด';

  @override
  String get favorite => 'ที่ชื่นชอบ';

  @override
  String get playlist => 'เพลย์ลิสต์';

  @override
  String get downloaded => 'ดาวน์โหลดแล้ว';

  @override
  String get downloadAll => 'ดาวน์โหลดทั้งหมด';

  @override
  String get download => 'ดาวน์โหลด';

  @override
  String get deleteDownloaded => 'ลบการดาวน์โหลดแล้ว';

  @override
  String get goToSeries => 'ไปที่ซีรีส์';

  @override
  String get editMetadata => 'แก้ไขข้อมูลเมตา';

  @override
  String get less => 'น้อย';

  @override
  String get more => 'มากกว่า';

  @override
  String get deleteItem => 'ลบรายการ';

  @override
  String get deletePlaylist => 'ลบเพลย์ลิสต์';

  @override
  String get deletePlaylistMessage => 'ลบเพลย์ลิสต์นี้ออกจากเซิร์ฟเวอร์หรือไม่';

  @override
  String get deleteItemMessage => 'ลบรายการนี้ออกจากเซิร์ฟเวอร์หรือไม่';

  @override
  String get failedToDeletePlaylist => 'ไม่สามารถลบเพลย์ลิสต์';

  @override
  String get failedToDeleteItem => 'ลบรายการไม่สำเร็จ';

  @override
  String get renamePlaylist => 'เปลี่ยนชื่อเพลย์ลิสต์';

  @override
  String get playlistName => 'ชื่อเพลย์ลิสต์';

  @override
  String get deleteDownloadedAlbum => 'ลบอัลบั้มที่ดาวน์โหลด';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'ลบแทร็กที่ดาวน์โหลดสำหรับ \"$title\" หรือไม่';
  }

  @override
  String get downloadedTracksDeleted => 'เพลงที่ดาวน์โหลดถูกลบแล้ว';

  @override
  String get downloadedTracksDeleteFailed =>
      'ไม่สามารถลบแทร็กที่ดาวน์โหลดบางแทร็กได้';

  @override
  String get noTracksLoaded => 'ไม่มีการโหลดแทร็ก';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'ไม่ได้โหลด $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'กำลังดาวน์โหลด $title ($count รายการ)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ \"$name\" ออกจากเซิร์ฟเวอร์ การดำเนินการนี้ไม่สามารถยกเลิกได้';
  }

  @override
  String get itemDeleted => 'ลบรายการแล้ว';

  @override
  String get noPlayableTrailerFound => 'ไม่พบตัวอย่างที่สามารถเล่นได้';

  @override
  String unsupportedBookFormat(String extension) {
    return 'รูปแบบหนังสือที่ไม่รองรับ: .$extension';
  }

  @override
  String get audioTrack => 'แทร็กเสียง';

  @override
  String get subtitleTrack => 'แทร็กคำบรรยาย';

  @override
  String get none => 'ไม่มี';

  @override
  String get downloadSubtitlesLabel => 'ดาวน์โหลดคำบรรยาย...';

  @override
  String get searchOpenSubtitlesPlugin => 'ค้นหาโดยใช้ปลั๊กอิน OpenSubtitles';

  @override
  String get downloadSubtitles => 'ดาวน์โหลดคำบรรยาย';

  @override
  String get selectedSubtitleInvalid => 'คำบรรยายที่เลือกไม่ถูกต้อง';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'ดาวน์โหลดและเลือกคำบรรยายแล้ว: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'ดาวน์โหลดคำบรรยายแล้ว อาจต้องใช้เวลาสักครู่จึงจะปรากฏในขณะที่ Jellyfin รีเฟรชรายการ';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'ไม่พบคำบรรยายระยะไกลสำหรับ $language';
  }

  @override
  String get selectVersion => 'เลือกเวอร์ชัน';

  @override
  String versionNumber(int number) {
    return 'เวอร์ชัน $number';
  }

  @override
  String get downloadAllQuality => 'ดาวน์โหลดทั้งหมด — คุณภาพ';

  @override
  String get downloadQuality => 'คุณภาพการดาวน์โหลด';

  @override
  String get originalFileNoReencoding => 'ไฟล์ต้นฉบับไม่มีการเข้ารหัสซ้ำ';

  @override
  String get originalFilesNoReencoding => 'ไฟล์ต้นฉบับไม่มีการเข้ารหัสซ้ำ';

  @override
  String get noEpisodesLoaded => 'ไม่มีตอนโหลด';

  @override
  String downloadingItem(String name, String quality) {
    return 'กำลังดาวน์โหลด $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ลบไฟล์ที่ดาวน์โหลด';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'ลบไฟล์ในเครื่องสำหรับ $typeLabel?\n\nนี่จะเป็นการเพิ่มพื้นที่เก็บข้อมูล คุณสามารถดาวน์โหลดใหม่ได้ในภายหลัง';
  }

  @override
  String get downloadedFilesDeleted => 'ไฟล์ที่ดาวน์โหลดถูกลบ';

  @override
  String get failedToDeleteFiles => 'ไม่สามารถลบไฟล์ได้';

  @override
  String get deleteFiles => 'ลบไฟล์';

  @override
  String get director => 'ผู้อำนวยการ';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'นักเขียน';

  @override
  String get studio => 'สตูดิโอ';

  @override
  String studioMoreCount(int count) {
    return '+$count เพิ่มเติม';
  }

  @override
  String totalEpisodes(int count) {
    return '$count';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'ตอน $number';
  }

  @override
  String chapterNumber(int number) {
    return 'บทที่ $number';
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
    return 'เกิด $date';
  }

  @override
  String died(String date) {
    return 'เสียชีวิต $date';
  }

  @override
  String age(int age) {
    return 'อายุ $age';
  }

  @override
  String get showLess => 'แสดงน้อยลง';

  @override
  String get readMore => 'อ่านเพิ่มเติม';

  @override
  String get shuffle => 'สับเปลี่ยน';

  @override
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count ดาวน์โหลด';
  }

  @override
  String get perfectMatch => 'คู่ที่สมบูรณ์แบบ';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'โมโน';

  @override
  String get stereo => 'สเตอริโอ';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'คำบรรยายระยะไกล $action ต้องการสิทธิ์การจัดการคำบรรยาย Jellyfin สำหรับผู้ใช้รายนี้';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'ไม่พบรายการนี้บนเซิร์ฟเวอร์สำหรับคำบรรยายระยะไกล $action';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'คำบรรยายระยะไกล $action ล้มเหลว: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'คำบรรยายระยะไกล $action ล้มเหลว (HTTP $status)';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'ล้มเหลวในการ $action คำบรรยายระยะไกล';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'ตอนที่ดาวน์โหลดทั้งหมดสำหรับ \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'ตอนที่ดาวน์โหลดทั้งหมดในซีซั่นนี้';

  @override
  String get stillWatching => 'ยังดูอยู่เหรอ?';

  @override
  String get unableToLoadTrailerStream => 'ไม่สามารถโหลดสตรีมตัวอย่างได้';

  @override
  String get trailerTimedOut => 'ตัวอย่างหมดเวลาขณะโหลด';

  @override
  String get playbackFailedForTrailer => 'การเล่นล้มเหลวสำหรับตัวอย่างนี้';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'การแคสต์ไม่พร้อมใช้งานระหว่างการเล่นแบบออฟไลน์';

  @override
  String castActionFailed(String label, String error) {
    return 'การดำเนินการ $label ล้มเหลว: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'ไม่สามารถตั้งค่าปริมาณการแคสต์: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label การควบคุม';
  }

  @override
  String get deviceVolume => 'ระดับเสียงของอุปกรณ์';

  @override
  String get unavailable => 'ไม่พร้อมใช้งาน';

  @override
  String get pause => 'หยุดชั่วคราว';

  @override
  String get syncPosition => 'ซิงค์ตำแหน่ง';

  @override
  String stopCast(String label) {
    return 'หยุด $label';
  }

  @override
  String get queueIsEmpty => 'คิวว่าง';

  @override
  String trackNumber(int number) {
    return 'ติดตาม $number';
  }

  @override
  String get remotePlayback => 'การเล่นระยะไกล';

  @override
  String get castingToGoogleCast => 'กำลังส่งไปที่ Google Cast';

  @override
  String get castingViaAirPlay => 'กำลังส่งผ่าน AirPlay';

  @override
  String get castingViaDlna => 'กำลังส่งผ่าน DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds วินาที';
  }

  @override
  String get longPressToUnlock => 'กดค้างเพื่อปลดล็อค';

  @override
  String get off => 'ปิด';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'อัตโนมัติ';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'บิตเรตแทนที่';

  @override
  String get audioDelay => 'ความล่าช้าของเสียง';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'คำบรรยายล่าช้า';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get unknown => 'ไม่ทราบ';

  @override
  String get playbackInformation => 'ข้อมูลการเล่น';

  @override
  String get playback => 'การเล่น';

  @override
  String get playMethod => 'วิธีการเล่น';

  @override
  String get directPlay => 'เล่นโดยตรง';

  @override
  String get directStream => 'สตรีมโดยตรง';

  @override
  String get transcoding => 'การแปลงรหัส';

  @override
  String get transcodeReasons => 'เหตุผลในการแปลงรหัส';

  @override
  String get player => 'ผู้เล่น';

  @override
  String get container => 'คอนเทนเนอร์';

  @override
  String get bitrate => 'บิตเรต';

  @override
  String get video => 'วีดีโอ';

  @override
  String get resolution => 'ปณิธาน';

  @override
  String get hdr => 'เอชดีอาร์';

  @override
  String get codec => 'ตัวแปลงสัญญาณ';

  @override
  String get videoBitrate => 'อัตราบิตของวิดีโอ';

  @override
  String get track => 'ติดตาม';

  @override
  String get channels => 'ช่อง';

  @override
  String get audioBitrate => 'อัตราบิตของเสียง';

  @override
  String get sampleRate => 'อัตราตัวอย่าง';

  @override
  String get format => 'รูปแบบ';

  @override
  String get external => 'ภายนอก';

  @override
  String get embedded => 'ฝังตัว';

  @override
  String castSessionError(String protocol) {
    return '$protocol ข้อผิดพลาดของเซสชัน';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'ไม่สามารถโหลดรายละเอียดหนังสือ: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'การเรนเดอร์ EPUB ในแอปยังไม่พร้อมใช้งานบนแพลตฟอร์มนี้';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'รูปแบบนี้ (.$extension) ยังไม่สามารถแสดงผลในแอปได้';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'การแสดงผลเอกสารแบบฝังไม่พร้อมใช้งานบนแพลตฟอร์มนี้';

  @override
  String get couldNotOpenExternalViewer => 'ไม่สามารถเปิดโปรแกรมดูภายนอกได้';

  @override
  String failedToOpenInAppReader(String error) {
    return 'ไม่สามารถเปิดโปรแกรมอ่านในแอป: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'บันทึกบุ๊คมาร์คไว้ที่ $label แล้ว';
  }

  @override
  String bookmarkAdded(String label) {
    return 'เพิ่มบุ๊คมาร์คแล้ว: $label';
  }

  @override
  String get noBookmarksYet =>
      'ยังไม่มีบุ๊กมาร์ก\nแตะไอคอนบุ๊กมาร์กขณะอ่านเพื่อบันทึกตำแหน่งของคุณ';

  @override
  String get noTableOfContentsAvailable => 'ไม่มีสารบัญ';

  @override
  String pageLabel(int number) {
    return 'เพจ $number';
  }

  @override
  String get position => 'ตำแหน่ง';

  @override
  String get bookReader => 'เครื่องอ่านหนังสือ';

  @override
  String formatExtension(String extension) {
    return 'รูปแบบ: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% อ่านแล้ว';
  }

  @override
  String get updating => 'กำลังอัปเดต...';

  @override
  String get markUnread => 'ทำเครื่องหมายว่ายังไม่ได้อ่าน';

  @override
  String get markAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get reloadReader => 'โหลดโปรแกรมอ่านซ้ำ';

  @override
  String get noPagesFound => 'ไม่พบหน้า';

  @override
  String get failedToDecodePageImage => 'ไม่สามารถถอดรหัสรูปภาพหน้าได้';

  @override
  String resetZoom(String zoom) {
    return 'รีเซ็ตการซูม (${zoom}x)';
  }

  @override
  String get singlePage => 'หน้าเดียว';

  @override
  String get twoPageSpread => 'การแพร่กระจายสองหน้า';

  @override
  String get addBookmark => 'เพิ่มบุ๊กมาร์ก';

  @override
  String get bookmarksEllipsis => 'บุ๊กมาร์ก...';

  @override
  String get markedAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get markedAsUnread => 'ทำเครื่องหมายว่ายังไม่ได้อ่าน';

  @override
  String failedToUpdateReadState(String error) {
    return 'ไม่สามารถอัปเดตสถานะการอ่าน: $error';
  }

  @override
  String get themeSystem => 'หัวเรื่อง : ระบบ';

  @override
  String get themeLight => 'ธีม: แสง';

  @override
  String get themeDark => 'ธีม: มืด';

  @override
  String get themeSepia => 'ธีม:ซีเปีย';

  @override
  String get invertColorsFixedLayout => 'สลับสี (เค้าโครงคงที่)';

  @override
  String get invertColorsPdf => 'กลับสี (PDF)';

  @override
  String get preparingInAppReader => 'กำลังเตรียมโปรแกรมอ่านในแอป...';

  @override
  String get pdfDataNotAvailable => 'ไม่มีข้อมูล PDF';

  @override
  String get readerFallbackModeActive => 'โหมดสำรองของผู้อ่านทำงานอยู่';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'แพลตฟอร์มนี้ไม่สามารถโฮสต์กลไกจัดการเอกสารแบบฝังสำหรับไฟล์ $extension';
  }

  @override
  String get reloadReaderPlatformHint =>
      'ใช้ Reload Reader หลังจากสลับไปยังเป้าหมายแพลตฟอร์มที่รองรับ (Android, iOS, macOS)';

  @override
  String get openExternally => 'เปิดภายนอก';

  @override
  String get noEpubChaptersFound => 'ไม่พบบทของ EPUB';

  @override
  String get readerNotReady => 'นักอ่านไม่พร้อม';

  @override
  String get seriesRecordings => 'การบันทึกซีรีส์';

  @override
  String get now => 'ตอนนี้';

  @override
  String get sports => 'กีฬา';

  @override
  String get news => 'ข่าว';

  @override
  String get kids => 'เด็กๆ';

  @override
  String get premiere => 'รอบปฐมทัศน์';

  @override
  String get guideTimeline => 'คู่มือไทม์ไลน์';

  @override
  String failedToLoadGuide(String error) {
    return 'ไม่สามารถโหลดคำแนะนำ: $error';
  }

  @override
  String get noChannelsFound => 'ไม่พบช่อง';

  @override
  String get liveBadge => 'สด';

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
  String get movie => 'ภาพยนตร์';

  @override
  String get removedFromFavoriteChannels => 'ลบออกจากช่องโปรดแล้ว';

  @override
  String get addedToFavoriteChannels => 'เพิ่มไปยังช่องโปรดแล้ว';

  @override
  String get failedToUpdateFavoriteChannel => 'ไม่สามารถอัปเดตช่องโปรดได้';

  @override
  String get unfavoriteChannel => 'ช่องที่ไม่ชื่นชอบ';

  @override
  String get favoriteChannel => 'ช่องโปรด';

  @override
  String get record => 'บันทึก';

  @override
  String get cancelRecordingAction => 'ยกเลิกการบันทึก';

  @override
  String get programSetToRecord => 'โปรแกรมตั้งค่าให้บันทึก';

  @override
  String get recordingCancelled => 'ยกเลิกการบันทึกแล้ว';

  @override
  String get unableToCreateRecording => 'ไม่สามารถสร้างการบันทึกได้';

  @override
  String get watch => 'ดู';

  @override
  String get close => 'ปิด';

  @override
  String failedToPlayChannel(String name) {
    return 'ไม่สามารถเล่น $name';
  }

  @override
  String get failedToLoadRecordings => 'โหลดการบันทึกไม่สำเร็จ';

  @override
  String get scheduledInNext24Hours => 'กำหนดไว้ใน 24 ชั่วโมงข้างหน้า';

  @override
  String get recentRecordings => 'บันทึกล่าสุด';

  @override
  String get tvSeries => 'ละครโทรทัศน์';

  @override
  String get failedToLoadSchedule => 'โหลดกำหนดการไม่สำเร็จ';

  @override
  String get noScheduledRecordings => 'ไม่มีการบันทึกตามกำหนดเวลา';

  @override
  String get cancelRecording => 'ยกเลิกการบันทึกใช่ไหม';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'ยกเลิกการบันทึกที่กำหนดไว้ของ \"$name\" หรือไม่';
  }

  @override
  String get no => 'เลขที่';

  @override
  String get yesCancel => 'ใช่ ยกเลิก';

  @override
  String get failedToCancelRecording => 'ยกเลิกการบันทึกไม่สำเร็จ';

  @override
  String get failedToLoadSeriesRecordings => 'โหลดการบันทึกซีรีส์ไม่สำเร็จ';

  @override
  String get noSeriesRecordings => 'ไม่มีการบันทึกซีรีส์';

  @override
  String get cancelSeriesRecording => 'ยกเลิกการบันทึกซีรีส์';

  @override
  String get cancelSeriesRecordingQuestion => 'ยกเลิกการบันทึกซีรีส์ใช่ไหม';

  @override
  String stopRecordingName(String name) {
    return 'หยุดบันทึก \"$name\" หรือไม่';
  }

  @override
  String get failedToCancelSeriesRecording => 'ยกเลิกการบันทึกซีรีส์ไม่สำเร็จ';

  @override
  String get searchThisLibrary => 'ค้นหาห้องสมุดนี้...';

  @override
  String get searchEllipsis => 'ค้นหา...';

  @override
  String noResultsForQuery(String query) {
    return 'ไม่มีผลลัพธ์สำหรับ \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'การค้นหาล้มเหลว: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'ประเภทบัญชี Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'ท้องถิ่น';

  @override
  String get savedMedia => 'สื่อที่บันทึกไว้';

  @override
  String get tvShows => 'รายการทีวี';

  @override
  String get music => 'ดนตรี';

  @override
  String get musicAlbums => 'อัลบั้มเพลง';

  @override
  String get noMediaInFilter => 'ไม่มีสื่อในตัวกรองนี้';

  @override
  String get noDownloadedMediaYet => 'ยังไม่มีสื่อที่ดาวน์โหลด';

  @override
  String get browseLibrary => 'เรียกดูห้องสมุด';

  @override
  String get deleteDownload => 'ลบการดาวน์โหลด';

  @override
  String removeItemAndFiles(String name) {
    return 'ลบ \"$name\" และไฟล์ของมันออกหรือไม่';
  }

  @override
  String tracksCount(int count) {
    return '$count เพลง';
  }

  @override
  String get album => 'อัลบั้ม';

  @override
  String get playAlbum => 'เล่นอัลบั้ม';

  @override
  String failedToLoadAlbum(String error) {
    return 'ไม่สามารถโหลดอัลบั้ม: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'ไม่พบเพลงที่ดาวน์โหลดสำหรับ $name';
  }

  @override
  String get season => 'ฤดูกาล';

  @override
  String get errorLoadingEpisodes => 'เกิดข้อผิดพลาดในการโหลดตอน';

  @override
  String get noDownloadedEpisodes => 'ไม่มีตอนที่ดาวน์โหลด';

  @override
  String get deleteEpisode => 'ลบตอน';

  @override
  String removeName(String name) {
    return 'ลบ \"$name\" หรือไม่';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'ตอน $number';
  }

  @override
  String get seriesNotFound => 'ไม่พบซีรีส์';

  @override
  String get errorLoadingSeries => 'เกิดข้อผิดพลาดในการโหลดซีรีส์';

  @override
  String get downloadedEpisodes => 'ตอนที่ดาวน์โหลด';

  @override
  String seasonNumber(int number) {
    return 'ซีซั่น $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'พิเศษ';

  @override
  String get deleteSeason => 'ลบซีซัน';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'ลบตอนที่ดาวน์โหลดทั้งหมดใน $season หรือไม่';
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
  String get storageManagement => 'การจัดการพื้นที่เก็บข้อมูล';

  @override
  String get storageBreakdown => 'รายละเอียดการจัดเก็บ';

  @override
  String get downloadedItems => 'รายการที่ดาวน์โหลด';

  @override
  String get storageLimit => 'ขีดจำกัดการจัดเก็บ';

  @override
  String get noLimit => 'ไม่มีขีดจำกัด';

  @override
  String get deleteAllDownloads => 'ลบการดาวน์โหลดทั้งหมด';

  @override
  String get deleteAllDownloadsWarning =>
      'การดำเนินการนี้จะลบไฟล์สื่อที่ดาวน์โหลดมาทั้งหมดและไม่สามารถยกเลิกได้';

  @override
  String get deleteAll => 'ลบทั้งหมด';

  @override
  String get deleteSelected => 'ลบที่เลือก';

  @override
  String deleteSelectedCount(int count) {
    return 'ลบ $count รายการที่ดาวน์โหลดใช่ไหม';
  }

  @override
  String get musicAndAudiobooks => 'เพลงและหนังสือเสียง';

  @override
  String get images => 'รูปภาพ';

  @override
  String get database => 'ฐานข้อมูล';

  @override
  String ofStorageLimit(String limit) {
    return 'ของขีดจำกัด $limit';
  }

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get authentication => 'การรับรองความถูกต้อง';

  @override
  String get autoLoginServerManagement =>
      'เข้าสู่ระบบอัตโนมัติ การจัดการเซิร์ฟเวอร์';

  @override
  String get pinCode => 'รหัสพิน';

  @override
  String get setUpPinCodeProtection => 'ตั้งค่าการป้องกันรหัส PIN';

  @override
  String get parentalControls => 'การควบคุมโดยผู้ปกครอง';

  @override
  String get contentRatingRestrictions => 'ข้อจำกัดการจัดเรตเนื้อหา';

  @override
  String get bitRateResolutionBehavior => 'บิตเรต ความละเอียด พฤติกรรม';

  @override
  String get languageSizeAppearance => 'ภาษาขนาดรูปลักษณ์';

  @override
  String get qualityStorage => 'คุณภาพการจัดเก็บ';

  @override
  String get serverSyncAndPluginStatus => 'สถานะการซิงค์เซิร์ฟเวอร์และปลั๊กอิน';

  @override
  String get mediaRequestIntegration => 'การรวมคำขอสื่อ';

  @override
  String get switchServer => 'สลับเซิร์ฟเวอร์';

  @override
  String get signOut => 'ออกจากระบบ';

  @override
  String get versionLicenses => 'เวอร์ชันใบอนุญาต';

  @override
  String get account => 'บัญชี';

  @override
  String get signInAndSecurity => 'การลงชื่อเข้าใช้และความปลอดภัย';

  @override
  String get administration => 'การบริหาร';

  @override
  String get serverSettingsUsersLibraries =>
      'การตั้งค่าเซิร์ฟเวอร์ ผู้ใช้ ไลบรารี';

  @override
  String get customization => 'การปรับแต่ง';

  @override
  String get themeAndLayout => 'ธีมและเค้าโครง';

  @override
  String get videoAndSubtitles => 'วิดีโอและคำบรรยาย';

  @override
  String get integrations => 'บูรณาการ';

  @override
  String get pluginAndRequests => 'ปลั๊กอินและการร้องขอ';

  @override
  String get customizeAccountPlaybackInterface =>
      'ปรับแต่งบัญชี การเล่น และพฤติกรรมของอินเทอร์เฟซ';

  @override
  String optionsCount(int count) {
    return '$count ตัวเลือก';
  }

  @override
  String get themeAndAppearance => 'ธีมและรูปลักษณ์';

  @override
  String get focusBorderColor => 'โฟกัสสีเส้นขอบ';

  @override
  String get watchedIndicators => 'ตัวชี้วัดที่จับตามอง';

  @override
  String get always => 'เสมอ';

  @override
  String get hideUnwatched => 'ซ่อนรายการที่ไม่ได้ดู';

  @override
  String get episodesOnly => 'ตอนเท่านั้น';

  @override
  String get never => 'ไม่เคย';

  @override
  String get focusExpansionAnimation => 'ภาพเคลื่อนไหวการขยายโฟกัส';

  @override
  String get desktopUiScale => 'สเกล UI บนเดสก์ท็อป';

  @override
  String get scaleFocusedCards => 'ปรับขนาดการ์ดและไทล์ที่เน้นหรือโฮเวอร์';

  @override
  String get backgroundBackdrops => 'ฉากหลัง';

  @override
  String get showBackdropImages => 'แสดงภาพฉากหลังเบื้องหลังเนื้อหา';

  @override
  String get seriesThumbnails => 'ภาพขนาดย่อของซีรีส์';

  @override
  String get seriesThumbnailsDescription =>
      'เฉพาะตอน: ใช้อาร์ตเวิร์กซีรีส์ที่ตรงกับรูปภาพแต่ละแถว';

  @override
  String get homeRowInfoOverlay => 'การซ้อนทับข้อมูลแถวบ้าน';

  @override
  String get showTitleMetadataOnHomeRows =>
      'แสดงชื่อและข้อมูลเมตาเมื่อเรียกดูแถวบ้าน';

  @override
  String get clockDisplay => 'การแสดงนาฬิกา';

  @override
  String get inMenus => 'ในเมนู';

  @override
  String get inVideo => 'ในวิดีโอ';

  @override
  String get seasonalEffects => 'ผลกระทบตามฤดูกาล';

  @override
  String get seasonalEffectsDescription => 'เอฟเฟกต์ภาพและการตกแต่งตามฤดูกาล';

  @override
  String get snow => 'หิมะ';

  @override
  String get fireworks => 'ดอกไม้ไฟ';

  @override
  String get confetti => 'ลูกปา';

  @override
  String get fallingLeaves => 'ใบไม้ร่วง';

  @override
  String get themeMusic => 'เพลงธีม';

  @override
  String get playThemeMusicOnDetailPages => 'เล่นเพลงประกอบในหน้ารายละเอียด';

  @override
  String get themeMusicVolume => 'ปริมาณเพลงธีม';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'เพลงประกอบในแถวบ้าน';

  @override
  String get playWhenBrowsingHomeScreen => 'เล่นเมื่อเรียกดูหน้าจอหลัก';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'รายละเอียด พื้นหลังเบลอ';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'กำลังเปิดหาพื้นหลังเบลอ';

  @override
  String get maxStreamingBitrate => 'บิตเรตสตรีมมิ่งสูงสุด';

  @override
  String get maxResolution => 'ความละเอียดสูงสุด';

  @override
  String get playerZoomMode => 'โหมดซูมผู้เล่น';

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
  String get fit => 'พอดี';

  @override
  String get autoCrop => 'ครอบตัดอัตโนมัติ';

  @override
  String get stretch => 'ยืด';

  @override
  String get refreshRateSwitching => 'การสลับอัตราการรีเฟรช';

  @override
  String get disabled => 'พิการ';

  @override
  String get scaleOnTv => 'สเกลบนทีวี';

  @override
  String get scaleOnDevice => 'ปรับขนาดบนอุปกรณ์';

  @override
  String get trickPlay => 'เล่นกล';

  @override
  String get showPreviewThumbnailsWhenSeeking => 'แสดงภาพตัวอย่างเมื่อค้นหา';

  @override
  String get showDescriptionOnPause => 'แสดงคำอธิบายเมื่อหยุดชั่วคราว';

  @override
  String get dimVideoShowOverview =>
      'หรี่แสงวิดีโอและแสดงข้อความภาพรวมขณะหยุดชั่วคราว';

  @override
  String get osdLockButton => 'ปุ่มล็อค OSD';

  @override
  String get osdLockButtonDescription =>
      'แสดงปุ่มล็อคที่บล็อกการป้อนข้อมูลแบบสัมผัสจนกว่าจะกดค้าง';

  @override
  String get audioBehavior => 'พฤติกรรมเสียง';

  @override
  String get downmixToStereo => 'ดาวน์มิกซ์เป็นสเตอริโอ';

  @override
  String get defaultAudioLanguage => 'ภาษาเสียงเริ่มต้น';

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
  String get autoServerDefault => 'อัตโนมัติ (ค่าเริ่มต้นของเซิร์ฟเวอร์)';

  @override
  String get english => 'ภาษาอังกฤษ';

  @override
  String get spanish => 'สเปน';

  @override
  String get french => 'ภาษาฝรั่งเศส';

  @override
  String get german => 'เยอรมัน';

  @override
  String get italian => 'ภาษาอิตาลี';

  @override
  String get portuguese => 'โปรตุเกส';

  @override
  String get japanese => 'ญี่ปุ่น';

  @override
  String get korean => 'เกาหลี';

  @override
  String get chinese => 'ชาวจีน';

  @override
  String get russian => 'ภาษารัสเซีย';

  @override
  String get arabic => 'ภาษาอาหรับ';

  @override
  String get hindi => 'ฮินดี';

  @override
  String get dutch => 'ภาษาดัตช์';

  @override
  String get swedish => 'ภาษาสวีเดน';

  @override
  String get norwegian => 'ภาษานอร์เวย์';

  @override
  String get danish => 'ภาษาเดนมาร์ก';

  @override
  String get finnish => 'ภาษาฟินแลนด์';

  @override
  String get polish => 'ขัด';

  @override
  String get ac3Passthrough => 'AC3 พาสทรู';

  @override
  String get dtsPassthrough => 'DTS พาสทรู';

  @override
  String get trueHdSupport => 'รองรับ True HD';

  @override
  String get enableDtsPassthrough =>
      'เสียง Bitstream DTS เป็น AVR เท่านั้น ต้องการการสนับสนุนเครื่องรับและแทร็กต้นฉบับ DTS';

  @override
  String get enableTrueHdAudio =>
      'เปิดใช้งานเสียง TrueHD (อาจใช้ไม่ได้กับทุกแพลตฟอร์ม)';

  @override
  String get settingsAudioOutputMode => 'โหมดเอาต์พุตเสียง';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR พาสทรู';

  @override
  String get settingsAudioFallbackCodec => 'ตัวแปลงสัญญาณสำรองเสียง';

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
  String get settingsAudioPassthroughAdvanced => 'ส่งผ่าน (ขั้นสูง)';

  @override
  String get settingsAudioCodecPassthrough => 'ตัวแปลงสัญญาณส่งผ่าน';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'เปิดใช้งานเฉพาะรูปแบบ AVR หรือ HDMI sink ของคุณรองรับ';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 ส่งผ่าน';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (บรรยากาศ) ส่งผ่าน';

  @override
  String get settingsAudioDtsCorePassthrough => 'การส่งผ่านหลัก DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'ส่งผ่าน DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD พาสทรู';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos ส่งผ่าน';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) ไปยังตัวถอดรหัสภายนอก';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos บน EAC3 (JOC) ไปยังตัวถอดรหัสภายนอก';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (รวม DTS core) ไปยังตัวถอดรหัสภายนอก';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD พร้อมข้อมูลเมตา Atmos ไปยังตัวถอดรหัสภายนอก';

  @override
  String get settingsDetectedAudioCapabilities =>
      'ความสามารถด้านเสียงที่ตรวจพบ';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'ยังไม่มีสแนปช็อตความสามารถรันไทม์';

  @override
  String get settingsAudioRouteLabel => 'เส้นทาง';

  @override
  String get settingsAudioDecodeLabel => 'ถอดรหัส';

  @override
  String get settingsAudioPassthroughLabel => 'ทะลุผ่าน';

  @override
  String get settingsAudioHdRoute => 'เส้นทางเสียง HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'อีอาร์ค';

  @override
  String get settingsAudioRouteBluetooth => 'บลูทูธ';

  @override
  String get settingsAudioRouteSpeaker => 'วิทยากร';

  @override
  String get settingsAudioRouteHeadphones => 'Headphones';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'การวินิจฉัย';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'ระดับวิดีโอ';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'ช่วงวิดีโอ';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'ตัวแปลงสัญญาณคำบรรยาย';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'ตัวแปลงสัญญาณเสียงที่อนุญาต';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'ตัวแปลงสัญญาณเสียง HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'ตัวแปลงสัญญาณเสียง HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'ส่งผ่านเสียง-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'เส้นทางเสียงที่ใช้งานอยู่';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'รองรับเส้นทางเสียง HD';

  @override
  String get nightMode => 'โหมดกลางคืน';

  @override
  String get compressDynamicRange => 'บีบอัดช่วงไดนามิก';

  @override
  String get advancedMpv => 'ขั้นสูง mpv';

  @override
  String get enableCustomMpvConf => 'เปิดใช้งานกำหนดเอง mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'ใช้ mpv.conf ที่ผู้ใช้ระบุก่อนที่จะเริ่มเล่น';

  @override
  String get unsafeAdvancedMpvOptions => 'ไม่ปลอดภัยขั้นสูง mpv ตัวเลือก';

  @override
  String get unsafeMpvOptionsDescription =>
      'อนุญาตให้ใช้ชุดตัวเลือก mpv ที่กว้างขึ้น อาจหยุดพฤติกรรมการเล่น';

  @override
  String get hardwareDecoding => 'การถอดรหัสฮาร์ดแวร์';

  @override
  String get hardwareDecodingSubtitle =>
      'อาจปรับปรุงประสิทธิภาพ แต่อาจทำให้เกิดปัญหาในการเล่นบนอุปกรณ์บางอย่างได้';

  @override
  String get nextUpAndQueuing => 'ถัดไปและการเข้าคิว';

  @override
  String get nextUpDisplay => 'การแสดงผลถัดไป';

  @override
  String get extended => 'ขยาย';

  @override
  String get minimal => 'น้อยที่สุด';

  @override
  String get nextUpTimeout => 'หมดเวลาถัดไป';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'การจัดคิวสื่อ';

  @override
  String get autoQueueNextEpisodes => 'คิวอัตโนมัติตอนต่อไป';

  @override
  String get stillWatchingPrompt => 'ยังคงดูพรอมต์อยู่';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'หลังจาก $episodes ตอน / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'ดำเนินการต่อ & ข้าม';

  @override
  String get resumeRewind => 'กรอกลับต่อ';

  @override
  String get unpauseRewind => 'ยกเลิกการหยุดการกรอกลับชั่วคราว';

  @override
  String get fiveSeconds => '5 วินาที';

  @override
  String get tenSeconds => '10 วินาที';

  @override
  String get fifteenSeconds => '15 วินาที';

  @override
  String get thirtySeconds => '30 วินาที';

  @override
  String get skipBackLength => 'ข้ามความยาวด้านหลัง';

  @override
  String get skipForwardLength => 'ข้ามความยาวไปข้างหน้า';

  @override
  String get customMpvConfPath => 'กำหนดเอง mpv.conf เส้นทาง';

  @override
  String get notSetMpvConf =>
      'ไม่ได้ตั้งค่า Moonfin จะลองใช้ค่าเริ่มต้น mpv.conf ในโฟลเดอร์ app/data';

  @override
  String get selectMpvConf => 'เลือก mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'การตั้งค่ารูปแบบ (ขนาด สี ออฟเซ็ต) ใช้กับคำบรรยายแบบข้อความ (SRT, VTT, TTML) คำบรรยาย ASS/SSA ใช้สไตล์แบบฝังของตัวเอง เว้นแต่จะปิด \"ASS/SSA Direct Play\" คำบรรยายบิตแมป (PGS, DVB, VobSub) ไม่สามารถจัดรูปแบบใหม่ได้';

  @override
  String get defaultSubtitleLanguage => 'ภาษาคำบรรยายเริ่มต้น';

  @override
  String get defaultToNoSubtitles => 'ค่าเริ่มต้นเป็นไม่มีคำบรรยาย';

  @override
  String get turnOffSubtitlesByDefault => 'ปิดคำบรรยายตามค่าเริ่มต้น';

  @override
  String get subtitleSize => 'ขนาดคำบรรยาย';

  @override
  String get textFillColor => 'สีเติมข้อความ';

  @override
  String get backgroundColor => 'สีพื้นหลัง';

  @override
  String get textStrokeColor => 'สีเส้นขีดของข้อความ';

  @override
  String get subtitleCustomization => 'การปรับแต่งคำบรรยาย';

  @override
  String get subtitleCustomizationDescription => 'ปรับแต่งลักษณะคำบรรยาย';

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
  String get subtitlePreviewText =>
      'สุนัขจิ้งจอกสีน้ำตาลที่รวดเร็วกระโดดข้ามสุนัขขี้เกียจ';

  @override
  String get verticalOffset => 'ออฟเซ็ตแนวตั้ง';

  @override
  String get pgsDirectPlay => 'การเล่นโดยตรงของ PGS';

  @override
  String get directPlayPgsSubtitles => 'เล่นคำบรรยาย PGS โดยตรง';

  @override
  String get assSsaDirectPlay => 'เล่นโดยตรง ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'เล่นคำบรรยาย ASS/SSA โดยตรง';

  @override
  String get white => 'สีขาว';

  @override
  String get black => 'สีดำ';

  @override
  String get yellow => 'สีเหลือง';

  @override
  String get green => 'สีเขียว';

  @override
  String get cyan => 'สีฟ้า';

  @override
  String get red => 'สีแดง';

  @override
  String get transparent => 'โปร่งใส';

  @override
  String get semiTransparentBlack => 'สีดำกึ่งโปร่งใส';

  @override
  String get global => 'ทั่วโลก';

  @override
  String get desktop => 'เดสก์ท็อป';

  @override
  String get mobile => 'มือถือ';

  @override
  String get tv => 'ทีวี';

  @override
  String loadedProfileSettings(String profile) {
    return 'โหลดการตั้งค่าโปรไฟล์ $profile แล้ว';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'ไม่สามารถโหลดการตั้งค่าโปรไฟล์ $profile';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'ซิงค์การตั้งค่าท้องถิ่นกับโปรไฟล์ $profile';
  }

  @override
  String get customizationProfile => 'โปรไฟล์การปรับแต่ง';

  @override
  String get customizationProfileDescription =>
      'เลือกโปรไฟล์ที่จะโหลด แก้ไข และซิงค์ Global มีผลทุกที่ เว้นแต่ว่าโปรไฟล์อุปกรณ์จะแทนที่ข้อมูลดังกล่าว จุดสีเขียวทำเครื่องหมายโปรไฟล์อุปกรณ์ปัจจุบันของคุณ';

  @override
  String get loadProfile => 'โหลดโปรไฟล์';

  @override
  String get syncing => 'กำลังซิงค์...';

  @override
  String get syncToProfile => 'ซิงค์กับโปรไฟล์';

  @override
  String get profileSyncHidden => 'การซิงค์โปรไฟล์ถูกซ่อนไว้';

  @override
  String get enablePluginSyncDescription =>
      'เปิดใช้งานการซิงค์ปลั๊กอินเซิร์ฟเวอร์ในการตั้งค่าปลั๊กอินเพื่อแสดงการควบคุมโปรไฟล์ที่นี่';

  @override
  String get quality => 'คุณภาพ';

  @override
  String get defaultDownloadQuality => 'คุณภาพการดาวน์โหลดเริ่มต้น';

  @override
  String get network => 'เครือข่าย';

  @override
  String get wifiOnlyDownloads => 'ดาวน์โหลดเฉพาะ WiFi เท่านั้น';

  @override
  String get onlyDownloadOnWifi => 'ดาวน์โหลดเมื่อเชื่อมต่อกับ WiFi เท่านั้น';

  @override
  String get storage => 'พื้นที่จัดเก็บ';

  @override
  String get storageUsed => 'พื้นที่เก็บข้อมูลที่ใช้';

  @override
  String get manage => 'จัดการ';

  @override
  String get calculating => 'กำลังคำนวณ...';

  @override
  String get downloadLocation => 'ดาวน์โหลดตำแหน่ง';

  @override
  String get defaultLabel => 'ค่าเริ่มต้น';

  @override
  String get saveToDownloadsFolder => 'บันทึกลงในโฟลเดอร์ดาวน์โหลด';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — มองเห็นได้โดยแอปอื่น';

  @override
  String get dangerZone => 'โซนอันตราย';

  @override
  String get clearAllDownloads => 'ล้างการดาวน์โหลดทั้งหมด';

  @override
  String get original => 'ต้นฉบับ';

  @override
  String get changeDownloadLocation => 'เปลี่ยนตำแหน่งการดาวน์โหลด';

  @override
  String get changeDownloadLocationDescription =>
      'การดาวน์โหลดใหม่จะถูกบันทึกลงในโฟลเดอร์ที่เลือก การดาวน์โหลดที่มีอยู่จะยังคงอยู่ในตำแหน่งปัจจุบันและสามารถจัดการได้จากการตั้งค่าที่เก็บข้อมูล';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get cannotWriteToFolder =>
      'ไม่สามารถเขียนไปยังโฟลเดอร์ที่เลือกได้ โปรดเลือกสถานที่อื่นหรือให้สิทธิ์ในการจัดเก็บข้อมูล';

  @override
  String get saveToDownloadsFolderQuestion => 'บันทึกลงโฟลเดอร์ดาวน์โหลดใช่ไหม';

  @override
  String get saveToDownloadsFolderDescription =>
      'สื่อที่ดาวน์โหลดจะถูกบันทึกไว้ใน Downloads/Moonfin บนอุปกรณ์ของคุณ ไฟล์เหล่านี้จะปรากฏแก่แอปอื่นๆ เช่น แกลเลอรีหรือเครื่องเล่นเพลงของคุณ\n\nการดาวน์โหลดที่มีอยู่จะยังคงอยู่ในตำแหน่งปัจจุบัน';

  @override
  String get enable => 'เปิดใช้งาน';

  @override
  String get clearAllDownloadsWarning =>
      'การดำเนินการนี้จะลบสื่อที่ดาวน์โหลดมาทั้งหมดและไม่สามารถยกเลิกได้';

  @override
  String get clearAll => 'ล้างทั้งหมด';

  @override
  String get navigationStyle => 'รูปแบบการนำทาง';

  @override
  String get topBar => 'ท็อปบาร์';

  @override
  String get leftSidebar => 'แถบด้านข้างซ้าย';

  @override
  String get showShuffleButton => 'แสดงปุ่มสุ่ม';

  @override
  String get showGenresButton => 'ปุ่มแสดงประเภท';

  @override
  String get showFavoritesButton => 'แสดงปุ่มรายการโปรด';

  @override
  String get showLibrariesInToolbar => 'แสดงไลบรารีในแถบเครื่องมือ';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'ความทึบของแถบนำทาง';

  @override
  String get navbarColor => 'สีของแถบนำทาง';

  @override
  String get gray => 'สีเทา';

  @override
  String get darkBlue => 'สีน้ำเงินเข้ม';

  @override
  String get purple => 'สีม่วง';

  @override
  String get teal => 'นกเป็ดน้ำ';

  @override
  String get navy => 'กองทัพเรือ';

  @override
  String get charcoal => 'ถ่าน';

  @override
  String get brown => 'สีน้ำตาล';

  @override
  String get darkRed => 'สีแดงเข้ม';

  @override
  String get darkGreen => 'สีเขียวเข้ม';

  @override
  String get slate => 'กระดานชนวน';

  @override
  String get indigo => 'คราม';

  @override
  String get libraryDisplay => 'การแสดงห้องสมุด';

  @override
  String get posterLabel => 'โปสเตอร์';

  @override
  String get thumbnailLabel => 'ภาพขนาดย่อ';

  @override
  String get bannerLabel => 'แบนเนอร์';

  @override
  String get overridePerLibrarySettings => 'แทนที่การตั้งค่าต่อไลบรารี';

  @override
  String get applyImageTypeToAllLibraries => 'ใช้ประเภทรูปภาพกับไลบรารีทั้งหมด';

  @override
  String get multiServerLibraries => 'ไลบรารีหลายเซิร์ฟเวอร์';

  @override
  String get showLibrariesFromAllServers =>
      'แสดงไลบรารีจากเซิร์ฟเวอร์ที่เชื่อมต่อทั้งหมด';

  @override
  String get enableFolderView => 'เปิดใช้งานมุมมองโฟลเดอร์';

  @override
  String get showFolderBrowsingOption => 'แสดงตัวเลือกการเรียกดูโฟลเดอร์';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'การมองเห็นห้องสมุด';

  @override
  String get libraryVisibilityDescription =>
      'สลับการเปิดเผยหน้าแรกต่อห้องสมุด รีสตาร์ท Moonfin เพื่อให้การเปลี่ยนแปลงมีผล';

  @override
  String get showInNavigation => 'แสดงในการนำทาง';

  @override
  String get showInLatestMedia => 'แสดงในสื่อใหม่ล่าสุด';

  @override
  String get sourceLibraries => 'ไลบรารีต้นทาง';

  @override
  String get sourceCollections => 'แหล่งรวบรวม';

  @override
  String get excludedGenres => 'ประเภทที่ยกเว้น';

  @override
  String get selectAll => 'เลือกทั้งหมด';

  @override
  String itemsSelected(int count) {
    return '$count เลือกแล้ว';
  }

  @override
  String get mediaBar => 'แถบมีเดีย';

  @override
  String get mediaSources => 'แหล่งสื่อ';

  @override
  String get behavior => 'พฤติกรรม';

  @override
  String get seconds => 'วินาที';

  @override
  String get localPreviews => 'การแสดงตัวอย่างในท้องถิ่น';

  @override
  String get localPreviewsDescription =>
      'กำหนดค่าตัวอย่าง สื่อ และเสียงตัวอย่าง';

  @override
  String get mediaBarMode => 'สไตล์มีเดียบาร์';

  @override
  String get mediaBarModeDescription =>
      'เลือกระหว่าง Moonfin, MakD หรือปิดแถบสื่อ';

  @override
  String get mediaBarModeMoonfin => 'มูนฟิน';

  @override
  String get mediaBarModeMakd => 'หมากดี';

  @override
  String get mediaBarModeOff => 'ปิด';

  @override
  String get enableMediaBar => 'เปิดใช้งานแถบสื่อ';

  @override
  String get showFeaturedContentSlideshow =>
      'แสดงสไลด์โชว์เนื้อหาเด่นบนหน้าแรก';

  @override
  String get contentType => 'ประเภทเนื้อหา';

  @override
  String get moviesAndTvShows => 'ภาพยนตร์และรายการทีวี';

  @override
  String get moviesOnly => 'ภาพยนตร์เท่านั้น';

  @override
  String get tvShowsOnly => 'รายการทีวีเท่านั้น';

  @override
  String get itemCount => 'จำนวนรายการ';

  @override
  String get noneSelected => 'ไม่มีการเลือกเลย';

  @override
  String get noneExcluded => 'ไม่มีการยกเว้น';

  @override
  String get autoAdvance => 'ออโต้แอดวานซ์';

  @override
  String get autoAdvanceSlides => 'เลื่อนไปยังสไลด์ถัดไปโดยอัตโนมัติ';

  @override
  String get autoAdvanceInterval => 'ช่วงเวลาล่วงหน้าอัตโนมัติ';

  @override
  String get trailerPreview => 'ตัวอย่างตัวอย่าง';

  @override
  String get autoPlayTrailers =>
      'เล่นตัวอย่างอัตโนมัติในแถบสื่อหลังจากผ่านไป 3 วินาที';

  @override
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

  @override
  String get episodePreview => 'ดูตัวอย่างตอน';

  @override
  String get mediaPreview => 'การแสดงตัวอย่างสื่อ';

  @override
  String get episodePreviewDescription =>
      'เล่นตัวอย่างอินไลน์ 30 วินาทีบนการ์ดที่โฟกัส โฮเวอร์ หรือกดค้าง';

  @override
  String get mediaPreviewDescription =>
      'เล่นตัวอย่างอินไลน์ 30 วินาทีบนการ์ดที่โฟกัส โฮเวอร์ หรือกดค้าง';

  @override
  String get previewAudio => 'ดูตัวอย่างเสียง';

  @override
  String get enablePreviewAudio =>
      'เปิดใช้งานเสียงสำหรับตัวอย่างและตัวอย่างตอน';

  @override
  String get latestMedia => 'สื่อล่าสุด';

  @override
  String get recentlyReleased => 'เพิ่งเปิดตัว';

  @override
  String get myMedia => 'สื่อของฉัน';

  @override
  String get myMediaSmall => 'สื่อของฉัน (เล็ก)';

  @override
  String get continueWatching => 'ดูต่อ';

  @override
  String get resumeAudio => 'เล่นเสียงต่อ';

  @override
  String get resumeBooks => 'หนังสือประวัติย่อ';

  @override
  String get activeRecordings => 'การบันทึกที่ใช้งานอยู่';

  @override
  String get playlists => 'เพลย์ลิสต์';

  @override
  String get liveTV => 'รายการสดทางทีวี';

  @override
  String get homeSections => 'หน้าแรก';

  @override
  String get resetToDefaults => 'รีเซ็ตเป็นค่าเริ่มต้น';

  @override
  String get homeRowPosterSize => 'ขนาดโปสเตอร์แถวบ้าน';

  @override
  String get perRowImageTypeSelection => 'การเลือกประเภทรูปภาพต่อแถว';

  @override
  String get configureImageTypeForEachRow =>
      'กำหนดค่าประเภทรูปภาพสำหรับแถวหลักที่เปิดใช้งานแต่ละแถว';

  @override
  String get mergeContinueWatchingAndNextUp => 'รวมดูต่อและถัดไป';

  @override
  String get combineBothRows => 'รวมทั้งสองแถวเป็นส่วนบ้านเดียว';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'ประเภทรูปภาพต่อแถว';

  @override
  String get perRowSettings => 'การตั้งค่าต่อแถว';

  @override
  String get autoLogin => 'เข้าสู่ระบบอัตโนมัติ';

  @override
  String get lastUser => 'ผู้ใช้คนสุดท้าย';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'ตรวจสอบสิทธิ์เสมอ';

  @override
  String get requirePasswordWithToken =>
      'ต้องใช้รหัสผ่านแม้จะมีโทเค็นที่เก็บไว้';

  @override
  String get confirmExit => 'ยืนยันการออก';

  @override
  String get showConfirmationBeforeExiting => 'แสดงการยืนยันก่อนออก';

  @override
  String get blockContentWithRatings => 'บล็อกเนื้อหาที่มีการให้คะแนนต่อไปนี้:';

  @override
  String get noContentRatingsFound =>
      'ยังไม่พบการให้คะแนนเนื้อหาบนเซิร์ฟเวอร์นี้';

  @override
  String get couldNotLoadServerRatings =>
      'ไม่สามารถโหลดการให้คะแนนของเซิร์ฟเวอร์ แสดงการให้คะแนนที่บันทึกไว้เท่านั้น';

  @override
  String get couldNotRefreshRatings =>
      'ไม่สามารถรีเฟรชการให้คะแนนจากเซิร์ฟเวอร์ได้ กำลังแสดงคะแนนที่บันทึกไว้';

  @override
  String get enablePinCode => 'เปิดใช้งานรหัส PIN';

  @override
  String get requirePinToAccess => 'ต้องใช้ PIN เพื่อเข้าถึงบัญชีของคุณ';

  @override
  String get changePin => 'เปลี่ยนรหัส PIN';

  @override
  String get setNewPinCode => 'ตั้งรหัส PIN ใหม่';

  @override
  String get removePin => 'ลบ PIN';

  @override
  String get removePinProtection => 'ลบการป้องกันรหัส PIN';

  @override
  String get screensaver => 'สกรีนเซฟเวอร์';

  @override
  String get inAppScreensaver => 'สกรีนเซฟเวอร์ในแอป';

  @override
  String get enableBuiltInScreensaver => 'เปิดใช้งานสกรีนเซฟเวอร์ในตัว';

  @override
  String get mode => 'โหมด';

  @override
  String get libraryArt => 'ห้องสมุดศิลปะ';

  @override
  String get logo => 'โลโก้';

  @override
  String get clock => 'นาฬิกา';

  @override
  String get timeout => 'หมดเวลา';

  @override
  String minutesShort(int minutes) {
    return '$minutes นาที';
  }

  @override
  String get dimmingLevel => 'ระดับการหรี่แสง';

  @override
  String get maxAgeRating => 'เรตติ้งอายุสูงสุด';

  @override
  String get any => 'ใดๆ';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'ต้องมีการจัดระดับอายุ';

  @override
  String get onlyShowRatedContent => 'แสดงเฉพาะเนื้อหาที่ได้รับการจัดอันดับ';

  @override
  String get showClock => 'แสดงนาฬิกา';

  @override
  String get displayClockDuringScreensaver => 'แสดงนาฬิการะหว่างสกรีนเซฟเวอร์';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'มะเขือเทศเน่า (นักวิจารณ์)';

  @override
  String get rottenTomatoesAudience => 'มะเขือเทศเน่า (ผู้ชม)';

  @override
  String get imdb => 'ไอเอ็มดีบี';

  @override
  String get tmdb => 'ทีเอ็มดีบี';

  @override
  String get metacritic => 'ริติค';

  @override
  String get metacriticUser => 'ริติค (ผู้ใช้)';

  @override
  String get trakt => 'แทรคท์';

  @override
  String get letterboxd => 'ตู้จดหมายd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'การให้คะแนนของชุมชน';

  @override
  String get ratings => 'การให้คะแนน';

  @override
  String get additionalRatings => 'การให้คะแนนเพิ่มเติม';

  @override
  String get showMdbListAndTmdbRatings => 'แสดงการให้คะแนน MDBList และ TMDB';

  @override
  String get ratingLabels => 'ป้ายกำกับการให้คะแนน';

  @override
  String get showLabelsNextToIcons => 'แสดงป้ายกำกับถัดจากไอคอนการให้คะแนน';

  @override
  String get ratingBadges => 'ป้ายเรตติ้ง';

  @override
  String get showDecorativeBadges => 'แสดงป้ายตกแต่งด้านหลังเรตติ้ง';

  @override
  String get episodeRatings => 'การให้คะแนนตอน';

  @override
  String get showRatingsOnEpisodes => 'แสดงเรตติ้งในแต่ละตอน';

  @override
  String get ratingSources => 'แหล่งที่มาของการให้คะแนน';

  @override
  String get ratingSourcesDescription =>
      'เปิดใช้งานและจัดลำดับแหล่งการให้คะแนนที่แสดงทั่วทั้งแอปใหม่';

  @override
  String get pluginLabel => 'ปลั๊กอิน';

  @override
  String get pluginDetected => 'ตรวจพบปลั๊กอิน';

  @override
  String get pluginNotDetected => 'ตรวจไม่พบปลั๊กอิน';

  @override
  String get pluginDetectedDescription =>
      'ตรวจพบปลั๊กอินของเซิร์ฟเวอร์ การซิงค์จะเปิดใช้งานโดยอัตโนมัติในครั้งแรกที่พบปลั๊กอิน';

  @override
  String get pluginNotDetectedDescription =>
      'ตรวจไม่พบปลั๊กอินของเซิร์ฟเวอร์ในขณะนี้ การตั้งค่าในเครื่องยังคงใช้ค่าที่บันทึกไว้หรือค่าเริ่มต้นในตัว';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nเวอร์ชัน: $version';
  }

  @override
  String get availableServices => 'บริการที่มีอยู่';

  @override
  String get serverPluginSync => 'การซิงค์ปลั๊กอินเซิร์ฟเวอร์';

  @override
  String get syncSettingsWithPlugin => 'ซิงค์การตั้งค่ากับปลั๊กอินเซิร์ฟเวอร์';

  @override
  String get whatSyncControls => 'สิ่งที่ควบคุมการซิงค์';

  @override
  String get syncControlsDescription =>
      'การซิงค์จะควบคุมเฉพาะว่าจะพุชและดึงการตั้งค่าที่สนับสนุนปลั๊กอินจากเซิร์ฟเวอร์หรือไม่ การเลือกโปรไฟล์และการซิงค์โปรไฟล์อยู่ในการตั้งค่าการปรับแต่งเมื่อเปิดใช้งานการซิงค์ปลั๊กอิน';

  @override
  String get recentRequests => 'คำขอล่าสุด';

  @override
  String get recentlyAdded => 'เพิ่งเพิ่มเข้ามา';

  @override
  String get trending => 'กำลังมาแรง';

  @override
  String get popularMovies => 'ภาพยนตร์ยอดนิยม';

  @override
  String get movieGenres => 'ประเภทภาพยนตร์';

  @override
  String get upcomingMovies => 'ภาพยนตร์ที่จะเกิดขึ้น';

  @override
  String get studios => 'สตูดิโอ';

  @override
  String get popularSeries => 'ซีรีย์ยอดนิยม';

  @override
  String get seriesGenres => 'ประเภทซีรีส์';

  @override
  String get upcomingSeries => 'ซีรี่ส์ที่กำลังจะมาถึง';

  @override
  String get networks => 'เครือข่าย';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'รีเซ็ตแถวเป็นค่าเริ่มต้น';

  @override
  String get enableSeerr => 'เปิดใช้งาน Seerr';

  @override
  String get showSeerrInNavigation =>
      'แสดง Seerr ในการนำทาง (ต้องใช้ปลั๊กอินเซิร์ฟเวอร์)';

  @override
  String get seerrUnavailable =>
      'ไม่พร้อมใช้งานเนื่องจากการรองรับปลั๊กอินเซิร์ฟเวอร์ Seerr ถูกปิดใช้งาน';

  @override
  String get nsfwFilter => 'ตัวกรอง NSFW';

  @override
  String get hideAdultContent => 'ซ่อนเนื้อหาสำหรับผู้ใหญ่ในผลลัพธ์';

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
    return 'เข้าสู่ระบบด้วย: $username';
  }

  @override
  String get discoverRows => 'ค้นพบแถว';

  @override
  String get discoverRowsDescriptionPlugin =>
      'ลากเพื่อเรียงลำดับใหม่ เปิดหรือปิดการใช้งานแถว เปิดใช้งานการซิงค์ลำดับแถวกับปลั๊กอิน Moonfin';

  @override
  String get discoverRowsDescription =>
      'ลากเพื่อเรียงลำดับใหม่ เปิดหรือปิดการใช้งานแถว';

  @override
  String get enabled => 'เปิดใช้งานแล้ว';

  @override
  String get hidden => 'ที่ซ่อนอยู่';

  @override
  String get aboutTitle => 'เกี่ยวกับ';

  @override
  String versionValue(String version) {
    return 'เวอร์ชัน $version';
  }

  @override
  String get openSourceLicenses => 'ใบอนุญาตโอเพ่นซอร์ส';

  @override
  String get sourceCode => 'ซอร์สโค้ด';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'ตรวจสอบการอัปเดตทันที';

  @override
  String get checksLatestDesktopRelease =>
      'ตรวจสอบเดสก์ท็อปรุ่นล่าสุดสำหรับแพลตฟอร์มนี้';

  @override
  String get youAreUpToDate => 'คุณทันสมัยแล้ว';

  @override
  String get couldNotCheckForUpdates => 'ไม่สามารถตรวจสอบการอัปเดตได้ในขณะนี้';

  @override
  String get noCompatibleUpdate =>
      'ไม่พบแพ็คเกจการอัปเดตที่เข้ากันได้สำหรับแพลตฟอร์มนี้';

  @override
  String get updateChecksNotSupported =>
      'แพลตฟอร์มนี้ไม่รองรับการตรวจสอบการอัปเดต';

  @override
  String get updateNotificationsDisabled => 'การแจ้งเตือนการอัปเดตถูกปิดใช้งาน';

  @override
  String get pleaseWaitBeforeChecking => 'กรุณารอก่อนตรวจสอบอีกครั้ง';

  @override
  String get latestUpdateAlreadyShown => 'มีการแสดงการอัปเดตล่าสุดแล้ว';

  @override
  String get updateAvailable => 'อัปเดตพร้อมใช้งาน';

  @override
  String updateAvailableVersion(String version) {
    return 'มีการอัปเดต: v$version';
  }

  @override
  String get updateNotifications => 'อัปเดตการแจ้งเตือน';

  @override
  String get showWhenUpdatesAvailable => 'แสดงเมื่อมีการอัพเดต';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version ว่างแล้ว';
  }

  @override
  String get readReleaseNotes => 'อ่านบันทึกประจำรุ่น';

  @override
  String get downloadingUpdate => 'กำลังดาวน์โหลดอัปเดต...';

  @override
  String get updateDownloadFailed =>
      'การดาวน์โหลดอัปเดตล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get openReleasesPage => 'เปิดหน้าการเผยแพร่';

  @override
  String get navigation => 'การนำทาง';

  @override
  String get watchedIndicatorsBackdrops => 'ตัวบ่งชี้ที่รับชม, ฉากหลัง';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'โฟกัสสี ตัวบ่งชี้ที่ดู ฉากหลัง';

  @override
  String get navbarStyleToolbarAppearance =>
      'สไตล์แถบนำทาง ปุ่มแถบเครื่องมือ ลักษณะที่ปรากฏ';

  @override
  String get reorderToggleHomeRows => 'เรียงลำดับใหม่และสลับแถวบ้าน';

  @override
  String get featuredContentAppearance => 'เนื้อหาเด่น รูปลักษณ์ภายนอก';

  @override
  String get posterSizeImageTypeFolderView =>
      'ขนาดโปสเตอร์ ประเภทรูปภาพ มุมมองโฟลเดอร์';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB และแหล่งที่มาของการจัดอันดับ';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'ชัดเจน';

  @override
  String get browse => 'เรียกดู';

  @override
  String get noResults => 'ไม่มีผลลัพธ์';

  @override
  String get seerrAvailableStatus => 'มีอยู่';

  @override
  String get seerrRequestedStatus => 'ร้องขอ';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count รายการ';
  }

  @override
  String get seerrSettings => 'การตั้งค่าเซียร์';

  @override
  String get requestMore => 'ขอเพิ่มเติม';

  @override
  String get request => 'ขอ';

  @override
  String get cancelRequest => 'ยกเลิกคำขอ';

  @override
  String get playInMoonfin => 'เล่นใน Moonfin';

  @override
  String requestedByName(String name) {
    return 'ร้องขอโดย $name';
  }

  @override
  String get approve => 'อนุมัติ';

  @override
  String get declineAction => 'ปฏิเสธ';

  @override
  String get similar => 'คล้ายกัน';

  @override
  String get recommendations => 'ข้อแนะนำ';

  @override
  String cancelRequestForTitle(String title) {
    return 'ยกเลิกคำขอ \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'ยกเลิกคำขอ $count สำหรับ \"$title\" หรือไม่';
  }

  @override
  String get keep => 'เก็บ';

  @override
  String get itemNotFoundInLibrary => 'ไม่พบรายการในไลบรารี Moonfin ของคุณ';

  @override
  String get errorSearchingLibrary => 'เกิดข้อผิดพลาดในการค้นหาห้องสมุด';

  @override
  String budgetAmount(String amount) {
    return 'งบประมาณ: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'รายได้: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'ร้องขอ $type';
  }

  @override
  String get submitRequest => 'ส่งคำขอ';

  @override
  String get allSeasons => 'ทุกฤดูกาล';

  @override
  String get advancedOptions => 'ตัวเลือกขั้นสูง';

  @override
  String get noServiceServersConfigured => 'ไม่มีการกำหนดค่าเซิร์ฟเวอร์บริการ';

  @override
  String get server => 'เซิร์ฟเวอร์';

  @override
  String get qualityProfile => 'โปรไฟล์คุณภาพ';

  @override
  String get rootFolder => 'โฟลเดอร์รูท';

  @override
  String get showMore => 'แสดงเพิ่มเติม';

  @override
  String get appearances => 'การปรากฏตัว';

  @override
  String get crewSection => 'ลูกทีม';

  @override
  String ageValue(int age) {
    return 'อายุ $age';
  }

  @override
  String get noRequests => 'ไม่มีการร้องขอ';

  @override
  String get pendingStatus => 'รอดำเนินการ';

  @override
  String get declinedStatus => 'ปฏิเสธ';

  @override
  String get partiallyAvailable => 'มีจำหน่ายบางส่วน';

  @override
  String get downloadingStatus => 'กำลังดาวน์โหลด';

  @override
  String get approvedStatus => 'ที่ได้รับการอนุมัติ';

  @override
  String get notRequestedStatus => 'ไม่ได้รับการร้องขอ';

  @override
  String get blocklistedStatus => 'อยู่ในรายการบล็อก';

  @override
  String get deletedStatus => 'ลบแล้ว';

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
  String get tmdbScore => 'คะแนน TMDB';

  @override
  String get releaseDateLabel => 'วันที่วางจำหน่าย';

  @override
  String get firstAirDateLabel => 'วันที่ออกอากาศครั้งแรก';

  @override
  String get revenueLabel => 'รายได้';

  @override
  String get runtimeLabel => 'รันไทม์';

  @override
  String get budgetLabel => 'งบประมาณ';

  @override
  String get originalLanguageLabel => 'ภาษาต้นฉบับ';

  @override
  String get seasonsLabel => 'ฤดูกาล';

  @override
  String get episodesLabel => 'ตอน';

  @override
  String get access => 'เข้าถึง';

  @override
  String get add => 'เพิ่ม';

  @override
  String get address => 'ที่อยู่';

  @override
  String get analytics => 'การวิเคราะห์';

  @override
  String get catalog => 'แคตตาล็อก';

  @override
  String get content => 'เนื้อหา';

  @override
  String get copy => 'สำเนา';

  @override
  String get create => 'สร้าง';

  @override
  String get disable => 'ปิดการใช้งาน';

  @override
  String get done => 'เสร็จแล้ว';

  @override
  String get edit => 'แก้ไข';

  @override
  String get encoding => 'การเข้ารหัส';

  @override
  String get error => 'ข้อผิดพลาด';

  @override
  String get forward => 'ซึ่งไปข้างหน้า';

  @override
  String get general => 'ทั่วไป';

  @override
  String get go => 'ไป';

  @override
  String get install => 'ติดตั้ง';

  @override
  String get installed => 'ติดตั้งแล้ว';

  @override
  String get interval => 'ช่วงเวลา';

  @override
  String get name => 'ชื่อ';

  @override
  String get networking => 'เครือข่าย';

  @override
  String get next => 'ต่อไป';

  @override
  String get path => 'เส้นทาง';

  @override
  String get paused => 'หยุดชั่วคราว';

  @override
  String get permissions => 'สิทธิ์';

  @override
  String get processing => 'กำลังประมวลผล';

  @override
  String get profile => 'ประวัติโดยย่อ';

  @override
  String get provider => 'ผู้ให้บริการ';

  @override
  String get refresh => 'รีเฟรช';

  @override
  String get remote => 'ระยะไกล';

  @override
  String get rename => 'เปลี่ยนชื่อ';

  @override
  String get revoke => 'ถอน';

  @override
  String get role => 'บทบาท';

  @override
  String get root => 'ราก';

  @override
  String get run => 'วิ่ง';

  @override
  String get search => 'ค้นหา';

  @override
  String get select => 'เลือก';

  @override
  String get send => 'ส่ง';

  @override
  String get sessions => 'เซสชัน';

  @override
  String get set => 'ชุด';

  @override
  String get status => 'สถานะ';

  @override
  String get stop => 'หยุด';

  @override
  String get streaming => 'สตรีมมิ่ง';

  @override
  String get time => 'เวลา';

  @override
  String get trickplay => 'เล่นกล';

  @override
  String get uninstall => 'ถอนการติดตั้ง';

  @override
  String get up => 'ขึ้น';

  @override
  String get update => 'อัปเดต';

  @override
  String get upload => 'อัปโหลด';

  @override
  String get unmute => 'เปิดเสียง';

  @override
  String get mute => 'ปิดเสียง';

  @override
  String get branding => 'การสร้างแบรนด์';

  @override
  String get adminDrawerDashboard => 'แดชบอร์ด';

  @override
  String get adminDrawerAnalytics => 'การวิเคราะห์';

  @override
  String get adminDrawerSettings => 'การตั้งค่า';

  @override
  String get adminDrawerBranding => 'การสร้างแบรนด์';

  @override
  String get adminDrawerUsers => 'ผู้ใช้';

  @override
  String get adminDrawerLibraries => 'ห้องสมุด';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'การแปลงรหัส';

  @override
  String get adminDrawerResume => 'ประวัติย่อ';

  @override
  String get adminDrawerStreaming => 'สตรีมมิ่ง';

  @override
  String get adminDrawerTrickplay => 'เล่นกล';

  @override
  String get adminDrawerDevices => 'อุปกรณ์';

  @override
  String get adminDrawerActivity => 'กิจกรรม';

  @override
  String get adminDrawerNetworking => 'เครือข่าย';

  @override
  String get adminDrawerApiKeys => 'คีย์ API';

  @override
  String get adminDrawerBackups => 'การสำรองข้อมูล';

  @override
  String get adminDrawerLogs => 'บันทึก';

  @override
  String get adminDrawerScheduledTasks => 'งานที่กำหนดเวลาไว้';

  @override
  String get adminDrawerPlugins => 'ปลั๊กอิน';

  @override
  String get adminDrawerRepositories => 'ที่เก็บ';

  @override
  String get adminDrawerLiveTv => 'รายการสดทางทีวี';

  @override
  String get adminExitTooltip => 'ออกจากผู้ดูแลระบบ';

  @override
  String get adminDashboardLoadFailed => 'โหลดแดชบอร์ดไม่สำเร็จ';

  @override
  String get adminMediaOverview => 'ภาพรวมสื่อ';

  @override
  String get adminMediaTotalsError => 'ไม่สามารถโหลดสื่อเซิร์ฟเวอร์ทั้งหมดได้';

  @override
  String get adminMediaOverviewSubtitle =>
      'อ่านอย่างรวดเร็วเกี่ยวกับปริมาณเนื้อหาบนเซิร์ฟเวอร์นี้';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'มีการอัปเดตปลั๊กอิน: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'ปลั๊กอินที่ต้องรีสตาร์ท: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'งานที่กำหนดเวลาไว้ล้มเหลว: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'รายการคำเตือน/ข้อผิดพลาดล่าสุด: $count';
  }

  @override
  String get analyticsMediaDistribution => 'การกระจายสื่อ';

  @override
  String get analyticsVideoCodecs => 'ตัวแปลงสัญญาณวิดีโอ';

  @override
  String get analyticsAudioCodecs => 'ตัวแปลงสัญญาณเสียง';

  @override
  String get analyticsContainers => 'ตู้คอนเทนเนอร์';

  @override
  String get analyticsTopGenres => 'แนวเพลงยอดนิยม';

  @override
  String get analyticsReleaseYears => 'ปีที่วางจำหน่าย';

  @override
  String get analyticsContentRatings => 'การให้คะแนนเนื้อหา';

  @override
  String get analyticsRuntimeBuckets => 'ที่เก็บข้อมูลรันไทม์';

  @override
  String get analyticsFileFormats => 'รูปแบบไฟล์';

  @override
  String get analyticsNoData => 'ไม่มีข้อมูล.';

  @override
  String get adminServerInfo => 'ข้อมูลเซิร์ฟเวอร์';

  @override
  String get adminRestartPending => 'รีสตาร์ทรอดำเนินการ';

  @override
  String get adminServerPaths => 'เส้นทางเซิร์ฟเวอร์';

  @override
  String get adminServerActions => 'การดำเนินการของเซิร์ฟเวอร์';

  @override
  String get adminRestartServer => 'รีสตาร์ทเซิร์ฟเวอร์';

  @override
  String get adminShutdownServer => 'ปิดเซิร์ฟเวอร์';

  @override
  String get adminScanLibraries => 'สแกนไลบรารี';

  @override
  String get adminLibraryScanStarted => 'เริ่มสแกนห้องสมุดแล้ว';

  @override
  String errorGeneric(String error) {
    return 'ข้อผิดพลาด: $error';
  }

  @override
  String get adminServerRebootInProgress => 'เซิร์ฟเวอร์กำลังรีบูต';

  @override
  String get adminServerRebootMessage =>
      'เซิร์ฟเวอร์กำลังรีบูต โปรดรีสตาร์ท Moonfin';

  @override
  String get adminActiveSessions => 'เซสชันที่ใช้งานอยู่';

  @override
  String get adminSessionsLoadFailed => 'โหลดเซสชั่นไม่สำเร็จ';

  @override
  String get adminNoActiveSessions => 'ไม่มีเซสชันที่ใช้งานอยู่';

  @override
  String get adminRecentActivity => 'กิจกรรมล่าสุด';

  @override
  String get adminNoRecentActivity => 'ไม่มีกิจกรรมล่าสุด';

  @override
  String adminCommandFailed(String error) {
    return 'คำสั่งล้มเหลว: $error';
  }

  @override
  String get adminSendMessage => 'ส่งข้อความ';

  @override
  String get adminMessageTextHint => 'ข้อความ';

  @override
  String get adminSetVolume => 'ตั้งระดับเสียง';

  @override
  String get sessionPrev => 'ก่อนหน้า';

  @override
  String get sessionRewind => 'กรอกลับ';

  @override
  String get sessionForward => 'ซึ่งไปข้างหน้า';

  @override
  String get sessionNext => 'ต่อไป';

  @override
  String get sessionVolumeDown => 'เล่ม –';

  @override
  String get sessionVolumeUp => 'เล่ม +';

  @override
  String get uhd4k => '4เค';

  @override
  String get nowPlaying => 'กำลังเล่นอยู่';

  @override
  String get volume => 'ปริมาณ';

  @override
  String get actions => 'การดำเนินการ';

  @override
  String get videoCodec => 'ตัวแปลงสัญญาณวิดีโอ';

  @override
  String get audioCodec => 'ตัวแปลงสัญญาณเสียง';

  @override
  String get hwAccel => 'เอชดับเบิลยู แอคเซล';

  @override
  String get completion => 'เสร็จสิ้น';

  @override
  String get direct => 'โดยตรง';

  @override
  String get adminDisconnect => 'ตัดการเชื่อมต่อ';

  @override
  String get adminClearDates => 'วันที่ที่ชัดเจน';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'ไม่สามารถโหลดบันทึกกิจกรรม: $error';
  }

  @override
  String get adminNoActivityEntries => 'ไม่มีรายการกิจกรรม';

  @override
  String get adminEditDeviceName => 'แก้ไขชื่ออุปกรณ์';

  @override
  String get adminCustomName => 'ชื่อที่กำหนดเอง';

  @override
  String get adminDeviceNameUpdated => 'อัปเดตชื่ออุปกรณ์แล้ว';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'ไม่สามารถอัปเดตอุปกรณ์: $error';
  }

  @override
  String get adminDeleteDevice => 'ลบอุปกรณ์';

  @override
  String get adminDeviceDeleted => 'ลบอุปกรณ์แล้ว';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'ไม่สามารถลบอุปกรณ์: $error';
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
  String get adminDevicesLoadFailed => 'โหลดอุปกรณ์ไม่สำเร็จ';

  @override
  String get adminSearchDevices => 'ค้นหาอุปกรณ์';

  @override
  String get adminThisDevice => 'อุปกรณ์นี้';

  @override
  String get adminEditName => 'แก้ไขชื่อ';

  @override
  String get adminLibrariesLoadFailed => 'ไม่สามารถโหลดไลบรารี';

  @override
  String get adminNoLibraries => 'ไม่มีการกำหนดค่าไลบรารี';

  @override
  String get adminScanAllLibraries => 'สแกนไลบรารีทั้งหมด';

  @override
  String get adminAddLibrary => 'เพิ่มห้องสมุด';

  @override
  String adminScanFailed(String error) {
    return 'ไม่สามารถเริ่มการสแกน: $error';
  }

  @override
  String get adminRenameLibrary => 'เปลี่ยนชื่อห้องสมุด';

  @override
  String get adminNewName => 'ชื่อใหม่';

  @override
  String adminLibraryRenamed(String name) {
    return 'ห้องสมุดเปลี่ยนชื่อเป็น \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'ไม่สามารถเปลี่ยนชื่อ: $error';
  }

  @override
  String get adminDeleteLibrary => 'ลบไลบรารี';

  @override
  String adminLibraryDeleted(String name) {
    return 'ลบห้องสมุด \"$name\" แล้ว';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'ไม่สามารถลบห้องสมุด: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'ไม่สามารถเพิ่มเส้นทาง: $error';
  }

  @override
  String get adminRemovePath => 'ลบเส้นทาง';

  @override
  String adminRemovePathConfirm(String path) {
    return 'ลบ \"$path\" ออกจากห้องสมุดนี้หรือไม่';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'ไม่สามารถลบเส้นทาง: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'บันทึกตัวเลือกห้องสมุดแล้ว';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'ไม่สามารถบันทึกตัวเลือก: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'โหลดไลบรารี่ไม่สำเร็จ';

  @override
  String get adminNoMediaPaths => 'ไม่มีการกำหนดค่าเส้นทางสื่อ';

  @override
  String get adminAddPath => 'เพิ่มเส้นทาง';

  @override
  String get adminBrowseFilesystem => 'เรียกดูระบบไฟล์เซิร์ฟเวอร์:';

  @override
  String get adminSaveOptions => 'บันทึกตัวเลือก';

  @override
  String get adminPreferredMetadataLanguage => 'ภาษาเมทาดาทาที่ต้องการ';

  @override
  String get adminMetadataLanguageHint => 'เช่น en, de, fr';

  @override
  String get adminMetadataCountryCode => 'รหัสประเทศของข้อมูลเมตา';

  @override
  String get adminMetadataCountryHint => 'เช่น สหรัฐอเมริกา เยอรมนี ฝรั่งเศส';

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
  String get adminLibraryNameRequired => 'ต้องระบุชื่อห้องสมุด';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'ไม่สามารถสร้างห้องสมุด: $error';
  }

  @override
  String get adminLibraryName => 'ชื่อห้องสมุด';

  @override
  String get adminSelectedPaths => 'เส้นทางที่เลือก:';

  @override
  String get adminNoPathsAdded =>
      'ไม่มีการเพิ่มเส้นทาง (สามารถเพิ่มได้ในภายหลัง)';

  @override
  String get adminCreateLibrary => 'สร้างห้องสมุด';

  @override
  String get paths => 'เส้นทาง:';

  @override
  String get adminDisableUser => 'ปิดการใช้งานผู้ใช้';

  @override
  String get adminEnableUser => 'เปิดใช้งานผู้ใช้';

  @override
  String adminDisableUserConfirm(String name) {
    return 'ปิดการใช้งาน $name? พวกเขาจะไม่สามารถลงชื่อเข้าใช้ได้';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'เปิดใช้งาน $name หรือไม่ พวกเขาจะสามารถลงชื่อเข้าใช้ได้อีกครั้ง';
  }

  @override
  String adminUserDisabled(String name) {
    return 'ผู้ใช้ \"$name\" ปิดการใช้งาน';
  }

  @override
  String adminUserEnabled(String name) {
    return 'เปิดใช้งานผู้ใช้ \"$name\" แล้ว';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ไม่สามารถอัปเดตนโยบายผู้ใช้: $error';
  }

  @override
  String get adminUsersLoadFailed => 'โหลดผู้ใช้ไม่สำเร็จ';

  @override
  String get adminSearchUsers => 'ค้นหาผู้ใช้';

  @override
  String get adminEditUser => 'แก้ไขผู้ใช้';

  @override
  String get adminAddUser => 'เพิ่มผู้ใช้';

  @override
  String adminUserCreateFailed(String error) {
    return 'ไม่สามารถสร้างผู้ใช้: $error';
  }

  @override
  String get adminCreateUser => 'สร้างผู้ใช้';

  @override
  String get adminPasswordOptional => 'รหัสผ่าน (ไม่จำเป็น)';

  @override
  String get adminUsernameRequired => 'ชื่อผู้ใช้ไม่สามารถเว้นว่างได้';

  @override
  String get adminNoProfileChanges => 'ไม่มีการเปลี่ยนแปลงโปรไฟล์ที่จะบันทึก';

  @override
  String get adminProfileSaved => 'บันทึกโปรไฟล์แล้ว';

  @override
  String adminSaveFailed(String error) {
    return 'ไม่สามารถบันทึก: $error';
  }

  @override
  String get adminPermissionsSaved => 'บันทึกสิทธิ์แล้ว';

  @override
  String get adminPasswordsMismatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String adminFailed(String error) {
    return 'ล้มเหลว: $error';
  }

  @override
  String get adminUserLoadFailed => 'โหลดผู้ใช้ไม่สำเร็จ';

  @override
  String get adminBackToUsers => 'กลับไปที่ผู้ใช้';

  @override
  String get adminSaveProfile => 'บันทึกโปรไฟล์';

  @override
  String get adminDeleteUser => 'ลบผู้ใช้';

  @override
  String get admin => 'ผู้ดูแลระบบ';

  @override
  String get adminFullAccessWarning =>
      'ผู้ดูแลระบบสามารถเข้าถึงเซิร์ฟเวอร์ได้อย่างสมบูรณ์ ให้ด้วยความระมัดระวัง';

  @override
  String get administrator => 'ผู้ดูแลระบบ';

  @override
  String get adminHiddenUser => 'ผู้ใช้ที่ซ่อนอยู่';

  @override
  String get adminAllowMediaPlayback => 'อนุญาตให้เล่นสื่อ';

  @override
  String get adminAllowAudioTranscoding => 'อนุญาตการแปลงรหัสเสียง';

  @override
  String get adminAllowVideoTranscoding => 'อนุญาตการแปลงรหัสวิดีโอ';

  @override
  String get adminAllowRemuxing => 'อนุญาตให้รีมิกซ์';

  @override
  String get adminForceRemoteTranscoding =>
      'บังคับให้แปลงรหัสแหล่งที่มาระยะไกล';

  @override
  String get adminAllowContentDeletion => 'อนุญาตให้ลบเนื้อหา';

  @override
  String get adminAllowContentDownloading => 'อนุญาตให้ดาวน์โหลดเนื้อหา';

  @override
  String get adminAllowPublicSharing => 'อนุญาตให้แชร์แบบสาธารณะ';

  @override
  String get adminAllowRemoteControl =>
      'อนุญาตให้มีการควบคุมระยะไกลของผู้ใช้รายอื่น';

  @override
  String get adminAllowSharedDeviceControl =>
      'อนุญาตการควบคุมอุปกรณ์ที่ใช้ร่วมกัน';

  @override
  String get adminAllowRemoteAccess => 'อนุญาตการเข้าถึงระยะไกล';

  @override
  String get adminRemoteBitrateLimit => 'ขีดจำกัดบิตเรตไคลเอ็นต์ระยะไกล (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'เว้นว่างไว้โดยไม่มีขีดจำกัด';

  @override
  String get adminMaxActiveSessions => 'เซสชันที่ใช้งานสูงสุด';

  @override
  String get adminAllowLiveTvAccess =>
      'อนุญาตให้เข้าถึงรายการถ่ายทอดสดทางโทรทัศน์';

  @override
  String get adminAllowLiveTvManagement => 'อนุญาตการจัดการรายการทีวีถ่ายทอดสด';

  @override
  String get adminAllowCollectionManagement => 'อนุญาตให้มีการจัดการคอลเลกชัน';

  @override
  String get adminAllowSubtitleManagement => 'อนุญาตการจัดการคำบรรยาย';

  @override
  String get adminAllowLyricManagement => 'อนุญาตให้มีการจัดการเนื้อเพลง';

  @override
  String get adminSavePermissions => 'บันทึกสิทธิ์';

  @override
  String get adminEnableAllLibraryAccess =>
      'เปิดใช้งานการเข้าถึงห้องสมุดทั้งหมด';

  @override
  String get adminSaveAccess => 'บันทึกการเข้าถึง';

  @override
  String get adminChangePassword => 'เปลี่ยนรหัสผ่าน';

  @override
  String get adminNewPassword => 'รหัสผ่านใหม่';

  @override
  String get adminConfirmPassword => 'ยืนยันรหัสผ่าน';

  @override
  String get adminSetPassword => 'ตั้งรหัสผ่าน';

  @override
  String get adminResetPassword => 'รีเซ็ตรหัสผ่าน';

  @override
  String get adminPasswordReset => 'รีเซ็ตรหัสผ่าน';

  @override
  String get adminPasswordUpdated => 'อัปเดตรหัสผ่านแล้ว';

  @override
  String get adminUserSettings => 'การตั้งค่าผู้ใช้';

  @override
  String get adminLibraryAccess => 'การเข้าถึงห้องสมุด';

  @override
  String get adminDeviceAndChannelAccess => 'การเข้าถึงอุปกรณ์และช่องสัญญาณ';

  @override
  String get adminEnableAllDevices => 'เปิดใช้งานการเข้าถึงอุปกรณ์ทั้งหมด';

  @override
  String get adminEnableAllChannels => 'เปิดให้เข้าถึงทุกช่องทาง';

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
      'นี่จะเป็นการลบรหัสผ่าน ผู้ใช้จะสามารถเข้าสู่ระบบได้โดยไม่ต้องใช้รหัสผ่าน';

  @override
  String adminServerReturnedHttp(int status) {
    return 'เซิร์ฟเวอร์ส่งคืน HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $name';
  }

  @override
  String adminUserDeleted(String name) {
    return 'ลบผู้ใช้ \"$name\" แล้ว';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ไม่สามารถลบผู้ใช้: $error';
  }

  @override
  String get adminCreateApiKey => 'สร้างคีย์ API';

  @override
  String get adminAppName => 'ชื่อแอป';

  @override
  String get adminApiKeyCreated => 'สร้างคีย์ API แล้ว';

  @override
  String get adminApiKeyCreatedNoToken =>
      'สร้างคีย์สำเร็จแล้ว เซิร์ฟเวอร์ไม่ได้ส่งคืนโทเค็น ตรวจสอบคีย์ API ของเซิร์ฟเวอร์';

  @override
  String get adminKeyCopied => 'คัดลอกคีย์ไปยังคลิปบอร์ดแล้ว';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'ไม่สามารถสร้างรหัส: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'โทเค็นคีย์หายไปจากการตอบกลับของเซิร์ฟเวอร์';

  @override
  String get adminRevokeApiKey => 'เพิกถอนคีย์ API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'เพิกถอนรหัสสำหรับ $name?';
  }

  @override
  String get adminApiKeyRevoked => 'คีย์ API ถูกเพิกถอนแล้ว';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'ไม่สามารถเพิกถอนรหัส: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'โหลดคีย์ API ไม่สำเร็จ';

  @override
  String get adminApiKeysTitle => 'คีย์ API';

  @override
  String get adminCreateKey => 'สร้างคีย์';

  @override
  String get adminNoApiKeys => 'ไม่พบคีย์ API';

  @override
  String get adminUnknownApp => 'แอปที่ไม่รู้จัก';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'โทเค็น: $token\\nสร้างแล้ว: $created';
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
  String get adminCreatingBackup => 'กำลังสร้างข้อมูลสำรอง...';

  @override
  String get adminBackupCreated => 'สร้างข้อมูลสำรองเรียบร้อยแล้ว';

  @override
  String adminBackupCreateFailed(String error) {
    return 'ไม่สามารถสร้างข้อมูลสำรอง: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'เส้นทางสำรองขาดหายไปในการตอบกลับของเซิร์ฟเวอร์';

  @override
  String adminBackupManifest(String name) {
    return 'รายการ: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'ไม่สามารถโหลดรายการ: $error';
  }

  @override
  String get adminConfirmRestore => 'ยืนยันการคืนค่า';

  @override
  String get adminRestoringBackup => 'กำลังคืนค่าข้อมูลสำรอง...';

  @override
  String adminRestoreFailed(String error) {
    return 'ไม่สามารถกู้คืนข้อมูลสำรอง: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'โหลดข้อมูลสำรองไม่สำเร็จ';

  @override
  String get adminCreateBackup => 'สร้างข้อมูลสำรอง';

  @override
  String get adminNoBackups => 'ไม่พบข้อมูลสำรอง';

  @override
  String get adminViewDetails => 'ดูรายละเอียด';

  @override
  String get restore => 'คืนค่า';

  @override
  String get adminLogsLoadFailed => 'โหลดบันทึกเซิร์ฟเวอร์ไม่สำเร็จ';

  @override
  String get adminNoLogFiles => 'ไม่พบไฟล์บันทึก';

  @override
  String get adminLogCopied => 'คัดลอกบันทึกไปยังคลิปบอร์ดแล้ว';

  @override
  String get adminSaveLogFile => 'บันทึกไฟล์บันทึก';

  @override
  String adminSavedTo(String path) {
    return 'บันทึกไปที่ $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ไม่สามารถบันทึกไฟล์: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'ไม่สามารถโหลด $fileName';
  }

  @override
  String get adminSearchInLog => 'ค้นหาในบันทึก';

  @override
  String get adminNoMatchingLines => 'ไม่มีบรรทัดที่ตรงกัน';

  @override
  String adminTasksLoadFailed(String error) {
    return 'ไม่สามารถโหลดงาน: $error';
  }

  @override
  String get adminNoScheduledTasks => 'ไม่พบงานที่กำหนดเวลาไว้';

  @override
  String get adminNoTasksMatchFilter => 'ไม่มีงานที่ตรงกับตัวกรองปัจจุบัน';

  @override
  String adminTaskStartFailed(String error) {
    return 'ไม่สามารถเริ่มงาน: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'ไม่สามารถหยุดงาน: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'ไม่สามารถโหลดงาน: $error';
  }

  @override
  String get adminRunNow => 'วิ่งตอนนี้';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ไม่สามารถลบทริกเกอร์: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ไม่สามารถเพิ่มทริกเกอร์: $error';
  }

  @override
  String get adminLastExecution => 'การดำเนินการครั้งสุดท้าย';

  @override
  String get adminTriggers => 'ทริกเกอร์';

  @override
  String get adminAddTrigger => 'เพิ่มทริกเกอร์';

  @override
  String get adminNoTriggers => 'ไม่มีการกำหนดค่าทริกเกอร์';

  @override
  String get adminTriggerType => 'ประเภททริกเกอร์';

  @override
  String get adminTimeLimit => 'จำกัดเวลา (ไม่บังคับ)';

  @override
  String get adminNoLimit => 'ไม่มีขีดจำกัด';

  @override
  String adminHours(String hours) {
    return '$hours ชั่วโมง';
  }

  @override
  String get adminDayOfWeek => 'วันในสัปดาห์';

  @override
  String get adminSearchPlugins => 'ค้นหาปลั๊กอิน...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'ไม่สามารถสลับปลั๊กอิน: $error';
  }

  @override
  String get adminUninstallPlugin => 'ถอนการติดตั้งปลั๊กอิน';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการถอนการติดตั้ง \"$name\"';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'ไม่สามารถถอนการติดตั้งปลั๊กอิน: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'ไม่สามารถติดตั้งแพ็คเกจ: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'ไม่สามารถติดตั้งการอัปเดต: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'ไม่สามารถโหลดปลั๊กอิน: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'ไม่มีปลั๊กอินที่ตรงกับการค้นหาของคุณ';

  @override
  String get adminNoPluginsInstalled => 'ไม่มีการติดตั้งปลั๊กอิน';

  @override
  String adminInstallUpdate(String version) {
    return 'ติดตั้งการอัปเดต (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'ไม่สามารถโหลดแคตตาล็อก: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'ไม่มีแพ็คเกจที่ตรงกับการค้นหาของคุณ';

  @override
  String get adminNoPackagesAvailable => 'ไม่มีแพ็คเกจให้เลือก';

  @override
  String get adminExperimentalIntegration => 'บูรณาการการทดลอง';

  @override
  String get adminExperimentalWarning =>
      'การรวมการตั้งค่าปลั๊กอินยังอยู่ในช่วงทดลอง หน้าการตั้งค่าบางหน้าอาจแสดงผลไม่ถูกต้อง';

  @override
  String get continueAction => 'ดำเนินการต่อ';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" จะถูกลบออกหลังจากรีสตาร์ทเซิร์ฟเวอร์';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'ไม่สามารถถอนการติดตั้ง: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'กำลังอัปเดต \"$name\" เป็น v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'ไม่สามารถเปิดการตั้งค่าได้: ไม่มีโทเค็นการตรวจสอบสิทธิ์';

  @override
  String adminPluginLoadFailed(String error) {
    return 'ไม่สามารถโหลดปลั๊กอิน: $error';
  }

  @override
  String get adminPluginNotFound => 'ไม่พบปลั๊กอิน';

  @override
  String adminPluginVersion(String version) {
    return 'เวอร์ชัน $version';
  }

  @override
  String get adminEnablePlugin => 'เปิดใช้งานปลั๊กอิน';

  @override
  String get adminPluginSettingsPage => 'หน้าการตั้งค่าปลั๊กอิน';

  @override
  String get adminRevisionHistory => 'ประวัติการแก้ไข';

  @override
  String get adminNoChangelog => 'ไม่มีบันทึกการเปลี่ยนแปลง';

  @override
  String get adminRemoveRepository => 'ลบพื้นที่เก็บข้อมูล';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ \"$name\"';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'ไม่สามารถบันทึกที่เก็บข้อมูล: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'ไม่สามารถโหลดที่เก็บข้อมูล: $error';
  }

  @override
  String get adminRepositoryNameHint => 'เช่น Jellyfin มีเสถียรภาพ';

  @override
  String get adminRepositoryUrl => 'URL ที่เก็บ';

  @override
  String get adminAddEntry => 'เพิ่มรายการ';

  @override
  String get adminInvalidUrl => 'URL ไม่ถูกต้อง';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'ไม่สามารถโหลดการตั้งค่าปลั๊กอิน: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'ไม่สามารถเปิด $uri';
  }

  @override
  String get adminOpenInBrowser => 'เปิดในเบราว์เซอร์';

  @override
  String get adminOpenExternally => 'เปิดจากภายนอก';

  @override
  String get adminGeneralSettings => 'การตั้งค่าทั่วไป';

  @override
  String get adminServerName => 'ชื่อเซิร์ฟเวอร์';

  @override
  String get adminPreferredMetadataCountry => 'ประเทศข้อมูลเมตาที่ต้องการ';

  @override
  String get adminCachePath => 'เส้นทางแคช';

  @override
  String get adminMetadataPath => 'เส้นทางข้อมูลเมตา';

  @override
  String get adminLibraryScanConcurrency => 'การสแกนห้องสมุดพร้อมกัน';

  @override
  String get adminParallelImageEncodingLimit =>
      'ขีดจำกัดการเข้ารหัสรูปภาพแบบขนาน';

  @override
  String get adminSlowResponseThreshold => 'เกณฑ์การตอบสนองช้า (มิลลิวินาที)';

  @override
  String get adminBrandingSaved => 'บันทึกการตั้งค่าการสร้างแบรนด์แล้ว';

  @override
  String get adminBrandingLoadFailed => 'โหลดการตั้งค่าการสร้างแบรนด์ไม่สำเร็จ';

  @override
  String get adminLoginDisclaimer => 'ข้อจำกัดความรับผิดชอบในการเข้าสู่ระบบ';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML ที่แสดงด้านล่างแบบฟอร์มเข้าสู่ระบบ';

  @override
  String get adminCustomCss => 'CSS ที่กำหนดเอง';

  @override
  String get adminCustomCssHint => 'CSS แบบกำหนดเองนำไปใช้กับเว็บอินเตอร์เฟส';

  @override
  String get adminEnableSplashScreen => 'เปิดใช้งานหน้าจอเริ่มต้น';

  @override
  String get adminStreamingSaved => 'บันทึกการตั้งค่าการสตรีมแล้ว';

  @override
  String get adminStreamingLoadFailed => 'โหลดการตั้งค่าการสตรีมไม่สำเร็จ';

  @override
  String get adminStreamingDescription =>
      'ตั้งค่าขีดจำกัดบิตเรตการสตรีมทั่วโลกสำหรับการเชื่อมต่อระยะไกล';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'ขีดจำกัดบิตเรตไคลเอ็นต์ระยะไกล (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'เว้นว่างไว้หรือ 0 แทนไม่จำกัด';

  @override
  String get adminPlaybackSaved => 'บันทึกการตั้งค่าการเล่นแล้ว';

  @override
  String get adminPlaybackLoadFailed => 'โหลดการตั้งค่าการเล่นไม่สำเร็จ';

  @override
  String get adminPlaybackTranscoding => 'การเล่น / การแปลงรหัส';

  @override
  String get adminHardwareAcceleration => 'การเร่งความเร็วด้วยฮาร์ดแวร์';

  @override
  String get adminVaapiDevice => 'อุปกรณ์ VA-API';

  @override
  String get adminEnableHardwareEncoding => 'เปิดใช้งานการเข้ารหัสฮาร์ดแวร์';

  @override
  String get adminEnableHardwareDecoding =>
      'เปิดใช้งานการถอดรหัสฮาร์ดแวร์สำหรับ:';

  @override
  String get adminEncodingThreads => 'การเข้ารหัสเธรด';

  @override
  String get adminAutomatic => '0 = อัตโนมัติ';

  @override
  String get adminTranscodingTempPath => 'เส้นทางการแปลงรหัสชั่วคราว';

  @override
  String get adminEnableFallbackFont => 'เปิดใช้งานแบบอักษรทางเลือก';

  @override
  String get adminFallbackFontPath => 'เส้นทางแบบอักษรทางเลือก';

  @override
  String get adminAllowSegmentDeletion => 'อนุญาตให้ลบส่วน';

  @override
  String get adminSegmentKeepSeconds => 'แบ่งกลุ่ม (วินาที)';

  @override
  String get adminThrottleBuffering => 'การบัฟเฟอร์คันเร่ง';

  @override
  String get adminTrickplaySaved => 'บันทึกการตั้งค่า Trickplay แล้ว';

  @override
  String get adminTrickplayLoadFailed => 'ไม่สามารถโหลดการตั้งค่าการเล่นกล';

  @override
  String get adminEnableHardwareAcceleration =>
      'เปิดใช้งานการเร่งด้วยฮาร์ดแวร์';

  @override
  String get adminEnableKeyFrameExtraction =>
      'เปิดใช้งานการแยกคีย์เฟรมเท่านั้น';

  @override
  String get adminKeyFrameSubtitle => 'เร็วกว่าแต่ความแม่นยำต่ำกว่า';

  @override
  String get adminScanBehavior => 'ลักษณะการสแกน';

  @override
  String get adminProcessPriority => 'ลำดับความสำคัญของกระบวนการ';

  @override
  String get adminImageSettings => 'การตั้งค่าภาพ';

  @override
  String get adminIntervalMs => 'ช่วงเวลา (มิลลิวินาที)';

  @override
  String get adminCaptureFrameSubtitle => 'ความถี่ในการจับภาพเฟรม';

  @override
  String get adminWidthResolutions => 'ความละเอียดความกว้าง';

  @override
  String get adminTileWidth => 'ความกว้างของกระเบื้อง';

  @override
  String get adminTileHeight => 'ความสูงของกระเบื้อง';

  @override
  String get adminQualitySubtitle =>
      'ค่าที่ต่ำกว่า = คุณภาพที่ดีขึ้น ไฟล์ที่ใหญ่ขึ้น';

  @override
  String get adminProcessThreads => 'ประมวลผลเธรด';

  @override
  String get adminResumeSaved => 'บันทึกการตั้งค่าต่อแล้ว';

  @override
  String get adminResumeLoadFailed => 'โหลดการตั้งค่าประวัติต่อไม่สำเร็จ';

  @override
  String get adminResumeDescription =>
      'กำหนดค่าเมื่อควรทำเครื่องหมายเนื้อหาว่าเล่นบางส่วนหรือเล่นทั้งหมด';

  @override
  String get adminMinResumePercentage => 'เปอร์เซ็นต์เรซูเม่ขั้นต่ำ';

  @override
  String get adminMinResumeSubtitle =>
      'เนื้อหาจะต้องเล่นเกินเปอร์เซ็นต์นี้เพื่อบันทึกความคืบหน้า';

  @override
  String get adminMaxResumePercentage => 'เปอร์เซ็นต์เรซูเม่สูงสุด';

  @override
  String get adminMaxResumeSubtitle =>
      'เนื้อหาจะถือว่าเล่นได้เต็มที่หลังจากเปอร์เซ็นต์นี้';

  @override
  String get adminMinResumeDuration => 'ระยะเวลาเรซูเม่ขั้นต่ำ (วินาที)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'รายการที่สั้นกว่านี้ไม่สามารถดำเนินการต่อได้';

  @override
  String get adminMinAudiobookResume =>
      'เปอร์เซ็นต์ประวัติย่อขั้นต่ำของหนังสือเสียง';

  @override
  String get adminMaxAudiobookResume =>
      'เปอร์เซ็นต์ประวัติย่อสูงสุดของหนังสือเสียง';

  @override
  String get adminNetworkingSaved =>
      'บันทึกการตั้งค่าเครือข่ายแล้ว อาจจำเป็นต้องรีสตาร์ทเซิร์ฟเวอร์';

  @override
  String get adminNetworkingLoadFailed => 'โหลดการตั้งค่าเครือข่ายไม่สำเร็จ';

  @override
  String get adminNetworkingWarning =>
      'การเปลี่ยนแปลงการตั้งค่าเครือข่ายอาจต้องรีสตาร์ทเซิร์ฟเวอร์';

  @override
  String get adminEnableRemoteAccess => 'เปิดใช้งานการเข้าถึงระยะไกล';

  @override
  String get ports => 'พอร์ต';

  @override
  String get adminHttpPort => 'พอร์ต HTTP';

  @override
  String get adminHttpsPort => 'พอร์ต HTTPS';

  @override
  String get adminPublicHttpsPort => 'พอร์ต HTTPS สาธารณะ';

  @override
  String get adminBaseUrl => 'URL ฐาน';

  @override
  String get adminBaseUrlHint => 'เช่น /เจลลี่ฟิน';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'เปิดใช้งาน HTTPS';

  @override
  String get adminLocalNetwork => 'เครือข่ายท้องถิ่น';

  @override
  String get adminLocalNetworkAddresses => 'ที่อยู่เครือข่ายท้องถิ่น';

  @override
  String get adminKnownProxies => 'ผู้รับมอบฉันทะที่รู้จัก';

  @override
  String get adminRemoteIpFilter => 'ตัวกรอง IP ระยะไกล';

  @override
  String get adminRemoteIpFilterEntries => 'ตัวกรอง IP ระยะไกล';

  @override
  String get adminCertificatePath => 'เส้นทางใบรับรอง';

  @override
  String get whitelist => 'ไวท์ลิสต์';

  @override
  String get blacklist => 'บัญชีดำ';

  @override
  String get notSet => 'ไม่ได้ตั้งค่า';

  @override
  String get adminMetadataSaved => 'บันทึกข้อมูลเมตาแล้ว';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'ไม่สามารถโหลดข้อมูลเมตา: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'ไม่สามารถบันทึกข้อมูลเมตา: $error';
  }

  @override
  String get adminRefreshMetadata => 'รีเฟรชข้อมูลเมตา';

  @override
  String get recursive => 'ซ้ำ';

  @override
  String get adminReplaceAllMetadata => 'แทนที่ข้อมูลเมตาทั้งหมด';

  @override
  String get adminReplaceAllImages => 'แทนที่รูปภาพทั้งหมด';

  @override
  String get adminMetadataRefreshRequested => 'ร้องขอการรีเฟรชข้อมูลเมตา';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'ไม่สามารถรีเฟรชข้อมูลเมตา: $error';
  }

  @override
  String get adminNoRemoteMatches => 'ไม่พบการแข่งขันระยะไกล';

  @override
  String get adminRemoteResults => 'ผลลัพธ์ระยะไกล';

  @override
  String get adminRemoteMetadataApplied => 'ใช้ข้อมูลเมตาระยะไกลแล้ว';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'การค้นหาระยะไกลล้มเหลว: $error';
  }

  @override
  String get adminUpdateContentType => 'อัปเดตประเภทเนื้อหา';

  @override
  String get adminContentType => 'ประเภทเนื้อหา';

  @override
  String get adminContentTypeUpdated => 'อัปเดตประเภทเนื้อหาแล้ว';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'ไม่สามารถอัปเดตประเภทเนื้อหา: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'โหลดตัวแก้ไขข้อมูลเมตาไม่สำเร็จ';

  @override
  String get adminNoPeopleEntries => 'ไม่มีรายการบุคคล';

  @override
  String get adminNoExternalIds => 'ไม่มีรหัสภายนอก';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType อัปเดตรูปภาพแล้ว';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'ไม่สามารถดาวน์โหลดภาพ: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'รูปแบบภาพที่ไม่รองรับ';

  @override
  String get adminImageReadFailed => 'ไม่สามารถอ่านรูปภาพที่เลือก';

  @override
  String adminImageUploaded(String imageType) {
    return 'อัปโหลดรูปภาพ $imageType แล้ว';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'ไม่สามารถอัปโหลดภาพ: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'ลบรูปภาพ $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'ลบรูปภาพ $imageType แล้ว';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String get adminAllProviders => 'ผู้ให้บริการทั้งหมด';

  @override
  String get adminNoRemoteImages => 'ไม่พบภาพระยะไกล';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'การค้นพบจูนเนอร์ล้มเหลว: $error';
  }

  @override
  String get adminAddTuner => 'เพิ่มจูนเนอร์';

  @override
  String get adminTunerType => 'ประเภทจูนเนอร์';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, อื่นๆ';

  @override
  String get adminUrlPath => 'URL / เส้นทาง';

  @override
  String get adminNameOptional => 'ชื่อ (ไม่บังคับ)';

  @override
  String get adminTunerAdded => 'เพิ่มจูนเนอร์แล้ว';

  @override
  String adminTunerAddFailed(String error) {
    return 'ไม่สามารถเพิ่มจูนเนอร์: $error';
  }

  @override
  String get adminAddGuideProvider => 'เพิ่มผู้ให้บริการไกด์';

  @override
  String get adminProviderType => 'ประเภทผู้ให้บริการ';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect หรือ XMLTV';

  @override
  String get adminUsernameOptional => 'ชื่อผู้ใช้ (ไม่บังคับ)';

  @override
  String get adminRefreshInterval => 'ช่วงเวลารีเฟรช (ชั่วโมง)';

  @override
  String get adminProviderAdded => 'เพิ่มผู้ให้บริการแล้ว';

  @override
  String adminProviderAddFailed(String error) {
    return 'ไม่สามารถเพิ่มผู้ให้บริการ: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'ไม่สามารถลบจูนเนอร์: $error';
  }

  @override
  String get adminTunerResetRequested => 'ร้องขอการรีเซ็ตจูนเนอร์';

  @override
  String adminTunerResetFailed(String error) {
    return 'ไม่สามารถรีเซ็ตเครื่องรับสัญญาณ: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'ไม่สามารถลบผู้ให้บริการ: $error';
  }

  @override
  String get adminRecordingSettings => 'การตั้งค่าการบันทึก';

  @override
  String get adminPrePadding => 'การเติมล่วงหน้า (นาที)';

  @override
  String get adminPostPadding => 'โพสต์เติม (นาที)';

  @override
  String get adminRecordingPath => 'เส้นทางการบันทึก';

  @override
  String get adminSeriesRecordingPath => 'เส้นทางการบันทึกซีรีส์';

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
  String get adminRecordingSettingsSaved => 'บันทึกการตั้งค่าการบันทึกแล้ว';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'ไม่สามารถบันทึกการตั้งค่า: $error';
  }

  @override
  String get adminSetChannelMappings => 'ตั้งค่าการแมปช่อง';

  @override
  String get adminMappingJson => 'การทำแผนที่ JSON';

  @override
  String get adminMappingJsonHint => 'ตัวอย่าง: การแมปเพย์โหลด JSON';

  @override
  String get adminChannelMappingsUpdated => 'อัปเดตการแมปช่องแล้ว';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'ไม่สามารถอัปเดตการแมป: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'โหลดการดูแลระบบรายการสดทางทีวีไม่สำเร็จ';

  @override
  String get adminTunerDevices => 'อุปกรณ์จูนเนอร์';

  @override
  String get adminNoTunerHosts => 'ไม่มีโฮสต์จูนเนอร์ที่กำหนดค่าไว้';

  @override
  String get adminGuideProviders => 'ผู้ให้บริการคู่มือ';

  @override
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'เพิ่มผู้ให้บริการ';

  @override
  String get adminNoListingProviders =>
      'ไม่มีผู้ให้บริการรายชื่อที่กำหนดค่าไว้';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'เส้นทางการบันทึก: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'เส้นทางซีรีส์: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'การเติมล่วงหน้า: $minutes นาที';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'การเติมโพสต์: $minutes นาที';
  }

  @override
  String get adminTunerDiscovery => 'การค้นพบจูนเนอร์';

  @override
  String get adminChannelMappings => 'การแมปช่อง';

  @override
  String get adminNoDiscoveredTuners => 'ยังไม่มีเครื่องรับที่ค้นพบ';

  @override
  String get adminSettingsSaved => 'บันทึกการตั้งค่าแล้ว';

  @override
  String get adminBackupsNotAvailable =>
      'ไม่มีการสำรองข้อมูลบนเซิร์ฟเวอร์รุ่นนี้';

  @override
  String get adminRestoreWarning1 =>
      'การกู้คืนจะแทนที่ข้อมูลเซิร์ฟเวอร์ปัจจุบันทั้งหมดด้วยข้อมูลที่สำรองไว้';

  @override
  String get adminRestoreWarning2 =>
      'การตั้งค่าเซิร์ฟเวอร์ ผู้ใช้ และข้อมูลไลบรารีปัจจุบันจะถูกเขียนทับ';

  @override
  String get adminRestoreWarning3 => 'เซิร์ฟเวอร์จะรีสตาร์ทหลังจากการคืนค่า';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'กู้คืนข้อมูลสำรอง $name ทันทีหรือไม่';
  }

  @override
  String get adminRestoreRequested =>
      'ร้องขอการคืนค่า การรีสตาร์ทเซิร์ฟเวอร์อาจยกเลิกการเชื่อมต่อเซสชันนี้';

  @override
  String get adminBackupsTitle => 'การสำรองข้อมูล';

  @override
  String get adminUnknownDate => 'ไม่ทราบวันที่';

  @override
  String get adminUnnamedBackup => 'ข้อมูลสำรองที่ไม่มีชื่อ';

  @override
  String get adminLiveTvNotAvailable =>
      'การดูแลระบบถ่ายทอดสดทางโทรทัศน์ไม่พร้อมใช้งานบนเซิร์ฟเวอร์รุ่นนี้';

  @override
  String get adminLiveTvTitle => 'การบริหารรายการถ่ายทอดสดทางโทรทัศน์';

  @override
  String get adminApply => 'นำมาใช้';

  @override
  String get adminNotSet => 'ไม่ได้ตั้งค่า';

  @override
  String get adminReset => 'รีเซ็ต';

  @override
  String get adminLogsTitle => 'บันทึกเซิร์ฟเวอร์';

  @override
  String get adminLogsNewestFirst => 'ใหม่ล่าสุดก่อน';

  @override
  String get adminLogsOldestFirst => 'เก่าแก่ที่สุดก่อน';

  @override
  String get adminLogsJustNow => 'แค่ตอนนี้';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m ที่แล้ว';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h ที่แล้ว';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d ที่แล้ว';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'ไม่สามารถโหลด $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return 'การแข่งขัน $count';
  }

  @override
  String get adminLogViewerNoMatches => 'ไม่มีบรรทัดที่ตรงกัน';

  @override
  String get adminMetadataEditorTitle => 'ตัวแก้ไขข้อมูลเมตา';

  @override
  String get adminMetadataIdentify => 'Identify';

  @override
  String get adminMetadataType => 'พิมพ์';

  @override
  String get adminMetadataDetails => 'รายละเอียด';

  @override
  String get adminMetadataExternalIds => 'รหัสภายนอก';

  @override
  String get adminMetadataImages => 'รูปภาพ';

  @override
  String get adminMetadataFieldTitle => 'ชื่อ';

  @override
  String get adminMetadataFieldSortTitle => 'เรียงลำดับชื่อเรื่อง';

  @override
  String get adminMetadataFieldOriginalTitle => 'ชื่อเดิม';

  @override
  String get adminMetadataFieldPremiereDate => 'วันที่เข้าฉาย (ปปปป-ดด-วว)';

  @override
  String get adminMetadataFieldEndDate => 'วันที่สิ้นสุด (ปปปป-ดด-วว)';

  @override
  String get adminMetadataFieldProductionYear => 'ปีที่ผลิต';

  @override
  String get adminMetadataFieldOfficialRating => 'การจัดอันดับอย่างเป็นทางการ';

  @override
  String get adminMetadataFieldCommunityRating => 'การให้คะแนนโดยชุมชน';

  @override
  String get adminMetadataFieldCriticRating => 'การให้คะแนนนักวิจารณ์';

  @override
  String get adminMetadataFieldTagline => 'สโลแกน';

  @override
  String get adminMetadataFieldOverview => 'ภาพรวม';

  @override
  String get adminMetadataGenres => 'ประเภท';

  @override
  String get adminMetadataTags => 'แท็ก';

  @override
  String get adminMetadataStudios => 'สตูดิโอ';

  @override
  String get adminMetadataPeople => 'ประชากร';

  @override
  String get adminMetadataAddGenre => 'เพิ่มประเภท';

  @override
  String get adminMetadataAddTag => 'เพิ่มแท็ก';

  @override
  String get adminMetadataAddStudio => 'เพิ่มสตูดิโอ';

  @override
  String get adminMetadataAddPerson => 'เพิ่มบุคคล';

  @override
  String get adminMetadataEditPerson => 'แก้ไขบุคคล';

  @override
  String get adminMetadataRole => 'บทบาท';

  @override
  String get adminMetadataImagePrimary => 'หลัก';

  @override
  String get adminMetadataImageBackdrop => 'ฉากหลัง';

  @override
  String get adminMetadataImageLogo => 'โลโก้';

  @override
  String get adminMetadataImageBanner => 'แบนเนอร์';

  @override
  String get adminMetadataImageThumb => 'นิ้วหัวแม่มือ';

  @override
  String get adminMetadataRecursive => 'ซ้ำ';

  @override
  String get adminMetadataProvider => 'ผู้ให้บริการ';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType อัปเดตรูปภาพแล้ว';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'อัปโหลดรูปภาพ $imageType แล้ว';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'ลบรูปภาพ $imageType แล้ว';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'ไม่สามารถดาวน์โหลดภาพ: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'ไม่สามารถอ่านรูปภาพที่เลือก';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'ไม่สามารถอัปโหลดภาพ: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'ลบรูปภาพ $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'วิธีนี้จะลบรูปภาพปัจจุบันออกจากรายการ';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'ไม่สามารถลบภาพ: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'เลือกรูปภาพ $imageType';
  }

  @override
  String get adminMetadataUpload => 'อัปโหลด';

  @override
  String get adminMetadataUpdate => 'อัปเดต';

  @override
  String get adminMetadataRemoteImage => 'ภาพระยะไกล';

  @override
  String get adminPluginsInstalled => 'ติดตั้งแล้ว';

  @override
  String get adminPluginsCatalog => 'แคตตาล็อก';

  @override
  String get adminPluginsActive => 'คล่องแคล่ว';

  @override
  String get adminPluginsRestart => 'รีสตาร์ท';

  @override
  String get adminPluginsNoSearchResults =>
      'ไม่มีปลั๊กอินที่ตรงกับการค้นหาของคุณ';

  @override
  String get adminPluginsNoneInstalled => 'ไม่มีการติดตั้งปลั๊กอิน';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'มีการอัปเดต: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'อัปเดตพร้อมใช้งาน';

  @override
  String get adminPluginsPendingRemoval => 'รอการลบออกหลังจากรีสตาร์ท';

  @override
  String get adminPluginsChangesPending => 'การเปลี่ยนแปลงที่รอการรีสตาร์ท';

  @override
  String get adminPluginsEnable => 'เปิดใช้งาน';

  @override
  String get adminPluginsDisable => 'ปิดการใช้งาน';

  @override
  String get adminPluginsInstallUpdate => 'ติดตั้งการอัปเดต';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'ติดตั้งการอัปเดต (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'ไม่มีแพ็คเกจที่ตรงกับการค้นหาของคุณ';

  @override
  String get adminPluginsCatalogEmpty => 'ไม่มีแพ็คเกจให้เลือก';

  @override
  String adminPluginsInstalling(String name) {
    return 'กำลังติดตั้ง \"$name\"...';
  }

  @override
  String get adminPluginDetailExperimental => 'บูรณาการการทดลอง';

  @override
  String get adminPluginDetailExperimentalContent =>
      'การรวมการตั้งค่าปลั๊กอินยังอยู่ในช่วงทดลอง บางช่องหรือเค้าโครงอาจแสดงผลไม่ถูกต้อง';

  @override
  String get adminPluginDetailToggle404 =>
      'ไม่สามารถสลับปลั๊กอินได้ เซิร์ฟเวอร์ไม่พบเวอร์ชันปลั๊กอินนี้ ลองรีเฟรชปลั๊กอินแล้วลองอีกครั้ง';

  @override
  String get adminPluginDetailToggleDioError =>
      'ไม่สามารถสลับปลั๊กอินได้ โปรดตรวจสอบบันทึกเซิร์ฟเวอร์เพื่อดูรายละเอียด';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name การตั้งค่า';
  }

  @override
  String get adminPluginDetailDetails => 'รายละเอียด';

  @override
  String get adminPluginDetailDeveloper => 'นักพัฒนา';

  @override
  String get adminPluginDetailRepository => 'พื้นที่เก็บข้อมูล';

  @override
  String get adminPluginDetailBundled => 'มัดรวม';

  @override
  String get adminPluginDetailEnablePlugin => 'เปิดใช้งานปลั๊กอิน';

  @override
  String get adminPluginDetailRestartRequired =>
      'จำเป็นต้องรีสตาร์ทเซิร์ฟเวอร์เพื่อให้การเปลี่ยนแปลงมีผล';

  @override
  String get adminPluginDetailRemovalPending =>
      'ปลั๊กอินนี้จะถูกลบออกหลังจากรีสตาร์ทเซิร์ฟเวอร์';

  @override
  String get adminPluginDetailMalfunctioned =>
      'ปลั๊กอินนี้ทำงานผิดปกติและอาจทำงานไม่ถูกต้อง';

  @override
  String get adminPluginDetailNotSupported =>
      'ปลั๊กอินนี้ไม่รองรับเซิร์ฟเวอร์เวอร์ชันปัจจุบัน';

  @override
  String get adminPluginDetailSuperseded =>
      'ปลั๊กอินนี้ถูกแทนที่ด้วยเวอร์ชันที่ใหม่กว่า';

  @override
  String adminReposLoadFailed(String error) {
    return 'ไม่สามารถโหลดที่เก็บข้อมูล: $error';
  }

  @override
  String get adminReposRemoveTitle => 'ลบพื้นที่เก็บข้อมูล';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ \"$name\"';
  }

  @override
  String get adminReposRemove => 'ลบ';

  @override
  String adminReposSaveFailed(String error) {
    return 'ไม่สามารถบันทึกที่เก็บข้อมูล: $error';
  }

  @override
  String get adminReposEmpty => 'ไม่มีการกำหนดค่าที่เก็บ';

  @override
  String get adminReposEmptySubtitle =>
      'เพิ่มพื้นที่เก็บข้อมูลเพื่อเรียกดูปลั๊กอินที่มีอยู่';

  @override
  String get adminReposUnnamed => '(ไม่มีชื่อ)';

  @override
  String get adminReposEditTitle => 'แก้ไขพื้นที่เก็บข้อมูล';

  @override
  String get adminReposAddTitle => 'เพิ่มพื้นที่เก็บข้อมูล';

  @override
  String get adminReposUrl => 'URL ที่เก็บ';

  @override
  String get adminReposNameHint => 'เช่น Jellyfin มีเสถียรภาพ';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL ไม่ถูกต้อง';

  @override
  String get adminGeneralSettingsTitle => 'การตั้งค่าทั่วไป';

  @override
  String get adminGeneralMetadataLanguage => 'ภาษาเมทาดาทาที่ต้องการ';

  @override
  String get adminGeneralMetadataLanguageHint => 'เช่น en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'ประเทศข้อมูลเมตาที่ต้องการ';

  @override
  String get adminGeneralMetadataCountryHint =>
      'เช่น สหรัฐอเมริกา เยอรมนี ฝรั่งเศส';

  @override
  String get adminGeneralLibraryScanConcurrency => 'การสแกนห้องสมุดพร้อมกัน';

  @override
  String get adminGeneralImageEncodingLimit =>
      'ขีดจำกัดการเข้ารหัสรูปภาพแบบขนาน';

  @override
  String get adminUnknownError => 'ข้อผิดพลาดที่ไม่รู้จัก';

  @override
  String get adminBrowse => 'เรียกดู';

  @override
  String get adminCloseBrowser => 'ปิดเบราว์เซอร์';

  @override
  String get adminNetworkingTitle => 'เครือข่าย';

  @override
  String get adminNetworkingRestartWarning =>
      'การเปลี่ยนแปลงการตั้งค่าเครือข่ายอาจต้องรีสตาร์ทเซิร์ฟเวอร์';

  @override
  String get adminNetworkingRemoteAccess => 'เปิดใช้งานการเข้าถึงระยะไกล';

  @override
  String get adminNetworkingPorts => 'พอร์ต';

  @override
  String get adminNetworkingHttpPort => 'พอร์ต HTTP';

  @override
  String get adminNetworkingHttpsPort => 'พอร์ต HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'เปิดใช้งาน HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'เครือข่ายท้องถิ่น';

  @override
  String get adminNetworkingLocalAddresses => 'ที่อยู่เครือข่ายท้องถิ่น';

  @override
  String get adminNetworkingAddressHint => 'เช่น 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'ผู้รับมอบฉันทะที่รู้จัก';

  @override
  String get adminNetworkingProxyHint => 'เช่น 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'ไวท์ลิสต์';

  @override
  String get adminNetworkingBlacklist => 'บัญชีดำ';

  @override
  String get adminNetworkingAddEntry => 'เพิ่มรายการ';

  @override
  String get adminBrandingTitle => 'การสร้างแบรนด์';

  @override
  String get adminBrandingLoginDisclaimer =>
      'ข้อจำกัดความรับผิดชอบในการเข้าสู่ระบบ';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML ที่แสดงด้านล่างแบบฟอร์มเข้าสู่ระบบ';

  @override
  String get adminBrandingCustomCss => 'CSS ที่กำหนดเอง';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS แบบกำหนดเองนำไปใช้กับเว็บอินเตอร์เฟส';

  @override
  String get adminBrandingEnableSplash => 'เปิดใช้งานหน้าจอเริ่มต้น';

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
  String get adminPlaybackHwAccel => 'การเร่งความเร็วด้วยฮาร์ดแวร์';

  @override
  String get adminPlaybackHwAccelLabel => 'การเร่งความเร็วด้วยฮาร์ดแวร์';

  @override
  String get adminPlaybackEnableHwEncoding => 'เปิดใช้งานการเข้ารหัสฮาร์ดแวร์';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'เปิดใช้งานการถอดรหัสฮาร์ดแวร์สำหรับ:';

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
  String get adminPlaybackEncoding => 'การเข้ารหัส';

  @override
  String get adminPlaybackEncodingThreads => 'การเข้ารหัสเธรด';

  @override
  String get adminPlaybackFallbackFont => 'เปิดใช้งานแบบอักษรทางเลือก';

  @override
  String get adminPlaybackFallbackFontPath => 'เส้นทางแบบอักษรทางเลือก';

  @override
  String get adminPlaybackStreaming => 'สตรีมมิ่ง';

  @override
  String get adminResumeVideo => 'วีดีโอ';

  @override
  String get adminResumeAudiobooks => 'หนังสือเสียง';

  @override
  String get adminResumeMinAudiobookPct =>
      'เปอร์เซ็นต์ประวัติย่อขั้นต่ำของหนังสือเสียง';

  @override
  String get adminResumeMaxAudiobookPct =>
      'เปอร์เซ็นต์ประวัติย่อสูงสุดของหนังสือเสียง';

  @override
  String get adminStreamingBitrateLimit =>
      'ขีดจำกัดบิตเรตไคลเอ็นต์ระยะไกล (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'เว้นว่างไว้หรือ 0 แทนไม่จำกัด';

  @override
  String get adminTrickplayHwAccel => 'เปิดใช้งานการเร่งด้วยฮาร์ดแวร์';

  @override
  String get adminTrickplayHwEncoding => 'เปิดใช้งานการเข้ารหัสฮาร์ดแวร์';

  @override
  String get adminTrickplayKeyFrameOnly => 'เปิดใช้งานการแยกคีย์เฟรมเท่านั้น';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'เร็วกว่าแต่ความแม่นยำต่ำกว่า';

  @override
  String get adminTrickplayNonBlocking => 'ไม่ปิดกั้น';

  @override
  String get adminTrickplayBlocking => 'การปิดกั้น';

  @override
  String get adminTrickplayPriorityHigh => 'สูง';

  @override
  String get adminTrickplayPriorityAboveNormal => 'สูงกว่าปกติ';

  @override
  String get adminTrickplayPriorityNormal => 'ปกติ';

  @override
  String get adminTrickplayPriorityBelowNormal => 'ต่ำกว่าปกติ';

  @override
  String get adminTrickplayPriorityIdle => 'ไม่ได้ใช้งาน';

  @override
  String get adminTrickplayImageSettings => 'การตั้งค่าภาพ';

  @override
  String get adminTrickplayInterval => 'ช่วงเวลา (มิลลิวินาที)';

  @override
  String get adminTrickplayIntervalSubtitle => 'ความถี่ในการจับภาพเฟรม';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'ความกว้างพิกเซลที่คั่นด้วยเครื่องหมายจุลภาค (เช่น 320)';

  @override
  String get adminTrickplayQuality => 'คุณภาพ';

  @override
  String get adminTrickplayQScale => 'ระดับคุณภาพ';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'ค่าที่ต่ำกว่า = คุณภาพที่ดีขึ้น ไฟล์ที่ใหญ่ขึ้น';

  @override
  String get adminTrickplayJpegQuality => 'คุณภาพ JPEG';

  @override
  String get adminTrickplayProcessing => 'กำลังประมวลผล';

  @override
  String get adminTasksEmpty => 'ไม่พบงานที่กำหนดเวลาไว้';

  @override
  String get adminTasksNoFilterMatch => 'ไม่มีงานที่ตรงกับตัวกรองปัจจุบัน';

  @override
  String get adminTaskCancelling => 'กำลังยกเลิก...';

  @override
  String get adminTaskRunning => 'วิ่ง...';

  @override
  String get adminTaskNeverRun => 'ไม่เคยวิ่ง';

  @override
  String get adminTaskStop => 'หยุด';

  @override
  String get adminRunningTasks => 'Running Tasks';

  @override
  String get adminTaskRun => 'วิ่ง';

  @override
  String get adminTaskDetailLastExecution => 'การดำเนินการครั้งสุดท้าย';

  @override
  String get adminTaskDetailStarted => 'เริ่ม';

  @override
  String get adminTaskDetailEnded => 'สิ้นสุดแล้ว';

  @override
  String get adminTaskDetailDuration => 'ระยะเวลา';

  @override
  String get adminTaskDetailErrorLabel => 'ข้อผิดพลาด:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'ทุกวันที่ $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'ทุก $day ที่ $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'ทุก $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'เมื่อเริ่มต้นแอปพลิเคชัน';

  @override
  String get adminTaskTriggerTypeDaily => 'รายวัน';

  @override
  String get adminTaskTriggerTypeWeekly => 'รายสัปดาห์';

  @override
  String get adminTaskTriggerTypeInterval => 'เป็นระยะๆ';

  @override
  String get adminTaskTriggerIntervalLabel => 'ช่วงเวลา';

  @override
  String get adminTaskTriggerEveryHour => 'ทุกชั่วโมง';

  @override
  String get adminTaskTriggerEvery6Hours => 'ทุก 6 ชั่วโมง';

  @override
  String get adminTaskTriggerEvery12Hours => 'ทุก ๆ 12 ชั่วโมง';

  @override
  String get adminTaskTriggerEvery24Hours => 'ทุก ๆ 24 ชั่วโมง';

  @override
  String get adminTaskTriggerEvery2Days => 'ทุก 2 วัน';

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
  String get adminTaskTriggerTime => 'เวลา';

  @override
  String get adminTaskTriggerNoLimit => 'ไม่มีขีดจำกัด';

  @override
  String get adminActivityJustNow => 'แค่ตอนนี้';

  @override
  String get adminActivityLastHour => 'ชั่วโมงสุดท้าย';

  @override
  String get adminActivityToday => 'วันนี้';

  @override
  String get adminActivityYesterday => 'เมื่อวาน';

  @override
  String get adminActivityOlder => 'แก่กว่า';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d ที่แล้ว';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h ที่แล้ว';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m ที่แล้ว';
  }

  @override
  String get adminActivityNow => 'ตอนนี้';

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
      'กำหนดค่าการสร้างภาพเล่นกลเพื่อค้นหาภาพขนาดย่อตัวอย่าง';

  @override
  String get adminNetworkingPublicHttpsPort => 'พอร์ต HTTPS สาธารณะ';

  @override
  String get adminNetworkingBaseUrl => 'URL ฐาน';

  @override
  String get adminNetworkingBaseUrlHint => 'เช่น /เจลลี่ฟิน';

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
  String get adminNetworkingCertPath => 'เส้นทางใบรับรอง';

  @override
  String get adminNetworkingRemoteIpFilter => 'ตัวกรอง IP ระยะไกล';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'ตัวกรอง IP ระยะไกล';

  @override
  String get adminPlaybackVaapiDevice => 'อุปกรณ์ VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = อัตโนมัติ';

  @override
  String get adminPlaybackTranscodeTempPath => 'เส้นทางการแปลงรหัสชั่วคราว';

  @override
  String get adminPlaybackSegmentDeletion => 'อนุญาตให้ลบส่วน';

  @override
  String get adminPlaybackSegmentKeep => 'แบ่งกลุ่ม (วินาที)';

  @override
  String get adminPlaybackThrottleBuffering => 'การบัฟเฟอร์คันเร่ง';

  @override
  String get adminResumeMinPct => 'เปอร์เซ็นต์เรซูเม่ขั้นต่ำ';

  @override
  String get adminResumeMinPctSubtitle =>
      'เนื้อหาจะต้องเล่นเกินเปอร์เซ็นต์นี้เพื่อบันทึกความคืบหน้า';

  @override
  String get adminResumeMaxPct => 'เปอร์เซ็นต์เรซูเม่สูงสุด';

  @override
  String get adminResumeMaxPctSubtitle =>
      'เนื้อหาจะถือว่าเล่นได้เต็มที่หลังจากเปอร์เซ็นต์นี้';

  @override
  String get adminResumeMinDuration => 'ระยะเวลาเรซูเม่ขั้นต่ำ (วินาที)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'รายการที่สั้นกว่านี้ไม่สามารถดำเนินการต่อได้';

  @override
  String get adminTrickplayScanBehavior => 'ลักษณะการสแกน';

  @override
  String get adminTrickplayProcessPriority => 'ลำดับความสำคัญของกระบวนการ';

  @override
  String get adminTrickplayTileWidth => 'ความกว้างของกระเบื้อง';

  @override
  String get adminTrickplayTileHeight => 'ความสูงของกระเบื้อง';

  @override
  String get adminTrickplayProcessThreads => 'ประมวลผลเธรด';

  @override
  String get adminTrickplayWidthResolutions => 'ความละเอียดความกว้าง';

  @override
  String get adminMetadataDefault => 'ค่าเริ่มต้น';

  @override
  String get adminMetadataContentTypeUpdated => 'อัปเดตประเภทเนื้อหาแล้ว';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'ไม่สามารถอัปเดตประเภทเนื้อหา: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'เกณฑ์การตอบสนองช้า (มิลลิวินาที)';

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
  String get adminGeneralCachePath => 'เส้นทางแคช';

  @override
  String get adminGeneralMetadataPath => 'เส้นทางข้อมูลเมตา';

  @override
  String get adminGeneralServerName => 'ชื่อเซิร์ฟเวอร์';

  @override
  String get adminSettingsLoadFailed => 'โหลดการตั้งค่าไม่สำเร็จ';

  @override
  String get adminDiscover => 'ค้นพบ';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'ไม่สามารถอัปเดตการแมป: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'จำกัดเวลา: $duration';
  }

  @override
  String get folders => 'โฟลเดอร์';

  @override
  String get libraries => 'ห้องสมุด';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay ปิดการใช้งาน';

  @override
  String get syncPlayDisabledMessage =>
      'เปิดใช้งาน SyncPlay ในการตั้งค่าเพื่อใช้การเล่นแบบซิงโครไนซ์';

  @override
  String get syncPlayServerUnsupportedTitle => 'เซิร์ฟเวอร์ไม่รองรับ';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay ต้องใช้เซิร์ฟเวอร์ Jellyfin เซิร์ฟเวอร์ปัจจุบันไม่รองรับ';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay กลุ่ม';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay กลุ่ม';

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
  String get syncPlayIgnoreWait => 'ละเว้นการรอ';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'อย่าระงับกลุ่มในขณะที่อุปกรณ์นี้บัฟเฟอร์';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'ดำเนินการต่อในพื้นที่โดยไม่ต้องรอสมาชิกช้า';

  @override
  String get syncPlayRepeat => 'ทำซ้ำ';

  @override
  String get syncPlayRepeatOne => 'หนึ่ง';

  @override
  String get syncPlayShuffleModeShuffled => 'สับเปลี่ยน';

  @override
  String get syncPlayShuffleModeSorted => 'จัดเรียง';

  @override
  String get syncPlaySyncCurrentQueue => 'ซิงค์คิวการเล่นปัจจุบัน';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'แทนที่คิวกลุ่มด้วยสิ่งที่กำลังเล่นอยู่ในเครื่อง';

  @override
  String get syncPlayLeaveGroup => 'ออกจากกลุ่ม';

  @override
  String get syncPlayGroupQueue => 'คิวกลุ่ม';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'รายการ $index';
  }

  @override
  String get syncPlayPlayNow => 'เล่นเลย';

  @override
  String get syncPlayCreateNewGroup => 'สร้างกลุ่มใหม่';

  @override
  String get syncPlayGroupName => 'ชื่อกลุ่ม';

  @override
  String get syncPlayDefaultGroupName => 'กลุ่ม SyncPlay ของฉัน';

  @override
  String get syncPlayCreateGroup => 'สร้างกลุ่ม';

  @override
  String get syncPlayAvailableGroups => 'กลุ่มที่มีอยู่';

  @override
  String get syncPlayNoGroupsAvailable => 'ไม่มีกลุ่มที่ใช้ได้';

  @override
  String get syncPlayJoinGroupQuestion => 'เข้าร่วมกลุ่ม SyncPlay หรือไม่';

  @override
  String get syncPlayJoinGroupWarning =>
      'การเข้าร่วมกลุ่ม SyncPlay อาจแทนที่คิวการเล่นปัจจุบันของคุณ ดำเนินการต่อ?';

  @override
  String get syncPlayJoin => 'เข้าร่วม';

  @override
  String get syncPlayStateIdle => 'ไม่ได้ใช้งาน';

  @override
  String get syncPlayStateWaiting => 'ซึ่งรอคอย';

  @override
  String get syncPlayStatePaused => 'หยุดชั่วคราว';

  @override
  String get syncPlayStatePlaying => 'กำลังเล่น';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName เข้าร่วมกลุ่ม SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName ออกจากกลุ่ม SyncPlay แล้ว';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'การเข้าถึง SyncPlay ถูกปฏิเสธ';

  @override
  String get syncPlayAccessDeniedMessage =>
      'คุณไม่มีสิทธิ์เข้าถึงหนึ่งรายการขึ้นไปในกลุ่ม SyncPlay นี้ ขอให้เจ้าของกลุ่มตรวจสอบสิทธิ์ของห้องสมุดหรือเลือกคิวอื่น';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'กำลังซิงค์การเล่นไปที่ $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'การค้นหาด้วยเสียงไม่พร้อมใช้งาน';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision การเล่นโดยตรงล้มเหลว';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'ไม่สามารถเริ่มการเล่นโดยตรงสำหรับสตรีม Dolby Vision นี้ ลองใช้การแปลงเซิร์ฟเวอร์อีกครั้งหรือไม่';

  @override
  String get retryWithTranscode => 'ลองอีกครั้งด้วยการแปลงรหัส';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision ไม่รองรับ';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'อุปกรณ์นี้ไม่สามารถถอดรหัสเนื้อหา Dolby Vision ได้โดยตรง ใช้ HDR10 ทางเลือกหรือขอการแปลงรหัสเซิร์ฟเวอร์';

  @override
  String get rememberMyChoice => 'จำตัวเลือกของฉันไว้';

  @override
  String get playHdr10Fallback => 'เล่นทางเลือก HDR10';

  @override
  String get requestTranscode => 'ขอแปลงรหัส';

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
  String get seeAll => 'ดูทั้งหมด';

  @override
  String get noItems => 'ไม่มีรายการ';

  @override
  String get switchUser => 'สลับผู้ใช้';

  @override
  String get remoteControl => 'การควบคุมระยะไกล';

  @override
  String get mediaBarLoading => 'กำลังโหลดแถบสื่อ...';

  @override
  String get mediaBarError => 'โหลดแถบสื่อไม่สำเร็จ';

  @override
  String get offlineServerUnavailable =>
      'เชื่อมต่ออินเทอร์เน็ตแล้ว แต่เซิร์ฟเวอร์ปัจจุบันไม่พร้อมใช้งาน';

  @override
  String get offlineNoInternet =>
      'คุณออฟไลน์อยู่ มีเฉพาะเนื้อหาที่ดาวน์โหลดเท่านั้น';

  @override
  String get offlineFileNotAvailable => 'ไฟล์ไม่พร้อมใช้งาน';

  @override
  String get offlineSwitchServer => 'สลับเซิร์ฟเวอร์';

  @override
  String get offlineSavedMedia => 'สื่อที่บันทึกไว้';

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
  String get castRemotePlayback => 'การเล่นระยะไกล';

  @override
  String castControlFailed(String error) {
    return 'การควบคุมการส่งล้มเหลว: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind การควบคุม';
  }

  @override
  String get castDeviceVolume => 'ระดับเสียงของอุปกรณ์';

  @override
  String get castVolumeUnavailable => 'ไม่พร้อมใช้งาน';

  @override
  String castStopKind(String kind) {
    return 'หยุด $kind';
  }

  @override
  String get audioLabel => 'เสียง';

  @override
  String get subtitlesLabel => 'คำบรรยาย';

  @override
  String get pinConfirmTitle => 'ยืนยันรหัส PIN';

  @override
  String get pinSetTitle => 'ตั้งค่า PIN';

  @override
  String get pinEnterTitle => 'ป้อนรหัส PIN';

  @override
  String get pinReenterToConfirm => 'ป้อน PIN ของคุณอีกครั้งเพื่อยืนยัน';

  @override
  String pinEnterNDigit(int length) {
    return 'ป้อน $length-PIN หลัก';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'ป้อน $length-PIN หลักของคุณ';
  }

  @override
  String get pinIncorrect => 'PIN ไม่ถูกต้อง';

  @override
  String get pinMismatch => 'PIN ไม่ตรงกัน';

  @override
  String get pinForgot => 'ลืมรหัส PIN?';

  @override
  String get pinClear => 'ชัดเจน';

  @override
  String get pinBackspace => 'แบ็คสเปซ';

  @override
  String get quickConnectAuthorized => 'อนุมัติคำขอเชื่อมต่อด่วนแล้ว';

  @override
  String get quickConnectInvalidOrExpired =>
      'รหัส Quick Connect ไม่ถูกต้องหรือหมดอายุ';

  @override
  String get quickConnectNotSupported =>
      'ไม่รองรับการเชื่อมต่อด่วนบนเซิร์ฟเวอร์นี้';

  @override
  String get quickConnectAuthorizeFailed =>
      'ไม่สามารถให้สิทธิ์รหัส Quick Connect';

  @override
  String get quickConnectDisabled =>
      'Quick Connect ถูกปิดใช้งานบนเซิร์ฟเวอร์นี้';

  @override
  String get quickConnectForbidden =>
      'บัญชีของคุณไม่สามารถอนุญาตคำขอ Quick Connect นี้';

  @override
  String get quickConnectNotFound => 'ไม่พบรหัสการเชื่อมต่อด่วน ลองรหัสใหม่';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'การเชื่อมต่อด่วนล้มเหลว: $message';
  }

  @override
  String get quickConnectEnterCode => 'ใส่รหัส';

  @override
  String get quickConnectAuthorize => 'อนุญาต';

  @override
  String remoteCommandFailed(String error) {
    return 'คำสั่งล้มเหลว: $error';
  }

  @override
  String get remoteControlTitle => 'การควบคุมระยะไกล';

  @override
  String get remoteFailedToLoadSessions => 'โหลดเซสชั่นไม่สำเร็จ';

  @override
  String get remoteNoSessions => 'ไม่มีเซสชันที่ควบคุมได้';

  @override
  String get remoteStartPlayback => 'เริ่มเล่นบนอุปกรณ์อื่น';

  @override
  String get unknownUser => 'ไม่ทราบ';

  @override
  String get unknownItem => 'ไม่ทราบ';

  @override
  String get remoteNothingPlaying => 'ไม่มีอะไรเล่นในเซสชั่นนี้';

  @override
  String get castingStarted => 'เริ่มการส่งบนอุปกรณ์ที่เลือก';

  @override
  String castingFailed(String error) {
    return 'ไม่สามารถเริ่มการส่ง: $error';
  }

  @override
  String get noRemoteDevices => 'ไม่มีอุปกรณ์การเล่นระยะไกล';

  @override
  String get noRemoteDevicesIos =>
      'ไม่มีอุปกรณ์การเล่นระยะไกล\n\nบน iOS เป้าหมาย AirPlay อาจไม่พร้อมใช้งานในโปรแกรมจำลอง';

  @override
  String get trackActionPlayNext => 'เล่นถัดไป';

  @override
  String get trackActionAddToQueue => 'เพิ่มเข้าคิว';

  @override
  String get trackActionAddToPlaylist => 'เพิ่มลงในเพลย์ลิสต์';

  @override
  String get trackActionCancelDownload => 'ยกเลิกการดาวน์โหลด';

  @override
  String get trackActionDeleteFromPlaylist => 'ลบออกจากเพลย์ลิสต์';

  @override
  String get trackActionMoveUp => 'เลื่อนขึ้น';

  @override
  String get trackActionMoveDown => 'เลื่อนลง';

  @override
  String get trackActionRemoveFromFavorites => 'ลบออกจากรายการโปรด';

  @override
  String get trackActionAddToFavorites => 'เพิ่มในรายการโปรด';

  @override
  String get trackActionGoToAlbum => 'ไปที่อัลบั้ม';

  @override
  String get trackActionGoToArtist => 'ไปที่ศิลปิน';

  @override
  String trackActionDownloading(String name) {
    return 'กำลังดาวน์โหลด $name...';
  }

  @override
  String get trackActionDeletedFile => 'ลบไฟล์ที่ดาวน์โหลดแล้ว';

  @override
  String get trackActionDeleteFileFailed => 'ไม่สามารถลบไฟล์ที่ดาวน์โหลดได้';

  @override
  String get shuffleBy => 'สับเปลี่ยนโดย';

  @override
  String get shuffleSelectLibrary => 'เลือกห้องสมุด';

  @override
  String get shuffleSelectGenre => 'เลือกประเภท';

  @override
  String get shuffleLibrary => 'ห้องสมุด';

  @override
  String get shuffleGenre => 'ประเภท';

  @override
  String get shuffleNoLibraries => 'ไม่มีไลบรารีที่เข้ากันได้';

  @override
  String get shuffleNoGenres => 'ไม่พบแนวเพลงสำหรับโหมดสุ่มนี้';

  @override
  String get posterDisplayTitle => 'แสดง';

  @override
  String get posterImageType => 'ประเภทรูปภาพ';

  @override
  String get imageTypePoster => 'โปสเตอร์';

  @override
  String get imageTypeThumbnail => 'ภาพขนาดย่อ';

  @override
  String get imageTypeBanner => 'แบนเนอร์';

  @override
  String get playlistAddFailed => 'ไม่สามารถเพิ่มลงในเพลย์ลิสต์';

  @override
  String get playlistCreateFailed => 'ไม่สามารถสร้างเพลย์ลิสต์';

  @override
  String get playlistNew => 'เพลย์ลิสต์ใหม่';

  @override
  String get playlistCreate => 'สร้าง';

  @override
  String get playlistCreateNew => 'สร้างเพลย์ลิสต์ใหม่';

  @override
  String get playlistNoneFound => 'ไม่พบเพลย์ลิสต์';

  @override
  String get addToPlaylist => 'เพิ่มลงในเพลย์ลิสต์';

  @override
  String get lyricsNotAvailable => 'ไม่มีเนื้อเพลง';

  @override
  String get upNext => 'ถัดไป';

  @override
  String get playNext => 'เล่นถัดไป';

  @override
  String get stillWatchingContent => 'การเล่นถูกหยุดชั่วคราว คุณยังดูอยู่เหรอ?';

  @override
  String get stillWatchingStop => 'หยุด';

  @override
  String get stillWatchingContinue => 'ดำเนินการต่อ';

  @override
  String skipSegment(String segment) {
    return 'ข้าม $segment';
  }

  @override
  String get liveTv => 'รายการสดทางทีวี';

  @override
  String get continueWatchingAndNextUp => 'ดูต่อ & ต่อไป';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'กำลังดาวน์โหลด $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'กำลังดาวน์โหลด $fileName';
  }

  @override
  String get nextEpisode => 'ตอนต่อไป';

  @override
  String get moreFromThisSeason => 'เพิ่มเติมจากฤดูกาลนี้';

  @override
  String get playerTooltipPlaybackSpeed => 'ความเร็วในการเล่น';

  @override
  String get playerTooltipCastControls => 'การควบคุมการส่ง';

  @override
  String get playerTooltipPlaybackQuality => 'บิตเรต';

  @override
  String get playerTooltipEnterFullscreen => 'เข้าสู่โหมดเต็มหน้าจอ';

  @override
  String get playerTooltipExitFullscreen => 'ออกจากโหมดเต็มหน้าจอ';

  @override
  String get playerTooltipFloatOnTop => 'ลอยอยู่ด้านบน';

  @override
  String get playerTooltipExitFloatOnTop => 'ปิดการใช้งานลอยอยู่ด้านบน';

  @override
  String get playerTooltipLockLandscape => 'ล็อคแนวนอน';

  @override
  String get playerTooltipUnlockOrientation => 'อนุญาตให้หมุน';

  @override
  String get playerTooltipPrevious => 'ก่อนหน้า';

  @override
  String get playerTooltipSeekBack => 'กลับไปหา';

  @override
  String get playerTooltipSeekForward => 'แสวงหาไปข้างหน้า';

  @override
  String get contextMenuMarkWatched => 'ทำเครื่องหมายว่าดูแล้ว';

  @override
  String get contextMenuMarkUnwatched => 'ทำเครื่องหมายว่ายังไม่ได้ดู';

  @override
  String get contextMenuAddToFavorites => 'เพิ่มในรายการโปรด';

  @override
  String get contextMenuRemoveFromFavorites => 'ลบออกจากรายการโปรด';

  @override
  String get contextMenuGoToSeries => 'ไปที่ซีรีส์';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'เข้าถึงแผงการดูแลระบบเซิร์ฟเวอร์';

  @override
  String get settingsAccountSecurity => 'บัญชีและความปลอดภัย';

  @override
  String get settingsAccountSecuritySubtitle =>
      'การตรวจสอบสิทธิ์ รหัส PIN และการควบคุมโดยผู้ปกครอง';

  @override
  String get settingsPersonalization => 'การปรับเปลี่ยนในแบบของคุณ';

  @override
  String get settingsPersonalizationSubtitle =>
      'ธีม การนำทาง แถวบ้าน และการเปิดเผยไลบรารี';

  @override
  String get settingsDynamicContent => 'เนื้อหาแบบไดนามิก';

  @override
  String get settingsDynamicContentSubtitle => 'แถบสื่อและการซ้อนทับภาพ';

  @override
  String get settingsPlaybackSyncplay => 'การเล่น & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'การตั้งค่าเสียง/วิดีโอ คำบรรยาย การดาวน์โหลด และการควบคุม SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'การซิงค์ปลั๊กอิน, Seerr, การให้คะแนน และอื่นๆ';

  @override
  String get settingsAboutSubtitle => 'เวอร์ชันแอป ข้อมูลทางกฎหมาย และเครดิต';

  @override
  String get settingsAuthenticationSection => 'การรับรองความถูกต้อง';

  @override
  String get settingsSortServersBy => 'จัดเรียงเซิร์ฟเวอร์ตาม';

  @override
  String get settingsLastUsed => 'ใช้ล่าสุด';

  @override
  String get settingsAlphabetical => 'ตามตัวอักษร';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'ความเป็นส่วนตัวและความปลอดภัย';

  @override
  String get settingsBlockedRatings => 'การให้คะแนนที่ถูกบล็อก';

  @override
  String get settingsGeneralStyle => 'สไตล์ทั่วไป';

  @override
  String get settingsGeneralStyleSubtitle =>
      'การเน้นเสียงของธีม ฉากหลัง สัญลักษณ์แสดงการดู และเพลงของธีม';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'หน้าแรก';

  @override
  String get settingsHomePageSubtitle =>
      'ส่วน ประเภทรูปภาพ ภาพซ้อนทับ และการแสดงตัวอย่างสื่อ';

  @override
  String get settingsLibrariesSubtitle =>
      'การมองเห็นไลบรารี มุมมองโฟลเดอร์ และลักษณะการทำงานของหลายเซิร์ฟเวอร์';

  @override
  String get settingsTwentyFourHourClock => 'นาฬิกาแบบ 24 ชั่วโมง';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'ใช้การจัดรูปแบบเวลาแบบ 24 ชั่วโมงทุกที่ที่มีนาฬิกาแสดง';

  @override
  String get settingsShowShuffleButtonInNavigation => 'แสดงปุ่มสุ่มในแถบนำทาง';

  @override
  String get settingsShowGenresButtonInNavigation => 'แสดงปุ่มประเภทในแถบนำทาง';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'แสดงปุ่มรายการโปรดในแถบนำทาง';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'แสดงปุ่มไลบรารีในแถบนำทาง';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'สลับการเปิดเผยหน้าแรกต่อห้องสมุด รีสตาร์ท Moonfin เพื่อให้การเปลี่ยนแปลงมีผล';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'แถบสื่อและการแสดงตัวอย่างในท้องถิ่น';

  @override
  String get settingsVisualOverlays => 'ภาพซ้อนทับ';

  @override
  String get settingsSeasonalSurprise => 'ความประหลาดใจตามฤดูกาล';

  @override
  String get settingsMetadataAndRatings => 'ข้อมูลเมตาและการให้คะแนน';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase ขับเคลื่อนการรวมฝั่งเซิร์ฟเวอร์ รวมถึงแหล่งที่มาของการจัดอันดับเพิ่มเติม คำขอ Seerr และการตั้งค่าที่ซิงค์';

  @override
  String get settingsOfflineDownloads => 'ดาวน์โหลดแบบออฟไลน์';

  @override
  String get settingsHigh => 'สูง';

  @override
  String get settingsLow => 'ต่ำ';

  @override
  String get settingsCustomPath => 'เส้นทางที่กำหนดเอง';

  @override
  String get settingsEnterDownloadFolderPath => 'ป้อนเส้นทางโฟลเดอร์ดาวน์โหลด';

  @override
  String get settingsConcurrentDownloads => 'ดาวน์โหลดพร้อมกัน';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'จำนวนรายการสูงสุดที่จะดาวน์โหลดในครั้งเดียว';

  @override
  String get settingsAppInfo => 'ข้อมูลแอป';

  @override
  String get settingsReportAnIssue => 'รายงานปัญหา';

  @override
  String get settingsReportAnIssueSubtitle => 'เปิดตัวติดตามปัญหาบน GitHub';

  @override
  String get settingsJoinDiscord => 'เข้าร่วม Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'พูดคุยกับชุมชน';

  @override
  String get settingsJoinTheDiscord => 'เข้าร่วม Discord';

  @override
  String get settingsSupportMoonfin => 'สนับสนุน Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'ถูกกฎหมาย';

  @override
  String get settingsLicenses => 'ใบอนุญาต';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'ประกาศเกี่ยวกับใบอนุญาตโอเพ่นซอร์ส';

  @override
  String get settingsPrivacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin จัดการข้อมูลของคุณอย่างไร';

  @override
  String get settingsCheckForUpdates => 'ตรวจสอบการอัปเดต';

  @override
  String get settingsCheckForUpdatesSubtitle => 'ตรวจสอบ Moonfin รุ่นล่าสุด';

  @override
  String get settingsPoweredByFlutter => 'ขับเคลื่อนโดยกระพือ';

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
  String get settingsBoth => 'ทั้งคู่';

  @override
  String get settingsShuffleContentTypeFilter => 'สุ่มตัวกรองประเภทเนื้อหา';

  @override
  String get settingsVideoPlaybackPreferences => 'การตั้งค่าการเล่นวิดีโอ';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'เอ็นจิ้นวิดีโอหลักและการตั้งค่าคุณภาพการสตรีม';

  @override
  String get settingsAudioPreferences => 'การตั้งค่าเสียง';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'แทร็กเสียง การประมวลผล และตัวเลือกการส่งผ่าน';

  @override
  String get settingsAutomationAndQueue => 'ระบบอัตโนมัติและคิว';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'การเล่นและการเรียงลำดับอัตโนมัติ';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'คุณภาพการดาวน์โหลด ขีดจำกัดพื้นที่เก็บข้อมูล และขนาดคิว';

  @override
  String get settingsSyncplaySubtitle => 'ตรรกะการซิงโครไนซ์สำหรับเซสชันกลุ่ม';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'คุณสมบัติผู้เล่นพิเศษ ใช้ด้วยความระมัดระวัง เนื่องจากตัวเลือกบางอย่างอาจทำให้เกิดปัญหาในการเล่นได้';

  @override
  String get settingsSkipIntrosAndOutros => 'ข้ามช่วงแนะนำและส่วนท้ายใช่ไหม';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'ผู้ใช้พร้อมท์';

  @override
  String get settingsSkip => 'ข้าม';

  @override
  String get settingsDoNothing => 'ไม่ต้องทำอะไรเลย';

  @override
  String get settingsMaxBitrateDescription =>
      'กำหนดบิตเรตการสตรีม เนื้อหาที่อยู่เหนือเกณฑ์นี้จะถูกแปลงให้เหมาะสม';

  @override
  String get settingsMaxResolutionDescription =>
      'จำกัดความละเอียดสูงสุดที่ผู้เล่นจะร้องขอ เนื้อหาที่มีความละเอียดสูงกว่าจะถูกแปลงรหัสลง';

  @override
  String get settingsPlayerZoomDescription =>
      'วิธีปรับขนาดวิดีโอให้พอดีกับหน้าจอ';

  @override
  String get settingsPlaybackEngineAndroidTv => 'กลไกการเล่น (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'เลือกกลไกการเล่นเริ่มต้นบนอุปกรณ์ Android TV การเปลี่ยนแปลงมีผลกับเซสชันการเล่นครั้งถัดไป';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (แนะนำ)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (ดั้งเดิม)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ดั้งเดิม)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (แนะนำ)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ทางเลือกสำรอง';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'ลักษณะการทำงานสำหรับชื่อ Dolby Vision บนอุปกรณ์ที่ไม่มีการถอดรหัส Dolby Vision';

  @override
  String get settingsAskEachTime => 'ถามทุกครั้ง.';

  @override
  String get settingsPreferHdr10Fallback => 'ต้องการ HDR10 ทางเลือก';

  @override
  String get settingsPreferServerTranscode => 'ต้องการการแปลงรหัสเซิร์ฟเวอร์';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision โปรไฟล์ 7 เล่นโดยตรง';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'ควบคุมว่า Dolby Vision สตรีมเลเยอร์การปรับปรุงโปรไฟล์ 7 ควรควบคุมการเล่นหรือไม่';

  @override
  String get settingsAutoAftkrtEnabled => 'อัตโนมัติ (เปิดใช้งาน AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'เปิดใช้งานบนอุปกรณ์นี้แล้ว';

  @override
  String get settingsDisabledPreferTranscode => 'ปิดการใช้งาน (ต้องการการแปลง)';

  @override
  String get settingsResumeRewindDescription =>
      'เมื่อเล่นต่อ (จาก Continue Watching หรือหน้ารายการสื่อ) ควรกรอย้อนกลับกี่วินาที?';

  @override
  String get settingsUnpauseRewindDescription =>
      'เมื่อกลับมาเล่นต่อหลังจากกดปุ่มหยุดชั่วคราว ควรกรอย้อนกลับกี่วินาที?';

  @override
  String get settingsSkipBackLengthDescription =>
      'กดปุ่มย้อนกลับกี่วินาทีจึงจะกระโดดกลับได้';

  @override
  String get settingsOneSecond => '1 วินาที';

  @override
  String get settingsThreeSeconds => '3 วินาที';

  @override
  String get settingsFortyFiveSeconds => '45 วินาที';

  @override
  String get settingsSixtySeconds => '60 วินาที';

  @override
  String get settingsSkipForwardLengthDescription =>
      'กี่วินาทีที่จะข้ามไปข้างหน้าหลังจากกดปุ่มกรอไปข้างหน้า';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 ไปยังตัวถอดรหัสภายนอก';

  @override
  String get settingsCinemaMode => 'โหมดภาพยนตร์';

  @override
  String get settingsCinemaModeSubtitle => 'เล่นตัวอย่าง/ตอนต้นก่อนฟีเจอร์หลัก';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended แสดงการ์ดแบบเต็มพร้อมอาร์ตเวิร์กตอนและคำอธิบาย ขั้นต่ำแสดงการซ้อนทับการนับถอยหลังแบบกะทัดรัด ปิดการใช้งานซ่อนพรอมต์ทั้งหมด';

  @override
  String get settingsShort => 'สั้น';

  @override
  String get settingsLong => 'ยาว';

  @override
  String get settingsVeryLong => 'ยาวมาก';

  @override
  String get settingsVideoStartDelay => 'ความล่าช้าในการเริ่มวิดีโอ';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'ถ่ายทอดสดทางโทรทัศน์โดยตรง';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'เปิดใช้งานการเล่นโดยตรงสำหรับรายการสดทางทีวี';

  @override
  String get settingsOpenGroups => 'เปิดกลุ่ม';

  @override
  String get settingsOpenGroupsSubtitle =>
      'สร้าง เข้าร่วม หรือจัดการกลุ่ม SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay เปิดใช้งานแล้ว';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'เปิดใช้งานคุณสมบัติการดูเป็นกลุ่ม';

  @override
  String get settingsSyncplayButton => 'SyncPlay ปุ่ม';

  @override
  String get settingsSyncplayButtonSubtitle => 'แสดงปุ่ม SyncPlay บนแถบนำทาง';

  @override
  String get settingsSyncplayAdvancedCorrection => 'การแก้ไขขั้นสูง';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'เปิดใช้งานตรรกะการซิงค์แบบละเอียด';

  @override
  String get settingsSyncplaySyncCorrection => 'การแก้ไขการซิงค์';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'ปรับการเล่นโดยอัตโนมัติเพื่อให้ซิงค์กัน';

  @override
  String get settingsSyncplaySpeedToSync => 'ความเร็วในการซิงค์';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'ใช้การปรับความเร็วในการเล่นเพื่อซิงค์';

  @override
  String get settingsSyncplaySkipToSync => 'ข้ามไปที่การซิงค์';

  @override
  String get settingsSyncplaySkipToSyncSubtitle => 'ใช้การค้นหาเพื่อซิงค์';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'ความล่าช้าความเร็วขั้นต่ำ';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'ความล่าช้าความเร็วสูงสุด';

  @override
  String get settingsSyncplaySpeedDuration => 'ระยะเวลาความเร็ว';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'ความล่าช้าในการข้ามขั้นต่ำ';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay ออฟเซ็ตพิเศษ';

  @override
  String get onNow => 'ตอนนี้';

  @override
  String get collections => 'คอลเลกชัน';

  @override
  String get lastPlayed => 'เล่นล่าสุด';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'ล่าสุด $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
  }

  @override
  String get autoplayNextEpisode => 'เล่นอัตโนมัติตอนถัดไป';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'เล่นตอนถัดไปโดยอัตโนมัติเมื่อพร้อมใช้งาน';

  @override
  String get skipSilenceTitle => 'ข้ามความเงียบ';

  @override
  String get skipSilenceSubtitle =>
      'ข้ามส่วนเสียงเงียบโดยอัตโนมัติเมื่อสตรีมรองรับ';

  @override
  String get allowExternalAudioEffectsTitle => 'อนุญาตเอฟเฟกต์เสียงภายนอก';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'อนุญาตให้แอปอีควอไลเซอร์และเอฟเฟกต์ (เช่น Wavelet) แนบกับเซสชันการเล่น Media3';

  @override
  String get disableTunnelingTitle => 'ปิดการใช้งานอุโมงค์';

  @override
  String get disableTunnelingSubtitle =>
      'บังคับให้เล่นแบบไม่มีช่องสัญญาณ มีประโยชน์บนอุปกรณ์ที่มีความไม่ต่อเนื่องของเสียง/วิดีโอแบบทันเนล';

  @override
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title => 'แมป Dolby Vision โปรไฟล์ 7 ไปยัง HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'เล่น Dolby Vision โปรไฟล์ 7 สตรีมเป็น HDR10-เข้ากันได้กับ HEVC บนอุปกรณ์ที่ไม่ใช่ DV';

  @override
  String get subtitlesUseEmbeddedStyles => 'ใช้รูปแบบคำบรรยายแบบฝัง';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'ใส่สี แบบอักษร และตำแหน่งที่ฝังอยู่ในแทร็กคำบรรยาย ปิดใช้งานเพื่อใช้การตั้งค่ารูปแบบคำบรรยายของคุณแทน';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'ใช้ขนาดแบบอักษรคำบรรยายที่ฝังไว้';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'ใช้คำแนะนำขนาดตัวอักษรที่ฝังอยู่ในแทร็กคำบรรยาย ปิดการใช้งานเพื่อใช้ขนาดคำบรรยายจากการตั้งค่าสไตล์ของคุณ';

  @override
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

  @override
  String get useDetailedSubHeadings => 'ใช้หัวข้อย่อยโดยละเอียด';

  @override
  String get useDetailedSubHeadingsDescription =>
      'แสดงรายละเอียดหรือแถวย่อยขั้นต่ำบนหน้าไลบรารี';

  @override
  String get savedThemesDeleteDialogTitle => 'ลบธีมที่บันทึกไว้ใช่ไหม';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'ลบ \"$themeName\" ออกจากแคชอุปกรณ์นี้หรือไม่';
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
    return 'ลบ \"$themeName\" ออกจากอุปกรณ์นี้แล้ว';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'ไม่สามารถลบ \"$themeName\" ได้';
  }

  @override
  String get savedThemesTitle => 'ธีมที่บันทึกไว้';

  @override
  String get savedThemesDescription =>
      'ธีมเหล่านี้เป็นธีมที่ดาวน์โหลดจากปลั๊กอิน Moonfin สำหรับเซิร์ฟเวอร์ปัจจุบัน การลบจะลบเฉพาะสำเนาในเครื่องนี้เท่านั้น';

  @override
  String get savedThemesEmpty => 'ไม่พบธีมที่บันทึกไว้สำหรับเซิร์ฟเวอร์นี้';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • ใช้งานอยู่ในปัจจุบัน';
  }

  @override
  String get savedThemesDeleteTooltip => 'ลบธีมที่บันทึกไว้';

  @override
  String get savedThemesManageSubtitle =>
      'จัดการธีมปลั๊กอินที่ดาวน์โหลดบนอุปกรณ์นี้';

  @override
  String get themeEditor => 'ตัวแก้ไขธีม';

  @override
  String get themeEditorSubtitle =>
      'เปิด Moonfin Theme Editor ในเบราว์เซอร์ของคุณ';

  @override
  String get homeScreen => 'หน้าจอหลัก';

  @override
  String get bottomBar => 'แถบด้านล่าง';

  @override
  String get homeRowsStyleClassic => 'คลาสสิค';

  @override
  String get homeRowsStyleModern => 'ทันสมัย';

  @override
  String get homeRowsSection => 'แถวบ้าน';

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
  String get rowsType => 'ประเภทแถว';

  @override
  String get rowsTypeDescription =>
      'Classic เก็บประเภทรูปภาพต่อแถวและการซ้อนทับข้อมูล สมัยใหม่ใช้แถวแนวตั้งเป็นฉากหลัง';

  @override
  String get displayFavoritesRows => 'แสดงแถวรายการโปรด';

  @override
  String get displayFavoritesRowsSubtitle =>
      'แสดงภาพยนตร์ ซีรีส์ และแถวโปรดอื่นๆ ที่ชื่นชอบในส่วนหน้าแรก';

  @override
  String get favoritesRowSorting => 'การเรียงลำดับแถวรายการโปรด';

  @override
  String get favoritesRowSortingDescription =>
      'จัดเรียงแถวรายการโปรดตามวันที่เพิ่ม วันที่วางจำหน่าย ตามลำดับตัวอักษร และอื่นๆ';

  @override
  String get displayCollectionsRows => 'แสดงแถวคอลเลกชัน';

  @override
  String get displayCollectionsRowsSubtitle => 'แสดงแถวคอลเลกชันในส่วนหน้าแรก';

  @override
  String get collectionsRowSorting => 'การเรียงลำดับแถวของคอลเลกชัน';

  @override
  String get collectionsRowSortingDescription =>
      'จัดเรียงแถวคอลเลกชันตามวันที่เพิ่ม วันที่วางจำหน่าย ตามลำดับตัวอักษร และอื่นๆ';

  @override
  String get displayGenresRows => 'แสดงแถวประเภท';

  @override
  String get displayGenresRowsSubtitle => 'แสดงแถวประเภทในส่วนหน้าแรก';

  @override
  String get genresRowSorting => 'การเรียงลำดับแถวประเภท';

  @override
  String get genresRowSortingDescription =>
      'จัดเรียงแถวประเภทตามวันที่เพิ่ม วันที่วางจำหน่าย ตามลำดับตัวอักษร และอื่นๆ';

  @override
  String get genresRowItems => 'รายการแถวประเภท';

  @override
  String get genresRowItemsDescription =>
      'แสดงภาพยนตร์ ซีรีส์ หรือทั้งสองอย่างในแถวประเภท';

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
  String get appearance => 'รูปร่าง';

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
  String get cardSize => 'ขนาดการ์ด';

  @override
  String get externalPlayerApp => 'แอพเครื่องเล่นภายนอก';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'แสดงตัวเลือกแอปเมื่อเริ่มเล่น';

  @override
  String get loadingInstalledPlayers => 'กำลังโหลดผู้เล่นที่ติดตั้ง...';

  @override
  String get connection => 'การเชื่อมต่อ';

  @override
  String get audioTranscodeTarget => 'เป้าหมายการแปลงเสียง';

  @override
  String get passthrough => 'ทะลุผ่าน';

  @override
  String get supportedOnThisDevice => 'รองรับบนอุปกรณ์นี้';

  @override
  String get notSupportedOnThisDevice => 'ไม่รองรับอุปกรณ์นี้';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) ส่งผ่าน';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) ไปยังตัวถอดรหัสภายนอก';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD พร้อม Atmos (JOC) ส่งผ่าน';

  @override
  String get mediaPlayerBehavior => 'พฤติกรรมของเครื่องเล่นมีเดีย';

  @override
  String get playbackEnhancements => 'การเพิ่มประสิทธิภาพการเล่น';

  @override
  String get alwaysOn => 'เปิดอยู่เสมอ';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'แทนที่ Skip Outro ด้วย Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'แสดงโอเวอร์เลย์ถัดไปแทนปุ่มข้าม';

  @override
  String get playerRouting => 'เส้นทางผู้เล่น';

  @override
  String get preferSoftwareDecoders => 'ชอบตัวถอดรหัสซอฟต์แวร์';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'ใช้ FFmpeg (เสียง) และ libgav1 (AV1) ก่อนตัวถอดรหัสฮาร์ดแวร์ ปิดใช้งานหากการส่งผ่านเสียง HDMI ขาดหาย';

  @override
  String get useExternalPlayer => 'ใช้เครื่องเล่นภายนอก';

  @override
  String get useExternalPlayerSubtitle =>
      'เปิดการเล่นวิดีโอในแอปภายนอกที่คุณเลือกบน Android TV';

  @override
  String get automaticQueuing => 'การเข้าคิวอัตโนมัติ';

  @override
  String get preferSdhSubtitles => 'ชอบคำบรรยาย SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'จัดลำดับความสำคัญของแทร็กคำบรรยาย SDH/CC เมื่อเลือกอัตโนมัติ';

  @override
  String get webDiagnostics => 'การวินิจฉัยเว็บ';

  @override
  String get webDiagnosticsTitle => 'Moonfin การวินิจฉัยเว็บ';

  @override
  String get webDiagnosticsIntro =>
      'ใช้หน้านี้เพื่อวินิจฉัยปัญหาการเชื่อมต่อเบราว์เซอร์ (CORS, เนื้อหาผสม และการตั้งค่าการค้นพบ)';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'ตรวจพบความล้มเหลวของเนื้อหาผสม';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'ตรวจพบความล้มเหลวของ CORS/Preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin ตรวจพบหน้า HTTPS ที่พยายามเรียก URL ของเซิร์ฟเวอร์ HTTP เบราว์เซอร์บล็อกคำขอนี้ก่อนที่จะเข้าถึงเซิร์ฟเวอร์ของคุณ';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin ตรวจพบความล้มเหลวของคำขอระดับเบราว์เซอร์ซึ่งโดยทั่วไปมีสาเหตุมาจาก CORS หรือส่วนหัว preflight บนเซิร์ฟเวอร์สื่อหายไป';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL เป้าหมาย: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'รายละเอียด: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'บริบทรันไทม์ปัจจุบัน';

  @override
  String get webDiagnosticsOrigin => 'ต้นทาง';

  @override
  String get webDiagnosticsScheme => 'โครงการ';

  @override
  String get webDiagnosticsPluginMode => 'โหมดปลั๊กอิน';

  @override
  String get webDiagnosticsWebRtcScan => 'การสแกน WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL เซิร์ฟเวอร์บังคับ';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL เซิร์ฟเวอร์เริ่มต้น';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL พร็อกซีการค้นพบ';

  @override
  String get notConfigured => 'ไม่ได้กำหนดค่า';

  @override
  String get webDiagnosticsMixedContent => 'เนื้อหาผสม';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'หน้านี้โหลดผ่าน HTTPS แต่ URL ที่กำหนดค่าอย่างน้อยหนึ่งรายการเป็น HTTP เบราว์เซอร์บล็อกหน้า HTTPS ไม่ให้เรียก HTTP API';

  @override
  String get webDiagnosticsMixedContentFix =>
      'แก้ไข: ให้บริการเซิร์ฟเวอร์สื่อหรือจุดสิ้นสุดพร็อกซีของคุณผ่าน HTTPS หรือโหลด Moonfin ผ่าน HTTP บนเครือข่ายท้องถิ่นที่เชื่อถือได้เท่านั้น';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'ไม่พบการกำหนดค่าเนื้อหาผสมที่ชัดเจนจากการตั้งค่ารันไทม์ปัจจุบัน';

  @override
  String get webDiagnosticsCorsChecklist => 'รายการตรวจสอบ CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• อนุญาตต้นกำเนิดเบราว์เซอร์ใน Access-Control-Allow-Origin';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• รวมการอนุญาต X-Emby-Authorization และ X-Emby-Token ใน Access-Control-Allow-Headers';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• เปิดเผยช่วงเนื้อหาและช่วงการยอมรับสำหรับการสตรีมและการค้นหาพฤติกรรม';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• ส่งคืน 204 ไปที่ OPTIONS คำขอก่อนการบิน';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'ตัวอย่างข้อมูลส่วนหัว (สไตล์ nginx)';

  @override
  String get note => 'บันทึก';

  @override
  String get webDiagnosticsNonWebNote =>
      'เส้นทางการวินิจฉัยนี้มีไว้สำหรับการสร้างเว็บ หากคุณเห็นสิ่งนี้บนแพลตฟอร์มอื่น การตรวจสอบเหล่านี้อาจไม่มีผล';

  @override
  String get backToServerSelect => 'กลับไปที่เซิร์ฟเวอร์ เลือก';

  @override
  String get signOutAllUsers => 'ออกจากระบบผู้ใช้ทั้งหมด';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'การอนุญาตไมโครโฟนถูกปฏิเสธอย่างถาวร เปิดใช้งานในการตั้งค่าระบบ';

  @override
  String get voiceSearchPermissionRequired =>
      'ต้องได้รับอนุญาตจากไมโครโฟนสำหรับการค้นหาด้วยเสียง';

  @override
  String get voiceSearchNoMatch => 'ไม่ได้จับว่า. ลองอีกครั้ง';

  @override
  String get voiceSearchNoSpeechDetected => 'ไม่พบคำพูด';

  @override
  String get voiceSearchMicrophoneError => 'ข้อผิดพลาดของไมโครโฟน';

  @override
  String get voiceSearchNeedsInternet => 'การค้นหาด้วยเสียงต้องใช้อินเทอร์เน็ต';

  @override
  String get voiceSearchServiceBusy => 'บริการเสียงไม่ว่าง ลองอีกครั้ง';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'การอนุญาตไมโครโฟนถูกปฏิเสธอย่างถาวร';

  @override
  String get microphonePermissionDenied => 'การอนุญาตไมโครโฟนถูกปฏิเสธ';

  @override
  String get speechRecognitionUnavailable =>
      'การรู้จำเสียงไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get openIosRoutePicker => 'เปิดตัวเลือกเส้นทาง iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay ตัวเลือกเส้นทางไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get videos => 'วิดีโอ';

  @override
  String get programs => 'โปรแกรม';

  @override
  String get songs => 'เพลง';

  @override
  String get photoAlbums => 'อัลบั้มภาพ';

  @override
  String get photos => 'ภาพถ่าย';

  @override
  String get people => 'ประชากร';

  @override
  String get recentlyReleasedEpisodes => 'ตอนที่ออกล่าสุด';

  @override
  String get watchAgain => 'ดูอีกครั้ง';

  @override
  String get guestAppearances => 'การปรากฏตัวของแขก';

  @override
  String get appearancesSeerr => 'การปรากฏตัว (เซียร์)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'ดูกับกลุ่ม.';

  @override
  String get errors => 'ข้อผิดพลาด';

  @override
  String get warnings => 'คำเตือน';

  @override
  String get disk => 'ดิสก์';

  @override
  String get openInBrowser => 'เปิดในเบราว์เซอร์';

  @override
  String get embeddedBrowserNotAvailable =>
      'เบราว์เซอร์แบบฝังไม่พร้อมใช้งานบนแพลตฟอร์มนี้';

  @override
  String get adminRestartServerConfirmation =>
      'คุณแน่ใจหรือไม่ว่าต้องการรีสตาร์ทเซิร์ฟเวอร์';

  @override
  String get adminShutdownServerConfirmation =>
      'คุณแน่ใจหรือไม่ว่าต้องการปิดเซิร์ฟเวอร์? คุณจะต้องรีสตาร์ทด้วยตนเอง';

  @override
  String get internal => 'ภายใน';

  @override
  String get idle => 'ไม่ได้ใช้งาน';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'ไม่พบผู้ใช้';

  @override
  String get adminNoUsersMatchSearch => 'ไม่มีผู้ใช้ที่ตรงกับการค้นหาของคุณ';

  @override
  String get adminNoDevicesFound => 'ไม่พบอุปกรณ์';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'ไม่มีอุปกรณ์ที่ตรงกับตัวกรองปัจจุบัน';

  @override
  String get passwordSet => 'ตั้งรหัสผ่าน';

  @override
  String get noPasswordConfigured => 'ไม่มีการกำหนดค่ารหัสผ่าน';

  @override
  String get remoteAccess => 'การเข้าถึงระยะไกล';

  @override
  String get localOnly => 'เฉพาะท้องถิ่นเท่านั้น';

  @override
  String get adminMediaAnalyticsLoadFailed => 'โหลดการวิเคราะห์สื่อไม่สำเร็จ';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'รวมการวิเคราะห์ในไลบรารีสื่อทั้งหมด';

  @override
  String get analyticsTopArtists => 'ศิลปินยอดนิยม';

  @override
  String get analyticsTopAuthors => 'ผู้เขียนยอดนิยม';

  @override
  String get analyticsTopContributors => 'ผู้ร่วมให้ข้อมูลดีเด่น';

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
      'ยังไม่มีผลรวมสื่อที่จัดทำดัชนีสำหรับการเลือกนี้';

  @override
  String get analyticsLibraryDetails => 'รายละเอียดห้องสมุด';

  @override
  String get analyticsLibraryBreakdown => 'รายละเอียดห้องสมุด';

  @override
  String get analyticsNoLibrariesAvailable => 'ไม่มีห้องสมุดให้บริการ';

  @override
  String get adminServerAdministrationTitle => 'การบริหารเซิร์ฟเวอร์';

  @override
  String get adminServerPathData => 'ข้อมูล';

  @override
  String get adminServerPathImageCache => 'แคชรูปภาพ';

  @override
  String get adminServerPathCache => 'แคช';

  @override
  String get adminServerPathLogs => 'บันทึก';

  @override
  String get adminServerPathMetadata => 'ข้อมูลเมตา';

  @override
  String get adminServerPathTranscode => 'แปลงรหัส';

  @override
  String get adminServerPathWeb => 'เว็บ';

  @override
  String get adminNoServerPathsReturned =>
      'ไม่มีเส้นทางเซิร์ฟเวอร์ที่ส่งคืนโดยเซิร์ฟเวอร์นี้';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ใช้แล้ว';
  }

  @override
  String get userActivity => 'กิจกรรมของผู้ใช้';

  @override
  String get systemEvents => 'เหตุการณ์ของระบบ';

  @override
  String get needsAttention => 'ต้องการความสนใจ';

  @override
  String get adminDrawerSectionServer => 'เซิร์ฟเวอร์';

  @override
  String get adminDrawerSectionPlayback => 'การเล่น';

  @override
  String get adminDrawerSectionDevices => 'อุปกรณ์';

  @override
  String get adminDrawerSectionAdvanced => 'ขั้นสูง';

  @override
  String get adminDrawerSectionPlugins => 'ปลั๊กอิน';

  @override
  String get adminDrawerSectionLiveTv => 'รายการสดทางทีวี';

  @override
  String get homeVideos => 'โฮมวิดีโอ';

  @override
  String get mixedContent => 'เนื้อหาผสม';

  @override
  String get homeVideosAndPhotos => 'หน้าแรก วิดีโอและภาพถ่าย';

  @override
  String get mixedMoviesAndShows => 'ภาพยนตร์และรายการผสม';

  @override
  String get intelQuickSync => 'Intel ซิงค์ด่วน';

  @override
  String get rockchipMpp => 'ร็อคชิป เอ็มพีพี';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'ไม่พบการบันทึก';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'ไม่พบหน้ารูปภาพภายใน .$extension ไฟล์เก็บถาวร';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'ตัวเรนเดอร์แบบฝังล้มเหลว ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'ตัวเรนเดอร์ EPUB ล้มเหลว ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'ไฟล์ในเครื่องหายไปสำหรับผู้อ่าน: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status ขณะเปิดข้อมูลหนังสือจาก $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'ไม่มีจุดสิ้นสุดของหนังสือที่สามารถอ่านได้';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'รูปแบบไฟล์เก็บถาวรการ์ตูนที่ไม่รองรับ: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'ปลั๊กอินการแยก CBR ไม่พร้อมใช้งานบนแพลตฟอร์มนี้';

  @override
  String get failedToExtractCbrArchive => 'ไม่สามารถแยกไฟล์เก็บถาวร .cbr';

  @override
  String get cb7ExtractionUnavailable =>
      'การแยก CB7 ไม่พร้อมใช้งานบนแพลตฟอร์มนี้';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'ปลั๊กอินการแยก CB7 ไม่พร้อมใช้งานบนแพลตฟอร์มนี้';

  @override
  String get closeGenrePanel => 'ปิดแผงประเภท';

  @override
  String get loadingShuffle => 'กำลังโหลดแบบสุ่ม...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'การสลับ HDR อัตโนมัติ';

  @override
  String get autoHdrSwitchingDescription =>
      'เปิดใช้งาน HDR โดยอัตโนมัติสำหรับการเล่นวิดีโอ HDR และคืนค่าโหมดการแสดงผลเมื่อออก';

  @override
  String get whenFullscreen => 'เมื่อเปิดเต็มจอ';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'ขีดจำกัดการแปลงรหัส';

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
