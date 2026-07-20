// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'TÙY CHỌN TÀI KHOẢN';

  @override
  String get interfaceLanguage => 'Ngôn ngữ giao diện';

  @override
  String get systemLanguageDefault => 'Mặc định của hệ thống';

  @override
  String get signIn => 'Đăng nhập';

  @override
  String get empty => 'Trống';

  @override
  String connectingToServer(String serverName) {
    return 'Đang kết nối với $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Mật khẩu';

  @override
  String get username => 'Tên người dùng';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Nhập mã này trên bảng điều khiển web của máy chủ của bạn:';

  @override
  String get waitingForAuthorization => 'Đang chờ cấp phép...';

  @override
  String get back => 'Quay lại';

  @override
  String get serverUnavailable => 'Máy chủ không khả dụng';

  @override
  String get loginFailed => 'Đăng nhập không thành công';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect không có sẵn: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect không khả dụng ($status): $detail';
  }

  @override
  String get whosWatching => 'Ai đang xem?';

  @override
  String get addUser => 'Thêm người dùng';

  @override
  String get selectServer => 'Chọn máy chủ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin phiên bản $version';
  }

  @override
  String get savedServers => 'Máy chủ đã lưu';

  @override
  String get discoveredServers => 'Máy chủ được phát hiện';

  @override
  String get noneFound => 'Không tìm thấy';

  @override
  String get unableToConnectToServer => 'Không thể kết nối với máy chủ';

  @override
  String get addServer => 'Thêm máy chủ';

  @override
  String get embyConnect => 'Emby Kết nối';

  @override
  String get removeServer => 'Xóa máy chủ';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Xóa \"$serverName\" khỏi máy chủ của bạn?';
  }

  @override
  String get cancel => 'Hủy bỏ';

  @override
  String get remove => 'Gỡ bỏ';

  @override
  String get connectToServer => 'Kết nối với máy chủ';

  @override
  String get serverAddress => 'Địa chỉ máy chủ';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Kết nối';

  @override
  String get secureStorageUnavailable => 'Bộ nhớ an toàn không có sẵn';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin không thể truy cập vào khóa hệ thống của bạn. Việc đăng nhập có thể tiếp tục nhưng việc lưu trữ mã thông báo an toàn có thể không khả dụng cho đến khi khóa được mở khóa.';

  @override
  String get ok => 'ĐƯỢC RỒI';

  @override
  String get settingsAppearanceTheme => 'Chủ đề ứng dụng';

  @override
  String get detailScreenStyle => 'Kiểu màn hình chi tiết';

  @override
  String get detailScreenStyleSubtitle =>
      'Cổ điển là bố cục Moonfin gốc căn giữa. Hiện đại là bố cục điện ảnh tự điều chỉnh.';

  @override
  String get detailScreenStyleMoonfin => 'Cổ điển';

  @override
  String get detailScreenStyleModern => 'Hiện đại';

  @override
  String get expandedTabs => 'Thẻ mở rộng';

  @override
  String get expandedTabsSubtitle =>
      'Tự động hiển thị nội dung thẻ khi bạn duyệt qua các thẻ. Tắt để tự mở và đóng từng thẻ.';

  @override
  String get showTechnicalDetails => 'Hiển thị chi tiết kỹ thuật?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Hiển thị thông tin codec, độ phân giải và luồng trong phần tóm tắt biểu ngữ';

  @override
  String get recommendationSystem => 'Hệ thống gợi ý';

  @override
  String get recommendationSystemSubtitle =>
      'Dùng thuật toán Moonfin Gợi ý dựa trên thư viện cục bộ hoặc Chỉ số tương đồng trực tuyến của TMDb. Lưu ý: Gợi ý trực tuyến cần tích hợp Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Gợi ý';

  @override
  String get recommendationSystemTmdb => 'Độ tương đồng TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Giới hạn theo xếp hạng độ tuổi?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Giới hạn gợi ý của Moonfin Gợi ý theo xếp hạng độ tuổi của nội dung đích';

  @override
  String get interfaceStyle => 'Kiểu giao diện';

  @override
  String get interfaceStyleSubtitle =>
      'Tự động sẽ khớp với thiết bị của bạn. Chọn Apple hoặc Material để dùng một giao diện cố định.';

  @override
  String get interfaceStyleAutomatic => 'Tự động';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Chất lượng hiệu ứng kính';

  @override
  String get glassQualitySubtitle =>
      'Tự động sẽ chọn hiệu ứng kính phù hợp nhất cho thiết bị này. Đầy đủ buộc dùng làm mờ thật; Giảm bớt dùng hiệu ứng kính nhẹ giúp tiết kiệm GPU.';

  @override
  String get glassQualityAuto => 'Tự động';

  @override
  String get glassQualityFull => 'Đầy đủ';

  @override
  String get glassQualityReduced => 'Giảm bớt';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Chuyển đổi giữa Moonfin và Neon Pulse mà không cần khởi động lại ứng dụng';

  @override
  String get customThemeTitle => 'Chủ đề tùy chỉnh';

  @override
  String get customThemeSubtitle =>
      'Chủ đề tùy chỉnh thay đổi các thành phần giao diện trên toàn Moonfin. Hãy chọn một tùy chọn hợp với phong cách của bạn.';

  @override
  String get keyboardPreferSystemIme => 'Ưu tiên bàn phím hệ thống';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Sử dụng phương thức nhập thiết bị của bạn theo mặc định để nhập văn bản';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Diện mạo Moonfin hiện tại được tất cả các bạn yêu thích';

  @override
  String get themeNeonPulse => 'Xung neon';

  @override
  String get themeNeonPulseSubtitle =>
      'Kiểu dáng Synthwave với ánh sáng đỏ tươi, văn bản màu lục lam và độ tương phản chrome mạnh hơn';

  @override
  String get themeGlass => 'Kính';

  @override
  String get themeGlassSubtitle =>
      'Phong cách kính lỏng với nền chuyển sắc chuyển động nhẹ, bề mặt mờ và điểm nhấn xanh Apple';

  @override
  String get theme8BitHero => 'Người hùng 8-bit';

  @override
  String get theme8BitHeroSubtitle =>
      'Phong cách pixel-art hoài cổ với bảng màu đậm, viền khối, đổ bóng sắc nét và phông chữ pixel';

  @override
  String get embyConnectSignInSubtitle =>
      'Đăng nhập bằng tài khoản Emby Connect của bạn';

  @override
  String get emailOrUsername => 'Email hoặc tên người dùng';

  @override
  String get selectAServer => 'Chọn một máy chủ';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get noLinkedServers =>
      'Không có máy chủ nào được liên kết với tài khoản Emby Connect này';

  @override
  String get invalidEmbyConnectCredentials =>
      'Thông tin đăng nhập Emby Connect không hợp lệ';

  @override
  String get invalidEmbyConnectLogin =>
      'Tên người dùng hoặc mật khẩu Emby Connect không hợp lệ';

  @override
  String get embyConnectExchangeNotSupported =>
      'Server không hỗ trợ trao đổi Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Lỗi mạng khi liên hệ với Emby Connect hoặc máy chủ được chọn';

  @override
  String get loadingLinkedServers => 'Đang tải các máy chủ được liên kết...';

  @override
  String get connectingToServerEllipsis => 'Đang kết nối với máy chủ...';

  @override
  String get noReachableAddress =>
      'Không có địa chỉ có thể truy cập được cung cấp';

  @override
  String get invalidServerExchangeResponse =>
      'Phản hồi không hợp lệ từ điểm cuối trao đổi máy chủ';

  @override
  String unableToConnectTo(String target) {
    return 'Không thể kết nối với $target';
  }

  @override
  String get exitApp => 'Thoát khỏi Moonfin?';

  @override
  String get exitAppConfirmation => 'Bạn có chắc chắn muốn thoát không?';

  @override
  String get exit => 'Ra';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Đã tạm dừng';

  @override
  String get gameSaveState => 'Lưu trạng thái';

  @override
  String get games => 'Trò chơi';

  @override
  String get gameLoadState => 'Tải trạng thái';

  @override
  String get gameFastForward => 'Tua nhanh';

  @override
  String get gameEmulatorSettings => 'Cài đặt trình giả lập';

  @override
  String get gameNoCoreOptions =>
      'Nhân này không có tùy chọn nào để điều chỉnh.';

  @override
  String get gameHoldToOpenMenu => 'Giữ để mở menu';

  @override
  String get gamePlaybackUnsupported =>
      'Thiết bị này chưa hỗ trợ chơi trò chơi.';

  @override
  String get noHomeRowsLoaded => 'Không thể tải hàng nhà nào';

  @override
  String get noHomeRowsHint =>
      'Hãy thử làm mới hoặc giảm bớt các phần trang chủ đang hoạt động.';

  @override
  String get retryHomeRows => 'Thử lại các hàng chính';

  @override
  String get guide => 'Hướng dẫn';

  @override
  String get recordings => 'Bản ghi';

  @override
  String get schedule => 'Lịch trình';

  @override
  String get series => 'Phim bộ';

  @override
  String get noItemsFound => 'Không tìm thấy mục nào';

  @override
  String get home => 'Trang chủ';

  @override
  String get browseAll => 'Duyệt tất cả';

  @override
  String get genres => 'Thể loại';

  @override
  String get collectionPlaceholder =>
      'Các mục trong bộ sưu tập sẽ xuất hiện ở đây';

  @override
  String get browseByLetter => 'Duyệt theo thư';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Duyệt theo thứ tự bảng chữ cái sẽ xuất hiện ở đây';

  @override
  String get suggestions => 'Đề xuất';

  @override
  String get suggestionsPlaceholder =>
      'Các mục được đề xuất sẽ xuất hiện ở đây';

  @override
  String get failedToLoadLibraries => 'Không tải được thư viện';

  @override
  String get noLibrariesFound => 'Không tìm thấy thư viện nào';

  @override
  String get library => 'Thư viện';

  @override
  String get displaySettings => 'Cài đặt hiển thị';

  @override
  String get allGenres => 'Tất cả thể loại';

  @override
  String get noGenresFound => 'Không tìm thấy thể loại nào';

  @override
  String failedToLoadFolderError(String error) {
    return 'Không tải được thư mục: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Thư mục này trống';

  @override
  String itemCountLabel(int count) {
    return '$count các mục';
  }

  @override
  String get failedToLoadFavorites => 'Không tải được mục yêu thích';

  @override
  String get retry => 'Thử lại';

  @override
  String get noFavoritesYet => 'Chưa có mục yêu thích nào';

  @override
  String get favorites => 'Yêu thích';

  @override
  String totalCountItems(int count) {
    return '$count Vật phẩm';
  }

  @override
  String get continuing => 'Tiếp tục';

  @override
  String get ended => 'Đã kết thúc';

  @override
  String get sortAndFilter => 'Sắp xếp & Lọc';

  @override
  String get type => 'Kiểu';

  @override
  String get sortBy => 'Sắp xếp theo';

  @override
  String get display => 'Trưng bày';

  @override
  String get imageType => 'Loại hình ảnh';

  @override
  String get posterSize => 'Kích thước áp phích';

  @override
  String get small => 'Bé nhỏ';

  @override
  String get medium => 'Trung bình';

  @override
  String get large => 'Lớn';

  @override
  String get extraLarge => 'Cực lớn';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Thể loại';
  }

  @override
  String get views => 'Lượt xem';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Nghệ sĩ album';

  @override
  String get artists => 'Nghệ sĩ';

  @override
  String get bookmarks => 'Dấu trang';

  @override
  String get noSavedBookmarks =>
      'Chưa có dấu trang nào được lưu cho tiêu đề này.';

  @override
  String get openBook => 'Mở Sách';

  @override
  String get chapter => 'chương';

  @override
  String get page => 'Trang';

  @override
  String get bookmark => 'Đánh dấu';

  @override
  String get justNow => 'Vừa rồi';

  @override
  String minutesAgo(int count) {
    return '${count}m trước';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h trước';
  }

  @override
  String daysAgo(int count) {
    return '${count}d trước';
  }

  @override
  String get discoverySubjects => 'Đối tượng khám phá';

  @override
  String get pickDiscoverySubjects =>
      'Chọn nguồn cấp dữ liệu chủ đề để hiển thị trong Khám phá.';

  @override
  String get apply => 'Áp dụng';

  @override
  String get openLink => 'Mở liên kết';

  @override
  String get scanWithYourPhone => 'Quét bằng điện thoại của bạn';

  @override
  String get audiobookGenres => 'Thể loại sách nói';

  @override
  String get pickAudiobookGenres =>
      'Chọn thể loại sẽ hiển thị trong Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Khám phá sách nói';

  @override
  String get librivoxDescription =>
      'Tiêu đề miền công cộng phổ biến từ LibriVox.';

  @override
  String titlesCount(int count) {
    return 'tiêu đề $count';
  }

  @override
  String get scrollLeft => 'Cuộn sang trái';

  @override
  String get scrollRight => 'Cuộn sang phải';

  @override
  String get couldNotLoadGenre => 'Không thể tải thể loại này ngay bây giờ.';

  @override
  String get continueReading => 'Tiếp tục đọc';

  @override
  String get savedHighlights => 'Điểm nổi bật đã lưu';

  @override
  String get continueListening => 'Tiếp tục nghe';

  @override
  String get listen => 'Nghe';

  @override
  String get resume => 'Tiếp tục';

  @override
  String get failedToLoadLibrary => 'Không tải được thư viện';

  @override
  String get popularNow => 'Phổ biến hiện nay';

  @override
  String get savedForLater => 'Lưu lại để sử dụng sau';

  @override
  String get topListens => 'Nghe hàng đầu';

  @override
  String get unreadDiscoveries => 'Khám phá chưa đọc';

  @override
  String get pickUpAgain => 'Nhặt lại';

  @override
  String get bookHighlightsDescription =>
      'Sách của bạn có nội dung nổi bật, mục yêu thích hoặc tiến trình đọc.';

  @override
  String get handPickedFromLibrary => 'Được chọn thủ công từ thư viện của bạn.';

  @override
  String get handPickedFromListeningQueue =>
      'Được chọn thủ công từ hàng đợi nghe của bạn.';

  @override
  String get booksWithHighlights =>
      'Sách có nội dung nổi bật, yêu thích hoặc tiến trình đọc.';

  @override
  String get jumpBackNarration =>
      'Quay trở lại tường thuật mà không cần tìm kiếm vị trí của mình.';

  @override
  String get unreadBooksReady =>
      'Những cuốn sách chưa đọc đã sẵn sàng cho giờ yên tĩnh tiếp theo.';

  @override
  String get quickAccessFavorites =>
      'Truy cập nhanh vào những cuốn sách mà bạn thường xuyên quay lại.';

  @override
  String get searchAudiobooks => 'Tìm kiếm sách nói';

  @override
  String get searchYourLibrary => 'Tìm kiếm thư viện của bạn';

  @override
  String get pickUpStory => 'Tiếp tục câu chuyện nơi bạn đã dừng lại';

  @override
  String get savedPlacesChapters =>
      'Địa điểm đã lưu và các chương chưa hoàn thành của bạn';

  @override
  String authorsCount(int count) {
    return '$count tác giả';
  }

  @override
  String genresCount(int count) {
    return 'thể loại $count';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% đã hoàn thành';
  }

  @override
  String get readyWhenYouAre => 'Sẵn sàng khi bạn sẵn sàng';

  @override
  String get details => 'Chi tiết';

  @override
  String get listeningRoom => 'Phòng nghe';

  @override
  String get bookmarksAndProgress => 'Dấu trang & Tiến trình';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Các tiêu đề $count được sắp xếp để duyệt lần đầu tiên.';
  }

  @override
  String get titles => 'Tựa đề';

  @override
  String get allTitles => 'Tất cả các tiêu đề';

  @override
  String get authors => 'tác giả';

  @override
  String get browseByAuthor => 'Duyệt theo tác giả';

  @override
  String get browseByGenre => 'Duyệt theo thể loại';

  @override
  String get discover => 'Phát hiện';

  @override
  String get trendingTitlesOpenLibrary =>
      'Tiêu đề thịnh hành theo chủ đề từ Open Library.';

  @override
  String get noBookmarkedItems => 'Chưa có mục nào được đánh dấu';

  @override
  String get nothingMatchesSection =>
      'Chưa có gì phù hợp với phần này. Hãy thử một tab khác hoặc quay lại sau khi đồng bộ hóa thư viện hoàn tất.';

  @override
  String get audiobooks => 'Sách nói';

  @override
  String noLabelFound(String label) {
    return 'Không tìm thấy $label';
  }

  @override
  String get folder => 'Thư mục';

  @override
  String get filters => 'Bộ lọc';

  @override
  String get readingStatus => 'Trạng thái đọc';

  @override
  String get playedStatus => 'Trạng thái đã chơi';

  @override
  String get readStatus => 'Đọc';

  @override
  String get watched => 'Đã xem';

  @override
  String get unread => 'Chưa đọc';

  @override
  String get unwatched => 'Chưa xem';

  @override
  String get seriesStatus => 'Trạng thái loạt phim';

  @override
  String get allLibraries => 'Tất cả thư viện';

  @override
  String get books => 'Sách';

  @override
  String get latestBooks => 'Sách mới nhất';

  @override
  String get latestAudiobooks => 'Sách nói mới nhất';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cuốn sách',
      one: '1 cuốn sách',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Sách';

  @override
  String get bookFormatAudiobook => 'Sách nói';

  @override
  String bookPercentRead(int percent) {
    return 'Đã đọc $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Còn $time';
  }

  @override
  String get bookHeroRead => 'Đọc';

  @override
  String get bookHeroListen => 'Nghe';

  @override
  String get author => 'Tác giả';

  @override
  String get unknownAuthor => 'Tác giả không xác định';

  @override
  String get uncategorized => 'Chưa được phân loại';

  @override
  String get overview => 'Tổng quan';

  @override
  String get noLibrivoxDescription =>
      'Chưa có mô tả nào được LibriVox cung cấp cho tựa sách này.';

  @override
  String get readers => 'độc giả';

  @override
  String get openLinks => 'Liên kết mở';

  @override
  String get librivoxPage => 'Trang LibriVox';

  @override
  String get internetArchive => 'Lưu trữ Internet';

  @override
  String get rssFeed => 'Nguồn cấp dữ liệu RSS';

  @override
  String get downloadZip => 'Tải xuống Zip';

  @override
  String sectionCountLabel(int count) {
    return 'phần $count';
  }

  @override
  String firstPublished(int year) {
    return 'Được xuất bản lần đầu tiên $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Chưa có thông tin tổng quan nào từ Open Library cho tựa đề này.';

  @override
  String get subjects => 'môn học';

  @override
  String get all => 'Tất cả';

  @override
  String booksCount(int count) {
    return '$count sách';
  }

  @override
  String get couldNotLoadSubject => 'Không thể tải chủ đề này ngay bây giờ.';

  @override
  String get audiobookDetails => 'Chi tiết sách nói';

  @override
  String authorsCountTitle(int count) {
    return '$count Tác giả';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sách nói',
      one: '1 sách nói',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Danh sách bài hát';

  @override
  String get itemListPlaceholder => 'Danh sách vật phẩm sẽ xuất hiện ở đây';

  @override
  String get failedToLoad => 'Không tải được';

  @override
  String get delete => 'Xóa';

  @override
  String get save => 'Lưu';

  @override
  String get moreLikeThis => 'Tương tự thế này';

  @override
  String get castAndCrew => 'Diễn viên & Đoàn làm phim';

  @override
  String get collection => 'Bộ sưu tập';

  @override
  String get episodes => 'tập phim';

  @override
  String get nextUp => 'Tiếp theo';

  @override
  String get seasons => 'Mùa';

  @override
  String get chapters => 'chương';

  @override
  String get features => 'Đặc trưng';

  @override
  String get movies => 'Phim';

  @override
  String get musicVideos => 'Video Nhạc';

  @override
  String get other => 'Khác';

  @override
  String get discography => 'Đĩa hát';

  @override
  String get similarArtists => 'Nghệ sĩ tương tự';

  @override
  String get tableOfContents => 'Mục lục';

  @override
  String get tracklist => 'Danh sách bài hát';

  @override
  String discNumber(int number) {
    return 'Đĩa $number';
  }

  @override
  String get biography => 'Tiểu sử';

  @override
  String get authorDetails => 'Chi tiết tác giả';

  @override
  String get noOverviewAvailable =>
      'Không có cái nhìn tổng quan có sẵn cho tiêu đề này.';

  @override
  String get noBiographyAvailable => 'Không có tiểu sử có sẵn cho tác giả này.';

  @override
  String get noBooksFound => 'Không tìm thấy sách nào cho tác giả này.';

  @override
  String get unableToLoadAuthorDetails =>
      'Không thể tải chi tiết tác giả ngay bây giờ.';

  @override
  String published(int year) {
    return 'Đã xuất bản $year';
  }

  @override
  String get publicationDateUnknown => 'Ngày xuất bản không rõ';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mùa',
      one: '1 Mùa',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Kết thúc lúc $time';
  }

  @override
  String get items => 'Mục';

  @override
  String get extras => 'Nội dung thêm';

  @override
  String get behindTheScenes => 'Hậu trường';

  @override
  String get deletedScenes => 'Cảnh bị cắt';

  @override
  String get featurettes => 'Phim ngắn giới thiệu';

  @override
  String get interviews => 'Phỏng vấn';

  @override
  String get scenes => 'Cảnh phim';

  @override
  String get shorts => 'Phim ngắn';

  @override
  String get trailers => 'Trailer';

  @override
  String timeRemaining(String time) {
    return 'Còn $time';
  }

  @override
  String endsIn(String time) {
    return 'Kết thúc sau $time';
  }

  @override
  String get view => 'Xem';

  @override
  String get resumeReading => 'Tiếp tục đọc';

  @override
  String get read => 'Đọc';

  @override
  String resumeFrom(String position) {
    return 'Tiếp tục từ $position';
  }

  @override
  String get play => 'Phát';

  @override
  String get startOver => 'Bắt đầu lại';

  @override
  String get restart => 'Khởi động lại';

  @override
  String get readOffline => 'Đọc ngoại tuyến';

  @override
  String get playOffline => 'Chơi ngoại tuyến';

  @override
  String get audio => 'Âm thanh';

  @override
  String get subtitles => 'phụ đề';

  @override
  String get version => 'Phiên bản';

  @override
  String get cast => 'Truyền';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Hoàn thành';

  @override
  String get favorited => 'Yêu thích';

  @override
  String get favorite => 'Yêu thích';

  @override
  String get playlist => 'Danh sách phát';

  @override
  String get downloaded => 'Đã tải xuống';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'Tải xuống tất cả';

  @override
  String get download => 'Tải xuống';

  @override
  String get deleteDownloaded => 'Xóa đã tải xuống';

  @override
  String get goToSeries => 'Đi tới loạt bài';

  @override
  String get editMetadata => 'Chỉnh sửa siêu dữ liệu';

  @override
  String get less => 'Ít hơn';

  @override
  String get more => 'Hơn';

  @override
  String get deleteItem => 'Xóa mục';

  @override
  String get deletePlaylist => 'Xóa danh sách phát';

  @override
  String get deletePlaylistMessage => 'Xóa danh sách phát này khỏi máy chủ?';

  @override
  String get deleteItemMessage => 'Xóa mục này khỏi máy chủ?';

  @override
  String get failedToDeletePlaylist => 'Không xóa được danh sách phát';

  @override
  String get failedToDeleteItem => 'Không thể xóa mục';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Đổi tên danh sách phát';

  @override
  String get playlistName => 'Tên danh sách phát';

  @override
  String get deleteDownloadedAlbum => 'Xóa Album đã tải xuống';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Xóa các bản nhạc đã tải xuống cho \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Đã xóa các bản nhạc đã tải xuống';

  @override
  String get downloadedTracksDeleteFailed =>
      'Không thể xóa một số bản nhạc đã tải xuống';

  @override
  String get noTracksLoaded => 'Không có bản nhạc nào được tải';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Chưa tải $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Đang tải xuống các mục $title ($count)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Bạn có chắc chắn muốn xóa \"$name\" khỏi máy chủ không? Không thể hoàn tác hành động này.';
  }

  @override
  String get itemDeleted => 'Mục đã bị xóa';

  @override
  String get noPlayableTrailerFound =>
      'Không tìm thấy đoạn giới thiệu có thể chơi được.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Định dạng sách không được hỗ trợ: .$extension';
  }

  @override
  String get audioTrack => 'Bản âm thanh';

  @override
  String get subtitleTrack => 'Bản nhạc phụ đề';

  @override
  String get none => 'Không có';

  @override
  String get downloadSubtitlesLabel => 'Tải phụ đề...';

  @override
  String get searchOpenSubtitlesPlugin => 'Tìm kiếm bằng plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Tải xuống phụ đề';

  @override
  String get selectedSubtitleInvalid => 'Phụ đề đã chọn không hợp lệ.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Phụ đề đã tải và chọn: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Đã tải phụ đề xuống. Có thể mất một chút thời gian để nó xuất hiện trong khi Jellyfin làm mới vật phẩm.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Không tìm thấy phụ đề từ xa cho $language.';
  }

  @override
  String get selectVersion => 'Chọn phiên bản';

  @override
  String versionNumber(int number) {
    return 'Phiên bản $number';
  }

  @override
  String get downloadAllQuality => 'Tải xuống tất cả - Chất lượng';

  @override
  String get downloadQuality => 'Chất lượng tải xuống';

  @override
  String get originalFileNoReencoding => 'Tệp gốc, không mã hóa lại';

  @override
  String get originalFilesNoReencoding => 'Tệp gốc, không mã hóa lại';

  @override
  String get noEpisodesLoaded => 'Không có tập nào được tải';

  @override
  String downloadingItem(String name, String quality) {
    return 'Đang tải xuống $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Xóa các tập tin đã tải xuống';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Xóa các tệp cục bộ cho $typeLabel?\n\nĐiều này sẽ giải phóng không gian lưu trữ. Bạn có thể tải lại sau.';
  }

  @override
  String get downloadedFilesDeleted => 'Các tập tin đã tải xuống đã bị xóa';

  @override
  String get failedToDeleteFiles => 'Không thể xóa tập tin';

  @override
  String get deleteFiles => 'Xóa tập tin';

  @override
  String get director => 'GIÁM ĐỐC';

  @override
  String get directors => 'ĐẠO DIỄN';

  @override
  String get writer => 'BIÊN KỊCH';

  @override
  String get writers => 'BIÊN KỊCH';

  @override
  String get studio => 'PHÒNG THU';

  @override
  String studioMoreCount(int count) {
    return '+$count thêm';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Các tập';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Tập $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Chương $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bản nhạc',
      one: '1 bản nhạc',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chương',
      one: '1 chương',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Sinh ra $date';
  }

  @override
  String died(String date) {
    return 'Đã chết $date';
  }

  @override
  String age(int age) {
    return 'Tuổi $age';
  }

  @override
  String get showLess => 'Hiển thị ít hơn';

  @override
  String get readMore => 'Đọc thêm';

  @override
  String get shuffle => 'Phát ngẫu nhiên';

  @override
  String get shuffleAllMusic => 'Phát ngẫu nhiên toàn bộ nhạc';

  @override
  String get carSignInPrompt => 'Đăng nhập Moonfin trên điện thoại của bạn';

  @override
  String get carServerUnreachable => 'Không kết nối được máy chủ của bạn';

  @override
  String downloadsCount(int count) {
    return '$count lượt tải xuống';
  }

  @override
  String get perfectMatch => 'Kết hợp hoàn hảo';

  @override
  String channelsCount(int count) {
    return '$count kênh';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Phụ đề từ xa $action yêu cầu quyền quản lý phụ đề Jellyfin cho người dùng này.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Không thể tìm thấy mục này trên máy chủ cho phụ đề từ xa $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Phụ đề từ xa $action không thành công: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Phụ đề từ xa $action không thành công (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Không thể tạo phụ đề từ xa $action.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'tất cả các tập đã tải xuống cho \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'tất cả các tập đã tải xuống trong phần này';

  @override
  String get stillWatching => 'Vẫn đang xem?';

  @override
  String get unableToLoadTrailerStream => 'Không thể tải luồng trailer.';

  @override
  String get trailerTimedOut =>
      'Đoạn giới thiệu đã hết thời gian chờ trong khi tải.';

  @override
  String get playbackFailedForTrailer =>
      'Không thể phát lại đoạn giới thiệu này.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Tính năng truyền không khả dụng khi phát lại ngoại tuyến.';

  @override
  String castActionFailed(String label, String error) {
    return '$label hành động không thành công: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Không thể đặt âm lượng truyền: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Điều khiển';
  }

  @override
  String get deviceVolume => 'Âm lượng thiết bị';

  @override
  String get unavailable => 'Không có sẵn';

  @override
  String get pause => 'Tạm dừng';

  @override
  String get syncPosition => 'Đồng bộ hóa vị trí';

  @override
  String stopCast(String label) {
    return 'Dừng $label';
  }

  @override
  String get queueIsEmpty => 'Hàng đợi trống';

  @override
  String trackNumber(int number) {
    return 'Theo dõi $number';
  }

  @override
  String get remotePlayback => 'Phát lại từ xa';

  @override
  String get castingToGoogleCast => 'Truyền tới Google Cast';

  @override
  String get castingViaAirPlay => 'Truyền qua AirPlay';

  @override
  String get castingViaDlna => 'Truyền qua DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds giây';
  }

  @override
  String get longPressToUnlock => 'Nhấn và giữ để mở khóa';

  @override
  String get off => 'Tắt';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Tự động';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Ghi đè tốc độ bit';

  @override
  String get audioDelay => 'Độ trễ âm thanh';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Độ trễ phụ đề';

  @override
  String get reset => 'Đặt lại';

  @override
  String get unknown => 'Không xác định';

  @override
  String get playbackInformation => 'Thông tin phát lại';

  @override
  String get playback => 'Phát lại';

  @override
  String get playMethod => 'Phương pháp chơi';

  @override
  String get directPlay => 'Chơi trực tiếp';

  @override
  String get directStream => 'Luồng trực tiếp';

  @override
  String get transcoding => 'Chuyển mã';

  @override
  String get transcodeReasons => 'Lý do chuyển mã';

  @override
  String get player => 'Trình phát';

  @override
  String get container => 'thùng chứa';

  @override
  String get bitrate => 'Tốc độ bit';

  @override
  String get video => 'Băng hình';

  @override
  String get resolution => 'Nghị quyết';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Bộ giải mã';

  @override
  String get videoBitrate => 'Tốc độ bit của video';

  @override
  String get track => 'Track';

  @override
  String get channels => 'Kênh';

  @override
  String get audioBitrate => 'Tốc độ bit âm thanh';

  @override
  String get sampleRate => 'Tỷ lệ mẫu';

  @override
  String get format => 'Định dạng';

  @override
  String get external => 'Bên ngoài';

  @override
  String get embedded => 'Đã nhúng';

  @override
  String castSessionError(String protocol) {
    return 'Lỗi phiên $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Không tải được chi tiết sách: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Kết xuất trong ứng dụng EPUB chưa khả dụng trên nền tảng này.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Định dạng này (.$extension) chưa thể hiển thị trong ứng dụng.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Kết xuất tài liệu nhúng không khả dụng trên nền tảng này.';

  @override
  String get couldNotOpenExternalViewer => 'Không thể mở trình xem bên ngoài.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Không mở được trình đọc trong ứng dụng: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Dấu trang đã được lưu tại $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Đã thêm dấu trang: $label';
  }

  @override
  String get noBookmarksYet =>
      'Chưa có dấu trang nào.\nNhấn vào biểu tượng dấu trang trong khi đọc để lưu vị trí của bạn.';

  @override
  String get noTableOfContentsAvailable => 'Không có mục lục';

  @override
  String pageLabel(int number) {
    return 'Trang $number';
  }

  @override
  String get position => 'Chức vụ';

  @override
  String get bookReader => 'Người đọc sách';

  @override
  String formatExtension(String extension) {
    return 'Định dạng: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% đã đọc';
  }

  @override
  String get updating => 'Đang cập nhật...';

  @override
  String get markUnread => 'Đánh dấu là chưa đọc';

  @override
  String get markAsRead => 'Đánh dấu là đã đọc';

  @override
  String get reloadReader => 'Tải lại trình đọc';

  @override
  String get noPagesFound => 'Không tìm thấy trang nào.';

  @override
  String get failedToDecodePageImage => 'Không giải mã được hình ảnh trang.';

  @override
  String resetZoom(String zoom) {
    return 'Đặt lại thu phóng (${zoom}x)';
  }

  @override
  String get singlePage => 'Trang đơn';

  @override
  String get twoPageSpread => 'Trải rộng hai trang';

  @override
  String get addBookmark => 'Thêm dấu trang';

  @override
  String get bookmarksEllipsis => 'Dấu trang...';

  @override
  String get markedAsRead => 'Đã đánh dấu là đã đọc';

  @override
  String get markedAsUnread => 'Đã đánh dấu là chưa đọc';

  @override
  String failedToUpdateReadState(String error) {
    return 'Không cập nhật được trạng thái đọc: $error';
  }

  @override
  String get themeSystem => 'Chủ đề: Hệ thống';

  @override
  String get themeLight => 'chủ đề: Ánh sáng';

  @override
  String get themeDark => 'Chủ đề: Bóng tối';

  @override
  String get themeSepia => 'Chủ đề: Màu nâu đỏ';

  @override
  String get invertColorsFixedLayout => 'Đảo ngược màu sắc (bố cục cố định)';

  @override
  String get invertColorsPdf => 'Đảo ngược màu sắc (PDF)';

  @override
  String get preparingInAppReader =>
      'Đang chuẩn bị trình đọc trong ứng dụng...';

  @override
  String get pdfDataNotAvailable => 'Dữ liệu PDF không có sẵn.';

  @override
  String get readerFallbackModeActive =>
      'Chế độ dự phòng đầu đọc đang hoạt động';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Nền tảng này không thể lưu trữ công cụ tài liệu được nhúng cho các tệp $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Sử dụng Tải lại Reader sau khi chuyển sang mục tiêu nền tảng được hỗ trợ (Android, iOS, macOS).';

  @override
  String get openExternally => 'Mở bên ngoài';

  @override
  String get noEpubChaptersFound => 'Không tìm thấy chương EPUB nào.';

  @override
  String get readerNotReady => 'Người đọc chưa sẵn sàng.';

  @override
  String get seriesRecordings => 'Bản ghi loạt phim';

  @override
  String get now => 'Hiện nay';

  @override
  String get sports => 'Thể thao';

  @override
  String get news => 'Tin tức';

  @override
  String get kids => 'trẻ em';

  @override
  String get premiere => 'Buổi ra mắt';

  @override
  String get guideTimeline => 'Dòng thời gian hướng dẫn';

  @override
  String failedToLoadGuide(String error) {
    return 'Không tải được hướng dẫn: $error';
  }

  @override
  String get noChannelsFound => 'Không tìm thấy kênh nào';

  @override
  String get liveBadge => 'SỐNG';

  @override
  String guideNextProgram(String time, String title) {
    return 'Tiếp theo: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Còn $minutes phút';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Còn $hours giờ';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Còn $hours giờ $minutes phút';
  }

  @override
  String get movie => 'Bộ phim';

  @override
  String get removedFromFavoriteChannels => 'Đã xóa khỏi kênh yêu thích';

  @override
  String get addedToFavoriteChannels => 'Đã thêm vào các kênh yêu thích';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Không cập nhật được kênh yêu thích';

  @override
  String get unfavoriteChannel => 'Kênh không yêu thích';

  @override
  String get favoriteChannel => 'Kênh yêu thích';

  @override
  String get record => 'Ghi hình';

  @override
  String get cancelRecordingAction => 'Hủy ghi âm';

  @override
  String get programSetToRecord => 'Chương trình được thiết lập để ghi';

  @override
  String get recordingCancelled => 'Đã hủy ghi âm';

  @override
  String get unableToCreateRecording => 'Không thể tạo bản ghi';

  @override
  String get watch => 'Xem';

  @override
  String get close => 'Đóng';

  @override
  String failedToPlayChannel(String name) {
    return 'Không chơi được $name';
  }

  @override
  String get failedToLoadRecordings => 'Không tải được bản ghi';

  @override
  String get scheduledInNext24Hours => 'Được lên lịch trong 24 giờ tới';

  @override
  String get recentRecordings => 'Bản ghi gần đây';

  @override
  String get tvSeries => 'phim truyền hình';

  @override
  String get failedToLoadSchedule => 'Không tải được lịch biểu';

  @override
  String get noScheduledRecordings => 'Không có bản ghi theo lịch trình';

  @override
  String get cancelRecording => 'Hủy ghi âm?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Hủy ghi âm theo lịch của \"$name\"?';
  }

  @override
  String get no => 'Không';

  @override
  String get yesCancel => 'Có, Hủy';

  @override
  String get failedToCancelRecording => 'Không thể hủy ghi âm';

  @override
  String get failedToLoadSeriesRecordings => 'Không tải được bản ghi loạt phim';

  @override
  String get noSeriesRecordings => 'Không có bản ghi hàng loạt';

  @override
  String get cancelSeriesRecording => 'Hủy ghi loạt phim';

  @override
  String get cancelSeriesRecordingQuestion => 'Hủy ghi loạt phim?';

  @override
  String stopRecordingName(String name) {
    return 'Dừng ghi \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Không thể hủy ghi loạt phim';

  @override
  String get searchThisLibrary => 'Tìm kiếm thư viện này...';

  @override
  String get searchEllipsis => 'Tìm kiếm...';

  @override
  String noResultsForQuery(String query) {
    return 'Không có kết quả nào cho \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Tìm kiếm không thành công: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Loại tài khoản Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Địa phương';

  @override
  String get savedMedia => 'Phương tiện đã lưu';

  @override
  String get tvShows => 'Chương trình truyền hình';

  @override
  String get music => 'Âm nhạc';

  @override
  String get musicAlbums => 'Album nhạc';

  @override
  String get noMediaInFilter => 'Không có phương tiện nào trong bộ lọc này';

  @override
  String get noDownloadedMediaYet => 'Chưa có phương tiện nào được tải xuống';

  @override
  String get browseLibrary => 'Duyệt thư viện';

  @override
  String get deleteDownload => 'Xóa tải xuống';

  @override
  String removeItemAndFiles(String name) {
    return 'Xóa \"$name\" và các tệp trong đó?';
  }

  @override
  String tracksCount(int count) {
    return 'bài hát $count';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Phát Anbom';

  @override
  String failedToLoadAlbum(String error) {
    return 'Không tải được album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Không tìm thấy bản nhạc đã tải xuống nào cho $name.';
  }

  @override
  String get season => 'Mùa';

  @override
  String get errorLoadingEpisodes => 'Lỗi tải tập';

  @override
  String get noDownloadedEpisodes => 'Không có tập nào được tải xuống';

  @override
  String get deleteEpisode => 'Xóa tập';

  @override
  String removeName(String name) {
    return 'Xóa \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes phút';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Tập $number';
  }

  @override
  String get seriesNotFound => 'Không tìm thấy loạt bài';

  @override
  String get errorLoadingSeries => 'Lỗi tải loạt bài';

  @override
  String get downloadedEpisodes => 'Các tập đã tải xuống';

  @override
  String seasonNumber(int number) {
    return 'Mùa $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Khuyến mãi';

  @override
  String get deleteSeason => 'Xóa phần';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Xóa tất cả các tập đã tải xuống trong $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tập',
      one: '1 tập',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Quản lý lưu trữ';

  @override
  String get storageBreakdown => 'Phân tích bộ nhớ';

  @override
  String get downloadedItems => 'Các mục đã tải xuống';

  @override
  String get storageLimit => 'Giới hạn lưu trữ';

  @override
  String get noLimit => 'Không giới hạn';

  @override
  String get deleteAllDownloads => 'Xóa tất cả tải xuống';

  @override
  String get deleteAllDownloadsWarning =>
      'Thao tác này sẽ xóa tất cả các tệp phương tiện đã tải xuống và không thể hoàn tác.';

  @override
  String get deleteAll => 'Xóa tất cả';

  @override
  String get deleteSelected => 'Xóa đã chọn';

  @override
  String deleteSelectedCount(int count) {
    return 'Xóa $count các mục đã tải xuống?';
  }

  @override
  String get musicAndAudiobooks => 'Âm nhạc & Sách nói';

  @override
  String get images => 'Hình ảnh';

  @override
  String get database => 'Cơ sở dữ liệu';

  @override
  String ofStorageLimit(String limit) {
    return 'giới hạn $limit';
  }

  @override
  String get settings => 'Cài đặt';

  @override
  String get authentication => 'Xác thực';

  @override
  String get autoLoginServerManagement => 'Tự động đăng nhập, quản lý máy chủ';

  @override
  String get pinCode => 'Mã PIN';

  @override
  String get setUpPinCodeProtection => 'Thiết lập bảo vệ mã PIN';

  @override
  String get parentalControls => 'Kiểm soát của phụ huynh';

  @override
  String get contentRatingRestrictions => 'Hạn chế xếp hạng nội dung';

  @override
  String get bitRateResolutionBehavior => 'Tốc độ bit, độ phân giải, hành vi';

  @override
  String get languageSizeAppearance => 'Ngôn ngữ, kích thước, hình thức';

  @override
  String get qualityStorage => 'Chất lượng, bảo quản';

  @override
  String get serverSyncAndPluginStatus =>
      'Đồng bộ hóa máy chủ và trạng thái plugin';

  @override
  String get mediaRequestIntegration => 'Tích hợp yêu cầu phương tiện';

  @override
  String get switchServer => 'Chuyển đổi máy chủ';

  @override
  String get signOut => 'Đăng xuất';

  @override
  String get versionLicenses => 'Phiên bản, giấy phép';

  @override
  String get account => 'Tài khoản';

  @override
  String get signInAndSecurity => 'Đăng nhập và bảo mật';

  @override
  String get administration => 'Sự quản lý';

  @override
  String get serverSettingsUsersLibraries =>
      'Cài đặt máy chủ, người dùng, thư viện';

  @override
  String get customization => 'Tùy chỉnh';

  @override
  String get themeAndLayout => 'Chủ đề và bố cục';

  @override
  String get videoAndSubtitles => 'Video và phụ đề';

  @override
  String get integrations => 'Tích hợp';

  @override
  String get pluginAndRequests => 'Plugin và yêu cầu';

  @override
  String get customizeAccountPlaybackInterface =>
      'Tùy chỉnh hành vi tài khoản, phát lại và giao diện';

  @override
  String optionsCount(int count) {
    return 'tùy chọn $count';
  }

  @override
  String get themeAndAppearance => 'Chủ đề & Giao diện';

  @override
  String get focusBorderColor => 'Màu viền tiêu điểm';

  @override
  String get watchedIndicators => 'Các chỉ số đã xem';

  @override
  String get always => 'Luôn luôn';

  @override
  String get hideUnwatched => 'Ẩn phần chưa xem';

  @override
  String get episodesOnly => 'Chỉ các tập';

  @override
  String get never => 'Không bao giờ';

  @override
  String get focusExpansionAnimation => 'Hoạt ảnh mở rộng tiêu điểm';

  @override
  String get desktopUiScale => 'Quy mô giao diện người dùng máy tính để bàn';

  @override
  String get scaleFocusedCards =>
      'Chia tỷ lệ thẻ và ô xếp tập trung hoặc di chuột';

  @override
  String get backgroundBackdrops => 'Phông Nền Nền';

  @override
  String get showBackdropImages =>
      'Hiển thị hình ảnh phông nền phía sau nội dung';

  @override
  String get seriesThumbnails => 'Hình thu nhỏ của loạt phim';

  @override
  String get seriesThumbnailsDescription =>
      'Chỉ các tập: sử dụng tác phẩm nghệ thuật của loạt phim phù hợp với từng loại hình ảnh hàng';

  @override
  String get homeRowInfoOverlay => 'Lớp phủ thông tin hàng đầu';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Hiển thị tiêu đề và siêu dữ liệu khi duyệt các hàng chủ';

  @override
  String get clockDisplay => 'Hiển thị đồng hồ';

  @override
  String get inMenus => 'Trong Menu';

  @override
  String get inVideo => 'Trong Video';

  @override
  String get seasonalEffects => 'Hiệu ứng theo mùa';

  @override
  String get seasonalEffectsDescription =>
      'Hiệu ứng hình ảnh và trang trí theo mùa';

  @override
  String get snow => 'Tuyết';

  @override
  String get fireworks => 'Pháo hoa';

  @override
  String get confetti => 'hoa giấy';

  @override
  String get fallingLeaves => 'Lá Rơi';

  @override
  String get themeMusic => 'Âm nhạc chủ đề';

  @override
  String get playThemeMusicOnDetailPages =>
      'Phát nhạc chủ đề trên các trang chi tiết';

  @override
  String get themeMusicVolume => 'Âm lượng nhạc chủ đề';

  @override
  String get themeMusicSettingsSubtitle =>
      'Trang chi tiết, hàng trang chủ và âm lượng';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Nhạc chủ đề trên Home Rows';

  @override
  String get playWhenBrowsingHomeScreen => 'Chơi khi duyệt màn hình chính';

  @override
  String get loopThemeMusic => 'Lặp nhạc chủ đề';

  @override
  String get loopThemeMusicSubtitle =>
      'Lặp lại bản nhạc thay vì chỉ phát một lần';

  @override
  String get detailsBackgroundBlur => 'Chi tiết Làm mờ nền';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Làm mờ nền duyệt web';

  @override
  String get maxStreamingBitrate => 'Tốc độ truyền phát tối đa';

  @override
  String get maxResolution => 'Độ phân giải tối đa';

  @override
  String get playerZoomMode => 'Chế độ thu phóng trình phát';

  @override
  String get settingsScrollWheelAction => 'Con lăn chuột';

  @override
  String get settingsScrollWheelActionDescription =>
      'Chọn hành động khi lăn chuột trên video trong lúc phát.';

  @override
  String get scrollWheelActionOff => 'Tắt';

  @override
  String get scrollWheelActionSeek => 'Tua (tiến / lùi)';

  @override
  String get scrollWheelActionVolume => 'Âm lượng';

  @override
  String get playerTooltipVolume => 'Âm lượng';

  @override
  String get fit => 'Phù hợp';

  @override
  String get autoCrop => 'Tự động cắt';

  @override
  String get stretch => 'Kéo dài';

  @override
  String get refreshRateSwitching => 'Chuyển đổi tốc độ làm mới';

  @override
  String get disabled => 'Đã tắt';

  @override
  String get scaleOnTv => 'Cân trên TV';

  @override
  String get scaleOnDevice => 'Chia tỷ lệ trên thiết bị';

  @override
  String get trickPlay => 'Chơi lừa';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Hiển thị hình thu nhỏ xem trước khi tìm kiếm';

  @override
  String get showDescriptionOnPause => 'Hiển thị mô tả khi tạm dừng';

  @override
  String get dimVideoShowOverview =>
      'Làm mờ video và hiển thị văn bản tổng quan khi bị tạm dừng';

  @override
  String get osdLockButton => 'Nút khóa OSD';

  @override
  String get osdLockButtonDescription =>
      'Hiển thị nút khóa chặn đầu vào cảm ứng cho đến khi được nhấn và giữ';

  @override
  String get audioBehavior => 'Hành vi âm thanh';

  @override
  String get downmixToStereo => 'Downmix sang âm thanh nổi';

  @override
  String get defaultAudioLanguage => 'Ngôn ngữ âm thanh mặc định';

  @override
  String get fallbackAudioLanguage => 'Ngôn ngữ âm thanh dự phòng';

  @override
  String get preferDefaultAudioTrack => 'Ưu tiên bản âm thanh mặc định';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Ưu tiên bản âm thanh gốc thay vì bản lồng tiếng.';

  @override
  String get preferAudioDescription => 'Ưu tiên bản thuyết minh mô tả';

  @override
  String get preferAudioDescriptionDescription =>
      'Ưu tiên bản thuyết minh mô tả thay vì bản âm thanh thường.';

  @override
  String get transcodingAudio => 'Chuyển mã (Âm thanh)';

  @override
  String get directStreamRemux => 'Truyền trực tiếp (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Chuyển mã (Tốc độ bit hoặc Độ phân giải)';

  @override
  String get transcodingVideoAndAudio => 'Chuyển mã (Video & Âm thanh)';

  @override
  String get transcodingVideo => 'Chuyển mã (Video)';

  @override
  String get autoServerDefault => 'Tự động (Mặc định máy chủ)';

  @override
  String get english => 'Tiếng Anh';

  @override
  String get spanish => 'tiếng Tây Ban Nha';

  @override
  String get french => 'người Pháp';

  @override
  String get german => 'tiếng Đức';

  @override
  String get italian => 'người Ý';

  @override
  String get portuguese => 'tiếng Bồ Đào Nha';

  @override
  String get japanese => 'tiếng Nhật';

  @override
  String get korean => 'Tiếng Hàn';

  @override
  String get chinese => 'Tiếng Trung';

  @override
  String get russian => 'tiếng Nga';

  @override
  String get arabic => 'tiếng Ả Rập';

  @override
  String get hindi => 'Tiếng Hindi';

  @override
  String get dutch => 'tiếng Hà Lan';

  @override
  String get swedish => 'tiếng Thụy Điển';

  @override
  String get norwegian => 'người Na Uy';

  @override
  String get danish => 'tiếng Đan Mạch';

  @override
  String get finnish => 'tiếng Phần Lan';

  @override
  String get polish => 'Đánh bóng';

  @override
  String get ac3Passthrough => 'Truyền qua AC3';

  @override
  String get dtsPassthrough => 'Truyền qua DTS';

  @override
  String get trueHdSupport => 'Hỗ trợ TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Chỉ âm thanh DTS dòng bit đến AVR; yêu cầu hỗ trợ máy thu và theo dõi nguồn DTS';

  @override
  String get enableTrueHdAudio =>
      'Bật âm thanh TrueHD (có thể không hoạt động trên tất cả các nền tảng)';

  @override
  String get settingsAudioOutputMode => 'Chế độ đầu ra âm thanh';

  @override
  String get settingsAudioOutputModeDescription =>
      'Chọn cách giải mã âm thanh. AVR Passthrough gửi luồng Dolby/DTS thô đến bộ thu của bạn; Tự động hoặc Trộn xuống sẽ giải mã ngay trên thiết bị.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Truyền qua AVR';

  @override
  String get settingsAudioFallbackCodec => 'Codec dự phòng âm thanh';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Chọn định dạng đích để chuyển mã âm thanh đa kênh khi luồng gốc không thể phát trực tiếp hoặc truyền thẳng.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Tự động nhận diện\n(Khuyên dùng)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Mặc định)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Không mất dữ liệu)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Chỉ Stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Hiệu quả)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Không mất dữ liệu)';

  @override
  String get settingsMaxAudioChannels => 'Số kênh âm thanh tối đa';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Thiết lập số kênh tối đa của hệ thống âm thanh của bạn. Các luồng đa kênh vượt quá giới hạn này sẽ được trộn xuống hoặc chuyển mã.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Tự động nhận diện\n(Mặc định phần cứng)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Vòm';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadraphonic';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Vòm';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Vòm';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Vòm';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Vòm';

  @override
  String get settingsAudioPassthroughAdvanced => 'Truyền qua (Nâng cao)';

  @override
  String get settingsAudioCodecPassthrough => 'Truyền qua Codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Chỉ kích hoạt các định dạng mà bồn AVR hoặc HDMI của bạn hỗ trợ.';

  @override
  String get settingsAudioEac3Passthrough => 'Truyền qua EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Truyền qua EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'Truyền qua lõi DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'Truyền qua DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Truyền qua TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Truyền thẳng TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dòng bit Dolby Digital Plus (EAC3) tới bộ giải mã bên ngoài.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Dòng bit Dolby Atmos qua EAC3 (JOC) tới bộ giải mã bên ngoài.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Dòng bit DTS-HD MA (bao gồm lõi DTS) tới bộ giải mã bên ngoài.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Dòng bit Dolby TrueHD với siêu dữ liệu Atmos tới bộ giải mã bên ngoài.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Khả năng âm thanh được phát hiện';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Chưa có ảnh chụp nhanh khả năng thời gian chạy.';

  @override
  String get settingsAudioRouteLabel => 'Tuyến đường';

  @override
  String get settingsAudioDecodeLabel => 'Giải mã';

  @override
  String get settingsAudioPassthroughLabel => 'Truyền qua';

  @override
  String get settingsAudioHdRoute => 'Tuyến âm thanh HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Loa';

  @override
  String get settingsAudioRouteHeadphones => 'Tai nghe';

  @override
  String settingsAudioPcmChannels(int count) {
    return 'PCM $count kênh';
  }

  @override
  String get settingsAudioDiagnostics => 'Chẩn đoán';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Cấp độ video';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Phạm vi video';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Codec phụ đề';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Codec âm thanh được phép';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Bộ giải mã âm thanh HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Bộ giải mã âm thanh HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'truyền qua âm thanh-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Tuyến âm thanh hoạt động';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Định tuyến hỗ trợ âm thanh HD';

  @override
  String get nightMode => 'Chế độ ban đêm';

  @override
  String get compressDynamicRange => 'Nén phạm vi động';

  @override
  String get advancedMpv => 'mpv nâng cao';

  @override
  String get enableCustomMpvConf => 'Bật mpv.conf tùy chỉnh';

  @override
  String get applyMpvConfBeforePlayback =>
      'Áp dụng mpv.conf do người dùng chỉ định trước khi bắt đầu phát lại';

  @override
  String get unsafeAdvancedMpvOptions => 'Tùy chọn mpv nâng cao không an toàn';

  @override
  String get unsafeMpvOptionsDescription =>
      'Cho phép nhiều tùy chọn mpv hơn. Có thể phá vỡ hành vi phát lại.';

  @override
  String get hardwareDecoding => 'Giải mã phần cứng';

  @override
  String get hardwareDecodingSubtitle =>
      'Có thể cải thiện hiệu suất nhưng có thể gây ra sự cố phát lại trên một số thiết bị.';

  @override
  String get nextUpAndQueuing => 'Tiếp theo & Xếp hàng';

  @override
  String get nextUpDisplay => 'Tiếp theo Hiển thị';

  @override
  String get extended => 'Mở rộng';

  @override
  String get minimal => 'Tối thiểu';

  @override
  String get nextUpTimeout => 'Hết thời gian chờ tiếp theo';

  @override
  String secondsValue(int value) {
    return '$value giây';
  }

  @override
  String get mediaQueuing => 'Xếp hàng phương tiện';

  @override
  String get autoQueueNextEpisodes => 'Tự động xếp hàng các tập tiếp theo';

  @override
  String get stillWatchingPrompt => 'Vẫn đang xem Lời nhắc';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Sau các tập $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Tiếp tục & Bỏ qua';

  @override
  String get resumeRewind => 'Tiếp tục tua lại';

  @override
  String get unpauseRewind => 'Bỏ tạm dừng Tua lại';

  @override
  String get fiveSeconds => '5 giây';

  @override
  String get tenSeconds => '10 giây';

  @override
  String get fifteenSeconds => '15 giây';

  @override
  String get thirtySeconds => '30 giây';

  @override
  String get skipBackLength => 'Bỏ qua chiều dài quay lại';

  @override
  String get skipForwardLength => 'Bỏ qua chiều dài chuyển tiếp';

  @override
  String get customMpvConfPath => 'Đường dẫn mpv.conf tùy chỉnh';

  @override
  String get notSetMpvConf =>
      'Chưa được thiết lập. Moonfin sẽ thử mpv.conf mặc định trong thư mục ứng dụng/dữ liệu.';

  @override
  String get selectMpvConf => 'Chọn mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Cài đặt kiểu (kích thước, màu sắc, độ lệch) áp dụng cho phụ đề dựa trên văn bản (SRT, VTT, TTML). Phụ đề ASS/SSA sử dụng kiểu nhúng riêng trừ khi tắt \"ASS/SSA Direct Play\". Không thể thiết kế lại phụ đề bitmap (PGS, DVB, VobSub).';

  @override
  String get defaultSubtitleLanguage => 'Ngôn ngữ phụ đề mặc định';

  @override
  String get defaultToNoSubtitles => 'Mặc định là Không có phụ đề';

  @override
  String get turnOffSubtitlesByDefault => 'Tắt phụ đề theo mặc định';

  @override
  String get subtitleSize => 'Kích thước phụ đề';

  @override
  String get textFillColor => 'Màu tô văn bản';

  @override
  String get backgroundColor => 'Màu nền';

  @override
  String get textStrokeColor => 'Màu nét văn bản';

  @override
  String get subtitleCustomization => 'Tùy chỉnh phụ đề';

  @override
  String get subtitleCustomizationDescription => 'Tùy chỉnh giao diện phụ đề';

  @override
  String get subtitleMode => 'Chế độ phụ đề';

  @override
  String get subtitleModeFlagged => 'Theo đánh dấu';

  @override
  String get subtitleModeAlways => 'Luôn luôn';

  @override
  String get subtitleModeForeign => 'Tiếng nước ngoài';

  @override
  String get subtitleModeForced => 'Bắt buộc';

  @override
  String get subtitleModeFlaggedDescription =>
      'Phát các bản được đánh dấu \"default\" hoặc \"forced\" trong siêu dữ liệu của tệp phương tiện.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Tự động tải và hiển thị phụ đề mỗi khi bắt đầu phát video.';

  @override
  String get subtitleModeForeignDescription =>
      'Tự động bật phụ đề nếu bản âm thanh mặc định là tiếng nước ngoài.';

  @override
  String get subtitleModeForcedDescription =>
      'Chỉ tải phụ đề được gắn cờ siêu dữ liệu forced.';

  @override
  String get subtitleModeNoneDescription =>
      'Tắt hoàn toàn việc tự động tải phụ đề.';

  @override
  String get fallbackSubtitleLanguage => 'Ngôn ngữ phụ đề dự phòng';

  @override
  String get subtitleStream => 'Luồng phụ đề';

  @override
  String get subtitlePreviewText => 'Cáo nâu nhanh nhẹn nhảy qua chó lười';

  @override
  String get verticalOffset => 'Bù theo chiều dọc';

  @override
  String get pgsDirectPlay => 'Chơi trực tiếp PGS';

  @override
  String get directPlayPgsSubtitles => 'Phát trực tiếp phụ đề PGS';

  @override
  String get assSsaDirectPlay => 'Chơi trực tiếp ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'Phát trực tiếp phụ đề ASS/SSA';

  @override
  String get white => 'Trắng';

  @override
  String get black => 'Đen';

  @override
  String get yellow => 'Màu vàng';

  @override
  String get green => 'Màu xanh lá';

  @override
  String get cyan => 'lục lam';

  @override
  String get red => 'Màu đỏ';

  @override
  String get transparent => 'Minh bạch';

  @override
  String get semiTransparentBlack => 'Màu đen bán trong suốt';

  @override
  String get global => 'Toàn cầu';

  @override
  String get desktop => 'Máy tính để bàn';

  @override
  String get mobile => 'Điện thoại di động';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Đã tải cài đặt cấu hình $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Không tải được cài đặt hồ sơ $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Đã đồng bộ hóa cài đặt cục bộ với hồ sơ $profile.';
  }

  @override
  String get customizationProfile => 'Hồ sơ tùy chỉnh';

  @override
  String get customizationProfileDescription =>
      'Chọn hồ sơ để tải, chỉnh sửa và đồng bộ hóa. Toàn cầu áp dụng ở mọi nơi trừ khi hồ sơ thiết bị ghi đè lên nó. Dấu chấm màu xanh lá cây đánh dấu hồ sơ thiết bị hiện tại của bạn.';

  @override
  String get loadProfile => 'Tải hồ sơ';

  @override
  String get syncing => 'Đang đồng bộ hóa...';

  @override
  String get syncToProfile => 'Đồng bộ hóa với hồ sơ';

  @override
  String get profileSyncHidden => 'Đồng bộ hóa hồ sơ bị ẩn';

  @override
  String get enablePluginSyncDescription =>
      'Bật Đồng bộ hóa plugin máy chủ trong cài đặt Plugin để hiển thị các điều khiển cấu hình tại đây.';

  @override
  String get quality => 'Chất lượng';

  @override
  String get defaultDownloadQuality => 'Chất lượng tải xuống mặc định';

  @override
  String get network => 'Mạng';

  @override
  String get wifiOnlyDownloads => 'Tải xuống chỉ qua Wi-Fi';

  @override
  String get reportDownloadsActivity => 'Hiển thị lượt tải xuống trên máy chủ';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Cho phép quản trị viên máy chủ xem các lượt tải xuống đã chuyển mã của bạn trong bảng điều khiển';

  @override
  String get onlyDownloadOnWifi => 'Chỉ tải xuống khi kết nối với WiFi';

  @override
  String get storage => 'Kho';

  @override
  String get storageUsed => 'Bộ nhớ đã sử dụng';

  @override
  String get manage => 'Quản lý';

  @override
  String get calculating => 'Đang tính...';

  @override
  String get downloadLocation => 'Vị trí tải xuống';

  @override
  String get defaultLabel => 'Mặc định';

  @override
  String get saveToDownloadsFolder => 'Lưu vào thư mục Tải xuống';

  @override
  String get downloadsVisibleToOtherApps =>
      'Tải xuống/Moonfin - hiển thị với các ứng dụng khác';

  @override
  String get dangerZone => 'Vùng nguy hiểm';

  @override
  String get clearAllDownloads => 'Xóa tất cả tải xuống';

  @override
  String get original => 'Nguyên bản';

  @override
  String get changeDownloadLocation => 'Thay đổi vị trí tải xuống';

  @override
  String get changeDownloadLocationDescription =>
      'Các bản tải xuống mới sẽ được lưu vào thư mục đã chọn. Các nội dung tải xuống hiện tại sẽ vẫn ở vị trí hiện tại và có thể được quản lý từ cài đặt Bộ nhớ.';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get cannotWriteToFolder =>
      'Không thể ghi vào thư mục đã chọn. Vui lòng chọn một vị trí khác hoặc cấp quyền lưu trữ.';

  @override
  String get saveToDownloadsFolderQuestion => 'Lưu vào thư mục Tải xuống?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Phương tiện đã tải xuống sẽ được lưu vào Tải xuống/Moonfin trên thiết bị của bạn. Các tệp này sẽ hiển thị với các ứng dụng khác như thư viện hoặc trình phát nhạc của bạn.\n\nCác bản tải xuống hiện tại sẽ vẫn ở vị trí hiện tại của chúng.';

  @override
  String get enable => 'Cho phép';

  @override
  String get clearAllDownloadsWarning =>
      'Thao tác này sẽ xóa tất cả phương tiện đã tải xuống và không thể hoàn tác.';

  @override
  String get clearAll => 'Xóa tất cả';

  @override
  String get navigationStyle => 'Kiểu điều hướng';

  @override
  String get topBar => 'Thanh trên cùng';

  @override
  String get leftSidebar => 'Thanh bên trái';

  @override
  String get showShuffleButton => 'Hiển thị nút ngẫu nhiên';

  @override
  String get showGenresButton => 'Nút hiển thị thể loại';

  @override
  String get showFavoritesButton => 'Hiển thị nút yêu thích';

  @override
  String get showLibrariesInToolbar => 'Hiển thị Thư viện trong Thanh công cụ';

  @override
  String get navbarAlwaysExpanded => 'Luôn hiển thị nhãn thanh điều hướng';

  @override
  String get showSeerrButton => 'Hiển thị nút Seerr';

  @override
  String get navbarOpacity => 'Độ mờ của thanh điều hướng';

  @override
  String get navbarColor => 'Màu thanh điều hướng';

  @override
  String get gray => 'Xám';

  @override
  String get darkBlue => 'Xanh đậm';

  @override
  String get purple => 'Màu tím';

  @override
  String get teal => 'màu xanh mòng két';

  @override
  String get navy => 'hải quân';

  @override
  String get charcoal => 'Than';

  @override
  String get brown => 'Màu nâu';

  @override
  String get darkRed => 'Màu đỏ sẫm';

  @override
  String get darkGreen => 'Xanh đậm';

  @override
  String get slate => 'Đá phiến';

  @override
  String get indigo => 'màu chàm';

  @override
  String get libraryDisplay => 'Hiển thị thư viện';

  @override
  String get posterLabel => 'Áp phích';

  @override
  String get thumbnailLabel => 'Hình thu nhỏ';

  @override
  String get bannerLabel => 'Ngọn cờ';

  @override
  String get overridePerLibrarySettings => 'Ghi đè cài đặt trên mỗi thư viện';

  @override
  String get applyImageTypeToAllLibraries =>
      'Áp dụng loại hình ảnh cho tất cả các thư viện';

  @override
  String get multiServerLibraries => 'Thư viện nhiều máy chủ';

  @override
  String get showLibrariesFromAllServers =>
      'Hiển thị thư viện từ tất cả các máy chủ được kết nối';

  @override
  String get enableFolderView => 'Bật chế độ xem thư mục';

  @override
  String get showFolderBrowsingOption => 'Hiển thị tùy chọn duyệt thư mục';

  @override
  String get groupItemsIntoCollections => 'Nhóm các mục thành bộ sưu tập';

  @override
  String get hideCollectionAssociatedItems =>
      'Ẩn các mục thuộc bộ sưu tập khi duyệt thư viện';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'Lưu ý về nhóm thư viện';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Để dùng thiết lập này, hãy đảm bảo các tùy chọn thư viện \"Group movies into collections\" và/hoặc \"Group shows into collections\" đã được bật trong phần cài đặt Hiển thị của thư viện trên máy chủ Jellyfin hoặc Emby của bạn.';

  @override
  String get libraryVisibility => 'Hiển thị thư viện';

  @override
  String get libraryVisibilityDescription =>
      'Chuyển đổi khả năng hiển thị trang chủ cho mỗi thư viện. Khởi động lại Moonfin để các thay đổi có hiệu lực.';

  @override
  String get showInNavigation => 'Hiển thị trong điều hướng';

  @override
  String get showInLatestMedia =>
      'Hiển thị trên phương tiện truyền thông mới nhất';

  @override
  String get sourceLibraries => 'Thư viện nguồn';

  @override
  String get sourceCollections => 'Bộ sưu tập nguồn';

  @override
  String get excludedGenres => 'Thể loại bị loại trừ';

  @override
  String get selectAll => 'Chọn tất cả';

  @override
  String itemsSelected(int count) {
    return '$count đã chọn';
  }

  @override
  String get mediaBar => 'Thanh truyền thông';

  @override
  String get mediaSources => 'Nguồn truyền thông';

  @override
  String get behavior => 'Hành vi';

  @override
  String get seconds => 'giây';

  @override
  String get localPreviews => 'Bản xem trước cục bộ';

  @override
  String get localPreviewsDescription =>
      'Định cấu hình xem trước đoạn giới thiệu, phương tiện và âm thanh.';

  @override
  String get mediaBarMode => 'Kiểu thanh phương tiện';

  @override
  String get mediaBarModeDescription =>
      'Chọn giữa Moonfin, MakD hoặc tắt thanh phương tiện';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Tắt';

  @override
  String get enableMediaBar => 'Bật thanh phương tiện';

  @override
  String get showFeaturedContentSlideshow =>
      'Trình chiếu nội dung nổi bật trên trang chủ';

  @override
  String get contentType => 'Loại nội dung';

  @override
  String get moviesAndTvShows => 'Phim & Chương trình truyền hình';

  @override
  String get moviesOnly => 'Chỉ phim';

  @override
  String get tvShowsOnly => 'Chỉ chương trình truyền hình';

  @override
  String get itemCount => 'Số lượng vật phẩm';

  @override
  String get noneSelected => 'Không có lựa chọn nào';

  @override
  String get noneExcluded => 'Không loại trừ';

  @override
  String get autoAdvance => 'Tự động nâng cao';

  @override
  String get autoAdvanceSlides => 'Tự động chuyển sang slide tiếp theo';

  @override
  String get autoAdvanceInterval => 'Khoảng thời gian tự động nâng cao';

  @override
  String get trailerPreview => 'Xem trước đoạn giới thiệu';

  @override
  String get autoPlayTrailers =>
      'Tự động phát đoạn giới thiệu trên thanh phương tiện sau 3 giây';

  @override
  String get trailerAudio => 'Âm thanh trailer';

  @override
  String get enableTrailerAudio =>
      'Bật âm thanh cho trailer trong thanh phương tiện';

  @override
  String get episodePreview => 'Xem trước tập';

  @override
  String get mediaPreview => 'Xem trước phương tiện';

  @override
  String get episodePreviewDescription =>
      'Phát bản xem trước nội tuyến dài 30 giây trên các thẻ được tập trung, di chuột hoặc nhấn lâu';

  @override
  String get mediaPreviewDescription =>
      'Phát bản xem trước nội tuyến dài 30 giây trên các thẻ được tập trung, di chuột hoặc nhấn lâu';

  @override
  String get previewAudio => 'Xem trước âm thanh';

  @override
  String get enablePreviewAudio =>
      'Bật âm thanh để xem trước đoạn giới thiệu và tập';

  @override
  String get latestMedia => 'Phương tiện truyền thông mới nhất';

  @override
  String get recentlyReleased => 'Mới phát hành';

  @override
  String get myMedia => 'Phương tiện của tôi';

  @override
  String get myMediaSmall => 'Phương tiện của tôi (Nhỏ)';

  @override
  String get continueWatching => 'Tiếp tục xem';

  @override
  String get resumeAudio => 'Tiếp tục âm thanh';

  @override
  String get resumeBooks => 'Tiếp tục sách';

  @override
  String get activeRecordings => 'Bản ghi hoạt động';

  @override
  String get playlists => 'Danh sách phát';

  @override
  String get liveTV => 'Truyền hình trực tiếp';

  @override
  String get homeSections => 'Trang chủ';

  @override
  String get resetToDefaults => 'Đặt lại về mặc định';

  @override
  String get homeRowPosterSize => 'Kích thước áp phích hàng đầu';

  @override
  String get perRowImageTypeSelection => 'Lựa chọn loại hình ảnh trên mỗi hàng';

  @override
  String get configureImageTypeForEachRow =>
      'Định cấu hình loại hình ảnh cho từng hàng chủ được bật';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Hợp nhất Tiếp tục xem và tiếp theo';

  @override
  String get combineBothRows =>
      'Kết hợp cả hai hàng thành một phần nhà duy nhất';

  @override
  String get fullScreenRows => 'Hàng trang chủ mở rộng';

  @override
  String get fullScreenRowsDescription =>
      'Giới hạn còn 1 hàng trang chủ mỗi màn hình';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Loại hình ảnh trên mỗi hàng';

  @override
  String get perRowSettings => 'Cài đặt mỗi hàng';

  @override
  String get autoLogin => 'Tự động đăng nhập';

  @override
  String get lastUser => 'Người dùng cuối cùng';

  @override
  String get currentUser => 'Người dùng hiện tại';

  @override
  String get alwaysAuthenticate => 'Luôn xác thực';

  @override
  String get requirePasswordWithToken =>
      'Yêu cầu mật khẩu ngay cả với mã thông báo được lưu trữ';

  @override
  String get confirmExit => 'Xác nhận Thoát';

  @override
  String get showConfirmationBeforeExiting =>
      'Hiển thị xác nhận trước khi thoát';

  @override
  String get blockContentWithRatings => 'Chặn nội dung có xếp hạng sau:';

  @override
  String get noContentRatingsFound =>
      'Chưa có xếp hạng nội dung nào được tìm thấy trên máy chủ này.';

  @override
  String get couldNotLoadServerRatings =>
      'Không thể tải xếp hạng máy chủ. Chỉ hiển thị xếp hạng đã lưu.';

  @override
  String get couldNotRefreshRatings =>
      'Không thể làm mới xếp hạng từ máy chủ. Hiển thị xếp hạng đã lưu.';

  @override
  String get enablePinCode => 'Kích hoạt mã PIN';

  @override
  String get requirePinToAccess =>
      'Yêu cầu mã PIN để truy cập tài khoản của bạn';

  @override
  String get changePin => 'Thay đổi mã PIN';

  @override
  String get setNewPinCode => 'Đặt mã PIN mới';

  @override
  String get removePin => 'Xóa mã PIN';

  @override
  String get removePinProtection => 'Loại bỏ bảo vệ mã PIN';

  @override
  String get screensaver => 'Trình bảo vệ màn hình';

  @override
  String get inAppScreensaver => 'Trình bảo vệ màn hình trong ứng dụng';

  @override
  String get enableBuiltInScreensaver =>
      'Kích hoạt trình bảo vệ màn hình tích hợp';

  @override
  String get mode => 'Chế độ';

  @override
  String get libraryArt => 'Thư viện nghệ thuật';

  @override
  String get logo => 'biểu tượng';

  @override
  String get clock => 'Cái đồng hồ';

  @override
  String get timeout => 'Hết giờ';

  @override
  String minutesShort(int minutes) {
    return '$minutes phút';
  }

  @override
  String get dimmingLevel => 'Mức độ mờ';

  @override
  String get maxAgeRating => 'Xếp hạng độ tuổi tối đa';

  @override
  String get any => 'Bất kì';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Yêu cầu xếp hạng độ tuổi';

  @override
  String get onlyShowRatedContent => 'Chỉ hiển thị nội dung được xếp hạng';

  @override
  String get showClock => 'Hiển thị đồng hồ';

  @override
  String get displayClockDuringScreensaver =>
      'Hiển thị đồng hồ trong khi bảo vệ màn hình';

  @override
  String get clockModeStatic => 'Cố định';

  @override
  String get clockModeBouncing => 'Chuyển động';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Nhà phê bình)';

  @override
  String get rottenTomatoesAudience => 'Cà chua thối (Khán giả)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (Người dùng)';

  @override
  String get trakt => 'trakt';

  @override
  String get letterboxd => 'Hộp thưd';

  @override
  String get myAnimeList => 'Danh sách Anime của tôi';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Đánh giá cộng đồng';

  @override
  String get ratings => 'Xếp hạng';

  @override
  String get additionalRatings => 'Xếp hạng bổ sung';

  @override
  String get showMdbListAndTmdbRatings => 'Hiển thị xếp hạng MDBList và TMDB';

  @override
  String get ratingLabels => 'Nhãn xếp hạng';

  @override
  String get showLabelsNextToIcons =>
      'Hiển thị nhãn bên cạnh biểu tượng xếp hạng';

  @override
  String get ratingBadges => 'Huy hiệu xếp hạng';

  @override
  String get showDecorativeBadges =>
      'Hiển thị huy hiệu trang trí phía sau xếp hạng';

  @override
  String get episodeRatings => 'Xếp hạng tập';

  @override
  String get showRatingsOnEpisodes =>
      'Hiển thị xếp hạng trên từng tập riêng lẻ';

  @override
  String get ratingSources => 'Nguồn xếp hạng';

  @override
  String get ratingSourcesDescription =>
      'Bật và sắp xếp lại các nguồn xếp hạng được hiển thị trên toàn bộ ứng dụng';

  @override
  String get pluginLabel => 'Plugin Moonbase';

  @override
  String get pluginDetected => 'Đã phát hiện plugin';

  @override
  String get pluginNotDetected => 'Plugin không được phát hiện';

  @override
  String get pluginDetectedDescription =>
      'Đã phát hiện plugin máy chủ. Đồng bộ hóa được bật tự động khi tìm thấy plugin lần đầu tiên.';

  @override
  String get pluginNotDetectedDescription =>
      'Plugin máy chủ hiện không được phát hiện. Cài đặt cục bộ vẫn sử dụng các giá trị đã lưu hoặc mặc định tích hợp.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nPhiên bản: $version';
  }

  @override
  String get availableServices => 'Dịch vụ có sẵn';

  @override
  String get serverPluginSync => 'Đồng bộ hóa plugin máy chủ';

  @override
  String get syncSettingsWithPlugin => 'Đồng bộ hóa cài đặt với plugin máy chủ';

  @override
  String get whatSyncControls => 'Điều khiển đồng bộ hóa nào';

  @override
  String get syncControlsDescription =>
      'Đồng bộ hóa chỉ kiểm soát xem các cài đặt hỗ trợ plugin có được đẩy tới và lấy ra khỏi máy chủ hay không. Hành động lựa chọn hồ sơ và đồng bộ hóa hồ sơ nằm trong cài đặt Tùy chỉnh khi bật đồng bộ hóa plugin.';

  @override
  String get recentRequests => 'Yêu cầu gần đây';

  @override
  String get recentlyAdded => 'Đã thêm gần đây';

  @override
  String get trending => 'Xu hướng';

  @override
  String get popularMovies => 'Phim nổi tiếng';

  @override
  String get movieGenres => 'Thể loại phim';

  @override
  String get upcomingMovies => 'Phim sắp ra mắt';

  @override
  String get studios => 'Phim trường';

  @override
  String get popularSeries => 'Loạt phim nổi tiếng';

  @override
  String get seriesGenres => 'Thể loại phim';

  @override
  String get upcomingSeries => 'Loạt phim sắp tới';

  @override
  String get networks => 'Mạng';

  @override
  String get seerrDiscoveryRows => 'Hàng khám phá Seerr';

  @override
  String get resetRowsToDefaults => 'Đặt lại các hàng về mặc định';

  @override
  String get enableSeerr => 'Bật Seerr';

  @override
  String get showSeerrInNavigation =>
      'Hiển thị Seerr trong điều hướng (yêu cầu plugin máy chủ)';

  @override
  String get seerrUnavailable =>
      'Không khả dụng vì hỗ trợ plugin máy chủ Seerr bị tắt.';

  @override
  String get nsfwFilter => 'Bộ lọc NSFW';

  @override
  String get hideAdultContent => 'Ẩn nội dung người lớn trong kết quả';

  @override
  String get seerrNotificationsSection => 'Thông báo';

  @override
  String get seerrNotifyNewRequestsTitle => 'Thông báo yêu cầu mới';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Báo cho tôi khi có người gửi yêu cầu';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Cập nhật yêu cầu';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Đã duyệt, bị từ chối và đã thêm vào thư viện của bạn';

  @override
  String get seerrNotifyIssuesTitle => 'Cập nhật sự cố';

  @override
  String get seerrNotifyIssuesSubtitle => 'Sự cố mới, phản hồi và cách xử lý';

  @override
  String loggedInAs(String username) {
    return 'Đã đăng nhập với tên: $username';
  }

  @override
  String get discoverRows => 'Trang khám phá Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Bật các hàng muốn hiển thị trên trang chính Seerr. Kéo để sắp xếp lại. Thứ tự tùy chỉnh sẽ đồng bộ với Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Bật các hàng muốn hiển thị trên trang chính Seerr. Kéo để sắp xếp lại. Thứ tự tùy chỉnh sẽ đồng bộ với Moonbase.';

  @override
  String get enabled => 'Đã bật';

  @override
  String get hidden => 'Ẩn giấu';

  @override
  String get aboutTitle => 'Về';

  @override
  String versionValue(String version) {
    return 'Phiên bản $version';
  }

  @override
  String get openSourceLicenses => 'Giấy phép nguồn mở';

  @override
  String get sourceCode => 'Mã nguồn';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Kiểm tra cập nhật ngay bây giờ';

  @override
  String get checksLatestDesktopRelease =>
      'Kiểm tra bản phát hành máy tính để bàn mới nhất cho nền tảng này';

  @override
  String get youAreUpToDate => 'Bạn đã được cập nhật.';

  @override
  String get couldNotCheckForUpdates =>
      'Không thể kiểm tra các bản cập nhật ngay bây giờ.';

  @override
  String get noCompatibleUpdate =>
      'Không tìm thấy gói cập nhật tương thích cho nền tảng này.';

  @override
  String get updateChecksNotSupported =>
      'Kiểm tra cập nhật không được hỗ trợ trên nền tảng này.';

  @override
  String get updateNotificationsDisabled => 'Thông báo cập nhật bị tắt.';

  @override
  String get pleaseWaitBeforeChecking => 'Vui lòng đợi trước khi kiểm tra lại.';

  @override
  String get latestUpdateAlreadyShown => 'Cập nhật mới nhất đã được hiển thị.';

  @override
  String get updateAvailable => 'Cập nhật có sẵn.';

  @override
  String updateAvailableVersion(String version) {
    return 'Đã có bản cập nhật: v$version';
  }

  @override
  String get updateNotifications => 'Cập nhật thông báo';

  @override
  String get showWhenUpdatesAvailable => 'Hiển thị khi có bản cập nhật';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Có sẵn';
  }

  @override
  String get readReleaseNotes => 'Đọc ghi chú phát hành';

  @override
  String get downloadingUpdate => 'Đang tải xuống bản cập nhật...';

  @override
  String get updateDownloadFailed =>
      'Tải xuống bản cập nhật không thành công. Vui lòng thử lại.';

  @override
  String get openReleasesPage => 'Mở trang phát hành';

  @override
  String get navigation => 'Điều hướng';

  @override
  String get watchedIndicatorsBackdrops => 'Các chỉ số, phông nền đã xem';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Màu sắc tiêu điểm, chỉ báo đã xem, phông nền';

  @override
  String get navbarStyleToolbarAppearance =>
      'Kiểu thanh điều hướng, các nút trên thanh công cụ, giao diện';

  @override
  String get reorderToggleHomeRows => 'Sắp xếp lại và chuyển đổi các hàng nhà';

  @override
  String get featuredContentAppearance => 'Nội dung, hình thức nổi bật';

  @override
  String get posterSizeImageTypeFolderView =>
      'Kích thước áp phích, loại hình ảnh, chế độ xem thư mục';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB và các nguồn xếp hạng';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Giới hạn bộ nhớ đệm hình ảnh';

  @override
  String get clearImageCache => 'Xóa bộ nhớ đệm hình ảnh';

  @override
  String get imageCacheCleared => 'Đã xóa bộ nhớ đệm hình ảnh';

  @override
  String get clear => 'Xóa';

  @override
  String get browse => 'Duyệt qua';

  @override
  String get noResults => 'Không có kết quả';

  @override
  String get seerrAvailableStatus => 'Có sẵn';

  @override
  String get seerrRequestedStatus => 'Đã yêu cầu';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Đang tải xuống · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Đang nhập';

  @override
  String itemsCount(int count) {
    return '$count Vật phẩm';
  }

  @override
  String get seerrSettings => 'Cài đặt Seerr';

  @override
  String get requestMore => 'Yêu cầu thêm';

  @override
  String get request => 'Lời yêu cầu';

  @override
  String get cancelRequest => 'Hủy yêu cầu';

  @override
  String get playInMoonfin => 'Chơi ở Moonfin';

  @override
  String requestedByName(String name) {
    return 'Được yêu cầu bởi $name';
  }

  @override
  String get approve => 'Chấp thuận';

  @override
  String get declineAction => 'Sự suy sụp';

  @override
  String get similar => 'Tương tự';

  @override
  String get recommendations => 'Khuyến nghị';

  @override
  String cancelRequestForTitle(String title) {
    return 'Hủy yêu cầu cho \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Hủy các yêu cầu $count cho \"$title\"?';
  }

  @override
  String get keep => 'Giữ';

  @override
  String get itemNotFoundInLibrary =>
      'Không tìm thấy mục trong thư viện Moonfin của bạn';

  @override
  String get errorSearchingLibrary => 'Lỗi tìm kiếm thư viện';

  @override
  String budgetAmount(String amount) {
    return 'Ngân sách: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Doanh thu: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Yêu cầu $type';
  }

  @override
  String get submitRequest => 'Gửi yêu cầu';

  @override
  String get allSeasons => 'Tất cả các mùa';

  @override
  String get advancedOptions => 'Tùy chọn nâng cao';

  @override
  String get noServiceServersConfigured =>
      'Không có máy chủ dịch vụ nào được định cấu hình';

  @override
  String get server => 'Máy chủ';

  @override
  String get qualityProfile => 'Hồ sơ chất lượng';

  @override
  String get rootFolder => 'Thư mục gốc';

  @override
  String get showMore => 'Hiển thị thêm';

  @override
  String get appearances => 'Tác phẩm tham gia';

  @override
  String get crewSection => 'Phi hành đoàn';

  @override
  String ageValue(int age) {
    return 'tuổi $age';
  }

  @override
  String get noRequests => 'Không có yêu cầu';

  @override
  String get pendingStatus => 'Chưa giải quyết';

  @override
  String get declinedStatus => 'Bị từ chối';

  @override
  String get partiallyAvailable => 'Có sẵn một phần';

  @override
  String get downloadingStatus => 'Đang tải xuống';

  @override
  String get approvedStatus => 'Tán thành';

  @override
  String get notRequestedStatus => 'Không được yêu cầu';

  @override
  String get blocklistedStatus => 'Bị chặn';

  @override
  String get deletedStatus => 'Đã xóa';

  @override
  String get failedStatus => 'Thất bại';

  @override
  String get processingStatus => 'Đang xử lý';

  @override
  String modifiedByName(String name) {
    return 'Được sửa bởi $name';
  }

  @override
  String get completedStatus => 'Hoàn tất';

  @override
  String get requestErrorDuplicate => 'Tựa đề này đã được yêu cầu';

  @override
  String get requestErrorQuota => 'Đã đạt giới hạn yêu cầu';

  @override
  String get requestErrorBlocklisted => 'Tựa đề này nằm trong danh sách chặn';

  @override
  String get requestErrorNoSeasons => 'Không còn mùa nào để yêu cầu';

  @override
  String get requestErrorPermission => 'Bạn không có quyền gửi yêu cầu này';

  @override
  String get seerrRequestsTitle => 'Yêu cầu';

  @override
  String get seerrIssuesTitle => 'Sự cố';

  @override
  String get sortNewest => 'Mới nhất';

  @override
  String get sortLastModified => 'Sửa gần nhất';

  @override
  String get noIssues => 'Không có sự cố';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Còn $remaining trên $limit lượt yêu cầu phim';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Còn $remaining trên $limit lượt yêu cầu mùa';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Thuộc $name';
  }

  @override
  String get viewCollection => 'Xem bộ sưu tập';

  @override
  String get requestCollection => 'Yêu cầu cả bộ sưu tập';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total phim · $available phim có sẵn';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Yêu cầu $count phim';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Đang yêu cầu $current trên $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Đã yêu cầu $count phim';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Đã yêu cầu $ok trên $total phim';
  }

  @override
  String get collectionAllRequested =>
      'Tất cả phim đều đã có sẵn hoặc đã được yêu cầu';

  @override
  String get reportIssue => 'Báo cáo sự cố';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Âm thanh';

  @override
  String get whatsWrong => 'Có vấn đề gì?';

  @override
  String get allEpisodes => 'Tất cả các tập';

  @override
  String get episode => 'Tập';

  @override
  String get openStatus => 'Đang mở';

  @override
  String get resolvedStatus => 'Đã xử lý';

  @override
  String get resolveAction => 'Đánh dấu đã xử lý';

  @override
  String get reopenAction => 'Mở lại';

  @override
  String reportedByName(String name) {
    return 'Được báo cáo bởi $name';
  }

  @override
  String commentsCount(int count) {
    return '$count bình luận';
  }

  @override
  String get addComment => 'Thêm bình luận';

  @override
  String get deleteIssueConfirm => 'Xóa sự cố này?';

  @override
  String get submitReport => 'Gửi báo cáo';

  @override
  String get tmdbScore => 'Điểm TMDB';

  @override
  String get releaseDateLabel => 'Ngày phát hành';

  @override
  String get firstAirDateLabel => 'Ngày phát sóng đầu tiên';

  @override
  String get revenueLabel => 'Doanh thu';

  @override
  String get runtimeLabel => 'Thời gian chạy';

  @override
  String get budgetLabel => 'Ngân sách';

  @override
  String get originalLanguageLabel => 'Ngôn ngữ gốc';

  @override
  String get seasonsLabel => 'Mùa';

  @override
  String get episodesLabel => 'tập phim';

  @override
  String get access => 'Truy cập';

  @override
  String get add => 'Thêm';

  @override
  String get address => 'Địa chỉ';

  @override
  String get analytics => 'Phân tích';

  @override
  String get catalog => 'Danh mục';

  @override
  String get content => 'Nội dung';

  @override
  String get copy => 'Sao chép';

  @override
  String get create => 'Tạo nên';

  @override
  String get disable => 'Vô hiệu hóa';

  @override
  String get done => 'Xong';

  @override
  String get edit => 'Chỉnh sửa';

  @override
  String get encoding => 'Mã hóa';

  @override
  String get error => 'Lỗi';

  @override
  String get forward => 'Tua tới';

  @override
  String get general => 'Chung';

  @override
  String get go => 'Đi';

  @override
  String get install => 'Cài đặt';

  @override
  String get installed => 'Đã cài đặt';

  @override
  String get interval => 'Khoảng thời gian';

  @override
  String get name => 'Tên';

  @override
  String get networking => 'Mạng';

  @override
  String get next => 'Tiếp theo';

  @override
  String get path => 'Con đường';

  @override
  String get paused => 'Đã tạm dừng';

  @override
  String get permissions => 'Quyền';

  @override
  String get processing => 'Xử lý';

  @override
  String get profile => 'Hồ sơ';

  @override
  String get provider => 'nhà cung cấp';

  @override
  String get refresh => 'Làm cho khỏe lại';

  @override
  String get remote => 'Điều khiển từ xa';

  @override
  String get rename => 'Đổi tên';

  @override
  String get revoke => 'Thu hồi';

  @override
  String get role => 'Vai trò';

  @override
  String get root => 'Gốc';

  @override
  String get run => 'Chạy';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get select => 'Lựa chọn';

  @override
  String get send => 'Gửi';

  @override
  String get sessions => 'Phiên';

  @override
  String get set => 'Bộ';

  @override
  String get status => 'Trạng thái';

  @override
  String get stop => 'Dừng';

  @override
  String get streaming => 'Truyền phát';

  @override
  String get time => 'Thời gian';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Gỡ cài đặt';

  @override
  String get up => 'Hướng lên';

  @override
  String get update => 'Cập nhật';

  @override
  String get upload => 'Tải lên';

  @override
  String get unmute => 'Bật tiếng';

  @override
  String get mute => 'Tắt tiếng';

  @override
  String get branding => 'Xây dựng thương hiệu';

  @override
  String get adminDrawerDashboard => 'Trang tổng quan';

  @override
  String get adminDrawerAnalytics => 'Phân tích';

  @override
  String get adminDrawerSettings => 'Cài đặt';

  @override
  String get adminDrawerBranding => 'Xây dựng thương hiệu';

  @override
  String get adminDrawerUsers => 'Người dùng';

  @override
  String get adminDrawerLibraries => 'Thư viện';

  @override
  String get adminDrawerDisplay => 'Hiển thị';

  @override
  String get adminDrawerMetadata => 'Siêu dữ liệu';

  @override
  String get adminDrawerNfo => 'Cài đặt NFO';

  @override
  String get adminDrawerTranscoding => 'Chuyển mã';

  @override
  String get adminDrawerResume => 'Tiếp tục xem';

  @override
  String get adminDrawerStreaming => 'Truyền phát';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Thiết bị';

  @override
  String get adminDrawerActivity => 'Hoạt động';

  @override
  String get adminDrawerNetworking => 'Mạng';

  @override
  String get adminDrawerApiKeys => 'Khóa API';

  @override
  String get adminDrawerBackups => 'Sao lưu';

  @override
  String get adminDrawerLogs => 'Nhật ký';

  @override
  String get adminDrawerScheduledTasks => 'Nhiệm vụ theo lịch trình';

  @override
  String get adminDrawerPlugins => 'Plugin';

  @override
  String get adminDrawerRepositories => 'Kho lưu trữ';

  @override
  String get adminDrawerLiveTv => 'Truyền hình trực tiếp';

  @override
  String get adminExitTooltip => 'Thoát khỏi quản trị viên';

  @override
  String get adminDashboardLoadFailed => 'Không tải được trang tổng quan';

  @override
  String get adminMediaOverview => 'Tổng quan về phương tiện truyền thông';

  @override
  String get adminMediaTotalsError =>
      'Không thể tải tổng số phương tiện của máy chủ.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Đọc nhanh về lượng nội dung trên máy chủ này.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Đã có bản cập nhật plugin: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Các plugin yêu cầu khởi động lại: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Nhiệm vụ đã lên lịch không thành công: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Các mục cảnh báo/lỗi gần đây: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Phân phối phương tiện truyền thông';

  @override
  String get analyticsVideoCodecs => 'Codec video';

  @override
  String get analyticsAudioCodecs => 'Bộ giải mã âm thanh';

  @override
  String get analyticsContainers => 'Thùng chứa';

  @override
  String get analyticsTopGenres => 'Thể loại hàng đầu';

  @override
  String get analyticsReleaseYears => 'Năm phát hành';

  @override
  String get analyticsContentRatings => 'Xếp hạng nội dung';

  @override
  String get analyticsRuntimeBuckets => 'Nhóm thời gian chạy';

  @override
  String get analyticsFileFormats => 'Định dạng tệp';

  @override
  String get analyticsNoData => 'Không có sẵn dữ liệu.';

  @override
  String get adminServerInfo => 'Thông tin máy chủ';

  @override
  String get adminRestartPending => 'Đang chờ khởi động lại';

  @override
  String get adminServerPaths => 'Đường dẫn máy chủ';

  @override
  String get adminServerActions => 'Hành động của máy chủ';

  @override
  String get adminRestartServer => 'Khởi động lại máy chủ';

  @override
  String get adminShutdownServer => 'Tắt máy chủ';

  @override
  String get adminScanLibraries => 'Quét thư viện';

  @override
  String get adminLibraryScanStarted => 'Đã bắt đầu quét thư viện';

  @override
  String errorGeneric(String error) {
    return 'Lỗi: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Đang khởi động lại máy chủ';

  @override
  String get adminServerRebootMessage =>
      'Máy chủ đang khởi động lại, vui lòng khởi động lại Moonfin';

  @override
  String get adminActiveSessions => 'Phiên hoạt động';

  @override
  String get adminSessionsLoadFailed => 'Không tải được phiên';

  @override
  String get adminNoActiveSessions => 'Không có phiên hoạt động nào';

  @override
  String get adminRecentActivity => 'Hoạt động gần đây';

  @override
  String get adminNoRecentActivity => 'Không có hoạt động gần đây';

  @override
  String adminCommandFailed(String error) {
    return 'Lệnh không thành công: $error';
  }

  @override
  String get adminSendMessage => 'Gửi tin nhắn';

  @override
  String get adminMessageTextHint => 'Nội dung tin nhắn';

  @override
  String get adminSetVolume => 'Đặt âm lượng';

  @override
  String get sessionPrev => 'Trước đó';

  @override
  String get sessionRewind => 'Tua lại';

  @override
  String get sessionForward => 'Tua tới';

  @override
  String get sessionNext => 'Tiếp theo';

  @override
  String get sessionVolumeDown => 'Tập –';

  @override
  String get sessionVolumeUp => 'tập +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Đang phát';

  @override
  String get volume => 'Âm lượng';

  @override
  String get actions => 'hành động';

  @override
  String get videoCodec => 'Bộ giải mã video';

  @override
  String get audioCodec => 'Bộ giải mã âm thanh';

  @override
  String get hwAccel => 'Tăng tốc CT';

  @override
  String get completion => 'Hoàn thành';

  @override
  String get direct => 'Trực tiếp';

  @override
  String get adminDisconnect => 'Ngắt kết nối';

  @override
  String get adminClearDates => 'Xóa ngày';

  @override
  String get adminActivitySeverityAll => 'Mọi mức độ';

  @override
  String get adminActivityDateRange => 'Khoảng thời gian';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Không tải được nhật ký hoạt động: $error';
  }

  @override
  String get adminNoActivityEntries => 'Không có mục hoạt động nào';

  @override
  String get adminEditDeviceName => 'Chỉnh sửa tên thiết bị';

  @override
  String get adminCustomName => 'Tên tùy chỉnh';

  @override
  String get adminDeviceNameUpdated => 'Đã cập nhật tên thiết bị';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Không cập nhật được thiết bị: $error';
  }

  @override
  String get adminDeleteDevice => 'Xóa thiết bị';

  @override
  String get adminDeviceDeleted => 'Đã xóa thiết bị';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Không xóa được thiết bị: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Gỡ thiết bị \'$name\'? Người dùng sẽ phải đăng nhập lại trên thiết bị này.';
  }

  @override
  String get adminDeleteAllDevices => 'Xóa tất cả thiết bị';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Gỡ $count thiết bị? Những người dùng bị ảnh hưởng sẽ phải đăng nhập lại. Thiết bị hiện tại của bạn không bị ảnh hưởng.';
  }

  @override
  String get adminDevicesDeletedAll => 'Đã gỡ thiết bị';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Đã gỡ một số thiết bị; không thể gỡ $count thiết bị.';
  }

  @override
  String get adminDevicesLoadFailed => 'Không tải được thiết bị';

  @override
  String get adminSearchDevices => 'Tìm kiếm thiết bị';

  @override
  String get adminThisDevice => 'Thiết bị này';

  @override
  String get adminEditName => 'Chỉnh sửa tên';

  @override
  String get adminLibrariesLoadFailed => 'Không tải được thư viện';

  @override
  String get adminNoLibraries => 'Không có thư viện nào được định cấu hình';

  @override
  String get adminScanAllLibraries => 'Quét tất cả thư viện';

  @override
  String get adminAddLibrary => 'Thêm thư viện';

  @override
  String adminScanFailed(String error) {
    return 'Không thể bắt đầu quét: $error';
  }

  @override
  String get adminRenameLibrary => 'Đổi tên thư viện';

  @override
  String get adminNewName => 'Tên mới';

  @override
  String adminLibraryRenamed(String name) {
    return 'Thư viện được đổi tên thành \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Không đổi tên được: $error';
  }

  @override
  String get adminDeleteLibrary => 'Xóa thư viện';

  @override
  String adminLibraryDeleted(String name) {
    return 'Đã xóa thư viện \"$name\"';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Không xóa được thư viện: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Không thêm được đường dẫn: $error';
  }

  @override
  String get adminRemovePath => 'Xóa đường dẫn';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Xóa \"$path\" khỏi thư viện này?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Không xóa được đường dẫn: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Đã lưu tùy chọn thư viện';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Không lưu được tùy chọn: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Không tải được thư viện';

  @override
  String get adminNoMediaPaths =>
      'Không có đường dẫn phương tiện nào được định cấu hình';

  @override
  String get adminAddPath => 'Thêm đường dẫn';

  @override
  String get adminBrowseFilesystem => 'Duyệt hệ thống tập tin máy chủ:';

  @override
  String get adminSaveOptions => 'Tùy chọn lưu';

  @override
  String get adminPreferredMetadataLanguage => 'Ngôn ngữ siêu dữ liệu ưa thích';

  @override
  String get adminMetadataLanguageHint => 'ví dụ. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Mã quốc gia siêu dữ liệu';

  @override
  String get adminMetadataCountryHint => 'ví dụ. Mỹ, Đức, Pháp';

  @override
  String get adminLibraryTabPaths => 'Đường dẫn';

  @override
  String get adminLibraryTabOptions => 'Tùy chọn';

  @override
  String get adminLibraryTabDownloaders => 'Trình tải xuống';

  @override
  String get adminLibMetadataSavers => 'Trình lưu siêu dữ liệu';

  @override
  String get adminLibSubtitleDownloaders => 'Trình tải phụ đề';

  @override
  String get adminLibLyricDownloaders => 'Trình tải lời bài hát';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Trình tải siêu dữ liệu: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Trình lấy hình ảnh: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Máy chủ này không cung cấp trình tải nào cho loại thư viện này.';

  @override
  String get adminLibrarySectionGeneral => 'Chung';

  @override
  String get adminLibrarySectionMetadata => 'Siêu dữ liệu';

  @override
  String get adminLibrarySectionEmbedded => 'Thông tin nhúng';

  @override
  String get adminLibrarySectionSubtitles => 'Phụ đề';

  @override
  String get adminLibrarySectionImages => 'Hình ảnh';

  @override
  String get adminLibrarySectionSeries => 'Phim bộ';

  @override
  String get adminLibrarySectionMusic => 'Nhạc';

  @override
  String get adminLibrarySectionMovies => 'Phim';

  @override
  String get adminLibRealtimeMonitor => 'Bật giám sát theo thời gian thực';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Phát hiện thay đổi của tệp và tự động xử lý.';

  @override
  String get adminLibArchiveMediaFiles => 'Xem tệp nén như tệp phương tiện';

  @override
  String get adminLibEnablePhotos => 'Hiển thị ảnh';

  @override
  String get adminLibSaveLocalMetadata => 'Lưu ảnh bìa vào thư mục phương tiện';

  @override
  String get adminLibRefreshInterval => 'Tự động làm mới siêu dữ liệu';

  @override
  String get adminLibRefreshNever => 'Không bao giờ';

  @override
  String get adminLibDefault => 'Mặc định';

  @override
  String get adminLibDisplayTitle => 'Hiển thị';

  @override
  String get adminLibDisplaySection => 'Hiển thị thư viện';

  @override
  String get adminLibFolderView =>
      'Hiển thị dạng thư mục để xem các thư mục phương tiện thuần túy';

  @override
  String get adminLibSpecialsInSeasons =>
      'Hiển thị tập đặc biệt trong mùa mà chúng được phát sóng';

  @override
  String get adminLibGroupMovies => 'Nhóm phim lẻ thành bộ sưu tập';

  @override
  String get adminLibGroupShows => 'Nhóm phim bộ thành bộ sưu tập';

  @override
  String get adminLibExternalSuggestions =>
      'Hiển thị nội dung bên ngoài trong phần gợi ý';

  @override
  String get adminLibDateAddedSection => 'Cách xác định ngày thêm';

  @override
  String get adminLibDateAddedLabel => 'Lấy ngày thêm từ';

  @override
  String get adminLibDateAddedImport => 'Ngày quét vào thư viện';

  @override
  String get adminLibDateAddedFile => 'Ngày tệp được tạo';

  @override
  String get adminLibMetadataTitle => 'Siêu dữ liệu và hình ảnh';

  @override
  String get adminLibMetadataLangSection => 'Ngôn ngữ siêu dữ liệu ưu tiên';

  @override
  String get adminLibChaptersSection => 'Chương';

  @override
  String get adminLibDummyChapterDuration => 'Thời lượng chương giả (giây)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Độ dài của các chương được tạo cho nội dung không có chương. Đặt 0 để tắt.';

  @override
  String get adminLibChapterImageResolution => 'Độ phân giải ảnh chương';

  @override
  String get adminLibNfoTitle => 'Cài đặt NFO';

  @override
  String get adminLibNfoHelp =>
      'Siêu dữ liệu NFO tương thích với Kodi và các ứng dụng tương tự. Các thiết lập này áp dụng cho mọi thư viện có lưu siêu dữ liệu NFO.';

  @override
  String get adminLibKodiUser =>
      'Người dùng được lưu dữ liệu xem trong tệp NFO';

  @override
  String get adminLibSaveImagePaths => 'Lưu đường dẫn hình ảnh trong tệp NFO';

  @override
  String get adminLibPathSubstitution =>
      'Bật thay thế đường dẫn cho đường dẫn hình ảnh NFO';

  @override
  String get adminLibExtraThumbs =>
      'Sao chép ảnh extrafanart vào thư mục extrathumbs';

  @override
  String get adminLibNone => 'Không có';

  @override
  String adminLibRefreshDays(int days) {
    return '$days ngày';
  }

  @override
  String get adminLibEmbeddedTitles => 'Dùng tựa đề nhúng trong tệp';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Dùng tựa đề nhúng cho nội dung thêm';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Dùng thông tin tập nhúng trong tệp';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Cho phép phụ đề nhúng';

  @override
  String get adminLibEmbeddedAllowAll => 'Cho phép tất cả';

  @override
  String get adminLibEmbeddedAllowText => 'Chỉ dạng văn bản';

  @override
  String get adminLibEmbeddedAllowImage => 'Chỉ dạng hình ảnh';

  @override
  String get adminLibEmbeddedAllowNone => 'Không có';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Bỏ qua tải xuống nếu đã có phụ đề nhúng';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Bỏ qua tải xuống nếu bản âm thanh trùng với ngôn ngữ tải xuống';

  @override
  String get adminLibRequirePerfectMatch => 'Yêu cầu phụ đề khớp hoàn toàn';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Lưu phụ đề vào thư mục phương tiện';

  @override
  String get adminLibChapterImageExtraction => 'Trích xuất ảnh chương';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Trích xuất ảnh chương trong lúc quét thư viện';

  @override
  String get adminLibTrickplayExtraction => 'Bật trích xuất ảnh Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Trích xuất ảnh Trickplay trong lúc quét thư viện';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Lưu ảnh Trickplay vào thư mục phương tiện';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Tự động gộp các phim bộ nằm rải rác ở nhiều thư mục';

  @override
  String get adminLibSeasonZeroName => 'Tên hiển thị của mùa 0';

  @override
  String get adminLibLufsScan => 'Bật quét LUFS để chuẩn hóa âm lượng';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Ưu tiên thẻ nghệ sĩ không chuẩn';

  @override
  String get adminLibAutoAddToCollection => 'Tự động thêm phim vào bộ sưu tập';

  @override
  String get adminLibraryNameRequired => 'Tên thư viện là bắt buộc';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Không tạo được thư viện: $error';
  }

  @override
  String get adminLibraryName => 'Tên thư viện';

  @override
  String get adminSelectedPaths => 'Đường dẫn đã chọn:';

  @override
  String get adminNoPathsAdded =>
      'Không có đường dẫn nào được thêm vào (có thể thêm vào sau)';

  @override
  String get adminCreateLibrary => 'Tạo thư viện';

  @override
  String get paths => 'Đường dẫn:';

  @override
  String get adminDisableUser => 'Vô hiệu hóa người dùng';

  @override
  String get adminEnableUser => 'Kích hoạt người dùng';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Tắt $name? Họ sẽ không thể đăng nhập.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Bật $name? Họ sẽ có thể đăng nhập lại.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Người dùng \"$name\" đã bị vô hiệu hóa';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Người dùng \"$name\" đã bật';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Không cập nhật được chính sách người dùng: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Không tải được người dùng';

  @override
  String get adminSearchUsers => 'Tìm kiếm người dùng';

  @override
  String get adminEditUser => 'Chỉnh sửa người dùng';

  @override
  String get adminAddUser => 'Thêm người dùng';

  @override
  String adminUserCreateFailed(String error) {
    return 'Không tạo được người dùng: $error';
  }

  @override
  String get adminCreateUser => 'Tạo người dùng';

  @override
  String get adminPasswordOptional => 'Mật khẩu (tùy chọn)';

  @override
  String get adminUsernameRequired => 'Tên người dùng không thể trống';

  @override
  String get adminNoProfileChanges => 'Không có thay đổi hồ sơ nào để lưu';

  @override
  String get adminProfileSaved => 'Đã lưu hồ sơ';

  @override
  String adminSaveFailed(String error) {
    return 'Không lưu được: $error';
  }

  @override
  String get adminPermissionsSaved => 'Đã lưu quyền';

  @override
  String get adminPasswordsMismatch => 'Mật khẩu không khớp';

  @override
  String adminFailed(String error) {
    return 'Không thành công: $error';
  }

  @override
  String get adminUserLoadFailed => 'Không thể tải người dùng';

  @override
  String get adminBackToUsers => 'Quay lại Người dùng';

  @override
  String get adminSaveProfile => 'Lưu hồ sơ';

  @override
  String get adminDeleteUser => 'Xóa người dùng';

  @override
  String get admin => 'Quản trị viên';

  @override
  String get adminFullAccessWarning =>
      'Quản trị viên có toàn quyền truy cập vào máy chủ. Cấp một cách thận trọng.';

  @override
  String get administrator => 'Quản trị viên';

  @override
  String get adminHiddenUser => 'Người dùng ẩn';

  @override
  String get adminAllowMediaPlayback => 'Cho phép phát lại phương tiện';

  @override
  String get adminAllowAudioTranscoding => 'Cho phép chuyển mã âm thanh';

  @override
  String get adminAllowVideoTranscoding => 'Cho phép chuyển mã video';

  @override
  String get adminAllowRemuxing => 'Cho phép làm lại';

  @override
  String get adminForceRemoteTranscoding => 'Buộc chuyển mã nguồn từ xa';

  @override
  String get adminAllowContentDeletion => 'Cho phép xóa nội dung';

  @override
  String get adminAllowContentDownloading => 'Cho phép tải xuống nội dung';

  @override
  String get adminAllowPublicSharing => 'Cho phép chia sẻ công khai';

  @override
  String get adminAllowRemoteControl =>
      'Cho phép điều khiển từ xa của người dùng khác';

  @override
  String get adminAllowSharedDeviceControl =>
      'Cho phép điều khiển thiết bị dùng chung';

  @override
  String get adminAllowRemoteAccess => 'Cho phép truy cập từ xa';

  @override
  String get adminRemoteBitrateLimit =>
      'Giới hạn tốc độ bit của máy khách từ xa (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Để trống không giới hạn';

  @override
  String get adminMaxActiveSessions => 'Phiên hoạt động tối đa';

  @override
  String get adminAllowLiveTvAccess =>
      'Cho phép truy cập Truyền hình trực tiếp';

  @override
  String get adminAllowLiveTvManagement =>
      'Cho phép quản lý truyền hình trực tiếp';

  @override
  String get adminAllowCollectionManagement => 'Cho phép quản lý bộ sưu tập';

  @override
  String get adminAllowSubtitleManagement => 'Cho phép quản lý phụ đề';

  @override
  String get adminAllowLyricManagement => 'Cho phép quản lý lời bài hát';

  @override
  String get adminSavePermissions => 'Lưu quyền';

  @override
  String get adminEnableAllLibraryAccess =>
      'Cho phép truy cập vào tất cả các thư viện';

  @override
  String get adminSaveAccess => 'Lưu quyền truy cập';

  @override
  String get adminChangePassword => 'Thay đổi mật khẩu';

  @override
  String get adminNewPassword => 'Mật khẩu mới';

  @override
  String get adminConfirmPassword => 'Xác nhận mật khẩu';

  @override
  String get adminSetPassword => 'Đặt mật khẩu';

  @override
  String get adminResetPassword => 'Đặt lại mật khẩu';

  @override
  String get adminPasswordReset => 'Đặt lại mật khẩu';

  @override
  String get adminPasswordUpdated => 'Đã cập nhật mật khẩu';

  @override
  String get adminUserSettings => 'Cài đặt người dùng';

  @override
  String get adminLibraryAccess => 'Truy cập thư viện';

  @override
  String get adminDeviceAndChannelAccess => 'Quyền truy cập thiết bị và kênh';

  @override
  String get adminEnableAllDevices =>
      'Cho phép truy cập vào tất cả các thiết bị';

  @override
  String get adminEnableAllChannels => 'Cho phép truy cập vào tất cả các kênh';

  @override
  String get adminParentalControl => 'Kiểm soát của phụ huynh';

  @override
  String get adminMaxParentalRating => 'Xếp hạng độ tuổi tối đa được phép';

  @override
  String get adminMaxParentalRatingHint =>
      'Nội dung có xếp hạng cao hơn sẽ bị ẩn với người dùng này.';

  @override
  String get adminParentalRatingNone => 'Không có';

  @override
  String get adminBlockUnratedItems =>
      'Chặn các mục không có hoặc có thông tin xếp hạng không xác định';

  @override
  String get adminUnratedBook => 'Sách';

  @override
  String get adminUnratedChannelContent => 'Kênh';

  @override
  String get adminUnratedLiveTvChannel => 'TV trực tiếp';

  @override
  String get adminUnratedMovie => 'Phim';

  @override
  String get adminUnratedMusic => 'Nhạc';

  @override
  String get adminUnratedTrailer => 'Trailer';

  @override
  String get adminUnratedSeries => 'Phim bộ';

  @override
  String get adminAccessSchedules => 'Lịch truy cập';

  @override
  String get adminAccessSchedulesHint =>
      'Chỉ cho phép truy cập trong các khung giờ bên dưới. Nếu không đặt lịch, người dùng được truy cập cả ngày.';

  @override
  String get adminAddSchedule => 'Thêm lịch';

  @override
  String get adminScheduleDay => 'Ngày';

  @override
  String get adminScheduleStart => 'Bắt đầu';

  @override
  String get adminScheduleEnd => 'Kết thúc';

  @override
  String get adminDayEveryday => 'Mỗi ngày';

  @override
  String get adminDayWeekday => 'Ngày trong tuần';

  @override
  String get adminDayWeekend => 'Cuối tuần';

  @override
  String get adminDaySunday => 'Chủ Nhật';

  @override
  String get adminDayMonday => 'Thứ Hai';

  @override
  String get adminDayTuesday => 'Thứ Ba';

  @override
  String get adminDayWednesday => 'Thứ Tư';

  @override
  String get adminDayThursday => 'Thứ Năm';

  @override
  String get adminDayFriday => 'Thứ Sáu';

  @override
  String get adminDaySaturday => 'Thứ Bảy';

  @override
  String get adminAllowedTags => 'Thẻ được phép';

  @override
  String get adminAllowedTagsHint =>
      'Chỉ hiển thị nội dung có các thẻ này. Để trống để cho phép tất cả.';

  @override
  String get adminBlockedTags => 'Thẻ bị chặn';

  @override
  String get adminBlockedTagsHint =>
      'Nội dung có các thẻ này sẽ bị ẩn với người dùng này.';

  @override
  String get adminAddTag => 'Thêm thẻ';

  @override
  String get adminEnabledDevices => 'Thiết bị được bật';

  @override
  String get adminEnabledChannels => 'Kênh được bật';

  @override
  String get adminAuthProvider => 'Nhà cung cấp xác thực';

  @override
  String get adminPasswordResetProvider => 'Nhà cung cấp đặt lại mật khẩu';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Số lần đăng nhập thất bại tối đa trước khi khóa';

  @override
  String get adminLoginAttemptsHint =>
      'Đặt 0 để dùng mặc định, hoặc -1 để tắt tính năng khóa.';

  @override
  String get adminSyncPlayAccess => 'Quyền truy cập SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin => 'Cho phép tạo và tham gia nhóm';

  @override
  String get adminSyncPlayJoin => 'Cho phép tham gia nhóm';

  @override
  String get adminSyncPlayNone => 'Không có quyền truy cập';

  @override
  String get adminContentDeletionFolders => 'Cho phép xóa nội dung từ';

  @override
  String get adminResetPasswordWarning =>
      'Điều này sẽ loại bỏ mật khẩu. Người dùng sẽ có thể đăng nhập mà không cần mật khẩu.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Máy chủ trả về HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Bạn có chắc chắn muốn xóa $name không?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Đã xóa người dùng \"$name\"';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Không xóa được người dùng: $error';
  }

  @override
  String get adminCreateApiKey => 'Tạo khóa API';

  @override
  String get adminAppName => 'Tên ứng dụng';

  @override
  String get adminApiKeyCreated => 'Đã tạo khóa API';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Khóa được tạo thành công. Máy chủ không trả lại mã thông báo. Kiểm tra khóa API máy chủ.';

  @override
  String get adminKeyCopied => 'Đã sao chép khóa vào bảng nhớ tạm';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Không tạo được khóa: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Mã thông báo khóa bị thiếu trong phản hồi của máy chủ';

  @override
  String get adminRevokeApiKey => 'Thu hồi khóa API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Thu hồi khóa cho $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Khóa API đã bị thu hồi';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Không thu hồi được khóa: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Không tải được khóa API';

  @override
  String get adminApiKeysTitle => 'Khóa API';

  @override
  String get adminCreateKey => 'Tạo khóa';

  @override
  String get adminNoApiKeys => 'Không tìm thấy khóa API nào';

  @override
  String get adminUnknownApp => 'Ứng dụng không xác định';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Mã thông báo: $token\\nĐã tạo: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Tạo bản sao lưu';

  @override
  String get adminBackupInclude => 'Chọn những gì cần đưa vào bản sao lưu.';

  @override
  String get adminBackupDatabase => 'Cơ sở dữ liệu';

  @override
  String get adminBackupDatabaseAlways => 'Luôn được bao gồm';

  @override
  String get adminBackupMetadata => 'Siêu dữ liệu';

  @override
  String get adminBackupSubtitles => 'Phụ đề';

  @override
  String get adminBackupTrickplay => 'Ảnh Trickplay';

  @override
  String get adminCreatingBackup => 'Đang tạo bản sao lưu...';

  @override
  String get adminBackupCreated => 'Sao lưu được tạo thành công';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Không tạo được bản sao lưu: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Đường dẫn sao lưu bị thiếu trong phản hồi của máy chủ';

  @override
  String adminBackupManifest(String name) {
    return 'Bản kê khai: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Không tải được bảng kê khai: $error';
  }

  @override
  String get adminConfirmRestore => 'Xác nhận Khôi phục';

  @override
  String get adminRestoringBackup => 'Đang khôi phục bản sao lưu...';

  @override
  String adminRestoreFailed(String error) {
    return 'Không khôi phục được bản sao lưu: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Không tải được bản sao lưu';

  @override
  String get adminCreateBackup => 'Tạo bản sao lưu';

  @override
  String get adminNoBackups => 'Không tìm thấy bản sao lưu nào';

  @override
  String get adminViewDetails => 'Xem chi tiết';

  @override
  String get restore => 'Khôi phục';

  @override
  String get adminLogsLoadFailed => 'Không tải được nhật ký máy chủ';

  @override
  String get adminNoLogFiles => 'Không tìm thấy tệp nhật ký nào';

  @override
  String get adminLogCopied => 'Đã sao chép nhật ký vào bảng nhớ tạm';

  @override
  String get adminSaveLogFile => 'Lưu tệp nhật ký';

  @override
  String adminSavedTo(String path) {
    return 'Đã lưu vào $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Không lưu được tệp: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Không tải được $fileName';
  }

  @override
  String get adminSearchInLog => 'Tìm kiếm trong nhật ký';

  @override
  String get adminNoMatchingLines => 'Không có dòng phù hợp';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Không tải được tác vụ: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Không tìm thấy nhiệm vụ đã lên lịch nào';

  @override
  String get adminNoTasksMatchFilter =>
      'Không có nhiệm vụ nào phù hợp với bộ lọc hiện tại';

  @override
  String adminTaskStartFailed(String error) {
    return 'Không thể bắt đầu tác vụ: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Không dừng được tác vụ: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Không tải được tác vụ: $error';
  }

  @override
  String get adminRunNow => 'Chạy ngay';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Không xóa được trình kích hoạt: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Không thêm được trình kích hoạt: $error';
  }

  @override
  String get adminLastExecution => 'Thực thi lần cuối';

  @override
  String get adminTriggers => 'Trình kích hoạt';

  @override
  String get adminAddTrigger => 'Thêm trình kích hoạt';

  @override
  String get adminNoTriggers =>
      'Không có trình kích hoạt nào được định cấu hình';

  @override
  String get adminTriggerType => 'Loại kích hoạt';

  @override
  String get adminTimeLimit => 'Giới hạn thời gian (tùy chọn)';

  @override
  String get adminNoLimit => 'Không giới hạn';

  @override
  String adminHours(String hours) {
    return '$hours giờ';
  }

  @override
  String get adminDayOfWeek => 'Ngày trong tuần';

  @override
  String get adminSearchPlugins => 'Tìm kiếm plugin...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Không chuyển đổi được plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Gỡ cài đặt plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Bạn có chắc chắn muốn gỡ cài đặt \"$name\" không?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Không thể gỡ cài đặt plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Không cài đặt được gói: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Không cài đặt được bản cập nhật: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Không tải được plugin: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Không có plugin nào phù hợp với tìm kiếm của bạn';

  @override
  String get adminNoPluginsInstalled => 'Không có plugin nào được cài đặt';

  @override
  String adminInstallUpdate(String version) {
    return 'Cài đặt bản cập nhật (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Không tải được danh mục: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Không có gói nào phù hợp với tìm kiếm của bạn';

  @override
  String get adminNoPackagesAvailable => 'Không có gói nào có sẵn';

  @override
  String get adminExperimentalIntegration => 'Tích hợp thử nghiệm';

  @override
  String get adminExperimentalWarning =>
      'Tích hợp cài đặt plugin vẫn đang thử nghiệm. Một số trang cài đặt có thể không hiển thị chính xác.';

  @override
  String get continueAction => 'Tiếp tục';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" sẽ bị xóa sau khi khởi động lại máy chủ';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Không thể gỡ cài đặt: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Đang cập nhật \"$name\" thành v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Không thể mở cài đặt: thiếu mã thông báo xác thực.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Không tải được plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Không tìm thấy plugin';

  @override
  String adminPluginVersion(String version) {
    return 'Phiên bản $version';
  }

  @override
  String get adminEnablePlugin => 'Kích hoạt plugin';

  @override
  String get adminPluginSettingsPage => 'Trang cài đặt plugin';

  @override
  String get adminRevisionHistory => 'Lịch sử sửa đổi';

  @override
  String get adminNoChangelog => 'Không có nhật ký thay đổi.';

  @override
  String get adminRemoveRepository => 'Xóa kho lưu trữ';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Bạn có chắc chắn muốn xóa \"$name\" không?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Không lưu được kho lưu trữ: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Không thể tải kho lưu trữ: $error';
  }

  @override
  String get adminRepositoryNameHint => 'ví dụ. Jellyfin Ổn định';

  @override
  String get adminRepositoryUrl => 'URL kho lưu trữ';

  @override
  String get adminAddEntry => 'Thêm mục';

  @override
  String get adminInvalidUrl => 'URL không hợp lệ';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Không thể tải cài đặt plugin: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Không thể mở $uri';
  }

  @override
  String get adminOpenInBrowser => 'Mở trong trình duyệt';

  @override
  String get adminOpenExternally => 'Mở bên ngoài';

  @override
  String get adminGeneralSettings => 'Cài đặt chung';

  @override
  String get adminServerName => 'Tên máy chủ';

  @override
  String get adminPreferredMetadataCountry => 'Quốc gia siêu dữ liệu ưa thích';

  @override
  String get adminCachePath => 'Đường dẫn bộ đệm';

  @override
  String get adminMetadataPath => 'Đường dẫn siêu dữ liệu';

  @override
  String get adminLibraryScanConcurrency => 'Quét thư viện đồng thời';

  @override
  String get adminParallelImageEncodingLimit =>
      'Giới hạn mã hóa hình ảnh song song';

  @override
  String get adminSlowResponseThreshold => 'Ngưỡng phản hồi chậm (ms)';

  @override
  String get adminBrandingSaved => 'Đã lưu cài đặt thương hiệu';

  @override
  String get adminBrandingLoadFailed => 'Không tải được cài đặt nhãn hiệu';

  @override
  String get adminLoginDisclaimer => 'Tuyên bố từ chối trách nhiệm đăng nhập';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML hiển thị bên dưới biểu mẫu đăng nhập';

  @override
  String get adminCustomCss => 'CSS tùy chỉnh';

  @override
  String get adminCustomCssHint =>
      'CSS tùy chỉnh được áp dụng cho giao diện web';

  @override
  String get adminEnableSplashScreen => 'Bật màn hình giật gân';

  @override
  String get adminStreamingSaved => 'Đã lưu cài đặt phát trực tuyến';

  @override
  String get adminStreamingLoadFailed =>
      'Không tải được cài đặt phát trực tuyến';

  @override
  String get adminStreamingDescription =>
      'Đặt giới hạn tốc độ bit phát trực tuyến toàn cầu cho các kết nối từ xa.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Giới hạn tốc độ bit của máy khách từ xa (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Để trống hoặc 0 là không giới hạn';

  @override
  String get adminPlaybackSaved => 'Đã lưu cài đặt phát lại';

  @override
  String get adminPlaybackLoadFailed => 'Không tải được cài đặt phát lại';

  @override
  String get adminPlaybackTranscoding => 'Phát lại / Chuyển mã';

  @override
  String get adminHardwareAcceleration => 'Tăng tốc phần cứng';

  @override
  String get adminVaapiDevice => 'Thiết bị VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Kích hoạt mã hóa phần cứng';

  @override
  String get adminEnableHardwareDecoding => 'Bật giải mã phần cứng cho:';

  @override
  String get adminEncodingThreads => 'Chủ đề mã hóa';

  @override
  String get adminAutomatic => '0 = tự động';

  @override
  String get adminTranscodingTempPath => 'Chuyển mã đường dẫn tạm thời';

  @override
  String get adminEnableFallbackFont => 'Bật phông chữ dự phòng';

  @override
  String get adminFallbackFontPath => 'Đường dẫn phông chữ dự phòng';

  @override
  String get adminAllowSegmentDeletion => 'Cho phép xóa phân đoạn';

  @override
  String get adminSegmentKeepSeconds => 'Giữ phân đoạn (giây)';

  @override
  String get adminThrottleBuffering => 'Bộ đệm ga';

  @override
  String get adminTrickplaySaved => 'Đã lưu cài đặt Trickplay';

  @override
  String get adminTrickplayLoadFailed => 'Không tải được cài đặt Trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Kích hoạt tính năng tăng tốc phần cứng';

  @override
  String get adminEnableKeyFrameExtraction => 'Chỉ bật trích xuất khung chính';

  @override
  String get adminKeyFrameSubtitle => 'Nhanh hơn nhưng độ chính xác thấp hơn';

  @override
  String get adminScanBehavior => 'Hành vi quét';

  @override
  String get adminProcessPriority => 'Ưu tiên quy trình';

  @override
  String get adminImageSettings => 'Cài đặt hình ảnh';

  @override
  String get adminIntervalMs => 'Khoảng thời gian (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Tần suất chụp khung hình';

  @override
  String get adminWidthResolutions => 'Độ phân giải chiều rộng';

  @override
  String get adminTileWidth => 'Chiều rộng gạch';

  @override
  String get adminTileHeight => 'Chiều cao gạch';

  @override
  String get adminQualitySubtitle =>
      'Giá trị thấp hơn = chất lượng tốt hơn, tệp lớn hơn';

  @override
  String get adminProcessThreads => 'Xử lý chủ đề';

  @override
  String get adminResumeSaved => 'Đã lưu cài đặt tiếp tục';

  @override
  String get adminResumeLoadFailed => 'Không tải được cài đặt sơ yếu lý lịch';

  @override
  String get adminResumeDescription =>
      'Định cấu hình khi nào nội dung sẽ được đánh dấu là đã phát một phần hoặc đã phát toàn bộ.';

  @override
  String get adminMinResumePercentage => 'Tỷ lệ sơ yếu lý lịch tối thiểu';

  @override
  String get adminMinResumeSubtitle =>
      'Nội dung phải được phát vượt quá tỷ lệ phần trăm này để lưu tiến trình';

  @override
  String get adminMaxResumePercentage => 'Tỷ lệ tiếp tục tối đa';

  @override
  String get adminMaxResumeSubtitle =>
      'Nội dung được coi là phát đầy đủ sau tỷ lệ phần trăm này';

  @override
  String get adminMinResumeDuration => 'Thời lượng tiếp tục tối thiểu (giây)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Các mục ngắn hơn thế này không thể tiếp tục được';

  @override
  String get adminMinAudiobookResume => 'Tỷ lệ tiếp tục sách nói tối thiểu';

  @override
  String get adminMaxAudiobookResume => 'Tỷ lệ tiếp tục sách nói tối đa';

  @override
  String get adminNetworkingSaved =>
      'Đã lưu cài đặt mạng. Có thể cần phải khởi động lại máy chủ.';

  @override
  String get adminNetworkingLoadFailed => 'Không tải được cài đặt mạng';

  @override
  String get adminNetworkingWarning =>
      'Những thay đổi đối với cài đặt mạng có thể yêu cầu khởi động lại máy chủ.';

  @override
  String get adminEnableRemoteAccess => 'Cho phép truy cập từ xa';

  @override
  String get ports => 'Cổng';

  @override
  String get adminHttpPort => 'Cổng HTTP';

  @override
  String get adminHttpsPort => 'Cổng HTTPS';

  @override
  String get adminPublicHttpsPort => 'Cổng HTTPS công cộng';

  @override
  String get adminBaseUrl => 'URL cơ sở';

  @override
  String get adminBaseUrlHint => 'ví dụ: /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Kích hoạt HTTPS';

  @override
  String get adminLocalNetwork => 'Mạng cục bộ';

  @override
  String get adminLocalNetworkAddresses => 'Địa chỉ mạng cục bộ';

  @override
  String get adminKnownProxies => 'Proxy đã biết';

  @override
  String get adminRemoteIpFilter => 'Bộ lọc IP từ xa';

  @override
  String get adminRemoteIpFilterEntries => 'Bộ lọc IP từ xa';

  @override
  String get adminCertificatePath => 'Đường dẫn chứng chỉ';

  @override
  String get whitelist => 'Danh sách trắng';

  @override
  String get blacklist => 'Danh sách đen';

  @override
  String get notSet => 'Chưa đặt';

  @override
  String get adminMetadataSaved => 'Đã lưu siêu dữ liệu';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Không tải được siêu dữ liệu: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Không lưu được siêu dữ liệu: $error';
  }

  @override
  String get adminRefreshMetadata => 'Làm mới siêu dữ liệu';

  @override
  String get recursive => 'đệ quy';

  @override
  String get adminReplaceAllMetadata => 'Thay thế tất cả siêu dữ liệu';

  @override
  String get adminReplaceAllImages => 'Thay thế tất cả hình ảnh';

  @override
  String get adminMetadataRefreshRequested => 'Đã yêu cầu làm mới siêu dữ liệu';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Không làm mới được siêu dữ liệu: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Không tìm thấy kết quả phù hợp từ xa';

  @override
  String get adminRemoteResults => 'Kết quả từ xa';

  @override
  String get adminRemoteMetadataApplied => 'Đã áp dụng siêu dữ liệu từ xa';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Tìm kiếm từ xa không thành công: $error';
  }

  @override
  String get adminUpdateContentType => 'Cập nhật loại nội dung';

  @override
  String get adminContentType => 'Loại nội dung';

  @override
  String get adminContentTypeUpdated => 'Đã cập nhật loại nội dung';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Không thể cập nhật loại nội dung: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Không tải được trình chỉnh sửa siêu dữ liệu';

  @override
  String get adminNoPeopleEntries => 'Không có mục nhập người';

  @override
  String get adminNoExternalIds => 'Không có ID bên ngoài nào';

  @override
  String adminImageUpdated(String imageType) {
    return 'Đã cập nhật hình ảnh $imageType';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Không tải được hình ảnh: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Định dạng hình ảnh không được hỗ trợ';

  @override
  String get adminImageReadFailed => 'Không thể đọc được hình ảnh đã chọn';

  @override
  String adminImageUploaded(String imageType) {
    return 'Đã tải lên hình ảnh $imageType';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Không thể tải hình ảnh lên: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Xóa hình ảnh $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType đã xóa hình ảnh';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Không xóa được hình ảnh: $error';
  }

  @override
  String get adminAllProviders => 'Tất cả các nhà cung cấp';

  @override
  String get adminNoRemoteImages => 'Không tìm thấy hình ảnh từ xa';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Phát hiện bộ điều chỉnh không thành công: $error';
  }

  @override
  String get adminAddTuner => 'Thêm bộ chỉnh';

  @override
  String get adminEditTuner => 'Sửa bộ thu';

  @override
  String get adminTunerTypeM3u => 'Bộ thu M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Tệp hoặc URL';

  @override
  String get adminTunerIpAddress => 'Địa chỉ IP của bộ thu';

  @override
  String get adminTunerFriendlyName => 'Tên thân thiện';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Giới hạn kết nối đồng thời';

  @override
  String get adminTunerCountHelp =>
      'Số luồng tối đa mà bộ thu cho phép cùng lúc. Đặt 0 để không giới hạn.';

  @override
  String get adminTunerFallbackBitrate => 'Tốc độ bit truyền tối đa dự phòng';

  @override
  String get adminTunerImportFavoritesOnly => 'Chỉ nhập các kênh yêu thích';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Cho phép chuyển mã bằng phần cứng';

  @override
  String get adminTunerAllowFmp4 => 'Cho phép vùng chứa chuyển mã fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Cho phép chia sẻ luồng';

  @override
  String get adminTunerEnableStreamLooping => 'Bật lặp luồng';

  @override
  String get adminTunerIgnoreDts => 'Bỏ qua DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Đọc đầu vào theo tốc độ khung hình gốc';

  @override
  String get adminEditProvider => 'Sửa nhà cung cấp';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Tệp hoặc URL';

  @override
  String get adminXmltvMoviePrefix => 'Tiền tố phim';

  @override
  String get adminXmltvMovieCategories => 'Danh mục phim';

  @override
  String get adminXmltvCategoriesHelp =>
      'Phân tách nhiều danh mục bằng dấu gạch đứng (|).';

  @override
  String get adminXmltvKidsCategories => 'Danh mục thiếu nhi';

  @override
  String get adminXmltvNewsCategories => 'Danh mục tin tức';

  @override
  String get adminXmltvSportsCategories => 'Danh mục thể thao';

  @override
  String get adminSdUsername => 'Tên người dùng';

  @override
  String get adminSdPassword => 'Mật khẩu';

  @override
  String get adminSdCountry => 'Quốc gia';

  @override
  String get adminSdCountrySelect => 'Chọn quốc gia';

  @override
  String get adminSdPostalCode => 'Mã bưu chính';

  @override
  String get adminSdGetListings => 'Lấy danh sách kênh';

  @override
  String get adminSdListings => 'Danh sách kênh';

  @override
  String get adminEnableAllTuners => 'Bật tất cả bộ thu';

  @override
  String get adminTunerType => 'Loại bộ chỉnh';

  @override
  String get adminTunerAdded => 'Đã thêm bộ chỉnh';

  @override
  String adminTunerAddFailed(String error) {
    return 'Không thể thêm bộ điều chỉnh: $error';
  }

  @override
  String get adminAddGuideProvider => 'Thêm nhà cung cấp hướng dẫn';

  @override
  String get adminProviderType => 'Loại nhà cung cấp';

  @override
  String get adminProviderAdded => 'Đã thêm nhà cung cấp';

  @override
  String adminProviderAddFailed(String error) {
    return 'Không thể thêm nhà cung cấp: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Không xóa được bộ dò sóng: $error';
  }

  @override
  String get adminTunerResetRequested => 'Đã yêu cầu đặt lại bộ dò';

  @override
  String adminTunerResetFailed(String error) {
    return 'Không đặt lại được bộ dò sóng: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Loại bộ thu này không hỗ trợ đặt lại.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Không xóa được nhà cung cấp: $error';
  }

  @override
  String get adminRecordingSettings => 'Cài đặt ghi âm';

  @override
  String get adminPrePadding => 'Đệm trước (phút)';

  @override
  String get adminPostPadding => 'Phần đệm sau (phút)';

  @override
  String get adminRecordingPath => 'Đường dẫn ghi';

  @override
  String get adminSeriesRecordingPath => 'Đường dẫn ghi sê-ri';

  @override
  String get adminMovieRecordingPath => 'Đường dẫn ghi phim';

  @override
  String get adminGuideDays => 'Số ngày dữ liệu lịch phát sóng';

  @override
  String get adminGuideDaysAuto => 'Tự động';

  @override
  String adminGuideDaysValue(int days) {
    return '$days ngày';
  }

  @override
  String get adminRecordingPostProcessor => 'Đường dẫn ứng dụng hậu xử lý';

  @override
  String get adminRecordingPostProcessorArgs => 'Tham số của trình hậu xử lý';

  @override
  String get adminSaveRecordingNfo => 'Lưu siêu dữ liệu NFO của bản ghi';

  @override
  String get adminSaveRecordingImages => 'Lưu hình ảnh của bản ghi';

  @override
  String get adminLiveTvSectionTiming => 'Thời gian';

  @override
  String get adminLiveTvSectionPaths => 'Đường dẫn ghi hình';

  @override
  String get adminLiveTvSectionPostProcessing => 'Hậu xử lý';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Dữ liệu lịch phát sóng: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Đã lưu cài đặt ghi âm';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Không lưu được cài đặt: $error';
  }

  @override
  String get adminSetChannelMappings => 'Đặt ánh xạ kênh';

  @override
  String get adminMappingJson => 'Ánh xạ JSON';

  @override
  String get adminMappingJsonHint => 'Ví dụ: ánh xạ tải trọng JSON';

  @override
  String get adminChannelMappingsUpdated => 'Đã cập nhật ánh xạ kênh';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Không cập nhật được ánh xạ: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Không tải được quản trị Truyền hình trực tiếp';

  @override
  String get adminTunerDevices => 'Thiết bị bắt sóng';

  @override
  String get adminNoTunerHosts =>
      'Không có máy chủ điều chỉnh nào được định cấu hình';

  @override
  String get adminGuideProviders => 'Nhà cung cấp hướng dẫn';

  @override
  String get adminRefreshGuideData => 'Làm mới dữ liệu lịch phát sóng';

  @override
  String get adminGuideRefreshStarted =>
      'Đã bắt đầu làm mới dữ liệu lịch phát sóng';

  @override
  String get adminGuideRefreshUnavailable =>
      'Tác vụ làm mới lịch phát sóng không khả dụng trên máy chủ này.';

  @override
  String get adminAddProvider => 'Thêm nhà cung cấp';

  @override
  String get adminNoListingProviders =>
      'Không có nhà cung cấp danh sách nào được định cấu hình';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Đường dẫn ghi: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Đường dẫn chuỗi: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Đệm trước: $minutes phút';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Đệm sau: $minutes phút';
  }

  @override
  String get adminTunerDiscovery => 'Khám phá bộ chỉnh';

  @override
  String get adminChannelMappings => 'Ánh xạ kênh';

  @override
  String get adminNoDiscoveredTuners =>
      'Chưa có bộ điều chỉnh nào được phát hiện';

  @override
  String get adminSettingsSaved => 'Đã lưu cài đặt';

  @override
  String get adminBackupsNotAvailable =>
      'Bản sao lưu không có sẵn trên bản dựng máy chủ này.';

  @override
  String get adminRestoreWarning1 =>
      'Việc khôi phục sẽ thay thế TẤT CẢ dữ liệu máy chủ hiện tại bằng dữ liệu sao lưu.';

  @override
  String get adminRestoreWarning2 =>
      'Cài đặt máy chủ, người dùng và dữ liệu thư viện hiện tại sẽ bị ghi đè.';

  @override
  String get adminRestoreWarning3 =>
      'Máy chủ sẽ khởi động lại sau khi khôi phục.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Khôi phục bản sao lưu $name ngay bây giờ?';
  }

  @override
  String get adminRestoreRequested =>
      'Đã yêu cầu khôi phục. Việc khởi động lại máy chủ có thể ngắt kết nối phiên này.';

  @override
  String get adminBackupsTitle => 'Sao lưu';

  @override
  String get adminUnknownDate => 'Ngày không xác định';

  @override
  String get adminUnnamedBackup => 'Sao lưu không tên';

  @override
  String get adminLiveTvNotAvailable =>
      'Quản trị truyền hình trực tiếp không có sẵn trên bản dựng máy chủ này.';

  @override
  String get adminLiveTvTitle => 'Quản trị truyền hình trực tiếp';

  @override
  String get adminApply => 'Áp dụng';

  @override
  String get adminNotSet => 'Chưa đặt';

  @override
  String get adminReset => 'Đặt lại';

  @override
  String get adminLogsTitle => 'Nhật ký máy chủ';

  @override
  String get adminLogsNewestFirst => 'Mới nhất đầu tiên';

  @override
  String get adminLogsOldestFirst => 'Cũ nhất đầu tiên';

  @override
  String get adminLogsJustNow => 'Vừa rồi';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m trước';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h trước';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d trước';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Không tải được $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count trùng khớp';
  }

  @override
  String get adminLogViewerNoMatches => 'Không có dòng phù hợp';

  @override
  String get adminMetadataEditorTitle => 'Trình chỉnh sửa siêu dữ liệu';

  @override
  String get adminMetadataIdentify => 'Nhận dạng';

  @override
  String get adminMetadataType => 'Kiểu';

  @override
  String get adminMetadataDetails => 'Chi tiết';

  @override
  String get adminMetadataExternalIds => 'ID bên ngoài';

  @override
  String get adminMetadataImages => 'Hình ảnh';

  @override
  String get adminMetadataFieldTitle => 'Tiêu đề';

  @override
  String get adminMetadataFieldSortTitle => 'Sắp xếp tiêu đề';

  @override
  String get adminMetadataFieldOriginalTitle => 'Tiêu đề gốc';

  @override
  String get adminMetadataFieldPremiereDate => 'Ngày công chiếu (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Ngày kết thúc (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Năm sản xuất';

  @override
  String get adminMetadataFieldOfficialRating => 'Đánh giá chính thức';

  @override
  String get adminMetadataFieldCommunityRating => 'Đánh giá cộng đồng';

  @override
  String get adminMetadataFieldCriticRating => 'Đánh giá phê bình';

  @override
  String get adminMetadataFieldTagline => 'Dòng giới thiệu';

  @override
  String get adminMetadataFieldOverview => 'Tổng quan';

  @override
  String get adminMetadataGenres => 'Thể loại';

  @override
  String get adminMetadataTags => 'Thẻ';

  @override
  String get adminMetadataStudios => 'Phim trường';

  @override
  String get adminMetadataPeople => 'Mọi người';

  @override
  String get adminMetadataAddGenre => 'Thêm thể loại';

  @override
  String get adminMetadataAddTag => 'Thêm thẻ';

  @override
  String get adminMetadataAddStudio => 'Thêm phòng thu';

  @override
  String get adminMetadataAddPerson => 'Thêm người';

  @override
  String get adminMetadataEditPerson => 'Chỉnh sửa người';

  @override
  String get adminMetadataRole => 'Vai trò';

  @override
  String get adminMetadataImagePrimary => 'Sơ đẳng';

  @override
  String get adminMetadataImageBackdrop => 'Phông nền';

  @override
  String get adminMetadataImageLogo => 'biểu tượng';

  @override
  String get adminMetadataImageBanner => 'Ngọn cờ';

  @override
  String get adminMetadataImageThumb => 'ngón tay cái';

  @override
  String get adminMetadataRecursive => 'đệ quy';

  @override
  String get adminMetadataProvider => 'nhà cung cấp';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Đã cập nhật hình ảnh $imageType';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Đã tải lên hình ảnh $imageType';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType đã xóa hình ảnh';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Không tải được hình ảnh: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Không thể đọc được hình ảnh đã chọn';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Không thể tải hình ảnh lên: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Xóa hình ảnh $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Thao tác này sẽ xóa hình ảnh hiện tại khỏi mục.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Không xóa được hình ảnh: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Chọn hình ảnh $imageType';
  }

  @override
  String get adminMetadataUpload => 'Tải lên';

  @override
  String get adminMetadataUpdate => 'Cập nhật';

  @override
  String get adminMetadataRemoteImage => 'Hình ảnh từ xa';

  @override
  String get adminPluginsInstalled => 'Đã cài đặt';

  @override
  String get adminPluginsCatalog => 'Danh mục';

  @override
  String get adminPluginsActive => 'Tích cực';

  @override
  String get adminPluginsRestart => 'Khởi động lại';

  @override
  String get adminPluginsNoSearchResults =>
      'Không có plugin nào phù hợp với tìm kiếm của bạn';

  @override
  String get adminPluginsNoneInstalled => 'Không có plugin nào được cài đặt';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Đã có bản cập nhật: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Đã có bản cập nhật';

  @override
  String get adminPluginsPendingRemoval => 'Đang chờ xóa sau khi khởi động lại';

  @override
  String get adminPluginsChangesPending =>
      'Các thay đổi đang chờ khởi động lại';

  @override
  String get adminPluginsEnable => 'Cho phép';

  @override
  String get adminPluginsDisable => 'Vô hiệu hóa';

  @override
  String get adminPluginsInstallUpdate => 'Cài đặt bản cập nhật';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Cài đặt bản cập nhật (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Không có gói nào phù hợp với tìm kiếm của bạn';

  @override
  String get adminPluginsCatalogEmpty => 'Không có gói nào có sẵn';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" đang được cài đặt...';
  }

  @override
  String get adminPluginDetailExperimental => 'Tích hợp thử nghiệm';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Tích hợp cài đặt plugin vẫn đang thử nghiệm. Một số trường hoặc bố cục có thể chưa hiển thị chính xác.';

  @override
  String get adminPluginDetailToggle404 =>
      'Không thể chuyển đổi plugin. Máy chủ không thể tìm thấy phiên bản plugin này. Hãy thử làm mới plugin rồi thử lại.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Không thể chuyển đổi plugin. Vui lòng kiểm tra nhật ký máy chủ để biết chi tiết.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Cài đặt';
  }

  @override
  String get adminPluginDetailDetails => 'Chi tiết';

  @override
  String get adminPluginDetailDeveloper => 'Nhà phát triển';

  @override
  String get adminPluginDetailRepository => 'Kho lưu trữ';

  @override
  String get adminPluginDetailBundled => 'Đi kèm';

  @override
  String get adminPluginDetailEnablePlugin => 'Kích hoạt plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'Cần phải khởi động lại máy chủ để các thay đổi có hiệu lực.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Plugin này sẽ bị xóa sau khi khởi động lại máy chủ.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Plugin này đã gặp trục trặc và có thể không hoạt động chính xác.';

  @override
  String get adminPluginDetailNotSupported =>
      'Phiên bản máy chủ hiện tại không hỗ trợ plugin này.';

  @override
  String get adminPluginDetailSuperseded =>
      'Plugin này đã được thay thế bằng phiên bản mới hơn.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Không thể tải kho lưu trữ: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Xóa kho lưu trữ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Bạn có chắc chắn muốn xóa \"$name\" không?';
  }

  @override
  String get adminReposRemove => 'Gỡ bỏ';

  @override
  String adminReposSaveFailed(String error) {
    return 'Không lưu được kho lưu trữ: $error';
  }

  @override
  String get adminReposEmpty => 'Không có kho lưu trữ nào được cấu hình';

  @override
  String get adminReposEmptySubtitle =>
      'Thêm kho lưu trữ để duyệt các plugin có sẵn';

  @override
  String get adminReposUnnamed => '(vô danh)';

  @override
  String get adminReposEditTitle => 'Chỉnh sửa kho lưu trữ';

  @override
  String get adminReposAddTitle => 'Thêm kho lưu trữ';

  @override
  String get adminReposUrl => 'URL kho lưu trữ';

  @override
  String get adminReposNameHint => 'ví dụ. Jellyfin Ổn định';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL không hợp lệ';

  @override
  String get adminGeneralSettingsTitle => 'Cài đặt chung';

  @override
  String get adminGeneralMetadataLanguage => 'Ngôn ngữ siêu dữ liệu ưa thích';

  @override
  String get adminGeneralMetadataLanguageHint => 'ví dụ. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Quốc gia siêu dữ liệu ưa thích';

  @override
  String get adminGeneralMetadataCountryHint => 'ví dụ. Mỹ, Đức, Pháp';

  @override
  String get adminGeneralLibraryScanConcurrency => 'Quét thư viện đồng thời';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Giới hạn mã hóa hình ảnh song song';

  @override
  String get adminUnknownError => 'Lỗi không xác định';

  @override
  String get adminBrowse => 'Duyệt qua';

  @override
  String get adminCloseBrowser => 'Đóng trình duyệt';

  @override
  String get adminNetworkingTitle => 'Mạng';

  @override
  String get adminNetworkingRestartWarning =>
      'Những thay đổi đối với cài đặt mạng có thể yêu cầu khởi động lại máy chủ.';

  @override
  String get adminNetworkingRemoteAccess => 'Cho phép truy cập từ xa';

  @override
  String get adminNetworkingPorts => 'Cổng';

  @override
  String get adminNetworkingHttpPort => 'Cổng HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Cổng HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Kích hoạt HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Mạng cục bộ';

  @override
  String get adminNetworkingLocalAddresses => 'Địa chỉ mạng cục bộ';

  @override
  String get adminNetworkingAddressHint => 'ví dụ. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxy đã biết';

  @override
  String get adminNetworkingProxyHint => 'ví dụ. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Danh sách trắng';

  @override
  String get adminNetworkingBlacklist => 'Danh sách đen';

  @override
  String get adminNetworkingAddEntry => 'Thêm mục';

  @override
  String get adminBrandingTitle => 'Xây dựng thương hiệu';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Tuyên bố từ chối trách nhiệm đăng nhập';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML hiển thị bên dưới biểu mẫu đăng nhập';

  @override
  String get adminBrandingCustomCss => 'CSS tùy chỉnh';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS tùy chỉnh được áp dụng cho giao diện web';

  @override
  String get adminBrandingEnableSplash => 'Bật màn hình giật gân';

  @override
  String get adminBrandingSplashUpload => 'Tải hình ảnh lên';

  @override
  String get adminBrandingSplashUploaded => 'Đã cập nhật màn hình chờ';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Không tải được màn hình chờ lên';

  @override
  String get adminBrandingSplashDeleted => 'Đã gỡ màn hình chờ';

  @override
  String get adminBrandingNoSplash => 'Không có màn hình chờ tùy chỉnh';

  @override
  String get adminPlaybackHwAccel => 'Tăng tốc phần cứng';

  @override
  String get adminPlaybackHwAccelLabel => 'Tăng tốc phần cứng';

  @override
  String get adminPlaybackEnableHwEncoding => 'Kích hoạt mã hóa phần cứng';

  @override
  String get adminPlaybackEnableHwDecoding => 'Bật giải mã phần cứng cho:';

  @override
  String get adminPlaybackQsvDevice => 'Thiết bị QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Bật bộ giải mã NVDEC nâng cao';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Ưu tiên bộ giải mã phần cứng gốc của hệ thống';

  @override
  String get adminPlaybackColorDepth => 'Độ sâu màu khi giải mã bằng phần cứng';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Giải mã HEVC 10-bit';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Giải mã VP9 10-bit';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'Giải mã HEVC RExt 8/10-bit';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'Giải mã HEVC RExt 12-bit';

  @override
  String get adminPlaybackHwEncodingSection => 'Mã hóa bằng phần cứng';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Cho phép mã hóa HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Cho phép mã hóa AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Bật bộ mã hóa H.264 tiết kiệm điện của Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Bật bộ mã hóa HEVC tiết kiệm điện của Intel';

  @override
  String get adminPlaybackToneMapping => 'Ánh xạ tông màu';

  @override
  String get adminPlaybackEnableTonemapping => 'Bật ánh xạ tông màu';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Bật ánh xạ tông màu VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Bật ánh xạ tông màu VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Thuật toán ánh xạ tông màu';

  @override
  String get adminPlaybackTonemappingMode => 'Chế độ ánh xạ tông màu';

  @override
  String get adminPlaybackTonemappingRange => 'Dải ánh xạ tông màu';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Độ giảm bão hòa của ánh xạ tông màu';

  @override
  String get adminPlaybackTonemappingPeak => 'Đỉnh sáng của ánh xạ tông màu';

  @override
  String get adminPlaybackTonemappingParam => 'Tham số ánh xạ tông màu';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Độ sáng ánh xạ tông màu VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Độ tương phản ánh xạ tông màu VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Cấu hình sẵn & Chất lượng';

  @override
  String get adminPlaybackEncoderPreset => 'Cấu hình sẵn của bộ mã hóa';

  @override
  String get adminPlaybackH264Crf => 'CRF mã hóa H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF mã hóa H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Phương pháp khử xen kẽ';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Nhân đôi tốc độ khung hình khi khử xen kẽ';

  @override
  String get adminPlaybackAudioSection => 'Âm thanh';

  @override
  String get adminPlaybackEnableAudioVbr => 'Bật mã hóa âm thanh VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Tăng âm khi trộn xuống';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Thuật toán trộn xuống Stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Kích thước hàng đợi ghép kênh tối đa';

  @override
  String get adminPlaybackAutoOption => 'Tự động';

  @override
  String get adminPlaybackEncoding => 'Mã hóa';

  @override
  String get adminPlaybackEncodingThreads => 'Chủ đề mã hóa';

  @override
  String get adminPlaybackFallbackFont => 'Bật phông chữ dự phòng';

  @override
  String get adminPlaybackFallbackFontPath => 'Đường dẫn phông chữ dự phòng';

  @override
  String get adminPlaybackStreaming => 'Truyền phát';

  @override
  String get adminResumeVideo => 'Băng hình';

  @override
  String get adminResumeAudiobooks => 'Sách nói';

  @override
  String get adminResumeMinAudiobookPct => 'Tỷ lệ tiếp tục sách nói tối thiểu';

  @override
  String get adminResumeMaxAudiobookPct => 'Tỷ lệ tiếp tục sách nói tối đa';

  @override
  String get adminStreamingBitrateLimit =>
      'Giới hạn tốc độ bit của máy khách từ xa (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Để trống hoặc 0 là không giới hạn';

  @override
  String get adminTrickplayHwAccel => 'Kích hoạt tính năng tăng tốc phần cứng';

  @override
  String get adminTrickplayHwEncoding => 'Kích hoạt mã hóa phần cứng';

  @override
  String get adminTrickplayKeyFrameOnly => 'Chỉ bật trích xuất khung chính';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Nhanh hơn nhưng độ chính xác thấp hơn';

  @override
  String get adminTrickplayNonBlocking => 'Không chặn';

  @override
  String get adminTrickplayBlocking => 'Chặn';

  @override
  String get adminTrickplayPriorityHigh => 'Cao';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Trên mức bình thường';

  @override
  String get adminTrickplayPriorityNormal => 'Bình thường';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Dưới mức bình thường';

  @override
  String get adminTrickplayPriorityIdle => 'Nhàn rỗi';

  @override
  String get adminTrickplayImageSettings => 'Cài đặt hình ảnh';

  @override
  String get adminTrickplayInterval => 'Khoảng thời gian (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Tần suất chụp khung hình';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Độ rộng pixel được phân tách bằng dấu phẩy (ví dụ: 320)';

  @override
  String get adminTrickplayQuality => 'Chất lượng';

  @override
  String get adminTrickplayQScale => 'Thang đo chất lượng';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Giá trị thấp hơn = chất lượng tốt hơn, tệp lớn hơn';

  @override
  String get adminTrickplayJpegQuality => 'chất lượng JPEG';

  @override
  String get adminTrickplayProcessing => 'Xử lý';

  @override
  String get adminTasksEmpty => 'Không tìm thấy nhiệm vụ đã lên lịch nào';

  @override
  String get adminTasksNoFilterMatch =>
      'Không có nhiệm vụ nào phù hợp với bộ lọc hiện tại';

  @override
  String get adminTaskCancelling => 'Đang hủy...';

  @override
  String get adminTaskRunning => 'Đang chạy...';

  @override
  String get adminTaskNeverRun => 'Không bao giờ chạy';

  @override
  String get adminTaskStop => 'Dừng';

  @override
  String get adminRunningTasks => 'Tác vụ đang chạy';

  @override
  String get adminTaskRun => 'Chạy';

  @override
  String get adminTaskDetailLastExecution => 'Thực thi lần cuối';

  @override
  String get adminTaskDetailStarted => 'Đã bắt đầu';

  @override
  String get adminTaskDetailEnded => 'Đã kết thúc';

  @override
  String get adminTaskDetailDuration => 'Khoảng thời gian';

  @override
  String get adminTaskDetailErrorLabel => 'Lỗi:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Hàng ngày tại $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Mọi $day tại $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Mọi $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Khi khởi động ứng dụng';

  @override
  String get adminTaskTriggerTypeDaily => 'Hằng ngày';

  @override
  String get adminTaskTriggerTypeWeekly => 'hàng tuần';

  @override
  String get adminTaskTriggerTypeInterval => 'Trên một khoảng thời gian';

  @override
  String get adminTaskTriggerIntervalLabel => 'Khoảng thời gian';

  @override
  String get adminTaskTriggerEveryHour => 'Mỗi giờ';

  @override
  String get adminTaskTriggerEvery6Hours => 'Cứ sau 6 giờ';

  @override
  String get adminTaskTriggerEvery12Hours => 'Cứ sau 12 giờ';

  @override
  String get adminTaskTriggerEvery24Hours => 'Mỗi 24 giờ';

  @override
  String get adminTaskTriggerEvery2Days => 'Cứ 2 ngày một lần';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giờ',
      one: '1 giờ',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Thời gian';

  @override
  String get adminTaskTriggerNoLimit => 'Không giới hạn';

  @override
  String get adminActivityJustNow => 'Vừa rồi';

  @override
  String get adminActivityLastHour => 'Giờ trước';

  @override
  String get adminActivityToday => 'Hôm nay';

  @override
  String get adminActivityYesterday => 'Hôm qua';

  @override
  String get adminActivityOlder => 'Lớn hơn';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d trước';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h trước';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m trước';
  }

  @override
  String get adminActivityNow => 'Hiện nay';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes phút';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours giờ';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days ngày';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Thiết lập việc tạo ảnh Trickplay cho hình thu nhỏ xem trước khi tua.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Cổng HTTPS công cộng';

  @override
  String get adminNetworkingBaseUrl => 'URL cơ sở';

  @override
  String get adminNetworkingBaseUrlHint => 'ví dụ: /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Cổng HTTP công khai';

  @override
  String get adminNetworkingRequireHttps => 'Bắt buộc HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Chuyển hướng mọi yêu cầu từ xa sang HTTPS. Không có tác dụng nếu máy chủ không có chứng chỉ hợp lệ.';

  @override
  String get adminNetworkingCertPassword => 'Mật khẩu chứng chỉ';

  @override
  String get adminNetworkingIpSettings => 'Cài đặt IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Bật IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Bật IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'Bật ánh xạ cổng tự động';

  @override
  String get adminNetworkingLocalSubnets => 'Mạng LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Danh sách địa chỉ IP hoặc dải mạng CIDR được xem là thuộc mạng nội bộ, phân tách bằng dấu phẩy hoặc xuống dòng.';

  @override
  String get adminNetworkingPublishedUris => 'URI máy chủ được công bố';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Ánh xạ một dải mạng hoặc địa chỉ tới một URL được công bố, ví dụ: all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Đường dẫn chứng chỉ';

  @override
  String get adminNetworkingRemoteIpFilter => 'Bộ lọc IP từ xa';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Bộ lọc IP từ xa';

  @override
  String get adminPlaybackVaapiDevice => 'Thiết bị VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = tự động';

  @override
  String get adminPlaybackTranscodeTempPath => 'Chuyển mã đường dẫn tạm thời';

  @override
  String get adminPlaybackSegmentDeletion => 'Cho phép xóa phân đoạn';

  @override
  String get adminPlaybackSegmentKeep => 'Giữ phân đoạn (giây)';

  @override
  String get adminPlaybackThrottleBuffering => 'Bộ đệm ga';

  @override
  String get adminPlaybackThrottleDelay => 'Độ trễ điều tiết (giây)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Cho phép trích xuất phụ đề tức thời';

  @override
  String get adminResumeMinPct => 'Tỷ lệ sơ yếu lý lịch tối thiểu';

  @override
  String get adminResumeMinPctSubtitle =>
      'Nội dung phải được phát vượt quá tỷ lệ phần trăm này để lưu tiến trình';

  @override
  String get adminResumeMaxPct => 'Tỷ lệ tiếp tục tối đa';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Nội dung được coi là phát đầy đủ sau tỷ lệ phần trăm này';

  @override
  String get adminResumeMinDuration => 'Thời lượng tiếp tục tối thiểu (giây)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Các mục ngắn hơn thế này không thể tiếp tục được';

  @override
  String get adminTrickplayScanBehavior => 'Hành vi quét';

  @override
  String get adminTrickplayProcessPriority => 'Ưu tiên quy trình';

  @override
  String get adminTrickplayTileWidth => 'Chiều rộng gạch';

  @override
  String get adminTrickplayTileHeight => 'Chiều cao gạch';

  @override
  String get adminTrickplayProcessThreads => 'Xử lý chủ đề';

  @override
  String get adminTrickplayWidthResolutions => 'Độ phân giải chiều rộng';

  @override
  String get adminMetadataDefault => 'Mặc định';

  @override
  String get adminMetadataContentTypeUpdated => 'Đã cập nhật loại nội dung';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Không thể cập nhật loại nội dung: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Ngưỡng phản hồi chậm (ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'Bật cảnh báo phản hồi chậm';

  @override
  String get adminGeneralQuickConnect => 'Bật Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Máy chủ';

  @override
  String get adminGeneralSectionMetadata => 'Siêu dữ liệu';

  @override
  String get adminGeneralSectionPaths => 'Đường dẫn';

  @override
  String get adminGeneralSectionPerformance => 'Hiệu năng';

  @override
  String get adminGeneralCachePath => 'Đường dẫn bộ đệm';

  @override
  String get adminGeneralMetadataPath => 'Đường dẫn siêu dữ liệu';

  @override
  String get adminGeneralServerName => 'Tên máy chủ';

  @override
  String get adminGeneralDisplayLanguage => 'Ngôn ngữ hiển thị ưu tiên';

  @override
  String get adminSettingsLoadFailed => 'Không tải được cài đặt';

  @override
  String get adminDiscover => 'Phát hiện';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Không cập nhật được ánh xạ: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Giới hạn thời gian: $duration';
  }

  @override
  String get folders => 'Thư mục';

  @override
  String get libraries => 'Thư viện';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'Đã tắt SyncPlay';

  @override
  String get syncPlayDisabledMessage =>
      'Bật SyncPlay trong Cài đặt để sử dụng tính năng phát lại được đồng bộ hóa.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Máy chủ không được hỗ trợ';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay yêu cầu máy chủ Jellyfin. Máy chủ hiện tại không hỗ trợ nó.';

  @override
  String get syncPlayGroupFallbackName => 'Nhóm SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Nhóm SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# người tham gia',
      one: '# người tham gia',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Bỏ qua chờ đợi';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Đừng giữ nhóm trong khi thiết bị này đang đệm';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Tiếp tục cục bộ mà không cần chờ thành viên chậm';

  @override
  String get syncPlayRepeat => 'Lặp lại';

  @override
  String get syncPlayRepeatOne => 'Một';

  @override
  String get syncPlayShuffleModeShuffled => 'Đã xáo trộn';

  @override
  String get syncPlayShuffleModeSorted => 'Đã sắp xếp';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Đồng bộ hóa hàng đợi phát lại hiện tại';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Thay thế hàng đợi nhóm bằng hàng đợi đang phát cục bộ';

  @override
  String get syncPlayLeaveGroup => 'Rời khỏi nhóm';

  @override
  String get syncPlayGroupQueue => 'Hàng đợi nhóm';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Mục $index';
  }

  @override
  String get syncPlayPlayNow => 'Chơi ngay';

  @override
  String get syncPlayCreateNewGroup => 'Tạo một nhóm mới';

  @override
  String get syncPlayGroupName => 'Tên nhóm';

  @override
  String get syncPlayDefaultGroupName => 'Nhóm SyncPlay của tôi';

  @override
  String get syncPlayCreateGroup => 'Tạo nhóm';

  @override
  String get syncPlayAvailableGroups => 'Các nhóm có sẵn';

  @override
  String get syncPlayNoGroupsAvailable => 'Không có nhóm nào';

  @override
  String get syncPlayJoinGroupQuestion => 'Tham gia nhóm SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Việc tham gia nhóm SyncPlay có thể thay thế hàng đợi phát lại hiện tại của bạn. Tiếp tục?';

  @override
  String get syncPlayJoin => 'Tham gia';

  @override
  String get syncPlayStateIdle => 'Nhàn rỗi';

  @override
  String get syncPlayStateWaiting => 'Chờ';

  @override
  String get syncPlayStatePaused => 'Đã tạm dừng';

  @override
  String get syncPlayStatePlaying => 'Đang chơi';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName đã tham gia nhóm SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName đã rời khỏi nhóm SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Quyền truy cập SyncPlay bị từ chối';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Bạn không có quyền truy cập vào một hoặc nhiều mục trong nhóm SyncPlay này. Yêu cầu chủ sở hữu nhóm xác minh quyền thư viện hoặc chọn một hàng đợi khác.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Đang đồng bộ hóa quá trình phát lại với $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'Tìm kiếm bằng giọng nói không khả dụng.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Phát trực tiếp Dolby Vision không thành công';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Không thể bắt đầu phát trực tiếp cho luồng Dolby Vision này. Thử lại bằng cách sử dụng chuyển mã máy chủ?';

  @override
  String get retryWithTranscode => 'Thử lại bằng chuyển mã';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Không được hỗ trợ';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Thiết bị này không thể giải mã trực tiếp nội dung Dolby Vision. Sử dụng dự phòng HDR10 hoặc yêu cầu chuyển mã máy chủ.';

  @override
  String get rememberMyChoice => 'Hãy nhớ sự lựa chọn của tôi';

  @override
  String get playHdr10Fallback => 'Phát dự phòng HDR10';

  @override
  String get requestTranscode => 'Yêu cầu chuyển mã';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã tìm thấy # hàng',
      one: 'Đã tìm thấy # hàng',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Xem Tất Cả';

  @override
  String get noItems => 'Không có mục nào';

  @override
  String get switchUser => 'Chuyển đổi người dùng';

  @override
  String get remoteControl => 'Điều khiển từ xa';

  @override
  String get mediaBarLoading => 'Đang tải thanh phương tiện...';

  @override
  String get mediaBarError => 'Thanh phương tiện không tải được';

  @override
  String get offlineServerUnavailable =>
      'Đã kết nối với internet nhưng máy chủ hiện tại không khả dụng.';

  @override
  String get offlineNoInternet =>
      'Bạn đang ngoại tuyến. Chỉ có nội dung được tải xuống mới có sẵn.';

  @override
  String get offlineFileNotAvailable => 'Tệp không có sẵn';

  @override
  String get offlineSwitchServer => 'Chuyển đổi máy chủ';

  @override
  String get offlineSavedMedia => 'Phương tiện đã lưu';

  @override
  String get offlineBannerTitle => 'Bạn đang ngoại tuyến';

  @override
  String get offlineBannerSubtitle => 'Đang hiển thị các mục đã tải xuống';

  @override
  String get offlineBannerAction => 'Tải xuống';

  @override
  String get serverUnreachableBannerTitle =>
      'Không kết nối được máy chủ của bạn';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Đang phát từ các mục đã tải xuống cho đến khi máy chủ hoạt động lại';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Phát lại từ xa';

  @override
  String castControlFailed(String error) {
    return 'Điều khiển truyền không thành công: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Điều khiển';
  }

  @override
  String get castDeviceVolume => 'Âm lượng thiết bị';

  @override
  String get castVolumeUnavailable => 'Không có sẵn';

  @override
  String castStopKind(String kind) {
    return 'Dừng $kind';
  }

  @override
  String get audioLabel => 'Âm thanh';

  @override
  String get subtitlesLabel => 'phụ đề';

  @override
  String get pinConfirmTitle => 'Xác nhận mã PIN';

  @override
  String get pinSetTitle => 'Đặt mã PIN';

  @override
  String get pinEnterTitle => 'Nhập mã PIN';

  @override
  String get pinReenterToConfirm => 'Nhập lại mã PIN của bạn để xác nhận';

  @override
  String pinEnterNDigit(int length) {
    return 'Nhập mã PIN $length-chữ số';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Nhập mã PIN $length-chữ số của bạn';
  }

  @override
  String get pinIncorrect => 'Mã PIN không chính xác';

  @override
  String get pinMismatch => 'Mã PIN không khớp';

  @override
  String get pinForgot => 'Quên mã PIN?';

  @override
  String get pinClear => 'Xóa';

  @override
  String get pinBackspace => 'Phím lùi';

  @override
  String get quickConnectAuthorized => 'Đã phê duyệt yêu cầu Quick Connect.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Mã Quick Connect không hợp lệ hoặc đã hết hạn.';

  @override
  String get quickConnectNotSupported =>
      'Máy chủ này không hỗ trợ Quick Connect.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Không phê duyệt được mã Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect đã bị tắt trên máy chủ này.';

  @override
  String get quickConnectForbidden =>
      'Tài khoản của bạn không thể phê duyệt yêu cầu Quick Connect này.';

  @override
  String get quickConnectNotFound =>
      'Không tìm thấy mã Quick Connect. Hãy thử mã mới.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect thất bại: $message';
  }

  @override
  String get quickConnectEnterCode => 'Nhập mã';

  @override
  String get quickConnectAuthorize => 'Ủy quyền';

  @override
  String remoteCommandFailed(String error) {
    return 'Lệnh không thành công: $error';
  }

  @override
  String get remoteControlTitle => 'Điều khiển từ xa';

  @override
  String get remoteFailedToLoadSessions => 'Không tải được phiên';

  @override
  String get remoteNoSessions => 'Không có phiên kiểm soát';

  @override
  String get remoteStartPlayback => 'Bắt đầu phát lại trên thiết bị khác';

  @override
  String get unknownUser => 'Không xác định';

  @override
  String get unknownItem => 'Không xác định';

  @override
  String get remoteNothingPlaying => 'Không có gì đang phát trong phiên này';

  @override
  String get castingStarted => 'Đã bắt đầu truyền trên thiết bị đã chọn';

  @override
  String castingFailed(String error) {
    return 'Không thể bắt đầu truyền: $error';
  }

  @override
  String get noRemoteDevices => 'Không có thiết bị phát lại từ xa nào.';

  @override
  String get noRemoteDevicesIos =>
      'Không có thiết bị phát lại từ xa nào.\n\nTrên iOS, mục tiêu AirPlay có thể không có sẵn trong trình mô phỏng.';

  @override
  String get trackActionPlayNext => 'Chơi tiếp';

  @override
  String get trackActionAddToQueue => 'Thêm vào hàng đợi';

  @override
  String get trackActionAddToPlaylist => 'Thêm vào danh sách phát';

  @override
  String get trackActionCancelDownload => 'Hủy tải xuống';

  @override
  String get trackActionDeleteFromPlaylist => 'Xóa khỏi Danh sách phát';

  @override
  String get trackActionMoveUp => 'Di chuyển lên';

  @override
  String get trackActionMoveDown => 'Di chuyển xuống';

  @override
  String get trackActionRemoveFromFavorites => 'Xóa khỏi Mục yêu thích';

  @override
  String get trackActionAddToFavorites => 'Thêm vào mục yêu thích';

  @override
  String get trackActionGoToAlbum => 'Đi tới Anbom';

  @override
  String get trackActionGoToArtist => 'Chuyển đến Nghệ sĩ';

  @override
  String trackActionDownloading(String name) {
    return 'Đang tải xuống $name...';
  }

  @override
  String get trackActionDeletedFile => 'Đã xóa tệp đã tải xuống';

  @override
  String get trackActionDeleteFileFailed =>
      'Không thể xóa tập tin đã tải xuống';

  @override
  String get shuffleBy => 'Xáo trộn theo';

  @override
  String get shuffleSelectLibrary => 'Chọn thư viện';

  @override
  String get shuffleSelectGenre => 'Chọn thể loại';

  @override
  String get shuffleLibrary => 'Thư viện';

  @override
  String get shuffleGenre => 'thể loại';

  @override
  String get shuffleNoLibraries => 'Không có thư viện tương thích có sẵn.';

  @override
  String get shuffleNoGenres =>
      'Không tìm thấy thể loại nào cho chế độ phát ngẫu nhiên này.';

  @override
  String get posterDisplayTitle => 'Trưng bày';

  @override
  String get posterImageType => 'Loại hình ảnh';

  @override
  String get imageTypePoster => 'Áp phích';

  @override
  String get imageTypeThumbnail => 'Hình thu nhỏ';

  @override
  String get imageTypeBanner => 'Ngọn cờ';

  @override
  String get playlistAddFailed => 'Không thêm được vào danh sách phát';

  @override
  String get playlistCreateFailed => 'Không tạo được danh sách phát';

  @override
  String get playlistNew => 'Danh sách phát mới';

  @override
  String get playlistCreate => 'Tạo nên';

  @override
  String get playlistCreateNew => 'Tạo danh sách phát mới';

  @override
  String get playlistNoneFound => 'Không tìm thấy danh sách phát nào';

  @override
  String get addToPlaylist => 'Thêm vào danh sách phát';

  @override
  String get lyricsNotAvailable => 'Không có lời bài hát nào';

  @override
  String get upNext => 'Tiếp theo';

  @override
  String get playNext => 'Chơi tiếp';

  @override
  String get stillWatchingContent =>
      'Việc phát lại đã bị tạm dừng. Bạn vẫn đang xem chứ?';

  @override
  String get stillWatchingStop => 'Dừng';

  @override
  String get stillWatchingContinue => 'Tiếp tục';

  @override
  String skipSegment(String segment) {
    return 'Bỏ qua $segment';
  }

  @override
  String get liveTv => 'Truyền hình trực tiếp';

  @override
  String get continueWatchingAndNextUp => 'Tiếp tục xem và tiếp theo';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Đang tải xuống $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Đang tải xuống $fileName';
  }

  @override
  String get nextEpisode => 'Tập tiếp theo';

  @override
  String get moreFromThisSeason => 'Thêm từ mùa này';

  @override
  String get playerTooltipPlaybackSpeed => 'Tốc độ phát lại';

  @override
  String get playerTooltipCastControls => 'Điều khiển truyền';

  @override
  String get playerTooltipPlaybackQuality => 'Tốc độ bit';

  @override
  String get playerTooltipEnterFullscreen => 'Nhập toàn màn hình';

  @override
  String get playerTooltipExitFullscreen => 'Thoát toàn màn hình';

  @override
  String get playerTooltipFloatOnTop => 'Nổi lên trên';

  @override
  String get playerTooltipExitFloatOnTop => 'Vô hiệu hóa float trên cùng';

  @override
  String get playerTooltipLockLandscape => 'Khóa phong cảnh';

  @override
  String get playerTooltipUnlockOrientation => 'Cho phép xoay';

  @override
  String get playerTooltipPrevious => 'Trước';

  @override
  String get playerTooltipSeekBack => 'Tìm lại';

  @override
  String get playerTooltipSeekForward => 'Tìm về phía trước';

  @override
  String get contextMenuMarkWatched => 'Đánh dấu là đã xem';

  @override
  String get contextMenuMarkUnwatched => 'Đánh dấu là chưa xem';

  @override
  String get contextMenuAddToFavorites => 'Thêm vào mục yêu thích';

  @override
  String get contextMenuRemoveFromFavorites => 'Xóa khỏi Mục yêu thích';

  @override
  String get contextMenuGoToSeries => 'Đi tới loạt bài';

  @override
  String get contextMenuHideFromContinueWatching => 'Ẩn khỏi Tiếp tục xem';

  @override
  String get contextMenuHideFromNextUp => 'Ẩn khỏi Tiếp theo';

  @override
  String get contextMenuAddToCollection => 'Thêm vào bộ sưu tập';

  @override
  String get settingsAdministrationSubtitle => 'Truy cập bảng quản trị máy chủ';

  @override
  String get settingsAccountSecurity => 'Tài khoản & Bảo mật';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Xác thực, mã PIN và kiểm soát của phụ huynh';

  @override
  String get settingsPersonalization => 'Cá nhân hóa';

  @override
  String get settingsPersonalizationSubtitle =>
      'Chủ đề, điều hướng, hàng nhà và khả năng hiển thị thư viện';

  @override
  String get settingsDynamicContent => 'Nội dung động';

  @override
  String get settingsDynamicContentSubtitle => 'Media Bar và lớp phủ trực quan';

  @override
  String get settingsPlaybackSyncplay => 'Phát lại & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Cài đặt âm thanh/video, phụ đề, nội dung tải xuống và điều khiển SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Đồng bộ hóa plugin, Seerr, xếp hạng và hơn thế nữa';

  @override
  String get settingsAboutSubtitle =>
      'Phiên bản ứng dụng, thông tin pháp lý và tín dụng';

  @override
  String get settingsAuthenticationSection => 'XÁC THỰC';

  @override
  String get settingsSortServersBy => 'Sắp xếp máy chủ theo';

  @override
  String get settingsLastUsed => 'Được sử dụng lần cuối';

  @override
  String get settingsAlphabetical => 'theo bảng chữ cái';

  @override
  String get settingsConnectionSection => 'KẾT NỐI';

  @override
  String get settingsAllowSelfSignedCerts => 'Cho phép chứng chỉ tự ký';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Tin cậy các máy chủ dùng chứng chỉ TLS tự ký hoặc từ CA riêng. Chỉ bật với những máy chủ bạn kiểm soát. Tùy chọn này sẽ tắt việc xác thực chứng chỉ cho mọi kết nối.';

  @override
  String get settingsPrivacyAndSafetySection => 'RIÊNG TƯ & AN TOÀN';

  @override
  String get settingsBlockedRatings => 'Xếp hạng bị chặn';

  @override
  String get settingsGeneralStyle => 'Phong cách chung';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Điểm nhấn của chủ đề, phông nền, chỉ báo đã xem và nhạc chủ đề';

  @override
  String get settingsDetailsScreen => 'Màn hình chi tiết';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Kiểu, làm mờ nền và cách hoạt động của thẻ';

  @override
  String get settingsHomePage => 'Trang chủ';

  @override
  String get settingsHomePageSubtitle =>
      'Các phần, loại hình ảnh, lớp phủ và bản xem trước phương tiện';

  @override
  String get settingsLibrariesSubtitle =>
      'Khả năng hiển thị thư viện, chế độ xem thư mục và hoạt động của nhiều máy chủ';

  @override
  String get settingsTwentyFourHourClock => 'Đồng hồ 24 giờ';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Sử dụng định dạng thời gian 24 giờ ở bất cứ nơi nào đồng hồ được hiển thị';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Hiển thị nút phát ngẫu nhiên trên thanh điều hướng';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Hiển thị nút thể loại trong thanh điều hướng';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Hiển thị nút yêu thích trên thanh điều hướng';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Hiển thị nút thư viện trong thanh điều hướng';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Hiển thị nút Seerr trên thanh điều hướng';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Luôn hiển thị nhãn chữ trên thanh điều hướng phía trên';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Chuyển đổi khả năng hiển thị trang chủ cho mỗi thư viện. Khởi động lại Moonfin để các thay đổi có hiệu lực.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Thanh phương tiện & bản xem trước cục bộ';

  @override
  String get settingsVisualOverlays => 'Lớp phủ trực quan';

  @override
  String get settingsSeasonalSurprise => 'Bất ngờ theo mùa';

  @override
  String get settingsMetadataAndRatings => 'Siêu dữ liệu & Xếp hạng';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase hỗ trợ tích hợp phía máy chủ bao gồm các nguồn xếp hạng bổ sung, yêu cầu Seerr và tùy chọn được đồng bộ hóa.';

  @override
  String get settingsOfflineDownloads => 'Tải xuống ngoại tuyến';

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
  String get settingsHigh => 'Cao';

  @override
  String get settingsLow => 'Thấp';

  @override
  String get settingsCustomPath => 'Đường dẫn tùy chỉnh';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Nhập đường dẫn thư mục tải xuống';

  @override
  String get settingsConcurrentDownloads => 'Tải xuống đồng thời';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Số lượng mục tối đa để tải xuống cùng một lúc.';

  @override
  String get settingsAppInfo => 'THÔNG TIN ỨNG DỤNG';

  @override
  String get settingsReportAnIssue => 'Báo cáo sự cố';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Mở trình theo dõi vấn đề trên GitHub';

  @override
  String get settingsJoinDiscord => 'Tham gia Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Trò chuyện với cộng đồng';

  @override
  String get settingsJoinTheDiscord => 'Tham gia Discord';

  @override
  String get settingsSupportMoonfin => 'Hỗ trợ Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Mời nhà phát triển một ly cà phê';

  @override
  String get settingsLegal => 'HỢP PHÁP';

  @override
  String get settingsLicenses => 'Giấy phép';

  @override
  String get settingsOpenSourceLicenseNotices => 'Thông báo giấy phép nguồn mở';

  @override
  String get settingsPrivacyPolicy => 'Chính sách bảo mật';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Cách Moonfin xử lý dữ liệu của bạn';

  @override
  String get settingsCheckForUpdates => 'Kiểm tra cập nhật';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Kiểm tra bản phát hành Moonfin mới nhất';

  @override
  String get settingsPoweredByFlutter => 'Được cung cấp bởi Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# thông báo giấy phép',
      one: '# thông báo giấy phép',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Cả hai';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Bộ lọc loại nội dung ngẫu nhiên';

  @override
  String get settingsVideoPlaybackPreferences => 'Tùy chọn phát lại video';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Công cụ video cốt lõi và cài đặt chất lượng phát trực tuyến';

  @override
  String get settingsAudioPreferences => 'Tùy chọn âm thanh';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Các tùy chọn theo dõi, xử lý và chuyển tiếp âm thanh';

  @override
  String get settingsAutomationAndQueue => 'Tự động hóa & xếp hàng';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Tự động phát lại và sắp xếp thứ tự';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Chất lượng tải xuống, giới hạn lưu trữ và kích thước hàng đợi';

  @override
  String get settingsSyncplaySubtitle => 'Logic đồng bộ hóa cho phiên nhóm';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Các tính năng của người chơi chuyên biệt. Hãy thận trọng khi sử dụng vì một số tùy chọn có thể gây ra sự cố phát lại';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Bỏ qua phần giới thiệu và phần kết thúc?';

  @override
  String get settingsMediaSegmentCountdown => 'Đếm ngược phân đoạn phương tiện';

  @override
  String get settingsProgressBar => 'Thanh tiến trình';

  @override
  String get settingsTimer => 'Bộ đếm giờ';

  @override
  String get settingsNone => 'Không có';

  @override
  String get settingsPromptUser => 'Nhắc người dùng';

  @override
  String get settingsSkip => 'Nhảy';

  @override
  String get settingsDoNothing => 'Không làm gì cả';

  @override
  String get settingsMaxBitrateDescription =>
      'Giới hạn tốc độ bit phát trực tuyến. Nội dung trên ngưỡng này sẽ được chuyển mã cho phù hợp.';

  @override
  String get settingsMaxResolutionDescription =>
      'Giới hạn độ phân giải tối đa mà người chơi sẽ yêu cầu. Nội dung có độ phân giải cao hơn sẽ được chuyển mã xuống.';

  @override
  String get settingsPlayerZoomDescription =>
      'Video nên được thu nhỏ như thế nào để vừa với màn hình.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Công cụ phát lại (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Chọn công cụ phát lại mặc định trên thiết bị Android TV. Những thay đổi áp dụng cho phiên phát lại tiếp theo.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (được khuyến nghị)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (cũ)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (cũ)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (được khuyến nghị)';

  @override
  String get settingsDolbyVisionFallback => 'Dự phòng Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Hành vi của các tựa game Dolby Vision trên các thiết bị không có giải mã Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Hỏi mỗi lần';

  @override
  String get settingsPreferHdr10Fallback => 'Ưu tiên dự phòng HDR10';

  @override
  String get settingsPreferServerTranscode => 'Ưu tiên chuyển mã máy chủ';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Cấu hình Dolby Vision 7 Phát trực tiếp';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Kiểm soát xem các luồng lớp nâng cao của cấu hình Dolby Vision có nên phát trực tiếp hay không.';

  @override
  String get settingsAutoAftkrtEnabled => 'Tự động (đã bật AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'Đã bật trên thiết bị này';

  @override
  String get settingsDisabledPreferTranscode => 'Đã tắt (ưu tiên chuyển mã)';

  @override
  String get settingsResumeRewindDescription =>
      'Khi tiếp tục phát lại (từ Tiếp tục xem hoặc trang mục phương tiện), cần tua lại bao nhiêu giây?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Khi tiếp tục phát lại sau khi nhấn nút tạm dừng, cần tua lại bao nhiêu giây?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Quay lại bao nhiêu giây sau khi nhấn nút tua lại.';

  @override
  String get settingsOneSecond => '1 giây';

  @override
  String get settingsThreeSeconds => '3 giây';

  @override
  String get settingsFortyFiveSeconds => '45 giây';

  @override
  String get settingsSixtySeconds => '60 giây';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Nhảy về phía trước bao nhiêu giây sau khi nhấn nút tua đi nhanh.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Dòng bit AC3 sang bộ giải mã bên ngoài';

  @override
  String get settingsCinemaMode => 'Chế độ rạp chiếu phim';

  @override
  String get settingsCinemaModeSubtitle =>
      'Phát đoạn giới thiệu/đoạn trước trước tính năng chính';

  @override
  String get settingsNextUpDisplayDescription =>
      'Phần mở rộng hiển thị thẻ đầy đủ có hình minh họa và mô tả của tập. Tối thiểu hiển thị lớp phủ đếm ngược nhỏ gọn. Đã tắt sẽ ẩn hoàn toàn lời nhắc.';

  @override
  String get settingsShort => 'Ngắn';

  @override
  String get settingsLong => 'Dài';

  @override
  String get settingsVeryLong => 'Rất dài';

  @override
  String get settingsVideoStartDelay => 'Độ trễ bắt đầu video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Truyền hình trực tiếp trực tiếp';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Bật phát trực tiếp cho Truyền hình trực tiếp';

  @override
  String get settingsOpenGroups => 'Nhóm mở';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Tạo, tham gia hoặc quản lý nhóm SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'Đã bật SyncPlay';

  @override
  String get settingsSyncplayEnabledSubtitle => 'Bật tính năng xem nhóm';

  @override
  String get settingsSyncplayButton => 'Nút SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Hiển thị nút SyncPlay trên thanh điều hướng';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Chỉnh sửa nâng cao';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Kích hoạt logic đồng bộ hóa chi tiết';

  @override
  String get settingsSyncplaySyncCorrection => 'Chỉnh sửa đồng bộ hóa';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Tự động điều chỉnh phát lại để luôn đồng bộ';

  @override
  String get settingsSyncplaySpeedToSync => 'Tốc độ đồng bộ hóa';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Sử dụng điều chỉnh tốc độ phát lại để đồng bộ hóa';

  @override
  String get settingsSyncplaySkipToSync => 'Chuyển sang Đồng bộ hóa';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Sử dụng tính năng tìm kiếm để đồng bộ hóa';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Độ trễ tốc độ tối thiểu';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Độ trễ tốc độ tối đa';

  @override
  String get settingsSyncplaySpeedDuration => 'Thời lượng tốc độ';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Độ trễ bỏ qua tối thiểu';

  @override
  String get settingsSyncplayExtraOffset => 'Phần bù bổ sung SyncPlay';

  @override
  String get onNow => 'Đang bật';

  @override
  String get collections => 'Bộ sưu tập';

  @override
  String get lastPlayed => 'Chơi lần cuối';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Mới nhất $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '$libraryName mới phát hành';
  }

  @override
  String get autoplayNextEpisode => 'Tự động phát tập tiếp theo';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Tự động phát tập tiếp theo khi có sẵn.';

  @override
  String get skipSilenceTitle => 'Bỏ qua sự im lặng';

  @override
  String get skipSilenceSubtitle =>
      'Tự động bỏ qua các đoạn âm thanh im lặng khi được luồng hỗ trợ.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Cho phép hiệu ứng âm thanh bên ngoài';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Cho phép các ứng dụng bộ chỉnh âm và hiệu ứng (ví dụ: Wavelet) đính kèm vào các phiên phát lại Media3.';

  @override
  String get disableTunnelingTitle => 'Vô hiệu hóa đường hầm';

  @override
  String get disableTunnelingSubtitle =>
      'Buộc phát lại không theo đường hầm. Hữu ích trên các thiết bị có sự gián đoạn về âm thanh/video trong đường hầm.';

  @override
  String get enableTunnelingTitle => 'Bật tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Nâng cao. Định tuyến âm thanh và video qua một đường phần cứng ghép đôi. Mặc định tắt vì gây mất tiếng hoặc mất hình trên một số thiết bị.';

  @override
  String get mapDolbyVisionP7Title => 'Ánh xạ hồ sơ Dolby Vision 7 tới HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Phát các luồng hồ sơ 7 Dolby Vision dưới dạng HEVC tương thích HDR10 trên các thiết bị không phải DV.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Sử dụng kiểu phụ đề được nhúng';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Áp dụng màu sắc, phông chữ và vị trí được nhúng trong bản phụ đề. Thay vào đó, hãy tắt sử dụng tùy chọn kiểu chú thích của bạn.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Sử dụng kích thước phông chữ phụ đề được nhúng';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Áp dụng gợi ý về kích thước phông chữ được nhúng trong phụ đề. Tắt để sử dụng kích thước phụ đề từ tùy chọn kiểu của bạn.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Hiển thị chi tiết nội dung';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Hiển thị chi tiết của mục đang chọn ở đầu trang Thư viện.';

  @override
  String get hideBackdropsInLibraries => 'Ẩn ảnh nền khi duyệt?';

  @override
  String get useDetailedSubHeadings => 'Sử dụng các tiêu đề phụ chi tiết';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Hiển thị subrow chi tiết hoặc tối thiểu trên các trang Thư viện.';

  @override
  String get savedThemesDeleteDialogTitle => 'Xóa chủ đề đã lưu?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Xóa \"$themeName\" khỏi bộ đệm của thiết bị này?';
  }

  @override
  String get themeStore => 'Kho chủ đề';

  @override
  String get themeStoreSubtitle => 'Duyệt và lưu các chủ đề từ cộng đồng';

  @override
  String get themeStoreDescription =>
      'Lưu một chủ đề để dùng như các chủ đề đã lưu khác của bạn.';

  @override
  String get themeStoreEmpty => 'Hiện chưa có chủ đề nào.';

  @override
  String get themeStoreLoadFailed =>
      'Không tải được Kho chủ đề. Hãy kiểm tra kết nối và thử lại.';

  @override
  String get themeStoreSave => 'Lưu';

  @override
  String get themeStoreSaveAndApply => 'Lưu & áp dụng';

  @override
  String get themeStoreSaved => 'Đã lưu';

  @override
  String get themeStoreInvalidMessage => 'Không tải được chủ đề này.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Đã lưu \"$themeName\".';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Đã xóa \"$themeName\" khỏi thiết bị này.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Không thể xóa \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Chủ đề đã lưu';

  @override
  String get savedThemesDescription =>
      'Đây là các chủ đề được tải xuống từ plugin Moonfin cho máy chủ hiện tại. Việc xóa chỉ xóa bản sao cục bộ này.';

  @override
  String get savedThemesEmpty =>
      'Không tìm thấy chủ đề đã lưu nào cho máy chủ này.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Hiện đang hoạt động';
  }

  @override
  String get savedThemesDeleteTooltip => 'Xóa chủ đề đã lưu';

  @override
  String get savedThemesManageSubtitle =>
      'Quản lý các chủ đề plugin đã tải xuống trên thiết bị này';

  @override
  String get themeEditor => 'Trình chỉnh sửa chủ đề';

  @override
  String get themeEditorSubtitle =>
      'Mở Trình chỉnh sửa chủ đề Moonfin trong trình duyệt của bạn';

  @override
  String get homeScreen => 'Màn hình chính';

  @override
  String get bottomBar => 'Thanh dưới cùng';

  @override
  String get homeRowsStyleClassic => 'Cổ điển';

  @override
  String get homeRowsStyleModern => 'Hiện đại';

  @override
  String get homeRowsSection => 'Hàng nhà';

  @override
  String get homeRowDisplay => 'Hiển thị hàng trang chủ';

  @override
  String get homeRowSections => 'Các mục hàng trang chủ';

  @override
  String get homeRowToggles => 'Bật/tắt hàng trang chủ';

  @override
  String get homeRowTogglesSubtitle =>
      'Bật hoặc tắt các danh mục hàng trang chủ dựa trên thư viện';

  @override
  String get homeRowTogglesDescription =>
      'Bật các mục sau để hiển thị các hàng trong phần Trang chủ.';

  @override
  String get rowsType => 'Loại hàng';

  @override
  String get rowsTypeDescription =>
      'Classic giữ loại hình ảnh và lớp phủ thông tin trên mỗi hàng. Hiện đại sử dụng các hàng từ dọc đến phông nền.';

  @override
  String get displayFavoritesRows => 'Hiển thị hàng yêu thích';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Hiển thị Phim, Bộ phim yêu thích và các hàng yêu thích khác trong Phần Trang chủ.';

  @override
  String get favoritesRowSorting => 'Sắp xếp hàng yêu thích';

  @override
  String get favoritesRowSortingDescription =>
      'Sắp xếp các hàng Mục yêu thích theo ngày thêm, ngày phát hành, theo thứ tự bảng chữ cái, v.v.';

  @override
  String get displayCollectionsRows => 'Hiển thị các hàng bộ sưu tập';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Hiển thị các hàng Bộ sưu tập trong Phần Trang chủ.';

  @override
  String get collectionsRowSorting => 'Sắp xếp hàng bộ sưu tập';

  @override
  String get collectionsRowSortingDescription =>
      'Sắp xếp các hàng Bộ sưu tập theo ngày thêm, ngày phát hành, theo thứ tự bảng chữ cái, v.v.';

  @override
  String get displayGenresRows => 'Hiển thị dòng thể loại';

  @override
  String get displayGenresRowsSubtitle =>
      'Hiển thị các hàng Thể loại trong Phần Trang chủ.';

  @override
  String get genresRowSorting => 'Sắp xếp hàng thể loại';

  @override
  String get genresRowSortingDescription =>
      'Sắp xếp các hàng Thể loại theo ngày thêm, ngày phát hành, theo thứ tự bảng chữ cái, v.v.';

  @override
  String get genresRowItems => 'Các mục hàng thể loại';

  @override
  String get genresRowItemsDescription =>
      'Hiển thị Phim, Bộ hoặc cả hai trong hàng Thể loại.';

  @override
  String get displayPlaylistsRows => 'Hiển thị hàng danh sách phát';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Hiển thị các hàng danh sách phát trong phần Trang chủ.';

  @override
  String get playlistsRowSorting => 'Sắp xếp hàng danh sách phát';

  @override
  String get playlistsRowSortingDescription =>
      'Sắp xếp hàng danh sách phát theo ngày thêm, ngày phát hành, theo bảng chữ cái và nhiều tiêu chí khác.';

  @override
  String get displayAudioRows => 'Hiển thị hàng âm thanh';

  @override
  String get displayAudioRowsSubtitle =>
      'Hiển thị các hàng âm thanh trong phần Trang chủ.';

  @override
  String get audioRowsSorting => 'Sắp xếp hàng âm thanh';

  @override
  String get audioRowsSortingDescription =>
      'Sắp xếp hàng âm thanh theo ngày thêm, ngày phát hành, theo bảng chữ cái và nhiều tiêu chí khác.';

  @override
  String get audioPlaylists => 'Danh sách phát âm thanh';

  @override
  String get appearance => 'Giao diện';

  @override
  String get layout => 'Bố cục';

  @override
  String get theme => 'Chủ đề';

  @override
  String get keyboard => 'Bàn phím';

  @override
  String get navButtons => 'Nút';

  @override
  String get rendering => 'Kết xuất';

  @override
  String get mpvConfiguration => 'Cấu hình MPV';

  @override
  String get cardSize => 'Kích thước thẻ';

  @override
  String get externalPlayerApp => 'Ứng dụng trình phát bên ngoài';

  @override
  String get externalPlayerAppDescription =>
      'Thiết lập trình phát ngoài để bật tùy chọn phát khi nhấn giữ';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Hiển thị trình chọn ứng dụng khi bắt đầu phát lại.';

  @override
  String get loadingInstalledPlayers => 'Đang tải trình phát đã cài đặt...';

  @override
  String get connection => 'Sự liên quan';

  @override
  String get audioTranscodeTarget => 'Mục tiêu chuyển mã âm thanh';

  @override
  String get passthrough => 'Truyền qua';

  @override
  String get supportedOnThisDevice => 'Được hỗ trợ trên thiết bị này';

  @override
  String get notSupportedOnThisDevice => 'Không được hỗ trợ trên thiết bị này';

  @override
  String get settingsAudioDtsXPassthrough => 'Truyền qua DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Dòng bit DTS:X (DTS UHD) tới bộ giải mã bên ngoài.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD với Truyền qua Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Hành vi của trình phát đa phương tiện';

  @override
  String get playbackEnhancements => 'Cải tiến phát lại';

  @override
  String get alwaysOn => 'Luôn bật.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Thay thế Skip Outro bằng Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Hiển thị lớp phủ Tiếp theo thay vì nút Bỏ qua.';

  @override
  String get playerRouting => 'Định tuyến người chơi';

  @override
  String get preferSoftwareDecoders => 'Ưu tiên phần mềm giải mã';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Sử dụng FFmpeg (âm thanh) và libgav1 (AV1) trước bộ giải mã phần cứng. Tắt nếu quá trình truyền âm thanh HDMI bị hỏng.';

  @override
  String get useExternalPlayer => 'Sử dụng trình phát bên ngoài';

  @override
  String get useExternalPlayerSubtitle =>
      'Mở tính năng phát lại video trong ứng dụng bên ngoài đã chọn của bạn trên Android TV.';

  @override
  String get automaticQueuing => 'Xếp hàng tự động';

  @override
  String get preferSdhSubtitles => 'Ưu tiên phụ đề SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Ưu tiên các bản phụ đề SDH/CC khi tự động chọn.';

  @override
  String get webDiagnostics => 'Chẩn đoán web';

  @override
  String get webDiagnosticsTitle => 'Moonfin Chẩn đoán web';

  @override
  String get webDiagnosticsIntro =>
      'Sử dụng trang này để chẩn đoán các sự cố kết nối trình duyệt (CORS, nội dung hỗn hợp và cài đặt khám phá).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Đã phát hiện lỗi nội dung hỗn hợp';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Đã phát hiện CORS/Lỗi trước ánh sáng';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin đã phát hiện thấy một trang HTTPS đang cố gọi URL máy chủ HTTP. Trình duyệt chặn yêu cầu này trước khi nó đến máy chủ của bạn.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin đã phát hiện ra lỗi yêu cầu ở cấp trình duyệt thường xảy ra do thiếu tiêu đề CORS hoặc preflight trên máy chủ phương tiện.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL mục tiêu: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Chi tiết: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Bối cảnh thời gian chạy hiện tại';

  @override
  String get webDiagnosticsOrigin => 'Nguồn gốc';

  @override
  String get webDiagnosticsScheme => 'Cơ chế';

  @override
  String get webDiagnosticsPluginMode => 'Chế độ bổ trợ';

  @override
  String get webDiagnosticsWebRtcScan => 'Quét WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL máy chủ bắt buộc';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL máy chủ mặc định';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL proxy khám phá';

  @override
  String get notConfigured => 'không được cấu hình';

  @override
  String get webDiagnosticsMixedContent => 'Nội dung hỗn hợp';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Trang này được tải qua HTTPS nhưng một hoặc nhiều URL được định cấu hình là HTTP. Trình duyệt chặn các trang HTTPS gọi API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Khắc phục: phân phối máy chủ phương tiện hoặc điểm cuối proxy của bạn qua HTTPS hoặc chỉ tải Moonfin qua HTTP trên các mạng cục bộ đáng tin cậy.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Không phát hiện thấy cấu hình nội dung hỗn hợp rõ ràng nào từ cài đặt thời gian chạy hiện tại.';

  @override
  String get webDiagnosticsCorsChecklist => 'Danh sách kiểm tra CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Cho phép nguồn gốc trình duyệt trong Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Bao gồm Ủy quyền, X-Emby-Authorization và X-Emby-Token trong Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Hiển thị Phạm vi nội dung và Phạm vi chấp nhận cho hành vi phát trực tuyến và tìm kiếm.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Trả về 204 cho các yêu cầu preflight của OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Đoạn tiêu đề ví dụ (kiểu nginx)';

  @override
  String get note => 'Ghi chú';

  @override
  String get webDiagnosticsNonWebNote =>
      'Tuyến chẩn đoán này dành cho các bản dựng web. Nếu bạn thấy điều này trên nền tảng khác thì những bước kiểm tra này có thể không áp dụng.';

  @override
  String get backToServerSelect => 'Quay lại máy chủ Chọn';

  @override
  String get signOutAllUsers => 'Đăng xuất tất cả người dùng';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Quyền sử dụng micrô bị từ chối vĩnh viễn. Kích hoạt nó trong cài đặt hệ thống.';

  @override
  String get voiceSearchPermissionRequired =>
      'Cần có sự cho phép của micrô để tìm kiếm bằng giọng nói.';

  @override
  String get voiceSearchNoMatch => 'Không nắm bắt được điều đó. Hãy thử lại.';

  @override
  String get voiceSearchNoSpeechDetected =>
      'Không phát hiện thấy giọng nói nào.';

  @override
  String get voiceSearchMicrophoneError => 'Lỗi micro.';

  @override
  String get voiceSearchNeedsInternet =>
      'Tìm kiếm bằng giọng nói cần có internet.';

  @override
  String get voiceSearchServiceBusy => 'Dịch vụ thoại đang bận. Hãy thử lại.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Quyền sử dụng micrô bị từ chối vĩnh viễn.';

  @override
  String get microphonePermissionDenied => 'Quyền sử dụng micrô bị từ chối.';

  @override
  String get speechRecognitionUnavailable =>
      'Tính năng nhận dạng giọng nói không khả dụng trên thiết bị này.';

  @override
  String get openIosRoutePicker => 'Mở bộ chọn tuyến đường iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Công cụ chọn tuyến AirPlay không khả dụng trên thiết bị này.';

  @override
  String get videos => 'Video';

  @override
  String get programs => 'Chương trình';

  @override
  String get songs => 'Bài hát';

  @override
  String get photoAlbums => 'Album ảnh';

  @override
  String get photos => 'Ảnh';

  @override
  String get people => 'Mọi người';

  @override
  String get recentlyReleasedEpisodes => 'Các tập phát hành gần đây';

  @override
  String get watchAgain => 'Xem lại';

  @override
  String get guestAppearances => 'Khách mời xuất hiện';

  @override
  String get appearancesSeerr => 'Xuất hiện (Seerr)';

  @override
  String get crewContributionsSeerr => 'Đóng góp của ê-kíp (Seerr)';

  @override
  String get watchWithGroup => 'Xem cùng nhóm';

  @override
  String get errors => 'Lỗi';

  @override
  String get warnings => 'Cảnh báo';

  @override
  String get disk => 'Đĩa';

  @override
  String get openInBrowser => 'Mở trong trình duyệt';

  @override
  String get embeddedBrowserNotAvailable =>
      'Trình duyệt nhúng không có sẵn trên nền tảng này.';

  @override
  String get adminRestartServerConfirmation =>
      'Bạn có chắc chắn muốn khởi động lại máy chủ không?';

  @override
  String get adminShutdownServerConfirmation =>
      'Bạn có chắc chắn muốn tắt máy chủ không? Bạn sẽ cần phải khởi động lại nó bằng tay.';

  @override
  String get internal => 'Nội bộ';

  @override
  String get idle => 'Nhàn rỗi';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Không tìm thấy người dùng nào';

  @override
  String get adminNoUsersMatchSearch =>
      'Không có người dùng nào phù hợp với tìm kiếm của bạn';

  @override
  String get adminNoDevicesFound => 'Không tìm thấy thiết bị nào';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Không có thiết bị nào phù hợp với bộ lọc hiện tại';

  @override
  String get passwordSet => 'Đã đặt mật khẩu';

  @override
  String get noPasswordConfigured => 'Không có mật khẩu được cấu hình';

  @override
  String get remoteAccess => 'Truy cập từ xa';

  @override
  String get localOnly => 'Chỉ địa phương';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Không tải được phân tích phương tiện';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Phân tích kết hợp trên tất cả các thư viện phương tiện.';

  @override
  String get analyticsTopArtists => 'Nghệ sĩ hàng đầu';

  @override
  String get analyticsTopAuthors => 'tác giả hàng đầu';

  @override
  String get analyticsTopContributors => 'Những người đóng góp hàng đầu';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Thư viện',
      one: '1 Thư viện',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Hiện chưa có tổng số phương tiện được lập chỉ mục cho lựa chọn này.';

  @override
  String get analyticsLibraryDetails => 'Chi tiết thư viện';

  @override
  String get analyticsLibraryBreakdown => 'Phân tích thư viện';

  @override
  String get analyticsNoLibrariesAvailable => 'Không có thư viện có sẵn.';

  @override
  String get adminServerAdministrationTitle => 'Quản trị máy chủ';

  @override
  String get adminServerPathData => 'dữ liệu';

  @override
  String get adminServerPathImageCache => 'Bộ đệm hình ảnh';

  @override
  String get adminServerPathCache => 'Bộ nhớ đệm';

  @override
  String get adminServerPathLogs => 'Nhật ký';

  @override
  String get adminServerPathMetadata => 'Siêu dữ liệu';

  @override
  String get adminServerPathTranscode => 'Chuyển mã';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Không có đường dẫn máy chủ nào được máy chủ này trả về.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% đã sử dụng';
  }

  @override
  String get userActivity => 'Hoạt động của người dùng';

  @override
  String get systemEvents => 'Sự kiện hệ thống';

  @override
  String get needsAttention => 'Cần chú ý';

  @override
  String get adminDrawerSectionServer => 'Máy chủ';

  @override
  String get adminDrawerSectionPlayback => 'Phát lại';

  @override
  String get adminDrawerSectionDevices => 'Thiết bị';

  @override
  String get adminDrawerSectionAdvanced => 'Trình độ cao';

  @override
  String get adminDrawerSectionPlugins => 'Plugin';

  @override
  String get adminDrawerSectionLiveTv => 'Truyền hình trực tiếp';

  @override
  String get homeVideos => 'Trang chủ Video';

  @override
  String get mixedContent => 'Nội dung hỗn hợp';

  @override
  String get homeVideosAndPhotos => 'Trang chủ Video & Hình ảnh';

  @override
  String get mixedMoviesAndShows => 'Phim và chương trình tổng hợp';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Không tìm thấy bản ghi nào';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Không tìm thấy trang hình ảnh nào trong kho lưu trữ .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Trình kết xuất được nhúng không thành công ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Trình kết xuất EPUB không thành công ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Thiếu tệp cục bộ cho trình đọc: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status trong khi mở dữ liệu sách từ $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Không có điểm cuối sách có thể đọc được';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Định dạng lưu trữ truyện tranh không được hỗ trợ: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Plugin trích xuất CBR không có sẵn trên nền tảng này.';

  @override
  String get failedToExtractCbrArchive =>
      'Không thể giải nén kho lưu trữ .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Trích xuất CB7 không có sẵn trên nền tảng này.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Plugin trích xuất CB7 không có sẵn trên nền tảng này.';

  @override
  String get closeGenrePanel => 'Đóng bảng thể loại';

  @override
  String get loadingShuffle => 'Đang tải ngẫu nhiên...';

  @override
  String get libraryShuffleLabel => 'PHÁT NGẪU NHIÊN THƯ VIỆN';

  @override
  String get randomShuffleLabel => 'PHÁT NGẪU NHIÊN TOÀN BỘ';

  @override
  String get genresShuffleLabel => 'PHÁT NGẪU NHIÊN THEO THỂ LOẠI';

  @override
  String get autoHdrSwitching => 'Tự động chuyển đổi HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Tự động bật HDR để phát lại video HDR và ​​khôi phục chế độ hiển thị khi thoát.';

  @override
  String get whenFullscreen => 'Khi toàn màn hình';

  @override
  String get changeArtwork => 'Đổi ảnh bìa';

  @override
  String get missing => 'Chưa có';

  @override
  String get transcodingLimits => 'Giới hạn chuyển mã';

  @override
  String get clearAllArtworkButton => 'Xóa toàn bộ ảnh bìa?';

  @override
  String get clearAllArtworkWarning =>
      'Bạn có chắc muốn xóa toàn bộ ảnh bìa đã tải xuống không?';

  @override
  String get confirmClear => 'Xác nhận xóa';

  @override
  String confirmClearMessage(String itemType) {
    return 'Bạn có chắc muốn xóa $itemType này không?';
  }

  @override
  String get uploadButton => 'Tải lên?';

  @override
  String get resolutionLabel => 'Độ phân giải: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Chỉ hiển thị ảnh bìa theo ngôn ngữ giao diện';

  @override
  String get confirmClearAll => 'Xác nhận xóa tất cả';

  @override
  String get imageUploadSuccess => 'Đã tải hình ảnh lên thành công!';

  @override
  String imageUploadFailed(String error) {
    return 'Không tải được hình ảnh lên: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Không đặt được hình ảnh: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Không xóa được hình ảnh: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Không xóa được toàn bộ ảnh bìa: $error';
  }

  @override
  String get yes => 'Có';

  @override
  String get posterCategory => 'Áp phích';

  @override
  String get backdropsCategory => 'Ảnh nền';

  @override
  String get bannerCategory => 'Biểu ngữ';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Hình thu nhỏ';

  @override
  String get artCategory => 'Ảnh minh họa';

  @override
  String get discArtCategory => 'Ảnh mặt đĩa';

  @override
  String get screenshotCategory => 'Ảnh chụp màn hình';

  @override
  String get boxCoverCategory => 'Bìa hộp';

  @override
  String get boxRearCoverCategory => 'Bìa sau hộp';

  @override
  String get menuArtCategory => 'Ảnh menu';

  @override
  String get confirmItemPoster => 'áp phích';

  @override
  String get confirmItemBackdrop => 'ảnh nền';

  @override
  String get confirmItemBanner => 'biểu ngữ';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'hình thu nhỏ';

  @override
  String get confirmItemArt => 'ảnh minh họa';

  @override
  String get confirmItemDiscArt => 'ảnh mặt đĩa';

  @override
  String get confirmItemScreenshot => 'ảnh chụp màn hình';

  @override
  String get confirmItemBoxCover => 'bìa hộp';

  @override
  String get confirmItemBoxRearCover => 'bìa sau hộp';

  @override
  String get confirmItemMenuArt => 'ảnh menu';

  @override
  String get resolutionAll => 'Tất cả';

  @override
  String get resolutionHigh => 'Cao (1080p+)';

  @override
  String get resolutionMedium => 'Trung bình (720p)';

  @override
  String get resolutionLow => 'Thấp (<720p)';

  @override
  String get sources => 'Nguồn';

  @override
  String get audiobookChapters => 'Chương';

  @override
  String get audiobookBookmarks => 'Dấu trang';

  @override
  String get audiobookNotes => 'Ghi chú';

  @override
  String get audiobookQueue => 'Hàng đợi';

  @override
  String get audiobookTimeline => 'Dòng thời gian';

  @override
  String get audiobookTimelineEmpty => 'Dòng thời gian trống';

  @override
  String get audiobookWholeBook => 'Toàn bộ sách';

  @override
  String get audiobookFocusedTimeline => 'Dòng thời gian thu hẹp';

  @override
  String get audiobookExportBookmarks => 'Xuất dấu trang';

  @override
  String get audiobookExportNotes => 'Xuất ghi chú';

  @override
  String get audiobookExportAll => 'Xuất tất cả';

  @override
  String audiobookExportSuccess(String path) {
    return 'Đã xuất tới $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Xuất thất bại: $error';
  }

  @override
  String get audiobookLyrics => 'Lời bài hát';

  @override
  String get audiobookAddBookmark => 'Thêm dấu trang';

  @override
  String get audiobookAddNote => 'Thêm ghi chú';

  @override
  String get audiobookEditNote => 'Sửa ghi chú';

  @override
  String get audiobookNoteHint => 'Viết ghi chú cho khoảnh khắc này';

  @override
  String get audiobookSleepTimer => 'Hẹn giờ tắt';

  @override
  String get audiobookSleepOff => 'Tắt';

  @override
  String get audiobookSleepEndOfChapter => 'Hết chương';

  @override
  String get audiobookSleepCustom => 'Tùy chỉnh';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Còn $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phút',
      one: '1 phút',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Tốc độ phát';

  @override
  String get audiobookRemainingTime => 'Còn lại';

  @override
  String get audiobookElapsedTime => 'Đã phát';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Lùi $seconds giây';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Tiến $seconds giây';
  }

  @override
  String get audiobookPreviousChapter => 'Chương trước';

  @override
  String get audiobookNextChapter => 'Chương sau';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Chương $current trên $total';
  }

  @override
  String get audiobookNoChapters => 'Không có chương';

  @override
  String get audiobookNoBookmarks => 'Chưa có dấu trang nào';

  @override
  String get audiobookNoNotes => 'Chưa có ghi chú nào';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Đã thêm dấu trang tại $position';
  }

  @override
  String get audiobookSpeedReset => 'Đặt lại về 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Lưu';

  @override
  String get audiobookCancel => 'Hủy';

  @override
  String get audiobookDelete => 'Xóa';

  @override
  String get subtitlePreferences => 'Tùy chọn phụ đề';

  @override
  String get subtitlePreferencesDescription =>
      'Thay đổi chế độ phụ đề, ngôn ngữ mặc định, giao diện và các tùy chọn kết xuất.';

  @override
  String get subtitleRendering => 'Kết xuất phụ đề';

  @override
  String get displayOptions => 'Tùy chọn hiển thị';

  @override
  String get releaseDateAscending => 'Ngày phát hành (Tăng dần)';

  @override
  String get releaseDateDescending => 'Ngày phát hành (Giảm dần)';

  @override
  String get groupContributions => 'Nhóm các đóng góp';

  @override
  String get groupMultipleRoles => 'Nhóm nhiều vai trò';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Cảnh báo quyền ghi vào thư viện';

  @override
  String get libraryWriteAccessHowToFix => 'Cách khắc phục:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Cấp quyền ghi cho người dùng dịch vụ Jellyfin (ví dụ: jellyfin hoặc PUID/PGID của Docker) đối với các thư mục thư viện phương tiện của bạn trên máy chủ.\n\n2. Hoặc vào Bảng điều khiển Jellyfin -> Thư viện, sửa thư viện này và tắt \'Save artwork into media folders\' để lưu ảnh bìa trong cơ sở dữ liệu nội bộ của Jellyfin.';

  @override
  String get dismiss => 'Bỏ qua';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Thư viện \'$libraryName\' của bạn được cấu hình để lưu ảnh bìa trực tiếp vào thư mục phương tiện (tùy chọn \'Save artwork into media folders\' đang bật). Tuy nhiên, Jellyfin đã kiểm tra quyền ghi và không có quyền ghi tệp vào thư mục này:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Có vẻ Jellyfin không cập nhật được ảnh bìa. Thư viện của bạn được cấu hình để lưu ảnh bìa trực tiếp vào thư mục phương tiện (tùy chọn \'Save artwork into media folders\' đang bật). Lỗi này thường xảy ra khi tiến trình máy chủ Jellyfin không có quyền ghi tệp vào các thư mục phương tiện của bạn.';

  @override
  String get externalLists => 'Danh sách bên ngoài';

  @override
  String get replay => 'Phát lại';

  @override
  String get fileInformation => 'Thông tin tệp';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Kích thước: $size  •  Định dạng: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Hiện tất cả ($count) bản âm thanh';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Hiện tất cả ($count) bản phụ đề';
  }

  @override
  String get checkingDirectPlay => 'Đang kiểm tra khả năng Phát trực tiếp...';

  @override
  String get directPlayCapabilityLabel => 'Khả năng Phát trực tiếp: ';

  @override
  String get forced => 'Bắt buộc';

  @override
  String get transcodeContainerNotSupported =>
      'Trình phát không hỗ trợ định dạng vùng chứa này.';

  @override
  String get transcodeVideoCodecNotSupported => 'Không hỗ trợ codec video này.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Không hỗ trợ codec âm thanh này.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Không hỗ trợ định dạng phụ đề này (cần ghi đè vào hình).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Không hỗ trợ hồ sơ âm thanh này.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Không hỗ trợ hồ sơ video này.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Không hỗ trợ cấp độ video này.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Thiết bị này không hỗ trợ độ phân giải video này.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Không hỗ trợ độ sâu bit của video này.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Không hỗ trợ tốc độ khung hình của video này.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Tốc độ bit của tệp vượt quá giới hạn truyền của trình phát.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Tốc độ bit video vượt quá giới hạn truyền.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Tốc độ bit âm thanh vượt quá giới hạn truyền.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Không hỗ trợ số kênh âm thanh này.';

  @override
  String get sortAlphabetical => 'Theo bảng chữ cái';

  @override
  String get sortReleaseAscending => 'Thứ tự phát hành (Tăng dần)';

  @override
  String get sortReleaseDescending => 'Thứ tự phát hành (Giảm dần)';

  @override
  String get sortCustomDragDrop => 'Tùy chỉnh (Kéo và thả)';

  @override
  String get playlistSortOptions => 'Tùy chọn sắp xếp danh sách phát';

  @override
  String get resetSort => 'Đặt lại sắp xếp';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Xem lại S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Danh sách phát xem lại';

  @override
  String get noSubtitlesFound => 'Không tìm thấy phụ đề.';

  @override
  String get adminControls => 'Điều khiển quản trị';

  @override
  String get impellerRendering => 'Công cụ kết xuất (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller là bộ kết xuất GPU hiện đại của Flutter, cho hoạt ảnh mượt hơn và ít giật hơn. Trên một số hộp TV và GPU đời cũ, nó có thể gây lỗi hiển thị hoặc video đen; hãy Tắt nếu bạn gặp tình trạng đó. Tự động sẽ chọn mặc định phù hợp nhất cho thiết bị của bạn. Khởi động lại Moonfin để áp dụng.';

  @override
  String get impellerAuto => 'Tự động';

  @override
  String get impellerOn => 'Bật';

  @override
  String get impellerOff => 'Tắt';

  @override
  String get impellerRestartTitle => 'Cần khởi động lại';

  @override
  String get impellerRestartMessage =>
      'Moonfin cần khởi động lại để đổi công cụ kết xuất. Hãy đóng ứng dụng ngay bây giờ, sau đó mở lại để áp dụng.';

  @override
  String get impellerCloseNow => 'Đóng ứng dụng ngay';

  @override
  String get adminRefreshLibrary => 'Làm mới thư viện';

  @override
  String get adminRefreshAllLibraries => 'Làm mới tất cả thư viện';

  @override
  String get adminRepoSortDateOldest => 'Ngày thêm (Cũ nhất trước)';

  @override
  String get adminRepoSortDateNewest => 'Ngày thêm (Mới nhất trước)';

  @override
  String get adminRepoSortNameAsc => 'Theo bảng chữ cái (A đến Z)';

  @override
  String get adminRepoSortNameDesc => 'Theo bảng chữ cái (Z đến A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Đang tải phân tích máy chủ... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Theo nguồn';

  @override
  String get imdbTop250Movies => '250 phim hàng đầu trên IMDb';

  @override
  String get imdbTop250TvShows => '250 chương trình TV hàng đầu trên IMDb';

  @override
  String get imdbMostPopularMovies => 'Phim phổ biến nhất trên IMDb';

  @override
  String get imdbMostPopularTvShows =>
      'Chương trình TV phổ biến nhất trên IMDb';

  @override
  String get imdbLowestRatedMovies => 'Phim bị đánh giá thấp nhất trên IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'Phim tiếng Anh được đánh giá cao nhất trên IMDb';
}
