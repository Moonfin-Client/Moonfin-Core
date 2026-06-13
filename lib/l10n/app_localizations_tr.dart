// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'ACCOUNT PREFERENCES';

  @override
  String get interfaceLanguage => 'Interface Language';

  @override
  String get systemLanguageDefault => 'System Default';

  @override
  String get signIn => 'Giris yap';

  @override
  String get empty => 'Empty';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Hizli baglanti';

  @override
  String get password => 'Sifre';

  @override
  String get username => 'Kullanici adi';

  @override
  String get email => 'E-posta';

  @override
  String get quickConnectInstruction =>
      'Bu kodu sunucunuzun web kontrol paneline girin:';

  @override
  String get waitingForAuthorization => 'Yetkilendirme bekleniyor...';

  @override
  String get back => 'Geri';

  @override
  String get serverUnavailable => 'Sunucu kullanılamıyor';

  @override
  String get loginFailed => 'giriş başarısız oldu';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Kim izliyor?';

  @override
  String get addUser => 'Kullanıcı Ekle';

  @override
  String get selectServer => 'Sunucu Seçin';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Kayıtlı Sunucular';

  @override
  String get discoveredServers => 'Keşfedilen Sunucular';

  @override
  String get noneFound => 'Hiçbiri bulunamadı';

  @override
  String get unableToConnectToServer => 'Sunucuya bağlanılamıyor';

  @override
  String get addServer => 'Sunucu Ekle';

  @override
  String get embyConnect => 'Emby Bağlantısı';

  @override
  String get removeServer => 'Sunucuyu Kaldır';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Iptal';

  @override
  String get remove => 'Kaldir';

  @override
  String get connectToServer => 'Sunucuya Bağlan';

  @override
  String get serverAddress => 'Sunucu Adresi';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Bağlamak';

  @override
  String get secureStorageUnavailable => 'Güvenli Depolama Kullanılamıyor';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin sistem anahtarlığınıza erişemedi. Giriş yapmaya devam edebilirsiniz ancak anahtarlığın kilidi açılana kadar güvenli token depolama alanı kullanılamayabilir.';

  @override
  String get ok => 'TAMAM';

  @override
  String get settingsAppearanceTheme => 'Uygulama Teması';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Uygulamayı yeniden başlatmadan Moonfin ve Neon Pulse arasında geçiş yapın';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Hepinizin çok sevdiği mevcut Moonfin görünümü';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Macenta parıltılı, camgöbeği metinli ve daha güçlü krom kontrastlı Synthwave stili';

  @override
  String get embyConnectSignInSubtitle =>
      'Emby Connect hesabınızla oturum açın';

  @override
  String get emailOrUsername => 'E-posta veya Kullanıcı Adı';

  @override
  String get selectAServer => 'Bir Sunucu Seçin';

  @override
  String get tryAgain => 'Tekrar deneyin';

  @override
  String get noLinkedServers => 'Bu Emby Connect hesabına bağlı sunucu yok';

  @override
  String get invalidEmbyConnectCredentials =>
      'Geçersiz Emby Connect kimlik bilgileri';

  @override
  String get invalidEmbyConnectLogin =>
      'Geçersiz Emby Connect kullanıcı adı veya şifresi';

  @override
  String get embyConnectExchangeNotSupported =>
      'Sunucu Emby Connect değişimini desteklemiyor';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect veya seçilen sunucuyla iletişim kurulurken ağ hatası';

  @override
  String get loadingLinkedServers => 'Bağlantılı sunucular yükleniyor...';

  @override
  String get connectingToServerEllipsis => 'Sunucuya bağlanılıyor...';

  @override
  String get noReachableAddress => 'Ulaşılabilir adres belirtilmedi';

  @override
  String get invalidServerExchangeResponse =>
      'Sunucu değişim uç noktasından geçersiz yanıt';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin\'den çıkılsın mı?';

  @override
  String get exitAppConfirmation => 'Çıkmak istediğinizden emin misiniz?';

  @override
  String get exit => 'Çıkış';

  @override
  String get noHomeRowsLoaded => 'Hiçbir ana satır yüklenemedi';

  @override
  String get noHomeRowsHint =>
      'Aktif ana sayfa bölümlerini yenilemeyi veya azaltmayı deneyin.';

  @override
  String get retryHomeRows => 'Ana Sayfa Satırlarını Yeniden Dene';

  @override
  String get guide => 'Rehber';

  @override
  String get recordings => 'Kayıtlar';

  @override
  String get schedule => 'Takvim';

  @override
  String get series => 'Seri';

  @override
  String get noItemsFound => 'Hiçbir öğe bulunamadı';

  @override
  String get home => 'Ana sayfa';

  @override
  String get browseAll => 'Tümüne Göz Atın';

  @override
  String get genres => 'Türler';

  @override
  String get collectionPlaceholder => 'Koleksiyon öğeleri burada görünecek';

  @override
  String get browseByLetter => 'Harfe Göre Gözat';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Alfabetik göz atma burada görünecek';

  @override
  String get suggestions => 'Öneriler';

  @override
  String get suggestionsPlaceholder => 'Önerilen öğeler burada görünecek';

  @override
  String get failedToLoadLibraries => 'Kitaplıklar yüklenemedi';

  @override
  String get noLibrariesFound => 'Hiçbir kitaplık bulunamadı';

  @override
  String get library => 'Kutuphane';

  @override
  String get displaySettings => 'Ekran Ayarları';

  @override
  String get allGenres => 'Tüm Türler';

  @override
  String get noGenresFound => 'Tür bulunamadı';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Bu klasör boş';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Favoriler yüklenemedi';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get noFavoritesYet => 'Henüz favori yok';

  @override
  String get favorites => 'Favoriler';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Devam ediyor';

  @override
  String get ended => 'Sona erdi';

  @override
  String get sortAndFilter => 'Sırala ve Filtrele';

  @override
  String get type => 'Tip';

  @override
  String get sortBy => 'Göre sırala';

  @override
  String get display => 'Görüntülemek';

  @override
  String get imageType => 'Resim Türü';

  @override
  String get posterSize => 'Poster Boyutu';

  @override
  String get small => 'Küçük';

  @override
  String get medium => 'Orta';

  @override
  String get large => 'Büyük';

  @override
  String get extraLarge => 'Ekstra Büyük';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Görünümler';

  @override
  String get albums => 'Albümler';

  @override
  String get albumArtists => 'Albüm Sanatçıları';

  @override
  String get artists => 'Sanatçılar';

  @override
  String get bookmarks => 'Yer imleri';

  @override
  String get noSavedBookmarks =>
      'Bu başlık için henüz kayıtlı yer işareti yok.';

  @override
  String get openBook => 'Kitabı Aç';

  @override
  String get chapter => 'Bölüm';

  @override
  String get page => 'Sayfa';

  @override
  String get bookmark => 'Yer imi';

  @override
  String get justNow => 'Şu anda';

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
  String get discoverySubjects => 'Keşif Konuları';

  @override
  String get pickDiscoverySubjects =>
      'Keşfet\'te hangi konu akışlarının gösterileceğini seçin.';

  @override
  String get apply => 'Uygula';

  @override
  String get openLink => 'Bağlantıyı Aç';

  @override
  String get scanWithYourPhone => 'Telefonunuzla tarayın';

  @override
  String get audiobookGenres => 'Sesli Kitap Türleri';

  @override
  String get pickAudiobookGenres =>
      'Sesli Kitap Keşfet\'te hangi türlerin gösterileceğini seçin.';

  @override
  String get discoverAudiobooks => 'Sesli Kitapları Keşfedin';

  @override
  String get librivoxDescription =>
      'LibriVox adresinden popüler kamu alanı başlıkları.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Sola kaydır';

  @override
  String get scrollRight => 'Sağa kaydır';

  @override
  String get couldNotLoadGenre => 'Bu tür şu anda yüklenemedi.';

  @override
  String get continueReading => 'Okumaya Devam Et';

  @override
  String get savedHighlights => 'Kaydedilen Öne Çıkanlar';

  @override
  String get continueListening => 'Dinlemeye Devam Et';

  @override
  String get listen => 'Dinlemek';

  @override
  String get resume => 'Devam et';

  @override
  String get failedToLoadLibrary => 'Kitaplık yüklenemedi';

  @override
  String get popularNow => 'Şimdi Popüler';

  @override
  String get savedForLater => 'Sonrası İçin Kaydedildi';

  @override
  String get topListens => 'En Çok Dinlenenler';

  @override
  String get unreadDiscoveries => 'Okunmamış Keşifler';

  @override
  String get pickUpAgain => 'Tekrar Al';

  @override
  String get bookHighlightsDescription =>
      'Öne çıkanlar, favoriler veya okuma ilerleme durumu içeren kitaplarınız.';

  @override
  String get handPickedFromLibrary => 'Kütüphanenizden özenle seçilmiştir.';

  @override
  String get handPickedFromListeningQueue =>
      'Dinleme kuyruğunuzdan özenle seçilmiş.';

  @override
  String get booksWithHighlights =>
      'Öne çıkanlar, favoriler veya okuma ilerlemesi içeren kitaplar.';

  @override
  String get jumpBackNarration => 'Yerinizi aramadan anlatıma geri dönün.';

  @override
  String get unreadBooksReady =>
      'Okunmamış kitaplar bir sonraki sessiz saate hazır.';

  @override
  String get quickAccessFavorites =>
      'Sürekli geri döndüğünüz kitaplara hızlı erişim.';

  @override
  String get searchAudiobooks => 'Sesli kitap ara';

  @override
  String get searchYourLibrary => 'Kütüphanenizde arama yapın';

  @override
  String get pickUpStory => 'Hikayeye kaldığınız yerden devam edin';

  @override
  String get savedPlacesChapters =>
      'Kaydedilen yerleriniz ve tamamlanmamış bölümleriniz';

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
  String get readyWhenYouAre => 'Hazır olduğunuzda hazır';

  @override
  String get details => 'Detaylar';

  @override
  String get listeningRoom => 'Dinleme Odası';

  @override
  String get bookmarksAndProgress => 'Yer İmleri ve İlerleme';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Başlıklar';

  @override
  String get allTitles => 'Tüm Başlıklar';

  @override
  String get authors => 'Yazarlar';

  @override
  String get browseByAuthor => 'Yazara Göre Gözat';

  @override
  String get browseByGenre => 'Türe Göre Göz At';

  @override
  String get discover => 'Keşfetmek';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library adresinden konuya göre trend olan başlıklar.';

  @override
  String get noBookmarkedItems => 'Henüz favorilere eklenmiş öğe yok';

  @override
  String get nothingMatchesSection =>
      'Henüz bu bölümle eşleşen bir şey yok. Başka bir sekme deneyin veya kitaplık senkronizasyonu bittikten sonra tekrar gelin.';

  @override
  String get audiobooks => 'Sesli kitaplar';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Dosya';

  @override
  String get filters => 'Filtreler';

  @override
  String get readingStatus => 'Okuma Durumu';

  @override
  String get playedStatus => 'Oynanma Durumu';

  @override
  String get readStatus => 'Okumak';

  @override
  String get watched => 'izlendi';

  @override
  String get unread => 'Okunmamış';

  @override
  String get unwatched => 'izlenmedi';

  @override
  String get seriesStatus => 'Seri Durumu';

  @override
  String get allLibraries => 'Tüm Kütüphaneler';

  @override
  String get books => 'Kitaplar';

  @override
  String get author => 'Yazar';

  @override
  String get unknownAuthor => 'Bilinmeyen Yazar';

  @override
  String get uncategorized => 'Kategorize edilmemiş';

  @override
  String get overview => 'Genel Bakış';

  @override
  String get noLibrivoxDescription =>
      'Bu başlık için henüz LibriVox tarafından bir açıklama sağlanmadı.';

  @override
  String get readers => 'Okuyucular';

  @override
  String get openLinks => 'Bağlantıları Aç';

  @override
  String get librivoxPage => 'LibriVox Sayfa';

  @override
  String get internetArchive => 'İnternet Arşivi';

  @override
  String get rssFeed => 'RSS Akışı';

  @override
  String get downloadZip => 'Zip\'i İndir';

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
      'Open Library adresinden bu başlık için henüz bir genel bakış mevcut değil.';

  @override
  String get subjects => 'Konular';

  @override
  String get all => 'Tüm';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Bu konu şu anda yüklenemiyor.';

  @override
  String get audiobookDetails => 'Sesli Kitap Ayrıntıları';

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
  String get trackList => 'Parça Listesi';

  @override
  String get itemListPlaceholder => 'Öğe listesi burada görünecek';

  @override
  String get favoriteTracksPlaceholder => 'Favori parçalar burada görünecek';

  @override
  String get failedToLoad => 'Yüklenemedi';

  @override
  String get delete => 'Silmek';

  @override
  String get save => 'Kaydetmek';

  @override
  String get moreLikeThis => 'Bunun Gibi Daha Fazlası';

  @override
  String get castAndCrew => 'Oyuncular ve Ekip';

  @override
  String get collection => 'Koleksiyon';

  @override
  String get episodes => 'Bölümler';

  @override
  String get nextUp => 'Sıradaki';

  @override
  String get seasons => 'Mevsimler';

  @override
  String get chapters => 'Bölümler';

  @override
  String get features => 'Özellikler';

  @override
  String get movies => 'Filmler';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Diğer';

  @override
  String get discography => 'Diskografi';

  @override
  String get similarArtists => 'Benzer Sanatçılar';

  @override
  String get tableOfContents => 'İçindekiler';

  @override
  String get tracklist => 'Şarkı listesi';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biyografi';

  @override
  String get authorDetails => 'Yazar Detayları';

  @override
  String get noOverviewAvailable =>
      'Bu başlık için henüz bir genel bakış mevcut değil.';

  @override
  String get noBiographyAvailable => 'Bu yazara ait biyografi mevcut değil.';

  @override
  String get noBooksFound => 'Bu yazara ait kitap bulunamadı.';

  @override
  String get unableToLoadAuthorDetails =>
      'Yazar ayrıntıları şu anda yüklenemiyor.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Yayınlanma tarihi bilinmiyor';

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
  String get view => 'Görüş';

  @override
  String get resumeReading => 'Okumaya Devam Et';

  @override
  String get read => 'Okumak';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Oynat';

  @override
  String get startOver => 'Yeniden Başla';

  @override
  String get restart => 'Yeniden baslat';

  @override
  String get readOffline => 'Çevrimdışı Oku';

  @override
  String get playOffline => 'Çevrimdışı Oyna';

  @override
  String get audio => 'Ses';

  @override
  String get subtitles => 'Altyazılar';

  @override
  String get version => 'Sürüm';

  @override
  String get cast => 'Döküm';

  @override
  String get trailer => 'Römork';

  @override
  String get finished => 'Bitti';

  @override
  String get favorited => 'Favorilere eklendi';

  @override
  String get favorite => 'Favori';

  @override
  String get playlist => 'Çalma listesi';

  @override
  String get downloaded => 'İndirildi';

  @override
  String get downloadAll => 'Tümünü İndir';

  @override
  String get download => 'İndirmek';

  @override
  String get deleteDownloaded => 'İndirilenleri Sil';

  @override
  String get goToSeries => 'Seriye Git';

  @override
  String get editMetadata => 'Meta Verileri Düzenle';

  @override
  String get less => 'Az';

  @override
  String get more => 'Daha';

  @override
  String get deleteItem => 'Öğeyi Sil';

  @override
  String get deletePlaylist => 'Oynatma Listesini Sil';

  @override
  String get deletePlaylistMessage =>
      'Bu oynatma listesi sunucudan silinsin mi?';

  @override
  String get deleteItemMessage => 'Bu öğe sunucudan silinsin mi?';

  @override
  String get failedToDeletePlaylist => 'Oynatma listesi silinemedi';

  @override
  String get failedToDeleteItem => 'Öğe silinemedi';

  @override
  String get renamePlaylist => 'Oynatma Listesini Yeniden Adlandır';

  @override
  String get playlistName => 'Oynatma listesi adı';

  @override
  String get deleteDownloadedAlbum => 'İndirilen Albümü Sil';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'İndirilen parçalar silindi';

  @override
  String get downloadedTracksDeleteFailed =>
      'İndirilen parçaların bazıları silinemedi';

  @override
  String get noTracksLoaded => 'Hiçbir parça yüklenmedi';

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
  String get itemDeleted => 'Öğe silindi';

  @override
  String get noPlayableTrailerFound => 'Oynanabilir fragman bulunamadı.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Ses Parçası';

  @override
  String get subtitleTrack => 'Altyazı Parçası';

  @override
  String get none => 'Hiçbiri';

  @override
  String get downloadSubtitlesLabel => 'Altyazıları indirin...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles eklentisini kullanarak arama yapın';

  @override
  String get downloadSubtitles => 'Altyazıları İndir';

  @override
  String get selectedSubtitleInvalid => 'Seçilen altyazı geçersiz.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Altyazı indirildi. Jellyfin öğeyi yenilerken görünmesi biraz zaman alabilir.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Sürüm Seç';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Tümünü İndir — Kalite';

  @override
  String get downloadQuality => 'İndirme Kalitesi';

  @override
  String get originalFileNoReencoding => 'Orijinal dosya, yeniden kodlama yok';

  @override
  String get originalFilesNoReencoding =>
      'Orijinal dosyalar, yeniden kodlama yok';

  @override
  String get noEpisodesLoaded => 'Hiçbir bölüm yüklenmedi';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'İndirilen Dosyaları Sil';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'İndirilen dosyalar silindi';

  @override
  String get failedToDeleteFiles => 'Dosyalar silinemedi';

  @override
  String get deleteFiles => 'Dosyaları Sil';

  @override
  String get director => 'MÜDÜR';

  @override
  String get writers => 'YAZARLAR';

  @override
  String get studio => 'STÜDYO';

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
  String get showLess => 'Daha Az Göster';

  @override
  String get readMore => 'Devamını oku';

  @override
  String get shuffle => 'Karıştır';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Mükemmel eşleşme';

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
  String get deleteSeasonFiles => 'bu sezondaki indirilen tüm bölümler';

  @override
  String get stillWatching => 'Hala izliyor musun?';

  @override
  String get unableToLoadTrailerStream => 'Fragman akışı yüklenemiyor.';

  @override
  String get trailerTimedOut => 'Fragman yüklenirken zaman aşımına uğradı.';

  @override
  String get playbackFailedForTrailer =>
      'Bu fragman için oynatma başarısız oldu.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Çevrimdışı oynatma sırasında yayın yapılamaz.';

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
  String get deviceVolume => 'Cihaz Sesi';

  @override
  String get unavailable => 'Kullanılamıyor';

  @override
  String get pause => 'Duraklat';

  @override
  String get syncPosition => 'Senkronizasyon Konumu';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Sıra boş';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Uzaktan Oynatma';

  @override
  String get castingToGoogleCast => 'Google Cast\'ye yayınlanıyor';

  @override
  String get castingViaAirPlay => 'AirPlay aracılığıyla yayınlanıyor';

  @override
  String get castingViaDlna => 'DLNA aracılığıyla yayınlanıyor';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Kilidi açmak için uzun basın';

  @override
  String get off => 'Kapalı';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Otomatik';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Bit Hızı Geçersiz Kılma';

  @override
  String get audioDelay => 'Ses Gecikmesi';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Altyazı Gecikmesi';

  @override
  String get reset => 'Sıfırla';

  @override
  String get unknown => 'Bilinmiyor';

  @override
  String get playbackInformation => 'Oynatma Bilgileri';

  @override
  String get playback => 'Playback';

  @override
  String get playMethod => 'Oynatma Yöntemi';

  @override
  String get directPlay => 'Doğrudan Oynatma';

  @override
  String get directStream => 'Doğrudan Akış';

  @override
  String get transcoding => 'Kod dönüştürme';

  @override
  String get transcodeReasons => 'Kod Dönüştürme Nedenleri';

  @override
  String get player => 'Oyuncu';

  @override
  String get container => 'Konteyner';

  @override
  String get bitrate => 'Bit hızı';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Çözünürlük';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodlayıcı';

  @override
  String get videoBitrate => 'Video Bit Hızı';

  @override
  String get track => 'İzlemek';

  @override
  String get channels => 'Kanallar';

  @override
  String get audioBitrate => 'Ses Bit Hızı';

  @override
  String get sampleRate => 'Örnek Hızı';

  @override
  String get format => 'Biçim';

  @override
  String get external => 'Harici';

  @override
  String get embedded => 'Gömülü';

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
      'Uygulama içi EPUB oluşturma henüz bu platformda mevcut değil.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Gömülü belge oluşturma bu platformda kullanılamıyor.';

  @override
  String get couldNotOpenExternalViewer => 'Harici görüntüleyici açılamadı.';

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
      'Henüz yer işareti yok.\nKonumunuzu kaydetmek için okurken yer imi simgesine dokunun.';

  @override
  String get noTableOfContentsAvailable => 'İçindekiler tablosu mevcut değil';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Konum';

  @override
  String get bookReader => 'Kitap Okuyucu';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Güncelleniyor...';

  @override
  String get markUnread => 'Okunmadı Olarak İşaretle';

  @override
  String get markAsRead => 'Okundu Olarak İşaretle';

  @override
  String get reloadReader => 'Reader\'ı Yeniden Yükle';

  @override
  String get noPagesFound => 'Hiçbir sayfa bulunamadı.';

  @override
  String get failedToDecodePageImage => 'Sayfa görüntüsünün kodu çözülemedi.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Tek Sayfa';

  @override
  String get twoPageSpread => 'İki Sayfaya Yayılmış';

  @override
  String get addBookmark => 'Yer İşareti Ekle';

  @override
  String get bookmarksEllipsis => 'Yer imleri...';

  @override
  String get markedAsRead => 'Okundu olarak işaretlendi';

  @override
  String get markedAsUnread => 'Okunmadı olarak işaretlendi';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistem';

  @override
  String get themeLight => 'Tema: Işık';

  @override
  String get themeDark => 'Tema: Karanlık';

  @override
  String get themeSepia => 'Tema: Sepya';

  @override
  String get invertColorsFixedLayout => 'Renkleri Ters Çevir (sabit düzen)';

  @override
  String get invertColorsPdf => 'Renkleri Tersine Çevir (PDF)';

  @override
  String get preparingInAppReader => 'Uygulama içi okuyucu hazırlanıyor...';

  @override
  String get pdfDataNotAvailable => 'PDF verileri mevcut değil.';

  @override
  String get readerFallbackModeActive => 'Okuyucu geri dönüş modu etkin';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Desteklenen bir platform hedefine (Android, iOS, macOS) geçtikten sonra Reader\'ı Yeniden Yükle\'yi kullanın.';

  @override
  String get openExternally => 'Dışarıdan Aç';

  @override
  String get noEpubChaptersFound => 'EPUB bölümü bulunamadı.';

  @override
  String get readerNotReady => 'Okuyucu hazır değil.';

  @override
  String get seriesRecordings => 'Dizi Kayıtları';

  @override
  String get now => 'Şimdi';

  @override
  String get sports => 'Spor';

  @override
  String get news => 'Haberler';

  @override
  String get kids => 'Çocuklar';

  @override
  String get premiere => 'Prömiyer';

  @override
  String get guideTimeline => 'Kılavuz Zaman Çizelgesi';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Hiçbir kanal bulunamadı';

  @override
  String get liveBadge => 'CANLI';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Favori kanallardan kaldırıldı';

  @override
  String get addedToFavoriteChannels => 'Favori kanallara eklendi';

  @override
  String get failedToUpdateFavoriteChannel => 'Favori kanal güncellenemedi';

  @override
  String get unfavoriteChannel => 'Kanalı Favorilerden Çıkar';

  @override
  String get favoriteChannel => 'Favori Kanal';

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
  String get watch => 'Kol saati';

  @override
  String get close => 'Kapalı';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Kayıtlar yüklenemedi';

  @override
  String get scheduledInNext24Hours => 'Önümüzdeki 24 Saat İçinde Planlandı';

  @override
  String get recentRecordings => 'Son Kayıtlar';

  @override
  String get tvSeries => 'TV dizisi';

  @override
  String get failedToLoadSchedule => 'Program yüklenemedi';

  @override
  String get noScheduledRecordings => 'Planlanmış kayıt yok';

  @override
  String get cancelRecording => 'Kayıt İptal Edilsin mi?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'HAYIR';

  @override
  String get yesCancel => 'Evet, İptal';

  @override
  String get failedToCancelRecording => 'Kayıt iptal edilemedi';

  @override
  String get failedToLoadSeriesRecordings => 'Seri kayıtları yüklenemedi';

  @override
  String get noSeriesRecordings => 'Dizi kaydı yok';

  @override
  String get cancelSeriesRecording => 'Seri Kaydı İptal Et';

  @override
  String get cancelSeriesRecordingQuestion => 'Seri Kaydı İptal Edilsin mi?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Dizi kaydı iptal edilemedi';

  @override
  String get searchThisLibrary => 'Bu kütüphaneyi arayın...';

  @override
  String get searchEllipsis => 'Aramak...';

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
  String get seerrAccountType => 'Seerr Hesap Türü';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Yerel';

  @override
  String get savedMedia => 'Kayıtlı Medya';

  @override
  String get tvShows => 'TV Programları';

  @override
  String get music => 'Müzik';

  @override
  String get musicAlbums => 'Müzik Albümleri';

  @override
  String get noMediaInFilter => 'Bu filtrede medya yok';

  @override
  String get noDownloadedMediaYet => 'Henüz indirilmiş medya yok';

  @override
  String get browseLibrary => 'Kütüphaneye Göz Atın';

  @override
  String get deleteDownload => 'İndirmeyi Sil';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Albüm';

  @override
  String get playAlbum => 'Albümü Çal';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Mevsim';

  @override
  String get errorLoadingEpisodes => 'Bölümler yüklenirken hata oluştu';

  @override
  String get noDownloadedEpisodes => 'İndirilen bölüm yok';

  @override
  String get deleteEpisode => 'Bölümü Sil';

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
  String get seriesNotFound => 'Seri bulunamadı';

  @override
  String get errorLoadingSeries => 'Seri yüklenirken hata oluştu';

  @override
  String get downloadedEpisodes => 'İndirilen Bölümler';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Özel ürünler';

  @override
  String get deleteSeason => 'Sezonu Sil';

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
  String get storageManagement => 'Depolama Yönetimi';

  @override
  String get storageBreakdown => 'Depolama Dağılımı';

  @override
  String get downloadedItems => 'İndirilen Öğeler';

  @override
  String get storageLimit => 'Depolama Sınırı';

  @override
  String get noLimit => 'Sınır yok';

  @override
  String get deleteAllDownloads => 'Tüm İndirilenleri Sil';

  @override
  String get deleteAllDownloadsWarning =>
      'Bu, indirilen tüm medya dosyalarını kaldıracaktır ve bu işlem geri alınamaz.';

  @override
  String get deleteAll => 'Tümünü Sil';

  @override
  String get deleteSelected => 'Seçileni Sil';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Müzik ve Sesli Kitaplar';

  @override
  String get images => 'Görseller';

  @override
  String get database => 'Veritabanı';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Ayarlar';

  @override
  String get authentication => 'Kimlik doğrulama';

  @override
  String get autoLoginServerManagement => 'Otomatik giriş, sunucu yönetimi';

  @override
  String get pinCode => 'PIN Kodu';

  @override
  String get setUpPinCodeProtection => 'PIN kodu korumasını ayarlama';

  @override
  String get parentalControls => 'Ebeveyn Denetimleri';

  @override
  String get contentRatingRestrictions => 'İçerik derecelendirme kısıtlamaları';

  @override
  String get bitRateResolutionBehavior => 'Bit hızı, çözünürlük, davranış';

  @override
  String get languageSizeAppearance => 'Dil, boyut, görünüm';

  @override
  String get qualityStorage => 'Kalite, depolama';

  @override
  String get serverSyncAndPluginStatus =>
      'Sunucu senkronizasyonu ve eklenti durumu';

  @override
  String get mediaRequestIntegration => 'Medya isteği entegrasyonu';

  @override
  String get switchServer => 'Sunucuyu Değiştir';

  @override
  String get signOut => 'Oturumu Kapat';

  @override
  String get versionLicenses => 'Sürüm, lisanslar';

  @override
  String get account => 'Hesap';

  @override
  String get signInAndSecurity => 'Oturum açma ve güvenlik';

  @override
  String get administration => 'Yönetim';

  @override
  String get serverSettingsUsersLibraries =>
      'Sunucu ayarları, kullanıcılar, kitaplıklar';

  @override
  String get customization => 'Özelleştirme';

  @override
  String get themeAndLayout => 'Tema ve düzen';

  @override
  String get videoAndSubtitles => 'Video ve altyazılar';

  @override
  String get integrations => 'Entegrasyonlar';

  @override
  String get pluginAndRequests => 'Eklenti ve istekler';

  @override
  String get customizeAccountPlaybackInterface =>
      'Hesabı, oynatmayı ve arayüz davranışını özelleştirin';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Tema ve Görünüm';

  @override
  String get focusBorderColor => 'Odak Kenarlığı Rengi';

  @override
  String get watchedIndicators => 'İzlenen Göstergeler';

  @override
  String get always => 'Her zaman';

  @override
  String get hideUnwatched => 'İzlenmeyenleri Gizle';

  @override
  String get episodesOnly => 'Yalnızca Bölümler';

  @override
  String get never => 'Asla';

  @override
  String get focusExpansionAnimation => 'Odak Genişletme Animasyonu';

  @override
  String get desktopUiScale => 'Masaüstü Kullanıcı Arayüzü Ölçeği';

  @override
  String get scaleFocusedCards =>
      'Ölçek odaklı veya fareyle üzerine gelinen kartlar ve kutucuklar';

  @override
  String get backgroundBackdrops => 'Arka Plan Arka Planları';

  @override
  String get showBackdropImages =>
      'İçeriğin arkasındaki arka plan resimlerini göster';

  @override
  String get seriesThumbnails => 'Seri Küçük Resimleri';

  @override
  String get seriesThumbnailsDescription =>
      'Yalnızca bölümler: her satır görüntü türüyle eşleşen seri resimlerini kullanın';

  @override
  String get homeRowInfoOverlay => 'Ana Sayfa Satır Bilgi Yer Paylaşımı';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Ana satırlara göz atarken başlığı ve meta verileri göster';

  @override
  String get clockDisplay => 'Saat Göstergesi';

  @override
  String get inMenus => 'Menülerde';

  @override
  String get inVideo => 'Videoda';

  @override
  String get seasonalEffects => 'Mevsim Etkileri';

  @override
  String get seasonalEffectsDescription =>
      'Görsel efektler ve mevsimsel dekorasyonlar';

  @override
  String get snow => 'Kar';

  @override
  String get fireworks => 'havai fişek';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Düşen Yapraklar';

  @override
  String get themeMusic => 'Tema Müziği';

  @override
  String get playThemeMusicOnDetailPages =>
      'Detay sayfalarında tema müziği çalın';

  @override
  String get themeMusicVolume => 'Tema Müziği Sesi';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Ana Sayfalarda Tema Müziği';

  @override
  String get playWhenBrowsingHomeScreen => 'Ana ekrana göz atarken oynat';

  @override
  String get detailsBackgroundBlur => 'Ayrıntılar Arka Plan Bulanıklığı';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Arka Plan Bulanıklığına Göz Atılıyor';

  @override
  String get maxStreamingBitrate => 'Maksimum Akış Bit Hızı';

  @override
  String get maxResolution => 'Maksimum Çözünürlük';

  @override
  String get playerZoomMode => 'Oyuncu Yakınlaştırma Modu';

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
  String get fit => 'Yerleştirmek';

  @override
  String get autoCrop => 'Otomatik Kırpma';

  @override
  String get stretch => 'Uzatmak';

  @override
  String get refreshRateSwitching => 'Yenileme Hızı Değiştirme';

  @override
  String get disabled => 'Engelli';

  @override
  String get scaleOnTv => 'TV\'de ölçeklendirin';

  @override
  String get scaleOnDevice => 'Cihazda Ölçeklendir';

  @override
  String get trickPlay => 'Hile Oyunu';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Arama yaparken önizleme küçük resimlerini göster';

  @override
  String get showDescriptionOnPause => 'Duraklatıldığında Açıklamayı Göster';

  @override
  String get dimVideoShowOverview =>
      'Duraklatıldığında videoyu karartın ve genel bakış metnini gösterin';

  @override
  String get osdLockButton => 'OSD Kilit Düğmesi';

  @override
  String get osdLockButtonDescription =>
      'Uzun basılana kadar dokunma girişini engelleyen bir kilitleme düğmesi göster';

  @override
  String get audioBehavior => 'Ses Davranışı';

  @override
  String get downmixToStereo => 'Stereo\'ya Downmix';

  @override
  String get defaultAudioLanguage => 'Varsayılan Ses Dili';

  @override
  String get autoServerDefault => 'Otomatik (Sunucu Varsayılanı)';

  @override
  String get english => 'İngilizce';

  @override
  String get spanish => 'İspanyol';

  @override
  String get french => 'Fransızca';

  @override
  String get german => 'Almanca';

  @override
  String get italian => 'İtalyan';

  @override
  String get portuguese => 'Portekizce';

  @override
  String get japanese => 'Japonca';

  @override
  String get korean => 'Korece';

  @override
  String get chinese => 'Çince';

  @override
  String get russian => 'Rusça';

  @override
  String get arabic => 'Arapça';

  @override
  String get hindi => 'Hintçe';

  @override
  String get dutch => 'Flemenkçe';

  @override
  String get swedish => 'İsveççe';

  @override
  String get norwegian => 'Norveççe';

  @override
  String get danish => 'Danimarka';

  @override
  String get finnish => 'Fince';

  @override
  String get polish => 'Lehçe';

  @override
  String get ac3Passthrough => 'AC3 Geçişi';

  @override
  String get dtsPassthrough => 'DTS Geçişi';

  @override
  String get trueHdSupport => 'TrueHD Desteği';

  @override
  String get enableDtsPassthrough =>
      'Bit akışı DTS sesi yalnızca AVR\'ye; alıcı desteği ve DTS kaynak izi gerektirir';

  @override
  String get enableTrueHdAudio =>
      'TrueHD sesi etkinleştirin (tüm platformlarda çalışmayabilir)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeDescription =>
      'Choose how audio is decoded. AVR Passthrough sends raw Dolby/DTS streams to your receiver; Auto or Downmix decodes locally.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Select the target format to transcode multi-channel audio when the source stream cannot be direct-played or passed through.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Auto Detect\n(Recommended)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Default)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Lossless)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo Only)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efficient)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Lossless)';

  @override
  String get settingsMaxAudioChannels => 'Max Audio Channels';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configure the maximum channels of your audio setup. Multichannel streams exceeding this limit will downmix or transcode.';

  @override
  String get settingsMaxAudioChannelsAuto => 'Auto Detect\n(Hardware Default)';

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
  String get nightMode => 'Gece Modu';

  @override
  String get compressDynamicRange => 'Dinamik aralığı sıkıştır';

  @override
  String get advancedMpv => 'Gelişmiş mpv';

  @override
  String get enableCustomMpvConf => 'Özel mpv.conf\'u Etkinleştir';

  @override
  String get applyMpvConfBeforePlayback =>
      'Oynatma başlamadan önce kullanıcı tarafından belirlenen bir mpv.conf uygulayın';

  @override
  String get unsafeAdvancedMpvOptions =>
      'Güvenli Olmayan Gelişmiş mpv Seçenekleri';

  @override
  String get unsafeMpvOptionsDescription =>
      'Daha geniş bir mpv seçenek kümesine izin verin. Oynatma davranışını bozabilir.';

  @override
  String get hardwareDecoding => 'Donanım kod çözme';

  @override
  String get hardwareDecodingSubtitle =>
      'Performansı artırabilir ancak bazı cihazlarda oynatma sorunlarına neden olabilir.';

  @override
  String get nextUpAndQueuing => 'Sonraki İşlem ve Sıraya Alma';

  @override
  String get nextUpDisplay => 'Sonraki Davranış';

  @override
  String get extended => 'Uzatılmış';

  @override
  String get minimal => 'Asgari';

  @override
  String get nextUpTimeout => 'Sonraki Çalışma Zaman Aşımı';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Medya Kuyruğa Alma';

  @override
  String get autoQueueNextEpisodes =>
      'Sonraki bölümleri otomatik olarak sıraya koy';

  @override
  String get stillWatchingPrompt => 'Hala İstemi İzliyorum';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Devam Et ve Atla';

  @override
  String get resumeRewind => 'Geri Sarmaya Devam Et';

  @override
  String get unpauseRewind => 'Geri Sarmayı Duraklat';

  @override
  String get fiveSeconds => '5 saniye';

  @override
  String get tenSeconds => '10 saniye';

  @override
  String get fifteenSeconds => '15 saniye';

  @override
  String get thirtySeconds => '30 saniye';

  @override
  String get skipBackLength => 'Geri Uzunluğu Atla';

  @override
  String get skipForwardLength => 'İleri Uzunluğu Atla';

  @override
  String get customMpvConfPath => 'Özel mpv.conf Yolu';

  @override
  String get notSetMpvConf =>
      'Ayarlanmadı. Moonfin, uygulama/veri klasörlerinde varsayılan bir mpv.conf dosyasını deneyecektir.';

  @override
  String get selectMpvConf => 'mpv.conf\'u seçin';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stil ayarları (boyut, renk, ofset) metin tabanlı altyazılara (SRT, VTT, TTML) uygulanır. ASS/SSA altyazıları, \"ASS/SSA Direct Play\" kapatılmadığı sürece kendi gömülü stillerini kullanır. Bitmap altyazıları (PGS, DVB, VobSub) yeniden biçimlendirilemez.';

  @override
  String get defaultSubtitleLanguage => 'Varsayılan Altyazı Dili';

  @override
  String get defaultToNoSubtitles => 'Varsayılan olarak Altyazı Yok';

  @override
  String get turnOffSubtitlesByDefault => 'Altyazıları varsayılan olarak kapat';

  @override
  String get subtitleSize => 'Altyazı Boyutu';

  @override
  String get textFillColor => 'Metin Dolgu Rengi';

  @override
  String get backgroundColor => 'Arka Plan Rengi';

  @override
  String get textStrokeColor => 'Metin Kontur Rengi';

  @override
  String get subtitleCustomization => 'Altyazı Özelleştirme';

  @override
  String get subtitleCustomizationDescription =>
      'Altyazı görünümünü özelleştirin';

  @override
  String get subtitlePreviewText =>
      'Hızlı kahverengi tilki tembel köpeğin üzerinden atlıyor';

  @override
  String get verticalOffset => 'Dikey Ofset';

  @override
  String get pgsDirectPlay => 'PGS Doğrudan Oynatma';

  @override
  String get directPlayPgsSubtitles => 'Doğrudan oynatılan PGS altyazıları';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Doğrudan Oynatma';

  @override
  String get directPlayAssSsaSubtitles =>
      'Doğrudan oynatılan ASS/SSA altyazıları';

  @override
  String get white => 'Beyaz';

  @override
  String get black => 'Siyah';

  @override
  String get yellow => 'Sarı';

  @override
  String get green => 'Yeşil';

  @override
  String get cyan => 'Camgöbeği';

  @override
  String get red => 'Kırmızı';

  @override
  String get transparent => 'Şeffaf';

  @override
  String get semiTransparentBlack => 'Yarı şeffaf Siyah';

  @override
  String get global => 'Küresel';

  @override
  String get desktop => 'Masaüstü';

  @override
  String get mobile => 'Mobil';

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
  String get customizationProfile => 'Özelleştirme Profili';

  @override
  String get customizationProfileDescription =>
      'Yüklenecek, düzenlenecek ve senkronize edilecek profili seçin. Global, bir cihaz profili onu geçersiz kılmadığı sürece her yerde geçerlidir. Yeşil nokta mevcut cihaz profilinizi işaretler.';

  @override
  String get loadProfile => 'Profili Yükle';

  @override
  String get syncing => 'Senkronize ediliyor...';

  @override
  String get syncToProfile => 'Profile Senkronizasyon';

  @override
  String get profileSyncHidden => 'Profil Senkronizasyonu Gizli';

  @override
  String get enablePluginSyncDescription =>
      'Profil kontrollerini burada göstermek için Eklenti ayarlarında Sunucu Eklenti Senkronizasyonunu etkinleştirin.';

  @override
  String get quality => 'Kalite';

  @override
  String get defaultDownloadQuality => 'Varsayılan İndirme Kalitesi';

  @override
  String get network => 'Ağ';

  @override
  String get wifiOnlyDownloads => 'Yalnızca WiFi İndirmeleri';

  @override
  String get onlyDownloadOnWifi => 'Yalnızca Wi-Fi\'ye bağlanıldığında indir';

  @override
  String get storage => 'Depolamak';

  @override
  String get storageUsed => 'Kullanılan Depolama';

  @override
  String get manage => 'Üstesinden gelmek';

  @override
  String get calculating => 'Hesaplanıyor...';

  @override
  String get downloadLocation => 'İndirme Konumu';

  @override
  String get defaultLabel => 'Varsayılan';

  @override
  String get saveToDownloadsFolder => 'İndirilenler klasörüne kaydet';

  @override
  String get downloadsVisibleToOtherApps =>
      'İndirilenler/Moonfin — diğer uygulamalar tarafından görülebilir';

  @override
  String get dangerZone => 'Tehlikeli Bölge';

  @override
  String get clearAllDownloads => 'Tüm İndirilenleri Temizle';

  @override
  String get original => 'Orijinal';

  @override
  String get changeDownloadLocation => 'İndirme Konumunu Değiştir';

  @override
  String get changeDownloadLocationDescription =>
      'Yeni indirilenler seçilen klasöre kaydedilecektir. Mevcut indirilenler mevcut konumlarında kalacak ve Depolama ayarlarından yönetilebilecek.';

  @override
  String get confirm => 'Onaylamak';

  @override
  String get cannotWriteToFolder =>
      'Seçilen klasöre yazılamıyor. Lütfen farklı bir konum seçin veya depolama izinleri verin.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'İndirilenler klasörüne kaydedilsin mi?';

  @override
  String get saveToDownloadsFolderDescription =>
      'İndirilen medya cihazınızda İndirilenler/Moonfin klasörüne kaydedilecektir. Bu dosyalar galeriniz veya müzik çalarınız gibi diğer uygulamalar tarafından görülebilecektir.\n\nMevcut indirilenler mevcut konumlarında kalacaktır.';

  @override
  String get enable => 'Olanak vermek';

  @override
  String get clearAllDownloadsWarning =>
      'Bu, indirilen tüm medyayı silecektir ve bu işlem geri alınamaz.';

  @override
  String get clearAll => 'Tümünü Temizle';

  @override
  String get navigationStyle => 'Gezinme Stili';

  @override
  String get topBar => 'Üst Çubuk';

  @override
  String get leftSidebar => 'Sol Kenar Çubuğu';

  @override
  String get showShuffleButton => 'Karıştır Düğmesini Göster';

  @override
  String get showGenresButton => 'Türleri Göster Düğmesi';

  @override
  String get showFavoritesButton => 'Favorileri Göster Düğmesi';

  @override
  String get showLibrariesInToolbar => 'Kitaplıkları Araç Çubuğunda Göster';

  @override
  String get showSeerrButton => 'Show Seerr Button';

  @override
  String get navbarOpacity => 'Gezinti Çubuğunun Opaklığı';

  @override
  String get navbarColor => 'Gezinti Çubuğu Rengi';

  @override
  String get gray => 'Gri';

  @override
  String get darkBlue => 'Koyu Mavi';

  @override
  String get purple => 'Mor';

  @override
  String get teal => 'turkuaz';

  @override
  String get navy => 'Donanma';

  @override
  String get charcoal => 'Kömür';

  @override
  String get brown => 'Kahverengi';

  @override
  String get darkRed => 'Koyu Kırmızı';

  @override
  String get darkGreen => 'Koyu Yeşil';

  @override
  String get slate => 'Arduvaz';

  @override
  String get indigo => 'Çivit mavisi';

  @override
  String get libraryDisplay => 'Kütüphane Gösterimi';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Küçük resim';

  @override
  String get bannerLabel => 'Afiş';

  @override
  String get overridePerLibrarySettings =>
      'Kitaplık Başına Ayarları Geçersiz Kıl';

  @override
  String get applyImageTypeToAllLibraries =>
      'Görüntü türünü tüm kitaplıklara uygula';

  @override
  String get multiServerLibraries => 'Çoklu Sunucu Kitaplıkları';

  @override
  String get showLibrariesFromAllServers =>
      'Bağlı tüm sunuculardaki kitaplıkları göster';

  @override
  String get enableFolderView => 'Klasör Görünümünü Etkinleştir';

  @override
  String get showFolderBrowsingOption => 'Klasöre göz atma seçeneğini göster';

  @override
  String get libraryVisibility => 'Kütüphane Görünürlüğü';

  @override
  String get libraryVisibilityDescription =>
      'Kitaplık başına ana sayfa görünürlüğünü değiştirin. Değişikliklerin etkili olması için Moonfin yeniden başlatın.';

  @override
  String get showInNavigation => 'Gezinmede göster';

  @override
  String get showInLatestMedia => 'En son medyada göster';

  @override
  String get sourceLibraries => 'Kaynak Kitaplıkları';

  @override
  String get sourceCollections => 'Kaynak Koleksiyonları';

  @override
  String get excludedGenres => 'Hariç Tutulan Türler';

  @override
  String get selectAll => 'Tümünü Seç';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Medya Çubuğu';

  @override
  String get mediaSources => 'Medya Kaynakları';

  @override
  String get behavior => 'Davranış';

  @override
  String get seconds => 'saniye';

  @override
  String get localPreviews => 'Yerel Önizlemeler';

  @override
  String get localPreviewsDescription =>
      'Fragmanı, medyayı ve ses önizlemelerini yapılandırın.';

  @override
  String get mediaBarMode => 'Medya Cubugu Stili';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD arasindan secin veya medya cubugunu kapatin';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Kapali';

  @override
  String get enableMediaBar => 'Medya Çubuğunu Etkinleştir';

  @override
  String get showFeaturedContentSlideshow =>
      'Öne çıkan içerik slayt gösterisini evde göster';

  @override
  String get contentType => 'İçerik Türü';

  @override
  String get moviesAndTvShows => 'Filmler ve TV Programları';

  @override
  String get moviesOnly => 'Yalnızca Filmler';

  @override
  String get tvShowsOnly => 'Yalnızca TV Programları';

  @override
  String get itemCount => 'Öğe Sayısı';

  @override
  String get noneSelected => 'Hiçbiri seçilmedi';

  @override
  String get noneExcluded => 'Hiçbiri hariç tutulmadı';

  @override
  String get autoAdvance => 'Otomatik İlerleme';

  @override
  String get autoAdvanceSlides => 'Otomatik olarak sonraki slayta geç';

  @override
  String get autoAdvanceInterval => 'Otomatik İlerleme Aralığı';

  @override
  String get trailerPreview => 'Fragman Önizlemesi';

  @override
  String get autoPlayTrailers =>
      'Fragmanları medya çubuğunda 3 saniye sonra otomatik oynat';

  @override
  String get episodePreview => 'Bölüm Önizlemesi';

  @override
  String get mediaPreview => 'Medya Önizlemesi';

  @override
  String get episodePreviewDescription =>
      'Odaklanılan, üzerine gelinen veya uzun süre basılan kartlarda 30 saniyelik satır içi önizleme oynatın';

  @override
  String get mediaPreviewDescription =>
      'Odaklanılan, üzerine gelinen veya uzun süre basılan kartlarda 30 saniyelik satır içi önizleme oynatın';

  @override
  String get previewAudio => 'Sesi Önizle';

  @override
  String get enablePreviewAudio =>
      'Fragman ve bölüm önizlemeleri için sesi etkinleştirin';

  @override
  String get latestMedia => 'En Son Medya';

  @override
  String get recentlyReleased => 'Son Çıkanlar';

  @override
  String get myMedia => 'Medyam';

  @override
  String get myMediaSmall => 'Medyam (Küçük)';

  @override
  String get continueWatching => 'İzlemeye Devam Et';

  @override
  String get resumeAudio => 'Sesi Devam Ettir';

  @override
  String get resumeBooks => 'Kitapları Devam Ettir';

  @override
  String get activeRecordings => 'Aktif Kayıtlar';

  @override
  String get playlists => 'Çalma listeleri';

  @override
  String get liveTV => 'Canlı TV';

  @override
  String get homeSections => 'Ana Sayfa Bölümler';

  @override
  String get resetToDefaults => 'Varsayılanlara sıfırla';

  @override
  String get homeRowPosterSize => 'Ana Sayfa Satır Poster Boyutu';

  @override
  String get perRowImageTypeSelection => 'Satır Başına Görüntü Türü Seçimi';

  @override
  String get configureImageTypeForEachRow =>
      'Etkinleştirilen her ana satır için görüntü türünü yapılandırın';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Birleştir İzlemeye Devam Et ve Sıradaki';

  @override
  String get combineBothRows =>
      'Her iki satırı tek bir ana bölümde birleştirin';

  @override
  String get fullScreenRows => 'Expanded Home Rows';

  @override
  String get fullScreenRowsDescription => 'Limit home rows to 1 row per screen';

  @override
  String get perRowImageType => 'Satır Başına Görüntü Türü';

  @override
  String get perRowSettings => 'Satır Başına Ayarlar';

  @override
  String get autoLogin => 'Otomatik Giriş';

  @override
  String get lastUser => 'Son Kullanıcı';

  @override
  String get currentUser => 'Current User';

  @override
  String get alwaysAuthenticate => 'Daima Kimlik Doğrula';

  @override
  String get requirePasswordWithToken => 'Saklanan jetonla bile şifre iste';

  @override
  String get confirmExit => 'Çıkışı Onayla';

  @override
  String get showConfirmationBeforeExiting => 'Çıkmadan önce onayı göster';

  @override
  String get blockContentWithRatings =>
      'Aşağıdaki derecelendirmelere sahip içeriği engelleyin:';

  @override
  String get noContentRatingsFound =>
      'Bu sunucuda henüz içerik derecelendirmesi bulunamadı.';

  @override
  String get couldNotLoadServerRatings =>
      'Sunucu derecelendirmeleri yüklenemedi. Yalnızca kayıtlı derecelendirmeler gösteriliyor.';

  @override
  String get couldNotRefreshRatings =>
      'Sunucudan derecelendirmeler yenilenemedi. Kaydedilen derecelendirmeler gösteriliyor.';

  @override
  String get enablePinCode => 'PIN Kodunu Etkinleştir';

  @override
  String get requirePinToAccess => 'Hesabınıza erişmek için PIN isteyin';

  @override
  String get changePin => 'PIN\'i değiştir';

  @override
  String get setNewPinCode => 'Yeni bir PIN kodu belirleyin';

  @override
  String get removePin => 'PIN\'i kaldır';

  @override
  String get removePinProtection => 'PIN kodu korumasını kaldır';

  @override
  String get screensaver => 'Ekran koruyucusu';

  @override
  String get inAppScreensaver => 'Uygulama İçi Ekran Koruyucu';

  @override
  String get enableBuiltInScreensaver =>
      'Yerleşik ekran koruyucuyu etkinleştirin';

  @override
  String get mode => 'Mod';

  @override
  String get libraryArt => 'Kütüphane Sanatı';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Saat';

  @override
  String get timeout => 'Zaman aşımı';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Karartma Seviyesi';

  @override
  String get maxAgeRating => 'Maksimum Yaş Derecelendirmesi';

  @override
  String get any => 'Herhangi';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Yaş Derecelendirmesi Gerektir';

  @override
  String get onlyShowRatedContent =>
      'Yalnızca derecelendirilmiş içeriği göster';

  @override
  String get showClock => 'Saati Göster';

  @override
  String get displayClockDuringScreensaver =>
      'Ekran koruyucu sırasında saati göster';

  @override
  String get clockModeStatic => 'Static';

  @override
  String get clockModeBouncing => 'Bouncing';

  @override
  String get rottenTomatoesCritics => 'Çürük Domates (Eleştirmenler)';

  @override
  String get rottenTomatoesAudience => 'Çürük Domates (Seyirci)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritik';

  @override
  String get metacriticUser => 'Metacritic (Kullanıcı)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Posta kutusu';

  @override
  String get myAnimeList => 'AnimeListem';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Topluluk Derecelendirmesi';

  @override
  String get ratings => 'Derecelendirmeler';

  @override
  String get additionalRatings => 'Ek Derecelendirmeler';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList ve TMDB derecelendirmelerini göster';

  @override
  String get ratingLabels => 'Derecelendirme Etiketleri';

  @override
  String get showLabelsNextToIcons =>
      'Derecelendirme simgelerinin yanında etiketleri göster';

  @override
  String get ratingBadges => 'Derecelendirme Rozetleri';

  @override
  String get showDecorativeBadges =>
      'Derecelendirmelerin arkasında dekoratif rozetler göster';

  @override
  String get episodeRatings => 'Bölüm Derecelendirmeleri';

  @override
  String get showRatingsOnEpisodes =>
      'Ayrı bölümlerdeki derecelendirmeleri göster';

  @override
  String get ratingSources => 'Derecelendirme Kaynakları';

  @override
  String get ratingSourcesDescription =>
      'Uygulama genelinde gösterilen derecelendirme kaynaklarını etkinleştirin ve yeniden sıralayın';

  @override
  String get pluginLabel => 'Eklenti';

  @override
  String get pluginDetected => 'Eklenti Algılandı';

  @override
  String get pluginNotDetected => 'Eklenti Algılanmadı';

  @override
  String get pluginDetectedDescription =>
      'Sunucu eklentisi algılandı. Eklenti ilk bulunduğunda senkronizasyon otomatik olarak etkinleştirilir.';

  @override
  String get pluginNotDetectedDescription =>
      'Sunucu eklentisi şu anda algılanmıyor. Yerel ayarlar hâlâ kayıtlı değerlerini veya yerleşik varsayılanları kullanır.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Mevcut Hizmetler';

  @override
  String get serverPluginSync => 'Sunucu Eklenti Senkronizasyonu';

  @override
  String get syncSettingsWithPlugin =>
      'Ayarları sunucu eklentisiyle senkronize edin';

  @override
  String get whatSyncControls => 'Hangi senkronizasyon kontrolleri';

  @override
  String get syncControlsDescription =>
      'Senkronizasyon yalnızca eklenti destekli ayarların sunucuya aktarılıp aktarılmayacağını ve sunucudan çekilip çekilmeyeceğini kontrol eder. Profil seçimi ve profil senkronizasyon işlemleri, eklenti senkronizasyonu etkinleştirildiğinde Özelleştirme ayarlarında bulunur.';

  @override
  String get recentRequests => 'Son İstekler';

  @override
  String get recentlyAdded => 'Son Eklenenler';

  @override
  String get trending => 'Trend olan';

  @override
  String get popularMovies => 'Popüler Filmler';

  @override
  String get movieGenres => 'Film Türleri';

  @override
  String get upcomingMovies => 'Gelecek Filmler';

  @override
  String get studios => 'Stüdyolar';

  @override
  String get popularSeries => 'Popüler Seriler';

  @override
  String get seriesGenres => 'Dizi Türleri';

  @override
  String get upcomingSeries => 'Gelecek Dizi';

  @override
  String get networks => 'Ağlar';

  @override
  String get seerrDiscoveryRows => 'Seerr Discovery Rows';

  @override
  String get resetRowsToDefaults => 'Satırları varsayılanlara sıfırla';

  @override
  String get enableSeerr => 'Seerr\'ı etkinleştir';

  @override
  String get showSeerrInNavigation =>
      'Gezinmede Seerr\'ı göster (sunucu eklentisi gerektirir)';

  @override
  String get seerrUnavailable =>
      'Sunucu eklentisi Seerr desteği devre dışı olduğundan kullanılamıyor.';

  @override
  String get nsfwFilter => 'NSFW Filtresi';

  @override
  String get hideAdultContent =>
      'Sonuçlardaki yetişkinlere uygun içeriği gizle';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Satırları Keşfet';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Yeniden sıralamak için sürükleyin. Satırları etkinleştirin veya devre dışı bırakın. Etkinleştirilen satır sırası, Moonfin eklentisiyle senkronize edilir.';

  @override
  String get discoverRowsDescription =>
      'Yeniden sıralamak için sürükleyin. Satırları etkinleştirin veya devre dışı bırakın.';

  @override
  String get enabled => 'Etkinleştirilmiş';

  @override
  String get hidden => 'Gizlenmiş';

  @override
  String get aboutTitle => 'Hakkında';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Açık Kaynak Lisansları';

  @override
  String get sourceCode => 'Kaynak Kodu';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Güncellemeleri Şimdi Kontrol Edin';

  @override
  String get checksLatestDesktopRelease =>
      'Bu platform için en son masaüstü sürümünü kontrol eder';

  @override
  String get youAreUpToDate => 'Güncelsiniz.';

  @override
  String get couldNotCheckForUpdates =>
      'Güncellemeler şu anda kontrol edilemiyor.';

  @override
  String get noCompatibleUpdate =>
      'Bu platform için uyumlu bir güncelleme paketi bulunamadı.';

  @override
  String get updateChecksNotSupported =>
      'Güncelleme kontrolleri bu platformda desteklenmiyor.';

  @override
  String get updateNotificationsDisabled =>
      'Güncelleme bildirimleri devre dışı bırakıldı.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Tekrar kontrol etmeden önce lütfen bekleyin.';

  @override
  String get latestUpdateAlreadyShown => 'En son güncelleme zaten gösterildi.';

  @override
  String get updateAvailable => 'Güncelleme mevcut.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Bildirimleri Güncelle';

  @override
  String get showWhenUpdatesAvailable =>
      'Güncellemelerin ne zaman mevcut olduğunu göster';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Sürüm Notlarını Okuyun';

  @override
  String get downloadingUpdate => 'Güncelleme indiriliyor...';

  @override
  String get updateDownloadFailed =>
      'Güncelleme indirme işlemi başarısız oldu. Lütfen tekrar deneyin.';

  @override
  String get openReleasesPage => 'Sürümler Sayfasını Aç';

  @override
  String get navigation => 'Navigasyon';

  @override
  String get watchedIndicatorsBackdrops => 'İzlenen göstergeler, arka planlar';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Odaklanma rengi, izlenen göstergeler, arka planlar';

  @override
  String get navbarStyleToolbarAppearance =>
      'Gezinme çubuğu stili, araç çubuğu düğmeleri, görünüm';

  @override
  String get reorderToggleHomeRows =>
      'Ana satırları yeniden sıralayın ve değiştirin';

  @override
  String get featuredContentAppearance => 'Öne çıkan içerik, görünüm';

  @override
  String get posterSizeImageTypeFolderView =>
      'Poster boyutu, resim türü, klasör görünümü';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB ve derecelendirme kaynakları';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Temizlemek';

  @override
  String get browse => 'Göz at';

  @override
  String get noResults => 'Sonuç yok';

  @override
  String get seerrAvailableStatus => 'Mevcut';

  @override
  String get seerrRequestedStatus => 'İstendi';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Seerr Ayarları';

  @override
  String get requestMore => 'Daha Fazla Talep Et';

  @override
  String get request => 'Rica etmek';

  @override
  String get cancelRequest => 'İsteği İptal Et';

  @override
  String get playInMoonfin => 'Moonfin\'da oyna';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Onaylamak';

  @override
  String get declineAction => 'Reddetmek';

  @override
  String get similar => 'Benzer';

  @override
  String get recommendations => 'Öneriler';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Kale';

  @override
  String get itemNotFoundInLibrary => 'Öğe Moonfin kitaplığınızda bulunamadı';

  @override
  String get errorSearchingLibrary => 'Kitaplık aranırken hata oluştu';

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
  String get submitRequest => 'Talebi Gönder';

  @override
  String get allSeasons => 'Tüm Mevsimler';

  @override
  String get advancedOptions => 'Gelişmiş Seçenekler';

  @override
  String get noServiceServersConfigured =>
      'Hiçbir hizmet sunucusu yapılandırılmadı';

  @override
  String get server => 'Sunucu';

  @override
  String get qualityProfile => 'Kalite Profili';

  @override
  String get rootFolder => 'Kök Klasör';

  @override
  String get showMore => 'Daha Fazla Göster';

  @override
  String get appearances => 'Görünümler';

  @override
  String get crewSection => 'Mürettebat';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Talep yok';

  @override
  String get pendingStatus => 'Askıda olması';

  @override
  String get declinedStatus => 'Reddedildi';

  @override
  String get partiallyAvailable => 'Kısmen Mevcut';

  @override
  String get downloadingStatus => 'İndiriliyor';

  @override
  String get approvedStatus => 'Onaylı';

  @override
  String get notRequestedStatus => 'Talep Edilmedi';

  @override
  String get blocklistedStatus => 'Engellenenler listesine eklendi';

  @override
  String get deletedStatus => 'Silindi';

  @override
  String get tmdbScore => 'TMDB Puanı';

  @override
  String get releaseDateLabel => 'Yayın tarihi';

  @override
  String get firstAirDateLabel => 'İlk Yayın Tarihi';

  @override
  String get revenueLabel => 'Hasılat';

  @override
  String get runtimeLabel => 'Çalışma zamanı';

  @override
  String get budgetLabel => 'Bütçe';

  @override
  String get originalLanguageLabel => 'Orijinal Dil';

  @override
  String get seasonsLabel => 'Mevsimler';

  @override
  String get episodesLabel => 'Bölümler';

  @override
  String get access => 'Erişim';

  @override
  String get add => 'Eklemek';

  @override
  String get address => 'Adres';

  @override
  String get analytics => 'Analitik';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'İçerik';

  @override
  String get copy => 'Kopyala';

  @override
  String get create => 'Yaratmak';

  @override
  String get disable => 'Devre dışı bırakmak';

  @override
  String get done => 'Tamamlamak';

  @override
  String get edit => 'Düzenlemek';

  @override
  String get encoding => 'Kodlama';

  @override
  String get error => 'Hata';

  @override
  String get forward => 'İleri';

  @override
  String get general => 'Genel';

  @override
  String get go => 'Gitmek';

  @override
  String get install => 'Düzenlemek';

  @override
  String get installed => 'Yüklendi';

  @override
  String get interval => 'Aralık';

  @override
  String get name => 'İsim';

  @override
  String get networking => 'Ağ oluşturma';

  @override
  String get next => 'Sonraki';

  @override
  String get path => 'Yol';

  @override
  String get paused => 'Duraklatıldı';

  @override
  String get permissions => 'İzinler';

  @override
  String get processing => 'İşleme';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'sağlayıcı';

  @override
  String get refresh => 'Yenile';

  @override
  String get remote => 'Uzak';

  @override
  String get rename => 'Yeniden isimlendirmek';

  @override
  String get revoke => 'Geri çekmek';

  @override
  String get role => 'Rol';

  @override
  String get root => 'Kök';

  @override
  String get run => 'Koşmak';

  @override
  String get search => 'Ara';

  @override
  String get select => 'Seçme';

  @override
  String get send => 'Göndermek';

  @override
  String get sessions => 'Oturumlar';

  @override
  String get set => 'Ayarlamak';

  @override
  String get status => 'Durum';

  @override
  String get stop => 'Durmak';

  @override
  String get streaming => 'Akış';

  @override
  String get time => 'Zaman';

  @override
  String get trickplay => 'Hile oyunu';

  @override
  String get uninstall => 'Kaldır';

  @override
  String get up => 'Yukarı';

  @override
  String get update => 'Güncelleme';

  @override
  String get upload => 'Yüklemek';

  @override
  String get unmute => 'Sesini açmak';

  @override
  String get mute => 'Sesini kapatmak';

  @override
  String get branding => 'Markalaşma';

  @override
  String get adminDrawerDashboard => 'Kontrol Paneli';

  @override
  String get adminDrawerAnalytics => 'Analitik';

  @override
  String get adminDrawerSettings => 'Ayarlar';

  @override
  String get adminDrawerBranding => 'Markalaşma';

  @override
  String get adminDrawerUsers => 'Kullanıcılar';

  @override
  String get adminDrawerLibraries => 'Kütüphaneler';

  @override
  String get adminDrawerTranscoding => 'Kod dönüştürme';

  @override
  String get adminDrawerResume => 'Sürdürmek';

  @override
  String get adminDrawerStreaming => 'Akış';

  @override
  String get adminDrawerTrickplay => 'Hile oyunu';

  @override
  String get adminDrawerDevices => 'Cihazlar';

  @override
  String get adminDrawerActivity => 'Etkinlik';

  @override
  String get adminDrawerNetworking => 'Ağ oluşturma';

  @override
  String get adminDrawerApiKeys => 'API Anahtarları';

  @override
  String get adminDrawerBackups => 'Yedeklemeler';

  @override
  String get adminDrawerLogs => 'Günlükler';

  @override
  String get adminDrawerScheduledTasks => 'Zamanlanmış Görevler';

  @override
  String get adminDrawerPlugins => 'Eklentiler';

  @override
  String get adminDrawerRepositories => 'Depolar';

  @override
  String get adminDrawerLiveTv => 'Canlı TV';

  @override
  String get adminExitTooltip => 'Yöneticiden çık';

  @override
  String get adminDashboardLoadFailed => 'Kontrol paneli yüklenemedi';

  @override
  String get adminMediaOverview => 'Medyaya Genel Bakış';

  @override
  String get adminMediaTotalsError => 'Sunucu medya toplamları yüklenemedi.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Bu sunucuda ne kadar içerik olduğuna dair hızlı bir okuma.';

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
  String get analyticsMediaDistribution => 'Medya Dağıtımı';

  @override
  String get analyticsVideoCodecs => 'Video Codec\'leri';

  @override
  String get analyticsAudioCodecs => 'Ses Codec\'leri';

  @override
  String get analyticsContainers => 'Konteynerler';

  @override
  String get analyticsTopGenres => 'En Popüler Türler';

  @override
  String get analyticsReleaseYears => 'Yayın Yılları';

  @override
  String get analyticsContentRatings => 'İçerik Derecelendirmeleri';

  @override
  String get analyticsRuntimeBuckets => 'Çalışma Zamanı Bölümleri';

  @override
  String get analyticsFileFormats => 'Dosya Formatları';

  @override
  String get analyticsNoData => 'Mevcut Veri Yok.';

  @override
  String get adminServerInfo => 'Sunucu Bilgileri';

  @override
  String get adminRestartPending => 'Yeniden Başlatma Beklemede';

  @override
  String get adminServerPaths => 'Sunucu Yolları';

  @override
  String get adminServerActions => 'Sunucu Eylemleri';

  @override
  String get adminRestartServer => 'Sunucuyu Yeniden Başlat';

  @override
  String get adminShutdownServer => 'Sunucuyu Kapat';

  @override
  String get adminScanLibraries => 'Kitaplıkları Tara';

  @override
  String get adminLibraryScanStarted => 'Kitaplık taraması başlatıldı';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Sunucu yeniden başlatma işlemi devam ediyor';

  @override
  String get adminServerRebootMessage =>
      'Sunucu yeniden başlatma işlemi devam ediyor, lütfen yeniden başlatın Moonfin';

  @override
  String get adminActiveSessions => 'Aktif Oturumlar';

  @override
  String get adminSessionsLoadFailed => 'Oturumlar yüklenemedi';

  @override
  String get adminNoActiveSessions => 'Aktif oturum yok';

  @override
  String get adminRecentActivity => 'Son Etkinlik';

  @override
  String get adminNoRecentActivity => 'Yakın zamanda etkinlik yok';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Mesaj Gönder';

  @override
  String get adminMessageTextHint => 'Mesaj metni';

  @override
  String get adminSetVolume => 'Sesi Ayarla';

  @override
  String get sessionPrev => 'Önceki';

  @override
  String get sessionRewind => 'Geri sarma';

  @override
  String get sessionForward => 'İleri';

  @override
  String get sessionNext => 'Sonraki';

  @override
  String get sessionVolumeDown => 'Cilt –';

  @override
  String get sessionVolumeUp => 'Cilt +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Şimdi Oynanıyor';

  @override
  String get volume => 'Hacim';

  @override
  String get actions => 'Eylemler';

  @override
  String get videoCodec => 'Video Codec\'i';

  @override
  String get audioCodec => 'Ses Codec\'i';

  @override
  String get hwAccel => 'Donanım Hızı';

  @override
  String get completion => 'Tamamlama';

  @override
  String get direct => 'Doğrudan';

  @override
  String get adminDisconnect => 'Bağlantıyı kes';

  @override
  String get adminClearDates => 'Tarihleri ​​temizle';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Etkinlik girişi yok';

  @override
  String get adminEditDeviceName => 'Cihaz Adını Düzenle';

  @override
  String get adminCustomName => 'Özel Ad';

  @override
  String get adminDeviceNameUpdated => 'Cihaz adı güncellendi';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Cihazı Sil';

  @override
  String get adminDeviceDeleted => 'Cihaz silindi';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Cihazlar yüklenemedi';

  @override
  String get adminSearchDevices => 'Cihazları arayın';

  @override
  String get adminThisDevice => 'Bu Cihaz';

  @override
  String get adminEditName => 'Adı Düzenle';

  @override
  String get adminLibrariesLoadFailed => 'Kitaplıklar yüklenemedi';

  @override
  String get adminNoLibraries => 'Hiçbir kitaplık yapılandırılmadı';

  @override
  String get adminScanAllLibraries => 'Tüm Kütüphaneleri Tara';

  @override
  String get adminAddLibrary => 'Kitaplık Ekle';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Kitaplığı Yeniden Adlandır';

  @override
  String get adminNewName => 'Yeni isim';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Kitaplığı Sil';

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
  String get adminRemovePath => 'Yolu Kaldır';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Kitaplık seçenekleri kaydedildi';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Kitaplık yüklenemedi';

  @override
  String get adminNoMediaPaths => 'Hiçbir medya yolu yapılandırılmadı';

  @override
  String get adminAddPath => 'Yol Ekle';

  @override
  String get adminBrowseFilesystem => 'Sunucu dosya sistemine göz atın:';

  @override
  String get adminSaveOptions => 'Kaydetme Seçenekleri';

  @override
  String get adminPreferredMetadataLanguage => 'Tercih edilen meta veri dili';

  @override
  String get adminMetadataLanguageHint => 'örneğin tr, de, fr';

  @override
  String get adminMetadataCountryCode => 'Meta veri ülke kodu';

  @override
  String get adminMetadataCountryHint => 'örneğin ABD, Almanya, Fransa';

  @override
  String get adminLibraryNameRequired => 'Kitaplık adı gerekli';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Kütüphane Adı';

  @override
  String get adminSelectedPaths => 'Seçilen Yollar:';

  @override
  String get adminNoPathsAdded => 'Yol eklenmedi (daha sonra eklenebilir)';

  @override
  String get adminCreateLibrary => 'Kitaplık Oluştur';

  @override
  String get paths => 'Yollar:';

  @override
  String get adminDisableUser => 'Kullanıcıyı Devre Dışı Bırak';

  @override
  String get adminEnableUser => 'Kullanıcıyı Etkinleştir';

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
  String get adminUsersLoadFailed => 'Kullanıcılar yüklenemedi';

  @override
  String get adminSearchUsers => 'Kullanıcıları ara';

  @override
  String get adminEditUser => 'Kullanıcıyı Düzenle';

  @override
  String get adminAddUser => 'Kullanıcı Ekle';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Kullanıcı Oluştur';

  @override
  String get adminPasswordOptional => 'Şifre (isteğe bağlı)';

  @override
  String get adminUsernameRequired => 'Kullanıcı adı boş olamaz';

  @override
  String get adminNoProfileChanges => 'Kaydedilecek profil değişikliği yok';

  @override
  String get adminProfileSaved => 'Profil kaydedildi';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'İzinler kaydedildi';

  @override
  String get adminPasswordsMismatch => 'Şifreler eşleşmiyor';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kullanıcı yüklenemedi';

  @override
  String get adminBackToUsers => 'Kullanıcılara Geri Dön';

  @override
  String get adminSaveProfile => 'Profili Kaydet';

  @override
  String get adminDeleteUser => 'Kullanıcıyı Sil';

  @override
  String get admin => 'Yönetici';

  @override
  String get adminFullAccessWarning =>
      'Yöneticilerin sunucuya tam erişimi vardır. Dikkatli bir şekilde verin.';

  @override
  String get administrator => 'Yönetici';

  @override
  String get adminHiddenUser => 'Gizli kullanıcı';

  @override
  String get adminAllowMediaPlayback => 'Medya oynatmaya izin ver';

  @override
  String get adminAllowAudioTranscoding => 'Ses kod dönüştürmesine izin ver';

  @override
  String get adminAllowVideoTranscoding => 'Video kod dönüştürmeye izin ver';

  @override
  String get adminAllowRemuxing => 'Yeniden düzenlemeye izin ver';

  @override
  String get adminForceRemoteTranscoding =>
      'Uzak kaynak kod dönüştürmesini zorla';

  @override
  String get adminAllowContentDeletion => 'İçeriğin silinmesine izin ver';

  @override
  String get adminAllowContentDownloading => 'İçerik indirmeye izin ver';

  @override
  String get adminAllowPublicSharing => 'Herkese açık paylaşıma izin ver';

  @override
  String get adminAllowRemoteControl =>
      'Diğer kullanıcıların uzaktan kontrolüne izin ver';

  @override
  String get adminAllowSharedDeviceControl =>
      'Paylaşılan cihaz kontrolüne izin ver';

  @override
  String get adminAllowRemoteAccess => 'Uzaktan erişime izin ver';

  @override
  String get adminRemoteBitrateLimit => 'Uzak istemci bit hızı sınırı (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Sınırsız olarak boş bırakın';

  @override
  String get adminMaxActiveSessions => 'Maksimum aktif oturum';

  @override
  String get adminAllowLiveTvAccess => 'Canlı TV erişimine izin ver';

  @override
  String get adminAllowLiveTvManagement => 'Canlı TV yönetimine izin ver';

  @override
  String get adminAllowCollectionManagement => 'Koleksiyon yönetimine izin ver';

  @override
  String get adminAllowSubtitleManagement => 'Altyazı yönetimine izin ver';

  @override
  String get adminAllowLyricManagement => 'Şarkı sözü yönetimine izin ver';

  @override
  String get adminSavePermissions => 'İzinleri Kaydet';

  @override
  String get adminEnableAllLibraryAccess =>
      'Tüm kitaplıklara erişimi etkinleştir';

  @override
  String get adminSaveAccess => 'Erişimi Kaydet';

  @override
  String get adminChangePassword => 'Şifre değiştir';

  @override
  String get adminNewPassword => 'Yeni Şifre';

  @override
  String get adminConfirmPassword => 'Şifreyi Onayla';

  @override
  String get adminSetPassword => 'Şifreyi Ayarla';

  @override
  String get adminResetPassword => 'Şifreyi Sıfırla';

  @override
  String get adminPasswordReset => 'Şifre sıfırlama';

  @override
  String get adminPasswordUpdated => 'Şifre güncellendi';

  @override
  String get adminUserSettings => 'Kullanıcı Ayarları';

  @override
  String get adminLibraryAccess => 'Kütüphane Erişimi';

  @override
  String get adminDeviceAndChannelAccess => 'Cihaz ve Kanal Erişimi';

  @override
  String get adminEnableAllDevices => 'Tüm cihazlara erişimi etkinleştirin';

  @override
  String get adminEnableAllChannels => 'Tüm kanallara erişimi etkinleştir';

  @override
  String get adminResetPasswordWarning =>
      'Bu şifreyi kaldıracaktır. Kullanıcı şifreye ihtiyaç duymadan giriş yapabilecektir.';

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
  String get adminCreateApiKey => 'API Anahtarı Oluştur';

  @override
  String get adminAppName => 'Uygulama adı';

  @override
  String get adminApiKeyCreated => 'API Anahtarı Oluşturuldu';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Anahtar başarıyla oluşturuldu. Sunucu jetonu iade etmedi. Sunucu API anahtarlarını kontrol edin.';

  @override
  String get adminKeyCopied => 'Anahtar panoya kopyalandı';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Sunucu yanıtında anahtar belirteci eksik';

  @override
  String get adminRevokeApiKey => 'API Anahtarını İptal Et';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API anahtarı iptal edildi';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API anahtarları yüklenemedi';

  @override
  String get adminApiKeysTitle => 'API Anahtarları';

  @override
  String get adminCreateKey => 'Anahtar Oluştur';

  @override
  String get adminNoApiKeys => 'API anahtarı bulunamadı';

  @override
  String get adminUnknownApp => 'Bilinmeyen Uygulama';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Yedek oluşturuluyor...';

  @override
  String get adminBackupCreated => 'Yedekleme başarıyla oluşturuldu';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'Sunucu yanıtında yedekleme yolu eksik';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Geri Yüklemeyi Onayla';

  @override
  String get adminRestoringBackup => 'Yedekleme geri yükleniyor...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Yedeklemeler yüklenemedi';

  @override
  String get adminCreateBackup => 'Yedekleme Oluştur';

  @override
  String get adminNoBackups => 'Yedek bulunamadı';

  @override
  String get adminViewDetails => 'Ayrıntıları Görüntüle';

  @override
  String get restore => 'Eski haline getirmek';

  @override
  String get adminLogsLoadFailed => 'Sunucu günlükleri yüklenemedi';

  @override
  String get adminNoLogFiles => 'Günlük dosyası bulunamadı';

  @override
  String get adminLogCopied => 'Günlük panoya kopyalandı';

  @override
  String get adminSaveLogFile => 'Günlük dosyasını kaydet';

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
  String get adminSearchInLog => 'Günlükte ara';

  @override
  String get adminNoMatchingLines => 'Eşleşen çizgi yok';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Zamanlanmış görev bulunamadı';

  @override
  String get adminNoTasksMatchFilter => 'Geçerli filtreyle eşleşen görev yok';

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
  String get adminRunNow => 'Şimdi Çalıştır';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Son Yürütme';

  @override
  String get adminTriggers => 'Tetikleyiciler';

  @override
  String get adminAddTrigger => 'Tetikleyici Ekle';

  @override
  String get adminNoTriggers => 'Yapılandırılmış tetikleyici yok';

  @override
  String get adminTriggerType => 'Tetikleyici Türü';

  @override
  String get adminTimeLimit => 'Zaman sınırı (isteğe bağlı)';

  @override
  String get adminNoLimit => 'Sınır yok';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Haftanın günü';

  @override
  String get adminSearchPlugins => 'Eklentileri ara...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Eklentiyi Kaldır';

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
  String get adminNoPluginsMatchSearch => 'Aramanızla eşleşen eklenti yok';

  @override
  String get adminNoPluginsInstalled => 'Hiçbir eklenti yüklü değil';

  @override
  String adminInstallUpdate(String version) {
    return 'Install update (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Failed to load catalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Aramanızla eşleşen paket yok';

  @override
  String get adminNoPackagesAvailable => 'Mevcut paket yok';

  @override
  String get adminExperimentalIntegration => 'Deneysel Entegrasyon';

  @override
  String get adminExperimentalWarning =>
      'Eklenti ayarları entegrasyonu hala deneyseldir. Bazı ayar sayfaları doğru şekilde oluşturulmayabilir.';

  @override
  String get continueAction => 'Devam etmek';

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
      'Ayarlar açılamıyor: Kimlik doğrulama jetonu eksik.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Eklenti bulunamadı';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Eklentiyi Etkinleştir';

  @override
  String get adminPluginSettingsPage => 'Eklenti ayarları sayfası';

  @override
  String get adminRevisionHistory => 'Revizyon Geçmişi';

  @override
  String get adminNoChangelog => 'Değişiklik günlüğü mevcut değil.';

  @override
  String get adminRemoveRepository => 'Depoyu Kaldır';

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
  String get adminRepositoryNameHint => 'örneğin Jellyfin Kararlı';

  @override
  String get adminRepositoryUrl => 'Depo URL\'si';

  @override
  String get adminAddEntry => 'Giriş ekle';

  @override
  String get adminInvalidUrl => 'Geçersiz URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Tarayıcıda Aç';

  @override
  String get adminOpenExternally => 'Harici olarak aç';

  @override
  String get adminGeneralSettings => 'Genel Ayarlar';

  @override
  String get adminServerName => 'Sunucu adı';

  @override
  String get adminPreferredMetadataCountry => 'Tercih edilen meta veri ülkesi';

  @override
  String get adminCachePath => 'Önbellek yolu';

  @override
  String get adminMetadataPath => 'Meta veri yolu';

  @override
  String get adminLibraryScanConcurrency => 'Kitaplık taraması eşzamanlılığı';

  @override
  String get adminParallelImageEncodingLimit =>
      'Paralel görüntü kodlama sınırı';

  @override
  String get adminSlowResponseThreshold => 'Yavaş yanıt eşiği (ms)';

  @override
  String get adminBrandingSaved => 'Markalama ayarları kaydedildi';

  @override
  String get adminBrandingLoadFailed => 'Markalama ayarları yüklenemedi';

  @override
  String get adminLoginDisclaimer => 'Giriş sorumluluk reddi beyanı';

  @override
  String get adminLoginDisclaimerHint =>
      'Giriş formunun altında görüntülenen HTML';

  @override
  String get adminCustomCss => 'Özel CSS';

  @override
  String get adminCustomCssHint => 'Web arayüzüne uygulanan özel CSS';

  @override
  String get adminEnableSplashScreen => 'Açılış ekranını etkinleştir';

  @override
  String get adminStreamingSaved => 'Akış ayarları kaydedildi';

  @override
  String get adminStreamingLoadFailed => 'Akış ayarları yüklenemedi';

  @override
  String get adminStreamingDescription =>
      'Uzak bağlantılar için genel akış bit hızı sınırlarını ayarlayın.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Uzak istemci bit hızı sınırı (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Sınırsız için boş veya 0 bırakın';

  @override
  String get adminPlaybackSaved => 'Oynatma ayarları kaydedildi';

  @override
  String get adminPlaybackLoadFailed => 'Oynatma ayarları yüklenemedi';

  @override
  String get adminPlaybackTranscoding => 'Oynatma / Kod Dönüştürme';

  @override
  String get adminHardwareAcceleration => 'Donanım hızlandırma';

  @override
  String get adminVaapiDevice => 'VA-API cihazı';

  @override
  String get adminEnableHardwareEncoding => 'Donanım kodlamasını etkinleştir';

  @override
  String get adminEnableHardwareDecoding =>
      'Aşağıdakiler için donanım kod çözmeyi etkinleştirin:';

  @override
  String get adminEncodingThreads => 'Kodlama konuları';

  @override
  String get adminAutomatic => '0 = otomatik';

  @override
  String get adminTranscodingTempPath => 'Geçici yolu kod dönüştürme';

  @override
  String get adminEnableFallbackFont => 'Yedek yazı tipini etkinleştir';

  @override
  String get adminFallbackFontPath => 'Geri dönüş yazı tipi yolu';

  @override
  String get adminAllowSegmentDeletion => 'Segmentin silinmesine izin ver';

  @override
  String get adminSegmentKeepSeconds => 'Segment tutma (saniye)';

  @override
  String get adminThrottleBuffering => 'Kısma arabelleğe alma';

  @override
  String get adminTrickplaySaved => 'Trickplay ayarları kaydedildi';

  @override
  String get adminTrickplayLoadFailed => 'Trickplay ayarları yüklenemedi';

  @override
  String get adminEnableHardwareAcceleration =>
      'Donanım hızlandırmayı etkinleştir';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Yalnızca anahtar kare çıkartmayı etkinleştir';

  @override
  String get adminKeyFrameSubtitle => 'Daha hızlı ancak daha düşük doğruluk';

  @override
  String get adminScanBehavior => 'Tarama davranışı';

  @override
  String get adminProcessPriority => 'Süreç önceliği';

  @override
  String get adminImageSettings => 'Görüntü Ayarları';

  @override
  String get adminIntervalMs => 'Aralık (ms)';

  @override
  String get adminCaptureFrameSubtitle =>
      'Çerçevelerin ne sıklıkla yakalanacağı';

  @override
  String get adminWidthResolutions => 'Genişlik çözünürlükleri';

  @override
  String get adminTileWidth => 'Döşeme genişliği';

  @override
  String get adminTileHeight => 'Döşeme yüksekliği';

  @override
  String get adminQualitySubtitle =>
      'Daha düşük değerler = daha iyi kalite, daha büyük dosyalar';

  @override
  String get adminProcessThreads => 'İş parçacıkları';

  @override
  String get adminResumeSaved => 'Kaydedilen ayarları devam ettir';

  @override
  String get adminResumeLoadFailed => 'Özgeçmiş ayarları yüklenemedi';

  @override
  String get adminResumeDescription =>
      'İçeriğin ne zaman kısmen oynatıldı veya tamamen oynatıldı olarak işaretlenmesi gerektiğini yapılandırın.';

  @override
  String get adminMinResumePercentage => 'Minimum devam etme yüzdesi';

  @override
  String get adminMinResumeSubtitle =>
      'İlerlemenin kaydedilmesi için içeriğin bu yüzdeyi aşacak şekilde oynatılması gerekir';

  @override
  String get adminMaxResumePercentage => 'Maksimum devam etme yüzdesi';

  @override
  String get adminMaxResumeSubtitle =>
      'Bu yüzdeden sonra içerik tamamen oynatılmış sayılır';

  @override
  String get adminMinResumeDuration => 'Minimum devam etme süresi (saniye)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Bundan daha kısa öğeler devam ettirilemez';

  @override
  String get adminMinAudiobookResume =>
      'Minimum sesli kitap devam etme yüzdesi';

  @override
  String get adminMaxAudiobookResume =>
      'Maksimum sesli kitap devam ettirme yüzdesi';

  @override
  String get adminNetworkingSaved =>
      'Ağ ayarları kaydedildi. Sunucunun yeniden başlatılması gerekebilir.';

  @override
  String get adminNetworkingLoadFailed => 'Ağ ayarları yüklenemedi';

  @override
  String get adminNetworkingWarning =>
      'Ağ ayarlarında yapılan değişiklikler sunucunun yeniden başlatılmasını gerektirebilir.';

  @override
  String get adminEnableRemoteAccess => 'Uzaktan erişimi etkinleştir';

  @override
  String get ports => 'Limanlar';

  @override
  String get adminHttpPort => 'HTTP bağlantı noktası';

  @override
  String get adminHttpsPort => 'HTTPS bağlantı noktası';

  @override
  String get adminPublicHttpsPort => 'Genel HTTPS bağlantı noktası';

  @override
  String get adminBaseUrl => 'Temel URL';

  @override
  String get adminBaseUrlHint => 'örneğin /jölefin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS\'yi etkinleştir';

  @override
  String get adminLocalNetwork => 'Yerel Ağ';

  @override
  String get adminLocalNetworkAddresses => 'Yerel ağ adresleri';

  @override
  String get adminKnownProxies => 'Bilinen proxy\'ler';

  @override
  String get adminRemoteIpFilter => 'Uzak IP Filtresi';

  @override
  String get adminRemoteIpFilterEntries => 'Uzak IP filtresi';

  @override
  String get adminCertificatePath => 'Sertifika yolu';

  @override
  String get whitelist => 'Beyaz liste';

  @override
  String get blacklist => 'Kara liste';

  @override
  String get notSet => 'Ayarlanmadı';

  @override
  String get adminMetadataSaved => 'Meta veriler kaydedildi';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Meta Verileri Yenile';

  @override
  String get recursive => 'Özyinelemeli';

  @override
  String get adminReplaceAllMetadata => 'Tüm meta verileri değiştir';

  @override
  String get adminReplaceAllImages => 'Tüm resimleri değiştir';

  @override
  String get adminMetadataRefreshRequested => 'Meta veri yenileme istendi';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Uzaktaki Kişiyi Ara';

  @override
  String get adminNoRemoteMatches => 'Uzak eşleşme bulunamadı';

  @override
  String get adminRemoteResults => 'Uzak Sonuçlar';

  @override
  String get adminRemoteMetadataApplied => 'Uzak meta veriler uygulandı';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'İçerik Türünü Güncelle';

  @override
  String get adminContentType => 'İçerik türü';

  @override
  String get adminContentTypeUpdated => 'İçerik türü güncellendi';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Meta veri düzenleyici yüklenemedi';

  @override
  String get adminNoPeopleEntries => 'Kişi girişi yok';

  @override
  String get adminNoExternalIds => 'Harici kimlik yok';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Desteklenmeyen resim formatı';

  @override
  String get adminImageReadFailed => 'Seçilen resim okunamadı';

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
  String get adminAllProviders => 'Tüm sağlayıcılar';

  @override
  String get adminNoRemoteImages => 'Uzak resim bulunamadı';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Ayarlayıcı Ekle';

  @override
  String get adminTunerType => 'Ayarlayıcı Türü';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Diğer';

  @override
  String get adminUrlPath => 'URL / Yol';

  @override
  String get adminNameOptional => 'Ad (isteğe bağlı)';

  @override
  String get adminTunerAdded => 'Ayarlayıcı eklendi';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Rehber Sağlayıcı Ekle';

  @override
  String get adminProviderType => 'Sağlayıcı Türü';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect veya XMLTV';

  @override
  String get adminUsernameOptional => 'Kullanıcı adı (isteğe bağlı)';

  @override
  String get adminRefreshInterval => 'Yenileme aralığı (saat)';

  @override
  String get adminProviderAdded => 'Sağlayıcı eklendi';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Ayarlayıcının sıfırlanması istendi';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Kayıt Ayarları';

  @override
  String get adminPrePadding => 'Ön doldurma (dakika)';

  @override
  String get adminPostPadding => 'Sonradan doldurma (dakika)';

  @override
  String get adminRecordingPath => 'Kayıt yolu';

  @override
  String get adminSeriesRecordingPath => 'Seri kayıt yolu';

  @override
  String get adminRecordingSettingsSaved => 'Kayıt ayarları kaydedildi';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Kanal Eşlemelerini Ayarlama';

  @override
  String get adminMappingJson => 'JSON\'u Eşleme';

  @override
  String get adminMappingJsonHint => 'Örnek: JSON yükünü eşleme';

  @override
  String get adminChannelMappingsUpdated => 'Kanal eşlemeleri güncellendi';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Canlı TV yönetimi yüklenemedi';

  @override
  String get adminTunerDevices => 'Ayarlama Cihazları';

  @override
  String get adminNoTunerHosts =>
      'Hiçbir ayarlayıcı ana bilgisayarı yapılandırılmadı';

  @override
  String get adminGuideProviders => 'Rehber Sağlayıcılar';

  @override
  String get adminAddProvider => 'Sağlayıcı Ekle';

  @override
  String get adminNoListingProviders =>
      'Hiçbir listeleme sağlayıcısı yapılandırılmadı';

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
  String get adminTunerDiscovery => 'Ayarlayıcı Keşfi';

  @override
  String get adminChannelMappings => 'Kanal Eşlemeleri';

  @override
  String get adminNoDiscoveredTuners => 'Henüz keşfedilen tuner yok';

  @override
  String get adminSettingsSaved => 'Ayarlar kaydedildi';

  @override
  String get adminBackupsNotAvailable =>
      'Bu sunucu yapısında yedeklemeler mevcut değil.';

  @override
  String get adminRestoreWarning1 =>
      'Geri yükleme işlemi, TÜM mevcut sunucu verilerini yedek verilerle değiştirecektir.';

  @override
  String get adminRestoreWarning2 =>
      'Mevcut sunucu ayarlarının, kullanıcıların ve kütüphane verilerinin üzerine yazılacaktır.';

  @override
  String get adminRestoreWarning3 =>
      'Sunucu restorasyondan sonra yeniden başlatılacaktır.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Geri yükleme istendi. Sunucunun yeniden başlatılması bu oturumun bağlantısını kesebilir.';

  @override
  String get adminBackupsTitle => 'Yedeklemeler';

  @override
  String get adminUnknownDate => 'Bilinmeyen tarih';

  @override
  String get adminUnnamedBackup => 'Adsız Yedekleme';

  @override
  String get adminLiveTvNotAvailable =>
      'Bu sunucu yapısında canlı TV yönetimi mevcut değildir.';

  @override
  String get adminLiveTvTitle => 'Canlı TV Yönetimi';

  @override
  String get adminApply => 'Uygula';

  @override
  String get adminNotSet => 'Ayarlanmadı';

  @override
  String get adminReset => 'Sıfırla';

  @override
  String get adminLogsTitle => 'Sunucu Günlükleri';

  @override
  String get adminLogsNewestFirst => 'En Yeni İlk';

  @override
  String get adminLogsOldestFirst => 'En Eski İlk';

  @override
  String get adminLogsJustNow => 'Şu anda';

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
  String get adminLogViewerNoMatches => 'Eşleşen çizgi yok';

  @override
  String get adminMetadataEditorTitle => 'Meta Veri Düzenleyici';

  @override
  String get adminMetadataRemote => 'Uzak';

  @override
  String get adminMetadataType => 'Tip';

  @override
  String get adminMetadataDetails => 'Detaylar';

  @override
  String get adminMetadataExternalIds => 'Harici Kimlikler';

  @override
  String get adminMetadataImages => 'Görseller';

  @override
  String get adminMetadataFieldTitle => 'Başlık';

  @override
  String get adminMetadataFieldSortTitle => 'Başlığı sırala';

  @override
  String get adminMetadataFieldOriginalTitle => 'Orijinal başlık';

  @override
  String get adminMetadataFieldPremiereDate =>
      'İlk gösterim tarihi (YYYY-AA-GG)';

  @override
  String get adminMetadataFieldEndDate => 'Bitiş tarihi (YYYY-AA-GG)';

  @override
  String get adminMetadataFieldProductionYear => 'Üretim yılı';

  @override
  String get adminMetadataFieldOfficialRating => 'Resmi derecelendirme';

  @override
  String get adminMetadataFieldCommunityRating => 'Topluluk derecelendirmesi';

  @override
  String get adminMetadataFieldCriticRating => 'Eleştirmen puanı';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Genel Bakış';

  @override
  String get adminMetadataGenres => 'Türler';

  @override
  String get adminMetadataTags => 'Etiketler';

  @override
  String get adminMetadataStudios => 'Stüdyolar';

  @override
  String get adminMetadataPeople => 'İnsanlar';

  @override
  String get adminMetadataAddGenre => 'Tür ekle';

  @override
  String get adminMetadataAddTag => 'Etiket ekle';

  @override
  String get adminMetadataAddStudio => 'Stüdyo ekle';

  @override
  String get adminMetadataAddPerson => 'Kişi Ekle';

  @override
  String get adminMetadataEditPerson => 'Kişiyi Düzenle';

  @override
  String get adminMetadataRole => 'Rol';

  @override
  String get adminMetadataImagePrimary => 'Öncelik';

  @override
  String get adminMetadataImageBackdrop => 'Arka plan';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Afiş';

  @override
  String get adminMetadataImageThumb => 'Baş parmak';

  @override
  String get adminMetadataRecursive => 'Özyinelemeli';

  @override
  String get adminMetadataProvider => 'sağlayıcı';

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
  String get adminMetadataImageReadFailed => 'Seçilen resim okunamadı';

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
      'Bu, geçerli resmi öğeden kaldırır.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Yüklemek';

  @override
  String get adminMetadataUpdate => 'Güncelleme';

  @override
  String get adminMetadataRemoteImage => 'Uzak görüntü';

  @override
  String get adminPluginsInstalled => 'Yüklendi';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktif';

  @override
  String get adminPluginsRestart => 'Tekrar başlat';

  @override
  String get adminPluginsNoSearchResults => 'Aramanızla eşleşen eklenti yok';

  @override
  String get adminPluginsNoneInstalled => 'Hiçbir eklenti yüklü değil';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Güncelleme mevcut';

  @override
  String get adminPluginsPendingRemoval =>
      'Yeniden başlatmanın ardından kaldırılma bekleniyor';

  @override
  String get adminPluginsChangesPending =>
      'Yeniden başlatmayı bekleyen değişiklikler';

  @override
  String get adminPluginsEnable => 'Olanak vermek';

  @override
  String get adminPluginsDisable => 'Devre dışı bırakmak';

  @override
  String get adminPluginsInstallUpdate => 'Güncellemeyi yükle';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Aramanızla eşleşen paket yok';

  @override
  String get adminPluginsCatalogEmpty => 'Mevcut paket yok';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Deneysel Entegrasyon';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Eklenti ayarları entegrasyonu hala deneyseldir. Bazı alanlar veya düzenler henüz doğru şekilde oluşturulamayabilir.';

  @override
  String get adminPluginDetailToggle404 =>
      'Eklenti değiştirilemedi. Sunucu bu eklenti sürümünü bulamadı. Eklentileri yenilemeyi deneyin ve ardından yeniden deneyin.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Eklenti değiştirilemedi. Ayrıntılar için lütfen sunucu günlüklerini kontrol edin.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Detaylar';

  @override
  String get adminPluginDetailDeveloper => 'Geliştirici';

  @override
  String get adminPluginDetailRepository => 'Depo';

  @override
  String get adminPluginDetailBundled => 'Paketlenmiş';

  @override
  String get adminPluginDetailEnablePlugin => 'Eklentiyi Etkinleştir';

  @override
  String get adminPluginDetailRestartRequired =>
      'Değişikliklerin etkili olması için sunucunun yeniden başlatılması gerekir.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Bu eklenti sunucu yeniden başlatıldıktan sonra kaldırılacaktır.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Bu eklenti arızalandı ve düzgün çalışmayabilir.';

  @override
  String get adminPluginDetailNotSupported =>
      'Bu eklenti mevcut sunucu sürümü tarafından desteklenmiyor.';

  @override
  String get adminPluginDetailSuperseded =>
      'Bu eklentinin yerini daha yeni bir sürüm aldı.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Depoyu Kaldır';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Kaldırmak';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Yapılandırılmış depo yok';

  @override
  String get adminReposEmptySubtitle =>
      'Mevcut eklentilere göz atmak için bir depo ekleyin';

  @override
  String get adminReposUnnamed => '(isimsiz)';

  @override
  String get adminReposEditTitle => 'Depoyu Düzenle';

  @override
  String get adminReposAddTitle => 'Depo Ekle';

  @override
  String get adminReposUrl => 'Depo URL\'si';

  @override
  String get adminReposNameHint => 'örneğin Jellyfin Kararlı';

  @override
  String get adminPluginSettingsInvalidUrl => 'Geçersiz URL';

  @override
  String get adminGeneralSettingsTitle => 'Genel Ayarlar';

  @override
  String get adminGeneralMetadataLanguage => 'Tercih edilen meta veri dili';

  @override
  String get adminGeneralMetadataLanguageHint => 'örneğin tr, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Tercih edilen meta veri ülkesi';

  @override
  String get adminGeneralMetadataCountryHint => 'örneğin ABD, Almanya, Fransa';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Kitaplık taraması eşzamanlılığı';

  @override
  String get adminGeneralImageEncodingLimit => 'Paralel görüntü kodlama sınırı';

  @override
  String get adminUnknownError => 'Bilinmeyen hata';

  @override
  String get adminBrowse => 'Göz at';

  @override
  String get adminCloseBrowser => 'Tarayıcıyı kapat';

  @override
  String get adminNetworkingTitle => 'Ağ oluşturma';

  @override
  String get adminNetworkingRestartWarning =>
      'Ağ ayarlarında yapılan değişiklikler sunucunun yeniden başlatılmasını gerektirebilir.';

  @override
  String get adminNetworkingRemoteAccess => 'Uzaktan erişimi etkinleştir';

  @override
  String get adminNetworkingPorts => 'Limanlar';

  @override
  String get adminNetworkingHttpPort => 'HTTP bağlantı noktası';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS bağlantı noktası';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS\'yi etkinleştir';

  @override
  String get adminNetworkingLocalNetwork => 'Yerel Ağ';

  @override
  String get adminNetworkingLocalAddresses => 'Yerel ağ adresleri';

  @override
  String get adminNetworkingAddressHint => 'örneğin 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Bilinen proxy\'ler';

  @override
  String get adminNetworkingProxyHint => 'örneğin 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Beyaz liste';

  @override
  String get adminNetworkingBlacklist => 'Kara liste';

  @override
  String get adminNetworkingAddEntry => 'Giriş ekle';

  @override
  String get adminBrandingTitle => 'Markalaşma';

  @override
  String get adminBrandingLoginDisclaimer => 'Giriş sorumluluk reddi beyanı';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'Giriş formunun altında görüntülenen HTML';

  @override
  String get adminBrandingCustomCss => 'Özel CSS';

  @override
  String get adminBrandingCustomCssHint => 'Web arayüzüne uygulanan özel CSS';

  @override
  String get adminBrandingEnableSplash => 'Açılış ekranını etkinleştir';

  @override
  String get adminPlaybackHwAccel => 'Donanım Hızlandırma';

  @override
  String get adminPlaybackHwAccelLabel => 'Donanım hızlandırma';

  @override
  String get adminPlaybackEnableHwEncoding => 'Donanım kodlamasını etkinleştir';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Aşağıdakiler için donanım kod çözmeyi etkinleştirin:';

  @override
  String get adminPlaybackEncoding => 'Kodlama';

  @override
  String get adminPlaybackEncodingThreads => 'Kodlama konuları';

  @override
  String get adminPlaybackFallbackFont => 'Yedek yazı tipini etkinleştir';

  @override
  String get adminPlaybackFallbackFontPath => 'Geri dönüş yazı tipi yolu';

  @override
  String get adminPlaybackStreaming => 'Akış';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Sesli kitaplar';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimum sesli kitap devam etme yüzdesi';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksimum sesli kitap devam ettirme yüzdesi';

  @override
  String get adminStreamingBitrateLimit =>
      'Uzak istemci bit hızı sınırı (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Sınırsız için boş veya 0 bırakın';

  @override
  String get adminTrickplayHwAccel => 'Donanım hızlandırmayı etkinleştir';

  @override
  String get adminTrickplayHwEncoding => 'Donanım kodlamasını etkinleştir';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Yalnızca anahtar kare çıkartmayı etkinleştir';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Daha hızlı ancak daha düşük doğruluk';

  @override
  String get adminTrickplayNonBlocking => 'Engellenmeyen';

  @override
  String get adminTrickplayBlocking => 'Engelleme';

  @override
  String get adminTrickplayPriorityHigh => 'Yüksek';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Normalin üstünde';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Normalin Altında';

  @override
  String get adminTrickplayPriorityIdle => 'Boşta';

  @override
  String get adminTrickplayImageSettings => 'Görüntü Ayarları';

  @override
  String get adminTrickplayInterval => 'Aralık (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Çerçevelerin ne sıklıkla yakalanacağı';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Virgülle ayrılmış piksel genişlikleri (ör. 320)';

  @override
  String get adminTrickplayQuality => 'Kalite';

  @override
  String get adminTrickplayQScale => 'Kalite ölçeği';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Daha düşük değerler = daha iyi kalite, daha büyük dosyalar';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kalitesi';

  @override
  String get adminTrickplayProcessing => 'İşleme';

  @override
  String get adminTasksEmpty => 'Zamanlanmış görev bulunamadı';

  @override
  String get adminTasksNoFilterMatch => 'Geçerli filtreyle eşleşen görev yok';

  @override
  String get adminTaskCancelling => 'İptal...';

  @override
  String get adminTaskRunning => 'Koşma...';

  @override
  String get adminTaskNeverRun => 'Asla koşma';

  @override
  String get adminTaskStop => 'Durmak';

  @override
  String get adminTaskRun => 'Koşmak';

  @override
  String get adminTaskDetailLastExecution => 'Son Yürütme';

  @override
  String get adminTaskDetailStarted => 'Başlatıldı';

  @override
  String get adminTaskDetailEnded => 'Sona erdi';

  @override
  String get adminTaskDetailDuration => 'Süre';

  @override
  String get adminTaskDetailErrorLabel => 'Hata:';

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
  String get adminTaskTriggerStartup => 'Uygulama başlangıcında';

  @override
  String get adminTaskTriggerTypeDaily => 'Günlük';

  @override
  String get adminTaskTriggerTypeWeekly => 'Haftalık';

  @override
  String get adminTaskTriggerTypeInterval => 'Bir aralıkta';

  @override
  String get adminTaskTriggerIntervalLabel => 'Aralık';

  @override
  String get adminTaskTriggerEveryHour => 'Her saat';

  @override
  String get adminTaskTriggerEvery6Hours => 'Her 6 saatte bir';

  @override
  String get adminTaskTriggerEvery12Hours => 'Her 12 saatte bir';

  @override
  String get adminTaskTriggerEvery24Hours => 'Her 24 saatte bir';

  @override
  String get adminTaskTriggerEvery2Days => 'Her 2 günde bir';

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
  String get adminTaskTriggerTime => 'Zaman';

  @override
  String get adminTaskTriggerNoLimit => 'Sınır yok';

  @override
  String get adminActivityJustNow => 'Şu anda';

  @override
  String get adminActivityLastHour => 'Son saat';

  @override
  String get adminActivityToday => 'Bugün';

  @override
  String get adminActivityYesterday => 'Dün';

  @override
  String get adminActivityOlder => 'daha yaşlı';

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
  String get adminActivityNow => 'Şimdi';

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
      'Önizleme küçük resimlerini aramak için hileli görüntü oluşturmayı yapılandırın.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Genel HTTPS bağlantı noktası';

  @override
  String get adminNetworkingBaseUrl => 'Temel URL';

  @override
  String get adminNetworkingBaseUrlHint => 'örneğin /jölefin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Sertifika yolu';

  @override
  String get adminNetworkingRemoteIpFilter => 'Uzak IP Filtresi';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Uzak IP filtresi';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API cihazı';

  @override
  String get adminPlaybackAutomatic => '0 = otomatik';

  @override
  String get adminPlaybackTranscodeTempPath => 'Geçici yolu kod dönüştürme';

  @override
  String get adminPlaybackSegmentDeletion => 'Segmentin silinmesine izin ver';

  @override
  String get adminPlaybackSegmentKeep => 'Segment tutma (saniye)';

  @override
  String get adminPlaybackThrottleBuffering => 'Kısma arabelleğe alma';

  @override
  String get adminResumeMinPct => 'Minimum devam etme yüzdesi';

  @override
  String get adminResumeMinPctSubtitle =>
      'İlerlemenin kaydedilmesi için içeriğin bu yüzdeyi aşacak şekilde oynatılması gerekir';

  @override
  String get adminResumeMaxPct => 'Maksimum devam etme yüzdesi';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Bu yüzdeden sonra içerik tamamen oynatılmış sayılır';

  @override
  String get adminResumeMinDuration => 'Minimum devam etme süresi (saniye)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Bundan daha kısa öğeler devam ettirilemez';

  @override
  String get adminTrickplayScanBehavior => 'Tarama davranışı';

  @override
  String get adminTrickplayProcessPriority => 'Süreç önceliği';

  @override
  String get adminTrickplayTileWidth => 'Döşeme genişliği';

  @override
  String get adminTrickplayTileHeight => 'Döşeme yüksekliği';

  @override
  String get adminTrickplayProcessThreads => 'İş parçacıkları';

  @override
  String get adminTrickplayWidthResolutions => 'Genişlik çözünürlükleri';

  @override
  String get adminMetadataDefault => 'Varsayılan';

  @override
  String get adminMetadataContentTypeUpdated => 'İçerik türü güncellendi';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Yavaş yanıt eşiği (ms)';

  @override
  String get adminGeneralCachePath => 'Önbellek yolu';

  @override
  String get adminGeneralMetadataPath => 'Meta veri yolu';

  @override
  String get adminGeneralServerName => 'Sunucu adı';

  @override
  String get adminSettingsLoadFailed => 'Ayarlar yüklenemedi';

  @override
  String get adminDiscover => 'Keşfetmek';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Klasörler';

  @override
  String get libraries => 'Kütüphaneler';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay devre dışı';

  @override
  String get syncPlayDisabledMessage =>
      'Senkronize oynatmayı kullanmak için Ayarlar\'da SyncPlay seçeneğini etkinleştirin.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Sunucu desteklenmiyor';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay bir Jellyfin sunucusu gerektirir. Mevcut sunucu bunu desteklemiyor.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Grup';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay grubu';

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
  String get syncPlayIgnoreWait => 'Beklemeyi yoksay';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Bu cihaz arabelleğe alınırken grubu bekletmeyin';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Yavaş üyeleri beklemeden yerel olarak devam edin';

  @override
  String get syncPlayRepeat => 'Tekrarlamak';

  @override
  String get syncPlayRepeatOne => 'Bir';

  @override
  String get syncPlayShuffleModeShuffled => 'Karıştırıldı';

  @override
  String get syncPlayShuffleModeSorted => 'Sıralanmış';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Geçerli oynatma sırasını senkronize et';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Grup kuyruğunu yerel olarak oynatılanlarla değiştirin';

  @override
  String get syncPlayLeaveGroup => 'Gruptan ayrıl';

  @override
  String get syncPlayGroupQueue => 'Grup kuyruğu';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Şimdi oyna';

  @override
  String get syncPlayCreateNewGroup => 'Yeni bir grup oluştur';

  @override
  String get syncPlayGroupName => 'Grup adı';

  @override
  String get syncPlayDefaultGroupName => 'SyncPlay Grubum';

  @override
  String get syncPlayCreateGroup => 'Grup oluştur';

  @override
  String get syncPlayAvailableGroups => 'Mevcut gruplar';

  @override
  String get syncPlayNoGroupsAvailable => 'Grup mevcut değil';

  @override
  String get syncPlayJoinGroupQuestion =>
      'SyncPlay grubuna katılmak ister misiniz?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Bir SyncPlay grubuna katılmak mevcut oynatma sıranızın yerini alabilir. Devam etmek?';

  @override
  String get syncPlayJoin => 'Katılmak';

  @override
  String get syncPlayStateIdle => 'Boşta';

  @override
  String get syncPlayStateWaiting => 'Beklemek';

  @override
  String get syncPlayStatePaused => 'Duraklatıldı';

  @override
  String get syncPlayStatePlaying => 'Oynanıyor';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay erişim reddedildi';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Bu SyncPlay grubundaki bir veya daha fazla öğeye erişiminiz yok. Grup sahibinden kitaplık izinlerini doğrulamasını veya farklı bir sıra seçmesini isteyin.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Sesli arama kullanılamıyor.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Doğrudan Oynatma Başarısız';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Bu Dolby Vision akışı için doğrudan oynatma başlatılamadı. Sunucu kod dönüştürmesini kullanmayı yeniden denemek ister misiniz?';

  @override
  String get retryWithTranscode => 'Kod dönüştürmeyle yeniden deneyin';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Desteklenmiyor';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Bu cihaz Dolby Vision içeriğinin kodunu doğrudan çözemez. HDR10 geri dönüşünü kullanın veya sunucu kod dönüştürmesini isteyin.';

  @override
  String get rememberMyChoice => 'Seçimimi hatırla';

  @override
  String get playHdr10Fallback => 'HDR10 yedeğini oynat';

  @override
  String get requestTranscode => 'Kod dönüştürme isteği';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'IAmParadox27\'nin \"Ana Ekran Bölümleri\" eklentisinin açığa çıkardığı satırları tespit edin. Satırlar aşağıda etkinleştirilebilir ve yeniden sıralanabilir.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Henüz eklentiyi bildiren Jellyfin sunucusu yok.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Ranaldsgift\'in \"KefinTweaks\" eklentisi aracılığıyla yapılandırılan satırları tespit edin. Yakın zamanda piyasaya sürülen, tekrar izlenen, sezonluk ve kitaplığa yakın zamanda eklenen özel bölümler, her Jellyfin sunucusundaki KefinTweaks yapılandırmasından yansıtılır.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Henüz KefinTweaks\'i bildiren Jellyfin sunucusu yok.';

  @override
  String get integrationOpenHomeSections => 'Ana Sayfa Bölümlerini Aç';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Satırları etkinleştirme, devre dışı bırakma ve yeniden sıralama';

  @override
  String get integrationInstalledButDisabled =>
      'Yüklendi ancak devre dışı bırakıldı';

  @override
  String get integrationNotInstalled => 'Kurulu değil';

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
  String get seeAll => 'Tümünü Gör';

  @override
  String get noItems => 'Öğe yok';

  @override
  String get switchUser => 'Kullanıcıyı Değiştir';

  @override
  String get remoteControl => 'Uzaktan kumanda';

  @override
  String get mediaBarLoading => 'Medya çubuğu yükleniyor...';

  @override
  String get mediaBarError => 'Medya çubuğu yüklenemedi';

  @override
  String get offlineServerUnavailable =>
      'İnternete bağlı, ancak mevcut sunucu kullanılamıyor.';

  @override
  String get offlineNoInternet =>
      'Çevrimdışısınız. Yalnızca indirilen içerik kullanılabilir.';

  @override
  String get offlineFileNotAvailable => 'Dosya mevcut değil';

  @override
  String get offlineSwitchServer => 'Sunucuyu Değiştir';

  @override
  String get offlineSavedMedia => 'Kayıtlı Medya';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Uzaktan Oynatma';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Cihaz Sesi';

  @override
  String get castVolumeUnavailable => 'Kullanılamıyor';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Ses';

  @override
  String get subtitlesLabel => 'Altyazılar';

  @override
  String get pinConfirmTitle => 'PIN\'i onayla';

  @override
  String get pinSetTitle => 'PIN\'i ayarla';

  @override
  String get pinEnterTitle => 'PIN\'i girin';

  @override
  String get pinReenterToConfirm => 'Onaylamak için PIN\'inizi tekrar girin';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Yanlış PIN';

  @override
  String get pinMismatch => 'PIN\'ler eşleşmiyor';

  @override
  String get pinForgot => 'PIN\'inizi mi unuttunuz?';

  @override
  String get pinClear => 'Temizlemek';

  @override
  String get pinBackspace => 'Geri tuşu';

  @override
  String get quickConnectAuthorized => 'Hızlı Bağlantı isteği onaylandı.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Hızlı Bağlantı kodu geçersiz veya süresi dolmuş.';

  @override
  String get quickConnectNotSupported =>
      'Hızlı Bağlantı bu sunucuda desteklenmiyor.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Hızlı Bağlantı kodu yetkilendirilemedi.';

  @override
  String get quickConnectDisabled =>
      'Hızlı Bağlantı bu sunucuda devre dışı bırakıldı.';

  @override
  String get quickConnectForbidden =>
      'Hesabınız bu Hızlı Bağlantı isteğine yetki veremez.';

  @override
  String get quickConnectNotFound =>
      'Hızlı Bağlantı kodu bulunamadı. Yeni bir kod deneyin.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Kodu girin';

  @override
  String get quickConnectAuthorize => 'Yetkilendir';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Uzaktan kumanda';

  @override
  String get remoteFailedToLoadSessions => 'Oturumlar yüklenemedi';

  @override
  String get remoteNoSessions => 'Kontrol edilebilir oturum yok';

  @override
  String get remoteStartPlayback => 'Başka bir cihazda oynatmayı başlat';

  @override
  String get unknownUser => 'Bilinmiyor';

  @override
  String get unknownItem => 'Bilinmiyor';

  @override
  String get remoteNothingPlaying => 'Bu oturumda oynatılan hiçbir şey yok';

  @override
  String get castingStarted => 'Seçilen cihazda yayınlama başladı';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'Uzaktan oynatma cihazı mevcut değil.';

  @override
  String get noRemoteDevicesIos =>
      'Uzaktan oynatma cihazı mevcut değil.\n\niOS\'ta AirPlay hedefleri simülatörde kullanılamayabilir.';

  @override
  String get trackActionPlayNext => 'Sonrakini Oynat';

  @override
  String get trackActionAddToQueue => 'Kuyruğa Ekle';

  @override
  String get trackActionAddToPlaylist => 'Oynatma Listesine Ekle';

  @override
  String get trackActionCancelDownload => 'İndirmeyi İptal Et';

  @override
  String get trackActionDeleteFromPlaylist => 'Oynatma Listesinden Sil';

  @override
  String get trackActionMoveUp => 'Yukarı Taşı';

  @override
  String get trackActionMoveDown => 'Aşağı Taşı';

  @override
  String get trackActionRemoveFromFavorites => 'Favorilerden Kaldır';

  @override
  String get trackActionAddToFavorites => 'Favorilere Ekle';

  @override
  String get trackActionGoToAlbum => 'Albüme Git';

  @override
  String get trackActionGoToArtist => 'Sanatçıya Git';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'İndirilen dosya silindi';

  @override
  String get trackActionDeleteFileFailed => 'İndirilen dosya silinemedi';

  @override
  String get shuffleBy => 'Karıştır';

  @override
  String get shuffleSelectLibrary => 'Kütüphaneyi Seçin';

  @override
  String get shuffleSelectGenre => 'Tür Seçin';

  @override
  String get shuffleLibrary => 'Kütüphane';

  @override
  String get shuffleGenre => 'Tür';

  @override
  String get shuffleNoLibraries => 'Uyumlu kitaplık yok.';

  @override
  String get shuffleNoGenres => 'Bu karışık mod için tür bulunamadı.';

  @override
  String get posterDisplayTitle => 'Görüntülemek';

  @override
  String get posterImageType => 'Resim Türü';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Küçük resim';

  @override
  String get imageTypeBanner => 'Afiş';

  @override
  String get playlistAddFailed => 'Çalma listesine eklenemedi';

  @override
  String get playlistCreateFailed => 'Oynatma listesi oluşturulamadı';

  @override
  String get playlistNew => 'Yeni Oynatma Listesi';

  @override
  String get playlistCreate => 'Yaratmak';

  @override
  String get playlistCreateNew => 'Yeni Çalma Listesi Oluştur';

  @override
  String get playlistNoneFound => 'Oynatma listesi bulunamadı';

  @override
  String get addToPlaylist => 'Oynatma Listesine Ekle';

  @override
  String get lyricsNotAvailable => 'Şarkı sözü mevcut değil';

  @override
  String get upNext => 'Sonraki';

  @override
  String get playNext => 'Sonrakini Oynat';

  @override
  String get stillWatchingContent =>
      'Oynatma duraklatıldı. Hala izliyor musun?';

  @override
  String get stillWatchingStop => 'Durmak';

  @override
  String get stillWatchingContinue => 'Devam etmek';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Canlı TV';

  @override
  String get continueWatchingAndNextUp => 'İzlemeye Devam Et ve Sıradaki';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Sonraki Bölüm';

  @override
  String get moreFromThisSeason => 'Bu Sezondan Daha Fazla';

  @override
  String get playerTooltipPlaybackSpeed => 'Oynatma hızı';

  @override
  String get playerTooltipCastControls => 'Yayın kontrolleri';

  @override
  String get playerTooltipPlaybackQuality => 'Bit hızı';

  @override
  String get playerTooltipEnterFullscreen => 'Tam ekrana girin';

  @override
  String get playerTooltipExitFullscreen => 'Tam ekrandan çık';

  @override
  String get playerTooltipFloatOnTop => 'Üstte yüzer';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Üstte şamandırayı devre dışı bırak';

  @override
  String get playerTooltipLockLandscape => 'Manzarayı kilitle';

  @override
  String get playerTooltipUnlockOrientation => 'Rotasyona izin ver';

  @override
  String get playerTooltipPrevious => 'Öncesi';

  @override
  String get playerTooltipSeekBack => 'Geri ara';

  @override
  String get playerTooltipSeekForward => 'İleriye doğru ara';

  @override
  String get contextMenuMarkWatched => 'İzlendi olarak işaretle';

  @override
  String get contextMenuMarkUnwatched => 'İzlenmedi olarak işaretle';

  @override
  String get contextMenuAddToFavorites => 'Favorilere ekle';

  @override
  String get contextMenuRemoveFromFavorites => 'Favorilerden kaldır';

  @override
  String get contextMenuGoToSeries => 'Diziye git';

  @override
  String get settingsAdministrationSubtitle => 'Sunucu yönetim paneline erişin';

  @override
  String get settingsAccountSecurity => 'Hesap ve Güvenlik';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Kimlik doğrulama, PIN kodu ve ebeveyn denetimleri';

  @override
  String get settingsPersonalization => 'Kişiselleştirme';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, gezinme, ana sayfa satırları ve kitaplık görünürlüğü';

  @override
  String get settingsDynamicContent => 'Dinamik İçerik';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medya Çubuğu ve görsel katmanlar';

  @override
  String get settingsPlaybackSyncplay => 'Oynatma ve SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Ses/video ayarları, altyazılar, indirmeler ve SyncPlay kontrolleri';

  @override
  String get settingsIntegrationsSubtitle =>
      'Eklenti senkronizasyonu, Seerr, derecelendirmeler ve daha fazlası';

  @override
  String get settingsAboutSubtitle =>
      'Uygulama sürümü, yasal bilgiler ve krediler';

  @override
  String get settingsAuthenticationSection => 'DOĞRULAMA';

  @override
  String get settingsSortServersBy => 'Sunucuları Şuna Göre Sırala:';

  @override
  String get settingsLastUsed => 'Son Kullanılan';

  @override
  String get settingsAlphabetical => 'Alfabetik';

  @override
  String get settingsPrivacyAndSafetySection => 'GİZLİLİK VE GÜVENLİK';

  @override
  String get settingsBlockedRatings => 'Engellenen Derecelendirmeler';

  @override
  String get settingsGeneralStyle => 'Genel Stil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Tema vurguları, arka planlar, izlenen göstergeler ve tema müziği';

  @override
  String get settingsHomePage => 'Ana Sayfa';

  @override
  String get settingsHomePageSubtitle =>
      'Bölümler, görüntü türleri, kaplamalar ve medya önizlemeleri';

  @override
  String get settingsLibrariesSubtitle =>
      'Kitaplık görünürlüğü, klasör görünümü ve çoklu sunucu davranışı';

  @override
  String get settingsTwentyFourHourClock => '24 Saatlik Saat';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Saatin gösterildiği her yerde 24 saatlik zaman formatını kullanın';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Gezinme çubuğunda karışık düğmesini göster';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Gezinme çubuğunda türler düğmesini göster';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Gezinme çubuğunda favoriler düğmesini göster';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Gezinti çubuğunda kitaplıklar düğmesini göster';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Show the Seerr button in the navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Kitaplık başına ana sayfa görünürlüğünü değiştirin. Değişikliklerin etkili olması için Moonfin yeniden başlatın.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Medya Çubuğu ve Yerel Önizlemeler';

  @override
  String get settingsVisualOverlays => 'Görsel Kaplamalar';

  @override
  String get settingsSeasonalSurprise => 'Sezon Sürprizi';

  @override
  String get settingsMetadataAndRatings => 'Meta Veriler ve Derecelendirmeler';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase, ek derecelendirme kaynakları, Seerr istekleri ve senkronize edilmiş tercihler dahil olmak üzere sunucu tarafı entegrasyonlarını destekler.';

  @override
  String get settingsOfflineDownloads => 'Çevrimdışı İndirmeler';

  @override
  String get settingsHigh => 'Yüksek';

  @override
  String get settingsLow => 'Düşük';

  @override
  String get settingsCustomPath => 'Özel Yol';

  @override
  String get settingsEnterDownloadFolderPath => 'İndirme klasörü yolunu girin';

  @override
  String get settingsConcurrentDownloads => 'Eşzamanlı İndirmeler';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Tek seferde indirilebilecek maksimum öğe sayısı.';

  @override
  String get settingsAppInfo => 'UYGULAMA BİLGİSİ';

  @override
  String get settingsReportAnIssue => 'Sorun Bildir';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub adresindeki sorun izleyiciyi açın';

  @override
  String get settingsJoinDiscord => 'Discord\'ye katılın';

  @override
  String get settingsJoinDiscordSubtitle => 'Toplulukla sohbet et';

  @override
  String get settingsJoinTheDiscord => 'Discord\'ye katılın';

  @override
  String get settingsSupportMoonfin => 'Destek Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'YASAL';

  @override
  String get settingsLicenses => 'Lisanslar';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Açık kaynak lisans bildirimleri';

  @override
  String get settingsPrivacyPolicy => 'Gizlilik Politikası';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin verilerinizi nasıl işler?';

  @override
  String get settingsCheckForUpdates => 'Güncellemeleri Kontrol Et';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'En son Moonfin sürümünü kontrol edin';

  @override
  String get settingsPoweredByFlutter => 'Flutter tarafından desteklenmektedir';

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
  String get settingsBoth => 'İkisi birden';

  @override
  String get settingsShuffleContentTypeFilter =>
      'İçerik Türü Filtresini Karıştır';

  @override
  String get settingsVideoPlaybackPreferences => 'Video Oynatma Tercihleri';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Temel video motoru ve akış kalitesi ayarları';

  @override
  String get settingsAudioPreferences => 'Ses Tercihleri';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Ses parçaları, işleme ve geçiş seçenekleri';

  @override
  String get settingsAutomationAndQueue => 'Otomasyon ve Kuyruk';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Otomatik oynatma ve sıralama';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'İndirme kalitesi, depolama sınırları ve kuyruk boyutu';

  @override
  String get settingsSyncplaySubtitle =>
      'Grup oturumları için senkronizasyon mantığı';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Özel oynatıcı özellikleri. Bazı seçenekler oynatma sorunlarına neden olabileceğinden dikkatli kullanın';

  @override
  String get settingsSkipIntrosAndOutros => 'Giriş ve Çıkışlar atlansın mı?';

  @override
  String get settingsMediaSegmentCountdown => 'Media Segment Countdown';

  @override
  String get settingsProgressBar => 'Progress Bar';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'None';

  @override
  String get settingsPromptUser => 'Kullanıcıya Sor';

  @override
  String get settingsSkip => 'Atlamak';

  @override
  String get settingsDoNothing => 'Hiçbir şey yapma';

  @override
  String get settingsMaxBitrateDescription =>
      'Akış bit hızını sınırlayın. Bu eşiğin üzerindeki içeriğin kodu sığacak şekilde dönüştürülecektir.';

  @override
  String get settingsMaxResolutionDescription =>
      'Oyuncunun isteyeceği maksimum çözünürlüğü sınırlayın. Daha yüksek çözünürlüklü içeriğin kodu dönüştürülecektir.';

  @override
  String get settingsPlayerZoomDescription =>
      'Videonun ekrana sığacak şekilde nasıl ölçeklendirilmesi gerektiği.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Oynatma Motoru (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV cihazlarında varsayılan oynatma motorunu seçin. Değişiklikler bir sonraki oynatma oturumuna uygulanır.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (önerilir)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (eski)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Geri dönüş';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision kod çözme özelliği olmayan cihazlarda Dolby Vision başlıkların davranışı.';

  @override
  String get settingsAskEachTime => 'Her seferinde sor';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 geri dönüşünü tercih et';

  @override
  String get settingsPreferServerTranscode =>
      'Sunucu kod dönüştürmesini tercih et';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Doğrudan Oynatma';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision profil 7 geliştirme katmanı akışlarının oynatmayı yönlendirmesi gerekip gerekmediğini kontrol eder.';

  @override
  String get settingsAutoAftkrtEnabled => 'Otomatik (AFTKRT etkin)';

  @override
  String get settingsEnabledOnThisDevice => 'Bu cihazda etkinleştirildi';

  @override
  String get settingsDisabledPreferTranscode =>
      'Devre dışı (kod dönüştürmeyi tercih edin)';

  @override
  String get settingsResumeRewindDescription =>
      'Oynatmayı devam ettirirken (İzlemeye Devam Et\'ten veya bir medya öğesi sayfasından), kaç saniye geri sarılmalıdır?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Duraklatma tuşuna bastıktan sonra oynatmaya devam edilirken kaç saniye geri sarılmalıdır?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Geri sarma tuşuna bastıktan sonra kaç saniye geri atlanır.';

  @override
  String get settingsOneSecond => '1 saniye';

  @override
  String get settingsThreeSeconds => '3 saniye';

  @override
  String get settingsFortyFiveSeconds => '45 saniye';

  @override
  String get settingsSixtySeconds => '60 saniye';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Hızlı ileri sarma tuşuna bastıktan sonra kaç saniye ileri atlanır.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3\'ten harici kod çözücüye';

  @override
  String get settingsCinemaMode => 'Sinema Modu';

  @override
  String get settingsCinemaModeSubtitle =>
      'Ana özellikten önce fragmanları/ön gösterimleri oynatın';

  @override
  String get settingsNextUpDisplayDescription =>
      'Genişletilmiş, bölümün resmini ve açıklamasını içeren tam bir kart gösterir. Minimal, kompakt bir geri sayım katmanını gösterir. Devre Dışı istemi tamamen gizler.';

  @override
  String get settingsShort => 'Kısa';

  @override
  String get settingsLong => 'Uzun';

  @override
  String get settingsVeryLong => 'Çok Uzun';

  @override
  String get settingsVideoStartDelay => 'Video Başlatma Gecikmesi';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Canlı TV Doğrudan';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Canlı TV için doğrudan oynatmayı etkinleştirin';

  @override
  String get settingsOpenGroups => 'Grupları Aç';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay grupları oluşturun, katılın veya yönetin';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Etkin';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Grup izleme özelliklerini etkinleştirin';

  @override
  String get settingsSyncplayButton => 'SyncPlay Düğmesi';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Gezinme çubuğunda SyncPlay düğmesini göster';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Gelişmiş Düzeltme';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ayrıntılı senkronizasyon mantığını etkinleştirin';

  @override
  String get settingsSyncplaySyncCorrection => 'Senkronizasyon Düzeltmesi';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Senkronize kalmak için oynatmayı otomatik olarak ayarlayın';

  @override
  String get settingsSyncplaySpeedToSync => 'Senkronizasyon Hızı';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Senkronize etmek için oynatma hızı ayarını kullanın';

  @override
  String get settingsSyncplaySkipToSync => 'Senkronizasyona Geç';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Senkronize etmek için aramayı kullanın';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Minimum Hız Gecikmesi';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Maksimum Hız Gecikmesi';

  @override
  String get settingsSyncplaySpeedDuration => 'Hız Süresi';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimum Atlama Gecikmesi';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Ekstra Uzaklık';

  @override
  String get onNow => 'Şimdi';

  @override
  String get collections => 'Koleksiyonlar';

  @override
  String get lastPlayed => 'Son Oynanan';

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
  String get homeRowDisplay => 'Home Row Display';

  @override
  String get homeRowSections => 'Home Row Sections';

  @override
  String get homeRowToggles => 'Home Row Toggles';

  @override
  String get homeRowTogglesSubtitle =>
      'Enable or disable different home row categories';

  @override
  String get homeRowTogglesDescription =>
      'Enable the following toggles to display the rows in Home Sections.';

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
  String get displayPlaylistsRows => 'Display Playlist Rows';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Show Playlist rows in Home Sections.';

  @override
  String get playlistsRowSorting => 'Playlist Row Sorting';

  @override
  String get playlistsRowSortingDescription =>
      'Sort Playlist rows by date added, release date, alphabetically, and more.';

  @override
  String get displaySeerrRows => 'Display Seerr Discovery Rows';

  @override
  String get displaySeerrRowsSubtitle =>
      'Show Seerr discovery rows in Home Sections.';

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
