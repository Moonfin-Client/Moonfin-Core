// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'মুনফিন';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'সাইন ইন করুন';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return '$serverName এর সাথে সংযুক্ত হচ্ছে';
  }

  @override
  String get quickConnect => 'দ্রুত সংযোগ';

  @override
  String get password => 'পাসওয়ার্ড';

  @override
  String get username => 'ব্যবহারকারীর নাম';

  @override
  String get email => 'ইমেইল';

  @override
  String get quickConnectInstruction =>
      'আপনার সার্ভারের ওয়েব ড্যাশবোর্ডে এই কোডটি লিখুন:';

  @override
  String get waitingForAuthorization => 'অনুমোদনের জন্য অপেক্ষা করা হচ্ছে...';

  @override
  String get back => 'ব্যাক';

  @override
  String get serverUnavailable => 'সার্ভার অনুপলব্ধ';

  @override
  String get loginFailed => 'লগইন ব্যর্থ হয়েছে';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect অনুপলব্ধ: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect অনুপলব্ধ ($status): $detail';
  }

  @override
  String get whosWatching => 'কে দেখছে?';

  @override
  String get addUser => 'ব্যবহারকারী যোগ করুন';

  @override
  String get selectServer => 'সার্ভার নির্বাচন করুন';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin সংস্করণ $version';
  }

  @override
  String get savedServers => 'সংরক্ষিত সার্ভার';

  @override
  String get discoveredServers => 'আবিষ্কৃত সার্ভার';

  @override
  String get noneFound => 'একটিও পাওয়া যায়নি';

  @override
  String get unableToConnectToServer => 'সার্ভারের সাথে সংযোগ করতে অক্ষম৷';

  @override
  String get addServer => 'সার্ভার যোগ করুন';

  @override
  String get embyConnect => 'Emby সংযোগ করুন';

  @override
  String get removeServer => 'সার্ভার সরান';

  @override
  String removeServerConfirmation(String serverName) {
    return 'আপনার সার্ভার থেকে \"$serverName\" সরাতে চান?';
  }

  @override
  String get cancel => 'বাতিল করুন';

  @override
  String get remove => 'সরান';

  @override
  String get connectToServer => 'সার্ভারের সাথে সংযোগ করুন';

  @override
  String get serverAddress => 'সার্ভার ঠিকানা';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'সংযোগ করুন';

  @override
  String get secureStorageUnavailable => 'নিরাপদ সঞ্চয়স্থান অনুপলব্ধ৷';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin আপনার সিস্টেম কীরিং অ্যাক্সেস করতে পারেনি। লগইন চালিয়ে যেতে পারে, কিন্তু কীরিং আনলক না হওয়া পর্যন্ত নিরাপদ টোকেন স্টোরেজ অনুপলব্ধ হতে পারে।';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get settingsAppearanceTheme => 'অ্যাপ থিম';

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
      'অ্যাপ রিস্টার্ট না করে Moonfin এবং Neon Pulse এর মধ্যে পাল্টান';

  @override
  String get keyboardPreferSystemIme => 'সিস্টেম কীবোর্ড পছন্দ করুন';

  @override
  String get keyboardPreferSystemImeDescription =>
      'পাঠ্য এন্ট্রির জন্য ডিফল্টরূপে আপনার ডিভাইস ইনপুট পদ্ধতি ব্যবহার করুন৷';

  @override
  String get themeMoonfin => 'মুনফিন';

  @override
  String get themeMoonfinSubtitle =>
      'বর্তমান Moonfin দেখুন আপনারা সবাই প্রেমে পড়েছেন';

  @override
  String get themeNeonPulse => 'নিয়ন পালস';

  @override
  String get themeNeonPulseSubtitle =>
      'ম্যাজেন্টা গ্লো, সায়ান টেক্সট এবং শক্তিশালী ক্রোম কনট্রাস্ট সহ সিনথওয়েভ স্টাইলিং';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get embyConnectSignInSubtitle =>
      'আপনার Emby কানেক্ট অ্যাকাউন্ট দিয়ে সাইন ইন করুন';

  @override
  String get emailOrUsername => 'ইমেল বা ব্যবহারকারীর নাম';

  @override
  String get selectAServer => 'একটি সার্ভার নির্বাচন করুন';

  @override
  String get tryAgain => 'আবার চেষ্টা করুন';

  @override
  String get noLinkedServers =>
      'এই Emby সংযোগ অ্যাকাউন্টের সাথে কোন সার্ভার লিঙ্ক করা নেই';

  @override
  String get invalidEmbyConnectCredentials => 'অবৈধ Emby সংযোগ শংসাপত্র';

  @override
  String get invalidEmbyConnectLogin =>
      'অবৈধ Emby ব্যবহারকারীর নাম বা পাসওয়ার্ড সংযুক্ত করুন';

  @override
  String get embyConnectExchangeNotSupported =>
      'সার্ভার Emby সংযোগ বিনিময় সমর্থন করে না';

  @override
  String get embyConnectNetworkError =>
      'Emby সংযোগ বা নির্বাচিত সার্ভারের সাথে যোগাযোগ করার সময় নেটওয়ার্ক ত্রুটি';

  @override
  String get loadingLinkedServers => 'লিঙ্ক করা সার্ভার লোড হচ্ছে...';

  @override
  String get connectingToServerEllipsis => 'সার্ভারে সংযুক্ত হচ্ছে...';

  @override
  String get noReachableAddress => 'কোন পৌঁছানো ঠিকানা প্রদান করা হয়েছে';

  @override
  String get invalidServerExchangeResponse =>
      'সার্ভার এক্সচেঞ্জ এন্ডপয়েন্ট থেকে অবৈধ প্রতিক্রিয়া';

  @override
  String unableToConnectTo(String target) {
    return '$target এর সাথে সংযোগ করতে অক্ষম';
  }

  @override
  String get exitApp => 'প্রস্থান করুন Moonfin?';

  @override
  String get exitAppConfirmation => 'আপনি কি নিশ্চিত আপনি প্রস্থান করতে চান?';

  @override
  String get exit => 'প্রস্থান করুন';

  @override
  String get noHomeRowsLoaded => 'কোন হোম সারি লোড করা যাবে না';

  @override
  String get noHomeRowsHint =>
      'সক্রিয় হোম বিভাগগুলিকে রিফ্রেশ বা হ্রাস করার চেষ্টা করুন।';

  @override
  String get retryHomeRows => 'হোম সারি পুনরায় চেষ্টা করুন';

  @override
  String get guide => 'গাইড';

  @override
  String get recordings => 'রেকর্ডিং';

  @override
  String get schedule => 'সময়সূচী';

  @override
  String get series => 'সিরিজ';

  @override
  String get noItemsFound => 'কোন আইটেম পাওয়া যায়নি';

  @override
  String get home => 'বাড়ি';

  @override
  String get browseAll => 'সব ব্রাউজ করুন';

  @override
  String get genres => 'জেনারস';

  @override
  String get collectionPlaceholder => 'সংগ্রহ আইটেম এখানে প্রদর্শিত হবে';

  @override
  String get browseByLetter => 'চিঠি দ্বারা ব্রাউজ করুন';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'বর্ণানুক্রমিক ব্রাউজ এখানে প্রদর্শিত হবে';

  @override
  String get suggestions => 'পরামর্শ';

  @override
  String get suggestionsPlaceholder => 'প্রস্তাবিত আইটেম এখানে প্রদর্শিত হবে';

  @override
  String get failedToLoadLibraries => 'লাইব্রেরি লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get noLibrariesFound => 'কোনো লাইব্রেরি পাওয়া যায়নি';

  @override
  String get library => 'লাইব্রেরি';

  @override
  String get displaySettings => 'প্রদর্শন সেটিংস';

  @override
  String get allGenres => 'সমস্ত জেনার';

  @override
  String get noGenresFound => 'কোন শৈলী পাওয়া যায়নি';

  @override
  String failedToLoadFolderError(String error) {
    return 'ফোল্ডার লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get thisFolderIsEmpty => 'এই ফোল্ডারটি খালি';

  @override
  String itemCountLabel(int count) {
    return '$count আইটেম';
  }

  @override
  String get failedToLoadFavorites => 'প্রিয় লোড করতে ব্যর্থ হয়েছে';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get noFavoritesYet => 'এখনও কোন প্রিয়';

  @override
  String get favorites => 'প্রিয়';

  @override
  String totalCountItems(int count) {
    return '$count আইটেম';
  }

  @override
  String get continuing => 'অব্যাহত';

  @override
  String get ended => 'শেষ হয়েছে';

  @override
  String get sortAndFilter => 'বাছাই এবং ফিল্টার';

  @override
  String get type => 'টাইপ';

  @override
  String get sortBy => 'অনুসারে সাজান';

  @override
  String get display => 'প্রদর্শন';

  @override
  String get imageType => 'ছবির ধরন';

  @override
  String get posterSize => 'পোস্টার সাইজ';

  @override
  String get small => 'ছোট';

  @override
  String get medium => 'মাঝারি';

  @override
  String get large => 'বড়';

  @override
  String get extraLarge => 'অতিরিক্ত বড়';

  @override
  String libraryGenresTitle(String name) {
    return '$name — ধরন';
  }

  @override
  String get views => 'ভিউ';

  @override
  String get albums => 'অ্যালবাম';

  @override
  String get albumArtists => 'অ্যালবাম শিল্পী';

  @override
  String get artists => 'শিল্পী';

  @override
  String get bookmarks => 'বুকমার্ক';

  @override
  String get noSavedBookmarks =>
      'এই শিরোনামের জন্য এখনও কোনও সংরক্ষিত বুকমার্ক নেই৷';

  @override
  String get openBook => 'বই খুলুন';

  @override
  String get chapter => 'অধ্যায়';

  @override
  String get page => 'পাতা';

  @override
  String get bookmark => 'বুকমার্ক';

  @override
  String get justNow => 'এইমাত্র';

  @override
  String minutesAgo(int count) {
    return '$count মিঃ আগে';
  }

  @override
  String hoursAgo(int count) {
    return '$count ঘন্টা আগে';
  }

  @override
  String daysAgo(int count) {
    return '$count দিন আগে';
  }

  @override
  String get discoverySubjects => 'আবিষ্কার বিষয়';

  @override
  String get pickDiscoverySubjects =>
      'ডিসকভারে কোন বিষয়ের ফিড দেখানো হবে তা বেছে নিন।';

  @override
  String get apply => 'আবেদন করুন';

  @override
  String get openLink => 'লিঙ্ক খুলুন';

  @override
  String get scanWithYourPhone => 'আপনার ফোন দিয়ে স্ক্যান করুন';

  @override
  String get audiobookGenres => 'অডিওবুক জেনারস';

  @override
  String get pickAudiobookGenres =>
      'অডিওবুক ডিসকভারে কোন জেনার দেখানো হবে তা বেছে নিন।';

  @override
  String get discoverAudiobooks => 'অডিওবুক আবিষ্কার করুন';

  @override
  String get librivoxDescription =>
      'LibriVox থেকে জনপ্রিয় পাবলিক ডোমেন শিরোনাম।';

  @override
  String titlesCount(int count) {
    return '$count শিরোনাম';
  }

  @override
  String get scrollLeft => 'বাম দিকে স্ক্রোল করুন';

  @override
  String get scrollRight => 'ডানদিকে স্ক্রোল করুন';

  @override
  String get couldNotLoadGenre => 'এই ধারাটি এখনই লোড করা যায়নি।';

  @override
  String get continueReading => 'পড়া চালিয়ে যান';

  @override
  String get savedHighlights => 'সংরক্ষিত হাইলাইট';

  @override
  String get continueListening => 'শোনা চালিয়ে যান';

  @override
  String get listen => 'শুনুন';

  @override
  String get resume => 'পুনরায় শুরু করুন';

  @override
  String get failedToLoadLibrary => 'লাইব্রেরি লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get popularNow => 'এখন জনপ্রিয়';

  @override
  String get savedForLater => 'পরে জন্য সংরক্ষিত';

  @override
  String get topListens => 'টপ লিসেনস';

  @override
  String get unreadDiscoveries => 'অপঠিত আবিষ্কার';

  @override
  String get pickUpAgain => 'আবার পিক আপ';

  @override
  String get bookHighlightsDescription =>
      'হাইলাইট, পছন্দ, বা পড়ার অগ্রগতি সহ আপনার বই।';

  @override
  String get handPickedFromLibrary => 'আপনার লাইব্রেরি থেকে হাতে বাছাই করা.';

  @override
  String get handPickedFromListeningQueue =>
      'আপনার শ্রবণ সারি থেকে হাতে-বাছাই করা.';

  @override
  String get booksWithHighlights => 'হাইলাইট, পছন্দ, বা পড়ার অগ্রগতি সহ বই।';

  @override
  String get jumpBackNarration =>
      'আপনার জায়গার জন্য শিকার না করে বর্ণনায় ফিরে যান।';

  @override
  String get unreadBooksReady => 'অপঠিত বই পরবর্তী শান্ত ঘন্টার জন্য প্রস্তুত.';

  @override
  String get quickAccessFavorites =>
      'আপনি যে বইগুলিতে ফিরে আসছেন সেগুলিতে দ্রুত অ্যাক্সেস।';

  @override
  String get searchAudiobooks => 'অডিওবুক অনুসন্ধান করুন';

  @override
  String get searchYourLibrary => 'আপনার লাইব্রেরি অনুসন্ধান করুন';

  @override
  String get pickUpStory => 'আপনি যেখানে ছেড়েছিলেন সেই গল্পটি তুলে ধরুন';

  @override
  String get savedPlacesChapters => 'আপনার সংরক্ষিত স্থান এবং অসমাপ্ত অধ্যায়';

  @override
  String authorsCount(int count) {
    return '$count লেখক';
  }

  @override
  String genresCount(int count) {
    return '$count জেনার';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% সম্পন্ন হয়েছে';
  }

  @override
  String get readyWhenYouAre => 'আপনি যখন প্রস্তুত';

  @override
  String get details => 'বিস্তারিত';

  @override
  String get listeningRoom => 'শোনার ঘর';

  @override
  String get bookmarksAndProgress => 'বুকমার্ক এবং অগ্রগতি';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count শিরোনাম পড়া-প্রথম ব্রাউজিংয়ের জন্য সাজানো হয়েছে।';
  }

  @override
  String get titles => 'শিরোনাম';

  @override
  String get allTitles => 'সব শিরোনাম';

  @override
  String get authors => 'লেখক';

  @override
  String get browseByAuthor => 'লেখক দ্বারা ব্রাউজ করুন';

  @override
  String get browseByGenre => 'জেনার দ্বারা ব্রাউজ করুন';

  @override
  String get discover => 'আবিষ্কার করুন';

  @override
  String get trendingTitlesOpenLibrary =>
      'Open Library থেকে বিষয় অনুসারে ট্রেন্ডিং শিরোনাম।';

  @override
  String get noBookmarkedItems => 'এখনও কোন বুকমার্ক করা আইটেম';

  @override
  String get nothingMatchesSection =>
      'এই বিভাগে এখনও কিছু মেলে না। অন্য ট্যাব ব্যবহার করে দেখুন বা লাইব্রেরি সিঙ্ক শেষ হওয়ার পরে ফিরে আসুন।';

  @override
  String get audiobooks => 'অডিওবুক';

  @override
  String noLabelFound(String label) {
    return '$label পাওয়া যায়নি';
  }

  @override
  String get folder => 'ফোল্ডার';

  @override
  String get filters => 'ফিল্টার';

  @override
  String get readingStatus => 'পড়ার অবস্থা';

  @override
  String get playedStatus => 'খেলার স্থিতি';

  @override
  String get readStatus => 'পড়ুন';

  @override
  String get watched => 'দেখেছে';

  @override
  String get unread => 'অপঠিত';

  @override
  String get unwatched => 'অদেখা';

  @override
  String get seriesStatus => 'সিরিজ স্ট্যাটাস';

  @override
  String get allLibraries => 'সব লাইব্রেরি';

  @override
  String get books => 'বই';

  @override
  String get author => 'লেখক';

  @override
  String get unknownAuthor => 'অজানা লেখক';

  @override
  String get uncategorized => 'অশ্রেণীভুক্ত';

  @override
  String get overview => 'ওভারভিউ';

  @override
  String get noLibrivoxDescription =>
      'এই শিরোনামের জন্য LibriVox দ্বারা এখনো কোনো বিবরণ দেওয়া হয়নি।';

  @override
  String get readers => 'পাঠক';

  @override
  String get openLinks => 'লিঙ্ক খুলুন';

  @override
  String get librivoxPage => 'LibriVox পৃষ্ঠা';

  @override
  String get internetArchive => 'ইন্টারনেট আর্কাইভ';

  @override
  String get rssFeed => 'আরএসএস ফিড';

  @override
  String get downloadZip => 'জিপ ডাউনলোড করুন';

  @override
  String sectionCountLabel(int count) {
    return '$count বিভাগ';
  }

  @override
  String firstPublished(int year) {
    return 'প্রথম প্রকাশিত $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'এই শিরোনামের জন্য Open Library থেকে এখনও কোনো ওভারভিউ উপলব্ধ নেই।';

  @override
  String get subjects => 'বিষয়';

  @override
  String get all => 'সব';

  @override
  String booksCount(int count) {
    return '$count বই';
  }

  @override
  String get couldNotLoadSubject => 'এই মুহূর্তে এই বিষয় লোড করা যায়নি.';

  @override
  String get audiobookDetails => 'অডিওবুকের বিবরণ';

  @override
  String authorsCountTitle(int count) {
    return '$count লেখক';
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
  String get trackList => 'ট্র্যাক তালিকা';

  @override
  String get itemListPlaceholder => 'আইটেম তালিকা এখানে প্রদর্শিত হবে';

  @override
  String get favoriteTracksPlaceholder => 'প্রিয় ট্র্যাক এখানে প্রদর্শিত হবে';

  @override
  String get failedToLoad => 'লোড করতে ব্যর্থ হয়েছে';

  @override
  String get delete => 'মুছুন';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get moreLikeThis => 'এই মত আরো';

  @override
  String get castAndCrew => 'কাস্ট এবং ক্রু';

  @override
  String get collection => 'সংগ্রহ';

  @override
  String get episodes => 'পর্বগুলি';

  @override
  String get nextUp => 'পরবর্তী আপ';

  @override
  String get seasons => 'ঋতু';

  @override
  String get chapters => 'অধ্যায়';

  @override
  String get features => 'বৈশিষ্ট্য';

  @override
  String get movies => 'সিনেমা';

  @override
  String get musicVideos => 'মিউজিক ভিডিও';

  @override
  String get other => 'অন্যান্য';

  @override
  String get discography => 'ডিসকোগ্রাফি';

  @override
  String get similarArtists => 'অনুরূপ শিল্পী';

  @override
  String get tableOfContents => 'সূচিপত্র';

  @override
  String get tracklist => 'ট্র্যাকলিস্ট';

  @override
  String discNumber(int number) {
    return 'ডিস্ক $number';
  }

  @override
  String get biography => 'জীবনী';

  @override
  String get authorDetails => 'লেখক বিস্তারিত';

  @override
  String get noOverviewAvailable =>
      'এই শিরোনামের জন্য এখনও কোনো ওভারভিউ উপলব্ধ নেই৷';

  @override
  String get noBiographyAvailable => 'এই লেখকের জন্য কোন জীবনী উপলব্ধ নেই।';

  @override
  String get noBooksFound => 'এই লেখকের জন্য কোন বই পাওয়া যায়নি।';

  @override
  String get unableToLoadAuthorDetails =>
      'এই মুহূর্তে লেখকের বিবরণ লোড করতে অক্ষম৷';

  @override
  String published(int year) {
    return 'প্রকাশিত $year';
  }

  @override
  String get publicationDateUnknown => 'প্রকাশের তারিখ অজানা';

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
    return '$time এ শেষ হয়';
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
    return '';
  }

  @override
  String get view => 'দেখুন';

  @override
  String get resumeReading => 'পড়া পুনরায় শুরু করুন';

  @override
  String get read => 'পড়ুন';

  @override
  String resumeFrom(String position) {
    return '$position থেকে পুনরায় শুরু করুন';
  }

  @override
  String get play => 'খেলা';

  @override
  String get startOver => 'ওভার শুরু করুন';

  @override
  String get restart => 'রিস্টার্ট করুন';

  @override
  String get readOffline => 'অফলাইনে পড়ুন';

  @override
  String get playOffline => 'অফলাইনে খেলুন';

  @override
  String get audio => 'অডিও';

  @override
  String get subtitles => 'সাবটাইটেল';

  @override
  String get version => 'সংস্করণ';

  @override
  String get cast => 'কাস্ট';

  @override
  String get trailer => 'ট্রেলার';

  @override
  String get finished => 'সমাপ্ত';

  @override
  String get favorited => 'পছন্দের';

  @override
  String get favorite => 'প্রিয়';

  @override
  String get playlist => 'প্লেলিস্ট';

  @override
  String get downloaded => 'ডাউনলোড করা হয়েছে';

  @override
  String get downloadAll => 'সব ডাউনলোড করুন';

  @override
  String get download => 'ডাউনলোড করুন';

  @override
  String get deleteDownloaded => 'ডাউনলোড করা মুছুন';

  @override
  String get goToSeries => 'সিরিজে যান';

  @override
  String get editMetadata => 'মেটাডেটা সম্পাদনা করুন';

  @override
  String get less => 'কম';

  @override
  String get more => 'আরও';

  @override
  String get deleteItem => 'আইটেম মুছুন';

  @override
  String get deletePlaylist => 'প্লেলিস্ট মুছুন';

  @override
  String get deletePlaylistMessage => 'সার্ভার থেকে এই প্লেলিস্ট মুছবেন?';

  @override
  String get deleteItemMessage => 'সার্ভার থেকে এই আইটেমটি মুছবেন?';

  @override
  String get failedToDeletePlaylist => 'প্লেলিস্ট মুছে ফেলতে ব্যর্থ হয়েছে৷';

  @override
  String get failedToDeleteItem => 'আইটেম মুছে ফেলতে ব্যর্থ হয়েছে';

  @override
  String get renamePlaylist => 'প্লেলিস্টের নাম পরিবর্তন করুন';

  @override
  String get playlistName => 'প্লেলিস্টের নাম';

  @override
  String get deleteDownloadedAlbum => 'ডাউনলোড করা অ্যালবাম মুছুন';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return '\"$title\" এর জন্য ডাউনলোড করা ট্র্যাকগুলি মুছবেন?';
  }

  @override
  String get downloadedTracksDeleted => 'ডাউনলোড করা ট্র্যাক মুছে ফেলা হয়েছে';

  @override
  String get downloadedTracksDeleteFailed =>
      'কিছু ডাউনলোড করা ট্র্যাক মুছে ফেলা যায়নি৷';

  @override
  String get noTracksLoaded => 'কোন ট্র্যাক লোড';

  @override
  String noItemsLoaded(String itemLabel) {
    return '$itemLabel লোড করা হয়নি';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'ডাউনলোড হচ্ছে $title ($count আইটেম)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'আপনি কি সার্ভার থেকে \"$name\" মুছে ফেলার বিষয়ে নিশ্চিত? এই ক্রিয়াটি পূর্বাবস্থায় ফেরানো যাবে না৷';
  }

  @override
  String get itemDeleted => 'আইটেম মুছে ফেলা হয়েছে';

  @override
  String get noPlayableTrailerFound =>
      'কোনো খেলার যোগ্য ট্রেলার পাওয়া যায়নি।';

  @override
  String unsupportedBookFormat(String extension) {
    return 'অসমর্থিত বই বিন্যাস: .$extension';
  }

  @override
  String get audioTrack => 'অডিও ট্র্যাক';

  @override
  String get subtitleTrack => 'সাবটাইটেল ট্র্যাক';

  @override
  String get none => 'কোনোটিই নয়';

  @override
  String get downloadSubtitlesLabel => 'সাবটাইটেল ডাউনলোড করুন...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'OpenSubtitles প্লাগইন ব্যবহার করে অনুসন্ধান করুন';

  @override
  String get downloadSubtitles => 'সাবটাইটেল ডাউনলোড করুন';

  @override
  String get selectedSubtitleInvalid => 'নির্বাচিত সাবটাইটেলটি অবৈধ৷';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'সাবটাইটেল ডাউনলোড করা হয়েছে এবং নির্বাচিত হয়েছে: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'সাবটাইটেল ডাউনলোড করা হয়েছে। Jellyfin আইটেমটি রিফ্রেশ করার সময় এটি প্রদর্শিত হতে কিছুক্ষণ সময় নিতে পারে৷';

  @override
  String noRemoteSubtitlesFound(String language) {
    return '$language এর জন্য কোনো দূরবর্তী সাবটাইটেল পাওয়া যায়নি।';
  }

  @override
  String get selectVersion => 'সংস্করণ নির্বাচন করুন';

  @override
  String versionNumber(int number) {
    return 'সংস্করণ $number';
  }

  @override
  String get downloadAllQuality => 'সব ডাউনলোড করুন — গুণমান';

  @override
  String get downloadQuality => 'ডাউনলোড কোয়ালিটি';

  @override
  String get originalFileNoReencoding => 'আসল ফাইল, কোন রি-এনকোডিং নেই';

  @override
  String get originalFilesNoReencoding => 'আসল ফাইল, কোন রি-এনকোডিং নেই';

  @override
  String get noEpisodesLoaded => 'কোনো পর্ব লোড করা হয়নি';

  @override
  String downloadingItem(String name, String quality) {
    return 'ডাউনলোড হচ্ছে $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'ডাউনলোড করা ফাইল মুছুন';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return '$typeLabel এর জন্য স্থানীয় ফাইল মুছে ফেলবেন?\n\nএটি স্টোরেজ স্পেস খালি করবে। আপনি পরে আবার ডাউনলোড করতে পারেন.';
  }

  @override
  String get downloadedFilesDeleted => 'ডাউনলোড করা ফাইল মুছে ফেলা হয়েছে';

  @override
  String get failedToDeleteFiles => 'ফাইল মুছে ফেলতে ব্যর্থ হয়েছে';

  @override
  String get deleteFiles => 'ফাইল মুছুন';

  @override
  String get director => 'পরিচালক';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'লেখক';

  @override
  String get studio => 'স্টুডিও';

  @override
  String studioMoreCount(int count) {
    return '+$count আরও';
  }

  @override
  String totalEpisodes(int count) {
    return '$count পর্বগুলি৷';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'পর্ব $number';
  }

  @override
  String chapterNumber(int number) {
    return 'অধ্যায় $number';
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
    return 'জন্ম $date';
  }

  @override
  String died(String date) {
    return 'মারা গেছেন $date';
  }

  @override
  String age(int age) {
    return 'বয়স $age';
  }

  @override
  String get showLess => 'কম দেখান';

  @override
  String get readMore => 'আরও পড়ুন';

  @override
  String get shuffle => 'এলোমেলো';

  @override
  String downloadsCount(int count) {
    return '$count ডাউনলোড';
  }

  @override
  String get perfectMatch => 'নিখুঁত ম্যাচ';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'মনো';

  @override
  String get stereo => 'স্টেরিও';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'রিমোট সাবটাইটেল $action এই ব্যবহারকারীর জন্য Jellyfin সাবটাইটেল পরিচালনার অনুমতি প্রয়োজন।';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'এই আইটেমটি দূরবর্তী সাবটাইটেল $action সার্ভারে পাওয়া যায়নি।';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'রিমোট সাবটাইটেল $action ব্যর্থ হয়েছে: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'রিমোট সাবটাইটেল $action ব্যর্থ হয়েছে (HTTP $status)।';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return '$action দূরবর্তী সাবটাইটেল করতে ব্যর্থ হয়েছে৷';
  }

  @override
  String deleteSeriesFiles(String name) {
    return '\"$name\" এর জন্য ডাউনলোড করা সমস্ত পর্ব';
  }

  @override
  String get deleteSeasonFiles => 'এই সিজনে সব ডাউনলোড করা পর্ব';

  @override
  String get stillWatching => 'এখনও দেখছেন?';

  @override
  String get unableToLoadTrailerStream => 'ট্রেলার স্ট্রীম লোড করতে অক্ষম৷';

  @override
  String get trailerTimedOut => 'লোড করার সময় ট্রেলারের সময় শেষ হয়েছে৷';

  @override
  String get playbackFailedForTrailer =>
      'এই ট্রেলারের জন্য প্লেব্যাক ব্যর্থ হয়েছে৷';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'অফলাইন প্লেব্যাকের সময় কাস্টিং অনুপলব্ধ৷';

  @override
  String castActionFailed(String label, String error) {
    return '$label অ্যাকশন ব্যর্থ হয়েছে: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'কাস্ট ভলিউম সেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label নিয়ন্ত্রণ';
  }

  @override
  String get deviceVolume => 'ডিভাইসের ভলিউম';

  @override
  String get unavailable => 'অনুপলব্ধ';

  @override
  String get pause => 'বিরতি';

  @override
  String get syncPosition => 'সিঙ্ক অবস্থান';

  @override
  String stopCast(String label) {
    return 'থামুন $label';
  }

  @override
  String get queueIsEmpty => 'সারি খালি';

  @override
  String trackNumber(int number) {
    return '$number ট্র্যাক করুন';
  }

  @override
  String get remotePlayback => 'রিমোট প্লেব্যাক';

  @override
  String get castingToGoogleCast => 'Google Cast এ কাস্ট করা হচ্ছে';

  @override
  String get castingViaAirPlay => 'AirPlay এর মাধ্যমে কাস্ট করা হচ্ছে';

  @override
  String get castingViaDlna => 'DLNA এর মাধ্যমে কাস্ট করা হচ্ছে';

  @override
  String secondsCount(int seconds) {
    return '$seconds সেকেন্ড';
  }

  @override
  String get longPressToUnlock => 'আনলক করতে দীর্ঘক্ষণ টিপুন';

  @override
  String get off => 'বন্ধ';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'অটো';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps এমবিপিএস';
  }

  @override
  String get bitrateOverride => 'বিটরেট ওভাররাইড';

  @override
  String get audioDelay => 'অডিও বিলম্ব';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'সাবটাইটেল বিলম্ব';

  @override
  String get reset => 'রিসেট করুন';

  @override
  String get unknown => 'অজানা';

  @override
  String get playbackInformation => 'প্লেব্যাক তথ্য';

  @override
  String get playback => 'প্লেব্যাক';

  @override
  String get playMethod => 'খেলার পদ্ধতি';

  @override
  String get directPlay => 'সরাসরি খেলা';

  @override
  String get directStream => 'সরাসরি প্রবাহ';

  @override
  String get transcoding => 'ট্রান্সকোডিং';

  @override
  String get transcodeReasons => 'ট্রান্সকোড কারণ';

  @override
  String get player => 'প্লেয়ার';

  @override
  String get container => 'ধারক';

  @override
  String get bitrate => 'বিটরেট';

  @override
  String get video => 'ভিডিও';

  @override
  String get resolution => 'রেজোলিউশন';

  @override
  String get hdr => 'এইচডিআর';

  @override
  String get codec => 'কোডেক';

  @override
  String get videoBitrate => 'ভিডিও বিটরেট';

  @override
  String get track => 'ট্র্যাক';

  @override
  String get channels => 'চ্যানেল';

  @override
  String get audioBitrate => 'অডিও বিটরেট';

  @override
  String get sampleRate => 'নমুনা হার';

  @override
  String get format => 'বিন্যাস';

  @override
  String get external => 'বাহ্যিক';

  @override
  String get embedded => 'এমবেডেড';

  @override
  String castSessionError(String protocol) {
    return '$protocol সেশন ত্রুটি';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'বইয়ের বিবরণ লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB রেন্ডারিং ইন-অ্যাপ এখনও এই প্ল্যাটফর্মে উপলব্ধ নয়৷';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'এই ফর্ম্যাটটি (.$extension) এখনও অ্যাপ-এর মধ্যে রেন্ডার করা যাবে না।';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'এমবেডেড নথি রেন্ডারিং এই প্ল্যাটফর্মে অনুপলব্ধ৷';

  @override
  String get couldNotOpenExternalViewer => 'বাহ্যিক ভিউয়ার খুলতে পারেনি৷';

  @override
  String failedToOpenInAppReader(String error) {
    return 'অ্যাপ-মধ্যস্থ রিডার খুলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'বুকমার্ক ইতিমধ্যে $label এ সংরক্ষিত হয়েছে।';
  }

  @override
  String bookmarkAdded(String label) {
    return 'বুকমার্ক যোগ করা হয়েছে: $label';
  }

  @override
  String get noBookmarksYet =>
      'এখনও কোন বুকমার্ক নেই.\nআপনার অবস্থান সংরক্ষণ করতে পড়ার সময় বুকমার্ক আইকনে আলতো চাপুন।';

  @override
  String get noTableOfContentsAvailable =>
      'বিষয়বস্তুর কোন সারণী পাওয়া যায় না';

  @override
  String pageLabel(int number) {
    return 'পৃষ্ঠা $number';
  }

  @override
  String get position => 'অবস্থান';

  @override
  String get bookReader => 'বই পাঠক';

  @override
  String formatExtension(String extension) {
    return 'বিন্যাস: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% পঠিত';
  }

  @override
  String get updating => 'আপডেট হচ্ছে...';

  @override
  String get markUnread => 'অপঠিত চিহ্নিত করুন';

  @override
  String get markAsRead => 'পঠিত হিসাবে চিহ্নিত করুন';

  @override
  String get reloadReader => 'রিডার রিলোড করুন';

  @override
  String get noPagesFound => 'কোন পেজ পাওয়া যায়নি.';

  @override
  String get failedToDecodePageImage => 'পৃষ্ঠার ছবি ডিকোড করতে ব্যর্থ হয়েছে৷';

  @override
  String resetZoom(String zoom) {
    return 'জুম রিসেট করুন (${zoom}x)';
  }

  @override
  String get singlePage => 'একক পৃষ্ঠা';

  @override
  String get twoPageSpread => 'দুই পৃষ্ঠার স্প্রেড';

  @override
  String get addBookmark => 'বুকমার্ক যোগ করুন';

  @override
  String get bookmarksEllipsis => 'বুকমার্ক...';

  @override
  String get markedAsRead => 'পঠিত হিসাবে চিহ্নিত করা হয়েছে৷';

  @override
  String get markedAsUnread => 'অপঠিত হিসাবে চিহ্নিত করা হয়েছে৷';

  @override
  String failedToUpdateReadState(String error) {
    return 'পঠিত অবস্থা আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get themeSystem => 'থিম: সিস্টেম';

  @override
  String get themeLight => 'থিম: হালকা';

  @override
  String get themeDark => 'থিম: অন্ধকার';

  @override
  String get themeSepia => 'থিম: সেপিয়া';

  @override
  String get invertColorsFixedLayout => 'উল্টানো রং (স্থির বিন্যাস)';

  @override
  String get invertColorsPdf => 'ইনভার্ট কালার (পিডিএফ)';

  @override
  String get preparingInAppReader => 'অ্যাপ-মধ্যস্থ পাঠক প্রস্তুত করা হচ্ছে...';

  @override
  String get pdfDataNotAvailable => 'PDF ডেটা উপলব্ধ নেই।';

  @override
  String get readerFallbackModeActive => 'রিডার ফলব্যাক মোড সক্রিয়';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'এই প্ল্যাটফর্মটি $extension ফাইলের জন্য এমবেডেড ডকুমেন্ট ইঞ্জিন হোস্ট করতে পারে না।';
  }

  @override
  String get reloadReaderPlatformHint =>
      'একটি সমর্থিত প্ল্যাটফর্ম টার্গেটে স্যুইচ করার পরে রিলোড রিডার ব্যবহার করুন (Android, iOS, macOS)।';

  @override
  String get openExternally => 'বাহ্যিকভাবে খুলুন';

  @override
  String get noEpubChaptersFound => 'কোনো EPUB অধ্যায় পাওয়া যায়নি।';

  @override
  String get readerNotReady => 'পাঠক প্রস্তুত নয়।';

  @override
  String get seriesRecordings => 'সিরিজ রেকর্ডিং';

  @override
  String get now => 'এখন';

  @override
  String get sports => 'খেলাধুলা';

  @override
  String get news => 'খবর';

  @override
  String get kids => 'বাচ্চাদের';

  @override
  String get premiere => 'প্রিমিয়ার';

  @override
  String get guideTimeline => 'গাইড টাইমলাইন';

  @override
  String failedToLoadGuide(String error) {
    return 'গাইড লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get noChannelsFound => 'কোনো চ্যানেল পাওয়া যায়নি';

  @override
  String get liveBadge => 'লাইভ';

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
  String get movie => 'মুভি';

  @override
  String get removedFromFavoriteChannels => 'প্রিয় চ্যানেল থেকে সরানো হয়েছে';

  @override
  String get addedToFavoriteChannels => 'প্রিয় চ্যানেল যোগ করা হয়েছে';

  @override
  String get failedToUpdateFavoriteChannel =>
      'প্রিয় চ্যানেল আপডেট করতে ব্যর্থ হয়েছে';

  @override
  String get unfavoriteChannel => 'অপছন্দের চ্যানেল';

  @override
  String get favoriteChannel => 'প্রিয় চ্যানেল';

  @override
  String get record => 'রেকর্ড';

  @override
  String get cancelRecordingAction => 'রেকর্ডিং বাতিল করুন';

  @override
  String get programSetToRecord => 'প্রোগ্রাম রেকর্ড সেট';

  @override
  String get recordingCancelled => 'রেকর্ডিং বাতিল করা হয়েছে';

  @override
  String get unableToCreateRecording => 'রেকর্ডিং তৈরি করতে অক্ষম৷';

  @override
  String get watch => 'ঘড়ি';

  @override
  String get close => 'বন্ধ';

  @override
  String failedToPlayChannel(String name) {
    return '$name খেলতে ব্যর্থ হয়েছে';
  }

  @override
  String get failedToLoadRecordings => 'রেকর্ডিং লোড করতে ব্যর্থ হয়েছে';

  @override
  String get scheduledInNext24Hours => 'পরবর্তী 24 ঘন্টার মধ্যে নির্ধারিত';

  @override
  String get recentRecordings => 'সাম্প্রতিক রেকর্ডিং';

  @override
  String get tvSeries => 'টিভি সিরিজ';

  @override
  String get failedToLoadSchedule => 'শিডিউল লোড করা যায়নি';

  @override
  String get noScheduledRecordings => 'কোন নির্ধারিত রেকর্ডিং';

  @override
  String get cancelRecording => 'রেকর্ডিং বাতিল করবেন?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return '\"$name\" এর নির্ধারিত রেকর্ডিং বাতিল করবেন?';
  }

  @override
  String get no => 'না';

  @override
  String get yesCancel => 'হ্যাঁ, বাতিল করুন';

  @override
  String get failedToCancelRecording => 'রেকর্ডিং বাতিল করতে ব্যর্থ হয়েছে';

  @override
  String get failedToLoadSeriesRecordings => 'সিরিজ রেকর্ডিং লোড করতে ব্যর্থ';

  @override
  String get noSeriesRecordings => 'কোনো সিরিজ রেকর্ডিং নেই';

  @override
  String get cancelSeriesRecording => 'সিরিজ রেকর্ডিং বাতিল করুন';

  @override
  String get cancelSeriesRecordingQuestion => 'সিরিজ রেকর্ডিং বাতিল করবেন?';

  @override
  String stopRecordingName(String name) {
    return '\"$name\" রেকর্ড করা বন্ধ করবেন?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'সিরিজ রেকর্ডিং বাতিল করতে ব্যর্থ হয়েছে';

  @override
  String get searchThisLibrary => 'এই লাইব্রেরিতে অনুসন্ধান করুন...';

  @override
  String get searchEllipsis => 'অনুসন্ধান করুন...';

  @override
  String noResultsForQuery(String query) {
    return '\"$query\" এর জন্য কোন ফলাফল নেই';
  }

  @override
  String searchFailedError(String error) {
    return 'অনুসন্ধান ব্যর্থ হয়েছে: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr অ্যাকাউন্টের ধরন';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'স্থানীয়';

  @override
  String get savedMedia => 'সংরক্ষিত মিডিয়া';

  @override
  String get tvShows => 'টিভি শো';

  @override
  String get music => 'সঙ্গীত';

  @override
  String get musicAlbums => 'মিউজিক অ্যালবাম';

  @override
  String get noMediaInFilter => 'এই ফিল্টারে কোনো মিডিয়া নেই৷';

  @override
  String get noDownloadedMediaYet => 'এখনও কোন ডাউনলোড করা মিডিয়া';

  @override
  String get browseLibrary => 'লাইব্রেরি ব্রাউজ করুন';

  @override
  String get deleteDownload => 'ডাউনলোড মুছুন';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\" এবং এর ফাইলগুলি সরান?';
  }

  @override
  String tracksCount(int count) {
    return '$count ট্র্যাক';
  }

  @override
  String get album => 'অ্যালবাম';

  @override
  String get playAlbum => 'অ্যালবাম চালান';

  @override
  String failedToLoadAlbum(String error) {
    return 'অ্যালবাম লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return '$name এর জন্য কোনো ডাউনলোড করা ট্র্যাক পাওয়া যায়নি।';
  }

  @override
  String get season => 'ঋতু';

  @override
  String get errorLoadingEpisodes => 'পর্বগুলি লোড করার সময় ত্রুটি৷';

  @override
  String get noDownloadedEpisodes => 'কোনো ডাউনলোড করা পর্ব নেই';

  @override
  String get deleteEpisode => 'পর্ব মুছুন';

  @override
  String removeName(String name) {
    return '\"$name\" সরান?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes মিনিট';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'পর্ব $number';
  }

  @override
  String get seriesNotFound => 'সিরিজ পাওয়া যায়নি';

  @override
  String get errorLoadingSeries => 'সিরিজ লোড করার সময় ত্রুটি';

  @override
  String get downloadedEpisodes => 'ডাউনলোড করা পর্ব';

  @override
  String seasonNumber(int number) {
    return 'ঋতু $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'বিশেষ';

  @override
  String get deleteSeason => 'সিজন মুছুন';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return '$season এ ডাউনলোড করা সমস্ত পর্ব মুছে ফেলবেন?';
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
  String get storageManagement => 'স্টোরেজ ম্যানেজমেন্ট';

  @override
  String get storageBreakdown => 'স্টোরেজ ব্রেকডাউন';

  @override
  String get downloadedItems => 'ডাউনলোড করা আইটেম';

  @override
  String get storageLimit => 'স্টোরেজ সীমা';

  @override
  String get noLimit => 'কোন সীমা নেই';

  @override
  String get deleteAllDownloads => 'সমস্ত ডাউনলোড মুছুন';

  @override
  String get deleteAllDownloadsWarning =>
      'এটি সমস্ত ডাউনলোড করা মিডিয়া ফাইল মুছে ফেলবে এবং পূর্বাবস্থায় ফেরানো যাবে না৷';

  @override
  String get deleteAll => 'সব মুছুন';

  @override
  String get deleteSelected => 'নির্বাচিত মুছুন';

  @override
  String deleteSelectedCount(int count) {
    return '$count ডাউনলোড করা আইটেম মুছবেন?';
  }

  @override
  String get musicAndAudiobooks => 'সঙ্গীত ও অডিওবুক';

  @override
  String get images => 'ছবি';

  @override
  String get database => 'ডাটাবেস';

  @override
  String ofStorageLimit(String limit) {
    return '$limit সীমা';
  }

  @override
  String get settings => 'সেটিংস';

  @override
  String get authentication => 'প্রমাণীকরণ';

  @override
  String get autoLoginServerManagement =>
      'স্বয়ংক্রিয় লগইন, সার্ভার ব্যবস্থাপনা';

  @override
  String get pinCode => 'পিন কোড';

  @override
  String get setUpPinCodeProtection => 'পিন কোড সুরক্ষা সেট আপ করুন৷';

  @override
  String get parentalControls => 'অভিভাবকীয় নিয়ন্ত্রণ';

  @override
  String get contentRatingRestrictions => 'বিষয়বস্তু রেটিং সীমাবদ্ধতা';

  @override
  String get bitRateResolutionBehavior => 'বিটরেট, রেজোলিউশন, আচরণ';

  @override
  String get languageSizeAppearance => 'ভাষা, আকার, চেহারা';

  @override
  String get qualityStorage => 'গুণমান, স্টোরেজ';

  @override
  String get serverSyncAndPluginStatus => 'সার্ভার সিঙ্ক এবং প্লাগইন অবস্থা';

  @override
  String get mediaRequestIntegration => 'মিডিয়া অনুরোধ ইন্টিগ্রেশন';

  @override
  String get switchServer => 'সার্ভার স্যুইচ করুন';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get versionLicenses => 'সংস্করণ, লাইসেন্স';

  @override
  String get account => 'হিসাব';

  @override
  String get signInAndSecurity => 'সাইন ইন এবং নিরাপত্তা';

  @override
  String get administration => 'প্রশাসন';

  @override
  String get serverSettingsUsersLibraries =>
      'সার্ভার সেটিংস, ব্যবহারকারী, লাইব্রেরি';

  @override
  String get customization => 'কাস্টমাইজেশন';

  @override
  String get themeAndLayout => 'থিম এবং বিন্যাস';

  @override
  String get videoAndSubtitles => 'ভিডিও এবং সাবটাইটেল';

  @override
  String get integrations => 'ইন্টিগ্রেশন';

  @override
  String get pluginAndRequests => 'প্লাগইন এবং অনুরোধ';

  @override
  String get customizeAccountPlaybackInterface =>
      'অ্যাকাউন্ট, প্লেব্যাক এবং ইন্টারফেস আচরণ কাস্টমাইজ করুন';

  @override
  String optionsCount(int count) {
    return '$count বিকল্প';
  }

  @override
  String get themeAndAppearance => 'থিম এবং চেহারা';

  @override
  String get focusBorderColor => 'ফোকাস বর্ডার রঙ';

  @override
  String get watchedIndicators => 'প্রেক্ষিত সূচক';

  @override
  String get always => 'সর্বদা';

  @override
  String get hideUnwatched => 'লুকান Unwatched';

  @override
  String get episodesOnly => 'শুধুমাত্র পর্ব';

  @override
  String get never => 'কখনই না';

  @override
  String get focusExpansionAnimation => 'ফোকাস সম্প্রসারণ অ্যানিমেশন';

  @override
  String get desktopUiScale => 'ডেস্কটপ UI স্কেল';

  @override
  String get scaleFocusedCards => 'স্কেল ফোকাসড বা হোভার্ড কার্ড এবং টাইলস';

  @override
  String get backgroundBackdrops => 'ব্যাকগ্রাউন্ড ব্যাকড্রপ';

  @override
  String get showBackdropImages => 'বিষয়বস্তুর পিছনে ব্যাকড্রপ ছবি দেখান';

  @override
  String get seriesThumbnails => 'সিরিজ থাম্বনেল';

  @override
  String get seriesThumbnailsDescription =>
      'শুধুমাত্র পর্বগুলি: সিরিজ আর্টওয়ার্ক ব্যবহার করুন যা প্রতিটি সারির চিত্রের প্রকারের সাথে মেলে';

  @override
  String get homeRowInfoOverlay => 'হোম সারি তথ্য ওভারলে';

  @override
  String get showTitleMetadataOnHomeRows =>
      'হোম সারি ব্রাউজ করার সময় শিরোনাম এবং মেটাডেটা দেখান';

  @override
  String get clockDisplay => 'ঘড়ি প্রদর্শন';

  @override
  String get inMenus => 'মেনুতে';

  @override
  String get inVideo => 'ভিডিওতে';

  @override
  String get seasonalEffects => 'মৌসুমি প্রভাব';

  @override
  String get seasonalEffectsDescription => 'ভিজ্যুয়াল এফেক্ট এবং ঋতু সজ্জা';

  @override
  String get snow => 'তুষার';

  @override
  String get fireworks => 'আতশবাজি';

  @override
  String get confetti => 'কনফেটি';

  @override
  String get fallingLeaves => 'ঝরে পড়া পাতা';

  @override
  String get themeMusic => 'থিম সঙ্গীত';

  @override
  String get playThemeMusicOnDetailPages =>
      'বিস্তারিত পৃষ্ঠাগুলিতে থিম সঙ্গীত চালান';

  @override
  String get themeMusicVolume => 'থিম মিউজিক ভলিউম';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'হোম সারি থিম সঙ্গীত';

  @override
  String get playWhenBrowsingHomeScreen => 'হোম স্ক্রীন ব্রাউজ করার সময় খেলুন';

  @override
  String get detailsBackgroundBlur => 'বিশদ বিবরণ পটভূমি ঝাপসা';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'ব্রাউজিং ব্যাকগ্রাউন্ড ব্লার';

  @override
  String get maxStreamingBitrate => 'সর্বোচ্চ স্ট্রিমিং বিটরেট';

  @override
  String get maxResolution => 'সর্বোচ্চ রেজোলিউশন';

  @override
  String get playerZoomMode => 'প্লেয়ার জুম মোড';

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
  String get fit => 'ফিট';

  @override
  String get autoCrop => 'অটো ক্রপ';

  @override
  String get stretch => 'প্রসারিত';

  @override
  String get refreshRateSwitching => 'রিফ্রেশ হার সুইচিং';

  @override
  String get disabled => 'অক্ষম';

  @override
  String get scaleOnTv => 'টিভিতে স্কেল';

  @override
  String get scaleOnDevice => 'ডিভাইসে স্কেল';

  @override
  String get trickPlay => 'ট্রিক প্লে';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'খোঁজার সময় পূর্বরূপ থাম্বনেল দেখান';

  @override
  String get showDescriptionOnPause => 'পজ এ বর্ণনা দেখান';

  @override
  String get dimVideoShowOverview =>
      'পজ করার সময় ভিডিও ম্লান করুন এবং ওভারভিউ টেক্সট দেখান';

  @override
  String get osdLockButton => 'ওএসডি লক বোতাম';

  @override
  String get osdLockButtonDescription =>
      'একটি লক বোতাম দেখান যা দীর্ঘক্ষণ চাপ না হওয়া পর্যন্ত স্পর্শ ইনপুটকে অবরুদ্ধ করে';

  @override
  String get audioBehavior => 'অডিও আচরণ';

  @override
  String get downmixToStereo => 'ডাউনমিক্স থেকে স্টেরিও';

  @override
  String get defaultAudioLanguage => 'ডিফল্ট অডিও ভাষা';

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
  String get autoServerDefault => 'স্বয়ংক্রিয় (সার্ভার ডিফল্ট)';

  @override
  String get english => 'ইংরেজি';

  @override
  String get spanish => 'স্প্যানিশ';

  @override
  String get french => 'ফরাসি';

  @override
  String get german => 'জার্মান';

  @override
  String get italian => 'ইতালীয়';

  @override
  String get portuguese => 'পর্তুগিজ';

  @override
  String get japanese => 'জাপানিজ';

  @override
  String get korean => 'কোরিয়ান';

  @override
  String get chinese => 'চাইনিজ';

  @override
  String get russian => 'রাশিয়ান';

  @override
  String get arabic => 'আরবি';

  @override
  String get hindi => 'হিন্দি';

  @override
  String get dutch => 'ডাচ';

  @override
  String get swedish => 'সুইডিশ';

  @override
  String get norwegian => 'নরওয়েজিয়ান';

  @override
  String get danish => 'ড্যানিশ';

  @override
  String get finnish => 'ফিনিশ';

  @override
  String get polish => 'পোলিশ';

  @override
  String get ac3Passthrough => 'AC3 পাসথ্রু';

  @override
  String get dtsPassthrough => 'ডিটিএস পাসথ্রু';

  @override
  String get trueHdSupport => 'TrueHD সমর্থন';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS অডিও শুধুমাত্র AVR থেকে; রিসিভার সমর্থন এবং DTS উৎস ট্র্যাক প্রয়োজন';

  @override
  String get enableTrueHdAudio =>
      'TrueHD অডিও সক্ষম করুন (সব প্ল্যাটফর্মে কাজ নাও করতে পারে)';

  @override
  String get settingsAudioOutputMode => 'অডিও আউটপুট মোড';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR পাসথ্রু';

  @override
  String get settingsAudioFallbackCodec => 'অডিও ফলব্যাক কোডেক';

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
  String get settingsAudioPassthroughAdvanced => 'পাসথ্রু (উন্নত)';

  @override
  String get settingsAudioCodecPassthrough => 'কোডেক পাসথ্রু';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'শুধুমাত্র আপনার AVR বা HDMI সিঙ্ক সমর্থন করে এমন ফর্ম্যাটগুলি সক্ষম করুন৷';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 পাসথ্রু';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) পাসথ্রু';

  @override
  String get settingsAudioDtsCorePassthrough => 'ডিটিএস কোর পাসথ্রু';

  @override
  String get settingsAudioDtsHdPassthrough => 'ডিটিএস-এইচডি এমএ পাসথ্রু';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD পাসথ্রু';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos পাসথ্রু';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'বিটস্ট্রিম ডলবি ডিজিটাল প্লাস (EAC3) থেকে বাহ্যিক ডিকোডার।';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'বিটস্ট্রিম ডলবি অ্যাটমোস ওভার EAC3 (JOC) থেকে এক্সটার্নাল ডিকোডার।';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'বিটস্ট্রিম ডিটিএস-এইচডি এমএ (ডিটিএস কোর অন্তর্ভুক্ত) থেকে বাহ্যিক ডিকোডার।';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'বাহ্যিক ডিকোডারে Atmos মেটাডেটা সহ Bitstream Dolby TrueHD।';

  @override
  String get settingsDetectedAudioCapabilities => 'সনাক্ত করা অডিও ক্ষমতা';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'কোন রানটাইম ক্ষমতা স্ন্যাপশট এখনও উপলব্ধ.';

  @override
  String get settingsAudioRouteLabel => 'রুট';

  @override
  String get settingsAudioDecodeLabel => 'ডিকোড';

  @override
  String get settingsAudioPassthroughLabel => 'পাসথ্রু';

  @override
  String get settingsAudioHdRoute => 'এইচডি অডিও রুট';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'ব্লুটুথ';

  @override
  String get settingsAudioRouteSpeaker => 'স্পিকার';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'ডায়াগনস্টিকস';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'ভিডিও লেভেল';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'ভিডিও পরিসীমা';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'সাবটাইটেল কোডেক';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'অনুমোদিত অডিও কোডেক';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'HLS MPEG-TS অডিও কোডেক';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'HLS fMP4 অডিও কোডেক';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'অডিও-এসপিডিএফ পাসথ্রু';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'সক্রিয় অডিও রুট';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'রুট এইচডি অডিও সমর্থন';

  @override
  String get nightMode => 'নাইট মোড';

  @override
  String get compressDynamicRange => 'গতিশীল পরিসীমা সংকুচিত করুন';

  @override
  String get advancedMpv => 'উন্নত mpv';

  @override
  String get enableCustomMpvConf => 'কাস্টম mpv.conf সক্ষম করুন';

  @override
  String get applyMpvConfBeforePlayback =>
      'প্লেব্যাক শুরু করার আগে একটি ব্যবহারকারী-নির্দিষ্ট mpv.conf প্রয়োগ করুন';

  @override
  String get unsafeAdvancedMpvOptions => 'অনিরাপদ উন্নত mpv বিকল্প';

  @override
  String get unsafeMpvOptionsDescription =>
      'mpv বিকল্পগুলির একটি বিস্তৃত সেটের অনুমতি দিন। প্লেব্যাক আচরণ ভাঙতে পারে।';

  @override
  String get hardwareDecoding => 'হার্ডওয়্যার ডিকোডিং';

  @override
  String get hardwareDecodingSubtitle =>
      'কর্মক্ষমতা উন্নত করতে পারে কিন্তু কিছু ডিভাইসে প্লেব্যাকের সমস্যা হতে পারে।';

  @override
  String get nextUpAndQueuing => 'পরবর্তী আপ এবং সারিবদ্ধ';

  @override
  String get nextUpDisplay => 'নেক্সট আপ ডিসপ্লে';

  @override
  String get extended => 'বর্ধিত';

  @override
  String get minimal => 'ন্যূনতম';

  @override
  String get nextUpTimeout => 'নেক্সট আপ টাইমআউট';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'মিডিয়া সারিবদ্ধ';

  @override
  String get autoQueueNextEpisodes => 'পরের পর্বগুলি স্বয়ংক্রিয়-সারি';

  @override
  String get stillWatchingPrompt => 'এখনও প্রম্পট দেখছেন';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return '$episodes পর্বের পরে / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'পুনরায় শুরু করুন এবং এড়িয়ে যান';

  @override
  String get resumeRewind => 'রিওয়াইন্ড পুনরায় শুরু করুন';

  @override
  String get unpauseRewind => 'রিওয়াইন্ড আনপজ করুন';

  @override
  String get fiveSeconds => '5 সেকেন্ড';

  @override
  String get tenSeconds => '10 সেকেন্ড';

  @override
  String get fifteenSeconds => '15 সেকেন্ড';

  @override
  String get thirtySeconds => '30 সেকেন্ড';

  @override
  String get skipBackLength => 'পিছনের দৈর্ঘ্য এড়িয়ে যান';

  @override
  String get skipForwardLength => 'এগিয়ে যান দৈর্ঘ্য';

  @override
  String get customMpvConfPath => 'কাস্টম mpv.conf পাথ';

  @override
  String get notSetMpvConf =>
      'সেট করা হয়নি। Moonfin অ্যাপ/ডেটা ফোল্ডারে একটি ডিফল্ট mpv.conf চেষ্টা করবে।';

  @override
  String get selectMpvConf => 'mpv.conf নির্বাচন করুন';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'স্টাইল সেটিংস (আকার, রঙ, অফসেট) পাঠ্য-ভিত্তিক সাবটাইটেলগুলিতে (SRT, VTT, TTML) প্রযোজ্য। ASS/SSA সাবটাইটেলগুলি তাদের নিজস্ব এমবেডেড স্টাইলিং ব্যবহার করে যদি না \"ASS/SSA ডাইরেক্ট প্লে\" বন্ধ করা থাকে। বিটম্যাপ সাবটাইটেল (PGS, DVB, VobSub) রিস্টাইল করা যাবে না।';

  @override
  String get defaultSubtitleLanguage => 'ডিফল্ট সাবটাইটেল ভাষা';

  @override
  String get defaultToNoSubtitles => 'কোন সাবটাইটেল না ডিফল্ট';

  @override
  String get turnOffSubtitlesByDefault => 'ডিফল্টরূপে সাবটাইটেল বন্ধ করুন';

  @override
  String get subtitleSize => 'সাবটাইটেল সাইজ';

  @override
  String get textFillColor => 'টেক্সট ফিল কালার';

  @override
  String get backgroundColor => 'পটভূমির রঙ';

  @override
  String get textStrokeColor => 'টেক্সট স্ট্রোক রঙ';

  @override
  String get subtitleCustomization => 'সাবটাইটেল কাস্টমাইজেশন';

  @override
  String get subtitleCustomizationDescription =>
      'সাবটাইটেল চেহারা কাস্টমাইজ করুন';

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
      'দ্রুত বাদামী শিয়াল অলস কুকুরের উপর ঝাঁপিয়ে পড়ে';

  @override
  String get verticalOffset => 'উল্লম্ব অফসেট';

  @override
  String get pgsDirectPlay => 'পিজিএস ডাইরেক্ট প্লে';

  @override
  String get directPlayPgsSubtitles => 'সরাসরি খেলা PGS সাবটাইটেল';

  @override
  String get assSsaDirectPlay => 'ASS/SSA সরাসরি খেলা';

  @override
  String get directPlayAssSsaSubtitles => 'সরাসরি খেলা ASS/SSA সাবটাইটেল';

  @override
  String get white => 'সাদা';

  @override
  String get black => 'কালো';

  @override
  String get yellow => 'হলুদ';

  @override
  String get green => 'সবুজ';

  @override
  String get cyan => 'সায়ান';

  @override
  String get red => 'লাল';

  @override
  String get transparent => 'স্বচ্ছ';

  @override
  String get semiTransparentBlack => 'আধা-স্বচ্ছ কালো';

  @override
  String get global => 'গ্লোবাল';

  @override
  String get desktop => 'ডেস্কটপ';

  @override
  String get mobile => 'মোবাইল';

  @override
  String get tv => 'টিভি';

  @override
  String loadedProfileSettings(String profile) {
    return '$profile প্রোফাইল সেটিংস লোড হয়েছে৷';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile প্রোফাইল সেটিংস লোড করতে ব্যর্থ হয়েছে৷';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return '$profile প্রোফাইলে স্থানীয় সেটিংস সিঙ্ক করা হয়েছে।';
  }

  @override
  String get customizationProfile => 'কাস্টমাইজেশন প্রোফাইল';

  @override
  String get customizationProfileDescription =>
      'লোড, সম্পাদনা এবং সিঙ্ক করার জন্য প্রোফাইলটি বেছে নিন। গ্লোবাল সর্বত্র প্রযোজ্য যদি না একটি ডিভাইস প্রোফাইল এটিকে ওভাররাইড করে। সবুজ বিন্দু আপনার বর্তমান ডিভাইস প্রোফাইল চিহ্নিত করে।';

  @override
  String get loadProfile => 'প্রোফাইল লোড করুন';

  @override
  String get syncing => 'সিঙ্ক হচ্ছে...';

  @override
  String get syncToProfile => 'প্রোফাইলে সিঙ্ক করুন';

  @override
  String get profileSyncHidden => 'প্রোফাইল সিঙ্ক লুকানো';

  @override
  String get enablePluginSyncDescription =>
      'এখানে প্রোফাইল নিয়ন্ত্রণগুলি দেখাতে প্লাগইন সেটিংসে সার্ভার প্লাগইন সিঙ্ক সক্ষম করুন৷';

  @override
  String get quality => 'গুণমান';

  @override
  String get defaultDownloadQuality => 'ডিফল্ট ডাউনলোড গুণমান';

  @override
  String get network => 'নেটওয়ার্ক';

  @override
  String get wifiOnlyDownloads => 'শুধুমাত্র ওয়াইফাই ডাউনলোড';

  @override
  String get onlyDownloadOnWifi =>
      'শুধুমাত্র WiFi এর সাথে সংযুক্ত হলেই ডাউনলোড করুন';

  @override
  String get storage => 'স্টোরেজ';

  @override
  String get storageUsed => 'স্টোরেজ ব্যবহার করা হয়েছে';

  @override
  String get manage => 'পরিচালনা করুন';

  @override
  String get calculating => 'গণনা করা হচ্ছে...';

  @override
  String get downloadLocation => 'অবস্থান ডাউনলোড করুন';

  @override
  String get defaultLabel => 'ডিফল্ট';

  @override
  String get saveToDownloadsFolder => 'ডাউনলোড ফোল্ডারে সংরক্ষণ করুন';

  @override
  String get downloadsVisibleToOtherApps =>
      'ডাউনলোড/Moonfin — অন্যান্য অ্যাপে দৃশ্যমান';

  @override
  String get dangerZone => 'ডেঞ্জার জোন';

  @override
  String get clearAllDownloads => 'সমস্ত ডাউনলোড সাফ করুন';

  @override
  String get original => 'আসল';

  @override
  String get changeDownloadLocation => 'ডাউনলোডের অবস্থান পরিবর্তন করুন';

  @override
  String get changeDownloadLocationDescription =>
      'নতুন ডাউনলোডগুলি নির্বাচিত ফোল্ডারে সংরক্ষণ করা হবে৷ বিদ্যমান ডাউনলোডগুলি তাদের বর্তমান অবস্থানে থাকবে এবং স্টোরেজ সেটিংস থেকে পরিচালনা করা যেতে পারে৷';

  @override
  String get confirm => 'নিশ্চিত করুন';

  @override
  String get cannotWriteToFolder =>
      'নির্বাচিত ফোল্ডারে লেখা যাবে না। অনুগ্রহ করে একটি ভিন্ন অবস্থান চয়ন করুন বা সঞ্চয়স্থানের অনুমতি দিন৷';

  @override
  String get saveToDownloadsFolderQuestion => 'ডাউনলোড ফোল্ডারে সংরক্ষণ করবেন?';

  @override
  String get saveToDownloadsFolderDescription =>
      'ডাউনলোড করা মিডিয়া আপনার ডিভাইসে ডাউনলোড/Moonfin এ সংরক্ষণ করা হবে। এই ফাইলগুলি অন্যান্য অ্যাপ যেমন আপনার গ্যালারি বা মিউজিক প্লেয়ারে দৃশ্যমান হবে।\n\nবিদ্যমান ডাউনলোডগুলি তাদের বর্তমান অবস্থানে থাকবে৷';

  @override
  String get enable => 'সক্ষম করুন';

  @override
  String get clearAllDownloadsWarning =>
      'এটি সমস্ত ডাউনলোড করা মিডিয়া মুছে ফেলবে এবং পূর্বাবস্থায় ফেরানো যাবে না৷';

  @override
  String get clearAll => 'সব সাফ করুন';

  @override
  String get navigationStyle => 'নেভিগেশন শৈলী';

  @override
  String get topBar => 'শীর্ষ বার';

  @override
  String get leftSidebar => 'বাম সাইডবার';

  @override
  String get showShuffleButton => 'শাফেল বোতাম দেখান';

  @override
  String get showGenresButton => 'ধরন বোতাম দেখান';

  @override
  String get showFavoritesButton => 'ফেভারিট বোতাম দেখান';

  @override
  String get showLibrariesInToolbar => 'টুলবারে লাইব্রেরি দেখান';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'নববার অস্বচ্ছতা';

  @override
  String get navbarColor => 'নববার রঙ';

  @override
  String get gray => 'ধূসর';

  @override
  String get darkBlue => 'গাঢ় নীল';

  @override
  String get purple => 'বেগুনি';

  @override
  String get teal => 'টিল';

  @override
  String get navy => 'নৌবাহিনী';

  @override
  String get charcoal => 'কাঠকয়লা';

  @override
  String get brown => 'বাদামী';

  @override
  String get darkRed => 'গাঢ় লাল';

  @override
  String get darkGreen => 'গাঢ় সবুজ';

  @override
  String get slate => 'স্লেট';

  @override
  String get indigo => 'নীল';

  @override
  String get libraryDisplay => 'লাইব্রেরি ডিসপ্লে';

  @override
  String get posterLabel => 'পোস্টার';

  @override
  String get thumbnailLabel => 'থাম্বনেইল';

  @override
  String get bannerLabel => 'ব্যানার';

  @override
  String get overridePerLibrarySettings =>
      'প্রতি-লাইব্রেরি সেটিংস ওভাররাইড করুন';

  @override
  String get applyImageTypeToAllLibraries =>
      'সমস্ত লাইব্রেরিতে চিত্রের ধরন প্রয়োগ করুন';

  @override
  String get multiServerLibraries => 'মাল্টি-সার্ভার লাইব্রেরি';

  @override
  String get showLibrariesFromAllServers =>
      'সমস্ত সংযুক্ত সার্ভার থেকে লাইব্রেরি দেখান';

  @override
  String get enableFolderView => 'ফোল্ডার ভিউ সক্ষম করুন';

  @override
  String get showFolderBrowsingOption => 'ফোল্ডার ব্রাউজিং অপশন দেখান';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'লাইব্রেরি দৃশ্যমানতা';

  @override
  String get libraryVisibilityDescription =>
      'লাইব্রেরি প্রতি হোম পেজ দৃশ্যমানতা টগল করুন। পরিবর্তনগুলি কার্যকর করার জন্য Moonfin পুনরায় চালু করুন৷';

  @override
  String get showInNavigation => 'নেভিগেশন দেখান';

  @override
  String get showInLatestMedia => 'সাম্প্রতিক মিডিয়াতে দেখান';

  @override
  String get sourceLibraries => 'উৎস লাইব্রেরি';

  @override
  String get sourceCollections => 'উৎস সংগ্রহ';

  @override
  String get excludedGenres => 'বর্জিত জেনারস';

  @override
  String get selectAll => 'সব নির্বাচন করুন';

  @override
  String itemsSelected(int count) {
    return '$count নির্বাচিত';
  }

  @override
  String get mediaBar => 'মিডিয়া বার';

  @override
  String get mediaSources => 'মিডিয়া সূত্র';

  @override
  String get behavior => 'আচরণ';

  @override
  String get seconds => 'সেকেন্ড';

  @override
  String get localPreviews => 'স্থানীয় পূর্বরূপ';

  @override
  String get localPreviewsDescription =>
      'ট্রেলার, মিডিয়া এবং অডিও প্রিভিউ কনফিগার করুন।';

  @override
  String get mediaBarMode => 'মিডিয়া বার স্টাইল';

  @override
  String get mediaBarModeDescription =>
      'Moonfin, MakD এর মধ্যে বেছে নিন অথবা মিডিয়া বার বন্ধ করুন';

  @override
  String get mediaBarModeMoonfin => 'মুনফিন';

  @override
  String get mediaBarModeMakd => 'ম্যাকডি';

  @override
  String get mediaBarModeOff => 'বন্ধ';

  @override
  String get enableMediaBar => 'মিডিয়া বার সক্রিয় করুন';

  @override
  String get showFeaturedContentSlideshow =>
      'বাড়িতে বৈশিষ্ট্যযুক্ত বিষয়বস্তু স্লাইডশো দেখান';

  @override
  String get contentType => 'বিষয়বস্তুর প্রকার';

  @override
  String get moviesAndTvShows => 'সিনেমা ও টিভি শো';

  @override
  String get moviesOnly => 'শুধুমাত্র সিনেমা';

  @override
  String get tvShowsOnly => 'শুধুমাত্র টিভি শো';

  @override
  String get itemCount => 'আইটেম গণনা';

  @override
  String get noneSelected => 'কোনোটিই নির্বাচিত নয়';

  @override
  String get noneExcluded => 'কোনোটাই বাদ যায়নি';

  @override
  String get autoAdvance => 'অটো অ্যাডভান্স';

  @override
  String get autoAdvanceSlides => 'স্বয়ংক্রিয়ভাবে পরবর্তী স্লাইডে অগ্রসর হন';

  @override
  String get autoAdvanceInterval => 'অটো অ্যাডভান্স ইন্টারভাল';

  @override
  String get trailerPreview => 'ট্রেলার প্রিভিউ';

  @override
  String get autoPlayTrailers =>
      '3 সেকেন্ড পরে মিডিয়া বারে অটো-প্লে ট্রেলারগুলি৷';

  @override
  String get episodePreview => 'পর্বের পূর্বরূপ';

  @override
  String get mediaPreview => 'মিডিয়া প্রিভিউ';

  @override
  String get episodePreviewDescription =>
      'একটি 30-সেকেন্ডের ইনলাইন প্রিভিউ খেলুন ফোকাস করা, হোভার করা, বা দীর্ঘ চাপ দেওয়া কার্ড';

  @override
  String get mediaPreviewDescription =>
      'একটি 30-সেকেন্ডের ইনলাইন প্রিভিউ খেলুন ফোকাস করা, হোভার করা, বা দীর্ঘ চাপ দেওয়া কার্ড';

  @override
  String get previewAudio => 'পূর্বরূপ অডিও';

  @override
  String get enablePreviewAudio =>
      'ট্রেলার এবং পর্বের পূর্বরূপের জন্য অডিও সক্ষম করুন৷';

  @override
  String get latestMedia => 'সর্বশেষ মিডিয়া';

  @override
  String get recentlyReleased => 'সম্প্রতি মুক্তি পেয়েছে';

  @override
  String get myMedia => 'আমার মিডিয়া';

  @override
  String get myMediaSmall => 'আমার মিডিয়া (ছোট)';

  @override
  String get continueWatching => 'দেখা চালিয়ে যান';

  @override
  String get resumeAudio => 'অডিও পুনরায় শুরু করুন';

  @override
  String get resumeBooks => 'পুনঃসূচনা বই';

  @override
  String get activeRecordings => 'সক্রিয় রেকর্ডিং';

  @override
  String get playlists => 'প্লেলিস্ট';

  @override
  String get liveTV => 'লাইভ টিভি';

  @override
  String get homeSections => 'হোম বিভাগ';

  @override
  String get resetToDefaults => 'ডিফল্টে রিসেট করুন';

  @override
  String get homeRowPosterSize => 'হোম সারি পোস্টার সাইজ';

  @override
  String get perRowImageTypeSelection => 'প্রতি সারি ইমেজ টাইপ নির্বাচন';

  @override
  String get configureImageTypeForEachRow =>
      'প্রতিটি সক্রিয় হোম সারির জন্য চিত্রের প্রকার কনফিগার করুন';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'দেখা চালিয়ে যান এবং পরবর্তী আপ মার্জ করুন';

  @override
  String get combineBothRows => 'একটি একক হোম বিভাগে উভয় সারি একত্রিত করুন';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'প্রতি সারি ইমেজ টাইপ';

  @override
  String get perRowSettings => 'প্রতি-সারি সেটিংস';

  @override
  String get autoLogin => 'স্বয়ংক্রিয় লগইন';

  @override
  String get lastUser => 'শেষ ব্যবহারকারী';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'সর্বদা প্রমাণীকরণ';

  @override
  String get requirePasswordWithToken =>
      'এমনকি সঞ্চিত টোকেন সহ পাসওয়ার্ড প্রয়োজন';

  @override
  String get confirmExit => 'প্রস্থান নিশ্চিত করুন';

  @override
  String get showConfirmationBeforeExiting =>
      'প্রস্থান করার আগে নিশ্চিতকরণ দেখান';

  @override
  String get blockContentWithRatings =>
      'নিম্নলিখিত রেটিং সহ সামগ্রী ব্লক করুন:';

  @override
  String get noContentRatingsFound =>
      'এই সার্ভারে এখনও কোন বিষয়বস্তুর রেটিং পাওয়া যায়নি।';

  @override
  String get couldNotLoadServerRatings =>
      'সার্ভার রেটিং লোড করা যায়নি. শুধুমাত্র সংরক্ষিত রেটিং দেখানো হচ্ছে।';

  @override
  String get couldNotRefreshRatings =>
      'সার্ভার থেকে রেটিং রিফ্রেশ করা যায়নি. সংরক্ষিত রেটিং দেখাচ্ছে।';

  @override
  String get enablePinCode => 'পিন কোড সক্ষম করুন';

  @override
  String get requirePinToAccess =>
      'আপনার অ্যাকাউন্ট অ্যাক্সেস করার জন্য একটি পিন প্রয়োজন৷';

  @override
  String get changePin => 'পিন পরিবর্তন করুন';

  @override
  String get setNewPinCode => 'একটি নতুন পিন কোড সেট করুন';

  @override
  String get removePin => 'পিন সরান';

  @override
  String get removePinProtection => 'পিন কোড সুরক্ষা সরান';

  @override
  String get screensaver => 'স্ক্রিনসেভার';

  @override
  String get inAppScreensaver => 'ইন-অ্যাপ স্ক্রিনসেভার';

  @override
  String get enableBuiltInScreensaver =>
      'অন্তর্নির্মিত স্ক্রিনসেভার সক্রিয় করুন';

  @override
  String get mode => 'মোড';

  @override
  String get libraryArt => 'লাইব্রেরি আর্ট';

  @override
  String get logo => 'লোগো';

  @override
  String get clock => 'ঘড়ি';

  @override
  String get timeout => 'টাইম আউট';

  @override
  String minutesShort(int minutes) {
    return '$minutes মিনিট';
  }

  @override
  String get dimmingLevel => 'ডিমিং লেভেল';

  @override
  String get maxAgeRating => 'সর্বোচ্চ বয়স রেটিং';

  @override
  String get any => 'যে কোন';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'বয়স রেটিং প্রয়োজন';

  @override
  String get onlyShowRatedContent => 'শুধুমাত্র রেট করা বিষয়বস্তু দেখান';

  @override
  String get showClock => 'ঘড়ি দেখান';

  @override
  String get displayClockDuringScreensaver =>
      'স্ক্রিনসেভার চলাকালীন ঘড়ি প্রদর্শন করুন';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'পচা টমেটো (সমালোচক)';

  @override
  String get rottenTomatoesAudience => 'পচা টমেটো (শ্রোতা)';

  @override
  String get imdb => 'আইএমডিবি';

  @override
  String get tmdb => 'টিএমডিবি';

  @override
  String get metacritic => 'মেটাক্রিটিক';

  @override
  String get metacriticUser => 'মেটাক্রিটিক (ব্যবহারকারী)';

  @override
  String get trakt => 'ট্র্যাক্ট';

  @override
  String get letterboxd => 'লেটারবক্সডি';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'অ্যানিলিস্ট';

  @override
  String get communityRating => 'সম্প্রদায় রেটিং';

  @override
  String get ratings => 'রেটিং';

  @override
  String get additionalRatings => 'অতিরিক্ত রেটিং';

  @override
  String get showMdbListAndTmdbRatings => 'MDBList এবং TMDB রেটিং দেখান';

  @override
  String get ratingLabels => 'রেটিং লেবেল';

  @override
  String get showLabelsNextToIcons => 'রেটিং আইকনগুলির পাশে লেবেলগুলি দেখান৷';

  @override
  String get ratingBadges => 'রেটিং ব্যাজ';

  @override
  String get showDecorativeBadges => 'রেটিং পিছনে আলংকারিক ব্যাজ দেখান';

  @override
  String get episodeRatings => 'পর্ব রেটিং';

  @override
  String get showRatingsOnEpisodes => 'পৃথক পর্বে রেটিং দেখান';

  @override
  String get ratingSources => 'রেটিং সূত্র';

  @override
  String get ratingSourcesDescription =>
      'অ্যাপ্লিকেশান জুড়ে দেখানো রেটিং উত্সগুলি সক্ষম করুন এবং পুনরায় সাজান৷';

  @override
  String get pluginLabel => 'প্লাগইন';

  @override
  String get pluginDetected => 'প্লাগইন শনাক্ত হয়েছে';

  @override
  String get pluginNotDetected => 'প্লাগইন সনাক্ত করা যায়নি';

  @override
  String get pluginDetectedDescription =>
      'সার্ভার প্লাগইন সনাক্ত করা হয়েছে. প্রথমবার প্লাগইনটি পাওয়া গেলে সিঙ্ক স্বয়ংক্রিয়ভাবে সক্ষম হয়৷';

  @override
  String get pluginNotDetectedDescription =>
      'সার্ভার প্লাগইন বর্তমানে সনাক্ত করা হয়নি. স্থানীয় সেটিংস এখনও তাদের সংরক্ষিত মান বা বিল্ট-ইন ডিফল্ট ব্যবহার করে।';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nসংস্করণ: $version';
  }

  @override
  String get availableServices => 'উপলব্ধ সেবা';

  @override
  String get serverPluginSync => 'সার্ভার প্লাগইন সিঙ্ক';

  @override
  String get syncSettingsWithPlugin => 'সার্ভার প্লাগইনের সাথে সিঙ্ক সেটিংস';

  @override
  String get whatSyncControls => 'কি সিঙ্ক নিয়ন্ত্রণ';

  @override
  String get syncControlsDescription =>
      'সিঙ্ক শুধুমাত্র নিয়ন্ত্রণ করে যে প্লাগইন-ব্যাকড সেটিংস সার্ভার থেকে ধাক্কা দেওয়া এবং টানা হয় কিনা। প্লাগইন সিঙ্ক সক্ষম হলে প্রোফাইল নির্বাচন এবং প্রোফাইল সিঙ্ক অ্যাকশনগুলি কাস্টমাইজেশন সেটিংসে থাকে৷';

  @override
  String get recentRequests => 'সাম্প্রতিক অনুরোধ';

  @override
  String get recentlyAdded => 'সম্প্রতি যোগ করা হয়েছে';

  @override
  String get trending => 'প্রবণতা';

  @override
  String get popularMovies => 'জনপ্রিয় সিনেমা';

  @override
  String get movieGenres => 'সিনেমার ধরন';

  @override
  String get upcomingMovies => 'আসন্ন সিনেমা';

  @override
  String get studios => 'স্টুডিও';

  @override
  String get popularSeries => 'জনপ্রিয় সিরিজ';

  @override
  String get seriesGenres => 'সিরিজ জেনারস';

  @override
  String get upcomingSeries => 'আসন্ন সিরিজ';

  @override
  String get networks => 'নেটওয়ার্ক';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'সারি ডিফল্টে রিসেট করুন';

  @override
  String get enableSeerr => 'Seerr সক্ষম করুন';

  @override
  String get showSeerrInNavigation =>
      'নেভিগেশনে Seerr দেখান (সার্ভার প্লাগইন প্রয়োজন)';

  @override
  String get seerrUnavailable =>
      'অনুপলব্ধ কারণ সার্ভার প্লাগইন Seerr সমর্থন অক্ষম করা হয়েছে৷';

  @override
  String get nsfwFilter => 'NSFW ফিল্টার';

  @override
  String get hideAdultContent => 'ফলাফলে প্রাপ্তবয়স্কদের সামগ্রী লুকান';

  @override
  String loggedInAs(String username) {
    return 'লগ ইন করেছেন: $username';
  }

  @override
  String get discoverRows => 'সারি আবিষ্কার করুন';

  @override
  String get discoverRowsDescriptionPlugin =>
      'পুনরায় সাজাতে টেনে আনুন। সারিগুলি সক্ষম বা অক্ষম করুন৷ সক্ষম সারি অর্ডার Moonfin প্লাগইনের সাথে সিঙ্ক করে।';

  @override
  String get discoverRowsDescription =>
      'পুনরায় সাজাতে টেনে আনুন। সারিগুলি সক্ষম বা অক্ষম করুন৷';

  @override
  String get enabled => 'সক্রিয়';

  @override
  String get hidden => 'লুকানো';

  @override
  String get aboutTitle => 'সম্পর্কে';

  @override
  String versionValue(String version) {
    return 'সংস্করণ $version';
  }

  @override
  String get openSourceLicenses => 'ওপেন সোর্স লাইসেন্স';

  @override
  String get sourceCode => 'সোর্স কোড';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'এখন আপডেটের জন্য চেক করুন';

  @override
  String get checksLatestDesktopRelease =>
      'এই প্ল্যাটফর্মের জন্য সর্বশেষ ডেস্কটপ রিলিজ পরীক্ষা করে';

  @override
  String get youAreUpToDate => 'আপনি আপ টু ডেট.';

  @override
  String get couldNotCheckForUpdates =>
      'এই মুহূর্তে আপডেটের জন্য চেক করা যায়নি.';

  @override
  String get noCompatibleUpdate =>
      'এই প্ল্যাটফর্মের জন্য কোনো সামঞ্জস্যপূর্ণ আপডেট প্যাকেজ পাওয়া যায়নি।';

  @override
  String get updateChecksNotSupported =>
      'এই প্ল্যাটফর্মে আপডেট চেক সমর্থিত নয়।';

  @override
  String get updateNotificationsDisabled =>
      'আপডেট বিজ্ঞপ্তি নিষ্ক্রিয় করা হয়েছে.';

  @override
  String get pleaseWaitBeforeChecking =>
      'অনুগ্রহ করে আবার চেক করার আগে অপেক্ষা করুন।';

  @override
  String get latestUpdateAlreadyShown =>
      'সর্বশেষ আপডেট ইতিমধ্যে দেখানো হয়েছে.';

  @override
  String get updateAvailable => 'আপডেট উপলব্ধ।';

  @override
  String updateAvailableVersion(String version) {
    return 'আপডেট উপলব্ধ: v$version';
  }

  @override
  String get updateNotifications => 'আপডেট বিজ্ঞপ্তি';

  @override
  String get showWhenUpdatesAvailable => 'আপডেট উপলব্ধ হলে দেখান';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version উপলব্ধ';
  }

  @override
  String get readReleaseNotes => 'রিলিজ নোট পড়ুন';

  @override
  String get downloadingUpdate => 'আপডেট ডাউনলোড হচ্ছে...';

  @override
  String get updateDownloadFailed =>
      'আপডেট ডাউনলোড ব্যর্থ হয়েছে. আবার চেষ্টা করুন.';

  @override
  String get openReleasesPage => 'রিলিজ পৃষ্ঠা খুলুন';

  @override
  String get navigation => 'নেভিগেশন';

  @override
  String get watchedIndicatorsBackdrops => 'প্রেক্ষিত সূচক, ব্যাকড্রপ';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'ফোকাস রঙ, দেখা সূচক, ব্যাকড্রপ';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navbar শৈলী, টুলবার বোতাম, চেহারা';

  @override
  String get reorderToggleHomeRows => 'হোম সারিগুলি পুনরায় সাজান এবং টগল করুন';

  @override
  String get featuredContentAppearance => 'বৈশিষ্ট্যযুক্ত বিষয়বস্তু, চেহারা';

  @override
  String get posterSizeImageTypeFolderView =>
      'পোস্টারের আকার, ছবির ধরন, ফোল্ডার ভিউ';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB, এবং রেটিং সোর্স';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'পরিষ্কার';

  @override
  String get browse => 'ব্রাউজ করুন';

  @override
  String get noResults => 'কোনো ফলাফল নেই';

  @override
  String get seerrAvailableStatus => 'পাওয়া যায়';

  @override
  String get seerrRequestedStatus => 'অনুরোধ করেছেন';

  @override
  String itemsCount(int count) {
    return '$count আইটেম';
  }

  @override
  String get seerrSettings => 'Seerr সেটিংস';

  @override
  String get requestMore => 'আরো অনুরোধ';

  @override
  String get request => 'অনুরোধ';

  @override
  String get cancelRequest => 'অনুরোধ বাতিল করুন';

  @override
  String get playInMoonfin => 'Moonfin এ খেলুন';

  @override
  String requestedByName(String name) {
    return '$name দ্বারা অনুরোধ করা হয়েছে';
  }

  @override
  String get approve => 'অনুমোদন করুন';

  @override
  String get declineAction => 'প্রত্যাখ্যান';

  @override
  String get similar => 'অনুরূপ';

  @override
  String get recommendations => 'সুপারিশ';

  @override
  String cancelRequestForTitle(String title) {
    return '\"$title\"-এর অনুরোধ বাতিল করবেন?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '\"$title\" এর জন্য $count অনুরোধগুলি বাতিল করবেন?';
  }

  @override
  String get keep => 'রাখা';

  @override
  String get itemNotFoundInLibrary =>
      'আপনার Moonfin লাইব্রেরিতে আইটেম পাওয়া যায়নি';

  @override
  String get errorSearchingLibrary => 'লাইব্রেরি অনুসন্ধানে ত্রুটি৷';

  @override
  String budgetAmount(String amount) {
    return 'বাজেট: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'আয়: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'অনুরোধ $type';
  }

  @override
  String get submitRequest => 'অনুরোধ জমা দিন';

  @override
  String get allSeasons => 'সব ঋতু';

  @override
  String get advancedOptions => 'উন্নত বিকল্প';

  @override
  String get noServiceServersConfigured =>
      'কোনো সার্ভিস সার্ভার কনফিগার করা নেই';

  @override
  String get server => 'সার্ভার';

  @override
  String get qualityProfile => 'গুণমান প্রোফাইল';

  @override
  String get rootFolder => 'রুট ফোল্ডার';

  @override
  String get showMore => 'আরও দেখান';

  @override
  String get appearances => 'উপস্থিতি';

  @override
  String get crewSection => 'ক্রু';

  @override
  String ageValue(int age) {
    return 'বয়স $age';
  }

  @override
  String get noRequests => 'কোন অনুরোধ নেই';

  @override
  String get pendingStatus => 'মুলতুবি';

  @override
  String get declinedStatus => 'অস্বীকার করেছে';

  @override
  String get partiallyAvailable => 'আংশিকভাবে উপলব্ধ';

  @override
  String get downloadingStatus => 'ডাউনলোড হচ্ছে';

  @override
  String get approvedStatus => 'অনুমোদিত';

  @override
  String get notRequestedStatus => 'অনুরোধ করা হয়নি';

  @override
  String get blocklistedStatus => 'ব্লকলিস্টেড';

  @override
  String get deletedStatus => 'মুছে ফেলা হয়েছে';

  @override
  String get tmdbScore => 'TMDB স্কোর';

  @override
  String get releaseDateLabel => 'মুক্তির তারিখ';

  @override
  String get firstAirDateLabel => 'প্রথম এয়ারের তারিখ';

  @override
  String get revenueLabel => 'রাজস্ব';

  @override
  String get runtimeLabel => 'রানটাইম';

  @override
  String get budgetLabel => 'বাজেট';

  @override
  String get originalLanguageLabel => 'মূল ভাষা';

  @override
  String get seasonsLabel => 'ঋতু';

  @override
  String get episodesLabel => 'পর্বগুলি';

  @override
  String get access => 'অ্যাক্সেস';

  @override
  String get add => 'যোগ করুন';

  @override
  String get address => 'ঠিকানা';

  @override
  String get analytics => 'বিশ্লেষণ';

  @override
  String get catalog => 'ক্যাটালগ';

  @override
  String get content => 'বিষয়বস্তু';

  @override
  String get copy => 'কপি';

  @override
  String get create => 'তৈরি করুন';

  @override
  String get disable => 'নিষ্ক্রিয় করুন';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get edit => 'সম্পাদনা করুন';

  @override
  String get encoding => 'এনকোডিং';

  @override
  String get error => 'ত্রুটি';

  @override
  String get forward => 'ফরোয়ার্ড';

  @override
  String get general => 'সাধারণ';

  @override
  String get go => 'যাও';

  @override
  String get install => 'ইনস্টল করুন';

  @override
  String get installed => 'ইনস্টল করা হয়েছে';

  @override
  String get interval => 'ব্যবধান';

  @override
  String get name => 'নাম';

  @override
  String get networking => 'নেটওয়ার্কিং';

  @override
  String get next => 'পরবর্তী';

  @override
  String get path => 'পথ';

  @override
  String get paused => 'বিরতি দেওয়া হয়েছে';

  @override
  String get permissions => 'অনুমতি';

  @override
  String get processing => 'প্রক্রিয়াকরণ';

  @override
  String get profile => 'প্রোফাইল';

  @override
  String get provider => 'প্রদানকারী';

  @override
  String get refresh => 'রিফ্রেশ';

  @override
  String get remote => 'দূরবর্তী';

  @override
  String get rename => 'নাম পরিবর্তন করুন';

  @override
  String get revoke => 'প্রত্যাহার করুন';

  @override
  String get role => 'ভূমিকা';

  @override
  String get root => 'রুট';

  @override
  String get run => 'চালান';

  @override
  String get search => 'অনুসন্ধান করুন';

  @override
  String get select => 'নির্বাচন করুন';

  @override
  String get send => 'পাঠান';

  @override
  String get sessions => 'সেশন';

  @override
  String get set => 'সেট';

  @override
  String get status => 'স্ট্যাটাস';

  @override
  String get stop => 'থামো';

  @override
  String get streaming => 'স্ট্রিমিং';

  @override
  String get time => 'সময়';

  @override
  String get trickplay => 'ট্রিকপ্লে';

  @override
  String get uninstall => 'আনইনস্টল করুন';

  @override
  String get up => 'উপরে';

  @override
  String get update => 'আপডেট';

  @override
  String get upload => 'আপলোড করুন';

  @override
  String get unmute => 'আনমিউট করুন';

  @override
  String get mute => 'নিঃশব্দ';

  @override
  String get branding => 'ব্র্যান্ডিং';

  @override
  String get adminDrawerDashboard => 'ড্যাশবোর্ড';

  @override
  String get adminDrawerAnalytics => 'বিশ্লেষণ';

  @override
  String get adminDrawerSettings => 'সেটিংস';

  @override
  String get adminDrawerBranding => 'ব্র্যান্ডিং';

  @override
  String get adminDrawerUsers => 'ব্যবহারকারীদের';

  @override
  String get adminDrawerLibraries => 'লাইব্রেরি';

  @override
  String get adminDrawerTranscoding => 'ট্রান্সকোডিং';

  @override
  String get adminDrawerResume => 'পুনরায় শুরু করুন';

  @override
  String get adminDrawerStreaming => 'স্ট্রিমিং';

  @override
  String get adminDrawerTrickplay => 'ট্রিকপ্লে';

  @override
  String get adminDrawerDevices => 'ডিভাইস';

  @override
  String get adminDrawerActivity => 'কার্যকলাপ';

  @override
  String get adminDrawerNetworking => 'নেটওয়ার্কিং';

  @override
  String get adminDrawerApiKeys => 'API কী';

  @override
  String get adminDrawerBackups => 'ব্যাকআপ';

  @override
  String get adminDrawerLogs => 'লগ';

  @override
  String get adminDrawerScheduledTasks => 'নির্ধারিত কাজ';

  @override
  String get adminDrawerPlugins => 'প্লাগইন';

  @override
  String get adminDrawerRepositories => 'ভান্ডার';

  @override
  String get adminDrawerLiveTv => 'লাইভ টিভি';

  @override
  String get adminExitTooltip => 'অ্যাডমিন থেকে প্রস্থান করুন';

  @override
  String get adminDashboardLoadFailed => 'ড্যাশবোর্ড লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminMediaOverview => 'মিডিয়া ওভারভিউ';

  @override
  String get adminMediaTotalsError => 'সার্ভার মিডিয়া মোট লোড করা যায়নি.';

  @override
  String get adminMediaOverviewSubtitle =>
      'এই সার্ভারে কত বিষয়বস্তু আছে তা দ্রুত পঠন।';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'প্লাগইন আপডেট উপলব্ধ: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'প্ল্যাগইনগুলি পুনরায় চালু করতে হবে: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'নির্ধারিত কাজ ব্যর্থ হয়েছে: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'সাম্প্রতিক সতর্কতা/ত্রুটি এন্ট্রি: $count';
  }

  @override
  String get analyticsMediaDistribution => 'মিডিয়া বিতরণ';

  @override
  String get analyticsVideoCodecs => 'ভিডিও কোডেক';

  @override
  String get analyticsAudioCodecs => 'অডিও কোডেক';

  @override
  String get analyticsContainers => 'পাত্রে';

  @override
  String get analyticsTopGenres => 'শীর্ষ ঘরানার';

  @override
  String get analyticsReleaseYears => 'মুক্তির বছর';

  @override
  String get analyticsContentRatings => 'বিষয়বস্তু রেটিং';

  @override
  String get analyticsRuntimeBuckets => 'রানটাইম বালতি';

  @override
  String get analyticsFileFormats => 'ফাইল ফরম্যাট';

  @override
  String get analyticsNoData => 'কোন ডেটা উপলব্ধ নেই।';

  @override
  String get adminServerInfo => 'সার্ভার তথ্য';

  @override
  String get adminRestartPending => 'মুলতুবি রিস্টার্ট করুন';

  @override
  String get adminServerPaths => 'সার্ভার পাথ';

  @override
  String get adminServerActions => 'সার্ভার অ্যাকশন';

  @override
  String get adminRestartServer => 'সার্ভার পুনরায় চালু করুন';

  @override
  String get adminShutdownServer => 'শাটডাউন সার্ভার';

  @override
  String get adminScanLibraries => 'স্ক্যান লাইব্রেরি';

  @override
  String get adminLibraryScanStarted => 'লাইব্রেরি স্ক্যান শুরু হয়েছে';

  @override
  String errorGeneric(String error) {
    return 'ত্রুটি: $error';
  }

  @override
  String get adminServerRebootInProgress => 'সার্ভার রিবুট চলছে';

  @override
  String get adminServerRebootMessage =>
      'সার্ভার রিবুট চলছে, অনুগ্রহ করে পুনরায় চালু করুন Moonfin';

  @override
  String get adminActiveSessions => 'সক্রিয় সেশন';

  @override
  String get adminSessionsLoadFailed => 'সেশনগুলি লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminNoActiveSessions => 'কোনো সক্রিয় সেশন নেই';

  @override
  String get adminRecentActivity => 'সাম্প্রতিক কার্যকলাপ';

  @override
  String get adminNoRecentActivity => 'কোনো সাম্প্রতিক কার্যকলাপ নেই';

  @override
  String adminCommandFailed(String error) {
    return 'কমান্ড ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminSendMessage => 'বার্তা পাঠান';

  @override
  String get adminMessageTextHint => 'বার্তা পাঠ্য';

  @override
  String get adminSetVolume => 'ভলিউম সেট করুন';

  @override
  String get sessionPrev => 'পূর্ববর্তী';

  @override
  String get sessionRewind => 'রিওয়াইন্ড';

  @override
  String get sessionForward => 'ফরোয়ার্ড';

  @override
  String get sessionNext => 'পরবর্তী';

  @override
  String get sessionVolumeDown => 'ভলিউম -';

  @override
  String get sessionVolumeUp => 'ভলিউম +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'এখন চলছে';

  @override
  String get volume => 'আয়তন';

  @override
  String get actions => 'কর্ম';

  @override
  String get videoCodec => 'ভিডিও কোডেক';

  @override
  String get audioCodec => 'অডিও কোডেক';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'সমাপ্তি';

  @override
  String get direct => 'সরাসরি';

  @override
  String get adminDisconnect => 'সংযোগ বিচ্ছিন্ন করুন';

  @override
  String get adminClearDates => 'তারিখগুলি পরিষ্কার করুন';

  @override
  String adminActivityLoadFailed(String error) {
    return 'কার্যকলাপ লগ লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminNoActivityEntries => 'কোন কার্যকলাপ এন্ট্রি';

  @override
  String get adminEditDeviceName => 'ডিভাইসের নাম সম্পাদনা করুন';

  @override
  String get adminCustomName => 'কাস্টম নাম';

  @override
  String get adminDeviceNameUpdated => 'ডিভাইসের নাম আপডেট করা হয়েছে';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'ডিভাইস আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminDeleteDevice => 'ডিভাইস মুছুন';

  @override
  String get adminDeviceDeleted => 'ডিভাইস মুছে ফেলা হয়েছে';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'ডিভাইস মুছে ফেলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'ডিভাইস লোড করতে ব্যর্থ হয়েছে';

  @override
  String get adminSearchDevices => 'ডিভাইস অনুসন্ধান করুন';

  @override
  String get adminThisDevice => 'এই ডিভাইস';

  @override
  String get adminEditName => 'নাম সম্পাদনা করুন';

  @override
  String get adminLibrariesLoadFailed => 'লাইব্রেরি লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminNoLibraries => 'কোনো লাইব্রেরি কনফিগার করা নেই';

  @override
  String get adminScanAllLibraries => 'সমস্ত লাইব্রেরি স্ক্যান করুন';

  @override
  String get adminAddLibrary => 'লাইব্রেরি যোগ করুন';

  @override
  String adminScanFailed(String error) {
    return 'স্ক্যান শুরু করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminRenameLibrary => 'লাইব্রেরির নাম পরিবর্তন করুন';

  @override
  String get adminNewName => 'নতুন নাম';

  @override
  String adminLibraryRenamed(String name) {
    return 'লাইব্রেরির নাম পরিবর্তন করে \"$name\" করা হয়েছে';
  }

  @override
  String adminRenameFailed(String error) {
    return 'নাম পরিবর্তন করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminDeleteLibrary => 'লাইব্রেরি মুছুন';

  @override
  String adminLibraryDeleted(String name) {
    return 'লাইব্রেরি \"$name\" মুছে ফেলা হয়েছে৷';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'লাইব্রেরি মুছে ফেলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'পথ যোগ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminRemovePath => 'পথ সরান';

  @override
  String adminRemovePathConfirm(String path) {
    return 'এই লাইব্রেরি থেকে \"$path\" সরাতে চান?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'পথ সরাতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'লাইব্রেরি অপশন সংরক্ষিত';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'বিকল্পগুলি সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'লাইব্রেরি লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminNoMediaPaths => 'কোনো মিডিয়া পাথ কনফিগার করা নেই';

  @override
  String get adminAddPath => 'পথ যোগ করুন';

  @override
  String get adminBrowseFilesystem => 'সার্ভার ফাইল সিস্টেম ব্রাউজ করুন:';

  @override
  String get adminSaveOptions => 'সেভ অপশন';

  @override
  String get adminPreferredMetadataLanguage => 'পছন্দের মেটাডেটা ভাষা';

  @override
  String get adminMetadataLanguageHint => 'যেমন en, de, fr';

  @override
  String get adminMetadataCountryCode => 'মেটাডেটা দেশের কোড';

  @override
  String get adminMetadataCountryHint => 'যেমন US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'লাইব্রেরির নাম প্রয়োজন';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'লাইব্রেরি তৈরি করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminLibraryName => 'লাইব্রেরির নাম';

  @override
  String get adminSelectedPaths => 'নির্বাচিত পথ:';

  @override
  String get adminNoPathsAdded => 'কোন পাথ যোগ করা হয়নি (পরে যোগ করা যাবে)';

  @override
  String get adminCreateLibrary => 'লাইব্রেরি তৈরি করুন';

  @override
  String get paths => 'পথ:';

  @override
  String get adminDisableUser => 'ব্যবহারকারী অক্ষম করুন';

  @override
  String get adminEnableUser => 'ব্যবহারকারী সক্ষম করুন';

  @override
  String adminDisableUserConfirm(String name) {
    return '$name নিষ্ক্রিয় করবেন? তারা সাইন ইন করতে সক্ষম হবে না.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name সক্ষম করবেন? তারা আবার সাইন ইন করতে পারবে।';
  }

  @override
  String adminUserDisabled(String name) {
    return 'ব্যবহারকারী \"$name\" নিষ্ক্রিয়';
  }

  @override
  String adminUserEnabled(String name) {
    return 'ব্যবহারকারী \"$name\" সক্ষম';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'ব্যবহারকারী নীতি আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminUsersLoadFailed => 'ব্যবহারকারীদের লোড করতে ব্যর্থ হয়েছে';

  @override
  String get adminSearchUsers => 'ব্যবহারকারীদের অনুসন্ধান করুন';

  @override
  String get adminEditUser => 'ব্যবহারকারী সম্পাদনা করুন';

  @override
  String get adminAddUser => 'ব্যবহারকারী যোগ করুন';

  @override
  String adminUserCreateFailed(String error) {
    return 'ব্যবহারকারী তৈরি করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminCreateUser => 'ব্যবহারকারী তৈরি করুন';

  @override
  String get adminPasswordOptional => 'পাসওয়ার্ড (ঐচ্ছিক)';

  @override
  String get adminUsernameRequired => 'ব্যবহারকারীর নাম খালি থাকতে পারে না';

  @override
  String get adminNoProfileChanges =>
      'সংরক্ষণ করার জন্য কোনো প্রোফাইল পরিবর্তন করা হয়নি';

  @override
  String get adminProfileSaved => 'প্রোফাইল সংরক্ষিত';

  @override
  String adminSaveFailed(String error) {
    return 'সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminPermissionsSaved => 'অনুমতি সংরক্ষিত';

  @override
  String get adminPasswordsMismatch => 'পাসওয়ার্ড মেলে না';

  @override
  String adminFailed(String error) {
    return 'ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminUserLoadFailed => 'ব্যবহারকারী লোড করতে ব্যর্থ হয়েছে';

  @override
  String get adminBackToUsers => 'ব্যবহারকারীদের কাছে ফিরে যান';

  @override
  String get adminSaveProfile => 'প্রোফাইল সংরক্ষণ করুন';

  @override
  String get adminDeleteUser => 'ব্যবহারকারী মুছুন';

  @override
  String get admin => 'অ্যাডমিন';

  @override
  String get adminFullAccessWarning =>
      'প্রশাসকদের সার্ভারে সম্পূর্ণ অ্যাক্সেস আছে। সতর্কতার সাথে মঞ্জুর করুন।';

  @override
  String get administrator => 'প্রশাসক';

  @override
  String get adminHiddenUser => 'লুকানো ব্যবহারকারী';

  @override
  String get adminAllowMediaPlayback => 'মিডিয়া প্লেব্যাকের অনুমতি দিন';

  @override
  String get adminAllowAudioTranscoding => 'অডিও ট্রান্সকোডিংয়ের অনুমতি দিন';

  @override
  String get adminAllowVideoTranscoding => 'ভিডিও ট্রান্সকোডিংয়ের অনুমতি দিন';

  @override
  String get adminAllowRemuxing => 'রিমক্সিং এর অনুমতি দিন';

  @override
  String get adminForceRemoteTranscoding => 'রিমোট সোর্স ট্রান্সকোডিং জোর করে';

  @override
  String get adminAllowContentDeletion => 'বিষয়বস্তু মুছে ফেলার অনুমতি দিন';

  @override
  String get adminAllowContentDownloading => 'কন্টেন্ট ডাউনলোড করার অনুমতি দিন';

  @override
  String get adminAllowPublicSharing => 'পাবলিক শেয়ারিং অনুমতি দিন';

  @override
  String get adminAllowRemoteControl =>
      'অন্যান্য ব্যবহারকারীদের রিমোট কন্ট্রোলের অনুমতি দিন';

  @override
  String get adminAllowSharedDeviceControl =>
      'শেয়ার করা ডিভাইস নিয়ন্ত্রণের অনুমতি দিন';

  @override
  String get adminAllowRemoteAccess => 'দূরবর্তী অ্যাক্সেসের অনুমতি দিন';

  @override
  String get adminRemoteBitrateLimit => 'দূরবর্তী ক্লায়েন্ট বিটরেট সীমা (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'কোন সীমা জন্য খালি ছেড়ে দিন';

  @override
  String get adminMaxActiveSessions => 'সর্বাধিক সক্রিয় সেশন';

  @override
  String get adminAllowLiveTvAccess => 'লাইভ টিভি অ্যাক্সেসের অনুমতি দিন';

  @override
  String get adminAllowLiveTvManagement => 'লাইভ টিভি পরিচালনার অনুমতি দিন';

  @override
  String get adminAllowCollectionManagement => 'সংগ্রহ পরিচালনার অনুমতি দিন';

  @override
  String get adminAllowSubtitleManagement => 'সাবটাইটেল পরিচালনার অনুমতি দিন';

  @override
  String get adminAllowLyricManagement => 'লিরিক পরিচালনার অনুমতি দিন';

  @override
  String get adminSavePermissions => 'অনুমতি সংরক্ষণ করুন';

  @override
  String get adminEnableAllLibraryAccess =>
      'সমস্ত লাইব্রেরিতে অ্যাক্সেস সক্ষম করুন৷';

  @override
  String get adminSaveAccess => 'অ্যাক্সেস সংরক্ষণ করুন';

  @override
  String get adminChangePassword => 'পাসওয়ার্ড পরিবর্তন করুন';

  @override
  String get adminNewPassword => 'নতুন পাসওয়ার্ড';

  @override
  String get adminConfirmPassword => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get adminSetPassword => 'পাসওয়ার্ড সেট করুন';

  @override
  String get adminResetPassword => 'পাসওয়ার্ড রিসেট করুন';

  @override
  String get adminPasswordReset => 'পাসওয়ার্ড রিসেট';

  @override
  String get adminPasswordUpdated => 'পাসওয়ার্ড আপডেট করা হয়েছে';

  @override
  String get adminUserSettings => 'ব্যবহারকারীর সেটিংস';

  @override
  String get adminLibraryAccess => 'লাইব্রেরি অ্যাক্সেস';

  @override
  String get adminDeviceAndChannelAccess => 'ডিভাইস এবং চ্যানেল অ্যাক্সেস';

  @override
  String get adminEnableAllDevices => 'সমস্ত ডিভাইসে অ্যাক্সেস সক্ষম করুন';

  @override
  String get adminEnableAllChannels => 'সমস্ত চ্যানেলে অ্যাক্সেস সক্ষম করুন৷';

  @override
  String get adminResetPasswordWarning =>
      'এটি পাসওয়ার্ড মুছে ফেলবে। ব্যবহারকারী পাসওয়ার্ড ছাড়াই লগ ইন করতে পারবেন।';

  @override
  String adminServerReturnedHttp(int status) {
    return 'সার্ভার HTTP $status ফেরত দিয়েছে';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'আপনি কি $name মুছতে চান?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'ব্যবহারকারী \"$name\" মুছে ফেলা হয়েছে';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'ব্যবহারকারী মুছে ফেলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminCreateApiKey => 'API কী তৈরি করুন';

  @override
  String get adminAppName => 'অ্যাপের নাম';

  @override
  String get adminApiKeyCreated => 'API কী তৈরি করা হয়েছে';

  @override
  String get adminApiKeyCreatedNoToken =>
      'কী সফলভাবে তৈরি করা হয়েছে। সার্ভার টোকেন ফেরত দেয়নি। সার্ভার API কী চেক করুন।';

  @override
  String get adminKeyCopied => 'ক্লিপবোর্ডে কী কপি করা হয়েছে';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'কী তৈরি করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'সার্ভার প্রতিক্রিয়া থেকে কী টোকেন অনুপস্থিত৷';

  @override
  String get adminRevokeApiKey => 'API কী প্রত্যাহার করুন';

  @override
  String adminRevokeKeyConfirm(String name) {
    return '$name এর জন্য কী প্রত্যাহার করবেন?';
  }

  @override
  String get adminApiKeyRevoked => 'API কী প্রত্যাহার করা হয়েছে৷';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'কী প্রত্যাহার করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'API কী লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminApiKeysTitle => 'API কী';

  @override
  String get adminCreateKey => 'কী তৈরি করুন';

  @override
  String get adminNoApiKeys => 'কোনো API কী পাওয়া যায়নি';

  @override
  String get adminUnknownApp => 'অজানা অ্যাপ';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'টোকেন: $token\\nনির্মিত: $created';
  }

  @override
  String get adminCreatingBackup => 'ব্যাকআপ তৈরি করা হচ্ছে...';

  @override
  String get adminBackupCreated => 'ব্যাকআপ সফলভাবে তৈরি করা হয়েছে';

  @override
  String adminBackupCreateFailed(String error) {
    return 'ব্যাকআপ তৈরি করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'সার্ভার প্রতিক্রিয়ায় ব্যাকআপ পথ অনুপস্থিত৷';

  @override
  String adminBackupManifest(String name) {
    return 'ম্যানিফেস্ট: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'ম্যানিফেস্ট লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminConfirmRestore => 'পুনরুদ্ধার নিশ্চিত করুন';

  @override
  String get adminRestoringBackup => 'ব্যাকআপ পুনরুদ্ধার করা হচ্ছে...';

  @override
  String adminRestoreFailed(String error) {
    return 'ব্যাকআপ পুনরুদ্ধার করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'ব্যাকআপ লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminCreateBackup => 'ব্যাকআপ তৈরি করুন';

  @override
  String get adminNoBackups => 'কোন ব্যাকআপ পাওয়া যায়নি';

  @override
  String get adminViewDetails => 'বিস্তারিত দেখুন';

  @override
  String get restore => 'পুনরুদ্ধার করুন';

  @override
  String get adminLogsLoadFailed => 'সার্ভার লগ লোড করতে ব্যর্থ হয়েছে';

  @override
  String get adminNoLogFiles => 'কোনো লগ ফাইল পাওয়া যায়নি';

  @override
  String get adminLogCopied => 'ক্লিপবোর্ডে লগ কপি করা হয়েছে';

  @override
  String get adminSaveLogFile => 'লগ ফাইল সংরক্ষণ করুন';

  @override
  String adminSavedTo(String path) {
    return '$path এ সংরক্ষিত';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'ফাইল সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName লোড করতে ব্যর্থ হয়েছে';
  }

  @override
  String get adminSearchInLog => 'লগ ইন অনুসন্ধান করুন';

  @override
  String get adminNoMatchingLines => 'কোন মিল লাইন';

  @override
  String adminTasksLoadFailed(String error) {
    return 'কার্যগুলি লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminNoScheduledTasks => 'কোনো নির্ধারিত কাজ পাওয়া যায়নি';

  @override
  String get adminNoTasksMatchFilter =>
      'বর্তমান ফিল্টারের সাথে কোনো কাজ মেলে না';

  @override
  String adminTaskStartFailed(String error) {
    return 'কাজ শুরু করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'টাস্ক থামাতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'টাস্ক লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminRunNow => 'এখন চালান';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'ট্রিগার সরাতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'ট্রিগার যোগ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminLastExecution => 'শেষ মৃত্যুদন্ড';

  @override
  String get adminTriggers => 'ট্রিগার';

  @override
  String get adminAddTrigger => 'ট্রিগার যোগ করুন';

  @override
  String get adminNoTriggers => 'কোনো ট্রিগার কনফিগার করা নেই';

  @override
  String get adminTriggerType => 'ট্রিগার প্রকার';

  @override
  String get adminTimeLimit => 'সময়সীমা (ঐচ্ছিক)';

  @override
  String get adminNoLimit => 'কোন সীমা নেই';

  @override
  String adminHours(String hours) {
    return '$hours ঘন্টা(গুলি)';
  }

  @override
  String get adminDayOfWeek => 'সপ্তাহের দিন';

  @override
  String get adminSearchPlugins => 'প্লাগইন অনুসন্ধান করুন...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'প্লাগইন টগল করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminUninstallPlugin => 'প্লাগইন আনইনস্টল করুন';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'আপনি কি \"$name\" আনইনস্টল করার বিষয়ে নিশ্চিত?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'প্লাগইন আনইনস্টল করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'প্যাকেজ ইনস্টল করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'আপডেট ইনস্টল করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'প্লাগইনগুলি লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'কোনো প্লাগইন আপনার অনুসন্ধানের সাথে মেলে না';

  @override
  String get adminNoPluginsInstalled => 'কোন প্লাগইন ইনস্টল করা নেই';

  @override
  String adminInstallUpdate(String version) {
    return 'আপডেট ইনস্টল করুন (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'ক্যাটালগ লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'কোনো প্যাকেজ আপনার অনুসন্ধানের সাথে মেলে না';

  @override
  String get adminNoPackagesAvailable => 'কোন প্যাকেজ উপলব্ধ';

  @override
  String get adminExperimentalIntegration => 'পরীক্ষামূলক ইন্টিগ্রেশন';

  @override
  String get adminExperimentalWarning =>
      'প্লাগইন সেটিংস ইন্টিগ্রেশন এখনও পরীক্ষামূলক। কিছু সেটিংস পৃষ্ঠা সঠিকভাবে রেন্ডার নাও হতে পারে।';

  @override
  String get continueAction => 'চালিয়ে যান';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'সার্ভার পুনরায় চালু করার পরে \"$name\" সরানো হবে';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'আনইনস্টল করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return '\"$name\" আপডেট করা হচ্ছে v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'সেটিংস খুলতে অক্ষম: অনুমোদন টোকেন অনুপস্থিত।';

  @override
  String adminPluginLoadFailed(String error) {
    return 'প্লাগইন লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminPluginNotFound => 'প্লাগইন পাওয়া যায়নি';

  @override
  String adminPluginVersion(String version) {
    return 'সংস্করণ $version';
  }

  @override
  String get adminEnablePlugin => 'প্লাগইন সক্ষম করুন';

  @override
  String get adminPluginSettingsPage => 'প্লাগইন সেটিংস পৃষ্ঠা';

  @override
  String get adminRevisionHistory => 'পুনর্বিবেচনার ইতিহাস';

  @override
  String get adminNoChangelog => 'কোন চেঞ্জলগ উপলব্ধ নেই।';

  @override
  String get adminRemoveRepository => 'সংগ্রহস্থল সরান';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'আপনি কি \"$name\" সরানোর বিষয়ে নিশ্চিত?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'সংগ্রহস্থল সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'সংগ্রহস্থল লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminRepositoryNameHint => 'যেমন Jellyfin স্থিতিশীল';

  @override
  String get adminRepositoryUrl => 'সংগ্রহস্থল URL';

  @override
  String get adminAddEntry => 'এন্ট্রি যোগ করুন';

  @override
  String get adminInvalidUrl => 'অবৈধ URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'প্লাগইন সেটিংস লোড করতে অক্ষম: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'খোলা যায়নি $uri';
  }

  @override
  String get adminOpenInBrowser => 'ব্রাউজারে খুলুন';

  @override
  String get adminOpenExternally => 'বাহ্যিকভাবে খুলুন';

  @override
  String get adminGeneralSettings => 'সাধারণ সেটিংস';

  @override
  String get adminServerName => 'সার্ভারের নাম';

  @override
  String get adminPreferredMetadataCountry => 'পছন্দের মেটাডেটা দেশ';

  @override
  String get adminCachePath => 'ক্যাশে পথ';

  @override
  String get adminMetadataPath => 'মেটাডেটা পথ';

  @override
  String get adminLibraryScanConcurrency => 'লাইব্রেরি স্ক্যান কনকারেন্সি';

  @override
  String get adminParallelImageEncodingLimit => 'সমান্তরাল ছবি এনকোডিং সীমা';

  @override
  String get adminSlowResponseThreshold => 'ধীর প্রতিক্রিয়া থ্রেশহোল্ড (ms)';

  @override
  String get adminBrandingSaved => 'ব্র্যান্ডিং সেটিংস সংরক্ষিত';

  @override
  String get adminBrandingLoadFailed =>
      'ব্র্যান্ডিং সেটিংস লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminLoginDisclaimer => 'লগইন দাবিত্যাগ';

  @override
  String get adminLoginDisclaimerHint =>
      'লগইন ফর্মের নিচে এইচটিএমএল প্রদর্শিত হবে';

  @override
  String get adminCustomCss => 'কাস্টম সিএসএস';

  @override
  String get adminCustomCssHint =>
      'কাস্টম CSS ওয়েব ইন্টারফেসে প্রয়োগ করা হয়েছে';

  @override
  String get adminEnableSplashScreen => 'স্প্ল্যাশ স্ক্রিন সক্ষম করুন';

  @override
  String get adminStreamingSaved => 'স্ট্রিমিং সেটিংস সংরক্ষিত';

  @override
  String get adminStreamingLoadFailed =>
      'স্ট্রিমিং সেটিংস লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminStreamingDescription =>
      'দূরবর্তী সংযোগের জন্য বিশ্বব্যাপী স্ট্রিমিং বিটরেট সীমা সেট করুন।';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'দূরবর্তী ক্লায়েন্ট বিটরেট সীমা (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'সীমাহীনের জন্য খালি বা 0 ছেড়ে দিন';

  @override
  String get adminPlaybackSaved => 'প্লেব্যাক সেটিংস সংরক্ষিত';

  @override
  String get adminPlaybackLoadFailed => 'প্লেব্যাক সেটিংস লোড করতে ব্যর্থ৷';

  @override
  String get adminPlaybackTranscoding => 'প্লেব্যাক / ট্রান্সকোডিং';

  @override
  String get adminHardwareAcceleration => 'হার্ডওয়্যার ত্বরণ';

  @override
  String get adminVaapiDevice => 'VA-API ডিভাইস';

  @override
  String get adminEnableHardwareEncoding => 'হার্ডওয়্যার এনকোডিং সক্ষম করুন';

  @override
  String get adminEnableHardwareDecoding =>
      'এর জন্য হার্ডওয়্যার ডিকোডিং সক্ষম করুন:';

  @override
  String get adminEncodingThreads => 'থ্রেড এনকোডিং';

  @override
  String get adminAutomatic => '0 = স্বয়ংক্রিয়';

  @override
  String get adminTranscodingTempPath => 'টেম্প পাথ ট্রান্সকোডিং';

  @override
  String get adminEnableFallbackFont => 'ফলব্যাক ফন্ট সক্রিয় করুন';

  @override
  String get adminFallbackFontPath => 'ফলব্যাক ফন্ট পাথ';

  @override
  String get adminAllowSegmentDeletion => 'সেগমেন্ট মুছে ফেলার অনুমতি দিন';

  @override
  String get adminSegmentKeepSeconds => 'সেগমেন্ট রাখা (সেকেন্ড)';

  @override
  String get adminThrottleBuffering => 'থ্রটল বাফারিং';

  @override
  String get adminTrickplaySaved => 'ট্রিকপ্লে সেটিংস সংরক্ষিত';

  @override
  String get adminTrickplayLoadFailed =>
      'ট্রিকপ্লে সেটিংস লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminEnableHardwareAcceleration => 'হার্ডওয়্যার ত্বরণ সক্ষম করুন';

  @override
  String get adminEnableKeyFrameExtraction =>
      'কী ফ্রেম শুধুমাত্র নিষ্কাশন সক্ষম করুন';

  @override
  String get adminKeyFrameSubtitle => 'দ্রুত কিন্তু কম নির্ভুলতা';

  @override
  String get adminScanBehavior => 'স্ক্যান আচরণ';

  @override
  String get adminProcessPriority => 'প্রক্রিয়া অগ্রাধিকার';

  @override
  String get adminImageSettings => 'ইমেজ সেটিংস';

  @override
  String get adminIntervalMs => 'ব্যবধান (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'কত ঘন ঘন ফ্রেম ক্যাপচার';

  @override
  String get adminWidthResolutions => 'প্রস্থ রেজল্যুশন';

  @override
  String get adminTileWidth => 'টালি প্রস্থ';

  @override
  String get adminTileHeight => 'টালি উচ্চতা';

  @override
  String get adminQualitySubtitle => 'নিম্ন মান = ভাল মানের, বড় ফাইল';

  @override
  String get adminProcessThreads => 'প্রক্রিয়া থ্রেড';

  @override
  String get adminResumeSaved => 'পুনঃসূচনা সেটিংস সংরক্ষিত';

  @override
  String get adminResumeLoadFailed =>
      'জীবনবৃত্তান্ত সেটিংস লোড করতে ব্যর্থ হয়েছে';

  @override
  String get adminResumeDescription =>
      'কন্টেন্ট কখন আংশিকভাবে বাজানো বা সম্পূর্ণভাবে বাজানো হিসাবে চিহ্নিত করা উচিত তা কনফিগার করুন।';

  @override
  String get adminMinResumePercentage => 'ন্যূনতম জীবনবৃত্তান্ত শতাংশ';

  @override
  String get adminMinResumeSubtitle =>
      'বিষয়বস্তু অগ্রগতি সংরক্ষণ করতে এই শতাংশ অতিক্রম করা আবশ্যক';

  @override
  String get adminMaxResumePercentage => 'সর্বোচ্চ জীবনবৃত্তান্ত শতাংশ';

  @override
  String get adminMaxResumeSubtitle =>
      'এই শতাংশের পরে বিষয়বস্তু সম্পূর্ণরূপে বাজানো বলে মনে করা হয়';

  @override
  String get adminMinResumeDuration =>
      'ন্যূনতম জীবনবৃত্তান্তের সময়কাল (সেকেন্ড)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'এর চেয়ে ছোট আইটেমগুলি পুনরায় শুরু করা যায় না';

  @override
  String get adminMinAudiobookResume => 'ন্যূনতম অডিওবুক সারসংকলন শতাংশ';

  @override
  String get adminMaxAudiobookResume => 'সর্বাধিক অডিওবুক সারসংকলন শতাংশ';

  @override
  String get adminNetworkingSaved =>
      'নেটওয়ার্কিং সেটিংস সংরক্ষিত। একটি সার্ভার রিস্টার্ট প্রয়োজন হতে পারে.';

  @override
  String get adminNetworkingLoadFailed =>
      'নেটওয়ার্কিং সেটিংস লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminNetworkingWarning =>
      'নেটওয়ার্কিং সেটিংসে পরিবর্তনের জন্য সার্ভার পুনরায় চালু করার প্রয়োজন হতে পারে।';

  @override
  String get adminEnableRemoteAccess => 'দূরবর্তী অ্যাক্সেস সক্ষম করুন';

  @override
  String get ports => 'বন্দর';

  @override
  String get adminHttpPort => 'HTTP পোর্ট';

  @override
  String get adminHttpsPort => 'HTTPS পোর্ট';

  @override
  String get adminPublicHttpsPort => 'পাবলিক HTTPS পোর্ট';

  @override
  String get adminBaseUrl => 'বেস URL';

  @override
  String get adminBaseUrlHint => 'যেমন /জেলিফিন';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS সক্ষম করুন';

  @override
  String get adminLocalNetwork => 'স্থানীয় নেটওয়ার্ক';

  @override
  String get adminLocalNetworkAddresses => 'স্থানীয় নেটওয়ার্ক ঠিকানা';

  @override
  String get adminKnownProxies => 'পরিচিত প্রক্সি';

  @override
  String get adminRemoteIpFilter => 'রিমোট আইপি ফিল্টার';

  @override
  String get adminRemoteIpFilterEntries => 'দূরবর্তী আইপি ফিল্টার';

  @override
  String get adminCertificatePath => 'শংসাপত্রের পথ';

  @override
  String get whitelist => 'হোয়াইটলিস্ট';

  @override
  String get blacklist => 'কালো তালিকা';

  @override
  String get notSet => 'সেট করা হয়নি';

  @override
  String get adminMetadataSaved => 'মেটাডেটা সংরক্ষিত';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'মেটাডেটা লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'মেটাডেটা সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminRefreshMetadata => 'মেটাডেটা রিফ্রেশ করুন';

  @override
  String get recursive => 'পুনরাবৃত্তিমূলক';

  @override
  String get adminReplaceAllMetadata => 'সমস্ত মেটাডেটা প্রতিস্থাপন করুন';

  @override
  String get adminReplaceAllImages => 'সমস্ত ছবি প্রতিস্থাপন করুন';

  @override
  String get adminMetadataRefreshRequested =>
      'মেটাডেটা রিফ্রেশ অনুরোধ করা হয়েছে';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'মেটাডেটা রিফ্রেশ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminSearchRemotePerson => 'দূরবর্তী ব্যক্তি অনুসন্ধান করুন';

  @override
  String get adminNoRemoteMatches => 'কোনো দূরবর্তী মিল খুঁজে পাওয়া যায়নি';

  @override
  String get adminRemoteResults => 'দূরবর্তী ফলাফল';

  @override
  String get adminRemoteMetadataApplied =>
      'দূরবর্তী মেটাডেটা প্রয়োগ করা হয়েছে';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'দূরবর্তী অনুসন্ধান ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminUpdateContentType => 'কন্টেন্ট টাইপ আপডেট করুন';

  @override
  String get adminContentType => 'বিষয়বস্তুর প্রকার';

  @override
  String get adminContentTypeUpdated => 'বিষয়বস্তুর প্রকার আপডেট করা হয়েছে';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'বিষয়বস্তুর প্রকার আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'মেটাডেটা সম্পাদক লোড করতে ব্যর্থ হয়েছে';

  @override
  String get adminNoPeopleEntries => 'কোন মানুষ এন্ট্রি';

  @override
  String get adminNoExternalIds => 'কোন বহিরাগত আইডি উপলব্ধ';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType ছবি আপডেট করা হয়েছে';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'ছবি ডাউনলোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'অসমর্থিত চিত্র বিন্যাস';

  @override
  String get adminImageReadFailed => 'নির্বাচিত ছবি পড়তে ব্যর্থ হয়েছে';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType ছবি আপলোড করা হয়েছে';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'ছবি আপলোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType ছবি মুছুন';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType ছবি মুছে ফেলা হয়েছে';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'ছবি মুছে ফেলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminAllProviders => 'সমস্ত প্রদানকারী';

  @override
  String get adminNoRemoteImages => 'কোন দূরবর্তী ছবি পাওয়া যায়নি';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'টিউনার আবিষ্কার ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminAddTuner => 'টিউনার যোগ করুন';

  @override
  String get adminTunerType => 'টিউনার প্রকার';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, অন্যান্য';

  @override
  String get adminUrlPath => 'URL/পথ';

  @override
  String get adminNameOptional => 'নাম (ঐচ্ছিক)';

  @override
  String get adminTunerAdded => 'টিউনার যোগ করা হয়েছে';

  @override
  String adminTunerAddFailed(String error) {
    return 'টিউনার যোগ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminAddGuideProvider => 'গাইড প্রদানকারী যোগ করুন';

  @override
  String get adminProviderType => 'প্রদানকারীর ধরন';

  @override
  String get adminProviderTypeHint => 'শিডিউল ডাইরেক্ট বা এক্সএমএলটিভি';

  @override
  String get adminUsernameOptional => 'ব্যবহারকারীর নাম (ঐচ্ছিক)';

  @override
  String get adminRefreshInterval => 'রিফ্রেশ ব্যবধান (ঘন্টা)';

  @override
  String get adminProviderAdded => 'প্রদানকারী যোগ করা হয়েছে';

  @override
  String adminProviderAddFailed(String error) {
    return 'প্রদানকারী যোগ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'টিউনার সরাতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminTunerResetRequested => 'টিউনার রিসেট করার অনুরোধ করা হয়েছে';

  @override
  String adminTunerResetFailed(String error) {
    return 'টিউনার রিসেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'প্রদানকারী সরাতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminRecordingSettings => 'রেকর্ডিং সেটিংস';

  @override
  String get adminPrePadding => 'প্রি-প্যাডিং (মিনিট)';

  @override
  String get adminPostPadding => 'পোস্ট-প্যাডিং (মিনিট)';

  @override
  String get adminRecordingPath => 'রেকর্ডিং পথ';

  @override
  String get adminSeriesRecordingPath => 'সিরিজ রেকর্ডিং পাথ';

  @override
  String get adminRecordingSettingsSaved => 'রেকর্ডিং সেটিংস সংরক্ষিত';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'সেটিংস সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminSetChannelMappings => 'চ্যানেল ম্যাপিং সেট করুন';

  @override
  String get adminMappingJson => 'JSON ম্যাপিং';

  @override
  String get adminMappingJsonHint => 'উদাহরণ: ম্যাপিং JSON পেলোড';

  @override
  String get adminChannelMappingsUpdated => 'চ্যানেল ম্যাপিং আপডেট করা হয়েছে';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'ম্যাপিং আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'লাইভ টিভি প্রশাসন লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminTunerDevices => 'টিউনার ডিভাইস';

  @override
  String get adminNoTunerHosts => 'কোনো টিউনার হোস্ট কনফিগার করা নেই';

  @override
  String get adminGuideProviders => 'গাইড প্রদানকারী';

  @override
  String get adminAddProvider => 'প্রদানকারী যোগ করুন';

  @override
  String get adminNoListingProviders =>
      'কোনো তালিকা প্রদানকারী কনফিগার করা নেই';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'রেকর্ডিং পথ: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'সিরিজের পথ: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'প্রি-প্যাডিং: $minutes মিনিট';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'পোস্ট-প্যাডিং: $minutes মিনিট';
  }

  @override
  String get adminTunerDiscovery => 'টিউনার আবিষ্কার';

  @override
  String get adminChannelMappings => 'চ্যানেল ম্যাপিং';

  @override
  String get adminNoDiscoveredTuners => 'এখনও কোন আবিষ্কৃত টিউনার';

  @override
  String get adminSettingsSaved => 'সেটিংস সংরক্ষিত';

  @override
  String get adminBackupsNotAvailable =>
      'এই সার্ভার বিল্ডে ব্যাকআপ পাওয়া যায় না।';

  @override
  String get adminRestoreWarning1 =>
      'পুনরুদ্ধার করা সমস্ত বর্তমান সার্ভার ডেটা ব্যাকআপ ডেটা দিয়ে প্রতিস্থাপন করবে।';

  @override
  String get adminRestoreWarning2 =>
      'বর্তমান সার্ভার সেটিংস, ব্যবহারকারী এবং লাইব্রেরি ডেটা ওভাররাইট করা হবে।';

  @override
  String get adminRestoreWarning3 =>
      'পুনরুদ্ধারের পরে সার্ভার পুনরায় চালু হবে।';

  @override
  String adminRestoreConfirmMessage(String name) {
    return '$name এখন ব্যাকআপ পুনরুদ্ধার করবেন?';
  }

  @override
  String get adminRestoreRequested =>
      'পুনরুদ্ধারের অনুরোধ করা হয়েছে। সার্ভার রিস্টার্ট এই সেশন সংযোগ বিচ্ছিন্ন হতে পারে.';

  @override
  String get adminBackupsTitle => 'ব্যাকআপ';

  @override
  String get adminUnknownDate => 'অজানা তারিখ';

  @override
  String get adminUnnamedBackup => 'নামহীন ব্যাকআপ';

  @override
  String get adminLiveTvNotAvailable =>
      'এই সার্ভার বিল্ডে লাইভ টিভি প্রশাসন উপলব্ধ নয়।';

  @override
  String get adminLiveTvTitle => 'লাইভ টিভি প্রশাসন';

  @override
  String get adminApply => 'আবেদন করুন';

  @override
  String get adminNotSet => 'সেট করা হয়নি';

  @override
  String get adminReset => 'রিসেট করুন';

  @override
  String get adminLogsTitle => 'সার্ভার লগ';

  @override
  String get adminLogsNewestFirst => 'নতুন প্রথম';

  @override
  String get adminLogsOldestFirst => 'প্রাচীনতম প্রথম';

  @override
  String get adminLogsJustNow => 'এইমাত্র';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes মিঃ আগে';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours ঘন্টা আগে';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days দিন আগে';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName লোড করতে ব্যর্থ হয়েছে';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count মিল';
  }

  @override
  String get adminLogViewerNoMatches => 'কোন মিল লাইন';

  @override
  String get adminMetadataEditorTitle => 'মেটাডেটা সম্পাদক';

  @override
  String get adminMetadataRemote => 'দূরবর্তী';

  @override
  String get adminMetadataType => 'টাইপ';

  @override
  String get adminMetadataDetails => 'বিস্তারিত';

  @override
  String get adminMetadataExternalIds => 'বাহ্যিক আইডি';

  @override
  String get adminMetadataImages => 'ছবি';

  @override
  String get adminMetadataFieldTitle => 'শিরোনাম';

  @override
  String get adminMetadataFieldSortTitle => 'বাছাই শিরোনাম';

  @override
  String get adminMetadataFieldOriginalTitle => 'মূল শিরোনাম';

  @override
  String get adminMetadataFieldPremiereDate =>
      'প্রিমিয়ারের তারিখ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'শেষ তারিখ (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'উৎপাদন বছর';

  @override
  String get adminMetadataFieldOfficialRating => 'অফিসিয়াল রেটিং';

  @override
  String get adminMetadataFieldCommunityRating => 'সম্প্রদায় রেটিং';

  @override
  String get adminMetadataFieldCriticRating => 'সমালোচক রেটিং';

  @override
  String get adminMetadataFieldTagline => 'ট্যাগলাইন';

  @override
  String get adminMetadataFieldOverview => 'ওভারভিউ';

  @override
  String get adminMetadataGenres => 'জেনারস';

  @override
  String get adminMetadataTags => 'ট্যাগ';

  @override
  String get adminMetadataStudios => 'স্টুডিও';

  @override
  String get adminMetadataPeople => 'মানুষ';

  @override
  String get adminMetadataAddGenre => 'জেনার যোগ করুন';

  @override
  String get adminMetadataAddTag => 'ট্যাগ যোগ করুন';

  @override
  String get adminMetadataAddStudio => 'স্টুডিও যোগ করুন';

  @override
  String get adminMetadataAddPerson => 'ব্যক্তি যোগ করুন';

  @override
  String get adminMetadataEditPerson => 'ব্যক্তি সম্পাদনা করুন';

  @override
  String get adminMetadataRole => 'ভূমিকা';

  @override
  String get adminMetadataImagePrimary => 'প্রাথমিক';

  @override
  String get adminMetadataImageBackdrop => 'ব্যাকড্রপ';

  @override
  String get adminMetadataImageLogo => 'লোগো';

  @override
  String get adminMetadataImageBanner => 'ব্যানার';

  @override
  String get adminMetadataImageThumb => 'থাম্ব';

  @override
  String get adminMetadataRecursive => 'পুনরাবৃত্তিমূলক';

  @override
  String get adminMetadataProvider => 'প্রদানকারী';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType ছবি আপডেট করা হয়েছে';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType ছবি আপলোড করা হয়েছে';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType ছবি মুছে ফেলা হয়েছে';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'ছবি ডাউনলোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'নির্বাচিত ছবি পড়তে ব্যর্থ হয়েছে';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'ছবি আপলোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType ছবি মুছুন';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'এটি আইটেম থেকে বর্তমান চিত্রটি সরিয়ে দেয়।';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'ছবি মুছে ফেলতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return '$imageType ছবি বেছে নিন';
  }

  @override
  String get adminMetadataUpload => 'আপলোড করুন';

  @override
  String get adminMetadataUpdate => 'আপডেট';

  @override
  String get adminMetadataRemoteImage => 'দূরবর্তী ছবি';

  @override
  String get adminPluginsInstalled => 'ইনস্টল করা হয়েছে';

  @override
  String get adminPluginsCatalog => 'ক্যাটালগ';

  @override
  String get adminPluginsActive => 'সক্রিয়';

  @override
  String get adminPluginsRestart => 'রিস্টার্ট করুন';

  @override
  String get adminPluginsNoSearchResults =>
      'কোনো প্লাগইন আপনার অনুসন্ধানের সাথে মেলে না';

  @override
  String get adminPluginsNoneInstalled => 'কোন প্লাগইন ইনস্টল করা নেই';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'আপডেট উপলব্ধ: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'আপডেট উপলব্ধ';

  @override
  String get adminPluginsPendingRemoval => 'পুনঃসূচনা করার পরে অপসারণ মুলতুবি';

  @override
  String get adminPluginsChangesPending => 'পরিবর্তন মুলতুবি পুনঃসূচনা';

  @override
  String get adminPluginsEnable => 'সক্ষম করুন';

  @override
  String get adminPluginsDisable => 'নিষ্ক্রিয় করুন';

  @override
  String get adminPluginsInstallUpdate => 'আপডেট ইনস্টল করুন';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'আপডেট ইনস্টল করুন (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'কোনো প্যাকেজ আপনার অনুসন্ধানের সাথে মেলে না';

  @override
  String get adminPluginsCatalogEmpty => 'কোন প্যাকেজ উপলব্ধ';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" ইনস্টল করা হচ্ছে...';
  }

  @override
  String get adminPluginDetailExperimental => 'পরীক্ষামূলক ইন্টিগ্রেশন';

  @override
  String get adminPluginDetailExperimentalContent =>
      'প্লাগইন সেটিংস ইন্টিগ্রেশন এখনও পরীক্ষামূলক। কিছু ক্ষেত্র বা লেআউট এখনও সঠিকভাবে রেন্ডার নাও হতে পারে।';

  @override
  String get adminPluginDetailToggle404 =>
      'প্লাগইন টগল করতে ব্যর্থ হয়েছে৷ সার্ভার এই প্লাগইন সংস্করণ খুঁজে পায়নি. রিফ্রেশ প্লাগইন চেষ্টা করুন, তারপর আবার চেষ্টা করুন.';

  @override
  String get adminPluginDetailToggleDioError =>
      'প্লাগইন টগল করতে ব্যর্থ হয়েছে৷ বিস্তারিত জানার জন্য সার্ভার লগ চেক করুন.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name সেটিংস';
  }

  @override
  String get adminPluginDetailDetails => 'বিস্তারিত';

  @override
  String get adminPluginDetailDeveloper => 'বিকাশকারী';

  @override
  String get adminPluginDetailRepository => 'ভান্ডার';

  @override
  String get adminPluginDetailBundled => 'বান্ডিল';

  @override
  String get adminPluginDetailEnablePlugin => 'প্লাগইন সক্ষম করুন';

  @override
  String get adminPluginDetailRestartRequired =>
      'পরিবর্তনগুলি কার্যকর করার জন্য একটি সার্ভার পুনরায় চালু করতে হবে৷';

  @override
  String get adminPluginDetailRemovalPending =>
      'সার্ভার পুনরায় চালু করার পরে এই প্লাগইনটি সরানো হবে।';

  @override
  String get adminPluginDetailMalfunctioned =>
      'এই প্লাগইনটি ত্রুটিপূর্ণ হয়েছে এবং সঠিকভাবে কাজ নাও করতে পারে।';

  @override
  String get adminPluginDetailNotSupported =>
      'এই প্লাগইন বর্তমান সার্ভার সংস্করণ দ্বারা সমর্থিত নয়.';

  @override
  String get adminPluginDetailSuperseded =>
      'এই প্লাগইনটি একটি নতুন সংস্করণ দ্বারা বাতিল করা হয়েছে৷';

  @override
  String adminReposLoadFailed(String error) {
    return 'সংগ্রহস্থল লোড করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminReposRemoveTitle => 'সংগ্রহস্থল সরান';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'আপনি কি \"$name\" সরানোর বিষয়ে নিশ্চিত?';
  }

  @override
  String get adminReposRemove => 'সরান';

  @override
  String adminReposSaveFailed(String error) {
    return 'সংগ্রহস্থল সংরক্ষণ করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminReposEmpty => 'কোন সংগ্রহস্থল কনফিগার করা নেই';

  @override
  String get adminReposEmptySubtitle =>
      'উপলব্ধ প্লাগইন ব্রাউজ করতে একটি সংগ্রহস্থল যোগ করুন';

  @override
  String get adminReposUnnamed => '(নামহীন)';

  @override
  String get adminReposEditTitle => 'সংগ্রহস্থল সম্পাদনা করুন';

  @override
  String get adminReposAddTitle => 'সংগ্রহস্থল যোগ করুন';

  @override
  String get adminReposUrl => 'সংগ্রহস্থল URL';

  @override
  String get adminReposNameHint => 'যেমন Jellyfin স্থিতিশীল';

  @override
  String get adminPluginSettingsInvalidUrl => 'অবৈধ URL';

  @override
  String get adminGeneralSettingsTitle => 'সাধারণ সেটিংস';

  @override
  String get adminGeneralMetadataLanguage => 'পছন্দের মেটাডেটা ভাষা';

  @override
  String get adminGeneralMetadataLanguageHint => 'যেমন en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'পছন্দের মেটাডেটা দেশ';

  @override
  String get adminGeneralMetadataCountryHint => 'যেমন US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'লাইব্রেরি স্ক্যান কনকারেন্সি';

  @override
  String get adminGeneralImageEncodingLimit => 'সমান্তরাল ছবি এনকোডিং সীমা';

  @override
  String get adminUnknownError => 'অজানা ত্রুটি';

  @override
  String get adminBrowse => 'ব্রাউজ করুন';

  @override
  String get adminCloseBrowser => 'ব্রাউজার বন্ধ করুন';

  @override
  String get adminNetworkingTitle => 'নেটওয়ার্কিং';

  @override
  String get adminNetworkingRestartWarning =>
      'নেটওয়ার্কিং সেটিংসে পরিবর্তনের জন্য সার্ভার পুনরায় চালু করার প্রয়োজন হতে পারে।';

  @override
  String get adminNetworkingRemoteAccess => 'দূরবর্তী অ্যাক্সেস সক্ষম করুন';

  @override
  String get adminNetworkingPorts => 'বন্দর';

  @override
  String get adminNetworkingHttpPort => 'HTTP পোর্ট';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS পোর্ট';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS সক্ষম করুন';

  @override
  String get adminNetworkingLocalNetwork => 'স্থানীয় নেটওয়ার্ক';

  @override
  String get adminNetworkingLocalAddresses => 'স্থানীয় নেটওয়ার্ক ঠিকানা';

  @override
  String get adminNetworkingAddressHint => 'যেমন 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'পরিচিত প্রক্সি';

  @override
  String get adminNetworkingProxyHint => 'যেমন 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'হোয়াইটলিস্ট';

  @override
  String get adminNetworkingBlacklist => 'কালো তালিকা';

  @override
  String get adminNetworkingAddEntry => 'এন্ট্রি যোগ করুন';

  @override
  String get adminBrandingTitle => 'ব্র্যান্ডিং';

  @override
  String get adminBrandingLoginDisclaimer => 'লগইন দাবিত্যাগ';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'লগইন ফর্মের নিচে এইচটিএমএল প্রদর্শিত হবে';

  @override
  String get adminBrandingCustomCss => 'কাস্টম সিএসএস';

  @override
  String get adminBrandingCustomCssHint =>
      'কাস্টম CSS ওয়েব ইন্টারফেসে প্রয়োগ করা হয়েছে';

  @override
  String get adminBrandingEnableSplash => 'স্প্ল্যাশ স্ক্রিন সক্ষম করুন';

  @override
  String get adminPlaybackHwAccel => 'হার্ডওয়্যার ত্বরণ';

  @override
  String get adminPlaybackHwAccelLabel => 'হার্ডওয়্যার ত্বরণ';

  @override
  String get adminPlaybackEnableHwEncoding => 'হার্ডওয়্যার এনকোডিং সক্ষম করুন';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'এর জন্য হার্ডওয়্যার ডিকোডিং সক্ষম করুন:';

  @override
  String get adminPlaybackEncoding => 'এনকোডিং';

  @override
  String get adminPlaybackEncodingThreads => 'থ্রেড এনকোডিং';

  @override
  String get adminPlaybackFallbackFont => 'ফলব্যাক ফন্ট সক্রিয় করুন';

  @override
  String get adminPlaybackFallbackFontPath => 'ফলব্যাক ফন্ট পাথ';

  @override
  String get adminPlaybackStreaming => 'স্ট্রিমিং';

  @override
  String get adminResumeVideo => 'ভিডিও';

  @override
  String get adminResumeAudiobooks => 'অডিওবুক';

  @override
  String get adminResumeMinAudiobookPct => 'ন্যূনতম অডিওবুক সারসংকলন শতাংশ';

  @override
  String get adminResumeMaxAudiobookPct => 'সর্বাধিক অডিওবুক সারসংকলন শতাংশ';

  @override
  String get adminStreamingBitrateLimit =>
      'দূরবর্তী ক্লায়েন্ট বিটরেট সীমা (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'সীমাহীনের জন্য খালি বা 0 ছেড়ে দিন';

  @override
  String get adminTrickplayHwAccel => 'হার্ডওয়্যার ত্বরণ সক্ষম করুন';

  @override
  String get adminTrickplayHwEncoding => 'হার্ডওয়্যার এনকোডিং সক্ষম করুন';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'কী ফ্রেম শুধুমাত্র নিষ্কাশন সক্ষম করুন';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'দ্রুত কিন্তু কম নির্ভুলতা';

  @override
  String get adminTrickplayNonBlocking => 'নন-ব্লকিং';

  @override
  String get adminTrickplayBlocking => 'ব্লকিং';

  @override
  String get adminTrickplayPriorityHigh => 'উচ্চ';

  @override
  String get adminTrickplayPriorityAboveNormal => 'স্বাভাবিকের উপরে';

  @override
  String get adminTrickplayPriorityNormal => 'স্বাভাবিক';

  @override
  String get adminTrickplayPriorityBelowNormal => 'স্বাভাবিকের নিচে';

  @override
  String get adminTrickplayPriorityIdle => 'নিষ্ক্রিয়';

  @override
  String get adminTrickplayImageSettings => 'ইমেজ সেটিংস';

  @override
  String get adminTrickplayInterval => 'ব্যবধান (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'কত ঘন ঘন ফ্রেম ক্যাপচার';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'কমা দ্বারা পৃথক করা পিক্সেল প্রস্থ (যেমন 320)';

  @override
  String get adminTrickplayQuality => 'গুণমান';

  @override
  String get adminTrickplayQScale => 'গুণমানের স্কেল';

  @override
  String get adminTrickplayQScaleSubtitle => 'নিম্ন মান = ভাল মানের, বড় ফাইল';

  @override
  String get adminTrickplayJpegQuality => 'JPEG গুণমান';

  @override
  String get adminTrickplayProcessing => 'প্রক্রিয়াকরণ';

  @override
  String get adminTasksEmpty => 'কোনো নির্ধারিত কাজ পাওয়া যায়নি';

  @override
  String get adminTasksNoFilterMatch =>
      'বর্তমান ফিল্টারের সাথে কোনো কাজ মেলে না';

  @override
  String get adminTaskCancelling => 'বাতিল হচ্ছে...';

  @override
  String get adminTaskRunning => 'চলছে...';

  @override
  String get adminTaskNeverRun => 'কখনো দৌড়াবেন না';

  @override
  String get adminTaskStop => 'থামো';

  @override
  String get adminTaskRun => 'চালান';

  @override
  String get adminTaskDetailLastExecution => 'শেষ মৃত্যুদন্ড';

  @override
  String get adminTaskDetailStarted => 'শুরু হয়েছে';

  @override
  String get adminTaskDetailEnded => 'শেষ হয়েছে';

  @override
  String get adminTaskDetailDuration => 'সময়কাল';

  @override
  String get adminTaskDetailErrorLabel => 'ত্রুটি:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'প্রতিদিন $time এ';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'প্রতি $day $time এ';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'প্রতি $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'অ্যাপ্লিকেশন স্টার্টআপে';

  @override
  String get adminTaskTriggerTypeDaily => 'দৈনিক';

  @override
  String get adminTaskTriggerTypeWeekly => 'সাপ্তাহিক';

  @override
  String get adminTaskTriggerTypeInterval => 'একটি বিরতিতে';

  @override
  String get adminTaskTriggerIntervalLabel => 'ব্যবধান';

  @override
  String get adminTaskTriggerEveryHour => 'প্রতি ঘণ্টায়';

  @override
  String get adminTaskTriggerEvery6Hours => 'প্রতি 6 ঘন্টা';

  @override
  String get adminTaskTriggerEvery12Hours => 'প্রতি 12 ঘন্টা';

  @override
  String get adminTaskTriggerEvery24Hours => 'প্রতি 24 ঘন্টা';

  @override
  String get adminTaskTriggerEvery2Days => 'প্রতি 2 দিন পর পর';

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
  String get adminTaskTriggerTime => 'সময়';

  @override
  String get adminTaskTriggerNoLimit => 'কোন সীমা নেই';

  @override
  String get adminActivityJustNow => 'এইমাত্র';

  @override
  String get adminActivityLastHour => 'শেষ ঘন্টা';

  @override
  String get adminActivityToday => 'আজ';

  @override
  String get adminActivityYesterday => 'গতকাল';

  @override
  String get adminActivityOlder => 'বয়স্ক';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days দিন আগে';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours ঘন্টা আগে';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes মিঃ আগে';
  }

  @override
  String get adminActivityNow => 'এখন';

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
      'প্রিভিউ থাম্বনেল খোঁজার জন্য ট্রিকপ্লে ইমেজ জেনারেশন কনফিগার করুন।';

  @override
  String get adminNetworkingPublicHttpsPort => 'পাবলিক HTTPS পোর্ট';

  @override
  String get adminNetworkingBaseUrl => 'বেস URL';

  @override
  String get adminNetworkingBaseUrlHint => 'যেমন /জেলিফিন';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'শংসাপত্রের পথ';

  @override
  String get adminNetworkingRemoteIpFilter => 'রিমোট আইপি ফিল্টার';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'দূরবর্তী আইপি ফিল্টার';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API ডিভাইস';

  @override
  String get adminPlaybackAutomatic => '0 = স্বয়ংক্রিয়';

  @override
  String get adminPlaybackTranscodeTempPath => 'টেম্প পাথ ট্রান্সকোডিং';

  @override
  String get adminPlaybackSegmentDeletion => 'সেগমেন্ট মুছে ফেলার অনুমতি দিন';

  @override
  String get adminPlaybackSegmentKeep => 'সেগমেন্ট রাখা (সেকেন্ড)';

  @override
  String get adminPlaybackThrottleBuffering => 'থ্রটল বাফারিং';

  @override
  String get adminResumeMinPct => 'ন্যূনতম জীবনবৃত্তান্ত শতাংশ';

  @override
  String get adminResumeMinPctSubtitle =>
      'বিষয়বস্তু অগ্রগতি সংরক্ষণ করতে এই শতাংশ অতিক্রম করা আবশ্যক';

  @override
  String get adminResumeMaxPct => 'সর্বোচ্চ জীবনবৃত্তান্ত শতাংশ';

  @override
  String get adminResumeMaxPctSubtitle =>
      'এই শতাংশের পরে বিষয়বস্তু সম্পূর্ণরূপে বাজানো বলে মনে করা হয়';

  @override
  String get adminResumeMinDuration =>
      'ন্যূনতম জীবনবৃত্তান্তের সময়কাল (সেকেন্ড)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'এর চেয়ে ছোট আইটেমগুলি পুনরায় শুরু করা যায় না';

  @override
  String get adminTrickplayScanBehavior => 'স্ক্যান আচরণ';

  @override
  String get adminTrickplayProcessPriority => 'প্রক্রিয়া অগ্রাধিকার';

  @override
  String get adminTrickplayTileWidth => 'টালি প্রস্থ';

  @override
  String get adminTrickplayTileHeight => 'টালি উচ্চতা';

  @override
  String get adminTrickplayProcessThreads => 'প্রক্রিয়া থ্রেড';

  @override
  String get adminTrickplayWidthResolutions => 'প্রস্থ রেজল্যুশন';

  @override
  String get adminMetadataDefault => 'ডিফল্ট';

  @override
  String get adminMetadataContentTypeUpdated =>
      'বিষয়বস্তুর প্রকার আপডেট করা হয়েছে';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'বিষয়বস্তুর প্রকার আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'ধীর প্রতিক্রিয়া থ্রেশহোল্ড (ms)';

  @override
  String get adminGeneralCachePath => 'ক্যাশে পথ';

  @override
  String get adminGeneralMetadataPath => 'মেটাডেটা পথ';

  @override
  String get adminGeneralServerName => 'সার্ভারের নাম';

  @override
  String get adminSettingsLoadFailed => 'সেটিংস লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get adminDiscover => 'আবিষ্কার করুন';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'ম্যাপিং আপডেট করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'সময়সীমা: $duration';
  }

  @override
  String get folders => 'ফোল্ডার';

  @override
  String get libraries => 'লাইব্রেরি';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay নিষ্ক্রিয়';

  @override
  String get syncPlayDisabledMessage =>
      'সিঙ্ক্রোনাইজ প্লেব্যাক ব্যবহার করতে সেটিংসে SyncPlay সক্ষম করুন৷';

  @override
  String get syncPlayServerUnsupportedTitle => 'সার্ভার অসমর্থিত';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay একটি Jellyfin সার্ভার প্রয়োজন৷ বর্তমান সার্ভার এটি সমর্থন করে না।';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay গ্রুপ';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay গ্রুপ';

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
  String get syncPlayIgnoreWait => 'অপেক্ষা উপেক্ষা করুন';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'এই ডিভাইসটি বাফার করার সময় গ্রুপটিকে ধরে রাখবেন না';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'ধীরগতির সদস্যদের জন্য অপেক্ষা না করে স্থানীয়ভাবে চালিয়ে যান';

  @override
  String get syncPlayRepeat => 'পুনরাবৃত্তি করুন';

  @override
  String get syncPlayRepeatOne => 'এক';

  @override
  String get syncPlayShuffleModeShuffled => 'এলোমেলো';

  @override
  String get syncPlayShuffleModeSorted => 'সাজানো';

  @override
  String get syncPlaySyncCurrentQueue => 'বর্তমান প্লেব্যাক সারি সিঙ্ক করুন';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'স্থানীয়ভাবে যা চলছে তা দিয়ে গোষ্ঠী সারি প্রতিস্থাপন করুন';

  @override
  String get syncPlayLeaveGroup => 'গ্রুপ ত্যাগ করুন';

  @override
  String get syncPlayGroupQueue => 'গ্রুপ সারি';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'আইটেম $index';
  }

  @override
  String get syncPlayPlayNow => 'এখন খেলা';

  @override
  String get syncPlayCreateNewGroup => 'একটি নতুন গ্রুপ তৈরি করুন';

  @override
  String get syncPlayGroupName => 'গ্রুপের নাম';

  @override
  String get syncPlayDefaultGroupName => 'আমার SyncPlay গ্রুপ';

  @override
  String get syncPlayCreateGroup => 'গ্রুপ তৈরি করুন';

  @override
  String get syncPlayAvailableGroups => 'উপলব্ধ গ্রুপ';

  @override
  String get syncPlayNoGroupsAvailable => 'কোন গ্রুপ উপলব্ধ নেই';

  @override
  String get syncPlayJoinGroupQuestion => 'SyncPlay গ্রুপে যোগ দেবেন?';

  @override
  String get syncPlayJoinGroupWarning =>
      'একটি SyncPlay গোষ্ঠীতে যোগদান আপনার বর্তমান প্লেব্যাক সারি প্রতিস্থাপন করতে পারে৷ চালিয়ে যান?';

  @override
  String get syncPlayJoin => 'যোগদান করুন';

  @override
  String get syncPlayStateIdle => 'নিষ্ক্রিয়';

  @override
  String get syncPlayStateWaiting => 'অপেক্ষা করছে';

  @override
  String get syncPlayStatePaused => 'বিরতি দেওয়া হয়েছে';

  @override
  String get syncPlayStatePlaying => 'বাজানো';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName SyncPlay গ্রুপে যোগ দিয়েছেন';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName বাম SyncPlay গ্রুপ';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay অ্যাক্সেস অস্বীকৃত';

  @override
  String get syncPlayAccessDeniedMessage =>
      'এই SyncPlay গ্রুপে আপনার এক বা একাধিক আইটেমের অ্যাক্সেস নেই। গ্রুপের মালিককে লাইব্রেরির অনুমতি যাচাই করতে বলুন বা একটি ভিন্ন সারি বেছে নিতে বলুন।';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return '$groupName এ প্লেব্যাক সিঙ্ক করা হচ্ছে';
  }

  @override
  String get voiceSearchUnavailable => 'ভয়েস অনুসন্ধান অনুপলব্ধ.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision সরাসরি খেলা ব্যর্থ হয়েছে';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'এই Dolby Vision স্ট্রীমের জন্য সরাসরি খেলা শুরু হতে ব্যর্থ হয়েছে৷ সার্ভার ট্রান্সকোড ব্যবহার করে আবার চেষ্টা করবেন?';

  @override
  String get retryWithTranscode => 'ট্রান্সকোড দিয়ে আবার চেষ্টা করুন';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision সমর্থিত নয়';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'এই ডিভাইসটি Dolby Vision বিষয়বস্তু সরাসরি ডিকোড করতে পারে না। HDR10 ফলব্যাক ব্যবহার করুন বা সার্ভার ট্রান্সকোডিংয়ের অনুরোধ করুন।';

  @override
  String get rememberMyChoice => 'আমার পছন্দ মনে রাখবেন';

  @override
  String get playHdr10Fallback => 'HDR10 ফলব্যাক চালান';

  @override
  String get requestTranscode => 'ট্রান্সকোড অনুরোধ করুন';

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
  String get seeAll => 'সব দেখুন';

  @override
  String get noItems => 'কোনো আইটেম নেই';

  @override
  String get switchUser => 'ব্যবহারকারী পরিবর্তন করুন';

  @override
  String get remoteControl => 'রিমোট কন্ট্রোল';

  @override
  String get mediaBarLoading => 'মিডিয়া বার লোড হচ্ছে...';

  @override
  String get mediaBarError => 'মিডিয়া বার লোড হতে ব্যর্থ হয়েছে';

  @override
  String get offlineServerUnavailable =>
      'ইন্টারনেটের সাথে সংযুক্ত, কিন্তু বর্তমান সার্ভারটি অনুপলব্ধ৷';

  @override
  String get offlineNoInternet =>
      'আপনি অফলাইনে আছেন। শুধুমাত্র ডাউনলোড করা সামগ্রী উপলব্ধ।';

  @override
  String get offlineFileNotAvailable => 'ফাইল উপলব্ধ নেই';

  @override
  String get offlineSwitchServer => 'সার্ভার স্যুইচ করুন';

  @override
  String get offlineSavedMedia => 'সংরক্ষিত মিডিয়া';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'রিমোট প্লেব্যাক';

  @override
  String castControlFailed(String error) {
    return 'কাস্ট নিয়ন্ত্রণ ব্যর্থ হয়েছে: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind নিয়ন্ত্রণ';
  }

  @override
  String get castDeviceVolume => 'ডিভাইসের ভলিউম';

  @override
  String get castVolumeUnavailable => 'অনুপলব্ধ';

  @override
  String castStopKind(String kind) {
    return 'থামুন $kind';
  }

  @override
  String get audioLabel => 'অডিও';

  @override
  String get subtitlesLabel => 'সাবটাইটেল';

  @override
  String get pinConfirmTitle => 'পিন নিশ্চিত করুন';

  @override
  String get pinSetTitle => 'পিন সেট করুন';

  @override
  String get pinEnterTitle => 'পিন লিখুন';

  @override
  String get pinReenterToConfirm => 'নিশ্চিত করতে আপনার পিন পুনরায় লিখুন';

  @override
  String pinEnterNDigit(int length) {
    return 'একটি $length-সংখ্যার পিন লিখুন';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'আপনার $length-সংখ্যার পিন লিখুন';
  }

  @override
  String get pinIncorrect => 'ভুল পিন';

  @override
  String get pinMismatch => 'পিন মেলে না';

  @override
  String get pinForgot => 'পিন ভুলে গেছেন?';

  @override
  String get pinClear => 'পরিষ্কার';

  @override
  String get pinBackspace => 'ব্যাকস্পেস';

  @override
  String get quickConnectAuthorized => 'দ্রুত সংযোগের অনুরোধ অনুমোদিত।';

  @override
  String get quickConnectInvalidOrExpired =>
      'দ্রুত সংযোগ কোড অবৈধ বা মেয়াদ উত্তীর্ণ.';

  @override
  String get quickConnectNotSupported => 'এই সার্ভারে দ্রুত সংযোগ সমর্থিত নয়৷';

  @override
  String get quickConnectAuthorizeFailed =>
      'দ্রুত সংযোগ কোড অনুমোদন করতে ব্যর্থ হয়েছে.';

  @override
  String get quickConnectDisabled =>
      'এই সার্ভারে দ্রুত সংযোগ নিষ্ক্রিয় করা হয়েছে৷';

  @override
  String get quickConnectForbidden =>
      'আপনার অ্যাকাউন্ট এই দ্রুত সংযোগের অনুরোধ অনুমোদন করতে পারে না৷';

  @override
  String get quickConnectNotFound =>
      'দ্রুত সংযোগ কোড পাওয়া যায়নি. একটি নতুন কোড চেষ্টা করুন.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'দ্রুত সংযোগ ব্যর্থ হয়েছে: $message';
  }

  @override
  String get quickConnectEnterCode => 'কোড লিখুন';

  @override
  String get quickConnectAuthorize => 'অনুমোদন করুন';

  @override
  String remoteCommandFailed(String error) {
    return 'কমান্ড ব্যর্থ হয়েছে: $error';
  }

  @override
  String get remoteControlTitle => 'রিমোট কন্ট্রোল';

  @override
  String get remoteFailedToLoadSessions => 'সেশনগুলি লোড করতে ব্যর্থ হয়েছে৷';

  @override
  String get remoteNoSessions => 'কোনো নিয়ন্ত্রণযোগ্য সেশন নেই';

  @override
  String get remoteStartPlayback => 'অন্য ডিভাইসে প্লেব্যাক শুরু করুন';

  @override
  String get unknownUser => 'অজানা';

  @override
  String get unknownItem => 'অজানা';

  @override
  String get remoteNothingPlaying => 'এই সেশনে কিছুই চলছে না';

  @override
  String get castingStarted => 'নির্বাচিত ডিভাইসে কাস্টিং শুরু হয়েছে৷';

  @override
  String castingFailed(String error) {
    return 'কাস্টিং শুরু করতে ব্যর্থ হয়েছে: $error';
  }

  @override
  String get noRemoteDevices => 'কোন দূরবর্তী প্লেব্যাক ডিভাইস উপলব্ধ.';

  @override
  String get noRemoteDevicesIos =>
      'কোন দূরবর্তী প্লেব্যাক ডিভাইস উপলব্ধ.\n\niOS-এ, AirPlay লক্ষ্যগুলি সিমুলেটরে অনুপলব্ধ হতে পারে৷';

  @override
  String get trackActionPlayNext => 'পরবর্তী খেলুন';

  @override
  String get trackActionAddToQueue => 'সারিতে যোগ করুন';

  @override
  String get trackActionAddToPlaylist => 'প্লেলিস্টে যোগ করুন';

  @override
  String get trackActionCancelDownload => 'ডাউনলোড বাতিল করুন';

  @override
  String get trackActionDeleteFromPlaylist => 'প্লেলিস্ট থেকে মুছুন';

  @override
  String get trackActionMoveUp => 'উপরে সরান';

  @override
  String get trackActionMoveDown => 'নিচে সরান';

  @override
  String get trackActionRemoveFromFavorites => 'প্রিয় থেকে সরান';

  @override
  String get trackActionAddToFavorites => 'ফেভারিটে যোগ করুন';

  @override
  String get trackActionGoToAlbum => 'অ্যালবামে যান';

  @override
  String get trackActionGoToArtist => 'শিল্পীর কাছে যান';

  @override
  String trackActionDownloading(String name) {
    return 'ডাউনলোড হচ্ছে $name...';
  }

  @override
  String get trackActionDeletedFile => 'ডাউনলোড করা ফাইল মুছে ফেলা হয়েছে';

  @override
  String get trackActionDeleteFileFailed => 'ডাউনলোড করা ফাইল মুছে ফেলা যায়নি';

  @override
  String get shuffleBy => 'এলোমেলো করে';

  @override
  String get shuffleSelectLibrary => 'লাইব্রেরি নির্বাচন করুন';

  @override
  String get shuffleSelectGenre => 'জেনার নির্বাচন করুন';

  @override
  String get shuffleLibrary => 'লাইব্রেরি';

  @override
  String get shuffleGenre => 'ধারা';

  @override
  String get shuffleNoLibraries => 'কোন সামঞ্জস্যপূর্ণ লাইব্রেরি উপলব্ধ.';

  @override
  String get shuffleNoGenres => 'এই শাফেল মোডের জন্য কোনো জেনার পাওয়া যায়নি।';

  @override
  String get posterDisplayTitle => 'প্রদর্শন';

  @override
  String get posterImageType => 'ছবির ধরন';

  @override
  String get imageTypePoster => 'পোস্টার';

  @override
  String get imageTypeThumbnail => 'থাম্বনেইল';

  @override
  String get imageTypeBanner => 'ব্যানার';

  @override
  String get playlistAddFailed => 'প্লেলিস্টে যোগ করতে ব্যর্থ হয়েছে৷';

  @override
  String get playlistCreateFailed => 'প্লেলিস্ট তৈরি করতে ব্যর্থ হয়েছে৷';

  @override
  String get playlistNew => 'নতুন প্লেলিস্ট';

  @override
  String get playlistCreate => 'তৈরি করুন';

  @override
  String get playlistCreateNew => 'নতুন প্লেলিস্ট তৈরি করুন';

  @override
  String get playlistNoneFound => 'কোনো প্লেলিস্ট পাওয়া যায়নি';

  @override
  String get addToPlaylist => 'প্লেলিস্টে যোগ করুন';

  @override
  String get lyricsNotAvailable => 'কোন গান উপলব্ধ';

  @override
  String get upNext => 'আপ নেক্সট';

  @override
  String get playNext => 'পরবর্তী খেলুন';

  @override
  String get stillWatchingContent =>
      'প্লেব্যাক বিরাম দেওয়া হয়েছে. আপনি কি এখনও দেখছেন?';

  @override
  String get stillWatchingStop => 'থামো';

  @override
  String get stillWatchingContinue => 'চালিয়ে যান';

  @override
  String skipSegment(String segment) {
    return 'এড়িয়ে যান $segment';
  }

  @override
  String get liveTv => 'লাইভ টিভি';

  @override
  String get continueWatchingAndNextUp => 'দেখা চালিয়ে যান এবং পরবর্তী';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'ডাউনলোড হচ্ছে $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'ডাউনলোড হচ্ছে $fileName';
  }

  @override
  String get nextEpisode => 'পরবর্তী পর্ব';

  @override
  String get moreFromThisSeason => 'এই ঋতু থেকে আরো';

  @override
  String get playerTooltipPlaybackSpeed => 'প্লেব্যাক গতি';

  @override
  String get playerTooltipCastControls => 'কাস্ট নিয়ন্ত্রণ';

  @override
  String get playerTooltipPlaybackQuality => 'বিটরেট';

  @override
  String get playerTooltipEnterFullscreen => 'পূর্ণস্ক্রীনে প্রবেশ করুন';

  @override
  String get playerTooltipExitFullscreen => 'পূর্ণস্ক্রীন থেকে প্রস্থান করুন';

  @override
  String get playerTooltipFloatOnTop => 'উপরে ভাসা';

  @override
  String get playerTooltipExitFloatOnTop => 'উপরে ফ্লোট অক্ষম করুন';

  @override
  String get playerTooltipLockLandscape => 'লক ল্যান্ডস্কেপ';

  @override
  String get playerTooltipUnlockOrientation => 'ঘূর্ণনের অনুমতি দিন';

  @override
  String get playerTooltipPrevious => 'আগের';

  @override
  String get playerTooltipSeekBack => 'ফিরে চাও';

  @override
  String get playerTooltipSeekForward => 'সামনে তাকান';

  @override
  String get contextMenuMarkWatched => 'দেখা হয়েছে হিসেবে চিহ্নিত করুন';

  @override
  String get contextMenuMarkUnwatched => 'অপরিবর্তিত হিসাবে চিহ্নিত করুন';

  @override
  String get contextMenuAddToFavorites => 'ফেভারিটে যোগ করুন';

  @override
  String get contextMenuRemoveFromFavorites => 'প্রিয় থেকে সরান';

  @override
  String get contextMenuGoToSeries => 'সিরিজে যান';

  @override
  String get settingsAdministrationSubtitle =>
      'সার্ভার প্রশাসন প্যানেল অ্যাক্সেস করুন';

  @override
  String get settingsAccountSecurity => 'অ্যাকাউন্ট ও নিরাপত্তা';

  @override
  String get settingsAccountSecuritySubtitle =>
      'প্রমাণীকরণ, পিন কোড এবং অভিভাবকীয় নিয়ন্ত্রণ';

  @override
  String get settingsPersonalization => 'ব্যক্তিগতকরণ';

  @override
  String get settingsPersonalizationSubtitle =>
      'থিম, নেভিগেশন, হোম সারি, এবং লাইব্রেরি দৃশ্যমানতা';

  @override
  String get settingsDynamicContent => 'ডায়নামিক কন্টেন্ট';

  @override
  String get settingsDynamicContentSubtitle =>
      'মিডিয়া বার এবং ভিজ্যুয়াল ওভারলে';

  @override
  String get settingsPlaybackSyncplay => 'প্লেব্যাক এবং SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'অডিও/ভিডিও সেটিংস, সাবটাইটেল, ডাউনলোড এবং SyncPlay নিয়ন্ত্রণ';

  @override
  String get settingsIntegrationsSubtitle =>
      'প্লাগইন সিঙ্ক, Seerr, রেটিং, এবং আরও অনেক কিছু';

  @override
  String get settingsAboutSubtitle => 'অ্যাপ সংস্করণ, আইনি তথ্য এবং ক্রেডিট';

  @override
  String get settingsAuthenticationSection => 'প্রমাণীকরণ';

  @override
  String get settingsSortServersBy => 'দ্বারা সার্ভার সাজান';

  @override
  String get settingsLastUsed => 'সর্বশেষ ব্যবহৃত';

  @override
  String get settingsAlphabetical => 'বর্ণানুক্রমিক';

  @override
  String get settingsPrivacyAndSafetySection => 'গোপনীয়তা এবং নিরাপত্তা';

  @override
  String get settingsBlockedRatings => 'অবরুদ্ধ রেটিং';

  @override
  String get settingsGeneralStyle => 'সাধারণ শৈলী';

  @override
  String get settingsGeneralStyleSubtitle =>
      'থিম অ্যাকসেন্ট, ব্যাকড্রপ, দেখা সূচক এবং থিম মিউজিক';

  @override
  String get settingsHomePage => 'হোম পেজ';

  @override
  String get settingsHomePageSubtitle =>
      'বিভাগ, ছবির ধরন, ওভারলে এবং মিডিয়া প্রিভিউ';

  @override
  String get settingsLibrariesSubtitle =>
      'লাইব্রেরি দৃশ্যমানতা, ফোল্ডার ভিউ এবং মাল্টি-সার্ভার আচরণ';

  @override
  String get settingsTwentyFourHourClock => '24 ঘন্টা ঘড়ি';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'যেখানে ঘড়ি দেখানো হয় সেখানে 24-ঘন্টা সময় বিন্যাস ব্যবহার করুন';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'নেভিগেশন বারে শাফেল বোতামটি দেখান';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'নেভিগেশন বারে জেনার বোতামটি দেখান';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'নেভিগেশন বারে পছন্দের বোতামটি দেখান';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'নেভিগেশন বারে লাইব্রেরি বোতামটি দেখান';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'লাইব্রেরি প্রতি হোম পেজ দৃশ্যমানতা টগল করুন। পরিবর্তনগুলি কার্যকর করার জন্য Moonfin পুনরায় চালু করুন৷';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'মিডিয়া বার এবং স্থানীয় পূর্বরূপ';

  @override
  String get settingsVisualOverlays => 'ভিজ্যুয়াল ওভারলে';

  @override
  String get settingsSeasonalSurprise => 'ঋতু চমক';

  @override
  String get settingsMetadataAndRatings => 'মেটাডেটা এবং রেটিং';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase অতিরিক্ত রেটিং উত্স, Seerr অনুরোধ এবং সিঙ্ক করা পছন্দগুলি সহ সার্ভার-সাইড ইন্টিগ্রেশন ক্ষমতা দেয়৷';

  @override
  String get settingsOfflineDownloads => 'অফলাইন ডাউনলোড';

  @override
  String get settingsHigh => 'উচ্চ';

  @override
  String get settingsLow => 'কম';

  @override
  String get settingsCustomPath => 'কাস্টম পথ';

  @override
  String get settingsEnterDownloadFolderPath => 'ডাউনলোড ফোল্ডার পাথ লিখুন';

  @override
  String get settingsConcurrentDownloads => 'সমসাময়িক ডাউনলোড';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'একবারে ডাউনলোড করার জন্য সর্বাধিক আইটেম সংখ্যা।';

  @override
  String get settingsAppInfo => 'অ্যাপ তথ্য';

  @override
  String get settingsReportAnIssue => 'একটি সমস্যা রিপোর্ট করুন';

  @override
  String get settingsReportAnIssueSubtitle => 'GitHub এ ইস্যু ট্র্যাকার খুলুন';

  @override
  String get settingsJoinDiscord => 'যোগ দিন Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'সম্প্রদায়ের সাথে চ্যাট করুন';

  @override
  String get settingsJoinTheDiscord => 'যোগ দিন Discord';

  @override
  String get settingsSupportMoonfin => 'সমর্থন Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'বিকাশকারীকে একটি কফি দান করুন';

  @override
  String get settingsLegal => 'আইনি';

  @override
  String get settingsLicenses => 'লাইসেন্স';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'ওপেন সোর্স লাইসেন্স বিজ্ঞপ্তি';

  @override
  String get settingsPrivacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Moonfin কীভাবে আপনার ডেটা পরিচালনা করে';

  @override
  String get settingsCheckForUpdates => 'আপডেটের জন্য চেক করুন';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'সর্বশেষ Moonfin রিলিজের জন্য চেক করুন';

  @override
  String get settingsPoweredByFlutter => 'ফ্লটার দ্বারা চালিত';

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
  String get settingsBoth => 'উভয়';

  @override
  String get settingsShuffleContentTypeFilter =>
      'কন্টেন্ট টাইপ ফিল্টার এলোমেলো করুন';

  @override
  String get settingsVideoPlaybackPreferences => 'ভিডিও প্লেব্যাক পছন্দসমূহ';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'মূল ভিডিও ইঞ্জিন এবং স্ট্রিমিং মানের সেটিংস';

  @override
  String get settingsAudioPreferences => 'অডিও পছন্দ';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'অডিও ট্র্যাক, প্রক্রিয়াকরণ, এবং পাসথ্রু বিকল্প';

  @override
  String get settingsAutomationAndQueue => 'অটোমেশন এবং সারি';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'স্বয়ংক্রিয় প্লেব্যাক এবং সিকোয়েন্সিং';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'ডাউনলোডের গুণমান, সঞ্চয়ের সীমা এবং সারির আকার';

  @override
  String get settingsSyncplaySubtitle =>
      'গ্রুপ সেশনের জন্য সিঙ্ক্রোনাইজেশন লজিক';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'বিশেষায়িত প্লেয়ার বৈশিষ্ট্য. সতর্কতার সাথে ব্যবহার করুন, কারণ কিছু বিকল্প প্লেব্যাক সমস্যার কারণ হতে পারে';

  @override
  String get settingsSkipIntrosAndOutros => 'Intros এবং Outros এড়িয়ে যান?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'প্রম্পট ব্যবহারকারী';

  @override
  String get settingsSkip => 'এড়িয়ে যান';

  @override
  String get settingsDoNothing => 'কিছুই করবেন না';

  @override
  String get settingsMaxBitrateDescription =>
      'স্ট্রিমিং বিটরেট ক্যাপ করুন। এই থ্রেশহোল্ডের উপরে কন্টেন্ট ফিট করার জন্য ট্রান্সকোড করা হবে।';

  @override
  String get settingsMaxResolutionDescription =>
      'প্লেয়ার অনুরোধ করবে সর্বোচ্চ রেজোলিউশন সীমিত. উচ্চ-রেজোলিউশনের বিষয়বস্তু ট্রান্সকোড করা হবে।';

  @override
  String get settingsPlayerZoomDescription =>
      'স্ক্রীনে ফিট করার জন্য ভিডিওকে কীভাবে স্কেল করা উচিত।';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'প্লেব্যাক ইঞ্জিন (অ্যান্ড্রয়েড টিভি)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Android TV ডিভাইসে ডিফল্ট প্লেব্যাক ইঞ্জিন বেছে নিন। পরিবর্তনগুলি পরবর্তী প্লেব্যাক সেশনে প্রযোজ্য।';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (প্রস্তাবিত)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (উত্তরাধিকার)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (উত্তরাধিকার)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (প্রস্তাবিত)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision ফলব্যাক';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Dolby Vision ডিকোডিং ছাড়া ডিভাইসে Dolby Vision শিরোনামের জন্য আচরণ।';

  @override
  String get settingsAskEachTime => 'প্রতিবার জিজ্ঞাসা করুন';

  @override
  String get settingsPreferHdr10Fallback => 'HDR10 ফলব্যাক পছন্দ করুন';

  @override
  String get settingsPreferServerTranscode => 'সার্ভার ট্রান্সকোড পছন্দ করুন';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision প্রোফাইল 7 ডাইরেক্ট প্লে';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Dolby Vision প্রোফাইল 7 এনহান্সমেন্ট-লেয়ার স্ট্রীম সরাসরি প্লে করা উচিত কিনা তা নিয়ন্ত্রণ করে।';

  @override
  String get settingsAutoAftkrtEnabled => 'স্বয়ংক্রিয় (AFTKRT সক্ষম)';

  @override
  String get settingsEnabledOnThisDevice => 'এই ডিভাইসে সক্ষম';

  @override
  String get settingsDisabledPreferTranscode => 'অক্ষম (ট্রান্সকোড পছন্দ করুন)';

  @override
  String get settingsResumeRewindDescription =>
      'প্লেব্যাক পুনরায় শুরু করার সময় (দেখা চালিয়ে যাওয়া বা একটি মিডিয়া আইটেম পৃষ্ঠা থেকে), কত সেকেন্ড রিওয়াউন্ড করা উচিত?';

  @override
  String get settingsUnpauseRewindDescription =>
      'বিরতি বোতাম টিপে প্লেব্যাক পুনরায় শুরু করার সময়, কত সেকেন্ড রিওয়াউন্ড করতে হবে?';

  @override
  String get settingsSkipBackLengthDescription =>
      'রিওয়াইন্ড বোতাম টিপে কত সেকেন্ড পিছনে লাফ দিতে হবে।';

  @override
  String get settingsOneSecond => '1 সেকেন্ড';

  @override
  String get settingsThreeSeconds => '3 সেকেন্ড';

  @override
  String get settingsFortyFiveSeconds => '45 সেকেন্ড';

  @override
  String get settingsSixtySeconds => '60 সেকেন্ড';

  @override
  String get settingsSkipForwardLengthDescription =>
      'ফাস্ট ফরওয়ার্ড বোতাম টিপে কত সেকেন্ড এগিয়ে যেতে হবে।';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'বিটস্ট্রিম AC3 থেকে বাহ্যিক ডিকোডার';

  @override
  String get settingsCinemaMode => 'সিনেমা মোড';

  @override
  String get settingsCinemaModeSubtitle =>
      'একটি প্রধান বৈশিষ্ট্যের আগে ট্রেলার/প্রিরোল চালান';

  @override
  String get settingsNextUpDisplayDescription =>
      'বর্ধিত পর্বের আর্টওয়ার্ক এবং বিবরণ সহ একটি সম্পূর্ণ কার্ড দেখায়। ন্যূনতম একটি কমপ্যাক্ট কাউন্টডাউন ওভারলে দেখায়। অক্ষম সম্পূর্ণরূপে প্রম্পট লুকায়।';

  @override
  String get settingsShort => 'সংক্ষিপ্ত';

  @override
  String get settingsLong => 'দীর্ঘ';

  @override
  String get settingsVeryLong => 'খুব দীর্ঘ';

  @override
  String get settingsVideoStartDelay => 'ভিডিও শুরু করতে বিলম্ব';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'লাইভ টিভি সরাসরি';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'লাইভ টিভির জন্য সরাসরি খেলা সক্ষম করুন৷';

  @override
  String get settingsOpenGroups => 'গ্রুপ খুলুন';

  @override
  String get settingsOpenGroupsSubtitle =>
      'SyncPlay গ্রুপ তৈরি করুন, যোগদান করুন বা পরিচালনা করুন';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay সক্ষম';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'গ্রুপ দেখার বৈশিষ্ট্যগুলি সক্ষম করুন৷';

  @override
  String get settingsSyncplayButton => 'SyncPlay বোতাম';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'নেভিগেশন বারে SyncPlay বোতামটি দেখান';

  @override
  String get settingsSyncplayAdvancedCorrection => 'উন্নত সংশোধন';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'সূক্ষ্ম সিঙ্ক লজিক সক্ষম করুন৷';

  @override
  String get settingsSyncplaySyncCorrection => 'সিঙ্ক সংশোধন';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'সিঙ্কে থাকার জন্য স্বয়ংক্রিয়ভাবে প্লেব্যাক সামঞ্জস্য করুন';

  @override
  String get settingsSyncplaySpeedToSync => 'সিঙ্ক করার গতি';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'সিঙ্ক করতে প্লেব্যাক গতি সমন্বয় ব্যবহার করুন';

  @override
  String get settingsSyncplaySkipToSync => 'সিঙ্ক এ যান';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'সিঙ্ক করতে চাওয়া ব্যবহার করুন';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'ন্যূনতম গতি বিলম্ব';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'সর্বোচ্চ গতি বিলম্ব';

  @override
  String get settingsSyncplaySpeedDuration => 'গতির সময়কাল';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'ন্যূনতম বিলম্ব এড়িয়ে যান';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay অতিরিক্ত অফসেট';

  @override
  String get onNow => 'এখন অন';

  @override
  String get collections => 'সংগ্রহ';

  @override
  String get lastPlayed => 'শেষ খেলা';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'সর্বশেষ $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
  }

  @override
  String get autoplayNextEpisode => 'অটোপ্লে পরবর্তী পর্ব';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'উপলব্ধ হলে স্বয়ংক্রিয়ভাবে পরের পর্বটি চালান।';

  @override
  String get skipSilenceTitle => 'নীরবতা এড়িয়ে যান';

  @override
  String get skipSilenceSubtitle =>
      'স্ট্রিম দ্বারা সমর্থিত হলে স্বয়ংক্রিয়ভাবে নীরব অডিও সেগমেন্টগুলি এড়িয়ে যান।';

  @override
  String get allowExternalAudioEffectsTitle =>
      'বাহ্যিক অডিও প্রভাবের অনুমতি দিন';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Media3 প্লেব্যাক সেশনে ইকুয়ালাইজার এবং ইফেক্ট অ্যাপগুলিকে (যেমন ওয়েভলেট) সংযুক্ত করার অনুমতি দিন।';

  @override
  String get disableTunnelingTitle => 'টানেলিং অক্ষম করুন';

  @override
  String get disableTunnelingSubtitle =>
      'অ-টানেল প্লেব্যাক জোর করুন। টানেলিং অডিও/ভিডিও বন্ধ থাকা ডিভাইসগুলিতে দরকারী।';

  @override
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision প্রোফাইল 7 HEVC-তে ম্যাপ করুন';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision প্রোফাইল ৭টি স্ট্রীম HDR10-সামঞ্জস্যপূর্ণ HEVC হিসেবে নন-ডিভি ডিভাইসে চালান।';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'এমবেডেড সাবটাইটেল শৈলী ব্যবহার করুন';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'সাবটাইটেল ট্র্যাকে এমবেড করা রং, ফন্ট এবং পজিশনিং প্রয়োগ করুন। পরিবর্তে আপনার ক্যাপশন শৈলী পছন্দগুলি ব্যবহার করতে অক্ষম করুন৷';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'এমবেডেড সাবটাইটেল ফন্ট আকার ব্যবহার করুন';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'সাবটাইটেল ট্র্যাকে এমবেড করা ফন্ট-আকারের ইঙ্গিতগুলি প্রয়োগ করুন৷ আপনার শৈলী পছন্দগুলি থেকে সাবটাইটেল আকার ব্যবহার করতে অক্ষম করুন৷';

  @override
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

  @override
  String get useDetailedSubHeadings => 'বিস্তারিত উপ-শিরোনাম ব্যবহার করুন';

  @override
  String get useDetailedSubHeadingsDescription =>
      'লাইব্রেরির পাতায় বিস্তারিত বা ন্যূনতম সাবরো দেখান।';

  @override
  String get savedThemesDeleteDialogTitle => 'সংরক্ষিত থিম মুছবেন?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'এই ডিভাইস ক্যাশে থেকে \"$themeName\" সরাতে চান?';
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
    return 'এই ডিভাইস থেকে \"$themeName\" মুছে ফেলা হয়েছে।';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '\"$themeName\" মুছে ফেলা যায়নি।';
  }

  @override
  String get savedThemesTitle => 'সংরক্ষিত থিম';

  @override
  String get savedThemesDescription =>
      'এগুলি বর্তমান সার্ভারের জন্য Moonfin প্লাগইন থেকে ডাউনলোড করা থিম। মুছে ফেলা শুধুমাত্র এই স্থানীয় অনুলিপি মুছে ফেলা হয়.';

  @override
  String get savedThemesEmpty =>
      'এই সার্ভারের জন্য কোনো সংরক্ষিত থিম পাওয়া যায়নি।';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • বর্তমানে সক্রিয়';
  }

  @override
  String get savedThemesDeleteTooltip => 'সংরক্ষিত থিম মুছুন';

  @override
  String get savedThemesManageSubtitle =>
      'এই ডিভাইসে ডাউনলোড করা প্লাগইন থিম পরিচালনা করুন';

  @override
  String get themeEditor => 'থিম সম্পাদক';

  @override
  String get themeEditorSubtitle => 'আপনার ব্রাউজারে Moonfin থিম এডিটর খুলুন';

  @override
  String get homeScreen => 'হোম স্ক্রীন';

  @override
  String get bottomBar => 'নিচের বার';

  @override
  String get homeRowsStyleClassic => 'ক্লাসিক';

  @override
  String get homeRowsStyleModern => 'আধুনিক';

  @override
  String get homeRowsSection => 'বাড়ির সারি';

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
  String get rowsType => 'সারি টাইপ';

  @override
  String get rowsTypeDescription =>
      'ক্লাসিক প্রতি-সারি ছবির ধরন এবং তথ্য ওভারলে রাখে। আধুনিক পোর্ট্রেট-টু-ব্যাকড্রপ সারি ব্যবহার করে।';

  @override
  String get displayFavoritesRows => 'পছন্দের সারি প্রদর্শন করুন';

  @override
  String get displayFavoritesRowsSubtitle =>
      'হোম বিভাগে প্রিয় সিনেমা, সিরিজ এবং অন্যান্য প্রিয় সারি দেখান।';

  @override
  String get favoritesRowSorting => 'প্রিয় সারি বাছাই';

  @override
  String get favoritesRowSortingDescription =>
      'যোগ করা তারিখ, প্রকাশের তারিখ, বর্ণানুক্রমিকভাবে, এবং আরও অনেক কিছু অনুসারে পছন্দের সারিগুলি সাজান৷';

  @override
  String get displayCollectionsRows => 'সংগ্রহের সারি প্রদর্শন করুন';

  @override
  String get displayCollectionsRowsSubtitle =>
      'হোম বিভাগে সংগ্রহের সারি দেখান।';

  @override
  String get collectionsRowSorting => 'সংগ্রহ সারি বাছাই';

  @override
  String get collectionsRowSortingDescription =>
      'যোগ করা তারিখ, প্রকাশের তারিখ, বর্ণানুক্রমিকভাবে এবং আরও অনেক কিছু অনুসারে সংগ্রহের সারি সাজান।';

  @override
  String get displayGenresRows => 'জেনার সারি প্রদর্শন করুন';

  @override
  String get displayGenresRowsSubtitle => 'হোম সেকশনে জেনারের সারি দেখান।';

  @override
  String get genresRowSorting => 'জেনারস সারি বাছাই';

  @override
  String get genresRowSortingDescription =>
      'যোগ করা তারিখ, প্রকাশের তারিখ, বর্ণানুক্রমিকভাবে, এবং আরও অনেক কিছু অনুসারে জেনার সারি সাজান।';

  @override
  String get genresRowItems => 'জেনারস সারি আইটেম';

  @override
  String get genresRowItemsDescription =>
      'সিনেমা, সিরিজ বা উভয় প্রকারের সারিতে দেখান।';

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
  String get appearance => 'চেহারা';

  @override
  String get cardSize => 'কার্ড সাইজ';

  @override
  String get externalPlayerApp => 'এক্সটার্নাল প্লেয়ার অ্যাপ';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'প্লেব্যাক শুরু হলে অ্যাপ চয়নকারী দেখান।';

  @override
  String get loadingInstalledPlayers => 'ইনস্টল করা প্লেয়ার লোড হচ্ছে...';

  @override
  String get connection => 'সংযোগ';

  @override
  String get audioTranscodeTarget => 'অডিও ট্রান্সকোড লক্ষ্য';

  @override
  String get passthrough => 'পাসথ্রু';

  @override
  String get supportedOnThisDevice => 'এই ডিভাইসে সমর্থিত';

  @override
  String get notSupportedOnThisDevice => 'এই ডিভাইসে সমর্থিত নয়';

  @override
  String get settingsAudioDtsXPassthrough => 'DTS:X (DTS UHD) পাসথ্রু';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'বিটস্ট্রিম ডিটিএস: এক্স (ডিটিএস ইউএইচডি) থেকে এক্সটার্নাল ডিকোডার।';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Atmos (JOC) পাসথ্রু সহ TrueHD';

  @override
  String get mediaPlayerBehavior => 'মিডিয়া প্লেয়ার আচরণ';

  @override
  String get playbackEnhancements => 'প্লেব্যাক বর্ধিতকরণ';

  @override
  String get alwaysOn => 'সর্বদা চালু';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'নেক্সট আপ ডিসপ্লে দিয়ে স্কিপ আউটরো প্রতিস্থাপন করুন';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Skip Outro বোতামের পরিবর্তে Next Up ওভারলে দেখান।';

  @override
  String get playerRouting => 'প্লেয়ার রাউটিং';

  @override
  String get preferSoftwareDecoders => 'সফ্টওয়্যার ডিকোডার পছন্দ করুন';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'হার্ডওয়্যার ডিকোডারের আগে FFmpeg (অডিও) এবং libgav1 (AV1) ব্যবহার করুন। HDMI অডিও পাসথ্রু বিরতি হলে অক্ষম করুন।';

  @override
  String get useExternalPlayer => 'বাহ্যিক প্লেয়ার ব্যবহার করুন';

  @override
  String get useExternalPlayerSubtitle =>
      'Android TV-তে আপনার নির্বাচিত বাহ্যিক অ্যাপে ভিডিও প্লেব্যাক খুলুন।';

  @override
  String get automaticQueuing => 'স্বয়ংক্রিয় সারিবদ্ধ';

  @override
  String get preferSdhSubtitles => 'SDH সাবটাইটেল পছন্দ করুন';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'স্বয়ংক্রিয়ভাবে নির্বাচন করার সময় SDH/CC সাবটাইটেল ট্র্যাকগুলিকে অগ্রাধিকার দিন৷';

  @override
  String get webDiagnostics => 'ওয়েব ডায়াগনস্টিকস';

  @override
  String get webDiagnosticsTitle => 'Moonfin ওয়েব ডায়াগনস্টিকস';

  @override
  String get webDiagnosticsIntro =>
      'ব্রাউজার সংযোগ সমস্যা (CORS, মিশ্র বিষয়বস্তু, এবং আবিষ্কার সেটিংস) নির্ণয় করতে এই পৃষ্ঠাটি ব্যবহার করুন।';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'মিশ্র-সামগ্রী ব্যর্থতা সনাক্ত করা হয়েছে';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'সনাক্ত করা CORS/প্রিফ্লাইট ব্যর্থতা';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin একটি HTTPS পৃষ্ঠা সনাক্ত করেছে যা একটি HTTP সার্ভার URL কল করার চেষ্টা করছে৷ ব্রাউজার এই অনুরোধটি আপনার সার্ভারে পৌঁছানোর আগেই ব্লক করে।';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin একটি ব্রাউজার-স্তরের অনুরোধ ব্যর্থতা সনাক্ত করেছে যা সাধারণত মিডিয়া সার্ভারে CORS বা প্রিফ্লাইট হেডার অনুপস্থিত হওয়ার কারণে ঘটে।';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'টার্গেট URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'বিস্তারিত: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'বর্তমান রানটাইম প্রসঙ্গ';

  @override
  String get webDiagnosticsOrigin => 'উৎপত্তি';

  @override
  String get webDiagnosticsScheme => 'স্কিম';

  @override
  String get webDiagnosticsPluginMode => 'প্লাগইন মোড';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC স্ক্যান';

  @override
  String get webDiagnosticsForcedServerUrl => 'ফোর্সড সার্ভার URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'ডিফল্ট সার্ভার URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'আবিষ্কার প্রক্সি URL';

  @override
  String get notConfigured => 'কনফিগার করা হয়নি';

  @override
  String get webDiagnosticsMixedContent => 'মিশ্র বিষয়বস্তু';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'এই পৃষ্ঠাটি HTTPS-এর মাধ্যমে লোড করা হয়েছে, কিন্তু এক বা একাধিক কনফিগার করা URL হল HTTP৷ ব্রাউজার HTTPS পৃষ্ঠাগুলিকে HTTP API কল করা থেকে ব্লক করে।';

  @override
  String get webDiagnosticsMixedContentFix =>
      'ঠিক করুন: HTTPS এর মাধ্যমে আপনার মিডিয়া সার্ভার বা প্রক্সি এন্ডপয়েন্ট পরিবেশন করুন, অথবা শুধুমাত্র বিশ্বস্ত স্থানীয় নেটওয়ার্কগুলিতে HTTP-এর উপর Moonfin লোড করুন।';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'বর্তমান রানটাইম সেটিংস থেকে কোনো সুস্পষ্ট মিশ্র-সামগ্রী কনফিগারেশন সনাক্ত করা যায়নি।';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS চেকলিস্ট';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• অ্যাক্সেস-কন্ট্রোল-অ্যালো-অরিজিনে ব্রাউজার অরিজিনকে অনুমতি দিন।';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• অনুমোদন, X-Emby-অনুমোদন, এবং X-Emby-টোকেন অ্যাক্সেস-কন্ট্রোল-অ্যালো-হেডার অন্তর্ভুক্ত করুন।';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• স্ট্রিমিং এবং চাওয়ার আচরণের জন্য বিষয়বস্তু-পরিসীমা এবং গ্রহণ-পরিসীমা প্রকাশ করুন।';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• OPTIONS preflight অনুরোধে 204 রিটার্ন করুন।';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'উদাহরণ হেডার স্নিপেট (nginx-শৈলী)';

  @override
  String get note => 'দ্রষ্টব্য';

  @override
  String get webDiagnosticsNonWebNote =>
      'এই ডায়াগনস্টিক রুটটি ওয়েব বিল্ডের উদ্দেশ্যে। আপনি যদি এটি অন্য প্ল্যাটফর্মে দেখে থাকেন তবে এই চেকগুলি প্রযোজ্য নাও হতে পারে৷';

  @override
  String get backToServerSelect => 'ব্যাক টু সার্ভার সিলেক্ট';

  @override
  String get signOutAllUsers => 'সাইন আউট সব ব্যবহারকারী';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'মাইক্রোফোন অনুমতি স্থায়ীভাবে অস্বীকার করা হয়েছে. সিস্টেম সেটিংসে এটি সক্ষম করুন।';

  @override
  String get voiceSearchPermissionRequired =>
      'ভয়েস অনুসন্ধানের জন্য মাইক্রোফোনের অনুমতি প্রয়োজন৷';

  @override
  String get voiceSearchNoMatch => 'সেটা ধরতে পারিনি। আবার চেষ্টা করুন';

  @override
  String get voiceSearchNoSpeechDetected => 'কোন বক্তৃতা সনাক্ত করা যায়নি.';

  @override
  String get voiceSearchMicrophoneError => 'মাইক্রোফোন ত্রুটি।';

  @override
  String get voiceSearchNeedsInternet => 'ভয়েস অনুসন্ধান ইন্টারনেট প্রয়োজন.';

  @override
  String get voiceSearchServiceBusy => 'ভয়েস সার্ভিস ব্যস্ত। আবার চেষ্টা করুন';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'মাইক্রোফোন অনুমতি স্থায়ীভাবে অস্বীকার করা হয়েছে.';

  @override
  String get microphonePermissionDenied =>
      'মাইক্রোফোন অনুমতি অস্বীকার করা হয়েছে.';

  @override
  String get speechRecognitionUnavailable =>
      'এই ডিভাইসে বক্তৃতা শনাক্তকরণ অনুপলব্ধ৷';

  @override
  String get openIosRoutePicker => 'iOS রুট পিকার খুলুন';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay রুট পিকার এই ডিভাইসে অনুপলব্ধ৷';

  @override
  String get videos => 'ভিডিও';

  @override
  String get trailers => 'ট্রেলার';

  @override
  String get programs => 'প্রোগ্রাম';

  @override
  String get songs => 'গান';

  @override
  String get photoAlbums => 'ফটো অ্যালবাম';

  @override
  String get photos => 'ফটো';

  @override
  String get people => 'মানুষ';

  @override
  String get recentlyReleasedEpisodes => 'সম্প্রতি প্রকাশিত পর্বগুলি';

  @override
  String get watchAgain => 'আবার দেখুন';

  @override
  String get guestAppearances => 'অতিথি উপস্থিতি';

  @override
  String get appearancesSeerr => 'উপস্থিতি (দ্রষ্টা)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'গ্রুপের সাথে দেখুন';

  @override
  String get errors => 'ত্রুটি';

  @override
  String get warnings => 'সতর্কতা';

  @override
  String get disk => 'ডিস্ক';

  @override
  String get openInBrowser => 'ব্রাউজারে খুলুন';

  @override
  String get embeddedBrowserNotAvailable =>
      'এমবেডেড ব্রাউজার এই প্ল্যাটফর্মে উপলব্ধ নয়।';

  @override
  String get adminRestartServerConfirmation =>
      'আপনি কি সার্ভারটি পুনরায় চালু করার বিষয়ে নিশ্চিত?';

  @override
  String get adminShutdownServerConfirmation =>
      'আপনি কি নিশ্চিত যে আপনি সার্ভার বন্ধ করতে চান? আপনাকে ম্যানুয়ালি এটি পুনরায় চালু করতে হবে।';

  @override
  String get internal => 'অভ্যন্তরীণ';

  @override
  String get idle => 'নিষ্ক্রিয়';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'কোনো ব্যবহারকারী পাওয়া যায়নি';

  @override
  String get adminNoUsersMatchSearch =>
      'কোনো ব্যবহারকারী আপনার অনুসন্ধানের সাথে মেলে না';

  @override
  String get adminNoDevicesFound => 'কোনো ডিভাইস পাওয়া যায়নি';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'বর্তমান ফিল্টারগুলির সাথে কোনো ডিভাইস মেলে না৷';

  @override
  String get passwordSet => 'পাসওয়ার্ড সেট';

  @override
  String get noPasswordConfigured => 'কোন পাসওয়ার্ড কনফিগার করা নেই';

  @override
  String get remoteAccess => 'দূরবর্তী অ্যাক্সেস';

  @override
  String get localOnly => 'শুধুমাত্র স্থানীয়';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'মিডিয়া বিশ্লেষণ লোড করতে ব্যর্থ হয়েছে';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'সমস্ত মিডিয়া লাইব্রেরি জুড়ে সম্মিলিত বিশ্লেষণ।';

  @override
  String get analyticsTopArtists => 'শীর্ষ শিল্পী';

  @override
  String get analyticsTopAuthors => 'শীর্ষ লেখক';

  @override
  String get analyticsTopContributors => 'শীর্ষ অবদানকারী';

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
      'এই নির্বাচনের জন্য কোনো সূচিবদ্ধ মিডিয়া মোট এখনও উপলব্ধ নেই।';

  @override
  String get analyticsLibraryDetails => 'লাইব্রেরির বিবরণ';

  @override
  String get analyticsLibraryBreakdown => 'লাইব্রেরি ব্রেকডাউন';

  @override
  String get analyticsNoLibrariesAvailable => 'কোন লাইব্রেরি পাওয়া যায় না.';

  @override
  String get adminServerAdministrationTitle => 'সার্ভার প্রশাসন';

  @override
  String get adminServerPathData => 'ডেটা';

  @override
  String get adminServerPathImageCache => 'ইমেজ ক্যাশে';

  @override
  String get adminServerPathCache => 'ক্যাশে';

  @override
  String get adminServerPathLogs => 'লগ';

  @override
  String get adminServerPathMetadata => 'মেটাডেটা';

  @override
  String get adminServerPathTranscode => 'ট্রান্সকোড';

  @override
  String get adminServerPathWeb => 'ওয়েব';

  @override
  String get adminNoServerPathsReturned =>
      'কোন সার্ভার পাথ এই সার্ভার দ্বারা ফেরত.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% ব্যবহার করা হয়েছে';
  }

  @override
  String get userActivity => 'ব্যবহারকারী কার্যকলাপ';

  @override
  String get systemEvents => 'সিস্টেম ইভেন্ট';

  @override
  String get needsAttention => 'মনোযোগ প্রয়োজন';

  @override
  String get adminDrawerSectionServer => 'সার্ভার';

  @override
  String get adminDrawerSectionPlayback => 'প্লেব্যাক';

  @override
  String get adminDrawerSectionDevices => 'ডিভাইস';

  @override
  String get adminDrawerSectionAdvanced => 'উন্নত';

  @override
  String get adminDrawerSectionPlugins => 'প্লাগইন';

  @override
  String get adminDrawerSectionLiveTv => 'লাইভ টিভি';

  @override
  String get homeVideos => 'হোম ভিডিও';

  @override
  String get mixedContent => 'মিশ্র বিষয়বস্তু';

  @override
  String get homeVideosAndPhotos => 'হোম ভিডিও এবং ফটো';

  @override
  String get mixedMoviesAndShows => 'মিশ্র চলচ্চিত্র ও শো';

  @override
  String get intelQuickSync => 'ইন্টেল কুইক সিঙ্ক';

  @override
  String get rockchipMpp => 'রকচিপ এমপিপি';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'কোন রেকর্ডিং পাওয়া যায়নি';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'ভিতরে কোন ইমেজ পেজ পাওয়া যায়নি।$extension আর্কাইভ।';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'এমবেডেড রেন্ডারার ব্যর্থ হয়েছে ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB রেন্ডারার ব্যর্থ হয়েছে ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'পাঠকের জন্য অনুপস্থিত স্থানীয় ফাইল: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status $uri থেকে বই ডেটা খোলার সময়';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'কোন পঠনযোগ্য বই শেষ পয়েন্ট উপলব্ধ';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'অসমর্থিত কমিক সংরক্ষণাগার বিন্যাস: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'এই প্ল্যাটফর্মে CBR নিষ্কাশন প্লাগইন উপলব্ধ নেই।';

  @override
  String get failedToExtractCbrArchive =>
      '.cbr সংরক্ষণাগার বের করতে ব্যর্থ হয়েছে৷';

  @override
  String get cb7ExtractionUnavailable =>
      'এই প্ল্যাটফর্মে CB7 নিষ্কাশন উপলব্ধ নয়।';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'এই প্ল্যাটফর্মে CB7 নিষ্কাশন প্লাগইন উপলব্ধ নয়।';

  @override
  String get closeGenrePanel => 'জেনার প্যানেল বন্ধ করুন';

  @override
  String get loadingShuffle => 'শাফেল লোড হচ্ছে...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'অটো এইচডিআর সুইচিং';

  @override
  String get autoHdrSwitchingDescription =>
      'HDR ভিডিও প্লেব্যাকের জন্য স্বয়ংক্রিয়ভাবে HDR সক্ষম করুন এবং প্রস্থান করার সময় প্রদর্শন মোড পুনরুদ্ধার করুন।';

  @override
  String get whenFullscreen => 'যখন ফুলস্ক্রিন';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'ট্রান্সকোডিং সীমা';

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
