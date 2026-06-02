// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => 'Anmelden';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Schnellverbindung';

  @override
  String get password => 'Passwort';

  @override
  String get username => 'Benutzername';

  @override
  String get email => 'E-Mail';

  @override
  String get quickConnectInstruction =>
      'Gib diesen Code im Web-Dashboard deines Servers ein:';

  @override
  String get waitingForAuthorization => 'Warte auf Autorisierung...';

  @override
  String get back => 'Zurück';

  @override
  String get serverUnavailable => 'Server nicht erreichbar';

  @override
  String get loginFailed => 'Anmeldung fehlgeschlagen';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Wer schaut zu?';

  @override
  String get addUser => 'Benutzer hinzufügen';

  @override
  String get selectServer => 'Server auswählen';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Gespeicherte Server';

  @override
  String get discoveredServers => 'Erkannte Server';

  @override
  String get noneFound => 'Keine gefunden';

  @override
  String get unableToConnectToServer => 'Verbindung zum Server nicht möglich';

  @override
  String get addServer => 'Server hinzufügen';

  @override
  String get embyConnect => 'Emby Verbinden';

  @override
  String get removeServer => 'Server entfernen';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get remove => 'Entfernen';

  @override
  String get connectToServer => 'Mit Server verbinden';

  @override
  String get serverAddress => 'Serveradresse';

  @override
  String get serverAddressHint => 'https://dein-server.beispiel.de';

  @override
  String get connect => 'Verbinden';

  @override
  String get secureStorageUnavailable => 'Sicherer Speicher nicht verfügbar';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin konnte nicht auf deinen System-Schlüsselbund zugreifen. Die Anmeldung kann fortgesetzt werden, aber die sichere Token-Speicherung ist möglicherweise nicht verfügbar, bis der Schlüsselbund entsperrt wird.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-Theme';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Wechseln Sie zwischen Moonfin und Neon Pulse, ohne die App neu zu starten';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Der aktuelle Moonfin-Look, den Sie alle lieben werden';

  @override
  String get themeNeonPulse => 'Neonpuls';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-Stil mit Magenta-Glühen, Cyan-Text und stärkerem Chromkontrast';

  @override
  String get embyConnectSignInSubtitle =>
      'Melde dich mit deinem Emby-Connect-Konto an';

  @override
  String get emailOrUsername => 'E-Mail oder Benutzername';

  @override
  String get selectAServer => 'Server auswählen';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get noLinkedServers =>
      'Keine Server mit diesem Emby-Connect-Konto verknüpft';

  @override
  String get invalidEmbyConnectCredentials =>
      'Ungültige Emby-Connect-Anmeldedaten';

  @override
  String get invalidEmbyConnectLogin =>
      'Ungültiger Emby-Connect-Benutzername oder Passwort';

  @override
  String get embyConnectExchangeNotSupported =>
      'Server unterstützt keinen Emby-Connect-Austausch';

  @override
  String get embyConnectNetworkError =>
      'Netzwerkfehler beim Kontaktieren von Emby Connect oder dem ausgewählten Server';

  @override
  String get loadingLinkedServers => 'Lade verknüpfte Server...';

  @override
  String get connectingToServerEllipsis =>
      'Verbindung zum Server wird hergestellt...';

  @override
  String get noReachableAddress => 'Keine erreichbare Adresse angegeben';

  @override
  String get invalidServerExchangeResponse =>
      'Ungültige Antwort vom Server-Austauschendpunkt';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Moonfin beenden?';

  @override
  String get exitAppConfirmation => 'Möchtest du die App wirklich beenden?';

  @override
  String get exit => 'Beenden';

  @override
  String get noHomeRowsLoaded => 'Keine Startseiten-Reihen geladen';

  @override
  String get noHomeRowsHint =>
      'Versuche zu aktualisieren oder reduziere die aktiven Bereiche.';

  @override
  String get retryHomeRows => 'Startseiten-Reihen erneut laden';

  @override
  String get guide => 'Programmführer';

  @override
  String get recordings => 'Aufnahmen';

  @override
  String get schedule => 'Zeitplan';

  @override
  String get series => 'Serien';

  @override
  String get noItemsFound => 'Keine Einträge gefunden';

  @override
  String get home => 'Startseite';

  @override
  String get browseAll => 'Alle durchsuchen';

  @override
  String get genres => 'Genres';

  @override
  String get collectionPlaceholder => 'Sammlungselemente werden hier angezeigt';

  @override
  String get browseByLetter => 'Nach Buchstaben durchsuchen';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Alphabetische Übersicht wird hier angezeigt';

  @override
  String get suggestions => 'Vorschläge';

  @override
  String get suggestionsPlaceholder =>
      'Vorgeschlagene Einträge werden hier angezeigt';

  @override
  String get failedToLoadLibraries =>
      'Bibliotheken konnten nicht geladen werden';

  @override
  String get noLibrariesFound => 'Keine Bibliotheken gefunden';

  @override
  String get library => 'Bibliothek';

  @override
  String get displaySettings => 'Anzeigeeinstellungen';

  @override
  String get allGenres => 'Alle Genres';

  @override
  String get noGenresFound => 'Keine Genres gefunden';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Dieser Ordner ist leer';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Favoriten konnten nicht geladen werden';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get noFavoritesYet => 'Noch keine Favoriten';

  @override
  String get favorites => 'Favoriten';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Wird fortgesetzt';

  @override
  String get ended => 'Beendet';

  @override
  String get sortAndFilter => 'Sortieren & Filtern';

  @override
  String get type => 'Typ';

  @override
  String get sortBy => 'Sortieren nach';

  @override
  String get display => 'Anzeige';

  @override
  String get imageType => 'Bildtyp';

  @override
  String get posterSize => 'Postergröße';

  @override
  String get small => 'Klein';

  @override
  String get medium => 'Mittel';

  @override
  String get large => 'Groß';

  @override
  String get extraLarge => 'Sehr groß';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Ansichten';

  @override
  String get albums => 'Alben';

  @override
  String get albumArtists => 'Alben-Interpreten';

  @override
  String get artists => 'Interpreten';

  @override
  String get bookmarks => 'Lesezeichen';

  @override
  String get noSavedBookmarks =>
      'Noch keine gespeicherten Lesezeichen für diesen Titel.';

  @override
  String get openBook => 'Buch öffnen';

  @override
  String get chapter => 'Kapitel';

  @override
  String get page => 'Seite';

  @override
  String get bookmark => 'Lesezeichen';

  @override
  String get justNow => 'Gerade eben';

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
  String get discoverySubjects => 'Entdecken-Themen';

  @override
  String get pickDiscoverySubjects =>
      'Wähle aus, welche Themen-Feeds in Entdecken angezeigt werden.';

  @override
  String get apply => 'Anwenden';

  @override
  String get openLink => 'Link öffnen';

  @override
  String get scanWithYourPhone => 'Scannen Sie mit Ihrem Telefon';

  @override
  String get audiobookGenres => 'Hörbuch-Genres';

  @override
  String get pickAudiobookGenres =>
      'Wähle aus, welche Genres in Hörbuch-Entdecken angezeigt werden.';

  @override
  String get discoverAudiobooks => 'Hörbücher entdecken';

  @override
  String get librivoxDescription => 'Beliebte gemeinfreie Titel von LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Nach links scrollen';

  @override
  String get scrollRight => 'Nach rechts scrollen';

  @override
  String get couldNotLoadGenre =>
      'Dieses Genre konnte gerade nicht geladen werden.';

  @override
  String get continueReading => 'Weiterlesen';

  @override
  String get savedHighlights => 'Gespeicherte Markierungen';

  @override
  String get continueListening => 'Weiterhören';

  @override
  String get listen => 'Anhören';

  @override
  String get resume => 'Fortsetzen';

  @override
  String get failedToLoadLibrary => 'Bibliothek konnte nicht geladen werden';

  @override
  String get popularNow => 'Jetzt beliebt';

  @override
  String get savedForLater => 'Für später gespeichert';

  @override
  String get topListens => 'Am meisten gehört';

  @override
  String get unreadDiscoveries => 'Ungelesene Entdeckungen';

  @override
  String get pickUpAgain => 'Wieder aufnehmen';

  @override
  String get bookHighlightsDescription =>
      'Deine Bücher mit Markierungen, Favoriten oder Lesefortschritt.';

  @override
  String get handPickedFromLibrary => 'Handverlesen aus deiner Bibliothek.';

  @override
  String get handPickedFromListeningQueue =>
      'Handverlesen aus deiner Hörwarteschlange.';

  @override
  String get booksWithHighlights =>
      'Bücher mit Markierungen, Favoriten oder Lesefortschritt.';

  @override
  String get jumpBackNarration =>
      'Springe zurück in die Erzählung, ohne deine Stelle suchen zu müssen.';

  @override
  String get unreadBooksReady =>
      'Ungelesene Bücher, bereit für die nächste ruhige Stunde.';

  @override
  String get quickAccessFavorites =>
      'Schnellzugriff auf die Bücher, zu denen du immer wieder zurückkehrst.';

  @override
  String get searchAudiobooks => 'Hörbücher suchen';

  @override
  String get searchYourLibrary => 'Deine Bibliothek durchsuchen';

  @override
  String get pickUpStory =>
      'Setze die Geschichte dort fort, wo du aufgehört hast';

  @override
  String get savedPlacesChapters =>
      'Deine gespeicherten Stellen und unvollständigen Kapitel';

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
  String get readyWhenYouAre => 'Bereit, wenn du es bist';

  @override
  String get details => 'Einzelheiten';

  @override
  String get listeningRoom => 'Hörzimmer';

  @override
  String get bookmarksAndProgress => 'Lesezeichen & Fortschritt';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Titel';

  @override
  String get allTitles => 'Alle Titel';

  @override
  String get authors => 'Autoren';

  @override
  String get browseByAuthor => 'Nach Autor durchsuchen';

  @override
  String get browseByGenre => 'Nach Genre durchsuchen';

  @override
  String get discover => 'Entdecken';

  @override
  String get trendingTitlesOpenLibrary =>
      'Aktuelle Titel nach Thema von Open Library.';

  @override
  String get noBookmarkedItems =>
      'Noch keine mit Lesezeichen versehenen Einträge';

  @override
  String get nothingMatchesSection =>
      'Nichts passt zu diesem Bereich. Versuche einen anderen Tab oder komme nach der Bibliothekssynchronisierung zurück.';

  @override
  String get audiobooks => 'Hörbücher';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Ordner';

  @override
  String get filters => 'Filter';

  @override
  String get readingStatus => 'Lesestatus';

  @override
  String get playedStatus => 'Wiedergabestatus';

  @override
  String get readStatus => 'Gelesen';

  @override
  String get watched => 'Gesehen';

  @override
  String get unread => 'Ungelesen';

  @override
  String get unwatched => 'Nicht gesehen';

  @override
  String get seriesStatus => 'Serienstatus';

  @override
  String get allLibraries => 'Alle Bibliotheken';

  @override
  String get books => 'Bücher';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Unbekannter Autor';

  @override
  String get uncategorized => 'Unkategorisiert';

  @override
  String get overview => 'Übersicht';

  @override
  String get noLibrivoxDescription =>
      'Für diesen Titel ist noch keine Beschreibung von LibriVox vorhanden.';

  @override
  String get readers => 'Vorleser';

  @override
  String get openLinks => 'Links öffnen';

  @override
  String get librivoxPage => 'LibriVox-Seite';

  @override
  String get internetArchive => 'Internetarchiv';

  @override
  String get rssFeed => 'RSS-Feed';

  @override
  String get downloadZip => 'ZIP herunterladen';

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
      'Für diesen Titel ist noch keine Übersicht von Open Library verfügbar.';

  @override
  String get subjects => 'Themen';

  @override
  String get all => 'Alle';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Dieses Thema konnte gerade nicht geladen werden.';

  @override
  String get audiobookDetails => 'Hörbuch-Details';

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
  String get trackList => 'Titelliste';

  @override
  String get itemListPlaceholder => 'Die Elementliste wird hier angezeigt';

  @override
  String get favoriteTracksPlaceholder =>
      'Favorisierte Titel werden hier angezeigt';

  @override
  String get failedToLoad => 'Laden fehlgeschlagen';

  @override
  String get delete => 'Löschen';

  @override
  String get save => 'Speichern';

  @override
  String get moreLikeThis => 'Mehr davon';

  @override
  String get castAndCrew => 'Besetzung & Crew';

  @override
  String get collection => 'Sammlung';

  @override
  String get episodes => 'Episoden';

  @override
  String get nextUp => 'Als Nächstes';

  @override
  String get seasons => 'Staffeln';

  @override
  String get chapters => 'Kapitel';

  @override
  String get features => 'Besonderheiten';

  @override
  String get movies => 'Filme';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Sonstige';

  @override
  String get discography => 'Diskografie';

  @override
  String get similarArtists => 'Ähnliche Interpreten';

  @override
  String get tableOfContents => 'Inhaltsverzeichnis';

  @override
  String get tracklist => 'Titelliste';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografie';

  @override
  String get authorDetails => 'Autordetails';

  @override
  String get noOverviewAvailable =>
      'Für diesen Titel ist noch keine Übersicht verfügbar.';

  @override
  String get noBiographyAvailable =>
      'Für diesen Autor ist keine Biografie verfügbar.';

  @override
  String get noBooksFound => 'Keine Bücher für diesen Autor gefunden.';

  @override
  String get unableToLoadAuthorDetails =>
      'Autordetails konnten gerade nicht geladen werden.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Veröffentlichungsdatum unbekannt';

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
  String get view => 'Ansehen';

  @override
  String get resumeReading => 'Weiterlesen';

  @override
  String get read => 'Lesen';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Abspielen';

  @override
  String get startOver => 'Von vorn beginnen';

  @override
  String get restart => 'Neustart';

  @override
  String get readOffline => 'Offline lesen';

  @override
  String get playOffline => 'Offline abspielen';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Untertitel';

  @override
  String get version => 'Version';

  @override
  String get cast => 'Besetzung';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Abgeschlossen';

  @override
  String get favorited => 'Favorisiert';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Wiedergabeliste';

  @override
  String get downloaded => 'Heruntergeladen';

  @override
  String get downloadAll => 'Alle herunterladen';

  @override
  String get download => 'Herunterladen';

  @override
  String get deleteDownloaded => 'Download löschen';

  @override
  String get goToSeries => 'Zur Serie';

  @override
  String get editMetadata => 'Metadaten bearbeiten';

  @override
  String get less => 'Weniger';

  @override
  String get more => 'Mehr';

  @override
  String get deleteItem => 'Element löschen';

  @override
  String get deletePlaylist => 'Wiedergabeliste löschen';

  @override
  String get deletePlaylistMessage =>
      'Diese Wiedergabeliste vom Server löschen?';

  @override
  String get deleteItemMessage => 'Dieses Element vom Server löschen?';

  @override
  String get failedToDeletePlaylist =>
      'Wiedergabeliste konnte nicht gelöscht werden';

  @override
  String get failedToDeleteItem => 'Element konnte nicht gelöscht werden';

  @override
  String get renamePlaylist => 'Wiedergabeliste umbenennen';

  @override
  String get playlistName => 'Name der Wiedergabeliste';

  @override
  String get deleteDownloadedAlbum => 'Heruntergeladenes Album löschen';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Heruntergeladene Titel gelöscht';

  @override
  String get downloadedTracksDeleteFailed =>
      'Einige heruntergeladene Titel konnten nicht gelöscht werden';

  @override
  String get noTracksLoaded => 'Keine Titel geladen';

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
  String get itemDeleted => 'Element gelöscht';

  @override
  String get noPlayableTrailerFound => 'Kein abspielbarer Trailer gefunden.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Audiospur';

  @override
  String get subtitleTrack => 'Untertitelspur';

  @override
  String get none => 'Keine';

  @override
  String get downloadSubtitlesLabel => 'Untertitel herunterladen...';

  @override
  String get searchOpenSubtitlesPlugin => 'Mit dem OpenSubtitles-Plugin suchen';

  @override
  String get downloadSubtitles => 'Untertitel herunterladen';

  @override
  String get selectedSubtitleInvalid =>
      'Der ausgewählte Untertitel ist ungültig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Untertitel heruntergeladen. Es kann einen Moment dauern, bis er angezeigt wird, während Jellyfin das Element aktualisiert.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Version auswählen';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Alle herunterladen — Qualität';

  @override
  String get downloadQuality => 'Downloadqualität';

  @override
  String get originalFileNoReencoding => 'Originaldatei, ohne Neukodierung';

  @override
  String get originalFilesNoReencoding => 'Originaldateien, ohne Neukodierung';

  @override
  String get noEpisodesLoaded => 'Keine Episoden geladen';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Heruntergeladene Dateien löschen';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Heruntergeladene Dateien gelöscht';

  @override
  String get failedToDeleteFiles => 'Dateien konnten nicht gelöscht werden';

  @override
  String get deleteFiles => 'Dateien löschen';

  @override
  String get director => 'REGIE';

  @override
  String get writers => 'DREHBUCH';

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
  String get showLess => 'Weniger anzeigen';

  @override
  String get readMore => 'Mehr lesen';

  @override
  String get shuffle => 'Zufallswiedergabe';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Perfekte Übereinstimmung';

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
  String get deleteSeasonFiles =>
      'alle heruntergeladenen Episoden in dieser Staffel';

  @override
  String get stillWatching => 'Noch da?';

  @override
  String get unableToLoadTrailerStream =>
      'Trailer-Stream konnte nicht geladen werden.';

  @override
  String get trailerTimedOut => 'Zeitüberschreitung beim Laden des Trailers.';

  @override
  String get playbackFailedForTrailer =>
      'Wiedergabe für diesen Trailer fehlgeschlagen.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Streaming ist während der Offline-Wiedergabe nicht verfügbar.';

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
  String get deviceVolume => 'Gerätelautstärke';

  @override
  String get unavailable => 'Nicht verfügbar';

  @override
  String get pause => 'Pause';

  @override
  String get syncPosition => 'Position synchronisieren';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'Die Warteschlange ist leer';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Remote-Wiedergabe';

  @override
  String get castingToGoogleCast => 'Wird zu Google Cast übertragen';

  @override
  String get castingViaAirPlay => 'Wird über AirPlay übertragen';

  @override
  String get castingViaDlna => 'Wird über DLNA übertragen';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Zum Entsperren lange drücken';

  @override
  String get off => 'Aus';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automatisch';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Bitraten-Override';

  @override
  String get audioDelay => 'Audioverzögerung';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Untertitelverzögerung';

  @override
  String get reset => 'Zurücksetzen';

  @override
  String get unknown => 'Unbekannt';

  @override
  String get playbackInformation => 'Wiedergabe-Informationen';

  @override
  String get playback => 'Wiedergabe';

  @override
  String get playMethod => 'Wiedergabemethode';

  @override
  String get directPlay => 'Direktwiedergabe';

  @override
  String get directStream => 'Direkter Stream';

  @override
  String get transcoding => 'Transkodierung';

  @override
  String get transcodeReasons => 'Transkodierungsgründe';

  @override
  String get player => 'Spieler';

  @override
  String get container => 'Container';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Auflösung';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Video-Bitrate';

  @override
  String get track => 'Titel';

  @override
  String get channels => 'Kanäle';

  @override
  String get audioBitrate => 'Audio-Bitrate';

  @override
  String get sampleRate => 'Abtastrate';

  @override
  String get format => 'Format';

  @override
  String get external => 'Extern';

  @override
  String get embedded => 'Eingebettet';

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
      'EPUB-Darstellung in der App ist auf dieser Plattform noch nicht verfügbar.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Eingebettete Dokumentendarstellung ist auf dieser Plattform nicht verfügbar.';

  @override
  String get couldNotOpenExternalViewer =>
      'Externer Viewer konnte nicht geöffnet werden.';

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
      'Noch keine Lesezeichen.\nTippe beim Lesen auf das Lesezeichen-Symbol, um deine Position zu speichern.';

  @override
  String get noTableOfContentsAvailable => 'Kein Inhaltsverzeichnis verfügbar';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Position';

  @override
  String get bookReader => 'Buchleser';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Wird aktualisiert...';

  @override
  String get markUnread => 'Als ungelesen markieren';

  @override
  String get markAsRead => 'Als gelesen markieren';

  @override
  String get reloadReader => 'Reader neu laden';

  @override
  String get noPagesFound => 'Keine Seiten gefunden.';

  @override
  String get failedToDecodePageImage =>
      'Seitenbild konnte nicht dekodiert werden.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Einzelseite';

  @override
  String get twoPageSpread => 'Doppelseite';

  @override
  String get addBookmark => 'Lesezeichen hinzufügen';

  @override
  String get bookmarksEllipsis => 'Lesezeichen...';

  @override
  String get markedAsRead => 'Als gelesen markiert';

  @override
  String get markedAsUnread => 'Als ungelesen markiert';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Thema: System';

  @override
  String get themeLight => 'Thema: Hell';

  @override
  String get themeDark => 'Thema: Dunkel';

  @override
  String get themeSepia => 'Thema: Sepia';

  @override
  String get invertColorsFixedLayout => 'Farben invertieren (festes Layout)';

  @override
  String get invertColorsPdf => 'Farben invertieren (PDF)';

  @override
  String get preparingInAppReader => 'In-App-Reader wird vorbereitet...';

  @override
  String get pdfDataNotAvailable => 'PDF-Daten nicht verfügbar.';

  @override
  String get readerFallbackModeActive => 'Reader-Fallbackmodus aktiv';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Verwende „Reader neu laden“ nach dem Wechsel zu einem unterstützten Plattformziel (Android, iOS, macOS).';

  @override
  String get openExternally => 'Extern öffnen';

  @override
  String get noEpubChaptersFound => 'Keine EPUB-Kapitel gefunden.';

  @override
  String get readerNotReady => 'Reader nicht bereit.';

  @override
  String get seriesRecordings => 'Serienaufnahmen';

  @override
  String get now => 'Jetzt';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Nachrichten';

  @override
  String get kids => 'Kinder';

  @override
  String get premiere => 'Premiere';

  @override
  String get guideTimeline => 'Programmzeitleiste';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Keine Kanäle gefunden';

  @override
  String get liveBadge => 'LIVE';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Aus Lieblingskanälen entfernt';

  @override
  String get addedToFavoriteChannels => 'Zu Lieblingskanälen hinzugefügt';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Lieblingskanal konnte nicht aktualisiert werden';

  @override
  String get unfavoriteChannel => 'Kanal aus Favoriten entfernen';

  @override
  String get favoriteChannel => 'Kanal favorisieren';

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
  String get watch => 'Ansehen';

  @override
  String get close => 'Schließen';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Aufnahmen konnten nicht geladen werden';

  @override
  String get scheduledInNext24Hours => 'Geplant in den nächsten 24 Stunden';

  @override
  String get recentRecordings => 'Letzte Aufnahmen';

  @override
  String get tvSeries => 'TV-Serien';

  @override
  String get failedToLoadSchedule => 'Zeitplan konnte nicht geladen werden';

  @override
  String get noScheduledRecordings => 'Keine geplanten Aufnahmen';

  @override
  String get cancelRecording => 'Aufnahme abbrechen?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Nein';

  @override
  String get yesCancel => 'Ja, abbrechen';

  @override
  String get failedToCancelRecording =>
      'Aufnahme konnte nicht abgebrochen werden';

  @override
  String get failedToLoadSeriesRecordings =>
      'Serienaufnahmen konnten nicht geladen werden';

  @override
  String get noSeriesRecordings => 'Keine Serienaufnahmen';

  @override
  String get cancelSeriesRecording => 'Serienaufnahme abbrechen';

  @override
  String get cancelSeriesRecordingQuestion => 'Serienaufnahme abbrechen?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Serienaufnahme konnte nicht abgebrochen werden';

  @override
  String get searchThisLibrary => 'Diese Bibliothek durchsuchen...';

  @override
  String get searchEllipsis => 'Suchen...';

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
  String get seerrAccountType => 'Seerr-Kontotyp';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Lokal';

  @override
  String get savedMedia => 'Gespeicherte Medien';

  @override
  String get tvShows => 'TV-Sendungen';

  @override
  String get music => 'Musik';

  @override
  String get musicAlbums => 'Musikalben';

  @override
  String get noMediaInFilter => 'Keine Medien in diesem Filter';

  @override
  String get noDownloadedMediaYet => 'Noch keine heruntergeladenen Medien';

  @override
  String get browseLibrary => 'Bibliothek durchsuchen';

  @override
  String get deleteDownload => 'Download löschen';

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
  String get playAlbum => 'Album abspielen';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Staffel';

  @override
  String get errorLoadingEpisodes => 'Fehler beim Laden der Episoden';

  @override
  String get noDownloadedEpisodes => 'Keine heruntergeladenen Episoden';

  @override
  String get deleteEpisode => 'Episode löschen';

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
  String get seriesNotFound => 'Serie nicht gefunden';

  @override
  String get errorLoadingSeries => 'Fehler beim Laden der Serie';

  @override
  String get downloadedEpisodes => 'Heruntergeladene Episoden';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Sonderangebote';

  @override
  String get deleteSeason => 'Staffel löschen';

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
  String get storageManagement => 'Speicherverwaltung';

  @override
  String get storageBreakdown => 'Speicheraufschlüsselung';

  @override
  String get downloadedItems => 'Heruntergeladene Elemente';

  @override
  String get storageLimit => 'Speicherlimit';

  @override
  String get noLimit => 'Kein Limit';

  @override
  String get deleteAllDownloads => 'Alle Downloads löschen';

  @override
  String get deleteAllDownloadsWarning =>
      'Dadurch werden alle heruntergeladenen Mediendateien entfernt. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get deleteAll => 'Alle löschen';

  @override
  String get deleteSelected => 'Ausgewählte löschen';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Musik & Hörbücher';

  @override
  String get images => 'Bilder';

  @override
  String get database => 'Datenbank';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Einstellungen';

  @override
  String get authentication => 'Authentifizierung';

  @override
  String get autoLoginServerManagement =>
      'Automatische Anmeldung, Serververwaltung';

  @override
  String get pinCode => 'PIN-Code';

  @override
  String get setUpPinCodeProtection => 'PIN-Code-Schutz einrichten';

  @override
  String get parentalControls => 'Jugendschutz';

  @override
  String get contentRatingRestrictions => 'Altersfreigabe-Einschränkungen';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, Auflösung, Verhalten';

  @override
  String get languageSizeAppearance => 'Sprache, Größe, Erscheinungsbild';

  @override
  String get qualityStorage => 'Qualität, Speicher';

  @override
  String get serverSyncAndPluginStatus =>
      'Serversynchronisierung und Plugin-Status';

  @override
  String get mediaRequestIntegration => 'Medienanfragen-Integration';

  @override
  String get switchServer => 'Server wechseln';

  @override
  String get signOut => 'Abmelden';

  @override
  String get versionLicenses => 'Version, Lizenzen';

  @override
  String get account => 'Konto';

  @override
  String get signInAndSecurity => 'Anmeldung und Sicherheit';

  @override
  String get administration => 'Verwaltung';

  @override
  String get serverSettingsUsersLibraries =>
      'Servereinstellungen, Benutzer, Bibliotheken';

  @override
  String get customization => 'Anpassung';

  @override
  String get themeAndLayout => 'Thema und Layout';

  @override
  String get videoAndSubtitles => 'Video und Untertitel';

  @override
  String get integrations => 'Integrationen';

  @override
  String get pluginAndRequests => 'Plugin und Anfragen';

  @override
  String get customizeAccountPlaybackInterface =>
      'Konto, Wiedergabe und Oberfläche anpassen';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Thema & Erscheinungsbild';

  @override
  String get focusBorderColor => 'Fokusrahmenfarbe';

  @override
  String get watchedIndicators => 'Gesehen-Indikatoren';

  @override
  String get always => 'Immer';

  @override
  String get hideUnwatched => 'Nicht Gesehene ausblenden';

  @override
  String get episodesOnly => 'Nur Episoden';

  @override
  String get never => 'Nie';

  @override
  String get focusExpansionAnimation => 'Fokus-Vergrößerungsanimation';

  @override
  String get desktopUiScale => 'Desktop-UI-Skalierung';

  @override
  String get scaleFocusedCards =>
      'Fokussierte oder überfahrene Karten und Kacheln vergrößern';

  @override
  String get backgroundBackdrops => 'Hintergrundbilder';

  @override
  String get showBackdropImages => 'Hintergrundbilder hinter Inhalten anzeigen';

  @override
  String get seriesThumbnails => 'Serien-Miniaturbilder';

  @override
  String get seriesThumbnailsDescription =>
      'Nur Episoden: Serienbilder verwenden, die zum Bildtyp jeder Reihe passen';

  @override
  String get homeRowInfoOverlay => 'Startseiten-Info-Overlay';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Titel und Metadaten beim Durchstöbern der Startseite anzeigen';

  @override
  String get clockDisplay => 'Uhranzeige';

  @override
  String get inMenus => 'In Menüs';

  @override
  String get inVideo => 'Im Video';

  @override
  String get seasonalEffects => 'Saisonale Effekte';

  @override
  String get seasonalEffectsDescription =>
      'Visuelle Effekte und saisonale Dekorationen';

  @override
  String get snow => 'Schnee';

  @override
  String get fireworks => 'Feuerwerk';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Fallende Blätter';

  @override
  String get themeMusic => 'Titelmusik';

  @override
  String get playThemeMusicOnDetailPages =>
      'Titelmusik auf Detailseiten abspielen';

  @override
  String get themeMusicVolume => 'Titelmusik-Lautstärke';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Titelmusik auf der Startseite';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Beim Durchstöbern der Startseite abspielen';

  @override
  String get detailsBackgroundBlur => 'Detail-Hintergrundunschärfe';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Stöbern-Hintergrundunschärfe';

  @override
  String get maxStreamingBitrate => 'Maximale Streaming-Bitrate';

  @override
  String get maxResolution => 'Maximale Auflösung';

  @override
  String get playerZoomMode => 'Player-Zoommodus';

  @override
  String get fit => 'Einpassen';

  @override
  String get autoCrop => 'Automatisch zuschneiden';

  @override
  String get stretch => 'Strecken';

  @override
  String get refreshRateSwitching => 'Bildwiederholrate-Umschaltung';

  @override
  String get disabled => 'Deaktiviert';

  @override
  String get scaleOnTv => 'Auf TV skalieren';

  @override
  String get scaleOnDevice => 'Auf Gerät skalieren';

  @override
  String get trickPlay => 'Trickspiel';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Vorschaubilder beim Spulen anzeigen';

  @override
  String get showDescriptionOnPause => 'Beschreibung bei Pause anzeigen';

  @override
  String get dimVideoShowOverview =>
      'Video abdunkeln und Übersichtstext bei Pause anzeigen';

  @override
  String get osdLockButton => 'OSD-Sperrtaste';

  @override
  String get osdLockButtonDescription =>
      'Sperrtaste anzeigen, die Touch-Eingaben blockiert, bis lange gedrückt wird';

  @override
  String get audioBehavior => 'Audio-Verhalten';

  @override
  String get downmixToStereo => 'Auf Stereo heruntermischen';

  @override
  String get defaultAudioLanguage => 'Standard-Audiosprache';

  @override
  String get autoServerDefault => 'Automatisch (Serverstandard)';

  @override
  String get english => 'Englisch';

  @override
  String get spanish => 'Spanisch';

  @override
  String get french => 'Französisch';

  @override
  String get german => 'Deutsch';

  @override
  String get italian => 'Italienisch';

  @override
  String get portuguese => 'Portugiesisch';

  @override
  String get japanese => 'Japanisch';

  @override
  String get korean => 'Koreanisch';

  @override
  String get chinese => 'Chinesisch';

  @override
  String get russian => 'Russisch';

  @override
  String get arabic => 'Arabisch';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Niederländisch';

  @override
  String get swedish => 'Schwedisch';

  @override
  String get norwegian => 'Norwegisch';

  @override
  String get danish => 'Dänisch';

  @override
  String get finnish => 'Finnisch';

  @override
  String get polish => 'Polnisch';

  @override
  String get ac3Passthrough => 'AC3-Durchleitung';

  @override
  String get dtsPassthrough => 'DTS-Passthrough';

  @override
  String get trueHdSupport => 'TrueHD-Unterstützung';

  @override
  String get enableDtsPassthrough =>
      'Bitstream nur DTS-Audio an AVR; erfordert Empfängerunterstützung und DTS-Quellspur';

  @override
  String get enableTrueHdAudio =>
      'TrueHD-Audio aktivieren (funktioniert möglicherweise nicht auf allen Plattformen)';

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
  String get nightMode => 'Nachtmodus';

  @override
  String get compressDynamicRange => 'Dynamikbereich komprimieren';

  @override
  String get advancedMpv => 'Erweitertes mpv';

  @override
  String get enableCustomMpvConf => 'Benutzerdefinierte mpv.conf aktivieren';

  @override
  String get applyMpvConfBeforePlayback =>
      'Eine benutzerdefinierte mpv.conf vor der Wiedergabe anwenden';

  @override
  String get unsafeAdvancedMpvOptions => 'Unsichere erweiterte mpv-Optionen';

  @override
  String get unsafeMpvOptionsDescription =>
      'Erweiterte mpv-Optionen zulassen. Kann das Wiedergabeverhalten beeinträchtigen.';

  @override
  String get hardwareDecoding => 'Hardware-Dekodierung';

  @override
  String get hardwareDecodingSubtitle =>
      'Kann die Leistung verbessern, kann aber auf einigen Geräten zu Wiedergabeproblemen führen.';

  @override
  String get nextUpAndQueuing => 'Als Nächstes & Warteschlange';

  @override
  String get nextUpDisplay => 'Nächstes-Verhalten';

  @override
  String get extended => 'Erweitert';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Nächstes-Timeout';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Medien-Warteschlange';

  @override
  String get autoQueueNextEpisodes => 'Nächste Episoden automatisch einreihen';

  @override
  String get stillWatchingPrompt => 'Noch-da-Abfrage';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Fortsetzen & Überspringen';

  @override
  String get resumeRewind => 'Zurückspulen beim Fortsetzen';

  @override
  String get unpauseRewind => 'Unterbrechen Sie die Pause des Rücklaufs';

  @override
  String get fiveSeconds => '5 Sekunden';

  @override
  String get tenSeconds => '10 Sekunden';

  @override
  String get fifteenSeconds => '15 Sekunden';

  @override
  String get thirtySeconds => '30 Sekunden';

  @override
  String get skipBackLength => 'Rücksprunglänge';

  @override
  String get skipForwardLength => 'Vorsprunglänge';

  @override
  String get customMpvConfPath => 'Benutzerdefinierter mpv.conf-Pfad';

  @override
  String get notSetMpvConf =>
      'Nicht gesetzt. Moonfin versucht eine Standard-mpv.conf in App-/Datenordnern.';

  @override
  String get selectMpvConf => 'mpv.conf auswählen';

  @override
  String get pathToMpvConf => '/pfad/zu/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Stileinstellungen (Größe, Farbe, Versatz) gelten für textbasierte Untertitel (SRT, VTT, TTML). ASS/SSA-Untertitel verwenden ihre eigene eingebettete Formatierung, es sei denn „ASS/SSA-Direktwiedergabe“ ist deaktiviert. Bitmap-Untertitel (PGS, DVB, VobSub) können nicht umformatiert werden.';

  @override
  String get defaultSubtitleLanguage => 'Standard-Untertitelsprache';

  @override
  String get defaultToNoSubtitles => 'Standardmäßig keine Untertitel';

  @override
  String get turnOffSubtitlesByDefault =>
      'Untertitel standardmäßig ausschalten';

  @override
  String get subtitleSize => 'Untertitelgröße';

  @override
  String get textFillColor => 'Textfüllfarbe';

  @override
  String get backgroundColor => 'Hintergrundfarbe';

  @override
  String get textStrokeColor => 'Textstrichfarbe';

  @override
  String get subtitleCustomization => 'Untertitelanpassung';

  @override
  String get subtitleCustomizationDescription =>
      'Passen Sie das Erscheinungsbild der Untertitel an';

  @override
  String get subtitlePreviewText =>
      'Der schnelle Braunfuchs springt über den faulen Hund';

  @override
  String get verticalOffset => 'Vertikaler Versatz';

  @override
  String get pgsDirectPlay => 'PGS-Direktwiedergabe';

  @override
  String get directPlayPgsSubtitles => 'PGS-Untertitel direkt wiedergeben';

  @override
  String get assSsaDirectPlay => 'ASS/SSA-Direktwiedergabe';

  @override
  String get directPlayAssSsaSubtitles =>
      'ASS/SSA-Untertitel direkt wiedergeben';

  @override
  String get white => 'Weiß';

  @override
  String get black => 'Schwarz';

  @override
  String get yellow => 'Gelb';

  @override
  String get green => 'Grün';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Rot';

  @override
  String get transparent => 'Transparent';

  @override
  String get semiTransparentBlack => 'Halbtransparentes Schwarz';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Mobil';

  @override
  String get tv => 'Fernseher';

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
  String get customizationProfile => 'Anpassungsprofil';

  @override
  String get customizationProfileDescription =>
      'Wähle das Profil zum Laden, Bearbeiten und Synchronisieren. Global gilt überall, sofern kein Geräteprofil es überschreibt. Der grüne Punkt markiert dein aktuelles Geräteprofil.';

  @override
  String get loadProfile => 'Profil laden';

  @override
  String get syncing => 'Synchronisiere...';

  @override
  String get syncToProfile => 'Zum Profil synchronisieren';

  @override
  String get profileSyncHidden => 'Profilsynchronisierung ausgeblendet';

  @override
  String get enablePluginSyncDescription =>
      'Aktiviere die Server-Plugin-Synchronisierung in den Plugin-Einstellungen, um hier Profilsteuerungen anzuzeigen.';

  @override
  String get quality => 'Qualität';

  @override
  String get defaultDownloadQuality => 'Standard-Downloadqualität';

  @override
  String get network => 'Netzwerk';

  @override
  String get wifiOnlyDownloads => 'Nur über WLAN herunterladen';

  @override
  String get onlyDownloadOnWifi => 'Nur herunterladen, wenn mit WLAN verbunden';

  @override
  String get storage => 'Speicher';

  @override
  String get storageUsed => 'Genutzter Speicher';

  @override
  String get manage => 'Verwalten';

  @override
  String get calculating => 'Wird berechnet...';

  @override
  String get downloadLocation => 'Speicherort';

  @override
  String get defaultLabel => 'Standard';

  @override
  String get saveToDownloadsFolder => 'Im Downloads-Ordner speichern';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin — für andere Apps sichtbar';

  @override
  String get dangerZone => 'Gefahrenzone';

  @override
  String get clearAllDownloads => 'Alle Downloads löschen';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Speicherort ändern';

  @override
  String get changeDownloadLocationDescription =>
      'Neue Downloads werden im ausgewählten Ordner gespeichert. Bestehende Downloads verbleiben an ihrem aktuellen Speicherort und können in den Speichereinstellungen verwaltet werden.';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get cannotWriteToFolder =>
      'In den ausgewählten Ordner kann nicht geschrieben werden. Bitte wähle einen anderen Speicherort oder erteile Speicherberechtigungen.';

  @override
  String get saveToDownloadsFolderQuestion => 'Im Downloads-Ordner speichern?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Heruntergeladene Medien werden im Downloads/Moonfin-Ordner auf deinem Gerät gespeichert. Diese Dateien sind für andere Apps wie deine Galerie oder deinen Musikplayer sichtbar.\n\nBestehende Downloads verbleiben an ihrem aktuellen Speicherort.';

  @override
  String get enable => 'Aktivieren';

  @override
  String get clearAllDownloadsWarning =>
      'Dadurch werden alle heruntergeladenen Medien gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get clearAll => 'Alle löschen';

  @override
  String get navigationStyle => 'Navigationsstil';

  @override
  String get topBar => 'Obere Leiste';

  @override
  String get leftSidebar => 'Linke Seitenleiste';

  @override
  String get showShuffleButton => 'Zufallswiedergabe-Schaltfläche anzeigen';

  @override
  String get showGenresButton => 'Genre-Schaltfläche anzeigen';

  @override
  String get showFavoritesButton => 'Favoriten-Schaltfläche anzeigen';

  @override
  String get showLibrariesInToolbar =>
      'Bibliotheken in der Symbolleiste anzeigen';

  @override
  String get navbarOpacity => 'Navigationsleisten-Transparenz';

  @override
  String get navbarColor => 'Navigationsleisten-Farbe';

  @override
  String get gray => 'Grau';

  @override
  String get darkBlue => 'Dunkelblau';

  @override
  String get purple => 'Lila';

  @override
  String get teal => 'Blaugrün';

  @override
  String get navy => 'Marineblau';

  @override
  String get charcoal => 'Anthrazit';

  @override
  String get brown => 'Braun';

  @override
  String get darkRed => 'Dunkelrot';

  @override
  String get darkGreen => 'Dunkelgrün';

  @override
  String get slate => 'Schiefergrau';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Bibliotheksanzeige';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniaturansicht';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings =>
      'Pro-Bibliothek-Einstellungen überschreiben';

  @override
  String get applyImageTypeToAllLibraries =>
      'Bildtyp auf alle Bibliotheken anwenden';

  @override
  String get multiServerLibraries => 'Multi-Server-Bibliotheken';

  @override
  String get showLibrariesFromAllServers =>
      'Bibliotheken von allen verbundenen Servern anzeigen';

  @override
  String get enableFolderView => 'Ordneransicht aktivieren';

  @override
  String get showFolderBrowsingOption => 'Ordner-Durchsuchen-Option anzeigen';

  @override
  String get libraryVisibility => 'Bibliothekssichtbarkeit';

  @override
  String get libraryVisibilityDescription =>
      'Schalten Sie die Sichtbarkeit der Startseite pro Bibliothek um. Starten Sie Moonfin neu, damit die Änderungen wirksam werden.';

  @override
  String get showInNavigation => 'In Navigation anzeigen';

  @override
  String get showInLatestMedia => 'In „Neueste Medien“ anzeigen';

  @override
  String get sourceLibraries => 'Quellbibliotheken';

  @override
  String get sourceCollections => 'Quellsammlungen';

  @override
  String get excludedGenres => 'Ausgeschlossene Genres';

  @override
  String get selectAll => 'Alle auswählen';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Medienleiste';

  @override
  String get mediaSources => 'Medienquellen';

  @override
  String get behavior => 'Verhalten';

  @override
  String get seconds => 'Sekunden';

  @override
  String get localPreviews => 'Lokale Vorschauen';

  @override
  String get localPreviewsDescription =>
      'Konfigurieren Sie Trailer-, Medien- und Audiovorschauen.';

  @override
  String get mediaBarMode => 'Stil der Medienleiste';

  @override
  String get mediaBarModeDescription =>
      'Zwischen Moonfin, MakD oder Aus fur die Medienleiste wahlen';

  @override
  String get mediaBarModeMoonfin => 'Mondflosse';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Aus';

  @override
  String get enableMediaBar => 'Medienleiste aktivieren';

  @override
  String get showFeaturedContentSlideshow =>
      'Empfohlene Inhalte als Diashow auf der Startseite anzeigen';

  @override
  String get contentType => 'Inhaltstyp';

  @override
  String get moviesAndTvShows => 'Filme & TV-Sendungen';

  @override
  String get moviesOnly => 'Nur Filme';

  @override
  String get tvShowsOnly => 'Nur TV-Sendungen';

  @override
  String get itemCount => 'Anzahl der Elemente';

  @override
  String get noneSelected => 'Keine ausgewählt';

  @override
  String get noneExcluded => 'Keine ausgeschlossen';

  @override
  String get autoAdvance => 'Automatisch weiterschalten';

  @override
  String get autoAdvanceSlides =>
      'Automatisch zur nächsten Folie weiterschalten';

  @override
  String get autoAdvanceInterval =>
      'Intervall für automatisches Weiterschalten';

  @override
  String get trailerPreview => 'Trailervorschau';

  @override
  String get autoPlayTrailers =>
      'Trailer in der Medienleiste nach 3 Sekunden automatisch abspielen';

  @override
  String get episodePreview => 'Episodenvorschau';

  @override
  String get mediaPreview => 'Medienvorschau';

  @override
  String get episodePreviewDescription =>
      '30-Sekunden-Inline-Vorschau bei fokussierten, überfahrenen oder lange gedrückten Karten abspielen';

  @override
  String get mediaPreviewDescription =>
      'Spielen Sie eine 30-sekündige Inline-Vorschau auf fokussierten, schwebenden oder lange gedrückten Karten ab';

  @override
  String get previewAudio => 'Vorschau-Audio';

  @override
  String get enablePreviewAudio =>
      'Audio für Trailer- und Episodenvorschauen aktivieren';

  @override
  String get latestMedia => 'Neueste Medien';

  @override
  String get recentlyReleased => 'Kürzlich veröffentlicht';

  @override
  String get myMedia => 'Meine Medien';

  @override
  String get myMediaSmall => 'Meine Medien (Klein)';

  @override
  String get continueWatching => 'Weiterschauen';

  @override
  String get resumeAudio => 'Audio fortsetzen';

  @override
  String get resumeBooks => 'Bücher fortsetzen';

  @override
  String get activeRecordings => 'Aktive Aufnahmen';

  @override
  String get playlists => 'Wiedergabelisten';

  @override
  String get liveTV => 'Live-TV';

  @override
  String get homeSections => 'Startseiten-Bereiche';

  @override
  String get resetToDefaults => 'Auf Standard zurücksetzen';

  @override
  String get homeRowPosterSize => 'Startseiten-Postergröße';

  @override
  String get perRowImageTypeSelection => 'Bildtypauswahl pro Reihe';

  @override
  String get configureImageTypeForEachRow =>
      'Bildtyp für jede aktivierte Startseitenreihe konfigurieren';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Weiterschauen und Als Nächstes zusammenführen';

  @override
  String get combineBothRows =>
      'Beide Reihen in einen Startseitenbereich zusammenführen';

  @override
  String get perRowImageType => 'Bildtyp pro Reihe';

  @override
  String get perRowSettings => 'Einstellungen pro Reihe';

  @override
  String get autoLogin => 'Automatische Anmeldung';

  @override
  String get lastUser => 'Letzter Benutzer';

  @override
  String get specificUser => 'Bestimmter Benutzer';

  @override
  String get alwaysAuthenticate => 'Immer authentifizieren';

  @override
  String get requirePasswordWithToken =>
      'Passwort auch mit gespeichertem Token anfordern';

  @override
  String get confirmExit => 'Beenden bestätigen';

  @override
  String get showConfirmationBeforeExiting =>
      'Bestätigung vor dem Beenden anzeigen';

  @override
  String get blockContentWithRatings =>
      'Inhalte mit folgenden Altersfreigaben blockieren:';

  @override
  String get noContentRatingsFound =>
      'Auf diesem Server wurden noch keine Altersfreigaben gefunden.';

  @override
  String get couldNotLoadServerRatings =>
      'Serverbewertungen konnten nicht geladen werden. Es werden nur gespeicherte Bewertungen angezeigt.';

  @override
  String get couldNotRefreshRatings =>
      'Bewertungen vom Server konnten nicht aktualisiert werden. Es werden gespeicherte Bewertungen angezeigt.';

  @override
  String get enablePinCode => 'PIN-Code aktivieren';

  @override
  String get requirePinToAccess =>
      'PIN für den Zugriff auf dein Konto erforderlich';

  @override
  String get changePin => 'PIN ändern';

  @override
  String get setNewPinCode => 'Neuen PIN-Code festlegen';

  @override
  String get removePin => 'PIN entfernen';

  @override
  String get removePinProtection => 'PIN-Code-Schutz entfernen';

  @override
  String get screensaver => 'Bildschirmschoner';

  @override
  String get inAppScreensaver => 'In-App-Bildschirmschoner';

  @override
  String get enableBuiltInScreensaver =>
      'Integrierten Bildschirmschoner aktivieren';

  @override
  String get mode => 'Modus';

  @override
  String get libraryArt => 'Bibliothekskunst';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Uhr';

  @override
  String get timeout => 'Zeitüberschreitung';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Abdunklungsstufe';

  @override
  String get maxAgeRating => 'Maximale Altersfreigabe';

  @override
  String get any => 'Beliebig';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Altersfreigabe erforderlich';

  @override
  String get onlyShowRatedContent => 'Nur bewertete Inhalte anzeigen';

  @override
  String get showClock => 'Uhr anzeigen';

  @override
  String get displayClockDuringScreensaver =>
      'Uhr während des Bildschirmschoners anzeigen';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Kritiker)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Publikum)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metakritisch';

  @override
  String get metacriticUser => 'Metacritic (Benutzer)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Briefkastend';

  @override
  String get myAnimeList => 'MeineAnimeListe';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Community-Bewertung';

  @override
  String get ratings => 'Bewertungen';

  @override
  String get additionalRatings => 'Zusätzliche Bewertungen';

  @override
  String get showMdbListAndTmdbRatings =>
      'MDBList- und TMDB-Bewertungen anzeigen';

  @override
  String get ratingLabels => 'Bewertungslabels';

  @override
  String get showLabelsNextToIcons =>
      'Labels neben Bewertungssymbolen anzeigen';

  @override
  String get ratingBadges => 'Bewertungsabzeichen';

  @override
  String get showDecorativeBadges =>
      'Dekorative Abzeichen hinter Bewertungen anzeigen';

  @override
  String get episodeRatings => 'Episodenbewertungen';

  @override
  String get showRatingsOnEpisodes =>
      'Bewertungen bei einzelnen Episoden anzeigen';

  @override
  String get ratingSources => 'Bewertungsquellen';

  @override
  String get ratingSourcesDescription =>
      'Bewertungsquellen aktivieren und neu anordnen, die in der App angezeigt werden';

  @override
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Plugin erkannt';

  @override
  String get pluginNotDetected => 'Plugin nicht erkannt';

  @override
  String get pluginDetectedDescription =>
      'Server-Plugin erkannt. Synchronisierung wird beim ersten Fund automatisch aktiviert.';

  @override
  String get pluginNotDetectedDescription =>
      'Server-Plugin nicht erkannt. Lokale Einstellungen verwenden weiterhin gespeicherte Werte oder eingebaute Standards.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Verfügbare Dienste';

  @override
  String get serverPluginSync => 'Server-Plugin-Synchronisierung';

  @override
  String get syncSettingsWithPlugin =>
      'Einstellungen mit dem Server-Plugin synchronisieren';

  @override
  String get whatSyncControls => 'Was Synchronisierung steuert';

  @override
  String get syncControlsDescription =>
      'Synchronisierung steuert nur, ob Plugin-gestützte Einstellungen zum und vom Server übertragen werden. Profilauswahl und Profilsynchronisierungsaktionen befinden sich in den Anpassungseinstellungen, wenn Plugin-Sync aktiviert ist.';

  @override
  String get recentRequests => 'Letzte Anfragen';

  @override
  String get recentlyAdded => 'Kürzlich hinzugefügt';

  @override
  String get trending => 'Im Trend';

  @override
  String get popularMovies => 'Beliebte Filme';

  @override
  String get movieGenres => 'Film-Genres';

  @override
  String get upcomingMovies => 'Kommende Filme';

  @override
  String get studios => 'Studios';

  @override
  String get popularSeries => 'Beliebte Serien';

  @override
  String get seriesGenres => 'Serien-Genres';

  @override
  String get upcomingSeries => 'Kommende Serien';

  @override
  String get networks => 'Netzwerke';

  @override
  String get resetRowsToDefaults => 'Reihen auf Standard zurücksetzen';

  @override
  String get enableSeerr => 'Seerr aktivieren';

  @override
  String get showSeerrInNavigation =>
      'Seerr in der Navigation anzeigen (erfordert Server-Plugin)';

  @override
  String get seerrUnavailable =>
      'Nicht verfügbar, da die Seerr-Unterstützung des Server-Plugins deaktiviert ist.';

  @override
  String get nsfwFilter => 'NSFW-Filter';

  @override
  String get hideAdultContent =>
      'Inhalte für Erwachsene in Ergebnissen ausblenden';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Entdecken-Reihen';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Zum Neuordnen ziehen. Reihen aktivieren oder deaktivieren. Die Reihenfolge wird mit dem Moonfin-Plugin synchronisiert.';

  @override
  String get discoverRowsDescription =>
      'Zum Neuordnen ziehen. Reihen aktivieren oder deaktivieren.';

  @override
  String get enabled => 'Aktiviert';

  @override
  String get hidden => 'Ausgeblendet';

  @override
  String get aboutTitle => 'Über';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Open-Source-Lizenzen';

  @override
  String get sourceCode => 'Quellcode';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Jetzt nach Updates suchen';

  @override
  String get checksLatestDesktopRelease =>
      'Prüft die neueste Desktop-Version für diese Plattform';

  @override
  String get youAreUpToDate => 'Du bist auf dem neuesten Stand.';

  @override
  String get couldNotCheckForUpdates =>
      'Es konnte gerade nicht nach Updates gesucht werden.';

  @override
  String get noCompatibleUpdate =>
      'Kein kompatibles Update-Paket für diese Plattform gefunden.';

  @override
  String get updateChecksNotSupported =>
      'Update-Prüfungen werden auf dieser Plattform nicht unterstützt.';

  @override
  String get updateNotificationsDisabled =>
      'Update-Benachrichtigungen sind deaktiviert.';

  @override
  String get pleaseWaitBeforeChecking => 'Bitte warte, bevor du erneut prüfst.';

  @override
  String get latestUpdateAlreadyShown =>
      'Das neueste Update wurde bereits angezeigt.';

  @override
  String get updateAvailable => 'Update verfügbar.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Update-Benachrichtigungen';

  @override
  String get showWhenUpdatesAvailable =>
      'Anzeigen, wenn Updates verfügbar sind';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Lesen Sie die Versionshinweise';

  @override
  String get downloadingUpdate => 'Update wird heruntergeladen...';

  @override
  String get updateDownloadFailed =>
      'Der Update-Download ist fehlgeschlagen. Bitte versuchen Sie es erneut.';

  @override
  String get openReleasesPage => 'Öffnen Sie die Seite „Veröffentlichungen“.';

  @override
  String get navigation => 'Navigation';

  @override
  String get watchedIndicatorsBackdrops =>
      'Gesehen-Indikatoren, Hintergrundbilder';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Fokusfarbe, Gesehen-Indikatoren, Hintergrundbilder';

  @override
  String get navbarStyleToolbarAppearance =>
      'Navigationsleiste, Symbole, Erscheinungsbild';

  @override
  String get reorderToggleHomeRows =>
      'Startseitenreihen neu anordnen und umschalten';

  @override
  String get featuredContentAppearance =>
      'Empfohlene Inhalte, Erscheinungsbild';

  @override
  String get posterSizeImageTypeFolderView =>
      'Postergröße, Bildtyp, Ordneransicht';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB und Bewertungsquellen';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Leeren';

  @override
  String get browse => 'Durchsuchen';

  @override
  String get noResults => 'Keine Ergebnisse';

  @override
  String get seerrAvailableStatus => 'Verfügbar';

  @override
  String get seerrRequestedStatus => 'Angefragt';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Seerr-Einstellungen';

  @override
  String get requestMore => 'Mehr anfordern';

  @override
  String get request => 'Anfordern';

  @override
  String get cancelRequest => 'Anfrage abbrechen';

  @override
  String get playInMoonfin => 'In Moonfin abspielen';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Genehmigen';

  @override
  String get declineAction => 'Ablehnen';

  @override
  String get similar => 'Ähnlich';

  @override
  String get recommendations => 'Empfehlungen';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Behalten';

  @override
  String get itemNotFoundInLibrary =>
      'Element nicht in deiner Moonfin-Bibliothek gefunden';

  @override
  String get errorSearchingLibrary => 'Fehler bei der Bibliothekssuche';

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
  String get submitRequest => 'Anfrage absenden';

  @override
  String get allSeasons => 'Alle Staffeln';

  @override
  String get advancedOptions => 'Erweiterte Optionen';

  @override
  String get noServiceServersConfigured => 'Keine Dienstserver konfiguriert';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Qualitätsprofil';

  @override
  String get rootFolder => 'Stammordner';

  @override
  String get showMore => 'Mehr anzeigen';

  @override
  String get appearances => 'Auftritte';

  @override
  String get crewSection => 'Crew';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Keine Anfragen';

  @override
  String get pendingStatus => 'Ausstehend';

  @override
  String get declinedStatus => 'Abgelehnt';

  @override
  String get partiallyAvailable => 'Teilweise verfügbar';

  @override
  String get downloadingStatus => 'Wird heruntergeladen';

  @override
  String get approvedStatus => 'Genehmigt';

  @override
  String get notRequestedStatus => 'Nicht angefordert';

  @override
  String get blocklistedStatus => 'Auf der Sperrliste';

  @override
  String get deletedStatus => 'Gelöscht';

  @override
  String get tmdbScore => 'TMDB-Score';

  @override
  String get releaseDateLabel => 'Veröffentlichungsdatum';

  @override
  String get firstAirDateLabel => 'Erstausstrahlungsdatum';

  @override
  String get revenueLabel => 'Einnahmen';

  @override
  String get runtimeLabel => 'Laufzeit';

  @override
  String get budgetLabel => 'Budget';

  @override
  String get originalLanguageLabel => 'Originalsprache';

  @override
  String get seasonsLabel => 'Jahreszeiten';

  @override
  String get episodesLabel => 'Episoden';

  @override
  String get access => 'Zugriff';

  @override
  String get add => 'Hinzufügen';

  @override
  String get address => 'Adresse';

  @override
  String get analytics => 'Analyse';

  @override
  String get catalog => 'Katalog';

  @override
  String get content => 'Inhalt';

  @override
  String get copy => 'Kopieren';

  @override
  String get create => 'Erstellen';

  @override
  String get disable => 'Deaktivieren';

  @override
  String get done => 'Fertig';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get encoding => 'Kodierung';

  @override
  String get error => 'Fehler';

  @override
  String get forward => 'Vorwärts';

  @override
  String get general => 'Allgemein';

  @override
  String get go => 'Los';

  @override
  String get install => 'Installieren';

  @override
  String get installed => 'Installiert';

  @override
  String get interval => 'Intervall';

  @override
  String get name => 'Name';

  @override
  String get networking => 'Netzwerk';

  @override
  String get next => 'Weiter';

  @override
  String get path => 'Pfad';

  @override
  String get paused => 'Angehalten';

  @override
  String get permissions => 'Berechtigungen';

  @override
  String get processing => 'Verarbeitung';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Anbieter';

  @override
  String get refresh => 'Aktualisieren';

  @override
  String get remote => 'Fernbedienung';

  @override
  String get rename => 'Umbenennen';

  @override
  String get revoke => 'Widerrufen';

  @override
  String get role => 'Rolle';

  @override
  String get root => 'Stammverzeichnis';

  @override
  String get run => 'Ausführen';

  @override
  String get search => 'Suche';

  @override
  String get select => 'Auswählen';

  @override
  String get send => 'Senden';

  @override
  String get sessions => 'Sitzungen';

  @override
  String get set => 'Festlegen';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Stoppen';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Zeit';

  @override
  String get trickplay => 'Trickspiel';

  @override
  String get uninstall => 'Deinstallieren';

  @override
  String get up => 'Hoch';

  @override
  String get update => 'Aktualisieren';

  @override
  String get upload => 'Hochladen';

  @override
  String get unmute => 'Stummschaltung aufheben';

  @override
  String get mute => 'Stummschalten';

  @override
  String get branding => 'Branding';

  @override
  String get adminDrawerDashboard => 'Armaturenbrett';

  @override
  String get adminDrawerAnalytics => 'Analyse';

  @override
  String get adminDrawerSettings => 'Einstellungen';

  @override
  String get adminDrawerBranding => 'Branding';

  @override
  String get adminDrawerUsers => 'Benutzer';

  @override
  String get adminDrawerLibraries => 'Bibliotheken';

  @override
  String get adminDrawerTranscoding => 'Transkodierung';

  @override
  String get adminDrawerResume => 'Fortsetzen';

  @override
  String get adminDrawerStreaming => 'Studios';

  @override
  String get adminDrawerTrickplay => 'Trickspiel';

  @override
  String get adminDrawerDevices => 'Geräte';

  @override
  String get adminDrawerActivity => 'Aktivität';

  @override
  String get adminDrawerNetworking => 'Netzwerk';

  @override
  String get adminDrawerApiKeys => 'API-Schlüssel';

  @override
  String get adminDrawerBackups => 'Backups';

  @override
  String get adminDrawerLogs => 'Protokolle';

  @override
  String get adminDrawerScheduledTasks => 'Geplante Aufgaben';

  @override
  String get adminDrawerPlugins => 'Plugins';

  @override
  String get adminDrawerRepositories => 'Repositories';

  @override
  String get adminDrawerLiveTv => 'Live-TV';

  @override
  String get adminExitTooltip => 'Admin verlassen';

  @override
  String get adminDashboardLoadFailed =>
      'Dashboard konnte nicht geladen werden';

  @override
  String get adminMediaOverview => 'Medienübersicht';

  @override
  String get adminMediaTotalsError =>
      'Server-Medienstatistiken konnten nicht geladen werden.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Ein kurzer Überblick über die Inhalte auf diesem Server.';

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
  String get analyticsMediaDistribution => 'Medienverteilung';

  @override
  String get analyticsVideoCodecs => 'Video-Codecs';

  @override
  String get analyticsAudioCodecs => 'Audio-Codecs';

  @override
  String get analyticsContainers => 'Container';

  @override
  String get analyticsTopGenres => 'Top-Genres';

  @override
  String get analyticsReleaseYears => 'Erscheinungsjahre';

  @override
  String get analyticsContentRatings => 'Altersfreigaben';

  @override
  String get analyticsRuntimeBuckets => 'Laufzeitgruppen';

  @override
  String get analyticsFileFormats => 'Dateiformate';

  @override
  String get analyticsNoData => 'Keine Daten verfügbar.';

  @override
  String get adminServerInfo => 'Serverinformationen';

  @override
  String get adminRestartPending => 'Neustart ausstehend';

  @override
  String get adminServerPaths => 'Serverpfade';

  @override
  String get adminServerActions => 'Serveraktionen';

  @override
  String get adminRestartServer => 'Server neu starten';

  @override
  String get adminShutdownServer => 'Server herunterfahren';

  @override
  String get adminScanLibraries => 'Bibliotheken scannen';

  @override
  String get adminLibraryScanStarted => 'Bibliotheksscan gestartet';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Server-Neustart wird durchgeführt';

  @override
  String get adminServerRebootMessage =>
      'Server-Neustart wird durchgeführt, bitte starte Moonfin neu';

  @override
  String get adminActiveSessions => 'Aktive Sitzungen';

  @override
  String get adminSessionsLoadFailed =>
      'Sitzungen konnten nicht geladen werden';

  @override
  String get adminNoActiveSessions => 'Keine aktiven Sitzungen';

  @override
  String get adminRecentActivity => 'Letzte Aktivität';

  @override
  String get adminNoRecentActivity => 'Keine aktuelle Aktivität';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Nachricht senden';

  @override
  String get adminMessageTextHint => 'Nachrichtentext';

  @override
  String get adminSetVolume => 'Lautstärke einstellen';

  @override
  String get sessionPrev => 'Zurück';

  @override
  String get sessionRewind => 'Zurückspulen';

  @override
  String get sessionForward => 'Vorspulen';

  @override
  String get sessionNext => 'Weiter';

  @override
  String get sessionVolumeDown => 'Leiser';

  @override
  String get sessionVolumeUp => 'Lauter';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Wird wiedergegeben';

  @override
  String get volume => 'Lautstärke';

  @override
  String get actions => 'Aktionen';

  @override
  String get videoCodec => 'Video-Codec';

  @override
  String get audioCodec => 'Audio-Codec';

  @override
  String get hwAccel => 'HW-Beschleunigung';

  @override
  String get completion => 'Abschluss';

  @override
  String get direct => 'Direkt';

  @override
  String get adminDisconnect => 'Trennen';

  @override
  String get adminClearDates => 'Daten löschen';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Keine Aktivitätseinträge';

  @override
  String get adminEditDeviceName => 'Gerätename bearbeiten';

  @override
  String get adminCustomName => 'Benutzerdefinierter Name';

  @override
  String get adminDeviceNameUpdated => 'Gerätename aktualisiert';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Gerät löschen';

  @override
  String get adminDeviceDeleted => 'Gerät gelöscht';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Geräte konnten nicht geladen werden';

  @override
  String get adminSearchDevices => 'Geräte suchen';

  @override
  String get adminThisDevice => 'Dieses Gerät';

  @override
  String get adminEditName => 'Name bearbeiten';

  @override
  String get adminLibrariesLoadFailed =>
      'Bibliotheken konnten nicht geladen werden';

  @override
  String get adminNoLibraries => 'Keine Bibliotheken konfiguriert';

  @override
  String get adminScanAllLibraries => 'Alle Bibliotheken scannen';

  @override
  String get adminAddLibrary => 'Bibliothek hinzufügen';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Bibliothek umbenennen';

  @override
  String get adminNewName => 'Neuer Name';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Bibliothek löschen';

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
  String get adminRemovePath => 'Pfad entfernen';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Bibliotheksoptionen gespeichert';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Bibliothek konnte nicht geladen werden';

  @override
  String get adminNoMediaPaths => 'Keine Medienpfade konfiguriert';

  @override
  String get adminAddPath => 'Pfad hinzufügen';

  @override
  String get adminBrowseFilesystem => 'Server-Dateisystem durchsuchen:';

  @override
  String get adminSaveOptions => 'Optionen speichern';

  @override
  String get adminPreferredMetadataLanguage => 'Bevorzugte Metadatensprache';

  @override
  String get adminMetadataLanguageHint => 'z. B. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadaten-Ländercode';

  @override
  String get adminMetadataCountryHint => 'z. B. US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Bibliotheksname ist erforderlich';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotheksname';

  @override
  String get adminSelectedPaths => 'Ausgewählte Pfade:';

  @override
  String get adminNoPathsAdded =>
      'Keine Pfade hinzugefügt (kann später ergänzt werden)';

  @override
  String get adminCreateLibrary => 'Bibliothek erstellen';

  @override
  String get paths => 'Pfade:';

  @override
  String get adminDisableUser => 'Benutzer deaktivieren';

  @override
  String get adminEnableUser => 'Benutzer aktivieren';

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
  String get adminUsersLoadFailed => 'Benutzer konnten nicht geladen werden';

  @override
  String get adminSearchUsers => 'Benutzer suchen';

  @override
  String get adminEditUser => 'Benutzer bearbeiten';

  @override
  String get adminAddUser => 'Benutzer hinzufügen';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Benutzer erstellen';

  @override
  String get adminPasswordOptional => 'Passwort (optional)';

  @override
  String get adminUsernameRequired => 'Benutzername darf nicht leer sein';

  @override
  String get adminNoProfileChanges => 'Keine Profiländerungen zu speichern';

  @override
  String get adminProfileSaved => 'Profil gespeichert';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Berechtigungen gespeichert';

  @override
  String get adminPasswordsMismatch => 'Passwörter stimmen nicht überein';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Benutzer konnte nicht geladen werden';

  @override
  String get adminBackToUsers => 'Zurück zu Benutzer';

  @override
  String get adminSaveProfile => 'Profil speichern';

  @override
  String get adminDeleteUser => 'Benutzer löschen';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Administratoren haben vollständigen Zugriff auf den Server. Mit Vorsicht vergeben.';

  @override
  String get administrator => 'Administrator';

  @override
  String get adminHiddenUser => 'Versteckter Benutzer';

  @override
  String get adminAllowMediaPlayback => 'Medienwiedergabe erlauben';

  @override
  String get adminAllowAudioTranscoding => 'Audio-Transkodierung erlauben';

  @override
  String get adminAllowVideoTranscoding => 'Video-Transkodierung erlauben';

  @override
  String get adminAllowRemuxing => 'Remuxing erlauben';

  @override
  String get adminForceRemoteTranscoding =>
      'Remote-Quell-Transkodierung erzwingen';

  @override
  String get adminAllowContentDeletion => 'Inhaltslöschung erlauben';

  @override
  String get adminAllowContentDownloading => 'Inhaltsdownload erlauben';

  @override
  String get adminAllowPublicSharing => 'Öffentliches Teilen erlauben';

  @override
  String get adminAllowRemoteControl =>
      'Fernsteuerung anderer Benutzer erlauben';

  @override
  String get adminAllowSharedDeviceControl =>
      'Gemeinsame Gerätesteuerung erlauben';

  @override
  String get adminAllowRemoteAccess => 'Fernzugriff erlauben';

  @override
  String get adminRemoteBitrateLimit => 'Remote-Client-Bitrate-Limit (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Leer lassen für kein Limit';

  @override
  String get adminMaxActiveSessions => 'Maximale aktive Sitzungen';

  @override
  String get adminAllowLiveTvAccess => 'Live-TV-Zugriff erlauben';

  @override
  String get adminAllowLiveTvManagement => 'Live-TV-Verwaltung erlauben';

  @override
  String get adminAllowCollectionManagement => 'Sammlungsverwaltung erlauben';

  @override
  String get adminAllowSubtitleManagement => 'Untertitelverwaltung erlauben';

  @override
  String get adminAllowLyricManagement => 'Liedtext-Verwaltung erlauben';

  @override
  String get adminSavePermissions => 'Berechtigungen speichern';

  @override
  String get adminEnableAllLibraryAccess =>
      'Zugriff auf alle Bibliotheken aktivieren';

  @override
  String get adminSaveAccess => 'Zugriff speichern';

  @override
  String get adminChangePassword => 'Passwort ändern';

  @override
  String get adminNewPassword => 'Neues Passwort';

  @override
  String get adminConfirmPassword => 'Passwort bestätigen';

  @override
  String get adminSetPassword => 'Passwort festlegen';

  @override
  String get adminResetPassword => 'Passwort zurücksetzen';

  @override
  String get adminPasswordReset => 'Passwort zurücksetzen';

  @override
  String get adminPasswordUpdated => 'Passwort aktualisiert';

  @override
  String get adminUserSettings => 'Benutzereinstellungen';

  @override
  String get adminLibraryAccess => 'Zugang zur Bibliothek';

  @override
  String get adminDeviceAndChannelAccess => 'Geräte- und Kanalzugriff';

  @override
  String get adminEnableAllDevices =>
      'Ermöglichen Sie den Zugriff auf alle Geräte';

  @override
  String get adminEnableAllChannels =>
      'Ermöglichen Sie den Zugriff auf alle Kanäle';

  @override
  String get adminResetPasswordWarning =>
      'Dadurch wird das Passwort entfernt. Der Benutzer kann sich ohne Passwort anmelden.';

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
  String get adminCreateApiKey => 'API-Schlüssel erstellen';

  @override
  String get adminAppName => 'App-Name';

  @override
  String get adminApiKeyCreated => 'API-Schlüssel erstellt';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Schlüssel erfolgreich erstellt. Der Server hat das Token nicht zurückgegeben. Prüfe die Server-API-Schlüssel.';

  @override
  String get adminKeyCopied => 'Schlüssel in Zwischenablage kopiert';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Schlüssel-Token fehlt in der Serverantwort';

  @override
  String get adminRevokeApiKey => 'API-Schlüssel widerrufen';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'API-Schlüssel widerrufen';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed =>
      'API-Schlüssel konnten nicht geladen werden';

  @override
  String get adminApiKeysTitle => 'API-Schlüssel';

  @override
  String get adminCreateKey => 'Schlüssel erstellen';

  @override
  String get adminNoApiKeys => 'Keine API-Schlüssel gefunden';

  @override
  String get adminUnknownApp => 'Unbekannte App';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Backup wird erstellt...';

  @override
  String get adminBackupCreated => 'Backup erfolgreich erstellt';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing => 'Backup-Pfad fehlt in der Serverantwort';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Wiederherstellung bestätigen';

  @override
  String get adminRestoringBackup => 'Backup wird wiederhergestellt...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Backups konnten nicht geladen werden';

  @override
  String get adminCreateBackup => 'Backup erstellen';

  @override
  String get adminNoBackups => 'Keine Backups gefunden';

  @override
  String get adminViewDetails => 'Details anzeigen';

  @override
  String get restore => 'Wiederherstellen';

  @override
  String get adminLogsLoadFailed =>
      'Serverprotokolle konnten nicht geladen werden';

  @override
  String get adminNoLogFiles => 'Keine Protokolldateien gefunden';

  @override
  String get adminLogCopied => 'Protokoll in Zwischenablage kopiert';

  @override
  String get adminSaveLogFile => 'Protokolldatei speichern';

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
  String get adminSearchInLog => 'Im Protokoll suchen';

  @override
  String get adminNoMatchingLines => 'Keine übereinstimmenden Zeilen';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Keine geplanten Aufgaben gefunden';

  @override
  String get adminNoTasksMatchFilter =>
      'Keine Aufgaben stimmen mit dem aktuellen Filter überein';

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
  String get adminRunNow => 'Jetzt ausführen';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Letzte Ausführung';

  @override
  String get adminTriggers => 'Auslöser';

  @override
  String get adminAddTrigger => 'Auslöser hinzufügen';

  @override
  String get adminNoTriggers => 'Keine Auslöser konfiguriert';

  @override
  String get adminTriggerType => 'Auslösertyp';

  @override
  String get adminTimeLimit => 'Zeitlimit (optional)';

  @override
  String get adminNoLimit => 'Kein Limit';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Wochentag';

  @override
  String get adminSearchPlugins => 'Plugins suchen...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Plugin deinstallieren';

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
      'Keine Plugins stimmen mit deiner Suche überein';

  @override
  String get adminNoPluginsInstalled => 'Keine Plugins installiert';

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
      'Keine Pakete stimmen mit deiner Suche überein';

  @override
  String get adminNoPackagesAvailable => 'Keine Pakete verfügbar';

  @override
  String get adminExperimentalIntegration => 'Experimentelle Integration';

  @override
  String get adminExperimentalWarning =>
      'Plugin-Einstellungsintegration ist noch experimentell. Einige Einstellungsseiten werden möglicherweise nicht korrekt dargestellt.';

  @override
  String get continueAction => 'Fortfahren';

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
      'Einstellungen können nicht geöffnet werden: Auth-Token fehlt.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin nicht gefunden';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Plugin aktivieren';

  @override
  String get adminPluginSettingsPage => 'Plugin-Einstellungsseite';

  @override
  String get adminRevisionHistory => 'Änderungshistorie';

  @override
  String get adminNoChangelog => 'Kein Änderungsprotokoll verfügbar.';

  @override
  String get adminRemoveRepository => 'Repository entfernen';

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
  String get adminRepositoryNameHint => 'z. B. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'Repository-URL';

  @override
  String get adminAddEntry => 'Eintrag hinzufügen';

  @override
  String get adminInvalidUrl => 'Ungültige URL';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Im Browser öffnen';

  @override
  String get adminOpenExternally => 'Extern öffnen';

  @override
  String get adminGeneralSettings => 'Allgemeine Einstellungen';

  @override
  String get adminServerName => 'Servername';

  @override
  String get adminPreferredMetadataCountry => 'Bevorzugtes Metadatenland';

  @override
  String get adminCachePath => 'Cache-Pfad';

  @override
  String get adminMetadataPath => 'Metadatenpfad';

  @override
  String get adminLibraryScanConcurrency => 'Bibliotheksscan-Parallelität';

  @override
  String get adminParallelImageEncodingLimit =>
      'Paralleles Bildkodierungslimit';

  @override
  String get adminSlowResponseThreshold =>
      'Schwellenwert für langsame Antwort (ms)';

  @override
  String get adminBrandingSaved => 'Branding-Einstellungen gespeichert';

  @override
  String get adminBrandingLoadFailed =>
      'Branding-Einstellungen konnten nicht geladen werden';

  @override
  String get adminLoginDisclaimer => 'Anmelde-Haftungsausschluss';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML, das unter dem Anmeldeformular angezeigt wird';

  @override
  String get adminCustomCss => 'Benutzerdefiniertes CSS';

  @override
  String get adminCustomCssHint =>
      'Benutzerdefiniertes CSS für das Web-Interface';

  @override
  String get adminEnableSplashScreen => 'Startbildschirm aktivieren';

  @override
  String get adminStreamingSaved => 'Streaming-Einstellungen gespeichert';

  @override
  String get adminStreamingLoadFailed =>
      'Streaming-Einstellungen konnten nicht geladen werden';

  @override
  String get adminStreamingDescription =>
      'Globale Streaming-Bitrate-Limits für Remote-Verbindungen festlegen.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Remote-Client-Bitrate-Limit (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Leer lassen oder 0 für unbegrenzt';

  @override
  String get adminPlaybackSaved => 'Wiedergabe-Einstellungen gespeichert';

  @override
  String get adminPlaybackLoadFailed =>
      'Wiedergabe-Einstellungen konnten nicht geladen werden';

  @override
  String get adminPlaybackTranscoding => 'Wiedergabe / Transkodierung';

  @override
  String get adminHardwareAcceleration => 'Hardwarebeschleunigung';

  @override
  String get adminVaapiDevice => 'VA-API-Gerät';

  @override
  String get adminEnableHardwareEncoding => 'Hardwarekodierung aktivieren';

  @override
  String get adminEnableHardwareDecoding =>
      'Hardwaredekodierung aktivieren für:';

  @override
  String get adminEncodingThreads => 'Kodierungsthreads';

  @override
  String get adminAutomatic => '0 = automatisch';

  @override
  String get adminTranscodingTempPath => 'Transkodierungs-Temporärpfad';

  @override
  String get adminEnableFallbackFont => 'Ersatzschriftart aktivieren';

  @override
  String get adminFallbackFontPath => 'Ersatzschriftart-Pfad';

  @override
  String get adminAllowSegmentDeletion => 'Segmentlöschung erlauben';

  @override
  String get adminSegmentKeepSeconds => 'Segmente behalten (Sekunden)';

  @override
  String get adminThrottleBuffering => 'Pufferung drosseln';

  @override
  String get adminTrickplaySaved => 'Trickplay-Einstellungen gespeichert';

  @override
  String get adminTrickplayLoadFailed =>
      'Trickplay-Einstellungen konnten nicht geladen werden';

  @override
  String get adminEnableHardwareAcceleration =>
      'Hardwarebeschleunigung aktivieren';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Nur Schlüsselbild-Extraktion aktivieren';

  @override
  String get adminKeyFrameSubtitle => 'Schneller, aber geringere Genauigkeit';

  @override
  String get adminScanBehavior => 'Scanverhalten';

  @override
  String get adminProcessPriority => 'Prozesspriorität';

  @override
  String get adminImageSettings => 'Bildeinstellungen';

  @override
  String get adminIntervalMs => 'Intervall (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Wie oft Frames aufgenommen werden';

  @override
  String get adminWidthResolutions => 'Breitenauflösungen';

  @override
  String get adminTileWidth => 'Kachelbreite';

  @override
  String get adminTileHeight => 'Kachelhöhe';

  @override
  String get adminQualitySubtitle =>
      'Niedrigere Werte = bessere Qualität, größere Dateien';

  @override
  String get adminProcessThreads => 'Verarbeitungsthreads';

  @override
  String get adminResumeSaved => 'Fortsetzen-Einstellungen gespeichert';

  @override
  String get adminResumeLoadFailed =>
      'Fortsetzen-Einstellungen konnten nicht geladen werden';

  @override
  String get adminResumeDescription =>
      'Konfiguriere, wann Inhalte als teilweise oder vollständig wiedergegeben markiert werden.';

  @override
  String get adminMinResumePercentage => 'Mindest-Fortsetzungsprozentsatz';

  @override
  String get adminMinResumeSubtitle =>
      'Inhalte müssen über diesen Prozentsatz hinaus abgespielt werden, um den Fortschritt zu speichern';

  @override
  String get adminMaxResumePercentage => 'Maximaler Fortsetzungsprozentsatz';

  @override
  String get adminMaxResumeSubtitle =>
      'Inhalte gelten nach diesem Prozentsatz als vollständig wiedergegeben';

  @override
  String get adminMinResumeDuration => 'Mindest-Fortsetzungsdauer (Sekunden)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Kürzere Elemente sind nicht fortsetzbar';

  @override
  String get adminMinAudiobookResume =>
      'Mindest-Hörbuch-Fortsetzungsprozentsatz';

  @override
  String get adminMaxAudiobookResume =>
      'Maximaler Hörbuch-Fortsetzungsprozentsatz';

  @override
  String get adminNetworkingSaved =>
      'Netzwerkeinstellungen gespeichert. Ein Serverneustart kann erforderlich sein.';

  @override
  String get adminNetworkingLoadFailed =>
      'Netzwerkeinstellungen konnten nicht geladen werden';

  @override
  String get adminNetworkingWarning =>
      'Änderungen an den Netzwerkeinstellungen können einen Serverneustart erfordern.';

  @override
  String get adminEnableRemoteAccess => 'Fernzugriff aktivieren';

  @override
  String get ports => 'Häfen';

  @override
  String get adminHttpPort => 'HTTP-Port';

  @override
  String get adminHttpsPort => 'HTTPS-Port';

  @override
  String get adminPublicHttpsPort => 'Öffentlicher HTTPS-Port';

  @override
  String get adminBaseUrl => 'Basis-URL';

  @override
  String get adminBaseUrlHint => 'z. B. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'HTTPS aktivieren';

  @override
  String get adminLocalNetwork => 'Lokales Netzwerk';

  @override
  String get adminLocalNetworkAddresses => 'Lokale Netzwerkadressen';

  @override
  String get adminKnownProxies => 'Bekannte Proxys';

  @override
  String get adminRemoteIpFilter => 'Remote-IP-Filter';

  @override
  String get adminRemoteIpFilterEntries => 'Remote-IP-Filter';

  @override
  String get adminCertificatePath => 'Zertifikatspfad';

  @override
  String get whitelist => 'Whitelist';

  @override
  String get blacklist => 'Schwarze Liste';

  @override
  String get notSet => 'Nicht gesetzt';

  @override
  String get adminMetadataSaved => 'Metadaten gespeichert';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Metadaten aktualisieren';

  @override
  String get recursive => 'Rekursiv';

  @override
  String get adminReplaceAllMetadata => 'Alle Metadaten ersetzen';

  @override
  String get adminReplaceAllImages => 'Alle Bilder ersetzen';

  @override
  String get adminMetadataRefreshRequested =>
      'Metadatenaktualisierung angefordert';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Remote-Person suchen';

  @override
  String get adminNoRemoteMatches => 'Keine Remote-Treffer gefunden';

  @override
  String get adminRemoteResults => 'Remote-Ergebnisse';

  @override
  String get adminRemoteMetadataApplied => 'Remote-Metadaten angewendet';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Inhaltstyp aktualisieren';

  @override
  String get adminContentType => 'Inhaltstyp';

  @override
  String get adminContentTypeUpdated => 'Inhaltstyp aktualisiert';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Metadaten-Editor konnte nicht geladen werden';

  @override
  String get adminNoPeopleEntries => 'Keine Personeneinträge';

  @override
  String get adminNoExternalIds => 'Keine externen IDs verfügbar';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nicht unterstütztes Bildformat';

  @override
  String get adminImageReadFailed =>
      'Ausgewähltes Bild konnte nicht gelesen werden';

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
  String get adminAllProviders => 'Alle Anbieter';

  @override
  String get adminNoRemoteImages => 'Keine Remote-Bilder gefunden';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Tuner hinzufügen';

  @override
  String get adminTunerType => 'Tuner-Typ';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Andere';

  @override
  String get adminUrlPath => 'URL / Pfad';

  @override
  String get adminNameOptional => 'Name (optional)';

  @override
  String get adminTunerAdded => 'Tuner hinzugefügt';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Programmführer-Anbieter hinzufügen';

  @override
  String get adminProviderType => 'Anbietertyp';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect oder XMLTV';

  @override
  String get adminUsernameOptional => 'Benutzername (optional)';

  @override
  String get adminRefreshInterval => 'Aktualisierungsintervall (Stunden)';

  @override
  String get adminProviderAdded => 'Anbieter hinzugefügt';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Tuner-Zurücksetzung angefordert';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Aufnahme-Einstellungen';

  @override
  String get adminPrePadding => 'Vorlaufzeit (Minuten)';

  @override
  String get adminPostPadding => 'Nachlaufzeit (Minuten)';

  @override
  String get adminRecordingPath => 'Aufnahmepfad';

  @override
  String get adminSeriesRecordingPath => 'Serienaufnahmepfad';

  @override
  String get adminRecordingSettingsSaved =>
      'Aufnahme-Einstellungen gespeichert';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Kanalzuordnungen festlegen';

  @override
  String get adminMappingJson => 'Zuordnungs-JSON';

  @override
  String get adminMappingJsonHint => 'Beispiel: Mappings der JSON-Nutzlast';

  @override
  String get adminChannelMappingsUpdated => 'Kanalzuordnungen aktualisiert';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Live-TV-Administration konnte nicht geladen werden';

  @override
  String get adminTunerDevices => 'Tuner-Geräte';

  @override
  String get adminNoTunerHosts => 'Keine Tuner-Hosts konfiguriert';

  @override
  String get adminGuideProviders => 'Programmführer-Anbieter';

  @override
  String get adminAddProvider => 'Anbieter hinzufügen';

  @override
  String get adminNoListingProviders => 'Keine Listing-Anbieter konfiguriert';

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
  String get adminTunerDiscovery => 'Tuner-Erkennung';

  @override
  String get adminChannelMappings => 'Kanalzuordnungen';

  @override
  String get adminNoDiscoveredTuners => 'Noch keine erkannten Tuner';

  @override
  String get adminSettingsSaved => 'Einstellungen gespeichert';

  @override
  String get adminBackupsNotAvailable =>
      'Backups sind auf diesem Server-Build nicht verfügbar.';

  @override
  String get adminRestoreWarning1 =>
      'Die Wiederherstellung ersetzt ALLE aktuellen Serverdaten durch die Backup-Daten.';

  @override
  String get adminRestoreWarning2 =>
      'Aktuelle Servereinstellungen, Benutzer und Bibliotheksdaten werden überschrieben.';

  @override
  String get adminRestoreWarning3 =>
      'Der Server wird nach der Wiederherstellung neu gestartet.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Wiederherstellung angefordert. Ein Serverneustart kann diese Sitzung trennen.';

  @override
  String get adminBackupsTitle => 'Backups';

  @override
  String get adminUnknownDate => 'Unbekanntes Datum';

  @override
  String get adminUnnamedBackup => 'Unbenanntes Backup';

  @override
  String get adminLiveTvNotAvailable =>
      'Live-TV-Administration ist auf diesem Server-Build nicht verfügbar.';

  @override
  String get adminLiveTvTitle => 'Live-TV-Administration';

  @override
  String get adminApply => 'Anwenden';

  @override
  String get adminNotSet => 'Nicht gesetzt';

  @override
  String get adminReset => 'Zurücksetzen';

  @override
  String get adminLogsTitle => 'Serverprotokolle';

  @override
  String get adminLogsNewestFirst => 'Neueste zuerst';

  @override
  String get adminLogsOldestFirst => 'Älteste zuerst';

  @override
  String get adminLogsJustNow => 'Gerade eben';

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
  String get adminLogViewerNoMatches => 'Keine übereinstimmenden Zeilen';

  @override
  String get adminMetadataEditorTitle => 'Metadaten-Editor';

  @override
  String get adminMetadataRemote => 'Fernbedienung';

  @override
  String get adminMetadataType => 'Typ';

  @override
  String get adminMetadataDetails => 'Einzelheiten';

  @override
  String get adminMetadataExternalIds => 'Externe IDs';

  @override
  String get adminMetadataImages => 'Bilder';

  @override
  String get adminMetadataFieldTitle => 'Titel';

  @override
  String get adminMetadataFieldSortTitle => 'Sortiertitel';

  @override
  String get adminMetadataFieldOriginalTitle => 'Originaltitel';

  @override
  String get adminMetadataFieldPremiereDate => 'Premierendatum (JJJJ-MM-TT)';

  @override
  String get adminMetadataFieldEndDate => 'Enddatum (JJJJ-MM-TT)';

  @override
  String get adminMetadataFieldProductionYear => 'Produktionsjahr';

  @override
  String get adminMetadataFieldOfficialRating => 'Offizielle Bewertung';

  @override
  String get adminMetadataFieldCommunityRating => 'Community-Bewertung';

  @override
  String get adminMetadataFieldCriticRating => 'Kritikerbewertung';

  @override
  String get adminMetadataFieldTagline => 'Schlagzeile';

  @override
  String get adminMetadataFieldOverview => 'Übersicht';

  @override
  String get adminMetadataGenres => 'Genres';

  @override
  String get adminMetadataTags => 'Schlagworte';

  @override
  String get adminMetadataStudios => 'Studios';

  @override
  String get adminMetadataPeople => 'Personen';

  @override
  String get adminMetadataAddGenre => 'Genre hinzufügen';

  @override
  String get adminMetadataAddTag => 'Tag hinzufügen';

  @override
  String get adminMetadataAddStudio => 'Studio hinzufügen';

  @override
  String get adminMetadataAddPerson => 'Person hinzufügen';

  @override
  String get adminMetadataEditPerson => 'Person bearbeiten';

  @override
  String get adminMetadataRole => 'Rolle';

  @override
  String get adminMetadataImagePrimary => 'Primär';

  @override
  String get adminMetadataImageBackdrop => 'Hintergrund';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Miniaturansicht';

  @override
  String get adminMetadataRecursive => 'Rekursiv';

  @override
  String get adminMetadataProvider => 'Anbieter';

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
      'Ausgewähltes Bild konnte nicht gelesen werden';

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
      'Dadurch wird das aktuelle Bild vom Element entfernt.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Hochladen';

  @override
  String get adminMetadataUpdate => 'Aktualisieren';

  @override
  String get adminMetadataRemoteImage => 'Remote-Bild';

  @override
  String get adminPluginsInstalled => 'Installiert';

  @override
  String get adminPluginsCatalog => 'Katalog';

  @override
  String get adminPluginsActive => 'Aktiv';

  @override
  String get adminPluginsRestart => 'Neustart';

  @override
  String get adminPluginsNoSearchResults =>
      'Keine Plugins stimmen mit deiner Suche überein';

  @override
  String get adminPluginsNoneInstalled => 'Keine Plugins installiert';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Update verfügbar';

  @override
  String get adminPluginsPendingRemoval =>
      'Entfernung nach Neustart ausstehend';

  @override
  String get adminPluginsChangesPending => 'Änderungen erfordern Neustart';

  @override
  String get adminPluginsEnable => 'Aktivieren';

  @override
  String get adminPluginsDisable => 'Deaktivieren';

  @override
  String get adminPluginsInstallUpdate => 'Update installieren';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Keine Pakete stimmen mit deiner Suche überein';

  @override
  String get adminPluginsCatalogEmpty => 'Keine Pakete verfügbar';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Experimentelle Integration';

  @override
  String get adminPluginDetailExperimentalContent =>
      'Plugin-Einstellungsintegration ist noch experimentell. Einige Felder oder Layouts werden möglicherweise noch nicht korrekt dargestellt.';

  @override
  String get adminPluginDetailToggle404 =>
      'Plugin konnte nicht umgeschaltet werden. Der Server konnte diese Plugin-Version nicht finden. Versuche die Plugins zu aktualisieren und dann erneut.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Plugin konnte nicht umgeschaltet werden. Bitte prüfe die Serverprotokolle für Details.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Einzelheiten';

  @override
  String get adminPluginDetailDeveloper => 'Entwickler';

  @override
  String get adminPluginDetailRepository => 'Repository';

  @override
  String get adminPluginDetailBundled => 'Mitgeliefert';

  @override
  String get adminPluginDetailEnablePlugin => 'Plugin aktivieren';

  @override
  String get adminPluginDetailRestartRequired =>
      'Ein Serverneustart ist erforderlich, damit die Änderungen wirksam werden.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Dieses Plugin wird nach dem Serverneustart entfernt.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Dieses Plugin hat eine Fehlfunktion und funktioniert möglicherweise nicht korrekt.';

  @override
  String get adminPluginDetailNotSupported =>
      'Dieses Plugin wird von der aktuellen Serverversion nicht unterstützt.';

  @override
  String get adminPluginDetailSuperseded =>
      'Dieses Plugin wurde durch eine neuere Version ersetzt.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Repository entfernen';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Entfernen';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Keine Repositories konfiguriert';

  @override
  String get adminReposEmptySubtitle =>
      'Füge ein Repository hinzu, um verfügbare Plugins zu durchsuchen';

  @override
  String get adminReposUnnamed => '(unbenannt)';

  @override
  String get adminReposEditTitle => 'Repository bearbeiten';

  @override
  String get adminReposAddTitle => 'Repository hinzufügen';

  @override
  String get adminReposUrl => 'Repository-URL';

  @override
  String get adminReposNameHint => 'z. B. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'Ungültige URL';

  @override
  String get adminGeneralSettingsTitle => 'Allgemeine Einstellungen';

  @override
  String get adminGeneralMetadataLanguage => 'Bevorzugte Metadatensprache';

  @override
  String get adminGeneralMetadataLanguageHint => 'z. B. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Bevorzugtes Metadatenland';

  @override
  String get adminGeneralMetadataCountryHint => 'z. B. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Bibliotheksscan-Parallelität';

  @override
  String get adminGeneralImageEncodingLimit => 'Paralleles Bildkodierungslimit';

  @override
  String get adminUnknownError => 'Unbekannter Fehler';

  @override
  String get adminBrowse => 'Durchsuchen';

  @override
  String get adminCloseBrowser => 'Browser schließen';

  @override
  String get adminNetworkingTitle => 'Netzwerk';

  @override
  String get adminNetworkingRestartWarning =>
      'Änderungen an den Netzwerkeinstellungen können einen Serverneustart erfordern.';

  @override
  String get adminNetworkingRemoteAccess => 'Fernzugriff aktivieren';

  @override
  String get adminNetworkingPorts => 'Häfen';

  @override
  String get adminNetworkingHttpPort => 'HTTP-Port';

  @override
  String get adminNetworkingHttpsPort => 'HTTPS-Port';

  @override
  String get adminNetworkingEnableHttps => 'HTTPS aktivieren';

  @override
  String get adminNetworkingLocalNetwork => 'Lokales Netzwerk';

  @override
  String get adminNetworkingLocalAddresses => 'Lokale Netzwerkadressen';

  @override
  String get adminNetworkingAddressHint => 'z. B. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Bekannte Proxys';

  @override
  String get adminNetworkingProxyHint => 'z. B. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Whitelist';

  @override
  String get adminNetworkingBlacklist => 'Schwarze Liste';

  @override
  String get adminNetworkingAddEntry => 'Eintrag hinzufügen';

  @override
  String get adminBrandingTitle => 'Branding';

  @override
  String get adminBrandingLoginDisclaimer => 'Anmelde-Haftungsausschluss';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML, das unter dem Anmeldeformular angezeigt wird';

  @override
  String get adminBrandingCustomCss => 'Benutzerdefiniertes CSS';

  @override
  String get adminBrandingCustomCssHint =>
      'Benutzerdefiniertes CSS für das Web-Interface';

  @override
  String get adminBrandingEnableSplash => 'Startbildschirm aktivieren';

  @override
  String get adminPlaybackHwAccel => 'Hardwarebeschleunigung';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardwarebeschleunigung';

  @override
  String get adminPlaybackEnableHwEncoding => 'Hardwarekodierung aktivieren';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Hardwaredekodierung aktivieren für:';

  @override
  String get adminPlaybackEncoding => 'Kodierung';

  @override
  String get adminPlaybackEncodingThreads => 'Kodierungsthreads';

  @override
  String get adminPlaybackFallbackFont => 'Ersatzschriftart aktivieren';

  @override
  String get adminPlaybackFallbackFontPath => 'Ersatzschriftart-Pfad';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Hörbücher';

  @override
  String get adminResumeMinAudiobookPct =>
      'Mindest-Hörbuch-Fortsetzungsprozentsatz';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Maximaler Hörbuch-Fortsetzungsprozentsatz';

  @override
  String get adminStreamingBitrateLimit => 'Remote-Client-Bitrate-Limit (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Leer lassen oder 0 für unbegrenzt';

  @override
  String get adminTrickplayHwAccel => 'Hardwarebeschleunigung aktivieren';

  @override
  String get adminTrickplayHwEncoding => 'Hardwarekodierung aktivieren';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Nur Schlüsselbild-Extraktion aktivieren';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Schneller, aber geringere Genauigkeit';

  @override
  String get adminTrickplayNonBlocking => 'Nicht-blockierend';

  @override
  String get adminTrickplayBlocking => 'Blockierend';

  @override
  String get adminTrickplayPriorityHigh => 'Hoch';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Überdurchschnittlich';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Unterdurchschnittlich';

  @override
  String get adminTrickplayPriorityIdle => 'Leerlauf';

  @override
  String get adminTrickplayImageSettings => 'Bildeinstellungen';

  @override
  String get adminTrickplayInterval => 'Intervall (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Wie oft Frames aufgenommen werden';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Kommagetrennte Pixelbreiten (z. B. 320)';

  @override
  String get adminTrickplayQuality => 'Qualität';

  @override
  String get adminTrickplayQScale => 'Qualitätsskala';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Niedrigere Werte = bessere Qualität, größere Dateien';

  @override
  String get adminTrickplayJpegQuality => 'JPEG-Qualität';

  @override
  String get adminTrickplayProcessing => 'Verarbeitung';

  @override
  String get adminTasksEmpty => 'Keine geplanten Aufgaben gefunden';

  @override
  String get adminTasksNoFilterMatch =>
      'Keine Aufgaben stimmen mit dem aktuellen Filter überein';

  @override
  String get adminTaskCancelling => 'Wird abgebrochen...';

  @override
  String get adminTaskRunning => 'Wird ausgeführt...';

  @override
  String get adminTaskNeverRun => 'Noch nie ausgeführt';

  @override
  String get adminTaskStop => 'Stoppen';

  @override
  String get adminTaskRun => 'Ausführen';

  @override
  String get adminTaskDetailLastExecution => 'Letzte Ausführung';

  @override
  String get adminTaskDetailStarted => 'Gestartet';

  @override
  String get adminTaskDetailEnded => 'Beendet';

  @override
  String get adminTaskDetailDuration => 'Dauer';

  @override
  String get adminTaskDetailErrorLabel => 'Fehler:';

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
  String get adminTaskTriggerStartup => 'Beim Anwendungsstart';

  @override
  String get adminTaskTriggerTypeDaily => 'Täglich';

  @override
  String get adminTaskTriggerTypeWeekly => 'Wöchentlich';

  @override
  String get adminTaskTriggerTypeInterval => 'Im Intervall';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervall';

  @override
  String get adminTaskTriggerEveryHour => 'Jede Stunde';

  @override
  String get adminTaskTriggerEvery6Hours => 'Alle 6 Stunden';

  @override
  String get adminTaskTriggerEvery12Hours => 'Alle 12 Stunden';

  @override
  String get adminTaskTriggerEvery24Hours => 'Alle 24 Stunden';

  @override
  String get adminTaskTriggerEvery2Days => 'Alle 2 Tage';

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
  String get adminTaskTriggerTime => 'Uhrzeit';

  @override
  String get adminTaskTriggerNoLimit => 'Kein Limit';

  @override
  String get adminActivityJustNow => 'Gerade eben';

  @override
  String get adminActivityLastHour => 'Letzte Stunde';

  @override
  String get adminActivityToday => 'Heute';

  @override
  String get adminActivityYesterday => 'Gestern';

  @override
  String get adminActivityOlder => 'Älter';

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
  String get adminActivityNow => 'jetzt';

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
      'Trickplay-Bildgenerierung für Vorschaubilder beim Spulen konfigurieren.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Öffentlicher HTTPS-Port';

  @override
  String get adminNetworkingBaseUrl => 'Basis-URL';

  @override
  String get adminNetworkingBaseUrlHint => 'z. B. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Zertifikatspfad';

  @override
  String get adminNetworkingRemoteIpFilter => 'Remote-IP-Filter';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Remote-IP-Filter';

  @override
  String get adminPlaybackVaapiDevice => 'VA-API-Gerät';

  @override
  String get adminPlaybackAutomatic => '0 = automatisch';

  @override
  String get adminPlaybackTranscodeTempPath => 'Transkodierungs-Temporärpfad';

  @override
  String get adminPlaybackSegmentDeletion => 'Segmentlöschung erlauben';

  @override
  String get adminPlaybackSegmentKeep => 'Segmente behalten (Sekunden)';

  @override
  String get adminPlaybackThrottleBuffering => 'Pufferung drosseln';

  @override
  String get adminResumeMinPct => 'Mindest-Fortsetzungsprozentsatz';

  @override
  String get adminResumeMinPctSubtitle =>
      'Inhalte müssen über diesen Prozentsatz hinaus abgespielt werden, um den Fortschritt zu speichern';

  @override
  String get adminResumeMaxPct => 'Maximaler Fortsetzungsprozentsatz';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Inhalte gelten nach diesem Prozentsatz als vollständig wiedergegeben';

  @override
  String get adminResumeMinDuration => 'Mindest-Fortsetzungsdauer (Sekunden)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Kürzere Elemente sind nicht fortsetzbar';

  @override
  String get adminTrickplayScanBehavior => 'Scanverhalten';

  @override
  String get adminTrickplayProcessPriority => 'Prozesspriorität';

  @override
  String get adminTrickplayTileWidth => 'Kachelbreite';

  @override
  String get adminTrickplayTileHeight => 'Kachelhöhe';

  @override
  String get adminTrickplayProcessThreads => 'Verarbeitungsthreads';

  @override
  String get adminTrickplayWidthResolutions => 'Breitenauflösungen';

  @override
  String get adminMetadataDefault => 'Standard';

  @override
  String get adminMetadataContentTypeUpdated => 'Inhaltstyp aktualisiert';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Schwellenwert für langsame Antwort (ms)';

  @override
  String get adminGeneralCachePath => 'Cache-Pfad';

  @override
  String get adminGeneralMetadataPath => 'Metadatenpfad';

  @override
  String get adminGeneralServerName => 'Servername';

  @override
  String get adminSettingsLoadFailed =>
      'Einstellungen konnten nicht geladen werden';

  @override
  String get adminDiscover => 'Entdecken';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Ordner';

  @override
  String get libraries => 'Bibliotheken';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay deaktiviert';

  @override
  String get syncPlayDisabledMessage =>
      'Aktivieren Sie SyncPlay in den Einstellungen, um die synchronisierte Wiedergabe zu verwenden.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server nicht unterstützt';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay erfordert einen Jellyfin-Server. Der aktuelle Server unterstützt dies nicht.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay-Gruppe';

  @override
  String get syncPlayGroupTooltip => 'SyncPlay-Gruppe';

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
  String get syncPlayIgnoreWait => 'Warten ignorieren';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Halten Sie die Gruppe nicht auf, während dieses Gerät puffert';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Fahren Sie lokal fort, ohne auf langsame Mitglieder zu warten';

  @override
  String get syncPlayRepeat => 'Wiederholen';

  @override
  String get syncPlayRepeatOne => 'Eins';

  @override
  String get syncPlayShuffleModeShuffled => 'Gemischt';

  @override
  String get syncPlayShuffleModeSorted => 'Sortiert';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Aktuelle Wiedergabewarteschlange synchronisieren';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Ersetzen Sie die Gruppenwarteschlange durch das, was lokal abgespielt wird';

  @override
  String get syncPlayLeaveGroup => 'Gruppe verlassen';

  @override
  String get syncPlayGroupQueue => 'Gruppenwarteschlange';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Jetzt spielen';

  @override
  String get syncPlayCreateNewGroup => 'Erstellen Sie eine neue Gruppe';

  @override
  String get syncPlayGroupName => 'Gruppenname';

  @override
  String get syncPlayDefaultGroupName => 'Meine SyncPlay-Gruppe';

  @override
  String get syncPlayCreateGroup => 'Gruppe erstellen';

  @override
  String get syncPlayAvailableGroups => 'Verfügbare Gruppen';

  @override
  String get syncPlayNoGroupsAvailable => 'Keine Gruppen verfügbar';

  @override
  String get syncPlayJoinGroupQuestion => 'Der SyncPlay-Gruppe beitreten?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Der Beitritt zu einer SyncPlay-Gruppe kann Ihre aktuelle Wiedergabewarteschlange ersetzen. Weitermachen?';

  @override
  String get syncPlayJoin => 'Verbinden';

  @override
  String get syncPlayStateIdle => 'Leerlauf';

  @override
  String get syncPlayStateWaiting => 'Warten';

  @override
  String get syncPlayStatePaused => 'Angehalten';

  @override
  String get syncPlayStatePlaying => 'Spielen';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-Zugriff verweigert';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Sie haben keinen Zugriff auf ein oder mehrere Elemente in dieser SyncPlay-Gruppe. Bitten Sie den Gruppenbesitzer, die Bibliotheksberechtigungen zu überprüfen oder eine andere Warteschlange auszuwählen.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'Die Sprachsuche ist nicht verfügbar.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Direct-Wiedergabe fehlgeschlagen';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Die direkte Wiedergabe dieses Dolby Vision-Streams konnte nicht gestartet werden. Mit Server-Transkodierung erneut versuchen?';

  @override
  String get retryWithTranscode => 'Versuchen Sie es erneut mit Transkodierung';

  @override
  String get dolbyVisionNotSupportedTitle =>
      'Dolby Vision wird nicht unterstützt';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Dieses Gerät kann Dolby Vision-Inhalte nicht direkt dekodieren. Verwenden Sie HDR10-Fallback oder fordern Sie Server-Transkodierung an.';

  @override
  String get rememberMyChoice => 'Erinnere dich an meine Wahl';

  @override
  String get playHdr10Fallback => 'Spielen Sie HDR10-Fallback';

  @override
  String get requestTranscode => 'Transkodierung anfordern';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Erkennen Sie Zeilen, die durch das „Home Screen Sections“-Plugin von IAmParadox27 verfügbar gemacht werden. Zeilen können unten aktiviert und neu angeordnet werden.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Bisher haben keine Jellyfin-Server das Plugin gemeldet.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Erkennen Sie Zeilen, die über das „KefinTweaks“-Plugin von ranaldsgift konfiguriert wurden. Benutzerdefinierte Abschnitte, kürzlich veröffentlichte, erneut ansehen, saisonale und kürzlich zur Bibliothek hinzugefügte Abschnitte werden aus der KefinTweaks-Konfiguration auf jedem Jellyfin-Server gespiegelt.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Bisher melden keine Jellyfin-Server KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Öffnen Sie die Home-Bereiche';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Zeilen aktivieren, deaktivieren und neu anordnen';

  @override
  String get integrationInstalledButDisabled => 'Installiert, aber deaktiviert';

  @override
  String get integrationNotInstalled => 'Nicht installiert';

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
  String get seeAll => 'Alle anzeigen';

  @override
  String get noItems => 'Keine Einträge';

  @override
  String get switchUser => 'Benutzer wechseln';

  @override
  String get remoteControl => 'Fernbedienung';

  @override
  String get mediaBarLoading => 'Medienleiste wird geladen...';

  @override
  String get mediaBarError => 'Medienleiste konnte nicht geladen werden';

  @override
  String get offlineServerUnavailable =>
      'Mit dem Internet verbunden, aber der aktuelle Server ist nicht erreichbar.';

  @override
  String get offlineNoInternet =>
      'Du bist offline. Nur heruntergeladene Inhalte sind verfügbar.';

  @override
  String get offlineFileNotAvailable => 'Datei nicht verfügbar';

  @override
  String get offlineSwitchServer => 'Server wechseln';

  @override
  String get offlineSavedMedia => 'Gespeicherte Medien';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Remote-Wiedergabe';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Gerätelautstärke';

  @override
  String get castVolumeUnavailable => 'Nicht verfügbar';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Untertitel';

  @override
  String get pinConfirmTitle => 'PIN bestätigen';

  @override
  String get pinSetTitle => 'PIN festlegen';

  @override
  String get pinEnterTitle => 'PIN eingeben';

  @override
  String get pinReenterToConfirm => 'Gib deine PIN zur Bestätigung erneut ein';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'Falsche PIN';

  @override
  String get pinMismatch => 'PINs stimmen nicht überein';

  @override
  String get pinForgot => 'PIN vergessen?';

  @override
  String get pinClear => 'Löschen';

  @override
  String get pinBackspace => 'Rücktaste';

  @override
  String get quickConnectAuthorized =>
      'Schnellverbindungs-Anfrage autorisiert.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Schnellverbindungs-Code ist ungültig oder abgelaufen.';

  @override
  String get quickConnectNotSupported =>
      'Schnellverbindung wird auf diesem Server nicht unterstützt.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Schnellverbindungs-Code konnte nicht autorisiert werden.';

  @override
  String get quickConnectDisabled =>
      'Schnellverbindung ist auf diesem Server deaktiviert.';

  @override
  String get quickConnectForbidden =>
      'Dein Konto kann diese Schnellverbindungs-Anfrage nicht autorisieren.';

  @override
  String get quickConnectNotFound =>
      'Schnellverbindungs-Code wurde nicht gefunden. Versuche einen neuen Code.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Code eingeben';

  @override
  String get quickConnectAuthorize => 'Autorisieren';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Fernbedienung';

  @override
  String get remoteFailedToLoadSessions =>
      'Sitzungen konnten nicht geladen werden';

  @override
  String get remoteNoSessions => 'Keine steuerbaren Sitzungen';

  @override
  String get remoteStartPlayback =>
      'Wiedergabe auf einem anderen Gerät starten';

  @override
  String get unknownUser => 'Unbekannt';

  @override
  String get unknownItem => 'Unbekannt';

  @override
  String get remoteNothingPlaying =>
      'Auf dieser Sitzung wird nichts wiedergegeben';

  @override
  String get castingStarted => 'Streaming auf ausgewähltem Gerät gestartet';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices => 'Keine Remote-Wiedergabegeräte verfügbar.';

  @override
  String get noRemoteDevicesIos =>
      'Keine Remote-Wiedergabegeräte verfügbar.\n\nAuf iOS sind AirPlay-Ziele im Simulator möglicherweise nicht verfügbar.';

  @override
  String get trackActionPlayNext => 'Als Nächstes abspielen';

  @override
  String get trackActionAddToQueue => 'Zur Warteschlange hinzufügen';

  @override
  String get trackActionAddToPlaylist => 'Zur Wiedergabeliste hinzufügen';

  @override
  String get trackActionCancelDownload => 'Download abbrechen';

  @override
  String get trackActionDeleteFromPlaylist => 'Aus Wiedergabeliste löschen';

  @override
  String get trackActionMoveUp => 'Nach oben';

  @override
  String get trackActionMoveDown => 'Nach unten';

  @override
  String get trackActionRemoveFromFavorites => 'Aus Favoriten entfernen';

  @override
  String get trackActionAddToFavorites => 'Zu Favoriten hinzufügen';

  @override
  String get trackActionGoToAlbum => 'Zum Album';

  @override
  String get trackActionGoToArtist => 'Zum Interpreten';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Heruntergeladene Datei gelöscht';

  @override
  String get trackActionDeleteFileFailed =>
      'Heruntergeladene Datei konnte nicht gelöscht werden';

  @override
  String get shuffleBy => 'Zufallswiedergabe nach';

  @override
  String get shuffleSelectLibrary => 'Bibliothek auswählen';

  @override
  String get shuffleSelectGenre => 'Genre auswählen';

  @override
  String get shuffleLibrary => 'Bibliothek';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Keine kompatiblen Bibliotheken verfügbar.';

  @override
  String get shuffleNoGenres =>
      'Keine Genres für diesen Zufallswiedergabemodus gefunden.';

  @override
  String get posterDisplayTitle => 'Anzeige';

  @override
  String get posterImageType => 'Bildtyp';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Miniaturansicht';

  @override
  String get imageTypeBanner => 'Banner';

  @override
  String get playlistAddFailed =>
      'Hinzufügen zur Wiedergabeliste fehlgeschlagen';

  @override
  String get playlistCreateFailed =>
      'Wiedergabeliste konnte nicht erstellt werden';

  @override
  String get playlistNew => 'Neue Wiedergabeliste';

  @override
  String get playlistCreate => 'Erstellen';

  @override
  String get playlistCreateNew => 'Neue Wiedergabeliste erstellen';

  @override
  String get playlistNoneFound => 'Keine Wiedergabelisten gefunden';

  @override
  String get addToPlaylist => 'Zur Wiedergabeliste hinzufügen';

  @override
  String get lyricsNotAvailable => 'Keine Liedtexte verfügbar';

  @override
  String get upNext => 'Als Nächstes';

  @override
  String get playNext => 'Als Nächstes abspielen';

  @override
  String get stillWatchingContent =>
      'Die Wiedergabe wurde angehalten. Schaust du noch?';

  @override
  String get stillWatchingStop => 'Stoppen';

  @override
  String get stillWatchingContinue => 'Fortsetzen';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'Live-TV';

  @override
  String get continueWatchingAndNextUp => 'Weiterschauen & Als Nächstes';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Nächste Episode';

  @override
  String get moreFromThisSeason => 'Mehr aus dieser Staffel';

  @override
  String get playerTooltipPlaybackSpeed => 'Wiedergabegeschwindigkeit';

  @override
  String get playerTooltipCastControls => 'Casting-Steuerung';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Vollbild aktivieren';

  @override
  String get playerTooltipExitFullscreen => 'Vollbild verlassen';

  @override
  String get playerTooltipFloatOnTop => 'Oben schweben';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Deaktivieren Sie den Schwimmer oben';

  @override
  String get playerTooltipLockLandscape => 'Landschaft sperren';

  @override
  String get playerTooltipUnlockOrientation => 'Drehung zulassen';

  @override
  String get playerTooltipPrevious => 'Vorherige';

  @override
  String get playerTooltipSeekBack => 'Zurückspulen';

  @override
  String get playerTooltipSeekForward => 'Vorspulen';

  @override
  String get contextMenuMarkWatched => 'Als gesehen markieren';

  @override
  String get contextMenuMarkUnwatched => 'Als ungesehen markieren';

  @override
  String get contextMenuAddToFavorites => 'Zu Favoriten hinzufügen';

  @override
  String get contextMenuRemoveFromFavorites => 'Aus Favoriten entfernen';

  @override
  String get contextMenuGoToSeries => 'Zur Serie gehen';

  @override
  String get settingsAdministrationSubtitle =>
      'Greifen Sie auf das Serververwaltungsfenster zu';

  @override
  String get settingsAccountSecurity => 'Konto & Sicherheit';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Authentifizierung, PIN-Code und Kindersicherung';

  @override
  String get settingsPersonalization => 'Personalisierung';

  @override
  String get settingsPersonalizationSubtitle =>
      'Thema, Navigation, Startzeilen und Sichtbarkeit der Bibliothek';

  @override
  String get settingsDynamicContent => 'Dynamischer Inhalt';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medienleiste und visuelle Overlays';

  @override
  String get settingsPlaybackSyncplay => 'Wiedergabe und SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Audio-/Videoeinstellungen, Untertitel, Downloads und SyncPlay-Steuerelemente';

  @override
  String get settingsIntegrationsSubtitle =>
      'Plugin-Synchronisierung, Seerr, Bewertungen und mehr';

  @override
  String get settingsAboutSubtitle =>
      'App-Version, rechtliche Informationen und Credits';

  @override
  String get settingsAuthenticationSection => 'AUTHENTIFIZIERUNG';

  @override
  String get settingsSortServersBy => 'Server sortieren nach';

  @override
  String get settingsLastUsed => 'Zuletzt verwendet';

  @override
  String get settingsAlphabetical => 'Alphabetisch';

  @override
  String get settingsPrivacyAndSafetySection => 'Privatsphäre und Sicherheit';

  @override
  String get settingsBlockedRatings => 'Blockierte Bewertungen';

  @override
  String get settingsGeneralStyle => 'Allgemeiner Stil';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Themenakzente, Hintergründe, beobachtete Indikatoren und Themenmusik';

  @override
  String get settingsHomePage => 'Startseite';

  @override
  String get settingsHomePageSubtitle =>
      'Abschnitte, Bildtypen, Überlagerungen und Medienvorschauen';

  @override
  String get settingsLibrariesSubtitle =>
      'Sichtbarkeit der Bibliothek, Ordneransicht und Verhalten bei mehreren Servern';

  @override
  String get settingsTwentyFourHourClock => '24-Stunden-Uhr';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Verwenden Sie überall dort, wo die Uhr angezeigt wird, das 24-Stunden-Format';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Zeigen Sie die Zufallsschaltfläche in der Navigationsleiste an';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Zeigen Sie die Schaltfläche „Genres“ in der Navigationsleiste an';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Zeigen Sie die Favoritenschaltfläche in der Navigationsleiste an';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Zeigen Sie die Schaltfläche „Bibliotheken“ in der Navigationsleiste an';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Schalten Sie die Sichtbarkeit der Startseite pro Bibliothek um. Starten Sie Moonfin neu, damit die Änderungen wirksam werden.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Medienleiste und lokale Vorschauen';

  @override
  String get settingsVisualOverlays => 'Visuelle Überlagerungen';

  @override
  String get settingsSeasonalSurprise => 'Saisonale Überraschung';

  @override
  String get settingsMetadataAndRatings => 'Metadaten und Bewertungen';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase ermöglicht serverseitige Integrationen, einschließlich zusätzlicher Bewertungsquellen, Seerr-Anfragen und synchronisierter Einstellungen.';

  @override
  String get settingsOfflineDownloads => 'Offline-Downloads';

  @override
  String get settingsHigh => 'Hoch';

  @override
  String get settingsLow => 'Niedrig';

  @override
  String get settingsCustomPath => 'Benutzerdefinierter Pfad';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Geben Sie den Pfad zum Download-Ordner ein';

  @override
  String get settingsConcurrentDownloads => 'Gleichzeitige Downloads';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Maximale Anzahl von Elementen, die gleichzeitig heruntergeladen werden können.';

  @override
  String get settingsAppInfo => 'APP-INFO';

  @override
  String get settingsReportAnIssue => 'Melden Sie ein Problem';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Öffnen Sie den Issue-Tracker auf GitHub';

  @override
  String get settingsJoinDiscord => 'Treten Sie Discord bei';

  @override
  String get settingsJoinDiscordSubtitle => 'Chatten Sie mit der Community';

  @override
  String get settingsJoinTheDiscord => 'Treten Sie dem Discord bei';

  @override
  String get settingsSupportMoonfin => 'Unterstützen Sie Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Markieren Sie das Projekt auf GitHub oder leisten Sie einen Beitrag';

  @override
  String get settingsLegal => 'RECHTLICH';

  @override
  String get settingsLicenses => 'Lizenzen';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Hinweise zur Open-Source-Lizenz';

  @override
  String get settingsPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Wie Moonfin mit Ihren Daten umgeht';

  @override
  String get settingsCheckForUpdates => 'Suchen Sie nach Updates';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Suchen Sie nach der neuesten Moonfin-Version';

  @override
  String get settingsPoweredByFlutter => 'Unterstützt von Flutter';

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
  String get settingsBoth => 'Beide';

  @override
  String get settingsShuffleContentTypeFilter => 'Inhaltstypfilter mischen';

  @override
  String get settingsVideoPlaybackPreferences => 'Videowiedergabeeinstellungen';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Kernvideo-Engine und Streaming-Qualitätseinstellungen';

  @override
  String get settingsAudioPreferences => 'Audioeinstellungen';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Audiospuren, Verarbeitung und Passthrough-Optionen';

  @override
  String get settingsAutomationAndQueue => 'Automatisierung und Warteschlange';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatisierte Wiedergabe und Sequenzierung';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Downloadqualität, Speichergrenzen und Warteschlangengröße';

  @override
  String get settingsSyncplaySubtitle =>
      'Synchronisationslogik für Gruppensitzungen';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Spezielle Spielerfunktionen. Seien Sie vorsichtig, da einige Optionen zu Wiedergabeproblemen führen können';

  @override
  String get settingsSkipIntrosAndOutros => 'Intros und Outros überspringen?';

  @override
  String get settingsPromptUser => 'Prompt-Benutzer';

  @override
  String get settingsSkip => 'Überspringen';

  @override
  String get settingsDoNothing => 'Nichts tun';

  @override
  String get settingsMaxBitrateDescription =>
      'Begrenzen Sie die Streaming-Bitrate. Inhalte über diesem Schwellenwert werden entsprechend transkodiert.';

  @override
  String get settingsMaxResolutionDescription =>
      'Begrenzen Sie die maximale Auflösung, die der Player anfordert. Inhalte mit höherer Auflösung werden heruntertranskodiert.';

  @override
  String get settingsPlayerZoomDescription =>
      'Wie das Video skaliert werden soll, damit es auf den Bildschirm passt.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Wiedergabe-Engine (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Wählen Sie die Standard-Wiedergabe-Engine auf Android TV-Geräten. Änderungen gelten für die nächste Wiedergabesitzung.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (empfohlen)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (alt)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision-Fallback';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Verhalten für Dolby Vision-Titel auf Geräten ohne Dolby Vision-Dekodierung.';

  @override
  String get settingsAskEachTime => 'Fragen Sie jedes Mal';

  @override
  String get settingsPreferHdr10Fallback => 'Bevorzugen Sie HDR10-Fallback';

  @override
  String get settingsPreferServerTranscode =>
      'Bevorzugen Sie die Servertranskodierung';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profil 7 Direktes Spielen';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Steuert, ob Dolby Vision-Profil 7-Enhancement-Layer-Streams direkt abgespielt werden sollen.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT aktiviert)';

  @override
  String get settingsEnabledOnThisDevice => 'Auf diesem Gerät aktiviert';

  @override
  String get settingsDisabledPreferTranscode =>
      'Deaktiviert (Transkodierung bevorzugen)';

  @override
  String get settingsResumeRewindDescription =>
      'Wie viele Sekunden sollten zurückgespult werden, wenn die Wiedergabe fortgesetzt wird (von „Weiter ansehen“ oder einer Medienelementseite)?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Wie viele Sekunden soll beim Fortsetzen der Wiedergabe nach Drücken der Pause-Taste zurückgespult werden?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Wie viele Sekunden soll nach dem Drücken der Rückspultaste zurückgesprungen werden?';

  @override
  String get settingsOneSecond => '1 Sekunde';

  @override
  String get settingsThreeSeconds => '3 Sekunden';

  @override
  String get settingsFortyFiveSeconds => '45 Sekunden';

  @override
  String get settingsSixtySeconds => '60 Sekunden';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Wie viele Sekunden soll nach dem Drücken der Schnellvorlauftaste vorwärts gesprungen werden?';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 zum externen Decoder';

  @override
  String get settingsCinemaMode => 'Kinomodus';

  @override
  String get settingsCinemaModeSubtitle =>
      'Spielen Sie Trailer/Prerolls vor einem Hauptfeature ab';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended zeigt eine vollständige Karte mit Episoden-Artwork und Beschreibung. Minimal zeigt ein kompaktes Countdown-Overlay. Deaktiviert blendet die Eingabeaufforderung vollständig aus.';

  @override
  String get settingsShort => 'Kurz';

  @override
  String get settingsLong => 'Lang';

  @override
  String get settingsVeryLong => 'Sehr lang';

  @override
  String get settingsVideoStartDelay => 'Videostartverzögerung';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Live-TV Direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Aktivieren Sie die direkte Wiedergabe für Live-TV';

  @override
  String get settingsOpenGroups => 'Offene Gruppen';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Erstellen Sie SyncPlay-Gruppen, treten Sie ihnen bei oder verwalten Sie sie';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay aktiviert';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Aktivieren Sie Gruppenüberwachungsfunktionen';

  @override
  String get settingsSyncplayButton => 'SyncPlay-Taste';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Zeigen Sie die SyncPlay-Schaltfläche in der Navigationsleiste an';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Erweiterte Korrektur';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Aktivieren Sie eine fein abgestimmte Synchronisierungslogik';

  @override
  String get settingsSyncplaySyncCorrection => 'Synchronisierungskorrektur';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Passen Sie die Wiedergabe automatisch an, um synchron zu bleiben';

  @override
  String get settingsSyncplaySpeedToSync =>
      'Geschwindigkeit zur Synchronisierung';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Verwenden Sie zum Synchronisieren die Anpassung der Wiedergabegeschwindigkeit';

  @override
  String get settingsSyncplaySkipToSync => 'Springe zu „Synchronisieren“.';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Verwenden Sie die Option zum Synchronisieren';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Mindestgeschwindigkeitsverzögerung';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Höchstgeschwindigkeitsverzögerung';

  @override
  String get settingsSyncplaySpeedDuration => 'Geschwindigkeitsdauer';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Minimale Sprungverzögerung';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Zusätzlicher Offset';

  @override
  String get onNow => 'Im Jetzt';

  @override
  String get collections => 'Sammlungen';

  @override
  String get lastPlayed => 'Zuletzt gespielt';

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
