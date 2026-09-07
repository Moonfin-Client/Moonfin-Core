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
  String get systemLanguageDefault => 'Domyślny język systemu';

  @override
  String get signIn => 'Zaloguj się';

  @override
  String get empty => 'Pusto';

  @override
  String connectingToServer(String serverName) {
    return 'Łączenie z $serverName';
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
  String get waitingForAuthorization => 'Oczekiwanie na autoryzację...';

  @override
  String get back => 'Cofnij';

  @override
  String get serverUnavailable => 'Serwer jest niedostępny';

  @override
  String get loginFailed => 'Logowanie nie powiodło się';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect niedostępne: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect niedostępne ($status): $detail';
  }

  @override
  String get whosWatching => 'Kto ogląda?';

  @override
  String get addUser => 'Dodaj użytkownika';

  @override
  String get selectServer => 'Wybierz serwer';

  @override
  String appVersionFooter(String version) {
    return 'Wersja Moonfin $version';
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
    return 'Usunąć „$serverName” z listy serwerów?';
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
  String get detailScreenStyle => 'Styl widoku szczegółów';

  @override
  String get detailScreenStyleSubtitle =>
      'Klasyczny to oryginalny układ Moonfin. Nowoczesny to responsywny układ w stylu kinowym.';

  @override
  String get detailScreenStyleMoonfin => 'Klasyczny';

  @override
  String get detailScreenStyleModern => 'Nowoczesny';

  @override
  String get expandedTabs => 'Rozszerzone zakładki';

  @override
  String get expandedTabsSubtitle =>
      'Automatycznie pokazuj treść zakładki podczas przeglądania. Wyłącz, aby otwierać i zamykać zakładki ręcznie.';

  @override
  String get showTechnicalDetails => 'Pokazywać szczegóły techniczne?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Pokazuj informacje o kodeku, rozdzielczości i strumieniu w podsumowaniu banera';

  @override
  String get recommendationSystem => 'System rekomendacji';

  @override
  String get recommendationSystemSubtitle =>
      'Użyj lokalnego algorytmu Moonfin lub internetowego systemu podobieństwa TMDb. Rekomendacje online wymagają integracji z Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin poleca';

  @override
  String get recommendationSystemTmdb => 'Podobieństwo TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Zastosować limit klasyfikacji wiekowej?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Ogranicz sugestie Moonfin do klasyfikacji wiekowej wybranego materiału';

  @override
  String get interfaceStyle => 'Styl interfejsu';

  @override
  String get interfaceStyleSubtitle =>
      'Tryb automatyczny dopasowuje wygląd do urządzenia. Wybierz Apple lub Material, aby wymusić konkretny styl.';

  @override
  String get interfaceStyleAutomatic => 'Automatyczny';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Układ interfejsu';

  @override
  String get interfaceLayoutSubtitle =>
      'Zmień wykryty układ, jeśli urządzenie zostało rozpoznane nieprawidłowo. Uruchom Moonfin ponownie, aby zastosować zmiany.';

  @override
  String get interfaceLayoutAutomatic => 'Automatyczny';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Komputer';

  @override
  String get interfaceLayoutPhone => 'Telefon';

  @override
  String get glassQuality => 'Jakość efektu szkła';

  @override
  String get oledMode => 'Tryb OLED';

  @override
  String get oledModeSubtitle =>
      'Pogłębia czerń i podkreśla grafikę. Najlepiej wygląda na ekranach OLED.';

  @override
  String get oledModeSubtle => 'Subtelny';

  @override
  String get oledModeVivid => 'Intensywny';

  @override
  String get glassQualitySubtitle =>
      'Automatycznie wybiera najlepszy efekt szkła dla tego urządzenia. Pełny wymusza rzeczywiste rozmycie, a Zmniejszony używa lżejszego efektu szkła, który mniej obciąża GPU.';

  @override
  String get glassQualityAuto => 'Automatycznie';

  @override
  String get glassQualityFull => 'Pełny';

  @override
  String get glassQualityReduced => 'Zmniejszony';

  @override
  String get performanceMode => 'Performance';

  @override
  String get performanceModeSubtitle =>
      'Auto measures this device and holds back on the ones short on memory, which keeps fewer images in memory and leaves trailers as still images. Takes full effect on the next launch.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Reduced';

  @override
  String get trailerPreviewHeldBack =>
      'Off because Performance is set to Reduced for this device';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Zastosuj niestandardowy motyw i wybierz interfejs inspirowany stylem Apple lub Material.';

  @override
  String get customThemeTitle => 'Niestandardowy motyw';

  @override
  String get customThemeSubtitle =>
      'Niestandardowe motywy zmieniają wygląd Moonfin. Wybierz opcję najlepiej pasującą do Twojego stylu.';

  @override
  String get keyboardPreferSystemIme => 'Preferuj klawiaturę systemową';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Używaj systemowej metody wprowadzania tekstu';

  @override
  String get controller => 'Kontroler';

  @override
  String get gamepadNavigation => 'Nawigacja kontrolerem';

  @override
  String get gamepadNavigationDescription =>
      'Pozwala używać podłączonego kontrolera do przesuwania zaznaczenia i wybierania pozycji';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle => 'Klasyczny, czysty styl Moonfin.';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave z magentową poświatą, cyjanowym tekstem i silniejszym kontrastem chromu';

  @override
  String get themeGlass => 'Szklany';

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
      'Brak serwerów połączonych z tym kontem Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Nieprawidłowe dane logowania Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Nieprawidłowa nazwa użytkownika lub hasło Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Serwer nie obsługuje logowania przez Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Błąd sieci podczas łączenia z Emby Connect lub wybranym serwerem';

  @override
  String get loadingLinkedServers => 'Pobieranie listy serwerów...';

  @override
  String get connectingToServerEllipsis => 'Łączenie z serwerem...';

  @override
  String get noReachableAddress => 'Nie podano osiągalnego adresu';

  @override
  String get invalidServerExchangeResponse =>
      'Nieprawidłowa odpowiedź podczas komunikacji z serwerem';

  @override
  String unableToConnectTo(String target) {
    return 'Nie można połączyć się z $target';
  }

  @override
  String get exitApp => 'Wyjść z Moonfin?';

  @override
  String get exitAppConfirmation => 'Czy na pewno chcesz wyjść?';

  @override
  String get exit => 'Wyjdź';

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
  String get gameNoCoreOptions => 'Ten rdzeń nie ma żadnych opcji do zmiany.';

  @override
  String get gameHoldToOpenMenu => 'Przytrzymaj aby otworzyć menu';

  @override
  String get gamePlaybackUnsupported =>
      'Odtwarzanie gier nie jest jeszcze obsługiwane na tym urządzeniu.';

  @override
  String get noHomeRowsLoaded => 'Nie udało się wczytać sekcji ekranu głównego';

  @override
  String get noHomeRowsHint =>
      'Spróbuj odświeżyć stronę lub zmniejszyć liczbę aktywnych sekcji na ekranie głównym.';

  @override
  String get retryHomeRows => 'Odśwież sekcje';

  @override
  String get guide => 'Program TV';

  @override
  String get recordings => 'Nagrania';

  @override
  String get schedule => 'Harmonogram';

  @override
  String get series => 'Seriale';

  @override
  String get noItemsFound => 'Nie znaleziono żadnych pozycji';

  @override
  String get home => 'Strona główna';

  @override
  String get browseAll => 'Przeglądaj wszystko';

  @override
  String get genres => 'Gatunki';

  @override
  String get collectionPlaceholder => 'Tutaj pojawią się pozycje z kolekcji';

  @override
  String get browseByLetter => 'Alfabetycznie';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Tutaj pojawi się lista alfabetyczna';

  @override
  String get suggestions => 'Sugestie';

  @override
  String get suggestionsPlaceholder => 'Tutaj pojawią się sugerowane pozycje';

  @override
  String get failedToLoadLibraries => 'Nie udało się wczytać bibliotek';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pozycji',
      many: '$count pozycji',
      few: '$count pozycje',
      one: '$count pozycja',
    );
    return '$_temp0';
  }

  @override
  String get failedToLoadFavorites => 'Nie udało się wczytać ulubionych';

  @override
  String get retry => 'Ponów';

  @override
  String get noFavoritesYet => 'Nie ma jeszcze ulubionych';

  @override
  String get favorites => 'Ulubione';

  @override
  String totalCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pozycji',
      many: '$count pozycji',
      few: '$count pozycje',
      one: '$count pozycja',
    );
    return '$_temp0';
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
  String get scrollDirection => 'Kierunek przewijania';

  @override
  String get scrollDirectionVertical => 'Pionowy';

  @override
  String get scrollDirectionHorizontal => 'Poziomy';

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
  String get bookmark => 'Zakładka';

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
      'Wybierz kanały tematyczne wyświetlane w Discover.';

  @override
  String get apply => 'Zastosuj';

  @override
  String get openLink => 'Otwórz link';

  @override
  String get scanWithYourPhone => 'Zeskanuj telefonem';

  @override
  String get audiobookGenres => 'Gatunki audiobooków';

  @override
  String get pickAudiobookGenres =>
      'Wybierz gatunki wyświetlane w Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Odkryj audiobooki';

  @override
  String get librivoxDescription => 'Popularne tytuły od LibriVox.';

  @override
  String titlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tytułu',
      many: '$count tytułów',
      few: '$count tytuły',
      one: '1 tytuł',
    );
    return '$_temp0';
  }

  @override
  String get scrollLeft => 'Przewiń w lewo';

  @override
  String get scrollRight => 'Przewiń w prawo';

  @override
  String get scrollToTop => 'Przewiń na górę';

  @override
  String get couldNotLoadGenre => 'Nie można teraz wczytać tego gatunku.';

  @override
  String get continueReading => 'Kontynuuj czytanie';

  @override
  String get savedHighlights => 'Zapisane fragmenty';

  @override
  String get continueListening => 'Kontynuuj słuchanie';

  @override
  String get listen => 'Słuchaj';

  @override
  String get resume => 'Kontynuuj';

  @override
  String get failedToLoadLibrary => 'Nie udało się wczytać biblioteki';

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
      'Twoje książki z zaznaczeniami, dodane do ulubionych lub z zapisanym postępem czytania.';

  @override
  String get handPickedFromLibrary => 'Starannie wybrane z Twojej biblioteki.';

  @override
  String get handPickedFromListeningQueue =>
      'Starannie wybrane z Twojej kolejki słuchania.';

  @override
  String get booksWithHighlights =>
      'Książki z zaznaczeniami, dodane do ulubionych lub z zapisanym postępem czytania.';

  @override
  String get jumpBackNarration =>
      'Wróć do słuchania dokładnie tam, gdzie skończyłeś.';

  @override
  String get unreadBooksReady => 'Nieprzeczytane książki na wolną chwilę.';

  @override
  String get quickAccessFavorites =>
      'Szybki dostęp do książek, do których ciągle wracasz.';

  @override
  String get searchAudiobooks => 'Wyszukaj audiobooki';

  @override
  String get searchYourLibrary => 'Szukaj w bibliotece';

  @override
  String get pickUpStory =>
      'Kontynuuj historię w miejscu, w którym ją przerwałeś';

  @override
  String get savedPlacesChapters =>
      'Twoje zapisane miejsca i niedokończone rozdziały';

  @override
  String authorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autora',
      many: '$count autorów',
      few: '$count autorzy',
      one: '1 autor',
    );
    return '$_temp0';
  }

  @override
  String genresCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gatunku',
      many: '$count gatunków',
      few: '$count gatunki',
      one: '$count gatunek',
    );
    return '$_temp0';
  }

  @override
  String percentCompleted(int percent) {
    return 'Przeczytano $percent%';
  }

  @override
  String get readyWhenYouAre => 'Czekamy, aż zaczniesz';

  @override
  String get details => 'Szczegóły';

  @override
  String get listeningRoom => 'Strefa słuchania';

  @override
  String get bookmarksAndProgress => 'Zakładki i postęp';

  @override
  String titlesArrangedForBrowsing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tytułu dostępnego do przeglądania',
      many: '$count tytułów dostępnych do przeglądania',
      few: '$count tytuły dostępne do przeglądania',
      one: '$count tytuł dostępny do przeglądania',
    );
    return '$_temp0.';
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
      'Popularne tytuły według kategorii w Open Library.';

  @override
  String get noBookmarkedItems => 'Nie masz jeszcze żadnych zakładek';

  @override
  String get nothingMatchesSection =>
      'Nic jeszcze nie pasuje do tej sekcji. Wybierz inną kartę lub wróć po zakończeniu synchronizacji biblioteki.';

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
  String get playedStatus => 'Stan obejrzenia';

  @override
  String get readStatus => 'Przeczytane';

  @override
  String get watched => 'Obejrzane';

  @override
  String get unread => 'Nieprzeczytana';

  @override
  String get unwatched => 'Nieobejrzane';

  @override
  String get seriesStatus => 'Status serialu';

  @override
  String get allLibraries => 'Wszystkie biblioteki';

  @override
  String get books => 'Książki';

  @override
  String get latestBooks => 'Najnowsze książki';

  @override
  String get latestAudiobooks => 'Najnowsze audiobooki';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count książek',
      many: '$count książek',
      few: '$count książki',
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
    return 'Przeczytano $percent%';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Pozostało $time';
  }

  @override
  String get bookHeroRead => 'Czytaj';

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
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'Kanał RSS';

  @override
  String get downloadZip => 'Pobierz ZIP';

  @override
  String sectionCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sekcji',
      many: '$count sekcji',
      few: '$count sekcje',
      one: '$count sekcja',
    );
    return '$_temp0';
  }

  @override
  String firstPublished(int year) {
    return 'Pierwsze wydanie $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Open Library nie ma jeszcze opisu tego tytułu.';

  @override
  String get subjects => 'Tematy';

  @override
  String get all => 'Wszystko';

  @override
  String booksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count książki',
      many: '$count książek',
      few: '$count książki',
      one: '$count książka',
    );
    return '$_temp0';
  }

  @override
  String get couldNotLoadSubject => 'Nie udało się wczytać tego tematu.';

  @override
  String get audiobookDetails => 'Szczegóły audiobooka';

  @override
  String authorsCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autora',
      many: '$count autorów',
      few: '$count autorów',
      one: '$count autor',
    );
    return '$_temp0';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiobooków',
      many: '$count audiobooków',
      few: '$count audiobooki',
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
  String get castAndCrew => 'Obsada i twórcy';

  @override
  String get collection => 'Kolekcja';

  @override
  String get episodes => 'Odcinki';

  @override
  String get nextUp => 'Następne';

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
    return 'Wydano w $year';
  }

  @override
  String get publicationDateUnknown => 'Data publikacji nieznana';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sezonów',
      many: '$count sezonów',
      few: '$count sezony',
      one: '1 sezon',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Koniec o $time';
  }

  @override
  String get items => 'Pozycje';

  @override
  String get extras => 'Dodatki';

  @override
  String get behindTheScenes => 'Kulisy produkcji';

  @override
  String get deletedScenes => 'Usunięte sceny';

  @override
  String get featurettes => 'Materiały specjalne';

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
  String get view => 'Wyświetl';

  @override
  String get resumeReading => 'Kontynuuj czytanie';

  @override
  String get read => 'Czytaj';

  @override
  String resumeFrom(String position) {
    return 'Kontynuuj od $position';
  }

  @override
  String get play => 'Odtwórz';

  @override
  String get startOver => 'Zacznij od nowa';

  @override
  String get restart => 'Odtwórz od początku';

  @override
  String get readOffline => 'Czytaj offline';

  @override
  String get playOffline => 'Odtwórz offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Napisy';

  @override
  String get version => 'Wersja';

  @override
  String get cast => 'Przesyłaj';

  @override
  String get castMembers => 'Obsada';

  @override
  String get trailer => 'Zwiastun';

  @override
  String get finished => 'Ukończono';

  @override
  String get favorited => 'Ulubione';

  @override
  String get favorite => 'Dodaj do ulubionych';

  @override
  String get playlist => 'Dodaj do playlisty';

  @override
  String get downloaded => 'Pobrano';

  @override
  String get finalizingDownload => 'Finalizowanie…';

  @override
  String get queuedDownload => 'W kolejce';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more queued',
      one: '1 more queued',
    );
    return '$_temp0';
  }

  @override
  String get downloadAll => 'Pobierz wszystko';

  @override
  String get download => 'Pobierz';

  @override
  String get deleteDownloaded => 'Usuń pobrane';

  @override
  String get goToSeries => 'Otwórz serial';

  @override
  String get editMetadata => 'Edytuj metadane';

  @override
  String get less => 'Mniej';

  @override
  String get more => 'Więcej';

  @override
  String get deleteItem => 'Usuń pozycję';

  @override
  String get deletePlaylist => 'Usuń playlistę';

  @override
  String get deletePlaylistMessage => 'Usunąć tę playlistę z serwera?';

  @override
  String get deleteItemMessage => 'Usunąć tę pozycję z serwera?';

  @override
  String get failedToDeletePlaylist => 'Nie udało się usunąć playlisty';

  @override
  String get failedToDeleteItem => 'Nie udało się usunąć pozycji';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Operacja usunięcia zakończyła się błędem: $error';
  }

  @override
  String get renamePlaylist => 'Zmień nazwę playlisty';

  @override
  String get playlistName => 'Nazwa playlisty';

  @override
  String get deleteDownloadedAlbum => 'Usuń pobrany album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Usunąć pobrane utwory z „$title”?';
  }

  @override
  String get downloadedTracksDeleted => 'Pobrane utwory zostały usunięte';

  @override
  String get downloadedTracksDeleteFailed =>
      'Niektórych pobranych utworów nie udało się usunąć';

  @override
  String get noTracksLoaded => 'Brak dostępnych utworów';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Brak $itemLabel do pobrania';
  }

  @override
  String downloadingTitle(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pozycji',
      many: '$count pozycji',
      few: '$count pozycje',
      one: '$count pozycja',
    );
    return 'Pobieranie „$title” ($_temp0)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Na pewno chcesz usunąć „$name” z serwera? Tej operacji nie można cofnąć.';
  }

  @override
  String get itemDeleted => 'Usunięto pozycję';

  @override
  String get noPlayableTrailerFound =>
      'Nie znaleziono zwiastuna do odtworzenia.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nieobsługiwany format: .$extension';
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
  String get searchingSubtitles => 'Wyszukiwanie napisów…';

  @override
  String get downloadingSubtitle => 'Pobieranie napisów…';

  @override
  String get selectedSubtitleInvalid => 'Wybrane napisy są nieprawidłowe.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Napisy pobrane i wybrane: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Napisy pobrane. Mogą pojawić się po chwili, gdy Jellyfin odświeży materiał.';

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
  String get noEpisodesLoaded => 'Brak odcinków do pobrania';

  @override
  String get downloadScopeTitle => 'What to download';

  @override
  String get downloadAllEpisodes => 'All episodes';

  @override
  String get downloadUnwatchedEpisodes => 'All unwatched episodes';

  @override
  String get downloadAllMovies => 'All movies';

  @override
  String get downloadUnwatchedMovies => 'All unwatched movies';

  @override
  String get downloadScopeLoading => 'Loading items...';

  @override
  String get downloadScopeLoadFailed => 'Could not load items to download';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size total';
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
    return '$size total';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count unknown';
  }

  @override
  String downloadingItem(String name, String quality) {
    return 'Pobieranie „$name” ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Usuń pobrane pliki';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Usunąć lokalne pliki $typeLabel?\n\nZwolni to miejsce na urządzeniu. Pliki będzie można pobrać ponownie później.';
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
  String get starring => 'W ROLACH GŁÓWNYCH';

  @override
  String get directors => 'REŻYSERIA';

  @override
  String get writer => 'SCENARIUSZ';

  @override
  String get writers => 'SCENARZYŚCI';

  @override
  String get studio => 'WYTWÓRNIA';

  @override
  String studioMoreCount(int count) {
    return '+$count więcej';
  }

  @override
  String totalEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count odcinka',
      many: '$count odcinków',
      few: '$count odcinki',
      one: '$count odcinek',
    );
    return '$_temp0';
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
      many: '$count utworów',
      few: '$count utwory',
      one: '1 utwór',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rozdziału',
      many: '$count rozdziałów',
      few: '$count rozdziały',
      one: '$count rozdział',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Data urodzenia $date';
  }

  @override
  String died(String date) {
    return 'Data śmierci $date';
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
  String get shuffleAll => 'Losowo wszystko';

  @override
  String get shuffleAllMusic => 'Odtwarzaj muzykę losowo';

  @override
  String get carSignInPrompt => 'Zaloguj się do Moonfin na telefonie';

  @override
  String get carServerUnreachable => 'Nie można połączyć się z serwerem';

  @override
  String downloadsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pobrania',
      many: '$count pobrań',
      few: '$count pobrania',
      one: '$count pobranie',
    );
    return '$_temp0';
  }

  @override
  String get perfectMatch => 'Idealne dopasowanie';

  @override
  String get aiTranslated => 'Przetłumaczone przez AI';

  @override
  String get machineTranslated => 'Tłumaczenie maszynowe';

  @override
  String get hearingImpaired => 'SDH';

  @override
  String framerateFps(String rate) {
    return '$rate kl./s';
  }

  @override
  String channelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kanałów',
      many: '$count kanałów',
      few: '$count kanały',
      one: '$count kanał',
    );
    return '$_temp0';
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
    return 'wszystkie pobrane odcinki serialu „$name”';
  }

  @override
  String get deleteSeasonFiles => 'wszystkie pobrane odcinki w tym sezonie';

  @override
  String get stillWatching => 'Nadal oglądasz?';

  @override
  String get unableToLoadTrailerStream => 'Nie udało się wczytać zwiastuna.';

  @override
  String get trailerTimedOut =>
      'Przekroczono limit czasu podczas wczytywania zwiastuna.';

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
    return 'Sterowanie $label';
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
  String get showMpvStats => 'Show mpv Statistics (Shift+I)';

  @override
  String get hideMpvStats => 'Hide mpv Statistics (Shift+I)';

  @override
  String get playback => 'Odtwarzanie';

  @override
  String get playMethod => 'Metoda odtwarzania';

  @override
  String get directPlay => 'Direct Play';

  @override
  String get directStream => 'Direct Stream';

  @override
  String get transcoding => 'Transkodowanie';

  @override
  String get transcodeReasons => 'Powody transkodowania';

  @override
  String get player => 'Odtwarzacz';

  @override
  String get container => 'Kontener';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Wideo';

  @override
  String get resolution => 'Rozdzielczość';

  @override
  String get hdr => 'HDR';

  @override
  String get hdrOutput => 'HDR output';

  @override
  String hdrOutputActive(String format) {
    return 'Active — $format';
  }

  @override
  String get hdrOutputActiveTonemapped =>
      'Active — tone-mapped to SDR for this display';

  @override
  String get hdrOutputDisplayNotHdr => 'Inactive — display is not in HDR mode';

  @override
  String get hdrOutputContentSdr => 'Inactive — content is SDR';

  @override
  String get hdrOutputDisabled => 'Inactive — turned off in settings';

  @override
  String get hdrOutputFailed =>
      'Inactive — could not start, using the standard path';

  @override
  String get nativeHdrOutput => 'Native HDR output';

  @override
  String get nativeHdrOutputDescription =>
      'Sends HDR video to the display untouched instead of converting it to SDR. Used only when the display is already in HDR mode and the title is HDR.';

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
  String get sampleRate => 'Częstotliwość próbkowania';

  @override
  String get format => 'Format';

  @override
  String get external => 'Zewnętrzne';

  @override
  String get embedded => 'Osadzone';

  @override
  String castSessionError(String protocol) {
    return 'Błąd sesji $protocol';
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
      'Wyświetlanie dokumentów w aplikacji jest niedostępne na tej platformie.';

  @override
  String get couldNotOpenExternalViewer =>
      'Nie udało się otworzyć zewnętrznego odtwarzacza.';

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
      'Nie masz jeszcze żadnych zakładek.\nStuknij ikonę zakładki podczas czytania, aby zapisać miejsce.';

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
    return 'Przeczytano $percent%';
  }

  @override
  String get updating => 'Aktualizowanie...';

  @override
  String get markUnread => 'Oznacz jako nieprzeczytane';

  @override
  String get markAsRead => 'Oznacz jako przeczytane';

  @override
  String get reloadReader => 'Uruchom ponownie czytnik';

  @override
  String get noPagesFound => 'Nie znaleziono żadnych stron.';

  @override
  String get failedToDecodePageImage => 'Nie udało się wczytać obrazu strony.';

  @override
  String resetZoom(String zoom) {
    return 'Przywróć powiększenie (${zoom}x)';
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
  String get themeSystem => 'Motyw: systemowy';

  @override
  String get themeLight => 'Motyw: jasny';

  @override
  String get themeDark => 'Motyw: ciemny';

  @override
  String get themeSepia => 'Motyw: sepia';

  @override
  String get invertColorsFixedLayout => 'Odwróć kolory (stały układ)';

  @override
  String get invertColorsPdf => 'Odwróć kolory (PDF)';

  @override
  String get preparingInAppReader => 'Przygotowywanie czytnika...';

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
  String get seriesRecordings => 'Nagrania serialu';

  @override
  String get now => 'Teraz';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Wiadomości';

  @override
  String get kids => 'Dla dzieci';

  @override
  String get premiere => 'Premiera';

  @override
  String get guideTimeline => 'Oś czasu programu TV';

  @override
  String failedToLoadGuide(String error) {
    return 'Nie udało się wczytać przewodnika: $error';
  }

  @override
  String get noChannelsFound => 'Nie znaleziono kanałów';

  @override
  String get liveBadge => 'NA ŻYWO';

  @override
  String guideNextProgram(String time, String title) {
    return 'Następnie: $time   $title';
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
  String get removedFromFavoriteChannels => 'Usunięto kanał z ulubionych';

  @override
  String get addedToFavoriteChannels => 'Dodano kanał do ulubionych';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Nie udało się zmienić statusu ulubionego kanału';

  @override
  String get unfavoriteChannel => 'Usuń kanał z ulubionych';

  @override
  String get favoriteChannel => 'Dodaj kanał do ulubionych';

  @override
  String get record => 'Nagraj';

  @override
  String get cancelRecordingAction => 'Anuluj nagrywanie';

  @override
  String get programSetToRecord => 'Nagrywanie zaplanowane';

  @override
  String get recordingCancelled => 'Nagrywanie anulowane';

  @override
  String get unableToCreateRecording => 'Nie udało się rozpocząć nagrywania';

  @override
  String get recordSeries => 'Nagrywaj serial';

  @override
  String get seriesSetToRecord => 'Zaplanowano nagrywanie serialu';

  @override
  String get seriesRecordingCancelled => 'Anulowano nagrywanie serialu';

  @override
  String get unableToCreateSeriesRecording =>
      'Nie udało się zaplanować nagrywania serialu';

  @override
  String get watch => 'Oglądaj';

  @override
  String get close => 'Zamknij';

  @override
  String failedToPlayChannel(String name) {
    return 'Nie udało się odtworzyć $name';
  }

  @override
  String get failedToLoadRecordings => 'Nie udało się wczytać nagrań';

  @override
  String get scheduledInNext24Hours =>
      'Zaplanowane w ciągu najbliższych 24 godzin';

  @override
  String get recentRecordings => 'Najnowsze nagrania';

  @override
  String get tvSeries => 'Seriale telewizyjne';

  @override
  String get failedToLoadSchedule => 'Nie udało się wczytać harmonogramu';

  @override
  String get noScheduledRecordings => 'Brak zaplanowanych nagrań';

  @override
  String get cancelRecording => 'Anulować nagrywanie?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Anulować zaplanowane nagrywanie „$name”?';
  }

  @override
  String get no => 'Nie';

  @override
  String get yesCancel => 'Tak, Anuluj';

  @override
  String get failedToCancelRecording => 'Nie udało się anulować nagrywania';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nie udało się wczytać nagrań serialu';

  @override
  String get noSeriesRecordings => 'Brak nagrań seriali';

  @override
  String get cancelSeriesRecording => 'Anuluj nagrywanie serialu';

  @override
  String get cancelSeriesRecordingQuestion => 'Anulować nagrywanie serialu?';

  @override
  String stopRecordingName(String name) {
    return 'Zatrzymać nagrywanie „$name”?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nie udało się anulować nagrywania serialu';

  @override
  String get searchThisLibrary => 'Przeszukaj bibliotekę...';

  @override
  String get searchEllipsis => 'Szukaj...';

  @override
  String noResultsForQuery(String query) {
    return 'Brak wyników dla „$query”';
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
  String get savedMedia => 'Zapisane materiały';

  @override
  String get tvShows => 'Seriale';

  @override
  String get music => 'Muzyka';

  @override
  String get musicAlbums => 'Albumy muzyczne';

  @override
  String get noMediaInFilter => 'Brak materiałów pasujących do tego filtra';

  @override
  String get noDownloadedMediaYet => 'Brak pobranych materiałów';

  @override
  String get browseLibrary => 'Przeglądaj bibliotekę';

  @override
  String get deleteDownload => 'Usuń pobrany plik';

  @override
  String removeItemAndFiles(String name) {
    return 'Usunąć „$name” wraz z jego plikami?';
  }

  @override
  String tracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count utworu',
      many: '$count utworów',
      few: '$count utwory',
      one: '$count utwór',
    );
    return '$_temp0';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Odtwórz album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nie udało się wczytać albumu: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nie znaleziono pobranych utworów dla $name.';
  }

  @override
  String get season => 'Sezon';

  @override
  String get errorLoadingEpisodes => 'Nie udało się wczytać odcinków';

  @override
  String get noDownloadedEpisodes => 'Brak pobranych odcinków';

  @override
  String get deleteEpisode => 'Usuń odcinek';

  @override
  String removeName(String name) {
    return 'Usunąć „$name”?';
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
  String get seriesNotFound => 'Nie znaleziono serialu';

  @override
  String get errorLoadingSeries => 'Nie udało się wczytać serialu';

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
      other: '$count odcinków',
      many: '$count odcinków',
      few: '$count odcinki',
      one: '1 odcinek',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Zarządzanie pamięcią';

  @override
  String get storageBreakdown => 'Podział pamięci';

  @override
  String get downloadedItems => 'Pobrane';

  @override
  String get storageLimit => 'Limit pamięci';

  @override
  String get noLimit => 'Bez limitu';

  @override
  String get deleteAllDownloads => 'Usuń wszystkie pobrane pliki';

  @override
  String get deleteAllDownloadsWarning =>
      'Usunie to wszystkie pobrane pliki multimedialne. Tej operacji nie można cofnąć.';

  @override
  String get deleteAll => 'Usuń wszystko';

  @override
  String get deleteSelected => 'Usuń wybrane';

  @override
  String deleteSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pobranej pozycji',
      many: '$count pobranych pozycji',
      few: '$count pobrane pozycje',
      one: '$count pobraną pozycję',
    );
    return 'Usunąć $_temp0?';
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
  String get settingsSearchHint => 'Szukaj w ustawieniach';

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
  String get contentRatingRestrictions => 'Ograniczenia klasyfikacji wiekowej';

  @override
  String get bitRateResolutionBehavior =>
      'Bitrate, rozdzielczość i sposób odtwarzania';

  @override
  String get languageSizeAppearance => 'Język, rozmiar, wygląd';

  @override
  String get qualityStorage => 'Jakość, pamięć';

  @override
  String get serverSyncAndPluginStatus =>
      'Synchronizacja z serwerem i status wtyczek';

  @override
  String get mediaRequestIntegration => 'Obsługa próśb o treści';

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
  String get pluginAndRequests => 'Wtyczki i prośby';

  @override
  String get customizeAccountPlaybackInterface =>
      'Dostosuj konto, odtwarzanie i interfejs';

  @override
  String optionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count opcji',
      many: '$count opcji',
      few: '$count opcje',
      one: '$count opcja',
    );
    return '$_temp0';
  }

  @override
  String get themeAndAppearance => 'Motyw i wygląd';

  @override
  String get focusBorderColor => 'Kolor obramowania zaznaczenia';

  @override
  String get watchedIndicators => 'Wskaźniki obejrzenia';

  @override
  String get always => 'Zawsze';

  @override
  String get mixedRowsOnly => 'Tylko sekcje mieszane';

  @override
  String get hideUnwatched => 'Ukryj nieobejrzane';

  @override
  String get episodesOnly => 'Tylko odcinki';

  @override
  String get never => 'Nigdy';

  @override
  String get focusExpansionAnimation => 'Animacja powiększenia zaznaczenia';

  @override
  String get desktopUiScale => 'Skalowanie interfejsu';

  @override
  String get scaleFocusedCards =>
      'Skaluj karty i kafelki po najechaniu lub zaznaczeniu';

  @override
  String get backgroundBackdrops => 'Grafiki tła';

  @override
  String get showBackdropImages => 'Pokazuj grafiki tła za treścią';

  @override
  String get seriesThumbnails => 'Wyświetlaj miniatury seriali';

  @override
  String get seriesThumbnailsDescription =>
      'Dla seriali używaj głównej grafiki serialu zamiast miniatury odcinka.';

  @override
  String get homeRowInfoOverlay => 'Informacje w sekcjach';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Pokazuj tytuł i metadane podczas przeglądania sekcji ekranu głównego';

  @override
  String get clockDisplay => 'Wyświetlaj zegar';

  @override
  String get inMenus => 'W menu';

  @override
  String get inVideo => 'W wideo';

  @override
  String get seasonalEffects => 'Efekty sezonowe';

  @override
  String get seasonalEffectsDescription =>
      'Efekty wizualne i dekoracje sezonowe';

  @override
  String get loadingAnimation => 'Loading Animation';

  @override
  String get loadingAnimationDescription =>
      'Customize the loading animations used throughout Moonfin';

  @override
  String get loadingAnimationConfiguration => 'Loading Animation Configuration';

  @override
  String get loadingAnimationImage => 'Image';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin Logo';

  @override
  String get loadingAnimationImageSpinner => 'Spinner';

  @override
  String get loadingAnimationImageRunner => 'Runner';

  @override
  String get loadingAnimationImageMoonPhases => 'Moon Phases';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin Phases';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfin Phases';

  @override
  String get loadingAnimationSize => 'Animation Size';

  @override
  String get loadingAnimationSizeThumbnail => 'Thumbnail';

  @override
  String get loadingAnimationSizeSmall => 'Small';

  @override
  String get loadingAnimationSizeMedium => 'Medium';

  @override
  String get loadingAnimationSizeLarge => 'Large';

  @override
  String get loadingAnimationPosition => 'Animation Position';

  @override
  String get loadingAnimationPositionTopLeft => 'Top-Left';

  @override
  String get loadingAnimationPositionTopCenter => 'Top-Center';

  @override
  String get loadingAnimationPositionTopRight => 'Top-Right';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Middle-Left';

  @override
  String get loadingAnimationPositionMiddle => 'Middle';

  @override
  String get loadingAnimationPositionMiddleRight => 'Middle-Right';

  @override
  String get loadingAnimationPositionBottomLeft => 'Bottom-Left';

  @override
  String get loadingAnimationPositionBottomCenter => 'Bottom-Center';

  @override
  String get loadingAnimationPositionBottomRight => 'Bottom-Right';

  @override
  String get loadingAnimationPositionBouncing => 'Bouncing';

  @override
  String get loadingAnimationSpeed => 'Animation Speed';

  @override
  String get loadingAnimationSpeedSlow => 'Slow';

  @override
  String get loadingAnimationSpeedModerate => 'Moderate';

  @override
  String get loadingAnimationSpeedFast => 'Fast';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Show Text?';

  @override
  String get loadingAnimationPreview => 'Preview';

  @override
  String get snow => 'Śnieg';

  @override
  String get fireworks => 'Fajerwerki';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Spadające liście';

  @override
  String get themeMusic => 'Muzyka motywu';

  @override
  String get playThemeMusicOnDetailPages =>
      'Odtwarzaj muzykę motywu na stronach szczegółów';

  @override
  String get themeMusicVolume => 'Głośność muzyki motywu';

  @override
  String get themeMusicSettingsSubtitle =>
      'Strony szczegółów, sekcje ekranu głównego i głośność';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Muzyka motywu w sekcjach ekranu głównego';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Odtwarzaj podczas przeglądania ekranu głównego';

  @override
  String get loopThemeMusic => 'Odtwarzaj muzykę motywu w pętli';

  @override
  String get loopThemeMusicSubtitle =>
      'Powtarzaj utwór zamiast odtwarzać go tylko raz';

  @override
  String get detailsBackgroundBlur => 'Rozmycie tła na stronie szczegółów';

  @override
  String get detailsBackgroundOpacity => 'Przezroczystość tła szczegółów';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Rozmycie tła podczas przeglądania';

  @override
  String get maxStreamingBitrate => 'Maksymalny bitrate streamingu';

  @override
  String get maxResolution => 'Maksymalna rozdzielczość';

  @override
  String get playerZoomMode => 'Tryb powiększenia odtwarzacza';

  @override
  String get settingsScrollWheelAction => 'Scroll myszy';

  @override
  String get settingsScrollWheelActionDescription =>
      'Wybierz co będzie robić scroll myszki podczas odtwarzania.';

  @override
  String get scrollWheelActionOff => 'Wyłączone';

  @override
  String get scrollWheelActionSeek => 'Przewijanie (przód / tył)';

  @override
  String get scrollWheelActionVolume => 'Głośność';

  @override
  String get playerTooltipVolume => 'Głośność';

  @override
  String get fit => 'Dopasuj';

  @override
  String get autoCrop => 'Automatyczne przycinanie';

  @override
  String get stretch => 'Rozciągnij';

  @override
  String get refreshRateSwitching => 'Zmiana częstotliwości odświeżania';

  @override
  String get disabled => 'Wyłączone';

  @override
  String get manual => 'Ręcznie';

  @override
  String get autoDetect => 'Wykryj automatycznie';

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
  String get trickplayDisplayStyleSingle => 'Pojedyncza miniatura';

  @override
  String get trickplayDisplayStyleStrip => 'Pasek miniatur';

  @override
  String get trickplayModeFull => 'Pełny ekran';

  @override
  String get trickplaySettingsPreviewHint =>
      'Przeciągnij suwak, aby podejrzeć przewijanie';

  @override
  String get trickplayPreviewScale => 'Rozmiar podglądu';

  @override
  String get trickplayVerticalOffset => 'Odległość od paska postępu';

  @override
  String get trickplayFollowScrubPosition => 'Podążaj za pozycją przewijania';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Podgląd przesuwa się wzdłuż paska postępu podczas przewijania zamiast pozostawać na środku';

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
  String get playerSwipeGestures => 'Gesty głośności i jasności';

  @override
  String get playerSwipeGesturesDescription =>
      'Przesuwaj palcem w górę lub w dół: po lewej stronie, aby zmienić jasność, a po prawej - głośność';

  @override
  String get osdButtons => 'Przyciski odtwarzacza';

  @override
  String get osdButtonsDescription =>
      'Wybierz przyciski wyświetlane w odtwarzaczu';

  @override
  String get osdButtonsSectionDescription =>
      'Sterowanie odtwarzaniem jest zawsze widoczne. Pozostałe przyciski możesz dostosować, a ich układ jest zapisywany osobno dla każdego typu urządzenia.';

  @override
  String get detailButtons => 'Przyciski akcji';

  @override
  String get detailButtonsDescription =>
      'Wybierz przyciski wyświetlane na ekranie szczegółów';

  @override
  String get detailButtonsSectionDescription =>
      'Odtwarzanie jest zawsze na początku, a zablokowane przyciski pozostają widoczne. Resztę możesz ustawić po swojemu, osobno dla każdego typu urządzenia.';

  @override
  String get moveUp => 'Przesuń wyżej';

  @override
  String get moveDown => 'Przesuń niżej';

  @override
  String get buttonOrderHint =>
      'Użyj strzałek, aby zmienić kolejność. Na pilocie przyciski lewo / prawo przesuwają zaznaczony przycisk. Wyłączenie przycisku przeniesie go na koniec listy.';

  @override
  String get orientationLock => 'Blokada orientacji';

  @override
  String get fullscreen => 'Pełny ekran';

  @override
  String get audioBehavior => 'Zachowanie dźwięku';

  @override
  String get downmixToStereo => 'Miksuj do stereo';

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
      'Preferuj audiodeskrypcję zamiast zwykłej ścieżki audio.';

  @override
  String get transcodingAudio => 'Transkodowanie (audio)';

  @override
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transkodowanie z powodu bitrate’u lub rozdzielczości';

  @override
  String get transcodingVideoAndAudio => 'Transkodowanie (wideo i audio)';

  @override
  String get transcodingVideo => 'Transkodowanie (wideo)';

  @override
  String get autoServerDefault => 'Automatycznie (domyślne serwera)';

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
  String get polish => 'polski';

  @override
  String get ac3Passthrough => 'Przekazywanie AC3';

  @override
  String get dtsPassthrough => 'Przekazywanie DTS';

  @override
  String get trueHdSupport => 'Obsługa TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Przesyłaj dźwięk DTS bezpośrednio do amplitunera jako bitstream; wymaga to obsługi DTS przez amplituner oraz ścieżki źródłowej DTS';

  @override
  String get settingsAudioFallbackCodec => 'Zapasowy kodek audio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Wybierz format docelowy transkodowania dźwięku wielokanałowego, gdy strumienia źródłowego nie można odtworzyć bezpośrednio ani przekazać bez dekodowania.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Wykryj automatycznie\n(Zalecane)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Domyślnie)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Tylko stereo)';

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
      'Wykrywanie automatyczne\n(domyślne ustawienie sprzętu)';

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
  String get settingsAudioPassthroughAdvanced =>
      'Przekazywanie dźwięku (zaawansowane)';

  @override
  String get settingsAudioCodecPassthrough => 'Przekazywanie kodeków';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Włączaj tylko formaty obsługiwane przez Twój amplituner lub odbiornik HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Przekazywanie EAC3';

  @override
  String get settingsAudioDtsCorePassthrough => 'Przekazywanie DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Przekazywanie DTS-HD MA';

  @override
  String get settingsAudioPassthroughMode => 'Przekazywanie dźwięku';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'Sposób przesyłania skompresowanego dźwięku przestrzennego do telewizora lub amplitunera.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Wyłączone (zawsze dekoduj na tym urządzeniu)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Automatycznie (zgodnie z możliwościami urządzenia)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Ręcznie (wybierz formaty poniżej)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Miksuj cały zdekodowany dźwięk do dwóch kanałów.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream E-AC-3, w tym Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX => 'Bitstream DTS-HD, w tym DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, w tym Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'Przekazywanie TrueHD';

  @override
  String get settingsDetectedAudioCapabilities => 'Wykryte możliwości audio';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Brakuje jeszcze danych o możliwościach audio.';

  @override
  String get settingsAudioRouteLabel => 'Wyjście';

  @override
  String get settingsAudioDecodeLabel => 'Dekodowanie';

  @override
  String get settingsAudioPassthroughLabel => 'Przekazywanie dźwięku';

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
  String get nextUpAndQueuing => '„Następne” i kolejka';

  @override
  String get nextUpDisplay => 'Wyświetlanie sekcji „Następne”';

  @override
  String get extended => 'Rozszerzony';

  @override
  String get minimal => 'Minimalny';

  @override
  String get nextUpTimeout => 'Limit czasu sekcji „Następne”';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Kolejkowanie treści';

  @override
  String get autoQueueNextEpisodes =>
      'Automatyczne kolejkowanie kolejnych odcinków';

  @override
  String get stillWatchingPrompt => 'Komunikat „Nadal oglądasz?”';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Po $episodes odc. / $hours godz.';
  }

  @override
  String get resumeAndSkip => 'Kontynuuj i pomiń';

  @override
  String get resumeRewind => 'Cofnij przy kontynuowaniu';

  @override
  String get unpauseRewind => 'Cofnij po pauzie';

  @override
  String get fiveSeconds => '5 sekund';

  @override
  String get tenSeconds => '10 sekund';

  @override
  String get fifteenSeconds => '15 sekund';

  @override
  String get thirtySeconds => '30 sekund';

  @override
  String get skipBackLength => 'Czas cofnięcia';

  @override
  String get skipForwardLength => 'Czas przewinięcia do przodu';

  @override
  String get customMpvConfPath => 'Niestandardowa ścieżka do pliku mpv.conf';

  @override
  String get notSetMpvConf =>
      'Nie ustawiono. Moonfin spróbuje użyć domyślnego pliku mpv.conf z folderów aplikacji lub danych.';

  @override
  String get selectMpvConf => 'Wybierz plik mpv.conf';

  @override
  String get pathToMpvConf => '/ścieżka/do/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Ustawienia stylu (rozmiar, kolor, przesunięcie) dotyczą napisów tekstowych (SRT, VTT, TTML). Napisy ASS/SSA korzystają z własnego osadzonego stylu, chyba że funkcja „ASS/SSA Direct Play” jest wyłączona. Stylu napisów bitmapowych (PGS, DVB, VobSub) nie można zmienić.';

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
      'Automatycznie włącza napisy, jeśli domyślna ścieżka audio jest w języku innym niż wybrany.';

  @override
  String get subtitleModeForcedDescription =>
      'Wczytuje tylko napisy oznaczone jako wymuszone.';

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
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles =>
      'Odtwarzanie napisów PGS przez Direct Play';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles =>
      'Odtwarzanie napisów ASS/SSA przez Direct Play';

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
  String get global => 'Globalny';

  @override
  String get desktop => 'Komputer';

  @override
  String get mobile => 'Mobilny';

  @override
  String get tv => 'TV';

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
      'Wybierz profil do wczytania, edycji i synchronizacji. Profil globalny obowiązuje wszędzie, chyba że zastąpi go profil urządzenia. Zielona kropka oznacza bieżący profil urządzenia.';

  @override
  String get loadProfile => 'Wczytaj profil';

  @override
  String get syncing => 'Synchronizacja...';

  @override
  String get syncToProfile => 'Synchronizuj profil';

  @override
  String get resetProfile => 'Resetuj profil';

  @override
  String resetProfileTitle(String profile) {
    return 'Przywrócić domyślne ustawienia profilu $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Usuwa profil $profile z serwera i przywraca domyślne wartości wszystkich synchronizowanych ustawień na tym urządzeniu.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Usuwa wszystkie zapisane profile z serwera i przywraca domyślne wartości wszystkich synchronizowanych ustawień na tym urządzeniu.';

  @override
  String profileReset(String profile) {
    return 'Przywrócono domyślne ustawienia profilu $profile.';
  }

  @override
  String get resetRatingsTitle => 'Przywrócić domyślne oceny?';

  @override
  String get resetRatingsDescription =>
      'Przywraca domyślne ustawienia ocen, w tym widoczne źródła i kolejność ich wyświetlania.';

  @override
  String get ratingsReset => 'Przywrócono domyślne ustawienia ocen.';

  @override
  String failedToResetProfile(String profile) {
    return 'Nie udało się przywrócić domyślnych ustawień profilu $profile.';
  }

  @override
  String get profileSyncHidden => 'Synchronizacja profilu ukryta';

  @override
  String get enablePluginSyncDescription =>
      'Włącz synchronizację wtyczki serwera w ustawieniach wtyczki, aby wyświetlić tutaj opcje profilu.';

  @override
  String get quality => 'Jakość';

  @override
  String get defaultDownloadQuality => 'Domyślna jakość pobierania';

  @override
  String get network => 'Sieć';

  @override
  String get wifiOnlyDownloads => 'Pobieranie tylko przez Wi-Fi';

  @override
  String get tvOfflineDownloads => 'Włącz pobieranie offline';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Pokazuj opcje pobierania na stronach materiałów';

  @override
  String get reportDownloadsActivity =>
      'Pokazuj aktywność pobierania na serwerze';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Pozwól administratorowi serwera wyświetlać transkodowane pobrania w panelu';

  @override
  String get onlyDownloadOnWifi => 'Pobieraj tylko po podłączeniu do Wi-Fi';

  @override
  String get storage => 'Pamięć';

  @override
  String get storageUsed => 'Zajęte miejsce';

  @override
  String get manage => 'Zarządzaj';

  @override
  String get calculating => 'Obliczanie...';

  @override
  String get downloadLocation => 'Lokalizacja pobierania';

  @override
  String get defaultLabel => 'Domyślny';

  @override
  String get sdCard => 'Karta SD';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android pozwala Moonfin zapisywać pliki tylko w folderach aplikacji, a to urządzenie nie ma wymiennej pamięci. Włącz powyżej opcję „Zapisuj w folderze Pobrane”, aby inne aplikacje miały dostęp do pobranych plików.';

  @override
  String get saveToDownloadsFolder => 'Zapisuj w folderze Pobrane';

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
      'Nowe pliki do pobrania zostaną zapisane w wybranym folderze. Istniejącymi plikami można zarządzać w ustawieniach pamięci.';

  @override
  String get confirm => 'Potwierdź';

  @override
  String get cannotWriteToFolder =>
      'Nie można zapisać w wybranym folderze. Wybierz inną lokalizację lub przyznaj uprawnienia do przechowywania.';

  @override
  String get saveToDownloadsFolderQuestion => 'Zapisać w folderze Pobrane?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Pobrane materiały zostaną zapisane w folderze Pobrane/Moonfin na Twoim urządzeniu. Pliki będą widoczne także w innych aplikacjach, np. galerii lub odtwarzaczu muzyki.\n\nIstniejące pobrania pozostaną w obecnej lokalizacji.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transkodowanie: brak informacji o pozostałym czasie';

  @override
  String get enable => 'Włącz';

  @override
  String get clearAllDownloadsWarning =>
      'Usunie to wszystkie pobrane materiały. Tej operacji nie można cofnąć.';

  @override
  String get clearAll => 'Wyczyść wszystko';

  @override
  String get navigationStyle => 'Styl nawigacji';

  @override
  String get topBar => 'Górny pasek';

  @override
  String get leftSidebar => 'Lewy pasek boczny';

  @override
  String get showShuffleButton => 'Pokaż przycisk odtwarzania losowego';

  @override
  String get showGenresButton => 'Pokaż przycisk gatunków';

  @override
  String get showFavoritesButton => 'Pokaż przycisk Ulubione';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

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
  String get teal => 'Morski';

  @override
  String get navy => 'Granatowy';

  @override
  String get charcoal => 'Grafitowy';

  @override
  String get brown => 'Brązowy';

  @override
  String get darkRed => 'Ciemnoczerwony';

  @override
  String get darkGreen => 'Ciemnozielony';

  @override
  String get slate => 'Łupkowy';

  @override
  String get indigo => 'Indygo';

  @override
  String get libraryDisplay => 'Wyświetlanie biblioteki';

  @override
  String get posterLabel => 'Plakat';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Baner';

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
  String get mergeRecentRowsByType => 'Łącz ostatnie sekcje według typu';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Łącz biblioteki tego samego typu w sekcjach „Ostatnio dodane” i „Ostatnio wydane”.';

  @override
  String get libraryView => 'Widok biblioteki';

  @override
  String get enableFolderView => 'Włącz widok folderów';

  @override
  String get showFolderBrowsingOption => 'Pokaż opcję przeglądania folderów';

  @override
  String get groupItemsIntoCollections => 'Grupuj pozycje w kolekcje';

  @override
  String get hideCollectionAssociatedItems =>
      'Ukrywaj pozycje należące do kolekcji podczas przeglądania bibliotek';

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
      'Ustaw widoczność każdej biblioteki na ekranie głównym. Uruchom ponownie Moonfin, aby zastosować zmiany.';

  @override
  String get showInNavigation => 'Pokaż w nawigacji';

  @override
  String get showInLatestMedia =>
      'Pokazuj w sekcjach „Ostatnio dodane” i „Ostatnio wydane”';

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
  String get seconds => 'sekundy';

  @override
  String get localPreviews => 'Lokalne podglądy';

  @override
  String get localPreviewsDescription =>
      'Skonfiguruj podgląd zwiastunów, materiałów i dźwięku.';

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
  String get mediaBarModeBookshelf => 'Półka';

  @override
  String get mediaBarModeGallery => 'Galeria';

  @override
  String get mediaBarModeBanner => 'Baner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Włącz pasek multimediów';

  @override
  String get showFeaturedContentSlideshow =>
      'Pokazuj polecane treści na ekranie głównym';

  @override
  String get contentType => 'Typ treści';

  @override
  String get mediaBarSourceType => 'Źródło';

  @override
  String get mediaBarSourceRandom => 'Losowo';

  @override
  String get moviesAndTvShows => 'Filmy i seriale';

  @override
  String get moviesOnly => 'Tylko filmy';

  @override
  String get tvShowsOnly => 'Tylko seriale';

  @override
  String get itemCount => 'Liczba pozycji';

  @override
  String get noneSelected => 'Nie wybrano żadnego';

  @override
  String get noneExcluded => 'Brak wykluczonych';

  @override
  String get autoAdvance => 'Automatyczne przejście';

  @override
  String get autoAdvanceSlides =>
      'Automatycznie przechodź do następnego slajdu';

  @override
  String get autoAdvanceInterval => 'Czas między slajdami';

  @override
  String get trailerPreview => 'Podgląd zwiastuna';

  @override
  String get autoPlayTrailers =>
      'Automatycznie odtwarzaj zwiastuny na pasku multimediów po 3 sekundach';

  @override
  String get trailerAudio => 'Dźwięk zwiastunów';

  @override
  String get enableTrailerAudio =>
      'Włącz dźwięk w zwiastunach na pasku multimediów';

  @override
  String get trailerCaptions => 'Napisy w zwiastunach';

  @override
  String get trailerCaptionsDescription =>
      'Pokazuj napisy w zwiastunach z YouTube na pasku multimediów';

  @override
  String get episodePreview => 'Podgląd odcinka';

  @override
  String get mediaPreview => 'Podgląd materiałów';

  @override
  String get episodePreviewDescription =>
      'Odtwarzaj 30-sekundowy podgląd na zaznaczonych, wskazanych kursorem lub długo naciśniętych kartach';

  @override
  String get mediaPreviewDescription =>
      'Odtwarzaj 30-sekundowy podgląd na zaznaczonych, wskazanych kursorem lub długo naciśniętych kartach';

  @override
  String get previewAudio => 'Podgląd dźwięku';

  @override
  String get enablePreviewAudio => 'Włącz dźwięk w podglądach materiałów';

  @override
  String get latestMedia => 'Ostatnio dodane';

  @override
  String get recentlyReleased => 'Ostatnio wydane';

  @override
  String get recentlyReleasedSeriesType =>
      'Sortowanie ostatnio wydanych seriali';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sortuj sekcje ostatnio wydanych seriali według serialu, najnowszego sezonu lub daty emisji najnowszego odcinka';

  @override
  String get myMedia => 'Moje media';

  @override
  String get myMediaSmall => 'Moje media (małe)';

  @override
  String get continueWatching => 'Oglądaj dalej';

  @override
  String get resumeAudio => 'Kontynuuj słuchanie';

  @override
  String get resumeBooks => 'Kontynuuj czytanie';

  @override
  String get activeRecordings => 'Aktywne nagrania';

  @override
  String get playlists => 'Playlisty';

  @override
  String get liveTV => 'Telewizja na żywo';

  @override
  String get favoriteChannels => 'Ulubione kanały';

  @override
  String get homeSections => 'Sekcje ekranu głównego';

  @override
  String get resetToDefaults => 'Przywróć ustawienia domyślne';

  @override
  String get homeRowPosterSize => 'Rozmiar plakatów w sekcjach ekranu głównego';

  @override
  String get perRowImageTypeSelection => 'Typ grafiki dla każdej sekcji';

  @override
  String get configureImageTypeForEachRow =>
      'Wybierz typ grafiki osobno dla każdej aktywnej sekcji';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Połącz „Oglądaj dalej” i „Następne”';

  @override
  String get combineBothRows =>
      'Połącz obie sekcje w jedną sekcję ekranu głównego';

  @override
  String get nextUpMaxDays => 'Maksymalna liczba dni w „Następne”';

  @override
  String get nextUpMaxDaysDescription =>
      'Jak długo serial pozostaje w sekcji „Następne” od ostatniego oglądania';

  @override
  String daysValue(int days) {
    return '$days dni';
  }

  @override
  String get fullScreenRows => 'Rozszerzone sekcje ekranu głównego';

  @override
  String get fullScreenRowsDescription =>
      'Wyświetlaj tylko jedną sekcję na ekran';

  @override
  String get homeRowsPadding => 'Odstępy między sekcjami ekranu głównego';

  @override
  String get homeRowsPaddingDescription =>
      'Dostosuj odstępy między sekcjami ekranu głównego';

  @override
  String get perRowImageType => 'Typ grafiki sekcji';

  @override
  String get perRowSettings => 'Ustawienia sekcji';

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
      'Blokuj treści z następującymi klasyfikacjami wiekowymi:';

  @override
  String get noContentRatingsFound =>
      'Na tym serwerze nie znaleziono jeszcze żadnych klasyfikacji wiekowych.';

  @override
  String get couldNotLoadServerRatings =>
      'Nie udało się wczytać klasyfikacji wiekowych z serwera. Wyświetlane są tylko zapisane klasyfikacje.';

  @override
  String get couldNotRefreshRatings =>
      'Nie udało się odświeżyć klasyfikacji wiekowych z serwera. Wyświetlane są zapisane klasyfikacje.';

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
  String get libraryArt => 'Grafiki z biblioteki';

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
  String get maxAgeRating => 'Maksymalna klasyfikacja wiekowa';

  @override
  String get any => 'Dowolna';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Wymagaj klasyfikacji wiekowej';

  @override
  String get onlyShowRatedContent =>
      'Pokazuj tylko treści z klasyfikacją wiekową';

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
  String get screensaverGeneralSettings => 'General Settings';

  @override
  String get screensaverVisualComponents => 'Visual Components';

  @override
  String get screensaverLibraryContent => 'Library Content';

  @override
  String get screensaverBackdrop => 'Backdrop';

  @override
  String get screensaverBackdropBlack => 'Black';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Calm';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Additional Component';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin Logo';

  @override
  String get screensaverComponentRunner => 'Runner';

  @override
  String get screensaverComponentMovement => 'Component Movement';

  @override
  String get screensaverComponentPosition => 'Component Position';

  @override
  String get screensaverComponentSize => 'Component Size';

  @override
  String get screensaverSourceLibrariesDefault => 'All (Default)';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (krytycy)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (widzowie)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (użytkownik)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

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
      'Wtyczka serwera nie jest obecnie wykrywana. Ustawienia lokalne nadal korzystają z zapisanych wartości lub ustawień domyślnych aplikacji.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nWersja: $version';
  }

  @override
  String get availableServices => 'Dostępne usługi';

  @override
  String get serverPluginSync => 'Synchronizacja wtyczki serwera';

  @override
  String get syncSettingsWithPlugin =>
      'Synchronizuj ustawienia z wtyczką serwera';

  @override
  String get whatSyncControls => 'Co obejmuje synchronizacja';

  @override
  String get syncControlsDescription =>
      'Synchronizacja kontroluje tylko to, czy ustawienia oparte na wtyczkach są przesyłane na serwer i pobierane z niego. Wybór profilu i akcje synchronizacji profilu znajdują się w ustawieniach dostosowywania, gdy włączona jest synchronizacja wtyczek.';

  @override
  String get recentRequests => 'Ostatnie prośby';

  @override
  String get recentlyAdded => 'Ostatnio dodane';

  @override
  String get trending => 'Na czasie';

  @override
  String get popularMovies => 'Popularne filmy';

  @override
  String get movieGenres => 'Gatunki filmów';

  @override
  String get upcomingMovies => 'Nadchodzące filmy';

  @override
  String get studios => 'Wytwórnie';

  @override
  String get popularSeries => 'Popularne seriale';

  @override
  String get seriesGenres => 'Gatunki seriali';

  @override
  String get upcomingSeries => 'Nadchodzące seriale';

  @override
  String get networks => 'Serwisy';

  @override
  String get tags => 'Tagi';

  @override
  String get genresAndTags => 'Gatunki i tagi';

  @override
  String get seerrDiscoveryRows => 'Sekcje odkrywania Seerr';

  @override
  String get yourWatchlist => 'Do obejrzenia';

  @override
  String get resetRowsToDefaults => 'Przywróć domyślny układ sekcji';

  @override
  String get enableSeerr => 'Włącz Seerr';

  @override
  String get showSeerrInNavigation =>
      'Pokaż Seerr w nawigacji (wymaga wtyczki serwera)';

  @override
  String get seerrUnavailable =>
      'Niedostępne, ponieważ obsługa Seerr po stronie serwera jest wyłączona.';

  @override
  String get nsfwFilter => 'Filtr NSFW';

  @override
  String get hideAdultContent => 'Ukryj w wynikach treści dla dorosłych';

  @override
  String get seerrNotificationsSection => 'Powiadomienia';

  @override
  String get seerrNotifyNewRequestsTitle => 'Powiadomienia o nowych prośbach';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Powiadamiaj mnie, gdy ktoś wyśle prośbę';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Aktualizacje próśb';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Zatwierdzenia, odrzucenia i dodanie do biblioteki';

  @override
  String get seerrNotifyIssuesTitle => 'Aktualizacje zgłoszeń';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Nowe zgłoszenia, odpowiedzi i rozwiązania';

  @override
  String get seerrNotifyNewMediaTitle => 'Dodano nowe treści';

  @override
  String get seerrNotifyNewMediaSubtitle => 'Nowe pozycje w bibliotece';

  @override
  String loggedInAs(String username) {
    return 'Zalogowano jako: $username';
  }

  @override
  String get discoverRows => 'Odkryj w Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Wybierz sekcje widoczne na stronie głównej Seerr. Przeciągnij, aby zmienić kolejność. Własna kolejność synchronizuje się z Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Wybierz sekcje widoczne na stronie głównej Seerr. Przeciągnij, aby zmienić kolejność. Własna kolejność synchronizuje się z Moonbase.';

  @override
  String get enabled => 'Włączone';

  @override
  String get hidden => 'Ukryty';

  @override
  String get aboutTitle => 'O aplikacji';

  @override
  String versionValue(String version) {
    return 'Wersja $version';
  }

  @override
  String get openSourceLicenses => 'Licencje open source';

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
      'Nie udało się teraz sprawdzić dostępności aktualizacji.';

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
  String get updateNotifications => 'Powiadomienia o aktualizacjach';

  @override
  String get showWhenUpdatesAvailable =>
      'Pokaż, kiedy dostępne są aktualizacje';

  @override
  String updateAvailableTitle(String version) {
    return 'Dostępna wersja v$version';
  }

  @override
  String get readReleaseNotes => 'Przeczytaj informacje o wersji';

  @override
  String get downloadingUpdate => 'Pobieranie aktualizacji...';

  @override
  String get updateDownloadFailed =>
      'Pobieranie aktualizacji nie powiodło się. Spróbuj ponownie.';

  @override
  String get openReleasesPage => 'Otwórz stronę z wydaniami';

  @override
  String get navigation => 'Nawigacja';

  @override
  String get watchedIndicatorsBackdrops => 'Wskaźniki obejrzenia, grafiki tła';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Kolor zaznaczenia, wskaźniki obejrzenia, grafiki tła';

  @override
  String get navbarStyleToolbarAppearance =>
      'Styl paska nawigacyjnego, przyciski paska narzędzi, wygląd';

  @override
  String get reorderToggleHomeRows =>
      'Zmień kolejność i widoczność sekcji z biblioteki i źródeł zewnętrznych';

  @override
  String get featuredContentAppearance => 'Polecane treści, wygląd';

  @override
  String get posterSizeImageTypeFolderView =>
      'Rozmiar plakatu, typ obrazu, widok folderów';

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
  String get browse => 'Przeglądaj';

  @override
  String get noResults => 'Brak wyników';

  @override
  String get seerrAvailableStatus => 'Dostępne';

  @override
  String get seerrRequestedStatus => 'Prośba wysłana';

  @override
  String get seerrDownloading => 'Pobieranie';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Pobieranie · $done / $total';
  }

  @override
  String seerrDownloadedOfTotal(String done, String total) {
    return '$done / $total';
  }

  @override
  String seerrPercentValue(int percent) {
    return '$percent%';
  }

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Pobieranie · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importowanie';

  @override
  String itemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pozycji',
      many: '$count pozycji',
      few: '$count pozycje',
      one: '$count pozycja',
    );
    return '$_temp0';
  }

  @override
  String get seerrSettings => 'Ustawienia Seerr';

  @override
  String get requestMore => 'Poproś o więcej';

  @override
  String get requestMore4k => 'Poproś o więcej w 4K';

  @override
  String get request => 'Poproś';

  @override
  String get request4k => 'Poproś o 4K';

  @override
  String get requested4k => 'Poproszono o 4K';

  @override
  String get cancelRequest => 'Anuluj prośbę';

  @override
  String get cancelRequest4k => 'Anuluj prośbę o 4K';

  @override
  String get playInMoonfin => 'Odtwórz w Moonfin';

  @override
  String requestedByName(String name) {
    return 'Prośba od $name';
  }

  @override
  String get manageRequests => 'Zarządzaj prośbami';

  @override
  String get watchlist => 'Do obejrzenia';

  @override
  String get onWatchlist => 'Na liście „Do obejrzenia”';

  @override
  String get approve => 'Zatwierdź';

  @override
  String get declineAction => 'Odrzuć';

  @override
  String get similar => 'Podobne';

  @override
  String get recommendations => 'Polecane';

  @override
  String cancelRequestForTitle(String title) {
    return 'Anulować prośbę o „$title”?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prośby o „$title”',
      many: '$count próśb o „$title”',
      few: '$count prośby o „$title”',
      one: '$count prośbę o „$title”',
    );
    return 'Anulować $_temp0?';
  }

  @override
  String get keep => 'Zachowaj';

  @override
  String get itemNotFoundInLibrary =>
      'Nie znaleziono tego tytułu w bibliotece Moonfin';

  @override
  String get errorSearchingLibrary => 'Nie udało się przeszukać biblioteki';

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
    return 'Poproś o $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Poproś o $type w 4K';
  }

  @override
  String get submitRequest => 'Poproś';

  @override
  String get allSeasons => 'Wszystkie sezony';

  @override
  String get seerrSeriesContinuing =>
      'Serial jest kontynuowany · O kolejne sezony będzie można poprosić';

  @override
  String get advancedOptions => 'Opcje zaawansowane';

  @override
  String get noServiceServersConfigured =>
      'Nie skonfigurowano żadnych serwerów usług';

  @override
  String get server => 'Serwer';

  @override
  String get qualityProfile => 'Profil jakości';

  @override
  String get rootFolder => 'Folder główny';

  @override
  String get showMore => 'Pokaż więcej';

  @override
  String get appearances => 'Role';

  @override
  String get crewSection => 'Twórcy';

  @override
  String ageValue(int age) {
    return 'Wiek: $age';
  }

  @override
  String get noRequests => 'Brak próśb';

  @override
  String get pendingStatus => 'Oczekujące';

  @override
  String get declinedStatus => 'Odrzucone';

  @override
  String get partiallyAvailable => 'Częściowo dostępne';

  @override
  String get downloadingStatus => 'Pobieranie';

  @override
  String get approvedStatus => 'Zatwierdzone';

  @override
  String get notRequestedStatus => 'Brak prośby';

  @override
  String get blocklistedStatus => 'Zablokowane';

  @override
  String get deletedStatus => 'Usunięte';

  @override
  String get failedStatus => 'Niepowodzenie';

  @override
  String get processingStatus => 'Przetwarzanie';

  @override
  String modifiedByName(String name) {
    return 'Zmienione przez $name';
  }

  @override
  String get completedStatus => 'Zakończone';

  @override
  String get requestErrorDuplicate => 'Prośba o ten tytuł została już wysłana';

  @override
  String get requestErrorQuota => 'Osiągnięto limit próśb';

  @override
  String get requestErrorBlocklisted =>
      'Ten tytuł jest na liście zablokowanych';

  @override
  String get requestErrorNoSeasons => 'Brak sezonów, o które można poprosić';

  @override
  String get requestErrorPermission =>
      'Nie masz uprawnień do wysłania tej prośby';

  @override
  String get seerrRequestsTitle => 'Prośby';

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
    return 'Pozostało $remaining z $limit próśb o filmy';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Pozostało $remaining z $limit próśb o sezony';
  }

  @override
  String partOfCollectionName(String name) {
    return 'W kolekcji $name';
  }

  @override
  String get viewCollection => 'Zobacz kolekcję';

  @override
  String get requestCollection => 'Poproś o kolekcję';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmów · $available dostępnych';
  }

  @override
  String requestMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filmu',
      many: '$count filmów',
      few: '$count filmy',
      one: '$count film',
    );
    return 'Poproś o $_temp0';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Wysyłanie próśb: $current z $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'prośby o $count filmu',
      many: 'próśb o $count filmów',
      few: 'prośby o $count filmy',
      one: 'prośbę o $count film',
    );
    return 'Wysłano $_temp0';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Wysłano prośby o $ok z $total filmów';
  }

  @override
  String get collectionAllRequested =>
      'Wszystkie filmy są już dostępne lub objęte prośbą';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count komentarza',
      many: '$count komentarzy',
      few: '$count komentarze',
      one: '$count komentarz',
    );
    return '$_temp0';
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
  String get releaseDateLabel => 'Data premiery';

  @override
  String get firstAirDateLabel => 'Data pierwszej emisji';

  @override
  String get revenueLabel => 'Przychód';

  @override
  String get runtimeLabel => 'Czas trwania';

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
  String get content => 'Treści';

  @override
  String get copy => 'Kopiuj';

  @override
  String get create => 'Utwórz';

  @override
  String get disable => 'Wyłącz';

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
  String get go => 'Przejdź';

  @override
  String get install => 'Zainstaluj';

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
  String get refresh => 'Odśwież';

  @override
  String get remote => 'Pilot';

  @override
  String get rename => 'Zmień nazwę';

  @override
  String get revoke => 'Cofnij';

  @override
  String get role => 'Rola';

  @override
  String get root => 'Główny';

  @override
  String get run => 'Uruchom';

  @override
  String get search => 'Szukaj';

  @override
  String get select => 'Wybierz';

  @override
  String get send => 'Wyślij';

  @override
  String get sessions => 'Sesje';

  @override
  String get set => 'Ustaw';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Zatrzymaj';

  @override
  String get streaming => 'Streaming';

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
  String get upload => 'Prześlij';

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
  String get adminDrawerResume => 'Wznawianie';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Urządzenia';

  @override
  String get adminDrawerActivity => 'Aktywność';

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
  String get adminExitTooltip => 'Wyjdź z panelu administracyjnego';

  @override
  String get adminDashboardLoadFailed => 'Nie udało się wczytać panelu';

  @override
  String get adminMediaOverview => 'Przegląd treści';

  @override
  String get adminMediaTotalsError =>
      'Nie udało się wczytać podsumowania treści na serwerze.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Szybki przegląd treści znajdujących się na tym serwerze.';

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
    return 'Nieudane zaplanowane zadania: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Ostatnie ostrzeżenia/błędy: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Podział treści';

  @override
  String get analyticsVideoCodecs => 'Kodeki wideo';

  @override
  String get analyticsAudioCodecs => 'Kodeki audio';

  @override
  String get analyticsContainers => 'Kontenery';

  @override
  String get analyticsTopGenres => 'Najpopularniejsze gatunki';

  @override
  String get analyticsReleaseYears => 'Lata wydania';

  @override
  String get analyticsContentRatings => 'Klasyfikacje wiekowe';

  @override
  String get analyticsRuntimeBuckets => 'Przedziały czasu trwania';

  @override
  String get analyticsFileFormats => 'Formaty plików';

  @override
  String get analyticsNoData => 'Brak dostępnych danych.';

  @override
  String get adminServerInfo => 'Informacje o serwerze';

  @override
  String get adminRestartPending => 'Oczekuje na ponowne uruchomienie';

  @override
  String get adminServerPaths => 'Ścieżki serwera';

  @override
  String get adminServerActions => 'Działania serwera';

  @override
  String get adminRestartServer => 'Uruchom ponownie serwer';

  @override
  String get adminShutdownServer => 'Wyłącz serwer';

  @override
  String get adminScanLibraries => 'Skanuj biblioteki';

  @override
  String get adminLibraryScanStarted => 'Rozpoczęto skanowanie biblioteki';

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
  String get adminSessionsLoadFailed => 'Nie udało się wczytać sesji';

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
  String get sessionRewind => 'Przewiń do tyłu';

  @override
  String get sessionForward => 'Przewiń do przodu';

  @override
  String get sessionNext => 'Następny';

  @override
  String get sessionVolumeDown => 'Głośność −';

  @override
  String get sessionVolumeUp => 'Głośność +';

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
  String get adminDisconnect => 'Odłącz';

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
    return 'Usunąć urządzenie \'$name\'? Użytkownik będzie musiał ponownie zalogować się na tym urządzeniu.';
  }

  @override
  String get adminDeleteAllDevices => 'Usuń wszystkie urządzenia';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count urządzenia? Objęci użytkownicy będą musieli zalogować się ponownie.',
      many:
          '$count urządzeń? Objęci użytkownicy będą musieli zalogować się ponownie.',
      few:
          '$count urządzenia? Objęci użytkownicy będą musieli zalogować się ponownie.',
      one:
          '$count urządzenie? Objęty użytkownik będzie musiał zalogować się ponownie.',
    );
    return 'Usunąć $_temp0 Nie dotyczy to Twojego bieżącego urządzenia.';
  }

  @override
  String get adminDevicesDeletedAll => 'Usunięto urządzenia';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Usunięto część urządzeń; nie udało się usunąć $count.';
  }

  @override
  String get adminDevicesLoadFailed => 'Nie udało się wczytać urządzeń';

  @override
  String get adminSearchDevices => 'Wyszukaj urządzenia';

  @override
  String get adminThisDevice => 'To urządzenie';

  @override
  String get adminEditName => 'Edytuj nazwę';

  @override
  String get adminLibrariesLoadFailed => 'Nie udało się wczytać bibliotek';

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
  String get adminLibraryLoadFailed => 'Nie udało się wczytać biblioteki';

  @override
  String get adminNoMediaPaths => 'Nie skonfigurowano ścieżek do multimediów';

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
  String get adminMetadataCountryHint => 'np. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Ścieżki';

  @override
  String get adminLibraryTabOptions => 'Opcje';

  @override
  String get adminLibraryTabDownloaders => 'Narzędzia pobierania';

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
      'Ten serwer nie udostępnia żadnych narzędzi pobierania dla tego typu biblioteki.';

  @override
  String get adminLibrarySectionGeneral => 'Ogólne';

  @override
  String get adminLibrarySectionMetadata => 'Metadane';

  @override
  String get adminLibrarySectionEmbedded => 'Informacje osadzone';

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
  String get adminLibDateAddedLabel => 'Źródło daty dodania';

  @override
  String get adminLibDateAddedImport => 'Data dodania do biblioteki';

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
      'Czas trwania zastępczych rozdziałów (sekundy)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Długość rozdziałów generowanych dla materiałów, które ich nie mają. Ustaw 0, aby wyłączyć.';

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
      'Włącz zamianę ścieżek obrazów w plikach NFO';

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
  String get adminLibEmbeddedAllowAll => 'Wszystkie';

  @override
  String get adminLibEmbeddedAllowText => 'Tylko tekstowe';

  @override
  String get adminLibEmbeddedAllowImage => 'Tylko graficzne';

  @override
  String get adminLibEmbeddedAllowNone => 'Brak';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Pomiń pobieranie, jeśli są osadzone napisy';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Pomiń pobieranie, jeśli ścieżka audio jest w wybranym języku';

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
  String get adminUsersLoadFailed => 'Nie udało się wczytać użytkowników';

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
  String get adminUserLoadFailed => 'Nie udało się wczytać użytkownika';

  @override
  String get adminBackToUsers => 'Wróć do użytkowników';

  @override
  String get adminSaveProfile => 'Zapisz profil';

  @override
  String get adminDeleteUser => 'Usuń użytkownika';

  @override
  String get admin => 'Administrator';

  @override
  String get adminFullAccessWarning =>
      'Administratorzy mają pełny dostęp do serwera. Nadawaj te uprawnienia ostrożnie.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Ukryty użytkownik';

  @override
  String get adminAllowMediaPlayback => 'Zezwól na odtwarzanie treści';

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
  String get adminAllowContentDownloading => 'Zezwalaj na pobieranie treści';

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
  String get adminRemoteBitrateLimit => 'Limit bitrate klienta zdalnego (bps)';

  @override
  String get adminLeaveEmptyNoLimit =>
      'Pozostaw puste, aby nie ustawiać limitu';

  @override
  String get adminMaxActiveSessions => 'Maksymalna liczba aktywnych sesji';

  @override
  String get adminAllowLiveTvAccess => 'Zezwól na dostęp do telewizji na żywo';

  @override
  String get adminAllowLiveTvManagement =>
      'Zezwalaj na zarządzanie telewizją na żywo';

  @override
  String get adminAllowCollectionManagement =>
      'Zezwalaj na zarządzanie kolekcjami';

  @override
  String get adminAllowSubtitleManagement => 'Zezwalaj na zarządzanie napisami';

  @override
  String get adminAllowLyricManagement =>
      'Zezwalaj na zarządzanie tekstami utworów';

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
  String get adminPasswordReset => 'Reset hasła';

  @override
  String get adminPasswordUpdated => 'Hasło zaktualizowane';

  @override
  String get adminUserSettings => 'Ustawienia użytkownika';

  @override
  String get adminLibraryAccess => 'Dostęp do biblioteki';

  @override
  String get adminDeviceAndChannelAccess => 'Dostęp do urządzeń i kanałów';

  @override
  String get adminEnableAllDevices => 'Włącz dostęp do wszystkich urządzeń';

  @override
  String get adminEnableAllChannels => 'Włącz dostęp do wszystkich kanałów';

  @override
  String get adminParentalControl => 'Kontrola rodzicielska';

  @override
  String get adminMaxParentalRating =>
      'Maksymalna dozwolona klasyfikacja wiekowa';

  @override
  String get adminMaxParentalRatingHint =>
      'Treści z wyższą klasyfikacją wiekową będą ukryte przed tym użytkownikiem.';

  @override
  String get adminParentalRatingNone => 'Brak';

  @override
  String get adminBlockUnratedItems =>
      'Blokuj treści bez klasyfikacji wiekowej lub z nierozpoznaną klasyfikacją';

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
      'Zezwalaj na dostęp tylko w godzinach określonych poniżej. Jeśli nie ustawiono harmonogramu, dostęp jest możliwy przez cały dzień.';

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
  String get adminDayWeekday => 'Dni powszednie';

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
      'Wyświetlane są tylko treści z tymi tagami. Pozostaw pole puste, aby zezwolić na wszystkie.';

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
      'Hasło zostanie usunięte. Użytkownik będzie mógł zalogować się bez hasła.';

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
  String get adminApiKeysLoadFailed => 'Nie udało się wczytać kluczy API';

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
  String get adminConfirmRestore => 'Potwierdź przywrócenie';

  @override
  String get adminRestoringBackup => 'Przywracanie kopii zapasowej...';

  @override
  String adminRestoreFailed(String error) {
    return 'Nie udało się przywrócić kopii zapasowej: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nie udało się wczytać kopii zapasowych';

  @override
  String get adminCreateBackup => 'Utwórz kopię zapasową';

  @override
  String get adminNoBackups => 'Nie znaleziono kopii zapasowych';

  @override
  String get adminViewDetails => 'Zobacz szczegóły';

  @override
  String get restore => 'Przywróć';

  @override
  String get adminLogsLoadFailed => 'Nie udało się wczytać logów serwera';

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
  String get adminNoMatchingLines => 'Brak pasujących wierszy';

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
  String get adminLastExecution => 'Ostatnie uruchomienie';

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
  String get adminExperimentalIntegration => 'Integracja eksperymentalna';

  @override
  String get adminExperimentalWarning =>
      'Integracja ustawień wtyczek jest wciąż w fazie eksperymentalnej. Niektóre strony ustawień mogą nie wyświetlać się poprawnie.';

  @override
  String get continueAction => 'Kontynuuj';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return 'Wtyczka „$name” zostanie usunięta po ponownym uruchomieniu serwera';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Nie udało się odinstalować: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Aktualizowanie „$name” do wersji $version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nie można otworzyć ustawień: brak tokena uwierzytelniania.';

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
  String get adminNoChangelog => 'Brak listy zmian.';

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
  String get adminRepositoryNameHint => 'np. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'Adres URL repozytorium';

  @override
  String get adminAddEntry => 'Dodaj wpis';

  @override
  String get adminInvalidUrl => 'Nieprawidłowy adres URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nie udało się wczytać ustawień wtyczki: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nie udało się otworzyć $uri';
  }

  @override
  String get adminOpenInBrowser => 'Otwórz w przeglądarce';

  @override
  String get adminOpenExternally => 'Otwórz poza aplikacją';

  @override
  String get adminGeneralSettings => 'Ustawienia ogólne';

  @override
  String get adminServerName => 'Nazwa serwera';

  @override
  String get adminPreferredMetadataCountry => 'Preferowany kraj dla metadanych';

  @override
  String get adminCachePath => 'Ścieżka pamięci podręcznej';

  @override
  String get adminMetadataPath => 'Ścieżka metadanych';

  @override
  String get adminLibraryScanConcurrency =>
      'Współbieżność skanowania biblioteki';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limit równoległego kodowania obrazów';

  @override
  String get adminSlowResponseThreshold => 'Próg wolnej odpowiedzi (ms)';

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
  String get adminStreamingSaved => 'Ustawienia streamingu zostały zapisane';

  @override
  String get adminStreamingLoadFailed =>
      'Nie udało się wczytać ustawień streamingu';

  @override
  String get adminStreamingDescription =>
      'Ustaw globalne limity bitrate streamingu dla połączeń zdalnych.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limit bitrate klienta zdalnego (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Pozostaw puste lub wpisz 0, aby nie ustawiać limitu';

  @override
  String get adminPlaybackSaved => 'Ustawienia odtwarzania zostały zapisane';

  @override
  String get adminPlaybackLoadFailed =>
      'Nie udało się wczytać ustawień odtwarzania';

  @override
  String get adminPlaybackTranscoding => 'Odtwarzanie i transkodowanie';

  @override
  String get adminHardwareAcceleration => 'Akceleracja sprzętowa';

  @override
  String get adminVaapiDevice => 'Urządzenie VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Włącz kodowanie sprzętowe';

  @override
  String get adminEnableHardwareDecoding => 'Włącz dekodowanie sprzętowe dla:';

  @override
  String get adminEncodingThreads => 'Wątki kodowania';

  @override
  String get adminAutomatic => '0 = automatycznie';

  @override
  String get adminTranscodingTempPath => 'Ścieżka tymczasowa transkodowania';

  @override
  String get adminEnableFallbackFont => 'Włącz czcionkę zastępczą';

  @override
  String get adminFallbackFontPath => 'Ścieżka czcionki zastępczej';

  @override
  String get adminAllowSegmentDeletion => 'Zezwalaj na usuwanie segmentów';

  @override
  String get adminSegmentKeepSeconds =>
      'Czas przechowywania segmentów (sekundy)';

  @override
  String get adminThrottleBuffering => 'Ogranicz buforowanie';

  @override
  String get adminTrickplaySaved => 'Ustawienia Trickplay zostały zapisane';

  @override
  String get adminTrickplayLoadFailed =>
      'Nie udało się wczytać ustawień Trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Włącz akcelerację sprzętową';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Wyodrębniaj tylko klatki kluczowe';

  @override
  String get adminKeyFrameSubtitle => 'Szybciej, ale z mniejszą dokładnością';

  @override
  String get adminScanBehavior => 'Sposób skanowania';

  @override
  String get adminProcessPriority => 'Priorytet procesu';

  @override
  String get adminImageSettings => 'Ustawienia obrazu';

  @override
  String get adminIntervalMs => 'Interwał (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Jak często przechwytywać klatki';

  @override
  String get adminWidthResolutions => 'Rozdzielczości według szerokości';

  @override
  String get adminTileWidth => 'Szerokość kafelka';

  @override
  String get adminTileHeight => 'Wysokość kafelka';

  @override
  String get adminQualitySubtitle =>
      'Niższe wartości = lepsza jakość, większe pliki';

  @override
  String get adminProcessThreads => 'Wątki procesu';

  @override
  String get adminResumeSaved => 'Zapisano ustawienia wznawiania';

  @override
  String get adminResumeLoadFailed =>
      'Nie udało się wczytać ustawień wznawiania';

  @override
  String get adminResumeDescription =>
      'Określ, kiedy materiał ma być oznaczany jako częściowo lub w pełni odtworzony.';

  @override
  String get adminMinResumePercentage => 'Minimalny próg wznowienia';

  @override
  String get adminMinResumeSubtitle =>
      'Postęp zostanie zapisany po odtworzeniu materiału powyżej tego progu';

  @override
  String get adminMaxResumePercentage => 'Próg pełnego odtworzenia';

  @override
  String get adminMaxResumeSubtitle =>
      'Po przekroczeniu tego progu materiał jest uznawany za w pełni odtworzony';

  @override
  String get adminMinResumeDuration =>
      'Minimalny czas trwania materiału do wznowienia (sekundy)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Materiały krótsze niż ten czas nie będą wznawiane';

  @override
  String get adminMinAudiobookResume => 'Minimalny próg wznowienia audiobooka';

  @override
  String get adminMaxAudiobookResume => 'Próg pełnego odsłuchania audiobooka';

  @override
  String get adminNetworkingSaved =>
      'Ustawienia sieciowe zostały zapisane. Może być wymagane ponowne uruchomienie serwera.';

  @override
  String get adminNetworkingLoadFailed =>
      'Nie udało się wczytać ustawień sieciowych';

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
  String get adminKnownProxies => 'Znane serwery proxy';

  @override
  String get adminRemoteIpFilter => 'Zdalny filtr IP';

  @override
  String get adminRemoteIpFilterEntries => 'Zdalny filtr IP';

  @override
  String get adminCertificatePath => 'Ścieżka certyfikatu';

  @override
  String get whitelist => 'Lista dozwolonych';

  @override
  String get blacklist => 'Lista blokowanych';

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
  String get recursive => 'Rekurencyjnie';

  @override
  String get adminReplaceAllMetadata => 'Zastąp wszystkie metadane';

  @override
  String get adminReplaceAllImages => 'Zastąp wszystkie obrazy';

  @override
  String get adminMetadataRefreshRequested => 'Zlecono odświeżenie metadanych';

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
  String get adminUpdateContentType => 'Zaktualizuj typ treści';

  @override
  String get adminContentType => 'Typ treści';

  @override
  String get adminContentTypeUpdated => 'Zaktualizowano typ treści';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nie udało się zaktualizować typu treści: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nie udało się wczytać edytora metadanych';

  @override
  String get adminNoPeopleEntries => 'Brak osób';

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
  String get adminTunerFriendlyName => 'Nazwa wyświetlana';

  @override
  String get adminTunerUserAgent => 'User-Agent';

  @override
  String get adminTunerCount => 'Limit jednoczesnych połączeń';

  @override
  String get adminTunerCountHelp =>
      'Maksymalna liczba strumieni obsługiwanych jednocześnie przez tuner. Ustaw 0, aby znieść limit.';

  @override
  String get adminTunerFallbackBitrate => 'Zapasowy limit bitrate streamingu';

  @override
  String get adminTunerImportFavoritesOnly => 'Importuj tylko ulubione kanały';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Zezwalaj na transkodowanie sprzętowe';

  @override
  String get adminTunerAllowFmp4 =>
      'Zezwalaj na używanie kontenera fMP4 podczas transkodowania';

  @override
  String get adminTunerAllowStreamSharing =>
      'Zezwalaj na współdzielenie strumieni';

  @override
  String get adminTunerEnableStreamLooping => 'Włącz zapętlanie strumienia';

  @override
  String get adminTunerIgnoreDts => 'Ignoruj DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Odczytuj wejście z natywną liczbą klatek na sekundę';

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
  String get adminAddGuideProvider => 'Dodaj dostawcę programu TV';

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
  String get adminTunerResetRequested => 'Zlecono reset tunera';

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
  String get adminPrePadding => 'Zapas przed nagraniem (minuty)';

  @override
  String get adminPostPadding => 'Zapas po nagraniu (minuty)';

  @override
  String get adminRecordingPath => 'Ścieżka nagrywania';

  @override
  String get adminSeriesRecordingPath => 'Ścieżka nagrywania seriali';

  @override
  String get adminMovieRecordingPath => 'Ścieżka nagrań filmów';

  @override
  String get adminGuideDays => 'Liczba dni danych programu TV';

  @override
  String get adminGuideDaysAuto => 'Automatycznie';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dni';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Ścieżka aplikacji do przetwarzania końcowego';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Argumenty aplikacji przetwarzania końcowego';

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
  String get adminMappingJson => 'Mapowanie JSON';

  @override
  String get adminMappingJsonHint => 'Przykład: dane JSON mapowania';

  @override
  String get adminChannelMappingsUpdated => 'Zaktualizowano mapowania kanałów';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Nie udało się zaktualizować mapowań: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nie udało się wczytać panelu administracyjnego telewizji na żywo';

  @override
  String get adminTunerDevices => 'Urządzenia tunerów';

  @override
  String get adminNoTunerHosts => 'Nie skonfigurowano żadnych tunerów';

  @override
  String get adminGuideProviders => 'Dostawcy programu TV';

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
  String get adminTunerDiscovery => 'Wykrywanie tunerów';

  @override
  String get adminChannelMappings => 'Mapowania kanałów';

  @override
  String get adminNoDiscoveredTuners => 'Nie wykryto jeszcze tunerów';

  @override
  String get adminSettingsSaved => 'Ustawienia zostały zapisane';

  @override
  String get adminBackupsNotAvailable =>
      'Kopie zapasowe nie są dostępne w tej wersji serwera.';

  @override
  String get adminRestoreWarning1 =>
      'Przywrócenie zastąpi WSZYSTKIE bieżące dane serwera danymi z kopii zapasowej.';

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
      'Poproszono o przywrócenie. Ponowne uruchomienie serwera może rozłączyć tę sesję.';

  @override
  String get adminBackupsTitle => 'Kopie zapasowe';

  @override
  String get adminUnknownDate => 'Nieznana data';

  @override
  String get adminUnnamedBackup => 'Nienazwana kopia zapasowa';

  @override
  String get adminLiveTvNotAvailable =>
      'Administracja telewizją na żywo jest niedostępna w tej wersji serwera.';

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
  String get adminLogsOldestFirst => 'Najpierw najstarsze';

  @override
  String get adminLogsJustNow => 'Przed chwilą';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dopasowania',
      many: '$count dopasowań',
      few: '$count dopasowania',
      one: '$count dopasowanie',
    );
    return '$_temp0';
  }

  @override
  String get adminLogViewerNoMatches => 'Brak pasujących wierszy';

  @override
  String get adminMetadataEditorTitle => 'Edytor metadanych';

  @override
  String get adminMetadataIdentify => 'Zidentyfikuj';

  @override
  String get adminMetadataType => 'Typ';

  @override
  String get adminMetadataDetails => 'Szczegóły';

  @override
  String get adminMetadataExternalIds => 'Identyfikatory zewnętrzne';

  @override
  String get adminMetadataImages => 'Obrazy';

  @override
  String get adminMetadataFieldTitle => 'Tytuł';

  @override
  String get adminMetadataFieldSortTitle => 'Tytuł sortowania';

  @override
  String get adminMetadataFieldOriginalTitle => 'Tytuł oryginalny';

  @override
  String get adminMetadataFieldPremiereDate => 'Data premiery (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data zakończenia (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Rok produkcji';

  @override
  String get adminMetadataFieldOfficialRating => 'Klasyfikacja wiekowa';

  @override
  String get adminMetadataFieldCommunityRating => 'Ocena społeczności';

  @override
  String get adminMetadataFieldCriticRating => 'Ocena krytyków';

  @override
  String get adminMetadataFieldCustomRating => 'Niestandardowa klasyfikacja';

  @override
  String get adminMetadataFieldTagline => 'Hasło';

  @override
  String get adminMetadataFieldOverview => 'Opis';

  @override
  String get adminMetadataFieldDisplayOrder => 'Kolejność wyświetlania';

  @override
  String get adminMetadataDisplayOrderAired => 'Emisja';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Oryginalna data emisji';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolutna';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Cyfrowa';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Wątek fabularny';

  @override
  String get adminMetadataDisplayOrderProduction => 'Produkcja';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternatywna';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regionalna';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Alternatywna DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Data modyfikacji';

  @override
  String get adminMetadataDisplayOrderSortName => 'Nazwa sortowania';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Data premiery';

  @override
  String get adminMetadataSettings => 'Ustawienia metadanych';

  @override
  String get adminMetadataDownloadLanguage => 'Preferowany język pobierania';

  @override
  String get adminMetadataCountryRegion => 'Kraj/region';

  @override
  String get adminMetadataInheritHelp =>
      'Pozostaw wartość „Domyślne”, aby odziedziczyć ustawienie z pozycji nadrzędnej lub domyślnych ustawień serwera.';

  @override
  String get adminMetadataField3DFormat => 'Format 3D';

  @override
  String get adminMetadataPersonKindUnknown => 'Nieznany';

  @override
  String get adminMetadataPersonKindActor => 'Aktor';

  @override
  String get adminMetadataPersonKindDirector => 'Reżyser';

  @override
  String get adminMetadataPersonKindComposer => 'Kompozytor';

  @override
  String get adminMetadataPersonKindWriter => 'Scenarzysta';

  @override
  String get adminMetadataPersonKindGuestStar => 'Gościnnie';

  @override
  String get adminMetadataPersonKindProducer => 'Producent';

  @override
  String get adminMetadataPersonKindConductor => 'Dyrygent';

  @override
  String get adminMetadataPersonKindLyricist => 'Autor tekstów';

  @override
  String get adminMetadataPersonKindArranger => 'Aranżer';

  @override
  String get adminMetadataPersonKindEngineer => 'Inżynier dźwięku';

  @override
  String get adminMetadataPersonKindMixer => 'Realizator miksu';

  @override
  String get adminMetadataPersonKindRemixer => 'Remikser';

  @override
  String get adminMetadataPersonKindCreator => 'Twórca';

  @override
  String get adminMetadataPersonKindArtist => 'Artysta';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Wykonawca albumu';

  @override
  String get adminMetadataPersonKindAuthor => 'Autor';

  @override
  String get adminMetadataPersonKindIllustrator => 'Ilustrator';

  @override
  String get adminMetadataPersonKindPenciller => 'Rysownik';

  @override
  String get adminMetadataPersonKindInker => 'Tuszownik';

  @override
  String get adminMetadataPersonKindColorist => 'Kolorysta';

  @override
  String get adminMetadataPersonKindLetterer => 'Liternik';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Autor okładki';

  @override
  String get adminMetadataPersonKindEditor => 'Redaktor';

  @override
  String get adminMetadataPersonKindTranslator => 'Tłumacz';

  @override
  String get adminMetadataPersonKindNarrator => 'Narrator';

  @override
  String get adminMetadataAirDays => 'Dni emisji';

  @override
  String get adminMetadataLockItem =>
      'Zablokuj tę pozycję, aby zapobiec przyszłym zmianom metadanych';

  @override
  String get adminMetadataEnabledFields => 'Włączone pola';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Odznacz pole, aby je zablokować i zapobiec zmianom jego danych.';

  @override
  String get adminMetadataLockFieldName => 'Nazwa';

  @override
  String get adminMetadataLockFieldOverview => 'Opis';

  @override
  String get adminMetadataLockFieldGenres => 'Gatunki';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Klasyfikacja wiekowa';

  @override
  String get adminMetadataLockFieldCast => 'Osoby';

  @override
  String get adminMetadataLockFieldProductionLocations => 'Miejsca produkcji';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Miejsce urodzenia';

  @override
  String get adminMetadataLockFieldRuntime => 'Czas trwania';

  @override
  String get adminMetadataLockFieldStudios => 'Wytwórnie';

  @override
  String get adminMetadataLockFieldTags => 'Tagi';

  @override
  String get adminMetadataGenres => 'Gatunki';

  @override
  String get adminMetadataTags => 'Tagi';

  @override
  String get adminMetadataStudios => 'Wytwórnie';

  @override
  String get adminMetadataPeople => 'Osoby';

  @override
  String get adminMetadataAddGenre => 'Dodaj gatunek';

  @override
  String get adminMetadataAddTag => 'Dodaj tag';

  @override
  String get adminMetadataAddStudio => 'Dodaj wytwórnię';

  @override
  String get adminMetadataAddPerson => 'Dodaj osobę';

  @override
  String get adminMetadataEditPerson => 'Edytuj osobę';

  @override
  String get adminMetadataRole => 'Rola';

  @override
  String get adminMetadataImagePrimary => 'Podstawowy';

  @override
  String get adminMetadataImageBackdrop => 'Tło';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Baner';

  @override
  String get adminMetadataImageThumb => 'Miniatura';

  @override
  String get adminMetadataRecursive => 'Rekurencyjnie';

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
      'Usuwa bieżącą grafikę z tej pozycji.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nie udało się usunąć obrazu: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Wybierz obraz $imageType';
  }

  @override
  String get adminMetadataUpload => 'Prześlij';

  @override
  String get adminMetadataUpdate => 'Aktualizuj';

  @override
  String get adminMetadataRemoteImage => 'Zdalny obraz';

  @override
  String get adminPluginsInstalled => 'Zainstalowane';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktywne';

  @override
  String get adminPluginsRestart => 'Uruchom ponownie';

  @override
  String get adminPluginsRestartRequired => 'Wymagane ponowne uruchomienie';

  @override
  String get adminPluginsNoSearchResults =>
      'Żadna wtyczka nie pasuje do Twojego wyszukiwania';

  @override
  String get adminPluginsNoneInstalled => 'Brak zainstalowanych wtyczek';

  @override
  String get adminPluginsNoneActive => 'Brak aktywnych wtyczek';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Żadna wtyczka nie wymaga ponownego uruchomienia serwera';

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
  String get adminPluginsEnable => 'Włącz';

  @override
  String get adminPluginsDisable => 'Wyłącz';

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
    return 'Instalowanie „$name”…';
  }

  @override
  String get adminPluginDetailExperimental => 'Integracja eksperymentalna';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integracja ustawień wtyczek jest nadal eksperymentalna. Niektóre pola lub układy mogą jeszcze nie wyświetlać się poprawnie.';

  @override
  String get adminPluginDetailToggle404 =>
      'Nie udało się przełączyć wtyczki. Serwer nie znalazł tej wersji wtyczki. Odśwież listę wtyczek i spróbuj ponownie.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Nie udało się przełączyć wtyczki. Aby uzyskać szczegółowe informacje, sprawdź logi serwera.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Ustawienia: $name';
  }

  @override
  String get adminPluginDetailDetails => 'Szczegóły';

  @override
  String get adminPluginDetailDeveloper => 'Deweloper';

  @override
  String get adminPluginDetailRepository => 'Repozytorium';

  @override
  String get adminPluginDetailBundled => 'Wbudowana';

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
      'Ta wtyczka uległa awarii i może nie działać poprawnie.';

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
  String get adminReposUnnamed => '(bez nazwy)';

  @override
  String get adminReposEditTitle => 'Edytuj repozytorium';

  @override
  String get adminReposAddTitle => 'Dodaj repozytorium';

  @override
  String get adminReposUrl => 'Adres URL repozytorium';

  @override
  String get adminReposNameHint => 'np. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Nieprawidłowy adres URL';

  @override
  String get adminGeneralSettingsTitle => 'Ustawienia ogólne';

  @override
  String get adminGeneralMetadataLanguage => 'Preferowany język metadanych';

  @override
  String get adminGeneralMetadataLanguageHint => 'np. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Preferowany kraj dla metadanych';

  @override
  String get adminGeneralMetadataCountryHint => 'np. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Współbieżność skanowania biblioteki';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limit równoległego kodowania obrazów';

  @override
  String get adminUnknownError => 'Nieznany błąd';

  @override
  String get adminBrowse => 'Przeglądaj';

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
  String get adminNetworkingKnownProxies => 'Znane serwery proxy';

  @override
  String get adminNetworkingProxyHint => 'np. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista dozwolonych';

  @override
  String get adminNetworkingBlacklist => 'Lista blokowanych';

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
  String get adminPlaybackHwAccel => 'Akceleracja sprzętowa';

  @override
  String get adminPlaybackHwAccelLabel => 'Akceleracja sprzętowa';

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
      'Preferuj natywny systemowy dekoder sprzętowy';

  @override
  String get adminPlaybackColorDepth =>
      'Głębia kolorów przy dekodowaniu sprzętowym';

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
  String get adminPlaybackPresetsQuality => 'Presety i jakość';

  @override
  String get adminPlaybackEncoderPreset => 'Preset kodera';

  @override
  String get adminPlaybackH264Crf => 'CRF kodowania H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF kodowania H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Metoda usuwania przeplotu';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Podwajaj liczbę klatek na sekundę podczas usuwania przeplotu';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Włącz kodowanie audio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Wzmocnienie miksowania do stereo';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algorytm miksowania do stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Maksymalny rozmiar kolejki muksowania';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Kodowanie';

  @override
  String get adminPlaybackEncodingThreads => 'Wątki kodowania';

  @override
  String get adminPlaybackFallbackFont => 'Włącz czcionkę zastępczą';

  @override
  String get adminPlaybackFallbackFontPath => 'Ścieżka czcionki zastępczej';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Wideo';

  @override
  String get adminResumeAudiobooks => 'Audiobooki';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimalny próg wznowienia audiobooka';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Próg pełnego odsłuchania audiobooka';

  @override
  String get adminStreamingBitrateLimit =>
      'Limit bitrate klienta zdalnego (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Pozostaw puste lub wpisz 0, aby nie ustawiać limitu';

  @override
  String get adminTrickplayHwAccel => 'Włącz akcelerację sprzętową';

  @override
  String get adminTrickplayHwEncoding => 'Włącz kodowanie sprzętowe';

  @override
  String get adminTrickplayKeyFrameOnly => 'Wyodrębniaj tylko klatki kluczowe';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Szybciej, ale z mniejszą dokładnością';

  @override
  String get adminTrickplayNonBlocking => 'Nieblokujący';

  @override
  String get adminTrickplayBlocking => 'Blokujący';

  @override
  String get adminTrickplayPriorityHigh => 'Wysoki';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Powyżej normalnego';

  @override
  String get adminTrickplayPriorityNormal => 'Normalna';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Poniżej normalnego';

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
      'Szerokości w pikselach oddzielone przecinkami (np. 320)';

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
  String get adminTaskRunning => 'W toku...';

  @override
  String get adminTaskNeverRun => 'Nigdy nie uruchamiano';

  @override
  String get adminTaskStop => 'Zatrzymaj';

  @override
  String get adminRunningTasks => 'Zadania w toku';

  @override
  String get adminTaskRun => 'Uruchom';

  @override
  String get adminTaskDetailLastExecution => 'Ostatnie uruchomienie';

  @override
  String get adminTaskDetailStarted => 'Rozpoczęto';

  @override
  String get adminTaskDetailEnded => 'Zakończono';

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
  String get adminTaskTriggerTypeWeekly => 'Co tydzień';

  @override
  String get adminTaskTriggerTypeInterval => 'Cyklicznie';

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
      other: '$count godziny',
      many: '$count godzin',
      few: '$count godziny',
      one: '$count godzina',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Czas';

  @override
  String get adminTaskTriggerNoLimit => 'Bez limitu';

  @override
  String get adminActivityJustNow => 'Przed chwilą';

  @override
  String get adminActivityLastHour => 'Ostatnia godzina';

  @override
  String get adminActivityToday => 'Dzisiaj';

  @override
  String get adminActivityYesterday => 'Wczoraj';

  @override
  String get adminActivityOlder => 'Starsze';

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
      'Przekierowuj wszystkie zdalne połączenia do HTTPS. Nie zadziała, jeśli serwer nie ma ważnego certyfikatu.';

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
  String get adminNetworkingRemoteIpFilter => 'Filtr zdalnych adresów IP';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtr zdalnych adresów IP';

  @override
  String get adminPlaybackVaapiDevice => 'Urządzenie VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automatycznie';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Ścieżka tymczasowa transkodowania';

  @override
  String get adminPlaybackSegmentDeletion => 'Zezwalaj na usuwanie segmentów';

  @override
  String get adminPlaybackSegmentKeep =>
      'Czas przechowywania segmentów (sekundy)';

  @override
  String get adminPlaybackThrottleBuffering => 'Ogranicz buforowanie';

  @override
  String get adminPlaybackThrottleDelay =>
      'Opóźnienie ograniczenia buforowania (sekundy)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Zezwalaj na wyodrębnianie napisów w locie';

  @override
  String get adminResumeMinPct => 'Minimalny próg wznowienia';

  @override
  String get adminResumeMinPctSubtitle =>
      'Postęp zostanie zapisany po odtworzeniu materiału powyżej tego progu';

  @override
  String get adminResumeMaxPct => 'Próg pełnego odtworzenia';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Po przekroczeniu tego progu materiał jest uznawany za w pełni odtworzony';

  @override
  String get adminResumeMinDuration =>
      'Minimalny czas trwania materiału do wznowienia (sekundy)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Materiały krótsze niż ten czas nie będą wznawiane';

  @override
  String get adminTrickplayScanBehavior => 'Sposób skanowania';

  @override
  String get adminTrickplayProcessPriority => 'Priorytet procesu';

  @override
  String get adminTrickplayTileWidth => 'Szerokość kafelka';

  @override
  String get adminTrickplayTileHeight => 'Wysokość kafelka';

  @override
  String get adminTrickplayProcessThreads => 'Wątki procesu';

  @override
  String get adminTrickplayWidthResolutions =>
      'Rozdzielczości według szerokości';

  @override
  String get adminMetadataDefault => 'Domyślny';

  @override
  String get adminMetadataContentTypeUpdated => 'Zaktualizowano typ treści';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Nie udało się zaktualizować typu treści: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Próg wolnej odpowiedzi (ms)';

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
  String get adminSettingsLoadFailed => 'Nie udało się wczytać ustawień';

  @override
  String get adminDiscover => 'Wykryj';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Nie udało się zaktualizować mapowań: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limit czasu: $duration';
  }

  @override
  String get folders => 'Foldery';

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
      other: '# uczestnika',
      many: '# uczestników',
      few: '# uczestników',
      one: '# uczestnik',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Pomiń oczekiwanie';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Nie wstrzymuj grupy podczas buforowania urządzenia';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Kontynuuj lokalnie bez czekania na wolniejszych uczestników';

  @override
  String get syncPlayRepeat => 'Powtarzaj';

  @override
  String get syncPlayRepeatOne => 'Jeden';

  @override
  String get syncPlayShuffleModeShuffled => 'Losowo';

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
    return 'Pozycja $index';
  }

  @override
  String get syncPlayPlayNow => 'Odtwórz teraz';

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
  String get syncPlayJoin => 'Dołącz';

  @override
  String get syncPlayStateIdle => 'Bezczynny';

  @override
  String get syncPlayStateWaiting => 'Oczekiwanie';

  @override
  String get syncPlayStatePaused => 'Wstrzymano';

  @override
  String get syncPlayStatePlaying => 'Odtwarzanie';

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
      'Nie masz dostępu do co najmniej jednej pozycji w tej grupie SyncPlay. Poproś właściciela grupy o sprawdzenie uprawnień biblioteki lub wybierz inną kolejkę.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synchronizowanie odtwarzania z grupą $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Wyszukiwanie głosowe jest niedostępne.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Nie udało się uruchomić Dolby Vision przez Direct Play';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Nie udało się uruchomić Direct Play dla tego strumienia Dolby Vision. Spróbować ponownie z transkodowaniem na serwerze?';

  @override
  String get retryWithTranscode => 'Spróbuj ponownie z transkodowaniem';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision nie jest obsługiwany';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'To urządzenie nie może bezpośrednio dekodować treści Dolby Vision. Użyj wersji HDR10 lub transkodowania na serwerze.';

  @override
  String get rememberMyChoice => 'Zapamiętaj mój wybór';

  @override
  String get playHdr10Fallback => 'Odtwórz wersję HDR10';

  @override
  String get requestTranscode => 'Poproś o transkodowanie';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# wykrytej sekcji',
      many: '# wykrytych sekcji',
      few: '# wykryte sekcje',
      one: '# wykryta sekcja',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Zobacz wszystko';

  @override
  String get noItems => 'Brak pozycji';

  @override
  String get switchUser => 'Zmień użytkownika';

  @override
  String get remoteControl => 'Zdalne sterowanie';

  @override
  String get mediaBarLoading => 'Wczytywanie paska multimediów...';

  @override
  String get mediaBarError => 'Nie udało się wczytać paska multimediów';

  @override
  String get offlineServerUnavailable =>
      'Połączono z Internetem, ale bieżący serwer jest niedostępny.';

  @override
  String get offlineNoInternet =>
      'Jesteś offline. Dostępne są tylko pobrane materiały.';

  @override
  String get offlineFileNotAvailable => 'Plik niedostępny';

  @override
  String get offlineSwitchServer => 'Przełącz serwer';

  @override
  String get offlineSavedMedia => 'Zapisane materiały';

  @override
  String get offlineBannerTitle => 'Jesteś offline';

  @override
  String get offlineBannerSubtitle => 'Wyświetlane są pobrane materiały';

  @override
  String get offlineBannerAction => 'Pobrane';

  @override
  String get serverUnreachableBannerTitle =>
      'Nie można połączyć się z serwerem';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Do czasu powrotu serwera odtwarzane będą pobrane materiały';

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
  String get castVolumeUnavailable => 'Niedostępna';

  @override
  String castStopKind(String kind) {
    return 'Zatrzymaj $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Napisy';

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
  String get pinMismatch => 'Kody PIN nie są zgodne';

  @override
  String get pinForgot => 'Zapomniałeś kodu PIN?';

  @override
  String get pinClear => 'Wyczyść';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized =>
      'Prośba Quick Connect została zatwierdzona.';

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
      'To konto nie może zatwierdzać próśb Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Nie znaleziono kodu Quick Connect. Spróbuj użyć nowego kodu.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect nie powiodło się: $message';
  }

  @override
  String get quickConnectEnterCode => 'Wpisz kod';

  @override
  String get quickConnectAuthorize => 'Zatwierdź';

  @override
  String remoteCommandFailed(String error) {
    return 'Polecenie nie powiodło się: $error';
  }

  @override
  String get remoteControlTitle => 'Zdalne sterowanie';

  @override
  String get remoteFailedToLoadSessions => 'Nie udało się wczytać sesji';

  @override
  String get remoteNoSessions => 'Brak sesji do sterowania';

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
      'Brak dostępnych urządzeń do zdalnego odtwarzania.\n\nW iOS urządzenia AirPlay mogą być niedostępne w symulatorze.';

  @override
  String get trackActionPlayNext => 'Odtwórz jako następne';

  @override
  String get trackActionAddToQueue => 'Dodaj do kolejki';

  @override
  String get trackActionAddToPlaylist => 'Dodaj do playlisty';

  @override
  String get trackActionCancelDownload => 'Anuluj pobieranie';

  @override
  String get trackActionDeleteFromPlaylist => 'Usuń z playlisty';

  @override
  String get trackActionMoveUp => 'Przenieś wyżej';

  @override
  String get trackActionMoveDown => 'Przenieś niżej';

  @override
  String get trackActionRemoveFromFavorites => 'Usuń z ulubionych';

  @override
  String get trackActionAddToFavorites => 'Dodaj do ulubionych';

  @override
  String get trackActionGoToAlbum => 'Przejdź do albumu';

  @override
  String get trackActionGoToArtist => 'Przejdź do artysty';

  @override
  String trackActionDownloading(String name) {
    return 'Pobieranie „$name”...';
  }

  @override
  String get trackActionDeletedFile => 'Usunięto pobrany plik';

  @override
  String get trackActionDeleteFileFailed =>
      'Nie udało się usunąć pobranego pliku';

  @override
  String get shuffleBy => 'Przetasuj według';

  @override
  String get shuffleSelectLibrary => 'Wybierz bibliotekę';

  @override
  String get shuffleSelectGenre => 'Wybierz gatunek';

  @override
  String get shuffleLibrary => 'Biblioteka';

  @override
  String get shuffleGenre => 'Gatunek';

  @override
  String get shuffleNoLibraries => 'Brak zgodnych bibliotek.';

  @override
  String get shuffleNoGenres =>
      'Nie znaleziono gatunków dla tego trybu losowego.';

  @override
  String get posterDisplayTitle => 'Wyświetlanie';

  @override
  String get posterImageType => 'Typ obrazu';

  @override
  String get imageTypePoster => 'Plakat';

  @override
  String get imageTypeThumbnail => 'Zwięzły';

  @override
  String get imageTypeBanner => 'Baner';

  @override
  String get playlistAddFailed => 'Nie udało się dodać do playlisty';

  @override
  String get playlistCreateFailed => 'Nie udało się utworzyć playlisty';

  @override
  String get playlistNew => 'Nowa playlista';

  @override
  String get playlistCreate => 'Utwórz';

  @override
  String get playlistCreateNew => 'Utwórz nową playlistę';

  @override
  String get playlistNoneFound => 'Nie znaleziono playlist';

  @override
  String get addToPlaylist => 'Dodaj do playlisty';

  @override
  String get lyricsNotAvailable => 'Brak dostępnych tekstów';

  @override
  String get upNext => 'Następne';

  @override
  String get playNext => 'Odtwórz jako następne';

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
  String get continueWatchingAndNextUp => 'Oglądaj dalej';

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
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Włącz pełny ekran';

  @override
  String get playerTooltipExitFullscreen => 'Wyłącz pełny ekran';

  @override
  String get playerTooltipFloatOnTop => 'Zawsze na wierzchu';

  @override
  String get playerTooltipExitFloatOnTop => 'Wyłącz tryb „Zawsze na wierzchu”';

  @override
  String get playerTooltipLockLandscape => 'Zablokuj orientację poziomą';

  @override
  String get playerTooltipUnlockOrientation => 'Zezwalaj na obrót';

  @override
  String get playerTooltipPrevious => 'Poprzedni';

  @override
  String get playerTooltipSeekBack => 'Przewiń do tyłu';

  @override
  String get playerTooltipSeekForward => 'Przewiń do przodu';

  @override
  String get contextMenuMarkWatched => 'Oznacz jako obejrzane';

  @override
  String get contextMenuMarkUnwatched => 'Oznacz jako nieobejrzane';

  @override
  String get contextMenuAddToFavorites => 'Dodaj do ulubionych';

  @override
  String get contextMenuRemoveFromFavorites => 'Usuń z ulubionych';

  @override
  String get contextMenuGoToSeries => 'Otwórz serial';

  @override
  String get contextMenuHideFromContinueWatching => 'Ukryj z „Oglądaj dalej”';

  @override
  String get contextMenuHideFromNextUp => 'Ukryj z „Następne”';

  @override
  String get contextMenuAddToCollection => 'Dodaj do kolekcji';

  @override
  String get settingsAdministrationSubtitle =>
      'Otwórz panel administracyjny serwera';

  @override
  String get settingsAccountSecurity => 'Konto i bezpieczeństwo';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Uwierzytelnianie, kod PIN i kontrola rodzicielska';

  @override
  String get settingsPersonalization => 'Personalizacja';

  @override
  String get settingsPersonalizationSubtitle =>
      'Motyw, nawigacja, sekcje ekranu głównego i widoczność bibliotek';

  @override
  String get settingsDynamicContent => 'Treści dynamiczne';

  @override
  String get settingsDynamicContentSubtitle =>
      'Pasek multimediów i nakładki wizualne';

  @override
  String get settingsPlaybackSyncplay => 'Odtwarzanie i SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Ustawienia dźwięku i wideo, napisy, pobieranie oraz sterowanie SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Synchronizacja wtyczek, Seerr, ocen i nie tylko';

  @override
  String get settingsAboutSubtitle =>
      'Wersja aplikacji, informacje prawne i autorzy';

  @override
  String get settingsAuthenticationSection => 'UWIERZYTELNIANIE';

  @override
  String get settingsSortServersBy => 'Sortuj serwery według';

  @override
  String get settingsLastUsed => 'Ostatnio używane';

  @override
  String get settingsAlphabetical => 'Alfabetycznie';

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
  String get settingsBlockedRatings => 'Zablokowane klasyfikacje wiekowe';

  @override
  String get settingsGeneralStyle => 'Styl ogólny';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Akcenty motywu, tła i wskaźniki obejrzenia';

  @override
  String get settingsDetailsScreen => 'Ekran szczegółów';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Styl, rozmycie tła i zachowanie zakładek';

  @override
  String get settingsHomePage => 'Strona główna';

  @override
  String get settingsHomePageSubtitle =>
      'Sekcje, typy obrazów, nakładki i podglądy materiałów';

  @override
  String get settingsLibrariesSubtitle =>
      'Widoczność bibliotek, widok folderów i obsługa wielu serwerów';

  @override
  String get settingsTwentyFourHourClock => 'Zegar 24-godzinny';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Używaj formatu 24-godzinnego wszędzie tam, gdzie wyświetlany jest zegar';

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
      'Pokaż przycisk Seerr na pasku nawigacyjnym';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Zawsze pokazuj etykiety tekstowe na górnym pasku nawigacji';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Ustaw widoczność każdej biblioteki na ekranie głównym. Uruchom ponownie Moonfin, aby zastosować zmiany.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Pasek multimediów i lokalne podglądy';

  @override
  String get settingsVisualOverlays => 'Nakładki wizualne';

  @override
  String get settingsSeasonalSurprise => 'Sezonowa niespodzianka';

  @override
  String get settingsMetadataAndRatings => 'Metadane i klasyfikacje';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase obsługuje integrację po stronie serwera, w tym dodatkowe źródła ocen, prośby Seerr i synchronizację preferencji.';

  @override
  String get settingsOfflineDownloads => 'Pobieranie offline';

  @override
  String get useNativeEmulator => 'Natywna emulacja';

  @override
  String get useNativeEmulatorSubtitle =>
      'Uruchamiaj gry z użyciem natywnych rdzeni zamiast odtwarzacza EmulatorJS';

  @override
  String get emulatorCores => 'Rdzenie emulatora';

  @override
  String get emulatorCoresSubtitle =>
      'Pobierz systemy do natywnego uruchamiania gier';

  @override
  String get emulatorCoresDescription =>
      'Wybierz systemy do zainstalowania. Rdzenie libretro pozwalają uruchamiać gry natywnie, bez użycia odtwarzacza w przeglądarce.';

  @override
  String get emulatorCoreDownloading => 'Pobieranie';

  @override
  String get emulatorCoreUnavailable => 'Niedostępne dla tego urządzenia';

  @override
  String get emulatorCoreDownloadFailed =>
      'Nie udało się pobrać rdzenia. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Przywróć domyślne ustawienia $system';
  }

  @override
  String get emulatorCoreSettingsReset => 'Przywrócono ustawienia domyślne.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Nie udało się przywrócić ustawień domyślnych. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String get downloadedGames => 'Pobrane gry';

  @override
  String get downloadedGamesSubtitle => 'Zwolnij miejsce zajmowane przez gry';

  @override
  String get downloadedGamesDescription =>
      'Gry są kopiowane na to urządzenie przed uruchomieniem. Usuń te, których już nie potrzebujesz, aby zwolnić miejsce. Zapisy gier pozostają na serwerze i nie zostaną usunięte.';

  @override
  String get downloadedGamesEmpty =>
      'Na tym urządzeniu nie pobrano jeszcze żadnych gier.';

  @override
  String downloadedGamesTotal(int count, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gry, $size',
      many: '$count gier, $size',
      few: '$count gry, $size',
      one: '$count gra, $size',
    );
    return '$_temp0';
  }

  @override
  String get removeAllDownloadedGames => 'Usuń wszystko';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Usunąć $title z tego urządzenia? Gra zostanie pobrana ponownie przy następnym uruchomieniu.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Usunąć wszystkie pobrane gry z tego urządzenia? Zostaną pobrane ponownie przy następnym uruchomieniu.';

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
      'Maksymalna liczba jednocześnie pobieranych pozycji.';

  @override
  String get settingsAppInfo => 'INFORMACJE O APLIKACJI';

  @override
  String get settingsReportAnIssue => 'Zgłoś problem';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Otwórz stronę zgłaszania błędów w GitHubie';

  @override
  String get settingsJoinDiscord => 'Dołącz do Discorda';

  @override
  String get settingsJoinDiscordSubtitle => 'Czatuj ze społecznością';

  @override
  String get settingsJoinTheDiscord => 'Dołącz do Discorda';

  @override
  String get settingsSupportMoonfin => 'Wesprzyj Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Postaw kawę deweloperowi';

  @override
  String get settingsLegal => 'PRAWNE';

  @override
  String get settingsLicenses => 'Licencje';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Informacje o licencjach open source';

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
  String get settingsPoweredByFlutter => 'Oparte na Flutterze';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# informacji licencyjnej',
      many: '# informacji licencyjnych',
      few: '# informacje licencyjne',
      one: '# informacja licencyjna',
    );
    return '$_temp0';
  }

  @override
  String get settingsBoth => 'Oba';

  @override
  String get settingsShuffleContentTypeFilter => 'Typ treści do losowania';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferencje odtwarzania wideo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Silnik wideo i ustawienia jakości streamingu';

  @override
  String get settingsAudioPreferences => 'Preferencje audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Ścieżki audio, opcje przetwarzania i przekazywania';

  @override
  String get settingsAutomationAndQueue => 'Automatyzacja i kolejka';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatyczne odtwarzanie i zarządzanie kolejką';

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
  String get settingsSkipIntrosAndOutros =>
      'Pomijać czołówki i napisy końcowe?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return 'Segmenty: $segment';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Odliczanie segmentu materiału';

  @override
  String get settingsProgressBar => 'Pasek postępu';

  @override
  String get settingsTimer => 'Licznik czasu';

  @override
  String get settingsNone => 'Brak';

  @override
  String get settingsSkipButtonAutoHide =>
      'Automatyczne ukrywanie przycisku pomijania';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatycznie ukrywaj przycisk pomijania czołówki i napisów końcowych po kilku sekundach.';

  @override
  String get settingsPromptUser => 'Pytaj użytkownika';

  @override
  String get settingsSkip => 'Pomiń';

  @override
  String get settingsDoNothing => 'Nie rób nic';

  @override
  String get settingsMaxBitrateDescription =>
      'Ogranicz bitrate streamingu. Treści powyżej tego progu zostaną transkodowane, aby zmieścić się w limicie.';

  @override
  String get settingsMaxResolutionDescription =>
      'Ogranicz maksymalną rozdzielczość odtwarzania. Materiały w wyższej rozdzielczości zostaną przeskalowane podczas transkodowania.';

  @override
  String get settingsPlayerZoomDescription =>
      'Jak skalować wideo, aby dopasować je do ekranu.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Silnik odtwarzania (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Wybierz domyślny silnik odtwarzania na urządzeniach z Android TV. Zmiana zacznie obowiązywać przy następnym odtwarzaniu.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (zalecane)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (starsza wersja)';

  @override
  String get settingsDolbyVisionFallback => 'Tryb zastępczy Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Sposób odtwarzania materiałów Dolby Vision na urządzeniach bez obsługi dekodowania Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Zapytaj za każdym razem';

  @override
  String get settingsPreferHdr10Fallback => 'Preferuj zastępczą wersję HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Preferuj transkodowanie na serwerze';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Direct Play Dolby Vision Profile 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Określa, czy strumienie warstwy rozszerzającej Dolby Vision Profile 7 mają być odtwarzane przez Direct Play.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto';

  @override
  String get settingsEnabledOnThisDevice => 'Włączone';

  @override
  String get settingsDisabledPreferTranscode => 'Wyłączone';

  @override
  String get settingsResumeRewindDescription =>
      'Przy wznawianiu odtwarzania z sekcji „Oglądaj dalej” lub strony materiału określ, o ile sekund cofnąć odtwarzanie.';

  @override
  String get settingsUnpauseRewindDescription =>
      'Określ, o ile sekund cofnąć odtwarzanie po wznowieniu z pauzy.';

  @override
  String get settingsSkipBackLengthDescription =>
      'Określ, o ile sekund cofać odtwarzanie po naciśnięciu przycisku przewijania do tyłu.';

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
      'Określ, o ile sekund przewijać do przodu po naciśnięciu przycisku szybkiego przewijania.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 do zewnętrznego dekodera';

  @override
  String get settingsCinemaMode => 'Tryb kinowy';

  @override
  String get settingsCinemaModeSubtitle =>
      'Odtwarzaj zwiastuny i materiały wstępne przed głównym materiałem';

  @override
  String get settingsCinemaModeEpisodes => 'Tryb kinowy dla odcinków';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Odtwarzaj materiały wstępne także przed odcinkami seriali';

  @override
  String get settingsNextUpDisplayDescription =>
      'Rozszerzony pokazuje pełną kartę z grafiką i opisem odcinka. Minimalny pokazuje kompaktowe odliczanie. Wyłączony całkowicie ukrywa komunikat.';

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
  String get settingsLiveTvDirect => 'Direct Play dla telewizji na żywo';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Włącz Direct Play dla telewizji na żywo';

  @override
  String get settingsOpenGroups => 'Grupy otwarte';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Twórz, dołączaj i zarządzaj grupami SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'Włącz SyncPlay';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Włącz funkcje oglądania grupowego';

  @override
  String get settingsSyncplayButton => 'Przycisk SyncPlay';

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
  String get settingsSyncplaySkipToSync => 'Przewijaj, aby zsynchronizować';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Używaj przewijania do synchronizacji odtwarzania';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Minimalne opóźnienie korekty prędkości';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Maksymalne opóźnienie korekty prędkości';

  @override
  String get settingsSyncplaySpeedDuration => 'Czas trwania korekty prędkości';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimalne opóźnienie korekty przez przewinięcie';

  @override
  String get settingsSyncplayExtraOffset => 'Dodatkowe przesunięcie SyncPlay';

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
    return 'Ostatnio dodane — $libraryName';
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
      'Zaawansowane. Przesyła dźwięk i obraz wspólną ścieżką sprzętową. Domyślnie wyłączone, ponieważ na niektórych urządzeniach może powodować przerwy w obrazie i dźwięku.';

  @override
  String get mapDolbyVisionP7Title =>
      'Zawsze odtwarzaj Dolby Vision Profile 7 jako HDR10';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Pomiń konwersję do profilu 8 i odtwarzaj Dolby Vision Profile 7 jako HEVC zgodny z HDR10. Użyj tej opcji, jeśli obraz po konwersji wygląda nieprawidłowo.';

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
      'Stosuj rozmiary czcionek zapisane w ścieżce napisów. Wyłącz, aby używać rozmiaru napisów z własnych ustawień stylu.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Pokaż szczegóły materiału';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Pokazuj szczegóły wybranej pozycji u góry stron biblioteki.';

  @override
  String get hideBackdropsInLibraries => 'Ukrywać tła podczas przeglądania?';

  @override
  String get useDetailedSubHeadings =>
      'Używaj szczegółowych informacji pomocniczych';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Pokazuj szczegółowy lub uproszczony wiersz informacji na stronach biblioteki.';

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
      'Nie udało się wczytać sklepu z motywami. Sprawdź połączenie i spróbuj ponownie.';

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
      'Otwórz edytor motywów Moonfin w przeglądarce';

  @override
  String get homeScreen => 'Ekran główny';

  @override
  String get bottomBar => 'Dolny pasek';

  @override
  String get homeRowsStyleClassic => 'Klasyczny';

  @override
  String get homeRowsStyleModern => 'Nowoczesny';

  @override
  String get homeRowsSection => 'Sekcje ekranu głównego';

  @override
  String get homeRowDisplay => 'Wygląd sekcji ekranu głównego';

  @override
  String get homeRowSections => 'Sekcje ekranu głównego';

  @override
  String get homeRowToggles => 'Widoczność sekcji';

  @override
  String get homeRowTogglesSubtitle =>
      'Włączaj lub wyłączaj sekcje ekranu głównego oparte na bibliotekach';

  @override
  String get homeRowTogglesDescription =>
      'Włącz poniższe opcje, aby wyświetlać sekcje na ekranie głównym.';

  @override
  String get rowsType => 'Styl sekcji';

  @override
  String get rowsTypeDescription =>
      'Klasyczny zachowuje osobny typ grafiki i nakładkę informacyjną dla każdej sekcji. Nowoczesny używa sekcji z grafikami przechodzącymi od pionowych do grafik tła.';

  @override
  String get sortOrder => 'Kolejność sortowania';

  @override
  String get ascending => 'Rosnąco';

  @override
  String get descending => 'Malejąco';

  @override
  String get displayFavoritesRows => 'Pokaż sekcje ulubionych';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Pokazuj ulubione filmy, seriale i inne treści w sekcjach ekranu głównego.';

  @override
  String get favoritesRowSorting => 'Sortowanie ulubionych';

  @override
  String get favoritesRowSortingDescription =>
      'Sortuj ulubione według daty dodania, daty wydania, alfabetu i innych kryteriów.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sortuj sekcje ulubionych rosnąco lub malejąco.';

  @override
  String get displayCollectionsRows => 'Pokaż sekcje kolekcji';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Pokazuj kolekcje w sekcjach ekranu głównego.';

  @override
  String get collectionsRowSorting => 'Sortowanie kolekcji';

  @override
  String get collectionsRowSortingDescription =>
      'Sortuj kolekcje według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sortuj sekcje kolekcji rosnąco lub malejąco.';

  @override
  String get collectionsRowShowEpisodes => 'Pokaż poszczególne odcinki';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Rozwiń seriale, aby wyświetlać każdy odcinek osobno.';

  @override
  String get displayGenresRows => 'Pokaż sekcje gatunków';

  @override
  String get displayGenresRowsSubtitle =>
      'Pokazuj sekcje gatunków w sekcjach ekranu głównego.';

  @override
  String get genresRowSorting => 'Sortowanie gatunków';

  @override
  String get genresRowSortingDescription =>
      'Sortuj gatunki według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get genresRowSortOrderDescription =>
      'Sortuj sekcje gatunków rosnąco lub malejąco.';

  @override
  String get genresRowItems => 'Treści w sekcjach gatunków';

  @override
  String get genresRowItemsDescription =>
      'Pokazuj filmy, seriale lub oba typy treści w sekcjach gatunków.';

  @override
  String get displayStudiosRows => 'Pokaż sekcję wytwórni';

  @override
  String get displayStudiosRowsSubtitle =>
      'Pokaż wytwórnie w sekcjach ekranu głównego.';

  @override
  String get studiosRowSorting => 'Sortowanie sekcji wytwórni';

  @override
  String get studiosRowSortingDescription =>
      'Sortuj wytwórnie według nazwy, daty dodania i innych kryteriów.';

  @override
  String get studiosRowSortOrderDescription =>
      'Wybierz sortowanie rosnące lub malejące.';

  @override
  String get selectStudiosToInclude => 'Wybierz wytwórnie do uwzględnienia';

  @override
  String get selectStudiosToIncludeDescription =>
      'Wybierz wytwórnie wyświetlane na ekranie głównym.';

  @override
  String get selectAllStudios => 'Wybierz wszystkie';

  @override
  String get deselectAllStudios => 'Odznacz wszystkie';

  @override
  String get tvStudiosFilter => 'Wytwórnie telewizyjne';

  @override
  String get movieStudiosFilter => 'Wytwórnie filmowe';

  @override
  String get selectedStudiosFilter => 'Wybrane wytwórnie';

  @override
  String get unselectedStudiosFilter => 'Niewybrane wytwórnie';

  @override
  String get filtersHeader => 'Filtry';

  @override
  String get showHeader => 'Pokaż';

  @override
  String get displayPlaylistsRows => 'Pokaż sekcje playlist';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Pokazuj sekcje playlist w sekcjach ekranu głównego.';

  @override
  String get playlistsRowSorting => 'Sortowanie playlist';

  @override
  String get playlistsRowSortingDescription =>
      'Sortuj playlisty według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sortuj sekcje playlist rosnąco lub malejąco.';

  @override
  String get playlistsRowShowEpisodes => 'Pokaż poszczególne odcinki';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Wyświetlaj każdy odcinek serialu osobno.';

  @override
  String get displayAudioRows => 'Pokaż sekcje audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Pokazuj sekcje audio w sekcjach ekranu głównego.';

  @override
  String get audioRowsSorting => 'Sortowanie audio';

  @override
  String get audioRowsSortingDescription =>
      'Sortuj audio według daty dodania, daty wydania, alfabetycznie i nie tylko.';

  @override
  String get audioRowsSortOrderDescription =>
      'Sortuj sekcje audio rosnąco lub malejąco.';

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
  String get cardSize => 'Rozmiar kart sekcji ekranu głównego';

  @override
  String get externalPlayerApp => 'Zewnętrzny odtwarzacz';

  @override
  String get externalPlayerAppDescription =>
      'Ustaw zewnętrzny odtwarzacz, aby umożliwić uruchamianie go przez długie naciśnięcie przycisku odtwarzania';

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
  String get passthrough => 'Przekazywanie dźwięku';

  @override
  String get supportedOnThisDevice => 'Obsługiwane na tym urządzeniu';

  @override
  String get notSupportedOnThisDevice => 'Nieobsługiwane na tym urządzeniu';

  @override
  String get mediaPlayerBehavior => 'Zachowanie odtwarzacza';

  @override
  String get playbackEnhancements => 'Ulepszenia odtwarzania';

  @override
  String get alwaysOn => 'Zawsze włączone.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Zastąp „Pomiń napisy końcowe” ekranem „Następne”';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Pokaż nakładkę „Następne” zamiast przycisku „Pomiń napisy końcowe”.';

  @override
  String get playerRouting => 'Routing odtwarzacza';

  @override
  String get preferSoftwareDecoders => 'Preferuj dekodery programowe';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Używaj FFmpeg (audio) i libgav1 (AV1) przed dekoderami sprzętowymi. Wyłącz, jeśli przekazywanie dźwięku przez HDMI przestaje działać.';

  @override
  String get useExternalPlayer => 'Zawsze używaj zewnętrznego odtwarzacza';

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
  String get webDiagnostics => 'Diagnostyka przeglądarki';

  @override
  String get webDiagnosticsTitle => 'Diagnostyka Moonfin w przeglądarce';

  @override
  String get webDiagnosticsIntro =>
      'Użyj tej strony, aby zdiagnozować problemy z połączeniem w przeglądarce, takie jak CORS, Mixed Content i ustawienia wykrywania.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Wykryto problem z Mixed Content';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Wykryto błąd CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin wykrył, że strona HTTPS próbuje połączyć się z serwerem przez HTTP. Przeglądarka blokuje takie połączenie, zanim dotrze ono do serwera.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin wykrył błąd żądania na poziomie przeglądarki, zwykle spowodowany brakiem wymaganych nagłówków CORS lub preflight na serwerze multimediów.';

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
      'Bieżący kontekst środowiska';

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
  String get webDiagnosticsMixedContent => 'Mixed Content';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Ta strona jest wczytana przez HTTPS, ale co najmniej jeden ze skonfigurowanych adresów URL używa HTTP. Przeglądarki blokują wywołania API po HTTP ze stron HTTPS.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Rozwiązanie: udostępnij serwer multimediów lub adres proxy przez HTTPS albo wczytuj Moonfin przez HTTP wyłącznie w zaufanych sieciach lokalnych.';

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
      '• Udostępnij Content-Range i Accept-Ranges na potrzeby streamingu i przewijania.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Zwracaj 204 dla żądań preflight OPTIONS.';

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
  String get voiceSearchNoMatch =>
      'Nie udało się rozpoznać polecenia. Spróbuj ponownie.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nie wykryto mowy.';

  @override
  String get voiceSearchMicrophoneError => 'Błąd mikrofonu.';

  @override
  String get voiceSearchNeedsInternet =>
      'Wyszukiwanie głosowe wymaga internetu.';

  @override
  String get voiceSearchServiceBusy =>
      'Usługa rozpoznawania mowy jest zajęta. Spróbuj ponownie.';

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
      'Wybór urządzenia AirPlay jest niedostępny na tym urządzeniu.';

  @override
  String get videos => 'Wideo';

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
  String get recentlyReleasedEpisodes => 'Ostatnio wyemitowane odcinki';

  @override
  String get watchAgain => 'Obejrzyj ponownie';

  @override
  String get guestAppearances => 'Występy gościnne';

  @override
  String get appearancesSeerr => 'Role (Seerr)';

  @override
  String get crewContributionsSeerr => 'Twórcy (Seerr)';

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
      'Nie udało się wczytać statystyk materiałów';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Łączne statystyki ze wszystkich bibliotek.';

  @override
  String get analyticsTopArtists => 'Najpopularniejsi wykonawcy';

  @override
  String get analyticsTopAuthors => 'Najpopularniejsi autorzy';

  @override
  String get analyticsTopContributors => 'Główni współtwórcy';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count biblioteki',
      many: '$count bibliotek',
      few: '$count biblioteki',
      one: '$count biblioteka',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Brak zindeksowanych danych o materiałach dla tego wyboru.';

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
    return 'Wykorzystano $percent%';
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
    return 'Brak lokalnego pliku do odczytu: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status podczas otwierania danych książki z $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Brak dostępnego źródła do odczytu książki';

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
  String get loadingShuffle => 'Wczytywanie...';

  @override
  String get libraryShuffleLabel => 'LOSUJ Z BIBLIOTEKI';

  @override
  String get randomShuffleLabel => 'LOSOWO';

  @override
  String get genresShuffleLabel => 'LOSUJ WG GATUNKU';

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
  String get clearAllArtworkButton => 'Usunąć wszystkie grafiki?';

  @override
  String get clearAllArtworkWarning =>
      'Czy na pewno chcesz usunąć wszystkie pobrane grafiki?';

  @override
  String get confirmClear => 'Potwierdź usunięcie';

  @override
  String confirmClearMessage(String itemType) {
    return 'Czy na pewno chcesz usunąć $itemType?';
  }

  @override
  String get uploadButton => 'Prześlij';

  @override
  String get resolutionLabel => 'Rozdzielczość: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Pokazuj tylko grafikę w języku interfejsu';

  @override
  String get confirmClearAll => 'Potwierdź usunięcie wszystkich grafik';

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
    return 'Nie udało się usunąć wszystkich grafik: $error';
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
  String get audiobookFocusedTimeline => 'Aktywna oś czasu';

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
  String get audiobookNoteHint => 'Dodaj notatkę do tego miejsca';

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
    return 'Cofnij o $seconds s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Przewiń do przodu o $seconds s';
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
  String get releaseDateAscending => 'Data premiery (rosnąco)';

  @override
  String get releaseDateDescending => 'Data premiery (malejąco)';

  @override
  String get groupContributions => 'Grupowanie udziałów';

  @override
  String get groupMultipleRoles => 'Grupuj wiele ról';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Ostrzeżenie dotyczące zapisu w bibliotece';

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
    return 'Twoja biblioteka \'$libraryName\' jest skonfigurowana tak, aby zapisywać grafiki bezpośrednio w folderach multimediów (opcja „Zapisuj grafiki w folderach multimediów” jest włączona). Jellyfin sprawdził jednak dostęp do zapisu i nie ma uprawnień do zapisywania plików w tym katalogu:\n\n$failedPath';
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
  String get checkingDirectPlay => 'Sprawdzanie obsługi Direct Play...';

  @override
  String get directPlayCapabilityLabel => 'Obsługa Direct Play: ';

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
      'Format napisów nie jest obsługiwany (wymaga wtopienia w obraz).';

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
      'Liczba klatek na sekundę nie jest obsługiwana.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Bitrate pliku przekracza limit streamingu odtwarzacza.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Bitrate wideo przekracza limit streamingu.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Bitrate dźwięku przekracza limit streamingu.';

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
      'Impeller to nowoczesny renderer GPU we Flutterze, zapewniający płynniejsze animacje i mniej zacięć. Na niektórych przystawkach TV i starszych GPU może powodować błędy obrazu lub czarny ekran — wtedy wyłącz tę opcję. Tryb automatyczny wybiera najlepsze ustawienie dla Twojego urządzenia. Uruchom Moonfin ponownie, aby zastosować zmiany.';

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
  String get imdbMostPopularMovies => 'Najpopularniejsze filmy IMDb';

  @override
  String get imdbMostPopularTvShows => 'Najpopularniejsze seriale IMDb';

  @override
  String get imdbLowestRatedMovies => 'Najniżej oceniane filmy IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'IMDb Najwyżej oceniane filmy anglojęzyczne';

  @override
  String get addToWatchlist => 'Dodaj do „Do obejrzenia”';

  @override
  String get removeFromWatchlist => 'Usuń z „Do obejrzenia”';

  @override
  String get watchlistUpdateFailed =>
      'Nie udało się zaktualizować „Do obejrzenia”';

  @override
  String get adminSearchParameters => 'Parametry wyszukiwania';

  @override
  String get adminCurrentMetadata => 'Bieżące metadane';

  @override
  String get adminLabelYear => 'Rok';

  @override
  String get adminLabelImdbId => 'ID IMDb';

  @override
  String get adminLabelTmdbMovieId => 'ID filmu TheMovieDb';

  @override
  String get adminLabelTmdbBoxSetId => 'ID kolekcji TheMovieDb';

  @override
  String get adminLabelTvdbBoxSetId => 'ID kolekcji TheTVDB';

  @override
  String get adminLabelTvdbId => 'Numeryczne ID TheTVDB';

  @override
  String get adminLabelTvdbSlug => 'ID filmu TheTVDB (slug)';

  @override
  String get adminReplaceImages => 'Zastąp istniejące obrazy';

  @override
  String get adminBackToSearch => 'Wróć do kryteriów wyszukiwania';

  @override
  String get grouping => 'Grupowanie';

  @override
  String get groupByType => 'Grupuj według typu';

  @override
  String get playlistTypes => 'Typy playlist';

  @override
  String get playlistTypeVideo => 'Wideo';

  @override
  String get playlistTypeAudio => 'Audio (muzyka)';

  @override
  String get playlistTypeAudiobook => 'Audiobook';

  @override
  String get playlistTypeBook => 'Książka';

  @override
  String get playlistTypePhoto => 'Zdjęcie';

  @override
  String get playlistTypeMixed => 'Mieszane';

  @override
  String get videoPlaylistsSection => 'Playlisty wideo';

  @override
  String get audioPlaylistsSection => 'Playlisty audio';

  @override
  String get audiobookPlaylistsSection => 'Playlisty audiobooków';

  @override
  String get bookPlaylistsSection => 'Playlisty książek';

  @override
  String get photoPlaylistsSection => 'Playlisty zdjęć';

  @override
  String get mixedPlaylistsSection => 'Playlisty mieszane';

  @override
  String get playbackTimeDisplay => 'Czas przy pasku postępu';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Wybierz, jakie oznaczenia czasu mają być wyświetlane przy pasku postępu odtwarzania.';

  @override
  String get playbackTimeTotal => 'Całkowity czas trwania';

  @override
  String get playbackTimeRemaining => 'Pozostały czas';

  @override
  String get playbackTimeEndsAt => 'Koniec o';

  @override
  String get playbackTimeElapsed => 'Czas od początku';

  @override
  String get playbackTimeVideoSection => 'Odtwarzacz wideo';

  @override
  String get playbackTimeMusicSection => 'Odtwarzacz muzyki';

  @override
  String get playbackTimeSlotDescription =>
      'Wybierz, co ma być tutaj wyświetlane, lub ukryj tę pozycję.';

  @override
  String get playbackTimeAboveBarLeft => 'Nad paskiem, po lewej';

  @override
  String get playbackTimeAboveBarCenter => 'Nad paskiem, na środku';

  @override
  String get playbackTimeAboveBarRight => 'Nad paskiem, po prawej';

  @override
  String get playbackTimeBelowBarLeft => 'Pod paskiem, po lewej';

  @override
  String get playbackTimeBelowBarCenter => 'Pod paskiem, na środku';

  @override
  String get playbackTimeBelowBarRight => 'Pod paskiem, po prawej';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Wybierz, co ma być wyświetlane po prawej stronie paska postępu muzyki.';

  @override
  String get groupByTitle => 'Grupuj według';

  @override
  String get groupByDecade => 'Dekada (rok)';

  @override
  String get groupByParentalRating => 'Klasyfikacja wiekowa';

  @override
  String get groupByStudio => 'Wytwórnia';

  @override
  String get showAlphabeticalFilters => 'Pokaż alfabet';

  @override
  String get personalRatingStyle => 'Styl ocen użytkownika';

  @override
  String get personalRatingThumbs => 'Lubię / Nie lubię';

  @override
  String get personalRatingStars => '5 gwiazdek';

  @override
  String get personalRatingNumeric => 'Skala 10-punktowa';

  @override
  String get rate => 'Oceń';

  @override
  String get like => 'Lubię';

  @override
  String get dislike => 'Nie lubię';

  @override
  String get personalRatingClear => 'Usuń ocenę';

  @override
  String get personalRatingRated => 'Oceniono';

  @override
  String get personalRatingMine => 'Moja ocena';

  @override
  String get personalRatingSaveFailed => 'Nie udało się zapisać oceny';

  @override
  String get increase => 'Zwiększ';

  @override
  String get decrease => 'Zmniejsz';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'W trakcie';

  @override
  String get filterUnreleased => 'Przed premierą';

  @override
  String get filterTrailers => 'Zwiastuny';

  @override
  String get filterExtras => 'Materiały dodatkowe';

  @override
  String get filterThemeSongs => 'Utwory motywu';

  @override
  String get filterThemeVideos => 'Wideo motywu';

  @override
  String get source => 'Źródło';

  @override
  String get years => 'Lata';

  @override
  String get audioLanguage => 'Język audio';

  @override
  String get subtitleLanguage => 'Język napisów';

  @override
  String get clearFilters => 'Wyczyść filtry';

  @override
  String get seerrShortcutsRow => 'Przeglądaj Seerr';

  @override
  String get seerrReleased => 'Data premiery';

  @override
  String get seerrMinRating => 'Minimalna ocena';

  @override
  String get seerrMinVotes => 'Minimalna liczba głosów';

  @override
  String get seerrOriginalLanguage => 'Język oryginalny';

  @override
  String get seerrRuntime => 'Czas trwania';

  @override
  String get subtitleHdrSeparate => 'Osobny styl HDR';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'Biel jest w HDR znacznie jaśniejsza niż w SDR, dlatego ciemniejszy styl pomaga ograniczyć oślepiający efekt';

  @override
  String get scrollSensitivity => 'Czułość przewijania';

  @override
  String get scrollSensitivitySubtitle =>
      'Odległość przewijania jednym skokiem kółka myszy';

  @override
  String get mediaDetailsAndSpoilers => 'Szczegóły materiałów i spoilery';

  @override
  String get openTrailersExternally =>
      'Otwieraj zwiastuny w zewnętrznej aplikacji';

  @override
  String get openTrailersExternallySubtitle =>
      'Otwieraj zwiastuny w aplikacji YouTube lub przeglądarce zamiast we wbudowanym odtwarzaczu';

  @override
  String get hideDetailsMediaDescription => 'Ukryj opis na ekranie szczegółów';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Ukryj opis filmu lub odcinka.';

  @override
  String get detailUseSeriesThumbnails =>
      'Używaj miniatur serialu na ekranie szczegółów';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Zastąp wszystkie miniatury na klasycznym ekranie szczegółów miniaturą serialu';

  @override
  String get hideHomeMediaDescription => 'Ukryj opis na ekranie głównym';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Ukryj opis filmu lub odcinka.';

  @override
  String get continueWatchingAndNextUpHeader => 'Oglądaj dalej i Następne';

  @override
  String get setupSkip => 'Pomiń konfigurację';

  @override
  String get setupNavbarQuestion => 'Gdzie ma znajdować się nawigacja?';

  @override
  String get setupMediaBarQuestion =>
      'Jak ma wyglądać górna część ekranu głównego?';

  @override
  String get setupHomeRowsQuestion =>
      'Jak mają wyglądać sekcje ekranu głównego?';

  @override
  String get setupDetailQuestion =>
      'Jak ma wyglądać film lub serial po jego otwarciu?';

  @override
  String get setupTourQuestion =>
      'Gotowe. Zobacz, co jeszcze znajdziesz w Moonfin.';

  @override
  String get setupStyleClassic => 'Klasyczny';

  @override
  String get setupStyleModern => 'Nowoczesny';

  @override
  String get setupRowsClassicHint =>
      'Kompaktowy. Więcej sekcji widocznych jednocześnie.';

  @override
  String get setupRowsModernHint => 'Większe karty z tytułami pod spodem.';

  @override
  String get setupDetailClassicHint =>
      'Wszystko wyśrodkowane w jednej kolumnie.';

  @override
  String get setupDetailModernHint =>
      'Kinowy układ z zakładkami obsady i materiałów dodatkowych.';

  @override
  String get setupPickALook => 'Wybierz wygląd';

  @override
  String get setupTourMoreHeader => 'Więcej znajdziesz w Ustawieniach';

  @override
  String get setupTourBulletRequests => 'Prośby Seerr';

  @override
  String get setupTourBulletSyncPlay => 'Wspólne oglądanie z SyncPlay';

  @override
  String get setupTourBulletThemes => 'Własne motywy';

  @override
  String get setupTourBulletDownloads => 'Pobieranie offline';

  @override
  String get setupTourBulletMore => 'I wiele więcej';

  @override
  String get runSetupAgain => 'Uruchom konfigurację ponownie';

  @override
  String get serverMessages => 'Wiadomości';

  @override
  String get serverMessagesEmpty => 'Brak wiadomości z serwera';

  @override
  String get serverMessagesMarkAllRead => 'Oznacz wszystkie jako przeczytane';

  @override
  String get serverMessagesShowButton => 'Pokaż przycisk wiadomości';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Dodaje do menu przycisk wiadomości wysyłanych przez administratora serwera';
}
