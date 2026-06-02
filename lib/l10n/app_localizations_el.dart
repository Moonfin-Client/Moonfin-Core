// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => 'Είσοδος';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Γρήγορη σύνδεση';

  @override
  String get password => 'Σύνθημα';

  @override
  String get username => 'Όνομα χρήστη';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Εισαγάγετε αυτόν τον κωδικό στον πίνακα ελέγχου ιστού του διακομιστή σας:';

  @override
  String get waitingForAuthorization => 'Αναμονή για εξουσιοδότηση...';

  @override
  String get back => 'Πίσω';

  @override
  String get serverUnavailable => 'Ο διακομιστής δεν είναι διαθέσιμος';

  @override
  String get loginFailed => 'Η σύνδεση απέτυχε';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Ποιος παρακολουθεί;';

  @override
  String get addUser => 'Προσθήκη χρήστη';

  @override
  String get selectServer => 'Επιλέξτε Διακομιστής';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Αποθηκευμένοι διακομιστές';

  @override
  String get discoveredServers => 'Διακομιστές που ανακαλύφθηκαν';

  @override
  String get noneFound => 'Δεν βρέθηκε κανένα';

  @override
  String get unableToConnectToServer =>
      'Δεν είναι δυνατή η σύνδεση με τον διακομιστή';

  @override
  String get addServer => 'Προσθήκη διακομιστή';

  @override
  String get embyConnect => 'Emby Σύνδεση';

  @override
  String get removeServer => 'Κατάργηση διακομιστή';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Ματαίωση';

  @override
  String get remove => 'Αφαιρώ';

  @override
  String get connectToServer => 'Σύνδεση στον διακομιστή';

  @override
  String get serverAddress => 'Διεύθυνση διακομιστή';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Συνδέω';

  @override
  String get secureStorageUnavailable =>
      'Μη διαθέσιμος ασφαλής χώρος αποθήκευσης';

  @override
  String get secureStorageUnavailableMessage =>
      'Το Moonfin δεν μπόρεσε να αποκτήσει πρόσβαση στο μπρελόκ του συστήματός σας. Η σύνδεση μπορεί να συνεχιστεί, αλλά η ασφαλής αποθήκευση διακριτικών ενδέχεται να μην είναι διαθέσιμη μέχρι να ξεκλειδωθεί το μπρελόκ.';

  @override
  String get ok => 'ΕΝΤΑΞΕΙ';

  @override
  String get settingsAppearanceTheme => 'Θέμα εφαρμογής';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Εναλλαγή μεταξύ Moonfin και Neon Pulse χωρίς επανεκκίνηση της εφαρμογής';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Η τρέχουσα εμφάνιση Moonfin που όλοι έχετε αγαπήσει';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Στυλ Synthwave με ματζέντα λάμψη, κυανό κείμενο και ισχυρότερη αντίθεση χρωμίου';

  @override
  String get embyConnectSignInSubtitle =>
      'Συνδεθείτε με τον λογαριασμό σας Emby Connect';

  @override
  String get emailOrUsername => 'email ή όνομα χρήστη';

  @override
  String get selectAServer => 'Επιλέξτε έναν διακομιστή';

  @override
  String get tryAgain => 'Δοκιμάστε ξανά';

  @override
  String get noLinkedServers =>
      'Δεν υπάρχουν διακομιστές συνδεδεμένοι με αυτόν τον λογαριασμό Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Μη έγκυρα διαπιστευτήρια Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Μη έγκυρο όνομα χρήστη ή κωδικός πρόσβασης Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Ο διακομιστής δεν υποστηρίζει ανταλλαγή Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Σφάλμα δικτύου κατά την επικοινωνία με το Emby Connect ή τον επιλεγμένο διακομιστή';

  @override
  String get loadingLinkedServers => 'Φόρτωση συνδεδεμένων διακομιστών...';

  @override
  String get connectingToServerEllipsis => 'Σύνδεση με διακομιστή...';

  @override
  String get noReachableAddress => 'Δεν παρέχεται προσβάσιμη διεύθυνση';

  @override
  String get invalidServerExchangeResponse =>
      'Μη έγκυρη απάντηση από το τελικό σημείο ανταλλαγής διακομιστή';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Έξοδος από το Moonfin;';

  @override
  String get exitAppConfirmation => 'Είστε βέβαιοι ότι θέλετε να βγείτε;';

  @override
  String get exit => 'Εξοδος';

  @override
  String get noHomeRowsLoaded => 'Δεν ήταν δυνατή η φόρτωση των αρχικών σειρών';

  @override
  String get noHomeRowsHint =>
      'Δοκιμάστε να ανανεώσετε ή να μειώσετε τις ενεργές οικιακές ενότητες.';

  @override
  String get retryHomeRows => 'Δοκιμάστε ξανά τις αρχικές σειρές';

  @override
  String get guide => 'Οδηγός';

  @override
  String get recordings => 'Ηχογραφήσεις';

  @override
  String get schedule => 'Πρόγραμμα';

  @override
  String get series => 'Σειρά';

  @override
  String get noItemsFound => 'Δεν βρέθηκαν στοιχεία';

  @override
  String get home => 'Σπίτι';

  @override
  String get browseAll => 'Περιήγηση σε όλα';

  @override
  String get genres => 'Είδη';

  @override
  String get collectionPlaceholder =>
      'Τα στοιχεία της συλλογής θα εμφανιστούν εδώ';

  @override
  String get browseByLetter => 'Περιήγηση κατά Letter';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Εδώ θα εμφανιστεί η αλφαβητική περιήγηση';

  @override
  String get suggestions => 'Προτάσεις';

  @override
  String get suggestionsPlaceholder =>
      'Τα προτεινόμενα στοιχεία θα εμφανιστούν εδώ';

  @override
  String get failedToLoadLibraries => 'Αποτυχία φόρτωσης βιβλιοθηκών';

  @override
  String get noLibrariesFound => 'Δεν βρέθηκαν βιβλιοθήκες';

  @override
  String get library => 'Βιβλιοθήκη';

  @override
  String get displaySettings => 'Ρυθμίσεις οθόνης';

  @override
  String get allGenres => 'Όλα τα είδη';

  @override
  String get noGenresFound => 'Δεν βρέθηκαν είδη';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Αυτός ο φάκελος είναι κενός';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Η φόρτωση των αγαπημένων απέτυχε';

  @override
  String get retry => 'Δοκιμάζω πάλι';

  @override
  String get noFavoritesYet => 'Δεν υπάρχουν ακόμα αγαπημένα';

  @override
  String get favorites => 'Αγαπημένα';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Συνεχίζοντας';

  @override
  String get ended => 'Τελείωσε';

  @override
  String get sortAndFilter => 'Ταξινόμηση & Φιλτράρισμα';

  @override
  String get type => 'Τύπος';

  @override
  String get sortBy => 'Ταξινόμηση κατά';

  @override
  String get display => 'Επίδειξη';

  @override
  String get imageType => 'Τύπος εικόνας';

  @override
  String get posterSize => 'Μέγεθος αφίσας';

  @override
  String get small => 'Μικρό';

  @override
  String get medium => 'Μέσον';

  @override
  String get large => 'Μεγάλο';

  @override
  String get extraLarge => 'Πολύ μεγάλο';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Απόψεις';

  @override
  String get albums => 'Άλμπουμ';

  @override
  String get albumArtists => 'Καλλιτέχνες άλμπουμ';

  @override
  String get artists => 'Καλλιτέχνες';

  @override
  String get bookmarks => 'Σελιδοδείκτες';

  @override
  String get noSavedBookmarks =>
      'Δεν υπάρχουν ακόμη αποθηκευμένοι σελιδοδείκτες για αυτόν τον τίτλο.';

  @override
  String get openBook => 'Ανοίξτε το βιβλίο';

  @override
  String get chapter => 'Κεφάλαιο';

  @override
  String get page => 'Σελίδα';

  @override
  String get bookmark => 'Σελιδοδείκτης';

  @override
  String get justNow => 'Μόλις τώρα';

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
  String get discoverySubjects => 'Θέματα Ανακάλυψης';

  @override
  String get pickDiscoverySubjects =>
      'Επιλέξτε ποιο θέμα θα εμφανίζεται στο Discover.';

  @override
  String get apply => 'Εφαρμόζω';

  @override
  String get openLink => 'Ανοίξτε τον σύνδεσμο';

  @override
  String get scanWithYourPhone => 'Σάρωση με το τηλέφωνό σας';

  @override
  String get audiobookGenres => 'Είδη ακουστικών βιβλίων';

  @override
  String get pickAudiobookGenres =>
      'Επιλέξτε ποια είδη θα εμφανίζονται στο Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Ανακαλύψτε ηχητικά βιβλία';

  @override
  String get librivoxDescription =>
      'Δημοφιλείς τίτλοι δημόσιου τομέα από το LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Κάντε κύλιση αριστερά';

  @override
  String get scrollRight => 'Κάντε κύλιση προς τα δεξιά';

  @override
  String get couldNotLoadGenre =>
      'Δεν ήταν δυνατή η φόρτωση αυτού του είδους αυτήν τη στιγμή.';

  @override
  String get continueReading => 'Συνεχίστε την ανάγνωση';

  @override
  String get savedHighlights => 'Αποθηκευμένα Κύρια σημεία';

  @override
  String get continueListening => 'Συνεχίστε να ακούτε';

  @override
  String get listen => 'Ακούω';

  @override
  String get resume => 'Περίληψη';

  @override
  String get failedToLoadLibrary => 'Η φόρτωση της βιβλιοθήκης απέτυχε';

  @override
  String get popularNow => 'Δημοφιλές τώρα';

  @override
  String get savedForLater => 'Αποθηκεύτηκε για αργότερα';

  @override
  String get topListens => 'Κορυφαία ακούσματα';

  @override
  String get unreadDiscoveries => 'Μη αναγνωσμένες ανακαλύψεις';

  @override
  String get pickUpAgain => 'Σήκωσε ξανά';

  @override
  String get bookHighlightsDescription =>
      'Τα βιβλία σας με τις καλύτερες στιγμές, τα αγαπημένα ή την πρόοδο στην ανάγνωση.';

  @override
  String get handPickedFromLibrary => 'Διαλεγμένο από τη βιβλιοθήκη σας.';

  @override
  String get handPickedFromListeningQueue =>
      'Επιλεγμένα με το χέρι από την ουρά ακρόασης.';

  @override
  String get booksWithHighlights =>
      'Βιβλία με κορυφαίες στιγμές, αγαπημένα ή πρόοδο στην ανάγνωση.';

  @override
  String get jumpBackNarration =>
      'Μεταβείτε ξανά στην αφήγηση χωρίς να κυνηγήσετε τον τόπο σας.';

  @override
  String get unreadBooksReady =>
      'Αδιάβαστα βιβλία έτοιμα για την επόμενη ήσυχη ώρα.';

  @override
  String get quickAccessFavorites =>
      'Γρήγορη πρόσβαση στα βιβλία στα οποία επιστρέφετε συνεχώς.';

  @override
  String get searchAudiobooks => 'Αναζήτηση ηχητικών βιβλίων';

  @override
  String get searchYourLibrary => 'Αναζητήστε τη βιβλιοθήκη σας';

  @override
  String get pickUpStory => 'Συνεχίστε την ιστορία από εκεί που σταματήσατε';

  @override
  String get savedPlacesChapters =>
      'Τα αποθηκευμένα μέρη και τα ημιτελή κεφάλαιά σας';

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
  String get readyWhenYouAre => 'Έτοιμος όταν είσαι';

  @override
  String get details => 'Καθέκαστα';

  @override
  String get listeningRoom => 'Αίθουσα Ακρόασης';

  @override
  String get bookmarksAndProgress => 'Σελιδοδείκτες & Πρόοδος';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Τίτλοι';

  @override
  String get allTitles => 'Όλοι οι τίτλοι';

  @override
  String get authors => 'Συγγραφείς';

  @override
  String get browseByAuthor => 'Περιήγηση κατά συγγραφέα';

  @override
  String get browseByGenre => 'Περιήγηση κατά είδος';

  @override
  String get discover => 'Ανακαλύπτω';

  @override
  String get trendingTitlesOpenLibrary =>
      'Τάσεις τίτλων ανά θέμα από Open Library.';

  @override
  String get noBookmarkedItems => 'Δεν υπάρχουν ακόμα στοιχεία σελιδοδείκτη';

  @override
  String get nothingMatchesSection =>
      'Τίποτα δεν ταιριάζει με αυτήν την ενότητα ακόμα. Δοκιμάστε μια άλλη καρτέλα ή επιστρέψτε μετά την ολοκλήρωση του συγχρονισμού της βιβλιοθήκης.';

  @override
  String get audiobooks => 'Ηχητικά βιβλία';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Ντοσιέ';

  @override
  String get filters => 'Φίλτρα';

  @override
  String get readingStatus => 'Κατάσταση ανάγνωσης';

  @override
  String get playedStatus => 'Κατάσταση αναπαραγωγής';

  @override
  String get readStatus => 'Ανάγνωση';

  @override
  String get watched => 'Παρακολούθησαν';

  @override
  String get unread => 'Αδιάβαστος';

  @override
  String get unwatched => 'Απαρατήρητο';

  @override
  String get seriesStatus => 'Κατάσταση σειράς';

  @override
  String get allLibraries => 'Όλες οι Βιβλιοθήκες';

  @override
  String get books => 'Βιβλία';

  @override
  String get author => 'Συγγραφέας';

  @override
  String get unknownAuthor => 'Άγνωστος συγγραφέας';

  @override
  String get uncategorized => 'Χωρίς κατηγοριοποίηση';

  @override
  String get overview => 'Επισκόπηση';

  @override
  String get noLibrivoxDescription =>
      'Δεν παρέχεται ακόμη περιγραφή από το LibriVox για αυτόν τον τίτλο.';

  @override
  String get readers => 'Αναγνώστες';

  @override
  String get openLinks => 'Ανοίξτε τους συνδέσμους';

  @override
  String get librivoxPage => 'Σελίδα LibriVox';

  @override
  String get internetArchive => 'Αρχείο Διαδικτύου';

  @override
  String get rssFeed => 'Ροή RSS';

  @override
  String get downloadZip => 'Λήψη Zip';

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
      'Δεν διατίθεται ακόμη επισκόπηση από την Open Library για αυτόν τον τίτλο.';

  @override
  String get subjects => 'Θέματα';

  @override
  String get all => 'Ολοι';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Δεν ήταν δυνατή η φόρτωση αυτού του θέματος αυτήν τη στιγμή.';

  @override
  String get audiobookDetails => 'Λεπτομέρειες ηχητικού βιβλίου';

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
  String get trackList => 'Λίστα κομματιών';

  @override
  String get itemListPlaceholder => 'Η λίστα στοιχείων θα εμφανιστεί εδώ';

  @override
  String get favoriteTracksPlaceholder =>
      'Τα αγαπημένα κομμάτια θα εμφανιστούν εδώ';

  @override
  String get failedToLoad => 'Αποτυχία φόρτωσης';

  @override
  String get delete => 'Διαγράφω';

  @override
  String get save => 'Εκτός';

  @override
  String get moreLikeThis => 'Περισσότερα σαν αυτό';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get collection => 'Συλλογή';

  @override
  String get episodes => 'Επεισόδια';

  @override
  String get nextUp => 'Επόμενο επάνω';

  @override
  String get seasons => 'εποχές';

  @override
  String get chapters => 'Κεφάλαια';

  @override
  String get features => 'Χαρακτηριστικά';

  @override
  String get movies => 'Κινηματογράφος';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Αλλος';

  @override
  String get discography => 'Δισκογραφία';

  @override
  String get similarArtists => 'Παρόμοιοι Καλλιτέχνες';

  @override
  String get tableOfContents => 'Πίνακας περιεχομένων';

  @override
  String get tracklist => 'Tracklist';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Βιογραφία';

  @override
  String get authorDetails => 'Στοιχεία συγγραφέα';

  @override
  String get noOverviewAvailable =>
      'Δεν υπάρχει διαθέσιμη επισκόπηση για αυτόν τον τίτλο ακόμα.';

  @override
  String get noBiographyAvailable =>
      'Δεν υπάρχει διαθέσιμη βιογραφία για αυτόν τον συγγραφέα.';

  @override
  String get noBooksFound => 'Δεν βρέθηκαν βιβλία για αυτόν τον συγγραφέα.';

  @override
  String get unableToLoadAuthorDetails =>
      'Δεν είναι δυνατή η φόρτωση των στοιχείων του συγγραφέα αυτήν τη στιγμή.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Άγνωστη ημερομηνία δημοσίευσης';

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
  String get view => 'Θέα';

  @override
  String get resumeReading => 'Συνέχιση της ανάγνωσης';

  @override
  String get read => 'Ανάγνωση';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Παιχνίδι';

  @override
  String get startOver => 'Ξεκινήστε από την αρχή';

  @override
  String get restart => 'Επανεκκίνηση';

  @override
  String get readOffline => 'Διαβάστε εκτός σύνδεσης';

  @override
  String get playOffline => 'Παίξτε εκτός σύνδεσης';

  @override
  String get audio => 'Ήχος';

  @override
  String get subtitles => 'Υπότιτλοι';

  @override
  String get version => 'Εκδοχή';

  @override
  String get cast => 'Εκμαγείο';

  @override
  String get trailer => 'Τροχόσπιτο';

  @override
  String get finished => 'Πεπερασμένος';

  @override
  String get favorited => 'Αγαπημένο';

  @override
  String get favorite => 'Ευνοούμενος';

  @override
  String get playlist => 'Λίστα αναπαραγωγής';

  @override
  String get downloaded => 'Λήψη';

  @override
  String get downloadAll => 'Λήψη όλων';

  @override
  String get download => 'Λήψη';

  @override
  String get deleteDownloaded => 'Διαγραφή Λήφθηκε';

  @override
  String get goToSeries => 'Μεταβείτε στη σειρά';

  @override
  String get editMetadata => 'Επεξεργασία Μεταδεδομένων';

  @override
  String get less => 'Μείον';

  @override
  String get more => 'Περισσότερο';

  @override
  String get deleteItem => 'Διαγραφή Αντικειμένου';

  @override
  String get deletePlaylist => 'Διαγραφή λίστας αναπαραγωγής';

  @override
  String get deletePlaylistMessage =>
      'Διαγραφή αυτής της λίστας αναπαραγωγής από τον διακομιστή;';

  @override
  String get deleteItemMessage =>
      'Διαγραφή αυτού του στοιχείου από τον διακομιστή;';

  @override
  String get failedToDeletePlaylist =>
      'Η διαγραφή της λίστας αναπαραγωγής απέτυχε';

  @override
  String get failedToDeleteItem => 'Η διαγραφή του στοιχείου απέτυχε';

  @override
  String get renamePlaylist => 'Μετονομασία λίστας αναπαραγωγής';

  @override
  String get playlistName => 'Όνομα λίστας αναπαραγωγής';

  @override
  String get deleteDownloadedAlbum => 'Διαγραφή ληφθέντος άλμπουμ';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Τα ληφθέντα κομμάτια διαγράφηκαν';

  @override
  String get downloadedTracksDeleteFailed =>
      'Δεν ήταν δυνατή η διαγραφή ορισμένων κομματιών που λήφθηκαν';

  @override
  String get noTracksLoaded => 'Δεν φορτώθηκαν κομμάτια';

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
  String get itemDeleted => 'Το στοιχείο διαγράφηκε';

  @override
  String get noPlayableTrailerFound =>
      'Δεν βρέθηκε τρέιλερ με δυνατότητα αναπαραγωγής.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Κομμάτι ήχου';

  @override
  String get subtitleTrack => 'Κομμάτι υπότιτλων';

  @override
  String get none => 'Κανένας';

  @override
  String get downloadSubtitlesLabel => 'Κατεβάστε υπότιτλους...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Αναζήτηση χρησιμοποιώντας την προσθήκη OpenSubtitles';

  @override
  String get downloadSubtitles => 'Κατεβάστε υπότιτλους';

  @override
  String get selectedSubtitleInvalid =>
      'Ο επιλεγμένος υπότιτλος δεν είναι έγκυρος.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Έγινε λήψη του υπότιτλου. Μπορεί να χρειαστεί λίγος χρόνος για να εμφανιστεί ενώ το Jellyfin ανανεώνει το στοιχείο.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Επιλέξτε Έκδοση';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Λήψη όλων — Ποιότητα';

  @override
  String get downloadQuality => 'Ποιότητα λήψης';

  @override
  String get originalFileNoReencoding =>
      'Αρχικό αρχείο, χωρίς επανακωδικοποίηση';

  @override
  String get originalFilesNoReencoding =>
      'Αρχικά αρχεία, χωρίς επανακωδικοποίηση';

  @override
  String get noEpisodesLoaded => 'Δεν φορτώθηκαν επεισόδια';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Διαγραφή ληφθέντων αρχείων';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Τα ληφθέντα αρχεία διαγράφηκαν';

  @override
  String get failedToDeleteFiles => 'Αποτυχία διαγραφής αρχείων';

  @override
  String get deleteFiles => 'Διαγραφή Αρχείων';

  @override
  String get director => 'ΔΙΕΥΘΥΝΤΗΣ';

  @override
  String get writers => 'ΣΥΓΓΡΑΦΕΙΣ';

  @override
  String get studio => 'ΣΤΟΥΝΤΙΟ';

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
  String get showLess => 'Εμφάνιση Λιγότερο';

  @override
  String get readMore => 'Διαβάστε περισσότερα';

  @override
  String get shuffle => 'Ανάμιξη';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Τέλειο ταίρι';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Μονο';

  @override
  String get stereo => 'Στέρεο';

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
  String get deleteSeasonFiles => 'όλα τα ληφθέντα επεισόδια αυτής της σεζόν';

  @override
  String get stillWatching => 'Ακόμα παρακολουθείτε;';

  @override
  String get unableToLoadTrailerStream =>
      'Δεν είναι δυνατή η φόρτωση της ροής τρέιλερ.';

  @override
  String get trailerTimedOut =>
      'Το χρονικό όριο του τρέιλερ έληξε κατά τη φόρτωση.';

  @override
  String get playbackFailedForTrailer =>
      'Η αναπαραγωγή απέτυχε για αυτό το τρέιλερ.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Η μετάδοση δεν είναι διαθέσιμη κατά την αναπαραγωγή εκτός σύνδεσης.';

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
  String get deviceVolume => 'Ένταση συσκευής';

  @override
  String get unavailable => 'Δυσεύρετος';

  @override
  String get pause => 'Παύση';

  @override
  String get syncPosition => 'Θέση συγχρονισμού';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Η ουρά είναι άδεια';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Απομακρυσμένη αναπαραγωγή';

  @override
  String get castingToGoogleCast => 'Μετάδοση στο Google Cast';

  @override
  String get castingViaAirPlay => 'Μετάδοση μέσω AirPlay';

  @override
  String get castingViaDlna => 'Casting μέσω DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Πατήστε παρατεταμένα για ξεκλείδωμα';

  @override
  String get off => 'Μακριά από';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Αυτο';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Παράκαμψη ρυθμού bit';

  @override
  String get audioDelay => 'Καθυστέρηση ήχου';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Καθυστέρηση υπότιτλων';

  @override
  String get reset => 'Επαναφορά';

  @override
  String get unknown => 'Αγνωστος';

  @override
  String get playbackInformation => 'Πληροφορίες αναπαραγωγής';

  @override
  String get playback => 'Αναπαραγωγή';

  @override
  String get playMethod => 'Μέθοδος παιχνιδιού';

  @override
  String get directPlay => 'Απευθείας αναπαραγωγή';

  @override
  String get directStream => 'Απευθείας ροή';

  @override
  String get transcoding => 'Διακωδικοποίηση';

  @override
  String get transcodeReasons => 'Λόγοι διακωδικοποίησης';

  @override
  String get player => 'Παίχτης';

  @override
  String get container => 'Δοχείο';

  @override
  String get bitrate => 'Ρυθμός bit';

  @override
  String get video => 'Βίντεο';

  @override
  String get resolution => 'Ψήφισμα';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Κωδικοποιητής';

  @override
  String get videoBitrate => 'Ρυθμός bit βίντεο';

  @override
  String get track => 'Τροχιά';

  @override
  String get channels => 'Κανάλια';

  @override
  String get audioBitrate => 'Ρυθμός bit ήχου';

  @override
  String get sampleRate => 'Ποσοστό δείγματος';

  @override
  String get format => 'Σχήμα και διάταξις βιβλίου';

  @override
  String get external => 'Εξωτερικός';

  @override
  String get embedded => 'Ενσωματωμένο';

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
      'Η απόδοση EPUB εντός εφαρμογής δεν είναι ακόμη διαθέσιμη σε αυτήν την πλατφόρμα.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Η απόδοση ενσωματωμένου εγγράφου δεν είναι διαθέσιμη σε αυτήν την πλατφόρμα.';

  @override
  String get couldNotOpenExternalViewer =>
      'Δεν ήταν δυνατό το άνοιγμα της εξωτερικής προβολής.';

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
      'Δεν υπάρχουν ακόμα σελιδοδείκτες.\nΠατήστε το εικονίδιο σελιδοδείκτη ενώ διαβάζετε για να αποθηκεύσετε τη θέση σας.';

  @override
  String get noTableOfContentsAvailable =>
      'Δεν υπάρχει διαθέσιμος πίνακας περιεχομένων';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Θέση';

  @override
  String get bookReader => 'Αναγνώστης Βιβλίων';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Ενημέρωση...';

  @override
  String get markUnread => 'Επισήμανση ως μη αναγνωσμένο';

  @override
  String get markAsRead => 'Επισήμανση ως αναγνωσμένο';

  @override
  String get reloadReader => 'Επαναφόρτωση προγράμματος ανάγνωσης';

  @override
  String get noPagesFound => 'Δεν βρέθηκαν σελίδες.';

  @override
  String get failedToDecodePageImage =>
      'Απέτυχε η αποκωδικοποίηση της εικόνας της σελίδας.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Ενιαία Σελίδα';

  @override
  String get twoPageSpread => 'Διάδοση σε δύο σελίδες';

  @override
  String get addBookmark => 'Προσθήκη σελιδοδείκτη';

  @override
  String get bookmarksEllipsis => 'Σελιδοδείκτες...';

  @override
  String get markedAsRead => 'Επισημάνθηκε ως αναγνωσμένο';

  @override
  String get markedAsUnread => 'Επισημάνθηκε ως μη αναγνωσμένο';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Θέμα: Σύστημα';

  @override
  String get themeLight => 'Θέμα: Φως';

  @override
  String get themeDark => 'Θέμα: Σκοτεινό';

  @override
  String get themeSepia => 'Θέμα: Σέπια';

  @override
  String get invertColorsFixedLayout => 'Αντιστροφή χρωμάτων (σταθερή διάταξη)';

  @override
  String get invertColorsPdf => 'Αντιστροφή χρωμάτων (PDF)';

  @override
  String get preparingInAppReader =>
      'Προετοιμασία προγράμματος ανάγνωσης εντός εφαρμογής...';

  @override
  String get pdfDataNotAvailable => 'Τα δεδομένα PDF δεν είναι διαθέσιμα.';

  @override
  String get readerFallbackModeActive =>
      'Ενεργή εναλλακτική λειτουργία αναγνώστη';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Χρησιμοποιήστε το Reload Reader μετά τη μετάβαση σε έναν υποστηριζόμενο στόχο πλατφόρμας (Android, iOS, macOS).';

  @override
  String get openExternally => 'Άνοιγμα Εξωτερικά';

  @override
  String get noEpubChaptersFound => 'Δεν βρέθηκαν κεφάλαια EPUB.';

  @override
  String get readerNotReady => 'Ο αναγνώστης δεν είναι έτοιμος.';

  @override
  String get seriesRecordings => 'Ηχογραφήσεις σειράς';

  @override
  String get now => 'Τώρα';

  @override
  String get sports => 'Αθλητισμός';

  @override
  String get news => 'Νέα';

  @override
  String get kids => 'Μικρόκοσμος';

  @override
  String get premiere => 'Πρεμιέρα';

  @override
  String get guideTimeline => 'Οδηγός Χρονοδιάγραμμα';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Δεν βρέθηκαν κανάλια';

  @override
  String get liveBadge => 'ΖΩ';

  @override
  String get movie => 'Ταινία';

  @override
  String get removedFromFavoriteChannels =>
      'Καταργήθηκε από τα αγαπημένα κανάλια';

  @override
  String get addedToFavoriteChannels => 'Προστέθηκε στα αγαπημένα κανάλια';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Η ενημέρωση του αγαπημένου καναλιού απέτυχε';

  @override
  String get unfavoriteChannel => 'Μη αγαπημένο κανάλι';

  @override
  String get favoriteChannel => 'Αγαπημένο κανάλι';

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
  String get watch => 'Ρολόι';

  @override
  String get close => 'Κοντά';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Αποτυχία φόρτωσης εγγραφών';

  @override
  String get scheduledInNext24Hours => 'Προγραμματισμένο στις επόμενες 24 ώρες';

  @override
  String get recentRecordings => 'Πρόσφατες ηχογραφήσεις';

  @override
  String get tvSeries => 'Τηλεοπτική σειρά';

  @override
  String get failedToLoadSchedule => 'Η φόρτωση του προγράμματος απέτυχε';

  @override
  String get noScheduledRecordings => 'Δεν υπάρχουν προγραμματισμένες εγγραφές';

  @override
  String get cancelRecording => 'Ακύρωση εγγραφής;';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Οχι';

  @override
  String get yesCancel => 'Ναι, Ακύρωση';

  @override
  String get failedToCancelRecording => 'Η ακύρωση της εγγραφής απέτυχε';

  @override
  String get failedToLoadSeriesRecordings =>
      'Αποτυχία φόρτωσης εγγραφών σειράς';

  @override
  String get noSeriesRecordings => 'Δεν υπάρχουν εγγραφές σειράς';

  @override
  String get cancelSeriesRecording => 'Ακύρωση εγγραφής σειράς';

  @override
  String get cancelSeriesRecordingQuestion => 'Ακύρωση εγγραφής σειράς;';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Η ακύρωση της εγγραφής σειράς απέτυχε';

  @override
  String get searchThisLibrary => 'Αναζήτηση αυτής της βιβλιοθήκης...';

  @override
  String get searchEllipsis => 'Ερευνα...';

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
  String get seerrAccountType => 'Τύπος λογαριασμού Seer';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Τοπικός';

  @override
  String get savedMedia => 'Αποθηκευμένα μέσα';

  @override
  String get tvShows => 'Τηλεοπτικές εκπομπές';

  @override
  String get music => 'Μουσική';

  @override
  String get musicAlbums => 'Μουσικά άλμπουμ';

  @override
  String get noMediaInFilter => 'Δεν υπάρχουν μέσα σε αυτό το φίλτρο';

  @override
  String get noDownloadedMediaYet => 'Δεν έχουν ληφθεί ακόμη πολυμέσα';

  @override
  String get browseLibrary => 'Περιήγηση στη βιβλιοθήκη';

  @override
  String get deleteDownload => 'Διαγραφή λήψης';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Αλμπουμ';

  @override
  String get playAlbum => 'Αναπαραγωγή άλμπουμ';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Εποχή';

  @override
  String get errorLoadingEpisodes => 'Σφάλμα κατά τη φόρτωση επεισοδίων';

  @override
  String get noDownloadedEpisodes => 'Δεν υπάρχουν ληφθέντα επεισόδια';

  @override
  String get deleteEpisode => 'Διαγραφή επεισοδίου';

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
  String get seriesNotFound => 'Η σειρά δεν βρέθηκε';

  @override
  String get errorLoadingSeries => 'Σφάλμα κατά τη φόρτωση της σειράς';

  @override
  String get downloadedEpisodes => 'Λήψη επεισοδίων';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Ειδικά';

  @override
  String get deleteSeason => 'Διαγραφή σεζόν';

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
  String get storageManagement => 'Διαχείριση αποθήκευσης';

  @override
  String get storageBreakdown => 'Ανάλυση αποθήκευσης';

  @override
  String get downloadedItems => 'Λήψη αντικειμένων';

  @override
  String get storageLimit => 'Όριο αποθήκευσης';

  @override
  String get noLimit => 'Κανένα όριο';

  @override
  String get deleteAllDownloads => 'Διαγραφή όλων των λήψεων';

  @override
  String get deleteAllDownloadsWarning =>
      'Αυτό θα καταργήσει όλα τα ληφθέντα αρχεία πολυμέσων και δεν μπορεί να αναιρεθεί.';

  @override
  String get deleteAll => 'Διαγραφή όλων';

  @override
  String get deleteSelected => 'Διαγραφή επιλεγμένων';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Μουσική και ηχητικά βιβλία';

  @override
  String get images => 'εικόνες';

  @override
  String get database => 'Βάση δεδομένων';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get authentication => 'Πιστοποίηση';

  @override
  String get autoLoginServerManagement =>
      'Αυτόματη σύνδεση, διαχείριση διακομιστή';

  @override
  String get pinCode => 'Κωδικός PIN';

  @override
  String get setUpPinCodeProtection => 'Ρύθμιση προστασίας κωδικού PIN';

  @override
  String get parentalControls => 'Γονικός έλεγχος';

  @override
  String get contentRatingRestrictions =>
      'Περιορισμοί αξιολόγησης περιεχομένου';

  @override
  String get bitRateResolutionBehavior => 'Ρυθμός bit, ανάλυση, συμπεριφορά';

  @override
  String get languageSizeAppearance => 'Γλώσσα, μέγεθος, εμφάνιση';

  @override
  String get qualityStorage => 'Ποιότητα, αποθήκευση';

  @override
  String get serverSyncAndPluginStatus =>
      'Συγχρονισμός διακομιστή και κατάσταση προσθήκης';

  @override
  String get mediaRequestIntegration => 'Ενσωμάτωση αιτημάτων πολυμέσων';

  @override
  String get switchServer => 'Εναλλαγή διακομιστή';

  @override
  String get signOut => 'Αποσύνδεση';

  @override
  String get versionLicenses => 'Έκδοση, άδειες';

  @override
  String get account => 'Λογαριασμός';

  @override
  String get signInAndSecurity => 'Είσοδος και ασφάλεια';

  @override
  String get administration => 'Διαχείριση';

  @override
  String get serverSettingsUsersLibraries =>
      'Ρυθμίσεις διακομιστή, χρήστες, βιβλιοθήκες';

  @override
  String get customization => 'Προσαρμογή';

  @override
  String get themeAndLayout => 'Θέμα και διάταξη';

  @override
  String get videoAndSubtitles => 'Βίντεο και υπότιτλοι';

  @override
  String get integrations => 'Ενσωματώσεις';

  @override
  String get pluginAndRequests => 'Πρόσθετο και αιτήματα';

  @override
  String get customizeAccountPlaybackInterface =>
      'Προσαρμόστε τη συμπεριφορά λογαριασμού, αναπαραγωγής και διεπαφής';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Θέμα & Εμφάνιση';

  @override
  String get focusBorderColor => 'Εστίαση χρώματος περιγράμματος';

  @override
  String get watchedIndicators => 'Παρακολούθησαν δείκτες';

  @override
  String get always => 'Πάντοτε';

  @override
  String get hideUnwatched => 'Απόκρυψη Unwatched';

  @override
  String get episodesOnly => 'Μόνο επεισόδια';

  @override
  String get never => 'Ποτέ';

  @override
  String get focusExpansionAnimation => 'Κινούμενη εικόνα επέκτασης εστίασης';

  @override
  String get desktopUiScale => 'Κλίμακα διεπαφής επιφάνειας εργασίας';

  @override
  String get scaleFocusedCards =>
      'Κλίμακα εστιασμένες ή τοποθετημένες κάρτες και πλακίδια';

  @override
  String get backgroundBackdrops => 'Φόντο φόντο';

  @override
  String get showBackdropImages =>
      'Εμφάνιση εικόνων φόντου πίσω από το περιεχόμενο';

  @override
  String get seriesThumbnails => 'Μικρογραφίες σειράς';

  @override
  String get seriesThumbnailsDescription =>
      'Μόνο επεισόδια: χρησιμοποιήστε έργα τέχνης σειράς που ταιριάζει με κάθε τύπο εικόνας σειράς';

  @override
  String get homeRowInfoOverlay =>
      'Επικάλυψη πληροφοριών σειράς αρχικής σελίδας';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Εμφάνιση τίτλου και μεταδεδομένων κατά την περιήγηση σε αρχικές σειρές';

  @override
  String get clockDisplay => 'Οθόνη ρολογιού';

  @override
  String get inMenus => 'Στα Μενού';

  @override
  String get inVideo => 'Σε βίντεο';

  @override
  String get seasonalEffects => 'Εποχικές Επιδράσεις';

  @override
  String get seasonalEffectsDescription =>
      'Οπτικά εφέ και εποχιακές διακοσμήσεις';

  @override
  String get snow => 'Χιόνι';

  @override
  String get fireworks => 'Πυροτεχνήματα';

  @override
  String get confetti => 'Κομφετί';

  @override
  String get fallingLeaves => 'που πέφτουν φύλλα';

  @override
  String get themeMusic => 'Θεματική Μουσική';

  @override
  String get playThemeMusicOnDetailPages =>
      'Αναπαραγωγή θεματικής μουσικής σε σελίδες λεπτομερειών';

  @override
  String get themeMusicVolume => 'Τόμος μουσικής θέματος';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Θεματική μουσική στις αρχικές σειρές';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Παίξτε κατά την περιήγηση στην αρχική οθόνη';

  @override
  String get detailsBackgroundBlur => 'Λεπτομέρειες Θάμπωμα φόντου';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Θάμπωμα φόντου περιήγησης';

  @override
  String get maxStreamingBitrate => 'Μέγιστος ρυθμός μετάδοσης bit ροής';

  @override
  String get maxResolution => 'Μέγιστη Ανάλυση';

  @override
  String get playerZoomMode => 'Λειτουργία ζουμ παίκτη';

  @override
  String get fit => 'Κατάλληλος';

  @override
  String get autoCrop => 'Αυτόματη περικοπή';

  @override
  String get stretch => 'Τέντωμα';

  @override
  String get refreshRateSwitching => 'Εναλλαγή ρυθμού ανανέωσης';

  @override
  String get disabled => 'Ανάπηρος';

  @override
  String get scaleOnTv => 'Κλίμακα στην τηλεόραση';

  @override
  String get scaleOnDevice => 'Κλίμακα στη συσκευή';

  @override
  String get trickPlay => 'Παίξτε κόλπο';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Εμφάνιση μικρογραφιών προεπισκόπησης κατά την αναζήτηση';

  @override
  String get showDescriptionOnPause => 'Εμφάνιση Περιγραφής σε Παύση';

  @override
  String get dimVideoShowOverview =>
      'Χαμηλώστε το βίντεο και εμφανίστε κείμενο επισκόπησης κατά την παύση';

  @override
  String get osdLockButton => 'Κουμπί κλειδώματος OSD';

  @override
  String get osdLockButtonDescription =>
      'Εμφάνιση ενός κουμπιού κλειδώματος που εμποδίζει την είσοδο αφής μέχρι να πατηθεί παρατεταμένα';

  @override
  String get audioBehavior => 'Συμπεριφορά ήχου';

  @override
  String get downmixToStereo => 'Downmix σε Stereo';

  @override
  String get defaultAudioLanguage => 'Προεπιλεγμένη γλώσσα ήχου';

  @override
  String get autoServerDefault => 'Αυτόματο (Προεπιλογή διακομιστή)';

  @override
  String get english => 'αγγλικός';

  @override
  String get spanish => 'ισπανικά';

  @override
  String get french => 'Γάλλος';

  @override
  String get german => 'Γερμανός';

  @override
  String get italian => 'ιταλικά';

  @override
  String get portuguese => 'Πορτογάλος';

  @override
  String get japanese => 'Ιαπωνικά';

  @override
  String get korean => 'κορεάτης';

  @override
  String get chinese => 'κινέζικα';

  @override
  String get russian => 'ρωσικός';

  @override
  String get arabic => 'αραβικός';

  @override
  String get hindi => 'Χίντι';

  @override
  String get dutch => 'Ολλανδός';

  @override
  String get swedish => 'σουηδικά';

  @override
  String get norwegian => 'Νορβηγός';

  @override
  String get danish => 'δανικός';

  @override
  String get finnish => 'φινλανδικός';

  @override
  String get polish => 'Στίλβωση';

  @override
  String get ac3Passthrough => 'AC3 Passthrough';

  @override
  String get dtsPassthrough => 'DTS Passthrough';

  @override
  String get trueHdSupport => 'Υποστήριξη TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Ήχος bitstream DTS μόνο σε AVR. απαιτεί υποστήριξη δέκτη και κομμάτι πηγής DTS';

  @override
  String get enableTrueHdAudio =>
      'Ενεργοποίηση ήχου TrueHD (ενδέχεται να μην λειτουργεί σε όλες τις πλατφόρμες)';

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
  String get nightMode => 'Νυχτερινή λειτουργία';

  @override
  String get compressDynamicRange => 'Συμπίεση δυναμικού εύρους';

  @override
  String get advancedMpv => 'Προηγμένο mpv';

  @override
  String get enableCustomMpvConf => 'Ενεργοποιήστε την προσαρμοσμένη mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Εφαρμόστε ένα mpv.conf που καθορίζεται από το χρήστη πριν από την έναρξη της αναπαραγωγής';

  @override
  String get unsafeAdvancedMpvOptions => 'Μη ασφαλείς προηγμένες επιλογές mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Επιτρέψτε ένα ευρύτερο σύνολο επιλογών mpv. Μπορεί να διακόψει τη συμπεριφορά αναπαραγωγής.';

  @override
  String get hardwareDecoding => 'Αποκωδικοποίηση υλικού';

  @override
  String get hardwareDecodingSubtitle =>
      'Μπορεί να βελτιώσει την απόδοση, αλλά μπορεί να προκαλέσει προβλήματα αναπαραγωγής σε ορισμένες συσκευές.';

  @override
  String get nextUpAndQueuing => 'Επόμενο Up & Ουρά';

  @override
  String get nextUpDisplay => 'Επόμενη Επόμενη Εμφάνιση';

  @override
  String get extended => 'Εκτεταμένη';

  @override
  String get minimal => 'Ελάχιστος';

  @override
  String get nextUpTimeout => 'Χρονικό όριο επόμενου χρόνου';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Ουρά πολυμέσων';

  @override
  String get autoQueueNextEpisodes => 'Αυτόματη ουρά επόμενων επεισοδίων';

  @override
  String get stillWatchingPrompt => 'Εξακολουθεί να παρακολουθεί την προτροπή';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Βιογραφικό & Παράλειψη';

  @override
  String get resumeRewind => 'Resume Rewind';

  @override
  String get unpauseRewind => 'Κατάργηση παύσης επαναφοράς';

  @override
  String get fiveSeconds => '5 δευτερόλεπτα';

  @override
  String get tenSeconds => '10 δευτερόλεπτα';

  @override
  String get fifteenSeconds => '15 δευτερόλεπτα';

  @override
  String get thirtySeconds => '30 δευτερόλεπτα';

  @override
  String get skipBackLength => 'Παράλειψη πίσω μήκους';

  @override
  String get skipForwardLength => 'Παράλειψη μήκους προς τα εμπρός';

  @override
  String get customMpvConfPath => 'Προσαρμοσμένη διαδρομή mpv.conf';

  @override
  String get notSetMpvConf =>
      'Δεν έχει οριστεί. Το Moonfin θα δοκιμάσει ένα προεπιλεγμένο mpv.conf σε φακέλους εφαρμογών/δεδομένων.';

  @override
  String get selectMpvConf => 'Επιλέξτε mpv.conf';

  @override
  String get pathToMpvConf => '/path/to/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Οι ρυθμίσεις στυλ (μέγεθος, χρώμα, μετατόπιση) ισχύουν για υπότιτλους που βασίζονται σε κείμενο (SRT, VTT, TTML). Οι υπότιτλοι ASS/SSA χρησιμοποιούν το δικό τους ενσωματωμένο στυλ, εκτός εάν είναι απενεργοποιημένο το \"ASS/SSA Direct Play\". Οι υπότιτλοι Bitmap (PGS, DVB, VobSub) δεν μπορούν να επανασχεδιαστούν.';

  @override
  String get defaultSubtitleLanguage => 'Προεπιλεγμένη γλώσσα υπότιτλων';

  @override
  String get defaultToNoSubtitles => 'Προεπιλογή σε Χωρίς υπότιτλους';

  @override
  String get turnOffSubtitlesByDefault =>
      'Απενεργοποιήστε τους υπότιτλους από προεπιλογή';

  @override
  String get subtitleSize => 'Μέγεθος υπότιτλων';

  @override
  String get textFillColor => 'Χρώμα πλήρωσης κειμένου';

  @override
  String get backgroundColor => 'Χρώμα φόντου';

  @override
  String get textStrokeColor => 'Χρώμα περιγράμματος κειμένου';

  @override
  String get subtitleCustomization => 'Προσαρμογή υπότιτλων';

  @override
  String get subtitleCustomizationDescription =>
      'Προσαρμόστε την εμφάνιση των υπότιτλων';

  @override
  String get subtitlePreviewText =>
      'Η γρήγορη καφετιά αλεπού πηδά πάνω από το τεμπέλικο σκυλί';

  @override
  String get verticalOffset => 'Κάθετη μετατόπιση';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'Άμεση αναπαραγωγή υπότιτλων PGS';

  @override
  String get assSsaDirectPlay => 'Απευθείας αναπαραγωγή ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Απευθείας αναπαραγωγή υπότιτλων ASS/SSA';

  @override
  String get white => 'Λευκό';

  @override
  String get black => 'Μαύρος';

  @override
  String get yellow => 'Κίτρινος';

  @override
  String get green => 'Πράσινος';

  @override
  String get cyan => 'κυανό';

  @override
  String get red => 'Κόκκινος';

  @override
  String get transparent => 'Διαφανής';

  @override
  String get semiTransparentBlack => 'Ημιδιάφανο Μαύρο';

  @override
  String get global => 'Καθολικός';

  @override
  String get desktop => 'Επιτραπέζιος υπολογιστής';

  @override
  String get mobile => 'Κινητός';

  @override
  String get tv => 'τηλεόραση';

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
  String get customizationProfile => 'Προφίλ προσαρμογής';

  @override
  String get customizationProfileDescription =>
      'Επιλέξτε το προφίλ για φόρτωση, επεξεργασία και συγχρονισμό. Το καθολικό ισχύει παντού, εκτός εάν το προφίλ συσκευής το παρακάμψει. Η πράσινη κουκκίδα σηματοδοτεί το τρέχον προφίλ της συσκευής σας.';

  @override
  String get loadProfile => 'Φόρτωση προφίλ';

  @override
  String get syncing => 'Συγχρονισμός...';

  @override
  String get syncToProfile => 'Συγχρονισμός στο προφίλ';

  @override
  String get profileSyncHidden => 'Συγχρονισμός προφίλ κρυφός';

  @override
  String get enablePluginSyncDescription =>
      'Ενεργοποιήστε το Server Plugin Sync στις ρυθμίσεις Plugin για να εμφανίζονται τα στοιχεία ελέγχου προφίλ εδώ.';

  @override
  String get quality => 'Ποιότητα';

  @override
  String get defaultDownloadQuality => 'Προεπιλεγμένη ποιότητα λήψης';

  @override
  String get network => 'Δίκτυο';

  @override
  String get wifiOnlyDownloads => 'Λήψεις μόνο με WiFi';

  @override
  String get onlyDownloadOnWifi => 'Λήψη μόνο όταν είναι συνδεδεμένο σε WiFi';

  @override
  String get storage => 'Αποθήκευση';

  @override
  String get storageUsed => 'Αποθήκευση που χρησιμοποιείται';

  @override
  String get manage => 'Διαχειρίζομαι';

  @override
  String get calculating => 'Υπολογιστικός...';

  @override
  String get downloadLocation => 'Λήψη τοποθεσίας';

  @override
  String get defaultLabel => 'Αθέτηση';

  @override
  String get saveToDownloadsFolder => 'Αποθήκευση στο φάκελο \"Λήψεις\".';

  @override
  String get downloadsVisibleToOtherApps =>
      'Λήψεις/Moonfin — ορατό σε άλλες εφαρμογές';

  @override
  String get dangerZone => 'Επικίνδυνη Ζώνη';

  @override
  String get clearAllDownloads => 'Εκκαθάριση όλων των λήψεων';

  @override
  String get original => 'Πρωτότυπο';

  @override
  String get changeDownloadLocation => 'Αλλαγή τοποθεσίας λήψης';

  @override
  String get changeDownloadLocationDescription =>
      'Οι νέες λήψεις θα αποθηκευτούν στον επιλεγμένο φάκελο. Οι υπάρχουσες λήψεις θα παραμείνουν στην τρέχουσα θέση τους και η διαχείριση τους είναι δυνατή από τις ρυθμίσεις αποθήκευσης.';

  @override
  String get confirm => 'Επιβεβαιώνω';

  @override
  String get cannotWriteToFolder =>
      'Δεν είναι δυνατή η εγγραφή στον επιλεγμένο φάκελο. Επιλέξτε διαφορετική τοποθεσία ή παραχωρήστε δικαιώματα αποθήκευσης.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Αποθήκευση στο φάκελο \"Λήψεις\";';

  @override
  String get saveToDownloadsFolderDescription =>
      'Τα ληφθέντα πολυμέσα θα αποθηκευτούν στο Downloads/Moonfin της συσκευής σας. Αυτά τα αρχεία θα είναι ορατά σε άλλες εφαρμογές, όπως η γκαλερί ή το πρόγραμμα αναπαραγωγής μουσικής.\n\nΟι υπάρχουσες λήψεις θα παραμείνουν στην τρέχουσα θέση τους.';

  @override
  String get enable => 'Καθιστώ ικανό';

  @override
  String get clearAllDownloadsWarning =>
      'Αυτό θα διαγράψει όλα τα ληφθέντα μέσα και δεν μπορεί να αναιρεθεί.';

  @override
  String get clearAll => 'Εκκαθάριση όλων';

  @override
  String get navigationStyle => 'Στυλ πλοήγησης';

  @override
  String get topBar => 'Top Bar';

  @override
  String get leftSidebar => 'Αριστερή πλευρική γραμμή';

  @override
  String get showShuffleButton => 'Εμφάνιση κουμπιού τυχαίας αναπαραγωγής';

  @override
  String get showGenresButton => 'Κουμπί εμφάνισης ειδών';

  @override
  String get showFavoritesButton => 'Εμφάνιση κουμπιού αγαπημένων';

  @override
  String get showLibrariesInToolbar => 'Εμφάνιση βιβλιοθηκών στο Toolbar';

  @override
  String get navbarOpacity => 'Αδιαφάνεια γραμμής πλοήγησης';

  @override
  String get navbarColor => 'Χρώμα γραμμής πλοήγησης';

  @override
  String get gray => 'Γκρί';

  @override
  String get darkBlue => 'Σκούρο Μπλε';

  @override
  String get purple => 'Μωβ';

  @override
  String get teal => 'Βάσκας';

  @override
  String get navy => 'Ναυτικό';

  @override
  String get charcoal => 'Ξυλάνθρακας';

  @override
  String get brown => 'Καστανός';

  @override
  String get darkRed => 'Σκούρο κόκκινο';

  @override
  String get darkGreen => 'Σκούρο Πράσινο';

  @override
  String get slate => 'Σχιστόλιθος';

  @override
  String get indigo => 'Ινδικό';

  @override
  String get libraryDisplay => 'Εμφάνιση βιβλιοθήκης';

  @override
  String get posterLabel => 'Αφίσα';

  @override
  String get thumbnailLabel => 'Ονυξ του αντίχειρος';

  @override
  String get bannerLabel => 'Σημαία';

  @override
  String get overridePerLibrarySettings =>
      'Παράκαμψη των ρυθμίσεων ανά βιβλιοθήκη';

  @override
  String get applyImageTypeToAllLibraries =>
      'Εφαρμογή τύπου εικόνας σε όλες τις βιβλιοθήκες';

  @override
  String get multiServerLibraries => 'Βιβλιοθήκες πολλών διακομιστών';

  @override
  String get showLibrariesFromAllServers =>
      'Εμφάνιση βιβλιοθηκών από όλους τους συνδεδεμένους διακομιστές';

  @override
  String get enableFolderView => 'Ενεργοποίηση Προβολή φακέλου';

  @override
  String get showFolderBrowsingOption => 'Εμφάνιση επιλογής περιήγησης φακέλου';

  @override
  String get libraryVisibility => 'Βιβλιοθήκη Ορατότητα';

  @override
  String get libraryVisibilityDescription =>
      'Εναλλαγή ορατότητας αρχικής σελίδας ανά βιβλιοθήκη. Επανεκκινήστε το Moonfin για να τεθούν σε ισχύ οι αλλαγές.';

  @override
  String get showInNavigation => 'Εμφάνιση στην πλοήγηση';

  @override
  String get showInLatestMedia => 'Εμφάνιση στα πιο πρόσφατα μέσα';

  @override
  String get sourceLibraries => 'Βιβλιοθήκες Πηγών';

  @override
  String get sourceCollections => 'Συλλογές Πηγών';

  @override
  String get excludedGenres => 'Εξαιρούμενα είδη';

  @override
  String get selectAll => 'Επιλέξτε Όλα';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Media Bar';

  @override
  String get mediaSources => 'Πηγές ΜΜΕ';

  @override
  String get behavior => 'Συμπεριφορά';

  @override
  String get seconds => 'δευτερόλεπτα';

  @override
  String get localPreviews => 'Τοπικές προεπισκοπήσεις';

  @override
  String get localPreviewsDescription =>
      'Διαμόρφωση προεπισκοπήσεων τρέιλερ, πολυμέσων και ήχου.';

  @override
  String get mediaBarMode => 'Στυλ μπαρ πολυμέσων';

  @override
  String get mediaBarModeDescription =>
      'Επιλέξτε μεταξύ Moonfin, MakD ή απενεργοποιήστε τη γραμμή πολυμέσων';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Μακριά από';

  @override
  String get enableMediaBar => 'Ενεργοποιήστε τη γραμμή πολυμέσων';

  @override
  String get showFeaturedContentSlideshow =>
      'Εμφάνιση παρουσίασης επιλεγμένου περιεχομένου στο σπίτι';

  @override
  String get contentType => 'Τύπος περιεχομένου';

  @override
  String get moviesAndTvShows => 'Ταινίες & τηλεοπτικές εκπομπές';

  @override
  String get moviesOnly => 'Μόνο ταινίες';

  @override
  String get tvShowsOnly => 'Μόνο τηλεοπτικές εκπομπές';

  @override
  String get itemCount => 'Πλήθος αντικειμένων';

  @override
  String get noneSelected => 'Καμία επιλεγμένη';

  @override
  String get noneExcluded => 'Δεν αποκλείεται κανένα';

  @override
  String get autoAdvance => 'Αυτόματη προώθηση';

  @override
  String get autoAdvanceSlides => 'Αυτόματη μετάβαση στην επόμενη διαφάνεια';

  @override
  String get autoAdvanceInterval => 'Διάστημα αυτόματης προώθησης';

  @override
  String get trailerPreview => 'Προεπισκόπηση τρέιλερ';

  @override
  String get autoPlayTrailers =>
      'Αυτόματη αναπαραγωγή τρέιλερ στη γραμμή πολυμέσων μετά από 3 δευτερόλεπτα';

  @override
  String get episodePreview => 'Προεπισκόπηση επεισοδίου';

  @override
  String get mediaPreview => 'Προεπισκόπηση πολυμέσων';

  @override
  String get episodePreviewDescription =>
      'Παίξτε μια ενσωματωμένη προεπισκόπηση 30 δευτερολέπτων σε εστιασμένα, αιωρούμενα ή πατημένα μακροχρόνια φύλλα';

  @override
  String get mediaPreviewDescription =>
      'Παίξτε μια ενσωματωμένη προεπισκόπηση 30 δευτερολέπτων σε εστιασμένα, αιωρούμενα ή πατημένα μακροχρόνια φύλλα';

  @override
  String get previewAudio => 'Προεπισκόπηση ήχου';

  @override
  String get enablePreviewAudio =>
      'Ενεργοποίηση ήχου για προεπισκοπήσεις τρέιλερ και επεισοδίων';

  @override
  String get latestMedia => 'Τελευταία ΜΜΕ';

  @override
  String get recentlyReleased => 'Πρόσφατα κυκλοφόρησε';

  @override
  String get myMedia => 'Τα Μέσα μου';

  @override
  String get myMediaSmall => 'Τα πολυμέσα μου (μικρά)';

  @override
  String get continueWatching => 'Συνεχίστε την παρακολούθηση';

  @override
  String get resumeAudio => 'Συνέχιση ήχου';

  @override
  String get resumeBooks => 'Βιβλία βιογραφικών';

  @override
  String get activeRecordings => 'Ενεργές Ηχογραφήσεις';

  @override
  String get playlists => 'Λίστες αναπαραγωγής';

  @override
  String get liveTV => 'Ζωντανή τηλεόραση';

  @override
  String get homeSections => 'Αρχική Ενότητες';

  @override
  String get resetToDefaults => 'Επαναφορά στις προεπιλογές';

  @override
  String get homeRowPosterSize => 'Μέγεθος αφίσας αρχικής σειράς';

  @override
  String get perRowImageTypeSelection => 'Επιλογή τύπου εικόνας ανά σειρά';

  @override
  String get configureImageTypeForEachRow =>
      'Διαμορφώστε τον τύπο εικόνας για κάθε ενεργοποιημένη αρχική σειρά';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Συγχώνευση Continue Watching και Next Up';

  @override
  String get combineBothRows =>
      'Συνδυάστε και τις δύο σειρές σε ένα ενιαίο αρχικό τμήμα';

  @override
  String get perRowImageType => 'Τύπος εικόνας ανά σειρά';

  @override
  String get perRowSettings => 'Ρυθμίσεις ανά σειρά';

  @override
  String get autoLogin => 'Αυτόματη σύνδεση';

  @override
  String get lastUser => 'Τελευταίος χρήστης';

  @override
  String get specificUser => 'Συγκεκριμένος χρήστης';

  @override
  String get alwaysAuthenticate => 'Πάντα έλεγχος ταυτότητας';

  @override
  String get requirePasswordWithToken =>
      'Απαιτείται κωδικός πρόσβασης ακόμη και με αποθηκευμένο διακριτικό';

  @override
  String get confirmExit => 'Επιβεβαιώστε την έξοδο';

  @override
  String get showConfirmationBeforeExiting =>
      'Εμφάνιση επιβεβαίωσης πριν από την έξοδο';

  @override
  String get blockContentWithRatings =>
      'Αποκλεισμός περιεχομένου με τις ακόλουθες αξιολογήσεις:';

  @override
  String get noContentRatingsFound =>
      'Δεν βρέθηκαν ακόμη αξιολογήσεις περιεχομένου σε αυτόν τον διακομιστή.';

  @override
  String get couldNotLoadServerRatings =>
      'Δεν ήταν δυνατή η φόρτωση των αξιολογήσεων διακομιστή. Εμφάνιση μόνο αποθηκευμένων αξιολογήσεων.';

  @override
  String get couldNotRefreshRatings =>
      'Δεν ήταν δυνατή η ανανέωση των αξιολογήσεων από τον διακομιστή. Εμφάνιση αποθηκευμένων αξιολογήσεων.';

  @override
  String get enablePinCode => 'Ενεργοποίηση κωδικού PIN';

  @override
  String get requirePinToAccess =>
      'Απαιτείται PIN για πρόσβαση στον λογαριασμό σας';

  @override
  String get changePin => 'Αλλαγή PIN';

  @override
  String get setNewPinCode => 'Ορίστε έναν νέο κωδικό PIN';

  @override
  String get removePin => 'Αφαίρεση PIN';

  @override
  String get removePinProtection => 'Αφαιρέστε την προστασία κωδικού PIN';

  @override
  String get screensaver => 'Προφύλαξη οθόνης';

  @override
  String get inAppScreensaver => 'Προφύλαξη οθόνης εντός εφαρμογής';

  @override
  String get enableBuiltInScreensaver =>
      'Ενεργοποιήστε την ενσωματωμένη προφύλαξη οθόνης';

  @override
  String get mode => 'Τρόπος';

  @override
  String get libraryArt => 'Τέχνη βιβλιοθήκης';

  @override
  String get logo => 'Λογότυπο';

  @override
  String get clock => 'Ρολόι';

  @override
  String get timeout => 'Timeout';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Επίπεδο θαμπώματος';

  @override
  String get maxAgeRating => 'Μέγιστη βαθμολογία ηλικίας';

  @override
  String get any => 'Κάθε';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Απαιτείται ηλικιακή αξιολόγηση';

  @override
  String get onlyShowRatedContent =>
      'Εμφάνιση μόνο βαθμολογημένου περιεχομένου';

  @override
  String get showClock => 'Εμφάνιση ρολογιού';

  @override
  String get displayClockDuringScreensaver =>
      'Εμφάνιση ρολογιού κατά την προφύλαξη οθόνης';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Κριτικοί)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Κοινό)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Μετακριτικό';

  @override
  String get metacriticUser => 'Metacritic (Χρήστης)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Γραμματοκιβώτιο';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Βαθμολογία κοινότητας';

  @override
  String get ratings => 'Ακροαματικότητα';

  @override
  String get additionalRatings => 'Πρόσθετες αξιολογήσεις';

  @override
  String get showMdbListAndTmdbRatings =>
      'Εμφάνιση αξιολογήσεων MDBLlist και TMDB';

  @override
  String get ratingLabels => 'Ετικέτες αξιολόγησης';

  @override
  String get showLabelsNextToIcons =>
      'Εμφάνιση ετικετών δίπλα στα εικονίδια αξιολόγησης';

  @override
  String get ratingBadges => 'Σήματα αξιολόγησης';

  @override
  String get showDecorativeBadges =>
      'Εμφάνιση διακοσμητικών σημάτων πίσω από τις αξιολογήσεις';

  @override
  String get episodeRatings => 'Βαθμολογίες επεισοδίου';

  @override
  String get showRatingsOnEpisodes =>
      'Εμφάνιση αξιολογήσεων σε μεμονωμένα επεισόδια';

  @override
  String get ratingSources => 'Πηγές αξιολόγησης';

  @override
  String get ratingSourcesDescription =>
      'Ενεργοποιήστε και αναδιατάξτε τις πηγές αξιολόγησης που εμφανίζονται σε όλη την εφαρμογή';

  @override
  String get pluginLabel => 'Πρόσθετο';

  @override
  String get pluginDetected => 'Εντοπίστηκε πρόσθετο';

  @override
  String get pluginNotDetected => 'Το πρόσθετο δεν εντοπίστηκε';

  @override
  String get pluginDetectedDescription =>
      'Εντοπίστηκε προσθήκη διακομιστή. Ο συγχρονισμός ενεργοποιείται αυτόματα την πρώτη φορά που εντοπίζεται η προσθήκη.';

  @override
  String get pluginNotDetectedDescription =>
      'Η προσθήκη διακομιστή δεν έχει εντοπιστεί αυτήν τη στιγμή. Οι τοπικές ρυθμίσεις εξακολουθούν να χρησιμοποιούν τις αποθηκευμένες τιμές ή τις ενσωματωμένες προεπιλογές τους.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Διαθέσιμες Υπηρεσίες';

  @override
  String get serverPluginSync => 'Συγχρονισμός προσθηκών διακομιστή';

  @override
  String get syncSettingsWithPlugin =>
      'Συγχρονισμός ρυθμίσεων με την προσθήκη διακομιστή';

  @override
  String get whatSyncControls => 'Τι στοιχεία ελέγχου συγχρονισμού';

  @override
  String get syncControlsDescription =>
      'Ο συγχρονισμός ελέγχει μόνο εάν οι ρυθμίσεις που υποστηρίζονται από πρόσθετα προωθούνται και αποσύρονται από τον διακομιστή. Οι ενέργειες επιλογής προφίλ και συγχρονισμού προφίλ βρίσκονται στις ρυθμίσεις προσαρμογής όταν ο συγχρονισμός προσθηκών είναι ενεργοποιημένος.';

  @override
  String get recentRequests => 'Πρόσφατα αιτήματα';

  @override
  String get recentlyAdded => 'Προστέθηκε πρόσφατα';

  @override
  String get trending => 'Τάσεις';

  @override
  String get popularMovies => 'Δημοφιλείς ταινίες';

  @override
  String get movieGenres => 'Είδη ταινιών';

  @override
  String get upcomingMovies => 'Προσεχείς ταινίες';

  @override
  String get studios => 'Στούντιο';

  @override
  String get popularSeries => 'Δημοφιλείς σειρές';

  @override
  String get seriesGenres => 'Είδη σειράς';

  @override
  String get upcomingSeries => 'Ερχόμενη Σειρά';

  @override
  String get networks => 'Δίκτυα';

  @override
  String get resetRowsToDefaults => 'Επαναφέρετε τις σειρές στις προεπιλογές';

  @override
  String get enableSeerr => 'Ενεργοποίηση Seerr';

  @override
  String get showSeerrInNavigation =>
      'Εμφάνιση Seerr στην πλοήγηση (απαιτείται προσθήκη διακομιστή)';

  @override
  String get seerrUnavailable =>
      'Μη διαθέσιμο επειδή η υποστήριξη της προσθήκης διακομιστή Seerr είναι απενεργοποιημένη.';

  @override
  String get nsfwFilter => 'Φίλτρο NSFW';

  @override
  String get hideAdultContent =>
      'Απόκρυψη περιεχομένου για ενηλίκους στα αποτελέσματα';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Ανακαλύψτε σειρές';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Σύρετε για αναδιάταξη. Ενεργοποίηση ή απενεργοποίηση σειρών. Ενεργοποιημένος συγχρονισμός σειράς σειράς με την προσθήκη Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Σύρετε για αναδιάταξη. Ενεργοποίηση ή απενεργοποίηση σειρών.';

  @override
  String get enabled => 'Ενεργοποιημένο';

  @override
  String get hidden => 'Κεκρυμμένος';

  @override
  String get aboutTitle => 'Για';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Άδειες ανοιχτού κώδικα';

  @override
  String get sourceCode => 'Πηγαίος κώδικας';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Ελέγξτε για ενημερώσεις τώρα';

  @override
  String get checksLatestDesktopRelease =>
      'Ελέγχει την τελευταία έκδοση για υπολογιστές για αυτήν την πλατφόρμα';

  @override
  String get youAreUpToDate => 'Είστε ενημερωμένοι.';

  @override
  String get couldNotCheckForUpdates =>
      'Δεν ήταν δυνατός ο έλεγχος για ενημερώσεις αυτήν τη στιγμή.';

  @override
  String get noCompatibleUpdate =>
      'Δεν βρέθηκε συμβατό πακέτο ενημέρωσης για αυτήν την πλατφόρμα.';

  @override
  String get updateChecksNotSupported =>
      'Οι έλεγχοι ενημέρωσης δεν υποστηρίζονται σε αυτήν την πλατφόρμα.';

  @override
  String get updateNotificationsDisabled =>
      'Οι ειδοποιήσεις ενημέρωσης είναι απενεργοποιημένες.';

  @override
  String get pleaseWaitBeforeChecking => 'Περιμένετε πριν ελέγξετε ξανά.';

  @override
  String get latestUpdateAlreadyShown =>
      'Η τελευταία ενημέρωση εμφανίστηκε ήδη.';

  @override
  String get updateAvailable => 'Διαθέσιμη ενημέρωση.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Ενημέρωση ειδοποιήσεων';

  @override
  String get showWhenUpdatesAvailable =>
      'Εμφάνιση πότε είναι διαθέσιμες ενημερώσεις';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Διαβάστε τις Σημειώσεις Έκδοσης';

  @override
  String get downloadingUpdate => 'Λήψη ενημέρωσης...';

  @override
  String get updateDownloadFailed =>
      'Η λήψη της ενημέρωσης απέτυχε. Δοκιμάστε ξανά.';

  @override
  String get openReleasesPage => 'Ανοίξτε τη σελίδα εκδόσεων';

  @override
  String get navigation => 'Πλοήγηση';

  @override
  String get watchedIndicatorsBackdrops => 'Παρακολούθησαν δείκτες, σκηνικά';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Χρώμα εστίασης, δείκτες παρακολούθησης, σκηνικά';

  @override
  String get navbarStyleToolbarAppearance =>
      'Στυλ γραμμής πλοήγησης, κουμπιά γραμμής εργαλείων, εμφάνιση';

  @override
  String get reorderToggleHomeRows => 'Αναδιάταξη και εναλλαγή αρχικών σειρών';

  @override
  String get featuredContentAppearance => 'Επιλεγμένο περιεχόμενο, εμφάνιση';

  @override
  String get posterSizeImageTypeFolderView =>
      'Μέγεθος αφίσας, τύπος εικόνας, προβολή φακέλου';

  @override
  String get mdbListTmdbRatingSources => 'MDBLlist, TMDB και πηγές αξιολόγησης';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Σαφής';

  @override
  String get browse => 'Ξεφυλλίζω';

  @override
  String get noResults => 'Κανένα αποτέλεσμα';

  @override
  String get seerrAvailableStatus => 'Διαθέσιμος';

  @override
  String get seerrRequestedStatus => 'Ζητήθηκε';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Ρυθμίσεις Seer';

  @override
  String get requestMore => 'Ζητήστε περισσότερα';

  @override
  String get request => 'Αίτηση';

  @override
  String get cancelRequest => 'Ακύρωση αιτήματος';

  @override
  String get playInMoonfin => 'Παίξτε στο Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Εγκρίνω';

  @override
  String get declineAction => 'Πτώση';

  @override
  String get similar => 'Παρόμοιος';

  @override
  String get recommendations => 'συστάσεις';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Διατήρηση';

  @override
  String get itemNotFoundInLibrary =>
      'Το αντικείμενο δεν βρέθηκε στη βιβλιοθήκη σας Moonfin';

  @override
  String get errorSearchingLibrary => 'Σφάλμα αναζήτησης στη βιβλιοθήκη';

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
  String get submitRequest => 'Υποβολή Αίτησης';

  @override
  String get allSeasons => 'Όλες τις εποχές';

  @override
  String get advancedOptions => 'Προηγμένες Επιλογές';

  @override
  String get noServiceServersConfigured =>
      'Δεν έχουν διαμορφωθεί διακομιστές υπηρεσιών';

  @override
  String get server => 'Υπηρέτης';

  @override
  String get qualityProfile => 'Προφίλ ποιότητας';

  @override
  String get rootFolder => 'Ριζικός φάκελος';

  @override
  String get showMore => 'Εμφάνιση περισσότερων';

  @override
  String get appearances => 'Εμφανίσεις';

  @override
  String get crewSection => 'Πλήρωμα';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Κανένα αίτημα';

  @override
  String get pendingStatus => 'Εκκρεμής';

  @override
  String get declinedStatus => 'Απορρίφθηκε';

  @override
  String get partiallyAvailable => 'Μερικώς Διαθέσιμο';

  @override
  String get downloadingStatus => 'Λήψη';

  @override
  String get approvedStatus => 'Εγκρίθηκε';

  @override
  String get notRequestedStatus => 'Δεν ζητήθηκε';

  @override
  String get blocklistedStatus => 'Στη λίστα αποκλεισμού';

  @override
  String get deletedStatus => 'Διαγράφηκε';

  @override
  String get tmdbScore => 'Βαθμολογία TMDB';

  @override
  String get releaseDateLabel => 'Ημερομηνία κυκλοφορίας';

  @override
  String get firstAirDateLabel => 'Ραντεβού πρώτου αέρα';

  @override
  String get revenueLabel => 'Πρόσοδος';

  @override
  String get runtimeLabel => 'Χρόνος εκτέλεσης';

  @override
  String get budgetLabel => 'Προϋπολογισμός';

  @override
  String get originalLanguageLabel => 'Γλώσσα Πρωτότυπου';

  @override
  String get seasonsLabel => 'εποχές';

  @override
  String get episodesLabel => 'Επεισόδια';

  @override
  String get access => 'Πρόσβαση';

  @override
  String get add => 'Προσθέτω';

  @override
  String get address => 'Διεύθυνση';

  @override
  String get analytics => 'Analytics';

  @override
  String get catalog => 'Κατάλογος';

  @override
  String get content => 'Περιεχόμενο';

  @override
  String get copy => 'Αντίγραφο';

  @override
  String get create => 'Δημιουργώ';

  @override
  String get disable => 'Καθιστώ ανίκανο';

  @override
  String get done => 'Γινώμενος';

  @override
  String get edit => 'Εκδίδω';

  @override
  String get encoding => 'Κωδικοποίηση';

  @override
  String get error => 'Σφάλμα';

  @override
  String get forward => 'Προς τα εμπρός';

  @override
  String get general => 'Γενικός';

  @override
  String get go => 'Πάω';

  @override
  String get install => 'Εγκαθιστώ';

  @override
  String get installed => 'Εγκατεστημένο';

  @override
  String get interval => 'Διάστημα';

  @override
  String get name => 'Ονομα';

  @override
  String get networking => 'Δικτύωση';

  @override
  String get next => 'Επόμενος';

  @override
  String get path => 'Μονοπάτι';

  @override
  String get paused => 'Σε παύση';

  @override
  String get permissions => 'Άδειες';

  @override
  String get processing => 'Επεξεργασία';

  @override
  String get profile => 'Προφίλ';

  @override
  String get provider => 'Προμηθευτής';

  @override
  String get refresh => 'Φρεσκάρω';

  @override
  String get remote => 'Μακρινός';

  @override
  String get rename => 'Μετονομάζω';

  @override
  String get revoke => 'Ανακαλώ';

  @override
  String get role => 'Ρόλος';

  @override
  String get root => 'Ρίζα';

  @override
  String get run => 'Τρέξιμο';

  @override
  String get search => 'Ερευνα';

  @override
  String get select => 'Επιλέγω';

  @override
  String get send => 'Στέλνω';

  @override
  String get sessions => 'Συνεδρίες';

  @override
  String get set => 'Σειρά';

  @override
  String get status => 'Κατάσταση';

  @override
  String get stop => 'Στάση';

  @override
  String get streaming => 'Ροή';

  @override
  String get time => 'Φορά';

  @override
  String get trickplay => 'Κόλπος';

  @override
  String get uninstall => 'Απεγκατάσταση';

  @override
  String get up => 'Επάνω';

  @override
  String get update => 'Εκσυγχρονίζω';

  @override
  String get upload => 'Μεταφόρτωση';

  @override
  String get unmute => 'Κατάργηση σίγασης';

  @override
  String get mute => 'Βουβός';

  @override
  String get branding => 'Επωνυμία';

  @override
  String get adminDrawerDashboard => 'Ταμπλό';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Ρυθμίσεις';

  @override
  String get adminDrawerBranding => 'Επωνυμία';

  @override
  String get adminDrawerUsers => 'Χρήστες';

  @override
  String get adminDrawerLibraries => 'Βιβλιοθήκες';

  @override
  String get adminDrawerTranscoding => 'Διακωδικοποίηση';

  @override
  String get adminDrawerResume => 'Περίληψη';

  @override
  String get adminDrawerStreaming => 'Ροή';

  @override
  String get adminDrawerTrickplay => 'Κόλπος';

  @override
  String get adminDrawerDevices => 'Συσκευές';

  @override
  String get adminDrawerActivity => 'Δραστηριότητα';

  @override
  String get adminDrawerNetworking => 'Δικτύωση';

  @override
  String get adminDrawerApiKeys => 'Κλειδιά API';

  @override
  String get adminDrawerBackups => 'Αντίγραφα ασφαλείας';

  @override
  String get adminDrawerLogs => 'κούτσουρα';

  @override
  String get adminDrawerScheduledTasks => 'Προγραμματισμένες εργασίες';

  @override
  String get adminDrawerPlugins => 'Πρόσθετα';

  @override
  String get adminDrawerRepositories => 'Αποθετήρια';

  @override
  String get adminDrawerLiveTv => 'Ζωντανή τηλεόραση';

  @override
  String get adminExitTooltip => 'Έξοδος από το Admin';

  @override
  String get adminDashboardLoadFailed => 'Η φόρτωση του πίνακα ελέγχου απέτυχε';

  @override
  String get adminMediaOverview => 'Επισκόπηση πολυμέσων';

  @override
  String get adminMediaTotalsError =>
      'Δεν ήταν δυνατή η φόρτωση των συνόλων μέσων διακομιστή.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Μια γρήγορη ανάγνωση για το πόσο περιεχόμενο υπάρχει σε αυτόν τον διακομιστή.';

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
  String get analyticsMediaDistribution => 'Διανομή μέσων';

  @override
  String get analyticsVideoCodecs => 'Κωδικοποιητές βίντεο';

  @override
  String get analyticsAudioCodecs => 'Κωδικοποιητές ήχου';

  @override
  String get analyticsContainers => 'Εμπορευματοκιβώτια';

  @override
  String get analyticsTopGenres => 'Κορυφαία είδη';

  @override
  String get analyticsReleaseYears => 'Χρόνια κυκλοφορίας';

  @override
  String get analyticsContentRatings => 'Αξιολογήσεις περιεχομένου';

  @override
  String get analyticsRuntimeBuckets => 'Κάδοι χρόνου εκτέλεσης';

  @override
  String get analyticsFileFormats => 'Μορφές αρχείων';

  @override
  String get analyticsNoData => 'Δεν υπάρχουν διαθέσιμα δεδομένα.';

  @override
  String get adminServerInfo => 'Πληροφορίες διακομιστή';

  @override
  String get adminRestartPending => 'Επανεκκίνηση σε εκκρεμότητα';

  @override
  String get adminServerPaths => 'Διαδρομές διακομιστή';

  @override
  String get adminServerActions => 'Ενέργειες διακομιστή';

  @override
  String get adminRestartServer => 'Επανεκκινήστε τον διακομιστή';

  @override
  String get adminShutdownServer => 'Διακομιστής τερματισμού λειτουργίας';

  @override
  String get adminScanLibraries => 'Σάρωση βιβλιοθηκών';

  @override
  String get adminLibraryScanStarted => 'Η σάρωση της βιβλιοθήκης ξεκίνησε';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Επανεκκίνηση διακομιστή σε εξέλιξη';

  @override
  String get adminServerRebootMessage =>
      'Η επανεκκίνηση του διακομιστή βρίσκεται σε εξέλιξη, επανεκκινήστε το Moonfin';

  @override
  String get adminActiveSessions => 'Ενεργές συνεδρίες';

  @override
  String get adminSessionsLoadFailed => 'Αποτυχία φόρτωσης συνεδριών';

  @override
  String get adminNoActiveSessions => 'Δεν υπάρχουν ενεργές συνεδρίες';

  @override
  String get adminRecentActivity => 'Πρόσφατη Δραστηριότητα';

  @override
  String get adminNoRecentActivity => 'Καμία πρόσφατη δραστηριότητα';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Αποστολή μηνύματος';

  @override
  String get adminMessageTextHint => 'Κείμενο μηνύματος';

  @override
  String get adminSetVolume => 'Ρύθμιση έντασης';

  @override
  String get sessionPrev => 'Προηγ';

  @override
  String get sessionRewind => 'Πίσω';

  @override
  String get sessionForward => 'Προς τα εμπρός';

  @override
  String get sessionNext => 'Επόμενος';

  @override
  String get sessionVolumeDown => 'τόμος -';

  @override
  String get sessionVolumeUp => 'Τόμος +';

  @override
  String get uhd4k => '4Κ';

  @override
  String get nowPlaying => 'Παίζει τώρα';

  @override
  String get volume => 'Τόμος';

  @override
  String get actions => 'Δράσεις';

  @override
  String get videoCodec => 'Κωδικοποιητής βίντεο';

  @override
  String get audioCodec => 'Κωδικοποιητής ήχου';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Ολοκλήρωση';

  @override
  String get direct => 'Απευθείας';

  @override
  String get adminDisconnect => 'Αποσυνδέω';

  @override
  String get adminClearDates => 'Καθαρές ημερομηνίες';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries =>
      'Δεν υπάρχουν καταχωρήσεις δραστηριότητας';

  @override
  String get adminEditDeviceName => 'Επεξεργασία ονόματος συσκευής';

  @override
  String get adminCustomName => 'Προσαρμοσμένο όνομα';

  @override
  String get adminDeviceNameUpdated => 'Το όνομα συσκευής ενημερώθηκε';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Διαγραφή συσκευής';

  @override
  String get adminDeviceDeleted => 'Η συσκευή διαγράφηκε';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Αποτυχία φόρτωσης συσκευών';

  @override
  String get adminSearchDevices => 'Αναζήτηση συσκευών';

  @override
  String get adminThisDevice => 'Αυτή η Συσκευή';

  @override
  String get adminEditName => 'Επεξεργασία ονόματος';

  @override
  String get adminLibrariesLoadFailed => 'Αποτυχία φόρτωσης βιβλιοθηκών';

  @override
  String get adminNoLibraries => 'Δεν έχουν διαμορφωθεί βιβλιοθήκες';

  @override
  String get adminScanAllLibraries => 'Σάρωση όλων των βιβλιοθηκών';

  @override
  String get adminAddLibrary => 'Προσθήκη βιβλιοθήκης';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Μετονομασία Βιβλιοθήκης';

  @override
  String get adminNewName => 'Νέο όνομα';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Διαγραφή βιβλιοθήκης';

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
  String get adminRemovePath => 'Κατάργηση διαδρομής';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved =>
      'Οι επιλογές της βιβλιοθήκης αποθηκεύτηκαν';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Η φόρτωση της βιβλιοθήκης απέτυχε';

  @override
  String get adminNoMediaPaths => 'Δεν έχουν διαμορφωθεί διαδρομές μέσων';

  @override
  String get adminAddPath => 'Προσθήκη διαδρομής';

  @override
  String get adminBrowseFilesystem =>
      'Περιήγηση στο σύστημα αρχείων διακομιστή:';

  @override
  String get adminSaveOptions => 'Αποθήκευση Επιλογών';

  @override
  String get adminPreferredMetadataLanguage =>
      'Προτιμώμενη γλώσσα μεταδεδομένων';

  @override
  String get adminMetadataLanguageHint => 'π.χ. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Κωδικός χώρας μεταδεδομένων';

  @override
  String get adminMetadataCountryHint => 'π.χ. ΗΠΑ, ΓΕ, Γαλλία';

  @override
  String get adminLibraryNameRequired => 'Απαιτείται το όνομα της βιβλιοθήκης';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Όνομα βιβλιοθήκης';

  @override
  String get adminSelectedPaths => 'Επιλεγμένα μονοπάτια:';

  @override
  String get adminNoPathsAdded =>
      'Δεν προστέθηκαν διαδρομές (μπορεί να προστεθεί αργότερα)';

  @override
  String get adminCreateLibrary => 'Δημιουργία βιβλιοθήκης';

  @override
  String get paths => 'Διαδρομές:';

  @override
  String get adminDisableUser => 'Απενεργοποίηση χρήστη';

  @override
  String get adminEnableUser => 'Ενεργοποίηση χρήστη';

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
  String get adminUsersLoadFailed => 'Η φόρτωση των χρηστών απέτυχε';

  @override
  String get adminSearchUsers => 'Αναζήτηση χρηστών';

  @override
  String get adminEditUser => 'Επεξεργασία χρήστη';

  @override
  String get adminAddUser => 'Προσθήκη χρήστη';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Δημιουργία χρήστη';

  @override
  String get adminPasswordOptional => 'Κωδικός πρόσβασης (προαιρετικό)';

  @override
  String get adminUsernameRequired =>
      'Το όνομα χρήστη δεν μπορεί να είναι κενό';

  @override
  String get adminNoProfileChanges =>
      'Δεν υπάρχουν αλλαγές προφίλ για αποθήκευση';

  @override
  String get adminProfileSaved => 'Το προφίλ αποθηκεύτηκε';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Τα δικαιώματα αποθηκεύτηκαν';

  @override
  String get adminPasswordsMismatch => 'Οι κωδικοί πρόσβασης δεν ταιριάζουν';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Η φόρτωση του χρήστη απέτυχε';

  @override
  String get adminBackToUsers => 'Επιστροφή στους Χρήστες';

  @override
  String get adminSaveProfile => 'Αποθήκευση προφίλ';

  @override
  String get adminDeleteUser => 'Διαγραφή χρήστη';

  @override
  String get admin => 'Διαχειρ';

  @override
  String get adminFullAccessWarning =>
      'Οι διαχειριστές έχουν πλήρη πρόσβαση στον διακομιστή. Χορηγήστε με προσοχή.';

  @override
  String get administrator => 'Διαχειριστής';

  @override
  String get adminHiddenUser => 'Κρυφός χρήστης';

  @override
  String get adminAllowMediaPlayback =>
      'Να επιτρέπεται η αναπαραγωγή πολυμέσων';

  @override
  String get adminAllowAudioTranscoding =>
      'Να επιτρέπεται η διακωδικοποίηση ήχου';

  @override
  String get adminAllowVideoTranscoding =>
      'Να επιτρέπεται η διακωδικοποίηση βίντεο';

  @override
  String get adminAllowRemuxing => 'Επιτρέψτε την εκ νέου ανάμιξη';

  @override
  String get adminForceRemoteTranscoding =>
      'Αναγκαστική διακωδικοποίηση απομακρυσμένης πηγής';

  @override
  String get adminAllowContentDeletion =>
      'Να επιτρέπεται η διαγραφή περιεχομένου';

  @override
  String get adminAllowContentDownloading =>
      'Να επιτρέπεται η λήψη περιεχομένου';

  @override
  String get adminAllowPublicSharing => 'Να επιτρέπεται η δημόσια κοινή χρήση';

  @override
  String get adminAllowRemoteControl =>
      'Επιτρέψτε τον απομακρυσμένο έλεγχο άλλων χρηστών';

  @override
  String get adminAllowSharedDeviceControl =>
      'Να επιτρέπεται ο έλεγχος της κοινόχρηστης συσκευής';

  @override
  String get adminAllowRemoteAccess => 'Επιτρέψτε την απομακρυσμένη πρόσβαση';

  @override
  String get adminRemoteBitrateLimit =>
      'Όριο ρυθμού bit απομακρυσμένου πελάτη (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Αφήστε κενό χωρίς όριο';

  @override
  String get adminMaxActiveSessions => 'Μέγιστος αριθμός ενεργών συνεδριών';

  @override
  String get adminAllowLiveTvAccess =>
      'Να επιτρέπεται η πρόσβαση σε ζωντανή τηλεόραση';

  @override
  String get adminAllowLiveTvManagement =>
      'Να επιτρέπεται η διαχείριση ζωντανής τηλεόρασης';

  @override
  String get adminAllowCollectionManagement =>
      'Να επιτρέπεται η διαχείριση συλλογής';

  @override
  String get adminAllowSubtitleManagement =>
      'Να επιτρέπεται η διαχείριση υποτίτλων';

  @override
  String get adminAllowLyricManagement => 'Επιτρέψτε τη διαχείριση στίχων';

  @override
  String get adminSavePermissions => 'Αποθήκευση Δικαιωμάτων';

  @override
  String get adminEnableAllLibraryAccess =>
      'Ενεργοποίηση πρόσβασης σε όλες τις βιβλιοθήκες';

  @override
  String get adminSaveAccess => 'Αποθήκευση πρόσβασης';

  @override
  String get adminChangePassword => 'Αλλαγή κωδικού πρόσβασης';

  @override
  String get adminNewPassword => 'Νέος κωδικός πρόσβασης';

  @override
  String get adminConfirmPassword => 'Επιβεβαίωση κωδικού πρόσβασης';

  @override
  String get adminSetPassword => 'Ορισμός κωδικού πρόσβασης';

  @override
  String get adminResetPassword => 'Επαναφορά κωδικού πρόσβασης';

  @override
  String get adminPasswordReset => 'Επαναφορά κωδικού πρόσβασης';

  @override
  String get adminPasswordUpdated => 'Ο κωδικός ενημερώθηκε';

  @override
  String get adminUserSettings => 'Ρυθμίσεις χρήστη';

  @override
  String get adminLibraryAccess => 'Πρόσβαση στη βιβλιοθήκη';

  @override
  String get adminDeviceAndChannelAccess => 'Πρόσβαση συσκευής και καναλιού';

  @override
  String get adminEnableAllDevices =>
      'Ενεργοποιήστε την πρόσβαση σε όλες τις συσκευές';

  @override
  String get adminEnableAllChannels =>
      'Ενεργοποιήστε την πρόσβαση σε όλα τα κανάλια';

  @override
  String get adminResetPasswordWarning =>
      'Αυτό θα αφαιρέσει τον κωδικό πρόσβασης. Ο χρήστης θα μπορεί να συνδεθεί χωρίς κωδικό πρόσβασης.';

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
  String get adminCreateApiKey => 'Δημιουργία κλειδιού API';

  @override
  String get adminAppName => 'Όνομα εφαρμογής';

  @override
  String get adminApiKeyCreated => 'Δημιουργήθηκε το κλειδί API';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Το κλειδί δημιουργήθηκε με επιτυχία. Ο διακομιστής δεν επέστρεψε το διακριτικό. Ελέγξτε τα κλειδιά API του διακομιστή.';

  @override
  String get adminKeyCopied => 'Το κλειδί αντιγράφηκε στο πρόχειρο';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Λείπει το διακριτικό κλειδιού από την απάντηση διακομιστή';

  @override
  String get adminRevokeApiKey => 'Ανάκληση κλειδιού API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Το κλειδί API ανακλήθηκε';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Αποτυχία φόρτωσης κλειδιών API';

  @override
  String get adminApiKeysTitle => 'Κλειδιά API';

  @override
  String get adminCreateKey => 'Δημιουργία κλειδιού';

  @override
  String get adminNoApiKeys => 'Δεν βρέθηκαν κλειδιά API';

  @override
  String get adminUnknownApp => 'Άγνωστη εφαρμογή';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Δημιουργία αντιγράφου ασφαλείας...';

  @override
  String get adminBackupCreated =>
      'Το αντίγραφο ασφαλείας δημιουργήθηκε με επιτυχία';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Λείπει η εφεδρική διαδρομή στην απόκριση διακομιστή';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Επιβεβαιώστε την Επαναφορά';

  @override
  String get adminRestoringBackup => 'Επαναφορά αντιγράφου ασφαλείας...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Αποτυχία φόρτωσης αντιγράφων ασφαλείας';

  @override
  String get adminCreateBackup => 'Δημιουργία αντιγράφων ασφαλείας';

  @override
  String get adminNoBackups => 'Δεν βρέθηκαν αντίγραφα ασφαλείας';

  @override
  String get adminViewDetails => 'Προβολή λεπτομερειών';

  @override
  String get restore => 'Επαναφέρω';

  @override
  String get adminLogsLoadFailed =>
      'Αποτυχία φόρτωσης αρχείων καταγραφής διακομιστή';

  @override
  String get adminNoLogFiles => 'Δεν βρέθηκαν αρχεία καταγραφής';

  @override
  String get adminLogCopied => 'Το αρχείο καταγραφής αντιγράφηκε στο πρόχειρο';

  @override
  String get adminSaveLogFile => 'Αποθήκευση αρχείου καταγραφής';

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
  String get adminSearchInLog => 'Αναζήτηση στο log';

  @override
  String get adminNoMatchingLines => 'Δεν υπάρχουν αντίστοιχες γραμμές';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Δεν βρέθηκαν προγραμματισμένες εργασίες';

  @override
  String get adminNoTasksMatchFilter =>
      'Καμία εργασία δεν ταιριάζει με το τρέχον φίλτρο';

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
  String get adminRunNow => 'Τρέξτε τώρα';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Τελευταία Εκτέλεση';

  @override
  String get adminTriggers => 'Ενεργοποιητές';

  @override
  String get adminAddTrigger => 'Προσθήκη σκανδάλης';

  @override
  String get adminNoTriggers => 'Δεν έχουν διαμορφωθεί κανόνες ετικέτας';

  @override
  String get adminTriggerType => 'Τύπος σκανδάλης';

  @override
  String get adminTimeLimit => 'Χρονικό όριο (προαιρετικό)';

  @override
  String get adminNoLimit => 'Κανένα όριο';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Ημέρα της εβδομάδας';

  @override
  String get adminSearchPlugins => 'Αναζήτηση προσθηκών...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Απεγκατάσταση πρόσθετου';

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
      'Δεν υπάρχουν πρόσθετα που να αντιστοιχούν στην αναζήτησή σας';

  @override
  String get adminNoPluginsInstalled => 'Δεν έχουν εγκατασταθεί πρόσθετα';

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
      'Δεν υπάρχουν πακέτα που να αντιστοιχούν στην αναζήτησή σας';

  @override
  String get adminNoPackagesAvailable => 'Δεν υπάρχουν διαθέσιμα πακέτα';

  @override
  String get adminExperimentalIntegration => 'Πειραματική Ένταξη';

  @override
  String get adminExperimentalWarning =>
      'Η ενσωμάτωση ρυθμίσεων προσθηκών είναι ακόμα πειραματική. Ορισμένες σελίδες ρυθμίσεων ενδέχεται να μην αποδίδονται σωστά.';

  @override
  String get continueAction => 'Συνεχίζω';

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
      'Δεν είναι δυνατό το άνοιγμα των ρυθμίσεων: λείπει το διακριτικό ελέγχου ταυτότητας.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Το πρόσθετο δεν βρέθηκε';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Ενεργοποίηση προσθήκης';

  @override
  String get adminPluginSettingsPage => 'Σελίδα ρυθμίσεων προσθήκης';

  @override
  String get adminRevisionHistory => 'Ιστορικό αναθεώρησης';

  @override
  String get adminNoChangelog =>
      'Δεν υπάρχει διαθέσιμο αρχείο καταγραφής αλλαγών.';

  @override
  String get adminRemoveRepository => 'Κατάργηση αποθετηρίου';

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
  String get adminRepositoryNameHint => 'π.χ. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL αποθετηρίου';

  @override
  String get adminAddEntry => 'Προσθήκη καταχώρισης';

  @override
  String get adminInvalidUrl => 'Μη έγκυρη διεύθυνση URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Άνοιγμα στο πρόγραμμα περιήγησης';

  @override
  String get adminOpenExternally => 'Ανοίξτε εξωτερικά';

  @override
  String get adminGeneralSettings => 'Γενικές Ρυθμίσεις';

  @override
  String get adminServerName => 'Όνομα διακομιστή';

  @override
  String get adminPreferredMetadataCountry => 'Προτιμώμενη χώρα μεταδεδομένων';

  @override
  String get adminCachePath => 'Διαδρομή προσωρινής μνήμης';

  @override
  String get adminMetadataPath => 'Διαδρομή μεταδεδομένων';

  @override
  String get adminLibraryScanConcurrency => 'Συγχρονισμός σάρωσης βιβλιοθήκης';

  @override
  String get adminParallelImageEncodingLimit =>
      'Όριο κωδικοποίησης παράλληλης εικόνας';

  @override
  String get adminSlowResponseThreshold => 'Κατώφλι αργής απόκρισης (ms)';

  @override
  String get adminBrandingSaved => 'Οι ρυθμίσεις επωνυμίας αποθηκεύτηκαν';

  @override
  String get adminBrandingLoadFailed =>
      'Η φόρτωση των ρυθμίσεων επωνυμίας απέτυχε';

  @override
  String get adminLoginDisclaimer => 'Αποποίηση ευθυνών σύνδεσης';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML εμφανίζεται κάτω από τη φόρμα σύνδεσης';

  @override
  String get adminCustomCss => 'Προσαρμοσμένο CSS';

  @override
  String get adminCustomCssHint =>
      'Εφαρμόστηκε προσαρμοσμένο CSS στη διεπαφή ιστού';

  @override
  String get adminEnableSplashScreen => 'Ενεργοποίηση εκκίνησης οθόνης';

  @override
  String get adminStreamingSaved => 'Οι ρυθμίσεις ροής αποθηκεύτηκαν';

  @override
  String get adminStreamingLoadFailed => 'Αποτυχία φόρτωσης ρυθμίσεων ροής';

  @override
  String get adminStreamingDescription =>
      'Ορίστε παγκόσμια όρια ρυθμού bit ροής για απομακρυσμένες συνδέσεις.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Όριο ρυθμού bit απομακρυσμένου πελάτη (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Αφήστε κενό ή 0 για απεριόριστο';

  @override
  String get adminPlaybackSaved => 'Οι ρυθμίσεις αναπαραγωγής αποθηκεύτηκαν';

  @override
  String get adminPlaybackLoadFailed =>
      'Αποτυχία φόρτωσης ρυθμίσεων αναπαραγωγής';

  @override
  String get adminPlaybackTranscoding => 'Αναπαραγωγή / Μετακωδικοποίηση';

  @override
  String get adminHardwareAcceleration => 'Επιτάχυνση υλικού';

  @override
  String get adminVaapiDevice => 'Συσκευή VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Ενεργοποίηση κωδικοποίησης υλικού';

  @override
  String get adminEnableHardwareDecoding =>
      'Ενεργοποίηση αποκωδικοποίησης υλικού για:';

  @override
  String get adminEncodingThreads => 'Κωδικοποίηση νημάτων';

  @override
  String get adminAutomatic => '0 = αυτόματο';

  @override
  String get adminTranscodingTempPath =>
      'Διαδρομή θερμοκρασίας διακωδικοποίησης';

  @override
  String get adminEnableFallbackFont =>
      'Ενεργοποίηση εναλλακτικής γραμματοσειράς';

  @override
  String get adminFallbackFontPath => 'Εναλλακτική διαδρομή γραμματοσειράς';

  @override
  String get adminAllowSegmentDeletion => 'Να επιτρέπεται η διαγραφή τμήματος';

  @override
  String get adminSegmentKeepSeconds => 'Διατήρηση τμήματος (δευτερόλεπτα)';

  @override
  String get adminThrottleBuffering => 'Ρυθμιστικό γκάζι';

  @override
  String get adminTrickplaySaved => 'Οι ρυθμίσεις του Trickplay αποθηκεύτηκαν';

  @override
  String get adminTrickplayLoadFailed =>
      'Αποτυχία φόρτωσης ρυθμίσεων παιχνιδιού';

  @override
  String get adminEnableHardwareAcceleration =>
      'Ενεργοποίηση επιτάχυνσης υλικού';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Ενεργοποίηση εξαγωγής μόνο πλαισίου κλειδιού';

  @override
  String get adminKeyFrameSubtitle => 'Ταχύτερη αλλά χαμηλότερη ακρίβεια';

  @override
  String get adminScanBehavior => 'Συμπεριφορά σάρωσης';

  @override
  String get adminProcessPriority => 'Προτεραιότητα διαδικασίας';

  @override
  String get adminImageSettings => 'Ρυθμίσεις εικόνας';

  @override
  String get adminIntervalMs => 'Διάστημα (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Πόσο συχνά γίνεται λήψη καρέ';

  @override
  String get adminWidthResolutions => 'Αναλύσεις πλάτους';

  @override
  String get adminTileWidth => 'Πλάτος πλακιδίων';

  @override
  String get adminTileHeight => 'Ύψος πλακιδίων';

  @override
  String get adminQualitySubtitle =>
      'Χαμηλότερες τιμές = καλύτερη ποιότητα, μεγαλύτερα αρχεία';

  @override
  String get adminProcessThreads => 'Νήματα επεξεργασίας';

  @override
  String get adminResumeSaved => 'Οι ρυθμίσεις συνέχισης αποθηκεύτηκαν';

  @override
  String get adminResumeLoadFailed =>
      'Η φόρτωση των ρυθμίσεων συνέχισης απέτυχε';

  @override
  String get adminResumeDescription =>
      'Διαμορφώστε πότε το περιεχόμενο θα πρέπει να επισημαίνεται ως μερική αναπαραγωγή ή πλήρη αναπαραγωγή.';

  @override
  String get adminMinResumePercentage => 'Ελάχιστο ποσοστό βιογραφικού';

  @override
  String get adminMinResumeSubtitle =>
      'Το περιεχόμενο πρέπει να αναπαράγεται πέρα ​​από αυτό το ποσοστό για εξοικονόμηση προόδου';

  @override
  String get adminMaxResumePercentage => 'Μέγιστο ποσοστό βιογραφικού';

  @override
  String get adminMaxResumeSubtitle =>
      'Μετά από αυτό το ποσοστό, το περιεχόμενο θεωρείται ότι έχει παιχτεί πλήρως';

  @override
  String get adminMinResumeDuration =>
      'Ελάχιστη διάρκεια βιογραφικού (δευτερόλεπτα)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Αντικείμενα μικρότερα από αυτό δεν μπορούν να συνεχιστούν';

  @override
  String get adminMinAudiobookResume =>
      'Ελάχιστο ποσοστό βιογραφικού ήχου βιβλίου';

  @override
  String get adminMaxAudiobookResume =>
      'Μέγιστο ποσοστό βιογραφικού ήχου βιβλίου';

  @override
  String get adminNetworkingSaved =>
      'Οι ρυθμίσεις δικτύου αποθηκεύτηκαν. Ενδέχεται να απαιτείται επανεκκίνηση διακομιστή.';

  @override
  String get adminNetworkingLoadFailed => 'Αποτυχία φόρτωσης ρυθμίσεων δικτύου';

  @override
  String get adminNetworkingWarning =>
      'Οι αλλαγές στις ρυθμίσεις δικτύου ενδέχεται να απαιτούν επανεκκίνηση διακομιστή.';

  @override
  String get adminEnableRemoteAccess => 'Ενεργοποίηση απομακρυσμένης πρόσβασης';

  @override
  String get ports => 'λιμάνια';

  @override
  String get adminHttpPort => 'Θύρα HTTP';

  @override
  String get adminHttpsPort => 'Θύρα HTTPS';

  @override
  String get adminPublicHttpsPort => 'Δημόσια θύρα HTTPS';

  @override
  String get adminBaseUrl => 'Βασική διεύθυνση URL';

  @override
  String get adminBaseUrlHint => 'π.χ. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Ενεργοποίηση HTTPS';

  @override
  String get adminLocalNetwork => 'Τοπικό δίκτυο';

  @override
  String get adminLocalNetworkAddresses => 'Διευθύνσεις τοπικού δικτύου';

  @override
  String get adminKnownProxies => 'Γνωστοί πληρεξούσιοι';

  @override
  String get adminRemoteIpFilter => 'Φίλτρο απομακρυσμένου IP';

  @override
  String get adminRemoteIpFilterEntries => 'Απομακρυσμένο φίλτρο IP';

  @override
  String get adminCertificatePath => 'Διαδρομή πιστοποιητικού';

  @override
  String get whitelist => 'Λευκή λίστα';

  @override
  String get blacklist => 'Προγράφω';

  @override
  String get notSet => 'Δεν έχει οριστεί';

  @override
  String get adminMetadataSaved => 'Τα μεταδεδομένα αποθηκεύτηκαν';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Ανανέωση μεταδεδομένων';

  @override
  String get recursive => 'Αναδρομικό';

  @override
  String get adminReplaceAllMetadata => 'Αντικαταστήστε όλα τα μεταδεδομένα';

  @override
  String get adminReplaceAllImages => 'Αντικατάσταση όλων των εικόνων';

  @override
  String get adminMetadataRefreshRequested => 'Ζητήθηκε ανανέωση μεταδεδομένων';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Αναζήτηση απομακρυσμένου ατόμου';

  @override
  String get adminNoRemoteMatches =>
      'Δεν βρέθηκαν απομακρυσμένες αντιστοιχίσεις';

  @override
  String get adminRemoteResults => 'Απομακρυσμένα αποτελέσματα';

  @override
  String get adminRemoteMetadataApplied =>
      'Εφαρμόστηκαν απομακρυσμένα μεταδεδομένα';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Ενημέρωση τύπου περιεχομένου';

  @override
  String get adminContentType => 'Τύπος περιεχομένου';

  @override
  String get adminContentTypeUpdated => 'Ο τύπος περιεχομένου ενημερώθηκε';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Η φόρτωση του προγράμματος επεξεργασίας μεταδεδομένων απέτυχε';

  @override
  String get adminNoPeopleEntries => 'Δεν υπάρχουν καταχωρήσεις ατόμων';

  @override
  String get adminNoExternalIds =>
      'Δεν υπάρχουν διαθέσιμα εξωτερικά αναγνωριστικά';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Μη υποστηριζόμενη μορφή εικόνας';

  @override
  String get adminImageReadFailed =>
      'Αποτυχία ανάγνωσης της επιλεγμένης εικόνας';

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
  String get adminAllProviders => 'Όλοι οι πάροχοι';

  @override
  String get adminNoRemoteImages => 'Δεν βρέθηκαν απομακρυσμένες εικόνες';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Προσθήκη δέκτη';

  @override
  String get adminTunerType => 'Τύπος δέκτη';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Άλλο';

  @override
  String get adminUrlPath => 'URL / Διαδρομή';

  @override
  String get adminNameOptional => 'Όνομα (προαιρετικό)';

  @override
  String get adminTunerAdded => 'Προστέθηκε ο δέκτης';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Προσθήκη παρόχου οδηγού';

  @override
  String get adminProviderType => 'Τύπος παρόχου';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect ή XMLTV';

  @override
  String get adminUsernameOptional => 'Όνομα χρήστη (προαιρετικό)';

  @override
  String get adminRefreshInterval => 'Διάστημα ανανέωσης (ώρες)';

  @override
  String get adminProviderAdded => 'Προστέθηκε πάροχος';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Ζητήθηκε επαναφορά δέκτη';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Ρυθμίσεις εγγραφής';

  @override
  String get adminPrePadding => 'Προκατασκευή (λεπτά)';

  @override
  String get adminPostPadding => 'Post-padding (λεπτά)';

  @override
  String get adminRecordingPath => 'Διαδρομή εγγραφής';

  @override
  String get adminSeriesRecordingPath => 'Διαδρομή εγγραφής σειράς';

  @override
  String get adminRecordingSettingsSaved =>
      'Οι ρυθμίσεις εγγραφής αποθηκεύτηκαν';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Ορίστε τις αντιστοιχίσεις καναλιών';

  @override
  String get adminMappingJson => 'Χαρτογράφηση JSON';

  @override
  String get adminMappingJsonHint =>
      'Παράδειγμα: αντιστοιχίσεις ωφέλιμου φορτίου JSON';

  @override
  String get adminChannelMappingsUpdated =>
      'Οι αντιστοιχίσεις καναλιών ενημερώθηκαν';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Η φόρτωση της διαχείρισης ζωντανής τηλεόρασης απέτυχε';

  @override
  String get adminTunerDevices => 'Συσκευές δέκτη';

  @override
  String get adminNoTunerHosts =>
      'Δεν έχουν διαμορφωθεί κεντρικοί υπολογιστές δέκτη';

  @override
  String get adminGuideProviders => 'Πάροχοι οδηγών';

  @override
  String get adminAddProvider => 'Προσθήκη παρόχου';

  @override
  String get adminNoListingProviders =>
      'Δεν έχουν διαμορφωθεί πάροχοι καταχώρισης';

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
  String get adminTunerDiscovery => 'Ανακάλυψη δέκτη';

  @override
  String get adminChannelMappings => 'Αντιστοιχίσεις καναλιών';

  @override
  String get adminNoDiscoveredTuners => 'Δεν έχουν ανακαλυφθεί ακόμη δέκτες';

  @override
  String get adminSettingsSaved => 'Οι ρυθμίσεις αποθηκεύτηκαν';

  @override
  String get adminBackupsNotAvailable =>
      'Τα αντίγραφα ασφαλείας δεν είναι διαθέσιμα σε αυτήν την έκδοση διακομιστή.';

  @override
  String get adminRestoreWarning1 =>
      'Η επαναφορά θα αντικαταστήσει ΟΛΑ τα τρέχοντα δεδομένα διακομιστή με τα εφεδρικά δεδομένα.';

  @override
  String get adminRestoreWarning2 =>
      'Οι τρέχουσες ρυθμίσεις διακομιστή, οι χρήστες και τα δεδομένα της βιβλιοθήκης θα αντικατασταθούν.';

  @override
  String get adminRestoreWarning3 =>
      'Ο διακομιστής θα επανεκκινήσει μετά την επαναφορά.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Ζητήθηκε επαναφορά. Η επανεκκίνηση του διακομιστή ενδέχεται να αποσυνδέσει αυτήν την περίοδο λειτουργίας.';

  @override
  String get adminBackupsTitle => 'Αντίγραφα ασφαλείας';

  @override
  String get adminUnknownDate => 'Άγνωστη ημερομηνία';

  @override
  String get adminUnnamedBackup => 'Ανώνυμη δημιουργία αντιγράφων ασφαλείας';

  @override
  String get adminLiveTvNotAvailable =>
      'Η διαχείριση ζωντανής τηλεόρασης δεν είναι διαθέσιμη σε αυτήν την έκδοση διακομιστή.';

  @override
  String get adminLiveTvTitle => 'Διαχείριση ζωντανής τηλεόρασης';

  @override
  String get adminApply => 'Εφαρμόζω';

  @override
  String get adminNotSet => 'Δεν έχει οριστεί';

  @override
  String get adminReset => 'Επαναφορά';

  @override
  String get adminLogsTitle => 'Αρχεία καταγραφής διακομιστή';

  @override
  String get adminLogsNewestFirst => 'Πρώτα τα νεότερα';

  @override
  String get adminLogsOldestFirst => 'Πρώτος παλαιότερος';

  @override
  String get adminLogsJustNow => 'Μόλις τώρα';

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
  String get adminLogViewerNoMatches => 'Δεν υπάρχουν αντίστοιχες γραμμές';

  @override
  String get adminMetadataEditorTitle => 'Επεξεργαστής Μεταδεδομένων';

  @override
  String get adminMetadataRemote => 'Μακρινός';

  @override
  String get adminMetadataType => 'Τύπος';

  @override
  String get adminMetadataDetails => 'Καθέκαστα';

  @override
  String get adminMetadataExternalIds => 'Εξωτερικές ταυτότητες';

  @override
  String get adminMetadataImages => 'εικόνες';

  @override
  String get adminMetadataFieldTitle => 'Τίτλος';

  @override
  String get adminMetadataFieldSortTitle => 'Ταξινόμηση τίτλου';

  @override
  String get adminMetadataFieldOriginalTitle => 'Πρωτότυπος τίτλος';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Ημερομηνία πρεμιέρας (ΕΕΕΕ-ΜΜ-ΗΗ)';

  @override
  String get adminMetadataFieldEndDate => 'Ημερομηνία λήξης (ΕΕΕΕ-ΜΜ-ΗΗ)';

  @override
  String get adminMetadataFieldProductionYear => 'Έτος παραγωγής';

  @override
  String get adminMetadataFieldOfficialRating => 'Επίσημη βαθμολογία';

  @override
  String get adminMetadataFieldCommunityRating => 'Βαθμολογία κοινότητας';

  @override
  String get adminMetadataFieldCriticRating => 'Αξιολόγηση της κριτικής';

  @override
  String get adminMetadataFieldTagline => 'Περιγραφή';

  @override
  String get adminMetadataFieldOverview => 'Επισκόπηση';

  @override
  String get adminMetadataGenres => 'Είδη';

  @override
  String get adminMetadataTags => 'Ετικέτες';

  @override
  String get adminMetadataStudios => 'Στούντιο';

  @override
  String get adminMetadataPeople => 'Ανθρωποι';

  @override
  String get adminMetadataAddGenre => 'Προσθήκη είδους';

  @override
  String get adminMetadataAddTag => 'Προσθήκη ετικέτας';

  @override
  String get adminMetadataAddStudio => 'Προσθήκη στούντιο';

  @override
  String get adminMetadataAddPerson => 'Προσθήκη ατόμου';

  @override
  String get adminMetadataEditPerson => 'Επεξεργασία προσώπου';

  @override
  String get adminMetadataRole => 'Ρόλος';

  @override
  String get adminMetadataImagePrimary => 'Πρωταρχικός';

  @override
  String get adminMetadataImageBackdrop => 'σκηνικό';

  @override
  String get adminMetadataImageLogo => 'Λογότυπο';

  @override
  String get adminMetadataImageBanner => 'Σημαία';

  @override
  String get adminMetadataImageThumb => 'Αντίχειρας';

  @override
  String get adminMetadataRecursive => 'Αναδρομικό';

  @override
  String get adminMetadataProvider => 'Προμηθευτής';

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
      'Αποτυχία ανάγνωσης της επιλεγμένης εικόνας';

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
      'Αυτό αφαιρεί την τρέχουσα εικόνα από το στοιχείο.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Μεταφόρτωση';

  @override
  String get adminMetadataUpdate => 'Εκσυγχρονίζω';

  @override
  String get adminMetadataRemoteImage => 'Απομακρυσμένη εικόνα';

  @override
  String get adminPluginsInstalled => 'Εγκατεστημένο';

  @override
  String get adminPluginsCatalog => 'Κατάλογος';

  @override
  String get adminPluginsActive => 'Ενεργός';

  @override
  String get adminPluginsRestart => 'Επανεκκίνηση';

  @override
  String get adminPluginsNoSearchResults =>
      'Δεν υπάρχουν πρόσθετα που να αντιστοιχούν στην αναζήτησή σας';

  @override
  String get adminPluginsNoneInstalled => 'Δεν έχουν εγκατασταθεί πρόσθετα';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Διαθέσιμη ενημέρωση';

  @override
  String get adminPluginsPendingRemoval =>
      'Εκκρεμεί αφαίρεση μετά την επανεκκίνηση';

  @override
  String get adminPluginsChangesPending =>
      'Αλλαγές σε εκκρεμότητα επανεκκίνησης';

  @override
  String get adminPluginsEnable => 'Καθιστώ ικανό';

  @override
  String get adminPluginsDisable => 'Καθιστώ ανίκανο';

  @override
  String get adminPluginsInstallUpdate => 'Εγκαταστήστε την ενημέρωση';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Δεν υπάρχουν πακέτα που να αντιστοιχούν στην αναζήτησή σας';

  @override
  String get adminPluginsCatalogEmpty => 'Δεν υπάρχουν διαθέσιμα πακέτα';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Πειραματική Ένταξη';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Η ενσωμάτωση ρυθμίσεων προσθηκών είναι ακόμα πειραματική. Ορισμένα πεδία ή διατάξεις ενδέχεται να μην αποδίδονται ακόμα σωστά.';

  @override
  String get adminPluginDetailToggle404 =>
      'Αποτυχία εναλλαγής προσθήκης. Ο διακομιστής δεν μπόρεσε να βρει αυτήν την έκδοση προσθήκης. Δοκιμάστε να ανανεώσετε προσθήκες και μετά δοκιμάστε ξανά.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Αποτυχία εναλλαγής προσθήκης. Ελέγξτε τα αρχεία καταγραφής διακομιστή για λεπτομέρειες.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Καθέκαστα';

  @override
  String get adminPluginDetailDeveloper => 'Προγραμματιστής';

  @override
  String get adminPluginDetailRepository => 'Αποθήκη';

  @override
  String get adminPluginDetailBundled => 'Πακέτο';

  @override
  String get adminPluginDetailEnablePlugin => 'Ενεργοποίηση προσθήκης';

  @override
  String get adminPluginDetailRestartRequired =>
      'Απαιτείται επανεκκίνηση διακομιστή για να τεθούν σε ισχύ οι αλλαγές.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Αυτό το πρόσθετο θα αφαιρεθεί μετά την επανεκκίνηση του διακομιστή.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Αυτή η προσθήκη έχει δυσλειτουργήσει και ενδέχεται να μην λειτουργεί σωστά.';

  @override
  String get adminPluginDetailNotSupported =>
      'Αυτή η προσθήκη δεν υποστηρίζεται από την τρέχουσα έκδοση διακομιστή.';

  @override
  String get adminPluginDetailSuperseded =>
      'Αυτή η προσθήκη έχει αντικατασταθεί από μια νεότερη έκδοση.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Κατάργηση αποθετηρίου';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Αφαιρώ';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Δεν έχουν διαμορφωθεί αποθετήρια';

  @override
  String get adminReposEmptySubtitle =>
      'Προσθέστε ένα αποθετήριο για να περιηγηθείτε στις διαθέσιμες προσθήκες';

  @override
  String get adminReposUnnamed => '(ανώνυμος)';

  @override
  String get adminReposEditTitle => 'Επεξεργασία αποθετηρίου';

  @override
  String get adminReposAddTitle => 'Προσθήκη αποθετηρίου';

  @override
  String get adminReposUrl => 'URL αποθετηρίου';

  @override
  String get adminReposNameHint => 'π.χ. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Μη έγκυρη διεύθυνση URL';

  @override
  String get adminGeneralSettingsTitle => 'Γενικές Ρυθμίσεις';

  @override
  String get adminGeneralMetadataLanguage => 'Προτιμώμενη γλώσσα μεταδεδομένων';

  @override
  String get adminGeneralMetadataLanguageHint => 'π.χ. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Προτιμώμενη χώρα μεταδεδομένων';

  @override
  String get adminGeneralMetadataCountryHint => 'π.χ. ΗΠΑ, ΓΕ, Γαλλία';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Συγχρονισμός σάρωσης βιβλιοθήκης';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Όριο κωδικοποίησης παράλληλης εικόνας';

  @override
  String get adminUnknownError => 'Άγνωστο σφάλμα';

  @override
  String get adminBrowse => 'Ξεφυλλίζω';

  @override
  String get adminCloseBrowser => 'Κλείστε το πρόγραμμα περιήγησης';

  @override
  String get adminNetworkingTitle => 'Δικτύωση';

  @override
  String get adminNetworkingRestartWarning =>
      'Οι αλλαγές στις ρυθμίσεις δικτύου ενδέχεται να απαιτούν επανεκκίνηση διακομιστή.';

  @override
  String get adminNetworkingRemoteAccess =>
      'Ενεργοποίηση απομακρυσμένης πρόσβασης';

  @override
  String get adminNetworkingPorts => 'λιμάνια';

  @override
  String get adminNetworkingHttpPort => 'Θύρα HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Θύρα HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Ενεργοποίηση HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Τοπικό δίκτυο';

  @override
  String get adminNetworkingLocalAddresses => 'Διευθύνσεις τοπικού δικτύου';

  @override
  String get adminNetworkingAddressHint => 'π.χ. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Γνωστοί πληρεξούσιοι';

  @override
  String get adminNetworkingProxyHint => 'π.χ. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Λευκή λίστα';

  @override
  String get adminNetworkingBlacklist => 'Προγράφω';

  @override
  String get adminNetworkingAddEntry => 'Προσθήκη καταχώρισης';

  @override
  String get adminBrandingTitle => 'Επωνυμία';

  @override
  String get adminBrandingLoginDisclaimer => 'Αποποίηση ευθυνών σύνδεσης';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML εμφανίζεται κάτω από τη φόρμα σύνδεσης';

  @override
  String get adminBrandingCustomCss => 'Προσαρμοσμένο CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Εφαρμόστηκε προσαρμοσμένο CSS στη διεπαφή ιστού';

  @override
  String get adminBrandingEnableSplash => 'Ενεργοποίηση εκκίνησης οθόνης';

  @override
  String get adminPlaybackHwAccel => 'Επιτάχυνση υλικού';

  @override
  String get adminPlaybackHwAccelLabel => 'Επιτάχυνση υλικού';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Ενεργοποίηση κωδικοποίησης υλικού';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Ενεργοποίηση αποκωδικοποίησης υλικού για:';

  @override
  String get adminPlaybackEncoding => 'Κωδικοποίηση';

  @override
  String get adminPlaybackEncodingThreads => 'Κωδικοποίηση νημάτων';

  @override
  String get adminPlaybackFallbackFont =>
      'Ενεργοποίηση εναλλακτικής γραμματοσειράς';

  @override
  String get adminPlaybackFallbackFontPath =>
      'Εναλλακτική διαδρομή γραμματοσειράς';

  @override
  String get adminPlaybackStreaming => 'Ροή';

  @override
  String get adminResumeVideo => 'Βίντεο';

  @override
  String get adminResumeAudiobooks => 'Ηχητικά βιβλία';

  @override
  String get adminResumeMinAudiobookPct =>
      'Ελάχιστο ποσοστό βιογραφικού ήχου βιβλίου';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Μέγιστο ποσοστό βιογραφικού ήχου βιβλίου';

  @override
  String get adminStreamingBitrateLimit =>
      'Όριο ρυθμού bit απομακρυσμένου πελάτη (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Αφήστε κενό ή 0 για απεριόριστο';

  @override
  String get adminTrickplayHwAccel => 'Ενεργοποίηση επιτάχυνσης υλικού';

  @override
  String get adminTrickplayHwEncoding => 'Ενεργοποίηση κωδικοποίησης υλικού';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Ενεργοποίηση εξαγωγής μόνο πλαισίου κλειδιού';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Ταχύτερη αλλά χαμηλότερη ακρίβεια';

  @override
  String get adminTrickplayNonBlocking => 'Μη Αποκλεισμός';

  @override
  String get adminTrickplayBlocking => 'Μπλοκάρισμα';

  @override
  String get adminTrickplayPriorityHigh => 'Ψηλά';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Πάνω από το κανονικό';

  @override
  String get adminTrickplayPriorityNormal => 'Κανονικός';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Κάτω από το κανονικό';

  @override
  String get adminTrickplayPriorityIdle => 'Αεργος';

  @override
  String get adminTrickplayImageSettings => 'Ρυθμίσεις εικόνας';

  @override
  String get adminTrickplayInterval => 'Διάστημα (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Πόσο συχνά γίνεται λήψη καρέ';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Πλάτη pixel διαχωρισμένα με κόμματα (π.χ. 320)';

  @override
  String get adminTrickplayQuality => 'Ποιότητα';

  @override
  String get adminTrickplayQScale => 'Κλίμακα ποιότητας';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Χαμηλότερες τιμές = καλύτερη ποιότητα, μεγαλύτερα αρχεία';

  @override
  String get adminTrickplayJpegQuality => 'Ποιότητα JPEG';

  @override
  String get adminTrickplayProcessing => 'Επεξεργασία';

  @override
  String get adminTasksEmpty => 'Δεν βρέθηκαν προγραμματισμένες εργασίες';

  @override
  String get adminTasksNoFilterMatch =>
      'Καμία εργασία δεν ταιριάζει με το τρέχον φίλτρο';

  @override
  String get adminTaskCancelling => 'Ακύρωση...';

  @override
  String get adminTaskRunning => 'Τρέξιμο...';

  @override
  String get adminTaskNeverRun => 'Μην τρέχετε ποτέ';

  @override
  String get adminTaskStop => 'Στάση';

  @override
  String get adminTaskRun => 'Τρέξιμο';

  @override
  String get adminTaskDetailLastExecution => 'Τελευταία Εκτέλεση';

  @override
  String get adminTaskDetailStarted => 'Ξεκίνησε';

  @override
  String get adminTaskDetailEnded => 'Τελείωσε';

  @override
  String get adminTaskDetailDuration => 'Διάρκεια';

  @override
  String get adminTaskDetailErrorLabel => 'Σφάλμα:';

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
  String get adminTaskTriggerStartup => 'Κατά την εκκίνηση της εφαρμογής';

  @override
  String get adminTaskTriggerTypeDaily => 'Καθημερινά';

  @override
  String get adminTaskTriggerTypeWeekly => 'Εβδομαδιαίος';

  @override
  String get adminTaskTriggerTypeInterval => 'Σε ένα διάστημα';

  @override
  String get adminTaskTriggerIntervalLabel => 'Διάστημα';

  @override
  String get adminTaskTriggerEveryHour => 'Κάθε ώρα';

  @override
  String get adminTaskTriggerEvery6Hours => 'Κάθε 6 ώρες';

  @override
  String get adminTaskTriggerEvery12Hours => 'Κάθε 12 ώρες';

  @override
  String get adminTaskTriggerEvery24Hours => 'Κάθε 24 ώρες';

  @override
  String get adminTaskTriggerEvery2Days => 'Κάθε 2 μέρες';

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
  String get adminTaskTriggerTime => 'Φορά';

  @override
  String get adminTaskTriggerNoLimit => 'Κανένα όριο';

  @override
  String get adminActivityJustNow => 'Μόλις τώρα';

  @override
  String get adminActivityLastHour => 'Τελευταία ώρα';

  @override
  String get adminActivityToday => 'Σήμερα';

  @override
  String get adminActivityYesterday => 'Εχθές';

  @override
  String get adminActivityOlder => 'Πιο παλιά';

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
  String get adminActivityNow => 'τώρα';

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
      'Διαμορφώστε τη δημιουργία εικόνων trickplay για μικρογραφίες προεπισκόπησης αναζήτησης.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Δημόσια θύρα HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Βασική διεύθυνση URL';

  @override
  String get adminNetworkingBaseUrlHint => 'π.χ. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Διαδρομή πιστοποιητικού';

  @override
  String get adminNetworkingRemoteIpFilter => 'Φίλτρο απομακρυσμένου IP';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Απομακρυσμένο φίλτρο IP';

  @override
  String get adminPlaybackVaapiDevice => 'Συσκευή VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = αυτόματο';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Διαδρομή θερμοκρασίας διακωδικοποίησης';

  @override
  String get adminPlaybackSegmentDeletion =>
      'Να επιτρέπεται η διαγραφή τμήματος';

  @override
  String get adminPlaybackSegmentKeep => 'Διατήρηση τμήματος (δευτερόλεπτα)';

  @override
  String get adminPlaybackThrottleBuffering => 'Ρυθμιστικό γκάζι';

  @override
  String get adminResumeMinPct => 'Ελάχιστο ποσοστό βιογραφικού';

  @override
  String get adminResumeMinPctSubtitle =>
      'Το περιεχόμενο πρέπει να αναπαράγεται πέρα ​​από αυτό το ποσοστό για εξοικονόμηση προόδου';

  @override
  String get adminResumeMaxPct => 'Μέγιστο ποσοστό βιογραφικού';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Μετά από αυτό το ποσοστό, το περιεχόμενο θεωρείται ότι έχει παιχτεί πλήρως';

  @override
  String get adminResumeMinDuration =>
      'Ελάχιστη διάρκεια βιογραφικού (δευτερόλεπτα)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Αντικείμενα μικρότερα από αυτό δεν μπορούν να συνεχιστούν';

  @override
  String get adminTrickplayScanBehavior => 'Συμπεριφορά σάρωσης';

  @override
  String get adminTrickplayProcessPriority => 'Προτεραιότητα διαδικασίας';

  @override
  String get adminTrickplayTileWidth => 'Πλάτος πλακιδίων';

  @override
  String get adminTrickplayTileHeight => 'Ύψος πλακιδίων';

  @override
  String get adminTrickplayProcessThreads => 'Νήματα επεξεργασίας';

  @override
  String get adminTrickplayWidthResolutions => 'Αναλύσεις πλάτους';

  @override
  String get adminMetadataDefault => 'Αθέτηση';

  @override
  String get adminMetadataContentTypeUpdated =>
      'Ο τύπος περιεχομένου ενημερώθηκε';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Κατώφλι αργής απόκρισης (ms)';

  @override
  String get adminGeneralCachePath => 'Διαδρομή προσωρινής μνήμης';

  @override
  String get adminGeneralMetadataPath => 'Διαδρομή μεταδεδομένων';

  @override
  String get adminGeneralServerName => 'Όνομα διακομιστή';

  @override
  String get adminSettingsLoadFailed => 'Αποτυχία φόρτωσης ρυθμίσεων';

  @override
  String get adminDiscover => 'Ανακαλύπτω';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Φάκελοι';

  @override
  String get libraries => 'Βιβλιοθήκες';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'Το SyncPlay είναι απενεργοποιημένο';

  @override
  String get syncPlayDisabledMessage =>
      'Ενεργοποιήστε το SyncPlay στις Ρυθμίσεις για να χρησιμοποιήσετε τη συγχρονισμένη αναπαραγωγή.';

  @override
  String get syncPlayServerUnsupportedTitle =>
      'Ο διακομιστής δεν υποστηρίζεται';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'Το SyncPlay απαιτεί διακομιστή Jellyfin. Ο τρέχων διακομιστής δεν το υποστηρίζει.';

  @override
  String get syncPlayGroupFallbackName => 'Ομάδα SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Ομάδα SyncPlay';

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
  String get syncPlayIgnoreWait => 'Αγνοήστε την αναμονή';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Μην κρατάτε ψηλά την ομάδα ενώ αυτή η συσκευή βρίσκεται σε προσωρινή μνήμη';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Συνεχίστε τοπικά χωρίς να περιμένετε αργά μέλη';

  @override
  String get syncPlayRepeat => 'Επαναλαμβάνω';

  @override
  String get syncPlayRepeatOne => 'Ενας';

  @override
  String get syncPlayShuffleModeShuffled => 'Ανακατεμένα';

  @override
  String get syncPlayShuffleModeSorted => 'Ταξινομημένο';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Συγχρονισμός της τρέχουσας ουράς αναπαραγωγής';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Αντικαταστήστε την ουρά ομάδας με αυτό που παίζει τοπικά';

  @override
  String get syncPlayLeaveGroup => 'Αποχώρηση από την ομάδα';

  @override
  String get syncPlayGroupQueue => 'Ομαδική ουρά';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Παίξτε τώρα';

  @override
  String get syncPlayCreateNewGroup => 'Δημιουργήστε μια νέα ομάδα';

  @override
  String get syncPlayGroupName => 'Όνομα ομάδας';

  @override
  String get syncPlayDefaultGroupName => 'Η Ομάδα μου SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Δημιουργία ομάδας';

  @override
  String get syncPlayAvailableGroups => 'Διαθέσιμες ομάδες';

  @override
  String get syncPlayNoGroupsAvailable => 'Δεν υπάρχουν διαθέσιμες ομάδες';

  @override
  String get syncPlayJoinGroupQuestion => 'Συμμετοχή στην ομάδα SyncPlay;';

  @override
  String get syncPlayJoinGroupWarning =>
      'Η συμμετοχή σε μια ομάδα SyncPlay μπορεί να αντικαταστήσει την τρέχουσα ουρά αναπαραγωγής. Συνεχίζω;';

  @override
  String get syncPlayJoin => 'Ενώνω';

  @override
  String get syncPlayStateIdle => 'Αεργος';

  @override
  String get syncPlayStateWaiting => 'Αναμονή';

  @override
  String get syncPlayStatePaused => 'Σε παύση';

  @override
  String get syncPlayStatePlaying => 'Παιχνίδι';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle =>
      'Δεν επιτρέπεται η πρόσβαση στο SyncPlay';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Δεν έχετε πρόσβαση σε ένα ή περισσότερα στοιχεία σε αυτήν την ομάδα SyncPlay. Ζητήστε από τον κάτοχο της ομάδας να επαληθεύσει τα δικαιώματα βιβλιοθήκης ή να επιλέξει διαφορετική ουρά.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'Η φωνητική αναζήτηση δεν είναι διαθέσιμη.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Το Dolby Vision Direct Play απέτυχε';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Η απευθείας αναπαραγωγή απέτυχε να ξεκινήσει για αυτήν τη ροή Dolby Vision. Δοκιμάστε ξανά τη χρήση διακωδικοποίησης διακομιστή;';

  @override
  String get retryWithTranscode => 'Δοκιμάστε ξανά με transcode';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Το Dolby Vision δεν υποστηρίζεται';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Αυτή η συσκευή δεν μπορεί να αποκωδικοποιήσει απευθείας το περιεχόμενο Dolby Vision. Χρησιμοποιήστε εναλλακτικό HDR10 ή ζητήστε διακωδικοποίηση διακομιστή.';

  @override
  String get rememberMyChoice => 'Θυμηθείτε την επιλογή μου';

  @override
  String get playHdr10Fallback => 'Παίξτε εναλλακτικό HDR10';

  @override
  String get requestTranscode => 'Ζητήστε διακωδικοποίηση';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Εντοπίστε σειρές που εκτίθενται από την προσθήκη \"Ενότητες αρχικής οθόνης\" του IAmParadox27. Οι σειρές μπορούν να ενεργοποιηθούν και να αναδιαταχθούν παρακάτω.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Δεν υπάρχουν ακόμη διακομιστές Jellyfin που να αναφέρουν την προσθήκη.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Εντοπίστε σειρές που έχουν διαμορφωθεί μέσω της προσθήκης \"KefinTweaks\" του ranaldsgift. Οι προσαρμοσμένες ενότητες, που κυκλοφόρησαν πρόσφατα, ξανά παρακολούθηση, εποχιακές και προστέθηκαν πρόσφατα στη βιβλιοθήκη αντικατοπτρίζονται από τη διαμόρφωση KefinTweaks σε κάθε διακομιστή Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Δεν υπάρχουν ακόμη διακομιστές Jellyfin που να αναφέρουν το KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Ανοίξτε τις Αρχικές Ενότητες';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Ενεργοποίηση, απενεργοποίηση και αναδιάταξη σειρών';

  @override
  String get integrationInstalledButDisabled =>
      'Εγκατεστημένο αλλά απενεργοποιημένο';

  @override
  String get integrationNotInstalled => 'Δεν έχει εγκατασταθεί';

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
  String get seeAll => 'Δείτε όλα';

  @override
  String get noItems => 'Δεν υπάρχουν στοιχεία';

  @override
  String get switchUser => 'Εναλλαγή χρήστη';

  @override
  String get remoteControl => 'Τηλεχειριστήριο';

  @override
  String get mediaBarLoading => 'Φόρτωση γραμμής πολυμέσων...';

  @override
  String get mediaBarError => 'Η φόρτωση της γραμμής πολυμέσων απέτυχε';

  @override
  String get offlineServerUnavailable =>
      'Συνδέθηκε στο διαδίκτυο, αλλά ο τρέχων διακομιστής δεν είναι διαθέσιμος.';

  @override
  String get offlineNoInternet =>
      'Είστε εκτός σύνδεσης. Διατίθεται μόνο περιεχόμενο λήψης.';

  @override
  String get offlineFileNotAvailable => 'Το αρχείο δεν είναι διαθέσιμο';

  @override
  String get offlineSwitchServer => 'Εναλλαγή διακομιστή';

  @override
  String get offlineSavedMedia => 'Αποθηκευμένα μέσα';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Απομακρυσμένη αναπαραγωγή';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Ένταση συσκευής';

  @override
  String get castVolumeUnavailable => 'Δυσεύρετος';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Ήχος';

  @override
  String get subtitlesLabel => 'Υπότιτλοι';

  @override
  String get pinConfirmTitle => 'Επιβεβαίωση PIN';

  @override
  String get pinSetTitle => 'Ορισμός PIN';

  @override
  String get pinEnterTitle => 'Εισαγάγετε το PIN';

  @override
  String get pinReenterToConfirm =>
      'Εισαγάγετε ξανά το PIN σας για επιβεβαίωση';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Λανθασμένο PIN';

  @override
  String get pinMismatch => 'Τα PIN δεν ταιριάζουν';

  @override
  String get pinForgot => 'Ξεχάσατε το PIN;';

  @override
  String get pinClear => 'Σαφής';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Εγκρίθηκε το αίτημα Quick Connect.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Ο κωδικός Quick Connect δεν είναι έγκυρος ή έχει λήξει.';

  @override
  String get quickConnectNotSupported =>
      'Η γρήγορη σύνδεση δεν υποστηρίζεται σε αυτόν τον διακομιστή.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Απέτυχε η εξουσιοδότηση του κώδικα γρήγορης σύνδεσης.';

  @override
  String get quickConnectDisabled =>
      'Η γρήγορη σύνδεση είναι απενεργοποιημένη σε αυτόν τον διακομιστή.';

  @override
  String get quickConnectForbidden =>
      'Ο λογαριασμός σας δεν μπορεί να εξουσιοδοτήσει αυτό το αίτημα Γρήγορης σύνδεσης.';

  @override
  String get quickConnectNotFound =>
      'Ο κωδικός γρήγορης σύνδεσης δεν βρέθηκε. Δοκιμάστε έναν νέο κωδικό.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Εισαγάγετε κωδικό';

  @override
  String get quickConnectAuthorize => 'Εξουσιοδοτώ';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Τηλεχειριστήριο';

  @override
  String get remoteFailedToLoadSessions => 'Αποτυχία φόρτωσης συνεδριών';

  @override
  String get remoteNoSessions => 'Δεν υπάρχουν ελεγχόμενες συνεδρίες';

  @override
  String get remoteStartPlayback => 'Ξεκινήστε την αναπαραγωγή σε άλλη συσκευή';

  @override
  String get unknownUser => 'Αγνωστος';

  @override
  String get unknownItem => 'Αγνωστος';

  @override
  String get remoteNothingPlaying => 'Δεν παίζει τίποτα σε αυτή τη συνεδρία';

  @override
  String get castingStarted => 'Η μετάδοση ξεκίνησε σε επιλεγμένη συσκευή';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Δεν υπάρχουν διαθέσιμες συσκευές απομακρυσμένης αναπαραγωγής.';

  @override
  String get noRemoteDevicesIos =>
      'Δεν υπάρχουν διαθέσιμες συσκευές απομακρυσμένης αναπαραγωγής.\n\nΣτο iOS, οι στόχοι του AirPlay ενδέχεται να μην είναι διαθέσιμοι στον προσομοιωτή.';

  @override
  String get trackActionPlayNext => 'Παίξτε Επόμενο';

  @override
  String get trackActionAddToQueue => 'Προσθήκη στην ουρά';

  @override
  String get trackActionAddToPlaylist => 'Προσθήκη στη λίστα αναπαραγωγής';

  @override
  String get trackActionCancelDownload => 'Ακύρωση λήψης';

  @override
  String get trackActionDeleteFromPlaylist =>
      'Διαγραφή από τη λίστα αναπαραγωγής';

  @override
  String get trackActionMoveUp => 'Μετακίνηση προς τα επάνω';

  @override
  String get trackActionMoveDown => 'Μετακίνηση προς τα κάτω';

  @override
  String get trackActionRemoveFromFavorites => 'Αφαίρεση από τα Αγαπημένα';

  @override
  String get trackActionAddToFavorites => 'Προσθήκη στα Αγαπημένα';

  @override
  String get trackActionGoToAlbum => 'Μετάβαση στο Άλμπουμ';

  @override
  String get trackActionGoToArtist => 'Μεταβείτε στον Καλλιτέχνη';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Διαγράφηκε το ληφθέν αρχείο';

  @override
  String get trackActionDeleteFileFailed =>
      'Δεν ήταν δυνατή η διαγραφή του ληφθέντος αρχείου';

  @override
  String get shuffleBy => 'Ανακάτεμα από';

  @override
  String get shuffleSelectLibrary => 'Επιλέξτε Βιβλιοθήκη';

  @override
  String get shuffleSelectGenre => 'Επιλέξτε Είδος';

  @override
  String get shuffleLibrary => 'Βιβλιοθήκη';

  @override
  String get shuffleGenre => 'Είδος';

  @override
  String get shuffleNoLibraries =>
      'Δεν υπάρχουν διαθέσιμες συμβατές βιβλιοθήκες.';

  @override
  String get shuffleNoGenres =>
      'Δεν βρέθηκαν είδη για αυτήν τη λειτουργία τυχαίας αναπαραγωγής.';

  @override
  String get posterDisplayTitle => 'Επίδειξη';

  @override
  String get posterImageType => 'Τύπος εικόνας';

  @override
  String get imageTypePoster => 'Αφίσα';

  @override
  String get imageTypeThumbnail => 'Ονυξ του αντίχειρος';

  @override
  String get imageTypeBanner => 'Σημαία';

  @override
  String get playlistAddFailed => 'Αποτυχία προσθήκης στη λίστα αναπαραγωγής';

  @override
  String get playlistCreateFailed => 'Η δημιουργία λίστας αναπαραγωγής απέτυχε';

  @override
  String get playlistNew => 'Νέα λίστα αναπαραγωγής';

  @override
  String get playlistCreate => 'Δημιουργώ';

  @override
  String get playlistCreateNew => 'Δημιουργία νέας λίστας αναπαραγωγής';

  @override
  String get playlistNoneFound => 'Δεν βρέθηκαν λίστες αναπαραγωγής';

  @override
  String get addToPlaylist => 'Προσθήκη στη λίστα αναπαραγωγής';

  @override
  String get lyricsNotAvailable => 'Δεν υπάρχουν διαθέσιμοι στίχοι';

  @override
  String get upNext => 'Επόμενο Επόμενο';

  @override
  String get playNext => 'Παίξτε Επόμενο';

  @override
  String get stillWatchingContent =>
      'Η αναπαραγωγή έχει διακοπεί. Παρακολουθείς ακόμα;';

  @override
  String get stillWatchingStop => 'Στάση';

  @override
  String get stillWatchingContinue => 'Συνεχίζω';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Ζωντανή τηλεόραση';

  @override
  String get continueWatchingAndNextUp =>
      'Συνεχίστε την παρακολούθηση & Επόμενο';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Επόμενο Επεισόδιο';

  @override
  String get moreFromThisSeason => 'Περισσότερα από αυτή τη σεζόν';

  @override
  String get playerTooltipPlaybackSpeed => 'Ταχύτητα αναπαραγωγής';

  @override
  String get playerTooltipCastControls => 'Χειριστήρια Cast';

  @override
  String get playerTooltipPlaybackQuality => 'Ρυθμός bit';

  @override
  String get playerTooltipEnterFullscreen => 'Μπείτε σε πλήρη οθόνη';

  @override
  String get playerTooltipExitFullscreen => 'Έξοδος από πλήρη οθόνη';

  @override
  String get playerTooltipFloatOnTop => 'Επιπλέουν στην κορυφή';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Απενεργοποιήστε το float στην κορυφή';

  @override
  String get playerTooltipLockLandscape => 'Τοπίο κλειδαριάς';

  @override
  String get playerTooltipUnlockOrientation => 'Επιτρέψτε την περιστροφή';

  @override
  String get playerTooltipPrevious => 'Προηγούμενος';

  @override
  String get playerTooltipSeekBack => 'Αναζητήστε πίσω';

  @override
  String get playerTooltipSeekForward => 'Αναζητήστε μπροστά';

  @override
  String get contextMenuMarkWatched => 'Επισήμανση ως παρακολούθησης';

  @override
  String get contextMenuMarkUnwatched => 'Επισήμανση ως απαρατήρητος';

  @override
  String get contextMenuAddToFavorites => 'Προσθήκη στα Αγαπημένα';

  @override
  String get contextMenuRemoveFromFavorites => 'Αφαίρεση από τα Αγαπημένα';

  @override
  String get contextMenuGoToSeries => 'Μεταβείτε στη σειρά';

  @override
  String get settingsAdministrationSubtitle =>
      'Πρόσβαση στον πίνακα διαχείρισης διακομιστή';

  @override
  String get settingsAccountSecurity => 'Λογαριασμός & Ασφάλεια';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Έλεγχος ταυτότητας, κωδικός PIN και γονικοί έλεγχοι';

  @override
  String get settingsPersonalization => 'Εξατομίκευση';

  @override
  String get settingsPersonalizationSubtitle =>
      'Θέμα, πλοήγηση, αρχικές σειρές και ορατότητα βιβλιοθήκης';

  @override
  String get settingsDynamicContent => 'Δυναμικό περιεχόμενο';

  @override
  String get settingsDynamicContentSubtitle =>
      'Γραμμή πολυμέσων και οπτικές επικαλύψεις';

  @override
  String get settingsPlaybackSyncplay => 'Αναπαραγωγή & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Ρυθμίσεις ήχου/βίντεο, υπότιτλοι, λήψεις και στοιχεία ελέγχου SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Συγχρονισμός προσθηκών, Seerr, αξιολογήσεις και πολλά άλλα';

  @override
  String get settingsAboutSubtitle =>
      'Έκδοση εφαρμογής, νομικές πληροφορίες και πιστώσεις';

  @override
  String get settingsAuthenticationSection => 'ΠΙΣΤΟΠΟΙΗΣΗ';

  @override
  String get settingsSortServersBy => 'Ταξινόμηση διακομιστών κατά';

  @override
  String get settingsLastUsed => 'Τελευταία χρήση';

  @override
  String get settingsAlphabetical => 'Αλφαβητικός';

  @override
  String get settingsPrivacyAndSafetySection => 'ΑΠΟΡΡΗΤΟ ΚΑΙ ΑΣΦΑΛΕΙΑ';

  @override
  String get settingsBlockedRatings => 'Αποκλεισμένες αξιολογήσεις';

  @override
  String get settingsGeneralStyle => 'Γενικό Στυλ';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Προφορές θεμάτων, σκηνικά, δείκτες παρακολούθησης και μουσική θεμάτων';

  @override
  String get settingsHomePage => 'Αρχική Σελίδα';

  @override
  String get settingsHomePageSubtitle =>
      'Ενότητες, τύποι εικόνων, επικαλύψεις και προεπισκοπήσεις πολυμέσων';

  @override
  String get settingsLibrariesSubtitle =>
      'Ορατότητα βιβλιοθήκης, προβολή φακέλου και συμπεριφορά πολλών διακομιστών';

  @override
  String get settingsTwentyFourHourClock => '24ωρο ρολόι';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Χρησιμοποιήστε τη μορφοποίηση ώρας 24 ωρών όπου κι αν εμφανίζεται το ρολόι';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Εμφάνιση του κουμπιού τυχαίας αναπαραγωγής στη γραμμή πλοήγησης';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Εμφάνιση του κουμπιού ειδών στη γραμμή πλοήγησης';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Εμφάνιση του κουμπιού αγαπημένων στη γραμμή πλοήγησης';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Εμφάνιση του κουμπιού βιβλιοθήκες στη γραμμή πλοήγησης';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Εναλλαγή ορατότητας αρχικής σελίδας ανά βιβλιοθήκη. Επανεκκινήστε το Moonfin για να τεθούν σε ισχύ οι αλλαγές.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Γραμμή πολυμέσων και τοπικές προεπισκοπήσεις';

  @override
  String get settingsVisualOverlays => 'Οπτικές επικαλύψεις';

  @override
  String get settingsSeasonalSurprise => 'Εποχιακή Έκπληξη';

  @override
  String get settingsMetadataAndRatings => 'Μεταδεδομένα & Βαθμολογίες';

  @override
  String get settingsPluginScreenDescription =>
      'Το Moonbase εξουσιοδοτεί ενσωματώσεις από την πλευρά του διακομιστή, συμπεριλαμβανομένων πρόσθετων πηγών αξιολόγησης, αιτημάτων Seerr και συγχρονισμένων προτιμήσεων.';

  @override
  String get settingsOfflineDownloads => 'Λήψεις εκτός σύνδεσης';

  @override
  String get settingsHigh => 'Ψηλά';

  @override
  String get settingsLow => 'Χαμηλός';

  @override
  String get settingsCustomPath => 'Προσαρμοσμένη διαδρομή';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Εισαγάγετε τη διαδρομή του φακέλου λήψης';

  @override
  String get settingsConcurrentDownloads => 'Ταυτόχρονες λήψεις';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Μέγιστος αριθμός στοιχείων για λήψη ταυτόχρονα.';

  @override
  String get settingsAppInfo => 'ΠΛΗΡΟΦΟΡΙΕΣ ΕΦΑΡΜΟΓΗΣ';

  @override
  String get settingsReportAnIssue => 'Αναφορά προβλήματος';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Ανοίξτε το πρόγραμμα παρακολούθησης προβλημάτων στο GitHub';

  @override
  String get settingsJoinDiscord => 'Εγγραφείτε στο Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Συζήτηση με την κοινότητα';

  @override
  String get settingsJoinTheDiscord => 'Εγγραφείτε στο Discord';

  @override
  String get settingsSupportMoonfin => 'Υποστήριξη Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'αστέρι στο έργο στο GitHub ή συνεισφέρετε';

  @override
  String get settingsLegal => 'ΝΟΜΙΚΟΣ';

  @override
  String get settingsLicenses => 'Άδειες';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Ειδοποιήσεις άδειας ανοιχτού κώδικα';

  @override
  String get settingsPrivacyPolicy => 'Πολιτική Απορρήτου';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Πώς χειρίζεται η Moonfin τα δεδομένα σας';

  @override
  String get settingsCheckForUpdates => 'Ελέγξτε για Ενημερώσεις';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Ελέγξτε για την πιο πρόσφατη έκδοση του Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Με την υποστήριξη του Flutter';

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
  String get settingsBoth => 'Και οι δύο';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Τυχαία αναπαραγωγή φίλτρου τύπου περιεχομένου';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Προτιμήσεις αναπαραγωγής βίντεο';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Βασική μηχανή βίντεο και ρυθμίσεις ποιότητας ροής';

  @override
  String get settingsAudioPreferences => 'Προτιμήσεις ήχου';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Επιλογές κομματιών ήχου, επεξεργασίας και διέλευσης';

  @override
  String get settingsAutomationAndQueue => 'Αυτοματισμός & Ουρά';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Αυτοματοποιημένη αναπαραγωγή και αλληλουχία';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Ποιότητα λήψης, όρια αποθηκευτικού χώρου και μέγεθος ουράς';

  @override
  String get settingsSyncplaySubtitle =>
      'Λογική συγχρονισμού για ομαδικές συνεδρίες';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Εξειδικευμένα χαρακτηριστικά αναπαραγωγής. Χρησιμοποιήστε το με προσοχή, καθώς ορισμένες επιλογές μπορεί να προκαλέσουν προβλήματα αναπαραγωγής';

  @override
  String get settingsSkipIntrosAndOutros => 'Παράλειψη εισαγωγών και εξόδων;';

  @override
  String get settingsPromptUser => 'Προτροπή χρήστη';

  @override
  String get settingsSkip => 'Παραλείπω';

  @override
  String get settingsDoNothing => 'Μην κάνετε τίποτα';

  @override
  String get settingsMaxBitrateDescription =>
      'Κλείστε τον ρυθμό μετάδοσης bit ροής. Το περιεχόμενο πάνω από αυτό το όριο θα διακωδικοποιηθεί ώστε να ταιριάζει.';

  @override
  String get settingsMaxResolutionDescription =>
      'Περιορίστε τη μέγιστη ανάλυση που θα ζητήσει η συσκευή αναπαραγωγής. Το περιεχόμενο υψηλότερης ανάλυσης θα αποκωδικοποιηθεί.';

  @override
  String get settingsPlayerZoomDescription =>
      'Πώς πρέπει να κλιμακωθεί το βίντεο ώστε να ταιριάζει στην οθόνη.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Μηχανή αναπαραγωγής (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Επιλέξτε την προεπιλεγμένη μηχανή αναπαραγωγής σε συσκευές Android TV. Οι αλλαγές ισχύουν για την επόμενη περίοδο λειτουργίας αναπαραγωγής.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (συνιστάται)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (κληρονομιά)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Επιστροφή';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Συμπεριφορά για τίτλους Dolby Vision σε συσκευές χωρίς αποκωδικοποίηση Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Ρωτήστε κάθε φορά';

  @override
  String get settingsPreferHdr10Fallback => 'Προτιμήστε εναλλακτικό HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Προτιμήστε τη διακωδικοποίηση διακομιστή';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Απευθείας αναπαραγωγή';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Ελέγχει εάν οι ροές επιπέδου βελτίωσης του προφίλ Dolby Vision 7 θα πρέπει να κατευθύνουν την αναπαραγωγή.';

  @override
  String get settingsAutoAftkrtEnabled => 'Αυτόματο (AFTKRT ενεργοποιημένο)';

  @override
  String get settingsEnabledOnThisDevice =>
      'Ενεργοποιήθηκε σε αυτήν τη συσκευή';

  @override
  String get settingsDisabledPreferTranscode =>
      'Απενεργοποιημένο (προτιμώ διακωδικοποίηση)';

  @override
  String get settingsResumeRewindDescription =>
      'Κατά τη συνέχιση της αναπαραγωγής (από τη Συνέχεια παρακολούθησης ή μια σελίδα στοιχείου πολυμέσων), πόσα δευτερόλεπτα πρέπει να επαναληφθούν;';

  @override
  String get settingsUnpauseRewindDescription =>
      'Κατά τη συνέχιση της αναπαραγωγής αφού πατήσετε το κουμπί παύσης, πόσα δευτερόλεπτα πρέπει να επαναληφθούν;';

  @override
  String get settingsSkipBackLengthDescription =>
      'Πόσα δευτερόλεπτα για να επιστρέψετε μετά το πάτημα του κουμπιού επαναφοράς.';

  @override
  String get settingsOneSecond => '1 δευτερόλεπτο';

  @override
  String get settingsThreeSeconds => '3 δευτερόλεπτα';

  @override
  String get settingsFortyFiveSeconds => '45 δευτερόλεπτα';

  @override
  String get settingsSixtySeconds => '60 δευτερόλεπτα';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Πόσα δευτερόλεπτα να μεταπηδήσετε προς τα εμπρός αφού πατήσετε το κουμπί γρήγορης προώθησης.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 σε εξωτερικό αποκωδικοποιητή';

  @override
  String get settingsCinemaMode => 'Λειτουργία κινηματογράφου';

  @override
  String get settingsCinemaModeSubtitle =>
      'Παίξτε trailers/prerolls πριν από ένα κύριο χαρακτηριστικό';

  @override
  String get settingsNextUpDisplayDescription =>
      'Το Extended εμφανίζει μια πλήρη κάρτα με εξώφυλλο επεισοδίου και περιγραφή. Το Minimal δείχνει μια συμπαγή επικάλυψη αντίστροφης μέτρησης. Το Disabled αποκρύπτει εντελώς το μήνυμα.';

  @override
  String get settingsShort => 'Μικρός';

  @override
  String get settingsLong => 'Μακρύς';

  @override
  String get settingsVeryLong => 'Πολύ Μακρύ';

  @override
  String get settingsVideoStartDelay => 'Καθυστέρηση έναρξης βίντεο';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Απευθείας ζωντανή τηλεόραση';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Ενεργοποίηση απευθείας αναπαραγωγής για ζωντανή τηλεόραση';

  @override
  String get settingsOpenGroups => 'Ανοίξτε τις Ομάδες';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Δημιουργήστε, εγγραφείτε ή διαχειριστείτε ομάδες SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'Ενεργοποιήθηκε το SyncPlay';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Ενεργοποιήστε τις λειτουργίες ομαδικής παρακολούθησης';

  @override
  String get settingsSyncplayButton => 'Κουμπί SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Εμφάνιση του κουμπιού SyncPlay στη γραμμή πλοήγησης';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Προηγμένη διόρθωση';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ενεργοποίηση λεπτομερούς λογικής συγχρονισμού';

  @override
  String get settingsSyncplaySyncCorrection => 'Διόρθωση συγχρονισμού';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Προσαρμόστε αυτόματα την αναπαραγωγή για να παραμείνετε συγχρονισμένοι';

  @override
  String get settingsSyncplaySpeedToSync => 'Ταχύτητα για συγχρονισμό';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Χρησιμοποιήστε τη ρύθμιση ταχύτητας αναπαραγωγής για συγχρονισμό';

  @override
  String get settingsSyncplaySkipToSync => 'Μετάβαση στο Συγχρονισμός';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Χρησιμοποιήστε την αναζήτηση για συγχρονισμό';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Καθυστέρηση ελάχιστης ταχύτητας';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Καθυστέρηση μέγιστης ταχύτητας';

  @override
  String get settingsSyncplaySpeedDuration => 'Διάρκεια ταχύτητας';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Ελάχιστη καθυστέρηση παράλειψης';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Extra Offset';

  @override
  String get onNow => 'Στο Τώρα';

  @override
  String get collections => 'Συλλογές';

  @override
  String get lastPlayed => 'Τελευταία αναπαραγωγή';

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
