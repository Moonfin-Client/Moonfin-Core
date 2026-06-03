// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'sirip bulan';

  @override
  String get signIn => 'Masuk';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Koneksi Cepat';

  @override
  String get password => 'Kata sandi';

  @override
  String get username => 'Nama belakang';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Masukkan kode ini di dashboard web server Anda:';

  @override
  String get waitingForAuthorization => 'Menunggu otorisasi...';

  @override
  String get back => 'Kembali';

  @override
  String get serverUnavailable => 'Server tidak tersedia';

  @override
  String get loginFailed => 'Gagal masuk';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Siapa yang menonton?';

  @override
  String get addUser => 'Tambahkan Pengguna';

  @override
  String get selectServer => 'Pilih Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Server Tersimpan';

  @override
  String get discoveredServers => 'Server yang Ditemukan';

  @override
  String get noneFound => 'Tidak ada yang ditemukan';

  @override
  String get unableToConnectToServer => 'Tidak dapat terhubung ke server';

  @override
  String get addServer => 'Tambahkan Server';

  @override
  String get embyConnect => 'Emby Hubungkan';

  @override
  String get removeServer => 'Hapus Server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Membatalkan';

  @override
  String get remove => 'Menghapus';

  @override
  String get connectToServer => 'Hubungkan ke Server';

  @override
  String get serverAddress => 'Alamat Server';

  @override
  String get serverAddressHint => 'https://server-anda.example.com';

  @override
  String get connect => 'Menghubungkan';

  @override
  String get secureStorageUnavailable => 'Penyimpanan Aman Tidak Tersedia';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin tidak dapat mengakses keyring sistem Anda. Proses masuk dapat dilanjutkan, namun penyimpanan token yang aman mungkin tidak tersedia hingga gantungan kunci dibuka kuncinya.';

  @override
  String get ok => 'OKE';

  @override
  String get settingsAppearanceTheme => 'Tema Aplikasi';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Beralih antara Moonfin dan Neon Pulse tanpa memulai ulang aplikasi';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'sirip bulan';

  @override
  String get themeMoonfinSubtitle =>
      'Tampilan Moonfin saat ini yang Anda semua sukai';

  @override
  String get themeNeonPulse => 'Pulsa Neon';

  @override
  String get themeNeonPulseSubtitle =>
      'Gaya synthwave dengan cahaya magenta, teks cyan, dan kontras krom yang lebih kuat';

  @override
  String get embyConnectSignInSubtitle => 'Masuk dengan akun Emby Connect Anda';

  @override
  String get emailOrUsername => 'Email atau Nama Pengguna';

  @override
  String get selectAServer => 'Pilih Server';

  @override
  String get tryAgain => 'Coba Lagi';

  @override
  String get noLinkedServers =>
      'Tidak ada server yang tertaut ke akun Emby Connect ini';

  @override
  String get invalidEmbyConnectCredentials =>
      'Kredensial Emby Connect tidak valid';

  @override
  String get invalidEmbyConnectLogin =>
      'Nama pengguna atau kata sandi Emby Connect tidak valid';

  @override
  String get embyConnectExchangeNotSupported =>
      'Server tidak mendukung pertukaran Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Kesalahan jaringan saat menghubungi Emby Connect atau server yang dipilih';

  @override
  String get loadingLinkedServers => 'Memuat server tertaut...';

  @override
  String get connectingToServerEllipsis => 'Menghubungkan ke server...';

  @override
  String get noReachableAddress => 'Tidak ada alamat yang dapat dihubungi';

  @override
  String get invalidServerExchangeResponse =>
      'Respons tidak valid dari titik akhir pertukaran server';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Keluar dari Moonfin?';

  @override
  String get exitAppConfirmation => 'Apakah Anda yakin ingin keluar?';

  @override
  String get exit => 'KELUAR';

  @override
  String get noHomeRowsLoaded => 'Tidak ada baris beranda yang dapat dimuat';

  @override
  String get noHomeRowsHint =>
      'Coba segarkan atau kurangi bagian rumah yang aktif.';

  @override
  String get retryHomeRows => 'Coba lagi Baris Beranda';

  @override
  String get guide => 'Memandu';

  @override
  String get recordings => 'Rekaman';

  @override
  String get schedule => 'Jadwal';

  @override
  String get series => 'Seri';

  @override
  String get noItemsFound => 'Tidak ada item yang ditemukan';

  @override
  String get home => 'Rumah';

  @override
  String get browseAll => 'Telusuri Semua';

  @override
  String get genres => 'Genre';

  @override
  String get collectionPlaceholder => 'Item koleksi akan muncul di sini';

  @override
  String get browseByLetter => 'Telusuri berdasarkan Surat';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Penelusuran menurut abjad akan muncul di sini';

  @override
  String get suggestions => 'Saran';

  @override
  String get suggestionsPlaceholder =>
      'Item yang disarankan akan muncul di sini';

  @override
  String get failedToLoadLibraries => 'Gagal memuat perpustakaan';

  @override
  String get noLibrariesFound => 'Tidak ada perpustakaan yang ditemukan';

  @override
  String get library => 'Perpustakaan';

  @override
  String get displaySettings => 'Pengaturan Tampilan';

  @override
  String get allGenres => 'Semua Genre';

  @override
  String get noGenresFound => 'Tidak ada genre yang ditemukan';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Folder ini kosong';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Gagal memuat favorit';

  @override
  String get retry => 'Mencoba kembali';

  @override
  String get noFavoritesYet => 'Belum ada favorit';

  @override
  String get favorites => 'Favorit';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Melanjutkan';

  @override
  String get ended => 'Berakhir';

  @override
  String get sortAndFilter => 'Sortir & Filter';

  @override
  String get type => 'Jenis';

  @override
  String get sortBy => 'Urutkan Berdasarkan';

  @override
  String get display => 'Menampilkan';

  @override
  String get imageType => 'Jenis Gambar';

  @override
  String get posterSize => 'Ukuran Poster';

  @override
  String get small => 'Kecil';

  @override
  String get medium => 'Sedang';

  @override
  String get large => 'Besar';

  @override
  String get extraLarge => 'Ekstra besar';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Tampilan';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Artis Album';

  @override
  String get artists => 'Artis';

  @override
  String get bookmarks => 'Bookmark';

  @override
  String get noSavedBookmarks =>
      'Belum ada bookmark tersimpan untuk judul ini.';

  @override
  String get openBook => 'Buka Buku';

  @override
  String get chapter => 'Bab';

  @override
  String get page => 'Halaman';

  @override
  String get bookmark => 'Penanda buku';

  @override
  String get justNow => 'Baru saja';

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
  String get discoverySubjects => 'Subyek Penemuan';

  @override
  String get pickDiscoverySubjects =>
      'Pilih feed subjek mana yang akan ditampilkan di Discover.';

  @override
  String get apply => 'Menerapkan';

  @override
  String get openLink => 'Buka Tautan';

  @override
  String get scanWithYourPhone => 'Pindai dengan ponsel Anda';

  @override
  String get audiobookGenres => 'Genre Buku Audio';

  @override
  String get pickAudiobookGenres =>
      'Pilih genre mana yang akan ditampilkan di Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Temukan Buku Audio';

  @override
  String get librivoxDescription =>
      'Judul domain publik populer dari LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Gulir ke kiri';

  @override
  String get scrollRight => 'Gulir ke kanan';

  @override
  String get couldNotLoadGenre => 'Tidak dapat memuat genre ini sekarang.';

  @override
  String get continueReading => 'Lanjutkan Membaca';

  @override
  String get savedHighlights => 'Sorotan Tersimpan';

  @override
  String get continueListening => 'Lanjutkan Mendengarkan';

  @override
  String get listen => 'Mendengarkan';

  @override
  String get resume => 'Melanjutkan';

  @override
  String get failedToLoadLibrary => 'Gagal memuat perpustakaan';

  @override
  String get popularNow => 'Populer Sekarang';

  @override
  String get savedForLater => 'Disimpan Untuk Nanti';

  @override
  String get topListens => 'Dengarkan Teratas';

  @override
  String get unreadDiscoveries => 'Penemuan yang Belum Dibaca';

  @override
  String get pickUpAgain => 'Ambil Lagi';

  @override
  String get bookHighlightsDescription =>
      'Buku Anda dengan sorotan, favorit, atau kemajuan membaca.';

  @override
  String get handPickedFromLibrary =>
      'Dipilih langsung dari perpustakaan Anda.';

  @override
  String get handPickedFromListeningQueue =>
      'Dipilih langsung dari antrean mendengarkan Anda.';

  @override
  String get booksWithHighlights =>
      'Buku dengan sorotan, favorit, atau kemajuan membaca.';

  @override
  String get jumpBackNarration =>
      'Lompat kembali ke narasi tanpa mencari tempat Anda.';

  @override
  String get unreadBooksReady =>
      'Buku yang belum dibaca siap untuk jam tenang berikutnya.';

  @override
  String get quickAccessFavorites =>
      'Akses cepat ke buku-buku yang selalu Anda baca kembali.';

  @override
  String get searchAudiobooks => 'Cari buku audio';

  @override
  String get searchYourLibrary => 'Telusuri perpustakaan Anda';

  @override
  String get pickUpStory =>
      'Lanjutkan cerita dari bagian terakhir yang Anda tinggalkan';

  @override
  String get savedPlacesChapters =>
      'Tempat yang Anda simpan dan bab yang belum selesai';

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
  String get readyWhenYouAre => 'Siap ketika Anda siap';

  @override
  String get details => 'Detail';

  @override
  String get listeningRoom => 'Ruang Mendengar';

  @override
  String get bookmarksAndProgress => 'Bookmark & ​​Kemajuan';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Judul';

  @override
  String get allTitles => 'Semua Judul';

  @override
  String get authors => 'Penulis';

  @override
  String get browseByAuthor => 'Telusuri Berdasarkan Penulis';

  @override
  String get browseByGenre => 'Telusuri Berdasarkan Genre';

  @override
  String get discover => 'Menemukan';

  @override
  String get trendingTitlesOpenLibrary =>
      'Judul yang sedang tren berdasarkan subjek dari Open Library.';

  @override
  String get noBookmarkedItems => 'Belum ada item yang ditandai';

  @override
  String get nothingMatchesSection =>
      'Belum ada yang cocok dengan bagian ini. Coba tab lain atau kembali setelah sinkronisasi perpustakaan selesai.';

  @override
  String get audiobooks => 'Buku audio';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Map';

  @override
  String get filters => 'Filter';

  @override
  String get readingStatus => 'Status Membaca';

  @override
  String get playedStatus => 'Status Dimainkan';

  @override
  String get readStatus => 'Membaca';

  @override
  String get watched => 'Menonton';

  @override
  String get unread => 'Belum dibaca';

  @override
  String get unwatched => 'Belum ditonton';

  @override
  String get seriesStatus => 'Status Seri';

  @override
  String get allLibraries => 'Semua Perpustakaan';

  @override
  String get books => 'Buku';

  @override
  String get author => 'Pengarang';

  @override
  String get unknownAuthor => 'Penulis Tidak Dikenal';

  @override
  String get uncategorized => 'Tidak dikategorikan';

  @override
  String get overview => 'Ringkasan';

  @override
  String get noLibrivoxDescription =>
      'Belum ada deskripsi yang diberikan oleh LibriVox untuk judul ini.';

  @override
  String get readers => 'Pembaca';

  @override
  String get openLinks => 'Buka Tautan';

  @override
  String get librivoxPage => 'LibriVox Halaman';

  @override
  String get internetArchive => 'Arsip Internet';

  @override
  String get rssFeed => 'Umpan RSS';

  @override
  String get downloadZip => 'Unduh Zip';

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
      'Belum ada ikhtisar dari Open Library untuk judul ini.';

  @override
  String get subjects => 'Subyek';

  @override
  String get all => 'Semua';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Tidak dapat memuat subjek ini sekarang.';

  @override
  String get audiobookDetails => 'Detail Buku Audio';

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
  String get trackList => 'Daftar Lagu';

  @override
  String get itemListPlaceholder => 'Daftar item akan muncul di sini';

  @override
  String get favoriteTracksPlaceholder => 'Lagu favorit akan muncul di sini';

  @override
  String get failedToLoad => 'Gagal memuat';

  @override
  String get delete => 'Menghapus';

  @override
  String get save => 'Menyimpan';

  @override
  String get moreLikeThis => 'Lebih Banyak Seperti Ini';

  @override
  String get castAndCrew => 'Pemeran & Kru';

  @override
  String get collection => 'Koleksi';

  @override
  String get episodes => 'Episode';

  @override
  String get nextUp => 'Selanjutnya';

  @override
  String get seasons => 'Musim';

  @override
  String get chapters => 'bab';

  @override
  String get features => 'Fitur';

  @override
  String get movies => 'Film';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Lainnya';

  @override
  String get discography => 'Diskografi';

  @override
  String get similarArtists => 'Artis Serupa';

  @override
  String get tableOfContents => 'Daftar isi';

  @override
  String get tracklist => 'Daftar lagu';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografi';

  @override
  String get authorDetails => 'Detail Penulis';

  @override
  String get noOverviewAvailable =>
      'Belum ada ikhtisar yang tersedia untuk judul ini.';

  @override
  String get noBiographyAvailable =>
      'Tidak ada biografi tersedia untuk penulis ini.';

  @override
  String get noBooksFound => 'Tidak ada buku yang ditemukan untuk penulis ini.';

  @override
  String get unableToLoadAuthorDetails =>
      'Tidak dapat memuat detail penulis saat ini.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Tanggal penerbitan tidak diketahui';

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
  String get view => 'Melihat';

  @override
  String get resumeReading => 'Lanjutkan Membaca';

  @override
  String get read => 'Membaca';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Bermain';

  @override
  String get startOver => 'Mulai dari awal';

  @override
  String get restart => 'Mulai ulang';

  @override
  String get readOffline => 'Baca Offline';

  @override
  String get playOffline => 'Mainkan Offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitle';

  @override
  String get version => 'Versi';

  @override
  String get cast => 'Pemeran';

  @override
  String get trailer => 'Cuplikan';

  @override
  String get finished => 'Selesai';

  @override
  String get favorited => 'Favorit';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Daftar putar';

  @override
  String get downloaded => 'Diunduh';

  @override
  String get downloadAll => 'Unduh Semua';

  @override
  String get download => 'Unduh';

  @override
  String get deleteDownloaded => 'Hapus yang Diunduh';

  @override
  String get goToSeries => 'Pergi ke Seri';

  @override
  String get editMetadata => 'Sunting Metadata';

  @override
  String get less => 'Lebih sedikit';

  @override
  String get more => 'Lagi';

  @override
  String get deleteItem => 'Hapus Barang';

  @override
  String get deletePlaylist => 'Hapus Daftar Putar';

  @override
  String get deletePlaylistMessage => 'Hapus daftar putar ini dari server?';

  @override
  String get deleteItemMessage => 'Hapus item ini dari server?';

  @override
  String get failedToDeletePlaylist => 'Gagal menghapus daftar putar';

  @override
  String get failedToDeleteItem => 'Gagal menghapus item';

  @override
  String get renamePlaylist => 'Ganti nama Daftar Putar';

  @override
  String get playlistName => 'Nama daftar putar';

  @override
  String get deleteDownloadedAlbum => 'Hapus Album yang Diunduh';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Lagu yang diunduh dihapus';

  @override
  String get downloadedTracksDeleteFailed =>
      'Beberapa trek yang diunduh tidak dapat dihapus';

  @override
  String get noTracksLoaded => 'Tidak ada trek yang dimuat';

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
  String get itemDeleted => 'Barang dihapus';

  @override
  String get noPlayableTrailerFound =>
      'Tidak ditemukan cuplikan yang dapat diputar.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Trek Audio';

  @override
  String get subtitleTrack => 'Lagu Subjudul';

  @override
  String get none => 'Tidak ada';

  @override
  String get downloadSubtitlesLabel => 'Unduh subtitle...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Telusuri menggunakan plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Unduh Subtitle';

  @override
  String get selectedSubtitleInvalid => 'Subtitle yang dipilih tidak valid.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitle diunduh. Mungkin perlu waktu beberapa saat untuk muncul saat Jellyfin menyegarkan item.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Pilih Versi';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Unduh Semua — Kualitas';

  @override
  String get downloadQuality => 'Kualitas Unduhan';

  @override
  String get originalFileNoReencoding =>
      'File asli, tidak ada pengkodean ulang';

  @override
  String get originalFilesNoReencoding =>
      'File asli, tidak ada pengkodean ulang';

  @override
  String get noEpisodesLoaded => 'Tidak ada episode yang dimuat';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Hapus File yang Diunduh';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'File yang diunduh dihapus';

  @override
  String get failedToDeleteFiles => 'Gagal menghapus file';

  @override
  String get deleteFiles => 'Hapus File';

  @override
  String get director => 'DIREKTUR';

  @override
  String get writers => 'PENULIS';

  @override
  String get studio => 'STUDIO';

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
  String get showLess => 'Tampilkan Lebih Sedikit';

  @override
  String get readMore => 'Baca selengkapnya';

  @override
  String get shuffle => 'Acak';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Pasangan yang sempurna';

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
  String get deleteSeasonFiles => 'semua episode yang diunduh di musim ini';

  @override
  String get stillWatching => 'Masih Menonton?';

  @override
  String get unableToLoadTrailerStream =>
      'Tidak dapat memuat streaming cuplikan.';

  @override
  String get trailerTimedOut => 'Waktu cuplikan habis saat memuat.';

  @override
  String get playbackFailedForTrailer => 'Pemutaran gagal untuk cuplikan ini.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Transmisi tidak tersedia selama pemutaran offline.';

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
  String get deviceVolume => 'Volume Perangkat';

  @override
  String get unavailable => 'Tidak tersedia';

  @override
  String get pause => 'Berhenti sebentar';

  @override
  String get syncPosition => 'Posisi Sinkronisasi';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Antrian kosong';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Pemutaran Jarak Jauh';

  @override
  String get castingToGoogleCast => 'Mentransmisi ke Google Cast';

  @override
  String get castingViaAirPlay => 'Mentransmisikan melalui AirPlay';

  @override
  String get castingViaDlna => 'Mentransmisikan melalui DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Tekan lama untuk membuka kunci';

  @override
  String get off => 'Mati';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Mobil';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Penggantian Kecepatan Bit';

  @override
  String get audioDelay => 'Penundaan Audio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Penundaan Subjudul';

  @override
  String get reset => 'Mengatur ulang';

  @override
  String get unknown => 'Tidak dikenal';

  @override
  String get playbackInformation => 'Informasi Pemutaran';

  @override
  String get playback => 'Pemutaran';

  @override
  String get playMethod => 'Metode Bermain';

  @override
  String get directPlay => 'Putar Langsung';

  @override
  String get directStream => 'Aliran Langsung';

  @override
  String get transcoding => 'Transkode';

  @override
  String get transcodeReasons => 'Alasan Transkode';

  @override
  String get player => 'Pemain';

  @override
  String get container => 'Wadah';

  @override
  String get bitrate => 'Kecepatan bit';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Resolusi';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Kecepatan Bit Video';

  @override
  String get track => 'Melacak';

  @override
  String get channels => 'Saluran';

  @override
  String get audioBitrate => 'Kecepatan Bit Audio';

  @override
  String get sampleRate => 'Tingkat Sampel';

  @override
  String get format => 'Format';

  @override
  String get external => 'Luar';

  @override
  String get embedded => 'Tertanam';

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
      'Render EPUB dalam aplikasi belum tersedia pada platform ini.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Rendering dokumen tersemat tidak tersedia di platform ini.';

  @override
  String get couldNotOpenExternalViewer =>
      'Tidak dapat membuka penampil eksternal.';

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
      'Belum ada bookmark.\nKetuk ikon bookmark saat membaca untuk menyimpan posisi Anda.';

  @override
  String get noTableOfContentsAvailable => 'Tidak ada daftar isi yang tersedia';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Posisi';

  @override
  String get bookReader => 'Pembaca Buku';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Memperbarui...';

  @override
  String get markUnread => 'Tandai Belum Dibaca';

  @override
  String get markAsRead => 'Tandai sebagai Telah Dibaca';

  @override
  String get reloadReader => 'Muat ulang Pembaca';

  @override
  String get noPagesFound => 'Tidak ada halaman yang ditemukan.';

  @override
  String get failedToDecodePageImage => 'Gagal memecahkan kode gambar laman.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Halaman Tunggal';

  @override
  String get twoPageSpread => 'Penyebaran Dua Halaman';

  @override
  String get addBookmark => 'Tambahkan Penanda';

  @override
  String get bookmarksEllipsis => 'Bookmark...';

  @override
  String get markedAsRead => 'Ditandai sebagai telah dibaca';

  @override
  String get markedAsUnread => 'Ditandai sebagai belum dibaca';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistem';

  @override
  String get themeLight => 'Tema: Cahaya';

  @override
  String get themeDark => 'Tema: Gelap';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Balikkan Warna (tata letak tetap)';

  @override
  String get invertColorsPdf => 'Balikkan Warna (PDF)';

  @override
  String get preparingInAppReader => 'Mempersiapkan pembaca dalam aplikasi...';

  @override
  String get pdfDataNotAvailable => 'Data PDF tidak tersedia.';

  @override
  String get readerFallbackModeActive => 'Mode fallback pembaca aktif';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Gunakan Reload Reader setelah beralih ke target platform yang didukung (Android, iOS, macOS).';

  @override
  String get openExternally => 'Buka Secara Eksternal';

  @override
  String get noEpubChaptersFound => 'Tidak ada bab EPUB yang ditemukan.';

  @override
  String get readerNotReady => 'Pembaca belum siap.';

  @override
  String get seriesRecordings => 'Rekaman Seri';

  @override
  String get now => 'Sekarang';

  @override
  String get sports => 'Olahraga';

  @override
  String get news => 'Berita';

  @override
  String get kids => 'Anak-anak';

  @override
  String get premiere => 'Premier';

  @override
  String get guideTimeline => 'Garis Waktu Panduan';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Tidak ada saluran yang ditemukan';

  @override
  String get liveBadge => 'HIDUP';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Dihapus dari saluran favorit';

  @override
  String get addedToFavoriteChannels => 'Ditambahkan ke saluran favorit';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Gagal memperbarui saluran favorit';

  @override
  String get unfavoriteChannel => 'Saluran Tidak Favorit';

  @override
  String get favoriteChannel => 'Saluran Favorit';

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
  String get watch => 'Jam tangan';

  @override
  String get close => 'Menutup';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Gagal memuat rekaman';

  @override
  String get scheduledInNext24Hours => 'Dijadwalkan dalam 24 Jam Berikutnya';

  @override
  String get recentRecordings => 'Rekaman Terbaru';

  @override
  String get tvSeries => 'Serial TV';

  @override
  String get failedToLoadSchedule => 'Gagal memuat jadwal';

  @override
  String get noScheduledRecordings => 'Tidak ada rekaman terjadwal';

  @override
  String get cancelRecording => 'Batalkan Perekaman?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'TIDAK';

  @override
  String get yesCancel => 'Ya, Batalkan';

  @override
  String get failedToCancelRecording => 'Gagal membatalkan perekaman';

  @override
  String get failedToLoadSeriesRecordings => 'Gagal memuat rekaman seri';

  @override
  String get noSeriesRecordings => 'Tidak ada rekaman seri';

  @override
  String get cancelSeriesRecording => 'Batalkan Perekaman Seri';

  @override
  String get cancelSeriesRecordingQuestion => 'Batalkan Perekaman Seri?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Gagal membatalkan perekaman rangkaian';

  @override
  String get searchThisLibrary => 'Telusuri perpustakaan ini...';

  @override
  String get searchEllipsis => 'Mencari...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Melihat';

  @override
  String get seerrAccountType => 'Jenis Akun Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokal';

  @override
  String get savedMedia => 'Media Tersimpan';

  @override
  String get tvShows => 'Acara TV';

  @override
  String get music => 'Musik';

  @override
  String get musicAlbums => 'Album Musik';

  @override
  String get noMediaInFilter => 'Tidak ada media di filter ini';

  @override
  String get noDownloadedMediaYet => 'Belum ada media yang diunduh';

  @override
  String get browseLibrary => 'Jelajahi Perpustakaan';

  @override
  String get deleteDownload => 'Hapus Unduh';

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
  String get playAlbum => 'Putar Album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Musim';

  @override
  String get errorLoadingEpisodes => 'Terjadi kesalahan saat memuat episode';

  @override
  String get noDownloadedEpisodes => 'Tidak ada episode yang diunduh';

  @override
  String get deleteEpisode => 'Hapus Episode';

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
  String get seriesNotFound => 'Seri tidak ditemukan';

  @override
  String get errorLoadingSeries => 'Terjadi kesalahan saat memuat seri';

  @override
  String get downloadedEpisodes => 'Episode yang Diunduh';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Spesial';

  @override
  String get deleteSeason => 'Hapus Musim';

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
  String get storageManagement => 'Manajemen Penyimpanan';

  @override
  String get storageBreakdown => 'Kerusakan Penyimpanan';

  @override
  String get downloadedItems => 'Item yang Diunduh';

  @override
  String get storageLimit => 'Batas Penyimpanan';

  @override
  String get noLimit => 'Tidak ada batasan';

  @override
  String get deleteAllDownloads => 'Hapus Semua Unduhan';

  @override
  String get deleteAllDownloadsWarning =>
      'Tindakan ini akan menghapus semua file media yang diunduh dan tidak dapat dibatalkan.';

  @override
  String get deleteAll => 'Hapus Semua';

  @override
  String get deleteSelected => 'Hapus yang Dipilih';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Musik & Buku Audio';

  @override
  String get images => 'Gambar';

  @override
  String get database => 'Basis data';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Pengaturan';

  @override
  String get authentication => 'Otentikasi';

  @override
  String get autoLoginServerManagement => 'Login otomatis, manajemen server';

  @override
  String get pinCode => 'Kode PIN';

  @override
  String get setUpPinCodeProtection => 'Siapkan perlindungan kode PIN';

  @override
  String get parentalControls => 'Kontrol Orang Tua';

  @override
  String get contentRatingRestrictions => 'Pembatasan peringkat konten';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, resolusi, perilaku';

  @override
  String get languageSizeAppearance => 'Bahasa, ukuran, penampilan';

  @override
  String get qualityStorage => 'Kualitas, penyimpanan';

  @override
  String get serverSyncAndPluginStatus =>
      'Sinkronisasi server dan status plugin';

  @override
  String get mediaRequestIntegration => 'Integrasi permintaan media';

  @override
  String get switchServer => 'Beralih Server';

  @override
  String get signOut => 'Keluar';

  @override
  String get versionLicenses => 'Versi, lisensi';

  @override
  String get account => 'Akun';

  @override
  String get signInAndSecurity => 'Masuk dan keamanan';

  @override
  String get administration => 'Administrasi';

  @override
  String get serverSettingsUsersLibraries =>
      'Pengaturan server, pengguna, perpustakaan';

  @override
  String get customization => 'Kustomisasi';

  @override
  String get themeAndLayout => 'Tema dan tata letak';

  @override
  String get videoAndSubtitles => 'Video dan subtitle';

  @override
  String get integrations => 'Integrasi';

  @override
  String get pluginAndRequests => 'Plugin dan permintaan';

  @override
  String get customizeAccountPlaybackInterface =>
      'Sesuaikan akun, pemutaran, dan perilaku antarmuka';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Tema & Penampilan';

  @override
  String get focusBorderColor => 'Warna Batas Fokus';

  @override
  String get watchedIndicators => 'Indikator yang Diperhatikan';

  @override
  String get always => 'Selalu';

  @override
  String get hideUnwatched => 'Sembunyikan Belum Ditonton';

  @override
  String get episodesOnly => 'Hanya Episode';

  @override
  String get never => 'Tidak pernah';

  @override
  String get focusExpansionAnimation => 'Animasi Ekspansi Fokus';

  @override
  String get desktopUiScale => 'Skala UI Desktop';

  @override
  String get scaleFocusedCards =>
      'Skalakan kartu dan ubin yang terfokus atau melayang';

  @override
  String get backgroundBackdrops => 'Latar Belakang Latar Belakang';

  @override
  String get showBackdropImages =>
      'Tampilkan gambar latar belakang di balik konten';

  @override
  String get seriesThumbnails => 'Gambar Mini Seri';

  @override
  String get seriesThumbnailsDescription =>
      'Hanya episode: gunakan karya seni seri yang cocok dengan setiap jenis gambar baris';

  @override
  String get homeRowInfoOverlay => 'Hamparan Info Baris Beranda';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Tampilkan judul dan metadata saat menelusuri baris beranda';

  @override
  String get clockDisplay => 'Tampilan Jam';

  @override
  String get inMenus => 'Di Menu';

  @override
  String get inVideo => 'Dalam Video';

  @override
  String get seasonalEffects => 'Efek Musiman';

  @override
  String get seasonalEffectsDescription => 'Efek visual dan dekorasi musiman';

  @override
  String get snow => 'Salju';

  @override
  String get fireworks => 'Kembang api';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Daun Jatuh';

  @override
  String get themeMusic => 'Musik Tema';

  @override
  String get playThemeMusicOnDetailPages =>
      'Putar musik tema di halaman detail';

  @override
  String get themeMusicVolume => 'Volume Musik Tema';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Musik Tema di Baris Beranda';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Mainkan saat menjelajahi layar beranda';

  @override
  String get detailsBackgroundBlur => 'Detail Latar Belakang Buram';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Latar Belakang Penjelajahan Buram';

  @override
  String get maxStreamingBitrate => 'Kecepatan Streaming Maks';

  @override
  String get maxResolution => 'Resolusi Maks';

  @override
  String get playerZoomMode => 'Mode Zoom Pemain';

  @override
  String get fit => 'Bugar';

  @override
  String get autoCrop => 'Pangkas Otomatis';

  @override
  String get stretch => 'Menggeliat';

  @override
  String get refreshRateSwitching => 'Peralihan Kecepatan Penyegaran';

  @override
  String get disabled => 'Dengan disabilitas';

  @override
  String get scaleOnTv => 'Skala di TV';

  @override
  String get scaleOnDevice => 'Skala di Perangkat';

  @override
  String get trickPlay => 'Permainan Trik';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Tampilkan thumbnail pratinjau saat mencari';

  @override
  String get showDescriptionOnPause => 'Tampilkan Deskripsi saat Jeda';

  @override
  String get dimVideoShowOverview =>
      'Redupkan video dan tampilkan teks ikhtisar saat dijeda';

  @override
  String get osdLockButton => 'Tombol Kunci OSD';

  @override
  String get osdLockButtonDescription =>
      'Tampilkan tombol kunci yang memblokir input sentuh hingga ditekan lama';

  @override
  String get audioBehavior => 'Perilaku Audio';

  @override
  String get downmixToStereo => 'Turunkan campuran ke Stereo';

  @override
  String get defaultAudioLanguage => 'Bahasa Audio Bawaan';

  @override
  String get autoServerDefault => 'Otomatis (Default Server)';

  @override
  String get english => 'Bahasa inggris';

  @override
  String get spanish => 'Spanyol';

  @override
  String get french => 'Perancis';

  @override
  String get german => 'Jerman';

  @override
  String get italian => 'Italia';

  @override
  String get portuguese => 'Portugis';

  @override
  String get japanese => 'Jepang';

  @override
  String get korean => 'Korea';

  @override
  String get chinese => 'Cina';

  @override
  String get russian => 'Rusia';

  @override
  String get arabic => 'Arab';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Belanda';

  @override
  String get swedish => 'Swedia';

  @override
  String get norwegian => 'Norwegia';

  @override
  String get danish => 'Denmark';

  @override
  String get finnish => 'Finlandia';

  @override
  String get polish => 'Polandia';

  @override
  String get ac3Passthrough => 'Jalur AC3';

  @override
  String get dtsPassthrough => 'Lintasan DTS';

  @override
  String get trueHdSupport => 'Dukungan TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Audio Bitstream DTS ke AVR saja; memerlukan dukungan penerima dan jalur sumber DTS';

  @override
  String get enableTrueHdAudio =>
      'Aktifkan audio TrueHD (mungkin tidak berfungsi di semua platform)';

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
  String get nightMode => 'Modus Malam';

  @override
  String get compressDynamicRange => 'Kompres rentang dinamis';

  @override
  String get advancedMpv => 'Lanjutan mpv';

  @override
  String get enableCustomMpvConf => 'Aktifkan Kustom mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Terapkan mpv.conf yang ditentukan pengguna sebelum pemutaran dimulai';

  @override
  String get unsafeAdvancedMpvOptions => 'Opsi mpv Lanjutan yang Tidak Aman';

  @override
  String get unsafeMpvOptionsDescription =>
      'Izinkan rangkaian opsi mpv yang lebih luas. Dapat merusak perilaku pemutaran.';

  @override
  String get hardwareDecoding => 'Penguraian kode perangkat keras';

  @override
  String get hardwareDecodingSubtitle =>
      'Dapat meningkatkan kinerja namun dapat menyebabkan masalah pemutaran pada beberapa perangkat.';

  @override
  String get nextUpAndQueuing => 'Selanjutnya & Antrian';

  @override
  String get nextUpDisplay => 'Tampilan Selanjutnya';

  @override
  String get extended => 'Diperpanjang';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Batas Waktu Selanjutnya';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Antrian Media';

  @override
  String get autoQueueNextEpisodes => 'Antrean otomatis episode berikutnya';

  @override
  String get stillWatchingPrompt => 'Masih Menonton Prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Lanjutkan & Lewati';

  @override
  String get resumeRewind => 'Lanjutkan Putar Ulang';

  @override
  String get unpauseRewind => 'Batalkan jeda Putar Ulang';

  @override
  String get fiveSeconds => '5 detik';

  @override
  String get tenSeconds => '10 detik';

  @override
  String get fifteenSeconds => '15 detik';

  @override
  String get thirtySeconds => '30 detik';

  @override
  String get skipBackLength => 'Lewati Panjang Kembali';

  @override
  String get skipForwardLength => 'Lewati Panjang Maju';

  @override
  String get customMpvConfPath => 'Jalur mpv.conf khusus';

  @override
  String get notSetMpvConf =>
      'Tidak disetel. Moonfin akan mencoba mpv.conf default di folder aplikasi/data.';

  @override
  String get selectMpvConf => 'Pilih mpv.conf';

  @override
  String get pathToMpvConf => '/path/ke/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Pengaturan gaya (ukuran, warna, offset) berlaku untuk subtitle berbasis teks (SRT, VTT, TTML). Subtitle ASS/SSA menggunakan gaya tersematnya sendiri kecuali \"ASS/SSA Direct Play\" dimatikan. Subtitle bitmap (PGS, DVB, VobSub) tidak dapat diubah gayanya.';

  @override
  String get defaultSubtitleLanguage => 'Bahasa Subtitle Default';

  @override
  String get defaultToNoSubtitles => 'Defaultnya adalah Tanpa Subtitle';

  @override
  String get turnOffSubtitlesByDefault => 'Matikan subtitle secara default';

  @override
  String get subtitleSize => 'Ukuran Subjudul';

  @override
  String get textFillColor => 'Warna Isi Teks';

  @override
  String get backgroundColor => 'Warna Latar Belakang';

  @override
  String get textStrokeColor => 'Warna Goresan Teks';

  @override
  String get subtitleCustomization => 'Kustomisasi Subjudul';

  @override
  String get subtitleCustomizationDescription => 'Sesuaikan tampilan subtitle';

  @override
  String get subtitlePreviewText =>
      'Rubah coklat yang gesit melompati anjing pemalas';

  @override
  String get verticalOffset => 'Perimbangan Vertikal';

  @override
  String get pgsDirectPlay => 'Putar Langsung PGS';

  @override
  String get directPlayPgsSubtitles => 'Putar langsung subtitle PGS';

  @override
  String get assSsaDirectPlay => 'Putar Langsung ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'Putar langsung subtitle ASS/SSA';

  @override
  String get white => 'Putih';

  @override
  String get black => 'Hitam';

  @override
  String get yellow => 'Kuning';

  @override
  String get green => 'Hijau';

  @override
  String get cyan => 'Sian';

  @override
  String get red => 'Merah';

  @override
  String get transparent => 'Transparan';

  @override
  String get semiTransparentBlack => 'Hitam semi transparan';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Seluler';

  @override
  String get tv => 'televisi';

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
  String get customizationProfile => 'Profil Kustomisasi';

  @override
  String get customizationProfileDescription =>
      'Pilih profil yang akan dimuat, diedit, dan disinkronkan. Global berlaku di mana saja kecuali profil perangkat menggantikannya. Titik hijau menandai profil perangkat Anda saat ini.';

  @override
  String get loadProfile => 'Muat Profil';

  @override
  String get syncing => 'Menyinkronkan...';

  @override
  String get syncToProfile => 'Sinkronkan Ke Profil';

  @override
  String get profileSyncHidden => 'Sinkronisasi Profil Tersembunyi';

  @override
  String get enablePluginSyncDescription =>
      'Aktifkan Sinkronisasi Plugin Server di pengaturan Plugin untuk menampilkan kontrol profil di sini.';

  @override
  String get quality => 'Kualitas';

  @override
  String get defaultDownloadQuality => 'Kualitas Unduhan Default';

  @override
  String get network => 'Jaringan';

  @override
  String get wifiOnlyDownloads => 'Unduhan Khusus WiFi';

  @override
  String get onlyDownloadOnWifi => 'Hanya unduh saat terhubung ke WiFi';

  @override
  String get storage => 'Penyimpanan';

  @override
  String get storageUsed => 'Penyimpanan Digunakan';

  @override
  String get manage => 'Mengelola';

  @override
  String get calculating => 'Menghitung...';

  @override
  String get downloadLocation => 'Unduh Lokasi';

  @override
  String get defaultLabel => 'Bawaan';

  @override
  String get saveToDownloadsFolder => 'Simpan ke folder Unduhan';

  @override
  String get downloadsVisibleToOtherApps =>
      'Unduhan/Moonfin — terlihat oleh aplikasi lain';

  @override
  String get dangerZone =>
      'Unduhan/__ARB_TERM_0__ — terlihat oleh aplikasi lain';

  @override
  String get clearAllDownloads => 'Hapus Semua Unduhan';

  @override
  String get original => 'Asli';

  @override
  String get changeDownloadLocation => 'Ubah Lokasi Unduhan';

  @override
  String get changeDownloadLocationDescription =>
      'Unduhan baru akan disimpan ke folder yang dipilih. Unduhan yang ada akan tetap berada di lokasinya saat ini dan dapat dikelola dari pengaturan Penyimpanan.';

  @override
  String get confirm => 'Mengonfirmasi';

  @override
  String get cannotWriteToFolder =>
      'Tidak dapat menulis ke folder yang dipilih. Silakan pilih lokasi lain atau berikan izin penyimpanan.';

  @override
  String get saveToDownloadsFolderQuestion => 'Simpan ke folder Unduhan?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Media yang diunduh akan disimpan ke Unduhan/Moonfin di perangkat Anda. File-file ini akan terlihat oleh aplikasi lain seperti galeri atau pemutar musik Anda.\n\nUnduhan yang ada akan tetap berada di lokasinya saat ini.';

  @override
  String get enable => 'Memungkinkan';

  @override
  String get clearAllDownloadsWarning =>
      'Tindakan ini akan menghapus semua media yang diunduh dan tidak dapat dibatalkan.';

  @override
  String get clearAll => 'Hapus Semua';

  @override
  String get navigationStyle => 'Gaya Navigasi';

  @override
  String get topBar => 'Bilah Atas';

  @override
  String get leftSidebar => 'Bilah Sisi Kiri';

  @override
  String get showShuffleButton => 'Tampilkan Tombol Acak';

  @override
  String get showGenresButton => 'Tampilkan Tombol Genre';

  @override
  String get showFavoritesButton => 'Tampilkan Tombol Favorit';

  @override
  String get showLibrariesInToolbar => 'Tampilkan Perpustakaan di Toolbar';

  @override
  String get navbarOpacity => 'Opasitas Navbar';

  @override
  String get navbarColor => 'Warna Bilah Nav';

  @override
  String get gray => 'Abu-abu';

  @override
  String get darkBlue => 'Biru tua';

  @override
  String get purple => 'Ungu';

  @override
  String get teal => 'teal';

  @override
  String get navy => 'Angkatan laut';

  @override
  String get charcoal => 'Arang';

  @override
  String get brown => 'Cokelat';

  @override
  String get darkRed => 'Merah Tua';

  @override
  String get darkGreen => 'Hijau Tua';

  @override
  String get slate => 'Batu tulis';

  @override
  String get indigo => 'Nila';

  @override
  String get libraryDisplay => 'Tampilan Perpustakaan';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'gambar kecil';

  @override
  String get bannerLabel => 'Spanduk';

  @override
  String get overridePerLibrarySettings => 'Ganti Pengaturan Per Perpustakaan';

  @override
  String get applyImageTypeToAllLibraries =>
      'Terapkan jenis gambar ke semua perpustakaan';

  @override
  String get multiServerLibraries => 'Perpustakaan Multi-Server';

  @override
  String get showLibrariesFromAllServers =>
      'Tampilkan perpustakaan dari semua server yang terhubung';

  @override
  String get enableFolderView => 'Aktifkan Tampilan Folder';

  @override
  String get showFolderBrowsingOption => 'Tampilkan opsi penjelajahan folder';

  @override
  String get libraryVisibility => 'Visibilitas Perpustakaan';

  @override
  String get libraryVisibilityDescription =>
      'Alihkan visibilitas halaman beranda per perpustakaan. Mulai ulang Moonfin agar perubahan diterapkan.';

  @override
  String get showInNavigation => 'Tampilkan di navigasi';

  @override
  String get showInLatestMedia => 'Tampilkan di media terkini';

  @override
  String get sourceLibraries => 'Perpustakaan Sumber';

  @override
  String get sourceCollections => 'Koleksi Sumber';

  @override
  String get excludedGenres => 'Genre yang Dikecualikan';

  @override
  String get selectAll => 'Pilih Semua';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Bilah Media';

  @override
  String get mediaSources => 'Sumber Media';

  @override
  String get behavior => 'Perilaku';

  @override
  String get seconds => 'detik';

  @override
  String get localPreviews => 'Pratinjau Lokal';

  @override
  String get localPreviewsDescription =>
      'Konfigurasikan pratinjau cuplikan, media, dan audio.';

  @override
  String get mediaBarMode => 'Gaya Bilah Media';

  @override
  String get mediaBarModeDescription =>
      'Pilih antara Moonfin, MakD, atau matikan bilah media';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Mati';

  @override
  String get enableMediaBar => 'Aktifkan Bilah Media';

  @override
  String get showFeaturedContentSlideshow =>
      'Tampilkan tayangan slide konten unggulan di beranda';

  @override
  String get contentType => 'Tipe Konten';

  @override
  String get moviesAndTvShows => 'Film & Acara TV';

  @override
  String get moviesOnly => 'Hanya Film';

  @override
  String get tvShowsOnly => 'Hanya Acara TV';

  @override
  String get itemCount => 'Jumlah Barang';

  @override
  String get noneSelected => 'Tidak ada yang dipilih';

  @override
  String get noneExcluded => 'Tidak ada yang dikecualikan';

  @override
  String get autoAdvance => 'Maju Otomatis';

  @override
  String get autoAdvanceSlides => 'Secara otomatis maju ke slide berikutnya';

  @override
  String get autoAdvanceInterval => 'Interval Maju Otomatis';

  @override
  String get trailerPreview => 'Pratinjau Cuplikan';

  @override
  String get autoPlayTrailers =>
      'Putar otomatis cuplikan di bilah media setelah 3 detik';

  @override
  String get episodePreview => 'Pratinjau Episode';

  @override
  String get mediaPreview => 'Pratinjau Media';

  @override
  String get episodePreviewDescription =>
      'Mainkan pratinjau sebaris 30 detik pada kartu yang terfokus, melayang, atau ditekan lama';

  @override
  String get mediaPreviewDescription =>
      'Mainkan pratinjau sebaris 30 detik pada kartu yang terfokus, melayang, atau ditekan lama';

  @override
  String get previewAudio => 'Pratinjau Audio';

  @override
  String get enablePreviewAudio =>
      'Aktifkan audio untuk pratinjau cuplikan dan episode';

  @override
  String get latestMedia => 'Media Terkini';

  @override
  String get recentlyReleased => 'Baru-baru ini Dirilis';

  @override
  String get myMedia => 'Media Saya';

  @override
  String get myMediaSmall => 'Media Saya (Kecil)';

  @override
  String get continueWatching => 'Lanjutkan Menonton';

  @override
  String get resumeAudio => 'Lanjutkan Audio';

  @override
  String get resumeBooks => 'Lanjutkan Buku';

  @override
  String get activeRecordings => 'Rekaman Aktif';

  @override
  String get playlists => 'Daftar Putar';

  @override
  String get liveTV => 'siaran langsung';

  @override
  String get homeSections => 'Bagian Rumah';

  @override
  String get resetToDefaults => 'Atur ulang ke default';

  @override
  String get homeRowPosterSize => 'Ukuran Poster Baris Beranda';

  @override
  String get perRowImageTypeSelection => 'Pemilihan Jenis Gambar Per Baris';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurasikan jenis gambar untuk setiap baris beranda yang diaktifkan';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Gabungkan Lanjutkan Menonton dan Selanjutnya';

  @override
  String get combineBothRows => 'Jenis Gambar Per Baris';

  @override
  String get perRowImageType => 'Jenis Gambar Per Baris';

  @override
  String get perRowSettings => 'Pengaturan Per Baris';

  @override
  String get autoLogin => 'Masuk Otomatis';

  @override
  String get lastUser => 'Pengguna Terakhir';

  @override
  String get specificUser => 'Pengguna Tertentu';

  @override
  String get alwaysAuthenticate => 'Selalu Otentikasi';

  @override
  String get requirePasswordWithToken =>
      'Memerlukan kata sandi bahkan dengan token yang disimpan';

  @override
  String get confirmExit => 'Konfirmasi Keluar';

  @override
  String get showConfirmationBeforeExiting =>
      'Tampilkan konfirmasi sebelum keluar';

  @override
  String get blockContentWithRatings =>
      'Blokir konten dengan peringkat berikut:';

  @override
  String get noContentRatingsFound =>
      'Belum ada peringkat konten yang ditemukan di server ini.';

  @override
  String get couldNotLoadServerRatings =>
      'Tidak dapat memuat peringkat server. Hanya menampilkan peringkat yang disimpan.';

  @override
  String get couldNotRefreshRatings =>
      'Tidak dapat menyegarkan peringkat dari server. Menampilkan peringkat yang disimpan.';

  @override
  String get enablePinCode => 'Aktifkan Kode PIN';

  @override
  String get requirePinToAccess => 'Memerlukan PIN untuk mengakses akun Anda';

  @override
  String get changePin => 'Ganti PIN';

  @override
  String get setNewPinCode => 'Tetapkan kode PIN baru';

  @override
  String get removePin => 'Hapus PIN';

  @override
  String get removePinProtection => 'Hapus perlindungan kode PIN';

  @override
  String get screensaver => 'Penghemat layar';

  @override
  String get inAppScreensaver => 'Penghemat Layar Dalam Aplikasi';

  @override
  String get enableBuiltInScreensaver => 'Aktifkan screensaver bawaan';

  @override
  String get mode => 'Mode';

  @override
  String get libraryArt => 'Seni Perpustakaan';

  @override
  String get logo => 'logo';

  @override
  String get clock => 'Jam';

  @override
  String get timeout => 'Batas waktu';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Tingkat Peredupan';

  @override
  String get maxAgeRating => 'Peringkat Usia Maks';

  @override
  String get any => 'Setiap';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Memerlukan Peringkat Usia';

  @override
  String get onlyShowRatedContent =>
      'Hanya tampilkan konten yang diberi rating';

  @override
  String get showClock => 'Tampilkan Jam';

  @override
  String get displayClockDuringScreensaver =>
      'Tampilkan jam selama screensaver';

  @override
  String get rottenTomatoesCritics => 'Tomat Busuk (Kritikus)';

  @override
  String get rottenTomatoesAudience => 'Tomat Busuk (Penonton)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritik';

  @override
  String get metacriticUser => 'Metakritik (Pengguna)';

  @override
  String get trakt => 'saluran';

  @override
  String get letterboxd => 'Kotak suratd';

  @override
  String get myAnimeList => 'Daftar Anime Saya';

  @override
  String get aniList => 'Daftar Ani';

  @override
  String get communityRating => 'Peringkat Komunitas';

  @override
  String get ratings => 'Peringkat';

  @override
  String get additionalRatings => 'Peringkat Tambahan';

  @override
  String get showMdbListAndTmdbRatings =>
      'Tampilkan peringkat MDBList dan TMDB';

  @override
  String get ratingLabels => 'Label Peringkat';

  @override
  String get showLabelsNextToIcons => 'Tampilkan label di sebelah ikon rating';

  @override
  String get ratingBadges => 'Lencana Peringkat';

  @override
  String get showDecorativeBadges =>
      'Tampilkan lencana dekoratif di belakang peringkat';

  @override
  String get episodeRatings => 'Peringkat Episode';

  @override
  String get showRatingsOnEpisodes =>
      'Tampilkan peringkat pada masing-masing episode';

  @override
  String get ratingSources => 'Sumber Peringkat';

  @override
  String get ratingSourcesDescription =>
      'Aktifkan dan susun ulang sumber peringkat yang ditampilkan di seluruh aplikasi';

  @override
  String get pluginLabel => 'Pengaya';

  @override
  String get pluginDetected => 'Plugin Terdeteksi';

  @override
  String get pluginNotDetected => 'Plugin Tidak Terdeteksi';

  @override
  String get pluginDetectedDescription =>
      'Plugin server terdeteksi. Sinkronisasi diaktifkan secara otomatis saat plugin pertama kali ditemukan.';

  @override
  String get pluginNotDetectedDescription =>
      'Plugin server saat ini tidak terdeteksi. Pengaturan lokal masih menggunakan nilai tersimpan atau default bawaannya.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Layanan yang Tersedia';

  @override
  String get serverPluginSync => 'Sinkronisasi Plugin Server';

  @override
  String get syncSettingsWithPlugin =>
      'Sinkronkan pengaturan dengan plugin server';

  @override
  String get whatSyncControls => 'Kontrol sinkronisasi apa';

  @override
  String get syncControlsDescription =>
      'Sinkronisasi hanya mengontrol apakah pengaturan yang didukung plugin didorong ke dan ditarik dari server. Pemilihan profil dan tindakan sinkronisasi profil berada dalam pengaturan Kustomisasi ketika sinkronisasi plugin diaktifkan.';

  @override
  String get recentRequests => 'Permintaan Terbaru';

  @override
  String get recentlyAdded => 'Baru Ditambahkan';

  @override
  String get trending => 'Sedang tren';

  @override
  String get popularMovies => 'Film Populer';

  @override
  String get movieGenres => 'Genre Film';

  @override
  String get upcomingMovies => 'Film Mendatang';

  @override
  String get studios => 'Studio';

  @override
  String get popularSeries => 'Seri Populer';

  @override
  String get seriesGenres => 'Genre Seri';

  @override
  String get upcomingSeries => 'Seri Mendatang';

  @override
  String get networks => 'Jaringan';

  @override
  String get resetRowsToDefaults => 'Reset baris ke default';

  @override
  String get enableSeerr => 'Aktifkan Seerr';

  @override
  String get showSeerrInNavigation =>
      'Tampilkan Seerr di navigasi (memerlukan plugin server)';

  @override
  String get seerrUnavailable =>
      'Tidak tersedia karena dukungan plugin server Seerr dinonaktifkan.';

  @override
  String get nsfwFilter => 'Penyaring NSFW';

  @override
  String get hideAdultContent => 'Sembunyikan konten dewasa di hasil';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Temukan Baris';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Tarik untuk menyusun ulang. Mengaktifkan atau menonaktifkan baris. Sinkronisasi urutan baris diaktifkan dengan plugin Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Tarik untuk menyusun ulang. Mengaktifkan atau menonaktifkan baris.';

  @override
  String get enabled => 'Diaktifkan';

  @override
  String get hidden => 'Tersembunyi';

  @override
  String get aboutTitle => 'Tentang';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Lisensi Sumber Terbuka';

  @override
  String get sourceCode => 'Kode Sumber';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Periksa Pembaruan Sekarang';

  @override
  String get checksLatestDesktopRelease =>
      'Periksa rilis desktop terbaru untuk platform ini';

  @override
  String get youAreUpToDate => 'Anda terkini.';

  @override
  String get couldNotCheckForUpdates =>
      'Tidak dapat memeriksa pembaruan saat ini.';

  @override
  String get noCompatibleUpdate =>
      'Tidak ditemukan paket pembaruan yang kompatibel untuk platform ini.';

  @override
  String get updateChecksNotSupported =>
      'Pemeriksaan pembaruan tidak didukung pada platform ini.';

  @override
  String get updateNotificationsDisabled =>
      'Notifikasi pembaruan dinonaktifkan.';

  @override
  String get pleaseWaitBeforeChecking => 'Harap tunggu sebelum memeriksa lagi.';

  @override
  String get latestUpdateAlreadyShown => 'Pembaruan terkini sudah ditampilkan.';

  @override
  String get updateAvailable => 'Pembaruan tersedia.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Perbarui Pemberitahuan';

  @override
  String get showWhenUpdatesAvailable => 'Tampilkan saat pembaruan tersedia';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Baca Catatan Rilis';

  @override
  String get downloadingUpdate => 'Mengunduh pembaruan...';

  @override
  String get updateDownloadFailed =>
      'Unduhan pembaruan gagal. Silakan coba lagi.';

  @override
  String get openReleasesPage => 'Buka Halaman Rilis';

  @override
  String get navigation => 'Navigasi';

  @override
  String get watchedIndicatorsBackdrops =>
      'Indikator yang diamati, latar belakang';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Warna fokus, indikator yang diamati, latar belakang';

  @override
  String get navbarStyleToolbarAppearance =>
      'Gaya Navbar, tombol toolbar, tampilan';

  @override
  String get reorderToggleHomeRows => 'Susun ulang dan alihkan baris beranda';

  @override
  String get featuredContentAppearance => 'Konten unggulan, penampilan';

  @override
  String get posterSizeImageTypeFolderView =>
      'Ukuran poster, jenis gambar, tampilan folder';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB, dan sumber pemeringkatan';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Jernih';

  @override
  String get browse => 'Jelajahi';

  @override
  String get noResults => 'Tidak ada hasil';

  @override
  String get seerrAvailableStatus => 'Tersedia';

  @override
  String get seerrRequestedStatus => 'Diminta';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Pengaturan Pelihat';

  @override
  String get requestMore => 'Minta Lebih Banyak';

  @override
  String get request => 'Meminta';

  @override
  String get cancelRequest => 'Batalkan Permintaan';

  @override
  String get playInMoonfin => 'Mainkan di Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Menyetujui';

  @override
  String get declineAction => 'Menolak';

  @override
  String get similar => 'Serupa';

  @override
  String get recommendations => 'Rekomendasi';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Menyimpan';

  @override
  String get itemNotFoundInLibrary =>
      'Item tidak ditemukan di perpustakaan Moonfin Anda';

  @override
  String get errorSearchingLibrary => 'Kesalahan saat mencari perpustakaan';

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
  String get submitRequest => 'Kirim Permintaan';

  @override
  String get allSeasons => 'Semua Musim';

  @override
  String get advancedOptions => 'Opsi Lanjutan';

  @override
  String get noServiceServersConfigured =>
      'Tidak ada server layanan yang dikonfigurasi';

  @override
  String get server => 'pelayan';

  @override
  String get qualityProfile => 'Profil Kualitas';

  @override
  String get rootFolder => 'Folder Akar';

  @override
  String get showMore => 'Tampilkan Lebih Banyak';

  @override
  String get appearances => 'Penampilan';

  @override
  String get crewSection => 'Awak kapal';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Tidak ada permintaan';

  @override
  String get pendingStatus => 'Tertunda';

  @override
  String get declinedStatus => 'Ditolak';

  @override
  String get partiallyAvailable => 'Tersedia Sebagian';

  @override
  String get downloadingStatus => 'Mengunduh';

  @override
  String get approvedStatus => 'Disetujui';

  @override
  String get notRequestedStatus => 'Tidak Diminta';

  @override
  String get blocklistedStatus => 'Masuk daftar blokir';

  @override
  String get deletedStatus => 'Dihapus';

  @override
  String get tmdbScore => 'Skor TMDB';

  @override
  String get releaseDateLabel => 'Tanggal Rilis';

  @override
  String get firstAirDateLabel => 'Tanggal Tayang Pertama';

  @override
  String get revenueLabel => 'Pendapatan';

  @override
  String get runtimeLabel => 'Waktu proses';

  @override
  String get budgetLabel => 'Anggaran';

  @override
  String get originalLanguageLabel => 'Bahasa Asli';

  @override
  String get seasonsLabel => 'Musim';

  @override
  String get episodesLabel => 'Episode';

  @override
  String get access => 'Mengakses';

  @override
  String get add => 'Menambahkan';

  @override
  String get address => 'Alamat';

  @override
  String get analytics => 'Analisis';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Isi';

  @override
  String get copy => 'Menyalin';

  @override
  String get create => 'Membuat';

  @override
  String get disable => 'Cacat';

  @override
  String get done => 'Selesai';

  @override
  String get edit => 'Sunting';

  @override
  String get encoding => 'Pengkodean';

  @override
  String get error => 'Kesalahan';

  @override
  String get forward => 'Maju';

  @override
  String get general => 'Umum';

  @override
  String get go => 'Pergi';

  @override
  String get install => 'Memasang';

  @override
  String get installed => 'Dipasang';

  @override
  String get interval => 'Selang';

  @override
  String get name => 'Nama';

  @override
  String get networking => 'Jaringan';

  @override
  String get next => 'Berikutnya';

  @override
  String get path => 'Jalur';

  @override
  String get paused => 'Dijeda';

  @override
  String get permissions => 'Izin';

  @override
  String get processing => 'Pengolahan';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Penyedia';

  @override
  String get refresh => 'Menyegarkan';

  @override
  String get remote => 'Terpencil';

  @override
  String get rename => 'Ganti nama';

  @override
  String get revoke => 'Menarik kembali';

  @override
  String get role => 'Peran';

  @override
  String get root => 'Akar';

  @override
  String get run => 'Berlari';

  @override
  String get search => 'Mencari';

  @override
  String get select => 'Memilih';

  @override
  String get send => 'Mengirim';

  @override
  String get sessions => 'Sesi';

  @override
  String get set => 'Mengatur';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Berhenti';

  @override
  String get streaming => 'Mengalir';

  @override
  String get time => 'Waktu';

  @override
  String get trickplay => 'Permainan tipuan';

  @override
  String get uninstall => 'Copot pemasangan';

  @override
  String get up => 'Ke atas';

  @override
  String get update => 'Memperbarui';

  @override
  String get upload => 'Mengunggah';

  @override
  String get unmute => 'Membunyikan';

  @override
  String get mute => 'Bisu';

  @override
  String get branding => 'merek';

  @override
  String get adminDrawerDashboard => 'Dasbor';

  @override
  String get adminDrawerAnalytics => 'Analisis';

  @override
  String get adminDrawerSettings => 'Pengaturan';

  @override
  String get adminDrawerBranding => 'merek';

  @override
  String get adminDrawerUsers => 'Pengguna';

  @override
  String get adminDrawerLibraries => 'Perpustakaan';

  @override
  String get adminDrawerTranscoding => 'Transkode';

  @override
  String get adminDrawerResume => 'Melanjutkan';

  @override
  String get adminDrawerStreaming => 'Mengalir';

  @override
  String get adminDrawerTrickplay => 'Permainan tipuan';

  @override
  String get adminDrawerDevices => 'Perangkat';

  @override
  String get adminDrawerActivity => 'Aktivitas';

  @override
  String get adminDrawerNetworking => 'Jaringan';

  @override
  String get adminDrawerApiKeys => 'Kunci API';

  @override
  String get adminDrawerBackups => 'Cadangan';

  @override
  String get adminDrawerLogs => 'Log';

  @override
  String get adminDrawerScheduledTasks => 'Tugas Terjadwal';

  @override
  String get adminDrawerPlugins => 'Plugin';

  @override
  String get adminDrawerRepositories => 'Repositori';

  @override
  String get adminDrawerLiveTv => 'siaran langsung';

  @override
  String get adminExitTooltip => 'Keluar dari Admin';

  @override
  String get adminDashboardLoadFailed => 'Gagal memuat dasbor';

  @override
  String get adminMediaOverview => 'Ikhtisar Media';

  @override
  String get adminMediaTotalsError => 'Tidak dapat memuat total media server.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Bacaan singkat tentang berapa banyak konten yang ada di server ini.';

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
  String get analyticsMediaDistribution => 'Distribusi Media';

  @override
  String get analyticsVideoCodecs => 'Codec Video';

  @override
  String get analyticsAudioCodecs => 'Codec Audio';

  @override
  String get analyticsContainers => 'Kontainer';

  @override
  String get analyticsTopGenres => 'Genre Teratas';

  @override
  String get analyticsReleaseYears => 'Tahun Rilis';

  @override
  String get analyticsContentRatings => 'Peringkat Konten';

  @override
  String get analyticsRuntimeBuckets => 'Bucket Waktu Proses';

  @override
  String get analyticsFileFormats => 'Format File';

  @override
  String get analyticsNoData => 'Tidak Ada Data yang Tersedia.';

  @override
  String get adminServerInfo => 'Informasi Server';

  @override
  String get adminRestartPending => 'Mulai Ulang Tertunda';

  @override
  String get adminServerPaths => 'Jalur Server';

  @override
  String get adminServerActions => 'Tindakan Server';

  @override
  String get adminRestartServer => 'Mulai ulang Server';

  @override
  String get adminShutdownServer => 'Matikan Server';

  @override
  String get adminScanLibraries => 'Pindai Perpustakaan';

  @override
  String get adminLibraryScanStarted => 'Pemindaian perpustakaan dimulai';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Reboot server sedang berlangsung';

  @override
  String get adminServerRebootMessage =>
      'Server sedang reboot, silakan restart Moonfin';

  @override
  String get adminActiveSessions => 'Sesi Aktif';

  @override
  String get adminSessionsLoadFailed => 'Gagal memuat sesi';

  @override
  String get adminNoActiveSessions => 'Tidak ada sesi aktif';

  @override
  String get adminRecentActivity => 'Aktivitas Terkini';

  @override
  String get adminNoRecentActivity => 'Tidak ada aktivitas terkini';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Kirim Pesan';

  @override
  String get adminMessageTextHint => 'Teks pesan';

  @override
  String get adminSetVolume => 'Atur Volume';

  @override
  String get sessionPrev => 'Sebelumnya';

  @override
  String get sessionRewind => 'Memutar ulang';

  @override
  String get sessionForward => 'Maju';

  @override
  String get sessionNext => 'Berikutnya';

  @override
  String get sessionVolumeDown => 'jilid –';

  @override
  String get sessionVolumeUp => 'Jil +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Sedang Dimainkan';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Tindakan';

  @override
  String get videoCodec => 'Kodek Video';

  @override
  String get audioCodec => 'Kodek Audio';

  @override
  String get hwAccel => 'HW Aksel';

  @override
  String get completion => 'Penyelesaian';

  @override
  String get direct => 'Langsung';

  @override
  String get adminDisconnect => 'Memutuskan';

  @override
  String get adminClearDates => 'Tanggal yang jelas';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Tidak ada entri aktivitas';

  @override
  String get adminEditDeviceName => 'Edit Nama Perangkat';

  @override
  String get adminCustomName => 'Nama Kustom';

  @override
  String get adminDeviceNameUpdated => 'Nama perangkat diperbarui';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Hapus Perangkat';

  @override
  String get adminDeviceDeleted => 'Perangkat dihapus';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Gagal memuat perangkat';

  @override
  String get adminSearchDevices => 'Perangkat pencarian';

  @override
  String get adminThisDevice => 'Perangkat ini';

  @override
  String get adminEditName => 'Sunting Nama';

  @override
  String get adminLibrariesLoadFailed => 'Gagal memuat perpustakaan';

  @override
  String get adminNoLibraries => 'Tidak ada perpustakaan yang dikonfigurasi';

  @override
  String get adminScanAllLibraries => 'Pindai Semua Perpustakaan';

  @override
  String get adminAddLibrary => 'Tambahkan Perpustakaan';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Ganti nama Perpustakaan';

  @override
  String get adminNewName => 'Nama baru';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Hapus Perpustakaan';

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
  String get adminRemovePath => 'Hapus Jalur';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opsi perpustakaan disimpan';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Gagal memuat perpustakaan';

  @override
  String get adminNoMediaPaths => 'Tidak ada jalur media yang dikonfigurasi';

  @override
  String get adminAddPath => 'Tambahkan Jalur';

  @override
  String get adminBrowseFilesystem => 'Jelajahi sistem file server:';

  @override
  String get adminSaveOptions => 'Simpan Opsi';

  @override
  String get adminPreferredMetadataLanguage => 'Bahasa metadata pilihan';

  @override
  String get adminMetadataLanguageHint => 'misalnya id, de, fr';

  @override
  String get adminMetadataCountryCode => 'Kode negara metadata';

  @override
  String get adminMetadataCountryHint => 'misalnya AS, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Nama perpustakaan wajib diisi';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Nama Perpustakaan';

  @override
  String get adminSelectedPaths => 'Jalur yang Dipilih:';

  @override
  String get adminNoPathsAdded =>
      'Tidak ada jalur yang ditambahkan (dapat ditambahkan nanti)';

  @override
  String get adminCreateLibrary => 'Buat Perpustakaan';

  @override
  String get paths => 'Jalur:';

  @override
  String get adminDisableUser => 'Nonaktifkan Pengguna';

  @override
  String get adminEnableUser => 'Aktifkan Pengguna';

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
  String get adminUsersLoadFailed => 'Gagal memuat pengguna';

  @override
  String get adminSearchUsers => 'Cari pengguna';

  @override
  String get adminEditUser => 'Sunting Pengguna';

  @override
  String get adminAddUser => 'Tambahkan Pengguna';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Buat Pengguna';

  @override
  String get adminPasswordOptional => 'Kata sandi (opsional)';

  @override
  String get adminUsernameRequired => 'Nama pengguna tidak boleh kosong';

  @override
  String get adminNoProfileChanges =>
      'Tidak ada perubahan profil untuk disimpan';

  @override
  String get adminProfileSaved => 'Profil disimpan';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Izin disimpan';

  @override
  String get adminPasswordsMismatch => 'Kata sandi tidak cocok';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Gagal memuat pengguna';

  @override
  String get adminBackToUsers => 'Kembali ke Pengguna';

  @override
  String get adminSaveProfile => 'Simpan Profil';

  @override
  String get adminDeleteUser => 'Hapus Pengguna';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administrator memiliki akses penuh ke server. Berikan dengan hati-hati.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Pengguna tersembunyi';

  @override
  String get adminAllowMediaPlayback => 'Izinkan pemutaran media';

  @override
  String get adminAllowAudioTranscoding => 'Izinkan transcoding audio';

  @override
  String get adminAllowVideoTranscoding => 'Izinkan transcoding video';

  @override
  String get adminAllowRemuxing => 'Izinkan remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Paksa transcoding sumber jarak jauh';

  @override
  String get adminAllowContentDeletion => 'Izinkan penghapusan konten';

  @override
  String get adminAllowContentDownloading => 'Izinkan pengunduhan konten';

  @override
  String get adminAllowPublicSharing => 'Izinkan berbagi secara publik';

  @override
  String get adminAllowRemoteControl =>
      'Izinkan kendali jarak jauh dari pengguna lain';

  @override
  String get adminAllowSharedDeviceControl =>
      'Izinkan kontrol perangkat bersama';

  @override
  String get adminAllowRemoteAccess => 'Izinkan akses jarak jauh';

  @override
  String get adminRemoteBitrateLimit =>
      'Batas kecepatan bit klien jarak jauh (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Biarkan kosong tanpa batas';

  @override
  String get adminMaxActiveSessions => 'Sesi aktif maksimal';

  @override
  String get adminAllowLiveTvAccess => 'Izinkan akses TV Langsung';

  @override
  String get adminAllowLiveTvManagement => 'Izinkan pengelolaan TV Langsung';

  @override
  String get adminAllowCollectionManagement => 'Izinkan pengelolaan koleksi';

  @override
  String get adminAllowSubtitleManagement => 'Izinkan pengelolaan subtitle';

  @override
  String get adminAllowLyricManagement => 'Izinkan manajemen lirik';

  @override
  String get adminSavePermissions => 'Simpan Izin';

  @override
  String get adminEnableAllLibraryAccess =>
      'Aktifkan akses ke semua perpustakaan';

  @override
  String get adminSaveAccess => 'Simpan Akses';

  @override
  String get adminChangePassword => 'Ubah Kata Sandi';

  @override
  String get adminNewPassword => 'Kata Sandi Baru';

  @override
  String get adminConfirmPassword => 'Konfirmasi Kata Sandi';

  @override
  String get adminSetPassword => 'Tetapkan Kata Sandi';

  @override
  String get adminResetPassword => 'Atur Ulang Kata Sandi';

  @override
  String get adminPasswordReset => 'Penyetelan ulang kata sandi';

  @override
  String get adminPasswordUpdated => 'Kata sandi diperbarui';

  @override
  String get adminUserSettings => 'Pengaturan Pengguna';

  @override
  String get adminLibraryAccess => 'Akses Perpustakaan';

  @override
  String get adminDeviceAndChannelAccess => 'Akses Perangkat & Saluran';

  @override
  String get adminEnableAllDevices => 'Aktifkan akses ke semua perangkat';

  @override
  String get adminEnableAllChannels => 'Aktifkan akses ke semua saluran';

  @override
  String get adminResetPasswordWarning =>
      'Ini akan menghapus kata sandi. Pengguna akan dapat masuk tanpa kata sandi.';

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
  String get adminCreateApiKey => 'Buat Kunci API';

  @override
  String get adminAppName => 'Nama aplikasi';

  @override
  String get adminApiKeyCreated => 'Kunci API Dibuat';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Kunci berhasil dibuat. Server tidak mengembalikan token. Periksa kunci API server.';

  @override
  String get adminKeyCopied => 'Kunci disalin ke clipboard';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Token kunci hilang dari respons server';

  @override
  String get adminRevokeApiKey => 'Cabut Kunci API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Kunci API dicabut';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Gagal memuat kunci API';

  @override
  String get adminApiKeysTitle => 'Kunci API';

  @override
  String get adminCreateKey => 'Buat Kunci';

  @override
  String get adminNoApiKeys => 'Tidak ada kunci API yang ditemukan';

  @override
  String get adminUnknownApp => 'Aplikasi Tidak Dikenal';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Membuat cadangan...';

  @override
  String get adminBackupCreated => 'Cadangan berhasil dibuat';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Jalur cadangan tidak ada dalam respons server';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Konfirmasi Pemulihan';

  @override
  String get adminRestoringBackup => 'Memulihkan cadangan...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Gagal memuat cadangan';

  @override
  String get adminCreateBackup => 'Buat Cadangan';

  @override
  String get adminNoBackups => 'Tidak ada cadangan yang ditemukan';

  @override
  String get adminViewDetails => 'Lihat Detail';

  @override
  String get restore => 'Memulihkan';

  @override
  String get adminLogsLoadFailed => 'Gagal memuat log server';

  @override
  String get adminNoLogFiles => 'Tidak ada file log yang ditemukan';

  @override
  String get adminLogCopied => 'Log disalin ke clipboard';

  @override
  String get adminSaveLogFile => 'Simpan berkas log';

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
  String get adminSearchInLog => 'Cari di log';

  @override
  String get adminNoMatchingLines => 'Tidak ada garis yang cocok';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks =>
      'Tidak ada tugas terjadwal yang ditemukan';

  @override
  String get adminNoTasksMatchFilter =>
      'Tidak ada tugas yang cocok dengan filter saat ini';

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
  String get adminRunNow => 'Jalankan Sekarang';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Eksekusi Terakhir';

  @override
  String get adminTriggers => 'Pemicu';

  @override
  String get adminAddTrigger => 'Tambahkan Pemicu';

  @override
  String get adminNoTriggers => 'Tidak ada pemicu yang dikonfigurasi';

  @override
  String get adminTriggerType => 'Jenis Pemicu';

  @override
  String get adminTimeLimit => 'Batas waktu (opsional)';

  @override
  String get adminNoLimit => 'Tidak ada batasan';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Hari dalam seminggu';

  @override
  String get adminSearchPlugins => 'Cari plugin...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Copot pemasangan Plugin';

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
      'Tidak ada plugin yang cocok dengan pencarian Anda';

  @override
  String get adminNoPluginsInstalled => 'Tidak ada plugin yang terpasang';

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
      'Tidak ada paket yang cocok dengan pencarian Anda';

  @override
  String get adminNoPackagesAvailable => 'Tidak ada paket yang tersedia';

  @override
  String get adminExperimentalIntegration => 'Integrasi Eksperimental';

  @override
  String get adminExperimentalWarning =>
      'Integrasi pengaturan plugin masih bersifat eksperimental. Beberapa halaman pengaturan mungkin tidak ditampilkan dengan benar.';

  @override
  String get continueAction => 'Melanjutkan';

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
      'Tidak dapat membuka pengaturan: token autentikasi tidak ada.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Pengaya tidak ditemukan';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Aktifkan Plugin';

  @override
  String get adminPluginSettingsPage => 'Halaman pengaturan plugin';

  @override
  String get adminRevisionHistory => 'Sejarah Revisi';

  @override
  String get adminNoChangelog => 'Tidak ada log perubahan yang tersedia.';

  @override
  String get adminRemoveRepository => 'Hapus Repositori';

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
  String get adminRepositoryNameHint => 'misalnya Jellyfin Stabil';

  @override
  String get adminRepositoryUrl => 'URL repositori';

  @override
  String get adminAddEntry => 'Tambahkan entri';

  @override
  String get adminInvalidUrl => 'URL tidak valid';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Buka di Peramban';

  @override
  String get adminOpenExternally => 'Buka secara eksternal';

  @override
  String get adminGeneralSettings => 'Pengaturan Umum';

  @override
  String get adminServerName => 'Nama server';

  @override
  String get adminPreferredMetadataCountry => 'Negara metadata pilihan';

  @override
  String get adminCachePath => 'Jalur cache';

  @override
  String get adminMetadataPath => 'Jalur metadata';

  @override
  String get adminLibraryScanConcurrency =>
      'Konkurensi pemindaian perpustakaan';

  @override
  String get adminParallelImageEncodingLimit =>
      'Batas pengkodean gambar paralel';

  @override
  String get adminSlowResponseThreshold => 'Ambang respons lambat (ms)';

  @override
  String get adminBrandingSaved => 'Setelan pencitraan merek disimpan';

  @override
  String get adminBrandingLoadFailed => 'Gagal memuat setelan pencitraan merek';

  @override
  String get adminLoginDisclaimer => 'Penafian masuk';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML ditampilkan di bawah formulir login';

  @override
  String get adminCustomCss => 'CSS khusus';

  @override
  String get adminCustomCssHint => 'CSS khusus diterapkan ke antarmuka web';

  @override
  String get adminEnableSplashScreen => 'Aktifkan layar pembuka';

  @override
  String get adminStreamingSaved => 'Pengaturan streaming disimpan';

  @override
  String get adminStreamingLoadFailed => 'Gagal memuat pengaturan streaming';

  @override
  String get adminStreamingDescription =>
      'Tetapkan batas bitrate streaming global untuk koneksi jarak jauh.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Batas bitrate klien jarak jauh (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Biarkan kosong atau 0 untuk tidak terbatas';

  @override
  String get adminPlaybackSaved => 'Pengaturan pemutaran disimpan';

  @override
  String get adminPlaybackLoadFailed => 'Gagal memuat pengaturan pemutaran';

  @override
  String get adminPlaybackTranscoding => 'Pemutaran / Transcoding';

  @override
  String get adminHardwareAcceleration => 'Akselerasi perangkat keras';

  @override
  String get adminVaapiDevice => 'Perangkat VA-API';

  @override
  String get adminEnableHardwareEncoding =>
      'Aktifkan pengkodean perangkat keras';

  @override
  String get adminEnableHardwareDecoding =>
      'Aktifkan decoding perangkat keras untuk:';

  @override
  String get adminEncodingThreads => 'Pengkodean utas';

  @override
  String get adminAutomatic => '0 = otomatis';

  @override
  String get adminTranscodingTempPath => 'Transkode jalur sementara';

  @override
  String get adminEnableFallbackFont => 'Aktifkan font cadangan';

  @override
  String get adminFallbackFontPath => 'Jalur font cadangan';

  @override
  String get adminAllowSegmentDeletion => 'Izinkan penghapusan segmen';

  @override
  String get adminSegmentKeepSeconds => 'Penyimpanan segmen (detik)';

  @override
  String get adminThrottleBuffering => 'Penyangga throttle';

  @override
  String get adminTrickplaySaved => 'Pengaturan permainan trik disimpan';

  @override
  String get adminTrickplayLoadFailed => 'Gagal memuat pengaturan trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Aktifkan akselerasi perangkat keras';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Aktifkan ekstraksi bingkai kunci saja';

  @override
  String get adminKeyFrameSubtitle =>
      'Lebih cepat tetapi akurasinya lebih rendah';

  @override
  String get adminScanBehavior => 'Perilaku pemindaian';

  @override
  String get adminProcessPriority => 'Prioritas proses';

  @override
  String get adminImageSettings => 'Pengaturan Gambar';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Seberapa sering mengambil frame';

  @override
  String get adminWidthResolutions => 'Resolusi lebar';

  @override
  String get adminTileWidth => 'Lebar ubin';

  @override
  String get adminTileHeight => 'Tinggi ubin';

  @override
  String get adminQualitySubtitle =>
      'Nilai lebih rendah = kualitas lebih baik, file lebih besar';

  @override
  String get adminProcessThreads => 'Proses benang';

  @override
  String get adminResumeSaved => 'Lanjutkan pengaturan disimpan';

  @override
  String get adminResumeLoadFailed => 'Gagal memuat pengaturan resume';

  @override
  String get adminResumeDescription =>
      'Konfigurasikan kapan konten harus ditandai sebagai diputar sebagian atau diputar penuh.';

  @override
  String get adminMinResumePercentage => 'Persentase resume minimum';

  @override
  String get adminMinResumeSubtitle =>
      'Konten harus diputar melewati persentase ini untuk menyimpan kemajuan';

  @override
  String get adminMaxResumePercentage => 'Persentase resume maksimum';

  @override
  String get adminMaxResumeSubtitle =>
      'Konten dianggap diputar sepenuhnya setelah persentase ini';

  @override
  String get adminMinResumeDuration => 'Durasi melanjutkan minimum (detik)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Item yang lebih pendek dari ini tidak dapat dilanjutkan';

  @override
  String get adminMinAudiobookResume => 'Persentase resume buku audio minimum';

  @override
  String get adminMaxAudiobookResume => 'Persentase resume buku audio maksimum';

  @override
  String get adminNetworkingSaved =>
      'Pengaturan jaringan disimpan. Restart server mungkin diperlukan.';

  @override
  String get adminNetworkingLoadFailed => 'Gagal memuat pengaturan jaringan';

  @override
  String get adminNetworkingWarning =>
      'Perubahan pada pengaturan jaringan mungkin memerlukan restart server.';

  @override
  String get adminEnableRemoteAccess => 'Aktifkan akses jarak jauh';

  @override
  String get ports => 'Pelabuhan';

  @override
  String get adminHttpPort => 'Pelabuhan HTTP';

  @override
  String get adminHttpsPort => 'Pelabuhan HTTPS';

  @override
  String get adminPublicHttpsPort => 'Port HTTPS publik';

  @override
  String get adminBaseUrl => 'URL dasar';

  @override
  String get adminBaseUrlHint => 'misalnya /jelifin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Aktifkan HTTPS';

  @override
  String get adminLocalNetwork => 'Jaringan Lokal';

  @override
  String get adminLocalNetworkAddresses => 'Alamat jaringan lokal';

  @override
  String get adminKnownProxies => 'Proksi yang diketahui';

  @override
  String get adminRemoteIpFilter => 'Filter IP Jarak Jauh';

  @override
  String get adminRemoteIpFilterEntries => 'Filter IP jarak jauh';

  @override
  String get adminCertificatePath => 'Jalur sertifikat';

  @override
  String get whitelist => 'Daftar putih';

  @override
  String get blacklist => 'Daftar Hitam';

  @override
  String get notSet => 'Tidak disetel';

  @override
  String get adminMetadataSaved => 'Metadata disimpan';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Segarkan Metadata';

  @override
  String get recursive => 'Rekursif';

  @override
  String get adminReplaceAllMetadata => 'Ganti semua metadata';

  @override
  String get adminReplaceAllImages => 'Ganti semua gambar';

  @override
  String get adminMetadataRefreshRequested => 'Penyegaran metadata diminta';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Cari Orang Jarak Jauh';

  @override
  String get adminNoRemoteMatches => 'Tidak ditemukan kecocokan jarak jauh';

  @override
  String get adminRemoteResults => 'Hasil Jarak Jauh';

  @override
  String get adminRemoteMetadataApplied => 'Metadata jarak jauh diterapkan';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Perbarui Jenis Konten';

  @override
  String get adminContentType => 'Jenis konten';

  @override
  String get adminContentTypeUpdated => 'Jenis konten diperbarui';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'Gagal memuat editor metadata';

  @override
  String get adminNoPeopleEntries => 'Tidak ada entri orang';

  @override
  String get adminNoExternalIds => 'Tidak ada ID eksternal yang tersedia';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Format gambar tidak didukung';

  @override
  String get adminImageReadFailed => 'Gagal membaca gambar yang dipilih';

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
  String get adminAllProviders => 'Semua penyedia';

  @override
  String get adminNoRemoteImages =>
      'Tidak ada gambar jarak jauh yang ditemukan';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Tambahkan Penyetel';

  @override
  String get adminTunerType => 'Tipe Penyetel';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Lainnya';

  @override
  String get adminUrlPath => 'URL / Jalur';

  @override
  String get adminNameOptional => 'Nama (opsional)';

  @override
  String get adminTunerAdded => 'Tuner menambahkan';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Tambahkan Penyedia Panduan';

  @override
  String get adminProviderType => 'Jenis Penyedia';

  @override
  String get adminProviderTypeHint => 'JadwalDirect atau XMLTV';

  @override
  String get adminUsernameOptional => 'Nama pengguna (opsional)';

  @override
  String get adminRefreshInterval => 'Interval penyegaran (jam)';

  @override
  String get adminProviderAdded => 'Penyedia ditambahkan';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Penyetelan ulang tuner diminta';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Pengaturan Perekaman';

  @override
  String get adminPrePadding => 'Pra-padding (menit)';

  @override
  String get adminPostPadding => 'Pasca-padding (menit)';

  @override
  String get adminRecordingPath => 'Jalur perekaman';

  @override
  String get adminSeriesRecordingPath => 'Jalur perekaman seri';

  @override
  String get adminRecordingSettingsSaved => 'Pengaturan perekaman disimpan';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Atur Pemetaan Saluran';

  @override
  String get adminMappingJson => 'Memetakan JSON';

  @override
  String get adminMappingJsonHint => 'Contoh: memetakan payload JSON';

  @override
  String get adminChannelMappingsUpdated => 'Pemetaan saluran diperbarui';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Gagal memuat administrasi TV Langsung';

  @override
  String get adminTunerDevices => 'Perangkat Penyetel';

  @override
  String get adminNoTunerHosts => 'Tidak ada host tuner yang dikonfigurasi';

  @override
  String get adminGuideProviders => 'Penyedia Panduan';

  @override
  String get adminAddProvider => 'Tambahkan Penyedia';

  @override
  String get adminNoListingProviders =>
      'Tidak ada penyedia listingan yang dikonfigurasi';

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
  String get adminTunerDiscovery => 'Penemuan Penyetel';

  @override
  String get adminChannelMappings => 'Pemetaan Saluran';

  @override
  String get adminNoDiscoveredTuners => 'Belum ada tuner yang ditemukan';

  @override
  String get adminSettingsSaved => 'Pengaturan disimpan';

  @override
  String get adminBackupsNotAvailable =>
      'Cadangan tidak tersedia pada build server ini.';

  @override
  String get adminRestoreWarning1 =>
      'Pemulihan akan menggantikan SEMUA data server saat ini dengan data cadangan.';

  @override
  String get adminRestoreWarning2 =>
      'Pengaturan server saat ini, pengguna, dan data perpustakaan akan ditimpa.';

  @override
  String get adminRestoreWarning3 => 'Server akan restart setelah restorasi.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Pemulihan diminta. Restart server mungkin memutuskan sesi ini.';

  @override
  String get adminBackupsTitle => 'Cadangan';

  @override
  String get adminUnknownDate => 'Tanggal tidak diketahui';

  @override
  String get adminUnnamedBackup => 'Cadangan Tanpa Nama';

  @override
  String get adminLiveTvNotAvailable =>
      'Administrasi TV langsung tidak tersedia di server build ini.';

  @override
  String get adminLiveTvTitle => 'Administrasi TV Langsung';

  @override
  String get adminApply => 'Menerapkan';

  @override
  String get adminNotSet => 'Tidak disetel';

  @override
  String get adminReset => 'Mengatur ulang';

  @override
  String get adminLogsTitle => 'Log Server';

  @override
  String get adminLogsNewestFirst => 'Terbaru Pertama';

  @override
  String get adminLogsOldestFirst => 'Tertua Pertama';

  @override
  String get adminLogsJustNow => 'Baru saja';

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
  String get adminLogViewerNoMatches => 'Tidak ada garis yang cocok';

  @override
  String get adminMetadataEditorTitle => 'Penyunting Metadata';

  @override
  String get adminMetadataRemote => 'Terpencil';

  @override
  String get adminMetadataType => 'Jenis';

  @override
  String get adminMetadataDetails => 'Detail';

  @override
  String get adminMetadataExternalIds => 'ID Eksternal';

  @override
  String get adminMetadataImages => 'Gambar';

  @override
  String get adminMetadataFieldTitle => 'Judul';

  @override
  String get adminMetadataFieldSortTitle => 'Urutkan judul';

  @override
  String get adminMetadataFieldOriginalTitle => 'Judul asli';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Tanggal tayang perdana (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Tanggal akhir (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Tahun pembuatan';

  @override
  String get adminMetadataFieldOfficialRating => 'Peringkat resmi';

  @override
  String get adminMetadataFieldCommunityRating => 'Peringkat komunitas';

  @override
  String get adminMetadataFieldCriticRating => 'Peringkat kritikus';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Ringkasan';

  @override
  String get adminMetadataGenres => 'Genre';

  @override
  String get adminMetadataTags => 'Tag';

  @override
  String get adminMetadataStudios => 'Studio';

  @override
  String get adminMetadataPeople => 'Rakyat';

  @override
  String get adminMetadataAddGenre => 'Tambahkan genre';

  @override
  String get adminMetadataAddTag => 'Tambahkan tanda';

  @override
  String get adminMetadataAddStudio => 'Tambahkan studio';

  @override
  String get adminMetadataAddPerson => 'Tambahkan Orang';

  @override
  String get adminMetadataEditPerson => 'Sunting Orang';

  @override
  String get adminMetadataRole => 'Peran';

  @override
  String get adminMetadataImagePrimary => 'Utama';

  @override
  String get adminMetadataImageBackdrop => 'Latar belakang';

  @override
  String get adminMetadataImageLogo => 'logo';

  @override
  String get adminMetadataImageBanner => 'Spanduk';

  @override
  String get adminMetadataImageThumb => 'Ibu jari';

  @override
  String get adminMetadataRecursive => 'Rekursif';

  @override
  String get adminMetadataProvider => 'Penyedia';

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
      'Gagal membaca gambar yang dipilih';

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
      'Ini akan menghapus gambar saat ini dari item tersebut.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Mengunggah';

  @override
  String get adminMetadataUpdate => 'Memperbarui';

  @override
  String get adminMetadataRemoteImage => 'Gambar jarak jauh';

  @override
  String get adminPluginsInstalled => 'Dipasang';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktif';

  @override
  String get adminPluginsRestart => 'Mulai ulang';

  @override
  String get adminPluginsNoSearchResults =>
      'Tidak ada plugin yang cocok dengan pencarian Anda';

  @override
  String get adminPluginsNoneInstalled => 'Tidak ada plugin yang terpasang';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Pembaruan tersedia';

  @override
  String get adminPluginsPendingRemoval =>
      'Penghapusan tertunda setelah restart';

  @override
  String get adminPluginsChangesPending => 'Perubahan menunggu dimulai ulang';

  @override
  String get adminPluginsEnable => 'Memungkinkan';

  @override
  String get adminPluginsDisable => 'Cacat';

  @override
  String get adminPluginsInstallUpdate => 'Instal pembaruan';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Tidak ada paket yang cocok dengan pencarian Anda';

  @override
  String get adminPluginsCatalogEmpty => 'Tidak ada paket yang tersedia';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integrasi Eksperimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrasi pengaturan plugin masih bersifat eksperimental. Beberapa bidang atau tata letak mungkin belum ditampilkan dengan benar.';

  @override
  String get adminPluginDetailToggle404 =>
      'Gagal mengganti plugin. Server tidak dapat menemukan versi plugin ini. Coba segarkan plugin, lalu coba lagi.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Gagal mengganti plugin. Silakan periksa log server untuk detailnya.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Detail';

  @override
  String get adminPluginDetailDeveloper => 'Pengembang';

  @override
  String get adminPluginDetailRepository => 'Gudang';

  @override
  String get adminPluginDetailBundled => 'Dibundel';

  @override
  String get adminPluginDetailEnablePlugin => 'Aktifkan Plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'Restart server diperlukan agar perubahan diterapkan.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Plugin ini akan dihapus setelah server restart.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Plugin ini tidak berfungsi dan mungkin tidak berfungsi dengan benar.';

  @override
  String get adminPluginDetailNotSupported =>
      'Plugin ini tidak didukung oleh versi server saat ini.';

  @override
  String get adminPluginDetailSuperseded =>
      'Plugin ini telah digantikan oleh versi yang lebih baru.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Hapus Repositori';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Menghapus';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Tidak ada repositori yang dikonfigurasi';

  @override
  String get adminReposEmptySubtitle =>
      'Tambahkan repositori untuk menelusuri plugin yang tersedia';

  @override
  String get adminReposUnnamed => '(tidak disebutkan namanya)';

  @override
  String get adminReposEditTitle => 'Sunting Repositori';

  @override
  String get adminReposAddTitle => 'Tambahkan Repositori';

  @override
  String get adminReposUrl => 'URL repositori';

  @override
  String get adminReposNameHint => 'misalnya Jellyfin Stabil';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL tidak valid';

  @override
  String get adminGeneralSettingsTitle => 'Pengaturan Umum';

  @override
  String get adminGeneralMetadataLanguage => 'Bahasa metadata pilihan';

  @override
  String get adminGeneralMetadataLanguageHint => 'misalnya id, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Negara metadata pilihan';

  @override
  String get adminGeneralMetadataCountryHint => 'misalnya AS, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Konkurensi pemindaian perpustakaan';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Batas pengkodean gambar paralel';

  @override
  String get adminUnknownError => 'Kesalahan tidak diketahui';

  @override
  String get adminBrowse => 'Jelajahi';

  @override
  String get adminCloseBrowser => 'Tutup peramban';

  @override
  String get adminNetworkingTitle => 'Jaringan';

  @override
  String get adminNetworkingRestartWarning =>
      'Perubahan pada pengaturan jaringan mungkin memerlukan restart server.';

  @override
  String get adminNetworkingRemoteAccess => 'Aktifkan akses jarak jauh';

  @override
  String get adminNetworkingPorts => 'Pelabuhan';

  @override
  String get adminNetworkingHttpPort => 'Pelabuhan HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Pelabuhan HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Aktifkan HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Jaringan Lokal';

  @override
  String get adminNetworkingLocalAddresses => 'Alamat jaringan lokal';

  @override
  String get adminNetworkingAddressHint => 'misalnya 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proksi yang diketahui';

  @override
  String get adminNetworkingProxyHint => 'misalnya 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Daftar putih';

  @override
  String get adminNetworkingBlacklist => 'Daftar Hitam';

  @override
  String get adminNetworkingAddEntry => 'Tambahkan entri';

  @override
  String get adminBrandingTitle => 'merek';

  @override
  String get adminBrandingLoginDisclaimer => 'Penafian masuk';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML ditampilkan di bawah formulir login';

  @override
  String get adminBrandingCustomCss => 'CSS khusus';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS khusus diterapkan ke antarmuka web';

  @override
  String get adminBrandingEnableSplash => 'Aktifkan layar pembuka';

  @override
  String get adminPlaybackHwAccel => 'Akselerasi Perangkat Keras';

  @override
  String get adminPlaybackHwAccelLabel => 'Akselerasi perangkat keras';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Aktifkan pengkodean perangkat keras';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Aktifkan decoding perangkat keras untuk:';

  @override
  String get adminPlaybackEncoding => 'Pengkodean';

  @override
  String get adminPlaybackEncodingThreads => 'Pengkodean utas';

  @override
  String get adminPlaybackFallbackFont => 'Aktifkan font cadangan';

  @override
  String get adminPlaybackFallbackFontPath => 'Jalur font cadangan';

  @override
  String get adminPlaybackStreaming => 'Mengalir';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Buku audio';

  @override
  String get adminResumeMinAudiobookPct =>
      'Persentase resume buku audio minimum';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Persentase resume buku audio maksimum';

  @override
  String get adminStreamingBitrateLimit =>
      'Batas bitrate klien jarak jauh (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Biarkan kosong atau 0 untuk tidak terbatas';

  @override
  String get adminTrickplayHwAccel => 'Aktifkan akselerasi perangkat keras';

  @override
  String get adminTrickplayHwEncoding => 'Aktifkan pengkodean perangkat keras';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Aktifkan ekstraksi bingkai kunci saja';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Lebih cepat tetapi akurasinya lebih rendah';

  @override
  String get adminTrickplayNonBlocking => 'Non-Pemblokiran';

  @override
  String get adminTrickplayBlocking => 'Pemblokiran';

  @override
  String get adminTrickplayPriorityHigh => 'Tinggi';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Di atas Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Di bawah Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Menganggur';

  @override
  String get adminTrickplayImageSettings => 'Pengaturan Gambar';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Seberapa sering mengambil frame';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Lebar piksel yang dipisahkan koma (misalnya 320)';

  @override
  String get adminTrickplayQuality => 'Kualitas';

  @override
  String get adminTrickplayQScale => 'Skala kualitas';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Nilai lebih rendah = kualitas lebih baik, file lebih besar';

  @override
  String get adminTrickplayJpegQuality => 'kualitas JPEG';

  @override
  String get adminTrickplayProcessing => 'Pengolahan';

  @override
  String get adminTasksEmpty => 'Tidak ada tugas terjadwal yang ditemukan';

  @override
  String get adminTasksNoFilterMatch =>
      'Tidak ada tugas yang cocok dengan filter saat ini';

  @override
  String get adminTaskCancelling => 'Membatalkan...';

  @override
  String get adminTaskRunning => 'Berlari...';

  @override
  String get adminTaskNeverRun => 'Jangan pernah lari';

  @override
  String get adminTaskStop => 'Berhenti';

  @override
  String get adminTaskRun => 'Berlari';

  @override
  String get adminTaskDetailLastExecution => 'Eksekusi Terakhir';

  @override
  String get adminTaskDetailStarted => 'Dimulai';

  @override
  String get adminTaskDetailEnded => 'Berakhir';

  @override
  String get adminTaskDetailDuration => 'Lamanya';

  @override
  String get adminTaskDetailErrorLabel => 'Kesalahan:';

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
  String get adminTaskTriggerStartup => 'Saat memulai aplikasi';

  @override
  String get adminTaskTriggerTypeDaily => 'Sehari-hari';

  @override
  String get adminTaskTriggerTypeWeekly => 'Mingguan';

  @override
  String get adminTaskTriggerTypeInterval => 'Pada suatu interval';

  @override
  String get adminTaskTriggerIntervalLabel => 'Selang';

  @override
  String get adminTaskTriggerEveryHour => 'Setiap jam';

  @override
  String get adminTaskTriggerEvery6Hours => 'Setiap 6 jam';

  @override
  String get adminTaskTriggerEvery12Hours => 'Setiap 12 jam';

  @override
  String get adminTaskTriggerEvery24Hours => 'Setiap 24 jam';

  @override
  String get adminTaskTriggerEvery2Days => 'Setiap 2 hari';

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
  String get adminTaskTriggerTime => 'Waktu';

  @override
  String get adminTaskTriggerNoLimit => 'Tidak ada batasan';

  @override
  String get adminActivityJustNow => 'Baru saja';

  @override
  String get adminActivityLastHour => 'Jam terakhir';

  @override
  String get adminActivityToday => 'Hari ini';

  @override
  String get adminActivityYesterday => 'Kemarin';

  @override
  String get adminActivityOlder => 'Lebih tua';

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
  String get adminActivityNow => 'Sekarang';

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
      'Konfigurasikan pembuatan gambar trickplay untuk mencari thumbnail pratinjau.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Port HTTPS publik';

  @override
  String get adminNetworkingBaseUrl => 'URL dasar';

  @override
  String get adminNetworkingBaseUrlHint => 'misalnya /jelifin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Jalur sertifikat';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filter IP Jarak Jauh';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filter IP jarak jauh';

  @override
  String get adminPlaybackVaapiDevice => 'Perangkat VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = otomatis';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkode jalur sementara';

  @override
  String get adminPlaybackSegmentDeletion => 'Izinkan penghapusan segmen';

  @override
  String get adminPlaybackSegmentKeep => 'Penyimpanan segmen (detik)';

  @override
  String get adminPlaybackThrottleBuffering => 'Penyangga throttle';

  @override
  String get adminResumeMinPct => 'Persentase resume minimum';

  @override
  String get adminResumeMinPctSubtitle =>
      'Konten harus diputar melewati persentase ini untuk menyimpan kemajuan';

  @override
  String get adminResumeMaxPct => 'Persentase resume maksimum';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Konten dianggap diputar sepenuhnya setelah persentase ini';

  @override
  String get adminResumeMinDuration => 'Durasi melanjutkan minimum (detik)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Item yang lebih pendek dari ini tidak dapat dilanjutkan';

  @override
  String get adminTrickplayScanBehavior => 'Perilaku pemindaian';

  @override
  String get adminTrickplayProcessPriority => 'Prioritas proses';

  @override
  String get adminTrickplayTileWidth => 'Lebar ubin';

  @override
  String get adminTrickplayTileHeight => 'Tinggi ubin';

  @override
  String get adminTrickplayProcessThreads => 'Proses benang';

  @override
  String get adminTrickplayWidthResolutions => 'Resolusi lebar';

  @override
  String get adminMetadataDefault => 'Bawaan';

  @override
  String get adminMetadataContentTypeUpdated => 'Jenis konten diperbarui';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Ambang respons lambat (ms)';

  @override
  String get adminGeneralCachePath => 'Jalur cache';

  @override
  String get adminGeneralMetadataPath => 'Jalur metadata';

  @override
  String get adminGeneralServerName => 'Nama server';

  @override
  String get adminSettingsLoadFailed => 'Gagal memuat pengaturan';

  @override
  String get adminDiscover => 'Menemukan';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Folder';

  @override
  String get libraries => 'Perpustakaan';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay dinonaktifkan';

  @override
  String get syncPlayDisabledMessage =>
      'Aktifkan SyncPlay di Pengaturan untuk menggunakan pemutaran tersinkronisasi.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server tidak didukung';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay memerlukan server Jellyfin. Server saat ini tidak mendukungnya.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Grup';

  @override
  String get syncPlayGroupTooltip => 'grup SyncPlay';

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
  String get syncPlayIgnoreWait => 'Abaikan tunggu';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Jangan tahan grup saat perangkat ini melakukan buffering';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Lanjutkan secara lokal tanpa menunggu anggota lambat';

  @override
  String get syncPlayRepeat => 'Mengulang';

  @override
  String get syncPlayRepeatOne => 'Satu';

  @override
  String get syncPlayShuffleModeShuffled => 'Diacak';

  @override
  String get syncPlayShuffleModeSorted => 'Diurutkan';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sinkronkan antrean pemutaran saat ini';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Ganti antrian grup dengan apa yang diputar secara lokal';

  @override
  String get syncPlayLeaveGroup => 'Keluar dari grup';

  @override
  String get syncPlayGroupQueue => 'Antrian grup';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Mainkan sekarang';

  @override
  String get syncPlayCreateNewGroup => 'Buat grup baru';

  @override
  String get syncPlayGroupName => 'Nama grup';

  @override
  String get syncPlayDefaultGroupName => 'Grup SyncPlay saya';

  @override
  String get syncPlayCreateGroup => 'Buat grup';

  @override
  String get syncPlayAvailableGroups => 'Grup yang tersedia';

  @override
  String get syncPlayNoGroupsAvailable => 'Tidak ada grup yang tersedia';

  @override
  String get syncPlayJoinGroupQuestion => 'Bergabunglah dengan grup SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Bergabung dengan grup SyncPlay dapat menggantikan antrean pemutaran Anda saat ini. Melanjutkan?';

  @override
  String get syncPlayJoin => 'Bergabung';

  @override
  String get syncPlayStateIdle => 'Menganggur';

  @override
  String get syncPlayStateWaiting => 'Menunggu';

  @override
  String get syncPlayStatePaused => 'Dijeda';

  @override
  String get syncPlayStatePlaying => 'Bermain';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay akses ditolak';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Anda tidak memiliki akses ke satu atau lebih item di grup SyncPlay ini. Minta pemilik grup untuk memverifikasi izin perpustakaan atau pilih antrean lain.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Pencarian suara tidak tersedia.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Pemutaran Langsung Gagal';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Pemutaran langsung gagal dimulai untuk streaming Dolby Vision ini. Coba lagi menggunakan transkode server?';

  @override
  String get retryWithTranscode => 'Coba lagi dengan transkode';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Tidak Didukung';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Perangkat ini tidak dapat memecahkan kode konten Dolby Vision secara langsung. Gunakan HDR10 cadangan atau minta transcoding server.';

  @override
  String get rememberMyChoice => 'Ingat pilihanku';

  @override
  String get playHdr10Fallback => 'Mainkan HDR10 mundur';

  @override
  String get requestTranscode => 'Minta transkode';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Deteksi baris yang diekspos oleh plugin \"Bagian Layar Beranda\" IAmParadox27. Baris dapat diaktifkan dan disusun ulang di bawah.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Belum ada server Jellyfin yang melaporkan plugin tersebut.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Deteksi baris yang dikonfigurasi melalui plugin \"KefinTweaks\" ranaldsgift. Bagian khusus, yang baru dirilis, tonton lagi, musiman, dan baru ditambahkan di perpustakaan dicerminkan dari konfigurasi KefinTweaks di setiap server Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Belum ada server Jellyfin yang melaporkan KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Buka Bagian Rumah';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Mengaktifkan, menonaktifkan, dan menyusun ulang baris';

  @override
  String get integrationInstalledButDisabled => 'Dipasang tetapi dinonaktifkan';

  @override
  String get integrationNotInstalled => 'Tidak dipasang';

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
  String get seeAll => 'Lihat Semua';

  @override
  String get noItems => 'Tidak ada item';

  @override
  String get switchUser => 'Ganti Pengguna';

  @override
  String get remoteControl => 'Kendali Jarak Jauh';

  @override
  String get mediaBarLoading => 'Memuat bilah media...';

  @override
  String get mediaBarError => 'Bilah media gagal dimuat';

  @override
  String get offlineServerUnavailable =>
      'Terhubung ke internet, tetapi server saat ini tidak tersedia.';

  @override
  String get offlineNoInternet =>
      'Anda sedang luring. Hanya konten yang diunduh yang tersedia.';

  @override
  String get offlineFileNotAvailable => 'Berkas tidak tersedia';

  @override
  String get offlineSwitchServer => 'Beralih Server';

  @override
  String get offlineSavedMedia => 'Media Tersimpan';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Pemutaran Jarak Jauh';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Volume Perangkat';

  @override
  String get castVolumeUnavailable => 'Tidak tersedia';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtitle';

  @override
  String get pinConfirmTitle => 'Konfirmasi PIN';

  @override
  String get pinSetTitle => 'Setel PIN';

  @override
  String get pinEnterTitle => 'Masukkan PIN';

  @override
  String get pinReenterToConfirm =>
      'Masukkan kembali PIN Anda untuk mengonfirmasi';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN salah';

  @override
  String get pinMismatch => 'PIN tidak cocok';

  @override
  String get pinForgot => 'Lupa PINnya?';

  @override
  String get pinClear => 'Jernih';

  @override
  String get pinBackspace => 'Ruang belakang';

  @override
  String get quickConnectAuthorized => 'Permintaan Koneksi Cepat diotorisasi.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kode Quick Connect tidak valid atau kedaluwarsa.';

  @override
  String get quickConnectNotSupported =>
      'Koneksi Cepat tidak didukung di server ini.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Gagal mengotorisasi kode Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Koneksi Cepat dinonaktifkan di server ini.';

  @override
  String get quickConnectForbidden =>
      'Akun Anda tidak dapat mengotorisasi permintaan Quick Connect ini.';

  @override
  String get quickConnectNotFound =>
      'Kode Koneksi Cepat tidak ditemukan. Coba kode baru.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Masukkan kode';

  @override
  String get quickConnectAuthorize => 'Mengizinkan';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Kendali Jarak Jauh';

  @override
  String get remoteFailedToLoadSessions => 'Gagal memuat sesi';

  @override
  String get remoteNoSessions => 'Tidak ada sesi yang dapat dikontrol';

  @override
  String get remoteStartPlayback => 'Mulai pemutaran di perangkat lain';

  @override
  String get unknownUser => 'Tidak dikenal';

  @override
  String get unknownItem => 'Tidak dikenal';

  @override
  String get remoteNothingPlaying => 'Tidak ada yang diputar pada sesi ini';

  @override
  String get castingStarted => 'Transmisi dimulai pada perangkat yang dipilih';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Tidak ada perangkat pemutaran jarak jauh yang tersedia.';

  @override
  String get noRemoteDevicesIos =>
      'Tidak ada perangkat pemutaran jarak jauh yang tersedia.\n\nDi iOS, target AirPlay mungkin tidak tersedia di simulator.';

  @override
  String get trackActionPlayNext => 'Mainkan Berikutnya';

  @override
  String get trackActionAddToQueue => 'Tambahkan ke Antrean';

  @override
  String get trackActionAddToPlaylist => 'Tambahkan ke Daftar Putar';

  @override
  String get trackActionCancelDownload => 'Batalkan Unduhan';

  @override
  String get trackActionDeleteFromPlaylist => 'Hapus dari Daftar Putar';

  @override
  String get trackActionMoveUp => 'Pindah ke Atas';

  @override
  String get trackActionMoveDown => 'Pindah ke Bawah';

  @override
  String get trackActionRemoveFromFavorites => 'Hapus dari Favorit';

  @override
  String get trackActionAddToFavorites => 'Tambahkan ke Favorit';

  @override
  String get trackActionGoToAlbum => 'Buka Album';

  @override
  String get trackActionGoToArtist => 'Pergi ke Artis';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'File unduhan dihapus';

  @override
  String get trackActionDeleteFileFailed =>
      'Tidak dapat menghapus file yang diunduh';

  @override
  String get shuffleBy => 'Acak Oleh';

  @override
  String get shuffleSelectLibrary => 'Pilih Perpustakaan';

  @override
  String get shuffleSelectGenre => 'Pilih Genre';

  @override
  String get shuffleLibrary => 'Perpustakaan';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries =>
      'Tidak ada perpustakaan yang kompatibel tersedia.';

  @override
  String get shuffleNoGenres =>
      'Tidak ada genre yang ditemukan untuk mode acak ini.';

  @override
  String get posterDisplayTitle => 'Menampilkan';

  @override
  String get posterImageType => 'Jenis Gambar';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'gambar kecil';

  @override
  String get imageTypeBanner => 'Spanduk';

  @override
  String get playlistAddFailed => 'Gagal menambahkan ke daftar putar';

  @override
  String get playlistCreateFailed => 'Gagal membuat daftar putar';

  @override
  String get playlistNew => 'Daftar Putar Baru';

  @override
  String get playlistCreate => 'Membuat';

  @override
  String get playlistCreateNew => 'Buat Daftar Putar Baru';

  @override
  String get playlistNoneFound => 'Tidak ada daftar putar yang ditemukan';

  @override
  String get addToPlaylist => 'Tambahkan ke Daftar Putar';

  @override
  String get lyricsNotAvailable => 'Lirik tidak tersedia';

  @override
  String get upNext => 'Selanjutnya';

  @override
  String get playNext => 'Mainkan Berikutnya';

  @override
  String get stillWatchingContent =>
      'Pemutaran telah dijeda. Apakah kamu masih menonton?';

  @override
  String get stillWatchingStop => 'Berhenti';

  @override
  String get stillWatchingContinue => 'Melanjutkan';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'siaran langsung';

  @override
  String get continueWatchingAndNextUp => 'Lanjutkan Menonton & Selanjutnya';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Episode Berikutnya';

  @override
  String get moreFromThisSeason => 'Lebih Banyak Dari Musim Ini';

  @override
  String get playerTooltipPlaybackSpeed => 'Kecepatan pemutaran';

  @override
  String get playerTooltipCastControls => 'Kontrol transmisi';

  @override
  String get playerTooltipPlaybackQuality => 'Kecepatan bit';

  @override
  String get playerTooltipEnterFullscreen => 'Masuk ke layar penuh';

  @override
  String get playerTooltipExitFullscreen => 'Keluar dari layar penuh';

  @override
  String get playerTooltipFloatOnTop => 'Mengambang di atas';

  @override
  String get playerTooltipExitFloatOnTop => 'Nonaktifkan float di atas';

  @override
  String get playerTooltipLockLandscape => 'Kunci lanskap';

  @override
  String get playerTooltipUnlockOrientation => 'Izinkan rotasi';

  @override
  String get playerTooltipPrevious => 'Sebelumnya';

  @override
  String get playerTooltipSeekBack => 'Carilah kembali';

  @override
  String get playerTooltipSeekForward => 'Carilah ke depan';

  @override
  String get contextMenuMarkWatched => 'Tandai sebagai Ditonton';

  @override
  String get contextMenuMarkUnwatched => 'Tandai sebagai Belum Ditonton';

  @override
  String get contextMenuAddToFavorites => 'Tambahkan ke Favorit';

  @override
  String get contextMenuRemoveFromFavorites => 'Hapus dari Favorit';

  @override
  String get contextMenuGoToSeries => 'Pergi ke Seri';

  @override
  String get settingsAdministrationSubtitle =>
      'Akses panel administrasi server';

  @override
  String get settingsAccountSecurity => 'Akun & Keamanan';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Otentikasi, kode PIN, dan kontrol orang tua';

  @override
  String get settingsPersonalization => 'Personalisasi';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigasi, baris beranda, dan visibilitas perpustakaan';

  @override
  String get settingsDynamicContent => 'Konten Dinamis';

  @override
  String get settingsDynamicContentSubtitle =>
      'Bilah Media dan hamparan visual';

  @override
  String get settingsPlaybackSyncplay => 'Pemutaran & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Pengaturan audio/video, subtitle, unduhan, dan kontrol SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sinkronisasi plugin, Seerr, peringkat, dan banyak lagi';

  @override
  String get settingsAboutSubtitle => 'Urutkan Server Berdasarkan';

  @override
  String get settingsAuthenticationSection => 'Terakhir Digunakan';

  @override
  String get settingsSortServersBy => 'Urutkan Server Berdasarkan';

  @override
  String get settingsLastUsed => 'Terakhir Digunakan';

  @override
  String get settingsAlphabetical => 'Alfabetis';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVASI & KESELAMATAN';

  @override
  String get settingsBlockedRatings => 'Peringkat yang Diblokir';

  @override
  String get settingsGeneralStyle => 'Gaya Umum';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Aksen tema, latar belakang, indikator yang ditonton, dan musik tema';

  @override
  String get settingsHomePage => 'Halaman Beranda';

  @override
  String get settingsHomePageSubtitle =>
      'Bagian, jenis gambar, overlay, dan pratinjau media';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilitas perpustakaan, tampilan folder, dan perilaku multi-server';

  @override
  String get settingsTwentyFourHourClock => 'Jam 24 Jam';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Gunakan format waktu 24 jam di mana pun jam ditampilkan';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Tampilkan tombol acak di bilah navigasi';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Tampilkan tombol genre di bilah navigasi';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Tampilkan tombol favorit di bilah navigasi';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Tampilkan tombol perpustakaan di bilah navigasi';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Alihkan visibilitas halaman beranda per perpustakaan. Mulai ulang Moonfin agar perubahan diterapkan.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Bilah Media & Pratinjau Lokal';

  @override
  String get settingsVisualOverlays => 'Hamparan Visual';

  @override
  String get settingsSeasonalSurprise => 'Kejutan Musiman';

  @override
  String get settingsMetadataAndRatings => 'Metadata & Peringkat';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase mendukung integrasi sisi server termasuk sumber peringkat tambahan, permintaan Seerr, dan preferensi yang disinkronkan.';

  @override
  String get settingsOfflineDownloads => 'Unduhan Offline';

  @override
  String get settingsHigh => 'Tinggi';

  @override
  String get settingsLow => 'Rendah';

  @override
  String get settingsCustomPath => 'Jalur Kustom';

  @override
  String get settingsEnterDownloadFolderPath => 'Masukkan jalur folder unduhan';

  @override
  String get settingsConcurrentDownloads => 'Unduhan Bersamaan';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Jumlah maksimum item yang akan diunduh sekaligus.';

  @override
  String get settingsAppInfo => 'INFO APLIKASI';

  @override
  String get settingsReportAnIssue => 'Laporkan Masalah';

  @override
  String get settingsReportAnIssueSubtitle => 'Buka pelacak masalah di GitHub';

  @override
  String get settingsJoinDiscord => 'Bergabunglah dengan Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Ngobrol dengan komunitas';

  @override
  String get settingsJoinTheDiscord => 'Bergabunglah dengan Discord';

  @override
  String get settingsSupportMoonfin => 'Mendukung Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'LEGAL';

  @override
  String get settingsLicenses => 'Lisensi';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Pemberitahuan lisensi sumber terbuka';

  @override
  String get settingsPrivacyPolicy => 'Kebijakan Privasi';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Bagaimana Moonfin menangani data Anda';

  @override
  String get settingsCheckForUpdates => 'Periksa Pembaruan';

  @override
  String get settingsCheckForUpdatesSubtitle => 'Periksa rilis Moonfin terbaru';

  @override
  String get settingsPoweredByFlutter => 'Didukung oleh Flutter';

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
  String get settingsBoth => 'Keduanya';

  @override
  String get settingsShuffleContentTypeFilter => 'Filter Jenis Konten Acak';

  @override
  String get settingsVideoPlaybackPreferences => 'Preferensi Pemutaran Video';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Mesin video inti dan pengaturan kualitas streaming';

  @override
  String get settingsAudioPreferences => 'Preferensi Audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Trek audio, pemrosesan, dan opsi passthrough';

  @override
  String get settingsAutomationAndQueue => 'Otomatisasi & Antrian';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Pemutaran dan pengurutan otomatis';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kualitas unduhan, batas penyimpanan, dan ukuran antrean';

  @override
  String get settingsSyncplaySubtitle => 'Logika sinkronisasi untuk sesi grup';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Fitur pemain khusus. Gunakan dengan hati-hati, karena beberapa opsi dapat menyebabkan masalah pemutaran';

  @override
  String get settingsSkipIntrosAndOutros => 'Lewati Intro dan Outro?';

  @override
  String get settingsPromptUser => 'Pengguna yang Cepat';

  @override
  String get settingsSkip => 'Melewati';

  @override
  String get settingsDoNothing => 'Jangan lakukan apa pun';

  @override
  String get settingsMaxBitrateDescription =>
      'Batasi bitrate streaming. Konten di atas ambang batas ini akan ditranskode agar sesuai.';

  @override
  String get settingsMaxResolutionDescription =>
      'Batasi resolusi maksimum yang akan diminta pemain. Konten dengan resolusi lebih tinggi akan ditranskode ke bawah.';

  @override
  String get settingsPlayerZoomDescription =>
      'Bagaimana video harus diskalakan agar sesuai dengan layar.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Mesin Pemutaran (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Pilih mesin pemutaran default di perangkat Android TV. Perubahan berlaku untuk sesi pemutaran berikutnya.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (disarankan)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (warisan)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Penggantian';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Perilaku untuk judul Dolby Vision pada perangkat tanpa decoding Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Tanyakan setiap saat';

  @override
  String get settingsPreferHdr10Fallback => 'Lebih suka penggantian HDR10';

  @override
  String get settingsPreferServerTranscode => 'Lebih suka transkode server';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Putar Langsung';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Mengontrol apakah aliran lapisan penyempurnaan Dolby Vision profil 7 harus diputar secara langsung.';

  @override
  String get settingsAutoAftkrtEnabled => 'Otomatis (AFTKRT diaktifkan)';

  @override
  String get settingsEnabledOnThisDevice => 'Diaktifkan di perangkat ini';

  @override
  String get settingsDisabledPreferTranscode =>
      'Dinonaktifkan (lebih memilih transcode)';

  @override
  String get settingsResumeRewindDescription =>
      'Saat melanjutkan pemutaran (dari Lanjutkan Menonton atau halaman item media), berapa detik yang harus diputar ulang?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Saat melanjutkan pemutaran setelah menekan tombol jeda, berapa detik yang harus diputar ulang?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Berapa detik untuk melompat mundur setelah menekan tombol mundur.';

  @override
  String get settingsOneSecond => '1 detik';

  @override
  String get settingsThreeSeconds => '3 detik';

  @override
  String get settingsFortyFiveSeconds => '45 detik';

  @override
  String get settingsSixtySeconds => '60 detik';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Berapa detik untuk melompat ke depan setelah menekan tombol maju cepat.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 ke dekoder eksternal';

  @override
  String get settingsCinemaMode => 'Mode Bioskop';

  @override
  String get settingsCinemaModeSubtitle =>
      'Putar cuplikan/pra-putar sebelum fitur utama';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended menampilkan kartu lengkap dengan karya seni episode dan deskripsi. Minimal menunjukkan hamparan hitung mundur yang ringkas. Disabled menyembunyikan prompt sepenuhnya.';

  @override
  String get settingsShort => 'Pendek';

  @override
  String get settingsLong => 'Panjang';

  @override
  String get settingsVeryLong => 'Sangat lama';

  @override
  String get settingsVideoStartDelay => 'Penundaan Mulai Video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV Langsung Langsung';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktifkan pemutaran langsung untuk TV Langsung';

  @override
  String get settingsOpenGroups => 'Buka Grup';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Membuat, bergabung, atau mengelola grup SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Diaktifkan';

  @override
  String get settingsSyncplayEnabledSubtitle => 'Aktifkan fitur menonton grup';

  @override
  String get settingsSyncplayButton => 'Tombol SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Tampilkan tombol SyncPlay di bilah navigasi';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Koreksi Lanjutan';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktifkan logika sinkronisasi yang terperinci';

  @override
  String get settingsSyncplaySyncCorrection => 'Koreksi Sinkronisasi';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Sesuaikan pemutaran secara otomatis agar tetap sinkron';

  @override
  String get settingsSyncplaySpeedToSync => 'Kecepatan untuk Menyinkronkan';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Gunakan penyesuaian kecepatan pemutaran untuk menyinkronkan';

  @override
  String get settingsSyncplaySkipToSync => 'Lewati ke Sinkronisasi';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Gunakan upaya untuk menyinkronkan';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Penundaan Kecepatan Minimum';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Penundaan Kecepatan Maksimum';

  @override
  String get settingsSyncplaySpeedDuration => 'Durasi Kecepatan';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Penundaan Lewati Minimum';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Perimbangan Ekstra';

  @override
  String get onNow => 'Aktif Sekarang';

  @override
  String get collections => 'Koleksi';

  @override
  String get lastPlayed => 'Terakhir Dimainkan';

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
