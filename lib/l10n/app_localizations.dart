import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_be.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_eo.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gl.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mk.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ug.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_yue.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('ar'),
    Locale('be'),
    Locale('bg'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en', 'GB'),
    Locale('en'),
    Locale('eo'),
    Locale('es', '419'),
    Locale('es', 'AR'),
    Locale('es', 'DO'),
    Locale('es', 'MX'),
    Locale('es'),
    Locale('et'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('gl'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kk'),
    Locale('kn'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('ml'),
    Locale('mn'),
    Locale('nb'),
    Locale('nl'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('ug'),
    Locale('uk'),
    Locale('vi'),
    Locale('yue', 'CN'),
    Locale('yue', 'HK'),
    Locale('yue'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    Locale('zh'),
  ];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Moonfin'**
  String get appTitle;

  /// Sign in heading and button label
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Subtitle showing which server the user is connecting to
  ///
  /// In en, this message translates to:
  /// **'Connecting to {serverName}'**
  String connectingToServer(String serverName);

  /// Quick Connect toggle button label
  ///
  /// In en, this message translates to:
  /// **'Quick Connect'**
  String get quickConnect;

  /// Password field label and toggle button
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Username field label
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Instruction text for Quick Connect code entry
  ///
  /// In en, this message translates to:
  /// **'Enter this code on your server\'s web dashboard:'**
  String get quickConnectInstruction;

  /// Quick Connect polling status text
  ///
  /// In en, this message translates to:
  /// **'Waiting for authorization...'**
  String get waitingForAuthorization;

  /// Back button label
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Error message when server cannot be reached
  ///
  /// In en, this message translates to:
  /// **'Server is unavailable'**
  String get serverUnavailable;

  /// Generic login failure message
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// Quick Connect generic error message
  ///
  /// In en, this message translates to:
  /// **'QuickConnect unavailable: {detail}'**
  String quickConnectUnavailable(String detail);

  /// Quick Connect error message with HTTP status info
  ///
  /// In en, this message translates to:
  /// **'QuickConnect unavailable ({status}): {detail}'**
  String quickConnectUnavailableWithStatus(String status, String detail);

  /// Server user selection heading
  ///
  /// In en, this message translates to:
  /// **'Who\'s watching?'**
  String get whosWatching;

  /// Button to add a new user on the server screen
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get addUser;

  /// Button to navigate back to server selection
  ///
  /// In en, this message translates to:
  /// **'Select Server'**
  String get selectServer;

  /// App version shown in footer
  ///
  /// In en, this message translates to:
  /// **'Moonfin version {version}'**
  String appVersionFooter(String version);

  /// Section heading for previously saved servers
  ///
  /// In en, this message translates to:
  /// **'Saved Servers'**
  String get savedServers;

  /// Section heading for auto-discovered local servers
  ///
  /// In en, this message translates to:
  /// **'Discovered Servers'**
  String get discoveredServers;

  /// Shown when no servers are discovered on the network
  ///
  /// In en, this message translates to:
  /// **'None found'**
  String get noneFound;

  /// Error when a server connection attempt fails
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to server'**
  String get unableToConnectToServer;

  /// Button to manually add a server address
  ///
  /// In en, this message translates to:
  /// **'Add Server'**
  String get addServer;

  /// Emby Connect sign-in option label
  ///
  /// In en, this message translates to:
  /// **'Emby Connect'**
  String get embyConnect;

  /// Dialog title for removing a saved server
  ///
  /// In en, this message translates to:
  /// **'Remove Server'**
  String get removeServer;

  /// Confirmation message when removing a saved server
  ///
  /// In en, this message translates to:
  /// **'Remove \"{serverName}\" from your servers?'**
  String removeServerConfirmation(String serverName);

  /// Generic cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Remove button label in confirmation dialogs
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Dialog title for adding a server by address
  ///
  /// In en, this message translates to:
  /// **'Connect to Server'**
  String get connectToServer;

  /// Label for the server URL input field
  ///
  /// In en, this message translates to:
  /// **'Server Address'**
  String get serverAddress;

  /// Hint text for the server URL input field
  ///
  /// In en, this message translates to:
  /// **'https://your-server.example.com'**
  String get serverAddressHint;

  /// Button to initiate connection to a server
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// Dialog title when system keyring is inaccessible
  ///
  /// In en, this message translates to:
  /// **'Secure Storage Unavailable'**
  String get secureStorageUnavailable;

  /// Explanation when secure storage is not available
  ///
  /// In en, this message translates to:
  /// **'Moonfin could not access your system keyring. Login can continue, but secure token storage may be unavailable until the keyring is unlocked.'**
  String get secureStorageUnavailableMessage;

  /// Generic OK button label
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Title for the theme selection screen and theme settings entry
  ///
  /// In en, this message translates to:
  /// **'App Theme'**
  String get settingsAppearanceTheme;

  /// Subtitle for the theme selection screen and theme settings entry
  ///
  /// In en, this message translates to:
  /// **'Switch between Moonfin and Neon Pulse without restarting the app'**
  String get settingsAppearanceThemeSubtitle;

  /// Settings label for preferring the native system keyboard instead of the custom TV keyboard
  ///
  /// In en, this message translates to:
  /// **'Prefer system keyboard'**
  String get keyboardPreferSystemIme;

  /// Settings subtitle for the system keyboard preference
  ///
  /// In en, this message translates to:
  /// **'Use your device input method by default for text entry'**
  String get keyboardPreferSystemImeDescription;

  /// Display name for the Moonfin theme
  ///
  /// In en, this message translates to:
  /// **'Moonfin'**
  String get themeMoonfin;

  /// Preview description for the Moonfin theme
  ///
  /// In en, this message translates to:
  /// **'Current Moonfin look you\'ve all come to love'**
  String get themeMoonfinSubtitle;

  /// Display name for the Neon Pulse theme
  ///
  /// In en, this message translates to:
  /// **'Neon Pulse'**
  String get themeNeonPulse;

  /// Preview description for the Neon Pulse theme
  ///
  /// In en, this message translates to:
  /// **'Synthwave styling with magenta glow, cyan text, and stronger chrome contrast'**
  String get themeNeonPulseSubtitle;

  /// Subtitle on the Emby Connect sign-in screen
  ///
  /// In en, this message translates to:
  /// **'Sign in with your Emby Connect account'**
  String get embyConnectSignInSubtitle;

  /// Label for the Emby Connect username/email field
  ///
  /// In en, this message translates to:
  /// **'Email or Username'**
  String get emailOrUsername;

  /// Heading for the Emby Connect server list
  ///
  /// In en, this message translates to:
  /// **'Select a Server'**
  String get selectAServer;

  /// Button to retry a failed operation
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Error when Emby Connect account has no linked servers
  ///
  /// In en, this message translates to:
  /// **'No servers linked to this Emby Connect account'**
  String get noLinkedServers;

  /// Error when Emby Connect auth response is invalid
  ///
  /// In en, this message translates to:
  /// **'Invalid Emby Connect credentials'**
  String get invalidEmbyConnectCredentials;

  /// Error for wrong Emby Connect credentials
  ///
  /// In en, this message translates to:
  /// **'Invalid Emby Connect username or password'**
  String get invalidEmbyConnectLogin;

  /// Error when server lacks Emby Connect exchange endpoint
  ///
  /// In en, this message translates to:
  /// **'Server does not support Emby Connect exchange'**
  String get embyConnectExchangeNotSupported;

  /// Generic network error during Emby Connect flow
  ///
  /// In en, this message translates to:
  /// **'Network error while contacting Emby Connect or the selected server'**
  String get embyConnectNetworkError;

  /// Status text while fetching Emby Connect server list
  ///
  /// In en, this message translates to:
  /// **'Loading linked servers...'**
  String get loadingLinkedServers;

  /// Status text while connecting to a selected server
  ///
  /// In en, this message translates to:
  /// **'Connecting to server...'**
  String get connectingToServerEllipsis;

  /// Shown when a discovered server has no usable address
  ///
  /// In en, this message translates to:
  /// **'No reachable address provided'**
  String get noReachableAddress;

  /// Error when server exchange returns invalid data
  ///
  /// In en, this message translates to:
  /// **'Invalid response from server exchange endpoint'**
  String get invalidServerExchangeResponse;

  /// Error when connection to a specific server or address fails
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to {target}'**
  String unableToConnectTo(String target);

  /// Title of exit confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Exit Moonfin?'**
  String get exitApp;

  /// Body text of exit confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit?'**
  String get exitAppConfirmation;

  /// Exit button label
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// Heading when home screen has no rows to display
  ///
  /// In en, this message translates to:
  /// **'No home rows could be loaded'**
  String get noHomeRowsLoaded;

  /// Hint text below the no-home-rows heading
  ///
  /// In en, this message translates to:
  /// **'Try refreshing or reducing active home sections.'**
  String get noHomeRowsHint;

  /// Button to retry loading home rows after failure
  ///
  /// In en, this message translates to:
  /// **'Retry Home Rows'**
  String get retryHomeRows;

  /// Live TV guide button label
  ///
  /// In en, this message translates to:
  /// **'Guide'**
  String get guide;

  /// Live TV recordings button label
  ///
  /// In en, this message translates to:
  /// **'Recordings'**
  String get recordings;

  /// Live TV schedule button label
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// Section header for TV series
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get series;

  /// Empty state when no items match the current view
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFound;

  /// Home navigation tooltip
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Button to browse all items in a library
  ///
  /// In en, this message translates to:
  /// **'Browse All'**
  String get browseAll;

  /// Genres navigation label
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;

  /// Placeholder text for empty collection screen
  ///
  /// In en, this message translates to:
  /// **'Collection items will appear here'**
  String get collectionPlaceholder;

  /// Title for alphabetical browse screen
  ///
  /// In en, this message translates to:
  /// **'Browse by Letter'**
  String get browseByLetter;

  /// Placeholder text for alphabetical browse screen
  ///
  /// In en, this message translates to:
  /// **'Alphabetical browse will appear here'**
  String get alphabeticalBrowsePlaceholder;

  /// Title for suggestions screen
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get suggestions;

  /// Placeholder text for suggestions screen
  ///
  /// In en, this message translates to:
  /// **'Suggested items will appear here'**
  String get suggestionsPlaceholder;

  /// Error when library list cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Failed to load libraries'**
  String get failedToLoadLibraries;

  /// Empty state when no libraries are available
  ///
  /// In en, this message translates to:
  /// **'No libraries found'**
  String get noLibrariesFound;

  /// Library label used in navigation and fallback subtitle
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// Tooltip for display settings button
  ///
  /// In en, this message translates to:
  /// **'Display Settings'**
  String get displaySettings;

  /// Title for the all genres screen
  ///
  /// In en, this message translates to:
  /// **'All Genres'**
  String get allGenres;

  /// Empty state when no genres are available
  ///
  /// In en, this message translates to:
  /// **'No genres found'**
  String get noGenresFound;

  /// Error when a folder cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Failed to load folder: {error}'**
  String failedToLoadFolderError(String error);

  /// Empty state for folder browse screen
  ///
  /// In en, this message translates to:
  /// **'This folder is empty'**
  String get thisFolderIsEmpty;

  /// Subtitle showing number of items in a folder or collection
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String itemCountLabel(int count);

  /// Error when favorites cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Failed to load favorites'**
  String get failedToLoadFavorites;

  /// Button label to retry a failed operation
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Empty state when user has no favorites
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavoritesYet;

  /// Favorites section heading and filter label
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Header showing total item count
  ///
  /// In en, this message translates to:
  /// **'{count} Items'**
  String totalCountItems(int count);

  /// Series status badge for ongoing series
  ///
  /// In en, this message translates to:
  /// **'Continuing'**
  String get continuing;

  /// Series status badge for ended series
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get ended;

  /// Dialog title for sort and filter options
  ///
  /// In en, this message translates to:
  /// **'Sort & Filter'**
  String get sortAndFilter;

  /// Stream info label for subtitle type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// Section header for sort options
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get sortBy;

  /// Dialog title for display settings
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get display;

  /// Setting for image type
  ///
  /// In en, this message translates to:
  /// **'Image Type'**
  String get imageType;

  /// Setting for poster size
  ///
  /// In en, this message translates to:
  /// **'Poster Size'**
  String get posterSize;

  /// Poster size option
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get small;

  /// Poster size option
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// Poster size option
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get large;

  /// Size option: extra large
  ///
  /// In en, this message translates to:
  /// **'Extra Large'**
  String get extraLarge;

  /// Header title showing library name with genres suffix
  ///
  /// In en, this message translates to:
  /// **'{name} — Genres'**
  String libraryGenresTitle(String name);

  /// Section header for music browse view buttons
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get views;

  /// Music browse view button label
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get albums;

  /// Music browse view button label
  ///
  /// In en, this message translates to:
  /// **'Album Artists'**
  String get albumArtists;

  /// Music browse view button label
  ///
  /// In en, this message translates to:
  /// **'Artists'**
  String get artists;

  /// Bookmarks dialog title and navigation label
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarks;

  /// Empty state in book bookmarks dialog
  ///
  /// In en, this message translates to:
  /// **'No saved bookmarks for this title yet.'**
  String get noSavedBookmarks;

  /// Button to open a book for reading
  ///
  /// In en, this message translates to:
  /// **'Open Book'**
  String get openBook;

  /// Bookmark mode label for epub format
  ///
  /// In en, this message translates to:
  /// **'Chapter'**
  String get chapter;

  /// Bookmark mode label for pdf/comic format
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;

  /// Generic bookmark mode label
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// Relative time for less than a minute ago
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// Relative time in minutes
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String minutesAgo(int count);

  /// Relative time in hours
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String hoursAgo(int count);

  /// Relative time in days
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String daysAgo(int count);

  /// Title for the book discovery subject picker panel
  ///
  /// In en, this message translates to:
  /// **'Discovery Subjects'**
  String get discoverySubjects;

  /// Instruction text in discovery subject picker
  ///
  /// In en, this message translates to:
  /// **'Pick which subject feeds to show in Discover.'**
  String get pickDiscoverySubjects;

  /// Button label to apply selected options
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Action label to open a URL externally
  ///
  /// In en, this message translates to:
  /// **'Open Link'**
  String get openLink;

  /// Instruction shown above a QR code
  ///
  /// In en, this message translates to:
  /// **'Scan with your phone'**
  String get scanWithYourPhone;

  /// Title for audiobook genre picker panel
  ///
  /// In en, this message translates to:
  /// **'Audiobook Genres'**
  String get audiobookGenres;

  /// Instruction text in audiobook genre picker
  ///
  /// In en, this message translates to:
  /// **'Pick which genres to show in Audiobook Discover.'**
  String get pickAudiobookGenres;

  /// Section title for audiobook discovery
  ///
  /// In en, this message translates to:
  /// **'Discover Audiobooks'**
  String get discoverAudiobooks;

  /// Subtitle for audiobook discovery section
  ///
  /// In en, this message translates to:
  /// **'Popular public domain titles from LibriVox.'**
  String get librivoxDescription;

  /// Label showing number of titles
  ///
  /// In en, this message translates to:
  /// **'{count} titles'**
  String titlesCount(int count);

  /// Tooltip for scroll left button
  ///
  /// In en, this message translates to:
  /// **'Scroll left'**
  String get scrollLeft;

  /// Tooltip for scroll right button
  ///
  /// In en, this message translates to:
  /// **'Scroll right'**
  String get scrollRight;

  /// Error when a genre row fails to load
  ///
  /// In en, this message translates to:
  /// **'Could not load this genre right now.'**
  String get couldNotLoadGenre;

  /// Section title for books in progress
  ///
  /// In en, this message translates to:
  /// **'Continue Reading'**
  String get continueReading;

  /// Section title for bookmarked content
  ///
  /// In en, this message translates to:
  /// **'Saved Highlights'**
  String get savedHighlights;

  /// Section title for audiobooks in progress
  ///
  /// In en, this message translates to:
  /// **'Continue Listening'**
  String get continueListening;

  /// Primary action label for audiobooks
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listen;

  /// Primary action label for resuming reading
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// Error when a library cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Failed to load library'**
  String get failedToLoadLibrary;

  /// Book rail title for popular items
  ///
  /// In en, this message translates to:
  /// **'Popular Now'**
  String get popularNow;

  /// Book rail title for bookmarked items
  ///
  /// In en, this message translates to:
  /// **'Saved For Later'**
  String get savedForLater;

  /// Book rail title for popular audiobooks
  ///
  /// In en, this message translates to:
  /// **'Top Listens'**
  String get topListens;

  /// Book rail title for unread items
  ///
  /// In en, this message translates to:
  /// **'Unread Discoveries'**
  String get unreadDiscoveries;

  /// Book rail title for in-progress bookmarked items
  ///
  /// In en, this message translates to:
  /// **'Pick Up Again'**
  String get pickUpAgain;

  /// Subtitle for saved highlights section
  ///
  /// In en, this message translates to:
  /// **'Your books with highlights, favorites, or reading progress.'**
  String get bookHighlightsDescription;

  /// Subtitle for primary book rail from library
  ///
  /// In en, this message translates to:
  /// **'Hand-picked from your library.'**
  String get handPickedFromLibrary;

  /// Subtitle for primary book rail from audiobooks
  ///
  /// In en, this message translates to:
  /// **'Hand-picked from your listening queue.'**
  String get handPickedFromListeningQueue;

  /// Subtitle for bookmarks secondary rail
  ///
  /// In en, this message translates to:
  /// **'Books with highlights, favorites, or reading progress.'**
  String get booksWithHighlights;

  /// Subtitle for audiobook continue listening rail
  ///
  /// In en, this message translates to:
  /// **'Jump back into narration without hunting for your place.'**
  String get jumpBackNarration;

  /// Subtitle for unread discoveries rail
  ///
  /// In en, this message translates to:
  /// **'Unread books ready for the next quiet hour.'**
  String get unreadBooksReady;

  /// Subtitle for favorites book rail
  ///
  /// In en, this message translates to:
  /// **'Quick access to the books you keep coming back to.'**
  String get quickAccessFavorites;

  /// Placeholder text in audiobook search bar
  ///
  /// In en, this message translates to:
  /// **'Search audiobooks'**
  String get searchAudiobooks;

  /// Placeholder text in library search bar
  ///
  /// In en, this message translates to:
  /// **'Search your library'**
  String get searchYourLibrary;

  /// Hero card subtitle for library and audiobook sections
  ///
  /// In en, this message translates to:
  /// **'Pick up the story where you left off'**
  String get pickUpStory;

  /// Hero card subtitle for bookmarks section
  ///
  /// In en, this message translates to:
  /// **'Your saved places and unfinished chapters'**
  String get savedPlacesChapters;

  /// Metric pill showing author count
  ///
  /// In en, this message translates to:
  /// **'{count} authors'**
  String authorsCount(int count);

  /// Metric pill showing genre count
  ///
  /// In en, this message translates to:
  /// **'{count} genres'**
  String genresCount(int count);

  /// Reading progress percentage label
  ///
  /// In en, this message translates to:
  /// **'{percent}% completed'**
  String percentCompleted(int percent);

  /// Label shown when no reading progress exists
  ///
  /// In en, this message translates to:
  /// **'Ready when you are'**
  String get readyWhenYouAre;

  /// Button and title label for detail views
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Panel header for audiobook section
  ///
  /// In en, this message translates to:
  /// **'Listening Room'**
  String get listeningRoom;

  /// Panel header for bookmarks section
  ///
  /// In en, this message translates to:
  /// **'Bookmarks & Progress'**
  String get bookmarksAndProgress;

  /// Panel subtitle showing total titles
  ///
  /// In en, this message translates to:
  /// **'{count} titles arranged for reading-first browsing.'**
  String titlesArrangedForBrowsing(int count);

  /// Stat card label for total titles
  ///
  /// In en, this message translates to:
  /// **'Titles'**
  String get titles;

  /// Collection picker dialog title for all titles
  ///
  /// In en, this message translates to:
  /// **'All Titles'**
  String get allTitles;

  /// Stat card label for author count
  ///
  /// In en, this message translates to:
  /// **'Authors'**
  String get authors;

  /// Collection picker dialog title for author browse
  ///
  /// In en, this message translates to:
  /// **'Browse By Author'**
  String get browseByAuthor;

  /// Collection picker dialog title for genre browse
  ///
  /// In en, this message translates to:
  /// **'Browse By Genre'**
  String get browseByGenre;

  /// Section title for book discovery
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// Subtitle for book discovery section
  ///
  /// In en, this message translates to:
  /// **'Trending titles by subject from Open Library.'**
  String get trendingTitlesOpenLibrary;

  /// Empty state for bookmarks grid
  ///
  /// In en, this message translates to:
  /// **'No bookmarked items yet'**
  String get noBookmarkedItems;

  /// Empty state for book experience when no items match
  ///
  /// In en, this message translates to:
  /// **'Nothing matches this section yet. Try another tab or come back after the library sync finishes.'**
  String get nothingMatchesSection;

  /// Audiobooks navigation and tab label
  ///
  /// In en, this message translates to:
  /// **'Audiobooks'**
  String get audiobooks;

  /// Empty state with dynamic label like books or audiobooks
  ///
  /// In en, this message translates to:
  /// **'No {label} found'**
  String noLabelFound(String label);

  /// Fallback subtitle for navigable folder items
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get folder;

  /// Section header for filter options
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// Section header for book reading status filter
  ///
  /// In en, this message translates to:
  /// **'Reading Status'**
  String get readingStatus;

  /// Section header for played status filter
  ///
  /// In en, this message translates to:
  /// **'Played Status'**
  String get playedStatus;

  /// Filter label for read/watched items in book libraries
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get readStatus;

  /// Filter label for watched items
  ///
  /// In en, this message translates to:
  /// **'Watched'**
  String get watched;

  /// Status label for an unread book
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread;

  /// Filter label for unwatched items
  ///
  /// In en, this message translates to:
  /// **'Unwatched'**
  String get unwatched;

  /// Section header for series status filter
  ///
  /// In en, this message translates to:
  /// **'Series Status'**
  String get seriesStatus;

  /// Label when all libraries are selected
  ///
  /// In en, this message translates to:
  /// **'All Libraries'**
  String get allLibraries;

  /// Book media tab label
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// Organize mode label for grouping by author
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// Fallback text when book author is not available
  ///
  /// In en, this message translates to:
  /// **'Unknown Author'**
  String get unknownAuthor;

  /// Fallback text when genre is not available
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get uncategorized;

  /// Section header for content overview/description
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// Fallback when LibriVox title has no description
  ///
  /// In en, this message translates to:
  /// **'No description provided by LibriVox for this title yet.'**
  String get noLibrivoxDescription;

  /// Section header for LibriVox audiobook readers
  ///
  /// In en, this message translates to:
  /// **'Readers'**
  String get readers;

  /// Section header for external links
  ///
  /// In en, this message translates to:
  /// **'Open Links'**
  String get openLinks;

  /// Button label for LibriVox external link
  ///
  /// In en, this message translates to:
  /// **'LibriVox Page'**
  String get librivoxPage;

  /// Button label for Internet Archive external link
  ///
  /// In en, this message translates to:
  /// **'Internet Archive'**
  String get internetArchive;

  /// Button label for RSS feed external link
  ///
  /// In en, this message translates to:
  /// **'RSS Feed'**
  String get rssFeed;

  /// Button label for zip download external link
  ///
  /// In en, this message translates to:
  /// **'Download Zip'**
  String get downloadZip;

  /// Detail chip showing number of sections in audiobook
  ///
  /// In en, this message translates to:
  /// **'{count} sections'**
  String sectionCountLabel(int count);

  /// Publication year for a book
  ///
  /// In en, this message translates to:
  /// **'First published {year}'**
  String firstPublished(int year);

  /// Fallback when Open Library has no description
  ///
  /// In en, this message translates to:
  /// **'No overview available from Open Library for this title yet.'**
  String get noOpenLibraryOverview;

  /// Section header for Open Library subjects
  ///
  /// In en, this message translates to:
  /// **'Subjects'**
  String get subjects;

  /// Filter option for showing all items
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Label showing number of books in a discover row
  ///
  /// In en, this message translates to:
  /// **'{count} books'**
  String booksCount(int count);

  /// Error when a discover subject row fails to load
  ///
  /// In en, this message translates to:
  /// **'Could not load this subject right now.'**
  String get couldNotLoadSubject;

  /// AppBar title for LibriVox audiobook detail screen
  ///
  /// In en, this message translates to:
  /// **'Audiobook Details'**
  String get audiobookDetails;

  /// AppBar title for LibriVox authors list screen
  ///
  /// In en, this message translates to:
  /// **'{count} Authors'**
  String authorsCountTitle(int count);

  /// Subtitle showing number of audiobooks by an author
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 audiobook} other{{count} audiobooks}}'**
  String audiobookCountLabel(int count);

  /// AppBar title for the item list screen
  ///
  /// In en, this message translates to:
  /// **'Track List'**
  String get trackList;

  /// Placeholder text for an empty item list screen
  ///
  /// In en, this message translates to:
  /// **'Item list will appear here'**
  String get itemListPlaceholder;

  /// Placeholder text for an empty music favorites screen
  ///
  /// In en, this message translates to:
  /// **'Favorite tracks will appear here'**
  String get favoriteTracksPlaceholder;

  /// Error message when item detail fails to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get failedToLoad;

  /// Delete action button label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Save action button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Section header for similar items
  ///
  /// In en, this message translates to:
  /// **'More Like This'**
  String get moreLikeThis;

  /// Section header for cast and crew section
  ///
  /// In en, this message translates to:
  /// **'Cast & Crew'**
  String get castAndCrew;

  /// Section header for collection items
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collection;

  /// Section header for episodes
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodes;

  /// Home section: next up
  ///
  /// In en, this message translates to:
  /// **'Next Up'**
  String get nextUp;

  /// Section header for seasons
  ///
  /// In en, this message translates to:
  /// **'Seasons'**
  String get seasons;

  /// Section header for chapters
  ///
  /// In en, this message translates to:
  /// **'Chapters'**
  String get chapters;

  /// Section header for special features
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// Section header for movies
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get movies;

  /// Section header for music videos filmography row
  ///
  /// In en, this message translates to:
  /// **'Music Videos'**
  String get musicVideos;

  /// Section header for other items
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// Section header for artist discography
  ///
  /// In en, this message translates to:
  /// **'Discography'**
  String get discography;

  /// Section header for similar artists
  ///
  /// In en, this message translates to:
  /// **'Similar Artists'**
  String get similarArtists;

  /// Section header for audiobook chapters
  ///
  /// In en, this message translates to:
  /// **'Table of Contents'**
  String get tableOfContents;

  /// Section header for album track listing
  ///
  /// In en, this message translates to:
  /// **'Tracklist'**
  String get tracklist;

  /// Label for an album disc section in a multi-disc track list
  ///
  /// In en, this message translates to:
  /// **'Disc {number}'**
  String discNumber(int number);

  /// Section header for person biography
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biography;

  /// AppBar title for author detail screen
  ///
  /// In en, this message translates to:
  /// **'Author Details'**
  String get authorDetails;

  /// Placeholder when no overview text is available
  ///
  /// In en, this message translates to:
  /// **'No overview available for this title yet.'**
  String get noOverviewAvailable;

  /// Placeholder when no biography text is available
  ///
  /// In en, this message translates to:
  /// **'No biography available for this author.'**
  String get noBiographyAvailable;

  /// Placeholder when no books are found for an author
  ///
  /// In en, this message translates to:
  /// **'No books found for this author.'**
  String get noBooksFound;

  /// Error message when author details fail to load
  ///
  /// In en, this message translates to:
  /// **'Unable to load author details right now.'**
  String get unableToLoadAuthorDetails;

  /// Publication year for an author book tile
  ///
  /// In en, this message translates to:
  /// **'Published {year}'**
  String published(int year);

  /// Placeholder when publication date is unknown
  ///
  /// In en, this message translates to:
  /// **'Publication date unknown'**
  String get publicationDateUnknown;

  /// Number of seasons for a series
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Season} other{{count} Seasons}}'**
  String seasonCount(int count);

  /// Label showing when media will end
  ///
  /// In en, this message translates to:
  /// **'Ends at {time}'**
  String endsAt(String time);

  /// Action button label for viewing a photo
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// Action button label to resume reading a book
  ///
  /// In en, this message translates to:
  /// **'Resume Reading'**
  String get resumeReading;

  /// Action button label to start reading a book
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// Action button label showing resume position
  ///
  /// In en, this message translates to:
  /// **'Resume from {position}'**
  String resumeFrom(String position);

  /// Action button label to play media
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// Action button label to restart reading a book
  ///
  /// In en, this message translates to:
  /// **'Start Over'**
  String get startOver;

  /// Action button label to restart playing media
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// Action button label to read offline
  ///
  /// In en, this message translates to:
  /// **'Read Offline'**
  String get readOffline;

  /// Action button label to play offline
  ///
  /// In en, this message translates to:
  /// **'Play Offline'**
  String get playOffline;

  /// Action button label for audio track selection
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// Action button label for subtitle selection
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get subtitles;

  /// Action button label for version/media source selection
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Action button label for casting to a device
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get cast;

  /// Action button label for trailer playback
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get trailer;

  /// Status label for a finished book
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// Status label for a favorited item
  ///
  /// In en, this message translates to:
  /// **'Favorited'**
  String get favorited;

  /// Action button label to favorite an item
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// Action button label for adding to a playlist
  ///
  /// In en, this message translates to:
  /// **'Playlist'**
  String get playlist;

  /// Status label for a downloaded item
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get downloaded;

  /// Action button label to download all items
  ///
  /// In en, this message translates to:
  /// **'Download All'**
  String get downloadAll;

  /// Action button label to download an item
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Action button label to delete downloaded album tracks
  ///
  /// In en, this message translates to:
  /// **'Delete Downloaded'**
  String get deleteDownloaded;

  /// Action button label to navigate to the parent series
  ///
  /// In en, this message translates to:
  /// **'Go to Series'**
  String get goToSeries;

  /// Action button label to edit item metadata
  ///
  /// In en, this message translates to:
  /// **'Edit Metadata'**
  String get editMetadata;

  /// Action button label to collapse extra buttons
  ///
  /// In en, this message translates to:
  /// **'Less'**
  String get less;

  /// Action button label to expand extra buttons
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Dialog title for deleting an item
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItem;

  /// Dialog title for deleting a playlist
  ///
  /// In en, this message translates to:
  /// **'Delete Playlist'**
  String get deletePlaylist;

  /// Confirmation message for deleting a playlist
  ///
  /// In en, this message translates to:
  /// **'Delete this playlist from the server?'**
  String get deletePlaylistMessage;

  /// Confirmation message for deleting an item
  ///
  /// In en, this message translates to:
  /// **'Delete this item from the server?'**
  String get deleteItemMessage;

  /// Error message when playlist deletion fails
  ///
  /// In en, this message translates to:
  /// **'Failed to delete playlist'**
  String get failedToDeletePlaylist;

  /// Error message when item deletion fails
  ///
  /// In en, this message translates to:
  /// **'Failed to delete item'**
  String get failedToDeleteItem;

  /// Dialog title for renaming a playlist
  ///
  /// In en, this message translates to:
  /// **'Rename Playlist'**
  String get renamePlaylist;

  /// Hint text for playlist name input field
  ///
  /// In en, this message translates to:
  /// **'Playlist name'**
  String get playlistName;

  /// Dialog title for deleting downloaded album tracks
  ///
  /// In en, this message translates to:
  /// **'Delete Downloaded Album'**
  String get deleteDownloadedAlbum;

  /// Confirmation message for deleting downloaded album tracks
  ///
  /// In en, this message translates to:
  /// **'Delete downloaded tracks for \"{title}\"?'**
  String deleteDownloadedTracksMessage(String title);

  /// Success message after deleting downloaded tracks
  ///
  /// In en, this message translates to:
  /// **'Downloaded tracks deleted'**
  String get downloadedTracksDeleted;

  /// Error message when some downloaded tracks could not be deleted
  ///
  /// In en, this message translates to:
  /// **'Some downloaded tracks could not be deleted'**
  String get downloadedTracksDeleteFailed;

  /// Message when no tracks are available
  ///
  /// In en, this message translates to:
  /// **'No tracks loaded'**
  String get noTracksLoaded;

  /// Message when no items are loaded for download
  ///
  /// In en, this message translates to:
  /// **'No {itemLabel} loaded'**
  String noItemsLoaded(String itemLabel);

  /// Snackbar message when downloading album tracks
  ///
  /// In en, this message translates to:
  /// **'Downloading {title} ({count} items)...'**
  String downloadingTitle(String title, int count);

  /// Confirmation message for permanently deleting an item
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{name}\" from the server? This action cannot be undone.'**
  String deleteConfirmMessage(String name);

  /// Success message after deleting an item
  ///
  /// In en, this message translates to:
  /// **'Item deleted'**
  String get itemDeleted;

  /// Error message when no trailer can be played
  ///
  /// In en, this message translates to:
  /// **'No playable trailer found.'**
  String get noPlayableTrailerFound;

  /// Error message for unsupported book file format
  ///
  /// In en, this message translates to:
  /// **'Unsupported book format: .{extension}'**
  String unsupportedBookFormat(String extension);

  /// Dialog title for audio track selection
  ///
  /// In en, this message translates to:
  /// **'Audio Track'**
  String get audioTrack;

  /// Dialog title for subtitle track selection
  ///
  /// In en, this message translates to:
  /// **'Subtitle Track'**
  String get subtitleTrack;

  /// Option label for no subtitle selected
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// Label for the download subtitles option
  ///
  /// In en, this message translates to:
  /// **'Download subtitles...'**
  String get downloadSubtitlesLabel;

  /// Subtitle for the download subtitles option
  ///
  /// In en, this message translates to:
  /// **'Search using the OpenSubtitles plugin'**
  String get searchOpenSubtitlesPlugin;

  /// Dialog title for downloading remote subtitles
  ///
  /// In en, this message translates to:
  /// **'Download Subtitles'**
  String get downloadSubtitles;

  /// Error message when a selected subtitle is invalid
  ///
  /// In en, this message translates to:
  /// **'The selected subtitle is invalid.'**
  String get selectedSubtitleInvalid;

  /// Success message after downloading and selecting a subtitle
  ///
  /// In en, this message translates to:
  /// **'Subtitle downloaded and selected: {name}'**
  String subtitleDownloadedSelected(String name);

  /// Message when subtitle was downloaded but not yet visible
  ///
  /// In en, this message translates to:
  /// **'Subtitle downloaded. It may take a moment to appear while Jellyfin refreshes the item.'**
  String get subtitleDownloadedPending;

  /// Message when no remote subtitles were found
  ///
  /// In en, this message translates to:
  /// **'No remote subtitles found for {language}.'**
  String noRemoteSubtitlesFound(String language);

  /// Dialog title for selecting a media version
  ///
  /// In en, this message translates to:
  /// **'Select Version'**
  String get selectVersion;

  /// Default label for a media version
  ///
  /// In en, this message translates to:
  /// **'Version {number}'**
  String versionNumber(int number);

  /// Title for download quality picker when downloading all
  ///
  /// In en, this message translates to:
  /// **'Download All — Quality'**
  String get downloadAllQuality;

  /// Title for download quality picker for a single item
  ///
  /// In en, this message translates to:
  /// **'Download Quality'**
  String get downloadQuality;

  /// Subtitle for original quality download option
  ///
  /// In en, this message translates to:
  /// **'Original file, no re-encoding'**
  String get originalFileNoReencoding;

  /// Subtitle for original quality batch download option
  ///
  /// In en, this message translates to:
  /// **'Original files, no re-encoding'**
  String get originalFilesNoReencoding;

  /// Message when no episodes are available for download
  ///
  /// In en, this message translates to:
  /// **'No episodes loaded'**
  String get noEpisodesLoaded;

  /// Snackbar message when downloading an item
  ///
  /// In en, this message translates to:
  /// **'Downloading {name} ({quality})...'**
  String downloadingItem(String name, String quality);

  /// Dialog title for deleting downloaded files
  ///
  /// In en, this message translates to:
  /// **'Delete Downloaded Files'**
  String get deleteDownloadedFiles;

  /// Confirmation message for deleting local downloaded files
  ///
  /// In en, this message translates to:
  /// **'Delete local files for {typeLabel}?\n\nThis will free up storage space. You can re-download later.'**
  String deleteLocalFilesMessage(String typeLabel);

  /// Success message after deleting downloaded files
  ///
  /// In en, this message translates to:
  /// **'Downloaded files deleted'**
  String get downloadedFilesDeleted;

  /// Error message when file deletion fails
  ///
  /// In en, this message translates to:
  /// **'Failed to delete files'**
  String get failedToDeleteFiles;

  /// Action button label for deleting downloaded files
  ///
  /// In en, this message translates to:
  /// **'Delete Files'**
  String get deleteFiles;

  /// Metadata label for director
  ///
  /// In en, this message translates to:
  /// **'DIRECTOR'**
  String get director;

  /// Metadata label for writers
  ///
  /// In en, this message translates to:
  /// **'WRITERS'**
  String get writers;

  /// Metadata label for studio
  ///
  /// In en, this message translates to:
  /// **'STUDIO'**
  String get studio;

  /// Label showing additional studio count
  ///
  /// In en, this message translates to:
  /// **'+{count} more'**
  String studioMoreCount(int count);

  /// Season progress label showing total episodes
  ///
  /// In en, this message translates to:
  /// **'{count} Episodes'**
  String totalEpisodes(int count);

  /// Season progress label showing watched vs total
  ///
  /// In en, this message translates to:
  /// **'{watched} / {total}'**
  String episodeProgress(int watched, int total);

  /// Label for an episode number
  ///
  /// In en, this message translates to:
  /// **'Episode {number}'**
  String episodeLabel(int number);

  /// Default name for a chapter
  ///
  /// In en, this message translates to:
  /// **'Chapter {number}'**
  String chapterNumber(int number);

  /// Label showing number of tracks in an album
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 track} other{{count} tracks}}'**
  String trackCount(int count);

  /// Label showing number of chapters in an audiobook
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 chapter} other{{count} chapters}}'**
  String chapterCount(int count);

  /// Person birth date label
  ///
  /// In en, this message translates to:
  /// **'Born {date}'**
  String born(String date);

  /// Person death date label
  ///
  /// In en, this message translates to:
  /// **'Died {date}'**
  String died(String date);

  /// Person age label
  ///
  /// In en, this message translates to:
  /// **'Age {age}'**
  String age(int age);

  /// Toggle label to collapse expanded biography
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// Toggle label to expand biography
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get readMore;

  /// Action button label for shuffle playback
  ///
  /// In en, this message translates to:
  /// **'Shuffle'**
  String get shuffle;

  /// Subtitle showing number of downloads for a remote subtitle
  ///
  /// In en, this message translates to:
  /// **'{count} downloads'**
  String downloadsCount(int count);

  /// Label for a subtitle that is a hash match
  ///
  /// In en, this message translates to:
  /// **'Perfect match'**
  String get perfectMatch;

  /// Audio channel count label
  ///
  /// In en, this message translates to:
  /// **'{count}ch'**
  String channelsCount(int count);

  /// Audio channel layout label for mono
  ///
  /// In en, this message translates to:
  /// **'Mono'**
  String get mono;

  /// Audio channel layout label for stereo
  ///
  /// In en, this message translates to:
  /// **'Stereo'**
  String get stereo;

  /// Error message when user lacks subtitle management permission
  ///
  /// In en, this message translates to:
  /// **'Remote subtitle {action} requires the Jellyfin subtitle management permission for this user.'**
  String remoteSubtitlePermissionError(String action);

  /// Error message when item not found for subtitle operation
  ///
  /// In en, this message translates to:
  /// **'This item could not be found on the server for remote subtitle {action}.'**
  String remoteSubtitleNotFoundError(String action);

  /// Error message with detail for subtitle operation
  ///
  /// In en, this message translates to:
  /// **'Remote subtitle {action} failed: {detail}'**
  String remoteSubtitleDetailError(String action, String detail);

  /// Error message with HTTP status for subtitle operation
  ///
  /// In en, this message translates to:
  /// **'Remote subtitle {action} failed (HTTP {status}).'**
  String remoteSubtitleHttpError(String action, int status);

  /// Generic error message for subtitle operation
  ///
  /// In en, this message translates to:
  /// **'Failed to {action} remote subtitles.'**
  String remoteSubtitleGenericError(String action);

  /// Type label for series file deletion
  ///
  /// In en, this message translates to:
  /// **'all downloaded episodes for \"{name}\"'**
  String deleteSeriesFiles(String name);

  /// Type label for season file deletion
  ///
  /// In en, this message translates to:
  /// **'all downloaded episodes in this season'**
  String get deleteSeasonFiles;

  /// Title for the still watching screen
  ///
  /// In en, this message translates to:
  /// **'Still Watching?'**
  String get stillWatching;

  /// Error when trailer stream cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Unable to load trailer stream.'**
  String get unableToLoadTrailerStream;

  /// Error when trailer loading times out
  ///
  /// In en, this message translates to:
  /// **'Trailer timed out while loading.'**
  String get trailerTimedOut;

  /// Error when trailer playback fails
  ///
  /// In en, this message translates to:
  /// **'Playback failed for this trailer.'**
  String get playbackFailedForTrailer;

  /// Photo counter showing current and total
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String photoCountOf(int current, int total);

  /// Snackbar message when casting is unavailable offline
  ///
  /// In en, this message translates to:
  /// **'Casting is unavailable during offline playback.'**
  String get castingUnavailableOffline;

  /// Error when a cast action fails
  ///
  /// In en, this message translates to:
  /// **'{label} action failed: {error}'**
  String castActionFailed(String label, String error);

  /// Error when setting cast volume fails
  ///
  /// In en, this message translates to:
  /// **'Failed to set cast volume: {error}'**
  String failedToSetCastVolume(String error);

  /// Title for cast controls dialog
  ///
  /// In en, this message translates to:
  /// **'{label} Controls'**
  String castControlsTitle(String label);

  /// Label for device volume control in cast dialog
  ///
  /// In en, this message translates to:
  /// **'Device Volume'**
  String get deviceVolume;

  /// Label when a feature is unavailable
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// Pause action label
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// Cast control action to sync playback position
  ///
  /// In en, this message translates to:
  /// **'Sync Position'**
  String get syncPosition;

  /// Cast control action to stop casting
  ///
  /// In en, this message translates to:
  /// **'Stop {label}'**
  String stopCast(String label);

  /// Empty state text for playback queue
  ///
  /// In en, this message translates to:
  /// **'Queue is empty'**
  String get queueIsEmpty;

  /// Fallback track name in queue
  ///
  /// In en, this message translates to:
  /// **'Track {number}'**
  String trackNumber(int number);

  /// Label for Jellyfin session remote playback
  ///
  /// In en, this message translates to:
  /// **'Remote Playback'**
  String get remotePlayback;

  /// Cast mini bar label for Google Cast
  ///
  /// In en, this message translates to:
  /// **'Casting to Google Cast'**
  String get castingToGoogleCast;

  /// Cast mini bar label for AirPlay
  ///
  /// In en, this message translates to:
  /// **'Casting via AirPlay'**
  String get castingViaAirPlay;

  /// Cast mini bar label for DLNA
  ///
  /// In en, this message translates to:
  /// **'Casting via DLNA'**
  String get castingViaDlna;

  /// Double-tap skip overlay duration label
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds'**
  String secondsCount(int seconds);

  /// OSD lock overlay hint
  ///
  /// In en, this message translates to:
  /// **'Long press to unlock'**
  String get longPressToUnlock;

  /// Label for subtitle off option
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// Fallback label for unnamed audio or subtitle stream
  ///
  /// In en, this message translates to:
  /// **'{streamType} {number}'**
  String streamTypeFallback(String streamType, int number);

  /// Label for automatic bitrate selection
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// Bitrate option label in Mbps
  ///
  /// In en, this message translates to:
  /// **'{mbps} Mbps'**
  String bitrateValueMbps(int mbps);

  /// Label shown in stream info when a manual bitrate override is active
  ///
  /// In en, this message translates to:
  /// **'Bitrate Override'**
  String get bitrateOverride;

  /// Title for audio delay adjuster
  ///
  /// In en, this message translates to:
  /// **'Audio Delay'**
  String get audioDelay;

  /// Label for decreasing playback delay in milliseconds
  ///
  /// In en, this message translates to:
  /// **'-{value}ms'**
  String delayMinusMs(int value);

  /// Label for increasing playback delay in milliseconds
  ///
  /// In en, this message translates to:
  /// **'+{value}ms'**
  String delayPlusMs(int value);

  /// Title for subtitle delay adjuster
  ///
  /// In en, this message translates to:
  /// **'Subtitle Delay'**
  String get subtitleDelay;

  /// Button label to reset a value
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Fallback label for unknown items
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// Title for stream info sheet
  ///
  /// In en, this message translates to:
  /// **'Playback Information'**
  String get playbackInformation;

  /// Section header in stream info
  ///
  /// In en, this message translates to:
  /// **'Playback'**
  String get playback;

  /// Stream info label for play method
  ///
  /// In en, this message translates to:
  /// **'Play Method'**
  String get playMethod;

  /// Play method label
  ///
  /// In en, this message translates to:
  /// **'Direct Play'**
  String get directPlay;

  /// Audio option: direct stream
  ///
  /// In en, this message translates to:
  /// **'Direct Stream'**
  String get directStream;

  /// Play method label
  ///
  /// In en, this message translates to:
  /// **'Transcoding'**
  String get transcoding;

  /// Stream info label for transcode reasons
  ///
  /// In en, this message translates to:
  /// **'Transcode Reasons'**
  String get transcodeReasons;

  /// Stream info label for player engine
  ///
  /// In en, this message translates to:
  /// **'Player'**
  String get player;

  /// Stream info label for media container
  ///
  /// In en, this message translates to:
  /// **'Container'**
  String get container;

  /// Stream info label for bitrate
  ///
  /// In en, this message translates to:
  /// **'Bitrate'**
  String get bitrate;

  /// Section header for video stream info
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// Stream info label for video resolution
  ///
  /// In en, this message translates to:
  /// **'Resolution'**
  String get resolution;

  /// Stream info label for HDR type
  ///
  /// In en, this message translates to:
  /// **'HDR'**
  String get hdr;

  /// Stream info label for codec
  ///
  /// In en, this message translates to:
  /// **'Codec'**
  String get codec;

  /// Stream info label for video bitrate
  ///
  /// In en, this message translates to:
  /// **'Video Bitrate'**
  String get videoBitrate;

  /// Stream info label for track name
  ///
  /// In en, this message translates to:
  /// **'Track'**
  String get track;

  /// Stream info label for audio channels
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channels;

  /// Stream info label for audio bitrate
  ///
  /// In en, this message translates to:
  /// **'Audio Bitrate'**
  String get audioBitrate;

  /// Stream info label for audio sample rate
  ///
  /// In en, this message translates to:
  /// **'Sample Rate'**
  String get sampleRate;

  /// Stream info label for subtitle format
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get format;

  /// Subtitle type label for external subtitles
  ///
  /// In en, this message translates to:
  /// **'External'**
  String get external;

  /// Subtitle type label for embedded subtitles
  ///
  /// In en, this message translates to:
  /// **'Embedded'**
  String get embedded;

  /// Fallback error message for cast session errors
  ///
  /// In en, this message translates to:
  /// **'{protocol} session error'**
  String castSessionError(String protocol);

  /// Error when loading book details fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load book details: {error}'**
  String failedToLoadBookDetails(String error);

  /// Fallback message when EPUB cannot render on current platform
  ///
  /// In en, this message translates to:
  /// **'EPUB rendering in-app is not available on this platform yet.'**
  String get epubUnavailableOnPlatform;

  /// Fallback message for unsupported document format
  ///
  /// In en, this message translates to:
  /// **'This format (.{extension}) cannot be rendered in-app yet.'**
  String formatCannotRenderInApp(String extension);

  /// Fallback message when embedded renderer unavailable
  ///
  /// In en, this message translates to:
  /// **'Embedded document rendering is unavailable on this platform.'**
  String get embeddedRenderingUnavailable;

  /// Error when external viewer fails to open
  ///
  /// In en, this message translates to:
  /// **'Could not open external viewer.'**
  String get couldNotOpenExternalViewer;

  /// Error when in-app reader fails to open
  ///
  /// In en, this message translates to:
  /// **'Failed to open in-app reader: {error}'**
  String failedToOpenInAppReader(String error);

  /// Snackbar when bookmark already exists
  ///
  /// In en, this message translates to:
  /// **'Bookmark already saved at {label}.'**
  String bookmarkAlreadySaved(String label);

  /// Snackbar confirming bookmark was added
  ///
  /// In en, this message translates to:
  /// **'Bookmark added: {label}'**
  String bookmarkAdded(String label);

  /// Empty state for bookmarks sheet
  ///
  /// In en, this message translates to:
  /// **'No bookmarks yet.\nTap the bookmark icon while reading to save your position.'**
  String get noBookmarksYet;

  /// Empty state for table of contents panel
  ///
  /// In en, this message translates to:
  /// **'No table of contents available'**
  String get noTableOfContentsAvailable;

  /// Page number label in TOC or position
  ///
  /// In en, this message translates to:
  /// **'Page {number}'**
  String pageLabel(int number);

  /// Generic position label
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// Default title for book reader screen
  ///
  /// In en, this message translates to:
  /// **'Book Reader'**
  String get bookReader;

  /// Chip label showing file format
  ///
  /// In en, this message translates to:
  /// **'Format: .{extension}'**
  String formatExtension(String extension);

  /// Chip label showing reading progress
  ///
  /// In en, this message translates to:
  /// **'{percent}% read'**
  String percentRead(String percent);

  /// Button label while updating
  ///
  /// In en, this message translates to:
  /// **'Updating...'**
  String get updating;

  /// Button or menu item to mark as unread
  ///
  /// In en, this message translates to:
  /// **'Mark Unread'**
  String get markUnread;

  /// Button or menu item to mark as read
  ///
  /// In en, this message translates to:
  /// **'Mark as Read'**
  String get markAsRead;

  /// Button or menu item to reload the reader
  ///
  /// In en, this message translates to:
  /// **'Reload Reader'**
  String get reloadReader;

  /// Empty state for comic reader
  ///
  /// In en, this message translates to:
  /// **'No pages found.'**
  String get noPagesFound;

  /// Error when comic page image cannot be decoded
  ///
  /// In en, this message translates to:
  /// **'Failed to decode page image.'**
  String get failedToDecodePageImage;

  /// Tooltip for reset zoom button
  ///
  /// In en, this message translates to:
  /// **'Reset Zoom ({zoom}x)'**
  String resetZoom(String zoom);

  /// Tooltip for single page spread mode
  ///
  /// In en, this message translates to:
  /// **'Single Page'**
  String get singlePage;

  /// Tooltip for two-page spread mode
  ///
  /// In en, this message translates to:
  /// **'Two-Page Spread'**
  String get twoPageSpread;

  /// Tooltip for add bookmark button
  ///
  /// In en, this message translates to:
  /// **'Add Bookmark'**
  String get addBookmark;

  /// Menu item to view bookmarks
  ///
  /// In en, this message translates to:
  /// **'Bookmarks...'**
  String get bookmarksEllipsis;

  /// Snackbar confirming item marked as read
  ///
  /// In en, this message translates to:
  /// **'Marked as read'**
  String get markedAsRead;

  /// Snackbar confirming item marked as unread
  ///
  /// In en, this message translates to:
  /// **'Marked as unread'**
  String get markedAsUnread;

  /// Error when marking read/unread fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update read state: {error}'**
  String failedToUpdateReadState(String error);

  /// Reader theme option for system default
  ///
  /// In en, this message translates to:
  /// **'Theme: System'**
  String get themeSystem;

  /// Reader theme option for light mode
  ///
  /// In en, this message translates to:
  /// **'Theme: Light'**
  String get themeLight;

  /// Reader theme option for dark mode
  ///
  /// In en, this message translates to:
  /// **'Theme: Dark'**
  String get themeDark;

  /// Reader theme option for sepia mode
  ///
  /// In en, this message translates to:
  /// **'Theme: Sepia'**
  String get themeSepia;

  /// Menu item to invert colors for fixed layout
  ///
  /// In en, this message translates to:
  /// **'Invert Colors (fixed layout)'**
  String get invertColorsFixedLayout;

  /// Menu item to invert colors for PDF
  ///
  /// In en, this message translates to:
  /// **'Invert Colors (PDF)'**
  String get invertColorsPdf;

  /// Loading text while reader is being prepared
  ///
  /// In en, this message translates to:
  /// **'Preparing in-app reader...'**
  String get preparingInAppReader;

  /// Error when PDF data cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'PDF data not available.'**
  String get pdfDataNotAvailable;

  /// Title for fallback reader mode
  ///
  /// In en, this message translates to:
  /// **'Reader fallback mode active'**
  String get readerFallbackModeActive;

  /// Fallback description when platform lacks document engine
  ///
  /// In en, this message translates to:
  /// **'This platform cannot host the embedded document engine for {extension} files.'**
  String platformCannotHostDocumentEngine(String extension);

  /// Hint text in fallback reader mode
  ///
  /// In en, this message translates to:
  /// **'Use Reload Reader after switching to a supported platform target (Android, iOS, macOS).'**
  String get reloadReaderPlatformHint;

  /// Button to open document in external viewer
  ///
  /// In en, this message translates to:
  /// **'Open Externally'**
  String get openExternally;

  /// Error when no EPUB chapters are found
  ///
  /// In en, this message translates to:
  /// **'No EPUB chapters found.'**
  String get noEpubChaptersFound;

  /// Error when reader has not finished initializing
  ///
  /// In en, this message translates to:
  /// **'Reader not ready.'**
  String get readerNotReady;

  /// Live TV series recordings label
  ///
  /// In en, this message translates to:
  /// **'Series Recordings'**
  String get seriesRecordings;

  /// Button label to jump to current time in guide
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// Sports category filter label
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// News category filter label
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// Kids category filter label
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get kids;

  /// Premiere category filter label
  ///
  /// In en, this message translates to:
  /// **'Premiere'**
  String get premiere;

  /// Section title for the TV guide timeline
  ///
  /// In en, this message translates to:
  /// **'Guide Timeline'**
  String get guideTimeline;

  /// Error when guide data fails to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load guide: {error}'**
  String failedToLoadGuide(String error);

  /// Empty state when no TV channels match the filter
  ///
  /// In en, this message translates to:
  /// **'No channels found'**
  String get noChannelsFound;

  /// Badge label shown on currently airing programs
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get liveBadge;

  /// Movie category chip label
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get movie;

  /// Snackbar confirmation after removing a channel from favorites
  ///
  /// In en, this message translates to:
  /// **'Removed from favorite channels'**
  String get removedFromFavoriteChannels;

  /// Snackbar confirmation after adding a channel to favorites
  ///
  /// In en, this message translates to:
  /// **'Added to favorite channels'**
  String get addedToFavoriteChannels;

  /// Error when toggling channel favorite fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update favorite channel'**
  String get failedToUpdateFavoriteChannel;

  /// Button label to remove a channel from favorites
  ///
  /// In en, this message translates to:
  /// **'Unfavorite Channel'**
  String get unfavoriteChannel;

  /// Button label to add a channel to favorites
  ///
  /// In en, this message translates to:
  /// **'Favorite Channel'**
  String get favoriteChannel;

  /// Button label to schedule a live TV recording
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get record;

  /// Button label to cancel a scheduled live TV recording
  ///
  /// In en, this message translates to:
  /// **'Cancel Recording'**
  String get cancelRecordingAction;

  /// Snackbar confirmation after scheduling a live TV program recording
  ///
  /// In en, this message translates to:
  /// **'Program set to record'**
  String get programSetToRecord;

  /// Snackbar confirmation after cancelling a live TV recording
  ///
  /// In en, this message translates to:
  /// **'Recording cancelled'**
  String get recordingCancelled;

  /// Error when creating a live TV recording fails
  ///
  /// In en, this message translates to:
  /// **'Unable to create recording'**
  String get unableToCreateRecording;

  /// Button label to start watching a channel
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watch;

  /// Button label to close a dialog
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Error when live TV channel playback fails
  ///
  /// In en, this message translates to:
  /// **'Failed to play {name}'**
  String failedToPlayChannel(String name);

  /// Error when recordings fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load recordings'**
  String get failedToLoadRecordings;

  /// Section title for upcoming scheduled recordings
  ///
  /// In en, this message translates to:
  /// **'Scheduled in Next 24 Hours'**
  String get scheduledInNext24Hours;

  /// Section title for recently completed recordings
  ///
  /// In en, this message translates to:
  /// **'Recent Recordings'**
  String get recentRecordings;

  /// Section title for TV series recordings
  ///
  /// In en, this message translates to:
  /// **'TV Series'**
  String get tvSeries;

  /// Error when schedule fails to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load schedule'**
  String get failedToLoadSchedule;

  /// Empty state when no recordings are scheduled
  ///
  /// In en, this message translates to:
  /// **'No scheduled recordings'**
  String get noScheduledRecordings;

  /// Dialog title for cancelling a recording
  ///
  /// In en, this message translates to:
  /// **'Cancel Recording?'**
  String get cancelRecording;

  /// Confirmation message for cancelling a scheduled recording
  ///
  /// In en, this message translates to:
  /// **'Cancel scheduled recording of \"{name}\"?'**
  String cancelScheduledRecordingOf(String name);

  /// Negative dialog button label
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Confirmation button to cancel a recording
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// Error when cancelling a recording fails
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel recording'**
  String get failedToCancelRecording;

  /// Error when series recordings fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load series recordings'**
  String get failedToLoadSeriesRecordings;

  /// Empty state when no series recordings exist
  ///
  /// In en, this message translates to:
  /// **'No series recordings'**
  String get noSeriesRecordings;

  /// Button label to cancel a series recording
  ///
  /// In en, this message translates to:
  /// **'Cancel Series Recording'**
  String get cancelSeriesRecording;

  /// Dialog title for cancelling a series recording
  ///
  /// In en, this message translates to:
  /// **'Cancel Series Recording?'**
  String get cancelSeriesRecordingQuestion;

  /// Confirmation message for stopping a series recording
  ///
  /// In en, this message translates to:
  /// **'Stop recording \"{name}\"?'**
  String stopRecordingName(String name);

  /// Error when cancelling a series recording fails
  ///
  /// In en, this message translates to:
  /// **'Failed to cancel series recording'**
  String get failedToCancelSeriesRecording;

  /// Search hint when scoped to a specific library
  ///
  /// In en, this message translates to:
  /// **'Search this library...'**
  String get searchThisLibrary;

  /// Search hint placeholder
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchEllipsis;

  /// Shown when search returns no results
  ///
  /// In en, this message translates to:
  /// **'No results for \"{query}\"'**
  String noResultsForQuery(String query);

  /// Shown when search encounters an error
  ///
  /// In en, this message translates to:
  /// **'Search failed: {error}'**
  String searchFailedError(String error);

  /// Seerr brand name
  ///
  /// In en, this message translates to:
  /// **'Seerr'**
  String get seerr;

  /// Header for selecting Seerr authentication account type
  ///
  /// In en, this message translates to:
  /// **'Seerr Account Type'**
  String get seerrAccountType;

  /// Auth option label for Seerr sign in using Jellyfin credentials
  ///
  /// In en, this message translates to:
  /// **'Jellyfin'**
  String get jellyfinAccount;

  /// Auth option label for Seerr sign in using local Seerr credentials
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get localAccount;

  /// Header title for saved/downloaded media screen
  ///
  /// In en, this message translates to:
  /// **'Saved Media'**
  String get savedMedia;

  /// Filter label for TV shows
  ///
  /// In en, this message translates to:
  /// **'TV Shows'**
  String get tvShows;

  /// Filter label for music
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// Section title for downloaded music albums
  ///
  /// In en, this message translates to:
  /// **'Music Albums'**
  String get musicAlbums;

  /// Shown when no items match the selected filter
  ///
  /// In en, this message translates to:
  /// **'No media in this filter'**
  String get noMediaInFilter;

  /// Shown when no media has been downloaded
  ///
  /// In en, this message translates to:
  /// **'No downloaded media yet'**
  String get noDownloadedMediaYet;

  /// Button to navigate to the library
  ///
  /// In en, this message translates to:
  /// **'Browse Library'**
  String get browseLibrary;

  /// Dialog title for deleting a download
  ///
  /// In en, this message translates to:
  /// **'Delete Download'**
  String get deleteDownload;

  /// Confirmation to delete a downloaded item and its files
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" and its files?'**
  String removeItemAndFiles(String name);

  /// Number of tracks in an album
  ///
  /// In en, this message translates to:
  /// **'{count} tracks'**
  String tracksCount(int count);

  /// Fallback name for an album
  ///
  /// In en, this message translates to:
  /// **'Album'**
  String get album;

  /// Button to play an album
  ///
  /// In en, this message translates to:
  /// **'Play Album'**
  String get playAlbum;

  /// Error when loading an album fails
  ///
  /// In en, this message translates to:
  /// **'Failed to load album: {error}'**
  String failedToLoadAlbum(String error);

  /// Shown when an album has no downloaded tracks
  ///
  /// In en, this message translates to:
  /// **'No downloaded tracks found for {name}.'**
  String noDownloadedTracksForAlbum(String name);

  /// Fallback name for a season
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get season;

  /// Error when loading episodes fails
  ///
  /// In en, this message translates to:
  /// **'Error loading episodes'**
  String get errorLoadingEpisodes;

  /// Shown when no episodes have been downloaded
  ///
  /// In en, this message translates to:
  /// **'No downloaded episodes'**
  String get noDownloadedEpisodes;

  /// Dialog title for deleting an episode
  ///
  /// In en, this message translates to:
  /// **'Delete Episode'**
  String get deleteEpisode;

  /// Confirmation to remove an item by name
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\"?'**
  String removeName(String name);

  /// Duration in minutes
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String durationMinutes(int minutes);

  /// Season and episode label like S1 E2
  ///
  /// In en, this message translates to:
  /// **'S{season} E{episode}'**
  String seasonEpisodeLabel(int season, int episode);

  /// Episode label with number
  ///
  /// In en, this message translates to:
  /// **'Episode {number}'**
  String episodeNumber(int number);

  /// Shown when a series cannot be found
  ///
  /// In en, this message translates to:
  /// **'Series not found'**
  String get seriesNotFound;

  /// Error when loading a series fails
  ///
  /// In en, this message translates to:
  /// **'Error loading series'**
  String get errorLoadingSeries;

  /// Section title for downloaded episodes
  ///
  /// In en, this message translates to:
  /// **'Downloaded Episodes'**
  String get downloadedEpisodes;

  /// Season label with number
  ///
  /// In en, this message translates to:
  /// **'Season {number}'**
  String seasonNumber(int number);

  /// Compact season chip label
  ///
  /// In en, this message translates to:
  /// **'S{number}'**
  String seasonChip(int number);

  /// Label for special episodes
  ///
  /// In en, this message translates to:
  /// **'Specials'**
  String get specials;

  /// Dialog title for deleting a season
  ///
  /// In en, this message translates to:
  /// **'Delete Season'**
  String get deleteSeason;

  /// Confirmation to delete all episodes in a season
  ///
  /// In en, this message translates to:
  /// **'Delete all downloaded episodes in {season}?'**
  String deleteAllEpisodesInSeason(String season);

  /// Number of episodes with pluralization
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 episode} other{{count} episodes}}'**
  String episodeCount(int count);

  /// Title for the storage management screen
  ///
  /// In en, this message translates to:
  /// **'Storage Management'**
  String get storageManagement;

  /// Section title for storage breakdown
  ///
  /// In en, this message translates to:
  /// **'Storage Breakdown'**
  String get storageBreakdown;

  /// Section title for downloaded items list
  ///
  /// In en, this message translates to:
  /// **'Downloaded Items'**
  String get downloadedItems;

  /// Setting for storage limit
  ///
  /// In en, this message translates to:
  /// **'Storage Limit'**
  String get storageLimit;

  /// Option: no limit
  ///
  /// In en, this message translates to:
  /// **'No limit'**
  String get noLimit;

  /// Button and dialog title for deleting all downloads
  ///
  /// In en, this message translates to:
  /// **'Delete All Downloads'**
  String get deleteAllDownloads;

  /// Warning message when deleting all downloads
  ///
  /// In en, this message translates to:
  /// **'This will remove all downloaded media files and cannot be undone.'**
  String get deleteAllDownloadsWarning;

  /// Button to confirm deleting all items
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get deleteAll;

  /// Dialog title for deleting selected items
  ///
  /// In en, this message translates to:
  /// **'Delete Selected'**
  String get deleteSelected;

  /// Confirmation to delete selected downloaded items
  ///
  /// In en, this message translates to:
  /// **'Delete {count} downloaded items?'**
  String deleteSelectedCount(int count);

  /// Storage breakdown label for music and audiobooks
  ///
  /// In en, this message translates to:
  /// **'Music & Audiobooks'**
  String get musicAndAudiobooks;

  /// Storage breakdown label for images
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get images;

  /// Storage breakdown label for database
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get database;

  /// Text showing storage used of total limit
  ///
  /// In en, this message translates to:
  /// **'of {limit} limit'**
  String ofStorageLimit(String limit);

  /// Settings screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Auth settings section title
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get authentication;

  /// Auth settings description
  ///
  /// In en, this message translates to:
  /// **'Auto login, server management'**
  String get autoLoginServerManagement;

  /// PIN code settings title
  ///
  /// In en, this message translates to:
  /// **'PIN Code'**
  String get pinCode;

  /// PIN code settings description
  ///
  /// In en, this message translates to:
  /// **'Set up PIN code protection'**
  String get setUpPinCodeProtection;

  /// Parental controls settings title
  ///
  /// In en, this message translates to:
  /// **'Parental Controls'**
  String get parentalControls;

  /// Parental controls description
  ///
  /// In en, this message translates to:
  /// **'Content rating restrictions'**
  String get contentRatingRestrictions;

  /// Playback settings description
  ///
  /// In en, this message translates to:
  /// **'Bitrate, resolution, behavior'**
  String get bitRateResolutionBehavior;

  /// Subtitle settings description
  ///
  /// In en, this message translates to:
  /// **'Language, size, appearance'**
  String get languageSizeAppearance;

  /// Download settings description
  ///
  /// In en, this message translates to:
  /// **'Quality, storage'**
  String get qualityStorage;

  /// Plugin settings description
  ///
  /// In en, this message translates to:
  /// **'Server sync and plugin status'**
  String get serverSyncAndPluginStatus;

  /// Seerr settings description
  ///
  /// In en, this message translates to:
  /// **'Media request integration'**
  String get mediaRequestIntegration;

  /// Button to switch to a different server
  ///
  /// In en, this message translates to:
  /// **'Switch Server'**
  String get switchServer;

  /// Button to sign out
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// About settings description
  ///
  /// In en, this message translates to:
  /// **'Version, licenses'**
  String get versionLicenses;

  /// Account section title
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Account section description
  ///
  /// In en, this message translates to:
  /// **'Sign-in and security'**
  String get signInAndSecurity;

  /// Administration section title
  ///
  /// In en, this message translates to:
  /// **'Administration'**
  String get administration;

  /// Administration section description
  ///
  /// In en, this message translates to:
  /// **'Server settings, users, libraries'**
  String get serverSettingsUsersLibraries;

  /// Customization section title
  ///
  /// In en, this message translates to:
  /// **'Customization'**
  String get customization;

  /// Customization section description
  ///
  /// In en, this message translates to:
  /// **'Theme and layout'**
  String get themeAndLayout;

  /// Playback section description variant
  ///
  /// In en, this message translates to:
  /// **'Video and subtitles'**
  String get videoAndSubtitles;

  /// Integrations section title
  ///
  /// In en, this message translates to:
  /// **'Integrations'**
  String get integrations;

  /// Integrations section description
  ///
  /// In en, this message translates to:
  /// **'Plugin and requests'**
  String get pluginAndRequests;

  /// Settings screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Customize account, playback, and interface behavior'**
  String get customizeAccountPlaybackInterface;

  /// Number of options in a settings section
  ///
  /// In en, this message translates to:
  /// **'{count} options'**
  String optionsCount(int count);

  /// Appearance settings title
  ///
  /// In en, this message translates to:
  /// **'Theme & Appearance'**
  String get themeAndAppearance;

  /// Setting for focus border color
  ///
  /// In en, this message translates to:
  /// **'Focus Border Color'**
  String get focusBorderColor;

  /// Setting for watched indicator display
  ///
  /// In en, this message translates to:
  /// **'Watched Indicators'**
  String get watchedIndicators;

  /// Option: always
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get always;

  /// Option: hide unwatched indicators
  ///
  /// In en, this message translates to:
  /// **'Hide Unwatched'**
  String get hideUnwatched;

  /// Option: episodes only
  ///
  /// In en, this message translates to:
  /// **'Episodes Only'**
  String get episodesOnly;

  /// Option: never
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get never;

  /// Setting for focus expansion animation
  ///
  /// In en, this message translates to:
  /// **'Focus Expansion Animation'**
  String get focusExpansionAnimation;

  /// Setting for desktop UI scale
  ///
  /// In en, this message translates to:
  /// **'Desktop UI Scale'**
  String get desktopUiScale;

  /// Description for focus expansion animation
  ///
  /// In en, this message translates to:
  /// **'Scale focused or hovered cards and tiles'**
  String get scaleFocusedCards;

  /// Setting for background backdrops
  ///
  /// In en, this message translates to:
  /// **'Background Backdrops'**
  String get backgroundBackdrops;

  /// Description for background backdrops
  ///
  /// In en, this message translates to:
  /// **'Show backdrop images behind content'**
  String get showBackdropImages;

  /// Setting for series thumbnails
  ///
  /// In en, this message translates to:
  /// **'Series Thumbnails'**
  String get seriesThumbnails;

  /// Description for series thumbnails setting
  ///
  /// In en, this message translates to:
  /// **'Episodes only: use series artwork that matches each row image type'**
  String get seriesThumbnailsDescription;

  /// Setting for home row info overlay
  ///
  /// In en, this message translates to:
  /// **'Home Row Info Overlay'**
  String get homeRowInfoOverlay;

  /// Description for home row info overlay
  ///
  /// In en, this message translates to:
  /// **'Show title and metadata when browsing home rows'**
  String get showTitleMetadataOnHomeRows;

  /// Setting for clock display
  ///
  /// In en, this message translates to:
  /// **'Clock Display'**
  String get clockDisplay;

  /// Option: show in menus
  ///
  /// In en, this message translates to:
  /// **'In Menus'**
  String get inMenus;

  /// Option: show in video
  ///
  /// In en, this message translates to:
  /// **'In Video'**
  String get inVideo;

  /// Setting for seasonal visual effects
  ///
  /// In en, this message translates to:
  /// **'Seasonal Effects'**
  String get seasonalEffects;

  /// Description for seasonal effects settings
  ///
  /// In en, this message translates to:
  /// **'Visual effects and seasonal decorations'**
  String get seasonalEffectsDescription;

  /// Seasonal effect: snow
  ///
  /// In en, this message translates to:
  /// **'Snow'**
  String get snow;

  /// Seasonal effect: fireworks
  ///
  /// In en, this message translates to:
  /// **'Fireworks'**
  String get fireworks;

  /// Seasonal effect: confetti
  ///
  /// In en, this message translates to:
  /// **'Confetti'**
  String get confetti;

  /// Seasonal effect: falling leaves
  ///
  /// In en, this message translates to:
  /// **'Falling Leaves'**
  String get fallingLeaves;

  /// Setting for theme music
  ///
  /// In en, this message translates to:
  /// **'Theme Music'**
  String get themeMusic;

  /// Description for theme music setting
  ///
  /// In en, this message translates to:
  /// **'Play theme music on detail pages'**
  String get playThemeMusicOnDetailPages;

  /// Setting for theme music volume
  ///
  /// In en, this message translates to:
  /// **'Theme Music Volume'**
  String get themeMusicVolume;

  /// Percentage display
  ///
  /// In en, this message translates to:
  /// **'{value}%'**
  String percentValue(int value);

  /// Setting for theme music on home rows
  ///
  /// In en, this message translates to:
  /// **'Theme Music on Home Rows'**
  String get themeMusicOnHomeRows;

  /// Description for theme music on home rows
  ///
  /// In en, this message translates to:
  /// **'Play when browsing home screen'**
  String get playWhenBrowsingHomeScreen;

  /// Setting for details background blur
  ///
  /// In en, this message translates to:
  /// **'Details Background Blur'**
  String get detailsBackgroundBlur;

  /// Pixel value display
  ///
  /// In en, this message translates to:
  /// **'{value}px'**
  String pixelValue(int value);

  /// Setting for browsing background blur
  ///
  /// In en, this message translates to:
  /// **'Browsing Background Blur'**
  String get browsingBackgroundBlur;

  /// Setting for max streaming bitrate
  ///
  /// In en, this message translates to:
  /// **'Max Streaming Bitrate'**
  String get maxStreamingBitrate;

  /// Setting for max resolution
  ///
  /// In en, this message translates to:
  /// **'Max Resolution'**
  String get maxResolution;

  /// Setting for player zoom mode
  ///
  /// In en, this message translates to:
  /// **'Player Zoom Mode'**
  String get playerZoomMode;

  /// Zoom mode: fit
  ///
  /// In en, this message translates to:
  /// **'Fit'**
  String get fit;

  /// Zoom mode: auto crop
  ///
  /// In en, this message translates to:
  /// **'Auto Crop'**
  String get autoCrop;

  /// Zoom mode: stretch
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get stretch;

  /// Setting for refresh rate switching
  ///
  /// In en, this message translates to:
  /// **'Refresh Rate Switching'**
  String get refreshRateSwitching;

  /// Option: disabled
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// Refresh rate option: scale on TV
  ///
  /// In en, this message translates to:
  /// **'Scale on TV'**
  String get scaleOnTv;

  /// Refresh rate option: scale on device
  ///
  /// In en, this message translates to:
  /// **'Scale on Device'**
  String get scaleOnDevice;

  /// Setting for trick play thumbnails
  ///
  /// In en, this message translates to:
  /// **'Trick Play'**
  String get trickPlay;

  /// Description for trick play
  ///
  /// In en, this message translates to:
  /// **'Show preview thumbnails when seeking'**
  String get showPreviewThumbnailsWhenSeeking;

  /// Setting for showing description on pause
  ///
  /// In en, this message translates to:
  /// **'Show Description on Pause'**
  String get showDescriptionOnPause;

  /// Description for show description on pause
  ///
  /// In en, this message translates to:
  /// **'Dim video and show overview text while paused'**
  String get dimVideoShowOverview;

  /// Setting for OSD lock button
  ///
  /// In en, this message translates to:
  /// **'OSD Lock Button'**
  String get osdLockButton;

  /// Description for OSD lock button
  ///
  /// In en, this message translates to:
  /// **'Show a lock button that blocks touch input until long-pressed'**
  String get osdLockButtonDescription;

  /// Setting for audio behavior
  ///
  /// In en, this message translates to:
  /// **'Audio Behavior'**
  String get audioBehavior;

  /// Audio option: downmix to stereo
  ///
  /// In en, this message translates to:
  /// **'Downmix to Stereo'**
  String get downmixToStereo;

  /// Setting for default audio language
  ///
  /// In en, this message translates to:
  /// **'Default Audio Language'**
  String get defaultAudioLanguage;

  /// Option: auto server default
  ///
  /// In en, this message translates to:
  /// **'Auto (Server Default)'**
  String get autoServerDefault;

  /// Language: English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Language: Spanish
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// Language: French
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// Language: German
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// Language: Italian
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// Language: Portuguese
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// Language: Japanese
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// Language: Korean
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get korean;

  /// Language: Chinese
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// Language: Russian
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// Language: Arabic
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// Language: Hindi
  ///
  /// In en, this message translates to:
  /// **'Hindi'**
  String get hindi;

  /// Language: Dutch
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get dutch;

  /// Language: Swedish
  ///
  /// In en, this message translates to:
  /// **'Swedish'**
  String get swedish;

  /// Language: Norwegian
  ///
  /// In en, this message translates to:
  /// **'Norwegian'**
  String get norwegian;

  /// Language: Danish
  ///
  /// In en, this message translates to:
  /// **'Danish'**
  String get danish;

  /// Language: Finnish
  ///
  /// In en, this message translates to:
  /// **'Finnish'**
  String get finnish;

  /// Language: Polish
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get polish;

  /// Setting for AC3 passthrough
  ///
  /// In en, this message translates to:
  /// **'AC3 Passthrough'**
  String get ac3Passthrough;

  /// Setting for DTS passthrough
  ///
  /// In en, this message translates to:
  /// **'DTS Passthrough'**
  String get dtsPassthrough;

  /// Setting for TrueHD support
  ///
  /// In en, this message translates to:
  /// **'TrueHD Support'**
  String get trueHdSupport;

  /// Description for DTS passthrough
  ///
  /// In en, this message translates to:
  /// **'Bitstream DTS audio to AVR only; requires receiver support and DTS source track'**
  String get enableDtsPassthrough;

  /// Description for TrueHD support
  ///
  /// In en, this message translates to:
  /// **'Enable TrueHD audio (may not work on all platforms)'**
  String get enableTrueHdAudio;

  /// Setting for audio output mode
  ///
  /// In en, this message translates to:
  /// **'Audio Output Mode'**
  String get settingsAudioOutputMode;

  /// Audio output mode option for AVR passthrough
  ///
  /// In en, this message translates to:
  /// **'AVR Passthrough'**
  String get settingsAudioOutputModeAvrPassthrough;

  /// Setting for fallback audio codec
  ///
  /// In en, this message translates to:
  /// **'Audio Fallback Codec'**
  String get settingsAudioFallbackCodec;

  /// Fallback codec option for AAC stereo
  ///
  /// In en, this message translates to:
  /// **'AAC Stereo'**
  String get settingsAudioFallbackAacStereo;

  /// Fallback codec option for AC3 5.1
  ///
  /// In en, this message translates to:
  /// **'AC3 5.1'**
  String get settingsAudioFallbackAc35_1;

  /// Fallback codec option for EAC3 5.1
  ///
  /// In en, this message translates to:
  /// **'EAC3 5.1'**
  String get settingsAudioFallbackEac35_1;

  /// Section title for advanced passthrough controls
  ///
  /// In en, this message translates to:
  /// **'Passthrough (Advanced)'**
  String get settingsAudioPassthroughAdvanced;

  /// Title for codec passthrough settings group
  ///
  /// In en, this message translates to:
  /// **'Codec Passthrough'**
  String get settingsAudioCodecPassthrough;

  /// Description for codec passthrough settings group
  ///
  /// In en, this message translates to:
  /// **'Enable only formats your AVR or HDMI sink supports.'**
  String get settingsAudioCodecPassthroughDescription;

  /// Setting for EAC3 passthrough
  ///
  /// In en, this message translates to:
  /// **'EAC3 Passthrough'**
  String get settingsAudioEac3Passthrough;

  /// Setting for EAC3 JOC Atmos passthrough
  ///
  /// In en, this message translates to:
  /// **'EAC3 JOC (Atmos) Passthrough'**
  String get settingsAudioEac3JocPassthrough;

  /// Setting for DTS core passthrough
  ///
  /// In en, this message translates to:
  /// **'DTS Core Passthrough'**
  String get settingsAudioDtsCorePassthrough;

  /// Setting for DTS-HD MA passthrough
  ///
  /// In en, this message translates to:
  /// **'DTS-HD MA Passthrough'**
  String get settingsAudioDtsHdPassthrough;

  /// Setting for TrueHD passthrough
  ///
  /// In en, this message translates to:
  /// **'TrueHD Passthrough'**
  String get settingsAudioTrueHdPassthrough;

  /// Setting for TrueHD Atmos passthrough
  ///
  /// In en, this message translates to:
  /// **'TrueHD Atmos Passthrough'**
  String get settingsAudioTrueHdAtmosPassthrough;

  /// Description for EAC3 passthrough
  ///
  /// In en, this message translates to:
  /// **'Bitstream Dolby Digital Plus (EAC3) to external decoder.'**
  String get settingsAudioBitstreamEac3ToExternalDecoder;

  /// Description for EAC3 JOC passthrough
  ///
  /// In en, this message translates to:
  /// **'Bitstream Dolby Atmos over EAC3 (JOC) to external decoder.'**
  String get settingsAudioBitstreamEac3JocToExternalDecoder;

  /// Description for DTS-HD MA passthrough
  ///
  /// In en, this message translates to:
  /// **'Bitstream DTS-HD MA (includes DTS core) to external decoder.'**
  String get settingsAudioBitstreamDtsHdToExternalDecoder;

  /// Description for TrueHD Atmos passthrough
  ///
  /// In en, this message translates to:
  /// **'Bitstream Dolby TrueHD with Atmos metadata to external decoder.'**
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder;

  /// Section title for detected runtime audio capabilities
  ///
  /// In en, this message translates to:
  /// **'Detected Audio Capabilities'**
  String get settingsDetectedAudioCapabilities;

  /// Message shown when runtime audio capability snapshot is missing
  ///
  /// In en, this message translates to:
  /// **'No runtime capability snapshot available yet.'**
  String get settingsDetectedAudioCapabilitiesUnavailable;

  /// Label for active audio route row
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get settingsAudioRouteLabel;

  /// Label for audio decode capability row
  ///
  /// In en, this message translates to:
  /// **'Decode'**
  String get settingsAudioDecodeLabel;

  /// Label for audio passthrough capability row
  ///
  /// In en, this message translates to:
  /// **'Passthrough'**
  String get settingsAudioPassthroughLabel;

  /// Label indicating the active route supports HD audio
  ///
  /// In en, this message translates to:
  /// **'HD audio route'**
  String get settingsAudioHdRoute;

  /// Audio route type HDMI
  ///
  /// In en, this message translates to:
  /// **'HDMI'**
  String get settingsAudioRouteHdmi;

  /// Audio route type ARC
  ///
  /// In en, this message translates to:
  /// **'ARC'**
  String get settingsAudioRouteArc;

  /// Audio route type eARC
  ///
  /// In en, this message translates to:
  /// **'eARC'**
  String get settingsAudioRouteEarc;

  /// Audio route type Bluetooth
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get settingsAudioRouteBluetooth;

  /// Audio route type speaker
  ///
  /// In en, this message translates to:
  /// **'Speaker'**
  String get settingsAudioRouteSpeaker;

  /// Audio route subtitle showing max PCM channels
  ///
  /// In en, this message translates to:
  /// **'{count}ch PCM'**
  String settingsAudioPcmChannels(int count);

  /// Section title for playback diagnostics
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get settingsAudioDiagnostics;

  /// Diagnostics label for video level
  ///
  /// In en, this message translates to:
  /// **'Video Level'**
  String get settingsAudioDiagnosticsVideoLevel;

  /// Diagnostics label for video range
  ///
  /// In en, this message translates to:
  /// **'Video Range'**
  String get settingsAudioDiagnosticsVideoRange;

  /// Diagnostics label for subtitle codec
  ///
  /// In en, this message translates to:
  /// **'Subtitle Codec'**
  String get settingsAudioDiagnosticsSubtitleCodec;

  /// Diagnostics label for allowed audio codecs
  ///
  /// In en, this message translates to:
  /// **'Allowed Audio Codecs'**
  String get settingsAudioDiagnosticsAllowedAudioCodecs;

  /// Diagnostics label for HLS MPEG-TS audio codecs
  ///
  /// In en, this message translates to:
  /// **'HLS MPEG-TS Audio Codecs'**
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs;

  /// Diagnostics label for HLS fMP4 audio codecs
  ///
  /// In en, this message translates to:
  /// **'HLS fMP4 Audio Codecs'**
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs;

  /// Diagnostics label for audio-spdif passthrough codecs
  ///
  /// In en, this message translates to:
  /// **'audio-spdif passthrough'**
  String get settingsAudioDiagnosticsAudioSpdifPassthrough;

  /// Diagnostics label for active audio route
  ///
  /// In en, this message translates to:
  /// **'Active Audio Route'**
  String get settingsAudioDiagnosticsActiveAudioRoute;

  /// Diagnostics label for route HD audio support
  ///
  /// In en, this message translates to:
  /// **'Route HD Audio Support'**
  String get settingsAudioDiagnosticsRouteHdAudioSupport;

  /// Setting for night mode
  ///
  /// In en, this message translates to:
  /// **'Night Mode'**
  String get nightMode;

  /// Description for night mode
  ///
  /// In en, this message translates to:
  /// **'Compress dynamic range'**
  String get compressDynamicRange;

  /// Section title for advanced mpv settings
  ///
  /// In en, this message translates to:
  /// **'Advanced mpv'**
  String get advancedMpv;

  /// Setting for custom mpv.conf
  ///
  /// In en, this message translates to:
  /// **'Enable Custom mpv.conf'**
  String get enableCustomMpvConf;

  /// Description for custom mpv.conf
  ///
  /// In en, this message translates to:
  /// **'Apply a user-specified mpv.conf before playback starts'**
  String get applyMpvConfBeforePlayback;

  /// Setting for unsafe mpv options
  ///
  /// In en, this message translates to:
  /// **'Unsafe Advanced mpv Options'**
  String get unsafeAdvancedMpvOptions;

  /// Description for unsafe mpv options
  ///
  /// In en, this message translates to:
  /// **'Allow a wider set of mpv options. May break playback behavior.'**
  String get unsafeMpvOptionsDescription;

  /// Label for hardware decoding toggle
  ///
  /// In en, this message translates to:
  /// **'Hardware decoding'**
  String get hardwareDecoding;

  /// Description for hardware decoding toggle
  ///
  /// In en, this message translates to:
  /// **'May improve performance but can cause playback issues on some devices.'**
  String get hardwareDecodingSubtitle;

  /// Section title for next up and queuing
  ///
  /// In en, this message translates to:
  /// **'Next Up & Queuing'**
  String get nextUpAndQueuing;

  /// Setting for next up behavior
  ///
  /// In en, this message translates to:
  /// **'Next Up Display'**
  String get nextUpDisplay;

  /// Option: extended
  ///
  /// In en, this message translates to:
  /// **'Extended'**
  String get extended;

  /// Option: minimal
  ///
  /// In en, this message translates to:
  /// **'Minimal'**
  String get minimal;

  /// Setting for next up timeout
  ///
  /// In en, this message translates to:
  /// **'Next Up Timeout'**
  String get nextUpTimeout;

  /// Seconds value display
  ///
  /// In en, this message translates to:
  /// **'{value}s'**
  String secondsValue(int value);

  /// Setting for media queuing
  ///
  /// In en, this message translates to:
  /// **'Media Queuing'**
  String get mediaQueuing;

  /// Description for media queuing
  ///
  /// In en, this message translates to:
  /// **'Auto-queue next episodes'**
  String get autoQueueNextEpisodes;

  /// Setting for still watching prompt
  ///
  /// In en, this message translates to:
  /// **'Still Watching Prompt'**
  String get stillWatchingPrompt;

  /// Still watching prompt interval
  ///
  /// In en, this message translates to:
  /// **'After {episodes} episodes / {hours}h'**
  String afterEpisodesAndHours(int episodes, double hours);

  /// Section title for resume and skip settings
  ///
  /// In en, this message translates to:
  /// **'Resume & Skip'**
  String get resumeAndSkip;

  /// Setting for resume rewind
  ///
  /// In en, this message translates to:
  /// **'Resume Rewind'**
  String get resumeRewind;

  /// Setting for rewinding a little when resuming from pause
  ///
  /// In en, this message translates to:
  /// **'Unpause Rewind'**
  String get unpauseRewind;

  /// Duration: 5 seconds
  ///
  /// In en, this message translates to:
  /// **'5 seconds'**
  String get fiveSeconds;

  /// Duration: 10 seconds
  ///
  /// In en, this message translates to:
  /// **'10 seconds'**
  String get tenSeconds;

  /// Duration: 15 seconds
  ///
  /// In en, this message translates to:
  /// **'15 seconds'**
  String get fifteenSeconds;

  /// Duration: 30 seconds
  ///
  /// In en, this message translates to:
  /// **'30 seconds'**
  String get thirtySeconds;

  /// Setting for skip back length
  ///
  /// In en, this message translates to:
  /// **'Skip Back Length'**
  String get skipBackLength;

  /// Setting for skip forward length
  ///
  /// In en, this message translates to:
  /// **'Skip Forward Length'**
  String get skipForwardLength;

  /// Setting for custom mpv.conf path
  ///
  /// In en, this message translates to:
  /// **'Custom mpv.conf Path'**
  String get customMpvConfPath;

  /// Description when no custom mpv.conf is set
  ///
  /// In en, this message translates to:
  /// **'Not set. Moonfin will try a default mpv.conf in app/data folders.'**
  String get notSetMpvConf;

  /// Dialog title for selecting mpv.conf
  ///
  /// In en, this message translates to:
  /// **'Select mpv.conf'**
  String get selectMpvConf;

  /// Hint text for mpv.conf path input
  ///
  /// In en, this message translates to:
  /// **'/path/to/mpv.conf'**
  String get pathToMpvConf;

  /// Info text about subtitle styling
  ///
  /// In en, this message translates to:
  /// **'Style settings (size, color, offset) apply to text-based subtitles (SRT, VTT, TTML). ASS/SSA subtitles use their own embedded styling unless \"ASS/SSA Direct Play\" is turned off. Bitmap subtitles (PGS, DVB, VobSub) cannot be restyled.'**
  String get subtitleStyleDescription;

  /// Setting for default subtitle language
  ///
  /// In en, this message translates to:
  /// **'Default Subtitle Language'**
  String get defaultSubtitleLanguage;

  /// Setting for defaulting to no subtitles
  ///
  /// In en, this message translates to:
  /// **'Default to No Subtitles'**
  String get defaultToNoSubtitles;

  /// Description for default to no subtitles
  ///
  /// In en, this message translates to:
  /// **'Turn off subtitles by default'**
  String get turnOffSubtitlesByDefault;

  /// Setting for subtitle size
  ///
  /// In en, this message translates to:
  /// **'Subtitle Size'**
  String get subtitleSize;

  /// Setting for subtitle text fill color
  ///
  /// In en, this message translates to:
  /// **'Text Fill Color'**
  String get textFillColor;

  /// Setting for background color
  ///
  /// In en, this message translates to:
  /// **'Background Color'**
  String get backgroundColor;

  /// Setting for subtitle text stroke color
  ///
  /// In en, this message translates to:
  /// **'Text Stroke Color'**
  String get textStrokeColor;

  /// Title of the subtitle customization screen
  ///
  /// In en, this message translates to:
  /// **'Subtitle Customization'**
  String get subtitleCustomization;

  /// Subtitle for the subtitle customization tile
  ///
  /// In en, this message translates to:
  /// **'Customize subtitle appearance'**
  String get subtitleCustomizationDescription;

  /// Sample text shown in the subtitle live preview
  ///
  /// In en, this message translates to:
  /// **'The quick brown fox jumps over the lazy dog'**
  String get subtitlePreviewText;

  /// Setting for vertical offset
  ///
  /// In en, this message translates to:
  /// **'Vertical Offset'**
  String get verticalOffset;

  /// Setting for PGS direct play
  ///
  /// In en, this message translates to:
  /// **'PGS Direct Play'**
  String get pgsDirectPlay;

  /// Description for PGS direct play
  ///
  /// In en, this message translates to:
  /// **'Direct play PGS subtitles'**
  String get directPlayPgsSubtitles;

  /// Setting for ASS/SSA direct play
  ///
  /// In en, this message translates to:
  /// **'ASS/SSA Direct Play'**
  String get assSsaDirectPlay;

  /// Description for ASS/SSA direct play
  ///
  /// In en, this message translates to:
  /// **'Direct play ASS/SSA subtitles'**
  String get directPlayAssSsaSubtitles;

  /// Color: white
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get white;

  /// Color: black
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get black;

  /// Color: yellow
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get yellow;

  /// Color: green
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get green;

  /// Color: cyan
  ///
  /// In en, this message translates to:
  /// **'Cyan'**
  String get cyan;

  /// Color: red
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get red;

  /// Color: transparent
  ///
  /// In en, this message translates to:
  /// **'Transparent'**
  String get transparent;

  /// Color: semi-transparent black
  ///
  /// In en, this message translates to:
  /// **'Semi-transparent Black'**
  String get semiTransparentBlack;

  /// Profile: global
  ///
  /// In en, this message translates to:
  /// **'Global'**
  String get global;

  /// Profile: desktop
  ///
  /// In en, this message translates to:
  /// **'Desktop'**
  String get desktop;

  /// Profile: mobile
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// Profile: TV
  ///
  /// In en, this message translates to:
  /// **'TV'**
  String get tv;

  /// Message when profile settings are loaded
  ///
  /// In en, this message translates to:
  /// **'Loaded {profile} profile settings.'**
  String loadedProfileSettings(String profile);

  /// Error when profile settings fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load {profile} profile settings.'**
  String failedToLoadProfileSettings(String profile);

  /// Message when settings are synced to a profile
  ///
  /// In en, this message translates to:
  /// **'Synced local settings to {profile} profile.'**
  String syncedSettingsToProfile(String profile);

  /// Setting for customization profile
  ///
  /// In en, this message translates to:
  /// **'Customization Profile'**
  String get customizationProfile;

  /// Description for customization profile
  ///
  /// In en, this message translates to:
  /// **'Choose the profile to load, edit, and sync. Global applies everywhere unless a device profile overrides it. The green dot marks your current device profile.'**
  String get customizationProfileDescription;

  /// Button to load a profile
  ///
  /// In en, this message translates to:
  /// **'Load Profile'**
  String get loadProfile;

  /// Label while syncing
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get syncing;

  /// Button to sync to a profile
  ///
  /// In en, this message translates to:
  /// **'Sync To Profile'**
  String get syncToProfile;

  /// Title when profile sync is hidden
  ///
  /// In en, this message translates to:
  /// **'Profile Sync Hidden'**
  String get profileSyncHidden;

  /// Description when plugin sync is disabled
  ///
  /// In en, this message translates to:
  /// **'Enable Server Plugin Sync in Plugin settings to show profile controls here.'**
  String get enablePluginSyncDescription;

  /// Section title for quality settings
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// Setting for default download quality
  ///
  /// In en, this message translates to:
  /// **'Default Download Quality'**
  String get defaultDownloadQuality;

  /// Section title for network settings
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// Setting for wifi-only downloads
  ///
  /// In en, this message translates to:
  /// **'WiFi-Only Downloads'**
  String get wifiOnlyDownloads;

  /// Description for wifi-only downloads
  ///
  /// In en, this message translates to:
  /// **'Only download when connected to WiFi'**
  String get onlyDownloadOnWifi;

  /// Section title for storage settings
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// Label for storage used
  ///
  /// In en, this message translates to:
  /// **'Storage Used'**
  String get storageUsed;

  /// Button to manage storage
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// Label while calculating
  ///
  /// In en, this message translates to:
  /// **'Calculating...'**
  String get calculating;

  /// Setting for download location
  ///
  /// In en, this message translates to:
  /// **'Download Location'**
  String get downloadLocation;

  /// Option: default
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultLabel;

  /// Setting for saving to downloads folder
  ///
  /// In en, this message translates to:
  /// **'Save to Downloads folder'**
  String get saveToDownloadsFolder;

  /// Description for downloads folder visibility
  ///
  /// In en, this message translates to:
  /// **'Downloads/Moonfin — visible to other apps'**
  String get downloadsVisibleToOtherApps;

  /// Section title for dangerous actions
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get dangerZone;

  /// Button to clear all downloads
  ///
  /// In en, this message translates to:
  /// **'Clear All Downloads'**
  String get clearAllDownloads;

  /// Quality option: original
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get original;

  /// Dialog title for changing download location
  ///
  /// In en, this message translates to:
  /// **'Change Download Location'**
  String get changeDownloadLocation;

  /// Description for changing download location
  ///
  /// In en, this message translates to:
  /// **'New downloads will be saved to the selected folder. Existing downloads will remain in their current location and can be managed from Storage settings.'**
  String get changeDownloadLocationDescription;

  /// Button to confirm an action
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Error when cannot write to selected folder
  ///
  /// In en, this message translates to:
  /// **'Cannot write to selected folder. Please choose a different location or grant storage permissions.'**
  String get cannotWriteToFolder;

  /// Dialog title for saving to downloads folder
  ///
  /// In en, this message translates to:
  /// **'Save to Downloads folder?'**
  String get saveToDownloadsFolderQuestion;

  /// Description for saving to downloads folder
  ///
  /// In en, this message translates to:
  /// **'Downloaded media will be saved to Downloads/Moonfin on your device. These files will be visible to other apps such as your gallery or music player.\n\nExisting downloads will remain in their current location.'**
  String get saveToDownloadsFolderDescription;

  /// Button to enable a feature
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// Warning when clearing all downloads
  ///
  /// In en, this message translates to:
  /// **'This will delete all downloaded media and cannot be undone.'**
  String get clearAllDownloadsWarning;

  /// Button to clear all
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// Setting for navigation style
  ///
  /// In en, this message translates to:
  /// **'Navigation Style'**
  String get navigationStyle;

  /// Navigation style: top bar
  ///
  /// In en, this message translates to:
  /// **'Top Bar'**
  String get topBar;

  /// Navigation style: left sidebar
  ///
  /// In en, this message translates to:
  /// **'Left Sidebar'**
  String get leftSidebar;

  /// Setting for showing shuffle button
  ///
  /// In en, this message translates to:
  /// **'Show Shuffle Button'**
  String get showShuffleButton;

  /// Setting for showing genres button
  ///
  /// In en, this message translates to:
  /// **'Show Genres Button'**
  String get showGenresButton;

  /// Setting for showing favorites button
  ///
  /// In en, this message translates to:
  /// **'Show Favorites Button'**
  String get showFavoritesButton;

  /// Setting for showing libraries in toolbar
  ///
  /// In en, this message translates to:
  /// **'Show Libraries in Toolbar'**
  String get showLibrariesInToolbar;

  /// Setting for navbar opacity
  ///
  /// In en, this message translates to:
  /// **'Navbar Opacity'**
  String get navbarOpacity;

  /// Setting for navbar color
  ///
  /// In en, this message translates to:
  /// **'Navbar Color'**
  String get navbarColor;

  /// Color: gray
  ///
  /// In en, this message translates to:
  /// **'Gray'**
  String get gray;

  /// Color: dark blue
  ///
  /// In en, this message translates to:
  /// **'Dark Blue'**
  String get darkBlue;

  /// Color: purple
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get purple;

  /// Color: teal
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get teal;

  /// Color: navy
  ///
  /// In en, this message translates to:
  /// **'Navy'**
  String get navy;

  /// Color: charcoal
  ///
  /// In en, this message translates to:
  /// **'Charcoal'**
  String get charcoal;

  /// Color: brown
  ///
  /// In en, this message translates to:
  /// **'Brown'**
  String get brown;

  /// Color: dark red
  ///
  /// In en, this message translates to:
  /// **'Dark Red'**
  String get darkRed;

  /// Color: dark green
  ///
  /// In en, this message translates to:
  /// **'Dark Green'**
  String get darkGreen;

  /// Color: slate
  ///
  /// In en, this message translates to:
  /// **'Slate'**
  String get slate;

  /// Color: indigo
  ///
  /// In en, this message translates to:
  /// **'Indigo'**
  String get indigo;

  /// Section title for library display settings
  ///
  /// In en, this message translates to:
  /// **'Library Display'**
  String get libraryDisplay;

  /// Image type: poster
  ///
  /// In en, this message translates to:
  /// **'Poster'**
  String get posterLabel;

  /// Image type: thumbnail
  ///
  /// In en, this message translates to:
  /// **'Thumbnail'**
  String get thumbnailLabel;

  /// Image type: banner
  ///
  /// In en, this message translates to:
  /// **'Banner'**
  String get bannerLabel;

  /// Setting for overriding per-library settings
  ///
  /// In en, this message translates to:
  /// **'Override Per-Library Settings'**
  String get overridePerLibrarySettings;

  /// Description for override per-library settings
  ///
  /// In en, this message translates to:
  /// **'Apply image type to all libraries'**
  String get applyImageTypeToAllLibraries;

  /// Setting for multi-server libraries
  ///
  /// In en, this message translates to:
  /// **'Multi-Server Libraries'**
  String get multiServerLibraries;

  /// Description for multi-server libraries
  ///
  /// In en, this message translates to:
  /// **'Show libraries from all connected servers'**
  String get showLibrariesFromAllServers;

  /// Setting for enabling folder view
  ///
  /// In en, this message translates to:
  /// **'Enable Folder View'**
  String get enableFolderView;

  /// Description for folder view
  ///
  /// In en, this message translates to:
  /// **'Show folder browsing option'**
  String get showFolderBrowsingOption;

  /// Section title for library visibility
  ///
  /// In en, this message translates to:
  /// **'Library Visibility'**
  String get libraryVisibility;

  /// Explanation shown on the library visibility settings screen
  ///
  /// In en, this message translates to:
  /// **'Toggle home page visibility per library. Restart Moonfin for changes to take effect.'**
  String get libraryVisibilityDescription;

  /// Toggle for showing library in navigation
  ///
  /// In en, this message translates to:
  /// **'Show in navigation'**
  String get showInNavigation;

  /// Toggle for showing library in latest media
  ///
  /// In en, this message translates to:
  /// **'Show in latest media'**
  String get showInLatestMedia;

  /// Setting for source libraries
  ///
  /// In en, this message translates to:
  /// **'Source Libraries'**
  String get sourceLibraries;

  /// Setting for source collections
  ///
  /// In en, this message translates to:
  /// **'Source Collections'**
  String get sourceCollections;

  /// Setting for excluded genres
  ///
  /// In en, this message translates to:
  /// **'Excluded Genres'**
  String get excludedGenres;

  /// Button to select all items
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// Number of selected items
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String itemsSelected(int count);

  /// Media bar section title
  ///
  /// In en, this message translates to:
  /// **'Media Bar'**
  String get mediaBar;

  /// Section heading for media source options
  ///
  /// In en, this message translates to:
  /// **'Media Sources'**
  String get mediaSources;

  /// Section heading for behavior options
  ///
  /// In en, this message translates to:
  /// **'Behavior'**
  String get behavior;

  /// Time unit label in seconds
  ///
  /// In en, this message translates to:
  /// **'seconds'**
  String get seconds;

  /// Local previews settings screen title
  ///
  /// In en, this message translates to:
  /// **'Local Previews'**
  String get localPreviews;

  /// Description for local previews settings
  ///
  /// In en, this message translates to:
  /// **'Configure trailer, media, and audio previews.'**
  String get localPreviewsDescription;

  /// Setting for choosing media bar style
  ///
  /// In en, this message translates to:
  /// **'Media Bar Style'**
  String get mediaBarMode;

  /// Description for media bar style setting
  ///
  /// In en, this message translates to:
  /// **'Choose between Moonfin, MakD, or turn the media bar off'**
  String get mediaBarModeDescription;

  /// Media bar style option: Moonfin
  ///
  /// In en, this message translates to:
  /// **'Moonfin'**
  String get mediaBarModeMoonfin;

  /// Media bar style option: MakD
  ///
  /// In en, this message translates to:
  /// **'MakD'**
  String get mediaBarModeMakd;

  /// Media bar style option: Off
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get mediaBarModeOff;

  /// Setting for enabling media bar
  ///
  /// In en, this message translates to:
  /// **'Enable Media Bar'**
  String get enableMediaBar;

  /// Description for enable media bar
  ///
  /// In en, this message translates to:
  /// **'Show featured content slideshow on home'**
  String get showFeaturedContentSlideshow;

  /// Setting for content type
  ///
  /// In en, this message translates to:
  /// **'Content Type'**
  String get contentType;

  /// Content type: movies and TV shows
  ///
  /// In en, this message translates to:
  /// **'Movies & TV Shows'**
  String get moviesAndTvShows;

  /// Content type: movies only
  ///
  /// In en, this message translates to:
  /// **'Movies Only'**
  String get moviesOnly;

  /// Content type: TV shows only
  ///
  /// In en, this message translates to:
  /// **'TV Shows Only'**
  String get tvShowsOnly;

  /// Setting for item count
  ///
  /// In en, this message translates to:
  /// **'Item Count'**
  String get itemCount;

  /// Label when nothing is selected
  ///
  /// In en, this message translates to:
  /// **'None selected'**
  String get noneSelected;

  /// Label when no genres are excluded
  ///
  /// In en, this message translates to:
  /// **'None excluded'**
  String get noneExcluded;

  /// Setting for auto advance
  ///
  /// In en, this message translates to:
  /// **'Auto Advance'**
  String get autoAdvance;

  /// Description for auto advance
  ///
  /// In en, this message translates to:
  /// **'Automatically advance to next slide'**
  String get autoAdvanceSlides;

  /// Setting for auto advance interval
  ///
  /// In en, this message translates to:
  /// **'Auto Advance Interval'**
  String get autoAdvanceInterval;

  /// Setting for trailer preview
  ///
  /// In en, this message translates to:
  /// **'Trailer Preview'**
  String get trailerPreview;

  /// Description for trailer preview
  ///
  /// In en, this message translates to:
  /// **'Auto-play trailers in the media bar after 3 seconds'**
  String get autoPlayTrailers;

  /// Setting for episode preview
  ///
  /// In en, this message translates to:
  /// **'Episode Preview'**
  String get episodePreview;

  /// Setting for media preview
  ///
  /// In en, this message translates to:
  /// **'Media Preview'**
  String get mediaPreview;

  /// Description for episode preview
  ///
  /// In en, this message translates to:
  /// **'Play a 30-second inline preview on focused, hovered, or long-pressed cards'**
  String get episodePreviewDescription;

  /// Description for media preview
  ///
  /// In en, this message translates to:
  /// **'Play a 30-second inline preview on focused, hovered, or long-pressed cards'**
  String get mediaPreviewDescription;

  /// Setting for preview audio
  ///
  /// In en, this message translates to:
  /// **'Preview Audio'**
  String get previewAudio;

  /// Description for preview audio
  ///
  /// In en, this message translates to:
  /// **'Enable audio for trailer and episode previews'**
  String get enablePreviewAudio;

  /// Home section: latest media
  ///
  /// In en, this message translates to:
  /// **'Latest Media'**
  String get latestMedia;

  /// Home section: recently released
  ///
  /// In en, this message translates to:
  /// **'Recently Released'**
  String get recentlyReleased;

  /// Home section: my media
  ///
  /// In en, this message translates to:
  /// **'My Media'**
  String get myMedia;

  /// Home section: my media small
  ///
  /// In en, this message translates to:
  /// **'My Media (Small)'**
  String get myMediaSmall;

  /// Home section: continue watching
  ///
  /// In en, this message translates to:
  /// **'Continue Watching'**
  String get continueWatching;

  /// Home section: resume audio
  ///
  /// In en, this message translates to:
  /// **'Resume Audio'**
  String get resumeAudio;

  /// Home section: resume books
  ///
  /// In en, this message translates to:
  /// **'Resume Books'**
  String get resumeBooks;

  /// Home section: active recordings
  ///
  /// In en, this message translates to:
  /// **'Active Recordings'**
  String get activeRecordings;

  /// Home section: playlists
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get playlists;

  /// Home section: live TV
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get liveTV;

  /// Settings title for home sections
  ///
  /// In en, this message translates to:
  /// **'Home Sections'**
  String get homeSections;

  /// Tooltip for reset to defaults button
  ///
  /// In en, this message translates to:
  /// **'Reset to defaults'**
  String get resetToDefaults;

  /// Setting for home row poster size
  ///
  /// In en, this message translates to:
  /// **'Home Row Poster Size'**
  String get homeRowPosterSize;

  /// Setting for per-row image type selection
  ///
  /// In en, this message translates to:
  /// **'Per Row Image Type Selection'**
  String get perRowImageTypeSelection;

  /// Description for per-row image type selection
  ///
  /// In en, this message translates to:
  /// **'Configure image type for each enabled home row'**
  String get configureImageTypeForEachRow;

  /// Setting for merging continue watching and next up
  ///
  /// In en, this message translates to:
  /// **'Merge Continue Watching and Next Up'**
  String get mergeContinueWatchingAndNextUp;

  /// Description for merge continue watching and next up
  ///
  /// In en, this message translates to:
  /// **'Combine both rows into a single home section'**
  String get combineBothRows;

  /// Title for per-row image type screen
  ///
  /// In en, this message translates to:
  /// **'Per Row Image Type'**
  String get perRowImageType;

  /// Section title for per-row settings
  ///
  /// In en, this message translates to:
  /// **'Per-Row Settings'**
  String get perRowSettings;

  /// Setting for auto login
  ///
  /// In en, this message translates to:
  /// **'Auto Login'**
  String get autoLogin;

  /// Option: last user
  ///
  /// In en, this message translates to:
  /// **'Last User'**
  String get lastUser;

  /// Option: specific user
  ///
  /// In en, this message translates to:
  /// **'Specific User'**
  String get specificUser;

  /// Setting for always authenticate
  ///
  /// In en, this message translates to:
  /// **'Always Authenticate'**
  String get alwaysAuthenticate;

  /// Description for always authenticate
  ///
  /// In en, this message translates to:
  /// **'Require password even with stored token'**
  String get requirePasswordWithToken;

  /// Setting for confirm exit
  ///
  /// In en, this message translates to:
  /// **'Confirm Exit'**
  String get confirmExit;

  /// Description for confirm exit
  ///
  /// In en, this message translates to:
  /// **'Show confirmation before exiting'**
  String get showConfirmationBeforeExiting;

  /// Label for parental controls rating selection
  ///
  /// In en, this message translates to:
  /// **'Block content with the following ratings:'**
  String get blockContentWithRatings;

  /// Shown when no ratings exist on server
  ///
  /// In en, this message translates to:
  /// **'No content ratings were found on this server yet.'**
  String get noContentRatingsFound;

  /// Shown when ratings fail to load
  ///
  /// In en, this message translates to:
  /// **'Could not load server ratings. Showing saved ratings only.'**
  String get couldNotLoadServerRatings;

  /// Shown when ratings fail to refresh
  ///
  /// In en, this message translates to:
  /// **'Could not refresh ratings from server. Showing saved ratings.'**
  String get couldNotRefreshRatings;

  /// Setting for enabling PIN code
  ///
  /// In en, this message translates to:
  /// **'Enable PIN Code'**
  String get enablePinCode;

  /// Description for enable PIN code
  ///
  /// In en, this message translates to:
  /// **'Require a PIN to access your account'**
  String get requirePinToAccess;

  /// Setting for changing PIN
  ///
  /// In en, this message translates to:
  /// **'Change PIN'**
  String get changePin;

  /// Description for change PIN
  ///
  /// In en, this message translates to:
  /// **'Set a new PIN code'**
  String get setNewPinCode;

  /// Setting for removing PIN
  ///
  /// In en, this message translates to:
  /// **'Remove PIN'**
  String get removePin;

  /// Description for remove PIN
  ///
  /// In en, this message translates to:
  /// **'Remove PIN code protection'**
  String get removePinProtection;

  /// Settings title for screensaver
  ///
  /// In en, this message translates to:
  /// **'Screensaver'**
  String get screensaver;

  /// Setting for in-app screensaver
  ///
  /// In en, this message translates to:
  /// **'In-App Screensaver'**
  String get inAppScreensaver;

  /// Description for in-app screensaver
  ///
  /// In en, this message translates to:
  /// **'Enable the built-in screensaver'**
  String get enableBuiltInScreensaver;

  /// Setting for mode
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mode;

  /// Screensaver mode: library art
  ///
  /// In en, this message translates to:
  /// **'Library Art'**
  String get libraryArt;

  /// Screensaver mode: logo
  ///
  /// In en, this message translates to:
  /// **'Logo'**
  String get logo;

  /// Screensaver mode: clock
  ///
  /// In en, this message translates to:
  /// **'Clock'**
  String get clock;

  /// Setting for timeout
  ///
  /// In en, this message translates to:
  /// **'Timeout'**
  String get timeout;

  /// Minutes duration short format
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String minutesShort(int minutes);

  /// Setting for dimming level
  ///
  /// In en, this message translates to:
  /// **'Dimming Level'**
  String get dimmingLevel;

  /// Setting for max age rating
  ///
  /// In en, this message translates to:
  /// **'Max Age Rating'**
  String get maxAgeRating;

  /// Option: any
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get any;

  /// Age rating display
  ///
  /// In en, this message translates to:
  /// **'{age}+'**
  String agePlusValue(int age);

  /// Setting for requiring age rating
  ///
  /// In en, this message translates to:
  /// **'Require Age Rating'**
  String get requireAgeRating;

  /// Description for require age rating
  ///
  /// In en, this message translates to:
  /// **'Only show rated content'**
  String get onlyShowRatedContent;

  /// Setting for showing clock
  ///
  /// In en, this message translates to:
  /// **'Show Clock'**
  String get showClock;

  /// Description for show clock
  ///
  /// In en, this message translates to:
  /// **'Display clock during screensaver'**
  String get displayClockDuringScreensaver;

  /// Rating source: Rotten Tomatoes Critics
  ///
  /// In en, this message translates to:
  /// **'Rotten Tomatoes (Critics)'**
  String get rottenTomatoesCritics;

  /// Rating source: Rotten Tomatoes Audience
  ///
  /// In en, this message translates to:
  /// **'Rotten Tomatoes (Audience)'**
  String get rottenTomatoesAudience;

  /// Rating source: IMDb
  ///
  /// In en, this message translates to:
  /// **'IMDb'**
  String get imdb;

  /// Rating source: TMDB
  ///
  /// In en, this message translates to:
  /// **'TMDB'**
  String get tmdb;

  /// Rating source: Metacritic
  ///
  /// In en, this message translates to:
  /// **'Metacritic'**
  String get metacritic;

  /// Rating source: Metacritic User
  ///
  /// In en, this message translates to:
  /// **'Metacritic (User)'**
  String get metacriticUser;

  /// Rating source: Trakt
  ///
  /// In en, this message translates to:
  /// **'Trakt'**
  String get trakt;

  /// Rating source: Letterboxd
  ///
  /// In en, this message translates to:
  /// **'Letterboxd'**
  String get letterboxd;

  /// Rating source: MyAnimeList
  ///
  /// In en, this message translates to:
  /// **'MyAnimeList'**
  String get myAnimeList;

  /// Rating source: AniList
  ///
  /// In en, this message translates to:
  /// **'AniList'**
  String get aniList;

  /// Rating source: Community Rating
  ///
  /// In en, this message translates to:
  /// **'Community Rating'**
  String get communityRating;

  /// Settings title for ratings
  ///
  /// In en, this message translates to:
  /// **'Ratings'**
  String get ratings;

  /// Setting for additional ratings
  ///
  /// In en, this message translates to:
  /// **'Additional Ratings'**
  String get additionalRatings;

  /// Description for additional ratings
  ///
  /// In en, this message translates to:
  /// **'Show MDBList and TMDB ratings'**
  String get showMdbListAndTmdbRatings;

  /// Setting for rating labels
  ///
  /// In en, this message translates to:
  /// **'Rating Labels'**
  String get ratingLabels;

  /// Description for rating labels
  ///
  /// In en, this message translates to:
  /// **'Show labels next to rating icons'**
  String get showLabelsNextToIcons;

  /// Setting for rating badges
  ///
  /// In en, this message translates to:
  /// **'Rating Badges'**
  String get ratingBadges;

  /// Description for rating badges
  ///
  /// In en, this message translates to:
  /// **'Show decorative badges behind ratings'**
  String get showDecorativeBadges;

  /// Setting for episode ratings
  ///
  /// In en, this message translates to:
  /// **'Episode Ratings'**
  String get episodeRatings;

  /// Description for episode ratings
  ///
  /// In en, this message translates to:
  /// **'Show ratings on individual episodes'**
  String get showRatingsOnEpisodes;

  /// Section title for rating sources
  ///
  /// In en, this message translates to:
  /// **'Rating Sources'**
  String get ratingSources;

  /// Description for rating sources
  ///
  /// In en, this message translates to:
  /// **'Enable and reorder the rating sources shown throughout the app'**
  String get ratingSourcesDescription;

  /// Settings title for plugin
  ///
  /// In en, this message translates to:
  /// **'Plugin'**
  String get pluginLabel;

  /// Status when plugin is detected
  ///
  /// In en, this message translates to:
  /// **'Plugin Detected'**
  String get pluginDetected;

  /// Status when plugin is not detected
  ///
  /// In en, this message translates to:
  /// **'Plugin Not Detected'**
  String get pluginNotDetected;

  /// Description when plugin is detected
  ///
  /// In en, this message translates to:
  /// **'Server plugin detected. Sync is enabled automatically the first time the plugin is found.'**
  String get pluginDetectedDescription;

  /// Description when plugin is not detected
  ///
  /// In en, this message translates to:
  /// **'Server plugin is not currently detected. Local settings still use their saved values or built-in defaults.'**
  String get pluginNotDetectedDescription;

  /// Plugin status with version
  ///
  /// In en, this message translates to:
  /// **'{status}\nVersion: {version}'**
  String pluginStatusVersion(String status, String version);

  /// Section title for available services
  ///
  /// In en, this message translates to:
  /// **'Available Services'**
  String get availableServices;

  /// Setting for server plugin sync
  ///
  /// In en, this message translates to:
  /// **'Server Plugin Sync'**
  String get serverPluginSync;

  /// Description for server plugin sync
  ///
  /// In en, this message translates to:
  /// **'Sync settings with the server plugin'**
  String get syncSettingsWithPlugin;

  /// Info title for sync explanation
  ///
  /// In en, this message translates to:
  /// **'What sync controls'**
  String get whatSyncControls;

  /// Description of what sync controls
  ///
  /// In en, this message translates to:
  /// **'Sync only controls whether plugin-backed settings are pushed to and pulled from the server. Profile selection and profile sync actions are in Customization settings when plugin sync is enabled.'**
  String get syncControlsDescription;

  /// Seerr row: recent requests
  ///
  /// In en, this message translates to:
  /// **'Recent Requests'**
  String get recentRequests;

  /// Seerr row: recently added
  ///
  /// In en, this message translates to:
  /// **'Recently Added'**
  String get recentlyAdded;

  /// Seerr row: trending
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// Seerr row: popular movies
  ///
  /// In en, this message translates to:
  /// **'Popular Movies'**
  String get popularMovies;

  /// Seerr row: movie genres
  ///
  /// In en, this message translates to:
  /// **'Movie Genres'**
  String get movieGenres;

  /// Seerr row: upcoming movies
  ///
  /// In en, this message translates to:
  /// **'Upcoming Movies'**
  String get upcomingMovies;

  /// Seerr row: studios
  ///
  /// In en, this message translates to:
  /// **'Studios'**
  String get studios;

  /// Seerr row: popular series
  ///
  /// In en, this message translates to:
  /// **'Popular Series'**
  String get popularSeries;

  /// Seerr row: series genres
  ///
  /// In en, this message translates to:
  /// **'Series Genres'**
  String get seriesGenres;

  /// Seerr row: upcoming series
  ///
  /// In en, this message translates to:
  /// **'Upcoming Series'**
  String get upcomingSeries;

  /// Seerr row: networks
  ///
  /// In en, this message translates to:
  /// **'Networks'**
  String get networks;

  /// Tooltip for reset rows to defaults
  ///
  /// In en, this message translates to:
  /// **'Reset rows to defaults'**
  String get resetRowsToDefaults;

  /// Setting for enabling Seerr
  ///
  /// In en, this message translates to:
  /// **'Enable Seerr'**
  String get enableSeerr;

  /// Description for enable Seerr
  ///
  /// In en, this message translates to:
  /// **'Show Seerr in navigation (requires server plugin)'**
  String get showSeerrInNavigation;

  /// Description when Seerr is unavailable
  ///
  /// In en, this message translates to:
  /// **'Unavailable because server plugin Seerr support is disabled.'**
  String get seerrUnavailable;

  /// Setting for NSFW filter
  ///
  /// In en, this message translates to:
  /// **'NSFW Filter'**
  String get nsfwFilter;

  /// Description for NSFW filter
  ///
  /// In en, this message translates to:
  /// **'Hide adult content in results'**
  String get hideAdultContent;

  /// Label showing logged in username
  ///
  /// In en, this message translates to:
  /// **'Logged in as: {username}'**
  String loggedInAs(String username);

  /// Section title for discover rows
  ///
  /// In en, this message translates to:
  /// **'Discover Rows'**
  String get discoverRows;

  /// Description for discover rows with plugin
  ///
  /// In en, this message translates to:
  /// **'Drag to reorder. Enable or disable rows. Enabled row order syncs with the Moonfin plugin.'**
  String get discoverRowsDescriptionPlugin;

  /// Description for discover rows without plugin
  ///
  /// In en, this message translates to:
  /// **'Drag to reorder. Enable or disable rows.'**
  String get discoverRowsDescription;

  /// Status: enabled
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// Status: hidden
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get hidden;

  /// About screen title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// Version display
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionValue(String version);

  /// Link to open source licenses
  ///
  /// In en, this message translates to:
  /// **'Open Source Licenses'**
  String get openSourceLicenses;

  /// Link to source code
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// Displayed source code repository URL
  ///
  /// In en, this message translates to:
  /// **'https://github.com/Moonfin-Client/Mobile-Desktop'**
  String get sourceCodeUrl;

  /// Button to check for updates
  ///
  /// In en, this message translates to:
  /// **'Check for Updates Now'**
  String get checkForUpdatesNow;

  /// Description for check for updates
  ///
  /// In en, this message translates to:
  /// **'Checks latest desktop release for this platform'**
  String get checksLatestDesktopRelease;

  /// Message when app is up to date
  ///
  /// In en, this message translates to:
  /// **'You are up to date.'**
  String get youAreUpToDate;

  /// Error when update check fails
  ///
  /// In en, this message translates to:
  /// **'Could not check for updates right now.'**
  String get couldNotCheckForUpdates;

  /// Message when no compatible update is found
  ///
  /// In en, this message translates to:
  /// **'No compatible update package found for this platform.'**
  String get noCompatibleUpdate;

  /// Message when update checks not supported
  ///
  /// In en, this message translates to:
  /// **'Update checks are not supported on this platform.'**
  String get updateChecksNotSupported;

  /// Message when notifications are disabled
  ///
  /// In en, this message translates to:
  /// **'Update notifications are disabled.'**
  String get updateNotificationsDisabled;

  /// Message when checking too soon
  ///
  /// In en, this message translates to:
  /// **'Please wait before checking again.'**
  String get pleaseWaitBeforeChecking;

  /// Message when update was already shown
  ///
  /// In en, this message translates to:
  /// **'Latest update was already shown.'**
  String get latestUpdateAlreadyShown;

  /// Message when an update is available
  ///
  /// In en, this message translates to:
  /// **'Update available.'**
  String get updateAvailable;

  /// Message with specific update version
  ///
  /// In en, this message translates to:
  /// **'Update available: v{version}'**
  String updateAvailableVersion(String version);

  /// Setting for update notifications
  ///
  /// In en, this message translates to:
  /// **'Update Notifications'**
  String get updateNotifications;

  /// Description for update notifications
  ///
  /// In en, this message translates to:
  /// **'Show when updates are available'**
  String get showWhenUpdatesAvailable;

  /// Title of the update dialog showing the new version
  ///
  /// In en, this message translates to:
  /// **'v{version} Available'**
  String updateAvailableTitle(String version);

  /// Option to read the release notes in a browser
  ///
  /// In en, this message translates to:
  /// **'Read Release Notes'**
  String get readReleaseNotes;

  /// Label shown while an update is being downloaded
  ///
  /// In en, this message translates to:
  /// **'Downloading update...'**
  String get downloadingUpdate;

  /// Error shown when the update download fails
  ///
  /// In en, this message translates to:
  /// **'Update download failed. Please try again.'**
  String get updateDownloadFailed;

  /// Option to open the GitHub releases page in a browser (Linux)
  ///
  /// In en, this message translates to:
  /// **'Open Releases Page'**
  String get openReleasesPage;

  /// Navigation settings title
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get navigation;

  /// Appearance settings subtitle on mobile
  ///
  /// In en, this message translates to:
  /// **'Watched indicators, backdrops'**
  String get watchedIndicatorsBackdrops;

  /// Appearance settings subtitle on desktop
  ///
  /// In en, this message translates to:
  /// **'Focus color, watched indicators, backdrops'**
  String get focusColorWatchedIndicatorsBackdrops;

  /// Navigation settings subtitle
  ///
  /// In en, this message translates to:
  /// **'Navbar style, toolbar buttons, appearance'**
  String get navbarStyleToolbarAppearance;

  /// Home sections settings subtitle
  ///
  /// In en, this message translates to:
  /// **'Reorder and toggle home rows'**
  String get reorderToggleHomeRows;

  /// Media bar settings subtitle
  ///
  /// In en, this message translates to:
  /// **'Featured content, appearance'**
  String get featuredContentAppearance;

  /// Library display settings subtitle
  ///
  /// In en, this message translates to:
  /// **'Poster size, image type, folder view'**
  String get posterSizeImageTypeFolderView;

  /// Ratings settings subtitle
  ///
  /// In en, this message translates to:
  /// **'MDBList, TMDB, and rating sources'**
  String get mdbListTmdbRatingSources;

  /// Gigabyte value display
  ///
  /// In en, this message translates to:
  /// **'{value} GB'**
  String gbValue(String value);

  /// Button to clear
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// Button to browse files
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// Shown when a search or browse returns no items
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// Seerr media status when item is available
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get seerrAvailableStatus;

  /// Seerr media status when item has been requested
  ///
  /// In en, this message translates to:
  /// **'Requested'**
  String get seerrRequestedStatus;

  /// Status bar item count
  ///
  /// In en, this message translates to:
  /// **'{count} Items'**
  String itemsCount(int count);

  /// Dialog title for Seerr browse settings
  ///
  /// In en, this message translates to:
  /// **'Seerr Settings'**
  String get seerrSettings;

  /// Button to request more seasons
  ///
  /// In en, this message translates to:
  /// **'Request More'**
  String get requestMore;

  /// Button to submit a media request
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// Button/dialog title to cancel a media request
  ///
  /// In en, this message translates to:
  /// **'Cancel Request'**
  String get cancelRequest;

  /// Button to play available media in Moonfin
  ///
  /// In en, this message translates to:
  /// **'Play in Moonfin'**
  String get playInMoonfin;

  /// Label showing who requested media
  ///
  /// In en, this message translates to:
  /// **'Requested by {name}'**
  String requestedByName(String name);

  /// Tooltip/button to approve a request
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// Tooltip/button to decline a request
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get declineAction;

  /// Section title for similar media
  ///
  /// In en, this message translates to:
  /// **'Similar'**
  String get similar;

  /// Section title for recommended media
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// Confirmation message for single request cancellation
  ///
  /// In en, this message translates to:
  /// **'Cancel request for \"{title}\"?'**
  String cancelRequestForTitle(String title);

  /// Confirmation message for multiple request cancellation
  ///
  /// In en, this message translates to:
  /// **'Cancel {count} requests for \"{title}\"?'**
  String cancelCountRequestsForTitle(int count, String title);

  /// Button to keep/dismiss a cancel dialog
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get keep;

  /// Snackbar when Seerr item cannot be found in Jellyfin
  ///
  /// In en, this message translates to:
  /// **'Item not found in your Moonfin library'**
  String get itemNotFoundInLibrary;

  /// Snackbar when library search fails
  ///
  /// In en, this message translates to:
  /// **'Error searching library'**
  String get errorSearchingLibrary;

  /// Movie budget display
  ///
  /// In en, this message translates to:
  /// **'Budget: \${amount}'**
  String budgetAmount(String amount);

  /// Movie revenue display
  ///
  /// In en, this message translates to:
  /// **'Revenue: \${amount}'**
  String revenueAmount(String amount);

  /// Number of seasons label
  ///
  /// In en, this message translates to:
  /// **'{count} {label}'**
  String seasonsCount(int count, String label);

  /// Bottom sheet title for requesting media
  ///
  /// In en, this message translates to:
  /// **'Request {type}'**
  String requestSeriesOrMovie(String type);

  /// Button to finalize a media request
  ///
  /// In en, this message translates to:
  /// **'Submit Request'**
  String get submitRequest;

  /// Checkbox label for selecting all seasons
  ///
  /// In en, this message translates to:
  /// **'All Seasons'**
  String get allSeasons;

  /// Expansion tile for advanced request options
  ///
  /// In en, this message translates to:
  /// **'Advanced Options'**
  String get advancedOptions;

  /// Shown when no Radarr/Sonarr servers are set up
  ///
  /// In en, this message translates to:
  /// **'No service servers configured'**
  String get noServiceServersConfigured;

  /// Dropdown label for server selection
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get server;

  /// Dropdown label for quality profile selection
  ///
  /// In en, this message translates to:
  /// **'Quality Profile'**
  String get qualityProfile;

  /// Dropdown label for root folder selection
  ///
  /// In en, this message translates to:
  /// **'Root Folder'**
  String get rootFolder;

  /// Button to expand truncated content
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// Section title for cast appearances
  ///
  /// In en, this message translates to:
  /// **'Appearances'**
  String get appearances;

  /// Section title for crew credits
  ///
  /// In en, this message translates to:
  /// **'Crew'**
  String get crewSection;

  /// Person age display
  ///
  /// In en, this message translates to:
  /// **'age {age}'**
  String ageValue(int age);

  /// Shown when request list is empty
  ///
  /// In en, this message translates to:
  /// **'No requests'**
  String get noRequests;

  /// Request status label
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingStatus;

  /// Request status label
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get declinedStatus;

  /// Request status label
  ///
  /// In en, this message translates to:
  /// **'Partially Available'**
  String get partiallyAvailable;

  /// Request status label
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloadingStatus;

  /// Request status label
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approvedStatus;

  /// Request status label when no request exists
  ///
  /// In en, this message translates to:
  /// **'Not Requested'**
  String get notRequestedStatus;

  /// Request status label for blocklisted media
  ///
  /// In en, this message translates to:
  /// **'Blocklisted'**
  String get blocklistedStatus;

  /// Request status label for deleted media
  ///
  /// In en, this message translates to:
  /// **'Deleted'**
  String get deletedStatus;

  /// Stat label for TMDB user score
  ///
  /// In en, this message translates to:
  /// **'TMDB Score'**
  String get tmdbScore;

  /// Stat label for release date
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get releaseDateLabel;

  /// Stat label for first air date
  ///
  /// In en, this message translates to:
  /// **'First Air Date'**
  String get firstAirDateLabel;

  /// Stat label for revenue
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenueLabel;

  /// Stat label for runtime
  ///
  /// In en, this message translates to:
  /// **'Runtime'**
  String get runtimeLabel;

  /// Stat label for budget
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budgetLabel;

  /// Stat label for original language
  ///
  /// In en, this message translates to:
  /// **'Original Language'**
  String get originalLanguageLabel;

  /// Stat label for number of seasons
  ///
  /// In en, this message translates to:
  /// **'Seasons'**
  String get seasonsLabel;

  /// Stat label for number of episodes
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodesLabel;

  /// No description provided for @access.
  ///
  /// In en, this message translates to:
  /// **'Access'**
  String get access;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @analytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get analytics;

  /// No description provided for @catalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get catalog;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @disable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @encoding.
  ///
  /// In en, this message translates to:
  /// **'Encoding'**
  String get encoding;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @forward.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get forward;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @go.
  ///
  /// In en, this message translates to:
  /// **'Go'**
  String get go;

  /// No description provided for @install.
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get install;

  /// No description provided for @installed.
  ///
  /// In en, this message translates to:
  /// **'Installed'**
  String get installed;

  /// No description provided for @interval.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get interval;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @networking.
  ///
  /// In en, this message translates to:
  /// **'Networking'**
  String get networking;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @path.
  ///
  /// In en, this message translates to:
  /// **'Path'**
  String get path;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @provider.
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get provider;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @revoke.
  ///
  /// In en, this message translates to:
  /// **'Revoke'**
  String get revoke;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @root.
  ///
  /// In en, this message translates to:
  /// **'Root'**
  String get root;

  /// No description provided for @run.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get run;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @sessions.
  ///
  /// In en, this message translates to:
  /// **'Sessions'**
  String get sessions;

  /// No description provided for @set.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get set;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @streaming.
  ///
  /// In en, this message translates to:
  /// **'Streaming'**
  String get streaming;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @trickplay.
  ///
  /// In en, this message translates to:
  /// **'Trickplay'**
  String get trickplay;

  /// No description provided for @uninstall.
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get uninstall;

  /// No description provided for @up.
  ///
  /// In en, this message translates to:
  /// **'Up'**
  String get up;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @unmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get unmute;

  /// No description provided for @mute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get mute;

  /// No description provided for @branding.
  ///
  /// In en, this message translates to:
  /// **'Branding'**
  String get branding;

  /// No description provided for @adminDrawerDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get adminDrawerDashboard;

  /// No description provided for @adminDrawerAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get adminDrawerAnalytics;

  /// No description provided for @adminDrawerSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get adminDrawerSettings;

  /// No description provided for @adminDrawerBranding.
  ///
  /// In en, this message translates to:
  /// **'Branding'**
  String get adminDrawerBranding;

  /// No description provided for @adminDrawerUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get adminDrawerUsers;

  /// No description provided for @adminDrawerLibraries.
  ///
  /// In en, this message translates to:
  /// **'Libraries'**
  String get adminDrawerLibraries;

  /// No description provided for @adminDrawerTranscoding.
  ///
  /// In en, this message translates to:
  /// **'Transcoding'**
  String get adminDrawerTranscoding;

  /// No description provided for @adminDrawerResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get adminDrawerResume;

  /// No description provided for @adminDrawerStreaming.
  ///
  /// In en, this message translates to:
  /// **'Streaming'**
  String get adminDrawerStreaming;

  /// No description provided for @adminDrawerTrickplay.
  ///
  /// In en, this message translates to:
  /// **'Trickplay'**
  String get adminDrawerTrickplay;

  /// No description provided for @adminDrawerDevices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get adminDrawerDevices;

  /// No description provided for @adminDrawerActivity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get adminDrawerActivity;

  /// No description provided for @adminDrawerNetworking.
  ///
  /// In en, this message translates to:
  /// **'Networking'**
  String get adminDrawerNetworking;

  /// No description provided for @adminDrawerApiKeys.
  ///
  /// In en, this message translates to:
  /// **'API Keys'**
  String get adminDrawerApiKeys;

  /// No description provided for @adminDrawerBackups.
  ///
  /// In en, this message translates to:
  /// **'Backups'**
  String get adminDrawerBackups;

  /// No description provided for @adminDrawerLogs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get adminDrawerLogs;

  /// No description provided for @adminDrawerScheduledTasks.
  ///
  /// In en, this message translates to:
  /// **'Scheduled Tasks'**
  String get adminDrawerScheduledTasks;

  /// No description provided for @adminDrawerPlugins.
  ///
  /// In en, this message translates to:
  /// **'Plugins'**
  String get adminDrawerPlugins;

  /// No description provided for @adminDrawerRepositories.
  ///
  /// In en, this message translates to:
  /// **'Repositories'**
  String get adminDrawerRepositories;

  /// No description provided for @adminDrawerLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get adminDrawerLiveTv;

  /// No description provided for @adminExitTooltip.
  ///
  /// In en, this message translates to:
  /// **'Exit Admin'**
  String get adminExitTooltip;

  /// No description provided for @adminDashboardLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard'**
  String get adminDashboardLoadFailed;

  /// No description provided for @adminMediaOverview.
  ///
  /// In en, this message translates to:
  /// **'Media Overview'**
  String get adminMediaOverview;

  /// No description provided for @adminMediaTotalsError.
  ///
  /// In en, this message translates to:
  /// **'Could not load server media totals.'**
  String get adminMediaTotalsError;

  /// No description provided for @adminMediaOverviewSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A quick read on how much content is on this server.'**
  String get adminMediaOverviewSubtitle;

  /// No description provided for @adminPluginUpdatesAvailable.
  ///
  /// In en, this message translates to:
  /// **'Plugin updates available: {count}'**
  String adminPluginUpdatesAvailable(int count);

  /// No description provided for @adminPluginsRequiringRestart.
  ///
  /// In en, this message translates to:
  /// **'Plugins requiring restart: {count}'**
  String adminPluginsRequiringRestart(int count);

  /// No description provided for @adminFailedScheduledTasks.
  ///
  /// In en, this message translates to:
  /// **'Failed scheduled tasks: {count}'**
  String adminFailedScheduledTasks(int count);

  /// No description provided for @adminRecentAlertEntries.
  ///
  /// In en, this message translates to:
  /// **'Recent warning/error entries: {count}'**
  String adminRecentAlertEntries(int count);

  /// No description provided for @analyticsMediaDistribution.
  ///
  /// In en, this message translates to:
  /// **'Media Distribution'**
  String get analyticsMediaDistribution;

  /// No description provided for @analyticsVideoCodecs.
  ///
  /// In en, this message translates to:
  /// **'Video Codecs'**
  String get analyticsVideoCodecs;

  /// No description provided for @analyticsAudioCodecs.
  ///
  /// In en, this message translates to:
  /// **'Audio Codecs'**
  String get analyticsAudioCodecs;

  /// No description provided for @analyticsContainers.
  ///
  /// In en, this message translates to:
  /// **'Containers'**
  String get analyticsContainers;

  /// No description provided for @analyticsTopGenres.
  ///
  /// In en, this message translates to:
  /// **'Top Genres'**
  String get analyticsTopGenres;

  /// No description provided for @analyticsReleaseYears.
  ///
  /// In en, this message translates to:
  /// **'Release Years'**
  String get analyticsReleaseYears;

  /// No description provided for @analyticsContentRatings.
  ///
  /// In en, this message translates to:
  /// **'Content Ratings'**
  String get analyticsContentRatings;

  /// No description provided for @analyticsRuntimeBuckets.
  ///
  /// In en, this message translates to:
  /// **'Runtime Buckets'**
  String get analyticsRuntimeBuckets;

  /// No description provided for @analyticsFileFormats.
  ///
  /// In en, this message translates to:
  /// **'File Formats'**
  String get analyticsFileFormats;

  /// No description provided for @analyticsNoData.
  ///
  /// In en, this message translates to:
  /// **'No Data Available.'**
  String get analyticsNoData;

  /// No description provided for @adminServerInfo.
  ///
  /// In en, this message translates to:
  /// **'Server Info'**
  String get adminServerInfo;

  /// No description provided for @adminRestartPending.
  ///
  /// In en, this message translates to:
  /// **'Restart Pending'**
  String get adminRestartPending;

  /// No description provided for @adminServerPaths.
  ///
  /// In en, this message translates to:
  /// **'Server Paths'**
  String get adminServerPaths;

  /// No description provided for @adminServerActions.
  ///
  /// In en, this message translates to:
  /// **'Server Actions'**
  String get adminServerActions;

  /// No description provided for @adminRestartServer.
  ///
  /// In en, this message translates to:
  /// **'Restart Server'**
  String get adminRestartServer;

  /// No description provided for @adminShutdownServer.
  ///
  /// In en, this message translates to:
  /// **'Shutdown Server'**
  String get adminShutdownServer;

  /// No description provided for @adminScanLibraries.
  ///
  /// In en, this message translates to:
  /// **'Scan Libraries'**
  String get adminScanLibraries;

  /// No description provided for @adminLibraryScanStarted.
  ///
  /// In en, this message translates to:
  /// **'Library scan started'**
  String get adminLibraryScanStarted;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorGeneric(String error);

  /// No description provided for @adminServerRebootInProgress.
  ///
  /// In en, this message translates to:
  /// **'Server reboot in progress'**
  String get adminServerRebootInProgress;

  /// No description provided for @adminServerRebootMessage.
  ///
  /// In en, this message translates to:
  /// **'Server reboot in progress, please restart Moonfin'**
  String get adminServerRebootMessage;

  /// No description provided for @adminActiveSessions.
  ///
  /// In en, this message translates to:
  /// **'Active Sessions'**
  String get adminActiveSessions;

  /// No description provided for @adminSessionsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load sessions'**
  String get adminSessionsLoadFailed;

  /// No description provided for @adminNoActiveSessions.
  ///
  /// In en, this message translates to:
  /// **'No active sessions'**
  String get adminNoActiveSessions;

  /// No description provided for @adminRecentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get adminRecentActivity;

  /// No description provided for @adminNoRecentActivity.
  ///
  /// In en, this message translates to:
  /// **'No recent activity'**
  String get adminNoRecentActivity;

  /// No description provided for @adminCommandFailed.
  ///
  /// In en, this message translates to:
  /// **'Command failed: {error}'**
  String adminCommandFailed(String error);

  /// No description provided for @adminSendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get adminSendMessage;

  /// No description provided for @adminMessageTextHint.
  ///
  /// In en, this message translates to:
  /// **'Message text'**
  String get adminMessageTextHint;

  /// No description provided for @adminSetVolume.
  ///
  /// In en, this message translates to:
  /// **'Set Volume'**
  String get adminSetVolume;

  /// No description provided for @sessionPrev.
  ///
  /// In en, this message translates to:
  /// **'Prev'**
  String get sessionPrev;

  /// No description provided for @sessionRewind.
  ///
  /// In en, this message translates to:
  /// **'Rewind'**
  String get sessionRewind;

  /// No description provided for @sessionForward.
  ///
  /// In en, this message translates to:
  /// **'Forward'**
  String get sessionForward;

  /// No description provided for @sessionNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get sessionNext;

  /// No description provided for @sessionVolumeDown.
  ///
  /// In en, this message translates to:
  /// **'Vol –'**
  String get sessionVolumeDown;

  /// No description provided for @sessionVolumeUp.
  ///
  /// In en, this message translates to:
  /// **'Vol +'**
  String get sessionVolumeUp;

  /// No description provided for @uhd4k.
  ///
  /// In en, this message translates to:
  /// **'4K'**
  String get uhd4k;

  /// No description provided for @nowPlaying.
  ///
  /// In en, this message translates to:
  /// **'Now Playing'**
  String get nowPlaying;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @videoCodec.
  ///
  /// In en, this message translates to:
  /// **'Video Codec'**
  String get videoCodec;

  /// No description provided for @audioCodec.
  ///
  /// In en, this message translates to:
  /// **'Audio Codec'**
  String get audioCodec;

  /// No description provided for @hwAccel.
  ///
  /// In en, this message translates to:
  /// **'HW Accel'**
  String get hwAccel;

  /// No description provided for @completion.
  ///
  /// In en, this message translates to:
  /// **'Completion'**
  String get completion;

  /// No description provided for @direct.
  ///
  /// In en, this message translates to:
  /// **'Direct'**
  String get direct;

  /// No description provided for @adminDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get adminDisconnect;

  /// No description provided for @adminClearDates.
  ///
  /// In en, this message translates to:
  /// **'Clear dates'**
  String get adminClearDates;

  /// No description provided for @adminActivityLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load activity log: {error}'**
  String adminActivityLoadFailed(String error);

  /// No description provided for @adminNoActivityEntries.
  ///
  /// In en, this message translates to:
  /// **'No activity entries'**
  String get adminNoActivityEntries;

  /// No description provided for @adminEditDeviceName.
  ///
  /// In en, this message translates to:
  /// **'Edit Device Name'**
  String get adminEditDeviceName;

  /// No description provided for @adminCustomName.
  ///
  /// In en, this message translates to:
  /// **'Custom Name'**
  String get adminCustomName;

  /// No description provided for @adminDeviceNameUpdated.
  ///
  /// In en, this message translates to:
  /// **'Device name updated'**
  String get adminDeviceNameUpdated;

  /// No description provided for @adminDeviceUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update device: {error}'**
  String adminDeviceUpdateFailed(String error);

  /// No description provided for @adminDeleteDevice.
  ///
  /// In en, this message translates to:
  /// **'Delete Device'**
  String get adminDeleteDevice;

  /// No description provided for @adminDeviceDeleted.
  ///
  /// In en, this message translates to:
  /// **'Device deleted'**
  String get adminDeviceDeleted;

  /// No description provided for @adminDeviceDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete device: {error}'**
  String adminDeviceDeleteFailed(String error);

  /// No description provided for @adminDevicesLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load devices'**
  String get adminDevicesLoadFailed;

  /// No description provided for @adminSearchDevices.
  ///
  /// In en, this message translates to:
  /// **'Search devices'**
  String get adminSearchDevices;

  /// No description provided for @adminThisDevice.
  ///
  /// In en, this message translates to:
  /// **'This Device'**
  String get adminThisDevice;

  /// No description provided for @adminEditName.
  ///
  /// In en, this message translates to:
  /// **'Edit Name'**
  String get adminEditName;

  /// No description provided for @adminLibrariesLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load libraries'**
  String get adminLibrariesLoadFailed;

  /// No description provided for @adminNoLibraries.
  ///
  /// In en, this message translates to:
  /// **'No libraries configured'**
  String get adminNoLibraries;

  /// No description provided for @adminScanAllLibraries.
  ///
  /// In en, this message translates to:
  /// **'Scan All Libraries'**
  String get adminScanAllLibraries;

  /// No description provided for @adminAddLibrary.
  ///
  /// In en, this message translates to:
  /// **'Add Library'**
  String get adminAddLibrary;

  /// No description provided for @adminScanFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to start scan: {error}'**
  String adminScanFailed(String error);

  /// No description provided for @adminRenameLibrary.
  ///
  /// In en, this message translates to:
  /// **'Rename Library'**
  String get adminRenameLibrary;

  /// No description provided for @adminNewName.
  ///
  /// In en, this message translates to:
  /// **'New name'**
  String get adminNewName;

  /// No description provided for @adminLibraryRenamed.
  ///
  /// In en, this message translates to:
  /// **'Library renamed to \"{name}\"'**
  String adminLibraryRenamed(String name);

  /// No description provided for @adminRenameFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to rename: {error}'**
  String adminRenameFailed(String error);

  /// No description provided for @adminDeleteLibrary.
  ///
  /// In en, this message translates to:
  /// **'Delete Library'**
  String get adminDeleteLibrary;

  /// No description provided for @adminLibraryDeleted.
  ///
  /// In en, this message translates to:
  /// **'Library \"{name}\" deleted'**
  String adminLibraryDeleted(String name);

  /// No description provided for @adminLibraryDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete library: {error}'**
  String adminLibraryDeleteFailed(String error);

  /// No description provided for @adminAddPathFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add path: {error}'**
  String adminAddPathFailed(String error);

  /// No description provided for @adminRemovePath.
  ///
  /// In en, this message translates to:
  /// **'Remove Path'**
  String get adminRemovePath;

  /// No description provided for @adminRemovePathConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{path}\" from this library?'**
  String adminRemovePathConfirm(String path);

  /// No description provided for @adminRemovePathFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove path: {error}'**
  String adminRemovePathFailed(String error);

  /// No description provided for @adminLibraryOptionsSaved.
  ///
  /// In en, this message translates to:
  /// **'Library options saved'**
  String get adminLibraryOptionsSaved;

  /// No description provided for @adminLibraryOptionsSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save options: {error}'**
  String adminLibraryOptionsSaveFailed(String error);

  /// No description provided for @adminLibraryLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load library'**
  String get adminLibraryLoadFailed;

  /// No description provided for @adminNoMediaPaths.
  ///
  /// In en, this message translates to:
  /// **'No media paths configured'**
  String get adminNoMediaPaths;

  /// No description provided for @adminAddPath.
  ///
  /// In en, this message translates to:
  /// **'Add Path'**
  String get adminAddPath;

  /// No description provided for @adminBrowseFilesystem.
  ///
  /// In en, this message translates to:
  /// **'Browse server filesystem:'**
  String get adminBrowseFilesystem;

  /// No description provided for @adminSaveOptions.
  ///
  /// In en, this message translates to:
  /// **'Save Options'**
  String get adminSaveOptions;

  /// No description provided for @adminPreferredMetadataLanguage.
  ///
  /// In en, this message translates to:
  /// **'Preferred metadata language'**
  String get adminPreferredMetadataLanguage;

  /// No description provided for @adminMetadataLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. en, de, fr'**
  String get adminMetadataLanguageHint;

  /// No description provided for @adminMetadataCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Metadata country code'**
  String get adminMetadataCountryCode;

  /// No description provided for @adminMetadataCountryHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. US, DE, FR'**
  String get adminMetadataCountryHint;

  /// No description provided for @adminLibraryNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Library name is required'**
  String get adminLibraryNameRequired;

  /// No description provided for @adminLibraryCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create library: {error}'**
  String adminLibraryCreateFailed(String error);

  /// No description provided for @adminLibraryName.
  ///
  /// In en, this message translates to:
  /// **'Library Name'**
  String get adminLibraryName;

  /// No description provided for @adminSelectedPaths.
  ///
  /// In en, this message translates to:
  /// **'Selected Paths:'**
  String get adminSelectedPaths;

  /// No description provided for @adminNoPathsAdded.
  ///
  /// In en, this message translates to:
  /// **'No paths added (can be added later)'**
  String get adminNoPathsAdded;

  /// No description provided for @adminCreateLibrary.
  ///
  /// In en, this message translates to:
  /// **'Create Library'**
  String get adminCreateLibrary;

  /// No description provided for @paths.
  ///
  /// In en, this message translates to:
  /// **'Paths:'**
  String get paths;

  /// No description provided for @adminDisableUser.
  ///
  /// In en, this message translates to:
  /// **'Disable User'**
  String get adminDisableUser;

  /// No description provided for @adminEnableUser.
  ///
  /// In en, this message translates to:
  /// **'Enable User'**
  String get adminEnableUser;

  /// No description provided for @adminDisableUserConfirm.
  ///
  /// In en, this message translates to:
  /// **'Disable {name}? They will not be able to sign in.'**
  String adminDisableUserConfirm(String name);

  /// No description provided for @adminEnableUserConfirm.
  ///
  /// In en, this message translates to:
  /// **'Enable {name}? They will be able to sign in again.'**
  String adminEnableUserConfirm(String name);

  /// No description provided for @adminUserDisabled.
  ///
  /// In en, this message translates to:
  /// **'User \"{name}\" disabled'**
  String adminUserDisabled(String name);

  /// No description provided for @adminUserEnabled.
  ///
  /// In en, this message translates to:
  /// **'User \"{name}\" enabled'**
  String adminUserEnabled(String name);

  /// No description provided for @adminUserPolicyUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update user policy: {error}'**
  String adminUserPolicyUpdateFailed(String error);

  /// No description provided for @adminUsersLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load users'**
  String get adminUsersLoadFailed;

  /// No description provided for @adminSearchUsers.
  ///
  /// In en, this message translates to:
  /// **'Search users'**
  String get adminSearchUsers;

  /// No description provided for @adminEditUser.
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get adminEditUser;

  /// No description provided for @adminAddUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get adminAddUser;

  /// No description provided for @adminUserCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create user: {error}'**
  String adminUserCreateFailed(String error);

  /// No description provided for @adminCreateUser.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get adminCreateUser;

  /// No description provided for @adminPasswordOptional.
  ///
  /// In en, this message translates to:
  /// **'Password (optional)'**
  String get adminPasswordOptional;

  /// No description provided for @adminUsernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Username cannot be empty'**
  String get adminUsernameRequired;

  /// No description provided for @adminNoProfileChanges.
  ///
  /// In en, this message translates to:
  /// **'No profile changes to save'**
  String get adminNoProfileChanges;

  /// No description provided for @adminProfileSaved.
  ///
  /// In en, this message translates to:
  /// **'Profile saved'**
  String get adminProfileSaved;

  /// No description provided for @adminSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save: {error}'**
  String adminSaveFailed(String error);

  /// No description provided for @adminPermissionsSaved.
  ///
  /// In en, this message translates to:
  /// **'Permissions saved'**
  String get adminPermissionsSaved;

  /// No description provided for @adminPasswordsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get adminPasswordsMismatch;

  /// No description provided for @adminFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String adminFailed(String error);

  /// No description provided for @adminUserLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load user'**
  String get adminUserLoadFailed;

  /// No description provided for @adminBackToUsers.
  ///
  /// In en, this message translates to:
  /// **'Back to Users'**
  String get adminBackToUsers;

  /// No description provided for @adminSaveProfile.
  ///
  /// In en, this message translates to:
  /// **'Save Profile'**
  String get adminSaveProfile;

  /// No description provided for @adminDeleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get adminDeleteUser;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @adminFullAccessWarning.
  ///
  /// In en, this message translates to:
  /// **'Administrators have complete access to the server. Grant with caution.'**
  String get adminFullAccessWarning;

  /// No description provided for @administrator.
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get administrator;

  /// No description provided for @adminHiddenUser.
  ///
  /// In en, this message translates to:
  /// **'Hidden user'**
  String get adminHiddenUser;

  /// No description provided for @adminAllowMediaPlayback.
  ///
  /// In en, this message translates to:
  /// **'Allow media playback'**
  String get adminAllowMediaPlayback;

  /// No description provided for @adminAllowAudioTranscoding.
  ///
  /// In en, this message translates to:
  /// **'Allow audio transcoding'**
  String get adminAllowAudioTranscoding;

  /// No description provided for @adminAllowVideoTranscoding.
  ///
  /// In en, this message translates to:
  /// **'Allow video transcoding'**
  String get adminAllowVideoTranscoding;

  /// No description provided for @adminAllowRemuxing.
  ///
  /// In en, this message translates to:
  /// **'Allow remuxing'**
  String get adminAllowRemuxing;

  /// No description provided for @adminForceRemoteTranscoding.
  ///
  /// In en, this message translates to:
  /// **'Force remote source transcoding'**
  String get adminForceRemoteTranscoding;

  /// No description provided for @adminAllowContentDeletion.
  ///
  /// In en, this message translates to:
  /// **'Allow content deletion'**
  String get adminAllowContentDeletion;

  /// No description provided for @adminAllowContentDownloading.
  ///
  /// In en, this message translates to:
  /// **'Allow content downloading'**
  String get adminAllowContentDownloading;

  /// No description provided for @adminAllowPublicSharing.
  ///
  /// In en, this message translates to:
  /// **'Allow public sharing'**
  String get adminAllowPublicSharing;

  /// No description provided for @adminAllowRemoteControl.
  ///
  /// In en, this message translates to:
  /// **'Allow remote control of other users'**
  String get adminAllowRemoteControl;

  /// No description provided for @adminAllowSharedDeviceControl.
  ///
  /// In en, this message translates to:
  /// **'Allow shared device control'**
  String get adminAllowSharedDeviceControl;

  /// No description provided for @adminAllowRemoteAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow remote access'**
  String get adminAllowRemoteAccess;

  /// No description provided for @adminRemoteBitrateLimit.
  ///
  /// In en, this message translates to:
  /// **'Remote client bitrate limit (bps)'**
  String get adminRemoteBitrateLimit;

  /// No description provided for @adminLeaveEmptyNoLimit.
  ///
  /// In en, this message translates to:
  /// **'Leave empty for no limit'**
  String get adminLeaveEmptyNoLimit;

  /// No description provided for @adminMaxActiveSessions.
  ///
  /// In en, this message translates to:
  /// **'Max active sessions'**
  String get adminMaxActiveSessions;

  /// No description provided for @adminAllowLiveTvAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow Live TV access'**
  String get adminAllowLiveTvAccess;

  /// No description provided for @adminAllowLiveTvManagement.
  ///
  /// In en, this message translates to:
  /// **'Allow Live TV management'**
  String get adminAllowLiveTvManagement;

  /// No description provided for @adminAllowCollectionManagement.
  ///
  /// In en, this message translates to:
  /// **'Allow collection management'**
  String get adminAllowCollectionManagement;

  /// No description provided for @adminAllowSubtitleManagement.
  ///
  /// In en, this message translates to:
  /// **'Allow subtitle management'**
  String get adminAllowSubtitleManagement;

  /// No description provided for @adminAllowLyricManagement.
  ///
  /// In en, this message translates to:
  /// **'Allow lyric management'**
  String get adminAllowLyricManagement;

  /// No description provided for @adminSavePermissions.
  ///
  /// In en, this message translates to:
  /// **'Save Permissions'**
  String get adminSavePermissions;

  /// No description provided for @adminEnableAllLibraryAccess.
  ///
  /// In en, this message translates to:
  /// **'Enable access to all libraries'**
  String get adminEnableAllLibraryAccess;

  /// No description provided for @adminSaveAccess.
  ///
  /// In en, this message translates to:
  /// **'Save Access'**
  String get adminSaveAccess;

  /// No description provided for @adminChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get adminChangePassword;

  /// No description provided for @adminNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get adminNewPassword;

  /// No description provided for @adminConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get adminConfirmPassword;

  /// No description provided for @adminSetPassword.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get adminSetPassword;

  /// No description provided for @adminResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get adminResetPassword;

  /// No description provided for @adminPasswordReset.
  ///
  /// In en, this message translates to:
  /// **'Password reset'**
  String get adminPasswordReset;

  /// No description provided for @adminPasswordUpdated.
  ///
  /// In en, this message translates to:
  /// **'Password updated'**
  String get adminPasswordUpdated;

  /// No description provided for @adminUserSettings.
  ///
  /// In en, this message translates to:
  /// **'User Settings'**
  String get adminUserSettings;

  /// No description provided for @adminLibraryAccess.
  ///
  /// In en, this message translates to:
  /// **'Library Access'**
  String get adminLibraryAccess;

  /// No description provided for @adminDeviceAndChannelAccess.
  ///
  /// In en, this message translates to:
  /// **'Device & Channel Access'**
  String get adminDeviceAndChannelAccess;

  /// No description provided for @adminEnableAllDevices.
  ///
  /// In en, this message translates to:
  /// **'Enable access to all devices'**
  String get adminEnableAllDevices;

  /// No description provided for @adminEnableAllChannels.
  ///
  /// In en, this message translates to:
  /// **'Enable access to all channels'**
  String get adminEnableAllChannels;

  /// No description provided for @adminResetPasswordWarning.
  ///
  /// In en, this message translates to:
  /// **'This will remove the password. The user will be able to log in without a password.'**
  String get adminResetPasswordWarning;

  /// No description provided for @adminServerReturnedHttp.
  ///
  /// In en, this message translates to:
  /// **'Server returned HTTP {status}'**
  String adminServerReturnedHttp(int status);

  /// No description provided for @adminDeleteUserConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {name}?'**
  String adminDeleteUserConfirm(String name);

  /// No description provided for @adminUserDeleted.
  ///
  /// In en, this message translates to:
  /// **'User \"{name}\" deleted'**
  String adminUserDeleted(String name);

  /// No description provided for @adminUserDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete user: {error}'**
  String adminUserDeleteFailed(String error);

  /// No description provided for @adminCreateApiKey.
  ///
  /// In en, this message translates to:
  /// **'Create API Key'**
  String get adminCreateApiKey;

  /// No description provided for @adminAppName.
  ///
  /// In en, this message translates to:
  /// **'App name'**
  String get adminAppName;

  /// No description provided for @adminApiKeyCreated.
  ///
  /// In en, this message translates to:
  /// **'API Key Created'**
  String get adminApiKeyCreated;

  /// No description provided for @adminApiKeyCreatedNoToken.
  ///
  /// In en, this message translates to:
  /// **'Key created successfully. The server did not return the token. Check server API keys.'**
  String get adminApiKeyCreatedNoToken;

  /// No description provided for @adminKeyCopied.
  ///
  /// In en, this message translates to:
  /// **'Key copied to clipboard'**
  String get adminKeyCopied;

  /// No description provided for @adminApiKeyCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create key: {error}'**
  String adminApiKeyCreateFailed(String error);

  /// No description provided for @adminKeyTokenMissing.
  ///
  /// In en, this message translates to:
  /// **'Key token missing from server response'**
  String get adminKeyTokenMissing;

  /// No description provided for @adminRevokeApiKey.
  ///
  /// In en, this message translates to:
  /// **'Revoke API Key'**
  String get adminRevokeApiKey;

  /// No description provided for @adminRevokeKeyConfirm.
  ///
  /// In en, this message translates to:
  /// **'Revoke key for {name}?'**
  String adminRevokeKeyConfirm(String name);

  /// No description provided for @adminApiKeyRevoked.
  ///
  /// In en, this message translates to:
  /// **'API key revoked'**
  String get adminApiKeyRevoked;

  /// No description provided for @adminApiKeyRevokeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to revoke key: {error}'**
  String adminApiKeyRevokeFailed(String error);

  /// No description provided for @adminApiKeysLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load API keys'**
  String get adminApiKeysLoadFailed;

  /// No description provided for @adminApiKeysTitle.
  ///
  /// In en, this message translates to:
  /// **'API Keys'**
  String get adminApiKeysTitle;

  /// No description provided for @adminCreateKey.
  ///
  /// In en, this message translates to:
  /// **'Create Key'**
  String get adminCreateKey;

  /// No description provided for @adminNoApiKeys.
  ///
  /// In en, this message translates to:
  /// **'No API keys found'**
  String get adminNoApiKeys;

  /// No description provided for @adminUnknownApp.
  ///
  /// In en, this message translates to:
  /// **'Unknown App'**
  String get adminUnknownApp;

  /// No description provided for @adminApiKeyTokenCreated.
  ///
  /// In en, this message translates to:
  /// **'Token: {token}\\nCreated: {created}'**
  String adminApiKeyTokenCreated(String token, String created);

  /// No description provided for @adminCreatingBackup.
  ///
  /// In en, this message translates to:
  /// **'Creating backup...'**
  String get adminCreatingBackup;

  /// No description provided for @adminBackupCreated.
  ///
  /// In en, this message translates to:
  /// **'Backup created successfully'**
  String get adminBackupCreated;

  /// No description provided for @adminBackupCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create backup: {error}'**
  String adminBackupCreateFailed(String error);

  /// No description provided for @adminBackupPathMissing.
  ///
  /// In en, this message translates to:
  /// **'Backup path missing in server response'**
  String get adminBackupPathMissing;

  /// No description provided for @adminBackupManifest.
  ///
  /// In en, this message translates to:
  /// **'Manifest: {name}'**
  String adminBackupManifest(String name);

  /// No description provided for @adminManifestLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load manifest: {error}'**
  String adminManifestLoadFailed(String error);

  /// No description provided for @adminConfirmRestore.
  ///
  /// In en, this message translates to:
  /// **'Confirm Restore'**
  String get adminConfirmRestore;

  /// No description provided for @adminRestoringBackup.
  ///
  /// In en, this message translates to:
  /// **'Restoring backup...'**
  String get adminRestoringBackup;

  /// No description provided for @adminRestoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to restore backup: {error}'**
  String adminRestoreFailed(String error);

  /// No description provided for @adminBackupsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load backups'**
  String get adminBackupsLoadFailed;

  /// No description provided for @adminCreateBackup.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get adminCreateBackup;

  /// No description provided for @adminNoBackups.
  ///
  /// In en, this message translates to:
  /// **'No backups found'**
  String get adminNoBackups;

  /// No description provided for @adminViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get adminViewDetails;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @adminLogsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load server logs'**
  String get adminLogsLoadFailed;

  /// No description provided for @adminNoLogFiles.
  ///
  /// In en, this message translates to:
  /// **'No log files found'**
  String get adminNoLogFiles;

  /// No description provided for @adminLogCopied.
  ///
  /// In en, this message translates to:
  /// **'Log copied to clipboard'**
  String get adminLogCopied;

  /// No description provided for @adminSaveLogFile.
  ///
  /// In en, this message translates to:
  /// **'Save log file'**
  String get adminSaveLogFile;

  /// No description provided for @adminSavedTo.
  ///
  /// In en, this message translates to:
  /// **'Saved to {path}'**
  String adminSavedTo(String path);

  /// No description provided for @adminFileSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save file: {error}'**
  String adminFileSaveFailed(String error);

  /// No description provided for @adminLogFileLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load {fileName}'**
  String adminLogFileLoadFailed(String fileName);

  /// No description provided for @adminSearchInLog.
  ///
  /// In en, this message translates to:
  /// **'Search in log'**
  String get adminSearchInLog;

  /// No description provided for @adminNoMatchingLines.
  ///
  /// In en, this message translates to:
  /// **'No matching lines'**
  String get adminNoMatchingLines;

  /// No description provided for @adminTasksLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load tasks: {error}'**
  String adminTasksLoadFailed(String error);

  /// No description provided for @adminNoScheduledTasks.
  ///
  /// In en, this message translates to:
  /// **'No scheduled tasks found'**
  String get adminNoScheduledTasks;

  /// No description provided for @adminNoTasksMatchFilter.
  ///
  /// In en, this message translates to:
  /// **'No tasks match the current filter'**
  String get adminNoTasksMatchFilter;

  /// No description provided for @adminTaskStartFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to start task: {error}'**
  String adminTaskStartFailed(String error);

  /// No description provided for @adminTaskStopFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to stop task: {error}'**
  String adminTaskStopFailed(String error);

  /// No description provided for @adminTaskLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load task: {error}'**
  String adminTaskLoadFailed(String error);

  /// No description provided for @adminRunNow.
  ///
  /// In en, this message translates to:
  /// **'Run Now'**
  String get adminRunNow;

  /// No description provided for @adminTriggerRemoveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove trigger: {error}'**
  String adminTriggerRemoveFailed(String error);

  /// No description provided for @adminTriggerAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add trigger: {error}'**
  String adminTriggerAddFailed(String error);

  /// No description provided for @adminLastExecution.
  ///
  /// In en, this message translates to:
  /// **'Last Execution'**
  String get adminLastExecution;

  /// No description provided for @adminTriggers.
  ///
  /// In en, this message translates to:
  /// **'Triggers'**
  String get adminTriggers;

  /// No description provided for @adminAddTrigger.
  ///
  /// In en, this message translates to:
  /// **'Add Trigger'**
  String get adminAddTrigger;

  /// No description provided for @adminNoTriggers.
  ///
  /// In en, this message translates to:
  /// **'No triggers configured'**
  String get adminNoTriggers;

  /// No description provided for @adminTriggerType.
  ///
  /// In en, this message translates to:
  /// **'Trigger Type'**
  String get adminTriggerType;

  /// No description provided for @adminTimeLimit.
  ///
  /// In en, this message translates to:
  /// **'Time limit (optional)'**
  String get adminTimeLimit;

  /// No description provided for @adminNoLimit.
  ///
  /// In en, this message translates to:
  /// **'No limit'**
  String get adminNoLimit;

  /// No description provided for @adminHours.
  ///
  /// In en, this message translates to:
  /// **'{hours} hour(s)'**
  String adminHours(String hours);

  /// No description provided for @adminDayOfWeek.
  ///
  /// In en, this message translates to:
  /// **'Day of week'**
  String get adminDayOfWeek;

  /// No description provided for @adminSearchPlugins.
  ///
  /// In en, this message translates to:
  /// **'Search plugins...'**
  String get adminSearchPlugins;

  /// No description provided for @adminPluginToggleFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to toggle plugin: {error}'**
  String adminPluginToggleFailed(String error);

  /// No description provided for @adminUninstallPlugin.
  ///
  /// In en, this message translates to:
  /// **'Uninstall Plugin'**
  String get adminUninstallPlugin;

  /// No description provided for @adminUninstallPluginConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to uninstall \"{name}\"?'**
  String adminUninstallPluginConfirm(String name);

  /// No description provided for @adminPluginUninstallFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to uninstall plugin: {error}'**
  String adminPluginUninstallFailed(String error);

  /// No description provided for @adminPackageInstallFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to install package: {error}'**
  String adminPackageInstallFailed(String error);

  /// No description provided for @adminPluginUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to install update: {error}'**
  String adminPluginUpdateFailed(String error);

  /// No description provided for @adminPluginsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load plugins: {error}'**
  String adminPluginsLoadFailed(String error);

  /// No description provided for @adminNoPluginsMatchSearch.
  ///
  /// In en, this message translates to:
  /// **'No plugins match your search'**
  String get adminNoPluginsMatchSearch;

  /// No description provided for @adminNoPluginsInstalled.
  ///
  /// In en, this message translates to:
  /// **'No plugins installed'**
  String get adminNoPluginsInstalled;

  /// No description provided for @adminInstallUpdate.
  ///
  /// In en, this message translates to:
  /// **'Install update (v{version})'**
  String adminInstallUpdate(String version);

  /// No description provided for @adminCatalogLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load catalog: {error}'**
  String adminCatalogLoadFailed(String error);

  /// No description provided for @adminNoPackagesMatchSearch.
  ///
  /// In en, this message translates to:
  /// **'No packages match your search'**
  String get adminNoPackagesMatchSearch;

  /// No description provided for @adminNoPackagesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No packages available'**
  String get adminNoPackagesAvailable;

  /// No description provided for @adminExperimentalIntegration.
  ///
  /// In en, this message translates to:
  /// **'Experimental Integration'**
  String get adminExperimentalIntegration;

  /// No description provided for @adminExperimentalWarning.
  ///
  /// In en, this message translates to:
  /// **'Plugin settings integration is still experimental. Some settings pages may not render correctly.'**
  String get adminExperimentalWarning;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @adminPluginRemoveAfterRestart.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" will be removed after server restart'**
  String adminPluginRemoveAfterRestart(String name);

  /// No description provided for @adminUninstallFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to uninstall: {error}'**
  String adminUninstallFailed(String error);

  /// No description provided for @adminPluginUpdating.
  ///
  /// In en, this message translates to:
  /// **'Updating \"{name}\" to v{version}...'**
  String adminPluginUpdating(String name, String version);

  /// No description provided for @adminMissingAuthToken.
  ///
  /// In en, this message translates to:
  /// **'Unable to open settings: missing auth token.'**
  String get adminMissingAuthToken;

  /// No description provided for @adminPluginLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load plugin: {error}'**
  String adminPluginLoadFailed(String error);

  /// No description provided for @adminPluginNotFound.
  ///
  /// In en, this message translates to:
  /// **'Plugin not found'**
  String get adminPluginNotFound;

  /// No description provided for @adminPluginVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String adminPluginVersion(String version);

  /// No description provided for @adminEnablePlugin.
  ///
  /// In en, this message translates to:
  /// **'Enable Plugin'**
  String get adminEnablePlugin;

  /// No description provided for @adminPluginSettingsPage.
  ///
  /// In en, this message translates to:
  /// **'Plugin settings page'**
  String get adminPluginSettingsPage;

  /// No description provided for @adminRevisionHistory.
  ///
  /// In en, this message translates to:
  /// **'Revision History'**
  String get adminRevisionHistory;

  /// No description provided for @adminNoChangelog.
  ///
  /// In en, this message translates to:
  /// **'No changelog available.'**
  String get adminNoChangelog;

  /// No description provided for @adminRemoveRepository.
  ///
  /// In en, this message translates to:
  /// **'Remove Repository'**
  String get adminRemoveRepository;

  /// No description provided for @adminRemoveRepositoryConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove \"{name}\"?'**
  String adminRemoveRepositoryConfirm(String name);

  /// No description provided for @adminRepositoriesSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save repositories: {error}'**
  String adminRepositoriesSaveFailed(String error);

  /// No description provided for @adminRepositoriesLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load repositories: {error}'**
  String adminRepositoriesLoadFailed(String error);

  /// No description provided for @adminRepositoryNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Jellyfin Stable'**
  String get adminRepositoryNameHint;

  /// No description provided for @adminRepositoryUrl.
  ///
  /// In en, this message translates to:
  /// **'Repository URL'**
  String get adminRepositoryUrl;

  /// No description provided for @adminAddEntry.
  ///
  /// In en, this message translates to:
  /// **'Add entry'**
  String get adminAddEntry;

  /// No description provided for @adminInvalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL'**
  String get adminInvalidUrl;

  /// No description provided for @adminPluginSettingsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to load plugin settings: {error}'**
  String adminPluginSettingsLoadFailed(String error);

  /// No description provided for @adminCouldNotOpenUrl.
  ///
  /// In en, this message translates to:
  /// **'Could not open {uri}'**
  String adminCouldNotOpenUrl(String uri);

  /// No description provided for @adminOpenInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in Browser'**
  String get adminOpenInBrowser;

  /// No description provided for @adminOpenExternally.
  ///
  /// In en, this message translates to:
  /// **'Open externally'**
  String get adminOpenExternally;

  /// No description provided for @adminGeneralSettings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get adminGeneralSettings;

  /// No description provided for @adminServerName.
  ///
  /// In en, this message translates to:
  /// **'Server name'**
  String get adminServerName;

  /// No description provided for @adminPreferredMetadataCountry.
  ///
  /// In en, this message translates to:
  /// **'Preferred metadata country'**
  String get adminPreferredMetadataCountry;

  /// No description provided for @adminCachePath.
  ///
  /// In en, this message translates to:
  /// **'Cache path'**
  String get adminCachePath;

  /// No description provided for @adminMetadataPath.
  ///
  /// In en, this message translates to:
  /// **'Metadata path'**
  String get adminMetadataPath;

  /// No description provided for @adminLibraryScanConcurrency.
  ///
  /// In en, this message translates to:
  /// **'Library scan concurrency'**
  String get adminLibraryScanConcurrency;

  /// No description provided for @adminParallelImageEncodingLimit.
  ///
  /// In en, this message translates to:
  /// **'Parallel image encoding limit'**
  String get adminParallelImageEncodingLimit;

  /// No description provided for @adminSlowResponseThreshold.
  ///
  /// In en, this message translates to:
  /// **'Slow response threshold (ms)'**
  String get adminSlowResponseThreshold;

  /// No description provided for @adminBrandingSaved.
  ///
  /// In en, this message translates to:
  /// **'Branding settings saved'**
  String get adminBrandingSaved;

  /// No description provided for @adminBrandingLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load branding settings'**
  String get adminBrandingLoadFailed;

  /// No description provided for @adminLoginDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Login disclaimer'**
  String get adminLoginDisclaimer;

  /// No description provided for @adminLoginDisclaimerHint.
  ///
  /// In en, this message translates to:
  /// **'HTML displayed below the login form'**
  String get adminLoginDisclaimerHint;

  /// No description provided for @adminCustomCss.
  ///
  /// In en, this message translates to:
  /// **'Custom CSS'**
  String get adminCustomCss;

  /// No description provided for @adminCustomCssHint.
  ///
  /// In en, this message translates to:
  /// **'Custom CSS applied to the web interface'**
  String get adminCustomCssHint;

  /// No description provided for @adminEnableSplashScreen.
  ///
  /// In en, this message translates to:
  /// **'Enable splash screen'**
  String get adminEnableSplashScreen;

  /// No description provided for @adminStreamingSaved.
  ///
  /// In en, this message translates to:
  /// **'Streaming settings saved'**
  String get adminStreamingSaved;

  /// No description provided for @adminStreamingLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load streaming settings'**
  String get adminStreamingLoadFailed;

  /// No description provided for @adminStreamingDescription.
  ///
  /// In en, this message translates to:
  /// **'Set global streaming bitrate limits for remote connections.'**
  String get adminStreamingDescription;

  /// No description provided for @adminRemoteBitrateLimitMbps.
  ///
  /// In en, this message translates to:
  /// **'Remote client bitrate limit (Mbps)'**
  String get adminRemoteBitrateLimitMbps;

  /// No description provided for @adminLeaveEmptyForUnlimited.
  ///
  /// In en, this message translates to:
  /// **'Leave empty or 0 for unlimited'**
  String get adminLeaveEmptyForUnlimited;

  /// No description provided for @adminPlaybackSaved.
  ///
  /// In en, this message translates to:
  /// **'Playback settings saved'**
  String get adminPlaybackSaved;

  /// No description provided for @adminPlaybackLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load playback settings'**
  String get adminPlaybackLoadFailed;

  /// No description provided for @adminPlaybackTranscoding.
  ///
  /// In en, this message translates to:
  /// **'Playback / Transcoding'**
  String get adminPlaybackTranscoding;

  /// No description provided for @adminHardwareAcceleration.
  ///
  /// In en, this message translates to:
  /// **'Hardware acceleration'**
  String get adminHardwareAcceleration;

  /// No description provided for @adminVaapiDevice.
  ///
  /// In en, this message translates to:
  /// **'VA-API device'**
  String get adminVaapiDevice;

  /// No description provided for @adminEnableHardwareEncoding.
  ///
  /// In en, this message translates to:
  /// **'Enable hardware encoding'**
  String get adminEnableHardwareEncoding;

  /// No description provided for @adminEnableHardwareDecoding.
  ///
  /// In en, this message translates to:
  /// **'Enable hardware decoding for:'**
  String get adminEnableHardwareDecoding;

  /// No description provided for @adminEncodingThreads.
  ///
  /// In en, this message translates to:
  /// **'Encoding threads'**
  String get adminEncodingThreads;

  /// No description provided for @adminAutomatic.
  ///
  /// In en, this message translates to:
  /// **'0 = automatic'**
  String get adminAutomatic;

  /// No description provided for @adminTranscodingTempPath.
  ///
  /// In en, this message translates to:
  /// **'Transcoding temp path'**
  String get adminTranscodingTempPath;

  /// No description provided for @adminEnableFallbackFont.
  ///
  /// In en, this message translates to:
  /// **'Enable fallback font'**
  String get adminEnableFallbackFont;

  /// No description provided for @adminFallbackFontPath.
  ///
  /// In en, this message translates to:
  /// **'Fallback font path'**
  String get adminFallbackFontPath;

  /// No description provided for @adminAllowSegmentDeletion.
  ///
  /// In en, this message translates to:
  /// **'Allow segment deletion'**
  String get adminAllowSegmentDeletion;

  /// No description provided for @adminSegmentKeepSeconds.
  ///
  /// In en, this message translates to:
  /// **'Segment keep (seconds)'**
  String get adminSegmentKeepSeconds;

  /// No description provided for @adminThrottleBuffering.
  ///
  /// In en, this message translates to:
  /// **'Throttle buffering'**
  String get adminThrottleBuffering;

  /// No description provided for @adminTrickplaySaved.
  ///
  /// In en, this message translates to:
  /// **'Trickplay settings saved'**
  String get adminTrickplaySaved;

  /// No description provided for @adminTrickplayLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load trickplay settings'**
  String get adminTrickplayLoadFailed;

  /// No description provided for @adminEnableHardwareAcceleration.
  ///
  /// In en, this message translates to:
  /// **'Enable hardware acceleration'**
  String get adminEnableHardwareAcceleration;

  /// No description provided for @adminEnableKeyFrameExtraction.
  ///
  /// In en, this message translates to:
  /// **'Enable key frame only extraction'**
  String get adminEnableKeyFrameExtraction;

  /// No description provided for @adminKeyFrameSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Faster but lower accuracy'**
  String get adminKeyFrameSubtitle;

  /// No description provided for @adminScanBehavior.
  ///
  /// In en, this message translates to:
  /// **'Scan behavior'**
  String get adminScanBehavior;

  /// No description provided for @adminProcessPriority.
  ///
  /// In en, this message translates to:
  /// **'Process priority'**
  String get adminProcessPriority;

  /// No description provided for @adminImageSettings.
  ///
  /// In en, this message translates to:
  /// **'Image Settings'**
  String get adminImageSettings;

  /// No description provided for @adminIntervalMs.
  ///
  /// In en, this message translates to:
  /// **'Interval (ms)'**
  String get adminIntervalMs;

  /// No description provided for @adminCaptureFrameSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How often to capture frames'**
  String get adminCaptureFrameSubtitle;

  /// No description provided for @adminWidthResolutions.
  ///
  /// In en, this message translates to:
  /// **'Width resolutions'**
  String get adminWidthResolutions;

  /// No description provided for @adminTileWidth.
  ///
  /// In en, this message translates to:
  /// **'Tile width'**
  String get adminTileWidth;

  /// No description provided for @adminTileHeight.
  ///
  /// In en, this message translates to:
  /// **'Tile height'**
  String get adminTileHeight;

  /// No description provided for @adminQualitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lower values = better quality, larger files'**
  String get adminQualitySubtitle;

  /// No description provided for @adminProcessThreads.
  ///
  /// In en, this message translates to:
  /// **'Process threads'**
  String get adminProcessThreads;

  /// No description provided for @adminResumeSaved.
  ///
  /// In en, this message translates to:
  /// **'Resume settings saved'**
  String get adminResumeSaved;

  /// No description provided for @adminResumeLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load resume settings'**
  String get adminResumeLoadFailed;

  /// No description provided for @adminResumeDescription.
  ///
  /// In en, this message translates to:
  /// **'Configure when content should be marked as partially played or fully played.'**
  String get adminResumeDescription;

  /// No description provided for @adminMinResumePercentage.
  ///
  /// In en, this message translates to:
  /// **'Minimum resume percentage'**
  String get adminMinResumePercentage;

  /// No description provided for @adminMinResumeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Content must be played past this percentage to save progress'**
  String get adminMinResumeSubtitle;

  /// No description provided for @adminMaxResumePercentage.
  ///
  /// In en, this message translates to:
  /// **'Maximum resume percentage'**
  String get adminMaxResumePercentage;

  /// No description provided for @adminMaxResumeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Content is considered fully played after this percentage'**
  String get adminMaxResumeSubtitle;

  /// No description provided for @adminMinResumeDuration.
  ///
  /// In en, this message translates to:
  /// **'Minimum resume duration (seconds)'**
  String get adminMinResumeDuration;

  /// No description provided for @adminMinResumeDurationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Items shorter than this are not resumable'**
  String get adminMinResumeDurationSubtitle;

  /// No description provided for @adminMinAudiobookResume.
  ///
  /// In en, this message translates to:
  /// **'Minimum audiobook resume percentage'**
  String get adminMinAudiobookResume;

  /// No description provided for @adminMaxAudiobookResume.
  ///
  /// In en, this message translates to:
  /// **'Maximum audiobook resume percentage'**
  String get adminMaxAudiobookResume;

  /// No description provided for @adminNetworkingSaved.
  ///
  /// In en, this message translates to:
  /// **'Networking settings saved. A server restart may be required.'**
  String get adminNetworkingSaved;

  /// No description provided for @adminNetworkingLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load networking settings'**
  String get adminNetworkingLoadFailed;

  /// No description provided for @adminNetworkingWarning.
  ///
  /// In en, this message translates to:
  /// **'Changes to networking settings may require a server restart.'**
  String get adminNetworkingWarning;

  /// No description provided for @adminEnableRemoteAccess.
  ///
  /// In en, this message translates to:
  /// **'Enable remote access'**
  String get adminEnableRemoteAccess;

  /// No description provided for @ports.
  ///
  /// In en, this message translates to:
  /// **'Ports'**
  String get ports;

  /// No description provided for @adminHttpPort.
  ///
  /// In en, this message translates to:
  /// **'HTTP port'**
  String get adminHttpPort;

  /// No description provided for @adminHttpsPort.
  ///
  /// In en, this message translates to:
  /// **'HTTPS port'**
  String get adminHttpsPort;

  /// No description provided for @adminPublicHttpsPort.
  ///
  /// In en, this message translates to:
  /// **'Public HTTPS port'**
  String get adminPublicHttpsPort;

  /// No description provided for @adminBaseUrl.
  ///
  /// In en, this message translates to:
  /// **'Base URL'**
  String get adminBaseUrl;

  /// No description provided for @adminBaseUrlHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. /jellyfin'**
  String get adminBaseUrlHint;

  /// No description provided for @https.
  ///
  /// In en, this message translates to:
  /// **'HTTPS'**
  String get https;

  /// No description provided for @adminEnableHttps.
  ///
  /// In en, this message translates to:
  /// **'Enable HTTPS'**
  String get adminEnableHttps;

  /// No description provided for @adminLocalNetwork.
  ///
  /// In en, this message translates to:
  /// **'Local Network'**
  String get adminLocalNetwork;

  /// No description provided for @adminLocalNetworkAddresses.
  ///
  /// In en, this message translates to:
  /// **'Local network addresses'**
  String get adminLocalNetworkAddresses;

  /// No description provided for @adminKnownProxies.
  ///
  /// In en, this message translates to:
  /// **'Known proxies'**
  String get adminKnownProxies;

  /// No description provided for @adminRemoteIpFilter.
  ///
  /// In en, this message translates to:
  /// **'Remote IP Filter'**
  String get adminRemoteIpFilter;

  /// No description provided for @adminRemoteIpFilterEntries.
  ///
  /// In en, this message translates to:
  /// **'Remote IP filter'**
  String get adminRemoteIpFilterEntries;

  /// No description provided for @adminCertificatePath.
  ///
  /// In en, this message translates to:
  /// **'Certificate path'**
  String get adminCertificatePath;

  /// No description provided for @whitelist.
  ///
  /// In en, this message translates to:
  /// **'Whitelist'**
  String get whitelist;

  /// No description provided for @blacklist.
  ///
  /// In en, this message translates to:
  /// **'Blacklist'**
  String get blacklist;

  /// No description provided for @notSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// No description provided for @adminMetadataSaved.
  ///
  /// In en, this message translates to:
  /// **'Metadata saved'**
  String get adminMetadataSaved;

  /// No description provided for @adminMetadataLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load metadata: {error}'**
  String adminMetadataLoadFailed(String error);

  /// No description provided for @adminMetadataSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save metadata: {error}'**
  String adminMetadataSaveFailed(String error);

  /// No description provided for @adminRefreshMetadata.
  ///
  /// In en, this message translates to:
  /// **'Refresh Metadata'**
  String get adminRefreshMetadata;

  /// No description provided for @recursive.
  ///
  /// In en, this message translates to:
  /// **'Recursive'**
  String get recursive;

  /// No description provided for @adminReplaceAllMetadata.
  ///
  /// In en, this message translates to:
  /// **'Replace all metadata'**
  String get adminReplaceAllMetadata;

  /// No description provided for @adminReplaceAllImages.
  ///
  /// In en, this message translates to:
  /// **'Replace all images'**
  String get adminReplaceAllImages;

  /// No description provided for @adminMetadataRefreshRequested.
  ///
  /// In en, this message translates to:
  /// **'Metadata refresh requested'**
  String get adminMetadataRefreshRequested;

  /// No description provided for @adminMetadataRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to refresh metadata: {error}'**
  String adminMetadataRefreshFailed(String error);

  /// No description provided for @adminSearchRemotePerson.
  ///
  /// In en, this message translates to:
  /// **'Search Remote Person'**
  String get adminSearchRemotePerson;

  /// No description provided for @adminNoRemoteMatches.
  ///
  /// In en, this message translates to:
  /// **'No remote matches found'**
  String get adminNoRemoteMatches;

  /// No description provided for @adminRemoteResults.
  ///
  /// In en, this message translates to:
  /// **'Remote Results'**
  String get adminRemoteResults;

  /// No description provided for @adminRemoteMetadataApplied.
  ///
  /// In en, this message translates to:
  /// **'Remote metadata applied'**
  String get adminRemoteMetadataApplied;

  /// No description provided for @adminRemoteSearchFailed.
  ///
  /// In en, this message translates to:
  /// **'Remote search failed: {error}'**
  String adminRemoteSearchFailed(String error);

  /// No description provided for @adminUpdateContentType.
  ///
  /// In en, this message translates to:
  /// **'Update Content Type'**
  String get adminUpdateContentType;

  /// No description provided for @adminContentType.
  ///
  /// In en, this message translates to:
  /// **'Content type'**
  String get adminContentType;

  /// No description provided for @adminContentTypeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Content type updated'**
  String get adminContentTypeUpdated;

  /// No description provided for @adminContentTypeUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update content type: {error}'**
  String adminContentTypeUpdateFailed(String error);

  /// No description provided for @adminMetadataEditorLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load metadata editor'**
  String get adminMetadataEditorLoadFailed;

  /// No description provided for @adminNoPeopleEntries.
  ///
  /// In en, this message translates to:
  /// **'No people entries'**
  String get adminNoPeopleEntries;

  /// No description provided for @adminNoExternalIds.
  ///
  /// In en, this message translates to:
  /// **'No external IDs available'**
  String get adminNoExternalIds;

  /// No description provided for @adminImageUpdated.
  ///
  /// In en, this message translates to:
  /// **'{imageType} image updated'**
  String adminImageUpdated(String imageType);

  /// No description provided for @adminImageDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to download image: {error}'**
  String adminImageDownloadFailed(String error);

  /// No description provided for @adminUnsupportedImageFormat.
  ///
  /// In en, this message translates to:
  /// **'Unsupported image format'**
  String get adminUnsupportedImageFormat;

  /// No description provided for @adminImageReadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to read selected image'**
  String get adminImageReadFailed;

  /// No description provided for @adminImageUploaded.
  ///
  /// In en, this message translates to:
  /// **'{imageType} image uploaded'**
  String adminImageUploaded(String imageType);

  /// No description provided for @adminImageUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload image: {error}'**
  String adminImageUploadFailed(String error);

  /// No description provided for @adminDeleteImage.
  ///
  /// In en, this message translates to:
  /// **'Delete {imageType} image'**
  String adminDeleteImage(String imageType);

  /// No description provided for @adminImageDeleted.
  ///
  /// In en, this message translates to:
  /// **'{imageType} image deleted'**
  String adminImageDeleted(String imageType);

  /// No description provided for @adminImageDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete image: {error}'**
  String adminImageDeleteFailed(String error);

  /// No description provided for @adminAllProviders.
  ///
  /// In en, this message translates to:
  /// **'All providers'**
  String get adminAllProviders;

  /// No description provided for @adminNoRemoteImages.
  ///
  /// In en, this message translates to:
  /// **'No remote images found'**
  String get adminNoRemoteImages;

  /// No description provided for @adminTunerDiscoveryFailed.
  ///
  /// In en, this message translates to:
  /// **'Tuner discovery failed: {error}'**
  String adminTunerDiscoveryFailed(String error);

  /// No description provided for @adminAddTuner.
  ///
  /// In en, this message translates to:
  /// **'Add Tuner'**
  String get adminAddTuner;

  /// No description provided for @adminTunerType.
  ///
  /// In en, this message translates to:
  /// **'Tuner Type'**
  String get adminTunerType;

  /// No description provided for @adminTunerTypeHint.
  ///
  /// In en, this message translates to:
  /// **'HDHomeRun, M3U, Other'**
  String get adminTunerTypeHint;

  /// No description provided for @adminUrlPath.
  ///
  /// In en, this message translates to:
  /// **'URL / Path'**
  String get adminUrlPath;

  /// No description provided for @adminNameOptional.
  ///
  /// In en, this message translates to:
  /// **'Name (optional)'**
  String get adminNameOptional;

  /// No description provided for @adminTunerAdded.
  ///
  /// In en, this message translates to:
  /// **'Tuner added'**
  String get adminTunerAdded;

  /// No description provided for @adminTunerAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add tuner: {error}'**
  String adminTunerAddFailed(String error);

  /// No description provided for @adminAddGuideProvider.
  ///
  /// In en, this message translates to:
  /// **'Add Guide Provider'**
  String get adminAddGuideProvider;

  /// No description provided for @adminProviderType.
  ///
  /// In en, this message translates to:
  /// **'Provider Type'**
  String get adminProviderType;

  /// No description provided for @adminProviderTypeHint.
  ///
  /// In en, this message translates to:
  /// **'SchedulesDirect or XMLTV'**
  String get adminProviderTypeHint;

  /// No description provided for @adminUsernameOptional.
  ///
  /// In en, this message translates to:
  /// **'Username (optional)'**
  String get adminUsernameOptional;

  /// No description provided for @adminRefreshInterval.
  ///
  /// In en, this message translates to:
  /// **'Refresh interval (hours)'**
  String get adminRefreshInterval;

  /// No description provided for @adminProviderAdded.
  ///
  /// In en, this message translates to:
  /// **'Provider added'**
  String get adminProviderAdded;

  /// No description provided for @adminProviderAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add provider: {error}'**
  String adminProviderAddFailed(String error);

  /// No description provided for @adminTunerRemoveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove tuner: {error}'**
  String adminTunerRemoveFailed(String error);

  /// No description provided for @adminTunerResetRequested.
  ///
  /// In en, this message translates to:
  /// **'Tuner reset requested'**
  String get adminTunerResetRequested;

  /// No description provided for @adminTunerResetFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to reset tuner: {error}'**
  String adminTunerResetFailed(String error);

  /// No description provided for @adminProviderRemoveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove provider: {error}'**
  String adminProviderRemoveFailed(String error);

  /// No description provided for @adminRecordingSettings.
  ///
  /// In en, this message translates to:
  /// **'Recording Settings'**
  String get adminRecordingSettings;

  /// No description provided for @adminPrePadding.
  ///
  /// In en, this message translates to:
  /// **'Pre-padding (minutes)'**
  String get adminPrePadding;

  /// No description provided for @adminPostPadding.
  ///
  /// In en, this message translates to:
  /// **'Post-padding (minutes)'**
  String get adminPostPadding;

  /// No description provided for @adminRecordingPath.
  ///
  /// In en, this message translates to:
  /// **'Recording path'**
  String get adminRecordingPath;

  /// No description provided for @adminSeriesRecordingPath.
  ///
  /// In en, this message translates to:
  /// **'Series recording path'**
  String get adminSeriesRecordingPath;

  /// No description provided for @adminRecordingSettingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Recording settings saved'**
  String get adminRecordingSettingsSaved;

  /// No description provided for @adminSettingsSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save settings: {error}'**
  String adminSettingsSaveFailed(String error);

  /// No description provided for @adminSetChannelMappings.
  ///
  /// In en, this message translates to:
  /// **'Set Channel Mappings'**
  String get adminSetChannelMappings;

  /// No description provided for @adminMappingJson.
  ///
  /// In en, this message translates to:
  /// **'Mapping JSON'**
  String get adminMappingJson;

  /// No description provided for @adminMappingJsonHint.
  ///
  /// In en, this message translates to:
  /// **'Example: mappings JSON payload'**
  String get adminMappingJsonHint;

  /// No description provided for @adminChannelMappingsUpdated.
  ///
  /// In en, this message translates to:
  /// **'Channel mappings updated'**
  String get adminChannelMappingsUpdated;

  /// No description provided for @adminMappingsUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update mappings: {error}'**
  String adminMappingsUpdateFailed(String error);

  /// No description provided for @adminLiveTvLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load Live TV administration'**
  String get adminLiveTvLoadFailed;

  /// No description provided for @adminTunerDevices.
  ///
  /// In en, this message translates to:
  /// **'Tuner Devices'**
  String get adminTunerDevices;

  /// No description provided for @adminNoTunerHosts.
  ///
  /// In en, this message translates to:
  /// **'No tuner hosts configured'**
  String get adminNoTunerHosts;

  /// No description provided for @adminGuideProviders.
  ///
  /// In en, this message translates to:
  /// **'Guide Providers'**
  String get adminGuideProviders;

  /// No description provided for @adminAddProvider.
  ///
  /// In en, this message translates to:
  /// **'Add Provider'**
  String get adminAddProvider;

  /// No description provided for @adminNoListingProviders.
  ///
  /// In en, this message translates to:
  /// **'No listing providers configured'**
  String get adminNoListingProviders;

  /// No description provided for @adminRecordingPathDisplay.
  ///
  /// In en, this message translates to:
  /// **'Recording path: {path}'**
  String adminRecordingPathDisplay(String path);

  /// No description provided for @adminSeriesPathDisplay.
  ///
  /// In en, this message translates to:
  /// **'Series path: {path}'**
  String adminSeriesPathDisplay(String path);

  /// No description provided for @adminPrePaddingDisplay.
  ///
  /// In en, this message translates to:
  /// **'Pre-padding: {minutes} min'**
  String adminPrePaddingDisplay(int minutes);

  /// No description provided for @adminPostPaddingDisplay.
  ///
  /// In en, this message translates to:
  /// **'Post-padding: {minutes} min'**
  String adminPostPaddingDisplay(int minutes);

  /// No description provided for @adminTunerDiscovery.
  ///
  /// In en, this message translates to:
  /// **'Tuner Discovery'**
  String get adminTunerDiscovery;

  /// No description provided for @adminChannelMappings.
  ///
  /// In en, this message translates to:
  /// **'Channel Mappings'**
  String get adminChannelMappings;

  /// No description provided for @adminNoDiscoveredTuners.
  ///
  /// In en, this message translates to:
  /// **'No discovered tuners yet'**
  String get adminNoDiscoveredTuners;

  /// No description provided for @adminSettingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get adminSettingsSaved;

  /// No description provided for @adminBackupsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Backups are not available on this server build.'**
  String get adminBackupsNotAvailable;

  /// No description provided for @adminRestoreWarning1.
  ///
  /// In en, this message translates to:
  /// **'Restoring will replace ALL current server data with the backup data.'**
  String get adminRestoreWarning1;

  /// No description provided for @adminRestoreWarning2.
  ///
  /// In en, this message translates to:
  /// **'Current server settings, users, and library data will be overwritten.'**
  String get adminRestoreWarning2;

  /// No description provided for @adminRestoreWarning3.
  ///
  /// In en, this message translates to:
  /// **'The server will restart after restoration.'**
  String get adminRestoreWarning3;

  /// No description provided for @adminRestoreConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Restore backup {name} now?'**
  String adminRestoreConfirmMessage(String name);

  /// No description provided for @adminRestoreRequested.
  ///
  /// In en, this message translates to:
  /// **'Restore requested. Server restart may disconnect this session.'**
  String get adminRestoreRequested;

  /// No description provided for @adminBackupsTitle.
  ///
  /// In en, this message translates to:
  /// **'Backups'**
  String get adminBackupsTitle;

  /// No description provided for @adminUnknownDate.
  ///
  /// In en, this message translates to:
  /// **'Unknown date'**
  String get adminUnknownDate;

  /// No description provided for @adminUnnamedBackup.
  ///
  /// In en, this message translates to:
  /// **'Unnamed Backup'**
  String get adminUnnamedBackup;

  /// No description provided for @adminLiveTvNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Live TV administration is not available on this server build.'**
  String get adminLiveTvNotAvailable;

  /// No description provided for @adminLiveTvTitle.
  ///
  /// In en, this message translates to:
  /// **'Live TV Administration'**
  String get adminLiveTvTitle;

  /// No description provided for @adminApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get adminApply;

  /// No description provided for @adminNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get adminNotSet;

  /// No description provided for @adminReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get adminReset;

  /// No description provided for @adminLogsTitle.
  ///
  /// In en, this message translates to:
  /// **'Server Logs'**
  String get adminLogsTitle;

  /// No description provided for @adminLogsNewestFirst.
  ///
  /// In en, this message translates to:
  /// **'Newest First'**
  String get adminLogsNewestFirst;

  /// No description provided for @adminLogsOldestFirst.
  ///
  /// In en, this message translates to:
  /// **'Oldest First'**
  String get adminLogsOldestFirst;

  /// No description provided for @adminLogsJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get adminLogsJustNow;

  /// No description provided for @adminLogsMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String adminLogsMinutesAgo(int minutes);

  /// No description provided for @adminLogsHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String adminLogsHoursAgo(int hours);

  /// No description provided for @adminLogsDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String adminLogsDaysAgo(int days);

  /// No description provided for @adminLogViewerLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load {fileName}'**
  String adminLogViewerLoadFailed(String fileName);

  /// No description provided for @adminLogViewerMatches.
  ///
  /// In en, this message translates to:
  /// **'{count} matches'**
  String adminLogViewerMatches(int count);

  /// No description provided for @adminLogViewerNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No matching lines'**
  String get adminLogViewerNoMatches;

  /// No description provided for @adminMetadataEditorTitle.
  ///
  /// In en, this message translates to:
  /// **'Metadata Editor'**
  String get adminMetadataEditorTitle;

  /// No description provided for @adminMetadataRemote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get adminMetadataRemote;

  /// No description provided for @adminMetadataType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get adminMetadataType;

  /// No description provided for @adminMetadataDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get adminMetadataDetails;

  /// No description provided for @adminMetadataExternalIds.
  ///
  /// In en, this message translates to:
  /// **'External IDs'**
  String get adminMetadataExternalIds;

  /// No description provided for @adminMetadataImages.
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get adminMetadataImages;

  /// No description provided for @adminMetadataFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get adminMetadataFieldTitle;

  /// No description provided for @adminMetadataFieldSortTitle.
  ///
  /// In en, this message translates to:
  /// **'Sort title'**
  String get adminMetadataFieldSortTitle;

  /// No description provided for @adminMetadataFieldOriginalTitle.
  ///
  /// In en, this message translates to:
  /// **'Original title'**
  String get adminMetadataFieldOriginalTitle;

  /// No description provided for @adminMetadataFieldPremiereDate.
  ///
  /// In en, this message translates to:
  /// **'Premiere date (YYYY-MM-DD)'**
  String get adminMetadataFieldPremiereDate;

  /// No description provided for @adminMetadataFieldEndDate.
  ///
  /// In en, this message translates to:
  /// **'End date (YYYY-MM-DD)'**
  String get adminMetadataFieldEndDate;

  /// No description provided for @adminMetadataFieldProductionYear.
  ///
  /// In en, this message translates to:
  /// **'Production year'**
  String get adminMetadataFieldProductionYear;

  /// No description provided for @adminMetadataFieldOfficialRating.
  ///
  /// In en, this message translates to:
  /// **'Official rating'**
  String get adminMetadataFieldOfficialRating;

  /// No description provided for @adminMetadataFieldCommunityRating.
  ///
  /// In en, this message translates to:
  /// **'Community rating'**
  String get adminMetadataFieldCommunityRating;

  /// No description provided for @adminMetadataFieldCriticRating.
  ///
  /// In en, this message translates to:
  /// **'Critic rating'**
  String get adminMetadataFieldCriticRating;

  /// No description provided for @adminMetadataFieldTagline.
  ///
  /// In en, this message translates to:
  /// **'Tagline'**
  String get adminMetadataFieldTagline;

  /// No description provided for @adminMetadataFieldOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get adminMetadataFieldOverview;

  /// No description provided for @adminMetadataGenres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get adminMetadataGenres;

  /// No description provided for @adminMetadataTags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get adminMetadataTags;

  /// No description provided for @adminMetadataStudios.
  ///
  /// In en, this message translates to:
  /// **'Studios'**
  String get adminMetadataStudios;

  /// No description provided for @adminMetadataPeople.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get adminMetadataPeople;

  /// No description provided for @adminMetadataAddGenre.
  ///
  /// In en, this message translates to:
  /// **'Add genre'**
  String get adminMetadataAddGenre;

  /// No description provided for @adminMetadataAddTag.
  ///
  /// In en, this message translates to:
  /// **'Add tag'**
  String get adminMetadataAddTag;

  /// No description provided for @adminMetadataAddStudio.
  ///
  /// In en, this message translates to:
  /// **'Add studio'**
  String get adminMetadataAddStudio;

  /// No description provided for @adminMetadataAddPerson.
  ///
  /// In en, this message translates to:
  /// **'Add Person'**
  String get adminMetadataAddPerson;

  /// No description provided for @adminMetadataEditPerson.
  ///
  /// In en, this message translates to:
  /// **'Edit Person'**
  String get adminMetadataEditPerson;

  /// No description provided for @adminMetadataRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get adminMetadataRole;

  /// No description provided for @adminMetadataImagePrimary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get adminMetadataImagePrimary;

  /// No description provided for @adminMetadataImageBackdrop.
  ///
  /// In en, this message translates to:
  /// **'Backdrop'**
  String get adminMetadataImageBackdrop;

  /// No description provided for @adminMetadataImageLogo.
  ///
  /// In en, this message translates to:
  /// **'Logo'**
  String get adminMetadataImageLogo;

  /// No description provided for @adminMetadataImageBanner.
  ///
  /// In en, this message translates to:
  /// **'Banner'**
  String get adminMetadataImageBanner;

  /// No description provided for @adminMetadataImageThumb.
  ///
  /// In en, this message translates to:
  /// **'Thumb'**
  String get adminMetadataImageThumb;

  /// No description provided for @adminMetadataRecursive.
  ///
  /// In en, this message translates to:
  /// **'Recursive'**
  String get adminMetadataRecursive;

  /// No description provided for @adminMetadataProvider.
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get adminMetadataProvider;

  /// No description provided for @adminMetadataImageUpdated.
  ///
  /// In en, this message translates to:
  /// **'{imageType} image updated'**
  String adminMetadataImageUpdated(String imageType);

  /// No description provided for @adminMetadataImageUploaded.
  ///
  /// In en, this message translates to:
  /// **'{imageType} image uploaded'**
  String adminMetadataImageUploaded(String imageType);

  /// No description provided for @adminMetadataImageDeleted.
  ///
  /// In en, this message translates to:
  /// **'{imageType} image deleted'**
  String adminMetadataImageDeleted(String imageType);

  /// No description provided for @adminMetadataImageDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to download image: {error}'**
  String adminMetadataImageDownloadFailed(String error);

  /// No description provided for @adminMetadataImageReadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to read selected image'**
  String get adminMetadataImageReadFailed;

  /// No description provided for @adminMetadataImageUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload image: {error}'**
  String adminMetadataImageUploadFailed(String error);

  /// No description provided for @adminMetadataDeleteImageTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete {imageType} image'**
  String adminMetadataDeleteImageTitle(String imageType);

  /// No description provided for @adminMetadataDeleteImageContent.
  ///
  /// In en, this message translates to:
  /// **'This removes the current image from the item.'**
  String get adminMetadataDeleteImageContent;

  /// No description provided for @adminMetadataImageDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete image: {error}'**
  String adminMetadataImageDeleteFailed(String error);

  /// No description provided for @adminMetadataChooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose {imageType} image'**
  String adminMetadataChooseImage(String imageType);

  /// No description provided for @adminMetadataUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get adminMetadataUpload;

  /// No description provided for @adminMetadataUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get adminMetadataUpdate;

  /// No description provided for @adminMetadataRemoteImage.
  ///
  /// In en, this message translates to:
  /// **'Remote image'**
  String get adminMetadataRemoteImage;

  /// No description provided for @adminPluginsInstalled.
  ///
  /// In en, this message translates to:
  /// **'Installed'**
  String get adminPluginsInstalled;

  /// No description provided for @adminPluginsCatalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get adminPluginsCatalog;

  /// No description provided for @adminPluginsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get adminPluginsActive;

  /// No description provided for @adminPluginsRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get adminPluginsRestart;

  /// No description provided for @adminPluginsNoSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No plugins match your search'**
  String get adminPluginsNoSearchResults;

  /// No description provided for @adminPluginsNoneInstalled.
  ///
  /// In en, this message translates to:
  /// **'No plugins installed'**
  String get adminPluginsNoneInstalled;

  /// No description provided for @adminPluginsUpdateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update available: v{version}'**
  String adminPluginsUpdateAvailable(String version);

  /// No description provided for @adminPluginsUpdateAvailableGeneric.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get adminPluginsUpdateAvailableGeneric;

  /// No description provided for @adminPluginsPendingRemoval.
  ///
  /// In en, this message translates to:
  /// **'Pending removal after restart'**
  String get adminPluginsPendingRemoval;

  /// No description provided for @adminPluginsChangesPending.
  ///
  /// In en, this message translates to:
  /// **'Changes pending restart'**
  String get adminPluginsChangesPending;

  /// No description provided for @adminPluginsEnable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get adminPluginsEnable;

  /// No description provided for @adminPluginsDisable.
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get adminPluginsDisable;

  /// No description provided for @adminPluginsInstallUpdate.
  ///
  /// In en, this message translates to:
  /// **'Install update'**
  String get adminPluginsInstallUpdate;

  /// No description provided for @adminPluginsInstallUpdateVersioned.
  ///
  /// In en, this message translates to:
  /// **'Install update (v{version})'**
  String adminPluginsInstallUpdateVersioned(String version);

  /// No description provided for @adminPluginsCatalogNoSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No packages match your search'**
  String get adminPluginsCatalogNoSearchResults;

  /// No description provided for @adminPluginsCatalogEmpty.
  ///
  /// In en, this message translates to:
  /// **'No packages available'**
  String get adminPluginsCatalogEmpty;

  /// No description provided for @adminPluginsInstalling.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" is being installed...'**
  String adminPluginsInstalling(String name);

  /// No description provided for @adminPluginDetailExperimental.
  ///
  /// In en, this message translates to:
  /// **'Experimental Integration'**
  String get adminPluginDetailExperimental;

  /// No description provided for @adminPluginDetailExperimentalContent.
  ///
  /// In en, this message translates to:
  /// **'Plugin settings integration is still experimental. Some fields or layouts may not render correctly yet.'**
  String get adminPluginDetailExperimentalContent;

  /// No description provided for @adminPluginDetailToggle404.
  ///
  /// In en, this message translates to:
  /// **'Failed to toggle plugin. The server could not find this plugin version. Try refreshing plugins, then retry.'**
  String get adminPluginDetailToggle404;

  /// No description provided for @adminPluginDetailToggleDioError.
  ///
  /// In en, this message translates to:
  /// **'Failed to toggle plugin. Please check server logs for details.'**
  String get adminPluginDetailToggleDioError;

  /// No description provided for @adminPluginDetailSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'{name} Settings'**
  String adminPluginDetailSettingsTitle(String name);

  /// No description provided for @adminPluginDetailDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get adminPluginDetailDetails;

  /// No description provided for @adminPluginDetailDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get adminPluginDetailDeveloper;

  /// No description provided for @adminPluginDetailRepository.
  ///
  /// In en, this message translates to:
  /// **'Repository'**
  String get adminPluginDetailRepository;

  /// No description provided for @adminPluginDetailBundled.
  ///
  /// In en, this message translates to:
  /// **'Bundled'**
  String get adminPluginDetailBundled;

  /// No description provided for @adminPluginDetailEnablePlugin.
  ///
  /// In en, this message translates to:
  /// **'Enable Plugin'**
  String get adminPluginDetailEnablePlugin;

  /// No description provided for @adminPluginDetailRestartRequired.
  ///
  /// In en, this message translates to:
  /// **'A server restart is required for changes to take effect.'**
  String get adminPluginDetailRestartRequired;

  /// No description provided for @adminPluginDetailRemovalPending.
  ///
  /// In en, this message translates to:
  /// **'This plugin will be removed after server restart.'**
  String get adminPluginDetailRemovalPending;

  /// No description provided for @adminPluginDetailMalfunctioned.
  ///
  /// In en, this message translates to:
  /// **'This plugin has malfunctioned and may not work correctly.'**
  String get adminPluginDetailMalfunctioned;

  /// No description provided for @adminPluginDetailNotSupported.
  ///
  /// In en, this message translates to:
  /// **'This plugin is not supported by the current server version.'**
  String get adminPluginDetailNotSupported;

  /// No description provided for @adminPluginDetailSuperseded.
  ///
  /// In en, this message translates to:
  /// **'This plugin has been superseded by a newer version.'**
  String get adminPluginDetailSuperseded;

  /// No description provided for @adminReposLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load repositories: {error}'**
  String adminReposLoadFailed(String error);

  /// No description provided for @adminReposRemoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove Repository'**
  String get adminReposRemoveTitle;

  /// No description provided for @adminReposRemoveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove \"{name}\"?'**
  String adminReposRemoveConfirm(String name);

  /// No description provided for @adminReposRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get adminReposRemove;

  /// No description provided for @adminReposSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to save repositories: {error}'**
  String adminReposSaveFailed(String error);

  /// No description provided for @adminReposEmpty.
  ///
  /// In en, this message translates to:
  /// **'No repositories configured'**
  String get adminReposEmpty;

  /// No description provided for @adminReposEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add a repository to browse available plugins'**
  String get adminReposEmptySubtitle;

  /// No description provided for @adminReposUnnamed.
  ///
  /// In en, this message translates to:
  /// **'(unnamed)'**
  String get adminReposUnnamed;

  /// No description provided for @adminReposEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Repository'**
  String get adminReposEditTitle;

  /// No description provided for @adminReposAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Repository'**
  String get adminReposAddTitle;

  /// No description provided for @adminReposUrl.
  ///
  /// In en, this message translates to:
  /// **'Repository URL'**
  String get adminReposUrl;

  /// No description provided for @adminReposNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Jellyfin Stable'**
  String get adminReposNameHint;

  /// No description provided for @adminPluginSettingsInvalidUrl.
  ///
  /// In en, this message translates to:
  /// **'Invalid URL'**
  String get adminPluginSettingsInvalidUrl;

  /// No description provided for @adminGeneralSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get adminGeneralSettingsTitle;

  /// No description provided for @adminGeneralMetadataLanguage.
  ///
  /// In en, this message translates to:
  /// **'Preferred metadata language'**
  String get adminGeneralMetadataLanguage;

  /// No description provided for @adminGeneralMetadataLanguageHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. en, de, fr'**
  String get adminGeneralMetadataLanguageHint;

  /// No description provided for @adminGeneralMetadataCountry.
  ///
  /// In en, this message translates to:
  /// **'Preferred metadata country'**
  String get adminGeneralMetadataCountry;

  /// No description provided for @adminGeneralMetadataCountryHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. US, DE, FR'**
  String get adminGeneralMetadataCountryHint;

  /// No description provided for @adminGeneralLibraryScanConcurrency.
  ///
  /// In en, this message translates to:
  /// **'Library scan concurrency'**
  String get adminGeneralLibraryScanConcurrency;

  /// No description provided for @adminGeneralImageEncodingLimit.
  ///
  /// In en, this message translates to:
  /// **'Parallel image encoding limit'**
  String get adminGeneralImageEncodingLimit;

  /// No description provided for @adminUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get adminUnknownError;

  /// No description provided for @adminBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get adminBrowse;

  /// No description provided for @adminCloseBrowser.
  ///
  /// In en, this message translates to:
  /// **'Close browser'**
  String get adminCloseBrowser;

  /// No description provided for @adminNetworkingTitle.
  ///
  /// In en, this message translates to:
  /// **'Networking'**
  String get adminNetworkingTitle;

  /// No description provided for @adminNetworkingRestartWarning.
  ///
  /// In en, this message translates to:
  /// **'Changes to networking settings may require a server restart.'**
  String get adminNetworkingRestartWarning;

  /// No description provided for @adminNetworkingRemoteAccess.
  ///
  /// In en, this message translates to:
  /// **'Enable remote access'**
  String get adminNetworkingRemoteAccess;

  /// No description provided for @adminNetworkingPorts.
  ///
  /// In en, this message translates to:
  /// **'Ports'**
  String get adminNetworkingPorts;

  /// No description provided for @adminNetworkingHttpPort.
  ///
  /// In en, this message translates to:
  /// **'HTTP port'**
  String get adminNetworkingHttpPort;

  /// No description provided for @adminNetworkingHttpsPort.
  ///
  /// In en, this message translates to:
  /// **'HTTPS port'**
  String get adminNetworkingHttpsPort;

  /// No description provided for @adminNetworkingEnableHttps.
  ///
  /// In en, this message translates to:
  /// **'Enable HTTPS'**
  String get adminNetworkingEnableHttps;

  /// No description provided for @adminNetworkingLocalNetwork.
  ///
  /// In en, this message translates to:
  /// **'Local Network'**
  String get adminNetworkingLocalNetwork;

  /// No description provided for @adminNetworkingLocalAddresses.
  ///
  /// In en, this message translates to:
  /// **'Local network addresses'**
  String get adminNetworkingLocalAddresses;

  /// No description provided for @adminNetworkingAddressHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 192.168.1.0/24'**
  String get adminNetworkingAddressHint;

  /// No description provided for @adminNetworkingKnownProxies.
  ///
  /// In en, this message translates to:
  /// **'Known proxies'**
  String get adminNetworkingKnownProxies;

  /// No description provided for @adminNetworkingProxyHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 10.0.0.1'**
  String get adminNetworkingProxyHint;

  /// No description provided for @adminNetworkingWhitelist.
  ///
  /// In en, this message translates to:
  /// **'Whitelist'**
  String get adminNetworkingWhitelist;

  /// No description provided for @adminNetworkingBlacklist.
  ///
  /// In en, this message translates to:
  /// **'Blacklist'**
  String get adminNetworkingBlacklist;

  /// No description provided for @adminNetworkingAddEntry.
  ///
  /// In en, this message translates to:
  /// **'Add entry'**
  String get adminNetworkingAddEntry;

  /// No description provided for @adminBrandingTitle.
  ///
  /// In en, this message translates to:
  /// **'Branding'**
  String get adminBrandingTitle;

  /// No description provided for @adminBrandingLoginDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Login disclaimer'**
  String get adminBrandingLoginDisclaimer;

  /// No description provided for @adminBrandingLoginDisclaimerHint.
  ///
  /// In en, this message translates to:
  /// **'HTML displayed below the login form'**
  String get adminBrandingLoginDisclaimerHint;

  /// No description provided for @adminBrandingCustomCss.
  ///
  /// In en, this message translates to:
  /// **'Custom CSS'**
  String get adminBrandingCustomCss;

  /// No description provided for @adminBrandingCustomCssHint.
  ///
  /// In en, this message translates to:
  /// **'Custom CSS applied to the web interface'**
  String get adminBrandingCustomCssHint;

  /// No description provided for @adminBrandingEnableSplash.
  ///
  /// In en, this message translates to:
  /// **'Enable splash screen'**
  String get adminBrandingEnableSplash;

  /// No description provided for @adminPlaybackHwAccel.
  ///
  /// In en, this message translates to:
  /// **'Hardware Acceleration'**
  String get adminPlaybackHwAccel;

  /// No description provided for @adminPlaybackHwAccelLabel.
  ///
  /// In en, this message translates to:
  /// **'Hardware acceleration'**
  String get adminPlaybackHwAccelLabel;

  /// No description provided for @adminPlaybackEnableHwEncoding.
  ///
  /// In en, this message translates to:
  /// **'Enable hardware encoding'**
  String get adminPlaybackEnableHwEncoding;

  /// No description provided for @adminPlaybackEnableHwDecoding.
  ///
  /// In en, this message translates to:
  /// **'Enable hardware decoding for:'**
  String get adminPlaybackEnableHwDecoding;

  /// No description provided for @adminPlaybackEncoding.
  ///
  /// In en, this message translates to:
  /// **'Encoding'**
  String get adminPlaybackEncoding;

  /// No description provided for @adminPlaybackEncodingThreads.
  ///
  /// In en, this message translates to:
  /// **'Encoding threads'**
  String get adminPlaybackEncodingThreads;

  /// No description provided for @adminPlaybackFallbackFont.
  ///
  /// In en, this message translates to:
  /// **'Enable fallback font'**
  String get adminPlaybackFallbackFont;

  /// No description provided for @adminPlaybackFallbackFontPath.
  ///
  /// In en, this message translates to:
  /// **'Fallback font path'**
  String get adminPlaybackFallbackFontPath;

  /// No description provided for @adminPlaybackStreaming.
  ///
  /// In en, this message translates to:
  /// **'Streaming'**
  String get adminPlaybackStreaming;

  /// No description provided for @adminResumeVideo.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get adminResumeVideo;

  /// No description provided for @adminResumeAudiobooks.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks'**
  String get adminResumeAudiobooks;

  /// No description provided for @adminResumeMinAudiobookPct.
  ///
  /// In en, this message translates to:
  /// **'Minimum audiobook resume percentage'**
  String get adminResumeMinAudiobookPct;

  /// No description provided for @adminResumeMaxAudiobookPct.
  ///
  /// In en, this message translates to:
  /// **'Maximum audiobook resume percentage'**
  String get adminResumeMaxAudiobookPct;

  /// No description provided for @adminStreamingBitrateLimit.
  ///
  /// In en, this message translates to:
  /// **'Remote client bitrate limit (Mbps)'**
  String get adminStreamingBitrateLimit;

  /// No description provided for @adminStreamingBitrateLimitHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty or 0 for unlimited'**
  String get adminStreamingBitrateLimitHint;

  /// No description provided for @adminTrickplayHwAccel.
  ///
  /// In en, this message translates to:
  /// **'Enable hardware acceleration'**
  String get adminTrickplayHwAccel;

  /// No description provided for @adminTrickplayHwEncoding.
  ///
  /// In en, this message translates to:
  /// **'Enable hardware encoding'**
  String get adminTrickplayHwEncoding;

  /// No description provided for @adminTrickplayKeyFrameOnly.
  ///
  /// In en, this message translates to:
  /// **'Enable key frame only extraction'**
  String get adminTrickplayKeyFrameOnly;

  /// No description provided for @adminTrickplayKeyFrameOnlySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Faster but lower accuracy'**
  String get adminTrickplayKeyFrameOnlySubtitle;

  /// No description provided for @adminTrickplayNonBlocking.
  ///
  /// In en, this message translates to:
  /// **'Non-Blocking'**
  String get adminTrickplayNonBlocking;

  /// No description provided for @adminTrickplayBlocking.
  ///
  /// In en, this message translates to:
  /// **'Blocking'**
  String get adminTrickplayBlocking;

  /// No description provided for @adminTrickplayPriorityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get adminTrickplayPriorityHigh;

  /// No description provided for @adminTrickplayPriorityAboveNormal.
  ///
  /// In en, this message translates to:
  /// **'Above Normal'**
  String get adminTrickplayPriorityAboveNormal;

  /// No description provided for @adminTrickplayPriorityNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get adminTrickplayPriorityNormal;

  /// No description provided for @adminTrickplayPriorityBelowNormal.
  ///
  /// In en, this message translates to:
  /// **'Below Normal'**
  String get adminTrickplayPriorityBelowNormal;

  /// No description provided for @adminTrickplayPriorityIdle.
  ///
  /// In en, this message translates to:
  /// **'Idle'**
  String get adminTrickplayPriorityIdle;

  /// No description provided for @adminTrickplayImageSettings.
  ///
  /// In en, this message translates to:
  /// **'Image Settings'**
  String get adminTrickplayImageSettings;

  /// No description provided for @adminTrickplayInterval.
  ///
  /// In en, this message translates to:
  /// **'Interval (ms)'**
  String get adminTrickplayInterval;

  /// No description provided for @adminTrickplayIntervalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How often to capture frames'**
  String get adminTrickplayIntervalSubtitle;

  /// No description provided for @adminTrickplayWidthResolutionsHint.
  ///
  /// In en, this message translates to:
  /// **'Comma-separated pixel widths (e.g. 320)'**
  String get adminTrickplayWidthResolutionsHint;

  /// No description provided for @adminTrickplayQuality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get adminTrickplayQuality;

  /// No description provided for @adminTrickplayQScale.
  ///
  /// In en, this message translates to:
  /// **'Quality scale'**
  String get adminTrickplayQScale;

  /// No description provided for @adminTrickplayQScaleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lower values = better quality, larger files'**
  String get adminTrickplayQScaleSubtitle;

  /// No description provided for @adminTrickplayJpegQuality.
  ///
  /// In en, this message translates to:
  /// **'JPEG quality'**
  String get adminTrickplayJpegQuality;

  /// No description provided for @adminTrickplayProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get adminTrickplayProcessing;

  /// No description provided for @adminTasksEmpty.
  ///
  /// In en, this message translates to:
  /// **'No scheduled tasks found'**
  String get adminTasksEmpty;

  /// No description provided for @adminTasksNoFilterMatch.
  ///
  /// In en, this message translates to:
  /// **'No tasks match the current filter'**
  String get adminTasksNoFilterMatch;

  /// No description provided for @adminTaskCancelling.
  ///
  /// In en, this message translates to:
  /// **'Cancelling...'**
  String get adminTaskCancelling;

  /// No description provided for @adminTaskRunning.
  ///
  /// In en, this message translates to:
  /// **'Running...'**
  String get adminTaskRunning;

  /// No description provided for @adminTaskNeverRun.
  ///
  /// In en, this message translates to:
  /// **'Never run'**
  String get adminTaskNeverRun;

  /// No description provided for @adminTaskStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get adminTaskStop;

  /// No description provided for @adminTaskRun.
  ///
  /// In en, this message translates to:
  /// **'Run'**
  String get adminTaskRun;

  /// No description provided for @adminTaskDetailLastExecution.
  ///
  /// In en, this message translates to:
  /// **'Last Execution'**
  String get adminTaskDetailLastExecution;

  /// No description provided for @adminTaskDetailStarted.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get adminTaskDetailStarted;

  /// No description provided for @adminTaskDetailEnded.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get adminTaskDetailEnded;

  /// No description provided for @adminTaskDetailDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get adminTaskDetailDuration;

  /// No description provided for @adminTaskDetailErrorLabel.
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get adminTaskDetailErrorLabel;

  /// No description provided for @adminTaskTriggerDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily at {time}'**
  String adminTaskTriggerDaily(String time);

  /// No description provided for @adminTaskTriggerWeekly.
  ///
  /// In en, this message translates to:
  /// **'Every {day} at {time}'**
  String adminTaskTriggerWeekly(String day, String time);

  /// No description provided for @adminTaskTriggerInterval.
  ///
  /// In en, this message translates to:
  /// **'Every {duration}'**
  String adminTaskTriggerInterval(String duration);

  /// No description provided for @adminTaskTriggerStartup.
  ///
  /// In en, this message translates to:
  /// **'On application startup'**
  String get adminTaskTriggerStartup;

  /// No description provided for @adminTaskTriggerTypeDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get adminTaskTriggerTypeDaily;

  /// No description provided for @adminTaskTriggerTypeWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get adminTaskTriggerTypeWeekly;

  /// No description provided for @adminTaskTriggerTypeInterval.
  ///
  /// In en, this message translates to:
  /// **'On an interval'**
  String get adminTaskTriggerTypeInterval;

  /// No description provided for @adminTaskTriggerIntervalLabel.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get adminTaskTriggerIntervalLabel;

  /// No description provided for @adminTaskTriggerEveryHour.
  ///
  /// In en, this message translates to:
  /// **'Every hour'**
  String get adminTaskTriggerEveryHour;

  /// No description provided for @adminTaskTriggerEvery6Hours.
  ///
  /// In en, this message translates to:
  /// **'Every 6 hours'**
  String get adminTaskTriggerEvery6Hours;

  /// No description provided for @adminTaskTriggerEvery12Hours.
  ///
  /// In en, this message translates to:
  /// **'Every 12 hours'**
  String get adminTaskTriggerEvery12Hours;

  /// No description provided for @adminTaskTriggerEvery24Hours.
  ///
  /// In en, this message translates to:
  /// **'Every 24 hours'**
  String get adminTaskTriggerEvery24Hours;

  /// No description provided for @adminTaskTriggerEvery2Days.
  ///
  /// In en, this message translates to:
  /// **'Every 2 days'**
  String get adminTaskTriggerEvery2Days;

  /// No description provided for @adminTaskTriggerHours.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 hour} other{{count} hours}}'**
  String adminTaskTriggerHours(int count);

  /// No description provided for @adminTaskTriggerTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get adminTaskTriggerTime;

  /// No description provided for @adminTaskTriggerNoLimit.
  ///
  /// In en, this message translates to:
  /// **'No limit'**
  String get adminTaskTriggerNoLimit;

  /// No description provided for @adminActivityJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get adminActivityJustNow;

  /// No description provided for @adminActivityLastHour.
  ///
  /// In en, this message translates to:
  /// **'Last hour'**
  String get adminActivityLastHour;

  /// No description provided for @adminActivityToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get adminActivityToday;

  /// No description provided for @adminActivityYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get adminActivityYesterday;

  /// No description provided for @adminActivityOlder.
  ///
  /// In en, this message translates to:
  /// **'Older'**
  String get adminActivityOlder;

  /// No description provided for @adminActivityDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String adminActivityDaysAgo(int days);

  /// No description provided for @adminActivityHoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String adminActivityHoursAgo(int hours);

  /// No description provided for @adminActivityMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m ago'**
  String adminActivityMinutesAgo(int minutes);

  /// No description provided for @adminActivityNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get adminActivityNow;

  /// No description provided for @adminActivityMinutesShort.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m'**
  String adminActivityMinutesShort(int minutes);

  /// No description provided for @adminActivityHoursShort.
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String adminActivityHoursShort(int hours);

  /// No description provided for @adminActivityDaysShort.
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String adminActivityDaysShort(int days);

  /// No description provided for @adminActivityDateShort.
  ///
  /// In en, this message translates to:
  /// **'{month}/{day}'**
  String adminActivityDateShort(int month, int day);

  /// No description provided for @adminTrickplayDescription.
  ///
  /// In en, this message translates to:
  /// **'Configure trickplay image generation for seek preview thumbnails.'**
  String get adminTrickplayDescription;

  /// No description provided for @adminNetworkingPublicHttpsPort.
  ///
  /// In en, this message translates to:
  /// **'Public HTTPS port'**
  String get adminNetworkingPublicHttpsPort;

  /// No description provided for @adminNetworkingBaseUrl.
  ///
  /// In en, this message translates to:
  /// **'Base URL'**
  String get adminNetworkingBaseUrl;

  /// No description provided for @adminNetworkingBaseUrlHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. /jellyfin'**
  String get adminNetworkingBaseUrlHint;

  /// No description provided for @adminNetworkingHttps.
  ///
  /// In en, this message translates to:
  /// **'HTTPS'**
  String get adminNetworkingHttps;

  /// No description provided for @adminNetworkingCertPath.
  ///
  /// In en, this message translates to:
  /// **'Certificate path'**
  String get adminNetworkingCertPath;

  /// No description provided for @adminNetworkingRemoteIpFilter.
  ///
  /// In en, this message translates to:
  /// **'Remote IP Filter'**
  String get adminNetworkingRemoteIpFilter;

  /// No description provided for @adminNetworkingRemoteIpFilterLabel.
  ///
  /// In en, this message translates to:
  /// **'Remote IP filter'**
  String get adminNetworkingRemoteIpFilterLabel;

  /// No description provided for @adminPlaybackVaapiDevice.
  ///
  /// In en, this message translates to:
  /// **'VA-API device'**
  String get adminPlaybackVaapiDevice;

  /// No description provided for @adminPlaybackAutomatic.
  ///
  /// In en, this message translates to:
  /// **'0 = automatic'**
  String get adminPlaybackAutomatic;

  /// No description provided for @adminPlaybackTranscodeTempPath.
  ///
  /// In en, this message translates to:
  /// **'Transcoding temp path'**
  String get adminPlaybackTranscodeTempPath;

  /// No description provided for @adminPlaybackSegmentDeletion.
  ///
  /// In en, this message translates to:
  /// **'Allow segment deletion'**
  String get adminPlaybackSegmentDeletion;

  /// No description provided for @adminPlaybackSegmentKeep.
  ///
  /// In en, this message translates to:
  /// **'Segment keep (seconds)'**
  String get adminPlaybackSegmentKeep;

  /// No description provided for @adminPlaybackThrottleBuffering.
  ///
  /// In en, this message translates to:
  /// **'Throttle buffering'**
  String get adminPlaybackThrottleBuffering;

  /// No description provided for @adminResumeMinPct.
  ///
  /// In en, this message translates to:
  /// **'Minimum resume percentage'**
  String get adminResumeMinPct;

  /// No description provided for @adminResumeMinPctSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Content must be played past this percentage to save progress'**
  String get adminResumeMinPctSubtitle;

  /// No description provided for @adminResumeMaxPct.
  ///
  /// In en, this message translates to:
  /// **'Maximum resume percentage'**
  String get adminResumeMaxPct;

  /// No description provided for @adminResumeMaxPctSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Content is considered fully played after this percentage'**
  String get adminResumeMaxPctSubtitle;

  /// No description provided for @adminResumeMinDuration.
  ///
  /// In en, this message translates to:
  /// **'Minimum resume duration (seconds)'**
  String get adminResumeMinDuration;

  /// No description provided for @adminResumeMinDurationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Items shorter than this are not resumable'**
  String get adminResumeMinDurationSubtitle;

  /// No description provided for @adminTrickplayScanBehavior.
  ///
  /// In en, this message translates to:
  /// **'Scan behavior'**
  String get adminTrickplayScanBehavior;

  /// No description provided for @adminTrickplayProcessPriority.
  ///
  /// In en, this message translates to:
  /// **'Process priority'**
  String get adminTrickplayProcessPriority;

  /// No description provided for @adminTrickplayTileWidth.
  ///
  /// In en, this message translates to:
  /// **'Tile width'**
  String get adminTrickplayTileWidth;

  /// No description provided for @adminTrickplayTileHeight.
  ///
  /// In en, this message translates to:
  /// **'Tile height'**
  String get adminTrickplayTileHeight;

  /// No description provided for @adminTrickplayProcessThreads.
  ///
  /// In en, this message translates to:
  /// **'Process threads'**
  String get adminTrickplayProcessThreads;

  /// No description provided for @adminTrickplayWidthResolutions.
  ///
  /// In en, this message translates to:
  /// **'Width resolutions'**
  String get adminTrickplayWidthResolutions;

  /// No description provided for @adminMetadataDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get adminMetadataDefault;

  /// No description provided for @adminMetadataContentTypeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Content type updated'**
  String get adminMetadataContentTypeUpdated;

  /// No description provided for @adminMetadataContentTypeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update content type: {error}'**
  String adminMetadataContentTypeFailed(String error);

  /// No description provided for @adminGeneralSlowResponseThreshold.
  ///
  /// In en, this message translates to:
  /// **'Slow response threshold (ms)'**
  String get adminGeneralSlowResponseThreshold;

  /// No description provided for @adminGeneralCachePath.
  ///
  /// In en, this message translates to:
  /// **'Cache path'**
  String get adminGeneralCachePath;

  /// No description provided for @adminGeneralMetadataPath.
  ///
  /// In en, this message translates to:
  /// **'Metadata path'**
  String get adminGeneralMetadataPath;

  /// No description provided for @adminGeneralServerName.
  ///
  /// In en, this message translates to:
  /// **'Server name'**
  String get adminGeneralServerName;

  /// No description provided for @adminSettingsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load settings'**
  String get adminSettingsLoadFailed;

  /// No description provided for @adminDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get adminDiscover;

  /// No description provided for @adminChannelMappingsUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update mappings: {error}'**
  String adminChannelMappingsUpdateFailed(String error);

  /// No description provided for @adminTimeLimitDuration.
  ///
  /// In en, this message translates to:
  /// **'Time limit: {duration}'**
  String adminTimeLimitDuration(String duration);

  /// No description provided for @folders.
  ///
  /// In en, this message translates to:
  /// **'Folders'**
  String get folders;

  /// No description provided for @libraries.
  ///
  /// In en, this message translates to:
  /// **'Libraries'**
  String get libraries;

  /// No description provided for @syncPlay.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay'**
  String get syncPlay;

  /// No description provided for @syncPlayDisabledTitle.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay disabled'**
  String get syncPlayDisabledTitle;

  /// No description provided for @syncPlayDisabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Enable SyncPlay in Settings to use synchronized playback.'**
  String get syncPlayDisabledMessage;

  /// No description provided for @syncPlayServerUnsupportedTitle.
  ///
  /// In en, this message translates to:
  /// **'Server unsupported'**
  String get syncPlayServerUnsupportedTitle;

  /// No description provided for @syncPlayServerUnsupportedMessage.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay requires a Jellyfin server. The current server does not support it.'**
  String get syncPlayServerUnsupportedMessage;

  /// No description provided for @syncPlayGroupFallbackName.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay Group'**
  String get syncPlayGroupFallbackName;

  /// No description provided for @syncPlayGroupTooltip.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay group'**
  String get syncPlayGroupTooltip;

  /// Participant count label shown in SyncPlay UI
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {# participant} other {# participants}}'**
  String syncPlayParticipantCount(int count);

  /// No description provided for @syncPlayIgnoreWait.
  ///
  /// In en, this message translates to:
  /// **'Ignore wait'**
  String get syncPlayIgnoreWait;

  /// No description provided for @syncPlayIgnoreWaitSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Don\'t hold the group up while this device buffers'**
  String get syncPlayIgnoreWaitSubtitle;

  /// No description provided for @syncPlayContinueLocallyNoWait.
  ///
  /// In en, this message translates to:
  /// **'Continue locally without waiting for slow members'**
  String get syncPlayContinueLocallyNoWait;

  /// No description provided for @syncPlayRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get syncPlayRepeat;

  /// No description provided for @syncPlayRepeatOne.
  ///
  /// In en, this message translates to:
  /// **'One'**
  String get syncPlayRepeatOne;

  /// No description provided for @syncPlayShuffleModeShuffled.
  ///
  /// In en, this message translates to:
  /// **'Shuffled'**
  String get syncPlayShuffleModeShuffled;

  /// No description provided for @syncPlayShuffleModeSorted.
  ///
  /// In en, this message translates to:
  /// **'Sorted'**
  String get syncPlayShuffleModeSorted;

  /// No description provided for @syncPlaySyncCurrentQueue.
  ///
  /// In en, this message translates to:
  /// **'Sync current playback queue'**
  String get syncPlaySyncCurrentQueue;

  /// No description provided for @syncPlaySyncCurrentQueueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Replace the group queue with what is playing locally'**
  String get syncPlaySyncCurrentQueueSubtitle;

  /// No description provided for @syncPlayLeaveGroup.
  ///
  /// In en, this message translates to:
  /// **'Leave group'**
  String get syncPlayLeaveGroup;

  /// No description provided for @syncPlayGroupQueue.
  ///
  /// In en, this message translates to:
  /// **'Group queue'**
  String get syncPlayGroupQueue;

  /// Fallback title for SyncPlay queue item when media title is unavailable
  ///
  /// In en, this message translates to:
  /// **'Item {index}'**
  String syncPlayQueueItemFallback(int index);

  /// No description provided for @syncPlayPlayNow.
  ///
  /// In en, this message translates to:
  /// **'Play now'**
  String get syncPlayPlayNow;

  /// No description provided for @syncPlayCreateNewGroup.
  ///
  /// In en, this message translates to:
  /// **'Create a new group'**
  String get syncPlayCreateNewGroup;

  /// No description provided for @syncPlayGroupName.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get syncPlayGroupName;

  /// No description provided for @syncPlayDefaultGroupName.
  ///
  /// In en, this message translates to:
  /// **'My SyncPlay Group'**
  String get syncPlayDefaultGroupName;

  /// No description provided for @syncPlayCreateGroup.
  ///
  /// In en, this message translates to:
  /// **'Create group'**
  String get syncPlayCreateGroup;

  /// No description provided for @syncPlayAvailableGroups.
  ///
  /// In en, this message translates to:
  /// **'Available groups'**
  String get syncPlayAvailableGroups;

  /// No description provided for @syncPlayNoGroupsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No groups available'**
  String get syncPlayNoGroupsAvailable;

  /// No description provided for @syncPlayJoinGroupQuestion.
  ///
  /// In en, this message translates to:
  /// **'Join SyncPlay group?'**
  String get syncPlayJoinGroupQuestion;

  /// No description provided for @syncPlayJoinGroupWarning.
  ///
  /// In en, this message translates to:
  /// **'Joining a SyncPlay group may replace your current playback queue. Continue?'**
  String get syncPlayJoinGroupWarning;

  /// No description provided for @syncPlayJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get syncPlayJoin;

  /// No description provided for @syncPlayStateIdle.
  ///
  /// In en, this message translates to:
  /// **'Idle'**
  String get syncPlayStateIdle;

  /// No description provided for @syncPlayStateWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting'**
  String get syncPlayStateWaiting;

  /// No description provided for @syncPlayStatePaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get syncPlayStatePaused;

  /// No description provided for @syncPlayStatePlaying.
  ///
  /// In en, this message translates to:
  /// **'Playing'**
  String get syncPlayStatePlaying;

  /// Snackbar message when a user joins a SyncPlay group
  ///
  /// In en, this message translates to:
  /// **'{userName} joined SyncPlay group'**
  String syncPlayUserJoinedGroup(String userName);

  /// Snackbar message when a user leaves a SyncPlay group
  ///
  /// In en, this message translates to:
  /// **'{userName} left SyncPlay group'**
  String syncPlayUserLeftGroup(String userName);

  /// No description provided for @syncPlayAccessDeniedTitle.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay access denied'**
  String get syncPlayAccessDeniedTitle;

  /// No description provided for @syncPlayAccessDeniedMessage.
  ///
  /// In en, this message translates to:
  /// **'You do not have access to one or more items in this SyncPlay group. Ask the group owner to verify library permissions or choose a different queue.'**
  String get syncPlayAccessDeniedMessage;

  /// Snackbar message shown when starting playback in a SyncPlay group
  ///
  /// In en, this message translates to:
  /// **'Syncing playback to {groupName}'**
  String syncPlaySyncingPlaybackToGroup(String groupName);

  /// No description provided for @voiceSearchUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Voice search is unavailable.'**
  String get voiceSearchUnavailable;

  /// No description provided for @dolbyVisionDirectPlayFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Dolby Vision Direct Play Failed'**
  String get dolbyVisionDirectPlayFailedTitle;

  /// No description provided for @dolbyVisionDirectPlayFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Direct play failed to start for this Dolby Vision stream. Retry using server transcode?'**
  String get dolbyVisionDirectPlayFailedMessage;

  /// No description provided for @retryWithTranscode.
  ///
  /// In en, this message translates to:
  /// **'Retry with transcode'**
  String get retryWithTranscode;

  /// No description provided for @dolbyVisionNotSupportedTitle.
  ///
  /// In en, this message translates to:
  /// **'Dolby Vision Not Supported'**
  String get dolbyVisionNotSupportedTitle;

  /// No description provided for @dolbyVisionNotSupportedMessage.
  ///
  /// In en, this message translates to:
  /// **'This device cannot decode Dolby Vision content directly. Use HDR10 fallback or request server transcoding.'**
  String get dolbyVisionNotSupportedMessage;

  /// No description provided for @rememberMyChoice.
  ///
  /// In en, this message translates to:
  /// **'Remember my choice'**
  String get rememberMyChoice;

  /// No description provided for @playHdr10Fallback.
  ///
  /// In en, this message translates to:
  /// **'Play HDR10 fallback'**
  String get playHdr10Fallback;

  /// No description provided for @requestTranscode.
  ///
  /// In en, this message translates to:
  /// **'Request transcode'**
  String get requestTranscode;

  /// No description provided for @homeScreenSectionsIntegrationDescription.
  ///
  /// In en, this message translates to:
  /// **'Detect rows exposed by IAmParadox27\'s \"Home Screen Sections\" plugin. Rows can be enabled and reordered below.'**
  String get homeScreenSectionsIntegrationDescription;

  /// No description provided for @homeScreenSectionsIntegrationNoServers.
  ///
  /// In en, this message translates to:
  /// **'No Jellyfin servers reporting the plugin yet.'**
  String get homeScreenSectionsIntegrationNoServers;

  /// No description provided for @kefinTweaksIntegrationDescription.
  ///
  /// In en, this message translates to:
  /// **'Detect rows configured via ranaldsgift\'s \"KefinTweaks\" plugin. Custom sections, recently released, watch again, seasonal, and recently added in library are mirrored from the KefinTweaks configuration on each Jellyfin server.'**
  String get kefinTweaksIntegrationDescription;

  /// No description provided for @kefinTweaksIntegrationNoServers.
  ///
  /// In en, this message translates to:
  /// **'No Jellyfin servers reporting KefinTweaks yet.'**
  String get kefinTweaksIntegrationNoServers;

  /// No description provided for @integrationOpenHomeSections.
  ///
  /// In en, this message translates to:
  /// **'Open Home Sections'**
  String get integrationOpenHomeSections;

  /// No description provided for @integrationOpenHomeSectionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable, disable, and reorder rows'**
  String get integrationOpenHomeSectionsSubtitle;

  /// No description provided for @integrationInstalledButDisabled.
  ///
  /// In en, this message translates to:
  /// **'Installed but disabled'**
  String get integrationInstalledButDisabled;

  /// No description provided for @integrationNotInstalled.
  ///
  /// In en, this message translates to:
  /// **'Not installed'**
  String get integrationNotInstalled;

  /// Plural label for number of sections discovered in integration status
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {# section} other {# sections}}'**
  String integrationSectionsCount(int count);

  /// Plural label for number of rows discovered in integration status
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {# row discovered} other {# rows discovered}}'**
  String integrationRowsDiscoveredCount(int count);

  /// No description provided for @jellyseerr.
  ///
  /// In en, this message translates to:
  /// **'Jellyseerr'**
  String get jellyseerr;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @noItems.
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get noItems;

  /// No description provided for @switchUser.
  ///
  /// In en, this message translates to:
  /// **'Switch User'**
  String get switchUser;

  /// No description provided for @remoteControl.
  ///
  /// In en, this message translates to:
  /// **'Remote Control'**
  String get remoteControl;

  /// No description provided for @mediaBarLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading media bar...'**
  String get mediaBarLoading;

  /// No description provided for @mediaBarError.
  ///
  /// In en, this message translates to:
  /// **'Media bar failed to load'**
  String get mediaBarError;

  /// No description provided for @offlineServerUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Connected to the internet, but the current server is unavailable.'**
  String get offlineServerUnavailable;

  /// No description provided for @offlineNoInternet.
  ///
  /// In en, this message translates to:
  /// **'You are offline. Only downloaded content is available.'**
  String get offlineNoInternet;

  /// No description provided for @offlineFileNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'File not available'**
  String get offlineFileNotAvailable;

  /// No description provided for @offlineSwitchServer.
  ///
  /// In en, this message translates to:
  /// **'Switch Server'**
  String get offlineSwitchServer;

  /// No description provided for @offlineSavedMedia.
  ///
  /// In en, this message translates to:
  /// **'Saved Media'**
  String get offlineSavedMedia;

  /// No description provided for @castGoogleCast.
  ///
  /// In en, this message translates to:
  /// **'Google Cast'**
  String get castGoogleCast;

  /// No description provided for @castAirPlay.
  ///
  /// In en, this message translates to:
  /// **'AirPlay'**
  String get castAirPlay;

  /// No description provided for @castDlna.
  ///
  /// In en, this message translates to:
  /// **'DLNA'**
  String get castDlna;

  /// No description provided for @castRemotePlayback.
  ///
  /// In en, this message translates to:
  /// **'Remote Playback'**
  String get castRemotePlayback;

  /// No description provided for @castControlFailed.
  ///
  /// In en, this message translates to:
  /// **'Cast control failed: {error}'**
  String castControlFailed(String error);

  /// No description provided for @castKindControls.
  ///
  /// In en, this message translates to:
  /// **'{kind} Controls'**
  String castKindControls(String kind);

  /// No description provided for @castDeviceVolume.
  ///
  /// In en, this message translates to:
  /// **'Device Volume'**
  String get castDeviceVolume;

  /// No description provided for @castVolumeUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get castVolumeUnavailable;

  /// No description provided for @castStopKind.
  ///
  /// In en, this message translates to:
  /// **'Stop {kind}'**
  String castStopKind(String kind);

  /// No description provided for @audioLabel.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audioLabel;

  /// No description provided for @subtitlesLabel.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get subtitlesLabel;

  /// No description provided for @pinConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get pinConfirmTitle;

  /// No description provided for @pinSetTitle.
  ///
  /// In en, this message translates to:
  /// **'Set PIN'**
  String get pinSetTitle;

  /// No description provided for @pinEnterTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter PIN'**
  String get pinEnterTitle;

  /// No description provided for @pinReenterToConfirm.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your PIN to confirm'**
  String get pinReenterToConfirm;

  /// No description provided for @pinEnterNDigit.
  ///
  /// In en, this message translates to:
  /// **'Enter a {length}-digit PIN'**
  String pinEnterNDigit(int length);

  /// No description provided for @pinEnterYourNDigit.
  ///
  /// In en, this message translates to:
  /// **'Enter your {length}-digit PIN'**
  String pinEnterYourNDigit(int length);

  /// No description provided for @pinIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect PIN'**
  String get pinIncorrect;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match'**
  String get pinMismatch;

  /// No description provided for @pinForgot.
  ///
  /// In en, this message translates to:
  /// **'Forgot PIN?'**
  String get pinForgot;

  /// No description provided for @pinClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get pinClear;

  /// No description provided for @pinBackspace.
  ///
  /// In en, this message translates to:
  /// **'Backspace'**
  String get pinBackspace;

  /// No description provided for @quickConnectAuthorized.
  ///
  /// In en, this message translates to:
  /// **'Quick Connect request authorized.'**
  String get quickConnectAuthorized;

  /// No description provided for @quickConnectInvalidOrExpired.
  ///
  /// In en, this message translates to:
  /// **'Quick Connect code is invalid or expired.'**
  String get quickConnectInvalidOrExpired;

  /// No description provided for @quickConnectNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Quick Connect is not supported on this server.'**
  String get quickConnectNotSupported;

  /// No description provided for @quickConnectAuthorizeFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to authorize Quick Connect code.'**
  String get quickConnectAuthorizeFailed;

  /// No description provided for @quickConnectDisabled.
  ///
  /// In en, this message translates to:
  /// **'Quick Connect is disabled on this server.'**
  String get quickConnectDisabled;

  /// No description provided for @quickConnectForbidden.
  ///
  /// In en, this message translates to:
  /// **'Your account cannot authorize this Quick Connect request.'**
  String get quickConnectForbidden;

  /// No description provided for @quickConnectNotFound.
  ///
  /// In en, this message translates to:
  /// **'Quick Connect code was not found. Try a new code.'**
  String get quickConnectNotFound;

  /// No description provided for @quickConnectFailedWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Quick Connect failed: {message}'**
  String quickConnectFailedWithMessage(String message);

  /// No description provided for @quickConnectEnterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get quickConnectEnterCode;

  /// No description provided for @quickConnectAuthorize.
  ///
  /// In en, this message translates to:
  /// **'Authorize'**
  String get quickConnectAuthorize;

  /// No description provided for @remoteCommandFailed.
  ///
  /// In en, this message translates to:
  /// **'Command failed: {error}'**
  String remoteCommandFailed(String error);

  /// No description provided for @remoteControlTitle.
  ///
  /// In en, this message translates to:
  /// **'Remote Control'**
  String get remoteControlTitle;

  /// No description provided for @remoteFailedToLoadSessions.
  ///
  /// In en, this message translates to:
  /// **'Failed to load sessions'**
  String get remoteFailedToLoadSessions;

  /// No description provided for @remoteNoSessions.
  ///
  /// In en, this message translates to:
  /// **'No controllable sessions'**
  String get remoteNoSessions;

  /// No description provided for @remoteStartPlayback.
  ///
  /// In en, this message translates to:
  /// **'Start playback on another device'**
  String get remoteStartPlayback;

  /// No description provided for @unknownUser.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownUser;

  /// No description provided for @unknownItem.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknownItem;

  /// No description provided for @remoteNothingPlaying.
  ///
  /// In en, this message translates to:
  /// **'Nothing playing on this session'**
  String get remoteNothingPlaying;

  /// No description provided for @castingStarted.
  ///
  /// In en, this message translates to:
  /// **'Casting started on selected device'**
  String get castingStarted;

  /// No description provided for @castingFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to start casting: {error}'**
  String castingFailed(String error);

  /// No description provided for @noRemoteDevices.
  ///
  /// In en, this message translates to:
  /// **'No remote playback devices available.'**
  String get noRemoteDevices;

  /// No description provided for @noRemoteDevicesIos.
  ///
  /// In en, this message translates to:
  /// **'No remote playback devices available.\n\nOn iOS, AirPlay targets may be unavailable in the simulator.'**
  String get noRemoteDevicesIos;

  /// No description provided for @trackActionPlayNext.
  ///
  /// In en, this message translates to:
  /// **'Play Next'**
  String get trackActionPlayNext;

  /// No description provided for @trackActionAddToQueue.
  ///
  /// In en, this message translates to:
  /// **'Add to Queue'**
  String get trackActionAddToQueue;

  /// No description provided for @trackActionAddToPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Add to Playlist'**
  String get trackActionAddToPlaylist;

  /// No description provided for @trackActionCancelDownload.
  ///
  /// In en, this message translates to:
  /// **'Cancel Download'**
  String get trackActionCancelDownload;

  /// No description provided for @trackActionDeleteFromPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Delete from Playlist'**
  String get trackActionDeleteFromPlaylist;

  /// No description provided for @trackActionMoveUp.
  ///
  /// In en, this message translates to:
  /// **'Move Up'**
  String get trackActionMoveUp;

  /// No description provided for @trackActionMoveDown.
  ///
  /// In en, this message translates to:
  /// **'Move Down'**
  String get trackActionMoveDown;

  /// No description provided for @trackActionRemoveFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from Favorites'**
  String get trackActionRemoveFromFavorites;

  /// No description provided for @trackActionAddToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Add to Favorites'**
  String get trackActionAddToFavorites;

  /// No description provided for @trackActionGoToAlbum.
  ///
  /// In en, this message translates to:
  /// **'Go to Album'**
  String get trackActionGoToAlbum;

  /// No description provided for @trackActionGoToArtist.
  ///
  /// In en, this message translates to:
  /// **'Go to Artist'**
  String get trackActionGoToArtist;

  /// No description provided for @trackActionDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading {name}...'**
  String trackActionDownloading(String name);

  /// No description provided for @trackActionDeletedFile.
  ///
  /// In en, this message translates to:
  /// **'Deleted downloaded file'**
  String get trackActionDeletedFile;

  /// No description provided for @trackActionDeleteFileFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not delete downloaded file'**
  String get trackActionDeleteFileFailed;

  /// No description provided for @shuffleBy.
  ///
  /// In en, this message translates to:
  /// **'Shuffle By'**
  String get shuffleBy;

  /// No description provided for @shuffleSelectLibrary.
  ///
  /// In en, this message translates to:
  /// **'Select Library'**
  String get shuffleSelectLibrary;

  /// No description provided for @shuffleSelectGenre.
  ///
  /// In en, this message translates to:
  /// **'Select Genre'**
  String get shuffleSelectGenre;

  /// No description provided for @shuffleLibrary.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get shuffleLibrary;

  /// No description provided for @shuffleGenre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get shuffleGenre;

  /// No description provided for @shuffleNoLibraries.
  ///
  /// In en, this message translates to:
  /// **'No compatible libraries available.'**
  String get shuffleNoLibraries;

  /// No description provided for @shuffleNoGenres.
  ///
  /// In en, this message translates to:
  /// **'No genres found for this shuffle mode.'**
  String get shuffleNoGenres;

  /// No description provided for @posterDisplayTitle.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get posterDisplayTitle;

  /// No description provided for @posterImageType.
  ///
  /// In en, this message translates to:
  /// **'Image Type'**
  String get posterImageType;

  /// No description provided for @imageTypePoster.
  ///
  /// In en, this message translates to:
  /// **'Poster'**
  String get imageTypePoster;

  /// No description provided for @imageTypeThumbnail.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail'**
  String get imageTypeThumbnail;

  /// No description provided for @imageTypeBanner.
  ///
  /// In en, this message translates to:
  /// **'Banner'**
  String get imageTypeBanner;

  /// No description provided for @playlistAddFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to add to playlist'**
  String get playlistAddFailed;

  /// No description provided for @playlistCreateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to create playlist'**
  String get playlistCreateFailed;

  /// No description provided for @playlistNew.
  ///
  /// In en, this message translates to:
  /// **'New Playlist'**
  String get playlistNew;

  /// No description provided for @playlistCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get playlistCreate;

  /// No description provided for @playlistCreateNew.
  ///
  /// In en, this message translates to:
  /// **'Create New Playlist'**
  String get playlistCreateNew;

  /// No description provided for @playlistNoneFound.
  ///
  /// In en, this message translates to:
  /// **'No playlists found'**
  String get playlistNoneFound;

  /// No description provided for @addToPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Add to Playlist'**
  String get addToPlaylist;

  /// No description provided for @lyricsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'No lyrics available'**
  String get lyricsNotAvailable;

  /// No description provided for @upNext.
  ///
  /// In en, this message translates to:
  /// **'Up Next'**
  String get upNext;

  /// No description provided for @playNext.
  ///
  /// In en, this message translates to:
  /// **'Play Next'**
  String get playNext;

  /// No description provided for @stillWatchingContent.
  ///
  /// In en, this message translates to:
  /// **'Playback has been paused. Are you still watching?'**
  String get stillWatchingContent;

  /// No description provided for @stillWatchingStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stillWatchingStop;

  /// No description provided for @stillWatchingContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get stillWatchingContinue;

  /// No description provided for @skipSegment.
  ///
  /// In en, this message translates to:
  /// **'Skip {segment}'**
  String skipSegment(String segment);

  /// No description provided for @liveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get liveTv;

  /// No description provided for @continueWatchingAndNextUp.
  ///
  /// In en, this message translates to:
  /// **'Continue Watching & Next Up'**
  String get continueWatchingAndNextUp;

  /// No description provided for @downloadingBatchProgress.
  ///
  /// In en, this message translates to:
  /// **'Downloading {current}/{total} — {fileName}'**
  String downloadingBatchProgress(int current, int total, String fileName);

  /// No description provided for @downloadingFile.
  ///
  /// In en, this message translates to:
  /// **'Downloading {fileName}'**
  String downloadingFile(String fileName);

  /// No description provided for @nextEpisode.
  ///
  /// In en, this message translates to:
  /// **'Next Episode'**
  String get nextEpisode;

  /// No description provided for @moreFromThisSeason.
  ///
  /// In en, this message translates to:
  /// **'More From This Season'**
  String get moreFromThisSeason;

  /// Tooltip label for playback speed control in player
  ///
  /// In en, this message translates to:
  /// **'Playback speed'**
  String get playerTooltipPlaybackSpeed;

  /// Tooltip label for active cast controls button in player
  ///
  /// In en, this message translates to:
  /// **'Cast controls'**
  String get playerTooltipCastControls;

  /// Tooltip label for playback quality/bitrate control in player
  ///
  /// In en, this message translates to:
  /// **'Bitrate'**
  String get playerTooltipPlaybackQuality;

  /// Tooltip label for entering fullscreen in player
  ///
  /// In en, this message translates to:
  /// **'Enter fullscreen'**
  String get playerTooltipEnterFullscreen;

  /// Tooltip label for exiting fullscreen in player
  ///
  /// In en, this message translates to:
  /// **'Exit fullscreen'**
  String get playerTooltipExitFullscreen;

  /// Tooltip label for enabling always-on-top in desktop player
  ///
  /// In en, this message translates to:
  /// **'Float on top'**
  String get playerTooltipFloatOnTop;

  /// Tooltip label for disabling always-on-top in desktop player
  ///
  /// In en, this message translates to:
  /// **'Disable float on top'**
  String get playerTooltipExitFloatOnTop;

  /// Tooltip label for locking landscape orientation in player
  ///
  /// In en, this message translates to:
  /// **'Lock landscape'**
  String get playerTooltipLockLandscape;

  /// Tooltip label for unlocking orientation lock in player
  ///
  /// In en, this message translates to:
  /// **'Allow rotation'**
  String get playerTooltipUnlockOrientation;

  /// Tooltip label for previous item control in player
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get playerTooltipPrevious;

  /// Tooltip label for seek back control in player
  ///
  /// In en, this message translates to:
  /// **'Seek back'**
  String get playerTooltipSeekBack;

  /// Tooltip label for seek forward control in player
  ///
  /// In en, this message translates to:
  /// **'Seek forward'**
  String get playerTooltipSeekForward;

  /// Context menu action to mark an item as watched
  ///
  /// In en, this message translates to:
  /// **'Mark as Watched'**
  String get contextMenuMarkWatched;

  /// Context menu action to mark an item as unwatched
  ///
  /// In en, this message translates to:
  /// **'Mark as Unwatched'**
  String get contextMenuMarkUnwatched;

  /// Context menu action to add an item to favorites
  ///
  /// In en, this message translates to:
  /// **'Add to Favorites'**
  String get contextMenuAddToFavorites;

  /// Context menu action to remove an item from favorites
  ///
  /// In en, this message translates to:
  /// **'Remove from Favorites'**
  String get contextMenuRemoveFromFavorites;

  /// Context menu action to navigate to the parent series of an episode
  ///
  /// In en, this message translates to:
  /// **'Go to Series'**
  String get contextMenuGoToSeries;

  /// No description provided for @settingsAdministrationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access the server administration panel'**
  String get settingsAdministrationSubtitle;

  /// No description provided for @settingsAccountSecurity.
  ///
  /// In en, this message translates to:
  /// **'Account & Security'**
  String get settingsAccountSecurity;

  /// No description provided for @settingsAccountSecuritySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Authentication, PIN code, and parental controls'**
  String get settingsAccountSecuritySubtitle;

  /// No description provided for @settingsPersonalization.
  ///
  /// In en, this message translates to:
  /// **'Personalization'**
  String get settingsPersonalization;

  /// No description provided for @settingsPersonalizationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Theme, navigation, home rows, and library visibility'**
  String get settingsPersonalizationSubtitle;

  /// No description provided for @settingsDynamicContent.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Content'**
  String get settingsDynamicContent;

  /// No description provided for @settingsDynamicContentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Media Bar and visual overlays'**
  String get settingsDynamicContentSubtitle;

  /// No description provided for @settingsPlaybackSyncplay.
  ///
  /// In en, this message translates to:
  /// **'Playback & SyncPlay'**
  String get settingsPlaybackSyncplay;

  /// No description provided for @settingsPlaybackSyncplaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Audio/video settings, subtitles, downloads, and SyncPlay controls'**
  String get settingsPlaybackSyncplaySubtitle;

  /// No description provided for @settingsIntegrationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Plugin sync, Seerr, ratings, and more'**
  String get settingsIntegrationsSubtitle;

  /// No description provided for @settingsAboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App version, legal information, and credits'**
  String get settingsAboutSubtitle;

  /// No description provided for @settingsAuthenticationSection.
  ///
  /// In en, this message translates to:
  /// **'AUTHENTICATION'**
  String get settingsAuthenticationSection;

  /// No description provided for @settingsSortServersBy.
  ///
  /// In en, this message translates to:
  /// **'Sort Servers By'**
  String get settingsSortServersBy;

  /// No description provided for @settingsLastUsed.
  ///
  /// In en, this message translates to:
  /// **'Last Used'**
  String get settingsLastUsed;

  /// No description provided for @settingsAlphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get settingsAlphabetical;

  /// No description provided for @settingsPrivacyAndSafetySection.
  ///
  /// In en, this message translates to:
  /// **'PRIVACY & SAFETY'**
  String get settingsPrivacyAndSafetySection;

  /// No description provided for @settingsBlockedRatings.
  ///
  /// In en, this message translates to:
  /// **'Blocked Ratings'**
  String get settingsBlockedRatings;

  /// No description provided for @settingsGeneralStyle.
  ///
  /// In en, this message translates to:
  /// **'General Style'**
  String get settingsGeneralStyle;

  /// No description provided for @settingsGeneralStyleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Theme accents, backdrops, watched indicators, and theme music'**
  String get settingsGeneralStyleSubtitle;

  /// No description provided for @settingsHomePage.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get settingsHomePage;

  /// No description provided for @settingsHomePageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sections, image types, overlays, and media previews'**
  String get settingsHomePageSubtitle;

  /// No description provided for @settingsLibrariesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Library visibility, folder view, and multi-server behavior'**
  String get settingsLibrariesSubtitle;

  /// No description provided for @settingsTwentyFourHourClock.
  ///
  /// In en, this message translates to:
  /// **'24-Hour Clock'**
  String get settingsTwentyFourHourClock;

  /// No description provided for @settingsTwentyFourHourClockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use 24-hour time formatting wherever the clock is shown'**
  String get settingsTwentyFourHourClockSubtitle;

  /// No description provided for @settingsShowShuffleButtonInNavigation.
  ///
  /// In en, this message translates to:
  /// **'Show the shuffle button in the navigation bar'**
  String get settingsShowShuffleButtonInNavigation;

  /// No description provided for @settingsShowGenresButtonInNavigation.
  ///
  /// In en, this message translates to:
  /// **'Show the genres button in the navigation bar'**
  String get settingsShowGenresButtonInNavigation;

  /// No description provided for @settingsShowFavoritesButtonInNavigation.
  ///
  /// In en, this message translates to:
  /// **'Show the favorites button in the navigation bar'**
  String get settingsShowFavoritesButtonInNavigation;

  /// No description provided for @settingsShowLibrariesButtonInNavigation.
  ///
  /// In en, this message translates to:
  /// **'Show the libraries button in the navigation bar'**
  String get settingsShowLibrariesButtonInNavigation;

  /// No description provided for @settingsLibraryVisibilitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Toggle home page visibility per library. Restart Moonfin for changes to take effect.'**
  String get settingsLibraryVisibilitySubtitle;

  /// No description provided for @settingsMediaBarAndLocalPreviews.
  ///
  /// In en, this message translates to:
  /// **'Media Bar & Local Previews'**
  String get settingsMediaBarAndLocalPreviews;

  /// No description provided for @settingsVisualOverlays.
  ///
  /// In en, this message translates to:
  /// **'Visual Overlays'**
  String get settingsVisualOverlays;

  /// No description provided for @settingsSeasonalSurprise.
  ///
  /// In en, this message translates to:
  /// **'Seasonal Surprise'**
  String get settingsSeasonalSurprise;

  /// No description provided for @settingsMetadataAndRatings.
  ///
  /// In en, this message translates to:
  /// **'Metadata & Ratings'**
  String get settingsMetadataAndRatings;

  /// No description provided for @settingsPluginScreenDescription.
  ///
  /// In en, this message translates to:
  /// **'Moonbase powers server-side integrations including additional rating sources, Seerr requests, and synced preferences.'**
  String get settingsPluginScreenDescription;

  /// No description provided for @settingsOfflineDownloads.
  ///
  /// In en, this message translates to:
  /// **'Offline Downloads'**
  String get settingsOfflineDownloads;

  /// No description provided for @settingsHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get settingsHigh;

  /// No description provided for @settingsLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get settingsLow;

  /// No description provided for @settingsCustomPath.
  ///
  /// In en, this message translates to:
  /// **'Custom Path'**
  String get settingsCustomPath;

  /// No description provided for @settingsEnterDownloadFolderPath.
  ///
  /// In en, this message translates to:
  /// **'Enter download folder path'**
  String get settingsEnterDownloadFolderPath;

  /// No description provided for @settingsConcurrentDownloads.
  ///
  /// In en, this message translates to:
  /// **'Concurrent Downloads'**
  String get settingsConcurrentDownloads;

  /// No description provided for @settingsConcurrentDownloadsDescription.
  ///
  /// In en, this message translates to:
  /// **'Maximum number of items to download at once.'**
  String get settingsConcurrentDownloadsDescription;

  /// No description provided for @settingsAppInfo.
  ///
  /// In en, this message translates to:
  /// **'APP INFO'**
  String get settingsAppInfo;

  /// No description provided for @settingsReportAnIssue.
  ///
  /// In en, this message translates to:
  /// **'Report an Issue'**
  String get settingsReportAnIssue;

  /// No description provided for @settingsReportAnIssueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open the issue tracker on GitHub'**
  String get settingsReportAnIssueSubtitle;

  /// No description provided for @settingsJoinDiscord.
  ///
  /// In en, this message translates to:
  /// **'Join Discord'**
  String get settingsJoinDiscord;

  /// No description provided for @settingsJoinDiscordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chat with the community'**
  String get settingsJoinDiscordSubtitle;

  /// No description provided for @settingsJoinTheDiscord.
  ///
  /// In en, this message translates to:
  /// **'Join the Discord'**
  String get settingsJoinTheDiscord;

  /// No description provided for @settingsSupportMoonfin.
  ///
  /// In en, this message translates to:
  /// **'Support Moonfin'**
  String get settingsSupportMoonfin;

  /// No description provided for @settingsSupportMoonfinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Donate a coffee to the developer'**
  String get settingsSupportMoonfinSubtitle;

  /// No description provided for @settingsLegal.
  ///
  /// In en, this message translates to:
  /// **'LEGAL'**
  String get settingsLegal;

  /// No description provided for @settingsLicenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get settingsLicenses;

  /// No description provided for @settingsOpenSourceLicenseNotices.
  ///
  /// In en, this message translates to:
  /// **'Open-source license notices'**
  String get settingsOpenSourceLicenseNotices;

  /// No description provided for @settingsPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// No description provided for @settingsPrivacyPolicySubtitle.
  ///
  /// In en, this message translates to:
  /// **'How Moonfin handles your data'**
  String get settingsPrivacyPolicySubtitle;

  /// No description provided for @settingsCheckForUpdates.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get settingsCheckForUpdates;

  /// No description provided for @settingsCheckForUpdatesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check for the latest Moonfin release'**
  String get settingsCheckForUpdatesSubtitle;

  /// No description provided for @settingsPoweredByFlutter.
  ///
  /// In en, this message translates to:
  /// **'Powered by Flutter'**
  String get settingsPoweredByFlutter;

  /// Plural label for number of license notices
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {# license notice} other {# license notices}}'**
  String settingsLicenseNoticesCount(int count);

  /// No description provided for @settingsBoth.
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get settingsBoth;

  /// No description provided for @settingsShuffleContentTypeFilter.
  ///
  /// In en, this message translates to:
  /// **'Shuffle Content Type Filter'**
  String get settingsShuffleContentTypeFilter;

  /// No description provided for @settingsVideoPlaybackPreferences.
  ///
  /// In en, this message translates to:
  /// **'Video Playback Preferences'**
  String get settingsVideoPlaybackPreferences;

  /// No description provided for @settingsVideoPlaybackPreferencesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Core video engine and streaming quality settings'**
  String get settingsVideoPlaybackPreferencesSubtitle;

  /// No description provided for @settingsAudioPreferences.
  ///
  /// In en, this message translates to:
  /// **'Audio Preferences'**
  String get settingsAudioPreferences;

  /// No description provided for @settingsAudioPreferencesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Audio tracks, processing, and passthrough options'**
  String get settingsAudioPreferencesSubtitle;

  /// No description provided for @settingsAutomationAndQueue.
  ///
  /// In en, this message translates to:
  /// **'Automation & Queue'**
  String get settingsAutomationAndQueue;

  /// No description provided for @settingsAutomationAndQueueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Automated playback and sequencing'**
  String get settingsAutomationAndQueueSubtitle;

  /// No description provided for @settingsOfflineDownloadsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Download quality, storage limits, and queue size'**
  String get settingsOfflineDownloadsSubtitle;

  /// No description provided for @settingsSyncplaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Synchronization logic for group sessions'**
  String get settingsSyncplaySubtitle;

  /// No description provided for @settingsAdvancedOptionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Specialized player features. Use with caution, as some options may cause playback issues'**
  String get settingsAdvancedOptionsSubtitle;

  /// No description provided for @settingsSkipIntrosAndOutros.
  ///
  /// In en, this message translates to:
  /// **'Skip Intros and Outros?'**
  String get settingsSkipIntrosAndOutros;

  /// No description provided for @settingsPromptUser.
  ///
  /// In en, this message translates to:
  /// **'Prompt User'**
  String get settingsPromptUser;

  /// No description provided for @settingsSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get settingsSkip;

  /// No description provided for @settingsDoNothing.
  ///
  /// In en, this message translates to:
  /// **'Do Nothing'**
  String get settingsDoNothing;

  /// No description provided for @settingsMaxBitrateDescription.
  ///
  /// In en, this message translates to:
  /// **'Cap the streaming bitrate. Content above this threshold will be transcoded to fit.'**
  String get settingsMaxBitrateDescription;

  /// No description provided for @settingsMaxResolutionDescription.
  ///
  /// In en, this message translates to:
  /// **'Limit the maximum resolution the player will request. Higher-resolution content will be transcoded down.'**
  String get settingsMaxResolutionDescription;

  /// No description provided for @settingsPlayerZoomDescription.
  ///
  /// In en, this message translates to:
  /// **'How video should be scaled to fit the screen.'**
  String get settingsPlayerZoomDescription;

  /// No description provided for @settingsPlaybackEngineAndroidTv.
  ///
  /// In en, this message translates to:
  /// **'Playback Engine (Android TV)'**
  String get settingsPlaybackEngineAndroidTv;

  /// No description provided for @settingsPlaybackEngineAndroidTvDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose the default playback engine on Android TV devices. Changes apply to the next playback session.'**
  String get settingsPlaybackEngineAndroidTvDescription;

  /// No description provided for @settingsPlaybackEngineMedia3Recommended.
  ///
  /// In en, this message translates to:
  /// **'Media3 (recommended)'**
  String get settingsPlaybackEngineMedia3Recommended;

  /// No description provided for @settingsPlaybackEngineMedia3Legacy.
  ///
  /// In en, this message translates to:
  /// **'Media3 (legacy)'**
  String get settingsPlaybackEngineMedia3Legacy;

  /// No description provided for @settingsPlaybackEngineMpvLegacy.
  ///
  /// In en, this message translates to:
  /// **'mpv (legacy)'**
  String get settingsPlaybackEngineMpvLegacy;

  /// No description provided for @settingsPlaybackEngineMpvRecommended.
  ///
  /// In en, this message translates to:
  /// **'mpv (recommended)'**
  String get settingsPlaybackEngineMpvRecommended;

  /// No description provided for @settingsDolbyVisionFallback.
  ///
  /// In en, this message translates to:
  /// **'Dolby Vision Fallback'**
  String get settingsDolbyVisionFallback;

  /// No description provided for @settingsDolbyVisionFallbackDescription.
  ///
  /// In en, this message translates to:
  /// **'Behavior for Dolby Vision titles on devices without Dolby Vision decoding.'**
  String get settingsDolbyVisionFallbackDescription;

  /// No description provided for @settingsAskEachTime.
  ///
  /// In en, this message translates to:
  /// **'Ask each time'**
  String get settingsAskEachTime;

  /// No description provided for @settingsPreferHdr10Fallback.
  ///
  /// In en, this message translates to:
  /// **'Prefer HDR10 fallback'**
  String get settingsPreferHdr10Fallback;

  /// No description provided for @settingsPreferServerTranscode.
  ///
  /// In en, this message translates to:
  /// **'Prefer server transcode'**
  String get settingsPreferServerTranscode;

  /// No description provided for @settingsDolbyVisionProfile7DirectPlay.
  ///
  /// In en, this message translates to:
  /// **'Dolby Vision Profile 7 Direct Play'**
  String get settingsDolbyVisionProfile7DirectPlay;

  /// No description provided for @settingsDolbyVisionProfile7DirectPlayDescription.
  ///
  /// In en, this message translates to:
  /// **'Controls whether Dolby Vision profile 7 enhancement-layer streams should direct play.'**
  String get settingsDolbyVisionProfile7DirectPlayDescription;

  /// No description provided for @settingsAutoAftkrtEnabled.
  ///
  /// In en, this message translates to:
  /// **'Auto (AFTKRT enabled)'**
  String get settingsAutoAftkrtEnabled;

  /// No description provided for @settingsEnabledOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Enabled on this device'**
  String get settingsEnabledOnThisDevice;

  /// No description provided for @settingsDisabledPreferTranscode.
  ///
  /// In en, this message translates to:
  /// **'Disabled (prefer transcode)'**
  String get settingsDisabledPreferTranscode;

  /// No description provided for @settingsResumeRewindDescription.
  ///
  /// In en, this message translates to:
  /// **'When resuming playback (from Continue Watching or a media item page), how many seconds should be rewound?'**
  String get settingsResumeRewindDescription;

  /// No description provided for @settingsUnpauseRewindDescription.
  ///
  /// In en, this message translates to:
  /// **'When resuming playback after pressing the pause button, how many seconds should be rewound?'**
  String get settingsUnpauseRewindDescription;

  /// No description provided for @settingsSkipBackLengthDescription.
  ///
  /// In en, this message translates to:
  /// **'How many seconds to jump back after pressing the rewind button.'**
  String get settingsSkipBackLengthDescription;

  /// No description provided for @settingsOneSecond.
  ///
  /// In en, this message translates to:
  /// **'1 second'**
  String get settingsOneSecond;

  /// No description provided for @settingsThreeSeconds.
  ///
  /// In en, this message translates to:
  /// **'3 seconds'**
  String get settingsThreeSeconds;

  /// No description provided for @settingsFortyFiveSeconds.
  ///
  /// In en, this message translates to:
  /// **'45 seconds'**
  String get settingsFortyFiveSeconds;

  /// No description provided for @settingsSixtySeconds.
  ///
  /// In en, this message translates to:
  /// **'60 seconds'**
  String get settingsSixtySeconds;

  /// No description provided for @settingsSkipForwardLengthDescription.
  ///
  /// In en, this message translates to:
  /// **'How many seconds to jump forward after pressing the fast forward button.'**
  String get settingsSkipForwardLengthDescription;

  /// No description provided for @settingsBitstreamAc3ToExternalDecoder.
  ///
  /// In en, this message translates to:
  /// **'Bitstream AC3 to external decoder'**
  String get settingsBitstreamAc3ToExternalDecoder;

  /// No description provided for @settingsCinemaMode.
  ///
  /// In en, this message translates to:
  /// **'Cinema Mode'**
  String get settingsCinemaMode;

  /// No description provided for @settingsCinemaModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Play trailers/prerolls before a main feature'**
  String get settingsCinemaModeSubtitle;

  /// No description provided for @settingsNextUpDisplayDescription.
  ///
  /// In en, this message translates to:
  /// **'Extended shows a full card with episode artwork and description. Minimal shows a compact countdown overlay. Disabled hides the prompt entirely.'**
  String get settingsNextUpDisplayDescription;

  /// No description provided for @settingsShort.
  ///
  /// In en, this message translates to:
  /// **'Short'**
  String get settingsShort;

  /// No description provided for @settingsLong.
  ///
  /// In en, this message translates to:
  /// **'Long'**
  String get settingsLong;

  /// No description provided for @settingsVeryLong.
  ///
  /// In en, this message translates to:
  /// **'Very Long'**
  String get settingsVeryLong;

  /// No description provided for @settingsVideoStartDelay.
  ///
  /// In en, this message translates to:
  /// **'Video Start Delay'**
  String get settingsVideoStartDelay;

  /// Milliseconds duration label
  ///
  /// In en, this message translates to:
  /// **'{value} ms'**
  String settingsMillisecondsValue(int value);

  /// No description provided for @settingsLiveTvDirect.
  ///
  /// In en, this message translates to:
  /// **'Live TV Direct'**
  String get settingsLiveTvDirect;

  /// No description provided for @settingsLiveTvDirectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable direct play for Live TV'**
  String get settingsLiveTvDirectSubtitle;

  /// No description provided for @settingsOpenGroups.
  ///
  /// In en, this message translates to:
  /// **'Open Groups'**
  String get settingsOpenGroups;

  /// No description provided for @settingsOpenGroupsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create, join, or manage SyncPlay groups'**
  String get settingsOpenGroupsSubtitle;

  /// No description provided for @settingsSyncplayEnabled.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay Enabled'**
  String get settingsSyncplayEnabled;

  /// No description provided for @settingsSyncplayEnabledSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable group watching features'**
  String get settingsSyncplayEnabledSubtitle;

  /// No description provided for @settingsSyncplayButton.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay Button'**
  String get settingsSyncplayButton;

  /// No description provided for @settingsSyncplayButtonSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show the SyncPlay button on the navigation bar'**
  String get settingsSyncplayButtonSubtitle;

  /// No description provided for @settingsSyncplayAdvancedCorrection.
  ///
  /// In en, this message translates to:
  /// **'Advanced Correction'**
  String get settingsSyncplayAdvancedCorrection;

  /// No description provided for @settingsSyncplayAdvancedCorrectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enable fine-grained sync logic'**
  String get settingsSyncplayAdvancedCorrectionSubtitle;

  /// No description provided for @settingsSyncplaySyncCorrection.
  ///
  /// In en, this message translates to:
  /// **'Sync Correction'**
  String get settingsSyncplaySyncCorrection;

  /// No description provided for @settingsSyncplaySyncCorrectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatically adjust playback to stay in sync'**
  String get settingsSyncplaySyncCorrectionSubtitle;

  /// No description provided for @settingsSyncplaySpeedToSync.
  ///
  /// In en, this message translates to:
  /// **'Speed to Sync'**
  String get settingsSyncplaySpeedToSync;

  /// No description provided for @settingsSyncplaySpeedToSyncSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use playback speed adjustment to sync'**
  String get settingsSyncplaySpeedToSyncSubtitle;

  /// No description provided for @settingsSyncplaySkipToSync.
  ///
  /// In en, this message translates to:
  /// **'Skip to Sync'**
  String get settingsSyncplaySkipToSync;

  /// No description provided for @settingsSyncplaySkipToSyncSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use seeking to sync'**
  String get settingsSyncplaySkipToSyncSubtitle;

  /// No description provided for @settingsSyncplayMinimumSpeedDelay.
  ///
  /// In en, this message translates to:
  /// **'Minimum Speed Delay'**
  String get settingsSyncplayMinimumSpeedDelay;

  /// No description provided for @settingsSyncplayMaximumSpeedDelay.
  ///
  /// In en, this message translates to:
  /// **'Maximum Speed Delay'**
  String get settingsSyncplayMaximumSpeedDelay;

  /// No description provided for @settingsSyncplaySpeedDuration.
  ///
  /// In en, this message translates to:
  /// **'Speed Duration'**
  String get settingsSyncplaySpeedDuration;

  /// No description provided for @settingsSyncplayMinimumSkipDelay.
  ///
  /// In en, this message translates to:
  /// **'Minimum Skip Delay'**
  String get settingsSyncplayMinimumSkipDelay;

  /// No description provided for @settingsSyncplayExtraOffset.
  ///
  /// In en, this message translates to:
  /// **'SyncPlay Extra Offset'**
  String get settingsSyncplayExtraOffset;

  /// No description provided for @onNow.
  ///
  /// In en, this message translates to:
  /// **'On Now'**
  String get onNow;

  /// No description provided for @collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// No description provided for @lastPlayed.
  ///
  /// In en, this message translates to:
  /// **'Last Played'**
  String get lastPlayed;

  /// Library name display with server suffix for multi-server views
  ///
  /// In en, this message translates to:
  /// **'{libraryName} ({serverName})'**
  String libraryNameWithServer(String libraryName, String serverName);

  /// Row title for latest media in a specific library
  ///
  /// In en, this message translates to:
  /// **'Latest {libraryName}'**
  String latestLibraryName(String libraryName);

  /// Setting title: automatically start the next episode
  ///
  /// In en, this message translates to:
  /// **'Autoplay Next Episode'**
  String get autoplayNextEpisode;

  /// Setting subtitle for autoplay next episode
  ///
  /// In en, this message translates to:
  /// **'Automatically play the next episode when available.'**
  String get autoplayNextEpisodeSubtitle;

  /// Setting title: skip silent audio segments during playback
  ///
  /// In en, this message translates to:
  /// **'Skip silence'**
  String get skipSilenceTitle;

  /// Setting subtitle for skip silence
  ///
  /// In en, this message translates to:
  /// **'Automatically skip silent audio segments when supported by the stream.'**
  String get skipSilenceSubtitle;

  /// Setting title: allow equalizer apps to attach to Media3
  ///
  /// In en, this message translates to:
  /// **'Allow external audio effects'**
  String get allowExternalAudioEffectsTitle;

  /// Setting subtitle for external audio effects
  ///
  /// In en, this message translates to:
  /// **'Allow equalizer and effects apps (e.g. Wavelet) to attach to Media3 playback sessions.'**
  String get allowExternalAudioEffectsSubtitle;

  /// Setting title: force non-tunneled video playback
  ///
  /// In en, this message translates to:
  /// **'Disable tunneling'**
  String get disableTunnelingTitle;

  /// Setting subtitle for disable tunneling
  ///
  /// In en, this message translates to:
  /// **'Force non-tunneled playback. Useful on devices with tunneling audio/video discontinuities.'**
  String get disableTunnelingSubtitle;

  /// Setting title: play DV P7 as HDR10 HEVC on non-DV devices
  ///
  /// In en, this message translates to:
  /// **'Map Dolby Vision profile 7 to HEVC'**
  String get mapDolbyVisionP7Title;

  /// Setting subtitle for DV P7 to HEVC mapping
  ///
  /// In en, this message translates to:
  /// **'Play Dolby Vision profile 7 streams as HDR10-compatible HEVC on non-DV devices.'**
  String get mapDolbyVisionP7Subtitle;

  /// Setting title: apply colours/positioning from the subtitle track
  ///
  /// In en, this message translates to:
  /// **'Use embedded subtitle styles'**
  String get subtitlesUseEmbeddedStyles;

  /// Setting subtitle for embedded styles toggle
  ///
  /// In en, this message translates to:
  /// **'Apply colours, fonts, and positioning embedded in the subtitle track. Disable to use your caption style preferences instead.'**
  String get subtitlesUseEmbeddedStylesSubtitle;

  /// Setting title: apply font sizes from the subtitle track
  ///
  /// In en, this message translates to:
  /// **'Use embedded subtitle font sizes'**
  String get subtitlesUseEmbeddedFontSizes;

  /// Setting subtitle for embedded font sizes toggle
  ///
  /// In en, this message translates to:
  /// **'Apply font-size hints embedded in the subtitle track. Disable to use the subtitle size from your style preferences.'**
  String get subtitlesUseEmbeddedFontSizesSubtitle;

  /// Label for setting to toggle detailed or minimal subrow on library pages
  ///
  /// In en, this message translates to:
  /// **'Use Detailed Sub-Headings'**
  String get useDetailedSubHeadings;

  /// Subtitle for the use detailed sub headings setting
  ///
  /// In en, this message translates to:
  /// **'Show detailed or minimal subrow on Library pages.'**
  String get useDetailedSubHeadingsDescription;

  /// No description provided for @savedThemesDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete saved theme?'**
  String get savedThemesDeleteDialogTitle;

  /// Confirmation message for deleting a saved custom theme
  ///
  /// In en, this message translates to:
  /// **'Remove \"{themeName}\" from this device cache?'**
  String savedThemesDeleteDialogMessage(String themeName);

  /// Status message shown after deleting a saved custom theme
  ///
  /// In en, this message translates to:
  /// **'Deleted \"{themeName}\" from this device.'**
  String savedThemesDeletedMessage(String themeName);

  /// Status message shown when deleting a saved custom theme fails
  ///
  /// In en, this message translates to:
  /// **'Could not delete \"{themeName}\".'**
  String savedThemesDeleteFailedMessage(String themeName);

  /// No description provided for @savedThemesTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved themes'**
  String get savedThemesTitle;

  /// No description provided for @savedThemesDescription.
  ///
  /// In en, this message translates to:
  /// **'These are themes downloaded from the Moonfin plugin for the current server. Deleting removes only this local copy.'**
  String get savedThemesDescription;

  /// No description provided for @savedThemesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No saved themes were found for this server.'**
  String get savedThemesEmpty;

  /// Subtitle showing the saved theme id when it is currently selected
  ///
  /// In en, this message translates to:
  /// **'{themeId} • Currently active'**
  String savedThemesCurrentThemeId(String themeId);

  /// No description provided for @savedThemesDeleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete saved theme'**
  String get savedThemesDeleteTooltip;

  /// No description provided for @savedThemesManageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage downloaded plugin themes on this device'**
  String get savedThemesManageSubtitle;

  /// No description provided for @kefinTweaksTitle.
  ///
  /// In en, this message translates to:
  /// **'KefinTweaks'**
  String get kefinTweaksTitle;

  /// No description provided for @homeScreenSectionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Home Screen Sections'**
  String get homeScreenSectionsTitle;

  /// No description provided for @themeEditor.
  ///
  /// In en, this message translates to:
  /// **'Theme Editor'**
  String get themeEditor;

  /// No description provided for @themeEditorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open the Moonfin Theme Editor in your browser'**
  String get themeEditorSubtitle;

  /// No description provided for @homeScreen.
  ///
  /// In en, this message translates to:
  /// **'Home Screen'**
  String get homeScreen;

  /// No description provided for @bottomBar.
  ///
  /// In en, this message translates to:
  /// **'Bottom Bar'**
  String get bottomBar;

  /// No description provided for @homeRowsStyleClassic.
  ///
  /// In en, this message translates to:
  /// **'Classic'**
  String get homeRowsStyleClassic;

  /// No description provided for @homeRowsStyleModern.
  ///
  /// In en, this message translates to:
  /// **'Modern'**
  String get homeRowsStyleModern;

  /// No description provided for @homeRowsSection.
  ///
  /// In en, this message translates to:
  /// **'Home Rows'**
  String get homeRowsSection;

  /// No description provided for @rowsType.
  ///
  /// In en, this message translates to:
  /// **'Rows Type'**
  String get rowsType;

  /// No description provided for @rowsTypeDescription.
  ///
  /// In en, this message translates to:
  /// **'Classic keeps per-row image type and info overlay. Modern uses portrait-to-backdrop rows.'**
  String get rowsTypeDescription;

  /// No description provided for @displayFavoritesRows.
  ///
  /// In en, this message translates to:
  /// **'Display Favorites Rows'**
  String get displayFavoritesRows;

  /// No description provided for @displayFavoritesRowsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show Favorite Movies, Series, and other favorite rows in Home Sections.'**
  String get displayFavoritesRowsSubtitle;

  /// No description provided for @favoritesRowSorting.
  ///
  /// In en, this message translates to:
  /// **'Favorites Row Sorting'**
  String get favoritesRowSorting;

  /// No description provided for @favoritesRowSortingDescription.
  ///
  /// In en, this message translates to:
  /// **'Sort Favorites rows by date added, release date, alphabetically, and more.'**
  String get favoritesRowSortingDescription;

  /// No description provided for @displayCollectionsRows.
  ///
  /// In en, this message translates to:
  /// **'Display Collections Rows'**
  String get displayCollectionsRows;

  /// No description provided for @displayCollectionsRowsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show Collections rows in Home Sections.'**
  String get displayCollectionsRowsSubtitle;

  /// No description provided for @collectionsRowSorting.
  ///
  /// In en, this message translates to:
  /// **'Collections Row Sorting'**
  String get collectionsRowSorting;

  /// No description provided for @collectionsRowSortingDescription.
  ///
  /// In en, this message translates to:
  /// **'Sort Collections rows by date added, release date, alphabetically, and more.'**
  String get collectionsRowSortingDescription;

  /// No description provided for @displayGenresRows.
  ///
  /// In en, this message translates to:
  /// **'Display Genres Rows'**
  String get displayGenresRows;

  /// No description provided for @displayGenresRowsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show Genres rows in Home Sections.'**
  String get displayGenresRowsSubtitle;

  /// No description provided for @genresRowSorting.
  ///
  /// In en, this message translates to:
  /// **'Genres Row Sorting'**
  String get genresRowSorting;

  /// No description provided for @genresRowSortingDescription.
  ///
  /// In en, this message translates to:
  /// **'Sort Genres rows by date added, release date, alphabetically, and more.'**
  String get genresRowSortingDescription;

  /// No description provided for @genresRowItems.
  ///
  /// In en, this message translates to:
  /// **'Genres Row Items'**
  String get genresRowItems;

  /// No description provided for @genresRowItemsDescription.
  ///
  /// In en, this message translates to:
  /// **'Show Movies, Series, or both in Genres rows.'**
  String get genresRowItemsDescription;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @cardSize.
  ///
  /// In en, this message translates to:
  /// **'Card Size'**
  String get cardSize;

  /// No description provided for @externalPlayerApp.
  ///
  /// In en, this message translates to:
  /// **'External player app'**
  String get externalPlayerApp;

  /// No description provided for @externalPlayerAskEachTimeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show app chooser when playback starts.'**
  String get externalPlayerAskEachTimeSubtitle;

  /// No description provided for @loadingInstalledPlayers.
  ///
  /// In en, this message translates to:
  /// **'Loading installed players...'**
  String get loadingInstalledPlayers;

  /// No description provided for @connection.
  ///
  /// In en, this message translates to:
  /// **'Connection'**
  String get connection;

  /// No description provided for @audioTranscodeTarget.
  ///
  /// In en, this message translates to:
  /// **'Audio Transcode Target'**
  String get audioTranscodeTarget;

  /// No description provided for @passthrough.
  ///
  /// In en, this message translates to:
  /// **'Passthrough'**
  String get passthrough;

  /// No description provided for @supportedOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Supported on this device'**
  String get supportedOnThisDevice;

  /// No description provided for @notSupportedOnThisDevice.
  ///
  /// In en, this message translates to:
  /// **'Not Supported on this device'**
  String get notSupportedOnThisDevice;

  /// No description provided for @settingsAudioDtsXPassthrough.
  ///
  /// In en, this message translates to:
  /// **'DTS:X (DTS UHD) Passthrough'**
  String get settingsAudioDtsXPassthrough;

  /// No description provided for @settingsAudioBitstreamDtsXToExternalDecoder.
  ///
  /// In en, this message translates to:
  /// **'Bitstream DTS:X (DTS UHD) to external decoder.'**
  String get settingsAudioBitstreamDtsXToExternalDecoder;

  /// No description provided for @settingsAudioTrueHdJocPassthrough.
  ///
  /// In en, this message translates to:
  /// **'TrueHD with Atmos (JOC) Passthrough'**
  String get settingsAudioTrueHdJocPassthrough;

  /// No description provided for @mediaPlayerBehavior.
  ///
  /// In en, this message translates to:
  /// **'Media Player Behavior'**
  String get mediaPlayerBehavior;

  /// No description provided for @playbackEnhancements.
  ///
  /// In en, this message translates to:
  /// **'Playback Enhancements'**
  String get playbackEnhancements;

  /// No description provided for @alwaysOn.
  ///
  /// In en, this message translates to:
  /// **'Always on.'**
  String get alwaysOn;

  /// No description provided for @replaceSkipOutroWithNextUpDisplay.
  ///
  /// In en, this message translates to:
  /// **'Replace Skip Outro with Next Up Display'**
  String get replaceSkipOutroWithNextUpDisplay;

  /// No description provided for @replaceSkipOutroWithNextUpDisplaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show the Next Up overlay instead of the Skip Outro button.'**
  String get replaceSkipOutroWithNextUpDisplaySubtitle;

  /// No description provided for @playerRouting.
  ///
  /// In en, this message translates to:
  /// **'Player Routing'**
  String get playerRouting;

  /// No description provided for @preferSoftwareDecoders.
  ///
  /// In en, this message translates to:
  /// **'Prefer software decoders'**
  String get preferSoftwareDecoders;

  /// No description provided for @preferSoftwareDecodersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use FFmpeg (audio) and libgav1 (AV1) before hardware decoders. Disable if HDMI audio passthrough breaks.'**
  String get preferSoftwareDecodersSubtitle;

  /// No description provided for @useExternalPlayer.
  ///
  /// In en, this message translates to:
  /// **'Use external player'**
  String get useExternalPlayer;

  /// No description provided for @useExternalPlayerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open video playback in your selected external app on Android TV.'**
  String get useExternalPlayerSubtitle;

  /// No description provided for @automaticQueuing.
  ///
  /// In en, this message translates to:
  /// **'Automatic Queuing'**
  String get automaticQueuing;

  /// No description provided for @preferSdhSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Prefer SDH subtitles'**
  String get preferSdhSubtitles;

  /// No description provided for @preferSdhSubtitlesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Prioritize SDH/CC subtitle tracks when auto-selecting.'**
  String get preferSdhSubtitlesSubtitle;

  /// No description provided for @webDiagnostics.
  ///
  /// In en, this message translates to:
  /// **'Web diagnostics'**
  String get webDiagnostics;

  /// No description provided for @webDiagnosticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Moonfin Web Diagnostics'**
  String get webDiagnosticsTitle;

  /// No description provided for @webDiagnosticsIntro.
  ///
  /// In en, this message translates to:
  /// **'Use this page to diagnose browser connectivity issues (CORS, mixed content, and discovery settings).'**
  String get webDiagnosticsIntro;

  /// No description provided for @webDiagnosticsDetectedMixedContentFailure.
  ///
  /// In en, this message translates to:
  /// **'Detected Mixed-Content Failure'**
  String get webDiagnosticsDetectedMixedContentFailure;

  /// No description provided for @webDiagnosticsDetectedCorsPreflightFailure.
  ///
  /// In en, this message translates to:
  /// **'Detected CORS/Preflight Failure'**
  String get webDiagnosticsDetectedCorsPreflightFailure;

  /// No description provided for @webDiagnosticsMixedContentFailureBody.
  ///
  /// In en, this message translates to:
  /// **'Moonfin detected an HTTPS page trying to call an HTTP server URL. Browsers block this request before it reaches your server.'**
  String get webDiagnosticsMixedContentFailureBody;

  /// No description provided for @webDiagnosticsCorsFailureBody.
  ///
  /// In en, this message translates to:
  /// **'Moonfin detected a browser-level request failure that is commonly caused by missing CORS or preflight headers on the media server.'**
  String get webDiagnosticsCorsFailureBody;

  /// Target URL shown in diagnostics summary
  ///
  /// In en, this message translates to:
  /// **'Target URL: {url}'**
  String webDiagnosticsTargetUrl(String url);

  /// Error detail shown in diagnostics summary
  ///
  /// In en, this message translates to:
  /// **'Detail: {detail}'**
  String webDiagnosticsDetail(String detail);

  /// No description provided for @webDiagnosticsCurrentRuntimeContext.
  ///
  /// In en, this message translates to:
  /// **'Current Runtime Context'**
  String get webDiagnosticsCurrentRuntimeContext;

  /// No description provided for @webDiagnosticsOrigin.
  ///
  /// In en, this message translates to:
  /// **'Origin'**
  String get webDiagnosticsOrigin;

  /// No description provided for @webDiagnosticsScheme.
  ///
  /// In en, this message translates to:
  /// **'Scheme'**
  String get webDiagnosticsScheme;

  /// No description provided for @webDiagnosticsPluginMode.
  ///
  /// In en, this message translates to:
  /// **'Plugin Mode'**
  String get webDiagnosticsPluginMode;

  /// No description provided for @webDiagnosticsWebRtcScan.
  ///
  /// In en, this message translates to:
  /// **'WebRTC Scan'**
  String get webDiagnosticsWebRtcScan;

  /// No description provided for @webDiagnosticsForcedServerUrl.
  ///
  /// In en, this message translates to:
  /// **'Forced Server URL'**
  String get webDiagnosticsForcedServerUrl;

  /// No description provided for @webDiagnosticsDefaultServerUrl.
  ///
  /// In en, this message translates to:
  /// **'Default Server URL'**
  String get webDiagnosticsDefaultServerUrl;

  /// No description provided for @webDiagnosticsDiscoveryProxyUrl.
  ///
  /// In en, this message translates to:
  /// **'Discovery Proxy URL'**
  String get webDiagnosticsDiscoveryProxyUrl;

  /// No description provided for @notConfigured.
  ///
  /// In en, this message translates to:
  /// **'not configured'**
  String get notConfigured;

  /// No description provided for @webDiagnosticsMixedContent.
  ///
  /// In en, this message translates to:
  /// **'Mixed Content'**
  String get webDiagnosticsMixedContent;

  /// No description provided for @webDiagnosticsMixedContentDetected.
  ///
  /// In en, this message translates to:
  /// **'This page is loaded over HTTPS, but one or more configured URLs are HTTP. Browsers block HTTPS pages from calling HTTP APIs.'**
  String get webDiagnosticsMixedContentDetected;

  /// No description provided for @webDiagnosticsMixedContentFix.
  ///
  /// In en, this message translates to:
  /// **'Fix: serve your media server or proxy endpoint via HTTPS, or load Moonfin over HTTP on trusted local networks only.'**
  String get webDiagnosticsMixedContentFix;

  /// No description provided for @webDiagnosticsNoMixedContentDetected.
  ///
  /// In en, this message translates to:
  /// **'No obvious mixed-content configuration detected from current runtime settings.'**
  String get webDiagnosticsNoMixedContentDetected;

  /// No description provided for @webDiagnosticsCorsChecklist.
  ///
  /// In en, this message translates to:
  /// **'CORS Checklist'**
  String get webDiagnosticsCorsChecklist;

  /// No description provided for @webDiagnosticsCorsChecklistItem1.
  ///
  /// In en, this message translates to:
  /// **'• Allow the browser origin in Access-Control-Allow-Origin.'**
  String get webDiagnosticsCorsChecklistItem1;

  /// No description provided for @webDiagnosticsCorsChecklistItem2.
  ///
  /// In en, this message translates to:
  /// **'• Include Authorization, X-Emby-Authorization, and X-Emby-Token in Access-Control-Allow-Headers.'**
  String get webDiagnosticsCorsChecklistItem2;

  /// No description provided for @webDiagnosticsCorsChecklistItem3.
  ///
  /// In en, this message translates to:
  /// **'• Expose Content-Range and Accept-Ranges for streaming and seek behavior.'**
  String get webDiagnosticsCorsChecklistItem3;

  /// No description provided for @webDiagnosticsCorsChecklistItem4.
  ///
  /// In en, this message translates to:
  /// **'• Return 204 to OPTIONS preflight requests.'**
  String get webDiagnosticsCorsChecklistItem4;

  /// No description provided for @webDiagnosticsHeaderSnippetTitle.
  ///
  /// In en, this message translates to:
  /// **'Example Header Snippet (nginx-style)'**
  String get webDiagnosticsHeaderSnippetTitle;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @webDiagnosticsNonWebNote.
  ///
  /// In en, this message translates to:
  /// **'This diagnostics route is intended for web builds. If you are seeing this on another platform, these checks may not apply.'**
  String get webDiagnosticsNonWebNote;

  /// No description provided for @backToServerSelect.
  ///
  /// In en, this message translates to:
  /// **'Back To Server Select'**
  String get backToServerSelect;

  /// No description provided for @signOutAllUsers.
  ///
  /// In en, this message translates to:
  /// **'Sign Out All Users'**
  String get signOutAllUsers;

  /// No description provided for @voiceSearchPermissionPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is permanently denied. Enable it in system settings.'**
  String get voiceSearchPermissionPermanentlyDenied;

  /// No description provided for @voiceSearchPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is required for voice search.'**
  String get voiceSearchPermissionRequired;

  /// No description provided for @voiceSearchNoMatch.
  ///
  /// In en, this message translates to:
  /// **'Did not catch that. Try again.'**
  String get voiceSearchNoMatch;

  /// No description provided for @voiceSearchNoSpeechDetected.
  ///
  /// In en, this message translates to:
  /// **'No speech detected.'**
  String get voiceSearchNoSpeechDetected;

  /// No description provided for @voiceSearchMicrophoneError.
  ///
  /// In en, this message translates to:
  /// **'Microphone error.'**
  String get voiceSearchMicrophoneError;

  /// No description provided for @voiceSearchNeedsInternet.
  ///
  /// In en, this message translates to:
  /// **'Voice search needs internet.'**
  String get voiceSearchNeedsInternet;

  /// No description provided for @voiceSearchServiceBusy.
  ///
  /// In en, this message translates to:
  /// **'Voice service is busy. Try again.'**
  String get voiceSearchServiceBusy;

  /// No description provided for @microphonePermissionPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is permanently denied.'**
  String get microphonePermissionPermanentlyDenied;

  /// No description provided for @microphonePermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is denied.'**
  String get microphonePermissionDenied;

  /// No description provided for @speechRecognitionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Speech recognition is unavailable on this device.'**
  String get speechRecognitionUnavailable;

  /// No description provided for @openIosRoutePicker.
  ///
  /// In en, this message translates to:
  /// **'Open iOS route picker'**
  String get openIosRoutePicker;

  /// No description provided for @airPlayRoutePickerUnavailable.
  ///
  /// In en, this message translates to:
  /// **'AirPlay route picker is unavailable on this device.'**
  String get airPlayRoutePickerUnavailable;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @trailers.
  ///
  /// In en, this message translates to:
  /// **'Trailers'**
  String get trailers;

  /// No description provided for @programs.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get programs;

  /// No description provided for @songs.
  ///
  /// In en, this message translates to:
  /// **'Songs'**
  String get songs;

  /// No description provided for @photoAlbums.
  ///
  /// In en, this message translates to:
  /// **'Photo Albums'**
  String get photoAlbums;

  /// No description provided for @photos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get photos;

  /// No description provided for @people.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get people;

  /// No description provided for @recentlyReleasedEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Recently Released Episodes'**
  String get recentlyReleasedEpisodes;

  /// No description provided for @watchAgain.
  ///
  /// In en, this message translates to:
  /// **'Watch Again'**
  String get watchAgain;

  /// No description provided for @guestAppearances.
  ///
  /// In en, this message translates to:
  /// **'Guest Appearances'**
  String get guestAppearances;

  /// No description provided for @appearancesSeerr.
  ///
  /// In en, this message translates to:
  /// **'Appearances (Seerr)'**
  String get appearancesSeerr;

  /// No description provided for @watchWithGroup.
  ///
  /// In en, this message translates to:
  /// **'Watch with group'**
  String get watchWithGroup;

  /// No description provided for @errors.
  ///
  /// In en, this message translates to:
  /// **'Errors'**
  String get errors;

  /// No description provided for @warnings.
  ///
  /// In en, this message translates to:
  /// **'Warnings'**
  String get warnings;

  /// No description provided for @disk.
  ///
  /// In en, this message translates to:
  /// **'Disk'**
  String get disk;

  /// No description provided for @openInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in Browser'**
  String get openInBrowser;

  /// No description provided for @embeddedBrowserNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Embedded browser is not available on this platform.'**
  String get embeddedBrowserNotAvailable;

  /// No description provided for @adminRestartServerConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to restart the server?'**
  String get adminRestartServerConfirmation;

  /// No description provided for @adminShutdownServerConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to shut down the server? You will need to restart it manually.'**
  String get adminShutdownServerConfirmation;

  /// No description provided for @internal.
  ///
  /// In en, this message translates to:
  /// **'Internal'**
  String get internal;

  /// No description provided for @idle.
  ///
  /// In en, this message translates to:
  /// **'Idle'**
  String get idle;

  /// No description provided for @os.
  ///
  /// In en, this message translates to:
  /// **'OS'**
  String get os;

  /// No description provided for @adminNoUsersFound.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get adminNoUsersFound;

  /// No description provided for @adminNoUsersMatchSearch.
  ///
  /// In en, this message translates to:
  /// **'No users match your search'**
  String get adminNoUsersMatchSearch;

  /// No description provided for @adminNoDevicesFound.
  ///
  /// In en, this message translates to:
  /// **'No devices found'**
  String get adminNoDevicesFound;

  /// No description provided for @adminNoDevicesMatchCurrentFilters.
  ///
  /// In en, this message translates to:
  /// **'No devices match the current filters'**
  String get adminNoDevicesMatchCurrentFilters;

  /// No description provided for @passwordSet.
  ///
  /// In en, this message translates to:
  /// **'Password set'**
  String get passwordSet;

  /// No description provided for @noPasswordConfigured.
  ///
  /// In en, this message translates to:
  /// **'No password configured'**
  String get noPasswordConfigured;

  /// No description provided for @remoteAccess.
  ///
  /// In en, this message translates to:
  /// **'Remote Access'**
  String get remoteAccess;

  /// No description provided for @localOnly.
  ///
  /// In en, this message translates to:
  /// **'Local Only'**
  String get localOnly;

  /// No description provided for @adminMediaAnalyticsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load media analytics'**
  String get adminMediaAnalyticsLoadFailed;

  /// No description provided for @analyticsCombinedAcrossLibraries.
  ///
  /// In en, this message translates to:
  /// **'Combined analytics across all media libraries.'**
  String get analyticsCombinedAcrossLibraries;

  /// No description provided for @analyticsTopArtists.
  ///
  /// In en, this message translates to:
  /// **'Top Artists'**
  String get analyticsTopArtists;

  /// No description provided for @analyticsTopAuthors.
  ///
  /// In en, this message translates to:
  /// **'Top Authors'**
  String get analyticsTopAuthors;

  /// No description provided for @analyticsTopContributors.
  ///
  /// In en, this message translates to:
  /// **'Top Contributors'**
  String get analyticsTopContributors;

  /// No description provided for @analyticsLibrariesCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Library} other{{count} Libraries}}'**
  String analyticsLibrariesCount(int count);

  /// No description provided for @analyticsNoIndexedMediaTotals.
  ///
  /// In en, this message translates to:
  /// **'No indexed media totals are available for this selection yet.'**
  String get analyticsNoIndexedMediaTotals;

  /// No description provided for @analyticsLibraryDetails.
  ///
  /// In en, this message translates to:
  /// **'Library Details'**
  String get analyticsLibraryDetails;

  /// No description provided for @analyticsLibraryBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Library Breakdown'**
  String get analyticsLibraryBreakdown;

  /// No description provided for @analyticsNoLibrariesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No libraries are available.'**
  String get analyticsNoLibrariesAvailable;

  /// No description provided for @adminServerAdministrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Server Administration'**
  String get adminServerAdministrationTitle;

  /// No description provided for @adminServerPathData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get adminServerPathData;

  /// No description provided for @adminServerPathImageCache.
  ///
  /// In en, this message translates to:
  /// **'Image Cache'**
  String get adminServerPathImageCache;

  /// No description provided for @adminServerPathCache.
  ///
  /// In en, this message translates to:
  /// **'Cache'**
  String get adminServerPathCache;

  /// No description provided for @adminServerPathLogs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get adminServerPathLogs;

  /// No description provided for @adminServerPathMetadata.
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get adminServerPathMetadata;

  /// No description provided for @adminServerPathTranscode.
  ///
  /// In en, this message translates to:
  /// **'Transcode'**
  String get adminServerPathTranscode;

  /// No description provided for @adminServerPathWeb.
  ///
  /// In en, this message translates to:
  /// **'Web'**
  String get adminServerPathWeb;

  /// No description provided for @adminNoServerPathsReturned.
  ///
  /// In en, this message translates to:
  /// **'No server paths returned by this server.'**
  String get adminNoServerPathsReturned;

  /// No description provided for @adminPercentUsed.
  ///
  /// In en, this message translates to:
  /// **'{percent}% used'**
  String adminPercentUsed(int percent);

  /// No description provided for @userActivity.
  ///
  /// In en, this message translates to:
  /// **'User Activity'**
  String get userActivity;

  /// No description provided for @systemEvents.
  ///
  /// In en, this message translates to:
  /// **'System Events'**
  String get systemEvents;

  /// No description provided for @needsAttention.
  ///
  /// In en, this message translates to:
  /// **'Needs Attention'**
  String get needsAttention;

  /// No description provided for @adminDrawerSectionServer.
  ///
  /// In en, this message translates to:
  /// **'Server'**
  String get adminDrawerSectionServer;

  /// No description provided for @adminDrawerSectionPlayback.
  ///
  /// In en, this message translates to:
  /// **'Playback'**
  String get adminDrawerSectionPlayback;

  /// No description provided for @adminDrawerSectionDevices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get adminDrawerSectionDevices;

  /// No description provided for @adminDrawerSectionAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get adminDrawerSectionAdvanced;

  /// No description provided for @adminDrawerSectionPlugins.
  ///
  /// In en, this message translates to:
  /// **'Plugins'**
  String get adminDrawerSectionPlugins;

  /// No description provided for @adminDrawerSectionLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get adminDrawerSectionLiveTv;

  /// No description provided for @homeVideos.
  ///
  /// In en, this message translates to:
  /// **'Home Videos'**
  String get homeVideos;

  /// No description provided for @mixedContent.
  ///
  /// In en, this message translates to:
  /// **'Mixed Content'**
  String get mixedContent;

  /// No description provided for @homeVideosAndPhotos.
  ///
  /// In en, this message translates to:
  /// **'Home Videos & Photos'**
  String get homeVideosAndPhotos;

  /// No description provided for @mixedMoviesAndShows.
  ///
  /// In en, this message translates to:
  /// **'Mixed Movies & Shows'**
  String get mixedMoviesAndShows;

  /// No description provided for @intelQuickSync.
  ///
  /// In en, this message translates to:
  /// **'Intel Quick Sync'**
  String get intelQuickSync;

  /// No description provided for @rockchipMpp.
  ///
  /// In en, this message translates to:
  /// **'Rockchip MPP'**
  String get rockchipMpp;

  /// No description provided for @dolbyVision.
  ///
  /// In en, this message translates to:
  /// **'Dolby Vision'**
  String get dolbyVision;

  /// No description provided for @noRecordingsFound.
  ///
  /// In en, this message translates to:
  /// **'No recordings found'**
  String get noRecordingsFound;

  /// No description provided for @noImagePagesFoundInArchive.
  ///
  /// In en, this message translates to:
  /// **'No image pages found inside .{extension} archive.'**
  String noImagePagesFoundInArchive(String extension);

  /// No description provided for @embeddedRendererFailed.
  ///
  /// In en, this message translates to:
  /// **'Embedded renderer failed ({code}): {description}'**
  String embeddedRendererFailed(int code, String description);

  /// No description provided for @epubRendererFailed.
  ///
  /// In en, this message translates to:
  /// **'EPUB renderer failed ({code}): {description}'**
  String epubRendererFailed(int code, String description);

  /// No description provided for @missingLocalFileForReader.
  ///
  /// In en, this message translates to:
  /// **'Missing local file for reader: {uri}'**
  String missingLocalFileForReader(String uri);

  /// No description provided for @httpStatusWhileOpeningBookData.
  ///
  /// In en, this message translates to:
  /// **'HTTP {status} while opening book data from {uri}'**
  String httpStatusWhileOpeningBookData(int status, String uri);

  /// No description provided for @noReadableBookEndpointAvailable.
  ///
  /// In en, this message translates to:
  /// **'No readable book endpoint available'**
  String get noReadableBookEndpointAvailable;

  /// No description provided for @unsupportedComicArchiveFormat.
  ///
  /// In en, this message translates to:
  /// **'Unsupported comic archive format: .{extension}'**
  String unsupportedComicArchiveFormat(String extension);

  /// No description provided for @cbrExtractionPluginUnavailable.
  ///
  /// In en, this message translates to:
  /// **'CBR extraction plugin is not available on this platform.'**
  String get cbrExtractionPluginUnavailable;

  /// No description provided for @failedToExtractCbrArchive.
  ///
  /// In en, this message translates to:
  /// **'Failed to extract .cbr archive.'**
  String get failedToExtractCbrArchive;

  /// No description provided for @cb7ExtractionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'CB7 extraction is not available on this platform.'**
  String get cb7ExtractionUnavailable;

  /// No description provided for @cb7ExtractionPluginUnavailable.
  ///
  /// In en, this message translates to:
  /// **'CB7 extraction plugin is not available on this platform.'**
  String get cb7ExtractionPluginUnavailable;

  /// No description provided for @closeGenrePanel.
  ///
  /// In en, this message translates to:
  /// **'Close genre panel'**
  String get closeGenrePanel;

  /// No description provided for @loadingShuffle.
  ///
  /// In en, this message translates to:
  /// **'Loading shuffle...'**
  String get loadingShuffle;

  /// No description provided for @libraryShuffleLabel.
  ///
  /// In en, this message translates to:
  /// **'LIBRARY SHUFFLE'**
  String get libraryShuffleLabel;

  /// No description provided for @randomShuffleLabel.
  ///
  /// In en, this message translates to:
  /// **'RANDOM SHUFFLE'**
  String get randomShuffleLabel;

  /// No description provided for @genresShuffleLabel.
  ///
  /// In en, this message translates to:
  /// **'GENRES SHUFFLE'**
  String get genresShuffleLabel;

  /// No description provided for @autoHdrSwitching.
  ///
  /// In en, this message translates to:
  /// **'Auto HDR Switching'**
  String get autoHdrSwitching;

  /// No description provided for @autoHdrSwitchingDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically enable HDR for HDR video playback and restore display mode on exit.'**
  String get autoHdrSwitchingDescription;

  /// No description provided for @whenFullscreen.
  ///
  /// In en, this message translates to:
  /// **'When fullscreen'**
  String get whenFullscreen;

  /// No description provided for @transcodingLimits.
  ///
  /// In en, this message translates to:
  /// **'Transcoding Limits'**
  String get transcodingLimits;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'af',
    'ar',
    'be',
    'bg',
    'bn',
    'ca',
    'cs',
    'cy',
    'da',
    'de',
    'el',
    'en',
    'eo',
    'es',
    'et',
    'fa',
    'fi',
    'fr',
    'gl',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'kk',
    'kn',
    'ko',
    'lt',
    'lv',
    'mk',
    'ml',
    'mn',
    'nb',
    'nl',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'si',
    'sk',
    'sl',
    'sq',
    'sr',
    'sv',
    'sw',
    'ta',
    'te',
    'th',
    'tl',
    'tr',
    'ug',
    'uk',
    'vi',
    'yue',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
        switch (locale.countryCode) {
          case 'GB':
            return AppLocalizationsEnGb();
        }
        break;
      }
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return AppLocalizationsEs419();
          case 'AR':
            return AppLocalizationsEsAr();
          case 'DO':
            return AppLocalizationsEsDo();
          case 'MX':
            return AppLocalizationsEsMx();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
    case 'yue':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsYueCn();
          case 'HK':
            return AppLocalizationsYueHk();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'ar':
      return AppLocalizationsAr();
    case 'be':
      return AppLocalizationsBe();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'cy':
      return AppLocalizationsCy();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'eo':
      return AppLocalizationsEo();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'gl':
      return AppLocalizationsGl();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kk':
      return AppLocalizationsKk();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'mk':
      return AppLocalizationsMk();
    case 'ml':
      return AppLocalizationsMl();
    case 'mn':
      return AppLocalizationsMn();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'si':
      return AppLocalizationsSi();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sq':
      return AppLocalizationsSq();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tl':
      return AppLocalizationsTl();
    case 'tr':
      return AppLocalizationsTr();
    case 'ug':
      return AppLocalizationsUg();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'yue':
      return AppLocalizationsYue();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
