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
  String get animeMarkerFiller => 'Filtre';

  @override
  String get animeMarkerMixed => 'Karışık';

  @override
  String get animeMarkerAnimeCanon => 'Anime Canon';

  @override
  String get animeMarkerMangaCanon => 'Manga Canon';

  @override
  String get animeMarkerSubbed => 'Altyazılı';

  @override
  String get animeMarkerDubbed => 'Dublajlı';

  @override
  String get animeMarkerSubbedAndDubbed => 'Altyazılı/Dublajlı';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'Bekleniyor';

  @override
  String get animeMarkerRecap => 'Özet';

  @override
  String get interfaceLanguage => 'Arayüz Dili';

  @override
  String get systemLanguageDefault => 'Sistem Varsayılanı';

  @override
  String get signIn => 'Giriş yap';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Boş';

  @override
  String connectingToServer(String serverName) {
    return '$serverName sunucusuna bağlanılıyor';
  }

  @override
  String get quickConnect => 'Hızlı Bağlantı';

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
  String get waitingForAuthorization => 'Yetkilendirme bekleniyor…';

  @override
  String get back => 'Geri';

  @override
  String get serverUnavailable => 'Sunucu kullanılamıyor';

  @override
  String get loginFailed => 'Giriş başarısız';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Hızlı Bağlantı Kullanılamıyor: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Hızlı Bağlantı kullanılamıyor ($status): $detail';
  }

  @override
  String get whosWatching => 'Kim izliyor?';

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
  String get remove => 'Kaldır';

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
  String get detailScreenStyle => 'Detay Ekranı Stili';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasik, orijinal ortalanmış Moonfin düzenidir. Modern, duyarlı sinematik bir düzendir. Spotlight, açılır içerik kartlarına sahip, ana görsel odaklı bir düzendir. Nouveau, bölümlerin sayfa boyunca alt alta sıralandığı tam ekran bir düzendir. Minimalist ise sadece kapak görselinden, tek bir oynatma butonundan ve bölümlerden oluşur.';

  @override
  String get detailScreenStyleMoonfin => 'Klasik';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'Daha Fazla İşlem';

  @override
  String get spotlightCastCrewStudios => 'Oyuncular, Ekip ve Stüdyolar';

  @override
  String get spotlightChaptersExtras => 'Bölümler ve Ekstralar';

  @override
  String get spotlightFileDetails => 'File Details';

  @override
  String get spotlightSimilarRecommendations => 'Benzerler ve Öneriler';

  @override
  String get spotlightSeasonsEpisodes => 'Sezonlar ve Bölümler';

  @override
  String get spotlightMoreEpisodes => 'Daha Fazla Bölümler';

  @override
  String get spotlightFilmography => 'Filmografi';

  @override
  String get spotlightCollectionsCard => 'Koleksiyonlar';

  @override
  String get spotlightPlaylistOrder => 'Oynatma Listesi Sırası';

  @override
  String get spotlightMoviesAndShows => 'Filmler & Diziler';

  @override
  String get spotlightSimilarSeerr => 'Benzerleri (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Öneriler (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kişi',
      one: '1 kişi',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bilgi',
      one: '1 bilgi',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count etiket',
      one: '1 etiket',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stüdyo',
      one: '1 stüdyo',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bölüm',
      one: '1 bölüm',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ekstra',
      one: '1 ekstra',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezon',
      one: '1 sezon',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bölüm',
      one: '1 bölüm',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count film',
      one: '1 film',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dizi',
      one: '1 dizi',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count parça',
      one: '1 parça',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe',
      one: '1 öğe',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count albüm',
      one: '1 albüm',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count koleksiyon',
      one: '1 koleksiyon',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count başlık',
      one: '1 başlık',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalist';

  @override
  String get expandedTabs => 'Genişletilmiş Sekmeler';

  @override
  String get expandedTabsSubtitle =>
      'Sekmeler arasında gezinirken sekme içeriğini otomatik olarak göster. Her sekmeyi manuel olarak açıp kapatmak için bu seçeneği kapatın.';

  @override
  String get showTechnicalDetails => 'Teknik Detayları Göster';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Başlık özetinde kodek, çözünürlük ve akış bilgilerini göster';

  @override
  String get recommendationSystem => 'Öneri Sistemi';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Önerileri yerel kütüphane algoritmasını, Jellyfin Önerileri sunucu motorunu veya çevrimiçi TMDb Benzerlik Metriklerini kullanın. Not: Çevrimiçi öneriler Seerr entegrasyonu gerektirir.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Önerileri';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Önerileri';

  @override
  String get recommendationSystemTmdb => 'TMDb Benzerliği';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Yaş Sınırını Önerilere Uygula';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Moonfin Önerileri\'ni hedef medyanın ebeveyn yaş sınırına göre kısıtla';

  @override
  String get interfaceStyle => 'Arayüz Tarzı';

  @override
  String get interfaceStyleSubtitle =>
      'Cihazınızla otomatik olarak eşleşir. Belirli bir görünümü zorlamak için Apple veya Material seçeneğini belirleyin.';

  @override
  String get interfaceStyleAutomatic => 'Otomatik';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Arayüz Düzeni';

  @override
  String get interfaceLayoutSubtitle =>
      'Bu cihaz için algılanan düzen yanlış okunduğunda geçersiz kılın. Değişikliklerin etkili olması için Moonfin\'i yeniden başlatın.';

  @override
  String get interfaceLayoutAutomatic => 'Otomatik';

  @override
  String get interfaceLayoutTv => 'Televizyon';

  @override
  String get interfaceLayoutDesktop => 'Masaüstü';

  @override
  String get interfaceLayoutPhone => 'Telefon';

  @override
  String get glassQuality => 'Cam Efekti Kalitesi';

  @override
  String get oledMode => 'OLED Modu';

  @override
  String get oledModeSubtitle =>
      'Siyahları derinleştirin ve görselleri zenginleştirin. OLED ekranlarda en iyisi.';

  @override
  String get oledModeSubtle => 'Hafif';

  @override
  String get oledModeVivid => 'Canlı';

  @override
  String get glassQualitySubtitle =>
      'Bu cihaz için en iyi cam efektini otomatik seçer. Tam, gerçek bulanıklaştırma efektini zorlar; Azaltılmış ise GPU (grafik işlemci) gücünden tasarruf sağlayan hafif bir cam efekti kullanır.';

  @override
  String get glassQualityAuto => 'Otomatik';

  @override
  String get glassQualityFull => 'Tam';

  @override
  String get glassQualityReduced => 'Azaltılmış';

  @override
  String get performanceMode => 'Performans';

  @override
  String get performanceModeSubtitle =>
      'Otomatik bu cihazı ölçer ve hafızası yetersiz olanları kısıtlar; bu sayede bellekte daha az görsel tutar ve fragmanları sabit resim olarak bırakır. Bir sonraki başlatmada tamamen geçerli olur.';

  @override
  String get performanceModeAuto => 'Otomatik';

  @override
  String get performanceModeStandard => 'Standart';

  @override
  String get performanceModeReduced => 'Azaltılmış';

  @override
  String get rendererMode => 'Renderer';

  @override
  String get rendererModeSubtitle =>
      'Auto uses Impeller on boxes whose graphics run it smoothly and Skia everywhere else. Pick Skia if animations or video look wrong. Takes effect on the next launch.';

  @override
  String get rendererModeAuto => 'Auto';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Bu cihaz için Performans \"Azaltılmış\" olarak ayarlandığından kapalı';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Tamamen özel bir tema uygulayın ve Apple veya Material esintili kullanıcı arayüzleri arasında geçiş yapın.';

  @override
  String get customThemeTitle => 'Özel Tema';

  @override
  String get customThemeSubtitle =>
      'Özel temalar, Moonfin genelindeki görsel ögeleri değiştirir. Tarzınıza uygun seçeneklerden birini belirleyin.';

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
  String get controller => 'Kontrolcü';

  @override
  String get gamepadNavigation => 'Kontrolcü Gezinmesi';

  @override
  String get gamepadNavigationDescription =>
      'Bağlı bir oyun kolunun odaklanmayı değiştirmesine ve öğeleri seçmesine izin ver';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'Orijinal, sade Moonfin varsayılanı.';

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
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Bloklu renk paleti, kalın kenarlıkları, sert düşen gölgeleri ve piksel yazı tipiyle retro piksel sanatı stili';

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
  String get loadingLinkedServers => 'Bağlantılı sunucular yükleniyor…';

  @override
  String get connectingToServerEllipsis => 'Sunucuya bağlanılıyor…';

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
  String get gameMenu => 'Menü';

  @override
  String get gamePaused => 'Duraklatıldı';

  @override
  String get gameSaveState => 'Durumu Kaydet';

  @override
  String get games => 'Oyunlar';

  @override
  String get gameLoadState => 'Durumu Yükle';

  @override
  String get gameFastForward => 'İleri Sar';

  @override
  String get gameOrientation => 'Game orientation';

  @override
  String get gameOrientationSubtitle =>
      'Screen orientation while playing games';

  @override
  String get landscape => 'Landscape';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'Emülatör ayarları';

  @override
  String get gameNoCoreOptions =>
      'Bu çekirdeğin ayarlanabilir bir seçeneği yok.';

  @override
  String get gameHoldToOpenMenu => 'Menüyü açmak için basılı tutun';

  @override
  String get gameKeepPlaying => 'Keep playing';

  @override
  String get gameSaveAndExit => 'Save & exit';

  @override
  String get gameExitGame => 'Exit game';

  @override
  String get gameSavingBeforeExit => 'Saving…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Could not save state. Still playing.';

  @override
  String get gamePlaybackUnsupported =>
      'Bu cihazda henüz oyun oynatma desteklenmiyor.';

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
  String get uiScaleGrandparents => 'Yaşlılar İçin';

  @override
  String get uiScaleGreatGrandparents => 'Çok Yaşlılar İçin';

  @override
  String get scrollDirection => 'Kaydırma Yönü';

  @override
  String get scrollDirectionVertical => 'Dikey';

  @override
  String get scrollDirectionHorizontal => 'Yatay';

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
  String get apply => 'Uygula';

  @override
  String get openLink => 'Bağlantıyı Aç';

  @override
  String get scanWithYourPhone => 'Telefonunuzla tarayın';

  @override
  String get audiobookGenres => 'Sesli Kitap Türleri';

  @override
  String get scrollLeft => 'Sola kaydır';

  @override
  String get scrollRight => 'Sağa kaydır';

  @override
  String get scrollToTop => 'En Başa Kaydır';

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
  String get latestBooks => 'Son Eklenen Kitaplar';

  @override
  String get latestAudiobooks => 'Son Eklenen Sesli Kitaplar';

  @override
  String get latestComics => 'Son Eklenen Çizgi Romanlar';

  @override
  String get comics => 'Çizgi Romanlar';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kitap',
      one: '1 kitap',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Kitap';

  @override
  String get bookFormatAudiobook => 'Sesli Kitap';

  @override
  String get bookFormatComic => 'Çizgi Roman';

  @override
  String get noBooksFound => 'Bu yazara ait kitap bulunamadı.';

  @override
  String get noBooksFoundDescription =>
      'Bu kitaplıkta henüz hiçbir kitap, sesli kitap veya çizgi roman bulunmuyor.';

  @override
  String bookPercentRead(int percent) {
    return '%$percent okundu';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time kaldı';
  }

  @override
  String get bookHeroRead => 'Oku';

  @override
  String get bookHeroListen => 'Dinle';

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
  String get items => 'Ögeler';

  @override
  String get extras => 'Özel Özellikler';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Kamera Arkası';

  @override
  String get deletedScenes => 'Silinmiş Sahneler';

  @override
  String get featurettes => 'Özel Özellikler';

  @override
  String get interviews => 'Röportaj';

  @override
  String get scenes => 'Sahneler';

  @override
  String get shorts => 'Kısa Videolar';

  @override
  String get trailers => 'Fragmanlar';

  @override
  String timeRemaining(String time) {
    return '$time kaldı';
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
  String get cast => 'Yayınla';

  @override
  String get castMembers => 'Oyuncular';

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
  String get finalizingDownload => 'Tamamlanıyor…';

  @override
  String get queuedDownload => 'Sırada';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe daha sıraya eklendi',
      one: '1 öğe daha sıraya eklendi',
    );
    return '$_temp0';
  }

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
  String failedToDeleteItemWithError(String error) {
    return 'Silme işlemi şu hata nedeniyle başarısız oldu: $error';
  }

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
    return '$title indiriliyor ($count öge)…';
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
  String get downloadSubtitlesLabel => 'Altyazıları indir…';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles eklentisini kullanarak arama yapın';

  @override
  String get downloadSubtitles => 'Altyazıları İndir';

  @override
  String get searchingSubtitles => 'Altyazı aranıyor…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Altyazı indiriliyor…';

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
  String get downloadScopeTitle => 'İndirilecekler';

  @override
  String get downloadAllEpisodes => 'Tüm bölümler';

  @override
  String get downloadUnwatchedEpisodes => 'Tüm izlenmemiş bölümler';

  @override
  String get downloadAllMovies => 'Tüm filmler';

  @override
  String get downloadUnwatchedMovies => 'Tüm izlenmemiş filmler';

  @override
  String get downloadScopeLoading => 'Öğeler yükleniyor...';

  @override
  String get downloadScopeLoadFailed => 'İndirilecek öğeler yüklenemedi';

  @override
  String downloadEstimateTotal(String size) {
    return 'Toplam ~$size';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received of $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return 'Toplam $size';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count bilinmeyen';
  }

  @override
  String downloadingItem(String name, String quality) {
    return '$name indiriliyor ($quality)…';
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
  String get starring => 'BAŞROLDE';

  @override
  String get directors => 'YÖNETMENLER';

  @override
  String get writer => 'YAZAR';

  @override
  String get writers => 'SENARİSTLER';

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
  String get shuffleAll => 'Tümünü Karıştır';

  @override
  String get shuffleAllMusic => 'Tüm müzikleri karıştır';

  @override
  String get carSignInPrompt => 'Moonfin\'e telefon üzerinden giriş yap';

  @override
  String get carServerUnreachable => 'Sunucuya erişilemiyor';

  @override
  String downloadsCount(int count) {
    return '$count indirme';
  }

  @override
  String get perfectMatch => 'Mükemmel eşleşme';

  @override
  String get aiTranslated => 'Yapay Zeka Çevirisi';

  @override
  String get machineTranslated => 'Makine Çevirisi';

  @override
  String get hearingImpaired => 'SDH';

  @override
  String framerateFps(String rate) {
    return '$rate fps';
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
  String get showMpvStats => 'MPV İstatistiklerini Göster (Shift+I)';

  @override
  String get hideMpvStats => 'MPV İstatistiklerini Gizle (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Klavye kısayolları';

  @override
  String get keyboardShortcutsSubtitle =>
      'Uygulama, video oynatıcı ve okuyucu için kısayollar';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Video oynatılırken oynatıcıdan çıkmadan bu listeyi görmek için ? veya F1 tuşuna basın.';

  @override
  String get keyboardShortcutsSectionApp => 'Her Yerde';

  @override
  String get keyboardShortcutsSectionAppScope => 'Herhangi bir ekranda';

  @override
  String get keyboardShortcutsSectionPlayer => 'Video Oynatıcı';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'Bir video açık, oynatılıyor veya duraklatılmışken';

  @override
  String get keyboardShortcutsSectionReader => 'Kitap ve çizgi roman okuyucusu';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'Kitap ve çizgi roman okuyucusundayken';

  @override
  String get keyNameArrowKeys => 'Yön tuşları';

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
  String get keyNameScrollWheel => 'Fare tekerleği';

  @override
  String get shortcutMoveFocus => 'Öğeler arasında gezin';

  @override
  String get shortcutActivate => 'Seçili öğeyi aç';

  @override
  String get shortcutGoBack => 'Geri git';

  @override
  String get shortcutToggleFullscreen => 'Tam ekranı aç yada kapat';

  @override
  String get shortcutQuit => 'Moonfin\'den çık';

  @override
  String get shortcutPlayPause => 'Oynat veya duraklat';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Kontrolleri göster veya açıksa oynat/duraklat';

  @override
  String get shortcutSeekBack => 'Geri sar (büyük atlamalar için basılı tut)';

  @override
  String get shortcutSeekForward =>
      'İleri sar (büyük atlamalar için basılı tut)';

  @override
  String get shortcutVolumeUp => 'Sesi yükselt';

  @override
  String get shortcutVolumeDown => 'Sesi alçalt';

  @override
  String get shortcutMute => 'Sesi kapat yada sesi aç';

  @override
  String get shortcutToggleSubtitles => 'Altyazıyı aç yada kapat';

  @override
  String get shortcutSlower => 'Yavaşlat';

  @override
  String get shortcutFaster => 'Hızlandır';

  @override
  String get shortcutPlaybackInfo => 'Oynatma bilgilerini göster';

  @override
  String get shortcutMpvStats => 'mpv istatistiklerini aç yada kapat';

  @override
  String get shortcutRecropBlackBars => 'Recrop black bars';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Tam ekrandan çık veya tam ekranda değilse durdur';

  @override
  String get shortcutHideControls => 'Hide controls';

  @override
  String get shortcutStopPlayback => 'Oynatmayı durdur';

  @override
  String get shortcutNextItem => 'Sonraki öğe';

  @override
  String get shortcutPreviousItem => 'Önceki öğe';

  @override
  String get shortcutSkipSegment => 'Skip intro or credits when offered';

  @override
  String get shortcutShowShortcuts => 'Bu listeyi göster';

  @override
  String get shortcutNextPage => 'Sonraki sayfa';

  @override
  String get shortcutPreviousPage => 'Önceki sayfa';

  @override
  String get shortcutScrollPage => 'Sayfayı kaydır (e-kitaplar)';

  @override
  String get shortcutFirstPage => 'İlk sayfa veya bölüm başı';

  @override
  String get shortcutLastPage => 'Son sayfa veya bölüm sonu';

  @override
  String get shortcutZoom => 'Yakınlaştır veya uzaklaştır (çizgi romanlar)';

  @override
  String get shortcutResetZoom => 'Yakınlaştırmayı sıfırla (çizgi romanlar)';

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
  String get player => 'Oynatıcı';

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
  String get videoRenderer => 'Video Renderer';

  @override
  String get videoRendererDescription =>
      'Native window gives the smoothest motion and sends HDR to the display untouched. Try another option if video misbehaves.';

  @override
  String get videoRendererNativeWindow => 'Native window (recommended)';

  @override
  String get videoRendererNativeHdrOnly => 'Native window for HDR only';

  @override
  String get videoRendererInApp => 'In-app (legacy)';

  @override
  String get track => 'Parça';

  @override
  String get channels => 'Kanallar';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get updating => 'Güncelleniyor…';

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
  String get bookmarksEllipsis => 'Yer imleri…';

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
  String get preparingInAppReader => 'Uygulama içi okuyucu hazırlanıyor…';

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
  String get guideRepeatBadge => 'Tekrar';

  @override
  String get guideTimeline => 'Kılavuz Zaman Çizelgesi';

  @override
  String failedToLoadGuide(String error) {
    return 'Rehber yüklenemedi: $error';
  }

  @override
  String get noChannelsFound => 'Hiçbir kanal bulunamadı';

  @override
  String get noProgramData => 'Program verisi yok';

  @override
  String get liveBadge => 'CANLI';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'Sıradaki: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes dk kaldı';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours sa kaldı';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours sa $minutes dk kaldı';
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
  String get record => 'Kaydet';

  @override
  String nextSeriesRecording(String dateTime) {
    return 'Next series recording: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'Series recording is scheduled, but the guide has no upcoming episodes';

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
  String get recordCurrentEpisode => 'Record This Episode';

  @override
  String get recordCurrentProgram => 'Record This Program';

  @override
  String get cancelCurrentRecording => 'Cancel This Recording';

  @override
  String get cancelRecordingAction => 'Kaydı iptal et';

  @override
  String get programSetToRecord => 'Program kaydedilmek üzere ayarlandı';

  @override
  String get recordingCancelled => 'Kayıt iptal edildi';

  @override
  String get unableToCreateRecording => 'Kayıt oluşturulamadı';

  @override
  String get recordSeries => 'Diziyi Kaydet';

  @override
  String get seriesSetToRecord => 'Dizi kaydedilmek üzere ayarlandı';

  @override
  String get seriesRecordingCancelled => 'Dizi kaydı iptal edildi';

  @override
  String get unableToCreateSeriesRecording => 'Dizi kaydı oluşturulamıyor';

  @override
  String get watch => 'İzle';

  @override
  String get watchChannelLive => 'Kanalı canlı izle';

  @override
  String get close => 'Kapat';

  @override
  String failedToPlayChannel(String name) {
    return '$name oynatılamadı';
  }

  @override
  String get playbackStreamLost => 'Oynatma durdu ve kurtarılamadı.';

  @override
  String get playbackVideoUnsupported =>
      'This device can\'t play this video\'s format. Try an external player.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Yeniden bağlanılıyor… ($attempt/$total)';
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
  String get searchThisLibrary => 'Bu kütüphaneyi arayın…';

  @override
  String get searchEllipsis => 'Ara…';

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
  String get savedMedia => 'İndirilenler';

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
  String get activeDownloads => 'Aktif İndirilenler';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe',
      one: '1 öğe',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used / $limit';
  }

  @override
  String get savedMediaSelectItems => 'Seçili öğeler';

  @override
  String get savedMediaNoDownloads => 'Henüz kaydedilen yok';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Başlattığınız indirmeler burada görünür ve internet bağlantısı olmadan oynatılabilir.';

  @override
  String get savedMediaNoActiveDownloads => 'Şu anda hiçbir şey indirilmiyor';

  @override
  String get savedMediaNoResults => 'Bu aramayla eşleşen indirme yok';

  @override
  String get savedMediaPlayFromStart => 'Baştan başlat';

  @override
  String get savedMediaGoToDetails => 'Detaylara git';

  @override
  String get savedMediaDeleteDownload => 'İndirmeyi sil';

  @override
  String savedMediaDeleteSeason(String season) {
    return '$season Sil';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bölüm sil',
      one: '1 bölüm sil',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Diziyi aç';

  @override
  String get savedMediaPlayNextUnwatched => 'Sonraki izlenmemiş bölümü oynat';

  @override
  String get savedMediaRead => 'Oku';

  @override
  String get savedMediaCancelDownload => 'İndirmeyi iptal et';

  @override
  String get sortBySize => 'Boyut';

  @override
  String get sortByName => 'İsim';

  @override
  String get sortByDateAdded => 'Eklenme tarihi';

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
  String get settingsSearchHint => 'Arama ayarları';

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
  String get mixedRowsOnly => 'Yalnızca karışık satırlar';

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
  String get loadingAnimation => 'Yüklenme Animasyonu';

  @override
  String get loadingAnimationDescription =>
      'Moonfin genelinde kullanılan yükleme animasyonlarını özelleştir';

  @override
  String get loadingAnimationConfiguration => 'Yüklenme Animasyonu Ayarları';

  @override
  String get loadingAnimationImage => 'Resim';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin Logo';

  @override
  String get loadingAnimationImageSpinner => 'Yükleme çarkı';

  @override
  String get loadingAnimationImageRunner => 'Kayan çizgi';

  @override
  String get loadingAnimationImageMoonPhases => 'Ay Evreleri';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin Evreleri';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfin Evreleri';

  @override
  String get loadingAnimationSize => 'Animasyon Boyutu';

  @override
  String get loadingAnimationSizeThumbnail => 'Küçük Resim';

  @override
  String get loadingAnimationSizeSmall => 'Küçük';

  @override
  String get loadingAnimationSizeMedium => 'Orta';

  @override
  String get loadingAnimationSizeLarge => 'Büyük';

  @override
  String get loadingAnimationPosition => 'Animasyon Konumu';

  @override
  String get loadingAnimationPositionTopLeft => 'Üst Sol';

  @override
  String get loadingAnimationPositionTopCenter => 'Üst Orta';

  @override
  String get loadingAnimationPositionTopRight => 'Üst Sağ';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Orta Sol';

  @override
  String get loadingAnimationPositionMiddle => 'Orta';

  @override
  String get loadingAnimationPositionMiddleRight => 'Orta Sağ';

  @override
  String get loadingAnimationPositionBottomLeft => 'Alt Sol';

  @override
  String get loadingAnimationPositionBottomCenter => 'Alt Orta';

  @override
  String get loadingAnimationPositionBottomRight => 'Alt Sağ';

  @override
  String get loadingAnimationPositionBouncing => 'Zıplayan';

  @override
  String get loadingAnimationSpeed => 'Animasyon Hızı';

  @override
  String get loadingAnimationSpeedSlow => 'Yavaş';

  @override
  String get loadingAnimationSpeedModerate => 'Orta';

  @override
  String get loadingAnimationSpeedFast => 'Hızlı';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Yazıyı Göster';

  @override
  String get loadingAnimationPreview => 'Önizleme';

  @override
  String get snow => 'Kar';

  @override
  String get fireworks => 'Havai fişek';

  @override
  String get confetti => 'Konfeti';

  @override
  String get fallingLeaves => 'Düşen Yapraklar';

  @override
  String get seasonalChristmas => 'Christmas';

  @override
  String get seasonalPetals => 'Spring Petals';

  @override
  String get seasonalFireflies => 'Fireflies';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Density';

  @override
  String get seasonalDensityLight => 'Light';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Heavy';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => 'Seasonal Row';

  @override
  String get seasonalRowDescription =>
      'Show a row of holiday movies from your library, with Seerr suggestions when available.';

  @override
  String get seasonalRowSubtitle => 'Seasonal';

  @override
  String get seasonalRowCountry => 'Country';

  @override
  String get seasonalRowCountryAuto => 'Automatic';

  @override
  String get countryUnitedStates => 'United States';

  @override
  String get countryCanada => 'Canada';

  @override
  String get seasonalRowCountryOther => 'Other';

  @override
  String get seasonalRowHolidays => 'Holidays';

  @override
  String get seasonalRowHolidaysHint => 'Untick a holiday to hide its row.';

  @override
  String get holidayNewYear => 'New Year\'s';

  @override
  String get holidayValentines => 'Valentine\'s Day';

  @override
  String get holidayEaster => 'Easter';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Thanksgiving';

  @override
  String get holidayChristmas => 'Christmas Movies';

  @override
  String get holidayLunarNewYear => 'Lunar New Year';

  @override
  String get holidayDiwali => 'Diwali';

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
  String get loopThemeMusic => 'Tema Müziğini Sürekli Çal';

  @override
  String get loopThemeMusicSubtitle =>
      'Parçayı bir kez oynatmak yerine döngüye al';

  @override
  String get detailsBackgroundBlur => 'Arka Plan Bulanıklığı';

  @override
  String get detailsBackgroundOpacity => 'Arka Plan Opaklığı';

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
  String get settingsScrollWheelAction => 'Fare Tekerleği';

  @override
  String get settingsScrollWheelActionDescription =>
      'Oynatma sırasında video üzerinde fare tekerleğini kaydırmanın ne işe yarayacağını seçin.';

  @override
  String get scrollWheelActionOff => 'Kapalı';

  @override
  String get scrollWheelActionSeek => 'Sar (İleri / Geri)';

  @override
  String get scrollWheelActionVolume => 'Ses düzeyi';

  @override
  String get playerTooltipVolume => 'Ses düzeyi';

  @override
  String get fit => 'Sığdır';

  @override
  String get autoCrop => 'Sığdırarak Yakınlaştır';

  @override
  String get cropBlackBars => 'Siyah Bantları Kırp';

  @override
  String get settingsCropBlackBarsDescription =>
      'Oynatma başladıktan sonra kodlanmış siyah şeritleri tespit et, kırp ve ekranı doldur. Oynatıcıdaki yakınlaştırma düğmesinden yeniden kırpılabilir.';

  @override
  String get cropBlackBarsRecropInterval => 'Recrop Interval';

  @override
  String get cropBlackBarsOnce => 'Once at start';

  @override
  String get cropBlackBarsEverySecond => 'Every second';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Follow aspect ratio changes during playback.';

  @override
  String get playerRecroppingBlackBars => 'Recropping black bars';

  @override
  String get stretch => 'Uzat';

  @override
  String get refreshRateSwitching => 'Yenileme Hızını Değiştir';

  @override
  String get disabled => 'Devre dışı';

  @override
  String get manual => 'Elle';

  @override
  String get autoDetect => 'Otomatik Tespit Et';

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
  String get trickplayDisplayStyleSingle => 'Tek Küçük Resim';

  @override
  String get trickplayDisplayStyleStrip => 'Film Şeridi';

  @override
  String get trickplayModeFull => 'Tam Ekran';

  @override
  String get trickplaySettingsPreviewHint =>
      'Gezinmek için kaydırıcıyı sürükleyin';

  @override
  String get trickplayPreviewScale => 'Önizleme Boyutu';

  @override
  String get trickplayVerticalOffset => 'Arama Çubuğundan Uzaklık';

  @override
  String get trickplayFollowScrubPosition => 'Arama Konumunu Takip Et';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Ortada sabit kalmak yerine, sarma yaparken arama çubuğu boyunca slaytları önizle';

  @override
  String get trickplayPauseWhileScrubbing => 'Kaydırırken duraklat';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Kaydırma sırasında oynatma duraklatılır ve oynat tuşuna bastığınızda devam eder. Oynatmayı kesmeden doğrudan yeni konuma atlamak için bu ayarı kapatın';

  @override
  String get showDescriptionOnPause => 'Duraklatıldığında Açıklamayı Göster';

  @override
  String get dimVideoShowOverview =>
      'Duraklatıldığında videoyu karart ve özet metnini göster';

  @override
  String get showChapterMarkers => 'Bölüm İşaretleri';

  @override
  String get showChapterMarkersDescription =>
      'İlerleme çubuğunda bölüm başlangıçlarını işaretle';

  @override
  String get osdLockButton => 'Ekran Kilidi Butonu';

  @override
  String get osdLockButtonDescription =>
      'Uzun basılana kadar dokunma girişini engelleyen bir kilitleme düğmesi göster';

  @override
  String get playerSwipeGestures => 'Ses ve Parlaklık Kaydırma Hareketleri';

  @override
  String get playerSwipeGesturesDescription =>
      'Parlaklığı değiştirmek için sol tarafta, sesi değiştirmek için sağ tarafta oynatıcı üzerinde yukarı veya aşağı kaydırın';

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
  String get osdButtons => 'Oynatıcı butonları';

  @override
  String get osdButtonsDescription => 'Gösterilecek oynatıcı düğmelerini seç';

  @override
  String get osdButtonsSectionDescription =>
      'Oynatma kontrolleri her zaman gösterilir. Aşağıdaki her şey size kalmıştır ve her cihaz türü kendi listesini ayrı ayrı tutar.';

  @override
  String get detailButtons => 'İşlem Düğmeleri';

  @override
  String get detailButtonsDescription =>
      'Detay ekranında gösterilecek düğmeleri seç';

  @override
  String get detailButtonsSectionDescription =>
      'Oynat her zaman ilk sıradadır ve kilitli düğmeler her zaman gösterilir. Geri kalan her şey size kalmıştır ve her cihaz türü kendi listesini ayrı tutar.';

  @override
  String get actionButtonsOnScreen => 'Ekrandaki eylem düğmeleri';

  @override
  String get actionButtonsOnScreenDescription =>
      'Diğer Eylemler menüsüne taşınmadan önce kaç eylem düğmesinin gösterileceğini belirleyin.';

  @override
  String get actionButtonsOnScreenAuto => 'Otomatik (Tema Varsayılanı)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Sadece Oynat)';

  @override
  String get actionButtonsOnScreenAll => 'Tümü (Yatay Kaydırma)';

  @override
  String get detailMetadata => 'Meta Veri Satırı';

  @override
  String get detailMetadataDescription =>
      'Detaylar ekranında gösterilecek meta verileri seçin ve sıralayın';

  @override
  String get detailMetadataSectionDescription =>
      'Meta veri öğelerini açıp kapatın ve detaylar ekranındaki görünüm sırasını düzenleyin. Her cihaz türü kendi listesini ayrı tutar.';

  @override
  String get detailMetadataYear => 'Yayın Yılı';

  @override
  String get detailMetadataParentalRating => 'Yaş Sınırı';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Süre & Sezonlar';

  @override
  String get detailMetadataStatus => 'Dizi Durumu';

  @override
  String get detailMetadataStatusSubtitle =>
      'Dizinin devam ettiğini, sona erdiğini veya geri döneceğini gösterir';

  @override
  String get detailMetadataGenres => 'Türler';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr Durumu';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Seerr üzerindeki talep ve medya durumunu gösterir';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Gelecek Bölümler';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Sonarr ve TMDB kullanarak gelecek yayın tarihlerini gösterir';

  @override
  String get detailSections => 'Sections';

  @override
  String get detailSectionsDescription =>
      'Choose which parts of the Details screen to show';

  @override
  String get detailSectionsScreenDescription =>
      'Only the sections the current Details screen style can show are listed. Hiding one hides it in every style that has it.';

  @override
  String get detailSectionGroupHeader => 'Header';

  @override
  String get detailSectionGroupSections => 'Sections';

  @override
  String get detailSectionGroupPerson => 'Person pages';

  @override
  String get detailSectionGroupCollection => 'Collection pages';

  @override
  String get detailSectionGroupOther => 'Other';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle => 'Shows the title as text when off';

  @override
  String get detailSectionTagline => 'Tagline';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Version badge';

  @override
  String get detailSectionUpNext => 'Next Up';

  @override
  String get detailSectionLyrics => 'Lyrics';

  @override
  String get detailSectionCast => 'Cast';

  @override
  String get detailSectionCastSubtitle => 'Also on collection pages';

  @override
  String get detailSectionCrew => 'Directors & writers';

  @override
  String get detailSectionStudios => 'Studios';

  @override
  String get detailSectionChapters => 'Chapters';

  @override
  String get detailSectionExtras => 'Extras';

  @override
  String get detailSectionCollections => 'Collections';

  @override
  String get detailSectionMoreLikeThis => 'More Like This';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Also similar albums and artists';

  @override
  String get detailSectionMoreEpisodes => 'More episodes';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'On episode pages';

  @override
  String get detailSectionMediaInfo => 'Media info';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'File, streams and Direct Play check';

  @override
  String get detailSectionSeerrGenresTags => 'Genres & tags';

  @override
  String get detailSectionSeerrStats => 'Stats';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => 'Recommendations';

  @override
  String get detailSectionSeerrSimilar => 'Similar titles';

  @override
  String get detailSectionSeerrCollection => 'Collection banner';

  @override
  String get detailSectionSeerrPersonAppearances => 'Appearances';

  @override
  String get detailSectionSeerrPersonCrew => 'Crew credits';

  @override
  String get detailSectionPersonPagesSubtitle => 'On person pages';

  @override
  String get detailSectionBiography => 'Biography';

  @override
  String get detailSectionBirthplace => 'Birthplace';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => 'Guest appearances';

  @override
  String get detailSectionMusicVideos => 'Music videos';

  @override
  String get detailSectionPlaylistOrder => 'Playlist order';

  @override
  String get detailSectionBookGenres => 'Book genres';

  @override
  String get detailSectionPhotoExif => 'Photo details';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Sonraki: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Bugün';

  @override
  String get upcomingEpisodeTomorrow => 'Yarın';

  @override
  String get moveUp => 'Yukarı Taşı';

  @override
  String get moveDown => 'Aşağı Taşı';

  @override
  String get buttonOrderHint =>
      'Sıralamayı değiştirmek için okları kullanın. Kumandada sol ve sağ tuşları vurgulanan düğmeyi hareket ettirir. Bir düğmeyi kapatmak, onu diğerlerinin altına düşürür.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Only shows while you\'re in a SyncPlay group';

  @override
  String get orientationLock => 'Döndürme Kiliti';

  @override
  String get fullscreen => 'Tam Ekran';

  @override
  String get audioBehavior => 'Ses Davranışı';

  @override
  String get downmixToStereo => 'Stereo\'ya Dönüştür';

  @override
  String get defaultAudioLanguage => 'Varsayılan Ses Dili';

  @override
  String get fallbackAudioLanguage => 'Yedek Ses Dili';

  @override
  String get preferDefaultAudioTrack => 'Varsayılan Ses Parçasına Öncelik Ver';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Yerel dublaj yerine orijinal ses parçasına öncelik ver.';

  @override
  String get preferAudioDescription =>
      'Sesli Betimlemeli Parçalara Öncelik Ver';

  @override
  String get preferAudioDescriptionDescription =>
      'Normal ses yerine sesli betimlemeli parçalara öncelik ver.';

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
  String get settingsAudioFallbackCodec => 'Yedek Ses Kodeki';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Kaynak akış doğrudan oynatılamadığında veya doğrudan geçiş (passthrough) yapılamadığında, çok kanallı sesin dönüştürüleceği hedef formatı seçin.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto => 'Otomatik Algıla\n(Önerilen)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Varsayılan)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

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
      'Doğrudan Geçiş (Passthrough) (Gelişmiş)';

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
  String get settingsAudioDtsCorePassthrough =>
      'DTS Core Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioDtsHdPassthrough =>
      'DTS-HD MA Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioPassthroughMode => 'Doğrudan Geçiş (Passthrough)';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'Sıkıştırılmış surround sesinin TV\'nize veya alıcınıza nasıl ulaştığı.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Devre dışı (her zaman bu cihazda çözülecek)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Otomatik (algılanan cihaz desteğiyle eşleştir)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Manuel (aşağıdaki formatları seçin)';

  @override
  String get settingsAudioPassthroughOutput =>
      'Doğrudan Geçiş (Passthrough) Çıkışı';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'HDMI bağlantısı için bit akışlarını kimin paketleyeceğini belirleyin. Bu cihazda doğrudan geçiş (passthrough) sırasında ses gelmiyorsa veya kesilmeler oluyorsa uygulama paketleyicisini deneyin.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Otomatik, sistem paketleyicisi (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec =>
      'Uygulama paketleyicisi (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'Uygulama (IEC)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Çözülen tüm sesleri iki kanala (stereo) dönüştür.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream E-AC-3, Dolby Atmos (JOC) dahil.';

  @override
  String get settingsAudioDtsHdIncludesDtsX => 'Bitstream DTS-HD, DTS:X dahil.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, Dolby Atmos dahil.';

  @override
  String get settingsAudioTrueHdPassthrough =>
      'TrueHD Doğrudan Geçiş (Passthrough)';

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
  String get settingsAudioRouteHeadphones => 'Kulaklık';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kanal PCM';
  }

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
  String get hardwareDecoding => 'Donanım Kod Çözme';

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
  String get subtitleDownloadLanguages => 'Subtitle Download Languages';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Languages to search when downloading subtitles, up to 5. Auto searches one language picked from your default subtitle language or the video.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Preferred Secondary Subtitle Language';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Show a second subtitle track at the same time. The subtitle menu then asks for the primary or secondary track first';

  @override
  String get defaultToNoSubtitles => 'Varsayılan olarak Altyazı Yok';

  @override
  String get turnOffSubtitlesByDefault => 'Altyazıları varsayılan olarak kapat';

  @override
  String get subtitleSize => 'Altyazı Boyutu';

  @override
  String get primarySubtitleSlot => 'Primary Track';

  @override
  String get secondarySubtitleSlot => 'Secondary Track';

  @override
  String get secondarySubtitleTrack => 'Secondary Subtitles';

  @override
  String get secondaryDelayAdjustment => 'Secondary Delay Adjustment';

  @override
  String decreaseValue(String setting) {
    return 'Decrease $setting';
  }

  @override
  String increaseValue(String setting) {
    return 'Increase $setting';
  }

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
  String get subtitleMode => 'Altyazı Modu';

  @override
  String get subtitleModeFlagged => 'İşaretli';

  @override
  String get subtitleModeAlways => 'Her zaman';

  @override
  String get subtitleModeForeign => 'Yabancı Diller';

  @override
  String get subtitleModeForced => 'Zorunlu';

  @override
  String get subtitleModeFlaggedDescription =>
      'Medya dosyasının meta verilerinde \'varsayılan\' veya \'zorunlu\' olarak işaretlenmiş parçaları oynatır.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Her video başladığında altyazıları otomatik olarak yükler ve görüntüler.';

  @override
  String get subtitleModeForeignDescription =>
      'Varsayılan ses parçası yabancı bir dildeyse altyazıları otomatik olarak açar.';

  @override
  String get subtitleModeForcedDescription =>
      'Yalnızca meta verilerinde açıkça zorunlu olarak işaretlenmiş altyazıları yükler.';

  @override
  String get subtitleModeNoneDescription =>
      'Otomatik altyazı yüklemeyi tamamen devre dışı bırakır.';

  @override
  String get fallbackSubtitleLanguage => 'Yedek Altyazı Dili';

  @override
  String get subtitleStream => 'Altyazı Parçası';

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
  String get semiTransparentWhite => 'Yarı şeffaf Beyaz';

  @override
  String get lightGray => 'Açık Gri';

  @override
  String get darkGray => 'Koyu Gri';

  @override
  String get blue => 'Mavi';

  @override
  String get magenta => 'Macenta';

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
  String get syncing => 'Senkronize ediliyor…';

  @override
  String resetProfileTitle(String profile) {
    return '$profile sıfırlansın mı?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Bu işlem $profile profilini sunucudan siler ve bu cihazdaki tüm eşitlenmiş ayarları varsayılan değerlerine döndürür.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Bu işlem sunucudaki tüm kayıtlı profilleri siler ve bu cihazdaki tüm eşitlenmiş ayarları varsayılan değerlerine döndürür.';

  @override
  String profileReset(String profile) {
    return '$profile profilini varsayılana sıfırla.';
  }

  @override
  String get resetRatingsTitle => 'Puanları sıfırla?';

  @override
  String get resetRatingsDescription =>
      'Bu işlem, hangi kaynakların görüneceği ve görünüm sıralaması dahil olmak üzere tüm puanlama ayarlarını varsayılan değerlerine döndürür.';

  @override
  String get ratingsReset => 'Puanları varsayılana sıfırla.';

  @override
  String failedToResetProfile(String profile) {
    return '$profile profili sıfırlanamadı.';
  }

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
  String get tvOfflineDownloads => 'Çevrimdışı İndirmeleri Etkinleştir';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Öğe sayfalarında indirme işlemlerini göster';

  @override
  String get reportDownloadsActivity => 'İndirmeleri Sunucuda Göster';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Sunucu yöneticisinin, kodu dönüştürülmüş indirmelerinizi panelde görmesine izin verin';

  @override
  String get onlyDownloadOnWifi => 'Yalnızca Wi-Fi\'ye bağlanıldığında indir';

  @override
  String get storage => 'Depolama';

  @override
  String get storageUsed => 'Kullanılan Depolama';

  @override
  String get manage => 'Yönet';

  @override
  String get calculating => 'Hesaplanıyor…';

  @override
  String get downloadLocation => 'İndirme Konumu';

  @override
  String get defaultLabel => 'Varsayılan';

  @override
  String get sdCard => 'SD Kart';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android, Moonfin uygulamasının yalnızca kendi sahip olduğu klasörlere yazmasına izin veriyor ve bu cihazda çıkarılabilir depolama alanı yok. İndirmelerin diğer uygulamaların erişebileceği bir yere kaydedilmesi için yukarıdaki \'İndirilenler klasörüne kaydet\' seçeneğini açın.';

  @override
  String get saveToDownloadsFolder => 'İndirilenler Klasörüne Kaydet';

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
  String get transcodingTimeRemainingUnavailable =>
      'Kod Dönüştürme: Kalan Süre Bilinmiyor';

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
  String get showLiveTvButton => 'Canlı TV Butonunu Göster';

  @override
  String get showDownloadsButton => 'İndirilenler Butonunu Göster';

  @override
  String get showLibrariesInToolbar => 'Kitaplıkları Araç Çubuğunda Göster';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Gezinti Çubuğu Etiketlerini Her Zaman Göster';

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
  String get mergeRecentRowsByType => 'Son Satırları Türe Göre Birleştir';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Son Eklenenler ve Son Çıkanlar ana sayfa satırları için aynı türdeki ayrı kütüphaneleri birleştirin.';

  @override
  String get libraryView => 'Kütüphane Görünümü';

  @override
  String get libraryStyle => 'Video Library Style';

  @override
  String get libraryStyleDescription =>
      'Classic is the original header with icon buttons. Modern puts search and labeled sort, group and filter buttons in one bar. Docked moves the controls and the letters into a side panel.';

  @override
  String get libraryStyleDescriptionPhone =>
      'Classic is the original header with icon buttons. Modern adds labeled sort, group and filter chips under the search. Docked keeps the controls in a bar at the bottom of the screen.';

  @override
  String get libraryStyleClassic => 'Classic';

  @override
  String get libraryStyleModern => 'Modern';

  @override
  String get libraryStyleDocked => 'Docked';

  @override
  String get bookLibraryStyle => 'Book Library Style';

  @override
  String get bookLibraryStyleDescription =>
      'Classic is the original shelves under a featured title. Reading Room leads with what you\'re reading on large cards. Bookstore browses the whole library in a grid.';

  @override
  String get bookLibraryStyleClassic => 'Classic';

  @override
  String get bookLibraryStyleReadingRoom => 'Reading Room';

  @override
  String get bookLibraryStyleBookstore => 'Bookstore';

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
      other: '$count series',
      one: '1 series',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count in progress';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Browse all $count titles',
      one: 'Browse 1 title',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Search books';

  @override
  String get libraryShowLabel => 'Show';

  @override
  String get libraryAToZ => 'A to Z';

  @override
  String get libraryJumpToLetter => 'Jump to letter';

  @override
  String get groupItemsIntoCollections =>
      'Ögeleri Koleksiyonlar Halinde Grupla';

  @override
  String get hideCollectionAssociatedItems =>
      'Kitaplıklarda gezinirken koleksiyona dahil olan ögeleri gizle';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Kitaplık Gruplandırma Bildirimi';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Bu özellikten yararlanabilmek için Jellyfin veya Emby sunucunuzun Kitaplık > Görüntüleme ayarları altındaki \'Filmleri koleksiyonlar halinde grupla\' ve/veya \'Dizileri koleksiyonlar halinde grupla\' seçeneklerinin açık olduğundan emin olun.';

  @override
  String get libraryVisibility => 'Kütüphane Görünürlüğü';

  @override
  String get libraryVisibilityDescription =>
      'Kitaplık başına ana sayfa görünürlüğünü değiştirin. Değişikliklerin etkili olması için Moonfin yeniden başlatın.';

  @override
  String get showInNavigation => 'Menüde Göster';

  @override
  String get showInLatestMedia => 'Son eklenen/yayınlanan medyalarda göster';

  @override
  String get libraryOrder => 'Library Order';

  @override
  String get libraryOrderSubtitle => 'Choose the order of your libraries';

  @override
  String get libraryOrderDescription =>
      'Your libraries appear in this order on My Media, the recently added rows and the navigation bar. The order is saved to your server account, so other apps you sign in to use it too.';

  @override
  String get libraryOrderTvHint =>
      'Press left or right to move the highlighted library.';

  @override
  String get libraryOrderSaveFailed => 'Couldn\'t save the library order';

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
  String get mediaBarMode => 'Medya Çubuğu Stili';

  @override
  String get mediaBarModeDescription =>
      'Çeşitli medya çubuğu stilleri arasından seçim yapın veya medya çubuğunu kapatın';

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
  String get mediaBarModeOff => 'Kapalı';

  @override
  String get mediaBarModeBookshelf => 'Kitaplık';

  @override
  String get mediaBarModeGallery => 'Galeri';

  @override
  String get mediaBarModeBanner => 'Afiş';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Medya Çubuğunu Etkinleştir';

  @override
  String get showFeaturedContentSlideshow =>
      'Ana Sayfada Öne Çıkanlar Slaytını Göster';

  @override
  String get contentType => 'İçerik Türü';

  @override
  String get mediaBarSourceType => 'Kaynak';

  @override
  String get mediaBarSourceRandom => 'Rastgele';

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
  String get trailerAudio => 'Fragman Sesi';

  @override
  String get enableTrailerAudio =>
      'Medya çubuğundaki fragmanlar için sesi etkinleştir';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Fragman Altyazıları';

  @override
  String get trailerCaptionsDescription =>
      'YouTube fragmanlarında altyazıları göster';

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
  String get enablePreviewAudio => 'Medya önizlemeleri için sesi aç';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'En Son Eklenen Medya';

  @override
  String get recentlyReleased => 'Son Çıkanlar';

  @override
  String get recentlyReleasedSeriesType => 'Son Çıkan Diziler Göre Sırala';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Son çıkan diziler ana sayfa satırlarını diziye, son sezona veya son bölüm yayın tarihine göre sırala';

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
  String get favoriteChannels => 'Favori Kanallar';

  @override
  String get resetToDefaults => 'Varsayılanlara sıfırla';

  @override
  String get homeRowPosterSize => 'Ana Sayfa Satır Poster Boyutu';

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
  String get continueWatchingDefaultAction => 'Default Action';

  @override
  String get continueWatchingDefaultActionDescription =>
      'What selecting a Continue Watching or Next Up item does';

  @override
  String get goToDetailsScreen => 'Go to Details';

  @override
  String get playImmediately => 'Play immediately';

  @override
  String get nextUpMaxDays => 'Sıradaki Bölümler için maksimum gün';

  @override
  String get nextUpMaxDaysDescription =>
      'Bir dizinin, son izlemenizden sonra Sıradaki Bölümlerde kalacağı süre';

  @override
  String daysValue(int days) {
    return '$days gün';
  }

  @override
  String get fullScreenRows => 'Genişletilmiş Satırlar';

  @override
  String get fullScreenRowsDescription =>
      'Ana sayfa satırlarını ekran başına 1 satırla sınırla';

  @override
  String get homeRowsPadding => 'Satır Boşluğu';

  @override
  String get homeRowsPaddingDescription =>
      'Ana sayfa satırları arasındaki boşluğu özelleştir';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get displayClockDuringScreensaver =>
      'Ekran koruyucu sırasında saati göster';

  @override
  String get clockModeStatic => 'Statik';

  @override
  String get clockModeBouncing => 'Zıplayan';

  @override
  String get screensaverGeneralSettings => 'Genel Ayarlar';

  @override
  String get screensaverVisualComponents => 'Görsel Bileşenler';

  @override
  String get screensaverLibraryContent => 'Kütüphane İçeriği';

  @override
  String get screensaverBackdrop => 'Arka Plan';

  @override
  String get screensaverBackdropBlack => 'Siyah';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Sakin';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Ek Bileşen';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin Logo';

  @override
  String get screensaverComponentRunner => 'Kayan Yazı';

  @override
  String get screensaverComponentMovement => 'Bileşen Hareketi';

  @override
  String get screensaverComponentPosition => 'Bileşen Pozisyonu';

  @override
  String get screensaverComponentSize => 'Bileşen Boyutu';

  @override
  String get screensaverSourceLibrariesDefault => 'Tümü (Varsayılan)';

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
  String get pluginDetected => 'Eklenti Algılandı';

  @override
  String get pluginNotDetected => 'Eklenti Algılanmadı';

  @override
  String get pluginNotDetectedDescription =>
      'Sunucu eklentisi şu anda algılanmıyor. Yerel ayarlar hâlâ kayıtlı değerlerini veya yerleşik varsayılanları kullanır.';

  @override
  String get moonbaseAddress => 'Moonbase Address';

  @override
  String get pluginConnected => 'Connected';

  @override
  String pluginConnectedVersion(String version) {
    return 'Connected, version $version';
  }

  @override
  String get pluginSyncOn => 'Sync on';

  @override
  String get pluginSyncOff => 'Sync off';

  @override
  String get syncProfileDescription =>
      'This device syncs with the profile you pick until you pick another.';

  @override
  String get profileAppliesEverywhere => 'Applies everywhere';

  @override
  String get profileOverridesGlobal => 'Overrides Global';

  @override
  String get profileThisDevice => 'This device';

  @override
  String get profileLoad => 'Load';

  @override
  String get profileLoadSubtitle => 'Server to this device';

  @override
  String get profileSaveSubtitle => 'This device to server';

  @override
  String resetNamedProfile(String profile) {
    return 'Reset $profile Profile';
  }

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
  String get tags => 'Etiketler';

  @override
  String get genresAndTags => 'Türler ve Etiketler';

  @override
  String get seerrDiscoveryRows => 'Seerr Keşfet Satırları';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'İzleme Listen';

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
  String get showMissingCollectionItems => 'Eksik Koleksiyon Öğelerini Göster';

  @override
  String get showMissingCollectionItemsDesc =>
      'Eksik öğeleri Koleksiyon sayfalarına dahil et';

  @override
  String get showSeerrAvailabilityBadges => 'Seerr Durum Rozetlerini Göster';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Medya detay sayfalarında sezon durum rozetlerini göster';

  @override
  String get seerrNotificationsSection => 'Bildirimler';

  @override
  String get seerrNotifyNewRequestsTitle => 'Yeni Keşfet Bildirimleri';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Birisi talep gönderdiğinde bana bildirim gönder';

  @override
  String get seerrNotifyLibraryAddedTitle => 'İstek Güncellemeleri';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Onaylandı, reddedildi ve kütüphanenize eklendi';

  @override
  String get seerrNotifyIssuesTitle => 'Sorun Güncellemeleri';

  @override
  String get seerrNotifyIssuesSubtitle => 'Yeni sorunlar, yanıtlar ve çözümler';

  @override
  String get seerrNotifyNewMediaTitle => 'Yeni Medya Eklendi';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Sunucu kütüphanesine eklenen yeni içerikler';

  @override
  String loggedInAs(String username) {
    return '$username olarak oturum açıldı';
  }

  @override
  String get discoverRows => 'Seerr Keşfet Sayfaları';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr ana sayfasında görmek istediğiniz satırları etkinleştirin. Yeniden sıralamak için sürükleyin. Özel sıralama Moonbase ile senkronize edilir.';

  @override
  String get discoverRowsDescription =>
      'Seerr ana sayfasında görmek istediğiniz satırları etkinleştirin. Yeniden sıralamak için sürükleyin. Özel sıralama Moonbase ile senkronize edilir.';

  @override
  String get enabled => 'Etkin';

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
  String get downloadingUpdate => 'Güncelleme indiriliyor…';

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
  String get featuredContentAppearance => 'Öne çıkan içerik, görünüm';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Görsel Önbelleği Sınırı';

  @override
  String get clearImageCache => 'Görsel Önbelleğini Temizle';

  @override
  String get imageCacheCleared => 'Görsel önbelleği temizlendi';

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
  String get seerrDownloading => 'İndiriliyor';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'İndiriliyor · $done / $total';
  }

  @override
  String seerrDownloadedOfTotal(String done, String total) {
    return '$done / $total';
  }

  @override
  String seerrPercentValue(int percent) {
    return '%$percent';
  }

  @override
  String seerrDownloadingPercent(int percent) {
    return 'İndiriliyor · %$percent';
  }

  @override
  String get seerrImportingStatus => 'İçe Aktarılıyor';

  @override
  String itemsCount(int count) {
    return '$count Öğe';
  }

  @override
  String get seerrSettings => 'Seerr Ayarları';

  @override
  String get requestMore => 'Daha Fazla Talep Et';

  @override
  String get requestMore4k => '4K Olarak Daha Fazla İste';

  @override
  String get request => 'İste';

  @override
  String get request4k => '4K İste';

  @override
  String get requested4k => '4K İstendi';

  @override
  String get cancelRequest => 'İsteği İptal Et';

  @override
  String get cancelRequest4k => '4K İsteğini İptal Et';

  @override
  String get playInMoonfin => 'Moonfin\'da oynat';

  @override
  String get requestedByLabel => 'Talep Eden';

  @override
  String requestedByName(String name) {
    return '$name tarafından istendi';
  }

  @override
  String get manageRequests => 'İstekleri Yönet';

  @override
  String get watchlist => 'İzleme Listesi';

  @override
  String get onWatchlist => 'İzleme Listesinde';

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
  String requestSeriesOrMovie4k(String type) {
    return '4K $type İste';
  }

  @override
  String get submitRequest => 'Talebi Gönder';

  @override
  String get allSeasons => 'Tüm Sezonlar';

  @override
  String get seerrSeriesContinuing =>
      'Dizi Devam Ediyor · Gelecek Sezonlar Talep Edilebilir';

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
  String get appearances => 'Rol aldığı yapımlar';

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
  String get failedStatus => 'Başarısız Oldu';

  @override
  String get processingStatus => 'İşleniyor';

  @override
  String modifiedByName(String name) {
    return '$name tarafından değiştirildi';
  }

  @override
  String get completedStatus => 'Tamamlandı';

  @override
  String get requestErrorDuplicate => 'Bu içerik zaten talep edilmiş';

  @override
  String get requestErrorQuota => 'İstek sınırına ulaşıldı';

  @override
  String get requestErrorBlocklisted => 'Bu içerik kara listede';

  @override
  String get requestErrorNoSeasons => 'Talep edilecek sezon kalmadı';

  @override
  String get requestErrorPermission =>
      'Bu talebi gerçekleştirmek için izniniz yok';

  @override
  String get seerrRequestsTitle => 'İstekler';

  @override
  String get seerrIssuesTitle => 'Sorunlar';

  @override
  String get sortNewest => 'En Yeni';

  @override
  String get sortLastModified => 'Son Düzenlenen';

  @override
  String get noIssues => 'Sorun Yok';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Kalan film talebi: $remaining / $limit';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Kalan sezon talebi: $remaining / $limit';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name koleksiyonunun parçası';
  }

  @override
  String get viewCollection => 'Koleksiyonu Görüntüle';

  @override
  String get requestCollection => 'Koleksiyonu İste';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total film · $available mevcut';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count film iste';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'İsteniyor: $current / $total…';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count film istendi';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'İstenen film: $ok / $total';
  }

  @override
  String get collectionAllRequested => 'Tüm filmler zaten mevcut veya istenmiş';

  @override
  String get reportIssue => 'Sorun Bildir';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Ses';

  @override
  String get whatsWrong => 'Sorun ne?';

  @override
  String get allEpisodes => 'Tüm Bölümler';

  @override
  String get episode => 'Bölüm';

  @override
  String get openStatus => 'Açık';

  @override
  String get resolvedStatus => 'Çözüldü';

  @override
  String get resolveAction => 'Çöz';

  @override
  String get reopenAction => 'Tekrar aç';

  @override
  String reportedByName(String name) {
    return '$name tarafından bildirildi';
  }

  @override
  String commentsCount(int count) {
    return '$count yorum';
  }

  @override
  String get addComment => 'Yorum ekle';

  @override
  String get deleteIssueConfirm => 'Sorun silinsin mi?';

  @override
  String get submitReport => 'Raporu Gönder';

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
  String get done => 'Bitti';

  @override
  String get edit => 'Düzenle';

  @override
  String get encoding => 'Kodlama';

  @override
  String get error => 'Hata';

  @override
  String get forward => 'İleri sar';

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
  String get remote => 'Kumanda';

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
  String get trickplay => 'Trickplay';

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
  String get mute => 'Sessize al';

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
  String get adminDrawerDisplay => 'Görünüm';

  @override
  String get adminDrawerMetadata => 'Meta Veri';

  @override
  String get adminDrawerNfo => 'NFO Ayarları';

  @override
  String get adminDrawerTranscoding => 'Kod dönüştür';

  @override
  String get adminDrawerResume => 'Devam et';

  @override
  String get adminDrawerStreaming => 'Akış';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminPremiereNoteLiveTv =>
      'Live TV needs Emby Premiere. Without it the server doesn\'t import channels or record anything.';

  @override
  String get adminPremiereNoteBackups =>
      'Backup & Restore needs Emby Premiere once its trial ends.';

  @override
  String get adminGeneralRunAtStartup => 'Run the server at startup';

  @override
  String get adminGeneralLaunchWebApp =>
      'Open the web app in a browser when the server starts';

  @override
  String get adminGeneralBannerText => 'Home screen banner text';

  @override
  String get adminGeneralBannerTextHelp =>
      'Shown to every user on their home screen';

  @override
  String get adminGeneralSectionMaintenance => 'Maintenance mode';

  @override
  String get adminGeneralMaintenanceMode =>
      'Put the server into maintenance mode';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Users only see the maintenance message.';

  @override
  String get adminGeneralMaintenanceMessage => 'Maintenance message';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Leave it blank for a general message in each user\'s language.';

  @override
  String get adminGeneralSectionUpdates => 'Automatic updates';

  @override
  String get adminGeneralAutoUpdate => 'Update the server automatically';

  @override
  String get adminGeneralAutoRestart =>
      'Restart automatically to apply updates';

  @override
  String get adminGeneralAutoRestartHelp =>
      'The server only restarts while no users are active.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'After a system event ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Needs Emby Premiere after a 14-day free trial';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby backs up through its Backup & Restore plugin.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'The Backup & Restore plugin isn\'t installed. Install it from the plugin catalog to back up this server.';

  @override
  String get adminEmbyBackupNow => 'Back up now';

  @override
  String get adminEmbyFullBackup => 'Full backup';

  @override
  String get adminEmbyLightBackups => 'Database backups';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return 'Restore $name? It replaces this server\'s libraries, settings, users and passwords, and the server shuts down when it\'s done. You may need to start it again yourself.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Restore the server ID';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Turn this off when you restore the same backup onto more than one server.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'The restore is done and the server is shutting down. Start it again if it doesn\'t restart by itself.';

  @override
  String get adminHiddenRemotely =>
      'Hide from login screens when connected remotely';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Hide from login screens on devices they\'ve never signed in on';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Limits how many videos this user can play at once.';

  @override
  String get adminUnlimited => 'Unlimited';

  @override
  String get adminAutoRemoteQuality => 'Auto remote quality (Mbps)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Used remotely when the player is set to auto quality. Leave empty to detect it.';

  @override
  String get adminAllowCameraUpload => 'Allow camera upload';

  @override
  String get adminAllowSubtitleDownloading => 'Allow subtitle downloading';

  @override
  String get adminAllowMediaConversion => 'Allow media conversion';

  @override
  String get adminAllowSyncTranscoding =>
      'Allow downloads that need transcoding';

  @override
  String get adminAllowSharingPersonalItems =>
      'Allow sharing playlists with other users';

  @override
  String get adminAllowPreferenceAccess =>
      'Allow changing their own password and profile image';

  @override
  String get adminTagMode => 'Tag mode';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby Connect username or email';

  @override
  String get adminEmbyConnectHelp =>
      'Lets this user sign in from any Emby app without knowing the server address.';

  @override
  String get adminEmbyConnectLink => 'Link';

  @override
  String get adminEmbyConnectUnlink => 'Unlink';

  @override
  String get adminEmbyConnectLinked => 'Linked to Emby Connect';

  @override
  String get adminEmbyConnectPending =>
      'Invitation sent. The link is made once they accept it.';

  @override
  String get adminEmbyConnectUnlinked => 'Emby Connect link removed';

  @override
  String get adminEmbyConnectNotFound =>
      'No Emby Connect account has that username or email.';

  @override
  String get adminLibImportPlaylists => 'Import playlist files';

  @override
  String get adminLibExcludeFromSearch => 'Exclude from global search';

  @override
  String get adminLibForcedSubtitlesOnly => 'Download forced subtitles only';

  @override
  String get adminLibImportCollections =>
      'Import collections from metadata downloaders';

  @override
  String get adminLibThumbnailInterval => 'Preview thumbnail interval';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Every $count seconds';
  }

  @override
  String get adminLibThumbnailAtChapters => 'At chapter markers';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Save preview thumbnails into media folders';

  @override
  String get adminLibrarySectionMarkers => 'Intro markers';

  @override
  String get adminLibIntroDetection => 'Detect intros';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Detect intros during the library scan';

  @override
  String get adminProviderEmbyGuide => 'Emby Guide Data';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Select a lineup. If none are listed, check the postal code. Lineups need Emby Premiere.';

  @override
  String get adminLiveTvWakeServer => 'Wake the server for recordings';

  @override
  String get adminDrawerLiveTvChannels => 'Live TV Channels';

  @override
  String get adminPageDescLiveTvChannels =>
      'Turn channels on and off and set their order';

  @override
  String get adminLiveTvChannelsEmpty =>
      'No channels yet. They show up here once a tuner is set up and the server has imported its channels.';

  @override
  String get adminTranscodingHwaAdvanced => 'Advanced';

  @override
  String get adminTranscodingHwaHelp =>
      'Advanced lets you pick and order the hardware codecs.';

  @override
  String get adminTranscodingHwDecoders => 'Preferred hardware decoders';

  @override
  String get adminTranscodingHwEncoders => 'Preferred hardware encoders';

  @override
  String get adminTranscodingTempPathHelp =>
      'Where the transcoder keeps its working files. Leave it empty to use the server\'s data folder.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Slows transcoding down once enough is buffered, to lower CPU use.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Raises the volume when audio is downmixed. 1 keeps the original volume.';

  @override
  String get adminTranscodingFontExtraction =>
      'Allow font extraction on the fly';

  @override
  String get adminTranscodingMaxResolution => 'Max transcoding resolution';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'A limit on every transcode, whatever quality the app asks for.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tone mapping in software transcodes';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tone mapping in hardware transcodes';

  @override
  String get adminTranscodingToneMapHelp =>
      'Keeps HDR video from looking dim and washed out when it\'s transcoded.';

  @override
  String get adminNetworkingLocalAddress => 'Local IP address';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'The local address the server gives to apps. Leave it empty to detect it automatically.';

  @override
  String get adminNetworkingBehindProxy =>
      'HTTPS is handled by a reverse proxy';

  @override
  String get adminNetworkingExternalDomain => 'External domain';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'A domain or dynamic DNS name for remote connections, without the protocol or port. A custom certificate needs it.';

  @override
  String get adminNetworkingUpnp => 'Enable automatic port mapping';

  @override
  String get adminNetworkingUpnpHelp =>
      'Tries to map the public port to the local port with UPnP. Some routers don\'t support it.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Read proxy headers for client addresses';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Uses headers like X-Forwarded-For to find each client\'s address. Only turn this on behind a reverse proxy.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Only when they hold remote addresses';

  @override
  String get adminNetworkingIpv4Only => 'Use IPv4 for outgoing requests';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'For when metadata providers and other services can\'t be reached over IPv6.';

  @override
  String get adminOnePerLine => 'One per line';

  @override
  String get adminStreamingStreamLimit => 'Max simultaneous video streams';

  @override
  String get adminStreamingStreamLimitHelp =>
      'How many videos can play at once across the server. 0 means no limit.';

  @override
  String get adminSyncJobsConversions => 'Conversion jobs';

  @override
  String get adminSyncJobsDownloads => 'Download jobs';

  @override
  String get adminSyncJobsEmpty => 'No jobs';

  @override
  String get adminSyncJobCancel => 'Cancel job';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return 'Cancel $name and remove it from the list?';
  }

  @override
  String get adminSyncJobConverting => 'Converting';

  @override
  String get adminSyncJobReady => 'Ready to transfer';

  @override
  String get adminSyncJobTransferring => 'Transferring';

  @override
  String get adminSyncJobCompletedWithError => 'Completed with errors';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Database';

  @override
  String get adminPageDescDatabase => 'Cache size and upkeep';

  @override
  String get adminDatabaseWarning =>
      'These are advanced options. Leave them at their defaults unless you have a reason to change them.';

  @override
  String get adminDatabaseCacheSize => 'Database cache size (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'How much of each database file the server keeps in memory. More can make the server faster. Takes effect after a restart.';

  @override
  String get adminDatabaseOptimize =>
      'Optimize the database when the server shuts down';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Usually this does nothing, but now and then it runs an analysis that helps the server\'s queries. Shutdowns can take longer.';

  @override
  String get adminDatabaseAnalysisLimit => 'Analysis row limit';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'About how many rows of each index the optimize step reads. More rows work better but can slow shutdowns.';

  @override
  String get adminDatabaseVacuum => 'Vacuum the database on the next startup';

  @override
  String get adminDatabaseVacuumHelp =>
      'Rebuilds the database file so it takes up the least space, which can help performance. The server can\'t be used while it runs and shows no progress, so don\'t force it closed. It turns itself back off after that startup.';

  @override
  String get adminDrawerCinemaIntros => 'Cinema Intros';

  @override
  String get adminPageDescCinemaIntros => 'Trailers and intros before playback';

  @override
  String get adminCinemaIntrosPlayBefore => 'Play intros before';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Include trailers from new and upcoming movies';

  @override
  String get adminCinemaIntrosOlder => 'Include trailers from older movies';

  @override
  String get adminCinemaIntrosLibrary =>
      'Include trailers from movies in my libraries';

  @override
  String get adminCinemaIntrosLibraryHelp => 'Needs local trailers set up.';

  @override
  String get adminCinemaIntrosCount => 'Number of trailers to play';

  @override
  String get adminCinemaIntrosParental => 'Smart parental control';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Only picks trailers rated the same as or lower than what\'s being watched.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Only play intros before unwatched content';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Only play trailers similar to what\'s being watched';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'Based on shared genres, tags, studios and so on.';

  @override
  String get adminCinemaIntrosCustom => 'Custom intros';

  @override
  String get adminCinemaIntrosCustomPath => 'Custom intros folder';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'A folder of videos. One is picked at random and plays after the trailers.';

  @override
  String get adminCinemaIntrosCodecPath => 'Codec intros folder';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'A folder of videos. One whose file name matches the video codec, audio codec, audio profile or a tag plays before the main feature.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To and the DLNA server';

  @override
  String get adminDlnaPlayTo => 'Enable DLNA Play To';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby can find devices on your network and control them remotely.';

  @override
  String get adminDlnaServer => 'Enable the DLNA server';

  @override
  String get adminDlnaServerHelp =>
      'Lets the server stream media to DLNA devices.';

  @override
  String get adminDlnaDefaultUser => 'Default user';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Whose libraries connected devices see. A device profile can override it.';

  @override
  String get adminDlnaDebugLog => 'Enable DLNA debug logging';

  @override
  String get adminDlnaDebugLogHelp =>
      'Makes large log files. Only turn it on while troubleshooting.';

  @override
  String get adminDrawerCameraUpload => 'Camera Upload';

  @override
  String get adminPageDescCameraUpload => 'Where photos from phones are saved';

  @override
  String get adminCameraUploadPath => 'Camera upload folder';

  @override
  String get adminCameraUploadPathHelp =>
      'Leave it blank to use the default folder. A custom folder also has to be added as a library.';

  @override
  String get adminCameraUploadSubfolders => 'Make a subfolder for each device';

  @override
  String get adminDrawerConversions => 'Conversions';

  @override
  String get adminPageDescConversions => 'Converted media and downloads';

  @override
  String get adminConversionsTempPath => 'Temporary file folder';

  @override
  String get adminConversionsTempPathHelp =>
      'Where media is kept while it\'s being converted.';

  @override
  String get adminConversionsFullSpeed => 'Convert at full speed';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Conversions run slowly by default to keep the load down.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'License status and key';

  @override
  String get adminPremiereActive => 'Premiere is active on this server.';

  @override
  String get adminPremiereInactive => 'This server has no Premiere key.';

  @override
  String get adminPremiereKeyInvalid =>
      'A key is set but isn\'t active. It may be mistyped or expired.';

  @override
  String get adminPremiereCurrentKey => 'Current key';

  @override
  String get adminPremiereNewKey => 'New key';

  @override
  String get adminPremiereNewKeyHint =>
      'Paste the key from your Emby Premiere email.';

  @override
  String get adminPremiereSaveKey => 'Save key';

  @override
  String get adminPremiereRemoveKey => 'Remove key';

  @override
  String get adminPremiereKeyRejected =>
      'Emby saved the key but didn\'t accept it.';

  @override
  String get adminPremiereLoadFailed => 'Couldn\'t load the Premiere status';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere required';

  @override
  String get embyPremiereRequiredBody =>
      'This needs an active Emby Premiere subscription on the server.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'This needs an active Emby Premiere subscription. Emby keeps the setting but won\'t use it until Premiere is active.';

  @override
  String get embyPremiereLearnMore => 'Learn more';

  @override
  String get embyPremiereSaveAnyway => 'Save anyway';

  @override
  String get embyPremiereEnterKey => 'Enter key';

  @override
  String get adminPremiereNote =>
      'Needs Emby Premiere. The server keeps this setting but won\'t use it until Premiere is active.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name Id';
  }

  @override
  String get adminExternalIdTypePerson => 'Person';

  @override
  String get adminExternalIdTypeArtist => 'Artist';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Album Artist';

  @override
  String get adminExternalIdTypeOtherArtist => 'Other Artist';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Release Group';

  @override
  String get adminExternalIdTypeBook => 'Book';

  @override
  String get adminPlaybackHwAccelWarning =>
      'Hardware acceleration can be unstable on some systems. Keep the operating system and video drivers up to date, and set this back to None if video stops playing.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Changes to metadata settings apply to new content. To update existing content, refresh it from its detail page or refresh the library.';

  @override
  String get adminLibFetcherSettings => 'Fetcher settings';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Image options for $type';
  }

  @override
  String get adminLibFetchImages => 'Fetch images';

  @override
  String get adminLibMaxBackdrops => 'Maximum number of backdrops per item';

  @override
  String get adminLibMinBackdropWidth => 'Minimum backdrop download width';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Box';

  @override
  String get adminImageTypeBoxRear => 'Box (back)';

  @override
  String get adminImageTypeDisc => 'Disc';

  @override
  String get adminImageTypeMenu => 'Menu';

  @override
  String get adminActivityMediaDetails => 'Media details';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'e.g. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Original language';

  @override
  String get adminMetadataFieldDateAdded => 'Date added';

  @override
  String get adminMetadataFieldArtists => 'Artists';

  @override
  String get adminMetadataFieldAlbumArtists => 'Album artists';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Series name';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Episode number';

  @override
  String get adminMetadataFieldSeasonNumber => 'Season number';

  @override
  String get adminMetadataFieldTrackNumber => 'Track number';

  @override
  String get adminMetadataFieldDiscNumber => 'Disc number';

  @override
  String get adminMetadataFieldAirTime => 'Air time';

  @override
  String get adminMetadataFieldRuntime => 'Runtime in minutes';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Place of birth';

  @override
  String get adminMetadataFieldBirthDate => 'Birth date';

  @override
  String get adminMetadataFieldBirthYear => 'Birth year';

  @override
  String get adminMetadataFieldDeathDate => 'Death date';

  @override
  String get adminMetadataFieldAspectRatio => 'Original aspect ratio';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Airs before season';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Airs after season';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Airs before episode';

  @override
  String get adminMetadataNamesHelp =>
      'Separate several names with a semicolon.';

  @override
  String get adminMetadataSectionRatings => 'Ratings';

  @override
  String get adminMetadataItemLocked =>
      'This item\'s metadata is locked. Unlock it before you identify it.';

  @override
  String get adminMetadataNameOrIdRequired => 'Enter a name or an external ID.';

  @override
  String get adminLibMetadataReaders => 'Metadata readers';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Similar item providers: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Media segment providers';

  @override
  String get adminLibEnableLibrary => 'Enable the library';

  @override
  String get adminLibEnableLibraryHelp =>
      'Disabling the library hides it from all user views.';

  @override
  String get adminLibSaveLyricsWithMedia => 'Save lyrics into media folders';

  @override
  String get adminLibUseCustomTagDelimiters => 'Use custom tag delimiter';

  @override
  String get adminLibCustomTagDelimiters => 'Custom tag delimiter';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Characters to treat as delimiters that separate tags.';

  @override
  String get adminLibDelimiterWhitelist => 'Delimiter whitelist';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Items to leave out of tag splitting, one per line.';

  @override
  String get adminLibDownloadLanguages => 'Download languages';

  @override
  String get adminLibraryFolderRequired =>
      'Add at least one folder to this library.';

  @override
  String get adminRenameLibraryWarning =>
      'Renaming a library loses all of its metadata. Proceed with caution.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Remove the library \"$name\"? Files on disk are not deleted.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'These media locations will be removed from the library:';

  @override
  String get adminRefreshMode => 'Refresh mode';

  @override
  String get adminRefreshModeScan => 'Scan for new and updated files';

  @override
  String get adminRefreshModeMissing => 'Search for missing metadata';

  @override
  String get adminReplaceTrickplayImages => 'Replace existing trickplay images';

  @override
  String get adminRefreshDialogHelp =>
      'Metadata is refreshed based on the settings and internet services enabled in the dashboard.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown of $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuners and guide';

  @override
  String get adminLiveTvTabRecordings => 'Recordings';

  @override
  String get adminLiveTvAddTuner => 'Add tuner device';

  @override
  String get adminLiveTvEditTuner => 'Edit tuner device';

  @override
  String get adminLiveTvTunerType => 'Tuner type';

  @override
  String get adminLiveTvDetectDevices => 'Detect my devices';

  @override
  String get adminLiveTvNoNewDevices => 'No new devices found';

  @override
  String get adminLiveTvDrmNote => 'Channels with DRM will not be imported.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner saved';

  @override
  String get adminLiveTvDeleteTuner => 'Delete tuner device';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Are you sure you want to delete this tuner device?';

  @override
  String get adminLiveTvDeleteProvider => 'Delete guide provider';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Are you sure you want to delete this guide provider?';

  @override
  String get adminLiveTvProviderSaved => 'Guide provider saved';

  @override
  String get adminLiveTvAddProvider => 'Add provider';

  @override
  String get adminLiveTvRefreshGuide => 'Refresh guide data';

  @override
  String get adminLiveTvMapChannels => 'Map channels';

  @override
  String get adminLiveTvNoTunerChannels => 'No tuner channels found';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'A path or URL to an XMLTV file. The server reads it and checks it for updates. You are responsible for creating and updating the file.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Create an account at $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Sign in';

  @override
  String get adminLiveTvSdLineup => 'Lineup';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Select a lineup. If none are listed, check your username, password and postal code.';

  @override
  String get adminLiveTvGuideDays => 'Number of days of guide data to download';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'More days let you schedule further ahead and see more listings, but the download takes longer. Automatic picks a value from the number of channels.';

  @override
  String get adminLiveTvRecordingPath => 'Default recording path';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Where recordings are saved. If empty, the server\'s program data folder is used.';

  @override
  String get adminLiveTvStartWhenPossible => 'Start when possible';

  @override
  String get adminLiveTvStopWhenPossible => 'Stop when possible';

  @override
  String get adminLiveTvMinutesBefore => 'minutes before';

  @override
  String get adminLiveTvMinutesAfter => 'minutes after';

  @override
  String get adminLiveTvSectionGuide => 'Guide data';

  @override
  String get adminLiveTvSectionDefaultRecording => 'Default recording settings';

  @override
  String get adminLiveTvSectionMetadata => 'Recording metadata';

  @override
  String adminUserLastActivity(String time) {
    return 'Last activity $time';
  }

  @override
  String get adminCurrentPassword => 'Current password';

  @override
  String get adminChannelAccess => 'Channel access';

  @override
  String get adminDeviceAccess => 'Device access';

  @override
  String get adminDeleteFromAllLibraries => 'All libraries';

  @override
  String get adminUserDisabledBanner =>
      'This user is disabled. Turn off Disabled under Permissions to let them sign in again.';

  @override
  String get adminNewPasswordEmpty => 'New password cannot be empty';

  @override
  String get adminScheduleStartBeforeEnd =>
      'The start time must be before the end time';

  @override
  String get adminDashboardAlerts => 'Alerts';

  @override
  String get adminSessionGoHome => 'Go to home screen';

  @override
  String get adminPlayMethodRemux => 'Remuxing';

  @override
  String get adminPlayMethodDirectStream => 'Direct streaming';

  @override
  String get adminPlayMethodDirectPlay => 'Direct playing';

  @override
  String get adminLogLevelTrace => 'Trace';

  @override
  String get adminLogLevelDebug => 'Debug';

  @override
  String get adminLogLevelInformation => 'Information';

  @override
  String get adminLogLevelWarning => 'Warning';

  @override
  String get adminLogLevelError => 'Error';

  @override
  String get adminLogLevelCritical => 'Critical';

  @override
  String get adminLogLevelNone => 'None';

  @override
  String get adminActivityAllUsers => 'All users';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Last ran $time, taking $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Failed';

  @override
  String get adminTaskResultCancelled => 'Cancelled';

  @override
  String get adminTaskResultAborted => 'Aborted by server shutdown';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '${seconds}s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Delete task trigger';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Are you sure you want to delete this task trigger?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Every $minutes minutes';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Every $hours hours';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes minutes';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours hours';
  }

  @override
  String get adminTimeLimitHours => 'Time limit (hours)';

  @override
  String get adminTranscodingDecodingFor => 'Enable hardware decoding for';

  @override
  String get adminTranscodingThreadCountHelp =>
      'The most threads a transcode can use. Fewer threads lower CPU use but may be too slow for smooth playback.';

  @override
  String get adminTranscodingThreadMax => 'Max';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg path';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'The FFmpeg the server runs. It is set on the server, not here.';

  @override
  String get adminTranscodingAudioSeek => 'Audio seek strategy';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'How the server handles audio when you seek in an HLS stream.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Trim copied audio';

  @override
  String get adminTranscodingTranscodeAudio => 'Transcode audio';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Minimum audiobook resume (minutes)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Audiobooks stopped before this time count as unplayed.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Audiobook remaining minutes to resume';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Audiobooks stopped with less than this many minutes left count as played.';

  @override
  String get adminBrandingSplashSection => 'Splash screen';

  @override
  String get adminBrandingSectionWebClient => 'Web client';

  @override
  String get adminBrandingSplashSizeHint =>
      'Custom images should be in a 16x9 aspect ratio at a minimum size of 1920x1080.';

  @override
  String get adminNetworkingSectionServerAddress => 'Server address settings';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS settings';

  @override
  String get adminNetworkingSectionRemoteAccess => 'Remote access settings';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP protocols';

  @override
  String get adminNetworkingSectionDiscovery => 'Network discovery';

  @override
  String get adminNetworkingSectionFirewall => 'Firewall and proxy settings';

  @override
  String get adminNetworkingLocalHttpPort => 'Local HTTP port number';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'The TCP port number for the HTTP server.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Listen on the HTTPS port. A valid certificate must also be set for this to take effect.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Local HTTPS port number';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'The TCP port number for the HTTPS server.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Adds a subdirectory to the server URL, for example https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress => 'Bind to local network address';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Overrides the local IP address of the HTTP server. Leave it empty to bind to all addresses. A change needs a restart.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'IP addresses or IP/netmask entries of networks treated as local for bandwidth and remote access limits. Leave it empty to treat all RFC1918 addresses as local.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'IP addresses or host names of the proxies in front of this server. Needed to read X-Forwarded-For headers. A change needs a restart.';

  @override
  String get adminNetworkingCustomCertPath => 'Custom SSL certificate path';

  @override
  String get adminNetworkingCertPathHelp =>
      'Path to a PKCS #12 file with a certificate and private key, for TLS on a custom domain.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Enter the password if your certificate needs one.';

  @override
  String get adminNetworkingAllowRemote =>
      'Allow remote connections to this server';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'When off, all remote connections are blocked.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'IP addresses or IP/netmask entries of remote networks. Leave it empty to allow every remote address.';

  @override
  String get adminNetworkingRemoteIpFilterMode =>
      'Remote IP address filter mode';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'The public port mapped to the local HTTP port.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'The public port mapped to the local HTTPS port.';

  @override
  String get adminNetworkingAutoDiscoveryLabel => 'Enable auto discovery';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Lets apps find this server on UDP port 7359.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Use the same published server URI for internal and external access';

  @override
  String get adminNetworkingPublishedUri => 'Published server URI';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Overrides the URI the server gives out, based on the interface or the client IP address.';

  @override
  String get adminNetworkingInternalUri => 'Internal URI';

  @override
  String get adminNetworkingInternalUriHelp =>
      'Published server URI for internal access.';

  @override
  String get adminNetworkingExternalUri => 'External URI';

  @override
  String get adminNetworkingExternalUriHelp =>
      'Published server URI for external access.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Other published URIs';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URIs for one subnet or interface, written as subnet=URI.';

  @override
  String get adminBackupsHelp =>
      'Create and restore snapshots of your server. They can include the database, metadata, subtitles and trickplay images.';

  @override
  String get adminBackupDisclaimer =>
      'Depending on the size of your library, the backup can take a while.';

  @override
  String get adminBackupTasksWarningTitle => 'Scheduled tasks are running';

  @override
  String get adminBackupTasksWarning =>
      'Stop these tasks or wait for them to finish before you create a backup.';

  @override
  String get adminBackupArchiveNotFound =>
      'The server could not find this backup archive.';

  @override
  String get adminRestoreInProgress => 'Restore in progress';

  @override
  String get adminRestoreWaitingForServer =>
      'Waiting for the server to come back.';

  @override
  String get adminRestoreSucceeded => 'Restore completed';

  @override
  String get adminLogWatch => 'Watch';

  @override
  String get adminLogStopWatching => 'Stop watching';

  @override
  String get adminPluginInstallConfirmTitle => 'Confirm plugin installation';

  @override
  String get adminPluginInstallDisclaimer =>
      'Installing a third party plugin carries risks. It may contain unstable or malicious code, and it can change at any time. Only install plugins from authors you trust, and know what they can do, such as query outside services, slow down library scans or add background work.';

  @override
  String get adminGroupOverview => 'Overview';

  @override
  String get adminGroupLibrary => 'Library';

  @override
  String get adminGroupPlayback => 'Playback';

  @override
  String get adminGroupPeople => 'People';

  @override
  String get adminGroupSystem => 'System';

  @override
  String get adminAreasLabel => 'Admin areas';

  @override
  String get adminPagesLabel => 'Pages';

  @override
  String get adminPageDescDashboard =>
      'Server health, sessions and recent activity';

  @override
  String get adminPageDescAnalytics => 'Library sizes, codecs and formats';

  @override
  String get adminPageDescActivity => 'Everything that happened on the server';

  @override
  String get adminPageDescTasks => 'Scans, cleanups and their triggers';

  @override
  String get adminPageDescLibraries =>
      'Folders, scanners and metadata fetchers';

  @override
  String get adminPageDescDisplay => 'How libraries show to users';

  @override
  String get adminPageDescMetadata => 'Default language, country and images';

  @override
  String get adminPageDescNfo => 'Kodi NFO reading and saving';

  @override
  String get adminPageDescLiveTv => 'Tuners, guide data and recordings';

  @override
  String get adminPageDescTranscoding =>
      'Hardware acceleration, encoders, tone mapping';

  @override
  String get adminPageDescResume => 'When items count as started or played';

  @override
  String get adminPageDescStreaming => 'Remote bitrate limit';

  @override
  String get adminPageDescTrickplay => 'Seek preview thumbnails';

  @override
  String get adminPageDescUsers => 'Accounts, access and parental control';

  @override
  String get adminPageDescDevices => 'Signed in devices and their names';

  @override
  String get adminPageDescApiKeys => 'Keys for apps and scripts';

  @override
  String get adminPageDescSettings =>
      'Server name, language, paths, performance';

  @override
  String get adminPageDescBranding =>
      'Login message, custom CSS, splash screen';

  @override
  String get adminPageDescNetworking => 'Ports, HTTPS, LAN and remote access';

  @override
  String get adminPageDescPlugins => 'Installed plugins and the catalog';

  @override
  String get adminPageDescRepositories => 'Where plugins come from';

  @override
  String get adminPageDescBackups => 'Create and restore server backups';

  @override
  String get adminPageDescLogs => 'Server log files';

  @override
  String adminSearchSettingsHint(int count) {
    return 'Search $count settings';
  }

  @override
  String get adminSearchNoResults => 'No settings match';

  @override
  String get adminSearchClear => 'Clear search';

  @override
  String get adminUnsavedChanges => 'Unsaved changes';

  @override
  String get adminDiscard => 'Discard';

  @override
  String get adminLeaveTitle => 'Discard unsaved changes?';

  @override
  String get adminLeaveMessage =>
      'The changes on this page haven\'t been saved yet.';

  @override
  String get adminKeepEditing => 'Keep editing';

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
  String get sessionForward => 'İleri sar';

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
  String get volume => 'Ses düzeyi';

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
  String get adminClearDates => 'Tarihleri temizle';

  @override
  String get adminActivitySeverityAll => 'Tüm Dereceler';

  @override
  String get adminActivityDateRange => 'Zaman Aralığı';

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
  String adminRemoveDeviceConfirm(String name) {
    return '\"$name\" cihazı kaldırılsın mı? Kullanıcının bu cihazda yeniden oturum açması gerekecek.';
  }

  @override
  String get adminDeleteAllDevices => 'Tüm cihazları sil';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count cihaz kaldırılsın mı? Etkilenen kullanıcıların tekrar oturum açması gerekecektir. Mevcut cihazınız bu durumdan etkilenmez.';
  }

  @override
  String get adminDevicesDeletedAll => 'Cihazlar silindi';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Bazı cihazlar kaldırıldı; $count cihaz kaldırılamadı.';
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
  String get adminLibraryLoadFailed => 'Kitaplık yüklenemedi';

  @override
  String get adminNoMediaPaths => 'Hiçbir medya yolu yapılandırılmadı';

  @override
  String get adminAddPath => 'Yol Ekle';

  @override
  String get adminBrowseFilesystem => 'Sunucu dosya sistemine göz atın:';

  @override
  String get adminPreferredMetadataLanguage => 'Tercih edilen meta veri dili';

  @override
  String get adminMetadataLanguageHint => 'Örn. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Meta veri ülke kodu';

  @override
  String get adminMetadataCountryHint => 'Örn. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Yollar';

  @override
  String get adminLibraryTabOptions => 'Seçenekler';

  @override
  String get adminLibraryTabDownloaders => 'İndiriciler';

  @override
  String get adminLibMetadataSavers => 'Meta Veri Kaydediciler';

  @override
  String get adminLibSubtitleDownloaders => 'Altyazı indiriciler';

  @override
  String get adminLibLyricDownloaders => 'Şarkı sözü indiriciler';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Meta Veri İndiriciler: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Görsel İndiriciler: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Bu sunucu, bu kütüphane türü için hiçbir indirici sunmuyor.';

  @override
  String get adminLibrarySectionGeneral => 'Genel';

  @override
  String get adminLibrarySectionMetadata => 'Meta Veri';

  @override
  String get adminLibrarySectionEmbedded => 'Gömülü bilgi';

  @override
  String get adminLibrarySectionSubtitles => 'Altyazılar';

  @override
  String get adminLibrarySectionImages => 'Görseller';

  @override
  String get adminLibrarySectionSeries => 'Diziler';

  @override
  String get adminLibrarySectionMusic => 'Müzik';

  @override
  String get adminLibrarySectionMovies => 'Filmler';

  @override
  String get adminLibRealtimeMonitor => 'Gerçek zamanlı izlemeyi etkinleştir';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Dosya değişikliklerini algıla ve otomatik olarak işle.';

  @override
  String get adminLibEnablePhotos => 'Görselleri görüntüle';

  @override
  String get adminLibSaveLocalMetadata =>
      'Görselleri medya klasörlerine kaydet';

  @override
  String get adminLibRefreshInterval => 'Otomatik Meta Veri Yenileme';

  @override
  String get adminLibRefreshNever => 'Asla';

  @override
  String get adminLibDefault => 'Varsayılan';

  @override
  String get adminLibDisplayTitle => 'Görünüm';

  @override
  String get adminLibDisplaySection => 'Kütüphane görünümü';

  @override
  String get adminLibFolderView =>
      'Medya klasörlerini olduğu gibi görmek için bir klasör görünümü görüntüle';

  @override
  String get adminLibSpecialsInSeasons =>
      'Özel bölümleri yayınlandıkları sezonların içinde göster';

  @override
  String get adminLibGroupMovies => 'Filmleri koleksiyonlar halinde grupla';

  @override
  String get adminLibGroupShows => 'Dizileri koleksiyonlar halinde grupla';

  @override
  String get adminLibExternalSuggestions =>
      'Önerilerde harici içerikleri göster';

  @override
  String get adminLibDateAddedSection => 'Eklenme Tarihi Davranışı';

  @override
  String get adminLibDateAddedLabel => 'Eklenme tarihini şuradan al';

  @override
  String get adminLibDateAddedImport => 'Kütüphaneye taranma tarihi';

  @override
  String get adminLibDateAddedFile => 'Dosyanın oluşturulma tarihi';

  @override
  String get adminLibMetadataTitle => 'Meta Veri ve Görseller';

  @override
  String get adminLibMetadataLangSection => 'Tercih edilen meta veri dili';

  @override
  String get adminLibChaptersSection => 'Bölümler';

  @override
  String get adminLibDummyChapterDuration => 'Yapay bölüm süresi (saniye)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Bölüm bilgisi olmayan medyalar için oluşturulacak bölümlerin süresi. Devre dışı bırakmak için 0 olarak ayarlayın.';

  @override
  String get adminLibChapterImageResolution => 'Bölüm görsel çözünürlüğü';

  @override
  String get adminLibNfoTitle => 'NFO Ayarları';

  @override
  String get adminLibNfoHelp =>
      'NFO meta verileri Kodi ve benzeri istemcilerle uyumludur. Ayarlar, NFO meta verilerini kaydeden tüm kütüphaneler için geçerlidir.';

  @override
  String get adminLibKodiUser =>
      'İzlenme verileri NFO dosyalarına kaydedilecek kullanıcı';

  @override
  String get adminLibSaveImagePaths =>
      'Görsel yollarını NFO dosyalarının içine kaydet';

  @override
  String get adminLibPathSubstitution =>
      'NFO görsel yolları için yol değiştirmeyi etkinleştir';

  @override
  String get adminLibExtraThumbs =>
      'Extrafanart görsellerini bir extrathumbs klasörüne kopyala';

  @override
  String get adminLibNone => 'Hiçbiri';

  @override
  String adminLibRefreshDays(int days) {
    return '$days gün';
  }

  @override
  String get adminLibEmbeddedTitles => 'Gömülü başlıkları kullan';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Ekstralar için gömülü başlıkları kullan';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Gömülü bölüm bilgilerini kullan';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Gömülü altyazılara izin ver';

  @override
  String get adminLibEmbeddedAllowAll => 'Tümüne izin ver';

  @override
  String get adminLibEmbeddedAllowText => 'Sadece yazı';

  @override
  String get adminLibEmbeddedAllowImage => 'Sadece görsel';

  @override
  String get adminLibEmbeddedAllowNone => 'Hiçbiri';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Gömülü altyazı varsa indirmeyi atla';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ses izi indirme diliyle eşleşiyorsa indirmeyi atla';

  @override
  String get adminLibRequirePerfectMatch =>
      'Birebir altyazı eşleşmesi zorunlu olsun';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Altyazıları medya klasörlerine kaydet';

  @override
  String get adminLibChapterImageExtraction => 'Bölüm görsellerini ayıkla';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Kütüphane taraması sırasında bölüm görsellerini ayıkla';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay görsel ayıklamayı etkinleştir';

  @override
  String get adminLibTrickplayDuringScan =>
      'Kütüphane taraması sırasında trickplay görsellerini ayıkla';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay görsellerini medya klasörlerine kaydet';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Birden fazla klasöre dağılmış dizileri otomatik olarak birleştir';

  @override
  String get adminLibSeasonZeroName => '0. Sezon görünen adı';

  @override
  String get adminLibLufsScan =>
      'Ses normalleştirme için LUFS taramasını etkinleştir';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Standart dışı sanatçı etiketlerini tercih et';

  @override
  String get adminLibAutoAddToCollection =>
      'Filmleri koleksiyonlara otomatik olarak ekle';

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
  String adminSaveFailed(String error) {
    return 'Kaydedilemedi: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Şifreler eşleşmiyor';

  @override
  String adminFailed(String error) {
    return 'Başarısız oldu: $error';
  }

  @override
  String get adminUserLoadFailed => 'Kullanıcı yüklenemedi';

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
  String get adminEnableAllLibraryAccess =>
      'Tüm kitaplıklara erişimi etkinleştir';

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
  String get adminEnableAllDevices => 'Tüm cihazlara erişimi etkinleştirin';

  @override
  String get adminEnableAllChannels => 'Tüm kanallara erişimi etkinleştir';

  @override
  String get adminParentalControl => 'Ebeveyn Kontrolü';

  @override
  String get adminMaxParentalRating =>
      'İzin verilen en yüksek ebeveyn derecelendirmesi';

  @override
  String get adminMaxParentalRatingHint =>
      'Bu derecelendirmenin üzerindeki içerikler bu kullanıcıdan gizlenecektir.';

  @override
  String get adminParentalRatingNone => 'Hiçbiri';

  @override
  String get adminBlockUnratedItems =>
      'Derecelendirme bilgisi olmayan veya tanınmayan içerikleri engelle';

  @override
  String get adminUnratedBook => 'Kitaplar';

  @override
  String get adminUnratedChannelContent => 'Kanallar';

  @override
  String get adminUnratedLiveTvChannel => 'Canlı TV';

  @override
  String get adminUnratedMovie => 'Filmler';

  @override
  String get adminUnratedMusic => 'Müzik';

  @override
  String get adminUnratedTrailer => 'Fragmanlar';

  @override
  String get adminUnratedSeries => 'Diziler';

  @override
  String get adminAccessSchedules => 'Erişim Programları';

  @override
  String get adminAccessSchedulesHint =>
      'Erişime yalnızca aşağıdaki programlanan saatlerde izin verilir. Herhangi bir program ayarlanmadığında erişim tüm gün serbesttir.';

  @override
  String get adminAddSchedule => 'Program Ekle';

  @override
  String get adminScheduleDay => 'Gün';

  @override
  String get adminScheduleStart => 'Başlangıç';

  @override
  String get adminScheduleEnd => 'Bitiş';

  @override
  String get adminDayEveryday => 'Her Gün';

  @override
  String get adminDayWeekday => 'Hafta içi';

  @override
  String get adminDayWeekend => 'Hafta Sonu';

  @override
  String get adminDaySunday => 'Pazar';

  @override
  String get adminDayMonday => 'Pazartesi';

  @override
  String get adminDayTuesday => 'Salı';

  @override
  String get adminDayWednesday => 'Çarşamba';

  @override
  String get adminDayThursday => 'Perşembe';

  @override
  String get adminDayFriday => 'Cuma';

  @override
  String get adminDaySaturday => 'Cumartesi';

  @override
  String get adminAllowedTags => 'Etiketlere izin ver';

  @override
  String get adminAllowedTagsHint =>
      'Yalnızca bu etiketlere sahip içerikler gösterilir. Tümüne izin vermek için boş bırakın.';

  @override
  String get adminBlockedTags => 'Engellenen Etiketler';

  @override
  String get adminBlockedTagsHint =>
      'Bu etiketlere sahip içerikler bu kullanıcıdan gizlenir.';

  @override
  String get adminAddTag => 'Etiket ekle';

  @override
  String get adminAuthProvider => 'Kimlik doğrulama sağlayıcısı';

  @override
  String get adminPasswordResetProvider => 'Parola sıfırlama sağlayıcısı';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Kilitlenme öncesi maksimum hatalı giriş denemesi';

  @override
  String get adminLoginAttemptsHint =>
      'Varsayılan değer için 0, kilitlenmeyi devre dışı bırakmak için -1 yazın.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay erişimi';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Grup oluşturulmasına ve katılımına izin ver';

  @override
  String get adminSyncPlayJoin => 'Gruplara katılmaya izin ver';

  @override
  String get adminSyncPlayNone => 'İzin yok';

  @override
  String get adminContentDeletionFolders =>
      'İçerik silme izni verilecek kaynaklar';

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
  String get adminBackupOptionsTitle => 'Yedek Oluştur';

  @override
  String get adminBackupDatabase => 'Veri tabanı';

  @override
  String get adminBackupDatabaseAlways => 'Her zaman dahil edilenler';

  @override
  String get adminBackupMetadata => 'Meta Veri';

  @override
  String get adminBackupSubtitles => 'Altyazılar';

  @override
  String get adminBackupTrickplay => 'Trickplay görselleri';

  @override
  String get adminCreatingBackup => 'Yedek oluşturuluyor…';

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
  String get adminRestoringBackup => 'Yedekleme geri yükleniyor…';

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
  String get adminNoLimit => 'Sınır yok';

  @override
  String adminHours(String hours) {
    return '$hours saat';
  }

  @override
  String get adminDayOfWeek => 'Haftanın günü';

  @override
  String get adminSearchPlugins => 'Eklentileri ara…';

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
    return '\"$name\", v$version sürümüne güncelleniyor…';
  }

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
  String get adminPlaybackLoadFailed => 'Oynatma ayarları yüklenemedi';

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
  String adminMetadataLoadFailed(String error) {
    return 'Meta veriler yüklenemedi: $error';
  }

  @override
  String get adminRefreshMetadata => 'Meta Verileri Yenile';

  @override
  String get recursive => 'Alt klasörlerle birlikte';

  @override
  String get adminReplaceAllMetadata => 'Tüm meta verileri değiştir';

  @override
  String get adminMetadataRefreshRequested => 'Meta veri yenileme istendi';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Meta veriler yenilenemedi: $error';
  }

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
  String get adminTunerTypeM3u => 'M3U Tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Dosya veya URL';

  @override
  String get adminTunerIpAddress => 'Tuner IP Adresi';

  @override
  String get adminTunerFriendlyName => 'Görünen Ad';

  @override
  String get adminTunerUserAgent => 'Kullanıcı Aracısı';

  @override
  String get adminTunerCount => 'Eşzamanlı Bağlantı Sınırı';

  @override
  String get adminTunerCountHelp =>
      'Alıcının aynı anda izin verdiği maksimum akış sayısı. Sınırsız yapmak için 0 olarak ayarlayın.';

  @override
  String get adminTunerFallbackBitrate => 'Yedek Maksimum Akış Hızı';

  @override
  String get adminTunerImportFavoritesOnly => 'Sadece favori kanalları aktar';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Donanım kod dönüştürmeye izin ver';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 kod dönüştürme taşıyıcısına izin ver';

  @override
  String get adminTunerAllowStreamSharing => 'Yayın paylaşımına izin ver';

  @override
  String get adminTunerEnableStreamLooping => 'Yayın döngüsünü etkinleştir';

  @override
  String get adminTunerIgnoreDts => 'DTS Ses Desteğini Yok Say';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Girdiyi yerel kare hızında oku';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Dosya veya URL';

  @override
  String get adminXmltvMoviePrefix => 'Film Ön Adı';

  @override
  String get adminXmltvMovieCategories => 'Film Kategorileri';

  @override
  String get adminXmltvCategoriesHelp =>
      'Birden çok kategoriyi dikey çizgi ile ayırın.';

  @override
  String get adminXmltvKidsCategories => 'Çocuk Kategorileri';

  @override
  String get adminXmltvNewsCategories => 'Haber Kategorileri';

  @override
  String get adminXmltvSportsCategories => 'Spor Kategorileri';

  @override
  String get adminSdUsername => 'Kullanıcı Adı';

  @override
  String get adminSdPassword => 'Şifre';

  @override
  String get adminSdCountry => 'Ülke';

  @override
  String get adminSdCountrySelect => 'Ülke Seç';

  @override
  String get adminSdPostalCode => 'Posta Kodu';

  @override
  String get adminEnableAllTuners => 'Tüm tunerleri aktif et';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Tuner kaldırılamadı: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Sağlayıcı kaldırılamadı: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Dizi kayıt yolu';

  @override
  String get adminMovieRecordingPath => 'Film kayıt yolu';

  @override
  String get adminGuideDaysAuto => 'Otomatik';

  @override
  String get adminRecordingPostProcessor => 'Son işleme uygulaması yolu';

  @override
  String get adminRecordingPostProcessorArgs => 'Son işleme argümanları';

  @override
  String get adminSaveRecordingNfo => 'Kayıt NFO meta verilerini kaydet';

  @override
  String get adminSaveRecordingImages => 'Kayıt görsellerini kaydet';

  @override
  String get adminLiveTvSectionPaths => 'Kayıt yolları';

  @override
  String get adminLiveTvSectionPostProcessing => 'Son işleme';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Ayarlar kaydedilemedi: $error';
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
  String get adminGuideRefreshStarted =>
      'Rehber verisi yenileme işlemi başladı';

  @override
  String get adminGuideRefreshUnavailable =>
      'Rehber yenileme görevi bu sunucuda mevcut değil.';

  @override
  String get adminNoListingProviders =>
      'Hiçbir listeleme sağlayıcısı yapılandırılmadı';

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
  String get adminBackupsTitle => 'Yedeklemeler';

  @override
  String get adminUnknownDate => 'Bilinmeyen tarih';

  @override
  String get adminUnnamedBackup => 'Adsız Yedekleme';

  @override
  String get adminApply => 'Uygula';

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
  String get adminMetadataIdentify => 'Tanımla';

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
  String get adminMetadataFieldCustomRating => 'Özel derecelendirme';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Genel Bakış';

  @override
  String get adminMetadataFieldDisplayOrder => 'Görüntüleme sırası';

  @override
  String get adminMetadataDisplayOrderAired => 'Yayın tarihi';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Orijinal yayın tarihi';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Mutlak Sıralama';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Dijital';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Hikaye Örgüsü';

  @override
  String get adminMetadataDisplayOrderProduction => 'Yapım Sırası';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternatif';

  @override
  String get adminMetadataDisplayOrderRegional => 'Bölgesel';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Alternatif DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Değiştirilme Tarihi';

  @override
  String get adminMetadataDisplayOrderSortName => 'Sıralama Adı';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Yayınlanma Tarihi';

  @override
  String get adminMetadataSettings => 'Metaveri Ayarları';

  @override
  String get adminMetadataDownloadLanguage => 'Tercih edilen indirme dili';

  @override
  String get adminMetadataCountryRegion => 'Ülke / Bölge';

  @override
  String get adminMetadataInheritHelp =>
      'Ayarı üst öğeden veya sunucu varsayılanından devralmak için bunu Varsayılan olarak bırakın.';

  @override
  String get adminMetadataField3DFormat => '3D format';

  @override
  String get adminMetadataPersonKindActor => 'Aktör';

  @override
  String get adminMetadataPersonKindDirector => 'Yönetmen';

  @override
  String get adminMetadataPersonKindComposer => 'Besteci';

  @override
  String get adminMetadataPersonKindWriter => 'Yazar';

  @override
  String get adminMetadataPersonKindGuestStar => 'Konuk Oyuncu';

  @override
  String get adminMetadataPersonKindProducer => 'Yapımcı';

  @override
  String get adminMetadataPersonKindConductor => 'Şef';

  @override
  String get adminMetadataPersonKindLyricist => 'Söz Yazarı';

  @override
  String get adminMetadataPersonKindArranger => 'Aranjör';

  @override
  String get adminMetadataPersonKindEngineer => 'Mühendis';

  @override
  String get adminMetadataPersonKindMixer => 'Miksaj';

  @override
  String get adminMetadataPersonKindRemixer => 'Remiks Yapan';

  @override
  String get adminMetadataPersonKindCreator => 'Yaratıcı';

  @override
  String get adminMetadataPersonKindArtist => 'Sanatçı';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Albüm Sanatçısı';

  @override
  String get adminMetadataPersonKindAuthor => 'Yazar';

  @override
  String get adminMetadataPersonKindIllustrator => 'Çizer';

  @override
  String get adminMetadataPersonKindPenciller => 'Kurşun Kalem Çizeri';

  @override
  String get adminMetadataPersonKindInker => 'Mürekkep Çizeri';

  @override
  String get adminMetadataPersonKindColorist => 'Renklendirici';

  @override
  String get adminMetadataPersonKindLetterer => 'Harf Dizgici';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Kapak Çizeri';

  @override
  String get adminMetadataPersonKindEditor => 'Editör';

  @override
  String get adminMetadataPersonKindTranslator => 'Çevirmen';

  @override
  String get adminMetadataPersonKindNarrator => 'Anlatıcı';

  @override
  String get adminMetadataAirDays => 'Yayın Günleri';

  @override
  String get adminMetadataLockItem =>
      'Gelecekteki üstveri değişikliklerini önlemek için bu öğeyi kilitle';

  @override
  String get adminMetadataEnabledFields => 'Etkin Alanlar';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Bir alanı kilitlemek ve verilerinin değiştirilmesini önlemek için tikini kaldırın.';

  @override
  String get adminMetadataLockFieldName => 'İsim';

  @override
  String get adminMetadataLockFieldOverview => 'Özet';

  @override
  String get adminMetadataLockFieldGenres => 'Türler';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Ebeveyn Derecelendirmesi';

  @override
  String get adminMetadataLockFieldCast => 'Kişiler';

  @override
  String get adminMetadataLockFieldProductionLocations => 'Çekim Yerleri';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Doğum Yeri';

  @override
  String get adminMetadataLockFieldRuntime => 'Süre';

  @override
  String get adminMetadataLockFieldStudios => 'Stüdyolar';

  @override
  String get adminMetadataLockFieldTags => 'Etiketler';

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
  String get adminPluginsRestartRequired => 'Yeniden başlatma gerekli';

  @override
  String get adminPluginsNoSearchResults => 'Aramanızla eşleşen eklenti yok';

  @override
  String get adminPluginsNoneInstalled => 'Hiçbir eklenti yüklü değil';

  @override
  String get adminPluginsNoneActive => 'Etkin eklenti yok';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Hiçbir eklenti sunucunun yeniden başlatılmasını gerektirmiyor';

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
    return '\"$name\" yükleniyor…';
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
  String get adminReposRemove => 'Kaldır';

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
  String get adminNetworkingEnableHttps => 'HTTPS\'yi etkinleştir';

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
  String get adminBrandingSplashUpload => 'Görsel Yükle';

  @override
  String get adminBrandingSplashUploaded => 'Açılış ekranı güncellendi';

  @override
  String get adminBrandingSplashUploadFailed => 'Açılış ekranı yüklenemedi';

  @override
  String get adminBrandingSplashDeleted => 'Açılış ekranı silindi';

  @override
  String get adminBrandingNoSplash => 'Özel açılış ekranı yok';

  @override
  String get adminPlaybackHwAccel => 'Donanım Hızlandırma';

  @override
  String get adminPlaybackHwAccelLabel => 'Donanım hızlandırma';

  @override
  String get adminPlaybackEnableHwEncoding => 'Donanım kodlamasını etkinleştir';

  @override
  String get adminPlaybackQsvDevice => 'QSV cihazı';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Gelişmiş NVDEC kod çözücüyü etkinleştir';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Sistemin yerel donanım kod çözücüsünü tercih et';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC kod çözme';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 kod çözme';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC RExt 8/10-bit kod çözme';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit kod çözme';

  @override
  String get adminPlaybackHwEncodingSection => 'Donanım kodlama';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC kodlamaya izin ver';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 kodlamaya izin ver';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel düşük güç tüketimli H.264 kodlayıcıyı etkinleştir';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel düşük güç tüketimli HEVC kodlayıcıyı etkinleştir';

  @override
  String get adminPlaybackToneMapping => 'Ton Eşleme';

  @override
  String get adminPlaybackEnableTonemapping => 'Ton eşlemeyi aktif et';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP ton eşlemeyi aktif et';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox ton eşlemeyi aktif et';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Ton Eşleme Algoritması';

  @override
  String get adminPlaybackTonemappingMode => 'Ton eşleme modu';

  @override
  String get adminPlaybackTonemappingRange => 'Ton eşleme aralığı';

  @override
  String get adminPlaybackTonemappingDesat => 'Ton eşleme doygunluk azaltma';

  @override
  String get adminPlaybackTonemappingPeak => 'Ton eşleme tepe değeri';

  @override
  String get adminPlaybackTonemappingParam => 'Ton eşleme parametresi';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP ton haritalama parlaklığı';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'VPP ton haritalama kontrastı';

  @override
  String get adminPlaybackEncoderPreset => 'Kodlama ön ayarı';

  @override
  String get adminPlaybackH264Crf => 'H.264 kodlama CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) kodlama CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Tarama giderme yöntemi';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Taramasızlaştırma yaparken kare hızını ikiye katla';

  @override
  String get adminPlaybackAudioSection => 'Ses';

  @override
  String get adminPlaybackEnableAudioVbr => 'Ses VBR kodlamasını etkinleştir';

  @override
  String get adminPlaybackDownmixBoost => 'Ses downmix artışı';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo downmix algoritması';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Maksimum muxing kuyruk boyutu';

  @override
  String get adminPlaybackAutoOption => 'Otomatik';

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
  String get adminTaskCancelling => 'İptal Ediliyor…';

  @override
  String get adminTaskRunning => 'Çalışıyor…';

  @override
  String get adminTaskNeverRun => 'Asla çalışma';

  @override
  String get adminTaskStop => 'Durdur';

  @override
  String get adminRunningTasks => 'Çalışan Görevler';

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
      'İleri sarma önizleme küçük resimleri için Trickplay görüntü oluşturmayı yapılandırın.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Genel HTTPS bağlantı noktası';

  @override
  String get adminNetworkingBaseUrl => 'Temel URL';

  @override
  String get adminNetworkingBaseUrlHint => 'Örn. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Genel HTTP bağlantı noktası';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS Gerekli';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Tüm uzak istekleri HTTPS\'e yönlendir. Sunucunun geçerli bir sertifikası yoksa hiçbir etkisi olmaz.';

  @override
  String get adminNetworkingCertPassword => 'Sertifika şifresi';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 Etkinleştir';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 Etkinleştir';

  @override
  String get adminNetworkingLocalSubnets => 'Yerel Ağlar';

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
  String get adminPlaybackThrottleDelay => 'Sınırlama gecikmesi (saniye)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Anında altyazı çıkarılmasına izin ver';

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
  String get adminGeneralEnableSlowResponse =>
      'Yavaş yanıt uyarılarını etkinleştir';

  @override
  String get adminGeneralQuickConnect => 'Hızlı Bağlantıyı Etkinleştir';

  @override
  String get adminGeneralSectionServer => 'Sunucu';

  @override
  String get adminGeneralSectionMetadata => 'Meta Veri';

  @override
  String get adminGeneralSectionPaths => 'Yollar';

  @override
  String get adminGeneralSectionPerformance => 'Performans';

  @override
  String get adminGeneralCachePath => 'Önbellek yolu';

  @override
  String get adminGeneralMetadataPath => 'Meta veri yolu';

  @override
  String get adminGeneralServerName => 'Sunucu adı';

  @override
  String get adminGeneralDisplayLanguage => 'Tercih edilen görünüm dili';

  @override
  String get adminSettingsLoadFailed => 'Ayarlar yüklenemedi';

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
  String get mediaBarLoading => 'Medya çubuğu yükleniyor…';

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
  String get offlineSavedMedia => 'İndirilenler';

  @override
  String get offlineBannerTitle => 'Çevrimdışısın';

  @override
  String get offlineBannerSubtitle => 'İndirdikleriniz gösteriliyor';

  @override
  String get serverUnreachableBannerTitle => 'Sunucuya erişilemiyor';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Bağlantı geri gelene kadar indirilenlerden oynatılıyor';

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
  String get kidsMode => 'Çocuk Modu';

  @override
  String get kidsModeSubtitle =>
      'Uygulamayı sadeleştir ve çıkışı PIN ile kilitle';

  @override
  String get kidsModeExit => 'Çocuk Modundan Çık';

  @override
  String get kidsModeExitSubtitle =>
      'Tam uygulamaya dönmek için PIN\'inizi girin';

  @override
  String get pinIncorrect => 'Yanlış PIN';

  @override
  String pinTryAgainIn(String wait) {
    return 'Çok fazla deneme. $wait sonra tekrar deneyin.';
  }

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
  String get trackActionViewDetails => 'View Details';

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
    return '$name indiriliyor…';
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
  String get stillWatchingStop => 'Durdur';

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
  String get playerTooltipPrevious => 'Önceki';

  @override
  String get playerTooltipSeekBack => 'Geri ara';

  @override
  String get playerTooltipSeekForward => 'İleriye doğru ara';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuHideFromContinueWatching =>
      'İzlemeye Devam Et\'ten Gizle';

  @override
  String get contextMenuHideFromNextUp => 'Sıradaki Bölümlerden Gizle';

  @override
  String get contextMenuAddToCollection => 'Koleksiyona ekle';

  @override
  String get contextMenuRemoveFromCollection => 'Koleksiyondan Sil';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return '$item öğesi $collection koleksiyonundan kaldırılsın mı? Öğe kütüphanenizde kalır.';
  }

  @override
  String get removeFromCollectionFailed => 'Koleksiyondan kaldırılamadı';

  @override
  String get settingsAdministrationSubtitle => 'Sunucu yönetim paneline erişin';

  @override
  String get settingsDynamicContent => 'Dinamik İçerik';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medya Çubuğu ve görsel katmanlar';

  @override
  String get settingsAboutSubtitle =>
      'Uygulama sürümü, yasal bilgiler ve krediler';

  @override
  String get settingsSortServersBy => 'Sunucuları Şuna Göre Sırala';

  @override
  String get settingsLastUsed => 'Son Kullanılan';

  @override
  String get settingsAlphabetical => 'Alfabetik';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Kendinden İmzalı Sertifikalara İzin Ver';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Kendinden imzalı veya özel CA (Sertifika Yetkilisi) TLS sertifikaları kullanan sunuculara güvenin. Bunu yalnızca kontrolünüz altındaki sunucular için etkinleştirin. Bu işlem, tüm bağlantılar için sertifika doğrulamasını devre dışı bırakır.';

  @override
  String get untrustedServerCertificate =>
      'This server\'s certificate isn\'t trusted. If it\'s your own server and uses a self-signed or private certificate, you can allow it here.';

  @override
  String get clientCertTitle => 'Client certificate';

  @override
  String clientCertHost(String host) {
    return 'Certificate for $host';
  }

  @override
  String get clientCertChooseFile => 'Choose file';

  @override
  String get clientCertPassword => 'Certificate password';

  @override
  String get clientCertStartUpload => 'Send from phone';

  @override
  String get clientCertUploadHint =>
      'Scan this code with your phone, or open the address in its browser, then pick the file and enter its password.';

  @override
  String get clientCertStopUpload => 'Stop waiting';

  @override
  String get clientCertNoFileData => 'Couldn\'t read the file. Try again.';

  @override
  String get clientCertPickFailed => 'Couldn\'t open the file picker.';

  @override
  String get clientCertUploadFailed =>
      'Couldn\'t start the upload page. Try again.';

  @override
  String get clientCertNoSecureStorage =>
      'This device has no secure storage, so the certificate can\'t be saved. On Linux, install libsecret and try again.';

  @override
  String get clientCertDecodeFailed =>
      'Couldn\'t read that file as a certificate. Make sure it\'s a .p12 or .pfx.';

  @override
  String get clientCertWrongPassword =>
      'That password doesn\'t unlock this certificate.';

  @override
  String get clientCertRequired =>
      'This server needs a client certificate (mTLS). Add one for this host to continue.';

  @override
  String clientCertExpired(String date) {
    return 'The certificate for this server expired on $date. Replace it to continue.';
  }

  @override
  String get clientCertAddButton => 'Add client certificate';

  @override
  String get settingsClientCertificates => 'Client certificates';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Certificates this app presents to servers that require one (mTLS)';

  @override
  String get clientCertSubject => 'Subject';

  @override
  String clientCertExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get clientCertReplace => 'Replace';

  @override
  String get clientCertAdd => 'Add certificate';

  @override
  String get clientCertAddHostPrompt =>
      'Which server host needs a certificate?';

  @override
  String get itemBlockedByParentalControls => 'Bu öğe mevcut değil';

  @override
  String get blockedRatingsCeilingHint =>
      'Bir derecelendirmeyi engellemek, ondan daha yüksek olanları da engeller.';

  @override
  String get blockedRatingsUnrankedSection => 'Sadece kendini engeller';

  @override
  String get settingsHomePage => 'Ana Sayfa';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Sunucuda Canlı TV kütüphanesi varsa gezinme çubuğunda Canlı TV düğmesini göster';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Gezinti çubuğunda kütüphaneler butonunu göster';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Gezinti çubuğunda Seerr butonunu göster';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Üst gezinti çubuğundaki metin etiketlerini her zaman göster';

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
  String get useNativeEmulator => 'Yerel Emülasyon';

  @override
  String get useNativeEmulatorSubtitle =>
      'Oyunları EmulatorJS web oynatıcısı yerine yerel çekirdeklerle oynayın';

  @override
  String get emulatorCores => 'Emülatör Çekirdekleri';

  @override
  String get emulatorCoresSubtitle =>
      'Oyunları yerel olarak oynamak için sistemleri indirin';

  @override
  String get emulatorCoresDescription =>
      'Yüklenecek sistemleri seçin. Çekirdekler Libretro projesi tarafından sağlanır ve oyunların bir tarayıcı görünümü yerine yerel olarak çalışmasını sağlar.';

  @override
  String get emulatorCoreDownloading => 'İndiriliyor';

  @override
  String get emulatorCoreUnavailable => 'Bu cihaz için kullanılabilir değil';

  @override
  String get emulatorCoreDownloadFailed =>
      'Çekirdek indirilemedi. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String emulatorCoreResetSettings(String system) {
    return '$system ayarlarını varsayılana sıfırla';
  }

  @override
  String get emulatorCoreSettingsReset => 'Ayarlar varsayılana sıfırlandı.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Ayarlar sıfırlanamadı. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get downloadedGames => 'İndirilen Oyunlar';

  @override
  String get downloadedGamesSubtitle =>
      'Oyun dosyaları tarafından kullanılan alanı boşaltın';

  @override
  String get downloadedGamesDescription =>
      'Oyunlar oynatılmadan önce bu cihaza kopyalanır. Alan boşaltmak için bitirdiğiniz oyunları kaldırın. Kayıt dosyaları sunucuda saklanır ve silinmez.';

  @override
  String get downloadedGamesEmpty => 'Bu cihaza henüz hiç oyun indirilmedi.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count oyun, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Hepsini Sil';

  @override
  String removeDownloadedGameConfirm(String title) {
    return '$title bu cihazdan kaldırılsın mı? Bir sonraki oynayışınızda tekrar indirilecektir.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'İndirilen tüm oyunlar bu cihazdan kaldırılsın mı? Bir sonraki oynayışınızda tekrar indirileceklerdir.';

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
  String get settingsBoth => 'İkisi birden';

  @override
  String get settingsShuffleContentTypeFilter =>
      'İçerik Türü Filtresini Karıştır';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Ses parçaları, işleme ve geçiş seçenekleri';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Otomatik oynatma ve sıralama';

  @override
  String get settingsSyncplaySubtitle =>
      'Grup oturumları için senkronizasyon mantığı';

  @override
  String get settingsSkipIntrosAndOutros => 'Giriş ve Jenerikleri atlansın mı?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Bölüm';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Medya Bölümü Geri Sayımı';

  @override
  String get settingsProgressBar => 'İlerleme Çubuğu';

  @override
  String get settingsTimer => 'Zamanlayıcı';

  @override
  String get settingsNone => 'Hiçbiri';

  @override
  String get settingsSkipButtonAutoHide => 'Atla Butonunu Otomatik Gizle';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'İntro ve jenerik atlama butonunu birkaç saniye sonra otomatik olarak gizle.';

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
      'Videonun ekrana nasıl ölçeklendirileceğini belirler. Sığdırarak Yakınlaştır, görüntüyü ekranı kaplayacak şekilde büyütür ve kenarlardan kırpar. Siyah şeritleri algılamaz.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Oynatma Motoru (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV cihazlarında varsayılan oynatma motorunu seçin. Değişiklikler bir sonraki oynatma oturumuna uygulanır.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (önerilir)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (eski)';

  @override
  String get settingsRedetectDisplay => 'Re-detect display';

  @override
  String get settingsRedetectDisplayDescription =>
      'Ask the TV again what HDR formats it supports. Use this if Dolby Vision or HDR10 titles are being transcoded after the TV or receiver was powered on late.';

  @override
  String get settingsDisplayIsSdr => 'My TV is not HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Stop advertising HDR support for this display. Use this only if detection keeps reporting HDR your TV can\'t actually show.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Display re-detected: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'No HDR formats detected';

  @override
  String get settingsDisplayMarkedSdr => 'Display saved as SDR';

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
  String get settingsAutoAftkrtEnabled => 'Otomatik';

  @override
  String get settingsEnabledOnThisDevice => 'Etkinleştirildi';

  @override
  String get settingsDisabledPreferTranscode => 'Devre dışı';

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
  String get settingsCinemaModeEpisodes => 'Bölümler için Sinema Modu';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Ayrıca TV bölümlerinden önce tanıtım videoları (ön gösterimler) oynat';

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
  String get settingsLiveTvDirect => 'Canlı TV Doğrudan Oynatma';

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
    return 'En Son Eklenen $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Yeni Çıkan $libraryName';
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
      'Harici Ses Efektlerine İzin Ver';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Ekolayzer ve efekt uygulamalarının (örn. Wavelet) Media3 oynatma oturumlarına bağlanmasına izin ver.';

  @override
  String get disableTunnelingTitle => 'Tünellemeyi devre dışı bırak';

  @override
  String get disableTunnelingSubtitle =>
      'Tünelsiz oynatmaya zorla. Tünelleme kaynaklı ses/video kopmaları yaşanan cihazlarda yararlıdır.';

  @override
  String get enableTunnelingTitle => 'Tünellemeyi Etkinleştir';

  @override
  String get enableTunnelingSubtitle =>
      'Gelişmiş. Sesi ve videoyu birbirine bağlı bir donanım yolu üzerinden iletir. Bazı cihazlarda ses/video kesintilerine neden olabileceği için varsayılan olarak kapalıdır.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision Profil 7\'yi Her Zaman HDR10 Olarak Oynat';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Profil 8 dönüşümünü atla ve Dolby Vision profil 7 akışlarını HDR10 uyumlu HEVC formatına indirge. Dönüştürülen akışlar hatalı görünüyorsa bunu kullanın.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Gömülü Altyazı Stillerini Kullan';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Altyazı parçasında gömülü olan renk, yazı tipi ve konumlandırmayı uygula. Kendi altyazı stili tercihlerinizi kullanmak için devre dışı bırakın.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Gömülü Altyazı Boyutlarını Kullan';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Altyazı parçasında gömülü olan yazı tipi boyutu ipuçlarını uygula. Kendi stili tercihlerinizdeki altyazı boyutunu kullanmak için devre dışı bırakın.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Medya Ayrıntılarını Göster';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Kütüphane sayfalarında, seçilen ögenin detaylarını üst kısımda göster.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get savedThemesTitle => 'Kayıtlı Temalar';

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
  String get rowsType => 'Satır Tipi';

  @override
  String get rowsTypeDescription =>
      'Klasik mod, satır başına görsel türünü ve bilgi katmanını korur. Modern mod ise dikey görsellerden yatay arka planlara uzanan satırlar kullanır.';

  @override
  String get modernCardsOnMyMediaRow => 'Modern cards on My Media row';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Display customizable posters that expand on focus. Disable to always show landscape thumbnail.';

  @override
  String get sortOrder => 'Sıralama Düzeni';

  @override
  String get ascending => 'Artan';

  @override
  String get descending => 'Azalan';

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
  String get favoritesRowSortOrderDescription =>
      'Favoriler satırlarını artan veya azalan sırada sıralayın.';

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
  String get collectionsRowSortOrderDescription =>
      'Koleksiyonlar satırlarını artan veya azalan sırada sıralayın.';

  @override
  String get collectionsRowShowEpisodes => 'Tekil Bölümleri Göster';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Her bölümü ayrı ayrı göstermek için dizileri genişlet.';

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
  String get genresRowSortOrderDescription =>
      'Türler satırlarını artan veya azalan sırada sıralayın.';

  @override
  String get genresRowItems => 'Türler Satırı Ögeleri';

  @override
  String get genresRowItemsDescription =>
      'Türler satırlarında Filmleri, Dizileri veya her ikisini birden göster.';

  @override
  String get displayStudiosRows => 'Stüdyo Satırını Göster';

  @override
  String get displayStudiosRowsSubtitle =>
      'Stüdyo satırını Ana Sayfa Bölümlerinde göster.';

  @override
  String get studiosRowSorting => 'Stüdyo Satırı Sıralaması';

  @override
  String get studiosRowSortingDescription =>
      'Stüdyo satırı isme göre, son eklenenlere göre ve daha fazlasına göre sıralanır.';

  @override
  String get studiosRowSortOrderDescription =>
      'Artan veya azalan sıralama düzenini seçin.';

  @override
  String get selectStudiosToInclude => 'Dahil Edilecek Stüdyoları Seçin';

  @override
  String get selectStudiosToIncludeDescription =>
      'Ana satıra hangi stüdyoların dahil edileceğini seçin.';

  @override
  String get selectAllStudios => 'Tümünü Seç';

  @override
  String get deselectAllStudios => 'Tümünün Seçimini Kaldır';

  @override
  String get tvStudiosFilter => 'TV Stüdyoları';

  @override
  String get movieStudiosFilter => 'Film Stüdyoları';

  @override
  String get selectedStudiosFilter => 'Seçilen Stüdyolar';

  @override
  String get unselectedStudiosFilter => 'Seçilmemiş Stüdyolar';

  @override
  String get filtersHeader => 'Filtreler';

  @override
  String get showHeader => 'Göster';

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
  String get playlistsRowSortOrderDescription =>
      'Oynatma listesi satırlarını artan veya azalan sırada sıralayın.';

  @override
  String get playlistsRowShowEpisodes => 'Tekil Bölümleri Göster';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Her bölümü ayrı ayrı göstermek için dizileri genişlet.';

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
  String get audioRowsSortOrderDescription =>
      'Ses satırlarını artan veya azalan sırada sıralayın.';

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
  String get audioPlaylists => 'Ses Oynatma Listeleri';

  @override
  String get appearance => 'Görünüm';

  @override
  String get layout => 'Düzen';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Klavye';

  @override
  String get navButtons => 'Butonlar';

  @override
  String get rendering => 'Render Etme';

  @override
  String get mpvConfiguration => 'MPV ayarı';

  @override
  String get cardSize => 'Kart Boyutu';

  @override
  String get externalPlayerApp => 'Harici Oynatıcı';

  @override
  String get externalPlayerAppDescription =>
      'Üzerine uzun basarak oynatma seçeneğini etkinleştirmek için harici oynatıcıyı ayarlayın';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Oynatma başladığında uygulama seçiciyi göster.';

  @override
  String get loadingInstalledPlayers => 'Yüklü oynatıcılar yükleniyor…';

  @override
  String get connection => 'Bağlantı';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Doğrudan Geçiş (Passthrough)';

  @override
  String get supportedOnThisDevice => 'Bu cihazda destekleniyor';

  @override
  String get notSupportedOnThisDevice => 'Bu cihazda desteklenmiyor';

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
  String get preferSoftwareDecoders => 'Yazılımsal Kod Çözücüleri Tercih Et';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Donanımsal kod çözücülerden önce FFmpeg (ses) ve libgav1 (AV1) kullan. HDMI ses doğrudan geçişi (passthrough) bozulursa devre dışı bırak.';

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
  String get useExternalPlayer => 'Her Zaman Harici Oynatıcı Kullan';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV\'de video oynatmayı seçtiğiniz harici uygulamada açın.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Otomatik Sıraya Ekleme';

  @override
  String get preferSdhSubtitles => 'SDH Altyazıları Tercih Et';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Otomatik seçim yaparken SDH/CC altyazı parçalarına öncelik ver.';

  @override
  String get preferTextSubtitles => 'Prefer Text Subtitles';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Prioritize text-based subtitles (SRT, VTT) over image-based formats (PGS, VobSub).';

  @override
  String get preferExternalSubtitles => 'Prefer External Subtitles';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Prioritize external subtitle files over embedded tracks.';

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
  String get crewContributionsSeerr => 'Ekip Katkıları (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Grupça İzle';

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
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Tarayıcıda Aç';

  @override
  String get achievementBadges => 'Achievement Badges';

  @override
  String get achievementBadgesSubtitle =>
      'Badges, ranks and quests earned from what you watch';

  @override
  String get achievementsBadges => 'Badges';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked of $total badges';
  }

  @override
  String get achievementsUnlockToasts => 'Unlock Notifications';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Show a notification when you unlock a badge';

  @override
  String get achievementsUnlockedNotification => 'Achievement unlocked';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count achievements unlocked',
      one: '$count achievement unlocked',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count more';
  }

  @override
  String get achievementsQuests => 'Quests';

  @override
  String achievementsQuestCount(int count) {
    return '$count completed';
  }

  @override
  String get achievementsLeaderboard => 'Leaderboard';

  @override
  String get achievementsLeaderboardSubtitle =>
      'How you compare with other users on this server';

  @override
  String get achievementsRecap => 'Recap';

  @override
  String get achievementsRecapSubtitle => 'What you watched recently';

  @override
  String get achievementsLibraryCompletion => 'Library completion';

  @override
  String achievementsLibraryCount(int count) {
    return '$count libraries';
  }

  @override
  String achievementsScore(int score) {
    return '$score points';
  }

  @override
  String get achievementsScoreLabel => 'Score';

  @override
  String get achievementsTopRank => 'Top rank reached';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$points points to $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days day streak';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Best: $days days';
  }

  @override
  String get achievementsShowcase => 'Showcase';

  @override
  String get achievementsUnlocked => 'Unlocked';

  @override
  String get achievementsLocked => 'Locked';

  @override
  String get achievementsNothingHere => 'Nothing here yet.';

  @override
  String get achievementsHiddenBadge => 'Hidden achievement';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Unlocked $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points pts';
  }

  @override
  String get achievementsDailyQuests => 'Daily';

  @override
  String get achievementsWeeklyQuests => 'Weekly';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Reroll daily quests';

  @override
  String get achievementsRerollWeekly => 'Reroll weekly quests';

  @override
  String get achievementsRerollOffer => 'Swap this set for a different one';

  @override
  String get achievementsRerollSpentDaily =>
      'Used today, comes back at midnight UTC';

  @override
  String get achievementsRerollSpentWeekly =>
      'Used this week, comes back Monday UTC';

  @override
  String get achievementsRerollConfirm => 'Reroll these quests?';

  @override
  String get achievementsRerollConfirmBody =>
      'You get one daily and one weekly reroll, and this spends it.';

  @override
  String get achievementsRerollFailed => 'Could not reroll those quests.';

  @override
  String get achievementsSuggested => 'Suggested items to watch';

  @override
  String get achievementsNoSuggestions => 'Nothing to suggest for this badge.';

  @override
  String get achievementsProgressLabel => 'Progress';

  @override
  String get achievementsLoadout => 'Loadout';

  @override
  String get achievementsLoadoutSubtitle =>
      'Score to spend and the boosts you hold';

  @override
  String get achievementsAppearance => 'Appearance';

  @override
  String get achievementsAppearanceSubtitle =>
      'The avatar and title on your profile';

  @override
  String get achievementsAvatars => 'Avatars';

  @override
  String get achievementsTitles => 'Titles';

  @override
  String get achievementsEquipped => 'Equipped';

  @override
  String get achievementsOwned => 'Owned';

  @override
  String achievementsEarnedAt(int score) {
    return 'Earned at $score lifetime score';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'This server has no avatars or titles to wear.';

  @override
  String get achievementsAppearanceFailed =>
      'Could not change how the profile looks.';

  @override
  String get achievementsPowerUps => 'Power-ups';

  @override
  String get achievementsStats => 'Stats';

  @override
  String get achievementsStatsSubtitle =>
      'Your records and how the server is doing';

  @override
  String get achievementsStatsWatched => 'Watched';

  @override
  String get achievementsStatsBests => 'Bests';

  @override
  String get achievementsStatsHabits => 'Habits';

  @override
  String get achievementsStatsVariety => 'Variety';

  @override
  String get achievementsStatsServer => 'This server';

  @override
  String get achievementsStatsClock => 'When you watch';

  @override
  String get achievementsStatItems => 'Items watched';

  @override
  String get achievementsStatMovies => 'Films watched';

  @override
  String get achievementsStatSeries => 'Series finished';

  @override
  String get achievementsStatHours => 'Hours watched';

  @override
  String get achievementsStatDays => 'Days watched';

  @override
  String get achievementsStatRewatches => 'Rewatches';

  @override
  String get achievementsStatBestWatchStreak => 'Best watch streak';

  @override
  String get achievementsStatBestLoginStreak => 'Best login streak';

  @override
  String get achievementsStatMostEpisodes => 'Most episodes in a day';

  @override
  String get achievementsStatMostMovies => 'Most films in a day';

  @override
  String get achievementsStatLongestItem => 'Longest single item';

  @override
  String get achievementsStatBestCombo => 'Best combo';

  @override
  String get achievementsStatLateNight => 'Late night sessions';

  @override
  String get achievementsStatEarlyMorning => 'Early morning sessions';

  @override
  String get achievementsStatWeekend => 'Weekend sessions';

  @override
  String get achievementsStatDaysSignedIn => 'Days signed in';

  @override
  String get achievementsStatLibraries => 'Libraries visited';

  @override
  String get achievementsStatGenres => 'Genres watched';

  @override
  String get achievementsStatDecades => 'Decades watched';

  @override
  String get achievementsStatCountries => 'Countries watched';

  @override
  String get achievementsStatLanguages => 'Languages watched';

  @override
  String get achievementsStatUsers => 'Users';

  @override
  String get achievementsStatBadgesUnlocked => 'Badges unlocked';

  @override
  String get achievementsStatScoreEarned => 'Score earned';

  @override
  String get achievementsStatCommonBadge => 'Most common badge';

  @override
  String get achievementsActivity => 'Activity';

  @override
  String get achievementsActivitySubtitle =>
      'What the server has unlocked lately';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user unlocked $badge';
  }

  @override
  String get achievementsShop => 'Shop';

  @override
  String get achievementsShopSubtitle => 'Spend score on more boosts';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Nothing for sale right now.';

  @override
  String get achievementsBuyConfirm => 'Buy this?';

  @override
  String get achievementsBuyConfirmBody =>
      'It comes straight out of your score bank.';

  @override
  String get achievementsBuyFailed => 'Could not buy that.';

  @override
  String get achievementsScoreBank => 'Score bank';

  @override
  String get achievementsBoost => 'XP Boost';

  @override
  String get achievementsBoostBody =>
      'Doubles score for an hour. Using it again restarts the hour.';

  @override
  String get achievementsDoubleCredit => 'Double Credit';

  @override
  String get achievementsDoubleCreditBody =>
      'The next thing you finish counts twice towards badges.';

  @override
  String get achievementsStreakFreeze => 'Streak Freeze';

  @override
  String get achievementsStreakFreezeBody =>
      'Covers one missed day. Only one can be banked.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count held',
      one: '1 held',
      zero: 'None held',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Running now';

  @override
  String get achievementsUsePowerUp => 'Use this power-up?';

  @override
  String get achievementsUsePowerUpBody =>
      'It\'s spent as soon as you confirm.';

  @override
  String get achievementsPowerUpFailed => 'Could not use that power-up.';

  @override
  String get achievementsHours => 'Hours';

  @override
  String get achievementsStreak => 'Streak';

  @override
  String get achievementsPeriodWeek => 'Week';

  @override
  String get achievementsPeriodMonth => 'Month';

  @override
  String get achievementsPeriodYear => 'Year';

  @override
  String achievementsDaysWatched(int count) {
    return '$count days watched';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count badges earned';
  }

  @override
  String get achievementsTopDirectors => 'Top directors';

  @override
  String get achievementsTopActors => 'Top actors';

  @override
  String get achievementsLoadFailed => 'Could not load your achievements.';

  @override
  String get friends => 'Friends';

  @override
  String get friendsSubtitle =>
      'See who\'s online and chat with people on this server';

  @override
  String get friendsShowButton => 'Show Friends Button';

  @override
  String get friendsShowButtonSubtitle =>
      'Friends and chat from the Achievement Badges plugin';

  @override
  String get friendsMessages => 'Messages';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count unread messages',
      one: '1 unread message',
      zero: 'No unread messages',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Friend requests';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count waiting for you',
      one: '1 waiting for you',
      zero: 'Nothing waiting',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Add friends';

  @override
  String get friendsAddSubtitle => 'Find people on this server';

  @override
  String get friendsPrivacy => 'Privacy';

  @override
  String get friendsPrivacySubtitle => 'What your friends can see';

  @override
  String get friendsOnline => 'Online';

  @override
  String get friendsOffline => 'Offline';

  @override
  String get friendsNone =>
      'No friends yet. Add people from this server to see them here.';

  @override
  String friendsWatching(String title) {
    return 'Watching $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Last watched $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Last seen $time';
  }

  @override
  String get friendsLoadFailed =>
      'Could not load this. Check your connection and try again.';

  @override
  String get friendsActionFailed => 'That didn\'t work. Try again in a moment.';

  @override
  String get friendsIncoming => 'Waiting for you';

  @override
  String get friendsOutgoing => 'Sent by you';

  @override
  String get friendsNoRequests => 'No friend requests.';

  @override
  String get friendsAccept => 'Accept';

  @override
  String get friendsDecline => 'Decline';

  @override
  String get friendsCancelRequest => 'Cancel request';

  @override
  String friendsRequestFrom(String name) {
    return '$name wants to be friends';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Take back the request you sent to $name?';
  }

  @override
  String get friendsSearchHint => 'Search people';

  @override
  String get friendsNoMatches => 'No one matches that name.';

  @override
  String friendsRequestSent(String name) {
    return 'Request sent to $name';
  }

  @override
  String get friendsSendRequest => 'Add as friend';

  @override
  String get friendsSendMessage => 'Send message';

  @override
  String friendsOpenItem(String title) {
    return 'Open $title';
  }

  @override
  String get friendsRemove => 'Remove friend';

  @override
  String friendsRemoveBody(String name) {
    return 'Remove $name from your friends? You can add them again later.';
  }

  @override
  String get friendsBlock => 'Block';

  @override
  String get friendsUnblock => 'Unblock';

  @override
  String friendsBlockBody(String name) {
    return 'Block $name? Neither of you will be able to message the other directly. Group chats you share stay open.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Unblock $name?';
  }

  @override
  String get friendsBlocked => 'Blocked users';

  @override
  String friendsProfileHidden(String name) {
    return '$name keeps their profile private.';
  }

  @override
  String get friendsAppearOffline => 'Appear Offline';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Friends always see you as offline';

  @override
  String get friendsHideNowPlaying => 'Hide What I\'m Watching';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Friends still see you online, but not what\'s playing';

  @override
  String get friendsHideLastWatched => 'Hide My Last Watched';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Friends won\'t see what you watched last while you\'re offline';

  @override
  String get friendsMessageNotifications => 'Message Notifications';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Show a banner when a friend messages you';

  @override
  String get friendsMuteDuringPlayback => 'Mute During Playback';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'No message banners while a video or game is playing';

  @override
  String get friendsSaveFailed => 'Could not save your settings.';

  @override
  String get chatNew => 'New message';

  @override
  String get chatNewSubtitle => 'Start a chat with a friend';

  @override
  String get chatNewGroup => 'New group';

  @override
  String get chatNewGroupSubtitle => 'Chat with several friends at once';

  @override
  String get chatNone => 'No messages yet.';

  @override
  String get chatYou => 'You';

  @override
  String chatYouSaid(String text) {
    return 'You: $text';
  }

  @override
  String get chatPhoto => 'Photo';

  @override
  String get chatEmoji => 'Emoji';

  @override
  String get chatEmojiSearch => 'Search emoji';

  @override
  String get chatNoRecentEmoji => 'No recent emoji';

  @override
  String get chatViewPhoto => 'View photo';

  @override
  String get chatHint => 'Write a message';

  @override
  String get chatAttach => 'Send a photo';

  @override
  String get chatEdited => 'edited';

  @override
  String get chatSeen => 'Seen';

  @override
  String get chatSent => 'Sent';

  @override
  String get chatEditing => 'Editing message';

  @override
  String get chatMessageOptions => 'Message options';

  @override
  String get chatDeleteBody => 'Delete this message for everyone?';

  @override
  String get chatClear => 'Clear conversation';

  @override
  String get chatClearBody =>
      'Delete every message in this chat for everyone in it?';

  @override
  String get chatGroupInfo => 'Group info';

  @override
  String get chatGroupName => 'Group name';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Owner';

  @override
  String get chatAdmin => 'Admin';

  @override
  String get chatMakeAdmin => 'Make admin';

  @override
  String get chatRemoveAdmin => 'Remove admin';

  @override
  String get chatRemoveMember => 'Remove from group';

  @override
  String get chatAddMember => 'Add people';

  @override
  String get chatNobodyToAdd => 'No one left to add.';

  @override
  String get chatLeave => 'Leave group';

  @override
  String get chatLeaveBody =>
      'Leave this group? Someone will have to add you back to rejoin.';

  @override
  String get chatCreate => 'Create group';

  @override
  String get chatPickMembers => 'Pick at least two friends';

  @override
  String chatNewMessageFrom(String name) {
    return 'New message from $name';
  }

  @override
  String get chatImageTooLarge => 'That image is over 8 MB.';

  @override
  String get chatImageUnsupported =>
      'Only PNG, JPEG, GIF and WebP images can be sent.';

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
  String get analyticsLibraryShare => 'Share of items by library';

  @override
  String get analyticsTopRating => 'Most common rating';

  @override
  String get analyticsTypicalRuntime => 'Typical runtime';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent% of items';
  }

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
  String get adminServerPathMetadata => 'Meta Veri';

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
  String get homeVideos => 'Kişisel Videolar';

  @override
  String get mixedContent => 'Karma İçerik';

  @override
  String get homeVideosAndPhotos => 'Kişisel Videolar & Fotoğraflar';

  @override
  String get mixedMoviesAndShows => 'Karışık Film & Diziler';

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
  String get loadingShuffle => 'Karışık liste yükleniyor…';

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
  String get audiobookChapters => 'Bölümler';

  @override
  String get audiobookBookmarks => 'Yer İmleri';

  @override
  String get audiobookNotes => 'Notlar';

  @override
  String get audiobookQueue => 'Sıra';

  @override
  String get audiobookTimeline => 'Zaman Çizelgesi';

  @override
  String get audiobookTimelineEmpty => 'Zaman Çizelgesi boş';

  @override
  String get audiobookFocusedTimeline => 'Odaklanmış Zaman Çizelgesi';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Yer İmlerini Dışarı Aktar';

  @override
  String get audiobookExportNotes => 'Notları Dışarı Aktar';

  @override
  String get audiobookExportAll => 'Hepsini Dışarı Aktar';

  @override
  String audiobookExportSuccess(String path) {
    return '$path konumuna aktarıldı';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Dışarı aktarma başarısız: $error';
  }

  @override
  String get audiobookLyrics => 'Şarkı Sözleri';

  @override
  String get audiobookAddBookmark => 'Yer İmi Ekle';

  @override
  String get audiobookAddNote => 'Not Ekle';

  @override
  String get audiobookEditNote => 'Notu Düzenle';

  @override
  String get audiobookNoteHint => 'Bu ana not ekle';

  @override
  String get audiobookSleepTimer => 'Uyku Zamanlayıcısı';

  @override
  String get audiobookSleepOff => 'Kapalı';

  @override
  String get audiobookSleepEndOfChapter => 'Bölüm sonunda';

  @override
  String get audiobookSleepCustom => 'Özel';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining kaldı';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dk',
      one: '1 dk',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Oynatma Hızı';

  @override
  String get audiobookRemainingTime => 'Kalan Süre';

  @override
  String get audiobookElapsedTime => 'Geçen Süre';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$seconds sn geri';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$seconds sn ileri';
  }

  @override
  String get audiobookPreviousChapter => 'Bir Önceki Bölüm';

  @override
  String get audiobookNextChapter => 'Bir Sonraki Bölüm';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Bölüm: $current / $total';
  }

  @override
  String get audiobookNoChapters => 'Bölüm bulunamadı';

  @override
  String get audiobookNoBookmarks => 'Henüz yer işareti yok';

  @override
  String get audiobookNoNotes => 'Henüz not yok';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Yer işareti $position konumuna eklendi';
  }

  @override
  String get audiobookSpeedReset => '1.0x hızına sıfırla';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Kaydet';

  @override
  String get audiobookCancel => 'İptal Et';

  @override
  String get audiobookDelete => 'Sil';

  @override
  String get subtitlePreferencesDescription =>
      'Altyazı modlarını, varsayılan dilleri, görünümü ve oluşturma seçeneklerini değiştirin.';

  @override
  String get subtitleRendering => 'Altyazı Oluşturma';

  @override
  String get displayOptions => 'Görüntüleme Seçenekleri';

  @override
  String get releaseDateAscending => 'Çıkış Tarihi (Eskiden Yeniye)';

  @override
  String get releaseDateDescending => 'Çıkış Tarihi (Yeniden Eskiye)';

  @override
  String get groupContributions => 'Grup Katkıları';

  @override
  String get groupMultipleRoles => 'Birden Fazla Rolü Grupla';

  @override
  String get libraryWriteAccessWarningTitle => 'Kitaplık Yazma İzni Uyarısı';

  @override
  String get libraryWriteAccessHowToFix => 'Bu sorun nasıl çözülür:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Sunucudaki medya kitaplığı klasörleriniz için Jellyfin hizmet kullanıcısına (örn. jellyfin veya Docker PUID/PGID) yazma izinleri tanımlayın.\n\n2. Veya Jellyfin Kontrol Paneli -> Kitaplıklar bölümüne gidin, bu kitaplığı düzenleyin ve görselleri Jellyfin\'in dahili veritabanında saklamak için \'Görselleri medya klasörlerine kaydet\' seçeneğini devre dışı bırakın.';

  @override
  String get dismiss => 'Yoksay';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return '\"$libraryName\" kütüphaneniz, kapak görsellerini doğrudan medya klasörlerine kaydedecek şekilde yapılandırılmış (\'Kapak görsellerini medya klasörlerine kaydet\' seçeneği etkin). Ancak Jellyfin yazma erişimini test etti ve bu dizine dosya yazma iznine sahip değil:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin görselleri güncelleyemedi. Kütüphaneniz, görselleri doğrudan medya klasörlerine kaydedecek şekilde yapılandırılmış (\'Görselleri medya klasörlerine kaydet\' seçeneği etkin). Bu hata genellikle Jellyfin sunucu işleminin, medya dizinlerinize dosya yazma izni olmadığında meydana gelir.';

  @override
  String get replay => 'Tekrar';

  @override
  String get fileInformation => 'Dosya Bilgisi';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Boyut: $size  •  Format: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Tüm Ses Parçalarını Göster ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Tüm Altyazıları Göster ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Doğrudan Oynatma uyumluluğu kontrol ediliyor…';

  @override
  String get directPlayCapabilityLabel => 'Doğrudan Oynatma Uyumluluğu: ';

  @override
  String get forced => 'Zorunlu';

  @override
  String get transcodeContainerNotSupported =>
      'Kapsayıcı biçimi oynatıcı tarafından desteklenmiyor.';

  @override
  String get transcodeVideoCodecNotSupported => 'Video kodeki desteklenmiyor.';

  @override
  String get transcodeAudioCodecNotSupported => 'Ses kodeki desteklenmiyor.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Altyazı biçimi desteklenmiyor (videoya gömülmesi gerekiyor).';

  @override
  String get transcodeAudioProfileNotSupported => 'Ses profili desteklenmiyor.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Video profili desteklenmiyor.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Video seviyesi desteklenmiyor.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Video çözünürlüğü bu cihaz tarafından desteklenmiyor.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Video bit derinliği desteklenmiyor.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Video kare hızı desteklenmiyor.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Dosya bit hızı, oynatıcının akış sınırını aşıyor.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Video bit hızı, akış sınırını aşıyor.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Ses bit hızı, akış sınırını aşıyor.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Ses kanalı sayısı desteklenmiyor.';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Audio codec ($codec) is not supported directly.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Tip: If your audio receiver or soundbar supports $codec, enable Audio Passthrough in Audio settings.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Audio channel count (${channels}ch) exceeds the player limit.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Tip: Adjust \'Max Audio Channels\' or multichannel downmixing in Audio settings.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'ASS/SSA subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Tip: Enable \'ASS/SSA Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'PGS subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Tip: Enable \'PGS Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Subtitle format ($codec) is not supported directly and must be burned in.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'File bitrate ($fileBitrate) exceeds the configured streaming limit ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Tip: Increase \'Maximum Bitrate\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeResolutionHint =>
      'Tip: Increase \'Maximum Resolution\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Video dynamic range (e.g. Dolby Vision / HDR) is not supported by this display.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Dolby Vision Profile 7 enhancement layer direct play is disabled.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Tip: Enable \'Dolby Vision Profile 7 Direct Play\' in Playback settings if your display supports it.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Transcoding is preferred for Dolby Vision fallback per user settings.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Tip: Set \'Dolby Vision Fallback\' to \'Play as HDR10\' in Playback settings to avoid transcoding.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Connected display does not report support for HDR or Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Connected display lacks HDR10 support needed for Dolby Vision fallback.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Audio sample rate is not supported.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Audio bit depth is not supported.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Video reference frames exceed player limits.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Anamorphic video is not supported.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Interlaced video is not supported.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Secondary audio stream requires transcoding.';

  @override
  String get transcodeDirectPlayError =>
      'Direct play is not supported for this media format.';

  @override
  String get sortServerOrder => 'Server Order';

  @override
  String get sortAlphabetical => 'Alfabetik';

  @override
  String get sortReleaseAscending => 'Yayın Tarihine Göre (Eskiden Yeniye)';

  @override
  String get sortReleaseDescending => 'Yayın Tarihine Göre (Yeniden Eskiye)';

  @override
  String get sortCustomDragDrop => 'Özel (Sürükle-Bırak)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Oynatma Listesi Sıralama Seçenekleri';

  @override
  String get resetSort => 'Sıralamayı Sıfırla';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode Bölümünü Yeniden İzle';
  }

  @override
  String get rewatchPlaylist => 'Oynatma Listesini Yeniden İzle';

  @override
  String get noSubtitlesFound => 'Altyazı bulunamadı.';

  @override
  String get adminControls => 'Yönetici Kontrolleri';

  @override
  String get impellerRendering => 'İşleme motoru (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller, daha akıcı animasyonlar ve daha az takılma sağlayan Flutter\'ın modern GPU işleme motorudur. Bazı TV kutularında (TV Box) ve eski grafik işlemcilerde (GPU) ekran bozulmalarına veya siyah ekrana neden olabilir; bu gibi durumlarla karşılaşırsanız özelliği Kapatın. Otomatik seçeneği, cihazınız için en iyi varsayılanı belirler. Değişiklikleri uygulamak için Moonfin\'i yeniden başlatın.';

  @override
  String get impellerAuto => 'Otomatik';

  @override
  String get impellerOn => 'Açık';

  @override
  String get impellerOff => 'Kapalı';

  @override
  String get impellerRestartTitle => 'Yeniden Başlatma Gerekiyor';

  @override
  String get impellerRestartMessage =>
      'İşleme motorunu değiştirmek için Moonfin\'in yeniden başlatılması gerekiyor. Değişiklikleri uygulamak için uygulamayı şimdi kapatın ve ardından tekrar açın.';

  @override
  String get impellerCloseNow => 'Uygulamayı Şimdi Kapat';

  @override
  String get adminRefreshLibrary => 'Kütüphaneyi Yenile';

  @override
  String get adminRefreshAllLibraries => 'Bütün Kütüphaneleri Yenile';

  @override
  String get adminRepoSortDateOldest => 'Ekleme Tarihi (Önce En Eski)';

  @override
  String get adminRepoSortDateNewest => 'Ekleme Tarihi (Önce En Yeni)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetik (A\'dan Z\'ye)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetik (Z\'den A\'ya)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Sunucu Analizleri Yükleniyor... %$percentage';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Kaynağa göre eşle';

  @override
  String get imdbTop250Movies => 'IMDB En İyi 250 Film';

  @override
  String get imdbTop250TvShows => 'IMDB En İyi 250 Dizi';

  @override
  String get imdbMostPopularMovies => 'IMDB En Popüler Filmler';

  @override
  String get imdbMostPopularTvShows => 'IMDB En Popüler Diziler';

  @override
  String get imdbLowestRatedMovies => 'IMDB En Düşük Puanlı Filmler';

  @override
  String get imdbTopEnglishMovies => 'IMDB En Yüksek Puanlı İngilizce Filmler';

  @override
  String get addToWatchlist => 'İzleme Listesine Ekle';

  @override
  String get removeFromWatchlist => 'İzleme Listesinden Sil';

  @override
  String get watchlistUpdateFailed => 'İzleme listesi güncellenemedi';

  @override
  String get adminSearchParameters => 'Arama Parametreleri';

  @override
  String get adminCurrentMetadata => 'Mevcut Metaveri';

  @override
  String get adminLabelYear => 'Yıl';

  @override
  String get adminReplaceImages => 'Mevcut görselleri değiştir';

  @override
  String get adminBackToSearch => 'Arama Kriterlerine Dön';

  @override
  String get grouping => 'Gruplama';

  @override
  String get groupByType => 'Türe Göre Grupla';

  @override
  String get playlistTypes => 'Oynatma Listesi Türleri';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Music Video';

  @override
  String get playlistTypeAudio => 'Ses (Müzik)';

  @override
  String get playlistTypeAudiobook => 'Sesli Kitap';

  @override
  String get playlistTypeBook => 'Kitap';

  @override
  String get playlistTypePhoto => 'Resim';

  @override
  String get playlistTypeMixed => 'Karışık';

  @override
  String get videoPlaylistsSection => 'Video Oynatma Listeleri';

  @override
  String get musicVideoPlaylistsSection => 'Music Video Playlists';

  @override
  String get audioPlaylistsSection => 'Ses Oynatma Listesi';

  @override
  String get audiobookPlaylistsSection => 'Sesli Kitap Oynatma Listesi';

  @override
  String get bookPlaylistsSection => 'Kitap Oynatma Listesi';

  @override
  String get photoPlaylistsSection => 'Resim Oynatma Listesi';

  @override
  String get mixedPlaylistsSection => 'Karışık Oynatma Listesi';

  @override
  String get currentTime => 'Current Time';

  @override
  String get playbackTimeDisplay => 'İlerleme Çubuğu Süresi';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Oynatma ilerleme çubuğunun etrafında hangi zaman etiketlerinin görüneceğini seçin.';

  @override
  String get playbackTimeTotal => 'Toplam süre';

  @override
  String get playbackTimeRemaining => 'Kalan süre';

  @override
  String get playbackTimeEndsAt => 'Bitiş Saati';

  @override
  String get playbackTimeElapsed => 'Geçen süre';

  @override
  String get playbackTimeVideoSection => 'Video Oynatıcı';

  @override
  String get playbackTimeMusicSection => 'Müzik Oynatıcı';

  @override
  String get playbackTimeSlotDescription =>
      'Burada ne gösterileceğini seçin veya gizleyin.';

  @override
  String get playbackTimeAboveBarLeft => 'Çubuğun üstünde, sol';

  @override
  String get playbackTimeAboveBarCenter => 'Çubuğun üstünde, orta';

  @override
  String get playbackTimeAboveBarRight => 'Çubuğun üstünde, sağ';

  @override
  String get playbackTimeBelowBarLeft => 'Çubuğun altında, sol';

  @override
  String get playbackTimeBelowBarCenter => 'Çubuğun altında, orta';

  @override
  String get playbackTimeBelowBarRight => 'Çubuğun altında, sağ';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Müzik ilerleme çubuğunun sağ tarafında ne gösterileceğini seçin.';

  @override
  String get groupByTitle => 'Grupla';

  @override
  String get groupByDecade => 'On yıl (Yıl)';

  @override
  String get groupByParentalRating => 'Ebeveyn Derecelendirmesi';

  @override
  String get groupByStudio => 'Stüdyo';

  @override
  String get showAlphabeticalFilters => 'Alfabeyi Göster';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => 'Kişisel Derecelendirme Tarzı';

  @override
  String get personalRatingThumbs => 'Beğen / Beğenme';

  @override
  String get personalRatingStars => '5 yıldız';

  @override
  String get personalRatingNumeric => '10 üzerinden sayısal puan';

  @override
  String get rate => 'Puan';

  @override
  String get like => 'Beğen';

  @override
  String get dislike => 'Beğenme';

  @override
  String get personalRatingClear => 'Derecelendirmeyi Sil';

  @override
  String get personalRatingRated => 'Derecelendirilmiş';

  @override
  String get personalRatingMine => 'Derecelendirmem';

  @override
  String get personalRatingSaveFailed => 'Derecelendirme kaydedilemedi';

  @override
  String get increase => 'Yükselme';

  @override
  String get decrease => 'Azalma';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'Devam Ediyor';

  @override
  String get filterUnreleased => 'Yayınlanmadı';

  @override
  String get filterTrailers => 'Fragmanlar';

  @override
  String get filterExtras => 'Özel Özellikler';

  @override
  String get filterThemeSongs => 'Tema Şarkıları';

  @override
  String get filterThemeVideos => 'Tema Videoları';

  @override
  String get source => 'Kaynak';

  @override
  String get years => 'Yıllar';

  @override
  String get audioLanguage => 'Ses Dili';

  @override
  String get subtitleLanguage => 'Altyazı Dili';

  @override
  String get clearFilters => 'Filtreyi Temizle';

  @override
  String get seerrShortcutsRow => 'Seerr Gözat';

  @override
  String get seerrReleased => 'Yayınlandı';

  @override
  String get seerrMinRating => 'Minimum Decerelendirme';

  @override
  String get seerrMinVotes => 'Minimum Oy';

  @override
  String get seerrOriginalLanguage => 'Orijinal Dil';

  @override
  String get seerrRuntime => 'Süre';

  @override
  String get subtitleHdrSeparate => 'Ayrı HDR Stili';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'HDR\'de beyaz renkler SDR\'ye göre çok daha parlaktır; bu nedenle buradaki daha sönük bir stil göz almasını (parlama yapar) engeller';

  @override
  String get scrollSensitivity => 'Kaydırma Hassasiyeti';

  @override
  String get scrollSensitivitySubtitle =>
      'Fare tekerleğinin bir çentik (tık) hareketle ne kadar kaydıracağı';

  @override
  String get mediaDetailsAndSpoilers => 'Medya Ayrıntıları ve Spoiler\'lar';

  @override
  String get openTrailersExternally => 'Fragmanları Harici Uygulamada Aç';

  @override
  String get openTrailersExternallySubtitle =>
      'Fragmanlar yerleşik oynatıcı yerine YouTube uygulamasında veya tarayıcıda açılır';

  @override
  String get hideDetailsMediaDescription => 'Medya Açıklamasını Gizle';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Film veya bölüm açıklama metnini gizler.';

  @override
  String get detailUseSeriesThumbnails => 'Dizi Küçük Resimlerini Kullan';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Klasik ayrıntılar sayfasındaki tüm küçük resimleri dizi küçük resmiyle değiştir';

  @override
  String get hideHomeMediaDescription => 'Medya Açıklamasını Gizle';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Film veya bölüm açıklama metnini gizler.';

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
  String get continueWatchingAndNextUpHeader =>
      'İzlemeye Devam Et ve Sonraki Bölümler';

  @override
  String get setupSkip => 'Kurulumu Atla';

  @override
  String get setupNavbarQuestion => 'Gezinme çubuğu nereye gitsin?';

  @override
  String get setupMediaBarQuestion =>
      'Ana ekranınızın üst kısmı nasıl görünmeli?';

  @override
  String get setupHomeRowsQuestion => 'Satırlarınız nasıl görünmeli?';

  @override
  String get setupDetailQuestion =>
      'Bir film veya dizi açıldığında nasıl görünmeli?';

  @override
  String get setupTourQuestion =>
      'Hazırsınız. İşte burada yer alan diğer şeyler.';

  @override
  String get setupPlaybackLanguages => 'Playback languages';

  @override
  String get setupOptional => 'Optional';

  @override
  String get setupStyleClassic => 'Klasik';

  @override
  String get setupStyleModern => 'Modern';

  @override
  String get setupRowsClassicHint =>
      'Kompakt. Ekranda aynı anda daha fazla satır.';

  @override
  String get setupRowsModernHint =>
      'Başlıkları altında olan daha büyük kartlar.';

  @override
  String get setupDetailClassicHint =>
      'Her şey tek bir yığın halinde ortalanmış.';

  @override
  String get setupDetailModernHint =>
      'Sinematik, oyuncu kadrosu ve ekstralar için sekmelerle birlikte.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      'Hero-first, with pop-up cards for cast and extras.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Full-screen, with sections stacked instead of tabs.';

  @override
  String get setupStyleMinimalist => 'Minimalist';

  @override
  String get setupDetailMinimalistHint =>
      'Artwork, one play button and the episodes.';

  @override
  String get setupNavbarStyleQuestion => 'How should the bottom bar look?';

  @override
  String get setupNavbarStyleDockHint =>
      'A floating pill with labels under every tab.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Search gets its own button, and the bar shrinks while you scroll.';

  @override
  String get setupNavbarStyleStripHint =>
      'A full-width bar along the bottom edge.';

  @override
  String get setupPickALook => 'Bir görünüm seçin';

  @override
  String get setupTourMoreHeader => 'Ayarlarda bekleyen daha çok şey var';

  @override
  String get setupTourBulletRequests => 'Seerr istekleri';

  @override
  String get setupTourBulletSyncPlay => 'SyncPlay birlikte izleme etkinlikleri';

  @override
  String get setupTourBulletThemes => 'Özel Temalar';

  @override
  String get setupTourBulletDownloads => 'Çevrimdışı indirmeler';

  @override
  String get setupTourBulletMore => 'Ve çok daha fazlası';

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
  String get runSetupAgain => 'Kurulumu yeniden çalıştır';

  @override
  String get serverMessages => 'Mesajlar';

  @override
  String get serverMessagesEmpty => 'Sunucunuzdan henüz mesaj yok';

  @override
  String get serverMessagesMarkAllRead => 'Hepsini okundu işaretle';

  @override
  String get serverMessagesShowButton => 'Mesajlar Butonunu Göster';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Sunucu yöneticiniz tarafından gönderilen mesajlar için menüye bir düğme ekler';

  @override
  String get showBookDiscoverTab => 'Show Book Library Discovery';

  @override
  String get showBookDiscoverTabDescription =>
      'Browse titles from Open Library and LibriVox in your book and audiobook libraries';

  @override
  String get autoDownloadNewEpisodes => 'Auto-download new episodes';

  @override
  String get autoDownloadStop => 'Stop auto-download';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Downloads new episodes, up to $count unwatched at a time',
      one: 'Downloads new episodes, up to 1 unwatched at a time',
      zero: 'Downloads every new episode',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'On • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Transcoded qualities only download while Moonfin is open. Original quality also downloads in the background.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Transcoded downloads can\'t resume after an interruption and start over from the beginning. Original quality can resume.';

  @override
  String get autoDownloadForegroundOnly =>
      'Downloads only while Moonfin is open';

  @override
  String get autoDownloadQualityTitle => 'Auto-download quality';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Auto-download enabled for $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Auto-download stopped for $title';
  }

  @override
  String get smartDownloadsSection => 'Smart downloads';

  @override
  String get smartDownloadsEnable => 'Download Next Episodes';

  @override
  String get smartDownloadsEnableDescription =>
      'When you finish an episode on any device, Moonfin downloads the next ones. Episodes it downloads are deleted once watched.';

  @override
  String get smartDownloadsKeepReady => 'Episodes to Keep Downloaded';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keeps the next $count episodes downloaded',
      one: 'Keeps the next episode downloaded',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Episodes already downloaded stay on your device. The new number applies to future downloads.';

  @override
  String get autoDownloadSection => 'Automatic downloads';

  @override
  String get autoDownloadEnable => 'Enable Automatic Downloads';

  @override
  String get autoDownloadEnableSubtitle =>
      'Downloads new episodes of the series you follow. Existing episodes can still be downloaded manually.';

  @override
  String get autoDownloadKeepUnwatched => 'Keep Unwatched Episodes';

  @override
  String get autoDownloadKeepAll => 'All';

  @override
  String get autoDownloadDelete => 'Delete Downloaded Episodes';

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
  String get autoDownloadDeleteNever => 'Never';

  @override
  String get autoDownloadDeleteImmediately => 'Right after watching';

  @override
  String get autoDownloadDeleteAfterDay => '1 day after watching';

  @override
  String get autoDownloadDeleteAfterWeek => '1 week after watching';

  @override
  String get autoDownloadBackgroundRefresh => 'Check in the Background';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Allow the system to check for new episodes periodically while Moonfin is closed';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Background App Refresh is disabled for Moonfin. Enable it in iOS Settings.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Background usage is restricted for Moonfin in Android Settings.';

  @override
  String get autoDownloadCheckNow => 'Check Now';

  @override
  String get autoDownloadChecking => 'Checking...';

  @override
  String get autoDownloadNeverChecked => 'Not checked yet';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued episodes queued',
      one: '1 episode queued',
      zero: 'nothing new',
    );
    return 'Last check $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Last check $when failed: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Followed series';

  @override
  String get autoDownloadNoSubscriptions =>
      'Open a series and choose \"Auto-download new episodes\" from its download menu';

  @override
  String get autoDownloadRemove => 'Stop following';

  @override
  String get autoDownloadStorageFull => 'Not enough storage';

  @override
  String get autoDownloadWaitingForWifi => 'Waiting for WiFi';

  @override
  String get downloadNotificationRunning => 'Downloading';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Downloading ($done/$total)';
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
      other: 'Downloads complete',
      one: 'Download complete',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name saved for offline';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items saved for offline',
      one: '1 item saved for offline',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Download failed';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Remote message';

  @override
  String get serverMessagesNotificationReceived => 'Message received';

  @override
  String get downloadStorageLimitReached =>
      'Storage limit reached. Free up space or increase the limit.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Not enough storage: $needed needed, $free free';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Not enough storage for new episodes';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes are waiting for space.',
      one: '$name needs $size.',
    );
    return '$_temp0 Free up space or raise the download limit.';
  }

  @override
  String get pageTransitions => 'Page Transitions';

  @override
  String get pageTransitionsSubtitle =>
      'Adjusts fade time when navigating between pages';

  @override
  String get navigationSpeed => 'Navigation Speed';

  @override
  String get navigationSpeedSubtitle =>
      'Adjusts how quickly the focus indicator moves between items and rows';

  @override
  String get modernCardsTransitionSpeed => 'Modern Cards Transition Speed';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Adjusts animation speed when expanding focused modern cards';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Delay Card Expansion on Rapid Scroll';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Waits for focus movement to pause before expanding modern cards';

  @override
  String get animationSpeedExtraSlow => 'Extra Slow';

  @override
  String get animationSpeedSlow => 'Slow';

  @override
  String get animationSpeedMedium => 'Medium';

  @override
  String get animationSpeedFast => 'Fast';

  @override
  String get animationSpeedOff => 'Off';

  @override
  String get pageTransitionFadeNone => 'No Fade';

  @override
  String get pageTransitionFadeShort => 'Short Fade';

  @override
  String get pageTransitionFadeMedium => 'Medium Fade';

  @override
  String get pageTransitionFadeLong => 'Long Fade';

  @override
  String get siriRemoteSwipeSensitivity => 'Touchpad Swipe Sensitivity';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'How far focus moves for each swipe on the Siri Remote touchpad';

  @override
  String get appleTvHomeScreen => 'Apple TV home screen';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'What the Apple TV home screen shows above the Moonfin icon when it is selected. This setting stays on this device.';

  @override
  String get topShelfLatestMedia => 'Latest media';

  @override
  String get topShelfAppBanner => 'Moonfin banner';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Keep Video Clear of the Dynamic Island';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'In landscape the camera housing covers one edge of the screen. This holds the picture back from it, which only changes anything for video wide enough to reach that far.';

  @override
  String get bottomNavbarStyle => 'Bottom Bar Style';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Split';

  @override
  String get bottomNavbarStyleStrip => 'Strip';

  @override
  String get bottomNavbarTabs => 'Bottom Bar Tabs';

  @override
  String get bottomNavbarTabsDescription =>
      'Pin up to 3 tabs between Home and You. Everything else is in the bottom navbar hub.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automatic';

  @override
  String get bottomNavbarTabsPinned => 'Pinned';

  @override
  String get bottomNavbarTabsAvailable => 'Available';

  @override
  String get bottomNavbarTabsReset => 'Reset to Automatic';

  @override
  String get bottomNavbarTabsLimit =>
      'You can pin up to 3 tabs. Remove one to pin another.';

  @override
  String get bottomNavbarTabTurnedOff => 'Turned off under Buttons';

  @override
  String get bottomNavbarSplitSearchNote =>
      'In the Split style, Search always has its own button.';

  @override
  String get bottomNavbarButtonsNote =>
      'These decide what shows in the bottom navbar hub and which tabs you can pin to the bottom bar. Tabs already on the bar aren\'t listed here.';

  @override
  String get navYou => 'You';

  @override
  String get cinemaSkipPrerolls => 'Cinema Mode Skip Button';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Show a Skip button during Cinema Mode trailers, commercials, and other pre-rolls.';

  @override
  String get detailsPage => 'Details Page';

  @override
  String get storageAndDownloads => 'Storage & Downloads';

  @override
  String get integrations => 'Entegrasyonlar';

  @override
  String get settingsSync => 'Settings Sync';

  @override
  String get settingsSyncSubtitle =>
      'Moonbase plugin sync and customization profiles';

  @override
  String get navigationBar => 'Navigation Bar';

  @override
  String get homeRows => 'Rows';

  @override
  String get homeRowsSubtitle => 'Turn rows on or off and change their order';

  @override
  String get rowOptions => 'Row Options';

  @override
  String get rowOptionsSubtitle => 'Sorting and content for each row';

  @override
  String get imageTypePerRow => 'Image Type per Row';

  @override
  String get externalSources => 'External Sources';

  @override
  String get qualityAndDecoding => 'Quality & Decoding';

  @override
  String get qualityAndDecodingSubtitle =>
      'Bitrate, resolution, decoding, HDR, and Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Skipping & Autoplay';

  @override
  String get advancedPlayback => 'Advanced Playback';

  @override
  String get advancedPlaybackSubtitle =>
      'Player routing, external players, and mpv';

  @override
  String get settingsAccountSubtitle =>
      'Sign-in, PIN code, Kids Mode, parental controls, and settings sync';

  @override
  String get settingsGeneralSubtitle =>
      'Language, clock, input, and performance';

  @override
  String get settingsAppearanceSubtitle =>
      'Navigation, home screen, libraries, details page, and themes';

  @override
  String get settingsHomeScreenSubtitle =>
      'Rows, media bar, looks, and external sources';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Library visibility, order, and library pages';

  @override
  String get settingsDetailsPageSubtitle =>
      'Layout, buttons, sections, ratings, and theme music';

  @override
  String get settingsPlaybackSubtitle =>
      'Player, quality, audio, subtitles, skipping, and SyncPlay';

  @override
  String get settingsStorageSubtitle =>
      'Downloads, storage location, and the image cache';

  @override
  String get settingsServicesSubtitle => 'Seerr and Achievement Badges';

  @override
  String get settingsSignInSection => 'Sign-in';

  @override
  String get settingsFamilySection => 'Family';

  @override
  String get settingsServersSection => 'Servers';

  @override
  String get settingsLanguageSection => 'Language';

  @override
  String get settingsInputSection => 'Input';

  @override
  String get settingsMotionSection => 'Motion';

  @override
  String get settingsContentsSection => 'Contents';

  @override
  String get settingsLooksSection => 'Looks';

  @override
  String get settingsAudioAndSubtitlesSection => 'Audio & Subtitles';

  @override
  String get settingsSkippingAndQueueSection => 'Skipping & Queue';

  @override
  String get settingsWatchTogetherSection => 'Watch Together';

  @override
  String get settingsAdvancedSection => 'Advanced';

  @override
  String get playerSettingsSubtitle =>
      'Controls, seeking, player buttons, and trick play';

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
  String get playlistSortReleaseDate => 'Release Date';

  @override
  String get playlistSortCriticRating => 'Critic Rating';

  @override
  String get playlistSortRuntime => 'Runtime';

  @override
  String get playlistSortLastPlayed => 'Last Played';

  @override
  String get playlistSortPlayCount => 'Play Count';

  @override
  String get playlistSortRandom => 'Random';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active',
      one: '1 active',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks => 'No tracks match the active filters';

  @override
  String get librarySortPlaylistOrder => 'Playlist Order';

  @override
  String get librarySortDateAdded => 'Date Added';

  @override
  String get librarySortDateEpisodeAdded => 'Date Episode Added';

  @override
  String get librarySortParentalRating => 'Parental Rating';

  @override
  String get librarySortMyRating => 'My Rating';

  @override
  String get librarySortAlbumArtist => 'Album Artist';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Artist';

  @override
  String get librarySortTrackNumber => 'Track Number';

  @override
  String get librarySortGenre => 'Genre';

  @override
  String get librarySortFoldersFirst => 'Folders First';

  @override
  String get librarySortLength => 'Length';

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
