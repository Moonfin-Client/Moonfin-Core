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
  String get accountPreferences => 'Hesap Ayarları';

  @override
  String get interfaceLanguage => 'Arayüz Dili';

  @override
  String get systemLanguageDefault => 'Sistem Varsayılanı';

  @override
  String get signIn => 'Giriş yap';

  @override
  String get empty => 'Boş';

  @override
  String connectingToServer(String serverName) {
    return '$serverName sunucusuna bağlanılıyor';
  }

  @override
  String get quickConnect => 'Hızlı bağlantı';

  @override
  String get password => 'Şifre';

  @override
  String get username => 'Kullanıcı Adı';

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
  String get loginFailed => 'Giriş başarısız';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Hızlı Bağlantı kullanılamıyor: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Hızlı Bağlantı kullanılamıyor ($status): $detail';
  }

  @override
  String get whosWatching => 'Kim izliyor?';

  @override
  String get addUser => 'Kullanıcı Ekle';

  @override
  String get selectServer => 'Sunucu Seçin';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin sürümü $version';
  }

  @override
  String get savedServers => 'Kayıtlı Sunucular';

  @override
  String get discoveredServers => 'Keşfedilen Sunucular';

  @override
  String get noneFound => 'Sunucu bulunamadı';

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
    return '\"$serverName\" sunucularınızdan kaldırılsın mı?';
  }

  @override
  String get cancel => 'İptal';

  @override
  String get remove => 'Sil';

  @override
  String get connectToServer => 'Sunucuya Bağlan';

  @override
  String get serverAddress => 'Sunucu Adresi';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Bağlan';

  @override
  String get secureStorageUnavailable => 'Güvenli Depolama Kullanılamıyor';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin sistem anahtarlığınıza erişemedi. Giriş işlemine devam edilebilir, ancak anahtarlık kilidi açılana kadar güvenli jeton depolama özelliği kullanılamayabilir.';

  @override
  String get ok => 'Tamam';

  @override
  String get settingsAppearanceTheme => 'Uygulama Teması';

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
      'Uygulamayı yeniden başlatmadan Moonfin ve Neon Pulse arasında geçiş yapın';

  @override
  String get keyboardPreferSystemIme => 'Sistem klavyesini tercih et';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Metin girişi için varsayılan olarak cihazınızın giriş yöntemini kullanın';

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
  String get themeGlass => 'Cam';

  @override
  String get themeGlassSubtitle =>
      'Akan gradyan arka plan, buzlu yüzeyler ve Apple mavisi vurgulu sıvı-cam tasarımı';

  @override
  String get embyConnectSignInSubtitle =>
      'Emby Bağlantısı hesabınızla oturum açın';

  @override
  String get emailOrUsername => 'E-posta veya Kullanıcı Adı';

  @override
  String get selectAServer => 'Bir Sunucu Seçin';

  @override
  String get tryAgain => 'Tekrar deneyin';

  @override
  String get noLinkedServers => 'Bu Emby Bağlantısı hesabına bağlı sunucu yok';

  @override
  String get invalidEmbyConnectCredentials =>
      'Geçersiz Emby Bağlantısı kimlik bilgileri';

  @override
  String get invalidEmbyConnectLogin =>
      'Geçersiz Emby Bağlantısı kullanıcı adı veya şifresi';

  @override
  String get embyConnectExchangeNotSupported =>
      'Sunucu Emby Bağlantısı değişimini desteklemiyor';

  @override
  String get embyConnectNetworkError =>
      'Emby Bağlantısı veya seçilen sunucu ile iletişim kurulurken ağ hatası oluştu';

  @override
  String get loadingLinkedServers => 'Bağlantılı sunucular yükleniyor...';

  @override
  String get connectingToServerEllipsis => 'Sunucuya bağlanılıyor...';

  @override
  String get noReachableAddress => 'Ulaşılabilir adres belirtilmedi';

  @override
  String get invalidServerExchangeResponse =>
      'Sunucu takas uç noktasından geçersiz yanıt alındı';

  @override
  String unableToConnectTo(String target) {
    return '$target bağlantısı kurulamadı';
  }

  @override
  String get exitApp => 'Moonfin\'den çıkılsın mı?';

  @override
  String get exitAppConfirmation => 'Çıkmak istediğinizden emin misiniz?';

  @override
  String get exit => 'Çıkış';

  @override
  String get noHomeRowsLoaded => 'Ana sayfa satırları yüklenemedi';

  @override
  String get noHomeRowsHint =>
      'Sayfayı yenilemeyi veya aktif ana sayfa bölümlerini azaltmayı deneyin.';

  @override
  String get retryHomeRows => 'Ana sayfa satırlarını yeniden dene';

  @override
  String get guide => 'Rehber';

  @override
  String get recordings => 'Kayıtlar';

  @override
  String get schedule => 'Takvim';

  @override
  String get series => 'Diziler';

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
  String get library => 'Kütüphane';

  @override
  String get displaySettings => 'Ekran Ayarları';

  @override
  String get allGenres => 'Tüm Türler';

  @override
  String get noGenresFound => 'Tür bulunamadı';

  @override
  String failedToLoadFolderError(String error) {
    return 'Klasör yüklenemedi: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Bu klasör boş';

  @override
  String itemCountLabel(int count) {
    return '$count öğe';
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
    return '$count Öğe';
  }

  @override
  String get continuing => 'Devam ediyor';

  @override
  String get ended => 'Sona erdi';

  @override
  String get sortAndFilter => 'Sırala ve Filtrele';

  @override
  String get type => 'Tür';

  @override
  String get sortBy => 'Sıralama Ölçütü';

  @override
  String get display => 'Ekran';

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
    return '$name — Türler';
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
    return '${count}dk önce';
  }

  @override
  String hoursAgo(int count) {
    return '${count}sa önce';
  }

  @override
  String daysAgo(int count) {
    return '${count}g önce';
  }

  @override
  String get discoverySubjects => 'Keşif Kategorileri';

  @override
  String get pickDiscoverySubjects =>
      'Keşfet bölümünde hangi konu akışlarının gösterileceğini seçin.';

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
    return '$count başlıklar';
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
  String get listen => 'Dinle';

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
  String get pickUpAgain => 'Kaldığın Yerden Devam Et';

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
  String get jumpBackNarration =>
      'Kaldığınız yeri aramakla uğraşmadan anlatıya hemen geri dönün.';

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
    return '$count yazar';
  }

  @override
  String genresCount(int count) {
    return '$count tür';
  }

  @override
  String percentCompleted(int percent) {
    return '%$percent tamamlandı';
  }

  @override
  String get readyWhenYouAre => 'Sen hazır olduğunda hazırız';

  @override
  String get details => 'Detaylar';

  @override
  String get listeningRoom => 'Dinleme Odası';

  @override
  String get bookmarksAndProgress => 'Yer İmleri ve İlerleme';

  @override
  String titlesArrangedForBrowsing(int count) {
    return 'Okuma odaklı göz atma için düzenlenmiş $count başlık.';
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
  String get discover => 'Keşfet';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library\'den konularına göre popüler kitaplar.';

  @override
  String get noBookmarkedItems => 'Henüz favorilere eklenmiş öğe yok';

  @override
  String get nothingMatchesSection =>
      'Henüz bu bölümle eşleşen bir şey yok. Başka bir sekme deneyin veya kitaplık senkronizasyonu bittikten sonra tekrar gelin.';

  @override
  String get audiobooks => 'Sesli kitaplar';

  @override
  String noLabelFound(String label) {
    return '$label bulunamadı';
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
  String get readStatus => 'Oku';

  @override
  String get watched => 'İzlendi';

  @override
  String get unread => 'Okunmamış';

  @override
  String get unwatched => 'İzlenmedi';

  @override
  String get seriesStatus => 'Dizi Durumu';

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
      'LibriVox tarafından bu kitap için henüz bir açıklama girilmedi.';

  @override
  String get readers => 'Okuyucular';

  @override
  String get openLinks => 'Bağlantıları Aç';

  @override
  String get librivoxPage => 'LibriVox Sayfası';

  @override
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'RSS Akışı';

  @override
  String get downloadZip => 'Zip\'i İndir';

  @override
  String sectionCountLabel(int count) {
    return '$count bölüm';
  }

  @override
  String firstPublished(int year) {
    return 'İlk Yayınlanma $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Open Library\'de bu kitap için henüz bir özet bulunmuyor.';

  @override
  String get subjects => 'Konular';

  @override
  String get all => 'Tümü';

  @override
  String booksCount(int count) {
    return '$count kitap';
  }

  @override
  String get couldNotLoadSubject => 'Bu konu şu anda yüklenemiyor.';

  @override
  String get audiobookDetails => 'Sesli Kitap Ayrıntıları';

  @override
  String authorsCountTitle(int count) {
    return '$count Yazar';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sesli kitap',
      one: '1 sesli kitap',
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
  String get delete => 'Sil';

  @override
  String get save => 'Kaydet';

  @override
  String get moreLikeThis => 'Benzerleri';

  @override
  String get castAndCrew => 'Oyuncular ve Ekip';

  @override
  String get collection => 'Koleksiyon';

  @override
  String get episodes => 'Bölümler';

  @override
  String get nextUp => 'Sıradaki Bölümler';

  @override
  String get seasons => 'Sezonlar';

  @override
  String get chapters => 'Bölümler';

  @override
  String get features => 'Özel Özellikler';

  @override
  String get movies => 'Filmler';

  @override
  String get musicVideos => 'Müzik Videoları';

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
    return 'Disk $number';
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
    return 'Yayınlanma yılı: $year';
  }

  @override
  String get publicationDateUnknown => 'Yayınlanma tarihi bilinmiyor';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sezon',
      one: '1 Sezon',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Bitiş saati: $time';
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
    return '$time içinde sona eriyor';
  }

  @override
  String get view => 'Bak';

  @override
  String get resumeReading => 'Okumaya Devam Et';

  @override
  String get read => 'Oku';

  @override
  String resumeFrom(String position) {
    return '$position konumundan devam et';
  }

  @override
  String get play => 'Oynat';

  @override
  String get startOver => 'Yeniden Başla';

  @override
  String get restart => 'Yeniden başlat';

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
  String get cast => 'Yansıt';

  @override
  String get trailer => 'Fragman';

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
  String get download => 'İndir';

  @override
  String get deleteDownloaded => 'İndirilenleri Sil';

  @override
  String get goToSeries => 'Diziye Git';

  @override
  String get editMetadata => 'Meta Verileri Düzenle';

  @override
  String get less => 'Daha Az';

  @override
  String get more => 'Daha Fazla';

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
    return '\"$title\" için indirilen parçalar silinsin mi?';
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
    return 'Yüklü $itemLabel yok';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title indiriliyor ($count öge)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return '\"$name\" isimli ögeyi sunucudan silmek istediğinize emin misiniz? Bu işlem geri alınamaz.';
  }

  @override
  String get itemDeleted => 'Öğe silindi';

  @override
  String get noPlayableTrailerFound => 'Oynanabilir fragman bulunamadı.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Geçersiz kitap formatı: .$extension';
  }

  @override
  String get audioTrack => 'Ses Parçası';

  @override
  String get subtitleTrack => 'Altyazı Parçası';

  @override
  String get none => 'Hiçbiri';

  @override
  String get downloadSubtitlesLabel => 'Altyazıları indir...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles eklentisini kullanarak arama yapın';

  @override
  String get downloadSubtitles => 'Altyazıları İndir';

  @override
  String get selectedSubtitleInvalid => 'Seçilen altyazı geçersiz.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Altyazı indirildi ve seçildi: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Altyazı indirildi. Jellyfin öğeyi yenilerken görünmesi biraz zaman alabilir.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language dili için çevrimiçi altyazı bulunamadı.';
  }

  @override
  String get selectVersion => 'Sürüm Seç';

  @override
  String versionNumber(int number) {
    return 'Sürüm $number';
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
    return '$name indiriliyor ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'İndirilen Dosyaları Sil';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel için yerel dosyalar silinsin mi?\n\nBu işlem depolama alanında yer açacaktır. Daha sonra tekrar indirebilirsiniz.';
  }

  @override
  String get downloadedFilesDeleted => 'İndirilen dosyalar silindi';

  @override
  String get failedToDeleteFiles => 'Dosyalar silinemedi';

  @override
  String get deleteFiles => 'Dosyaları Sil';

  @override
  String get director => 'YÖNETMEN';

  @override
  String get directors => 'YÖNETMENLER';

  @override
  String get writer => 'YAZAR';

  @override
  String get writers => 'YAZARLAR';

  @override
  String get studio => 'STÜDYO';

  @override
  String studioMoreCount(int count) {
    return '+$count daha';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Bölüm';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return '$number. bölüm';
  }

  @override
  String chapterNumber(int number) {
    return '$number. kısım';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parça',
      one: '1 parça',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bölüm',
      one: '1 bölüm',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Doğum Tarihi: $date';
  }

  @override
  String died(String date) {
    return 'Ölüm Tarihi: $date';
  }

  @override
  String age(int age) {
    return 'Yaş: $age';
  }

  @override
  String get showLess => 'Daha Az Göster';

  @override
  String get readMore => 'Devamını oku';

  @override
  String get shuffle => 'Karıştır';

  @override
  String downloadsCount(int count) {
    return '$count indirme';
  }

  @override
  String get perfectMatch => 'Mükemmel eşleşme';

  @override
  String channelsCount(int count) {
    return '$count kanal';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Çevrimiçi altyazı $action işlemi, bu kullanıcı için Jellyfin altyazı yönetimi izni gerektirir.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Çevrimiçi altyazı $action işlemi için bu öge sunucuda bulunamadı.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Çevrimiçi altyazı $action işlemi başarısız oldu: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Çevrimiçi altyazı $action işlemi başarısız oldu (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Çevrimiçi altyazı $action işlemi başarısız oldu.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" için indirilen tüm bölümler';
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
    return '$label işlemi başarısız oldu: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Yansıtma ses düzeyi ayarlanamadı: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Kontroller';
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
    return '$label durdur';
  }

  @override
  String get queueIsEmpty => 'Sıra boş';

  @override
  String trackNumber(int number) {
    return 'Parça $number';
  }

  @override
  String get remotePlayback => 'Uzaktan Oynatma';

  @override
  String get castingToGoogleCast => 'Google Cast\'e yansıtılıyor';

  @override
  String get castingViaAirPlay => 'AirPlay ile yansıtılıyor';

  @override
  String get castingViaDlna => 'DLNA ile yansıtılıyor';

  @override
  String secondsCount(int seconds) {
    return '$seconds saniye';
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
  String get playback => 'Oynatma';

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
  String get container => 'Kapsayıcı';

  @override
  String get bitrate => 'Bit hızı';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Çözünürlük';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Video Bit Hızı';

  @override
  String get track => 'Parça';

  @override
  String get channels => 'Kanallar';

  @override
  String get audioBitrate => 'Ses Bit Hızı';

  @override
  String get sampleRate => 'Örnekleme Hızı';

  @override
  String get format => 'Format';

  @override
  String get external => 'Harici';

  @override
  String get embedded => 'Gömülü';

  @override
  String castSessionError(String protocol) {
    return '$protocol oturum hatası';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Kitap detayları yüklenemedi: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Uygulama içi EPUB görüntüleme henüz bu platformda desteklenmiyor.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Bu format (.$extension) henüz uygulama içinde görüntülenemiyor.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Gömülü belge oluşturma bu platformda kullanılamıyor.';

  @override
  String get couldNotOpenExternalViewer => 'Harici görüntüleyici açılamadı.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Uygulama içi okuyucu açılamadı: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return '$label konumunda zaten bir yer imi kayıtlı.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Yer imi eklendi: $label';
  }

  @override
  String get noBookmarksYet =>
      'Henüz yer işareti yok.\nKonumunuzu kaydetmek için okurken yer imi simgesine dokunun.';

  @override
  String get noTableOfContentsAvailable => 'İçindekiler tablosu mevcut değil';

  @override
  String pageLabel(int number) {
    return '$number. Sayfa';
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
    return '%$percent okundu';
  }

  @override
  String get updating => 'Güncelleniyor...';

  @override
  String get markUnread => 'Okunmadı Olarak İşaretle';

  @override
  String get markAsRead => 'Okundu Olarak İşaretle';

  @override
  String get reloadReader => 'Okuyucuyu Yeniden Yükle';

  @override
  String get noPagesFound => 'Hiçbir sayfa bulunamadı.';

  @override
  String get failedToDecodePageImage => 'Sayfa resmi yüklenemedi.';

  @override
  String resetZoom(String zoom) {
    return 'Yakınlaştırmaya sıfırla (${zoom}x)';
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
    return 'Okuma durumu güncellenemedi: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistem';

  @override
  String get themeLight => 'Tema: Aydınlık';

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
    return 'Bu platform, $extension dosyaları için yerleşik doküman motorunu desteklemiyor.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Desteklenen bir platform hedefine (Android, iOS, macOS) geçiş yaptıktan sonra Okuyucuyu Yeniden Yükle seçeneğini kullanın.';

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
    return 'Rehber yüklenemedi: $error';
  }

  @override
  String get noChannelsFound => 'Hiçbir kanal bulunamadı';

  @override
  String get liveBadge => 'CANLI';

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
  String get record => 'Kayıt';

  @override
  String get cancelRecordingAction => 'Kaydı iptal et';

  @override
  String get programSetToRecord => 'Program kaydedilmek üzere ayarlandı';

  @override
  String get recordingCancelled => 'Kayıt iptal edildi';

  @override
  String get unableToCreateRecording => 'Kayıt oluşturulamadı';

  @override
  String get watch => 'İzle';

  @override
  String get close => 'Kapat';

  @override
  String failedToPlayChannel(String name) {
    return '$name oynatılamadı';
  }

  @override
  String get failedToLoadRecordings => 'Kayıtlar yüklenemedi';

  @override
  String get scheduledInNext24Hours => 'Önümüzdeki 24 Saat İçinde Planlandı';

  @override
  String get recentRecordings => 'Son Kayıtlar';

  @override
  String get tvSeries => 'Dizi';

  @override
  String get failedToLoadSchedule => 'Program yüklenemedi';

  @override
  String get noScheduledRecordings => 'Planlanmış kayıt yok';

  @override
  String get cancelRecording => 'Kayıt İptal Edilsin mi?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\" için zamanlanmış kayıt iptal edilsin mi?';
  }

  @override
  String get no => 'Hayır';

  @override
  String get yesCancel => 'Evet, İptal';

  @override
  String get failedToCancelRecording => 'Kayıt iptal edilemedi';

  @override
  String get failedToLoadSeriesRecordings => 'Seri kayıtları yüklenemedi';

  @override
  String get noSeriesRecordings => 'Dizi kaydı yok';

  @override
  String get cancelSeriesRecording => 'Dizi Kaydını İptal Et';

  @override
  String get cancelSeriesRecordingQuestion => 'Dizi Kaydı İptal Edilsin mi?';

  @override
  String stopRecordingName(String name) {
    return '\"$name\" kaydı durdurulsun mu?';
  }

  @override
  String get failedToCancelSeriesRecording => 'Dizi kaydı iptal edilemedi';

  @override
  String get searchThisLibrary => 'Bu kütüphaneyi arayın...';

  @override
  String get searchEllipsis => 'Ara...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" için sonuç bulunamadı';
  }

  @override
  String searchFailedError(String error) {
    return 'Arama hata verdi: $error';
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
  String get tvShows => 'Diziler';

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
    return '\"$name\" ve dosyaları kaldırılsın mı?';
  }

  @override
  String tracksCount(int count) {
    return '$count parça';
  }

  @override
  String get album => 'Albüm';

  @override
  String get playAlbum => 'Albümü Çal';

  @override
  String failedToLoadAlbum(String error) {
    return 'Albüm yüklenemedi: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name için indirilmiş parça bulunamadı.';
  }

  @override
  String get season => 'Sezon';

  @override
  String get errorLoadingEpisodes => 'Bölümler yüklenirken hata oluştu';

  @override
  String get noDownloadedEpisodes => 'İndirilen bölüm yok';

  @override
  String get deleteEpisode => 'Bölümü Sil';

  @override
  String removeName(String name) {
    return '\"$name\" kaldırılsın mı?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return '$number. Bölüm';
  }

  @override
  String get seriesNotFound => 'Dizi bulunamadı';

  @override
  String get errorLoadingSeries => 'Dizi yüklenirken hata oluştu';

  @override
  String get downloadedEpisodes => 'İndirilen Bölümler';

  @override
  String seasonNumber(int number) {
    return '$number. Sezon';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Özel Bölümler';

  @override
  String get deleteSeason => 'Sezonu Sil';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season içindeki tüm indirilmiş bölümler silinsin mi?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bölüm',
      one: '1 bölüm',
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
    return 'İndirilen $count öge silinsin mi?';
  }

  @override
  String get musicAndAudiobooks => 'Müzik ve Sesli Kitaplar';

  @override
  String get images => 'Görseller';

  @override
  String get database => 'Veritabanı';

  @override
  String ofStorageLimit(String limit) {
    return '/ $limit';
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
    return '$count seçenek';
  }

  @override
  String get themeAndAppearance => 'Tema & Görünüm';

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
  String get desktopUiScale => 'Arayüz Ölçeklendirme';

  @override
  String get scaleFocusedCards =>
      'Ölçek odaklı veya fareyle üzerine gelinen kartlar ve kutucuklar';

  @override
  String get backgroundBackdrops => 'Arka Plan Görselleri';

  @override
  String get showBackdropImages =>
      'İçeriğin arkasındaki arka plan resimlerini göster';

  @override
  String get seriesThumbnails => 'Dizi Küçük Resimlerini Göster';

  @override
  String get seriesThumbnailsDescription =>
      'Diziler için bölüm küçük resmi yerine ana dizi görselini kullan.';

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
  String get seasonalEffects => 'Mevsim Efektleri';

  @override
  String get seasonalEffectsDescription =>
      'Görsel efektler ve mevsimsel dekorasyonlar';

  @override
  String get snow => 'Kar';

  @override
  String get fireworks => 'Havai fişek';

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
    return '%$value';
  }

  @override
  String get themeMusicOnHomeRows => 'Ana Sayfalarda Tema Müziği';

  @override
  String get playWhenBrowsingHomeScreen => 'Ana ekrana göz atarken oynat';

  @override
  String get detailsBackgroundBlur => 'Detay Arka Plan Bulanıklığı';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Gezinme Arka Plan Bulanıklığı';

  @override
  String get maxStreamingBitrate => 'Maksimum Akış Bit Hızı';

  @override
  String get maxResolution => 'Maksimum Çözünürlük';

  @override
  String get playerZoomMode => 'Oynatıcı Yakınlaştırma Modu';

  @override
  String get settingsScrollWheelAction => 'Fare tekerleği';

  @override
  String get settingsScrollWheelActionDescription =>
      'Oynatma sırasında video üzerinde fare tekerleğini kaydırmanın ne işe yarayacağını seçin.';

  @override
  String get scrollWheelActionOff => 'Kapalı';

  @override
  String get scrollWheelActionSeek => 'Sar (İleri / Geri)';

  @override
  String get scrollWheelActionVolume => 'Ses';

  @override
  String get playerTooltipVolume => 'Ses';

  @override
  String get fit => 'Sığdır';

  @override
  String get autoCrop => 'Otomatik Kırp';

  @override
  String get stretch => 'Uzat';

  @override
  String get refreshRateSwitching => 'Yenileme Hızını Değiştir';

  @override
  String get disabled => 'Devre Dışı';

  @override
  String get scaleOnTv => 'TV\'de Ölçekle';

  @override
  String get scaleOnDevice => 'Cihazda Ölçekle';

  @override
  String get trickPlay => 'Hızlı Oynatma Görselleri';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Sararken önizleme küçük resimlerini göster';

  @override
  String get showDescriptionOnPause => 'Duraklatıldığında Açıklamayı Göster';

  @override
  String get dimVideoShowOverview =>
      'Duraklatıldığında videoyu karart ve özet metnini göster';

  @override
  String get osdLockButton => 'Ekran Kilidi Butonu';

  @override
  String get osdLockButtonDescription =>
      'Uzun basılana kadar dokunma girişini engelleyen bir kilitleme düğmesi göster';

  @override
  String get audioBehavior => 'Ses Davranışı';

  @override
  String get downmixToStereo => 'Stereo\'ya Dönüştür';

  @override
  String get defaultAudioLanguage => 'Varsayılan Ses Dili';

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
  String get autoServerDefault => 'Otomatik (Sunucu Varsayılanı)';

  @override
  String get english => 'İngilizce';

  @override
  String get spanish => 'İspanyolca';

  @override
  String get french => 'Fransızca';

  @override
  String get german => 'Almanca';

  @override
  String get italian => 'İtalyanca';

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
  String get danish => 'Danca';

  @override
  String get finnish => 'Fince';

  @override
  String get polish => 'Lehçe';

  @override
  String get ac3Passthrough => 'AC3 Doğrudan Geçiş (Passthrough)';

  @override
  String get dtsPassthrough => 'DTS Doğrudan Geçiş (Passthrough)';

  @override
  String get trueHdSupport => 'TrueHD Desteği';

  @override
  String get enableDtsPassthrough =>
      'DTS sesi yalnızca AVR\'ye bitstream olarak aktar; alıcı desteği ve DTS kaynak izi gerektirir';

  @override
  String get enableTrueHdAudio =>
      'TrueHD sesi etkinleştir (tüm platformlarda çalışmayabilir)';

  @override
  String get settingsAudioOutputMode => 'Ses Çıkış Modu';

  @override
  String get settingsAudioOutputModeDescription =>
      'Ses çözme yöntemini seçin. AVR Doğrudan Geçiş (Passthrough), ham Dolby/DTS akışlarını alıcınıza gönderir; Otomatik veya Downmix ise sesi cihazınızda çözer.';

  @override
  String get settingsAudioOutputModeAvrPassthrough =>
      'AVR Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioFallbackCodec => 'Yedek Ses Kodeki';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Kaynak akış doğrudan oynatılamadığında veya doğrudan geçiş (passthrough) yapılamadığında, çok kanallı sesin dönüştürüleceği hedef formatı seçin.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Otomatik Algıla\n(Önerilen)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Varsayılan)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Kayıpsız)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Sadece Stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Verimli)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Kayıpsız)';

  @override
  String get settingsMaxAudioChannels => 'Maksimum Kanal Sayısı';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Ses sisteminizin maksimum kanal sayısını yapılandırın. Bu sınırı aşan çok kanallı akışlar downmix yapılacak (azaltılacak) veya dönüştürülecektir.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Otomatik Algıla\n(Donanım Varsayılanı)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kuadrafonik';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced =>
      'Doğrudan Geçiş(Passthrough) (Gelişmiş)';

  @override
  String get settingsAudioCodecPassthrough =>
      'Kodek Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Yalnızca AVR veya HDMI alıcınızın desteklediği formatları etkinleştirin.';

  @override
  String get settingsAudioEac3Passthrough =>
      'EAC3 Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioEac3JocPassthrough =>
      'EAC3 JOC (Atmos) Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioDtsCorePassthrough =>
      'DTS Core Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioDtsHdPassthrough =>
      'DTS-HD MA Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioTrueHdPassthrough =>
      'TrueHD Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioTrueHdAtmosPassthrough =>
      'TrueHD Atmos Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) ses akışını harici dekodere ilet.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) üzerinden Dolby Atmos ses akışını harici dekodere ilet.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'DTS çekirdeğini içeren DTS-HD MA ses akışını harici dekodere ilet.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos meta verileri içeren Dolby TrueHD ses akışını harici dekodere ilet.';

  @override
  String get settingsDetectedAudioCapabilities => 'Algılanan Ses Özellikleri';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Henüz çalışma zamanı yetenek profili mevcut değil.';

  @override
  String get settingsAudioRouteLabel => 'Ses Çıkışı';

  @override
  String get settingsAudioDecodeLabel => 'Kod Çözme';

  @override
  String get settingsAudioPassthroughLabel => 'Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioHdRoute => 'HD Ses Çıkısı';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Hoparlör';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kanal PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Tanılama';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Video Seviyesi';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Video Aralığı';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Altyazı Kodeki';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'İzin Verilen Ses Kodekleri';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS Ses Kodekleri';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 Ses Kodekleri';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif doğrudan geçiş (passthrough)';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktif Ses Çıkışı';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'HD Ses Çıkışı Desteği';

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
  String get nextUpAndQueuing => 'Sıradaki Bölümler ve Sıraya Alma';

  @override
  String get nextUpDisplay => 'Sıradaki Bölümler Görünümü';

  @override
  String get extended => 'Uzatılmış';

  @override
  String get minimal => 'Sade';

  @override
  String get nextUpTimeout => 'Sıradaki Bölümler Zaman Aşımı';

  @override
  String secondsValue(int value) {
    return '${value}sn';
  }

  @override
  String get mediaQueuing => 'Medya Kuyruğa Alma';

  @override
  String get autoQueueNextEpisodes =>
      'Sonraki bölümleri otomatik olarak sıraya koy';

  @override
  String get stillWatchingPrompt => 'Hâlâ İzliyor musunuz? Uyarısı';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes bölüm / $hours saat sonra';
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
  String get skipBackLength => 'Geri Sarma Uzunluğu';

  @override
  String get skipForwardLength => 'İleri Sarma Uzunluğu';

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
      'Hızlı kahverengi tilki tembel köpeğin üzerinden atlıyor';

  @override
  String get verticalOffset => 'Dikey Hizalama';

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
  String get global => 'Evrensel';

  @override
  String get desktop => 'Masaüstü';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'Televizyon';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile profil ayarları yüklendi.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile profil ayarları yüklenemedi.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Yerel ayarlar $profile profiliyle senkronize edildi.';
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
  String get syncToProfile => 'Profili Senkronize Et';

  @override
  String get profileSyncHidden => 'Profil Senkronizasyonunu Gizle';

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
  String get storage => 'Depolama';

  @override
  String get storageUsed => 'Kullanılan Depolama';

  @override
  String get manage => 'Yönet';

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
  String get confirm => 'Onaylama';

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
  String get enable => 'Etkinleştir';

  @override
  String get clearAllDownloadsWarning =>
      'Bu, indirilen tüm medyayı silecektir ve bu işlem geri alınamaz.';

  @override
  String get clearAll => 'Tümünü Temizle';

  @override
  String get navigationStyle => 'Gezinme Stili';

  @override
  String get topBar => 'Üst Bar';

  @override
  String get leftSidebar => 'Sol Kenar Çubuğu';

  @override
  String get showShuffleButton => 'Karıştır Butonunu Göster';

  @override
  String get showGenresButton => 'Türleri Butonunu Göster';

  @override
  String get showFavoritesButton => 'Favoriler Butonunu Göster';

  @override
  String get showLibrariesInToolbar => 'Kitaplıkları Araç Çubuğunda Göster';

  @override
  String get showSeerrButton => 'Seerr Butonunu Göster';

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
  String get teal => 'Ördekbaşı';

  @override
  String get navy => 'Lacivert';

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
  String get indigo => 'Çivit Mavisi';

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
      'Kütüphane Bazlı Ayarları Geçersiz Kıl';

  @override
  String get applyImageTypeToAllLibraries =>
      'Görüntü türünü tüm kitaplıklara uygula';

  @override
  String get multiServerLibraries => 'Çoklu Sunucu Kütüphaneleri';

  @override
  String get showLibrariesFromAllServers =>
      'Bağlı tüm sunuculardaki kitaplıkları göster';

  @override
  String get enableFolderView => 'Klasör Görünümünü Etkinleştir';

  @override
  String get showFolderBrowsingOption => 'Klasöre göz atma seçeneğini göster';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'Kütüphane Görünürlüğü';

  @override
  String get libraryVisibilityDescription =>
      'Kitaplık başına ana sayfa görünürlüğünü değiştirin. Değişikliklerin etkili olması için Moonfin yeniden başlatın.';

  @override
  String get showInNavigation => 'Menüde Göster';

  @override
  String get showInLatestMedia => 'Son Eklenenlerde Göster';

  @override
  String get sourceLibraries => 'Kaynak Kütüphaneler';

  @override
  String get sourceCollections => 'Kaynak Koleksiyonlar';

  @override
  String get excludedGenres => 'Hariç Tutulan Türler';

  @override
  String get selectAll => 'Tümünü Seç';

  @override
  String itemsSelected(int count) {
    return '$count öge seçildi';
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
  String get mediaBarMode => 'Medya Çubuğu Stili';

  @override
  String get mediaBarModeDescription =>
      'Çeşitli medya çubuğu stilleri arasından seçim yapın veya medya çubuğunu kapatın';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Kapalı';

  @override
  String get enableMediaBar => 'Medya Çubuğunu Etkinleştir';

  @override
  String get showFeaturedContentSlideshow =>
      'Ana Sayfada Öne Çıkanlar Slaytını Göster';

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
  String get homeSections => 'Ana Sayfa Bölümleri';

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
      'İzlemeye Devam Et ve Sıradaki Bölümleri Birleştir';

  @override
  String get combineBothRows =>
      'Her iki satırı tek bir ana bölümde birleştirin';

  @override
  String get fullScreenRows => 'Genişletilmiş Ana Sayfa Satırları';

  @override
  String get fullScreenRowsDescription =>
      'Ana sayfa satırlarını ekran başına 1 satırla sınırla';

  @override
  String get perRowImageType => 'Satır Başına Görüntü Türü';

  @override
  String get perRowSettings => 'Satır Başına Ayarlar';

  @override
  String get autoLogin => 'Otomatik Giriş';

  @override
  String get lastUser => 'Son Kullanıcı';

  @override
  String get currentUser => 'Mevcut Kullanıcı';

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
  String get screensaver => 'Ekran Koruyucu';

  @override
  String get inAppScreensaver => 'Uygulama İçi Ekran Koruyucu';

  @override
  String get enableBuiltInScreensaver =>
      'Yerleşik ekran koruyucuyu etkinleştirin';

  @override
  String get mode => 'Mod';

  @override
  String get libraryArt => 'Kütüphane Görselleri';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Saat';

  @override
  String get timeout => 'Zaman aşımı';

  @override
  String minutesShort(int minutes) {
    return '$minutes dk';
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
  String get clockModeStatic => 'Statik';

  @override
  String get clockModeBouncing => 'Zıplayan';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Eleştirmenler)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Seyirci)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (Kullanıcı)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Topluluk Puanı';

  @override
  String get ratings => 'Puanlar';

  @override
  String get additionalRatings => 'Ek Derecelendirmeler';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList ve TMDB puanlarını göster';

  @override
  String get ratingLabels => 'Puan Etiketleri';

  @override
  String get showLabelsNextToIcons =>
      'Puan simgelerinin yanında etiketleri göster';

  @override
  String get ratingBadges => 'Puan Rozetleri';

  @override
  String get showDecorativeBadges =>
      'Puanların arkasında dekoratif rozetler göster';

  @override
  String get episodeRatings => 'Bölüm Puanları';

  @override
  String get showRatingsOnEpisodes =>
      'Ayrı bölümlerdeki derecelendirmeleri göster';

  @override
  String get ratingSources => 'Derecelendirme Kaynakları';

  @override
  String get ratingSourcesDescription =>
      'Uygulama genelinde gösterilen puan kaynaklarını etkinleştirin ve yeniden sıralayın';

  @override
  String get pluginLabel => 'Moonbase Eklentisi';

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
    return '$status\nSürüm: $version';
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
  String get popularSeries => 'Popüler Diziler';

  @override
  String get seriesGenres => 'Dizi Türleri';

  @override
  String get upcomingSeries => 'Gelecek Diziler';

  @override
  String get networks => 'Yayıncılar';

  @override
  String get seerrDiscoveryRows => 'Seerr Keşfet Satırları';

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
  String get nsfwFilter => 'Hassas İçerik Filtresi';

  @override
  String get hideAdultContent =>
      'Sonuçlardaki yetişkinlere uygun içeriği gizle';

  @override
  String loggedInAs(String username) {
    return '$username olarak oturum açıldı';
  }

  @override
  String get discoverRows => 'Keşfet Satırları';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Yeniden sıralamak için sürükleyin. Satırları etkinleştirin veya devre dışı bırakın. Etkinleştirilen satır sırası, Moonfin eklentisiyle senkronize edilir.';

  @override
  String get discoverRowsDescription =>
      'Yeniden sıralamak için sürükleyin. Satırları etkinleştirin veya devre dışı bırakın.';

  @override
  String get enabled => 'Etkinleştirildi';

  @override
  String get hidden => 'Gizli';

  @override
  String get aboutTitle => 'Hakkında';

  @override
  String versionValue(String version) {
    return 'Sürüm $version';
  }

  @override
  String get openSourceLicenses => 'Açık Kaynak Lisansları';

  @override
  String get sourceCode => 'Kaynak Kodu';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'Güncelleme mevcut: v$version';
  }

  @override
  String get updateNotifications => 'Bildirimleri Güncelle';

  @override
  String get showWhenUpdatesAvailable =>
      'Güncellemelerin ne zaman mevcut olduğunu göster';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Mevcut';
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
  String get navigation => 'Menü';

  @override
  String get watchedIndicatorsBackdrops => 'İzlendi İşaretleri, Arka Planlar';

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
  String get clear => 'Temizle';

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
    return '$count Öğe';
  }

  @override
  String get seerrSettings => 'Seerr Ayarları';

  @override
  String get requestMore => 'Daha Fazla Talep Et';

  @override
  String get request => 'İste';

  @override
  String get cancelRequest => 'İsteği İptal Et';

  @override
  String get playInMoonfin => 'Moonfin\'da oynat';

  @override
  String requestedByName(String name) {
    return '$name tarafından istendi';
  }

  @override
  String get approve => 'Onayla';

  @override
  String get declineAction => 'Reddet';

  @override
  String get similar => 'Benzer';

  @override
  String get recommendations => 'Öneriler';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\" isteği iptal edilsin mi?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" için yapılan $count istek iptal edilsin mi?';
  }

  @override
  String get keep => 'Sakla';

  @override
  String get itemNotFoundInLibrary => 'Öğe Moonfin kitaplığınızda bulunamadı';

  @override
  String get errorSearchingLibrary => 'Kitaplık aranırken hata oluştu';

  @override
  String budgetAmount(String amount) {
    return 'Bütçe: $amount \$';
  }

  @override
  String revenueAmount(String amount) {
    return 'Hasılat: $amount \$';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'İste $type';
  }

  @override
  String get submitRequest => 'Talebi Gönder';

  @override
  String get allSeasons => 'Tüm Sezonlar';

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
  String get crewSection => 'Ekip';

  @override
  String ageValue(int age) {
    return 'yaş $age';
  }

  @override
  String get noRequests => 'Talep yok';

  @override
  String get pendingStatus => 'Bekleniyor';

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
  String get blocklistedStatus => 'Engellenenler listesinde';

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
  String get runtimeLabel => 'Süre';

  @override
  String get budgetLabel => 'Bütçe';

  @override
  String get originalLanguageLabel => 'Orijinal Dil';

  @override
  String get seasonsLabel => 'Sezonlar';

  @override
  String get episodesLabel => 'Bölümler';

  @override
  String get access => 'Erişim';

  @override
  String get add => 'Ekle';

  @override
  String get address => 'Adres';

  @override
  String get analytics => 'Analizler';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'İçerik';

  @override
  String get copy => 'Kopyala';

  @override
  String get create => 'Oluştur';

  @override
  String get disable => 'Devre dışı bırak';

  @override
  String get done => 'Tamamlandı';

  @override
  String get edit => 'Düzenle';

  @override
  String get encoding => 'Kodlama';

  @override
  String get error => 'Hata';

  @override
  String get forward => 'İleri';

  @override
  String get general => 'Genel';

  @override
  String get go => 'Git';

  @override
  String get install => 'Kur';

  @override
  String get installed => 'Yüklendi';

  @override
  String get interval => 'Aralık';

  @override
  String get name => 'İsim';

  @override
  String get networking => 'Ağ Ayarları';

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
  String get provider => 'Sağlayıcı';

  @override
  String get refresh => 'Yenile';

  @override
  String get remote => 'Uzak';

  @override
  String get rename => 'Yeniden adlandır';

  @override
  String get revoke => 'Geri çek';

  @override
  String get role => 'Rol';

  @override
  String get root => 'Kök';

  @override
  String get run => 'Çalıştır';

  @override
  String get search => 'Ara';

  @override
  String get select => 'Seç';

  @override
  String get send => 'Gönder';

  @override
  String get sessions => 'Oturumlar';

  @override
  String get set => 'Ayarla';

  @override
  String get status => 'Durum';

  @override
  String get stop => 'Durdur';

  @override
  String get streaming => 'Akış';

  @override
  String get time => 'Zaman';

  @override
  String get trickplay => 'Önizleme Resimleri';

  @override
  String get uninstall => 'Kaldır';

  @override
  String get up => 'Yukarı';

  @override
  String get update => 'Güncelleme';

  @override
  String get upload => 'Yükle';

  @override
  String get unmute => 'Sesini aç';

  @override
  String get mute => 'Sesini kapat';

  @override
  String get branding => 'Markalaşma';

  @override
  String get adminDrawerDashboard => 'Kontrol Paneli';

  @override
  String get adminDrawerAnalytics => 'Analizler';

  @override
  String get adminDrawerSettings => 'Ayarlar';

  @override
  String get adminDrawerBranding => 'Markalaşma';

  @override
  String get adminDrawerUsers => 'Kullanıcılar';

  @override
  String get adminDrawerLibraries => 'Kütüphaneler';

  @override
  String get adminDrawerTranscoding => 'Kod dönüştür';

  @override
  String get adminDrawerResume => 'Sürdür';

  @override
  String get adminDrawerStreaming => 'Akış';

  @override
  String get adminDrawerTrickplay => 'Önizleme Resimleri';

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
    return '$count eklenti güncellemesi mevcut';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Yeniden başlatılması gereken $count eklenti var';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return '$count zamanlanmış görev başarısız oldu';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Son uyarı/hata kayıtları:$count';
  }

  @override
  String get analyticsMediaDistribution => 'Medya Dağıtımı';

  @override
  String get analyticsVideoCodecs => 'Video Kodekleri';

  @override
  String get analyticsAudioCodecs => 'Ses Kodekleri';

  @override
  String get analyticsContainers => 'Kapsayıcılar';

  @override
  String get analyticsTopGenres => 'En Popüler Türler';

  @override
  String get analyticsReleaseYears => 'Yayın Yılları';

  @override
  String get analyticsContentRatings => 'İçerik Derecelendirmeleri';

  @override
  String get analyticsRuntimeBuckets => 'Süre Grupları';

  @override
  String get analyticsFileFormats => 'Dosya Formatları';

  @override
  String get analyticsNoData => 'Mevcut Veri Yok.';

  @override
  String get adminServerInfo => 'Sunucu Bilgileri';

  @override
  String get adminRestartPending => 'Yeniden Başlatma Bekleniyor';

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
    return 'Hata: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Sunucu yeniden başlatma işlemi devam ediyor';

  @override
  String get adminServerRebootMessage =>
      'Sunucu yeniden başlatılıyor, lütfen Moonfin\'i yeniden başlatın';

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
    return 'Komut başarısız oldu:$error';
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
  String get sessionVolumeDown => 'Ses –';

  @override
  String get sessionVolumeUp => 'Ses +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Şimdi Oynuyor';

  @override
  String get volume => 'Ses';

  @override
  String get actions => 'Eylemler';

  @override
  String get videoCodec => 'Video Kodeki';

  @override
  String get audioCodec => 'Ses Kodeki';

  @override
  String get hwAccel => 'Donanım Hızlandırma';

  @override
  String get completion => 'Tamamlama';

  @override
  String get direct => 'Doğrudan';

  @override
  String get adminDisconnect => 'Bağlantıyı kes';

  @override
  String get adminClearDates => 'Tarihleri temizle';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Etkinlik günlüğü yüklenemedi:$error';
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
    return 'Cihaz güncellenemedi:$error';
  }

  @override
  String get adminDeleteDevice => 'Cihazı Sil';

  @override
  String get adminDeviceDeleted => 'Cihaz silindi';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Cihaz silinemedi: $error';
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
    return 'Tarama başlatılamadı: $error';
  }

  @override
  String get adminRenameLibrary => 'Kitaplığı Yeniden Adlandır';

  @override
  String get adminNewName => 'Yeni isim';

  @override
  String adminLibraryRenamed(String name) {
    return 'Kitaplık adı \"$name\" olarak değiştirildi';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Yeniden adlandırılamadı: $error';
  }

  @override
  String get adminDeleteLibrary => 'Kitaplığı Sil';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" kitaplığı silindi';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Kitaplık silinemedi: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Yol eklenemedi: $error';
  }

  @override
  String get adminRemovePath => 'Yolu Kaldır';

  @override
  String adminRemovePathConfirm(String path) {
    return '\"$path\" yolu bu kitaplıktan kaldırılsın mı?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Yol kaldırılamadı: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Kitaplık seçenekleri kaydedildi';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Seçenekler kaydedilemedi: $error';
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
  String get adminMetadataLanguageHint => 'Örn. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Meta veri ülke kodu';

  @override
  String get adminMetadataCountryHint => 'Örn. US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Kitaplık adı gerekli';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Kitaplık oluşturulamadı: $error';
  }

  @override
  String get adminLibraryName => 'Kütüphane Adı';

  @override
  String get adminSelectedPaths => 'Seçilen Yollar:';

  @override
  String get adminNoPathsAdded => 'Yol eklenmedi (daha sonra eklenebilir)';

  @override
  String get adminCreateLibrary => 'Kütüphane Oluştur';

  @override
  String get paths => 'Yollar:';

  @override
  String get adminDisableUser => 'Kullanıcıyı Devre Dışı Bırak';

  @override
  String get adminEnableUser => 'Kullanıcıyı Etkinleştir';

  @override
  String adminDisableUserConfirm(String name) {
    return '\"$name\" kullanıcısı devre dışı bırakılsın mı? Giriş yapamayacaklar.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '\"$name\" kullanıcısı etkinleştirilsin mı? Tekrar giriş yapabilecekler.';
  }

  @override
  String adminUserDisabled(String name) {
    return '\"$name\" kullanıcısı devre dışı bırakıldı';
  }

  @override
  String adminUserEnabled(String name) {
    return '\"$name\" kullanıcısı etkinleştirildi';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Kullanıcı politikası güncellenemedi: $error';
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
    return 'Kullanıcı oluşturulamadı: $error';
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
    return 'Kaydedilemedi: $error';
  }

  @override
  String get adminPermissionsSaved => 'İzinler kaydedildi';

  @override
  String get adminPasswordsMismatch => 'Şifreler eşleşmiyor';

  @override
  String adminFailed(String error) {
    return 'Başarısız oldu: $error';
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
    return 'Sunucu yanıtı: HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return '$name öğesini silmek istediğinizden emin misiniz?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" kullanıcısı silindi';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Kullanıcı silinemedi: $error';
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
    return 'Anahtar oluşturulamadı: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Sunucu yanıtında anahtar belirteci eksik';

  @override
  String get adminRevokeApiKey => 'API Anahtarını İptal Et';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name için anahtar iptal edilsin mi?';
  }

  @override
  String get adminApiKeyRevoked => 'API anahtarı iptal edildi';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Anahtar iptal edilemedi: $error';
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
    return 'Jeton: $token\\nOluşturulma tarihi: $created';
  }

  @override
  String get adminCreatingBackup => 'Yedek oluşturuluyor...';

  @override
  String get adminBackupCreated => 'Yedekleme başarıyla oluşturuldu';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Yedek oluşturulamadı: $error';
  }

  @override
  String get adminBackupPathMissing => 'Sunucu yanıtında yedekleme yolu eksik';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Manifest yüklenemedi: $error';
  }

  @override
  String get adminConfirmRestore => 'Geri Yüklemeyi Onayla';

  @override
  String get adminRestoringBackup => 'Yedekleme geri yükleniyor...';

  @override
  String adminRestoreFailed(String error) {
    return 'Yedek geri yüklenemedi: $error';
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
  String get restore => 'Geri Yükle';

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
    return '$path konumuna kaydedildi';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Dosya kaydedilemedi: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Dosya yüklenemedi: $fileName';
  }

  @override
  String get adminSearchInLog => 'Günlükte ara';

  @override
  String get adminNoMatchingLines => 'Eşleşen çizgi yok';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Görevler yüklenemedi: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Zamanlanmış görev bulunamadı';

  @override
  String get adminNoTasksMatchFilter => 'Geçerli filtreyle eşleşen görev yok';

  @override
  String adminTaskStartFailed(String error) {
    return 'Görev başlatılamadı: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Görev durdurulamadı: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Görev yüklenemedi: $error';
  }

  @override
  String get adminRunNow => 'Şimdi Çalıştır';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Tetikleyici kaldırılamadı: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Tetikleyici eklenemedi: $error';
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
    return '$hours saat';
  }

  @override
  String get adminDayOfWeek => 'Haftanın günü';

  @override
  String get adminSearchPlugins => 'Eklentileri ara...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Eklenti durumu değiştirilemedi: $error';
  }

  @override
  String get adminUninstallPlugin => 'Eklentiyi Kaldır';

  @override
  String adminUninstallPluginConfirm(String name) {
    return '\"$name\" eklentisini kaldırmak istediğinize emin misiniz?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Eklenti kaldırılamadı: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Paket yüklenemedi: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Güncelleme yüklenemedi: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Eklentiler yüklenemedi: $error';
  }

  @override
  String get adminNoPluginsMatchSearch => 'Aramanızla eşleşen eklenti yok';

  @override
  String get adminNoPluginsInstalled => 'Hiçbir eklenti yüklü değil';

  @override
  String adminInstallUpdate(String version) {
    return 'Güncellemeyi yükle (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Katalog yüklenemedi: $error';
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
  String get continueAction => 'Devam et';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" sunucu yeniden başlatıldıktan sonra kaldırılacak';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Kaldırılamadı: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\", v$version sürümüne güncelleniyor...';
  }

  @override
  String get adminMissingAuthToken =>
      'Ayarlar açılamıyor: Kimlik doğrulama jetonu eksik.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Eklenti yüklenemedi: $error';
  }

  @override
  String get adminPluginNotFound => 'Eklenti bulunamadı';

  @override
  String adminPluginVersion(String version) {
    return 'Sürüm $version';
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
    return '\"$name\" ögesini kaldırmak istediğinize emin misiniz?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Depolar kaydedilemedi: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Depolar yüklenemedi: $error';
  }

  @override
  String get adminRepositoryNameHint => 'Örn. Jellyfin Kararlı';

  @override
  String get adminRepositoryUrl => 'Depo URL\'si';

  @override
  String get adminAddEntry => 'Giriş ekle';

  @override
  String get adminInvalidUrl => 'Geçersiz URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Eklenti ayarları yüklenemedi: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri açılamadı';
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
  String get adminLoginDisclaimer => 'Giriş Uyarı Metni';

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
  String get adminEnableHardwareEncoding => 'Donanım kodlamayı etkinleştir';

  @override
  String get adminEnableHardwareDecoding =>
      'Aşağıdakiler için donanım kod çözmeyi etkinleştirin:';

  @override
  String get adminEncodingThreads => 'Kod Dönüştürme İş Parçacıkları';

  @override
  String get adminAutomatic => '0 = otomatik';

  @override
  String get adminTranscodingTempPath => 'Geçici yolu kod dönüştürme';

  @override
  String get adminEnableFallbackFont => 'Yedek yazı tipini etkinleştir';

  @override
  String get adminFallbackFontPath => 'Yedek yazı tipi yolu';

  @override
  String get adminAllowSegmentDeletion => 'Parça silmeye izin ver';

  @override
  String get adminSegmentKeepSeconds => 'Parça saklama süresi (saniye)';

  @override
  String get adminThrottleBuffering => 'Arabelleğe almayı sınırla';

  @override
  String get adminTrickplaySaved => 'Önizleme ayarları kaydedildi';

  @override
  String get adminTrickplayLoadFailed => 'Önizleme ayarları yüklenemedi';

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
  String get adminResumeLoadFailed => 'Devam etme ayarları yüklenemedi';

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
  String get ports => 'Portlar';

  @override
  String get adminHttpPort => 'HTTP bağlantı noktası';

  @override
  String get adminHttpsPort => 'HTTPS bağlantı noktası';

  @override
  String get adminPublicHttpsPort => 'Genel HTTPS bağlantı noktası';

  @override
  String get adminBaseUrl => 'Temel URL';

  @override
  String get adminBaseUrlHint => 'Örn. /jellyfin';

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
    return 'Meta veriler yüklenemedi: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Meta veriler kaydedilemedi: $error';
  }

  @override
  String get adminRefreshMetadata => 'Meta Verileri Yenile';

  @override
  String get recursive => 'Alt klasörlerle birlikte';

  @override
  String get adminReplaceAllMetadata => 'Tüm meta verileri değiştir';

  @override
  String get adminReplaceAllImages => 'Tüm resimleri değiştir';

  @override
  String get adminMetadataRefreshRequested => 'Meta veri yenileme istendi';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Meta veriler yenilenemedi: $error';
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
    return 'Uzaktan arama başarısız oldu: $error';
  }

  @override
  String get adminUpdateContentType => 'İçerik Türünü Güncelle';

  @override
  String get adminContentType => 'İçerik türü';

  @override
  String get adminContentTypeUpdated => 'İçerik türü güncellendi';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'İçerik türü güncellenemedi: $error';
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
    return '$imageType görseli güncellendi';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Görsel indirilemedi: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Desteklenmeyen resim formatı';

  @override
  String get adminImageReadFailed => 'Seçilen resim okunamadı';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType görseli yüklendi';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Görsel yüklenemedi: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType görselini sil';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType görseli silindi';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Görsel silinemedi: $error';
  }

  @override
  String get adminAllProviders => 'Tüm sağlayıcılar';

  @override
  String get adminNoRemoteImages => 'Uzak resim bulunamadı';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner taraması başarısız oldu: $error';
  }

  @override
  String get adminAddTuner => 'Tuner Ekle';

  @override
  String get adminTunerType => 'Tuner Türü';

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
    return 'Tuner eklenemedi: $error';
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
    return 'Sağlayıcı eklenemedi: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Tuner kaldırılamadı: $error';
  }

  @override
  String get adminTunerResetRequested => 'Ayarlayıcının sıfırlanması istendi';

  @override
  String adminTunerResetFailed(String error) {
    return 'Tuner sıfırlanamadı: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Sağlayıcı kaldırılamadı: $error';
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
  String get adminSeriesRecordingPath => 'Dizi kayıt yolu';

  @override
  String get adminRecordingSettingsSaved => 'Kayıt ayarları kaydedildi';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Ayarlar kaydedilemedi: $error';
  }

  @override
  String get adminSetChannelMappings => 'Kanal Eşlemelerini Ayarlama';

  @override
  String get adminMappingJson => 'JSON Eşleme';

  @override
  String get adminMappingJsonHint => 'Örnek: JSON yükünü eşleme';

  @override
  String get adminChannelMappingsUpdated => 'Kanal eşlemeleri güncellendi';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Eşleştirmeler güncellenemedi: $error';
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
    return 'Kayıt yolu: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Dizi yolu: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Kayıt öncesi süre: $minutes dk';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Kayıt sonrası süre: $minutes dk';
  }

  @override
  String get adminTunerDiscovery => 'Tuner Keşfeti';

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
    return '$name yedeği şimdi geri yüklensin mi?';
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
  String get adminLogsNewestFirst => 'Önce en yeniler';

  @override
  String get adminLogsOldestFirst => 'Önce en eskiler';

  @override
  String get adminLogsJustNow => 'Şu anda';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes dk önce';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours sa önce';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}g önce';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName yüklenemedi';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count eşleşme';
  }

  @override
  String get adminLogViewerNoMatches => 'Eşleşen çizgi yok';

  @override
  String get adminMetadataEditorTitle => 'Meta Veri Düzenleyici';

  @override
  String get adminMetadataRemote => 'Uzak';

  @override
  String get adminMetadataType => 'Tür';

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
  String get adminMetadataFieldOfficialRating => 'Resmi Puanı';

  @override
  String get adminMetadataFieldCommunityRating => 'Topluluk Puanı';

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
  String get adminMetadataImagePrimary => 'Birincil';

  @override
  String get adminMetadataImageBackdrop => 'Arka plan';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Afiş';

  @override
  String get adminMetadataImageThumb => 'Küçük Resim';

  @override
  String get adminMetadataRecursive => 'Alt klasörlerle birlikte';

  @override
  String get adminMetadataProvider => 'Sağlayıcı';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType görseli güncellendi';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType görseli yüklendi';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType görseli silindi';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Görsel indirilemedi: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'Seçilen resim okunamadı';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Görsel yüklenemedi: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType görselini sil';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Bu, geçerli resmi öğeden kaldırır.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Görsel silinemedi: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType görseli seçin';
  }

  @override
  String get adminMetadataUpload => 'Yükle';

  @override
  String get adminMetadataUpdate => 'Güncelle';

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
    return 'Güncelleme mevcut: v$version';
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
  String get adminPluginsEnable => 'Etkinleştir';

  @override
  String get adminPluginsDisable => 'Devre dışı bırakmak';

  @override
  String get adminPluginsInstallUpdate => 'Güncellemeyi yükle';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Güncellemeyi yükle (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Aramanızla eşleşen paket yok';

  @override
  String get adminPluginsCatalogEmpty => 'Mevcut paket yok';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" yükleniyor...';
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
    return '$name Ayarları';
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
    return 'Depolar yüklenemedi: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Depoyu Kaldır';

  @override
  String adminReposRemoveConfirm(String name) {
    return '\"$name\" ögesini kaldırmak istediğinize emin misiniz?';
  }

  @override
  String get adminReposRemove => 'Kaldırmak';

  @override
  String adminReposSaveFailed(String error) {
    return 'Depolar kaydedilemedi: $error';
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
  String get adminGeneralMetadataLanguageHint => 'Örn. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Tercih edilen meta veri ülkesi';

  @override
  String get adminGeneralMetadataCountryHint => 'Örn. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Kitaplık taraması eşzamanlılığı';

  @override
  String get adminGeneralImageEncodingLimit => 'Eşzamanlı görsel işleme sınırı';

  @override
  String get adminUnknownError => 'Bilinmeyen hata';

  @override
  String get adminBrowse => 'Göz at';

  @override
  String get adminCloseBrowser => 'Tarayıcıyı kapat';

  @override
  String get adminNetworkingTitle => 'Ağ';

  @override
  String get adminNetworkingRestartWarning =>
      'Ağ ayarlarında yapılan değişiklikler sunucunun yeniden başlatılmasını gerektirebilir.';

  @override
  String get adminNetworkingRemoteAccess => 'Uzaktan erişimi etkinleştir';

  @override
  String get adminNetworkingPorts => 'Portlar';

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
  String get adminNetworkingAddressHint => 'Örn. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Bilinen proxy\'ler';

  @override
  String get adminNetworkingProxyHint => 'Örn. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Beyaz liste';

  @override
  String get adminNetworkingBlacklist => 'Kara liste';

  @override
  String get adminNetworkingAddEntry => 'Giriş ekle';

  @override
  String get adminBrandingTitle => 'Markalaşma';

  @override
  String get adminBrandingLoginDisclaimer => 'Giriş uyarısı';

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
  String get adminPlaybackFallbackFontPath => 'Yedek yazı tipi yolu';

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
  String get adminTaskRunning => 'Çalışıyor...';

  @override
  String get adminTaskNeverRun => 'Asla çalışma';

  @override
  String get adminTaskStop => 'Dur';

  @override
  String get adminTaskRun => 'Çalıştır';

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
    return 'Her gün $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Her $day saat $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Her $duration';
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
      other: '$count saat',
      one: '1 saat',
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
  String get adminActivityOlder => 'Daha Eski';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days g önce';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours sa önce';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes dk önce';
  }

  @override
  String get adminActivityNow => 'Şimdi';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes dk';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours sa';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days g';
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
  String get adminNetworkingBaseUrlHint => 'Örn. /jellyfin';

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
  String get adminPlaybackSegmentDeletion => 'Parça silinmesine izin ver';

  @override
  String get adminPlaybackSegmentKeep => 'Parça tutma süresi (saniye)';

  @override
  String get adminPlaybackThrottleBuffering => 'Önbelleğe almayı sınırla';

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
    return 'İçerik türü güncellenemedi: $error';
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
  String get adminDiscover => 'Keşfet';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Eşleştirmeler güncellenemedi: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Süre sınırı: $duration';
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
      other: '# katılımcı',
      one: '# katılımcı',
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
  String get syncPlayRepeat => 'Tekrarla';

  @override
  String get syncPlayRepeatOne => 'Tek Sefer';

  @override
  String get syncPlayShuffleModeShuffled => 'Karıştır';

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
    return '$index. Öge';
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
  String get syncPlayJoin => 'Katıl';

  @override
  String get syncPlayStateIdle => 'Boşta';

  @override
  String get syncPlayStateWaiting => 'Bekliyor';

  @override
  String get syncPlayStatePaused => 'Duraklatıldı';

  @override
  String get syncPlayStatePlaying => 'Oynanıyor';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay grubuna katıldı';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay grubundan ayrıldı';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay erişim reddedildi';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Bu SyncPlay grubundaki bir veya daha fazla öğeye erişiminiz yok. Grup sahibinden kitaplık izinlerini doğrulamasını veya farklı bir sıra seçmesini isteyin.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Oynatma durumu $groupName ile eşitleniyor';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# satır keşfedildi',
      one: '# satır keşfedildi',
    );
    return '$_temp0';
  }

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
    return 'Yansıtma kontrolü başarısız oldu: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Kontrolleri';
  }

  @override
  String get castDeviceVolume => 'Cihaz Sesi';

  @override
  String get castVolumeUnavailable => 'Kullanılamıyor';

  @override
  String castStopKind(String kind) {
    return '$kind işlemini durdur';
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
    return '$length haneli bir PIN girin';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '$length haneli PIN\'inizi girin';
  }

  @override
  String get pinIncorrect => 'Yanlış PIN';

  @override
  String get pinMismatch => 'PIN\'ler eşleşmiyor';

  @override
  String get pinForgot => 'PIN\'inizi mi unuttunuz?';

  @override
  String get pinClear => 'Temizle';

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
    return 'Hızlı Bağlantı başarısız oldu: $message';
  }

  @override
  String get quickConnectEnterCode => 'Kodu girin';

  @override
  String get quickConnectAuthorize => 'Yetkilendir';

  @override
  String remoteCommandFailed(String error) {
    return 'Komut başarısız oldu: $error';
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
    return 'Yansıtma başlatılamadı: $error';
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
    return '$name indiriliyor...';
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
  String get posterDisplayTitle => 'Göster';

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
  String get playlistCreate => 'Oluştur';

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
  String get stillWatchingStop => 'Dur';

  @override
  String get stillWatchingContinue => 'Devam et';

  @override
  String skipSegment(String segment) {
    return '$segment geç';
  }

  @override
  String get liveTv => 'Canlı TV';

  @override
  String get continueWatchingAndNextUp =>
      'İzlemeye Devam Et & Sıradaki Bölümler';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'İndiriliyor: $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName indiriliyor';
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
  String get playerTooltipFloatOnTop => 'Her zaman üstte tut';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Her zaman üstte tutmayı devre dışı bırak';

  @override
  String get playerTooltipLockLandscape => 'Yatay moda kilitle';

  @override
  String get playerTooltipUnlockOrientation => 'Ekran döndürmeye izin ver';

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
  String get settingsPlaybackSyncplay => 'Oynatma & SyncPlay';

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
  String get settingsSortServersBy => 'Sunucuları Şuna Göre Sırala';

  @override
  String get settingsLastUsed => 'Son Kullanılan';

  @override
  String get settingsAlphabetical => 'Alfabetik';

  @override
  String get settingsPrivacyAndSafetySection => 'GİZLİLİK & GÜVENLİK';

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
      'Kütüphane görünürlüğü, klasör görünümü ve çoklu sunucu davranışı';

  @override
  String get settingsTwentyFourHourClock => '24 Saat Biçimi';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Saatin gösterildiği her yerde 24 saat biçimini kullan';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Gezinme çubuğunda karıştır butonun göster';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Gezinme çubuğunda türler butonunu göster';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Gezinme çubuğunda favoriler butonunu göster';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Gezinti çubuğunda kütüphaneler butonunu göster';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Gezinti çubuğunda Seerr butonunu göster';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Kitaplık başına ana sayfa görünürlüğünü değiştirin. Değişikliklerin etkili olması için Moonfin yeniden başlatın.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Medya Çubuğu ve Yerel Önizlemeler';

  @override
  String get settingsVisualOverlays => 'Görsel Kaplamalar';

  @override
  String get settingsSeasonalSurprise => 'Sezonluk Sürpriz';

  @override
  String get settingsMetadataAndRatings => 'Meta Veriler ve Derecelendirmeler';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase, ek puan kaynakları, Seerr istekleri ve senkronize edilmiş tercihler dahil olmak üzere sunucu tarafı entegrasyonlarını destekler.';

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
  String get settingsReportAnIssueSubtitle => 'GitHub Hata Takibini Aç';

  @override
  String get settingsJoinDiscord => 'Discord\'a Katıl';

  @override
  String get settingsJoinDiscordSubtitle => 'Toplulukla sohbet et';

  @override
  String get settingsJoinTheDiscord => 'Discord\'a Katıl';

  @override
  String get settingsSupportMoonfin => 'Moonfin\'e Destek Ol';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Geliştiriciye bir kahve ısmarla';

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
      'Moonfin verilerinizi nasıl işler';

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
      other: '# lisans bildirimi',
      one: '# lisans bildirimi',
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
  String get settingsSkipIntrosAndOutros => 'Giriş ve Jenerikleri atlansın mı?';

  @override
  String get settingsMediaSegmentCountdown => 'Medya Bölümü Geri Sayımı';

  @override
  String get settingsProgressBar => 'İlerleme Çubuğu';

  @override
  String get settingsTimer => 'Zamanlayıcı';

  @override
  String get settingsNone => 'Hiçbiri';

  @override
  String get settingsPromptUser => 'Kullanıcıya Sor';

  @override
  String get settingsSkip => 'Atla';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (eski nesil)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (eski)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (önerilen)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Yedek Modu';

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
      'Bitstream AC3\'ü harici dekodere aktar';

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
  String get settingsSyncplayExtraOffset => 'SyncPlay Ek Gecikme Süresi';

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
    return 'Son Eklenen $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
  }

  @override
  String get autoplayNextEpisode => 'Sonraki Bölümü Otomatik Oynat';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Mevcut olduğunda sonraki bölümü otomatik oynat.';

  @override
  String get skipSilenceTitle => 'Sessizce Atla';

  @override
  String get skipSilenceSubtitle =>
      'Akış desteklediğinde, sessiz ses bölümlerini otomatik olarak atla.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Harici ses efektlerine izin ver';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Ekolayzer ve efekt uygulamalarının (örn. Wavelet) Media3 oynatma oturumlarına bağlanmasına izin ver.';

  @override
  String get disableTunnelingTitle => 'Tünellemeyi devre dışı bırak';

  @override
  String get disableTunnelingSubtitle =>
      'Tünelsiz oynatmaya zorla. Tünelleme kaynaklı ses/video kopmaları yaşanan cihazlarda yararlıdır.';

  @override
  String get enableTunnelingTitle => 'Tünellemeyi etkinleştir';

  @override
  String get enableTunnelingSubtitle =>
      'Gelişmiş. Sesi ve videoyu birbirine bağlı bir donanım yolu üzerinden iletir. Bazı cihazlarda ses/video kesintilerine neden olabileceği için varsayılan olarak kapalıdır.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision profil 7\'yi HEVC ile eşleştir';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision profil 7 akışlarını, DV desteklemeyen cihazlarda HDR10 uyumlu HEVC olarak oynat.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Gömülü altyazı stillerini kullan';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Altyazı parçasında gömülü olan renk, yazı tipi ve konumlandırmayı uygula. Kendi altyazı stili tercihlerinizi kullanmak için devre dışı bırakın.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Gömülü altyazı boyutlarını kullan';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Altyazı parçasında gömülü olan yazı tipi boyutu ipuçlarını uygula. Kendi stili tercihlerinizdeki altyazı boyutunu kullanmak için devre dışı bırakın.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Medya Ayrıntılarını Göster';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Kütüphane sayfalarında, seçilen ögenin detaylarını üst kısımda göster.';

  @override
  String get useDetailedSubHeadings => 'Detaylı alt başlıklar kullan';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Kütüphane sayfalarında detaylı veya sade bir alt satır göster.';

  @override
  String get savedThemesDeleteDialogTitle => 'Kaydedilen tema silinsin mi?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '\"$themeName\" bu cihazın önbelleğinden kaldırılsın mı?';
  }

  @override
  String get themeStore => 'Tema Mağazası';

  @override
  String get themeStoreSubtitle => 'Topluluk temalarına göz at ve kaydet';

  @override
  String get themeStoreDescription =>
      'Bir temayı kaydederek diğer kayıtlı temalarınız gibi kullanabilirsiniz.';

  @override
  String get themeStoreEmpty => 'Şu anda hiç tema bulunmuyor.';

  @override
  String get themeStoreLoadFailed =>
      'Tema Mağazası yüklenemedi. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get themeStoreSave => 'Kaydet';

  @override
  String get themeStoreSaveAndApply => 'Kaydet & Uygula';

  @override
  String get themeStoreSaved => 'Kayıtlı';

  @override
  String get themeStoreInvalidMessage => 'Bu tema yüklenemedi.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" kaydedildi.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" bu cihazdan silindi.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" silinemedi.';
  }

  @override
  String get savedThemesTitle => 'Kayıtlı temalar';

  @override
  String get savedThemesDescription =>
      'Bunlar, mevcut sunucu için Moonfin eklentisinden indirilen temalardır. Silme işlemi yalnızca bu yerel kopyayı kaldırır.';

  @override
  String get savedThemesEmpty => 'Bu sunucu için kayıtlı tema bulunamadı.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Şu an aktif';
  }

  @override
  String get savedThemesDeleteTooltip => 'Kayıtlı temayı sil';

  @override
  String get savedThemesManageSubtitle =>
      'Bu cihazdaki indirilen eklenti temalarını yönetin';

  @override
  String get themeEditor => 'Tema Editörü';

  @override
  String get themeEditorSubtitle => 'Moonfin Tema Editörünü tarayıcınızda açın';

  @override
  String get homeScreen => 'Ana Sayfa';

  @override
  String get bottomBar => 'Alt Bar';

  @override
  String get homeRowsStyleClassic => 'Klasik';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Ana Sayfa Satırları';

  @override
  String get homeRowDisplay => 'Ana Sayfa Satır Gösterimi';

  @override
  String get homeRowSections => 'Ana Sayfa Satır Bölümleri';

  @override
  String get homeRowToggles => 'Ana Sayfa Satır Ayarları';

  @override
  String get homeRowTogglesSubtitle =>
      'Farklı ana sayfa satır kategorilerini etkinleştirin veya devre dışı bırakın';

  @override
  String get homeRowTogglesDescription =>
      'Satırları Ana Sayfa Bölümleri\'nde göstermek için aşağıdaki anahtarları etkinleştirin.';

  @override
  String get rowsType => 'Satır Tipi';

  @override
  String get rowsTypeDescription =>
      'Klasik mod, satır başına görsel türünü ve bilgi katmanını korur. Modern mod ise dikey görsellerden yatay arka planlara uzanan satırlar kullanır.';

  @override
  String get displayFavoritesRows => 'Favoriler Satırlarını Görüntüle';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Favori Filmleri, Dizileri ve diğer favori satırlarını Ana Sayfa Bölümlerinde göster.';

  @override
  String get favoritesRowSorting => 'Favoriler Satırı Sıralaması';

  @override
  String get favoritesRowSortingDescription =>
      'Favori satırlarını eklenme tarihine, çıkış tarihine, alfabetik sıraya ve daha fazlasına göre sıralayın.';

  @override
  String get displayCollectionsRows => 'Koleksiyon Satırlarını Göster';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Koleksiyon satırlarını Ana Sayfa Bölümlerinde göster.';

  @override
  String get collectionsRowSorting => 'Koleksiyon Satırı Sıralaması';

  @override
  String get collectionsRowSortingDescription =>
      'Koleksiyonlar satırlarını ekleme tarihine, çıkış tarihine, alfabetik sıraya ve daha fazlasına göre sıralayın.';

  @override
  String get displayGenresRows => 'Tür Satırlarını Göster';

  @override
  String get displayGenresRowsSubtitle =>
      'Ana Sayfa Bölümlerinde Türler satırlarını göster.';

  @override
  String get genresRowSorting => 'Türler Satırı Sıralaması';

  @override
  String get genresRowSortingDescription =>
      'Türler satırlarını ekleme tarihine, çıkış tarihine, alfabetik sıraya ve daha fazlasına göre sıralayın.';

  @override
  String get genresRowItems => 'Türler Satırı Ögeleri';

  @override
  String get genresRowItemsDescription =>
      'Türler satırlarında Filmleri, Dizileri veya her ikisini birden göster.';

  @override
  String get displayPlaylistsRows => 'Oynatma Listesi Satırlarını Göster';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Oynatma listesi satırlarını Ana Sayfa Bölümleri\'nde göster.';

  @override
  String get playlistsRowSorting => 'Oynatma Listesi Satır Sıralaması';

  @override
  String get playlistsRowSortingDescription =>
      'Oynatma listesi satırlarını ekleme tarihi, yayınlanma tarihi, alfabetik ve daha fazlasına göre sıralayın.';

  @override
  String get displayAudioRows => 'Ses Satırlarını Göster';

  @override
  String get displayAudioRowsSubtitle =>
      'Ana Sayfa Bölümlerinde Ses Satırlarını Göster.';

  @override
  String get audioRowsSorting => 'Ses Satırları Sıralaması';

  @override
  String get audioRowsSortingDescription =>
      'Ses satırlarını eklenme tarihine, çıkış tarihine, alfabetik sıraya ve daha fazlasına göre sıralayın.';

  @override
  String get audioPlaylists => 'Ses Oynatma Listeleri';

  @override
  String get appearance => 'Görünüm';

  @override
  String get cardSize => 'Ana Sayfa Satırı Kart Gösterim Boyutu';

  @override
  String get externalPlayerApp => 'Harici oynatıcı';

  @override
  String get externalPlayerAppDescription =>
      'Üzerine uzun basarak oynatma seçeneğini etkinleştirmek için harici oynatıcıyı ayarlayın';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Oynatma başladığında uygulama seçiciyi göster.';

  @override
  String get loadingInstalledPlayers => 'Yüklü oynatıcılar yükleniyor...';

  @override
  String get connection => 'Bağlantı';

  @override
  String get audioTranscodeTarget => 'Ses Yeniden Kodlama Hedefi';

  @override
  String get passthrough => 'Doğrudan Geçiş (Passthrough)';

  @override
  String get supportedOnThisDevice => 'Bu cihazda destekleniyor';

  @override
  String get notSupportedOnThisDevice => 'Bu cihazda desteklenmiyor';

  @override
  String get settingsAudioDtsXPassthrough =>
      'DTS:X (DTS UHD) Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'DTS:X (DTS UHD) sesini harici kod çözücüye bitstream olarak aktar.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD with Atmos (JOC) Doğrudan Geçiş (Passthrough)';

  @override
  String get mediaPlayerBehavior => 'Medya Oynatıcı Davranışı';

  @override
  String get playbackEnhancements => 'Oynatma İyileştirmeleri';

  @override
  String get alwaysOn => 'Her zaman açık.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      '\"Jeneriği Atla\" yerine \"Sıradaki Bölüm Ekranını\" yerleştir';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      '\"Jeneriği Atla\" butonu yerine \"Sıradaki Bölüm\" ekranını göster.';

  @override
  String get playerRouting => 'Oynatıcı Yönlendirme';

  @override
  String get preferSoftwareDecoders => 'Yazılımsal kod çözücüleri tercih et';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Donanımsal kod çözücülerden önce FFmpeg (ses) ve libgav1 (AV1) kullan. HDMI ses doğrudan geçişi (passthrough) bozulursa devre dışı bırak.';

  @override
  String get useExternalPlayer => 'Her zaman harici oynatıcı kullan';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV\'de video oynatmayı seçtiğiniz harici uygulamada açın.';

  @override
  String get automaticQueuing => 'Otomatik Sıraya Ekleme';

  @override
  String get preferSdhSubtitles => 'SDH altyazıları tercih et';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Otomatik seçim yaparken SDH/CC altyazı parçalarına öncelik ver.';

  @override
  String get webDiagnostics => 'Web Tanılama';

  @override
  String get webDiagnosticsTitle => 'Moonfin Web Tanılama';

  @override
  String get webDiagnosticsIntro =>
      'Tarayıcı bağlantı sorunlarını (CORS, karma içerik ve keşif ayarları) tanılamak için bu sayfayı kullanın.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Karma İçerik Hatası Tespit Edildi';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Ön Kontrol Hatası Tespit Edildi';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin, bir HTTPS sayfasının HTTP sunucu URL\'sini çağırmaya çalıştığını tespit etti. Tarayıcılar, bu isteği henüz sunucunuza ulaşmadan engeller.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin, genellikle medya sunucusundaki eksik CORS veya ön kontrol (preflight) üst bilgilerinden kaynaklanan, tarayıcı düzeyinde bir istek hatası tespit etti.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Hedef URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detay: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Mevcut Çalışma Zamanı Bağlamı';

  @override
  String get webDiagnosticsOrigin => 'Kaynak';

  @override
  String get webDiagnosticsScheme => 'Protokol';

  @override
  String get webDiagnosticsPluginMode => 'Eklenti Modu';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC Taraması';

  @override
  String get webDiagnosticsForcedServerUrl => 'Zorunlu Sunucu URL\'si';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Varsayılan Sunucu URL\'si';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Keşif Vekil Sunucu URL\'si';

  @override
  String get notConfigured => 'Yapılandırılmadı';

  @override
  String get webDiagnosticsMixedContent => 'Karma İçerik';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Bu sayfa HTTPS üzerinden yüklendi, ancak yapılandırılan URL\'lerden biri veya daha fazlası HTTP. Tarayıcılar, HTTPS sayfalarının HTTP API\'lerini çağırmasını engeller.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Çözüm: Medya sunucunuzu veya vekil sunucu (proxy) uç noktanızı HTTPS üzerinden sunun ya da Moonfin\'i yalnızca güvenilir yerel ağlarda HTTP üzerinden yükleyin.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Mevcut çalışma zamanı ayarlarında bariz bir karma içerik yapılandırması tespit edilmedi.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS Kontrol Listesi';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin üst bilgisinde tarayıcı kaynağına izin verin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers üst bilgisine Authorization, X-Emby-Authorization ve X-Emby-Token değerlerini dahil edin.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Akış ve sarma işlevleri için Content-Range ve Accept-Ranges üst bilgilerini dışa aktarın (expose).';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS ön kontrol (preflight) isteklerine 204 yanıtı döndürün.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Örnek Üst Bilgi Parçacığı (nginx tarzı)';

  @override
  String get note => 'Not';

  @override
  String get webDiagnosticsNonWebNote =>
      'Bu tanılama rotası web sürümleri için tasarlanmıştır. Eğer bunu başka bir platformda görüyorsanız, yapılan kontroller sizin için geçerli olmayabilir.';

  @override
  String get backToServerSelect => 'Sunucu Seçimine Dön';

  @override
  String get signOutAllUsers => 'Tüm Kullanıcıların Oturumunu Kapat';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Mikrofon izni kalıcı olarak reddedildi. Sistem ayarlarından izni etkinleştirin.';

  @override
  String get voiceSearchPermissionRequired =>
      'Sesli arama için mikrofon izni gereklidir.';

  @override
  String get voiceSearchNoMatch => 'Anlaşılamadı. Tekrar deneyin.';

  @override
  String get voiceSearchNoSpeechDetected => 'Konuşma algılanmadı.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofon hatası.';

  @override
  String get voiceSearchNeedsInternet =>
      'Sesli arama için internet bağlantısı gereklidir.';

  @override
  String get voiceSearchServiceBusy =>
      'Sesli arama servisi meşgul. Tekrar deneyin.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Mikrofon izni kalıcı olarak reddedildi.';

  @override
  String get microphonePermissionDenied => 'Mikrofon izni reddedildi.';

  @override
  String get speechRecognitionUnavailable =>
      'Ses tanıma özelliği bu cihazda kullanılamıyor.';

  @override
  String get openIosRoutePicker => 'iOS Ses/Video Aktarımını Aç';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay özelliği bu cihazda kullanılamıyor.';

  @override
  String get videos => 'Videolar';

  @override
  String get trailers => 'Fragmanlar';

  @override
  String get programs => 'Programlar';

  @override
  String get songs => 'Şarkılar';

  @override
  String get photoAlbums => 'Fotoğraf Albümleri';

  @override
  String get photos => 'Fotoğraflar';

  @override
  String get people => 'Kişiler';

  @override
  String get recentlyReleasedEpisodes => 'Son Yayınlanan Bölümler';

  @override
  String get watchAgain => 'Yeniden İzle';

  @override
  String get guestAppearances => 'Konuk Olduğu Bölümler';

  @override
  String get appearancesSeerr => 'Rol Aldığı Yapımlar (Seerr)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'Grupça İzle';

  @override
  String get errors => 'Hatalar';

  @override
  String get warnings => 'Uyarılar';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Tarayıcıda Aç';

  @override
  String get embeddedBrowserNotAvailable =>
      'Gömülü tarayıcı bu platformda kullanılamıyor.';

  @override
  String get adminRestartServerConfirmation =>
      'Sunucuyu yeniden başlatmak istediğinize emin misiniz?';

  @override
  String get adminShutdownServerConfirmation =>
      'Sunucuyu kapatmak istediğinize emin misiniz? Sunucuyu daha sonra manuel olarak yeniden başlatmanız gerekecektir.';

  @override
  String get internal => 'Dahili';

  @override
  String get idle => 'Boşta';

  @override
  String get os => 'İşletim Sistemi';

  @override
  String get adminNoUsersFound => 'Kullanıcı Bulunamadı';

  @override
  String get adminNoUsersMatchSearch =>
      'Aramanızla eşleşen kullanıcı bulunamadı';

  @override
  String get adminNoDevicesFound => 'Cihaz bulunamadı';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Mevcut filtrelere uygun cihaz bulunamadı';

  @override
  String get passwordSet => 'Şifre belirlendi';

  @override
  String get noPasswordConfigured => 'Şifre belirlenmedi';

  @override
  String get remoteAccess => 'Uzaktan Erişim';

  @override
  String get localOnly => 'Sadece Yerel Ağ';

  @override
  String get adminMediaAnalyticsLoadFailed => 'Medya analizleri yüklenemedi';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Tüm medya kütüphanelerinin ortak istatistikleri.';

  @override
  String get analyticsTopArtists => 'En Çok Dinlenen Sanatçılar';

  @override
  String get analyticsTopAuthors => 'En Çok Okunan Yazarlar';

  @override
  String get analyticsTopContributors => 'En Çok Katkıda Bulunanlar';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kütüphane',
      one: '1 Kütüphane',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Bu seçim için henüz dizine eklenmiş medya toplamı bulunmuyor.';

  @override
  String get analyticsLibraryDetails => 'Kütüphane Detayları';

  @override
  String get analyticsLibraryBreakdown => 'Kütüphane Dağılımı';

  @override
  String get analyticsNoLibrariesAvailable => 'Kullanılabilir kütüphane yok.';

  @override
  String get adminServerAdministrationTitle => 'Sunucu Yönetimi';

  @override
  String get adminServerPathData => 'Veri';

  @override
  String get adminServerPathImageCache => 'Görsel Önbelleği';

  @override
  String get adminServerPathCache => 'Önbellek';

  @override
  String get adminServerPathLogs => 'Günlükler';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Dönüştür';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Bu sunucu tarafından hiçbir sunucu yolu döndürülmedi.';

  @override
  String adminPercentUsed(int percent) {
    return '%$percent kullanıldı';
  }

  @override
  String get userActivity => 'Kullanıcı Hareketleri';

  @override
  String get systemEvents => 'Sistem Olayları';

  @override
  String get needsAttention => 'İşlem Gerekiyor';

  @override
  String get adminDrawerSectionServer => 'Sunucu';

  @override
  String get adminDrawerSectionPlayback => 'Oynatma';

  @override
  String get adminDrawerSectionDevices => 'Cihazlar';

  @override
  String get adminDrawerSectionAdvanced => 'Gelişmiş';

  @override
  String get adminDrawerSectionPlugins => 'Plugins';

  @override
  String get adminDrawerSectionLiveTv => 'Canlı TV';

  @override
  String get homeVideos => 'Kişisel Videolar';

  @override
  String get mixedContent => 'Karma İçerik';

  @override
  String get homeVideosAndPhotos => 'Kişisel Videolar & Fotoğraflar';

  @override
  String get mixedMoviesAndShows => 'Karışık Film & Diziler';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Kayıt bulunamadı';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension arşivi içinde hiç resim sayfası bulunamadı.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Gömülü oynatıcı hatası ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB okuyucu hatası ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Okuyucu için yerel dosya bulunamadı: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri adresinden kitap verileri açılırken HTTP $status hatası alındı';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Okunabilir bir kitap bağlantı noktası bulunamadı';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Desteklenmeyen çizgi roman arşiv formatı: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'CBR çıkarma eklentisi bu platformda mevcut değil.';

  @override
  String get failedToExtractCbrArchive => '.cbr arşivi çıkarılamadı.';

  @override
  String get cb7ExtractionUnavailable =>
      'CB7 çıkarma işlemi bu platformda mevcut değil.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'CB7 çıkarma eklentisi bu platformda mevcut değil.';

  @override
  String get closeGenrePanel => 'Tür panelini kapat';

  @override
  String get loadingShuffle => 'Karışık liste yükleniyor...';

  @override
  String get libraryShuffleLabel => 'KÜTÜPHANEYİ KARIŞTIR';

  @override
  String get randomShuffleLabel => 'RASTGELE KARIŞTIR';

  @override
  String get genresShuffleLabel => 'TÜRLERİ KARIŞTIR';

  @override
  String get autoHdrSwitching => 'Otomatik HDR Geçişi';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR video oynatılırken HDR\'ı otomatik olarak etkinleştirir ve çıkışta ekran modunu eski haline getirir.';

  @override
  String get whenFullscreen => 'Tam ekrandayken';

  @override
  String get changeArtwork => 'Görseli Değiştir';

  @override
  String get missing => 'Kayıp';

  @override
  String get transcodingLimits => 'Dönüştürme Sınırları';

  @override
  String get clearAllArtworkButton => 'Tüm görseller silinsin mi?';

  @override
  String get clearAllArtworkWarning =>
      'İndirilen tüm görselleri temizlemek istediğinize emin misiniz?';

  @override
  String get confirmClear => 'Silmeyi Onayla';

  @override
  String confirmClearMessage(String itemType) {
    return 'Bu nesneyi ($itemType) temizlemek istediğinize emin misiniz?';
  }

  @override
  String get uploadButton => 'Yükle?';

  @override
  String get resolutionLabel => 'Çözünürlük: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Görselleri yalnızca arayüz dilinde göster';

  @override
  String get confirmClearAll => 'Tümünü Temizlemeyi Onayla';

  @override
  String get imageUploadSuccess => 'Görsel başarıyla yüklendi!';

  @override
  String imageUploadFailed(String error) {
    return 'Görsel yüklenemedi: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Görsel ayarlanamadı: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Görsel silinemedi: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Tüm görseller temizlenemedi: $error';
  }

  @override
  String get yes => 'Evet';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Arka Planlar';

  @override
  String get bannerCategory => 'Afiş';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Küçük Resim';

  @override
  String get artCategory => 'Görsel';

  @override
  String get discArtCategory => 'Disk Görseli';

  @override
  String get screenshotCategory => 'Ekran Görüntüsü';

  @override
  String get boxCoverCategory => 'Kutu Kapağı';

  @override
  String get boxRearCoverCategory => 'Kutu Arka Kapağı';

  @override
  String get menuArtCategory => 'Menü Görseli';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'arka plan';

  @override
  String get confirmItemBanner => 'afiş';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'küçük resim';

  @override
  String get confirmItemArt => 'görsel';

  @override
  String get confirmItemDiscArt => 'disk görseli';

  @override
  String get confirmItemScreenshot => 'ekran görüntüsü';

  @override
  String get confirmItemBoxCover => 'kutu kapağı';

  @override
  String get confirmItemBoxRearCover => 'kutu arka kapağı';

  @override
  String get confirmItemMenuArt => 'menü görseli';

  @override
  String get resolutionAll => 'Tümü';

  @override
  String get resolutionHigh => 'Yüksek (1080p+)';

  @override
  String get resolutionMedium => 'Orta (720p)';

  @override
  String get resolutionLow => 'Düşük (<720p)';

  @override
  String get sources => 'Kaynaklar';

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
