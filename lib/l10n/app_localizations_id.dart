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
  String get accountPreferences => 'PREFERENSI AKUN';

  @override
  String get interfaceLanguage => 'Bahasa Antarmuka';

  @override
  String get systemLanguageDefault => 'Default Sistem';

  @override
  String get signIn => 'Masuk';

  @override
  String get empty => 'Kosong';

  @override
  String connectingToServer(String serverName) {
    return 'Menghubungkan ke $serverName';
  }

  @override
  String get quickConnect => 'Koneksi Cepat';

  @override
  String get password => 'Kata Sandi';

  @override
  String get username => 'Nama Pengguna';

  @override
  String get email => 'Email';

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
    return 'QuickConnect tidak tersedia: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect tidak tersedia ($status): $detail';
  }

  @override
  String get whosWatching => 'Siapa yang menonton?';

  @override
  String get addUser => 'Tambah Pengguna';

  @override
  String get selectServer => 'Pilih Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versi $version';
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
  String get addServer => 'Tambah Server';

  @override
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => 'Hapus Server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Hapus \"$serverName\" dari daftar server Anda?';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get remove => 'Hapus';

  @override
  String get connectToServer => 'Hubungkan ke Server';

  @override
  String get serverAddress => 'Alamat Server';

  @override
  String get serverAddressHint =>
      '[https://your-server.example.com](https://your-server.example.com)';

  @override
  String get connect => 'Hubungkan';

  @override
  String get secureStorageUnavailable => 'Penyimpanan Aman Tidak Tersedia';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin tidak dapat mengakses keyring sistem Anda. Login tetap dapat dilanjutkan, tetapi penyimpanan token aman mungkin tidak tersedia sampai keyring dibuka.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema Aplikasi';

  @override
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Moonfin is the classic layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Moonfin';

  @override
  String get detailScreenStyleModern => 'Modern';

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
  String get settingsAppearanceThemeSubtitle =>
      'Beralih antara Moonfin dan Neon Pulse tanpa memulai ulang aplikasi';

  @override
  String get keyboardPreferSystemIme => 'Utamakan keyboard sistem';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Gunakan metode input perangkat Anda secara default untuk entri teks';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Tampilan Moonfin saat ini yang sudah Anda sukai';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Gaya synthwave dengan cahaya magenta, teks sian, dan kontras chrome yang lebih kuat';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Gaya liquid-glass dengan latar gradien mengalun, permukaan frosted, dan aksen biru Apple';

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
      'Tidak ada server yang terhubung ke akun Emby Connect ini';

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
      'Terjadi kesalahan jaringan saat menghubungi Emby Connect atau server yang dipilih';

  @override
  String get loadingLinkedServers => 'Memuat server yang terhubung...';

  @override
  String get connectingToServerEllipsis => 'Menghubungkan ke server...';

  @override
  String get noReachableAddress => 'Tidak ada alamat yang dapat dijangkau';

  @override
  String get invalidServerExchangeResponse =>
      'Respons tidak valid dari endpoint pertukaran server';

  @override
  String unableToConnectTo(String target) {
    return 'Tidak dapat terhubung ke $target';
  }

  @override
  String get exitApp => 'Keluar dari Moonfin?';

  @override
  String get exitAppConfirmation => 'Apakah Anda yakin ingin keluar?';

  @override
  String get exit => 'Keluar';

  @override
  String get noHomeRowsLoaded => 'Tidak ada baris beranda yang dapat dimuat';

  @override
  String get noHomeRowsHint =>
      'Coba segarkan atau kurangi bagian beranda yang aktif.';

  @override
  String get retryHomeRows => 'Coba Lagi Muat Baris Beranda';

  @override
  String get guide => 'Panduan';

  @override
  String get recordings => 'Rekaman';

  @override
  String get schedule => 'Jadwal';

  @override
  String get series => 'Serial';

  @override
  String get noItemsFound => 'Tidak ada item yang ditemukan';

  @override
  String get home => 'Beranda';

  @override
  String get browseAll => 'Lihat Semua';

  @override
  String get genres => 'Genre';

  @override
  String get collectionPlaceholder => 'Item koleksi akan muncul di sini';

  @override
  String get browseByLetter => 'Telusuri berdasarkan Huruf';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Daftar alfabetis akan muncul di sini';

  @override
  String get suggestions => 'Saran';

  @override
  String get suggestionsPlaceholder =>
      'Item yang disarankan akan muncul di sini';

  @override
  String get failedToLoadLibraries => 'Gagal memuat pustaka';

  @override
  String get noLibrariesFound => 'Tidak ada pustaka yang ditemukan';

  @override
  String get library => 'Pustaka';

  @override
  String get displaySettings => 'Pengaturan Tampilan';

  @override
  String get allGenres => 'Semua Genre';

  @override
  String get noGenresFound => 'Tidak ada genre yang ditemukan';

  @override
  String failedToLoadFolderError(String error) {
    return 'Gagal memuat folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Folder ini kosong';

  @override
  String itemCountLabel(int count) {
    return '$count item';
  }

  @override
  String get failedToLoadFavorites => 'Gagal memuat favorit';

  @override
  String get retry => 'Coba Lagi';

  @override
  String get noFavoritesYet => 'Belum ada favorit';

  @override
  String get favorites => 'Favorit';

  @override
  String totalCountItems(int count) {
    return '$count Item';
  }

  @override
  String get continuing => 'Sedang Berlangsung';

  @override
  String get ended => 'Berakhir';

  @override
  String get sortAndFilter => 'Urutkan & Filter';

  @override
  String get type => 'Tipe';

  @override
  String get sortBy => 'Urutkan Berdasarkan';

  @override
  String get display => 'Tampilan';

  @override
  String get imageType => 'Tipe Gambar';

  @override
  String get posterSize => 'Ukuran Poster';

  @override
  String get small => 'Kecil';

  @override
  String get medium => 'Sedang';

  @override
  String get large => 'Besar';

  @override
  String get extraLarge => 'Sangat Besar';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genre';
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
  String get bookmarks => 'Penanda';

  @override
  String get noSavedBookmarks =>
      'Belum ada penanda yang disimpan untuk judul ini.';

  @override
  String get openBook => 'Buka Buku';

  @override
  String get chapter => 'Bab';

  @override
  String get page => 'Halaman';

  @override
  String get bookmark => 'Penanda';

  @override
  String get justNow => 'Baru saja';

  @override
  String minutesAgo(int count) {
    return '${count}m lalu';
  }

  @override
  String hoursAgo(int count) {
    return '${count}j lalu';
  }

  @override
  String daysAgo(int count) {
    return '${count}h lalu';
  }

  @override
  String get discoverySubjects => 'Subjek Discovery';

  @override
  String get pickDiscoverySubjects =>
      'Pilih feed subjek yang ingin ditampilkan di Discover.';

  @override
  String get apply => 'Terapkan';

  @override
  String get openLink => 'Buka Tautan';

  @override
  String get scanWithYourPhone => 'Pindai dengan ponsel Anda';

  @override
  String get audiobookGenres => 'Genre Audiobook';

  @override
  String get pickAudiobookGenres =>
      'Pilih genre yang ingin ditampilkan di Discover Audiobook.';

  @override
  String get discoverAudiobooks => 'Temukan Audiobook';

  @override
  String get librivoxDescription =>
      'Judul domain publik populer dari LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count judul';
  }

  @override
  String get scrollLeft => 'Gulir ke kiri';

  @override
  String get scrollRight => 'Gulir ke kanan';

  @override
  String get couldNotLoadGenre => 'Genre ini tidak dapat dimuat saat ini.';

  @override
  String get continueReading => 'Lanjut Membaca';

  @override
  String get savedHighlights => 'Sorotan Tersimpan';

  @override
  String get continueListening => 'Lanjut Mendengarkan';

  @override
  String get listen => 'Dengarkan';

  @override
  String get resume => 'Lanjutkan';

  @override
  String get failedToLoadLibrary => 'Gagal memuat pustaka';

  @override
  String get popularNow => 'Sedang Populer';

  @override
  String get savedForLater => 'Disimpan untuk Nanti';

  @override
  String get topListens => 'Paling Banyak Didengarkan';

  @override
  String get unreadDiscoveries => 'Temuan Belum Dibaca';

  @override
  String get pickUpAgain => 'Lanjutkan Lagi';

  @override
  String get bookHighlightsDescription =>
      'Buku Anda dengan sorotan, favorit, atau progres membaca.';

  @override
  String get handPickedFromLibrary => 'Dipilih khusus dari pustaka Anda.';

  @override
  String get handPickedFromListeningQueue =>
      'Dipilih khusus dari antrean dengar Anda.';

  @override
  String get booksWithHighlights =>
      'Buku dengan sorotan, favorit, atau progres membaca.';

  @override
  String get jumpBackNarration =>
      'Kembali ke narasi tanpa harus mencari posisi Anda.';

  @override
  String get unreadBooksReady =>
      'Buku yang belum dibaca dan siap untuk jam tenang berikutnya.';

  @override
  String get quickAccessFavorites =>
      'Akses cepat ke buku yang terus Anda kunjungi kembali.';

  @override
  String get searchAudiobooks => 'Cari audiobook';

  @override
  String get searchYourLibrary => 'Cari di pustaka Anda';

  @override
  String get pickUpStory =>
      'Lanjutkan cerita dari tempat terakhir Anda berhenti';

  @override
  String get savedPlacesChapters =>
      'Tempat tersimpan dan bab yang belum selesai';

  @override
  String authorsCount(int count) {
    return '$count penulis';
  }

  @override
  String genresCount(int count) {
    return '$count genre';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% selesai';
  }

  @override
  String get readyWhenYouAre => 'Siap saat Anda siap';

  @override
  String get details => 'Detail';

  @override
  String get listeningRoom => 'Ruang Dengarkan';

  @override
  String get bookmarksAndProgress => 'Penanda & Progres';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count judul disusun untuk penelusuran yang mengutamakan membaca.';
  }

  @override
  String get titles => 'Judul';

  @override
  String get allTitles => 'Semua Judul';

  @override
  String get authors => 'Penulis';

  @override
  String get browseByAuthor => 'Telusuri berdasarkan Penulis';

  @override
  String get browseByGenre => 'Telusuri berdasarkan Genre';

  @override
  String get discover => 'Discover';

  @override
  String get trendingTitlesOpenLibrary =>
      'Judul yang sedang tren berdasarkan subjek dari Open Library.';

  @override
  String get noBookmarkedItems => 'Belum ada item yang ditandai';

  @override
  String get nothingMatchesSection =>
      'Belum ada yang cocok dengan bagian ini. Coba tab lain atau kembali setelah sinkronisasi pustaka selesai.';

  @override
  String get audiobooks => 'Audiobook';

  @override
  String noLabelFound(String label) {
    return 'Tidak ada $label yang ditemukan';
  }

  @override
  String get folder => 'Folder';

  @override
  String get filters => 'Filter';

  @override
  String get readingStatus => 'Status Baca';

  @override
  String get playedStatus => 'Status Putar';

  @override
  String get readStatus => 'Sudah Dibaca';

  @override
  String get watched => 'Sudah Ditonton';

  @override
  String get unread => 'Belum Dibaca';

  @override
  String get unwatched => 'Belum Ditonton';

  @override
  String get seriesStatus => 'Status Seri';

  @override
  String get allLibraries => 'Semua Pustaka';

  @override
  String get books => 'Buku';

  @override
  String get author => 'Penulis';

  @override
  String get unknownAuthor => 'Penulis Tidak Diketahui';

  @override
  String get uncategorized => 'Tanpa Kategori';

  @override
  String get overview => 'Ikhtisar';

  @override
  String get noLibrivoxDescription =>
      'Belum ada deskripsi yang disediakan oleh LibriVox untuk judul ini.';

  @override
  String get readers => 'Pembaca';

  @override
  String get openLinks => 'Buka Tautan';

  @override
  String get librivoxPage => 'Halaman LibriVox';

  @override
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Unduh Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count bagian';
  }

  @override
  String firstPublished(int year) {
    return 'Pertama kali diterbitkan $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Belum ada ikhtisar yang tersedia dari Open Library untuk judul ini.';

  @override
  String get subjects => 'Subjek';

  @override
  String get all => 'Semua';

  @override
  String booksCount(int count) {
    return '$count buku';
  }

  @override
  String get couldNotLoadSubject => 'Subjek ini tidak dapat dimuat saat ini.';

  @override
  String get audiobookDetails => 'Detail Audiobook';

  @override
  String authorsCountTitle(int count) {
    return '$count Penulis';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiobook',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Daftar Trek';

  @override
  String get itemListPlaceholder => 'Daftar item akan muncul di sini';

  @override
  String get favoriteTracksPlaceholder => 'Trek favorit akan muncul di sini';

  @override
  String get failedToLoad => 'Gagal memuat';

  @override
  String get delete => 'Hapus';

  @override
  String get save => 'Simpan';

  @override
  String get moreLikeThis => 'Lainnya Seperti Ini';

  @override
  String get castAndCrew => 'Pemeran & Kru';

  @override
  String get collection => 'Koleksi';

  @override
  String get episodes => 'Episode';

  @override
  String get nextUp => 'Berikutnya';

  @override
  String get seasons => 'Musim';

  @override
  String get chapters => 'Bab';

  @override
  String get features => 'Fitur';

  @override
  String get movies => 'Film';

  @override
  String get musicVideos => 'Video Musik';

  @override
  String get other => 'Lainnya';

  @override
  String get discography => 'Diskografi';

  @override
  String get similarArtists => 'Artis Serupa';

  @override
  String get tableOfContents => 'Daftar Isi';

  @override
  String get tracklist => 'Daftar Trek';

  @override
  String discNumber(int number) {
    return 'Disk $number';
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
      'Belum ada biografi yang tersedia untuk penulis ini.';

  @override
  String get noBooksFound => 'Tidak ada buku yang ditemukan untuk penulis ini.';

  @override
  String get unableToLoadAuthorDetails =>
      'Detail penulis tidak dapat dimuat saat ini.';

  @override
  String published(int year) {
    return 'Diterbitkan $year';
  }

  @override
  String get publicationDateUnknown => 'Tanggal terbit tidak diketahui';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Musim',
      one: '1 Musim',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Berakhir pada $time';
  }

  @override
  String get items => 'Items';

  @override
  String get extras => 'Extras';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return 'Berakhir dalam $time';
  }

  @override
  String get view => 'Lihat';

  @override
  String get resumeReading => 'Lanjutkan Membaca';

  @override
  String get read => 'Baca';

  @override
  String resumeFrom(String position) {
    return 'Lanjutkan dari $position';
  }

  @override
  String get play => 'Putar';

  @override
  String get startOver => 'Mulai Ulang';

  @override
  String get restart => 'Mulai Lagi';

  @override
  String get readOffline => 'Baca Offline';

  @override
  String get playOffline => 'Putar Offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtitle';

  @override
  String get version => 'Versi';

  @override
  String get cast => 'Pemeran';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Selesai';

  @override
  String get favorited => 'Difavoritkan';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Playlist';

  @override
  String get downloaded => 'Terunduh';

  @override
  String get downloadAll => 'Unduh Semua';

  @override
  String get download => 'Unduh';

  @override
  String get deleteDownloaded => 'Hapus Hasil Unduhan';

  @override
  String get goToSeries => 'Buka ke Seri';

  @override
  String get editMetadata => 'Edit Metadata';

  @override
  String get less => 'Lebih Sedikit';

  @override
  String get more => 'Lebih Banyak';

  @override
  String get deleteItem => 'Hapus Item';

  @override
  String get deletePlaylist => 'Hapus Playlist';

  @override
  String get deletePlaylistMessage => 'Hapus playlist ini dari server?';

  @override
  String get deleteItemMessage => 'Hapus item ini dari server?';

  @override
  String get failedToDeletePlaylist => 'Gagal menghapus playlist';

  @override
  String get failedToDeleteItem => 'Gagal menghapus item';

  @override
  String get renamePlaylist => 'Ubah Nama Playlist';

  @override
  String get playlistName => 'Nama playlist';

  @override
  String get deleteDownloadedAlbum => 'Hapus Album yang Diunduh';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Hapus trek yang diunduh untuk \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Trek yang diunduh telah dihapus';

  @override
  String get downloadedTracksDeleteFailed =>
      'Beberapa trek yang diunduh tidak dapat dihapus';

  @override
  String get noTracksLoaded => 'Tidak ada trek yang dimuat';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Tidak ada $itemLabel yang dimuat';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Mengunduh $title ($count item)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Apakah Anda yakin ingin menghapus \"$name\" dari server? Tindakan ini tidak dapat dibatalkan.';
  }

  @override
  String get itemDeleted => 'Item dihapus';

  @override
  String get noPlayableTrailerFound =>
      'Trailer yang dapat diputar tidak ditemukan.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Format buku tidak didukung: .$extension';
  }

  @override
  String get audioTrack => 'Trek Audio';

  @override
  String get subtitleTrack => 'Trek Subtitle';

  @override
  String get none => 'Tidak Ada';

  @override
  String get downloadSubtitlesLabel => 'Unduh subtitle...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Cari menggunakan plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Unduh Subtitle';

  @override
  String get selectedSubtitleInvalid => 'Subtitle yang dipilih tidak valid.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle berhasil diunduh dan dipilih: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtitle berhasil diunduh. Mungkin perlu beberapa saat sampai muncul saat Jellyfin menyegarkan item ini.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Tidak ada subtitle jarak jauh yang ditemukan untuk $language.';
  }

  @override
  String get selectVersion => 'Pilih Versi';

  @override
  String versionNumber(int number) {
    return 'Versi $number';
  }

  @override
  String get downloadAllQuality => 'Unduh Semua — Kualitas';

  @override
  String get downloadQuality => 'Kualitas Unduhan';

  @override
  String get originalFileNoReencoding => 'File asli, tanpa re-encoding';

  @override
  String get originalFilesNoReencoding => 'File asli, tanpa re-encoding';

  @override
  String get noEpisodesLoaded => 'Tidak ada episode yang dimuat';

  @override
  String downloadingItem(String name, String quality) {
    return 'Mengunduh $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Hapus File yang Diunduh';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Hapus file lokal untuk $typeLabel?\n\nIni akan mengosongkan ruang penyimpanan. Anda dapat mengunduhnya lagi nanti.';
  }

  @override
  String get downloadedFilesDeleted => 'File yang diunduh telah dihapus';

  @override
  String get failedToDeleteFiles => 'Gagal menghapus file';

  @override
  String get deleteFiles => 'Hapus File';

  @override
  String get director => 'SUTRADARA';

  @override
  String get directors => 'PARA SUTRADARA';

  @override
  String get writer => 'PENULIS';

  @override
  String get writers => 'PARA PENULIS';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count lagi';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episode';
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
    return 'Bab $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trek',
      one: '1 trek',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bab',
      one: '1 bab',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Lahir $date';
  }

  @override
  String died(String date) {
    return 'Meninggal $date';
  }

  @override
  String age(int age) {
    return 'Usia $age';
  }

  @override
  String get showLess => 'Tampilkan Lebih Sedikit';

  @override
  String get readMore => 'Baca Selengkapnya';

  @override
  String get shuffle => 'Acak';

  @override
  String downloadsCount(int count) {
    return '$count unduhan';
  }

  @override
  String get perfectMatch => 'Cocok sempurna';

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
    return 'Tindakan $action subtitle jarak jauh memerlukan izin pengelolaan subtitle Jellyfin untuk pengguna ini.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Item ini tidak dapat ditemukan di server untuk tindakan $action subtitle jarak jauh.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Tindakan $action subtitle jarak jauh gagal: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Tindakan $action subtitle jarak jauh gagal (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Gagal melakukan $action subtitle jarak jauh.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'semua episode yang diunduh untuk \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'semua episode yang diunduh di musim ini';

  @override
  String get stillWatching => 'Masih Menonton?';

  @override
  String get unableToLoadTrailerStream => 'Tidak dapat memuat stream trailer.';

  @override
  String get trailerTimedOut => 'Waktu tunggu habis saat memuat trailer.';

  @override
  String get playbackFailedForTrailer => 'Pemutaran trailer ini gagal.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Casting tidak tersedia selama pemutaran offline.';

  @override
  String castActionFailed(String label, String error) {
    return 'Tindakan $label gagal: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Gagal mengatur volume cast: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Kontrol $label';
  }

  @override
  String get deviceVolume => 'Volume Perangkat';

  @override
  String get unavailable => 'Tidak Tersedia';

  @override
  String get pause => 'Jeda';

  @override
  String get syncPosition => 'Sinkronkan Posisi';

  @override
  String stopCast(String label) {
    return 'Hentikan $label';
  }

  @override
  String get queueIsEmpty => 'Antrean kosong';

  @override
  String trackNumber(int number) {
    return 'Trek $number';
  }

  @override
  String get remotePlayback => 'Pemutaran Jarak Jauh';

  @override
  String get castingToGoogleCast => 'Casting ke Google Cast';

  @override
  String get castingViaAirPlay => 'Casting melalui AirPlay';

  @override
  String get castingViaDlna => 'Casting melalui DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds detik';
  }

  @override
  String get longPressToUnlock => 'Tekan lama untuk membuka kunci';

  @override
  String get off => 'Nonaktif';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Otomatis';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Penggantian Bitrate';

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
  String get subtitleDelay => 'Penundaan Subtitle';

  @override
  String get reset => 'Reset';

  @override
  String get unknown => 'Tidak Diketahui';

  @override
  String get playbackInformation => 'Informasi Pemutaran';

  @override
  String get playback => 'Pemutaran';

  @override
  String get playMethod => 'Metode Putar';

  @override
  String get directPlay => 'Direct Play';

  @override
  String get directStream => 'Direct Stream';

  @override
  String get transcoding => 'Transcoding';

  @override
  String get transcodeReasons => 'Alasan Transcode';

  @override
  String get player => 'Player';

  @override
  String get container => 'Kontainer';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Resolusi';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Bitrate Video';

  @override
  String get track => 'Trek';

  @override
  String get channels => 'Kanal';

  @override
  String get audioBitrate => 'Bitrate Audio';

  @override
  String get sampleRate => 'Sample Rate';

  @override
  String get format => 'Format';

  @override
  String get external => 'Eksternal';

  @override
  String get embedded => 'Tersemat';

  @override
  String castSessionError(String protocol) {
    return 'Kesalahan sesi $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Gagal memuat detail buku: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Rendering EPUB di dalam aplikasi belum tersedia di platform ini.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Format ini (.$extension) belum dapat dirender di dalam aplikasi.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Rendering dokumen tersemat tidak tersedia di platform ini.';

  @override
  String get couldNotOpenExternalViewer =>
      'Tidak dapat membuka penampil eksternal.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Gagal membuka pembaca di dalam aplikasi: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Penanda sudah disimpan di $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Penanda ditambahkan: $label';
  }

  @override
  String get noBookmarksYet =>
      'Belum ada penanda.\nKetuk ikon penanda saat membaca untuk menyimpan posisi Anda.';

  @override
  String get noTableOfContentsAvailable => 'Tidak ada daftar isi yang tersedia';

  @override
  String pageLabel(int number) {
    return 'Halaman $number';
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
    return '$percent% telah dibaca';
  }

  @override
  String get updating => 'Memperbarui...';

  @override
  String get markUnread => 'Tandai Belum Dibaca';

  @override
  String get markAsRead => 'Tandai sebagai Sudah Dibaca';

  @override
  String get reloadReader => 'Muat Ulang Pembaca';

  @override
  String get noPagesFound => 'Tidak ada halaman yang ditemukan.';

  @override
  String get failedToDecodePageImage => 'Gagal mendekode gambar halaman.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Halaman Tunggal';

  @override
  String get twoPageSpread => 'Tampilan Dua Halaman';

  @override
  String get addBookmark => 'Tambah Penanda';

  @override
  String get bookmarksEllipsis => 'Penanda...';

  @override
  String get markedAsRead => 'Ditandai sebagai sudah dibaca';

  @override
  String get markedAsUnread => 'Ditandai sebagai belum dibaca';

  @override
  String failedToUpdateReadState(String error) {
    return 'Gagal memperbarui status baca: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistem';

  @override
  String get themeLight => 'Tema: Terang';

  @override
  String get themeDark => 'Tema: Gelap';

  @override
  String get themeSepia => 'Tema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Balikkan Warna (layout tetap)';

  @override
  String get invertColorsPdf => 'Balikkan Warna (PDF)';

  @override
  String get preparingInAppReader => 'Menyiapkan pembaca di dalam aplikasi...';

  @override
  String get pdfDataNotAvailable => 'Data PDF tidak tersedia.';

  @override
  String get readerFallbackModeActive => 'Mode fallback pembaca aktif';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Platform ini tidak dapat menjalankan engine dokumen tersemat untuk file $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Gunakan Muat Ulang Pembaca setelah beralih ke target platform yang didukung (Android, iOS, macOS).';

  @override
  String get openExternally => 'Buka Secara Eksternal';

  @override
  String get noEpubChaptersFound => 'Tidak ada bab EPUB yang ditemukan.';

  @override
  String get readerNotReady => 'Pembaca belum siap.';

  @override
  String get seriesRecordings => 'Rekaman Serial';

  @override
  String get now => 'Sekarang';

  @override
  String get sports => 'Olahraga';

  @override
  String get news => 'Berita';

  @override
  String get kids => 'Anak-anak';

  @override
  String get premiere => 'Premiere';

  @override
  String get guideTimeline => 'Linimasa Panduan';

  @override
  String failedToLoadGuide(String error) {
    return 'Gagal memuat panduan: $error';
  }

  @override
  String get noChannelsFound => 'Tidak ada saluran yang ditemukan';

  @override
  String get liveBadge => 'LANGSUNG';

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
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Dihapus dari saluran favorit';

  @override
  String get addedToFavoriteChannels => 'Ditambahkan ke saluran favorit';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Gagal memperbarui saluran favorit';

  @override
  String get unfavoriteChannel => 'Batalkan Favorit Saluran';

  @override
  String get favoriteChannel => 'Favoritkan Saluran';

  @override
  String get record => 'Rekam';

  @override
  String get cancelRecordingAction => 'Batalkan Rekaman';

  @override
  String get programSetToRecord => 'Program dijadwalkan untuk direkam';

  @override
  String get recordingCancelled => 'Rekaman dibatalkan';

  @override
  String get unableToCreateRecording => 'Tidak dapat membuat rekaman';

  @override
  String get watch => 'Tonton';

  @override
  String get close => 'Tutup';

  @override
  String failedToPlayChannel(String name) {
    return 'Gagal memutar $name';
  }

  @override
  String get failedToLoadRecordings => 'Gagal memuat rekaman';

  @override
  String get scheduledInNext24Hours => 'Dijadwalkan dalam 24 Jam ke Depan';

  @override
  String get recentRecordings => 'Rekaman Terbaru';

  @override
  String get tvSeries => 'Serial TV';

  @override
  String get failedToLoadSchedule => 'Gagal memuat jadwal';

  @override
  String get noScheduledRecordings => 'Tidak ada rekaman terjadwal';

  @override
  String get cancelRecording => 'Batalkan Rekaman?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Batalkan rekaman terjadwal untuk \"$name\"?';
  }

  @override
  String get no => 'Tidak';

  @override
  String get yesCancel => 'Ya, Batalkan';

  @override
  String get failedToCancelRecording => 'Gagal membatalkan rekaman';

  @override
  String get failedToLoadSeriesRecordings => 'Gagal memuat rekaman serial';

  @override
  String get noSeriesRecordings => 'Tidak ada rekaman serial';

  @override
  String get cancelSeriesRecording => 'Batalkan Rekaman Serial';

  @override
  String get cancelSeriesRecordingQuestion => 'Batalkan Rekaman Serial?';

  @override
  String stopRecordingName(String name) {
    return 'Hentikan rekaman \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Gagal membatalkan rekaman serial';

  @override
  String get searchThisLibrary => 'Cari di pustaka ini...';

  @override
  String get searchEllipsis => 'Cari...';

  @override
  String noResultsForQuery(String query) {
    return 'Tidak ada hasil untuk \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Pencarian gagal: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Tipe Akun Seerr';

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
  String get noMediaInFilter => 'Tidak ada media dalam filter ini';

  @override
  String get noDownloadedMediaYet => 'Belum ada media yang diunduh';

  @override
  String get browseLibrary => 'Telusuri Pustaka';

  @override
  String get deleteDownload => 'Hapus Unduhan';

  @override
  String removeItemAndFiles(String name) {
    return 'Hapus \"$name\" beserta file-filenya?';
  }

  @override
  String tracksCount(int count) {
    return '$count trek';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Putar Album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Gagal memuat album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Tidak ada trek yang diunduh untuk $name.';
  }

  @override
  String get season => 'Musim';

  @override
  String get errorLoadingEpisodes => 'Kesalahan saat memuat episode';

  @override
  String get noDownloadedEpisodes => 'Tidak ada episode yang diunduh';

  @override
  String get deleteEpisode => 'Hapus Episode';

  @override
  String removeName(String name) {
    return 'Hapus \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes menit';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'M$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Episode $number';
  }

  @override
  String get seriesNotFound => 'Serial tidak ditemukan';

  @override
  String get errorLoadingSeries => 'Kesalahan saat memuat serial';

  @override
  String get downloadedEpisodes => 'Episode yang Diunduh';

  @override
  String seasonNumber(int number) {
    return 'Musim $number';
  }

  @override
  String seasonChip(int number) {
    return 'M$number';
  }

  @override
  String get specials => 'Spesial';

  @override
  String get deleteSeason => 'Hapus Musim';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Hapus semua episode yang diunduh di $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episode',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Manajemen Penyimpanan';

  @override
  String get storageBreakdown => 'Rincian Penyimpanan';

  @override
  String get downloadedItems => 'Item yang Diunduh';

  @override
  String get storageLimit => 'Batas Penyimpanan';

  @override
  String get noLimit => 'Tanpa batas';

  @override
  String get deleteAllDownloads => 'Hapus Semua Unduhan';

  @override
  String get deleteAllDownloadsWarning =>
      'Ini akan menghapus semua file media yang diunduh dan tidak dapat dibatalkan.';

  @override
  String get deleteAll => 'Hapus Semua';

  @override
  String get deleteSelected => 'Hapus yang Dipilih';

  @override
  String deleteSelectedCount(int count) {
    return 'Hapus $count item yang diunduh?';
  }

  @override
  String get musicAndAudiobooks => 'Musik & Audiobook';

  @override
  String get images => 'Gambar';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'dari batas $limit';
  }

  @override
  String get settings => 'Pengaturan';

  @override
  String get authentication => 'Autentikasi';

  @override
  String get autoLoginServerManagement => 'Login otomatis, manajemen server';

  @override
  String get pinCode => 'Kode PIN';

  @override
  String get setUpPinCodeProtection => 'Atur perlindungan kode PIN';

  @override
  String get parentalControls => 'Kontrol Orang Tua';

  @override
  String get contentRatingRestrictions => 'Pembatasan rating konten';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, resolusi, perilaku';

  @override
  String get languageSizeAppearance => 'Bahasa, ukuran, tampilan';

  @override
  String get qualityStorage => 'Kualitas, penyimpanan';

  @override
  String get serverSyncAndPluginStatus =>
      'Sinkronisasi server dan status plugin';

  @override
  String get mediaRequestIntegration => 'Integrasi permintaan media';

  @override
  String get switchServer => 'Ganti Server';

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
      'Pengaturan server, pengguna, pustaka';

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
    return '$count opsi';
  }

  @override
  String get themeAndAppearance => 'Tema & Tampilan';

  @override
  String get focusBorderColor => 'Warna Border Fokus';

  @override
  String get watchedIndicators => 'Indikator Tontonan';

  @override
  String get always => 'Selalu';

  @override
  String get hideUnwatched => 'Sembunyikan yang Belum Ditonton';

  @override
  String get episodesOnly => 'Hanya Episode';

  @override
  String get never => 'Tidak Pernah';

  @override
  String get focusExpansionAnimation => 'Animasi Ekspansi Fokus';

  @override
  String get desktopUiScale => 'Skala UI';

  @override
  String get scaleFocusedCards =>
      'Perbesar kartu dan ubin yang difokuskan atau diarahkan kursor';

  @override
  String get backgroundBackdrops => 'Backdrop Latar Belakang';

  @override
  String get showBackdropImages =>
      'Tampilkan gambar backdrop di belakang konten';

  @override
  String get seriesThumbnails => 'Tampilkan Thumbnail Serial';

  @override
  String get seriesThumbnailsDescription =>
      'Untuk serial TV, gunakan artwork serial utama alih-alih thumbnail episode.';

  @override
  String get homeRowInfoOverlay => 'Overlay Info Baris Beranda';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Tampilkan judul dan metadata saat menelusuri baris beranda';

  @override
  String get clockDisplay => 'Tampilan Jam';

  @override
  String get inMenus => 'Di Menu';

  @override
  String get inVideo => 'Di Video';

  @override
  String get seasonalEffects => 'Efek Musiman';

  @override
  String get seasonalEffectsDescription => 'Efek visual dan dekorasi musiman';

  @override
  String get snow => 'Salju';

  @override
  String get fireworks => 'Kembang Api';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Daun Berguguran';

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
      'Putar saat menelusuri layar beranda';

  @override
  String get detailsBackgroundBlur => 'Blur Latar Belakang Detail';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Blur Latar Belakang Penelusuran';

  @override
  String get maxStreamingBitrate => 'Bitrate Streaming Maksimum';

  @override
  String get maxResolution => 'Resolusi Maksimum';

  @override
  String get playerZoomMode => 'Mode Zoom Player';

  @override
  String get settingsScrollWheelAction => 'Roda gulir mouse';

  @override
  String get settingsScrollWheelActionDescription =>
      'Pilih fungsi guliran roda mouse di atas video selama pemutaran.';

  @override
  String get scrollWheelActionOff => 'Nonaktif';

  @override
  String get scrollWheelActionSeek => 'Seek (maju / mundur)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Sesuai';

  @override
  String get autoCrop => 'Crop Otomatis';

  @override
  String get stretch => 'Rentangkan';

  @override
  String get refreshRateSwitching => 'Peralihan Refresh Rate';

  @override
  String get disabled => 'Dinonaktifkan';

  @override
  String get scaleOnTv => 'Skalakan di TV';

  @override
  String get scaleOnDevice => 'Skalakan di Perangkat';

  @override
  String get trickPlay => 'Trick Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Tampilkan thumbnail pratinjau saat seek';

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
  String get downmixToStereo => 'Downmix ke Stereo';

  @override
  String get defaultAudioLanguage => 'Bahasa Audio Default';

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
  String get autoServerDefault => 'Otomatis (Default Server)';

  @override
  String get english => 'Inggris';

  @override
  String get spanish => 'Spanyol';

  @override
  String get french => 'Prancis';

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
  String get chinese => 'Tionghoa';

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
  String get ac3Passthrough => 'Passthrough AC3';

  @override
  String get dtsPassthrough => 'Passthrough DTS';

  @override
  String get trueHdSupport => 'Dukungan TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream audio DTS ke AVR saja; memerlukan dukungan receiver dan trek sumber DTS';

  @override
  String get enableTrueHdAudio =>
      'Aktifkan audio TrueHD (mungkin tidak berfungsi di semua platform)';

  @override
  String get settingsAudioOutputMode => 'Mode Output Audio';

  @override
  String get settingsAudioOutputModeDescription =>
      'Pilih cara audio didekode. AVR Passthrough mengirim stream Dolby/DTS mentah ke receiver Anda; Auto atau Downmix mendekode secara lokal.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Codec Fallback Audio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Pilih format target untuk transcode audio multi-kanal saat stream sumber tidak dapat di-direct play atau di-passthrough.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Deteksi Otomatis\n(Disarankan)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Default)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Lossless)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Hanya Stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efisien)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Lossless)';

  @override
  String get settingsMaxAudioChannels => 'Kanal Audio Maksimum';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Konfigurasikan jumlah kanal maksimum pada pengaturan audio Anda. Stream multi-kanal yang melebihi batas ini akan di-downmix atau di-transcode.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Deteksi Otomatis\n(Default Perangkat Keras)';

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
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Lanjutan)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough Codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Aktifkan hanya format yang didukung oleh AVR atau sink HDMI Anda.';

  @override
  String get settingsAudioEac3Passthrough => 'Passthrough EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Passthrough EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passthrough DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passthrough DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passthrough TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Passthrough TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) ke decoder eksternal.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos melalui EAC3 (JOC) ke decoder eksternal.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (termasuk DTS core) ke decoder eksternal.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD dengan metadata Atmos ke decoder eksternal.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Kemampuan Audio yang Terdeteksi';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Belum ada snapshot kemampuan runtime yang tersedia.';

  @override
  String get settingsAudioRouteLabel => 'Rute';

  @override
  String get settingsAudioDecodeLabel => 'Dekode';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Rute audio HD';

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
    return 'PCM ${count}ch';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostik';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Level Video';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Rentang Video';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Codec Subtitle';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Codec Audio yang Diizinkan';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Codec Audio HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Codec Audio HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'passthrough audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Rute Audio Aktif';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Dukungan Audio HD Rute';

  @override
  String get nightMode => 'Mode Malam';

  @override
  String get compressDynamicRange => 'Kompres rentang dinamis';

  @override
  String get advancedMpv => 'mpv lanjutan';

  @override
  String get enableCustomMpvConf => 'Aktifkan mpv.conf Kustom';

  @override
  String get applyMpvConfBeforePlayback =>
      'Terapkan mpv.conf yang ditentukan pengguna sebelum pemutaran dimulai';

  @override
  String get unsafeAdvancedMpvOptions => 'Opsi mpv Lanjutan yang Tidak Aman';

  @override
  String get unsafeMpvOptionsDescription =>
      'Izinkan kumpulan opsi mpv yang lebih luas. Dapat merusak perilaku pemutaran.';

  @override
  String get hardwareDecoding => 'Dekode perangkat keras';

  @override
  String get hardwareDecodingSubtitle =>
      'Dapat meningkatkan performa tetapi bisa menyebabkan masalah pemutaran pada beberapa perangkat.';

  @override
  String get nextUpAndQueuing => 'Berikutnya & Antrean';

  @override
  String get nextUpDisplay => 'Tampilan Berikutnya';

  @override
  String get extended => 'Diperluas';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Batas Waktu Berikutnya';

  @override
  String secondsValue(int value) {
    return '${value}d';
  }

  @override
  String get mediaQueuing => 'Antrean Media';

  @override
  String get autoQueueNextEpisodes =>
      'Masukkan episode berikutnya ke antrean secara otomatis';

  @override
  String get stillWatchingPrompt => 'Prompt Masih Menonton';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Setelah $episodes episode / ${hours}j';
  }

  @override
  String get resumeAndSkip => 'Lanjutkan & Lewati';

  @override
  String get resumeRewind => 'Mundur saat Melanjutkan';

  @override
  String get unpauseRewind => 'Mundur saat Lepas Jeda';

  @override
  String get fiveSeconds => '5 detik';

  @override
  String get tenSeconds => '10 detik';

  @override
  String get fifteenSeconds => '15 detik';

  @override
  String get thirtySeconds => '30 detik';

  @override
  String get skipBackLength => 'Durasi Lewat Mundur';

  @override
  String get skipForwardLength => 'Durasi Lewat Maju';

  @override
  String get customMpvConfPath => 'Path mpv.conf Kustom';

  @override
  String get notSetMpvConf =>
      'Belum diatur. Moonfin akan mencoba mpv.conf default di folder app/data.';

  @override
  String get selectMpvConf => 'Pilih mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Pengaturan gaya (ukuran, warna, offset) berlaku untuk subtitle berbasis teks (SRT, VTT, TTML). Subtitle ASS/SSA menggunakan gaya tersematnya sendiri kecuali \"ASS/SSA Direct Play\" dinonaktifkan. Subtitle bitmap (PGS, DVB, VobSub) tidak dapat diubah gayanya.';

  @override
  String get defaultSubtitleLanguage => 'Bahasa Subtitle Default';

  @override
  String get defaultToNoSubtitles => 'Default tanpa Subtitle';

  @override
  String get turnOffSubtitlesByDefault => 'Nonaktifkan subtitle secara default';

  @override
  String get subtitleSize => 'Ukuran Subtitle';

  @override
  String get textFillColor => 'Warna Isi Teks';

  @override
  String get backgroundColor => 'Warna Latar Belakang';

  @override
  String get textStrokeColor => 'Warna Stroke Teks';

  @override
  String get subtitleCustomization => 'Kustomisasi Subtitle';

  @override
  String get subtitleCustomizationDescription => 'Sesuaikan tampilan subtitle';

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
      'The quick brown fox jumps over the lazy dog';

  @override
  String get verticalOffset => 'Offset Vertikal';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'Direct play subtitle PGS';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles => 'Direct play subtitle ASS/SSA';

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
  String get semiTransparentBlack => 'Hitam semi-transparan';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Seluler';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Pengaturan profil $profile berhasil dimuat.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Gagal memuat pengaturan profil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Pengaturan lokal berhasil disinkronkan ke profil $profile.';
  }

  @override
  String get customizationProfile => 'Profil Kustomisasi';

  @override
  String get customizationProfileDescription =>
      'Pilih profil untuk dimuat, diedit, dan disinkronkan. Global berlaku di semua tempat kecuali ditimpa oleh profil perangkat. Titik hijau menandai profil perangkat Anda saat ini.';

  @override
  String get loadProfile => 'Muat Profil';

  @override
  String get syncing => 'Menyinkronkan...';

  @override
  String get syncToProfile => 'Sinkronkan Profil';

  @override
  String get profileSyncHidden => 'Sinkronisasi Profil Disembunyikan';

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
  String get wifiOnlyDownloads => 'Unduhan Hanya WiFi';

  @override
  String get onlyDownloadOnWifi => 'Unduh hanya saat terhubung ke WiFi';

  @override
  String get storage => 'Penyimpanan';

  @override
  String get storageUsed => 'Penyimpanan Terpakai';

  @override
  String get manage => 'Kelola';

  @override
  String get calculating => 'Menghitung...';

  @override
  String get downloadLocation => 'Lokasi Unduhan';

  @override
  String get defaultLabel => 'Default';

  @override
  String get saveToDownloadsFolder => 'Simpan ke folder Unduhan';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — terlihat oleh aplikasi lain';

  @override
  String get dangerZone => 'Zona Berbahaya';

  @override
  String get clearAllDownloads => 'Hapus Semua Unduhan';

  @override
  String get original => 'Asli';

  @override
  String get changeDownloadLocation => 'Ubah Lokasi Unduhan';

  @override
  String get changeDownloadLocationDescription =>
      'Unduhan baru akan disimpan ke folder yang dipilih. Unduhan yang sudah ada akan tetap berada di lokasi saat ini dan dapat dikelola dari pengaturan Penyimpanan.';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get cannotWriteToFolder =>
      'Tidak dapat menulis ke folder yang dipilih. Silakan pilih lokasi lain atau berikan izin penyimpanan.';

  @override
  String get saveToDownloadsFolderQuestion => 'Simpan ke folder Unduhan?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Media yang diunduh akan disimpan ke Downloads/Moonfin di perangkat Anda. File-file ini akan terlihat oleh aplikasi lain seperti galeri atau pemutar musik Anda.\n\nUnduhan yang sudah ada akan tetap berada di lokasi saat ini.';

  @override
  String get enable => 'Aktifkan';

  @override
  String get clearAllDownloadsWarning =>
      'Ini akan menghapus semua media yang diunduh dan tidak dapat dibatalkan.';

  @override
  String get clearAll => 'Hapus Semua';

  @override
  String get navigationStyle => 'Gaya Navigasi';

  @override
  String get topBar => 'Bar Atas';

  @override
  String get leftSidebar => 'Sidebar Kiri';

  @override
  String get showShuffleButton => 'Tampilkan Tombol Acak';

  @override
  String get showGenresButton => 'Tampilkan Tombol Genre';

  @override
  String get showFavoritesButton => 'Tampilkan Tombol Favorit';

  @override
  String get showLibrariesInToolbar => 'Tampilkan Pustaka di Toolbar';

  @override
  String get showSeerrButton => 'Tampilkan Tombol Seerr';

  @override
  String get navbarOpacity => 'Opasitas Navbar';

  @override
  String get navbarColor => 'Warna Navbar';

  @override
  String get gray => 'Abu-abu';

  @override
  String get darkBlue => 'Biru Tua';

  @override
  String get purple => 'Ungu';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'Navy';

  @override
  String get charcoal => 'Arang';

  @override
  String get brown => 'Cokelat';

  @override
  String get darkRed => 'Merah Tua';

  @override
  String get darkGreen => 'Hijau Tua';

  @override
  String get slate => 'Slate';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Tampilan Pustaka';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Thumbnail';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings => 'Timpa Pengaturan per Pustaka';

  @override
  String get applyImageTypeToAllLibraries =>
      'Terapkan tipe gambar ke semua pustaka';

  @override
  String get multiServerLibraries => 'Pustaka Multi-Server';

  @override
  String get showLibrariesFromAllServers =>
      'Tampilkan pustaka dari semua server yang terhubung';

  @override
  String get enableFolderView => 'Aktifkan Tampilan Folder';

  @override
  String get showFolderBrowsingOption => 'Tampilkan opsi penelusuran folder';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'Visibilitas Pustaka';

  @override
  String get libraryVisibilityDescription =>
      'Atur visibilitas halaman beranda untuk tiap pustaka. Mulai ulang Moonfin agar perubahan berlaku.';

  @override
  String get showInNavigation => 'Tampilkan di navigasi';

  @override
  String get showInLatestMedia => 'Tampilkan di media terbaru';

  @override
  String get sourceLibraries => 'Pustaka Sumber';

  @override
  String get sourceCollections => 'Koleksi Sumber';

  @override
  String get excludedGenres => 'Genre yang Dikecualikan';

  @override
  String get selectAll => 'Pilih Semua';

  @override
  String itemsSelected(int count) {
    return '$count dipilih';
  }

  @override
  String get mediaBar => 'Bar Media';

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
      'Konfigurasikan pratinjau trailer, media, dan audio.';

  @override
  String get mediaBarMode => 'Gaya Bar Media';

  @override
  String get mediaBarModeDescription =>
      'Pilih di antara berbagai gaya bar media, atau nonaktifkan bar media';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Nonaktif';

  @override
  String get enableMediaBar => 'Aktifkan Bar Media';

  @override
  String get showFeaturedContentSlideshow =>
      'Tampilkan slideshow konten unggulan di beranda';

  @override
  String get contentType => 'Tipe Konten';

  @override
  String get moviesAndTvShows => 'Film & Acara TV';

  @override
  String get moviesOnly => 'Hanya Film';

  @override
  String get tvShowsOnly => 'Hanya Acara TV';

  @override
  String get itemCount => 'Jumlah Item';

  @override
  String get noneSelected => 'Tidak ada yang dipilih';

  @override
  String get noneExcluded => 'Tidak ada yang dikecualikan';

  @override
  String get autoAdvance => 'Maju Otomatis';

  @override
  String get autoAdvanceSlides => 'Maju otomatis ke slide berikutnya';

  @override
  String get autoAdvanceInterval => 'Interval Maju Otomatis';

  @override
  String get trailerPreview => 'Pratinjau Trailer';

  @override
  String get autoPlayTrailers =>
      'Putar trailer secara otomatis di bar media setelah 3 detik';

  @override
  String get episodePreview => 'Pratinjau Episode';

  @override
  String get mediaPreview => 'Pratinjau Media';

  @override
  String get episodePreviewDescription =>
      'Putar pratinjau inline 30 detik pada kartu yang difokuskan, diarahkan kursor, atau ditekan lama';

  @override
  String get mediaPreviewDescription =>
      'Putar pratinjau inline 30 detik pada kartu yang difokuskan, diarahkan kursor, atau ditekan lama';

  @override
  String get previewAudio => 'Pratinjau Audio';

  @override
  String get enablePreviewAudio =>
      'Aktifkan audio untuk pratinjau trailer dan episode';

  @override
  String get latestMedia => 'Media Terbaru';

  @override
  String get recentlyReleased => 'Baru Dirilis';

  @override
  String get myMedia => 'Media Saya';

  @override
  String get myMediaSmall => 'Media Saya (Kecil)';

  @override
  String get continueWatching => 'Lanjut Menonton';

  @override
  String get resumeAudio => 'Lanjutkan Audio';

  @override
  String get resumeBooks => 'Lanjutkan Buku';

  @override
  String get activeRecordings => 'Rekaman Aktif';

  @override
  String get playlists => 'Playlist';

  @override
  String get liveTV => 'TV Langsung';

  @override
  String get homeSections => 'Bagian Beranda';

  @override
  String get resetToDefaults => 'Reset ke default';

  @override
  String get homeRowPosterSize => 'Ukuran Poster Baris Beranda';

  @override
  String get perRowImageTypeSelection => 'Pemilihan Tipe Gambar per Baris';

  @override
  String get configureImageTypeForEachRow =>
      'Konfigurasikan tipe gambar untuk setiap baris beranda yang diaktifkan';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Gabungkan Lanjut Menonton dan Berikutnya';

  @override
  String get combineBothRows =>
      'Gabungkan kedua baris menjadi satu bagian beranda';

  @override
  String get fullScreenRows => 'Baris Beranda Diperluas';

  @override
  String get fullScreenRowsDescription =>
      'Batasi baris beranda ke 1 baris per layar';

  @override
  String get perRowImageType => 'Tipe Gambar per Baris';

  @override
  String get perRowSettings => 'Pengaturan per Baris';

  @override
  String get autoLogin => 'Login Otomatis';

  @override
  String get lastUser => 'Pengguna Terakhir';

  @override
  String get currentUser => 'Pengguna Saat Ini';

  @override
  String get alwaysAuthenticate => 'Selalu Autentikasi';

  @override
  String get requirePasswordWithToken =>
      'Wajibkan kata sandi meskipun token tersimpan';

  @override
  String get confirmExit => 'Konfirmasi Keluar';

  @override
  String get showConfirmationBeforeExiting =>
      'Tampilkan konfirmasi sebelum keluar';

  @override
  String get blockContentWithRatings => 'Blokir konten dengan rating berikut:';

  @override
  String get noContentRatingsFound =>
      'Belum ada rating konten yang ditemukan di server ini.';

  @override
  String get couldNotLoadServerRatings =>
      'Tidak dapat memuat rating server. Hanya menampilkan rating yang tersimpan.';

  @override
  String get couldNotRefreshRatings =>
      'Tidak dapat menyegarkan rating dari server. Menampilkan rating yang tersimpan.';

  @override
  String get enablePinCode => 'Aktifkan Kode PIN';

  @override
  String get requirePinToAccess => 'Wajibkan PIN untuk mengakses akun Anda';

  @override
  String get changePin => 'Ubah PIN';

  @override
  String get setNewPinCode => 'Tetapkan kode PIN baru';

  @override
  String get removePin => 'Hapus PIN';

  @override
  String get removePinProtection => 'Hapus perlindungan kode PIN';

  @override
  String get screensaver => 'Screen saver';

  @override
  String get inAppScreensaver => 'Screen saver Dalam Aplikasi';

  @override
  String get enableBuiltInScreensaver => 'Aktifkan screen saver bawaan';

  @override
  String get mode => 'Mode';

  @override
  String get libraryArt => 'Art Pustaka';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Jam';

  @override
  String get timeout => 'Batas Waktu';

  @override
  String minutesShort(int minutes) {
    return '$minutes menit';
  }

  @override
  String get dimmingLevel => 'Tingkat Peredupan';

  @override
  String get maxAgeRating => 'Rating Usia Maksimum';

  @override
  String get any => 'Apa pun';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Wajibkan Rating Usia';

  @override
  String get onlyShowRatedContent =>
      'Tampilkan hanya konten yang memiliki rating';

  @override
  String get showClock => 'Tampilkan Jam';

  @override
  String get displayClockDuringScreensaver =>
      'Tampilkan jam selama screen saver';

  @override
  String get clockModeStatic => 'Statis';

  @override
  String get clockModeBouncing => 'Memantul';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Kritikus)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Penonton)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (Pengguna)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Rating Komunitas';

  @override
  String get ratings => 'Rating';

  @override
  String get additionalRatings => 'Rating Tambahan';

  @override
  String get showMdbListAndTmdbRatings => 'Tampilkan rating MDBList dan TMDB';

  @override
  String get ratingLabels => 'Label Rating';

  @override
  String get showLabelsNextToIcons => 'Tampilkan label di samping ikon rating';

  @override
  String get ratingBadges => 'Lencana Rating';

  @override
  String get showDecorativeBadges =>
      'Tampilkan lencana dekoratif di belakang rating';

  @override
  String get episodeRatings => 'Rating Episode';

  @override
  String get showRatingsOnEpisodes =>
      'Tampilkan rating pada episode individual';

  @override
  String get ratingSources => 'Sumber Rating';

  @override
  String get ratingSourcesDescription =>
      'Aktifkan dan atur ulang urutan sumber rating yang ditampilkan di seluruh aplikasi';

  @override
  String get pluginLabel => 'Plugin Moonbase';

  @override
  String get pluginDetected => 'Plugin Terdeteksi';

  @override
  String get pluginNotDetected => 'Plugin Tidak Terdeteksi';

  @override
  String get pluginDetectedDescription =>
      'Plugin server terdeteksi. Sinkronisasi diaktifkan secara otomatis saat plugin pertama kali ditemukan.';

  @override
  String get pluginNotDetectedDescription =>
      'Plugin server saat ini tidak terdeteksi. Pengaturan lokal tetap menggunakan nilai tersimpan atau default bawaan.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersi: $version';
  }

  @override
  String get availableServices => 'Layanan Tersedia';

  @override
  String get serverPluginSync => 'Sinkronisasi Plugin Server';

  @override
  String get syncSettingsWithPlugin =>
      'Sinkronkan pengaturan dengan plugin server';

  @override
  String get whatSyncControls => 'Apa yang dikendalikan sinkronisasi';

  @override
  String get syncControlsDescription =>
      'Sinkronisasi hanya mengendalikan apakah pengaturan berbasis plugin didorong ke dan ditarik dari server. Pemilihan profil dan tindakan sinkronisasi profil ada di pengaturan Kustomisasi saat sinkronisasi plugin diaktifkan.';

  @override
  String get recentRequests => 'Permintaan Terbaru';

  @override
  String get recentlyAdded => 'Baru Ditambahkan';

  @override
  String get trending => 'Sedang Tren';

  @override
  String get popularMovies => 'Film Populer';

  @override
  String get movieGenres => 'Genre Film';

  @override
  String get upcomingMovies => 'Film Mendatang';

  @override
  String get studios => 'Studio';

  @override
  String get popularSeries => 'Serial Populer';

  @override
  String get seriesGenres => 'Genre Serial';

  @override
  String get upcomingSeries => 'Serial Mendatang';

  @override
  String get networks => 'Jaringan';

  @override
  String get seerrDiscoveryRows => 'Baris Discovery Seerr';

  @override
  String get resetRowsToDefaults => 'Reset baris ke default';

  @override
  String get enableSeerr => 'Aktifkan Seerr';

  @override
  String get showSeerrInNavigation =>
      'Tampilkan Seerr di navigasi (memerlukan plugin server)';

  @override
  String get seerrUnavailable =>
      'Tidak tersedia karena dukungan Seerr pada plugin server dinonaktifkan.';

  @override
  String get nsfwFilter => 'Filter NSFW';

  @override
  String get hideAdultContent => 'Sembunyikan konten dewasa dari hasil';

  @override
  String loggedInAs(String username) {
    return 'Masuk sebagai: $username';
  }

  @override
  String get discoverRows => 'Baris Discover';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seret untuk mengatur ulang urutan. Aktifkan atau nonaktifkan baris. Urutan baris yang diaktifkan akan disinkronkan dengan plugin Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Seret untuk mengatur ulang urutan. Aktifkan atau nonaktifkan baris.';

  @override
  String get enabled => 'Diaktifkan';

  @override
  String get hidden => 'Disembunyikan';

  @override
  String get aboutTitle => 'Tentang';

  @override
  String versionValue(String version) {
    return 'Versi $version';
  }

  @override
  String get openSourceLicenses => 'Lisensi Open Source';

  @override
  String get sourceCode => 'Kode Sumber';

  @override
  String get sourceCodeUrl =>
      '[https://github.com/Moonfin-Client/Moonfin-Core](https://github.com/Moonfin-Client/Moonfin-Core)';

  @override
  String get checkForUpdatesNow => 'Periksa Pembaruan Sekarang';

  @override
  String get checksLatestDesktopRelease =>
      'Memeriksa rilis desktop terbaru untuk platform ini';

  @override
  String get youAreUpToDate => 'Anda sudah menggunakan versi terbaru.';

  @override
  String get couldNotCheckForUpdates =>
      'Tidak dapat memeriksa pembaruan saat ini.';

  @override
  String get noCompatibleUpdate =>
      'Tidak ditemukan paket pembaruan yang kompatibel untuk platform ini.';

  @override
  String get updateChecksNotSupported =>
      'Pemeriksaan pembaruan tidak didukung di platform ini.';

  @override
  String get updateNotificationsDisabled =>
      'Notifikasi pembaruan dinonaktifkan.';

  @override
  String get pleaseWaitBeforeChecking => 'Harap tunggu sebelum memeriksa lagi.';

  @override
  String get latestUpdateAlreadyShown => 'Pembaruan terbaru sudah ditampilkan.';

  @override
  String get updateAvailable => 'Pembaruan tersedia.';

  @override
  String updateAvailableVersion(String version) {
    return 'Pembaruan tersedia: v$version';
  }

  @override
  String get updateNotifications => 'Notifikasi Pembaruan';

  @override
  String get showWhenUpdatesAvailable => 'Tampilkan saat pembaruan tersedia';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Tersedia';
  }

  @override
  String get readReleaseNotes => 'Baca Catatan Rilis';

  @override
  String get downloadingUpdate => 'Mengunduh pembaruan...';

  @override
  String get updateDownloadFailed =>
      'Pengunduhan pembaruan gagal. Silakan coba lagi.';

  @override
  String get openReleasesPage => 'Buka Halaman Rilis';

  @override
  String get navigation => 'Navigasi';

  @override
  String get watchedIndicatorsBackdrops => 'Indikator tontonan, backdrop';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Warna fokus, indikator tontonan, backdrop';

  @override
  String get navbarStyleToolbarAppearance =>
      'Gaya navbar, tombol toolbar, tampilan';

  @override
  String get reorderToggleHomeRows =>
      'Atur ulang urutan dan aktif/nonaktifkan baris beranda';

  @override
  String get featuredContentAppearance => 'Konten unggulan, tampilan';

  @override
  String get posterSizeImageTypeFolderView =>
      'Ukuran poster, tipe gambar, tampilan folder';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, dan sumber rating';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Hapus';

  @override
  String get browse => 'Telusuri';

  @override
  String get noResults => 'Tidak ada hasil';

  @override
  String get seerrAvailableStatus => 'Tersedia';

  @override
  String get seerrRequestedStatus => 'Diminta';

  @override
  String itemsCount(int count) {
    return '$count Item';
  }

  @override
  String get seerrSettings => 'Pengaturan Seerr';

  @override
  String get requestMore => 'Minta Lagi';

  @override
  String get request => 'Minta';

  @override
  String get cancelRequest => 'Batalkan Permintaan';

  @override
  String get playInMoonfin => 'Putar di Moonfin';

  @override
  String requestedByName(String name) {
    return 'Diminta oleh $name';
  }

  @override
  String get approve => 'Setujui';

  @override
  String get declineAction => 'Tolak';

  @override
  String get similar => 'Serupa';

  @override
  String get recommendations => 'Rekomendasi';

  @override
  String cancelRequestForTitle(String title) {
    return 'Batalkan permintaan untuk \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Batalkan $count permintaan untuk \"$title\"?';
  }

  @override
  String get keep => 'Simpan';

  @override
  String get itemNotFoundInLibrary =>
      'Item tidak ditemukan di pustaka Moonfin Anda';

  @override
  String get errorSearchingLibrary => 'Kesalahan saat mencari pustaka';

  @override
  String budgetAmount(String amount) {
    return 'Anggaran: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Pendapatan: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Minta $type';
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
  String get server => 'Server';

  @override
  String get qualityProfile => 'Profil Kualitas';

  @override
  String get rootFolder => 'Folder Root';

  @override
  String get showMore => 'Tampilkan Lebih Banyak';

  @override
  String get appearances => 'Penampilan';

  @override
  String get crewSection => 'Kru';

  @override
  String ageValue(int age) {
    return 'usia $age';
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
  String get notRequestedStatus => 'Belum Diminta';

  @override
  String get blocklistedStatus => 'Masuk daftar blokir';

  @override
  String get deletedStatus => 'Dihapus';

  @override
  String get tmdbScore => 'Skor TMDB';

  @override
  String get releaseDateLabel => 'Tanggal Rilis';

  @override
  String get firstAirDateLabel => 'Tanggal Tayang Perdana';

  @override
  String get revenueLabel => 'Pendapatan';

  @override
  String get runtimeLabel => 'Durasi';

  @override
  String get budgetLabel => 'Anggaran';

  @override
  String get originalLanguageLabel => 'Bahasa Asli';

  @override
  String get seasonsLabel => 'Musim';

  @override
  String get episodesLabel => 'Episode';

  @override
  String get access => 'Akses';

  @override
  String get add => 'Tambah';

  @override
  String get address => 'Alamat';

  @override
  String get analytics => 'Analitik';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Konten';

  @override
  String get copy => 'Salin';

  @override
  String get create => 'Buat';

  @override
  String get disable => 'Nonaktifkan';

  @override
  String get done => 'Selesai';

  @override
  String get edit => 'Edit';

  @override
  String get encoding => 'Encoding';

  @override
  String get error => 'Kesalahan';

  @override
  String get forward => 'Maju';

  @override
  String get general => 'Umum';

  @override
  String get go => 'Buka';

  @override
  String get install => 'Instal';

  @override
  String get installed => 'Terinstal';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Nama';

  @override
  String get networking => 'Jaringan';

  @override
  String get next => 'Berikutnya';

  @override
  String get path => 'Path';

  @override
  String get paused => 'Dijeda';

  @override
  String get permissions => 'Izin';

  @override
  String get processing => 'Memproses';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Penyedia';

  @override
  String get refresh => 'Segarkan';

  @override
  String get remote => 'Jarak Jauh';

  @override
  String get rename => 'Ubah Nama';

  @override
  String get revoke => 'Cabut';

  @override
  String get role => 'Peran';

  @override
  String get root => 'Root';

  @override
  String get run => 'Jalankan';

  @override
  String get search => 'Cari';

  @override
  String get select => 'Pilih';

  @override
  String get send => 'Kirim';

  @override
  String get sessions => 'Sesi';

  @override
  String get set => 'Atur';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Hentikan';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Waktu';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Copot Instalasi';

  @override
  String get up => 'Naik';

  @override
  String get update => 'Perbarui';

  @override
  String get upload => 'Unggah';

  @override
  String get unmute => 'Bunyikan';

  @override
  String get mute => 'Bisukan';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Analitik';

  @override
  String get adminDrawerSettings => 'Pengaturan';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Pengguna';

  @override
  String get adminDrawerLibraries => 'Pustaka';

  @override
  String get adminDrawerTranscoding => 'Transcoding';

  @override
  String get adminDrawerResume => 'Lanjutkan';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminDrawerLiveTv => 'TV Langsung';

  @override
  String get adminExitTooltip => 'Keluar Admin';

  @override
  String get adminDashboardLoadFailed => 'Gagal memuat dashboard';

  @override
  String get adminMediaOverview => 'Ikhtisar Media';

  @override
  String get adminMediaTotalsError => 'Tidak dapat memuat total media server.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Gambaran singkat tentang jumlah konten di server ini.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Pembaruan plugin tersedia: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugin yang memerlukan restart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tugas terjadwal gagal: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Entri peringatan/kesalahan terbaru: $count';
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
  String get analyticsContentRatings => 'Rating Konten';

  @override
  String get analyticsRuntimeBuckets => 'Kelompok Durasi';

  @override
  String get analyticsFileFormats => 'Format File';

  @override
  String get analyticsNoData => 'Tidak Ada Data Tersedia.';

  @override
  String get adminServerInfo => 'Info Server';

  @override
  String get adminRestartPending => 'Menunggu Restart';

  @override
  String get adminServerPaths => 'Path Server';

  @override
  String get adminServerActions => 'Tindakan Server';

  @override
  String get adminRestartServer => 'Restart Server';

  @override
  String get adminShutdownServer => 'Matikan Server';

  @override
  String get adminScanLibraries => 'Pindai Pustaka';

  @override
  String get adminLibraryScanStarted => 'Pemindaian pustaka dimulai';

  @override
  String errorGeneric(String error) {
    return 'Kesalahan: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Restart server sedang berlangsung';

  @override
  String get adminServerRebootMessage =>
      'Restart server sedang berlangsung, silakan mulai ulang Moonfin';

  @override
  String get adminActiveSessions => 'Sesi Aktif';

  @override
  String get adminSessionsLoadFailed => 'Gagal memuat sesi';

  @override
  String get adminNoActiveSessions => 'Tidak ada sesi aktif';

  @override
  String get adminRecentActivity => 'Aktivitas Terbaru';

  @override
  String get adminNoRecentActivity => 'Tidak ada aktivitas terbaru';

  @override
  String adminCommandFailed(String error) {
    return 'Perintah gagal: $error';
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
  String get sessionRewind => 'Mundur';

  @override
  String get sessionForward => 'Maju';

  @override
  String get sessionNext => 'Berikutnya';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Sedang Diputar';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Tindakan';

  @override
  String get videoCodec => 'Codec Video';

  @override
  String get audioCodec => 'Codec Audio';

  @override
  String get hwAccel => 'Akselerasi HW';

  @override
  String get completion => 'Penyelesaian';

  @override
  String get direct => 'Langsung';

  @override
  String get adminDisconnect => 'Putuskan';

  @override
  String get adminClearDates => 'Hapus tanggal';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Gagal memuat log aktivitas: $error';
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
    return 'Gagal memperbarui perangkat: $error';
  }

  @override
  String get adminDeleteDevice => 'Hapus Perangkat';

  @override
  String get adminDeviceDeleted => 'Perangkat dihapus';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Gagal menghapus perangkat: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Gagal memuat perangkat';

  @override
  String get adminSearchDevices => 'Cari perangkat';

  @override
  String get adminThisDevice => 'Perangkat Ini';

  @override
  String get adminEditName => 'Edit Nama';

  @override
  String get adminLibrariesLoadFailed => 'Gagal memuat pustaka';

  @override
  String get adminNoLibraries => 'Tidak ada pustaka yang dikonfigurasi';

  @override
  String get adminScanAllLibraries => 'Pindai Semua Pustaka';

  @override
  String get adminAddLibrary => 'Tambah Pustaka';

  @override
  String adminScanFailed(String error) {
    return 'Gagal memulai pemindaian: $error';
  }

  @override
  String get adminRenameLibrary => 'Ubah Nama Pustaka';

  @override
  String get adminNewName => 'Nama baru';

  @override
  String adminLibraryRenamed(String name) {
    return 'Pustaka diubah namanya menjadi \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Gagal mengubah nama: $error';
  }

  @override
  String get adminDeleteLibrary => 'Hapus Pustaka';

  @override
  String adminLibraryDeleted(String name) {
    return 'Pustaka \"$name\" dihapus';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Gagal menghapus pustaka: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Gagal menambahkan path: $error';
  }

  @override
  String get adminRemovePath => 'Hapus Path';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Hapus \"$path\" dari pustaka ini?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Gagal menghapus path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opsi pustaka disimpan';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Gagal menyimpan opsi: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Gagal memuat pustaka';

  @override
  String get adminNoMediaPaths => 'Tidak ada path media yang dikonfigurasi';

  @override
  String get adminAddPath => 'Tambah Path';

  @override
  String get adminBrowseFilesystem => 'Telusuri sistem file server:';

  @override
  String get adminSaveOptions => 'Simpan Opsi';

  @override
  String get adminPreferredMetadataLanguage => 'Bahasa metadata yang dipilih';

  @override
  String get adminMetadataLanguageHint => 'mis. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Kode negara metadata';

  @override
  String get adminMetadataCountryHint => 'mis. US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Nama pustaka wajib diisi';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Gagal membuat pustaka: $error';
  }

  @override
  String get adminLibraryName => 'Nama Pustaka';

  @override
  String get adminSelectedPaths => 'Path yang Dipilih:';

  @override
  String get adminNoPathsAdded =>
      'Belum ada path yang ditambahkan (dapat ditambahkan nanti)';

  @override
  String get adminCreateLibrary => 'Buat Pustaka';

  @override
  String get paths => 'Path:';

  @override
  String get adminDisableUser => 'Nonaktifkan Pengguna';

  @override
  String get adminEnableUser => 'Aktifkan Pengguna';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Nonaktifkan $name? Mereka tidak akan dapat masuk.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Aktifkan $name? Mereka akan dapat masuk lagi.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Pengguna \"$name\" dinonaktifkan';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Pengguna \"$name\" diaktifkan';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Gagal memperbarui kebijakan pengguna: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Gagal memuat pengguna';

  @override
  String get adminSearchUsers => 'Cari pengguna';

  @override
  String get adminEditUser => 'Edit Pengguna';

  @override
  String get adminAddUser => 'Tambah Pengguna';

  @override
  String adminUserCreateFailed(String error) {
    return 'Gagal membuat pengguna: $error';
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
    return 'Gagal menyimpan: $error';
  }

  @override
  String get adminPermissionsSaved => 'Izin disimpan';

  @override
  String get adminPasswordsMismatch => 'Kata sandi tidak cocok';

  @override
  String adminFailed(String error) {
    return 'Gagal: $error';
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
  String get adminAllowPublicSharing => 'Izinkan berbagi publik';

  @override
  String get adminAllowRemoteControl =>
      'Izinkan kendali jarak jauh atas pengguna lain';

  @override
  String get adminAllowSharedDeviceControl =>
      'Izinkan kontrol perangkat bersama';

  @override
  String get adminAllowRemoteAccess => 'Izinkan akses jarak jauh';

  @override
  String get adminRemoteBitrateLimit => 'Batas bitrate klien jarak jauh (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Biarkan kosong untuk tanpa batas';

  @override
  String get adminMaxActiveSessions => 'Maksimum sesi aktif';

  @override
  String get adminAllowLiveTvAccess => 'Izinkan akses TV Langsung';

  @override
  String get adminAllowLiveTvManagement => 'Izinkan pengelolaan TV Langsung';

  @override
  String get adminAllowCollectionManagement => 'Izinkan pengelolaan koleksi';

  @override
  String get adminAllowSubtitleManagement => 'Izinkan pengelolaan subtitle';

  @override
  String get adminAllowLyricManagement => 'Izinkan pengelolaan lirik';

  @override
  String get adminSavePermissions => 'Simpan Izin';

  @override
  String get adminEnableAllLibraryAccess => 'Aktifkan akses ke semua pustaka';

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
  String get adminResetPassword => 'Reset Kata Sandi';

  @override
  String get adminPasswordReset => 'Kata sandi direset';

  @override
  String get adminPasswordUpdated => 'Kata sandi diperbarui';

  @override
  String get adminUserSettings => 'Pengaturan Pengguna';

  @override
  String get adminLibraryAccess => 'Akses Pustaka';

  @override
  String get adminDeviceAndChannelAccess => 'Akses Perangkat & Kanal';

  @override
  String get adminEnableAllDevices => 'Aktifkan akses ke semua perangkat';

  @override
  String get adminEnableAllChannels => 'Aktifkan akses ke semua kanal';

  @override
  String get adminResetPasswordWarning =>
      'Ini akan menghapus kata sandi. Pengguna akan dapat masuk tanpa kata sandi.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server mengembalikan HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Apakah Anda yakin ingin menghapus $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Pengguna \"$name\" dihapus';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Gagal menghapus pengguna: $error';
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
    return 'Gagal membuat kunci: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token kunci tidak ada dalam respons server';

  @override
  String get adminRevokeApiKey => 'Cabut Kunci API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Cabut kunci untuk $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Kunci API dicabut';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Gagal mencabut kunci: $error';
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
  String get adminUnknownApp => 'Aplikasi Tidak Diketahui';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\nDibuat: $created';
  }

  @override
  String get adminCreatingBackup => 'Membuat cadangan...';

  @override
  String get adminBackupCreated => 'Cadangan berhasil dibuat';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Gagal membuat cadangan: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Path cadangan tidak ada dalam respons server';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Gagal memuat manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Konfirmasi Pemulihan';

  @override
  String get adminRestoringBackup => 'Memulihkan cadangan...';

  @override
  String adminRestoreFailed(String error) {
    return 'Gagal memulihkan cadangan: $error';
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
  String get restore => 'Pulihkan';

  @override
  String get adminLogsLoadFailed => 'Gagal memuat log server';

  @override
  String get adminNoLogFiles => 'Tidak ada file log yang ditemukan';

  @override
  String get adminLogCopied => 'Log disalin ke clipboard';

  @override
  String get adminSaveLogFile => 'Simpan file log';

  @override
  String adminSavedTo(String path) {
    return 'Disimpan ke $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Gagal menyimpan file: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Gagal memuat $fileName';
  }

  @override
  String get adminSearchInLog => 'Cari di log';

  @override
  String get adminNoMatchingLines => 'Tidak ada baris yang cocok';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Gagal memuat tugas: $error';
  }

  @override
  String get adminNoScheduledTasks =>
      'Tidak ada tugas terjadwal yang ditemukan';

  @override
  String get adminNoTasksMatchFilter =>
      'Tidak ada tugas yang cocok dengan filter saat ini';

  @override
  String adminTaskStartFailed(String error) {
    return 'Gagal memulai tugas: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Gagal menghentikan tugas: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Gagal memuat tugas: $error';
  }

  @override
  String get adminRunNow => 'Jalankan Sekarang';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Gagal menghapus pemicu: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Gagal menambahkan pemicu: $error';
  }

  @override
  String get adminLastExecution => 'Eksekusi Terakhir';

  @override
  String get adminTriggers => 'Pemicu';

  @override
  String get adminAddTrigger => 'Tambah Pemicu';

  @override
  String get adminNoTriggers => 'Tidak ada pemicu yang dikonfigurasi';

  @override
  String get adminTriggerType => 'Tipe Pemicu';

  @override
  String get adminTimeLimit => 'Batas waktu (opsional)';

  @override
  String get adminNoLimit => 'Tanpa batas';

  @override
  String adminHours(String hours) {
    return '$hours jam';
  }

  @override
  String get adminDayOfWeek => 'Hari dalam seminggu';

  @override
  String get adminSearchPlugins => 'Cari plugin...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Gagal mengaktifkan/nonaktifkan plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Copot Plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Apakah Anda yakin ingin mencopot \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Gagal mencopot plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Gagal menginstal paket: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Gagal menginstal pembaruan: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Gagal memuat plugin: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Tidak ada plugin yang cocok dengan pencarian Anda';

  @override
  String get adminNoPluginsInstalled => 'Tidak ada plugin yang terinstal';

  @override
  String adminInstallUpdate(String version) {
    return 'Instal pembaruan (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Gagal memuat katalog: $error';
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
      'Integrasi pengaturan plugin masih bersifat eksperimental. Beberapa halaman pengaturan mungkin tidak dirender dengan benar.';

  @override
  String get continueAction => 'Lanjutkan';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" akan dihapus setelah server dimulai ulang';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Gagal mencopot: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Memperbarui \"$name\" ke v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Tidak dapat membuka pengaturan: token autentikasi tidak ada.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Gagal memuat plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin tidak ditemukan';

  @override
  String adminPluginVersion(String version) {
    return 'Versi $version';
  }

  @override
  String get adminEnablePlugin => 'Aktifkan Plugin';

  @override
  String get adminPluginSettingsPage => 'Halaman pengaturan plugin';

  @override
  String get adminRevisionHistory => 'Riwayat Revisi';

  @override
  String get adminNoChangelog => 'Tidak ada changelog yang tersedia.';

  @override
  String get adminRemoveRepository => 'Hapus Repositori';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Apakah Anda yakin ingin menghapus \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Gagal menyimpan repositori: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Gagal memuat repositori: $error';
  }

  @override
  String get adminRepositoryNameHint => 'mis. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL Repositori';

  @override
  String get adminAddEntry => 'Tambah entri';

  @override
  String get adminInvalidUrl => 'URL tidak valid';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Tidak dapat memuat pengaturan plugin: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Tidak dapat membuka $uri';
  }

  @override
  String get adminOpenInBrowser => 'Buka di Browser';

  @override
  String get adminOpenExternally => 'Buka secara eksternal';

  @override
  String get adminGeneralSettings => 'Pengaturan Umum';

  @override
  String get adminServerName => 'Nama server';

  @override
  String get adminPreferredMetadataCountry => 'Negara metadata yang dipilih';

  @override
  String get adminCachePath => 'Path cache';

  @override
  String get adminMetadataPath => 'Path metadata';

  @override
  String get adminLibraryScanConcurrency => 'Konkruensi pemindaian pustaka';

  @override
  String get adminParallelImageEncodingLimit => 'Batas encoding gambar paralel';

  @override
  String get adminSlowResponseThreshold => 'Ambang respons lambat (ms)';

  @override
  String get adminBrandingSaved => 'Pengaturan branding disimpan';

  @override
  String get adminBrandingLoadFailed => 'Gagal memuat pengaturan branding';

  @override
  String get adminLoginDisclaimer => 'Disclaimer login';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML ditampilkan di bawah formulir login';

  @override
  String get adminCustomCss => 'CSS Kustom';

  @override
  String get adminCustomCssHint => 'CSS kustom diterapkan ke antarmuka web';

  @override
  String get adminEnableSplashScreen => 'Aktifkan splash screen';

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
      'Biarkan kosong atau 0 untuk tanpa batas';

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
  String get adminEnableHardwareEncoding => 'Aktifkan encoding perangkat keras';

  @override
  String get adminEnableHardwareDecoding =>
      'Aktifkan decoding perangkat keras untuk:';

  @override
  String get adminEncodingThreads => 'Thread encoding';

  @override
  String get adminAutomatic => '0 = otomatis';

  @override
  String get adminTranscodingTempPath => 'Path sementara transcoding';

  @override
  String get adminEnableFallbackFont => 'Aktifkan font fallback';

  @override
  String get adminFallbackFontPath => 'Path font fallback';

  @override
  String get adminAllowSegmentDeletion => 'Izinkan penghapusan segmen';

  @override
  String get adminSegmentKeepSeconds => 'Durasi simpan segmen (detik)';

  @override
  String get adminThrottleBuffering => 'Batasi buffering';

  @override
  String get adminTrickplaySaved => 'Pengaturan trickplay disimpan';

  @override
  String get adminTrickplayLoadFailed => 'Gagal memuat pengaturan trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Aktifkan akselerasi perangkat keras';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Aktifkan ekstraksi key frame saja';

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
  String get adminIntervalMs => 'Interval (md)';

  @override
  String get adminCaptureFrameSubtitle => 'Seberapa sering mengambil frame';

  @override
  String get adminWidthResolutions => 'Resolusi lebar';

  @override
  String get adminTileWidth => 'Lebar tile';

  @override
  String get adminTileHeight => 'Tinggi tile';

  @override
  String get adminQualitySubtitle =>
      'Nilai lebih rendah = kualitas lebih baik, file lebih besar';

  @override
  String get adminProcessThreads => 'Thread proses';

  @override
  String get adminResumeSaved => 'Pengaturan resume disimpan';

  @override
  String get adminResumeLoadFailed => 'Gagal memuat pengaturan resume';

  @override
  String get adminResumeDescription =>
      'Atur kapan konten harus ditandai sebagai diputar sebagian atau diputar penuh.';

  @override
  String get adminMinResumePercentage => 'Persentase minimum resume';

  @override
  String get adminMinResumeSubtitle =>
      'Konten harus diputar melewati persentase ini untuk menyimpan progres';

  @override
  String get adminMaxResumePercentage => 'Persentase maksimum resume';

  @override
  String get adminMaxResumeSubtitle =>
      'Konten dianggap selesai diputar setelah persentase ini';

  @override
  String get adminMinResumeDuration => 'Durasi minimum resume (detik)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Item yang lebih pendek dari ini tidak dapat dilanjutkan';

  @override
  String get adminMinAudiobookResume => 'Persentase minimum resume audiobook';

  @override
  String get adminMaxAudiobookResume => 'Persentase maksimum resume audiobook';

  @override
  String get adminNetworkingSaved =>
      'Pengaturan jaringan disimpan. Mungkin diperlukan restart server.';

  @override
  String get adminNetworkingLoadFailed => 'Gagal memuat pengaturan jaringan';

  @override
  String get adminNetworkingWarning =>
      'Perubahan pada pengaturan jaringan mungkin memerlukan restart server.';

  @override
  String get adminEnableRemoteAccess => 'Aktifkan akses jarak jauh';

  @override
  String get ports => 'Port';

  @override
  String get adminHttpPort => 'Port HTTP';

  @override
  String get adminHttpsPort => 'Port HTTPS';

  @override
  String get adminPublicHttpsPort => 'Port HTTPS publik';

  @override
  String get adminBaseUrl => 'URL dasar';

  @override
  String get adminBaseUrlHint => 'mis. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Aktifkan HTTPS';

  @override
  String get adminLocalNetwork => 'Jaringan Lokal';

  @override
  String get adminLocalNetworkAddresses => 'Alamat jaringan lokal';

  @override
  String get adminKnownProxies => 'Proxy yang dikenal';

  @override
  String get adminRemoteIpFilter => 'Filter IP Jarak Jauh';

  @override
  String get adminRemoteIpFilterEntries => 'Filter IP jarak jauh';

  @override
  String get adminCertificatePath => 'Path sertifikat';

  @override
  String get whitelist => 'Daftar putih';

  @override
  String get blacklist => 'Daftar hitam';

  @override
  String get notSet => 'Tidak diatur';

  @override
  String get adminMetadataSaved => 'Metadata disimpan';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Gagal memuat metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Gagal menyimpan metadata: $error';
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
    return 'Gagal menyegarkan metadata: $error';
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
    return 'Pencarian jarak jauh gagal: $error';
  }

  @override
  String get adminUpdateContentType => 'Perbarui Tipe Konten';

  @override
  String get adminContentType => 'Tipe konten';

  @override
  String get adminContentTypeUpdated => 'Tipe konten diperbarui';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Gagal memperbarui tipe konten: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed => 'Gagal memuat editor metadata';

  @override
  String get adminNoPeopleEntries => 'Tidak ada entri orang';

  @override
  String get adminNoExternalIds => 'Tidak ada ID eksternal yang tersedia';

  @override
  String adminImageUpdated(String imageType) {
    return 'Gambar $imageType diperbarui';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Gagal mengunduh gambar: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Format gambar tidak didukung';

  @override
  String get adminImageReadFailed => 'Gagal membaca gambar yang dipilih';

  @override
  String adminImageUploaded(String imageType) {
    return 'Gambar $imageType diunggah';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Gagal mengunggah gambar: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Hapus gambar $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Gambar $imageType dihapus';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Gagal menghapus gambar: $error';
  }

  @override
  String get adminAllProviders => 'Semua penyedia';

  @override
  String get adminNoRemoteImages =>
      'Tidak ada gambar jarak jauh yang ditemukan';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Penemuan tuner gagal: $error';
  }

  @override
  String get adminAddTuner => 'Tambah Tuner';

  @override
  String get adminTunerType => 'Tipe Tuner';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Lainnya';

  @override
  String get adminUrlPath => 'URL / Path';

  @override
  String get adminNameOptional => 'Nama (opsional)';

  @override
  String get adminTunerAdded => 'Tuner ditambahkan';

  @override
  String adminTunerAddFailed(String error) {
    return 'Gagal menambahkan tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Tambah Penyedia Panduan';

  @override
  String get adminProviderType => 'Tipe Penyedia';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect atau XMLTV';

  @override
  String get adminUsernameOptional => 'Nama pengguna (opsional)';

  @override
  String get adminRefreshInterval => 'Interval penyegaran (jam)';

  @override
  String get adminProviderAdded => 'Penyedia ditambahkan';

  @override
  String adminProviderAddFailed(String error) {
    return 'Gagal menambahkan penyedia: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Gagal menghapus tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Reset tuner diminta';

  @override
  String adminTunerResetFailed(String error) {
    return 'Gagal mereset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Gagal menghapus penyedia: $error';
  }

  @override
  String get adminRecordingSettings => 'Pengaturan Rekaman';

  @override
  String get adminPrePadding => 'Pra-padding (menit)';

  @override
  String get adminPostPadding => 'Pascapadding (menit)';

  @override
  String get adminRecordingPath => 'Path rekaman';

  @override
  String get adminSeriesRecordingPath => 'Path rekaman serial';

  @override
  String get adminRecordingSettingsSaved => 'Pengaturan rekaman disimpan';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Gagal menyimpan pengaturan: $error';
  }

  @override
  String get adminSetChannelMappings => 'Atur Pemetaan Kanal';

  @override
  String get adminMappingJson => 'JSON Pemetaan';

  @override
  String get adminMappingJsonHint => 'Contoh: payload JSON pemetaan';

  @override
  String get adminChannelMappingsUpdated => 'Pemetaan kanal diperbarui';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Gagal memperbarui pemetaan: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Gagal memuat administrasi TV Langsung';

  @override
  String get adminTunerDevices => 'Perangkat Tuner';

  @override
  String get adminNoTunerHosts => 'Tidak ada host tuner yang dikonfigurasi';

  @override
  String get adminGuideProviders => 'Penyedia Panduan';

  @override
  String get adminAddProvider => 'Tambah Penyedia';

  @override
  String get adminNoListingProviders =>
      'Tidak ada penyedia listing yang dikonfigurasi';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Path rekaman: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Path serial: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Pra-padding: $minutes menit';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Pascapadding: $minutes menit';
  }

  @override
  String get adminTunerDiscovery => 'Penemuan Tuner';

  @override
  String get adminChannelMappings => 'Pemetaan Kanal';

  @override
  String get adminNoDiscoveredTuners => 'Belum ada tuner yang ditemukan';

  @override
  String get adminSettingsSaved => 'Pengaturan disimpan';

  @override
  String get adminBackupsNotAvailable =>
      'Cadangan tidak tersedia pada build server ini.';

  @override
  String get adminRestoreWarning1 =>
      'Pemulihan akan mengganti SEMUA data server saat ini dengan data cadangan.';

  @override
  String get adminRestoreWarning2 =>
      'Pengaturan server, pengguna, dan data pustaka saat ini akan ditimpa.';

  @override
  String get adminRestoreWarning3 =>
      'Server akan dimulai ulang setelah pemulihan.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Pulihkan cadangan $name sekarang?';
  }

  @override
  String get adminRestoreRequested =>
      'Permintaan pemulihan dikirim. Restart server dapat memutus sesi ini.';

  @override
  String get adminBackupsTitle => 'Cadangan';

  @override
  String get adminUnknownDate => 'Tanggal tidak diketahui';

  @override
  String get adminUnnamedBackup => 'Cadangan Tanpa Nama';

  @override
  String get adminLiveTvNotAvailable =>
      'Administrasi TV Langsung tidak tersedia pada build server ini.';

  @override
  String get adminLiveTvTitle => 'Administrasi TV Langsung';

  @override
  String get adminApply => 'Terapkan';

  @override
  String get adminNotSet => 'Tidak diatur';

  @override
  String get adminReset => 'Reset';

  @override
  String get adminLogsTitle => 'Log Server';

  @override
  String get adminLogsNewestFirst => 'Terbaru Dulu';

  @override
  String get adminLogsOldestFirst => 'Terlama Dulu';

  @override
  String get adminLogsJustNow => 'Baru saja';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes m lalu';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours jam lalu';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days h lalu';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Gagal memuat $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count kecocokan';
  }

  @override
  String get adminLogViewerNoMatches => 'Tidak ada baris yang cocok';

  @override
  String get adminMetadataEditorTitle => 'Editor Metadata';

  @override
  String get adminMetadataRemote => 'Jarak Jauh';

  @override
  String get adminMetadataType => 'Tipe';

  @override
  String get adminMetadataDetails => 'Detail';

  @override
  String get adminMetadataExternalIds => 'ID Eksternal';

  @override
  String get adminMetadataImages => 'Gambar';

  @override
  String get adminMetadataFieldTitle => 'Judul';

  @override
  String get adminMetadataFieldSortTitle => 'Judul urut';

  @override
  String get adminMetadataFieldOriginalTitle => 'Judul asli';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Tanggal tayang perdana (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Tanggal berakhir (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Tahun produksi';

  @override
  String get adminMetadataFieldOfficialRating => 'Rating resmi';

  @override
  String get adminMetadataFieldCommunityRating => 'Rating komunitas';

  @override
  String get adminMetadataFieldCriticRating => 'Rating kritikus';

  @override
  String get adminMetadataFieldTagline => 'Tagline';

  @override
  String get adminMetadataFieldOverview => 'Ikhtisar';

  @override
  String get adminMetadataGenres => 'Genre';

  @override
  String get adminMetadataTags => 'Tag';

  @override
  String get adminMetadataStudios => 'Studio';

  @override
  String get adminMetadataPeople => 'Orang';

  @override
  String get adminMetadataAddGenre => 'Tambah genre';

  @override
  String get adminMetadataAddTag => 'Tambah tag';

  @override
  String get adminMetadataAddStudio => 'Tambah studio';

  @override
  String get adminMetadataAddPerson => 'Tambah Orang';

  @override
  String get adminMetadataEditPerson => 'Edit Orang';

  @override
  String get adminMetadataRole => 'Peran';

  @override
  String get adminMetadataImagePrimary => 'Utama';

  @override
  String get adminMetadataImageBackdrop => 'Backdrop';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Thumb';

  @override
  String get adminMetadataRecursive => 'Rekursif';

  @override
  String get adminMetadataProvider => 'Penyedia';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Gambar $imageType diperbarui';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Gambar $imageType diunggah';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Gambar $imageType dihapus';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Gagal mengunduh gambar: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Gagal membaca gambar yang dipilih';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Gagal mengunggah gambar: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Hapus gambar $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Ini akan menghapus gambar saat ini dari item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Gagal menghapus gambar: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Pilih gambar $imageType';
  }

  @override
  String get adminMetadataUpload => 'Unggah';

  @override
  String get adminMetadataUpdate => 'Perbarui';

  @override
  String get adminMetadataRemoteImage => 'Gambar jarak jauh';

  @override
  String get adminPluginsInstalled => 'Terinstal';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktif';

  @override
  String get adminPluginsRestart => 'Mulai Ulang';

  @override
  String get adminPluginsNoSearchResults =>
      'Tidak ada plugin yang cocok dengan pencarian Anda';

  @override
  String get adminPluginsNoneInstalled => 'Tidak ada plugin yang terinstal';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Pembaruan tersedia: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Pembaruan tersedia';

  @override
  String get adminPluginsPendingRemoval =>
      'Menunggu penghapusan setelah restart';

  @override
  String get adminPluginsChangesPending => 'Perubahan menunggu restart';

  @override
  String get adminPluginsEnable => 'Aktifkan';

  @override
  String get adminPluginsDisable => 'Nonaktifkan';

  @override
  String get adminPluginsInstallUpdate => 'Instal pembaruan';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instal pembaruan (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Tidak ada paket yang cocok dengan pencarian Anda';

  @override
  String get adminPluginsCatalogEmpty => 'Tidak ada paket yang tersedia';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" sedang diinstal...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integrasi Eksperimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrasi pengaturan plugin masih bersifat eksperimental. Beberapa field atau tata letak mungkin belum dirender dengan benar.';

  @override
  String get adminPluginDetailToggle404 =>
      'Gagal mengaktifkan/nonaktifkan plugin. Server tidak dapat menemukan versi plugin ini. Coba segarkan plugin, lalu coba lagi.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Gagal mengaktifkan/nonaktifkan plugin. Silakan periksa log server untuk detailnya.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Pengaturan $name';
  }

  @override
  String get adminPluginDetailDetails => 'Detail';

  @override
  String get adminPluginDetailDeveloper => 'Pengembang';

  @override
  String get adminPluginDetailRepository => 'Repositori';

  @override
  String get adminPluginDetailBundled => 'Bundel';

  @override
  String get adminPluginDetailEnablePlugin => 'Aktifkan Plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'Restart server diperlukan agar perubahan berlaku.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Plugin ini akan dihapus setelah restart server.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Plugin ini mengalami malfungsi dan mungkin tidak berfungsi dengan benar.';

  @override
  String get adminPluginDetailNotSupported =>
      'Plugin ini tidak didukung oleh versi server saat ini.';

  @override
  String get adminPluginDetailSuperseded =>
      'Plugin ini telah digantikan oleh versi yang lebih baru.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Gagal memuat repositori: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Hapus Repositori';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Apakah Anda yakin ingin menghapus \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Hapus';

  @override
  String adminReposSaveFailed(String error) {
    return 'Gagal menyimpan repositori: $error';
  }

  @override
  String get adminReposEmpty => 'Tidak ada repositori yang dikonfigurasi';

  @override
  String get adminReposEmptySubtitle =>
      'Tambahkan repositori untuk menelusuri plugin yang tersedia';

  @override
  String get adminReposUnnamed => '(tanpa nama)';

  @override
  String get adminReposEditTitle => 'Edit Repositori';

  @override
  String get adminReposAddTitle => 'Tambah Repositori';

  @override
  String get adminReposUrl => 'URL Repositori';

  @override
  String get adminReposNameHint => 'mis. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL tidak valid';

  @override
  String get adminGeneralSettingsTitle => 'Pengaturan Umum';

  @override
  String get adminGeneralMetadataLanguage => 'Bahasa metadata yang dipilih';

  @override
  String get adminGeneralMetadataLanguageHint => 'mis. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Negara metadata yang dipilih';

  @override
  String get adminGeneralMetadataCountryHint => 'mis. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Konkruensi pemindaian pustaka';

  @override
  String get adminGeneralImageEncodingLimit => 'Batas encoding gambar paralel';

  @override
  String get adminUnknownError => 'Kesalahan tidak diketahui';

  @override
  String get adminBrowse => 'Telusuri';

  @override
  String get adminCloseBrowser => 'Tutup browser';

  @override
  String get adminNetworkingTitle => 'Jaringan';

  @override
  String get adminNetworkingRestartWarning =>
      'Perubahan pada pengaturan jaringan mungkin memerlukan restart server.';

  @override
  String get adminNetworkingRemoteAccess => 'Aktifkan akses jarak jauh';

  @override
  String get adminNetworkingPorts => 'Port';

  @override
  String get adminNetworkingHttpPort => 'Port HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Port HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Aktifkan HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Jaringan Lokal';

  @override
  String get adminNetworkingLocalAddresses => 'Alamat jaringan lokal';

  @override
  String get adminNetworkingAddressHint => 'mis. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxy yang dikenal';

  @override
  String get adminNetworkingProxyHint => 'mis. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Daftar putih';

  @override
  String get adminNetworkingBlacklist => 'Daftar hitam';

  @override
  String get adminNetworkingAddEntry => 'Tambah entri';

  @override
  String get adminBrandingTitle => 'Branding';

  @override
  String get adminBrandingLoginDisclaimer => 'Disclaimer login';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML ditampilkan di bawah formulir login';

  @override
  String get adminBrandingCustomCss => 'CSS Kustom';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS kustom diterapkan ke antarmuka web';

  @override
  String get adminBrandingEnableSplash => 'Aktifkan splash screen';

  @override
  String get adminPlaybackHwAccel => 'Akselerasi Perangkat Keras';

  @override
  String get adminPlaybackHwAccelLabel => 'Akselerasi perangkat keras';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Aktifkan encoding perangkat keras';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Aktifkan decoding perangkat keras untuk:';

  @override
  String get adminPlaybackEncoding => 'Encoding';

  @override
  String get adminPlaybackEncodingThreads => 'Thread encoding';

  @override
  String get adminPlaybackFallbackFont => 'Aktifkan font fallback';

  @override
  String get adminPlaybackFallbackFontPath => 'Path font fallback';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audiobook';

  @override
  String get adminResumeMinAudiobookPct =>
      'Persentase minimum resume audiobook';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Persentase maksimum resume audiobook';

  @override
  String get adminStreamingBitrateLimit =>
      'Batas bitrate klien jarak jauh (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Biarkan kosong atau 0 untuk tanpa batas';

  @override
  String get adminTrickplayHwAccel => 'Aktifkan akselerasi perangkat keras';

  @override
  String get adminTrickplayHwEncoding => 'Aktifkan encoding perangkat keras';

  @override
  String get adminTrickplayKeyFrameOnly => 'Aktifkan ekstraksi key frame saja';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Lebih cepat tetapi akurasinya lebih rendah';

  @override
  String get adminTrickplayNonBlocking => 'Non-Blokir';

  @override
  String get adminTrickplayBlocking => 'Blokir';

  @override
  String get adminTrickplayPriorityHigh => 'Tinggi';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Di Atas Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Di Bawah Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Idle';

  @override
  String get adminTrickplayImageSettings => 'Pengaturan Gambar';

  @override
  String get adminTrickplayInterval => 'Interval (md)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Seberapa sering mengambil frame';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Lebar piksel dipisahkan koma (mis. 320)';

  @override
  String get adminTrickplayQuality => 'Kualitas';

  @override
  String get adminTrickplayQScale => 'Skala kualitas';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Nilai lebih rendah = kualitas lebih baik, file lebih besar';

  @override
  String get adminTrickplayJpegQuality => 'Kualitas JPEG';

  @override
  String get adminTrickplayProcessing => 'Pemrosesan';

  @override
  String get adminTasksEmpty => 'Tidak ada tugas terjadwal yang ditemukan';

  @override
  String get adminTasksNoFilterMatch =>
      'Tidak ada tugas yang cocok dengan filter saat ini';

  @override
  String get adminTaskCancelling => 'Membatalkan...';

  @override
  String get adminTaskRunning => 'Sedang berjalan...';

  @override
  String get adminTaskNeverRun => 'Tidak pernah dijalankan';

  @override
  String get adminTaskStop => 'Hentikan';

  @override
  String get adminTaskRun => 'Jalankan';

  @override
  String get adminTaskDetailLastExecution => 'Eksekusi Terakhir';

  @override
  String get adminTaskDetailStarted => 'Dimulai';

  @override
  String get adminTaskDetailEnded => 'Berakhir';

  @override
  String get adminTaskDetailDuration => 'Durasi';

  @override
  String get adminTaskDetailErrorLabel => 'Kesalahan:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Setiap hari pada $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Setiap $day pada $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Setiap $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Saat aplikasi dimulai';

  @override
  String get adminTaskTriggerTypeDaily => 'Harian';

  @override
  String get adminTaskTriggerTypeWeekly => 'Mingguan';

  @override
  String get adminTaskTriggerTypeInterval => 'Pada interval tertentu';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

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
      other: '$count jam',
      one: '1 jam',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Waktu';

  @override
  String get adminTaskTriggerNoLimit => 'Tanpa batas';

  @override
  String get adminActivityJustNow => 'Baru saja';

  @override
  String get adminActivityLastHour => 'Satu jam terakhir';

  @override
  String get adminActivityToday => 'Hari ini';

  @override
  String get adminActivityYesterday => 'Kemarin';

  @override
  String get adminActivityOlder => 'Lebih lama';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days h lalu';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours jam lalu';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes m lalu';
  }

  @override
  String get adminActivityNow => 'sekarang';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes m';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours jam';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days h';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Konfigurasikan pembuatan gambar trickplay untuk thumbnail pratinjau saat seek.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Port HTTPS publik';

  @override
  String get adminNetworkingBaseUrl => 'URL dasar';

  @override
  String get adminNetworkingBaseUrlHint => 'mis. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Path sertifikat';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filter IP Jarak Jauh';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filter IP jarak jauh';

  @override
  String get adminPlaybackVaapiDevice => 'Perangkat VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = otomatis';

  @override
  String get adminPlaybackTranscodeTempPath => 'Path sementara transcoding';

  @override
  String get adminPlaybackSegmentDeletion => 'Izinkan penghapusan segmen';

  @override
  String get adminPlaybackSegmentKeep => 'Durasi simpan segmen (detik)';

  @override
  String get adminPlaybackThrottleBuffering => 'Batasi buffering';

  @override
  String get adminResumeMinPct => 'Persentase minimum resume';

  @override
  String get adminResumeMinPctSubtitle =>
      'Konten harus diputar melewati persentase ini untuk menyimpan progres';

  @override
  String get adminResumeMaxPct => 'Persentase maksimum resume';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Konten dianggap selesai diputar setelah persentase ini';

  @override
  String get adminResumeMinDuration => 'Durasi minimum resume (detik)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Item yang lebih pendek dari ini tidak dapat dilanjutkan';

  @override
  String get adminTrickplayScanBehavior => 'Perilaku pemindaian';

  @override
  String get adminTrickplayProcessPriority => 'Prioritas proses';

  @override
  String get adminTrickplayTileWidth => 'Lebar tile';

  @override
  String get adminTrickplayTileHeight => 'Tinggi tile';

  @override
  String get adminTrickplayProcessThreads => 'Thread proses';

  @override
  String get adminTrickplayWidthResolutions => 'Resolusi lebar';

  @override
  String get adminMetadataDefault => 'Default';

  @override
  String get adminMetadataContentTypeUpdated => 'Tipe konten diperbarui';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Gagal memperbarui tipe konten: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Ambang respons lambat (md)';

  @override
  String get adminGeneralCachePath => 'Path cache';

  @override
  String get adminGeneralMetadataPath => 'Path metadata';

  @override
  String get adminGeneralServerName => 'Nama server';

  @override
  String get adminSettingsLoadFailed => 'Gagal memuat pengaturan';

  @override
  String get adminDiscover => 'Temukan';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Gagal memperbarui pemetaan: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Batas waktu: $duration';
  }

  @override
  String get folders => 'Folder';

  @override
  String get libraries => 'Pustaka';

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
  String get syncPlayGroupFallbackName => 'Grup SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'grup SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# peserta',
      one: '# peserta',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Abaikan tunggu';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Jangan menahan grup saat perangkat ini melakukan buffering';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Lanjutkan secara lokal tanpa menunggu anggota yang lambat';

  @override
  String get syncPlayRepeat => 'Ulangi';

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
      'Ganti antrean grup dengan yang sedang diputar secara lokal';

  @override
  String get syncPlayLeaveGroup => 'Keluar dari grup';

  @override
  String get syncPlayGroupQueue => 'Antrean grup';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Putar sekarang';

  @override
  String get syncPlayCreateNewGroup => 'Buat grup baru';

  @override
  String get syncPlayGroupName => 'Nama grup';

  @override
  String get syncPlayDefaultGroupName => 'Grup SyncPlay Saya';

  @override
  String get syncPlayCreateGroup => 'Buat grup';

  @override
  String get syncPlayAvailableGroups => 'Grup yang tersedia';

  @override
  String get syncPlayNoGroupsAvailable => 'Tidak ada grup yang tersedia';

  @override
  String get syncPlayJoinGroupQuestion => 'Gabung ke grup SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Bergabung ke grup SyncPlay dapat mengganti antrean pemutaran Anda saat ini. Lanjutkan?';

  @override
  String get syncPlayJoin => 'Gabung';

  @override
  String get syncPlayStateIdle => 'Diam';

  @override
  String get syncPlayStateWaiting => 'Menunggu';

  @override
  String get syncPlayStatePaused => 'Dijeda';

  @override
  String get syncPlayStatePlaying => 'Memutar';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName bergabung ke grup SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName keluar dari grup SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Akses SyncPlay ditolak';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Anda tidak memiliki akses ke satu atau beberapa item di grup SyncPlay ini. Minta pemilik grup memeriksa izin pustaka atau pilih antrean lain.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Menyinkronkan pemutaran ke $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Pencarian suara tidak tersedia.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Direct Play Dolby Vision Gagal';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Direct play gagal dimulai untuk stream Dolby Vision ini. Coba lagi menggunakan transcode server?';

  @override
  String get retryWithTranscode => 'Coba lagi dengan transcode';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Tidak Didukung';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Perangkat ini tidak dapat mendekode konten Dolby Vision secara langsung. Gunakan fallback HDR10 atau minta transcoding server.';

  @override
  String get rememberMyChoice => 'Ingat pilihan saya';

  @override
  String get playHdr10Fallback => 'Putar fallback HDR10';

  @override
  String get requestTranscode => 'Minta transcode';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# baris ditemukan',
      one: '# baris ditemukan',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Lihat Semua';

  @override
  String get noItems => 'Tidak ada item';

  @override
  String get switchUser => 'Ganti Pengguna';

  @override
  String get remoteControl => 'Kontrol Jarak Jauh';

  @override
  String get mediaBarLoading => 'Memuat bilah media...';

  @override
  String get mediaBarError => 'Gagal memuat bilah media';

  @override
  String get offlineServerUnavailable =>
      'Terhubung ke internet, tetapi server saat ini tidak tersedia.';

  @override
  String get offlineNoInternet =>
      'Anda sedang offline. Hanya konten yang diunduh yang tersedia.';

  @override
  String get offlineFileNotAvailable => 'File tidak tersedia';

  @override
  String get offlineSwitchServer => 'Ganti Server';

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
    return 'Kontrol cast gagal: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Kontrol $kind';
  }

  @override
  String get castDeviceVolume => 'Volume Perangkat';

  @override
  String get castVolumeUnavailable => 'Tidak tersedia';

  @override
  String castStopKind(String kind) {
    return 'Hentikan $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtitle';

  @override
  String get pinConfirmTitle => 'Konfirmasi PIN';

  @override
  String get pinSetTitle => 'Tetapkan PIN';

  @override
  String get pinEnterTitle => 'Masukkan PIN';

  @override
  String get pinReenterToConfirm => 'Masukkan ulang PIN Anda untuk konfirmasi';

  @override
  String pinEnterNDigit(int length) {
    return 'Masukkan PIN $length digit';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Masukkan PIN $length digit Anda';
  }

  @override
  String get pinIncorrect => 'PIN salah';

  @override
  String get pinMismatch => 'PIN tidak cocok';

  @override
  String get pinForgot => 'Lupa PIN?';

  @override
  String get pinClear => 'Hapus';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Permintaan Quick Connect diotorisasi.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kode Quick Connect tidak valid atau kedaluwarsa.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect tidak didukung di server ini.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Gagal mengotorisasi kode Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect dinonaktifkan di server ini.';

  @override
  String get quickConnectForbidden =>
      'Akun Anda tidak dapat mengotorisasi permintaan Quick Connect ini.';

  @override
  String get quickConnectNotFound =>
      'Kode Quick Connect tidak ditemukan. Coba kode baru.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect gagal: $message';
  }

  @override
  String get quickConnectEnterCode => 'Masukkan kode';

  @override
  String get quickConnectAuthorize => 'Otorisasi';

  @override
  String remoteCommandFailed(String error) {
    return 'Perintah gagal: $error';
  }

  @override
  String get remoteControlTitle => 'Kontrol Jarak Jauh';

  @override
  String get remoteFailedToLoadSessions => 'Gagal memuat sesi';

  @override
  String get remoteNoSessions => 'Tidak ada sesi yang dapat dikontrol';

  @override
  String get remoteStartPlayback => 'Mulai pemutaran di perangkat lain';

  @override
  String get unknownUser => 'Tidak diketahui';

  @override
  String get unknownItem => 'Tidak diketahui';

  @override
  String get remoteNothingPlaying => 'Tidak ada yang diputar pada sesi ini';

  @override
  String get castingStarted => 'Casting dimulai pada perangkat yang dipilih';

  @override
  String castingFailed(String error) {
    return 'Gagal memulai casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Tidak ada perangkat pemutaran jarak jauh yang tersedia.';

  @override
  String get noRemoteDevicesIos =>
      'Tidak ada perangkat pemutaran jarak jauh yang tersedia.\n\nPada iOS, target AirPlay mungkin tidak tersedia di simulator.';

  @override
  String get trackActionPlayNext => 'Putar Berikutnya';

  @override
  String get trackActionAddToQueue => 'Tambahkan ke Antrean';

  @override
  String get trackActionAddToPlaylist => 'Tambahkan ke Playlist';

  @override
  String get trackActionCancelDownload => 'Batalkan Unduhan';

  @override
  String get trackActionDeleteFromPlaylist => 'Hapus dari Playlist';

  @override
  String get trackActionMoveUp => 'Naikkan';

  @override
  String get trackActionMoveDown => 'Turunkan';

  @override
  String get trackActionRemoveFromFavorites => 'Hapus dari Favorit';

  @override
  String get trackActionAddToFavorites => 'Tambahkan ke Favorit';

  @override
  String get trackActionGoToAlbum => 'Buka Album';

  @override
  String get trackActionGoToArtist => 'Buka Artis';

  @override
  String trackActionDownloading(String name) {
    return 'Mengunduh $name...';
  }

  @override
  String get trackActionDeletedFile => 'File unduhan dihapus';

  @override
  String get trackActionDeleteFileFailed =>
      'Tidak dapat menghapus file unduhan';

  @override
  String get shuffleBy => 'Acak Berdasarkan';

  @override
  String get shuffleSelectLibrary => 'Pilih Pustaka';

  @override
  String get shuffleSelectGenre => 'Pilih Genre';

  @override
  String get shuffleLibrary => 'Pustaka';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Tidak ada pustaka yang kompatibel.';

  @override
  String get shuffleNoGenres =>
      'Tidak ada genre yang ditemukan untuk mode acak ini.';

  @override
  String get posterDisplayTitle => 'Tampilan';

  @override
  String get posterImageType => 'Tipe Gambar';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Thumbnail';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed => 'Gagal menambahkan ke playlist';

  @override
  String get playlistCreateFailed => 'Gagal membuat playlist';

  @override
  String get playlistNew => 'Playlist Baru';

  @override
  String get playlistCreate => 'Buat';

  @override
  String get playlistCreateNew => 'Buat Playlist Baru';

  @override
  String get playlistNoneFound => 'Tidak ada playlist yang ditemukan';

  @override
  String get addToPlaylist => 'Tambahkan ke Playlist';

  @override
  String get lyricsNotAvailable => 'Tidak ada lirik yang tersedia';

  @override
  String get upNext => 'Berikutnya';

  @override
  String get playNext => 'Putar Berikutnya';

  @override
  String get stillWatchingContent =>
      'Pemutaran telah dijeda. Apakah Anda masih menonton?';

  @override
  String get stillWatchingStop => 'Hentikan';

  @override
  String get stillWatchingContinue => 'Lanjutkan';

  @override
  String skipSegment(String segment) {
    return 'Lewati $segment';
  }

  @override
  String get liveTv => 'TV Langsung';

  @override
  String get continueWatchingAndNextUp => 'Lanjut Menonton & Berikutnya';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Mengunduh $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Mengunduh $fileName';
  }

  @override
  String get nextEpisode => 'Episode Berikutnya';

  @override
  String get moreFromThisSeason => 'Lebih Banyak dari Musim Ini';

  @override
  String get playerTooltipPlaybackSpeed => 'Kecepatan pemutaran';

  @override
  String get playerTooltipCastControls => 'Kontrol cast';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Masuk layar penuh';

  @override
  String get playerTooltipExitFullscreen => 'Keluar dari layar penuh';

  @override
  String get playerTooltipFloatOnTop => 'Tetap di atas';

  @override
  String get playerTooltipExitFloatOnTop => 'Nonaktifkan tetap di atas';

  @override
  String get playerTooltipLockLandscape => 'Kunci lanskap';

  @override
  String get playerTooltipUnlockOrientation => 'Izinkan rotasi';

  @override
  String get playerTooltipPrevious => 'Sebelumnya';

  @override
  String get playerTooltipSeekBack => 'Mundur';

  @override
  String get playerTooltipSeekForward => 'Maju';

  @override
  String get contextMenuMarkWatched => 'Tandai sebagai Ditonton';

  @override
  String get contextMenuMarkUnwatched => 'Tandai sebagai Belum Ditonton';

  @override
  String get contextMenuAddToFavorites => 'Tambahkan ke Favorit';

  @override
  String get contextMenuRemoveFromFavorites => 'Hapus dari Favorit';

  @override
  String get contextMenuGoToSeries => 'Buka Serial';

  @override
  String get settingsAdministrationSubtitle =>
      'Akses panel administrasi server';

  @override
  String get settingsAccountSecurity => 'Akun & Keamanan';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentikasi, kode PIN, dan kontrol orang tua';

  @override
  String get settingsPersonalization => 'Personalisasi';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navigasi, baris beranda, dan visibilitas pustaka';

  @override
  String get settingsDynamicContent => 'Konten Dinamis';

  @override
  String get settingsDynamicContentSubtitle => 'Media Bar dan overlay visual';

  @override
  String get settingsPlaybackSyncplay => 'Pemutaran & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Pengaturan audio/video, subtitle, unduhan, dan kontrol SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sinkronisasi plugin, Seerr, rating, dan lainnya';

  @override
  String get settingsAboutSubtitle =>
      'Versi aplikasi, informasi hukum, dan kredit';

  @override
  String get settingsAuthenticationSection => 'AUTENTIKASI';

  @override
  String get settingsSortServersBy => 'Urutkan Server Berdasarkan';

  @override
  String get settingsLastUsed => 'Terakhir Digunakan';

  @override
  String get settingsAlphabetical => 'Alfabetis';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVASI & KEAMANAN';

  @override
  String get settingsBlockedRatings => 'Rating Diblokir';

  @override
  String get settingsGeneralStyle => 'Gaya Umum';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Aksen tema, backdrop, indikator tontonan, dan musik tema';

  @override
  String get settingsHomePage => 'Halaman Beranda';

  @override
  String get settingsHomePageSubtitle =>
      'Bagian, tipe gambar, overlay, dan pratinjau media';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilitas pustaka, tampilan folder, dan perilaku multi-server';

  @override
  String get settingsTwentyFourHourClock => 'Jam 24';

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
      'Tampilkan tombol pustaka di bilah navigasi';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Tampilkan tombol Seerr di bilah navigasi';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Atur visibilitas halaman beranda per pustaka. Mulai ulang Moonfin agar perubahan berlaku.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Media Bar & Pratinjau Lokal';

  @override
  String get settingsVisualOverlays => 'Overlay Visual';

  @override
  String get settingsSeasonalSurprise => 'Kejutan Musiman';

  @override
  String get settingsMetadataAndRatings => 'Metadata & Rating';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase mendukung integrasi sisi server termasuk sumber rating tambahan, permintaan Seerr, dan preferensi tersinkronisasi.';

  @override
  String get settingsOfflineDownloads => 'Unduhan Offline';

  @override
  String get settingsHigh => 'Tinggi';

  @override
  String get settingsLow => 'Rendah';

  @override
  String get settingsCustomPath => 'Path Kustom';

  @override
  String get settingsEnterDownloadFolderPath => 'Masukkan path folder unduhan';

  @override
  String get settingsConcurrentDownloads => 'Unduhan Bersamaan';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Jumlah maksimum item yang diunduh sekaligus.';

  @override
  String get settingsAppInfo => 'INFO APLIKASI';

  @override
  String get settingsReportAnIssue => 'Laporkan Masalah';

  @override
  String get settingsReportAnIssueSubtitle => 'Buka issue tracker di GitHub';

  @override
  String get settingsJoinDiscord => 'Gabung Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Mengobrol dengan komunitas';

  @override
  String get settingsJoinTheDiscord => 'Gabung ke Discord';

  @override
  String get settingsSupportMoonfin => 'Dukung Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Belikan kopi untuk pengembang';

  @override
  String get settingsLegal => 'HUKUM';

  @override
  String get settingsLicenses => 'Lisensi';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Pemberitahuan lisensi open source';

  @override
  String get settingsPrivacyPolicy => 'Kebijakan Privasi';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Cara Moonfin menangani data Anda';

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
      other: '# pemberitahuan lisensi',
      one: '# pemberitahuan lisensi',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Keduanya';

  @override
  String get settingsShuffleContentTypeFilter => 'Filter Tipe Konten Acak';

  @override
  String get settingsVideoPlaybackPreferences => 'Preferensi Pemutaran Video';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Mesin video inti dan pengaturan kualitas streaming';

  @override
  String get settingsAudioPreferences => 'Preferensi Audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Track audio, pemrosesan, dan opsi passthrough';

  @override
  String get settingsAutomationAndQueue => 'Otomatisasi & Antrean';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Pemutaran otomatis dan pengurutan';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kualitas unduhan, batas penyimpanan, dan ukuran antrean';

  @override
  String get settingsSyncplaySubtitle => 'Logika sinkronisasi untuk sesi grup';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Fitur pemutar khusus. Gunakan dengan hati-hati, karena beberapa opsi dapat menyebabkan masalah pemutaran';

  @override
  String get settingsSkipIntrosAndOutros => 'Lewati Intro dan Outro?';

  @override
  String get settingsMediaSegmentCountdown => 'Hitung Mundur Segmen Media';

  @override
  String get settingsProgressBar => 'Bilah Progres';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Tidak Ada';

  @override
  String get settingsPromptUser => 'Minta Pengguna';

  @override
  String get settingsSkip => 'Lewati';

  @override
  String get settingsDoNothing => 'Jangan Lakukan Apa-apa';

  @override
  String get settingsMaxBitrateDescription =>
      'Batasi bitrate streaming. Konten di atas ambang ini akan ditranskode agar sesuai.';

  @override
  String get settingsMaxResolutionDescription =>
      'Batasi resolusi maksimum yang akan diminta pemutar. Konten beresolusi lebih tinggi akan ditranskode turun.';

  @override
  String get settingsPlayerZoomDescription =>
      'Cara video diskalakan agar sesuai dengan layar.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Mesin Pemutaran (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Pilih mesin pemutaran default pada perangkat Android TV. Perubahan berlaku pada sesi pemutaran berikutnya.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (direkomendasikan)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (legacy)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (direkomendasikan)';

  @override
  String get settingsDolbyVisionFallback => 'Fallback Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Perilaku untuk judul Dolby Vision pada perangkat tanpa dekode Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Tanya setiap kali';

  @override
  String get settingsPreferHdr10Fallback => 'Utamakan fallback HDR10';

  @override
  String get settingsPreferServerTranscode => 'Utamakan transcode server';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Direct Play Dolby Vision Profile 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Mengontrol apakah stream enhancement-layer Dolby Vision profile 7 harus diputar dengan direct play.';

  @override
  String get settingsAutoAftkrtEnabled => 'Otomatis (AFTKRT diaktifkan)';

  @override
  String get settingsEnabledOnThisDevice => 'Diaktifkan pada perangkat ini';

  @override
  String get settingsDisabledPreferTranscode =>
      'Dinonaktifkan (utamakan transcode)';

  @override
  String get settingsResumeRewindDescription =>
      'Saat melanjutkan pemutaran (dari Lanjut Menonton atau halaman item media), berapa detik yang harus dimundurkan?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Saat melanjutkan pemutaran setelah menekan tombol jeda, berapa detik yang harus dimundurkan?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Berapa detik untuk melompat mundur setelah menekan tombol rewind.';

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
      'Berapa detik untuk melompat maju setelah menekan tombol fast forward.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 ke dekoder eksternal';

  @override
  String get settingsCinemaMode => 'Mode Sinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Putar trailer/preroll sebelum fitur utama';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended menampilkan kartu penuh dengan artwork episode dan deskripsi. Minimal menampilkan overlay hitung mundur yang ringkas. Disabled menyembunyikan prompt sepenuhnya.';

  @override
  String get settingsShort => 'Pendek';

  @override
  String get settingsLong => 'Panjang';

  @override
  String get settingsVeryLong => 'Sangat Panjang';

  @override
  String get settingsVideoStartDelay => 'Penundaan Mulai Video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value md';
  }

  @override
  String get settingsLiveTvDirect => 'Live TV Direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktifkan direct play untuk Live TV';

  @override
  String get settingsOpenGroups => 'Buka Grup';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Buat, gabung, atau kelola grup SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Diaktifkan';

  @override
  String get settingsSyncplayEnabledSubtitle => 'Aktifkan fitur menonton grup';

  @override
  String get settingsSyncplayButton => 'Tombol SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Tampilkan tombol SyncPlay pada bilah navigasi';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Koreksi Lanjutan';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktifkan logika sinkronisasi yang lebih terperinci';

  @override
  String get settingsSyncplaySyncCorrection => 'Koreksi Sinkronisasi';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Sesuaikan pemutaran secara otomatis agar tetap sinkron';

  @override
  String get settingsSyncplaySpeedToSync => 'Kecepatan untuk Sinkronisasi';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Gunakan penyesuaian kecepatan pemutaran untuk sinkronisasi';

  @override
  String get settingsSyncplaySkipToSync => 'Lewati untuk Sinkronisasi';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Gunakan seek untuk sinkronisasi';

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
  String get settingsSyncplayExtraOffset => 'Offset Ekstra SyncPlay';

  @override
  String get onNow => 'Sedang Tayang';

  @override
  String get collections => 'Koleksi';

  @override
  String get lastPlayed => 'Terakhir Diputar';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Terbaru $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
  }

  @override
  String get autoplayNextEpisode => 'Putar Otomatis Episode Berikutnya';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Putar otomatis episode berikutnya jika tersedia.';

  @override
  String get skipSilenceTitle => 'Lewati keheningan';

  @override
  String get skipSilenceSubtitle =>
      'Lewati segmen audio hening secara otomatis saat didukung oleh stream.';

  @override
  String get allowExternalAudioEffectsTitle => 'Izinkan efek audio eksternal';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Izinkan equalizer dan aplikasi efek (mis. Wavelet) terhubung ke sesi pemutaran Media3.';

  @override
  String get disableTunnelingTitle => 'Nonaktifkan tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Paksa pemutaran non-tunneled. Berguna pada perangkat dengan diskontinuitas audio/video tunneling.';

  @override
  String get enableTunnelingTitle => 'Aktifkan tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Lanjutan. Merutekan audio dan video melalui jalur perangkat keras yang terhubung. Nonaktif secara default karena menyebabkan dropout audio/video pada beberapa perangkat.';

  @override
  String get mapDolbyVisionP7Title => 'Petakan Dolby Vision profile 7 ke HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Putar stream Dolby Vision profile 7 sebagai HEVC yang kompatibel dengan HDR10 pada perangkat non-DV.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Gunakan gaya subtitle tertanam';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Terapkan warna, font, dan posisi yang tertanam di track subtitle. Nonaktifkan untuk menggunakan preferensi gaya caption Anda.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Gunakan ukuran font subtitle tertanam';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Terapkan petunjuk ukuran font yang tertanam di track subtitle. Nonaktifkan untuk menggunakan ukuran subtitle dari preferensi gaya Anda.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Tampilkan Detail Media';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Tampilkan detail item yang dipilih di bagian atas halaman Pustaka.';

  @override
  String get useDetailedSubHeadings => 'Gunakan Subjudul Terperinci';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Tampilkan subbaris terperinci atau minimal pada halaman Pustaka.';

  @override
  String get savedThemesDeleteDialogTitle => 'Hapus tema tersimpan?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Hapus \"$themeName\" dari cache perangkat ini?';
  }

  @override
  String get themeStore => 'Toko Tema';

  @override
  String get themeStoreSubtitle => 'Telusuri dan simpan tema komunitas';

  @override
  String get themeStoreDescription =>
      'Simpan tema untuk menggunakannya seperti tema tersimpan lainnya.';

  @override
  String get themeStoreEmpty => 'Tidak ada tema yang tersedia saat ini.';

  @override
  String get themeStoreLoadFailed =>
      'Tidak dapat memuat Toko Tema. Periksa koneksi Anda dan coba lagi.';

  @override
  String get themeStoreSave => 'Simpan';

  @override
  String get themeStoreSaveAndApply => 'Simpan & terapkan';

  @override
  String get themeStoreSaved => 'Tersimpan';

  @override
  String get themeStoreInvalidMessage => 'Tema ini tidak dapat dimuat.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" disimpan.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" dihapus dari perangkat ini.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Tidak dapat menghapus \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Tema tersimpan';

  @override
  String get savedThemesDescription =>
      'Ini adalah tema yang diunduh dari plugin Moonfin untuk server saat ini. Menghapusnya hanya menghapus salinan lokal ini.';

  @override
  String get savedThemesEmpty =>
      'Tidak ada tema tersimpan yang ditemukan untuk server ini.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId -  Saat ini aktif';
  }

  @override
  String get savedThemesDeleteTooltip => 'Hapus tema tersimpan';

  @override
  String get savedThemesManageSubtitle =>
      'Kelola tema plugin yang diunduh pada perangkat ini';

  @override
  String get themeEditor => 'Editor Tema';

  @override
  String get themeEditorSubtitle => 'Buka Editor Tema Moonfin di browser Anda';

  @override
  String get homeScreen => 'Layar Beranda';

  @override
  String get bottomBar => 'Bilah Bawah';

  @override
  String get homeRowsStyleClassic => 'Klasik';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Baris Beranda';

  @override
  String get homeRowDisplay => 'Tampilan Baris Beranda';

  @override
  String get homeRowSections => 'Bagian Baris Beranda';

  @override
  String get homeRowToggles => 'Toggle Baris Beranda';

  @override
  String get homeRowTogglesSubtitle =>
      'Aktifkan atau nonaktifkan berbagai kategori baris beranda';

  @override
  String get homeRowTogglesDescription =>
      'Aktifkan toggle berikut untuk menampilkan baris di Bagian Beranda.';

  @override
  String get rowsType => 'Tipe Baris';

  @override
  String get rowsTypeDescription =>
      'Klasik mempertahankan tipe gambar per baris dan overlay info. Modern menggunakan baris potret-ke-backdrop.';

  @override
  String get displayFavoritesRows => 'Tampilkan Baris Favorit';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Tampilkan baris Film Favorit, Serial Favorit, dan baris favorit lainnya di Bagian Beranda.';

  @override
  String get favoritesRowSorting => 'Pengurutan Baris Favorit';

  @override
  String get favoritesRowSortingDescription =>
      'Urutkan baris Favorit berdasarkan tanggal ditambahkan, tanggal rilis, alfabetis, dan lainnya.';

  @override
  String get displayCollectionsRows => 'Tampilkan Baris Koleksi';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Tampilkan baris Koleksi di Bagian Beranda.';

  @override
  String get collectionsRowSorting => 'Pengurutan Baris Koleksi';

  @override
  String get collectionsRowSortingDescription =>
      'Urutkan baris Koleksi berdasarkan tanggal ditambahkan, tanggal rilis, alfabetis, dan lainnya.';

  @override
  String get displayGenresRows => 'Tampilkan Baris Genre';

  @override
  String get displayGenresRowsSubtitle =>
      'Tampilkan baris Genre di Bagian Beranda.';

  @override
  String get genresRowSorting => 'Pengurutan Baris Genre';

  @override
  String get genresRowSortingDescription =>
      'Urutkan baris Genre berdasarkan tanggal ditambahkan, tanggal rilis, alfabetis, dan lainnya.';

  @override
  String get genresRowItems => 'Item Baris Genre';

  @override
  String get genresRowItemsDescription =>
      'Tampilkan Film, Serial, atau keduanya di baris Genre.';

  @override
  String get displayPlaylistsRows => 'Tampilkan Baris Playlist';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Tampilkan baris Playlist di Bagian Beranda.';

  @override
  String get playlistsRowSorting => 'Pengurutan Baris Playlist';

  @override
  String get playlistsRowSortingDescription =>
      'Urutkan baris Playlist berdasarkan tanggal ditambahkan, tanggal rilis, alfabetis, dan lainnya.';

  @override
  String get displayAudioRows => 'Tampilkan Baris Audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Tampilkan baris Audio di Bagian Beranda.';

  @override
  String get audioRowsSorting => 'Pengurutan Baris Audio';

  @override
  String get audioRowsSortingDescription =>
      'Urutkan baris Audio berdasarkan tanggal ditambahkan, tanggal rilis, alfabetis, dan lainnya.';

  @override
  String get audioPlaylists => 'Playlist Audio';

  @override
  String get appearance => 'Tampilan';

  @override
  String get cardSize => 'Ukuran Tampilan Kartu Baris Beranda';

  @override
  String get externalPlayerApp => 'Aplikasi pemutar eksternal';

  @override
  String get externalPlayerAppDescription =>
      'Atur pemutar eksternal untuk mengaktifkan opsi putar dengan tekan lama';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Tampilkan pemilih aplikasi saat pemutaran dimulai.';

  @override
  String get loadingInstalledPlayers => 'Memuat pemutar yang terinstal...';

  @override
  String get connection => 'Koneksi';

  @override
  String get audioTranscodeTarget => 'Target Transcode Audio';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Didukung pada perangkat ini';

  @override
  String get notSupportedOnThisDevice => 'Tidak Didukung pada perangkat ini';

  @override
  String get settingsAudioDtsXPassthrough => 'Passthrough DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) ke dekoder eksternal.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Passthrough TrueHD dengan Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Perilaku Pemutar Media';

  @override
  String get playbackEnhancements => 'Peningkatan Pemutaran';

  @override
  String get alwaysOn => 'Selalu aktif.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Ganti Skip Outro dengan Tampilan Next Up';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Tampilkan overlay Next Up alih-alih tombol Skip Outro.';

  @override
  String get playerRouting => 'Perutean Pemutar';

  @override
  String get preferSoftwareDecoders => 'Utamakan dekoder perangkat lunak';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Gunakan FFmpeg (audio) dan libgav1 (AV1) sebelum dekoder perangkat keras. Nonaktifkan jika passthrough audio HDMI bermasalah.';

  @override
  String get useExternalPlayer => 'Selalu gunakan pemutar eksternal';

  @override
  String get useExternalPlayerSubtitle =>
      'Buka pemutaran video di aplikasi eksternal yang Anda pilih pada Android TV.';

  @override
  String get automaticQueuing => 'Pengantrean Otomatis';

  @override
  String get preferSdhSubtitles => 'Utamakan subtitle SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioritaskan track subtitle SDH/CC saat memilih otomatis.';

  @override
  String get webDiagnostics => 'Diagnostik web';

  @override
  String get webDiagnosticsTitle => 'Diagnostik Web Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Gunakan halaman ini untuk mendiagnosis masalah konektivitas browser (CORS, mixed content, dan pengaturan discovery).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Kegagalan Mixed Content Terdeteksi';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Kegagalan CORS/Preflight Terdeteksi';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin mendeteksi halaman HTTPS yang mencoba memanggil URL server HTTP. Browser memblokir permintaan ini sebelum mencapai server Anda.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin mendeteksi kegagalan permintaan pada tingkat browser yang umumnya disebabkan oleh header CORS atau preflight yang tidak ada pada server media.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL Target: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detail: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Konteks Runtime Saat Ini';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Skema';

  @override
  String get webDiagnosticsPluginMode => 'Mode Plugin';

  @override
  String get webDiagnosticsWebRtcScan => 'Pemindaian WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL Server Paksa';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL Server Default';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL Proxy Discovery';

  @override
  String get notConfigured => 'tidak dikonfigurasi';

  @override
  String get webDiagnosticsMixedContent => 'Mixed Content';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Halaman ini dimuat melalui HTTPS, tetapi satu atau lebih URL yang dikonfigurasi menggunakan HTTP. Browser memblokir halaman HTTPS untuk memanggil API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Perbaikan: sajikan server media atau endpoint proxy Anda melalui HTTPS, atau muat Moonfin melalui HTTP hanya pada jaringan lokal tepercaya.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Tidak ada konfigurasi mixed content yang jelas terdeteksi dari pengaturan runtime saat ini.';

  @override
  String get webDiagnosticsCorsChecklist => 'Daftar Periksa CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '-  Izinkan origin browser di Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '-  Sertakan Authorization, X-Emby-Authorization, dan X-Emby-Token di Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '-  Ekspos Content-Range dan Accept-Ranges untuk perilaku streaming dan seek.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '-  Kembalikan 204 untuk permintaan preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Contoh Potongan Header (gaya nginx)';

  @override
  String get note => 'Catatan';

  @override
  String get webDiagnosticsNonWebNote =>
      'Rute diagnostik ini ditujukan untuk build web. Jika Anda melihat ini di platform lain, pemeriksaan ini mungkin tidak berlaku.';

  @override
  String get backToServerSelect => 'Kembali ke Pilih Server';

  @override
  String get signOutAllUsers => 'Keluar dari Semua Pengguna';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Izin mikrofon ditolak secara permanen. Aktifkan di pengaturan sistem.';

  @override
  String get voiceSearchPermissionRequired =>
      'Izin mikrofon diperlukan untuk pencarian suara.';

  @override
  String get voiceSearchNoMatch => 'Tidak tertangkap. Coba lagi.';

  @override
  String get voiceSearchNoSpeechDetected => 'Tidak ada ucapan yang terdeteksi.';

  @override
  String get voiceSearchMicrophoneError => 'Kesalahan mikrofon.';

  @override
  String get voiceSearchNeedsInternet => 'Pencarian suara memerlukan internet.';

  @override
  String get voiceSearchServiceBusy => 'Layanan suara sedang sibuk. Coba lagi.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Izin mikrofon ditolak secara permanen.';

  @override
  String get microphonePermissionDenied => 'Izin mikrofon ditolak.';

  @override
  String get speechRecognitionUnavailable =>
      'Pengenalan suara tidak tersedia di perangkat ini.';

  @override
  String get openIosRoutePicker => 'Buka pemilih rute iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Pemilih rute AirPlay tidak tersedia di perangkat ini.';

  @override
  String get videos => 'Video';

  @override
  String get trailers => 'Trailer';

  @override
  String get programs => 'Program';

  @override
  String get songs => 'Lagu';

  @override
  String get photoAlbums => 'Album Foto';

  @override
  String get photos => 'Foto';

  @override
  String get people => 'Orang';

  @override
  String get recentlyReleasedEpisodes => 'Episode yang Baru Dirilis';

  @override
  String get watchAgain => 'Tonton Lagi';

  @override
  String get guestAppearances => 'Penampilan Tamu';

  @override
  String get appearancesSeerr => 'Penampilan (Seerr)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'Tonton bersama grup';

  @override
  String get errors => 'Kesalahan';

  @override
  String get warnings => 'Peringatan';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Buka di Browser';

  @override
  String get embeddedBrowserNotAvailable =>
      'Browser tertanam tidak tersedia di platform ini.';

  @override
  String get adminRestartServerConfirmation =>
      'Apakah Anda yakin ingin memulai ulang server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Apakah Anda yakin ingin mematikan server? Anda harus menyalakannya kembali secara manual.';

  @override
  String get internal => 'Internal';

  @override
  String get idle => 'Diam';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Tidak ada pengguna yang ditemukan';

  @override
  String get adminNoUsersMatchSearch =>
      'Tidak ada pengguna yang cocok dengan pencarian Anda';

  @override
  String get adminNoDevicesFound => 'Tidak ada perangkat yang ditemukan';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Tidak ada perangkat yang cocok dengan filter saat ini';

  @override
  String get passwordSet => 'Kata sandi ditetapkan';

  @override
  String get noPasswordConfigured => 'Tidak ada kata sandi yang dikonfigurasi';

  @override
  String get remoteAccess => 'Akses Jarak Jauh';

  @override
  String get localOnly => 'Hanya Lokal';

  @override
  String get adminMediaAnalyticsLoadFailed => 'Gagal memuat analitik media';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Analitik gabungan di seluruh pustaka media.';

  @override
  String get analyticsTopArtists => 'Artis Teratas';

  @override
  String get analyticsTopAuthors => 'Penulis Teratas';

  @override
  String get analyticsTopContributors => 'Kontributor Teratas';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Pustaka',
      one: '1 Pustaka',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Belum ada total media terindeks yang tersedia untuk pilihan ini.';

  @override
  String get analyticsLibraryDetails => 'Detail Pustaka';

  @override
  String get analyticsLibraryBreakdown => 'Rincian Pustaka';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Tidak ada pustaka yang tersedia.';

  @override
  String get adminServerAdministrationTitle => 'Administrasi Server';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Cache Gambar';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Log';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Transcode';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Server ini tidak mengembalikan path server.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% terpakai';
  }

  @override
  String get userActivity => 'Aktivitas Pengguna';

  @override
  String get systemEvents => 'Peristiwa Sistem';

  @override
  String get needsAttention => 'Perlu Perhatian';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Pemutaran';

  @override
  String get adminDrawerSectionDevices => 'Perangkat';

  @override
  String get adminDrawerSectionAdvanced => 'Lanjutan';

  @override
  String get adminDrawerSectionPlugins => 'Plugin';

  @override
  String get adminDrawerSectionLiveTv => 'TV Langsung';

  @override
  String get homeVideos => 'Video Rumahan';

  @override
  String get mixedContent => 'Konten Campuran';

  @override
  String get homeVideosAndPhotos => 'Video Rumahan & Foto';

  @override
  String get mixedMoviesAndShows => 'Film & Acara Campuran';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Tidak ada rekaman yang ditemukan';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Tidak ada halaman gambar yang ditemukan di dalam arsip .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Renderer tertanam gagal ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Renderer EPUB gagal ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'File lokal untuk pembaca tidak ditemukan: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status saat membuka data buku dari $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Tidak ada endpoint buku yang dapat dibaca';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Format arsip komik tidak didukung: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Plugin ekstraksi CBR tidak tersedia di platform ini.';

  @override
  String get failedToExtractCbrArchive => 'Gagal mengekstrak arsip .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Ekstraksi CB7 tidak tersedia di platform ini.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Plugin ekstraksi CB7 tidak tersedia di platform ini.';

  @override
  String get closeGenrePanel => 'Tutup panel genre';

  @override
  String get loadingShuffle => 'Memuat acak...';

  @override
  String get libraryShuffleLabel => 'ACAK PUSTAKA';

  @override
  String get randomShuffleLabel => 'ACAK RANDUM';

  @override
  String get genresShuffleLabel => 'ACAK BERDASARKAN GENRE';

  @override
  String get autoHdrSwitching => 'Peralihan HDR Otomatis';

  @override
  String get autoHdrSwitchingDescription =>
      'Aktifkan HDR secara otomatis untuk pemutaran video HDR dan pulihkan mode tampilan saat keluar.';

  @override
  String get whenFullscreen => 'Saat layar penuh';

  @override
  String get changeArtwork => 'Ubah Artwork';

  @override
  String get missing => 'Tidak ada';

  @override
  String get transcodingLimits => 'Batas Transcoding';

  @override
  String get clearAllArtworkButton => 'Hapus semua artwork?';

  @override
  String get clearAllArtworkWarning =>
      'Apakah Anda yakin ingin menghapus semua artwork yang diunduh?';

  @override
  String get confirmClear => 'Konfirmasi Hapus';

  @override
  String confirmClearMessage(String itemType) {
    return 'Apakah Anda yakin ingin menghapus $itemType ini?';
  }

  @override
  String get uploadButton => 'Unggah?';

  @override
  String get resolutionLabel => 'Resolusi: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Tampilkan artwork hanya dalam bahasa antarmuka';

  @override
  String get confirmClearAll => 'Konfirmasi Hapus Semua';

  @override
  String get imageUploadSuccess => 'Gambar berhasil diunggah!';

  @override
  String imageUploadFailed(String error) {
    return 'Gagal mengunggah gambar: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Gagal menetapkan gambar: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Gagal menghapus gambar: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Gagal menghapus semua artwork: $error';
  }

  @override
  String get yes => 'Ya';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Backdrop';

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
  String get screenshotCategory => 'Tangkapan Layar';

  @override
  String get boxCoverCategory => 'Sampul Kotak';

  @override
  String get boxRearCoverCategory => 'Sampul Belakang Kotak';

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
  String get confirmItemScreenshot => 'tangkapan layar';

  @override
  String get confirmItemBoxCover => 'sampul kotak';

  @override
  String get confirmItemBoxRearCover => 'sampul belakang kotak';

  @override
  String get confirmItemMenuArt => 'menu art';

  @override
  String get resolutionAll => 'Semua';

  @override
  String get resolutionHigh => 'Tinggi (1080p+)';

  @override
  String get resolutionMedium => 'Sedang (720p)';

  @override
  String get resolutionLow => 'Rendah (<720p)';

  @override
  String get sources => 'Sumber';

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
  String get externalLists => 'External Home Row Lists';

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
}
