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
  String get animeMarkerSubbedShort => 'Altyazı';

  @override
  String get animeMarkerDubbedShort => 'Dublaj';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Altyazı/Dublaj';

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
  String get signingIn => 'Oturum açılıyor...';

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
      'Veya sunucunuzda oturum açmış bir telefonla bunu tarayın';

  @override
  String get quickConnectTapOrScanHint =>
      'Tarayıcınızda onaylamak için dokunun veya başka bir cihazla tarayın';

  @override
  String get timesUpTitle => 'Süre doldu';

  @override
  String get timesUpMessage => 'Bu hesap şu anda kullanılamıyor.';

  @override
  String timesUpResumesToday(String time) {
    return 'Bugün saat $time itibarıyla tekrar kullanabilirsiniz.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'Yarın saat $time itibarıyla tekrar kullanabilirsiniz.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return '$day saat $time itibarıyla tekrar kullanabilirsiniz.';
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
      'Bu hesapla şu anda oturum açılamıyor. İzin verilen saatlerin dışında olabilir, kilitlenmiş veya devre dışı bırakılmış olabilir. Daha sonra tekrar deneyin veya bir yöneticiye başvurun.';

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
  String get signedInOnThisDevice => 'Bu cihazda oturum açık';

  @override
  String get pinRequired => 'PIN gerekli';

  @override
  String get passwordRequired => 'Parola gerekli';

  @override
  String continueAsUser(String name) {
    return '$name olarak devam et';
  }

  @override
  String switchToUser(String name) {
    return '$name hesabına geç';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return '$server sunucusunda $user olarak oturum açıldı';
  }

  @override
  String get accountActive => 'Etkin';

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
      'Bir film veya dizinin açıldığında nasıl göründüğü.';

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
  String get spotlightFileDetails => 'Dosya Ayrıntıları';

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
  String get detailScreenStyleStage => 'Stage';

  @override
  String get detailScreenStylePremiere => 'Premiere';

  @override
  String get detailScreenStyleQuickLook => 'Quick Look';

  @override
  String get detailScreenStyleFrost => 'Frost';

  @override
  String get quickLookOpenFullPage => 'Tam sayfayı aç';

  @override
  String get quickLookBackToClose => 'Geri ile çık';

  @override
  String quickLookSeasonPlayed(int played, int total) {
    return '$played/$total';
  }

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
  String get rendererMode => 'Grafik Oluşturucu';

  @override
  String get rendererModeSubtitle =>
      'Otomatik, grafikleri sorunsuz çalıştıran cihazlarda Impeller\'ı, diğerlerinde Skia\'yı kullanır. Animasyonlar veya video bozuk görünüyorsa Skia\'yı seçin. Bir sonraki açılışta etkinleşir.';

  @override
  String get rendererModeAuto => 'Otomatik';

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
  String get keyboardStyle => 'Klavye Stili';

  @override
  String get keyboardStyleDescription =>
      'Sistem, TV\'nizin kendi klavyesini kullanır. Klasik, özgün Moonfin klavyesidir. Cam, daha büyük tuşlara sahip buzlu bir paneldir. Sabit, ekranın alt kısmını kaplar ve yazdıklarınızı tuşların üstünde gösterir.';

  @override
  String get keyboardStyleNative => 'Sistem';

  @override
  String get keyboardStyleClassic => 'Klasik';

  @override
  String get keyboardStyleGlass => 'Cam';

  @override
  String get keyboardStyleDocked => 'Sabit';

  @override
  String get keyboardSpace => 'boşluk';

  @override
  String get keyboardHoldForAccents => 'aksanlar için basılı tut';

  @override
  String get keyboardClose => 'kapat';

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
  String get signInWithPlex => 'Plex ile oturum aç';

  @override
  String get plexLinkInstructions =>
      'Herhangi bir cihazda plex.tv/link adresine gidin ve bu kodu girin';

  @override
  String get plexOpenLink => 'plex.tv/link adresini aç';

  @override
  String get plexWaitingForApproval => 'Kodu onaylamanız bekleniyor...';

  @override
  String get plexSignInWithPassword => 'Parola ile oturum aç';

  @override
  String get plexVerificationCode => 'Doğrulama kodu';

  @override
  String get plexNoServers => 'Bu hesapta Plex sunucusu bulunamadı';

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
  String get gameOrientation => 'Oyun yönü';

  @override
  String get gameOrientationSubtitle => 'Oyun oynarken ekran yönü';

  @override
  String get landscape => 'Yatay';

  @override
  String get portrait => 'Dikey';

  @override
  String get gameEmulatorSettings => 'Emülatör ayarları';

  @override
  String get gameNoCoreOptions =>
      'Bu çekirdeğin ayarlanabilir bir seçeneği yok.';

  @override
  String get gameHoldToOpenMenu => 'Menüyü açmak için basılı tutun';

  @override
  String get gameKeepPlaying => 'Oynamaya devam et';

  @override
  String get gameSaveAndExit => 'Kaydet ve çık';

  @override
  String get gameExitGame => 'Oyundan çık';

  @override
  String get gameSavingBeforeExit => 'Kaydediliyor…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Durum kaydedilemedi. Oyun devam ediyor.';

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
  String get noBooksFound => 'Kitap Bulunamadı';

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
  String get additionalParts => 'Ek Parçalar';

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
  String get noOtherAudioTracks => 'Başka ses izi yok';

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
  String get fetchingSubtitles => 'Altyazılar getiriliyor';

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
  String get episodeDirector => 'Episode Director';

  @override
  String episodeDirectorWithRole(String role) {
    return '$role (Episode Director)';
  }

  @override
  String get episodeWriter => 'Episode Writer';

  @override
  String episodeWriterWithRole(String role) {
    return '$role (Episode Writer)';
  }

  @override
  String get guestStar => 'Guest Star';

  @override
  String guestStarWithRole(String role) {
    return '$role (Guest Star)';
  }

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
  String get shortcutRecropBlackBars => 'Siyah çubukları yeniden kırp';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Tam ekrandan çık veya tam ekranda değilse durdur';

  @override
  String get shortcutHideControls => 'Kontrolleri gizle';

  @override
  String get shortcutStopPlayback => 'Oynatmayı durdur';

  @override
  String get shortcutNextItem => 'Sonraki öğe';

  @override
  String get shortcutPreviousItem => 'Önceki öğe';

  @override
  String get shortcutSkipSegment => 'Önerildiğinde girişi veya jeneriği atla';

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
  String get videoRenderer => 'Video Oluşturucu';

  @override
  String get videoRendererDescription =>
      'Yerel pencere en akıcı hareketi sağlar ve HDR\'yi ekrana değiştirmeden gönderir. Video düzgün çalışmazsa başka bir seçenek deneyin.';

  @override
  String get videoRendererNativeWindow => 'Yerel pencere (önerilir)';

  @override
  String get videoRendererNativeHdrOnly => 'Yalnızca HDR için yerel pencere';

  @override
  String get videoRendererInApp => 'Uygulama içi (eski)';

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
  String get bookReadingUnavailableTitle => 'Apple TV\'de kitaplar okunamaz';

  @override
  String get bookReadingUnavailableMessage =>
      'Okumak için Moonfin\'i telefonda, tablette veya bilgisayarda açın. Sesli kitaplar burada yine de oynatılır.';

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
  String get premiere => 'Premiere';

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
  String get liveTvJumpToLive => 'Canlıya Atla';

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
    return 'Sonraki dizi kaydı: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'Dizi kaydı zamanlandı, ancak rehberde yaklaşan bölüm yok';

  @override
  String get seriesRecordingSkipsShowing => 'Dizi kaydı bu yayını atlayacak';

  @override
  String get seriesRecordingEpisodesQuestion => 'Hangi bölümler kaydedilsin?';

  @override
  String get seriesRecordingAllEpisodes => 'Tüm Bölümler';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Tekrarlar dahil her yayın';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Daha Önce Kaydedilmemiş Bölümler';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Kütüphanenizde zaten bulunan bölümleri atlar ve her bölümü bir kez kaydeder';

  @override
  String get seriesRecordingNewEpisodesOnly => 'Yalnızca Yeni Bölümler';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'Yalnızca ilk yayınlar, tekrarlar hariç';

  @override
  String get seriesRecordingSettings => 'Dizi Ayarları';

  @override
  String get seriesRecordingUpdated => 'Dizi kaydı güncellendi';

  @override
  String get failedToUpdateSeriesRecording => 'Dizi kaydı güncellenemedi';

  @override
  String get recordCurrentEpisode => 'Bu Bölümü Kaydet';

  @override
  String get recordCurrentProgram => 'Bu Programı Kaydet';

  @override
  String get cancelCurrentRecording => 'Bu Kaydı İptal Et';

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
      'Bu cihaz bu videonun biçimini oynatamıyor. Harici bir oynatıcı deneyin.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Yeniden bağlanılıyor… ($attempt/$total)';
  }

  @override
  String playerMatchingDisplayRate(String fps) {
    return 'Ekran $fps fps ile eşleştiriliyor…';
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
  String get showPosterLabels => 'Poster Etiketleri';

  @override
  String get showPosterLabelsSubtitle =>
      'Posterlerde 4K veya HDR gibi etiketleri göster.';

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
  String get seasonalChristmas => 'Noel';

  @override
  String get seasonalPetals => 'Bahar Çiçekleri';

  @override
  String get seasonalFireflies => 'Ateşböcekleri';

  @override
  String get seasonalHalloween => 'Cadılar Bayramı';

  @override
  String get seasonalDensity => 'Yoğunluk';

  @override
  String get seasonalDensityLight => 'Az';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Yoğun';

  @override
  String get seasonalFollower => 'Odak Takipçisi';

  @override
  String get seasonalFollowerDescription =>
      'Cadılar Bayramı\'ndaki planşet gibi bir bayram öğesi, Ana Sayfa\'da seçtiğiniz öğeyi takip eder';

  @override
  String get seasonalFollowerPointerDescription =>
      'Cadılar Bayramı\'ndaki planşet gibi bir bayram öğesi, Ana Sayfa\'da fare imlecinin yerini alır';

  @override
  String get seasonalRow => 'Mevsimlik Satır';

  @override
  String get seasonalRowDescription =>
      'Kütüphanenizdeki bayram filmlerinden oluşan bir satır gösterir; varsa Seerr önerileri de eklenir.';

  @override
  String get seasonalRowSubtitle => 'Mevsimlik';

  @override
  String get seasonalRowCountry => 'Ülke';

  @override
  String get seasonalRowCountryAuto => 'Otomatik';

  @override
  String get countryUnitedStates => 'Amerika Birleşik Devletleri';

  @override
  String get countryCanada => 'Kanada';

  @override
  String get seasonalRowCountryOther => 'Diğer';

  @override
  String get seasonalRowHolidays => 'Özel Günler';

  @override
  String get seasonalRowHolidaysHint =>
      'Bir özel günün satırını gizlemek için işaretini kaldırın.';

  @override
  String get seasonalRowAllYear => 'Show All Year';

  @override
  String get seasonalRowAllYearDescription =>
      'Show a holiday row outside the holiday dates too, a different ticked holiday each day.';

  @override
  String get holidayNewYear => 'Yılbaşı';

  @override
  String get holidayValentines => 'Sevgililer Günü';

  @override
  String get holidayEaster => 'Paskalya';

  @override
  String get holidayPride => 'Onur Ayı';

  @override
  String get holidayHalloween => 'Cadılar Bayramı';

  @override
  String get holidayThanksgiving => 'Şükran Günü';

  @override
  String get holidayChristmas => 'Noel Filmleri';

  @override
  String get holidayLunarNewYear => 'Ay Yeni Yılı';

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
  String get cropBlackBarsRecropInterval => 'Yeniden Kırpma Aralığı';

  @override
  String get cropBlackBarsOnce => 'Başlangıçta bir kez';

  @override
  String get cropBlackBarsEverySecond => 'Her saniye';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Oynatma sırasında en boy oranı değişikliklerini takip eder.';

  @override
  String get playerRecroppingBlackBars => 'Siyah çubuklar yeniden kırpılıyor';

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
  String get invertGestureIndicators => 'Hareket Göstergelerini Ters Çevir';

  @override
  String get invertGestureIndicatorsDescription =>
      'Parlaklık ve ses seviyesi göstergelerini kaydırma yönüyle ekranın aynı veya karşı tarafına yerleştirin';

  @override
  String get gestureIndicatorSame => 'Aynı';

  @override
  String get gestureIndicatorInverted => 'Ters';

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
  String get detailSections => 'Kısımlar';

  @override
  String get detailSectionsDescription =>
      'Ayrıntılar ekranının hangi kısımlarının gösterileceğini seçin';

  @override
  String get detailSectionsScreenDescription =>
      'Yalnızca geçerli Ayrıntılar ekranı stilinin gösterebildiği kısımlar listelenir. Birini gizlemek, onu içeren tüm stillerde gizler.';

  @override
  String get detailSectionGroupHeader => 'Üst Bilgi';

  @override
  String get detailSectionGroupSections => 'Kısımlar';

  @override
  String get detailSectionGroupPerson => 'Kişi sayfaları';

  @override
  String get detailSectionGroupCollection => 'Koleksiyon sayfaları';

  @override
  String get detailSectionGroupOther => 'Diğer';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle =>
      'Kapalıyken başlığı metin olarak gösterir';

  @override
  String get detailSectionTagline => 'Slogan';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Sürüm rozeti';

  @override
  String get detailSectionUpNext => 'Sıradaki';

  @override
  String get detailSectionLyrics => 'Şarkı Sözleri';

  @override
  String get detailSectionCast => 'Oyuncular';

  @override
  String get detailSectionCastSubtitle =>
      'Koleksiyon sayfalarında da gösterilir';

  @override
  String get detailSectionCrew => 'Yönetmenler ve yazarlar';

  @override
  String get detailSectionStudios => 'Stüdyolar';

  @override
  String get detailSectionChapters => 'Bölümler';

  @override
  String get detailSectionExtras => 'Ekstralar';

  @override
  String get detailSectionCollections => 'Koleksiyonlar';

  @override
  String get detailSectionMoreLikeThis => 'Buna Benzerler';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Benzer albümleri ve sanatçıları da içerir';

  @override
  String get detailSectionMoreEpisodes => 'Diğer bölümler';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'Bölüm sayfalarında';

  @override
  String get detailSectionMediaInfo => 'Medya bilgisi';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'Dosya, akışlar ve Doğrudan Oynatma denetimi';

  @override
  String get detailSectionSeerrGenresTags => 'Türler ve etiketler';

  @override
  String get detailSectionSeerrStats => 'İstatistikler';

  @override
  String get detailSectionSeerrStreaming => 'Yayın hizmetleri';

  @override
  String get seerrStreamingOn => 'Şurada yayınlanıyor';

  @override
  String get detailSectionSeerrRecommendations => 'Öneriler';

  @override
  String get detailSectionSeerrSimilar => 'Benzer yapımlar';

  @override
  String get detailSectionSeerrCollection => 'Koleksiyon afişi';

  @override
  String get detailSectionSeerrPersonAppearances => 'Yer aldığı yapımlar';

  @override
  String get detailSectionSeerrPersonCrew => 'Ekip görevleri';

  @override
  String get detailSectionPersonPagesSubtitle => 'Kişi sayfalarında';

  @override
  String get detailSectionBiography => 'Biyografi';

  @override
  String get detailSectionBirthplace => 'Doğum yeri';

  @override
  String get detailSectionPersonLinks => 'Bağlantılar';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB ve sosyal medya';

  @override
  String get detailSectionGuestAppearances => 'Konuk oyunculuklar';

  @override
  String get detailSectionMusicVideos => 'Müzik videoları';

  @override
  String get detailSectionPlaylistOrder => 'Oynatma listesi sırası';

  @override
  String get detailSectionBookGenres => 'Kitap türleri';

  @override
  String get detailSectionPhotoExif => 'Fotoğraf ayrıntıları';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Sonraki: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Bugün';

  @override
  String get upcomingEpisodeTomorrow => 'Yarın';

  @override
  String get radarrCalendarRow => 'Gelecek Filmler (Radarr)';

  @override
  String get sonarrCalendarRow => 'Gelecek Diziler (Sonarr)';

  @override
  String get mergedCalendarRow => 'Gelecek Yayınlar';

  @override
  String get arrCalendarsRowSubtitle => 'Radarr ve Sonarr Takvimleri';

  @override
  String get radarrCalendarRowSubtitle => 'Radarr Takvimi';

  @override
  String get sonarrCalendarRowSubtitle => 'Sonarr Takvimi';

  @override
  String calendarReleaseIn(int days, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün sonra',
      one: 'Yarın',
      zero: 'Bugün',
    );
    return '$_temp0 ($date)';
  }

  @override
  String get calendarReleaseCinema => 'Sinema';

  @override
  String get calendarReleaseDigital => 'Dijital';

  @override
  String get calendarReleasePhysical => 'Fiziksel';

  @override
  String get upcomingCalendars => 'Gelecek Takvimler';

  @override
  String get upcomingCalendarsDescription =>
      'Radarr/Sonarr Gelecek Takvimlerini Aç/Kapat.';

  @override
  String get enableRadarrCalendar => 'Radarr Gelecek Takvimini Etkinleştir';

  @override
  String get radarrCalendarShowCinema => 'Gelecek Sinema Vizyonlarını Göster';

  @override
  String get radarrCalendarShowDigital => 'Gelecek Dijital Yayınları Göster';

  @override
  String get radarrCalendarShowPhysical => 'Gelecek Fiziksel Yayınları Göster';

  @override
  String get calendarShowReleaseDate => 'Ana Ekranda Yayın Tarihini Göster';

  @override
  String get radarrCalendarHideDownloaded =>
      'Sunucuda Zaten Olan Filmleri Gizle';

  @override
  String get enableSonarrCalendar =>
      'Sonarr\'ın Yaklaşanlar Takvimini Etkinleştir';

  @override
  String get sonarrCalendarShowEpisodeInfo => 'Bölüm Bilgilerini Göster';

  @override
  String get sonarrCalendarHideDownloaded =>
      'Sunucuda Zaten Olan Bölümleri Gizle';

  @override
  String get mergeRadarrSonarrCalendars =>
      'Sonarr ve Radarr Takvimlerini Birleştir';

  @override
  String get moveUp => 'Yukarı Taşı';

  @override
  String get moveDown => 'Aşağı Taşı';

  @override
  String get buttonOrderHint =>
      'Sıralamayı değiştirmek için okları kullanın. Kumandada sol ve sağ tuşları vurgulanan düğmeyi hareket ettirir. Bir düğmeyi kapatmak, onu diğerlerinin altına düşürür.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Yalnızca bir SyncPlay grubundayken gösterilir';

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
  String get transcodeAudioCodecs => 'Ses Codec\'lerini Dönüştür';

  @override
  String get transcodeAudioCodecsDescription =>
      'Sunucu, bu biçimlerdeki sesi olduğu gibi göndermek yerine dönüştürür.';

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
  String get subtitleDownloadLanguages => 'Altyazı İndirme Dilleri';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Altyazı indirirken aranacak diller (en fazla 5). Otomatik, varsayılan altyazı dilinizden veya videodan seçilen tek bir dilde arar.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Tercih Edilen İkincil Altyazı Dili';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Aynı anda ikinci bir altyazı izini gösterir. Altyazı menüsü bu durumda önce birincil mi ikincil mi iz seçileceğini sorar';

  @override
  String get defaultToNoSubtitles => 'Varsayılan olarak Altyazı Yok';

  @override
  String get turnOffSubtitlesByDefault => 'Altyazıları varsayılan olarak kapat';

  @override
  String get subtitleSize => 'Altyazı Boyutu';

  @override
  String get primarySubtitleSlot => 'Birincil İz';

  @override
  String get secondarySubtitleSlot => 'İkincil İz';

  @override
  String get secondarySubtitleTrack => 'İkincil Altyazılar';

  @override
  String get secondaryDelayAdjustment => 'İkincil Gecikme Ayarı';

  @override
  String decreaseValue(String setting) {
    return '$setting değerini azalt';
  }

  @override
  String increaseValue(String setting) {
    return '$setting değerini artır';
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
  String get showLibrariesIndividually => 'Kütüphaneleri Tek Tek Göster';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Her kütüphaneyi, Kütüphaneler menüsü yerine gezinme çubuğunda ayrı bir düğme olarak gösterir';

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
  String get libraryStyle => 'Video Kütüphanesi Stili';

  @override
  String get libraryStyleDescription =>
      'Klasik, simge düğmeli özgün üst bilgidir. Modern, aramayı ve etiketli sırala, grupla ve filtrele düğmelerini tek bir çubukta toplar. Sabit, denetimleri ve harfleri bir yan panele taşır.';

  @override
  String get libraryStyleDescriptionPhone =>
      'Klasik, simge düğmeli özgün üst bilgidir. Modern, aramanın altına etiketli sırala, grupla ve filtrele çipleri ekler. Sabit, denetimleri ekranın altındaki bir çubukta tutar.';

  @override
  String get libraryStyleClassic => 'Klasik';

  @override
  String get libraryStyleModern => 'Modern';

  @override
  String get libraryStyleDocked => 'Sabit';

  @override
  String get bookLibraryStyle => 'Kitap Kütüphanesi Stili';

  @override
  String get bookLibraryStyleDescription =>
      'Klasik, öne çıkan bir başlığın altındaki özgün raflardır. Okuma Odası, okumakta olduklarınızı büyük kartlarla öne çıkarır. Kitapçı, tüm kütüphaneyi ızgarada gösterir.';

  @override
  String get bookLibraryStyleClassic => 'Klasik';

  @override
  String get bookLibraryStyleReadingRoom => 'Okuma Odası';

  @override
  String get bookLibraryStyleBookstore => 'Kitapçı';

  @override
  String get musicLibraryStyle => 'Müzik Kütüphanesi Stili';

  @override
  String get musicLibraryStyleDescription =>
      'Klasik, Kaldığınız Yerden Devam Edin kartının altındaki özgün satırlardır. Hızlı Erişim, son albümlerinizin ve oynatma listelerinizin ızgarasıyla başlar. Sürükleyici, dinlediğiniz albümü öne çıkarır.';

  @override
  String get musicLibraryStyleClassic => 'Klasik';

  @override
  String get musicLibraryStyleQuickAccess => 'Hızlı Erişim';

  @override
  String get musicLibraryStyleImmersive => 'Sürükleyici';

  @override
  String get jumpBackIn => 'Kaldığınız Yerden Devam Edin';

  @override
  String get yourPlaylists => 'Oynatma Listeleriniz';

  @override
  String get fromThisAlbum => 'Bu Albümden';

  @override
  String get searchMusic => 'Müzik Ara';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seri',
      one: '1 seri',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count devam ediyor';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tüm $count başlığa göz at',
      one: '1 başlığa göz at',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Kitaplarda ara';

  @override
  String get libraryShowLabel => 'Göster';

  @override
  String get libraryAToZ => 'A\'dan Z\'ye';

  @override
  String get libraryJumpToLetter => 'Harfe git';

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
  String get libraryOrder => 'Kütüphane Sırası';

  @override
  String get libraryOrderSubtitle => 'Kütüphanelerinizin sırasını seçin';

  @override
  String get libraryOrderDescription =>
      'Kütüphaneleriniz bu sırayla Medyam\'da, son eklenenler satırlarında ve gezinme çubuğunda görünür. Sıra sunucu hesabınıza kaydedilir, bu yüzden oturum açtığınız diğer uygulamalar da bunu kullanır.';

  @override
  String get libraryOrderTvHint =>
      'Vurgulanan kütüphaneyi taşımak için sola veya sağa basın.';

  @override
  String get libraryOrderSaveFailed => 'Kütüphane sırası kaydedilemedi';

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
  String get peekHomeRows => 'Ana Sayfa Satırı Önizlemesi';

  @override
  String get peekHomeRowsDescription =>
      'İlk satırın üst yarısını medya çubuğunun altında gösterir';

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
  String get mediaBarSourceNewReleases => 'Yeni Sezonlar ve Bölümler';

  @override
  String get mediaBarNewReleaseBanner => 'Yeni Yayın Bandı';

  @override
  String get mediaBarNewReleaseBannerDescription =>
      'Yakın zamanda yeni sezonu veya yeni bölümleri yayınlanan dizileri işaretle.';

  @override
  String get mediaBarNewReleaseDays => 'Yeni Yayın Süresi';

  @override
  String get mediaBarNewReleaseDaysDescription =>
      'Bir bölüm yayınlandıktan sonra ne kadar süre yeni sayılacağı.';

  @override
  String get mediaBarNewSeries => 'Yeni Dizi';

  @override
  String get mediaBarNewSeason => 'Yeni Sezon';

  @override
  String get mediaBarNewEpisodes => 'Yeni Bölümler';

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
  String get trailerVolume => 'Fragman Ses Düzeyi';

  @override
  String get trailerVolumeDescription =>
      'Medya çubuğu fragmanlarının ses düzeyi';

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
  String get previewVolume => 'Önizleme Ses Düzeyi';

  @override
  String get previewVolumeDescription =>
      'Kartlardaki medya önizlemelerinin ses düzeyi';

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
  String get continueWatchingDefaultAction => 'Varsayılan Eylem';

  @override
  String get continueWatchingDefaultActionDescription =>
      'İzlemeye Devam Et veya Sıradaki öğesi seçildiğinde ne olacağı';

  @override
  String get goToDetailsScreen => 'Ayrıntılara git';

  @override
  String get playImmediately => 'Hemen oynat';

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
  String get homeRowsGenresAndStudios => 'Türler ve Stüdyolar';

  @override
  String get homeRowsExternalLists => 'Harici Listeler';

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
  String get pinSynced => 'PIN eşitlendi';

  @override
  String get pinResetFailed =>
      'Sunucudaki PIN temizlenemedi. Hâlâ ayarlıysa bir sunucu yöneticisinden kaldırmasını isteyin.';

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
  String get screensaverDuringAudio => 'Show During Music and Audiobooks';

  @override
  String get screensaverDuringAudioDescription =>
      'Let the screensaver start while audio plays, so cover art doesn\'t sit on screen for hours.';

  @override
  String get sleepAfterIdle => 'Let TV Sleep After';

  @override
  String get sleepAfterIdleDescriptionAndroid =>
      'Close Moonfin after this long without a button press so your TV\'s own screensaver and sleep timer can take over. Anything paused is stopped first, so it keeps its resume point.';

  @override
  String get sleepAfterIdleDescriptionAppleTv =>
      'After this long without a button press, hand the screen back to your Apple TV\'s own screensaver and sleep setting. Moonfin stays open, so you pick up right where you left off.';

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
  String get mdblistWatchingNow => 'MDBList\'te İzleniyor';

  @override
  String get mdblistWatchingNowDescription =>
      'MDBList kullanıcılarının şu anda neler izlediğini göster';

  @override
  String watchingNowWatchersCount(int count) {
    return '$count izleyici';
  }

  @override
  String watchingNowLiveSummary(String users, String movies, String shows) {
    return '$users kişi şu an izliyor · $movies film · $shows dizi';
  }

  @override
  String watchingNowLiveSummaryToday(
    String users,
    String movies,
    String shows,
  ) {
    return '$users kişi bugün izledi · $movies film · $shows dizi';
  }

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
  String get moonbaseAddress => 'Moonbase Adresi';

  @override
  String get pluginConnected => 'Bağlı';

  @override
  String pluginConnectedVersion(String version) {
    return 'Bağlı, sürüm $version';
  }

  @override
  String get pluginSyncOn => 'Eşitleme açık';

  @override
  String get pluginSyncOff => 'Eşitleme kapalı';

  @override
  String get syncProfileDescription =>
      'Bu cihaz, başka bir profil seçene kadar seçtiğiniz profille eşitlenir.';

  @override
  String get profileAppliesEverywhere => 'Her yerde geçerli';

  @override
  String get profileOverridesGlobal => 'Genel ayarları geçersiz kılar';

  @override
  String get profileThisDevice => 'Bu cihaz';

  @override
  String get profileLoad => 'Yükle';

  @override
  String get profileLoadSubtitle => 'Sunucudan bu cihaza';

  @override
  String get profileSaveSubtitle => 'Bu cihazdan sunucuya';

  @override
  String resetNamedProfile(String profile) {
    return '$profile Profilini Sıfırla';
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
  String get seerrDiscoverSliders => 'Seerr Keşfet Kaydırıcıları';

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
      'Seerr durumunu uygulama genelinde afişlerde ve sezonlarda göster';

  @override
  String get seerrBadgeStyle => 'Rozet Stili';

  @override
  String get seerrBadgeStyleDescription =>
      'Rozet, Seerr\'in durum noktasını bir köşeye yerleştirir. Bant ise durumu posterin üst kısmı boyunca gösterir.';

  @override
  String get seerrBadgeStyleBadge => 'Rozet';

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
  String get seerrSeriesMatchDescription =>
      'Bu diziyi otomatik olarak eşleştiremedik. Aşağıdan doğru olanı seçin.';

  @override
  String get seerrSeriesNoMatch =>
      'Bu dizi için eşleşme bulamadık, bu nedenle talep edilemiyor.';

  @override
  String get seerrSeriesMatchFailed =>
      'Sonarr bu dizi için eşleşme bulamadı veya Sonarr\'a ulaşılamadı. Tekrar deneyin ya da diziyi Seerr\'de kontrol edin.';

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
      'Canlı TV için Emby Premiere gerekir. Olmadan sunucu kanalları içe aktarmaz ve hiçbir şey kaydetmez.';

  @override
  String get adminPremiereNoteBackups =>
      'Yedekleme ve Geri Yükleme, deneme süresi bittikten sonra Emby Premiere gerektirir.';

  @override
  String get adminGeneralRunAtStartup => 'Sunucuyu başlangıçta çalıştır';

  @override
  String get adminGeneralLaunchWebApp =>
      'Sunucu başladığında web uygulamasını tarayıcıda aç';

  @override
  String get adminGeneralBannerText => 'Ana ekran afiş metni';

  @override
  String get adminGeneralBannerTextHelp =>
      'Her kullanıcıya ana ekranında gösterilir';

  @override
  String get adminGeneralSectionMaintenance => 'Bakım modu';

  @override
  String get adminGeneralMaintenanceMode => 'Sunucuyu bakım moduna al';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Kullanıcılar yalnızca bakım mesajını görür.';

  @override
  String get adminGeneralMaintenanceMessage => 'Bakım mesajı';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Her kullanıcının dilinde genel bir mesaj için boş bırakın.';

  @override
  String get adminGeneralSectionUpdates => 'Otomatik güncellemeler';

  @override
  String get adminGeneralAutoUpdate => 'Sunucuyu otomatik güncelle';

  @override
  String get adminGeneralAutoRestart =>
      'Güncellemeleri uygulamak için otomatik yeniden başlat';

  @override
  String get adminGeneralAutoRestartHelp =>
      'Sunucu yalnızca etkin kullanıcı yokken yeniden başlar.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'Bir sistem olayından sonra ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      '14 günlük ücretsiz denemeden sonra Emby Premiere gerekir';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby, Yedekleme ve Geri Yükleme eklentisiyle yedekleme yapar.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'Yedekleme ve Geri Yükleme eklentisi yüklü değil. Bu sunucuyu yedeklemek için eklenti kataloğundan yükleyin.';

  @override
  String get adminEmbyBackupNow => 'Şimdi yedekle';

  @override
  String get adminEmbyFullBackup => 'Tam yedek';

  @override
  String get adminEmbyLightBackups => 'Veritabanı yedekleri';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return '$name geri yüklensin mi? Bu işlem sunucunun kütüphanelerinin, ayarlarının, kullanıcılarının ve parolalarının yerine geçer ve bittiğinde sunucu kapanır. Sunucuyu kendiniz yeniden başlatmanız gerekebilir.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Sunucu kimliğini geri yükle';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Aynı yedeği birden fazla sunucuya geri yüklüyorsanız bunu kapatın.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'Geri yükleme tamamlandı ve sunucu kapanıyor. Kendiliğinden yeniden başlamazsa elle başlatın.';

  @override
  String get adminHiddenRemotely =>
      'Uzaktan bağlanıldığında oturum açma ekranlarından gizle';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Hiç oturum açmadıkları cihazlardaki oturum açma ekranlarından gizle';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Bu kullanıcının aynı anda kaç video oynatabileceğini sınırlar.';

  @override
  String get adminUnlimited => 'Sınırsız';

  @override
  String get adminAutoRemoteQuality => 'Otomatik uzaktan kalite (Mb/sn)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Oynatıcı otomatik kaliteye ayarlıyken uzaktan kullanılır. Algılanması için boş bırakın.';

  @override
  String get adminAllowCameraUpload => 'Kamera yüklemeye izin ver';

  @override
  String get adminAllowSubtitleDownloading => 'Altyazı indirmeye izin ver';

  @override
  String get adminAllowMediaConversion => 'Medya dönüştürmeye izin ver';

  @override
  String get adminAllowSyncTranscoding =>
      'Dönüştürme gerektiren indirmelere izin ver';

  @override
  String get adminAllowSharingPersonalItems =>
      'Oynatma listelerinin diğer kullanıcılarla paylaşılmasına izin ver';

  @override
  String get adminAllowPreferenceAccess =>
      'Kendi parolasını ve profil resmini değiştirmesine izin ver';

  @override
  String get adminTagMode => 'Etiket modu';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby Connect kullanıcı adı veya e-posta';

  @override
  String get adminEmbyConnectHelp =>
      'Bu kullanıcının sunucu adresini bilmeden herhangi bir Emby uygulamasından oturum açmasını sağlar.';

  @override
  String get adminEmbyConnectLink => 'Bağla';

  @override
  String get adminEmbyConnectUnlink => 'Bağlantıyı kaldır';

  @override
  String get adminEmbyConnectLinked => 'Emby Connect\'e bağlı';

  @override
  String get adminEmbyConnectPending =>
      'Davet gönderildi. Kabul edildiğinde bağlantı kurulur.';

  @override
  String get adminEmbyConnectUnlinked => 'Emby Connect bağlantısı kaldırıldı';

  @override
  String get adminEmbyConnectNotFound =>
      'Bu kullanıcı adına veya e-postaya sahip bir Emby Connect hesabı yok.';

  @override
  String get adminLibImportPlaylists => 'Oynatma listesi dosyalarını içe aktar';

  @override
  String get adminLibExcludeFromSearch => 'Genel aramanın dışında tut';

  @override
  String get adminLibForcedSubtitlesOnly =>
      'Yalnızca zorunlu altyazıları indir';

  @override
  String get adminLibImportCollections =>
      'Koleksiyonları meta veri indiricilerinden içe aktar';

  @override
  String get adminLibThumbnailInterval => 'Önizleme küçük resmi aralığı';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Her $count saniyede bir';
  }

  @override
  String get adminLibThumbnailAtChapters => 'Sahne işaretlerinde';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Önizleme küçük resimlerini medya klasörlerine kaydet';

  @override
  String get adminLibrarySectionMarkers => 'Giriş işaretleri';

  @override
  String get adminLibIntroDetection => 'Girişleri algıla';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Kütüphane taraması sırasında girişleri algıla';

  @override
  String get adminProviderEmbyGuide => 'Emby Rehber Verileri';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Bir kanal listesi seçin. Hiçbiri listelenmediyse posta kodunu kontrol edin. Kanal listeleri için Emby Premiere gerekir.';

  @override
  String get adminLiveTvWakeServer => 'Kayıtlar için sunucuyu uyandır';

  @override
  String get adminDrawerLiveTvChannels => 'Canlı TV Kanalları';

  @override
  String get adminPageDescLiveTvChannels =>
      'Kanalları açıp kapatın ve sıralarını belirleyin';

  @override
  String get adminLiveTvChannelsEmpty =>
      'Henüz kanal yok. Bir tuner kurulup sunucu kanalları içe aktardığında burada görünür.';

  @override
  String get adminTranscodingHwaAdvanced => 'Gelişmiş';

  @override
  String get adminTranscodingHwaHelp =>
      'Gelişmiş, donanım codec\'lerini seçip sıralamanızı sağlar.';

  @override
  String get adminTranscodingHwDecoders =>
      'Tercih edilen donanım kod çözücüleri';

  @override
  String get adminTranscodingHwEncoders =>
      'Tercih edilen donanım kodlayıcıları';

  @override
  String get adminTranscodingTempPathHelp =>
      'Dönüştürücünün çalışma dosyalarını sakladığı yer. Sunucunun veri klasörünü kullanmak için boş bırakın.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Yeterli veri arabelleğe alındığında dönüştürmeyi yavaşlatarak CPU kullanımını düşürür.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Ses aşağı karıştırıldığında ses seviyesini yükseltir. 1, özgün ses seviyesini korur.';

  @override
  String get adminTranscodingFontExtraction =>
      'Anında yazı tipi çıkarmaya izin ver';

  @override
  String get adminTranscodingMaxResolution => 'Maksimum dönüştürme çözünürlüğü';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'Uygulama hangi kaliteyi isterse istesin her dönüştürmede geçerli bir sınır.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Yazılımsal dönüştürmelerde ton eşleme';

  @override
  String get adminTranscodingToneMapHardware =>
      'Donanımsal dönüştürmelerde ton eşleme';

  @override
  String get adminTranscodingToneMapHelp =>
      'HDR videonun dönüştürülürken soluk ve donuk görünmesini önler.';

  @override
  String get adminNetworkingLocalAddress => 'Yerel IP adresi';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'Sunucunun uygulamalara verdiği yerel adres. Otomatik algılaması için boş bırakın.';

  @override
  String get adminNetworkingBehindProxy =>
      'HTTPS bir ters proxy tarafından yönetiliyor';

  @override
  String get adminNetworkingExternalDomain => 'Harici alan adı';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'Uzak bağlantılar için bir alan adı veya dinamik DNS adı; protokol ve bağlantı noktası olmadan. Özel sertifika için gereklidir.';

  @override
  String get adminNetworkingUpnp =>
      'Otomatik bağlantı noktası eşlemeyi etkinleştir';

  @override
  String get adminNetworkingUpnpHelp =>
      'UPnP ile genel bağlantı noktasını yerel bağlantı noktasına eşlemeyi dener. Bazı yönlendiriciler desteklemez.';

  @override
  String get adminNetworkingProxyHeaders =>
      'İstemci adresleri için proxy başlıklarını oku';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Her istemcinin adresini bulmak için X-Forwarded-For gibi başlıkları kullanır. Yalnızca ters proxy arkasında açın.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Yalnızca uzak adres içerdiklerinde';

  @override
  String get adminNetworkingIpv4Only => 'Giden isteklerde IPv4 kullan';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'Meta veri sağlayıcılarına ve diğer hizmetlere IPv6 üzerinden ulaşılamadığı durumlar için.';

  @override
  String get adminOnePerLine => 'Her satıra bir tane';

  @override
  String get adminStreamingStreamLimit => 'Maksimum eşzamanlı video akışı';

  @override
  String get adminStreamingStreamLimitHelp =>
      'Sunucuda aynı anda kaç video oynatılabileceği. 0 sınır olmadığı anlamına gelir.';

  @override
  String get adminSyncJobsConversions => 'Dönüştürme işleri';

  @override
  String get adminSyncJobsDownloads => 'İndirme işleri';

  @override
  String get adminSyncJobsEmpty => 'İş yok';

  @override
  String get adminSyncJobCancel => 'İşi iptal et';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return '$name iptal edilip listeden kaldırılsın mı?';
  }

  @override
  String get adminSyncJobConverting => 'Dönüştürülüyor';

  @override
  String get adminSyncJobReady => 'Aktarıma hazır';

  @override
  String get adminSyncJobTransferring => 'Aktarılıyor';

  @override
  String get adminSyncJobCompletedWithError => 'Hatalarla tamamlandı';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe',
      one: '1 öğe',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Veritabanı';

  @override
  String get adminPageDescDatabase => 'Önbellek boyutu ve bakım';

  @override
  String get adminDatabaseWarning =>
      'Bunlar gelişmiş seçeneklerdir. Değiştirmek için bir nedeniniz yoksa varsayılan değerlerinde bırakın.';

  @override
  String get adminDatabaseCacheSize => 'Veritabanı önbellek boyutu (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'Sunucunun her veritabanı dosyasından ne kadarını bellekte tuttuğu. Daha fazlası sunucuyu hızlandırabilir. Yeniden başlatmadan sonra etkinleşir.';

  @override
  String get adminDatabaseOptimize =>
      'Sunucu kapanırken veritabanını optimize et';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Genellikle bir şey yapmaz, ancak ara sıra sunucunun sorgularına yardımcı olan bir analiz çalıştırır. Kapanış daha uzun sürebilir.';

  @override
  String get adminDatabaseAnalysisLimit => 'Analiz satır sınırı';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'Optimize adımının her dizinden yaklaşık kaç satır okuduğu. Daha fazla satır daha iyi sonuç verir ancak kapanışı yavaşlatabilir.';

  @override
  String get adminDatabaseVacuum =>
      'Veritabanına bir sonraki başlatmada vacuum uygula';

  @override
  String get adminDatabaseVacuumHelp =>
      'Veritabanı dosyasını en az yer kaplayacak şekilde yeniden oluşturur; bu performansa yardımcı olabilir. Çalışırken sunucu kullanılamaz ve ilerleme göstermez, bu yüzden kapanmaya zorlamayın. O başlatmadan sonra kendiliğinden tekrar kapanır.';

  @override
  String get adminDrawerCinemaIntros => 'Sinema Girişleri';

  @override
  String get adminPageDescCinemaIntros =>
      'Oynatmadan önce fragmanlar ve girişler';

  @override
  String get adminCinemaIntrosPlayBefore => 'Girişleri şundan önce oynat';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Yeni ve yaklaşan filmlerin fragmanlarını ekle';

  @override
  String get adminCinemaIntrosOlder => 'Eski filmlerin fragmanlarını ekle';

  @override
  String get adminCinemaIntrosLibrary =>
      'Kütüphanelerimdeki filmlerin fragmanlarını ekle';

  @override
  String get adminCinemaIntrosLibraryHelp =>
      'Yerel fragmanların ayarlanmış olması gerekir.';

  @override
  String get adminCinemaIntrosCount => 'Oynatılacak fragman sayısı';

  @override
  String get adminCinemaIntrosParental => 'Akıllı ebeveyn denetimi';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Yalnızca izlenenle aynı veya daha düşük derecelendirmeye sahip fragmanları seçer.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Girişleri yalnızca izlenmemiş içeriklerden önce oynat';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Yalnızca izlenene benzer fragmanları oynat';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'Ortak türlere, etiketlere, stüdyolara vb. göre belirlenir.';

  @override
  String get adminCinemaIntrosCustom => 'Özel girişler';

  @override
  String get adminCinemaIntrosCustomPath => 'Özel girişler klasörü';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'Videoların bulunduğu bir klasör. Biri rastgele seçilir ve fragmanlardan sonra oynatılır.';

  @override
  String get adminCinemaIntrosCodecPath => 'Codec girişleri klasörü';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'Videoların bulunduğu bir klasör. Dosya adı video codec\'i, ses codec\'i, ses profili veya bir etiketle eşleşen video, ana filmden önce oynatılır.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Şuraya Oynat ve DLNA sunucusu';

  @override
  String get adminDlnaPlayTo => 'DLNA Şuraya Oynat\'ı etkinleştir';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby ağınızdaki cihazları bulabilir ve uzaktan kontrol edebilir.';

  @override
  String get adminDlnaServer => 'DLNA sunucusunu etkinleştir';

  @override
  String get adminDlnaServerHelp =>
      'Sunucunun medyayı DLNA cihazlarına akıtmasını sağlar.';

  @override
  String get adminDlnaDefaultUser => 'Varsayılan kullanıcı';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Bağlı cihazların kimin kütüphanelerini göreceği. Bir cihaz profili bunu geçersiz kılabilir.';

  @override
  String get adminDlnaDebugLog => 'DLNA hata ayıklama günlüğünü etkinleştir';

  @override
  String get adminDlnaDebugLogHelp =>
      'Büyük günlük dosyaları oluşturur. Yalnızca sorun giderirken açın.';

  @override
  String get adminDrawerCameraUpload => 'Kamera Yükleme';

  @override
  String get adminPageDescCameraUpload =>
      'Telefonlardaki fotoğrafların kaydedileceği yer';

  @override
  String get adminCameraUploadPath => 'Kamera yükleme klasörü';

  @override
  String get adminCameraUploadPathHelp =>
      'Varsayılan klasör için boş bırakın. Özel bir klasörün ayrıca kütüphane olarak eklenmesi gerekir.';

  @override
  String get adminCameraUploadSubfolders =>
      'Her cihaz için bir alt klasör oluştur';

  @override
  String get adminDrawerConversions => 'Dönüştürmeler';

  @override
  String get adminPageDescConversions => 'Dönüştürülen medya ve indirmeler';

  @override
  String get adminConversionsTempPath => 'Geçici dosya klasörü';

  @override
  String get adminConversionsTempPathHelp =>
      'Medyanın dönüştürülürken tutulduğu yer.';

  @override
  String get adminConversionsFullSpeed => 'Tam hızda dönüştür';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Dönüştürmeler, yükü düşük tutmak için varsayılan olarak yavaş çalışır.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'Lisans durumu ve anahtar';

  @override
  String get adminPremiereActive => 'Premiere bu sunucuda etkin.';

  @override
  String get adminPremiereInactive => 'Bu sunucuda Premiere anahtarı yok.';

  @override
  String get adminPremiereKeyInvalid =>
      'Bir anahtar ayarlanmış ancak etkin değil. Yanlış yazılmış veya süresi dolmuş olabilir.';

  @override
  String get adminPremiereCurrentKey => 'Geçerli anahtar';

  @override
  String get adminPremiereNewKey => 'Yeni anahtar';

  @override
  String get adminPremiereNewKeyHint =>
      'Emby Premiere e-postanızdaki anahtarı yapıştırın.';

  @override
  String get adminPremiereSaveKey => 'Anahtarı kaydet';

  @override
  String get adminPremiereRemoveKey => 'Anahtarı kaldır';

  @override
  String get adminPremiereKeyRejected =>
      'Emby anahtarı kaydetti ancak kabul etmedi.';

  @override
  String get adminPremiereLoadFailed => 'Premiere durumu yüklenemedi';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere gerekli';

  @override
  String get embyPremiereRequiredBody =>
      'Bunun için sunucuda etkin bir Emby Premiere aboneliği gerekir.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'Bunun için etkin bir Emby Premiere aboneliği gerekir. Emby ayarı saklar ancak Premiere etkin olana kadar kullanmaz.';

  @override
  String get embyPremiereLearnMore => 'Daha fazla bilgi';

  @override
  String get embyPremiereSaveAnyway => 'Yine de kaydet';

  @override
  String get embyPremiereEnterKey => 'Anahtarı gir';

  @override
  String get adminPremiereNote =>
      'Emby Premiere gerekir. Sunucu bu ayarı saklar ancak Premiere etkin olana kadar kullanmaz.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name Kimliği';
  }

  @override
  String get adminExternalIdTypePerson => 'Kişi';

  @override
  String get adminExternalIdTypeArtist => 'Sanatçı';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Albüm Sanatçısı';

  @override
  String get adminExternalIdTypeOtherArtist => 'Diğer Sanatçı';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Sürüm Grubu';

  @override
  String get adminExternalIdTypeBook => 'Kitap';

  @override
  String get adminPlaybackHwAccelWarning =>
      'Donanım hızlandırma bazı sistemlerde kararsız olabilir. İşletim sistemini ve video sürücülerini güncel tutun; video oynatılmayı bırakırsa bunu tekrar Yok olarak ayarlayın.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Meta veri ayarlarındaki değişiklikler yeni içeriğe uygulanır. Mevcut içeriği güncellemek için içeriği ayrıntı sayfasından veya kütüphaneyi yenileyin.';

  @override
  String get adminLibFetcherSettings => 'Getirici ayarları';

  @override
  String adminLibImageOptionsTitle(String type) {
    return '$type için görsel seçenekleri';
  }

  @override
  String get adminLibFetchImages => 'Görselleri getir';

  @override
  String get adminLibMaxBackdrops =>
      'Öğe başına maksimum arka plan görseli sayısı';

  @override
  String get adminLibMinBackdropWidth =>
      'Minimum arka plan görseli indirme genişliği';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Kutu';

  @override
  String get adminImageTypeBoxRear => 'Kutu (arka)';

  @override
  String get adminImageTypeDisc => 'Disk';

  @override
  String get adminImageTypeMenu => 'Menü';

  @override
  String get adminActivityMediaDetails => 'Medya ayrıntıları';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'ör. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Özgün dil';

  @override
  String get adminMetadataFieldDateAdded => 'Eklenme tarihi';

  @override
  String get adminMetadataFieldArtists => 'Sanatçılar';

  @override
  String get adminMetadataFieldAlbumArtists => 'Albüm sanatçıları';

  @override
  String get adminMetadataFieldAlbum => 'Albüm';

  @override
  String get adminMetadataFieldSeriesName => 'Dizi adı';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Bölüm numarası';

  @override
  String get adminMetadataFieldSeasonNumber => 'Sezon numarası';

  @override
  String get adminMetadataFieldTrackNumber => 'Parça numarası';

  @override
  String get adminMetadataFieldDiscNumber => 'Disk numarası';

  @override
  String get adminMetadataFieldAirTime => 'Yayın saati';

  @override
  String get adminMetadataFieldRuntime => 'Süre (dakika)';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Doğum yeri';

  @override
  String get adminMetadataFieldBirthDate => 'Doğum tarihi';

  @override
  String get adminMetadataFieldBirthYear => 'Doğum yılı';

  @override
  String get adminMetadataFieldDeathDate => 'Ölüm tarihi';

  @override
  String get adminMetadataFieldAspectRatio => 'Özgün en boy oranı';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Sezondan önce yayınlanır';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Sezondan sonra yayınlanır';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Bölümden önce yayınlanır';

  @override
  String get adminMetadataNamesHelp =>
      'Birden fazla adı noktalı virgülle ayırın.';

  @override
  String get adminMetadataSectionRatings => 'Derecelendirmeler';

  @override
  String get adminMetadataItemLocked =>
      'Bu öğenin meta verisi kilitli. Tanımlamadan önce kilidini açın.';

  @override
  String get adminMetadataNameOrIdRequired =>
      'Bir ad veya harici kimlik girin.';

  @override
  String get adminLibMetadataReaders => 'Meta veri okuyucuları';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Benzer öğe sağlayıcıları: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Medya bölümü sağlayıcıları';

  @override
  String get adminLibEnableLibrary => 'Kütüphaneyi etkinleştir';

  @override
  String get adminLibEnableLibraryHelp =>
      'Kütüphaneyi devre dışı bırakmak onu tüm kullanıcı görünümlerinden gizler.';

  @override
  String get adminLibSaveLyricsWithMedia =>
      'Şarkı sözlerini medya klasörlerine kaydet';

  @override
  String get adminLibUseCustomTagDelimiters => 'Özel etiket ayırıcı kullan';

  @override
  String get adminLibCustomTagDelimiters => 'Özel etiket ayırıcı';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Etiketleri birbirinden ayıran ayırıcı olarak değerlendirilecek karakterler.';

  @override
  String get adminLibDelimiterWhitelist => 'Ayırıcı beyaz listesi';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Etiket bölmenin dışında bırakılacak öğeler, her satıra bir tane.';

  @override
  String get adminLibDownloadLanguages => 'İndirme dilleri';

  @override
  String get adminLibraryFolderRequired =>
      'Bu kütüphaneye en az bir klasör ekleyin.';

  @override
  String get adminRenameLibraryWarning =>
      'Bir kütüphanenin adını değiştirmek tüm meta verilerini kaybettirir. Dikkatli ilerleyin.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return '\"$name\" kütüphanesi kaldırılsın mı? Diskteki dosyalar silinmez.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'Bu medya konumları kütüphaneden kaldırılacak:';

  @override
  String get adminRefreshMode => 'Yenileme modu';

  @override
  String get adminRefreshModeScan => 'Yeni ve güncellenen dosyaları tara';

  @override
  String get adminRefreshModeMissing => 'Eksik meta verileri ara';

  @override
  String get adminReplaceTrickplayImages =>
      'Mevcut trickplay görsellerini değiştir';

  @override
  String get adminRefreshDialogHelp =>
      'Meta veriler, panoda etkinleştirilen ayarlara ve internet hizmetlerine göre yenilenir.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown / $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuner\'lar ve rehber';

  @override
  String get adminLiveTvTabRecordings => 'Kayıtlar';

  @override
  String get adminLiveTvAddTuner => 'Tuner cihazı ekle';

  @override
  String get adminLiveTvEditTuner => 'Tuner cihazını düzenle';

  @override
  String get adminLiveTvTunerType => 'Tuner türü';

  @override
  String get adminLiveTvDetectDevices => 'Cihazlarımı algıla';

  @override
  String get adminLiveTvNoNewDevices => 'Yeni cihaz bulunamadı';

  @override
  String get adminLiveTvDrmNote => 'DRM\'li kanallar içe aktarılmayacak.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner kaydedildi';

  @override
  String get adminLiveTvDeleteTuner => 'Tuner cihazını sil';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Bu tuner cihazını silmek istediğinizden emin misiniz?';

  @override
  String get adminLiveTvDeleteProvider => 'Rehber sağlayıcısını sil';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Bu rehber sağlayıcısını silmek istediğinizden emin misiniz?';

  @override
  String get adminLiveTvProviderSaved => 'Rehber sağlayıcısı kaydedildi';

  @override
  String get adminLiveTvAddProvider => 'Sağlayıcı ekle';

  @override
  String get adminLiveTvRefreshGuide => 'Rehber verilerini yenile';

  @override
  String get adminLiveTvMapChannels => 'Kanalları eşle';

  @override
  String get adminLiveTvNoTunerChannels => 'Tuner kanalı bulunamadı';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'Bir XMLTV dosyasının yolu veya URL\'si. Sunucu dosyayı okur ve güncellemeleri denetler. Dosyayı oluşturmak ve güncel tutmak sizin sorumluluğunuzdadır.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return '$url adresinde bir hesap oluşturun';
  }

  @override
  String get adminLiveTvSdSignIn => 'Oturum aç';

  @override
  String get adminLiveTvSdLineup => 'Kanal listesi';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Bir kanal listesi seçin. Hiçbiri listelenmediyse kullanıcı adınızı, parolanızı ve posta kodunuzu kontrol edin.';

  @override
  String get adminLiveTvGuideDays => 'İndirilecek rehber verisi gün sayısı';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'Daha fazla gün, daha ileriye zamanlama yapmanıza ve daha fazla yayın görmenize olanak tanır ancak indirme daha uzun sürer. Otomatik, kanal sayısına göre bir değer seçer.';

  @override
  String get adminLiveTvRecordingPath => 'Varsayılan kayıt yolu';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Kayıtların kaydedildiği yer. Boşsa sunucunun program verileri klasörü kullanılır.';

  @override
  String get adminLiveTvStartWhenPossible => 'Mümkün olduğunda başlat';

  @override
  String get adminLiveTvStopWhenPossible => 'Mümkün olduğunda durdur';

  @override
  String get adminLiveTvMinutesBefore => 'dakika önce';

  @override
  String get adminLiveTvMinutesAfter => 'dakika sonra';

  @override
  String get adminLiveTvSectionGuide => 'Rehber verileri';

  @override
  String get adminLiveTvSectionDefaultRecording => 'Varsayılan kayıt ayarları';

  @override
  String get adminLiveTvSectionMetadata => 'Kayıt meta verileri';

  @override
  String adminUserLastActivity(String time) {
    return 'Son etkinlik $time';
  }

  @override
  String get adminCurrentPassword => 'Geçerli parola';

  @override
  String get adminChannelAccess => 'Kanal erişimi';

  @override
  String get adminDeviceAccess => 'Cihaz erişimi';

  @override
  String get adminDeleteFromAllLibraries => 'Tüm kütüphaneler';

  @override
  String get adminUserDisabledBanner =>
      'Bu kullanıcı devre dışı. Yeniden oturum açabilmesi için İzinler altındaki Devre dışı seçeneğini kapatın.';

  @override
  String get adminNewPasswordEmpty => 'Yeni parola boş olamaz';

  @override
  String get adminScheduleStartBeforeEnd =>
      'Başlangıç saati bitiş saatinden önce olmalıdır';

  @override
  String get adminDashboardAlerts => 'Uyarılar';

  @override
  String get adminSessionGoHome => 'Ana ekrana git';

  @override
  String get adminPlayMethodRemux => 'Yeniden paketleme (Remux)';

  @override
  String get adminPlayMethodDirectStream => 'Doğrudan akış';

  @override
  String get adminPlayMethodDirectPlay => 'Doğrudan oynatma';

  @override
  String get adminLogLevelTrace => 'İzleme';

  @override
  String get adminLogLevelDebug => 'Hata ayıklama';

  @override
  String get adminLogLevelInformation => 'Bilgi';

  @override
  String get adminLogLevelWarning => 'Uyarı';

  @override
  String get adminLogLevelError => 'Hata';

  @override
  String get adminLogLevelCritical => 'Kritik';

  @override
  String get adminLogLevelNone => 'Yok';

  @override
  String get adminActivityAllUsers => 'Tüm kullanıcılar';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Son çalışma: $time, süre: $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Başarısız';

  @override
  String get adminTaskResultCancelled => 'İptal edildi';

  @override
  String get adminTaskResultAborted => 'Sunucu kapatıldığı için durduruldu';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '$seconds sn';
  }

  @override
  String get adminDeleteTaskTrigger => 'Görev tetikleyicisini sil';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Bu görev tetikleyicisini silmek istediğinizden emin misiniz?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Her $minutes dakikada bir';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Her $hours saatte bir';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes dakika';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours saat';
  }

  @override
  String get adminTimeLimitHours => 'Zaman sınırı (saat)';

  @override
  String get adminTranscodingDecodingFor =>
      'Şunun için donanımsal çözmeyi etkinleştir';

  @override
  String get adminTranscodingThreadCountHelp =>
      'Bir dönüştürmenin kullanabileceği en fazla iş parçacığı. Daha az iş parçacığı CPU kullanımını düşürür ancak akıcı oynatma için çok yavaş kalabilir.';

  @override
  String get adminTranscodingThreadMax => 'Maks.';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg yolu';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'Sunucunun çalıştırdığı FFmpeg. Burada değil, sunucuda ayarlanır.';

  @override
  String get adminTranscodingAudioSeek => 'Ses arama stratejisi';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'Bir HLS akışında ileri veya geri sardığınızda sunucunun sesi nasıl işleyeceği.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Kopyalanan sesi kırp';

  @override
  String get adminTranscodingTranscodeAudio => 'Sesi dönüştür';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Minimum sesli kitap devam süresi (dakika)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Bu süreden önce bırakılan sesli kitaplar oynatılmamış sayılır.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Devam etmek için sesli kitabın kalan dakikası';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Kalan süresi bundan az olan noktada bırakılan sesli kitaplar oynatılmış sayılır.';

  @override
  String get adminBrandingSplashSection => 'Açılış ekranı';

  @override
  String get adminBrandingSectionWebClient => 'Web istemcisi';

  @override
  String get adminBrandingSplashSizeHint =>
      'Özel görseller 16:9 en boy oranında ve en az 1920x1080 boyutunda olmalıdır.';

  @override
  String get adminNetworkingSectionServerAddress => 'Sunucu adresi ayarları';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS ayarları';

  @override
  String get adminNetworkingSectionRemoteAccess => 'Uzaktan erişim ayarları';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP protokolleri';

  @override
  String get adminNetworkingSectionDiscovery => 'Ağ keşfi';

  @override
  String get adminNetworkingSectionFirewall =>
      'Güvenlik duvarı ve proxy ayarları';

  @override
  String get adminNetworkingLocalHttpPort =>
      'Yerel HTTP bağlantı noktası numarası';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'HTTP sunucusunun TCP bağlantı noktası numarası.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'HTTPS bağlantı noktasını dinler. Bunun etkili olması için geçerli bir sertifika da ayarlanmış olmalıdır.';

  @override
  String get adminNetworkingLocalHttpsPort =>
      'Yerel HTTPS bağlantı noktası numarası';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'HTTPS sunucusunun TCP bağlantı noktası numarası.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Sunucu URL\'sine bir alt dizin ekler, örneğin https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress => 'Yerel ağ adresine bağla';

  @override
  String get adminNetworkingBindAddressHelp =>
      'HTTP sunucusunun yerel IP adresini geçersiz kılar. Tüm adreslere bağlanmak için boş bırakın. Değişiklik için yeniden başlatma gerekir.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'Bant genişliği ve uzaktan erişim sınırları için yerel sayılan ağların IP adresleri veya IP/ağ maskesi girdileri. Tüm RFC1918 adreslerini yerel saymak için boş bırakın.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'Bu sunucunun önündeki proxy\'lerin IP adresleri veya ana bilgisayar adları. X-Forwarded-For başlıklarını okumak için gereklidir. Değişiklik için yeniden başlatma gerekir.';

  @override
  String get adminNetworkingCustomCertPath => 'Özel SSL sertifikası yolu';

  @override
  String get adminNetworkingCertPathHelp =>
      'Özel bir alan adında TLS için sertifika ve özel anahtar içeren bir PKCS #12 dosyasının yolu.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Sertifikanız parola gerektiriyorsa parolayı girin.';

  @override
  String get adminNetworkingAllowRemote =>
      'Bu sunucuya uzaktan bağlantılara izin ver';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'Kapalıyken tüm uzak bağlantılar engellenir.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'Uzak ağların IP adresleri veya IP/ağ maskesi girdileri. Tüm uzak adreslere izin vermek için boş bırakın.';

  @override
  String get adminNetworkingRemoteIpFilterMode => 'Uzak IP adresi filtre modu';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'Yerel HTTP bağlantı noktasına eşlenen genel bağlantı noktası.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'Yerel HTTPS bağlantı noktasına eşlenen genel bağlantı noktası.';

  @override
  String get adminNetworkingAutoDiscoveryLabel => 'Otomatik keşfi etkinleştir';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Uygulamaların bu sunucuyu UDP 7359 bağlantı noktasından bulmasını sağlar.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Dahili ve harici erişim için aynı yayımlanmış sunucu URI\'sini kullan';

  @override
  String get adminNetworkingPublishedUri => 'Yayımlanan sunucu URI\'si';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Sunucunun arayüze veya istemci IP adresine göre verdiği URI\'yi geçersiz kılar.';

  @override
  String get adminNetworkingInternalUri => 'Dahili URI';

  @override
  String get adminNetworkingInternalUriHelp =>
      'Dahili erişim için yayımlanan sunucu URI\'si.';

  @override
  String get adminNetworkingExternalUri => 'Harici URI';

  @override
  String get adminNetworkingExternalUriHelp =>
      'Harici erişim için yayımlanan sunucu URI\'si.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Diğer yayımlanan URI\'ler';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'Tek bir alt ağ veya arayüz için URI\'ler, alt ağ=URI biçiminde yazılır.';

  @override
  String get adminBackupsHelp =>
      'Sunucunuzun anlık görüntülerini oluşturun ve geri yükleyin. Veritabanını, meta verileri, altyazıları ve trickplay görsellerini içerebilirler.';

  @override
  String get adminBackupDisclaimer =>
      'Kütüphanenizin boyutuna bağlı olarak yedekleme biraz zaman alabilir.';

  @override
  String get adminBackupTasksWarningTitle => 'Zamanlanmış görevler çalışıyor';

  @override
  String get adminBackupTasksWarning =>
      'Yedek oluşturmadan önce bu görevleri durdurun veya bitmelerini bekleyin.';

  @override
  String get adminBackupArchiveNotFound => 'Sunucu bu yedek arşivini bulamadı.';

  @override
  String get adminRestoreInProgress => 'Geri yükleme sürüyor';

  @override
  String get adminRestoreWaitingForServer =>
      'Sunucunun geri gelmesi bekleniyor.';

  @override
  String get adminRestoreSucceeded => 'Geri yükleme tamamlandı';

  @override
  String get adminLogWatch => 'İzle';

  @override
  String get adminLogStopWatching => 'İzlemeyi durdur';

  @override
  String get adminPluginInstallConfirmTitle => 'Eklenti kurulumunu onaylayın';

  @override
  String get adminPluginInstallDisclaimer =>
      'Üçüncü taraf bir eklenti kurmak risk taşır. Kararsız veya kötü amaçlı kod içerebilir ve her an değişebilir. Eklentileri yalnızca güvendiğiniz geliştiricilerden kurun ve neler yapabileceklerini bilin; örneğin dış hizmetleri sorgulayabilir, kütüphane taramalarını yavaşlatabilir veya arka plan işleri ekleyebilirler.';

  @override
  String get adminGroupOverview => 'Genel Bakış';

  @override
  String get adminGroupLibrary => 'Kütüphane';

  @override
  String get adminGroupPlayback => 'Oynatma';

  @override
  String get adminGroupPeople => 'Kullanıcılar';

  @override
  String get adminGroupSystem => 'Sistem';

  @override
  String get adminAreasLabel => 'Yönetici alanları';

  @override
  String get adminPagesLabel => 'Sayfalar';

  @override
  String get adminPageDescDashboard =>
      'Sunucu sağlığı, oturumlar ve son etkinlik';

  @override
  String get adminPageDescAnalytics =>
      'Kütüphane boyutları, codec\'ler ve biçimler';

  @override
  String get adminPageDescActivity => 'Sunucuda olan her şey';

  @override
  String get adminPageDescTasks => 'Taramalar, temizlikler ve tetikleyicileri';

  @override
  String get adminPageDescLibraries =>
      'Klasörler, tarayıcılar ve meta veri getiriciler';

  @override
  String get adminPageDescDisplay =>
      'Kütüphanelerin kullanıcılara nasıl gösterildiği';

  @override
  String get adminPageDescMetadata => 'Varsayılan dil, ülke ve görseller';

  @override
  String get adminPageDescNfo => 'Kodi NFO okuma ve kaydetme';

  @override
  String get adminPageDescLiveTv => 'Tuner\'lar, rehber verileri ve kayıtlar';

  @override
  String get adminPageDescTranscoding =>
      'Donanım hızlandırma, kodlayıcılar, ton eşleme';

  @override
  String get adminPageDescResume =>
      'Öğelerin ne zaman başlatılmış veya oynatılmış sayıldığı';

  @override
  String get adminPageDescStreaming => 'Uzak bit hızı sınırı';

  @override
  String get adminPageDescTrickplay =>
      'İleri/geri sarma önizleme küçük resimleri';

  @override
  String get adminPageDescUsers => 'Hesaplar, erişim ve ebeveyn denetimi';

  @override
  String get adminPageDescDevices => 'Oturum açık cihazlar ve adları';

  @override
  String get adminPageDescApiKeys => 'Uygulamalar ve betikler için anahtarlar';

  @override
  String get adminPageDescSettings => 'Sunucu adı, dil, yollar, performans';

  @override
  String get adminPageDescBranding =>
      'Oturum açma mesajı, özel CSS, açılış ekranı';

  @override
  String get adminPageDescNetworking =>
      'Bağlantı noktaları, HTTPS, yerel ağ ve uzaktan erişim';

  @override
  String get adminPageDescPlugins => 'Kurulu eklentiler ve katalog';

  @override
  String get adminPageDescRepositories => 'Eklentilerin geldiği yerler';

  @override
  String get adminPageDescBackups =>
      'Sunucu yedeklerini oluşturun ve geri yükleyin';

  @override
  String get adminPageDescLogs => 'Sunucu günlük dosyaları';

  @override
  String adminSearchSettingsHint(int count) {
    return '$count ayarda ara';
  }

  @override
  String get adminSearchNoResults => 'Eşleşen ayar yok';

  @override
  String get adminSearchClear => 'Aramayı temizle';

  @override
  String get adminUnsavedChanges => 'Kaydedilmemiş değişiklikler';

  @override
  String get adminDiscard => 'Vazgeç';

  @override
  String get adminLeaveTitle =>
      'Kaydedilmemiş değişikliklerden vazgeçilsin mi?';

  @override
  String get adminLeaveMessage =>
      'Bu sayfadaki değişiklikler henüz kaydedilmedi.';

  @override
  String get adminKeepEditing => 'Düzenlemeye devam et';

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
      other: 'katılımcı',
      one: 'katılımcı',
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
  String get syncPlayRepeatSubtitle => 'Replay one item or the whole queue';

  @override
  String get syncPlayRepeatOne => 'Tek Sefer';

  @override
  String get syncPlayShuffleSubtitle => 'Play the queue in order or shuffled';

  @override
  String get syncPlayShuffleModeShuffled => 'Karıştır';

  @override
  String get syncPlayShuffleModeSorted => 'Sıralanmış';

  @override
  String get syncPlayParticipantYou => 'You';

  @override
  String syncPlayGroupSubtitle(String participants, String detail) {
    return '$participants · $detail';
  }

  @override
  String get syncPlayNothingQueued => 'nothing queued yet';

  @override
  String get syncPlayOthersCanJoinHint =>
      'Others can join from their SyncPlay screen while this group exists.';

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
  String get syncPlayCreateGroupSubtitle =>
      'Watch together with everyone who joins';

  @override
  String get syncPlayGroupName => 'Grup adı';

  @override
  String get syncPlayDefaultGroupName => 'SyncPlay Grubum';

  @override
  String get syncPlayCreateGroup => 'Grup oluştur';

  @override
  String get syncPlayAvailableGroups => 'Mevcut gruplar';

  @override
  String syncPlayAvailableGroupsCount(int count) {
    return 'Available groups · $count';
  }

  @override
  String get syncPlayNoGroupsAvailable => 'Grup mevcut değil';

  @override
  String get syncPlayNoGroupsAvailableHint =>
      'Groups other people create on this server will show up here.';

  @override
  String get syncPlayJoinGroupQuestion =>
      'SyncPlay grubuna katılmak ister misiniz?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Bir SyncPlay grubuna katılmak mevcut oynatma sıranızın yerini alabilir. Devam etmek?';

  @override
  String get syncPlayJoinReplacesQueueNote =>
      'Joining a group may replace your current playback queue.';

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
  String get trackActionViewDetails => 'Ayrıntıları Görüntüle';

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
  String get removeFromPlaylist => 'Oynatma Listesinden Kaldır';

  @override
  String removeFromPlaylistConfirm(String item, String playlist) {
    return '$playlist listesinden $item kaldırılsın mı?';
  }

  @override
  String get removeFromPlaylistFailed => 'Oynatma listesinden kaldırılamadı';

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
  String get playerTooltipMinimize => 'Oynatıcıyı küçült';

  @override
  String get miniPlayerOpenPlayer => 'Oynatıcıyı aç';

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
      'Bu sunucunun sertifikasına güvenilmiyor. Kendi sunucunuzsa ve kendinden imzalı veya özel bir sertifika kullanıyorsa buradan izin verebilirsiniz.';

  @override
  String get clientCertTitle => 'İstemci sertifikası';

  @override
  String clientCertHost(String host) {
    return '$host için sertifika';
  }

  @override
  String get clientCertChooseFile => 'Dosya seç';

  @override
  String get clientCertPassword => 'Sertifika parolası';

  @override
  String get clientCertStartUpload => 'Telefondan gönder';

  @override
  String get clientCertUploadHint =>
      'Bu kodu telefonunuzla tarayın veya adresi telefonunuzun tarayıcısında açın, ardından dosyayı seçip parolasını girin.';

  @override
  String get clientCertStopUpload => 'Beklemeyi durdur';

  @override
  String get clientCertNoFileData => 'Dosya okunamadı. Tekrar deneyin.';

  @override
  String get clientCertPickFailed => 'Dosya seçici açılamadı.';

  @override
  String get clientCertUploadFailed =>
      'Yükleme sayfası başlatılamadı. Tekrar deneyin.';

  @override
  String get clientCertNoSecureStorage =>
      'Bu cihazda güvenli depolama yok, bu yüzden sertifika kaydedilemiyor. Linux\'ta libsecret\'i kurup tekrar deneyin.';

  @override
  String get clientCertDecodeFailed =>
      'Bu dosya sertifika olarak okunamadı. Dosyanın .p12 veya .pfx olduğundan emin olun.';

  @override
  String get clientCertWrongPassword =>
      'Bu parola sertifikanın kilidini açmıyor.';

  @override
  String get clientCertRequired =>
      'Bu sunucu bir istemci sertifikası (mTLS) gerektiriyor. Devam etmek için bu ana bilgisayar için bir tane ekleyin.';

  @override
  String clientCertExpired(String date) {
    return 'Bu sunucunun sertifikasının süresi $date tarihinde doldu. Devam etmek için sertifikayı değiştirin.';
  }

  @override
  String get clientCertAddButton => 'İstemci sertifikası ekle';

  @override
  String get settingsClientCertificates => 'İstemci sertifikaları';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Bu uygulamanın sertifika isteyen sunuculara (mTLS) sunduğu sertifikalar';

  @override
  String get clientCertSubject => 'Konu';

  @override
  String clientCertExpires(String date) {
    return '$date tarihinde sona erer';
  }

  @override
  String get clientCertReplace => 'Değiştir';

  @override
  String get clientCertAdd => 'Sertifika ekle';

  @override
  String get clientCertAddHostPrompt =>
      'Hangi sunucu ana bilgisayarı için sertifika gerekiyor?';

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
  String get settingsDateFormat => 'Tarih Formatı';

  @override
  String get settingsDateFormatDescription =>
      'Takvim ve çıkış tarihleri için ay-gün, gün-ay veya yerel ayar varsayılanı arasında seçim yapın';

  @override
  String get dateFormatSystem => 'Yerel Varsayılan';

  @override
  String get dateFormatMonthDay => 'Ay / Gün (10 Kas)';

  @override
  String get dateFormatDayMonth => 'Gün / Ay (10 Kas)';

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
  String get settingsRedetectDisplay => 'Ekranı yeniden algıla';

  @override
  String get settingsRedetectDisplayDescription =>
      'TV\'ye hangi HDR biçimlerini desteklediğini tekrar sorar. TV veya alıcı geç açıldıktan sonra Dolby Vision veya HDR10 içerikler dönüştürülüyorsa bunu kullanın.';

  @override
  String get settingsDisplayIsSdr => 'TV\'m HDR değil';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Bu ekran için HDR desteği bildirmeyi durdurur. Yalnızca algılama, TV\'nizin gösteremediği HDR\'yi sürekli bildiriyorsa kullanın.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Ekran yeniden algılandı: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'HDR biçimi algılanmadı';

  @override
  String get settingsDisplayMarkedSdr => 'Ekran SDR olarak kaydedildi';

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
  String get settingsHideControlsAfter => 'Hide Controls After';

  @override
  String get settingsHideControlsAfterDescription =>
      'How long the player controls stay on screen after your last button press, tap or mouse move.';

  @override
  String get settingsHdrControlsDimming => 'Dim Controls in HDR';

  @override
  String get settingsHdrControlsDimmingDescription =>
      'White looks far brighter next to HDR video, so the player controls dim by this much while it plays.';

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
      'HDR10+\'lı Dolby Vision\'ı HDR10+ olarak oynat';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Hem Dolby Vision hem HDR10+ içeren videolardan Dolby Vision katmanını çıkarır. Bu videolar sesli ama siyah ekranla oynatılıyorsa bunu açın.';

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
  String get libraryCardTitles => 'Posterlerin Altında Başlıklar';

  @override
  String get libraryCardTitlesDescription =>
      'Kütüphane ızgaralarında her öğenin başlığını ve ayrıntılarını görselinin altında gösterir.';

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
  String get modernCardsOnMyMediaRow => 'Medyam satırında modern kartlar';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Odaklanınca genişleyen, özelleştirilebilir posterleri gösterir. Her zaman yatay küçük resim göstermek için kapatın.';

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
  String get sinceYouWatched => 'İzlediğiniz İçin';

  @override
  String get sinceYouWatchedRowTitle => 'İzlediğiniz için';

  @override
  String sinceYouWatchedItemRowTitle(String title) {
    return '\"$title\" izlediğiniz için';
  }

  @override
  String sinceYouWatchedRowNumber(int number) {
    return 'İzlediğiniz İçin Satırı $number';
  }

  @override
  String get displaySinceYouWatchedRows =>
      'İzlediğiniz İçin Satırlarını Göster';

  @override
  String get displaySinceYouWatchedRowsSubtitle =>
      'İzlediğiniz İçin satırlarını Ana Ekran Bölümleri\'nde göster ve özelleştir.';

  @override
  String get sinceYouWatchedSource => 'Öneri Kaynağı';

  @override
  String get sinceYouWatchedSourceDescription =>
      'Öneri kaynağını seçin (Moonfin Önerileri: özel yerel algoritma, Jellyfin Önerileri: sunucu motoru veya TMDb\'nin benzerlik ölçütleri. Not: Çevrimiçi öneriler Seerr entegrasyonu gerektirir).';

  @override
  String get sinceYouWatchedSourceLocal => 'Moonfin Önerileri';

  @override
  String get sinceYouWatchedSourceServer => 'Jellyfin Önerileri';

  @override
  String get sinceYouWatchedSourceOnline => 'TMDb Benzerliği';

  @override
  String get sinceYouWatchedSourceType => 'Kaynak Tipi';

  @override
  String get sinceYouWatchedSourceTypeDescription =>
      'Önerilecek öğelerin tipini seçin';

  @override
  String get sinceYouWatchedSourceItem => 'Kaynak Öğe';

  @override
  String get sinceYouWatchedSourceItemDescription =>
      'Önerilerin hangi öğeye göre yapılacağını seçin';

  @override
  String get sinceYouWatchedRecentlyWatched => 'Son İzlenenler';

  @override
  String get sinceYouWatchedNumRows => 'Eklenecek Satır Sayısı';

  @override
  String get sinceYouWatchedNumRowsDescription =>
      'Kaç tane İzlediğiniz İçin satırı gösterileceğini seçin (1-5)';

  @override
  String get sinceYouWatchedIncludeWatched => 'Daha Önce İzlenenleri Dahil Et';

  @override
  String get sinceYouWatchedIncludeWatchedSubtitle =>
      'Önerilere izlenmiş öğeleri de dahil et';

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
  String get sorting => 'Sıralama';

  @override
  String get imdbRowsSorting => 'IMDb Satırı Sıralaması';

  @override
  String get imdbRowsSortingDescription =>
      'IMDb satırlarını ada, yayın tarihine, derecelendirmeye ve daha fazlasına göre sıralayın.';

  @override
  String get imdbRowsSortOrderDescription =>
      'IMDb satırlarını artan veya azalan düzende sıralayın.';

  @override
  String get tmdbRowsSorting => 'TMDB Satırı Sıralaması';

  @override
  String get tmdbRowsSortingDescription =>
      'TMDB satırlarını ada, yayın tarihine, derecelendirmeye ve daha fazlasına göre sıralayın.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'TMDB satırlarını artan veya azalan düzende sıralayın.';

  @override
  String get seerrRowsSorting => 'Seerr Satırı Sıralaması';

  @override
  String get seerrRowsSortingDescription =>
      'Seerr satırlarını ada, yayın tarihine, derecelendirmeye ve daha fazlasına göre sıralayın.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Seerr satırlarını artan veya azalan düzende sıralayın.';

  @override
  String get externalRowSortDefault => 'Varsayılan (liste sırası)';

  @override
  String get externalRowSortName => 'Ad';

  @override
  String get externalRowSortReleaseDate => 'Yayın Tarihi';

  @override
  String get externalRowSortRating => 'Derecelendirme';

  @override
  String get externalRowSortPopularity => 'Popülerlik';

  @override
  String get externalRowSortShuffle => 'Karıştır';

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
  String get locallyDecodedCodecs => 'Yerel Olarak Çözülen Codec\'ler';

  @override
  String get transcodeTargetCodecs => 'Dönüştürme Hedefi Codec\'leri';

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
  String get hevcSoftwareDirectPlay =>
      'HEVC\'yi Doğrudan Oynat (Yazılımsal Çözme)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'HEVC\'yi, sunucudan dönüştürmesini istemek yerine özgün dosyadan 1080p\'ye kadar oynatır. Bu Apple TV onu yazılımla çözer, bu yüzden ağır 10 bit veya yüksek bit hızlı dosyalarda takılma olabilir.';

  @override
  String get av1SoftwareUhdDirectPlay =>
      '4K AV1\'i Doğrudan Oynat (Yazılımsal Çözme)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      '1080p üzerindeki AV1\'i (HDR10 dahil), sunucudan dönüştürmesini istemek yerine özgün dosyadan oynatır. Bu cihaz AV1\'i yazılımla çözer, bu yüzden ağır 4K veya yüksek bit hızlı dosyalarda takılma olabilir.';

  @override
  String get cadenceSlowdown => '60 Hz TV\'de Akıcı 24 fps';

  @override
  String get cadenceSlowdownSubtitle =>
      'Kare Hızı Eşleştirme kapalıyken 24 fps videoyu %0,1 daha yavaş oynatır; böylece video TV\'ye kare atlamadan uyum sağlar. Ses bir AV alıcıya doğrudan aktarılıyorsa kullanılmaz.';

  @override
  String get cadenceTipTitle => 'Kare Hızını Eşleştirmeyi Açın';

  @override
  String get cadenceTipMessage =>
      'Bu video, TV\'nizin mevcut yenileme hızında akıcı oynatılamıyor. Apple TV\'nizde Ayarlar > Video ve Ses > İçeriği Eşleştir yolunu izleyin ve Kare Hızını Eşleştir seçeneğini açın.';

  @override
  String get cadenceTipSlowdownHint =>
      'Ya da Moonfin\'de Oynatma > Kalite ve Kod Çözme altındaki 60 Hz TV\'de Akıcı 24 fps seçeneğini açın.';

  @override
  String get useExternalPlayer => 'Her Zaman Harici Oynatıcı Kullan';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV\'de video oynatmayı seçtiğiniz harici uygulamada açın.';

  @override
  String get externalPlayerLiveTvOnly => 'Yalnızca Canlı TV';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Harici oynatıcıyı Canlı TV için kullanın, diğer her şeyi yerleşik oynatıcıda tutun.';

  @override
  String get automaticQueuing => 'Otomatik Sıraya Ekleme';

  @override
  String get preferSdhSubtitles => 'SDH Altyazıları Tercih Et';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Otomatik seçim yaparken SDH/CC altyazı parçalarına öncelik ver.';

  @override
  String get preferTextSubtitles => 'Metin Altyazılarını Tercih Et';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Metin tabanlı altyazılara (SRT, VTT) görsel tabanlı biçimlerden (PGS, VobSub) öncelik verir.';

  @override
  String get preferExternalSubtitles => 'Harici Altyazıları Tercih Et';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Harici altyazı dosyalarına gömülü izlerden öncelik verir.';

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
  String get personWebsite => 'Resmî web sitesi';

  @override
  String get watchWithGroup => 'Grupça İzle';

  @override
  String get watchPartyGroupSubtitles => 'Herkes için altyazılar';

  @override
  String get watchPartyOwnSubtitles => 'Herkesin kendi seçimi';

  @override
  String get watchPartyLobby => 'Lobide';

  @override
  String get watchPartyUpNextLabel => 'Sıradaki';

  @override
  String get watchPartyRoomSettings => 'Oda ayarları';

  @override
  String get watchPartyCodeOrLink => 'Oda kodu veya davet bağlantısı';

  @override
  String get watchPartyCopyInvite => 'Davet bağlantısını kopyala';

  @override
  String get watchPartyInviteCopied => 'Davet bağlantısı kopyalandı';

  @override
  String get watchPartyLetEveryoneVote => 'Filmler için herkes oy verebilsin';

  @override
  String get watchPartyVoteHelp =>
      'Herkesin oy vermesi için film ekleyin, sonra istediğinizi oynatın. Dizi bölümlerini yine siz seçersiniz.';

  @override
  String get watchPartyGuestVoteHelp =>
      'İzlemek istediğinize oy verin. Oda sahibi birini oynatır.';

  @override
  String get watchPartySearchMovies => 'Film ara';

  @override
  String get watchPartyNoSuggestions => 'Henüz oylanacak film yok.';

  @override
  String get watchPartySuggested => 'İzleme Partisi oylamasına eklendi';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oy',
      one: '$count oy',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => 'İzleme Partisi';

  @override
  String get watchPartyUnavailable => 'Bu sunucu İzleme Partisi sunmuyor.';

  @override
  String get watchPartyRoomCode => 'Oda kodu';

  @override
  String get watchPartyStart => 'İzleme Partisi başlat';

  @override
  String get watchPartyPickTitle =>
      'Herkesin ne izleyeceğini seçmek için bir başlığı açın ve Grupla izle\'yi seçin.';

  @override
  String get watchPartyWaitingForHost =>
      'Oda sahibinin bir şey seçmesi bekleniyor.';

  @override
  String get watchPartyShareCode =>
      'Diğerleri bu kodla kendi İzleme Partisi ekranlarından katılır.';

  @override
  String get watchPartyReconnecting => 'Yeniden bağlanılıyor...';

  @override
  String get watchPartyOffline => 'çevrimdışı';

  @override
  String get watchPartyStartForEveryone => 'Herkes için başlat';

  @override
  String watchPartyResumeAt(String time) {
    return '$time noktasından devam et';
  }

  @override
  String get watchPartyStartFromBeginning => 'Baştan başlat';

  @override
  String watchPartyResumeWhere(String name) {
    return '$name kişisinin kaldığı yer; buradaki herkesin ulaştığı en erken nokta.';
  }

  @override
  String get watchPartyResumeEarliest =>
      'Buradaki herkesin ulaştığı en erken nokta.';

  @override
  String get watchPartyResumeYours =>
      'Where you left off. Everyone starts from there.';

  @override
  String watchPartyResumeNotStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kişi henüz izlemeye başlamadı.',
      one: '1 kişi henüz izlemeye başlamadı.',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyBackToLobby => 'Lobiye dön';

  @override
  String get watchPartyGuestsCanPause => 'Konuklar oynatıp duraklatabilir';

  @override
  String get watchPartyEnd => 'İzleme Partisini bitir';

  @override
  String get watchPartyEnded => 'İzleme Partisi sona erdi.';

  @override
  String get watchPartyStaged => 'İzleme Partisi için seçildi';

  @override
  String watchPartyUpNext(String title) {
    return 'Sıradaki: $title';
  }

  @override
  String get watchParties => 'Watch Parties';

  @override
  String get watchPartyStartWith => 'Start parties with';

  @override
  String get watchPartyServiceMoonbaseHint =>
      'Chat, reactions and voting. Runs on Moonbase.';

  @override
  String get watchPartyServiceSyncPlayHint =>
      'Jellyfin\'s own. Friends on other Jellyfin apps can join.';

  @override
  String get watchPartyServiceNote =>
      'You can join rooms of both kinds. This only picks what you start.';

  @override
  String get watchPartyDuringParty => 'During a party';

  @override
  String get watchPartyChatOverlay => 'Show chat over the video';

  @override
  String get watchPartyChatOverlaySubtitle =>
      'New messages show for a few seconds';

  @override
  String get watchPartyAlerts => 'Party alerts';

  @override
  String get watchPartyAlertsSubtitle =>
      'Tell me when someone on this server starts one';

  @override
  String get watchPartyJoinWithCode => 'Join with a code';

  @override
  String get watchPartyOnThisServer => 'On this server';

  @override
  String watchPartyCountOnServer(int count) {
    return '$count on this server';
  }

  @override
  String get watchPartyRoomsHint =>
      'You need access to the item to join. A room closes when its last person leaves.';

  @override
  String get watchPartyRoomsEmpty =>
      'Parties you can watch show up here. Got a code from someone? Pick Join with a code.';

  @override
  String get watchPartyPasteHint =>
      'Pasting an invite link here works too. On a phone, the link opens Moonfin straight into the party.';

  @override
  String watchPartyWatchingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count watching',
      one: '$count watching',
    );
    return '$_temp0';
  }

  @override
  String watchPartyHostsParty(String name) {
    return '$name\'s party';
  }

  @override
  String get watchPartyEveryoneControlsShort => 'Everyone controls';

  @override
  String get watchPartyVotingNow => 'Voting on what to watch';

  @override
  String get watchPartyNeedsMoonbase =>
      'Watch Parties need Moonbase on this server';

  @override
  String get watchPartyNeedsMoonbaseHint =>
      'Ask whoever runs the server to install the Moonbase plugin. On Jellyfin, SyncPlay still works without it.';

  @override
  String get watchPartyWrongPin => 'That PIN didn\'t work. Try again.';

  @override
  String get watchPartyTooManyTries => 'Too many tries. Wait a minute.';

  @override
  String get watchPartyFull => 'This party is full.';

  @override
  String get watchPartyNoSuchCode => 'No room has that code.';

  @override
  String get watchPartyNoAccess =>
      'You don\'t have access to what they\'re watching.';

  @override
  String get watchPartyRemoved => 'The host removed you from the party.';

  @override
  String get watchPartyYours => 'Your watch party';

  @override
  String get watchPartyInviteHint =>
      'Paste it in any chat. It opens a page on this server with an Open in Moonfin button.';

  @override
  String get watchPartySendInvite => 'Send the invite';

  @override
  String get watchPartyScanInvite =>
      'Scan with your phone to get the invite link, then send it from there. Or just share the code.';

  @override
  String get watchPartyStartsTogether =>
      'Play waits for everyone\'s player, 10 seconds at most, then counts down 3, 2, 1.';

  @override
  String get watchPartyStatusInSync => 'In sync';

  @override
  String get watchPartyStatusCatchingUp => 'Catching up';

  @override
  String get watchPartyStatusBuffering => 'Buffering';

  @override
  String get watchPartyStatusNotWatching => 'Not watching';

  @override
  String get watchPartyStatusReady => 'Ready';

  @override
  String get watchPartyStatusJoining => 'Joining';

  @override
  String get watchPartyHost => 'Host';

  @override
  String watchPartyWaitingFor(String name) {
    return 'Waiting for $name\'s player';
  }

  @override
  String watchPartyWaitingForCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Waiting for $count players',
      one: 'Waiting for $count player',
    );
    return '$_temp0';
  }

  @override
  String watchPartyStartingAnyway(int seconds) {
    return 'Starting anyway in $seconds s';
  }

  @override
  String get watchPartyStartingTogether => 'Starting together';

  @override
  String watchPartyToastPaused(String name) {
    return '$name paused';
  }

  @override
  String watchPartyToastResumed(String name) {
    return '$name resumed';
  }

  @override
  String watchPartyToastSkipped(String name, String time) {
    return '$name skipped to $time';
  }

  @override
  String watchPartyToastJoined(String name) {
    return '$name joined';
  }

  @override
  String watchPartyToastLeft(String name) {
    return '$name left';
  }

  @override
  String watchPartyToastSwitched(String name, String title) {
    return '$name switched to $title';
  }

  @override
  String get watchPartyToastYouAreHost => 'You\'re the host now';

  @override
  String watchPartyToastNewHost(String name) {
    return '$name is the host now';
  }

  @override
  String get watchPartyToastEveryoneControls =>
      'Everyone can control playback now';

  @override
  String get watchPartyToastHostControls =>
      'Only the host controls playback now';

  @override
  String get watchPartyOnlyHostControls =>
      'Only the host can control playback.';

  @override
  String get watchPartyToastReconnecting => 'Reconnecting to the party...';

  @override
  String get watchPartyToastReconnected => 'Back in the party';

  @override
  String watchPartyToastEnded(String name) {
    return '$name ended the party';
  }

  @override
  String get watchPartyChat => 'Chat';

  @override
  String get watchPartySendToParty => 'Send to the party';

  @override
  String get watchPartyBackToClose => 'Back to close';

  @override
  String get watchPartyType => 'Type';

  @override
  String get watchPartyReplyHaha => 'Haha';

  @override
  String get watchPartyReplyNoWay => 'No way';

  @override
  String get watchPartyReplyPausePlease => 'Pause please';

  @override
  String get watchPartyReplyBrb => 'Brb';

  @override
  String get watchPartyReplyAgain => 'Again!';

  @override
  String get watchPartyReactionLove => 'Love';

  @override
  String get watchPartyReactionHaha => 'Haha';

  @override
  String get watchPartyReactionWow => 'Wow';

  @override
  String get watchPartyReactionSad => 'Sad';

  @override
  String get watchPartyReactionFire => 'Fire';

  @override
  String get watchPartyReactionPopcorn => 'Popcorn';

  @override
  String get watchPartyMakeHost => 'Make host';

  @override
  String get watchPartyEveryoneControls => 'Everyone can control playback';

  @override
  String get watchPartyEveryoneControlsHint =>
      'Anyone can play, pause and skip';

  @override
  String get watchPartyRoomPin => 'Room PIN';

  @override
  String get watchPartyRoomPinHint => 'Ask for a PIN before anyone joins';

  @override
  String get watchPartyPinDigits => '4 to 8 digits';

  @override
  String get watchPartyLeave => 'Leave';

  @override
  String watchPartyLeaveHandsOver(String name) {
    return 'Leave · $name hosts';
  }

  @override
  String watchPartyStartedBy(String name) {
    return '$name started a watch party';
  }

  @override
  String watchPartyInLobbyCount(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$title · $count in the lobby',
      one: '$title · $count in the lobby',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyFirstOnHome => 'It\'s first in Watch Parties on Home';

  @override
  String watchPartyAddServerQuestion(String address) {
    return 'This invite is for a server you have not added yet, $address. Add it and sign in to join.';
  }

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Tarayıcıda Aç';

  @override
  String get achievementBadges => 'Başarım Rozetleri';

  @override
  String get achievementBadgesSubtitle =>
      'İzlediklerinizle kazandığınız rozetler, rütbeler ve görevler';

  @override
  String get achievementsBadges => 'Rozetler';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked / $total rozet';
  }

  @override
  String get achievementsUnlockToasts => 'Kilit Açma Bildirimleri';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Bir rozetin kilidini açtığınızda bildirim gösterir';

  @override
  String get achievementsUnlockedNotification => 'Başarım kazanıldı';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count başarım kazanıldı',
      one: '$count başarım kazanıldı',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count tane daha';
  }

  @override
  String get achievementsQuests => 'Görevler';

  @override
  String achievementsQuestCount(int count) {
    return '$count tamamlandı';
  }

  @override
  String get achievementsLeaderboard => 'Lider Tablosu';

  @override
  String get achievementsLeaderboardSubtitle =>
      'Bu sunucudaki diğer kullanıcılarla nasıl kıyaslandığınız';

  @override
  String get achievementsRecap => 'Özet';

  @override
  String get achievementsRecapSubtitle => 'Son zamanlarda izledikleriniz';

  @override
  String get achievementsLibraryCompletion => 'Kütüphane tamamlama';

  @override
  String achievementsLibraryCount(int count) {
    return '$count kütüphane';
  }

  @override
  String achievementsScore(int score) {
    return '$score puan';
  }

  @override
  String get achievementsScoreLabel => 'Skor';

  @override
  String get achievementsTopRank => 'En yüksek rütbeye ulaşıldı';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$tier için $points puan kaldı';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days günlük seri';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'En iyi: $days gün';
  }

  @override
  String get achievementsShowcase => 'Vitrin';

  @override
  String get achievementsUnlocked => 'Kilidi açık';

  @override
  String get achievementsLocked => 'Kilitli';

  @override
  String get achievementsNothingHere => 'Henüz burada bir şey yok.';

  @override
  String get achievementsHiddenBadge => 'Gizli başarım';

  @override
  String achievementsUnlockedOn(String date) {
    return '$date tarihinde açıldı';
  }

  @override
  String achievementsPoints(int points) {
    return '$points puan';
  }

  @override
  String get achievementsDailyQuests => 'Günlük';

  @override
  String get achievementsWeeklyQuests => 'Haftalık';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Günlük görevleri yenile';

  @override
  String get achievementsRerollWeekly => 'Haftalık görevleri yenile';

  @override
  String get achievementsRerollOffer => 'Bu seti farklı bir setle değiştirin';

  @override
  String get achievementsRerollSpentDaily =>
      'Bugün kullanıldı, UTC gece yarısı geri gelir';

  @override
  String get achievementsRerollSpentWeekly =>
      'Bu hafta kullanıldı, UTC Pazartesi geri gelir';

  @override
  String get achievementsRerollConfirm => 'Bu görevler yenilensin mi?';

  @override
  String get achievementsRerollConfirmBody =>
      'Bir günlük ve bir haftalık yenileme hakkınız var; bu işlem birini harcar.';

  @override
  String get achievementsRerollFailed => 'Görevler yenilenemedi.';

  @override
  String get achievementsSuggested => 'Önerilen izlenecekler';

  @override
  String get achievementsNoSuggestions =>
      'Bu rozet için önerilecek bir şey yok.';

  @override
  String get achievementsProgressLabel => 'İlerleme';

  @override
  String get achievementsLoadout => 'Envanter';

  @override
  String get achievementsLoadoutSubtitle =>
      'Harcanacak skor ve sahip olduğunuz güçlendiriciler';

  @override
  String get achievementsAppearance => 'Görünüm';

  @override
  String get achievementsAppearanceSubtitle => 'Profilinizdeki avatar ve unvan';

  @override
  String get achievementsAvatars => 'Avatarlar';

  @override
  String get achievementsTitles => 'Unvanlar';

  @override
  String get achievementsEquipped => 'Kullanımda';

  @override
  String get achievementsOwned => 'Sahip olunan';

  @override
  String achievementsEarnedAt(int score) {
    return 'Toplam $score skorda kazanılır';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'Bu sunucuda kullanılabilecek avatar veya unvan yok.';

  @override
  String get achievementsAppearanceFailed => 'Profil görünümü değiştirilemedi.';

  @override
  String get achievementsPowerUps => 'Güçlendiriciler';

  @override
  String get achievementsStats => 'İstatistikler';

  @override
  String get achievementsStatsSubtitle => 'Rekorlarınız ve sunucunun durumu';

  @override
  String get achievementsStatsWatched => 'İzlenenler';

  @override
  String get achievementsStatsBests => 'En İyiler';

  @override
  String get achievementsStatsHabits => 'Alışkanlıklar';

  @override
  String get achievementsStatsVariety => 'Çeşitlilik';

  @override
  String get achievementsStatsServer => 'Bu sunucu';

  @override
  String get achievementsStatsClock => 'Ne zaman izliyorsunuz';

  @override
  String get achievementsStatItems => 'İzlenen öğeler';

  @override
  String get achievementsStatMovies => 'İzlenen filmler';

  @override
  String get achievementsStatSeries => 'Bitirilen diziler';

  @override
  String get achievementsStatHours => 'İzlenen saat';

  @override
  String get achievementsStatDays => 'İzlenen gün';

  @override
  String get achievementsStatRewatches => 'Tekrar izlemeler';

  @override
  String get achievementsStatBestWatchStreak => 'En iyi izleme serisi';

  @override
  String get achievementsStatBestLoginStreak => 'En iyi oturum açma serisi';

  @override
  String get achievementsStatMostEpisodes => 'Bir günde en çok bölüm';

  @override
  String get achievementsStatMostMovies => 'Bir günde en çok film';

  @override
  String get achievementsStatLongestItem => 'En uzun tek öğe';

  @override
  String get achievementsStatBestCombo => 'En iyi kombo';

  @override
  String get achievementsStatLateNight => 'Gece geç saat oturumları';

  @override
  String get achievementsStatEarlyMorning => 'Sabah erken oturumları';

  @override
  String get achievementsStatWeekend => 'Hafta sonu oturumları';

  @override
  String get achievementsStatDaysSignedIn => 'Oturum açılan gün';

  @override
  String get achievementsStatLibraries => 'Ziyaret edilen kütüphane';

  @override
  String get achievementsStatGenres => 'İzlenen tür';

  @override
  String get achievementsStatDecades => 'İzlenen on yıl';

  @override
  String get achievementsStatCountries => 'İzlenen ülke';

  @override
  String get achievementsStatLanguages => 'İzlenen dil';

  @override
  String get achievementsStatUsers => 'Kullanıcılar';

  @override
  String get achievementsStatBadgesUnlocked => 'Açılan rozetler';

  @override
  String get achievementsStatScoreEarned => 'Kazanılan skor';

  @override
  String get achievementsStatCommonBadge => 'En yaygın rozet';

  @override
  String get achievementsActivity => 'Etkinlik';

  @override
  String get achievementsActivitySubtitle =>
      'Sunucuda son zamanlarda açılanlar';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user, $badge rozetini açtı';
  }

  @override
  String get achievementsShop => 'Mağaza';

  @override
  String get achievementsShopSubtitle =>
      'Skorunuzu daha fazla güçlendiriciye harcayın';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Şu anda satışta bir şey yok.';

  @override
  String get achievementsBuyConfirm => 'Satın alınsın mı?';

  @override
  String get achievementsBuyConfirmBody =>
      'Doğrudan skor bakiyenizden düşülür.';

  @override
  String get achievementsBuyFailed => 'Satın alınamadı.';

  @override
  String get achievementsScoreBank => 'Skor bakiyesi';

  @override
  String get achievementsBoost => 'XP Güçlendirici';

  @override
  String get achievementsBoostBody =>
      'Skoru bir saat boyunca ikiye katlar. Tekrar kullanmak saati yeniden başlatır.';

  @override
  String get achievementsDoubleCredit => 'Çift Kredi';

  @override
  String get achievementsDoubleCreditBody =>
      'Bitirdiğiniz bir sonraki öğe rozetler için iki kez sayılır.';

  @override
  String get achievementsStreakFreeze => 'Seri Koruması';

  @override
  String get achievementsStreakFreezeBody =>
      'Kaçırılan bir günü karşılar. Yalnızca bir tane biriktirilebilir.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tane var',
      one: '1 tane var',
      zero: 'Hiç yok',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Şu an etkin';

  @override
  String get achievementsUsePowerUp => 'Bu güçlendirici kullanılsın mı?';

  @override
  String get achievementsUsePowerUpBody => 'Onayladığınız anda harcanır.';

  @override
  String get achievementsPowerUpFailed => 'Güçlendirici kullanılamadı.';

  @override
  String get achievementsHours => 'Saat';

  @override
  String get achievementsStreak => 'Seri';

  @override
  String get achievementsPeriodWeek => 'Hafta';

  @override
  String get achievementsPeriodMonth => 'Ay';

  @override
  String get achievementsPeriodYear => 'Yıl';

  @override
  String achievementsDaysWatched(int count) {
    return '$count gün izlendi';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count rozet kazanıldı';
  }

  @override
  String get achievementsTopDirectors => 'En çok izlenen yönetmenler';

  @override
  String get achievementsTopActors => 'En çok izlenen oyuncular';

  @override
  String get achievementsLoadFailed => 'Başarımlarınız yüklenemedi.';

  @override
  String get friends => 'Arkadaşlar';

  @override
  String get friendsSubtitle =>
      'Kimlerin çevrimiçi olduğunu görün ve bu sunucudaki kişilerle sohbet edin';

  @override
  String get friendsShowButton => 'Arkadaşlar Düğmesini Göster';

  @override
  String get friendsShowButtonSubtitle =>
      'Başarım Rozetleri eklentisinden arkadaşlar ve sohbet';

  @override
  String get friendsMessages => 'Mesajlar';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count okunmamış mesaj',
      one: '1 okunmamış mesaj',
      zero: 'Okunmamış mesaj yok',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Arkadaşlık istekleri';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sizi $count istek bekliyor',
      one: 'Sizi 1 istek bekliyor',
      zero: 'Bekleyen yok',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Arkadaş ekle';

  @override
  String get friendsAddSubtitle => 'Bu sunucudaki kişileri bulun';

  @override
  String get friendsPrivacy => 'Gizlilik';

  @override
  String get friendsPrivacySubtitle => 'Arkadaşlarınızın görebildikleri';

  @override
  String get friendsOnline => 'Çevrimiçi';

  @override
  String get friendsOffline => 'Çevrimdışı';

  @override
  String get friendsNone =>
      'Henüz arkadaş yok. Burada görmek için bu sunucudan kişiler ekleyin.';

  @override
  String friendsWatching(String title) {
    return '$title izliyor';
  }

  @override
  String friendsLastWatched(String title) {
    return 'En son $title izledi';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Son görülme: $time';
  }

  @override
  String get friendsLoadFailed =>
      'Yüklenemedi. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get friendsActionFailed =>
      'Bu işlem olmadı. Biraz sonra tekrar deneyin.';

  @override
  String get friendsIncoming => 'Sizi bekleyenler';

  @override
  String get friendsOutgoing => 'Sizin gönderdikleriniz';

  @override
  String get friendsNoRequests => 'Arkadaşlık isteği yok.';

  @override
  String get friendsAccept => 'Kabul et';

  @override
  String get friendsDecline => 'Reddet';

  @override
  String get friendsCancelRequest => 'İsteği iptal et';

  @override
  String friendsRequestFrom(String name) {
    return '$name arkadaş olmak istiyor';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return '$name kişisine gönderdiğiniz istek geri çekilsin mi?';
  }

  @override
  String get friendsSearchHint => 'Kişi ara';

  @override
  String get friendsNoMatches => 'Bu ada uyan kimse yok.';

  @override
  String friendsRequestSent(String name) {
    return '$name kişisine istek gönderildi';
  }

  @override
  String get friendsSendRequest => 'Arkadaş olarak ekle';

  @override
  String get friendsSendMessage => 'Mesaj gönder';

  @override
  String friendsOpenItem(String title) {
    return '$title aç';
  }

  @override
  String get friendsRemove => 'Arkadaşlıktan çıkar';

  @override
  String friendsRemoveBody(String name) {
    return '$name arkadaşlarınızdan çıkarılsın mı? Daha sonra tekrar ekleyebilirsiniz.';
  }

  @override
  String get friendsBlock => 'Engelle';

  @override
  String get friendsUnblock => 'Engeli kaldır';

  @override
  String friendsBlockBody(String name) {
    return '$name engellensin mi? İkiniz de birbirinize doğrudan mesaj gönderemezsiniz. Ortak olduğunuz grup sohbetleri açık kalır.';
  }

  @override
  String friendsUnblockBody(String name) {
    return '$name kişisinin engeli kaldırılsın mı?';
  }

  @override
  String get friendsBlocked => 'Engellenen kullanıcılar';

  @override
  String friendsProfileHidden(String name) {
    return '$name profilini gizli tutuyor.';
  }

  @override
  String get friendsAppearOffline => 'Çevrimdışı Görün';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Arkadaşlar sizi her zaman çevrimdışı görür';

  @override
  String get friendsHideNowPlaying => 'İzlediğimi Gizle';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Arkadaşlar sizi çevrimiçi görmeye devam eder ancak ne oynattığınızı göremez';

  @override
  String get friendsHideLastWatched => 'Son İzlediğimi Gizle';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Arkadaşlar, çevrimdışıyken en son ne izlediğinizi görmez';

  @override
  String get friendsMessageNotifications => 'Mesaj Bildirimleri';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Bir arkadaşınız size mesaj gönderdiğinde afiş gösterir';

  @override
  String get friendsMuteDuringPlayback => 'Oynatma Sırasında Sessize Al';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'Video veya oyun oynatılırken mesaj afişi gösterilmez';

  @override
  String get friendsSaveFailed => 'Ayarlarınız kaydedilemedi.';

  @override
  String get chatNew => 'Yeni mesaj';

  @override
  String get chatNewSubtitle => 'Bir arkadaşınızla sohbet başlatın';

  @override
  String get chatNewGroup => 'Yeni grup';

  @override
  String get chatNewGroupSubtitle =>
      'Birkaç arkadaşınızla aynı anda sohbet edin';

  @override
  String get chatNone => 'Henüz mesaj yok.';

  @override
  String get chatYou => 'Siz';

  @override
  String chatYouSaid(String text) {
    return 'Siz: $text';
  }

  @override
  String get chatPhoto => 'Fotoğraf';

  @override
  String get chatEmoji => 'Emoji';

  @override
  String get chatEmojiSearch => 'Emoji ara';

  @override
  String get chatNoRecentEmoji => 'Son kullanılan emoji yok';

  @override
  String get chatViewPhoto => 'Fotoğrafı görüntüle';

  @override
  String get chatHint => 'Bir mesaj yazın';

  @override
  String get chatAttach => 'Fotoğraf gönder';

  @override
  String get chatEdited => 'düzenlendi';

  @override
  String get chatSeen => 'Görüldü';

  @override
  String get chatSent => 'Gönderildi';

  @override
  String get chatEditing => 'Mesaj düzenleniyor';

  @override
  String get chatMessageOptions => 'Mesaj seçenekleri';

  @override
  String get chatDeleteBody => 'Bu mesaj herkes için silinsin mi?';

  @override
  String get chatClear => 'Sohbeti temizle';

  @override
  String get chatClearBody =>
      'Bu sohbetteki tüm mesajlar, sohbetteki herkes için silinsin mi?';

  @override
  String get chatGroupInfo => 'Grup bilgisi';

  @override
  String get chatGroupName => 'Grup adı';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count üye',
      one: '1 üye',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Sahip';

  @override
  String get chatAdmin => 'Yönetici';

  @override
  String get chatMakeAdmin => 'Yönetici yap';

  @override
  String get chatRemoveAdmin => 'Yöneticiliği kaldır';

  @override
  String get chatRemoveMember => 'Gruptan çıkar';

  @override
  String get chatAddMember => 'Kişi ekle';

  @override
  String get chatNobodyToAdd => 'Eklenecek kimse kalmadı.';

  @override
  String get chatLeave => 'Gruptan ayrıl';

  @override
  String get chatLeaveBody =>
      'Bu gruptan ayrılsın mısınız? Tekrar katılmak için birinin sizi yeniden eklemesi gerekir.';

  @override
  String get chatCreate => 'Grup oluştur';

  @override
  String get chatPickMembers => 'En az iki arkadaş seçin';

  @override
  String chatNewMessageFrom(String name) {
    return '$name kişisinden yeni mesaj';
  }

  @override
  String get chatImageTooLarge => 'Bu görsel 8 MB\'tan büyük.';

  @override
  String get chatImageUnsupported =>
      'Yalnızca PNG, JPEG, GIF ve WebP görseller gönderilebilir.';

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
  String get analyticsLibraryShare => 'Kütüphaneye göre öğe payı';

  @override
  String get analyticsTopRating => 'En yaygın derecelendirme';

  @override
  String get analyticsTypicalRuntime => 'Tipik süre';

  @override
  String analyticsShareOfItems(String percent) {
    return '%$percent oranında öğe';
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
  String get audiobookFullTimeline => 'Tam Zaman Çizelgesi';

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
    return 'Eklenme Tarihi: $date';
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
    return 'Ses codec\'i ($codec) doğrudan desteklenmiyor.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'İpucu: Ses alıcınız veya soundbar\'ınız $codec codec\'ini destekliyorsa Ses ayarlarında Ses Passthrough\'u etkinleştirin.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Ses kanalı sayısı ($channels kanal) oynatıcı sınırını aşıyor.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'İpucu: Ses ayarlarında \'Maksimum Ses Kanalı\' değerini veya çok kanallı aşağı karıştırmayı ayarlayın.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'Doğrudan oynatma kapalı olduğundan ASS/SSA altyazıları dönüştürme gerektirir.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'İpucu: Dönüştürme olmadan doğrudan oynatmak için Oynatma ayarlarında \'ASS/SSA Doğrudan Oynatma\'yı etkinleştirin.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'Doğrudan oynatma kapalı olduğundan PGS altyazıları dönüştürme gerektirir.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'İpucu: Dönüştürme olmadan doğrudan oynatmak için Oynatma ayarlarında \'PGS Doğrudan Oynatma\'yı etkinleştirin.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Altyazı biçimi ($codec) doğrudan desteklenmiyor ve videoya gömülmesi gerekiyor.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'Dosya bit hızı ($fileBitrate), yapılandırılan akış sınırını ($maxBitrate) aşıyor.';
  }

  @override
  String get transcodeBitrateHint =>
      'İpucu: Doğrudan akışa izin vermek için Oynatma ayarlarında \'Maksimum Bit Hızı\'nı artırın.';

  @override
  String get transcodeResolutionHint =>
      'İpucu: Doğrudan akışa izin vermek için Oynatma ayarlarında \'Maksimum Çözünürlük\'ü artırın.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Video dinamik aralığı (ör. Dolby Vision / HDR) bu ekran tarafından desteklenmiyor.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Dolby Vision Profil 7 geliştirme katmanı için doğrudan oynatma devre dışı.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'İpucu: Ekranınız destekliyorsa Oynatma ayarlarında \'Dolby Vision Profil 7 Doğrudan Oynatma\'yı etkinleştirin.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Kullanıcı ayarlarına göre Dolby Vision yedeği için dönüştürme tercih ediliyor.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'İpucu: Dönüştürmeyi önlemek için Oynatma ayarlarında \'Dolby Vision Yedeği\'ni \'HDR10 olarak oynat\' yapın.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Bağlı ekran HDR veya Dolby Vision desteği bildirmiyor.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Bağlı ekranda Dolby Vision yedeği için gereken HDR10 desteği yok.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Ses örnekleme hızı desteklenmiyor.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Ses bit derinliği desteklenmiyor.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Video referans kareleri oynatıcı sınırlarını aşıyor.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Anamorfik video desteklenmiyor.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Örgülü (interlaced) video desteklenmiyor.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'İkincil ses akışı dönüştürme gerektirir.';

  @override
  String get transcodeDirectPlayError =>
      'Bu medya biçimi için doğrudan oynatma desteklenmiyor.';

  @override
  String get sortServerOrder => 'Sunucu Sırası';

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
    return 'Sırala: $option';
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
  String get playlistTypeMusicVideo => 'Müzik Videosu';

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
  String get musicVideoPlaylistsSection => 'Müzik Videosu Oynatma Listeleri';

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
  String get currentTime => 'Geçerli Saat';

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
  String get libraryFolderView => 'Klasör Görünümü';

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
  String get subtitleBold => 'Bold Text';

  @override
  String get subtitleStrokeWidth => 'Text Stroke Width';

  @override
  String get subtitleFont => 'Font';

  @override
  String get subtitleFontDescription =>
      'Fonts are downloaded from Google Fonts the first time you pick them';

  @override
  String subtitleFontDownloadFailed(String font) {
    return 'Couldn\'t download $font';
  }

  @override
  String get subtitleShadow => 'Text Shadow';

  @override
  String get subtitleShadowIntensity => 'Shadow Intensity';

  @override
  String get subtitleShadowOffset => 'Shadow Offset';

  @override
  String get subtitleShadowBlur => 'Shadow Blur';

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
  String get hideHomeWatchProgress => 'İzleme İlerlemesini Gizle';

  @override
  String get hideHomeWatchProgressSubtitle =>
      'İzlemeye başladığınız posterlerdeki ilerleme çubuğunu gizler.';

  @override
  String get hideHomeUnwatchedCount => 'İzlenmemiş Sayısını Gizle';

  @override
  String get hideHomeUnwatchedCountSubtitle =>
      'İzlenecek kaç bölüm kaldığını gösteren rozeti gizler.';

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
  String get setupPlaybackLanguages => 'Oynatma dilleri';

  @override
  String get setupOptional => 'İsteğe bağlı';

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
      'Önce ana görsel, oyuncular ve ekstralar için açılır kartlarla.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Tam ekran, sekmeler yerine alt alta dizilmiş kısımlarla.';

  @override
  String get setupStyleMinimalist => 'Minimalist';

  @override
  String get setupDetailMinimalistHint =>
      'Görsel, tek bir oynat düğmesi ve bölümler.';

  @override
  String get setupStyleStage => 'Sahne';

  @override
  String get setupDetailStageHint =>
      'Öndeki afiş, altında oynat düğmesi ve yanında detaylarıyla.';

  @override
  String get setupStylePremiere => 'Premiere';

  @override
  String get setupDetailPremiereHint =>
      'Başlık tam ekran arka plan üzerinde ortalanmış, diğer her şey sayfanın alt kısmında.';

  @override
  String get setupStyleQuickLook => 'Hızlı Bakış';

  @override
  String get setupDetailQuickLookHint =>
      'Bulunduğunuz ekranın üzerinde açılan, oynatma düğmesini ve temel bilgileri içeren bir panel. Tam sayfa tek bir basışla açılır.';

  @override
  String get setupStyleFrost => 'Buzlu Cam';

  @override
  String get setupDetailFrostHint =>
      'Başlık, bulanıklaştırılmış kapak görselinin üzerinde cam bir pencerede yer alır; sekmeler düğmelerin altındadır.';

  @override
  String get setupNavbarStyleQuestion => 'Alt çubuk nasıl görünsün?';

  @override
  String get setupNavbarStyleDockHint =>
      'Her sekmenin altında etiketler bulunan yüzen bir hap.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Arama kendi düğmesine sahip olur ve çubuk kaydırırken küçülür.';

  @override
  String get setupNavbarStyleStripHint =>
      'Alt kenar boyunca tam genişlikte bir çubuk.';

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
    return 'Adım $current / $total';
  }

  @override
  String get setupCurrent => 'Geçerli';

  @override
  String get setupMoonbaseTitle => 'Sunucunuza Moonbase ekleyin';

  @override
  String get setupMoonbaseHint =>
      'Moonfin\'in daha fazla özelliğinin kilidini açan ücretsiz bir sunucu eklentisi';

  @override
  String get setupMoonbaseIntro =>
      'Moonbase ücretsizdir ve sunucunuzda çalışır. Moonbase ile Moonfin şunları kazanır:';

  @override
  String get setupMoonbaseAskAdmin =>
      'Yalnızca sunucu yöneticisi kurabilir. Bu bağlantıyı ona gönderin.';

  @override
  String get setupMoonbaseManualSteps =>
      'Sunucunuza kurmak birkaç adım sürer. Tüm adımlar bu bağlantıda.';

  @override
  String get setupMoonbaseInstalling => 'Moonbase kuruluyor...';

  @override
  String get setupMoonbaseInstalled =>
      'Moonbase kuruldu. Sunucu yeniden başlatıldığında etkinleşir; bu da şu anda oynatılan her şeyi durdurur.';

  @override
  String get setupMoonbaseRestarting =>
      'Sunucu yeniden başlatılıyor. Moonbase, sunucu tekrar açıldığında etkinleşecek.';

  @override
  String get moonbaseFeatureSync =>
      'Cihazlarınız arasında senkronize edilen ayarlar';

  @override
  String get moonbaseFeatureRatings => 'Ek puanlar ve TMDB yorumları';

  @override
  String get moonbaseFeatureRows => 'Favori listelerinizden özel satırlar';

  @override
  String get moonbaseFeatureGames =>
      'Kayıtları senkronize edilen retro oyunlar';

  @override
  String get moonbaseFeatureCalendar => 'Yakında gelecek içeriklerin takvimi';

  @override
  String get moonbaseFeatureCollections =>
      'Her koleksiyon için kendi sıralamanız';

  @override
  String get moonbaseFeatureMessages => 'Sunucu yöneticinizden mesajlar';

  @override
  String setupMoonbaseInstallFailed(String error) {
    return 'Moonbase kurulamadı. $error';
  }

  @override
  String get setupTvHint =>
      'Önizlemek için yukarı/aşağı · Seçmek için Tamam · Atlamak için iki kez Geri';

  @override
  String get setupNavbarTopHint => 'Ekranın üstünde sekmeler.';

  @override
  String get setupNavbarLeftHint => 'Sol tarafta ince bir simge şeridi.';

  @override
  String get setupNavbarBottomHint =>
      'Başparmağınızın rahat erişebileceği şekilde alt kenarda sekmeler.';

  @override
  String get setupMediaBarMoonfinHint =>
      'Başlığın, ayrıntıların ve özetin üzerine bindirildiği büyük görsel.';

  @override
  String get setupMediaBarMakdHint =>
      'Büyük bir başlık logosunun öne çıktığı büyük görsel.';

  @override
  String get setupMediaBarBookshelfHint =>
      'Başlıklar kitap sırtı gibi dizilir, öne çıkan başlık ise cildi dönük durur.';

  @override
  String get setupMediaBarGalleryHint =>
      'Öne çıkan başlık açılır, sıradaki birkaç başlık yanında dizilir.';

  @override
  String get setupMediaBarBannerHint =>
      'Satırlarınızın üstünde daha kısa bir afiş; böylece ekrana daha fazla satır sığar.';

  @override
  String get setupMediaBarAyaHint =>
      'Önce çerçeveli bir panelde görsel, hemen altında satırlarınız.';

  @override
  String get setupMediaBarOffHint =>
      'Öne çıkan alan yok. Ana Sayfa doğrudan satırlarınızla açılır.';

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
  String get showBookDiscoverTab => 'Kitap Kütüphanesi Keşfini Göster';

  @override
  String get showBookDiscoverTabDescription =>
      'Kitap ve sesli kitap kütüphanelerinizde Open Library ve LibriVox başlıklarına göz atın';

  @override
  String get bookFoldersAsSeries => 'Treat book folders as series';

  @override
  String get bookFoldersAsSeriesDescription =>
      'Treat folders containing books as series instead of relying on the individual books\' metadata';

  @override
  String get autoDownloadNewEpisodes => 'Yeni bölümleri otomatik indir';

  @override
  String get autoDownloadStop => 'Otomatik indirmeyi durdur';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Yeni bölümleri indirir, aynı anda en fazla $count izlenmemiş',
      one: 'Yeni bölümleri indirir, aynı anda en fazla 1 izlenmemiş',
      zero: 'Her yeni bölümü indirir',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'Açık • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Dönüştürülmüş kaliteler yalnızca Moonfin açıkken iner. Özgün kalite arka planda da iner.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Dönüştürülmüş indirmeler kesintiden sonra devam edemez ve baştan başlar. Özgün kalite devam edebilir.';

  @override
  String get autoDownloadForegroundOnly => 'Yalnızca Moonfin açıkken indirir';

  @override
  String get autoDownloadQualityTitle => 'Otomatik indirme kalitesi';

  @override
  String autoDownloadEnabledFor(String title) {
    return '$title için otomatik indirme etkinleştirildi';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return '$title için otomatik indirme durduruldu';
  }

  @override
  String get smartDownloadsSection => 'Akıllı indirmeler';

  @override
  String get smartDownloadsEnable => 'Sonraki Bölümleri İndir';

  @override
  String get smartDownloadsEnableDescription =>
      'Herhangi bir cihazda bir bölümü bitirdiğinizde Moonfin sonrakileri indirir. İndirdiği bölümler izlendikten sonra silinir.';

  @override
  String get smartDownloadsKeepReady => 'İndirilmiş Tutulacak Bölümler';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sonraki $count bölümü indirilmiş tutar',
      one: 'Sonraki bölümü indirilmiş tutar',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Zaten indirilen bölümler cihazınızda kalır. Yeni sayı gelecekteki indirmeler için geçerlidir.';

  @override
  String get autoDownloadSection => 'Otomatik indirmeler';

  @override
  String get autoDownloadEnable => 'Otomatik İndirmeleri Etkinleştir';

  @override
  String get autoDownloadEnableSubtitle =>
      'Takip ettiğiniz dizilerin yeni bölümlerini indirir. Mevcut bölümler yine elle indirilebilir.';

  @override
  String get autoDownloadKeepUnwatched => 'İzlenmemiş Bölümleri Tut';

  @override
  String get autoDownloadKeepAll => 'Tümü';

  @override
  String get autoDownloadDelete => 'İndirilen Bölümleri Sil';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'Takip ettiğiniz diziler için indirilen bölümlerin, izledikten sonra ne zaman kaldırılacağı';

  @override
  String get removeWatchedDownloads => 'İzlenen İndirmeleri Kaldır';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'Kendi indirdiğiniz bölüm ve filmlerin ne zaman kaldırılacağı. Yalnızca bunu açtıktan sonra izlediğiniz öğeler kaldırılır';

  @override
  String get removeWatchedAsk => 'Ask me';

  @override
  String get deleteFinishedDownloadTitle => 'Delete this download?';

  @override
  String deleteFinishedDownloadMessage(String title) {
    return 'You finished $title. Delete its download to free up space, or keep it and stop asking.';
  }

  @override
  String get notNow => 'Not Now';

  @override
  String get keepDownloaded => 'İndirilmiş Tut';

  @override
  String get keepDownloadedSubtitle =>
      'İzledikten sonra bunu asla otomatik olarak kaldırma';

  @override
  String get autoDownloadDeleteNever => 'Asla';

  @override
  String get autoDownloadDeleteImmediately => 'İzledikten hemen sonra';

  @override
  String get autoDownloadDeleteAfterDay => 'İzledikten 1 gün sonra';

  @override
  String get autoDownloadDeleteAfterWeek => 'İzledikten 1 hafta sonra';

  @override
  String get autoDownloadBackgroundRefresh => 'Arka Planda Kontrol Et';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Moonfin kapalıyken sistemin yeni bölümleri düzenli olarak kontrol etmesine izin verin';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Moonfin için Arka Planda Uygulama Yenileme devre dışı. iOS Ayarları\'ndan etkinleştirin.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Moonfin için arka plan kullanımı Android Ayarları\'nda kısıtlanmış.';

  @override
  String get autoDownloadCheckNow => 'Şimdi Kontrol Et';

  @override
  String get autoDownloadChecking => 'Kontrol ediliyor...';

  @override
  String get autoDownloadNeverChecked => 'Henüz kontrol edilmedi';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued bölüm sıraya alındı',
      one: '1 bölüm sıraya alındı',
      zero: 'yeni bir şey yok',
    );
    return 'Son kontrol $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Son kontrol $when başarısız oldu: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Takip edilen diziler';

  @override
  String get autoDownloadNoSubscriptions =>
      'Bir dizi açın ve indirme menüsünden \"Yeni bölümleri otomatik indir\" seçeneğini seçin';

  @override
  String get autoDownloadRemove => 'Takibi bırak';

  @override
  String get autoDownloadStorageFull => 'Yeterli depolama alanı yok';

  @override
  String get autoDownloadWaitingForWifi => 'WiFi bekleniyor';

  @override
  String get downloadNotificationRunning => 'İndiriliyor';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'İndiriliyor ($done/$total)';
  }

  @override
  String downloadNotificationProgress(String name, int percent) {
    return '$name — %$percent';
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
      other: 'İndirmeler tamamlandı',
      one: 'İndirme tamamlandı',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name çevrimdışı kullanım için kaydedildi';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe çevrimdışı kullanım için kaydedildi',
      one: '1 öğe çevrimdışı kullanım için kaydedildi',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bölüm',
      one: '1 bölüm',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'İndirme başarısız oldu';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Uzak mesaj';

  @override
  String get serverMessagesNotificationReceived => 'Mesaj alındı';

  @override
  String get downloadStorageLimitReached =>
      'Depolama sınırına ulaşıldı. Yer açın veya sınırı artırın.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Yeterli depolama alanı yok: $needed gerekli, $free boş';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Yeni bölümler için yeterli depolama alanı yok';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bölüm yer bekliyor.',
      one: '$name için $size gerekiyor.',
    );
    return '$_temp0 Yer açın veya indirme sınırını yükseltin.';
  }

  @override
  String get pageTransitions => 'Sayfa Geçişleri';

  @override
  String get pageTransitionsSubtitle =>
      'Sayfalar arasında gezinirken solma süresini ayarlar';

  @override
  String get navigationSpeed => 'Gezinme Hızı';

  @override
  String get navigationSpeedSubtitle =>
      'Odak göstergesinin öğeler ve satırlar arasında ne kadar hızlı hareket ettiğini ayarlar';

  @override
  String get modernCardsTransitionSpeed => 'Modern Kart Geçiş Hızı';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Odaklanan modern kartlar genişlerken animasyon hızını ayarlar';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Hızlı Kaydırmada Kart Genişlemesini Geciktir';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Modern kartları genişletmeden önce odak hareketinin durmasını bekler';

  @override
  String get animationSpeedExtraSlow => 'Çok Yavaş';

  @override
  String get animationSpeedSlow => 'Yavaş';

  @override
  String get animationSpeedMedium => 'Orta';

  @override
  String get animationSpeedFast => 'Hızlı';

  @override
  String get animationSpeedOff => 'Kapalı';

  @override
  String get pageTransitionFadeNone => 'Solma Yok';

  @override
  String get pageTransitionFadeShort => 'Kısa Solma';

  @override
  String get pageTransitionFadeMedium => 'Orta Solma';

  @override
  String get pageTransitionFadeLong => 'Uzun Solma';

  @override
  String get siriRemoteSwipeSensitivity =>
      'Dokunmatik Yüzey Kaydırma Hassasiyeti';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'Siri Remote dokunmatik yüzeyindeki her kaydırmada odağın ne kadar ilerlediği';

  @override
  String get appleTvHomeScreen => 'Apple TV ana ekranı';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'Moonfin simgesi seçildiğinde Apple TV ana ekranının simgenin üstünde ne gösterdiği. Bu ayar bu cihazda kalır.';

  @override
  String get topShelfLatestMedia => 'Son eklenen medya';

  @override
  String get topShelfAppBanner => 'Moonfin afişi';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Videoyu Dynamic Island\'dan Uzak Tut';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'Yatay modda kamera çıkıntısı ekranın bir kenarını kaplar. Bu ayar görüntüyü ondan uzak tutar; yalnızca o kadar uzağa uzanan geniş videolarda fark yaratır.';

  @override
  String get bottomNavbarStyle => 'Alt Çubuk Stili';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Bölünmüş';

  @override
  String get bottomNavbarStyleStrip => 'Şerit';

  @override
  String get bottomNavbarTabs => 'Alt Çubuk Sekmeleri';

  @override
  String get bottomNavbarTabsDescription =>
      'Ana Sayfa ile Siz arasına en fazla 3 sekme sabitleyin. Diğer her şey alt gezinme merkezinde yer alır.';

  @override
  String get bottomNavbarTabsAutomatic => 'Otomatik';

  @override
  String get bottomNavbarTabsPinned => 'Sabitlenmiş';

  @override
  String get bottomNavbarTabsAvailable => 'Kullanılabilir';

  @override
  String get bottomNavbarTabsReset => 'Otomatiğe Sıfırla';

  @override
  String get bottomNavbarTabsLimit =>
      'En fazla 3 sekme sabitleyebilirsiniz. Başka birini sabitlemek için birini kaldırın.';

  @override
  String get bottomNavbarTabTurnedOff => 'Düğmeler altında kapatıldı';

  @override
  String get bottomNavbarSplitSearchNote =>
      'Bölünmüş stilde Arama her zaman kendi düğmesine sahiptir.';

  @override
  String get bottomNavbarButtonsNote =>
      'Bunlar alt gezinme merkezinde nelerin görüneceğini ve alt çubuğa hangi sekmeleri sabitleyebileceğinizi belirler. Çubukta zaten bulunan sekmeler burada listelenmez.';

  @override
  String get navYou => 'Siz';

  @override
  String get cinemaSkipPrerolls => 'Sinema Modu Atla Düğmesi';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Sinema Modu fragmanları, reklamları ve diğer ön gösterimler sırasında Atla düğmesi gösterir.';

  @override
  String get detailsPage => 'Ayrıntılar Sayfası';

  @override
  String get storageAndDownloads => 'Depolama ve İndirmeler';

  @override
  String get integrations => 'Entegrasyonlar';

  @override
  String get settingsSync => 'Ayar Eşitleme';

  @override
  String get settingsSyncSubtitle =>
      'Moonbase eklentisi eşitlemesi ve özelleştirme profilleri';

  @override
  String get navigationBar => 'Gezinme Çubuğu';

  @override
  String get homeRows => 'Satırlar';

  @override
  String get homeRowsSubtitle =>
      'Satırları açın veya kapatın ve sıralarını değiştirin';

  @override
  String get rowOptions => 'Satır Seçenekleri';

  @override
  String get rowOptionsSubtitle => 'Her satır için sıralama ve içerik';

  @override
  String get imageTypePerRow => 'Satır Başına Görsel Türü';

  @override
  String get externalSources => 'Harici Kaynaklar';

  @override
  String get qualityAndDecoding => 'Kalite ve Çözme';

  @override
  String get qualityAndDecodingSubtitle =>
      'Bit hızı, çözünürlük, çözme, HDR ve Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Atlama ve Otomatik Oynatma';

  @override
  String get advancedPlayback => 'Gelişmiş Oynatma';

  @override
  String get advancedPlaybackSubtitle =>
      'Oynatıcı yönlendirme, harici oynatıcılar ve mpv';

  @override
  String get settingsAccountSubtitle =>
      'Oturum açma, PIN kodu, Çocuk Modu, ebeveyn denetimleri ve ayar eşitleme';

  @override
  String get settingsGeneralSubtitle => 'Dil, saat, giriş ve performans';

  @override
  String get settingsAppearanceSubtitle =>
      'Gezinme, ana ekran, kütüphaneler, ayrıntılar sayfası ve temalar';

  @override
  String get settingsHomeScreenSubtitle =>
      'Satırlar, medya çubuğu, görünüm ve harici kaynaklar';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Kütüphane görünürlüğü, sıra ve kütüphane sayfaları';

  @override
  String get settingsDetailsPageSubtitle =>
      'Düzen, düğmeler, kısımlar, derecelendirmeler ve tema müziği';

  @override
  String get settingsPlaybackSubtitle =>
      'Oynatıcı, kalite, ses, altyazılar, atlama ve SyncPlay';

  @override
  String get settingsStorageSubtitle =>
      'İndirmeler, depolama konumu ve görsel önbelleği';

  @override
  String get settingsServicesSubtitle => 'Seerr ve Başarım Rozetleri';

  @override
  String get settingsSignInSection => 'Oturum açma';

  @override
  String get settingsFamilySection => 'Aile';

  @override
  String get settingsServersSection => 'Sunucular';

  @override
  String get settingsLanguageSection => 'Dil';

  @override
  String get settingsInputSection => 'Giriş';

  @override
  String get settingsMotionSection => 'Hareket';

  @override
  String get settingsContentsSection => 'İçerik';

  @override
  String get settingsLooksSection => 'Görünüm';

  @override
  String get settingsAudioAndSubtitlesSection => 'Ses ve Altyazılar';

  @override
  String get settingsSkippingAndQueueSection => 'Atlama ve Sıra';

  @override
  String get settingsWatchTogetherSection => 'Birlikte İzleme';

  @override
  String get settingsAdvancedSection => 'Gelişmiş';

  @override
  String get playerSettingsSubtitle =>
      'Kontroller, ileri/geri sarma, oynatıcı düğmeleri ve trick play';

  @override
  String get siloPasswordChangeTitle => 'Yeni bir parola seçin';

  @override
  String get siloPasswordChangeMessage =>
      'Bu hesabın geçici bir parolası var. Oturum açmayı tamamlamak için yeni bir parola seçin.';

  @override
  String get siloPasswordChangeNew => 'Yeni parola';

  @override
  String get siloPasswordChangeConfirm => 'Yeni parolayı onayla';

  @override
  String get siloPasswordChangeSubmit => 'Parolayı değiştir';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'En az $count karakter kullanın',
      one: 'En az 1 karakter kullanın',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => 'Bu parola çok uzun';

  @override
  String get siloPasswordChangeMismatch => 'Parolalar eşleşmiyor';

  @override
  String get siloPasswordChangeSameAsTemporary =>
      'Geçici paroladan farklı bir parola seçin';

  @override
  String get siloPasswordChangeFailed =>
      'Parola değiştirilemedi. Tekrar deneyin.';

  @override
  String get siloPasswordChangeUnavailable =>
      'Bu hesabın geçici bir parolası var ve bu sunucu burada değiştirilmesine izin vermiyor. Silo\'nun web uygulamasında değiştirin, ardından tekrar oturum açın.';

  @override
  String get siloPasswordChangedSignInAgain =>
      'Parolanız değiştirildi. Yeni parolayla oturum açın.';

  @override
  String get siloServerRowSubtitle => 'Sunucunuzdan';

  @override
  String get playlistSortReleaseDate => 'Yayın Tarihi';

  @override
  String get playlistSortCriticRating => 'Eleştirmen Puanı';

  @override
  String get playlistSortRuntime => 'Süre';

  @override
  String get playlistSortLastPlayed => 'Son Oynatılan';

  @override
  String get playlistSortPlayCount => 'Oynatma Sayısı';

  @override
  String get playlistSortRandom => 'Rastgele';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count etkin',
      one: '1 etkin',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks => 'Etkin filtrelerle eşleşen parça yok';

  @override
  String get librarySortPlaylistOrder => 'Oynatma Listesi Sırası';

  @override
  String get librarySortDateAdded => 'Eklenme Tarihi';

  @override
  String get librarySortDateEpisodeAdded => 'Bölümün Eklenme Tarihi';

  @override
  String get librarySortParentalRating => 'Ebeveyn Derecelendirmesi';

  @override
  String get librarySortMyRating => 'Derecelendirmem';

  @override
  String get librarySortAlbumArtist => 'Albüm Sanatçısı';

  @override
  String get librarySortAlbum => 'Albüm';

  @override
  String get librarySortArtist => 'Sanatçı';

  @override
  String get librarySortTrackNumber => 'Parça Numarası';

  @override
  String get librarySortGenre => 'Tür';

  @override
  String get librarySortFoldersFirst => 'Önce Klasörler';

  @override
  String get librarySortLength => 'Uzunluk';

  @override
  String get homeScreenBackdrop => 'Ana Ekran Arka Planı';

  @override
  String get homeScreenBackdropFullScreen => 'Tam Ekran';

  @override
  String get homeScreenBackdropCorner => 'Köşe';

  @override
  String get homeScreenBackdropTop => 'Üst';

  @override
  String get detailsScreenBackdrop => 'Ayrıntılar Ekranı Arka Planı';

  @override
  String get detailsBackdropSize => 'Arka Plan Boyutu';

  @override
  String get detailsBackdropFullScreen => 'Tam Ekran';

  @override
  String get detailsBackdropFit => 'Sığdır';

  @override
  String get libraryBackdrops => 'Kütüphane Arka Planları';

  @override
  String get playbackInfoChannel => 'Kanal';

  @override
  String get playbackInfoProgram => 'Program';

  @override
  String get playbackInfoWhy => 'Neden';

  @override
  String get playbackInfoServerCompatibilityCheck =>
      'Sunucu uyumluluk denetimi';

  @override
  String get playbackInfoBitrateUnavailable => 'Bit hızı kullanılamıyor';

  @override
  String get playbackInfoQualityLimit => 'Kalite Sınırı';

  @override
  String get playbackInfoFrameRate => 'Kare Hızı';

  @override
  String get playbackInfoDelivery => 'Aktarım';

  @override
  String get playbackInfoFile => 'Dosya';

  @override
  String get playbackInfoTechnical => 'Teknik';

  @override
  String get playbackInfoDevice => 'Cihaz';

  @override
  String get playbackInfoAudioRoute => 'Ses Yolu';

  @override
  String get playbackInfoSurround51 => '5.1 surround';

  @override
  String get playbackInfoSurround71 => '7.1 surround';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count kanal';
  }

  @override
  String get playbackInfoBurnedIn => 'Sunucu tarafından videoya gömüldü';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value (özgün: $original)';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value ($source kaynağından dönüştürüldü)';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name ($size, $source kaynağından dönüştürüldü)';
  }

  @override
  String get playbackInfoNoteDirectPlay =>
      'Özgün dosya olduğu gibi oynatılıyor.';

  @override
  String get playbackInfoNoteDirectStream =>
      'Sunucu dosyayı dönüştürmeden yeniden paketliyor.';

  @override
  String get playbackInfoNoteLiveRelay =>
      'Sunucu kanalı dönüştürmeden aktarıyor.';

  @override
  String playbackInfoFrameRateFrom(String rate, String source) {
    return '$rate fps ($source)';
  }

  @override
  String get playbackInfoRateSourceHeader => 'akış başlığı';

  @override
  String get playbackInfoRateSourceMeasured => 'ölçüldü';

  @override
  String get playbackInfoRateSourceServer => 'sunucu';

  @override
  String get playbackInfoServerFrameRate => 'Sunucu Kare Hızı';

  @override
  String get playbackInfoScan => 'Tarama';

  @override
  String get playbackInfoProgressive => 'Aşamalı';

  @override
  String get playbackInfoInterlaced => 'Geçmeli';

  @override
  String get playbackInfoRepeatedFields =>
      'Telecine uygulanmış (tekrarlanan alanlar)';

  @override
  String get playbackInfoHdmiOutput => 'HDMI Çıkışı';

  @override
  String playbackInfoDisplayMode(String width, String height, String rate) {
    return '$width×$height @ $rate Hz';
  }

  @override
  String get playbackInfoRateCorrections => 'Hız Düzeltmeleri';

  @override
  String get playbackInfoAudioOutput => 'Çıkış';

  @override
  String playbackInfoPassthroughOf(String codec) {
    return 'Doğrudan aktarım ($codec)';
  }

  @override
  String playbackInfoDecodedTo(String channels) {
    return 'Kodu çözüldü ($channels)';
  }

  @override
  String get playbackInfoNoteTranscodeVideo =>
      'Sunucu, bu cihaz oynatabilsin diye videoyu dönüştürüyor.';

  @override
  String get playbackInfoNoteTranscodeAudio =>
      'Sunucu, bu cihaz oynatabilsin diye sesi dönüştürüyor.';

  @override
  String get playbackInfoNoteTranscodeBoth =>
      'Sunucu, bu cihaz oynatabilsin diye videoyu ve sesi dönüştürüyor.';

  @override
  String get playbackInfoNoteTranscodeUnknown =>
      'Sunucu, bu cihaz oynatabilsin diye bu dosyayı dönüştürüyor.';

  @override
  String get playbackInfoNoteOffline => 'İndirilmiş bir kopya oynatılıyor.';

  @override
  String get playbackInfoWhyForced => 'Dönüştürme ayarlarda zorunlu kılınmış';

  @override
  String get playbackInfoWhyBitrate => 'Bit hızı akış sınırının üzerinde';

  @override
  String get playbackInfoWhyContainer => 'Bu cihaz bu dosya türünü oynatamıyor';

  @override
  String get playbackInfoWhyVideo => 'Bu cihaz bu video biçimini oynatamıyor';

  @override
  String get playbackInfoWhyHdr => 'Bu cihaz bu HDR biçimini gösteremiyor';

  @override
  String get playbackInfoWhyAudio => 'Bu cihaz bu ses biçimini oynatamıyor';

  @override
  String get playbackInfoWhySubtitles => 'Altyazılar videoya gömülüyor';

  @override
  String get playbackInfoWhyOther => 'Dosya doğrudan oynatılamadı';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate, $limit akış sınırının üzerinde';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return 'Bu cihaz $container dosyalarını açamıyor';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return 'Bu cihaz $codec videoyu oynatamıyor';
  }

  @override
  String playbackInfoWhyVideoProfileUnknown(String codec) {
    return 'Sunucu bu akışın $codec profilini doğrulayamadı.';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return 'Bu cihaz $codec $profile videoyu oynatamıyor';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return 'Bu cihaz $codec seviye $level videoyu oynatamıyor';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return 'Bu cihaz $bits bit videoyu oynatamıyor';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return 'Bu cihaz $resolution videoyu oynatamıyor';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return 'Bu cihaz $fps kare/sn videoyu oynatamıyor';
  }

  @override
  String get playbackInfoWhyInterlaced => 'Bu cihaz örgülü videoyu oynatamıyor';

  @override
  String get playbackInfoWhyAnamorphic =>
      'Bu cihaz anamorfik videoyu oynatamıyor';

  @override
  String playbackInfoWhyHdrName(String range) {
    return 'Bu cihaz $range görüntüleyemiyor';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return 'Bu cihaz $format sesi oynatamıyor';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return 'Bu cihaz $fullFormat oynatamıyor';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return 'Bu cihaz $channels sesi oynatamıyor';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return 'Bu cihaz $rate kHz sesi oynatamıyor';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return 'Bu cihaz $bits bit sesi oynatamıyor';
  }

  @override
  String get playbackInfoWhyAudioExternal => 'Ses izi ayrı bir dosyada';

  @override
  String get playbackInfoWhySecondaryAudio =>
      'Bu cihaz yalnızca ilk ses izini oynatabiliyor';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return '$format altyazıları videoya gömülüyor';
  }

  @override
  String get playbackInfoDroppedFrames => 'Atlanan Kareler';

  @override
  String get playFromServer => 'Sunucudan Oynat';

  @override
  String get settingsApplePlayerUi => 'Video oynatıcı';

  @override
  String get settingsApplePlayerUiDescription =>
      'Apple\'ın yerel stilindeki oynatıcıda yayınlama, ses gecikmesi veya PiP düğmesi yoktur ve döndürme kilidi yalnızca Canlı TV\'de bulunur';

  @override
  String get settingsApplePlayerUiStandard => 'Standart';

  @override
  String get settingsApplePlayerUiNative => 'Apple yerel stili';

  @override
  String get playerTransportPosition => 'Oynatma düğmeleri';

  @override
  String get playerTransportPositionDescription =>
      'Oynat, atla ve ileri/geri sar düğmelerini videonun ortasında veya alt çubukta sabit olarak gösterir';

  @override
  String get playerTransportOnScreen => 'Ekranda';

  @override
  String get playerTransportDocked => 'Sabit';

  @override
  String get incompleteRecording => 'Eksik';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '$recorded / $expected dk';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return 'Tam yayın $dateTime için zamanlandı';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return 'Tam kopya $dateTime tarihinde kaydedildi';
  }

  @override
  String get noCompleteShowingFound => 'Tam yayın bulunamadı';

  @override
  String get keepAsComplete => 'Tam Olarak Sakla';

  @override
  String get keptAsComplete => 'Tam olarak işaretlendi';

  @override
  String get unableToKeepAsComplete => 'Tam olarak işaretlenemedi';

  @override
  String recordPromptTitle(String name) {
    return '$name Kaydet';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Bu yayın $minutes dakika önce başladı, bu yüzden kayıt başlangıcı kaçıracak.',
      one: 'Bu yayın 1 dakika önce başladı, bu yüzden kayıt başlangıcı kaçıracak.',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater =>
      'Tam bir kayıt için gelecekteki yayını da kaydetmek ister misiniz?';

  @override
  String get recordPromptSearchLater =>
      'Tam bir kayıt için, bulunduğunda gelecekteki bir yayını da otomatik olarak kaydetmek ister misiniz?';

  @override
  String get recordPromptNow => 'Şimdi';

  @override
  String get recordPromptLater => 'Gelecekteki yayın';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes dk zaten yayınlandı',
      one: '1 dk zaten yayınlandı',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch =>
      'Yalnızca başlık ve açıklamaya göre eşleşti. Aynı program olduğunu kontrol edin.';

  @override
  String get recordPromptDescriptionsDiffer =>
      'Açıklamalar farklı, bu yüzden farklı bir program olabilir.';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return 'Aynı bölüm (S${season}E$episode)';
  }

  @override
  String get recordPromptAlreadyScheduled => 'Zaten kayıt için ayarlı';

  @override
  String get recordPromptTomorrow => 'Yarın';

  @override
  String get recordNowOnly => 'Yalnızca Şimdi Kaydet';

  @override
  String recordNowAnd(String when) {
    return 'Şimdi ve $when Kaydet';
  }

  @override
  String get recordNowAndLater => 'Şimdi ve Gelecekteki Yayını Kaydet';

  @override
  String recordOnlyLater(String when) {
    return 'Yalnızca $when Kaydet';
  }

  @override
  String get recordLaterShowingOnly => 'Yalnızca Gelecekteki Yayını Kaydet';

  @override
  String get laterShowingOnlyRequested => 'Gelecekteki yayın kaydedilecek.';

  @override
  String get unableToRequestLaterShowingOnly =>
      'Gelecekteki yayın istenemedi, bu yüzden hiçbir şey kaydedilmeyecek.';

  @override
  String get laterShowingRequested =>
      'Kayıt başladı. Gelecekteki bir yayın da kaydedilecek.';

  @override
  String get unableToRequestLaterShowing =>
      'Kayıt başladı ancak gelecekteki bir yayın istenemedi.';

  @override
  String get siloCodeSignIn => 'Kodla oturum aç';

  @override
  String siloCodeSignInInstruction(String address) {
    return 'QR kodunu telefonunuzla tarayın veya oturum açık herhangi bir cihazda $address adresine gidip bu kodu girin:';
  }

  @override
  String get siloCodeSignInInstructionNoLink =>
      'Bu kodu, oturum açtığınız bir cihazda Silo\'ya girin:';

  @override
  String get siloCodeSignInOpened =>
      'Kod bulundu. Oturum açmayı diğer cihazınızda onaylayın.';

  @override
  String get siloCodeSignInDenied => 'Bu oturum açma reddedildi.';

  @override
  String get siloCodeSignInNewCode => 'Yeni kod al';

  @override
  String get siloCodeSignInOff => 'Bu sunucuda kodla oturum açma kapalı.';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      'Bu hesabın geçici bir parolası var. Değiştirmek için bir kez parolayla oturum açın.';

  @override
  String get siloApproveSignIn => 'Oturum açmayı onayla';

  @override
  String get siloApproveSignInHint => 'Diğer cihazda gösterilen kod';

  @override
  String get siloApproveSignInApprove => 'Onayla';

  @override
  String get siloApproveSignInDone => 'Onaylandı. Diğer cihaz oturum açıyor.';

  @override
  String get siloApproveSignInNoRequest =>
      'Bu kodla bekleyen bir oturum açma yok. Kodu kontrol edin veya diğer cihazda yeni bir kod alın.';

  @override
  String get siloNativeOfferTitle => 'Silo\'ya doğrudan bağlanılsın mı?';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return 'Bu adres, $serverName sunucusunun Jellyfin uyumlu hizmetidir. Moonfin, Silo\'nun kendi özellikleriyle $address adresinden Silo\'ya doğrudan bağlanabilir.';
  }

  @override
  String get siloNativeOfferUse => 'Silo\'yu Kullan';

  @override
  String get siloNativeOfferKeep => 'Jellyfin\'i Koru';

  @override
  String get siloAppUpdateRequired =>
      'Bu Silo sunucusu Moonfin\'in daha yeni bir sürümünü gerektiriyor. Kullanmak için Moonfin\'i güncelleyin.';

  @override
  String get siloServerUpdateRequired =>
      'Bu Silo sunucusu Moonfin\'in bu sürümü için çok eski. Kullanmak için Silo\'yu güncelleyin.';

  @override
  String get siloTooManyAttempts =>
      'Çok fazla deneme yapıldı. Daha sonra tekrar deneyin.';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return 'Çok fazla deneme yapıldı. $wait sonra tekrar deneyin.';
  }

  @override
  String get siloServerBusy =>
      'Sunucu meşgul veya hâlâ başlıyor. Daha sonra tekrar deneyin.';

  @override
  String siloServerBusyWait(String wait) {
    return 'Sunucu meşgul veya hâlâ başlıyor. $wait sonra tekrar deneyin.';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saniye',
      one: '1 saniye',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika',
      one: '1 dakika',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable =>
      'Bu Silo sunucusunda oynatma kullanılamıyor.';

  @override
  String get siloPlaybackUpdateRequired =>
      'Bu Silo sunucusu oynatma için Moonfin\'in daha yeni bir sürümünü gerektiriyor.';

  @override
  String get siloPlaybackEndedOnServer =>
      'Oynatma Silo sunucusunda sonlandırıldı.';

  @override
  String siloPinTitle(String name) {
    return '$name için PIN';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => 'Kilidi aç';

  @override
  String get siloPinRemember => 'Remember PIN on this device';

  @override
  String get siloPinWrong => 'Bu PIN doğru değil.';

  @override
  String get siloPinLocked =>
      'Çok fazla yanlış PIN girildi. Daha sonra tekrar deneyin.';

  @override
  String siloPinLockedWait(String wait) {
    return 'Çok fazla yanlış PIN girildi. $wait sonra tekrar deneyin.';
  }

  @override
  String get siloPinFailed => 'PIN doğrulanamadı. Tekrar deneyin.';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fragman',
      one: '1 fragman',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return 'Fragman $number';
  }

  @override
  String get subtitled => 'Altyazılı';

  @override
  String get rommAccount => 'RomM hesabı';

  @override
  String get rommAccountIntro =>
      'Kendi RomM kütüphanenizden oynamak ve kayıtlarınızı RomM\'de tutmak için RomM hesabınızı bağlayın.';

  @override
  String get rommLinkAccount => 'RomM hesabını bağla';

  @override
  String get rommLinkInstructions =>
      'RomM\'de oturum açın ve hesabınızı bağlamak için bu kodu girin.';

  @override
  String rommLinkScanOrVisit(String url) {
    return 'QR kodunu telefonunuzla tarayın veya $url adresine gidin';
  }

  @override
  String get rommOpen => 'RomM\'i aç';

  @override
  String get rommWaitingForApproval =>
      'RomM\'de kodu onaylamanız bekleniyor...';

  @override
  String rommLinkedAs(String username) {
    return '$username olarak bağlandı';
  }

  @override
  String get rommLinked => 'RomM hesabınız bağlandı.';

  @override
  String get rommUnlinkNote =>
      'Bağlantıyı kaldırmak, Moonfin\'in RomM anahtarınızı kullanmasını durdurur. Anahtar, oradaki API belirteçlerinizden kaldırana kadar RomM\'de kalır.';

  @override
  String get rommUnlink => 'Bağlantıyı kaldır';

  @override
  String get rommLinkExpired =>
      'Kod onaylanmadan önce süresi doldu. Yeni bir kod almak için tekrar bağlayın.';

  @override
  String get rommLinkDenied => 'Bağlantı RomM\'de reddedildi.';

  @override
  String get rommUnreachable =>
      'Moonfin RomM\'e ulaşamadı. Biraz sonra tekrar deneyin.';

  @override
  String get rommNotAvailable => 'Bu sunucuda RomM kütüphanesi yok.';

  @override
  String get rommAccountLoadFailed => 'RomM hesabınız yüklenemedi.';

  @override
  String get reviews => 'İncelemeler';

  @override
  String get detailSectionReviews => 'İncelemeler';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count inceleme',
      one: '1 inceleme',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => 'TMDB\'de oku';

  @override
  String get addServerButtonSubtitle =>
      'Adresle veya Plex ya da Emby Connect hesabıyla';

  @override
  String get addServerChooseHow => 'Nasıl bağlanmak istediğinizi seçin.';

  @override
  String get addServerAddressChoice =>
      'Ağınızdaki veya internetteki Jellyfin, Emby ya da Silo';

  @override
  String get addServerPlexChoice =>
      'Sunucularını bulmak için Plex hesabınızı kullanın';

  @override
  String get addServerAddressHelp =>
      'Tarayıcıda açacağınız adresin aynısı, bağlantı noktası dahil.';

  @override
  String get addServerDetectNote =>
      'Jellyfin, Emby ve Silo ile çalışır. Plex adresi Plex oturum açmasını açar.';

  @override
  String addServerChecking(String address) {
    return '$address denetleniyor';
  }

  @override
  String get addServerUnreachableDetail =>
      'Adresi ve bağlantı noktasını, ayrıca sunucunun çalıştığını kontrol edin.';

  @override
  String get addServerFound => 'Sunucu bulundu';

  @override
  String get addServerFoundNote =>
      'Kimin oturum açacağını seçmek için devam edin.';

  @override
  String get addServerUseDifferentAddress => 'Farklı bir adres kullan';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sanatçı',
      one: '1 sanatçı',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count şarkı',
      one: '1 şarkı',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oynatma listesi',
      one: '1 oynatma listesi',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count oynatma',
      one: '1 oynatma',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => 'Tüm Sanatçılar';

  @override
  String get libraryZToA => 'Z\'den A\'ya';

  @override
  String get musicSortYear => 'Yıl';

  @override
  String get musicFilter => 'Filtre';

  @override
  String get musicGenreFilterTitle => 'Türe Göre Filtrele';

  @override
  String get openAlbum => 'Albümü Aç';

  @override
  String get openPlaylist => 'Oynatma Listesini Aç';

  @override
  String get allSongsAToZ => 'Tüm Şarkılar A\'dan Z\'ye';

  @override
  String get musicMix => 'Karışık';

  @override
  String get musicMixEverything => 'Her Şey';

  @override
  String get musicMixEverythingSubtitle => 'Rastgele 300 şarkı';

  @override
  String get mostPlayed => 'En Çok Oynatılanlar';

  @override
  String get musicMixMostPlayedSubtitle => 'İlk 100\'ünüz';

  @override
  String get musicMixFreshArrivals => 'Yeni Gelenler';

  @override
  String get musicMixFreshArrivalsSubtitle => 'En yeni 100 şarkı';

  @override
  String get musicMixRediscover => 'Yeniden Keşfet';

  @override
  String get musicMixRediscoverSubtitle =>
      'Son zamanlarda oynatmadığınız favoriler';

  @override
  String get musicSortMostAlbums => 'En Çok Albüm';

  @override
  String bookSeriesPosition(int index, int total) {
    return 'Kitap $index / $total';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count favori',
      one: '1 favori',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Z\'den A\'ya';

  @override
  String get bookSortMostTitles => 'En Çok Başlık';

  @override
  String get bookSurpriseMe => 'Şaşırt Beni';

  @override
  String get bookShuffleAudiobooks => 'Sesli Kitapları Karıştır';

  @override
  String get bookStartReading => 'Okumaya Başla';

  @override
  String get bookOtherBooks => 'Diğer Kitaplar';

  @override
  String get bookDiscoverSearchBooks => 'Open Library\'de Ara';

  @override
  String get bookDiscoverSearchAudiobooks => 'LibriVox\'ta Ara';

  @override
  String get bookDiscoverFeatured => 'Öne Çıkanlar';

  @override
  String get bookReaderControlsAutoHide => 'Kontroller otomatik gizlenir';

  @override
  String get bookReaderControlsStayVisible => 'Kontroller görünür kalır';

  @override
  String get settingsLivePreview => 'Canlı önizleme';

  @override
  String settingsPreviewShowsOn(String screen) {
    return '$screen önizlemesinde gösterilir';
  }

  @override
  String get settingsPreviewNotShown => 'Önizlemede gösterilmez';

  @override
  String get settingsPreviewSaved => 'Kaydedildi';

  @override
  String get smartSearch => 'Akıllı Arama';

  @override
  String smartSearchOnSeerr(String seerr) {
    return '$seerr üzerinde Akıllı Arama';
  }

  @override
  String get calendar => 'Takvim';

  @override
  String get showCalendarButton => 'Takvim Düğmesini Göster';

  @override
  String get showCalendarButtonSubtitle =>
      'Yaklaşan bölümlerin ve filmlerin takvimini gezinme çubuğunda göster';

  @override
  String get calendarFullCalendar => 'Tam takvim';

  @override
  String get calendarUpcoming => 'Yaklaşanlar';

  @override
  String get calendarRecentlyAired => 'Yakın zamanda yayınlananlar';

  @override
  String get calendarRemindMe => 'Bana hatırlat';

  @override
  String get calendarReminderSet => 'Hatırlatıcı ayarlandı';

  @override
  String get calendarReminderFailed => 'Hatırlatıcı kaydedilemedi';

  @override
  String get calendarReadyToWatch => 'İzlemeye hazır';

  @override
  String get calendarComingUpThisWeek => 'Bu hafta gelecekler';

  @override
  String get calendarNothingUpcoming => 'Yaklaşan bir şey yok';

  @override
  String get calendarNothingRecent => 'Yakın zamanda yayınlanan bir şey yok';

  @override
  String get calendarEmptyDay => 'Bu günde hiçbir şey yok';

  @override
  String get calendarStartsIn => 'Başlamasına kalan';

  @override
  String get calendarUnitDays => 'gün';

  @override
  String get calendarUnitHours => 'sa';

  @override
  String get calendarUnitMinutes => 'dk';

  @override
  String calendarDayAtTime(String day, String time) {
    return '$day saat $time';
  }

  @override
  String get calendarAllDay => 'Tüm gün';

  @override
  String get calendarBadgeSeriesPremiere => 'Dizi prömiyeri';

  @override
  String get calendarBadgeSeasonPremiere => 'Yeni sezon';

  @override
  String get calendarBadgeSeasonFinale => 'Sezon finali';

  @override
  String get calendarBadgeMidseasonFinale => 'Sezon ortası finali';

  @override
  String get calendarBadgeSeriesFinale => 'Dizi finali';

  @override
  String get calendarBadgeNew => 'YENİ';

  @override
  String get calendarStatusInLibrary => 'Kütüphanede';

  @override
  String get calendarNotMonitored => 'Takip edilmiyor';

  @override
  String get calendarMovieDetails => 'Film ayrıntıları';

  @override
  String get calendarProblemAdminsOnly =>
      'Bu sunucuda takvim yalnızca yöneticilere açık.';

  @override
  String get calendarProblemNeedsSeerr =>
      'Takvimin yüklenebilmesi için bir yöneticinin Moonfin\'de Seerr\'e giriş yapması gerekiyor.';

  @override
  String get calendarProblemNotConfigured =>
      'Henüz bağlı bir Sonarr veya Radarr sunucusu yok.';

  @override
  String get calendarProblemFailed => 'Takvim yüklenemedi.';

  @override
  String get calendarSettingsSubtitle =>
      'Takvimin stili, filtreleri ve eylemleri';

  @override
  String get calendarSettingsView => 'Görünüm';

  @override
  String get calendarSettingsStyle => 'Takvim stili';

  @override
  String get calendarSettingsStyleDescription =>
      'Takvim düğmesinin neyi açacağı. Her iki seçenekte de tam ay görünümü bir düğme uzaklıkta.';

  @override
  String get calendarSettingsStyleAgenda => 'Ajanda';

  @override
  String get calendarSettingsStyleCountdown => 'Geri sayım';

  @override
  String get calendarSettingsWeekStart => 'Haftanın ilk günü';

  @override
  String get calendarSettingsWhatShows => 'Neler gösterilsin';

  @override
  String get calendarSettingsScope => 'Göster';

  @override
  String get calendarSettingsScopeDescription =>
      'Dizilerim, favorilediğiniz veya izlemeye başladığınız dizileri tutar';

  @override
  String get calendarSettingsScopeEverything => 'Her şey';

  @override
  String get calendarSettingsScopeMyShows => 'Dizilerim';

  @override
  String get calendarSettingsUnmonitored => 'Takip edilmeyenleri dahil et';

  @override
  String get calendarSettingsUnmonitoredSubtitle =>
      'Sonarr ve Radarr\'ın indirmeye ayarlı olmadığı bölümleri ve filmleri de listele';

  @override
  String get calendarSettingsSpecials => 'Özel bölümler';

  @override
  String get calendarSettingsSpecialsSubtitle =>
      'Ekstralar ve özel gün bölümleri gibi 0. sezon bölümleri';

  @override
  String get calendarSettingsBadges => 'Prömiyer ve final etiketleri';

  @override
  String get calendarSettingsBadgesSubtitle =>
      'Prömiyerleri, finalleri ve yeni sezonları işaretle';

  @override
  String get calendarSettingsColorBy => 'Renklendirme ölçütü';

  @override
  String get calendarSettingsColorByDescription =>
      'Tip, bölümleri filmlerden ayırır. Durum ise kütüphanenizde olanları, yaklaşanları veya eksik olanları gösterir.';

  @override
  String get calendarSettingsColorByType => 'Tip';

  @override
  String get calendarSettingsImageType => 'Kart görseli';

  @override
  String get calendarSettingsImageTypeDescription =>
      'Geri sayım satırlarındaki görsel';

  @override
  String get calendarSettingsSpoilerSafe => 'Spoiler koruması';

  @override
  String get calendarSettingsSpoilerSafeSubtitle =>
      'Geride kaldığınız dizilerin bölüm başlıklarını ve kare görüntülerini gizle';

  @override
  String get calendarSettingsActions => 'Eylemler';

  @override
  String get calendarSettingsSelectAction => 'Bir öğe seçildiğinde';

  @override
  String get calendarSettingsSelectActionDescription =>
      'Kütüphanenizde zaten olan bir öğede Tamam\'a basınca veya dokununca ne olacağı';

  @override
  String get calendarSettingsSelectDetails => 'Ayrıntıları aç';

  @override
  String get calendarSettingsSelectPlay => 'Kütüphanede varsa oynat';

  @override
  String get calendarSettingsRequestButton => 'Talep düğmesi';

  @override
  String get calendarSettingsRequestButtonSubtitle =>
      'Eksik filmlerde ve sezonlarda Seerr talep düğmesini göster';

  @override
  String get calendarSettingsReminders => 'Hatırlatıcılar';

  @override
  String get calendarSettingsRemindersSubtitle =>
      'Bir yapım kütüphanenize eklendiğinde bildirim gönderen Bana hatırlat düğmesini göster';

  @override
  String get calendarRowSeeAll => 'Tümünü Gör kartı';

  @override
  String get calendarRowSeeAllSubtitle =>
      'Yaklaşanlar satırlarını takvimi açan bir kartla bitir';

  @override
  String get showNextAirDate => 'Sonunda sonraki yayın tarihi';

  @override
  String get showNextAirDateSubtitle =>
      'Sonraki bölüm henüz kütüphanenizde değilse, bölüm sonu kartında ne zaman yayınlanacağı gösterilir';

  @override
  String get afterHoursTitle => 'After Hours';

  @override
  String get afterHoursUnlocked => 'After Hours unlocked';

  @override
  String afterHoursPressesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more presses',
      one: '1 more press',
    );
    return '$_temp0';
  }

  @override
  String afterHoursTapsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more taps',
      one: '1 more tap',
    );
    return '$_temp0';
  }

  @override
  String get afterHoursPlay => 'Play';

  @override
  String get afterHoursLeaderboards => 'Leaderboards';

  @override
  String get afterHoursTop3 => 'Top 3';

  @override
  String afterHoursScoresFrom(String server) {
    return 'Scores from $server';
  }

  @override
  String get afterHoursScoresOnDevice => 'Scores on this device';

  @override
  String get afterHoursGameOver => 'Game over';

  @override
  String afterHoursNewRank(int rank) {
    return 'New #$rank on the board';
  }

  @override
  String get afterHoursPlayAgain => 'Play again';

  @override
  String get afterHoursBackToArcade => 'Back to the arcade';

  @override
  String get afterHoursArcade => 'Arcade';

  @override
  String get afterHoursLandscapeNote => 'Turns to landscape while you play';

  @override
  String get afterHoursTouch => 'Touch';

  @override
  String get afterHoursNewTag => 'NEW';

  @override
  String get afterHoursNoScores => 'No scores yet';

  @override
  String get afterHoursPerfect => 'PERFECT';

  @override
  String get afterHoursBoxSet => 'BOX SET';

  @override
  String get afterHoursBufferRun => 'Buffer Run';

  @override
  String get afterHoursBufferRunGenre => 'Endless runner with a gravity flip';

  @override
  String get afterHoursBufferRunPitch =>
      'The runner from the loading screen finally gets somewhere to go. Double jump and gravity flips it onto the ceiling.';

  @override
  String get afterHoursBufferRunRemote =>
      'OK jumps, again mid-air to flip sides. Down slides. On the ceiling Up and Down swap.';

  @override
  String get afterHoursBufferRunTouch =>
      'Tap to jump, and tap again in the air to flip. Swipe toward the side you\'re running on to slide.';

  @override
  String get afterHoursFastForward => 'Fast Forward';

  @override
  String get afterHoursFastForwardGenre => 'Three-lane runner';

  @override
  String get afterHoursFastForwardPitch =>
      'A sprint down three lobby aisles. Hop the low stuff, and remember the popcorn carts don\'t move for anyone.';

  @override
  String get afterHoursFastForwardRemote =>
      'Up and Down change lanes. OK jumps.';

  @override
  String get afterHoursFastForwardTouch =>
      'Swipe up or down to change lanes. Tap to jump.';

  @override
  String get afterHoursCableCrawl => 'Cable Crawl';

  @override
  String get afterHoursCableCrawlGenre => 'Grid crawler';

  @override
  String get afterHoursCableCrawlPitch =>
      'Steer an HDMI cable around the back of the TV cabinet and plug into signal. Every bar makes it longer.';

  @override
  String get afterHoursCableCrawlRemote =>
      'Arrows turn. The cable never stops.';

  @override
  String get afterHoursCableCrawlTouch => 'Swipe to turn.';

  @override
  String get afterHoursCaseStack => 'Case Stack';

  @override
  String get afterHoursCaseStackGenre => 'One-button stacker';

  @override
  String get afterHoursCaseStackPitch =>
      'Build a shelf-high tower of Blu-ray cases, each one a title from your own library. Whatever hangs over the edge gets trimmed off, so land them dead on.';

  @override
  String get afterHoursCaseStackRemote => 'OK drops the case.';

  @override
  String get afterHoursCaseStackTouch => 'Tap anywhere to drop.';

  @override
  String get afterHoursPixelPurge => 'Pixel Purge';

  @override
  String get afterHoursPixelPurgeGenre => 'Paddle breaker';

  @override
  String get afterHoursPixelPurgePitch =>
      'A bad encode left the picture full of blocky artifacts, and they creep down a little every second. Bounce the play button off the seek bar to clear them before they reach it.';

  @override
  String get afterHoursPixelPurgeRemote =>
      'Left and Right slide the scrubber. The ball launches on its own.';

  @override
  String get afterHoursPixelPurgeTouch => 'Drag to slide the scrubber.';

  @override
  String get afterHoursHowToPlay => 'How to play';

  @override
  String get afterHoursStart => 'Start';

  @override
  String get afterHoursBackToGame => 'Back to the game';

  @override
  String get afterHoursEnemies => 'Enemies';

  @override
  String get afterHoursObstacles => 'Obstacles';

  @override
  String get afterHoursPowerups => 'Powerups';

  @override
  String get afterHoursCastShieldLine => 'A shield that takes one hit.';

  @override
  String get afterHoursCastPointsLine => '25 points a piece.';

  @override
  String get afterHoursCastLagBat => 'Lag Bat';

  @override
  String get afterHoursCastLagBatLine =>
      'Swoops in at head height. Slide under it.';

  @override
  String get afterHoursCastGremlin => 'Static Gremlin';

  @override
  String get afterHoursCastGremlinLine =>
      'Hops along the floor or the ceiling toward you. Jump it.';

  @override
  String get afterHoursCastCable => 'Cable Coil';

  @override
  String get afterHoursCastCableLine =>
      'Low on the floor or the ceiling. Jump it.';

  @override
  String get afterHoursCastBanner => 'Buffering Banner';

  @override
  String get afterHoursCastBannerLine =>
      'Slide under the sign. Its pole is a wall on the other side.';

  @override
  String get afterHoursCastSkipIntro => 'Skip Intro';

  @override
  String get afterHoursCastSkipIntroLine =>
      'Three seconds of dash that smashes anything.';

  @override
  String get afterHoursCastPopcorn => 'Popcorn';

  @override
  String get afterHoursCastRollingReel => 'Loose Reel';

  @override
  String get afterHoursCastRollingReelLine =>
      'Rolls down your lane faster than you run. Jump it.';

  @override
  String get afterHoursCastUsher => 'Usher';

  @override
  String get afterHoursCastUsherLine =>
      'Walks toward you and changes lanes once.';

  @override
  String get afterHoursCastVelvetRope => 'Velvet Rope';

  @override
  String get afterHoursCastVelvetRopeLine => 'Low. Jump it or change lanes.';

  @override
  String get afterHoursCastPopcornCart => 'Popcorn Cart';

  @override
  String get afterHoursCastPopcornCartLine => 'Too tall to jump. Change lanes.';

  @override
  String get afterHoursCastFrontRowPass => 'Front Row Pass';

  @override
  String get afterHoursCastMagnet => 'Magnet';

  @override
  String get afterHoursCastMagnetLine =>
      'Pulls in tickets from every lane for eight seconds.';

  @override
  String get afterHoursCastTicket => 'Ticket';

  @override
  String get afterHoursCastBug => 'Interference Bug';

  @override
  String get afterHoursCastBugLine => 'Wanders at random.';

  @override
  String get afterHoursCastTangle => 'Tangle';

  @override
  String get afterHoursCastTangleLine => 'Slowly chases your plug.';

  @override
  String get afterHoursCastStatic => 'Static';

  @override
  String get afterHoursCastStaticLine =>
      'A dead cell. One appears every third signal.';

  @override
  String get afterHoursCastBrick => 'Power Brick';

  @override
  String get afterHoursCastBrickLine => 'A 2 by 2 block every fifth signal.';

  @override
  String get afterHoursCastGhost => 'Ghost';

  @override
  String get afterHoursCastGhostLine =>
      'Five seconds of passing through everything but the edge.';

  @override
  String get afterHoursCastSnip => 'Snip';

  @override
  String get afterHoursCastSnipLine =>
      'Cuts the cable in half for bonus points.';

  @override
  String get afterHoursCastSignal => 'Signal';

  @override
  String get afterHoursCastSignalLine => 'Points, and two more segments.';

  @override
  String get afterHoursCastShelfCat => 'Shelf Cat';

  @override
  String get afterHoursCastShelfCatLine =>
      'Bats a case as it comes in, so that one slides faster.';

  @override
  String get afterHoursCastBluCase => 'Blu-ray Case';

  @override
  String get afterHoursCastBluCaseLine =>
      'A title from your library. The overhang gets trimmed off.';

  @override
  String get afterHoursCastSteelbook => 'Steelbook';

  @override
  String get afterHoursCastSteelbookLine =>
      'Every tenth case. Slides much faster.';

  @override
  String get afterHoursCastPerfect => 'Perfect Drop';

  @override
  String get afterHoursCastPerfectLine =>
      'Land it dead on and the stack grows a little wider.';

  @override
  String get afterHoursCastBoxSet => 'Box Set';

  @override
  String get afterHoursCastBoxSetLine =>
      'Three perfect drops in a row grow it a lot wider.';

  @override
  String get afterHoursCastDeadPixel => 'Dead Pixel';

  @override
  String get afterHoursCastDeadPixelLine =>
      'Falls from cleared blocks. Catching it shrinks the scrubber.';

  @override
  String get afterHoursCastMacroblock => 'Macroblock';

  @override
  String get afterHoursCastMacroblockLine => 'One hit clears it.';

  @override
  String get afterHoursCastKeyframe => 'Keyframe';

  @override
  String get afterHoursCastKeyframeLine =>
      'Takes three hits and drops a powerup.';

  @override
  String get afterHoursCastHdrLine =>
      'A scrubber twice as wide for eight seconds.';

  @override
  String get afterHoursCastBufferNet => 'Buffer';

  @override
  String get afterHoursCastBufferNetLine =>
      'A net under the scrubber that saves one miss.';

  @override
  String get afterHoursBufferRunCardTouch =>
      'Tap to jump, again mid-air to flip sides. Swipe toward your side to slide.';

  @override
  String get afterHoursPixelPurgeCardRemote =>
      'Left and Right slide the scrubber.';
}
