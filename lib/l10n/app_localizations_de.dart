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
  String get animeMarkerFiller => 'Filler-Folge';

  @override
  String get animeMarkerMixed => 'Gemischte Folge';

  @override
  String get animeMarkerAnimeCanon => 'Anime-Kanon';

  @override
  String get animeMarkerMangaCanon => 'Manga-Kanon';

  @override
  String get animeMarkerSubbed => 'Untertitelt';

  @override
  String get animeMarkerDubbed => 'Synchronisiert';

  @override
  String get animeMarkerSubbedAndDubbed => 'Sub/Dub';

  @override
  String get animeMarkerSubbedShort => 'OmU';

  @override
  String get animeMarkerDubbedShort => 'Synch.';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'OmU/Synch.';

  @override
  String get animeMarkerPending => 'Ausstehend';

  @override
  String get animeMarkerRecap => 'Rückblick';

  @override
  String get interfaceLanguage => 'Sprache der App-Oberfläche';

  @override
  String get systemLanguageDefault => 'Systemstandard';

  @override
  String get signIn => 'Anmelden';

  @override
  String get signingIn => 'Anmeldung läuft …';

  @override
  String get empty => 'Leer';

  @override
  String connectingToServer(String serverName) {
    return 'Verbindung zu $serverName wird hergestellt';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Passwort';

  @override
  String get username => 'Benutzername';

  @override
  String get email => 'E-Mail';

  @override
  String get quickConnectInstruction =>
      'Geben Sie diesen Code an einem bereits angemeldeten Client ein:';

  @override
  String get quickConnectScanHint =>
      'Oder scanne dies mit einem Smartphone, das bei deinem Server angemeldet ist';

  @override
  String get quickConnectTapOrScanHint =>
      'Tippe in deinem Browser auf „Genehmigen“ oder scanne dies mit einem anderen Gerät';

  @override
  String get timesUpTitle => 'Die Zeit ist abgelaufen';

  @override
  String get timesUpMessage => 'Dieses Konto ist derzeit nicht verfügbar';

  @override
  String timesUpResumesToday(String time) {
    return 'Du kannst es heute wieder um $time verwenden';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'Du kannst es morgen um $time wieder verwenden';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'Du kannst es am $day um $time wieder verwenden';
  }

  @override
  String get waitingForAuthorization => 'Warte auf Autorisierung...';

  @override
  String get back => 'Zurück';

  @override
  String get serverUnavailable => 'Server nicht erreichbar';

  @override
  String get loginFailed => 'Anmeldung fehlgeschlagen';

  @override
  String get loginForbidden =>
      'Mit diesem Konto kann derzeit keine Anmeldung erfolgen. Möglicherweise liegt der Zeitpunkt außerhalb der zulässigen Nutzungszeiten, oder das Konto ist gesperrt beziehungsweise deaktiviert. Versuche es später noch einmal oder wende dich an einen Administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Quick Connect nicht verfügbar: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Quick Connect nicht verfügbar ($status): $detail';
  }

  @override
  String get whosWatching => 'Wer schaut?';

  @override
  String get signedInOnThisDevice => 'Auf diesem Gerät angemeldet';

  @override
  String get pinRequired => 'PIN erforderlich';

  @override
  String get passwordRequired => 'Passwort erforderlich';

  @override
  String continueAsUser(String name) {
    return 'Als $name fortfahren';
  }

  @override
  String switchToUser(String name) {
    return 'Zu $name wechseln';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return 'Angemeldet als $user auf $server';
  }

  @override
  String get accountActive => 'Aktiv';

  @override
  String get addUser => 'Benutzer hinzufügen';

  @override
  String get selectServer => 'Server auswählen';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin Version $version';
  }

  @override
  String get savedServers => 'Gespeicherte Server';

  @override
  String get discoveredServers => 'Gefundene Server';

  @override
  String get noneFound => 'Es konnten keine Server gefunden werden';

  @override
  String get unableToConnectToServer => 'Verbindung zum Server fehlgeschlagen';

  @override
  String get addServer => 'Server hinzufügen';

  @override
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => 'Server entfernen';

  @override
  String removeServerConfirmation(String serverName) {
    return '\"$serverName\" von den gespeicherten Servern entfernen?';
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
  String get serverAddressHint => 'https://dein-server.example.com';

  @override
  String get connect => 'Verbinden';

  @override
  String get secureStorageUnavailable => 'Sicherer Speicher nicht verfügbar';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin konnte nicht auf den Schlüsselbund Ihres Systems zugreifen. Sie können sich trotzdem anmelden, aber die sichere Speicherung des Anmeldetokens ist möglicherweise erst verfügbar, wenn der Schlüsselbund entsperrt wurde.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'App-Theme';

  @override
  String get detailScreenStyle => 'Layout der Mediendetails';

  @override
  String get detailScreenStyleSubtitle =>
      'Wie Filme und Serien beim Öffnen angezeigt werden.';

  @override
  String get detailScreenStyleMoonfin => 'Klassisch';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'Mehr Aktionen';

  @override
  String get spotlightCastCrewStudios => 'Schauspieler, Crew und Studio';

  @override
  String get spotlightChaptersExtras => 'Kapitel und Extras';

  @override
  String get spotlightFileDetails => 'Dateidetails';

  @override
  String get spotlightSimilarRecommendations => 'Ähnlich und Vorschläge';

  @override
  String get spotlightSeasonsEpisodes => 'Staffeln und Folgen';

  @override
  String get spotlightMoreEpisodes => 'Mehr Folgen';

  @override
  String get spotlightFilmography => 'Filmografie';

  @override
  String get spotlightCollectionsCard => 'Kollektionen';

  @override
  String get spotlightPlaylistOrder => 'Wiedergabeliste Reihenfolge';

  @override
  String get spotlightMoviesAndShows => 'Filme und Serien';

  @override
  String get spotlightSimilarSeerr => 'Ähnlich (Seer)';

  @override
  String get spotlightRecommendationsSeerr => 'Vorschläge (Seer)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Personen',
      one: '1 Person',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Fakten',
      one: '1 Fakt',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Schlagwörter',
      one: '1 Schlagwort',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Studios',
      one: '1 Studio',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kapitel',
      one: '1 Kapitel',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Extras',
      one: '1 Extra',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Staffeln',
      one: '1 Staffel',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden',
      one: '1 Episode',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Filme',
      one: '1 Film',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Serien',
      one: '1 Serie',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Titel',
      one: '1 Titel',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente',
      one: '1 Element',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Alben',
      one: '1 Album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sammlungen',
      one: '1 Sammlung',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Titel',
      one: '1 Titel',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalistisch';

  @override
  String get detailScreenStyleStage => 'Bühne';

  @override
  String get detailScreenStylePremiere => 'Premiere';

  @override
  String get detailScreenStyleQuickLook => 'Schnellansicht';

  @override
  String get detailScreenStyleFrost => 'Frost';

  @override
  String get quickLookOpenFullPage => 'Detailseite öffnen';

  @override
  String get quickLookBackToClose => 'Mit Zurück schließen';

  @override
  String quickLookSeasonPlayed(int played, int total) {
    return '$played von $total gesehen';
  }

  @override
  String get expandedTabs => 'Erweiterte Tabs';

  @override
  String get expandedTabsSubtitle =>
      'Tab-Inhalte beim Wechseln zwischen den Tabs automatisch anzeigen. Deaktivieren, um jeden Tab manuell zu öffnen und zu schließen.';

  @override
  String get showTechnicalDetails => 'Technische Details anzeigen';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Codec-, Auflösungs- und Stream-Informationen in der Banner-Zusammenfassung anzeigen.';

  @override
  String get detailShowFullDate => 'Show Full Date';

  @override
  String get detailShowFullDateSubtitle =>
      'Show the full release or air date instead of only the year on details pages';

  @override
  String get recommendationSystem => 'Empfehlungssystem';

  @override
  String get recommendationSystemSubtitle =>
      'Verwende den lokalen Algorithmus von Moonfin-Empfehlungen für deine Bibliothek, Server-Empfehlungen von deinem Medienserver oder TMDb-Ähnlichkeit aus dem Internet. Hinweis: Online-Empfehlungen erfordern eine Seerr-Integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Empfehlungen';

  @override
  String get recommendationSystemJellyfin => 'Server-Empfehlungen';

  @override
  String get recommendationSystemTmdb => 'TMDb Ähnlichkeit';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Altersfreigabe für Empfehlungen begrenzen';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Empfehlungen von Moonfin anhand der Altersfreigabe der empfohlenen Inhalte begrenzen';

  @override
  String get interfaceStyle => 'Darstellungsstil';

  @override
  String get interfaceStyleSubtitle =>
      '\"Automatisch\" passt sich an Ihr Gerät an. Wählen Sie Apple oder Material, um einen bestimmten Darstellungsstil festzulegen.';

  @override
  String get interfaceStyleAutomatic => 'Automatisch';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Layout der Benutzeroberfläche';

  @override
  String get interfaceLayoutSubtitle =>
      'Überschreibt das automatisch erkannte Layout, wenn Ihr Gerät falsch erkannt wurde. Starten Sie Moonfin neu, damit die Änderungen wirksam werden.';

  @override
  String get interfaceLayoutAutomatic => 'Automatisch';

  @override
  String get interfaceLayoutTv => 'Fernseher';

  @override
  String get interfaceLayoutDesktop => 'Desktop';

  @override
  String get interfaceLayoutPhone => 'Smartphone';

  @override
  String get glassQuality => 'Qualität des Glaseffekts';

  @override
  String get oledMode => 'OLED Modus';

  @override
  String get oledModeSubtitle =>
      'Tiefere Schwarztöne und sattere Grafiken. Besonders gut auf OLED-Displays.';

  @override
  String get oledModeSubtle => 'Dezent';

  @override
  String get oledModeVivid => 'Lebhaft';

  @override
  String get glassQualitySubtitle =>
      '\"Automatisch\" wählt den besten Glaseffekt für dieses Gerät. \"Voll\" verwendet starke Unschärfe, \"Verringert\" nutzt einen einfachen Glaseffekt und spart GPU-Leistung.';

  @override
  String get glassQualityAuto => 'Automatisch';

  @override
  String get glassQualityFull => 'Voll';

  @override
  String get glassQualityReduced => 'Verringert';

  @override
  String get performanceMode => 'Leistung';

  @override
  String get performanceModeSubtitle =>
      'Bei automatischer Einstellung prüft Moonfin die Leistung dieses Geräts und spart bei Geräten mit wenig Arbeitsspeicher Ressourcen: Es werden weniger Bilder zwischengespeichert und Trailer als Standbilder angezeigt. Wird beim nächsten Start vollständig wirksam.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Verringert';

  @override
  String get rendererMode => 'Renderer';

  @override
  String get rendererModeSubtitle =>
      'Bei automatischer Einstellung wird Impeller auf Geräten verwendet, die es flüssig darstellen können, auf allen anderen Skia. Wähle Skia, wenn Animationen oder Videos fehlerhaft aussehen. Wird beim nächsten Start wirksam.';

  @override
  String get rendererModeAuto => 'Automatisch';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Aus weil Leistung auf diesem Gerät auf verringert eingestellt ist';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Passe das Design vollständig an und wähle zwischen einer an Apple oder Material angelehnten Oberfläche.';

  @override
  String get customThemeTitle => 'Benutzerdefiniertes Design';

  @override
  String get customThemeSubtitle =>
      'Benutzerdefinierte Designs verändern das Erscheinungsbild von Moonfin. Wählen Sie die Option, die am besten zu Ihrem Stil passt.';

  @override
  String get keyboardStyle => 'Tastaturstil';

  @override
  String get keyboardStyleDescription =>
      'Nativ verwendet die eigene Tastatur deines Fernsehers. Klassisch ist die bisherige Moonfin-Tastatur. Glass ist eine milchglasartige Fläche mit größeren Tasten. Angedockt füllt den unteren Bildschirmrand und zeigt deine Eingabe über den Tasten an.';

  @override
  String get keyboardStyleNative => 'Nativ';

  @override
  String get keyboardStyleClassic => 'Klassisch';

  @override
  String get keyboardStyleGlass => 'Glass';

  @override
  String get keyboardStyleDocked => 'Angedockt';

  @override
  String get keyboardSpace => 'Freizeichen';

  @override
  String get keyboardHoldForAccents => 'Für Akzente gedrückt halten';

  @override
  String get keyboardClose => 'schließen';

  @override
  String get controller => 'Controller-Einstellungen';

  @override
  String get gamepadNavigation => 'Steuerung mit Gamepad';

  @override
  String get gamepadNavigationDescription =>
      'Ermöglicht die Navigation und Auswahl von Elementen mit einem verbundenen Gamepad.';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Das ursprüngliche und schlichte Moonfin-Design.';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Synthwave-Stil mit magentafarbenem Leuchten, cyanfarbenem Text und stärkerem Chroma-Kontrast';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Liquid-Glass-Stil mit fließendem Übergang und Apple-mäßig blauem Akzent';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro-Pixelart-Stil mit kräftiger Palette, klobigen Rändern, harten Schlagschatten und Pixelschrift';

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
  String get signInWithPlex => 'Mit Plex anmelden';

  @override
  String get plexLinkInstructions =>
      'Öffne plex.tv/link auf einem beliebigen Gerät und gib diesen Code ein';

  @override
  String get plexOpenLink => 'plex.tv/link öffnen';

  @override
  String get plexWaitingForApproval =>
      'Warte auf deine Bestätigung des Codes...';

  @override
  String get plexSignInWithPassword => 'Mit Passwort anmelden';

  @override
  String get plexVerificationCode => 'Bestätigungscode';

  @override
  String get plexNoServers => 'Keine Plex-Server in diesem Konto gefunden';

  @override
  String get loadingLinkedServers => 'Lade verknüpfte Server...';

  @override
  String get connectingToServerEllipsis =>
      'Verbindung zum Server wird hergestellt...';

  @override
  String get noReachableAddress => 'Keine erreichbare Adresse angegeben';

  @override
  String get invalidServerExchangeResponse =>
      'Der Server hat eine ungültige Antwort zurückgegeben';

  @override
  String unableToConnectTo(String target) {
    return 'Es kann keine Verbindung zu $target hergestellt werden.';
  }

  @override
  String get exitApp => 'Moonfin beenden?';

  @override
  String get exitAppConfirmation => 'Bist du sicher?';

  @override
  String get exit => 'Beenden';

  @override
  String get gameMenu => 'Menü';

  @override
  String get gamePaused => 'Pausiert';

  @override
  String get gameSaveState => 'Spielstand speichern';

  @override
  String get games => 'Spiele';

  @override
  String get gameLoadState => 'Spielstand laden';

  @override
  String get gameFastForward => 'Schnellvorlauf';

  @override
  String get gameOrientation => 'Ausrichtung beim Spielen';

  @override
  String get gameOrientationSubtitle => 'Bildschirmausrichtung beim Spielen';

  @override
  String get landscape => 'Querformat';

  @override
  String get portrait => 'Hochformat';

  @override
  String get gameEmulatorSettings => 'Emulator-Einstellungen';

  @override
  String get gameNoCoreOptions =>
      'Dieser Core bietet keine einstellbaren Optionen.';

  @override
  String get gameHoldToOpenMenu => 'Zum Öffnen des Menüs gedrückt halten';

  @override
  String get gameKeepPlaying => 'Weiterspielen';

  @override
  String get gameSaveAndExit => 'Speichern & beenden';

  @override
  String get gameExitGame => 'Spiel beenden';

  @override
  String get gameSavingBeforeExit => 'Speichern…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Spielstand konnte nicht gespeichert werden. Das Spiel läuft weiter.';

  @override
  String get gamePlaybackUnsupported =>
      'Spiele werden auf diesem Gerät noch nicht unterstützt.';

  @override
  String get noHomeRowsLoaded =>
      'Keine Startseiten-Zeilen konnten geladen werden';

  @override
  String get noHomeRowsHint =>
      'Versuche, die Seite neu zu laden, oder verringere die Anzahl aktiver Bereiche.';

  @override
  String get retryHomeRows => 'Versuche, Startseiten-Zeilen erneut zu laden';

  @override
  String get guide => 'TV-Programminfo';

  @override
  String get recordings => 'Aufnahmen';

  @override
  String get schedule => 'TV-Zeitplan';

  @override
  String get series => 'Serien';

  @override
  String get noItemsFound => 'Keine Inhalte gefunden';

  @override
  String get home => 'Startseite';

  @override
  String get browseAll => 'Alles durchsuchen';

  @override
  String get genres => 'Genres';

  @override
  String get collectionPlaceholder => 'Sammlungsinhalte werden hier angezeigt';

  @override
  String get browseByLetter => 'Nach Alphabet durchsuchen';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'Alphabetische Übersicht wird hier angezeigt';

  @override
  String get suggestions => 'Vorschläge';

  @override
  String get suggestionsPlaceholder =>
      'Vorgeschlagene Inhalte werden hier angezeigt';

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
    return 'Ordner konnte nicht geladen werden: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Dieser Ordner ist leer';

  @override
  String itemCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Inhalte',
      one: '1 Inhalt',
    );
    return '$_temp0';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Inhalte',
      one: '1 Inhalt',
    );
    return '$_temp0';
  }

  @override
  String get continuing => 'Wird fortgesetzt';

  @override
  String get ended => 'Beendet';

  @override
  String get sortAndFilter => 'Sortieren & Filtern';

  @override
  String get type => 'Art';

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
  String get uiScaleGrandparents => 'Großeltern';

  @override
  String get uiScaleGreatGrandparents => 'Urgroßeltern';

  @override
  String get scrollDirection => 'Scrollrichtung';

  @override
  String get scrollDirectionVertical => 'Vertikal';

  @override
  String get scrollDirectionHorizontal => 'Horizontal';

  @override
  String libraryGenresTitle(String name) {
    return '$name – Genres';
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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Minuten',
      one: '1 Minute',
    );
    return 'Vor $_temp0';
  }

  @override
  String hoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Stunden',
      one: '1 Stunde',
    );
    return 'Vor $_temp0';
  }

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tagen',
      one: '1 Tag',
    );
    return 'Vor $_temp0';
  }

  @override
  String get discoverySubjects => 'Themen zum Entdecken';

  @override
  String get apply => 'Anwenden';

  @override
  String get openLink => 'Link öffnen';

  @override
  String get scanWithYourPhone => 'Scanne den QR-Code mit dem Smartphone';

  @override
  String get audiobookGenres => 'Hörbuch-Genres';

  @override
  String get scrollLeft => 'Nach links scrollen';

  @override
  String get scrollRight => 'Nach rechts scrollen';

  @override
  String get scrollToTop => 'Nach oben scrollen';

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
  String get popularNow => 'Aktuell beliebt';

  @override
  String get savedForLater => 'Für später vorgemerkt';

  @override
  String get topListens => 'Viel gehört';

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
      'Setze das Anhören fort, ohne lange suchen zu müssen, wo.';

  @override
  String get unreadBooksReady =>
      'Ungelesene Bücher, verfügbar für die nächste ruhige Gelegenheit.';

  @override
  String get quickAccessFavorites =>
      'Schnellzugriff auf die Bücher, zu denen du immer wieder zurückkehrst.';

  @override
  String get searchAudiobooks => 'Hörbücher suchen';

  @override
  String get searchYourLibrary => 'Die Bibliothek durchsuchen';

  @override
  String get pickUpStory =>
      'Setze mit der Handlung fort, wo du zuletzt aufgehört hast';

  @override
  String get savedPlacesChapters =>
      'Deine gespeicherten Stellen und nicht beendete Kapitel';

  @override
  String authorsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Autoren',
      one: '1 Autor',
    );
    return '$_temp0';
  }

  @override
  String genresCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Genres',
      one: '1 Genre',
    );
    return '$_temp0';
  }

  @override
  String percentCompleted(int percent) {
    return 'Zu $percent% beendet';
  }

  @override
  String get readyWhenYouAre => 'Bereit, wenn du es bist';

  @override
  String get details => 'Details';

  @override
  String get listeningRoom => 'Hörbücher';

  @override
  String get bookmarksAndProgress => 'Lesezeichen & Fortschritt';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count Titel für Durchsuchen mit Fokus aufs Lesen angeordnet.';
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
  String get noBookmarkedItems =>
      'Noch keine mit Lesezeichen versehenen Inhalte';

  @override
  String get nothingMatchesSection =>
      'Keine zu diesem Bereich passenden Inhalte gefunden; wechsle zu einen anderen Tab oder warte ggf. auf Synchronisierung der Bibliothek.';

  @override
  String get audiobooks => 'Hörbücher';

  @override
  String noLabelFound(String label) {
    return 'Nichts ($label) gefunden';
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
  String get unwatched => 'Ungesehen';

  @override
  String get seriesStatus => 'Serienstatus';

  @override
  String get allLibraries => 'Alle Bibliotheken';

  @override
  String get books => 'Bücher';

  @override
  String get latestBooks => 'Neueste Bücher';

  @override
  String get latestAudiobooks => 'Neueste Hörbücher';

  @override
  String get latestComics => 'Neueste Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher',
      one: '1 Buch',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Buch';

  @override
  String get bookFormatAudiobook => 'Hörbuch';

  @override
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Keine Bücher gefunden';

  @override
  String get noBooksFoundDescription =>
      'Diese Bibliothek enthält bisher keine Bücher, Hörbücher oder Comics.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% gelesen';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Noch $time';
  }

  @override
  String get bookHeroRead => 'Lesen';

  @override
  String get bookHeroListen => 'Anhören';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Autor unbekannt';

  @override
  String get uncategorized => 'Nicht kategorisiert';

  @override
  String get overview => 'Übersicht';

  @override
  String get noLibrivoxDescription =>
      'Für diesen Titel ist keine Beschreibung von LibriVox verfügbar.';

  @override
  String get readers => 'Sprecher';

  @override
  String get openLinks => 'Links öffnen';

  @override
  String get librivoxPage => 'LibriVox-Seite';

  @override
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'RSS-Feed';

  @override
  String get downloadZip => 'ZIP-Datei herunterladen';

  @override
  String sectionCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Abschnitte',
      one: '1 Abschnitt',
    );
    return '$_temp0';
  }

  @override
  String firstPublished(int year) {
    return 'Erstveröffentlichung: $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Für diesen Titel ist keine Übersicht von Open Library verfügbar.';

  @override
  String get subjects => 'Themen';

  @override
  String get all => 'Alle';

  @override
  String booksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bücher',
      one: '1 Buch',
    );
    return '$_temp0';
  }

  @override
  String get couldNotLoadSubject =>
      'Dieses Thema konnte gerade nicht geladen werden.';

  @override
  String get audiobookDetails => 'Hörbuch-Details';

  @override
  String authorsCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Autoren',
      one: '1 Autor',
    );
    return '$_temp0';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Hörbücher',
      one: '1 Hörbuch',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Titelliste';

  @override
  String get itemListPlaceholder => 'Die Liste der Inhalte wird hier angezeigt';

  @override
  String get failedToLoad => 'Laden fehlgeschlagen';

  @override
  String get delete => 'Löschen';

  @override
  String get save => 'Speichern';

  @override
  String get moreLikeThis => 'Mehr ähnliche Inhalte';

  @override
  String get castAndCrew => 'Besetzung & Crew';

  @override
  String get collection => 'Sammlung';

  @override
  String get episodes => 'Episoden';

  @override
  String get nextUp => 'Nächste Folge';

  @override
  String get seasons => 'Staffeln';

  @override
  String get chapters => 'Kapitel';

  @override
  String get features => 'Besonderheiten';

  @override
  String get movies => 'Filme';

  @override
  String get musicVideos => 'Musikvideos';

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
    return 'Disk $number';
  }

  @override
  String get biography => 'Biografie';

  @override
  String get authorDetails => 'Details zum Autor';

  @override
  String get noOverviewAvailable =>
      'Für diesen Titel ist keine Übersicht verfügbar.';

  @override
  String get noBiographyAvailable =>
      'Für diesen Autor ist keine Biografie verfügbar.';

  @override
  String get unableToLoadAuthorDetails =>
      'Details zum Autor konnten nicht geladen werden.';

  @override
  String published(int year) {
    return 'Veröffentlichung: $year';
  }

  @override
  String get publicationDateUnknown => 'Veröffentlichungsdatum unbekannt';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Staffeln',
      one: '1 Staffel',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Endet um $time';
  }

  @override
  String get items => 'Inhalte';

  @override
  String get extras => 'Extras';

  @override
  String get additionalParts => 'Zusätzliche Inhalte';

  @override
  String get behindTheScenes => 'Hinter den Kulissen';

  @override
  String get deletedScenes => 'Gelöschte Szenen';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Szenen';

  @override
  String get shorts => 'Kurzfilme';

  @override
  String get trailers => 'Trailer';

  @override
  String timeRemaining(String time) {
    return 'Noch $time';
  }

  @override
  String endsIn(String time) {
    return 'verbleibend: $time';
  }

  @override
  String get view => 'Ansehen';

  @override
  String get resumeReading => 'Weiterlesen';

  @override
  String get read => 'Lesen';

  @override
  String resumeFrom(String position) {
    return 'Fortsetzen ab $position';
  }

  @override
  String get play => 'Abspielen';

  @override
  String get startOver => 'Am Anfang beginnen';

  @override
  String get restart => 'Neu starten';

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
  String get cast => 'Übertragen auf';

  @override
  String get castMembers => 'Mitwirkende';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Durchgelesen';

  @override
  String get favorited => 'Favorit';

  @override
  String get favorite => 'Als Favorit markieren';

  @override
  String get playlist => 'Wiedergabeliste';

  @override
  String get downloaded => 'Heruntergeladen';

  @override
  String get finalizingDownload => 'Fertigstellung…';

  @override
  String get queuedDownload => 'Warteschlange';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weitere in der Warteschlange',
      one: '1 weiterer in der Warteschlange',
    );
    return '$_temp0';
  }

  @override
  String get downloadAll => 'Alle herunterladen';

  @override
  String get download => 'Herunterladen';

  @override
  String get deleteDownloaded => 'Heruntergeladene löschen';

  @override
  String get goToSeries => 'Zur gesamten Serie';

  @override
  String get editMetadata => 'Metadaten bearbeiten';

  @override
  String get less => 'Weniger anzeigen';

  @override
  String get more => 'Mehr anzeigen';

  @override
  String get deleteItem => 'Inhalt löschen';

  @override
  String get deletePlaylist => 'Wiedergabeliste löschen';

  @override
  String get deletePlaylistMessage =>
      'Diese Wiedergabeliste vom Server löschen?';

  @override
  String get deleteItemMessage => 'Diesen Inhalt vom Server löschen?';

  @override
  String get failedToDeletePlaylist =>
      'Wiedergabeliste konnte nicht gelöscht werden';

  @override
  String get failedToDeleteItem => 'Inhalt konnte nicht gelöscht werden';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Löschen fehlgeschlagen mit folgendem Fehler: $error';
  }

  @override
  String get renamePlaylist => 'Wiedergabeliste umbenennen';

  @override
  String get playlistName => 'Name der Wiedergabeliste';

  @override
  String get deleteDownloadedAlbum => 'Heruntergeladenes Album löschen';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Heruntergeladene Titel für Album \"$title\" löschen?';
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
    return 'Keine $itemLabel für den Download geladen';
  }

  @override
  String downloadingTitle(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Inhalte',
      one: '1 Inhalt',
    );
    return '$title ($_temp0) wird heruntergeladen...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Soll \"$name\" wirklich vom Server gelöscht werden? Diese Aktion kann nicht rückgängig gemacht werden.';
  }

  @override
  String get itemDeleted => 'Inhalt gelöscht';

  @override
  String get noPlayableTrailerFound => 'Kein abspielbarer Trailer gefunden.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Buchformat nicht unterstützt: .$extension';
  }

  @override
  String get audioTrack => 'Audiospur';

  @override
  String get noOtherAudioTracks => 'Keine weiteren Audiospuren';

  @override
  String get subtitleTrack => 'Untertitelspur';

  @override
  String get none => 'Keine';

  @override
  String get downloadSubtitlesLabel => 'Untertitel herunterladen...';

  @override
  String get searchOpenSubtitlesPlugin => 'Mit OpenSubtitles suchen';

  @override
  String get downloadSubtitles => 'Untertitel herunterladen';

  @override
  String get searchingSubtitles => 'Suche nach passenden Untertiteln…';

  @override
  String get fetchingSubtitles => 'Untertitel werden geladen';

  @override
  String get downloadingSubtitle => 'Lade passende Untertitel herunter…';

  @override
  String get selectedSubtitleInvalid =>
      'Die ausgewählten Untertitel sind ungültig.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Untertitel heruntergeladen und ausgewählt: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Untertitel wurden heruntergeladen. Bevor sie verfügbar sind, muss der Jellyfin-Server den Inhalt aktualisieren, was einen Moment dauern kann.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Für $language wurden keine Remote-Untertitel gefunden.';
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
  String get originalFileNoReencoding =>
      'Originaldatei, ohne Neu-/Transkodierung';

  @override
  String get originalFilesNoReencoding =>
      'Originaldateien, ohne Neu-/Transkodierung';

  @override
  String get noEpisodesLoaded => 'Keine Episoden geladen';

  @override
  String get downloadScopeTitle => 'Was heruntergeladen werden soll';

  @override
  String get downloadAllEpisodes => 'Alle Folgen';

  @override
  String get downloadUnwatchedEpisodes => 'Alle ungesehenen Folgen';

  @override
  String get downloadAllMovies => 'Alle Filme';

  @override
  String get downloadUnwatchedMovies => 'Alle ungesehenen Filme';

  @override
  String get downloadScopeLoading => 'Lade Dinge ...';

  @override
  String get downloadScopeLoadFailed =>
      'Konnte Dinge zum herunterladen nicht laden';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size insgesamt';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received von $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size insgesamt';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count unbekannt';
  }

  @override
  String downloadingItem(String name, String quality) {
    return '$name (Qualität: $quality) wird heruntergeladen...';
  }

  @override
  String get deleteDownloadedFiles => 'Heruntergeladene Dateien löschen';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Lokale Dateien für $typeLabel löschen?\n\nDadurch wird Speicherplatz frei. Die Inhalte können bei Bedarf erneut heruntergeladen werden.';
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
  String get starring => 'Mit';

  @override
  String get directors => 'REGIE';

  @override
  String get writer => 'DREHBUCH';

  @override
  String get writers => 'DREHBUCH';

  @override
  String get episodeDirector => 'Regie (Episode)';

  @override
  String episodeDirectorWithRole(String role) {
    return '$role (Regie der Episode)';
  }

  @override
  String get episodeWriter => 'Drehbuchautor der Episode';

  @override
  String episodeWriterWithRole(String role) {
    return '$role (Drehbuch dieser Episode)';
  }

  @override
  String get guestStar => 'Gaststar';

  @override
  String guestStarWithRole(String role) {
    return '$role (Gaststar)';
  }

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count weitere';
  }

  @override
  String totalEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden',
      one: '1 Episode',
    );
    return '$_temp0';
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
    return 'Kapitel $number';
  }

  @override
  String trackCount(int count) {
    return '$count Titel';
  }

  @override
  String chapterCount(int count) {
    return '$count Kapitel';
  }

  @override
  String born(String date) {
    return 'Geboren: $date';
  }

  @override
  String died(String date) {
    return 'Verstorben: $date';
  }

  @override
  String age(int age) {
    return 'Alter: $age';
  }

  @override
  String get showLess => 'Weniger anzeigen';

  @override
  String get readMore => 'Mehr anzeigen';

  @override
  String get shuffle => 'Zufallswiedergabe';

  @override
  String get shuffleAll => 'Alle Zufällig wiedergeben';

  @override
  String get shuffleAllMusic => 'Alle Musik zufällig abspielen';

  @override
  String get carSignInPrompt =>
      'Melden Sie sich auf Ihrem Telefon bei Moonfin an';

  @override
  String get carServerUnreachable => 'Server nicht erreichbar';

  @override
  String get carListenNow => 'Jetzt hören';

  @override
  String get carRecentlyPlayed => 'Zuletzt gespielt';

  @override
  String get carInstantMix => 'Instant Mix';

  @override
  String downloadsCount(int count) {
    return '$count-mal heruntergeladen';
  }

  @override
  String get perfectMatch => 'Exakte Übereinstimmung';

  @override
  String get aiTranslated => 'KI unterstütze Übersetzung';

  @override
  String get machineTranslated => 'Maschinell übersetzt';

  @override
  String get hearingImpaired => 'Für Hörgeschädigte';

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
    return 'Remote-Untertitel $action erfordert die Jellyfin Untertitelverwaltungsberechtigung für diesen Benutzer.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Dieses Element konnte auf dem Server für den Remote-Untertitel $action nicht gefunden werden.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Fehler bei externen Untertiteln ($action): $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Fehler bei externen Untertiteln ($action, HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Fehler bei externen Untertiteln ($action).';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'alle heruntergeladenen Episoden für \"$name\"';
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
      'Abspielen auf anderen Geräten ist während der Offline-Wiedergabe nicht verfügbar.';

  @override
  String castActionFailed(String label, String error) {
    return '$label Aktion fehlgeschlagen: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Lautstärke auf dem Wiedergabegerät konnte nicht eingestellt werden: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Steuerung';
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
    return '$label stoppen';
  }

  @override
  String get queueIsEmpty => 'Die Warteschlange ist leer';

  @override
  String trackNumber(int number) {
    return 'Titel $number';
  }

  @override
  String get remotePlayback => 'Remote-Wiedergabe';

  @override
  String get castingToGoogleCast => 'Abspielen über Google Cast';

  @override
  String get castingViaAirPlay => 'Abspielen über AirPlay';

  @override
  String get castingViaDlna => 'Abspielen über DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds Sekunde(n)';
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
    return '$mbps Mbit/s';
  }

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
  String get playbackInformation => 'Wiedergabeinformationen';

  @override
  String get showMpvStats => 'Zeige mpv Statistiken (Shift+i)';

  @override
  String get hideMpvStats => 'Verstecke mpv Statistiken (Shift+i)';

  @override
  String get showPlaybackStats => 'Show Playback Stats';

  @override
  String get hidePlaybackStats => 'Hide Playback Stats';

  @override
  String get playbackStatsNetworkActivity => 'Network Activity';

  @override
  String get playbackStatsBufferHealth => 'Buffer Health';

  @override
  String get playbackStatsBufferMemory => 'Buffer Memory';

  @override
  String get playbackStatsRebuffers => 'Rebuffers';

  @override
  String get keyboardShortcutsTitle => 'Tastaturkürzel';

  @override
  String get keyboardShortcutsSubtitle =>
      'Tasten für die App den Videoplayer und Leser';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Drücke ? oder F1 währen ein video läuft um diese Liste zu sehen ohne das Video zu beenden';

  @override
  String get keyboardShortcutsSectionApp => 'Überall';

  @override
  String get keyboardShortcutsSectionAppScope => 'auf irgendeinem Display';

  @override
  String get keyboardShortcutsSectionPlayer => 'Video Player';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'Während ein Video offen ist, beim abspielen oder Pause.';

  @override
  String get keyboardShortcutsSectionReader => 'Buch und Comic Leser';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'Während des lesens von Buch oder Comic';

  @override
  String get keyNameArrowKeys => 'Pfeiltasten';

  @override
  String get keyNameSpace => 'Leertaste';

  @override
  String get keyNameEnter => 'Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Rücktaste';

  @override
  String get keyNameDelete => 'Löschen';

  @override
  String get keyNamePageUp => 'Seite nach oben';

  @override
  String get keyNamePageDown => 'Seite nach unten';

  @override
  String get keyNameHome => 'Home';

  @override
  String get keyNameEnd => 'Ende';

  @override
  String get keyNameShift => 'Umschalt';

  @override
  String get keyNameCtrl => 'Strg';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => 'Mausrad';

  @override
  String get shortcutMoveFocus => 'Zwischen Dingen hin und her wechseln';

  @override
  String get shortcutActivate => 'Öffne das ausgewählte';

  @override
  String get shortcutGoBack => 'Zurück gehen';

  @override
  String get shortcutToggleFullscreen => 'Vollbild an oder aus';

  @override
  String get shortcutQuit => 'Moonfin Beenden';

  @override
  String get shortcutPlayPause => 'Play oder Pause';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Steuerelemente einblenden oder, wenn eingeblendet, abspielen/pausieren';

  @override
  String get shortcutSeekBack => 'Zurückspulen (halten für größere Sprünge)';

  @override
  String get shortcutSeekForward => 'Vorspulen (halten für größere Sprünge)';

  @override
  String get shortcutVolumeUp => 'Lautstärke hoch';

  @override
  String get shortcutVolumeDown => 'lautstärke runter';

  @override
  String get shortcutMute => 'Stummschalten toggle';

  @override
  String get shortcutToggleSubtitles => 'Untertitel an oder aus';

  @override
  String get shortcutSlower => 'Langsamer';

  @override
  String get shortcutFaster => 'Schneller';

  @override
  String get shortcutPlaybackInfo => 'Zeige Wiedergabeinformationen';

  @override
  String get shortcutMpvStats => 'MPV Statistiken an oder aus';

  @override
  String get shortcutRecropBlackBars => 'Schwarze Balken zuschneiden';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Vollbild verlassen oder Stop wenn nicht Vollbild';

  @override
  String get shortcutHideControls => 'Steuerelemente ausblenden';

  @override
  String get shortcutStopPlayback => 'Stop wiedergabe';

  @override
  String get shortcutNextItem => 'Nächstes Element';

  @override
  String get shortcutPreviousItem => 'Vorheriges Element';

  @override
  String get shortcutSkipSegment =>
      'Intro oder Abspann überspringen, falls verfügbar';

  @override
  String get shortcutShowShortcuts => 'Zeige diese Liste';

  @override
  String get shortcutNextPage => 'Nächste Seite';

  @override
  String get shortcutPreviousPage => 'Vorherige Seite';

  @override
  String get shortcutScrollPage => 'Seite scrollen (E-Books)';

  @override
  String get shortcutFirstPage => 'Erste Seite oder Kapitelanfang';

  @override
  String get shortcutLastPage => 'Letzte Seite, Oder Ende vom Kapitel';

  @override
  String get shortcutZoom => 'Vergrößern oder verkleinern (Comics)';

  @override
  String get shortcutResetZoom => 'Zoom Zurücksetzen (comics)';

  @override
  String get playback => 'Wiedergabe';

  @override
  String get playMethod => 'Wiedergabemethode';

  @override
  String get directPlay => 'Direct Play';

  @override
  String get directStream => 'Direct Stream';

  @override
  String get transcoding => 'Transkodierung';

  @override
  String get transcodeReasons => 'Gründe für Transkodierung';

  @override
  String get player => 'Player';

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
  String get videoRenderer => 'Video-Renderer';

  @override
  String get videoRendererDescription =>
      'Das native Fenster sorgt für die flüssigste Wiedergabe und gibt HDR unverändert an den Bildschirm weiter. Probiere eine andere Option, wenn das Video Probleme macht.';

  @override
  String get videoRendererNativeWindow => 'Natives Fenster (empfohlen)';

  @override
  String get videoRendererNativeHdrOnly => 'Natives Fenster nur für HDR';

  @override
  String get videoRendererInApp => 'In der App (Legacy)';

  @override
  String get track => 'Titel';

  @override
  String get channels => 'Kanäle';

  @override
  String get format => 'Format';

  @override
  String get external => 'Extern';

  @override
  String get embedded => 'Eingebettet';

  @override
  String castSessionError(String protocol) {
    return 'Sitzungsfehler ($protocol)';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Buchdetails konnten nicht geladen werden: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'EPUB-Darstellung in der App ist auf dieser Plattform noch nicht verfügbar.';

  @override
  String get bookReadingUnavailableTitle =>
      'Bücher können auf Apple TV nicht gelesen werden';

  @override
  String get bookReadingUnavailableMessage =>
      'Öffne es zum Lesen in Moonfin auf einem Handy, Tablet oder Computer. Hörbücher werden hier weiterhin abgespielt.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Dieses Format (.$extension) kann noch nicht in-App dargestellt werden.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Eingebettete Darstellung von Dokumenten ist auf dieser Plattform nicht verfügbar.';

  @override
  String get couldNotOpenExternalViewer =>
      'Externes Anzeigeprogramm konnte nicht geöffnet werden.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Fehler beim Öffnen des In-App-Readers: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Lesezeichen wurde bereits unter $label gespeichert.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Lesezeichen hinzugefügt: $label';
  }

  @override
  String get noBookmarksYet =>
      'Noch keine Lesezeichen.\nTippe beim Lesen auf das Lesezeichen-Symbol, um deine Position zu speichern.';

  @override
  String get noTableOfContentsAvailable => 'Kein Inhaltsverzeichnis verfügbar';

  @override
  String pageLabel(int number) {
    return 'Seite $number';
  }

  @override
  String get position => 'Position';

  @override
  String get bookReader => 'Buch-Reader';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return 'Zu $percent% gelesen';
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
    return 'Zoom zurücksetzen (${zoom}x)';
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
    return 'Lesestatus konnte nicht aktualisiert werden: $error';
  }

  @override
  String get themeSystem => 'Theme: System';

  @override
  String get themeLight => 'Theme: Hell';

  @override
  String get themeDark => 'Theme: Dunkel';

  @override
  String get themeSepia => 'Theme: Sepia';

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
    return 'Auf dieser Plattform kann das Programm zur eingebetteten Dokumentenanzeige für $extension-Dateien nicht ausgeführt werden.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Verwenden Sie „Reader neu laden“, nachdem Sie zu einer unterstützten Plattform (Android, iOS oder macOS) gewechselt haben.';

  @override
  String get openExternally => 'Extern öffnen';

  @override
  String get noEpubChaptersFound => 'Keine EPUB-Kapitel gefunden.';

  @override
  String get readerNotReady => 'Reader nicht bereit.';

  @override
  String get seriesRecordings => 'Aufnahmen von TV-Serien';

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
  String get guideRepeatBadge => 'Wiederholen';

  @override
  String get guideTimeline => 'Programminfo-Zeitleiste';

  @override
  String failedToLoadGuide(String error) {
    return 'Programminfo konnte nicht geladen werden: $error';
  }

  @override
  String get noChannelsFound => 'Keine TV-Kanäle gefunden';

  @override
  String get noProgramData => 'Keine Programmdaten';

  @override
  String get liveBadge => 'LIVE';

  @override
  String get liveTvJumpToLive => 'Zu Live springen';

  @override
  String guideNextProgram(String time, String title) {
    return 'Danach: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Noch $minutes Min.';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Noch $hours Std.';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Noch $hours Std. $minutes Min.';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Aus Favoriten-Kanälen entfernt';

  @override
  String get addedToFavoriteChannels => 'Zu Favoriten-Kanälen hinzugefügt';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Favoriten-Kanal konnte nicht aktualisiert werden';

  @override
  String get unfavoriteChannel => 'Kanal aus Favoriten entfernen';

  @override
  String get favoriteChannel => 'Kanal zu Favoriten hinzufügen';

  @override
  String get record => 'Aufnehmen';

  @override
  String nextSeriesRecording(String dateTime) {
    return 'Nächste Serienaufnahme: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'Die Serienaufnahme ist geplant, aber die Programminfo enthält keine kommenden Episoden';

  @override
  String get seriesRecordingSkipsShowing =>
      'Die Serienaufnahme überspringt diese Ausstrahlung';

  @override
  String get seriesRecordingEpisodesQuestion =>
      'Welche Episoden sollen aufgenommen werden?';

  @override
  String get seriesRecordingAllEpisodes => 'Alle Episoden';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Jede Ausstrahlung, auch Wiederholungen';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Noch nicht aufgenommene Episoden';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Überspringt Episoden, die bereits in deiner Bibliothek sind, und nimmt jede Episode nur einmal auf';

  @override
  String get seriesRecordingNewEpisodesOnly => 'Nur neue Episoden';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'Nur Erstausstrahlungen, keine Wiederholungen';

  @override
  String get seriesRecordingSettings => 'Serieneinstellungen';

  @override
  String get seriesRecordingUpdated => 'Serienaufnahme aktualisiert';

  @override
  String get failedToUpdateSeriesRecording =>
      'Serienaufnahme konnte nicht aktualisiert werden';

  @override
  String get recordCurrentEpisode => 'Diese Folge aufnehmen';

  @override
  String get recordCurrentProgram => 'Diese Sendung aufnehmen';

  @override
  String get cancelCurrentRecording => 'Diese Aufnahme abbrechen';

  @override
  String get cancelRecordingAction => 'Aufnahme abbrechen';

  @override
  String get programSetToRecord => 'Programm zur Aufnahme markiert';

  @override
  String get recordingCancelled => 'Aufnahme abgebrochen';

  @override
  String get unableToCreateRecording => 'Aufnahme kann nicht erstellt werden';

  @override
  String get recordSeries => 'Alle Folgen dieser Serie aufnehmen';

  @override
  String get seriesSetToRecord => 'Serienaufnahme wurde geplant';

  @override
  String get seriesRecordingCancelled => 'Serienaufnahme wurde abgebrochen';

  @override
  String get unableToCreateSeriesRecording => 'Serienaufnhame fehlgeschlagen';

  @override
  String get watch => 'Ansehen';

  @override
  String get watchChannelLive => 'Kanal live ansehen';

  @override
  String get close => 'Schließen';

  @override
  String failedToPlayChannel(String name) {
    return '$name konnte nicht abgespielt werden';
  }

  @override
  String get playbackStreamLost =>
      'Die Wiedergabe wurde gestoppt und konnte nicht wiederhergestellt werden.';

  @override
  String get playbackVideoUnsupported =>
      'Dieses Gerät kann das Format dieses Videos nicht abspielen. Versuche einen externen Player.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Verbindung wird wiederhergestellt… ($attempt von $total)';
  }

  @override
  String playerMatchingDisplayRate(String fps) {
    return 'Display wird auf $fps fps angepasst…';
  }

  @override
  String get failedToLoadRecordings => 'Aufnahmen konnten nicht geladen werden';

  @override
  String get scheduledInNext24Hours => 'Für die nächsten 24 Stunden geplant';

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
    return 'Geplante Aufnahme von \"$name\" abbrechen?';
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
      'Aufnahmen von Serien konnten nicht geladen werden';

  @override
  String get noSeriesRecordings => 'Keine Aufnahmen von Serien';

  @override
  String get cancelSeriesRecording => 'Aufnahme der Serie abbrechen';

  @override
  String get cancelSeriesRecordingQuestion => 'Aufnahme der Serie abbrechen?';

  @override
  String stopRecordingName(String name) {
    return 'Aufnahme von \"$name\" beenden?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Aufnahme der Serie konnte nicht abgebrochen werden';

  @override
  String get searchThisLibrary => 'Bibliothek durchsuchen...';

  @override
  String get searchEllipsis => 'Suchen...';

  @override
  String noResultsForQuery(String query) {
    return 'Keine Suchergebnisse für \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Suche fehlgeschlagen: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Seerr-Kontotyp';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Seerr-lokal';

  @override
  String get savedMedia => 'Gespeicherte Medien';

  @override
  String get tvShows => 'TV-Sendungen';

  @override
  String get music => 'Musik';

  @override
  String get musicAlbums => 'Musikalben';

  @override
  String get noMediaInFilter =>
      'Keine Medien entsprechend dieser Filterkriterien';

  @override
  String get noDownloadedMediaYet => 'Noch keine heruntergeladenen Medien';

  @override
  String get browseLibrary => 'Bibliothek durchsuchen';

  @override
  String get deleteDownload => 'Download löschen';

  @override
  String removeItemAndFiles(String name) {
    return '\"$name\" und zugehörige Dateien entfernen?';
  }

  @override
  String tracksCount(int count) {
    return '$count Titel';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Album abspielen';

  @override
  String failedToLoadAlbum(String error) {
    return 'Album konnte nicht geladen werden: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Für $name wurden keine heruntergeladenen Titel gefunden.';
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
    return '\"$name\" entfernen?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes Min.';
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
    return 'Staffel $number';
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
    return 'Alle heruntergeladenen Episoden in $season löschen?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden',
      one: '1 Episode',
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
  String get activeDownloads => 'Aktive Downloads';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente',
      one: '1 Element',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used von $limit';
  }

  @override
  String get savedMediaSelectItems => 'Elemente auswählen';

  @override
  String get savedMediaNoDownloads => 'Noch nichts gespeichert';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Downloads, die du startest, erscheinen hier und lassen sich ohne Verbindung abspielen.';

  @override
  String get savedMediaNoActiveDownloads =>
      'Gerade wird nichts heruntergeladen';

  @override
  String get savedMediaNoResults => 'Keine Downloads passen zu dieser Suche';

  @override
  String get savedMediaPlayFromStart => 'Von Anfang an abspielen';

  @override
  String get savedMediaGoToDetails => 'Zu den Details';

  @override
  String get savedMediaDeleteDownload => 'Download löschen';

  @override
  String savedMediaDeleteSeason(String season) {
    return '$season löschen';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden löschen',
      one: '1 Episode löschen',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Serie öffnen';

  @override
  String get savedMediaPlayNextUnwatched => 'Nächste ungesehene abspielen';

  @override
  String get savedMediaRead => 'Lesen';

  @override
  String get savedMediaCancelDownload => 'Download abbrechen';

  @override
  String get sortBySize => 'Größe';

  @override
  String get sortByName => 'Name';

  @override
  String get sortByDateAdded => 'Hinzugefügt am';

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
    return '$count heruntergeladene Elemente löschen?';
  }

  @override
  String get musicAndAudiobooks => 'Musik & Hörbücher';

  @override
  String get images => 'Bilder';

  @override
  String get database => 'Datenbank';

  @override
  String ofStorageLimit(String limit) {
    return 'von $limit Limit';
  }

  @override
  String get settings => 'Einstellungen';

  @override
  String get settingsSearchHint => 'Einstellungen durschsuchen';

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
  String get pluginAndRequests => 'Plugin und Anfragen';

  @override
  String get customizeAccountPlaybackInterface =>
      'Konto, Wiedergabe und Oberfläche anpassen';

  @override
  String optionsCount(int count) {
    return '$count Optionen';
  }

  @override
  String get themeAndAppearance => 'Thema & Erscheinungsbild';

  @override
  String get focusBorderColor => 'Fokusrahmenfarbe';

  @override
  String get watchedIndicators => 'Gesehen-Indikatoren';

  @override
  String get showPosterLabels => 'Poster-Labels';

  @override
  String get showPosterLabelsSubtitle =>
      'Die Labels auf Postern anzeigen, z. B. 4K oder HDR.';

  @override
  String get always => 'Immer';

  @override
  String get mixedRowsOnly =>
      'Nur bei gemischten Film- und Serienzeilen anzeigen';

  @override
  String get hideUnwatched => 'Nicht Gesehene ausblenden';

  @override
  String get episodesOnly => 'Nur Episoden';

  @override
  String get never => 'Nie';

  @override
  String get focusExpansionAnimation => 'Fokus-Vergrößerungsanimation';

  @override
  String get desktopUiScale => 'UI-Skalierung';

  @override
  String get scaleFocusedCards =>
      'Fokussierte oder überfahrene Karten und Kacheln vergrößern.';

  @override
  String get seriesThumbnails => 'Serien-Miniaturbilder';

  @override
  String get seriesThumbnailsDescription =>
      'Nur Episoden: Serienbilder verwenden, die zum Bildtyp jeder Reihe passen.';

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
  String get loadingAnimation => 'Ladeanimation';

  @override
  String get loadingAnimationDescription => 'Passen Sie die Ladeanimationen an';

  @override
  String get loadingAnimationConfiguration => 'Ladeanimation Einstellungen';

  @override
  String get loadingAnimationImage => 'Animation';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Moonfin-Logo';

  @override
  String get loadingAnimationImageSpinner => 'Rotierender Kreisel';

  @override
  String get loadingAnimationImageRunner => 'Rennendes Männchen';

  @override
  String get loadingAnimationImageMoonPhases => 'Mondphasen';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Moonfin Phasenweise';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Neonfin Phasenweise';

  @override
  String get loadingAnimationSize => 'Animationsgröße';

  @override
  String get loadingAnimationSizeThumbnail => 'Mini';

  @override
  String get loadingAnimationSizeSmall => 'Klein';

  @override
  String get loadingAnimationSizeMedium => 'Mittel';

  @override
  String get loadingAnimationSizeLarge => 'Groß';

  @override
  String get loadingAnimationPosition => 'Positionierung der Animation';

  @override
  String get loadingAnimationPositionTopLeft => 'Oben links';

  @override
  String get loadingAnimationPositionTopCenter => 'Oben mittig';

  @override
  String get loadingAnimationPositionTopRight => 'Oben rechts';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Mittig links';

  @override
  String get loadingAnimationPositionMiddle => 'Mittig';

  @override
  String get loadingAnimationPositionMiddleRight => 'Mittig rechts';

  @override
  String get loadingAnimationPositionBottomLeft => 'Unten links';

  @override
  String get loadingAnimationPositionBottomCenter => 'Unten mittig';

  @override
  String get loadingAnimationPositionBottomRight => 'Unten rechts';

  @override
  String get loadingAnimationPositionBouncing => 'Springend';

  @override
  String get loadingAnimationSpeed => 'Geschwindigkeit der Animation';

  @override
  String get loadingAnimationSpeedSlow => 'Langsam';

  @override
  String get loadingAnimationSpeedModerate => 'Mittel';

  @override
  String get loadingAnimationSpeedFast => 'Schnell';

  @override
  String get loadingAnimationSpeedUltra => 'Sehr schnell';

  @override
  String get showLoadingAnimationText => 'Text anzeigen?';

  @override
  String get loadingAnimationPreview => 'Vorschau';

  @override
  String get snow => 'Schnee';

  @override
  String get fireworks => 'Feuerwerk';

  @override
  String get confetti => 'Konfetti';

  @override
  String get fallingLeaves => 'Fallende Blätter';

  @override
  String get seasonalChristmas => 'Weihnachten';

  @override
  String get seasonalPetals => 'Frühlingsblüten';

  @override
  String get seasonalFireflies => 'Glühwürmchen';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Dichte';

  @override
  String get seasonalDensityLight => 'Leicht';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Stark';

  @override
  String get seasonalFollower => 'Fokus-Begleiter';

  @override
  String get seasonalFollowerDescription =>
      'Ein Feiertagsmotiv, z. B. die Planchette zu Halloween, folgt deiner Auswahl auf der Startseite';

  @override
  String get seasonalFollowerPointerDescription =>
      'Ein Feiertagsmotiv, z. B. die Planchette zu Halloween, ersetzt auf der Startseite den Mauszeiger';

  @override
  String get seasonalRow => 'Saisonale Zeile';

  @override
  String get seasonalRowDescription =>
      'Eine Zeile mit Feiertagsfilmen aus deiner Bibliothek anzeigen, mit Seerr-Vorschlägen, sofern verfügbar.';

  @override
  String get seasonalRowSubtitle => 'Saisonal';

  @override
  String get seasonalRowCountry => 'Land';

  @override
  String get seasonalRowCountryAuto => 'Automatisch';

  @override
  String get countryUnitedStates => 'Vereinigte Staaten';

  @override
  String get countryCanada => 'Kanada';

  @override
  String get seasonalRowCountryOther => 'Sonstige';

  @override
  String get seasonalRowHolidays => 'Feiertage';

  @override
  String get seasonalRowHolidaysHint =>
      'Entferne das Häkchen bei einem Feiertag, um seine Zeile auszublenden.';

  @override
  String get seasonalRowAllYear => 'Das ganze Jahr anzeigen';

  @override
  String get seasonalRowAllYearDescription =>
      'Eine Feiertagszeile auch außerhalb der Feiertage anzeigen, jeden Tag ein anderer ausgewählter Feiertag.';

  @override
  String get holidayNewYear => 'Neujahr';

  @override
  String get holidayValentines => 'Valentinstag';

  @override
  String get holidayEaster => 'Ostern';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Thanksgiving';

  @override
  String get holidayChristmas => 'Weihnachtsfilme';

  @override
  String get holidayLunarNewYear => 'Mondneujahr';

  @override
  String get holidayDiwali => 'Diwali';

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
  String get loopThemeMusic => 'Titelmusik wiederholen';

  @override
  String get loopThemeMusicSubtitle =>
      'Den Titel wiederholen, statt ihn nur einmal abzuspielen';

  @override
  String get detailsBackgroundBlur => 'Detail-Hintergrundunschärfe';

  @override
  String get detailsBackgroundOpacity => 'Hintergrund-Deckkraft';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Hintergrundunschärfe beim Stöbern';

  @override
  String get maxStreamingBitrate => 'Maximale Streaming-Bitrate';

  @override
  String get maxResolution => 'Maximale Auflösung';

  @override
  String get playerZoomMode => 'Player-Zoommodus';

  @override
  String get settingsScrollWheelAction => 'Mausrad';

  @override
  String get settingsScrollWheelActionDescription =>
      'Legen Sie fest, was das Scrollen mit dem Mausrad über dem Video während der Wiedergabe bewirkt.';

  @override
  String get scrollWheelActionOff => 'Aus';

  @override
  String get scrollWheelActionSeek => 'Spulen (vor / zurück)';

  @override
  String get scrollWheelActionVolume => 'Lautstärke';

  @override
  String get playerTooltipVolume => 'Lautstärke';

  @override
  String get fit => 'Einpassen';

  @override
  String get autoCrop => 'Automatisch zuschneiden';

  @override
  String get cropBlackBars => 'Schwarze Balken abschneiden';

  @override
  String get settingsCropBlackBarsDescription =>
      'Nach Wiedergabestart eincodierte Letterbox-Balken erkennen, abschneiden und dann den Bildschirm füllen. Über die Zoom-Taste im Player erneut zuschneiden.';

  @override
  String get cropBlackBarsRecropInterval =>
      'Intervall für erneutes Zuschneiden';

  @override
  String get cropBlackBarsOnce => 'Einmal beim Start';

  @override
  String get cropBlackBarsEverySecond => 'Jede Sekunde';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Änderungen des Seitenverhältnisses während der Wiedergabe folgen.';

  @override
  String get playerRecroppingBlackBars =>
      'Schwarze Balken werden neu zugeschnitten';

  @override
  String get playerBlackBarsCropped => 'Schwarze Balken abgeschnitten';

  @override
  String get playerNoBlackBarsFound => 'Keine schwarzen Balken gefunden';

  @override
  String get playerBlackBarsNotDetected =>
      'Schwarze Balken konnten nicht erkannt werden. Versuche es in einer helleren Szene erneut';

  @override
  String get stretch => 'Strecken';

  @override
  String get refreshRateSwitching => 'Bildwiederholrate-Umschaltung';

  @override
  String get disabled => 'Deaktiviert';

  @override
  String get manual => 'Manuell';

  @override
  String get autoDetect => 'Automatisch erkennen';

  @override
  String get scaleOnTv => 'Auf TV skalieren';

  @override
  String get scaleOnDevice => 'Auf Gerät skalieren';

  @override
  String get trickPlay => 'Vorschaubilder beim Scrollen';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Vorschaubilder beim Spulen anzeigen';

  @override
  String get trickplayDisplayStyleSingle => 'Einzelnes Vorschaubild';

  @override
  String get trickplayDisplayStyleStrip => 'Filmstreifen';

  @override
  String get trickplayModeFull => 'Vollbildvorschau';

  @override
  String get trickplaySettingsPreviewHint =>
      'Bewegen Sie den Schieberegler für eine interaktive Vorschau';

  @override
  String get trickplayPreviewScale => 'Größe der Suchvorschau';

  @override
  String get trickplayVerticalOffset => 'Abstand zur Suchleiste';

  @override
  String get trickplayFollowScrubPosition => 'Suchposition folgen';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Die Vorschau bewegt sich beim Verschieben entlang der Suchleiste, anstatt zentriert zu bleiben.';

  @override
  String get trickplayPauseWhileScrubbing => 'Beim Spulen pausieren';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Die Wiedergabe pausiert beim Spulen und läuft weiter, wenn du auf Abspielen drückst. Deaktiviere dies, um weiterzuspielen und direkt an die neue Stelle zu springen';

  @override
  String get showDescriptionOnPause => 'Beschreibung bei Pause anzeigen';

  @override
  String get dimVideoShowOverview =>
      'Video abdunkeln und Übersichtstext bei Pause anzeigen';

  @override
  String get showChapterMarkers => 'Kapitelmarkierungen';

  @override
  String get showChapterMarkersDescription =>
      'Den Beginn jedes Kapitels in der Fortschrittsleiste markieren';

  @override
  String get osdLockButton => 'OSD-Sperrtaste';

  @override
  String get osdLockButtonDescription =>
      'Sperrtaste anzeigen, die Touch-Eingaben blockiert, bis lange gedrückt wird';

  @override
  String get playerSwipeGestures => 'Lautstärke und Helligkeit Wischgesten';

  @override
  String get playerSwipeGesturesDescription =>
      'Auf der linken Seite des Players nach oben oder unten wischen, um die Helligkeit zu ändern, und auf der rechten Seite, um die Lautstärke anzupassen.';

  @override
  String get invertGestureIndicators => 'Gestenanzeigen umkehren';

  @override
  String get invertGestureIndicatorsDescription =>
      'Anzeigen für Helligkeit und Lautstärke auf derselben oder der gegenüberliegenden Bildschirmseite der Wischgeste platzieren';

  @override
  String get gestureIndicatorSame => 'Gleich';

  @override
  String get gestureIndicatorInverted => 'Umgekehrt';

  @override
  String get osdButtons => 'Bedienelemente des Players';

  @override
  String get osdButtonsDescription =>
      'Wähle aus, welche Schaltflächen der Player anzeigt';

  @override
  String get osdButtonsSectionDescription =>
      'Die Wiedergabesteuerung wird immer angezeigt. Die übrigen Elemente können Sie frei festlegen. Jeder Gerätetyp verwendet eine eigene Liste.';

  @override
  String get detailButtons => 'Aktionsschaltflächen';

  @override
  String get detailButtonsDescription =>
      'Wähle aus, welche Schalttflächen die Detailansicht anzeigt';

  @override
  String get detailButtonsSectionDescription =>
      '\"Wiedergeben\" steht immer an erster Stelle und gesperrte Schaltflächen werden immer angezeigt. Die übrigen Aktionen können Sie frei festlegen. Jeder Gerätetyp verwendet eine eigene Liste.';

  @override
  String get actionButtonsOnScreen => 'Aktionsschaltflächen auf dem Bildschirm';

  @override
  String get actionButtonsOnScreenDescription =>
      'Lege fest, wie viele Aktionstasten angezeigt werden, bevor sie im Menü „Weitere Aktionen“ zusammengefasst werden.';

  @override
  String get actionButtonsOnScreenAuto => 'Auto (Standard-Design)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Nur abspielen)';

  @override
  String get actionButtonsOnScreenAll => 'Alle (Horizontales Scrollen)';

  @override
  String get detailMetadata => 'Metadatenzeile';

  @override
  String get detailMetadataDescription =>
      'Wähle und sortiere, welche Metadaten in der Detailansicht angezeigt werden';

  @override
  String get detailMetadataSectionDescription =>
      'Metadaten ein- oder ausblenden und ihre Reihenfolge in der Detailansicht festlegen. Jede Geräteart hat ihre eigene Liste.';

  @override
  String get detailMetadataYear => 'Erscheinungsjahr';

  @override
  String get detailMetadataParentalRating => 'Altersfreigabe';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Laufzeit & Staffeln';

  @override
  String get detailMetadataStatus => 'Serienstatus';

  @override
  String get detailMetadataStatusSubtitle =>
      'Zeigt an, ob die Serie fortgesetzt wird, beendet ist oder zurückkehrt';

  @override
  String get detailMetadataGenres => 'Genres';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr-Verfügbarkeit';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Zeigt den Anfrage- und Verfügbarkeitsstatus aus Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Kommende Episoden';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Verwendet Sonarr und TMDB, um kommende Erscheinungstermine anzuzeigen';

  @override
  String get detailSections => 'Bereiche';

  @override
  String get detailSectionsDescription =>
      'Angezeigte Bereiche der Detailansicht festlegen';

  @override
  String get detailSectionsScreenDescription =>
      'Es werden nur die Bereiche aufgelistet, die der aktuelle Stil der Detailansicht anzeigen kann. Wenn du einen ausblendest, wird er in allen Stilen ausgeblendet, die ihn enthalten.';

  @override
  String get detailSectionGroupHeader => 'Kopfbereich';

  @override
  String get detailSectionGroupSections => 'Bereiche';

  @override
  String get detailSectionGroupPerson => 'Personenseiten';

  @override
  String get detailSectionGroupCollection => 'Sammlungsseiten';

  @override
  String get detailSectionGroupOther => 'Sonstige';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle =>
      'Zeigt den Titel als Text an, wenn deaktiviert';

  @override
  String get detailSectionTagline => 'Schlagzeile';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Versionsabzeichen';

  @override
  String get detailSectionUpNext => 'Als Nächstes';

  @override
  String get detailSectionLyrics => 'Liedtext';

  @override
  String get detailSectionCast => 'Cast';

  @override
  String get detailSectionCastSubtitle => 'Gilt auch für Sammlungsseiten';

  @override
  String get detailSectionCrew => 'Regie & Drehbuch';

  @override
  String get detailSectionStudios => 'Studios';

  @override
  String get detailSectionChapters => 'Kapitel';

  @override
  String get detailSectionExtras => 'Extras';

  @override
  String get detailSectionCollections => 'Sammlungen';

  @override
  String get detailSectionMoreLikeThis => 'Mehr davon';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Gilt auch für ähnliche Alben und Künstler';

  @override
  String get detailSectionMoreEpisodes => 'Weitere Episoden';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'Auf Episodenseiten';

  @override
  String get detailSectionMediaInfo => 'Medieninfo';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'Datei, Streams und Direct-Play-Prüfung';

  @override
  String get detailSectionSeerrGenresTags => 'Genres & Tags';

  @override
  String get detailSectionSeerrStats => 'Statistik';

  @override
  String get detailSectionSeerrStreaming => 'Streamingdienste';

  @override
  String get seerrStreamingOn => 'Zu sehen bei';

  @override
  String get detailSectionSeerrRecommendations => 'Empfehlungen';

  @override
  String get detailSectionSeerrSimilar => 'Ähnliche Titel';

  @override
  String get detailSectionSeerrCollection => 'Sammlungsbanner';

  @override
  String get detailSectionSeerrPersonAppearances => 'Auftritte';

  @override
  String get detailSectionSeerrPersonCrew => 'Mitwirkende hinter der Kamera';

  @override
  String get detailSectionPersonPagesSubtitle => 'Auf Personenseiten';

  @override
  String get detailSectionBiography => 'Biografie';

  @override
  String get detailSectionBirthplace => 'Geburtsort';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle =>
      'IMDb, TMDB und soziale Medien';

  @override
  String get detailSectionGuestAppearances => 'Gastauftritte';

  @override
  String get detailSectionMusicVideos => 'Musikvideos';

  @override
  String get detailSectionPlaylistOrder => 'Reihenfolge der Playlist';

  @override
  String get detailSectionBookGenres => 'Buchgenres';

  @override
  String get detailSectionPhotoExif => 'Fotodetails';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Nächste: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Heute';

  @override
  String get upcomingEpisodeTomorrow => 'Morgen';

  @override
  String get radarrCalendarRow => 'Kommende Filme (Radarr)';

  @override
  String get sonarrCalendarRow => 'Kommende Serien (Sonarr)';

  @override
  String get mergedCalendarRow => 'Kommende Veröffentlichungen';

  @override
  String get arrCalendarsRowSubtitle => 'Radarr- und Sonarr-Kalender';

  @override
  String get radarrCalendarRowSubtitle => 'Radarr-Kalender';

  @override
  String get sonarrCalendarRowSubtitle => 'Sonarr-Kalender';

  @override
  String calendarReleaseIn(int days, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'In $days Tagen',
      one: 'Morgen',
      zero: 'Heute',
    );
    return '$_temp0 ($date)';
  }

  @override
  String get calendarReleaseCinema => 'Kino';

  @override
  String get calendarReleaseDigital => 'Digitale Reihenfolge';

  @override
  String get calendarReleasePhysical => 'Physisch';

  @override
  String get upcomingCalendars => 'Kalender für Kommendes';

  @override
  String get upcomingCalendarsDescription =>
      'Wähle, was die Radarr- und Sonarr-Zeilen anzeigen.';

  @override
  String get radarrCalendarShowCinema => 'Kommende Kinostarts anzeigen';

  @override
  String get radarrCalendarShowDigital =>
      'Kommende digitale Veröffentlichungen anzeigen';

  @override
  String get radarrCalendarShowPhysical =>
      'Kommende physische Veröffentlichungen anzeigen';

  @override
  String get calendarShowReleaseDate =>
      'Erscheinungsdatum auf der Startseite anzeigen';

  @override
  String get radarrCalendarHideDownloaded =>
      'Filme ausblenden, die bereits auf dem Server sind';

  @override
  String get sonarrCalendarShowEpisodeInfo => 'Episodeninformationen anzeigen';

  @override
  String get sonarrCalendarHideDownloaded =>
      'Episoden ausblenden, die bereits auf dem Server sind';

  @override
  String get mergeRadarrSonarrCalendars =>
      'Sonarr- und Radarr-Kalender zusammenführen';

  @override
  String get moveUp => 'nach oben bewegen';

  @override
  String get moveDown => 'nach unten bewegen';

  @override
  String get buttonOrderHint =>
      'Verwenden Sie die Pfeile, um die Reihenfolge zu ändern. Mit einer Fernbedienung verschieben Sie die markierte Schaltfläche nach links oder rechts. Deaktivierte Schaltflächen werden unterhalb der übrigen angeordnet.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Wird nur angezeigt, während du in einer Watch Party bist';

  @override
  String get orientationLock => 'Ausrichtung sperren';

  @override
  String get fullscreen => 'Vollbild';

  @override
  String get audioBehavior => 'Audio-Verhalten';

  @override
  String get downmixToStereo => 'Auf Stereo heruntermischen';

  @override
  String get defaultAudioLanguage => 'Standard-Audiosprache';

  @override
  String get fallbackAudioLanguage => 'Fallback-Audiosprache';

  @override
  String get preferDefaultAudioTrack => 'Standard-Audiospur bevorzugen';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Die Original-Audiospur der synchronisierten Fassung vorziehen.';

  @override
  String get preferAudioDescription => 'Audiodeskriptions-Spuren bevorzugen';

  @override
  String get preferAudioDescriptionDescription =>
      'Audiodeskriptions-Spuren gegenüber normalen Spuren bevorzugen.';

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
  String get settingsAudioFallbackCodec => 'Audio-Fallback-Codec';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Wählen Sie das Zielformat für die Transkodierung von Mehrkanal-Audio, wenn der Quellstream nicht direkt abgespielt oder durchgeleitet werden kann.';

  @override
  String get transcodeAudioCodecs => 'Audiocodecs transkodieren';

  @override
  String get transcodeAudioCodecsDescription =>
      'Der Server konvertiert Audio in diesen Formaten, statt es unverändert zu senden.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Automatisch erkennen\n(Empfohlen)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Standard)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Nur Stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Effizient)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Verlustfrei)';

  @override
  String get settingsMaxAudioChannels => 'Maximale Audiokanäle';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Konfigurieren Sie die maximale Kanalzahl Ihres Audio-Setups. Mehrkanal-Streams über diesem Limit werden heruntergemischt oder transkodiert.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Automatisch erkennen\n(Hardware-Standard)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadrofonie';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Erweitert)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec-Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Aktivieren Sie nur Formate, die Ihr AVR- oder HDMI-Empfänger unterstützt.';

  @override
  String get settingsAudioEac3Passthrough => 'EAC3-Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS-Core-Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'DTS-HD MA Passthrough';

  @override
  String get settingsAudioPassthroughMode => 'Passthrough';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'Wie komprimierter Surround Sound ihr Gerät erreicht.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'deaktiviert (auf diesem Gerät immer umwandeln)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Auto (an erkanntes Gerät anpassen)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'manuell (Formate unten auswählen)';

  @override
  String get settingsAudioPassthroughOutput => 'Passthrough-Ausgabe';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Wer die Bitstreams für die HDMI-Verbindung verpackt. Probiere den App-Packer, wenn Passthrough auf diesem Gerät stumm bleibt oder stockt.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatisch, System-Packer (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec => 'App-Packer (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'App (IEC)';

  @override
  String get settingsAudioPassthroughFallback => 'Decode Silent Passthrough';

  @override
  String get settingsAudioPassthroughFallbackDescription =>
      'If the output can\'t play a passthrough track and stays silent, decode it on this device instead.';

  @override
  String get settingsDownmixToStereoDescription =>
      'Mischt alle decodierten Audiosignale auf zwei Kanäle herunter.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream für E-AC-3 einschließlich Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Bitstream DTS-HD, einschließlich DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, einschließlich Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD-Passthrough';

  @override
  String get settingsDetectedAudioCapabilities => 'Erkannte Audiofunktionen';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Es ist noch kein Snapshot der Laufzeitfähigkeit verfügbar.';

  @override
  String get settingsAudioRouteLabel => 'Route';

  @override
  String get settingsAudioDecodeLabel => 'Dekodieren';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'HD-Audioroute';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Lautsprecher';

  @override
  String get settingsAudioRouteHeadphones => 'Kopfhörer';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

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
    return 'Nach $episodes Episoden / ${hours}h';
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
  String get subtitleDownloadLanguages => 'Sprachen für Untertitel-Downloads';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Sprachen, nach denen beim Herunterladen von Untertiteln gesucht wird, bis zu 5. „Automatisch“ sucht nach einer Sprache, die aus deiner Standard-Untertitelsprache oder dem Video gewählt wird.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Bevorzugte Sprache für Zweituntertitel';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Gleichzeitig eine zweite Untertitelspur anzeigen. Das Untertitelmenü fragt dann zuerst nach der primären oder der zweiten Spur';

  @override
  String get defaultToNoSubtitles => 'Standardmäßig keine Untertitel';

  @override
  String get turnOffSubtitlesByDefault =>
      'Untertitel standardmäßig ausschalten';

  @override
  String get subtitleSize => 'Untertitelgröße';

  @override
  String get primarySubtitleSlot => 'Primäre Spur';

  @override
  String get secondarySubtitleSlot => 'Zweite Spur';

  @override
  String get secondarySubtitleTrack => 'Zweituntertitel';

  @override
  String get secondaryDelayAdjustment =>
      'Verzögerung der zweiten Spur anpassen';

  @override
  String decreaseValue(String setting) {
    return '$setting verringern';
  }

  @override
  String increaseValue(String setting) {
    return '$setting erhöhen';
  }

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
  String get subtitleMode => 'Untertitelmodus';

  @override
  String get subtitleModeFlagged => 'Markiert';

  @override
  String get subtitleModeAlways => 'Immer';

  @override
  String get subtitleModeForeign => 'Fremdsprachig';

  @override
  String get subtitleModeForced => 'Erzwungen';

  @override
  String get subtitleModeFlaggedDescription =>
      'Spielt Spuren ab, die in den Metadaten der Mediendatei intern als „default“ oder „forced“ markiert sind.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Lädt und zeigt bei jedem Videostart automatisch Untertitel an.';

  @override
  String get subtitleModeForeignDescription =>
      'Schaltet Untertitel automatisch ein, wenn die Standard-Audiospur fremdsprachig ist.';

  @override
  String get subtitleModeForcedDescription =>
      'Lädt nur Untertitel, die ausdrücklich mit dem Flag „forced“ gekennzeichnet sind.';

  @override
  String get subtitleModeNoneDescription =>
      'Deaktiviert das automatische Laden von Untertiteln vollständig.';

  @override
  String get fallbackSubtitleLanguage => 'Fallback-Untertitelsprache';

  @override
  String get subtitleStream => 'Untertitelspur';

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
  String get semiTransparentWhite => 'Halbtransparentes Weiß';

  @override
  String get lightGray => 'Hellgrau';

  @override
  String get darkGray => 'Dunkelgrau';

  @override
  String get blue => 'Blau';

  @override
  String get magenta => 'Magenta';

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
    return '$profile Profileinstellungen geladen.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return '$profile Profileinstellungen konnten nicht geladen werden.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Lokale Einstellungen mit dem Profil $profile synchronisiert.';
  }

  @override
  String get syncing => 'Synchronisiere...';

  @override
  String resetProfileTitle(String profile) {
    return 'Profil $profile zurücksetzen?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Diese Aktion wird das Profil $profile vom Server entfernen und alle synchronisierten Einstellungen auf diesem Gerät auf Standard zurücksetzen.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Diese Aktion wird alle gespeicherten Profile vom Server löschen und die Einstellungen auf diesem Gerät auf Standard zurücksetzen.';

  @override
  String profileReset(String profile) {
    return 'Profil $profile wird auf Standard zurückgesetzt.';
  }

  @override
  String get resetRatingsTitle => 'Bewertungen zurücksetzen ?';

  @override
  String get resetRatingsDescription =>
      'Diese Aktion wird alle Bewertungen auf Standard zurücksetzen ebenso die Quellen und Reihenfolge.';

  @override
  String get ratingsReset => 'Bewertungen auf Standard zurücksetzen.';

  @override
  String failedToResetProfile(String profile) {
    return 'Profil $profile zurücksetzen fehlgeschlagen.';
  }

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
  String get tvOfflineDownloads => 'Offline-Downloads aktivieren';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Download-Optionen auf den Inhaltsseiten anzeigen';

  @override
  String get reportDownloadsActivity => 'Downloads auf dem Server anzeigen';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Der Server-Administrator kann Ihre transkodierten Downloads im Dashboard sehen';

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
  String get sdCard => 'SD Karte';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android erlaubt Moonfin auf diesem Gerät nur den Zugriff auf eigene Ordner. Da kein Wechselspeicher vorhanden ist, aktivieren Sie oben „Im Downloads-Ordner speichern“, damit auch andere Apps auf die Downloads zugreifen können.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transkodierung: Verbleibende Zeit nicht verfügbar';

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
  String get showLiveTvButton => 'Live-TV-Taste anzeigen';

  @override
  String get showDownloadsButton => 'Downloads-Taste anzeigen';

  @override
  String get showLibrariesInToolbar =>
      'Bibliotheken in der Symbolleiste anzeigen';

  @override
  String get showLibrariesIndividually => 'Bibliotheken einzeln anzeigen';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Jede Bibliothek als eigene Taste in der Navigationsleiste statt im Bibliotheksmenü anzeigen';

  @override
  String get navbarAlwaysExpanded =>
      'Beschriftungen der Navigationsleiste immer anzeigen';

  @override
  String get showSeerrButton => 'Seerr-Schaltfläche anzeigen';

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
  String get mergeLibrariesByType =>
      'Film- und Serienbibliotheken zusammenführen';

  @override
  String get mergeLibrariesByTypeDescription =>
      'Bei aktivierten Bibliotheken mehrerer Server eine Filmbibliothek und eine Serienbibliothek für alle Server anzeigen. Ein Titel, der auf mehreren Servern liegt, wird nur einmal aufgeführt.';

  @override
  String mergedServerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Auf $count Servern',
    );
    return '$_temp0';
  }

  @override
  String mergedCopiesNotChanged(String servers) {
    return 'Nicht geändert auf $servers';
  }

  @override
  String get recentlyAddedAndReleased => 'Kürzlich hinzugefügt und erschienen';

  @override
  String get hideWatchedInRecentRows => 'Gesehenes ausblenden';

  @override
  String get hideWatchedInRecentRowsDescription =>
      'Gesehene Inhalte in den Startseitenzeilen „Kürzlich hinzugefügt“ und „Kürzlich erschienen“ ausblenden.';

  @override
  String get mergeRecentRowsByType =>
      'Neue Inhalte nach Medientyp zusammenfassen';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Fasst separate Bibliotheken desselben Medientyps in den Startseitenzeilen „Kürzlich hinzugefügt“ und „Kürzlich veröffentlicht“ zusammen.';

  @override
  String get libraryView => 'Bibliotheks Ansicht';

  @override
  String get libraryStyle => 'Stil der Videobibliothek';

  @override
  String get libraryStyleDescription =>
      '„Klassisch“ ist die ursprüngliche Kopfzeile mit Symboltasten. „Modern“ fasst die Suche und beschriftete Tasten für Sortierung, Gruppierung und Filter in einer Leiste zusammen. „Angedockt“ verschiebt die Steuerelemente und die Buchstaben in eine Seitenleiste.';

  @override
  String get libraryStyleDescriptionPhone =>
      '„Klassisch“ ist die ursprüngliche Kopfzeile mit Symboltasten. „Modern“ ergänzt unter der Suche beschriftete Chips für Sortierung, Gruppierung und Filter. „Angedockt“ hält die Steuerelemente in einer Leiste am unteren Bildschirmrand.';

  @override
  String get libraryStyleClassic => 'Klassisch';

  @override
  String get libraryStyleModern => 'Modern';

  @override
  String get libraryStyleDocked => 'Angedockt';

  @override
  String get bookLibraryStyle => 'Stil der Buchbibliothek';

  @override
  String get bookLibraryStyleDescription =>
      'Klassisch zeigt die ursprünglichen Regale unter einem hervorgehobenen Titel. Lesesaal zeigt zuerst auf großen Karten, was du gerade liest. Buchhandlung zeigt die ganze Bibliothek in einem Raster.';

  @override
  String get bookLibraryStyleClassic => 'Klassisch';

  @override
  String get bookLibraryStyleReadingRoom => 'Lesesaal';

  @override
  String get bookLibraryStyleBookstore => 'Buchladen';

  @override
  String get musicLibraryStyle => 'Stil der Musikbibliothek';

  @override
  String get musicLibraryStyleDescription =>
      'Klassisch zeigt die ursprünglichen Zeilen unter einer Weiterhören-Karte. Schnellzugriff beginnt mit einem Raster deiner letzten Alben und Playlists. Immersiv beginnt mit dem Album, das du gerade hörst.';

  @override
  String get musicLibraryStyleClassic => 'Klassisch';

  @override
  String get musicLibraryStyleQuickAccess => 'Schnellzugriff';

  @override
  String get musicLibraryStyleImmersive => 'Immersiv';

  @override
  String get jumpBackIn => 'Weiterhören';

  @override
  String get yourPlaylists => 'Deine Playlists';

  @override
  String get fromThisAlbum => 'Aus diesem Album';

  @override
  String get searchMusic => 'Musik durchsuchen';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Serien',
      one: '1 Serie',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count in Bearbeitung';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Alle $count Titel durchsuchen',
      one: '1 Titel durchsuchen',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Bücher durchsuchen';

  @override
  String get libraryShowLabel => 'Anzeigen';

  @override
  String get libraryAToZ => 'A bis Z';

  @override
  String get libraryJumpToLetter => 'Zu Buchstabe springen';

  @override
  String get groupItemsIntoCollections => 'Inhalte in Sammlungen gruppieren';

  @override
  String get hideCollectionAssociatedItems =>
      'Zu Sammlungen gehörende Bibliothekselemente beim Durchsuchen von Bibliotheken ausblenden';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Hinweis zur Bibliotheksgruppierung';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Um diese Einstellung zu nutzen, stellen Sie sicher, dass die Bibliothekseinstellungen „Filme in Sammlungen gruppieren“ und/oder „Serien in Sammlungen gruppieren“ in den Anzeigeeinstellungen Ihrer Bibliothek auf Ihrem Jellyfin- oder Emby-Server aktiviert sind.';

  @override
  String get libraryVisibility => 'Bibliothekssichtbarkeit';

  @override
  String get libraryVisibilityDescription =>
      'Schalten Sie die Sichtbarkeit der Startseite pro Bibliothek um. Starten Sie Moonfin neu, damit die Änderungen wirksam werden.';

  @override
  String get showInNavigation => 'In Navigation anzeigen';

  @override
  String get showInLatestMedia =>
      'In „Kürzlich hinzugefügt“ und „Kürzlich veröffentlicht“ anzeigen';

  @override
  String get libraryOrder => 'Reihenfolge der Bibliotheken';

  @override
  String get libraryOrderSubtitle =>
      'Wähle die Reihenfolge deiner Bibliotheken';

  @override
  String get libraryOrderDescription =>
      'Ihre Mediatheken erscheinen in dieser Reihenfolge unter „Meine Medien“, in den Zeilen für kürzlich hinzugefügte Inhalte sowie in der Navigationsleiste. Die Reihenfolge wird in Ihrem Server-Konto gespeichert, sodass sie auch in anderen Apps, bei denen Sie sich anmelden, übernommen wird.';

  @override
  String get libraryOrderTvHint =>
      'Drücke links oder rechts, um die markierte Bibliothek zu verschieben.';

  @override
  String get libraryOrderSaveFailed =>
      'Reihenfolge der Bibliotheken konnte nicht gespeichert werden';

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
    return '$count ausgewählt';
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
  String get mediaBarMode => 'Stil der Medienleiste';

  @override
  String get mediaBarModeDescription =>
      'Wählen Sie zwischen verschiedenen Stilen für die Medienleiste oder schalten Sie die Medienleiste aus';

  @override
  String get peekHomeRows => 'Startseitenzeilen anschneiden';

  @override
  String get peekHomeRowsDescription =>
      'Die obere Hälfte der ersten Zeile am unteren Rand der Medienleiste anzeigen';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Aus';

  @override
  String get mediaBarModeBookshelf => 'Bücherregal';

  @override
  String get mediaBarModeGallery => 'Gallerie';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Medienleiste aktivieren';

  @override
  String get showFeaturedContentSlideshow =>
      'Empfohlene Inhalte als Diashow auf der Startseite anzeigen';

  @override
  String get contentType => 'Inhaltstyp';

  @override
  String get mediaBarSourceType => 'Quelle';

  @override
  String get mediaBarSourceRandom => 'Zufall';

  @override
  String get mediaBarNewReleaseBanner => 'Neuerscheinungs-Banner';

  @override
  String get mediaBarNewReleaseDaysDescription =>
      'Wie lange eine Episode nach der Ausstrahlung noch als neu gilt.';

  @override
  String get mediaBarNewSeries => 'Neue Serie';

  @override
  String get mediaBarNewSeason => 'Neue Staffel';

  @override
  String get mediaBarNewEpisodes => 'Neue Episoden';

  @override
  String get mediaBarNewMovie => 'Neuer Film';

  @override
  String get mediaBarNewReleasesSection => 'Neuerscheinungen';

  @override
  String get mediaBarSourceNewReleasesAll => 'Neuerscheinungen';

  @override
  String get mediaBarNewReleaseBannerAllDescription =>
      'Neue Serien, Staffeln, Episoden und Filme markieren.';

  @override
  String get mediaBarNewReleaseKinds => 'Labels';

  @override
  String get mediaBarNewEpisodeDays => 'Zeitraum für neue Episoden';

  @override
  String get mediaBarNewMovieDays => 'Zeitraum für neue Filme';

  @override
  String get mediaBarNewMovieDaysDescription =>
      'Wie lange ein Film nach dem Erscheinen als neu gilt. Kinofilme landen oft erst eine Weile nach dem Start auf Servern, daher sollte der Zeitraum länger sein als bei Episoden.';

  @override
  String get mediaBarNewMovieDetail => 'Tagline anzeigen';

  @override
  String get mediaBarNewMovieDetailDescription =>
      'Unter „Neuer Film“ die Tagline des Films anzeigen. Gibt es keine, steht das Label allein.';

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
  String get trailerAudio => 'Trailer-Audio';

  @override
  String get enableTrailerAudio =>
      'Ton für Trailer in der Medienleiste aktivieren';

  @override
  String get trailerVolume => 'Trailer-Lautstärke';

  @override
  String get trailerVolumeDescription =>
      'Wie laut Trailer in der Medienleiste abgespielt werden';

  @override
  String get trailerCaptions => 'Trailer Untertitel';

  @override
  String get trailerCaptionsDescription =>
      'Zeige Untertitel bei Youtube Trailern in der Media Leiste';

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
      'Audiowiedergabe für Inhaltsvorschauen aktivieren';

  @override
  String get previewVolume => 'Vorschau-Lautstärke';

  @override
  String get previewVolumeDescription =>
      'Wie laut Medienvorschauen auf Karten abgespielt werden';

  @override
  String get latestMedia => 'Kürzlich hinzugefügte Medien';

  @override
  String get recentlyReleased => 'Kürzlich veröffentlicht';

  @override
  String get recentlyReleasedSeriesType =>
      'Kürzlich veröffentlichte Serien sortieren nach';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sortiert die Startseitenzeile „Kürzlich veröffentlichte Serien“ nach Serie, der neuesten Staffel oder dem Ausstrahlungsdatum der neuesten Episode.';

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
  String get favoriteChannels => 'Favoriten Kanäle';

  @override
  String get resetToDefaults => 'Auf Standard zurücksetzen';

  @override
  String get homeRowPosterSize => 'Startseiten-Postergröße';

  @override
  String get configureImageTypeForEachRow =>
      'Bildtyp für jede aktivierte Startseitenreihe konfigurieren';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Weiterschauen und Als Nächstes zusammenführen';

  @override
  String get combineBothRows =>
      'Beide Reihen in einen Startseitenbereich zusammenführen.';

  @override
  String get continueWatchingDefaultAction => 'Standardaktion';

  @override
  String get continueWatchingDefaultActionDescription =>
      'Was das Auswählen eines Elements aus „Weiterschauen“ oder „Als Nächstes“ bewirkt';

  @override
  String get goToDetailsScreen => 'Zu den Details';

  @override
  String get playImmediately => 'Sofort abspielen';

  @override
  String get nextUpMaxDays => 'Maximale Tage in Als Nächstes';

  @override
  String get nextUpMaxDaysDescription =>
      'Wie lange eine Sendung in Als Nächstes angezeigt wird nachdem sie angesehen wurde.';

  @override
  String daysValue(int days) {
    return '$days Tage';
  }

  @override
  String get fullScreenRows => 'Erweiterte Startseiten-Zeilen';

  @override
  String get fullScreenRowsDescription =>
      'Startseite auf eine Zeile pro Bildschirm begrenzen.';

  @override
  String get homeRowsPadding => 'Innenabstand der Startseitenzeilen';

  @override
  String get homeRowsPaddingDescription =>
      'Passen Sie den Abstand zwischen den Zeilen auf der Startseite an.';

  @override
  String get homeRowsGenresAndStudios => 'Genres und Studios';

  @override
  String get homeRowsExternalLists => 'Externe Listen';

  @override
  String get homeRowsStreamingServices => 'Streamingdienste';

  @override
  String get perRowSettings => 'Einstellungen pro Reihe';

  @override
  String get autoLogin => 'Automatische Anmeldung';

  @override
  String get lastUser => 'Letzter Benutzer';

  @override
  String get currentUser => 'Aktueller Benutzer';

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
  String get pinSynced => 'PIN synchronisiert';

  @override
  String get pinResetFailed =>
      'Die PIN auf dem Server konnte nicht entfernt werden. Falls sie noch gesetzt ist, bitte einen Server-Administrator, sie zu entfernen.';

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
    return '$minutes Min.';
  }

  @override
  String get dimmingLevel => 'Abdunklungsstufe';

  @override
  String get screensaverDuringAudio => 'Bei Musik und Hörbüchern anzeigen';

  @override
  String get screensaverDuringAudioDescription =>
      'Den Bildschirmschoner auch während der Audiowiedergabe starten lassen, damit das Cover nicht stundenlang auf dem Bildschirm steht.';

  @override
  String get sleepAfterIdle => 'Fernseher in Ruhezustand lassen nach';

  @override
  String get sleepAfterIdleDescriptionAndroid =>
      'Moonfin nach dieser Zeit ohne Tastendruck schließen, damit Bildschirmschoner und Sleep-Timer des Fernsehers übernehmen können. Pausierte Inhalte werden vorher gestoppt, damit die Fortsetzungsposition erhalten bleibt.';

  @override
  String get sleepAfterIdleDescriptionAppleTv =>
      'Nach dieser Zeit ohne Tastendruck den Bildschirm an den Bildschirmschoner und die Ruhezustandseinstellung deines Apple TV zurückgeben. Moonfin bleibt geöffnet, sodass du genau dort weitermachst, wo du aufgehört hast.';

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
  String get displayClockDuringScreensaver =>
      'Uhr während des Bildschirmschoners anzeigen';

  @override
  String get clockModeStatic => 'Statisch';

  @override
  String get clockModeBouncing => 'Springend';

  @override
  String get screensaverGeneralSettings => 'Allgemeine Einstellungen';

  @override
  String get screensaverVisualComponents => 'Visuelle Komponenten';

  @override
  String get screensaverLibraryContent => 'Bibliotheksinhalt';

  @override
  String get screensaverBackdrop => 'Hintergrundbild';

  @override
  String get screensaverBackdropBlack => 'Schwarz';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Ruhig';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Zusätzliche Komponente';

  @override
  String get screensaverComponentMoonfinLogo => 'Moonfin-Logo';

  @override
  String get screensaverComponentRunner => 'Läufer';

  @override
  String get screensaverComponentMovement => 'Bewegung der Komponente';

  @override
  String get screensaverComponentPosition => 'Position der Komponente';

  @override
  String get screensaverComponentSize => 'Größe der Komponente';

  @override
  String get screensaverSourceLibrariesDefault => 'Alle (Standard)';

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
  String get letterboxd => 'Letterboxd';

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
  String get mdblistWatchingNow => 'Wird auf MDBList geschaut';

  @override
  String watchingNowWatchersCount(int count) {
    return '$count schauen';
  }

  @override
  String watchingNowLiveSummary(String users, String movies, String shows) {
    return '$users schauen gerade · $movies Filme · $shows Serien';
  }

  @override
  String watchingNowLiveSummaryToday(
    String users,
    String movies,
    String shows,
  ) {
    return '$users haben heute geschaut · $movies Filme · $shows Serien';
  }

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
  String get pluginDetected => 'Plugin erkannt';

  @override
  String get pluginNotDetected => 'Plugin nicht erkannt';

  @override
  String get pluginNotDetectedDescription =>
      'Server-Plugin nicht erkannt. Lokale Einstellungen verwenden weiterhin gespeicherte Werte oder eingebaute Standards.';

  @override
  String get moonbaseAddress => 'Moonbase-Adresse';

  @override
  String get pluginConnected => 'Verbunden';

  @override
  String pluginConnectedVersion(String version) {
    return 'Verbunden, Version $version';
  }

  @override
  String get pluginSyncOn => 'Synchronisierung an';

  @override
  String get pluginSyncOff => 'Synchronisierung aus';

  @override
  String get syncProfileDescription =>
      'Dieses Gerät synchronisiert sich mit dem gewählten Profil, bis du ein anderes wählst.';

  @override
  String get profileAppliesEverywhere => 'Gilt überall';

  @override
  String get profileOverridesGlobal => 'Überschreibt Global';

  @override
  String get profileThisDevice => 'Dieses Gerät';

  @override
  String get profileLoad => 'Laden';

  @override
  String get profileLoadSubtitle => 'Server zu diesem Gerät';

  @override
  String get profileSaveSubtitle => 'Dieses Gerät zum Server';

  @override
  String resetNamedProfile(String profile) {
    return 'Profil $profile zurücksetzen';
  }

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
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres und Tags';

  @override
  String get seerrDiscoveryRows => 'Seerr-Entdeckungszeilen';

  @override
  String get seerrDiscoverSliders => 'Seerr-Entdecken-Slider';

  @override
  String get yourWatchlist => 'Deine Watchlist';

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
  String get showMissingCollectionItems =>
      'Fehlende Sammlungselemente anzeigen';

  @override
  String get showMissingCollectionItemsDesc =>
      'Fehlende Elemente auf Sammlungsseiten einbeziehen';

  @override
  String get showSeerrAvailabilityBadges =>
      'Seerr-Verfügbarkeitsabzeichen anzeigen';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Den Seerr-Status in der ganzen App auf Postern und Staffeln anzeigen';

  @override
  String get seerrBadgeStyle => 'Abzeichenstil';

  @override
  String get seerrBadgeStyleDescription =>
      '„Abzeichen“ zeigt den Seerr-Status als Punkt in einer Ecke. „Banner“ zeigt ihn als Streifen oben über dem Poster.';

  @override
  String get seerrBadgeStyleBadge => 'Abzeichen';

  @override
  String get seerrNotificationsSection => 'Benachrichtigungen';

  @override
  String get seerrNotifyNewRequestsTitle =>
      'Benachrichtigungen zu neuen Anfragen';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Benachrichtigen, wenn jemand eine Anfrage stellt';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Anfrage-Updates';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Genehmigt, abgelehnt und zur Bibliothek hinzugefügt';

  @override
  String get seerrNotifyIssuesTitle => 'Problem-Updates';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Neue Probleme, Antworten und Lösungen';

  @override
  String get seerrNotifyNewMediaTitle => 'Neue Medien hinzugefügt';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Benachrichtigt Sie über alle neu zur Serverbibliothek hinzugefügten Medien.';

  @override
  String get seerrTestNotification => 'Testbenachrichtigung senden';

  @override
  String get seerrTestNotificationDesc =>
      'Zustellung von In-App- und Hintergrund-Push prüfen';

  @override
  String seerrTestNotificationSentBody(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Geräte',
      one: '1 Gerät',
    );
    return 'An $_temp0 gesendet.';
  }

  @override
  String get seerrTestNotificationPushDisabled =>
      'In-App-Benachrichtigung gesendet. Server-Push ist nicht aktiviert.';

  @override
  String get seerrTestNotificationFailed =>
      'Testbenachrichtigung konnte nicht gesendet werden';

  @override
  String get seerrPushServerStatus => 'Server-Push';

  @override
  String get seerrPushDeviceStatus => 'Geräte-Push';

  @override
  String get seerrPushDeviceRegistered => 'Registriert';

  @override
  String get seerrPushDeviceNotRegistered => 'Nicht registriert';

  @override
  String loggedInAs(String username) {
    return 'Angemeldet als: $username';
  }

  @override
  String get discoverRows => 'Seerr-Entdecken-Seite';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Aktiviere die Reihen, die auf der Seerr-Hauptseite erscheinen sollen. Zum Neuordnen ziehen. Die eigene Reihenfolge wird mit Moonbase synchronisiert.';

  @override
  String get discoverRowsDescription =>
      'Aktiviere die Reihen, die auf der Seerr-Hauptseite erscheinen sollen. Zum Neuordnen ziehen. Die eigene Reihenfolge wird mit Moonbase synchronisiert.';

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
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'Update verfügbar: v$version';
  }

  @override
  String get updateNotifications => 'Update-Benachrichtigungen';

  @override
  String get showWhenUpdatesAvailable =>
      'Anzeigen, wenn Updates verfügbar sind';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Verfügbar';
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
  String get featuredContentAppearance =>
      'Empfohlene Inhalte, Erscheinungsbild';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Bildcache-Limit';

  @override
  String get clearImageCache => 'Bildcache leeren';

  @override
  String get imageCacheCleared => 'Bildcache geleert';

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
  String get seerrDownloading => 'Herunterladen';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Herunterladen · $done / $total';
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
    return 'Wird heruntergeladen · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Wird importiert';

  @override
  String get seerrWaitingForImport => 'Heruntergeladen, wartet auf Import';

  @override
  String get seerrDownloadStalled => 'Hängt';

  @override
  String get seerrDownloadFailed => 'Download fehlgeschlagen';

  @override
  String get seerrImportBlocked => 'Import blockiert';

  @override
  String get seerrNotFoundYet => 'Noch nicht gefunden';

  @override
  String get seerrSearchingIndexers => 'Indexer werden durchsucht';

  @override
  String seerrNotFoundYetSearched(String when) {
    return 'Noch nicht gefunden · gesucht $when';
  }

  @override
  String get seerrNotAvailableYet => 'Noch nicht verfügbar';

  @override
  String seerrAvailableOn(String date) {
    return 'Verfügbar ab $date';
  }

  @override
  String seerrNextEpisodeOn(String date) {
    return 'Nächste Episode $date';
  }

  @override
  String get seerrGetDifferentRelease => 'Anderes Release holen';

  @override
  String seerrGetDifferentReleaseConfirm(String service, String release) {
    return '$service entfernt $release aus dem Download-Client, blockiert es, damit es nicht erneut geholt wird, und sucht nach einem anderen Release.';
  }

  @override
  String seerrGetDifferentReleaseDone(String service) {
    return 'Entfernt. $service sucht nach einem anderen Release.';
  }

  @override
  String get seerrGetDifferentReleaseFailed =>
      'Der Download konnte nicht entfernt werden';

  @override
  String itemsCount(int count) {
    return '$count Elemente';
  }

  @override
  String get seerrSettings => 'Seerr-Einstellungen';

  @override
  String get requestMore => 'Mehr anfordern';

  @override
  String get requestMore4k => 'Weitere Staffeln in 4K anfordern';

  @override
  String get request => 'Anfordern';

  @override
  String get request4k => '4K Anfragen';

  @override
  String get requested4k => '4K angefragt';

  @override
  String get cancelRequest => 'Anfrage abbrechen';

  @override
  String get cancelRequest4k => '4K Anfrage abbrechen';

  @override
  String get playInMoonfin => 'In Moonfin abspielen';

  @override
  String get requestedByLabel => 'Angefragt von';

  @override
  String requestedByName(String name) {
    return 'Angefordert von $name';
  }

  @override
  String get manageRequests => 'Anfragen verwalten';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'auf Watchlist';

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
    return 'Anfrage für „$title“ abbrechen?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return '$count Anfragen für „$title“ abbrechen?';
  }

  @override
  String get keep => 'Behalten';

  @override
  String get removeRequest => 'Remove Request';

  @override
  String removeFailedRequestForTitle(String title) {
    return 'Your failed request for \"$title\" will be deleted. You can request it again later.';
  }

  @override
  String get removeFailedRequestRefused =>
      'The request wasn\'t removed. It was retried, or part of it arrived.';

  @override
  String removeOthersFailedRequestForTitle(String title, String name) {
    return 'The failed request for \"$title\" by $name will be deleted. They can request it again later.';
  }

  @override
  String get removeFailedRequestError =>
      'Couldn\'t remove the request. Try again.';

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
    return 'Umsatz: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Anfrage $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return '$type in 4K anfordern';
  }

  @override
  String get submitRequest => 'Anfrage absenden';

  @override
  String get allSeasons => 'Alle Staffeln';

  @override
  String get seerrSeriesContinuing =>
      'Laufende Serie · Zukünftige Staffeln können angefordert werden';

  @override
  String get seerrSeriesMatchDescription =>
      'Diese Serie konnte nicht automatisch zugeordnet werden. Wähle unten die richtige aus.';

  @override
  String get seerrSeriesNoMatch =>
      'Für diese Serie wurde keine Übereinstimmung gefunden, daher kann sie nicht angefragt werden.';

  @override
  String get seerrSeriesMatchFailed =>
      'Sonarr hat keine Übereinstimmung für diese Serie gefunden oder war nicht erreichbar. Versuche es erneut oder prüfe die Serie in Seerr.';

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
    return 'Alter $age';
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
  String get failedStatus => 'Fehlgeschlagen';

  @override
  String get processingStatus => 'In Bearbeitung';

  @override
  String modifiedByName(String name) {
    return 'Geändert von $name';
  }

  @override
  String get completedStatus => 'Abgeschlossen';

  @override
  String get requestErrorDuplicate => 'Dieser Titel wurde bereits angefragt';

  @override
  String get requestErrorQuota => 'Anfragelimit erreicht';

  @override
  String get requestErrorBlocklisted => 'Dieser Titel steht auf der Sperrliste';

  @override
  String get requestErrorNoSeasons => 'Keine Staffeln mehr zum Anfragen übrig';

  @override
  String get requestErrorPermission =>
      'Sie haben keine Berechtigung für diese Anfrage';

  @override
  String get seerrRequestsTitle => 'Anfragen';

  @override
  String get seerrIssuesTitle => 'Probleme';

  @override
  String get sortNewest => 'Neueste';

  @override
  String get sortLastModified => 'Zuletzt geändert';

  @override
  String get noIssues => 'Keine Probleme';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Noch $remaining von $limit Filmanfragen übrig';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Noch $remaining von $limit Staffelanfragen übrig';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Teil von $name';
  }

  @override
  String get viewCollection => 'Sammlung anzeigen';

  @override
  String get requestCollection => 'Sammlung anfragen';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total Filme · $available verfügbar';
  }

  @override
  String requestMoviesCount(int count) {
    return '$count Filme anfragen';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Anfrage $current von $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count Filme angefragt';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok von $total Filmen angefragt';
  }

  @override
  String get collectionAllRequested =>
      'Alle Filme sind bereits verfügbar oder angefragt';

  @override
  String get reportIssue => 'Problem melden';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Was ist das Problem?';

  @override
  String get allEpisodes => 'Alle Episoden';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Offen';

  @override
  String get resolvedStatus => 'Gelöst';

  @override
  String get resolveAction => 'Lösen';

  @override
  String get reopenAction => 'Wieder öffnen';

  @override
  String reportedByName(String name) {
    return 'Gemeldet von $name';
  }

  @override
  String commentsCount(int count) {
    return '$count Kommentare';
  }

  @override
  String get addComment => 'Kommentar hinzufügen';

  @override
  String get deleteIssueConfirm => 'Dieses Problem löschen?';

  @override
  String get submitReport => 'Meldung absenden';

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
  String get seasonsLabel => 'Staffeln';

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
  String get search => 'Suchen';

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
  String get trickplay => 'Trickplay';

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
  String get adminDrawerDashboard => 'Übersicht';

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
  String get adminDrawerDisplay => 'Anzeige';

  @override
  String get adminDrawerMetadata => 'Metadaten';

  @override
  String get adminDrawerNfo => 'NFO-Einstellungen';

  @override
  String get adminDrawerTranscoding => 'Transkodierung';

  @override
  String get adminDrawerResume => 'Fortsetzen';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminPremiereNoteLiveTv =>
      'Live-TV benötigt Emby Premiere. Ohne Premiere importiert der Server keine Kanäle und nimmt nichts auf.';

  @override
  String get adminPremiereNoteBackups =>
      'Backup & Restore benötigt nach Ablauf der Testphase Emby Premiere.';

  @override
  String get adminGeneralRunAtStartup => 'Server beim Systemstart ausführen';

  @override
  String get adminGeneralLaunchWebApp =>
      'Beim Serverstart die Web-App in einem Browser öffnen';

  @override
  String get adminGeneralBannerText => 'Bannertext auf der Startseite';

  @override
  String get adminGeneralBannerTextHelp =>
      'Wird allen Nutzern auf ihrer Startseite angezeigt';

  @override
  String get adminGeneralSectionMaintenance => 'Wartungsmodus';

  @override
  String get adminGeneralMaintenanceMode =>
      'Server in den Wartungsmodus versetzen';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Nutzer sehen nur die Wartungsmeldung.';

  @override
  String get adminGeneralMaintenanceMessage => 'Wartungsmeldung';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Leer lassen für eine allgemeine Meldung in der Sprache des jeweiligen Nutzers.';

  @override
  String get adminGeneralSectionUpdates => 'Automatische Updates';

  @override
  String get adminGeneralAutoUpdate => 'Server automatisch aktualisieren';

  @override
  String get adminGeneralAutoRestart =>
      'Automatisch neu starten, um Updates anzuwenden';

  @override
  String get adminGeneralAutoRestartHelp =>
      'Der Server startet nur neu, wenn keine Nutzer aktiv sind.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'Nach einem Systemereignis ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Benötigt Emby Premiere nach einer 14-tägigen kostenlosen Testphase';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby erstellt Backups über das Plugin „Backup & Restore“.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'Das Plugin „Backup & Restore“ ist nicht installiert. Installiere es aus dem Plugin-Katalog, um diesen Server zu sichern.';

  @override
  String get adminEmbyBackupNow => 'Jetzt sichern';

  @override
  String get adminEmbyFullBackup => 'Vollständiges Backup';

  @override
  String get adminEmbyLightBackups => 'Datenbank-Backups';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return '$name wiederherstellen? Dabei werden Bibliotheken, Einstellungen, Nutzer und Passwörter dieses Servers ersetzt, und der Server fährt danach herunter. Möglicherweise musst du ihn selbst wieder starten.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Server-ID wiederherstellen';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Deaktiviere dies, wenn du dasselbe Backup auf mehreren Servern wiederherstellst.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'Die Wiederherstellung ist abgeschlossen und der Server fährt herunter. Starte ihn erneut, falls er nicht von selbst neu startet.';

  @override
  String get adminHiddenRemotely =>
      'Bei Remote-Verbindungen auf Anmeldebildschirmen ausblenden';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Auf Anmeldebildschirmen von Geräten ausblenden, auf denen sich der Nutzer noch nie angemeldet hat';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Begrenzt, wie viele Videos dieser Nutzer gleichzeitig abspielen kann.';

  @override
  String get adminUnlimited => 'Unbegrenzt';

  @override
  String get adminAutoRemoteQuality => 'Automatische Remote-Qualität (Mbit/s)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Wird remote verwendet, wenn der Player auf automatische Qualität eingestellt ist. Leer lassen, um sie automatisch zu ermitteln.';

  @override
  String get adminAllowCameraUpload => 'Kamera-Upload erlauben';

  @override
  String get adminAllowSubtitleDownloading =>
      'Herunterladen von Untertiteln erlauben';

  @override
  String get adminAllowMediaConversion => 'Medienkonvertierung erlauben';

  @override
  String get adminAllowSyncTranscoding =>
      'Downloads erlauben, die Transkodierung erfordern';

  @override
  String get adminAllowSharingPersonalItems =>
      'Teilen von Playlists mit anderen Nutzern erlauben';

  @override
  String get adminAllowPreferenceAccess =>
      'Ändern des eigenen Passworts und Profilbilds erlauben';

  @override
  String get adminTagMode => 'Tag-Modus';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby-Connect-Benutzername oder E-Mail';

  @override
  String get adminEmbyConnectHelp =>
      'Ermöglicht diesem Nutzer die Anmeldung über jede Emby-App, ohne die Serveradresse zu kennen.';

  @override
  String get adminEmbyConnectLink => 'Verknüpfen';

  @override
  String get adminEmbyConnectUnlink => 'Verknüpfung aufheben';

  @override
  String get adminEmbyConnectLinked => 'Mit Emby Connect verknüpft';

  @override
  String get adminEmbyConnectPending =>
      'Einladung gesendet. Die Verknüpfung wird hergestellt, sobald sie angenommen wird.';

  @override
  String get adminEmbyConnectUnlinked => 'Emby-Connect-Verknüpfung entfernt';

  @override
  String get adminEmbyConnectNotFound =>
      'Kein Emby-Connect-Konto hat diesen Benutzernamen oder diese E-Mail.';

  @override
  String get adminLibImportPlaylists => 'Playlist-Dateien importieren';

  @override
  String get adminLibExcludeFromSearch => 'Von der globalen Suche ausschließen';

  @override
  String get adminLibForcedSubtitlesOnly =>
      'Nur erzwungene Untertitel herunterladen';

  @override
  String get adminLibImportCollections =>
      'Sammlungen von Metadaten-Downloadern importieren';

  @override
  String get adminLibThumbnailInterval => 'Intervall für Vorschaubilder';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Alle $count Sekunden';
  }

  @override
  String get adminLibThumbnailAtChapters => 'An Kapitelmarken';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Vorschaubilder in Medienordnern speichern';

  @override
  String get adminLibrarySectionMarkers => 'Intro-Markierungen';

  @override
  String get adminLibIntroDetection => 'Intros erkennen';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Intros beim Bibliotheksscan erkennen';

  @override
  String get adminProviderEmbyGuide => 'Emby-Programmdaten';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Wähle ein Senderangebot aus. Falls keines aufgeführt ist, überprüfe die Postleitzahl. Senderangebote benötigen Emby Premiere.';

  @override
  String get adminLiveTvWakeServer => 'Server für Aufnahmen aufwecken';

  @override
  String get adminDrawerLiveTvChannels => 'Live-TV-Kanäle';

  @override
  String get adminPageDescLiveTvChannels =>
      'Kanäle aktivieren und deaktivieren und ihre Reihenfolge festlegen';

  @override
  String get adminLiveTvChannelsEmpty =>
      'Noch keine Kanäle. Sie erscheinen hier, sobald ein Tuner eingerichtet ist und der Server seine Kanäle importiert hat.';

  @override
  String get adminTranscodingHwaAdvanced => 'Fortschrittlich';

  @override
  String get adminTranscodingHwaHelp =>
      'Unter „Erweitert“ kannst du die Hardware-Codecs auswählen und sortieren.';

  @override
  String get adminTranscodingHwDecoders => 'Bevorzugte Hardware-Decoder';

  @override
  String get adminTranscodingHwEncoders => 'Bevorzugte Hardware-Encoder';

  @override
  String get adminTranscodingTempPathHelp =>
      'Wo der Transkodierer seine Arbeitsdateien ablegt. Leer lassen, um den Datenordner des Servers zu verwenden.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Verlangsamt die Transkodierung, sobald genug gepuffert ist, um die CPU-Last zu senken.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Erhöht die Lautstärke, wenn Audio heruntergemischt wird. 1 behält die ursprüngliche Lautstärke bei.';

  @override
  String get adminTranscodingFontExtraction =>
      'Schriftarten bei Bedarf extrahieren';

  @override
  String get adminTranscodingMaxResolution => 'Max. Transkodierungsauflösung';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'Ein Limit für jede Transkodierung, unabhängig davon, welche Qualität die App anfordert.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tone-Mapping bei Software-Transkodierung';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tone-Mapping bei Hardware-Transkodierung';

  @override
  String get adminTranscodingToneMapHelp =>
      'Verhindert, dass HDR-Video beim Transkodieren dunkel und blass aussieht.';

  @override
  String get adminNetworkingLocalAddress => 'Lokale IP-Adresse';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'Die lokale Adresse, die der Server an Apps weitergibt. Leer lassen, um sie automatisch zu ermitteln.';

  @override
  String get adminNetworkingBehindProxy =>
      'HTTPS wird von einem Reverse Proxy übernommen';

  @override
  String get adminNetworkingExternalDomain => 'Externe Domain';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'Eine Domain oder ein DynDNS-Name für Remote-Verbindungen, ohne Protokoll und Port. Wird für ein eigenes Zertifikat benötigt.';

  @override
  String get adminNetworkingUpnp => 'Automatische Portweiterleitung aktivieren';

  @override
  String get adminNetworkingUpnpHelp =>
      'Versucht, den öffentlichen Port per UPnP auf den lokalen Port weiterzuleiten. Manche Router unterstützen das nicht.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Proxy-Header für Client-Adressen auswerten';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Verwendet Header wie X-Forwarded-For, um die Adresse jedes Clients zu ermitteln. Nur hinter einem Reverse Proxy aktivieren.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Nur wenn sie Remote-Adressen enthalten';

  @override
  String get adminNetworkingIpv4Only =>
      'IPv4 für ausgehende Anfragen verwenden';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'Für den Fall, dass Metadatenanbieter und andere Dienste über IPv6 nicht erreichbar sind.';

  @override
  String get adminOnePerLine => 'Einer pro Zeile';

  @override
  String get adminStreamingStreamLimit => 'Max. gleichzeitige Videostreams';

  @override
  String get adminStreamingStreamLimitHelp =>
      'Wie viele Videos auf dem Server gleichzeitig abgespielt werden können. 0 bedeutet kein Limit.';

  @override
  String get adminSyncJobsConversions => 'Konvertierungsaufträge';

  @override
  String get adminSyncJobsDownloads => 'Download-Aufträge';

  @override
  String get adminSyncJobsEmpty => 'Keine Aufträge';

  @override
  String get adminSyncJobCancel => 'Auftrag abbrechen';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return '$name abbrechen und aus der Liste entfernen?';
  }

  @override
  String get adminSyncJobConverting => 'Wird konvertiert';

  @override
  String get adminSyncJobReady => 'Bereit zur Übertragung';

  @override
  String get adminSyncJobTransferring => 'Wird übertragen';

  @override
  String get adminSyncJobCompletedWithError => 'Mit Fehlern abgeschlossen';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente',
      one: '1 Element',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Datenbank';

  @override
  String get adminPageDescDatabase => 'Cache-Größe und Wartung';

  @override
  String get adminDatabaseWarning =>
      'Dies sind erweiterte Optionen. Lass sie auf den Standardwerten, sofern du keinen Grund hast, sie zu ändern.';

  @override
  String get adminDatabaseCacheSize => 'Datenbank-Cache-Größe (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'Wie viel von jeder Datenbankdatei der Server im Arbeitsspeicher hält. Mehr kann den Server beschleunigen. Wird nach einem Neustart wirksam.';

  @override
  String get adminDatabaseOptimize =>
      'Datenbank beim Herunterfahren des Servers optimieren';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Meist bewirkt das nichts, aber hin und wieder wird eine Analyse ausgeführt, die die Abfragen des Servers verbessert. Das Herunterfahren kann länger dauern.';

  @override
  String get adminDatabaseAnalysisLimit => 'Zeilenlimit für die Analyse';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'Ungefähr wie viele Zeilen jedes Index der Optimierungsschritt liest. Mehr Zeilen funktionieren besser, können das Herunterfahren aber verlangsamen.';

  @override
  String get adminDatabaseVacuum =>
      'Datenbank beim nächsten Start bereinigen (Vacuum)';

  @override
  String get adminDatabaseVacuumHelp =>
      'Baut die Datenbankdatei neu auf, damit sie möglichst wenig Platz belegt, was die Leistung verbessern kann. Der Server ist währenddessen nicht nutzbar und zeigt keinen Fortschritt an, also erzwinge kein Beenden. Die Option schaltet sich nach diesem Start wieder aus.';

  @override
  String get adminDrawerCinemaIntros => 'Kino-Intros';

  @override
  String get adminPageDescCinemaIntros =>
      'Trailer und Intros vor der Wiedergabe';

  @override
  String get adminCinemaIntrosPlayBefore => 'Intros abspielen vor';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Trailer neuer und kommender Filme einbeziehen';

  @override
  String get adminCinemaIntrosOlder => 'Trailer älterer Filme einbeziehen';

  @override
  String get adminCinemaIntrosLibrary =>
      'Trailer von Filmen aus meinen Bibliotheken einbeziehen';

  @override
  String get adminCinemaIntrosLibraryHelp =>
      'Erfordert eingerichtete lokale Trailer.';

  @override
  String get adminCinemaIntrosCount => 'Anzahl der abzuspielenden Trailer';

  @override
  String get adminCinemaIntrosParental => 'Intelligenter Jugendschutz';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Wählt nur Trailer mit gleicher oder niedrigerer Altersfreigabe als das, was geschaut wird.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Intros nur vor ungesehenen Inhalten abspielen';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Nur Trailer abspielen, die dem Geschauten ähneln';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'Basierend auf gemeinsamen Genres, Tags, Studios usw.';

  @override
  String get adminCinemaIntrosCustom => 'Eigene Intros';

  @override
  String get adminCinemaIntrosCustomPath => 'Ordner für eigene Intros';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'Ein Ordner mit Videos. Eines wird zufällig ausgewählt und nach den Trailern abgespielt.';

  @override
  String get adminCinemaIntrosCodecPath => 'Ordner für Codec-Intros';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'Ein Ordner mit Videos. Ein Video, dessen Dateiname zum Videocodec, Audiocodec, Audioprofil oder einem Tag passt, wird vor dem Hauptfilm abgespielt.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To und DLNA-Server';

  @override
  String get adminDlnaPlayTo => 'DLNA Play To aktivieren';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby kann Geräte in deinem Netzwerk finden und fernsteuern.';

  @override
  String get adminDlnaServer => 'DLNA-Server aktivieren';

  @override
  String get adminDlnaServerHelp =>
      'Ermöglicht dem Server, Medien an DLNA-Geräte zu streamen.';

  @override
  String get adminDlnaDefaultUser => 'Standardnutzer';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Wessen Bibliotheken verbundene Geräte sehen. Ein Geräteprofil kann das überschreiben.';

  @override
  String get adminDlnaDebugLog => 'DLNA-Debug-Protokollierung aktivieren';

  @override
  String get adminDlnaDebugLogHelp =>
      'Erzeugt große Protokolldateien. Nur zur Fehlersuche aktivieren.';

  @override
  String get adminDrawerCameraUpload => 'Kamera-Upload';

  @override
  String get adminPageDescCameraUpload =>
      'Wo Fotos von Handys gespeichert werden';

  @override
  String get adminCameraUploadPath => 'Ordner für Kamera-Uploads';

  @override
  String get adminCameraUploadPathHelp =>
      'Leer lassen, um den Standardordner zu verwenden. Ein eigener Ordner muss zusätzlich als Bibliothek hinzugefügt werden.';

  @override
  String get adminCameraUploadSubfolders =>
      'Für jedes Gerät einen Unterordner anlegen';

  @override
  String get adminDrawerConversions => 'Konvertierungen';

  @override
  String get adminPageDescConversions => 'Konvertierte Medien und Downloads';

  @override
  String get adminConversionsTempPath => 'Ordner für temporäre Dateien';

  @override
  String get adminConversionsTempPathHelp =>
      'Wo Medien während der Konvertierung abgelegt werden.';

  @override
  String get adminConversionsFullSpeed =>
      'Mit voller Geschwindigkeit konvertieren';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Konvertierungen laufen standardmäßig langsam, um die Last gering zu halten.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'Lizenzstatus und Schlüssel';

  @override
  String get adminPremiereActive => 'Premiere ist auf diesem Server aktiv.';

  @override
  String get adminPremiereInactive =>
      'Dieser Server hat keinen Premiere-Schlüssel.';

  @override
  String get adminPremiereKeyInvalid =>
      'Ein Schlüssel ist eingetragen, aber nicht aktiv. Möglicherweise ist er falsch eingegeben oder abgelaufen.';

  @override
  String get adminPremiereCurrentKey => 'Aktueller Schlüssel';

  @override
  String get adminPremiereNewKey => 'Neuer Schlüssel';

  @override
  String get adminPremiereNewKeyHint =>
      'Füge den Schlüssel aus deiner Emby-Premiere-E-Mail ein.';

  @override
  String get adminPremiereSaveKey => 'Schlüssel speichern';

  @override
  String get adminPremiereRemoveKey => 'Schlüssel entfernen';

  @override
  String get adminPremiereKeyRejected =>
      'Emby hat den Schlüssel gespeichert, aber nicht akzeptiert.';

  @override
  String get adminPremiereLoadFailed =>
      'Der Premiere-Status konnte nicht geladen werden';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere erforderlich';

  @override
  String get embyPremiereRequiredBody =>
      'Dafür ist ein aktives Emby-Premiere-Abo auf dem Server erforderlich.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'Dafür ist ein aktives Emby-Premiere-Abo erforderlich. Emby behält die Einstellung, verwendet sie aber erst, wenn Premiere aktiv ist.';

  @override
  String get embyPremiereLearnMore => 'Mehr erfahren';

  @override
  String get embyPremiereSaveAnyway => 'Trotzdem speichern';

  @override
  String get embyPremiereEnterKey => 'Schlüssel eingeben';

  @override
  String get adminPremiereNote =>
      'Benötigt Emby Premiere. Der Server behält diese Einstellung, verwendet sie aber erst, wenn Premiere aktiv ist.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name-ID';
  }

  @override
  String get adminExternalIdTypePerson => 'Person';

  @override
  String get adminExternalIdTypeArtist => 'Künstler';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Album Interpret';

  @override
  String get adminExternalIdTypeOtherArtist => 'Weiterer Künstler';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Release-Gruppe';

  @override
  String get adminExternalIdTypeBook => 'Buch';

  @override
  String get adminPlaybackHwAccelWarning =>
      'Hardwarebeschleunigung kann auf manchen Systemen instabil sein. Halte Betriebssystem und Grafiktreiber aktuell und stelle dies wieder auf „Keine“, wenn Videos nicht mehr abgespielt werden.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Änderungen an den Metadateneinstellungen gelten für neue Inhalte. Um vorhandene Inhalte zu aktualisieren, aktualisiere sie über ihre Detailseite oder aktualisiere die Bibliothek.';

  @override
  String get adminLibFetcherSettings => 'Einstellungen der Abrufdienste';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Bildoptionen für $type';
  }

  @override
  String get adminLibFetchImages => 'Bilder abrufen';

  @override
  String get adminLibMaxBackdrops =>
      'Maximale Anzahl an Hintergründen pro Element';

  @override
  String get adminLibMinBackdropWidth =>
      'Mindestbreite für heruntergeladene Hintergründe';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Box';

  @override
  String get adminImageTypeBoxRear => 'Box (Rückseite)';

  @override
  String get adminImageTypeDisc => 'Disc';

  @override
  String get adminImageTypeMenu => 'Menü';

  @override
  String get adminActivityMediaDetails => 'Mediendetails';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'z. B. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Originalsprache';

  @override
  String get adminMetadataFieldDateAdded => 'Hinzugefügt am';

  @override
  String get adminMetadataFieldArtists => 'Künstler';

  @override
  String get adminMetadataFieldAlbumArtists => 'Albuminterpreten';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Serienname';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Episodennummer';

  @override
  String get adminMetadataFieldSeasonNumber => 'Staffelnummer';

  @override
  String get adminMetadataFieldTrackNumber => 'Titelnummer';

  @override
  String get adminMetadataFieldDiscNumber => 'Discnummer';

  @override
  String get adminMetadataFieldAirTime => 'Sendezeit';

  @override
  String get adminMetadataFieldRuntime => 'Laufzeit in Minuten';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Geburtsort';

  @override
  String get adminMetadataFieldBirthDate => 'Geburtsdatum';

  @override
  String get adminMetadataFieldBirthYear => 'Geburtsjahr';

  @override
  String get adminMetadataFieldDeathDate => 'Sterbedatum';

  @override
  String get adminMetadataFieldAspectRatio => 'Ursprüngliches Seitenverhältnis';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Ausgestrahlt vor Staffel';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Ausgestrahlt nach Staffel';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Ausgestrahlt vor Episode';

  @override
  String get adminMetadataNamesHelp =>
      'Trenne mehrere Namen mit einem Semikolon.';

  @override
  String get adminMetadataSectionRatings => 'Bewertungen';

  @override
  String get adminMetadataItemLocked =>
      'Die Metadaten dieses Elements sind gesperrt. Entsperre sie, bevor du es identifizierst.';

  @override
  String get adminMetadataNameOrIdRequired =>
      'Gib einen Namen oder eine externe ID ein.';

  @override
  String get adminLibMetadataReaders => 'Metadatenleser';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Anbieter für ähnliche Elemente: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Anbieter für Mediensegmente';

  @override
  String get adminLibEnableLibrary => 'Bibliothek aktivieren';

  @override
  String get adminLibEnableLibraryHelp =>
      'Das Deaktivieren der Bibliothek blendet sie in allen Nutzeransichten aus.';

  @override
  String get adminLibSaveLyricsWithMedia =>
      'Songtexte in Medienordnern speichern';

  @override
  String get adminLibUseCustomTagDelimiters =>
      'Eigenes Tag-Trennzeichen verwenden';

  @override
  String get adminLibCustomTagDelimiters => 'Eigenes Tag-Trennzeichen';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Zeichen, die als Trennzeichen zwischen Tags behandelt werden.';

  @override
  String get adminLibDelimiterWhitelist => 'Ausnahmeliste für Trennzeichen';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Einträge, die nicht in Tags aufgeteilt werden sollen, einer pro Zeile.';

  @override
  String get adminLibDownloadLanguages => 'Download-Sprachen';

  @override
  String get adminLibraryFolderRequired =>
      'Füge dieser Bibliothek mindestens einen Ordner hinzu.';

  @override
  String get adminRenameLibraryWarning =>
      'Beim Umbenennen einer Bibliothek gehen alle ihre Metadaten verloren. Gehe mit Vorsicht vor.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Die Bibliothek „$name“ entfernen? Dateien auf dem Datenträger werden nicht gelöscht.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'Diese Medienorte werden aus der Bibliothek entfernt:';

  @override
  String get adminRefreshMode => 'Aktualisierungsmodus';

  @override
  String get adminRefreshModeScan => 'Nach neuen und geänderten Dateien suchen';

  @override
  String get adminRefreshModeMissing => 'Nach fehlenden Metadaten suchen';

  @override
  String get adminReplaceTrickplayImages =>
      'Vorhandene Trickplay-Bilder ersetzen';

  @override
  String get adminRefreshDialogHelp =>
      'Die Metadaten werden anhand der im Dashboard aktivierten Einstellungen und Internetdienste aktualisiert.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown von $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuner und Programminfo';

  @override
  String get adminLiveTvTabRecordings => 'Aufnahmen';

  @override
  String get adminLiveTvAddTuner => 'Tuner-Gerät hinzufügen';

  @override
  String get adminLiveTvEditTuner => 'Tuner-Gerät bearbeiten';

  @override
  String get adminLiveTvTunerType => 'Tuner-Typ';

  @override
  String get adminLiveTvDetectDevices => 'Meine Geräte erkennen';

  @override
  String get adminLiveTvNoNewDevices => 'Keine neuen Geräte gefunden';

  @override
  String get adminLiveTvDrmNote => 'Kanäle mit DRM werden nicht importiert.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner gespeichert';

  @override
  String get adminLiveTvDeleteTuner => 'Tuner-Gerät löschen';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Möchtest du dieses Tuner-Gerät wirklich löschen?';

  @override
  String get adminLiveTvDeleteProvider => 'Programminfo-Anbieter löschen';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Möchtest du diesen Programminfo-Anbieter wirklich löschen?';

  @override
  String get adminLiveTvProviderSaved => 'Programminfo-Anbieter gespeichert';

  @override
  String get adminLiveTvAddProvider => 'Anbieter hinzufügen';

  @override
  String get adminLiveTvRefreshGuide => 'Programmdaten aktualisieren';

  @override
  String get adminLiveTvMapChannels => 'Kanäle zuordnen';

  @override
  String get adminLiveTvNoTunerChannels => 'Keine Tuner-Kanäle gefunden';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'Ein Pfad oder eine URL zu einer XMLTV-Datei. Der Server liest sie ein und prüft sie auf Aktualisierungen. Für das Erstellen und Aktualisieren der Datei bist du selbst verantwortlich.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Erstelle ein Konto unter $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Anmelden';

  @override
  String get adminLiveTvSdLineup => 'Senderangebot';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Wähle ein Senderangebot aus. Falls keines aufgeführt ist, überprüfe Benutzername, Passwort und Postleitzahl.';

  @override
  String get adminLiveTvGuideDays =>
      'Anzahl der Tage, für die Programmdaten heruntergeladen werden';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'Mehr Tage ermöglichen eine weiter vorausschauende Planung und mehr Einträge, aber der Download dauert länger. „Automatisch“ wählt einen Wert anhand der Kanalanzahl.';

  @override
  String get adminLiveTvRecordingPath => 'Standard-Aufnahmepfad';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Wo Aufnahmen gespeichert werden. Wenn leer, wird der Programmdatenordner des Servers verwendet.';

  @override
  String get adminLiveTvStartWhenPossible => 'Wenn möglich früher starten';

  @override
  String get adminLiveTvStopWhenPossible => 'Wenn möglich später beenden';

  @override
  String get adminLiveTvMinutesBefore => 'Minuten vorher';

  @override
  String get adminLiveTvMinutesAfter => 'Minuten danach';

  @override
  String get adminLiveTvSectionGuide => 'Programmdaten';

  @override
  String get adminLiveTvSectionDefaultRecording =>
      'Standard-Aufnahmeeinstellungen';

  @override
  String get adminLiveTvSectionMetadata => 'Aufnahme-Metadaten';

  @override
  String adminUserLastActivity(String time) {
    return 'Letzte Aktivität $time';
  }

  @override
  String get adminCurrentPassword => 'Aktuelles Passwort';

  @override
  String get adminChannelAccess => 'Kanalzugriff';

  @override
  String get adminDeviceAccess => 'Gerätezugriff';

  @override
  String get adminDeleteFromAllLibraries => 'Alle Bibliotheken';

  @override
  String get adminUserDisabledBanner =>
      'Dieser Nutzer ist deaktiviert. Deaktiviere „Deaktiviert“ unter „Berechtigungen“, damit er sich wieder anmelden kann.';

  @override
  String get adminNewPasswordEmpty => 'Das neue Passwort darf nicht leer sein';

  @override
  String get adminScheduleStartBeforeEnd =>
      'Die Startzeit muss vor der Endzeit liegen';

  @override
  String get adminDashboardAlerts => 'Warnungen';

  @override
  String get adminSessionGoHome => 'Zur Startseite';

  @override
  String get adminPlayMethodRemux => 'Remuxing';

  @override
  String get adminPlayMethodDirectStream => 'Direct Stream';

  @override
  String get adminPlayMethodDirectPlay => 'Direkte Wiedergabe';

  @override
  String get adminLogLevelTrace => 'Trace';

  @override
  String get adminLogLevelDebug => 'Debug';

  @override
  String get adminLogLevelInformation => 'Information';

  @override
  String get adminLogLevelWarning => 'Warnung';

  @override
  String get adminLogLevelError => 'Fehler';

  @override
  String get adminLogLevelCritical => 'Kritisch';

  @override
  String get adminLogLevelNone => 'Keine';

  @override
  String get adminActivityAllUsers => 'Alle Nutzer';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Zuletzt ausgeführt $time, Dauer $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Fehlgeschlagen';

  @override
  String get adminTaskResultCancelled => 'Abgebrochen';

  @override
  String get adminTaskResultAborted =>
      'Durch Herunterfahren des Servers abgebrochen';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '$seconds s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Aufgabenauslöser löschen';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Möchtest du diesen Aufgabenauslöser wirklich löschen?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Alle $minutes Minuten';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Alle $hours Stunden';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes Minuten';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours Stunden';
  }

  @override
  String get adminTimeLimitHours => 'Zeitlimit (Stunden)';

  @override
  String get adminTranscodingDecodingFor =>
      'Hardware-Dekodierung aktivieren für';

  @override
  String get adminTranscodingThreadCountHelp =>
      'Die maximale Anzahl an Threads, die eine Transkodierung nutzen kann. Weniger Threads senken die CPU-Last, können aber für eine flüssige Wiedergabe zu langsam sein.';

  @override
  String get adminTranscodingThreadMax => 'Max.';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg-Pfad';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'Das FFmpeg, das der Server ausführt. Es wird auf dem Server festgelegt, nicht hier.';

  @override
  String get adminTranscodingAudioSeek => 'Audio-Spulstrategie';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'Wie der Server Audio behandelt, wenn du in einem HLS-Stream spulst.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Kopiertes Audio kürzen';

  @override
  String get adminTranscodingTranscodeAudio => 'Audio transkodieren';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Minimale Hörbuch-Fortsetzung (Minuten)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Hörbücher, die vor dieser Zeit gestoppt werden, gelten als ungespielt.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Verbleibende Minuten für Hörbuch-Fortsetzung';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Hörbücher, die mit weniger als so vielen verbleibenden Minuten gestoppt werden, gelten als gespielt.';

  @override
  String get adminBrandingSplashSection => 'Startbildschirm';

  @override
  String get adminBrandingSectionWebClient => 'Web-Client';

  @override
  String get adminBrandingSplashSizeHint =>
      'Eigene Bilder sollten ein Seitenverhältnis von 16:9 und eine Mindestgröße von 1920×1080 haben.';

  @override
  String get adminNetworkingSectionServerAddress =>
      'Einstellungen der Serveradresse';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS-Einstellungen';

  @override
  String get adminNetworkingSectionRemoteAccess =>
      'Einstellungen für den Fernzugriff';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP-Protokolle';

  @override
  String get adminNetworkingSectionDiscovery => 'Netzwerkerkennung';

  @override
  String get adminNetworkingSectionFirewall =>
      'Firewall- und Proxy-Einstellungen';

  @override
  String get adminNetworkingLocalHttpPort => 'Lokale HTTP-Portnummer';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'Die TCP-Portnummer für den HTTP-Server.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Auf dem HTTPS-Port lauschen. Damit das wirksam wird, muss außerdem ein gültiges Zertifikat festgelegt sein.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Lokale HTTPS-Portnummer';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'Die TCP-Portnummer für den HTTPS-Server.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Fügt der Server-URL ein Unterverzeichnis hinzu, z. B. https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress => 'An lokale Netzwerkadresse binden';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Überschreibt die lokale IP-Adresse des HTTP-Servers. Leer lassen, um an alle Adressen zu binden. Eine Änderung erfordert einen Neustart.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'IP-Adressen oder IP/Netzmasken-Einträge von Netzwerken, die bei Bandbreiten- und Fernzugriffslimits als lokal gelten. Leer lassen, um alle RFC1918-Adressen als lokal zu behandeln.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'IP-Adressen oder Hostnamen der Proxys vor diesem Server. Wird benötigt, um X-Forwarded-For-Header auszuwerten. Eine Änderung erfordert einen Neustart.';

  @override
  String get adminNetworkingCustomCertPath => 'Pfad zum eigenen SSL-Zertifikat';

  @override
  String get adminNetworkingCertPathHelp =>
      'Pfad zu einer PKCS-#12-Datei mit Zertifikat und privatem Schlüssel für TLS auf einer eigenen Domain.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Gib das Passwort ein, falls dein Zertifikat eines benötigt.';

  @override
  String get adminNetworkingAllowRemote =>
      'Remote-Verbindungen zu diesem Server erlauben';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'Wenn deaktiviert, werden alle Remote-Verbindungen blockiert.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'IP-Adressen oder IP/Netzmasken-Einträge von Remote-Netzwerken. Leer lassen, um alle Remote-Adressen zu erlauben.';

  @override
  String get adminNetworkingRemoteIpFilterMode =>
      'Filtermodus für Remote-IP-Adressen';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'Der öffentliche Port, der auf den lokalen HTTP-Port weitergeleitet wird.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'Der öffentliche Port, der auf den lokalen HTTPS-Port weitergeleitet wird.';

  @override
  String get adminNetworkingAutoDiscoveryLabel =>
      'Automatische Erkennung aktivieren';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Ermöglicht Apps, diesen Server über UDP-Port 7359 zu finden.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Dieselbe veröffentlichte Server-URI für internen und externen Zugriff verwenden';

  @override
  String get adminNetworkingPublishedUri => 'Veröffentlichte Server-URI';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Überschreibt die URI, die der Server weitergibt, abhängig von der Schnittstelle oder der IP-Adresse des Clients.';

  @override
  String get adminNetworkingInternalUri => 'Interne URI';

  @override
  String get adminNetworkingInternalUriHelp =>
      'Veröffentlichte Server-URI für den internen Zugriff.';

  @override
  String get adminNetworkingExternalUri => 'Externe URI';

  @override
  String get adminNetworkingExternalUriHelp =>
      'Veröffentlichte Server-URI für den externen Zugriff.';

  @override
  String get adminNetworkingOtherPublishedUris =>
      'Weitere veröffentlichte URIs';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URIs für ein Subnetz oder eine Schnittstelle, angegeben als Subnetz=URI.';

  @override
  String get adminBackupsHelp =>
      'Erstelle Snapshots deines Servers und stelle sie wieder her. Sie können Datenbank, Metadaten, Untertitel und Trickplay-Bilder enthalten.';

  @override
  String get adminBackupDisclaimer =>
      'Je nach Größe deiner Bibliothek kann das Backup eine Weile dauern.';

  @override
  String get adminBackupTasksWarningTitle => 'Geplante Aufgaben laufen';

  @override
  String get adminBackupTasksWarning =>
      'Beende diese Aufgaben oder warte, bis sie fertig sind, bevor du ein Backup erstellst.';

  @override
  String get adminBackupArchiveNotFound =>
      'Der Server konnte dieses Backup-Archiv nicht finden.';

  @override
  String get adminRestoreInProgress => 'Wiederherstellung läuft';

  @override
  String get adminRestoreWaitingForServer =>
      'Warte darauf, dass der Server wieder erreichbar ist.';

  @override
  String get adminRestoreSucceeded => 'Wiederherstellung abgeschlossen';

  @override
  String get adminLogWatch => 'Ansehen';

  @override
  String get adminLogStopWatching => 'Wiedergabe beenden';

  @override
  String get adminPluginInstallConfirmTitle => 'Plugin-Installation bestätigen';

  @override
  String get adminPluginInstallDisclaimer =>
      'Die Installation eines Drittanbieter-Plugins birgt Risiken. Es kann instabilen oder schädlichen Code enthalten und sich jederzeit ändern. Installiere nur Plugins von Autoren, denen du vertraust, und informiere dich, was sie tun können, z. B. externe Dienste abfragen, Bibliotheksscans verlangsamen oder Hintergrundaufgaben hinzufügen.';

  @override
  String get adminGroupOverview => 'Übersicht';

  @override
  String get adminGroupLibrary => 'Bibliothek';

  @override
  String get adminGroupPlayback => 'Wiedergabe';

  @override
  String get adminGroupPeople => 'Personen';

  @override
  String get adminGroupSystem => 'System';

  @override
  String get adminAreasLabel => 'Admin-Bereiche';

  @override
  String get adminPagesLabel => 'Seiten';

  @override
  String get adminPageDescDashboard =>
      'Serverzustand, Sitzungen und letzte Aktivitäten';

  @override
  String get adminPageDescAnalytics => 'Bibliotheksgrößen, Codecs und Formate';

  @override
  String get adminPageDescActivity => 'Alles, was auf dem Server passiert ist';

  @override
  String get adminPageDescTasks => 'Scans, Bereinigungen und ihre Auslöser';

  @override
  String get adminPageDescLibraries =>
      'Ordner, Scanner und Metadaten-Abrufdienste';

  @override
  String get adminPageDescDisplay =>
      'Wie Bibliotheken für Nutzer angezeigt werden';

  @override
  String get adminPageDescMetadata => 'Standardsprache, Land und Bilder';

  @override
  String get adminPageDescNfo => 'Lesen und Speichern von Kodi-NFO-Dateien';

  @override
  String get adminPageDescLiveTv => 'Tuner, Programmdaten und Aufnahmen';

  @override
  String get adminPageDescTranscoding =>
      'Hardwarebeschleunigung, Encoder, Tone-Mapping';

  @override
  String get adminPageDescResume =>
      'Wann Elemente als begonnen oder gespielt gelten';

  @override
  String get adminPageDescStreaming => 'Bitrate-Limit für Fernzugriff';

  @override
  String get adminPageDescTrickplay => 'Vorschaubilder beim Spulen';

  @override
  String get adminPageDescUsers => 'Konten, Zugriff und Jugendschutz';

  @override
  String get adminPageDescDevices => 'Angemeldete Geräte und ihre Namen';

  @override
  String get adminPageDescApiKeys => 'Schlüssel für Apps und Skripte';

  @override
  String get adminPageDescSettings => 'Servername, Sprache, Pfade, Leistung';

  @override
  String get adminPageDescBranding =>
      'Anmeldenachricht, eigenes CSS, Startbildschirm';

  @override
  String get adminPageDescNetworking => 'Ports, HTTPS, LAN und Fernzugriff';

  @override
  String get adminPageDescPlugins => 'Installierte Plugins und der Katalog';

  @override
  String get adminPageDescRepositories => 'Woher Plugins stammen';

  @override
  String get adminPageDescBackups =>
      'Server-Backups erstellen und wiederherstellen';

  @override
  String get adminPageDescLogs => 'Server-Protokolldateien';

  @override
  String adminSearchSettingsHint(int count) {
    return '$count Einstellungen durchsuchen';
  }

  @override
  String get adminSearchNoResults => 'Keine passenden Einstellungen';

  @override
  String get adminSearchClear => 'Suche löschen';

  @override
  String get adminUnsavedChanges => 'Ungespeicherte Änderungen';

  @override
  String get adminDiscard => 'Verwerfen';

  @override
  String get adminLeaveTitle => 'Ungespeicherte Änderungen verwerfen?';

  @override
  String get adminLeaveMessage =>
      'Die Änderungen auf dieser Seite wurden noch nicht gespeichert.';

  @override
  String get adminKeepEditing => 'Weiter bearbeiten';

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
    return 'Plugin-Updates verfügbar: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins, die einen Neustart erfordern: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Fehlgeschlagene geplante Aufgaben: $count';
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
  String get adminLibraryScanStarted => 'Bibliotheksscan gestartet';

  @override
  String errorGeneric(String error) {
    return 'Fehler: $error';
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
    return 'Befehl fehlgeschlagen: $error';
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
  String get sessionForward => 'Vorwärts';

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
  String get adminClearDates => 'Daten löschen';

  @override
  String get adminActivitySeverityAll => 'Alle Schweregrade';

  @override
  String get adminActivityDateRange => 'Zeitraum';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Aktivitätsprotokoll konnte nicht geladen werden: $error';
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
    return 'Gerät konnte nicht aktualisiert werden: $error';
  }

  @override
  String get adminDeleteDevice => 'Gerät löschen';

  @override
  String get adminDeviceDeleted => 'Gerät gelöscht';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Gerät konnte nicht gelöscht werden: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Gerät „$name“ entfernen? Der Benutzer muss sich auf diesem Gerät erneut anmelden.';
  }

  @override
  String get adminDeleteAllDevices => 'Alle Geräte löschen';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return '$count Geräte entfernen? Betroffene Benutzer müssen sich erneut anmelden. Ihr aktuelles Gerät ist nicht betroffen.';
  }

  @override
  String get adminDevicesDeletedAll => 'Geräte entfernt';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Einige Geräte wurden entfernt; $count konnten nicht entfernt werden.';
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
    return 'Scan konnte nicht gestartet werden: $error';
  }

  @override
  String get adminRenameLibrary => 'Bibliothek umbenennen';

  @override
  String get adminNewName => 'Neuer Name';

  @override
  String adminLibraryRenamed(String name) {
    return 'Bibliothek umbenannt in „$name“';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Umbenennen fehlgeschlagen: $error';
  }

  @override
  String get adminDeleteLibrary => 'Bibliothek löschen';

  @override
  String adminLibraryDeleted(String name) {
    return 'Bibliothek „$name“ gelöscht';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Bibliothek konnte nicht gelöscht werden: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Pfad konnte nicht hinzugefügt werden: $error';
  }

  @override
  String get adminRemovePath => 'Pfad entfernen';

  @override
  String adminRemovePathConfirm(String path) {
    return '„$path“ aus dieser Bibliothek entfernen?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Pfad konnte nicht entfernt werden: $error';
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
  String get adminPreferredMetadataLanguage => 'Bevorzugte Metadatensprache';

  @override
  String get adminMetadataLanguageHint => 'z. B. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Metadaten-Ländercode';

  @override
  String get adminMetadataCountryHint => 'z. B. US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Pfade';

  @override
  String get adminLibraryTabOptions => 'Optionen';

  @override
  String get adminLibraryTabDownloaders => 'Downloader';

  @override
  String get adminLibMetadataSavers => 'Metadaten-Speicherer';

  @override
  String get adminLibSubtitleDownloaders => 'Untertitel-Downloader';

  @override
  String get adminLibLyricDownloaders => 'Liedtext-Downloader';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadaten-Downloader: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Bildquellen: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Dieser Server bietet keine Downloader für diesen Bibliothekstyp.';

  @override
  String get adminLibrarySectionGeneral => 'Allgemein';

  @override
  String get adminLibrarySectionMetadata => 'Metadaten';

  @override
  String get adminLibrarySectionEmbedded => 'Eingebettete Informationen';

  @override
  String get adminLibrarySectionSubtitles => 'Untertitel';

  @override
  String get adminLibrarySectionImages => 'Bilder';

  @override
  String get adminLibrarySectionSeries => 'Serien';

  @override
  String get adminLibrarySectionMusic => 'Musik';

  @override
  String get adminLibrarySectionMovies => 'Filme';

  @override
  String get adminLibRealtimeMonitor => 'Echtzeitüberwachung aktivieren';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Dateiänderungen erkennen und automatisch verarbeiten.';

  @override
  String get adminLibEnablePhotos => 'Fotos anzeigen';

  @override
  String get adminLibSaveLocalMetadata =>
      'Bildmaterial in Medienordnern speichern';

  @override
  String get adminLibRefreshInterval => 'Automatische Metadatenaktualisierung';

  @override
  String get adminLibRefreshNever => 'Nie';

  @override
  String get adminLibDefault => 'Standard';

  @override
  String get adminLibDisplayTitle => 'Anzeige';

  @override
  String get adminLibDisplaySection => 'Bibliotheksanzeige';

  @override
  String get adminLibFolderView =>
      'Ordneransicht anzeigen, um einfache Medienordner darzustellen';

  @override
  String get adminLibSpecialsInSeasons =>
      'Specials in den Staffeln anzeigen, in denen sie ausgestrahlt wurden';

  @override
  String get adminLibGroupMovies => 'Filme in Sammlungen gruppieren';

  @override
  String get adminLibGroupShows => 'Serien in Sammlungen gruppieren';

  @override
  String get adminLibExternalSuggestions =>
      'Externe Inhalte in Vorschlägen anzeigen';

  @override
  String get adminLibDateAddedSection => 'Verhalten für Hinzufügedatum';

  @override
  String get adminLibDateAddedLabel => 'Hinzufügedatum verwenden von';

  @override
  String get adminLibDateAddedImport => 'Datum des Scans in die Bibliothek';

  @override
  String get adminLibDateAddedFile => 'Erstellungsdatum der Datei';

  @override
  String get adminLibMetadataTitle => 'Metadaten und Bilder';

  @override
  String get adminLibMetadataLangSection => 'Bevorzugte Metadatensprache';

  @override
  String get adminLibChaptersSection => 'Kapitel';

  @override
  String get adminLibDummyChapterDuration =>
      'Dauer von Platzhalter-Kapiteln (Sekunden)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Länge der Kapitel, die für Medien ohne Kapitel erzeugt werden. 0 deaktiviert die Funktion.';

  @override
  String get adminLibChapterImageResolution => 'Auflösung der Kapitelbilder';

  @override
  String get adminLibNfoTitle => 'NFO-Einstellungen';

  @override
  String get adminLibNfoHelp =>
      'NFO-Metadaten sind mit Kodi und ähnlichen Clients kompatibel. Die Einstellungen gelten für alle Bibliotheken, die NFO-Metadaten speichern.';

  @override
  String get adminLibKodiUser =>
      'Benutzer, dessen Wiedergabedaten in NFO-Dateien gespeichert werden';

  @override
  String get adminLibSaveImagePaths => 'Bildpfade in NFO-Dateien speichern';

  @override
  String get adminLibPathSubstitution =>
      'Pfadersetzung für NFO-Bildpfade aktivieren';

  @override
  String get adminLibExtraThumbs =>
      'Extrafanart-Bilder in einen Extrathumbs-Ordner kopieren';

  @override
  String get adminLibNone => 'Keine';

  @override
  String adminLibRefreshDays(int days) {
    return '$days Tage';
  }

  @override
  String get adminLibEmbeddedTitles => 'Eingebettete Titel verwenden';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Eingebettete Titel für Extras verwenden';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Eingebettete Episodeninformationen verwenden';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Eingebettete Untertitel zulassen';

  @override
  String get adminLibEmbeddedAllowAll => 'Alle zulassen';

  @override
  String get adminLibEmbeddedAllowText => 'Nur Text';

  @override
  String get adminLibEmbeddedAllowImage => 'Nur Bild';

  @override
  String get adminLibEmbeddedAllowNone => 'Keine';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Download überspringen, wenn eingebettete Untertitel vorhanden sind';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Download überspringen, wenn die Audiospur der Download-Sprache entspricht';

  @override
  String get adminLibRequirePerfectMatch =>
      'Exakte Untertitel-Übereinstimmung verlangen';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Untertitel in Medienordnern speichern';

  @override
  String get adminLibChapterImageExtraction => 'Kapitelbilder extrahieren';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Kapitelbilder während des Bibliotheksscans extrahieren';

  @override
  String get adminLibTrickplayExtraction =>
      'Trickplay-Bildextraktion aktivieren';

  @override
  String get adminLibTrickplayDuringScan =>
      'Trickplay-Bilder während des Bibliotheksscans extrahieren';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Trickplay-Bilder in Medienordnern speichern';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Serien automatisch zusammenführen, die über mehrere Ordner verteilt sind';

  @override
  String get adminLibSeasonZeroName => 'Anzeigename für Staffel 0';

  @override
  String get adminLibLufsScan => 'LUFS-Scan für Audionormalisierung aktivieren';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Nicht-standardmäßigen Interpreten-Tag bevorzugen';

  @override
  String get adminLibAutoAddToCollection =>
      'Filme automatisch zu Sammlungen hinzufügen';

  @override
  String get adminLibraryNameRequired => 'Bibliotheksname ist erforderlich';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Bibliothek konnte nicht erstellt werden: $error';
  }

  @override
  String get adminLibraryName => 'Bibliotheksname';

  @override
  String get adminSelectedPaths => 'Ausgewählte Pfade:';

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
    return '$name deaktivieren? Sie können sich nicht anmelden.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return '$name aktivieren? Sie können sich erneut anmelden.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Benutzer „$name“ deaktiviert';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Benutzer „$name“ aktiviert';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Benutzerrichtlinie konnte nicht aktualisiert werden: $error';
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
    return 'Benutzer konnte nicht erstellt werden: $error';
  }

  @override
  String get adminCreateUser => 'Benutzer erstellen';

  @override
  String get adminPasswordOptional => 'Passwort (optional)';

  @override
  String get adminUsernameRequired => 'Benutzername darf nicht leer sein';

  @override
  String adminSaveFailed(String error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Passwörter stimmen nicht überein';

  @override
  String adminFailed(String error) {
    return 'Fehlgeschlagen: $error';
  }

  @override
  String get adminUserLoadFailed => 'Benutzer konnte nicht geladen werden';

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
  String get adminEnableAllLibraryAccess =>
      'Zugriff auf alle Bibliotheken aktivieren';

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
  String get adminEnableAllDevices =>
      'Ermöglichen Sie den Zugriff auf alle Geräte';

  @override
  String get adminEnableAllChannels =>
      'Ermöglichen Sie den Zugriff auf alle Kanäle';

  @override
  String get adminParentalControl => 'Jugendschutz';

  @override
  String get adminMaxParentalRating => 'Maximal erlaubte Altersfreigabe';

  @override
  String get adminMaxParentalRatingHint =>
      'Inhalte mit einer höheren Freigabe werden für diesen Benutzer ausgeblendet.';

  @override
  String get adminParentalRatingNone => 'Keine';

  @override
  String get adminBlockUnratedItems =>
      'Inhalte ohne oder mit unbekannter Altersfreigabe blockieren';

  @override
  String get adminUnratedBook => 'Bücher';

  @override
  String get adminUnratedChannelContent => 'Kanäle';

  @override
  String get adminUnratedLiveTvChannel => 'Live-TV';

  @override
  String get adminUnratedMovie => 'Filme';

  @override
  String get adminUnratedMusic => 'Musik';

  @override
  String get adminUnratedTrailer => 'Trailer';

  @override
  String get adminUnratedSeries => 'Serien';

  @override
  String get adminAccessSchedules => 'Zugriffszeiten';

  @override
  String get adminAccessSchedulesHint =>
      'Zugriff nur während der unten festgelegten Zeiten erlauben. Ohne Zeitplan ist der Zugriff ganztägig erlaubt.';

  @override
  String get adminAddSchedule => 'Zeitplan hinzufügen';

  @override
  String get adminScheduleDay => 'Tag';

  @override
  String get adminScheduleStart => 'Beginn';

  @override
  String get adminScheduleEnd => 'Ende';

  @override
  String get adminDayEveryday => 'Täglich';

  @override
  String get adminDayWeekday => 'Wochentag';

  @override
  String get adminDayWeekend => 'Wochenende';

  @override
  String get adminDaySunday => 'Sonntag';

  @override
  String get adminDayMonday => 'Montag';

  @override
  String get adminDayTuesday => 'Dienstag';

  @override
  String get adminDayWednesday => 'Mittwoch';

  @override
  String get adminDayThursday => 'Donnerstag';

  @override
  String get adminDayFriday => 'Freitag';

  @override
  String get adminDaySaturday => 'Samstag';

  @override
  String get adminAllowedTags => 'Erlaubte Tags';

  @override
  String get adminAllowedTagsHint =>
      'Nur Inhalte mit diesen Tags werden angezeigt. Leer lassen, um alle zuzulassen.';

  @override
  String get adminBlockedTags => 'Blockierte Tags';

  @override
  String get adminBlockedTagsHint =>
      'Inhalte mit diesen Tags werden für diesen Benutzer ausgeblendet.';

  @override
  String get adminAddTag => 'Tag hinzufügen';

  @override
  String get adminAuthProvider => 'Authentifizierungsanbieter';

  @override
  String get adminPasswordResetProvider =>
      'Anbieter zum Zurücksetzen des Passworts';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximale Fehlversuche bis zur Sperrung';

  @override
  String get adminLoginAttemptsHint =>
      '0 für den Standardwert, -1 deaktiviert die Sperrung.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay-Zugriff';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Erstellen von und Beitreten zu Gruppen erlauben';

  @override
  String get adminSyncPlayJoin => 'Beitreten zu Gruppen erlauben';

  @override
  String get adminSyncPlayNone => 'Kein Zugriff';

  @override
  String get adminContentDeletionFolders => 'Löschen von Inhalten erlauben aus';

  @override
  String get adminResetPasswordWarning =>
      'Dadurch wird das Passwort entfernt. Der Benutzer kann sich ohne Passwort anmelden.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Der Server hat HTTP $status zurückgegeben.';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Sind Sie sicher, dass Sie $name löschen möchten?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Benutzer „$name“ gelöscht';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Benutzer konnte nicht gelöscht werden: $error';
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
    return 'Fehler beim Erstellen des Schlüssels: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Schlüssel-Token fehlt in der Serverantwort';

  @override
  String get adminRevokeApiKey => 'API-Schlüssel widerrufen';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Schlüssel für $name widerrufen?';
  }

  @override
  String get adminApiKeyRevoked => 'API-Schlüssel widerrufen';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Schlüssel konnte nicht widerrufen werden: $error';
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
    return 'Token: $token\\nErstellt: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Backup erstellen';

  @override
  String get adminBackupDatabase => 'Datenbank';

  @override
  String get adminBackupDatabaseAlways => 'Immer enthalten';

  @override
  String get adminBackupMetadata => 'Metadaten';

  @override
  String get adminBackupSubtitles => 'Untertitel';

  @override
  String get adminBackupTrickplay => 'Trickplay-Bilder';

  @override
  String get adminCreatingBackup => 'Backup wird erstellt...';

  @override
  String get adminBackupCreated => 'Backup erfolgreich erstellt';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Backup konnte nicht erstellt werden: $error';
  }

  @override
  String get adminBackupPathMissing => 'Backup-Pfad fehlt in der Serverantwort';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Manifest konnte nicht geladen werden: $error';
  }

  @override
  String get adminConfirmRestore => 'Wiederherstellung bestätigen';

  @override
  String get adminRestoringBackup => 'Backup wird wiederhergestellt...';

  @override
  String adminRestoreFailed(String error) {
    return 'Sicherung konnte nicht wiederhergestellt werden: $error';
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
    return 'Gespeichert unter $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Datei konnte nicht gespeichert werden: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return '$fileName konnte nicht geladen werden';
  }

  @override
  String get adminSearchInLog => 'Im Protokoll suchen';

  @override
  String get adminNoMatchingLines => 'Keine übereinstimmenden Zeilen';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Aufgaben konnten nicht geladen werden: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Keine geplanten Aufgaben gefunden';

  @override
  String get adminNoTasksMatchFilter =>
      'Keine Aufgaben stimmen mit dem aktuellen Filter überein';

  @override
  String adminTaskStartFailed(String error) {
    return 'Aufgabe konnte nicht gestartet werden: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Aufgabe konnte nicht gestoppt werden: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Aufgabe konnte nicht geladen werden: $error';
  }

  @override
  String get adminRunNow => 'Jetzt ausführen';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Auslöser konnte nicht entfernt werden: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Auslöser konnte nicht hinzugefügt werden: $error';
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
  String get adminNoLimit => 'Kein Limit';

  @override
  String adminHours(String hours) {
    return '$hours Stunde(n)';
  }

  @override
  String get adminDayOfWeek => 'Wochentag';

  @override
  String get adminSearchPlugins => 'Plugins suchen...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Plugin konnte nicht umgeschaltet werden: $error';
  }

  @override
  String get adminUninstallPlugin => 'Plugin deinstallieren';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Sind Sie sicher, dass Sie „$name“ deinstallieren möchten?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Plugin konnte nicht deinstalliert werden: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Paket konnte nicht installiert werden: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Update konnte nicht installiert werden: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Plugins konnten nicht geladen werden: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Keine Plugins stimmen mit deiner Suche überein';

  @override
  String get adminNoPluginsInstalled => 'Keine Plugins installiert';

  @override
  String adminInstallUpdate(String version) {
    return 'Update installieren (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Katalog konnte nicht geladen werden: $error';
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
    return '„$name“ wird nach dem Neustart des Servers entfernt';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Deinstallation fehlgeschlagen: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Aktualisierung von „$name“ auf v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Plugin konnte nicht geladen werden: $error';
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
    return 'Sind Sie sicher, dass Sie „$name“ entfernen möchten?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Repositorys konnten nicht gespeichert werden: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Repositorys konnten nicht geladen werden: $error';
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
    return 'Plugin-Einstellungen können nicht geladen werden: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return '$uri konnte nicht geöffnet werden';
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
  String get adminPlaybackLoadFailed =>
      'Wiedergabe-Einstellungen konnten nicht geladen werden';

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
  String adminMetadataLoadFailed(String error) {
    return 'Metadaten konnten nicht geladen werden: $error';
  }

  @override
  String get adminRefreshMetadata => 'Metadaten aktualisieren';

  @override
  String get recursive => 'Rekursiv';

  @override
  String get adminReplaceAllMetadata => 'Alle Metadaten ersetzen';

  @override
  String get adminMetadataRefreshRequested =>
      'Metadatenaktualisierung angefordert';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Metadaten konnten nicht aktualisiert werden: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Keine Remote-Treffer gefunden';

  @override
  String get adminRemoteResults => 'Remote-Ergebnisse';

  @override
  String get adminRemoteMetadataApplied => 'Remote-Metadaten angewendet';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote-Suche fehlgeschlagen: $error';
  }

  @override
  String get adminUpdateContentType => 'Inhaltstyp aktualisieren';

  @override
  String get adminContentType => 'Inhaltstyp';

  @override
  String get adminContentTypeUpdated => 'Inhaltstyp aktualisiert';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Inhaltstyp konnte nicht aktualisiert werden: $error';
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
    return '$imageType Bild aktualisiert';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Bild konnte nicht heruntergeladen werden: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Nicht unterstütztes Bildformat';

  @override
  String get adminImageReadFailed =>
      'Ausgewähltes Bild konnte nicht gelesen werden';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType Bild hochgeladen';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Bild konnte nicht hochgeladen werden: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return '$imageType Bild löschen';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType Bild gelöscht';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Bild konnte nicht gelöscht werden: $error';
  }

  @override
  String get adminAllProviders => 'Alle Anbieter';

  @override
  String get adminNoRemoteImages => 'Keine Remote-Bilder gefunden';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner-Erkennung fehlgeschlagen: $error';
  }

  @override
  String get adminTunerTypeM3u => 'M3U-Tuner';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Datei oder URL';

  @override
  String get adminTunerIpAddress => 'IP-Adresse des Tuners';

  @override
  String get adminTunerFriendlyName => 'Anzeigename';

  @override
  String get adminTunerUserAgent => 'User-Agent';

  @override
  String get adminTunerCount => 'Limit gleichzeitiger Verbindungen';

  @override
  String get adminTunerCountHelp =>
      'Die maximale Anzahl an Streams, die der Tuner gleichzeitig zulässt. 0 bedeutet unbegrenzt.';

  @override
  String get adminTunerFallbackBitrate => 'Maximale Fallback-Streaming-Bitrate';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Nur Favoriten-Kanäle importieren';

  @override
  String get adminTunerAllowHwTranscoding => 'Hardware-Transkodierung erlauben';

  @override
  String get adminTunerAllowFmp4 => 'fMP4-Transkodierungscontainer erlauben';

  @override
  String get adminTunerAllowStreamSharing => 'Stream-Sharing erlauben';

  @override
  String get adminTunerEnableStreamLooping => 'Stream-Schleife aktivieren';

  @override
  String get adminTunerIgnoreDts => 'DTS ignorieren';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Eingabe mit nativer Bildrate lesen';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Datei oder URL';

  @override
  String get adminXmltvMoviePrefix => 'Film-Präfix';

  @override
  String get adminXmltvMovieCategories => 'Film-Kategorien';

  @override
  String get adminXmltvCategoriesHelp =>
      'Mehrere Kategorien mit einem senkrechten Strich trennen.';

  @override
  String get adminXmltvKidsCategories => 'Kinder-Kategorien';

  @override
  String get adminXmltvNewsCategories => 'Nachrichten-Kategorien';

  @override
  String get adminXmltvSportsCategories => 'Sport-Kategorien';

  @override
  String get adminSdUsername => 'Benutzername';

  @override
  String get adminSdPassword => 'Passwort';

  @override
  String get adminSdCountry => 'Land';

  @override
  String get adminSdCountrySelect => 'Land auswählen';

  @override
  String get adminSdPostalCode => 'Postleitzahl';

  @override
  String get adminEnableAllTuners => 'Alle Tuner aktivieren';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Tuner konnte nicht entfernt werden: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Anbieter konnte nicht entfernt werden: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Serienaufnahmepfad';

  @override
  String get adminMovieRecordingPath => 'Aufnahmepfad für Filme';

  @override
  String get adminGuideDaysAuto => 'Automatisch';

  @override
  String get adminRecordingPostProcessor =>
      'Pfad zur Nachbearbeitungsanwendung';

  @override
  String get adminRecordingPostProcessorArgs =>
      'Argumente für die Nachbearbeitung';

  @override
  String get adminSaveRecordingNfo => 'NFO-Metadaten für Aufnahmen speichern';

  @override
  String get adminSaveRecordingImages => 'Bilder für Aufnahmen speichern';

  @override
  String get adminLiveTvSectionPaths => 'Aufnahmepfade';

  @override
  String get adminLiveTvSectionPostProcessing => 'Nachbearbeitung';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Einstellungen konnten nicht gespeichert werden: $error';
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
  String get adminGuideRefreshStarted =>
      'Aktualisierung der Programmdaten gestartet';

  @override
  String get adminGuideRefreshUnavailable =>
      'Die Aufgabe zum Aktualisieren der Programmdaten ist auf diesem Server nicht verfügbar.';

  @override
  String get adminNoListingProviders => 'Keine Listing-Anbieter konfiguriert';

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
    return 'Backup $name jetzt wiederherstellen?';
  }

  @override
  String get adminBackupsTitle => 'Backups';

  @override
  String get adminUnknownDate => 'Unbekanntes Datum';

  @override
  String get adminUnnamedBackup => 'Unbenanntes Backup';

  @override
  String get adminApply => 'Anwenden';

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
    return 'Vor ${minutes}m';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'Vor ${hours}h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'Vor ${days}d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return '$fileName konnte nicht geladen werden';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count stimmt überein';
  }

  @override
  String get adminLogViewerNoMatches => 'Keine übereinstimmenden Zeilen';

  @override
  String get adminMetadataEditorTitle => 'Metadaten-Editor';

  @override
  String get adminMetadataIdentify => 'Identifizieren';

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
  String get adminMetadataFieldCustomRating =>
      'Benutzerdefinierte Altersfreigabe';

  @override
  String get adminMetadataFieldTagline => 'Schlagzeile';

  @override
  String get adminMetadataFieldOverview => 'Übersicht';

  @override
  String get adminMetadataFieldDisplayOrder => 'Anzeigereihenfolge';

  @override
  String get adminMetadataDisplayOrderAired => 'Nach Ausstrahlung';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Ursprüngliches Ausstrahlungsdatum';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolute Reihenfolge';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD-Reihenfolge';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digitale Reihenfolge';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Handlungsbogen';

  @override
  String get adminMetadataDisplayOrderProduction => 'Produktionsreihenfolge';

  @override
  String get adminMetadataDisplayOrderTv => 'TV-Reihenfolge';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternative Reihenfolge';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regionale Reihenfolge';

  @override
  String get adminMetadataDisplayOrderAlternateDvd =>
      'Alternative DVD-Reihenfolge';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Änderungsdatum';

  @override
  String get adminMetadataDisplayOrderSortName => 'Sortiername';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Veröffentlichungsdatum';

  @override
  String get adminMetadataSettings => 'Metadateneinstellungen';

  @override
  String get adminMetadataDownloadLanguage => 'Sprache für Metadaten-Downloads';

  @override
  String get adminMetadataCountryRegion => 'Land/Region';

  @override
  String get adminMetadataInheritHelp =>
      'Belassen Sie die Einstellung auf „Standard“, um die Einstellung des übergeordneten Elements oder des Serverstandards zu übernehmen.';

  @override
  String get adminMetadataField3DFormat => '3D-Format';

  @override
  String get adminMetadataPersonKindActor => 'Schauspieler';

  @override
  String get adminMetadataPersonKindDirector => 'Regisseur';

  @override
  String get adminMetadataPersonKindComposer => 'Komponist';

  @override
  String get adminMetadataPersonKindWriter => 'Drehbuchautor';

  @override
  String get adminMetadataPersonKindGuestStar => 'Gastdarsteller';

  @override
  String get adminMetadataPersonKindProducer => 'Produzent';

  @override
  String get adminMetadataPersonKindConductor => 'Dirigent';

  @override
  String get adminMetadataPersonKindLyricist => 'Texter';

  @override
  String get adminMetadataPersonKindArranger => 'Arrangeur';

  @override
  String get adminMetadataPersonKindEngineer => 'Toningenieur';

  @override
  String get adminMetadataPersonKindMixer => 'Tonmischer';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixer';

  @override
  String get adminMetadataPersonKindCreator => 'Schöpfer';

  @override
  String get adminMetadataPersonKindArtist => 'Künstler';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Albumkünstler';

  @override
  String get adminMetadataPersonKindAuthor => 'Autor';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustrator';

  @override
  String get adminMetadataPersonKindPenciller => 'Vorzeichner';

  @override
  String get adminMetadataPersonKindInker => 'Tuschezeichner';

  @override
  String get adminMetadataPersonKindColorist => 'Kolorist';

  @override
  String get adminMetadataPersonKindLetterer => 'Letterer';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Coverkünstler';

  @override
  String get adminMetadataPersonKindEditor => 'Redakteur';

  @override
  String get adminMetadataPersonKindTranslator => 'Übersetzer';

  @override
  String get adminMetadataPersonKindNarrator => 'Erzähler';

  @override
  String get adminMetadataAirDays => 'Ausstrahlungstage';

  @override
  String get adminMetadataLockItem =>
      'Dieses Element sperren, um zukünftige Metadatenänderungen zu verhindern';

  @override
  String get adminMetadataEnabledFields => 'Aktivierte Metadatenfelder';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Deaktivieren Sie ein Feld, um es zu sperren und zu verhindern, dass seine Daten geändert werden.';

  @override
  String get adminMetadataLockFieldName => 'Name';

  @override
  String get adminMetadataLockFieldOverview => 'Übersicht';

  @override
  String get adminMetadataLockFieldGenres => 'Genres';

  @override
  String get adminMetadataLockFieldOfficialRating =>
      'Offizielle Altersfreigabe';

  @override
  String get adminMetadataLockFieldCast => 'Besetzung';

  @override
  String get adminMetadataLockFieldProductionLocations => 'Produktionsorte';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Geburtsort';

  @override
  String get adminMetadataLockFieldRuntime => 'Laufzeit';

  @override
  String get adminMetadataLockFieldStudios => 'Studios';

  @override
  String get adminMetadataLockFieldTags => 'Tags';

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
  String get adminMetadataProvider => 'Anbieter';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType Bild aktualisiert';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType Bild hochgeladen';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType Bild gelöscht';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Bild konnte nicht heruntergeladen werden: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Ausgewähltes Bild konnte nicht gelesen werden';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Bild konnte nicht hochgeladen werden: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return '$imageType Bild löschen';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Dadurch wird das aktuelle Bild vom Element entfernt.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Bild konnte nicht gelöscht werden: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Wählen Sie das Bild $imageType';
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
  String get adminPluginsRestartRequired => 'Neustart erforderlich';

  @override
  String get adminPluginsNoSearchResults =>
      'Keine Plugins stimmen mit deiner Suche überein';

  @override
  String get adminPluginsNoneInstalled => 'Keine Plugins installiert';

  @override
  String get adminPluginsNoneActive => 'Keine aktiven Plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Für kein Plugin ist ein Serverneustart erforderlich.';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update verfügbar: v$version';
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
    return 'Update installieren (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Keine Pakete stimmen mit deiner Suche überein';

  @override
  String get adminPluginsCatalogEmpty => 'Keine Pakete verfügbar';

  @override
  String adminPluginsInstalling(String name) {
    return '„$name“ wird installiert...';
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
    return '$name Einstellungen';
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
    return 'Repositorys konnten nicht geladen werden: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Repository entfernen';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Sind Sie sicher, dass Sie „$name“ entfernen möchten?';
  }

  @override
  String get adminReposRemove => 'Entfernen';

  @override
  String adminReposSaveFailed(String error) {
    return 'Repositorys konnten nicht gespeichert werden: $error';
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
  String get adminNetworkingEnableHttps => 'HTTPS aktivieren';

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
  String get adminBrandingSplashUpload => 'Bild hochladen';

  @override
  String get adminBrandingSplashUploaded => 'Startbildschirm aktualisiert';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Startbildschirm konnte nicht hochgeladen werden';

  @override
  String get adminBrandingSplashDeleted => 'Startbildschirm entfernt';

  @override
  String get adminBrandingNoSplash =>
      'Kein benutzerdefinierter Startbildschirm';

  @override
  String get adminPlaybackHwAccel => 'Hardwarebeschleunigung';

  @override
  String get adminPlaybackHwAccelLabel => 'Hardwarebeschleunigung';

  @override
  String get adminPlaybackEnableHwEncoding => 'Hardwarekodierung aktivieren';

  @override
  String get adminPlaybackQsvDevice => 'QSV-Gerät';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Erweiterten NVDEC-Decoder aktivieren';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Systemeigenen Hardware-Decoder bevorzugen';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-Bit-HEVC-Dekodierung';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-Bit-VP9-Dekodierung';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'HEVC-RExt-8/10-Bit-Dekodierung';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'HEVC-RExt-12-Bit-Dekodierung';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardware-Kodierung';

  @override
  String get adminPlaybackAllowHevcEncoding => 'HEVC-Kodierung erlauben';

  @override
  String get adminPlaybackAllowAv1Encoding => 'AV1-Kodierung erlauben';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Intel-Low-Power-H.264-Encoder aktivieren';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Intel-Low-Power-HEVC-Encoder aktivieren';

  @override
  String get adminPlaybackToneMapping => 'Tone-Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Tone-Mapping aktivieren';

  @override
  String get adminPlaybackEnableVppTonemapping => 'VPP-Tone-Mapping aktivieren';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'VideoToolbox-Tone-Mapping aktivieren';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tone-Mapping-Algorithmus';

  @override
  String get adminPlaybackTonemappingMode => 'Tone-Mapping-Modus';

  @override
  String get adminPlaybackTonemappingRange => 'Tone-Mapping-Bereich';

  @override
  String get adminPlaybackTonemappingDesat => 'Tone-Mapping-Entsättigung';

  @override
  String get adminPlaybackTonemappingPeak => 'Tone-Mapping-Spitzenwert';

  @override
  String get adminPlaybackTonemappingParam => 'Tone-Mapping-Parameter';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'VPP-Tone-Mapping-Helligkeit';

  @override
  String get adminPlaybackVppTonemappingContrast => 'VPP-Tone-Mapping-Kontrast';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder-Preset';

  @override
  String get adminPlaybackH264Crf => 'CRF für H.264-Kodierung';

  @override
  String get adminPlaybackH265Crf => 'CRF für H.265-(HEVC-)Kodierung';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlacing-Methode';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Bildrate beim Deinterlacing verdoppeln';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'VBR-Audiokodierung aktivieren';

  @override
  String get adminPlaybackDownmixBoost => 'Audio-Downmix-Verstärkung';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo-Downmix-Algorithmus';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Maximale Muxing-Warteschlangengröße';

  @override
  String get adminPlaybackAutoOption => 'Automatisch';

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
  String get adminRunningTasks => 'Laufende Aufgaben';

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
    return 'Täglich unter $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Jeder $day bei $time';
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
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Stunden',
      one: '1 Stunde',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Uhrzeit';

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
    return 'Vor ${days}d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'Vor ${hours}h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'Vor ${minutes}m';
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
    return '$day.$month.';
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
  String get adminNetworkingPublicHttpPort => 'Öffentlicher HTTP-Port';

  @override
  String get adminNetworkingRequireHttps => 'HTTPS erforderlich';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Alle Remote-Anfragen auf HTTPS umleiten. Ohne gültiges Serverzertifikat wirkungslos.';

  @override
  String get adminNetworkingCertPassword => 'Zertifikatspasswort';

  @override
  String get adminNetworkingEnableIpv4 => 'IPv4 aktivieren';

  @override
  String get adminNetworkingEnableIpv6 => 'IPv6 aktivieren';

  @override
  String get adminNetworkingLocalSubnets => 'LAN-Netzwerke';

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
  String get adminPlaybackThrottleDelay => 'Drosselungsverzögerung (Sekunden)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Untertitel-Extraktion in Echtzeit erlauben';

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
    return 'Inhaltstyp konnte nicht aktualisiert werden: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Schwellenwert für langsame Antwort (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Warnungen bei langsamen Antworten aktivieren';

  @override
  String get adminGeneralQuickConnect => 'Quick Connect aktivieren';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadaten';

  @override
  String get adminGeneralSectionPaths => 'Pfade';

  @override
  String get adminGeneralSectionPerformance => 'Leistung';

  @override
  String get adminGeneralCachePath => 'Cache-Pfad';

  @override
  String get adminGeneralMetadataPath => 'Metadatenpfad';

  @override
  String get adminGeneralServerName => 'Servername';

  @override
  String get adminGeneralDisplayLanguage => 'Bevorzugte Anzeigesprache';

  @override
  String get adminSettingsLoadFailed =>
      'Einstellungen konnten nicht geladen werden';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Zuordnungen konnten nicht aktualisiert werden: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Zeitlimit: $duration';
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
      other: '# Teilnehmer',
      one: '# Teilnehmer',
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
  String get syncPlayRepeatSubtitle =>
      'Ein Element oder die ganze Warteschlange wiederholen';

  @override
  String get syncPlayRepeatOne => 'Eins';

  @override
  String get syncPlayShuffleSubtitle =>
      'Die Warteschlange der Reihe nach oder gemischt abspielen';

  @override
  String get syncPlayShuffleModeShuffled => 'Gemischt';

  @override
  String get syncPlayShuffleModeSorted => 'Sortiert';

  @override
  String get syncPlayParticipantYou => 'Du';

  @override
  String syncPlayGroupSubtitle(String participants, String detail) {
    return '$participants · $detail';
  }

  @override
  String get syncPlayNothingQueued => 'noch nichts in der Warteschlange';

  @override
  String get syncPlayOthersCanJoinHint =>
      'Solange diese Gruppe besteht, können andere über ihren SyncPlay-Bildschirm beitreten.';

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
    return 'Artikel $index';
  }

  @override
  String get syncPlayPlayNow => 'Jetzt spielen';

  @override
  String get syncPlayCreateNewGroup => 'Erstellen Sie eine neue Gruppe';

  @override
  String get syncPlayCreateGroupSubtitle =>
      'Gemeinsam mit allen schauen, die beitreten';

  @override
  String get syncPlayGroupName => 'Gruppenname';

  @override
  String get syncPlayDefaultGroupName => 'Meine SyncPlay-Gruppe';

  @override
  String get syncPlayCreateGroup => 'Gruppe erstellen';

  @override
  String get syncPlayAvailableGroups => 'Verfügbare Gruppen';

  @override
  String syncPlayAvailableGroupsCount(int count) {
    return 'Verfügbare Gruppen · $count';
  }

  @override
  String get syncPlayNoGroupsAvailable => 'Keine Gruppen verfügbar';

  @override
  String get syncPlayNoGroupsAvailableHint =>
      'Gruppen, die andere auf diesem Server erstellen, erscheinen hier.';

  @override
  String get syncPlayJoinGroupQuestion => 'Der SyncPlay-Gruppe beitreten?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Der Beitritt zu einer SyncPlay-Gruppe kann Ihre aktuelle Wiedergabewarteschlange ersetzen. Weitermachen?';

  @override
  String get syncPlayJoinReplacesQueueNote =>
      'Wenn du einer Gruppe beitrittst, wird deine aktuelle Wiedergabeliste möglicherweise ersetzt.';

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
    return '$userName ist der Gruppe SyncPlay beigetreten';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName hat die SyncPlay Gruppe verlassen';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay-Zugriff verweigert';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Sie haben keinen Zugriff auf ein oder mehrere Elemente in dieser SyncPlay-Gruppe. Bitten Sie den Gruppenbesitzer, die Bibliotheksberechtigungen zu überprüfen oder eine andere Warteschlange auszuwählen.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synchronisierung der Wiedergabe mit $groupName';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# Zeilen gefunden',
      one: '# Zeile gefunden',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Du bist offline';

  @override
  String get offlineBannerSubtitle => 'Deine Downloads werden angezeigt';

  @override
  String get serverUnreachableBannerTitle => 'Server nicht erreichbar';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Wiedergabe aus Downloads, bis er wieder da ist';

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
    return 'Umwandlungskontrolle fehlgeschlagen: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Steuerelemente';
  }

  @override
  String get castDeviceVolume => 'Gerätelautstärke';

  @override
  String get castVolumeUnavailable => 'Nicht verfügbar';

  @override
  String castStopKind(String kind) {
    return 'Stoppen Sie $kind';
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
    return 'Geben Sie eine $length-stellige PIN ein';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Geben Sie Ihre $length-stellige PIN ein';
  }

  @override
  String get kidsMode => 'Kinderfreundlicher Modus';

  @override
  String get kidsModeSubtitle =>
      'Vereinfacht die Anwendung und sperrt die Einstellungen mit einer PIN';

  @override
  String get kidsModeExit => 'Den Kinderfreundlichen Modus verlassen';

  @override
  String get kidsModeExitSubtitle =>
      'Geben Sie die PIN ein um zum vollständigen Modus zurückzukehren';

  @override
  String kidsModePinToSwitchUser(String name) {
    return 'Gib die PIN des Kindermodus ein, um zu $name zu wechseln';
  }

  @override
  String get pinIncorrect => 'Falsche PIN';

  @override
  String pinTryAgainIn(String wait) {
    return 'Zu viele Versuche. Versuche es in $wait erneut.';
  }

  @override
  String get pinMismatch => 'PINs stimmen nicht überein';

  @override
  String get pinForgot => 'PIN vergessen?';

  @override
  String get pinClear => 'Löschen';

  @override
  String get pinBackspace => 'Rücktaste';

  @override
  String get quickConnectAuthorized => 'Quick Connect-Anfrage autorisiert.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Quick Connect-Code ist ungültig oder abgelaufen.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect wird auf diesem Server nicht unterstützt.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Quick Connect-Code konnte nicht autorisiert werden.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect ist auf diesem Server deaktiviert.';

  @override
  String get quickConnectForbidden =>
      'Dein Konto kann diese Quick Connect-Anfrage nicht autorisieren.';

  @override
  String get quickConnectNotFound =>
      'Quick Connect-Code wurde nicht gefunden. Versuche einen neuen Code.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect fehlgeschlagen: $message';
  }

  @override
  String get quickConnectEnterCode => 'Code eingeben';

  @override
  String get quickConnectAuthorize => 'Autorisieren';

  @override
  String remoteCommandFailed(String error) {
    return 'Befehl fehlgeschlagen: $error';
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
    return 'Casting konnte nicht gestartet werden: $error';
  }

  @override
  String get noRemoteDevices => 'Keine Remote-Wiedergabegeräte verfügbar.';

  @override
  String get noRemoteDevicesIos =>
      'Keine Remote-Wiedergabegeräte verfügbar.\n\nAuf iOS sind AirPlay-Ziele im Simulator möglicherweise nicht verfügbar.';

  @override
  String get trackActionPlayNext => 'Als Nächstes abspielen';

  @override
  String get trackActionViewDetails => 'Details anzeigen';

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
    return '$name wird heruntergeladen...';
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
  String get removeFromPlaylist => 'Aus Playlist entfernen';

  @override
  String removeFromPlaylistConfirm(String item, String playlist) {
    return '$item aus $playlist entfernen?';
  }

  @override
  String get removeFromPlaylistFailed =>
      'Entfernen aus der Playlist fehlgeschlagen';

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
    return 'Überspringen $segment';
  }

  @override
  String get liveTv => 'Live-TV';

  @override
  String get continueWatchingAndNextUp => 'Weiterschauen & Als Nächstes';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Herunterladen von $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return '$fileName wird heruntergeladen';
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
  String get playerTooltipPictureInPicture => 'Bild-in-Bild';

  @override
  String get playerTooltipExitPictureInPicture => 'Bild-in-Bild beenden';

  @override
  String get playerPlayingInPictureInPicture =>
      'Wird im Bild-in-Bild-Modus abgespielt';

  @override
  String get playerTooltipLockLandscape => 'Landschaft sperren';

  @override
  String get playerTooltipUnlockOrientation => 'Drehung zulassen';

  @override
  String get playerTooltipPrevious => 'Vorheriges';

  @override
  String get playerTooltipSeekBack => 'Zurückspulen';

  @override
  String get playerTooltipSeekForward => 'Vorwärts springen';

  @override
  String get playerTooltipMinimize => 'Player minimieren';

  @override
  String get miniPlayerOpenPlayer => 'Player öffnen';

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
  String get contextMenuHideFromContinueWatching =>
      'Aus „Weiterschauen“ ausblenden';

  @override
  String get contextMenuHideFromNextUp => 'Aus „Nächste Folge“ ausblenden';

  @override
  String get contextMenuAddToCollection => 'Zu Sammlung hinzufügen';

  @override
  String get contextMenuRemoveFromCollection => 'Aus Sammlung entfernen';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return '$item aus $collection entfernen? Das Element bleibt in deiner Bibliothek.';
  }

  @override
  String get removeFromCollectionFailed =>
      'Entfernen aus der Sammlung fehlgeschlagen';

  @override
  String get settingsAdministrationSubtitle =>
      'Greifen Sie auf das Serververwaltungsfenster zu';

  @override
  String get settingsDynamicContent => 'Dynamischer Inhalt';

  @override
  String get settingsDynamicContentSubtitle =>
      'Medienleiste und visuelle Overlays';

  @override
  String get settingsAboutSubtitle =>
      'App-Version, rechtliche Informationen und Credits';

  @override
  String get settingsSortServersBy => 'Server sortieren nach';

  @override
  String get settingsLastUsed => 'Zuletzt verwendet';

  @override
  String get settingsAlphabetical => 'Alphabetisch';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Selbstsignierte Zertifikate zulassen';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Servern mit selbstsignierten oder privaten CA-TLS-Zertifikaten vertrauen. Nur für Server aktivieren, die Sie selbst kontrollieren. Dies deaktiviert die Zertifikatsprüfung für alle Verbindungen.';

  @override
  String get untrustedServerCertificate =>
      'Das Zertifikat dieses Servers ist nicht vertrauenswürdig. Wenn es dein eigener Server ist und er ein selbstsigniertes oder privates Zertifikat verwendet, kannst du es hier zulassen.';

  @override
  String get clientCertTitle => 'Client-Zertifikat';

  @override
  String clientCertHost(String host) {
    return 'Zertifikat für $host';
  }

  @override
  String get clientCertChooseFile => 'Datei auswählen';

  @override
  String get clientCertPassword => 'Zertifikatspasswort';

  @override
  String get clientCertStartUpload => 'Vom Handy senden';

  @override
  String get clientCertUploadHint =>
      'Scanne diesen Code mit deinem Handy oder öffne die Adresse in dessen Browser, wähle dann die Datei aus und gib ihr Passwort ein.';

  @override
  String get clientCertStopUpload => 'Nicht mehr warten';

  @override
  String get clientCertNoFileData =>
      'Die Datei konnte nicht gelesen werden. Versuche es erneut.';

  @override
  String get clientCertPickFailed =>
      'Die Dateiauswahl konnte nicht geöffnet werden.';

  @override
  String get clientCertUploadFailed =>
      'Die Upload-Seite konnte nicht gestartet werden. Versuche es erneut.';

  @override
  String get clientCertNoSecureStorage =>
      'Dieses Gerät hat keinen sicheren Speicher, daher kann das Zertifikat nicht gespeichert werden. Installiere unter Linux libsecret und versuche es erneut.';

  @override
  String get clientCertDecodeFailed =>
      'Die Datei konnte nicht als Zertifikat gelesen werden. Stelle sicher, dass es eine .p12- oder .pfx-Datei ist.';

  @override
  String get clientCertWrongPassword =>
      'Mit diesem Passwort lässt sich das Zertifikat nicht entsperren.';

  @override
  String get clientCertRequired =>
      'Dieser Server benötigt ein Client-Zertifikat (mTLS). Füge eines für diesen Host hinzu, um fortzufahren.';

  @override
  String clientCertExpired(String date) {
    return 'Das Zertifikat für diesen Server ist am $date abgelaufen. Ersetze es, um fortzufahren.';
  }

  @override
  String get clientCertAddButton => 'Client-Zertifikat hinzufügen';

  @override
  String get settingsClientCertificates => 'Client-Zertifikate';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Zertifikate, die diese App Servern vorlegt, die eines verlangen (mTLS)';

  @override
  String get clientCertSubject => 'Inhaber';

  @override
  String clientCertExpires(String date) {
    return 'Läuft ab am $date';
  }

  @override
  String get clientCertReplace => 'Ersetzen';

  @override
  String get clientCertAdd => 'Zertifikat hinzufügen';

  @override
  String get clientCertAddHostPrompt =>
      'Welcher Server-Host benötigt ein Zertifikat?';

  @override
  String get itemBlockedByParentalControls => 'Das ist nicht verfügbar';

  @override
  String get blockedRatingsCeilingHint =>
      'Wenn du eine Altersfreigabe blockierst, werden auch alle höheren Freigaben blockiert.';

  @override
  String get blockedRatingsUnrankedSection => 'Blockiert nur sich selbst';

  @override
  String get settingsHomePage => 'Startseite';

  @override
  String get settingsTwentyFourHourClock => '24-Stunden-Uhr';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Verwenden Sie überall dort, wo die Uhr angezeigt wird, das 24-Stunden-Format.';

  @override
  String get settingsDateFormat => 'Datumsformat';

  @override
  String get settingsDateFormatDescription =>
      'Wähle zwischen Monat/Tag, Tag/Monat oder dem Standard der Region für Kalender- und Erscheinungsdaten';

  @override
  String get dateFormatSystem => 'Standard der Region';

  @override
  String get dateFormatMonthDay => 'Monat / Tag (Nov 10)';

  @override
  String get dateFormatDayMonth => 'Tag / Monat (10. Nov)';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Zeigen Sie die Zufallsschaltfläche in der Navigationsleiste an.';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Zeigen Sie die Schaltfläche „Genres“ in der Navigationsleiste an.';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Zeigen Sie die Favoritenschaltfläche in der Navigationsleiste an.';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Die Live-TV-Taste in der Navigationsleiste anzeigen, wenn der Server eine Live-TV-Bibliothek hat';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Zeigen Sie die Schaltfläche „Bibliotheken“ in der Navigationsleiste an.';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Seerr-Schaltfläche in der Navigationsleiste anzeigen.';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Textbeschriftungen in der oberen Navigationsleiste immer anzeigen.';

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
  String get useNativeEmulator => 'Native Emulator verwenden';

  @override
  String get useNativeEmulatorSubtitle =>
      'Spiele mit nativer Emulation statt mit dem EmulatorJS-Webplayer';

  @override
  String get emulatorCores => 'Emulatoren';

  @override
  String get emulatorCoresSubtitle =>
      'Lade Emulatoren herunter, um Spiele nativ auszuführen';

  @override
  String get emulatorCoresDescription =>
      'Wählen Sie aus, welche Emulatoren installiert werden sollen. Die Emulatoren werden vom libretro-Projekt bereitgestellt und ermöglichen es, Spiele nativ statt in einer Browseransicht auszuführen';

  @override
  String get emulatorCoreDownloading => 'Herunterladen';

  @override
  String get emulatorCoreUnavailable => 'Auf diesem Gerät nicht verfügbar';

  @override
  String get emulatorCoreDownloadFailed =>
      'Download des Emulators fehlgeschlagen.';

  @override
  String emulatorCoreResetSettings(String system) {
    return '$system Einstellungen auf Standard zurücksetzen';
  }

  @override
  String get emulatorCoreSettingsReset =>
      'Einstellungen auf Standard zurückgesetzt.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Einstellungen konnten nicht zurückgesetzt werden. Verbindung überprüfen.';

  @override
  String get downloadedGames => 'Heruntergeladene Spiele';

  @override
  String get downloadedGamesSubtitle =>
      'Von Spieldateien belegten Speicherplatz freigeben';

  @override
  String get downloadedGamesDescription =>
      'Spiele werden vor der Wiedergabe auf dieses Gerät kopiert. Entfernen Sie abgeschlossene Spiele, um Speicherplatz freizugeben. Spielstände bleiben auf dem Server gespeichert und werden nicht gelöscht.';

  @override
  String get downloadedGamesEmpty => 'Es konnten keine Spiele gefunden werden.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count Spiele, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Alle entfernen';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Sind Sie sicher, dass $title gelöscht werden soll?';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Möchten Sie alle heruntergeladenen Spiele löschen möchten?';

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
  String get settingsReportAnIssue => 'Ein Problem melden';

  @override
  String get settingsReportAnIssueSubtitle => 'Issue-Tracker auf GitHub öffnen';

  @override
  String get settingsJoinDiscord => 'Discord beitreten';

  @override
  String get settingsJoinDiscordSubtitle => 'Mit der Community chatten';

  @override
  String get settingsJoinTheDiscord => 'Discord beitreten';

  @override
  String get settingsSupportMoonfin => 'Moonfin unterstützen';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Spendiere dem Entwickler einen Kaffee';

  @override
  String get settingsLegal => 'RECHTLICHES';

  @override
  String get settingsLicenses => 'Lizenzen';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Hinweise zur Open-Source-Lizenzen';

  @override
  String get settingsPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get settingsPrivacyPolicySubtitle => 'Wie Moonfin mit Daten umgeht';

  @override
  String get settingsCheckForUpdates => 'Nach Updates suchen';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Nach der neuesten Moonfin-Version suchen';

  @override
  String get settingsBoth => 'Beide';

  @override
  String get settingsShuffleContentTypeFilter => 'Inhaltstypfilter mischen';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Audiospuren, Verarbeitung und Passthrough-Optionen';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Automatisierte Wiedergabe und Sequenzierung';

  @override
  String get settingsSyncplaySubtitle =>
      'Synchronisationslogik für Gruppensitzungen';

  @override
  String get settingsSkipIntrosAndOutros => 'Intros und Outros überspringen?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segmente';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Countdown für Mediensegmente';

  @override
  String get settingsProgressBar => 'Fortschrittsbalken';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Keine';

  @override
  String get settingsSkipButtonAutoHide =>
      'Schaltfläche zum Überspringen automatisch ausblenden';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Intro- und Outro-Überspringen-Schaltfläche nach einigen Sekunden automatisch ausblenden.';

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
  String get settingsPlaybackEngineMpvLegacy => 'mpv (alt)';

  @override
  String get settingsRedetectDisplay => 'Display neu erkennen';

  @override
  String get settingsRedetectDisplayDescription =>
      'Den Fernseher erneut fragen, welche HDR-Formate er unterstützt. Verwende das, wenn Dolby-Vision- oder HDR10-Titel transkodiert werden, nachdem Fernseher oder Receiver spät eingeschaltet wurden.';

  @override
  String get settingsDisplayIsSdr => 'Mein Fernseher kann kein HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Für dieses Display keine HDR-Unterstützung mehr melden. Nur verwenden, wenn die Erkennung ständig HDR meldet, das dein Fernseher gar nicht anzeigen kann.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Display neu erkannt: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'Keine HDR-Formate erkannt';

  @override
  String get settingsDisplayMarkedSdr => 'Display als SDR gespeichert';

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
  String get settingsAutoAftkrtEnabled => 'Auto';

  @override
  String get settingsEnabledOnThisDevice => 'Aktiviert';

  @override
  String get settingsDisabledPreferTranscode => 'Deaktiviert';

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
  String get settingsHideControlsAfter => 'Steuerelemente ausblenden nach';

  @override
  String get settingsHideControlsAfterDescription =>
      'Wie lange die Player-Steuerelemente nach dem letzten Tastendruck, Tippen oder Bewegen der Maus angezeigt werden.';

  @override
  String get settingsHdrControlsDimming => 'Steuerelemente bei HDR abdunkeln';

  @override
  String get settingsHdrControlsDimmingDescription =>
      'Weiß wirkt neben HDR-Video viel heller, deshalb werden die Player-Steuerelemente während der Wiedergabe um diesen Wert abgedunkelt.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 zum externen Decoder';

  @override
  String get settingsCinemaMode => 'Kinomodus';

  @override
  String get settingsCinemaModeSubtitle =>
      'Spielen Sie Trailer/Prerolls vor einem Hauptfeature ab';

  @override
  String get settingsCinemaModeEpisodes =>
      'Kinomodus auch für Folgen aktivieren';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Auch Vorschauvideos vor Folgen abspielen';

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
      'Zeigen Sie die SyncPlay-Schaltfläche in der Navigationsleiste an.';

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
    return 'Neu in $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Kürzlich erschienen: $libraryName';
  }

  @override
  String get autoplayNextEpisode => 'Nächste Episode automatisch abspielen';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Spielen Sie automatisch die nächste Episode ab, wenn verfügbar.';

  @override
  String get skipSilenceTitle => 'Überspringen Sie die Stille';

  @override
  String get skipSilenceSubtitle =>
      'Stumme Audiosegmente automatisch überspringen, wenn dies vom Stream unterstützt wird.';

  @override
  String get allowExternalAudioEffectsTitle => 'Externe Audioeffekte zulassen';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Erlauben Sie Equalizer- und Effekt-Apps (z. B. Wavelet), sich an Media3 Wiedergabesitzungen anzuhängen.';

  @override
  String get disableTunnelingTitle => 'Tunneling deaktivieren';

  @override
  String get disableTunnelingSubtitle =>
      'Nicht getunnelte Wiedergabe erzwingen. Nützlich bei Geräten mit Tunnel-Audio-/Video-Diskontinuitäten.';

  @override
  String get enableTunnelingTitle => 'Tunneling aktivieren';

  @override
  String get enableTunnelingSubtitle =>
      'Erweitert. Leitet Audio und Video über einen gekoppelten Hardware-Pfad. Standardmäßig aus, da es auf manchen Geräten zu Audio-/Videoaussetzern führt.';

  @override
  String get mapDolbyVisionP7Title =>
      'Dolby Vision Profil 7 immer als HRD10 abspielen';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Dolby Vision P7 nicht konvertieren, sondern als HDR10-kompatibles HEVC ausgeben. Verwenden Sie diese Option, wenn konvertierte Streams fehlerhaft aussehen.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Dolby Vision mit HDR10+ als HDR10+ abspielen';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Die Dolby-Vision-Ebene bei Videos entfernen, die auch HDR10+ enthalten. Aktiviere dies, wenn diese Videos mit Ton, aber schwarzem Bild abgespielt werden.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Verwenden Sie eingebettete Untertitelstile';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Wenden Sie Farben, Schriftarten und Positionierung an, die in die Untertitelspur eingebettet sind. Deaktivieren Sie die Option, um stattdessen Ihre Einstellungen für den Untertitelstil zu verwenden.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Verwenden Sie die Schriftgrößen für eingebettete Untertitel';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Wenden Sie Hinweise zur Schriftgröße an, die in die Untertitelspur eingebettet sind. Deaktivieren Sie die Verwendung der Untertitelgröße aus Ihren Stileinstellungen.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Mediendetails anzeigen';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Details des ausgewählten Elements oben auf Bibliotheksseiten anzeigen.';

  @override
  String get libraryCardTitles => 'Titel unter Postern';

  @override
  String get libraryCardTitlesDescription =>
      'Titel und Details jedes Elements in Bibliotheksrastern unter dem Artwork anzeigen.';

  @override
  String get useDetailedSubHeadings =>
      'Verwenden Sie detaillierte Unterüberschriften';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Detaillierte oder minimale Unterzeile auf Bibliotheksseiten anzeigen.';

  @override
  String get savedThemesDeleteDialogTitle => 'Gespeichertes Theme löschen?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return '„$themeName“ aus diesem Gerätecache entfernen?';
  }

  @override
  String get themeStore => 'Theme-Store';

  @override
  String get themeStoreSubtitle =>
      'Community-Themes durchstöbern und speichern.';

  @override
  String get themeStoreDescription =>
      'Speichern Sie ein Theme, um es wie Ihre anderen gespeicherten Themes zu verwenden.';

  @override
  String get themeStoreEmpty => 'Derzeit sind keine Themes verfügbar.';

  @override
  String get themeStoreLoadFailed =>
      'Der Theme-Store konnte nicht geladen werden. Prüfen Sie Ihre Verbindung und versuchen Sie es erneut.';

  @override
  String get themeStoreSave => 'Speichern';

  @override
  String get themeStoreSaveAndApply => 'Speichern & anwenden';

  @override
  String get themeStoreSaved => 'Gespeichert';

  @override
  String get themeStoreInvalidMessage =>
      'Dieses Theme konnte nicht geladen werden.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '„$themeName“ gespeichert.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '„$themeName“ wurde von diesem Gerät gelöscht.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return '„$themeName“ konnte nicht gelöscht werden.';
  }

  @override
  String get savedThemesTitle => 'Gespeicherte Themen';

  @override
  String get savedThemesDescription =>
      'Dabei handelt es sich um Themes, die vom Moonfin-Plugin für den aktuellen Server heruntergeladen wurden. Beim Löschen wird nur diese lokale Kopie entfernt.';

  @override
  String get savedThemesEmpty =>
      'Für diesen Server wurden keine gespeicherten Themes gefunden.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Derzeit aktiv';
  }

  @override
  String get savedThemesDeleteTooltip => 'Gespeichertes Thema löschen';

  @override
  String get savedThemesManageSubtitle =>
      'Verwalten Sie heruntergeladene Plugin-Themes auf diesem Gerät.';

  @override
  String get themeEditor => 'Theme-Editor';

  @override
  String get themeEditorSubtitle =>
      'Öffnen Sie den Moonfin Theme-Editor in Ihrem Browser';

  @override
  String get homeScreen => 'Startbildschirm';

  @override
  String get bottomBar => 'Untere Leiste';

  @override
  String get homeRowsStyleClassic => 'Klassiker';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsStyleCarousel => 'Karussell';

  @override
  String get homeRowsSection => 'Home-Reihen';

  @override
  String get rowsType => 'Zeilentyp';

  @override
  String get rowsTypeDescription =>
      'Classic behält den Bildtyp und die Informationsüberlagerung pro Zeile bei. Modern verwendet Hochformat-zu-Hintergrund-Reihen.';

  @override
  String get modernCardsOnMyMediaRow =>
      'Moderne Karten in der Zeile „Meine Medien“';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Anpassbare Poster anzeigen, die sich beim Fokussieren vergrößern. Deaktivieren Sie diese Option, um immer ein Querformat-Miniaturbild anzuzeigen.';

  @override
  String get sortOrder => 'Sortierreihenfolge';

  @override
  String get ascending => 'Aufsteigend';

  @override
  String get descending => 'Absteigend';

  @override
  String get displayFavoritesRows => 'Favoritenzeilen anzeigen';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Zeigen Sie Lieblingsfilme, -serien und andere Lieblingszeilen in den Home-Bereichen an.';

  @override
  String get favoritesRowSorting => 'Sortierung der Favoritenzeilen';

  @override
  String get favoritesRowSortingDescription =>
      'Sortieren Sie die Favoritenzeilen nach Hinzufügungsdatum, Veröffentlichungsdatum, alphabetisch und mehr.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Favoritenzeilen auf- oder absteigend sortieren.';

  @override
  String get displayCollectionsRows => 'Sammlungszeilen anzeigen';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Sammlungszeilen in Home-Abschnitten anzeigen.';

  @override
  String get collectionsRowSorting => 'Sortierung der Sammlungszeilen';

  @override
  String get collectionsRowSortingDescription =>
      'Sortieren Sie die Sammlungszeilen nach Hinzufügungsdatum, Veröffentlichungsdatum, alphabetisch und mehr.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sammlungen auf- oder absteigend sortieren.';

  @override
  String get collectionsRowShowEpisodes => 'Einzelne Folgen anzeigen';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Serien aufklappen und einzelne Folgen anzeigen.';

  @override
  String get displayGenresRows => 'Genrezeilen anzeigen';

  @override
  String get displayGenresRowsSubtitle =>
      'Zeigen Sie Genrezeilen in den Home-Abschnitten an.';

  @override
  String get genresRowSorting => 'Zeilensortierung nach Genres';

  @override
  String get genresRowSortingDescription =>
      'Sortieren Sie die Genrezeilen nach Hinzufügungsdatum, Veröffentlichungsdatum, alphabetisch und mehr.';

  @override
  String get genresRowSortOrderDescription =>
      'Genre auf- oder absteigend sortieren.';

  @override
  String get genresRowItems => 'Zeilenelemente „Genres“.';

  @override
  String get genresRowItemsDescription =>
      'Zeigen Sie Filme, Serien oder beides in den Genrezeilen an.';

  @override
  String get displayStudiosRows => 'Studiozeile anzeigen';

  @override
  String get displayStudiosRowsSubtitle =>
      'Studiozeile auf der Startseite anzeigen.';

  @override
  String get sinceYouWatched => 'Basierend auf deinen angesehenen Titeln';

  @override
  String get sinceYouWatchedRowTitle => 'Weil du … gesehen hast';

  @override
  String sinceYouWatchedItemRowTitle(String title) {
    return 'Weil du „$title“ gesehen hast';
  }

  @override
  String sinceYouWatchedRowNumber(int number) {
    return 'Empfehlungen $number';
  }

  @override
  String get displaySinceYouWatchedRows => 'Empfehlungen nach Verlauf';

  @override
  String get displaySinceYouWatchedRowsSubtitle =>
      'Empfehlungen anhand gesehener Titel auf der Startseite anzeigen und anpassen';

  @override
  String get sinceYouWatchedSource => 'Empfehlungsquelle';

  @override
  String get sinceYouWatchedSourceDescription =>
      'Wähle zwischen dem lokalen Empfehlungsalgorithmus von Moonfin, dem serverseitigen Empfehlungssystem von Jellyfin und den Ähnlichkeitsbewertungen von TMDb. Hinweis: Online-Empfehlungen erfordern eine Seerr-Integration.';

  @override
  String get sinceYouWatchedSourceLocal => 'Moonfin-Empfehlungen';

  @override
  String get sinceYouWatchedSourceServer => 'Server-Empfehlungen';

  @override
  String get sinceYouWatchedSourceOnline => 'TMDb-Ähnlichkeit';

  @override
  String get sinceYouWatchedSourceType => 'Inhaltstyp';

  @override
  String get sinceYouWatchedSourceTypeDescription =>
      'Wähle aus, welche Arten von Inhalten empfohlen werden sollen';

  @override
  String get sinceYouWatchedSourceItem => 'Titelauswahl';

  @override
  String get sinceYouWatchedSourceItemDescription =>
      'Bestimme die Grundlage für deine Empfehlungen';

  @override
  String get sinceYouWatchedRecentlyWatched => 'Zuletzt angesehen';

  @override
  String get sinceYouWatchedNumRows => 'Anzahl der Empfehlungszeilen';

  @override
  String get sinceYouWatchedNumRowsDescription =>
      'Wähle aus, wie viele Empfehlungszeilen angezeigt werden sollen';

  @override
  String get sinceYouWatchedIncludeWatched =>
      'Bereits angesehene Titel empfehlen';

  @override
  String get sinceYouWatchedIncludeWatchedSubtitle =>
      'Zeigt auch Filme und Serien in den Empfehlungen an, die du bereits gesehen hast';

  @override
  String get studiosRowSorting => 'Studiosortierung';

  @override
  String get studiosRowSortingDescription =>
      'Studiozeile nach Name, Aktualität und mehr sortieren.';

  @override
  String get studiosRowSortOrderDescription =>
      'Auf- oder absteigend sortieren.';

  @override
  String get selectStudiosToInclude =>
      'Studios auswählen, die eingeschlossen werden sollen';

  @override
  String get selectStudiosToIncludeDescription =>
      'Studios für die Startseitenzeile auswählen.';

  @override
  String get selectAllStudios => 'Alle auswählen';

  @override
  String get deselectAllStudios => 'Alle abwählen';

  @override
  String get tvStudiosFilter => 'Serienstudios';

  @override
  String get movieStudiosFilter => 'Filmstudios';

  @override
  String get selectedStudiosFilter => 'Ausgewählte Studios';

  @override
  String get unselectedStudiosFilter => 'Nicht ausgewählte Studios';

  @override
  String get filtersHeader => 'Filter';

  @override
  String get showHeader => 'Anzeigen';

  @override
  String get displayPlaylistsRows => 'Wiedergabelisten-Zeilen anzeigen';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Wiedergabelisten-Zeilen in Home-Abschnitten anzeigen.';

  @override
  String get playlistsRowSorting => 'Sortierung der Wiedergabelisten-Zeilen';

  @override
  String get playlistsRowSortingDescription =>
      'Wiedergabelisten-Zeilen nach Hinzufügungsdatum, Veröffentlichungsdatum, alphabetisch und mehr sortieren.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Wiedergabelistenzeilen auf- oder absteigend sortieren.';

  @override
  String get playlistsRowShowEpisodes => 'Einzelne Folgen anzeigen';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Serien aufklappen und Folgen einzeln anzeigen';

  @override
  String get displayAudioRows => 'Audio-Zeilen anzeigen';

  @override
  String get displayAudioRowsSubtitle =>
      'Audio-Zeilen in Home-Abschnitten anzeigen.';

  @override
  String get audioRowsSorting => 'Sortierung der Audio-Zeilen';

  @override
  String get audioRowsSortingDescription =>
      'Audio-Zeilen nach Hinzufügungsdatum, Veröffentlichungsdatum, alphabetisch und mehr sortieren.';

  @override
  String get audioRowsSortOrderDescription =>
      'Audioszeilen auf- oder absteigend sortieren.';

  @override
  String get sorting => 'Sortierung';

  @override
  String get imdbRowsSorting => 'Sortierung der IMDb-Zeilen';

  @override
  String get imdbRowsSortingDescription =>
      'IMDb-Zeilen nach Name, Erscheinungsdatum, Bewertung und mehr sortieren.';

  @override
  String get imdbRowsSortOrderDescription =>
      'IMDb-Zeilen aufsteigend oder absteigend sortieren.';

  @override
  String get tmdbRowsSorting => 'Sortierung der TMDB-Zeilen';

  @override
  String get tmdbRowsSortingDescription =>
      'TMDB-Zeilen nach Name, Erscheinungsdatum, Bewertung und mehr sortieren.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'TMDB-Zeilen aufsteigend oder absteigend sortieren.';

  @override
  String get seerrRowsSorting => 'Sortierung der Seerr-Zeilen';

  @override
  String get seerrRowsSortingDescription =>
      'Seerr-Zeilen nach Name, Erscheinungsdatum, Bewertung und mehr sortieren.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Seerr-Zeilen aufsteigend oder absteigend sortieren.';

  @override
  String get externalRowSortDefault => 'Standard (Listenreihenfolge)';

  @override
  String get externalRowSortName => 'Name';

  @override
  String get externalRowSortReleaseDate => 'Veröffentlichungsdatum';

  @override
  String get externalRowSortRating => 'Bewertung';

  @override
  String get externalRowSortPopularity => 'Beliebtheit';

  @override
  String get externalRowSortShuffle => 'Zufallswiedergabe';

  @override
  String get audioPlaylists => 'Audio-Wiedergabelisten';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Theme';

  @override
  String get keyboard => 'Tastatur';

  @override
  String get navButtons => 'Schaltflächen';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV-Konfiguration';

  @override
  String get cardSize => 'Kartengröße';

  @override
  String get externalPlayerApp => 'Externe Player-App';

  @override
  String get externalPlayerAppDescription =>
      'Externen Player festlegen, um die Wiedergabe per langem Drücken zu aktivieren';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'App-Auswahl anzeigen, wenn die Wiedergabe beginnt.';

  @override
  String get loadingInstalledPlayers => 'Installierte Player werden geladen...';

  @override
  String get connection => 'Verbindung';

  @override
  String get locallyDecodedCodecs => 'Lokal dekodierte Codecs';

  @override
  String get transcodeTargetCodecs => 'Zielcodecs für Transkodierung';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Wird auf diesem Gerät unterstützt';

  @override
  String get notSupportedOnThisDevice => 'Auf diesem Gerät nicht unterstützt';

  @override
  String get mediaPlayerBehavior => 'Verhalten des Mediaplayers';

  @override
  String get playbackEnhancements => 'Verbesserungen bei der Wiedergabe';

  @override
  String get alwaysOn => 'Immer an.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Ersetzen Sie Skip Outro durch Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Zeigen Sie das Next Up-Overlay anstelle der Schaltfläche „Outro überspringen“ an.';

  @override
  String get playerRouting => 'Spielerrouting';

  @override
  String get preferSoftwareDecoders => 'Bevorzugen Sie Software-Decoder';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Verwenden Sie FFmpeg (Audio) und libgav1 (AV1) vor Hardware-Decodern. Deaktivieren, wenn HDMI-Audio-Passthrough unterbrochen wird.';

  @override
  String get hevcSoftwareDirectPlay =>
      'Direct Play für HEVC (Software-Dekodierung)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'HEVC bis 1080p aus der Originaldatei abspielen, statt den Server transkodieren zu lassen. Dieses Apple TV dekodiert es per Software, daher können anspruchsvolle 10-Bit-Dateien oder Dateien mit hoher Bitrate ruckeln.';

  @override
  String get av1SoftwareUhdDirectPlay =>
      'Direct Play für 4K-AV1 (Software-Dekodierung)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      'AV1 über 1080p, auch HDR10, aus der Originaldatei abspielen, statt den Server transkodieren zu lassen. Dieses Gerät dekodiert AV1 per Software, daher können anspruchsvolle 4K-Dateien oder Dateien mit hoher Bitrate ruckeln.';

  @override
  String get cadenceSlowdown => 'Flüssige 24 fps auf einem 60-Hz-Fernseher';

  @override
  String get cadenceSlowdownSubtitle =>
      'Wenn „Bildrate anpassen“ aus ist, 24-fps-Videos 0,1 % langsamer abspielen, damit sie ohne ausgelassene Bilder zum Fernseher passen. Wird nicht verwendet, wenn Audio an einen Receiver durchgereicht wird.';

  @override
  String get cadenceTipTitle => '„Bildrate anpassen“ aktivieren';

  @override
  String get cadenceTipMessage =>
      'Dieses Video kann bei der aktuellen Bildwiederholrate deines Fernsehers nicht flüssig abgespielt werden. Öffne auf deinem Apple TV Einstellungen > Video und Audio > Inhalt anpassen und aktiviere „Bildrate anpassen“.';

  @override
  String get cadenceTipSlowdownHint =>
      'Oder aktiviere in Moonfin unter Wiedergabe > Qualität & Dekodierung die Option „Flüssige 24 fps auf einem 60-Hz-Fernseher“.';

  @override
  String get useExternalPlayer => 'Verwenden Sie einen externen Player';

  @override
  String get useExternalPlayerSubtitle =>
      'Öffnen Sie die Videowiedergabe in Ihrer ausgewählten externen App auf Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Nur Live-TV';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Den externen Player für Live-TV verwenden und alles andere im integrierten Player abspielen.';

  @override
  String get automaticQueuing => 'Automatische Warteschlange';

  @override
  String get preferSdhSubtitles => 'Bevorzugen Sie SDH-Untertitel';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorisieren Sie SDH/CC-Untertitelspuren bei der automatischen Auswahl.';

  @override
  String get preferTextSubtitles => 'Textuntertitel bevorzugen';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Textbasierte Untertitel (SRT, VTT) gegenüber bildbasierten Formaten (PGS, VobSub) bevorzugen.';

  @override
  String get preferExternalSubtitles => 'Externe Untertitel bevorzugen';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Externe Untertiteldateien gegenüber eingebetteten Spuren bevorzugen.';

  @override
  String get webDiagnostics => 'Webdiagnose';

  @override
  String get webDiagnosticsTitle => 'Moonfin Webdiagnose';

  @override
  String get webDiagnosticsIntro =>
      'Verwenden Sie diese Seite, um Browser-Konnektivitätsprobleme (CORS, gemischte Inhalte und Erkennungseinstellungen) zu diagnostizieren.';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Fehler bei gemischten Inhalten erkannt';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'CORS/Preflight-Fehler erkannt';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin hat eine HTTPS-Seite erkannt, die versucht, eine HTTP-Server-URL aufzurufen. Browser blockieren diese Anfrage, bevor sie Ihren Server erreicht.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin hat einen Anforderungsfehler auf Browserebene erkannt, der häufig durch fehlende CORS- oder Preflight-Header auf dem Medienserver verursacht wird.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'Ziel-URL: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detail: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext => 'Aktueller Laufzeitkontext';

  @override
  String get webDiagnosticsOrigin => 'Herkunft';

  @override
  String get webDiagnosticsScheme => 'Schema';

  @override
  String get webDiagnosticsPluginMode => 'Plugin-Modus';

  @override
  String get webDiagnosticsWebRtcScan => 'WebRTC-Scan';

  @override
  String get webDiagnosticsForcedServerUrl => 'Erzwungene Server-URL';

  @override
  String get webDiagnosticsDefaultServerUrl => 'Standardserver-URL';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'Discovery-Proxy-URL';

  @override
  String get notConfigured => 'nicht konfiguriert';

  @override
  String get webDiagnosticsMixedContent => 'Gemischter Inhalt';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Diese Seite wird über HTTPS geladen, aber eine oder mehrere konfigurierte URLs sind HTTP. Browser blockieren den Aufruf von HTTP-APIs durch HTTPS-Seiten.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Fix: Stellen Sie Ihren Medienserver oder Proxy-Endpunkt über HTTPS bereit oder laden Sie Moonfin über HTTP nur in vertrauenswürdigen lokalen Netzwerken.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'In den aktuellen Laufzeiteinstellungen wurde keine offensichtliche Mixed-Content-Konfiguration erkannt.';

  @override
  String get webDiagnosticsCorsChecklist => 'CORS-Checkliste';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Erlauben Sie den Browser-Ursprung in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Fügen Sie Autorisierung, X-Emby-Autorisierung und X-Emby-Token in Access-Control-Allow-Header ein.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Content-Range- und Accept-Ranges für Streaming- und Suchverhalten verfügbar machen.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Geben Sie 204 an OPTIONS Preflight-Anfragen zurück.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Beispiel-Header-Snippet (Nginx-Stil)';

  @override
  String get note => 'Notiz';

  @override
  String get webDiagnosticsNonWebNote =>
      'Diese Diagnoseroute ist für Webbuilds gedacht. Wenn Sie dies auf einer anderen Plattform sehen, gelten diese Überprüfungen möglicherweise nicht.';

  @override
  String get backToServerSelect => 'Zurück zur Serverauswahl';

  @override
  String get signOutAllUsers => 'Melden Sie alle Benutzer ab';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'Die Mikrofonberechtigung wird dauerhaft verweigert. Aktivieren Sie es in den Systemeinstellungen.';

  @override
  String get voiceSearchPermissionRequired =>
      'Für die Sprachsuche ist eine Mikrofonberechtigung erforderlich.';

  @override
  String get voiceSearchNoMatch =>
      'Habe das nicht verstanden. Versuchen Sie es erneut.';

  @override
  String get voiceSearchNoSpeechDetected => 'Keine Sprache erkannt.';

  @override
  String get voiceSearchMicrophoneError => 'Mikrofonfehler.';

  @override
  String get voiceSearchNeedsInternet => 'Sprachsuche braucht Internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Der Sprachdienst ist ausgelastet. Versuchen Sie es erneut.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'Die Mikrofonberechtigung wird dauerhaft verweigert.';

  @override
  String get microphonePermissionDenied =>
      'Die Mikrofonberechtigung wurde verweigert.';

  @override
  String get speechRecognitionUnavailable =>
      'Die Spracherkennung ist auf diesem Gerät nicht verfügbar.';

  @override
  String get openIosRoutePicker => 'Öffnen Sie die iOS-Routenauswahl';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay Routenauswahl ist auf diesem Gerät nicht verfügbar.';

  @override
  String get videos => 'Videos';

  @override
  String get programs => 'Programme';

  @override
  String get songs => 'Lieder';

  @override
  String get photoAlbums => 'Fotoalben';

  @override
  String get photos => 'Fotos';

  @override
  String get people => 'Menschen';

  @override
  String get recentlyReleasedEpisodes => 'Kürzlich veröffentlichte Episoden';

  @override
  String get watchAgain => 'Nochmal ansehen';

  @override
  String get guestAppearances => 'Gastauftritte';

  @override
  String get appearancesSeerr => 'Auftritte (Seerr)';

  @override
  String get crewContributionsSeerr => 'Crew-Beiträge (Seerr)';

  @override
  String get personWebsite => 'Offizielle Website';

  @override
  String get watchWithGroup => 'Mit der Gruppe ansehen';

  @override
  String get watchPartyGroupSubtitles => 'Untertitel für alle';

  @override
  String get watchPartyOwnSubtitles => 'Wahl jeder Person';

  @override
  String get watchPartyLobby => 'In der Lobby';

  @override
  String get watchPartyUpNextLabel => 'Als Nächstes';

  @override
  String get watchPartyRoomSettings => 'Raumeinstellungen';

  @override
  String get watchPartyCodeOrLink => 'Raumcode oder Einladungslink';

  @override
  String get watchPartyCopyInvite => 'Einladungslink kopieren';

  @override
  String get watchPartyInviteCopied => 'Einladungslink kopiert';

  @override
  String get watchPartyLetEveryoneVote => 'Alle über Filme abstimmen lassen';

  @override
  String get watchPartyVoteHelp =>
      'Füge Filme hinzu, über die alle abstimmen können, und spiele dann den gewünschten ab. Serienepisoden wählst weiterhin du aus.';

  @override
  String get watchPartyGuestVoteHelp =>
      'Stimme ab, was du sehen möchtest. Der Gastgeber spielt einen Titel ab.';

  @override
  String get watchPartySearchMovies => 'Filme suchen';

  @override
  String get watchPartyNoSuggestions => 'Noch keine Filme zur Abstimmung.';

  @override
  String get watchPartySuggested =>
      'Zur Abstimmung der Watch Party hinzugefügt';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Stimmen',
      one: '$count Stimme',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => 'Watch Party';

  @override
  String get watchPartyUnavailable =>
      'Dieser Server bietet keine Watch Party an.';

  @override
  String get watchPartyRoomCode => 'Raumcode';

  @override
  String get watchPartyStart => 'Eine Watch Party starten';

  @override
  String get watchPartyPickTitle =>
      'Öffne einen Titel und wähle „Mit Gruppe ansehen“, um festzulegen, was alle schauen.';

  @override
  String get watchPartyWaitingForHost =>
      'Warte darauf, dass der Gastgeber etwas auswählt.';

  @override
  String get watchPartyShareCode =>
      'Andere treten mit diesem Code über ihren Watch-Party-Bildschirm bei.';

  @override
  String get watchPartyReconnecting => 'Verbindung wird wiederhergestellt...';

  @override
  String get watchPartyOffline => 'offline';

  @override
  String get watchPartyStartForEveryone => 'Für alle starten';

  @override
  String watchPartyResumeAt(String time) {
    return 'Fortsetzen bei $time';
  }

  @override
  String get watchPartyStartFromBeginning => 'Von vorne beginnen';

  @override
  String watchPartyResumeWhere(String name) {
    return 'Wo $name aufgehört hat, die früheste Stelle, die hier jemand erreicht hat.';
  }

  @override
  String get watchPartyResumeEarliest =>
      'Die früheste Stelle, die hier jemand erreicht hat.';

  @override
  String get watchPartyResumeYours =>
      'Wo du aufgehört hast. Alle starten von dort.';

  @override
  String watchPartyResumeNotStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Personen haben es noch nicht gestartet.',
      one: '1 Person hat es noch nicht gestartet.',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyBackToLobby => 'Zurück zur Lobby';

  @override
  String get watchPartyGuestsCanPause => 'Gäste können abspielen und pausieren';

  @override
  String get watchPartyEnd => 'Für alle beenden';

  @override
  String get watchPartyEnded => 'Die Watch Party ist beendet.';

  @override
  String get watchPartyStaged => 'Für die Watch Party ausgewählt';

  @override
  String watchPartyUpNext(String title) {
    return 'Als Nächstes: $title';
  }

  @override
  String get watchParties => 'Watch Partys';

  @override
  String get watchPartyStartWith => 'Partys starten mit';

  @override
  String get watchPartyServiceMoonbaseHint =>
      'Chat, Reaktionen und Abstimmungen. Läuft über Moonbase.';

  @override
  String get watchPartyServiceSyncPlayHint =>
      'Die eigene Funktion von Jellyfin. Freunde mit anderen Jellyfin-Apps können beitreten.';

  @override
  String get watchPartyServiceNote =>
      'Du kannst Räumen beider Arten beitreten. Hier wählst du nur, was du selbst startest.';

  @override
  String get watchPartyDuringParty => 'Während einer Party';

  @override
  String get watchPartyChatOverlay => 'Chat über dem Video anzeigen';

  @override
  String get watchPartyChatOverlaySubtitle =>
      'Neue Nachrichten werden ein paar Sekunden lang angezeigt';

  @override
  String get watchPartyAlerts => 'Party-Benachrichtigungen';

  @override
  String get watchPartyAlertsSubtitle =>
      'Benachrichtige mich, wenn jemand auf diesem Server eine startet';

  @override
  String get watchPartyJoinWithCode => 'Mit Code beitreten';

  @override
  String get watchPartyOnThisServer => 'Auf diesem Server';

  @override
  String watchPartyCountOnServer(int count) {
    return '$count auf diesem Server';
  }

  @override
  String get watchPartyRoomsHint =>
      'Um beizutreten, brauchst du Zugriff auf das Element. Ein Raum wird geschlossen, wenn die letzte Person ihn verlässt.';

  @override
  String get watchPartyRoomsEmpty =>
      'Partys, denen du beitreten kannst, erscheinen hier. Hast du einen Code bekommen? Wähle „Mit Code beitreten“.';

  @override
  String get watchPartyPasteHint =>
      'Du kannst hier auch einen Einladungslink einfügen. Auf einem Handy öffnet der Link Moonfin direkt in der Party.';

  @override
  String watchPartyWatchingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count schauen',
      one: '$count schaut',
    );
    return '$_temp0';
  }

  @override
  String watchPartyHostsParty(String name) {
    return 'Party von $name';
  }

  @override
  String get watchPartyEveryoneControlsShort => 'Alle können steuern';

  @override
  String get watchPartyVotingNow => 'Es wird abgestimmt, was geschaut wird';

  @override
  String get watchPartyNeedsMoonbase =>
      'Watch Partys benötigen Moonbase auf diesem Server';

  @override
  String get watchPartyNeedsMoonbaseHint =>
      'Bitte den Administrator des Servers, das Moonbase-Plugin zu installieren. Unter Jellyfin funktioniert SyncPlay auch ohne das Plugin.';

  @override
  String get watchPartyWrongPin =>
      'Diese PIN hat nicht funktioniert. Versuche es erneut.';

  @override
  String get watchPartyTooManyTries => 'Zu viele Versuche. Warte eine Minute.';

  @override
  String get watchPartyFull => 'Diese Party ist voll.';

  @override
  String get watchPartyNoSuchCode => 'Kein Raum hat diesen Code.';

  @override
  String get watchPartyNoAccess =>
      'Du hast keinen Zugriff auf das, was gerade geschaut wird.';

  @override
  String get watchPartyRemoved =>
      'Der Gastgeber hat dich aus der Party entfernt.';

  @override
  String get watchPartyYours => 'Deine Watch Party';

  @override
  String get watchPartyInviteHint =>
      'Füge ihn in einen beliebigen Chat ein. Er öffnet eine Seite auf diesem Server mit einer „In Moonfin öffnen“-Taste.';

  @override
  String get watchPartySendInvite => 'Einladung senden';

  @override
  String get watchPartyScanInvite =>
      'Scanne den Code mit deinem Handy, um den Einladungslink zu erhalten, und schick ihn von dort aus. Oder teile einfach den Code.';

  @override
  String get watchPartyStartsTogether =>
      'Die Wiedergabe wartet auf die Player aller Teilnehmer, höchstens 10 Sekunden, und zählt dann 3, 2, 1 herunter.';

  @override
  String get watchPartyStatusInSync => 'Synchron';

  @override
  String get watchPartyStatusCatchingUp => 'Synchronisiert';

  @override
  String get watchPartyStatusBuffering => 'Puffern';

  @override
  String get watchPartyStatusNotWatching => 'Schaut nichts';

  @override
  String get watchPartyStatusReady => 'Bereit';

  @override
  String get watchPartyStatusJoining => 'Tritt bei';

  @override
  String get watchPartyHost => 'Gastgeber';

  @override
  String watchPartyWaitingFor(String name) {
    return 'Warte auf den Player von $name';
  }

  @override
  String watchPartyWaitingForCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Warte auf $count Player',
      one: 'Warte auf $count Player',
    );
    return '$_temp0';
  }

  @override
  String watchPartyStartingAnyway(int seconds) {
    return 'Startet trotzdem in $seconds s';
  }

  @override
  String get watchPartyStartingTogether => 'Gemeinsamer Start';

  @override
  String watchPartyToastPaused(String name) {
    return '$name hat pausiert';
  }

  @override
  String watchPartyToastResumed(String name) {
    return '$name hat fortgesetzt';
  }

  @override
  String watchPartyToastSkipped(String name, String time) {
    return '$name ist zu $time gesprungen';
  }

  @override
  String watchPartyToastJoined(String name) {
    return '$name ist beigetreten';
  }

  @override
  String watchPartyToastLeft(String name) {
    return '$name hat verlassen';
  }

  @override
  String watchPartyToastSwitched(String name, String title) {
    return '$name hat zu $title gewechselt';
  }

  @override
  String get watchPartyToastYouAreHost => 'Du bist jetzt der Gastgeber';

  @override
  String watchPartyToastNewHost(String name) {
    return '$name ist jetzt der Gastgeber';
  }

  @override
  String get watchPartyToastEveryoneControls =>
      'Alle können jetzt die Wiedergabe steuern';

  @override
  String get watchPartyToastHostControls =>
      'Nur der Gastgeber steuert jetzt die Wiedergabe';

  @override
  String get watchPartyOnlyHostControls =>
      'Nur der Gastgeber kann die Wiedergabe steuern.';

  @override
  String get watchPartyToastReconnecting => 'Verbinde erneut mit der Party...';

  @override
  String get watchPartyToastReconnected => 'Wieder in der Party';

  @override
  String watchPartyToastEnded(String name) {
    return '$name hat die Party beendet';
  }

  @override
  String get watchPartyChat => 'Chat';

  @override
  String get watchPartySendToParty => 'An die Party senden';

  @override
  String get watchPartyBackToClose => 'Mit Zurück schließen';

  @override
  String get watchPartyType => 'Typ';

  @override
  String get watchPartyReplyHaha => 'Haha';

  @override
  String get watchPartyReplyNoWay => 'Auf keinen Fall';

  @override
  String get watchPartyReplyPausePlease => 'Bitte pausieren';

  @override
  String get watchPartyReplyBrb => 'Bin gleich zurück';

  @override
  String get watchPartyReplyAgain => 'Nochmal!';

  @override
  String get watchPartyReactionLove => 'Liebe';

  @override
  String get watchPartyReactionHaha => 'Haha';

  @override
  String get watchPartyReactionWow => 'Wow';

  @override
  String get watchPartyReactionSad => 'Traurig';

  @override
  String get watchPartyReactionFire => 'Feuer';

  @override
  String get watchPartyReactionPopcorn => 'Popcorn';

  @override
  String get watchPartyMakeHost => 'Zum Gastgeber machen';

  @override
  String get watchPartyEveryoneControls => 'Jeder kann die Wiedergabe steuern';

  @override
  String get watchPartyEveryoneControlsHint =>
      'Alle können abspielen, pausieren und überspringen';

  @override
  String get watchPartyRoomPin => 'Raum-PIN';

  @override
  String get watchPartyRoomPinHint => 'Vor dem Beitritt nach einer PIN fragen';

  @override
  String get watchPartyPinDigits => '4 bis 8 Ziffern';

  @override
  String get watchPartyLeave => 'Verlassen';

  @override
  String watchPartyLeaveHandsOver(String name) {
    return 'Verlassen · $name übernimmt';
  }

  @override
  String watchPartyStartedBy(String name) {
    return '$name hat eine Watch Party gestartet';
  }

  @override
  String watchPartyInLobbyCount(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$title · $count in der Lobby',
      one: '$title · $count in der Lobby',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyFirstOnHome =>
      'Es steht an erster Stelle bei „Watch Partys“ auf der Startseite';

  @override
  String watchPartyAddServerQuestion(String address) {
    return 'Diese Einladung gilt für einen Server, den du noch nicht hinzugefügt hast: $address. Füge ihn hinzu und melde dich an, um beizutreten.';
  }

  @override
  String get disk => 'Speicherauslastung';

  @override
  String get openInBrowser => 'Im Browser öffnen';

  @override
  String get achievementBadges => 'Erfolgsabzeichen';

  @override
  String get achievementBadgesSubtitle =>
      'Abzeichen, Ränge und Quests, die du durch das Anschauen verdient hast';

  @override
  String get achievementsBadges => 'Abzeichen';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked von $total Abzeichen';
  }

  @override
  String get achievementsUnlockToasts => 'Freischalt-Benachrichtigungen';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Eine Benachrichtigung anzeigen, wenn du ein Abzeichen freischaltest';

  @override
  String get achievementsUnlockedNotification => 'Erfolg freigeschaltet';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Erfolge freigeschaltet',
      one: '$count Erfolg freigeschaltet',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count mehr';
  }

  @override
  String get achievementsQuests => 'Quests';

  @override
  String achievementsQuestCount(int count) {
    return '$count abgeschlossen';
  }

  @override
  String get achievementsLeaderboard => 'Bestenliste';

  @override
  String get achievementsLeaderboardSubtitle =>
      'Wie du im Vergleich zu anderen Nutzern auf diesem Server abschneidest';

  @override
  String get achievementsRecap => 'Rückblick';

  @override
  String get achievementsRecapSubtitle => 'Was du zuletzt geschaut hast';

  @override
  String get achievementsLibraryCompletion => 'Bibliotheksfortschritt';

  @override
  String achievementsLibraryCount(int count) {
    return '$count Bibliotheken';
  }

  @override
  String achievementsScore(int score) {
    return '$score Punkte';
  }

  @override
  String get achievementsScoreLabel => 'Punkte';

  @override
  String get achievementsTopRank => 'Höchster Rang erreicht';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return 'Noch $points Punkte bis $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days Tage in Folge';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Beste: $days Tage';
  }

  @override
  String get achievementsShowcase => 'Präsentation';

  @override
  String get achievementsUnlocked => 'Freigeschaltet';

  @override
  String get achievementsLocked => 'Gesperrt';

  @override
  String get achievementsNothingHere => 'Hier ist noch nichts.';

  @override
  String get achievementsHiddenBadge => 'Verborgener Erfolg';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Freigeschaltet am $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points Pkt.';
  }

  @override
  String get achievementsDailyQuests => 'Täglich';

  @override
  String get achievementsWeeklyQuests => 'Wöchentlich';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Tägliche Quests neu auswürfeln';

  @override
  String get achievementsRerollWeekly => 'Wöchentliche Quests neu auswürfeln';

  @override
  String get achievementsRerollOffer =>
      'Diesen Satz gegen einen anderen tauschen';

  @override
  String get achievementsRerollSpentDaily =>
      'Heute verwendet, wieder verfügbar um Mitternacht (UTC)';

  @override
  String get achievementsRerollSpentWeekly =>
      'Diese Woche verwendet, wieder verfügbar am Montag (UTC)';

  @override
  String get achievementsRerollConfirm => 'Diese Quests neu auswürfeln?';

  @override
  String get achievementsRerollConfirmBody =>
      'Du hast ein tägliches und ein wöchentliches Neuauswürfeln, und dieses wird dabei verbraucht.';

  @override
  String get achievementsRerollFailed =>
      'Diese Quests konnten nicht neu gewürfelt werden.';

  @override
  String get achievementsSuggested => 'Vorgeschlagene Inhalte zum Ansehen';

  @override
  String get achievementsNoSuggestions =>
      'Für dieses Abzeichen gibt es keine Vorschläge.';

  @override
  String get achievementsProgressLabel => 'Fortschritt';

  @override
  String get achievementsLoadout => 'Ausrüstung';

  @override
  String get achievementsLoadoutSubtitle =>
      'Punkte zum Ausgeben und deine Boosts';

  @override
  String get achievementsAppearance => 'Erscheinungsbild';

  @override
  String get achievementsAppearanceSubtitle =>
      'Der Avatar und Titel in deinem Profil';

  @override
  String get achievementsAvatars => 'Avatare';

  @override
  String get achievementsTitles => 'Titel';

  @override
  String get achievementsEquipped => 'Ausgerüstet';

  @override
  String get achievementsOwned => 'Im Besitz';

  @override
  String achievementsEarnedAt(int score) {
    return 'Erzielt bei einem Gesamtpunktstand von $score';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'Dieser Server hat keine Avatare oder Titel zum Anlegen.';

  @override
  String get achievementsAppearanceFailed =>
      'Profil konnte nicht angepasst werden.';

  @override
  String get achievementsPowerUps => 'Power-ups';

  @override
  String get achievementsStats => 'Statistik';

  @override
  String get achievementsStatsSubtitle =>
      'Deine Rekorde und wie es dem Server geht';

  @override
  String get achievementsStatsWatched => 'Gesehen';

  @override
  String get achievementsStatsBests => 'Beste';

  @override
  String get achievementsStatsHabits => 'Gewohnheiten';

  @override
  String get achievementsStatsVariety => 'Abwechslung';

  @override
  String get achievementsStatsServer => 'Dieser Server';

  @override
  String get achievementsStatsClock => 'Wann du schaust';

  @override
  String get achievementsStatItems => 'Gesehene Elemente';

  @override
  String get achievementsStatMovies => 'Gesehene Filme';

  @override
  String get achievementsStatSeries => 'Serie beendet';

  @override
  String get achievementsStatHours => 'Geschaute Stunden';

  @override
  String get achievementsStatDays => 'Tage gesehen';

  @override
  String get achievementsStatRewatches => 'Wiederholungen';

  @override
  String get achievementsStatBestWatchStreak => 'Bester Watch-Streak';

  @override
  String get achievementsStatBestLoginStreak => 'Bester Login-Streak';

  @override
  String get achievementsStatMostEpisodes => 'Meiste Episoden an einem Tag';

  @override
  String get achievementsStatMostMovies => 'Meiste Filme an einem Tag';

  @override
  String get achievementsStatLongestItem => 'Längstes einzelnes Element';

  @override
  String get achievementsStatBestCombo => 'Beste Kombo';

  @override
  String get achievementsStatLateNight => 'Sessions spät in der Nacht';

  @override
  String get achievementsStatEarlyMorning => 'Sessions am frühen Morgen';

  @override
  String get achievementsStatWeekend => 'Sessions am Wochenende';

  @override
  String get achievementsStatDaysSignedIn => 'Tage angemeldet';

  @override
  String get achievementsStatLibraries => 'Besuchte Bibliotheken';

  @override
  String get achievementsStatGenres => 'Gesehene Genres';

  @override
  String get achievementsStatDecades => 'Jahrzehnte gesehen';

  @override
  String get achievementsStatCountries => 'Länder gesehen';

  @override
  String get achievementsStatLanguages => 'Gesehene Sprachen';

  @override
  String get achievementsStatUsers => 'Benutzer';

  @override
  String get achievementsStatBadgesUnlocked => 'Abzeichen freigeschaltet';

  @override
  String get achievementsStatScoreEarned => 'Verdiente Punkte';

  @override
  String get achievementsStatCommonBadge => 'Häufigstes Abzeichen';

  @override
  String get achievementsActivity => 'Aktivität';

  @override
  String get achievementsActivitySubtitle =>
      'Was der Server zuletzt freigeschaltet hat';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user hat $badge freigeschaltet';
  }

  @override
  String get achievementsShop => 'Shop';

  @override
  String get achievementsShopSubtitle => 'Punkte für weitere Boosts ausgeben';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Derzeit gibt es nichts zu kaufen.';

  @override
  String get achievementsBuyConfirm => 'Das kaufen?';

  @override
  String get achievementsBuyConfirmBody =>
      'Es wird direkt von deinem Punktekonto abgezogen.';

  @override
  String get achievementsBuyFailed => 'Kauf fehlgeschlagen.';

  @override
  String get achievementsScoreBank => 'Punktekonto';

  @override
  String get achievementsBoost => 'XP-Boost';

  @override
  String get achievementsBoostBody =>
      'Verdoppelt die Punktzahl für eine Stunde. Eine erneute Anwendung setzt die Stunde zurück.';

  @override
  String get achievementsDoubleCredit => 'Doppelte Punkte';

  @override
  String get achievementsDoubleCreditBody =>
      'Das Nächste, was du zu Ende schaust, zählt doppelt für deine Abzeichen.';

  @override
  String get achievementsStreakFreeze => 'Streak-Freeze';

  @override
  String get achievementsStreakFreezeBody =>
      'Deckt einen verpassten Tag ab. Nur einer kann angespart werden.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gehalten',
      one: '1 gehalten',
      zero: 'Keine vorhanden',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Läuft gerade';

  @override
  String get achievementsUsePowerUp => 'Dieses Power-up verwenden?';

  @override
  String get achievementsUsePowerUpBody =>
      'Es wird verbraucht, sobald du bestätigst.';

  @override
  String get achievementsPowerUpFailed =>
      'Dieses Power-up konnte nicht verwendet werden.';

  @override
  String get achievementsHours => 'Stunden';

  @override
  String get achievementsStreak => 'Streak';

  @override
  String get achievementsPeriodWeek => 'Woche';

  @override
  String get achievementsPeriodMonth => 'Monat';

  @override
  String get achievementsPeriodYear => 'Erscheinungsjahr';

  @override
  String achievementsDaysWatched(int count) {
    return '$count Tage angesehen';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count Abzeichen verdient';
  }

  @override
  String get achievementsTopDirectors => 'Top-Regisseure';

  @override
  String get achievementsTopActors => 'Top-Schauspieler';

  @override
  String get achievementsLoadFailed =>
      'Deine Erfolge konnten nicht geladen werden.';

  @override
  String get friends => 'Freunde';

  @override
  String get friendsSubtitle =>
      'Sieh, wer online ist, und chatte mit Personen auf diesem Server';

  @override
  String get friendsShowButton => 'Freunde-Taste anzeigen';

  @override
  String get friendsShowButtonSubtitle =>
      'Freunde und Chat aus dem Achievement-Badges-Plugin';

  @override
  String get friendsMessages => 'Nachrichten vom Serveradministrator';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ungelesene Nachrichten',
      one: '1 ungelesene Nachricht',
      zero: 'Keine ungelesenen Nachrichten',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Freundschaftsanfragen';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count warten auf dich',
      one: '1 wartet auf dich',
      zero: 'Nichts ausstehend',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Freunde hinzufügen';

  @override
  String get friendsAddSubtitle => 'Personen auf diesem Server finden';

  @override
  String get friendsPrivacy => 'Datenschutz';

  @override
  String get friendsPrivacySubtitle => 'Was deine Freunde sehen können';

  @override
  String get friendsOnline => 'Online';

  @override
  String get friendsOffline => 'Offline';

  @override
  String get friendsNone =>
      'Noch keine Freunde. Füge Personen von diesem Server hinzu, um sie hier zu sehen.';

  @override
  String friendsWatching(String title) {
    return 'Schaut $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Zuletzt geschaut: $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Zuletzt gesehen $time';
  }

  @override
  String get friendsLoadFailed =>
      'Laden fehlgeschlagen. Überprüfe deine Verbindung und versuche es erneut.';

  @override
  String get friendsActionFailed =>
      'Das hat nicht funktioniert. Versuche es gleich noch einmal.';

  @override
  String get friendsIncoming => 'Wartet auf dich';

  @override
  String get friendsOutgoing => 'Von dir gesendet';

  @override
  String get friendsNoRequests => 'Keine Freundschaftsanfragen.';

  @override
  String get friendsAccept => 'Annehmen';

  @override
  String get friendsDecline => 'Ablehnen';

  @override
  String get friendsCancelRequest => 'Anfrage abbrechen';

  @override
  String friendsRequestFrom(String name) {
    return '$name möchte mit dir befreundet sein';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Die Anfrage an $name zurückziehen?';
  }

  @override
  String get friendsSearchHint => 'Personen suchen';

  @override
  String get friendsNoMatches => 'Niemand passt zu diesem Namen.';

  @override
  String friendsRequestSent(String name) {
    return 'Anfrage an $name gesendet';
  }

  @override
  String get friendsSendRequest => 'Als Freund hinzufügen';

  @override
  String get friendsSendMessage => 'Nachricht senden';

  @override
  String friendsOpenItem(String title) {
    return '$title öffnen';
  }

  @override
  String get friendsRemove => 'Freund entfernen';

  @override
  String friendsRemoveBody(String name) {
    return '$name aus deinen Freunden entfernen? Du kannst die Person später wieder hinzufügen.';
  }

  @override
  String get friendsBlock => 'Blockieren';

  @override
  String get friendsUnblock => 'Blockierung aufheben';

  @override
  String friendsBlockBody(String name) {
    return '$name blockieren? Ihr könnt euch dann keine Direktnachrichten mehr schicken. Gemeinsame Gruppenchats bleiben bestehen.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Blockierung von $name aufheben?';
  }

  @override
  String get friendsBlocked => 'Blockierte Personen';

  @override
  String friendsProfileHidden(String name) {
    return '$name hält das eigene Profil privat.';
  }

  @override
  String get friendsAppearOffline => 'Als offline anzeigen';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Freunde sehen dich immer als offline';

  @override
  String get friendsHideNowPlaying => 'Verbergen, was ich schaue';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Freunde sehen dich weiterhin online, aber nicht, was gerade läuft';

  @override
  String get friendsHideLastWatched => 'Zuletzt Gesehenes verbergen';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Freunde sehen nicht, was du zuletzt geschaut hast, während du offline bist';

  @override
  String get friendsMessageNotifications => 'Nachrichtenbenachrichtigungen';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Ein Banner anzeigen, wenn dir ein Freund schreibt';

  @override
  String get friendsMuteDuringPlayback =>
      'Während der Wiedergabe stummschalten';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'Keine Nachrichtenbanner, während ein Video oder Spiel läuft';

  @override
  String get friendsSaveFailed =>
      'Deine Einstellungen konnten nicht gespeichert werden.';

  @override
  String get chatNew => 'Neue Nachricht';

  @override
  String get chatNewSubtitle => 'Einen Chat mit einem Freund beginnen';

  @override
  String get chatNewGroup => 'Neue Gruppe';

  @override
  String get chatNewGroupSubtitle =>
      'Mit mehreren Freunden gleichzeitig chatten';

  @override
  String get chatNone => 'Noch keine Nachrichten.';

  @override
  String get chatYou => 'Du';

  @override
  String chatYouSaid(String text) {
    return 'Du: $text';
  }

  @override
  String get chatPhoto => 'Bilder';

  @override
  String get chatEmoji => 'Emoji';

  @override
  String get chatEmojiSearch => 'Emoji suchen';

  @override
  String get chatNoRecentEmoji => 'Keine zuletzt verwendeten Emojis';

  @override
  String get chatViewPhoto => 'Foto anzeigen';

  @override
  String get chatHint => 'Schreib eine Nachricht';

  @override
  String get chatAttach => 'Foto senden';

  @override
  String get chatEdited => 'bearbeitet';

  @override
  String get chatSeen => 'Gesehen';

  @override
  String get chatSent => 'Gesendet';

  @override
  String get chatEditing => 'Nachricht bearbeiten';

  @override
  String get chatMessageOptions => 'Nachrichtenoptionen';

  @override
  String get chatDeleteBody => 'Diese Nachricht für alle löschen?';

  @override
  String get chatClear => 'Unterhaltung löschen';

  @override
  String get chatClearBody =>
      'Alle Nachrichten in diesem Chat für alle Teilnehmer löschen?';

  @override
  String get chatGroupInfo => 'Gruppeninfo';

  @override
  String get chatGroupName => 'Gruppenname';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Mitglieder',
      one: '1 Mitglied',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Besitzer';

  @override
  String get chatAdmin => 'Admin';

  @override
  String get chatMakeAdmin => 'Zum Admin machen';

  @override
  String get chatRemoveAdmin => 'Admin-Rechte entziehen';

  @override
  String get chatRemoveMember => 'Aus Gruppe entfernen';

  @override
  String get chatAddMember => 'Personen hinzufügen';

  @override
  String get chatNobodyToAdd => 'Niemand mehr zum Hinzufügen.';

  @override
  String get chatLeave => 'Gruppe verlassen';

  @override
  String get chatLeaveBody =>
      'Diese Gruppe verlassen? Jemand muss dich wieder hinzufügen, damit du erneut beitreten kannst.';

  @override
  String get chatCreate => 'Gruppe erstellen';

  @override
  String get chatPickMembers => 'Wähle mindestens zwei Freunde aus';

  @override
  String chatNewMessageFrom(String name) {
    return 'Neue Nachricht von $name';
  }

  @override
  String get chatImageTooLarge => 'Dieses Bild ist größer als 8 MB.';

  @override
  String get chatImageUnsupported =>
      'Es können nur PNG-, JPEG-, GIF- und WebP-Bilder gesendet werden.';

  @override
  String get embeddedBrowserNotAvailable =>
      'Ein eingebetteter Browser ist auf dieser Plattform nicht verfügbar.';

  @override
  String get adminRestartServerConfirmation =>
      'Sind Sie sicher, dass Sie den Server neu starten möchten?';

  @override
  String get adminShutdownServerConfirmation =>
      'Sind Sie sicher, dass Sie den Server herunterfahren möchten? Sie müssen es manuell neu starten.';

  @override
  String get internal => 'Intern';

  @override
  String get idle => 'Leerlauf';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Keine Benutzer gefunden';

  @override
  String get adminNoUsersMatchSearch =>
      'Keine Benutzer entsprechen Ihrer Suche';

  @override
  String get adminNoDevicesFound => 'Keine Geräte gefunden';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Kein Gerät entspricht den aktuellen Filtern';

  @override
  String get remoteAccess => 'Fernzugriff';

  @override
  String get localOnly => 'Nur lokal';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Die Medienanalyse konnte nicht geladen werden';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Kombinierte Analyse aller Medienbibliotheken.';

  @override
  String get analyticsTopArtists => 'Top-Künstler';

  @override
  String get analyticsTopAuthors => 'Top-Autoren';

  @override
  String get analyticsTopContributors => 'Top-Mitwirkende';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bibliotheken',
      one: '1 Bibliothek',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Für diese Auswahl sind noch keine indizierten Mediensummen verfügbar.';

  @override
  String get analyticsLibraryDetails => 'Details zur Bibliothek';

  @override
  String get analyticsLibraryBreakdown => 'Aufschlüsselung der Bibliothek';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Es sind keine Bibliotheken verfügbar.';

  @override
  String get analyticsLibraryShare => 'Anteil der Elemente nach Bibliothek';

  @override
  String get analyticsTopRating => 'Häufigste Altersfreigabe';

  @override
  String get analyticsTypicalRuntime => 'Typische Laufzeit';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent % der Elemente';
  }

  @override
  String get adminServerAdministrationTitle => 'Serveradministration';

  @override
  String get adminServerPathData => 'Daten';

  @override
  String get adminServerPathImageCache => 'Bildcache';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Protokolle';

  @override
  String get adminServerPathMetadata => 'Metadaten';

  @override
  String get adminServerPathTranscode => 'Transkodierungscache';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Von diesem Server wurden keine Serverpfade zurückgegeben.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% verwendet';
  }

  @override
  String get userActivity => 'Benutzeraktivität';

  @override
  String get systemEvents => 'Systemereignisse';

  @override
  String get needsAttention => 'Braucht Aufmerksamkeit';

  @override
  String get homeVideos => 'Heimvideos';

  @override
  String get mixedContent => 'Gemischter Inhalt';

  @override
  String get homeVideosAndPhotos => 'Heimvideos und Fotos';

  @override
  String get mixedMoviesAndShows => 'Gemischte Filme und Shows';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Keine Aufnahmen gefunden';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Keine Bildseiten im .$extension Archiv gefunden.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Eingebetteter Renderer fehlgeschlagen ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'EPUB-Renderer fehlgeschlagen ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Fehlende lokale Datei für Leser: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status beim Öffnen von Buchdaten von $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Kein lesbarer Buchendpunkt verfügbar';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Nicht unterstütztes Comic-Archivformat: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Das CBR-Extraktions-Plugin ist auf dieser Plattform nicht verfügbar.';

  @override
  String get failedToExtractCbrArchive =>
      'Das Extrahieren des .cbr-Archivs ist fehlgeschlagen.';

  @override
  String get cb7ExtractionUnavailable =>
      'Die CB7-Extraktion ist auf dieser Plattform nicht verfügbar.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Das CB7-Extraktions-Plugin ist auf dieser Plattform nicht verfügbar.';

  @override
  String get loadingShuffle => 'Zufallswiedergabe wird geladen...';

  @override
  String get libraryShuffleLabel => 'BIBLIOTHEK MISCHEN';

  @override
  String get randomShuffleLabel => 'ZUFÄLLIG MISCHEN';

  @override
  String get genresShuffleLabel => 'GENRES MISCHEN';

  @override
  String get autoHdrSwitching => 'Automatische HDR-Umschaltung';

  @override
  String get autoHdrSwitchingDescription =>
      'Aktivieren Sie HDR automatisch für die HDR-Videowiedergabe und stellen Sie den Anzeigemodus beim Beenden wieder her.';

  @override
  String get whenFullscreen => 'Im Vollbildmodus';

  @override
  String get changeArtwork => 'Bildmaterial ändern';

  @override
  String get missing => 'Fehlt';

  @override
  String get clearAllArtworkButton => 'Gesamtes Bildmaterial löschen?';

  @override
  String get clearAllArtworkWarning =>
      'Möchten Sie wirklich das gesamte heruntergeladene Bildmaterial löschen?';

  @override
  String get confirmClear => 'Löschen bestätigen';

  @override
  String confirmClearMessage(String itemType) {
    return 'Möchten Sie Folgendes wirklich löschen: $itemType?';
  }

  @override
  String get uploadButton => 'Hochladen?';

  @override
  String get resolutionLabel => 'Auflösung: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Nur Bildmaterial in der Oberflächensprache anzeigen';

  @override
  String get confirmClearAll => 'Alles löschen bestätigen';

  @override
  String get imageUploadSuccess => 'Bild erfolgreich hochgeladen!';

  @override
  String imageUploadFailed(String error) {
    return 'Bild konnte nicht hochgeladen werden: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Bild konnte nicht festgelegt werden: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Bild konnte nicht gelöscht werden: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Bildmaterial konnte nicht vollständig gelöscht werden: $error';
  }

  @override
  String get yes => 'Ja';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Hintergrundbilder';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Vorschaubild';

  @override
  String get artCategory => 'Artwork';

  @override
  String get discArtCategory => 'Disc-Artwork';

  @override
  String get screenshotCategory => 'Screenshot';

  @override
  String get boxCoverCategory => 'Box-Cover';

  @override
  String get boxRearCoverCategory => 'Box-Rückseite';

  @override
  String get menuArtCategory => 'Menü-Artwork';

  @override
  String get confirmItemPoster => 'Poster';

  @override
  String get confirmItemBackdrop => 'Hintergrundbild';

  @override
  String get confirmItemBanner => 'Banner';

  @override
  String get confirmItemLogo => 'Logo';

  @override
  String get confirmItemThumbnail => 'Vorschaubild';

  @override
  String get confirmItemArt => 'Artwork';

  @override
  String get confirmItemDiscArt => 'Disc-Artwork';

  @override
  String get confirmItemScreenshot => 'Screenshot';

  @override
  String get confirmItemBoxCover => 'Box-Cover';

  @override
  String get confirmItemBoxRearCover => 'Box-Rückseite';

  @override
  String get confirmItemMenuArt => 'Menü-Artwork';

  @override
  String get resolutionAll => 'Alle';

  @override
  String get resolutionHigh => 'Hoch (1080p+)';

  @override
  String get resolutionMedium => 'Mittel (720p)';

  @override
  String get resolutionLow => 'Niedrig (<720p)';

  @override
  String get sources => 'Quellen';

  @override
  String get audiobookChapters => 'Kapitel';

  @override
  String get audiobookBookmarks => 'Lesezeichen';

  @override
  String get audiobookNotes => 'Notizen';

  @override
  String get audiobookQueue => 'Warteschlange';

  @override
  String get audiobookTimeline => 'Zeitleiste';

  @override
  String get audiobookTimelineEmpty => 'Zeitleiste ist leer';

  @override
  String get audiobookFocusedTimeline => 'Fokussierte Zeitleiste';

  @override
  String get audiobookFullTimeline => 'Gesamte Zeitleiste';

  @override
  String get audiobookExportBookmarks => 'Lesezeichen exportieren';

  @override
  String get audiobookExportNotes => 'Notizen exportieren';

  @override
  String get audiobookExportAll => 'Alle exportieren';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exportiert nach $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export fehlgeschlagen: $error';
  }

  @override
  String get audiobookLyrics => 'Liedtext';

  @override
  String get audiobookAddBookmark => 'Lesezeichen hinzufügen';

  @override
  String get audiobookAddNote => 'Notiz hinzufügen';

  @override
  String get audiobookEditNote => 'Notiz bearbeiten';

  @override
  String get audiobookNoteHint => 'Notiz zu dieser Stelle schreiben';

  @override
  String get audiobookSleepTimer => 'Sleeptimer';

  @override
  String get audiobookSleepOff => 'Aus';

  @override
  String get audiobookSleepEndOfChapter => 'Kapitelende';

  @override
  String get audiobookSleepCustom => 'Benutzerdefiniert';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Noch $remaining';
  }

  @override
  String audiobookSleepMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Min.',
      one: '1 Min.',
    );
    return '$_temp0';
  }

  @override
  String get audiobookPlaybackSpeed => 'Wiedergabegeschwindigkeit';

  @override
  String get audiobookRemainingTime => 'Verbleibend';

  @override
  String get audiobookElapsedTime => 'Vergangen';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return '$seconds s zurück';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return '$seconds s vor';
  }

  @override
  String get audiobookPreviousChapter => 'Vorheriges Kapitel';

  @override
  String get audiobookNextChapter => 'Nächstes Kapitel';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Kapitel $current von $total';
  }

  @override
  String get audiobookNoChapters => 'Keine Kapitel';

  @override
  String get audiobookNoBookmarks => 'Noch keine Lesezeichen';

  @override
  String get audiobookNoNotes => 'Noch keine Notizen';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Lesezeichen bei $position hinzugefügt';
  }

  @override
  String get audiobookSpeedReset => 'Auf 1.0x zurücksetzen';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Speichern';

  @override
  String get audiobookCancel => 'Abbrechen';

  @override
  String get audiobookDelete => 'Löschen';

  @override
  String get subtitlePreferencesDescription =>
      'Untertitelmodi, Standardsprachen, Erscheinungsbild und Rendering-Optionen ändern.';

  @override
  String get subtitleRendering => 'Untertitel-Rendering';

  @override
  String get displayOptions => 'Anzeigeoptionen';

  @override
  String get releaseDateAscending => 'Veröffentlichungsdatum (aufsteigend)';

  @override
  String get releaseDateDescending => 'Veröffentlichungsdatum (absteigend)';

  @override
  String get groupContributions => 'Beiträge gruppieren';

  @override
  String get groupMultipleRoles => 'Mehrere Rollen gruppieren';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Warnung: Schreibzugriff auf Bibliothek';

  @override
  String get libraryWriteAccessHowToFix => 'So beheben Sie das Problem:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Erteilen Sie dem Jellyfin-Dienstbenutzer (z. B. jellyfin oder Docker PUID/PGID) Schreibrechte für die Ordner Ihrer Medienbibliothek auf dem Server.\n\n2. Oder öffnen Sie Ihr Jellyfin-Dashboard -> Bibliotheken, bearbeiten Sie diese Bibliothek und deaktivieren Sie „Bildmaterial in Medienordnern speichern“, um Bildmaterial in der internen Datenbank von Jellyfin abzulegen.';

  @override
  String get dismiss => 'Verwerfen';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Ihre Bibliothek „$libraryName“ ist so konfiguriert, dass Bildmaterial direkt in den Medienordnern gespeichert wird („Bildmaterial in Medienordnern speichern“ ist aktiviert). Jellyfin hat den Schreibzugriff getestet und hat keine Berechtigung, Dateien in dieses Verzeichnis zu schreiben:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Jellyfin konnte das Bildmaterial offenbar nicht aktualisieren. Ihre Bibliothek ist so konfiguriert, dass Bildmaterial direkt in den Medienordnern gespeichert wird („Bildmaterial in Medienordnern speichern“ ist aktiviert). Dieser Fehler tritt typischerweise auf, wenn der Jellyfin-Serverprozess keine Berechtigung hat, Dateien in Ihre Medienverzeichnisse zu schreiben.';

  @override
  String get replay => 'Erneut abspielen';

  @override
  String get fileInformation => 'Dateiinformationen';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Größe: $size  •  Format: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Hinzugefügt am: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Alle ($count) Audiospuren anzeigen';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Alle ($count) Untertitelspuren anzeigen';
  }

  @override
  String get checkingDirectPlay => 'Direct Play-Fähigkeit wird geprüft...';

  @override
  String get directPlayCapabilityLabel => 'Direct Play-Fähigkeit: ';

  @override
  String get forced => 'Erzwungen';

  @override
  String get transcodeContainerNotSupported =>
      'Das Containerformat wird vom Player nicht unterstützt.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Der Video-Codec wird nicht unterstützt.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Der Audio-Codec wird nicht unterstützt.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Das Untertitelformat wird nicht unterstützt (muss eingebrannt werden).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Das Audioprofil wird nicht unterstützt.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Das Videoprofil wird nicht unterstützt.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Das Video-Level wird nicht unterstützt.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Die Videoauflösung wird von diesem Gerät nicht unterstützt.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'Die Video-Bittiefe wird nicht unterstützt.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Die Video-Bildrate wird nicht unterstützt.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Die Dateibitrate überschreitet das Streaming-Limit des Players.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Die Videobitrate überschreitet das Streaming-Limit.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Die Audiobitrate überschreitet das Streaming-Limit.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Die Anzahl der Audiokanäle wird nicht unterstützt.';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Audio codec ($codec) wird nicht direkt unterstützt.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Tipp: Wenn dein AV-Receiver oder deine Soundbar $codec unterstützt, aktiviere Audio-Passthrough in den Audioeinstellungen.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Die Anzahl der Audiokanäle ($channels Kanäle) überschreitet das Limit des Players.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Tipp: Passe „Max. Audiokanäle“ oder das Mehrkanal-Downmixing in den Audioeinstellungen an.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'ASS/SSA-Untertitel müssen transkodiert werden, da direct play deaktiviert ist.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Tipp: Aktiviere „Direct Play für ASS/SSA“ in den Wiedergabeeinstellungen, um ohne Transkodierung direkt abzuspielen.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'PGS-Untertitel erfordern Transkodierung, weil Direct Play deaktiviert ist.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Tipp: Aktiviere „Direct Play für PGS“ in den Wiedergabeeinstellungen, um ohne Transkodierung direkt abzuspielen.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Das Untertitelformat ($codec) wird nicht direkt unterstützt und muss eingebrannt werden.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'Die Bitrate der Datei ($fileBitrate) überschreitet das eingestellte Streaming-Limit ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Tipp: Erhöhe „Maximale Bitrate“ in den Wiedergabeeinstellungen, um Direct Stream zu ermöglichen.';

  @override
  String get transcodeResolutionHint =>
      'Tipp: Erhöhe „Maximale Auflösung“ in den Wiedergabeeinstellungen, um Direct Stream zu ermöglichen.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Der Dynamikumfang des Videos (z. B. Dolby Vision / HDR) wird von diesem Display nicht unterstützt.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Direct Play der Enhancement-Layer von Dolby Vision Profil 7 ist deaktiviert.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Tipp: Aktiviere „Direct Play für Dolby Vision Profil 7“ in den Wiedergabeeinstellungen, wenn dein Display es unterstützt.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Laut Nutzereinstellungen wird für den Dolby-Vision-Fallback Transkodierung bevorzugt.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Tipp: Stelle „Dolby-Vision-Fallback“ in den Wiedergabeeinstellungen auf „Als HDR10 abspielen“, um Transkodierung zu vermeiden.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Das angeschlossene Display meldet keine Unterstützung für HDR oder Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Dem angeschlossenen Display fehlt die für den Dolby-Vision-Fallback nötige HDR10-Unterstützung.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Audio-Abtastrate wird nicht unterstützt';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Audio bit Tiefe wird nicht unterstützt.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Die Referenzframes des Videos überschreiten die Grenzen des Players.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Anamorphotische Videos werden nicht unterstützt.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Interlaced-Video wird nicht unterstützt.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Die zweite Audiospur erfordert Transkodierung.';

  @override
  String get transcodeDirectPlayError =>
      'Direct Play wird für dieses Medienformat nicht unterstützt.';

  @override
  String get sortServerOrder => 'Serverreihenfolge';

  @override
  String get sortAlphabetical => 'Alphabetisch';

  @override
  String get sortReleaseAscending => 'Erscheinungsreihenfolge (aufsteigend)';

  @override
  String get sortReleaseDescending => 'Erscheinungsreihenfolge (absteigend)';

  @override
  String get sortCustomDragDrop => 'Benutzerdefiniert (Drag-and-Drop)';

  @override
  String sortCurrent(String option) {
    return 'Sortierung: $option';
  }

  @override
  String get playlistSortOptions => 'Sortieroptionen für Wiedergabelisten';

  @override
  String get resetSort => 'Sortierung zurücksetzen';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'S$season:E$episode erneut ansehen';
  }

  @override
  String get rewatchPlaylist => 'Wiedergabeliste erneut ansehen';

  @override
  String get noSubtitlesFound => 'Keine Untertitel gefunden.';

  @override
  String get adminControls => 'Admin-Steuerung';

  @override
  String get impellerRendering => 'Rendering-Engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller ist Flutters moderner GPU-Renderer für flüssigere Animationen und weniger Ruckeln. Auf manchen TV-Boxen und älteren GPUs kann er Grafikfehler oder ein schwarzes Bild verursachen; schalten Sie ihn dann aus. „Automatisch“ wählt die beste Standardeinstellung für Ihr Gerät. Starten Sie Moonfin neu, um die Änderung anzuwenden.';

  @override
  String get impellerAuto => 'Automatisch';

  @override
  String get impellerOn => 'Ein';

  @override
  String get impellerOff => 'Aus';

  @override
  String get impellerRestartTitle => 'Neustart erforderlich';

  @override
  String get impellerRestartMessage =>
      'Moonfin muss neu gestartet werden, um die Rendering-Engine zu ändern. Schließen Sie die App jetzt und öffnen Sie sie erneut, um die Änderung anzuwenden.';

  @override
  String get impellerCloseNow => 'App jetzt schließen';

  @override
  String get adminRefreshLibrary => 'Bibliothek aktualisieren';

  @override
  String get adminRefreshAllLibraries => 'Alle Bibliotheken aktualisieren';

  @override
  String get adminRepoSortDateOldest => 'Hinzugefügt am (älteste zuerst)';

  @override
  String get adminRepoSortDateNewest => 'Hinzugefügt am (neueste zuerst)';

  @override
  String get adminRepoSortNameAsc => 'Alphabetisch (A bis Z)';

  @override
  String get adminRepoSortNameDesc => 'Alphabetisch (Z bis A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Server-Analysen werden geladen... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Wie Quelle';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Filme';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 Serien';

  @override
  String get imdbMostPopularMovies => 'IMDb Beliebteste Filme';

  @override
  String get imdbMostPopularTvShows => 'IMDb Beliebteste Serien';

  @override
  String get imdbLowestRatedMovies => 'IMDb Am schlechtesten bewertete Filme';

  @override
  String get imdbTopEnglishMovies => 'IMDb Bestbewertete englische Filme';

  @override
  String get addToWatchlist => 'Zur Merkliste hinzufügen';

  @override
  String get removeFromWatchlist => 'Aus Merkliste entfernen';

  @override
  String get watchlistUpdateFailed =>
      'Merkliste konnte nicht aktualisiert werden';

  @override
  String get adminSearchParameters => 'Suchkriterien';

  @override
  String get adminCurrentMetadata => 'Aktuelle Metadaten';

  @override
  String get adminLabelYear => 'Erscheinungsjahr';

  @override
  String get adminReplaceImages => 'Vorhandene Bilder ersetzen';

  @override
  String get adminBackToSearch => 'Zur Suche zurück';

  @override
  String get grouping => 'Gruppierungsoptionen';

  @override
  String get groupByType => 'Wiedergabelisten nach Medientyp gruppieren';

  @override
  String get playlistTypes => 'Wiedergabelistenkategorien filtern';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Musikvideo';

  @override
  String get playlistTypeAudio => 'Audio- und Musik';

  @override
  String get playlistTypeAudiobook => 'Hörbucher';

  @override
  String get playlistTypeBook => 'Bücher';

  @override
  String get playlistTypePhoto => 'Bilder';

  @override
  String get playlistTypeMixed => 'Gemischte Medien';

  @override
  String get videoPlaylistsSection => 'Videowiedergabelisten';

  @override
  String get musicVideoPlaylistsSection => 'Musikvideo-Playlists';

  @override
  String get audioPlaylistsSection => 'Audio- und Musikwiedergabelisten';

  @override
  String get audiobookPlaylistsSection => 'Hörbuch-Wiedergabelisten';

  @override
  String get bookPlaylistsSection => 'Buch-Wiedergabelisten';

  @override
  String get photoPlaylistsSection => 'Foto-Wiedergabelisten';

  @override
  String get mixedPlaylistsSection => 'Gemischte Wiedergabelisten';

  @override
  String get currentTime => 'Aktuelle Zeit';

  @override
  String get playbackTimeDisplay => 'Fortschrittsanzeige';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Legt fest, welche Zeitangabe am Fortschrittsbalken angezeigt wird.';

  @override
  String get playbackTimeTotal => 'Gesamtlaufzeit';

  @override
  String get playbackTimeRemaining => 'Verbleibende Wiedergabezeit';

  @override
  String get playbackTimeEndsAt => 'Wiedergabe endet um';

  @override
  String get playbackTimeElapsed => 'Wiedergabezeit';

  @override
  String get playbackTimeVideoSection => 'Videowiedergabe';

  @override
  String get playbackTimeMusicSection => 'Musikwiedergabe';

  @override
  String get playbackTimeSlotDescription =>
      'Festlegen was angezeigt oder versteckt werden soll.';

  @override
  String get playbackTimeAboveBarLeft =>
      'Zeitangabe links über dem Fortschrittsbalken';

  @override
  String get playbackTimeAboveBarCenter =>
      'Zeitangabe mittig über dem Fortschrittsbalken';

  @override
  String get playbackTimeAboveBarRight =>
      'Zeitangabe rechts über dem Fortschrittsbalken';

  @override
  String get playbackTimeBelowBarLeft =>
      'Zeitangabe links unter dem Fortschrittsbalken';

  @override
  String get playbackTimeBelowBarCenter =>
      'Zeitangabe mittig unter dem Fortschrittsbalken';

  @override
  String get playbackTimeBelowBarRight =>
      'Zeitangabe rechts unter dem Fortschrittsbalken';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Legt fest, welche Zeitangabe neben dem Fortschrittsbalken angezeigt wird.';

  @override
  String get groupByTitle => 'Gruppieren nach';

  @override
  String get groupByDecade => 'Jahrzehnt';

  @override
  String get groupByParentalRating => 'Altersfreigabe';

  @override
  String get groupByStudio => 'Filmstudio';

  @override
  String get showAlphabeticalFilters => 'Alphabetische Sortierung anzeigen';

  @override
  String get libraryFolderView => 'Ordneransicht';

  @override
  String get personalRatingStyle => 'Bewertungsstil';

  @override
  String get personalRatingThumbs => 'Gefällt mir / Gefällt mir nicht';

  @override
  String get personalRatingStars => '5 Sterne System';

  @override
  String get personalRatingNumeric => 'Numerische Bewertung von 1 bis 10';

  @override
  String get personalRatingIntervals => 'Rating Intervals';

  @override
  String get personalRatingIntervalWhole => 'Whole (1)';

  @override
  String get personalRatingIntervalHalf => 'Half (0.5)';

  @override
  String get personalRatingIntervalQuarter => 'Quarter (0.25)';

  @override
  String get rate => 'Bewertung abgeben';

  @override
  String get like => 'Gefällt mir';

  @override
  String get dislike => 'Gefällt mir nicht';

  @override
  String get personalRatingClear => 'Bewertung entfernen';

  @override
  String get personalRatingRated => 'Bewertet';

  @override
  String get personalRatingMine => 'Deine Bewertung';

  @override
  String get personalRatingSaveFailed =>
      'Bewertung konnte nicht gespeichert werden';

  @override
  String get increase => 'Bewertung erhöhen';

  @override
  String get decrease => 'Bewertung verringern';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'Begonnen, aber nicht abgeschlossen';

  @override
  String get filterUnreleased => 'Noch nicht ausgestrahlt';

  @override
  String get filterTrailers => 'Mit Trailer';

  @override
  String get filterExtras => 'Mit Extras';

  @override
  String get filterThemeSongs => 'Mit Titelsong';

  @override
  String get filterThemeVideos => 'Mit Themenvideo';

  @override
  String get source => 'Quelle';

  @override
  String get years => 'Jahre';

  @override
  String get audioLanguage => 'Audiosprachen';

  @override
  String get subtitleLanguage => 'Untertitelsprachen';

  @override
  String get clearFilters => 'Alle Filter zurücksetzen';

  @override
  String get seerrShortcutsRow => 'Seerr durchsuchen';

  @override
  String get seerrReleased => 'Veröffentlicht';

  @override
  String get seerrMinRating => 'Mindestbewertung auf TMDB';

  @override
  String get seerrMinVotes => 'Mindestanzahl der TMDB-Bewertungen';

  @override
  String get seerrOriginalLanguage => 'Originalsprache';

  @override
  String get seerrRuntime => 'Laufzeit';

  @override
  String get subtitleHdrSeparate => 'Separaten HDR-Stil verwenden';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'Weiß ist in HDR deutlich heller als in SDR. Ein gedämpfterer Stil verhindert daher störendes Blenden.';

  @override
  String get subtitleBold => 'Fettgedruckter Text';

  @override
  String get subtitleStrokeWidth => 'Breite der Textkontur';

  @override
  String get subtitleFont => 'Schriftart';

  @override
  String get subtitleFontDescription =>
      'Schriftarten werden beim ersten Auswählen von Google Fonts heruntergeladen';

  @override
  String subtitleFontDownloadFailed(String font) {
    return '$font konnte nicht heruntergeladen werden';
  }

  @override
  String get subtitleShadow => 'Textschatten';

  @override
  String get subtitleShadowIntensity => 'Schattenintensität';

  @override
  String get subtitleShadowOffset => 'Schattenversatz';

  @override
  String get subtitleShadowBlur => 'Schattenunschärfe';

  @override
  String get scrollSensitivity => 'Mausrad-Empfindlichkeit';

  @override
  String get scrollSensitivitySubtitle =>
      'Legt fest, wie weit ein Mausradschritt scrollt.';

  @override
  String get mediaDetailsAndSpoilers =>
      'Mediendetails und Spoilereinstellungen';

  @override
  String get openTrailersExternally => 'Trailer in externer App öffnen';

  @override
  String get openTrailersExternallySubtitle =>
      'Trailer werden in der YouTube-App oder im Browser statt im integrierten Player geöffnet.';

  @override
  String get hideDetailsMediaDescription =>
      'Medienbeschreibung auf der Detailseite ausblenden';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Blendet die Beschreibung des Films oder der Episode aus.';

  @override
  String get detailUseSeriesThumbnails =>
      'Serienvorschaubilder auf der Detailseite verwenden';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Alle Vorschaubilder auf der klassischen Detailseite durch das Serienvorschaubild ersetzen';

  @override
  String get hideHomeMediaDescription =>
      'Medienbeschreibung auf der Detailseite ausblenden';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Blendet die Beschreibung des Films oder der Episode auf der Startseite aus.';

  @override
  String get hideHomeWatchProgress => 'Wiedergabefortschritt ausblenden';

  @override
  String get hideHomeWatchProgressSubtitle =>
      'Den Fortschrittsbalken auf Postern ausblenden, die du angefangen hast.';

  @override
  String get hideHomeUnwatchedCount => 'Anzahl ungesehener Elemente ausblenden';

  @override
  String get hideHomeUnwatchedCountSubtitle =>
      'Das Abzeichen mit der Anzahl der noch nicht gesehenen Episoden ausblenden.';

  @override
  String get continueWatchingAndNextUpHeader =>
      'Weiterschauen und Als Nächstes';

  @override
  String get setupSkip => 'Einrichtung überspringen';

  @override
  String get setupNavbarQuestion =>
      'Wo soll sich die Navigationsleiste befinden?';

  @override
  String get setupMediaBarQuestion =>
      'Wie soll der obere Bereich Ihrer Startseite aussehen?';

  @override
  String get setupHomeRowsQuestion => 'Wie sollen Ihre Inhaltszeilen aussehen?';

  @override
  String get setupDetailQuestion =>
      'Wie sollen Filme und Serien beim Öffnen dargestellt werden?';

  @override
  String get setupTourQuestion =>
      'Alles eingerichtet – prima, jetzt kann’s losgehen!';

  @override
  String get setupPlaybackLanguages => 'Wiedergabesprachen';

  @override
  String get setupOptional => 'Optional';

  @override
  String get setupStyleClassic => 'Klassisches Darstellung';

  @override
  String get setupStyleModern => 'Moderne Darstellung';

  @override
  String get setupRowsClassicHint =>
      'Kompakte Darstellung mit mehr gleichzeitig sichtbaren Zeilen.';

  @override
  String get setupRowsModernHint => 'Größere Karten mit Titeln darunter.';

  @override
  String get setupRowsCarouselHint =>
      'Poster mit einem großen Detailbereich darunter.';

  @override
  String get setupDetailClassicHint =>
      'Alles zentriert in einer einzigen Spalte.';

  @override
  String get setupDetailModernHint =>
      'Großzügige Filmdarstellung mit Tabs für Besetzung und Extras.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      'Großes Titelbild zuerst, mit Pop-up-Karten für Besetzung und Extras.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Vollbild, mit untereinander angeordneten Bereichen statt Tabs.';

  @override
  String get setupStyleMinimalist => 'Minimalistisch';

  @override
  String get setupDetailMinimalistHint =>
      'Artwork, eine Wiedergabetaste und die Episoden.';

  @override
  String get setupStyleStage => 'Bühne';

  @override
  String get setupDetailStageHint =>
      'Das Poster im Vordergrund, darunter die Wiedergabe und daneben die Details.';

  @override
  String get setupStylePremiere => 'Premiere';

  @override
  String get setupDetailPremiereHint =>
      'Der Titel zentriert über einem bildschirmfüllenden Hintergrund, alles andere weiter unten auf der Seite.';

  @override
  String get setupStyleQuickLook => 'Schnellansicht';

  @override
  String get setupDetailQuickLookHint =>
      'Ein Fenster über dem aktuellen Bildschirm mit Wiedergabe und den wichtigsten Infos. Die vollständige Seite ist nur einen Klick entfernt.';

  @override
  String get setupStyleFrost => 'Frost';

  @override
  String get setupDetailFrostHint =>
      'Der Titel in einem Glasfenster über dem verschwommenen Artwork, mit Tabs unter den Tasten.';

  @override
  String get setupNavbarStyleQuestion => 'Wie soll die untere Leiste aussehen?';

  @override
  String get setupNavbarStyleDockHint =>
      'Eine schwebende Leiste mit Beschriftungen unter jedem Tab.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Die Suche bekommt eine eigene Taste, und die Leiste wird beim Scrollen kleiner.';

  @override
  String get setupNavbarStyleStripHint =>
      'Eine Leiste über die gesamte Breite am unteren Rand.';

  @override
  String get setupPickALook => 'Wähle ein Farbschema';

  @override
  String get setupTourMoreHeader => 'Weitere Optionen in den Einstellungen';

  @override
  String get setupTourBulletRequests => 'Medien über Seerr anfordern';

  @override
  String get setupTourBulletSyncPlay => 'Gemeinsam mit anderen schauen';

  @override
  String get setupTourBulletThemes => 'Benutzerdefinierte Designs';

  @override
  String get setupTourBulletDownloads => 'Offline-Wiedergabe';

  @override
  String get setupTourBulletMore => 'Und vieles mehr';

  @override
  String setupStepOf(int current, int total) {
    return 'Schritt $current von $total';
  }

  @override
  String get setupCurrent => 'Aktuell';

  @override
  String get setupMoonbaseTitle => 'Füge Moonbase zu deinem Server hinzu';

  @override
  String get setupMoonbaseHint =>
      'Ein kostenloses Server-Plugin, das mehr Funktionen von Moonfin freischaltet';

  @override
  String get setupMoonbaseIntro =>
      'Moonbase ist kostenlos und läuft auf deinem Server. Damit bekommt Moonfin:';

  @override
  String get setupMoonbaseAskAdmin =>
      'Nur ein Server-Admin kann es installieren. Schick ihm diesen Link.';

  @override
  String get setupMoonbaseManualSteps =>
      'Die Installation auf deinem Server erfordert ein paar Schritte. Du findest sie alle unter diesem Link.';

  @override
  String get setupMoonbaseInstalling => 'Moonbase wird installiert...';

  @override
  String get setupMoonbaseInstalled =>
      'Moonbase ist installiert. Es wird aktiv, sobald der Server neu startet. Dabei wird alles beendet, was gerade abgespielt wird.';

  @override
  String get setupMoonbaseRestarting =>
      'Der Server wird neu gestartet. Moonbase wird aktiv, sobald er wieder läuft.';

  @override
  String get moonbaseFeatureSync =>
      'Einstellungen werden zwischen deinen Geräten synchronisiert';

  @override
  String get moonbaseFeatureRatings =>
      'Zusätzliche Bewertungen und TMDB-Rezensionen';

  @override
  String get moonbaseFeatureRows => 'Eigene Zeilen aus deinen Lieblingslisten';

  @override
  String get moonbaseFeatureGames =>
      'Retro-Spiele mit synchronisierten Spielständen';

  @override
  String get moonbaseFeatureCalendar =>
      'Ein Kalender mit allem, was demnächst erscheint';

  @override
  String get moonbaseFeatureCollections =>
      'Deine eigene Reihenfolge für jede Sammlung';

  @override
  String get moonbaseFeatureMessages => 'Nachrichten von deinem Server-Admin';

  @override
  String setupMoonbaseInstallFailed(String error) {
    return 'Moonbase konnte nicht installiert werden. $error';
  }

  @override
  String get setupTvHint =>
      'Hoch und runter für Vorschau · OK zum Auswählen · Zweimal Zurück zum Überspringen';

  @override
  String get setupNavbarTopHint => 'Tabs am oberen Bildschirmrand.';

  @override
  String get setupNavbarLeftHint => 'Eine schmale Symbolleiste am linken Rand.';

  @override
  String get setupNavbarBottomHint =>
      'Tabs am unteren Rand, gut mit dem Daumen erreichbar.';

  @override
  String get setupMediaBarMoonfinHint =>
      'Großes Artwork mit Titel, Details und Beschreibung darüber.';

  @override
  String get setupMediaBarMakdHint =>
      'Großes Artwork mit einem großen Titellogo.';

  @override
  String get setupMediaBarBookshelfHint =>
      'Titel als Buchrücken im Regal, der hervorgehobene mit dem Cover nach vorne.';

  @override
  String get setupMediaBarGalleryHint =>
      'Der hervorgehobene Titel aufgeklappt, mit den nächsten daneben aufgereiht.';

  @override
  String get setupMediaBarBannerHint =>
      'Ein kleineres Banner über deinen Zeilen, damit mehr davon auf den Bildschirm passen.';

  @override
  String get setupMediaBarAyaHint =>
      'Artwork im Vordergrund in einem gerahmten Bereich, darunter direkt deine Zeilen.';

  @override
  String get setupMediaBarOffHint =>
      'Kein hervorgehobener Bereich. Die Startseite öffnet direkt mit deinen Zeilen.';

  @override
  String get runSetupAgain => 'Einrichtungsassistent erneut starten';

  @override
  String get serverMessages => 'Nachrichten vom Serveradministrator';

  @override
  String get serverMessagesEmpty => 'Keine Nachrichten vom Server';

  @override
  String get serverMessagesMarkAllRead => 'Alle als gelesen markieren';

  @override
  String get serverMessagesShowButton => 'Nachrichten-Schaltfläche anzeigen';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Fügt dem Menü eine Schaltfläche für Nachrichten vom Serveradministrator hinzu.';

  @override
  String get showBookDiscoverTab =>
      'Bücher entdecken in der Buchbibliothek anzeigen';

  @override
  String get showBookDiscoverTabDescription =>
      'Titel von Open Library und LibriVox in deinen Buch- und Hörbuchbibliotheken durchsuchen';

  @override
  String get bookFoldersAsSeries => 'Buchordner als Serien behandeln';

  @override
  String get bookFoldersAsSeriesDescription =>
      'Ordner mit Büchern als Serien behandeln, statt sich auf die Metadaten der einzelnen Bücher zu verlassen';

  @override
  String get autoDownloadNewEpisodes =>
      'Neue Episoden automatisch herunterladen';

  @override
  String get autoDownloadStop => 'Automatischen Download beenden';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Lädt neue Episoden herunter, höchstens $count ungesehene gleichzeitig',
      one: 'Lädt neue Episoden herunter, höchstens 1 ungesehene gleichzeitig',
      zero: 'Lädt jede neue Episode herunter',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'An • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Transkodierte Qualitäten werden nur heruntergeladen, solange Moonfin geöffnet ist. Originalqualität wird auch im Hintergrund heruntergeladen.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Transkodierte Downloads können nach einer Unterbrechung nicht fortgesetzt werden und beginnen von vorne. Originalqualität kann fortgesetzt werden.';

  @override
  String get autoDownloadForegroundOnly =>
      'Lädt nur herunter, solange Moonfin geöffnet ist';

  @override
  String get autoDownloadQualityTitle => 'Qualität für automatische Downloads';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Automatischer Download für $title aktiviert';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Automatischer Download für $title beendet';
  }

  @override
  String get smartDownloadsSection => 'Intelligente Downloads';

  @override
  String get smartDownloadsEnable => 'Nächste Episoden herunterladen';

  @override
  String get smartDownloadsEnableDescription =>
      'Wenn du auf einem beliebigen Gerät eine Episode beendest, lädt Moonfin die nächsten herunter. So heruntergeladene Episoden werden nach dem Ansehen gelöscht.';

  @override
  String get smartDownloadsKeepReady => 'Heruntergeladen zu haltende Episoden';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hält die nächsten $count Episoden heruntergeladen',
      one: 'Hält die nächste Episode heruntergeladen',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Bereits heruntergeladene Episoden bleiben auf deinem Gerät. Der neue Wert gilt für künftige Downloads.';

  @override
  String get autoDownloadSection => 'Automatische Downloads';

  @override
  String get autoDownloadEnable => 'Automatische Downloads aktivieren';

  @override
  String get autoDownloadEnableSubtitle =>
      'Lädt neue Episoden der Serien herunter, denen du folgst. Vorhandene Episoden können weiterhin manuell heruntergeladen werden.';

  @override
  String get autoDownloadKeepUnwatched => 'Ungesehene Episoden behalten';

  @override
  String get autoDownloadKeepAll => 'Alle';

  @override
  String get autoDownloadDelete => 'Heruntergeladene Episoden löschen';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'Wann Episoden von Serien, denen du folgst, nach dem Ansehen entfernt werden';

  @override
  String get removeWatchedDownloads => 'Gesehene Downloads entfernen';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'Wann Episoden und Filme, die du selbst heruntergeladen hast, entfernt werden. Es werden nur die entfernt, die du nach dem Aktivieren schaust';

  @override
  String get removeWatchedAsk => 'Nachfragen';

  @override
  String get deleteFinishedDownloadTitle => 'Diesen Download löschen?';

  @override
  String deleteFinishedDownloadMessage(String title) {
    return 'Du hast $title beendet. Lösche den Download, um Speicherplatz freizugeben, oder behalte ihn und werde nicht mehr gefragt.';
  }

  @override
  String get notNow => 'Nicht jetzt';

  @override
  String get keepDownloaded => 'Heruntergeladen behalten';

  @override
  String get keepDownloadedSubtitle =>
      'Nach dem Ansehen nie automatisch entfernen';

  @override
  String get autoDownloadDeleteNever => 'Nie';

  @override
  String get autoDownloadDeleteImmediately => 'Direkt nach dem Ansehen';

  @override
  String get autoDownloadDeleteAfterDay => '1 Tag nach dem Ansehen';

  @override
  String get autoDownloadDeleteAfterWeek => '1 Woche nach dem Ansehen';

  @override
  String get autoDownloadBackgroundRefresh => 'Im Hintergrund prüfen';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Dem System erlauben, regelmäßig nach neuen Episoden zu suchen, während Moonfin geschlossen ist';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Die Hintergrundaktualisierung ist für Moonfin deaktiviert. Aktiviere sie in den iOS-Einstellungen.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Die Hintergrundnutzung ist für Moonfin in den Android-Einstellungen eingeschränkt.';

  @override
  String get autoDownloadCheckNow => 'Jetzt prüfen';

  @override
  String get autoDownloadChecking => 'Wird geprüft…';

  @override
  String get autoDownloadNeverChecked => 'Noch nicht geprüft';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued Episoden eingereiht',
      one: '1 Episode eingereiht',
      zero: 'nichts Neues',
    );
    return 'Letzte Prüfung $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Letzte Prüfung $when fehlgeschlagen: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Gefolgte Serien';

  @override
  String get autoDownloadNoSubscriptions =>
      'Öffne eine Serie und wähle im Download-Menü „Neue Episoden automatisch herunterladen“';

  @override
  String get autoDownloadRemove => 'Nicht mehr folgen';

  @override
  String get autoDownloadStorageFull => 'Nicht genug Speicherplatz';

  @override
  String get autoDownloadWaitingForWifi => 'Warte auf WLAN';

  @override
  String get downloadNotificationRunning => 'Wird heruntergeladen';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Herunterladen ($done/$total)';
  }

  @override
  String downloadNotificationProgress(String name, int percent) {
    return '$name — $percent %';
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
      other: 'Downloads abgeschlossen',
      one: 'Download abgeschlossen',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name offline gespeichert';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente offline gespeichert',
      one: '1 Element offline gespeichert',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden',
      one: '1 Episode',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Download fehlgeschlagen';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Nachricht entfernen';

  @override
  String get serverMessagesNotificationReceived => 'Nachricht erhalten';

  @override
  String get downloadStorageLimitReached =>
      'Speicherlimit erreicht. Gib Speicherplatz frei oder erhöhe das Limit.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Nicht genug Speicherplatz: $needed benötigt, $free frei';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Nicht genug Speicherplatz für neue Episoden';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episoden warten auf Speicherplatz.',
      one: '$name benötigt $size.',
    );
    return '$_temp0 Gib Speicherplatz frei oder erhöhe das Download-Limit.';
  }

  @override
  String get pageTransitions => 'Seitenübergänge';

  @override
  String get pageTransitionsSubtitle =>
      'Passt die Überblendzeit beim Wechseln zwischen Seiten an';

  @override
  String get navigationSpeed => 'Navigationsgeschwindigkeit';

  @override
  String get navigationSpeedSubtitle =>
      'Legt fest, wie schnell sich die Fokusmarkierung zwischen Elementen und Zeilen bewegt';

  @override
  String get modernCardsTransitionSpeed =>
      'Übergangsgeschwindigkeit der modernen Karten';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Passt die Animationsgeschwindigkeit beim Erweitern fokussierter moderner Karten an';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Kartenvergrößerung bei schnellem Scrollen verzögern';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Wartet, bis die Fokusbewegung pausiert, bevor moderne Karten vergrößert werden';

  @override
  String get animationSpeedExtraSlow => 'Extra langsam';

  @override
  String get animationSpeedSlow => 'Langsam';

  @override
  String get animationSpeedMedium => 'Mittel';

  @override
  String get animationSpeedFast => 'Schnell';

  @override
  String get animationSpeedOff => 'Aus';

  @override
  String get pageTransitionFadeNone => 'Keine Überblendung';

  @override
  String get pageTransitionFadeShort => 'Kurze Überblendung';

  @override
  String get pageTransitionFadeMedium => 'Mittlere Überblendung';

  @override
  String get pageTransitionFadeLong => 'Lange Überblendung';

  @override
  String get siriRemoteSwipeSensitivity => 'Wischempfindlichkeit des Touchpads';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'Wie weit sich der Fokus bei jedem Wischen auf dem Touchpad der Siri Remote bewegt';

  @override
  String get appleTvHomeScreen => 'Apple-TV-Startbildschirm';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'Was der Apple-TV-Startbildschirm über dem Moonfin-Symbol anzeigt, wenn es ausgewählt ist. Diese Einstellung gilt nur für dieses Gerät.';

  @override
  String get topShelfLatestMedia => 'Neueste Medien';

  @override
  String get topShelfAppBanner => 'Moonfin-Banner';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Video von der Dynamic Island freihalten';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'Im Querformat verdeckt das Kameragehäuse einen Bildschirmrand. Diese Option hält das Bild davon fern, was sich nur bei Videos auswirkt, die breit genug sind, um so weit zu reichen.';

  @override
  String get bottomNavbarStyle => 'Stil der unteren Leiste';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Geteilt';

  @override
  String get bottomNavbarStyleStrip => 'Leiste';

  @override
  String get bottomNavbarTabs => 'Tabs der unteren Leiste';

  @override
  String get bottomNavbarTabsDescription =>
      'Hefte bis zu 3 Tabs zwischen „Startseite“ und „Du“ an. Alles andere findest du im Hub der unteren Leiste.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automatisch';

  @override
  String get bottomNavbarTabsPinned => 'Angeheftet';

  @override
  String get bottomNavbarTabsAvailable => 'Verfügbar';

  @override
  String get bottomNavbarTabsReset => 'Auf automatisch zurücksetzen';

  @override
  String get bottomNavbarTabsLimit =>
      'Du kannst bis zu 3 Tabs anheften. Entferne einen, um einen anderen anzuheften.';

  @override
  String get bottomNavbarTabTurnedOff => 'Unter „Tasten“ deaktiviert';

  @override
  String get bottomNavbarSplitSearchNote =>
      'Im Stil „Geteilt“ hat die Suche immer eine eigene Taste.';

  @override
  String get bottomNavbarButtonsNote =>
      'Diese legen fest, was im Hub der unteren Leiste angezeigt wird und welche Tabs du an die untere Leiste anheften kannst. Tabs, die bereits in der Leiste sind, werden hier nicht aufgeführt.';

  @override
  String get navYou => 'Du';

  @override
  String get cinemaSkipPrerolls => 'Überspringen-Taste im Kinomodus';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Während Trailern, Werbung und anderen Vorspännen im Kinomodus eine Überspringen-Taste anzeigen.';

  @override
  String get detailsPage => 'Detailseite';

  @override
  String get storageAndDownloads => 'Speicher & Downloads';

  @override
  String get integrations => 'Integrationen';

  @override
  String get settingsSync => 'Einstellungssynchronisation';

  @override
  String get settingsSyncSubtitle =>
      'Moonbase-Plugin-Synchronisierung und Anpassungsprofile';

  @override
  String get navigationBar => 'Navigationsleiste';

  @override
  String get homeRows => 'Zeilen';

  @override
  String get homeRowsSubtitle =>
      'Zeilen ein- oder ausblenden und ihre Reihenfolge ändern';

  @override
  String get rowOptions => 'Zeilenoptionen';

  @override
  String get rowOptionsSubtitle => 'Sortierung und Inhalte für jede Zeile';

  @override
  String get imageTypePerRow => 'Bildtyp pro Zeile';

  @override
  String get externalSources => 'Externe Quellen';

  @override
  String get qualityAndDecoding => 'Qualität & Dekodierung';

  @override
  String get qualityAndDecodingSubtitle =>
      'Bitrate, Auflösung, Dekodierung, HDR und Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Überspringen & Autoplay';

  @override
  String get advancedPlayback => 'Erweiterte Wiedergabe';

  @override
  String get advancedPlaybackSubtitle =>
      'Player-Auswahl, externe Player und mpv';

  @override
  String get settingsAccountSubtitle =>
      'Anmeldung, PIN-Code, Kindermodus, Jugendschutz und Einstellungssynchronisierung';

  @override
  String get settingsGeneralSubtitle =>
      'Sprache, Uhrzeit, Eingabe und Leistung';

  @override
  String get settingsAppearanceSubtitle =>
      'Navigation, Startseite, Bibliotheken, Detailseite und Themes';

  @override
  String get settingsHomeScreenSubtitle =>
      'Zeilen, Medienleiste, Aussehen und externe Quellen';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Sichtbarkeit und Reihenfolge der Bibliotheken sowie Bibliotheksseiten';

  @override
  String get settingsDetailsPageSubtitle =>
      'Layout, Tasten, Bereiche, Bewertungen und Titelmusik';

  @override
  String get settingsPlaybackSubtitle =>
      'Player, Qualität, Audio, Untertitel, Überspringen und Watch Partys';

  @override
  String get settingsStorageSubtitle => 'Downloads, Speicherort und Bildcache';

  @override
  String get settingsServicesSubtitle => 'Seerr und Achievement Badges';

  @override
  String get settingsSignInSection => 'Anmeldung';

  @override
  String get settingsFamilySection => 'Familie';

  @override
  String get settingsServersSection => 'Server';

  @override
  String get settingsLanguageSection => 'Sprache';

  @override
  String get settingsInputSection => 'Eingabe';

  @override
  String get settingsMotionSection => 'Bewegung';

  @override
  String get settingsContentsSection => 'Inhalt';

  @override
  String get settingsLooksSection => 'Aussehen';

  @override
  String get settingsAudioAndSubtitlesSection => 'Audio & Untertitel';

  @override
  String get settingsSkippingAndQueueSection => 'Überspringen & Warteschlange';

  @override
  String get settingsWatchTogetherSection => 'Watch Partys';

  @override
  String get settingsAdvancedSection => 'Fortschrittlich';

  @override
  String get settingsDecodingAndRenderingSection => 'Dekodierung & Rendering';

  @override
  String get settingsAudioStreamSection => 'Tonspur';

  @override
  String get settingsAudioOutputSection => 'Audioausgabe';

  @override
  String get settingsPassthroughSettingsSection => 'Passthrough-Einstellungen';

  @override
  String get settingsSeerrHomePageRowsSection =>
      'Seerr-Zeilen auf der Startseite';

  @override
  String get settingsSavedCustomHomeRowsSection =>
      'Gespeicherte eigene Startseitenzeilen';

  @override
  String get settingsRewatchSection => 'Noch einmal ansehen';

  @override
  String get favoritesSwitchViewSection => 'Ansicht wechseln';

  @override
  String get playerSettingsSubtitle =>
      'Steuerelemente, Spulen, Player-Tasten und Vorschaubilder beim Spulen';

  @override
  String get siloPasswordChangeTitle => 'Wähle ein neues Passwort';

  @override
  String get siloPasswordChangeMessage =>
      'Dieses Konto hat ein temporäres Passwort. Wähle ein neues, um die Anmeldung abzuschließen.';

  @override
  String get siloPasswordChangeNew => 'Neues Passwort';

  @override
  String get siloPasswordChangeConfirm => 'Neues Passwort bestätigen';

  @override
  String get siloPasswordChangeSubmit => 'Passwort ändern';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Verwende mindestens $count Zeichen',
      one: 'Verwende mindestens 1 Zeichen',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => 'Das Passwort ist zu lang';

  @override
  String get siloPasswordChangeMismatch =>
      'Die Passwörter stimmen nicht überein';

  @override
  String get siloPasswordChangeSameAsTemporary =>
      'Wähle ein neues Passwort, das sich vom temporären unterscheidet';

  @override
  String get siloPasswordChangeFailed =>
      'Das Passwort konnte nicht geändert werden. Versuche es erneut.';

  @override
  String get siloPasswordChangeUnavailable =>
      'Dieses Konto hat ein temporäres Passwort, und dieser Server erlaubt keine Änderung hier. Ändere es in der Web-App von Silo und melde dich dann erneut an.';

  @override
  String get siloPasswordChangedSignInAgain =>
      'Dein Passwort wurde geändert. Melde dich mit dem neuen Passwort an.';

  @override
  String get siloServerRowSubtitle => 'Von deinem Server';

  @override
  String get playlistSortReleaseDate => 'Veröffentlichungsdatum';

  @override
  String get playlistSortCriticRating => 'Kritikerbewertung';

  @override
  String get playlistSortRuntime => 'Laufzeit';

  @override
  String get playlistSortLastPlayed => 'Zuletzt gespielt';

  @override
  String get playlistSortPlayCount => 'Anzahl der Wiedergaben';

  @override
  String get playlistSortRandom => 'Zufällig';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktiv',
      one: '1 aktiv',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks =>
      'Keine Titel passen zu den aktiven Filtern';

  @override
  String get librarySortPlaylistOrder => 'Wiedergabeliste Reihenfolge';

  @override
  String get librarySortDateAdded => 'Hinzugefügt am';

  @override
  String get librarySortDateEpisodeAdded => 'Datum der Episoden-Hinzufügung';

  @override
  String get librarySortParentalRating => 'Altersfreigabe';

  @override
  String get librarySortMyRating => 'Deine Bewertung';

  @override
  String get librarySortAlbumArtist => 'Album Interpret';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Künstler';

  @override
  String get librarySortTrackNumber => 'Titelnummer';

  @override
  String get librarySortGenre => 'Genre';

  @override
  String get librarySortFoldersFirst => 'Ordner zuerst';

  @override
  String get librarySortLength => 'Länge';

  @override
  String get homeScreenBackdrop => 'Hintergrund der Startseite';

  @override
  String get homeScreenBackdropFullScreen => 'Vollbildvorschau';

  @override
  String get homeScreenBackdropCorner => 'Ecke';

  @override
  String get homeScreenBackdropTop => 'Oben';

  @override
  String get detailsScreenBackdrop => 'Hintergrund für den Detailbildschirm';

  @override
  String get detailsBackdropSize => 'Hintergrundgröße';

  @override
  String get detailsBackdropFullScreen => 'Vollbildvorschau';

  @override
  String get detailsBackdropFit => 'Einpassen';

  @override
  String get libraryBackdrops => 'Bibliothekshintergründe';

  @override
  String get playbackInfoChannel => 'Kanal';

  @override
  String get playbackInfoProgram => 'Sendung';

  @override
  String get playbackInfoWhy => 'Warum';

  @override
  String get playbackInfoServerCompatibilityCheck =>
      'Kompatibilitätsprüfung des Servers';

  @override
  String get playbackInfoBitrateUnavailable => 'Bitrate nicht verfügbar';

  @override
  String get playbackInfoQualityLimit => 'Qualitätslimit';

  @override
  String get playbackInfoFrameRate => 'Bildrate';

  @override
  String get playbackInfoDelivery => 'Lieferung';

  @override
  String get playbackInfoFile => 'Datei';

  @override
  String get playbackInfoTechnical => 'Technisch';

  @override
  String get playbackInfoDevice => 'Gerät';

  @override
  String get playbackInfoAudioRoute => 'Audioweg';

  @override
  String get playbackInfoSurround51 => '5.1-Surround';

  @override
  String get playbackInfoSurround71 => '7.1-Surround';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count Kanäle';
  }

  @override
  String get playbackInfoBurnedIn => 'Vom Server eingebrannt';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value (Original $original)';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value (konvertiert von $source)';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name ($size, konvertiert von $source)';
  }

  @override
  String get playbackInfoNoteDirectPlay =>
      'Die Originaldatei wird unverändert abgespielt.';

  @override
  String get playbackInfoNoteDirectStream =>
      'Der Server verpackt die Datei neu, ohne sie zu konvertieren.';

  @override
  String get playbackInfoNoteLiveRelay =>
      'Der Server leitet den Kanal weiter, ohne ihn zu konvertieren.';

  @override
  String playbackInfoFrameRateFrom(String rate, String source) {
    return '$rate fps ($source)';
  }

  @override
  String get playbackInfoRateSourceHeader => 'Stream-Header';

  @override
  String get playbackInfoRateSourceMeasured => 'gemessen';

  @override
  String get playbackInfoRateSourceServer => 'Server';

  @override
  String get playbackInfoServerFrameRate => 'Bildrate laut Server';

  @override
  String get playbackInfoScan => 'Abtastung';

  @override
  String get playbackInfoProgressive => 'Progressiv';

  @override
  String get playbackInfoInterlaced => 'Interlaced';

  @override
  String get playbackInfoRepeatedFields => 'Telecine (wiederholte Halbbilder)';

  @override
  String get playbackInfoHdmiOutput => 'HDMI-Ausgabe';

  @override
  String playbackInfoDisplayMode(String width, String height, String rate) {
    return '$width×$height @ $rate Hz';
  }

  @override
  String get playbackInfoRateCorrections => 'Ratenkorrekturen';

  @override
  String get playbackInfoAudioOutput => 'Ausgabe';

  @override
  String playbackInfoPassthroughOf(String codec) {
    return 'Passthrough ($codec)';
  }

  @override
  String playbackInfoDecodedTo(String channels) {
    return 'Dekodiert ($channels)';
  }

  @override
  String get playbackInfoNoteTranscodeVideo =>
      'Der Server konvertiert das Video, damit dieses Gerät es abspielen kann.';

  @override
  String get playbackInfoNoteTranscodeAudio =>
      'Der Server konvertiert das Audio, damit dieses Gerät es abspielen kann.';

  @override
  String get playbackInfoNoteTranscodeBoth =>
      'Der Server konvertiert Video und Audio, damit dieses Gerät es abspielen kann.';

  @override
  String get playbackInfoNoteTranscodeUnknown =>
      'Der Server konvertiert diese Datei, damit dieses Gerät sie abspielen kann.';

  @override
  String get playbackInfoNoteOffline =>
      'Eine heruntergeladene Kopie wird abgespielt.';

  @override
  String get playbackInfoWhyForced =>
      'Transkodierung ist in den Einstellungen erzwungen';

  @override
  String get playbackInfoWhyBitrate =>
      'Die Bitrate liegt über dem Streaming-Limit';

  @override
  String get playbackInfoWhyContainer =>
      'Dieses Gerät kann diesen Dateityp nicht abspielen';

  @override
  String get playbackInfoWhyVideo =>
      'Dieses Gerät kann dieses Videoformat nicht abspielen';

  @override
  String get playbackInfoWhyHdr =>
      'Dieses Gerät kann dieses HDR-Format nicht anzeigen';

  @override
  String get playbackInfoWhyAudio =>
      'Dieses Gerät kann dieses Audioformat nicht abspielen';

  @override
  String get playbackInfoWhySubtitles =>
      'Untertitel werden ins Video eingebrannt';

  @override
  String get playbackInfoWhyOther =>
      'Die Datei konnte nicht direkt abgespielt werden';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate liegt über dem Streaming-Limit von $limit';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return 'Dieses Gerät kann keine $container-Dateien öffnen';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return 'Dieses Gerät kann kein $codec-Video abspielen';
  }

  @override
  String playbackInfoWhyVideoProfileUnknown(String codec) {
    return 'Der Server konnte das $codec-Profil dieses Streams nicht überprüfen.';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return 'Dieses Gerät kann kein $codec-$profile-Video abspielen';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return 'Dieses Gerät kann kein $codec-Video mit Level $level abspielen';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return 'Dieses Gerät kann kein $bits-Bit-Video abspielen';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return 'Dieses Gerät kann kein $resolution-Video abspielen';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return 'Dieses Gerät kann kein Video mit $fps fps abspielen';
  }

  @override
  String get playbackInfoWhyInterlaced =>
      'Dieses Gerät kann kein Interlaced-Video abspielen';

  @override
  String get playbackInfoWhyAnamorphic =>
      'Dieses Gerät kann kein anamorphes Video abspielen';

  @override
  String playbackInfoWhyHdrName(String range) {
    return 'Dieses Gerät kann $range nicht anzeigen';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return 'Dieses Gerät kann kein $format-Audio abspielen';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return 'Dieses Gerät kann $fullFormat nicht abspielen';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return 'Dieses Gerät kann kein $channels-Audio abspielen';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return 'Dieses Gerät kann kein Audio mit $rate kHz abspielen';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return 'Dieses Gerät kann kein $bits-Bit-Audio abspielen';
  }

  @override
  String get playbackInfoWhyAudioExternal =>
      'Die Audiospur liegt in einer separaten Datei';

  @override
  String get playbackInfoWhySecondaryAudio =>
      'Dieses Gerät kann nur die erste Audiospur abspielen';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return '$format-Untertitel werden ins Video eingebrannt';
  }

  @override
  String get playbackInfoDroppedFrames => 'Verlorene Frames';

  @override
  String get playFromServer => 'Vom Server abspielen';

  @override
  String get settingsApplePlayerUi => 'Video Player';

  @override
  String get settingsApplePlayerUiDescription =>
      'Der native Player im Apple-Stil hat keine Cast-, Audioverzögerungs- oder Bild-in-Bild-Taste, und seine Drehsperre gibt es nur bei Live-TV';

  @override
  String get settingsApplePlayerUiStandard => 'Standard';

  @override
  String get settingsApplePlayerUiNative => 'Nativ im Apple-Stil';

  @override
  String get playerTransportPosition => 'Wiedergabetasten';

  @override
  String get playerTransportPositionDescription =>
      'Abspielen, Überspringen und Spulen in der Mitte des Videos oder in der unteren Leiste anzeigen';

  @override
  String get playerTransportOnScreen => 'Auf dem Bild';

  @override
  String get playerTransportDocked => 'Angedockt';

  @override
  String get incompleteRecording => 'Unvollständig';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '$recorded von $expected Min.';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return 'Vollständige Ausstrahlung geplant am $dateTime';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return 'Vollständige Kopie aufgenommen am $dateTime';
  }

  @override
  String get noCompleteShowingFound =>
      'Keine vollständige Ausstrahlung gefunden';

  @override
  String get keepAsComplete => 'Als vollständig behalten';

  @override
  String get keptAsComplete => 'Als abgeschlossen markiert';

  @override
  String get unableToKeepAsComplete =>
      'Konnte nicht als abgeschlossen markiert werden';

  @override
  String recordPromptTitle(String name) {
    return '$name aufnehmen';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Diese Ausstrahlung hat vor $minutes Minuten begonnen, daher fehlt der Aufnahme der Anfang.',
      one: 'Diese Ausstrahlung hat vor 1 Minute begonnen, daher fehlt der Aufnahme der Anfang.',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater =>
      'Auch die spätere Ausstrahlung aufnehmen, um eine vollständige Aufnahme zu erhalten?';

  @override
  String get recordPromptSearchLater =>
      'Zusätzlich eine spätere Ausstrahlung automatisch aufnehmen, sobald eine gefunden wird, um eine vollständige Aufnahme zu erhalten?';

  @override
  String get recordPromptNow => 'Jetzt';

  @override
  String get recordPromptLater => 'Spätere Ausstrahlung';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes Min. bereits gelaufen',
      one: '1 Min. bereits gelaufen',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch =>
      'Nur anhand von Titel und Beschreibung zugeordnet. Prüfe, ob es dieselbe Sendung ist.';

  @override
  String get recordPromptDescriptionsDiffer =>
      'Die Beschreibungen unterscheiden sich, daher ist es möglicherweise eine andere Sendung.';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return 'Gleiche Episode (S${season}E$episode)';
  }

  @override
  String get recordPromptAlreadyScheduled => 'Aufnahme bereits geplant';

  @override
  String get recordPromptTomorrow => 'Morgen';

  @override
  String get recordNowOnly => 'Nur jetzt aufnehmen';

  @override
  String recordNowAnd(String when) {
    return 'Jetzt und $when aufnehmen';
  }

  @override
  String get recordNowAndLater => 'Jetzt und spätere Ausstrahlung aufnehmen';

  @override
  String recordOnlyLater(String when) {
    return 'Nur $when aufnehmen';
  }

  @override
  String get recordLaterShowingOnly => 'Nur spätere Ausstrahlung aufnehmen';

  @override
  String get laterShowingOnlyRequested =>
      'Die spätere Ausstrahlung wird aufgenommen.';

  @override
  String get unableToRequestLaterShowingOnly =>
      'Die spätere Ausstrahlung konnte nicht geplant werden. Es wird nichts aufgenommen.';

  @override
  String get laterShowingRequested =>
      'Aufnahme gestartet. Eine spätere Ausstrahlung wird ebenfalls aufgenommen.';

  @override
  String get unableToRequestLaterShowing =>
      'Aufnahme gestartet, aber die spätere Ausstrahlung konnte nicht angefordert werden.';

  @override
  String get siloCodeSignIn => 'Mit Code anmelden';

  @override
  String siloCodeSignInInstruction(String address) {
    return 'Scanne den QR-Code mit deinem Handy oder öffne $address auf einem angemeldeten Gerät und gib diesen Code ein:';
  }

  @override
  String get siloCodeSignInInstructionNoLink =>
      'Gib diesen Code in Silo auf einem Gerät ein, auf dem du angemeldet bist:';

  @override
  String get siloCodeSignInOpened =>
      'Code gefunden. Bestätige die Anmeldung auf deinem anderen Gerät.';

  @override
  String get siloCodeSignInDenied => 'Diese Anmeldung wurde abgelehnt.';

  @override
  String get siloCodeSignInNewCode => 'Neuen Code anfordern';

  @override
  String get siloCodeSignInOff =>
      'Die Anmeldung mit Code ist auf diesem Server deaktiviert.';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      'Dieses Konto hat ein temporäres Passwort. Melde dich einmal mit dem Passwort an, um es zu ersetzen.';

  @override
  String get siloApproveSignIn => 'Anmeldung bestätigen';

  @override
  String get siloApproveSignInHint => 'Auf dem anderen Gerät angezeigter Code';

  @override
  String get siloApproveSignInApprove => 'Genehmigen';

  @override
  String get siloApproveSignInDone =>
      'Bestätigt. Das andere Gerät wird angemeldet.';

  @override
  String get siloApproveSignInNoRequest =>
      'Mit diesem Code wartet keine Anmeldung. Überprüfe ihn oder fordere auf dem anderen Gerät einen neuen Code an.';

  @override
  String get siloNativeOfferTitle => 'Direkt mit Silo verbinden?';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return 'Diese Adresse ist der Jellyfin-kompatible Dienst von $serverName. Moonfin kann sich unter $address direkt mit Silo verbinden, mit den eigenen Funktionen von Silo.';
  }

  @override
  String get siloNativeOfferUse => 'Silo verwenden';

  @override
  String get siloNativeOfferKeep => 'Jellyfin beibehalten';

  @override
  String get siloAppUpdateRequired =>
      'Dieser Silo-Server benötigt eine neuere Version von Moonfin. Aktualisiere Moonfin, um ihn zu verwenden.';

  @override
  String get siloServerUpdateRequired =>
      'Dieser Silo-Server ist für diese Version von Moonfin zu alt. Aktualisiere Silo, um ihn zu verwenden.';

  @override
  String get siloTooManyAttempts =>
      'Zu viele Versuche. Versuche es später erneut.';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return 'Zu viele Versuche. Versuche es in $wait erneut.';
  }

  @override
  String get siloServerBusy =>
      'Der Server ist ausgelastet oder startet noch. Versuche es später erneut.';

  @override
  String siloServerBusyWait(String wait) {
    return 'Der Server ist ausgelastet oder startet noch. Versuche es in $wait erneut.';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sekunden',
      one: '1 Sekunde',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Minuten',
      one: '1 Minute',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable =>
      'Auf diesem Silo-Server ist keine Wiedergabe verfügbar.';

  @override
  String get siloPlaybackUpdateRequired =>
      'Dieser Silo-Server benötigt eine neuere Version von Moonfin für die Wiedergabe.';

  @override
  String get siloPlaybackEndedOnServer =>
      'Die Wiedergabe wurde auf dem Silo-Server beendet.';

  @override
  String get siloPlaybackStoppedOnServer =>
      'Playback was stopped on the Silo server.';

  @override
  String siloPinTitle(String name) {
    return 'PIN für $name';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => 'Freischalten';

  @override
  String get siloPinRemember => 'PIN auf diesem Gerät merken';

  @override
  String get siloPinWrong => 'Diese PIN ist nicht richtig.';

  @override
  String get siloPinLocked =>
      'Zu viele falsche PINs. Versuche es später erneut.';

  @override
  String siloPinLockedWait(String wait) {
    return 'Zu viele falsche PINs. Versuche es in $wait erneut.';
  }

  @override
  String get siloPinFailed =>
      'Die PIN konnte nicht geprüft werden. Versuche es erneut.';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Trailer',
      one: '1 Trailer',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return 'Trailer $number';
  }

  @override
  String get subtitled => 'Mit Untertiteln';

  @override
  String get rommAccount => 'RomM-Konto';

  @override
  String get rommAccountIntro =>
      'Verknüpfe dein RomM-Konto, um aus deiner eigenen RomM-Bibliothek zu spielen und deine Spielstände in RomM zu behalten.';

  @override
  String get rommLinkAccount => 'RomM-Konto verknüpfen';

  @override
  String get rommLinkInstructions =>
      'Melde dich bei RomM an und gib diesen Code ein, um dein Konto zu verknüpfen.';

  @override
  String rommLinkScanOrVisit(String url) {
    return 'Scanne den QR-Code mit deinem Handy oder öffne $url';
  }

  @override
  String get rommOpen => 'RomM öffnen';

  @override
  String get rommWaitingForApproval =>
      'Warte darauf, dass du den Code in RomM bestätigst...';

  @override
  String rommLinkedAs(String username) {
    return 'Verknüpft als $username';
  }

  @override
  String get rommLinked => 'Dein RomM-Konto ist verknüpft.';

  @override
  String get rommUnlinkNote =>
      'Nach dem Aufheben der Verknüpfung verwendet Moonfin deinen RomM-Schlüssel nicht mehr. Der Schlüssel bleibt in RomM, bis du ihn dort aus deinen API-Tokens entfernst.';

  @override
  String get rommUnlink => 'Verknüpfung aufheben';

  @override
  String get rommLinkExpired =>
      'Der Code ist abgelaufen, bevor er bestätigt wurde. Verknüpfe erneut, um einen neuen zu erhalten.';

  @override
  String get rommLinkDenied => 'Die Verknüpfung wurde in RomM abgelehnt.';

  @override
  String get rommUnreachable =>
      'Moonfin konnte RomM nicht erreichen. Versuche es gleich noch einmal.';

  @override
  String get rommNotAvailable => 'Dieser Server hat keine RomM-Bibliothek.';

  @override
  String get rommAccountLoadFailed =>
      'Dein RomM-Konto konnte nicht geladen werden.';

  @override
  String get reviews => 'Rezensionen';

  @override
  String get detailSectionReviews => 'Rezensionen';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Rezensionen',
      one: '1 Rezension',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => 'Auf TMDB lesen';

  @override
  String get addServerButtonSubtitle =>
      'Über eine Adresse oder ein Plex- bzw. Emby-Connect-Konto';

  @override
  String get addServerChooseHow => 'Wähle aus, wie du dich verbinden möchtest';

  @override
  String get addServerAddressChoice =>
      'Jellyfin, Emby oder Silo im lokalen Netzwerk oder über das Internet';

  @override
  String get addServerPlexChoice => 'Mit deinem Plex-Konto nach Servern suchen';

  @override
  String get addServerAddressHelp =>
      'Dieselbe Adresse wie im Browser, inklusive Port';

  @override
  String get addServerDetectNote =>
      'Funktioniert mit Jellyfin, Emby und Silo. Eine Plex-Adresse öffnet die Plex-Anmeldung.';

  @override
  String addServerChecking(String address) {
    return '$address wird geprüft';
  }

  @override
  String get addServerUnreachableDetail =>
      'Überprüfe Adresse und Port und ob der Server läuft.';

  @override
  String get addServerFound => 'Server gefunden';

  @override
  String get addServerFoundNote =>
      'Fahre fort, um auszuwählen, wer sich anmeldet.';

  @override
  String get addServerUseDifferentAddress => 'Andere Adresse verwenden';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Künstler',
      one: '1 Künstler',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Titel',
      one: '1 Titel',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Playlists',
      one: '1 Playlist',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-mal abgespielt',
      one: '1-mal abgespielt',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => 'Alle Künstler';

  @override
  String get libraryZToA => 'Z bis A';

  @override
  String get musicSortYear => 'Erscheinungsjahr';

  @override
  String get musicFilter => 'Filter';

  @override
  String get musicGenreFilterTitle => 'Nach Genre filtern';

  @override
  String get openAlbum => 'Album öffnen';

  @override
  String get openPlaylist => 'Playlist öffnen';

  @override
  String get allSongsAToZ => 'Alle Titel von A bis Z';

  @override
  String get musicMix => 'Mix';

  @override
  String get musicMixEverything => 'Alles';

  @override
  String get musicMixEverythingSubtitle => '300 zufällige Titel';

  @override
  String get mostPlayed => 'Meistgespielt';

  @override
  String get musicMixMostPlayedSubtitle => 'Deine Top 100';

  @override
  String get musicMixFreshArrivals => 'Neuzugänge';

  @override
  String get musicMixFreshArrivalsSubtitle => 'Die neuesten 100 Titel';

  @override
  String get musicMixRediscover => 'Wiederentdecken';

  @override
  String get musicMixRediscoverSubtitle =>
      'Favoriten, die du länger nicht abgespielt hast';

  @override
  String get musicSortMostAlbums => 'Meiste Alben';

  @override
  String bookSeriesPosition(int index, int total) {
    return 'Buch $index von $total';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Favoriten',
      one: '1 Favorit',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Z bis A';

  @override
  String get bookSortMostTitles => 'Meiste Titel';

  @override
  String get bookSurpriseMe => 'Überrasch mich';

  @override
  String get bookShuffleAudiobooks => 'Hörbücher zufällig wiedergeben';

  @override
  String get bookStartReading => 'Lesen beginnen';

  @override
  String get bookOtherBooks => 'Weitere Bücher';

  @override
  String get bookDiscoverSearchBooks => 'Open Library durchsuchen';

  @override
  String get bookDiscoverSearchAudiobooks => 'LibriVox durchsuchen';

  @override
  String get bookDiscoverFeatured => 'Hervorgehoben';

  @override
  String get bookReaderControlsAutoHide =>
      'Steuerelemente werden automatisch ausgeblendet';

  @override
  String get bookReaderControlsStayVisible => 'Steuerelemente bleiben sichtbar';

  @override
  String get settingsLivePreview => 'Live-Vorschau';

  @override
  String settingsPreviewShowsOn(String screen) {
    return 'Wirkt sich auf die Vorschau „$screen“ aus';
  }

  @override
  String get settingsPreviewNotShown => 'In der Vorschau nicht sichtbar';

  @override
  String settingsPreviewAudioRowsOffInHomeRows(String group, String disabled) {
    return 'Alben, Künstler und Audio-Playlists sind alle deaktiviert. Um eines davon anzuzeigen, öffne unter „Zeilen“ die Gruppe $group bei $disabled und aktiviere es.';
  }

  @override
  String settingsPreviewAudioRowsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return 'Um Alben, Künstler oder Audio-Playlists auf der Startseite zu sehen, aktiviere zuerst $setting. Öffne dann unter „Zeilen“ die Gruppe $group bei $disabled und aktiviere eine davon.';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRows(
    String group,
    String disabled,
  ) {
    return 'Die Sammlungszeile ist deaktiviert. Um sie anzuzeigen, öffne unter „Zeilen“ die Gruppe $group bei $disabled und aktiviere sie.';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return 'Um die Sammlungszeile auf der Startseite zu sehen, aktiviere zuerst $setting. Öffne dann unter „Zeilen“ die Gruppe $group bei $disabled und aktiviere sie.';
  }

  @override
  String get settingsPreviewRowsOffInKidsMode =>
      'Im Kindermodus werden diese Zeilen nicht auf der Startseite angezeigt. Diese Einstellungen ändern daran nichts.';

  @override
  String settingsPreviewNeedsRowInRows(String disabled) {
    return 'Aktiviere eine Zeile unter „Zeilen“ bei $disabled';
  }

  @override
  String settingsPreviewNeedsSwitchAndRow(String setting) {
    return 'Aktiviere $setting und danach eine Zeile unter „Zeilen“';
  }

  @override
  String get settingsPreviewKeptOffByKidsMode =>
      'Im Kindermodus wird dies nicht auf der Startseite angezeigt';

  @override
  String get settingsPreviewAudioRowsEmpty =>
      'Es gibt keine Musik, daher blendet die Startseite diese Zeilen aus.';

  @override
  String get settingsPreviewRowsEmpty =>
      'In diesen Zeilen gibt es nichts anzuzeigen, daher blendet die Startseite sie aus.';

  @override
  String get settingsPreviewCollectionsEmpty =>
      'Es gibt keine Sammlungen, daher blendet die Startseite diese Zeile aus.';

  @override
  String get settingsPreviewShowEpisodesNote =>
      'Das ändert nur Zeilen für einzelne Sammlungen, die unter „Zeilen“ hinzugefügt wurden. Die Sammlungszeile bleibt gleich.';

  @override
  String get settingsPreviewSaved => 'Gespeichert';

  @override
  String get smartSearch => 'Intelligente Suche';

  @override
  String smartSearchOnSeerr(String seerr) {
    return 'Intelligente Suche auf $seerr';
  }

  @override
  String get calendar => 'Kalender';

  @override
  String get showCalendarButton => 'Kalender-Taste anzeigen';

  @override
  String get showCalendarButtonSubtitle =>
      'Den Kalender mit kommenden Episoden und Filmen in der Navigationsleiste anzeigen';

  @override
  String get calendarFullCalendar => 'Ganzer Kalender';

  @override
  String get calendarUpcoming => 'Demnächst';

  @override
  String get calendarRecentlyAired => 'Kürzlich ausgestrahlt';

  @override
  String get calendarRemindMe => 'Erinnern';

  @override
  String get calendarReminderSet => 'Erinnerung gesetzt';

  @override
  String get calendarReminderFailed =>
      'Die Erinnerung konnte nicht gespeichert werden';

  @override
  String get calendarReadyToWatch => 'Bereit zum Ansehen';

  @override
  String get calendarComingUpThisWeek => 'Kommt diese Woche';

  @override
  String get calendarNothingUpcoming => 'Nichts in Sicht';

  @override
  String get calendarNothingRecent => 'In letzter Zeit nichts ausgestrahlt';

  @override
  String get calendarEmptyDay => 'An diesem Tag nichts';

  @override
  String get calendarStartsIn => 'Beginnt in';

  @override
  String get calendarUnitDays => 'Tage';

  @override
  String get calendarUnitHours => 'Std.';

  @override
  String get calendarUnitMinutes => 'min';

  @override
  String calendarDayAtTime(String day, String time) {
    return '$day um $time';
  }

  @override
  String get calendarAllDay => 'Ganztägig';

  @override
  String get calendarBadgeSeriesPremiere => 'Serienpremiere';

  @override
  String get calendarBadgeSeasonPremiere => 'Neue Staffel';

  @override
  String get calendarBadgeSeasonFinale => 'Finale';

  @override
  String get calendarBadgeMidseasonFinale => 'Midseason-Finale';

  @override
  String get calendarBadgeSeriesFinale => 'Serienfinale';

  @override
  String get calendarBadgeNew => 'NEU';

  @override
  String get calendarStatusInLibrary => 'In der Bibliothek';

  @override
  String get calendarNotMonitored => 'Nicht überwacht';

  @override
  String get calendarMovieDetails => 'Filmdetails';

  @override
  String get calendarProblemAdminsOnly =>
      'Der Kalender ist auf diesem Server nur für Admins verfügbar.';

  @override
  String get calendarProblemNeedsSeerr =>
      'Ein Administrator muss sich in Moonfin bei Seerr anmelden, bevor der Kalender geladen werden kann.';

  @override
  String get calendarProblemNotConfigured =>
      'Es ist noch kein Sonarr- oder Radarr-Server verknüpft.';

  @override
  String get calendarProblemFailed =>
      'Der Kalender konnte nicht geladen werden.';

  @override
  String get calendarSettingsSubtitle =>
      'Stil, Filter und Aktionen für den Kalender';

  @override
  String get calendarSettingsView => 'Ansicht';

  @override
  String get calendarSettingsStyle => 'Kalenderstil';

  @override
  String get calendarSettingsStyleDescription =>
      'Was die Kalender-Taste öffnet. Der ganze Monat ist in beiden Fällen nur einen Tastendruck entfernt.';

  @override
  String get calendarSettingsStyleAgenda => 'Terminliste';

  @override
  String get calendarSettingsStyleCountdown => 'Countdown';

  @override
  String get calendarSettingsWeekStart => 'Woche beginnt am';

  @override
  String get calendarSettingsWhatShows => 'Was angezeigt wird';

  @override
  String get calendarSettingsScope => 'Anzeigen';

  @override
  String get calendarSettingsScopeDescription =>
      '„Meine Serien“ enthält die Serien, die du favorisiert oder begonnen hast';

  @override
  String get calendarSettingsScopeEverything => 'Alles';

  @override
  String get calendarSettingsScopeMyShows => 'Meine Serien';

  @override
  String get calendarSettingsUnmonitored => 'Nicht überwachte einbeziehen';

  @override
  String get calendarSettingsUnmonitoredSubtitle =>
      'Auch Folgen und Filme anzeigen, die Sonarr und Radarr nicht herunterladen sollen';

  @override
  String get calendarSettingsSpecials => 'Sonderangebote';

  @override
  String get calendarSettingsSpecialsSubtitle =>
      'Episoden der Staffel 0, z. B. Extras und Feiertags-Specials';

  @override
  String get calendarSettingsBadges => 'Premieren- und Finale-Markierungen';

  @override
  String get calendarSettingsBadgesSubtitle =>
      'Premieren, Finale und neue Staffeln markieren';

  @override
  String get calendarSettingsColorBy => 'Einfärben nach';

  @override
  String get calendarSettingsColorByDescription =>
      '„Typ“ unterscheidet Episoden von Filmen. „Status“ zeigt, was in deiner Bibliothek ist, demnächst kommt oder fehlt.';

  @override
  String get calendarSettingsColorByType => 'Typ';

  @override
  String get calendarSettingsImageType => 'Kartenbild';

  @override
  String get calendarSettingsImageTypeDescription =>
      'Das Artwork in den Countdown-Zeilen';

  @override
  String get calendarSettingsSpoilerSafe => 'Spoilerfrei';

  @override
  String get calendarSettingsSpoilerSafeSubtitle =>
      'Episodentitel und Vorschaubilder für Serien ausblenden, bei denen du hinterher bist';

  @override
  String get calendarSettingsActions => 'Aktionen';

  @override
  String get calendarSettingsSelectAction => 'Auswählen eines Elements';

  @override
  String get calendarSettingsSelectActionDescription =>
      'Was OK oder Tippen bei etwas bewirkt, das bereits in deiner Bibliothek ist';

  @override
  String get calendarSettingsSelectDetails => 'Details öffnen';

  @override
  String get calendarSettingsSelectPlay => 'Abspielen, wenn in der Bibliothek';

  @override
  String get calendarSettingsRequestButton => 'Anfrage-Taste';

  @override
  String get calendarSettingsRequestButtonSubtitle =>
      'Die Seerr-Anfrage-Taste bei fehlenden Filmen und Staffeln anzeigen';

  @override
  String get calendarSettingsReminders => 'Erinnerungen';

  @override
  String get calendarSettingsRemindersSubtitle =>
      '„Erinnern“ anzeigen, um eine Benachrichtigung zu erhalten, sobald ein Titel in deiner Bibliothek landet';

  @override
  String get calendarRowSeeAll => '„Alle anzeigen“-Karte';

  @override
  String get calendarRowSeeAllSubtitle =>
      'Die Zeilen für Kommendes mit einer Karte abschließen, die den Kalender öffnet';

  @override
  String get showNextAirDate => 'Nächster Sendetermin am Ende';

  @override
  String get showNextAirDateSubtitle =>
      'Wenn die nächste Episode noch nicht in deiner Bibliothek ist, zeigt die Karte am Episodenende, wann sie ausgestrahlt wird';

  @override
  String get afterHoursTitle => 'After Hours';

  @override
  String get afterHoursUnlocked => 'After Hours freigeschaltet';

  @override
  String afterHoursPressesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noch $count Tastendrücke',
      one: 'Noch 1 Tastendruck',
    );
    return '$_temp0';
  }

  @override
  String afterHoursTapsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Noch $count-mal tippen',
      one: 'Noch 1-mal tippen',
    );
    return '$_temp0';
  }

  @override
  String get afterHoursPlay => 'Abspielen';

  @override
  String get afterHoursLeaderboards => 'Bestenlisten';

  @override
  String get afterHoursTop3 => 'Top 3';

  @override
  String afterHoursScoresFrom(String server) {
    return 'Punktestände von $server';
  }

  @override
  String get afterHoursScoresOnDevice => 'Punktestände auf diesem Gerät';

  @override
  String get afterHoursGameOver => 'Game Over';

  @override
  String afterHoursNewRank(int rank) {
    return 'Neuer Platz $rank in der Bestenliste';
  }

  @override
  String get afterHoursPlayAgain => 'Nochmal spielen';

  @override
  String get afterHoursBackToArcade => 'Zurück zur Spielhalle';

  @override
  String get afterHoursArcade => 'Spielhalle';

  @override
  String get afterHoursLandscapeNote => 'Wechselt beim Spielen ins Querformat';

  @override
  String get afterHoursTouch => 'Touch';

  @override
  String get afterHoursNewTag => 'NEU';

  @override
  String get afterHoursNoScores => 'Noch keine Punktestände';

  @override
  String get afterHoursPerfect => 'PERFEKT';

  @override
  String get afterHoursBoxSet => 'BOX-SET';

  @override
  String get afterHoursBufferRun => 'Buffer Run';

  @override
  String get afterHoursBufferRunGenre => 'Endlos-Runner mit Schwerkraftwechsel';

  @override
  String get afterHoursBufferRunPitch =>
      'Der Läufer aus dem Ladebildschirm darf endlich irgendwohin laufen. Mit Doppelsprung und Schwerkraftwechsel geht es an die Decke.';

  @override
  String get afterHoursBufferRunRemote =>
      'OK springt, in der Luft erneut gedrückt wechselt die Seite. Runter rutscht. An der Decke sind Hoch und Runter vertauscht.';

  @override
  String get afterHoursBufferRunTouch =>
      'Tippe zum Springen und in der Luft erneut zum Wechseln. Wische zur Laufseite, um zu rutschen.';

  @override
  String get afterHoursFastForward => 'Fast Forward';

  @override
  String get afterHoursFastForwardGenre => 'Runner mit drei Bahnen';

  @override
  String get afterHoursFastForwardPitch =>
      'Ein Sprint durch drei Gänge im Kinofoyer. Spring über Niedriges, und denk dran: Popcornwagen weichen niemandem aus.';

  @override
  String get afterHoursFastForwardRemote =>
      'Hoch und runter wechseln die Bahn. OK springt.';

  @override
  String get afterHoursFastForwardTouch =>
      'Wische nach oben oder unten, um die Bahn zu wechseln. Tippe zum Springen.';

  @override
  String get afterHoursCableCrawl => 'Cable Crawl';

  @override
  String get afterHoursCableCrawlGenre => 'Raster-Crawler';

  @override
  String get afterHoursCableCrawlPitch =>
      'Steuere ein HDMI-Kabel hinter dem TV-Schrank entlang und steck es ins Signal. Jeder Balken macht es länger.';

  @override
  String get afterHoursCableCrawlRemote =>
      'Die Pfeile lenken. Das Kabel hält nie an.';

  @override
  String get afterHoursCableCrawlTouch => 'Wische zum Lenken.';

  @override
  String get afterHoursCaseStack => 'Case Stack';

  @override
  String get afterHoursCaseStackGenre => 'Ein-Tasten-Stapelspiel';

  @override
  String get afterHoursCaseStackPitch =>
      'Baue einen regalhohen Turm aus Blu-ray-Hüllen, jede ein Titel aus deiner eigenen Bibliothek. Was über den Rand ragt, wird abgeschnitten, also triff genau.';

  @override
  String get afterHoursCaseStackRemote => 'OK lässt die Hülle fallen.';

  @override
  String get afterHoursCaseStackTouch => 'Tippe irgendwo, um fallen zu lassen.';

  @override
  String get afterHoursPixelPurge => 'Pixel Purge';

  @override
  String get afterHoursPixelPurgeGenre => 'Paddle-Breaker';

  @override
  String get afterHoursPixelPurgePitch =>
      'Eine schlechte Kodierung hat das Bild mit Blockartefakten übersät, und sie rücken jede Sekunde ein Stück nach unten. Lass die Abspieltaste von der Fortschrittsleiste abprallen, um sie zu entfernen, bevor sie die Leiste erreichen.';

  @override
  String get afterHoursPixelPurgeRemote =>
      'Links und rechts bewegen den Schläger. Der Ball startet von selbst.';

  @override
  String get afterHoursPixelPurgeTouch => 'Ziehe, um den Schläger zu bewegen.';

  @override
  String get afterHoursHowToPlay => 'Spielanleitung';

  @override
  String get afterHoursStart => 'Beginn';

  @override
  String get afterHoursBackToGame => 'Zurück zum Spiel';

  @override
  String get afterHoursEnemies => 'Gegner';

  @override
  String get afterHoursObstacles => 'Hindernisse';

  @override
  String get afterHoursPowerups => 'Power-ups';

  @override
  String get afterHoursCastShieldLine =>
      'Ein Schild, der einen Treffer aushält.';

  @override
  String get afterHoursCastPointsLine => '25 Punkte pro Stück.';

  @override
  String get afterHoursCastLagBat => 'Lag-Fledermaus';

  @override
  String get afterHoursCastLagBatLine =>
      'Stürzt auf Kopfhöhe herab. Rutsch darunter durch.';

  @override
  String get afterHoursCastGremlin => 'Rausch-Gremlin';

  @override
  String get afterHoursCastGremlinLine =>
      'Hüpft am Boden oder an der Decke auf dich zu. Spring darüber.';

  @override
  String get afterHoursCastCable => 'Kabelrolle';

  @override
  String get afterHoursCastCableLine =>
      'Tief am Boden oder an der Decke. Spring darüber.';

  @override
  String get afterHoursCastBanner => 'Puffer-Banner';

  @override
  String get afterHoursCastBannerLine =>
      'Rutsch unter dem Schild durch. Sein Pfosten ist auf der anderen Seite eine Wand.';

  @override
  String get afterHoursCastSkipIntro => 'Überspringe Intro';

  @override
  String get afterHoursCastSkipIntroLine =>
      'Drei Sekunden Sprint, der alles zertrümmert.';

  @override
  String get afterHoursCastPopcorn => 'Popcorn';

  @override
  String get afterHoursCastRollingReel => 'Lose Filmrolle';

  @override
  String get afterHoursCastRollingReelLine =>
      'Rollt schneller deine Bahn herunter, als du läufst. Spring darüber.';

  @override
  String get afterHoursCastUsher => 'Platzanweiser';

  @override
  String get afterHoursCastUsherLine =>
      'Läuft auf dich zu und wechselt einmal die Bahn.';

  @override
  String get afterHoursCastVelvetRope => 'Samtkordel';

  @override
  String get afterHoursCastVelvetRopeLine =>
      'Niedrig. Spring darüber oder wechsle die Bahn.';

  @override
  String get afterHoursCastPopcornCart => 'Popcornwagen';

  @override
  String get afterHoursCastPopcornCartLine =>
      'Zu hoch zum Springen. Wechsle die Bahn.';

  @override
  String get afterHoursCastFrontRowPass => 'Erste-Reihe-Pass';

  @override
  String get afterHoursCastMagnet => 'Magnet';

  @override
  String get afterHoursCastMagnetLine =>
      'Zieht acht Sekunden lang Tickets aus allen Bahnen an.';

  @override
  String get afterHoursCastTicket => 'Ticket';

  @override
  String get afterHoursCastBug => 'Störungs-Bug';

  @override
  String get afterHoursCastBugLine => 'Wandert zufällig umher.';

  @override
  String get afterHoursCastTangle => 'Kabelsalat';

  @override
  String get afterHoursCastTangleLine => 'Verfolgt langsam deinen Stecker.';

  @override
  String get afterHoursCastStatic => 'Statisch';

  @override
  String get afterHoursCastStaticLine =>
      'Eine tote Zelle. Bei jedem dritten Signal erscheint eine.';

  @override
  String get afterHoursCastBrick => 'Netzteil';

  @override
  String get afterHoursCastBrickLine =>
      'Ein 2×2-Block bei jedem fünften Signal.';

  @override
  String get afterHoursCastGhost => 'Geist';

  @override
  String get afterHoursCastGhostLine =>
      'Fünf Sekunden lang durch alles hindurch, außer durch den Rand.';

  @override
  String get afterHoursCastSnip => 'Schnipp';

  @override
  String get afterHoursCastSnipLine =>
      'Schneidet das Kabel für Bonuspunkte in zwei Hälften.';

  @override
  String get afterHoursCastSignal => 'Signal';

  @override
  String get afterHoursCastSignalLine => 'Punkte und zwei weitere Segmente.';

  @override
  String get afterHoursCastShelfCat => 'Regalkatze';

  @override
  String get afterHoursCastShelfCatLine =>
      'Schlägt eine ankommende Hülle an, sodass diese schneller rutscht.';

  @override
  String get afterHoursCastBluCase => 'Blu-ray-Hülle';

  @override
  String get afterHoursCastBluCaseLine =>
      'Ein Titel aus deiner Bibliothek. Der Überstand wird abgeschnitten.';

  @override
  String get afterHoursCastSteelbook => 'Steelbook';

  @override
  String get afterHoursCastSteelbookLine =>
      'Jede zehnte Hülle. Rutscht viel schneller.';

  @override
  String get afterHoursCastPerfect => 'Perfekter Drop';

  @override
  String get afterHoursCastPerfectLine =>
      'Triffst du genau, wird der Stapel ein Stück breiter.';

  @override
  String get afterHoursCastBoxSet => 'Box-Set';

  @override
  String get afterHoursCastBoxSetLine =>
      'Drei perfekte Drops hintereinander machen ihn deutlich breiter.';

  @override
  String get afterHoursCastDeadPixel => 'Toter Pixel';

  @override
  String get afterHoursCastDeadPixelLine =>
      'Fällt aus zerstörten Blöcken. Fängst du es, schrumpft der Schläger.';

  @override
  String get afterHoursCastMacroblock => 'Makroblock';

  @override
  String get afterHoursCastMacroblockLine => 'Ein Treffer entfernt ihn.';

  @override
  String get afterHoursCastKeyframe => 'Keyframe';

  @override
  String get afterHoursCastKeyframeLine =>
      'Hält drei Treffer aus und lässt ein Power-up fallen.';

  @override
  String get afterHoursCastHdrLine =>
      'Acht Sekunden lang ein doppelt so breiter Schläger.';

  @override
  String get afterHoursCastBufferNet => 'Puffer';

  @override
  String get afterHoursCastBufferNetLine =>
      'Ein Netz unter dem Schläger, das einen Fehlschlag auffängt.';

  @override
  String get afterHoursBufferRunCardTouch =>
      'Tippe zum Springen, in der Luft erneut zum Wechseln. Wische zu deiner Seite, um zu rutschen.';

  @override
  String get afterHoursPixelPurgeCardRemote =>
      'Links und rechts bewegen den Schläger.';

  @override
  String get remoteMediaNotificationTitle =>
      'Benachrichtigung bei Remote-Wiedergabe';

  @override
  String get remoteMediaNotificationSubtitle =>
      'Systemmediensteuerung anzeigen, wenn auf einem anderen Gerät geschaut wird';

  @override
  String get remoteActivityWatching => 'Wird auf Moonfin geschaut';

  @override
  String get remoteActivityListening => 'Wird auf Moonfin gehört';

  @override
  String get clickpadSeeking => 'Spulen per Clickpad erlauben';

  @override
  String get clickpadSeekingDescription =>
      'Wann Links, Rechts und Wischen auf dem Touchpad spulen können. Andernfalls blendet die erste Eingabe die Steuerelemente ein.';

  @override
  String get clickpadSeekingControlsVisible =>
      'Wenn die Steuerelemente angezeigt werden';

  @override
  String get clickpadSeekingPausedOnly => 'Nur bei pausierter Wiedergabe';

  @override
  String get topNavbarStyle => 'Stil der oberen Leiste';

  @override
  String get topNavbarStyleClassic => 'Klassisch';

  @override
  String get topNavbarStyleTabline => 'Tabline';

  @override
  String get topNavbarStyleAtlas => 'Atlas';

  @override
  String get topNavbarStyleClassicHint => 'Die Standardleiste';

  @override
  String get topNavbarStyleTablineHint =>
      'Text-Tabs mit Unterstrich, ohne Hinterlegung';

  @override
  String get topNavbarStyleAtlasHint =>
      'Tabs öffnen einen Bereich mit Verknüpfungen und Artwork';

  @override
  String get sidebarStyle => 'Stil der Seitenleiste';

  @override
  String get sidebarStyleClassic => 'Klassisch';

  @override
  String get sidebarStyleReel => 'Reel';

  @override
  String get sidebarStyleMosaic => 'Mosaik';

  @override
  String get sidebarStyleClassicHint => 'Die Standard-Seitenleiste';

  @override
  String get sidebarStyleReelHint => 'Ein Rad, das sich durch die Ziele dreht';

  @override
  String get sidebarStyleMosaicHint =>
      'Ein Bereich mit Kacheln mit Bibliotheks-Artwork';

  @override
  String navContinueIn(String section) {
    return 'Weiter in $section';
  }

  @override
  String navFeatured(String title) {
    return 'Hervorgehoben: $title';
  }

  @override
  String get navOpenMenu => 'Menü öffnen';

  @override
  String get navReelSwipeHint =>
      'Wische zum Drehen, tippe zum Öffnen in die Mitte';

  @override
  String siloSectionBecauseYouEnjoy(String genres) {
    return 'Because you enjoy $genres';
  }

  @override
  String get siloSectionBecauseYouWatched => 'Because You Watched';

  @override
  String siloSectionBecauseYouWatchedTitle(String title) {
    return 'Because You Watched $title';
  }

  @override
  String get siloSectionForYou => 'For You';

  @override
  String get siloSectionHiddenGems => 'Hidden Gems';

  @override
  String get siloSectionHighlyRatedInLibrary => 'Highly Rated in Your Library';

  @override
  String get siloSectionNextInYourSeries => 'Next in Your Series';

  @override
  String get siloSectionPickedFromYourHistory => 'Picked from your history';

  @override
  String get siloSectionPopularOnServer => 'Popular on This Server';

  @override
  String get siloSectionProfilesLikeYouEnjoyed => 'Profiles Like You Enjoyed';

  @override
  String get siloSectionRandomPicks => 'Random Picks';

  @override
  String get siloSectionRecentlyAddedAudiobooks => 'Recently Added Audiobooks';

  @override
  String get siloSectionRecentlyAddedEbooks => 'Recently Added Ebooks';

  @override
  String siloSectionRecentlyAddedIn(String library) {
    return 'Recently Added in $library';
  }

  @override
  String get siloSectionRecentlyAddedManga => 'Recently Added Manga';

  @override
  String get siloSectionRecentlyAddedMovies => 'Recently Added Movies';

  @override
  String get siloSectionRecentlyAddedTv => 'Recently Added TV';

  @override
  String get siloSectionRecentlyReleasedAudiobooks =>
      'Recently Released Audiobooks';

  @override
  String get siloSectionRecentlyReleasedEbooks => 'Recently Released Ebooks';

  @override
  String siloSectionRecentlyReleasedEpisodesIn(String library) {
    return 'Recently Released Episodes in $library';
  }

  @override
  String siloSectionRecentlyReleasedIn(String library) {
    return 'Recently Released in $library';
  }

  @override
  String get siloSectionRecentlyReleasedManga => 'Recently Released Manga';

  @override
  String get siloSectionRecentlyReleasedMovies => 'Recently Released Movies';

  @override
  String get siloSectionRecommendedForYou => 'Recommended for You';

  @override
  String get siloSectionReturningShows => 'Returning Shows';

  @override
  String get siloSectionSeasonalChristmasClassics => 'Christmas Classics';

  @override
  String get siloSectionSeasonalChristmasComedies => 'Christmas Comedies';

  @override
  String get siloSectionSeasonalChristmasFamily => 'Family Christmas';

  @override
  String get siloSectionSeasonalChristmasFavorites => 'Christmas Favorites';

  @override
  String get siloSectionSeasonalChristmasHallmark => 'Hallmark Christmas';

  @override
  String get siloSectionSeasonalChristmasRomcoms => 'Christmas Rom-Coms';

  @override
  String get siloSectionSeasonalEasterFaith => 'Easter Stories';

  @override
  String get siloSectionSeasonalEasterFamily => 'Easter Movies';

  @override
  String get siloSectionSeasonalFamilyMovieNightFavorites => 'Family Favorites';

  @override
  String get siloSectionSeasonalFamilyMovieNight => 'Family Movie Night';

  @override
  String get siloSectionSeasonalHalloweenAnimated => 'Animated Halloween';

  @override
  String get siloSectionSeasonalHalloweenFamily => 'Family Halloween';

  @override
  String get siloSectionSeasonalHalloweenFavorites => 'Halloween Favorites';

  @override
  String get siloSectionSeasonalHalloweenHorror => 'Halloween Horror';

  @override
  String get siloSectionSeasonalHalloweenTv => 'Halloween TV';

  @override
  String get siloSectionSeasonalNewYearFavorites => 'New Year\'s Movies';

  @override
  String get siloSectionSeasonalSaturdayMorningCartoons =>
      'Saturday Morning Cartoons';

  @override
  String get siloSectionSeasonalSaturdayMorningModern =>
      'Saturday Morning Favorites';

  @override
  String get siloSectionSeasonalSaturdayMorningNineties =>
      '90s Saturday Mornings';

  @override
  String get siloSectionSeasonalStPatricksIrishFilm => 'Irish Film';

  @override
  String get siloSectionSeasonalStPatricksIrishTv => 'Irish TV';

  @override
  String get siloSectionSeasonalSummerBlockbusters => 'Summer Blockbusters';

  @override
  String get siloSectionSeasonalSummerClassicSummer => 'Classic Summer Movies';

  @override
  String get siloSectionSeasonalSummerNostalgia => 'Summer Nostalgia';

  @override
  String get siloSectionSeasonalThanksgivingFavorites => 'Thanksgiving Movies';

  @override
  String get siloSectionSeasonalThanksgivingFeelGood => 'Feel-Good Favorites';

  @override
  String get siloSectionSeasonalValentinesFavorites => 'Valentine\'s Favorites';

  @override
  String get siloSectionSeasonalValentinesLoveStories => 'Classic Love Stories';

  @override
  String get siloSectionSeasonalValentinesRomanticDramas => 'Romantic Dramas';

  @override
  String get siloSectionSeasonalValentinesRomcoms => 'Valentine\'s Rom-Coms';

  @override
  String get siloSectionSeasonalPicks => 'Seasonal Picks';

  @override
  String siloSectionTopGenre(String genre) {
    return 'Top $genre';
  }

  @override
  String get siloSectionTopPicksToday => 'Top Picks Today';

  @override
  String get siloSectionTopRated => 'Top Rated';

  @override
  String get siloSectionTopRatedMovies => 'Top Rated Movies';

  @override
  String get siloSectionTopRatedTv => 'Top Rated TV';

  @override
  String get siloSectionTrendingOnServer => 'Trending on Server';

  @override
  String get siloSectionTrendingThisWeek => 'Trending This Week';
}
