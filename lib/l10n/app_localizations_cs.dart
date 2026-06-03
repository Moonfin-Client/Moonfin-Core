// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Měsíční ploutev';

  @override
  String get signIn => 'Přihlaste se';

  @override
  String connectingToServer(String serverName) {
    return 'Připojování k $serverName';
  }

  @override
  String get quickConnect => 'Rychlé připojení';

  @override
  String get password => 'Heslo';

  @override
  String get username => 'Uživatelské jméno';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Zadejte tento kód na webový panel vašeho serveru:';

  @override
  String get waitingForAuthorization => 'Čekání na autorizaci...';

  @override
  String get back => 'Zadní';

  @override
  String get serverUnavailable => 'Server je nedostupný';

  @override
  String get loginFailed => 'Přihlášení se nezdařilo';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect není k dispozici: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect není k dispozici ($status): $detail';
  }

  @override
  String get whosWatching => 'kdo se dívá?';

  @override
  String get addUser => 'Přidat uživatele';

  @override
  String get selectServer => 'Vyberte Server';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin verze $version';
  }

  @override
  String get savedServers => 'Uložené servery';

  @override
  String get discoveredServers => 'Objevené servery';

  @override
  String get noneFound => 'Nebyl nalezen žádný';

  @override
  String get unableToConnectToServer => 'Nelze se připojit k serveru';

  @override
  String get addServer => 'Přidat server';

  @override
  String get embyConnect => 'Emby Připojit';

  @override
  String get removeServer => 'Odebrat server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Odebrat \"$serverName\" ze svých serverů?';
  }

  @override
  String get cancel => 'Zrušit';

  @override
  String get remove => 'Odstranit';

  @override
  String get connectToServer => 'Připojte se k serveru';

  @override
  String get serverAddress => 'Adresa serveru';

  @override
  String get serverAddressHint => 'https://vas-server.example.com';

  @override
  String get connect => 'Připojit';

  @override
  String get secureStorageUnavailable =>
      'Zabezpečené úložiště není k dispozici';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin nemá přístup k vaší systémové klíčence. Přihlášení může pokračovat, ale bezpečné úložiště tokenů nemusí být dostupné, dokud nebude klíčenka odemčena.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Téma aplikace';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Přepínejte mezi Moonfin a Neon Pulse bez restartování aplikace';

  @override
  String get keyboardPreferSystemIme => 'Preferujte systémovou klávesnici';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Pro zadávání textu použijte ve výchozím nastavení metodu zadávání vašeho zařízení';

  @override
  String get themeMoonfin => 'Měsíční ploutev';

  @override
  String get themeMoonfinSubtitle =>
      'Současný vzhled Moonfin, který jste si všichni zamilovali';

  @override
  String get themeNeonPulse => 'Neonový puls';

  @override
  String get themeNeonPulseSubtitle =>
      'Styl Synthwave s purpurovou září, azurovým textem a silnějším kontrastem chromu';

  @override
  String get embyConnectSignInSubtitle =>
      'Přihlaste se pomocí svého účtu Emby Connect';

  @override
  String get emailOrUsername => 'Email nebo Uživatelské jméno';

  @override
  String get selectAServer => 'Vyberte server';

  @override
  String get tryAgain => 'Zkuste to znovu';

  @override
  String get noLinkedServers =>
      'K tomuto účtu Emby Connect nejsou připojeny žádné servery';

  @override
  String get invalidEmbyConnectCredentials =>
      'Neplatné přihlašovací údaje Emby Connect';

  @override
  String get invalidEmbyConnectLogin =>
      'Neplatné uživatelské jméno nebo heslo Emby Connect';

  @override
  String get embyConnectExchangeNotSupported =>
      'Server nepodporuje výměnu Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Chyba sítě při kontaktování Emby Connect nebo vybraného serveru';

  @override
  String get loadingLinkedServers => 'Načítání propojených serverů...';

  @override
  String get connectingToServerEllipsis => 'Připojování k serveru...';

  @override
  String get noReachableAddress => 'Nebyla zadána žádná dostupná adresa';

  @override
  String get invalidServerExchangeResponse =>
      'Neplatná odpověď z koncového bodu serveru Exchange';

  @override
  String unableToConnectTo(String target) {
    return 'Nelze se připojit k $target';
  }

  @override
  String get exitApp => 'Ukončit Moonfin?';

  @override
  String get exitAppConfirmation => 'Opravdu chcete ukončit?';

  @override
  String get exit => 'Výstup';

  @override
  String get noHomeRowsLoaded => 'Nepodařilo se načíst žádné domácí řádky';

  @override
  String get noHomeRowsHint =>
      'Zkuste obnovit nebo omezit aktivní domácí sekce.';

  @override
  String get retryHomeRows => 'Opakovat domovské řádky';

  @override
  String get guide => 'Průvodce';

  @override
  String get recordings => 'Nahrávky';

  @override
  String get schedule => 'Naplánovat';

  @override
  String get series => 'Série';

  @override
  String get noItemsFound => 'Nebyly nalezeny žádné položky';

  @override
  String get home => 'Domov';

  @override
  String get browseAll => 'Procházet vše';

  @override
  String get genres => 'Žánry';

  @override
  String get collectionPlaceholder => 'Zde se objeví sbírkové předměty';

  @override
  String get browseByLetter => 'Procházet podle písmen';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Zde se zobrazí abecední procházení';

  @override
  String get suggestions => 'Návrhy';

  @override
  String get suggestionsPlaceholder => 'Zde se zobrazí navrhované položky';

  @override
  String get failedToLoadLibraries => 'Načtení knihoven se nezdařilo';

  @override
  String get noLibrariesFound => 'Nebyly nalezeny žádné knihovny';

  @override
  String get library => 'Knihovna';

  @override
  String get displaySettings => 'Nastavení zobrazení';

  @override
  String get allGenres => 'Všechny žánry';

  @override
  String get noGenresFound => 'Nebyly nalezeny žádné žánry';

  @override
  String failedToLoadFolderError(String error) {
    return 'Nepodařilo se načíst složku: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Tato složka je prázdná';

  @override
  String itemCountLabel(int count) {
    return '$count položky';
  }

  @override
  String get failedToLoadFavorites => 'Oblíbené položky se nepodařilo načíst';

  @override
  String get retry => 'Zkuste to znovu';

  @override
  String get noFavoritesYet => 'Zatím žádné oblíbené';

  @override
  String get favorites => 'Oblíbené';

  @override
  String totalCountItems(int count) {
    return '$count Položky';
  }

  @override
  String get continuing => 'Pokračování';

  @override
  String get ended => 'Skončilo';

  @override
  String get sortAndFilter => 'Řadit a filtrovat';

  @override
  String get type => 'Typ';

  @override
  String get sortBy => 'Seřadit podle';

  @override
  String get display => 'Zobrazit';

  @override
  String get imageType => 'Typ obrázku';

  @override
  String get posterSize => 'Velikost plakátu';

  @override
  String get small => 'Malý';

  @override
  String get medium => 'Střední';

  @override
  String get large => 'Velký';

  @override
  String get extraLarge => 'Extra velké';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Žánry';
  }

  @override
  String get views => 'Pohledy';

  @override
  String get albums => 'alba';

  @override
  String get albumArtists => 'Umělci alb';

  @override
  String get artists => 'Umělci';

  @override
  String get bookmarks => 'Záložky';

  @override
  String get noSavedBookmarks =>
      'Pro tento titul zatím nejsou uložené žádné záložky.';

  @override
  String get openBook => 'Otevřená kniha';

  @override
  String get chapter => 'Kapitola';

  @override
  String get page => 'Strana';

  @override
  String get bookmark => 'Záložka';

  @override
  String get justNow => 'Právě teď';

  @override
  String minutesAgo(int count) {
    return 'Před ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'Před $count h';
  }

  @override
  String daysAgo(int count) {
    return 'Před ${count}d';
  }

  @override
  String get discoverySubjects => 'Předměty objevování';

  @override
  String get pickDiscoverySubjects =>
      'Vyberte, které zdroje předmětů se mají zobrazit v kanálu Objevit.';

  @override
  String get apply => 'Použít';

  @override
  String get openLink => 'Otevřete odkaz';

  @override
  String get scanWithYourPhone => 'Skenujte pomocí telefonu';

  @override
  String get audiobookGenres => 'Žánry audioknih';

  @override
  String get pickAudiobookGenres =>
      'Vyberte žánry, které chcete zobrazit v Audioknihě Discover.';

  @override
  String get discoverAudiobooks => 'Objevte audioknihy';

  @override
  String get librivoxDescription =>
      'Oblíbené tituly ve veřejném vlastnictví od LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count tituly';
  }

  @override
  String get scrollLeft => 'Přejděte doleva';

  @override
  String get scrollRight => 'Přejděte doprava';

  @override
  String get couldNotLoadGenre => 'Tento žánr se momentálně nepodařilo načíst.';

  @override
  String get continueReading => 'Pokračovat ve čtení';

  @override
  String get savedHighlights => 'Uložené zvýraznění';

  @override
  String get continueListening => 'Pokračovat v poslechu';

  @override
  String get listen => 'Poslouchat';

  @override
  String get resume => 'Resumé';

  @override
  String get failedToLoadLibrary => 'Načtení knihovny se nezdařilo';

  @override
  String get popularNow => 'Populární nyní';

  @override
  String get savedForLater => 'Uloženo na později';

  @override
  String get topListens => 'Top Poslouchá';

  @override
  String get unreadDiscoveries => 'Nepřečtené objevy';

  @override
  String get pickUpAgain => 'Vyzvednout znovu';

  @override
  String get bookHighlightsDescription =>
      'Vaše knihy s zvýrazněním, oblíbenými položkami nebo pokrokem ve čtení.';

  @override
  String get handPickedFromLibrary => 'Ručně vybrané z vaší knihovny.';

  @override
  String get handPickedFromListeningQueue =>
      'Ručně vybrané z vaší poslechové fronty.';

  @override
  String get booksWithHighlights =>
      'Knihy se zvýrazněním, oblíbenými knihami nebo pokrokem ve čtení.';

  @override
  String get jumpBackNarration =>
      'Skočte zpět do vyprávění, aniž byste hledali své místo.';

  @override
  String get unreadBooksReady =>
      'Nepřečtené knihy připravené na další klidnou hodinu.';

  @override
  String get quickAccessFavorites =>
      'Rychlý přístup ke knihám, ke kterým se stále vracíte.';

  @override
  String get searchAudiobooks => 'Hledat audioknihy';

  @override
  String get searchYourLibrary => 'Prohledejte svou knihovnu';

  @override
  String get pickUpStory => 'Pokračujte v příběhu tam, kde jste skončili';

  @override
  String get savedPlacesChapters => 'Vaše uložená místa a nedokončené kapitoly';

  @override
  String authorsCount(int count) {
    return '$count autoři';
  }

  @override
  String genresCount(int count) {
    return '$count žánry';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% dokončeno';
  }

  @override
  String get readyWhenYouAre => 'Připraveni, až budete';

  @override
  String get details => 'Podrobnosti';

  @override
  String get listeningRoom => 'Poslechová místnost';

  @override
  String get bookmarksAndProgress => 'Záložky a pokrok';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count tituly uspořádané pro procházení jako první čtení.';
  }

  @override
  String get titles => 'Tituly';

  @override
  String get allTitles => 'Všechny tituly';

  @override
  String get authors => 'Autoři';

  @override
  String get browseByAuthor => 'Procházet podle autora';

  @override
  String get browseByGenre => 'Procházet podle žánru';

  @override
  String get discover => 'Objevit';

  @override
  String get trendingTitlesOpenLibrary =>
      'Populární tituly podle tématu z Open Library.';

  @override
  String get noBookmarkedItems => 'Zatím žádné položky v záložkách';

  @override
  String get nothingMatchesSection =>
      'Této sekci zatím nic neodpovídá. Zkuste jinou kartu nebo se vraťte po dokončení synchronizace knihovny.';

  @override
  String get audiobooks => 'Audioknihy';

  @override
  String noLabelFound(String label) {
    return 'Nebylo nalezeno žádné $label';
  }

  @override
  String get folder => 'Složka';

  @override
  String get filters => 'Filtry';

  @override
  String get readingStatus => 'Stav čtení';

  @override
  String get playedStatus => 'Stav přehrání';

  @override
  String get readStatus => 'Číst';

  @override
  String get watched => 'Sledováno';

  @override
  String get unread => 'Nepřečtený';

  @override
  String get unwatched => 'Nesledováno';

  @override
  String get seriesStatus => 'Stav série';

  @override
  String get allLibraries => 'Všechny knihovny';

  @override
  String get books => 'knihy';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Neznámý autor';

  @override
  String get uncategorized => 'Nezařazené';

  @override
  String get overview => 'Přehled';

  @override
  String get noLibrivoxDescription =>
      'LibriVox zatím pro tento titul neposkytl žádný popis.';

  @override
  String get readers => 'Čtenáři';

  @override
  String get openLinks => 'Otevřete Odkazy';

  @override
  String get librivoxPage => 'Stránka LibriVox';

  @override
  String get internetArchive => 'Internetový archiv';

  @override
  String get rssFeed => 'RSS kanál';

  @override
  String get downloadZip => 'Stáhnout Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count sekce';
  }

  @override
  String firstPublished(int year) {
    return 'Poprvé zveřejněno $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Pro tento titul zatím není v Open Library dostupný žádný přehled.';

  @override
  String get subjects => 'Předměty';

  @override
  String get all => 'Vše';

  @override
  String booksCount(int count) {
    return '$count knih';
  }

  @override
  String get couldNotLoadSubject => 'Toto téma se teď nepodařilo načíst.';

  @override
  String get audiobookDetails => 'Podrobnosti audioknihy';

  @override
  String authorsCountTitle(int count) {
    return '$count Autoři';
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
  String get trackList => 'Seznam skladeb';

  @override
  String get itemListPlaceholder => 'Zde se zobrazí seznam položek';

  @override
  String get favoriteTracksPlaceholder => 'Zde se zobrazí oblíbené skladby';

  @override
  String get failedToLoad => 'Načtení se nezdařilo';

  @override
  String get delete => 'Vymazat';

  @override
  String get save => 'Uložit';

  @override
  String get moreLikeThis => 'Více podobných';

  @override
  String get castAndCrew => 'Obsazení a štáb';

  @override
  String get collection => 'Sbírka';

  @override
  String get episodes => 'Epizody';

  @override
  String get nextUp => 'Další Nahoru';

  @override
  String get seasons => 'Roční období';

  @override
  String get chapters => 'Kapitoly';

  @override
  String get features => 'Vlastnosti';

  @override
  String get movies => 'Filmy';

  @override
  String get musicVideos => 'Hudební videa';

  @override
  String get other => 'Ostatní';

  @override
  String get discography => 'Diskografie';

  @override
  String get similarArtists => 'Podobní umělci';

  @override
  String get tableOfContents => 'Obsah';

  @override
  String get tracklist => 'Tracklist';

  @override
  String discNumber(int number) {
    return 'Disk $number';
  }

  @override
  String get biography => 'Životopis';

  @override
  String get authorDetails => 'Podrobnosti o autorovi';

  @override
  String get noOverviewAvailable =>
      'Pro tento titul zatím není k dispozici žádný přehled.';

  @override
  String get noBiographyAvailable =>
      'Pro tohoto autora není k dispozici žádná biografie.';

  @override
  String get noBooksFound => 'Pro tohoto autora nebyly nalezeny žádné knihy.';

  @override
  String get unableToLoadAuthorDetails =>
      'Momentálně nelze načíst podrobnosti o autorovi.';

  @override
  String published(int year) {
    return 'Publikováno $year';
  }

  @override
  String get publicationDateUnknown => 'Datum vydání neznámé';

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
    return 'Končí na $time';
  }

  @override
  String get view => 'Pohled';

  @override
  String get resumeReading => 'Pokračovat ve čtení';

  @override
  String get read => 'Číst';

  @override
  String resumeFrom(String position) {
    return 'Obnovit z $position';
  }

  @override
  String get play => 'Hrát';

  @override
  String get startOver => 'Začít znovu';

  @override
  String get restart => 'Restartujte';

  @override
  String get readOffline => 'Číst offline';

  @override
  String get playOffline => 'Hrát offline';

  @override
  String get audio => 'Zvuk';

  @override
  String get subtitles => 'titulky';

  @override
  String get version => 'Verze';

  @override
  String get cast => 'Obsazení';

  @override
  String get trailer => 'Přívěs';

  @override
  String get finished => 'Hotovo';

  @override
  String get favorited => 'Oblíbené';

  @override
  String get favorite => 'Oblíbený';

  @override
  String get playlist => 'Seznam skladeb';

  @override
  String get downloaded => 'Staženo';

  @override
  String get downloadAll => 'Stáhnout vše';

  @override
  String get download => 'Stáhnout';

  @override
  String get deleteDownloaded => 'Smazat staženo';

  @override
  String get goToSeries => 'Přejděte na Série';

  @override
  String get editMetadata => 'Upravit metadata';

  @override
  String get less => 'Méně';

  @override
  String get more => 'Více';

  @override
  String get deleteItem => 'Smazat položku';

  @override
  String get deletePlaylist => 'Smazat seznam skladeb';

  @override
  String get deletePlaylistMessage => 'Smazat tento seznam skladeb ze serveru?';

  @override
  String get deleteItemMessage => 'Smazat tuto položku ze serveru?';

  @override
  String get failedToDeletePlaylist => 'Seznam skladeb se nepodařilo smazat';

  @override
  String get failedToDeleteItem => 'Položku se nepodařilo smazat';

  @override
  String get renamePlaylist => 'Přejmenovat seznam skladeb';

  @override
  String get playlistName => 'Název seznamu skladeb';

  @override
  String get deleteDownloadedAlbum => 'Smazat stažené album';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Smazat stažené skladby pro \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Stažené skladby byly smazány';

  @override
  String get downloadedTracksDeleteFailed =>
      'Některé stažené skladby nebylo možné smazat';

  @override
  String get noTracksLoaded => 'Nejsou načteny žádné stopy';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Nebylo načteno žádné $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Stahování $title ($count položek)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Opravdu chcete smazat \"$name\" ze serveru? Tuto akci nelze vrátit zpět.';
  }

  @override
  String get itemDeleted => 'Položka byla smazána';

  @override
  String get noPlayableTrailerFound => 'Nebyl nalezen žádný hratelný trailer.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Nepodporovaný formát knihy: .$extension';
  }

  @override
  String get audioTrack => 'Zvuková stopa';

  @override
  String get subtitleTrack => 'Titulková stopa';

  @override
  String get none => 'Žádný';

  @override
  String get downloadSubtitlesLabel => 'Stáhnout titulky...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Hledejte pomocí pluginu OpenSubtitles';

  @override
  String get downloadSubtitles => 'Stáhnout titulky';

  @override
  String get selectedSubtitleInvalid => 'Vybrané titulky jsou neplatné.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Titulky staženy a vybrány: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Titulky staženy. Než Jellyfin obnoví položku, může chvíli trvat, než se objeví.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Pro $language nebyly nalezeny žádné vzdálené titulky.';
  }

  @override
  String get selectVersion => 'Vyberte verzi';

  @override
  String versionNumber(int number) {
    return 'Verze $number';
  }

  @override
  String get downloadAllQuality => 'Stáhnout vše — Kvalita';

  @override
  String get downloadQuality => 'Kvalita ke stažení';

  @override
  String get originalFileNoReencoding => 'Původní soubor, žádné překódování';

  @override
  String get originalFilesNoReencoding => 'Původní soubory, žádné překódování';

  @override
  String get noEpisodesLoaded => 'Nebyly načteny žádné epizody';

  @override
  String downloadingItem(String name, String quality) {
    return 'Stahování $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Smazat stažené soubory';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Smazat místní soubory pro $typeLabel?\n\nTím se uvolní úložný prostor. Později můžete znovu stáhnout.';
  }

  @override
  String get downloadedFilesDeleted => 'Stažené soubory smazány';

  @override
  String get failedToDeleteFiles => 'Smazání souborů se nezdařilo';

  @override
  String get deleteFiles => 'Smazat soubory';

  @override
  String get director => 'ŘEDITEL';

  @override
  String get writers => 'SPISOVATELÉ';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count další';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Epizody';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Epizoda $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Kapitola $number';
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
    return 'Narozen $date';
  }

  @override
  String died(String date) {
    return 'Zemřel $date';
  }

  @override
  String age(int age) {
    return 'Věk $age';
  }

  @override
  String get showLess => 'Zobrazit méně';

  @override
  String get readMore => 'Přečtěte si více';

  @override
  String get shuffle => 'Zamíchat';

  @override
  String downloadsCount(int count) {
    return '$count stahování';
  }

  @override
  String get perfectMatch => 'Perfektní shoda';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stereo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Vzdálené titulky $action vyžaduje od tohoto uživatele oprávnění ke správě titulků Jellyfin.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Tato položka nebyla nalezena na serveru pro vzdálené titulky $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Vzdálené titulky $action se nezdařily: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Vzdálené titulky $action se nezdařily (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Nepodařilo se vytvořit vzdálené titulky $action.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'všechny stažené epizody pro \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'všechny stažené epizody v této sezóně';

  @override
  String get stillWatching => 'Stále se díváte?';

  @override
  String get unableToLoadTrailerStream => 'Nelze načíst stream upoutávky.';

  @override
  String get trailerTimedOut => 'Při načítání vypršel časový limit upoutávky.';

  @override
  String get playbackFailedForTrailer =>
      'Přehrávání této upoutávky se nezdařilo.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Odesílání je během přehrávání offline nedostupné.';

  @override
  String castActionFailed(String label, String error) {
    return 'Akce $label selhala: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Nepodařilo se nastavit hlasitost odesílání: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Ovládací prvky';
  }

  @override
  String get deviceVolume => 'Hlasitost zařízení';

  @override
  String get unavailable => 'Není k dispozici';

  @override
  String get pause => 'Pauza';

  @override
  String get syncPosition => 'Synchronizovat pozici';

  @override
  String stopCast(String label) {
    return 'Zastavit $label';
  }

  @override
  String get queueIsEmpty => 'Fronta je prázdná';

  @override
  String trackNumber(int number) {
    return 'Sledovat $number';
  }

  @override
  String get remotePlayback => 'Vzdálené přehrávání';

  @override
  String get castingToGoogleCast => 'Odesílání do Google Cast';

  @override
  String get castingViaAirPlay => 'Odesílání přes AirPlay';

  @override
  String get castingViaDlna => 'Casting přes DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds sekund';
  }

  @override
  String get longPressToUnlock => 'Dlouhým stisknutím odemknete';

  @override
  String get off => 'Vypnuto';

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
  String get bitrateOverride => 'Přepsání bitové rychlosti';

  @override
  String get audioDelay => 'Zpoždění zvuku';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Zpoždění titulků';

  @override
  String get reset => 'Resetovat';

  @override
  String get unknown => 'Neznámý';

  @override
  String get playbackInformation => 'Informace o přehrávání';

  @override
  String get playback => 'Přehrávání';

  @override
  String get playMethod => 'Metoda hraní';

  @override
  String get directPlay => 'Přímé přehrávání';

  @override
  String get directStream => 'Přímý proud';

  @override
  String get transcoding => 'Překódování';

  @override
  String get transcodeReasons => 'Důvody překódování';

  @override
  String get player => 'Hráč';

  @override
  String get container => 'Kontejner';

  @override
  String get bitrate => 'Bitová rychlost';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Rezoluce';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'kodek';

  @override
  String get videoBitrate => 'Přenosová rychlost videa';

  @override
  String get track => 'Dráha';

  @override
  String get channels => 'Kanály';

  @override
  String get audioBitrate => 'Přenosová rychlost zvuku';

  @override
  String get sampleRate => 'Vzorkovací frekvence';

  @override
  String get format => 'Formát';

  @override
  String get external => 'Externí';

  @override
  String get embedded => 'Vložené';

  @override
  String castSessionError(String protocol) {
    return 'Chyba relace $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Nepodařilo se načíst podrobnosti o knize: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Vykreslování EPUB v aplikaci zatím není na této platformě dostupné.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Tento formát (.$extension) zatím nelze v aplikaci vykreslit.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Vykreslování vložených dokumentů není na této platformě k dispozici.';

  @override
  String get couldNotOpenExternalViewer => 'Nelze otevřít externí prohlížeč.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Nepodařilo se otevřít čtečku v aplikaci: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Záložka je již uložena na adrese $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Přidána záložka: $label';
  }

  @override
  String get noBookmarksYet =>
      'Zatím žádné záložky.\nKlepnutím na ikonu záložky při čtení uložíte svou pozici.';

  @override
  String get noTableOfContentsAvailable => 'Není k dispozici žádný obsah';

  @override
  String pageLabel(int number) {
    return 'Stránka $number';
  }

  @override
  String get position => 'Pozice';

  @override
  String get bookReader => 'Čtečka knih';

  @override
  String formatExtension(String extension) {
    return 'Formát: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% přečteno';
  }

  @override
  String get updating => 'Aktualizace...';

  @override
  String get markUnread => 'Označit jako nepřečtené';

  @override
  String get markAsRead => 'Označit jako přečtené';

  @override
  String get reloadReader => 'Znovu načíst čtečku';

  @override
  String get noPagesFound => 'Nebyly nalezeny žádné stránky.';

  @override
  String get failedToDecodePageImage =>
      'Nepodařilo se dekódovat obrázek stránky.';

  @override
  String resetZoom(String zoom) {
    return 'Obnovit přiblížení (${zoom}x)';
  }

  @override
  String get singlePage => 'Jedna stránka';

  @override
  String get twoPageSpread => 'Šíření na dvě stránky';

  @override
  String get addBookmark => 'Přidat záložku';

  @override
  String get bookmarksEllipsis => 'Záložky...';

  @override
  String get markedAsRead => 'Označeno jako přečtené';

  @override
  String get markedAsUnread => 'Označeno jako nepřečtené';

  @override
  String failedToUpdateReadState(String error) {
    return 'Aktualizace stavu čtení se nezdařila: $error';
  }

  @override
  String get themeSystem => 'Téma: Systém';

  @override
  String get themeLight => 'Téma: Světlo';

  @override
  String get themeDark => 'Téma: Tmavý';

  @override
  String get themeSepia => 'Téma: Sépie';

  @override
  String get invertColorsFixedLayout => 'Invertovat barvy (pevné rozvržení)';

  @override
  String get invertColorsPdf => 'Invertovat barvy (PDF)';

  @override
  String get preparingInAppReader => 'Příprava čtečky v aplikaci...';

  @override
  String get pdfDataNotAvailable => 'Data PDF nejsou k dispozici.';

  @override
  String get readerFallbackModeActive => 'Záložní režim čtečky je aktivní';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Tato platforma nemůže hostit vložený dokumentový stroj pro soubory $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Po přepnutí na podporovanou cílovou platformu použijte Reload Reader (Android, iOS, macOS).';

  @override
  String get openExternally => 'Otevřít externě';

  @override
  String get noEpubChaptersFound => 'Nebyly nalezeny žádné kapitoly EPUB.';

  @override
  String get readerNotReady => 'Čtenář není připraven.';

  @override
  String get seriesRecordings => 'Seriálové nahrávky';

  @override
  String get now => 'Teď';

  @override
  String get sports => 'Sportovní';

  @override
  String get news => 'Zprávy';

  @override
  String get kids => 'Děti';

  @override
  String get premiere => 'Premiéra';

  @override
  String get guideTimeline => 'Průvodce časovou osou';

  @override
  String failedToLoadGuide(String error) {
    return 'Nepodařilo se načíst průvodce: $error';
  }

  @override
  String get noChannelsFound => 'Nebyly nalezeny žádné kanály';

  @override
  String get liveBadge => 'ŽÍT';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Odebráno z oblíbených kanálů';

  @override
  String get addedToFavoriteChannels => 'Přidáno do oblíbených kanálů';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Aktualizace oblíbeného kanálu se nezdařila';

  @override
  String get unfavoriteChannel => 'Neoblíbený kanál';

  @override
  String get favoriteChannel => 'Oblíbený kanál';

  @override
  String get record => 'Záznam';

  @override
  String get cancelRecordingAction => 'Zrušit nahrávání';

  @override
  String get programSetToRecord => 'Program nastaven k nahrávání';

  @override
  String get recordingCancelled => 'Nahrávání zrušeno';

  @override
  String get unableToCreateRecording => 'Nelze vytvořit záznam';

  @override
  String get watch => 'Hodinky';

  @override
  String get close => 'Blízko';

  @override
  String failedToPlayChannel(String name) {
    return 'Nepodařilo se přehrát $name';
  }

  @override
  String get failedToLoadRecordings => 'Nahrání se nezdařilo';

  @override
  String get scheduledInNext24Hours => 'Naplánováno na příštích 24 hodin';

  @override
  String get recentRecordings => 'Nedávné nahrávky';

  @override
  String get tvSeries => 'TV seriál';

  @override
  String get failedToLoadSchedule => 'Plán se nepodařilo načíst';

  @override
  String get noScheduledRecordings => 'Žádné naplánované nahrávky';

  @override
  String get cancelRecording => 'Zrušit nahrávání?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Zrušit naplánované nahrávání „$name“?';
  }

  @override
  String get no => 'Žádný';

  @override
  String get yesCancel => 'Ano, zrušit';

  @override
  String get failedToCancelRecording => 'Záznam se nepodařilo zrušit';

  @override
  String get failedToLoadSeriesRecordings =>
      'Nepodařilo se načíst nahrávky série';

  @override
  String get noSeriesRecordings => 'Žádné nahrávky seriálu';

  @override
  String get cancelSeriesRecording => 'Zrušit nahrávání seriálu';

  @override
  String get cancelSeriesRecordingQuestion => 'Zrušit nahrávání seriálu?';

  @override
  String stopRecordingName(String name) {
    return 'Zastavit nahrávání „$name“?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Nahrávání série se nepodařilo zrušit';

  @override
  String get searchThisLibrary => 'Prohledat tuto knihovnu...';

  @override
  String get searchEllipsis => 'Vyhledávání...';

  @override
  String noResultsForQuery(String query) {
    return 'Žádné výsledky pro \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Hledání se nezdařilo: $error';
  }

  @override
  String get seerr => 'Serr';

  @override
  String get seerrAccountType => 'Typ účtu Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Místní';

  @override
  String get savedMedia => 'Uložená média';

  @override
  String get tvShows => 'TV pořady';

  @override
  String get music => 'Hudba';

  @override
  String get musicAlbums => 'Hudební alba';

  @override
  String get noMediaInFilter => 'V tomto filtru nejsou žádná média';

  @override
  String get noDownloadedMediaYet => 'Zatím žádná stažená média';

  @override
  String get browseLibrary => 'Procházet knihovnu';

  @override
  String get deleteDownload => 'Smazat stahování';

  @override
  String removeItemAndFiles(String name) {
    return 'Odstranit \"$name\" a jeho soubory?';
  }

  @override
  String tracksCount(int count) {
    return '$count skladeb';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Přehrát album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Nepodařilo se načíst album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Pro $name nebyly nalezeny žádné stažené skladby.';
  }

  @override
  String get season => 'Sezóna';

  @override
  String get errorLoadingEpisodes => 'Chyba při načítání epizod';

  @override
  String get noDownloadedEpisodes => 'Žádné stažené epizody';

  @override
  String get deleteEpisode => 'Smazat epizodu';

  @override
  String removeName(String name) {
    return 'Odebrat \"$name\"?';
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
    return 'Epizoda $number';
  }

  @override
  String get seriesNotFound => 'Série nenalezena';

  @override
  String get errorLoadingSeries => 'Chyba při načítání série';

  @override
  String get downloadedEpisodes => 'Stažené epizody';

  @override
  String seasonNumber(int number) {
    return 'Řada $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Speciality';

  @override
  String get deleteSeason => 'Smazat sezónu';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Smazat všechny stažené epizody v $season?';
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
  String get storageManagement => 'Správa úložiště';

  @override
  String get storageBreakdown => 'Rozdělení úložiště';

  @override
  String get downloadedItems => 'Stažené položky';

  @override
  String get storageLimit => 'Limit úložiště';

  @override
  String get noLimit => 'Bez omezení';

  @override
  String get deleteAllDownloads => 'Smazat všechny stažené soubory';

  @override
  String get deleteAllDownloadsWarning =>
      'Tím se odstraní všechny stažené mediální soubory a nelze to vrátit.';

  @override
  String get deleteAll => 'Smazat vše';

  @override
  String get deleteSelected => 'Smazat vybrané';

  @override
  String deleteSelectedCount(int count) {
    return 'Smazat $count stažené položky?';
  }

  @override
  String get musicAndAudiobooks => 'Hudba a audioknihy';

  @override
  String get images => 'Obrázky';

  @override
  String get database => 'Databáze';

  @override
  String ofStorageLimit(String limit) {
    return 'limitu $limit';
  }

  @override
  String get settings => 'Nastavení';

  @override
  String get authentication => 'Autentizace';

  @override
  String get autoLoginServerManagement =>
      'Automatické přihlášení, správa serveru';

  @override
  String get pinCode => 'PIN kód';

  @override
  String get setUpPinCodeProtection => 'Nastavte ochranu PIN kódem';

  @override
  String get parentalControls => 'Rodičovská kontrola';

  @override
  String get contentRatingRestrictions => 'Omezení hodnocení obsahu';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, rozlišení, chování';

  @override
  String get languageSizeAppearance => 'Jazyk, velikost, vzhled';

  @override
  String get qualityStorage => 'Kvalita, skladnost';

  @override
  String get serverSyncAndPluginStatus =>
      'Synchronizace serveru a stav pluginu';

  @override
  String get mediaRequestIntegration => 'Integrace mediálních požadavků';

  @override
  String get switchServer => 'Přepnout server';

  @override
  String get signOut => 'Odhlásit se';

  @override
  String get versionLicenses => 'Verze, licence';

  @override
  String get account => 'Účet';

  @override
  String get signInAndSecurity => 'Přihlášení a zabezpečení';

  @override
  String get administration => 'Správa';

  @override
  String get serverSettingsUsersLibraries =>
      'Nastavení serveru, uživatelé, knihovny';

  @override
  String get customization => 'Přizpůsobení';

  @override
  String get themeAndLayout => 'Téma a rozvržení';

  @override
  String get videoAndSubtitles => 'Video a titulky';

  @override
  String get integrations => 'Integrace';

  @override
  String get pluginAndRequests => 'Plugin a požadavky';

  @override
  String get customizeAccountPlaybackInterface =>
      'Přizpůsobte si účet, přehrávání a chování rozhraní';

  @override
  String optionsCount(int count) {
    return '$count možnosti';
  }

  @override
  String get themeAndAppearance => 'Téma a vzhled';

  @override
  String get focusBorderColor => 'Barva ohraničení zaměření';

  @override
  String get watchedIndicators => 'Sledované indikátory';

  @override
  String get always => 'Vždy';

  @override
  String get hideUnwatched => 'Skrýt Nesledované';

  @override
  String get episodesOnly => 'Pouze epizody';

  @override
  String get never => 'Nikdy';

  @override
  String get focusExpansionAnimation => 'Animace rozšíření zaostření';

  @override
  String get desktopUiScale => 'Desktop UI Scale';

  @override
  String get scaleFocusedCards =>
      'Měřítko zaměřené nebo vznášené karty a dlaždice';

  @override
  String get backgroundBackdrops => 'Pozadí pozadí';

  @override
  String get showBackdropImages => 'Zobrazit obrázky pozadí za obsahem';

  @override
  String get seriesThumbnails => 'Miniatury seriálu';

  @override
  String get seriesThumbnailsDescription =>
      'Pouze epizody: použijte kresbu série, která odpovídá každému typu obrazu řádku';

  @override
  String get homeRowInfoOverlay => 'Překryvné informace o domovském řádku';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Při procházení domovských řádků zobrazit název a metadata';

  @override
  String get clockDisplay => 'Zobrazení hodin';

  @override
  String get inMenus => 'V Menu';

  @override
  String get inVideo => 'Ve videu';

  @override
  String get seasonalEffects => 'Sezónní efekty';

  @override
  String get seasonalEffectsDescription => 'Vizuální efekty a sezónní dekorace';

  @override
  String get snow => 'Sněžení';

  @override
  String get fireworks => 'Ohňostroj';

  @override
  String get confetti => 'Konfety';

  @override
  String get fallingLeaves => 'Padající listí';

  @override
  String get themeMusic => 'Téma Hudba';

  @override
  String get playThemeMusicOnDetailPages =>
      'Přehrávejte tematickou hudbu na stránkách s podrobnostmi';

  @override
  String get themeMusicVolume => 'Téma Hudba Volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Tématická hudba na domácích řádcích';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Přehrát při procházení domovské obrazovky';

  @override
  String get detailsBackgroundBlur => 'Podrobnosti Rozostření pozadí';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Rozostření pozadí procházení';

  @override
  String get maxStreamingBitrate => 'Maximální datový tok streamování';

  @override
  String get maxResolution => 'Maximální rozlišení';

  @override
  String get playerZoomMode => 'Režim zvětšení přehrávače';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Automatické oříznutí';

  @override
  String get stretch => 'Úsek';

  @override
  String get refreshRateSwitching => 'Přepínání obnovovací frekvence';

  @override
  String get disabled => 'Zakázáno';

  @override
  String get scaleOnTv => 'Měřítko v televizi';

  @override
  String get scaleOnDevice => 'Měřítko na zařízení';

  @override
  String get trickPlay => 'Trik Play';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Při hledání zobrazovat náhledy';

  @override
  String get showDescriptionOnPause => 'Zobrazit popis při pauze';

  @override
  String get dimVideoShowOverview =>
      'Ztlumit video a zobrazit text přehledu při pozastavení';

  @override
  String get osdLockButton => 'Tlačítko zámku OSD';

  @override
  String get osdLockButtonDescription =>
      'Zobrazit zamykací tlačítko, které blokuje dotykový vstup, dokud jej dlouho nestisknete';

  @override
  String get audioBehavior => 'Zvukové chování';

  @override
  String get downmixToStereo => 'Downmix do Sterea';

  @override
  String get defaultAudioLanguage => 'Výchozí jazyk zvuku';

  @override
  String get autoServerDefault => 'Auto (výchozí nastavení serveru)';

  @override
  String get english => 'angličtina';

  @override
  String get spanish => 'španělština';

  @override
  String get french => 'francouzština';

  @override
  String get german => 'Němec';

  @override
  String get italian => 'italština';

  @override
  String get portuguese => 'portugalština';

  @override
  String get japanese => 'japonský';

  @override
  String get korean => 'korejština';

  @override
  String get chinese => 'čínština';

  @override
  String get russian => 'ruština';

  @override
  String get arabic => 'arabština';

  @override
  String get hindi => 'hindština';

  @override
  String get dutch => 'holandský';

  @override
  String get swedish => 'švédský';

  @override
  String get norwegian => 'norský';

  @override
  String get danish => 'dánština';

  @override
  String get finnish => 'finština';

  @override
  String get polish => 'polština';

  @override
  String get ac3Passthrough => 'Průchod AC3';

  @override
  String get dtsPassthrough => 'Průchod DTS';

  @override
  String get trueHdSupport => 'Podpora TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS audio pouze do AVR; vyžaduje podporu přijímače a zdrojovou stopu DTS';

  @override
  String get enableTrueHdAudio =>
      'Povolit zvuk TrueHD (nemusí fungovat na všech platformách)';

  @override
  String get settingsAudioOutputMode => 'Režim zvukového výstupu';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Průchod AVR';

  @override
  String get settingsAudioFallbackCodec => 'Zvukový záložní kodek';

  @override
  String get settingsAudioFallbackAacStereo => 'Stereo AAC';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Průchod (pokročilé)';

  @override
  String get settingsAudioCodecPassthrough => 'Průchod kodekem';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Povolte pouze formáty, které váš AVR nebo HDMI umyvadlo podporuje.';

  @override
  String get settingsAudioEac3Passthrough => 'Průchod EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Průchod EAC3 JOC (Atmos).';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'Průchod DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) do externího dekodéru.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos přes EAC3 (JOC) do externího dekodéru.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (obsahuje jádro DTS) do externího dekodéru.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD s metadaty Atmos do externího dekodéru.';

  @override
  String get settingsDetectedAudioCapabilities => 'Zjištěné zvukové schopnosti';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Zatím není k dispozici žádný snímek schopnosti běhu.';

  @override
  String get settingsAudioRouteLabel => 'Trasa';

  @override
  String get settingsAudioDecodeLabel => 'Dekódovat';

  @override
  String get settingsAudioPassthroughLabel => 'Průchod';

  @override
  String get settingsAudioHdRoute => 'HD audio trasa';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Reproduktor';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnostika';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Úroveň videa';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Rozsah videa';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Titulkový kodek';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Povolené zvukové kodeky';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Zvukové kodeky HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Zvukové kodeky HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'audio-spdif průchod';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Aktivní audio trasa';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Route HD Audio Podpora';

  @override
  String get nightMode => 'Noční režim';

  @override
  String get compressDynamicRange => 'Komprimujte dynamický rozsah';

  @override
  String get advancedMpv => 'Pokročilé mpv';

  @override
  String get enableCustomMpvConf => 'Povolit vlastní mpv.conf';

  @override
  String get applyMpvConfBeforePlayback =>
      'Před zahájením přehrávání použijte uživatelsky specifikovaný soubor mpv.conf';

  @override
  String get unsafeAdvancedMpvOptions => 'Nebezpečné pokročilé možnosti mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Povolit širší sadu možností mpv. Může narušit chování přehrávání.';

  @override
  String get hardwareDecoding => 'Hardwarové dekódování';

  @override
  String get hardwareDecodingSubtitle =>
      'Může zlepšit výkon, ale na některých zařízeních může způsobit problémy s přehráváním.';

  @override
  String get nextUpAndQueuing => 'Další nahoru a řazení do fronty';

  @override
  String get nextUpDisplay => 'Další Nahoru Zobrazení';

  @override
  String get extended => 'Rozšířené';

  @override
  String get minimal => 'Minimální';

  @override
  String get nextUpTimeout => 'Další Up Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Zařazení médií do fronty';

  @override
  String get autoQueueNextEpisodes =>
      'Automaticky zařadit další epizody do fronty';

  @override
  String get stillWatchingPrompt => 'Stále sleduje výzvu';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Po $episodes epizodách / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Obnovit a přeskočit';

  @override
  String get resumeRewind => 'Resume Rewind';

  @override
  String get unpauseRewind => 'Zrušit pozastavení přetáčení';

  @override
  String get fiveSeconds => '5 sekund';

  @override
  String get tenSeconds => '10 sekund';

  @override
  String get fifteenSeconds => '15 sekund';

  @override
  String get thirtySeconds => '30 sekund';

  @override
  String get skipBackLength => 'Přeskočit zpět délku';

  @override
  String get skipForwardLength => 'Přeskočit délku vpřed';

  @override
  String get customMpvConfPath => 'Vlastní cesta mpv.conf';

  @override
  String get notSetMpvConf =>
      'Není nastaveno. Moonfin zkusí výchozí mpv.conf ve složkách app/data.';

  @override
  String get selectMpvConf => 'Vyberte mpv.conf';

  @override
  String get pathToMpvConf => '/cesta/k/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Nastavení stylu (velikost, barva, offset) platí pro textové titulky (SRT, VTT, TTML). Titulky ASS/SSA používají svůj vlastní vložený styl, pokud není vypnuto „přímé přehrávání ASS/SSA“. Bitmapové titulky (PGS, DVB, VobSub) nelze změnit.';

  @override
  String get defaultSubtitleLanguage => 'Výchozí jazyk titulků';

  @override
  String get defaultToNoSubtitles => 'Výchozí nastavení je Bez titulků';

  @override
  String get turnOffSubtitlesByDefault =>
      'Ve výchozím nastavení titulky vypnout';

  @override
  String get subtitleSize => 'Velikost titulků';

  @override
  String get textFillColor => 'Barva výplně textu';

  @override
  String get backgroundColor => 'Barva pozadí';

  @override
  String get textStrokeColor => 'Barva tahu textu';

  @override
  String get subtitleCustomization => 'Přizpůsobení titulků';

  @override
  String get subtitleCustomizationDescription => 'Přizpůsobte vzhled titulků';

  @override
  String get subtitlePreviewText => 'Rychlá hnědá liška přeskakuje líného psa';

  @override
  String get verticalOffset => 'Vertikální posun';

  @override
  String get pgsDirectPlay => 'Přímá hra PGS';

  @override
  String get directPlayPgsSubtitles => 'Přímé přehrávání titulků PGS';

  @override
  String get assSsaDirectPlay => 'Přímé přehrávání ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles => 'Přímé přehrávání titulků ASS/SSA';

  @override
  String get white => 'Bílý';

  @override
  String get black => 'Černý';

  @override
  String get yellow => 'Žluť';

  @override
  String get green => 'Zelený';

  @override
  String get cyan => 'azurová';

  @override
  String get red => 'Červený';

  @override
  String get transparent => 'Průhledný';

  @override
  String get semiTransparentBlack => 'Poloprůhledná černá';

  @override
  String get global => 'Globální';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Mobilní';

  @override
  String get tv => 'televize';

  @override
  String loadedProfileSettings(String profile) {
    return 'Načteno nastavení profilu $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Nepodařilo se načíst nastavení profilu $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Synchronizováno místní nastavení s profilem $profile.';
  }

  @override
  String get customizationProfile => 'Profil přizpůsobení';

  @override
  String get customizationProfileDescription =>
      'Vyberte profil, který chcete načíst, upravit a synchronizovat. Globální platí všude, pokud jej nepřepíše profil zařízení. Zelená tečka označuje váš aktuální profil zařízení.';

  @override
  String get loadProfile => 'Načíst profil';

  @override
  String get syncing => 'Synchronizace...';

  @override
  String get syncToProfile => 'Synchronizovat do profilu';

  @override
  String get profileSyncHidden => 'Synchronizace profilu skryta';

  @override
  String get enablePluginSyncDescription =>
      'Chcete-li zde zobrazit ovládací prvky profilu, povolte v nastavení pluginu synchronizaci serverového pluginu.';

  @override
  String get quality => 'Kvalitní';

  @override
  String get defaultDownloadQuality => 'Výchozí kvalita stahování';

  @override
  String get network => 'Síť';

  @override
  String get wifiOnlyDownloads => 'Stahování pouze pro WiFi';

  @override
  String get onlyDownloadOnWifi => 'Stahujte pouze při připojení k WiFi';

  @override
  String get storage => 'Skladování';

  @override
  String get storageUsed => 'Použité úložiště';

  @override
  String get manage => 'Spravovat';

  @override
  String get calculating => 'Počítání...';

  @override
  String get downloadLocation => 'Umístění ke stažení';

  @override
  String get defaultLabel => 'Výchozí';

  @override
  String get saveToDownloadsFolder => 'Uložit do složky Stažené soubory';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — viditelné pro ostatní aplikace';

  @override
  String get dangerZone => 'Nebezpečná zóna';

  @override
  String get clearAllDownloads => 'Vymazat všechna stažená data';

  @override
  String get original => 'Originál';

  @override
  String get changeDownloadLocation => 'Změnit umístění stahování';

  @override
  String get changeDownloadLocationDescription =>
      'Nové stažené soubory budou uloženy do vybrané složky. Stávající stažené soubory zůstanou na svém aktuálním místě a lze je spravovat v nastavení úložiště.';

  @override
  String get confirm => 'Potvrdit';

  @override
  String get cannotWriteToFolder =>
      'Nelze zapisovat do vybrané složky. Vyberte prosím jiné umístění nebo udělte oprávnění k úložišti.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Uložit do složky Stažené soubory?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Stažená média se uloží do složky Downloads/Moonfin na vašem zařízení. Tyto soubory budou viditelné pro ostatní aplikace, jako je vaše galerie nebo hudební přehrávač.\n\nStávající stažené soubory zůstanou na svém aktuálním místě.';

  @override
  String get enable => 'Umožnit';

  @override
  String get clearAllDownloadsWarning =>
      'Touto akcí smažete všechna stažená média a nelze ji vrátit zpět.';

  @override
  String get clearAll => 'Vymazat vše';

  @override
  String get navigationStyle => 'Styl navigace';

  @override
  String get topBar => 'Horní lišta';

  @override
  String get leftSidebar => 'Levý postranní panel';

  @override
  String get showShuffleButton => 'Zobrazit tlačítko Shuffle';

  @override
  String get showGenresButton => 'Zobrazit tlačítko žánrů';

  @override
  String get showFavoritesButton => 'Zobrazit tlačítko Oblíbené';

  @override
  String get showLibrariesInToolbar => 'Zobrazit knihovny na liště Toolbar';

  @override
  String get navbarOpacity => 'Neprůhlednost navigační lišty';

  @override
  String get navbarColor => 'Barva navigační lišty';

  @override
  String get gray => 'Šedá';

  @override
  String get darkBlue => 'Tmavě modrá';

  @override
  String get purple => 'Fialová';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'námořnictvo';

  @override
  String get charcoal => 'Dřevěné uhlí';

  @override
  String get brown => 'Hnědý';

  @override
  String get darkRed => 'Tmavě červená';

  @override
  String get darkGreen => 'Tmavě zelená';

  @override
  String get slate => 'Břidlice';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Zobrazení knihovny';

  @override
  String get posterLabel => 'Plakát';

  @override
  String get thumbnailLabel => 'Náhled';

  @override
  String get bannerLabel => 'Prapor';

  @override
  String get overridePerLibrarySettings => 'Přepsat nastavení podle knihovny';

  @override
  String get applyImageTypeToAllLibraries =>
      'Použijte typ obrázku na všechny knihovny';

  @override
  String get multiServerLibraries => 'Multiserverové knihovny';

  @override
  String get showLibrariesFromAllServers =>
      'Zobrazit knihovny ze všech připojených serverů';

  @override
  String get enableFolderView => 'Povolit zobrazení složek';

  @override
  String get showFolderBrowsingOption => 'Zobrazit možnost procházení složek';

  @override
  String get libraryVisibility => 'Viditelnost knihovny';

  @override
  String get libraryVisibilityDescription =>
      'Přepnout viditelnost domovské stránky podle knihovny. Restartujte Moonfin, aby se změny projevily.';

  @override
  String get showInNavigation => 'Zobrazit v navigaci';

  @override
  String get showInLatestMedia => 'Zobrazit v nejnovějších médiích';

  @override
  String get sourceLibraries => 'Zdrojové knihovny';

  @override
  String get sourceCollections => 'Zdrojové sbírky';

  @override
  String get excludedGenres => 'Vyloučené žánry';

  @override
  String get selectAll => 'Vyberte Vše';

  @override
  String itemsSelected(int count) {
    return 'Vybráno $count';
  }

  @override
  String get mediaBar => 'Media Bar';

  @override
  String get mediaSources => 'Mediální zdroje';

  @override
  String get behavior => 'Chování';

  @override
  String get seconds => 'sekundy';

  @override
  String get localPreviews => 'Místní náhledy';

  @override
  String get localPreviewsDescription =>
      'Nakonfigurujte ukázky upoutávek, médií a zvuku.';

  @override
  String get mediaBarMode => 'Styl Media Bar';

  @override
  String get mediaBarModeDescription =>
      'Vyberte si mezi Moonfin, MakD nebo vypněte panel médií';

  @override
  String get mediaBarModeMoonfin => 'Měsíční ploutev';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Vypnuto';

  @override
  String get enableMediaBar => 'Povolit panel médií';

  @override
  String get showFeaturedContentSlideshow =>
      'Zobrazit prezentaci doporučeného obsahu na domovské stránce';

  @override
  String get contentType => 'Typ obsahu';

  @override
  String get moviesAndTvShows => 'Filmy a televizní pořady';

  @override
  String get moviesOnly => 'Pouze filmy';

  @override
  String get tvShowsOnly => 'Pouze televizní pořady';

  @override
  String get itemCount => 'Počet položek';

  @override
  String get noneSelected => 'Nebyl vybrán žádný';

  @override
  String get noneExcluded => 'Žádná vyloučena';

  @override
  String get autoAdvance => 'Auto Advance';

  @override
  String get autoAdvanceSlides => 'Automaticky přejít na další snímek';

  @override
  String get autoAdvanceInterval => 'Interval automatického posunu';

  @override
  String get trailerPreview => 'Náhled traileru';

  @override
  String get autoPlayTrailers =>
      'Automatické přehrávání upoutávek na liště médií po 3 sekundách';

  @override
  String get episodePreview => 'Náhled epizody';

  @override
  String get mediaPreview => 'Náhled médií';

  @override
  String get episodePreviewDescription =>
      'Zahrajte si 30sekundový vložený náhled na kartách zaměřených, položených nebo dlouze stisknutých';

  @override
  String get mediaPreviewDescription =>
      'Zahrajte si 30sekundový vložený náhled na zaostřených, položených nebo dlouze stisknutých kartách';

  @override
  String get previewAudio => 'Náhled zvuku';

  @override
  String get enablePreviewAudio => 'Povolit zvuk pro ukázky upoutávek a epizod';

  @override
  String get latestMedia => 'Nejnovější média';

  @override
  String get recentlyReleased => 'Nedávno vydáno';

  @override
  String get myMedia => 'Moje média';

  @override
  String get myMediaSmall => 'Moje média (malé)';

  @override
  String get continueWatching => 'Pokračovat ve sledování';

  @override
  String get resumeAudio => 'Obnovit zvuk';

  @override
  String get resumeBooks => 'Obnovit knihy';

  @override
  String get activeRecordings => 'Aktivní nahrávky';

  @override
  String get playlists => 'Playlisty';

  @override
  String get liveTV => 'Živá televize';

  @override
  String get homeSections => 'Domácí sekce';

  @override
  String get resetToDefaults => 'Obnovit výchozí nastavení';

  @override
  String get homeRowPosterSize => 'Velikost plakátu domácí řady';

  @override
  String get perRowImageTypeSelection => 'Výběr typu obrázku na řádek';

  @override
  String get configureImageTypeForEachRow =>
      'Nakonfigurujte typ obrázku pro každý povolený domovský řádek';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Sloučit Pokračovat ve sledování a Další';

  @override
  String get combineBothRows => 'Spojte oba řádky do jedné domovské sekce';

  @override
  String get perRowImageType => 'Typ obrázku na řádek';

  @override
  String get perRowSettings => 'Nastavení po řádcích';

  @override
  String get autoLogin => 'Automatické přihlášení';

  @override
  String get lastUser => 'Poslední uživatel';

  @override
  String get specificUser => 'Konkrétní uživatel';

  @override
  String get alwaysAuthenticate => 'Vždy ověřit';

  @override
  String get requirePasswordWithToken => 'Vyžadovat heslo i s uloženým tokenem';

  @override
  String get confirmExit => 'Potvrďte Konec';

  @override
  String get showConfirmationBeforeExiting => 'Před ukončením ukažte potvrzení';

  @override
  String get blockContentWithRatings =>
      'Blokovat obsah s následujícím hodnocením:';

  @override
  String get noContentRatingsFound =>
      'Na tomto serveru zatím nebyla nalezena žádná hodnocení obsahu.';

  @override
  String get couldNotLoadServerRatings =>
      'Hodnocení serveru se nepodařilo načíst. Zobrazují se pouze uložená hodnocení.';

  @override
  String get couldNotRefreshRatings =>
      'Nelze obnovit hodnocení ze serveru. Zobrazují se uložená hodnocení.';

  @override
  String get enablePinCode => 'Povolit PIN kód';

  @override
  String get requirePinToAccess => 'Vyžadovat PIN pro přístup k vašemu účtu';

  @override
  String get changePin => 'Změňte PIN';

  @override
  String get setNewPinCode => 'Nastavte nový PIN kód';

  @override
  String get removePin => 'Odstraňte PIN';

  @override
  String get removePinProtection => 'Odstraňte ochranu PIN kódem';

  @override
  String get screensaver => 'Spořič obrazovky';

  @override
  String get inAppScreensaver => 'Spořič obrazovky v aplikaci';

  @override
  String get enableBuiltInScreensaver => 'Povolit vestavěný spořič obrazovky';

  @override
  String get mode => 'Režim';

  @override
  String get libraryArt => 'Umění knihovny';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Hodiny';

  @override
  String get timeout => 'Časový limit';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Úroveň stmívání';

  @override
  String get maxAgeRating => 'Maximální věkové hodnocení';

  @override
  String get any => 'Žádný';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Vyžadovat věkové hodnocení';

  @override
  String get onlyShowRatedContent => 'Zobrazit pouze hodnocený obsah';

  @override
  String get showClock => 'Zobrazit hodiny';

  @override
  String get displayClockDuringScreensaver =>
      'Zobrazení hodin během spořiče obrazovky';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Kritici)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (publikum)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritický';

  @override
  String get metacriticUser => 'Metacritic (uživatel)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Hodnocení komunity';

  @override
  String get ratings => 'Hodnocení';

  @override
  String get additionalRatings => 'Další hodnocení';

  @override
  String get showMdbListAndTmdbRatings => 'Zobrazit hodnocení MDBList a TMDB';

  @override
  String get ratingLabels => 'Hodnotící štítky';

  @override
  String get showLabelsNextToIcons => 'Zobrazit štítky vedle ikon hodnocení';

  @override
  String get ratingBadges => 'Hodnotící odznaky';

  @override
  String get showDecorativeBadges =>
      'Zobrazit dekorativní odznaky za hodnocením';

  @override
  String get episodeRatings => 'Hodnocení epizod';

  @override
  String get showRatingsOnEpisodes => 'Zobrazit hodnocení jednotlivých epizod';

  @override
  String get ratingSources => 'Zdroje hodnocení';

  @override
  String get ratingSourcesDescription =>
      'Povolte a změňte pořadí zdrojů hodnocení zobrazovaných v aplikaci';

  @override
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Plugin detekován';

  @override
  String get pluginNotDetected => 'Plugin nebyl detekován';

  @override
  String get pluginDetectedDescription =>
      'Byl zjištěn plugin serveru. Synchronizace je povolena automaticky při prvním nalezení pluginu.';

  @override
  String get pluginNotDetectedDescription =>
      'Serverový plugin není aktuálně detekován. Místní nastavení stále používají své uložené hodnoty nebo vestavěné výchozí hodnoty.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVerze: $version';
  }

  @override
  String get availableServices => 'Dostupné služby';

  @override
  String get serverPluginSync => 'Server Plugin Sync';

  @override
  String get syncSettingsWithPlugin =>
      'Synchronizujte nastavení s pluginem serveru';

  @override
  String get whatSyncControls => 'Jaké ovládací prvky synchronizace';

  @override
  String get syncControlsDescription =>
      'Synchronizace řídí pouze to, zda jsou nastavení podporovaná pluginy přenesena na server a vytažena ze serveru. Výběr profilu a akce synchronizace profilu jsou v nastavení přizpůsobení, když je povolena synchronizace pluginu.';

  @override
  String get recentRequests => 'Nedávné požadavky';

  @override
  String get recentlyAdded => 'Nedávno přidané';

  @override
  String get trending => 'Trendy';

  @override
  String get popularMovies => 'Populární filmy';

  @override
  String get movieGenres => 'Filmové žánry';

  @override
  String get upcomingMovies => 'Připravované filmy';

  @override
  String get studios => 'Studia';

  @override
  String get popularSeries => 'Populární seriál';

  @override
  String get seriesGenres => 'Žánry seriálu';

  @override
  String get upcomingSeries => 'Nadcházející série';

  @override
  String get networks => 'sítě';

  @override
  String get resetRowsToDefaults => 'Resetovat řádky na výchozí hodnoty';

  @override
  String get enableSeerr => 'Povolit Seerr';

  @override
  String get showSeerrInNavigation =>
      'Zobrazit Seerr v navigaci (vyžaduje plugin serveru)';

  @override
  String get seerrUnavailable =>
      'Nedostupné, protože je zakázána podpora serverového pluginu Seerr.';

  @override
  String get nsfwFilter => 'Filtr NSFW';

  @override
  String get hideAdultContent => 'Skrýt ve výsledcích obsah pouze pro dospělé';

  @override
  String loggedInAs(String username) {
    return 'Přihlášen jako: $username';
  }

  @override
  String get discoverRows => 'Objevte řádky';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Přetažením změníte pořadí. Povolit nebo zakázat řádky. Povolená synchronizace pořadí řádků s pluginem Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Přetažením změníte pořadí. Povolit nebo zakázat řádky.';

  @override
  String get enabled => 'Povoleno';

  @override
  String get hidden => 'Skrytý';

  @override
  String get aboutTitle => 'O';

  @override
  String versionValue(String version) {
    return 'Verze $version';
  }

  @override
  String get openSourceLicenses => 'Open Source licence';

  @override
  String get sourceCode => 'Zdrojový kód';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Zkontrolujte aktualizace';

  @override
  String get checksLatestDesktopRelease =>
      'Kontroluje nejnovější desktopovou verzi pro tuto platformu';

  @override
  String get youAreUpToDate => 'Jste aktuální.';

  @override
  String get couldNotCheckForUpdates =>
      'Momentálně nelze zkontrolovat aktualizace.';

  @override
  String get noCompatibleUpdate =>
      'Pro tuto platformu nebyl nalezen žádný kompatibilní aktualizační balíček.';

  @override
  String get updateChecksNotSupported =>
      'Na této platformě nejsou podporovány kontroly aktualizací.';

  @override
  String get updateNotificationsDisabled =>
      'Upozornění na aktualizace jsou zakázána.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Před další kontrolou prosím počkejte.';

  @override
  String get latestUpdateAlreadyShown =>
      'Nejnovější aktualizace již byla zobrazena.';

  @override
  String get updateAvailable => 'Aktualizace k dispozici.';

  @override
  String updateAvailableVersion(String version) {
    return 'Dostupná aktualizace: v$version';
  }

  @override
  String get updateNotifications => 'Aktualizovat oznámení';

  @override
  String get showWhenUpdatesAvailable =>
      'Zobrazit, kdy jsou dostupné aktualizace';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version K dispozici';
  }

  @override
  String get readReleaseNotes => 'Přečtěte si poznámky k vydání';

  @override
  String get downloadingUpdate => 'Stahování aktualizace...';

  @override
  String get updateDownloadFailed =>
      'Stažení aktualizace se nezdařilo. Zkuste to prosím znovu.';

  @override
  String get openReleasesPage => 'Otevřete stránku vydání';

  @override
  String get navigation => 'Navigace';

  @override
  String get watchedIndicatorsBackdrops => 'Sledované ukazatele, kulisy';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Barva ostření, sledované indikátory, pozadí';

  @override
  String get navbarStyleToolbarAppearance =>
      'Styl navigační lišty, tlačítka na nástrojové liště, vzhled';

  @override
  String get reorderToggleHomeRows => 'Změnit pořadí a přepnout domovské řádky';

  @override
  String get featuredContentAppearance => 'Doporučený obsah, vzhled';

  @override
  String get posterSizeImageTypeFolderView =>
      'Velikost plakátu, typ obrázku, zobrazení složky';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB a zdroje hodnocení';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Jasný';

  @override
  String get browse => 'Prohlížet';

  @override
  String get noResults => 'Žádné výsledky';

  @override
  String get seerrAvailableStatus => 'K dispozici';

  @override
  String get seerrRequestedStatus => 'Vyžádáno';

  @override
  String itemsCount(int count) {
    return '$count Položky';
  }

  @override
  String get seerrSettings => 'Nastavení Seerr';

  @override
  String get requestMore => 'Vyžádejte si více';

  @override
  String get request => 'Žádost';

  @override
  String get cancelRequest => 'Zrušit požadavek';

  @override
  String get playInMoonfin => 'Hrajte v Moonfin';

  @override
  String requestedByName(String name) {
    return 'Požadováno $name';
  }

  @override
  String get approve => 'Schvalovat';

  @override
  String get declineAction => 'Pokles';

  @override
  String get similar => 'Podobný';

  @override
  String get recommendations => 'Doporučení';

  @override
  String cancelRequestForTitle(String title) {
    return 'Zrušit požadavek na \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Zrušit $count požadavky na \"$title\"?';
  }

  @override
  String get keep => 'Nechat';

  @override
  String get itemNotFoundInLibrary =>
      'Položka nebyla nalezena ve vaší knihovně Moonfin';

  @override
  String get errorSearchingLibrary => 'Chyba při hledání knihovny';

  @override
  String budgetAmount(String amount) {
    return 'Rozpočet: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Příjmy: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Žádost $type';
  }

  @override
  String get submitRequest => 'Odeslat žádost';

  @override
  String get allSeasons => 'Všechna roční období';

  @override
  String get advancedOptions => 'Pokročilé možnosti';

  @override
  String get noServiceServersConfigured =>
      'Nejsou nakonfigurovány žádné servisní servery';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Profil kvality';

  @override
  String get rootFolder => 'Kořenová složka';

  @override
  String get showMore => 'Zobrazit více';

  @override
  String get appearances => 'Vystoupení';

  @override
  String get crewSection => 'Posádka';

  @override
  String ageValue(int age) {
    return 'věk $age';
  }

  @override
  String get noRequests => 'Žádné žádosti';

  @override
  String get pendingStatus => 'Čeká na vyřízení';

  @override
  String get declinedStatus => 'Odmítnuto';

  @override
  String get partiallyAvailable => 'Částečně k dispozici';

  @override
  String get downloadingStatus => 'Stahování';

  @override
  String get approvedStatus => 'Schválený';

  @override
  String get notRequestedStatus => 'Nevyžadováno';

  @override
  String get blocklistedStatus => 'Blokováno';

  @override
  String get deletedStatus => 'Smazáno';

  @override
  String get tmdbScore => 'Skóre TMDB';

  @override
  String get releaseDateLabel => 'Datum vydání';

  @override
  String get firstAirDateLabel => 'Datum prvního vysílání';

  @override
  String get revenueLabel => 'Příjmy';

  @override
  String get runtimeLabel => 'Doba běhu';

  @override
  String get budgetLabel => 'Rozpočet';

  @override
  String get originalLanguageLabel => 'Původní jazyk';

  @override
  String get seasonsLabel => 'Roční období';

  @override
  String get episodesLabel => 'Epizody';

  @override
  String get access => 'Přístup';

  @override
  String get add => 'Přidat';

  @override
  String get address => 'Adresa';

  @override
  String get analytics => 'Analytics';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Obsah';

  @override
  String get copy => 'Kopie';

  @override
  String get create => 'Vytvořit';

  @override
  String get disable => 'Zakázat';

  @override
  String get done => 'Hotovo';

  @override
  String get edit => 'Upravit';

  @override
  String get encoding => 'Kódování';

  @override
  String get error => 'Chyba';

  @override
  String get forward => 'Vpřed';

  @override
  String get general => 'Generál';

  @override
  String get go => 'Jít';

  @override
  String get install => 'Instalovat';

  @override
  String get installed => 'Instalováno';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Jméno';

  @override
  String get networking => 'vytváření sítí';

  @override
  String get next => 'Další';

  @override
  String get path => 'Cesta';

  @override
  String get paused => 'Pozastaveno';

  @override
  String get permissions => 'Oprávnění';

  @override
  String get processing => 'Zpracování';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Poskytovatel';

  @override
  String get refresh => 'Obnovit';

  @override
  String get remote => 'Vzdálený';

  @override
  String get rename => 'Přejmenovat';

  @override
  String get revoke => 'Zrušit';

  @override
  String get role => 'Role';

  @override
  String get root => 'Vykořenit';

  @override
  String get run => 'Běh';

  @override
  String get search => 'Vyhledávání';

  @override
  String get select => 'Vybrat';

  @override
  String get send => 'Poslat';

  @override
  String get sessions => 'Relace';

  @override
  String get set => 'Soubor';

  @override
  String get status => 'Postavení';

  @override
  String get stop => 'Zastávka';

  @override
  String get streaming => 'Streamování';

  @override
  String get time => 'Čas';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Odinstalovat';

  @override
  String get up => 'Nahoru';

  @override
  String get update => 'Aktualizovat';

  @override
  String get upload => 'Nahrát';

  @override
  String get unmute => 'Zapnout zvuk';

  @override
  String get mute => 'Ztlumit';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Dashboard';

  @override
  String get adminDrawerAnalytics => 'Analytics';

  @override
  String get adminDrawerSettings => 'Nastavení';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Uživatelé';

  @override
  String get adminDrawerLibraries => 'Knihovny';

  @override
  String get adminDrawerTranscoding => 'Překódování';

  @override
  String get adminDrawerResume => 'Resumé';

  @override
  String get adminDrawerStreaming => 'Streamování';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Zařízení';

  @override
  String get adminDrawerActivity => 'Aktivita';

  @override
  String get adminDrawerNetworking => 'vytváření sítí';

  @override
  String get adminDrawerApiKeys => 'Klíče API';

  @override
  String get adminDrawerBackups => 'Zálohy';

  @override
  String get adminDrawerLogs => 'Protokoly';

  @override
  String get adminDrawerScheduledTasks => 'Naplánované úkoly';

  @override
  String get adminDrawerPlugins => 'Pluginy';

  @override
  String get adminDrawerRepositories => 'Úložiště';

  @override
  String get adminDrawerLiveTv => 'Živá televize';

  @override
  String get adminExitTooltip => 'Ukončete Správce';

  @override
  String get adminDashboardLoadFailed => 'Načtení řídicího panelu se nezdařilo';

  @override
  String get adminMediaOverview => 'Přehled médií';

  @override
  String get adminMediaTotalsError => 'Nelze načíst součty médií serveru.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Rychlý přehled o tom, kolik obsahu je na tomto serveru.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Dostupné aktualizace pluginů: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Pluginy vyžadující restart: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Neúspěšné naplánované úlohy: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Poslední záznamy o varování/chybě: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribuce médií';

  @override
  String get analyticsVideoCodecs => 'Video kodeky';

  @override
  String get analyticsAudioCodecs => 'Audio kodeky';

  @override
  String get analyticsContainers => 'Kontejnery';

  @override
  String get analyticsTopGenres => 'Nejlepší žánry';

  @override
  String get analyticsReleaseYears => 'Roky vydání';

  @override
  String get analyticsContentRatings => 'Hodnocení obsahu';

  @override
  String get analyticsRuntimeBuckets => 'Runtime buckety';

  @override
  String get analyticsFileFormats => 'Formáty souborů';

  @override
  String get analyticsNoData => 'Nejsou k dispozici žádná data.';

  @override
  String get adminServerInfo => 'Informace o serveru';

  @override
  String get adminRestartPending => 'Restartovat čeká na vyřízení';

  @override
  String get adminServerPaths => 'Serverové cesty';

  @override
  String get adminServerActions => 'Akce serveru';

  @override
  String get adminRestartServer => 'Restartujte server';

  @override
  String get adminShutdownServer => 'Vypnutí serveru';

  @override
  String get adminScanLibraries => 'Skenování knihoven';

  @override
  String get adminLibraryScanStarted => 'Bylo zahájeno skenování knihovny';

  @override
  String errorGeneric(String error) {
    return 'Chyba: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Probíhá restart serveru';

  @override
  String get adminServerRebootMessage =>
      'Probíhá restart serveru, restartujte prosím Moonfin';

  @override
  String get adminActiveSessions => 'Aktivní relace';

  @override
  String get adminSessionsLoadFailed => 'Načtení relací se nezdařilo';

  @override
  String get adminNoActiveSessions => 'Žádné aktivní relace';

  @override
  String get adminRecentActivity => 'Nedávná aktivita';

  @override
  String get adminNoRecentActivity => 'Žádná nedávná aktivita';

  @override
  String adminCommandFailed(String error) {
    return 'Příkaz se nezdařil: $error';
  }

  @override
  String get adminSendMessage => 'Odeslat zprávu';

  @override
  String get adminMessageTextHint => 'Text zprávy';

  @override
  String get adminSetVolume => 'Nastavte hlasitost';

  @override
  String get sessionPrev => 'Předchozí';

  @override
  String get sessionRewind => 'Přetočit zpět';

  @override
  String get sessionForward => 'Vpřed';

  @override
  String get sessionNext => 'Další';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Právě se přehrává';

  @override
  String get volume => 'Objem';

  @override
  String get actions => 'Akce';

  @override
  String get videoCodec => 'Video kodek';

  @override
  String get audioCodec => 'Audio kodek';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Dokončení';

  @override
  String get direct => 'Řídit';

  @override
  String get adminDisconnect => 'Odpojit';

  @override
  String get adminClearDates => 'Vymazat data';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Nepodařilo se načíst protokol aktivit: $error';
  }

  @override
  String get adminNoActivityEntries => 'Žádné záznamy o aktivitě';

  @override
  String get adminEditDeviceName => 'Upravit název zařízení';

  @override
  String get adminCustomName => 'Vlastní název';

  @override
  String get adminDeviceNameUpdated => 'Název zařízení byl aktualizován';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Aktualizace zařízení se nezdařila: $error';
  }

  @override
  String get adminDeleteDevice => 'Smazat zařízení';

  @override
  String get adminDeviceDeleted => 'Zařízení bylo smazáno';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Smazání zařízení se nezdařilo: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Zařízení se nepodařilo načíst';

  @override
  String get adminSearchDevices => 'Vyhledejte zařízení';

  @override
  String get adminThisDevice => 'Toto zařízení';

  @override
  String get adminEditName => 'Upravit jméno';

  @override
  String get adminLibrariesLoadFailed => 'Načtení knihoven se nezdařilo';

  @override
  String get adminNoLibraries => 'Nejsou nakonfigurovány žádné knihovny';

  @override
  String get adminScanAllLibraries => 'Skenovat všechny knihovny';

  @override
  String get adminAddLibrary => 'Přidat knihovnu';

  @override
  String adminScanFailed(String error) {
    return 'Skenování se nezdařilo: $error';
  }

  @override
  String get adminRenameLibrary => 'Přejmenovat knihovnu';

  @override
  String get adminNewName => 'Nové jméno';

  @override
  String adminLibraryRenamed(String name) {
    return 'Knihovna přejmenována na \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Nepodařilo se přejmenovat: $error';
  }

  @override
  String get adminDeleteLibrary => 'Smazat knihovnu';

  @override
  String adminLibraryDeleted(String name) {
    return 'Knihovna \"$name\" byla smazána';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Smazání knihovny se nezdařilo: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Nepodařilo se přidat cestu: $error';
  }

  @override
  String get adminRemovePath => 'Odebrat cestu';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Odebrat \"$path\" z této knihovny?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Nepodařilo se odstranit cestu: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Možnosti knihovny uloženy';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Nepodařilo se uložit možnosti: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Načtení knihovny se nezdařilo';

  @override
  String get adminNoMediaPaths => 'Nejsou nakonfigurovány žádné cesty médií';

  @override
  String get adminAddPath => 'Přidat cestu';

  @override
  String get adminBrowseFilesystem => 'Procházet souborový systém serveru:';

  @override
  String get adminSaveOptions => 'Možnosti uložení';

  @override
  String get adminPreferredMetadataLanguage => 'Preferovaný jazyk metadat';

  @override
  String get adminMetadataLanguageHint => 'např. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Kód země metadat';

  @override
  String get adminMetadataCountryHint => 'např. USA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Název knihovny je povinný';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Nepodařilo se vytvořit knihovnu: $error';
  }

  @override
  String get adminLibraryName => 'Název knihovny';

  @override
  String get adminSelectedPaths => 'Vybrané cesty:';

  @override
  String get adminNoPathsAdded =>
      'Nebyly přidány žádné cesty (lze přidat později)';

  @override
  String get adminCreateLibrary => 'Vytvořit knihovnu';

  @override
  String get paths => 'Cesty:';

  @override
  String get adminDisableUser => 'Zakázat uživatele';

  @override
  String get adminEnableUser => 'Povolit uživatele';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Zakázat $name? Nebudou se moci přihlásit.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Povolit $name? Budou se moci znovu přihlásit.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Uživatel \"$name\" zakázán';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Uživatel \"$name\" povolen';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Aktualizace zásad pro uživatele se nezdařila: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Uživatele se nepodařilo načíst';

  @override
  String get adminSearchUsers => 'Hledat uživatele';

  @override
  String get adminEditUser => 'Upravit uživatele';

  @override
  String get adminAddUser => 'Přidat uživatele';

  @override
  String adminUserCreateFailed(String error) {
    return 'Nepodařilo se vytvořit uživatele: $error';
  }

  @override
  String get adminCreateUser => 'Vytvořit uživatele';

  @override
  String get adminPasswordOptional => 'Heslo (volitelné)';

  @override
  String get adminUsernameRequired => 'Uživatelské jméno nemůže být prázdné';

  @override
  String get adminNoProfileChanges => 'Žádné změny profilu k uložení';

  @override
  String get adminProfileSaved => 'Profil uložen';

  @override
  String adminSaveFailed(String error) {
    return 'Nepodařilo se uložit: $error';
  }

  @override
  String get adminPermissionsSaved => 'Oprávnění uložena';

  @override
  String get adminPasswordsMismatch => 'Hesla se neshodují';

  @override
  String adminFailed(String error) {
    return 'Selhalo: $error';
  }

  @override
  String get adminUserLoadFailed => 'Uživatele se nepodařilo načíst';

  @override
  String get adminBackToUsers => 'Zpět na Uživatelé';

  @override
  String get adminSaveProfile => 'Uložit profil';

  @override
  String get adminDeleteUser => 'Smazat uživatele';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administrátoři mají úplný přístup k serveru. Udělujte opatrně.';

  @override
  String get administrator => 'Správce';

  @override
  String get adminHiddenUser => 'Skrytý uživatel';

  @override
  String get adminAllowMediaPlayback => 'Povolit přehrávání médií';

  @override
  String get adminAllowAudioTranscoding => 'Povolit překódování zvuku';

  @override
  String get adminAllowVideoTranscoding => 'Povolit překódování videa';

  @override
  String get adminAllowRemuxing => 'Povolit remuxování';

  @override
  String get adminForceRemoteTranscoding =>
      'Vynutit překódování vzdáleného zdroje';

  @override
  String get adminAllowContentDeletion => 'Povolit mazání obsahu';

  @override
  String get adminAllowContentDownloading => 'Povolit stahování obsahu';

  @override
  String get adminAllowPublicSharing => 'Povolit veřejné sdílení';

  @override
  String get adminAllowRemoteControl =>
      'Povolit vzdálené ovládání ostatních uživatelů';

  @override
  String get adminAllowSharedDeviceControl =>
      'Povolit ovládání sdíleného zařízení';

  @override
  String get adminAllowRemoteAccess => 'Povolit vzdálený přístup';

  @override
  String get adminRemoteBitrateLimit =>
      'Limit datového toku vzdáleného klienta (b/s)';

  @override
  String get adminLeaveEmptyNoLimit => 'Nechte prázdné bez omezení';

  @override
  String get adminMaxActiveSessions => 'Maximální počet aktivních relací';

  @override
  String get adminAllowLiveTvAccess => 'Povolit přístup k živé televizi';

  @override
  String get adminAllowLiveTvManagement =>
      'Povolit správu živého televizního vysílání';

  @override
  String get adminAllowCollectionManagement => 'Povolit správu sbírky';

  @override
  String get adminAllowSubtitleManagement => 'Povolit správu titulků';

  @override
  String get adminAllowLyricManagement => 'Povolit správu textů';

  @override
  String get adminSavePermissions => 'Uložit oprávnění';

  @override
  String get adminEnableAllLibraryAccess => 'Povolit přístup do všech knihoven';

  @override
  String get adminSaveAccess => 'Uložit přístup';

  @override
  String get adminChangePassword => 'Změnit heslo';

  @override
  String get adminNewPassword => 'Nové heslo';

  @override
  String get adminConfirmPassword => 'Potvrďte heslo';

  @override
  String get adminSetPassword => 'Nastavit heslo';

  @override
  String get adminResetPassword => 'Obnovit heslo';

  @override
  String get adminPasswordReset => 'Obnovení hesla';

  @override
  String get adminPasswordUpdated => 'Heslo aktualizováno';

  @override
  String get adminUserSettings => 'Uživatelská nastavení';

  @override
  String get adminLibraryAccess => 'Přístup do knihovny';

  @override
  String get adminDeviceAndChannelAccess => 'Přístup k zařízení a kanálu';

  @override
  String get adminEnableAllDevices => 'Povolit přístup ke všem zařízením';

  @override
  String get adminEnableAllChannels => 'Povolit přístup ke všem kanálům';

  @override
  String get adminResetPasswordWarning =>
      'Tím se heslo odstraní. Uživatel se bude moci přihlásit bez hesla.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Server vrátil HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Opravdu chcete smazat $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Uživatel \"$name\" byl smazán';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Smazání uživatele se nezdařilo: $error';
  }

  @override
  String get adminCreateApiKey => 'Vytvořit klíč API';

  @override
  String get adminAppName => 'Název aplikace';

  @override
  String get adminApiKeyCreated => 'Klíč API vytvořen';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Klíč byl úspěšně vytvořen. Server nevrátil token. Zkontrolujte klíče API serveru.';

  @override
  String get adminKeyCopied => 'Klíč zkopírován do schránky';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Nepodařilo se vytvořit klíč: $error';
  }

  @override
  String get adminKeyTokenMissing => 'V odpovědi serveru chybí klíčový token';

  @override
  String get adminRevokeApiKey => 'Zrušit klíč API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Zrušit klíč pro $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Klíč API byl zrušen';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Nepodařilo se odvolat klíč: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Klíče API se nepodařilo načíst';

  @override
  String get adminApiKeysTitle => 'Klíče API';

  @override
  String get adminCreateKey => 'Vytvořit klíč';

  @override
  String get adminNoApiKeys => 'Nebyly nalezeny žádné klíče API';

  @override
  String get adminUnknownApp => 'Neznámá aplikace';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nVytvořeno: $created';
  }

  @override
  String get adminCreatingBackup => 'Vytváření zálohy...';

  @override
  String get adminBackupCreated => 'Záloha byla úspěšně vytvořena';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Vytvoření zálohy se nezdařilo: $error';
  }

  @override
  String get adminBackupPathMissing => 'V odpovědi serveru chybí záložní cesta';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Nepodařilo se načíst manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Potvrďte obnovení';

  @override
  String get adminRestoringBackup => 'Obnovování zálohy...';

  @override
  String adminRestoreFailed(String error) {
    return 'Obnovení zálohy se nezdařilo: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Nepodařilo se načíst zálohy';

  @override
  String get adminCreateBackup => 'Vytvořit zálohu';

  @override
  String get adminNoBackups => 'Nebyly nalezeny žádné zálohy';

  @override
  String get adminViewDetails => 'Zobrazit podrobnosti';

  @override
  String get restore => 'Obnovit';

  @override
  String get adminLogsLoadFailed => 'Načtení protokolů serveru se nezdařilo';

  @override
  String get adminNoLogFiles => 'Nebyly nalezeny žádné soubory protokolu';

  @override
  String get adminLogCopied => 'Protokol zkopírován do schránky';

  @override
  String get adminSaveLogFile => 'Uložit soubor protokolu';

  @override
  String adminSavedTo(String path) {
    return 'Uloženo do $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Nepodařilo se uložit soubor: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Nepodařilo se načíst $fileName';
  }

  @override
  String get adminSearchInLog => 'Hledat v logu';

  @override
  String get adminNoMatchingLines => 'Žádné odpovídající řádky';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Nepodařilo se načíst úkoly: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nebyly nalezeny žádné naplánované úkoly';

  @override
  String get adminNoTasksMatchFilter =>
      'Žádné úkoly neodpovídají aktuálnímu filtru';

  @override
  String adminTaskStartFailed(String error) {
    return 'Spuštění úlohy se nezdařilo: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Úlohu se nepodařilo zastavit: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Nepodařilo se načíst úlohu: $error';
  }

  @override
  String get adminRunNow => 'Spustit hned';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Selhalo odstranění spouštěče: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Nepodařilo se přidat spouštěč: $error';
  }

  @override
  String get adminLastExecution => 'Poslední exekuce';

  @override
  String get adminTriggers => 'Spouštěče';

  @override
  String get adminAddTrigger => 'Přidat spouštěč';

  @override
  String get adminNoTriggers => 'Nejsou nakonfigurovány žádné spouštěče';

  @override
  String get adminTriggerType => 'Typ spouště';

  @override
  String get adminTimeLimit => 'Časový limit (volitelné)';

  @override
  String get adminNoLimit => 'Bez omezení';

  @override
  String adminHours(String hours) {
    return '$hours hodin';
  }

  @override
  String get adminDayOfWeek => 'Den v týdnu';

  @override
  String get adminSearchPlugins => 'Hledat pluginy...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Selhalo přepnutí pluginu: $error';
  }

  @override
  String get adminUninstallPlugin => 'Odinstalujte plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Opravdu chcete odinstalovat \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Selhalo odinstalování pluginu: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Nepodařilo se nainstalovat balíček: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Aktualizace se nezdařila: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Nepodařilo se načíst pluginy: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Vašemu vyhledávání neodpovídají žádné pluginy';

  @override
  String get adminNoPluginsInstalled => 'Nejsou nainstalovány žádné pluginy';

  @override
  String adminInstallUpdate(String version) {
    return 'Nainstalovat aktualizaci (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Nepodařilo se načíst katalog: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Vašemu hledání neodpovídají žádné balíčky';

  @override
  String get adminNoPackagesAvailable => 'Nejsou k dispozici žádné balíčky';

  @override
  String get adminExperimentalIntegration => 'Experimentální integrace';

  @override
  String get adminExperimentalWarning =>
      'Integrace nastavení pluginu je stále experimentální. Některé stránky nastavení se nemusí vykreslit správně.';

  @override
  String get continueAction => 'Pokračovat';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" bude odstraněn po restartu serveru';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Odinstalace se nezdařila: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Aktualizace \"$name\" na v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Nastavení nelze otevřít: chybí ověřovací token.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Selhalo načtení pluginu: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin nenalezen';

  @override
  String adminPluginVersion(String version) {
    return 'Verze $version';
  }

  @override
  String get adminEnablePlugin => 'Povolit plugin';

  @override
  String get adminPluginSettingsPage => 'Stránka nastavení pluginu';

  @override
  String get adminRevisionHistory => 'Historie revizí';

  @override
  String get adminNoChangelog => 'Není k dispozici žádný seznam změn.';

  @override
  String get adminRemoveRepository => 'Odebrat úložiště';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Opravdu chcete odstranit \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Nepodařilo se uložit úložiště: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Nepodařilo se načíst úložiště: $error';
  }

  @override
  String get adminRepositoryNameHint => 'např. Jellyfin Stabilní';

  @override
  String get adminRepositoryUrl => 'Adresa URL úložiště';

  @override
  String get adminAddEntry => 'Přidat záznam';

  @override
  String get adminInvalidUrl => 'Neplatná adresa URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Nelze načíst nastavení pluginu: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Nelze otevřít $uri';
  }

  @override
  String get adminOpenInBrowser => 'Otevřít v prohlížeči';

  @override
  String get adminOpenExternally => 'Otevřít externě';

  @override
  String get adminGeneralSettings => 'Obecná nastavení';

  @override
  String get adminServerName => 'Název serveru';

  @override
  String get adminPreferredMetadataCountry => 'Preferovaná země metadat';

  @override
  String get adminCachePath => 'Cesta keš';

  @override
  String get adminMetadataPath => 'Cesta metadat';

  @override
  String get adminLibraryScanConcurrency => 'Souběžnost skenování knihovny';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limit paralelního kódování obrazu';

  @override
  String get adminSlowResponseThreshold => 'Práh pomalé odezvy (ms)';

  @override
  String get adminBrandingSaved => 'Nastavení značky byla uložena';

  @override
  String get adminBrandingLoadFailed =>
      'Nastavení brandingu se nepodařilo načíst';

  @override
  String get adminLoginDisclaimer => 'Zřeknutí se odpovědnosti za přihlášení';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML zobrazené pod přihlašovacím formulářem';

  @override
  String get adminCustomCss => 'Vlastní CSS';

  @override
  String get adminCustomCssHint => 'Vlastní CSS aplikované na webové rozhraní';

  @override
  String get adminEnableSplashScreen => 'Povolit úvodní obrazovku';

  @override
  String get adminStreamingSaved => 'Nastavení streamování bylo uloženo';

  @override
  String get adminStreamingLoadFailed =>
      'Nastavení streamování se nepodařilo načíst';

  @override
  String get adminStreamingDescription =>
      'Nastavte globální limity datového toku pro vzdálená připojení.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limit datového toku vzdáleného klienta (Mb/s)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Ponechte prázdné nebo 0 pro neomezené';

  @override
  String get adminPlaybackSaved => 'Nastavení přehrávání uloženo';

  @override
  String get adminPlaybackLoadFailed =>
      'Nepodařilo se načíst nastavení přehrávání';

  @override
  String get adminPlaybackTranscoding => 'Přehrávání / Překódování';

  @override
  String get adminHardwareAcceleration => 'Hardwarová akcelerace';

  @override
  String get adminVaapiDevice => 'zařízení VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Povolit hardwarové kódování';

  @override
  String get adminEnableHardwareDecoding =>
      'Povolit hardwarové dekódování pro:';

  @override
  String get adminEncodingThreads => 'Kódování vláken';

  @override
  String get adminAutomatic => '0 = automaticky';

  @override
  String get adminTranscodingTempPath => 'Překódovací temp cesta';

  @override
  String get adminEnableFallbackFont => 'Povolit záložní písmo';

  @override
  String get adminFallbackFontPath => 'Cesta záložního písma';

  @override
  String get adminAllowSegmentDeletion => 'Povolit smazání segmentu';

  @override
  String get adminSegmentKeepSeconds => 'Uchování segmentu (v sekundách)';

  @override
  String get adminThrottleBuffering => 'Vyrovnávací paměť plynu';

  @override
  String get adminTrickplaySaved => 'Nastavení trikové hry uloženo';

  @override
  String get adminTrickplayLoadFailed =>
      'Nepodařilo se načíst nastavení trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Povolit hardwarovou akceleraci';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Povolit pouze extrakci klíčového snímku';

  @override
  String get adminKeyFrameSubtitle => 'Rychlejší, ale nižší přesnost';

  @override
  String get adminScanBehavior => 'Chování skenování';

  @override
  String get adminProcessPriority => 'Priorita procesu';

  @override
  String get adminImageSettings => 'Nastavení obrazu';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Jak často snímat snímky';

  @override
  String get adminWidthResolutions => 'Rozlišení šířky';

  @override
  String get adminTileWidth => 'Šířka dlaždice';

  @override
  String get adminTileHeight => 'Výška dlaždice';

  @override
  String get adminQualitySubtitle =>
      'Nižší hodnoty = lepší kvalita, větší soubory';

  @override
  String get adminProcessThreads => 'Procesní vlákna';

  @override
  String get adminResumeSaved => 'Obnovit uložená nastavení';

  @override
  String get adminResumeLoadFailed => 'Nepodařilo se načíst nastavení obnovení';

  @override
  String get adminResumeDescription =>
      'Nakonfigurujte, kdy má být obsah označen jako částečně přehraný nebo plně přehraný.';

  @override
  String get adminMinResumePercentage => 'Minimální procento obnovení';

  @override
  String get adminMinResumeSubtitle =>
      'Obsah musí být přehrán přes toto procento, aby se uložil postup';

  @override
  String get adminMaxResumePercentage => 'Maximální procento obnovení';

  @override
  String get adminMaxResumeSubtitle =>
      'Po tomto procentu se obsah považuje za plně přehraný';

  @override
  String get adminMinResumeDuration => 'Minimální doba obnovení (sekundy)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Položky kratší než toto nelze obnovit';

  @override
  String get adminMinAudiobookResume =>
      'Minimální procento obnovení audioknihy';

  @override
  String get adminMaxAudiobookResume =>
      'Maximální procento obnovení audioknihy';

  @override
  String get adminNetworkingSaved =>
      'Nastavení sítě uloženo. Může být vyžadován restart serveru.';

  @override
  String get adminNetworkingLoadFailed => 'Nepodařilo se načíst nastavení sítě';

  @override
  String get adminNetworkingWarning =>
      'Změny nastavení sítě mohou vyžadovat restart serveru.';

  @override
  String get adminEnableRemoteAccess => 'Povolit vzdálený přístup';

  @override
  String get ports => 'Porty';

  @override
  String get adminHttpPort => 'HTTP port';

  @override
  String get adminHttpsPort => 'HTTPS port';

  @override
  String get adminPublicHttpsPort => 'Veřejný port HTTPS';

  @override
  String get adminBaseUrl => 'Základní URL';

  @override
  String get adminBaseUrlHint => 'např. /ploutev';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Povolit HTTPS';

  @override
  String get adminLocalNetwork => 'Místní síť';

  @override
  String get adminLocalNetworkAddresses => 'Lokální síťové adresy';

  @override
  String get adminKnownProxies => 'Známí proxy';

  @override
  String get adminRemoteIpFilter => 'Vzdálený IP filtr';

  @override
  String get adminRemoteIpFilterEntries => 'Vzdálený IP filtr';

  @override
  String get adminCertificatePath => 'Cesta k certifikátu';

  @override
  String get whitelist => 'Seznam povolených';

  @override
  String get blacklist => 'Černá listina';

  @override
  String get notSet => 'Není nastaveno';

  @override
  String get adminMetadataSaved => 'Metadata uložena';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Nepodařilo se načíst metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Nepodařilo se uložit metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Obnovit metadata';

  @override
  String get recursive => 'Rekurzivní';

  @override
  String get adminReplaceAllMetadata => 'Nahradit všechna metadata';

  @override
  String get adminReplaceAllImages => 'Nahradit všechny obrázky';

  @override
  String get adminMetadataRefreshRequested =>
      'Bylo požadováno obnovení metadat';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Obnovení metadat se nezdařilo: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Vyhledejte vzdálenou osobu';

  @override
  String get adminNoRemoteMatches => 'Nebyly nalezeny žádné vzdálené shody';

  @override
  String get adminRemoteResults => 'Vzdálené výsledky';

  @override
  String get adminRemoteMetadataApplied => 'Byla použita vzdálená metadata';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Vzdálené vyhledávání se nezdařilo: $error';
  }

  @override
  String get adminUpdateContentType => 'Aktualizujte typ obsahu';

  @override
  String get adminContentType => 'Typ obsahu';

  @override
  String get adminContentTypeUpdated => 'Typ obsahu byl aktualizován';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Nepodařilo se aktualizovat typ obsahu: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Nepodařilo se načíst editor metadat';

  @override
  String get adminNoPeopleEntries => 'Žádné záznamy lidí';

  @override
  String get adminNoExternalIds => 'Nejsou k dispozici žádná externí ID';

  @override
  String adminImageUpdated(String imageType) {
    return 'Obrázek $imageType byl aktualizován';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Nepodařilo se stáhnout obrázek: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nepodporovaný formát obrázku';

  @override
  String get adminImageReadFailed => 'Vybraný obrázek se nepodařilo přečíst';

  @override
  String adminImageUploaded(String imageType) {
    return 'Obrázek $imageType nahrán';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Nepodařilo se nahrát obrázek: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Smazat obrázek $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Obrázek $imageType byl smazán';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Nepodařilo se smazat obrázek: $error';
  }

  @override
  String get adminAllProviders => 'Všichni poskytovatelé';

  @override
  String get adminNoRemoteImages => 'Nebyly nalezeny žádné vzdálené obrázky';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Zjištění tuneru se nezdařilo: $error';
  }

  @override
  String get adminAddTuner => 'Přidat tuner';

  @override
  String get adminTunerType => 'Typ tuneru';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, jiné';

  @override
  String get adminUrlPath => 'URL / cesta';

  @override
  String get adminNameOptional => 'Jméno (volitelné)';

  @override
  String get adminTunerAdded => 'Tuner dodal';

  @override
  String adminTunerAddFailed(String error) {
    return 'Nepodařilo se přidat tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Přidat poskytovatele průvodce';

  @override
  String get adminProviderType => 'Typ poskytovatele';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect nebo XMLTV';

  @override
  String get adminUsernameOptional => 'uživatelské jméno (volitelné)';

  @override
  String get adminRefreshInterval => 'Interval obnovování (hodiny)';

  @override
  String get adminProviderAdded => 'Poskytovatel přidán';

  @override
  String adminProviderAddFailed(String error) {
    return 'Nepodařilo se přidat poskytovatele: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Nepodařilo se odebrat tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Požadováno resetování tuneru';

  @override
  String adminTunerResetFailed(String error) {
    return 'Resetování tuneru se nezdařilo: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Nepodařilo se odebrat poskytovatele: $error';
  }

  @override
  String get adminRecordingSettings => 'Nastavení nahrávání';

  @override
  String get adminPrePadding => 'Předvyplnění (minuty)';

  @override
  String get adminPostPadding => 'Po odsazení (minuty)';

  @override
  String get adminRecordingPath => 'Cesta záznamu';

  @override
  String get adminSeriesRecordingPath => 'Cesta záznamu série';

  @override
  String get adminRecordingSettingsSaved => 'Nastavení nahrávání uloženo';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Nepodařilo se uložit nastavení: $error';
  }

  @override
  String get adminSetChannelMappings => 'Nastavte mapování kanálů';

  @override
  String get adminMappingJson => 'Mapování JSON';

  @override
  String get adminMappingJsonHint => 'Příklad: mapování dat JSON';

  @override
  String get adminChannelMappingsUpdated =>
      'Mapování kanálů bylo aktualizováno';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Aktualizace mapování se nezdařila: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Nepodařilo se načíst administraci živého televizního vysílání';

  @override
  String get adminTunerDevices => 'Tunerová zařízení';

  @override
  String get adminNoTunerHosts =>
      'Nejsou nakonfigurováni žádní hostitelé tuneru';

  @override
  String get adminGuideProviders => 'Poskytovatelé průvodců';

  @override
  String get adminAddProvider => 'Přidat poskytovatele';

  @override
  String get adminNoListingProviders =>
      'Nejsou nakonfigurováni žádní poskytovatelé záznamů';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Cesta záznamu: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Cesta k sérii: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Předvyplnění: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Post-padding: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Tuner Discovery';

  @override
  String get adminChannelMappings => 'Mapování kanálů';

  @override
  String get adminNoDiscoveredTuners => 'Zatím žádné objevené tunery';

  @override
  String get adminSettingsSaved => 'Nastavení uloženo';

  @override
  String get adminBackupsNotAvailable =>
      'V tomto sestavení serveru nejsou k dispozici zálohy.';

  @override
  String get adminRestoreWarning1 =>
      'Obnovení nahradí VŠECHNA aktuální data serveru daty zálohy.';

  @override
  String get adminRestoreWarning2 =>
      'Aktuální nastavení serveru, uživatelé a data knihovny budou přepsána.';

  @override
  String get adminRestoreWarning3 => 'Server se po obnovení restartuje.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Obnovit zálohu $name nyní?';
  }

  @override
  String get adminRestoreRequested =>
      'Požadováno obnovení. Restartování serveru může tuto relaci přerušit.';

  @override
  String get adminBackupsTitle => 'Zálohy';

  @override
  String get adminUnknownDate => 'Neznámé datum';

  @override
  String get adminUnnamedBackup => 'Bezejmenná záloha';

  @override
  String get adminLiveTvNotAvailable =>
      'Správa živého televizního vysílání není na tomto serveru k dispozici.';

  @override
  String get adminLiveTvTitle => 'Správa živé televize';

  @override
  String get adminApply => 'Použít';

  @override
  String get adminNotSet => 'Není nastaveno';

  @override
  String get adminReset => 'Resetovat';

  @override
  String get adminLogsTitle => 'Protokoly serveru';

  @override
  String get adminLogsNewestFirst => 'Nejnovější první';

  @override
  String get adminLogsOldestFirst => 'Nejstarší první';

  @override
  String get adminLogsJustNow => 'Právě teď';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'Před ${minutes}m';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'Před $hours h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'Před ${days}d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Nepodařilo se načíst $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count odpovídá';
  }

  @override
  String get adminLogViewerNoMatches => 'Žádné odpovídající řádky';

  @override
  String get adminMetadataEditorTitle => 'Editor metadat';

  @override
  String get adminMetadataRemote => 'Vzdálený';

  @override
  String get adminMetadataType => 'Typ';

  @override
  String get adminMetadataDetails => 'Podrobnosti';

  @override
  String get adminMetadataExternalIds => 'Externí ID';

  @override
  String get adminMetadataImages => 'Obrázky';

  @override
  String get adminMetadataFieldTitle => 'Titul';

  @override
  String get adminMetadataFieldSortTitle => 'Seřadit název';

  @override
  String get adminMetadataFieldOriginalTitle => 'Původní název';

  @override
  String get adminMetadataFieldPremiereDate => 'Datum premiéry (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Datum ukončení (RRRR-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Rok výroby';

  @override
  String get adminMetadataFieldOfficialRating => 'Oficiální hodnocení';

  @override
  String get adminMetadataFieldCommunityRating => 'Hodnocení komunity';

  @override
  String get adminMetadataFieldCriticRating => 'Kritické hodnocení';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Přehled';

  @override
  String get adminMetadataGenres => 'Žánry';

  @override
  String get adminMetadataTags => 'Tagy';

  @override
  String get adminMetadataStudios => 'Studia';

  @override
  String get adminMetadataPeople => 'Lidé';

  @override
  String get adminMetadataAddGenre => 'Přidat žánr';

  @override
  String get adminMetadataAddTag => 'Přidat značku';

  @override
  String get adminMetadataAddStudio => 'Přidat studio';

  @override
  String get adminMetadataAddPerson => 'Přidat osobu';

  @override
  String get adminMetadataEditPerson => 'Upravit osobu';

  @override
  String get adminMetadataRole => 'Role';

  @override
  String get adminMetadataImagePrimary => 'Primární';

  @override
  String get adminMetadataImageBackdrop => 'Pozadí';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Prapor';

  @override
  String get adminMetadataImageThumb => 'Palec';

  @override
  String get adminMetadataRecursive => 'Rekurzivní';

  @override
  String get adminMetadataProvider => 'Poskytovatel';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Obrázek $imageType byl aktualizován';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Obrázek $imageType nahrán';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Obrázek $imageType byl smazán';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Nepodařilo se stáhnout obrázek: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Vybraný obrázek se nepodařilo přečíst';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Nepodařilo se nahrát obrázek: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Smazat obrázek $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Tím se odstraní aktuální obrázek z položky.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Nepodařilo se smazat obrázek: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Vyberte obrázek $imageType';
  }

  @override
  String get adminMetadataUpload => 'Nahrát';

  @override
  String get adminMetadataUpdate => 'Aktualizovat';

  @override
  String get adminMetadataRemoteImage => 'Vzdálený obraz';

  @override
  String get adminPluginsInstalled => 'Instalováno';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktivní';

  @override
  String get adminPluginsRestart => 'Restartujte';

  @override
  String get adminPluginsNoSearchResults =>
      'Vašemu vyhledávání neodpovídají žádné pluginy';

  @override
  String get adminPluginsNoneInstalled => 'Nejsou nainstalovány žádné pluginy';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Dostupná aktualizace: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Aktualizace k dispozici';

  @override
  String get adminPluginsPendingRemoval => 'Čeká na odstranění po restartu';

  @override
  String get adminPluginsChangesPending => 'Změny čekající na restart';

  @override
  String get adminPluginsEnable => 'Umožnit';

  @override
  String get adminPluginsDisable => 'Zakázat';

  @override
  String get adminPluginsInstallUpdate => 'Nainstalujte aktualizaci';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Nainstalovat aktualizaci (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Vašemu hledání neodpovídají žádné balíčky';

  @override
  String get adminPluginsCatalogEmpty => 'Nejsou k dispozici žádné balíčky';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" se instaluje...';
  }

  @override
  String get adminPluginDetailExperimental => 'Experimentální integrace';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Integrace nastavení pluginu je stále experimentální. Některá pole nebo rozvržení se ještě nemusí správně vykreslit.';

  @override
  String get adminPluginDetailToggle404 =>
      'Plugin se nepodařilo přepnout. Server nemohl najít tuto verzi pluginu. Zkuste aktualizovat pluginy a zkuste to znovu.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Plugin se nepodařilo přepnout. Podrobnosti naleznete v protokolech serveru.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Nastavení';
  }

  @override
  String get adminPluginDetailDetails => 'Podrobnosti';

  @override
  String get adminPluginDetailDeveloper => 'Vývojář';

  @override
  String get adminPluginDetailRepository => 'Úložiště';

  @override
  String get adminPluginDetailBundled => 'Sbalený';

  @override
  String get adminPluginDetailEnablePlugin => 'Povolit plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'Změny se projeví až po restartování serveru.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Tento plugin bude odstraněn po restartu serveru.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Tento plugin nefunguje správně a nemusí fungovat správně.';

  @override
  String get adminPluginDetailNotSupported =>
      'Tento plugin není podporován aktuální verzí serveru.';

  @override
  String get adminPluginDetailSuperseded =>
      'Tento plugin byl nahrazen novější verzí.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Nepodařilo se načíst úložiště: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Odebrat úložiště';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Opravdu chcete odstranit \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Odstranit';

  @override
  String adminReposSaveFailed(String error) {
    return 'Nepodařilo se uložit úložiště: $error';
  }

  @override
  String get adminReposEmpty => 'Nejsou nakonfigurována žádná úložiště';

  @override
  String get adminReposEmptySubtitle =>
      'Chcete-li procházet dostupné pluginy, přidejte úložiště';

  @override
  String get adminReposUnnamed => '(nejmenovaný)';

  @override
  String get adminReposEditTitle => 'Upravit úložiště';

  @override
  String get adminReposAddTitle => 'Přidat úložiště';

  @override
  String get adminReposUrl => 'Adresa URL úložiště';

  @override
  String get adminReposNameHint => 'např. Jellyfin Stabilní';

  @override
  String get adminPluginSettingsInvalidUrl => 'Neplatná adresa URL';

  @override
  String get adminGeneralSettingsTitle => 'Obecná nastavení';

  @override
  String get adminGeneralMetadataLanguage => 'Preferovaný jazyk metadat';

  @override
  String get adminGeneralMetadataLanguageHint => 'např. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Preferovaná země metadat';

  @override
  String get adminGeneralMetadataCountryHint => 'např. USA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Souběžnost skenování knihovny';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limit paralelního kódování obrazu';

  @override
  String get adminUnknownError => 'Neznámá chyba';

  @override
  String get adminBrowse => 'Prohlížet';

  @override
  String get adminCloseBrowser => 'Zavřete prohlížeč';

  @override
  String get adminNetworkingTitle => 'vytváření sítí';

  @override
  String get adminNetworkingRestartWarning =>
      'Změny nastavení sítě mohou vyžadovat restart serveru.';

  @override
  String get adminNetworkingRemoteAccess => 'Povolit vzdálený přístup';

  @override
  String get adminNetworkingPorts => 'Porty';

  @override
  String get adminNetworkingHttpPort => 'HTTP port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS port';

  @override
  String get adminNetworkingEnableHttps => 'Povolit HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Místní síť';

  @override
  String get adminNetworkingLocalAddresses => 'Lokální síťové adresy';

  @override
  String get adminNetworkingAddressHint => 'např. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Známí proxy';

  @override
  String get adminNetworkingProxyHint => 'např. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Seznam povolených';

  @override
  String get adminNetworkingBlacklist => 'Černá listina';

  @override
  String get adminNetworkingAddEntry => 'Přidat záznam';

  @override
  String get adminBrandingTitle => 'Branding';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Zřeknutí se odpovědnosti za přihlášení';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML zobrazené pod přihlašovacím formulářem';

  @override
  String get adminBrandingCustomCss => 'Vlastní CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Vlastní CSS aplikované na webové rozhraní';

  @override
  String get adminBrandingEnableSplash => 'Povolit úvodní obrazovku';

  @override
  String get adminPlaybackHwAccel => 'Hardwarová akcelerace';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardwarová akcelerace';

  @override
  String get adminPlaybackEnableHwEncoding => 'Povolit hardwarové kódování';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Povolit hardwarové dekódování pro:';

  @override
  String get adminPlaybackEncoding => 'Kódování';

  @override
  String get adminPlaybackEncodingThreads => 'Kódování vláken';

  @override
  String get adminPlaybackFallbackFont => 'Povolit záložní písmo';

  @override
  String get adminPlaybackFallbackFontPath => 'Cesta záložního písma';

  @override
  String get adminPlaybackStreaming => 'Streamování';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audioknihy';

  @override
  String get adminResumeMinAudiobookPct =>
      'Minimální procento obnovení audioknihy';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maximální procento obnovení audioknihy';

  @override
  String get adminStreamingBitrateLimit =>
      'Limit datového toku vzdáleného klienta (Mb/s)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Ponechte prázdné nebo 0 pro neomezené';

  @override
  String get adminTrickplayHwAccel => 'Povolit hardwarovou akceleraci';

  @override
  String get adminTrickplayHwEncoding => 'Povolit hardwarové kódování';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Povolit pouze extrakci klíčového snímku';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Rychlejší, ale nižší přesnost';

  @override
  String get adminTrickplayNonBlocking => 'Neblokování';

  @override
  String get adminTrickplayBlocking => 'Blokování';

  @override
  String get adminTrickplayPriorityHigh => 'Vysoký';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Nad normálem';

  @override
  String get adminTrickplayPriorityNormal => 'Normální';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Pod normální';

  @override
  String get adminTrickplayPriorityIdle => 'Líný';

  @override
  String get adminTrickplayImageSettings => 'Nastavení obrazu';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle => 'Jak často snímat snímky';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Šířky pixelů oddělené čárkami (např. 320)';

  @override
  String get adminTrickplayQuality => 'Kvalitní';

  @override
  String get adminTrickplayQScale => 'Stupnice kvality';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Nižší hodnoty = lepší kvalita, větší soubory';

  @override
  String get adminTrickplayJpegQuality => 'JPEG kvalita';

  @override
  String get adminTrickplayProcessing => 'Zpracování';

  @override
  String get adminTasksEmpty => 'Nebyly nalezeny žádné naplánované úkoly';

  @override
  String get adminTasksNoFilterMatch =>
      'Žádné úkoly neodpovídají aktuálnímu filtru';

  @override
  String get adminTaskCancelling => 'Rušení...';

  @override
  String get adminTaskRunning => 'Běh...';

  @override
  String get adminTaskNeverRun => 'Nikdy neutíkej';

  @override
  String get adminTaskStop => 'Zastávka';

  @override
  String get adminTaskRun => 'Běh';

  @override
  String get adminTaskDetailLastExecution => 'Poslední exekuce';

  @override
  String get adminTaskDetailStarted => 'Zahájeno';

  @override
  String get adminTaskDetailEnded => 'Skončilo';

  @override
  String get adminTaskDetailDuration => 'Trvání';

  @override
  String get adminTaskDetailErrorLabel => 'Chyba:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Denně na $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Každý $day na $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Každý $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Při spuštění aplikace';

  @override
  String get adminTaskTriggerTypeDaily => 'Denní';

  @override
  String get adminTaskTriggerTypeWeekly => 'Týdně';

  @override
  String get adminTaskTriggerTypeInterval => 'V intervalu';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Každou hodinu';

  @override
  String get adminTaskTriggerEvery6Hours => 'Každých 6 hodin';

  @override
  String get adminTaskTriggerEvery12Hours => 'Každých 12 hodin';

  @override
  String get adminTaskTriggerEvery24Hours => 'Každých 24 hodin';

  @override
  String get adminTaskTriggerEvery2Days => 'Každé 2 dny';

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
  String get adminTaskTriggerTime => 'Čas';

  @override
  String get adminTaskTriggerNoLimit => 'Bez omezení';

  @override
  String get adminActivityJustNow => 'Právě teď';

  @override
  String get adminActivityLastHour => 'Poslední hodina';

  @override
  String get adminActivityToday => 'Dnes';

  @override
  String get adminActivityYesterday => 'Včera';

  @override
  String get adminActivityOlder => 'Starší';

  @override
  String adminActivityDaysAgo(int days) {
    return 'Před ${days}d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'Před $hours h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'Před ${minutes}m';
  }

  @override
  String get adminActivityNow => 'teď';

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
      'Nakonfigurujte generování obrázků trickplay pro náhledy náhledů.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Veřejný port HTTPS';

  @override
  String get adminNetworkingBaseUrl => 'Základní URL';

  @override
  String get adminNetworkingBaseUrlHint => 'např. /ploutev';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Cesta k certifikátu';

  @override
  String get adminNetworkingRemoteIpFilter => 'Vzdálený IP filtr';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Vzdálený IP filtr';

  @override
  String get adminPlaybackVaapiDevice => 'zařízení VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automaticky';

  @override
  String get adminPlaybackTranscodeTempPath => 'Překódovací temp cesta';

  @override
  String get adminPlaybackSegmentDeletion => 'Povolit smazání segmentu';

  @override
  String get adminPlaybackSegmentKeep => 'Uchování segmentu (v sekundách)';

  @override
  String get adminPlaybackThrottleBuffering => 'Vyrovnávací paměť plynu';

  @override
  String get adminResumeMinPct => 'Minimální procento obnovení';

  @override
  String get adminResumeMinPctSubtitle =>
      'Obsah musí být přehrán přes toto procento, aby se uložil postup';

  @override
  String get adminResumeMaxPct => 'Maximální procento obnovení';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Po tomto procentu se obsah považuje za plně přehraný';

  @override
  String get adminResumeMinDuration => 'Minimální doba obnovení (sekundy)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Položky kratší než toto nelze obnovit';

  @override
  String get adminTrickplayScanBehavior => 'Chování skenování';

  @override
  String get adminTrickplayProcessPriority => 'Priorita procesu';

  @override
  String get adminTrickplayTileWidth => 'Šířka dlaždice';

  @override
  String get adminTrickplayTileHeight => 'Výška dlaždice';

  @override
  String get adminTrickplayProcessThreads => 'Procesní vlákna';

  @override
  String get adminTrickplayWidthResolutions => 'Rozlišení šířky';

  @override
  String get adminMetadataDefault => 'Výchozí';

  @override
  String get adminMetadataContentTypeUpdated => 'Typ obsahu byl aktualizován';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Nepodařilo se aktualizovat typ obsahu: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Práh pomalé odezvy (ms)';

  @override
  String get adminGeneralCachePath => 'Cesta keš';

  @override
  String get adminGeneralMetadataPath => 'Cesta metadat';

  @override
  String get adminGeneralServerName => 'Název serveru';

  @override
  String get adminSettingsLoadFailed => 'Nastavení se nepodařilo načíst';

  @override
  String get adminDiscover => 'Objevit';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Aktualizace mapování se nezdařila: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Časový limit: $duration';
  }

  @override
  String get folders => 'Složky';

  @override
  String get libraries => 'Knihovny';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay zakázáno';

  @override
  String get syncPlayDisabledMessage =>
      'Chcete-li používat synchronizované přehrávání, povolte v Nastavení SyncPlay.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server není podporován';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay vyžaduje server Jellyfin. Aktuální server to nepodporuje.';

  @override
  String get syncPlayGroupFallbackName => 'Skupina SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'skupina SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ignorujte čekání';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Během načítání tohoto zařízení do vyrovnávací paměti nezdržujte skupinu';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Pokračujte lokálně bez čekání na pomalé členy';

  @override
  String get syncPlayRepeat => 'Opakovat';

  @override
  String get syncPlayRepeatOne => 'Jeden';

  @override
  String get syncPlayShuffleModeShuffled => 'Zamícháno';

  @override
  String get syncPlayShuffleModeSorted => 'Seřazeno';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Synchronizovat aktuální frontu přehrávání';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Nahraďte skupinovou frontu tím, co se přehrává lokálně';

  @override
  String get syncPlayLeaveGroup => 'Opustit skupinu';

  @override
  String get syncPlayGroupQueue => 'Skupinová fronta';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Položka $index';
  }

  @override
  String get syncPlayPlayNow => 'Hrajte nyní';

  @override
  String get syncPlayCreateNewGroup => 'Vytvořte novou skupinu';

  @override
  String get syncPlayGroupName => 'Název skupiny';

  @override
  String get syncPlayDefaultGroupName => 'Moje skupina SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Vytvořit skupinu';

  @override
  String get syncPlayAvailableGroups => 'Dostupné skupiny';

  @override
  String get syncPlayNoGroupsAvailable => 'Nejsou k dispozici žádné skupiny';

  @override
  String get syncPlayJoinGroupQuestion => 'Připojit se ke skupině SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Připojení ke skupině SyncPlay může nahradit vaši aktuální frontu přehrávání. Pokračovat?';

  @override
  String get syncPlayJoin => 'Připojte se';

  @override
  String get syncPlayStateIdle => 'Líný';

  @override
  String get syncPlayStateWaiting => 'Čekání';

  @override
  String get syncPlayStatePaused => 'Pozastaveno';

  @override
  String get syncPlayStatePlaying => 'Hraní';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName se připojil ke skupině SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName opustila skupina SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Přístup k SyncPlay odepřen';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Nemáte přístup k jedné nebo více položkám v této skupině SyncPlay. Požádejte vlastníka skupiny, aby ověřil oprávnění knihovny nebo zvolil jinou frontu.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synchronizace přehrávání s $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Hlasové vyhledávání není k dispozici.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Přímé přehrávání Dolby Vision se nezdařilo';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Přímé přehrávání tohoto streamu Dolby Vision se nepodařilo spustit. Zkusit znovu pomocí překódování serveru?';

  @override
  String get retryWithTranscode => 'Zkuste to znovu s překódováním';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision není podporováno';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Toto zařízení nedokáže přímo dekódovat obsah Dolby Vision. Použijte záložní HDR10 nebo požádejte o překódování serveru.';

  @override
  String get rememberMyChoice => 'Zapamatuj si mou volbu';

  @override
  String get playHdr10Fallback => 'Přehrajte záložní verzi HDR10';

  @override
  String get requestTranscode => 'Požádat o překódování';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Detekce řádků vystavených pluginem \"Sekce domovské obrazovky\" IAmParadox27. Řádky lze povolit a změnit jejich pořadí níže.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Plugin zatím nehlásí žádné servery Jellyfin.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Zjistěte řádky nakonfigurované prostřednictvím pluginu „KefinTweaks“ ranaldsgift. Vlastní sekce, nedávno vydané, znovu shlédnuté, sezónní a nedávno přidané do knihovny, jsou zrcadleny z konfigurace KefinTweaks na každém serveru Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'KefinTweaks zatím žádné servery Jellyfin nehlásí.';

  @override
  String get integrationOpenHomeSections => 'Otevřete domovské sekce';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Povolit, zakázat a změnit pořadí řádků';

  @override
  String get integrationInstalledButDisabled => 'Instalováno, ale vypnuto';

  @override
  String get integrationNotInstalled => 'Není nainstalováno';

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
  String get seeAll => 'Zobrazit vše';

  @override
  String get noItems => 'Žádné položky';

  @override
  String get switchUser => 'Přepnout uživatele';

  @override
  String get remoteControl => 'Dálkové ovládání';

  @override
  String get mediaBarLoading => 'Načítání lišty médií...';

  @override
  String get mediaBarError => 'Panel médií se nepodařilo načíst';

  @override
  String get offlineServerUnavailable =>
      'Připojeno k internetu, ale aktuální server je nedostupný.';

  @override
  String get offlineNoInternet =>
      'Jste offline. K dispozici je pouze stažený obsah.';

  @override
  String get offlineFileNotAvailable => 'Soubor není k dispozici';

  @override
  String get offlineSwitchServer => 'Přepnout server';

  @override
  String get offlineSavedMedia => 'Uložená média';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Vzdálené přehrávání';

  @override
  String castControlFailed(String error) {
    return 'Kontrola odesílání selhala: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Ovládací prvky';
  }

  @override
  String get castDeviceVolume => 'Hlasitost zařízení';

  @override
  String get castVolumeUnavailable => 'Není k dispozici';

  @override
  String castStopKind(String kind) {
    return 'Zastavit $kind';
  }

  @override
  String get audioLabel => 'Zvuk';

  @override
  String get subtitlesLabel => 'titulky';

  @override
  String get pinConfirmTitle => 'Potvrďte PIN';

  @override
  String get pinSetTitle => 'Nastavte PIN';

  @override
  String get pinEnterTitle => 'Zadejte PIN';

  @override
  String get pinReenterToConfirm => 'Pro potvrzení znovu zadejte svůj PIN';

  @override
  String pinEnterNDigit(int length) {
    return 'Zadejte $length-místný PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Zadejte svůj $length-místný PIN';
  }

  @override
  String get pinIncorrect => 'Nesprávný PIN';

  @override
  String get pinMismatch => 'Kódy PIN se neshodují';

  @override
  String get pinForgot => 'Zapomněli jste PIN?';

  @override
  String get pinClear => 'Jasný';

  @override
  String get pinBackspace => 'Backspace';

  @override
  String get quickConnectAuthorized => 'Požadavek na rychlé připojení povolen.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Kód Quick Connect je neplatný nebo jeho platnost vypršela.';

  @override
  String get quickConnectNotSupported =>
      'Rychlé připojení není na tomto serveru podporováno.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Nepodařilo se autorizovat kód Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Rychlé připojení je na tomto serveru zakázáno.';

  @override
  String get quickConnectForbidden =>
      'Váš účet nemůže autorizovat tento požadavek rychlého připojení.';

  @override
  String get quickConnectNotFound =>
      'Kód rychlého připojení nebyl nalezen. Zkuste nový kód.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Rychlé připojení se nezdařilo: $message';
  }

  @override
  String get quickConnectEnterCode => 'Zadejte kód';

  @override
  String get quickConnectAuthorize => 'Povolit';

  @override
  String remoteCommandFailed(String error) {
    return 'Příkaz se nezdařil: $error';
  }

  @override
  String get remoteControlTitle => 'Dálkové ovládání';

  @override
  String get remoteFailedToLoadSessions => 'Načtení relací se nezdařilo';

  @override
  String get remoteNoSessions => 'Žádné ovladatelné relace';

  @override
  String get remoteStartPlayback => 'Spusťte přehrávání na jiném zařízení';

  @override
  String get unknownUser => 'Neznámý';

  @override
  String get unknownItem => 'Neznámý';

  @override
  String get remoteNothingPlaying => 'V této relaci se nic nehraje';

  @override
  String get castingStarted => 'Odesílání bylo zahájeno na vybraném zařízení';

  @override
  String castingFailed(String error) {
    return 'Nepodařilo se zahájit odesílání: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nejsou k dispozici žádná zařízení pro vzdálené přehrávání.';

  @override
  String get noRemoteDevicesIos =>
      'Nejsou k dispozici žádná zařízení pro vzdálené přehrávání.\n\nNa iOS mohou být cíle AirPlay v simulátoru nedostupné.';

  @override
  String get trackActionPlayNext => 'Play Next';

  @override
  String get trackActionAddToQueue => 'Přidat do fronty';

  @override
  String get trackActionAddToPlaylist => 'Přidat do seznamu skladeb';

  @override
  String get trackActionCancelDownload => 'Zrušit stahování';

  @override
  String get trackActionDeleteFromPlaylist => 'Smazat ze seznamu skladeb';

  @override
  String get trackActionMoveUp => 'Posunout nahoru';

  @override
  String get trackActionMoveDown => 'Přesunout dolů';

  @override
  String get trackActionRemoveFromFavorites => 'Odebrat z oblíbených';

  @override
  String get trackActionAddToFavorites => 'Přidat k oblíbeným';

  @override
  String get trackActionGoToAlbum => 'Přejděte do alba';

  @override
  String get trackActionGoToArtist => 'Přejděte na Umělce';

  @override
  String trackActionDownloading(String name) {
    return 'Stahování $name...';
  }

  @override
  String get trackActionDeletedFile => 'Smazaný stažený soubor';

  @override
  String get trackActionDeleteFileFailed => 'Stažený soubor nelze smazat';

  @override
  String get shuffleBy => 'Shuffle By';

  @override
  String get shuffleSelectLibrary => 'Vyberte Knihovna';

  @override
  String get shuffleSelectGenre => 'Vyberte Žánr';

  @override
  String get shuffleLibrary => 'Knihovna';

  @override
  String get shuffleGenre => 'Žánr';

  @override
  String get shuffleNoLibraries =>
      'Nejsou k dispozici žádné kompatibilní knihovny.';

  @override
  String get shuffleNoGenres =>
      'Pro tento režim náhodného přehrávání nebyly nalezeny žádné žánry.';

  @override
  String get posterDisplayTitle => 'Zobrazit';

  @override
  String get posterImageType => 'Typ obrázku';

  @override
  String get imageTypePoster => 'Plakát';

  @override
  String get imageTypeThumbnail => 'Náhled';

  @override
  String get imageTypeBanner => 'Prapor';

  @override
  String get playlistAddFailed => 'Přidání do seznamu videí se nezdařilo';

  @override
  String get playlistCreateFailed => 'Vytvoření seznamu videí se nezdařilo';

  @override
  String get playlistNew => 'Nový seznam skladeb';

  @override
  String get playlistCreate => 'Vytvořit';

  @override
  String get playlistCreateNew => 'Vytvořit nový seznam skladeb';

  @override
  String get playlistNoneFound => 'Nebyly nalezeny žádné seznamy skladeb';

  @override
  String get addToPlaylist => 'Přidat do seznamu skladeb';

  @override
  String get lyricsNotAvailable => 'Nejsou k dispozici žádné texty';

  @override
  String get upNext => 'Nahoru Další';

  @override
  String get playNext => 'Play Next';

  @override
  String get stillWatchingContent =>
      'Přehrávání bylo pozastaveno. Pořád se díváš?';

  @override
  String get stillWatchingStop => 'Zastávka';

  @override
  String get stillWatchingContinue => 'Pokračovat';

  @override
  String skipSegment(String segment) {
    return 'Přeskočit $segment';
  }

  @override
  String get liveTv => 'Živá televize';

  @override
  String get continueWatchingAndNextUp => 'Pokračovat ve sledování a další';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Stahování $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Stahování $fileName';
  }

  @override
  String get nextEpisode => 'Další epizoda';

  @override
  String get moreFromThisSeason => 'Více z této sezóny';

  @override
  String get playerTooltipPlaybackSpeed => 'Rychlost přehrávání';

  @override
  String get playerTooltipCastControls => 'Ovládání Cast';

  @override
  String get playerTooltipPlaybackQuality => 'Bitová rychlost';

  @override
  String get playerTooltipEnterFullscreen => 'Vstupte na celou obrazovku';

  @override
  String get playerTooltipExitFullscreen => 'Ukončete celou obrazovku';

  @override
  String get playerTooltipFloatOnTop => 'Plavat nahoře';

  @override
  String get playerTooltipExitFloatOnTop => 'Zakázat plovoucí nahoře';

  @override
  String get playerTooltipLockLandscape => 'Zamknout krajinu';

  @override
  String get playerTooltipUnlockOrientation => 'Povolit otáčení';

  @override
  String get playerTooltipPrevious => 'Předchozí';

  @override
  String get playerTooltipSeekBack => 'Hledejte zpět';

  @override
  String get playerTooltipSeekForward => 'Hledejte dopředu';

  @override
  String get contextMenuMarkWatched => 'Označit jako sledované';

  @override
  String get contextMenuMarkUnwatched => 'Označit jako nesledované';

  @override
  String get contextMenuAddToFavorites => 'Přidat k oblíbeným';

  @override
  String get contextMenuRemoveFromFavorites => 'Odebrat z oblíbených';

  @override
  String get contextMenuGoToSeries => 'Přejděte na Série';

  @override
  String get settingsAdministrationSubtitle =>
      'Přístup k panelu správy serveru';

  @override
  String get settingsAccountSecurity => 'Účet a zabezpečení';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autentizace, PIN kód a rodičovská kontrola';

  @override
  String get settingsPersonalization => 'Personalizace';

  @override
  String get settingsPersonalizationSubtitle =>
      'Motiv, navigace, domovské řádky a viditelnost knihovny';

  @override
  String get settingsDynamicContent => 'Dynamický obsah';

  @override
  String get settingsDynamicContentSubtitle =>
      'Panel médií a vizuální překryvy';

  @override
  String get settingsPlaybackSyncplay => 'Přehrávání a SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Nastavení zvuku/videa, titulky, stahování a ovládací prvky SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Synchronizace pluginu, Seerr, hodnocení a další';

  @override
  String get settingsAboutSubtitle =>
      'Verze aplikace, právní informace a kredity';

  @override
  String get settingsAuthenticationSection => 'OVĚŘOVÁNÍ';

  @override
  String get settingsSortServersBy => 'Seřadit servery podle';

  @override
  String get settingsLastUsed => 'Naposledy použité';

  @override
  String get settingsAlphabetical => 'Abecední';

  @override
  String get settingsPrivacyAndSafetySection => 'SOUKROMÍ A BEZPEČNOST';

  @override
  String get settingsBlockedRatings => 'Blokovaná hodnocení';

  @override
  String get settingsGeneralStyle => 'Obecný styl';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Akcenty tématu, pozadí, indikátory sledování a hudba tématu';

  @override
  String get settingsHomePage => 'Domovská stránka';

  @override
  String get settingsHomePageSubtitle =>
      'Sekce, typy obrázků, překryvy a náhledy médií';

  @override
  String get settingsLibrariesSubtitle =>
      'Viditelnost knihovny, zobrazení složek a chování na více serverech';

  @override
  String get settingsTwentyFourHourClock => '24hodinové hodiny';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Používejte 24hodinové formátování času všude tam, kde jsou zobrazeny hodiny';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Zobrazit tlačítko náhodného přehrávání na navigační liště';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Zobrazit tlačítko žánry v navigační liště';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Zobrazit tlačítko oblíbených v navigační liště';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Zobrazit tlačítko knihoven v navigační liště';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Přepnout viditelnost domovské stránky podle knihovny. Restartujte Moonfin, aby se změny projevily.';

  @override
  String get settingsMediaBarAndLocalPreviews => 'Panel médií a místní náhledy';

  @override
  String get settingsVisualOverlays => 'Vizuální překryvy';

  @override
  String get settingsSeasonalSurprise => 'Sezónní překvapení';

  @override
  String get settingsMetadataAndRatings => 'Metadata a hodnocení';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase zajišťuje integraci na straně serveru včetně dalších zdrojů hodnocení, požadavků Seerr a synchronizovaných předvoleb.';

  @override
  String get settingsOfflineDownloads => 'Offline stahování';

  @override
  String get settingsHigh => 'Vysoký';

  @override
  String get settingsLow => 'Nízký';

  @override
  String get settingsCustomPath => 'Vlastní cesta';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Zadejte cestu ke složce pro stahování';

  @override
  String get settingsConcurrentDownloads => 'Souběžné stahování';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maximální počet položek ke stažení najednou.';

  @override
  String get settingsAppInfo => 'INFORMACE O APLIKACI';

  @override
  String get settingsReportAnIssue => 'Nahlásit problém';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Otevřete nástroj pro sledování problémů na GitHubu';

  @override
  String get settingsJoinDiscord => 'Připojte se k Discordu';

  @override
  String get settingsJoinDiscordSubtitle => 'Chatujte s komunitou';

  @override
  String get settingsJoinTheDiscord => 'Připojte se k Discordu';

  @override
  String get settingsSupportMoonfin => 'Podpořte Moonfina';

  @override
  String get settingsSupportMoonfinSubtitle => 'Darujte kávu vývojáři';

  @override
  String get settingsLegal => 'PRÁVNÍ';

  @override
  String get settingsLicenses => 'licence';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Oznámení o licenci s otevřeným zdrojovým kódem';

  @override
  String get settingsPrivacyPolicy => 'Zásady ochrany osobních údajů';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Jak Moonfin nakládá s vašimi daty';

  @override
  String get settingsCheckForUpdates => 'Zkontrolujte aktualizace';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Podívejte se na nejnovější vydání Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Běží na Flutter';

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
  String get settingsBoth => 'Obě';

  @override
  String get settingsShuffleContentTypeFilter => 'Náhodně filtr typu obsahu';

  @override
  String get settingsVideoPlaybackPreferences => 'Předvolby přehrávání videa';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Základní video engine a nastavení kvality streamování';

  @override
  String get settingsAudioPreferences => 'Předvolby zvuku';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Zvukové stopy, zpracování a možnosti průchodu';

  @override
  String get settingsAutomationAndQueue => 'Automatizace a fronta';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatické přehrávání a řazení';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Kvalita stahování, limity úložiště a velikost fronty';

  @override
  String get settingsSyncplaySubtitle =>
      'Logika synchronizace pro skupinové relace';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Specializované funkce přehrávače. Používejte opatrně, protože některé možnosti mohou způsobit problémy s přehráváním';

  @override
  String get settingsSkipIntrosAndOutros => 'Přeskočit úvody a závěry?';

  @override
  String get settingsPromptUser => 'Vyzvat uživatele';

  @override
  String get settingsSkip => 'Přeskočit';

  @override
  String get settingsDoNothing => 'Nedělat nic';

  @override
  String get settingsMaxBitrateDescription =>
      'Omezení datového toku streamování. Obsah nad touto hranicí bude překódován tak, aby se vešel.';

  @override
  String get settingsMaxResolutionDescription =>
      'Omezte maximální rozlišení, které bude přehrávač požadovat. Obsah ve vyšším rozlišení bude překódován.';

  @override
  String get settingsPlayerZoomDescription =>
      'Jak by mělo být video zmenšeno, aby se vešlo na obrazovku.';

  @override
  String get settingsPlaybackEngineAndroidTv => 'Playback Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Vyberte výchozí modul přehrávání na zařízeních Android TV. Změny se použijí na další relaci přehrávání.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (doporučeno)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (starší)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (starší)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (doporučeno)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Záložní';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Chování pro tituly Dolby Vision na zařízeních bez dekódování Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Pokaždé se ptejte';

  @override
  String get settingsPreferHdr10Fallback => 'Preferujte záložní HDR10';

  @override
  String get settingsPreferServerTranscode => 'Preferuji překódování serveru';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Přímé přehrávání Dolby Vision Profile 7';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Určuje, zda by streamy vrstvy vylepšení Dolby Vision profilu 7 měly řídit přehrávání.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT povoleno)';

  @override
  String get settingsEnabledOnThisDevice => 'Na tomto zařízení povoleno';

  @override
  String get settingsDisabledPreferTranscode =>
      'Zakázáno (preferovat překódování)';

  @override
  String get settingsResumeRewindDescription =>
      'O kolik sekund by se mělo při obnovení přehrávání (ze stránky Pokračovat ve sledování nebo ze stránky mediální položky) vrátit zpět?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Při obnovení přehrávání po stisknutí tlačítka pauzy, o kolik sekund by se mělo převinout zpět?';

  @override
  String get settingsSkipBackLengthDescription =>
      'O kolik sekund skočit zpět po stisknutí tlačítka převíjení zpět.';

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
      'O kolik sekund skočit vpřed po stisknutí tlačítka rychlého posunu vpřed.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 do externího dekodéru';

  @override
  String get settingsCinemaMode => 'Režim Kino';

  @override
  String get settingsCinemaModeSubtitle =>
      'Přehrajte si upoutávky/prerolly před hlavním prvkem';

  @override
  String get settingsNextUpDisplayDescription =>
      'Rozšířená zobrazuje celou kartu s kresbou a popisem epizody. Minimal zobrazuje kompaktní překrytí odpočítávání. Zakázáno zcela skryje výzvu.';

  @override
  String get settingsShort => 'Krátký';

  @override
  String get settingsLong => 'Dlouho';

  @override
  String get settingsVeryLong => 'Velmi dlouhé';

  @override
  String get settingsVideoStartDelay => 'Zpoždění spuštění videa';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Přímé živé televizní vysílání';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Povolit přímé přehrávání pro živé televizní vysílání';

  @override
  String get settingsOpenGroups => 'Otevřete Skupiny';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Vytvářejte, připojujte se nebo spravujte skupiny SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay povoleno';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Povolit funkce skupinového sledování';

  @override
  String get settingsSyncplayButton => 'Tlačítko SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Zobrazte tlačítko SyncPlay na navigační liště';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Pokročilá korekce';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Povolit jemnou synchronizační logiku';

  @override
  String get settingsSyncplaySyncCorrection => 'Korekce synchronizace';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Automaticky upravte přehrávání, aby zůstalo synchronizované';

  @override
  String get settingsSyncplaySpeedToSync => 'Rychlost synchronizace';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'K synchronizaci použijte nastavení rychlosti přehrávání';

  @override
  String get settingsSyncplaySkipToSync => 'Přejít na synchronizaci';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'K synchronizaci použijte vyhledávání';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Zpoždění minimální rychlosti';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Zpoždění maximální rychlosti';

  @override
  String get settingsSyncplaySpeedDuration => 'Rychlost Trvání';

  @override
  String get settingsSyncplayMinimumSkipDelay =>
      'Minimální zpoždění přeskočení';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Extra offset';

  @override
  String get onNow => 'Na Nyní';

  @override
  String get collections => 'Sbírky';

  @override
  String get lastPlayed => 'Naposledy hráno';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Nejnovější $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Automaticky přehrát další epizodu';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Automaticky přehrát další epizodu, až bude k dispozici.';

  @override
  String get skipSilenceTitle => 'Přeskočte ticho';

  @override
  String get skipSilenceSubtitle =>
      'Automaticky přeskakovat tiché zvukové segmenty, pokud to stream podporuje.';

  @override
  String get allowExternalAudioEffectsTitle => 'Povolit externí zvukové efekty';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Povolit aplikacím ekvalizéru a efektů (např. Wavelet) připojení k Media3 relacím přehrávání.';

  @override
  String get disableTunnelingTitle => 'Zakázat tunelování';

  @override
  String get disableTunnelingSubtitle =>
      'Vynutit netunelované přehrávání. Užitečné na zařízeních s tunelováním audio/video diskontinuit.';

  @override
  String get mapDolbyVisionP7Title => 'Namapujte Dolby Vision profil 7 na HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Přehrávejte streamy Dolby Vision profilu 7 jako HEVC kompatibilní s HDR10 na zařízeních bez DV.';

  @override
  String get subtitlesUseEmbeddedStyles => 'Použijte vložené styly titulků';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Použijte barvy, fonty a umístění vložené do stopy titulků. Chcete-li místo toho používat předvolby stylu titulků, zakažte.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Použijte vložené velikosti písma titulků';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Použijte rady pro velikost písma vložené do stopy titulků. Zakažte použití velikosti titulků z vašich předvoleb stylu.';

  @override
  String get useDetailedSubHeadings => 'Použijte podrobné podnadpisy';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Zobrazit podrobný nebo minimální podřádek na stránkách knihovny.';

  @override
  String get savedThemesDeleteDialogTitle => 'Smazat uložený motiv?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Odebrat \"$themeName\" z mezipaměti tohoto zařízení?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Z tohoto zařízení bylo smazáno „$themeName“.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Nelze smazat \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Uložená témata';

  @override
  String get savedThemesDescription =>
      'Toto jsou témata stažená z pluginu Moonfin pro aktuální server. Odstraněním se odstraní pouze tato místní kopie.';

  @override
  String get savedThemesEmpty =>
      'Pro tento server nebyly nalezeny žádné uložené motivy.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Aktuálně aktivní';
  }

  @override
  String get savedThemesDeleteTooltip => 'Smazat uložené téma';

  @override
  String get savedThemesManageSubtitle =>
      'Spravujte stažená témata pluginů na tomto zařízení';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Sekce domovské obrazovky';

  @override
  String get themeEditor => 'Editor motivů';

  @override
  String get themeEditorSubtitle =>
      'Otevřete ve svém prohlížeči editor motivů Moonfin';

  @override
  String get homeScreen => 'Domovská obrazovka';

  @override
  String get bottomBar => 'Spodní lišta';

  @override
  String get homeRowsStyleClassic => 'Klasický';

  @override
  String get homeRowsStyleModern => 'Moderní';

  @override
  String get homeRowsSection => 'Domácí řádky';

  @override
  String get rowsType => 'Typ řádků';

  @override
  String get rowsTypeDescription =>
      'Classic zachovává typ obrázku na řádku a překryvné informace. Moderní používá řady na výšku na pozadí.';

  @override
  String get displayFavoritesRows => 'Zobrazit oblíbené řádky';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Zobrazit oblíbené filmy, seriály a další oblíbené řádky v sekcích Domů.';

  @override
  String get favoritesRowSorting => 'Řazení oblíbených řádků';

  @override
  String get favoritesRowSortingDescription =>
      'Seřadit řádky oblíbených položek podle data přidání, data vydání, abecedně a podobně.';

  @override
  String get displayCollectionsRows => 'Zobrazit řádky kolekcí';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Zobrazit řádky kolekcí v domovských sekcích.';

  @override
  String get collectionsRowSorting => 'Kolekce Řazení řádků';

  @override
  String get collectionsRowSortingDescription =>
      'Seřadit řádky kolekcí podle data přidání, data vydání, abecedně a dalších.';

  @override
  String get displayGenresRows => 'Zobrazit řádky žánrů';

  @override
  String get displayGenresRowsSubtitle =>
      'Zobrazit řádky žánrů v domovských sekcích.';

  @override
  String get genresRowSorting => 'Žánry Řazení řádků';

  @override
  String get genresRowSortingDescription =>
      'Řazení řádků žánrů podle data přidání, data vydání, abecedně a dalších.';

  @override
  String get genresRowItems => 'Žánry řádkové položky';

  @override
  String get genresRowItemsDescription =>
      'Zobrazit filmy, seriály nebo obojí v řádcích Žánry.';

  @override
  String get appearance => 'Vzhled';

  @override
  String get cardSize => 'Velikost karty';

  @override
  String get externalPlayerApp => 'Aplikace pro externí přehrávač';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Při spuštění přehrávání zobrazit výběr aplikací.';

  @override
  String get loadingInstalledPlayers =>
      'Načítání nainstalovaných přehrávačů...';

  @override
  String get connection => 'Spojení';

  @override
  String get audioTranscodeTarget => 'Audio Transcode Target';

  @override
  String get passthrough => 'Průchod';

  @override
  String get supportedOnThisDevice => 'Podporováno na tomto zařízení';

  @override
  String get notSupportedOnThisDevice => 'Na tomto zařízení není podporováno';

  @override
  String get settingsAudioDtsXPassthrough => 'Průchod DTS:X (DTS UHD).';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) do externího dekodéru.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD s průchodem Atmos (JOC).';

  @override
  String get mediaPlayerBehavior => 'Chování přehrávače médií';

  @override
  String get playbackEnhancements => 'Vylepšení přehrávání';

  @override
  String get alwaysOn => 'Vždy zapnuto.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Nahraďte Skip Outro displejem Next Up';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Zobrazte překryvnou vrstvu Next Up namísto tlačítka Skip Outro.';

  @override
  String get playerRouting => 'Směrování hráčů';

  @override
  String get preferSoftwareDecoders => 'Preferujte softwarové dekodéry';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Před hardwarovými dekodéry použijte FFmpeg (audio) a libgav1 (AV1). Deaktivujte, pokud se přeruší průchod zvuku HDMI.';

  @override
  String get useExternalPlayer => 'Použijte externí přehrávač';

  @override
  String get useExternalPlayerSubtitle =>
      'Otevřete přehrávání videa ve vybrané externí aplikaci na Android TV.';

  @override
  String get automaticQueuing => 'Automatické řazení do fronty';

  @override
  String get preferSdhSubtitles => 'Preferujte titulky SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Při automatickém výběru upřednostněte stopy titulků SDH/CC.';

  @override
  String get webDiagnostics => 'Webová diagnostika';

  @override
  String get webDiagnosticsTitle => 'Moonfin Webová diagnostika';

  @override
  String get webDiagnosticsIntro =>
      'Tato stránka slouží k diagnostice problémů s připojením prohlížeče (CORS, smíšený obsah a nastavení zjišťování).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Zjištěno selhání smíšeného obsahu';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Zjištěno selhání CORS/předletové kontroly';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin zjistil HTTPS stránku, která se pokouší volat URL HTTP serveru. Prohlížeče zablokují tento požadavek dříve, než se dostane na váš server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin zjistil selhání požadavku na úrovni prohlížeče, které je běžně způsobeno chybějícími hlavičkami CORS nebo preflight na serveru médií.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Cílová adresa URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Podrobnosti: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Aktuální kontext běhu';

  @override
  String get webDiagnosticsOrigin => 'Původ';

  @override
  String get webDiagnosticsScheme => 'Systém';

  @override
  String get webDiagnosticsPluginMode => 'Režim pluginu';

  @override
  String get webDiagnosticsWebRtcScan => 'Skenování WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'Vynucená adresa URL serveru';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Výchozí adresa URL serveru';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery URL proxy';

  @override
  String get notConfigured => 'není nakonfigurováno';

  @override
  String get webDiagnosticsMixedContent => 'Smíšený obsah';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Tato stránka se načítá přes HTTPS, ale jedna nebo více nakonfigurovaných adres URL je HTTP. Prohlížeče blokují stránky HTTPS ve volání rozhraní API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Oprava: obsluhovat váš mediální server nebo proxy koncový bod přes HTTPS nebo načíst Moonfin přes HTTP pouze v důvěryhodných místních sítích.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Z aktuálního nastavení runtime nebyla zjištěna žádná zjevná konfigurace se smíšeným obsahem.';

  @override
  String get webDiagnosticsCorsChecklist => 'Kontrolní seznam CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Povolit původ prohlížeče v Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Zahrňte autorizaci, X-Emby-Authorization a X-Emby-Token do Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Vystavit rozsah obsahu a přijmout rozsahy pro streamování a vyhledávání.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Vraťte 204 do OPTIONS předletových požadavků.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Příklad úryvku záhlaví (styl nginx)';

  @override
  String get note => 'Poznámka';

  @override
  String get webDiagnosticsNonWebNote =>
      'Tato diagnostická cesta je určena pro webové sestavení. Pokud to vidíte na jiné platformě, tyto kontroly nemusí platit.';

  @override
  String get backToServerSelect => 'Zpět na server Vyberte';

  @override
  String get signOutAllUsers => 'Odhlásit všechny uživatele';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Oprávnění k mikrofonu je trvale odepřeno. Povolte jej v nastavení systému.';

  @override
  String get voiceSearchPermissionRequired =>
      'Hlasové vyhledávání vyžaduje povolení mikrofonu.';

  @override
  String get voiceSearchNoMatch => 'To jsem nezachytil. Zkuste to znovu.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nebyla zjištěna žádná řeč.';

  @override
  String get voiceSearchMicrophoneError => 'Chyba mikrofonu.';

  @override
  String get voiceSearchNeedsInternet =>
      'Hlasové vyhledávání potřebuje internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Hlasová služba je zaneprázdněna. Zkuste to znovu.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Oprávnění k mikrofonu je trvale odepřeno.';

  @override
  String get microphonePermissionDenied => 'Povolení mikrofonu je odepřeno.';

  @override
  String get speechRecognitionUnavailable =>
      'Na tomto zařízení není rozpoznávání řeči k dispozici.';

  @override
  String get openIosRoutePicker => 'Otevřete výběr trasy pro iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Výběr trasy AirPlay není na tomto zařízení k dispozici.';

  @override
  String get videos => 'videa';

  @override
  String get trailers => 'Přívěsy';

  @override
  String get programs => 'Programy';

  @override
  String get songs => 'Písně';

  @override
  String get photoAlbums => 'Fotoalba';

  @override
  String get photos => 'Fotografie';

  @override
  String get people => 'Lidé';

  @override
  String get recentlyReleasedEpisodes => 'Nedávno vydané epizody';

  @override
  String get watchAgain => 'Podívejte se znovu';

  @override
  String get guestAppearances => 'Vystoupení hostů';

  @override
  String get appearancesSeerr => 'Vzhled (Seerr)';

  @override
  String get watchWithGroup => 'Sledujte se skupinou';

  @override
  String get errors => 'Chyby';

  @override
  String get warnings => 'Varování';

  @override
  String get disk => 'Disk';

  @override
  String get openInBrowser => 'Otevřít v prohlížeči';

  @override
  String get embeddedBrowserNotAvailable =>
      'Vestavěný prohlížeč není na této platformě k dispozici.';

  @override
  String get adminRestartServerConfirmation =>
      'Opravdu chcete restartovat server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Opravdu chcete server vypnout? Budete jej muset restartovat ručně.';

  @override
  String get internal => 'Vnitřní';

  @override
  String get idle => 'Líný';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nebyli nalezeni žádní uživatelé';

  @override
  String get adminNoUsersMatchSearch =>
      'Vašemu vyhledávání neodpovídají žádní uživatelé';

  @override
  String get adminNoDevicesFound => 'Nebyla nalezena žádná zařízení';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Aktuálním filtrům neodpovídá žádná zařízení';

  @override
  String get passwordSet => 'Heslo nastaveno';

  @override
  String get noPasswordConfigured => 'Není nakonfigurováno žádné heslo';

  @override
  String get remoteAccess => 'Vzdálený přístup';

  @override
  String get localOnly => 'Pouze místní';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Načtení analýzy médií se nezdařilo';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombinovaná analýza napříč všemi knihovnami médií.';

  @override
  String get analyticsTopArtists => 'Nejlepší umělci';

  @override
  String get analyticsTopAuthors => 'Nejlepší autoři';

  @override
  String get analyticsTopContributors => 'Hlavní přispěvatelé';

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
      'Pro tento výběr zatím nejsou k dispozici žádné součty indexovaných médií.';

  @override
  String get analyticsLibraryDetails => 'Podrobnosti o knihovně';

  @override
  String get analyticsLibraryBreakdown => 'Členění knihovny';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Nejsou k dispozici žádné knihovny.';

  @override
  String get adminServerAdministrationTitle => 'Správa serveru';

  @override
  String get adminServerPathData => 'Data';

  @override
  String get adminServerPathImageCache => 'Mezipaměť obrázků';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Protokoly';

  @override
  String get adminServerPathMetadata => 'Metadata';

  @override
  String get adminServerPathTranscode => 'Překódovat';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Tento server nevrátil žádné cesty k serveru.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% využito';
  }

  @override
  String get userActivity => 'Aktivita uživatele';

  @override
  String get systemEvents => 'Systémové události';

  @override
  String get needsAttention => 'Vyžaduje pozornost';

  @override
  String get adminDrawerSectionServer => 'Server';

  @override
  String get adminDrawerSectionPlayback => 'Přehrávání';

  @override
  String get adminDrawerSectionDevices => 'Zařízení';

  @override
  String get adminDrawerSectionAdvanced => 'Moderní';

  @override
  String get adminDrawerSectionPlugins => 'Pluginy';

  @override
  String get adminDrawerSectionLiveTv => 'Živá televize';

  @override
  String get homeVideos => 'Domácí videa';

  @override
  String get mixedContent => 'Smíšený obsah';

  @override
  String get homeVideosAndPhotos => 'Domácí videa a fotografie';

  @override
  String get mixedMoviesAndShows => 'Smíšené filmy a pořady';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nebyly nalezeny žádné nahrávky';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'V archivu .$extension nebyly nalezeny žádné stránky s obrázky.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Vestavěný renderer selhal ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Vykreslování EPUB se nezdařilo ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Chybí místní soubor pro čtečku: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status při otevírání dat knihy z $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Není k dispozici žádný čitelný koncový bod knihy';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nepodporovaný formát archivu komiksu: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Plugin pro extrakci CBR není na této platformě dostupný.';

  @override
  String get failedToExtractCbrArchive =>
      'Nepodařilo se extrahovat archiv .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'Extrakce CB7 není na této platformě k dispozici.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Zásuvný modul pro extrakci CB7 není na této platformě dostupný.';

  @override
  String get closeGenrePanel => 'Zavřít panel žánru';

  @override
  String get loadingShuffle => 'Načítání náhodného přehrávání...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Automatické přepínání HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Automaticky povolte HDR pro přehrávání videa HDR a obnovte režim zobrazení při ukončení.';

  @override
  String get whenFullscreen => 'Při zobrazení na celou obrazovku';

  @override
  String get transcodingLimits => 'Limity překódování';
}
