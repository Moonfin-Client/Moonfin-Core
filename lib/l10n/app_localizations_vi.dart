// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Vây trăng';

  @override
  String get signIn => 'Đăng nhập';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Kết nối nhanh';

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
  String get back => 'Mặt sau';

  @override
  String get serverUnavailable => 'Máy chủ không khả dụng';

  @override
  String get loginFailed => 'Đăng nhập không thành công';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Ai đang xem?';

  @override
  String get addUser => 'Thêm người dùng';

  @override
  String get selectServer => 'Chọn máy chủ';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
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
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Hủy bỏ';

  @override
  String get remove => 'Di dời';

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
  String get settingsAppearanceThemeSubtitle =>
      'Chuyển đổi giữa Moonfin và Neon Pulse mà không cần khởi động lại ứng dụng';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Vây trăng';

  @override
  String get themeMoonfinSubtitle =>
      'Diện mạo Moonfin hiện tại được tất cả các bạn yêu thích';

  @override
  String get themeNeonPulse => 'Xung neon';

  @override
  String get themeNeonPulseSubtitle =>
      'Kiểu dáng Synthwave với ánh sáng đỏ tươi, văn bản màu lục lam và độ tương phản chrome mạnh hơn';

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
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Thoát khỏi Moonfin?';

  @override
  String get exitAppConfirmation => 'Bạn có chắc chắn muốn thoát không?';

  @override
  String get exit => 'Ra';

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
  String get recordings => 'Bản ghi âm';

  @override
  String get schedule => 'Lịch trình';

  @override
  String get series => 'Loạt';

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
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Thư mục này trống';

  @override
  String itemCountLabel(int count) {
    return '$count items';
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
    return '$count Items';
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
    return '$name — Genres';
  }

  @override
  String get views => 'Lượt xem';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Nghệ sĩ album';

  @override
  String get artists => 'nghệ sĩ';

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
    return '$count titles';
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
  String get resume => 'Bản tóm tắt';

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
  String get readyWhenYouAre => 'Sẵn sàng khi bạn sẵn sàng';

  @override
  String get details => 'Chi tiết';

  @override
  String get listeningRoom => 'Phòng nghe';

  @override
  String get bookmarksAndProgress => 'Dấu trang & Tiến trình';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Tiêu đề';

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
    return 'No $label found';
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
    return '$count sections';
  }

  @override
  String firstPublished(int year) {
    return 'First published $year';
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
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Không thể tải chủ đề này ngay bây giờ.';

  @override
  String get audiobookDetails => 'Chi tiết sách nói';

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
  String get trackList => 'Danh sách bài hát';

  @override
  String get itemListPlaceholder => 'Danh sách vật phẩm sẽ xuất hiện ở đây';

  @override
  String get favoriteTracksPlaceholder =>
      'Những bản nhạc yêu thích sẽ xuất hiện ở đây';

  @override
  String get failedToLoad => 'Không tải được';

  @override
  String get delete => 'Xóa bỏ';

  @override
  String get save => 'Cứu';

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
  String get musicVideos => 'Music Videos';

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
    return 'Disc $number';
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
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Ngày xuất bản không rõ';

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
  String get view => 'Xem';

  @override
  String get resumeReading => 'Tiếp tục đọc';

  @override
  String get read => 'Đọc';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Chơi';

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
  String get cast => 'Dàn diễn viên';

  @override
  String get trailer => 'Đoạn phim giới thiệu';

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
  String get renamePlaylist => 'Đổi tên danh sách phát';

  @override
  String get playlistName => 'Tên danh sách phát';

  @override
  String get deleteDownloadedAlbum => 'Xóa Album đã tải xuống';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
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
  String get itemDeleted => 'Mục đã bị xóa';

  @override
  String get noPlayableTrailerFound =>
      'Không tìm thấy đoạn giới thiệu có thể chơi được.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
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
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Đã tải phụ đề xuống. Có thể mất một chút thời gian để nó xuất hiện trong khi Jellyfin làm mới vật phẩm.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Chọn phiên bản';

  @override
  String versionNumber(int number) {
    return 'Version $number';
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
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Xóa các tập tin đã tải xuống';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
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
  String get writers => 'nhà văn';

  @override
  String get studio => 'PHÒNG THU';

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
  String get showLess => 'Hiển thị ít hơn';

  @override
  String get readMore => 'Đọc thêm';

  @override
  String get shuffle => 'Trộn bài';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Kết hợp hoàn hảo';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Bệnh tăng bạch cầu đơn nhân';

  @override
  String get stereo => 'Âm thanh nổi';

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
  String get deviceVolume => 'Âm lượng thiết bị';

  @override
  String get unavailable => 'Không có sẵn';

  @override
  String get pause => 'Tạm dừng';

  @override
  String get syncPosition => 'Đồng bộ hóa vị trí';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Hàng đợi trống';

  @override
  String trackNumber(int number) {
    return 'Track $number';
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
    return '$seconds seconds';
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
  String get reset => 'Cài lại';

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
  String get player => 'Người chơi';

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
  String get track => 'Theo dõi';

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
    return '$protocol session error';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Failed to load book details: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Kết xuất trong ứng dụng EPUB chưa khả dụng trên nền tảng này.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Kết xuất tài liệu nhúng không khả dụng trên nền tảng này.';

  @override
  String get couldNotOpenExternalViewer => 'Không thể mở trình xem bên ngoài.';

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
      'Chưa có dấu trang nào.\nNhấn vào biểu tượng dấu trang trong khi đọc để lưu vị trí của bạn.';

  @override
  String get noTableOfContentsAvailable => 'Không có mục lục';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Chức vụ';

  @override
  String get bookReader => 'Người đọc sách';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
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
    return 'Reset Zoom (${zoom}x)';
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
    return 'Failed to update read state: $error';
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
    return 'This platform cannot host the embedded document engine for $extension files.';
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
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Không tìm thấy kênh nào';

  @override
  String get liveBadge => 'SỐNG';

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
  String get watch => 'Đồng hồ';

  @override
  String get close => 'Đóng';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
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
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'KHÔNG';

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
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Không thể hủy ghi loạt phim';

  @override
  String get searchThisLibrary => 'Tìm kiếm thư viện này...';

  @override
  String get searchEllipsis => 'Tìm kiếm...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Seer';

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
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Phát Anbom';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
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
  String get seriesNotFound => 'Không tìm thấy loạt bài';

  @override
  String get errorLoadingSeries => 'Lỗi tải loạt bài';

  @override
  String get downloadedEpisodes => 'Các tập đã tải xuống';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
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
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Âm nhạc & Sách nói';

  @override
  String get images => 'Hình ảnh';

  @override
  String get database => 'Cơ sở dữ liệu';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
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
    return '$count options';
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
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Nhạc chủ đề trên Home Rows';

  @override
  String get playWhenBrowsingHomeScreen => 'Chơi khi duyệt màn hình chính';

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
  String get fit => 'Phù hợp';

  @override
  String get autoCrop => 'Tự động cắt';

  @override
  String get stretch => 'Kéo dài';

  @override
  String get refreshRateSwitching => 'Chuyển đổi tốc độ làm mới';

  @override
  String get disabled => 'Tàn tật';

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
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Xếp hàng phương tiện';

  @override
  String get autoQueueNextEpisodes => 'Tự động xếp hàng các tập tiếp theo';

  @override
  String get stillWatchingPrompt => 'Vẫn đang xem Lời nhắc';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
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
    return '$count selected';
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
  String get mediaBarModeMoonfin => 'Vây trăng';

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
  String get perRowImageType => 'Loại hình ảnh trên mỗi hàng';

  @override
  String get perRowSettings => 'Cài đặt mỗi hàng';

  @override
  String get autoLogin => 'Tự động đăng nhập';

  @override
  String get lastUser => 'Người dùng cuối cùng';

  @override
  String get specificUser => 'Người dùng cụ thể';

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
  String get mode => 'Cách thức';

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
    return '$minutes min';
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
  String get pluginLabel => 'Trình cắm';

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
    return '$status\nVersion: $version';
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
  String get resetRowsToDefaults => 'Đặt lại các hàng về mặc định';

  @override
  String get enableSeerr => 'Kích hoạt Seer';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Khám phá hàng';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Kéo để sắp xếp lại. Bật hoặc tắt hàng. Thứ tự hàng đã bật sẽ đồng bộ hóa với plugin Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Kéo để sắp xếp lại. Bật hoặc tắt hàng.';

  @override
  String get enabled => 'Đã bật';

  @override
  String get hidden => 'Ẩn giấu';

  @override
  String get aboutTitle => 'Về';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Giấy phép nguồn mở';

  @override
  String get sourceCode => 'Mã nguồn';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Cập nhật thông báo';

  @override
  String get showWhenUpdatesAvailable => 'Hiển thị khi có bản cập nhật';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get clear => 'Thông thoáng';

  @override
  String get browse => 'Duyệt qua';

  @override
  String get noResults => 'Không có kết quả';

  @override
  String get seerrAvailableStatus => 'Có sẵn';

  @override
  String get seerrRequestedStatus => 'Đã yêu cầu';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Cài đặt Seer';

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
    return 'Requested by $name';
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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get appearances => 'Xuất hiện';

  @override
  String get crewSection => 'Phi hành đoàn';

  @override
  String ageValue(int age) {
    return 'age $age';
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
  String get add => 'Thêm vào';

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
  String get edit => 'Biên tập';

  @override
  String get encoding => 'Mã hóa';

  @override
  String get error => 'Lỗi';

  @override
  String get forward => 'Phía trước';

  @override
  String get general => 'Tổng quan';

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
  String get next => 'Kế tiếp';

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
  String get remote => 'Xa';

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
  String get stop => 'Dừng lại';

  @override
  String get streaming => 'Truyền phát';

  @override
  String get time => 'Thời gian';

  @override
  String get trickplay => 'trò lừa';

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
  String get adminDrawerTranscoding => 'Chuyển mã';

  @override
  String get adminDrawerResume => 'Bản tóm tắt';

  @override
  String get adminDrawerStreaming => 'Truyền phát';

  @override
  String get adminDrawerTrickplay => 'trò lừa';

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
    return 'Error: $error';
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
    return 'Command failed: $error';
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
  String get sessionForward => 'Phía trước';

  @override
  String get sessionNext => 'Kế tiếp';

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
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Xóa thiết bị';

  @override
  String get adminDeviceDeleted => 'Đã xóa thiết bị';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Đổi tên thư viện';

  @override
  String get adminNewName => 'Tên mới';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Xóa thư viện';

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
  String get adminRemovePath => 'Xóa đường dẫn';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Đã lưu tùy chọn thư viện';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminLibraryNameRequired => 'Tên thư viện là bắt buộc';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
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
  String get adminUsersLoadFailed => 'Không tải được người dùng';

  @override
  String get adminSearchUsers => 'Tìm kiếm người dùng';

  @override
  String get adminEditUser => 'Chỉnh sửa người dùng';

  @override
  String get adminAddUser => 'Thêm người dùng';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
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
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Đã lưu quyền';

  @override
  String get adminPasswordsMismatch => 'Mật khẩu không khớp';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
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
  String get adminResetPasswordWarning =>
      'Điều này sẽ loại bỏ mật khẩu. Người dùng sẽ có thể đăng nhập mà không cần mật khẩu.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Mã thông báo khóa bị thiếu trong phản hồi của máy chủ';

  @override
  String get adminRevokeApiKey => 'Thu hồi khóa API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Khóa API đã bị thu hồi';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Đang tạo bản sao lưu...';

  @override
  String get adminBackupCreated => 'Sao lưu được tạo thành công';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Đường dẫn sao lưu bị thiếu trong phản hồi của máy chủ';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Xác nhận Khôi phục';

  @override
  String get adminRestoringBackup => 'Đang khôi phục bản sao lưu...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Tìm kiếm trong nhật ký';

  @override
  String get adminNoMatchingLines => 'Không có dòng phù hợp';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Không tìm thấy nhiệm vụ đã lên lịch nào';

  @override
  String get adminNoTasksMatchFilter =>
      'Không có nhiệm vụ nào phù hợp với bộ lọc hiện tại';

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
  String get adminRunNow => 'Chạy ngay';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Ngày trong tuần';

  @override
  String get adminSearchPlugins => 'Tìm kiếm plugin...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Gỡ cài đặt plugin';

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
      'Không có plugin nào phù hợp với tìm kiếm của bạn';

  @override
  String get adminNoPluginsInstalled => 'Không có plugin nào được cài đặt';

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
      'Không thể mở cài đặt: thiếu mã thông báo xác thực.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Không tìm thấy plugin';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'ví dụ. Jellyfin Ổn định';

  @override
  String get adminRepositoryUrl => 'URL kho lưu trữ';

  @override
  String get adminAddEntry => 'Thêm mục';

  @override
  String get adminInvalidUrl => 'URL không hợp lệ';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminTrickplaySaved => 'Đã lưu cài đặt trò chơi lừa';

  @override
  String get adminTrickplayLoadFailed => 'Không tải được cài đặt trò chơi lừa';

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
  String get adminBaseUrlHint => 'ví dụ. /vây thạch';

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
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
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
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Tìm kiếm người ở xa';

  @override
  String get adminNoRemoteMatches => 'Không tìm thấy kết quả phù hợp từ xa';

  @override
  String get adminRemoteResults => 'Kết quả từ xa';

  @override
  String get adminRemoteMetadataApplied => 'Đã áp dụng siêu dữ liệu từ xa';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Cập nhật loại nội dung';

  @override
  String get adminContentType => 'Loại nội dung';

  @override
  String get adminContentTypeUpdated => 'Đã cập nhật loại nội dung';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Định dạng hình ảnh không được hỗ trợ';

  @override
  String get adminImageReadFailed => 'Không thể đọc được hình ảnh đã chọn';

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
  String get adminAllProviders => 'Tất cả các nhà cung cấp';

  @override
  String get adminNoRemoteImages => 'Không tìm thấy hình ảnh từ xa';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Thêm bộ chỉnh';

  @override
  String get adminTunerType => 'Loại bộ chỉnh';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Khác';

  @override
  String get adminUrlPath => 'URL/Đường dẫn';

  @override
  String get adminNameOptional => 'Tên (tùy chọn)';

  @override
  String get adminTunerAdded => 'Đã thêm bộ chỉnh';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Thêm nhà cung cấp hướng dẫn';

  @override
  String get adminProviderType => 'Loại nhà cung cấp';

  @override
  String get adminProviderTypeHint => 'Lịch trìnhDirect hoặc XMLTV';

  @override
  String get adminUsernameOptional => 'Tên người dùng (tùy chọn)';

  @override
  String get adminRefreshInterval => 'Khoảng thời gian làm mới (giờ)';

  @override
  String get adminProviderAdded => 'Đã thêm nhà cung cấp';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Đã yêu cầu đặt lại bộ dò';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
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
  String get adminRecordingSettingsSaved => 'Đã lưu cài đặt ghi âm';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
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
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Thêm nhà cung cấp';

  @override
  String get adminNoListingProviders =>
      'Không có nhà cung cấp danh sách nào được định cấu hình';

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
    return 'Restore backup $name now?';
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
  String get adminReset => 'Cài lại';

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
  String get adminLogViewerNoMatches => 'Không có dòng phù hợp';

  @override
  String get adminMetadataEditorTitle => 'Trình chỉnh sửa siêu dữ liệu';

  @override
  String get adminMetadataRemote => 'Xa';

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
      'Không thể đọc được hình ảnh đã chọn';

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
      'Thao tác này sẽ xóa hình ảnh hiện tại khỏi mục.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Không có gói nào phù hợp với tìm kiếm của bạn';

  @override
  String get adminPluginsCatalogEmpty => 'Không có gói nào có sẵn';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Xóa kho lưu trữ';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Di dời';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminPlaybackHwAccel => 'Tăng tốc phần cứng';

  @override
  String get adminPlaybackHwAccelLabel => 'Tăng tốc phần cứng';

  @override
  String get adminPlaybackEnableHwEncoding => 'Kích hoạt mã hóa phần cứng';

  @override
  String get adminPlaybackEnableHwDecoding => 'Bật giải mã phần cứng cho:';

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
  String get adminTaskStop => 'Dừng lại';

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
      other: '$count hours',
      one: '1 hour',
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
  String get adminActivityNow => 'Hiện nay';

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
      'Định cấu hình tạo hình ảnh thủ thuật để tìm kiếm hình thu nhỏ xem trước.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Cổng HTTPS công cộng';

  @override
  String get adminNetworkingBaseUrl => 'URL cơ sở';

  @override
  String get adminNetworkingBaseUrlHint => 'ví dụ. /vây thạch';

  @override
  String get adminNetworkingHttps => 'HTTPS';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Ngưỡng phản hồi chậm (ms)';

  @override
  String get adminGeneralCachePath => 'Đường dẫn bộ đệm';

  @override
  String get adminGeneralMetadataPath => 'Đường dẫn siêu dữ liệu';

  @override
  String get adminGeneralServerName => 'Tên máy chủ';

  @override
  String get adminSettingsLoadFailed => 'Không tải được cài đặt';

  @override
  String get adminDiscover => 'Phát hiện';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Quyền truy cập SyncPlay bị từ chối';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Bạn không có quyền truy cập vào một hoặc nhiều mục trong nhóm SyncPlay này. Yêu cầu chủ sở hữu nhóm xác minh quyền thư viện hoặc chọn một hàng đợi khác.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'Phát hiện các hàng được hiển thị bởi plugin \"Phần màn hình chính\" của IAmParadox27. Các hàng có thể được kích hoạt và sắp xếp lại bên dưới.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Chưa có máy chủ Jellyfin nào báo cáo plugin.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Phát hiện các hàng được định cấu hình thông qua plugin \"KefinTweaks\" của ranaldsgift. Các phần tùy chỉnh, được phát hành gần đây, xem lại, theo mùa và được thêm gần đây vào thư viện, được phản ánh từ cấu hình KefinTweaks trên mỗi máy chủ Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Chưa có máy chủ Jellyfin nào báo cáo KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Mở phần trang chủ';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Bật, tắt và sắp xếp lại các hàng';

  @override
  String get integrationInstalledButDisabled => 'Đã cài nhưng bị tắt';

  @override
  String get integrationNotInstalled => 'Chưa được cài đặt';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Phát lại từ xa';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Âm lượng thiết bị';

  @override
  String get castVolumeUnavailable => 'Không có sẵn';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Mã PIN không chính xác';

  @override
  String get pinMismatch => 'Mã PIN không khớp';

  @override
  String get pinForgot => 'Quên mã PIN?';

  @override
  String get pinClear => 'Thông thoáng';

  @override
  String get pinBackspace => 'Phím lùi';

  @override
  String get quickConnectAuthorized => 'Yêu cầu kết nối nhanh được ủy quyền.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Mã Kết nối nhanh không hợp lệ hoặc đã hết hạn.';

  @override
  String get quickConnectNotSupported =>
      'Kết nối nhanh không được hỗ trợ trên máy chủ này.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Không thể ủy quyền mã Kết nối nhanh.';

  @override
  String get quickConnectDisabled => 'Kết nối nhanh bị tắt trên máy chủ này.';

  @override
  String get quickConnectForbidden =>
      'Tài khoản của bạn không thể ủy quyền yêu cầu Kết nối nhanh này.';

  @override
  String get quickConnectNotFound =>
      'Không tìm thấy mã Kết nối nhanh. Hãy thử một mã mới.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Nhập mã';

  @override
  String get quickConnectAuthorize => 'Ủy quyền';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get stillWatchingStop => 'Dừng lại';

  @override
  String get stillWatchingContinue => 'Tiếp tục';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Truyền hình trực tiếp';

  @override
  String get continueWatchingAndNextUp => 'Tiếp tục xem và tiếp theo';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get settingsPrivacyAndSafetySection => 'RIÊNG TƯ & AN TOÀN';

  @override
  String get settingsBlockedRatings => 'Xếp hạng bị chặn';

  @override
  String get settingsGeneralStyle => 'Phong cách chung';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Điểm nhấn của chủ đề, phông nền, chỉ báo đã xem và nhạc chủ đề';

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
      'Gắn dấu sao cho dự án trên GitHub hoặc đóng góp';

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
      other: '# license notices',
      one: '# license notice',
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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (cũ)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
