// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Księżycowa Płetwa';

  @override
  String get accountPreferences => '';

  @override
  String get interfaceLanguage => '';

  @override
  String get systemLanguageDefault => '';

  @override
  String get signIn => 'Zalogować się';

  @override
  String get empty => '';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Szybkie połączenie';

  @override
  String get password => 'Hasło';

  @override
  String get username => 'Nazwa użytkownika';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Wpisz ten kod na panelu internetowym swojego serwera:';

  @override
  String get waitingForAuthorization => 'Oczekiwanie na autoryzację...';

  @override
  String get back => 'Z powrotem';

  @override
  String get serverUnavailable => 'Serwer jest niedostępny';

  @override
  String get loginFailed => 'Logowanie nie powiodło się';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Kto ogląda?';

  @override
  String get addUser => 'Dodaj użytkownika';

  @override
  String get selectServer => 'Wybierz Serwer';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Zapisane serwery';

  @override
  String get discoveredServers => 'Odkryte serwery';

  @override
  String get noneFound => 'Nie znaleziono żadnych';

  @override
  String get unableToConnectToServer => 'Nie można połączyć się z serwerem';

  @override
  String get addServer => 'Dodaj serwer';

  @override
  String get embyConnect => 'Emby Połącz';

  @override
  String get removeServer => 'Usuń serwer';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Anulować';

  @override
  String get remove => 'Usunąć';

  @override
  String get connectToServer => 'Połącz się z serwerem';

  @override
  String get serverAddress => 'Adres serwera';

  @override
  String get serverAddressHint => 'https://twój-serwer.example.com';

  @override
  String get connect => 'Łączyć';

  @override
  String get secureStorageUnavailable =>
      'Bezpieczne przechowywanie jest niedostępne';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nie mógł uzyskać dostępu do pęku kluczy systemowych. Logowanie może być kontynuowane, ale bezpieczne przechowywanie tokenów może być niedostępne do czasu odblokowania pęku kluczy.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Motyw aplikacji';

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
      'Przełączaj się między Moonfin i Neon Pulse bez ponownego uruchamiania aplikacji';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Księżycowa Płetwa';

  @override
  String get themeMoonfinSubtitle =>
      'Obecny wygląd Moonfin, który wszyscy pokochaliście';

  @override
  String get themeNeonPulse => 'Neonowy puls';

  @override
  String get themeNeonPulseSubtitle =>
      'Styl Synthwave z magentową poświatą, cyjanowym tekstem i silniejszym kontrastem chromu';

  @override
  String get themeGlass => '';

  @override
  String get themeGlassSubtitle => '';

  @override
  String get embyConnectSignInSubtitle =>
      'Zaloguj się na swoje konto Emby Connect';

  @override
  String get emailOrUsername => 'E-mail lub nazwa użytkownika';

  @override
  String get selectAServer => 'Wybierz serwer';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get noLinkedServers =>
      'Żadne serwery nie są połączone z tym kontem Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Nieprawidłowe poświadczenia Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Nieprawidłowa nazwa użytkownika lub hasło Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serwer nie obsługuje wymiany Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Błąd sieciowy podczas łączenia się z Emby Connect lub wybranym serwerem';

  @override
  String get loadingLinkedServers => 'Ładowanie połączonych serwerów...';

  @override
  String get connectingToServerEllipsis => 'Łączę się z serwerem...';

  @override
  String get noReachableAddress => 'Nie podano osiągalnego adresu';

  @override
  String get invalidServerExchangeResponse =>
      'Nieprawidłowa odpowiedź z punktu końcowego wymiany serwera';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Wyjść z Moonfina?';

  @override
  String get exitAppConfirmation => 'Czy na pewno chcesz wyjść?';

  @override
  String get exit => 'Wyjście';

  @override
  String get noHomeRowsLoaded => 'Nie można wczytać żadnych wierszy głównych';

  @override
  String get noHomeRowsHint =>
      'Spróbuj odświeżyć lub zmniejszyć aktywne sekcje strony głównej.';

  @override
  String get retryHomeRows => 'Ponów próbę wierszy głównych';

  @override
  String get guide => 'Przewodnik';

  @override
  String get recordings => 'Nagrania';

  @override
  String get schedule => 'Harmonogram';

  @override
  String get series => 'Szereg';

  @override
  String get noItemsFound => 'Nie znaleziono żadnych elementów';

  @override
  String get home => 'Dom';

  @override
  String get browseAll => 'Przeglądaj wszystko';

  @override
  String get genres => 'Gatunki';

  @override
  String get collectionPlaceholder => 'Tutaj pojawią się elementy kolekcji';

  @override
  String get browseByLetter => 'Przeglądaj według listu';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Tutaj pojawi się przeglądanie alfabetyczne';

  @override
  String get suggestions => 'Sugestie';

  @override
  String get suggestionsPlaceholder => 'Sugerowane elementy pojawią się tutaj';

  @override
  String get failedToLoadLibraries => 'Nie udało się załadować bibliotek';

  @override
  String get noLibrariesFound => 'Nie znaleziono bibliotek';

  @override
  String get library => 'Biblioteka';

  @override
  String get displaySettings => 'Ustawienia wyświetlania';

  @override
  String get allGenres => 'Wszystkie gatunki';

  @override
  String get noGenresFound => 'Nie znaleziono gatunków';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ten folder jest pusty';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Nie udało się załadować ulubionych';

  @override
  String get retry => 'Spróbować ponownie';

  @override
  String get noFavoritesYet => 'Nie ma jeszcze ulubionych';

  @override
  String get favorites => 'Ulubione';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Kontynuacja';

  @override
  String get ended => 'Zakończone';

  @override
  String get sortAndFilter => 'Sortuj i filtruj';

  @override
  String get type => 'Typ';

  @override
  String get sortBy => 'Sortuj według';

  @override
  String get display => 'Wyświetlacz';

  @override
  String get imageType => 'Typ obrazu';

  @override
  String get posterSize => 'Rozmiar plakatu';

  @override
  String get small => 'Mały';

  @override
  String get medium => 'Średni';

  @override
  String get large => 'Duży';

  @override
  String get extraLarge => 'Bardzo duży';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Widoki';

  @override
  String get albums => 'Albumy';

  @override
  String get albumArtists => 'Artyści albumowi';

  @override
  String get artists => 'Artyści';

  @override
  String get bookmarks => 'Zakładki';

  @override
  String get noSavedBookmarks =>
      'Nie ma jeszcze zapisanych zakładek dla tego tytułu.';

  @override
  String get openBook => 'Otwórz książkę';

  @override
  String get chapter => 'Rozdział';

  @override
  String get page => 'Strona';

  @override
  String get bookmark => 'Zakładka w książce';

  @override
  String get justNow => 'Właśnie';

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
  String get discoverySubjects => 'Przedmioty odkrycia';

  @override
  String get pickDiscoverySubjects =>
      'Wybierz kanały tematyczne, które mają być wyświetlane w Discover.';

  @override
  String get apply => 'Stosować';

  @override
  String get openLink => 'Otwórz łącze';

  @override
  String get scanWithYourPhone => 'Zeskanuj telefonem';

  @override
  String get audiobookGenres => 'Gatunki audiobooków';

  @override
  String get pickAudiobookGenres =>
      'Wybierz gatunki, które mają być wyświetlane w Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Odkryj audiobooki';

  @override
  String get librivoxDescription =>
      'Popularne tytuły domeny publicznej od LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Przewiń w lewo';

  @override
  String get scrollRight => 'Przewiń w prawo';

  @override
  String get couldNotLoadGenre => 'Nie można teraz wczytać tego gatunku.';

  @override
  String get continueReading => 'Kontynuuj czytanie';

  @override
  String get savedHighlights => 'Zapisane najważniejsze momenty';

  @override
  String get continueListening => 'Kontynuuj słuchanie';

  @override
  String get listen => 'Słuchać';

  @override
  String get resume => 'Wznawiać';

  @override
  String get failedToLoadLibrary => 'Nie udało się załadować biblioteki';

  @override
  String get popularNow => 'Popularne teraz';

  @override
  String get savedForLater => 'Zapisane na później';

  @override
  String get topListens => 'Najczęściej słuchane';

  @override
  String get unreadDiscoveries => 'Nieprzeczytane odkrycia';

  @override
  String get pickUpAgain => 'Odbierz ponownie';

  @override
  String get bookHighlightsDescription =>
      'Twoje książki z najciekawszymi, ulubionymi i postępami w czytaniu.';

  @override
  String get handPickedFromLibrary => 'Wybrane ręcznie z Twojej biblioteki.';

  @override
  String get handPickedFromListeningQueue =>
      'Wybrane ręcznie z Twojej kolejki odsłuchowej.';

  @override
  String get booksWithHighlights =>
      'Książki z najciekawszymi, ulubionymi lub postępami w czytaniu.';

  @override
  String get jumpBackNarration =>
      'Wróć do narracji bez szukania swojego miejsca.';

  @override
  String get unreadBooksReady =>
      'Nieprzeczytane książki gotowe na następną cichą godzinę.';

  @override
  String get quickAccessFavorites =>
      'Szybki dostęp do książek, do których ciągle wracasz.';

  @override
  String get searchAudiobooks => 'Wyszukaj audiobooki';

  @override
  String get searchYourLibrary => 'Przeszukaj swoją bibliotekę';

  @override
  String get pickUpStory =>
      'Kontynuuj historię w miejscu, w którym ją przerwałeś';

  @override
  String get savedPlacesChapters =>
      'Twoje zapisane miejsca i niedokończone rozdziały';

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
  String get readyWhenYouAre => 'Gotowy, kiedy będziesz';

  @override
  String get details => 'Bliższe dane';

  @override
  String get listeningRoom => 'Pokój Słuchania';

  @override
  String get bookmarksAndProgress => 'Zakładki i postęp';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Tytuły';

  @override
  String get allTitles => 'Wszystkie tytuły';

  @override
  String get authors => 'Autorski';

  @override
  String get browseByAuthor => 'Przeglądaj według autora';

  @override
  String get browseByGenre => 'Przeglądaj według gatunku';

  @override
  String get discover => 'Odkryć';

  @override
  String get trendingTitlesOpenLibrary =>
      'Popularne tytuły według tematu z Open Library.';

  @override
  String get noBookmarkedItems =>
      'Nie ma jeszcze żadnych elementów dodanych do zakładek';

  @override
  String get nothingMatchesSection =>
      'Nic jeszcze nie pasuje do tej sekcji. Wypróbuj inną kartę lub wróć po zakończeniu synchronizacji biblioteki.';

  @override
  String get audiobooks => 'Audiobooki';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Falcówka';

  @override
  String get filters => 'Filtry';

  @override
  String get readingStatus => 'Stan czytania';

  @override
  String get playedStatus => 'Stan gry';

  @override
  String get readStatus => 'Czytać';

  @override
  String get watched => 'Obejrzałem';

  @override
  String get unread => 'Niewykształcony';

  @override
  String get unwatched => 'Nieobserwowane';

  @override
  String get seriesStatus => 'Stan serii';

  @override
  String get allLibraries => 'Wszystkie biblioteki';

  @override
  String get books => 'Książki';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Nieznany autor';

  @override
  String get uncategorized => 'Bez kategorii';

  @override
  String get overview => 'Przegląd';

  @override
  String get noLibrivoxDescription =>
      'LibriVox nie dostarczył jeszcze opisu dla tego tytułu.';

  @override
  String get readers => 'Czytelnicy';

  @override
  String get openLinks => 'Otwórz linki';

  @override
  String get librivoxPage => 'Strona LibriVox';

  @override
  String get internetArchive => 'Archiwum internetowe';

  @override
  String get rssFeed => 'Kanał RSS';

  @override
  String get downloadZip => 'Pobierz Zipa';

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
      'W Open Library nie ma jeszcze przeglądu tego tytułu.';

  @override
  String get subjects => 'Przedmioty';

  @override
  String get all => 'Wszystko';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject => 'Nie można teraz wczytać tego tematu.';

  @override
  String get audiobookDetails => 'Szczegóły audiobooka';

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
  String get trackList => 'Lista utworów';

  @override
  String get itemListPlaceholder => 'Tutaj pojawi się lista przedmiotów';

  @override
  String get favoriteTracksPlaceholder => 'Tutaj pojawią się ulubione utwory';

  @override
  String get failedToLoad => 'Nie udało się załadować';

  @override
  String get delete => 'Usuwać';

  @override
  String get save => 'Ratować';

  @override
  String get moreLikeThis => 'Więcej takich';

  @override
  String get castAndCrew => 'Obsada i ekipa';

  @override
  String get collection => 'Kolekcja';

  @override
  String get episodes => 'Odcinki';

  @override
  String get nextUp => 'Następny w kolejce';

  @override
  String get seasons => 'Pory roku';

  @override
  String get chapters => 'Rozdziały';

  @override
  String get features => 'Cechy';

  @override
  String get movies => 'Kino';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Inny';

  @override
  String get discography => 'Dyskografia';

  @override
  String get similarArtists => 'Podobni artyści';

  @override
  String get tableOfContents => 'Spis treści';

  @override
  String get tracklist => 'Lista utworów';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'Szczegóły autora';

  @override
  String get noOverviewAvailable => 'Nie ma jeszcze przeglądu tego tytułu.';

  @override
  String get noBiographyAvailable => 'Brak biografii tego autora.';

  @override
  String get noBooksFound => 'Nie znaleziono książek tego autora.';

  @override
  String get unableToLoadAuthorDetails =>
      'Nie można teraz wczytać danych autora.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Data publikacji nieznana';

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
  String get view => 'Pogląd';

  @override
  String get resumeReading => 'Wznów czytanie';

  @override
  String get read => 'Czytać';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Grać';

  @override
  String get startOver => 'Zacznij od nowa';

  @override
  String get restart => 'Uruchom ponownie';

  @override
  String get readOffline => 'Czytaj offline';

  @override
  String get playOffline => 'Graj w trybie offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Napisy na filmie obcojęzycznym';

  @override
  String get version => 'Wersja';

  @override
  String get cast => 'Rzucać';

  @override
  String get trailer => 'Przyczepa';

  @override
  String get finished => 'Gotowy';

  @override
  String get favorited => 'Ulubione';

  @override
  String get favorite => 'Ulubiony';

  @override
  String get playlist => 'Lista odtwarzania';

  @override
  String get downloaded => 'Pobrano';

  @override
  String get downloadAll => 'Pobierz wszystko';

  @override
  String get download => 'Pobierać';

  @override
  String get deleteDownloaded => 'Usuń pobrane';

  @override
  String get goToSeries => 'Przejdź do serii';

  @override
  String get editMetadata => 'Edytuj metadane';

  @override
  String get less => 'Mniej';

  @override
  String get more => 'Więcej';

  @override
  String get deleteItem => 'Usuń element';

  @override
  String get deletePlaylist => 'Usuń listę odtwarzania';

  @override
  String get deletePlaylistMessage => 'Usunąć tę playlistę z serwera?';

  @override
  String get deleteItemMessage => 'Usunąć ten element z serwera?';

  @override
  String get failedToDeletePlaylist => 'Nie udało się usunąć playlisty';

  @override
  String get failedToDeleteItem => 'Nie udało się usunąć elementu';

  @override
  String get renamePlaylist => 'Zmień nazwę listy odtwarzania';

  @override
  String get playlistName => 'Nazwa playlisty';

  @override
  String get deleteDownloadedAlbum => 'Usuń pobrany album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Pobrane utwory zostały usunięte';

  @override
  String get downloadedTracksDeleteFailed =>
      'Niektórych pobranych utworów nie udało się usunąć';

  @override
  String get noTracksLoaded => 'Nie załadowano żadnych utworów';

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
  String get itemDeleted => 'Element usunięty';

  @override
  String get noPlayableTrailerFound => 'Nie znaleziono grywalnego zwiastuna.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Ścieżka dźwiękowa';

  @override
  String get subtitleTrack => 'Ścieżka napisów';

  @override
  String get none => 'Nic';

  @override
  String get downloadSubtitlesLabel => 'Pobierz napisy...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Szukaj za pomocą wtyczki OpenSubtitles';

  @override
  String get downloadSubtitles => 'Pobierz napisy';

  @override
  String get selectedSubtitleInvalid => 'Wybrane napisy są nieprawidłowe.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Napisy pobrane. Pojawienie się elementu może chwilę potrwać, aż Jellyfin odświeży element.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Wybierz opcję Wersja';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Pobierz wszystko — jakość';

  @override
  String get downloadQuality => 'Jakość pobierania';

  @override
  String get originalFileNoReencoding =>
      'Oryginalny plik, bez ponownego kodowania';

  @override
  String get originalFilesNoReencoding =>
      'Oryginalne pliki, bez ponownego kodowania';

  @override
  String get noEpisodesLoaded => 'Nie wczytano żadnych odcinków';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Usuń pobrane pliki';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Pobrane pliki zostały usunięte';

  @override
  String get failedToDeleteFiles => 'Nie udało się usunąć plików';

  @override
  String get deleteFiles => 'Usuń pliki';

  @override
  String get director => 'DYREKTOR';

  @override
  String get directors => '';

  @override
  String get writer => '';

  @override
  String get writers => 'PISARZE';

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
  String get showLess => 'Pokaż mniej';

  @override
  String get readMore => 'Przeczytaj więcej';

  @override
  String get shuffle => 'Człapać';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Idealne dopasowanie';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Mononukleoza';

  @override
  String get stereo => 'Stereofoniczny';

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
  String get deleteSeasonFiles => 'wszystkie pobrane odcinki w tym sezonie';

  @override
  String get stillWatching => 'Nadal oglądasz?';

  @override
  String get unableToLoadTrailerStream =>
      'Nie można załadować strumienia zwiastuna.';

  @override
  String get trailerTimedOut =>
      'Przekroczono limit czasu przyczepy podczas ładowania.';

  @override
  String get playbackFailedForTrailer =>
      'Odtwarzanie tego zwiastuna nie powiodło się.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Przesyłanie jest niedostępne podczas odtwarzania w trybie offline.';

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
  String get deviceVolume => 'Głośność urządzenia';

  @override
  String get unavailable => 'Nie płynny';

  @override
  String get pause => 'Pauza';

  @override
  String get syncPosition => 'Synchronizuj pozycję';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Kolejka jest pusta';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Zdalne odtwarzanie';

  @override
  String get castingToGoogleCast => 'Przesyłanie do Google Cast';

  @override
  String get castingViaAirPlay => 'Przesyłanie przez AirPlay';

  @override
  String get castingViaDlna => 'Przesyłanie przez DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Naciśnij długo, aby odblokować';

  @override
  String get off => 'Wyłączony';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automatyczny';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Zastąpienie szybkości transmisji';

  @override
  String get audioDelay => 'Opóźnienie dźwięku';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Opóźnienie napisów';

  @override
  String get reset => 'Nastawić';

  @override
  String get unknown => 'Nieznany';

  @override
  String get playbackInformation => 'Informacje o odtwarzaniu';

  @override
  String get playback => 'Odtwarzanie nagranego dźwięku';

  @override
  String get playMethod => 'Metoda odtwarzania';

  @override
  String get directPlay => 'Gra bezpośrednia';

  @override
  String get directStream => 'Bezpośredni strumień';

  @override
  String get transcoding => 'Transkodowanie';

  @override
  String get transcodeReasons => 'Powody transkodowania';

  @override
  String get player => 'Odtwarzacz';

  @override
  String get container => 'Pojemnik';

  @override
  String get bitrate => 'Szybkość transmisji';

  @override
  String get video => 'Wideo';

  @override
  String get resolution => 'Rezolucja';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Szybkość transmisji wideo';

  @override
  String get track => 'Ścieżka';

  @override
  String get channels => 'Kanały';

  @override
  String get audioBitrate => 'Szybkość transmisji dźwięku';

  @override
  String get sampleRate => 'Częstotliwość próbkowania';

  @override
  String get format => 'Format';

  @override
  String get external => 'Zewnętrzny';

  @override
  String get embedded => 'Osadzony';

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
      'Renderowanie plików EPUB w aplikacji nie jest jeszcze dostępne na tej platformie.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Wbudowane renderowanie dokumentów jest niedostępne na tej platformie.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nie można otworzyć zewnętrznej przeglądarki.';

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
      'Nie ma jeszcze żadnych zakładek.\nStuknij ikonę zakładki podczas czytania, aby zapisać swoją pozycję.';

  @override
  String get noTableOfContentsAvailable => 'Brak spisu treści';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Pozycja';

  @override
  String get bookReader => 'Czytelnik książek';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Aktualizowanie...';

  @override
  String get markUnread => 'Oznacz jako nieprzeczytane';

  @override
  String get markAsRead => 'Oznacz jako przeczytane';

  @override
  String get reloadReader => 'Załaduj ponownie czytnik';

  @override
  String get noPagesFound => 'Nie znaleziono żadnych stron.';

  @override
  String get failedToDecodePageImage =>
      'Nie udało się zdekodować obrazu strony.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Pojedyncza strona';

  @override
  String get twoPageSpread => 'Rozkładówka dwustronicowa';

  @override
  String get addBookmark => 'Dodaj zakładkę';

  @override
  String get bookmarksEllipsis => 'Zakładki...';

  @override
  String get markedAsRead => 'Oznaczono jako przeczytane';

  @override
  String get markedAsUnread => 'Oznaczono jako nieprzeczytane';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Temat: System';

  @override
  String get themeLight => 'Temat: Światło';

  @override
  String get themeDark => 'Temat: Ciemność';

  @override
  String get themeSepia => 'Temat: Sepia';

  @override
  String get invertColorsFixedLayout => 'Odwróć kolory (stały układ)';

  @override
  String get invertColorsPdf => 'Odwróć kolory (PDF)';

  @override
  String get preparingInAppReader => 'Przygotowuję czytnik w aplikacji...';

  @override
  String get pdfDataNotAvailable => 'Dane w formacie PDF są niedostępne.';

  @override
  String get readerFallbackModeActive => 'Aktywny tryb awaryjny czytnika';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Użyj Reload Reader po przejściu na obsługiwaną platformę docelową (Android, iOS, macOS).';

  @override
  String get openExternally => 'Otwórz zewnętrznie';

  @override
  String get noEpubChaptersFound => 'Nie znaleziono rozdziałów EPUB.';

  @override
  String get readerNotReady => 'Czytnik nie jest gotowy.';

  @override
  String get seriesRecordings => 'Nagrania serii';

  @override
  String get now => 'Teraz';

  @override
  String get sports => 'Lekkoatletyka';

  @override
  String get news => 'Aktualności';

  @override
  String get kids => 'Dzieci';

  @override
  String get premiere => 'Premiera';

  @override
  String get guideTimeline => 'Przewodnik po osi czasu';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Nie znaleziono kanałów';

  @override
  String get liveBadge => 'NA ŻYWO';

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
  String get removedFromFavoriteChannels => 'Usunięto z ulubionych kanałów';

  @override
  String get addedToFavoriteChannels => 'Dodano do ulubionych kanałów';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nie udało się zaktualizować ulubionego kanału';

  @override
  String get unfavoriteChannel => 'Nieulubiony kanał';

  @override
  String get favoriteChannel => 'Ulubiony kanał';

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
  String get watch => 'Oglądać';

  @override
  String get close => 'Zamknąć';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Nie udało się załadować nagrań';

  @override
  String get scheduledInNext24Hours =>
      'Zaplanowane w ciągu najbliższych 24 godzin';

  @override
  String get recentRecordings => 'Najnowsze nagrania';

  @override
  String get tvSeries => 'Seriale telewizyjne';

  @override
  String get failedToLoadSchedule => 'Nie udało się załadować harmonogramu';

  @override
  String get noScheduledRecordings => 'Brak zaplanowanych nagrań';

  @override
  String get cancelRecording => 'Anulować nagrywanie?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'NIE';

  @override
  String get yesCancel => 'Tak, Anuluj';

  @override
  String get failedToCancelRecording => 'Nie udało się anulować nagrywania';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nie udało się załadować nagrań serii';

  @override
  String get noSeriesRecordings => 'Brak nagrań seriali';

  @override
  String get cancelSeriesRecording => 'Anuluj nagrywanie serii';

  @override
  String get cancelSeriesRecordingQuestion => 'Anulować nagrywanie serii?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nie udało się anulować nagrywania serii';

  @override
  String get searchThisLibrary => 'Przeszukaj tę bibliotekę...';

  @override
  String get searchEllipsis => 'Szukaj...';

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
  String get seerrAccountType => 'Typ konta Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokalny';

  @override
  String get savedMedia => 'Zapisane multimedia';

  @override
  String get tvShows => 'Programy telewizyjne';

  @override
  String get music => 'Muzyka';

  @override
  String get musicAlbums => 'Albumy muzyczne';

  @override
  String get noMediaInFilter => 'Brak mediów w tym filtrze';

  @override
  String get noDownloadedMediaYet => 'Nie pobrano jeszcze multimediów';

  @override
  String get browseLibrary => 'Przeglądaj bibliotekę';

  @override
  String get deleteDownload => 'Usuń pobieranie';

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
  String get playAlbum => 'Odtwórz album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Sezon';

  @override
  String get errorLoadingEpisodes => 'Błąd podczas ładowania odcinków';

  @override
  String get noDownloadedEpisodes => 'Brak pobranych odcinków';

  @override
  String get deleteEpisode => 'Usuń odcinek';

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
  String get seriesNotFound => 'Nie znaleziono serii';

  @override
  String get errorLoadingSeries => 'Błąd podczas ładowania serii';

  @override
  String get downloadedEpisodes => 'Pobrane odcinki';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Promocje';

  @override
  String get deleteSeason => 'Usuń sezon';

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
  String get storageManagement => 'Zarządzanie pamięcią masową';

  @override
  String get storageBreakdown => 'Podział magazynu';

  @override
  String get downloadedItems => 'Pobrane elementy';

  @override
  String get storageLimit => 'Limit przechowywania';

  @override
  String get noLimit => 'Bez limitu';

  @override
  String get deleteAllDownloads => 'Usuń wszystkie pobrane pliki';

  @override
  String get deleteAllDownloadsWarning =>
      'Spowoduje to usunięcie wszystkich pobranych plików multimedialnych. Tej operacji nie można cofnąć.';

  @override
  String get deleteAll => 'Usuń wszystko';

  @override
  String get deleteSelected => 'Usuń wybrane';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Muzyka i audiobooki';

  @override
  String get images => 'Obrazy';

  @override
  String get database => 'Baza danych';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Ustawienia';

  @override
  String get authentication => 'Uwierzytelnianie';

  @override
  String get autoLoginServerManagement =>
      'Automatyczne logowanie, zarządzanie serwerem';

  @override
  String get pinCode => 'Kod PIN';

  @override
  String get setUpPinCodeProtection => 'Skonfiguruj ochronę kodem PIN';

  @override
  String get parentalControls => 'Kontrola rodzicielska';

  @override
  String get contentRatingRestrictions => 'Ograniczenia dotyczące oceny treści';

  @override
  String get bitRateResolutionBehavior =>
      'Szybkość transmisji, rozdzielczość, zachowanie';

  @override
  String get languageSizeAppearance => 'Język, rozmiar, wygląd';

  @override
  String get qualityStorage => 'Jakość, magazyn';

  @override
  String get serverSyncAndPluginStatus =>
      'Synchronizacja serwera i stan wtyczki';

  @override
  String get mediaRequestIntegration => 'Integracja żądań mediów';

  @override
  String get switchServer => 'Przełącz serwer';

  @override
  String get signOut => 'Wyloguj się';

  @override
  String get versionLicenses => 'Wersja, licencje';

  @override
  String get account => 'Konto';

  @override
  String get signInAndSecurity => 'Logowanie i bezpieczeństwo';

  @override
  String get administration => 'Administracja';

  @override
  String get serverSettingsUsersLibraries =>
      'Ustawienia serwera, użytkownicy, biblioteki';

  @override
  String get customization => 'Personalizacja';

  @override
  String get themeAndLayout => 'Motyw i układ';

  @override
  String get videoAndSubtitles => 'Wideo i napisy';

  @override
  String get integrations => 'Integracje';

  @override
  String get pluginAndRequests => 'Wtyczka i żądania';

  @override
  String get customizeAccountPlaybackInterface =>
      'Dostosuj konto, odtwarzanie i zachowanie interfejsu';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Motyw i wygląd';

  @override
  String get focusBorderColor => 'Kolor obramowania ostrości';

  @override
  String get watchedIndicators => 'Obserwowane wskaźniki';

  @override
  String get always => 'Zawsze';

  @override
  String get hideUnwatched => 'Ukryj nieobserwowane';

  @override
  String get episodesOnly => 'Tylko odcinki';

  @override
  String get never => 'Nigdy';

  @override
  String get focusExpansionAnimation => 'Animacja rozwijania ostrości';

  @override
  String get desktopUiScale => 'Skala interfejsu użytkownika pulpitu';

  @override
  String get scaleFocusedCards =>
      'Skaluj skupione lub najechane karty i kafelki';

  @override
  String get backgroundBackdrops => 'Tła Tła';

  @override
  String get showBackdropImages => 'Pokaż obrazy tła za treścią';

  @override
  String get seriesThumbnails => 'Miniatury serii';

  @override
  String get seriesThumbnailsDescription =>
      'Tylko odcinki: użyj grafiki serialu odpowiadającej typowi obrazu w każdym wierszu';

  @override
  String get homeRowInfoOverlay => 'Nakładka informacyjna wiersza głównego';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Pokaż tytuł i metadane podczas przeglądania wierszy głównych';

  @override
  String get clockDisplay => 'Wyświetlacz zegara';

  @override
  String get inMenus => 'W Menu';

  @override
  String get inVideo => 'W wideo';

  @override
  String get seasonalEffects => 'Efekty sezonowe';

  @override
  String get seasonalEffectsDescription =>
      'Efekty wizualne i dekoracje sezonowe';

  @override
  String get snow => 'Śnieg';

  @override
  String get fireworks => 'Fajerwerki';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Spadające Liście';

  @override
  String get themeMusic => 'Muzyka tematyczna';

  @override
  String get playThemeMusicOnDetailPages =>
      'Odtwarzaj muzykę tematyczną na stronach szczegółów';

  @override
  String get themeMusicVolume => 'Głośność muzyki tematycznej';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Motyw muzyczny w rzędach domowych';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Odtwórz podczas przeglądania ekranu głównego';

  @override
  String get detailsBackgroundBlur => 'Szczegóły Rozmycie tła';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Przeglądanie rozmycia tła';

  @override
  String get maxStreamingBitrate =>
      'Maksymalna szybkość transmisji strumieniowej';

  @override
  String get maxResolution => 'Maksymalna rozdzielczość';

  @override
  String get playerZoomMode => 'Tryb powiększenia gracza';

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
  String get fit => 'Pasować';

  @override
  String get autoCrop => 'Automatyczne przycinanie';

  @override
  String get stretch => 'Rozciągać się';

  @override
  String get refreshRateSwitching => 'Przełączanie częstotliwości odświeżania';

  @override
  String get disabled => 'Wyłączony';

  @override
  String get scaleOnTv => 'Skala w telewizji';

  @override
  String get scaleOnDevice => 'Skaluj na urządzeniu';

  @override
  String get trickPlay => 'Zabawa w sztuczki';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Pokaż miniatury podglądu podczas wyszukiwania';

  @override
  String get showDescriptionOnPause => 'Pokaż opis w trybie pauzy';

  @override
  String get dimVideoShowOverview =>
      'Przyciemnij wideo i pokaż tekst przeglądu podczas pauzy';

  @override
  String get osdLockButton => 'Przycisk blokady OSD';

  @override
  String get osdLockButtonDescription =>
      'Pokaż przycisk blokady, który blokuje wprowadzanie dotykowe do momentu długiego naciśnięcia';

  @override
  String get audioBehavior => 'Zachowanie dźwiękowe';

  @override
  String get downmixToStereo => 'Zmiksuj do stereo';

  @override
  String get defaultAudioLanguage => 'Domyślny język dźwięku';

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
  String get autoServerDefault => 'Automatycznie (domyślne ustawienie serwera)';

  @override
  String get english => 'angielski';

  @override
  String get spanish => 'hiszpański';

  @override
  String get french => 'francuski';

  @override
  String get german => 'niemiecki';

  @override
  String get italian => 'włoski';

  @override
  String get portuguese => 'portugalski';

  @override
  String get japanese => 'japoński';

  @override
  String get korean => 'koreański';

  @override
  String get chinese => 'chiński';

  @override
  String get russian => 'rosyjski';

  @override
  String get arabic => 'arabski';

  @override
  String get hindi => 'hinduski';

  @override
  String get dutch => 'Holenderski';

  @override
  String get swedish => 'szwedzki';

  @override
  String get norwegian => 'norweski';

  @override
  String get danish => 'duński';

  @override
  String get finnish => 'fiński';

  @override
  String get polish => 'Polski';

  @override
  String get ac3Passthrough => 'Przejście AC3';

  @override
  String get dtsPassthrough => 'Przejście DTS';

  @override
  String get trueHdSupport => 'Obsługa TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Tylko dźwięk Bitstream DTS do AVR; wymaga obsługi odbiornika i ścieżki źródłowej DTS';

  @override
  String get enableTrueHdAudio =>
      'Włącz dźwięk TrueHD (może nie działać na wszystkich platformach)';

  @override
  String get settingsAudioOutputMode => 'Audio Output Mode';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Audio Fallback Codec';

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
  String get nightMode => 'Tryb nocny';

  @override
  String get compressDynamicRange => 'Kompresuj zakres dynamiki';

  @override
  String get advancedMpv => 'Zaawansowane mpv';

  @override
  String get enableCustomMpvConf => 'Włącz niestandardowy plik mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Przed rozpoczęciem odtwarzania zastosuj określony przez użytkownika plik mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Niebezpieczne zaawansowane opcje mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Zezwól na szerszy zestaw opcji mpv. Może przerwać odtwarzanie.';

  @override
  String get hardwareDecoding => 'Dekodowanie sprzętowe';

  @override
  String get hardwareDecodingSubtitle =>
      'Może poprawić wydajność, ale może powodować problemy z odtwarzaniem na niektórych urządzeniach.';

  @override
  String get nextUpAndQueuing => 'Dalej i w kolejce';

  @override
  String get nextUpDisplay => 'Następny wyświetlacz';

  @override
  String get extended => 'Rozszerzony';

  @override
  String get minimal => 'Minimalny';

  @override
  String get nextUpTimeout => 'Następny limit czasu';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Kolejkowanie multimediów';

  @override
  String get autoQueueNextEpisodes =>
      'Automatyczne kolejkowanie kolejnych odcinków';

  @override
  String get stillWatchingPrompt => 'Nadal oglądam Podpowiedź';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Wznów i pomiń';

  @override
  String get resumeRewind => 'Wznów przewijanie';

  @override
  String get unpauseRewind => 'Wznów przewijanie do tyłu';

  @override
  String get fiveSeconds => '5 sekund';

  @override
  String get tenSeconds => '10 sekund';

  @override
  String get fifteenSeconds => '15 sekund';

  @override
  String get thirtySeconds => '30 sekund';

  @override
  String get skipBackLength => 'Pomiń długość tyłu';

  @override
  String get skipForwardLength => 'Przeskocz długość do przodu';

  @override
  String get customMpvConfPath => 'Niestandardowa ścieżka do pliku mpv.conf';

  @override
  String get notSetMpvConf =>
      'Nie ustawiono. Moonfin spróbuje użyć domyślnego pliku mpv.conf w folderach app/data.';

  @override
  String get selectMpvConf => 'Wybierz plik mpv.conf';

  @override
  String get pathToMpvConf => '/ścieżka/do/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Ustawienia stylu (rozmiar, kolor, przesunięcie) dotyczą napisów tekstowych (SRT, VTT, TTML). Napisy ASS/SSA korzystają z własnego, osadzonego stylu, chyba że funkcja „ASS/SSA Direct Play” jest wyłączona. Nie można zmienić stylu napisów bitmapowych (PGS, DVB, VobSub).';

  @override
  String get defaultSubtitleLanguage => 'Domyślny język napisów';

  @override
  String get defaultToNoSubtitles => 'Domyślnie brak napisów';

  @override
  String get turnOffSubtitlesByDefault => 'Domyślnie wyłącz napisy';

  @override
  String get subtitleSize => 'Rozmiar napisów';

  @override
  String get textFillColor => 'Kolor wypełnienia tekstu';

  @override
  String get backgroundColor => 'Kolor tła';

  @override
  String get textStrokeColor => 'Kolor obrysu tekstu';

  @override
  String get subtitleCustomization => 'Dostosowywanie napisów';

  @override
  String get subtitleCustomizationDescription => 'Dostosuj wygląd napisów';

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
      'Szybki brązowy lis przeskakuje leniwego psa';

  @override
  String get verticalOffset => 'Przesunięcie pionowe';

  @override
  String get pgsDirectPlay => 'Gra bezpośrednia PGS';

  @override
  String get directPlayPgsSubtitles => 'Bezpośrednie odtwarzanie napisów PGS';

  @override
  String get assSsaDirectPlay => 'Gra bezpośrednia ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Bezpośrednie odtwarzanie napisów ASS/SSA';

  @override
  String get white => 'Biały';

  @override
  String get black => 'Czarny';

  @override
  String get yellow => 'Żółty';

  @override
  String get green => 'Zielony';

  @override
  String get cyan => 'Cyjan';

  @override
  String get red => 'Czerwony';

  @override
  String get transparent => 'Przezroczysty';

  @override
  String get semiTransparentBlack => 'Półprzezroczysty czarny';

  @override
  String get global => 'Światowy';

  @override
  String get desktop => 'Pulpit';

  @override
  String get mobile => 'Przenośny';

  @override
  String get tv => 'telewizja';

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
  String get customizationProfile => 'Profil dostosowywania';

  @override
  String get customizationProfileDescription =>
      'Wybierz profil, który chcesz wczytać, edytować i zsynchronizować. Globalny ma zastosowanie wszędzie, chyba że profil urządzenia go zastępuje. Zielona kropka oznacza bieżący profil urządzenia.';

  @override
  String get loadProfile => 'Załaduj profil';

  @override
  String get syncing => 'Synchronizowanie...';

  @override
  String get syncToProfile => 'Synchronizuj z profilem';

  @override
  String get profileSyncHidden => 'Synchronizacja profilu ukryta';

  @override
  String get enablePluginSyncDescription =>
      'Włącz synchronizację wtyczki serwera w ustawieniach wtyczki, aby wyświetlić tutaj elementy sterujące profilem.';

  @override
  String get quality => 'Jakość';

  @override
  String get defaultDownloadQuality => 'Domyślna jakość pobierania';

  @override
  String get network => 'Sieć';

  @override
  String get wifiOnlyDownloads => 'Pobieranie tylko przez Wi-Fi';

  @override
  String get onlyDownloadOnWifi => 'Pobieraj tylko po podłączeniu do Wi-Fi';

  @override
  String get storage => 'Składowanie';

  @override
  String get storageUsed => 'Pamięć używana';

  @override
  String get manage => 'Zarządzać';

  @override
  String get calculating => 'Obliczenie...';

  @override
  String get downloadLocation => 'Pobierz lokalizację';

  @override
  String get defaultLabel => 'Domyślny';

  @override
  String get saveToDownloadsFolder => 'Zapisz w folderze Pobrane';

  @override
  String get downloadsVisibleToOtherApps =>
      'Pobrane/Moonfin — widoczne dla innych aplikacji';

  @override
  String get dangerZone => 'Strefa zagrożenia';

  @override
  String get clearAllDownloads => 'Wyczyść wszystkie pobrane pliki';

  @override
  String get original => 'Oryginalny';

  @override
  String get changeDownloadLocation => 'Zmień lokalizację pobierania';

  @override
  String get changeDownloadLocationDescription =>
      'Nowe pliki do pobrania zostaną zapisane w wybranym folderze. Istniejące pliki do pobrania pozostaną w bieżącej lokalizacji i można nimi zarządzać w ustawieniach przechowywania.';

  @override
  String get confirm => 'Potwierdzać';

  @override
  String get cannotWriteToFolder =>
      'Nie można zapisać w wybranym folderze. Wybierz inną lokalizację lub przyznaj uprawnienia do przechowywania.';

  @override
  String get saveToDownloadsFolderQuestion => 'Zapisać w folderze Pobrane?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Pobrane multimedia zostaną zapisane w folderze Pobrane/Moonfin na Twoim urządzeniu. Pliki te będą widoczne dla innych aplikacji, takich jak galeria czy odtwarzacz muzyki.\n\nIstniejące pliki do pobrania pozostaną w bieżącej lokalizacji.';

  @override
  String get enable => 'Włączać';

  @override
  String get clearAllDownloadsWarning =>
      'Spowoduje to usunięcie wszystkich pobranych multimediów. Tej operacji nie można cofnąć.';

  @override
  String get clearAll => 'Wyczyść wszystko';

  @override
  String get navigationStyle => 'Styl nawigacji';

  @override
  String get topBar => 'Górny pasek';

  @override
  String get leftSidebar => 'Lewy pasek boczny';

  @override
  String get showShuffleButton => 'Pokaż przycisk mieszania';

  @override
  String get showGenresButton => 'Pokaż przycisk gatunków';

  @override
  String get showFavoritesButton => 'Pokaż przycisk Ulubione';

  @override
  String get showLibrariesInToolbar => 'Pokaż biblioteki na pasku narzędzi';

  @override
  String get showSeerrButton => '';

  @override
  String get navbarOpacity => 'Nieprzezroczystość paska nawigacyjnego';

  @override
  String get navbarColor => 'Kolor paska nawigacyjnego';

  @override
  String get gray => 'Szary';

  @override
  String get darkBlue => 'Ciemnoniebieski';

  @override
  String get purple => 'Fioletowy';

  @override
  String get teal => 'Cyraneczka';

  @override
  String get navy => 'Marynarka wojenna';

  @override
  String get charcoal => 'Węgiel drzewny';

  @override
  String get brown => 'Brązowy';

  @override
  String get darkRed => 'Ciemnoczerwony';

  @override
  String get darkGreen => 'Ciemnozielony';

  @override
  String get slate => 'Łupek';

  @override
  String get indigo => 'Indygo';

  @override
  String get libraryDisplay => 'Wystawa biblioteczna';

  @override
  String get posterLabel => 'Plakat';

  @override
  String get thumbnailLabel => 'Zwięzły';

  @override
  String get bannerLabel => 'Transparent';

  @override
  String get overridePerLibrarySettings =>
      'Zastąp ustawienia dla poszczególnych bibliotek';

  @override
  String get applyImageTypeToAllLibraries =>
      'Zastosuj typ obrazu do wszystkich bibliotek';

  @override
  String get multiServerLibraries => 'Biblioteki wieloserwerowe';

  @override
  String get showLibrariesFromAllServers =>
      'Pokaż biblioteki ze wszystkich podłączonych serwerów';

  @override
  String get enableFolderView => 'Włącz widok folderów';

  @override
  String get showFolderBrowsingOption => 'Pokaż opcję przeglądania folderów';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'Widoczność biblioteki';

  @override
  String get libraryVisibilityDescription =>
      'Przełącz widoczność strony głównej dla każdej biblioteki. Uruchom ponownie Moonfin, aby zmiany odniosły skutek.';

  @override
  String get showInNavigation => 'Pokaż w nawigacji';

  @override
  String get showInLatestMedia => 'Pokaż w najnowszych mediach';

  @override
  String get sourceLibraries => 'Biblioteki źródłowe';

  @override
  String get sourceCollections => 'Kolekcje źródłowe';

  @override
  String get excludedGenres => 'Wykluczone gatunki';

  @override
  String get selectAll => 'Wybierz wszystko';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Pasek multimediów';

  @override
  String get mediaSources => 'Źródła mediów';

  @override
  String get behavior => 'Zachowanie';

  @override
  String get seconds => 'towary drugiej jakości';

  @override
  String get localPreviews => 'Lokalne podglądy';

  @override
  String get localPreviewsDescription =>
      'Skonfiguruj podgląd zwiastuna, multimediów i dźwięku.';

  @override
  String get mediaBarMode => 'Styl paska multimediów';

  @override
  String get mediaBarModeDescription =>
      'Wybierz jeden z różnych stylów paska multimediów lub wyłącz go';

  @override
  String get mediaBarModeMoonfin => 'Księżycowa Płetwa';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Wyłączony';

  @override
  String get enableMediaBar => 'Włącz pasek multimediów';

  @override
  String get showFeaturedContentSlideshow =>
      'Pokaż pokaz slajdów z polecaną zawartością na stronie głównej';

  @override
  String get contentType => 'Typ zawartości';

  @override
  String get moviesAndTvShows => 'Filmy i programy telewizyjne';

  @override
  String get moviesOnly => 'Tylko filmy';

  @override
  String get tvShowsOnly => 'Tylko programy telewizyjne';

  @override
  String get itemCount => 'Liczba pozycji';

  @override
  String get noneSelected => 'Nie wybrano żadnego';

  @override
  String get noneExcluded => 'Żaden wykluczony';

  @override
  String get autoAdvance => 'Automatyczny postęp';

  @override
  String get autoAdvanceSlides => 'Automatycznie przejdź do następnego slajdu';

  @override
  String get autoAdvanceInterval => 'Interwał automatycznego przewijania';

  @override
  String get trailerPreview => 'Podgląd zwiastuna';

  @override
  String get autoPlayTrailers =>
      'Automatyczne odtwarzanie zwiastunów na pasku multimediów po 3 sekundach';

  @override
  String get episodePreview => 'Podgląd odcinka';

  @override
  String get mediaPreview => 'Podgląd multimediów';

  @override
  String get episodePreviewDescription =>
      'Odtwórz 30-sekundowy podgląd wbudowany na kartach skupionych, najechanych kursorem lub długo wciśniętych';

  @override
  String get mediaPreviewDescription =>
      'Odtwórz 30-sekundowy podgląd wbudowany na kartach skupionych, najechanych kursorem lub długo wciśniętych';

  @override
  String get previewAudio => 'Podgląd dźwięku';

  @override
  String get enablePreviewAudio =>
      'Włącz dźwięk w podglądach zwiastunów i odcinków';

  @override
  String get latestMedia => 'Najnowsze multimedia';

  @override
  String get recentlyReleased => 'Niedawno wydany';

  @override
  String get myMedia => 'Moje media';

  @override
  String get myMediaSmall => 'Moje multimedia (małe)';

  @override
  String get continueWatching => 'Kontynuuj oglądanie';

  @override
  String get resumeAudio => 'Wznów dźwięk';

  @override
  String get resumeBooks => 'Książki wznowieniowe';

  @override
  String get activeRecordings => 'Aktywne nagrania';

  @override
  String get playlists => 'Listy odtwarzania';

  @override
  String get liveTV => 'Telewizja na żywo';

  @override
  String get homeSections => 'Sekcje główne';

  @override
  String get resetToDefaults => 'Przywróć ustawienia domyślne';

  @override
  String get homeRowPosterSize => 'Rozmiar plakatu w pierwszym rzędzie';

  @override
  String get perRowImageTypeSelection => 'Wybór typu obrazu w wierszu';

  @override
  String get configureImageTypeForEachRow =>
      'Skonfiguruj typ obrazu dla każdego włączonego wiersza głównego';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Połącz Kontynuuj oglądanie i kontynuuj';

  @override
  String get combineBothRows => 'Połącz oba rzędy w jedną sekcję główną';

  @override
  String get fullScreenRows => '';

  @override
  String get fullScreenRowsDescription => '';

  @override
  String get perRowImageType => 'Typ obrazu na wiersz';

  @override
  String get perRowSettings => 'Ustawienia poszczególnych wierszy';

  @override
  String get autoLogin => 'Automatyczne logowanie';

  @override
  String get lastUser => 'Ostatni użytkownik';

  @override
  String get currentUser => '';

  @override
  String get alwaysAuthenticate => 'Zawsze uwierzytelniaj';

  @override
  String get requirePasswordWithToken =>
      'Wymagaj hasła nawet przy przechowywanym tokenie';

  @override
  String get confirmExit => 'Potwierdź wyjście';

  @override
  String get showConfirmationBeforeExiting =>
      'Pokaż potwierdzenie przed wyjściem';

  @override
  String get blockContentWithRatings =>
      'Blokuj treści z następującymi ocenami:';

  @override
  String get noContentRatingsFound =>
      'Na tym serwerze nie znaleziono jeszcze żadnych ocen treści.';

  @override
  String get couldNotLoadServerRatings =>
      'Nie można wczytać ocen serwera. Wyświetlanie tylko zapisanych ocen.';

  @override
  String get couldNotRefreshRatings =>
      'Nie można odświeżyć ocen z serwera. Wyświetlam zapisane oceny.';

  @override
  String get enablePinCode => 'Włącz kod PIN';

  @override
  String get requirePinToAccess =>
      'Wymagaj kodu PIN, aby uzyskać dostęp do konta';

  @override
  String get changePin => 'Zmień PIN';

  @override
  String get setNewPinCode => 'Ustaw nowy kod PIN';

  @override
  String get removePin => 'Usuń PIN';

  @override
  String get removePinProtection => 'Usuń ochronę kodem PIN';

  @override
  String get screensaver => 'Wygaszacz ekranu';

  @override
  String get inAppScreensaver => 'Wygaszacz ekranu w aplikacji';

  @override
  String get enableBuiltInScreensaver => 'Włącz wbudowany wygaszacz ekranu';

  @override
  String get mode => 'Tryb';

  @override
  String get libraryArt => 'Biblioteka Sztuka';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Zegar';

  @override
  String get timeout => 'Limit czasu';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Poziom ściemniania';

  @override
  String get maxAgeRating => 'Maksymalny wiek';

  @override
  String get any => 'Każdy';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Wymagaj klasyfikacji wiekowej';

  @override
  String get onlyShowRatedContent => 'Pokazuj tylko ocenione treści';

  @override
  String get showClock => 'Pokaż zegar';

  @override
  String get displayClockDuringScreensaver =>
      'Wyświetl zegar podczas wygaszacza ekranu';

  @override
  String get clockModeStatic => '';

  @override
  String get clockModeBouncing => '';

  @override
  String get rottenTomatoesCritics => 'Zgniłe pomidory (krytycy)';

  @override
  String get rottenTomatoesAudience => 'Zgniłe pomidory (publiczność)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakrytyczny';

  @override
  String get metacriticUser => 'Metacritic (użytkownik)';

  @override
  String get trakt => 'Traktat';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'Moja lista anime';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Ocena społeczności';

  @override
  String get ratings => 'Oceny';

  @override
  String get additionalRatings => 'Dodatkowe oceny';

  @override
  String get showMdbListAndTmdbRatings => 'Pokaż oceny MDBList i TMDB';

  @override
  String get ratingLabels => 'Etykiety ocen';

  @override
  String get showLabelsNextToIcons => 'Pokaż etykiety obok ikon ocen';

  @override
  String get ratingBadges => 'Odznaki ocen';

  @override
  String get showDecorativeBadges => 'Pokaż ozdobne plakietki za ocenami';

  @override
  String get episodeRatings => 'Oceny odcinków';

  @override
  String get showRatingsOnEpisodes => 'Pokaż oceny poszczególnych odcinków';

  @override
  String get ratingSources => 'Źródła ocen';

  @override
  String get ratingSourcesDescription =>
      'Włącz i zmień kolejność źródeł ocen wyświetlanych w aplikacji';

  @override
  String get pluginLabel => 'Wtyczka';

  @override
  String get pluginDetected => 'Wykryto wtyczkę';

  @override
  String get pluginNotDetected => 'Nie wykryto wtyczki';

  @override
  String get pluginDetectedDescription =>
      'Wykryto wtyczkę serwera. Synchronizacja jest włączana automatycznie przy pierwszym znalezieniu wtyczki.';

  @override
  String get pluginNotDetectedDescription =>
      'Wtyczka serwera nie została obecnie wykryta. Ustawienia lokalne nadal korzystają z zapisanych wartości lub wbudowanych ustawień domyślnych.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Dostępne usługi';

  @override
  String get serverPluginSync => 'Synchronizacja wtyczek serwera';

  @override
  String get syncSettingsWithPlugin =>
      'Synchronizuj ustawienia z wtyczką serwera';

  @override
  String get whatSyncControls => 'Jakie elementy sterujące synchronizacją';

  @override
  String get syncControlsDescription =>
      'Synchronizacja kontroluje tylko to, czy ustawienia oparte na wtyczkach są przesyłane na serwer i pobierane z niego. Wybór profilu i akcje synchronizacji profilu znajdują się w ustawieniach dostosowywania, gdy włączona jest synchronizacja wtyczek.';

  @override
  String get recentRequests => 'Ostatnie prośby';

  @override
  String get recentlyAdded => 'Ostatnio dodane';

  @override
  String get trending => 'Trendy';

  @override
  String get popularMovies => 'Popularne filmy';

  @override
  String get movieGenres => 'Gatunki filmowe';

  @override
  String get upcomingMovies => 'Nadchodzące filmy';

  @override
  String get studios => 'Studia';

  @override
  String get popularSeries => 'Popularna seria';

  @override
  String get seriesGenres => 'Gatunki seriali';

  @override
  String get upcomingSeries => 'Nadchodząca seria';

  @override
  String get networks => 'Sieci';

  @override
  String get seerrDiscoveryRows => '';

  @override
  String get resetRowsToDefaults => 'Zresetuj wiersze do wartości domyślnych';

  @override
  String get enableSeerr => 'Włącz Seera';

  @override
  String get showSeerrInNavigation =>
      'Pokaż Seerr w nawigacji (wymaga wtyczki serwera)';

  @override
  String get seerrUnavailable =>
      'Niedostępne, ponieważ obsługa wtyczki serwera Seerr jest wyłączona.';

  @override
  String get nsfwFilter => 'Filtr NSFW';

  @override
  String get hideAdultContent => 'Ukryj w wynikach treści dla dorosłych';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Odkryj rzędy';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Przeciągnij, aby zmienić kolejność. Włącz lub wyłącz wiersze. Włączona kolejność wierszy synchronizuje się z wtyczką Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Przeciągnij, aby zmienić kolejność. Włącz lub wyłącz wiersze.';

  @override
  String get enabled => 'Włączony';

  @override
  String get hidden => 'Ukryty';

  @override
  String get aboutTitle => 'O';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Licencje Open Source';

  @override
  String get sourceCode => 'Kod źródłowy';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Sprawdź teraz dostępność aktualizacji';

  @override
  String get checksLatestDesktopRelease =>
      'Sprawdza najnowszą wersję komputerową dla tej platformy';

  @override
  String get youAreUpToDate => 'Jesteś na bieżąco.';

  @override
  String get couldNotCheckForUpdates =>
      'Nie można teraz sprawdzić dostępności aktualizacji.';

  @override
  String get noCompatibleUpdate =>
      'Nie znaleziono kompatybilnego pakietu aktualizacji dla tej platformy.';

  @override
  String get updateChecksNotSupported =>
      'Sprawdzanie aktualizacji nie jest obsługiwane na tej platformie.';

  @override
  String get updateNotificationsDisabled =>
      'Powiadomienia o aktualizacjach są wyłączone.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Proszę poczekać przed ponownym sprawdzeniem.';

  @override
  String get latestUpdateAlreadyShown =>
      'Najnowsza aktualizacja została już wyświetlona.';

  @override
  String get updateAvailable => 'Dostępna aktualizacja.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Aktualizuj powiadomienia';

  @override
  String get showWhenUpdatesAvailable =>
      'Pokaż, kiedy dostępne są aktualizacje';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Przeczytaj Informacje o wersji';

  @override
  String get downloadingUpdate => 'Pobieram aktualizację...';

  @override
  String get updateDownloadFailed =>
      'Pobieranie aktualizacji nie powiodło się. Spróbuj ponownie.';

  @override
  String get openReleasesPage => 'Otwórz stronę z wydaniami';

  @override
  String get navigation => 'Nawigacja';

  @override
  String get watchedIndicatorsBackdrops => 'Obserwowane wskaźniki, tła';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Kolor ostrości, obserwowane wskaźniki, tła';

  @override
  String get navbarStyleToolbarAppearance =>
      'Styl paska nawigacyjnego, przyciski paska narzędzi, wygląd';

  @override
  String get reorderToggleHomeRows =>
      'Zmień kolejność i przełącz wiersze główne';

  @override
  String get featuredContentAppearance => 'Polecana treść, wygląd';

  @override
  String get posterSizeImageTypeFolderView =>
      'Rozmiar plakatu, typ obrazu, widok folderu';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB i źródła ocen';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Jasne';

  @override
  String get browse => 'Przeglądać';

  @override
  String get noResults => 'Brak wyników';

  @override
  String get seerrAvailableStatus => 'Dostępny';

  @override
  String get seerrRequestedStatus => 'Wymagany';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Ustawienia Seera';

  @override
  String get requestMore => 'Poproś o więcej';

  @override
  String get request => 'Wniosek';

  @override
  String get cancelRequest => 'Anuluj żądanie';

  @override
  String get playInMoonfin => 'Zagraj w Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Zatwierdzić';

  @override
  String get declineAction => 'Spadek';

  @override
  String get similar => 'Podobny';

  @override
  String get recommendations => 'Zalecenia';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Trzymać';

  @override
  String get itemNotFoundInLibrary =>
      'Nie znaleziono elementu w Twojej bibliotece Moonfin';

  @override
  String get errorSearchingLibrary => 'Błąd wyszukiwania w bibliotece';

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
  String get submitRequest => 'Prześlij żądanie';

  @override
  String get allSeasons => 'Wszystkie sezony';

  @override
  String get advancedOptions => 'Opcje zaawansowane';

  @override
  String get noServiceServersConfigured =>
      'Nie skonfigurowano żadnych serwerów usług';

  @override
  String get server => 'Serwer';

  @override
  String get qualityProfile => 'Profil Jakości';

  @override
  String get rootFolder => 'Folder główny';

  @override
  String get showMore => 'Pokaż więcej';

  @override
  String get appearances => 'Występy';

  @override
  String get crewSection => 'Załoga';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Żadnych próśb';

  @override
  String get pendingStatus => 'Aż do';

  @override
  String get declinedStatus => 'Odrzucony';

  @override
  String get partiallyAvailable => 'Częściowo dostępne';

  @override
  String get downloadingStatus => 'Ściąganie';

  @override
  String get approvedStatus => 'Zatwierdzony';

  @override
  String get notRequestedStatus => 'Nie żądano';

  @override
  String get blocklistedStatus => 'Lista zablokowanych';

  @override
  String get deletedStatus => 'Usunięto';

  @override
  String get tmdbScore => 'Wynik TMDB';

  @override
  String get releaseDateLabel => 'Data wydania';

  @override
  String get firstAirDateLabel => 'Pierwsza data emisji';

  @override
  String get revenueLabel => 'Przychód';

  @override
  String get runtimeLabel => 'Czas wykonania';

  @override
  String get budgetLabel => 'Budżet';

  @override
  String get originalLanguageLabel => 'Język oryginalny';

  @override
  String get seasonsLabel => 'Pory roku';

  @override
  String get episodesLabel => 'Odcinki';

  @override
  String get access => 'Dostęp';

  @override
  String get add => 'Dodać';

  @override
  String get address => 'Adres';

  @override
  String get analytics => 'Analityka';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Treść';

  @override
  String get copy => 'Kopia';

  @override
  String get create => 'Tworzyć';

  @override
  String get disable => 'Wyłączyć';

  @override
  String get done => 'Zrobione';

  @override
  String get edit => 'Redagować';

  @override
  String get encoding => 'Kodowanie';

  @override
  String get error => 'Błąd';

  @override
  String get forward => 'Do przodu';

  @override
  String get general => 'Ogólny';

  @override
  String get go => 'Iść';

  @override
  String get install => 'Zainstalować';

  @override
  String get installed => 'Zainstalowany';

  @override
  String get interval => 'Interwał';

  @override
  String get name => 'Nazwa';

  @override
  String get networking => 'Sieć';

  @override
  String get next => 'Następny';

  @override
  String get path => 'Ścieżka';

  @override
  String get paused => 'Wstrzymano';

  @override
  String get permissions => 'Uprawnienia';

  @override
  String get processing => 'Przetwarzanie';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Dostawca';

  @override
  String get refresh => 'Odświeżać';

  @override
  String get remote => 'Zdalny';

  @override
  String get rename => 'Przemianować';

  @override
  String get revoke => 'Unieważnić';

  @override
  String get role => 'Rola';

  @override
  String get root => 'Źródło';

  @override
  String get run => 'Uruchomić';

  @override
  String get search => 'Szukaj';

  @override
  String get select => 'Wybierać';

  @override
  String get send => 'Wysłać';

  @override
  String get sessions => 'Sesje';

  @override
  String get set => 'Ustawić';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Zatrzymywać się';

  @override
  String get streaming => 'Transmisja strumieniowa';

  @override
  String get time => 'Czas';

  @override
  String get trickplay => 'Trik';

  @override
  String get uninstall => 'Odinstaluj';

  @override
  String get up => 'W górę';

  @override
  String get update => 'Aktualizacja';

  @override
  String get upload => 'Wgrywać';

  @override
  String get unmute => 'Wyłącz wyciszenie';

  @override
  String get mute => 'Niemy';

  @override
  String get branding => 'Marka';

  @override
  String get adminDrawerDashboard => 'Panel';

  @override
  String get adminDrawerAnalytics => 'Analityka';

  @override
  String get adminDrawerSettings => 'Ustawienia';

  @override
  String get adminDrawerBranding => 'Marka';

  @override
  String get adminDrawerUsers => 'Użytkownicy';

  @override
  String get adminDrawerLibraries => 'Biblioteki';

  @override
  String get adminDrawerTranscoding => 'Transkodowanie';

  @override
  String get adminDrawerResume => 'Wznawiać';

  @override
  String get adminDrawerStreaming => 'Transmisja strumieniowa';

  @override
  String get adminDrawerTrickplay => 'Trik';

  @override
  String get adminDrawerDevices => 'Urządzenia';

  @override
  String get adminDrawerActivity => 'Działalność';

  @override
  String get adminDrawerNetworking => 'Sieć';

  @override
  String get adminDrawerApiKeys => 'Klucze API';

  @override
  String get adminDrawerBackups => 'Kopie zapasowe';

  @override
  String get adminDrawerLogs => 'Dzienniki';

  @override
  String get adminDrawerScheduledTasks => 'Zaplanowane zadania';

  @override
  String get adminDrawerPlugins => 'Wtyczki';

  @override
  String get adminDrawerRepositories => 'Repozytoria';

  @override
  String get adminDrawerLiveTv => 'Telewizja na żywo';

  @override
  String get adminExitTooltip => 'Wyjdź z administratora';

  @override
  String get adminDashboardLoadFailed => 'Nie udało się załadować panelu';

  @override
  String get adminMediaOverview => 'Przegląd multimediów';

  @override
  String get adminMediaTotalsError =>
      'Nie można załadować sumy multimediów serwera.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Szybki odczyt ilości treści na tym serwerze.';

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
  String get analyticsMediaDistribution => 'Dystrybucja multimediów';

  @override
  String get analyticsVideoCodecs => 'Kodeki wideo';

  @override
  String get analyticsAudioCodecs => 'Kodeki audio';

  @override
  String get analyticsContainers => 'Kontenery';

  @override
  String get analyticsTopGenres => 'Najlepsze gatunki';

  @override
  String get analyticsReleaseYears => 'Lata wydania';

  @override
  String get analyticsContentRatings => 'Oceny treści';

  @override
  String get analyticsRuntimeBuckets => 'Zasobniki środowiska wykonawczego';

  @override
  String get analyticsFileFormats => 'Formaty plików';

  @override
  String get analyticsNoData => 'Brak dostępnych danych.';

  @override
  String get adminServerInfo => 'Informacje o serwerze';

  @override
  String get adminRestartPending => 'Uruchom ponownie w oczekiwaniu';

  @override
  String get adminServerPaths => 'Ścieżki serwerów';

  @override
  String get adminServerActions => 'Działania serwera';

  @override
  String get adminRestartServer => 'Uruchom ponownie serwer';

  @override
  String get adminShutdownServer => 'Wyłączenie serwera';

  @override
  String get adminScanLibraries => 'Skanuj biblioteki';

  @override
  String get adminLibraryScanStarted => 'Rozpoczęło się skanowanie biblioteki';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Trwa ponowne uruchamianie serwera';

  @override
  String get adminServerRebootMessage =>
      'Trwa ponowne uruchamianie serwera. Uruchom ponownie Moonfin';

  @override
  String get adminActiveSessions => 'Aktywne sesje';

  @override
  String get adminSessionsLoadFailed => 'Nie udało się załadować sesji';

  @override
  String get adminNoActiveSessions => 'Brak aktywnych sesji';

  @override
  String get adminRecentActivity => 'Ostatnia aktywność';

  @override
  String get adminNoRecentActivity => 'Brak ostatniej aktywności';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Wyślij wiadomość';

  @override
  String get adminMessageTextHint => 'Tekst wiadomości';

  @override
  String get adminSetVolume => 'Ustaw głośność';

  @override
  String get sessionPrev => 'Poprzednia';

  @override
  String get sessionRewind => 'Przewijać';

  @override
  String get sessionForward => 'Do przodu';

  @override
  String get sessionNext => 'Następny';

  @override
  String get sessionVolumeDown => 'Tom -';

  @override
  String get sessionVolumeUp => 'Tom +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Teraz odtwarzane';

  @override
  String get volume => 'Tom';

  @override
  String get actions => 'Działania';

  @override
  String get videoCodec => 'Kodek wideo';

  @override
  String get audioCodec => 'Kodek audio';

  @override
  String get hwAccel => 'Przyspieszenie sprzętowe';

  @override
  String get completion => 'Ukończenie';

  @override
  String get direct => 'Bezpośredni';

  @override
  String get adminDisconnect => 'Odłączyć';

  @override
  String get adminClearDates => 'Wyczyść daty';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Brak wpisów aktywności';

  @override
  String get adminEditDeviceName => 'Edytuj nazwę urządzenia';

  @override
  String get adminCustomName => 'Nazwa niestandardowa';

  @override
  String get adminDeviceNameUpdated =>
      'Nazwa urządzenia została zaktualizowana';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Usuń urządzenie';

  @override
  String get adminDeviceDeleted => 'Urządzenie usunięte';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Nie udało się załadować urządzeń';

  @override
  String get adminSearchDevices => 'Wyszukaj urządzenia';

  @override
  String get adminThisDevice => 'To urządzenie';

  @override
  String get adminEditName => 'Edytuj nazwę';

  @override
  String get adminLibrariesLoadFailed => 'Nie udało się załadować bibliotek';

  @override
  String get adminNoLibraries => 'Nie skonfigurowano żadnych bibliotek';

  @override
  String get adminScanAllLibraries => 'Przeskanuj wszystkie biblioteki';

  @override
  String get adminAddLibrary => 'Dodaj bibliotekę';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Zmień nazwę biblioteki';

  @override
  String get adminNewName => 'Nowa nazwa';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Usuń bibliotekę';

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
  String get adminRemovePath => 'Usuń ścieżkę';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opcje biblioteki zostały zapisane';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Nie udało się załadować biblioteki';

  @override
  String get adminNoMediaPaths => 'Nie skonfigurowano ścieżek multimediów';

  @override
  String get adminAddPath => 'Dodaj ścieżkę';

  @override
  String get adminBrowseFilesystem => 'Przeglądaj system plików serwera:';

  @override
  String get adminSaveOptions => 'Zapisz opcje';

  @override
  String get adminPreferredMetadataLanguage => 'Preferowany język metadanych';

  @override
  String get adminMetadataLanguageHint => 'np. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Kod kraju metadanych';

  @override
  String get adminMetadataCountryHint => 'np. USA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Nazwa biblioteki jest wymagana';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Nazwa biblioteki';

  @override
  String get adminSelectedPaths => 'Wybrane ścieżki:';

  @override
  String get adminNoPathsAdded =>
      'Nie dodano żadnych ścieżek (można dodać później)';

  @override
  String get adminCreateLibrary => 'Utwórz bibliotekę';

  @override
  String get paths => 'Ścieżki:';

  @override
  String get adminDisableUser => 'Wyłącz użytkownika';

  @override
  String get adminEnableUser => 'Włącz użytkownika';

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
  String get adminUsersLoadFailed => 'Nie udało się załadować użytkowników';

  @override
  String get adminSearchUsers => 'Wyszukaj użytkowników';

  @override
  String get adminEditUser => 'Edytuj użytkownika';

  @override
  String get adminAddUser => 'Dodaj użytkownika';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Utwórz użytkownika';

  @override
  String get adminPasswordOptional => 'Hasło (opcjonalnie)';

  @override
  String get adminUsernameRequired => 'Nazwa użytkownika nie może być pusta';

  @override
  String get adminNoProfileChanges => 'Brak zmian w profilu do zapisania';

  @override
  String get adminProfileSaved => 'Profil został zapisany';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Uprawnienia zostały zapisane';

  @override
  String get adminPasswordsMismatch => 'Hasła nie pasują';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Nie udało się załadować użytkownika';

  @override
  String get adminBackToUsers => 'Powrót do Użytkownicy';

  @override
  String get adminSaveProfile => 'Zapisz profil';

  @override
  String get adminDeleteUser => 'Usuń użytkownika';

  @override
  String get admin => 'Administrator';

  @override
  String get adminFullAccessWarning =>
      'Administratorzy mają pełny dostęp do serwera. Udzielaj z ostrożnością.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Ukryty użytkownik';

  @override
  String get adminAllowMediaPlayback => 'Zezwól na odtwarzanie multimediów';

  @override
  String get adminAllowAudioTranscoding => 'Zezwalaj na transkodowanie dźwięku';

  @override
  String get adminAllowVideoTranscoding => 'Zezwalaj na transkodowanie wideo';

  @override
  String get adminAllowRemuxing => 'Zezwalaj na remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Wymuś zdalne transkodowanie źródła';

  @override
  String get adminAllowContentDeletion => 'Zezwalaj na usuwanie treści';

  @override
  String get adminAllowContentDownloading =>
      'Zezwalaj na pobieranie zawartości';

  @override
  String get adminAllowPublicSharing => 'Zezwalaj na udostępnianie publiczne';

  @override
  String get adminAllowRemoteControl =>
      'Zezwalaj na zdalną kontrolę innych użytkowników';

  @override
  String get adminAllowSharedDeviceControl =>
      'Zezwól na kontrolę współdzielonego urządzenia';

  @override
  String get adminAllowRemoteAccess => 'Zezwól na dostęp zdalny';

  @override
  String get adminRemoteBitrateLimit =>
      'Limit szybkości transmisji klienta zdalnego (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Pozostaw puste bez ograniczeń';

  @override
  String get adminMaxActiveSessions => 'Maksymalna liczba aktywnych sesji';

  @override
  String get adminAllowLiveTvAccess => 'Zezwól na dostęp do telewizji na żywo';

  @override
  String get adminAllowLiveTvManagement =>
      'Zezwalaj na zarządzanie telewizją na żywo';

  @override
  String get adminAllowCollectionManagement =>
      'Zezwalaj na zarządzanie kolekcją';

  @override
  String get adminAllowSubtitleManagement => 'Zezwalaj na zarządzanie napisami';

  @override
  String get adminAllowLyricManagement => 'Zezwalaj na zarządzanie tekstami';

  @override
  String get adminSavePermissions => 'Zapisz uprawnienia';

  @override
  String get adminEnableAllLibraryAccess =>
      'Włącz dostęp do wszystkich bibliotek';

  @override
  String get adminSaveAccess => 'Zapisz dostęp';

  @override
  String get adminChangePassword => 'Zmień hasło';

  @override
  String get adminNewPassword => 'Nowe hasło';

  @override
  String get adminConfirmPassword => 'Potwierdź hasło';

  @override
  String get adminSetPassword => 'Ustaw hasło';

  @override
  String get adminResetPassword => 'Zresetuj hasło';

  @override
  String get adminPasswordReset => 'Resetowanie hasła';

  @override
  String get adminPasswordUpdated => 'Hasło zaktualizowane';

  @override
  String get adminUserSettings => 'Ustawienia użytkownika';

  @override
  String get adminLibraryAccess => 'Dostęp do biblioteki';

  @override
  String get adminDeviceAndChannelAccess => 'Dostęp do urządzenia i kanału';

  @override
  String get adminEnableAllDevices => 'Włącz dostęp do wszystkich urządzeń';

  @override
  String get adminEnableAllChannels => 'Włącz dostęp do wszystkich kanałów';

  @override
  String get adminResetPasswordWarning =>
      'Spowoduje to usunięcie hasła. Użytkownik będzie mógł zalogować się bez hasła.';

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
  String get adminCreateApiKey => 'Utwórz klucz API';

  @override
  String get adminAppName => 'Nazwa aplikacji';

  @override
  String get adminApiKeyCreated => 'Utworzono klucz API';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Klucz został pomyślnie utworzony. Serwer nie zwrócił tokena. Sprawdź klucze API serwera.';

  @override
  String get adminKeyCopied => 'Klucz skopiowany do schowka';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Brak tokena klucza w odpowiedzi serwera';

  @override
  String get adminRevokeApiKey => 'Unieważnij klucz API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Klucz API unieważniony';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Nie udało się załadować kluczy API';

  @override
  String get adminApiKeysTitle => 'Klucze API';

  @override
  String get adminCreateKey => 'Utwórz klucz';

  @override
  String get adminNoApiKeys => 'Nie znaleziono kluczy API';

  @override
  String get adminUnknownApp => 'Nieznana aplikacja';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Tworzenie kopii zapasowej...';

  @override
  String get adminBackupCreated => 'Kopia zapasowa została utworzona pomyślnie';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'W odpowiedzi serwera brakuje ścieżki kopii zapasowej';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Potwierdź Przywróć';

  @override
  String get adminRestoringBackup => 'Przywracam kopię zapasową...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Nie udało się załadować kopii zapasowych';

  @override
  String get adminCreateBackup => 'Utwórz kopię zapasową';

  @override
  String get adminNoBackups => 'Nie znaleziono kopii zapasowych';

  @override
  String get adminViewDetails => 'Zobacz szczegóły';

  @override
  String get restore => 'Przywrócić';

  @override
  String get adminLogsLoadFailed =>
      'Nie udało się załadować dzienników serwera';

  @override
  String get adminNoLogFiles => 'Nie znaleziono plików dziennika';

  @override
  String get adminLogCopied => 'Log skopiowany do schowka';

  @override
  String get adminSaveLogFile => 'Zapisz plik dziennika';

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
  String get adminSearchInLog => 'Szukaj w logu';

  @override
  String get adminNoMatchingLines => 'Brak pasujących linii';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nie znaleziono zaplanowanych zadań';

  @override
  String get adminNoTasksMatchFilter =>
      'Żadne zadania nie pasują do bieżącego filtra';

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
  String get adminRunNow => 'Uruchom teraz';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Ostatnia egzekucja';

  @override
  String get adminTriggers => 'Wyzwalacze';

  @override
  String get adminAddTrigger => 'Dodaj wyzwalacz';

  @override
  String get adminNoTriggers => 'Nie skonfigurowano żadnych wyzwalaczy';

  @override
  String get adminTriggerType => 'Typ wyzwalacza';

  @override
  String get adminTimeLimit => 'Limit czasu (opcjonalnie)';

  @override
  String get adminNoLimit => 'Bez limitu';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Dzień tygodnia';

  @override
  String get adminSearchPlugins => 'Wyszukaj wtyczki...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Odinstaluj wtyczkę';

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
      'Żadna wtyczka nie pasuje do Twojego wyszukiwania';

  @override
  String get adminNoPluginsInstalled => 'Brak zainstalowanych wtyczek';

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
      'Żaden pakiet nie pasuje do Twojego wyszukiwania';

  @override
  String get adminNoPackagesAvailable => 'Brak dostępnych pakietów';

  @override
  String get adminExperimentalIntegration => 'Integracja Eksperymentalna';

  @override
  String get adminExperimentalWarning =>
      'Integracja ustawień wtyczek jest wciąż w fazie eksperymentalnej. Niektóre strony ustawień mogą nie wyświetlać się poprawnie.';

  @override
  String get continueAction => 'Kontynuować';

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
      'Nie można otworzyć ustawień: brak tokena autoryzacji.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Nie znaleziono wtyczki';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Włącz wtyczkę';

  @override
  String get adminPluginSettingsPage => 'Strona ustawień wtyczki';

  @override
  String get adminRevisionHistory => 'Historia wersji';

  @override
  String get adminNoChangelog => 'Brak dostępnego dziennika zmian.';

  @override
  String get adminRemoveRepository => 'Usuń repozytorium';

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
  String get adminRepositoryNameHint => 'np. Stajnia Jellyfin';

  @override
  String get adminRepositoryUrl => 'Adres URL repozytorium';

  @override
  String get adminAddEntry => 'Dodaj wpis';

  @override
  String get adminInvalidUrl => 'Nieprawidłowy adres URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Otwórz w przeglądarce';

  @override
  String get adminOpenExternally => 'Otwórz na zewnątrz';

  @override
  String get adminGeneralSettings => 'Ustawienia ogólne';

  @override
  String get adminServerName => 'Nazwa serwera';

  @override
  String get adminPreferredMetadataCountry => 'Preferowany kraj metadanych';

  @override
  String get adminCachePath => 'Ścieżka pamięci podręcznej';

  @override
  String get adminMetadataPath => 'Ścieżka metadanych';

  @override
  String get adminLibraryScanConcurrency =>
      'Współbieżność skanowania biblioteki';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limit kodowania obrazu równoległego';

  @override
  String get adminSlowResponseThreshold => 'Próg powolnej reakcji (ms)';

  @override
  String get adminBrandingSaved => 'Ustawienia marki zostały zapisane';

  @override
  String get adminBrandingLoadFailed => 'Nie udało się wczytać ustawień marki';

  @override
  String get adminLoginDisclaimer => 'Zastrzeżenie dotyczące logowania';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML wyświetlany pod formularzem logowania';

  @override
  String get adminCustomCss => 'Niestandardowy CSS';

  @override
  String get adminCustomCssHint =>
      'Niestandardowy CSS zastosowany w interfejsie internetowym';

  @override
  String get adminEnableSplashScreen => 'Włącz ekran powitalny';

  @override
  String get adminStreamingSaved =>
      'Ustawienia przesyłania strumieniowego zostały zapisane';

  @override
  String get adminStreamingLoadFailed =>
      'Nie udało się wczytać ustawień przesyłania strumieniowego';

  @override
  String get adminStreamingDescription =>
      'Ustaw globalne limity szybkości transmisji strumieniowej dla połączeń zdalnych.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limit szybkości transmisji klienta zdalnego (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Pozostaw puste lub 0 oznaczające nieograniczoną liczbę';

  @override
  String get adminPlaybackSaved => 'Ustawienia odtwarzania zostały zapisane';

  @override
  String get adminPlaybackLoadFailed =>
      'Nie udało się załadować ustawień odtwarzania';

  @override
  String get adminPlaybackTranscoding => 'Odtwarzanie/transkodowanie';

  @override
  String get adminHardwareAcceleration => 'Przyspieszenie sprzętowe';

  @override
  String get adminVaapiDevice => 'Urządzenie VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Włącz kodowanie sprzętowe';

  @override
  String get adminEnableHardwareDecoding => 'Włącz dekodowanie sprzętowe dla:';

  @override
  String get adminEncodingThreads => 'Kodowanie wątków';

  @override
  String get adminAutomatic => '0 = automatyczne';

  @override
  String get adminTranscodingTempPath => 'Transkodowanie ścieżki tymczasowej';

  @override
  String get adminEnableFallbackFont => 'Włącz czcionkę zastępczą';

  @override
  String get adminFallbackFontPath => 'Ścieżka czcionki zastępczej';

  @override
  String get adminAllowSegmentDeletion => 'Zezwól na usunięcie segmentu';

  @override
  String get adminSegmentKeepSeconds => 'Zachowanie segmentu (sekundy)';

  @override
  String get adminThrottleBuffering => 'Buforowanie przepustnicy';

  @override
  String get adminTrickplaySaved => 'Ustawienia trików zostały zapisane';

  @override
  String get adminTrickplayLoadFailed =>
      'Nie udało się załadować ustawień trików';

  @override
  String get adminEnableHardwareAcceleration => 'Włącz akcelerację sprzętową';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Włącz wyodrębnianie tylko klatek kluczowych';

  @override
  String get adminKeyFrameSubtitle => 'Szybciej, ale z mniejszą dokładnością';

  @override
  String get adminScanBehavior => 'Zachowanie skanowania';

  @override
  String get adminProcessPriority => 'Priorytet procesu';

  @override
  String get adminImageSettings => 'Ustawienia obrazu';

  @override
  String get adminIntervalMs => 'Interwał (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Jak często przechwytywać klatki';

  @override
  String get adminWidthResolutions => 'Rozdzielczość szerokości';

  @override
  String get adminTileWidth => 'Szerokość płytki';

  @override
  String get adminTileHeight => 'Wysokość płytki';

  @override
  String get adminQualitySubtitle =>
      'Niższe wartości = lepsza jakość, większe pliki';

  @override
  String get adminProcessThreads => 'Wątki procesowe';

  @override
  String get adminResumeSaved => 'Wznów ustawienia zapisane';

  @override
  String get adminResumeLoadFailed => 'Nie udało się wczytać ustawień CV';

  @override
  String get adminResumeDescription =>
      'Skonfiguruj, kiedy zawartość powinna być oznaczana jako częściowo lub w pełni odtworzona.';

  @override
  String get adminMinResumePercentage => 'Minimalny procent wznowienia';

  @override
  String get adminMinResumeSubtitle =>
      'Aby zapisać postęp, zawartość musi zostać odtworzona powyżej tej wartości procentowej';

  @override
  String get adminMaxResumePercentage => 'Maksymalny procent wznowienia';

  @override
  String get adminMaxResumeSubtitle =>
      'Po przekroczeniu tej wartości procentowej zawartość uważa się za w pełni odtworzoną';

  @override
  String get adminMinResumeDuration => 'Minimalny czas wznowienia (sekundy)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Przedmiotów krótszych niż ten nie można wznowić';

  @override
  String get adminMinAudiobookResume =>
      'Minimalny procent wznowienia audiobooka';

  @override
  String get adminMaxAudiobookResume =>
      'Maksymalny procent wznowienia książki audio';

  @override
  String get adminNetworkingSaved =>
      'Ustawienia sieciowe zostały zapisane. Może być wymagane ponowne uruchomienie serwera.';

  @override
  String get adminNetworkingLoadFailed =>
      'Nie udało się załadować ustawień sieciowych';

  @override
  String get adminNetworkingWarning =>
      'Zmiany w ustawieniach sieciowych mogą wymagać ponownego uruchomienia serwera.';

  @override
  String get adminEnableRemoteAccess => 'Włącz dostęp zdalny';

  @override
  String get ports => 'Porty';

  @override
  String get adminHttpPort => 'Port HTTP';

  @override
  String get adminHttpsPort => 'Port HTTPS';

  @override
  String get adminPublicHttpsPort => 'Publiczny port HTTPS';

  @override
  String get adminBaseUrl => 'Bazowy adres URL';

  @override
  String get adminBaseUrlHint => 'np. /galaretowata';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Włącz HTTPS';

  @override
  String get adminLocalNetwork => 'Sieć lokalna';

  @override
  String get adminLocalNetworkAddresses => 'Adresy sieci lokalnej';

  @override
  String get adminKnownProxies => 'Znane proxy';

  @override
  String get adminRemoteIpFilter => 'Zdalny filtr IP';

  @override
  String get adminRemoteIpFilterEntries => 'Zdalny filtr IP';

  @override
  String get adminCertificatePath => 'Ścieżka certyfikatu';

  @override
  String get whitelist => 'Biała lista';

  @override
  String get blacklist => 'Czarna lista';

  @override
  String get notSet => 'Nie ustawiono';

  @override
  String get adminMetadataSaved => 'Metadane zostały zapisane';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Odśwież metadane';

  @override
  String get recursive => 'Rekurencyjne';

  @override
  String get adminReplaceAllMetadata => 'Zamień wszystkie metadane';

  @override
  String get adminReplaceAllImages => 'Zamień wszystkie obrazy';

  @override
  String get adminMetadataRefreshRequested => 'Zażądano odświeżenia metadanych';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Wyszukaj osobę zdalną';

  @override
  String get adminNoRemoteMatches => 'Nie znaleziono zdalnych dopasowań';

  @override
  String get adminRemoteResults => 'Wyniki zdalne';

  @override
  String get adminRemoteMetadataApplied => 'Zastosowano zdalne metadane';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Zaktualizuj typ zawartości';

  @override
  String get adminContentType => 'Typ treści';

  @override
  String get adminContentTypeUpdated => 'Zaktualizowano typ zawartości';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nie udało się załadować edytora metadanych';

  @override
  String get adminNoPeopleEntries => 'Brak wpisów osób';

  @override
  String get adminNoExternalIds =>
      'Brak dostępnych identyfikatorów zewnętrznych';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nieobsługiwany format obrazu';

  @override
  String get adminImageReadFailed => 'Nie udało się odczytać wybranego obrazu';

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
  String get adminAllProviders => 'Wszyscy dostawcy';

  @override
  String get adminNoRemoteImages => 'Nie znaleziono zdalnych obrazów';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Dodaj tuner';

  @override
  String get adminTunerType => 'Typ tunera';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, inne';

  @override
  String get adminUrlPath => 'Adres URL / ścieżka';

  @override
  String get adminNameOptional => 'Imię (opcjonalnie)';

  @override
  String get adminTunerAdded => 'Dodano tunera';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Dodaj dostawcę przewodników';

  @override
  String get adminProviderType => 'Typ dostawcy';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect lub XMLTV';

  @override
  String get adminUsernameOptional => 'Nazwa użytkownika (opcjonalnie)';

  @override
  String get adminRefreshInterval => 'Interwał odświeżania (godziny)';

  @override
  String get adminProviderAdded => 'Dodano dostawcę';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Zażądano resetu tunera';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Ustawienia nagrywania';

  @override
  String get adminPrePadding => 'Wstępne wypełnienie (minuty)';

  @override
  String get adminPostPadding => 'Po dopełnieniu (minuty)';

  @override
  String get adminRecordingPath => 'Ścieżka nagrywania';

  @override
  String get adminSeriesRecordingPath => 'Ścieżka nagrywania serii';

  @override
  String get adminRecordingSettingsSaved =>
      'Ustawienia nagrywania zostały zapisane';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Ustaw mapowania kanałów';

  @override
  String get adminMappingJson => 'Mapowanie JSON-a';

  @override
  String get adminMappingJsonHint => 'Przykład: mapowanie ładunku JSON';

  @override
  String get adminChannelMappingsUpdated => 'Zaktualizowano mapowania kanałów';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nie udało się załadować administracji Live TV';

  @override
  String get adminTunerDevices => 'Urządzenia tunera';

  @override
  String get adminNoTunerHosts => 'Nie skonfigurowano hostów tunera';

  @override
  String get adminGuideProviders => 'Dostawcy przewodników';

  @override
  String get adminAddProvider => 'Dodaj dostawcę';

  @override
  String get adminNoListingProviders =>
      'Nie skonfigurowano żadnych dostawców list';

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
  String get adminTunerDiscovery => 'Odkrycie tunera';

  @override
  String get adminChannelMappings => 'Mapowania kanałów';

  @override
  String get adminNoDiscoveredTuners => 'Nie odkryto jeszcze tunerów';

  @override
  String get adminSettingsSaved => 'Ustawienia zostały zapisane';

  @override
  String get adminBackupsNotAvailable =>
      'Kopie zapasowe nie są dostępne w tej wersji serwera.';

  @override
  String get adminRestoreWarning1 =>
      'Przywrócenie spowoduje zastąpienie WSZYSTKICH bieżących danych serwera danymi z kopii zapasowej.';

  @override
  String get adminRestoreWarning2 =>
      'Bieżące ustawienia serwera, użytkownicy i dane biblioteki zostaną nadpisane.';

  @override
  String get adminRestoreWarning3 =>
      'Serwer uruchomi się ponownie po przywróceniu.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Zażądano przywrócenia. Ponowne uruchomienie serwera może rozłączyć tę sesję.';

  @override
  String get adminBackupsTitle => 'Kopie zapasowe';

  @override
  String get adminUnknownDate => 'Nieznana data';

  @override
  String get adminUnnamedBackup => 'Nienazwana kopia zapasowa';

  @override
  String get adminLiveTvNotAvailable =>
      'Administracja telewizją na żywo nie jest dostępna na tej wersji serwera.';

  @override
  String get adminLiveTvTitle => 'Administracja telewizji na żywo';

  @override
  String get adminApply => 'Stosować';

  @override
  String get adminNotSet => 'Nie ustawiono';

  @override
  String get adminReset => 'Nastawić';

  @override
  String get adminLogsTitle => 'Dzienniki serwera';

  @override
  String get adminLogsNewestFirst => 'Najpierw najnowsze';

  @override
  String get adminLogsOldestFirst => 'Najpierw najstarszy';

  @override
  String get adminLogsJustNow => 'Właśnie';

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
  String get adminLogViewerNoMatches => 'Brak pasujących linii';

  @override
  String get adminMetadataEditorTitle => 'Edytor metadanych';

  @override
  String get adminMetadataRemote => 'Zdalny';

  @override
  String get adminMetadataType => 'Typ';

  @override
  String get adminMetadataDetails => 'Bliższe dane';

  @override
  String get adminMetadataExternalIds => 'Identyfikatory zewnętrzne';

  @override
  String get adminMetadataImages => 'Obrazy';

  @override
  String get adminMetadataFieldTitle => 'Tytuł';

  @override
  String get adminMetadataFieldSortTitle => 'Sortuj tytuł';

  @override
  String get adminMetadataFieldOriginalTitle => 'Tytuł oryginalny';

  @override
  String get adminMetadataFieldPremiereDate => 'Data premiery (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data zakończenia (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Rok produkcji';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficjalna ocena';

  @override
  String get adminMetadataFieldCommunityRating => 'Ocena społeczności';

  @override
  String get adminMetadataFieldCriticRating => 'Ocena krytyczna';

  @override
  String get adminMetadataFieldTagline => 'Hasło';

  @override
  String get adminMetadataFieldOverview => 'Przegląd';

  @override
  String get adminMetadataGenres => 'Gatunki';

  @override
  String get adminMetadataTags => 'Tagi';

  @override
  String get adminMetadataStudios => 'Studia';

  @override
  String get adminMetadataPeople => 'Ludzie';

  @override
  String get adminMetadataAddGenre => 'Dodaj gatunek';

  @override
  String get adminMetadataAddTag => 'Dodaj tag';

  @override
  String get adminMetadataAddStudio => 'Dodaj studio';

  @override
  String get adminMetadataAddPerson => 'Dodaj osobę';

  @override
  String get adminMetadataEditPerson => 'Edytuj osobę';

  @override
  String get adminMetadataRole => 'Rola';

  @override
  String get adminMetadataImagePrimary => 'Podstawowy';

  @override
  String get adminMetadataImageBackdrop => 'Zasłona';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Transparent';

  @override
  String get adminMetadataImageThumb => 'Kciuk';

  @override
  String get adminMetadataRecursive => 'Rekurencyjne';

  @override
  String get adminMetadataProvider => 'Dostawca';

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
      'Nie udało się odczytać wybranego obrazu';

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
      'Spowoduje to usunięcie bieżącego obrazu z elementu.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Wgrywać';

  @override
  String get adminMetadataUpdate => 'Aktualizacja';

  @override
  String get adminMetadataRemoteImage => 'Odległy obraz';

  @override
  String get adminPluginsInstalled => 'Zainstalowany';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktywny';

  @override
  String get adminPluginsRestart => 'Uruchom ponownie';

  @override
  String get adminPluginsNoSearchResults =>
      'Żadna wtyczka nie pasuje do Twojego wyszukiwania';

  @override
  String get adminPluginsNoneInstalled => 'Brak zainstalowanych wtyczek';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Dostępna aktualizacja';

  @override
  String get adminPluginsPendingRemoval =>
      'Oczekuje na usunięcie po ponownym uruchomieniu';

  @override
  String get adminPluginsChangesPending =>
      'Zmiany oczekujące na ponowne uruchomienie';

  @override
  String get adminPluginsEnable => 'Włączać';

  @override
  String get adminPluginsDisable => 'Wyłączyć';

  @override
  String get adminPluginsInstallUpdate => 'Zainstaluj aktualizację';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Żaden pakiet nie pasuje do Twojego wyszukiwania';

  @override
  String get adminPluginsCatalogEmpty => 'Brak dostępnych pakietów';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integracja Eksperymentalna';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integracja ustawień wtyczek jest wciąż w fazie eksperymentalnej. Niektóre pola lub układy mogą jeszcze nie renderować się poprawnie.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nie udało się przełączyć wtyczki. Serwer nie mógł znaleźć tej wersji wtyczki. Spróbuj odświeżyć wtyczki, a następnie spróbuj ponownie.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nie udało się przełączyć wtyczki. Aby uzyskać szczegółowe informacje, sprawdź logi serwera.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Bliższe dane';

  @override
  String get adminPluginDetailDeveloper => 'Wywoływacz';

  @override
  String get adminPluginDetailRepository => 'Magazyn';

  @override
  String get adminPluginDetailBundled => 'W zestawie';

  @override
  String get adminPluginDetailEnablePlugin => 'Włącz wtyczkę';

  @override
  String get adminPluginDetailRestartRequired =>
      'Aby zmiany zaczęły obowiązywać, wymagane jest ponowne uruchomienie serwera.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Ta wtyczka zostanie usunięta po ponownym uruchomieniu serwera.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Ta wtyczka uległa uszkodzeniu i może nie działać poprawnie.';

  @override
  String get adminPluginDetailNotSupported =>
      'Ta wtyczka nie jest obsługiwana przez obecną wersję serwera.';

  @override
  String get adminPluginDetailSuperseded =>
      'Wtyczka ta została zastąpiona nowszą wersją.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Usuń repozytorium';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Usunąć';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Nie skonfigurowano żadnych repozytoriów';

  @override
  String get adminReposEmptySubtitle =>
      'Dodaj repozytorium, aby przeglądać dostępne wtyczki';

  @override
  String get adminReposUnnamed => '(anonimowy)';

  @override
  String get adminReposEditTitle => 'Edytuj repozytorium';

  @override
  String get adminReposAddTitle => 'Dodaj repozytorium';

  @override
  String get adminReposUrl => 'Adres URL repozytorium';

  @override
  String get adminReposNameHint => 'np. Stajnia Jellyfin';

  @override
  String get adminPluginSettingsInvalidUrl => 'Nieprawidłowy adres URL';

  @override
  String get adminGeneralSettingsTitle => 'Ustawienia ogólne';

  @override
  String get adminGeneralMetadataLanguage => 'Preferowany język metadanych';

  @override
  String get adminGeneralMetadataLanguageHint => 'np. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Preferowany kraj metadanych';

  @override
  String get adminGeneralMetadataCountryHint => 'np. USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Współbieżność skanowania biblioteki';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limit kodowania obrazu równoległego';

  @override
  String get adminUnknownError => 'Nieznany błąd';

  @override
  String get adminBrowse => 'Przeglądać';

  @override
  String get adminCloseBrowser => 'Zamknij przeglądarkę';

  @override
  String get adminNetworkingTitle => 'Sieć';

  @override
  String get adminNetworkingRestartWarning =>
      'Zmiany w ustawieniach sieciowych mogą wymagać ponownego uruchomienia serwera.';

  @override
  String get adminNetworkingRemoteAccess => 'Włącz dostęp zdalny';

  @override
  String get adminNetworkingPorts => 'Porty';

  @override
  String get adminNetworkingHttpPort => 'Port HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Port HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Włącz HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Sieć lokalna';

  @override
  String get adminNetworkingLocalAddresses => 'Adresy sieci lokalnej';

  @override
  String get adminNetworkingAddressHint => 'np. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Znane proxy';

  @override
  String get adminNetworkingProxyHint => 'np. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Biała lista';

  @override
  String get adminNetworkingBlacklist => 'Czarna lista';

  @override
  String get adminNetworkingAddEntry => 'Dodaj wpis';

  @override
  String get adminBrandingTitle => 'Marka';

  @override
  String get adminBrandingLoginDisclaimer => 'Zastrzeżenie dotyczące logowania';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML wyświetlany pod formularzem logowania';

  @override
  String get adminBrandingCustomCss => 'Niestandardowy CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Niestandardowy CSS zastosowany w interfejsie internetowym';

  @override
  String get adminBrandingEnableSplash => 'Włącz ekran powitalny';

  @override
  String get adminPlaybackHwAccel => 'Przyspieszenie sprzętowe';

  @override
  String get adminPlaybackHwAccelLabel => 'Przyspieszenie sprzętowe';

  @override
  String get adminPlaybackEnableHwEncoding => 'Włącz kodowanie sprzętowe';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Włącz dekodowanie sprzętowe dla:';

  @override
  String get adminPlaybackEncoding => 'Kodowanie';

  @override
  String get adminPlaybackEncodingThreads => 'Kodowanie wątków';

  @override
  String get adminPlaybackFallbackFont => 'Włącz czcionkę zastępczą';

  @override
  String get adminPlaybackFallbackFontPath => 'Ścieżka czcionki zastępczej';

  @override
  String get adminPlaybackStreaming => 'Transmisja strumieniowa';

  @override
  String get adminResumeVideo => 'Wideo';

  @override
  String get adminResumeAudiobooks => 'Audiobooki';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimalny procent wznowienia audiobooka';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maksymalny procent wznowienia książki audio';

  @override
  String get adminStreamingBitrateLimit =>
      'Limit szybkości transmisji klienta zdalnego (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Pozostaw puste lub 0 oznaczające nieograniczoną liczbę';

  @override
  String get adminTrickplayHwAccel => 'Włącz akcelerację sprzętową';

  @override
  String get adminTrickplayHwEncoding => 'Włącz kodowanie sprzętowe';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Włącz wyodrębnianie tylko klatek kluczowych';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Szybciej, ale z mniejszą dokładnością';

  @override
  String get adminTrickplayNonBlocking => 'Nieblokujący';

  @override
  String get adminTrickplayBlocking => 'Bloking';

  @override
  String get adminTrickplayPriorityHigh => 'Wysoki';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Powyżej Normalności';

  @override
  String get adminTrickplayPriorityNormal => 'Normalna';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Poniżej Normalny';

  @override
  String get adminTrickplayPriorityIdle => 'Bezczynny';

  @override
  String get adminTrickplayImageSettings => 'Ustawienia obrazu';

  @override
  String get adminTrickplayInterval => 'Interwał (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Jak często przechwytywać klatki';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Szerokość pikseli oddzielonych przecinkami (np. 320)';

  @override
  String get adminTrickplayQuality => 'Jakość';

  @override
  String get adminTrickplayQScale => 'Skala jakości';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Niższe wartości = lepsza jakość, większe pliki';

  @override
  String get adminTrickplayJpegQuality => 'Jakość JPEG';

  @override
  String get adminTrickplayProcessing => 'Przetwarzanie';

  @override
  String get adminTasksEmpty => 'Nie znaleziono zaplanowanych zadań';

  @override
  String get adminTasksNoFilterMatch =>
      'Żadne zadania nie pasują do bieżącego filtra';

  @override
  String get adminTaskCancelling => 'Anulowanie...';

  @override
  String get adminTaskRunning => 'Działanie...';

  @override
  String get adminTaskNeverRun => 'Nigdy nie biegaj';

  @override
  String get adminTaskStop => 'Zatrzymywać się';

  @override
  String get adminTaskRun => 'Uruchomić';

  @override
  String get adminTaskDetailLastExecution => 'Ostatnia egzekucja';

  @override
  String get adminTaskDetailStarted => 'Rozpoczęło się';

  @override
  String get adminTaskDetailEnded => 'Zakończone';

  @override
  String get adminTaskDetailDuration => 'Czas trwania';

  @override
  String get adminTaskDetailErrorLabel => 'Błąd:';

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
  String get adminTaskTriggerStartup => 'Podczas uruchamiania aplikacji';

  @override
  String get adminTaskTriggerTypeDaily => 'Codziennie';

  @override
  String get adminTaskTriggerTypeWeekly => 'Tygodnik';

  @override
  String get adminTaskTriggerTypeInterval => 'W przerwie';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interwał';

  @override
  String get adminTaskTriggerEveryHour => 'Co godzinę';

  @override
  String get adminTaskTriggerEvery6Hours => 'Co 6 godzin';

  @override
  String get adminTaskTriggerEvery12Hours => 'Co 12 godzin';

  @override
  String get adminTaskTriggerEvery24Hours => 'Co 24 godziny';

  @override
  String get adminTaskTriggerEvery2Days => 'Co 2 dni';

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
  String get adminTaskTriggerTime => 'Czas';

  @override
  String get adminTaskTriggerNoLimit => 'Bez limitu';

  @override
  String get adminActivityJustNow => 'Właśnie';

  @override
  String get adminActivityLastHour => 'Ostatnia godzina';

  @override
  String get adminActivityToday => 'Dzisiaj';

  @override
  String get adminActivityYesterday => 'Wczoraj';

  @override
  String get adminActivityOlder => 'Starszy';

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
  String get adminActivityNow => 'Teraz';

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
      'Skonfiguruj generowanie obrazu w trybie trików w celu wyszukiwania miniatur podglądu.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Publiczny port HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Bazowy adres URL';

  @override
  String get adminNetworkingBaseUrlHint => 'np. /galaretowata';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Ścieżka certyfikatu';

  @override
  String get adminNetworkingRemoteIpFilter => 'Zdalny filtr IP';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Zdalny filtr IP';

  @override
  String get adminPlaybackVaapiDevice => 'Urządzenie VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automatyczne';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Transkodowanie ścieżki tymczasowej';

  @override
  String get adminPlaybackSegmentDeletion => 'Zezwól na usunięcie segmentu';

  @override
  String get adminPlaybackSegmentKeep => 'Zachowanie segmentu (sekundy)';

  @override
  String get adminPlaybackThrottleBuffering => 'Buforowanie przepustnicy';

  @override
  String get adminResumeMinPct => 'Minimalny procent wznowienia';

  @override
  String get adminResumeMinPctSubtitle =>
      'Aby zapisać postęp, zawartość musi zostać odtworzona powyżej tej wartości procentowej';

  @override
  String get adminResumeMaxPct => 'Maksymalny procent wznowienia';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Po przekroczeniu tej wartości procentowej zawartość uważa się za w pełni odtworzoną';

  @override
  String get adminResumeMinDuration => 'Minimalny czas wznowienia (sekundy)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Przedmiotów krótszych niż ten nie można wznowić';

  @override
  String get adminTrickplayScanBehavior => 'Zachowanie skanowania';

  @override
  String get adminTrickplayProcessPriority => 'Priorytet procesu';

  @override
  String get adminTrickplayTileWidth => 'Szerokość płytki';

  @override
  String get adminTrickplayTileHeight => 'Wysokość płytki';

  @override
  String get adminTrickplayProcessThreads => 'Wątki procesowe';

  @override
  String get adminTrickplayWidthResolutions => 'Rozdzielczość szerokości';

  @override
  String get adminMetadataDefault => 'Domyślny';

  @override
  String get adminMetadataContentTypeUpdated => 'Zaktualizowano typ zawartości';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Próg powolnej reakcji (ms)';

  @override
  String get adminGeneralCachePath => 'Ścieżka pamięci podręcznej';

  @override
  String get adminGeneralMetadataPath => 'Ścieżka metadanych';

  @override
  String get adminGeneralServerName => 'Nazwa serwera';

  @override
  String get adminSettingsLoadFailed => 'Nie udało się załadować ustawień';

  @override
  String get adminDiscover => 'Odkryć';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Lornetka składana';

  @override
  String get libraries => 'Biblioteki';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay wyłączony';

  @override
  String get syncPlayDisabledMessage =>
      'Włącz SyncPlay w Ustawieniach, aby korzystać z zsynchronizowanego odtwarzania.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serwer nieobsługiwany';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay wymaga serwera Jellyfin. Obecny serwer tego nie obsługuje.';

  @override
  String get syncPlayGroupFallbackName => 'Grupa SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Grupa SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ignoruj ​​czekanie';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nie wstrzymuj grupy podczas buforowania urządzenia';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Kontynuuj lokalnie, nie czekając na wolnych członków';

  @override
  String get syncPlayRepeat => 'Powtarzać';

  @override
  String get syncPlayRepeatOne => 'Jeden';

  @override
  String get syncPlayShuffleModeShuffled => 'Pomieszane';

  @override
  String get syncPlayShuffleModeSorted => 'Posortowane';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Synchronizuj bieżącą kolejkę odtwarzania';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Zastąp kolejkę grupową tym, co jest odtwarzane lokalnie';

  @override
  String get syncPlayLeaveGroup => 'Opuść grupę';

  @override
  String get syncPlayGroupQueue => 'Kolejka grupowa';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Zagraj teraz';

  @override
  String get syncPlayCreateNewGroup => 'Utwórz nową grupę';

  @override
  String get syncPlayGroupName => 'Nazwa grupy';

  @override
  String get syncPlayDefaultGroupName => 'Moja grupa SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Utwórz grupę';

  @override
  String get syncPlayAvailableGroups => 'Dostępne grupy';

  @override
  String get syncPlayNoGroupsAvailable => 'Brak dostępnych grup';

  @override
  String get syncPlayJoinGroupQuestion => 'Dołącz do grupy SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Dołączenie do grupy SyncPlay może zastąpić bieżącą kolejkę odtwarzania. Kontynuować?';

  @override
  String get syncPlayJoin => 'Dołączyć';

  @override
  String get syncPlayStateIdle => 'Bezczynny';

  @override
  String get syncPlayStateWaiting => 'Czekanie';

  @override
  String get syncPlayStatePaused => 'Wstrzymano';

  @override
  String get syncPlayStatePlaying => 'Gra';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Odmowa dostępu do SyncPlay';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nie masz dostępu do jednego lub więcej elementów w tej grupie SyncPlay. Poproś właściciela grupy o zweryfikowanie uprawnień biblioteki lub wybranie innej kolejki.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Wyszukiwanie głosowe jest niedostępne.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Odtwarzanie bezpośrednie Dolby Vision nie powiodło się';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nie udało się rozpocząć bezpośredniego odtwarzania tego strumienia Dolby Vision. Ponowić próbę użycia transkodowania serwera?';

  @override
  String get retryWithTranscode => 'Spróbuj ponownie z transkodowaniem';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision nie jest obsługiwany';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'To urządzenie nie może bezpośrednio dekodować treści Dolby Vision. Użyj zastępczego HDR10 lub poproś o transkodowanie serwera.';

  @override
  String get rememberMyChoice => 'Zapamiętaj mój wybór';

  @override
  String get playHdr10Fallback => 'Odtwórz awaryjną wersję HDR10';

  @override
  String get requestTranscode => 'Poproś o transkodowanie';

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
  String get seeAll => 'Zobacz wszystko';

  @override
  String get noItems => 'Brak przedmiotów';

  @override
  String get switchUser => 'Zmień użytkownika';

  @override
  String get remoteControl => 'Zdalne sterowanie';

  @override
  String get mediaBarLoading => 'Ładowanie paska multimediów...';

  @override
  String get mediaBarError => 'Nie udało się załadować paska multimediów';

  @override
  String get offlineServerUnavailable =>
      'Połączono z Internetem, ale bieżący serwer jest niedostępny.';

  @override
  String get offlineNoInternet =>
      'Jesteś offline. Dostępna jest tylko pobrana zawartość.';

  @override
  String get offlineFileNotAvailable => 'Plik niedostępny';

  @override
  String get offlineSwitchServer => 'Przełącz serwer';

  @override
  String get offlineSavedMedia => 'Zapisane multimedia';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Zdalne odtwarzanie';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Głośność urządzenia';

  @override
  String get castVolumeUnavailable => 'Nie płynny';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Napisy na filmie obcojęzycznym';

  @override
  String get pinConfirmTitle => 'Potwierdź PIN';

  @override
  String get pinSetTitle => 'Ustaw PIN';

  @override
  String get pinEnterTitle => 'Wprowadź PIN';

  @override
  String get pinReenterToConfirm =>
      'Wprowadź ponownie kod PIN, aby potwierdzić';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Nieprawidłowy PIN';

  @override
  String get pinMismatch => 'PIN-y nie pasują';

  @override
  String get pinForgot => 'Zapomniałeś kodu PIN?';

  @override
  String get pinClear => 'Jasne';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Zatwierdzono żądanie szybkiego połączenia.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kod szybkiego połączenia jest nieprawidłowy lub wygasł.';

  @override
  String get quickConnectNotSupported =>
      'Funkcja szybkiego połączenia nie jest obsługiwana na tym serwerze.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Autoryzacja kodu Quick Connect nie powiodła się.';

  @override
  String get quickConnectDisabled =>
      'Szybkie połączenie jest wyłączone na tym serwerze.';

  @override
  String get quickConnectForbidden =>
      'Twoje konto nie może autoryzować tego żądania szybkiego połączenia.';

  @override
  String get quickConnectNotFound =>
      'Nie znaleziono kodu szybkiego połączenia. Wypróbuj nowy kod.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Wpisz kod';

  @override
  String get quickConnectAuthorize => 'Autoryzować';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Zdalne sterowanie';

  @override
  String get remoteFailedToLoadSessions => 'Nie udało się załadować sesji';

  @override
  String get remoteNoSessions => 'Brak kontrolowanych sesji';

  @override
  String get remoteStartPlayback =>
      'Rozpocznij odtwarzanie na innym urządzeniu';

  @override
  String get unknownUser => 'Nieznany';

  @override
  String get unknownItem => 'Nieznany';

  @override
  String get remoteNothingPlaying => 'Nic nie jest odtwarzane w tej sesji';

  @override
  String get castingStarted =>
      'Rozpoczęło się przesyłanie na wybranym urządzeniu';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Brak dostępnych urządzeń do zdalnego odtwarzania.';

  @override
  String get noRemoteDevicesIos =>
      'Brak dostępnych urządzeń do zdalnego odtwarzania.\n\nW systemie iOS cele AirPlay mogą być niedostępne w symulatorze.';

  @override
  String get trackActionPlayNext => 'Graj dalej';

  @override
  String get trackActionAddToQueue => 'Dodaj do kolejki';

  @override
  String get trackActionAddToPlaylist => 'Dodaj do listy odtwarzania';

  @override
  String get trackActionCancelDownload => 'Anuluj pobieranie';

  @override
  String get trackActionDeleteFromPlaylist => 'Usuń z listy odtwarzania';

  @override
  String get trackActionMoveUp => 'Podnieść';

  @override
  String get trackActionMoveDown => 'Opuszczać';

  @override
  String get trackActionRemoveFromFavorites => 'Usuń z ulubionych';

  @override
  String get trackActionAddToFavorites => 'Dodaj do ulubionych';

  @override
  String get trackActionGoToAlbum => 'Przejdź do albumu';

  @override
  String get trackActionGoToArtist => 'Przejdź do Artysty';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Usunięto pobrany plik';

  @override
  String get trackActionDeleteFileFailed => 'Nie można usunąć pobranego pliku';

  @override
  String get shuffleBy => 'Przetasuj według';

  @override
  String get shuffleSelectLibrary => 'Wybierz opcję Biblioteka';

  @override
  String get shuffleSelectGenre => 'Wybierz gatunek';

  @override
  String get shuffleLibrary => 'Biblioteka';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Brak dostępnych kompatybilnych bibliotek.';

  @override
  String get shuffleNoGenres =>
      'Nie znaleziono gatunków dla tego trybu losowego.';

  @override
  String get posterDisplayTitle => 'Wyświetlacz';

  @override
  String get posterImageType => 'Typ obrazu';

  @override
  String get imageTypePoster => 'Plakat';

  @override
  String get imageTypeThumbnail => 'Zwięzły';

  @override
  String get imageTypeBanner => 'Transparent';

  @override
  String get playlistAddFailed => 'Nie udało się dodać do playlisty';

  @override
  String get playlistCreateFailed => 'Nie udało się utworzyć playlisty';

  @override
  String get playlistNew => 'Nowa playlista';

  @override
  String get playlistCreate => 'Tworzyć';

  @override
  String get playlistCreateNew => 'Utwórz nową listę odtwarzania';

  @override
  String get playlistNoneFound => 'Nie znaleziono playlist';

  @override
  String get addToPlaylist => 'Dodaj do listy odtwarzania';

  @override
  String get lyricsNotAvailable => 'Brak dostępnych tekstów';

  @override
  String get upNext => 'Dalej';

  @override
  String get playNext => 'Graj dalej';

  @override
  String get stillWatchingContent =>
      'Odtwarzanie zostało wstrzymane. Czy nadal oglądasz?';

  @override
  String get stillWatchingStop => 'Zatrzymywać się';

  @override
  String get stillWatchingContinue => 'Kontynuować';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Telewizja na żywo';

  @override
  String get continueWatchingAndNextUp => 'Kontynuuj oglądanie i następny';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Następny odcinek';

  @override
  String get moreFromThisSeason => 'Więcej z tego sezonu';

  @override
  String get playerTooltipPlaybackSpeed => 'Szybkość odtwarzania';

  @override
  String get playerTooltipCastControls => 'Sterowanie przesyłaniem';

  @override
  String get playerTooltipPlaybackQuality => 'Szybkość transmisji';

  @override
  String get playerTooltipEnterFullscreen => 'Wejdź na pełny ekran';

  @override
  String get playerTooltipExitFullscreen => 'Wyjdź z pełnego ekranu';

  @override
  String get playerTooltipFloatOnTop => 'Unosić się na górze';

  @override
  String get playerTooltipExitFloatOnTop => 'Wyłącz opcję pływającą na górze';

  @override
  String get playerTooltipLockLandscape => 'Blokada krajobrazu';

  @override
  String get playerTooltipUnlockOrientation => 'Zezwalaj na obrót';

  @override
  String get playerTooltipPrevious => 'Poprzedni';

  @override
  String get playerTooltipSeekBack => 'Szukaj z powrotem';

  @override
  String get playerTooltipSeekForward => 'Szukaj do przodu';

  @override
  String get contextMenuMarkWatched => 'Oznacz jako obejrzane';

  @override
  String get contextMenuMarkUnwatched => 'Oznacz jako nieobejrzane';

  @override
  String get contextMenuAddToFavorites => 'Dodaj do ulubionych';

  @override
  String get contextMenuRemoveFromFavorites => 'Usuń z ulubionych';

  @override
  String get contextMenuGoToSeries => 'Przejdź do serii';

  @override
  String get settingsAdministrationSubtitle =>
      'Uzyskaj dostęp do panelu administracyjnego serwera';

  @override
  String get settingsAccountSecurity => 'Konto i bezpieczeństwo';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Uwierzytelnianie, kod PIN i kontrola rodzicielska';

  @override
  String get settingsPersonalization => 'Personalizacja';

  @override
  String get settingsPersonalizationSubtitle =>
      'Widoczność motywu, nawigacji, wierszy głównych i biblioteki';

  @override
  String get settingsDynamicContent => 'Treść dynamiczna';

  @override
  String get settingsDynamicContentSubtitle =>
      'Pasek multimediów i nakładki wizualne';

  @override
  String get settingsPlaybackSyncplay => 'Odtwarzanie i SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Ustawienia audio/wideo, napisy, pliki do pobrania i elementy sterujące SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Synchronizacja wtyczek, Seerr, oceny i nie tylko';

  @override
  String get settingsAboutSubtitle =>
      'Wersja aplikacji, informacje prawne i autorzy';

  @override
  String get settingsAuthenticationSection => 'UWIERZYTELNIANIE';

  @override
  String get settingsSortServersBy => 'Sortuj serwery według';

  @override
  String get settingsLastUsed => 'Ostatnio używany';

  @override
  String get settingsAlphabetical => 'Alfabetyczny';

  @override
  String get settingsPrivacyAndSafetySection => 'PRYWATNOŚĆ I BEZPIECZEŃSTWO';

  @override
  String get settingsBlockedRatings => 'Zablokowane oceny';

  @override
  String get settingsGeneralStyle => 'Styl ogólny';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Akcenty tematyczne, tła, obserwowane wskaźniki i muzyka tematyczna';

  @override
  String get settingsHomePage => 'Strona główna';

  @override
  String get settingsHomePageSubtitle =>
      'Sekcje, typy obrazów, nakładki i podglądy multimediów';

  @override
  String get settingsLibrariesSubtitle =>
      'Widoczność biblioteki, widok folderów i zachowanie wielu serwerów';

  @override
  String get settingsTwentyFourHourClock => 'Zegar 24-godzinny';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Gdziekolwiek wyświetlany jest zegar, używaj formatu 24-godzinnego';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Pokaż przycisk odtwarzania losowego na pasku nawigacyjnym';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Pokaż przycisk gatunków na pasku nawigacyjnym';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Pokaż przycisk ulubionych na pasku nawigacyjnym';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Pokaż przycisk bibliotek na pasku nawigacyjnym';

  @override
  String get settingsShowSeerrButtonInNavigation => '';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Przełącz widoczność strony głównej dla każdej biblioteki. Uruchom ponownie Moonfin, aby zmiany odniosły skutek.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Pasek multimediów i lokalne podglądy';

  @override
  String get settingsVisualOverlays => 'Nakładki wizualne';

  @override
  String get settingsSeasonalSurprise => 'Sezonowa niespodzianka';

  @override
  String get settingsMetadataAndRatings => 'Metadane i oceny';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase obsługuje integrację po stronie serwera, w tym dodatkowe źródła ocen, żądania Seerr i zsynchronizowane preferencje.';

  @override
  String get settingsOfflineDownloads => 'Pobieranie offline';

  @override
  String get settingsHigh => 'Wysoki';

  @override
  String get settingsLow => 'Niski';

  @override
  String get settingsCustomPath => 'Niestandardowa ścieżka';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Wprowadź ścieżkę folderu pobierania';

  @override
  String get settingsConcurrentDownloads => 'Równoczesne pobieranie';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maksymalna liczba elementów do pobrania na raz.';

  @override
  String get settingsAppInfo => 'INFORMACJE O APLIKACJI';

  @override
  String get settingsReportAnIssue => 'Zgłoś problem';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Otwórz narzędzie do śledzenia problemów w GitHubie';

  @override
  String get settingsJoinDiscord => 'Dołącz do Discorda';

  @override
  String get settingsJoinDiscordSubtitle => 'Czatuj ze społecznością';

  @override
  String get settingsJoinTheDiscord => 'Dołącz do Discorda';

  @override
  String get settingsSupportMoonfin => 'Wesprzyj Moonfina';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'PRAWNY';

  @override
  String get settingsLicenses => 'Licencje';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Informacje o licencjach typu open source';

  @override
  String get settingsPrivacyPolicy => 'Polityka prywatności';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Jak Moonfin obchodzi się z Twoimi danymi';

  @override
  String get settingsCheckForUpdates => 'Sprawdź aktualizacje';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Sprawdź najnowszą wersję Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Obsługiwane przez Flutter';

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
  String get settingsBoth => 'Obydwa';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Mieszaj filtr typu zawartości';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferencje odtwarzania wideo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Podstawowy silnik wideo i ustawienia jakości przesyłania strumieniowego';

  @override
  String get settingsAudioPreferences => 'Preferencje audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Ścieżki audio, opcje przetwarzania i przekazywania';

  @override
  String get settingsAutomationAndQueue => 'Automatyzacja i kolejka';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatyczne odtwarzanie i sekwencjonowanie';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Jakość pobierania, limity miejsca i rozmiar kolejki';

  @override
  String get settingsSyncplaySubtitle =>
      'Logika synchronizacji sesji grupowych';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specjalistyczne funkcje odtwarzacza. Używaj ostrożnie, ponieważ niektóre opcje mogą powodować problemy z odtwarzaniem';

  @override
  String get settingsSkipIntrosAndOutros => 'Pominąć wstępy i zakończenia?';

  @override
  String get settingsMediaSegmentCountdown => '';

  @override
  String get settingsProgressBar => '';

  @override
  String get settingsTimer => '';

  @override
  String get settingsNone => '';

  @override
  String get settingsPromptUser => 'Monituj użytkownika';

  @override
  String get settingsSkip => 'Pominąć';

  @override
  String get settingsDoNothing => 'Nie rób nic';

  @override
  String get settingsMaxBitrateDescription =>
      'Ogranicz szybkość transmisji strumieniowej. Treści powyżej tego progu zostaną transkodowane w celu dopasowania.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ogranicz maksymalną rozdzielczość, jakiej zażąda gracz. Treści o wyższej rozdzielczości zostaną transkodowane w dół.';

  @override
  String get settingsPlayerZoomDescription =>
      'Jak skalować wideo, aby dopasować je do ekranu.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Silnik odtwarzania (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Wybierz domyślny silnik odtwarzania na urządzeniach z systemem Android TV. Zmiany obowiązują podczas następnej sesji odtwarzania.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (zalecane)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (starsza wersja)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Funkcja zastępcza Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Zachowanie tytułów Dolby Vision na urządzeniach bez dekodowania Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Zapytaj za każdym razem';

  @override
  String get settingsPreferHdr10Fallback => 'Preferuj zastępczą wersję HDR10';

  @override
  String get settingsPreferServerTranscode => 'Preferuj transkodowanie serwera';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Odtwarzanie bezpośrednie Dolby Vision Profile 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Określa, czy strumienie warstwy udoskonalającej Dolby Vision o profilu 7 powinny kierować odtwarzaniem.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (włączony AFTKRT)';

  @override
  String get settingsEnabledOnThisDevice => 'Włączono na tym urządzeniu';

  @override
  String get settingsDisabledPreferTranscode =>
      'Wyłączone (preferuję transkodowanie)';

  @override
  String get settingsResumeRewindDescription =>
      'Ile sekund należy przewinąć do tyłu, wznawiając odtwarzanie (ze strony Kontynuuj oglądanie lub ze strony elementu multimedialnego)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Ile sekund należy przewinąć do tyłu, wznawiając odtwarzanie po naciśnięciu przycisku pauzy?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Ile sekund ma zostać przeskoczony do tyłu po naciśnięciu przycisku przewijania do tyłu.';

  @override
  String get settingsOneSecond => '1 sekunda';

  @override
  String get settingsThreeSeconds => '3 sekundy';

  @override
  String get settingsFortyFiveSeconds => '45 sekund';

  @override
  String get settingsSixtySeconds => '60 sekund';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Ile sekund ma przeskoczyć do przodu po naciśnięciu przycisku szybkiego przewijania do przodu.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 do zewnętrznego dekodera';

  @override
  String get settingsCinemaMode => 'Tryb kinowy';

  @override
  String get settingsCinemaModeSubtitle =>
      'Odtwarzaj zwiastuny/prerolli przed główną funkcją';

  @override
  String get settingsNextUpDisplayDescription =>
      'Rozszerzony wyświetla pełną kartę z grafiką i opisem odcinka. Minimal pokazuje kompaktową nakładkę odliczającą. Wyłączone całkowicie ukrywa monit.';

  @override
  String get settingsShort => 'Krótki';

  @override
  String get settingsLong => 'Długi';

  @override
  String get settingsVeryLong => 'Bardzo długi';

  @override
  String get settingsVideoStartDelay => 'Opóźnienie rozpoczęcia wideo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Bezpośrednie oglądanie telewizji na żywo';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Włącz bezpośrednie odtwarzanie telewizji na żywo';

  @override
  String get settingsOpenGroups => 'Grupy otwarte';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Twórz, dołączaj i zarządzaj grupami SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Włączone';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Włącz funkcje oglądania grupowego';

  @override
  String get settingsSyncplayButton => 'SyncPlay Przycisk';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Pokaż przycisk SyncPlay na pasku nawigacyjnym';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Zaawansowana korekta';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Włącz precyzyjną logikę synchronizacji';

  @override
  String get settingsSyncplaySyncCorrection => 'Korekta synchronizacji';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automatycznie dostosowuj odtwarzanie, aby zachować synchronizację';

  @override
  String get settingsSyncplaySpeedToSync => 'Szybkość synchronizacji';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Do synchronizacji użyj regulacji szybkości odtwarzania';

  @override
  String get settingsSyncplaySkipToSync => 'Przejdź do synchronizacji';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Użyj wyszukiwania synchronizacji';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimalne opóźnienie prędkości';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maksymalne opóźnienie prędkości';

  @override
  String get settingsSyncplaySpeedDuration => 'Czas trwania prędkości';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimalne opóźnienie pominięcia';

  @override
  String get settingsSyncplayExtraOffset => 'Dodatkowy offset SyncPlay';

  @override
  String get onNow => 'Teraz';

  @override
  String get collections => 'Kolekcje';

  @override
  String get lastPlayed => 'Ostatnio odtwarzane';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Latest $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
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
  String get enableTunnelingTitle => '';

  @override
  String get enableTunnelingSubtitle => '';

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
  String get showMediaDetailsOnLibraryPage => '';

  @override
  String get showMediaDetailsOnLibraryPageDescription => '';

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
  String get appearance => 'Appearance';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'External player app';

  @override
  String get externalPlayerAppDescription => '';

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
  String get crewContributionsSeerr => '';

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
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'Transcoding Limits';

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
