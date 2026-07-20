// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'Ustawienia konta';

  @override
  String get interfaceLanguage => 'Język interfejsu';

  @override
  String get systemLanguageDefault => 'Zgodnie z systemem';

  @override
  String get signIn => 'Logowanie';

  @override
  String get empty => 'Brak';

  @override
  String connectingToServer(String serverName) {
    return 'Połącz z $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Hasło';

  @override
  String get username => 'Nazwa użytkownika';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Wpisz ten kod w panelu internetowym swojego serwera:';

  @override
  String get waitingForAuthorization => 'Autoryzacja...';

  @override
  String get back => 'Wstecz';

  @override
  String get serverUnavailable => 'Serwer jest niedostępny';

  @override
  String get loginFailed => 'Logowanie nie powiodło się';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect niedostępny: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect niedostępny ($status): $detail';
  }

  @override
  String get whosWatching => 'Kto ogląda?';

  @override
  String get addUser => 'Dodaj użytkownika';

  @override
  String get selectServer => 'Wybierz Serwer';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin wersja $version';
  }

  @override
  String get savedServers => 'Zapisane serwery';

  @override
  String get discoveredServers => 'Wykryte serwery';

  @override
  String get noneFound => 'Nie znaleziono';

  @override
  String get unableToConnectToServer => 'Nie można połączyć się z serwerem';

  @override
  String get addServer => 'Dodaj serwer';

  @override
  String get embyConnect => 'Połącz z Emby';

  @override
  String get removeServer => 'Usuń serwer';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Usunąć \"$serverName\" ?';
  }

  @override
  String get cancel => 'Anuluj';

  @override
  String get remove => 'Usuń';

  @override
  String get connectToServer => 'Połącz się z serwerem';

  @override
  String get serverAddress => 'Adres serwera';

  @override
  String get serverAddressHint => 'https://twój-serwer.example.com';

  @override
  String get connect => 'Połącz';

  @override
  String get secureStorageUnavailable => 'Bezpieczny magazyn niedostępny';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nie mógł uzyskać dostępu do pęku kluczy systemowych. Logowanie może być kontynuowane, ale bezpieczne przechowywanie tokenów może być niedostępne do czasu odblokowania pęku kluczy.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Motyw aplikacji';

  @override
  String get detailScreenStyle => 'Widok szczegółów';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasyczny to oryginalny układ Moonfin. Nowoczesny to responsywny układ w stylu kinowym.';

  @override
  String get detailScreenStyleMoonfin => 'Klasyczny';

  @override
  String get detailScreenStyleModern => 'Nowoczesny';

  @override
  String get expandedTabs => 'Rozwinięcie zakładki';

  @override
  String get expandedTabsSubtitle =>
      'Automatycznie pokazuj zawartość zakładki podczas przeglądania. Wyłącz aby otwierać i zamykać zakładki ręcznie.';

  @override
  String get showTechnicalDetails => 'Pokazywać szczegóły techniczne?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Pokazuj informacje o kodeku, rozdzielczości i strumieniu w podsumowaniu banera';

  @override
  String get recommendationSystem => 'System rekomendacji';

  @override
  String get recommendationSystemSubtitle =>
      'Użyj lokalnego algorytmu Moonfin lub metryk online z TMDb. Uwaga! Rekomendacje online wymagają integracji z Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin poleca';

  @override
  String get recommendationSystemTmdb => 'Dopasowanie TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Zastosować limit oceny rodzicielskiej?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ogranicz sugestie Moonfin do poziomu oceny rodzicielskiej filmu';

  @override
  String get interfaceStyle => 'Styl interfejsu';

  @override
  String get interfaceStyleSubtitle =>
      'Automatyczne dopasowanie do urządzenia. Wybierz Apple lub Material aby wymusić wygląd.';

  @override
  String get interfaceStyleAutomatic => 'Tryb auto';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Jakość efektu szkła/rozmycia';

  @override
  String get glassQualitySubtitle =>
      'Automatycznie dobiera najlepszy efekt dla tego urządzenia. Pełny wymusza prawdziwe rozmycie. Zmniejszony korzysta z uproszczonego efektu, oszczędzając GPU.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Pełny';

  @override
  String get glassQualityReduced => 'Zmniejszony';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Zastosuj niestandardowy motyw i przełączaj się między interfejsami.';

  @override
  String get customThemeTitle => 'Niestandardowy motyw';

  @override
  String get customThemeSubtitle =>
      'Niestandardowe motywy zmieniają elementy wizualne całej aplikacji Moonfin. Wybierz jedną z opcji, aby dopasować wygląd do swojego upodobania.';

  @override
  String get keyboardPreferSystemIme => 'Preferuj klawiaturę systemową';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Używaj systemowej metody wprowadzania tekstu';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'Oryginalny czysty motyw Moonfin.';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave z magentową poświatą, cyjanowym tekstem i silniejszym kontrastem chromu';

  @override
  String get themeGlass => 'Rozmycie';

  @override
  String get themeGlassSubtitle =>
      'Liquid-glass z gradientowym tłem, matowymi powierzchniami i akcentem w kolorze Apple-blue';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pikselowy styl z grubą paletą kolorów, kanciastymi ramkami, twardymi cieniami i pikselową czcionką';

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
    return 'Nie można połączyć się z  $target';
  }

  @override
  String get exitApp => 'Wyjść z Moonfina?';

  @override
  String get exitAppConfirmation => 'Czy na pewno chcesz wyjść?';

  @override
  String get exit => 'Wyjście';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Wstrzymano';

  @override
  String get gameSaveState => 'Zapisz stan';

  @override
  String get games => 'Gry';

  @override
  String get gameLoadState => 'Wczytaj stan';

  @override
  String get gameFastForward => 'Przewijanie do przodu';

  @override
  String get gameEmulatorSettings => 'Opcje emulatora';

  @override
  String get gameNoCoreOptions =>
      'Ten rdzeń nie udostępnia żadnych opcji do zastosowania.';

  @override
  String get gameHoldToOpenMenu => 'Przytrzymaj aby otworzyć menu';

  @override
  String get gamePlaybackUnsupported =>
      'Odtwarzanie gier nie jest jeszcze obsługiwane na tym urządzeniu.';

  @override
  String get noHomeRowsLoaded => 'Nie można wczytać żadnych wierszy głównych';

  @override
  String get noHomeRowsHint =>
      'Spróbuj odświeżyć stronę lub zmniejszyć liczbę aktywnych sekcji na ekranie głównym.';

  @override
  String get retryHomeRows => 'Odśwież wiersze Home';

  @override
  String get guide => 'Przewodnik';

  @override
  String get recordings => 'Nagrania';

  @override
  String get schedule => 'Harmonogram';

  @override
  String get series => 'Seriale';

  @override
  String get noItemsFound => 'Nie znaleziono żadnych elementów';

  @override
  String get home => 'Strona główna';

  @override
  String get browseAll => 'Przeglądaj wszystko';

  @override
  String get genres => 'Gatunki';

  @override
  String get collectionPlaceholder => 'Tutaj pojawią się elementy kolekcji';

  @override
  String get browseByLetter => 'Alfabetycznie';

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
    return 'Nie udało się wczytać folderu: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ten folder jest pusty';

  @override
  String itemCountLabel(int count) {
    return '$count elementów';
  }

  @override
  String get failedToLoadFavorites => 'Nie udało się załadować ulubionych';

  @override
  String get retry => 'Ponów';

  @override
  String get noFavoritesYet => 'Nie ma jeszcze ulubionych';

  @override
  String get favorites => 'Ulubione';

  @override
  String totalCountItems(int count) {
    return '$count elementów';
  }

  @override
  String get continuing => 'W trakcie';

  @override
  String get ended => 'Zakończone';

  @override
  String get sortAndFilter => 'Sortuj i filtruj';

  @override
  String get type => 'Typ';

  @override
  String get sortBy => 'Sortuj według';

  @override
  String get display => 'Wyświetlanie';

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
    return '$name — Gatunki';
  }

  @override
  String get views => 'Widoki';

  @override
  String get albums => 'Albumy';

  @override
  String get albumArtists => 'Wykonawcy albumu';

  @override
  String get artists => 'Wykonawcy';

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
  String get justNow => 'Przed chwilą';

  @override
  String minutesAgo(int count) {
    return '${count}m temu';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h temu';
  }

  @override
  String daysAgo(int count) {
    return '${count}d temu';
  }

  @override
  String get discoverySubjects => 'Tematy';

  @override
  String get pickDiscoverySubjects =>
      'Wybierz kanały tematyczne, które mają być wyświetlane w Discover.';

  @override
  String get apply => 'Zastosuj';

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
  String get librivoxDescription => 'Popularne tytuły od LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count tytułów';
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
  String get listen => 'Słuchaj';

  @override
  String get resume => 'Wznów';

  @override
  String get failedToLoadLibrary => 'Nie udało się załadować biblioteki';

  @override
  String get popularNow => 'Popularne teraz';

  @override
  String get savedForLater => 'Zapisane na później';

  @override
  String get topListens => 'Najczęściej słuchane';

  @override
  String get unreadDiscoveries => 'Nieprzeczytane propozycje';

  @override
  String get pickUpAgain => 'Wróć do czytania';

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
      'Wróć dosłuchania bez szukania miejsca, w którym skończyłeś.';

  @override
  String get unreadBooksReady =>
      'Nieprzeczytane książki gotowe na Twoją najbliższą wolną chwilę.';

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
    return '$count autorzy';
  }

  @override
  String genresCount(int count) {
    return '$count gatunki';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% ukończone';
  }

  @override
  String get readyWhenYouAre => 'Czekamy, aż zaczniesz';

  @override
  String get details => 'Detale';

  @override
  String get listeningRoom => 'Pokój Słuchania';

  @override
  String get bookmarksAndProgress => 'Zakładki i postęp';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count tytułów dostępnych do przeglądania.';
  }

  @override
  String get titles => 'Tytuły';

  @override
  String get allTitles => 'Wszystkie tytuły';

  @override
  String get authors => 'Autorzy';

  @override
  String get browseByAuthor => 'Przeglądaj według autora';

  @override
  String get browseByGenre => 'Przeglądaj według gatunku';

  @override
  String get discover => 'Odkrywaj';

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
    return 'Nie znaleziono $label';
  }

  @override
  String get folder => 'Folder';

  @override
  String get filters => 'Filtry';

  @override
  String get readingStatus => 'Stan czytania';

  @override
  String get playedStatus => 'Status odtworzenia';

  @override
  String get readStatus => 'Czytaj';

  @override
  String get watched => 'Obejrzane';

  @override
  String get unread => 'Nieprzeczytane';

  @override
  String get unwatched => 'Nieobejrzane';

  @override
  String get seriesStatus => 'Status serialu';

  @override
  String get allLibraries => 'Wszystkie biblioteki';

  @override
  String get books => 'Książki';

  @override
  String get latestBooks => 'Ostatnio dodane książki';

  @override
  String get latestAudiobooks => 'Ostatnio dodane Audiobooki';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count książki',
      one: '1 książka',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Książka';

  @override
  String get bookFormatAudiobook => 'Audiobook';

  @override
  String bookPercentRead(int percent) {
    return '$percent% przeczytane';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time zostało';
  }

  @override
  String get bookHeroRead => 'Przeczytane';

  @override
  String get bookHeroListen => 'Słuchaj';

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
  String get readers => 'Lektorzy';

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
    return '$count sekcji';
  }

  @override
  String firstPublished(int year) {
    return 'Data pierwszego wydania $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'W Open Library nie ma jeszcze przeglądu tego tytułu.';

  @override
  String get subjects => 'Tematy';

  @override
  String get all => 'Wszystko';

  @override
  String booksCount(int count) {
    return '$count książek';
  }

  @override
  String get couldNotLoadSubject => 'Nie można teraz wczytać tego tematu.';

  @override
  String get audiobookDetails => 'Szczegóły audiobooka';

  @override
  String authorsCountTitle(int count) {
    return '$count Autorów';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiobooki',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista utworów';

  @override
  String get itemListPlaceholder => 'Tutaj pojawi się lista pozycji';

  @override
  String get failedToLoad => 'Nie udało się wczytać';

  @override
  String get delete => 'Usuń';

  @override
  String get save => 'Zapisz';

  @override
  String get moreLikeThis => 'Więcej podobnych';

  @override
  String get castAndCrew => 'Obsada i ekipa';

  @override
  String get collection => 'Kolekcja';

  @override
  String get episodes => 'Odcinki';

  @override
  String get nextUp => 'Następny w kolejce';

  @override
  String get seasons => 'Sezony';

  @override
  String get chapters => 'Rozdziały';

  @override
  String get features => 'Dodatki specjalne';

  @override
  String get movies => 'Filmy';

  @override
  String get musicVideos => 'Teledyski';

  @override
  String get other => 'Inne';

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
    return 'Płyta $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'O autorze';

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
    return 'Wydane w $year';
  }

  @override
  String get publicationDateUnknown => 'Data publikacji nieznana';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sezony',
      one: '1 Sezon',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Koniec o  $time';
  }

  @override
  String get items => 'Elementy';

  @override
  String get extras => 'Dodatki';

  @override
  String get behindTheScenes => 'Kulisy produkcji';

  @override
  String get deletedScenes => 'Usunięte sceny';

  @override
  String get featurettes => 'Materiały dodatkowe';

  @override
  String get interviews => 'Wywiady';

  @override
  String get scenes => 'Sceny';

  @override
  String get shorts => 'Krótkie filmy';

  @override
  String get trailers => 'Zwiastuny';

  @override
  String timeRemaining(String time) {
    return '$time pozostało';
  }

  @override
  String endsIn(String time) {
    return 'Koniec za $time';
  }

  @override
  String get view => 'Pogląd';

  @override
  String get resumeReading => 'Wznów czytanie';

  @override
  String get read => 'Czytaj';

  @override
  String resumeFrom(String position) {
    return 'Wznów od $position';
  }

  @override
  String get play => 'Odtwórz';

  @override
  String get startOver => 'Zacznij od nowa';

  @override
  String get restart => 'Uruchom ponownie';

  @override
  String get readOffline => 'Czytaj offline';

  @override
  String get playOffline => 'Graj w trybie offline';

  @override
  String get audio => 'Wybierz ścieżkę audio';

  @override
  String get subtitles => 'Napisy';

  @override
  String get version => 'Wersja';

  @override
  String get cast => 'Przesyłaj';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Zwiastun';

  @override
  String get finished => 'Ukończono';

  @override
  String get favorited => 'Ulubione';

  @override
  String get favorite => 'Ulubiony';

  @override
  String get playlist => 'Lista odtwarzania';

  @override
  String get downloaded => 'Pobrano';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get downloadAll => 'Pobierz wszystko';

  @override
  String get download => 'Pobierz';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Zmień nazwę listy odtwarzania';

  @override
  String get playlistName => 'Nazwa playlisty';

  @override
  String get deleteDownloadedAlbum => 'Usuń pobrany album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Usuń pobrany utwór \"$title\"?';
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
    return 'Nie udało się wczytać $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Pobieranie $title ($count elementów)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Napewno chcesz usunąć \"$name\" z serwera? Tego nie można cofnąć.';
  }

  @override
  String get itemDeleted => 'Element usunięty';

  @override
  String get noPlayableTrailerFound => 'Nie znaleziono zwiastuna.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'NIewspierany format: .$extension';
  }

  @override
  String get audioTrack => 'Ścieżka dźwiękowa';

  @override
  String get subtitleTrack => 'Ścieżka napisów';

  @override
  String get none => 'Brak';

  @override
  String get downloadSubtitlesLabel => 'Pobierz napisy...';

  @override
  String get searchOpenSubtitlesPlugin => 'Szukaj z wtyczką OpenSubtitles';

  @override
  String get downloadSubtitles => 'Pobierz napisy';

  @override
  String get selectedSubtitleInvalid => 'Wybrane napisy są nieprawidłowe.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Napisy pobrane i wybrane: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Napisy pobrane. Pojawienie się elementu może chwilę potrwać, aż Jellyfin odświeży element.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nie znaleziono napisów po $language.';
  }

  @override
  String get selectVersion => 'Wybierz wersję';

  @override
  String versionNumber(int number) {
    return 'Wersja $number';
  }

  @override
  String get downloadAllQuality => 'Pobierz wszystko — jakość';

  @override
  String get downloadQuality => 'Jakość pobierania';

  @override
  String get originalFileNoReencoding => 'Oryginalny plik';

  @override
  String get originalFilesNoReencoding => 'Oryginalne pliki';

  @override
  String get noEpisodesLoaded => 'Nie wczytano żadnych odcinków';

  @override
  String downloadingItem(String name, String quality) {
    return 'Pobieranie $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Usuń pobrane pliki';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Usuń lokalne pliki $typeLabel?\n\nZwolni to miejsce. Pliki można pobrać ponownie później.';
  }

  @override
  String get downloadedFilesDeleted => 'Pobrane pliki zostały usunięte';

  @override
  String get failedToDeleteFiles => 'Nie udało się usunąć plików';

  @override
  String get deleteFiles => 'Usuń pliki';

  @override
  String get director => 'REŻYSER';

  @override
  String get directors => 'REŻYSERIA';

  @override
  String get writer => 'SCENARIUSZ';

  @override
  String get writers => 'SCENARZYŚCI';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count więcej';
  }

  @override
  String totalEpisodes(int count) {
    return '$count odcinków';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Odcinek $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Rozdział $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count utworów',
      one: '1 utwór',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rozdziałów',
      one: '1 rozdział',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Urodziny $date';
  }

  @override
  String died(String date) {
    return 'Śmierć $date';
  }

  @override
  String age(int age) {
    return 'Wiek $age';
  }

  @override
  String get showLess => 'Pokaż mniej';

  @override
  String get readMore => 'Czytaj więcej';

  @override
  String get shuffle => 'Losowo';

  @override
  String get shuffleAllMusic => 'Odtwarzaj muzykę losowo';

  @override
  String get carSignInPrompt => 'Zaloguj się do Moonfin na telefonie';

  @override
  String get carServerUnreachable => 'Nie można połączyć się z serwerem';

  @override
  String downloadsCount(int count) {
    return '$count pobrań';
  }

  @override
  String get perfectMatch => 'Idealne dopasowanie';

  @override
  String channelsCount(int count) {
    return '${count}kanałów';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Wykonanie $action wymaga uprawnienia do zarządzania napisami w Jellyfin dla tego użytkownika.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Nie znaleziono na serwerze $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Napisy zdalne $action nieudane: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Napisy $action nieudane (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nieudane $action napisów.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'wszystkie pobrane odcinki \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'wszystkie pobrane odcinki w tym sezonie';

  @override
  String get stillWatching => 'Nadal oglądasz?';

  @override
  String get unableToLoadTrailerStream => 'Nie można wczytać zwiastuna.';

  @override
  String get trailerTimedOut => 'Przekroczono limit czasu ładowania zwiastuna.';

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
    return '$label nieudane: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nieudane przesyłanie głośności: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Sterowanie';
  }

  @override
  String get deviceVolume => 'Głośność urządzenia';

  @override
  String get unavailable => 'Niedostępne';

  @override
  String get pause => 'Wstrzymaj';

  @override
  String get syncPosition => 'Synchronizuj pozycję';

  @override
  String stopCast(String label) {
    return 'Zatrzymaj $label';
  }

  @override
  String get queueIsEmpty => 'Kolejka jest pusta';

  @override
  String trackNumber(int number) {
    return 'Utwór $number';
  }

  @override
  String get remotePlayback => 'Odtwarzanie zdalne';

  @override
  String get castingToGoogleCast => 'Przesyłanie do Google Cast';

  @override
  String get castingViaAirPlay => 'Przesyłanie przez AirPlay';

  @override
  String get castingViaDlna => 'Przesyłanie przez DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds s';
  }

  @override
  String get longPressToUnlock => 'Przytrzymaj, aby odblokować';

  @override
  String get off => 'Wyłączone';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Auto';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Wymuszony bitrate';

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
  String get reset => 'Resetuj';

  @override
  String get unknown => 'Nieznane';

  @override
  String get playbackInformation => 'Informacje o odtwarzaniu';

  @override
  String get playback => 'Odtwarzanie';

  @override
  String get playMethod => 'Metoda odtwarzania';

  @override
  String get directPlay => 'Odtwarzanie bezpośrednie';

  @override
  String get directStream => 'Bezpośredni strumień';

  @override
  String get transcoding => 'Transkodowanie';

  @override
  String get transcodeReasons => 'Powody transkodowania';

  @override
  String get player => 'Odtwarzacz';

  @override
  String get container => 'Kontener';

  @override
  String get bitrate => 'Szybkość transmisji';

  @override
  String get video => 'Wideo';

  @override
  String get resolution => 'Rozdzielczość';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Kodek';

  @override
  String get videoBitrate => 'Bitrate wideo';

  @override
  String get track => 'Ścieżka';

  @override
  String get channels => 'Kanały';

  @override
  String get audioBitrate => 'Bitrate dźwięku';

  @override
  String get sampleRate => 'Częstotliwość audio';

  @override
  String get format => 'Format';

  @override
  String get external => 'Zewnętrzny';

  @override
  String get embedded => 'Osadzony';

  @override
  String castSessionError(String protocol) {
    return '$protocol błąd sesji';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nie udało się wczytać informacji o książce: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Renderowanie plików EPUB w aplikacji nie jest jeszcze dostępne na tej platformie.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ten format (.$extension) nie jest jeszcze obsługiwany.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Wbudowane renderowanie dokumentów jest niedostępne na tej platformie.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nie można otworzyć zewnętrznej przeglądarki.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nie udało się otworzyć czytnika w aplikacji: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Zakładka już zapisana w $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Zakładka dodana: $label';
  }

  @override
  String get noBookmarksYet =>
      'Nie ma jeszcze żadnych zakładek.\nStuknij ikonę zakładki podczas czytania, aby zapisać swoją pozycję.';

  @override
  String get noTableOfContentsAvailable => 'Brak spisu treści';

  @override
  String pageLabel(int number) {
    return 'Strona $number';
  }

  @override
  String get position => 'Pozycja';

  @override
  String get bookReader => 'Czytnik książek';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% przeczytane';
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
    return 'Reset powiększenia (${zoom}x)';
  }

  @override
  String get singlePage => 'Pojedyncza strona';

  @override
  String get twoPageSpread => 'Widok dwustronnicowy';

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
    return 'Nie udało się zaktualizować stanu czytania: $error';
  }

  @override
  String get themeSystem => 'Styl: Systemowy';

  @override
  String get themeLight => 'Styl: Jasny';

  @override
  String get themeDark => 'Styl: Ciemny';

  @override
  String get themeSepia => 'Styl: Sepia';

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
    return 'Ta platforma nie obsługuje wbudowanego silnika $extension plików.';
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
  String get sports => 'Sport';

  @override
  String get news => 'Wiadomości';

  @override
  String get kids => 'Dzieci';

  @override
  String get premiere => 'Premiera';

  @override
  String get guideTimeline => 'Przewodnik po osi czasu';

  @override
  String failedToLoadGuide(String error) {
    return 'Nie udało sie załadować przewodnika: $error';
  }

  @override
  String get noChannelsFound => 'Nie znaleziono kanałów';

  @override
  String get liveBadge => 'NA ŻYWO';

  @override
  String guideNextProgram(String time, String title) {
    return 'Następny: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m zostało';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h zostało';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m zostało';
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
  String get record => 'Nagraj';

  @override
  String get cancelRecordingAction => 'Anuluj nagrywanie';

  @override
  String get programSetToRecord => 'Nagrywanie zaplanowane';

  @override
  String get recordingCancelled => 'Nagrywanie anulowane';

  @override
  String get unableToCreateRecording => 'Nie udało się włączyć nagrywania';

  @override
  String get watch => 'Oglądaj';

  @override
  String get close => 'Zamknij';

  @override
  String failedToPlayChannel(String name) {
    return 'Nie można włączyć $name';
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
    return 'Anulować zaplanowane nagrywanie \"$name\"?';
  }

  @override
  String get no => 'Nie';

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
    return 'Zakończ nagrywanie \"$name\"?';
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
    return 'Brak wyników dla \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Wyszukiwanie nieudane: $error';
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
  String get deleteDownload => 'Usuń pobrany plik';

  @override
  String removeItemAndFiles(String name) {
    return 'Usuń \"$name\" wraz z plikami?';
  }

  @override
  String tracksCount(int count) {
    return '$count utworów';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Odtwórz album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nie udało sie załadować albumu: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nie znaleziono pobranych utworów dla $name.';
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
    return 'Usunąć \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'S$season O$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Odcinek $number';
  }

  @override
  String get seriesNotFound => 'Nie znaleziono serii';

  @override
  String get errorLoadingSeries => 'Błąd podczas ładowania serii';

  @override
  String get downloadedEpisodes => 'Pobrane odcinki';

  @override
  String seasonNumber(int number) {
    return 'Sezon $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Odcinki specjalne';

  @override
  String get deleteSeason => 'Usuń sezon';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Usunąć wszystkie pobrane odcinki w $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odcinki',
      one: '1 odcinek',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Zarządzanie pamięcią';

  @override
  String get storageBreakdown => 'Podział pamięci';

  @override
  String get downloadedItems => 'Pobrane elementy';

  @override
  String get storageLimit => 'Limit pamięci';

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
    return 'Usunąć $count pobranych elementów?';
  }

  @override
  String get musicAndAudiobooks => 'Muzyka i audiobooki';

  @override
  String get images => 'Obrazy';

  @override
  String get database => 'Baza danych';

  @override
  String ofStorageLimit(String limit) {
    return 'z $limit limitu';
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
  String get bitRateResolutionBehavior => 'Bitrate, rozdzielczość, zachowanie';

  @override
  String get languageSizeAppearance => 'Język, rozmiar, wygląd';

  @override
  String get qualityStorage => 'Jakość, pamięć';

  @override
  String get serverSyncAndPluginStatus =>
      'Synchronizacja z serwerem i status wtyczek';

  @override
  String get mediaRequestIntegration => 'Integracja żądań multimediów';

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
  String get pluginAndRequests => 'Wtyczki i żądania';

  @override
  String get customizeAccountPlaybackInterface =>
      'Dostosuj konto, odtwarzanie i zachowanie interfejsu';

  @override
  String optionsCount(int count) {
    return '$count opcji';
  }

  @override
  String get themeAndAppearance => 'Motyw i wygląd';

  @override
  String get focusBorderColor => 'Kolor obramowania fokusu';

  @override
  String get watchedIndicators => 'Wskaźniki obejrzanych';

  @override
  String get always => 'Zawsze';

  @override
  String get hideUnwatched => 'Ukryj nieobejrzane';

  @override
  String get episodesOnly => 'Tylko odcinki';

  @override
  String get never => 'Nigdy';

  @override
  String get focusExpansionAnimation => 'Animacja powiększenia przy fokusie';

  @override
  String get desktopUiScale => 'Skalowanie interfejsu';

  @override
  String get scaleFocusedCards =>
      'Skaluj karty i kafelki po najechaniu lub zaznaczeniu';

  @override
  String get backgroundBackdrops => 'Tła w tle';

  @override
  String get showBackdropImages => 'Pokaż obrazy tła za treścią';

  @override
  String get seriesThumbnails => 'Wyświetlaj miniatury seriali';

  @override
  String get seriesThumbnailsDescription =>
      'Dla seriali używaj głównej grafiki serialu zamiast miniatury odcinka.';

  @override
  String get homeRowInfoOverlay =>
      'Nakładka informacyjna w wierszu ekranu głównego';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Pokazuj tytuł i metadane podczas przeglądania wierszy ekranu głównego';

  @override
  String get clockDisplay => 'Wyświetlaj zegar';

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
  String get themeMusicSettingsSubtitle =>
      'Strony szczegółów, wiersze ekranu głównego i głośność';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows =>
      'Muzyka motywu w wierszach ekranu głównego';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Odtwarzaj podczas przeglądania ekranu głównego';

  @override
  String get loopThemeMusic => 'Odtwarzaj muzykę motywu w pętli';

  @override
  String get loopThemeMusicSubtitle =>
      'Powtarzaj utwór zamiast odtworzyć go raz';

  @override
  String get detailsBackgroundBlur => 'Rozmycie tła na stronie szczegółów';

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
  String get browsingBackgroundBlur => 'Rozmycie tła podczas przeglądania';

  @override
  String get maxStreamingBitrate => 'Maksymalny bitrate strumieniowania';

  @override
  String get maxResolution => 'Maksymalna rozdzielczość';

  @override
  String get playerZoomMode => 'Tryb powiększenia odtwarzacza';

  @override
  String get settingsScrollWheelAction => 'Kółko przewijania myszy';

  @override
  String get settingsScrollWheelActionDescription =>
      'Wybierz, co robi przewijanie kółkiem myszy nad wideo podczas odtwarzania.';

  @override
  String get scrollWheelActionOff => 'Wyłączone';

  @override
  String get scrollWheelActionSeek => 'Przewijanie (do przodu / do tyłu)';

  @override
  String get scrollWheelActionVolume => 'Głośność';

  @override
  String get playerTooltipVolume => 'Głośność';

  @override
  String get fit => 'Dopasuj';

  @override
  String get autoCrop => 'Automatyczne dopasowanie';

  @override
  String get stretch => 'Rozciągnij';

  @override
  String get refreshRateSwitching => 'Zmiana częstotliwości odświeżania';

  @override
  String get disabled => 'Wyłączone';

  @override
  String get scaleOnTv => 'Skaluj na TV';

  @override
  String get scaleOnDevice => 'Skaluj na urządzeniu';

  @override
  String get trickPlay => 'Podgląd klatek (Trick Play)';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Pokazuj podgląd klatek podczas przewijania';

  @override
  String get showDescriptionOnPause => 'Pokazuj opis podczas pauzy';

  @override
  String get dimVideoShowOverview =>
      'Przyciemnij wideo i pokazuj opis podczas pauzy';

  @override
  String get osdLockButton => 'Przycisk blokady OSD';

  @override
  String get osdLockButtonDescription =>
      'Pokazuj przycisk blokady, który blokuje dotyk do czasu długiego naciśnięcia';

  @override
  String get audioBehavior => 'Zachowanie dźwięku';

  @override
  String get downmixToStereo => 'Zmiksuj do stereo';

  @override
  String get defaultAudioLanguage => 'Domyślny język audio';

  @override
  String get fallbackAudioLanguage => 'Zapasowy język audio';

  @override
  String get preferDefaultAudioTrack => 'Preferuj domyślną ścieżkę audio';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferuj oryginalną ścieżkę audio zamiast dubbingu.';

  @override
  String get preferAudioDescription => 'Preferuj ścieżki audiodeskrypcji';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferuj ścieżki audiodeskrypcji zamiast zwykłych ścieżek.';

  @override
  String get transcodingAudio => 'Transkodowanie (audio)';

  @override
  String get directStreamRemux => 'Strumieniowanie bezpośrednie (remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transkodowanie (bitrate lub rozdzielczość)';

  @override
  String get transcodingVideoAndAudio => 'Transkodowanie (wideo i audio)';

  @override
  String get transcodingVideo => 'Transkodowanie (wideo)';

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
  String get swedish => 'Szwedzki';

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
      'Przesyłaj strumień DTS bezpośrednio (bitstream) do amplitunera; wymaga obsługi przez amplituner oraz źródłowej ścieżki DTS';

  @override
  String get enableTrueHdAudio =>
      'Włącz dźwięk TrueHD (może nie działać na wszystkich platformach)';

  @override
  String get settingsAudioOutputMode => 'Tryb wyjścia audio';

  @override
  String get settingsAudioOutputModeDescription =>
      'Wybierz sposób dekodowania audio. Passthrough do amplitunera przesyła surowy strumień Dolby/DTS; tryb Automatyczny lub Downmix dekoduje lokalnie.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Zapasowy kodek audio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Wybierz format docelowy do transkodowania dźwięku wielokanałowego, gdy strumień źródłowy nie może zostać odtworzony bezpośrednio ani przesłany przez passthrough.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Wykrywanie automatyczne\n(zalecane)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Domyślnie)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Bezstratny)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Wydajny)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Bezstratny)';

  @override
  String get settingsMaxAudioChannels => 'Maksymalna liczba kanałów audio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Skonfiguruj maksymalną liczbę kanałów obsługiwaną przez Twój zestaw audio. Strumienie wielokanałowe przekraczające ten limit zostaną zmiksowane w dół lub transkodowane.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Wykrywanie automatyczne\n(domyślne sprzętowe)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Kwadrofonia';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (zaawansowane)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough kodeka';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Włączaj tylko formaty obsługiwane przez Twój amplituner lub odbiornik HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3 przejście';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) przejście';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core przejście';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA przejście';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD przejście';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos przejście';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Przesyłaj strumień Dolby Digital Plus (EAC3) bezpośrednio do zewnętrznego dekodera.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Przesyłaj strumień Dolby Atmos przez EAC3 (JOC) do zewnętrznego dekodera.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Przesyłaj strumień DTS-HD MA (zawiera rdzeń DTS) do zewnętrznego dekodera.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Przesyłaj strumień Dolby TrueHD z metadanymi Atmos do zewnętrznego dekodera.';

  @override
  String get settingsDetectedAudioCapabilities => 'Wykryte możliwości audio';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Brak jeszcze danych o wykrytych możliwościach.';

  @override
  String get settingsAudioRouteLabel => 'Wyjście';

  @override
  String get settingsAudioDecodeLabel => 'Dekodowanie';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Wyjście audio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Głośnik';

  @override
  String get settingsAudioRouteHeadphones => 'Słuchawki';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count kan. PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostyka';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Poziom wideo';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Zakres wideo';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Kodek napisów';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Dozwolone kodeki audio';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Kodeki audio HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Kodeki audio HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif passthrough';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute =>
      'Aktywne wyjście audio';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Obsługa audio HD przez wyjście';

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
    return 'Po $episodes odcinkach / $hours godz.';
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
  String get subtitleMode => 'Tryb napisów';

  @override
  String get subtitleModeFlagged => 'Oznaczone';

  @override
  String get subtitleModeAlways => 'Zawsze';

  @override
  String get subtitleModeForeign => 'W innym języku';

  @override
  String get subtitleModeForced => 'Wymuszone';

  @override
  String get subtitleModeFlaggedDescription =>
      'Odtwarza ścieżki oznaczone w metadanych pliku jako „domyślne” lub „wymuszone”.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Automatycznie wczytuj i wyświetlaj napisy przy każdym uruchomieniu wideo.';

  @override
  String get subtitleModeForeignDescription =>
      'Automatycznie włącza napisy, jeśli domyślna ścieżka audio jest w innym języku niż wybrany.';

  @override
  String get subtitleModeForcedDescription =>
      'Wczytuje tylko napisy jawnie oznaczone flagą metadanych „forced”.';

  @override
  String get subtitleModeNoneDescription =>
      'Całkowicie wyłącza automatyczne wczytywanie napisów.';

  @override
  String get fallbackSubtitleLanguage => 'Zapasowy język napisów';

  @override
  String get subtitleStream => 'Strumień napisów';

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
    return 'Wczytano ustawienia profilu $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nie udało się wczytać ustawień profilu $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Zsynchronizowano ustawienia lokalne z profilem $profile.';
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
  String get reportDownloadsActivity => 'Pokazuj pobierania na serwerze';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Pozwól administratorowi serwera widzieć Twoje transkodowane pobrania w panelu';

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
  String get navbarAlwaysExpanded => 'Zawsze rozwijaj etykiety paska nawigacji';

  @override
  String get showSeerrButton => 'Pokaż przycisk Seerr';

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
  String get groupItemsIntoCollections => 'Grupuj elementy w kolekcje';

  @override
  String get hideCollectionAssociatedItems =>
      'Ukryj elementy biblioteki powiązane z kolekcjami podczas przeglądania bibliotek';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Informacja o grupowaniu biblioteki';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Aby korzystać z tego ustawienia, upewnij się, że opcje „Grupuj filmy w kolekcje” i/lub „Grupuj seriale w kolekcje” są włączone w ustawieniach wyświetlania Twojej biblioteki na serwerze Jellyfin lub Emby.';

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
    return 'Wybrano: $count';
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
  String get mediaBarModeMoonfin => 'Moonfin';

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
  String get trailerAudio => 'Dźwięk zwiastunów';

  @override
  String get enableTrailerAudio =>
      'Włącz dźwięk zwiastunów na pasku multimediów';

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
  String get fullScreenRows => 'Rozwinięte wiersze ekranu głównego';

  @override
  String get fullScreenRowsDescription =>
      'Ogranicz ekran główny do 1 wiersza na ekran';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Typ obrazu na wiersz';

  @override
  String get perRowSettings => 'Ustawienia poszczególnych wierszy';

  @override
  String get autoLogin => 'Automatyczne logowanie';

  @override
  String get lastUser => 'Ostatni użytkownik';

  @override
  String get currentUser => 'Bieżący użytkownik';

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
  String get clockModeStatic => 'Statyczny';

  @override
  String get clockModeBouncing => 'Odbijający się';

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
  String get pluginLabel => 'Wtyczka Moonbase';

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
    return '$status\nWersja: $version';
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
  String get seerrDiscoveryRows => 'Wiersze odkrywania Seerr';

  @override
  String get resetRowsToDefaults => 'Zresetuj wiersze do wartości domyślnych';

  @override
  String get enableSeerr => 'Włącz Seerr';

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
  String get seerrNotificationsSection => 'Powiadomienia';

  @override
  String get seerrNotifyNewRequestsTitle => 'Powiadomienia o nowych żądaniach';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Powiadamiaj mnie, gdy ktoś prześle żądanie';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Aktualizacje żądań';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Zatwierdzone, odrzucone i dodane do biblioteki';

  @override
  String get seerrNotifyIssuesTitle => 'Aktualizacje zgłoszeń';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Nowe zgłoszenia, odpowiedzi i rozwiązania';

  @override
  String loggedInAs(String username) {
    return 'Zalogowano jako: $username';
  }

  @override
  String get discoverRows => 'Strona odkrywania Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Włącz wiersze widoczne na stronie głównej Seerr. Przeciągnij, aby zmienić kolejność. Własna kolejność synchronizuje się z Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Włącz wiersze widoczne na stronie głównej Seerr. Przeciągnij, aby zmienić kolejność. Własna kolejność synchronizuje się z Moonbase.';

  @override
  String get enabled => 'Włączone';

  @override
  String get hidden => 'Ukryty';

  @override
  String get aboutTitle => 'O';

  @override
  String versionValue(String version) {
    return 'Wersja $version';
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
    return 'Dostępna aktualizacja: v$version';
  }

  @override
  String get updateNotifications => 'Aktualizuj powiadomienia';

  @override
  String get showWhenUpdatesAvailable =>
      'Pokaż, kiedy dostępne są aktualizacje';

  @override
  String updateAvailableTitle(String version) {
    return 'Dostępna wersja v$version';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limit pamięci podręcznej obrazów';

  @override
  String get clearImageCache => 'Wyczyść pamięć podręczną obrazów';

  @override
  String get imageCacheCleared => 'Wyczyszczono pamięć podręczną obrazów';

  @override
  String get clear => 'Wyczyść';

  @override
  String get browse => 'Przeglądać';

  @override
  String get noResults => 'Brak wyników';

  @override
  String get seerrAvailableStatus => 'Dostępny';

  @override
  String get seerrRequestedStatus => 'Wymagany';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Pobieranie · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importowanie';

  @override
  String itemsCount(int count) {
    return '$count elementów';
  }

  @override
  String get seerrSettings => 'Ustawienia Seerr';

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
    return 'Zażądane przez $name';
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
    return 'Anulować żądanie dla „$title”?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Anulować $count żądań dla „$title”?';
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
    return 'Budżet: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Przychód: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Zażądaj: $type';
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
    return 'wiek $age';
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
  String get failedStatus => 'Nieudany';

  @override
  String get processingStatus => 'Przetwarzanie';

  @override
  String modifiedByName(String name) {
    return 'Zmodyfikowane przez $name';
  }

  @override
  String get completedStatus => 'Ukończony';

  @override
  String get requestErrorDuplicate => 'Ten tytuł został już zażądany';

  @override
  String get requestErrorQuota => 'Osiągnięto limit żądań';

  @override
  String get requestErrorBlocklisted =>
      'Ten tytuł jest na liście zablokowanych';

  @override
  String get requestErrorNoSeasons => 'Nie ma już sezonów do zażądania';

  @override
  String get requestErrorPermission =>
      'Nie masz uprawnień do złożenia tego żądania';

  @override
  String get seerrRequestsTitle => 'Żądania';

  @override
  String get seerrIssuesTitle => 'Zgłoszenia';

  @override
  String get sortNewest => 'Najnowsze';

  @override
  String get sortLastModified => 'Ostatnio zmodyfikowane';

  @override
  String get noIssues => 'Brak zgłoszeń';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Pozostało $remaining z $limit żądań filmów';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Pozostało $remaining z $limit żądań sezonów';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Część kolekcji $name';
  }

  @override
  String get viewCollection => 'Zobacz kolekcję';

  @override
  String get requestCollection => 'Zażądaj kolekcji';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmów · $available dostępnych';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Zażądaj $count filmów';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Żądanie $current z $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Zażądano $count filmów';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Zażądano $ok z $total filmów';
  }

  @override
  String get collectionAllRequested =>
      'Wszystkie filmy są już dostępne lub zażądane';

  @override
  String get reportIssue => 'Zgłoś problem';

  @override
  String get issueTypeVideo => 'Wideo';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Na czym polega problem?';

  @override
  String get allEpisodes => 'Wszystkie odcinki';

  @override
  String get episode => 'Odcinek';

  @override
  String get openStatus => 'Otwarte';

  @override
  String get resolvedStatus => 'Rozwiązane';

  @override
  String get resolveAction => 'Rozwiąż';

  @override
  String get reopenAction => 'Otwórz ponownie';

  @override
  String reportedByName(String name) {
    return 'Zgłoszone przez $name';
  }

  @override
  String commentsCount(int count) {
    return '$count komentarzy';
  }

  @override
  String get addComment => 'Dodaj komentarz';

  @override
  String get deleteIssueConfirm => 'Usunąć to zgłoszenie?';

  @override
  String get submitReport => 'Wyślij zgłoszenie';

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
  String get seasonsLabel => 'Sezony';

  @override
  String get episodesLabel => 'Odcinki';

  @override
  String get access => 'Dostęp';

  @override
  String get add => 'Dodaj';

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
  String get done => 'Gotowe';

  @override
  String get edit => 'Edytuj';

  @override
  String get encoding => 'Kodowanie';

  @override
  String get error => 'Błąd';

  @override
  String get forward => 'Do przodu';

  @override
  String get general => 'Ogólne';

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
  String get next => 'Dalej';

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
  String get remote => 'Pilot';

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
  String get stop => 'Zatrzymaj';

  @override
  String get streaming => 'Transmisja strumieniowa';

  @override
  String get time => 'Czas';

  @override
  String get trickplay => 'Trickplay';

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
  String get mute => 'Wycisz';

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
  String get adminDrawerDisplay => 'Wyświetlanie';

  @override
  String get adminDrawerMetadata => 'Metadane';

  @override
  String get adminDrawerNfo => 'Ustawienia NFO';

  @override
  String get adminDrawerTranscoding => 'Transkodowanie';

  @override
  String get adminDrawerResume => 'Wznów';

  @override
  String get adminDrawerStreaming => 'Transmisja strumieniowa';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return 'Dostępne aktualizacje wtyczek: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Wtyczki wymagające ponownego uruchomienia: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Nieudane zadania zaplanowane: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Ostatnie ostrzeżenia/błędy: $count';
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
    return 'Błąd: $error';
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
    return 'Polecenie nie powiodło się: $error';
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
  String get volume => 'Głośność';

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
  String get adminActivitySeverityAll => 'Wszystkie poziomy ważności';

  @override
  String get adminActivityDateRange => 'Zakres dat';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nie udało się wczytać dziennika aktywności: $error';
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
    return 'Nie udało się zaktualizować urządzenia: $error';
  }

  @override
  String get adminDeleteDevice => 'Usuń urządzenie';

  @override
  String get adminDeviceDeleted => 'Urządzenie usunięte';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Nie udało się usunąć urządzenia: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Usunąć urządzenie „$name”? Użytkownik będzie musiał ponownie zalogować się na tym urządzeniu.';
  }

  @override
  String get adminDeleteAllDevices => 'Usuń wszystkie urządzenia';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Usunąć $count urządzeń? Objęci użytkownicy będą musieli zalogować się ponownie. Nie dotyczy to Twojego bieżącego urządzenia.';
  }

  @override
  String get adminDevicesDeletedAll => 'Usunięto urządzenia';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Usunięto część urządzeń; nie udało się usunąć $count.';
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
    return 'Nie udało się rozpocząć skanowania: $error';
  }

  @override
  String get adminRenameLibrary => 'Zmień nazwę biblioteki';

  @override
  String get adminNewName => 'Nowa nazwa';

  @override
  String adminLibraryRenamed(String name) {
    return 'Zmieniono nazwę biblioteki na „$name”';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nie udało się zmienić nazwy: $error';
  }

  @override
  String get adminDeleteLibrary => 'Usuń bibliotekę';

  @override
  String adminLibraryDeleted(String name) {
    return 'Usunięto bibliotekę „$name”';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Nie udało się usunąć biblioteki: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nie udało się dodać ścieżki: $error';
  }

  @override
  String get adminRemovePath => 'Usuń ścieżkę';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Usunąć „$path” z tej biblioteki?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nie udało się usunąć ścieżki: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opcje biblioteki zostały zapisane';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Nie udało się zapisać opcji: $error';
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
  String get adminLibraryTabPaths => 'Ścieżki';

  @override
  String get adminLibraryTabOptions => 'Opcje';

  @override
  String get adminLibraryTabDownloaders => 'Pobieranie';

  @override
  String get adminLibMetadataSavers => 'Zapisywanie metadanych';

  @override
  String get adminLibSubtitleDownloaders => 'Pobieranie napisów';

  @override
  String get adminLibLyricDownloaders => 'Pobieranie tekstów utworów';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Pobieranie metadanych: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Pobieranie obrazów: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Ten serwer nie udostępnia żadnych źródeł pobierania dla tego typu biblioteki.';

  @override
  String get adminLibrarySectionGeneral => 'Ogólne';

  @override
  String get adminLibrarySectionMetadata => 'Metadane';

  @override
  String get adminLibrarySectionEmbedded => 'Osadzone informacje';

  @override
  String get adminLibrarySectionSubtitles => 'Napisy';

  @override
  String get adminLibrarySectionImages => 'Obrazy';

  @override
  String get adminLibrarySectionSeries => 'Seriale';

  @override
  String get adminLibrarySectionMusic => 'Muzyka';

  @override
  String get adminLibrarySectionMovies => 'Filmy';

  @override
  String get adminLibRealtimeMonitor =>
      'Włącz monitorowanie w czasie rzeczywistym';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Wykrywaj zmiany plików i przetwarzaj je automatycznie.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Traktuj archiwa jako pliki multimedialne';

  @override
  String get adminLibEnablePhotos => 'Wyświetlaj zdjęcia';

  @override
  String get adminLibSaveLocalMetadata =>
      'Zapisuj grafiki w folderach multimediów';

  @override
  String get adminLibRefreshInterval => 'Automatyczne odświeżanie metadanych';

  @override
  String get adminLibRefreshNever => 'Nigdy';

  @override
  String get adminLibDefault => 'Domyślnie';

  @override
  String get adminLibDisplayTitle => 'Wyświetlanie';

  @override
  String get adminLibDisplaySection => 'Wyświetlanie biblioteki';

  @override
  String get adminLibFolderView =>
      'Pokaż widok folderów dla zwykłych folderów multimedialnych';

  @override
  String get adminLibSpecialsInSeasons =>
      'Pokazuj odcinki specjalne w sezonach, w których zostały wyemitowane';

  @override
  String get adminLibGroupMovies => 'Grupuj filmy w kolekcje';

  @override
  String get adminLibGroupShows => 'Grupuj seriale w kolekcje';

  @override
  String get adminLibExternalSuggestions =>
      'Pokazuj zewnętrzne treści w propozycjach';

  @override
  String get adminLibDateAddedSection => 'Zachowanie daty dodania';

  @override
  String get adminLibDateAddedLabel => 'Użyj daty dodania z';

  @override
  String get adminLibDateAddedImport => 'Data zeskanowania do biblioteki';

  @override
  String get adminLibDateAddedFile => 'Data utworzenia pliku';

  @override
  String get adminLibMetadataTitle => 'Metadane i obrazy';

  @override
  String get adminLibMetadataLangSection => 'Preferowany język metadanych';

  @override
  String get adminLibChaptersSection => 'Rozdziały';

  @override
  String get adminLibDummyChapterDuration =>
      'Długość zastępczych rozdziałów (sekundy)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Długość rozdziałów generowanych dla multimediów, które ich nie mają. Ustaw 0, aby wyłączyć.';

  @override
  String get adminLibChapterImageResolution =>
      'Rozdzielczość obrazów rozdziałów';

  @override
  String get adminLibNfoTitle => 'Ustawienia NFO';

  @override
  String get adminLibNfoHelp =>
      'Metadane NFO są zgodne z Kodi i podobnymi klientami. Ustawienia dotyczą wszystkich bibliotek zapisujących metadane NFO.';

  @override
  String get adminLibKodiUser =>
      'Użytkownik, dla którego zapisywane są dane oglądania w plikach NFO';

  @override
  String get adminLibSaveImagePaths => 'Zapisuj ścieżki obrazów w plikach NFO';

  @override
  String get adminLibPathSubstitution =>
      'Włącz podstawianie ścieżek dla ścieżek obrazów NFO';

  @override
  String get adminLibExtraThumbs =>
      'Kopiuj obrazy extrafanart do folderu extrathumbs';

  @override
  String get adminLibNone => 'Brak';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dni';
  }

  @override
  String get adminLibEmbeddedTitles => 'Używaj osadzonych tytułów';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Używaj osadzonych tytułów dla dodatków';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Używaj osadzonych informacji o odcinkach';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Zezwalaj na osadzone napisy';

  @override
  String get adminLibEmbeddedAllowAll => 'Zezwalaj na wszystkie';

  @override
  String get adminLibEmbeddedAllowText => 'Tylko tekstowe';

  @override
  String get adminLibEmbeddedAllowImage => 'Tylko obrazkowe';

  @override
  String get adminLibEmbeddedAllowNone => 'Brak';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Pomiń pobieranie, jeśli są osadzone napisy';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Pomiń pobieranie, jeśli ścieżka audio jest w języku pobierania';

  @override
  String get adminLibRequirePerfectMatch =>
      'Wymagaj idealnego dopasowania napisów';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Zapisuj napisy w folderach multimediów';

  @override
  String get adminLibChapterImageExtraction => 'Wyodrębniaj obrazy rozdziałów';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Wyodrębniaj obrazy rozdziałów podczas skanowania biblioteki';

  @override
  String get adminLibTrickplayExtraction =>
      'Włącz wyodrębnianie obrazów trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Wyodrębniaj obrazy trickplay podczas skanowania biblioteki';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Zapisuj obrazy trickplay w folderach multimediów';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatycznie scalaj seriale rozproszone w wielu folderach';

  @override
  String get adminLibSeasonZeroName => 'Nazwa wyświetlana sezonu zerowego';

  @override
  String get adminLibLufsScan =>
      'Włącz skanowanie LUFS do normalizacji dźwięku';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferuj niestandardowy tag wykonawcy';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatycznie dodawaj filmy do kolekcji';

  @override
  String get adminLibraryNameRequired => 'Nazwa biblioteki jest wymagana';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nie udało się utworzyć biblioteki: $error';
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
    return 'Wyłączyć użytkownika $name? Nie będzie mógł się zalogować.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Włączyć użytkownika $name? Będzie mógł ponownie się zalogować.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Wyłączono użytkownika „$name”';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Włączono użytkownika „$name”';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Nie udało się zaktualizować zasad użytkownika: $error';
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
    return 'Nie udało się utworzyć użytkownika: $error';
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
    return 'Nie udało się zapisać: $error';
  }

  @override
  String get adminPermissionsSaved => 'Uprawnienia zostały zapisane';

  @override
  String get adminPasswordsMismatch => 'Hasła nie pasują';

  @override
  String adminFailed(String error) {
    return 'Niepowodzenie: $error';
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
  String get adminParentalControl => 'Kontrola rodzicielska';

  @override
  String get adminMaxParentalRating => 'Maksymalna dozwolona kategoria wiekowa';

  @override
  String get adminMaxParentalRatingHint =>
      'Treści o wyższej kategorii będą ukryte przed tym użytkownikiem.';

  @override
  String get adminParentalRatingNone => 'Brak';

  @override
  String get adminBlockUnratedItems =>
      'Blokuj elementy bez kategorii wiekowej lub z nierozpoznaną kategorią';

  @override
  String get adminUnratedBook => 'Książki';

  @override
  String get adminUnratedChannelContent => 'Kanały';

  @override
  String get adminUnratedLiveTvChannel => 'Telewizja na żywo';

  @override
  String get adminUnratedMovie => 'Filmy';

  @override
  String get adminUnratedMusic => 'Muzyka';

  @override
  String get adminUnratedTrailer => 'Zwiastuny';

  @override
  String get adminUnratedSeries => 'Seriale';

  @override
  String get adminAccessSchedules => 'Harmonogramy dostępu';

  @override
  String get adminAccessSchedulesHint =>
      'Zezwalaj na dostęp tylko w zaplanowanych godzinach poniżej. Gdy nie ustawiono harmonogramu, dostęp jest możliwy przez cały dzień.';

  @override
  String get adminAddSchedule => 'Dodaj harmonogram';

  @override
  String get adminScheduleDay => 'Dzień';

  @override
  String get adminScheduleStart => 'Początek';

  @override
  String get adminScheduleEnd => 'Koniec';

  @override
  String get adminDayEveryday => 'Codziennie';

  @override
  String get adminDayWeekday => 'Dzień powszedni';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Niedziela';

  @override
  String get adminDayMonday => 'Poniedziałek';

  @override
  String get adminDayTuesday => 'Wtorek';

  @override
  String get adminDayWednesday => 'Środa';

  @override
  String get adminDayThursday => 'Czwartek';

  @override
  String get adminDayFriday => 'Piątek';

  @override
  String get adminDaySaturday => 'Sobota';

  @override
  String get adminAllowedTags => 'Dozwolone tagi';

  @override
  String get adminAllowedTagsHint =>
      'Wyświetlane są tylko treści z tymi tagami. Pozostaw puste, aby zezwolić na wszystkie.';

  @override
  String get adminBlockedTags => 'Zablokowane tagi';

  @override
  String get adminBlockedTagsHint =>
      'Treści z tymi tagami będą ukryte przed tym użytkownikiem.';

  @override
  String get adminAddTag => 'Dodaj tag';

  @override
  String get adminEnabledDevices => 'Włączone urządzenia';

  @override
  String get adminEnabledChannels => 'Włączone kanały';

  @override
  String get adminAuthProvider => 'Dostawca uwierzytelniania';

  @override
  String get adminPasswordResetProvider => 'Dostawca resetowania hasła';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maksymalna liczba nieudanych prób logowania przed zablokowaniem';

  @override
  String get adminLoginAttemptsHint =>
      'Ustaw 0, aby użyć wartości domyślnej, lub -1, aby wyłączyć blokadę.';

  @override
  String get adminSyncPlayAccess => 'Dostęp do SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Zezwalaj na tworzenie grup i dołączanie do nich';

  @override
  String get adminSyncPlayJoin => 'Zezwalaj na dołączanie do grup';

  @override
  String get adminSyncPlayNone => 'Brak dostępu';

  @override
  String get adminContentDeletionFolders => 'Zezwalaj na usuwanie treści z';

  @override
  String get adminResetPasswordWarning =>
      'Spowoduje to usunięcie hasła. Użytkownik będzie mógł zalogować się bez hasła.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Serwer zwrócił HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Czy na pewno chcesz usunąć użytkownika $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Usunięto użytkownika „$name”';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Nie udało się usunąć użytkownika: $error';
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
    return 'Nie udało się utworzyć klucza: $error';
  }

  @override
  String get adminKeyTokenMissing => 'Brak tokena klucza w odpowiedzi serwera';

  @override
  String get adminRevokeApiKey => 'Unieważnij klucz API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Unieważnić klucz dla $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Klucz API unieważniony';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nie udało się unieważnić klucza: $error';
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
    return 'Token: $token\\nUtworzono: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Utwórz kopię zapasową';

  @override
  String get adminBackupInclude => 'Wybierz, co uwzględnić w kopii zapasowej.';

  @override
  String get adminBackupDatabase => 'Baza danych';

  @override
  String get adminBackupDatabaseAlways => 'Zawsze uwzględniana';

  @override
  String get adminBackupMetadata => 'Metadane';

  @override
  String get adminBackupSubtitles => 'Napisy';

  @override
  String get adminBackupTrickplay => 'Obrazy trickplay';

  @override
  String get adminCreatingBackup => 'Tworzenie kopii zapasowej...';

  @override
  String get adminBackupCreated => 'Kopia zapasowa została utworzona pomyślnie';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Nie udało się utworzyć kopii zapasowej: $error';
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
    return 'Nie udało się wczytać manifestu: $error';
  }

  @override
  String get adminConfirmRestore => 'Potwierdź Przywróć';

  @override
  String get adminRestoringBackup => 'Przywracam kopię zapasową...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nie udało się przywrócić kopii zapasowej: $error';
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
    return 'Zapisano w $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nie udało się zapisać pliku: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nie udało się wczytać $fileName';
  }

  @override
  String get adminSearchInLog => 'Szukaj w logu';

  @override
  String get adminNoMatchingLines => 'Brak pasujących linii';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nie udało się wczytać zadań: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nie znaleziono zaplanowanych zadań';

  @override
  String get adminNoTasksMatchFilter =>
      'Żadne zadania nie pasują do bieżącego filtra';

  @override
  String adminTaskStartFailed(String error) {
    return 'Nie udało się uruchomić zadania: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Nie udało się zatrzymać zadania: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nie udało się wczytać zadania: $error';
  }

  @override
  String get adminRunNow => 'Uruchom teraz';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Nie udało się usunąć wyzwalacza: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nie udało się dodać wyzwalacza: $error';
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
    return '$hours godz.';
  }

  @override
  String get adminDayOfWeek => 'Dzień tygodnia';

  @override
  String get adminSearchPlugins => 'Wyszukaj wtyczki...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Nie udało się przełączyć wtyczki: $error';
  }

  @override
  String get adminUninstallPlugin => 'Odinstaluj wtyczkę';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Czy na pewno chcesz odinstalować „$name”?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Nie udało się odinstalować wtyczki: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nie udało się zainstalować pakietu: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Nie udało się zainstalować aktualizacji: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nie udało się wczytać wtyczek: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Żadna wtyczka nie pasuje do Twojego wyszukiwania';

  @override
  String get adminNoPluginsInstalled => 'Brak zainstalowanych wtyczek';

  @override
  String adminInstallUpdate(String version) {
    return 'Zainstaluj aktualizację (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nie udało się wczytać katalogu: $error';
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
    return '„$name” zostanie usunięta po ponownym uruchomieniu serwera';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Nie udało się odinstalować: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Aktualizowanie „$name” do v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nie można otworzyć ustawień: brak tokena autoryzacji.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Nie udało się wczytać wtyczki: $error';
  }

  @override
  String get adminPluginNotFound => 'Nie znaleziono wtyczki';

  @override
  String adminPluginVersion(String version) {
    return 'Wersja $version';
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
    return 'Czy na pewno chcesz usunąć „$name”?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nie udało się zapisać repozytoriów: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nie udało się wczytać repozytoriów: $error';
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
    return 'Nie można wczytać ustawień wtyczki: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nie można otworzyć $uri';
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
  String get adminTrickplaySaved => 'Ustawienia Trickplay zostały zapisane';

  @override
  String get adminTrickplayLoadFailed =>
      'Nie udało się załadować ustawień Trickplay';

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
  String get adminBaseUrlHint => 'np. /jellyfin';

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
    return 'Nie udało się wczytać metadanych: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nie udało się zapisać metadanych: $error';
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
    return 'Nie udało się odświeżyć metadanych: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nie znaleziono zdalnych dopasowań';

  @override
  String get adminRemoteResults => 'Wyniki zdalne';

  @override
  String get adminRemoteMetadataApplied => 'Zastosowano zdalne metadane';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Wyszukiwanie zdalne nie powiodło się: $error';
  }

  @override
  String get adminUpdateContentType => 'Zaktualizuj typ zawartości';

  @override
  String get adminContentType => 'Typ treści';

  @override
  String get adminContentTypeUpdated => 'Zaktualizowano typ zawartości';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nie udało się zaktualizować typu treści: $error';
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
    return 'Zaktualizowano obraz $imageType';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nie udało się pobrać obrazu: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nieobsługiwany format obrazu';

  @override
  String get adminImageReadFailed => 'Nie udało się odczytać wybranego obrazu';

  @override
  String adminImageUploaded(String imageType) {
    return 'Przesłano obraz $imageType';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nie udało się przesłać obrazu: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Usuń obraz $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Usunięto obraz $imageType';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nie udało się usunąć obrazu: $error';
  }

  @override
  String get adminAllProviders => 'Wszyscy dostawcy';

  @override
  String get adminNoRemoteImages => 'Nie znaleziono zdalnych obrazów';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Wykrywanie tunerów nie powiodło się: $error';
  }

  @override
  String get adminAddTuner => 'Dodaj tuner';

  @override
  String get adminEditTuner => 'Edytuj tuner';

  @override
  String get adminTunerTypeM3u => 'Tuner M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Plik lub URL';

  @override
  String get adminTunerIpAddress => 'Adres IP tunera';

  @override
  String get adminTunerFriendlyName => 'Nazwa przyjazna';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limit jednoczesnych połączeń';

  @override
  String get adminTunerCountHelp =>
      'Maksymalna liczba strumieni obsługiwanych jednocześnie przez tuner. Ustaw 0, aby znieść limit.';

  @override
  String get adminTunerFallbackBitrate =>
      'Zapasowa maksymalna przepływność strumienia';

  @override
  String get adminTunerImportFavoritesOnly => 'Importuj tylko ulubione kanały';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Zezwalaj na transkodowanie sprzętowe';

  @override
  String get adminTunerAllowFmp4 => 'Zezwalaj na kontener transkodowania fMP4';

  @override
  String get adminTunerAllowStreamSharing =>
      'Zezwalaj na współdzielenie strumieni';

  @override
  String get adminTunerEnableStreamLooping => 'Włącz zapętlanie strumienia';

  @override
  String get adminTunerIgnoreDts => 'Ignoruj DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Czytaj wejście z natywną liczbą klatek';

  @override
  String get adminEditProvider => 'Edytuj dostawcę';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Plik lub URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefiks filmów';

  @override
  String get adminXmltvMovieCategories => 'Kategorie filmów';

  @override
  String get adminXmltvCategoriesHelp =>
      'Oddziel wiele kategorii pionową kreską.';

  @override
  String get adminXmltvKidsCategories => 'Kategorie dla dzieci';

  @override
  String get adminXmltvNewsCategories => 'Kategorie wiadomości';

  @override
  String get adminXmltvSportsCategories => 'Kategorie sportowe';

  @override
  String get adminSdUsername => 'Nazwa użytkownika';

  @override
  String get adminSdPassword => 'Hasło';

  @override
  String get adminSdCountry => 'Kraj';

  @override
  String get adminSdCountrySelect => 'Wybierz kraj';

  @override
  String get adminSdPostalCode => 'Kod pocztowy';

  @override
  String get adminSdGetListings => 'Pobierz programy';

  @override
  String get adminSdListings => 'Programy';

  @override
  String get adminEnableAllTuners => 'Włącz wszystkie tunery';

  @override
  String get adminTunerType => 'Typ tunera';

  @override
  String get adminTunerAdded => 'Dodano tunera';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nie udało się dodać tunera: $error';
  }

  @override
  String get adminAddGuideProvider => 'Dodaj dostawcę przewodników';

  @override
  String get adminProviderType => 'Typ dostawcy';

  @override
  String get adminProviderAdded => 'Dodano dostawcę';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nie udało się dodać dostawcy: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nie udało się usunąć tunera: $error';
  }

  @override
  String get adminTunerResetRequested => 'Zażądano resetu tunera';

  @override
  String adminTunerResetFailed(String error) {
    return 'Nie udało się zresetować tunera: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'Ten typ tunera nie obsługuje resetowania.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nie udało się usunąć dostawcy: $error';
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
  String get adminMovieRecordingPath => 'Ścieżka nagrań filmów';

  @override
  String get adminGuideDays => 'Liczba dni danych programu';

  @override
  String get adminGuideDaysAuto => 'Automatycznie';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dni';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Ścieżka aplikacji przetwarzania końcowego';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Argumenty przetwarzania końcowego';

  @override
  String get adminSaveRecordingNfo => 'Zapisuj metadane NFO nagrań';

  @override
  String get adminSaveRecordingImages => 'Zapisuj obrazy nagrań';

  @override
  String get adminLiveTvSectionTiming => 'Czas';

  @override
  String get adminLiveTvSectionPaths => 'Ścieżki nagrań';

  @override
  String get adminLiveTvSectionPostProcessing => 'Przetwarzanie końcowe';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Dane programu: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'Ustawienia nagrywania zostały zapisane';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nie udało się zapisać ustawień: $error';
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
    return 'Nie udało się zaktualizować mapowań: $error';
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
  String get adminRefreshGuideData => 'Odśwież dane programu';

  @override
  String get adminGuideRefreshStarted =>
      'Rozpoczęto odświeżanie danych programu';

  @override
  String get adminGuideRefreshUnavailable =>
      'Zadanie odświeżania programu jest niedostępne na tym serwerze.';

  @override
  String get adminAddProvider => 'Dodaj dostawcę';

  @override
  String get adminNoListingProviders =>
      'Nie skonfigurowano żadnych dostawców list';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Ścieżka nagrań: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Ścieżka seriali: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Zapas przed: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Zapas po: $minutes min';
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
    return 'Przywrócić kopię zapasową $name teraz?';
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
  String get adminApply => 'Zastosuj';

  @override
  String get adminNotSet => 'Nie ustawiono';

  @override
  String get adminReset => 'Resetuj';

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
    return '$minutes min temu';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours godz. temu';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days dni temu';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nie udało się wczytać $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count dopasowań';
  }

  @override
  String get adminLogViewerNoMatches => 'Brak pasujących linii';

  @override
  String get adminMetadataEditorTitle => 'Edytor metadanych';

  @override
  String get adminMetadataIdentify => 'Zidentyfikuj';

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
    return 'Zaktualizowano obraz $imageType';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Przesłano obraz $imageType';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Usunięto obraz $imageType';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nie udało się pobrać obrazu: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Nie udało się odczytać wybranego obrazu';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nie udało się przesłać obrazu: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Usuń obraz $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Spowoduje to usunięcie bieżącego obrazu z elementu.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nie udało się usunąć obrazu: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Wybierz obraz $imageType';
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
    return 'Dostępna aktualizacja: v$version';
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
    return 'Zainstaluj aktualizację (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Żaden pakiet nie pasuje do Twojego wyszukiwania';

  @override
  String get adminPluginsCatalogEmpty => 'Brak dostępnych pakietów';

  @override
  String adminPluginsInstalling(String name) {
    return 'Trwa instalowanie „$name”...';
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
    return 'Ustawienia: $name';
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
    return 'Nie udało się wczytać repozytoriów: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Usuń repozytorium';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Czy na pewno chcesz usunąć „$name”?';
  }

  @override
  String get adminReposRemove => 'Usuń';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nie udało się zapisać repozytoriów: $error';
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
  String get adminBrandingSplashUpload => 'Prześlij obraz';

  @override
  String get adminBrandingSplashUploaded => 'Zaktualizowano ekran powitalny';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Nie udało się przesłać ekranu powitalnego';

  @override
  String get adminBrandingSplashDeleted => 'Usunięto ekran powitalny';

  @override
  String get adminBrandingNoSplash => 'Brak własnego ekranu powitalnego';

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
  String get adminPlaybackQsvDevice => 'Urządzenie QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Włącz ulepszony dekoder NVDEC';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferuj natywny sprzętowy dekoder systemu';

  @override
  String get adminPlaybackColorDepth =>
      'Głębia kolorów dekodowania sprzętowego';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Dekodowanie 10-bitowego HEVC';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Dekodowanie 10-bitowego VP9';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Dekodowanie HEVC RExt 8/10-bit';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Dekodowanie HEVC RExt 12-bit';

  @override
  String get adminPlaybackHwEncodingSection => 'Kodowanie sprzętowe';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Zezwalaj na kodowanie HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Zezwalaj na kodowanie AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Włącz niskoenergetyczny koder Intel H.264';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Włącz niskoenergetyczny koder Intel HEVC';

  @override
  String get adminPlaybackToneMapping => 'Mapowanie tonów';

  @override
  String get adminPlaybackEnableTonemapping => 'Włącz mapowanie tonów';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Włącz mapowanie tonów VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Włącz mapowanie tonów VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algorytm mapowania tonów';

  @override
  String get adminPlaybackTonemappingMode => 'Tryb mapowania tonów';

  @override
  String get adminPlaybackTonemappingRange => 'Zakres mapowania tonów';

  @override
  String get adminPlaybackTonemappingDesat => 'Desaturacja mapowania tonów';

  @override
  String get adminPlaybackTonemappingPeak => 'Szczyt mapowania tonów';

  @override
  String get adminPlaybackTonemappingParam => 'Parametr mapowania tonów';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Jasność mapowania tonów VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Kontrast mapowania tonów VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Ustawienia wstępne i jakość';

  @override
  String get adminPlaybackEncoderPreset => 'Ustawienie wstępne kodera';

  @override
  String get adminPlaybackH264Crf => 'CRF kodowania H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF kodowania H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Metoda usuwania przeplotu';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Podwój liczbę klatek przy usuwaniu przeplotu';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Włącz kodowanie audio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Wzmocnienie downmiksu audio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algorytm downmiksu do stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Maksymalny rozmiar kolejki muksowania';

  @override
  String get adminPlaybackAutoOption => 'Auto';

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
  String get adminTaskStop => 'Zatrzymaj';

  @override
  String get adminRunningTasks => 'Uruchomione zadania';

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
    return 'Codziennie o $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Co $day o $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Co $duration';
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
      other: '$count godz.',
      one: '1 godzina',
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
    return '$days dni temu';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours godz. temu';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes min temu';
  }

  @override
  String get adminActivityNow => 'Teraz';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours godz.';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days dni';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day.$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Skonfiguruj generowanie obrazów Trickplay dla miniatur podglądu przewijania.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Publiczny port HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Bazowy adres URL';

  @override
  String get adminNetworkingBaseUrlHint => 'np. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Publiczny port HTTP';

  @override
  String get adminNetworkingRequireHttps => 'Wymagaj HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Przekierowuj wszystkie zdalne żądania na HTTPS. Nie działa, jeśli serwer nie ma ważnego certyfikatu.';

  @override
  String get adminNetworkingCertPassword => 'Hasło certyfikatu';

  @override
  String get adminNetworkingIpSettings => 'Ustawienia IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Włącz IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Włącz IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Włącz automatyczne mapowanie portów';

  @override
  String get adminNetworkingLocalSubnets => 'Sieci LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Lista adresów IP lub podsieci CIDR (oddzielonych przecinkiem lub nową linią) traktowanych jako sieć lokalna.';

  @override
  String get adminNetworkingPublishedUris => 'Opublikowane adresy URI serwera';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Przypisz podsieć lub adres do opublikowanego adresu URL, np. all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'Opóźnienie ograniczania (sekundy)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Zezwalaj na wyodrębnianie napisów w locie';

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
    return 'Nie udało się zaktualizować typu treści: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Próg powolnej reakcji (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Włącz ostrzeżenia o wolnych odpowiedziach';

  @override
  String get adminGeneralQuickConnect => 'Włącz Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Serwer';

  @override
  String get adminGeneralSectionMetadata => 'Metadane';

  @override
  String get adminGeneralSectionPaths => 'Ścieżki';

  @override
  String get adminGeneralSectionPerformance => 'Wydajność';

  @override
  String get adminGeneralCachePath => 'Ścieżka pamięci podręcznej';

  @override
  String get adminGeneralMetadataPath => 'Ścieżka metadanych';

  @override
  String get adminGeneralServerName => 'Nazwa serwera';

  @override
  String get adminGeneralDisplayLanguage => 'Preferowany język wyświetlania';

  @override
  String get adminSettingsLoadFailed => 'Nie udało się załadować ustawień';

  @override
  String get adminDiscover => 'Odkryć';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nie udało się zaktualizować mapowań: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limit czasu: $duration';
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
      other: '# uczestników',
      one: '# uczestnik',
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
    return 'Element $index';
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
    return '$userName dołączył do grupy SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName opuścił grupę SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Odmowa dostępu do SyncPlay';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nie masz dostępu do jednego lub więcej elementów w tej grupie SyncPlay. Poproś właściciela grupy o zweryfikowanie uprawnień biblioteki lub wybranie innej kolejki.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synchronizowanie odtwarzania z $groupName';
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
      other: '# odnalezionych wierszy',
      one: '# odnaleziony wiersz',
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
  String get offlineBannerTitle => 'Jesteś offline';

  @override
  String get offlineBannerSubtitle => 'Wyświetlamy Twoje pobrane pliki';

  @override
  String get offlineBannerAction => 'Pobrane';

  @override
  String get serverUnreachableBannerTitle =>
      'Nie można połączyć się z serwerem';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Odtwarzanie z pobranych, dopóki serwer nie wróci';

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
    return 'Sterowanie przesyłaniem nie powiodło się: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Sterowanie: $kind';
  }

  @override
  String get castDeviceVolume => 'Głośność urządzenia';

  @override
  String get castVolumeUnavailable => 'Nie płynny';

  @override
  String castStopKind(String kind) {
    return 'Zatrzymaj $kind';
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
    return 'Wprowadź $length-cyfrowy PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Wprowadź swój $length-cyfrowy PIN';
  }

  @override
  String get pinIncorrect => 'Nieprawidłowy PIN';

  @override
  String get pinMismatch => 'PIN-y nie pasują';

  @override
  String get pinForgot => 'Zapomniałeś kodu PIN?';

  @override
  String get pinClear => 'Wyczyść';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Żądanie Quick Connect zostało zatwierdzone.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kod Quick Connect jest nieprawidłowy lub wygasł.';

  @override
  String get quickConnectNotSupported =>
      'Funkcja Quick Connect nie jest obsługiwana na tym serwerze.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Autoryzacja kodu Quick Connect nie powiodła się.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect jest wyłączony na tym serwerze.';

  @override
  String get quickConnectForbidden =>
      'Twoje konto nie może autoryzować tego żądania Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Nie znaleziono kodu Quick Connect. Wypróbuj nowy kod.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect nie powiódł się: $message';
  }

  @override
  String get quickConnectEnterCode => 'Wpisz kod';

  @override
  String get quickConnectAuthorize => 'Autoryzować';

  @override
  String remoteCommandFailed(String error) {
    return 'Polecenie nie powiodło się: $error';
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
    return 'Nie udało się rozpocząć przesyłania: $error';
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
    return 'Pobieranie $name...';
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
  String get shuffleGenre => 'Gatunek';

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
  String get stillWatchingStop => 'Zatrzymaj';

  @override
  String get stillWatchingContinue => 'Kontynuować';

  @override
  String skipSegment(String segment) {
    return 'Pomiń $segment';
  }

  @override
  String get liveTv => 'Telewizja na żywo';

  @override
  String get continueWatchingAndNextUp => 'Kontynuuj oglądanie i następny';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Pobieranie $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Pobieranie $fileName';
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
  String get contextMenuHideFromContinueWatching =>
      'Ukryj z Kontynuuj oglądanie';

  @override
  String get contextMenuHideFromNextUp => 'Ukryj z Następne';

  @override
  String get contextMenuAddToCollection => 'Dodaj do kolekcji';

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
  String get settingsConnectionSection => 'POŁĄCZENIE';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Zezwalaj na certyfikaty samopodpisane';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Ufaj serwerom używającym samopodpisanych certyfikatów TLS lub certyfikatów z prywatnego CA. Włączaj tylko dla serwerów, które kontrolujesz. Ta opcja wyłącza weryfikację certyfikatów dla wszystkich połączeń.';

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
  String get settingsDetailsScreen => 'Ekran szczegółów';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Styl, rozmycie tła i zachowanie zakładek';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Pokaż przycisk Seerr na pasku nawigacji';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Zawsze pokazuj etykiety tekstowe na górnym pasku nawigacji';

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
  String get useNativeEmulator => 'Native Emulation';

  @override
  String get useNativeEmulatorSubtitle =>
      'Play games with native cores instead of the EmulatorJS web player';

  @override
  String get emulatorCores => 'Emulator Cores';

  @override
  String get emulatorCoresSubtitle => 'Download systems to play games natively';

  @override
  String get emulatorCoresDescription =>
      'Choose which systems to install. Cores are provided by the libretro project and let games run natively instead of in a browser view.';

  @override
  String get emulatorCoreDownloading => 'Downloading';

  @override
  String get emulatorCoreUnavailable => 'Not available for this device';

  @override
  String get emulatorCoreDownloadFailed =>
      'Could not download the core. Check your connection and try again.';

  @override
  String get downloadedGames => 'Downloaded Games';

  @override
  String get downloadedGamesSubtitle => 'Free up space used by game files';

  @override
  String get downloadedGamesDescription =>
      'Games are copied to this device before they play. Remove the ones you have finished to free up space. Saves are kept on the server and are not deleted.';

  @override
  String get downloadedGamesEmpty =>
      'No games have been downloaded to this device yet.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count games, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Remove All';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Remove $title from this device? It will download again the next time you play it.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Remove all downloaded games from this device? They will download again the next time you play them.';

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
  String get settingsSupportMoonfinSubtitle => 'Postaw kawę deweloperowi';

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
      other: '# informacji licencyjnych',
      one: '# informacja licencyjna',
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
  String get settingsMediaSegmentCountdown => 'Odliczanie segmentu multimediów';

  @override
  String get settingsProgressBar => 'Pasek postępu';

  @override
  String get settingsTimer => 'Licznik czasu';

  @override
  String get settingsNone => 'Brak';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (starszy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (starsza wersja)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (zalecany)';

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
    return 'Ostatnio wydane: $libraryName';
  }

  @override
  String get autoplayNextEpisode =>
      'Automatyczne odtwarzanie następnego odcinka';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automatycznie odtwarzaj następny odcinek, gdy jest dostępny.';

  @override
  String get skipSilenceTitle => 'Pomijaj ciszę';

  @override
  String get skipSilenceSubtitle =>
      'Automatycznie pomijaj ciche fragmenty dźwięku, jeśli strumień to obsługuje.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Zezwalaj na zewnętrzne efekty audio';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Pozwól aplikacjom z korektorem i efektami (np. Wavelet) podłączać się do sesji odtwarzania Media3.';

  @override
  String get disableTunnelingTitle => 'Wyłącz tunelowanie';

  @override
  String get disableTunnelingSubtitle =>
      'Wymuś odtwarzanie bez tunelowania. Przydatne na urządzeniach, na których tunelowanie powoduje przerwy w obrazie lub dźwięku.';

  @override
  String get enableTunnelingTitle => 'Włącz tunelowanie';

  @override
  String get enableTunnelingSubtitle =>
      'Zaawansowane. Kieruje dźwięk i obraz sprzężoną ścieżką sprzętową. Domyślnie wyłączone, ponieważ na niektórych urządzeniach powoduje przerwy w obrazie i dźwięku.';

  @override
  String get mapDolbyVisionP7Title => 'Mapuj Dolby Vision profil 7 na HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Odtwarzaj strumienie Dolby Vision profil 7 jako HEVC zgodny z HDR10 na urządzeniach bez obsługi Dolby Vision.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Używaj osadzonych stylów napisów';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Stosuj kolory, czcionki i pozycjonowanie osadzone w ścieżce napisów. Wyłącz, aby korzystać z własnych preferencji stylu napisów.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Używaj osadzonych rozmiarów czcionek napisów';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Stosuj wskazówki dotyczące rozmiaru czcionki osadzone w ścieżce napisów. Wyłącz, aby korzystać z rozmiaru napisów z Twoich preferencji stylu.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Pokaż szczegóły multimediów';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Pokazuj szczegóły wybranego elementu u góry stron biblioteki.';

  @override
  String get hideBackdropsInLibraries => 'Ukrywać tła podczas przeglądania?';

  @override
  String get useDetailedSubHeadings => 'Używaj szczegółowych podtytułów';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Pokazuj szczegółowy lub minimalny podwiersz na stronach biblioteki.';

  @override
  String get savedThemesDeleteDialogTitle => 'Usunąć zapisany motyw?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Usunąć „$themeName” z pamięci podręcznej tego urządzenia?';
  }

  @override
  String get themeStore => 'Sklep z motywami';

  @override
  String get themeStoreSubtitle => 'Przeglądaj i zapisuj motywy społeczności';

  @override
  String get themeStoreDescription =>
      'Zapisz motyw, aby używać go jak innych zapisanych motywów.';

  @override
  String get themeStoreEmpty => 'Obecnie nie ma dostępnych motywów.';

  @override
  String get themeStoreLoadFailed =>
      'Nie udało się wczytać Sklepu z motywami. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String get themeStoreSave => 'Zapisz';

  @override
  String get themeStoreSaveAndApply => 'Zapisz i zastosuj';

  @override
  String get themeStoreSaved => 'Zapisano';

  @override
  String get themeStoreInvalidMessage => 'Nie udało się wczytać tego motywu.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Zapisano „$themeName”.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Usunięto „$themeName” z tego urządzenia.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nie udało się usunąć „$themeName”.';
  }

  @override
  String get savedThemesTitle => 'Zapisane motywy';

  @override
  String get savedThemesDescription =>
      'To motywy pobrane z wtyczki Moonfin dla bieżącego serwera. Usunięcie kasuje wyłącznie tę lokalną kopię.';

  @override
  String get savedThemesEmpty =>
      'Nie znaleziono zapisanych motywów dla tego serwera.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Obecnie aktywny';
  }

  @override
  String get savedThemesDeleteTooltip => 'Usuń zapisany motyw';

  @override
  String get savedThemesManageSubtitle =>
      'Zarządzaj pobranymi motywami wtyczki na tym urządzeniu';

  @override
  String get themeEditor => 'Edytor motywów';

  @override
  String get themeEditorSubtitle =>
      'Otwórz Edytor motywów Moonfin w przeglądarce';

  @override
  String get homeScreen => 'Ekran główny';

  @override
  String get bottomBar => 'Dolny pasek';

  @override
  String get homeRowsStyleClassic => 'Klasyczny';

  @override
  String get homeRowsStyleModern => 'Nowoczesny';

  @override
  String get homeRowsSection => 'Wiersze ekranu głównego';

  @override
  String get homeRowDisplay => 'Wyświetlanie wierszy ekranu głównego';

  @override
  String get homeRowSections => 'Sekcje wierszy ekranu głównego';

  @override
  String get homeRowToggles => 'Przełączniki wierszy ekranu głównego';

  @override
  String get homeRowTogglesSubtitle =>
      'Włącz lub wyłącz kategorie wierszy ekranu głównego oparte na bibliotekach';

  @override
  String get homeRowTogglesDescription =>
      'Włącz poniższe przełączniki, aby wyświetlać wiersze w sekcjach ekranu głównego.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Klasyczny zachowuje typ obrazu na wiersz i nakładkę informacyjną. Nowoczesny używa wierszy portret–tło.';

  @override
  String get displayFavoritesRows => 'Pokaż wiersze ulubionych';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Pokazuj wiersze ulubionych filmów, seriali i innych ulubionych w sekcjach ekranu głównego.';

  @override
  String get favoritesRowSorting => 'Sortowanie wierszy ulubionych';

  @override
  String get favoritesRowSortingDescription =>
      'Sortuj wiersze ulubionych według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get displayCollectionsRows => 'Pokaż wiersze kolekcji';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Pokazuj wiersze kolekcji w sekcjach ekranu głównego.';

  @override
  String get collectionsRowSorting => 'Sortowanie wierszy kolekcji';

  @override
  String get collectionsRowSortingDescription =>
      'Sortuj wiersze kolekcji według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get displayGenresRows => 'Pokaż wiersze gatunków';

  @override
  String get displayGenresRowsSubtitle =>
      'Pokazuj wiersze gatunków w sekcjach ekranu głównego.';

  @override
  String get genresRowSorting => 'Sortowanie wierszy gatunków';

  @override
  String get genresRowSortingDescription =>
      'Sortuj wiersze gatunków według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get genresRowItems => 'Elementy wierszy gatunków';

  @override
  String get genresRowItemsDescription =>
      'Pokazuj filmy, seriale lub jedno i drugie w wierszach gatunków.';

  @override
  String get displayPlaylistsRows => 'Pokaż wiersze playlist';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Pokazuj wiersze playlist w sekcjach ekranu głównego.';

  @override
  String get playlistsRowSorting => 'Sortowanie wierszy playlist';

  @override
  String get playlistsRowSortingDescription =>
      'Sortuj wiersze playlist według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get displayAudioRows => 'Pokaż wiersze audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Pokazuj wiersze audio w sekcjach ekranu głównego.';

  @override
  String get audioRowsSorting => 'Sortowanie wierszy audio';

  @override
  String get audioRowsSortingDescription =>
      'Sortuj wiersze audio według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get audioPlaylists => 'Playlisty audio';

  @override
  String get appearance => 'Wygląd';

  @override
  String get layout => 'Układ';

  @override
  String get theme => 'Motyw';

  @override
  String get keyboard => 'Klawiatura';

  @override
  String get navButtons => 'Przyciski';

  @override
  String get rendering => 'Renderowanie';

  @override
  String get mpvConfiguration => 'Konfiguracja MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Zewnętrzna aplikacja odtwarzacza';

  @override
  String get externalPlayerAppDescription =>
      'Ustaw zewnętrzny odtwarzacz, aby włączyć opcję odtwarzania po długim naciśnięciu';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Pokazuj wybór aplikacji przy rozpoczęciu odtwarzania.';

  @override
  String get loadingInstalledPlayers =>
      'Wczytywanie zainstalowanych odtwarzaczy...';

  @override
  String get connection => 'Połączenie';

  @override
  String get audioTranscodeTarget => 'Docelowy format transkodowania audio';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Obsługiwane na tym urządzeniu';

  @override
  String get notSupportedOnThisDevice => 'Nieobsługiwane na tym urządzeniu';

  @override
  String get settingsAudioDtsXPassthrough => 'Passthrough DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Przesyłaj strumień DTS:X (DTS UHD) do zewnętrznego dekodera.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Passthrough TrueHD z Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Zachowanie odtwarzacza';

  @override
  String get playbackEnhancements => 'Ulepszenia odtwarzania';

  @override
  String get alwaysOn => 'Zawsze włączone.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Zastąp Pomiń napisy końcowe ekranem Następne';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Pokazuj nakładkę Następne zamiast przycisku Pomiń napisy końcowe.';

  @override
  String get playerRouting => 'Kierowanie odtwarzacza';

  @override
  String get preferSoftwareDecoders => 'Preferuj dekodery programowe';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Używaj FFmpeg (audio) i libgav1 (AV1) przed dekoderami sprzętowymi. Wyłącz, jeśli passthrough audio przez HDMI przestaje działać.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Otwieraj odtwarzanie wideo w wybranej zewnętrznej aplikacji na Android TV.';

  @override
  String get automaticQueuing => 'Automatyczne kolejkowanie';

  @override
  String get preferSdhSubtitles => 'Preferuj napisy SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorytetowo wybieraj ścieżki napisów SDH/CC przy automatycznym wyborze.';

  @override
  String get webDiagnostics => 'Diagnostyka sieci Web';

  @override
  String get webDiagnosticsTitle => 'Diagnostyka Moonfin Web';

  @override
  String get webDiagnosticsIntro =>
      'Użyj tej strony, aby zdiagnozować problemy z połączeniem w przeglądarce (CORS, mieszana treść i ustawienia wykrywania).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Wykryto błąd mieszanej treści';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Wykryto błąd CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin wykrył stronę HTTPS próbującą wywołać adres URL serwera po HTTP. Przeglądarki blokują takie żądanie, zanim dotrze ono do serwera.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin wykrył błąd żądania na poziomie przeglądarki, który zwykle wynika z braku nagłówków CORS lub preflight na serwerze multimediów.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Docelowy URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Szczegóły: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Bieżący kontekst uruchomieniowy';

  @override
  String get webDiagnosticsOrigin => 'Origin';

  @override
  String get webDiagnosticsScheme => 'Schemat';

  @override
  String get webDiagnosticsPluginMode => 'Tryb wtyczki';

  @override
  String get webDiagnosticsWebRtcScan => 'Skanowanie WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'Wymuszony URL serwera';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Domyślny URL serwera';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL proxy wykrywania';

  @override
  String get notConfigured => 'nie skonfigurowano';

  @override
  String get webDiagnosticsMixedContent => 'Mieszana treść';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ta strona jest wczytana przez HTTPS, ale co najmniej jeden ze skonfigurowanych adresów URL używa HTTP. Przeglądarki blokują wywołania API po HTTP ze stron HTTPS.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Rozwiązanie: udostępnij serwer multimediów lub punkt końcowy proxy przez HTTPS albo ładuj Moonfin przez HTTP wyłącznie w zaufanych sieciach lokalnych.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Na podstawie bieżących ustawień nie wykryto oczywistej konfiguracji z mieszaną treścią.';

  @override
  String get webDiagnosticsCorsChecklist => 'Lista kontrolna CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Zezwól na origin przeglądarki w Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Uwzględnij Authorization, X-Emby-Authorization i X-Emby-Token w Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Udostępnij Content-Range i Accept-Ranges dla przesyłania strumieniowego i przewijania.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Zwracaj 204 na żądania preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Przykładowy fragment nagłówków (w stylu nginx)';

  @override
  String get note => 'Uwaga';

  @override
  String get webDiagnosticsNonWebNote =>
      'Ta ścieżka diagnostyczna jest przeznaczona dla wersji webowych. Jeśli widzisz ją na innej platformie, te testy mogą nie mieć zastosowania.';

  @override
  String get backToServerSelect => 'Wróć do wyboru serwera';

  @override
  String get signOutAllUsers => 'Wyloguj wszystkich użytkowników';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Uprawnienie do mikrofonu zostało trwale odrzucone. Włącz je w ustawieniach systemu.';

  @override
  String get voiceSearchPermissionRequired =>
      'Wyszukiwanie głosowe wymaga uprawnienia do mikrofonu.';

  @override
  String get voiceSearchNoMatch => 'Nie udało się rozpoznać. Spróbuj ponownie.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nie wykryto mowy.';

  @override
  String get voiceSearchMicrophoneError => 'Błąd mikrofonu.';

  @override
  String get voiceSearchNeedsInternet =>
      'Wyszukiwanie głosowe wymaga internetu.';

  @override
  String get voiceSearchServiceBusy =>
      'Usługa głosowa jest zajęta. Spróbuj ponownie.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Uprawnienie do mikrofonu zostało trwale odrzucone.';

  @override
  String get microphonePermissionDenied =>
      'Uprawnienie do mikrofonu zostało odrzucone.';

  @override
  String get speechRecognitionUnavailable =>
      'Rozpoznawanie mowy jest niedostępne na tym urządzeniu.';

  @override
  String get openIosRoutePicker => 'Otwórz selektor wyjścia iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Selektor wyjścia AirPlay jest niedostępny na tym urządzeniu.';

  @override
  String get videos => 'Filmy wideo';

  @override
  String get programs => 'Programy';

  @override
  String get songs => 'Utwory';

  @override
  String get photoAlbums => 'Albumy zdjęć';

  @override
  String get photos => 'Zdjęcia';

  @override
  String get people => 'Osoby';

  @override
  String get recentlyReleasedEpisodes => 'Ostatnio wydane odcinki';

  @override
  String get watchAgain => 'Obejrzyj ponownie';

  @override
  String get guestAppearances => 'Występy gościnne';

  @override
  String get appearancesSeerr => 'Występy (Seerr)';

  @override
  String get crewContributionsSeerr => 'Udział ekipy (Seerr)';

  @override
  String get watchWithGroup => 'Oglądaj z grupą';

  @override
  String get errors => 'Błędy';

  @override
  String get warnings => 'Ostrzeżenia';

  @override
  String get disk => 'Dysk';

  @override
  String get openInBrowser => 'Otwórz w przeglądarce';

  @override
  String get embeddedBrowserNotAvailable =>
      'Wbudowana przeglądarka jest niedostępna na tej platformie.';

  @override
  String get adminRestartServerConfirmation =>
      'Czy na pewno chcesz ponownie uruchomić serwer?';

  @override
  String get adminShutdownServerConfirmation =>
      'Czy na pewno chcesz wyłączyć serwer? Trzeba będzie uruchomić go ręcznie.';

  @override
  String get internal => 'Wewnętrzny';

  @override
  String get idle => 'Bezczynny';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nie znaleziono użytkowników';

  @override
  String get adminNoUsersMatchSearch =>
      'Żaden użytkownik nie pasuje do wyszukiwania';

  @override
  String get adminNoDevicesFound => 'Nie znaleziono urządzeń';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Żadne urządzenie nie pasuje do bieżących filtrów';

  @override
  String get passwordSet => 'Hasło ustawione';

  @override
  String get noPasswordConfigured => 'Nie skonfigurowano hasła';

  @override
  String get remoteAccess => 'Dostęp zdalny';

  @override
  String get localOnly => 'Tylko lokalnie';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Nie udało się wczytać statystyk multimediów';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Łączne statystyki ze wszystkich bibliotek multimediów.';

  @override
  String get analyticsTopArtists => 'Najpopularniejsi wykonawcy';

  @override
  String get analyticsTopAuthors => 'Najpopularniejsi autorzy';

  @override
  String get analyticsTopContributors => 'Najpopularniejsi twórcy';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotek',
      one: '1 biblioteka',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Brak zindeksowanych danych o multimediach dla tego wyboru.';

  @override
  String get analyticsLibraryDetails => 'Szczegóły biblioteki';

  @override
  String get analyticsLibraryBreakdown => 'Podział bibliotek';

  @override
  String get analyticsNoLibrariesAvailable => 'Brak dostępnych bibliotek.';

  @override
  String get adminServerAdministrationTitle => 'Administracja serwerem';

  @override
  String get adminServerPathData => 'Dane';

  @override
  String get adminServerPathImageCache => 'Pamięć podręczna obrazów';

  @override
  String get adminServerPathCache => 'Pamięć podręczna';

  @override
  String get adminServerPathLogs => 'Dzienniki';

  @override
  String get adminServerPathMetadata => 'Metadane';

  @override
  String get adminServerPathTranscode => 'Transkodowanie';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Ten serwer nie zwrócił żadnych ścieżek.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% wykorzystania';
  }

  @override
  String get userActivity => 'Aktywność użytkowników';

  @override
  String get systemEvents => 'Zdarzenia systemowe';

  @override
  String get needsAttention => 'Wymaga uwagi';

  @override
  String get adminDrawerSectionServer => 'Serwer';

  @override
  String get adminDrawerSectionPlayback => 'Odtwarzanie';

  @override
  String get adminDrawerSectionDevices => 'Urządzenia';

  @override
  String get adminDrawerSectionAdvanced => 'Zaawansowane';

  @override
  String get adminDrawerSectionPlugins => 'Wtyczki';

  @override
  String get adminDrawerSectionLiveTv => 'Telewizja na żywo';

  @override
  String get homeVideos => 'Filmy domowe';

  @override
  String get mixedContent => 'Treści mieszane';

  @override
  String get homeVideosAndPhotos => 'Filmy domowe i zdjęcia';

  @override
  String get mixedMoviesAndShows => 'Filmy i seriale (mieszane)';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nie znaleziono nagrań';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Nie znaleziono stron z obrazami w archiwum .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Błąd wbudowanego renderera ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Błąd renderera EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Brak lokalnego pliku dla czytnika: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status podczas otwierania danych książki z $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Brak dostępnego punktu końcowego do odczytu książki';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nieobsługiwany format archiwum komiksu: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Wtyczka do wypakowywania CBR jest niedostępna na tej platformie.';

  @override
  String get failedToExtractCbrArchive =>
      'Nie udało się wypakować archiwum .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Wypakowywanie CB7 jest niedostępne na tej platformie.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Wtyczka do wypakowywania CB7 jest niedostępna na tej platformie.';

  @override
  String get closeGenrePanel => 'Zamknij panel gatunków';

  @override
  String get loadingShuffle => 'Wczytywanie losowania...';

  @override
  String get libraryShuffleLabel => 'LOSOWANIE BIBLIOTEKI';

  @override
  String get randomShuffleLabel => 'LOSOWANIE PRZYPADKOWE';

  @override
  String get genresShuffleLabel => 'LOSOWANIE GATUNKÓW';

  @override
  String get autoHdrSwitching => 'Automatyczne przełączanie HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Automatycznie włączaj HDR przy odtwarzaniu wideo HDR i przywracaj tryb wyświetlania po wyjściu.';

  @override
  String get whenFullscreen => 'Na pełnym ekranie';

  @override
  String get changeArtwork => 'Zmień grafikę';

  @override
  String get missing => 'Brak';

  @override
  String get transcodingLimits => 'Limity transkodowania';

  @override
  String get clearAllArtworkButton => 'Wyczyścić całą grafikę?';

  @override
  String get clearAllArtworkWarning =>
      'Czy na pewno chcesz wyczyścić całą pobraną grafikę?';

  @override
  String get confirmClear => 'Potwierdź czyszczenie';

  @override
  String confirmClearMessage(String itemType) {
    return 'Czy na pewno chcesz wyczyścić: $itemType?';
  }

  @override
  String get uploadButton => 'Przesłać?';

  @override
  String get resolutionLabel => 'Rozdzielczość: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Pokazuj tylko grafikę w języku interfejsu';

  @override
  String get confirmClearAll => 'Potwierdź czyszczenie wszystkiego';

  @override
  String get imageUploadSuccess => 'Pomyślnie przesłano obraz!';

  @override
  String imageUploadFailed(String error) {
    return 'Nie udało się przesłać obrazu: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Nie udało się ustawić obrazu: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Nie udało się usunąć obrazu: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Nie udało się wyczyścić całej grafiki: $error';
  }

  @override
  String get yes => 'Tak';

  @override
  String get posterCategory => 'Plakat';

  @override
  String get backdropsCategory => 'Tła';

  @override
  String get bannerCategory => 'Baner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatura';

  @override
  String get artCategory => 'Grafika';

  @override
  String get discArtCategory => 'Grafika płyty';

  @override
  String get screenshotCategory => 'Zrzut ekranu';

  @override
  String get boxCoverCategory => 'Okładka pudełka';

  @override
  String get boxRearCoverCategory => 'Tylna okładka pudełka';

  @override
  String get menuArtCategory => 'Grafika menu';

  @override
  String get confirmItemPoster => 'plakat';

  @override
  String get confirmItemBackdrop => 'tło';

  @override
  String get confirmItemBanner => 'baner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatura';

  @override
  String get confirmItemArt => 'grafika';

  @override
  String get confirmItemDiscArt => 'grafika płyty';

  @override
  String get confirmItemScreenshot => 'zrzut ekranu';

  @override
  String get confirmItemBoxCover => 'okładka pudełka';

  @override
  String get confirmItemBoxRearCover => 'tylna okładka pudełka';

  @override
  String get confirmItemMenuArt => 'grafika menu';

  @override
  String get resolutionAll => 'Wszystkie';

  @override
  String get resolutionHigh => 'Wysoka (1080p+)';

  @override
  String get resolutionMedium => 'Średnia (720p)';

  @override
  String get resolutionLow => 'Niska (<720p)';

  @override
  String get sources => 'Źródła';

  @override
  String get audiobookChapters => 'Rozdziały';

  @override
  String get audiobookBookmarks => 'Zakładki';

  @override
  String get audiobookNotes => 'Notatki';

  @override
  String get audiobookQueue => 'Kolejka';

  @override
  String get audiobookTimeline => 'Oś czasu';

  @override
  String get audiobookTimelineEmpty => 'Oś czasu jest pusta';

  @override
  String get audiobookWholeBook => 'Cała książka';

  @override
  String get audiobookFocusedTimeline => 'Wybrany fragment osi czasu';

  @override
  String get audiobookExportBookmarks => 'Eksportuj zakładki';

  @override
  String get audiobookExportNotes => 'Eksportuj notatki';

  @override
  String get audiobookExportAll => 'Eksportuj wszystko';

  @override
  String audiobookExportSuccess(String path) {
    return 'Wyeksportowano do $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Eksport nie powiódł się: $error';
  }

  @override
  String get audiobookLyrics => 'Tekst';

  @override
  String get audiobookAddBookmark => 'Dodaj zakładkę';

  @override
  String get audiobookAddNote => 'Dodaj notatkę';

  @override
  String get audiobookEditNote => 'Edytuj notatkę';

  @override
  String get audiobookNoteHint => 'Zapisz notatkę do tego momentu';

  @override
  String get audiobookSleepTimer => 'Wyłącznik czasowy';

  @override
  String get audiobookSleepOff => 'Wyłączony';

  @override
  String get audiobookSleepEndOfChapter => 'Koniec rozdziału';

  @override
  String get audiobookSleepCustom => 'Własny';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Pozostało $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Prędkość odtwarzania';

  @override
  String get audiobookRemainingTime => 'Pozostało';

  @override
  String get audiobookElapsedTime => 'Upłynęło';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Cofnij ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Do przodu ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Poprzedni rozdział';

  @override
  String get audiobookNextChapter => 'Następny rozdział';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Rozdział $current z $total';
  }

  @override
  String get audiobookNoChapters => 'Brak rozdziałów';

  @override
  String get audiobookNoBookmarks => 'Brak zakładek';

  @override
  String get audiobookNoNotes => 'Brak notatek';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Dodano zakładkę w $position';
  }

  @override
  String get audiobookSpeedReset => 'Przywróć 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Zapisz';

  @override
  String get audiobookCancel => 'Anuluj';

  @override
  String get audiobookDelete => 'Usuń';

  @override
  String get subtitlePreferences => 'Preferencje napisów';

  @override
  String get subtitlePreferencesDescription =>
      'Zmień tryby napisów, domyślne języki, wygląd i opcje renderowania.';

  @override
  String get subtitleRendering => 'Renderowanie napisów';

  @override
  String get displayOptions => 'Opcje wyświetlania';

  @override
  String get releaseDateAscending => 'Data wydania (rosnąco)';

  @override
  String get releaseDateDescending => 'Data wydania (malejąco)';

  @override
  String get groupContributions => 'Grupowanie udziałów';

  @override
  String get groupMultipleRoles => 'Grupuj wiele ról';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Ostrzeżenie o dostępie do zapisu w bibliotece';

  @override
  String get libraryWriteAccessHowToFix => 'Jak to naprawić:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Nadaj użytkownikowi usługi Jellyfin (np. jellyfin lub PUID/PGID w Dockerze) uprawnienia do zapisu w folderach biblioteki multimediów na serwerze.\n\n2. Albo przejdź do panelu Jellyfin -> Biblioteki, edytuj tę bibliotekę i wyłącz opcję „Zapisuj grafiki w folderach multimediów”, aby przechowywać grafiki w wewnętrznej bazie danych Jellyfin.';

  @override
  String get dismiss => 'Zamknij';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Twoja biblioteka „$libraryName” jest skonfigurowana tak, aby zapisywać grafiki bezpośrednio w folderach multimediów (opcja „Zapisuj grafiki w folderach multimediów” jest włączona). Jellyfin sprawdził jednak dostęp do zapisu i nie ma uprawnień do zapisywania plików w tym katalogu:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Wygląda na to, że Jellyfin nie zdołał zaktualizować grafiki. Twoja biblioteka jest skonfigurowana tak, aby zapisywać grafiki bezpośrednio w folderach multimediów (opcja „Zapisuj grafiki w folderach multimediów” jest włączona). Ten błąd zwykle występuje, gdy proces serwera Jellyfin nie ma uprawnień do zapisu plików w Twoich katalogach multimediów.';

  @override
  String get externalLists => 'Listy zewnętrzne';

  @override
  String get replay => 'Odtwórz ponownie';

  @override
  String get fileInformation => 'Informacje o pliku';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Rozmiar: $size  •  Format: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Pokaż wszystkie ścieżki audio ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Pokaż wszystkie ścieżki napisów ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Sprawdzanie możliwości odtwarzania bezpośredniego...';

  @override
  String get directPlayCapabilityLabel => 'Odtwarzanie bezpośrednie: ';

  @override
  String get forced => 'Wymuszone';

  @override
  String get transcodeContainerNotSupported =>
      'Format kontenera nie jest obsługiwany przez odtwarzacz.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Kodek wideo nie jest obsługiwany.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Kodek audio nie jest obsługiwany.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Format napisów nie jest obsługiwany (wymaga wypalenia).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Profil audio nie jest obsługiwany.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Profil wideo nie jest obsługiwany.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Poziom wideo nie jest obsługiwany.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Rozdzielczość wideo nie jest obsługiwana przez to urządzenie.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Głębia bitowa wideo nie jest obsługiwana.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Liczba klatek wideo nie jest obsługiwana.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Przepływność pliku przekracza limit odtwarzacza.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Przepływność wideo przekracza limit strumieniowania.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Przepływność audio przekracza limit strumieniowania.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Liczba kanałów audio nie jest obsługiwana.';

  @override
  String get sortAlphabetical => 'Alfabetycznie';

  @override
  String get sortReleaseAscending => 'Kolejność wydania (rosnąco)';

  @override
  String get sortReleaseDescending => 'Kolejność wydania (malejąco)';

  @override
  String get sortCustomDragDrop => 'Własna (przeciągnij i upuść)';

  @override
  String get playlistSortOptions => 'Opcje sortowania playlisty';

  @override
  String get resetSort => 'Resetuj sortowanie';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Obejrzyj ponownie S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Obejrzyj ponownie playlistę';

  @override
  String get noSubtitlesFound => 'Nie znaleziono napisów.';

  @override
  String get adminControls => 'Ustawienia administratora';

  @override
  String get impellerRendering => 'Silnik renderowania (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller to nowoczesny renderer GPU we Flutterze, zapewniający płynniejsze animacje i mniej zacięć. Na niektórych przystawkach TV i starszych GPU może powodować błędy obrazu lub czarny ekran — wtedy wyłącz tę opcję. Automatyczny wybiera najlepsze ustawienie dla Twojego urządzenia. Uruchom Moonfin ponownie, aby zastosować zmiany.';

  @override
  String get impellerAuto => 'Automatyczny';

  @override
  String get impellerOn => 'Włączony';

  @override
  String get impellerOff => 'Wyłączony';

  @override
  String get impellerRestartTitle => 'Wymagane ponowne uruchomienie';

  @override
  String get impellerRestartMessage =>
      'Moonfin musi zostać uruchomiony ponownie, aby zmienić silnik renderowania. Zamknij teraz aplikację, a następnie otwórz ją ponownie, aby zastosować zmiany.';

  @override
  String get impellerCloseNow => 'Zamknij aplikację teraz';

  @override
  String get adminRefreshLibrary => 'Odśwież bibliotekę';

  @override
  String get adminRefreshAllLibraries => 'Odśwież wszystkie biblioteki';

  @override
  String get adminRepoSortDateOldest => 'Data dodania (od najstarszych)';

  @override
  String get adminRepoSortDateNewest => 'Data dodania (od najnowszych)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetycznie (od A do Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetycznie (od Z do A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Wczytywanie statystyk serwera... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Jak w źródle';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 filmów';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 seriali';

  @override
  String get imdbMostPopularMovies => 'IMDb Najpopularniejsze filmy';

  @override
  String get imdbMostPopularTvShows => 'IMDb Najpopularniejsze seriale';

  @override
  String get imdbLowestRatedMovies => 'IMDb Najniżej oceniane filmy';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb Najwyżej oceniane filmy anglojęzyczne';
}
