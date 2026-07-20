// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'БҮРТГЭЛИЙН ТОХИРГОО';

  @override
  String get interfaceLanguage => 'Интерфейсийн хэл';

  @override
  String get systemLanguageDefault => 'Системийн үндсэн';

  @override
  String get signIn => 'Нэвтрэх';

  @override
  String get empty => 'Хоосон';

  @override
  String connectingToServer(String serverName) {
    return '$serverName-д холбогдож байна';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Нууц үг';

  @override
  String get username => 'Хэрэглэгчийн нэр';

  @override
  String get email => 'Имэйл';

  @override
  String get quickConnectInstruction =>
      'Энэ кодыг серверийнхээ вэб хяналтын самбарт оруулна уу:';

  @override
  String get waitingForAuthorization => 'Зөвшөөрөл хүлээж байна...';

  @override
  String get back => 'Буцах';

  @override
  String get serverUnavailable => 'Сервер боломжгүй байна';

  @override
  String get loginFailed => 'Нэвтэрч чадсангүй';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect боломжгүй: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect боломжгүй ($status): $detail';
  }

  @override
  String get whosWatching => 'Хэн харж байна вэ?';

  @override
  String get addUser => 'Хэрэглэгч нэмэх';

  @override
  String get selectServer => 'Серверийг сонгоно уу';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin хувилбар $version';
  }

  @override
  String get savedServers => 'Хадгалсан серверүүд';

  @override
  String get discoveredServers => 'Олдсон серверүүд';

  @override
  String get noneFound => 'Олдсонгүй';

  @override
  String get unableToConnectToServer => 'Сервертэй холбогдох боломжгүй байна';

  @override
  String get addServer => 'Сервер нэмэх';

  @override
  String get embyConnect => 'Emby Холбох';

  @override
  String get removeServer => 'Серверийг устгах';

  @override
  String removeServerConfirmation(String serverName) {
    return '\"$serverName\"-г серверээсээ устгах уу?';
  }

  @override
  String get cancel => 'Цуцлах';

  @override
  String get remove => 'Хасах';

  @override
  String get connectToServer => 'Сервертэй холбогдоно уу';

  @override
  String get serverAddress => 'Серверийн хаяг';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Холбох';

  @override
  String get secureStorageUnavailable => 'Аюулгүй хадгалах сан боломжгүй';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin таны системийн түлхүүрт нэвтэрч чадсангүй. Нэвтрэхийг үргэлжлүүлж болох ч түлхүүрийн оосорыг нээх хүртэл аюулгүй жетон хадгалах боломжгүй байж магадгүй.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Апп-ын сэдэв';

  @override
  String get detailScreenStyle => 'Дэлгэрэнгүй дэлгэцийн хэв маяг';

  @override
  String get detailScreenStyleSubtitle =>
      'Сонгодог нь Moonfin-ий анхны төвлөрсөн байрлал. Орчин үеийн нь дэлгэцэд зохицдог кино маягийн байрлал.';

  @override
  String get detailScreenStyleMoonfin => 'Сонгодог';

  @override
  String get detailScreenStyleModern => 'Орчин үеийн';

  @override
  String get expandedTabs => 'Дэлгэсэн табууд';

  @override
  String get expandedTabsSubtitle =>
      'Табуудыг үзэж байхад агуулгыг нь автоматаар харуулна. Унтраавал таб бүрийг гараар нээж хаана.';

  @override
  String get showTechnicalDetails => 'Техникийн дэлгэрэнгүйг харуулах уу?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Кодек, нягтрал, урсгалын мэдээллийг баннерын хураангуйд харуулна';

  @override
  String get recommendationSystem => 'Зөвлөмжийн систем';

  @override
  String get recommendationSystemSubtitle =>
      'Moonfin Recommends дотоод сангийн алгоритм эсвэл онлайн TMDb-ийн ижил төстэй байдлын хэмжүүрийг ашиглана. Тэмдэглэл: Онлайн зөвлөмжид Seerr холболт шаардлагатай.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb-ийн ижил төстэй байдал';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Насны ангиллын хязгаар тавих уу?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Moonfin Recommends-ийн саналыг сонгосон медиагийн насны ангиллаар хязгаарлана';

  @override
  String get interfaceStyle => 'Интерфейсийн хэв маяг';

  @override
  String get interfaceStyleSubtitle =>
      'Автомат нь таны төхөөрөмжид тохирно. Тодорхой хэлбэрийг албадахыг хүсвэл Apple эсвэл Material-ыг сонгоно уу.';

  @override
  String get interfaceStyleAutomatic => 'Автомат';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Шилэн эффектийн чанар';

  @override
  String get glassQualitySubtitle =>
      'Авто нь энэ төхөөрөмжид тохирох шилэн эффектийг сонгоно. Бүрэн нь жинхэнэ бүдгэрүүлэлтийг албадана; Багасгасан нь GPU-ийн хүчийг хэмнэх хөнгөн шил ашиглана.';

  @override
  String get glassQualityAuto => 'Авто';

  @override
  String get glassQualityFull => 'Бүрэн';

  @override
  String get glassQualityReduced => 'Багасгасан';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Програмыг дахин эхлүүлэхгүйгээр Moonfin болон Neon Pulse хооронд сэлгэнэ үү';

  @override
  String get customThemeTitle => 'Захиалгат загвар';

  @override
  String get customThemeSubtitle =>
      'Захиалгат загвар нь Moonfin даяарх харагдах байдлыг өөрчилнө. Өөрийн хэв маягт тохирох нэгийг сонгоно уу.';

  @override
  String get keyboardPreferSystemIme => 'Системийн гарыг илүүд үздэг';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Текст оруулахдаа төхөөрөмжийнхөө оруулах аргыг өгөгдмөлөөр ашиглана уу';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Одоогийн Moonfin та бүгд дурласан харагдана';

  @override
  String get themeNeonPulse => 'Неон импульс';

  @override
  String get themeNeonPulseSubtitle =>
      'Нил ягаан өнгийн туяа, хөх өнгийн текст, илүү хүчтэй хром тодосгогч бүхий Synthwave загвар';

  @override
  String get themeGlass => 'Шил';

  @override
  String get themeGlassSubtitle =>
      'Хөвөгч градиент дэвсгэр, бүрхэг гадаргуу, Apple-ийн цэнхэр өргөлттэй шингэн шилэн хэв маяг';

  @override
  String get theme8BitHero => '8-bit баатар';

  @override
  String get theme8BitHeroSubtitle =>
      'Бүдүүн өнгөний палитр, дөрвөлжин хүрээ, хатуу сүүдэр, пиксел фонттой ретро пиксел-арт хэв маяг';

  @override
  String get embyConnectSignInSubtitle =>
      'Emby Connect бүртгэлээрээ нэвтэрнэ үү';

  @override
  String get emailOrUsername => 'Имэйл эсвэл хэрэглэгчийн нэр';

  @override
  String get selectAServer => 'Сервер сонгоно уу';

  @override
  String get tryAgain => 'Дахин оролдоно уу';

  @override
  String get noLinkedServers =>
      'Энэ Emby Холбох бүртгэлтэй холбогдоогүй сервер алга';

  @override
  String get invalidEmbyConnectCredentials =>
      'Хүчингүй Emby Итгэмжлэлийг холбоно уу';

  @override
  String get invalidEmbyConnectLogin =>
      'Буруу Emby Хэрэглэгчийн нэр эсвэл нууц үгээ холбоно уу';

  @override
  String get embyConnectExchangeNotSupported =>
      'Сервер Emby Холболтын солилцоог дэмждэггүй';

  @override
  String get embyConnectNetworkError =>
      'Emby Connect эсвэл сонгосон сервертэй холбогдох үед сүлжээний алдаа гарлаа';

  @override
  String get loadingLinkedServers => 'Холбогдсон серверүүдийг ачаалж байна...';

  @override
  String get connectingToServerEllipsis => 'Сервертэй холбогдож байна...';

  @override
  String get noReachableAddress => 'Холбогдох хаяг байхгүй';

  @override
  String get invalidServerExchangeResponse =>
      'Серверийн солилцооны эцсийн цэгээс буруу хариулт';

  @override
  String unableToConnectTo(String target) {
    return '$target-д холбогдох боломжгүй байна';
  }

  @override
  String get exitApp => 'Moonfin гарах уу?';

  @override
  String get exitAppConfirmation => 'Та гарахдаа итгэлтэй байна уу?';

  @override
  String get exit => 'Гарах';

  @override
  String get gameMenu => 'Цэс';

  @override
  String get gamePaused => 'Түр зогссон';

  @override
  String get gameSaveState => 'Төлөв хадгалах';

  @override
  String get games => 'Тоглоомууд';

  @override
  String get gameLoadState => 'Төлөв ачаалах';

  @override
  String get gameFastForward => 'Хурдан урагшлуулах';

  @override
  String get gameEmulatorSettings => 'Эмуляторын тохиргоо';

  @override
  String get gameNoCoreOptions => 'Энэ цөмд тохируулах сонголт байхгүй.';

  @override
  String get gameHoldToOpenMenu => 'Цэс нээхийн тулд удаан дарна уу';

  @override
  String get gamePlaybackUnsupported =>
      'Энэ төхөөрөмж дээр тоглоом тоглуулахыг хараахан дэмжээгүй байна.';

  @override
  String get noHomeRowsLoaded => 'Нүүр хуудасны мөрийг ачаалж чадсангүй';

  @override
  String get noHomeRowsHint =>
      'Идэвхтэй гэрийн хэсгүүдийг сэргээж эсвэл багасгаж үзээрэй.';

  @override
  String get retryHomeRows => 'Нүүр хуудасны мөрүүдийг дахин оролдоно уу';

  @override
  String get guide => 'Хөтөч';

  @override
  String get recordings => 'Бичлэгүүд';

  @override
  String get schedule => 'Хуваарь';

  @override
  String get series => 'Цуврал';

  @override
  String get noItemsFound => 'Ямар ч зүйл олдсонгүй';

  @override
  String get home => 'Нүүр';

  @override
  String get browseAll => 'Бүгдийг үзэх';

  @override
  String get genres => 'Төрөл';

  @override
  String get collectionPlaceholder => 'Цуглуулгын зүйлс энд харагдах болно';

  @override
  String get browseByLetter => 'Үсгээр хайх';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Цагаан толгойн дарааллаар хайх энд гарч ирнэ';

  @override
  String get suggestions => 'Саналууд';

  @override
  String get suggestionsPlaceholder =>
      'Санал болгож буй зүйлс энд харагдах болно';

  @override
  String get failedToLoadLibraries => 'Номын санг ачаалж чадсангүй';

  @override
  String get noLibrariesFound => 'Номын сан олдсонгүй';

  @override
  String get library => 'Медиа сан';

  @override
  String get displaySettings => 'Дэлгэцийн тохиргоо';

  @override
  String get allGenres => 'Бүх төрөл';

  @override
  String get noGenresFound => 'Төрөл олдсонгүй';

  @override
  String failedToLoadFolderError(String error) {
    return 'Фолдерыг ачаалж чадсангүй: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Энэ хавтас хоосон байна';

  @override
  String itemCountLabel(int count) {
    return '$count зүйлс';
  }

  @override
  String get failedToLoadFavorites => 'Дуртай зүйлсийг ачаалж чадсангүй';

  @override
  String get retry => 'Дахин оролдоно уу';

  @override
  String get noFavoritesYet => 'Одоогоор дуртай зүйл алга';

  @override
  String get favorites => 'Дуртай';

  @override
  String totalCountItems(int count) {
    return '$count Зүйлс';
  }

  @override
  String get continuing => 'Үргэлжлүүлж байна';

  @override
  String get ended => 'Дууслаа';

  @override
  String get sortAndFilter => 'Эрэмбэлэх, шүүх';

  @override
  String get type => 'Төрөл';

  @override
  String get sortBy => 'Эрэмбэлэх';

  @override
  String get display => 'Дэлгэц';

  @override
  String get imageType => 'Зургийн төрөл';

  @override
  String get posterSize => 'Зурагт хуудасны хэмжээ';

  @override
  String get small => 'Жижиг';

  @override
  String get medium => 'Дунд зэрэг';

  @override
  String get large => 'Том';

  @override
  String get extraLarge => 'Хэт том';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Төрөл';
  }

  @override
  String get views => 'Үзсэн тоо';

  @override
  String get albums => 'Цомгууд';

  @override
  String get albumArtists => 'Цомгийн уран бүтээлчид';

  @override
  String get artists => 'Уран бүтээлчид';

  @override
  String get bookmarks => 'Хавчуурга';

  @override
  String get noSavedBookmarks =>
      'Энэ гарчигт хадгалагдсан хавчуурга хараахан алга.';

  @override
  String get openBook => 'Нээлттэй ном';

  @override
  String get chapter => 'Бүлэг';

  @override
  String get page => 'Хуудас';

  @override
  String get bookmark => 'Хавчуурга';

  @override
  String get justNow => 'Яг одоо';

  @override
  String minutesAgo(int count) {
    return '$count м өмнө';
  }

  @override
  String hoursAgo(int count) {
    return '$count цагийн өмнө';
  }

  @override
  String daysAgo(int count) {
    return '${count}d өмнө';
  }

  @override
  String get discoverySubjects => 'Нээлтийн сэдвүүд';

  @override
  String get pickDiscoverySubjects =>
      'Discover дээр ямар сэдвийн хангамжийг харуулахыг сонгоно уу.';

  @override
  String get apply => 'Хэрэглэх';

  @override
  String get openLink => 'Холбоосыг нээх';

  @override
  String get scanWithYourPhone => 'Утсаараа сканнердах';

  @override
  String get audiobookGenres => 'Аудио номын төрөл';

  @override
  String get pickAudiobookGenres =>
      'Аудио ном Discover дээр ямар төрлийг харуулахаа сонгоно уу.';

  @override
  String get discoverAudiobooks => 'Аудио номтой танилц';

  @override
  String get librivoxDescription =>
      'LibriVox-аас алдартай нийтийн домэйн гарчиг.';

  @override
  String titlesCount(int count) {
    return '$count гарчиг';
  }

  @override
  String get scrollLeft => 'Зүүн тийш гүйлгэх';

  @override
  String get scrollRight => 'Баруун тийш гүйлгэх';

  @override
  String get couldNotLoadGenre => 'Энэ жанрыг яг одоо ачаалж чадсангүй.';

  @override
  String get continueReading => 'Үргэлжлүүлэн унших';

  @override
  String get savedHighlights => 'Хадгалсан онцлох үйл явдлууд';

  @override
  String get continueListening => 'Үргэлжлүүлэн сонсох';

  @override
  String get listen => 'Сонсооч';

  @override
  String get resume => 'Үргэлжлүүлэх';

  @override
  String get failedToLoadLibrary => 'Номын санг ачаалж чадсангүй';

  @override
  String get popularNow => 'Одоо алдартай';

  @override
  String get savedForLater => 'Дараа нь хадгалсан';

  @override
  String get topListens => 'Шилдэг сонсогч';

  @override
  String get unreadDiscoveries => 'Уншаагүй нээлтүүд';

  @override
  String get pickUpAgain => 'Дахин авах';

  @override
  String get bookHighlightsDescription =>
      'Таны онцлох зүйл, дуртай эсвэл уншсан явцтай номнууд.';

  @override
  String get handPickedFromLibrary => 'Таны номын сангаас гар аргаар сонгов.';

  @override
  String get handPickedFromListeningQueue =>
      'Таны сонсох дарааллаас гараар сонгосон.';

  @override
  String get booksWithHighlights => 'Онцлох, дуртай, унших явцтай номууд.';

  @override
  String get jumpBackNarration =>
      'Өөрийн байрыг хайхгүйгээр хүүрнэл рүү буцна уу.';

  @override
  String get unreadBooksReady =>
      'Уншаагүй номнууд дараагийн чимээгүй цагт бэлэн байна.';

  @override
  String get quickAccessFavorites =>
      'Та байнга эргэж ирдэг номнууддаа хурдан хандах боломжтой.';

  @override
  String get searchAudiobooks => 'Аудио ном хайх';

  @override
  String get searchYourLibrary => 'Номын сангаа хай';

  @override
  String get pickUpStory => 'Түүхээ орхисон газраасаа үргэлжлүүлээрэй';

  @override
  String get savedPlacesChapters =>
      'Таны хадгалсан газрууд болон дуусаагүй бүлгүүд';

  @override
  String authorsCount(int count) {
    return '$count зохиогчид';
  }

  @override
  String genresCount(int count) {
    return '$count төрөл';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% дууссан';
  }

  @override
  String get readyWhenYouAre => 'Чамайг байхад бэлэн';

  @override
  String get details => 'Дэлгэрэнгүй мэдээлэл';

  @override
  String get listeningRoom => 'Сонсох өрөө';

  @override
  String get bookmarksAndProgress => 'Хавчуурга ба явц';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count гарчигуудыг эхлээд уншихад зориулагдсан.';
  }

  @override
  String get titles => 'Гарчиг';

  @override
  String get allTitles => 'Бүх гарчиг';

  @override
  String get authors => 'Зохиогчид';

  @override
  String get browseByAuthor => 'Зохиогчоор нь үзэх';

  @override
  String get browseByGenre => 'Төрөлөөр нь үзэх';

  @override
  String get discover => 'Танилцах';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library сэдвийн дагуу трэнд болж буй гарчиг.';

  @override
  String get noBookmarkedItems => 'Одоогоор хавчуурга тэмдэглэсэн зүйл алга';

  @override
  String get nothingMatchesSection =>
      'Одоогоор энэ хэсэгт тохирох зүйл алга. Номын сангийн синхрончлол дууссаны дараа өөр табыг оролдох эсвэл буцаж ирнэ үү.';

  @override
  String get audiobooks => 'Аудио номууд';

  @override
  String noLabelFound(String label) {
    return '$label олдсонгүй';
  }

  @override
  String get folder => 'Хавтас';

  @override
  String get filters => 'Шүүлтүүр';

  @override
  String get readingStatus => 'Унших байдал';

  @override
  String get playedStatus => 'Тоглосон байдал';

  @override
  String get readStatus => 'Унших';

  @override
  String get watched => 'Үзсэн';

  @override
  String get unread => 'Уншаагүй';

  @override
  String get unwatched => 'Үзээгүй';

  @override
  String get seriesStatus => 'Цуврал статус';

  @override
  String get allLibraries => 'Бүх номын сан';

  @override
  String get books => 'Номууд';

  @override
  String get latestBooks => 'Шинэ номууд';

  @override
  String get latestAudiobooks => 'Шинэ аудио номууд';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ном',
      one: '1 ном',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Ном';

  @override
  String get bookFormatAudiobook => 'Аудио ном';

  @override
  String bookPercentRead(int percent) {
    return '$percent% уншсан';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time үлдсэн';
  }

  @override
  String get bookHeroRead => 'Унших';

  @override
  String get bookHeroListen => 'Сонсох';

  @override
  String get author => 'Зохиогч';

  @override
  String get unknownAuthor => 'Үл мэдэгдэх Зохиогч';

  @override
  String get uncategorized => 'Ангилалгүй';

  @override
  String get overview => 'Тойм';

  @override
  String get noLibrivoxDescription =>
      'Энэ гарчигтай холбоотой тайлбарыг LibriVox хараахан өгөөгүй байна.';

  @override
  String get readers => 'Уншигчид';

  @override
  String get openLinks => 'Холбоосуудыг нээх';

  @override
  String get librivoxPage => 'LibriVox хуудас';

  @override
  String get internetArchive => 'Интернет архив';

  @override
  String get rssFeed => 'RSS хангамж';

  @override
  String get downloadZip => 'Zip татаж авах';

  @override
  String sectionCountLabel(int count) {
    return '$count хэсгүүд';
  }

  @override
  String firstPublished(int year) {
    return 'Анх нийтэлсэн $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Open Library-с энэ гарчигтай холбоотой тойм одоогоор алга.';

  @override
  String get subjects => 'Сэдвүүд';

  @override
  String get all => 'Бүгд';

  @override
  String booksCount(int count) {
    return '$count ном';
  }

  @override
  String get couldNotLoadSubject => 'Энэ сэдвийг яг одоо ачаалж чадсангүй.';

  @override
  String get audiobookDetails => 'Аудио номын дэлгэрэнгүй мэдээлэл';

  @override
  String authorsCountTitle(int count) {
    return '$count Зохиогчид';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count аудио ном',
      one: '1 аудио ном',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Дууны жагсаалт';

  @override
  String get itemListPlaceholder => 'Зүйлийн жагсаалт энд гарч ирнэ';

  @override
  String get failedToLoad => 'Ачааж чадсангүй';

  @override
  String get delete => 'Устгах';

  @override
  String get save => 'Хадгалах';

  @override
  String get moreLikeThis => 'Илүү үүнтэй төстэй';

  @override
  String get castAndCrew => 'Жүжигчид ба багийнхан';

  @override
  String get collection => 'Цуглуулга';

  @override
  String get episodes => 'Ангиуд';

  @override
  String get nextUp => 'Дараагийн';

  @override
  String get seasons => 'Улирлууд';

  @override
  String get chapters => 'Бүлгүүд';

  @override
  String get features => 'Онцлогууд';

  @override
  String get movies => 'Кино';

  @override
  String get musicVideos => 'Хөгжмийн видео';

  @override
  String get other => 'Бусад';

  @override
  String get discography => 'Дискографи';

  @override
  String get similarArtists => 'Ижил төстэй уран бүтээлчид';

  @override
  String get tableOfContents => 'Агуулга';

  @override
  String get tracklist => 'Дууны жагсаалт';

  @override
  String discNumber(int number) {
    return 'Диск $number';
  }

  @override
  String get biography => 'Намтар';

  @override
  String get authorDetails => 'Зохиогчийн дэлгэрэнгүй мэдээлэл';

  @override
  String get noOverviewAvailable =>
      'Энэ гарчигтай холбоотой тойм хараахан байхгүй байна.';

  @override
  String get noBiographyAvailable => 'Энэ зохиолчийн намтар байхгүй.';

  @override
  String get noBooksFound => 'Энэ зохиолчийн ном олдсонгүй.';

  @override
  String get unableToLoadAuthorDetails =>
      'Зохиогчийн мэдээллийг яг одоо ачаалах боломжгүй байна.';

  @override
  String published(int year) {
    return 'Нийтэлсэн $year';
  }

  @override
  String get publicationDateUnknown => 'Нийтэлсэн огноо тодорхойгүй';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Улирал',
      one: '1 Улирал',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return '$time-д дуусна';
  }

  @override
  String get items => 'Зүйлс';

  @override
  String get extras => 'Нэмэлтүүд';

  @override
  String get behindTheScenes => 'Хөшигний ард';

  @override
  String get deletedScenes => 'Хасагдсан үзэгдлүүд';

  @override
  String get featurettes => 'Богино баримтат';

  @override
  String get interviews => 'Ярилцлага';

  @override
  String get scenes => 'Үзэгдлүүд';

  @override
  String get shorts => 'Богино кино';

  @override
  String get trailers => 'Трейлерүүд';

  @override
  String timeRemaining(String time) {
    return '$time үлдсэн';
  }

  @override
  String endsIn(String time) {
    return '$time-ийн дараа дуусна';
  }

  @override
  String get view => 'Харах';

  @override
  String get resumeReading => 'Уншихыг үргэлжлүүлэх';

  @override
  String get read => 'Унших';

  @override
  String resumeFrom(String position) {
    return '$position-с анкет';
  }

  @override
  String get play => 'Тоглуулах';

  @override
  String get startOver => 'Дахин эхлүүлэх';

  @override
  String get restart => 'Дахин эхлүүлэх';

  @override
  String get readOffline => 'Офлайнаар уншина уу';

  @override
  String get playOffline => 'Офлайнаар тогло';

  @override
  String get audio => 'Аудио';

  @override
  String get subtitles => 'Хадмал орчуулга';

  @override
  String get version => 'Хувилбар';

  @override
  String get cast => 'Дамжуулах';

  @override
  String get trailer => 'Трейлер';

  @override
  String get finished => 'Дууслаа';

  @override
  String get favorited => 'Дуртай';

  @override
  String get favorite => 'Дуртай';

  @override
  String get playlist => 'Тоглуулах жагсаалт';

  @override
  String get downloaded => 'Татаж авсан';

  @override
  String get downloadAll => 'Бүгдийг татаж авах';

  @override
  String get download => 'Татаж авах';

  @override
  String get deleteDownloaded => 'Татаж авсан устгах';

  @override
  String get goToSeries => 'Цуврал руу оч';

  @override
  String get editMetadata => 'Мета өгөгдлийг засах';

  @override
  String get less => 'Бага';

  @override
  String get more => 'Илүү';

  @override
  String get deleteItem => 'Зүйлийг устгах';

  @override
  String get deletePlaylist => 'Тоглуулах жагсаалтыг устгах';

  @override
  String get deletePlaylistMessage =>
      'Энэ тоглуулах жагсаалтыг серверээс устгах уу?';

  @override
  String get deleteItemMessage => 'Энэ зүйлийг серверээс устгах уу?';

  @override
  String get failedToDeletePlaylist => 'Тоглуулах жагсаалтыг устгаж чадсангүй';

  @override
  String get failedToDeleteItem => 'Зүйлийг устгаж чадсангүй';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Тоглуулах жагсаалтын нэрийг өөрчлөх';

  @override
  String get playlistName => 'Тоглуулах жагсаалтын нэр';

  @override
  String get deleteDownloadedAlbum => 'Татаж авсан цомгийг устгах';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\"-д татагдсан дуунуудыг устгах уу?';
  }

  @override
  String get downloadedTracksDeleted => 'Татаж авсан дуунуудыг устгасан';

  @override
  String get downloadedTracksDeleteFailed =>
      'Татаж авсан зарим дууг устгаж чадсангүй';

  @override
  String get noTracksLoaded => 'Ачаалагдсан зам алга';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel ачаалагдсангүй';
  }

  @override
  String downloadingTitle(String title, int count) {
    return '$title ($count зүйл) татаж авч байна...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Та \"$name\"-г серверээс устгахдаа итгэлтэй байна уу? Энэ үйлдлийг буцаах боломжгүй.';
  }

  @override
  String get itemDeleted => 'Зүйлийг устгасан';

  @override
  String get noPlayableTrailerFound => 'Тоглуулах боломжтой трейлер олдсонгүй.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Дэмжигдээгүй номын формат: .$extension';
  }

  @override
  String get audioTrack => 'Аудио зам';

  @override
  String get subtitleTrack => 'Хадмал орчуулга';

  @override
  String get none => 'Байхгүй';

  @override
  String get downloadSubtitlesLabel => 'Хадмал орчуулгыг татаж авах...';

  @override
  String get searchOpenSubtitlesPlugin => 'OpenSubtitles залгаасыг ашиглан хай';

  @override
  String get downloadSubtitles => 'Хадмал орчуулгыг татаж авах';

  @override
  String get selectedSubtitleInvalid => 'Сонгосон хадмал орчуулга буруу байна.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Хадмалыг татаж аваад сонгосон: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Хадмал татаж авсан. Jellyfin тухайн зүйлийг шинэчлэх үед гарч ирэхэд хэсэг хугацаа зарцуулагдаж магадгүй.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language-д алсын хадмал олдсонгүй.';
  }

  @override
  String get selectVersion => 'Хувилбарыг сонгоно уу';

  @override
  String versionNumber(int number) {
    return 'Хувилбар $number';
  }

  @override
  String get downloadAllQuality => 'Бүгдийг татаж авах - Чанартай';

  @override
  String get downloadQuality => 'Чанарыг татаж авах';

  @override
  String get originalFileNoReencoding => 'Эх файл, дахин кодчилолгүй';

  @override
  String get originalFilesNoReencoding => 'Эх файлууд, дахин кодчилолгүй';

  @override
  String get noEpisodesLoaded => 'Ямар ч анги ачаалагдсангүй';

  @override
  String downloadingItem(String name, String quality) {
    return '$name ($quality) татаж байна...';
  }

  @override
  String get deleteDownloadedFiles => 'Татаж авсан файлуудыг устгах';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel-н дотоод файлуудыг устгах уу?\n\nЭнэ нь хадгалах зайг чөлөөлнө. Та дараа дахин татаж авах боломжтой.';
  }

  @override
  String get downloadedFilesDeleted => 'Татаж авсан файлуудыг устгасан';

  @override
  String get failedToDeleteFiles => 'Файлуудыг устгаж чадсангүй';

  @override
  String get deleteFiles => 'Файлуудыг устгах';

  @override
  String get director => 'ЗАХИРАЛ';

  @override
  String get directors => 'НАЙРУУЛАГЧИД';

  @override
  String get writer => 'ЗОХИОЛЧ';

  @override
  String get writers => 'ЗОХИОЛЧИД';

  @override
  String get studio => 'СТУДО';

  @override
  String studioMoreCount(int count) {
    return '+$count бусад';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Ангиуд';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Анги $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Бүлэг $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дуу',
      one: '1 дуу',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count бүлэг',
      one: '1 бүлэг',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Төрсөн $date';
  }

  @override
  String died(String date) {
    return 'Нас барсан $date';
  }

  @override
  String age(int age) {
    return 'Нас $age';
  }

  @override
  String get showLess => 'Бага харуулах';

  @override
  String get readMore => 'Дэлгэрэнгүй унших';

  @override
  String get shuffle => 'Холих';

  @override
  String get shuffleAllMusic => 'Бүх хөгжмийг холих';

  @override
  String get carSignInPrompt => 'Утсан дээрээ Moonfin-д нэвтэрнэ үү';

  @override
  String get carServerUnreachable => 'Таны сервертэй холбогдож чадсангүй';

  @override
  String downloadsCount(int count) {
    return '$count татагдсан';
  }

  @override
  String get perfectMatch => 'Төгс тохирох';

  @override
  String channelsCount(int count) {
    return '$count суваг';
  }

  @override
  String get mono => 'Моно';

  @override
  String get stereo => 'Стерео';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Алсын хадмал $action нь энэ хэрэглэгчээс Jellyfin хадмал орчуулгын удирдлагын зөвшөөрөл шаарддаг.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Энэ зүйлийг $action алсын хадмал орчуулгын серверээс олж чадсангүй.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Алсын хадмал $action амжилтгүй болсон: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Алсын хадмал $action амжилтгүй болсон (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '$action алсаас хадмал орчуулга хийж чадсангүй.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\"-н татаж авсан бүх анги';
  }

  @override
  String get deleteSeasonFiles => 'Энэ улирлын татаж авсан бүх анги';

  @override
  String get stillWatching => 'Үзсээр л байна уу?';

  @override
  String get unableToLoadTrailerStream => 'Чиргүүл урсгалыг ачаалах боломжгүй.';

  @override
  String get trailerTimedOut => 'Чиргүүл ачаалах явцад хугацаа хэтэрсэн.';

  @override
  String get playbackFailedForTrailer => 'Энэ трейлерийг тоглуулж чадсангүй.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Офлайн тоглуулах үед дамжуулах боломжгүй.';

  @override
  String castActionFailed(String label, String error) {
    return '$label үйлдэл амжилтгүй болсон: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Дамжуулах дууны хэмжээг тохируулж чадсангүй: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Удирдлага';
  }

  @override
  String get deviceVolume => 'Төхөөрөмжийн эзлэхүүн';

  @override
  String get unavailable => 'Боломжгүй';

  @override
  String get pause => 'Түр зогсоох';

  @override
  String get syncPosition => 'Синк байрлал';

  @override
  String stopCast(String label) {
    return 'Зогс $label';
  }

  @override
  String get queueIsEmpty => 'Дараалал хоосон байна';

  @override
  String trackNumber(int number) {
    return '$number-р дуу';
  }

  @override
  String get remotePlayback => 'Алсын тоглуулах';

  @override
  String get castingToGoogleCast => 'Google Cast руу дамжуулж байна';

  @override
  String get castingViaAirPlay => 'AirPlay-р дамжуулж байна';

  @override
  String get castingViaDlna => 'DLNA-р дамжуулж байна';

  @override
  String secondsCount(int seconds) {
    return '$seconds секунд';
  }

  @override
  String get longPressToUnlock => 'Түгжээг тайлахын тулд удаан дарна уу';

  @override
  String get off => 'Унтраах';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Авто';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Битийн хурдыг дарах';

  @override
  String get audioDelay => 'Аудио саатал';

  @override
  String delayMinusMs(int value) {
    return '-$valueмс';
  }

  @override
  String delayPlusMs(int value) {
    return '+$valueмс';
  }

  @override
  String get subtitleDelay => 'Хадмал орчуулгын саатал';

  @override
  String get reset => 'Дахин тохируулах';

  @override
  String get unknown => 'Тодорхойгүй';

  @override
  String get playbackInformation => 'Тоглуулах мэдээлэл';

  @override
  String get playback => 'Тоглуулах';

  @override
  String get playMethod => 'Тоглоомын арга';

  @override
  String get directPlay => 'Шууд тоглох';

  @override
  String get directStream => 'Шууд дамжуулалт';

  @override
  String get transcoding => 'Код хувиргах';

  @override
  String get transcodeReasons => 'Код хувиргах шалтгаанууд';

  @override
  String get player => 'Тоглуулагч';

  @override
  String get container => 'Контейнер';

  @override
  String get bitrate => 'Битийн хурд';

  @override
  String get video => 'Видео';

  @override
  String get resolution => 'Шийдвэр';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Кодек';

  @override
  String get videoBitrate => 'Видео битийн хурд';

  @override
  String get track => 'Трек';

  @override
  String get channels => 'Сувгууд';

  @override
  String get audioBitrate => 'Аудио битийн хурд';

  @override
  String get sampleRate => 'Дээжийн хурд';

  @override
  String get format => 'Формат';

  @override
  String get external => 'Гадаад';

  @override
  String get embedded => 'Суулгасан';

  @override
  String castSessionError(String protocol) {
    return '$protocol сессийн алдаа';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Номын дэлгэрэнгүйг ачаалж чадсангүй: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Энэ платформ дээр апп доторх EPUB дүрслэл хараахан боломжгүй байна.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Энэ форматыг (.$extension) одоохондоо апп дотор харуулах боломжгүй.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Энэ платформ дээр суулгагдсан баримт бичгийг үзүүлэх боломжгүй.';

  @override
  String get couldNotOpenExternalViewer => 'Гадаад үзэгчийг нээж чадсангүй.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Апп-доторх уншигчийг нээж чадсангүй: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Хавчуурга $label дээр аль хэдийн хадгалагдсан.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Хавчуурга нэмсэн: $label';
  }

  @override
  String get noBookmarksYet =>
      'Одоогоор хавчуурга алга.\nУншиж байхдаа хавчуургын дүрс дээр товшоод байрлалаа хадгална уу.';

  @override
  String get noTableOfContentsAvailable => 'Агуулгын хүснэгт байхгүй';

  @override
  String pageLabel(int number) {
    return 'Хуудас $number';
  }

  @override
  String get position => 'Албан тушаал';

  @override
  String get bookReader => 'Ном уншигч';

  @override
  String formatExtension(String extension) {
    return 'Формат: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% уншсан';
  }

  @override
  String get updating => 'Шинэчилж байна...';

  @override
  String get markUnread => 'Уншаагүй гэж тэмдэглэ';

  @override
  String get markAsRead => 'Уншсан гэж тэмдэглэх';

  @override
  String get reloadReader => 'Уншигчийг дахин ачаална уу';

  @override
  String get noPagesFound => 'Ямар ч хуудас олдсонгүй.';

  @override
  String get failedToDecodePageImage => 'Хуудасны зургийг тайлж чадсангүй.';

  @override
  String resetZoom(String zoom) {
    return 'Томруулахыг дахин тохируулах (${zoom}x)';
  }

  @override
  String get singlePage => 'Нэг хуудас';

  @override
  String get twoPageSpread => 'Хоёр хуудасны тархалт';

  @override
  String get addBookmark => 'Хавчуурга нэмэх';

  @override
  String get bookmarksEllipsis => 'Хавчуурга...';

  @override
  String get markedAsRead => 'Уншсан гэж тэмдэглэсэн';

  @override
  String get markedAsUnread => 'Уншаагүй гэж тэмдэглэсэн';

  @override
  String failedToUpdateReadState(String error) {
    return 'Уншсан төлөвийг шинэчилж чадсангүй: $error';
  }

  @override
  String get themeSystem => 'Сэдэв: Систем';

  @override
  String get themeLight => 'Сэдэв: Гэрэл';

  @override
  String get themeDark => 'Сэдэв: Харанхуй';

  @override
  String get themeSepia => 'Сэдэв: Сепиа';

  @override
  String get invertColorsFixedLayout => 'Өнгө хувиргах (тогтмол байршил)';

  @override
  String get invertColorsPdf => 'Өнгө хувиргах (PDF)';

  @override
  String get preparingInAppReader => 'Апп-доторх уншигч бэлтгэж байна...';

  @override
  String get pdfDataNotAvailable => 'PDF өгөгдөл байхгүй байна.';

  @override
  String get readerFallbackModeActive =>
      'Уншигчийн нөхөн сэргээх горим идэвхтэй байна';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Энэ платформ нь $extension файлд суулгагдсан баримт бичгийн системийг байршуулах боломжгүй.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Дэмжигдсэн платформ (Android, iOS, macOS) руу шилжсэний дараа Reload Reader ашиглана уу.';

  @override
  String get openExternally => 'Гаднах байдлаар нээх';

  @override
  String get noEpubChaptersFound => 'EPUB бүлэг олдсонгүй.';

  @override
  String get readerNotReady => 'Уншигч бэлэн биш байна.';

  @override
  String get seriesRecordings => 'Цуврал бичлэгүүд';

  @override
  String get now => 'Одоо';

  @override
  String get sports => 'Спорт';

  @override
  String get news => 'Мэдээ';

  @override
  String get kids => 'Хүүхдүүд';

  @override
  String get premiere => 'Нээлтийн үзүүлбэр';

  @override
  String get guideTimeline => 'Хөтөч он цагийн хэлхээс';

  @override
  String failedToLoadGuide(String error) {
    return 'Удирдамжийг ачаалж чадсангүй: $error';
  }

  @override
  String get noChannelsFound => 'Суваг олдсонгүй';

  @override
  String get liveBadge => 'ШУУД';

  @override
  String guideNextProgram(String time, String title) {
    return 'Дараах: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutesм үлдсэн';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hoursц үлдсэн';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hoursц $minutesм үлдсэн';
  }

  @override
  String get movie => 'Кино';

  @override
  String get removedFromFavoriteChannels => 'Дуртай сувгуудаас хасагдсан';

  @override
  String get addedToFavoriteChannels => 'Дуртай сувгууддаа нэмсэн';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Дуртай сувгийг шинэчилж чадсангүй';

  @override
  String get unfavoriteChannel => 'Дургүй суваг';

  @override
  String get favoriteChannel => 'Дуртай суваг';

  @override
  String get record => 'Бичих';

  @override
  String get cancelRecordingAction => 'Бичлэгийг цуцлах';

  @override
  String get programSetToRecord => 'Програмыг бичихээр тохируулсан';

  @override
  String get recordingCancelled => 'Бичлэгийг цуцалсан';

  @override
  String get unableToCreateRecording => 'Бичлэг үүсгэх боломжгүй';

  @override
  String get watch => 'Үзэх';

  @override
  String get close => 'Хаах';

  @override
  String failedToPlayChannel(String name) {
    return '$name тоглож чадсангүй';
  }

  @override
  String get failedToLoadRecordings => 'Бичлэгүүдийг ачаалж чадсангүй';

  @override
  String get scheduledInNext24Hours => 'Дараагийн 24 цагийн хуваарь';

  @override
  String get recentRecordings => 'Сүүлийн үеийн бичлэгүүд';

  @override
  String get tvSeries => 'Телевизийн цуврал';

  @override
  String get failedToLoadSchedule => 'Хуваарийг ачаалж чадсангүй';

  @override
  String get noScheduledRecordings => 'Төлөвлөсөн бичлэг байхгүй';

  @override
  String get cancelRecording => 'Бичлэгийг цуцлах уу?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\"-н төлөвлөсөн бичлэгийг цуцлах уу?';
  }

  @override
  String get no => 'Үгүй';

  @override
  String get yesCancel => 'Тийм ээ, Цуцлах';

  @override
  String get failedToCancelRecording => 'Бичлэгийг цуцалж чадсангүй';

  @override
  String get failedToLoadSeriesRecordings =>
      'Цуврал бичлэгүүдийг ачаалж чадсангүй';

  @override
  String get noSeriesRecordings => 'Цуврал бичлэг байхгүй';

  @override
  String get cancelSeriesRecording => 'Цуврал бичлэгийг цуцлах';

  @override
  String get cancelSeriesRecordingQuestion => 'Цуврал бичлэгийг цуцлах уу?';

  @override
  String stopRecordingName(String name) {
    return '\"$name\" бичлэгийг зогсоох уу?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Цуврал бичлэгийг цуцалж чадсангүй';

  @override
  String get searchThisLibrary => 'Энэ номын сангаас хайх...';

  @override
  String get searchEllipsis => 'Хайх...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\"-н илэрц олдсонгүй';
  }

  @override
  String searchFailedError(String error) {
    return 'Хайлт амжилтгүй болсон: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr бүртгэлийн төрөл';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Орон нутгийн';

  @override
  String get savedMedia => 'Хадгалсан медиа';

  @override
  String get tvShows => 'ТВ шоунууд';

  @override
  String get music => 'Хөгжим';

  @override
  String get musicAlbums => 'Хөгжмийн цомгууд';

  @override
  String get noMediaInFilter => 'Энэ шүүлтүүрт медиа байхгүй байна';

  @override
  String get noDownloadedMediaYet => 'Татаж авсан медиа хараахан алга';

  @override
  String get browseLibrary => 'Номын санг үзэх';

  @override
  String get deleteDownload => 'Татаж авахыг устгах';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\" болон түүний файлуудыг устгах уу?';
  }

  @override
  String tracksCount(int count) {
    return '$count замууд';
  }

  @override
  String get album => 'Цомог';

  @override
  String get playAlbum => 'Цомог тоглох';

  @override
  String failedToLoadAlbum(String error) {
    return 'Цомгийг ачаалж чадсангүй: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name-д татагдсан дуу олдсонгүй.';
  }

  @override
  String get season => 'Улирал';

  @override
  String get errorLoadingEpisodes => 'Ангиудыг ачаалахад алдаа гарлаа';

  @override
  String get noDownloadedEpisodes => 'Татаж авсан анги байхгүй';

  @override
  String get deleteEpisode => 'Ангийг устгах';

  @override
  String removeName(String name) {
    return '\"$name\"-г устгах уу?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Анги $number';
  }

  @override
  String get seriesNotFound => 'Цуврал олдсонгүй';

  @override
  String get errorLoadingSeries => 'Цувралыг ачаалахад алдаа гарлаа';

  @override
  String get downloadedEpisodes => 'Татаж авсан ангиуд';

  @override
  String seasonNumber(int number) {
    return 'Улирал $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Онцгой';

  @override
  String get deleteSeason => 'Улирлыг устгах';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season-д татагдсан бүх ангийг устгах уу?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count анги',
      one: '1 анги',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Хадгалалтын менежмент';

  @override
  String get storageBreakdown => 'Хадгалалтын задаргаа';

  @override
  String get downloadedItems => 'Татаж авсан зүйлс';

  @override
  String get storageLimit => 'Хадгалах хязгаар';

  @override
  String get noLimit => 'Хязгааргүй';

  @override
  String get deleteAllDownloads => 'Бүх таталтыг устгана уу';

  @override
  String get deleteAllDownloadsWarning =>
      'Энэ нь татаж авсан бүх медиа файлыг устгах бөгөөд буцаах боломжгүй.';

  @override
  String get deleteAll => 'Бүгдийг устгах';

  @override
  String get deleteSelected => 'Сонгосоныг устгах';

  @override
  String deleteSelectedCount(int count) {
    return '$count татаж авсан зүйлсийг устгах уу?';
  }

  @override
  String get musicAndAudiobooks => 'Хөгжим ба аудио ном';

  @override
  String get images => 'Зураг';

  @override
  String get database => 'Өгөгдлийн сан';

  @override
  String ofStorageLimit(String limit) {
    return '$limit хязгаарын';
  }

  @override
  String get settings => 'Тохиргоо';

  @override
  String get authentication => 'Баталгаажуулалт';

  @override
  String get autoLoginServerManagement =>
      'Автоматаар нэвтрэх, серверийн удирдлага';

  @override
  String get pinCode => 'ПИН код';

  @override
  String get setUpPinCodeProtection => 'ПИН кодын хамгаалалтыг тохируулна уу';

  @override
  String get parentalControls => 'Эцэг эхийн хяналт';

  @override
  String get contentRatingRestrictions => 'Агуулгын үнэлгээний хязгаарлалт';

  @override
  String get bitRateResolutionBehavior => 'Битийн хурд, нягтрал, зан төлөв';

  @override
  String get languageSizeAppearance => 'Хэл, хэмжээ, гадаад төрх';

  @override
  String get qualityStorage => 'Чанар, хадгалалт';

  @override
  String get serverSyncAndPluginStatus =>
      'Серверийн синк болон залгаасын төлөв';

  @override
  String get mediaRequestIntegration => 'Хэвлэл мэдээллийн хүсэлтийг нэгтгэх';

  @override
  String get switchServer => 'Сервер солих';

  @override
  String get signOut => 'Гарах';

  @override
  String get versionLicenses => 'Хувилбар, лиценз';

  @override
  String get account => 'Данс';

  @override
  String get signInAndSecurity => 'Нэвтрэх ба аюулгүй байдал';

  @override
  String get administration => 'Захиргаа';

  @override
  String get serverSettingsUsersLibraries =>
      'Серверийн тохиргоо, хэрэглэгчид, номын сан';

  @override
  String get customization => 'Тохируулга';

  @override
  String get themeAndLayout => 'Сэдэв ба зохион байгуулалт';

  @override
  String get videoAndSubtitles => 'Видео болон хадмал орчуулга';

  @override
  String get integrations => 'Интеграци';

  @override
  String get pluginAndRequests => 'Plugin болон хүсэлтүүд';

  @override
  String get customizeAccountPlaybackInterface =>
      'Бүртгэл, тоглуулах болон интерфэйсийн үйлдлийг өөрчлөх';

  @override
  String optionsCount(int count) {
    return '$count сонголтууд';
  }

  @override
  String get themeAndAppearance => 'Сэдэв ба харагдах байдал';

  @override
  String get focusBorderColor => 'Фокус хүрээний өнгө';

  @override
  String get watchedIndicators => 'Үзсэн үзүүлэлтүүд';

  @override
  String get always => 'Үргэлж';

  @override
  String get hideUnwatched => 'Үзээгүй нуух';

  @override
  String get episodesOnly => 'Зөвхөн ангиуд';

  @override
  String get never => 'Хэзээ ч үгүй';

  @override
  String get focusExpansionAnimation => 'Фокус өргөтгөх хөдөлгөөнт дүрс';

  @override
  String get desktopUiScale => 'Ширээний UI масштаб';

  @override
  String get scaleFocusedCards =>
      'Төвлөрсөн эсвэл дээш өргөгдсөн картууд болон хавтангуудыг масштабаар тохируулна уу';

  @override
  String get backgroundBackdrops => 'Арын дэвсгэр';

  @override
  String get showBackdropImages =>
      'Агуулгын ард байгаа дэвсгэр зургийг харуулах';

  @override
  String get seriesThumbnails => 'Цуврал өнгөц зураг';

  @override
  String get seriesThumbnailsDescription =>
      'Зөвхөн анги: мөр тус бүрийн зургийн төрөлд тохирсон цуврал урлагийн бүтээлийг ашиглана уу';

  @override
  String get homeRowInfoOverlay => 'Нүүр хуудасны эгнээний мэдээллийн давхарга';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Нүүр мөрийг үзэх үед гарчиг болон мета өгөгдлийг харуул';

  @override
  String get clockDisplay => 'Цагны дэлгэц';

  @override
  String get inMenus => 'Цэс дотор';

  @override
  String get inVideo => 'Видеонд';

  @override
  String get seasonalEffects => 'Улирлын нөлөө';

  @override
  String get seasonalEffectsDescription => 'Визуал эффект, улирлын чимэглэл';

  @override
  String get snow => 'Цас';

  @override
  String get fireworks => 'Галын наадам';

  @override
  String get confetti => 'Конфетти';

  @override
  String get fallingLeaves => 'Унаж буй навчис';

  @override
  String get themeMusic => 'Сэдвийн хөгжим';

  @override
  String get playThemeMusicOnDetailPages =>
      'Дэлгэрэнгүй хуудсууд дээр сэдэвчилсэн хөгжмийг тоглуулаарай';

  @override
  String get themeMusicVolume => 'Сэдвийн хөгжмийн хэмжээ';

  @override
  String get themeMusicSettingsSubtitle =>
      'Дэлгэрэнгүй хуудас, нүүр хуудасны эгнээ, дууны хэмжээ';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Гэрийн эгнээнд сэдэвчилсэн хөгжим';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Үндсэн дэлгэцийг үзэх үед тоглуулаарай';

  @override
  String get loopThemeMusic => 'Сэдвийн хөгжмийг давтах';

  @override
  String get loopThemeMusicSubtitle =>
      'Нэг удаа тоглуулахын оронд дууг давтана';

  @override
  String get detailsBackgroundBlur =>
      'Дэлгэрэнгүй мэдээлэл Дэвсгэр бүдгэрүүлэх';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

  @override
  String get detailsBackgroundOpacitySubtitle =>
      'Adjust amount of opacity on modern detail pages from light to dark.';

  @override
  String get opacityLightest => 'Lightest';

  @override
  String get opacityLight => 'Light';

  @override
  String get opacityMedium => 'Medium';

  @override
  String get opacityDark => 'Dark';

  @override
  String get opacityDarkest => 'Darkest';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Арын дэвсгэрийг бүдгэрүүлэх';

  @override
  String get maxStreamingBitrate => 'Хамгийн их урсгалын битийн хурд';

  @override
  String get maxResolution => 'Хамгийн их нарийвчлал';

  @override
  String get playerZoomMode => 'Тоглогчийн томруулах горим';

  @override
  String get settingsScrollWheelAction => 'Хулганы гүйлгэх дугуй';

  @override
  String get settingsScrollWheelActionDescription =>
      'Тоглуулж байх үед видеон дээр хулганы дугуйг гүйлгэхэд юу хийхийг сонгоно уу.';

  @override
  String get scrollWheelActionOff => 'Унтраах';

  @override
  String get scrollWheelActionSeek => 'Гүйлгэх (урагш / хойш)';

  @override
  String get scrollWheelActionVolume => 'Дууны хэмжээ';

  @override
  String get playerTooltipVolume => 'Дууны хэмжээ';

  @override
  String get fit => 'Тохиромжтой';

  @override
  String get autoCrop => 'Автомат тайрах';

  @override
  String get stretch => 'Сунгах';

  @override
  String get refreshRateSwitching => 'Сэргээх хурдыг өөрчлөх';

  @override
  String get disabled => 'Идэвхгүй';

  @override
  String get scaleOnTv => 'Зурагтаар масштаблах';

  @override
  String get scaleOnDevice => 'Төхөөрөмж дээрх масштаб';

  @override
  String get trickPlay => 'Трик тоглох';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Хайх үед урьдчилан харах өнгөц зургийг харуул';

  @override
  String get showDescriptionOnPause => 'Түр зогсолт дээр тайлбарыг харуулах';

  @override
  String get dimVideoShowOverview =>
      'Түр зогсоох үед видеог бүдгэрүүлж, тойм текстийг харуул';

  @override
  String get osdLockButton => 'OSD түгжээний товчлуур';

  @override
  String get osdLockButtonDescription =>
      'Удаан дарах хүртэл мэдрэгчтэй оролтыг блоклодог түгжих товчлуурыг харуул';

  @override
  String get audioBehavior => 'Аудио зан үйл';

  @override
  String get downmixToStereo => 'Стерео руу буулгах';

  @override
  String get defaultAudioLanguage => 'Өгөгдмөл аудио хэл';

  @override
  String get fallbackAudioLanguage => 'Нөөц аудио хэл';

  @override
  String get preferDefaultAudioTrack => 'Үндсэн аудио замыг эрхэмлэх';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Орчуулсан дубляжаас илүү эх аудио замыг эрхэмлэнэ.';

  @override
  String get preferAudioDescription => 'Аудио тайлбарын замыг эрхэмлэх';

  @override
  String get preferAudioDescriptionDescription =>
      'Энгийн замаас илүү аудио тайлбарын замыг эрхэмлэнэ.';

  @override
  String get transcodingAudio => 'Хөрвүүлэлт (Аудио)';

  @override
  String get directStreamRemux => 'Шууд урсгал (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Хөрвүүлэлт (Битрэйт эсвэл Нягтрал)';

  @override
  String get transcodingVideoAndAudio => 'Хөрвүүлэлт (Видео ба Аудио)';

  @override
  String get transcodingVideo => 'Хөрвүүлэлт (Видео)';

  @override
  String get autoServerDefault => 'Автомат (Серверийн өгөгдмөл)';

  @override
  String get english => 'Англи';

  @override
  String get spanish => 'Испани';

  @override
  String get french => 'Франц';

  @override
  String get german => 'Герман';

  @override
  String get italian => 'итали';

  @override
  String get portuguese => 'португал';

  @override
  String get japanese => 'Япон';

  @override
  String get korean => 'Солонгос';

  @override
  String get chinese => 'Хятад';

  @override
  String get russian => 'орос';

  @override
  String get arabic => 'Араб';

  @override
  String get hindi => 'Хинди';

  @override
  String get dutch => 'Голланд';

  @override
  String get swedish => 'швед';

  @override
  String get norwegian => 'Норвеги';

  @override
  String get danish => 'Дани';

  @override
  String get finnish => 'Финланд';

  @override
  String get polish => 'Польш';

  @override
  String get ac3Passthrough => 'AC3 дамжуулалт';

  @override
  String get dtsPassthrough => 'DTS дамжуулалт';

  @override
  String get trueHdSupport => 'TrueHD дэмжлэг';

  @override
  String get enableDtsPassthrough =>
      'DTS дууг зөвхөн AVR руу дамжуулах; хүлээн авагчийн дэмжлэг болон DTS эх сурвалжийн замыг шаарддаг';

  @override
  String get enableTrueHdAudio =>
      'TrueHD аудиог идэвхжүүлэх (бүх платформ дээр ажиллахгүй байж магадгүй)';

  @override
  String get settingsAudioOutputMode => 'Аудио гаралтын горим';

  @override
  String get settingsAudioOutputModeDescription =>
      'Аудиог хэрхэн задлахыг сонгоно уу. AVR дамжуулалт нь Dolby/DTS-ийн түүхий урсгалыг таны хүлээн авагч руу шууд илгээнэ; Авто эсвэл Буулгах нь дотооддоо задална.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR дамжуулалт';

  @override
  String get settingsAudioFallbackCodec => 'Аудио буцаах кодлогч';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Эх урсгалыг шууд тоглуулах буюу дамжуулах боломжгүй үед олон сувгийн аудиог хөрвүүлэх зорилтот форматыг сонгоно уу.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Автоматаар илрүүлэх\n(Зөвлөмжтэй)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Үндсэн)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Алдагдалгүй)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Зөвхөн стерео)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Үр ашигтай)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Алдагдалгүй)';

  @override
  String get settingsMaxAudioChannels => 'Аудио сувгийн дээд хязгаар';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Аудио тохируулгынхаа сувгийн дээд хязгаарыг тохируулна уу. Энэ хязгаараас хэтэрсэн олон сувгийн урсгалыг буулгах буюу хөрвүүлнэ.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Автоматаар илрүүлэх\n(Тоног төхөөрөмжийн үндсэн)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Моно';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Стерео';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Орчны дуу';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Квадрафоник';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Орчны дуу';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Орчны дуу';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Орчны дуу';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Орчны дуу';

  @override
  String get settingsAudioPassthroughAdvanced => 'Дамжуулах (Дэвшилтэт)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec дамжуулалт';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Зөвхөн AVR эсвэл HDMI угаалтуур дэмждэг форматыг идэвхжүүлнэ үү.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 дамжуулалт';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Атмос) нэвтрүүлэх';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core дамжуулалт';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA дамжуулалт';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD дамжуулалт';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos дамжуулалт';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Dolby Digital Plus (EAC3) бит урсгалыг гадаад декодер руу шилжүүлнэ.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'EAC3 (JOC) дээр Dolby Atmos-ыг гадаад декодер руу бит урсгал.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Бит урсгал DTS-HD MA (DTS цөм орно) гадаад декодчилогч руу.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Atmos мета өгөгдөл бүхий Dolby TrueHD бит урсгалыг гадаад декодер руу шилжүүлнэ.';

  @override
  String get settingsDetectedAudioCapabilities => 'Илрүүлсэн аудио чадавхи';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Одоогоор ажиллах цагийн боломжийн агшин зураг байхгүй байна.';

  @override
  String get settingsAudioRouteLabel => 'Маршрут';

  @override
  String get settingsAudioDecodeLabel => 'Код тайлах';

  @override
  String get settingsAudioPassthroughLabel => 'Дамжуулах';

  @override
  String get settingsAudioHdRoute => 'HD аудио зам';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Илтгэгч';

  @override
  String get settingsAudioRouteHeadphones => 'Чихэвч';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count суваг PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Оношлогоо';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Видео түвшин';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Видео хүрээ';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Хадмал кодлогч';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Зөвшөөрөгдсөн аудио кодлогч';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS аудио кодлогч';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 аудио кодлогч';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'аудио-spdif дамжуулалт';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Идэвхтэй аудио зам';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Чиглүүлэлт HD аудио дэмжлэг';

  @override
  String get nightMode => 'Шөнийн горим';

  @override
  String get compressDynamicRange => 'Динамик хүрээг шахах';

  @override
  String get advancedMpv => 'Нарийвчилсан mpv';

  @override
  String get enableCustomMpvConf => 'Custom mpv.conf-г идэвхжүүлнэ үү';

  @override
  String get applyMpvConfBeforePlayback =>
      'Дахин тоглуулахаас өмнө хэрэглэгчийн тодорхойлсон mpv.conf-г ашиглана уу.';

  @override
  String get unsafeAdvancedMpvOptions => 'Аюулгүй Нарийвчилсан mpv Сонголтууд';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv илүү өргөн сонголтуудыг зөвшөөрөх. Тоглуулах горимыг эвдэж болзошгүй.';

  @override
  String get hardwareDecoding => 'Техник хангамжийн код тайлах';

  @override
  String get hardwareDecodingSubtitle =>
      'Гүйцэтгэлийг сайжруулж болох ч зарим төхөөрөмж дээр тоглуулах асуудал үүсгэж болзошгүй.';

  @override
  String get nextUpAndQueuing => 'Дараагийн болон дараалал';

  @override
  String get nextUpDisplay => 'Дараагийн дэлгэц';

  @override
  String get extended => 'Өргөтгөсөн';

  @override
  String get minimal => 'Хамгийн бага';

  @override
  String get nextUpTimeout => 'Дараагийн хугацаа дуусах';

  @override
  String secondsValue(int value) {
    return '$valueс';
  }

  @override
  String get mediaQueuing => 'Хэвлэл мэдээллийн дараалал';

  @override
  String get autoQueueNextEpisodes =>
      'Дараагийн ангиудыг автоматаар дараалалд оруулах';

  @override
  String get stillWatchingPrompt => 'Мэдээллийг үзэж байна';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes ангиудын дараа / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Үргэлжлүүлэх, алгасах';

  @override
  String get resumeRewind => 'Дахин эргүүлэх';

  @override
  String get unpauseRewind => 'Ухраахыг түр зогсоох';

  @override
  String get fiveSeconds => '5 секунд';

  @override
  String get tenSeconds => '10 секунд';

  @override
  String get fifteenSeconds => '15 секунд';

  @override
  String get thirtySeconds => '30 секунд';

  @override
  String get skipBackLength => 'Буцах уртыг алгасах';

  @override
  String get skipForwardLength => 'Урагш уртыг алгасах';

  @override
  String get customMpvConfPath => 'Захиалгат mpv.conf Зам';

  @override
  String get notSetMpvConf =>
      'Тохируулаагүй. Moonfin апп/өгөгдлийн хавтсанд өгөгдмөл mpv.conf-г оролдох болно.';

  @override
  String get selectMpvConf => 'mpv.conf-г сонгоно уу';

  @override
  String get pathToMpvConf => '/зам/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Загварын тохиргоо (хэмжээ, өнгө, офсет) нь текстэд суурилсан хадмал орчуулгад (SRT, VTT, TTML) хамаарна. ASS/SSA хадмал орчуулга нь \"ASS/SSA Direct Play\"-г унтраагаагүй л бол өөрсдийн суулгасан хэв маягийг ашигладаг. Bitmap хадмал орчуулгыг (PGS, DVB, VobSub) өөрчлөх боломжгүй.';

  @override
  String get defaultSubtitleLanguage => 'Өгөгдмөл хадмал орчуулгын хэл';

  @override
  String get defaultToNoSubtitles => 'Өгөгдмөл нь хадмал орчуулгагүй';

  @override
  String get turnOffSubtitlesByDefault =>
      'Анхдагч байдлаар хадмал орчуулгыг унтраа';

  @override
  String get subtitleSize => 'Хадмал орчуулгын хэмжээ';

  @override
  String get textFillColor => 'Текст дүүргэх өнгө';

  @override
  String get backgroundColor => 'Арын өнгө';

  @override
  String get textStrokeColor => 'Текстийн зураасны өнгө';

  @override
  String get subtitleCustomization => 'Хадмал орчуулга';

  @override
  String get subtitleCustomizationDescription =>
      'Хадмал орчуулгын харагдах байдлыг өөрчлөх';

  @override
  String get subtitleMode => 'Хадмалын горим';

  @override
  String get subtitleModeFlagged => 'Тэмдэглэгдсэн';

  @override
  String get subtitleModeAlways => 'Үргэлж';

  @override
  String get subtitleModeForeign => 'Гадаад';

  @override
  String get subtitleModeForced => 'Албадсан';

  @override
  String get subtitleModeFlaggedDescription =>
      'Медиа файлын мета өгөгдөлд \"default\" эсвэл \"forced\" гэж тэмдэглэсэн замыг тоглуулна.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Видео эхлэх бүрд хадмалыг автоматаар ачаалж харуулна.';

  @override
  String get subtitleModeForeignDescription =>
      'Үндсэн аудио зам гадаад хэл дээр байвал хадмалыг автоматаар асаана.';

  @override
  String get subtitleModeForcedDescription =>
      'Зөвхөн forced мета тэмдэгтэй хадмалыг ачаална.';

  @override
  String get subtitleModeNoneDescription =>
      'Хадмалыг автоматаар ачаалахыг бүрэн унтраана.';

  @override
  String get fallbackSubtitleLanguage => 'Нөөц хадмалын хэл';

  @override
  String get subtitleStream => 'Хадмалын урсгал';

  @override
  String get subtitlePreviewText =>
      'Хурдан бор үнэг залхуу нохойн дээгүүр үсэрнэ';

  @override
  String get verticalOffset => 'Босоо тэнхлэг';

  @override
  String get pgsDirectPlay => 'PGS шууд тоглох';

  @override
  String get directPlayPgsSubtitles => 'PGS хадмал орчуулгыг шууд тоглуулах';

  @override
  String get assSsaDirectPlay => 'ASS/SSA шууд тоглох';

  @override
  String get directPlayAssSsaSubtitles => 'ASS/SSA хадмал орчуулгыг шууд тогло';

  @override
  String get white => 'Цагаан';

  @override
  String get black => 'Хар';

  @override
  String get yellow => 'Шар';

  @override
  String get green => 'Ногоон';

  @override
  String get cyan => 'Цэнхэр';

  @override
  String get red => 'Улаан';

  @override
  String get transparent => 'Ил тод';

  @override
  String get semiTransparentBlack => 'Хагас тунгалаг хар';

  @override
  String get global => 'Глобал';

  @override
  String get desktop => 'Ширээний компьютер';

  @override
  String get mobile => 'Гар утас';

  @override
  String get tv => 'ТВ';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile профайлын тохиргоог ачааллаа.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile профайлын тохиргоог ачаалж чадсангүй.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Орон нутгийн тохиргоог $profile профайл руу синк хийсэн.';
  }

  @override
  String get customizationProfile => 'Тохируулах профайл';

  @override
  String get customizationProfileDescription =>
      'Ачаалах, засах, синк хийх профайлаа сонгоно уу. Төхөөрөмжийн профайл үүнийг хүчингүй болгохоос бусад тохиолдолд глобал нь хаа сайгүй хэрэгжинэ. Ногоон цэг нь таны одоогийн төхөөрөмжийн профайлыг тэмдэглэнэ.';

  @override
  String get loadProfile => 'Профайлыг ачаалах';

  @override
  String get syncing => 'Синк хийж байна...';

  @override
  String get syncToProfile => 'Профайл руу синк хийх';

  @override
  String get profileSyncHidden => 'Профайлын синкийг нуусан';

  @override
  String get enablePluginSyncDescription =>
      'Профайлын хяналтыг энд харуулахын тулд Plugin тохиргоонд Серверийн залгаасын синкийг идэвхжүүлнэ үү.';

  @override
  String get quality => 'Чанартай';

  @override
  String get defaultDownloadQuality => 'Өгөгдмөл татаж авах чанар';

  @override
  String get network => 'Сүлжээ';

  @override
  String get wifiOnlyDownloads => 'Зөвхөн WiFi-аар татагдсан файлууд';

  @override
  String get reportDownloadsActivity => 'Татаж авалтыг сервер дээр харуулах';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Серверийн админд таны хөрвүүлсэн татаж авалтыг хяналтын самбараас харах боломж олгоно';

  @override
  String get onlyDownloadOnWifi => 'Зөвхөн WiFi-д холбогдсон үед л татна';

  @override
  String get storage => 'Хадгалах';

  @override
  String get storageUsed => 'Ашигласан хадгалалт';

  @override
  String get manage => 'Удирдах';

  @override
  String get calculating => 'Тооцож байна...';

  @override
  String get downloadLocation => 'Байршлыг татаж авах';

  @override
  String get defaultLabel => 'Өгөгдмөл';

  @override
  String get saveToDownloadsFolder => 'Татаж авсан файлд хадгална уу';

  @override
  String get downloadsVisibleToOtherApps =>
      'Татаж авах/Moonfin — бусад апп-д харагдана';

  @override
  String get dangerZone => 'Аюултай бүс';

  @override
  String get clearAllDownloads => 'Бүх таталтыг арилгах';

  @override
  String get original => 'Жинхэнэ';

  @override
  String get changeDownloadLocation => 'Татаж авах байршлыг өөрчлөх';

  @override
  String get changeDownloadLocationDescription =>
      'Шинэ татагдсан файлууд сонгосон хавтсанд хадгалагдах болно. Одоо байгаа татан авалтууд нь одоогийн байршилдаа үлдэх бөгөөд Хадгалах сангийн тохиргооноос удирдах боломжтой.';

  @override
  String get confirm => 'Баталгаажуулах';

  @override
  String get cannotWriteToFolder =>
      'Сонгосон хавтас руу бичих боломжгүй. Өөр байршил сонгох эсвэл хадгалах зөвшөөрлийг олгоно уу.';

  @override
  String get saveToDownloadsFolderQuestion => 'Татаж авсан файлд хадгалах уу?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Татаж авсан медиа таны төхөөрөмж дээрх Татаж авсан файлууд/Moonfin хэсэгт хадгалагдах болно. Эдгээр файлууд нь таны галерей эсвэл хөгжим тоглуулагч зэрэг бусад програмуудад харагдах болно.\n\nОдоо байгаа татан авалтууд одоогийн байршилдаа хэвээр үлдэнэ.';

  @override
  String get enable => 'Идэвхжүүлэх';

  @override
  String get clearAllDownloadsWarning =>
      'Энэ нь татаж авсан бүх медиаг устгах бөгөөд буцаах боломжгүй.';

  @override
  String get clearAll => 'Бүгдийг арилгах';

  @override
  String get navigationStyle => 'Навигацийн хэв маяг';

  @override
  String get topBar => 'Дээд баар';

  @override
  String get leftSidebar => 'Зүүн талын самбар';

  @override
  String get showShuffleButton => 'Холимог товчлуурыг харуулах';

  @override
  String get showGenresButton => 'Төрөлүүдийг харуулах товч';

  @override
  String get showFavoritesButton => 'Дуртайг харуулах товч';

  @override
  String get showLibrariesInToolbar => 'Хэрэгслийн самбарт номын санг харуулах';

  @override
  String get navbarAlwaysExpanded => 'Навигацийн самбарын шошгыг үргэлж дэлгэх';

  @override
  String get showSeerrButton => 'Seerr товчийг харуулах';

  @override
  String get navbarOpacity => 'Navbar-ийн тунгалаг байдал';

  @override
  String get navbarColor => 'Navbar өнгө';

  @override
  String get gray => 'Саарал';

  @override
  String get darkBlue => 'Хар хөх';

  @override
  String get purple => 'Нил ягаан';

  @override
  String get teal => 'Цайвар';

  @override
  String get navy => 'Тэнгисийн цэргийн флот';

  @override
  String get charcoal => 'Нүүрс';

  @override
  String get brown => 'Бор';

  @override
  String get darkRed => 'Хар улаан';

  @override
  String get darkGreen => 'Хар ногоон';

  @override
  String get slate => 'Шифер';

  @override
  String get indigo => 'Индиго';

  @override
  String get libraryDisplay => 'Номын сангийн дэлгэц';

  @override
  String get posterLabel => 'Зурагт хуудас';

  @override
  String get thumbnailLabel => 'Өнгөц зураг';

  @override
  String get bannerLabel => 'Баннер';

  @override
  String get overridePerLibrarySettings =>
      'Номын сангийн тохиргоог хүчингүй болгох';

  @override
  String get applyImageTypeToAllLibraries =>
      'Зургийн төрлийг бүх номын санд хэрэглээрэй';

  @override
  String get multiServerLibraries => 'Олон серверийн номын сангууд';

  @override
  String get showLibrariesFromAllServers =>
      'Холбогдсон бүх серверийн сангуудыг харуулах';

  @override
  String get enableFolderView => 'Фолдер харахыг идэвхжүүлэх';

  @override
  String get showFolderBrowsingOption => 'Фолдер үзэх сонголтыг харуулах';

  @override
  String get groupItemsIntoCollections => 'Зүйлсийг цуглуулгад бүлэглэх';

  @override
  String get hideCollectionAssociatedItems =>
      'Сан үзэж байхад цуглуулгад хамаарах зүйлсийг нуух';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Сан бүлэглэх тухай мэдэгдэл';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Энэ тохиргоог ашиглахын тулд Jellyfin эсвэл Emby сервер дээрх сангийнхаа Дэлгэцийн тохиргоонд \"Кинонуудыг цуглуулгад бүлэглэх\" болон/эсвэл \"Цувралуудыг цуглуулгад бүлэглэх\" гэсэн сангийн тохиргоог идэвхжүүлсэн эсэхийг шалгана уу.';

  @override
  String get libraryVisibility => 'Номын сангийн харагдах байдал';

  @override
  String get libraryVisibilityDescription =>
      'Номын сан бүрийн нүүр хуудасны харагдах байдлыг асаах/унтраах. Өөрчлөлтүүд хүчин төгөлдөр болохын тулд Moonfin-г дахин эхлүүлнэ үү.';

  @override
  String get showInNavigation => 'Навигацид харуулах';

  @override
  String get showInLatestMedia =>
      'Сүүлийн үеийн хэвлэл мэдээллийн хэрэгслээр харуулах';

  @override
  String get sourceLibraries => 'Эх сурвалжийн сангууд';

  @override
  String get sourceCollections => 'Эх сурвалжийн цуглуулга';

  @override
  String get excludedGenres => 'Оруулсан төрөл';

  @override
  String get selectAll => 'Бүгдийг сонгоно уу';

  @override
  String itemsSelected(int count) {
    return '$count сонгосон';
  }

  @override
  String get mediaBar => 'Медиа самбар';

  @override
  String get mediaSources => 'Хэвлэл мэдээллийн эх сурвалж';

  @override
  String get behavior => 'Зан төлөв';

  @override
  String get seconds => 'секунд';

  @override
  String get localPreviews => 'Орон нутгийн урьдчилан үзэх';

  @override
  String get localPreviewsDescription =>
      'Трейлер, медиа болон аудиог урьдчилан үзэхийг тохируулна уу.';

  @override
  String get mediaBarMode => 'Хэвлэл мэдээллийн самбарын хэв маяг';

  @override
  String get mediaBarModeDescription =>
      'Төрөл бүрийн медиа самбарын хэв маягаас сонгох эсвэл медиа мөрийг унтраа';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'МакД';

  @override
  String get mediaBarModeOff => 'Унтраах';

  @override
  String get enableMediaBar => 'Медиа мөрийг идэвхжүүлнэ үү';

  @override
  String get showFeaturedContentSlideshow =>
      'Онцолсон контентын слайд шоуг гэртээ харуул';

  @override
  String get contentType => 'Агуулгын төрөл';

  @override
  String get moviesAndTvShows => 'Кино, ТВ шоу';

  @override
  String get moviesOnly => 'Зөвхөн кино';

  @override
  String get tvShowsOnly => 'Зөвхөн ТВ шоунууд';

  @override
  String get itemCount => 'Барааны тоо';

  @override
  String get noneSelected => 'Аль нь ч сонгогдоогүй';

  @override
  String get noneExcluded => 'Аль нь ч хасагдаагүй';

  @override
  String get autoAdvance => 'Автомат урагшлуулах';

  @override
  String get autoAdvanceSlides => 'Дараагийн слайд руу автоматаар шилжих';

  @override
  String get autoAdvanceInterval => 'Автомат урагшлах интервал';

  @override
  String get trailerPreview => 'Трейлерийг урьдчилан үзэх';

  @override
  String get autoPlayTrailers =>
      '3 секундын дараа медиа талбарт трейлерүүдийг автоматаар тоглуулах';

  @override
  String get trailerAudio => 'Трейлерийн дуу';

  @override
  String get enableTrailerAudio =>
      'Медиа самбар дахь трейлерийн дууг идэвхжүүлэх';

  @override
  String get episodePreview => 'Ангийг урьдчилан үзэх';

  @override
  String get mediaPreview => 'Хэвлэл мэдээллийн урьдчилан харах';

  @override
  String get episodePreviewDescription =>
      'Анхаарал хандуулсан, хулганаа тавьсан эсвэл удаан дарсан картууд дээр 30 секундын шугамаар урьдчилан үзэх боломжтой.';

  @override
  String get mediaPreviewDescription =>
      'Анхаарал хандуулсан, хулганаар тавьсан эсвэл удаан дарсан картууд дээр 30 секундын шугамаар урьдчилан үзэх боломжтой.';

  @override
  String get previewAudio => 'Аудиог урьдчилан үзэх';

  @override
  String get enablePreviewAudio =>
      'Чиргүүл болон ангиудыг урьдчилан үзэхийн тулд аудиог идэвхжүүлнэ үү';

  @override
  String get latestMedia => 'Хамгийн сүүлийн үеийн хэвлэл мэдээллийн хэрэгсэл';

  @override
  String get recentlyReleased => 'Саяхан гарсан';

  @override
  String get myMedia => 'Миний медиа';

  @override
  String get myMediaSmall => 'Миний медиа (жижиг)';

  @override
  String get continueWatching => 'Үргэлжлүүлэн үзэх';

  @override
  String get resumeAudio => 'Аудио үргэлжлүүлэх';

  @override
  String get resumeBooks => 'Үргэлжлүүлэн унших';

  @override
  String get activeRecordings => 'Идэвхтэй бичлэгүүд';

  @override
  String get playlists => 'Тоглуулах жагсаалт';

  @override
  String get liveTV => 'Шууд ТВ';

  @override
  String get homeSections => 'Гэрийн хэсгүүд';

  @override
  String get resetToDefaults => 'Өгөгдмөл рүү дахин тохируулах';

  @override
  String get homeRowPosterSize =>
      'Нүүр хуудасны эгнээний зурагт хуудасны хэмжээ';

  @override
  String get perRowImageTypeSelection => 'Мөр бүрийн зургийн төрлийг сонгох';

  @override
  String get configureImageTypeForEachRow =>
      'Идэвхжүүлсэн нүүр мөр бүрийн зургийн төрлийг тохируулна уу';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Үргэлжлүүлэн үзэж, дараа нь нэгтгэнэ үү';

  @override
  String get combineBothRows => 'Хоёр мөрийг нэг гэрийн хэсэг болгон нэгтгэнэ';

  @override
  String get fullScreenRows => 'Дэлгэсэн нүүр эгнээ';

  @override
  String get fullScreenRowsDescription =>
      'Нэг дэлгэцэд нүүр хуудасны 1 эгнээ харуулна';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Мөр бүрийн зургийн төрөл';

  @override
  String get perRowSettings => 'Мөр бүрийн тохиргоо';

  @override
  String get autoLogin => 'Автоматаар нэвтрэх';

  @override
  String get lastUser => 'Сүүлийн хэрэглэгч';

  @override
  String get currentUser => 'Одоогийн хэрэглэгч';

  @override
  String get alwaysAuthenticate => 'Үргэлж баталгаажуулах';

  @override
  String get requirePasswordWithToken =>
      'Хадгалсан жетонтой ч гэсэн нууц үг шаардана';

  @override
  String get confirmExit => 'Гарахыг баталгаажуул';

  @override
  String get showConfirmationBeforeExiting =>
      'Гарахаас өмнө баталгаажуулалтыг харуул';

  @override
  String get blockContentWithRatings =>
      'Дараах үнэлгээ бүхий контентыг блоклох:';

  @override
  String get noContentRatingsFound =>
      'Энэ сервер дээр контентын үнэлгээ хараахан олдсонгүй.';

  @override
  String get couldNotLoadServerRatings =>
      'Серверийн үнэлгээг ачаалж чадсангүй. Зөвхөн хадгалсан үнэлгээг харуулж байна.';

  @override
  String get couldNotRefreshRatings =>
      'Серверийн үнэлгээг сэргээж чадсангүй. Хадгалсан үнэлгээг харуулж байна.';

  @override
  String get enablePinCode => 'ПИН кодыг идэвхжүүлнэ үү';

  @override
  String get requirePinToAccess =>
      'Бүртгэлдээ нэвтрэхийн тулд ПИН код шаардана уу';

  @override
  String get changePin => 'ПИН код солих';

  @override
  String get setNewPinCode => 'Шинэ PIN код тохируулна уу';

  @override
  String get removePin => 'ПИН кодыг устгана уу';

  @override
  String get removePinProtection => 'ПИН кодын хамгаалалтыг устгана уу';

  @override
  String get screensaver => 'Дэлгэц амраагч';

  @override
  String get inAppScreensaver => 'Апп доторх дэлгэц амраагч';

  @override
  String get enableBuiltInScreensaver =>
      'Суулгасан дэлгэц амраагчийг идэвхжүүлнэ үү';

  @override
  String get mode => 'Горим';

  @override
  String get libraryArt => 'Номын сангийн урлаг';

  @override
  String get logo => 'Лого';

  @override
  String get clock => 'Цаг';

  @override
  String get timeout => 'Хугацаа хэтэрсэн';

  @override
  String minutesShort(int minutes) {
    return '$minutes мин';
  }

  @override
  String get dimmingLevel => 'Бүдгэрэх түвшин';

  @override
  String get maxAgeRating => 'Хамгийн дээд насны үнэлгээ';

  @override
  String get any => 'Ямар ч';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Насны үнэлгээ шаардлагатай';

  @override
  String get onlyShowRatedContent => 'Зөвхөн үнэлгээтэй контентыг харуулах';

  @override
  String get showClock => 'Цаг харуулах';

  @override
  String get displayClockDuringScreensaver =>
      'Дэлгэц амраах үед цагийг харуулах';

  @override
  String get clockModeStatic => 'Тогтмол';

  @override
  String get clockModeBouncing => 'Үсрэх';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Шүүмжлэгчид)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Үзэгчид)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Метакритик';

  @override
  String get metacriticUser => 'Метакритик (Хэрэглэгч)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Захидлын хайрцагd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'АниЛист';

  @override
  String get communityRating => 'Олон нийтийн үнэлгээ';

  @override
  String get ratings => 'Үнэлгээ';

  @override
  String get additionalRatings => 'Нэмэлт үнэлгээ';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList болон TMDB үнэлгээг харуулах';

  @override
  String get ratingLabels => 'Үнэлгээний шошго';

  @override
  String get showLabelsNextToIcons => 'Үнэлгээний дүрсний хажууд шошгыг харуул';

  @override
  String get ratingBadges => 'Үнэлгээний тэмдэг';

  @override
  String get showDecorativeBadges =>
      'Үнэлгээний ард гоёл чимэглэлийн тэмдгийг харуулах';

  @override
  String get episodeRatings => 'Ангиудын үнэлгээ';

  @override
  String get showRatingsOnEpisodes => 'Тус тусдаа ангиудын үнэлгээг харуулах';

  @override
  String get ratingSources => 'Үнэлгээний эх сурвалжууд';

  @override
  String get ratingSourcesDescription =>
      'Аппликешн дээр харуулсан үнэлгээний эх сурвалжийг идэвхжүүлж, дахин эрэмбэлээрэй';

  @override
  String get pluginLabel => 'Moonbase залгаас';

  @override
  String get pluginDetected => 'Plugin илэрсэн';

  @override
  String get pluginNotDetected => 'Plugin илэрсэнгүй';

  @override
  String get pluginDetectedDescription =>
      'Серверийн залгаас илэрсэн. Plugin анх олдох үед синк автоматаар идэвхждэг.';

  @override
  String get pluginNotDetectedDescription =>
      'Серверийн залгаас одоогоор илрээгүй байна. Орон нутгийн тохиргоонууд хадгалсан утгууд эсвэл суулгасан өгөгдмөлүүдийг ашигладаг хэвээр байна.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nХувилбар: $version';
  }

  @override
  String get availableServices => 'Боломжтой үйлчилгээ';

  @override
  String get serverPluginSync => 'Серверийн залгаасын синк';

  @override
  String get syncSettingsWithPlugin =>
      'Серверийн залгаастай тохиргоог синк хийнэ үү';

  @override
  String get whatSyncControls => 'Ямар синхрончлолыг хянадаг';

  @override
  String get syncControlsDescription =>
      'Синхрончлол нь зөвхөн залгаас дээр тулгуурласан тохиргоог сервер рүү түлхэж, серверээс татах эсэхийг хянадаг. Профайл сонгох болон профайлыг синк хийх үйлдэл нь залгаасын синк идэвхжсэн үед Тохируулах тохиргоонд байна.';

  @override
  String get recentRequests => 'Сүүлийн үеийн хүсэлтүүд';

  @override
  String get recentlyAdded => 'Саяхан нэмэгдсэн';

  @override
  String get trending => 'Тренд';

  @override
  String get popularMovies => 'Алдартай кинонууд';

  @override
  String get movieGenres => 'Киноны төрлүүд';

  @override
  String get upcomingMovies => 'Удахгүй гарах кинонууд';

  @override
  String get studios => 'Студиуд';

  @override
  String get popularSeries => 'Алдартай цуврал';

  @override
  String get seriesGenres => 'Цуврал жанрууд';

  @override
  String get upcomingSeries => 'Удахгүй гарах цуврал';

  @override
  String get networks => 'Сүлжээ';

  @override
  String get seerrDiscoveryRows => 'Seerr-ийн танилцах эгнээ';

  @override
  String get resetRowsToDefaults =>
      'Мөрүүдийг өгөгдмөл болгож дахин тохируулна уу';

  @override
  String get enableSeerr => 'Seerr-г идэвхжүүл';

  @override
  String get showSeerrInNavigation =>
      'Навигацид Seerr харуулах (серверийн залгаас шаардлагатай)';

  @override
  String get seerrUnavailable =>
      'Серверийн залгаасын Seerr дэмжлэг идэвхгүй болсон тул боломжгүй байна.';

  @override
  String get nsfwFilter => 'NSFW шүүлтүүр';

  @override
  String get hideAdultContent =>
      'Үр дүнд нь насанд хүрэгчдэд зориулсан контентыг нуу';

  @override
  String get seerrNotificationsSection => 'Мэдэгдэл';

  @override
  String get seerrNotifyNewRequestsTitle => 'Шинэ хүсэлтийн мэдэгдэл';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Хэн нэгэн хүсэлт илгээхэд надад мэдэгдэнэ';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Хүсэлтийн шинэчлэл';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Зөвшөөрсөн, татгалзсан, санд нэмэгдсэн';

  @override
  String get seerrNotifyIssuesTitle => 'Асуудлын шинэчлэл';

  @override
  String get seerrNotifyIssuesSubtitle => 'Шинэ асуудал, хариу, шийдвэрлэлт';

  @override
  String loggedInAs(String username) {
    return 'Нэвтэрсэн: $username';
  }

  @override
  String get discoverRows => 'Seerr-ийн танилцах хуудас';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Seerr-ийн үндсэн хуудсанд харуулах эгнээг идэвхжүүлнэ. Чирж эрэмбийг өөрчилнө. Захиалгат эрэмбэ Moonbase-тэй синк болно.';

  @override
  String get discoverRowsDescription =>
      'Seerr-ийн үндсэн хуудсанд харуулах эгнээг идэвхжүүлнэ. Чирж эрэмбийг өөрчилнө. Захиалгат эрэмбэ Moonbase-тэй синк болно.';

  @override
  String get enabled => 'Идэвхтэй';

  @override
  String get hidden => 'Нуугдсан';

  @override
  String get aboutTitle => 'тухай';

  @override
  String versionValue(String version) {
    return 'Хувилбар $version';
  }

  @override
  String get openSourceLicenses => 'Нээлттэй эхийн лицензүүд';

  @override
  String get sourceCode => 'Эх код';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Шинэчлэлтүүдийг одоо шалгана уу';

  @override
  String get checksLatestDesktopRelease =>
      'Энэ платформын хамгийн сүүлийн үеийн ширээний хувилбарыг шалгана';

  @override
  String get youAreUpToDate => 'Та шинэчлэгдсэн байна.';

  @override
  String get couldNotCheckForUpdates =>
      'Яг одоо шинэчлэлтүүдийг шалгаж чадсангүй.';

  @override
  String get noCompatibleUpdate =>
      'Энэ платформд тохирох шинэчлэлтийн багц олдсонгүй.';

  @override
  String get updateChecksNotSupported =>
      'Энэ платформ дээр шинэчлэлтийн шалгалтыг дэмждэггүй.';

  @override
  String get updateNotificationsDisabled =>
      'Шинэчлэх мэдэгдлийг идэвхгүй болгосон.';

  @override
  String get pleaseWaitBeforeChecking => 'Дахин шалгахын өмнө түр хүлээнэ үү.';

  @override
  String get latestUpdateAlreadyShown =>
      'Хамгийн сүүлийн үеийн шинэчлэлтийг аль хэдийн харуулсан.';

  @override
  String get updateAvailable => 'Шинэчлэлт боломжтой.';

  @override
  String updateAvailableVersion(String version) {
    return 'Шинэчлэлт боломжтой: v$version';
  }

  @override
  String get updateNotifications => 'Мэдэгдлийг шинэчлэх';

  @override
  String get showWhenUpdatesAvailable => 'Шинэчлэлт боломжтой үед харуулах';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Боломжтой';
  }

  @override
  String get readReleaseNotes => 'Хувилбарын тэмдэглэлийг уншина уу';

  @override
  String get downloadingUpdate => 'Шинэчлэлтийг татаж байна...';

  @override
  String get updateDownloadFailed =>
      'Шинэчлэлтийг татаж чадсангүй. Дахин оролдоно уу.';

  @override
  String get openReleasesPage => 'Хувилбарын хуудсыг нээнэ үү';

  @override
  String get navigation => 'Навигац';

  @override
  String get watchedIndicatorsBackdrops => 'Үзсэн үзүүлэлтүүд, дэвсгэр зураг';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Анхаарал хандуулсан өнгө, үзсэн үзүүлэлт, дэвсгэр';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar хэв маяг, хэрэгслийн товчлуурууд, харагдах байдал';

  @override
  String get reorderToggleHomeRows =>
      'Нүүрний мөрүүдийг дахин эрэмбэлж, сэлгэх';

  @override
  String get featuredContentAppearance => 'Онцлох агуулга, гадаад төрх';

  @override
  String get posterSizeImageTypeFolderView =>
      'Зурагт хуудасны хэмжээ, зургийн төрөл, хавтас харах';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB, үнэлгээний эх сурвалжууд';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Зургийн кэшийн хязгаар';

  @override
  String get clearImageCache => 'Зургийн кэшийг цэвэрлэх';

  @override
  String get imageCacheCleared => 'Зургийн кэшийг цэвэрлэлээ';

  @override
  String get clear => 'Цэвэрлэх';

  @override
  String get browse => 'Үзэх';

  @override
  String get noResults => 'Үр дүн алга';

  @override
  String get seerrAvailableStatus => 'Боломжтой';

  @override
  String get seerrRequestedStatus => 'Хүссэн';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Татаж байна · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Импортлож байна';

  @override
  String itemsCount(int count) {
    return '$count Зүйлс';
  }

  @override
  String get seerrSettings => 'Seerr тохиргоо';

  @override
  String get requestMore => 'Илүү ихийг хүсэх';

  @override
  String get request => 'Хүсэлт';

  @override
  String get cancelRequest => 'Хүсэлтийг цуцлах';

  @override
  String get playInMoonfin => 'Moonfin дээр тоглох';

  @override
  String requestedByName(String name) {
    return 'Хүссэн $name';
  }

  @override
  String get approve => 'Зөвшөөрөх';

  @override
  String get declineAction => 'Татгалзах';

  @override
  String get similar => 'Үүнтэй төстэй';

  @override
  String get recommendations => 'Зөвлөмж';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\"-н хүсэлтийг цуцлах уу?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\"-ын $count хүсэлтийг цуцлах уу?';
  }

  @override
  String get keep => 'Хадгалах';

  @override
  String get itemNotFoundInLibrary =>
      'Таны Moonfin номын сангаас зүйл олдсонгүй';

  @override
  String get errorSearchingLibrary => 'Номын санг хайхад алдаа гарлаа';

  @override
  String budgetAmount(String amount) {
    return 'Төсөв: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Орлого: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Хүсэлт $type';
  }

  @override
  String get submitRequest => 'Хүсэлт илгээх';

  @override
  String get allSeasons => 'Бүх улирал';

  @override
  String get advancedOptions => 'Нарийвчилсан сонголтууд';

  @override
  String get noServiceServersConfigured =>
      'Үйлчилгээний серверүүдийг тохируулаагүй байна';

  @override
  String get server => 'Сервер';

  @override
  String get qualityProfile => 'Чанарын профайл';

  @override
  String get rootFolder => 'Үндэс хавтас';

  @override
  String get showMore => 'Илүү харуулах';

  @override
  String get appearances => 'Оролцоо';

  @override
  String get crewSection => 'Экипаж';

  @override
  String ageValue(int age) {
    return 'нас $age';
  }

  @override
  String get noRequests => 'Хүсэлт байхгүй';

  @override
  String get pendingStatus => 'Хүлээгдэж байна';

  @override
  String get declinedStatus => 'Татгалзсан';

  @override
  String get partiallyAvailable => 'Хэсэгчилсэн боломжтой';

  @override
  String get downloadingStatus => 'Татаж байна';

  @override
  String get approvedStatus => 'Зөвшөөрсөн';

  @override
  String get notRequestedStatus => 'Хүсээгүй';

  @override
  String get blocklistedStatus => 'Блоклосон';

  @override
  String get deletedStatus => 'Устгасан';

  @override
  String get failedStatus => 'Амжилтгүй';

  @override
  String get processingStatus => 'Боловсруулж байна';

  @override
  String modifiedByName(String name) {
    return '$name өөрчилсөн';
  }

  @override
  String get completedStatus => 'Дууссан';

  @override
  String get requestErrorDuplicate =>
      'Энэ гарчигт аль хэдийн хүсэлт гаргасан байна';

  @override
  String get requestErrorQuota => 'Хүсэлтийн хязгаарт хүрсэн';

  @override
  String get requestErrorBlocklisted => 'Энэ гарчиг хар жагсаалтад байна';

  @override
  String get requestErrorNoSeasons => 'Хүсэлт гаргах улирал үлдээгүй';

  @override
  String get requestErrorPermission => 'Танд энэ хүсэлтийг гаргах эрх байхгүй';

  @override
  String get seerrRequestsTitle => 'Хүсэлтүүд';

  @override
  String get seerrIssuesTitle => 'Асуудлууд';

  @override
  String get sortNewest => 'Хамгийн шинэ';

  @override
  String get sortLastModified => 'Сүүлд өөрчилсөн';

  @override
  String get noIssues => 'Асуудал байхгүй';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$limit киноны хүсэлтээс $remaining үлдсэн';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$limit улирлын хүсэлтээс $remaining үлдсэн';
  }

  @override
  String partOfCollectionName(String name) {
    return '$name-ийн нэг хэсэг';
  }

  @override
  String get viewCollection => 'Цуглуулгыг үзэх';

  @override
  String get requestCollection => 'Цуглуулгыг хүсэх';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total кино · $available боломжтой';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count кино хүсэх';
  }

  @override
  String requestingProgress(int current, int total) {
    return '$total-аас $current дахийг хүсэж байна...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count кино хүслээ';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$total киноноос $ok-ийг хүслээ';
  }

  @override
  String get collectionAllRequested =>
      'Бүх кино аль хэдийн боломжтой эсвэл хүссэн байна';

  @override
  String get reportIssue => 'Асуудал мэдэгдэх';

  @override
  String get issueTypeVideo => 'Видео';

  @override
  String get issueTypeAudio => 'Аудио';

  @override
  String get whatsWrong => 'Юу буруу байна?';

  @override
  String get allEpisodes => 'Бүх анги';

  @override
  String get episode => 'Анги';

  @override
  String get openStatus => 'Нээлттэй';

  @override
  String get resolvedStatus => 'Шийдэгдсэн';

  @override
  String get resolveAction => 'Шийдвэрлэх';

  @override
  String get reopenAction => 'Дахин нээх';

  @override
  String reportedByName(String name) {
    return '$name мэдэгдсэн';
  }

  @override
  String commentsCount(int count) {
    return '$count сэтгэгдэл';
  }

  @override
  String get addComment => 'Сэтгэгдэл нэмэх';

  @override
  String get deleteIssueConfirm => 'Энэ асуудлыг устгах уу?';

  @override
  String get submitReport => 'Мэдэгдэл илгээх';

  @override
  String get tmdbScore => 'TMDB оноо';

  @override
  String get releaseDateLabel => 'Гарсан огноо';

  @override
  String get firstAirDateLabel => 'Анхны эфирийн огноо';

  @override
  String get revenueLabel => 'Орлого';

  @override
  String get runtimeLabel => 'Ажиллах цаг';

  @override
  String get budgetLabel => 'Төсөв';

  @override
  String get originalLanguageLabel => 'Жинхэнэ хэл';

  @override
  String get seasonsLabel => 'Улирлууд';

  @override
  String get episodesLabel => 'Ангиуд';

  @override
  String get access => 'Хандалт';

  @override
  String get add => 'Нэмэх';

  @override
  String get address => 'Хаяг';

  @override
  String get analytics => 'Аналитик';

  @override
  String get catalog => 'Каталог';

  @override
  String get content => 'Агуулга';

  @override
  String get copy => 'Хуулбарлах';

  @override
  String get create => 'Үүсгэх';

  @override
  String get disable => 'Идэвхгүй болгох';

  @override
  String get done => 'Болсон';

  @override
  String get edit => 'Засах';

  @override
  String get encoding => 'Кодлох';

  @override
  String get error => 'Алдаа';

  @override
  String get forward => 'Урагш';

  @override
  String get general => 'Ерөнхий';

  @override
  String get go => 'Яв';

  @override
  String get install => 'Суулгах';

  @override
  String get installed => 'Суулгасан';

  @override
  String get interval => 'Интервал';

  @override
  String get name => 'Нэр';

  @override
  String get networking => 'Сүлжээ';

  @override
  String get next => 'Дараагийн';

  @override
  String get path => 'Зам';

  @override
  String get paused => 'Түр зогсоосон';

  @override
  String get permissions => 'Зөвшөөрөл';

  @override
  String get processing => 'Боловсруулж байна';

  @override
  String get profile => 'Профайл';

  @override
  String get provider => 'Үйлчилгээ үзүүлэгч';

  @override
  String get refresh => 'Сэргээх';

  @override
  String get remote => 'Алсын удирдлага';

  @override
  String get rename => 'Нэрээ өөрчлөх';

  @override
  String get revoke => 'Хүчингүй болгох';

  @override
  String get role => 'Үүрэг';

  @override
  String get root => 'Үндэс';

  @override
  String get run => 'Гүй';

  @override
  String get search => 'Хайх';

  @override
  String get select => 'Сонго';

  @override
  String get send => 'Илгээх';

  @override
  String get sessions => 'Хурал';

  @override
  String get set => 'Тохируулах';

  @override
  String get status => 'Статус';

  @override
  String get stop => 'Зогсоох';

  @override
  String get streaming => 'Дамжуулж байна';

  @override
  String get time => 'Цаг хугацаа';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Устгах';

  @override
  String get up => 'Дээшээ';

  @override
  String get update => 'Шинэчлэх';

  @override
  String get upload => 'Байршуулах';

  @override
  String get unmute => 'Дууг нээх';

  @override
  String get mute => 'Дууг хаах';

  @override
  String get branding => 'Брэнд хийх';

  @override
  String get adminDrawerDashboard => 'Хяналтын самбар';

  @override
  String get adminDrawerAnalytics => 'Аналитик';

  @override
  String get adminDrawerSettings => 'Тохиргоо';

  @override
  String get adminDrawerBranding => 'Брэнд хийх';

  @override
  String get adminDrawerUsers => 'Хэрэглэгчид';

  @override
  String get adminDrawerLibraries => 'Медиа сангууд';

  @override
  String get adminDrawerDisplay => 'Дэлгэц';

  @override
  String get adminDrawerMetadata => 'Мета өгөгдөл';

  @override
  String get adminDrawerNfo => 'NFO тохиргоо';

  @override
  String get adminDrawerTranscoding => 'Код хувиргах';

  @override
  String get adminDrawerResume => 'Үргэлжлүүлэх';

  @override
  String get adminDrawerStreaming => 'Дамжуулж байна';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Төхөөрөмжүүд';

  @override
  String get adminDrawerActivity => 'Үйл ажиллагаа';

  @override
  String get adminDrawerNetworking => 'Сүлжээ';

  @override
  String get adminDrawerApiKeys => 'API түлхүүрүүд';

  @override
  String get adminDrawerBackups => 'Нөөцлөлт';

  @override
  String get adminDrawerLogs => 'Бүртгэл';

  @override
  String get adminDrawerScheduledTasks => 'Төлөвлөсөн ажлууд';

  @override
  String get adminDrawerPlugins => 'Залгаасууд';

  @override
  String get adminDrawerRepositories => 'Хадгалах газрууд';

  @override
  String get adminDrawerLiveTv => 'Шууд ТВ';

  @override
  String get adminExitTooltip => 'Админаас гарах';

  @override
  String get adminDashboardLoadFailed => 'Хяналтын самбарыг ачаалж чадсангүй';

  @override
  String get adminMediaOverview => 'Хэвлэл мэдээллийн тойм';

  @override
  String get adminMediaTotalsError =>
      'Серверийн медиа нийлбэрийг ачаалж чадсангүй.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Энэ сервер дээр хэр их контент байгааг хурдан уншина уу.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Plugin шинэчлэлтүүд боломжтой: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Дахин эхлүүлэх шаардлагатай залгаасууд: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Амжилтгүй төлөвлөсөн ажлууд: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Сүүлийн үеийн анхааруулга/алдаа оруулгууд: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Хэвлэл мэдээллийн түгээлт';

  @override
  String get analyticsVideoCodecs => 'Видео кодлогч';

  @override
  String get analyticsAudioCodecs => 'Аудио кодлогч';

  @override
  String get analyticsContainers => 'Контейнер';

  @override
  String get analyticsTopGenres => 'Шилдэг жанрууд';

  @override
  String get analyticsReleaseYears => 'Гарсан он жилүүд';

  @override
  String get analyticsContentRatings => 'Агуулгын үнэлгээ';

  @override
  String get analyticsRuntimeBuckets => 'Үргэлжлэх хугацааны бүлгүүд';

  @override
  String get analyticsFileFormats => 'Файлын форматууд';

  @override
  String get analyticsNoData => 'Өгөгдөл байхгүй.';

  @override
  String get adminServerInfo => 'Серверийн мэдээлэл';

  @override
  String get adminRestartPending => 'Дахин эхлүүлэх хүлээгдэж байна';

  @override
  String get adminServerPaths => 'Серверийн замууд';

  @override
  String get adminServerActions => 'Серверийн үйлдлүүд';

  @override
  String get adminRestartServer => 'Серверийг дахин эхлүүлэх';

  @override
  String get adminShutdownServer => 'Серверийг унтраах';

  @override
  String get adminScanLibraries => 'Номын сангуудыг сканнердах';

  @override
  String get adminLibraryScanStarted => 'Номын сангийн хайлт эхэлсэн';

  @override
  String errorGeneric(String error) {
    return 'Алдаа: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Серверийг дахин ачаалж байна';

  @override
  String get adminServerRebootMessage =>
      'Серверийг дахин ачаалж байна, дахин эхлүүлнэ үү Moonfin';

  @override
  String get adminActiveSessions => 'Идэвхтэй сессүүд';

  @override
  String get adminSessionsLoadFailed => 'Сешнүүдийг ачаалж чадсангүй';

  @override
  String get adminNoActiveSessions => 'Идэвхтэй сесс байхгүй';

  @override
  String get adminRecentActivity => 'Сүүлийн үеийн үйл ажиллагаа';

  @override
  String get adminNoRecentActivity => 'Саяхны үйл ажиллагаа алга';

  @override
  String adminCommandFailed(String error) {
    return 'Тушаал амжилтгүй боллоо: $error';
  }

  @override
  String get adminSendMessage => 'Мессеж илгээх';

  @override
  String get adminMessageTextHint => 'Мессежийн текст';

  @override
  String get adminSetVolume => 'Дууны хэмжээг тохируулах';

  @override
  String get sessionPrev => 'Өмнөх';

  @override
  String get sessionRewind => 'Ухраах';

  @override
  String get sessionForward => 'Урагш';

  @override
  String get sessionNext => 'Дараагийн';

  @override
  String get sessionVolumeDown => 'Боть –';

  @override
  String get sessionVolumeUp => 'Боть +';

  @override
  String get uhd4k => '4К';

  @override
  String get nowPlaying => 'Одоо тоглож байна';

  @override
  String get volume => 'Дууны хэмжээ';

  @override
  String get actions => 'Үйлдлүүд';

  @override
  String get videoCodec => 'Видео кодлогч';

  @override
  String get audioCodec => 'Аудио кодлогч';

  @override
  String get hwAccel => 'Техник хурдасгалт';

  @override
  String get completion => 'Дуусгах';

  @override
  String get direct => 'Шууд';

  @override
  String get adminDisconnect => 'Салгах';

  @override
  String get adminClearDates => 'Огноог арилгах';

  @override
  String get adminActivitySeverityAll => 'Бүх түвшин';

  @override
  String get adminActivityDateRange => 'Огнооны хязгаар';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Үйл ажиллагааны бүртгэлийг ачаалж чадсангүй: $error';
  }

  @override
  String get adminNoActivityEntries => 'Үйл ажиллагааны бичилт байхгүй';

  @override
  String get adminEditDeviceName => 'Төхөөрөмжийн нэрийг засах';

  @override
  String get adminCustomName => 'Тусгай нэр';

  @override
  String get adminDeviceNameUpdated => 'Төхөөрөмжийн нэрийг шинэчилсэн';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Төхөөрөмжийг шинэчилж чадсангүй: $error';
  }

  @override
  String get adminDeleteDevice => 'Төхөөрөмжийг устгах';

  @override
  String get adminDeviceDeleted => 'Төхөөрөмж устгагдсан';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Төхөөрөмжийг устгаж чадсангүй: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return '\'$name\' төхөөрөмжийг устгах уу? Хэрэглэгч энэ төхөөрөмж дээр дахин нэвтрэх шаардлагатай болно.';
  }

  @override
  String get adminDeleteAllDevices => 'Бүх төхөөрөмжийг устгах';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count төхөөрөмжийг устгах уу? Холбогдох хэрэглэгчид дахин нэвтрэх шаардлагатай болно. Таны одоогийн төхөөрөмжид нөлөөлөхгүй.';
  }

  @override
  String get adminDevicesDeletedAll => 'Төхөөрөмжүүдийг устгалаа';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Зарим төхөөрөмжийг устгалаа; $count-ийг устгаж чадсангүй.';
  }

  @override
  String get adminDevicesLoadFailed => 'Төхөөрөмжүүдийг ачаалж чадсангүй';

  @override
  String get adminSearchDevices => 'Төхөөрөмж хайх';

  @override
  String get adminThisDevice => 'Энэ төхөөрөмж';

  @override
  String get adminEditName => 'Нэрийг засах';

  @override
  String get adminLibrariesLoadFailed => 'Номын санг ачаалж чадсангүй';

  @override
  String get adminNoLibraries => 'Ямар ч номын сан тохируулаагүй байна';

  @override
  String get adminScanAllLibraries => 'Бүх номын сангуудыг сканнердах';

  @override
  String get adminAddLibrary => 'Номын сан нэмэх';

  @override
  String adminScanFailed(String error) {
    return 'Скан хийж чадсангүй: $error';
  }

  @override
  String get adminRenameLibrary => 'Номын сангийн нэрийг өөрчлөх';

  @override
  String get adminNewName => 'Шинэ нэр';

  @override
  String adminLibraryRenamed(String name) {
    return 'Номын сангийн нэрийг \"$name\" болгон өөрчилсөн';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Нэрийг нь өөрчилж чадсангүй: $error';
  }

  @override
  String get adminDeleteLibrary => 'Номын санг устгах';

  @override
  String adminLibraryDeleted(String name) {
    return '\"$name\" номын санг устгасан';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Номын санг устгаж чадсангүй: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Зам нэмж чадсангүй: $error';
  }

  @override
  String get adminRemovePath => 'Замыг арилгах';

  @override
  String adminRemovePathConfirm(String path) {
    return '\"$path\"-г энэ сангаас хасах уу?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Замыг устгаж чадсангүй: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Номын сангийн сонголтыг хадгалсан';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Сонголтуудыг хадгалж чадсангүй: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Номын санг ачаалж чадсангүй';

  @override
  String get adminNoMediaPaths => 'Медиа замыг тохируулаагүй байна';

  @override
  String get adminAddPath => 'Зам нэмэх';

  @override
  String get adminBrowseFilesystem => 'Серверийн файлын системийг үзэх:';

  @override
  String get adminSaveOptions => 'Хадгалах сонголтууд';

  @override
  String get adminPreferredMetadataLanguage => 'Сонгосон мета өгөгдлийн хэл';

  @override
  String get adminMetadataLanguageHint => 'жишээ нь en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Мета өгөгдлийн улсын код';

  @override
  String get adminMetadataCountryHint => 'жишээ нь АНУ, DE, ФР';

  @override
  String get adminLibraryTabPaths => 'Замууд';

  @override
  String get adminLibraryTabOptions => 'Сонголтууд';

  @override
  String get adminLibraryTabDownloaders => 'Татагчид';

  @override
  String get adminLibMetadataSavers => 'Мета өгөгдөл хадгалагчид';

  @override
  String get adminLibSubtitleDownloaders => 'Хадмал татагчид';

  @override
  String get adminLibLyricDownloaders => 'Дууны үг татагчид';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Мета өгөгдөл татагчид: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Зураг татагчид: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Энэ сервер нь сангийн энэ төрөлд татагч санал болгохгүй байна.';

  @override
  String get adminLibrarySectionGeneral => 'Ерөнхий';

  @override
  String get adminLibrarySectionMetadata => 'Мета өгөгдөл';

  @override
  String get adminLibrarySectionEmbedded => 'Суулгагдсан мэдээлэл';

  @override
  String get adminLibrarySectionSubtitles => 'Хадмал';

  @override
  String get adminLibrarySectionImages => 'Зургууд';

  @override
  String get adminLibrarySectionSeries => 'Цуврал';

  @override
  String get adminLibrarySectionMusic => 'Хөгжим';

  @override
  String get adminLibrarySectionMovies => 'Кино';

  @override
  String get adminLibRealtimeMonitor => 'Бодит цагийн хяналтыг идэвхжүүлэх';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Файлын өөрчлөлтийг илрүүлж автоматаар боловсруулна.';

  @override
  String get adminLibArchiveMediaFiles => 'Архивыг медиа файл гэж үзэх';

  @override
  String get adminLibEnablePhotos => 'Гэрэл зургийг харуулах';

  @override
  String get adminLibSaveLocalMetadata => 'Зургийг медиа хавтсанд хадгалах';

  @override
  String get adminLibRefreshInterval => 'Мета өгөгдлийн автомат шинэчлэл';

  @override
  String get adminLibRefreshNever => 'Хэзээ ч үгүй';

  @override
  String get adminLibDefault => 'Үндсэн';

  @override
  String get adminLibDisplayTitle => 'Дэлгэц';

  @override
  String get adminLibDisplaySection => 'Сангийн дэлгэц';

  @override
  String get adminLibFolderView =>
      'Энгийн медиа хавтсыг харуулах хавтасны харагдацыг гаргах';

  @override
  String get adminLibSpecialsInSeasons =>
      'Тусгай ангиудыг гарсан улиралд нь харуулах';

  @override
  String get adminLibGroupMovies => 'Кинонуудыг цуглуулгад бүлэглэх';

  @override
  String get adminLibGroupShows => 'Цувралуудыг цуглуулгад бүлэглэх';

  @override
  String get adminLibExternalSuggestions => 'Саналд гадаад контентыг харуулах';

  @override
  String get adminLibDateAddedSection => 'Нэмсэн огнооны үйлдэл';

  @override
  String get adminLibDateAddedLabel => 'Нэмсэн огноог эндээс авах';

  @override
  String get adminLibDateAddedImport => 'Санд сканнердсан огноо';

  @override
  String get adminLibDateAddedFile => 'Файл үүсгэсэн огноо';

  @override
  String get adminLibMetadataTitle => 'Мета өгөгдөл ба зураг';

  @override
  String get adminLibMetadataLangSection => 'Мета өгөгдлийн сонгосон хэл';

  @override
  String get adminLibChaptersSection => 'Бүлгүүд';

  @override
  String get adminLibDummyChapterDuration =>
      'Түр бүлгийн үргэлжлэх хугацаа (секунд)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Бүлэггүй медиад үүсгэх бүлгийн урт. Унтраахын тулд 0 болгоно уу.';

  @override
  String get adminLibChapterImageResolution => 'Бүлгийн зургийн нягтрал';

  @override
  String get adminLibNfoTitle => 'NFO тохиргоо';

  @override
  String get adminLibNfoHelp =>
      'NFO мета өгөгдөл нь Kodi болон түүнтэй төстэй клиентүүдтэй нийцнэ. Тохиргоо нь NFO мета өгөгдөл хадгалдаг бүх санд үйлчилнэ.';

  @override
  String get adminLibKodiUser =>
      'NFO файлд үзсэн өгөгдлийг нь хадгалах хэрэглэгч';

  @override
  String get adminLibSaveImagePaths => 'Зургийн замыг NFO файлд хадгалах';

  @override
  String get adminLibPathSubstitution =>
      'NFO зургийн замд зам орлуулахыг идэвхжүүлэх';

  @override
  String get adminLibExtraThumbs =>
      'extrafanart зургийг extrathumbs хавтсанд хуулах';

  @override
  String get adminLibNone => 'Байхгүй';

  @override
  String adminLibRefreshDays(int days) {
    return '$days хоног';
  }

  @override
  String get adminLibEmbeddedTitles => 'Суулгагдсан гарчгийг ашиглах';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Нэмэлтэд суулгагдсан гарчгийг ашиглах';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Суулгагдсан ангийн мэдээллийг ашиглах';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Суулгагдсан хадмалыг зөвшөөрөх';

  @override
  String get adminLibEmbeddedAllowAll => 'Бүгдийг зөвшөөрөх';

  @override
  String get adminLibEmbeddedAllowText => 'Зөвхөн текст';

  @override
  String get adminLibEmbeddedAllowImage => 'Зөвхөн зураг';

  @override
  String get adminLibEmbeddedAllowNone => 'Байхгүй';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Суулгагдсан хадмал байвал татахыг алгасах';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Аудио зам татах хэлтэй таарвал татахыг алгасах';

  @override
  String get adminLibRequirePerfectMatch => 'Хадмал яг таарахыг шаардах';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Хадмалыг медиа хавтсанд хадгалах';

  @override
  String get adminLibChapterImageExtraction => 'Бүлгийн зургийг задлах';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Сан сканнердах үед бүлгийн зургийг задлах';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay зураг задлахыг идэвхжүүлэх';

  @override
  String get adminLibTrickplayDuringScan =>
      'Сан сканнердах үед Trickplay зургийг задлах';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay зургийг медиа хавтсанд хадгалах';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Олон хавтсанд тархсан цувралыг автоматаар нэгтгэх';

  @override
  String get adminLibSeasonZeroName => 'Тэг улирлын харагдах нэр';

  @override
  String get adminLibLufsScan => 'Аудио нормчлолын LUFS сканыг идэвхжүүлэх';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Стандарт бус уран бүтээлчийн шошгыг эрхэмлэх';

  @override
  String get adminLibAutoAddToCollection =>
      'Кинонуудыг цуглуулгад автоматаар нэмэх';

  @override
  String get adminLibraryNameRequired => 'Номын сангийн нэр шаардлагатай';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Номын сан үүсгэж чадсангүй: $error';
  }

  @override
  String get adminLibraryName => 'Номын сангийн нэр';

  @override
  String get adminSelectedPaths => 'Сонгосон замууд:';

  @override
  String get adminNoPathsAdded => 'Зам нэмээгүй (дараа нэмэх боломжтой)';

  @override
  String get adminCreateLibrary => 'Номын сан үүсгэх';

  @override
  String get paths => 'Замууд:';

  @override
  String get adminDisableUser => 'Хэрэглэгчийг идэвхгүй болгох';

  @override
  String get adminEnableUser => 'Хэрэглэгчийг идэвхжүүлэх';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name-г идэвхгүй болгох уу? Тэд нэвтрэх боломжгүй болно.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name-г идэвхжүүлэх үү? Тэд дахин нэвтрэх боломжтой болно.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Хэрэглэгч \"$name\" идэвхгүй болсон';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Хэрэглэгч \"$name\" идэвхжсэн';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Хэрэглэгчийн бодлогыг шинэчилж чадсангүй: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Хэрэглэгчдийг ачаалж чадсангүй';

  @override
  String get adminSearchUsers => 'Хэрэглэгч хайх';

  @override
  String get adminEditUser => 'Хэрэглэгчийг засах';

  @override
  String get adminAddUser => 'Хэрэглэгч нэмэх';

  @override
  String adminUserCreateFailed(String error) {
    return 'Хэрэглэгчийг үүсгэж чадсангүй: $error';
  }

  @override
  String get adminCreateUser => 'Хэрэглэгч үүсгэх';

  @override
  String get adminPasswordOptional => 'Нууц үг (заавал биш)';

  @override
  String get adminUsernameRequired => 'Хэрэглэгчийн нэр хоосон байж болохгүй';

  @override
  String get adminNoProfileChanges => 'Хадгалах профайлын өөрчлөлт байхгүй';

  @override
  String get adminProfileSaved => 'Профайлыг хадгалсан';

  @override
  String adminSaveFailed(String error) {
    return 'Хадгалж чадсангүй: $error';
  }

  @override
  String get adminPermissionsSaved => 'Зөвшөөрөл хадгалагдсан';

  @override
  String get adminPasswordsMismatch => 'Нууц үг таарахгүй байна';

  @override
  String adminFailed(String error) {
    return 'Амжилтгүй: $error';
  }

  @override
  String get adminUserLoadFailed => 'Хэрэглэгчийг ачаалж чадсангүй';

  @override
  String get adminBackToUsers => 'Хэрэглэгчид рүү буцах';

  @override
  String get adminSaveProfile => 'Профайлыг хадгалах';

  @override
  String get adminDeleteUser => 'Хэрэглэгчийг устгах';

  @override
  String get admin => 'Админ';

  @override
  String get adminFullAccessWarning =>
      'Администраторууд серверт бүрэн нэвтрэх эрхтэй. Болгоомжтой өгөөрэй.';

  @override
  String get administrator => 'Админ';

  @override
  String get adminHiddenUser => 'Нуугдсан хэрэглэгч';

  @override
  String get adminAllowMediaPlayback => 'Медиа тоглуулахыг зөвшөөрөх';

  @override
  String get adminAllowAudioTranscoding => 'Аудио кодлохыг зөвшөөрөх';

  @override
  String get adminAllowVideoTranscoding => 'Видео кодыг хөрвүүлэхийг зөвшөөрөх';

  @override
  String get adminAllowRemuxing => 'Ремукс хийхийг зөвшөөр';

  @override
  String get adminForceRemoteTranscoding =>
      'Алсын эх сурвалжийн кодыг хүчээр өөрчлөх';

  @override
  String get adminAllowContentDeletion => 'Агуулгыг устгахыг зөвшөөрөх';

  @override
  String get adminAllowContentDownloading => 'Контент татаж авахыг зөвшөөрөх';

  @override
  String get adminAllowPublicSharing => 'Олон нийтэд хуваалцахыг зөвшөөрөх';

  @override
  String get adminAllowRemoteControl =>
      'Бусад хэрэглэгчдийг алсаас удирдахыг зөвшөөрөх';

  @override
  String get adminAllowSharedDeviceControl =>
      'Хуваалцсан төхөөрөмжийн хяналтыг зөвшөөрөх';

  @override
  String get adminAllowRemoteAccess => 'Алсын хандалтыг зөвшөөрөх';

  @override
  String get adminRemoteBitrateLimit =>
      'Алсын үйлчлүүлэгчийн битийн хурдны хязгаар (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Хязгааргүй хоосон орхи';

  @override
  String get adminMaxActiveSessions => 'Хамгийн их идэвхтэй сесс';

  @override
  String get adminAllowLiveTvAccess => 'Шууд ТВ-д хандахыг зөвшөөрөх';

  @override
  String get adminAllowLiveTvManagement => 'Шууд ТВ-ийн менежментийг зөвшөөрөх';

  @override
  String get adminAllowCollectionManagement =>
      'Цуглуулгын менежментийг зөвшөөрөх';

  @override
  String get adminAllowSubtitleManagement =>
      'Хадмал орчуулгыг удирдахыг зөвшөөрөх';

  @override
  String get adminAllowLyricManagement => 'Дууны үгийг удирдахыг зөвшөөрөх';

  @override
  String get adminSavePermissions => 'Зөвшөөрлийг хадгалах';

  @override
  String get adminEnableAllLibraryAccess =>
      'Бүх номын санд хандах эрхийг идэвхжүүлнэ';

  @override
  String get adminSaveAccess => 'Хандалтыг хадгалах';

  @override
  String get adminChangePassword => 'Нууц үг солих';

  @override
  String get adminNewPassword => 'Шинэ нууц үг';

  @override
  String get adminConfirmPassword => 'Нууц үгээ баталгаажуулна уу';

  @override
  String get adminSetPassword => 'Нууц үг тохируулах';

  @override
  String get adminResetPassword => 'Нууц үгээ дахин тохируулах';

  @override
  String get adminPasswordReset => 'Нууц үг шинэчлэх';

  @override
  String get adminPasswordUpdated => 'Нууц үг шинэчлэгдсэн';

  @override
  String get adminUserSettings => 'Хэрэглэгчийн тохиргоо';

  @override
  String get adminLibraryAccess => 'Номын санд нэвтрэх';

  @override
  String get adminDeviceAndChannelAccess => 'Төхөөрөмж ба сувгийн хандалт';

  @override
  String get adminEnableAllDevices =>
      'Бүх төхөөрөмжид хандах хандалтыг идэвхжүүлэх';

  @override
  String get adminEnableAllChannels =>
      'Бүх суваг руу нэвтрэх эрхийг идэвхжүүлнэ';

  @override
  String get adminParentalControl => 'Эцэг эхийн хяналт';

  @override
  String get adminMaxParentalRating => 'Зөвшөөрөх насны ангиллын дээд хязгаар';

  @override
  String get adminMaxParentalRatingHint =>
      'Үүнээс өндөр ангилалтай контентыг энэ хэрэглэгчээс нуух болно.';

  @override
  String get adminParentalRatingNone => 'Байхгүй';

  @override
  String get adminBlockUnratedItems =>
      'Ангиллын мэдээлэлгүй эсвэл танигдаагүй зүйлсийг хориглох';

  @override
  String get adminUnratedBook => 'Номууд';

  @override
  String get adminUnratedChannelContent => 'Сувгууд';

  @override
  String get adminUnratedLiveTvChannel => 'Шууд ТВ';

  @override
  String get adminUnratedMovie => 'Кино';

  @override
  String get adminUnratedMusic => 'Хөгжим';

  @override
  String get adminUnratedTrailer => 'Трейлерүүд';

  @override
  String get adminUnratedSeries => 'Цуврал';

  @override
  String get adminAccessSchedules => 'Хандалтын хуваарь';

  @override
  String get adminAccessSchedulesHint =>
      'Зөвхөн доорх хуваарийн цагт хандалтыг зөвшөөрнө. Хуваарь тохируулаагүй бол өдөржин хандах боломжтой.';

  @override
  String get adminAddSchedule => 'Хуваарь нэмэх';

  @override
  String get adminScheduleDay => 'Өдөр';

  @override
  String get adminScheduleStart => 'Эхлэх';

  @override
  String get adminScheduleEnd => 'Дуусах';

  @override
  String get adminDayEveryday => 'Өдөр бүр';

  @override
  String get adminDayWeekday => 'Ажлын өдөр';

  @override
  String get adminDayWeekend => 'Амралтын өдөр';

  @override
  String get adminDaySunday => 'Ням';

  @override
  String get adminDayMonday => 'Даваа';

  @override
  String get adminDayTuesday => 'Мягмар';

  @override
  String get adminDayWednesday => 'Лхагва';

  @override
  String get adminDayThursday => 'Пүрэв';

  @override
  String get adminDayFriday => 'Баасан';

  @override
  String get adminDaySaturday => 'Бямба';

  @override
  String get adminAllowedTags => 'Зөвшөөрсөн шошго';

  @override
  String get adminAllowedTagsHint =>
      'Зөвхөн эдгээр шошготой контентыг харуулна. Бүгдийг зөвшөөрөхийн тулд хоосон орхино уу.';

  @override
  String get adminBlockedTags => 'Хориглосон шошго';

  @override
  String get adminBlockedTagsHint =>
      'Эдгээр шошготой контентыг энэ хэрэглэгчээс нууна.';

  @override
  String get adminAddTag => 'Шошго нэмэх';

  @override
  String get adminEnabledDevices => 'Идэвхжүүлсэн төхөөрөмж';

  @override
  String get adminEnabledChannels => 'Идэвхжүүлсэн суваг';

  @override
  String get adminAuthProvider => 'Баталгаажуулалтын үйлчилгээ үзүүлэгч';

  @override
  String get adminPasswordResetProvider => 'Нууц үг сэргээх үйлчилгээ үзүүлэгч';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Түгжихээс өмнөх амжилтгүй нэвтрэлтийн дээд хязгаар';

  @override
  String get adminLoginAttemptsHint =>
      'Үндсэн утгад 0, түгжээг унтраахад -1 гэж тохируулна уу.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay хандалт';

  @override
  String get adminSyncPlayCreateAndJoin => 'Бүлэг үүсгэх, нэгдэхийг зөвшөөрөх';

  @override
  String get adminSyncPlayJoin => 'Бүлэгт нэгдэхийг зөвшөөрөх';

  @override
  String get adminSyncPlayNone => 'Хандалтгүй';

  @override
  String get adminContentDeletionFolders => 'Контент устгахыг эндээс зөвшөөрөх';

  @override
  String get adminResetPasswordWarning =>
      'Энэ нь нууц үгийг устгах болно. Хэрэглэгч нууц үггүйгээр нэвтрэх боломжтой болно.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Сервер HTTP буцаасан $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Та $name-г устгахдаа итгэлтэй байна уу?';
  }

  @override
  String adminUserDeleted(String name) {
    return '\"$name\" хэрэглэгчийг устгасан';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Хэрэглэгчийг устгаж чадсангүй: $error';
  }

  @override
  String get adminCreateApiKey => 'API түлхүүр үүсгэх';

  @override
  String get adminAppName => 'Апп нэр';

  @override
  String get adminApiKeyCreated => 'API түлхүүр үүсгэсэн';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Түлхүүрийг амжилттай үүсгэсэн. Сервер жетоныг буцааж өгөөгүй. Серверийн API түлхүүрүүдийг шалгана уу.';

  @override
  String get adminKeyCopied => 'Түлхүүрийг санах ой руу хуулсан';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Түлхүүрийг үүсгэж чадсангүй: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Серверийн хариуд түлхүүрийн токен дутуу байна';

  @override
  String get adminRevokeApiKey => 'API түлхүүрийг хүчингүй болгох';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name-н түлхүүрийг хүчингүй болгох уу?';
  }

  @override
  String get adminApiKeyRevoked => 'API түлхүүрийг хүчингүй болгосон';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Түлхүүрийг хүчингүй болгож чадсангүй: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API түлхүүрүүдийг ачаалж чадсангүй';

  @override
  String get adminApiKeysTitle => 'API түлхүүрүүд';

  @override
  String get adminCreateKey => 'Түлхүүр үүсгэх';

  @override
  String get adminNoApiKeys => 'API түлхүүр олдсонгүй';

  @override
  String get adminUnknownApp => 'Үл мэдэгдэх програм';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Токен: $token\\nҮүсгэсэн: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Нөөцлөлт үүсгэх';

  @override
  String get adminBackupInclude => 'Нөөцлөлтөд юу оруулахаа сонгоно уу.';

  @override
  String get adminBackupDatabase => 'Өгөгдлийн сан';

  @override
  String get adminBackupDatabaseAlways => 'Үргэлж багтана';

  @override
  String get adminBackupMetadata => 'Мета өгөгдөл';

  @override
  String get adminBackupSubtitles => 'Хадмал';

  @override
  String get adminBackupTrickplay => 'Trickplay зураг';

  @override
  String get adminCreatingBackup => 'Нөөцлөлт үүсгэж байна...';

  @override
  String get adminBackupCreated => 'Нөөцлөлтийг амжилттай үүсгэсэн';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Нөөцлөлтийг үүсгэж чадсангүй: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Серверийн хариуд нөөц зам байхгүй байна';

  @override
  String adminBackupManifest(String name) {
    return 'Манифест: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Манифестыг ачаалж чадсангүй: $error';
  }

  @override
  String get adminConfirmRestore => 'Сэргээхийг баталгаажуулна уу';

  @override
  String get adminRestoringBackup => 'Нөөцлөлтийг сэргээж байна...';

  @override
  String adminRestoreFailed(String error) {
    return 'Нөөцлөлтийг сэргээж чадсангүй: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Нөөцлөлтийг ачаалж чадсангүй';

  @override
  String get adminCreateBackup => 'Нөөцлөлт үүсгэх';

  @override
  String get adminNoBackups => 'Нөөц олдсонгүй';

  @override
  String get adminViewDetails => 'Дэлгэрэнгүйг харах';

  @override
  String get restore => 'Сэргээх';

  @override
  String get adminLogsLoadFailed => 'Серверийн бүртгэлийг ачаалж чадсангүй';

  @override
  String get adminNoLogFiles => 'Лог файл олдсонгүй';

  @override
  String get adminLogCopied => 'Бүртгэлийг санах ой руу хуулсан';

  @override
  String get adminSaveLogFile => 'Лог файлыг хадгалах';

  @override
  String adminSavedTo(String path) {
    return '$path-д хадгалсан';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Файлыг хадгалж чадсангүй: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName-г ачаалж чадсангүй';
  }

  @override
  String get adminSearchInLog => 'Бүртгэлээс хайх';

  @override
  String get adminNoMatchingLines => 'Тохирох шугам байхгүй';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Даалгавруудыг ачаалж чадсангүй: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Төлөвлөсөн ажил олдсонгүй';

  @override
  String get adminNoTasksMatchFilter =>
      'Одоогийн шүүлтүүртэй тохирох ажил алга';

  @override
  String adminTaskStartFailed(String error) {
    return 'Ажлыг эхлүүлж чадсангүй: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Даалгаврыг зогсоож чадсангүй: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Даалгаврыг ачаалж чадсангүй: $error';
  }

  @override
  String get adminRunNow => 'Одоо ажиллуул';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Өдөөгчийг устгаж чадсангүй: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Триггер нэмж чадсангүй: $error';
  }

  @override
  String get adminLastExecution => 'Сүүлийн гүйцэтгэл';

  @override
  String get adminTriggers => 'Өдөөгч';

  @override
  String get adminAddTrigger => 'Trigger нэмнэ үү';

  @override
  String get adminNoTriggers => 'Ямар ч триггер тохируулаагүй байна';

  @override
  String get adminTriggerType => 'Триггерийн төрөл';

  @override
  String get adminTimeLimit => 'Цагийн хязгаар (заавал биш)';

  @override
  String get adminNoLimit => 'Хязгааргүй';

  @override
  String adminHours(String hours) {
    return '$hours цаг(ууд)';
  }

  @override
  String get adminDayOfWeek => 'Долоо хоногийн өдөр';

  @override
  String get adminSearchPlugins => 'Plugins хайх...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Залгаасыг асааж чадсангүй: $error';
  }

  @override
  String get adminUninstallPlugin => 'Plugin-ийг устгана уу';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Та \"$name\"-г устгахдаа итгэлтэй байна уу?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Залгаасыг устгаж чадсангүй: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Багцыг суулгаж чадсангүй: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Шинэчлэлтийг суулгаж чадсангүй: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Нэмэлтүүдийг ачаалж чадсангүй: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Таны хайлтад тохирох нэмэлт өргөтгөл байхгүй байна';

  @override
  String get adminNoPluginsInstalled => 'Ямар ч залгаас суулгаагүй байна';

  @override
  String adminInstallUpdate(String version) {
    return 'Шинэчлэлтийг суулгах (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Каталогийг ачаалж чадсангүй: $error';
  }

  @override
  String get adminNoPackagesMatchSearch => 'Таны хайлтад тохирох багц алга';

  @override
  String get adminNoPackagesAvailable => 'Багц байхгүй';

  @override
  String get adminExperimentalIntegration => 'Туршилтын интеграци';

  @override
  String get adminExperimentalWarning =>
      'Plugin тохиргоог нэгтгэх нь туршилтын хэвээр байна. Зарим тохиргооны хуудсууд зөв харагдахгүй байж магадгүй.';

  @override
  String get continueAction => 'Үргэлжлүүлэх';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'Серверийг дахин эхлүүлсний дараа \"$name\" устгагдах болно';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Устгаж чадсангүй: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\"-г v$version руу шинэчилж байна...';
  }

  @override
  String get adminMissingAuthToken =>
      'Тохиргоог нээх боломжгүй: баталгаажуулах токен алга.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Залгаасыг ачаалж чадсангүй: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin олдсонгүй';

  @override
  String adminPluginVersion(String version) {
    return 'Хувилбар $version';
  }

  @override
  String get adminEnablePlugin => 'Plugin-г идэвхжүүлнэ үү';

  @override
  String get adminPluginSettingsPage => 'Plugin тохиргооны хуудас';

  @override
  String get adminRevisionHistory => 'Хяналтын түүх';

  @override
  String get adminNoChangelog => 'Өөрчлөлтийн бүртгэл байхгүй байна.';

  @override
  String get adminRemoveRepository => 'Repository устгах';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Та \"$name\"-г устгахдаа итгэлтэй байна уу?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Хадгалах газрыг хадгалж чадсангүй: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Хадгалах газрыг ачаалж чадсангүй: $error';
  }

  @override
  String get adminRepositoryNameHint => 'жишээ нь Jellyfin Тогтвортой';

  @override
  String get adminRepositoryUrl => 'Хадгалах URL';

  @override
  String get adminAddEntry => 'Оруулга нэмэх';

  @override
  String get adminInvalidUrl => 'Хүчингүй URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Plugin тохиргоог ачаалах боломжгүй: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri-г нээж чадсангүй';
  }

  @override
  String get adminOpenInBrowser => 'Хөтөч дээр нээх';

  @override
  String get adminOpenExternally => 'Гаднаас нээх';

  @override
  String get adminGeneralSettings => 'Ерөнхий тохиргоо';

  @override
  String get adminServerName => 'Серверийн нэр';

  @override
  String get adminPreferredMetadataCountry => 'Сонгосон мета өгөгдлийн улс';

  @override
  String get adminCachePath => 'Кэш зам';

  @override
  String get adminMetadataPath => 'Мета өгөгдлийн зам';

  @override
  String get adminLibraryScanConcurrency => 'Номын санг скан хийх зэрэг';

  @override
  String get adminParallelImageEncodingLimit => 'Зэрэгцээ зураг кодлох хязгаар';

  @override
  String get adminSlowResponseThreshold => 'Удаан хариу өгөх босго (мс)';

  @override
  String get adminBrandingSaved => 'Брэндийн тохиргоог хадгалсан';

  @override
  String get adminBrandingLoadFailed => 'Брэндийн тохиргоог ачаалж чадсангүй';

  @override
  String get adminLoginDisclaimer => 'Нэвтрэхээс татгалзах мэдэгдэл';

  @override
  String get adminLoginDisclaimerHint => 'Нэвтрэх маягтын доор HTML харагдана';

  @override
  String get adminCustomCss => 'Захиалгат CSS';

  @override
  String get adminCustomCssHint => 'Вэб интерфэйс дээр тусгай CSS ашигласан';

  @override
  String get adminEnableSplashScreen => 'Нээлтийн дэлгэцийг идэвхжүүлэх';

  @override
  String get adminStreamingSaved => 'Дамжуулалтын тохиргоог хадгалсан';

  @override
  String get adminStreamingLoadFailed =>
      'Дамжуулалтын тохиргоог ачаалж чадсангүй';

  @override
  String get adminStreamingDescription =>
      'Алсын холболтод дэлхийн урсгалын битийн хурдны хязгаарыг тохируулна уу.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Алсын хэрэглэгчийн битийн хурдны хязгаар (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Хоосон эсвэл хязгааргүй бол 0 үлдээгээрэй';

  @override
  String get adminPlaybackSaved => 'Тоглуулах тохиргоог хадгалсан';

  @override
  String get adminPlaybackLoadFailed => 'Тоглуулах тохиргоог ачаалж чадсангүй';

  @override
  String get adminPlaybackTranscoding => 'Тоглуулах / код хувиргах';

  @override
  String get adminHardwareAcceleration => 'Техник хангамжийн хурдатгал';

  @override
  String get adminVaapiDevice => 'VA-API төхөөрөмж';

  @override
  String get adminEnableHardwareEncoding =>
      'Техник хангамжийн кодчилолыг идэвхжүүлнэ үү';

  @override
  String get adminEnableHardwareDecoding =>
      'Техник хангамжийн код тайлахыг идэвхжүүлэх:';

  @override
  String get adminEncodingThreads => 'Сэдвүүдийг кодлох';

  @override
  String get adminAutomatic => '0 = автомат';

  @override
  String get adminTranscodingTempPath => 'Түр зуурын замыг хөрвүүлэх';

  @override
  String get adminEnableFallbackFont => 'Нөөц фонтыг идэвхжүүлэх';

  @override
  String get adminFallbackFontPath => 'Буцах үсгийн зам';

  @override
  String get adminAllowSegmentDeletion => 'Сегмент устгахыг зөвшөөрөх';

  @override
  String get adminSegmentKeepSeconds => 'Сегмент хадгалах (секунд)';

  @override
  String get adminThrottleBuffering => 'Тохируулагч буфер';

  @override
  String get adminTrickplaySaved => 'Trickplay тохиргоог хадгалсан';

  @override
  String get adminTrickplayLoadFailed => 'Trickplay тохиргоог ачаалж чадсангүй';

  @override
  String get adminEnableHardwareAcceleration =>
      'Техник хангамжийн хурдатгалыг идэвхжүүлэх';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Зөвхөн түлхүүрийн хүрээг задлахыг идэвхжүүлнэ';

  @override
  String get adminKeyFrameSubtitle => 'Илүү хурдан боловч нарийвчлал багатай';

  @override
  String get adminScanBehavior => 'Зан төлөвийг сканнердах';

  @override
  String get adminProcessPriority => 'Процессын тэргүүлэх чиглэл';

  @override
  String get adminImageSettings => 'Зургийн тохиргоо';

  @override
  String get adminIntervalMs => 'Интервал (мс)';

  @override
  String get adminCaptureFrameSubtitle => 'Хүрээг хэр олон удаа авах вэ';

  @override
  String get adminWidthResolutions => 'Өргөн нарийвчлалууд';

  @override
  String get adminTileWidth => 'Хавтангийн өргөн';

  @override
  String get adminTileHeight => 'Хавтангийн өндөр';

  @override
  String get adminQualitySubtitle => 'Доод утга = илүү чанартай, том файлууд';

  @override
  String get adminProcessThreads => 'Урсгалуудыг боловсруулах';

  @override
  String get adminResumeSaved => 'Хадгалсан тохиргоог үргэлжлүүлэх';

  @override
  String get adminResumeLoadFailed => 'Үргэлжлүүлэх тохиргоог ачаалж чадсангүй';

  @override
  String get adminResumeDescription =>
      'Хэзээ контентыг хэсэгчлэн тоглуулсан эсвэл бүрэн тоглуулсан гэж тэмдэглэхийг тохируулна уу.';

  @override
  String get adminMinResumePercentage => 'Анкетийн хамгийн бага хувь';

  @override
  String get adminMinResumeSubtitle =>
      'Явцыг хадгалахын тулд контентыг энэ хувиас хэтрүүлсэн байх ёстой';

  @override
  String get adminMaxResumePercentage => 'Анкетын хамгийн их хувь';

  @override
  String get adminMaxResumeSubtitle =>
      'Энэ хувийн дараа контент бүрэн тоглосон гэж үзнэ';

  @override
  String get adminMinResumeDuration =>
      'Үргэлжлүүлэх хамгийн бага хугацаа (секунд)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Үүнээс богино зүйлсийг үргэлжлүүлэх боломжгүй';

  @override
  String get adminMinAudiobookResume =>
      'Аудио номыг үргэлжлүүлэх хамгийн бага хувь';

  @override
  String get adminMaxAudiobookResume =>
      'Аудио номын үргэлжлүүлэлтийн дээд хувь';

  @override
  String get adminNetworkingSaved =>
      'Сүлжээний тохиргоог хадгалсан. Серверийг дахин эхлүүлэх шаардлагатай байж магадгүй.';

  @override
  String get adminNetworkingLoadFailed =>
      'Сүлжээний тохиргоог ачаалж чадсангүй';

  @override
  String get adminNetworkingWarning =>
      'Сүлжээний тохиргоонд өөрчлөлт оруулахад серверийг дахин эхлүүлэх шаардлагатай байж магадгүй.';

  @override
  String get adminEnableRemoteAccess => 'Алсын хандалтыг идэвхжүүлэх';

  @override
  String get ports => 'Портууд';

  @override
  String get adminHttpPort => 'HTTP порт';

  @override
  String get adminHttpsPort => 'HTTPS порт';

  @override
  String get adminPublicHttpsPort => 'Нийтийн HTTPS порт';

  @override
  String get adminBaseUrl => 'Үндсэн URL';

  @override
  String get adminBaseUrlHint => 'жишээ нь /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS-г идэвхжүүлнэ үү';

  @override
  String get adminLocalNetwork => 'Орон нутгийн сүлжээ';

  @override
  String get adminLocalNetworkAddresses => 'Дотоод сүлжээний хаягууд';

  @override
  String get adminKnownProxies => 'Мэдэгдэж буй прокси';

  @override
  String get adminRemoteIpFilter => 'Алсын IP шүүлтүүр';

  @override
  String get adminRemoteIpFilterEntries => 'Алсын IP шүүлтүүр';

  @override
  String get adminCertificatePath => 'Гэрчилгээний зам';

  @override
  String get whitelist => 'Цагаан жагсаалт';

  @override
  String get blacklist => 'Хар жагсаалт';

  @override
  String get notSet => 'Тохируулаагүй';

  @override
  String get adminMetadataSaved => 'Мета өгөгдлийг хадгалсан';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Мета өгөгдлийг ачаалж чадсангүй: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Мета өгөгдлийг хадгалж чадсангүй: $error';
  }

  @override
  String get adminRefreshMetadata => 'Мета өгөгдлийг сэргээх';

  @override
  String get recursive => 'Рекурсив';

  @override
  String get adminReplaceAllMetadata => 'Бүх мета өгөгдлийг солих';

  @override
  String get adminReplaceAllImages => 'Бүх зургийг солих';

  @override
  String get adminMetadataRefreshRequested =>
      'Мета өгөгдлийг шинэчлэх хүсэлт тавьсан';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Мета өгөгдлийг сэргээж чадсангүй: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Алсын тохирох зүйл олдсонгүй';

  @override
  String get adminRemoteResults => 'Алсын үр дүн';

  @override
  String get adminRemoteMetadataApplied => 'Алсын мета өгөгдлийг ашигласан';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Алсын хайлт амжилтгүй болсон: $error';
  }

  @override
  String get adminUpdateContentType => 'Агуулгын төрлийг шинэчлэх';

  @override
  String get adminContentType => 'Агуулгын төрөл';

  @override
  String get adminContentTypeUpdated => 'Агуулгын төрлийг шинэчилсэн';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Агуулгын төрлийг шинэчилж чадсангүй: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Мета өгөгдөл засварлагчийг ачаалж чадсангүй';

  @override
  String get adminNoPeopleEntries => 'Хүн оруулахгүй';

  @override
  String get adminNoExternalIds => 'Гадаад ID байхгүй';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType зураг шинэчлэгдсэн';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Зургийг татаж авч чадсангүй: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Дэмжигдээгүй зургийн формат';

  @override
  String get adminImageReadFailed => 'Сонгосон зургийг уншиж чадсангүй';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType зураг байршуулсан';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Зургийг байршуулж чадсангүй: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType зургийг устгана уу';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType зургийг устгасан';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Зургийг устгаж чадсангүй: $error';
  }

  @override
  String get adminAllProviders => 'Бүх үйлчилгээ үзүүлэгчид';

  @override
  String get adminNoRemoteImages => 'Алсын зураг олдсонгүй';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Таалагч илрүүлж чадсангүй: $error';
  }

  @override
  String get adminAddTuner => 'Таалагч нэмнэ үү';

  @override
  String get adminEditTuner => 'Тюнер засах';

  @override
  String get adminTunerTypeM3u => 'M3U тюнер';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Файл эсвэл URL';

  @override
  String get adminTunerIpAddress => 'Тюнерийн IP хаяг';

  @override
  String get adminTunerFriendlyName => 'Ойлгомжтой нэр';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Зэрэг холболтын хязгаар';

  @override
  String get adminTunerCountHelp =>
      'Тюнерийн зэрэг зөвшөөрөх урсгалын дээд тоо. Хязгааргүй бол 0 гэж тохируулна уу.';

  @override
  String get adminTunerFallbackBitrate => 'Нөөц дамжуулалтын дээд битрэйт';

  @override
  String get adminTunerImportFavoritesOnly => 'Зөвхөн дуртай сувгийг импортлох';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Техник хангамжийн хөрвүүлэлтийг зөвшөөрөх';

  @override
  String get adminTunerAllowFmp4 => 'fMP4 хөрвүүлэлтийн савыг зөвшөөрөх';

  @override
  String get adminTunerAllowStreamSharing => 'Урсгал хуваалцахыг зөвшөөрөх';

  @override
  String get adminTunerEnableStreamLooping => 'Урсгалыг давтахыг идэвхжүүлэх';

  @override
  String get adminTunerIgnoreDts => 'DTS-ийг үл хэрэгсэх';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Оролтыг үндсэн кадрын давтамжаар унших';

  @override
  String get adminEditProvider => 'Үйлчилгээ үзүүлэгч засах';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Файл эсвэл URL';

  @override
  String get adminXmltvMoviePrefix => 'Киноны угтвар';

  @override
  String get adminXmltvMovieCategories => 'Киноны ангилал';

  @override
  String get adminXmltvCategoriesHelp =>
      'Олон ангиллыг босоо зураасаар тусгаарлана уу.';

  @override
  String get adminXmltvKidsCategories => 'Хүүхдийн ангилал';

  @override
  String get adminXmltvNewsCategories => 'Мэдээний ангилал';

  @override
  String get adminXmltvSportsCategories => 'Спортын ангилал';

  @override
  String get adminSdUsername => 'Хэрэглэгчийн нэр';

  @override
  String get adminSdPassword => 'Нууц үг';

  @override
  String get adminSdCountry => 'Улс';

  @override
  String get adminSdCountrySelect => 'Улс сонгоно уу';

  @override
  String get adminSdPostalCode => 'Шуудангийн код';

  @override
  String get adminSdGetListings => 'Жагсаалт авах';

  @override
  String get adminSdListings => 'Жагсаалт';

  @override
  String get adminEnableAllTuners => 'Бүх тюнерийг идэвхжүүлэх';

  @override
  String get adminTunerType => 'Тохируулагчийн төрөл';

  @override
  String get adminTunerAdded => 'Тохируулагч нэмсэн';

  @override
  String adminTunerAddFailed(String error) {
    return 'Тохируулагч нэмж чадсангүй: $error';
  }

  @override
  String get adminAddGuideProvider => 'Хөтөч нийлүүлэгч нэмнэ үү';

  @override
  String get adminProviderType => 'Үйлчилгээ үзүүлэгчийн төрөл';

  @override
  String get adminProviderAdded => 'Үйлчилгээ үзүүлэгч нэмэгдсэн';

  @override
  String adminProviderAddFailed(String error) {
    return 'Үйлчилгээ үзүүлэгчийг нэмж чадсангүй: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Тюнер устгаж чадсангүй: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'Тохируулагчийг дахин тохируулах хүсэлт тавьсан';

  @override
  String adminTunerResetFailed(String error) {
    return 'Тохируулагчийг дахин тохируулж чадсангүй: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Энэ төрлийн тюнер дахин тохируулахыг дэмждэггүй.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Үйлчилгээ үзүүлэгчийг устгаж чадсангүй: $error';
  }

  @override
  String get adminRecordingSettings => 'Бичлэгийн тохиргоо';

  @override
  String get adminPrePadding => 'Урьдчилан дүүргэх (минут)';

  @override
  String get adminPostPadding => 'Дүүргэлтийн дараах (минут)';

  @override
  String get adminRecordingPath => 'Бичлэг хийх зам';

  @override
  String get adminSeriesRecordingPath => 'Цуврал бичлэг хийх зам';

  @override
  String get adminMovieRecordingPath => 'Кино бичлэгийн зам';

  @override
  String get adminGuideDays => 'Хөтөлбөрийн өгөгдлийн хоног';

  @override
  String get adminGuideDaysAuto => 'Автомат';

  @override
  String adminGuideDaysValue(int days) {
    return '$days хоног';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Дараах боловсруулалтын програмын зам';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Дараах боловсруулагчийн аргумент';

  @override
  String get adminSaveRecordingNfo => 'Бичлэгийн NFO мета өгөгдлийг хадгалах';

  @override
  String get adminSaveRecordingImages => 'Бичлэгийн зургийг хадгалах';

  @override
  String get adminLiveTvSectionTiming => 'Цаг тохируулга';

  @override
  String get adminLiveTvSectionPaths => 'Бичлэгийн замууд';

  @override
  String get adminLiveTvSectionPostProcessing => 'Дараах боловсруулалт';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Хөтөлбөрийн өгөгдөл: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Бичлэгийн тохиргоог хадгалсан';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Тохиргоог хадгалж чадсангүй: $error';
  }

  @override
  String get adminSetChannelMappings => 'Сувгийн зураглалыг тохируулах';

  @override
  String get adminMappingJson => 'JSON-ийн зураглал';

  @override
  String get adminMappingJsonHint => 'Жишээ нь: JSON ачааллын зураглал';

  @override
  String get adminChannelMappingsUpdated => 'Сувгийн зураглалыг шинэчилсэн';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Зураглалыг шинэчилж чадсангүй: $error';
  }

  @override
  String get adminLiveTvLoadFailed => 'Шууд ТВ-ийн удирдлагыг ачаалж чадсангүй';

  @override
  String get adminTunerDevices => 'Тохируулагч төхөөрөмж';

  @override
  String get adminNoTunerHosts => 'Тохируулсан тааруулагч хост байхгүй байна';

  @override
  String get adminGuideProviders => 'Хөтөч үйлчилгээ үзүүлэгчид';

  @override
  String get adminRefreshGuideData => 'Хөтөлбөрийн өгөгдлийг шинэчлэх';

  @override
  String get adminGuideRefreshStarted =>
      'Хөтөлбөрийн өгөгдлийн шинэчлэл эхэллээ';

  @override
  String get adminGuideRefreshUnavailable =>
      'Энэ сервер дээр хөтөлбөр шинэчлэх ажил боломжгүй байна.';

  @override
  String get adminAddProvider => 'Үйлчилгээ үзүүлэгч нэмэх';

  @override
  String get adminNoListingProviders =>
      'Жагсаалтын үйлчилгээ үзүүлэгчийг тохируулаагүй байна';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Бичлэг хийх зам: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Цуврал зам: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Урьдчилан дүүргэх: $minutes мин';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Жийргэвчний дараах: $minutes мин';
  }

  @override
  String get adminTunerDiscovery => 'Тохируулагчийн нээлт';

  @override
  String get adminChannelMappings => 'Сувгийн зураглал';

  @override
  String get adminNoDiscoveredTuners => 'Одоогоор олдсон тааруулагч алга';

  @override
  String get adminSettingsSaved => 'Тохиргоог хадгалсан';

  @override
  String get adminBackupsNotAvailable =>
      'Энэ серверийн бүтэц дээр нөөцлөлт хийх боломжгүй.';

  @override
  String get adminRestoreWarning1 =>
      'Сэргээх нь одоогийн БҮХ серверийн өгөгдлийг нөөц мэдээллээр солих болно.';

  @override
  String get adminRestoreWarning2 =>
      'Одоогийн серверийн тохиргоо, хэрэглэгчид болон номын сангийн өгөгдлийг дарж бичих болно.';

  @override
  String get adminRestoreWarning3 =>
      'Сэргээлтийн дараа сервер дахин асах болно.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name нөөцийг одоо сэргээх үү?';
  }

  @override
  String get adminRestoreRequested =>
      'Сэргээх хүсэлт тавьсан. Серверийг дахин эхлүүлэх нь энэ сессийг салгаж болзошгүй.';

  @override
  String get adminBackupsTitle => 'Нөөцлөлт';

  @override
  String get adminUnknownDate => 'Тодорхойгүй огноо';

  @override
  String get adminUnnamedBackup => 'Нэргүй нөөцлөлт';

  @override
  String get adminLiveTvNotAvailable =>
      'Шууд ТВ-ийн удирдлага энэ серверийн бүтэц дээр боломжгүй.';

  @override
  String get adminLiveTvTitle => 'Шууд ТВ-ийн удирдлага';

  @override
  String get adminApply => 'Хэрэглэх';

  @override
  String get adminNotSet => 'Тохируулаагүй';

  @override
  String get adminReset => 'Дахин тохируулах';

  @override
  String get adminLogsTitle => 'Серверийн бүртгэл';

  @override
  String get adminLogsNewestFirst => 'Хамгийн шинэ Эхний';

  @override
  String get adminLogsOldestFirst => 'Хамгийн эртний Эхний';

  @override
  String get adminLogsJustNow => 'Яг одоо';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes м өмнө';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours цагийн өмнө';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d өмнө';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName-г ачаалж чадсангүй';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count таарч байна';
  }

  @override
  String get adminLogViewerNoMatches => 'Тохирох шугам байхгүй';

  @override
  String get adminMetadataEditorTitle => 'Мета өгөгдөл засварлагч';

  @override
  String get adminMetadataIdentify => 'Таних';

  @override
  String get adminMetadataType => 'Төрөл';

  @override
  String get adminMetadataDetails => 'Дэлгэрэнгүй мэдээлэл';

  @override
  String get adminMetadataExternalIds => 'Гадаад ID';

  @override
  String get adminMetadataImages => 'Зураг';

  @override
  String get adminMetadataFieldTitle => 'Гарчиг';

  @override
  String get adminMetadataFieldSortTitle => 'Гарчиг эрэмбэлэх';

  @override
  String get adminMetadataFieldOriginalTitle => 'Жинхэнэ гарчиг';

  @override
  String get adminMetadataFieldPremiereDate => 'Нээлтийн огноо (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Дуусах огноо (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Үйлдвэрлэсэн жил';

  @override
  String get adminMetadataFieldOfficialRating => 'Албан ёсны үнэлгээ';

  @override
  String get adminMetadataFieldCommunityRating => 'Олон нийтийн үнэлгээ';

  @override
  String get adminMetadataFieldCriticRating => 'Шүүмжлэгчийн үнэлгээ';

  @override
  String get adminMetadataFieldTagline => 'Шилдэг үг';

  @override
  String get adminMetadataFieldOverview => 'Тойм';

  @override
  String get adminMetadataGenres => 'Төрөл';

  @override
  String get adminMetadataTags => 'Шошго';

  @override
  String get adminMetadataStudios => 'Студиуд';

  @override
  String get adminMetadataPeople => 'Хүмүүс';

  @override
  String get adminMetadataAddGenre => 'Төрөл нэмэх';

  @override
  String get adminMetadataAddTag => 'Шошго нэмэх';

  @override
  String get adminMetadataAddStudio => 'Студи нэмэх';

  @override
  String get adminMetadataAddPerson => 'Хүн нэмэх';

  @override
  String get adminMetadataEditPerson => 'Хүн засах';

  @override
  String get adminMetadataRole => 'Үүрэг';

  @override
  String get adminMetadataImagePrimary => 'Үндсэн';

  @override
  String get adminMetadataImageBackdrop => 'Арын дэвсгэр';

  @override
  String get adminMetadataImageLogo => 'Лого';

  @override
  String get adminMetadataImageBanner => 'Баннер';

  @override
  String get adminMetadataImageThumb => 'Эрхий хуруу';

  @override
  String get adminMetadataRecursive => 'Рекурсив';

  @override
  String get adminMetadataProvider => 'Үйлчилгээ үзүүлэгч';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType зураг шинэчлэгдсэн';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType зураг байршуулсан';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType зургийг устгасан';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Зургийг татаж авч чадсангүй: $error';
  }

  @override
  String get adminMetadataImageReadFailed => 'Сонгосон зургийг уншиж чадсангүй';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Зургийг байршуулж чадсангүй: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType зургийг устгана уу';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Энэ нь тухайн зүйлээс одоогийн зургийг устгана.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Зургийг устгаж чадсангүй: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType зургийг сонгоно уу';
  }

  @override
  String get adminMetadataUpload => 'Байршуулах';

  @override
  String get adminMetadataUpdate => 'Шинэчлэх';

  @override
  String get adminMetadataRemoteImage => 'Алсын зураг';

  @override
  String get adminPluginsInstalled => 'Суулгасан';

  @override
  String get adminPluginsCatalog => 'Каталог';

  @override
  String get adminPluginsActive => 'Идэвхтэй';

  @override
  String get adminPluginsRestart => 'Дахин эхлүүлэх';

  @override
  String get adminPluginsNoSearchResults =>
      'Таны хайлтад тохирох нэмэлт өргөтгөл байхгүй байна';

  @override
  String get adminPluginsNoneInstalled => 'Ямар ч залгаас суулгаагүй байна';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Шинэчлэлт боломжтой: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Шинэчлэлт боломжтой';

  @override
  String get adminPluginsPendingRemoval =>
      'Дахин эхлүүлсний дараа устгахыг хүлээж байна';

  @override
  String get adminPluginsChangesPending =>
      'Дахин эхлүүлэх хүлээгдэж буй өөрчлөлтүүд';

  @override
  String get adminPluginsEnable => 'Идэвхжүүлэх';

  @override
  String get adminPluginsDisable => 'Идэвхгүй болгох';

  @override
  String get adminPluginsInstallUpdate => 'Шинэчлэлтийг суулгана уу';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Шинэчлэлтийг суулгах (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Таны хайлтад тохирох багц алга';

  @override
  String get adminPluginsCatalogEmpty => 'Багц байхгүй';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\"-г суулгаж байна...';
  }

  @override
  String get adminPluginDetailExperimental => 'Туршилтын интеграци';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Plugin тохиргоог нэгтгэх нь туршилтын хэвээр байна. Зарим талбар эсвэл бүдүүвч хараахан зөв харагдахгүй байж магадгүй.';

  @override
  String get adminPluginDetailToggle404 =>
      'Залгаасыг асааж чадсангүй. Сервер энэ залгаасын хувилбарыг олж чадсангүй. Залгаасуудыг сэргээж үзээд дахин оролдоно уу.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Залгаасыг асааж чадсангүй. Дэлгэрэнгүй мэдээллийг серверийн бүртгэлээс шалгана уу.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Тохиргоо';
  }

  @override
  String get adminPluginDetailDetails => 'Дэлгэрэнгүй мэдээлэл';

  @override
  String get adminPluginDetailDeveloper => 'Хөгжүүлэгч';

  @override
  String get adminPluginDetailRepository => 'Хадгалах газар';

  @override
  String get adminPluginDetailBundled => 'Багцалсан';

  @override
  String get adminPluginDetailEnablePlugin => 'Plugin-г идэвхжүүлнэ үү';

  @override
  String get adminPluginDetailRestartRequired =>
      'Өөрчлөлтүүд хүчин төгөлдөр болохын тулд серверийг дахин эхлүүлэх шаардлагатай.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Серверийг дахин эхлүүлсний дараа энэ залгаасыг устгах болно.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Энэ залгаас буруу ажилласан бөгөөд зөв ажиллахгүй байж магадгүй.';

  @override
  String get adminPluginDetailNotSupported =>
      'Энэ залгаасыг одоогийн серверийн хувилбар дэмждэггүй.';

  @override
  String get adminPluginDetailSuperseded =>
      'Энэ залгаасыг шинэ хувилбараар сольсон.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Хадгалах газрыг ачаалж чадсангүй: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Repository устгах';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Та \"$name\"-г устгахдаа итгэлтэй байна уу?';
  }

  @override
  String get adminReposRemove => 'Хасах';

  @override
  String adminReposSaveFailed(String error) {
    return 'Хадгалах газрыг хадгалж чадсангүй: $error';
  }

  @override
  String get adminReposEmpty => 'Ямар ч хадгалах газар тохируулаагүй байна';

  @override
  String get adminReposEmptySubtitle =>
      'Боломжтой залгаасуудыг үзэхийн тулд репозитор нэмнэ үү';

  @override
  String get adminReposUnnamed => '(нэргүй)';

  @override
  String get adminReposEditTitle => 'Хадгалах газрыг засах';

  @override
  String get adminReposAddTitle => 'Хадгалах газар нэмэх';

  @override
  String get adminReposUrl => 'Хадгалах URL';

  @override
  String get adminReposNameHint => 'жишээ нь Jellyfin Тогтвортой';

  @override
  String get adminPluginSettingsInvalidUrl => 'Хүчингүй URL';

  @override
  String get adminGeneralSettingsTitle => 'Ерөнхий тохиргоо';

  @override
  String get adminGeneralMetadataLanguage => 'Сонгосон мета өгөгдлийн хэл';

  @override
  String get adminGeneralMetadataLanguageHint => 'жишээ нь en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Сонгосон мета өгөгдлийн улс';

  @override
  String get adminGeneralMetadataCountryHint => 'жишээ нь АНУ, DE, ФР';

  @override
  String get adminGeneralLibraryScanConcurrency => 'Номын санг скан хийх зэрэг';

  @override
  String get adminGeneralImageEncodingLimit => 'Зэрэгцээ зураг кодлох хязгаар';

  @override
  String get adminUnknownError => 'Үл мэдэгдэх алдаа';

  @override
  String get adminBrowse => 'Үзэх';

  @override
  String get adminCloseBrowser => 'Хөтөчийг хаах';

  @override
  String get adminNetworkingTitle => 'Сүлжээ';

  @override
  String get adminNetworkingRestartWarning =>
      'Сүлжээний тохиргоонд өөрчлөлт оруулахад серверийг дахин эхлүүлэх шаардлагатай байж магадгүй.';

  @override
  String get adminNetworkingRemoteAccess => 'Алсын хандалтыг идэвхжүүлэх';

  @override
  String get adminNetworkingPorts => 'Портууд';

  @override
  String get adminNetworkingHttpPort => 'HTTP порт';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS порт';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS-г идэвхжүүлнэ үү';

  @override
  String get adminNetworkingLocalNetwork => 'Орон нутгийн сүлжээ';

  @override
  String get adminNetworkingLocalAddresses => 'Дотоод сүлжээний хаягууд';

  @override
  String get adminNetworkingAddressHint => 'жишээ нь 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Мэдэгдэж буй прокси';

  @override
  String get adminNetworkingProxyHint => 'жишээ нь 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Цагаан жагсаалт';

  @override
  String get adminNetworkingBlacklist => 'Хар жагсаалт';

  @override
  String get adminNetworkingAddEntry => 'Оруулга нэмэх';

  @override
  String get adminBrandingTitle => 'Брэнд хийх';

  @override
  String get adminBrandingLoginDisclaimer => 'Нэвтрэхээс татгалзах мэдэгдэл';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'Нэвтрэх маягтын доор HTML харагдана';

  @override
  String get adminBrandingCustomCss => 'Захиалгат CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Вэб интерфэйс дээр тусгай CSS ашигласан';

  @override
  String get adminBrandingEnableSplash => 'Нээлтийн дэлгэцийг идэвхжүүлэх';

  @override
  String get adminBrandingSplashUpload => 'Зураг байршуулах';

  @override
  String get adminBrandingSplashUploaded => 'Эхлэлийн дэлгэцийг шинэчиллээ';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Эхлэлийн дэлгэцийг байршуулж чадсангүй';

  @override
  String get adminBrandingSplashDeleted => 'Эхлэлийн дэлгэцийг устгалаа';

  @override
  String get adminBrandingNoSplash => 'Захиалгат эхлэлийн дэлгэц байхгүй';

  @override
  String get adminPlaybackHwAccel => 'Техник хангамжийн хурдатгал';

  @override
  String get adminPlaybackHwAccelLabel => 'Техник хангамжийн хурдатгал';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Техник хангамжийн кодчилолыг идэвхжүүлнэ үү';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Техник хангамжийн код тайлахыг идэвхжүүлэх:';

  @override
  String get adminPlaybackQsvDevice => 'QSV төхөөрөмж';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Сайжруулсан NVDEC задлагчийг идэвхжүүлэх';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Системийн уугуул техник задлагчийг эрхэмлэх';

  @override
  String get adminPlaybackColorDepth => 'Техник задлалтын өнгөний гүн';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-бит HEVC задлалт';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-бит VP9 задлалт';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-бит задлалт';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-бит задлалт';

  @override
  String get adminPlaybackHwEncodingSection => 'Техник кодчилол';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC кодчилолыг зөвшөөрөх';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1 кодчилолыг зөвшөөрөх';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel-ийн бага чадлын H.264 кодлогчийг идэвхжүүлэх';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel-ийн бага чадлын HEVC кодлогчийг идэвхжүүлэх';

  @override
  String get adminPlaybackToneMapping => 'Тон зураглал';

  @override
  String get adminPlaybackEnableTonemapping => 'Тон зураглалыг идэвхжүүлэх';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'VPP тон зураглалыг идэвхжүүлэх';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox тон зураглалыг идэвхжүүлэх';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Тон зураглалын алгоритм';

  @override
  String get adminPlaybackTonemappingMode => 'Тон зураглалын горим';

  @override
  String get adminPlaybackTonemappingRange => 'Тон зураглалын хүрээ';

  @override
  String get adminPlaybackTonemappingDesat => 'Тон зураглалын өнгө сулралт';

  @override
  String get adminPlaybackTonemappingPeak => 'Тон зураглалын оргил';

  @override
  String get adminPlaybackTonemappingParam => 'Тон зураглалын параметр';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP тон зураглалын гэрэлтэлт';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP тон зураглалын тодрол';

  @override
  String get adminPlaybackPresetsQuality => 'Урьдчилсан тохиргоо ба чанар';

  @override
  String get adminPlaybackEncoderPreset => 'Кодлогчийн урьдчилсан тохиргоо';

  @override
  String get adminPlaybackH264Crf => 'H.264 кодчилолын CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) кодчилолын CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Деинтерлэйс арга';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Деинтерлэйс хийхэд кадрын давтамжийг хоёр дахин нэмэгдүүлэх';

  @override
  String get adminPlaybackAudioSection => 'Аудио';

  @override
  String get adminPlaybackEnableAudioVbr => 'Аудио VBR кодчилолыг идэвхжүүлэх';

  @override
  String get adminPlaybackDownmixBoost => 'Аудио буулгалтын өсгөлт';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Стерео буулгалтын алгоритм';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Муксинг дарааллын дээд хэмжээ';

  @override
  String get adminPlaybackAutoOption => 'Авто';

  @override
  String get adminPlaybackEncoding => 'Кодлох';

  @override
  String get adminPlaybackEncodingThreads => 'Сэдвүүдийг кодлох';

  @override
  String get adminPlaybackFallbackFont => 'Нөөц фонтыг идэвхжүүлэх';

  @override
  String get adminPlaybackFallbackFontPath => 'Буцах үсгийн зам';

  @override
  String get adminPlaybackStreaming => 'Дамжуулж байна';

  @override
  String get adminResumeVideo => 'Видео';

  @override
  String get adminResumeAudiobooks => 'Аудио номууд';

  @override
  String get adminResumeMinAudiobookPct =>
      'Аудио номыг үргэлжлүүлэх хамгийн бага хувь';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Аудио номын үргэлжлүүлэлтийн дээд хувь';

  @override
  String get adminStreamingBitrateLimit =>
      'Алсын хэрэглэгчийн битийн хурдны хязгаар (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Хоосон эсвэл хязгааргүй бол 0 үлдээгээрэй';

  @override
  String get adminTrickplayHwAccel =>
      'Техник хангамжийн хурдатгалыг идэвхжүүлэх';

  @override
  String get adminTrickplayHwEncoding =>
      'Техник хангамжийн кодчилолыг идэвхжүүлнэ үү';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Зөвхөн түлхүүрийн хүрээг задлахыг идэвхжүүлнэ';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Илүү хурдан боловч нарийвчлал багатай';

  @override
  String get adminTrickplayNonBlocking => 'Блоклохгүй';

  @override
  String get adminTrickplayBlocking => 'Блоклох';

  @override
  String get adminTrickplayPriorityHigh => 'Өндөр';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Хэвийн хэмжээнээс дээш';

  @override
  String get adminTrickplayPriorityNormal => 'Ердийн';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Хэвийн доор';

  @override
  String get adminTrickplayPriorityIdle => 'Сул зогсолт';

  @override
  String get adminTrickplayImageSettings => 'Зургийн тохиргоо';

  @override
  String get adminTrickplayInterval => 'Интервал (мс)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Хүрээг хэр олон удаа авах вэ';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Таслалаар тусгаарласан пикселийн өргөн (жишээ нь 320)';

  @override
  String get adminTrickplayQuality => 'Чанартай';

  @override
  String get adminTrickplayQScale => 'Чанарын хэмжүүр';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Доод утга = илүү чанартай, том файлууд';

  @override
  String get adminTrickplayJpegQuality => 'JPEG чанар';

  @override
  String get adminTrickplayProcessing => 'Боловсруулж байна';

  @override
  String get adminTasksEmpty => 'Төлөвлөсөн ажил олдсонгүй';

  @override
  String get adminTasksNoFilterMatch =>
      'Одоогийн шүүлтүүртэй тохирох ажил алга';

  @override
  String get adminTaskCancelling => 'Цуцалж байна...';

  @override
  String get adminTaskRunning => 'Гүйж байна...';

  @override
  String get adminTaskNeverRun => 'Хэзээ ч гүйхгүй';

  @override
  String get adminTaskStop => 'Зогсоох';

  @override
  String get adminRunningTasks => 'Ажиллаж буй ажлууд';

  @override
  String get adminTaskRun => 'Гүй';

  @override
  String get adminTaskDetailLastExecution => 'Сүүлийн гүйцэтгэл';

  @override
  String get adminTaskDetailStarted => 'Эхэлсэн';

  @override
  String get adminTaskDetailEnded => 'Дууслаа';

  @override
  String get adminTaskDetailDuration => 'Үргэлжлэх хугацаа';

  @override
  String get adminTaskDetailErrorLabel => 'Алдаа:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Өдөр бүр $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return '$day бүр $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return '$duration бүр';
  }

  @override
  String get adminTaskTriggerStartup => 'Аппликешн эхлүүлэх үед';

  @override
  String get adminTaskTriggerTypeDaily => 'Өдөр бүр';

  @override
  String get adminTaskTriggerTypeWeekly => 'Долоо хоног бүр';

  @override
  String get adminTaskTriggerTypeInterval => 'Интервал дээр';

  @override
  String get adminTaskTriggerIntervalLabel => 'Интервал';

  @override
  String get adminTaskTriggerEveryHour => 'Цаг бүр';

  @override
  String get adminTaskTriggerEvery6Hours => '6 цаг тутамд';

  @override
  String get adminTaskTriggerEvery12Hours => '12 цаг тутамд';

  @override
  String get adminTaskTriggerEvery24Hours => '24 цаг тутамд';

  @override
  String get adminTaskTriggerEvery2Days => '2 өдөр тутамд';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count цаг',
      one: '1 цаг',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Цаг хугацаа';

  @override
  String get adminTaskTriggerNoLimit => 'Хязгааргүй';

  @override
  String get adminActivityJustNow => 'Яг одоо';

  @override
  String get adminActivityLastHour => 'Сүүлийн цаг';

  @override
  String get adminActivityToday => 'Өнөөдөр';

  @override
  String get adminActivityYesterday => 'Өчигдөр';

  @override
  String get adminActivityOlder => 'Хуучин';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d өмнө';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours цагийн өмнө';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes м өмнө';
  }

  @override
  String get adminActivityNow => 'одоо';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutesм';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hoursц';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$daysө';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$month/$day';
  }

  @override
  String get adminTrickplayDescription =>
      'Гүйлгэх урьдчилсан харагдацын зурагт зориулсан Trickplay зураг үүсгэлтийг тохируулна.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Нийтийн HTTPS порт';

  @override
  String get adminNetworkingBaseUrl => 'Үндсэн URL';

  @override
  String get adminNetworkingBaseUrlHint => 'жишээ нь /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Нийтийн HTTP порт';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS шаардах';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Алсын бүх хүсэлтийг HTTPS руу чиглүүлнэ. Серверт хүчинтэй гэрчилгээ байхгүй бол нөлөөгүй.';

  @override
  String get adminNetworkingCertPassword => 'Гэрчилгээний нууц үг';

  @override
  String get adminNetworkingIpSettings => 'IP тохиргоо';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4-ийг идэвхжүүлэх';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6-г идэвхжүүлэх';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Автомат порт зураглалыг идэвхжүүлэх';

  @override
  String get adminNetworkingLocalSubnets => 'LAN сүлжээ';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Дотоод сүлжээнд байна гэж үзэх IP хаяг эсвэл CIDR дэд сүлжээний жагсаалт, таслал эсвэл мөрөөр тусгаарлана.';

  @override
  String get adminNetworkingPublishedUris => 'Нийтэлсэн серверийн URI';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Дэд сүлжээ эсвэл хаягийг нийтэлсэн URL-д холбоно, жишээ нь all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Гэрчилгээний зам';

  @override
  String get adminNetworkingRemoteIpFilter => 'Алсын IP шүүлтүүр';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Алсын IP шүүлтүүр';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API төхөөрөмж';

  @override
  String get adminPlaybackAutomatic => '0 = автомат';

  @override
  String get adminPlaybackTranscodeTempPath => 'Түр зуурын замыг хөрвүүлэх';

  @override
  String get adminPlaybackSegmentDeletion => 'Сегмент устгахыг зөвшөөрөх';

  @override
  String get adminPlaybackSegmentKeep => 'Сегмент хадгалах (секунд)';

  @override
  String get adminPlaybackThrottleBuffering => 'Тохируулагч буфер';

  @override
  String get adminPlaybackThrottleDelay => 'Хязгаарлалтын саатал (секунд)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Хадмалыг шууд задлахыг зөвшөөрөх';

  @override
  String get adminResumeMinPct => 'Анкетийн хамгийн бага хувь';

  @override
  String get adminResumeMinPctSubtitle =>
      'Явцыг хадгалахын тулд контентыг энэ хувиас хэтрүүлсэн байх ёстой';

  @override
  String get adminResumeMaxPct => 'Анкетын хамгийн их хувь';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Энэ хувийн дараа контент бүрэн тоглосон гэж үзнэ';

  @override
  String get adminResumeMinDuration =>
      'Үргэлжлүүлэх хамгийн бага хугацаа (секунд)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Үүнээс богино зүйлсийг үргэлжлүүлэх боломжгүй';

  @override
  String get adminTrickplayScanBehavior => 'Зан төлөвийг сканнердах';

  @override
  String get adminTrickplayProcessPriority => 'Процессын тэргүүлэх чиглэл';

  @override
  String get adminTrickplayTileWidth => 'Хавтангийн өргөн';

  @override
  String get adminTrickplayTileHeight => 'Хавтангийн өндөр';

  @override
  String get adminTrickplayProcessThreads => 'Урсгалуудыг боловсруулах';

  @override
  String get adminTrickplayWidthResolutions => 'Өргөн нарийвчлалууд';

  @override
  String get adminMetadataDefault => 'Өгөгдмөл';

  @override
  String get adminMetadataContentTypeUpdated => 'Агуулгын төрлийг шинэчилсэн';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Агуулгын төрлийг шинэчилж чадсангүй: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Удаан хариу өгөх босго (мс)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Удаан хариултын сануулгыг идэвхжүүлэх';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect-ийг идэвхжүүлэх';

  @override
  String get adminGeneralSectionServer => 'Сервер';

  @override
  String get adminGeneralSectionMetadata => 'Мета өгөгдөл';

  @override
  String get adminGeneralSectionPaths => 'Замууд';

  @override
  String get adminGeneralSectionPerformance => 'Гүйцэтгэл';

  @override
  String get adminGeneralCachePath => 'Кэш зам';

  @override
  String get adminGeneralMetadataPath => 'Мета өгөгдлийн зам';

  @override
  String get adminGeneralServerName => 'Серверийн нэр';

  @override
  String get adminGeneralDisplayLanguage => 'Сонгосон харуулах хэл';

  @override
  String get adminSettingsLoadFailed => 'Тохиргоог ачаалж чадсангүй';

  @override
  String get adminDiscover => 'Танилцах';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Зураглалыг шинэчилж чадсангүй: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Цагийн хязгаар: $duration';
  }

  @override
  String get folders => 'Хавтас';

  @override
  String get libraries => 'Медиа сангууд';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay идэвхгүй';

  @override
  String get syncPlayDisabledMessage =>
      'Синхрон тоглуулахыг ашиглахын тулд Тохиргоо дотроос SyncPlay-г идэвхжүүлнэ үү.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Сервер дэмжигдээгүй';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay нь Jellyfin сервер шаарддаг. Одоогийн сервер үүнийг дэмждэггүй.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Групп';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay бүлэг';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# оролцогч',
      one: '# оролцогч',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Хүлээхийг үл тоомсорлох';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Энэ төхөөрөмжийг буферлэх үед бүлгийг бүү барь';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Удаан гишүүдийг хүлээхгүйгээр орон нутагтаа үргэлжлүүлээрэй';

  @override
  String get syncPlayRepeat => 'Давт';

  @override
  String get syncPlayRepeatOne => 'Нэг';

  @override
  String get syncPlayShuffleModeShuffled => 'Холимог';

  @override
  String get syncPlayShuffleModeSorted => 'Эрэмбэлэгдсэн';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Одоогийн тоглуулах дарааллыг синк хийх';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Бүлгийн дарааллыг орон нутагт тоглож байгаа зүйлээр солино уу';

  @override
  String get syncPlayLeaveGroup => 'Бүлгээс гарах';

  @override
  String get syncPlayGroupQueue => 'Бүлгийн дараалал';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Зүйл $index';
  }

  @override
  String get syncPlayPlayNow => 'Одоо тогло';

  @override
  String get syncPlayCreateNewGroup => 'Шинэ бүлэг үүсгэх';

  @override
  String get syncPlayGroupName => 'Бүлгийн нэр';

  @override
  String get syncPlayDefaultGroupName => 'Миний SyncPlay групп';

  @override
  String get syncPlayCreateGroup => 'Бүлэг үүсгэх';

  @override
  String get syncPlayAvailableGroups => 'Боломжтой бүлгүүд';

  @override
  String get syncPlayNoGroupsAvailable => 'Бүлэг байхгүй байна';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay группт нэгдэх үү?';

  @override
  String get syncPlayJoinGroupWarning =>
      'SyncPlay бүлэгт элсэх нь таны одоогийн тоглуулах дарааллыг сольж болзошгүй. Үргэлжлүүлэх үү?';

  @override
  String get syncPlayJoin => 'Нэгдэх';

  @override
  String get syncPlayStateIdle => 'Сул зогсолт';

  @override
  String get syncPlayStateWaiting => 'Хүлээж байна';

  @override
  String get syncPlayStatePaused => 'Түр зогсоосон';

  @override
  String get syncPlayStatePlaying => 'Тоглож байна';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay бүлэгт нэгдсэн';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName SyncPlay группээс гарсан';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay хандалтыг хориглосон';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Та энэ SyncPlay бүлгийн нэг буюу хэд хэдэн зүйлд хандах эрхгүй. Бүлэг эзэмшигчээс номын сангийн зөвшөөрлийг баталгаажуулахыг хүс эсвэл өөр дараалал сонгоно уу.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName руу тоглуулахыг синк хийж байна';
  }

  @override
  String get voiceSearchUnavailable => 'Дуут хайлт боломжгүй.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Шууд тоглуулах амжилтгүй боллоо';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Энэ Dolby Vision дамжуулалтыг шууд тоглуулж чадсангүй. Серверийн хөрвүүлэлтийг ашиглан дахин оролдох уу?';

  @override
  String get retryWithTranscode => 'Код хувиргаж дахин оролдоно уу';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Дэмжигдээгүй';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Энэ төхөөрөмж Dolby Vision контентыг шууд тайлах боломжгүй. HDR10 нөөцийг ашиглах эсвэл серверийн кодыг өөрчлөх хүсэлт гаргах.';

  @override
  String get rememberMyChoice => 'Миний сонголтыг санаарай';

  @override
  String get playHdr10Fallback => 'HDR10 нөөцөөр тогло';

  @override
  String get requestTranscode => 'Код хувиргах хүсэлт гаргах';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# эгнээ олдлоо',
      one: '# эгнээ олдлоо',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Бүгдийг харах';

  @override
  String get noItems => 'Ямар ч зүйл алга';

  @override
  String get switchUser => 'Хэрэглэгч солих';

  @override
  String get remoteControl => 'Алсын удирдлага';

  @override
  String get mediaBarLoading => 'Медиа мөрийг ачаалж байна...';

  @override
  String get mediaBarError => 'Медиа мөрийг ачаалж чадсангүй';

  @override
  String get offlineServerUnavailable =>
      'Интернэтэд холбогдсон боловч одоогийн сервер ажиллах боломжгүй байна.';

  @override
  String get offlineNoInternet =>
      'Та офлайн байна. Зөвхөн татаж авсан контент боломжтой.';

  @override
  String get offlineFileNotAvailable => 'Файл боломжгүй байна';

  @override
  String get offlineSwitchServer => 'Сервер солих';

  @override
  String get offlineSavedMedia => 'Хадгалсан медиа';

  @override
  String get offlineBannerTitle => 'Та офлайн байна';

  @override
  String get offlineBannerSubtitle => 'Таны татсан зүйлсийг харуулж байна';

  @override
  String get offlineBannerAction => 'Татсан зүйлс';

  @override
  String get serverUnreachableBannerTitle =>
      'Таны сервертэй холбогдож чадсангүй';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Сэргэх хүртэл татсан зүйлсээс тоглуулж байна';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Алсын тоглуулах';

  @override
  String castControlFailed(String error) {
    return 'Дамжуулах хяналт амжилтгүй боллоо: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Удирдлага';
  }

  @override
  String get castDeviceVolume => 'Төхөөрөмжийн эзлэхүүн';

  @override
  String get castVolumeUnavailable => 'Боломжгүй';

  @override
  String castStopKind(String kind) {
    return 'Зогс $kind';
  }

  @override
  String get audioLabel => 'Аудио';

  @override
  String get subtitlesLabel => 'Хадмал орчуулга';

  @override
  String get pinConfirmTitle => 'ПИН кодоо баталгаажуулна уу';

  @override
  String get pinSetTitle => 'ПИН кодоо тохируулна уу';

  @override
  String get pinEnterTitle => 'ПИН кодоо оруулна уу';

  @override
  String get pinReenterToConfirm =>
      'Баталгаажуулахын тулд PIN кодоо дахин оруулна уу';

  @override
  String pinEnterNDigit(int length) {
    return '$length оронтой ПИН оруулна уу';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return '$length оронтой ПИН кодоо оруулна уу';
  }

  @override
  String get pinIncorrect => 'ПИН код буруу';

  @override
  String get pinMismatch => 'ПИН код таарахгүй байна';

  @override
  String get pinForgot => 'ПИН кодоо мартсан уу?';

  @override
  String get pinClear => 'Цэвэрлэх';

  @override
  String get pinBackspace => 'Устгах';

  @override
  String get quickConnectAuthorized => 'Quick Connect хүсэлтийг зөвшөөрлөө.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect код буруу эсвэл хугацаа нь дууссан байна.';

  @override
  String get quickConnectNotSupported =>
      'Энэ сервер дээр Quick Connect дэмжигдэхгүй.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect кодыг зөвшөөрч чадсангүй.';

  @override
  String get quickConnectDisabled =>
      'Энэ сервер дээр Quick Connect идэвхгүй байна.';

  @override
  String get quickConnectForbidden =>
      'Таны бүртгэл энэ Quick Connect хүсэлтийг зөвшөөрөх боломжгүй.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect код олдсонгүй. Шинэ код оролдоно уу.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect амжилтгүй боллоо: $message';
  }

  @override
  String get quickConnectEnterCode => 'Код оруулна уу';

  @override
  String get quickConnectAuthorize => 'Зөвшөөрөх';

  @override
  String remoteCommandFailed(String error) {
    return 'Тушаал амжилтгүй боллоо: $error';
  }

  @override
  String get remoteControlTitle => 'Алсын удирдлага';

  @override
  String get remoteFailedToLoadSessions => 'Сешнүүдийг ачаалж чадсангүй';

  @override
  String get remoteNoSessions => 'Хянах боломжтой сесс байхгүй';

  @override
  String get remoteStartPlayback => 'Өөр төхөөрөмж дээр тоглуулж эхэлнэ үү';

  @override
  String get unknownUser => 'Тодорхойгүй';

  @override
  String get unknownItem => 'Тодорхойгүй';

  @override
  String get remoteNothingPlaying => 'Энэ сесс дээр юу ч тоглоогүй';

  @override
  String get castingStarted => 'Сонгосон төхөөрөмж дээр дамжуулж эхэлсэн';

  @override
  String castingFailed(String error) {
    return 'Дамжуулахыг эхлүүлж чадсангүй: $error';
  }

  @override
  String get noRemoteDevices => 'Алсын тоглуулах төхөөрөмж байхгүй.';

  @override
  String get noRemoteDevicesIos =>
      'Алсын тоглуулах төхөөрөмж байхгүй.\n\niOS дээр AirPlay зорилтууд симулятор дээр боломжгүй байж магадгүй.';

  @override
  String get trackActionPlayNext => 'Дараа нь тоглуул';

  @override
  String get trackActionAddToQueue => 'Дараалалд нэмэх';

  @override
  String get trackActionAddToPlaylist => 'Тоглуулах жагсаалтад нэмэх';

  @override
  String get trackActionCancelDownload => 'Татаж авахыг цуцлах';

  @override
  String get trackActionDeleteFromPlaylist => 'Тоглуулах жагсаалтаас устгах';

  @override
  String get trackActionMoveUp => 'Дээш хөдөл';

  @override
  String get trackActionMoveDown => 'Доош хөдөлнө';

  @override
  String get trackActionRemoveFromFavorites => 'Дуртай хэсгээс устгана уу';

  @override
  String get trackActionAddToFavorites => 'Дуртай зүйлд нэмнэ үү';

  @override
  String get trackActionGoToAlbum => 'Цомог руу оч';

  @override
  String get trackActionGoToArtist => 'Зураач руу оч';

  @override
  String trackActionDownloading(String name) {
    return 'Татаж авч байна $name...';
  }

  @override
  String get trackActionDeletedFile => 'Татаж авсан файлыг устгасан';

  @override
  String get trackActionDeleteFileFailed =>
      'Татаж авсан файлыг устгаж чадсангүй';

  @override
  String get shuffleBy => 'Холимог';

  @override
  String get shuffleSelectLibrary => 'Номын санг сонгоно уу';

  @override
  String get shuffleSelectGenre => 'Төрөл зүйл сонгоно уу';

  @override
  String get shuffleLibrary => 'Медиа сан';

  @override
  String get shuffleGenre => 'Төрөл';

  @override
  String get shuffleNoLibraries => 'Тохиромжтой номын сан байхгүй.';

  @override
  String get shuffleNoGenres => 'Энэ холих горимд төрөл олдсонгүй.';

  @override
  String get posterDisplayTitle => 'Дэлгэц';

  @override
  String get posterImageType => 'Зургийн төрөл';

  @override
  String get imageTypePoster => 'Зурагт хуудас';

  @override
  String get imageTypeThumbnail => 'Өнгөц зураг';

  @override
  String get imageTypeBanner => 'Баннер';

  @override
  String get playlistAddFailed => 'Тоглуулах жагсаалтад нэмж чадсангүй';

  @override
  String get playlistCreateFailed => 'Тоглуулах жагсаалт үүсгэж чадсангүй';

  @override
  String get playlistNew => 'Шинэ тоглуулах жагсаалт';

  @override
  String get playlistCreate => 'Үүсгэх';

  @override
  String get playlistCreateNew => 'Шинэ тоглуулах жагсаалт үүсгэх';

  @override
  String get playlistNoneFound => 'Тоглуулах жагсаалт олдсонгүй';

  @override
  String get addToPlaylist => 'Тоглуулах жагсаалтад нэмэх';

  @override
  String get lyricsNotAvailable => 'Дууны үг байхгүй';

  @override
  String get upNext => 'Дараа нь';

  @override
  String get playNext => 'Дараа нь тоглуул';

  @override
  String get stillWatchingContent =>
      'Тоглуулахыг түр зогсоосон. Та үзэж байгаа хэвээр байна уу?';

  @override
  String get stillWatchingStop => 'Зогсоох';

  @override
  String get stillWatchingContinue => 'Үргэлжлүүлэх';

  @override
  String skipSegment(String segment) {
    return 'Алгасах $segment';
  }

  @override
  String get liveTv => 'Шууд ТВ';

  @override
  String get continueWatchingAndNextUp => 'Үргэлжлүүлэн үзэх ба дараа нь';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Татаж авч байна $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Татаж авч байна $fileName';
  }

  @override
  String get nextEpisode => 'Дараагийн анги';

  @override
  String get moreFromThisSeason => 'Энэ улирлын дэлгэрэнгүй';

  @override
  String get playerTooltipPlaybackSpeed => 'Тоглуулах хурд';

  @override
  String get playerTooltipCastControls => 'Дамжуулах удирдлага';

  @override
  String get playerTooltipPlaybackQuality => 'Битийн хурд';

  @override
  String get playerTooltipEnterFullscreen => 'Бүтэн дэлгэцээр оруулна уу';

  @override
  String get playerTooltipExitFullscreen => 'Бүтэн дэлгэцээс гарах';

  @override
  String get playerTooltipFloatOnTop => 'Дээрээс нь хөвөх';

  @override
  String get playerTooltipExitFloatOnTop => 'Дээр нь хөвөхийг идэвхгүй болгох';

  @override
  String get playerTooltipLockLandscape => 'Ландшафтыг түгжих';

  @override
  String get playerTooltipUnlockOrientation => 'Эргүүлэхийг зөвшөөрөх';

  @override
  String get playerTooltipPrevious => 'Өмнөх';

  @override
  String get playerTooltipSeekBack => 'Эргэж хайх';

  @override
  String get playerTooltipSeekForward => 'Урагшаа хайх';

  @override
  String get contextMenuMarkWatched => 'Үзсэн гэж тэмдэглэ';

  @override
  String get contextMenuMarkUnwatched => 'Үзээгүй гэж тэмдэглэ';

  @override
  String get contextMenuAddToFavorites => 'Дуртай зүйлд нэмнэ үү';

  @override
  String get contextMenuRemoveFromFavorites => 'Дуртай хэсгээс устгана уу';

  @override
  String get contextMenuGoToSeries => 'Цуврал руу оч';

  @override
  String get contextMenuHideFromContinueWatching => 'Үргэлжлүүлэн үзэхээс нуух';

  @override
  String get contextMenuHideFromNextUp => 'Дараагийн хэсгээс нуух';

  @override
  String get contextMenuAddToCollection => 'Цуглуулгад нэмэх';

  @override
  String get settingsAdministrationSubtitle =>
      'Серверийн удирдлагын самбарт хандах';

  @override
  String get settingsAccountSecurity => 'Бүртгэл ба аюулгүй байдал';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Баталгаажуулалт, ПИН код, эцэг эхийн хяналт';

  @override
  String get settingsPersonalization => 'Хувийн тохиргоо';

  @override
  String get settingsPersonalizationSubtitle =>
      'Сэдэв, навигаци, гэрийн эгнээ, номын сангийн харагдац';

  @override
  String get settingsDynamicContent => 'Динамик контент';

  @override
  String get settingsDynamicContentSubtitle => 'Медиа мөр ба визуал давхаргууд';

  @override
  String get settingsPlaybackSyncplay => 'Тоглуулах & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Аудио/видео тохиргоо, хадмал орчуулга, таталт, SyncPlay хяналт';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin sync, Seerr, үнэлгээ гэх мэт';

  @override
  String get settingsAboutSubtitle =>
      'Апп хувилбар, хууль эрх зүйн мэдээлэл, кредит';

  @override
  String get settingsAuthenticationSection => 'БАТАЛГАА';

  @override
  String get settingsSortServersBy => 'Серверүүдийг ангилах';

  @override
  String get settingsLastUsed => 'Сүүлд ашигласан';

  @override
  String get settingsAlphabetical => 'Цагаан толгойн дарааллаар';

  @override
  String get settingsConnectionSection => 'ХОЛБОЛТ';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Өөрөө гарын үсэг зурсан гэрчилгээг зөвшөөрөх';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Өөрөө гарын үсэг зурсан эсвэл хувийн CA-ийн TLS гэрчилгээ хэрэглэдэг серверт итгэнэ. Зөвхөн өөрийн хянадаг серверт идэвхжүүлнэ үү. Энэ нь бүх холболтын гэрчилгээний шалгалтыг унтраана.';

  @override
  String get settingsPrivacyAndSafetySection => 'НУУЦЛАЛ & АЮУЛГҮЙ БАЙДАЛ';

  @override
  String get settingsBlockedRatings => 'Блоклогдсон үнэлгээ';

  @override
  String get settingsGeneralStyle => 'Ерөнхий хэв маяг';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Сэдвийн өргөлт, арын дэвсгэр, үзсэн үзүүлэлт, сэдэвт хөгжим';

  @override
  String get settingsDetailsScreen => 'Дэлгэрэнгүй дэлгэц';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Хэв маяг, дэвсгэрийн бүдгэрэлт, табын үйлдэл';

  @override
  String get settingsHomePage => 'Нүүр хуудас';

  @override
  String get settingsHomePageSubtitle =>
      'Хэсэгүүд, зургийн төрөл, давхардал, медиа урьдчилан үзэх';

  @override
  String get settingsLibrariesSubtitle =>
      'Номын сангийн харагдах байдал, хавтас харах, олон серверийн үйлдэл';

  @override
  String get settingsTwentyFourHourClock => '24 цагийн цаг';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Цаг харагдаж байгаа газар бүрт 24 цагийн форматыг ашиглана уу';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Навигацийн талбарт холих товчлуурыг харуул';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Навигацийн талбарт жанрын товчлуурыг харуул';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Навигацийн талбарт дуртай товчлууруудыг харуул';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Навигацийн талбар дахь номын сангийн товчийг харуул';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Навигацийн самбарт Seerr товчийг харуулах';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Дээд навигацийн самбарт текст шошгыг үргэлж харуулах';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Номын сан бүрийн нүүр хуудасны харагдах байдлыг асаах/унтраах. Өөрчлөлтүүд хүчин төгөлдөр болохын тулд Moonfin-г дахин эхлүүлнэ үү.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Медиа талбар ба орон нутгийн урьдчилан үзэх';

  @override
  String get settingsVisualOverlays => 'Визуал давхаргууд';

  @override
  String get settingsSeasonalSurprise => 'Улирлын гэнэтийн бэлэг';

  @override
  String get settingsMetadataAndRatings => 'Мета өгөгдөл ба үнэлгээ';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase нь нэмэлт үнэлгээний эх сурвалж, Seerr хүсэлт, синхрончлогдсон тохиргоо зэрэг сервер талын интеграцчлалыг идэвхжүүлдэг.';

  @override
  String get settingsOfflineDownloads => 'Офлайн татаж авах';

  @override
  String get settingsHigh => 'Өндөр';

  @override
  String get settingsLow => 'Бага';

  @override
  String get settingsCustomPath => 'Захиалгат зам';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Татаж авах фолдерын замыг оруулна уу';

  @override
  String get settingsConcurrentDownloads => 'Нэгэн зэрэг татаж авах';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Нэг удаад татаж авах хамгийн дээд тоо.';

  @override
  String get settingsAppInfo => 'АПП-ЫН МЭДЭЭ';

  @override
  String get settingsReportAnIssue => 'Асуудлыг мэдээлэх';

  @override
  String get settingsReportAnIssueSubtitle =>
      'GitHub дээр асуудал хянагчийг нээнэ үү.';

  @override
  String get settingsJoinDiscord => 'Discord-д нэгдээрэй';

  @override
  String get settingsJoinDiscordSubtitle => 'Нийгэмлэгтэй чатлах';

  @override
  String get settingsJoinTheDiscord => 'Discord-д нэгдээрэй';

  @override
  String get settingsSupportMoonfin => 'Дэмжлэг Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Хөгжүүлэгчид кофе хандивлах';

  @override
  String get settingsLegal => 'ХУУЛЬ ЗҮЙН';

  @override
  String get settingsLicenses => 'Лицензүүд';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Нээлттэй эхийн лицензийн мэдэгдэл';

  @override
  String get settingsPrivacyPolicy => 'Нууцлалын бодлого';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin таны өгөгдлийг хэрхэн зохицуулдаг вэ';

  @override
  String get settingsCheckForUpdates => 'Шинэчлэлтүүдийг шалгана уу';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Хамгийн сүүлийн үеийн Moonfin хувилбарыг шалгана уу';

  @override
  String get settingsPoweredByFlutter => 'Flutter-ээр дэмжигдсэн';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# лицензийн мэдэгдэл',
      one: '# лицензийн мэдэгдэл',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Хоёулаа';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Агуулгын төрлийн шүүлтүүрийг холих';

  @override
  String get settingsVideoPlaybackPreferences => 'Видео тоглуулах тохиргоо';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Үндсэн видео хөдөлгүүр ба урсгалын чанарын тохиргоо';

  @override
  String get settingsAudioPreferences => 'Аудио тохиргоо';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Аудио бичлэг, боловсруулалт, дамжуулалтын сонголтууд';

  @override
  String get settingsAutomationAndQueue => 'Автоматжуулалт ба дараалал';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Автоматаар тоглуулах, дараалал тогтоох';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Татаж авах чанар, хадгалах сангийн хязгаар, дарааллын хэмжээ';

  @override
  String get settingsSyncplaySubtitle =>
      'Бүлгийн хуралдааны синхрончлолын логик';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Тоглогчдын тусгай онцлог. Зарим сонголтууд тоглуулах асуудал үүсгэж болзошгүй тул болгоомжтой хэрэглээрэй';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Танилцуулга болон гадуурх хэсгийг алгасах уу?';

  @override
  String get settingsMediaSegmentCountdown => 'Медиа сегментийн тоолол';

  @override
  String get settingsProgressBar => 'Явцын мөр';

  @override
  String get settingsTimer => 'Таймер';

  @override
  String get settingsNone => 'Байхгүй';

  @override
  String get settingsPromptUser => 'Шуурхай хэрэглэгч';

  @override
  String get settingsSkip => 'Алгасах';

  @override
  String get settingsDoNothing => 'Юу ч хийхгүй';

  @override
  String get settingsMaxBitrateDescription =>
      'Дамжуулалтын хурдыг хязгаарлах. Энэ босгоос дээш агуулгыг тааруулахын тулд кодчилно.';

  @override
  String get settingsMaxResolutionDescription =>
      'Тоглогчийн хүсэх хамгийн дээд нарийвчлалыг хязгаарлаарай. Илүү өндөр нягтралтай контентыг хөрвүүлэх болно.';

  @override
  String get settingsPlayerZoomDescription =>
      'Дэлгэцэнд тохируулахын тулд видеог хэрхэн томруулах ёстой.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Тоглуулах систем (Андройд ТВ)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV төхөөрөмж дээр тоглуулах өгөгдмөл системийг сонгоно уу. Өөрчлөлтүүд дараагийн тоглуулах сессэд хамаарна.';

  @override
  String get settingsPlaybackEngineMedia3Recommended =>
      'Media3 (санал болгосон)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (хуучин)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (хуучин)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (санал болгосон)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Буцах';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision кодыг тайлахгүй төхөөрөмжүүд дээрх Dolby Vision гарчигийн үйлдэл.';

  @override
  String get settingsAskEachTime => 'Тэр болгонд нь асуу';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 нөөцийг илүүд үзнэ үү';

  @override
  String get settingsPreferServerTranscode => 'Серверийн кодыг илүүд үзнэ үү';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Профайл 7 Шууд тоглох';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision профайл 7 сайжруулалтын давхаргын дамжуулалтыг шууд тоглуулах эсэхийг хянадаг.';

  @override
  String get settingsAutoAftkrtEnabled => 'Автомат (AFTKRT идэвхжүүлсэн)';

  @override
  String get settingsEnabledOnThisDevice => 'Энэ төхөөрөмж дээр идэвхжүүлсэн';

  @override
  String get settingsDisabledPreferTranscode =>
      'Идэвхгүй (хөрчлөлтийг илүүд үзнэ)';

  @override
  String get settingsResumeRewindDescription =>
      'Дахин тоглуулахдаа (Үргэлжлүүлэн үзэх эсвэл медиа зүйлийн хуудаснаас) хэдэн секундын хугацааг дахин эргүүлэх ёстой вэ?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Түр зогсоох товчийг дарсны дараа дахин дахин тоглуулахдаа хэдэн секундын турш эргүүлэх ёстой вэ?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Буцах товчийг дарсны дараа хэдэн секунд ухрах вэ.';

  @override
  String get settingsOneSecond => '1 секунд';

  @override
  String get settingsThreeSeconds => '3 секунд';

  @override
  String get settingsFortyFiveSeconds => '45 секунд';

  @override
  String get settingsSixtySeconds => '60 секунд';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Хурдан урагшлах товчийг дарсны дараа хэдэн секунд урагшлах вэ.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'AC3 битийн урсгалыг гадаад декодер руу шилжүүлнэ';

  @override
  String get settingsCinemaMode => 'Кино горим';

  @override
  String get settingsCinemaModeSubtitle =>
      'Үндсэн функцээс өмнө трейлер/урьдчилсан үзүүлбэрүүдийг тоглуул';

  @override
  String get settingsNextUpDisplayDescription =>
      'Өргөтгөсөн нь ангийн уран зураг, тайлбар бүхий бүтэн картыг харуулж байна. Хамгийн бага нь нягт тооллогын давхаргыг харуулдаг. Идэвхгүй болгосон нь сануулгыг бүхэлд нь нуудаг.';

  @override
  String get settingsShort => 'Богино';

  @override
  String get settingsLong => 'Урт';

  @override
  String get settingsVeryLong => 'Маш урт';

  @override
  String get settingsVideoStartDelay => 'Видео эхлэх саатал';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value мс';
  }

  @override
  String get settingsLiveTvDirect => 'Шууд ТВ';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Шууд ТВ-д шууд тоглуулахыг идэвхжүүлнэ үү';

  @override
  String get settingsOpenGroups => 'Бүлгүүдийг нээх';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay групп үүсгэх, нэгдэх эсвэл удирдах';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Идэвхжүүлсэн';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Бүлэг үзэх онцлогуудыг идэвхжүүлнэ';

  @override
  String get settingsSyncplayButton => 'SyncPlay Товчлуур';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Навигацийн талбар дээрх SyncPlay товчийг харуул';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Нарийвчилсан залруулга';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Нарийн синхрончлолын логикийг идэвхжүүл';

  @override
  String get settingsSyncplaySyncCorrection => 'Синхрончлолын залруулга';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Синхрончлолд үлдэхийн тулд тоглуулахыг автоматаар тохируулна уу';

  @override
  String get settingsSyncplaySpeedToSync => 'Синк хийх хурд';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Синхрончлохын тулд тоглуулах хурдны тохируулгыг ашиглана уу';

  @override
  String get settingsSyncplaySkipToSync => 'Синк рүү алгасах';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Синк хийхдээ хайлтыг ашиглана уу';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Хамгийн бага хурдны саатал';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Хамгийн их хурдны саатал';

  @override
  String get settingsSyncplaySpeedDuration => 'Хурдны үргэлжлэх хугацаа';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Алгасах хамгийн бага саатал';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Нэмэлт офсет';

  @override
  String get onNow => 'Одоо дээр';

  @override
  String get collections => 'Цуглуулга';

  @override
  String get lastPlayed => 'Хамгийн сүүлд тоглосон';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Хамгийн сүүлийн үеийн $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Саяхан гарсан $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Дараагийн ангийг автоматаар тоглуулах';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Боломжтой үед дараагийн ангийг автоматаар тоглуулаарай.';

  @override
  String get skipSilenceTitle => 'Чимээгүй алгасах';

  @override
  String get skipSilenceSubtitle =>
      'Дамжуулалт дэмжигдсэн үед чимээгүй аудио сегментүүдийг автоматаар алгасах.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Гадаад аудио эффектийг зөвшөөрөх';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Media3 тоглуулах сешнүүдэд эквалайзер болон эффектийн програмуудыг (жишээ нь Wavelet) хавсаргахыг зөвшөөрнө үү.';

  @override
  String get disableTunnelingTitle => 'Туннелийг идэвхгүй болгох';

  @override
  String get disableTunnelingSubtitle =>
      'Хонгилгүй тоглуулахыг албадах. Аудио/видео тасалдалтай төхөөрөмжүүдэд хэрэгтэй.';

  @override
  String get enableTunnelingTitle => 'Туннелийг идэвхжүүлэх';

  @override
  String get enableTunnelingSubtitle =>
      'Дэвшилтэт. Аудио, видеог хосолсон техник хангамжийн замаар дамжуулна. Зарим төхөөрөмж дээр аудио/видео тасалдал үүсгэдэг тул үндсэндээ унтраалттай.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision профайлыг 7-г HEVC рүү буулгана уу';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision профайлыг DV бус төхөөрөмж дээр HDR10 нийцтэй HEVC хэлбэрээр тоглуулаарай.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Суулгасан хадмал орчуулгын хэв маягийг ашиглана уу';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Хадмал орчуулгад суулгасан өнгө, фонт, байршлыг ашиглана уу. Оронд нь тайлбарын хэв маягийн тохиргоог ашиглахыг идэвхгүй болго.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Оруулсан хадмал үсгийн хэмжээг ашиглана уу';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Хадмал орчуулгад суулгасан үсгийн хэмжээтэй зөвлөмжийг ашиглана уу. Загварын сонголтоос хадмал орчуулгын хэмжээг ашиглахыг идэвхгүй болго.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Медиагийн дэлгэрэнгүйг харуулах';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Сангийн хуудасны дээд хэсэгт сонгосон зүйлийн дэлгэрэнгүйг харуулна.';

  @override
  String get hideBackdropsInLibraries => 'Үзэж байхад дэвсгэр зургийг нуух уу?';

  @override
  String get useDetailedSubHeadings => 'Нарийвчилсан дэд гарчгийг ашиглана уу';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Номын сангийн хуудсан дээр нарийвчилсан эсвэл хамгийн бага дэд мөрийг харуулах.';

  @override
  String get savedThemesDeleteDialogTitle => 'Хадгалсан загварыг устгах уу?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Энэ төхөөрөмжийн кэшээс \"$themeName\"-г устгах уу?';
  }

  @override
  String get themeStore => 'Загварын дэлгүүр';

  @override
  String get themeStoreSubtitle => 'Нийгэмлэгийн загваруудыг үзэж хадгална';

  @override
  String get themeStoreDescription =>
      'Загварыг хадгалснаар бусад хадгалсан загварынхаа адил ашиглана.';

  @override
  String get themeStoreEmpty => 'Одоогоор боломжтой загвар байхгүй байна.';

  @override
  String get themeStoreLoadFailed =>
      'Загварын дэлгүүрийг ачаалж чадсангүй. Холболтоо шалгаад дахин оролдоно уу.';

  @override
  String get themeStoreSave => 'Хадгалах';

  @override
  String get themeStoreSaveAndApply => 'Хадгалж хэрэглэх';

  @override
  String get themeStoreSaved => 'Хадгалсан';

  @override
  String get themeStoreInvalidMessage => 'Энэ загварыг ачаалж чадсангүй.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\"-ийг хадгаллаа.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Энэ төхөөрөмжөөс \"$themeName\"-г устгасан.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\"-г устгаж чадсангүй.';
  }

  @override
  String get savedThemesTitle => 'Хадгалсан загварууд';

  @override
  String get savedThemesDescription =>
      'Эдгээр нь одоогийн серверийн Moonfin залгаасаас татаж авсан загварууд юм. Устгаснаар зөвхөн энэ дотоод хуулбарыг устгана.';

  @override
  String get savedThemesEmpty => 'Энэ серверт хадгалсан загвар олдсонгүй.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Одоогоор идэвхтэй байна';
  }

  @override
  String get savedThemesDeleteTooltip => 'Хадгалсан загварыг устгах';

  @override
  String get savedThemesManageSubtitle =>
      'Татаж авсан залгаасын загваруудыг энэ төхөөрөмж дээр удирдаарай';

  @override
  String get themeEditor => 'Сэдвийн редактор';

  @override
  String get themeEditorSubtitle =>
      'Хөтөч дээрээ Moonfin загвар засварлагчийг нээнэ үү';

  @override
  String get homeScreen => 'Үндсэн дэлгэц';

  @override
  String get bottomBar => 'Доод баар';

  @override
  String get homeRowsStyleClassic => 'Сонгодог';

  @override
  String get homeRowsStyleModern => 'Орчин үеийн';

  @override
  String get homeRowsSection => 'Нүүр хуудас';

  @override
  String get homeRowDisplay => 'Нүүр эгнээний харагдац';

  @override
  String get homeRowSections => 'Нүүр эгнээний хэсгүүд';

  @override
  String get homeRowToggles => 'Нүүр эгнээний унтраалга';

  @override
  String get homeRowTogglesSubtitle =>
      'Сан дээр суурилсан нүүр эгнээний ангиллыг идэвхжүүлэх эсвэл унтраах';

  @override
  String get homeRowTogglesDescription =>
      'Нүүр хэсгүүдэд эгнээг харуулахын тулд дараах унтраалгыг идэвхжүүлнэ үү.';

  @override
  String get rowsType => 'Мөрийн төрөл';

  @override
  String get rowsTypeDescription =>
      'Сонгодог нь мөр бүрийн зургийн төрөл болон мэдээллийн давхаргыг хадгалдаг. Орчин үеийн загвар нь хөрөгөөс дэвсгэр рүү чиглэсэн мөрүүдийг ашигладаг.';

  @override
  String get displayFavoritesRows => 'Дуртай мөрүүдийг харуулах';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Нүүр хуудас хэсэгт дуртай кино, цуврал болон бусад дуртай мөрүүдийг харуул.';

  @override
  String get favoritesRowSorting => 'Дуртай мөр эрэмбэлэх';

  @override
  String get favoritesRowSortingDescription =>
      'Дуртай мөрүүдийг нэмсэн огноо, гарсан огноо, цагаан толгойн үсгийн дарааллаар эрэмбэлэх.';

  @override
  String get displayCollectionsRows => 'Цуглуулгын мөрүүдийг харуулах';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Нүүр хуудасны цуглуулгын мөрүүдийг харуулах.';

  @override
  String get collectionsRowSorting => 'Цуглуулгын мөр эрэмбэлэх';

  @override
  String get collectionsRowSortingDescription =>
      'Цуглуулгын мөрүүдийг нэмсэн огноо, гарсан огноо, цагаан толгойн үсгийн дарааллаар эрэмбэлэх.';

  @override
  String get displayGenresRows => 'Төрөл бүрийн мөрүүдийг харуулах';

  @override
  String get displayGenresRowsSubtitle =>
      'Нүүр хуудас хэсэгт Төрөл бүрийн мөрүүдийг харуулах.';

  @override
  String get genresRowSorting => 'Төрөлүүдийн эгнээ эрэмбэлэх';

  @override
  String get genresRowSortingDescription =>
      'Төрөл бүрийн мөрүүдийг нэмсэн огноо, гарсан огноо, цагаан толгойн үсгийн дарааллаар болон бусад зүйлээр эрэмбэлэх.';

  @override
  String get genresRowItems => 'Төрөл мөрийн зүйлүүд';

  @override
  String get genresRowItemsDescription =>
      'Төрөл бүрийн мөрөнд Кино, Цуврал эсвэл хоёуланг нь харуул.';

  @override
  String get displayPlaylistsRows => 'Тоглуулах жагсаалтын эгнээг харуулах';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Нүүр хэсгүүдэд тоглуулах жагсаалтын эгнээг харуулна.';

  @override
  String get playlistsRowSorting => 'Тоглуулах жагсаалтын эгнээний эрэмбэ';

  @override
  String get playlistsRowSortingDescription =>
      'Тоглуулах жагсаалтын эгнээг нэмсэн огноо, гарсан огноо, цагаан толгойн дараалал болон бусад байдлаар эрэмбэлнэ.';

  @override
  String get displayAudioRows => 'Аудио эгнээг харуулах';

  @override
  String get displayAudioRowsSubtitle =>
      'Нүүр хэсгүүдэд аудио эгнээг харуулна.';

  @override
  String get audioRowsSorting => 'Аудио эгнээний эрэмбэ';

  @override
  String get audioRowsSortingDescription =>
      'Аудио эгнээг нэмсэн огноо, гарсан огноо, цагаан толгойн дараалал болон бусад байдлаар эрэмбэлнэ.';

  @override
  String get audioPlaylists => 'Аудио тоглуулах жагсаалт';

  @override
  String get appearance => 'Харагдах байдал';

  @override
  String get layout => 'Байрлал';

  @override
  String get theme => 'Загвар';

  @override
  String get keyboard => 'Гар';

  @override
  String get navButtons => 'Товчнууд';

  @override
  String get rendering => 'Дүрслэл';

  @override
  String get mpvConfiguration => 'MPV тохиргоо';

  @override
  String get cardSize => 'Картын хэмжээ';

  @override
  String get externalPlayerApp => 'Гадаад тоглуулагчийн програм';

  @override
  String get externalPlayerAppDescription =>
      'Удаан дарж тоглуулах сонголтыг идэвхжүүлэхийн тулд гадаад тоглуулагч тохируулна уу';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Дахин тоглуулах үед програм сонгогчийг харуул.';

  @override
  String get loadingInstalledPlayers =>
      'Суулгасан тоглуулагчдыг ачаалж байна...';

  @override
  String get connection => 'Холболт';

  @override
  String get audioTranscodeTarget => 'Аудио хувиргах зорилт';

  @override
  String get passthrough => 'Дамжуулах';

  @override
  String get supportedOnThisDevice => 'Энэ төхөөрөмж дээр дэмжигдсэн';

  @override
  String get notSupportedOnThisDevice => 'Энэ төхөөрөмж дээр дэмжигдээгүй';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) Дамжуулах';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Битийн урсгалыг DTS:X (DTS UHD) гадаад декодер руу хийнэ.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Атмос (JOC) дамжуулагчтай TrueHD';

  @override
  String get mediaPlayerBehavior => 'Медиа тоглуулагчийн зан байдал';

  @override
  String get playbackEnhancements => 'Тоглуулах сайжруулалт';

  @override
  String get alwaysOn => 'Үргэлж асаалттай.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Skip Outro-г дараагийн дэлгэцээр солино уу';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Skip Outro товчлуурын оронд Next Up давхаргыг харуул.';

  @override
  String get playerRouting => 'Тоглогчийн чиглүүлэлт';

  @override
  String get preferSoftwareDecoders =>
      'Програм хангамжийн декодеруудыг илүүд үздэг';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Техник хангамжийн декодчилогчийн өмнө FFmpeg (аудио) болон libgav1 (AV1) ашиглана уу. HDMI аудио дамжуулалт тасарсан тохиолдолд идэвхгүй болгох.';

  @override
  String get useExternalPlayer => 'Гадаад тоглуулагч ашиглах';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV дээрх сонгосон гадаад програмдаа видео тоглуулахыг нээ.';

  @override
  String get automaticQueuing => 'Автомат дараалал';

  @override
  String get preferSdhSubtitles => 'SDH хадмал орчуулгыг илүүд үзнэ үү';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Автоматаар сонгохдоо SDH/CC хадмал орчуулгыг эрэмбэлэх.';

  @override
  String get webDiagnostics => 'Вэб оношлогоо';

  @override
  String get webDiagnosticsTitle => 'Moonfin Вэб оношилгоо';

  @override
  String get webDiagnosticsIntro =>
      'Энэ хуудсыг хөтчийн холболтын асуудлыг оношлоход ашиглана уу (CORS, холимог контент болон нээлтийн тохиргоо).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Холимог агуулгын алдаа илэрсэн';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Илэрсэн CORS/Нислэгийн өмнөх алдаа';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin HTTP серверийн URL руу залгахыг оролдож буй HTTPS хуудсыг илрүүллээ. Хөтөчүүд энэ хүсэлтийг таны серверт хүрэхээс өмнө блоклодог.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin хөтчийн түвшний хүсэлтийн алдаа илрүүллээ. Энэ нь ихэвчлэн медиа сервер дээр CORS эсвэл preflight толгой дутуугаас үүсдэг.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Зорилтот URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Дэлгэрэнгүй: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Одоогийн ажиллах орчин';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Схем';

  @override
  String get webDiagnosticsPluginMode => 'Залгаасын горим';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC скан';

  @override
  String get webDiagnosticsForcedServerUrl => 'Албадсан серверийн URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Үндсэн серверийн URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Илрүүлэлтийн прокси URL';

  @override
  String get notConfigured => 'тохируулаагүй';

  @override
  String get webDiagnosticsMixedContent => 'Холимог контент';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Энэ хуудсыг HTTPS-ээр ачаалсан боловч тохируулсан нэг буюу хэд хэдэн URL нь HTTP байна. Хөтчүүд HTTPS хуудсыг HTTP API дуудахыг хориглодог.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Засвар: медиа сервер эсвэл прокси цэгээ HTTPS-ээр нийлүүлнэ үү, эсвэл Moonfin-ийг зөвхөн итгэмжлэгдсэн дотоод сүлжээнд HTTP-ээр ачаална уу.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Одоогийн ажиллах тохиргооноос холимог контентын илэрхий тохиргоо илрээгүй.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS шалгах жагсаалт';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Access-Control-Allow-Origin-д хөтчийн origin-ыг зөвшөөрнө үү.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Access-Control-Allow-Headers-д Authorization, X-Emby-Authorization, X-Emby-Token-ыг оруулна уу.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Дамжуулалт болон гүйлгэх үйлдэлд Content-Range, Accept-Ranges-ыг ил гаргана уу.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight хүсэлтэд 204 буцаана уу.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Толгойн жишээ хэсэг (nginx маягийн)';

  @override
  String get note => 'Тэмдэглэл';

  @override
  String get webDiagnosticsNonWebNote =>
      'Энэ оношилгооны хуудас нь вэб хувилбарт зориулагдсан. Хэрэв та үүнийг өөр платформ дээр харж байгаа бол эдгээр шалгалт хамаарахгүй байж болно.';

  @override
  String get backToServerSelect => 'Сервер сонголт руу буцах';

  @override
  String get signOutAllUsers => 'Бүх хэрэглэгчийг гаргах';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Микрофоны зөвшөөрлийг бүрмөсөн татгалзсан байна. Системийн тохиргооноос идэвхжүүлнэ үү.';

  @override
  String get voiceSearchPermissionRequired =>
      'Дуут хайлтад микрофоны зөвшөөрөл шаардлагатай.';

  @override
  String get voiceSearchNoMatch => 'Ойлгосонгүй. Дахин оролдоно уу.';

  @override
  String get voiceSearchNoSpeechDetected => 'Яриа илрээгүй.';

  @override
  String get voiceSearchMicrophoneError => 'Микрофоны алдаа.';

  @override
  String get voiceSearchNeedsInternet => 'Дуут хайлтад интернэт шаардлагатай.';

  @override
  String get voiceSearchServiceBusy =>
      'Дуут үйлчилгээ завгүй байна. Дахин оролдоно уу.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Микрофоны зөвшөөрлийг бүрмөсөн татгалзсан байна.';

  @override
  String get microphonePermissionDenied =>
      'Микрофоны зөвшөөрлийг татгалзсан байна.';

  @override
  String get speechRecognitionUnavailable =>
      'Энэ төхөөрөмж дээр яриа таних боломжгүй.';

  @override
  String get openIosRoutePicker => 'iOS-ийн гаралт сонгогчийг нээх';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Энэ төхөөрөмж дээр AirPlay гаралт сонгогч боломжгүй.';

  @override
  String get videos => 'Видеонууд';

  @override
  String get programs => 'Нэвтрүүлгүүд';

  @override
  String get songs => 'Дуунууд';

  @override
  String get photoAlbums => 'Зургийн цомог';

  @override
  String get photos => 'Гэрэл зураг';

  @override
  String get people => 'Хүмүүс';

  @override
  String get recentlyReleasedEpisodes => 'Саяхан гарсан ангиуд';

  @override
  String get watchAgain => 'Дахин үзэх';

  @override
  String get guestAppearances => 'Зочны оролцоо';

  @override
  String get appearancesSeerr => 'Оролцоо (Seerr)';

  @override
  String get crewContributionsSeerr => 'Багийн оролцоо (Seerr)';

  @override
  String get watchWithGroup => 'Бүлгээр үзэх';

  @override
  String get errors => 'Алдаанууд';

  @override
  String get warnings => 'Сануулгууд';

  @override
  String get disk => 'Диск';

  @override
  String get openInBrowser => 'Хөтчөөр нээх';

  @override
  String get embeddedBrowserNotAvailable =>
      'Энэ платформ дээр суулгагдсан хөтөч боломжгүй.';

  @override
  String get adminRestartServerConfirmation =>
      'Серверийг дахин эхлүүлэхдээ итгэлтэй байна уу?';

  @override
  String get adminShutdownServerConfirmation =>
      'Серверийг унтраахдаа итгэлтэй байна уу? Та үүнийг гараар дахин эхлүүлэх шаардлагатай болно.';

  @override
  String get internal => 'Дотоод';

  @override
  String get idle => 'Сул';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Хэрэглэгч олдсонгүй';

  @override
  String get adminNoUsersMatchSearch => 'Таны хайлтад тохирох хэрэглэгч алга';

  @override
  String get adminNoDevicesFound => 'Төхөөрөмж олдсонгүй';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Одоогийн шүүлтүүрт тохирох төхөөрөмж алга';

  @override
  String get passwordSet => 'Нууц үг тохируулсан';

  @override
  String get noPasswordConfigured => 'Нууц үг тохируулаагүй';

  @override
  String get remoteAccess => 'Алсын хандалт';

  @override
  String get localOnly => 'Зөвхөн дотоод';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Медиа аналитикийг ачаалж чадсангүй';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Бүх медиа сангийн нэгдсэн аналитик.';

  @override
  String get analyticsTopArtists => 'Шилдэг уран бүтээлчид';

  @override
  String get analyticsTopAuthors => 'Шилдэг зохиолчид';

  @override
  String get analyticsTopContributors => 'Шилдэг оролцогчид';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Сан',
      one: '1 Сан',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Энэ сонголтод индексжүүлсэн медиагийн нийлбэр хараахан байхгүй байна.';

  @override
  String get analyticsLibraryDetails => 'Сангийн дэлгэрэнгүй';

  @override
  String get analyticsLibraryBreakdown => 'Сангийн задаргаа';

  @override
  String get analyticsNoLibrariesAvailable => 'Боломжтой сан байхгүй байна.';

  @override
  String get adminServerAdministrationTitle => 'Серверийн удирдлага';

  @override
  String get adminServerPathData => 'Өгөгдөл';

  @override
  String get adminServerPathImageCache => 'Зургийн кэш';

  @override
  String get adminServerPathCache => 'Кэш';

  @override
  String get adminServerPathLogs => 'Логууд';

  @override
  String get adminServerPathMetadata => 'Мета өгөгдөл';

  @override
  String get adminServerPathTranscode => 'Хөрвүүлэлт';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Энэ сервер серверийн зам буцаасангүй.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ашигласан';
  }

  @override
  String get userActivity => 'Хэрэглэгчийн үйл ажиллагаа';

  @override
  String get systemEvents => 'Системийн үйл явдал';

  @override
  String get needsAttention => 'Анхаарал шаардлагатай';

  @override
  String get adminDrawerSectionServer => 'Сервер';

  @override
  String get adminDrawerSectionPlayback => 'Тоглуулалт';

  @override
  String get adminDrawerSectionDevices => 'Төхөөрөмжүүд';

  @override
  String get adminDrawerSectionAdvanced => 'Дэвшилтэт';

  @override
  String get adminDrawerSectionPlugins => 'Залгаасууд';

  @override
  String get adminDrawerSectionLiveTv => 'Шууд ТВ';

  @override
  String get homeVideos => 'Гэрийн видео';

  @override
  String get mixedContent => 'Холимог контент';

  @override
  String get homeVideosAndPhotos => 'Гэрийн видео ба гэрэл зураг';

  @override
  String get mixedMoviesAndShows => 'Холимог кино ба цуврал';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Бичлэг олдсонгүй';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return '.$extension архиваас зургийн хуудас олдсонгүй.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Суулгагдсан дүрслэгч алдаа гаргалаа ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB дүрслэгч алдаа гаргалаа ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Уншигчид дотоод файл алга: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return '$uri-аас номын өгөгдөл нээх үед HTTP $status';
  }

  @override
  String get noReadableBookEndpointAvailable => 'Уншиж болох номын цэг байхгүй';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Дэмжигдээгүй комик архивын формат: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Энэ платформ дээр CBR задлах залгаас боломжгүй.';

  @override
  String get failedToExtractCbrArchive => '.cbr архивыг задалж чадсангүй.';

  @override
  String get cb7ExtractionUnavailable =>
      'Энэ платформ дээр CB7 задлалт боломжгүй.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Энэ платформ дээр CB7 задлах залгаас боломжгүй.';

  @override
  String get closeGenrePanel => 'Төрлийн самбарыг хаах';

  @override
  String get loadingShuffle => 'Холимогийг ачаалж байна...';

  @override
  String get libraryShuffleLabel => 'САНГИЙН ХОЛИМОГ';

  @override
  String get randomShuffleLabel => 'САНАМСАРГҮЙ ХОЛИМОГ';

  @override
  String get genresShuffleLabel => 'ТӨРЛИЙН ХОЛИМОГ';

  @override
  String get autoHdrSwitching => 'Автомат HDR шилжилт';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR видео тоглуулахад HDR-ийг автоматаар идэвхжүүлж, гарахад дэлгэцийн горимыг сэргээнэ.';

  @override
  String get whenFullscreen => 'Бүрэн дэлгэцэд байхад';

  @override
  String get changeArtwork => 'Зургийг солих';

  @override
  String get missing => 'Дутуу';

  @override
  String get transcodingLimits => 'Хөрвүүлэлтийн хязгаар';

  @override
  String get clearAllArtworkButton => 'Бүх зургийг цэвэрлэх үү?';

  @override
  String get clearAllArtworkWarning =>
      'Татсан бүх зургийг цэвэрлэхдээ итгэлтэй байна уу?';

  @override
  String get confirmClear => 'Цэвэрлэхийг баталгаажуулах';

  @override
  String confirmClearMessage(String itemType) {
    return 'Энэ $itemType-ийг цэвэрлэхдээ итгэлтэй байна уу?';
  }

  @override
  String get uploadButton => 'Байршуулах уу?';

  @override
  String get resolutionLabel => 'Нягтрал: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Зөвхөн интерфейсийн хэл дээрх зургийг харуулах';

  @override
  String get confirmClearAll => 'Бүгдийг цэвэрлэхийг баталгаажуулах';

  @override
  String get imageUploadSuccess => 'Зургийг амжилттай байршууллаа!';

  @override
  String imageUploadFailed(String error) {
    return 'Зураг байршуулж чадсангүй: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Зураг тохируулж чадсангүй: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Зураг устгаж чадсангүй: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Бүх зургийг цэвэрлэж чадсангүй: $error';
  }

  @override
  String get yes => 'Тийм';

  @override
  String get posterCategory => 'Постер';

  @override
  String get backdropsCategory => 'Дэвсгэр зураг';

  @override
  String get bannerCategory => 'Баннер';

  @override
  String get logoCategory => 'Лого';

  @override
  String get thumbnailCategory => 'Товч зураг';

  @override
  String get artCategory => 'Арт';

  @override
  String get discArtCategory => 'Дискний арт';

  @override
  String get screenshotCategory => 'Дэлгэцийн зураг';

  @override
  String get boxCoverCategory => 'Хайрцгийн нүүр';

  @override
  String get boxRearCoverCategory => 'Хайрцгийн ар тал';

  @override
  String get menuArtCategory => 'Цэсний арт';

  @override
  String get confirmItemPoster => 'постер';

  @override
  String get confirmItemBackdrop => 'дэвсгэр зураг';

  @override
  String get confirmItemBanner => 'баннер';

  @override
  String get confirmItemLogo => 'лого';

  @override
  String get confirmItemThumbnail => 'товч зураг';

  @override
  String get confirmItemArt => 'арт';

  @override
  String get confirmItemDiscArt => 'дискний арт';

  @override
  String get confirmItemScreenshot => 'дэлгэцийн зураг';

  @override
  String get confirmItemBoxCover => 'хайрцгийн нүүр';

  @override
  String get confirmItemBoxRearCover => 'хайрцгийн ар тал';

  @override
  String get confirmItemMenuArt => 'цэсний арт';

  @override
  String get resolutionAll => 'Бүгд';

  @override
  String get resolutionHigh => 'Өндөр (1080p+)';

  @override
  String get resolutionMedium => 'Дунд (720p)';

  @override
  String get resolutionLow => 'Бага (<720p)';

  @override
  String get sources => 'Эх сурвалж';

  @override
  String get audiobookChapters => 'Бүлгүүд';

  @override
  String get audiobookBookmarks => 'Хавчуургууд';

  @override
  String get audiobookNotes => 'Тэмдэглэл';

  @override
  String get audiobookQueue => 'Дараалал';

  @override
  String get audiobookTimeline => 'Цагийн шугам';

  @override
  String get audiobookTimelineEmpty => 'Цагийн шугам хоосон байна';

  @override
  String get audiobookWholeBook => 'Бүтэн ном';

  @override
  String get audiobookFocusedTimeline => 'Төвлөрсөн цагийн шугам';

  @override
  String get audiobookExportBookmarks => 'Хавчуургыг экспортлох';

  @override
  String get audiobookExportNotes => 'Тэмдэглэлийг экспортлох';

  @override
  String get audiobookExportAll => 'Бүгдийг экспортлох';

  @override
  String audiobookExportSuccess(String path) {
    return '$path руу экспортлолоо';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Экспорт амжилтгүй боллоо: $error';
  }

  @override
  String get audiobookLyrics => 'Дууны үг';

  @override
  String get audiobookAddBookmark => 'Хавчуурга нэмэх';

  @override
  String get audiobookAddNote => 'Тэмдэглэл нэмэх';

  @override
  String get audiobookEditNote => 'Тэмдэглэл засах';

  @override
  String get audiobookNoteHint => 'Энэ агшинд тэмдэглэл бичих';

  @override
  String get audiobookSleepTimer => 'Унтах таймер';

  @override
  String get audiobookSleepOff => 'Унтраах';

  @override
  String get audiobookSleepEndOfChapter => 'Бүлгийн төгсгөл';

  @override
  String get audiobookSleepCustom => 'Захиалгат';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining үлдсэн';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин',
      one: '1 мин',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Тоглуулах хурд';

  @override
  String get audiobookRemainingTime => 'Үлдсэн';

  @override
  String get audiobookElapsedTime => 'Өнгөрсөн';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$secondsс ухраах';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$secondsс урагшлуулах';
  }

  @override
  String get audiobookPreviousChapter => 'Өмнөх бүлэг';

  @override
  String get audiobookNextChapter => 'Дараагийн бүлэг';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return '$total-аас $current-р бүлэг';
  }

  @override
  String get audiobookNoChapters => 'Бүлэг байхгүй';

  @override
  String get audiobookNoBookmarks => 'Одоогоор хавчуурга байхгүй';

  @override
  String get audiobookNoNotes => 'Одоогоор тэмдэглэл байхгүй';

  @override
  String audiobookBookmarkAdded(String position) {
    return '$position-д хавчуурга нэмлээ';
  }

  @override
  String get audiobookSpeedReset => '1.0x болгож сэргээх';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Хадгалах';

  @override
  String get audiobookCancel => 'Цуцлах';

  @override
  String get audiobookDelete => 'Устгах';

  @override
  String get subtitlePreferences => 'Хадмалын тохиргоо';

  @override
  String get subtitlePreferencesDescription =>
      'Хадмалын горим, үндсэн хэл, харагдах байдал, дүрслэлийн сонголтыг өөрчилнө.';

  @override
  String get subtitleRendering => 'Хадмалын дүрслэл';

  @override
  String get displayOptions => 'Харуулах сонголтууд';

  @override
  String get releaseDateAscending => 'Гарсан огноо (өсөхөөр)';

  @override
  String get releaseDateDescending => 'Гарсан огноо (буурахаар)';

  @override
  String get groupContributions => 'Оролцоог бүлэглэх';

  @override
  String get groupMultipleRoles => 'Олон дүрийг бүлэглэх';

  @override
  String get libraryWriteAccessWarningTitle => 'Санд бичих эрхийн сануулга';

  @override
  String get libraryWriteAccessHowToFix => 'Үүнийг хэрхэн засах вэ:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Сервер дээрх медиа сангийнхаа хавтсуудад Jellyfin үйлчилгээний хэрэглэгчид (жишээ нь jellyfin эсвэл Docker PUID/PGID) бичих эрх олгоно уу.\n\n2. Эсвэл Jellyfin-ий Хяналтын самбар -> Сангууд руу орж, энэ санг засаад, зургийг Jellyfin-ий дотоод өгөгдлийн санд хадгалахын тулд \'Зургийг медиа хавтсанд хадгалах\' тохиргоог унтраана уу.';

  @override
  String get dismiss => 'Хаах';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Таны \'$libraryName\' сан нь зургийг медиа хавтсанд шууд хадгалахаар тохируулагдсан байна (\'Зургийг медиа хавтсанд хадгалах\' идэвхтэй). Гэвч Jellyfin бичих эрхийг шалгасан бөгөөд энэ хавтсанд файл бичих зөвшөөрөлгүй байна:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin зургийг шинэчилж чадаагүй бололтой. Таны сан нь зургийг медиа хавтсанд шууд хадгалахаар тохируулагдсан байна (\'Зургийг медиа хавтсанд хадгалах\' идэвхтэй). Энэ алдаа нь ихэвчлэн Jellyfin серверийн процесс таны медиа хавтсанд файл бичих зөвшөөрөлгүй үед гардаг.';

  @override
  String get externalLists => 'Гадаад жагсаалт';

  @override
  String get replay => 'Дахин тоглуулах';

  @override
  String get fileInformation => 'Файлын мэдээлэл';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Хэмжээ: $size  •  Формат: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Бүх ($count) аудио замыг харуулах';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Бүх ($count) хадмал замыг харуулах';
  }

  @override
  String get checkingDirectPlay => 'Шууд тоглуулах боломжийг шалгаж байна...';

  @override
  String get directPlayCapabilityLabel => 'Шууд тоглуулах боломж: ';

  @override
  String get forced => 'Албадсан';

  @override
  String get transcodeContainerNotSupported =>
      'Тоглуулагч савны форматыг дэмждэггүй.';

  @override
  String get transcodeVideoCodecNotSupported => 'Видео кодек дэмжигдэхгүй.';

  @override
  String get transcodeAudioCodecNotSupported => 'Аудио кодек дэмжигдэхгүй.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Хадмалын формат дэмжигдэхгүй (шатаах шаардлагатай).';

  @override
  String get transcodeAudioProfileNotSupported => 'Аудио профайл дэмжигдэхгүй.';

  @override
  String get transcodeVideoProfileNotSupported => 'Видео профайл дэмжигдэхгүй.';

  @override
  String get transcodeVideoLevelNotSupported => 'Видео түвшин дэмжигдэхгүй.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Энэ төхөөрөмж видеоны нягтралыг дэмждэггүй.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Видеоны битийн гүн дэмжигдэхгүй.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Видеоны кадрын давтамж дэмжигдэхгүй.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Файлын битрэйт тоглуулагчийн дамжуулалтын хязгаараас хэтэрсэн.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Видеоны битрэйт дамжуулалтын хязгаараас хэтэрсэн.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Аудионы битрэйт дамжуулалтын хязгаараас хэтэрсэн.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Аудио сувгийн тоо дэмжигдэхгүй.';

  @override
  String get sortAlphabetical => 'Цагаан толгойн дарааллаар';

  @override
  String get sortReleaseAscending => 'Гарсан дараалал (өсөхөөр)';

  @override
  String get sortReleaseDescending => 'Гарсан дараалал (буурахаар)';

  @override
  String get sortCustomDragDrop => 'Захиалгат (чирж буулгах)';

  @override
  String get playlistSortOptions => 'Тоглуулах жагсаалтын эрэмбийн сонголт';

  @override
  String get resetSort => 'Эрэмбийг сэргээх';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode-г дахин үзэх';
  }

  @override
  String get rewatchPlaylist => 'Тоглуулах жагсаалтыг дахин үзэх';

  @override
  String get noSubtitlesFound => 'Хадмал олдсонгүй.';

  @override
  String get adminControls => 'Админы удирдлага';

  @override
  String get impellerRendering => 'Дүрслэлийн хөдөлгүүр (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller бол илүү жигд хөдөлгөөн, бага доголдолтой байхад зориулсан Flutter-ийн орчин үеийн GPU дүрслэгч юм. Зарим ТВ хайрцаг болон хуучин GPU дээр гажилт эсвэл хар дэлгэц үүсгэж болзошгүй; тийм зүйл харвал Унтраах болгоно уу. Автомат нь таны төхөөрөмжид тохирох үндсэн утгыг сонгоно. Хэрэглэхийн тулд Moonfin-ийг дахин эхлүүлнэ үү.';

  @override
  String get impellerAuto => 'Автомат';

  @override
  String get impellerOn => 'Асаах';

  @override
  String get impellerOff => 'Унтраах';

  @override
  String get impellerRestartTitle => 'Дахин эхлүүлэх шаардлагатай';

  @override
  String get impellerRestartMessage =>
      'Дүрслэлийн хөдөлгүүрийг солихын тулд Moonfin дахин эхлэх шаардлагатай. Аппыг одоо хаагаад дахин нээж хэрэглэнэ үү.';

  @override
  String get impellerCloseNow => 'Аппыг одоо хаах';

  @override
  String get adminRefreshLibrary => 'Санг шинэчлэх';

  @override
  String get adminRefreshAllLibraries => 'Бүх санг шинэчлэх';

  @override
  String get adminRepoSortDateOldest => 'Нэмсэн огноо (хуучнаас)';

  @override
  String get adminRepoSortDateNewest => 'Нэмсэн огноо (шинээс)';

  @override
  String get adminRepoSortNameAsc => 'Цагаан толгойн дараалал (А-аас Я)';

  @override
  String get adminRepoSortNameDesc => 'Цагаан толгойн дараалал (Я-гаас А)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Серверийн аналитикийг ачаалж байна... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource =>
      'Эх сурвалжтай тааруулах';

  @override
  String get imdbTop250Movies => 'IMDb-ийн шилдэг 250 кино';

  @override
  String get imdbTop250TvShows => 'IMDb-ийн шилдэг 250 ТВ цуврал';

  @override
  String get imdbMostPopularMovies => 'IMDb-ийн хамгийн алдартай кино';

  @override
  String get imdbMostPopularTvShows => 'IMDb-ийн хамгийн алдартай ТВ цуврал';

  @override
  String get imdbLowestRatedMovies => 'IMDb-ийн хамгийн бага үнэлгээтэй кино';

  @override
  String get imdbTopEnglishMovies => 'IMDb-ийн шилдэг үнэлгээтэй англи кино';
}
