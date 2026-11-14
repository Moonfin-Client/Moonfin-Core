// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get animeMarkerFiller => 'Filler';

  @override
  String get animeMarkerMixed => 'Misto';

  @override
  String get animeMarkerAnimeCanon => 'Canonico anime';

  @override
  String get animeMarkerMangaCanon => 'Canonico manga';

  @override
  String get animeMarkerSubbed => 'Sottotitolato';

  @override
  String get animeMarkerDubbed => 'Doppiato';

  @override
  String get animeMarkerSubbedAndDubbed => 'Sottotitolato/Doppiato';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'In attesa';

  @override
  String get animeMarkerRecap => 'Riassunto';

  @override
  String get interfaceLanguage => 'Lingua dell’interfaccia';

  @override
  String get systemLanguageDefault => 'Predefinito di sistema';

  @override
  String get signIn => 'Accedi';

  @override
  String get signingIn => 'Accesso in corso...';

  @override
  String get empty => 'Vuoto';

  @override
  String connectingToServer(String serverName) {
    return 'Connessione a $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Password';

  @override
  String get username => 'Nome utente';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Inserisci questo codice nella dashboard web del tuo server:';

  @override
  String get quickConnectScanHint =>
      'Oppure scansionalo con un telefono che ha effettuato l\'accesso al tuo server';

  @override
  String get quickConnectTapOrScanHint =>
      'Tocca per approvare nel browser, oppure scansionalo con un altro dispositivo';

  @override
  String get timesUpTitle => 'Tempo scaduto';

  @override
  String get timesUpMessage => 'Questo account non è al momento disponibile.';

  @override
  String timesUpResumesToday(String time) {
    return 'Potrai utilizzarlo nuovamente oggi alle $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'Potrai utilizzarlo nuovamente domani alle $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'Potrai utilizzarlo nuovamente il $day alle $time.';
  }

  @override
  String get waitingForAuthorization => 'In attesa di autorizzazione…';

  @override
  String get back => 'Indietro';

  @override
  String get serverUnavailable => 'Server non disponibile';

  @override
  String get loginFailed => 'Accesso fallito';

  @override
  String get loginForbidden =>
      'Questo account non può effettuare l\'accesso al momento. Potrebbe essere soggetto a restrizioni orarie, bloccato o disabilitato. Riprova più tardi o contatta un amministratore.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect non disponibile: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect non disponibile ($status): $detail';
  }

  @override
  String get whosWatching => 'Chi sta guardando?';

  @override
  String get signedInOnThisDevice => 'Accesso effettuato su questo dispositivo';

  @override
  String get pinRequired => 'PIN richiesto';

  @override
  String get passwordRequired => 'Password richiesta';

  @override
  String continueAsUser(String name) {
    return 'Continua come $name';
  }

  @override
  String switchToUser(String name) {
    return 'Passa a $name';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return 'Accesso effettuato come $user su $server';
  }

  @override
  String get accountActive => 'Attivo';

  @override
  String get addUser => 'Aggiungi Utente';

  @override
  String get selectServer => 'Seleziona Server';

  @override
  String appVersionFooter(String version) {
    return 'Versione Moonfin $version';
  }

  @override
  String get savedServers => 'Server Salvati';

  @override
  String get discoveredServers => 'Server Trovati';

  @override
  String get noneFound => 'Nessuno trovato';

  @override
  String get unableToConnectToServer => 'Impossibile connettersi al server';

  @override
  String get addServer => 'Aggiungi Server';

  @override
  String get embyConnect => 'Emby Connetti';

  @override
  String get removeServer => 'Rimuovi Server';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Rimuovere \"$serverName\" dai tuoi server?';
  }

  @override
  String get cancel => 'Annulla';

  @override
  String get remove => 'Rimuovi';

  @override
  String get connectToServer => 'Connetti al Server';

  @override
  String get serverAddress => 'Indirizzo Server';

  @override
  String get serverAddressHint => 'https://tuo-server.esempio.com';

  @override
  String get connect => 'Connetti';

  @override
  String get secureStorageUnavailable => 'Archiviazione Sicura Non Disponibile';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin non è riuscito ad accedere al portachiavi di sistema. L\'accesso può continuare, ma l\'archiviazione sicura dei token potrebbe non essere disponibile fino allo sblocco del portachiavi.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema dell\'app';

  @override
  String get detailScreenStyle => 'Stile schermata dettagli';

  @override
  String get detailScreenStyleSubtitle =>
      'Come appare un film o una serie quando lo apri.';

  @override
  String get detailScreenStyleMoonfin => 'Classica';

  @override
  String get detailScreenStyleModern => 'Moderna';

  @override
  String get detailScreenStyleSpotlight => 'In primo piano';

  @override
  String get spotlightMoreActions => 'Altre azioni';

  @override
  String get spotlightCastCrewStudios => 'Cast, troupe e studi';

  @override
  String get spotlightChaptersExtras => 'Capitoli ed extra';

  @override
  String get spotlightFileDetails => 'Dettagli file';

  @override
  String get spotlightSimilarRecommendations => 'Simili e raccomandazioni';

  @override
  String get spotlightSeasonsEpisodes => 'Stagioni ed episodi';

  @override
  String get spotlightMoreEpisodes => 'Altri episodi';

  @override
  String get spotlightFilmography => 'Filmografia';

  @override
  String get spotlightCollectionsCard => 'Raccolte';

  @override
  String get spotlightPlaylistOrder => 'Ordine playlist';

  @override
  String get spotlightMoviesAndShows => 'Film & Serie TV';

  @override
  String get spotlightSimilarSeerr => 'Simili (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Raccomandazioni (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count persone',
      one: '1 persona',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count informazioni',
      one: '1 informazione',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tag',
      one: '1 tag',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count studi',
      one: '1 studio',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capitoli',
      one: '1 capitolo',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count extra',
      one: '1 extra',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stagioni',
      one: '1 stagione',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodi',
      one: '1 episodio',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count film',
      one: '1 film',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serie',
      one: '1 serie',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracce',
      one: '1 traccia',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count album',
      one: '1 album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count collezioni',
      one: '1 collezione',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titoli',
      one: '1 titolo',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalista';

  @override
  String get detailScreenStyleStage => 'Palco';

  @override
  String get detailScreenStylePremiere => 'Premiere';

  @override
  String get detailScreenStyleQuickLook => 'Anteprima rapida';

  @override
  String get detailScreenStyleFrost => 'Brina';

  @override
  String get quickLookOpenFullPage => 'Apri pagina completa';

  @override
  String get quickLookBackToClose => 'Premi Indietro per chiudere';

  @override
  String quickLookSeasonPlayed(int played, int total) {
    return '$played di $total';
  }

  @override
  String get expandedTabs => 'Schede Espanse';

  @override
  String get expandedTabsSubtitle =>
      'Mostra automaticamente il contenuto delle schede durante la navigazione. Disattiva per aprire e chiudere ogni scheda manualmente.';

  @override
  String get showTechnicalDetails => 'Mostra dettagli tecnici';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Mostra informazioni su codec, risoluzione e stream nel riepilogo del banner';

  @override
  String get recommendationSystem => 'Sistema di raccomandazione';

  @override
  String get recommendationSystemSubtitle =>
      'Usa l\'algoritmo locale Moonfin Recommends, il motore del server Jellyfin Recommends o le metriche di similarità online di TMDb. Nota: i suggerimenti online richiedono l\'integrazione con Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Suggerimenti Moonfin';

  @override
  String get recommendationSystemJellyfin => 'Suggerimenti Jellyfin';

  @override
  String get recommendationSystemTmdb => 'Similarità TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Applica il limite di età ai suggerimenti';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limita i suggerimenti di Suggerimenti Moonfin in base alla classificazione per età del contenuto selezionato';

  @override
  String get interfaceStyle => 'Stile dell\'interfaccia';

  @override
  String get interfaceStyleSubtitle =>
      'Automatico adatta l\'aspetto dell\'app al tuo dispositivo. Scegli Apple o Material per utilizzare uno stile specifico.';

  @override
  String get interfaceStyleAutomatic => 'Automatico';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Layout Interfaccia';

  @override
  String get interfaceLayoutSubtitle =>
      'Sovrascrivi il layout rilevato quando il dispositivo viene identificato in modo errato. Riavvia Moonfin per applicare le modifiche.';

  @override
  String get interfaceLayoutAutomatic => 'Automatico';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Desktop';

  @override
  String get interfaceLayoutPhone => 'Telefono';

  @override
  String get glassQuality => 'Qualità dell\'effetto vetro';

  @override
  String get oledMode => 'Modalità OLED';

  @override
  String get oledModeSubtitle =>
      'Neri più profondi e colori delle copertine più ricchi. Ottimizzato per schermi OLED.';

  @override
  String get oledModeSubtle => 'Leggera';

  @override
  String get oledModeVivid => 'Intensa';

  @override
  String get glassQualitySubtitle =>
      'Automatico seleziona l\'effetto vetro più adatto al dispositivo. Completo utilizza la sfocatura reale per la migliore resa visiva. Ridotto usa un effetto più leggero per ridurre il consumo della GPU.';

  @override
  String get glassQualityAuto => 'Automatico';

  @override
  String get glassQualityFull => 'Completo';

  @override
  String get glassQualityReduced => 'Ridotto';

  @override
  String get performanceMode => 'Prestazioni';

  @override
  String get performanceModeSubtitle =>
      'Automatico valuta questo dispositivo e alleggerisce il carico su quelli con poca memoria: tiene meno immagini in memoria e mostra i trailer come immagini fisse. Ha pieno effetto al prossimo avvio.';

  @override
  String get performanceModeAuto => 'Automatico';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Ridotte';

  @override
  String get rendererMode => 'Renderer';

  @override
  String get rendererModeSubtitle =>
      'Automatico usa Impeller sui TV box con una grafica in grado di gestirlo in modo fluido e Skia su tutti gli altri. Scegli Skia se animazioni o video non si vedono correttamente. Ha effetto al prossimo avvio.';

  @override
  String get rendererModeAuto => 'Automatico';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Disattivata perché l\'opzione Prestazioni è impostata su Ridotte per questo dispositivo';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Passa da Moonfin a Neon Pulse senza riavviare l\'app.';

  @override
  String get customThemeTitle => 'Tema personalizzato';

  @override
  String get customThemeSubtitle =>
      'I temi personalizzati modificano l\'aspetto di Moonfin. Scegli quello più adatto al tuo stile.';

  @override
  String get keyboardStyle => 'Stile Tastiera';

  @override
  String get keyboardStyleDescription =>
      'Nativa usa la tastiera della tua TV. Classica è la tastiera originale di Moonfin. Vetro è un pannello satinato con tasti più grandi. Ancorata occupa la parte inferiore dello schermo e mostra il testo digitato sopra i tasti.';

  @override
  String get keyboardStyleNative => 'Nativa';

  @override
  String get keyboardStyleClassic => 'Classica';

  @override
  String get keyboardStyleGlass => 'Vetro';

  @override
  String get keyboardStyleDocked => 'Ancorata';

  @override
  String get keyboardSpace => 'spazio';

  @override
  String get keyboardHoldForAccents => 'tieni premuto per gli accenti';

  @override
  String get keyboardClose => 'chiudi';

  @override
  String get controller => 'Controller';

  @override
  String get gamepadNavigation => 'Navigazione con Gamepad';

  @override
  String get gamepadNavigationDescription =>
      'Consenti a un controller collegato di spostare il focus e selezionare gli elementi';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'L\'aspetto originale e minimalista di Moonfin.';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Stile Synthwave con bagliore magenta, testo ciano e contrasto cromato più forte';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Stile liquid glass con sfondo sfumato dinamico, superfici satinate e accento blu Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Stile retrò pixel art con una palette dai colori decisi, bordi marcati, ombre nette e un carattere pixelato';

  @override
  String get embyConnectSignInSubtitle =>
      'Accedi con il tuo account Emby Connect';

  @override
  String get emailOrUsername => 'Email o Nome utente';

  @override
  String get selectAServer => 'Seleziona un Server';

  @override
  String get tryAgain => 'Riprova';

  @override
  String get noLinkedServers =>
      'Nessun server collegato a questo account Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Credenziali Emby Connect non valide';

  @override
  String get invalidEmbyConnectLogin =>
      'Nome utente o password Emby Connect non validi';

  @override
  String get embyConnectExchangeNotSupported =>
      'Il server non supporta lo scambio Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Errore di rete durante il contatto con Emby Connect o il server selezionato';

  @override
  String get signInWithPlex => 'Accedi con Plex';

  @override
  String get plexLinkInstructions =>
      'Vai su plex.tv/link da qualsiasi dispositivo e inserisci questo codice';

  @override
  String get plexOpenLink => 'Apri plex.tv/link';

  @override
  String get plexWaitingForApproval =>
      'In attesa dell\'approvazione del codice…';

  @override
  String get plexSignInWithPassword => 'Accedi con una password';

  @override
  String get plexVerificationCode => 'Codice di verifica';

  @override
  String get plexNoServers => 'Nessun server Plex trovato su questo account';

  @override
  String get loadingLinkedServers => 'Caricamento server collegati…';

  @override
  String get connectingToServerEllipsis => 'Connessione al server…';

  @override
  String get noReachableAddress => 'Nessun indirizzo raggiungibile fornito';

  @override
  String get invalidServerExchangeResponse =>
      'Risposta non valida dall\'endpoint di scambio del server';

  @override
  String unableToConnectTo(String target) {
    return 'Impossibile connettersi a $target';
  }

  @override
  String get exitApp => 'Uscire da Moonfin?';

  @override
  String get exitAppConfirmation => 'Sei sicuro di voler uscire?';

  @override
  String get exit => 'Esci';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'In pausa';

  @override
  String get gameSaveState => 'Salva stato';

  @override
  String get games => 'Giochi';

  @override
  String get gameLoadState => 'Carica stato';

  @override
  String get gameFastForward => 'Avanzamento rapido';

  @override
  String get gameOrientation => 'Orientamento di gioco';

  @override
  String get gameOrientationSubtitle =>
      'Orientamento dello schermo durante il gioco';

  @override
  String get landscape => 'Orizzontale';

  @override
  String get portrait => 'Verticale';

  @override
  String get gameEmulatorSettings => 'Impostazioni dell\'emulatore';

  @override
  String get gameNoCoreOptions =>
      'Questo core non dispone di opzioni configurabili.';

  @override
  String get gameHoldToOpenMenu => 'Tieni premuto per aprire il menu';

  @override
  String get gameKeepPlaying => 'Continua a giocare';

  @override
  String get gameSaveAndExit => 'Salva ed esci';

  @override
  String get gameExitGame => 'Esci dal gioco';

  @override
  String get gameSavingBeforeExit => 'Salvataggio…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Impossibile salvare lo stato. Il gioco continua.';

  @override
  String get gamePlaybackUnsupported =>
      'La riproduzione del gioco non è ancora supportata su questo dispositivo.';

  @override
  String get noHomeRowsLoaded => 'Impossibile caricare le righe della home';

  @override
  String get noHomeRowsHint =>
      'Prova ad aggiornare o a ridurre le sezioni home attive.';

  @override
  String get retryHomeRows => 'Ricarica Righe Home';

  @override
  String get guide => 'Guida';

  @override
  String get recordings => 'Registrazioni';

  @override
  String get schedule => 'Programmazione';

  @override
  String get series => 'Serie';

  @override
  String get noItemsFound => 'Nessun elemento trovato';

  @override
  String get home => 'Home';

  @override
  String get browseAll => 'Sfoglia Tutto';

  @override
  String get genres => 'Generi';

  @override
  String get collectionPlaceholder =>
      'Gli elementi della collezione appariranno qui';

  @override
  String get browseByLetter => 'Sfoglia per Lettera';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'La navigazione alfabetica apparirà qui';

  @override
  String get suggestions => 'Suggerimenti';

  @override
  String get suggestionsPlaceholder => 'Gli elementi suggeriti appariranno qui';

  @override
  String get failedToLoadLibraries => 'Impossibile caricare le librerie';

  @override
  String get noLibrariesFound => 'Nessuna libreria trovata';

  @override
  String get library => 'Libreria';

  @override
  String get displaySettings => 'Impostazioni Visualizzazione';

  @override
  String get allGenres => 'Tutti i Generi';

  @override
  String get noGenresFound => 'Nessun genere trovato';

  @override
  String failedToLoadFolderError(String error) {
    return 'Impossibile caricare la cartella: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Questa cartella è vuota';

  @override
  String itemCountLabel(int count) {
    return '$count elementi';
  }

  @override
  String get failedToLoadFavorites => 'Impossibile caricare i preferiti';

  @override
  String get retry => 'Riprova';

  @override
  String get noFavoritesYet => 'Nessun preferito ancora';

  @override
  String get favorites => 'Preferiti';

  @override
  String totalCountItems(int count) {
    return '$count Elementi';
  }

  @override
  String get continuing => 'In corso';

  @override
  String get ended => 'Terminata';

  @override
  String get sortAndFilter => 'Ordina e Filtra';

  @override
  String get type => 'Tipo';

  @override
  String get sortBy => 'Ordina per';

  @override
  String get display => 'Visualizzazione';

  @override
  String get imageType => 'Tipo Immagine';

  @override
  String get posterSize => 'Dimensione Poster';

  @override
  String get small => 'Piccolo';

  @override
  String get medium => 'Medio';

  @override
  String get large => 'Grande';

  @override
  String get extraLarge => 'Extra Grande';

  @override
  String get uiScaleGrandparents => 'Nonni';

  @override
  String get uiScaleGreatGrandparents => 'Bisnonni';

  @override
  String get scrollDirection => 'Direzione di Scorrimento';

  @override
  String get scrollDirectionVertical => 'Verticale';

  @override
  String get scrollDirectionHorizontal => 'Orizzontale';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Generi';
  }

  @override
  String get views => 'Viste';

  @override
  String get albums => 'Album';

  @override
  String get albumArtists => 'Artisti Album';

  @override
  String get artists => 'Artisti';

  @override
  String get bookmarks => 'Segnalibri';

  @override
  String get noSavedBookmarks => 'Nessun segnalibro salvato per questo titolo.';

  @override
  String get openBook => 'Apri Libro';

  @override
  String get chapter => 'Capitolo';

  @override
  String get page => 'Pagina';

  @override
  String get bookmark => 'Segnalibro';

  @override
  String get justNow => 'Proprio ora';

  @override
  String minutesAgo(int count) {
    return '$count min fa';
  }

  @override
  String hoursAgo(int count) {
    return '$count h fa';
  }

  @override
  String daysAgo(int count) {
    return '$count g fa';
  }

  @override
  String get discoverySubjects => 'Argomenti Scoperta';

  @override
  String get apply => 'Applica';

  @override
  String get openLink => 'Apri collegamento';

  @override
  String get scanWithYourPhone => 'Scansiona con il tuo telefono';

  @override
  String get audiobookGenres => 'Generi Audiolibri';

  @override
  String get scrollLeft => 'Scorri a sinistra';

  @override
  String get scrollRight => 'Scorri a destra';

  @override
  String get scrollToTop => 'Torna in cima';

  @override
  String get couldNotLoadGenre =>
      'Impossibile caricare questo genere al momento.';

  @override
  String get continueReading => 'Continua a Leggere';

  @override
  String get savedHighlights => 'Evidenziazioni Salvate';

  @override
  String get continueListening => 'Continua ad Ascoltare';

  @override
  String get listen => 'Ascolta';

  @override
  String get resume => 'Riprendi';

  @override
  String get failedToLoadLibrary => 'Impossibile caricare la libreria';

  @override
  String get popularNow => 'Popolari Ora';

  @override
  String get savedForLater => 'Salvati per Dopo';

  @override
  String get topListens => 'Più Ascoltati';

  @override
  String get unreadDiscoveries => 'Scoperte Non Lette';

  @override
  String get pickUpAgain => 'Riprendi';

  @override
  String get bookHighlightsDescription =>
      'I tuoi libri con evidenziazioni, preferiti o progressi di lettura.';

  @override
  String get handPickedFromLibrary => 'Selezionati dalla tua libreria.';

  @override
  String get handPickedFromListeningQueue =>
      'Selezionati dalla tua coda di ascolto.';

  @override
  String get booksWithHighlights =>
      'Libri con evidenziazioni, preferiti o progressi di lettura.';

  @override
  String get jumpBackNarration =>
      'Torna alla narrazione senza cercare il punto.';

  @override
  String get unreadBooksReady =>
      'Libri non letti pronti per la prossima ora tranquilla.';

  @override
  String get quickAccessFavorites =>
      'Accesso rapido ai libri a cui torni sempre.';

  @override
  String get searchAudiobooks => 'Cerca audiolibri';

  @override
  String get searchYourLibrary => 'Cerca nella tua libreria';

  @override
  String get pickUpStory => 'Riprendi la storia da dove l\'avevi lasciata';

  @override
  String get savedPlacesChapters =>
      'I tuoi punti salvati e capitoli non finiti';

  @override
  String authorsCount(int count) {
    return '$count autori';
  }

  @override
  String genresCount(int count) {
    return '$count generi';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completato';
  }

  @override
  String get readyWhenYouAre => 'Pronto quando lo sei tu';

  @override
  String get details => 'Dettagli';

  @override
  String get listeningRoom => 'Sala d\'Ascolto';

  @override
  String get bookmarksAndProgress => 'Segnalibri e Progressi';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titoli organizzati per una navigazione all\'insegna della lettura.';
  }

  @override
  String get titles => 'Titoli';

  @override
  String get allTitles => 'Tutti i Titoli';

  @override
  String get authors => 'Autori';

  @override
  String get browseByAuthor => 'Sfoglia per Autore';

  @override
  String get browseByGenre => 'Sfoglia per Genere';

  @override
  String get discover => 'Scopri';

  @override
  String get noBookmarkedItems => 'Nessun elemento nei segnalibri';

  @override
  String get nothingMatchesSection =>
      'Nessun risultato per questa sezione. Prova un\'altra scheda o torna dopo la sincronizzazione della libreria.';

  @override
  String get audiobooks => 'Audiolibri';

  @override
  String noLabelFound(String label) {
    return 'Nessun $label trovato';
  }

  @override
  String get folder => 'Cartella';

  @override
  String get filters => 'Filtri';

  @override
  String get readingStatus => 'Stato Lettura';

  @override
  String get playedStatus => 'Stato Riproduzione';

  @override
  String get readStatus => 'Letto';

  @override
  String get watched => 'Visto';

  @override
  String get unread => 'Non letto';

  @override
  String get unwatched => 'Non visto';

  @override
  String get seriesStatus => 'Stato Serie';

  @override
  String get allLibraries => 'Tutte le Librerie';

  @override
  String get books => 'Libri';

  @override
  String get latestBooks => 'Ultimi Libri';

  @override
  String get latestAudiobooks => 'Ultimi Audiolibri';

  @override
  String get latestComics => 'Ultimi Fumetti';

  @override
  String get comics => 'Fumetti';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libri',
      one: '1 libro',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Libro';

  @override
  String get bookFormatAudiobook => 'Audiolibro';

  @override
  String get bookFormatComic => 'Fumetto';

  @override
  String get noBooksFound => 'Nessun libro trovato';

  @override
  String get noBooksFoundDescription =>
      'Questa libreria non contiene ancora libri, audiolibri o fumetti.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% letto';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time rimanenti';
  }

  @override
  String get bookHeroRead => 'Leggi';

  @override
  String get bookHeroListen => 'Ascolta';

  @override
  String get author => 'Autore';

  @override
  String get unknownAuthor => 'Autore Sconosciuto';

  @override
  String get uncategorized => 'Non categorizzato';

  @override
  String get overview => 'Panoramica';

  @override
  String get noLibrivoxDescription =>
      'Nessuna descrizione fornita da LibriVox per questo titolo.';

  @override
  String get readers => 'Lettori';

  @override
  String get openLinks => 'Apri Link';

  @override
  String get librivoxPage => 'Pagina LibriVox';

  @override
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Scarica Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count sezioni';
  }

  @override
  String firstPublished(int year) {
    return 'Prima pubblicazione $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Nessuna panoramica disponibile da Open Library per questo titolo.';

  @override
  String get subjects => 'Argomenti';

  @override
  String get all => 'Tutto';

  @override
  String booksCount(int count) {
    return '$count libri';
  }

  @override
  String get couldNotLoadSubject =>
      'Impossibile caricare questo argomento al momento.';

  @override
  String get audiobookDetails => 'Dettagli Audiolibro';

  @override
  String authorsCountTitle(int count) {
    return '$count Autori';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiolibri',
      one: '1 audiolibro',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista Tracce';

  @override
  String get itemListPlaceholder => 'La lista elementi apparirà qui';

  @override
  String get failedToLoad => 'Impossibile caricare';

  @override
  String get delete => 'Elimina';

  @override
  String get save => 'Salva';

  @override
  String get moreLikeThis => 'Titoli Simili';

  @override
  String get castAndCrew => 'Cast e Troupe';

  @override
  String get collection => 'Collezione';

  @override
  String get episodes => 'Episodi';

  @override
  String get nextUp => 'Prossimo';

  @override
  String get seasons => 'Stagioni';

  @override
  String get chapters => 'Capitoli';

  @override
  String get features => 'Contenuti';

  @override
  String get movies => 'Film';

  @override
  String get musicVideos => 'Video Musicali';

  @override
  String get other => 'Altro';

  @override
  String get discography => 'Discografia';

  @override
  String get similarArtists => 'Artisti Simili';

  @override
  String get tableOfContents => 'Indice';

  @override
  String get tracklist => 'Lista Tracce';

  @override
  String discNumber(int number) {
    return 'Disco $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'Dettagli Autore';

  @override
  String get noOverviewAvailable =>
      'Nessuna panoramica disponibile per questo titolo.';

  @override
  String get noBiographyAvailable =>
      'Nessuna biografia disponibile per questo autore.';

  @override
  String get unableToLoadAuthorDetails =>
      'Impossibile caricare i dettagli dell\'autore al momento.';

  @override
  String published(int year) {
    return 'Pubblicato nel $year';
  }

  @override
  String get publicationDateUnknown => 'Data di pubblicazione sconosciuta';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Stagioni',
      one: '1 Stagione',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Termina alle $time';
  }

  @override
  String get items => 'Elementi';

  @override
  String get extras => 'Contenuti extra';

  @override
  String get additionalParts => 'Parti Aggiuntive';

  @override
  String get behindTheScenes => 'Dietro le quinte';

  @override
  String get deletedScenes => 'Scene eliminate';

  @override
  String get featurettes => 'Contenuti speciali';

  @override
  String get interviews => 'Interviste';

  @override
  String get scenes => 'Scene';

  @override
  String get shorts => 'Cortometraggi';

  @override
  String get trailers => 'Trailer';

  @override
  String timeRemaining(String time) {
    return '$time rimanenti';
  }

  @override
  String endsIn(String time) {
    return 'Termina tra $time';
  }

  @override
  String get view => 'Visualizza';

  @override
  String get resumeReading => 'Riprendi Lettura';

  @override
  String get read => 'Leggi';

  @override
  String resumeFrom(String position) {
    return 'Riprendi da $position';
  }

  @override
  String get play => 'Riproduci';

  @override
  String get startOver => 'Ricomincia';

  @override
  String get restart => 'Riavvia';

  @override
  String get readOffline => 'Leggi Offline';

  @override
  String get playOffline => 'Riproduci Offline';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Sottotitoli';

  @override
  String get version => 'Versione';

  @override
  String get cast => 'Trasmetti';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Completato';

  @override
  String get favorited => 'Nei Preferiti';

  @override
  String get favorite => 'Preferito';

  @override
  String get playlist => 'Playlist';

  @override
  String get downloaded => 'Scaricato';

  @override
  String get finalizingDownload => 'Finalizzazione…';

  @override
  String get queuedDownload => 'In coda';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Altri $count in coda',
      one: 'Altro 1 in coda',
    );
    return '$_temp0';
  }

  @override
  String get downloadAll => 'Scarica Tutto';

  @override
  String get download => 'Scarica';

  @override
  String get deleteDownloaded => 'Elimina Scaricato';

  @override
  String get goToSeries => 'Vai alla Serie';

  @override
  String get editMetadata => 'Modifica Metadati';

  @override
  String get less => 'Meno';

  @override
  String get more => 'Altro';

  @override
  String get deleteItem => 'Elimina Elemento';

  @override
  String get deletePlaylist => 'Elimina Playlist';

  @override
  String get deletePlaylistMessage => 'Eliminare questa playlist dal server?';

  @override
  String get deleteItemMessage => 'Eliminare questo elemento dal server?';

  @override
  String get failedToDeletePlaylist => 'Impossibile eliminare la playlist';

  @override
  String get failedToDeleteItem => 'Impossibile eliminare l\'elemento';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'L’operazione di eliminazione non è riuscita con il seguente errore: $error';
  }

  @override
  String get renamePlaylist => 'Rinomina Playlist';

  @override
  String get playlistName => 'Nome playlist';

  @override
  String get deleteDownloadedAlbum => 'Elimina Album Scaricato';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Eliminare le tracce scaricate di \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Tracce scaricate eliminate';

  @override
  String get downloadedTracksDeleteFailed =>
      'Alcune tracce scaricate non possono essere eliminate';

  @override
  String get noTracksLoaded => 'Nessuna traccia caricata';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Nessun $itemLabel caricato';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Download di $title ($count elementi) in corso…';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Sei sicuro di voler eliminare \"$name\" dal server? Questa operazione non può essere annullata.';
  }

  @override
  String get itemDeleted => 'Elemento eliminato';

  @override
  String get noPlayableTrailerFound => 'Nessun trailer riproducibile trovato.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Formato del libro non supportato: $extension';
  }

  @override
  String get audioTrack => 'Traccia Audio';

  @override
  String get noOtherAudioTracks => 'Nessun\'altra traccia audio';

  @override
  String get subtitleTrack => 'Traccia Sottotitoli';

  @override
  String get none => 'Nessuno';

  @override
  String get downloadSubtitlesLabel => 'Scarica sottotitoli…';

  @override
  String get searchOpenSubtitlesPlugin => 'Cerca con OpenSubtitles';

  @override
  String get downloadSubtitles => 'Scarica Sottotitoli';

  @override
  String get searchingSubtitles => 'Ricerca sottotitoli…';

  @override
  String get fetchingSubtitles => 'Caricamento sottotitoli';

  @override
  String get downloadingSubtitle => 'Download del sottotitolo in corso…';

  @override
  String get selectedSubtitleInvalid =>
      'Il sottotitolo selezionato non è valido.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Sottotitolo scaricato e selezionato: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Sottotitolo scaricato. Potrebbe volerci un momento prima che appaia mentre Jellyfin aggiorna l\'elemento.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nessun sottotitolo remoto trovato per $language.';
  }

  @override
  String get selectVersion => 'Seleziona Versione';

  @override
  String versionNumber(int number) {
    return 'Versione $number';
  }

  @override
  String get downloadAllQuality => 'Scarica Tutto — Qualità';

  @override
  String get downloadQuality => 'Qualità Download';

  @override
  String get originalFileNoReencoding => 'File originale, nessuna ri-codifica';

  @override
  String get originalFilesNoReencoding => 'File originali, nessuna ri-codifica';

  @override
  String get noEpisodesLoaded => 'Nessun episodio caricato';

  @override
  String get downloadScopeTitle => 'Cosa scaricare';

  @override
  String get downloadAllEpisodes => 'Tutti gli episodi';

  @override
  String get downloadUnwatchedEpisodes => 'Tutti gli episodi non visti';

  @override
  String get downloadAllMovies => 'Tutti i film';

  @override
  String get downloadUnwatchedMovies => 'Tutti i film non visti';

  @override
  String get downloadScopeLoading => 'Caricamento elementi…';

  @override
  String get downloadScopeLoadFailed =>
      'Impossibile caricare gli elementi da scaricare';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size in totale';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received di $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size in totale';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count sconosciuti';
  }

  @override
  String downloadingItem(String name, String quality) {
    return 'Download di $name ($quality) in corso…';
  }

  @override
  String get deleteDownloadedFiles => 'Elimina File Scaricati';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Eliminare i file locali di $typeLabel?\n\nQuesto libererà spazio di archiviazione. Potrai scaricarli nuovamente in seguito.';
  }

  @override
  String get downloadedFilesDeleted => 'File scaricati eliminati';

  @override
  String get failedToDeleteFiles => 'Impossibile eliminare i file';

  @override
  String get deleteFiles => 'Elimina File';

  @override
  String get director => 'REGISTA';

  @override
  String get starring => 'CON';

  @override
  String get directors => 'REGISTI';

  @override
  String get writer => 'SCENEGGIATORE';

  @override
  String get writers => 'SCENEGGIATORI';

  @override
  String get episodeDirector => 'Regista dell\'Episodio';

  @override
  String episodeDirectorWithRole(String role) {
    return '$role (Regista dell\'Episodio)';
  }

  @override
  String get episodeWriter => 'Sceneggiatore dell\'Episodio';

  @override
  String episodeWriterWithRole(String role) {
    return '$role (Sceneggiatore dell\'Episodio)';
  }

  @override
  String get guestStar => 'Guest Star';

  @override
  String guestStarWithRole(String role) {
    return '$role (Guest Star)';
  }

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count altri';
  }

  @override
  String totalEpisodes(int count) {
    return '$count episodi';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episodio $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Capitolo $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracce',
      one: '1 traccia',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capitoli',
      one: '1 capitolo',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Nato il $date';
  }

  @override
  String died(String date) {
    return 'Morto il $date';
  }

  @override
  String age(int age) {
    return 'Età: $age';
  }

  @override
  String get showLess => 'Mostra Meno';

  @override
  String get readMore => 'Leggi Tutto';

  @override
  String get shuffle => 'Casuale';

  @override
  String get shuffleAll => 'Riproduci Tutto in Casuale';

  @override
  String get shuffleAllMusic => 'Riproduci tutta la musica in ordine casuale';

  @override
  String get carSignInPrompt => 'Accedi a Moonfin dal tuo telefono';

  @override
  String get carServerUnreachable => 'Impossibile raggiungere il tuo server';

  @override
  String downloadsCount(int count) {
    return '$count download';
  }

  @override
  String get perfectMatch => 'Corrispondenza perfetta';

  @override
  String get aiTranslated => 'Tradotto dall\' IA';

  @override
  String get machineTranslated => 'Traduzione Automatica';

  @override
  String get hearingImpaired => 'SDH';

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
    return 'L\'operazione sui sottotitoli remoti ($action) richiede il permesso di gestione dei sottotitoli di Jellyfin per questo utente.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Questo elemento non è stato trovato sul server per l\'operazione sui sottotitoli remoti ($action).';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Operazione sui sottotitoli remoti ($action) non riuscita: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Operazione sui sottotitoli remoti ($action) non riuscita (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Impossibile $action i sottotitoli remoti.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'tutti gli episodi scaricati di \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'tutti gli episodi scaricati di questa stagione';

  @override
  String get stillWatching => 'Stai ancora guardando?';

  @override
  String get unableToLoadTrailerStream =>
      'Impossibile caricare lo stream del trailer.';

  @override
  String get trailerTimedOut => 'Timeout durante il caricamento del trailer.';

  @override
  String get playbackFailedForTrailer =>
      'Riproduzione fallita per questo trailer.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'Il casting non è disponibile durante la riproduzione offline.';

  @override
  String castActionFailed(String label, String error) {
    return 'Operazione \"$label\" non riuscita: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Impossibile impostare il volume del dispositivo Cast: $error';
  }

  @override
  String castControlsTitle(String label) {
    return 'Controlli di $label';
  }

  @override
  String get deviceVolume => 'Volume Dispositivo';

  @override
  String get unavailable => 'Non disponibile';

  @override
  String get pause => 'Pausa';

  @override
  String get syncPosition => 'Sincronizza Posizione';

  @override
  String stopCast(String label) {
    return 'Interrompi $label';
  }

  @override
  String get queueIsEmpty => 'La coda è vuota';

  @override
  String trackNumber(int number) {
    return 'Traccia $number';
  }

  @override
  String get remotePlayback => 'Riproduzione Remota';

  @override
  String get castingToGoogleCast => 'Trasmissione su Google Cast';

  @override
  String get castingViaAirPlay => 'Trasmissione via AirPlay';

  @override
  String get castingViaDlna => 'Trasmissione via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds secondi';
  }

  @override
  String get longPressToUnlock => 'Premi a lungo per sbloccare';

  @override
  String get off => 'Disattivati';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automatico';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Ritardo Audio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Ritardo Sottotitoli';

  @override
  String get reset => 'Ripristina';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get playbackInformation => 'Informazioni Riproduzione';

  @override
  String get showMpvStats => 'Mostra Statistiche mpv (Shift+I)';

  @override
  String get hideMpvStats => 'Nascondi Statistiche mpv (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Scorciatoie da tastiera';

  @override
  String get keyboardShortcutsSubtitle =>
      'Tasti per l\'app, il lettore video e il lettore di libri';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Premi ? o F1 durante la riproduzione di un video per vedere questo elenco senza uscire dal lettore.';

  @override
  String get keyboardShortcutsSectionApp => 'Ovunque';

  @override
  String get keyboardShortcutsSectionAppScope => 'In qualsiasi schermata';

  @override
  String get keyboardShortcutsSectionPlayer => 'Lettore video';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'Con un video aperto, in riproduzione o in pausa';

  @override
  String get keyboardShortcutsSectionReader => 'Lettore di libri e fumetti';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'Durante la lettura di un libro o fumetto';

  @override
  String get keyNameArrowKeys => 'Tasti freccia';

  @override
  String get keyNameSpace => 'Spazio';

  @override
  String get keyNameEnter => 'Invio';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

  @override
  String get keyNameDelete => 'Canc';

  @override
  String get keyNamePageUp => 'Pag Su';

  @override
  String get keyNamePageDown => 'Pag Giù';

  @override
  String get keyNameHome => 'Home';

  @override
  String get keyNameEnd => 'Fine';

  @override
  String get keyNameShift => 'Shift';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => 'Rotella del mouse';

  @override
  String get shortcutMoveFocus => 'Spostati tra gli elementi';

  @override
  String get shortcutActivate => 'Apri l\'elemento selezionato';

  @override
  String get shortcutGoBack => 'Torna indietro';

  @override
  String get shortcutToggleFullscreen => 'Attiva/disattiva schermo intero';

  @override
  String get shortcutQuit => 'Esci da Moonfin';

  @override
  String get shortcutPlayPause => 'Riproduci o metti in pausa';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Mostra i controlli, oppure riproduci/pausa se visibili';

  @override
  String get shortcutSeekBack =>
      'Riavvolgi (tieni premuto per salti più lunghi)';

  @override
  String get shortcutSeekForward =>
      'Avanti veloce (tieni premuto per salti più lunghi)';

  @override
  String get shortcutVolumeUp => 'Alza il volume';

  @override
  String get shortcutVolumeDown => 'Abbassa il volume';

  @override
  String get shortcutMute => 'Attiva/disattiva l\'audio';

  @override
  String get shortcutToggleSubtitles => 'Attiva/disattiva i sottotitoli';

  @override
  String get shortcutSlower => 'Rallenta';

  @override
  String get shortcutFaster => 'Accelera';

  @override
  String get shortcutPlaybackInfo => 'Mostra le informazioni di riproduzione';

  @override
  String get shortcutMpvStats => 'Attiva/disattiva le statistiche mpv';

  @override
  String get shortcutRecropBlackBars => 'Ritaglia di nuovo le bande nere';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Esci da schermo intero, oppure interrompi se non a schermo intero';

  @override
  String get shortcutHideControls => 'Nascondi i controlli';

  @override
  String get shortcutStopPlayback => 'Interrompi la riproduzione';

  @override
  String get shortcutNextItem => 'Elemento successivo';

  @override
  String get shortcutPreviousItem => 'Elemento precedente';

  @override
  String get shortcutSkipSegment =>
      'Salta intro o titoli di coda quando proposto';

  @override
  String get shortcutShowShortcuts => 'Mostra questo elenco';

  @override
  String get shortcutNextPage => 'Pagina successiva';

  @override
  String get shortcutPreviousPage => 'Pagina precedente';

  @override
  String get shortcutScrollPage => 'Scorri la pagina (ebook)';

  @override
  String get shortcutFirstPage => 'Prima pagina, o inizio del capitolo';

  @override
  String get shortcutLastPage => 'Ultima pagina, o fine del capitolo';

  @override
  String get shortcutZoom => 'Aumenta o riduci lo zoom (fumetti)';

  @override
  String get shortcutResetZoom => 'Ripristina lo zoom (fumetti)';

  @override
  String get playback => 'Riproduzione';

  @override
  String get playMethod => 'Metodo Riproduzione';

  @override
  String get directPlay => 'Riproduzione Diretta';

  @override
  String get directStream => 'Stream Diretto';

  @override
  String get transcoding => 'Transcodifica';

  @override
  String get transcodeReasons => 'Motivi Transcodifica';

  @override
  String get player => 'Lettore';

  @override
  String get container => 'Contenitore';

  @override
  String get bitrate => 'Bitrate';

  @override
  String get video => 'Video';

  @override
  String get resolution => 'Risoluzione';

  @override
  String get hdr => 'HDR';

  @override
  String get videoRenderer => 'Renderer Video';

  @override
  String get videoRendererDescription =>
      'Finestra nativa offre il movimento più fluido e invia l\'HDR allo schermo senza modifiche. Prova un\'altra opzione se il video non funziona bene.';

  @override
  String get videoRendererNativeWindow => 'Finestra nativa (consigliata)';

  @override
  String get videoRendererNativeHdrOnly => 'Finestra nativa solo per HDR';

  @override
  String get videoRendererInApp => 'Nell\'app (precedente)';

  @override
  String get track => 'Traccia';

  @override
  String get channels => 'Canali';

  @override
  String get format => 'Formato';

  @override
  String get external => 'Esterno';

  @override
  String get embedded => 'Incorporato';

  @override
  String castSessionError(String protocol) {
    return 'Errore sessione $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Impossibile caricare i dettagli del libro: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'La visualizzazione EPUB nell\'app non è ancora disponibile su questa piattaforma.';

  @override
  String get bookReadingUnavailableTitle =>
      'I libri non si possono leggere su Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Aprilo in Moonfin su un telefono, un tablet o un computer per leggerlo. Gli audiolibri si possono comunque ascoltare qui.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Questo formato (.$extension) non può ancora essere visualizzato nell\'app.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'La visualizzazione di documenti incorporati non è disponibile su questa piattaforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'Impossibile aprire il visualizzatore esterno.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Impossibile aprire il lettore integrato: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Segnalibro già salvato a $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Segnalibro aggiunto: $label';
  }

  @override
  String get noBookmarksYet =>
      'Nessun segnalibro ancora.\nTocca l\'icona del segnalibro durante la lettura per salvare la tua posizione.';

  @override
  String get noTableOfContentsAvailable => 'Indice non disponibile';

  @override
  String pageLabel(int number) {
    return 'Pagina $number';
  }

  @override
  String get position => 'Posizione';

  @override
  String get bookReader => 'Lettore di Libri';

  @override
  String formatExtension(String extension) {
    return 'Formato: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% letto';
  }

  @override
  String get updating => 'Aggiornamento…';

  @override
  String get markUnread => 'Segna come Non Letto';

  @override
  String get markAsRead => 'Segna come Letto';

  @override
  String get reloadReader => 'Ricarica Lettore';

  @override
  String get noPagesFound => 'Nessuna pagina trovata.';

  @override
  String get failedToDecodePageImage =>
      'Impossibile decodificare l\'immagine della pagina.';

  @override
  String resetZoom(String zoom) {
    return 'Reimposta Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Pagina Singola';

  @override
  String get twoPageSpread => 'Doppia Pagina';

  @override
  String get addBookmark => 'Aggiungi Segnalibro';

  @override
  String get bookmarksEllipsis => 'Segnalibri…';

  @override
  String get markedAsRead => 'Segnato come letto';

  @override
  String get markedAsUnread => 'Segnato come non letto';

  @override
  String failedToUpdateReadState(String error) {
    return 'Impossibile aggiornare lo stato di lettura: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Chiaro';

  @override
  String get themeDark => 'Tema: Scuro';

  @override
  String get themeSepia => 'Tema: Seppia';

  @override
  String get invertColorsFixedLayout => 'Inverti Colori (layout fisso)';

  @override
  String get invertColorsPdf => 'Inverti Colori (PDF)';

  @override
  String get preparingInAppReader => 'Preparazione del lettore integrato…';

  @override
  String get pdfDataNotAvailable => 'Dati PDF non disponibili.';

  @override
  String get readerFallbackModeActive => 'Modalità lettore di riserva attiva';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Questa piattaforma non supporta il motore di visualizzazione integrato per i file $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Usa Ricarica Lettore dopo il passaggio a una piattaforma supportata (Android, iOS, macOS).';

  @override
  String get openExternally => 'Apri Esternamente';

  @override
  String get noEpubChaptersFound => 'Nessun capitolo EPUB trovato.';

  @override
  String get readerNotReady => 'Lettore non pronto.';

  @override
  String get seriesRecordings => 'Registrazioni Serie';

  @override
  String get now => 'Ora';

  @override
  String get sports => 'Sport';

  @override
  String get news => 'Notizie';

  @override
  String get kids => 'Bambini';

  @override
  String get premiere => 'Prima Visione';

  @override
  String get guideRepeatBadge => 'Replica';

  @override
  String get guideTimeline => 'Timeline Guida';

  @override
  String failedToLoadGuide(String error) {
    return 'Impossibile caricare la guida: $error';
  }

  @override
  String get noChannelsFound => 'Nessun canale trovato';

  @override
  String get noProgramData => 'Nessun dato sul programma';

  @override
  String get liveBadge => 'IN ONDA';

  @override
  String get liveTvJumpToLive => 'Vai alla Diretta';

  @override
  String guideNextProgram(String time, String title) {
    return 'Prossimo: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Mancano $minutes min';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Mancano $hours ore';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Mancano $hours ore e $minutes min';
  }

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Rimosso dai canali preferiti';

  @override
  String get addedToFavoriteChannels => 'Aggiunto ai canali preferiti';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Impossibile aggiornare il canale preferito';

  @override
  String get unfavoriteChannel => 'Rimuovi Canale dai Preferiti';

  @override
  String get favoriteChannel => 'Canale Preferito';

  @override
  String get record => 'Registra';

  @override
  String nextSeriesRecording(String dateTime) {
    return 'Prossima registrazione della serie: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'La registrazione della serie è programmata, ma la guida non ha episodi in arrivo';

  @override
  String get seriesRecordingSkipsShowing =>
      'La registrazione della serie salterà questa trasmissione';

  @override
  String get seriesRecordingEpisodesQuestion =>
      'Quali episodi vuoi registrare?';

  @override
  String get seriesRecordingAllEpisodes => 'Tutti gli Episodi';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Ogni trasmissione, repliche comprese';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Episodi Non Ancora Registrati';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Salta gli episodi già presenti nella tua libreria e registra ogni episodio una sola volta';

  @override
  String get seriesRecordingNewEpisodesOnly => 'Solo Nuovi Episodi';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'Solo prime trasmissioni, niente repliche';

  @override
  String get seriesRecordingSettings => 'Impostazioni Serie';

  @override
  String get seriesRecordingUpdated => 'Registrazione serie aggiornata';

  @override
  String get failedToUpdateSeriesRecording =>
      'Impossibile aggiornare la registrazione della serie';

  @override
  String get recordCurrentEpisode => 'Registra Questo Episodio';

  @override
  String get recordCurrentProgram => 'Registra Questo Programma';

  @override
  String get cancelCurrentRecording => 'Annulla Questa Registrazione';

  @override
  String get cancelRecordingAction => 'Annulla registrazione';

  @override
  String get programSetToRecord => 'Programma impostato per la registrazione';

  @override
  String get recordingCancelled => 'Registrazione annullata';

  @override
  String get unableToCreateRecording => 'Impossibile creare la registrazione';

  @override
  String get recordSeries => 'Registra Serie';

  @override
  String get seriesSetToRecord => 'Serie impostata per la registrazione';

  @override
  String get seriesRecordingCancelled => 'Registrazione serie annullata';

  @override
  String get unableToCreateSeriesRecording =>
      'Impossibile creare la registrazione della serie';

  @override
  String get watch => 'Guarda';

  @override
  String get watchChannelLive => 'Guarda il canale in diretta';

  @override
  String get close => 'Chiudi';

  @override
  String failedToPlayChannel(String name) {
    return 'Impossibile riprodurre $name';
  }

  @override
  String get playbackStreamLost =>
      'La riproduzione si è interrotta e non è stato possibile ripristinarla.';

  @override
  String get playbackVideoUnsupported =>
      'Questo dispositivo non può riprodurre il formato di questo video. Prova un lettore esterno.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Riconnessione… ($attempt di $total)';
  }

  @override
  String playerMatchingDisplayRate(String fps) {
    return 'Adattamento dello schermo a $fps fps…';
  }

  @override
  String get failedToLoadRecordings => 'Impossibile caricare le registrazioni';

  @override
  String get scheduledInNext24Hours => 'Programmati nelle Prossime 24 Ore';

  @override
  String get recentRecordings => 'Registrazioni Recenti';

  @override
  String get tvSeries => 'Serie TV';

  @override
  String get failedToLoadSchedule => 'Impossibile caricare la programmazione';

  @override
  String get noScheduledRecordings => 'Nessuna registrazione programmata';

  @override
  String get cancelRecording => 'Annullare la Registrazione?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Annullare la registrazione programmata di \"$name\"?';
  }

  @override
  String get no => 'No';

  @override
  String get yesCancel => 'Sì, Annulla';

  @override
  String get failedToCancelRecording =>
      'Impossibile annullare la registrazione';

  @override
  String get failedToLoadSeriesRecordings =>
      'Impossibile caricare le registrazioni delle serie';

  @override
  String get noSeriesRecordings => 'Nessuna registrazione di serie';

  @override
  String get cancelSeriesRecording => 'Annulla Registrazione Serie';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Annullare la Registrazione Serie?';

  @override
  String stopRecordingName(String name) {
    return 'Interrompere la registrazione di \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Impossibile annullare la registrazione della serie';

  @override
  String get searchThisLibrary => 'Cerca in questa libreria…';

  @override
  String get searchEllipsis => 'Cerca…';

  @override
  String noResultsForQuery(String query) {
    return 'Nessun risultato per \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Ricerca non riuscita: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Tipo di account Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Locale';

  @override
  String get savedMedia => 'Download';

  @override
  String get tvShows => 'Serie TV';

  @override
  String get music => 'Musica';

  @override
  String get musicAlbums => 'Album Musicali';

  @override
  String get noMediaInFilter => 'Nessun media in questo filtro';

  @override
  String get noDownloadedMediaYet => 'Nessun media scaricato ancora';

  @override
  String get browseLibrary => 'Sfoglia Libreria';

  @override
  String get deleteDownload => 'Elimina Download';

  @override
  String removeItemAndFiles(String name) {
    return 'Rimuovere \"$name\" e i relativi file?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracce';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Riproduci Album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Impossibile caricare l\'album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nessuna traccia scaricata trovata per $name.';
  }

  @override
  String get season => 'Stagione';

  @override
  String get errorLoadingEpisodes => 'Errore nel caricamento degli episodi';

  @override
  String get noDownloadedEpisodes => 'Nessun episodio scaricato';

  @override
  String get deleteEpisode => 'Elimina Episodio';

  @override
  String removeName(String name) {
    return 'Rimuovere \"$name\"?';
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
    return 'Episodio $number';
  }

  @override
  String get seriesNotFound => 'Serie non trovata';

  @override
  String get errorLoadingSeries => 'Errore nel caricamento della serie';

  @override
  String get downloadedEpisodes => 'Episodi Scaricati';

  @override
  String seasonNumber(int number) {
    return 'Stagione $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Speciali';

  @override
  String get deleteSeason => 'Elimina Stagione';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Eliminare tutti gli episodi scaricati in $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodi',
      one: '1 episodio',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Gestione Archiviazione';

  @override
  String get storageBreakdown => 'Dettaglio Archiviazione';

  @override
  String get downloadedItems => 'Elementi Scaricati';

  @override
  String get activeDownloads => 'Download Attivi';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used di $limit';
  }

  @override
  String get savedMediaSelectItems => 'Seleziona elementi';

  @override
  String get savedMediaNoDownloads => 'Ancora nulla di salvato';

  @override
  String get savedMediaNoDownloadsDetail =>
      'I download che avvii compaiono qui e si riproducono senza connessione.';

  @override
  String get savedMediaNoActiveDownloads =>
      'Nessun download in corso al momento';

  @override
  String get savedMediaNoResults => 'Nessun download corrisponde alla ricerca';

  @override
  String get savedMediaPlayFromStart => 'Riproduci dall\'inizio';

  @override
  String get savedMediaGoToDetails => 'Vai ai dettagli';

  @override
  String get savedMediaDeleteDownload => 'Elimina download';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Elimina $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Elimina $count episodi',
      one: 'Elimina 1 episodio',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Apri serie';

  @override
  String get savedMediaPlayNextUnwatched => 'Riproduci il prossimo non visto';

  @override
  String get savedMediaRead => 'Leggi';

  @override
  String get savedMediaCancelDownload => 'Annulla download';

  @override
  String get sortBySize => 'Dimensione';

  @override
  String get sortByName => 'Nome';

  @override
  String get sortByDateAdded => 'Data di aggiunta';

  @override
  String get storageLimit => 'Limite Archiviazione';

  @override
  String get noLimit => 'Nessun limite';

  @override
  String get deleteAllDownloads => 'Elimina Tutti i Download';

  @override
  String get deleteAllDownloadsWarning =>
      'Questo rimuoverà tutti i file media scaricati e non può essere annullato.';

  @override
  String get deleteAll => 'Elimina Tutto';

  @override
  String get deleteSelected => 'Elimina Selezionati';

  @override
  String deleteSelectedCount(int count) {
    return 'Eliminare $count elementi scaricati?';
  }

  @override
  String get musicAndAudiobooks => 'Musica e Audiolibri';

  @override
  String get images => 'Immagini';

  @override
  String get database => 'Database';

  @override
  String ofStorageLimit(String limit) {
    return 'di $limit totali';
  }

  @override
  String get settings => 'Impostazioni';

  @override
  String get settingsSearchHint => 'Cerca nelle impostazioni';

  @override
  String get authentication => 'Autenticazione';

  @override
  String get autoLoginServerManagement => 'Accesso automatico, gestione server';

  @override
  String get pinCode => 'Codice PIN';

  @override
  String get setUpPinCodeProtection => 'Imposta la protezione con codice PIN';

  @override
  String get parentalControls => 'Controllo Genitori';

  @override
  String get contentRatingRestrictions =>
      'Restrizioni classificazione contenuti';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, risoluzione, comportamento';

  @override
  String get languageSizeAppearance => 'Lingua, dimensione, aspetto';

  @override
  String get qualityStorage => 'Qualità, archiviazione';

  @override
  String get mediaRequestIntegration => 'Integrazione richieste media';

  @override
  String get switchServer => 'Cambia Server';

  @override
  String get signOut => 'Esci';

  @override
  String get versionLicenses => 'Versione, licenze';

  @override
  String get account => 'Account';

  @override
  String get signInAndSecurity => 'Accesso e sicurezza';

  @override
  String get administration => 'Amministrazione';

  @override
  String get serverSettingsUsersLibraries =>
      'Impostazioni server, utenti, librerie';

  @override
  String get customization => 'Personalizzazione';

  @override
  String get themeAndLayout => 'Tema e layout';

  @override
  String get videoAndSubtitles => 'Video e sottotitoli';

  @override
  String get pluginAndRequests => 'Plugin e richieste';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalizza account, riproduzione e comportamento interfaccia';

  @override
  String optionsCount(int count) {
    return '$count opzioni';
  }

  @override
  String get themeAndAppearance => 'Tema e Aspetto';

  @override
  String get focusBorderColor => 'Colore Bordo Focus';

  @override
  String get watchedIndicators => 'Indicatori Visti';

  @override
  String get showPosterLabels => 'Etichette Poster';

  @override
  String get showPosterLabelsSubtitle =>
      'Mostra le etichette sui poster, come 4K o HDR.';

  @override
  String get always => 'Sempre';

  @override
  String get mixedRowsOnly => 'Solo righe miste';

  @override
  String get hideUnwatched => 'Nascondi Non Visti';

  @override
  String get episodesOnly => 'Solo Episodi';

  @override
  String get never => 'Mai';

  @override
  String get focusExpansionAnimation => 'Animazione Espansione Focus';

  @override
  String get desktopUiScale => 'Scala dell\'interfaccia utente desktop';

  @override
  String get scaleFocusedCards =>
      'Ingrandisci le schede e i riquadri in focus o hover';

  @override
  String get seriesThumbnails => 'Miniature Serie';

  @override
  String get seriesThumbnailsDescription =>
      'Solo episodi: usa le immagini della serie corrispondenti al tipo di immagine di ogni riga.';

  @override
  String get homeRowInfoOverlay => 'Overlay Info Righe Home';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Mostra titolo e metadati durante la navigazione delle righe home';

  @override
  String get clockDisplay => 'Visualizzazione Orologio';

  @override
  String get inMenus => 'Nei Menu';

  @override
  String get inVideo => 'Nel Video';

  @override
  String get seasonalEffects => 'Effetti Stagionali';

  @override
  String get seasonalEffectsDescription =>
      'Effetti visivi e decorazioni stagionali';

  @override
  String get loadingAnimation => 'Animazione di Caricamento';

  @override
  String get loadingAnimationDescription =>
      'Personalizza le animazioni di caricamento usate in Moonfin';

  @override
  String get loadingAnimationConfiguration =>
      'Configurazione Animazione di Caricamento';

  @override
  String get loadingAnimationImage => 'Immagine';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Logo Moonfin';

  @override
  String get loadingAnimationImageSpinner => 'Rotellina';

  @override
  String get loadingAnimationImageRunner => 'Runner';

  @override
  String get loadingAnimationImageMoonPhases => 'Fasi Lunari';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Fasi Moonfin';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Fasi Neonfin';

  @override
  String get loadingAnimationSize => 'Dimensione Animazione';

  @override
  String get loadingAnimationSizeThumbnail => 'Miniatura';

  @override
  String get loadingAnimationSizeSmall => 'Piccola';

  @override
  String get loadingAnimationSizeMedium => 'Media';

  @override
  String get loadingAnimationSizeLarge => 'Grande';

  @override
  String get loadingAnimationPosition => 'Posizione Animazione';

  @override
  String get loadingAnimationPositionTopLeft => 'In Alto a Sinistra';

  @override
  String get loadingAnimationPositionTopCenter => 'In Alto al Centro';

  @override
  String get loadingAnimationPositionTopRight => 'In Alto a Destra';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Al Centro a Sinistra';

  @override
  String get loadingAnimationPositionMiddle => 'Al Centro';

  @override
  String get loadingAnimationPositionMiddleRight => 'Al Centro a Destra';

  @override
  String get loadingAnimationPositionBottomLeft => 'In Basso a Sinistra';

  @override
  String get loadingAnimationPositionBottomCenter => 'In Basso al Centro';

  @override
  String get loadingAnimationPositionBottomRight => 'In Basso a Destra';

  @override
  String get loadingAnimationPositionBouncing => 'Rimbalzante';

  @override
  String get loadingAnimationSpeed => 'Velocità Animazione';

  @override
  String get loadingAnimationSpeedSlow => 'Lenta';

  @override
  String get loadingAnimationSpeedModerate => 'Moderata';

  @override
  String get loadingAnimationSpeedFast => 'Veloce';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Mostra Testo';

  @override
  String get loadingAnimationPreview => 'Anteprima';

  @override
  String get snow => 'Neve';

  @override
  String get fireworks => 'Fuochi d\'Artificio';

  @override
  String get confetti => 'Coriandoli';

  @override
  String get fallingLeaves => 'Foglie Cadenti';

  @override
  String get seasonalChristmas => 'Natale';

  @override
  String get seasonalPetals => 'Petali di Primavera';

  @override
  String get seasonalFireflies => 'Lucciole';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Densità';

  @override
  String get seasonalDensityLight => 'Leggera';

  @override
  String get seasonalDensityNormal => 'Normale';

  @override
  String get seasonalDensityHeavy => 'Intensa';

  @override
  String get seasonalFollower => 'Segui Focus';

  @override
  String get seasonalFollowerDescription =>
      'Un oggetto delle festività, come la planchette di Halloween, segue ciò che selezioni nella Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'Un oggetto delle festività, come la planchette di Halloween, sostituisce il puntatore del mouse nella Home';

  @override
  String get seasonalRow => 'Riga Stagionale';

  @override
  String get seasonalRowDescription =>
      'Mostra una riga di film delle festività dalla tua libreria, con suggerimenti di Seerr quando disponibili.';

  @override
  String get seasonalRowSubtitle => 'Stagionale';

  @override
  String get seasonalRowCountry => 'Paese';

  @override
  String get seasonalRowCountryAuto => 'Automatico';

  @override
  String get countryUnitedStates => 'Stati Uniti';

  @override
  String get countryCanada => 'Canada';

  @override
  String get seasonalRowCountryOther => 'Altro';

  @override
  String get seasonalRowHolidays => 'Festività';

  @override
  String get seasonalRowHolidaysHint =>
      'Deseleziona una festività per nasconderne la riga.';

  @override
  String get seasonalRowAllYear => 'Mostra Tutto l\'Anno';

  @override
  String get seasonalRowAllYearDescription =>
      'Mostra una riga delle festività anche fuori stagione, ogni giorno una diversa tra quelle selezionate.';

  @override
  String get holidayNewYear => 'Capodanno';

  @override
  String get holidayValentines => 'San Valentino';

  @override
  String get holidayEaster => 'Pasqua';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Festa del Ringraziamento';

  @override
  String get holidayChristmas => 'Film di Natale';

  @override
  String get holidayLunarNewYear => 'Capodanno Lunare';

  @override
  String get holidayDiwali => 'Diwali';

  @override
  String get themeMusic => 'Musica Tema';

  @override
  String get playThemeMusicOnDetailPages =>
      'Riproduci musica tema nelle pagine di dettaglio';

  @override
  String get themeMusicVolume => 'Volume Musica Tema';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Musica Tema nelle Righe Home';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Riproduci durante la navigazione della schermata home';

  @override
  String get loopThemeMusic => 'Ripeti Musica Tema';

  @override
  String get loopThemeMusicSubtitle =>
      'Ripeti la traccia invece di riprodurla una sola volta';

  @override
  String get detailsBackgroundBlur => 'Sfocatura Sfondo';

  @override
  String get detailsBackgroundOpacity => 'Opacità sfondo';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Sfocatura Sfondo Navigazione';

  @override
  String get maxStreamingBitrate => 'Bitrate Massimo Streaming';

  @override
  String get maxResolution => 'Risoluzione Massima';

  @override
  String get playerZoomMode => 'Modalità Zoom Lettore';

  @override
  String get settingsScrollWheelAction => 'Rotella del mouse';

  @override
  String get settingsScrollWheelActionDescription =>
      'Scegli cosa fa la rotella del mouse quando la usi sul video durante la riproduzione.';

  @override
  String get scrollWheelActionOff => 'Disattivato';

  @override
  String get scrollWheelActionSeek => 'Ricerca (avanti / indietro)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Adatta';

  @override
  String get autoCrop => 'Zoom per riempire';

  @override
  String get cropBlackBars => 'Ritaglia Bande Nere';

  @override
  String get settingsCropBlackBarsDescription =>
      'Rileva le bande nere codificate nel video dopo l\'avvio della riproduzione, le ritaglia e riempie lo schermo. Puoi ripetere il ritaglio dal pulsante zoom del lettore.';

  @override
  String get cropBlackBarsRecropInterval => 'Intervallo di Ritaglio';

  @override
  String get cropBlackBarsOnce => 'Una volta all\'avvio';

  @override
  String get cropBlackBarsEverySecond => 'Ogni secondo';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Segue i cambi di formato durante la riproduzione.';

  @override
  String get playerRecroppingBlackBars => 'Nuovo ritaglio delle bande nere';

  @override
  String get stretch => 'Estendi';

  @override
  String get refreshRateSwitching => 'Cambio Frequenza Aggiornamento';

  @override
  String get disabled => 'Disattivato';

  @override
  String get manual => 'Manuale';

  @override
  String get autoDetect => 'Rilevamento Automatico';

  @override
  String get scaleOnTv => 'Scala su TV';

  @override
  String get scaleOnDevice => 'Scala su Dispositivo';

  @override
  String get trickPlay => 'Trickplay';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Mostra miniature di anteprima durante lo scorrimento';

  @override
  String get trickplayDisplayStyleSingle => 'Miniatura Singola';

  @override
  String get trickplayDisplayStyleStrip => 'Pellicola';

  @override
  String get trickplayModeFull => 'Schermo Intero';

  @override
  String get trickplaySettingsPreviewHint =>
      'Trascina il cursore per provare l\'anteprima di scorrimento';

  @override
  String get trickplayPreviewScale => 'Dimensione Anteprima';

  @override
  String get trickplayVerticalOffset => 'Distanza dalla Barra di Scorrimento';

  @override
  String get trickplayFollowScrubPosition => 'Segui Posizione di Scorrimento';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'L\'anteprima scorre lungo la barra mentre ti sposti, invece di restare al centro';

  @override
  String get trickplayPauseWhileScrubbing => 'Pausa Durante lo Scorrimento';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'La riproduzione va in pausa mentre ti sposti e riprende quando premi play. Disattivala per continuare la riproduzione e saltare direttamente al nuovo punto';

  @override
  String get showDescriptionOnPause => 'Mostra Descrizione in Pausa';

  @override
  String get dimVideoShowOverview =>
      'Oscura il video e mostra il testo della panoramica in pausa';

  @override
  String get showChapterMarkers => 'Indicatori dei Capitoli';

  @override
  String get showChapterMarkersDescription =>
      'Segna l\'inizio di ogni capitolo sulla barra di scorrimento';

  @override
  String get osdLockButton => 'Pulsante Blocco OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostra un pulsante di blocco che blocca l\'input touch fino alla pressione prolungata';

  @override
  String get playerSwipeGestures => 'Swipe Volume e Luminosità';

  @override
  String get playerSwipeGesturesDescription =>
      'Scorri verso l\'alto o il basso sul player per modificare la luminosità a sinistra e il volume a destra';

  @override
  String get invertGestureIndicators => 'Inverti Indicatori dei Gesti';

  @override
  String get invertGestureIndicatorsDescription =>
      'Posiziona gli indicatori di luminosità e volume sullo stesso lato dello scorrimento o su quello opposto';

  @override
  String get gestureIndicatorSame => 'Stesso lato';

  @override
  String get gestureIndicatorInverted => 'Lato opposto';

  @override
  String get osdButtons => 'Pulsanti del Lettore';

  @override
  String get osdButtonsDescription =>
      'Scegli quali pulsanti mostrare nel lettore';

  @override
  String get osdButtonsSectionDescription =>
      'I controlli di riproduzione sono sempre visibili. Tutto il resto dipende da te e ogni tipo di dispositivo mantiene il proprio elenco.';

  @override
  String get detailButtons => 'Pulsanti Azione';

  @override
  String get detailButtonsDescription =>
      'Scegli quali pulsanti mostrare nella schermata dei dettagli';

  @override
  String get detailButtonsSectionDescription =>
      'Riproduci è sempre il primo e i pulsanti bloccati sono sempre visibili. Tutto il resto dipende da te e ogni tipo di dispositivo mantiene il proprio elenco.';

  @override
  String get actionButtonsOnScreen => 'Pulsanti Azione sullo Schermo';

  @override
  String get actionButtonsOnScreenDescription =>
      'Scegli quanti pulsanti azione mostrare prima di raggrupparli nel menu Altre Azioni.';

  @override
  String get actionButtonsOnScreenAuto => 'Automatico (Predefinito del Tema)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Solo Riproduci)';

  @override
  String get actionButtonsOnScreenAll => 'Tutti (Scorrimento Orizzontale)';

  @override
  String get detailMetadata => 'Riga Metadati';

  @override
  String get detailMetadataDescription =>
      'Scegli e riordina i metadati mostrati nella schermata dei dettagli';

  @override
  String get detailMetadataSectionDescription =>
      'Attiva o disattiva i metadati e scegli l\'ordine in cui compaiono nella schermata dei dettagli. Ogni tipo di dispositivo ha il proprio elenco.';

  @override
  String get detailMetadataYear => 'Anno di Uscita';

  @override
  String get detailMetadataParentalRating => 'Classificazione per Età';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Durata e Stagioni';

  @override
  String get detailMetadataStatus => 'Stato Serie';

  @override
  String get detailMetadataStatusSubtitle =>
      'Mostra se la serie è in corso, conclusa o rinnovata';

  @override
  String get detailMetadataGenres => 'Generi';

  @override
  String get detailMetadataSeerrAvailability => 'Disponibilità Seerr';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Mostra lo stato delle richieste e della disponibilità dei media da Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Episodi in Arrivo';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Usa Sonarr e TMDB per mostrare le prossime date di uscita';

  @override
  String get detailSections => 'Sezioni';

  @override
  String get detailSectionsDescription =>
      'Scegli quali parti della schermata Dettagli mostrare';

  @override
  String get detailSectionsScreenDescription =>
      'Sono elencate solo le sezioni che lo stile attuale della schermata Dettagli può mostrare. Nascondere una sezione la nasconde in tutti gli stili che la includono.';

  @override
  String get detailSectionGroupHeader => 'Intestazione';

  @override
  String get detailSectionGroupSections => 'Sezioni';

  @override
  String get detailSectionGroupPerson => 'Pagine delle persone';

  @override
  String get detailSectionGroupCollection => 'Pagine delle collezioni';

  @override
  String get detailSectionGroupOther => 'Altro';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle =>
      'Se disattivato, mostra il titolo come testo';

  @override
  String get detailSectionTagline => 'Slogan';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Badge versione';

  @override
  String get detailSectionUpNext => 'Prossimo';

  @override
  String get detailSectionLyrics => 'Testi';

  @override
  String get detailSectionCast => 'Cast';

  @override
  String get detailSectionCastSubtitle => 'Anche nelle pagine delle collezioni';

  @override
  String get detailSectionCrew => 'Registi e sceneggiatori';

  @override
  String get detailSectionStudios => 'Studi';

  @override
  String get detailSectionChapters => 'Capitoli';

  @override
  String get detailSectionExtras => 'Contenuti Extra';

  @override
  String get detailSectionCollections => 'Collezioni';

  @override
  String get detailSectionMoreLikeThis => 'Titoli Simili';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Anche album e artisti simili';

  @override
  String get detailSectionMoreEpisodes => 'Altri episodi';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'Nelle pagine degli episodi';

  @override
  String get detailSectionMediaInfo => 'Info media';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'File, stream e verifica della Riproduzione Diretta';

  @override
  String get detailSectionSeerrGenresTags => 'Generi e tag';

  @override
  String get detailSectionSeerrStats => 'Statistiche';

  @override
  String get detailSectionSeerrStreaming => 'Servizi di streaming';

  @override
  String get seerrStreamingOn => 'In streaming su';

  @override
  String get detailSectionSeerrRecommendations => 'Raccomandazioni';

  @override
  String get detailSectionSeerrSimilar => 'Titoli simili';

  @override
  String get detailSectionSeerrCollection => 'Banner della collezione';

  @override
  String get detailSectionSeerrPersonAppearances => 'Filmografia';

  @override
  String get detailSectionSeerrPersonCrew => 'Ruoli nella troupe';

  @override
  String get detailSectionPersonPagesSubtitle => 'Nelle pagine delle persone';

  @override
  String get detailSectionBiography => 'Biografia';

  @override
  String get detailSectionBirthplace => 'Luogo di nascita';

  @override
  String get detailSectionPersonLinks => 'Link';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB e social media';

  @override
  String get detailSectionGuestAppearances => 'Partecipazioni speciali';

  @override
  String get detailSectionMusicVideos => 'Video musicali';

  @override
  String get detailSectionPlaylistOrder => 'Ordine playlist';

  @override
  String get detailSectionBookGenres => 'Generi del libro';

  @override
  String get detailSectionPhotoExif => 'Dettagli foto';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Prossimo: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Oggi';

  @override
  String get upcomingEpisodeTomorrow => 'Domani';

  @override
  String get radarrCalendarRow => 'Film in Arrivo (Radarr)';

  @override
  String get sonarrCalendarRow => 'Serie TV in Arrivo (Sonarr)';

  @override
  String get mergedCalendarRow => 'Uscite in Arrivo';

  @override
  String get arrCalendarsRowSubtitle => 'Calendari Radarr e Sonarr';

  @override
  String get radarrCalendarRowSubtitle => 'Calendario Radarr';

  @override
  String get sonarrCalendarRowSubtitle => 'Calendario Sonarr';

  @override
  String calendarReleaseIn(int days, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Tra $days giorni',
      one: 'Domani',
      zero: 'Oggi',
    );
    return '$_temp0 ($date)';
  }

  @override
  String get calendarReleaseCinema => 'Cinema';

  @override
  String get calendarReleaseDigital => 'Digitale';

  @override
  String get calendarReleasePhysical => 'Fisico';

  @override
  String get upcomingCalendars => 'Calendari Uscite';

  @override
  String get upcomingCalendarsDescription =>
      'Scegli cosa mostrano le righe di Radarr e Sonarr.';

  @override
  String get radarrCalendarShowCinema => 'Mostra Uscite al Cinema in Arrivo';

  @override
  String get radarrCalendarShowDigital => 'Mostra Uscite Digitali in Arrivo';

  @override
  String get radarrCalendarShowPhysical => 'Mostra Uscite Fisiche in Arrivo';

  @override
  String get calendarShowReleaseDate =>
      'Mostra Data di Uscita nella Schermata Home';

  @override
  String get radarrCalendarHideDownloaded => 'Nascondi Film Già sul Server';

  @override
  String get sonarrCalendarShowEpisodeInfo => 'Mostra Informazioni Episodio';

  @override
  String get sonarrCalendarHideDownloaded => 'Nascondi Episodi Già sul Server';

  @override
  String get mergeRadarrSonarrCalendars => 'Unisci Calendari Sonarr e Radarr';

  @override
  String get moveUp => 'Sposta Su';

  @override
  String get moveDown => 'Sposta Giù';

  @override
  String get buttonOrderHint =>
      'Usa le frecce per cambiare l\'ordine. Con un telecomando, sinistra e destra spostano il pulsante evidenziato. Se ne disattivi uno, questo finisce in fondo all\'elenco.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Visibile solo quando sei in un gruppo SyncPlay';

  @override
  String get orientationLock => 'Blocco Orientamento';

  @override
  String get fullscreen => 'Schermo Intero';

  @override
  String get audioBehavior => 'Comportamento Audio';

  @override
  String get downmixToStereo => 'Downmix a Stereo';

  @override
  String get defaultAudioLanguage => 'Lingua Audio Predefinita';

  @override
  String get fallbackAudioLanguage => 'Lingua audio alternativa';

  @override
  String get preferDefaultAudioTrack =>
      'Preferisci la traccia audio predefinita';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferisci la traccia audio originale rispetto al doppiaggio localizzato.';

  @override
  String get preferAudioDescription =>
      'Preferisci le tracce di descrizione audio';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferisci le tracce di descrizione audio rispetto alle tracce normali.';

  @override
  String get autoServerDefault => 'Automatico (Predefinito Server)';

  @override
  String get english => 'Inglese';

  @override
  String get spanish => 'Spagnolo';

  @override
  String get french => 'Francese';

  @override
  String get german => 'Tedesco';

  @override
  String get italian => 'Italiano';

  @override
  String get portuguese => 'Portoghese';

  @override
  String get japanese => 'Giapponese';

  @override
  String get korean => 'Coreano';

  @override
  String get chinese => 'Cinese';

  @override
  String get russian => 'Russo';

  @override
  String get arabic => 'Arabo';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'Olandese';

  @override
  String get swedish => 'Svedese';

  @override
  String get norwegian => 'Norvegese';

  @override
  String get danish => 'Danese';

  @override
  String get finnish => 'Finlandese';

  @override
  String get polish => 'Polacco';

  @override
  String get ac3Passthrough => 'Passthrough AC3';

  @override
  String get dtsPassthrough => 'Passaggio DTS';

  @override
  String get trueHdSupport => 'Supporto TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Solo audio DTS bitstream su AVR; richiede il supporto del ricevitore e la traccia sorgente DTS';

  @override
  String get settingsAudioFallbackCodec => 'Codec audio alternativo';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Seleziona il formato di destinazione per la transcodifica dell\'audio multicanale quando il flusso sorgente non può essere riprodotto direttamente o inviato tramite passthrough.';

  @override
  String get transcodeAudioCodecs => 'Codec Audio da Transcodificare';

  @override
  String get transcodeAudioCodecsDescription =>
      'Il server converte l\'audio che usa questi formati invece di inviarlo così com\'è.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Rilevamento automatico\n(Consigliato)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Predefinito)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Solo Stereo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efficiente)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Senza perdita)';

  @override
  String get settingsMaxAudioChannels => 'Numero massimo di canali audio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configura il numero massimo di canali del tuo impianto audio. I flussi multicanale che superano questo limite verranno convertiti in downmix o transcodificati.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Rilevamento automatico\n(Predefinito hardware)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadrifonico';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Avanzate)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough Codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Abilita solo i formati supportati dal tuo AVR o dispositivo HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Passthrough EAC3';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passthrough DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passthrough DTS-HD MA';

  @override
  String get settingsAudioPassthroughMode => 'Passthrough';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'Come l\'audio surround compresso raggiunge la tua TV o il tuo ricevitore.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Disattivato (decodifica sempre su questo dispositivo)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Automatico (in base al supporto rilevato del dispositivo)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Manuale (scegli i formati qui sotto)';

  @override
  String get settingsAudioPassthroughOutput => 'Uscita Passthrough';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Chi impacchetta i bitstream per il collegamento HDMI. Prova l\'impacchettamento dell\'app se il passthrough è muto o disturbato su questo dispositivo.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatico, impacchettamento di sistema (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec =>
      'Impacchettamento dell\'app (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'App (IEC)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Converti tutto l\'audio decodificato su due canali.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Invia in bitstream E-AC-3, incluso Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Invia in bitstream DTS-HD, incluso DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Invia in bitstream TrueHD, incluso Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passthrough TrueHD';

  @override
  String get settingsDetectedAudioCapabilities => 'Capacità Audio Rilevate';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Nessuna istantanea delle capacità di runtime ancora disponibile.';

  @override
  String get settingsAudioRouteLabel => 'Percorso';

  @override
  String get settingsAudioDecodeLabel => 'Decodifica';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Percorso audio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Altoparlante';

  @override
  String get settingsAudioRouteHeadphones => 'Cuffie';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get nightMode => 'Modalità Notturna';

  @override
  String get compressDynamicRange => 'Comprimi gamma dinamica';

  @override
  String get advancedMpv => 'mpv Avanzato';

  @override
  String get enableCustomMpvConf => 'Abilita mpv.conf Personalizzato';

  @override
  String get applyMpvConfBeforePlayback =>
      'Applica un mpv.conf specificato dall\'utente prima dell\'inizio della riproduzione';

  @override
  String get unsafeAdvancedMpvOptions => 'Opzioni mpv Avanzate Non Sicure';

  @override
  String get unsafeMpvOptionsDescription =>
      'Consenti un set più ampio di opzioni mpv. Potrebbe compromettere il comportamento della riproduzione.';

  @override
  String get hardwareDecoding => 'Decodifica hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Può migliorare le prestazioni ma può causare problemi di riproduzione su alcuni dispositivi.';

  @override
  String get nextUpAndQueuing => 'Prossimo e Coda';

  @override
  String get nextUpDisplay => 'Comportamento Prossimo';

  @override
  String get extended => 'Esteso';

  @override
  String get minimal => 'Minimale';

  @override
  String get nextUpTimeout => 'Timeout Prossimo';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Coda Media';

  @override
  String get autoQueueNextEpisodes =>
      'Accoda automaticamente i prossimi episodi';

  @override
  String get stillWatchingPrompt => 'Prompt Stai Ancora Guardando';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Dopo $episodes episodi / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Riprendi e Salta';

  @override
  String get resumeRewind => 'Riavvolgimento Ripresa';

  @override
  String get unpauseRewind => 'Riattiva la pausa e riavvolgi';

  @override
  String get fiveSeconds => '5 secondi';

  @override
  String get tenSeconds => '10 secondi';

  @override
  String get fifteenSeconds => '15 secondi';

  @override
  String get thirtySeconds => '30 secondi';

  @override
  String get skipBackLength => 'Durata Salto Indietro';

  @override
  String get skipForwardLength => 'Durata Salto Avanti';

  @override
  String get customMpvConfPath => 'Percorso mpv.conf Personalizzato';

  @override
  String get notSetMpvConf =>
      'Non impostato. Moonfin cercherà un mpv.conf predefinito nelle cartelle app/dati.';

  @override
  String get selectMpvConf => 'Seleziona mpv.conf';

  @override
  String get pathToMpvConf => '/percorso/a/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Le impostazioni di stile (dimensione, colore, offset) si applicano ai sottotitoli testuali (SRT, VTT, TTML). I sottotitoli ASS/SSA usano il proprio stile incorporato a meno che \"Riproduzione Diretta ASS/SSA\" non sia disattivata. I sottotitoli bitmap (PGS, DVB, VobSub) non possono essere personalizzati.';

  @override
  String get defaultSubtitleLanguage => 'Lingua Sottotitoli Predefinita';

  @override
  String get subtitleDownloadLanguages =>
      'Lingue per il download dei sottotitoli';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Lingue in cui cercare quando scarichi i sottotitoli, fino a 5. Automatico cerca una lingua scelta tra la lingua predefinita dei sottotitoli e quella del video.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Lingua Preferita Sottotitoli Secondari';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Mostra una seconda traccia di sottotitoli contemporaneamente. Il menu sottotitoli chiederà prima se scegliere la traccia principale o secondaria';

  @override
  String get defaultToNoSubtitles => 'Nessun Sottotitolo Predefinito';

  @override
  String get turnOffSubtitlesByDefault =>
      'Disattiva i sottotitoli per impostazione predefinita';

  @override
  String get subtitleSize => 'Dimensione Sottotitoli';

  @override
  String get primarySubtitleSlot => 'Traccia Principale';

  @override
  String get secondarySubtitleSlot => 'Traccia Secondaria';

  @override
  String get secondarySubtitleTrack => 'Sottotitoli Secondari';

  @override
  String get secondaryDelayAdjustment => 'Regolazione Ritardo Secondario';

  @override
  String decreaseValue(String setting) {
    return 'Diminuisci $setting';
  }

  @override
  String increaseValue(String setting) {
    return 'Aumenta $setting';
  }

  @override
  String get textFillColor => 'Colore riempimento testo';

  @override
  String get backgroundColor => 'Colore Sfondo';

  @override
  String get textStrokeColor => 'Colore del tratto del testo';

  @override
  String get subtitleCustomization => 'Personalizzazione dei sottotitoli';

  @override
  String get subtitleCustomizationDescription =>
      'Personalizza l\'aspetto dei sottotitoli';

  @override
  String get subtitleMode => 'Modalità Sottotitoli';

  @override
  String get subtitleModeFlagged => 'Contrassegnati';

  @override
  String get subtitleModeAlways => 'Sempre';

  @override
  String get subtitleModeForeign => 'Stranieri';

  @override
  String get subtitleModeForced => 'Forzati';

  @override
  String get subtitleModeFlaggedDescription =>
      'Riproduce le tracce contrassegnate come \"default\" o \"forced\" nei metadati del file media.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Carica e mostra automaticamente i sottotitoli ogni volta che inizia un video.';

  @override
  String get subtitleModeForeignDescription =>
      'Attiva automaticamente i sottotitoli se la traccia audio predefinita è in una lingua straniera.';

  @override
  String get subtitleModeForcedDescription =>
      'Carica solo i sottotitoli contrassegnati esplicitamente con il flag di metadati forced.';

  @override
  String get subtitleModeNoneDescription =>
      'Disabilita completamente il caricamento automatico dei sottotitoli.';

  @override
  String get fallbackSubtitleLanguage => 'Lingua Sottotitoli di Riserva';

  @override
  String get subtitleStream => 'Stream Sottotitoli';

  @override
  String get subtitlePreviewText =>
      'La veloce volpe marrone salta sopra il cane pigro';

  @override
  String get verticalOffset => 'Offset Verticale';

  @override
  String get pgsDirectPlay => 'Riproduzione Diretta PGS';

  @override
  String get directPlayPgsSubtitles => 'Riproduzione diretta sottotitoli PGS';

  @override
  String get assSsaDirectPlay => 'Riproduzione Diretta ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Riproduzione diretta sottotitoli ASS/SSA';

  @override
  String get white => 'Bianco';

  @override
  String get black => 'Nero';

  @override
  String get yellow => 'Giallo';

  @override
  String get green => 'Verde';

  @override
  String get cyan => 'Ciano';

  @override
  String get red => 'Rosso';

  @override
  String get transparent => 'Trasparente';

  @override
  String get semiTransparentBlack => 'Nero Semi-trasparente';

  @override
  String get semiTransparentWhite => 'Bianco Semitrasparente';

  @override
  String get lightGray => 'Grigio Chiaro';

  @override
  String get darkGray => 'Grigio Scuro';

  @override
  String get blue => 'Blu';

  @override
  String get magenta => 'Magenta';

  @override
  String get global => 'Globale';

  @override
  String get desktop => 'Desktop';

  @override
  String get mobile => 'Mobile';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Impostazioni del profilo $profile caricate.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Impossibile caricare le impostazioni del profilo $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Impostazioni locali sincronizzate con il profilo $profile.';
  }

  @override
  String get syncing => 'Sincronizzazione…';

  @override
  String resetProfileTitle(String profile) {
    return 'Ripristinare $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Questa operazione elimina il profilo $profile dal server e riporta tutte le impostazioni sincronizzate di questo dispositivo ai valori predefiniti.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Questa operazione elimina tutti i profili salvati sul server e riporta tutte le impostazioni sincronizzate di questo dispositivo ai valori predefiniti.';

  @override
  String profileReset(String profile) {
    return 'Profilo $profile ripristinato ai valori predefiniti.';
  }

  @override
  String get resetRatingsTitle => 'Ripristinare le valutazioni?';

  @override
  String get resetRatingsDescription =>
      'Questa operazione riporta tutte le impostazioni delle valutazioni ai valori predefiniti, comprese le fonti mostrate e il loro ordine.';

  @override
  String get ratingsReset => 'Valutazioni ripristinate ai valori predefiniti.';

  @override
  String failedToResetProfile(String profile) {
    return 'Impossibile ripristinare il profilo $profile.';
  }

  @override
  String get profileSyncHidden => 'Sincronizzazione Profilo Nascosta';

  @override
  String get enablePluginSyncDescription =>
      'Abilita la Sincronizzazione Plugin Server nelle impostazioni Plugin per mostrare i controlli del profilo qui.';

  @override
  String get quality => 'Qualità';

  @override
  String get defaultDownloadQuality => 'Qualità Download Predefinita';

  @override
  String get network => 'Rete';

  @override
  String get wifiOnlyDownloads => 'Download Solo WiFi';

  @override
  String get tvOfflineDownloads => 'Abilita download offline';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Mostra le azioni di download nelle pagine degli elementi';

  @override
  String get reportDownloadsActivity => 'Mostra i download sul server';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Consenti all\'amministratore del server di vedere i tuoi download transcodificati nella dashboard';

  @override
  String get onlyDownloadOnWifi => 'Scarica solo quando connesso al WiFi';

  @override
  String get storage => 'Archiviazione';

  @override
  String get storageUsed => 'Spazio Utilizzato';

  @override
  String get manage => 'Gestisci';

  @override
  String get calculating => 'Calcolo in corso…';

  @override
  String get downloadLocation => 'Posizione Download';

  @override
  String get defaultLabel => 'Predefinito';

  @override
  String get sdCard => 'Scheda SD';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android consente a Moonfin di scrivere solo nelle cartelle di sua proprietà e questo dispositivo non ha memorie rimovibili. Attiva \"Salva nella cartella Download\" qui sopra per mantenere i download in una posizione raggiungibile dalle altre app.';

  @override
  String get saveToDownloadsFolder => 'Salva nella cartella Download';

  @override
  String get downloadsVisibleToOtherApps =>
      'Download/Moonfin — visibile ad altre app';

  @override
  String get dangerZone => 'Zona Pericolosa';

  @override
  String get clearAllDownloads => 'Cancella Tutti i Download';

  @override
  String get original => 'Originale';

  @override
  String get changeDownloadLocation => 'Cambia Posizione Download';

  @override
  String get changeDownloadLocationDescription =>
      'I nuovi download verranno salvati nella cartella selezionata. I download esistenti rimarranno nella loro posizione attuale e possono essere gestiti dalle impostazioni di Archiviazione.';

  @override
  String get confirm => 'Conferma';

  @override
  String get cannotWriteToFolder =>
      'Impossibile scrivere nella cartella selezionata. Scegli un\'altra posizione o concedi i permessi di archiviazione.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Salvare nella cartella Download?';

  @override
  String get saveToDownloadsFolderDescription =>
      'I media scaricati verranno salvati in Download/Moonfin sul tuo dispositivo. Questi file saranno visibili ad altre app come la galleria o il lettore musicale.\n\nI download esistenti rimarranno nella loro posizione attuale.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcodifica: tempo rimanente non disponibile';

  @override
  String get enable => 'Abilita';

  @override
  String get clearAllDownloadsWarning =>
      'Questo eliminerà tutti i media scaricati e non può essere annullato.';

  @override
  String get clearAll => 'Cancella Tutto';

  @override
  String get navigationStyle => 'Stile Navigazione';

  @override
  String get topBar => 'Barra Superiore';

  @override
  String get leftSidebar => 'Barra Laterale Sinistra';

  @override
  String get showShuffleButton => 'Mostra Pulsante Casuale';

  @override
  String get showGenresButton => 'Mostra Pulsante Generi';

  @override
  String get showFavoritesButton => 'Mostra Pulsante Preferiti';

  @override
  String get showLiveTvButton => 'Mostra Pulsante TV Live';

  @override
  String get showDownloadsButton => 'Mostra Pulsante Media Salvati';

  @override
  String get showLibrariesInToolbar => 'Mostra Librerie nella Barra Strumenti';

  @override
  String get showLibrariesIndividually => 'Mostra Librerie Separatamente';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Mostra ogni libreria come pulsante a sé nella barra di navigazione invece che nel menu Librerie';

  @override
  String get navbarAlwaysExpanded =>
      'Espandi Sempre le Etichette della Barra di Navigazione';

  @override
  String get showSeerrButton => 'Mostra Pulsante Seerr';

  @override
  String get navbarOpacity => 'Opacità Barra Navigazione';

  @override
  String get navbarColor => 'Colore Barra Navigazione';

  @override
  String get gray => 'Grigio';

  @override
  String get darkBlue => 'Blu Scuro';

  @override
  String get purple => 'Viola';

  @override
  String get teal => 'Verde Acqua';

  @override
  String get navy => 'Blu Navy';

  @override
  String get charcoal => 'Antracite';

  @override
  String get brown => 'Marrone';

  @override
  String get darkRed => 'Rosso Scuro';

  @override
  String get darkGreen => 'Verde Scuro';

  @override
  String get slate => 'Ardesia';

  @override
  String get indigo => 'Indaco';

  @override
  String get libraryDisplay => 'Visualizzazione Libreria';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Stendardo';

  @override
  String get overridePerLibrarySettings =>
      'Sovrascrivi Impostazioni per Libreria';

  @override
  String get applyImageTypeToAllLibraries =>
      'Applica tipo immagine a tutte le librerie';

  @override
  String get multiServerLibraries => 'Librerie Multi-Server';

  @override
  String get showLibrariesFromAllServers =>
      'Mostra librerie da tutti i server connessi';

  @override
  String get recentlyAddedAndReleased => 'Recently Added and Released';

  @override
  String get hideWatchedInRecentRows => 'Hide Watched';

  @override
  String get hideWatchedInRecentRowsDescription =>
      'Hide watched content from Recently Added and Recently Released home rows.';

  @override
  String get mergeRecentRowsByType => 'Unisci Righe Recenti per Tipo';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Combina le librerie separate dello stesso tipo nelle righe home Aggiunti di Recente e Usciti di Recente.';

  @override
  String get libraryView => 'Vista Libreria';

  @override
  String get libraryStyle => 'Stile Libreria Video';

  @override
  String get libraryStyleDescription =>
      'Classico è l\'intestazione originale con pulsanti a icona. Moderno riunisce in una barra la ricerca e i pulsanti con etichetta per ordinare, raggruppare e filtrare. Ancorato sposta i controlli e le lettere in un pannello laterale.';

  @override
  String get libraryStyleDescriptionPhone =>
      'Classico è l\'intestazione originale con pulsanti a icona. Moderno aggiunge sotto la ricerca etichette per ordinare, raggruppare e filtrare. Ancorato tiene i controlli in una barra in fondo allo schermo.';

  @override
  String get libraryStyleClassic => 'Classico';

  @override
  String get libraryStyleModern => 'Moderno';

  @override
  String get libraryStyleDocked => 'Ancorato';

  @override
  String get bookLibraryStyle => 'Stile Libreria Libri';

  @override
  String get bookLibraryStyleDescription =>
      'Classico mostra gli scaffali originali sotto un titolo in evidenza. Sala di Lettura parte da ciò che stai leggendo, con schede grandi. Catalogo mostra tutta la libreria in una griglia.';

  @override
  String get bookLibraryStyleClassic => 'Classico';

  @override
  String get bookLibraryStyleReadingRoom => 'Sala di Lettura';

  @override
  String get bookLibraryStyleBookstore => 'Catalogo';

  @override
  String get musicLibraryStyle => 'Stile Libreria Musica';

  @override
  String get musicLibraryStyleDescription =>
      'Classico mostra le righe originali sotto una scheda Riascolta. Accesso Rapido parte da una griglia dei tuoi album e playlist recenti. Immersivo parte dall\'album che stai ascoltando.';

  @override
  String get musicLibraryStyleClassic => 'Classico';

  @override
  String get musicLibraryStyleQuickAccess => 'Accesso Rapido';

  @override
  String get musicLibraryStyleImmersive => 'Immersivo';

  @override
  String get jumpBackIn => 'Riascolta';

  @override
  String get yourPlaylists => 'Le Tue Playlist';

  @override
  String get fromThisAlbum => 'Da Questo Album';

  @override
  String get searchMusic => 'Cerca Musica';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count serie',
      one: '1 serie',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count in corso';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sfoglia tutti i $count titoli',
      one: 'Sfoglia 1 titolo',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Cerca libri';

  @override
  String get libraryShowLabel => 'Mostra';

  @override
  String get libraryAToZ => 'A-Z';

  @override
  String get libraryJumpToLetter => 'Vai alla lettera';

  @override
  String get groupItemsIntoCollections => 'Raggruppa Elementi in Collezioni';

  @override
  String get hideCollectionAssociatedItems =>
      'Nascondi gli elementi della libreria associati a una collezione durante la navigazione';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Avviso sul Raggruppamento della Libreria';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Per usare questa impostazione, assicurati che le impostazioni della libreria \"Raggruppa i film in collezioni\" e/o \"Raggruppa le serie in collezioni\" siano abilitate nelle impostazioni di Visualizzazione della tua libreria sul server Jellyfin o Emby.';

  @override
  String get libraryVisibility => 'Visibilità Libreria';

  @override
  String get libraryVisibilityDescription =>
      'Attiva/disattiva la visibilità della home page per libreria. Riavvia Moonfin affinché le modifiche abbiano effetto.';

  @override
  String get showInNavigation => 'Mostra nella navigazione';

  @override
  String get showInLatestMedia =>
      'Mostra nei contenuti aggiunti/rilasciati di recente';

  @override
  String get libraryOrder => 'Ordine Librerie';

  @override
  String get libraryOrderSubtitle => 'Scegli l\'ordine delle tue librerie';

  @override
  String get libraryOrderDescription =>
      'Le tue librerie compaiono in quest\'ordine nella sezione I Miei Media, nelle righe degli aggiunti di recente e nella barra di navigazione. L\'ordine viene salvato nel tuo account del server, quindi lo usano anche le altre app in cui accedi.';

  @override
  String get libraryOrderTvHint =>
      'Premi Sinistra o Destra per spostare la libreria evidenziata.';

  @override
  String get libraryOrderSaveFailed =>
      'Impossibile salvare l\'ordine delle librerie';

  @override
  String get sourceLibraries => 'Librerie Sorgente';

  @override
  String get sourceCollections => 'Collezioni Sorgente';

  @override
  String get excludedGenres => 'Generi Esclusi';

  @override
  String get selectAll => 'Seleziona Tutto';

  @override
  String itemsSelected(int count) {
    return '$count selezionati';
  }

  @override
  String get mediaBar => 'Barra Media';

  @override
  String get mediaSources => 'Fonti multimediali';

  @override
  String get behavior => 'Comportamento';

  @override
  String get seconds => 'secondi';

  @override
  String get mediaBarMode => 'Stile della barra media';

  @override
  String get mediaBarModeDescription =>
      'Scegli tra diversi stili della barra multimediale oppure disattiva la barra multimediale';

  @override
  String get peekHomeRows => 'Anteprima Righe Home';

  @override
  String get peekHomeRowsDescription =>
      'Mostra la metà superiore della prima riga lungo il fondo della barra media';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Disattivata';

  @override
  String get mediaBarModeBookshelf => 'Scaffale';

  @override
  String get mediaBarModeGallery => 'Galleria';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Abilita Barra Media';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostra presentazione contenuti in evidenza nella home';

  @override
  String get contentType => 'Tipo Contenuto';

  @override
  String get mediaBarSourceType => 'Fonte';

  @override
  String get mediaBarSourceRandom => 'Casuale';

  @override
  String get mediaBarSourceNewReleases => 'Nuove Stagioni e Episodi';

  @override
  String get mediaBarNewReleaseBanner => 'Banner Novità';

  @override
  String get mediaBarNewReleaseBannerDescription =>
      'Segnala le serie con una nuova stagione o nuovi episodi trasmessi di recente.';

  @override
  String get mediaBarNewReleaseDays => 'Periodo Novità';

  @override
  String get mediaBarNewReleaseDaysDescription =>
      'Per quanto tempo dopo la messa in onda un episodio è ancora considerato nuovo.';

  @override
  String get mediaBarNewSeries => 'Nuova Serie';

  @override
  String get mediaBarNewSeason => 'Nuova Stagione';

  @override
  String get mediaBarNewEpisodes => 'Nuovi Episodi';

  @override
  String get moviesAndTvShows => 'Film e Serie TV';

  @override
  String get moviesOnly => 'Solo Film';

  @override
  String get tvShowsOnly => 'Solo Serie TV';

  @override
  String get itemCount => 'Numero Elementi';

  @override
  String get noneSelected => 'Nessuno selezionato';

  @override
  String get noneExcluded => 'Nessuno escluso';

  @override
  String get autoAdvance => 'Avanzamento Automatico';

  @override
  String get autoAdvanceSlides => 'Avanza automaticamente alla prossima slide';

  @override
  String get autoAdvanceInterval => 'Intervallo Avanzamento Automatico';

  @override
  String get trailerPreview => 'Anteprima Trailer';

  @override
  String get autoPlayTrailers =>
      'Riproduci automaticamente i trailer nella barra media dopo 3 secondi';

  @override
  String get trailerAudio => 'Audio Trailer';

  @override
  String get enableTrailerAudio =>
      'Abilita l\'audio dei trailer nella barra media';

  @override
  String get trailerVolume => 'Volume Trailer';

  @override
  String get trailerVolumeDescription => 'Volume dei trailer nella barra media';

  @override
  String get trailerCaptions => 'Sottotitoli dei Trailer';

  @override
  String get trailerCaptionsDescription =>
      'Mostra i sottotitoli sui trailer di YouTube';

  @override
  String get episodePreview => 'Anteprima Episodio';

  @override
  String get mediaPreview => 'Anteprima multimediale';

  @override
  String get episodePreviewDescription =>
      'Riproduci un\'anteprima in linea di 30 secondi sulle schede in focus, hover o pressione prolungata';

  @override
  String get mediaPreviewDescription =>
      'Riproduci un’anteprima integrata di 30 secondi sulle schede selezionate, al passaggio del mouse o dopo una pressione prolungata';

  @override
  String get previewAudio => 'Audio Anteprima';

  @override
  String get enablePreviewAudio =>
      'Abilita l’audio per le anteprime dei contenuti multimediali';

  @override
  String get previewVolume => 'Volume Anteprime';

  @override
  String get previewVolumeDescription =>
      'Volume delle anteprime dei media sulle schede';

  @override
  String get latestMedia => 'Media aggiunti di recente';

  @override
  String get recentlyReleased => 'Usciti di Recente';

  @override
  String get recentlyReleasedSeriesType => 'Ordina Serie Uscite di Recente per';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Ordina le righe Home Serie Uscite di Recente per serie, ultima stagione o data di trasmissione dell\'ultimo episodio';

  @override
  String get myMedia => 'I Miei Media';

  @override
  String get myMediaSmall => 'I Miei Media (Piccolo)';

  @override
  String get continueWatching => 'Continua a Guardare';

  @override
  String get resumeAudio => 'Riprendi Audio';

  @override
  String get resumeBooks => 'Riprendi Libri';

  @override
  String get activeRecordings => 'Registrazioni Attive';

  @override
  String get playlists => 'Playlist';

  @override
  String get liveTV => 'TV Live';

  @override
  String get favoriteChannels => 'Canali Preferiti';

  @override
  String get resetToDefaults => 'Ripristina predefiniti';

  @override
  String get homeRowPosterSize => 'Dimensione Poster Righe Home';

  @override
  String get configureImageTypeForEachRow =>
      'Configura il tipo di immagine per ogni riga home abilitata';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Unisci Continua a Guardare e Prossimo';

  @override
  String get combineBothRows =>
      'Combina entrambe le righe in un\'unica sezione home';

  @override
  String get continueWatchingDefaultAction => 'Azione Predefinita';

  @override
  String get continueWatchingDefaultActionDescription =>
      'Cosa succede quando selezioni un elemento di Continua a Guardare o Prossimo';

  @override
  String get goToDetailsScreen => 'Vai ai Dettagli';

  @override
  String get playImmediately => 'Riproduci subito';

  @override
  String get nextUpMaxDays => 'Giorni massimi in Prossimo';

  @override
  String get nextUpMaxDaysDescription =>
      'Per quanto tempo una serie resta in Prossimo dopo l\'ultima visione';

  @override
  String daysValue(int days) {
    return '$days giorni';
  }

  @override
  String get fullScreenRows => 'Righe Espanse';

  @override
  String get fullScreenRowsDescription =>
      'Limita le righe home a 1 per schermata';

  @override
  String get homeRowsPadding => 'Margine interno righe';

  @override
  String get homeRowsPaddingDescription =>
      'Personalizza il margine interno tra le righe della Home';

  @override
  String get homeRowsGenresAndStudios => 'Generi e Studi';

  @override
  String get homeRowsExternalLists => 'Liste Esterne';

  @override
  String get homeRowsStreamingServices => 'Streaming Services';

  @override
  String get perRowSettings => 'Impostazioni per Riga';

  @override
  String get autoLogin => 'Accesso Automatico';

  @override
  String get lastUser => 'Ultimo Utente';

  @override
  String get currentUser => 'Utente Attuale';

  @override
  String get alwaysAuthenticate => 'Autentica Sempre';

  @override
  String get requirePasswordWithToken =>
      'Richiedi password anche con token salvato';

  @override
  String get confirmExit => 'Conferma Uscita';

  @override
  String get showConfirmationBeforeExiting => 'Mostra conferma prima di uscire';

  @override
  String get blockContentWithRatings =>
      'Blocca contenuti con le seguenti classificazioni:';

  @override
  String get noContentRatingsFound =>
      'Nessuna classificazione dei contenuti trovata su questo server.';

  @override
  String get couldNotLoadServerRatings =>
      'Impossibile caricare le classificazioni del server. Vengono mostrate solo le classificazioni salvate.';

  @override
  String get couldNotRefreshRatings =>
      'Impossibile aggiornare le classificazioni dal server. Vengono mostrate le classificazioni salvate.';

  @override
  String get enablePinCode => 'Abilita Codice PIN';

  @override
  String get pinSynced => 'PIN sincronizzato';

  @override
  String get pinResetFailed =>
      'Impossibile cancellare il PIN sul server. Se è ancora impostato, chiedi a un amministratore del server di rimuoverlo.';

  @override
  String get requirePinToAccess =>
      'Richiedi un PIN per accedere al tuo account';

  @override
  String get changePin => 'Cambia PIN';

  @override
  String get setNewPinCode => 'Imposta un nuovo codice PIN';

  @override
  String get removePin => 'Rimuovi PIN';

  @override
  String get removePinProtection => 'Rimuovi protezione codice PIN';

  @override
  String get screensaver => 'Salvaschermo';

  @override
  String get inAppScreensaver => 'Screensaver in App';

  @override
  String get enableBuiltInScreensaver => 'Abilita lo screensaver integrato';

  @override
  String get mode => 'Modalità';

  @override
  String get libraryArt => 'Arte Libreria';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Orologio';

  @override
  String get timeout => 'Timeout';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Livello Oscuramento';

  @override
  String get screensaverDuringAudio => 'Mostra Durante Musica e Audiolibri';

  @override
  String get screensaverDuringAudioDescription =>
      'Consenti l\'avvio dello screensaver durante la riproduzione audio, così la copertina non resta sullo schermo per ore.';

  @override
  String get sleepAfterIdle => 'Sospendi TV Dopo';

  @override
  String get sleepAfterIdleDescriptionAndroid =>
      'Chiude Moonfin dopo questo tempo senza premere tasti, così lo screensaver e il timer di spegnimento della TV possono intervenire. Ciò che è in pausa viene prima interrotto, così mantiene il punto di ripresa.';

  @override
  String get sleepAfterIdleDescriptionAppleTv =>
      'Dopo questo tempo senza premere tasti, lascia lo schermo allo screensaver e all\'impostazione di sospensione della tua Apple TV. Moonfin resta aperto, così riprendi esattamente da dove avevi lasciato.';

  @override
  String get maxAgeRating => 'Classificazione Età Massima';

  @override
  String get any => 'Qualsiasi';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Richiedi Classificazione Età';

  @override
  String get onlyShowRatedContent => 'Mostra solo contenuti classificati';

  @override
  String get displayClockDuringScreensaver =>
      'Mostra l\'orologio durante lo screensaver';

  @override
  String get clockModeStatic => 'Statico';

  @override
  String get clockModeBouncing => 'Rimbalzante';

  @override
  String get screensaverGeneralSettings => 'Impostazioni Generali';

  @override
  String get screensaverVisualComponents => 'Componenti Visivi';

  @override
  String get screensaverLibraryContent => 'Contenuti della Libreria';

  @override
  String get screensaverBackdrop => 'Sfondo';

  @override
  String get screensaverBackdropBlack => 'Nero';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Calma';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Componente Aggiuntivo';

  @override
  String get screensaverComponentMoonfinLogo => 'Logo Moonfin';

  @override
  String get screensaverComponentRunner => 'Runner';

  @override
  String get screensaverComponentMovement => 'Movimento Componente';

  @override
  String get screensaverComponentPosition => 'Posizione Componente';

  @override
  String get screensaverComponentSize => 'Dimensione Componente';

  @override
  String get screensaverSourceLibrariesDefault => 'Tutte (Predefinito)';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Critici)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Pubblico)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (Utenti)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Valutazione Comunità';

  @override
  String get ratings => 'Valutazioni';

  @override
  String get additionalRatings => 'Valutazioni Aggiuntive';

  @override
  String get mdblistWatchingNow => 'In Visione su MDBList';

  @override
  String watchingNowWatchersCount(int count) {
    return '$count in visione';
  }

  @override
  String watchingNowLiveSummary(String users, String movies, String shows) {
    return '$users in visione ora · $movies film · $shows serie';
  }

  @override
  String watchingNowLiveSummaryToday(
    String users,
    String movies,
    String shows,
  ) {
    return '$users spettatori oggi · $movies film · $shows serie';
  }

  @override
  String get showMdbListAndTmdbRatings => 'Mostra valutazioni MDBList e TMDB';

  @override
  String get ratingLabels => 'Etichette Valutazione';

  @override
  String get showLabelsNextToIcons =>
      'Mostra etichette accanto alle icone di valutazione';

  @override
  String get ratingBadges => 'Badge Valutazione';

  @override
  String get showDecorativeBadges =>
      'Mostra badge decorativi dietro le valutazioni';

  @override
  String get episodeRatings => 'Valutazioni Episodi';

  @override
  String get showRatingsOnEpisodes => 'Mostra valutazioni sui singoli episodi';

  @override
  String get ratingSources => 'Fonti Valutazione';

  @override
  String get ratingSourcesDescription =>
      'Abilita e riordina le fonti di valutazione mostrate nell\'app';

  @override
  String get pluginDetected => 'Plugin Rilevato';

  @override
  String get pluginNotDetected => 'Plugin Non Rilevato';

  @override
  String get pluginNotDetectedDescription =>
      'Plugin server attualmente non rilevato. Le impostazioni locali utilizzano ancora i valori salvati o i predefiniti integrati.';

  @override
  String get moonbaseAddress => 'Indirizzo Moonbase';

  @override
  String get pluginConnected => 'Connesso';

  @override
  String pluginConnectedVersion(String version) {
    return 'Connesso, versione $version';
  }

  @override
  String get pluginSyncOn => 'Sincronizzazione attiva';

  @override
  String get pluginSyncOff => 'Sincronizzazione disattivata';

  @override
  String get syncProfileDescription =>
      'Questo dispositivo si sincronizza con il profilo che scegli finché non ne scegli un altro.';

  @override
  String get profileAppliesEverywhere => 'Vale ovunque';

  @override
  String get profileOverridesGlobal => 'Sovrascrive Globale';

  @override
  String get profileThisDevice => 'Questo dispositivo';

  @override
  String get profileLoad => 'Carica';

  @override
  String get profileLoadSubtitle => 'Dal server a questo dispositivo';

  @override
  String get profileSaveSubtitle => 'Da questo dispositivo al server';

  @override
  String resetNamedProfile(String profile) {
    return 'Ripristina Profilo $profile';
  }

  @override
  String get recentRequests => 'Richieste Recenti';

  @override
  String get recentlyAdded => 'Aggiunti di Recente';

  @override
  String get trending => 'Di Tendenza';

  @override
  String get popularMovies => 'Film Popolari';

  @override
  String get movieGenres => 'Generi Film';

  @override
  String get upcomingMovies => 'Film in Arrivo';

  @override
  String get studios => 'Studi';

  @override
  String get popularSeries => 'Serie Popolari';

  @override
  String get seriesGenres => 'Generi Serie';

  @override
  String get upcomingSeries => 'Serie in Arrivo';

  @override
  String get networks => 'Reti';

  @override
  String get tags => 'Tag';

  @override
  String get genresAndTags => 'Generi e Tag';

  @override
  String get seerrDiscoveryRows => 'Righe Scoperta Seerr';

  @override
  String get seerrDiscoverSliders => 'Sezioni Scopri di Seerr';

  @override
  String get yourWatchlist => 'La tua Watchlist';

  @override
  String get resetRowsToDefaults => 'Ripristina righe predefinite';

  @override
  String get enableSeerr => 'Abilita Seerr';

  @override
  String get showSeerrInNavigation =>
      'Mostra Seerr nella navigazione (richiede plugin server)';

  @override
  String get seerrUnavailable =>
      'Non disponibile perché il supporto Seerr del plugin server è disabilitato.';

  @override
  String get nsfwFilter => 'Filtro NSFW';

  @override
  String get hideAdultContent => 'Nascondi contenuti per adulti nei risultati';

  @override
  String get showMissingCollectionItems =>
      'Mostra Elementi Mancanti delle Collezioni';

  @override
  String get showMissingCollectionItemsDesc =>
      'Includi gli elementi mancanti nelle pagine delle collezioni';

  @override
  String get showSeerrAvailabilityBadges => 'Mostra Badge Disponibilità Seerr';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Mostra lo stato Seerr su poster e stagioni in tutta l\'app';

  @override
  String get seerrBadgeStyle => 'Stile Badge';

  @override
  String get seerrBadgeStyleDescription =>
      'Badge mette il pallino di Seerr in un angolo. Banner mostra lo stato lungo la parte superiore del poster.';

  @override
  String get seerrBadgeStyleBadge => 'Badge';

  @override
  String get seerrNotificationsSection => 'Notifiche';

  @override
  String get seerrNotifyNewRequestsTitle => 'Notifiche nuove richieste';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Avvisami quando qualcuno invia una richiesta';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Aggiornamenti richieste';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Approvate, rifiutate e aggiunte alla tua libreria';

  @override
  String get seerrNotifyIssuesTitle => 'Aggiornamenti segnalazioni';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Nuove segnalazioni, risposte e risoluzioni';

  @override
  String get seerrNotifyNewMediaTitle => 'Nuovi contenuti aggiunti';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Qualsiasi novità aggiunta alla libreria del server';

  @override
  String loggedInAs(String username) {
    return 'Accesso effettuato come: $username';
  }

  @override
  String get discoverRows => 'Pagina Discovery di Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Abilita le righe da mostrare nella pagina principale di Seerr. Trascina per riordinare. L\'ordine personalizzato si sincronizza con Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Abilita le righe da mostrare nella pagina principale di Seerr. Trascina per riordinare. L\'ordine personalizzato si sincronizza con Moonbase.';

  @override
  String get enabled => 'Attivato';

  @override
  String get hidden => 'Nascosto';

  @override
  String get aboutTitle => 'Informazioni';

  @override
  String versionValue(String version) {
    return 'Versione $version';
  }

  @override
  String get openSourceLicenses => 'Licenze Open Source';

  @override
  String get sourceCode => 'Codice Sorgente';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Controlla Aggiornamenti Ora';

  @override
  String get checksLatestDesktopRelease =>
      'Controlla l\'ultima versione desktop per questa piattaforma';

  @override
  String get youAreUpToDate => 'Sei aggiornato.';

  @override
  String get couldNotCheckForUpdates =>
      'Impossibile controllare gli aggiornamenti al momento.';

  @override
  String get noCompatibleUpdate =>
      'Nessun pacchetto di aggiornamento compatibile trovato per questa piattaforma.';

  @override
  String get updateChecksNotSupported =>
      'Il controllo aggiornamenti non è supportato su questa piattaforma.';

  @override
  String get updateNotificationsDisabled =>
      'Le notifiche di aggiornamento sono disabilitate.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Attendi prima di controllare di nuovo.';

  @override
  String get latestUpdateAlreadyShown =>
      'L\'ultimo aggiornamento è già stato mostrato.';

  @override
  String get updateAvailable => 'Aggiornamento disponibile.';

  @override
  String updateAvailableVersion(String version) {
    return 'Aggiornamento disponibile: v$version';
  }

  @override
  String get updateNotifications => 'Notifiche Aggiornamento';

  @override
  String get showWhenUpdatesAvailable =>
      'Mostra quando sono disponibili aggiornamenti';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Disponibile';
  }

  @override
  String get readReleaseNotes => 'Leggi le note di rilascio';

  @override
  String get downloadingUpdate => 'Download dell\'aggiornamento in corso…';

  @override
  String get updateDownloadFailed =>
      'Download dell\'aggiornamento non riuscito. Per favore riprova.';

  @override
  String get openReleasesPage => 'Apri la pagina delle versioni';

  @override
  String get navigation => 'Navigazione';

  @override
  String get watchedIndicatorsBackdrops => 'Indicatori visti, sfondi';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Colore focus, indicatori visti, sfondi';

  @override
  String get navbarStyleToolbarAppearance =>
      'Stile barra navigazione, pulsanti barra strumenti, aspetto';

  @override
  String get featuredContentAppearance => 'Contenuti in evidenza, aspetto';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limite cache immagini';

  @override
  String get clearImageCache => 'Svuota cache immagini';

  @override
  String get imageCacheCleared => 'Cache immagini svuotata';

  @override
  String get clear => 'Cancella';

  @override
  String get browse => 'Sfoglia';

  @override
  String get noResults => 'Nessun risultato';

  @override
  String get seerrAvailableStatus => 'Disponibile';

  @override
  String get seerrRequestedStatus => 'Richiesto';

  @override
  String get seerrDownloading => 'Download in corso';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Download in corso · $done / $total';
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
    return 'Scaricamento · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importazione';

  @override
  String get seerrWaitingForImport => 'Scaricato, in attesa di importazione';

  @override
  String get seerrDownloadStalled => 'Bloccato';

  @override
  String get seerrDownloadFailed => 'Download non riuscito';

  @override
  String get seerrImportBlocked => 'Import blocked';

  @override
  String get seerrNotFoundYet => 'Not found yet';

  @override
  String get seerrGetDifferentRelease => 'Get a different release';

  @override
  String seerrGetDifferentReleaseConfirm(String service, String release) {
    return '$service will remove $release from the download client, block it so it isn\'t grabbed again, and search for another release.';
  }

  @override
  String seerrGetDifferentReleaseDone(String service) {
    return 'Removed. $service is searching for another release.';
  }

  @override
  String get seerrGetDifferentReleaseFailed => 'Couldn\'t remove the download';

  @override
  String itemsCount(int count) {
    return '$count Elementi';
  }

  @override
  String get seerrSettings => 'Impostazioni Seerr';

  @override
  String get requestMore => 'Richiedi Altro';

  @override
  String get requestMore4k => 'Richiedi Altro in 4K';

  @override
  String get request => 'Richiedi';

  @override
  String get request4k => 'Richiedi 4K';

  @override
  String get requested4k => '4K Richiesto';

  @override
  String get cancelRequest => 'Annulla Richiesta';

  @override
  String get cancelRequest4k => 'Annulla Richiesta 4K';

  @override
  String get playInMoonfin => 'Riproduci in Moonfin';

  @override
  String get requestedByLabel => 'Richiesto da';

  @override
  String requestedByName(String name) {
    return 'Richiesto da $name';
  }

  @override
  String get manageRequests => 'Gestisci Richieste';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'Nella Watchlist';

  @override
  String get approve => 'Approva';

  @override
  String get declineAction => 'Rifiuta';

  @override
  String get similar => 'Simili';

  @override
  String get recommendations => 'Raccomandazioni';

  @override
  String cancelRequestForTitle(String title) {
    return 'Annullare la richiesta per \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Annullare $count richieste per \"$title\"?';
  }

  @override
  String get keep => 'Mantieni';

  @override
  String get itemNotFoundInLibrary =>
      'Elemento non trovato nella tua libreria Moonfin';

  @override
  String get errorSearchingLibrary => 'Errore nella ricerca della libreria';

  @override
  String budgetAmount(String amount) {
    return 'Budget: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Incassi: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Richiedi $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Richiedi $type in 4K';
  }

  @override
  String get submitRequest => 'Invia Richiesta';

  @override
  String get allSeasons => 'Tutte le Stagioni';

  @override
  String get seerrSeriesContinuing =>
      'Serie in corso · Le stagioni future potranno essere richieste';

  @override
  String get seerrSeriesMatchDescription =>
      'Non è stato possibile abbinare automaticamente questa serie. Scegli quella giusta qui sotto.';

  @override
  String get seerrSeriesNoMatch =>
      'Non è stata trovata nessuna corrispondenza per questa serie, quindi non può essere richiesta.';

  @override
  String get seerrSeriesMatchFailed =>
      'Sonarr non ha trovato una corrispondenza per questa serie oppure non è raggiungibile. Riprova o controlla la serie su Seerr.';

  @override
  String get advancedOptions => 'Opzioni Avanzate';

  @override
  String get noServiceServersConfigured =>
      'Nessun server di servizio configurato';

  @override
  String get server => 'Server';

  @override
  String get qualityProfile => 'Profilo Qualità';

  @override
  String get rootFolder => 'Cartella Principale';

  @override
  String get showMore => 'Mostra Altro';

  @override
  String get appearances => 'Filmografia';

  @override
  String get crewSection => 'Troupe';

  @override
  String ageValue(int age) {
    return '$age anni';
  }

  @override
  String get noRequests => 'Nessuna richiesta';

  @override
  String get pendingStatus => 'In attesa';

  @override
  String get declinedStatus => 'Rifiutato';

  @override
  String get partiallyAvailable => 'Parzialmente Disponibile';

  @override
  String get downloadingStatus => 'In download';

  @override
  String get approvedStatus => 'Approvato';

  @override
  String get notRequestedStatus => 'Non richiesto';

  @override
  String get blocklistedStatus => 'Bloccato';

  @override
  String get deletedStatus => 'Eliminato';

  @override
  String get failedStatus => 'Non riuscita';

  @override
  String get processingStatus => 'In elaborazione';

  @override
  String modifiedByName(String name) {
    return 'Modificato da $name';
  }

  @override
  String get completedStatus => 'Completata';

  @override
  String get requestErrorDuplicate => 'Questo titolo è già stato richiesto';

  @override
  String get requestErrorQuota => 'Limite di richieste raggiunto';

  @override
  String get requestErrorBlocklisted => 'Questo titolo è nella lista bloccati';

  @override
  String get requestErrorNoSeasons => 'Nessuna stagione rimasta da richiedere';

  @override
  String get requestErrorPermission =>
      'Non hai il permesso di effettuare questa richiesta';

  @override
  String get seerrRequestsTitle => 'Richieste';

  @override
  String get seerrIssuesTitle => 'Segnalazioni';

  @override
  String get sortNewest => 'Più recenti';

  @override
  String get sortLastModified => 'Ultima modifica';

  @override
  String get noIssues => 'Nessuna segnalazione';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining di $limit richieste di film rimanenti';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining di $limit richieste di stagioni rimanenti';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Parte di $name';
  }

  @override
  String get viewCollection => 'Vedi Collezione';

  @override
  String get requestCollection => 'Richiedi Collezione';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total film · $available disponibili';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Richiedi $count film';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Richiesta $current di $total…';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Richiesti $count film';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Richiesti $ok di $total film';
  }

  @override
  String get collectionAllRequested =>
      'Tutti i film sono già disponibili o richiesti';

  @override
  String get reportIssue => 'Segnala Problema';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Qual è il problema?';

  @override
  String get allEpisodes => 'Tutti gli Episodi';

  @override
  String get episode => 'Episodio';

  @override
  String get openStatus => 'Aperta';

  @override
  String get resolvedStatus => 'Risolta';

  @override
  String get resolveAction => 'Risolvi';

  @override
  String get reopenAction => 'Riapri';

  @override
  String reportedByName(String name) {
    return 'Segnalato da $name';
  }

  @override
  String commentsCount(int count) {
    return '$count commenti';
  }

  @override
  String get addComment => 'Aggiungi un commento';

  @override
  String get deleteIssueConfirm => 'Eliminare questa segnalazione?';

  @override
  String get submitReport => 'Invia Segnalazione';

  @override
  String get tmdbScore => 'Punteggio TMDB';

  @override
  String get releaseDateLabel => 'Data di rilascio';

  @override
  String get firstAirDateLabel => 'Prima data in onda';

  @override
  String get revenueLabel => 'Incassi';

  @override
  String get runtimeLabel => 'Durata';

  @override
  String get budgetLabel => 'Budget';

  @override
  String get originalLanguageLabel => 'Lingua originale';

  @override
  String get seasonsLabel => 'Stagioni';

  @override
  String get episodesLabel => 'Episodi';

  @override
  String get access => 'Accesso';

  @override
  String get add => 'Aggiungi';

  @override
  String get address => 'Indirizzo';

  @override
  String get analytics => 'Analisi';

  @override
  String get catalog => 'Catalogo';

  @override
  String get content => 'Contenuto';

  @override
  String get copy => 'Copia';

  @override
  String get create => 'Crea';

  @override
  String get disable => 'Disabilita';

  @override
  String get done => 'Fatto';

  @override
  String get edit => 'Modifica';

  @override
  String get encoding => 'Codifica';

  @override
  String get error => 'Errore';

  @override
  String get forward => 'Avanti';

  @override
  String get general => 'Generale';

  @override
  String get go => 'Vai';

  @override
  String get install => 'Installa';

  @override
  String get installed => 'Installato';

  @override
  String get interval => 'Intervallo';

  @override
  String get name => 'Nome';

  @override
  String get networking => 'Rete';

  @override
  String get next => 'Successivo';

  @override
  String get path => 'Percorso';

  @override
  String get paused => 'In pausa';

  @override
  String get permissions => 'Permessi';

  @override
  String get processing => 'Elaborazione';

  @override
  String get profile => 'Profilo';

  @override
  String get provider => 'Fornitore';

  @override
  String get refresh => 'Aggiorna';

  @override
  String get remote => 'Remoto';

  @override
  String get rename => 'Rinomina';

  @override
  String get revoke => 'Revoca';

  @override
  String get role => 'Ruolo';

  @override
  String get root => 'Radice';

  @override
  String get run => 'Esegui';

  @override
  String get search => 'Cerca';

  @override
  String get select => 'Seleziona';

  @override
  String get send => 'Invia';

  @override
  String get sessions => 'Sessioni';

  @override
  String get set => 'Imposta';

  @override
  String get status => 'Stato';

  @override
  String get stop => 'Interrompi';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Ora';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Disinstalla';

  @override
  String get up => 'Su';

  @override
  String get update => 'Aggiorna';

  @override
  String get upload => 'Carica';

  @override
  String get unmute => 'Riattiva Audio';

  @override
  String get mute => 'Silenzia';

  @override
  String get branding => 'Marchio';

  @override
  String get adminDrawerDashboard => 'Pannello di controllo';

  @override
  String get adminDrawerAnalytics => 'Analisi';

  @override
  String get adminDrawerSettings => 'Impostazioni';

  @override
  String get adminDrawerBranding => 'Marchio';

  @override
  String get adminDrawerUsers => 'Utenti';

  @override
  String get adminDrawerLibraries => 'Librerie';

  @override
  String get adminDrawerDisplay => 'Visualizzazione';

  @override
  String get adminDrawerMetadata => 'Metadati';

  @override
  String get adminDrawerNfo => 'Impostazioni NFO';

  @override
  String get adminDrawerTranscoding => 'Transcodifica';

  @override
  String get adminDrawerResume => 'Riprendi';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Dispositivi';

  @override
  String get adminDrawerActivity => 'Attività';

  @override
  String get adminDrawerNetworking => 'Rete';

  @override
  String get adminDrawerApiKeys => 'Chiavi API';

  @override
  String get adminDrawerBackups => 'Backup';

  @override
  String get adminDrawerLogs => 'Log';

  @override
  String get adminDrawerScheduledTasks => 'Attività Pianificate';

  @override
  String get adminDrawerPlugins => 'Plugin';

  @override
  String get adminDrawerRepositories => 'Repository';

  @override
  String get adminDrawerLiveTv => 'TV Live';

  @override
  String get adminExitTooltip => 'Esci dall\'Amministrazione';

  @override
  String get adminPremiereNoteLiveTv =>
      'La TV Live richiede Emby Premiere. Senza Premiere, il server non importa i canali e non registra nulla.';

  @override
  String get adminPremiereNoteBackups =>
      'Backup & Restore richiede Emby Premiere al termine del periodo di prova.';

  @override
  String get adminGeneralRunAtStartup =>
      'Avvia il server all\'avvio del sistema';

  @override
  String get adminGeneralLaunchWebApp =>
      'Apri l\'app web in un browser all\'avvio del server';

  @override
  String get adminGeneralBannerText => 'Testo del banner nella schermata Home';

  @override
  String get adminGeneralBannerTextHelp =>
      'Mostrato a tutti gli utenti nella loro schermata Home';

  @override
  String get adminGeneralSectionMaintenance => 'Modalità manutenzione';

  @override
  String get adminGeneralMaintenanceMode =>
      'Metti il server in modalità manutenzione';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Gli utenti vedono solo il messaggio di manutenzione.';

  @override
  String get adminGeneralMaintenanceMessage => 'Messaggio di manutenzione';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Lascialo vuoto per un messaggio generico nella lingua di ciascun utente.';

  @override
  String get adminGeneralSectionUpdates => 'Aggiornamenti automatici';

  @override
  String get adminGeneralAutoUpdate => 'Aggiorna il server automaticamente';

  @override
  String get adminGeneralAutoRestart =>
      'Riavvia automaticamente per applicare gli aggiornamenti';

  @override
  String get adminGeneralAutoRestartHelp =>
      'Il server si riavvia solo quando non ci sono utenti attivi.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'Dopo un evento di sistema ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Richiede Emby Premiere dopo una prova gratuita di 14 giorni';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby esegue i backup tramite il plugin Backup & Restore.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'Il plugin Backup & Restore non è installato. Installalo dal catalogo plugin per eseguire il backup di questo server.';

  @override
  String get adminEmbyBackupNow => 'Esegui backup ora';

  @override
  String get adminEmbyFullBackup => 'Backup completo';

  @override
  String get adminEmbyLightBackups => 'Backup del database';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return 'Ripristinare $name? Sostituisce librerie, impostazioni, utenti e password di questo server, e al termine il server si arresta. Potresti doverlo riavviare tu.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Ripristina l\'ID del server';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Disattivalo quando ripristini lo stesso backup su più di un server.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'Il ripristino è completato e il server si sta arrestando. Avvialo di nuovo se non si riavvia da solo.';

  @override
  String get adminHiddenRemotely =>
      'Nascondi dalle schermate di accesso quando connesso da remoto';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Nascondi dalle schermate di accesso sui dispositivi da cui non ha mai effettuato l\'accesso';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Limita quanti video questo utente può riprodurre contemporaneamente.';

  @override
  String get adminUnlimited => 'Illimitato';

  @override
  String get adminAutoRemoteQuality => 'Qualità remota automatica (Mbps)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Usata da remoto quando il lettore è impostato sulla qualità automatica. Lascia vuoto per rilevarla.';

  @override
  String get adminAllowCameraUpload =>
      'Consenti il caricamento dalla fotocamera';

  @override
  String get adminAllowSubtitleDownloading =>
      'Consenti il download dei sottotitoli';

  @override
  String get adminAllowMediaConversion => 'Consenti la conversione dei media';

  @override
  String get adminAllowSyncTranscoding =>
      'Consenti i download che richiedono la transcodifica';

  @override
  String get adminAllowSharingPersonalItems =>
      'Consenti la condivisione delle playlist con altri utenti';

  @override
  String get adminAllowPreferenceAccess =>
      'Consenti di cambiare la propria password e l\'immagine del profilo';

  @override
  String get adminTagMode => 'Modalità tag';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Nome utente o email Emby Connect';

  @override
  String get adminEmbyConnectHelp =>
      'Consente a questo utente di accedere da qualsiasi app Emby senza conoscere l\'indirizzo del server.';

  @override
  String get adminEmbyConnectLink => 'Collega';

  @override
  String get adminEmbyConnectUnlink => 'Scollega';

  @override
  String get adminEmbyConnectLinked => 'Collegato a Emby Connect';

  @override
  String get adminEmbyConnectPending =>
      'Invito inviato. Il collegamento avviene quando l\'utente lo accetta.';

  @override
  String get adminEmbyConnectUnlinked => 'Collegamento Emby Connect rimosso';

  @override
  String get adminEmbyConnectNotFound =>
      'Nessun account Emby Connect con questo nome utente o email.';

  @override
  String get adminLibImportPlaylists => 'Importa i file playlist';

  @override
  String get adminLibExcludeFromSearch => 'Escludi dalla ricerca globale';

  @override
  String get adminLibForcedSubtitlesOnly =>
      'Scarica solo i sottotitoli forzati';

  @override
  String get adminLibImportCollections =>
      'Importa le collezioni dai downloader di metadati';

  @override
  String get adminLibThumbnailInterval => 'Intervallo miniature di anteprima';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Ogni $count secondi';
  }

  @override
  String get adminLibThumbnailAtChapters => 'Ai marcatori dei capitoli';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Salva le miniature di anteprima nelle cartelle dei media';

  @override
  String get adminLibrarySectionMarkers => 'Marcatori intro';

  @override
  String get adminLibIntroDetection => 'Rileva le intro';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Rileva le intro durante la scansione della libreria';

  @override
  String get adminProviderEmbyGuide => 'Dati Guida Emby';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Seleziona una lineup. Se non ne compare nessuna, controlla il codice postale. Le lineup richiedono Emby Premiere.';

  @override
  String get adminLiveTvWakeServer => 'Riattiva il server per le registrazioni';

  @override
  String get adminDrawerLiveTvChannels => 'Canali TV Live';

  @override
  String get adminPageDescLiveTvChannels =>
      'Attiva e disattiva i canali e impostane l\'ordine';

  @override
  String get adminLiveTvChannelsEmpty =>
      'Nessun canale ancora. Compariranno qui quando un tuner sarà configurato e il server avrà importato i suoi canali.';

  @override
  String get adminTranscodingHwaAdvanced => 'Avanzata';

  @override
  String get adminTranscodingHwaHelp =>
      'Con Avanzata puoi scegliere e ordinare i codec hardware.';

  @override
  String get adminTranscodingHwDecoders => 'Decoder hardware preferiti';

  @override
  String get adminTranscodingHwEncoders => 'Encoder hardware preferiti';

  @override
  String get adminTranscodingTempPathHelp =>
      'Dove il transcoder tiene i file di lavoro. Lascialo vuoto per usare la cartella dati del server.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Rallenta la transcodifica quando il buffer è sufficiente, per ridurre l\'uso della CPU.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Alza il volume quando l\'audio viene sottoposto a downmix. 1 mantiene il volume originale.';

  @override
  String get adminTranscodingFontExtraction =>
      'Consenti l\'estrazione dei font al volo';

  @override
  String get adminTranscodingMaxResolution =>
      'Risoluzione massima di transcodifica';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'Un limite per ogni transcodifica, qualunque sia la qualità richiesta dall\'app.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tone mapping nelle transcodifiche software';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tone mapping nelle transcodifiche hardware';

  @override
  String get adminTranscodingToneMapHelp =>
      'Evita che i video HDR appaiano scuri e sbiaditi quando vengono transcodificati.';

  @override
  String get adminNetworkingLocalAddress => 'Indirizzo IP locale';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'L\'indirizzo locale che il server comunica alle app. Lascialo vuoto per rilevarlo automaticamente.';

  @override
  String get adminNetworkingBehindProxy => 'HTTPS gestito da un reverse proxy';

  @override
  String get adminNetworkingExternalDomain => 'Dominio esterno';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'Un dominio o nome DNS dinamico per le connessioni remote, senza protocollo né porta. Necessario per un certificato personalizzato.';

  @override
  String get adminNetworkingUpnp =>
      'Abilita la mappatura automatica delle porte';

  @override
  String get adminNetworkingUpnpHelp =>
      'Prova a mappare la porta pubblica sulla porta locale con UPnP. Alcuni router non lo supportano.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Leggi gli header del proxy per gli indirizzi dei client';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Usa header come X-Forwarded-For per trovare l\'indirizzo di ogni client. Attivalo solo dietro un reverse proxy.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Solo quando contengono indirizzi remoti';

  @override
  String get adminNetworkingIpv4Only => 'Usa IPv4 per le richieste in uscita';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'Per quando i provider di metadati e altri servizi non sono raggiungibili tramite IPv6.';

  @override
  String get adminOnePerLine => 'Uno per riga';

  @override
  String get adminStreamingStreamLimit =>
      'Numero massimo di stream video simultanei';

  @override
  String get adminStreamingStreamLimitHelp =>
      'Quanti video possono essere riprodotti contemporaneamente su tutto il server. 0 significa nessun limite.';

  @override
  String get adminSyncJobsConversions => 'Processi di conversione';

  @override
  String get adminSyncJobsDownloads => 'Processi di download';

  @override
  String get adminSyncJobsEmpty => 'Nessun processo';

  @override
  String get adminSyncJobCancel => 'Annulla processo';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return 'Annullare $name e rimuoverlo dall\'elenco?';
  }

  @override
  String get adminSyncJobConverting => 'Conversione in corso';

  @override
  String get adminSyncJobReady => 'Pronto per il trasferimento';

  @override
  String get adminSyncJobTransferring => 'Trasferimento in corso';

  @override
  String get adminSyncJobCompletedWithError => 'Completato con errori';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Database';

  @override
  String get adminPageDescDatabase => 'Dimensione della cache e manutenzione';

  @override
  String get adminDatabaseWarning =>
      'Queste sono opzioni avanzate. Lasciale ai valori predefiniti, a meno che tu non abbia un motivo per cambiarle.';

  @override
  String get adminDatabaseCacheSize => 'Dimensione cache del database (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'Quanta parte di ogni file del database il server tiene in memoria. Un valore più alto può rendere il server più veloce. Ha effetto dopo un riavvio.';

  @override
  String get adminDatabaseOptimize =>
      'Ottimizza il database all\'arresto del server';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Di solito non fa nulla, ma ogni tanto esegue un\'analisi che aiuta le query del server. Gli arresti possono richiedere più tempo.';

  @override
  String get adminDatabaseAnalysisLimit => 'Limite righe di analisi';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'Circa quante righe di ogni indice legge la fase di ottimizzazione. Più righe danno risultati migliori ma possono rallentare gli arresti.';

  @override
  String get adminDatabaseVacuum => 'Compatta il database al prossimo avvio';

  @override
  String get adminDatabaseVacuumHelp =>
      'Ricostruisce il file del database in modo che occupi il minor spazio possibile, il che può migliorare le prestazioni. Durante l\'operazione il server non è utilizzabile e non mostra l\'avanzamento, quindi non forzarne la chiusura. Si disattiva da solo dopo quell\'avvio.';

  @override
  String get adminDrawerCinemaIntros => 'Intro Cinema';

  @override
  String get adminPageDescCinemaIntros =>
      'Trailer e intro prima della riproduzione';

  @override
  String get adminCinemaIntrosPlayBefore => 'Riproduci le intro prima di';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Includi i trailer di film nuovi e in arrivo';

  @override
  String get adminCinemaIntrosOlder => 'Includi i trailer di film meno recenti';

  @override
  String get adminCinemaIntrosLibrary =>
      'Includi i trailer dei film nelle mie librerie';

  @override
  String get adminCinemaIntrosLibraryHelp =>
      'Richiede che i trailer locali siano configurati.';

  @override
  String get adminCinemaIntrosCount => 'Numero di trailer da riprodurre';

  @override
  String get adminCinemaIntrosParental => 'Controllo parentale intelligente';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Sceglie solo trailer con classificazione uguale o inferiore a quella di ciò che si sta guardando.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Riproduci le intro solo prima dei contenuti non visti';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Riproduci solo trailer simili a ciò che si sta guardando';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'In base a generi, tag, studi e così via in comune.';

  @override
  String get adminCinemaIntrosCustom => 'Intro personalizzate';

  @override
  String get adminCinemaIntrosCustomPath =>
      'Cartella delle intro personalizzate';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'Una cartella di video. Ne viene scelto uno a caso e riprodotto dopo i trailer.';

  @override
  String get adminCinemaIntrosCodecPath => 'Cartella delle intro per codec';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'Una cartella di video. Quello il cui nome file corrisponde al codec video, al codec audio, al profilo audio o a un tag viene riprodotto prima del contenuto principale.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To e server DLNA';

  @override
  String get adminDlnaPlayTo => 'Abilita DLNA Play To';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby può trovare i dispositivi nella tua rete e controllarli da remoto.';

  @override
  String get adminDlnaServer => 'Abilita il server DLNA';

  @override
  String get adminDlnaServerHelp =>
      'Consente al server di trasmettere media ai dispositivi DLNA.';

  @override
  String get adminDlnaDefaultUser => 'Utente predefinito';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Di quale utente i dispositivi connessi vedono le librerie. Un profilo dispositivo può sovrascriverlo.';

  @override
  String get adminDlnaDebugLog => 'Abilita i log di debug DLNA';

  @override
  String get adminDlnaDebugLogHelp =>
      'Crea file di log di grandi dimensioni. Attivalo solo durante la risoluzione dei problemi.';

  @override
  String get adminDrawerCameraUpload => 'Caricamento Fotocamera';

  @override
  String get adminPageDescCameraUpload =>
      'Dove vengono salvate le foto dai telefoni';

  @override
  String get adminCameraUploadPath => 'Cartella caricamento fotocamera';

  @override
  String get adminCameraUploadPathHelp =>
      'Lasciala vuota per usare la cartella predefinita. Una cartella personalizzata va aggiunta anche come libreria.';

  @override
  String get adminCameraUploadSubfolders =>
      'Crea una sottocartella per ogni dispositivo';

  @override
  String get adminDrawerConversions => 'Conversioni';

  @override
  String get adminPageDescConversions => 'Media convertiti e download';

  @override
  String get adminConversionsTempPath => 'Cartella dei file temporanei';

  @override
  String get adminConversionsTempPathHelp =>
      'Dove vengono tenuti i media durante la conversione.';

  @override
  String get adminConversionsFullSpeed => 'Converti alla massima velocità';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Per impostazione predefinita le conversioni sono lente per contenere il carico.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'Stato della licenza e chiave';

  @override
  String get adminPremiereActive => 'Premiere è attivo su questo server.';

  @override
  String get adminPremiereInactive =>
      'Questo server non ha una chiave Premiere.';

  @override
  String get adminPremiereKeyInvalid =>
      'È impostata una chiave, ma non è attiva. Potrebbe essere scritta male o scaduta.';

  @override
  String get adminPremiereCurrentKey => 'Chiave attuale';

  @override
  String get adminPremiereNewKey => 'Nuova chiave';

  @override
  String get adminPremiereNewKeyHint =>
      'Incolla la chiave dalla tua email di Emby Premiere.';

  @override
  String get adminPremiereSaveKey => 'Salva chiave';

  @override
  String get adminPremiereRemoveKey => 'Rimuovi chiave';

  @override
  String get adminPremiereKeyRejected =>
      'Emby ha salvato la chiave ma non l\'ha accettata.';

  @override
  String get adminPremiereLoadFailed =>
      'Impossibile caricare lo stato di Premiere';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere richiesto';

  @override
  String get embyPremiereRequiredBody =>
      'Questa funzione richiede un abbonamento Emby Premiere attivo sul server.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'Questa funzione richiede un abbonamento Emby Premiere attivo. Emby conserva l\'impostazione ma non la userà finché Premiere non sarà attivo.';

  @override
  String get embyPremiereLearnMore => 'Scopri di più';

  @override
  String get embyPremiereSaveAnyway => 'Salva comunque';

  @override
  String get embyPremiereEnterKey => 'Inserisci chiave';

  @override
  String get adminPremiereNote =>
      'Richiede Emby Premiere. Il server conserva questa impostazione ma non la userà finché Premiere non sarà attivo.';

  @override
  String adminExternalIdLabel(String name) {
    return 'ID $name';
  }

  @override
  String get adminExternalIdTypePerson => 'Persona';

  @override
  String get adminExternalIdTypeArtist => 'Artista';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Artista Album';

  @override
  String get adminExternalIdTypeOtherArtist => 'Altro Artista';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Gruppo di Pubblicazione';

  @override
  String get adminExternalIdTypeBook => 'Libro';

  @override
  String get adminPlaybackHwAccelWarning =>
      'L\'accelerazione hardware può essere instabile su alcuni sistemi. Mantieni aggiornati il sistema operativo e i driver video, e reimposta questa opzione su Nessuno se i video non vengono più riprodotti.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Le modifiche alle impostazioni dei metadati si applicano ai nuovi contenuti. Per aggiornare i contenuti esistenti, aggiornali dalla loro pagina di dettaglio o aggiorna la libreria.';

  @override
  String get adminLibFetcherSettings => 'Impostazioni delle fonti';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Opzioni immagini per $type';
  }

  @override
  String get adminLibFetchImages => 'Scarica le immagini';

  @override
  String get adminLibMaxBackdrops => 'Numero massimo di sfondi per elemento';

  @override
  String get adminLibMinBackdropWidth =>
      'Larghezza minima degli sfondi da scaricare';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Copertina';

  @override
  String get adminImageTypeBoxRear => 'Copertina (retro)';

  @override
  String get adminImageTypeDisc => 'Disco';

  @override
  String get adminImageTypeMenu => 'Menu';

  @override
  String get adminActivityMediaDetails => 'Dettagli media';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'es. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Lingua originale';

  @override
  String get adminMetadataFieldDateAdded => 'Data di aggiunta';

  @override
  String get adminMetadataFieldArtists => 'Artisti';

  @override
  String get adminMetadataFieldAlbumArtists => 'Artisti album';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Nome serie';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Numero episodio';

  @override
  String get adminMetadataFieldSeasonNumber => 'Numero stagione';

  @override
  String get adminMetadataFieldTrackNumber => 'Numero traccia';

  @override
  String get adminMetadataFieldDiscNumber => 'Numero disco';

  @override
  String get adminMetadataFieldAirTime => 'Orario di trasmissione';

  @override
  String get adminMetadataFieldRuntime => 'Durata in minuti';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Luogo di nascita';

  @override
  String get adminMetadataFieldBirthDate => 'Data di nascita';

  @override
  String get adminMetadataFieldBirthYear => 'Anno di nascita';

  @override
  String get adminMetadataFieldDeathDate => 'Data di morte';

  @override
  String get adminMetadataFieldAspectRatio => 'Proporzioni originali';

  @override
  String get adminMetadataFieldAirsBeforeSeason =>
      'In onda prima della stagione';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'In onda dopo la stagione';

  @override
  String get adminMetadataFieldAirsBeforeEpisode =>
      'In onda prima dell\'episodio';

  @override
  String get adminMetadataNamesHelp =>
      'Separa più nomi con un punto e virgola.';

  @override
  String get adminMetadataSectionRatings => 'Valutazioni';

  @override
  String get adminMetadataItemLocked =>
      'I metadati di questo elemento sono bloccati. Sbloccali prima di identificarlo.';

  @override
  String get adminMetadataNameOrIdRequired =>
      'Inserisci un nome o un ID esterno.';

  @override
  String get adminLibMetadataReaders => 'Lettori di metadati';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Fonti per elementi simili: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Fonti dei segmenti media';

  @override
  String get adminLibEnableLibrary => 'Abilita la libreria';

  @override
  String get adminLibEnableLibraryHelp =>
      'Se disabilitata, la libreria viene nascosta a tutti gli utenti.';

  @override
  String get adminLibSaveLyricsWithMedia =>
      'Salva i testi nelle cartelle dei media';

  @override
  String get adminLibUseCustomTagDelimiters =>
      'Usa un delimitatore di tag personalizzato';

  @override
  String get adminLibCustomTagDelimiters =>
      'Delimitatore di tag personalizzato';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Caratteri da considerare come delimitatori che separano i tag.';

  @override
  String get adminLibDelimiterWhitelist => 'Lista bianca dei delimitatori';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Voci da escludere dalla separazione dei tag, una per riga.';

  @override
  String get adminLibDownloadLanguages => 'Lingue di download';

  @override
  String get adminLibraryFolderRequired =>
      'Aggiungi almeno una cartella a questa libreria.';

  @override
  String get adminRenameLibraryWarning =>
      'Rinominando una libreria si perdono tutti i suoi metadati. Procedi con cautela.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Rimuovere la libreria \"$name\"? I file sul disco non vengono eliminati.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'Questi percorsi media verranno rimossi dalla libreria:';

  @override
  String get adminRefreshMode => 'Modalità di aggiornamento';

  @override
  String get adminRefreshModeScan => 'Cerca file nuovi e aggiornati';

  @override
  String get adminRefreshModeMissing => 'Cerca metadati mancanti';

  @override
  String get adminReplaceTrickplayImages =>
      'Sostituisci le immagini trickplay esistenti';

  @override
  String get adminRefreshDialogHelp =>
      'I metadati vengono aggiornati in base alle impostazioni e ai servizi internet abilitati nella dashboard.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown di $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuner e guida';

  @override
  String get adminLiveTvTabRecordings => 'Registrazioni';

  @override
  String get adminLiveTvAddTuner => 'Aggiungi dispositivo tuner';

  @override
  String get adminLiveTvEditTuner => 'Modifica dispositivo tuner';

  @override
  String get adminLiveTvTunerType => 'Tipo di tuner';

  @override
  String get adminLiveTvDetectDevices => 'Rileva i miei dispositivi';

  @override
  String get adminLiveTvNoNewDevices => 'Nessun nuovo dispositivo trovato';

  @override
  String get adminLiveTvDrmNote => 'I canali con DRM non verranno importati.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner salvato';

  @override
  String get adminLiveTvDeleteTuner => 'Elimina dispositivo tuner';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Sei sicuro di voler eliminare questo dispositivo tuner?';

  @override
  String get adminLiveTvDeleteProvider => 'Elimina provider guida';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Sei sicuro di voler eliminare questo provider guida?';

  @override
  String get adminLiveTvProviderSaved => 'Provider guida salvato';

  @override
  String get adminLiveTvAddProvider => 'Aggiungi provider';

  @override
  String get adminLiveTvRefreshGuide => 'Aggiorna i dati della guida';

  @override
  String get adminLiveTvMapChannels => 'Associa canali';

  @override
  String get adminLiveTvNoTunerChannels => 'Nessun canale del tuner trovato';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'Un percorso o URL di un file XMLTV. Il server lo legge e controlla se ci sono aggiornamenti. La creazione e l\'aggiornamento del file sono a tuo carico.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Crea un account su $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Accedi';

  @override
  String get adminLiveTvSdLineup => 'Lineup';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Seleziona una lineup. Se non ne compare nessuna, controlla nome utente, password e codice postale.';

  @override
  String get adminLiveTvGuideDays =>
      'Numero di giorni di dati della guida da scaricare';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'Più giorni ti permettono di programmare con più anticipo e vedere più programmi, ma il download richiede più tempo. Automatico sceglie un valore in base al numero di canali.';

  @override
  String get adminLiveTvRecordingPath =>
      'Percorso di registrazione predefinito';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Dove vengono salvate le registrazioni. Se vuoto, viene usata la cartella dei dati del programma del server.';

  @override
  String get adminLiveTvStartWhenPossible => 'Avvia quando possibile';

  @override
  String get adminLiveTvStopWhenPossible => 'Interrompi quando possibile';

  @override
  String get adminLiveTvMinutesBefore => 'minuti prima';

  @override
  String get adminLiveTvMinutesAfter => 'minuti dopo';

  @override
  String get adminLiveTvSectionGuide => 'Dati della guida';

  @override
  String get adminLiveTvSectionDefaultRecording =>
      'Impostazioni di registrazione predefinite';

  @override
  String get adminLiveTvSectionMetadata => 'Metadati delle registrazioni';

  @override
  String adminUserLastActivity(String time) {
    return 'Ultima attività $time';
  }

  @override
  String get adminCurrentPassword => 'Password attuale';

  @override
  String get adminChannelAccess => 'Accesso ai canali';

  @override
  String get adminDeviceAccess => 'Accesso ai dispositivi';

  @override
  String get adminDeleteFromAllLibraries => 'Tutte le librerie';

  @override
  String get adminUserDisabledBanner =>
      'Questo utente è disattivato. Per consentirgli di accedere di nuovo, disattiva l\'opzione \"Disattivato\" in Permessi.';

  @override
  String get adminNewPasswordEmpty => 'La nuova password non può essere vuota';

  @override
  String get adminScheduleStartBeforeEnd =>
      'L\'ora di inizio deve essere precedente all\'ora di fine';

  @override
  String get adminDashboardAlerts => 'Avvisi';

  @override
  String get adminSessionGoHome => 'Vai alla schermata Home';

  @override
  String get adminPlayMethodRemux => 'Remuxing';

  @override
  String get adminPlayMethodDirectStream => 'Stream diretto';

  @override
  String get adminPlayMethodDirectPlay => 'Riproduzione diretta';

  @override
  String get adminLogLevelTrace => 'Trace';

  @override
  String get adminLogLevelDebug => 'Debug';

  @override
  String get adminLogLevelInformation => 'Informazioni';

  @override
  String get adminLogLevelWarning => 'Avviso';

  @override
  String get adminLogLevelError => 'Errore';

  @override
  String get adminLogLevelCritical => 'Critico';

  @override
  String get adminLogLevelNone => 'Nessuno';

  @override
  String get adminActivityAllUsers => 'Tutti gli utenti';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Ultima esecuzione $time, durata $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Non riuscita';

  @override
  String get adminTaskResultCancelled => 'Annullata';

  @override
  String get adminTaskResultAborted =>
      'Interrotta dallo spegnimento del server';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '${seconds}s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Elimina trigger dell\'attività';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Sei sicuro di voler eliminare questo trigger dell\'attività?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Ogni $minutes minuti';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Ogni $hours ore';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes minuti';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours ore';
  }

  @override
  String get adminTimeLimitHours => 'Limite di tempo (ore)';

  @override
  String get adminTranscodingDecodingFor => 'Abilita decodifica hardware per';

  @override
  String get adminTranscodingThreadCountHelp =>
      'Il numero massimo di thread che una transcodifica può usare. Meno thread riducono l\'uso della CPU ma possono essere troppo lenti per una riproduzione fluida.';

  @override
  String get adminTranscodingThreadMax => 'Max';

  @override
  String get adminTranscodingFfmpegPath => 'Percorso FFmpeg';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'L\'eseguibile FFmpeg usato dal server. Si imposta sul server, non qui.';

  @override
  String get adminTranscodingAudioSeek => 'Strategia di scorrimento audio';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'Come il server gestisce l\'audio quando ti sposti in uno stream HLS.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Taglia l\'audio copiato';

  @override
  String get adminTranscodingTranscodeAudio => 'Transcodifica l\'audio';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Ripresa minima audiolibri (minuti)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Gli audiolibri interrotti prima di questo tempo contano come non riprodotti.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Minuti rimanenti dell\'audiolibro per la ripresa';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Gli audiolibri interrotti con meno di questi minuti rimanenti contano come riprodotti.';

  @override
  String get adminBrandingSplashSection => 'Schermata di avvio';

  @override
  String get adminBrandingSectionWebClient => 'Client web';

  @override
  String get adminBrandingSplashSizeHint =>
      'Le immagini personalizzate devono avere un rapporto d\'aspetto 16x9 e una dimensione minima di 1920x1080.';

  @override
  String get adminNetworkingSectionServerAddress =>
      'Impostazioni indirizzo server';

  @override
  String get adminNetworkingSectionHttps => 'Impostazioni HTTPS';

  @override
  String get adminNetworkingSectionRemoteAccess =>
      'Impostazioni accesso remoto';

  @override
  String get adminNetworkingSectionIpProtocols => 'Protocolli IP';

  @override
  String get adminNetworkingSectionDiscovery => 'Rilevamento in rete';

  @override
  String get adminNetworkingSectionFirewall => 'Impostazioni firewall e proxy';

  @override
  String get adminNetworkingLocalHttpPort => 'Numero porta HTTP locale';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'Il numero di porta TCP per il server HTTP.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Ascolta sulla porta HTTPS. Perché abbia effetto deve essere impostato anche un certificato valido.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Numero porta HTTPS locale';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'Il numero di porta TCP per il server HTTPS.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Aggiunge una sottocartella all\'URL del server, ad esempio https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress =>
      'Associa all\'indirizzo di rete locale';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Sostituisce l\'indirizzo IP locale del server HTTP. Lascialo vuoto per usare tutti gli indirizzi. La modifica richiede un riavvio.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'Indirizzi IP o voci IP/netmask delle reti considerate locali per i limiti di banda e di accesso remoto. Lascialo vuoto per considerare locali tutti gli indirizzi RFC1918.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'Indirizzi IP o nomi host dei proxy davanti a questo server. Servono per leggere le intestazioni X-Forwarded-For. La modifica richiede un riavvio.';

  @override
  String get adminNetworkingCustomCertPath =>
      'Percorso certificato SSL personalizzato';

  @override
  String get adminNetworkingCertPathHelp =>
      'Percorso di un file PKCS #12 con certificato e chiave privata, per TLS su un dominio personalizzato.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Inserisci la password se il certificato ne richiede una.';

  @override
  String get adminNetworkingAllowRemote =>
      'Consenti connessioni remote a questo server';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'Se disattivato, tutte le connessioni remote vengono bloccate.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'Indirizzi IP o voci IP/netmask di reti remote. Lascialo vuoto per consentire qualsiasi indirizzo remoto.';

  @override
  String get adminNetworkingRemoteIpFilterMode =>
      'Modalità filtro indirizzi IP remoti';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'La porta pubblica associata alla porta HTTP locale.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'La porta pubblica associata alla porta HTTPS locale.';

  @override
  String get adminNetworkingAutoDiscoveryLabel =>
      'Abilita rilevamento automatico';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Permette alle app di trovare questo server sulla porta UDP 7359.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Usa lo stesso URI pubblicato del server per l\'accesso interno ed esterno';

  @override
  String get adminNetworkingPublishedUri => 'URI pubblicato del server';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Sostituisce l\'URI comunicato dal server, in base all\'interfaccia o all\'indirizzo IP del client.';

  @override
  String get adminNetworkingInternalUri => 'URI interno';

  @override
  String get adminNetworkingInternalUriHelp =>
      'URI pubblicato del server per l\'accesso interno.';

  @override
  String get adminNetworkingExternalUri => 'URI esterno';

  @override
  String get adminNetworkingExternalUriHelp =>
      'URI pubblicato del server per l\'accesso esterno.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Altri URI pubblicati';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URI per una singola subnet o interfaccia, scritti come subnet=URI.';

  @override
  String get adminBackupsHelp =>
      'Crea e ripristina copie del tuo server. Possono includere database, metadati, sottotitoli e immagini trickplay.';

  @override
  String get adminBackupDisclaimer =>
      'A seconda delle dimensioni della libreria, il backup può richiedere un po\' di tempo.';

  @override
  String get adminBackupTasksWarningTitle =>
      'Ci sono attività pianificate in esecuzione';

  @override
  String get adminBackupTasksWarning =>
      'Interrompi queste attività o attendi che finiscano prima di creare un backup.';

  @override
  String get adminBackupArchiveNotFound =>
      'Il server non ha trovato questo archivio di backup.';

  @override
  String get adminRestoreInProgress => 'Ripristino in corso';

  @override
  String get adminRestoreWaitingForServer =>
      'In attesa che il server torni disponibile.';

  @override
  String get adminRestoreSucceeded => 'Ripristino completato';

  @override
  String get adminLogWatch => 'Segui';

  @override
  String get adminLogStopWatching => 'Smetti di seguire';

  @override
  String get adminPluginInstallConfirmTitle => 'Conferma installazione plugin';

  @override
  String get adminPluginInstallDisclaimer =>
      'Installare un plugin di terze parti comporta dei rischi. Potrebbe contenere codice instabile o dannoso e può cambiare in qualsiasi momento. Installa solo plugin di autori di cui ti fidi e informati su cosa possono fare, ad esempio interrogare servizi esterni, rallentare le scansioni della libreria o aggiungere attività in background.';

  @override
  String get adminGroupOverview => 'Panoramica';

  @override
  String get adminGroupLibrary => 'Libreria';

  @override
  String get adminGroupPlayback => 'Riproduzione';

  @override
  String get adminGroupPeople => 'Persone';

  @override
  String get adminGroupSystem => 'Sistema';

  @override
  String get adminAreasLabel => 'Aree di amministrazione';

  @override
  String get adminPagesLabel => 'Pagine';

  @override
  String get adminPageDescDashboard =>
      'Stato del server, sessioni e attività recenti';

  @override
  String get adminPageDescAnalytics =>
      'Dimensioni delle librerie, codec e formati';

  @override
  String get adminPageDescActivity => 'Tutto ciò che è successo sul server';

  @override
  String get adminPageDescTasks => 'Scansioni, pulizie e relativi trigger';

  @override
  String get adminPageDescLibraries => 'Cartelle, scanner e fonti dei metadati';

  @override
  String get adminPageDescDisplay => 'Come le librerie appaiono agli utenti';

  @override
  String get adminPageDescMetadata => 'Lingua, paese e immagini predefiniti';

  @override
  String get adminPageDescNfo => 'Lettura e salvataggio degli NFO di Kodi';

  @override
  String get adminPageDescLiveTv => 'Tuner, dati della guida e registrazioni';

  @override
  String get adminPageDescTranscoding =>
      'Accelerazione hardware, encoder, tone mapping';

  @override
  String get adminPageDescResume =>
      'Quando gli elementi contano come iniziati o riprodotti';

  @override
  String get adminPageDescStreaming => 'Limite bitrate remoto';

  @override
  String get adminPageDescTrickplay =>
      'Miniature di anteprima per lo scorrimento';

  @override
  String get adminPageDescUsers => 'Account, accessi e controllo parentale';

  @override
  String get adminPageDescDevices =>
      'Dispositivi con accesso effettuato e relativi nomi';

  @override
  String get adminPageDescApiKeys => 'Chiavi per app e script';

  @override
  String get adminPageDescSettings =>
      'Nome server, lingua, percorsi, prestazioni';

  @override
  String get adminPageDescBranding =>
      'Messaggio di accesso, CSS personalizzato, schermata di avvio';

  @override
  String get adminPageDescNetworking => 'Porte, HTTPS, LAN e accesso remoto';

  @override
  String get adminPageDescPlugins => 'Plugin installati e catalogo';

  @override
  String get adminPageDescRepositories => 'Da dove arrivano i plugin';

  @override
  String get adminPageDescBackups => 'Crea e ripristina backup del server';

  @override
  String get adminPageDescLogs => 'File di log del server';

  @override
  String adminSearchSettingsHint(int count) {
    return 'Cerca tra $count impostazioni';
  }

  @override
  String get adminSearchNoResults => 'Nessuna impostazione corrispondente';

  @override
  String get adminSearchClear => 'Cancella ricerca';

  @override
  String get adminUnsavedChanges => 'Modifiche non salvate';

  @override
  String get adminDiscard => 'Scarta';

  @override
  String get adminLeaveTitle => 'Scartare le modifiche non salvate?';

  @override
  String get adminLeaveMessage =>
      'Le modifiche in questa pagina non sono ancora state salvate.';

  @override
  String get adminKeepEditing => 'Continua a modificare';

  @override
  String get adminDashboardLoadFailed => 'Impossibile caricare la dashboard';

  @override
  String get adminMediaOverview => 'Panoramica Media';

  @override
  String get adminMediaTotalsError =>
      'Impossibile caricare i totali media del server.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Una panoramica rapida su quanti contenuti ci sono su questo server.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Aggiornamenti plugin disponibili: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugin che richiedono il riavvio: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Attività pianificate non riuscite: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribuzione Media';

  @override
  String get analyticsVideoCodecs => 'Codec Video';

  @override
  String get analyticsAudioCodecs => 'Codec Audio';

  @override
  String get analyticsContainers => 'Contenitori';

  @override
  String get analyticsTopGenres => 'Generi Principali';

  @override
  String get analyticsReleaseYears => 'Anni di Uscita';

  @override
  String get analyticsContentRatings => 'Classificazioni Contenuti';

  @override
  String get analyticsRuntimeBuckets => 'Fasce Durata';

  @override
  String get analyticsFileFormats => 'Formati File';

  @override
  String get analyticsNoData => 'Nessun Dato Disponibile.';

  @override
  String get adminServerInfo => 'Info Server';

  @override
  String get adminRestartPending => 'Riavvio in Attesa';

  @override
  String get adminServerPaths => 'Percorsi Server';

  @override
  String get adminServerActions => 'Azioni Server';

  @override
  String get adminRestartServer => 'Riavvia Server';

  @override
  String get adminShutdownServer => 'Spegni Server';

  @override
  String get adminLibraryScanStarted => 'Scansione libreria avviata';

  @override
  String errorGeneric(String error) {
    return 'Errore: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Riavvio server in corso';

  @override
  String get adminServerRebootMessage =>
      'Riavvio server in corso, riavvia Moonfin';

  @override
  String get adminActiveSessions => 'Sessioni Attive';

  @override
  String get adminSessionsLoadFailed => 'Impossibile caricare le sessioni';

  @override
  String get adminNoActiveSessions => 'Nessuna sessione attiva';

  @override
  String get adminRecentActivity => 'Attività Recente';

  @override
  String get adminNoRecentActivity => 'Nessuna attività recente';

  @override
  String adminCommandFailed(String error) {
    return 'Comando non riuscito: $error';
  }

  @override
  String get adminSendMessage => 'Invia Messaggio';

  @override
  String get adminMessageTextHint => 'Testo del messaggio';

  @override
  String get adminSetVolume => 'Imposta Volume';

  @override
  String get sessionPrev => 'Precedente';

  @override
  String get sessionRewind => 'Riavvolgi';

  @override
  String get sessionForward => 'Avanti veloce';

  @override
  String get sessionNext => 'Successivo';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'In Riproduzione';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Azioni';

  @override
  String get videoCodec => 'Codec Video';

  @override
  String get audioCodec => 'Codec Audio';

  @override
  String get hwAccel => 'Accel. HW';

  @override
  String get completion => 'Completamento';

  @override
  String get adminClearDates => 'Cancella date';

  @override
  String get adminActivitySeverityAll => 'Tutte le gravità';

  @override
  String get adminActivityDateRange => 'Intervallo di date';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Impossibile caricare il registro attività: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nessuna voce di attività';

  @override
  String get adminEditDeviceName => 'Modifica Nome Dispositivo';

  @override
  String get adminCustomName => 'Nome Personalizzato';

  @override
  String get adminDeviceNameUpdated => 'Nome dispositivo aggiornato';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Impossibile aggiornare il dispositivo: $error';
  }

  @override
  String get adminDeleteDevice => 'Elimina Dispositivo';

  @override
  String get adminDeviceDeleted => 'Dispositivo eliminato';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Impossibile eliminare il dispositivo: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Rimuovere il dispositivo \"$name\"? L\'utente dovrà accedere di nuovo su questo dispositivo.';
  }

  @override
  String get adminDeleteAllDevices => 'Elimina tutti i dispositivi';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Rimuovere $count dispositivi? Gli utenti interessati dovranno accedere di nuovo. Il tuo dispositivo attuale non è interessato.';
  }

  @override
  String get adminDevicesDeletedAll => 'Dispositivi rimossi';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Alcuni dispositivi rimossi; $count non è stato possibile rimuoverli.';
  }

  @override
  String get adminDevicesLoadFailed => 'Impossibile caricare i dispositivi';

  @override
  String get adminSearchDevices => 'Cerca dispositivi';

  @override
  String get adminThisDevice => 'Questo Dispositivo';

  @override
  String get adminEditName => 'Modifica Nome';

  @override
  String get adminLibrariesLoadFailed => 'Impossibile caricare le librerie';

  @override
  String get adminNoLibraries => 'Nessuna libreria configurata';

  @override
  String get adminScanAllLibraries => 'Scansiona Tutte le Librerie';

  @override
  String get adminAddLibrary => 'Aggiungi Libreria';

  @override
  String adminScanFailed(String error) {
    return 'Impossibile avviare la scansione: $error';
  }

  @override
  String get adminRenameLibrary => 'Rinomina Libreria';

  @override
  String get adminNewName => 'Nuovo nome';

  @override
  String adminLibraryRenamed(String name) {
    return 'Libreria rinominata in \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Impossibile rinominare: $error';
  }

  @override
  String get adminDeleteLibrary => 'Elimina Libreria';

  @override
  String adminLibraryDeleted(String name) {
    return 'Libreria \"$name\" eliminata';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Impossibile eliminare la libreria: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Impossibile aggiungere il percorso: $error';
  }

  @override
  String get adminRemovePath => 'Rimuovi Percorso';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Rimuovere \"$path\" da questa libreria?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Impossibile rimuovere il percorso: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Impossibile caricare la libreria';

  @override
  String get adminNoMediaPaths => 'Nessun percorso media configurato';

  @override
  String get adminAddPath => 'Aggiungi Percorso';

  @override
  String get adminBrowseFilesystem => 'Sfoglia il filesystem del server:';

  @override
  String get adminPreferredMetadataLanguage => 'Lingua metadati preferita';

  @override
  String get adminMetadataLanguageHint => 'es. it, en, de';

  @override
  String get adminMetadataCountryCode => 'Codice paese metadati';

  @override
  String get adminMetadataCountryHint => 'es. IT, US, DE';

  @override
  String get adminLibraryTabPaths => 'Percorsi';

  @override
  String get adminLibraryTabOptions => 'Opzioni';

  @override
  String get adminLibraryTabDownloaders => 'Downloader';

  @override
  String get adminLibMetadataSavers => 'Salvataggio metadati';

  @override
  String get adminLibSubtitleDownloaders => 'Downloader sottotitoli';

  @override
  String get adminLibLyricDownloaders => 'Downloader testi';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Downloader metadati: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Fonti immagini: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Questo server non espone downloader per questo tipo di libreria.';

  @override
  String get adminLibrarySectionGeneral => 'Generale';

  @override
  String get adminLibrarySectionMetadata => 'Metadati';

  @override
  String get adminLibrarySectionEmbedded => 'Info Incorporate';

  @override
  String get adminLibrarySectionSubtitles => 'Sottotitoli';

  @override
  String get adminLibrarySectionImages => 'Immagini';

  @override
  String get adminLibrarySectionSeries => 'Serie';

  @override
  String get adminLibrarySectionMusic => 'Musica';

  @override
  String get adminLibrarySectionMovies => 'Film';

  @override
  String get adminLibRealtimeMonitor =>
      'Abilita il monitoraggio in tempo reale';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Rileva le modifiche ai file e le elabora automaticamente.';

  @override
  String get adminLibEnablePhotos => 'Mostra le foto';

  @override
  String get adminLibSaveLocalMetadata =>
      'Salva le immagini nelle cartelle dei media';

  @override
  String get adminLibRefreshInterval => 'Aggiornamento automatico dei metadati';

  @override
  String get adminLibRefreshNever => 'Mai';

  @override
  String get adminLibDefault => 'Predefinito';

  @override
  String get adminLibDisplayTitle => 'Visualizzazione';

  @override
  String get adminLibDisplaySection => 'Visualizzazione libreria';

  @override
  String get adminLibFolderView =>
      'Mostra una vista cartelle per le cartelle multimediali semplici';

  @override
  String get adminLibSpecialsInSeasons =>
      'Mostra gli speciali nelle stagioni in cui sono andati in onda';

  @override
  String get adminLibGroupMovies => 'Raggruppa i film in collezioni';

  @override
  String get adminLibGroupShows => 'Raggruppa le serie in collezioni';

  @override
  String get adminLibExternalSuggestions =>
      'Mostra contenuti esterni nei suggerimenti';

  @override
  String get adminLibDateAddedSection => 'Comportamento data di aggiunta';

  @override
  String get adminLibDateAddedLabel => 'Usa la data di aggiunta da';

  @override
  String get adminLibDateAddedImport => 'Data di scansione nella libreria';

  @override
  String get adminLibDateAddedFile => 'Data di creazione del file';

  @override
  String get adminLibMetadataTitle => 'Metadati e Immagini';

  @override
  String get adminLibMetadataLangSection => 'Lingua preferita dei metadati';

  @override
  String get adminLibChaptersSection => 'Capitoli';

  @override
  String get adminLibDummyChapterDuration =>
      'Durata capitoli fittizi (secondi)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Durata dei capitoli generati per i media che non ne hanno. Imposta 0 per disabilitare.';

  @override
  String get adminLibChapterImageResolution => 'Risoluzione immagini capitoli';

  @override
  String get adminLibNfoTitle => 'Impostazioni NFO';

  @override
  String get adminLibNfoHelp =>
      'I metadati NFO sono compatibili con Kodi e client simili. Le impostazioni si applicano a tutte le librerie che salvano metadati NFO.';

  @override
  String get adminLibKodiUser =>
      'Utente per cui memorizzare i dati di visione nei file NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Salva i percorsi delle immagini nei file NFO';

  @override
  String get adminLibPathSubstitution =>
      'Abilita la sostituzione dei percorsi per le immagini NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copia le immagini extrafanart in una cartella extrathumbs';

  @override
  String get adminLibNone => 'Nessuno';

  @override
  String adminLibRefreshDays(int days) {
    return '$days giorni';
  }

  @override
  String get adminLibEmbeddedTitles => 'Usa i titoli incorporati';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Usa i titoli incorporati per gli extra';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Usa le informazioni episodio incorporate';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Consenti i sottotitoli incorporati';

  @override
  String get adminLibEmbeddedAllowAll => 'Consenti tutti';

  @override
  String get adminLibEmbeddedAllowText => 'Solo testo';

  @override
  String get adminLibEmbeddedAllowImage => 'Solo immagine';

  @override
  String get adminLibEmbeddedAllowNone => 'Nessuno';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Salta il download se sono presenti sottotitoli incorporati';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Salta il download se la traccia audio corrisponde alla lingua di download';

  @override
  String get adminLibRequirePerfectMatch =>
      'Richiedi una corrispondenza perfetta dei sottotitoli';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Salva i sottotitoli nelle cartelle dei media';

  @override
  String get adminLibChapterImageExtraction =>
      'Estrai le immagini dei capitoli';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Estrai le immagini dei capitoli durante la scansione della libreria';

  @override
  String get adminLibTrickplayExtraction =>
      'Abilita l\'estrazione delle immagini trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Estrai le immagini trickplay durante la scansione della libreria';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Salva le immagini trickplay nelle cartelle dei media';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Unisci automaticamente le serie distribuite su più cartelle';

  @override
  String get adminLibSeasonZeroName => 'Nome visualizzato della stagione zero';

  @override
  String get adminLibLufsScan =>
      'Abilita la scansione LUFS per la normalizzazione audio';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferisci il tag artists non standard';

  @override
  String get adminLibAutoAddToCollection =>
      'Aggiungi automaticamente i film alle collezioni';

  @override
  String get adminLibraryNameRequired =>
      'Il nome della libreria è obbligatorio';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Impossibile creare la libreria: $error';
  }

  @override
  String get adminLibraryName => 'Nome Libreria';

  @override
  String get adminSelectedPaths => 'Percorsi Selezionati:';

  @override
  String get adminCreateLibrary => 'Crea Libreria';

  @override
  String get paths => 'Percorsi:';

  @override
  String get adminDisableUser => 'Disabilita Utente';

  @override
  String get adminEnableUser => 'Abilita Utente';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Disabilitare $name? Non potrà più accedere.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Abilitare $name? Potrà accedere di nuovo.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Utente \"$name\" disabilitato';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Utente \"$name\" abilitato';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Impossibile aggiornare la policy utente: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Impossibile caricare gli utenti';

  @override
  String get adminSearchUsers => 'Cerca utenti';

  @override
  String get adminEditUser => 'Modifica Utente';

  @override
  String get adminAddUser => 'Aggiungi Utente';

  @override
  String adminUserCreateFailed(String error) {
    return 'Impossibile creare l\'utente: $error';
  }

  @override
  String get adminCreateUser => 'Crea Utente';

  @override
  String get adminPasswordOptional => 'Password (opzionale)';

  @override
  String get adminUsernameRequired => 'Il nome utente non può essere vuoto';

  @override
  String adminSaveFailed(String error) {
    return 'Impossibile salvare: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Le password non corrispondono';

  @override
  String adminFailed(String error) {
    return 'Non riuscito: $error';
  }

  @override
  String get adminUserLoadFailed => 'Impossibile caricare l\'utente';

  @override
  String get adminDeleteUser => 'Elimina Utente';

  @override
  String get admin => 'Amministrazione';

  @override
  String get adminFullAccessWarning =>
      'Gli amministratori hanno accesso completo al server. Concedi con cautela.';

  @override
  String get administrator => 'Amministratore';

  @override
  String get adminHiddenUser => 'Utente nascosto';

  @override
  String get adminAllowMediaPlayback => 'Consenti riproduzione media';

  @override
  String get adminAllowAudioTranscoding => 'Consenti transcodifica audio';

  @override
  String get adminAllowVideoTranscoding => 'Consenti transcodifica video';

  @override
  String get adminAllowRemuxing => 'Consenti remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Forza transcodifica sorgente remota';

  @override
  String get adminAllowContentDownloading => 'Consenti download contenuti';

  @override
  String get adminAllowPublicSharing => 'Consenti condivisione pubblica';

  @override
  String get adminAllowRemoteControl =>
      'Consenti controllo remoto di altri utenti';

  @override
  String get adminAllowSharedDeviceControl =>
      'Consenti controllo dispositivo condiviso';

  @override
  String get adminAllowRemoteAccess => 'Consenti accesso remoto';

  @override
  String get adminLeaveEmptyNoLimit => 'Lascia vuoto per nessun limite';

  @override
  String get adminMaxActiveSessions => 'Sessioni attive massime';

  @override
  String get adminAllowLiveTvAccess => 'Consenti accesso TV Live';

  @override
  String get adminAllowLiveTvManagement => 'Consenti gestione TV Live';

  @override
  String get adminAllowCollectionManagement => 'Consenti gestione collezioni';

  @override
  String get adminAllowSubtitleManagement => 'Consenti gestione sottotitoli';

  @override
  String get adminAllowLyricManagement => 'Consenti gestione testi';

  @override
  String get adminEnableAllLibraryAccess =>
      'Abilita accesso a tutte le librerie';

  @override
  String get adminChangePassword => 'Cambia Password';

  @override
  String get adminNewPassword => 'Nuova Password';

  @override
  String get adminConfirmPassword => 'Conferma Password';

  @override
  String get adminSetPassword => 'Imposta Password';

  @override
  String get adminResetPassword => 'Reimposta Password';

  @override
  String get adminPasswordReset => 'Reimpostazione della password';

  @override
  String get adminPasswordUpdated => 'Password aggiornata';

  @override
  String get adminUserSettings => 'Impostazioni utente';

  @override
  String get adminLibraryAccess => 'Accesso alla biblioteca';

  @override
  String get adminEnableAllDevices =>
      'Abilita l\'accesso a tutti i dispositivi';

  @override
  String get adminEnableAllChannels => 'Abilita l\'accesso a tutti i canali';

  @override
  String get adminParentalControl => 'Controllo Parentale';

  @override
  String get adminMaxParentalRating =>
      'Classificazione parentale massima consentita';

  @override
  String get adminMaxParentalRatingHint =>
      'I contenuti con una classificazione superiore saranno nascosti a questo utente.';

  @override
  String get adminParentalRatingNone => 'Nessuna';

  @override
  String get adminBlockUnratedItems =>
      'Blocca gli elementi senza classificazione o con classificazione non riconosciuta';

  @override
  String get adminUnratedBook => 'Libri';

  @override
  String get adminUnratedChannelContent => 'Canali';

  @override
  String get adminUnratedLiveTvChannel => 'TV Live';

  @override
  String get adminUnratedMovie => 'Film';

  @override
  String get adminUnratedMusic => 'Musica';

  @override
  String get adminUnratedTrailer => 'Trailer';

  @override
  String get adminUnratedSeries => 'Serie';

  @override
  String get adminAccessSchedules => 'Orari di Accesso';

  @override
  String get adminAccessSchedulesHint =>
      'Consenti l\'accesso solo durante gli orari pianificati qui sotto. Se non è impostato alcun orario, l\'accesso è consentito tutto il giorno.';

  @override
  String get adminAddSchedule => 'Aggiungi Orario';

  @override
  String get adminScheduleDay => 'Giorno';

  @override
  String get adminScheduleStart => 'Inizio';

  @override
  String get adminScheduleEnd => 'Fine';

  @override
  String get adminDayEveryday => 'Ogni giorno';

  @override
  String get adminDayWeekday => 'Giorni feriali';

  @override
  String get adminDayWeekend => 'Fine settimana';

  @override
  String get adminDaySunday => 'Domenica';

  @override
  String get adminDayMonday => 'Lunedì';

  @override
  String get adminDayTuesday => 'Martedì';

  @override
  String get adminDayWednesday => 'Mercoledì';

  @override
  String get adminDayThursday => 'Giovedì';

  @override
  String get adminDayFriday => 'Venerdì';

  @override
  String get adminDaySaturday => 'Sabato';

  @override
  String get adminAllowedTags => 'Tag consentiti';

  @override
  String get adminAllowedTagsHint =>
      'Vengono mostrati solo i contenuti con questi tag. Lascia vuoto per consentire tutto.';

  @override
  String get adminBlockedTags => 'Tag bloccati';

  @override
  String get adminBlockedTagsHint =>
      'I contenuti con questi tag sono nascosti a questo utente.';

  @override
  String get adminAddTag => 'Aggiungi tag';

  @override
  String get adminAuthProvider => 'Provider di autenticazione';

  @override
  String get adminPasswordResetProvider =>
      'Provider di reimpostazione password';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Numero massimo di tentativi di accesso falliti prima del blocco';

  @override
  String get adminLoginAttemptsHint =>
      'Imposta 0 per il valore predefinito, o -1 per disabilitare il blocco.';

  @override
  String get adminSyncPlayAccess => 'Accesso SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Consenti di creare gruppi e di unirsi';

  @override
  String get adminSyncPlayJoin => 'Consenti di unirsi ai gruppi';

  @override
  String get adminSyncPlayNone => 'Nessun accesso';

  @override
  String get adminContentDeletionFolders =>
      'Consenti l\'eliminazione dei contenuti da';

  @override
  String get adminResetPasswordWarning =>
      'Ciò rimuoverà la password. L\'utente potrà accedere senza password.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Il server ha restituito HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Sei sicuro di voler eliminare $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Utente \"$name\" eliminato';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Impossibile eliminare l\'utente: $error';
  }

  @override
  String get adminCreateApiKey => 'Crea Chiave API';

  @override
  String get adminAppName => 'Nome app';

  @override
  String get adminApiKeyCreated => 'Chiave API Creata';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Chiave creata con successo. Il server non ha restituito il token. Controlla le chiavi API del server.';

  @override
  String get adminKeyCopied => 'Chiave copiata negli appunti';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Impossibile creare la chiave: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token chiave mancante nella risposta del server';

  @override
  String get adminRevokeApiKey => 'Revoca Chiave API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revocare la chiave per $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Chiave API revocata';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Impossibile revocare la chiave: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Impossibile caricare le chiavi API';

  @override
  String get adminApiKeysTitle => 'Chiavi API';

  @override
  String get adminCreateKey => 'Crea Chiave';

  @override
  String get adminNoApiKeys => 'Nessuna chiave API trovata';

  @override
  String get adminUnknownApp => 'Applicazione sconosciuta';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreato: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Crea Backup';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Sempre incluso';

  @override
  String get adminBackupMetadata => 'Metadati';

  @override
  String get adminBackupSubtitles => 'Sottotitoli';

  @override
  String get adminBackupTrickplay => 'Immagini trickplay';

  @override
  String get adminCreatingBackup => 'Creazione backup…';

  @override
  String get adminBackupCreated => 'Backup creato con successo';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Impossibile creare il backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Percorso backup mancante nella risposta del server';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesto: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Impossibile caricare il manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Conferma Ripristino';

  @override
  String get adminRestoringBackup => 'Ripristino backup…';

  @override
  String adminRestoreFailed(String error) {
    return 'Impossibile ripristinare il backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Impossibile caricare i backup';

  @override
  String get adminCreateBackup => 'Crea Backup';

  @override
  String get adminNoBackups => 'Nessun backup trovato';

  @override
  String get adminViewDetails => 'Visualizza Dettagli';

  @override
  String get restore => 'Ripristina';

  @override
  String get adminLogsLoadFailed => 'Impossibile caricare i log del server';

  @override
  String get adminNoLogFiles => 'Nessun file di log trovato';

  @override
  String get adminLogCopied => 'Log copiato negli appunti';

  @override
  String get adminSaveLogFile => 'Salva file log';

  @override
  String adminSavedTo(String path) {
    return 'Salvato in $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Impossibile salvare il file: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Impossibile caricare $fileName';
  }

  @override
  String get adminSearchInLog => 'Cerca nel log';

  @override
  String get adminNoMatchingLines => 'Nessuna riga corrispondente';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Impossibile caricare le attività: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nessuna attività pianificata trovata';

  @override
  String get adminNoTasksMatchFilter =>
      'Nessuna attività corrisponde al filtro attuale';

  @override
  String adminTaskStartFailed(String error) {
    return 'Impossibile avviare l\'attività: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Impossibile fermare l\'attività: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Impossibile caricare l\'attività: $error';
  }

  @override
  String get adminRunNow => 'Esegui Ora';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Impossibile rimuovere il trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Impossibile aggiungere il trigger: $error';
  }

  @override
  String get adminLastExecution => 'Ultima Esecuzione';

  @override
  String get adminTriggers => 'Trigger';

  @override
  String get adminAddTrigger => 'Aggiungi Trigger';

  @override
  String get adminNoTriggers => 'Nessun trigger configurato';

  @override
  String get adminTriggerType => 'Tipo Trigger';

  @override
  String get adminNoLimit => 'Nessun limite';

  @override
  String adminHours(String hours) {
    return '$hours ora/e';
  }

  @override
  String get adminDayOfWeek => 'Giorno della settimana';

  @override
  String get adminSearchPlugins => 'Cerca plugin…';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Impossibile attivare/disattivare il plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Disinstalla Plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Sei sicuro di voler disinstallare \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Impossibile disinstallare il plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Impossibile installare il pacchetto: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Impossibile installare l\'aggiornamento: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Impossibile caricare i plugin: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nessun plugin corrisponde alla ricerca';

  @override
  String get adminNoPluginsInstalled => 'Nessun plugin installato';

  @override
  String adminInstallUpdate(String version) {
    return 'Installa aggiornamento (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Impossibile caricare il catalogo: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Nessun pacchetto corrisponde alla ricerca';

  @override
  String get adminNoPackagesAvailable => 'Nessun pacchetto disponibile';

  @override
  String get adminExperimentalIntegration => 'Integrazione Sperimentale';

  @override
  String get adminExperimentalWarning =>
      'L\'integrazione delle impostazioni dei plugin è ancora sperimentale. Alcune pagine di impostazioni potrebbero non essere visualizzate correttamente.';

  @override
  String get continueAction => 'Continua';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" verrà rimosso dopo il riavvio del server';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Impossibile disinstallare: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Aggiornamento di \"$name\" alla v$version…';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Impossibile caricare il plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin non trovato';

  @override
  String adminPluginVersion(String version) {
    return 'Versione $version';
  }

  @override
  String get adminEnablePlugin => 'Abilita Plugin';

  @override
  String get adminPluginSettingsPage => 'Pagina impostazioni plugin';

  @override
  String get adminRevisionHistory => 'Cronologia Revisioni';

  @override
  String get adminNoChangelog => 'Nessun changelog disponibile.';

  @override
  String get adminRemoveRepository => 'Rimuovi Repository';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Sei sicuro di voler rimuovere \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Impossibile salvare i repository: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Impossibile caricare i repository: $error';
  }

  @override
  String get adminRepositoryNameHint => 'es. Jellyfin Stabile';

  @override
  String get adminRepositoryUrl => 'URL Repository';

  @override
  String get adminAddEntry => 'Aggiungi voce';

  @override
  String get adminInvalidUrl => 'URL non valido';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Impossibile caricare le impostazioni del plugin: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Impossibile aprire $uri';
  }

  @override
  String get adminOpenInBrowser => 'Apri nel Browser';

  @override
  String get adminOpenExternally => 'Apri esternamente';

  @override
  String get adminGeneralSettings => 'Impostazioni Generali';

  @override
  String get adminServerName => 'Nome server';

  @override
  String get adminPreferredMetadataCountry => 'Paese metadati preferito';

  @override
  String get adminCachePath => 'Percorso cache';

  @override
  String get adminMetadataPath => 'Percorso metadati';

  @override
  String get adminLibraryScanConcurrency => 'Concorrenza scansione libreria';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limite codifica immagini parallela';

  @override
  String get adminSlowResponseThreshold => 'Soglia risposta lenta (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Impossibile caricare le impostazioni di branding';

  @override
  String get adminLoginDisclaimer => 'Disclaimer accesso';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML visualizzato sotto il modulo di accesso';

  @override
  String get adminCustomCss => 'CSS Personalizzato';

  @override
  String get adminCustomCssHint =>
      'CSS personalizzato applicato all\'interfaccia web';

  @override
  String get adminEnableSplashScreen => 'Abilita schermata di avvio';

  @override
  String get adminStreamingLoadFailed =>
      'Impossibile caricare le impostazioni di streaming';

  @override
  String get adminStreamingDescription =>
      'Imposta limiti globali di bitrate streaming per connessioni remote.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limite bitrate client remoto (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Lascia vuoto o 0 per illimitato';

  @override
  String get adminPlaybackLoadFailed =>
      'Impossibile caricare le impostazioni di riproduzione';

  @override
  String get adminHardwareAcceleration => 'Accelerazione hardware';

  @override
  String get adminVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Abilita codifica hardware';

  @override
  String get adminEnableHardwareDecoding => 'Abilita decodifica hardware per:';

  @override
  String get adminEncodingThreads => 'Thread di codifica';

  @override
  String get adminAutomatic => '0 = automatico';

  @override
  String get adminTranscodingTempPath => 'Percorso temporaneo transcodifica';

  @override
  String get adminEnableFallbackFont => 'Abilita font di riserva';

  @override
  String get adminFallbackFontPath => 'Percorso font di riserva';

  @override
  String get adminAllowSegmentDeletion => 'Consenti eliminazione segmenti';

  @override
  String get adminSegmentKeepSeconds => 'Mantenimento segmenti (secondi)';

  @override
  String get adminThrottleBuffering => 'Limitazione buffering';

  @override
  String get adminTrickplayLoadFailed =>
      'Impossibile caricare le impostazioni trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Abilita accelerazione hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Abilita estrazione solo fotogrammi chiave';

  @override
  String get adminKeyFrameSubtitle => 'Più veloce ma meno preciso';

  @override
  String get adminScanBehavior => 'Comportamento scansione';

  @override
  String get adminProcessPriority => 'Priorità processo';

  @override
  String get adminImageSettings => 'Impostazioni Immagine';

  @override
  String get adminIntervalMs => 'Intervallo (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Frequenza di cattura dei fotogrammi';

  @override
  String get adminWidthResolutions => 'Risoluzioni larghezza';

  @override
  String get adminTileWidth => 'Larghezza tile';

  @override
  String get adminTileHeight => 'Altezza tile';

  @override
  String get adminQualitySubtitle =>
      'Valori più bassi = qualità migliore, file più grandi';

  @override
  String get adminProcessThreads => 'Thread di processo';

  @override
  String get adminResumeLoadFailed =>
      'Impossibile caricare le impostazioni di ripresa';

  @override
  String get adminResumeDescription =>
      'Configura quando i contenuti devono essere contrassegnati come parzialmente riprodotti o completamente riprodotti.';

  @override
  String get adminMinResumePercentage => 'Percentuale minima di ripresa';

  @override
  String get adminMinResumeSubtitle =>
      'I contenuti devono essere riprodotti oltre questa percentuale per salvare i progressi';

  @override
  String get adminMaxResumePercentage => 'Percentuale massima di ripresa';

  @override
  String get adminMaxResumeSubtitle =>
      'I contenuti sono considerati completamente riprodotti dopo questa percentuale';

  @override
  String get adminMinResumeDuration => 'Durata minima di ripresa (secondi)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Gli elementi più brevi di questo non sono riprendibili';

  @override
  String get adminMinAudiobookResume => 'Percentuale minima ripresa audiolibri';

  @override
  String get adminMaxAudiobookResume =>
      'Percentuale massima ripresa audiolibri';

  @override
  String get adminNetworkingLoadFailed =>
      'Impossibile caricare le impostazioni di rete';

  @override
  String get adminNetworkingWarning =>
      'Le modifiche alle impostazioni di rete potrebbero richiedere un riavvio del server.';

  @override
  String get adminEnableRemoteAccess => 'Abilita accesso remoto';

  @override
  String get ports => 'Porte';

  @override
  String get adminHttpPort => 'Porta HTTP';

  @override
  String get adminHttpsPort => 'Porta HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porta HTTPS pubblica';

  @override
  String get adminBaseUrl => 'URL Base';

  @override
  String get adminBaseUrlHint => 'es. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Abilita HTTPS';

  @override
  String get adminLocalNetwork => 'Rete Locale';

  @override
  String get adminLocalNetworkAddresses => 'Indirizzi rete locale';

  @override
  String get adminKnownProxies => 'Proxy conosciuti';

  @override
  String get adminRemoteIpFilter => 'Filtro IP Remoto';

  @override
  String get adminRemoteIpFilterEntries => 'Filtro IP remoto';

  @override
  String get adminCertificatePath => 'Percorso certificato';

  @override
  String get whitelist => 'Lista bianca';

  @override
  String get blacklist => 'Lista nera';

  @override
  String get notSet => 'Non impostato';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Impossibile caricare i metadati: $error';
  }

  @override
  String get adminRefreshMetadata => 'Aggiorna Metadati';

  @override
  String get recursive => 'Ricorsivo';

  @override
  String get adminReplaceAllMetadata => 'Sostituisci tutti i metadati';

  @override
  String get adminMetadataRefreshRequested =>
      'Aggiornamento metadati richiesto';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Impossibile aggiornare i metadati: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Nessuna corrispondenza remota trovata';

  @override
  String get adminRemoteResults => 'Risultati Remoti';

  @override
  String get adminRemoteMetadataApplied => 'Metadati remoti applicati';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Ricerca remota non riuscita: $error';
  }

  @override
  String get adminUpdateContentType => 'Aggiorna Tipo Contenuto';

  @override
  String get adminContentType => 'Tipo contenuto';

  @override
  String get adminContentTypeUpdated => 'Tipo contenuto aggiornato';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Impossibile aggiornare il tipo di contenuto: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Impossibile caricare l\'editor metadati';

  @override
  String get adminNoPeopleEntries => 'Nessuna voce persone';

  @override
  String get adminNoExternalIds => 'Nessun ID esterno disponibile';

  @override
  String adminImageUpdated(String imageType) {
    return 'Immagine $imageType aggiornata';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Impossibile scaricare l\'immagine: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Formato immagine non supportato';

  @override
  String get adminImageReadFailed =>
      'Impossibile leggere l\'immagine selezionata';

  @override
  String adminImageUploaded(String imageType) {
    return 'Immagine $imageType caricata';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Impossibile caricare l\'immagine: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Elimina immagine $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Immagine $imageType eliminata';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Impossibile eliminare l\'immagine: $error';
  }

  @override
  String get adminAllProviders => 'Tutti i provider';

  @override
  String get adminNoRemoteImages => 'Nessuna immagine remota trovata';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Rilevamento tuner non riuscito: $error';
  }

  @override
  String get adminTunerTypeM3u => 'Tuner M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'File o URL';

  @override
  String get adminTunerIpAddress => 'Indirizzo IP del tuner';

  @override
  String get adminTunerFriendlyName => 'Nome descrittivo';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limite di connessioni simultanee';

  @override
  String get adminTunerCountHelp =>
      'Il numero massimo di stream consentiti contemporaneamente dal tuner. Imposta 0 per illimitati.';

  @override
  String get adminTunerFallbackBitrate =>
      'Bitrate massimo di streaming di riserva';

  @override
  String get adminTunerImportFavoritesOnly => 'Importa solo i canali preferiti';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Consenti la transcodifica hardware';

  @override
  String get adminTunerAllowFmp4 =>
      'Consenti il contenitore di transcodifica fMP4';

  @override
  String get adminTunerAllowStreamSharing =>
      'Consenti la condivisione dello stream';

  @override
  String get adminTunerEnableStreamLooping => 'Abilita il looping dello stream';

  @override
  String get adminTunerIgnoreDts => 'Ignora DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Leggi l\'input al frame rate nativo';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'File o URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefisso film';

  @override
  String get adminXmltvMovieCategories => 'Categorie film';

  @override
  String get adminXmltvCategoriesHelp =>
      'Separa più categorie con una barra verticale.';

  @override
  String get adminXmltvKidsCategories => 'Categorie per bambini';

  @override
  String get adminXmltvNewsCategories => 'Categorie notizie';

  @override
  String get adminXmltvSportsCategories => 'Categorie sport';

  @override
  String get adminSdUsername => 'Nome utente';

  @override
  String get adminSdPassword => 'Password';

  @override
  String get adminSdCountry => 'Paese';

  @override
  String get adminSdCountrySelect => 'Seleziona un paese';

  @override
  String get adminSdPostalCode => 'Codice postale';

  @override
  String get adminEnableAllTuners => 'Abilita tutti i tuner';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Impossibile rimuovere il tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Impossibile rimuovere il provider: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Percorso registrazione serie';

  @override
  String get adminMovieRecordingPath => 'Percorso registrazione film';

  @override
  String get adminGuideDaysAuto => 'Automatico';

  @override
  String get adminRecordingPostProcessor =>
      'Percorso applicazione di post-elaborazione';

  @override
  String get adminRecordingPostProcessorArgs => 'Argomenti del post-processore';

  @override
  String get adminSaveRecordingNfo =>
      'Salva i metadati NFO delle registrazioni';

  @override
  String get adminSaveRecordingImages =>
      'Salva le immagini delle registrazioni';

  @override
  String get adminLiveTvSectionPaths => 'Percorsi di registrazione';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-elaborazione';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Impossibile salvare le impostazioni: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Impossibile caricare l\'amministrazione TV Live';

  @override
  String get adminTunerDevices => 'Dispositivi Tuner';

  @override
  String get adminNoTunerHosts => 'Nessun host tuner configurato';

  @override
  String get adminGuideProviders => 'Provider Guida';

  @override
  String get adminGuideRefreshStarted =>
      'Aggiornamento dei dati della guida avviato';

  @override
  String get adminGuideRefreshUnavailable =>
      'L\'attività di aggiornamento della guida non è disponibile su questo server.';

  @override
  String get adminNoListingProviders =>
      'Nessun provider di elenchi configurato';

  @override
  String get adminSettingsSaved => 'Impostazioni salvate';

  @override
  String get adminBackupsNotAvailable =>
      'I backup non sono disponibili in questa build del server.';

  @override
  String get adminRestoreWarning1 =>
      'Il ripristino sostituirà TUTTI i dati attuali del server con i dati del backup.';

  @override
  String get adminRestoreWarning2 =>
      'Le impostazioni del server, gli utenti e i dati delle librerie attuali verranno sovrascritti.';

  @override
  String get adminRestoreWarning3 =>
      'Il server si riavvierà dopo il ripristino.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Ripristinare ora il backup $name?';
  }

  @override
  String get adminBackupsTitle => 'Backup';

  @override
  String get adminUnknownDate => 'Data sconosciuta';

  @override
  String get adminUnnamedBackup => 'Backup Senza Nome';

  @override
  String get adminApply => 'Applica';

  @override
  String get adminLogsTitle => 'Log del Server';

  @override
  String get adminLogsNewestFirst => 'Più Recenti';

  @override
  String get adminLogsOldestFirst => 'Più Vecchi';

  @override
  String get adminLogsJustNow => 'Proprio ora';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '$minutes min fa';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '$hours h fa';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '$days g fa';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Impossibile caricare $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count corrispondenze';
  }

  @override
  String get adminLogViewerNoMatches => 'Nessuna riga corrispondente';

  @override
  String get adminMetadataEditorTitle => 'Editor Metadati';

  @override
  String get adminMetadataIdentify => 'Identifica';

  @override
  String get adminMetadataType => 'Tipo';

  @override
  String get adminMetadataDetails => 'Dettagli';

  @override
  String get adminMetadataExternalIds => 'ID Esterni';

  @override
  String get adminMetadataImages => 'Immagini';

  @override
  String get adminMetadataFieldTitle => 'Titolo';

  @override
  String get adminMetadataFieldSortTitle => 'Titolo ordinamento';

  @override
  String get adminMetadataFieldOriginalTitle => 'Titolo originale';

  @override
  String get adminMetadataFieldPremiereDate =>
      'Data prima visione (AAAA-MM-GG)';

  @override
  String get adminMetadataFieldEndDate => 'Data fine (AAAA-MM-GG)';

  @override
  String get adminMetadataFieldProductionYear => 'Anno di produzione';

  @override
  String get adminMetadataFieldOfficialRating => 'Classificazione ufficiale';

  @override
  String get adminMetadataFieldCommunityRating => 'Valutazione comunità';

  @override
  String get adminMetadataFieldCriticRating => 'Valutazione critica';

  @override
  String get adminMetadataFieldCustomRating => 'Classificazione personalizzata';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Panoramica';

  @override
  String get adminMetadataFieldDisplayOrder => 'Ordine di visualizzazione';

  @override
  String get adminMetadataDisplayOrderAired => 'Trasmesso';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Data di trasmissione originale';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Assoluto';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digitale';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Arco narrativo';

  @override
  String get adminMetadataDisplayOrderProduction => 'Produzione';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternativo';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regionale';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'DVD alternativo';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Data modifica';

  @override
  String get adminMetadataDisplayOrderSortName => 'Nome ordinamento';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Data di uscita';

  @override
  String get adminMetadataSettings => 'Impostazioni Metadati';

  @override
  String get adminMetadataDownloadLanguage => 'Lingua di download preferita';

  @override
  String get adminMetadataCountryRegion => 'Paese/Regione';

  @override
  String get adminMetadataInheritHelp =>
      'Lascia su Predefinito per ereditare l\'impostazione da un elemento superiore, o dal valore predefinito del server.';

  @override
  String get adminMetadataField3DFormat => 'Formato 3D';

  @override
  String get adminMetadataPersonKindActor => 'Attore';

  @override
  String get adminMetadataPersonKindDirector => 'Regista';

  @override
  String get adminMetadataPersonKindComposer => 'Compositore';

  @override
  String get adminMetadataPersonKindWriter => 'Sceneggiatore';

  @override
  String get adminMetadataPersonKindGuestStar => 'Guest star';

  @override
  String get adminMetadataPersonKindProducer => 'Produttore';

  @override
  String get adminMetadataPersonKindConductor => 'Direttore d\'orchestra';

  @override
  String get adminMetadataPersonKindLyricist => 'Paroliere';

  @override
  String get adminMetadataPersonKindArranger => 'Arrangiatore';

  @override
  String get adminMetadataPersonKindEngineer => 'Fonico';

  @override
  String get adminMetadataPersonKindMixer => 'Mixer';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixer';

  @override
  String get adminMetadataPersonKindCreator => 'Creatore';

  @override
  String get adminMetadataPersonKindArtist => 'Artista';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Artista dell\'album';

  @override
  String get adminMetadataPersonKindAuthor => 'Autore';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustratore';

  @override
  String get adminMetadataPersonKindPenciller => 'Disegnatore';

  @override
  String get adminMetadataPersonKindInker => 'Inchiostratore';

  @override
  String get adminMetadataPersonKindColorist => 'Colorista';

  @override
  String get adminMetadataPersonKindLetterer => 'Letterista';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Autore copertina';

  @override
  String get adminMetadataPersonKindEditor => 'Redattore';

  @override
  String get adminMetadataPersonKindTranslator => 'Traduttore';

  @override
  String get adminMetadataPersonKindNarrator => 'Narratore';

  @override
  String get adminMetadataAirDays => 'Giorni di trasmissione';

  @override
  String get adminMetadataLockItem =>
      'Blocca questo elemento per impedire future modifiche ai metadati';

  @override
  String get adminMetadataEnabledFields => 'Campi Abilitati';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Deseleziona un campo per bloccarlo e impedire la modifica dei suoi dati.';

  @override
  String get adminMetadataLockFieldName => 'Nome';

  @override
  String get adminMetadataLockFieldOverview => 'Panoramica';

  @override
  String get adminMetadataLockFieldGenres => 'Generi';

  @override
  String get adminMetadataLockFieldOfficialRating =>
      'Classificazione ufficiale';

  @override
  String get adminMetadataLockFieldCast => 'Persone';

  @override
  String get adminMetadataLockFieldProductionLocations =>
      'Luoghi di produzione';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Luogo di nascita';

  @override
  String get adminMetadataLockFieldRuntime => 'Durata';

  @override
  String get adminMetadataLockFieldStudios => 'Studi';

  @override
  String get adminMetadataLockFieldTags => 'Tag';

  @override
  String get adminMetadataGenres => 'Generi';

  @override
  String get adminMetadataTags => 'Tag';

  @override
  String get adminMetadataStudios => 'Studi';

  @override
  String get adminMetadataPeople => 'Persone';

  @override
  String get adminMetadataAddGenre => 'Aggiungi genere';

  @override
  String get adminMetadataAddTag => 'Aggiungi tag';

  @override
  String get adminMetadataAddStudio => 'Aggiungi studio';

  @override
  String get adminMetadataAddPerson => 'Aggiungi Persona';

  @override
  String get adminMetadataEditPerson => 'Modifica Persona';

  @override
  String get adminMetadataRole => 'Ruolo';

  @override
  String get adminMetadataImagePrimary => 'Principale';

  @override
  String get adminMetadataImageBackdrop => 'Sfondo';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Stendardo';

  @override
  String get adminMetadataImageThumb => 'Miniatura';

  @override
  String get adminMetadataProvider => 'Fornitore';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Immagine $imageType aggiornata';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Immagine $imageType caricata';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Immagine $imageType eliminata';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Impossibile scaricare l\'immagine: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Impossibile leggere l\'immagine selezionata';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Impossibile caricare l\'immagine: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Elimina immagine $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Questo rimuoverà l\'immagine corrente dall\'elemento.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Impossibile eliminare l\'immagine: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Scegli immagine $imageType';
  }

  @override
  String get adminMetadataUpload => 'Carica';

  @override
  String get adminMetadataUpdate => 'Aggiorna';

  @override
  String get adminMetadataRemoteImage => 'Immagine remota';

  @override
  String get adminPluginsInstalled => 'Installati';

  @override
  String get adminPluginsCatalog => 'Catalogo';

  @override
  String get adminPluginsActive => 'Attivi';

  @override
  String get adminPluginsRestart => 'Riavvio';

  @override
  String get adminPluginsRestartRequired => 'Riavvio richiesto';

  @override
  String get adminPluginsNoSearchResults =>
      'Nessun plugin corrisponde alla ricerca';

  @override
  String get adminPluginsNoneInstalled => 'Nessun plugin installato';

  @override
  String get adminPluginsNoneActive => 'Nessun plugin attivo';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Nessun plugin richiede un riavvio del server';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Aggiornamento disponibile: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Aggiornamento disponibile';

  @override
  String get adminPluginsPendingRemoval =>
      'Rimozione in attesa dopo il riavvio';

  @override
  String get adminPluginsChangesPending => 'Modifiche in attesa di riavvio';

  @override
  String get adminPluginsEnable => 'Abilita';

  @override
  String get adminPluginsDisable => 'Disabilita';

  @override
  String get adminPluginsInstallUpdate => 'Installa aggiornamento';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Installa aggiornamento (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nessun pacchetto corrisponde alla ricerca';

  @override
  String get adminPluginsCatalogEmpty => 'Nessun pacchetto disponibile';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" è in fase di installazione…';
  }

  @override
  String get adminPluginDetailExperimental => 'Integrazione Sperimentale';

  @override
  String get adminPluginDetailExperimentalContent =>
      'L\'integrazione delle impostazioni dei plugin è ancora sperimentale. Alcuni campi o layout potrebbero non essere visualizzati correttamente.';

  @override
  String get adminPluginDetailToggle404 =>
      'Impossibile attivare/disattivare il plugin. Il server non ha trovato questa versione del plugin. Prova ad aggiornare i plugin, poi riprova.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Impossibile attivare/disattivare il plugin. Controlla i log del server per i dettagli.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Impostazioni $name';
  }

  @override
  String get adminPluginDetailDetails => 'Dettagli';

  @override
  String get adminPluginDetailDeveloper => 'Sviluppatore';

  @override
  String get adminPluginDetailRepository => 'Repository';

  @override
  String get adminPluginDetailBundled => 'Incluso';

  @override
  String get adminPluginDetailEnablePlugin => 'Abilita Plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'È necessario un riavvio del server per rendere effettive le modifiche.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Questo plugin verrà rimosso dopo il riavvio del server.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Questo plugin ha avuto un malfunzionamento e potrebbe non funzionare correttamente.';

  @override
  String get adminPluginDetailNotSupported =>
      'Questo plugin non è supportato dalla versione corrente del server.';

  @override
  String get adminPluginDetailSuperseded =>
      'Questo plugin è stato sostituito da una versione più recente.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Impossibile caricare i repository: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Rimuovi Repository';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Sei sicuro di voler rimuovere \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Rimuovi';

  @override
  String adminReposSaveFailed(String error) {
    return 'Impossibile salvare i repository: $error';
  }

  @override
  String get adminReposEmpty => 'Nessun repository configurato';

  @override
  String get adminReposEmptySubtitle =>
      'Aggiungi un repository per sfogliare i plugin disponibili';

  @override
  String get adminReposUnnamed => '(senza nome)';

  @override
  String get adminReposEditTitle => 'Modifica Repository';

  @override
  String get adminReposAddTitle => 'Aggiungi Repository';

  @override
  String get adminReposUrl => 'URL Repository';

  @override
  String get adminReposNameHint => 'es. Jellyfin Stabile';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL non valido';

  @override
  String get adminGeneralSettingsTitle => 'Impostazioni Generali';

  @override
  String get adminGeneralMetadataLanguage => 'Lingua metadati preferita';

  @override
  String get adminGeneralMetadataLanguageHint => 'es. it, en, de';

  @override
  String get adminGeneralMetadataCountry => 'Paese metadati preferito';

  @override
  String get adminGeneralMetadataCountryHint => 'es. IT, US, DE';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Concorrenza scansione libreria';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limite codifica immagini parallela';

  @override
  String get adminUnknownError => 'Errore sconosciuto';

  @override
  String get adminBrowse => 'Sfoglia';

  @override
  String get adminCloseBrowser => 'Chiudi browser';

  @override
  String get adminNetworkingTitle => 'Rete';

  @override
  String get adminNetworkingRestartWarning =>
      'Le modifiche alle impostazioni di rete potrebbero richiedere un riavvio del server.';

  @override
  String get adminNetworkingEnableHttps => 'Abilita HTTPS';

  @override
  String get adminNetworkingAddressHint => 'es. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxy conosciuti';

  @override
  String get adminNetworkingProxyHint => 'es. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista bianca';

  @override
  String get adminNetworkingBlacklist => 'Lista nera';

  @override
  String get adminNetworkingAddEntry => 'Aggiungi voce';

  @override
  String get adminBrandingTitle => 'Marchio';

  @override
  String get adminBrandingLoginDisclaimer => 'Disclaimer accesso';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML visualizzato sotto il modulo di accesso';

  @override
  String get adminBrandingCustomCss => 'CSS Personalizzato';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizzato applicato all\'interfaccia web';

  @override
  String get adminBrandingEnableSplash => 'Abilita schermata di avvio';

  @override
  String get adminBrandingSplashUpload => 'Carica immagine';

  @override
  String get adminBrandingSplashUploaded => 'Splashscreen aggiornata';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Impossibile caricare la splashscreen';

  @override
  String get adminBrandingSplashDeleted => 'Splashscreen rimossa';

  @override
  String get adminBrandingNoSplash => 'Nessuna splashscreen personalizzata';

  @override
  String get adminPlaybackHwAccel => 'Accelerazione Hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Accelerazione hardware';

  @override
  String get adminPlaybackEnableHwEncoding => 'Abilita codifica hardware';

  @override
  String get adminPlaybackQsvDevice => 'Dispositivo QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Abilita il decoder NVDEC avanzato';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferisci il decoder hardware nativo di sistema';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Decodifica HEVC a 10 bit';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Decodifica VP9 a 10 bit';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Decodifica HEVC RExt a 8/10 bit';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Decodifica HEVC RExt a 12 bit';

  @override
  String get adminPlaybackHwEncodingSection => 'Codifica hardware';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Consenti la codifica HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Consenti la codifica AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Abilita il codificatore Intel H.264 a basso consumo';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Abilita il codificatore Intel HEVC a basso consumo';

  @override
  String get adminPlaybackToneMapping => 'Tone Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Abilita il tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Abilita il tone mapping VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Abilita il tone mapping VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algoritmo di tone mapping';

  @override
  String get adminPlaybackTonemappingMode => 'Modalità di tone mapping';

  @override
  String get adminPlaybackTonemappingRange => 'Intervallo di tone mapping';

  @override
  String get adminPlaybackTonemappingDesat => 'Desaturazione del tone mapping';

  @override
  String get adminPlaybackTonemappingPeak => 'Picco del tone mapping';

  @override
  String get adminPlaybackTonemappingParam => 'Parametro del tone mapping';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Luminosità del tone mapping VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Contrasto del tone mapping VPP';

  @override
  String get adminPlaybackEncoderPreset => 'Preset del codificatore';

  @override
  String get adminPlaybackH264Crf => 'CRF di codifica H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF di codifica H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Metodo di deinterlacciamento';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Raddoppia il frame rate durante il deinterlacciamento';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Abilita la codifica audio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Guadagno del downmix audio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritmo di downmix stereo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Dimensione massima della coda di muxing';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Codifica';

  @override
  String get adminPlaybackEncodingThreads => 'Thread di codifica';

  @override
  String get adminPlaybackFallbackFont => 'Abilita font di riserva';

  @override
  String get adminPlaybackFallbackFontPath => 'Percorso font di riserva';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Video';

  @override
  String get adminResumeAudiobooks => 'Audiolibri';

  @override
  String get adminStreamingBitrateLimit =>
      'Limite bitrate client remoto (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Lascia vuoto o 0 per illimitato';

  @override
  String get adminTrickplayHwAccel => 'Abilita accelerazione hardware';

  @override
  String get adminTrickplayHwEncoding => 'Abilita codifica hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Abilita estrazione solo fotogrammi chiave';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle => 'Più veloce ma meno preciso';

  @override
  String get adminTrickplayNonBlocking => 'Non bloccante';

  @override
  String get adminTrickplayBlocking => 'Bloccante';

  @override
  String get adminTrickplayPriorityHigh => 'Alta';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Sopra il Normale';

  @override
  String get adminTrickplayPriorityNormal => 'Normale';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Sotto il Normale';

  @override
  String get adminTrickplayPriorityIdle => 'Inattivo';

  @override
  String get adminTrickplayImageSettings => 'Impostazioni Immagine';

  @override
  String get adminTrickplayInterval => 'Intervallo (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Frequenza di cattura dei fotogrammi';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Larghezze in pixel separate da virgola (es. 320)';

  @override
  String get adminTrickplayQuality => 'Qualità';

  @override
  String get adminTrickplayQScale => 'Scala qualità';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valori più bassi = qualità migliore, file più grandi';

  @override
  String get adminTrickplayJpegQuality => 'Qualità JPEG';

  @override
  String get adminTrickplayProcessing => 'Elaborazione';

  @override
  String get adminTasksEmpty => 'Nessuna attività pianificata trovata';

  @override
  String get adminTasksNoFilterMatch =>
      'Nessuna attività corrisponde al filtro attuale';

  @override
  String get adminTaskCancelling => 'Annullamento…';

  @override
  String get adminTaskRunning => 'In esecuzione…';

  @override
  String get adminTaskNeverRun => 'Mai eseguita';

  @override
  String get adminTaskStop => 'Interrompi';

  @override
  String get adminRunningTasks => 'Attività in Esecuzione';

  @override
  String get adminTaskRun => 'Esegui';

  @override
  String get adminTaskDetailLastExecution => 'Ultima Esecuzione';

  @override
  String get adminTaskDetailStarted => 'Iniziata';

  @override
  String get adminTaskDetailEnded => 'Terminata';

  @override
  String get adminTaskDetailDuration => 'Durata';

  @override
  String get adminTaskDetailErrorLabel => 'Errore:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Ogni giorno alle $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Ogni $day alle $time';
  }

  @override
  String get adminTaskTriggerStartup => 'All\'avvio dell\'applicazione';

  @override
  String get adminTaskTriggerTypeDaily => 'Giornaliero';

  @override
  String get adminTaskTriggerTypeWeekly => 'Settimanale';

  @override
  String get adminTaskTriggerTypeInterval => 'A intervalli';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervallo';

  @override
  String get adminTaskTriggerEveryHour => 'Ogni ora';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ore',
      one: '1 ora',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Orario';

  @override
  String get adminActivityJustNow => 'Proprio ora';

  @override
  String get adminActivityLastHour => 'Ultima ora';

  @override
  String get adminActivityToday => 'Oggi';

  @override
  String get adminActivityYesterday => 'Ieri';

  @override
  String get adminActivityOlder => 'Più vecchie';

  @override
  String adminActivityDaysAgo(int days) {
    return '$days g fa';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '$hours h fa';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '$minutes min fa';
  }

  @override
  String get adminActivityNow => 'ora';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String adminActivityHoursShort(int hours) {
    return '$hours h';
  }

  @override
  String adminActivityDaysShort(int days) {
    return '$days g';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Configura la generazione di immagini trickplay per le miniature di anteprima durante lo scorrimento.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta HTTPS pubblica';

  @override
  String get adminNetworkingBaseUrl => 'URL Base';

  @override
  String get adminNetworkingBaseUrlHint => 'es. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Porta HTTP pubblica';

  @override
  String get adminNetworkingRequireHttps => 'Richiedi HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Reindirizza tutte le richieste remote a HTTPS. Non ha effetto se il server non ha un certificato valido.';

  @override
  String get adminNetworkingCertPassword => 'Password del certificato';

  @override
  String get adminNetworkingEnableIpv4 => 'Abilita IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Abilita IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Reti LAN';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtro IP remoto';

  @override
  String get adminPlaybackVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automatico';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Percorso temporaneo transcodifica';

  @override
  String get adminPlaybackSegmentDeletion => 'Consenti eliminazione segmenti';

  @override
  String get adminPlaybackSegmentKeep => 'Mantenimento segmenti (secondi)';

  @override
  String get adminPlaybackThrottleBuffering => 'Limitazione buffering';

  @override
  String get adminPlaybackThrottleDelay => 'Ritardo di throttling (secondi)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Consenti l\'estrazione dei sottotitoli al volo';

  @override
  String get adminResumeMinPct => 'Percentuale minima di ripresa';

  @override
  String get adminResumeMinPctSubtitle =>
      'I contenuti devono essere riprodotti oltre questa percentuale per salvare i progressi';

  @override
  String get adminResumeMaxPct => 'Percentuale massima di ripresa';

  @override
  String get adminResumeMaxPctSubtitle =>
      'I contenuti sono considerati completamente riprodotti dopo questa percentuale';

  @override
  String get adminResumeMinDuration => 'Durata minima di ripresa (secondi)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Gli elementi più brevi di questo non sono riprendibili';

  @override
  String get adminTrickplayScanBehavior => 'Comportamento scansione';

  @override
  String get adminTrickplayProcessPriority => 'Priorità processo';

  @override
  String get adminTrickplayTileWidth => 'Larghezza tile';

  @override
  String get adminTrickplayTileHeight => 'Altezza tile';

  @override
  String get adminTrickplayProcessThreads => 'Thread di processo';

  @override
  String get adminTrickplayWidthResolutions => 'Risoluzioni larghezza';

  @override
  String get adminMetadataDefault => 'Predefinito';

  @override
  String get adminMetadataContentTypeUpdated => 'Tipo contenuto aggiornato';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Impossibile aggiornare il tipo di contenuto: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Soglia risposta lenta (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Abilita gli avvisi di risposta lenta';

  @override
  String get adminGeneralQuickConnect => 'Abilita Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadati';

  @override
  String get adminGeneralSectionPaths => 'Percorsi';

  @override
  String get adminGeneralSectionPerformance => 'Prestazioni';

  @override
  String get adminGeneralCachePath => 'Percorso cache';

  @override
  String get adminGeneralMetadataPath => 'Percorso metadati';

  @override
  String get adminGeneralServerName => 'Nome server';

  @override
  String get adminGeneralDisplayLanguage =>
      'Lingua di visualizzazione preferita';

  @override
  String get adminSettingsLoadFailed => 'Impossibile caricare le impostazioni';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Impossibile aggiornare le mappature: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limite di tempo: $duration';
  }

  @override
  String get folders => 'Cartelle';

  @override
  String get libraries => 'Librerie';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay disabilitato';

  @override
  String get syncPlayDisabledMessage =>
      'Abilita SyncPlay in Impostazioni per utilizzare la riproduzione sincronizzata.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Server non supportato';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay richiede un server Jellyfin. Il server attuale non lo supporta.';

  @override
  String get syncPlayGroupFallbackName => 'Gruppo SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Gruppo SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count partecipanti',
      one: '$count partecipante',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignora l\'attesa';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Non trattenere il gruppo mentre questo dispositivo effettua il buffering';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continua localmente senza aspettare i membri lenti';

  @override
  String get syncPlayRepeat => 'Ripeti';

  @override
  String get syncPlayRepeatSubtitle => 'Ripeti un elemento o l\'intera coda';

  @override
  String get syncPlayRepeatOne => 'Uno';

  @override
  String get syncPlayShuffleSubtitle =>
      'Riproduci la coda in ordine o in modo casuale';

  @override
  String get syncPlayShuffleModeShuffled => 'Casuale';

  @override
  String get syncPlayShuffleModeSorted => 'Ordinato';

  @override
  String get syncPlayParticipantYou => 'Tu';

  @override
  String syncPlayGroupSubtitle(String participants, String detail) {
    return '$participants · $detail';
  }

  @override
  String get syncPlayNothingQueued => 'ancora nulla in coda';

  @override
  String get syncPlayOthersCanJoinHint =>
      'Gli altri possono unirsi dalla loro schermata SyncPlay finché questo gruppo esiste.';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronizza la coda di riproduzione corrente';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Sostituisci la coda del gruppo con ciò che viene riprodotto localmente';

  @override
  String get syncPlayLeaveGroup => 'Lascia il gruppo';

  @override
  String get syncPlayGroupQueue => 'Coda di gruppo';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Elemento $index';
  }

  @override
  String get syncPlayPlayNow => 'Riproduci ora';

  @override
  String get syncPlayCreateNewGroup => 'Crea un nuovo gruppo';

  @override
  String get syncPlayCreateGroupSubtitle =>
      'Guarda insieme a tutti quelli che si uniscono';

  @override
  String get syncPlayGroupName => 'Nome del gruppo';

  @override
  String get syncPlayDefaultGroupName => 'Il mio gruppo SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Crea gruppo';

  @override
  String get syncPlayAvailableGroups => 'Gruppi disponibili';

  @override
  String syncPlayAvailableGroupsCount(int count) {
    return 'Gruppi disponibili · $count';
  }

  @override
  String get syncPlayNoGroupsAvailable => 'Nessun gruppo disponibile';

  @override
  String get syncPlayNoGroupsAvailableHint =>
      'I gruppi creati da altre persone su questo server compariranno qui.';

  @override
  String get syncPlayJoinGroupQuestion => 'Partecipare al gruppo SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'L\'adesione a un gruppo SyncPlay potrebbe sostituire la coda di riproduzione corrente. Continuare?';

  @override
  String get syncPlayJoinReplacesQueueNote =>
      'Unirsi a un gruppo potrebbe sostituire la tua coda di riproduzione attuale.';

  @override
  String get syncPlayJoin => 'Unisciti';

  @override
  String get syncPlayStateIdle => 'Inattivo';

  @override
  String get syncPlayStateWaiting => 'In attesa';

  @override
  String get syncPlayStatePaused => 'In pausa';

  @override
  String get syncPlayStatePlaying => 'In riproduzione';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName si è unito al gruppo SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName ha lasciato il gruppo SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay accesso negato';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Non hai accesso a uno o più elementi in questo gruppo SyncPlay. Chiedi al proprietario del gruppo di verificare le autorizzazioni della libreria o di scegliere una coda diversa.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sincronizzazione della riproduzione con $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'La ricerca vocale non è disponibile.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Riproduzione diretta non riuscita';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Impossibile avviare la riproduzione diretta per questo flusso Dolby Vision. Riprovare a utilizzare la transcodifica del server?';

  @override
  String get retryWithTranscode => 'Riprovare con la transcodifica';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Non supportato';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Questo dispositivo non può decodificare direttamente il contenuto Dolby Vision. Utilizza HDR10 fallback o richiedi la transcodifica del server.';

  @override
  String get rememberMyChoice => 'Ricorda la mia scelta';

  @override
  String get playHdr10Fallback => 'Riproduci HDR10 riserva';

  @override
  String get requestTranscode => 'Richiedi la transcodifica';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# righe rilevate',
      one: '# riga rilevata',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Vedi Tutto';

  @override
  String get noItems => 'Nessun elemento';

  @override
  String get switchUser => 'Cambia Utente';

  @override
  String get remoteControl => 'Controllo Remoto';

  @override
  String get mediaBarLoading => 'Caricamento barra media…';

  @override
  String get mediaBarError => 'Impossibile caricare la barra media';

  @override
  String get offlineServerUnavailable =>
      'Connesso a Internet, ma il server attuale non è disponibile.';

  @override
  String get offlineNoInternet =>
      'Sei offline. Solo i contenuti scaricati sono disponibili.';

  @override
  String get offlineFileNotAvailable => 'File non disponibile';

  @override
  String get offlineSwitchServer => 'Cambia Server';

  @override
  String get offlineSavedMedia => 'Download';

  @override
  String get offlineBannerTitle => 'Sei offline';

  @override
  String get offlineBannerSubtitle => 'Vengono mostrati i tuoi download';

  @override
  String get serverUnreachableBannerTitle =>
      'Impossibile raggiungere il tuo server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Riproduzione dai download finché non torna disponibile';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Riproduzione Remota';

  @override
  String castControlFailed(String error) {
    return 'Controllo Cast non riuscito: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Controlli di $kind';
  }

  @override
  String get castDeviceVolume => 'Volume Dispositivo';

  @override
  String get castVolumeUnavailable => 'Non disponibile';

  @override
  String castStopKind(String kind) {
    return 'Interrompi $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Sottotitoli';

  @override
  String get pinConfirmTitle => 'Conferma PIN';

  @override
  String get pinSetTitle => 'Imposta PIN';

  @override
  String get pinEnterTitle => 'Inserisci PIN';

  @override
  String get pinReenterToConfirm => 'Reinserisci il PIN per confermare';

  @override
  String pinEnterNDigit(int length) {
    return 'Inserisci un PIN di $length cifre';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Inserisci il tuo PIN di $length cifre';
  }

  @override
  String get kidsMode => 'Modalità Bambini';

  @override
  String get kidsModeSubtitle =>
      'Semplifica l\'app e blocca l\'uscita con un PIN';

  @override
  String get kidsModeExit => 'Esci dalla Modalità Bambini';

  @override
  String get kidsModeExitSubtitle =>
      'Inserisci il PIN per ripristinare l\'app completa';

  @override
  String kidsModePinToSwitchUser(String name) {
    return 'Enter the Kids Mode PIN to switch to $name';
  }

  @override
  String get pinIncorrect => 'PIN errato';

  @override
  String pinTryAgainIn(String wait) {
    return 'Troppi tentativi. Riprova tra $wait.';
  }

  @override
  String get pinMismatch => 'I PIN non corrispondono';

  @override
  String get pinForgot => 'PIN dimenticato?';

  @override
  String get pinClear => 'Cancella';

  @override
  String get pinBackspace => 'Cancella carattere';

  @override
  String get quickConnectAuthorized => 'Richiesta Quick Connect autorizzata.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Il codice Quick Connect non è valido o è scaduto.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect non è supportato su questo server.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Impossibile autorizzare il codice Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect è disabilitato su questo server.';

  @override
  String get quickConnectForbidden =>
      'Il tuo account non può autorizzare questa richiesta Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Codice Quick Connect non trovato. Prova un nuovo codice.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect non riuscito: $message';
  }

  @override
  String get quickConnectEnterCode => 'Inserisci codice';

  @override
  String get quickConnectAuthorize => 'Autorizza';

  @override
  String remoteCommandFailed(String error) {
    return 'Comando non riuscito: $error';
  }

  @override
  String get remoteControlTitle => 'Controllo Remoto';

  @override
  String get remoteFailedToLoadSessions => 'Impossibile caricare le sessioni';

  @override
  String get remoteNoSessions => 'Nessuna sessione controllabile';

  @override
  String get remoteStartPlayback =>
      'Avvia la riproduzione su un altro dispositivo';

  @override
  String get unknownUser => 'Sconosciuto';

  @override
  String get unknownItem => 'Sconosciuto';

  @override
  String get remoteNothingPlaying => 'Nulla in riproduzione su questa sessione';

  @override
  String get castingStarted =>
      'Trasmissione avviata sul dispositivo selezionato';

  @override
  String castingFailed(String error) {
    return 'Impossibile avviare la trasmissione: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nessun dispositivo di riproduzione remota disponibile.';

  @override
  String get noRemoteDevicesIos =>
      'Nessun dispositivo di riproduzione remota disponibile.\n\nSu iOS, i dispositivi AirPlay potrebbero non essere disponibili nel simulatore.';

  @override
  String get trackActionPlayNext => 'Riproduci Dopo';

  @override
  String get trackActionViewDetails => 'Visualizza Dettagli';

  @override
  String get trackActionAddToQueue => 'Aggiungi alla Coda';

  @override
  String get trackActionAddToPlaylist => 'Aggiungi alla Playlist';

  @override
  String get trackActionCancelDownload => 'Annulla Download';

  @override
  String get trackActionDeleteFromPlaylist => 'Elimina dalla Playlist';

  @override
  String get trackActionMoveUp => 'Sposta Su';

  @override
  String get trackActionMoveDown => 'Sposta Giù';

  @override
  String get trackActionRemoveFromFavorites => 'Rimuovi dai Preferiti';

  @override
  String get trackActionAddToFavorites => 'Aggiungi ai Preferiti';

  @override
  String get trackActionGoToAlbum => 'Vai all\'Album';

  @override
  String get trackActionGoToArtist => 'Vai all\'Artista';

  @override
  String trackActionDownloading(String name) {
    return 'Download di $name in corso…';
  }

  @override
  String get trackActionDeletedFile => 'File scaricato eliminato';

  @override
  String get trackActionDeleteFileFailed =>
      'Impossibile eliminare il file scaricato';

  @override
  String get shuffleBy => 'Casuale per';

  @override
  String get shuffleSelectLibrary => 'Seleziona Libreria';

  @override
  String get shuffleSelectGenre => 'Seleziona Genere';

  @override
  String get shuffleLibrary => 'Libreria';

  @override
  String get shuffleGenre => 'Genere';

  @override
  String get shuffleNoLibraries => 'Nessuna libreria compatibile disponibile.';

  @override
  String get shuffleNoGenres =>
      'Nessun genere trovato per questa modalità casuale.';

  @override
  String get posterDisplayTitle => 'Visualizzazione';

  @override
  String get posterImageType => 'Tipo Immagine';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Stendardo';

  @override
  String get playlistAddFailed => 'Impossibile aggiungere alla playlist';

  @override
  String get playlistCreateFailed => 'Impossibile creare la playlist';

  @override
  String get playlistNew => 'Nuova Playlist';

  @override
  String get playlistCreate => 'Crea';

  @override
  String get playlistCreateNew => 'Crea Nuova Playlist';

  @override
  String get playlistNoneFound => 'Nessuna playlist trovata';

  @override
  String get addToPlaylist => 'Aggiungi alla Playlist';

  @override
  String get removeFromPlaylist => 'Rimuovi dalla Playlist';

  @override
  String removeFromPlaylistConfirm(String item, String playlist) {
    return 'Rimuovere $item da $playlist?';
  }

  @override
  String get removeFromPlaylistFailed => 'Impossibile rimuovere dalla playlist';

  @override
  String get lyricsNotAvailable => 'Nessun testo disponibile';

  @override
  String get upNext => 'Prossimo';

  @override
  String get playNext => 'Riproduci Dopo';

  @override
  String get stillWatchingContent =>
      'La riproduzione è stata messa in pausa. Stai ancora guardando?';

  @override
  String get stillWatchingStop => 'Interrompi';

  @override
  String get stillWatchingContinue => 'Continua';

  @override
  String skipSegment(String segment) {
    return 'Salta $segment';
  }

  @override
  String get liveTv => 'TV Live';

  @override
  String get continueWatchingAndNextUp => 'Continua a Guardare e Prossimo';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Download $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Download di $fileName';
  }

  @override
  String get nextEpisode => 'Prossimo Episodio';

  @override
  String get moreFromThisSeason => 'Altro da Questa Stagione';

  @override
  String get playerTooltipPlaybackSpeed => 'Velocità di riproduzione';

  @override
  String get playerTooltipCastControls => 'Controlli cast';

  @override
  String get playerTooltipPlaybackQuality => 'Bitrate';

  @override
  String get playerTooltipEnterFullscreen => 'Entra a schermo intero';

  @override
  String get playerTooltipExitFullscreen => 'Esci da schermo intero';

  @override
  String get playerTooltipFloatOnTop => 'Galleggia sopra';

  @override
  String get playerTooltipExitFloatOnTop => 'Disabilita il float in alto';

  @override
  String get playerTooltipLockLandscape => 'Blocca il paesaggio';

  @override
  String get playerTooltipUnlockOrientation => 'Consenti rotazione';

  @override
  String get playerTooltipPrevious => 'Precedente';

  @override
  String get playerTooltipSeekBack => 'Riavvolgi';

  @override
  String get playerTooltipSeekForward => 'Avanti veloce';

  @override
  String get playerTooltipMinimize => 'Riduci lettore';

  @override
  String get miniPlayerOpenPlayer => 'Apri lettore';

  @override
  String get contextMenuMarkWatched => 'Segna come visto';

  @override
  String get contextMenuMarkUnwatched => 'Segna come non visto';

  @override
  String get contextMenuAddToFavorites => 'Aggiungi ai preferiti';

  @override
  String get contextMenuRemoveFromFavorites => 'Rimuovi dai preferiti';

  @override
  String get contextMenuGoToSeries => 'Vai alla serie';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Nascondi da Continua a Guardare';

  @override
  String get contextMenuHideFromNextUp => 'Nascondi da Prossimo';

  @override
  String get contextMenuAddToCollection => 'Aggiungi alla Collezione';

  @override
  String get contextMenuRemoveFromCollection => 'Rimuovi dalla Collezione';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Rimuovere $item da $collection? L\'elemento resta nella tua libreria.';
  }

  @override
  String get removeFromCollectionFailed =>
      'Impossibile rimuovere dalla collezione';

  @override
  String get settingsAdministrationSubtitle =>
      'Accedi al pannello di amministrazione del server';

  @override
  String get settingsDynamicContent => 'Contenuto dinamico';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra multimediale e sovrapposizioni visive';

  @override
  String get settingsAboutSubtitle =>
      'Versione dell\'app, informazioni legali e crediti';

  @override
  String get settingsSortServersBy => 'Ordina server per';

  @override
  String get settingsLastUsed => 'Ultimo utilizzo';

  @override
  String get settingsAlphabetical => 'Alfabetico';

  @override
  String get settingsAllowSelfSignedCerts => 'Consenti certificati autofirmati';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Considera attendibili i server che usano certificati TLS autofirmati o con CA privata. Abilita solo per i server che controlli. Questo disattiva la convalida dei certificati per tutte le connessioni.';

  @override
  String get untrustedServerCertificate =>
      'Il certificato di questo server non è attendibile. Se è il tuo server e usa un certificato autofirmato o privato, puoi consentirlo qui.';

  @override
  String get clientCertTitle => 'Certificato client';

  @override
  String clientCertHost(String host) {
    return 'Certificato per $host';
  }

  @override
  String get clientCertChooseFile => 'Scegli file';

  @override
  String get clientCertPassword => 'Password del certificato';

  @override
  String get clientCertStartUpload => 'Invia dal telefono';

  @override
  String get clientCertUploadHint =>
      'Scansiona questo codice con il telefono o apri l\'indirizzo nel suo browser, poi scegli il file e inserisci la password.';

  @override
  String get clientCertStopUpload => 'Smetti di attendere';

  @override
  String get clientCertNoFileData => 'Impossibile leggere il file. Riprova.';

  @override
  String get clientCertPickFailed => 'Impossibile aprire la selezione file.';

  @override
  String get clientCertUploadFailed =>
      'Impossibile avviare la pagina di caricamento. Riprova.';

  @override
  String get clientCertNoSecureStorage =>
      'Questo dispositivo non ha un archivio sicuro, quindi il certificato non può essere salvato. Su Linux, installa libsecret e riprova.';

  @override
  String get clientCertDecodeFailed =>
      'Impossibile leggere il file come certificato. Assicurati che sia un .p12 o .pfx.';

  @override
  String get clientCertWrongPassword =>
      'Questa password non sblocca il certificato.';

  @override
  String get clientCertRequired =>
      'Questo server richiede un certificato client (mTLS). Aggiungine uno per questo host per continuare.';

  @override
  String clientCertExpired(String date) {
    return 'Il certificato per questo server è scaduto il $date. Sostituiscilo per continuare.';
  }

  @override
  String get clientCertAddButton => 'Aggiungi certificato client';

  @override
  String get settingsClientCertificates => 'Certificati client';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Certificati che questa app presenta ai server che li richiedono (mTLS)';

  @override
  String get clientCertSubject => 'Soggetto';

  @override
  String clientCertExpires(String date) {
    return 'Scade il $date';
  }

  @override
  String get clientCertReplace => 'Sostituisci';

  @override
  String get clientCertAdd => 'Aggiungi certificato';

  @override
  String get clientCertAddHostPrompt =>
      'Quale host del server richiede un certificato?';

  @override
  String get itemBlockedByParentalControls => 'Non disponibile';

  @override
  String get blockedRatingsCeilingHint =>
      'Bloccare una classificazione blocca anche tutte quelle più restrittive.';

  @override
  String get blockedRatingsUnrankedSection => 'Blocca solo se stessa';

  @override
  String get settingsHomePage => 'Pagina iniziale';

  @override
  String get settingsTwentyFourHourClock => 'Orologio 24 ore';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Utilizza la formattazione dell\'ora a 24 ore ovunque venga visualizzato l\'orologio';

  @override
  String get settingsDateFormat => 'Formato Data';

  @override
  String get settingsDateFormatDescription =>
      'Scegli tra mese-giorno, giorno-mese o il formato predefinito della lingua per le date del calendario e di uscita';

  @override
  String get dateFormatSystem => 'Predefinito della Lingua';

  @override
  String get dateFormatMonthDay => 'Mese / Giorno (nov 10)';

  @override
  String get dateFormatDayMonth => 'Giorno / Mese (10 nov)';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Mostra il pulsante di riproduzione casuale nella barra di navigazione';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Mostra il pulsante dei generi nella barra di navigazione';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Mostra il pulsante dei preferiti nella barra di navigazione';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Mostra il pulsante TV Live nella barra di navigazione quando il server ha una libreria TV Live';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostra il pulsante delle librerie nella barra di navigazione';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Mostra il pulsante Seerr nella barra di navigazione';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Mostra sempre le etichette di testo nella barra di navigazione superiore';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Attiva/disattiva la visibilità della home page per libreria. Riavvia Moonfin affinché le modifiche abbiano effetto.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barra multimediale e anteprime locali';

  @override
  String get settingsVisualOverlays => 'Sovrapposizioni visive';

  @override
  String get settingsSeasonalSurprise => 'Sorpresa stagionale';

  @override
  String get useNativeEmulator => 'Emulazione nativa';

  @override
  String get useNativeEmulatorSubtitle =>
      'Riproduci i giochi con core nativi invece del lettore web EmulatorJS';

  @override
  String get emulatorCores => 'Core dell’emulatore';

  @override
  String get emulatorCoresSubtitle =>
      'Scarica i sistemi per giocare ai giochi in modalità nativa';

  @override
  String get emulatorCoresDescription =>
      'Scegli quali sistemi installare. I core sono forniti dal progetto libretro e consentono di eseguire i giochi in modalità nativa invece che in una vista del browser.';

  @override
  String get emulatorCoreDownloading => 'Download in corso';

  @override
  String get emulatorCoreUnavailable =>
      'Non disponibile per questo dispositivo';

  @override
  String get emulatorCoreDownloadFailed =>
      'Impossibile scaricare il core. Controlla la connessione e riprova.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Ripristina impostazioni predefinite di $system';
  }

  @override
  String get emulatorCoreSettingsReset =>
      'Impostazioni ripristinate ai valori predefiniti.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Impossibile ripristinare le impostazioni. Controlla la connessione e riprova.';

  @override
  String get downloadedGames => 'Giochi scaricati';

  @override
  String get downloadedGamesSubtitle =>
      'Libera lo spazio occupato dai file dei giochi';

  @override
  String get downloadedGamesDescription =>
      'I giochi vengono copiati su questo dispositivo prima di essere riprodotti. Rimuovi quelli che hai finito per liberare spazio. I salvataggi vengono mantenuti sul server e non vengono eliminati.';

  @override
  String get downloadedGamesEmpty =>
      'Nessun gioco è stato ancora scaricato su questo dispositivo.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count giochi, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Rimuovi tutto';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Rimuovere $title da questo dispositivo? Verrà scaricato di nuovo la prossima volta che lo riproduci.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Rimuovere tutti i giochi scaricati da questo dispositivo? Verranno scaricati di nuovo la prossima volta che li riproduci.';

  @override
  String get settingsHigh => 'Alto';

  @override
  String get settingsLow => 'Basso';

  @override
  String get settingsCustomPath => 'Percorso personalizzato';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Inserisci il percorso della cartella di download';

  @override
  String get settingsConcurrentDownloads => 'Download simultanei';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Numero massimo di elementi da scaricare contemporaneamente.';

  @override
  String get settingsAppInfo => 'INFORMAZIONI SULL\'APP';

  @override
  String get settingsReportAnIssue => 'Segnala un problema';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Apri il monitoraggio dei problemi su GitHub';

  @override
  String get settingsJoinDiscord => 'Unisciti a Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Chatta con la comunità';

  @override
  String get settingsJoinTheDiscord => 'Unisciti al Discord';

  @override
  String get settingsSupportMoonfin => 'Supporto Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Offri un caffè allo sviluppatore';

  @override
  String get settingsLegal => 'LEGALE';

  @override
  String get settingsLicenses => 'Licenze';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avvisi sulla licenza open source';

  @override
  String get settingsPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Come Moonfin gestisce i tuoi dati';

  @override
  String get settingsCheckForUpdates => 'Controlla gli aggiornamenti';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Controlla la versione più recente Moonfin';

  @override
  String get settingsBoth => 'Entrambi';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filtro del tipo di contenuto casuale';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Tracce audio, elaborazione e opzioni passthrough';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Riproduzione e sequenziamento automatizzati';

  @override
  String get settingsSyncplaySubtitle =>
      'Guarda insieme agli amici su questo server, tutti in sincronia';

  @override
  String get settingsSkipIntrosAndOutros => 'Saltare intro e outro?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return 'Segmenti $segment';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Conto alla Rovescia Segmenti Media';

  @override
  String get settingsProgressBar => 'Barra di Avanzamento';

  @override
  String get settingsTimer => 'Timer';

  @override
  String get settingsNone => 'Nessuno';

  @override
  String get settingsSkipButtonAutoHide =>
      'Nascondi Automaticamente il Pulsante Salta';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Nascondi automaticamente il pulsante per saltare intro e finale dopo qualche secondo.';

  @override
  String get settingsPromptUser => 'Richiedi all\'utente';

  @override
  String get settingsSkip => 'Salta';

  @override
  String get settingsDoNothing => 'Non fare nulla';

  @override
  String get settingsMaxBitrateDescription =>
      'Limita il bitrate dello streaming. Il contenuto al di sopra di questa soglia verrà transcodificato per adattarsi.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limita la risoluzione massima richiesta dal giocatore. Il contenuto ad alta risoluzione verrà transcodificato.';

  @override
  String get settingsPlayerZoomDescription =>
      'Come il video viene adattato allo schermo. Zoom per riempire ingrandisce l\'immagine finché riempie lo schermo e ne taglia i bordi. Non rileva le bande nere.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Motore di riproduzione (TV Android)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Scegli il motore di riproduzione predefinito sui dispositivi Android TV. Le modifiche si applicano alla successiva sessione di riproduzione.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (consigliato)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (precedente)';

  @override
  String get settingsRedetectDisplay => 'Rileva di nuovo lo schermo';

  @override
  String get settingsRedetectDisplayDescription =>
      'Chiede di nuovo alla TV quali formati HDR supporta. Usalo se i titoli Dolby Vision o HDR10 vengono transcodificati dopo che la TV o il ricevitore sono stati accesi in ritardo.';

  @override
  String get settingsDisplayIsSdr => 'La mia TV non è HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Smette di dichiarare il supporto HDR per questo schermo. Usalo solo se il rilevamento continua a segnalare un HDR che la tua TV non riesce davvero a mostrare.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Schermo rilevato di nuovo: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'Nessun formato HDR rilevato';

  @override
  String get settingsDisplayMarkedSdr => 'Schermo salvato come SDR';

  @override
  String get settingsDolbyVisionFallback => 'Fallback Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportamento dei titoli Dolby Vision su dispositivi senza decodifica Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Chiedi ogni volta';

  @override
  String get settingsPreferHdr10Fallback => 'Preferisci HDR10 fallback';

  @override
  String get settingsPreferServerTranscode =>
      'Preferisci la transcodifica del server';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profilo 7 Riproduzione diretta';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controlla se i flussi del livello di miglioramento Dolby Vision profilo 7 devono dirigere la riproduzione.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automatico (AFTKRT abilitato)';

  @override
  String get settingsEnabledOnThisDevice => 'Abilitato su questo dispositivo';

  @override
  String get settingsDisabledPreferTranscode =>
      'Disabilitato (preferisci la transcodifica)';

  @override
  String get settingsResumeRewindDescription =>
      'Quando si riprende la riproduzione (da Continua a guardare o dalla pagina di un elemento multimediale), quanti secondi devono essere riavvolti?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Quando si riprende la riproduzione dopo aver premuto il pulsante di pausa, quanti secondi devono essere riavvolti?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Quanti secondi tornare indietro dopo aver premuto il pulsante di riavvolgimento.';

  @override
  String get settingsOneSecond => '1 secondo';

  @override
  String get settingsThreeSeconds => '3 secondi';

  @override
  String get settingsFortyFiveSeconds => '45 secondi';

  @override
  String get settingsSixtySeconds => '60 secondi';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Quanti secondi per saltare in avanti dopo aver premuto il pulsante di avanzamento veloce.';

  @override
  String get settingsHideControlsAfter => 'Nascondi Controlli Dopo';

  @override
  String get settingsHideControlsAfterDescription =>
      'Per quanto tempo i controlli del lettore restano sullo schermo dopo l\'ultima pressione di un tasto, tocco o movimento del mouse.';

  @override
  String get settingsHideControlsOnResume => 'Hide Controls When Resuming';

  @override
  String get settingsHideControlsOnResumeDescription =>
      'When you press play on a paused video, the player controls disappear right away instead of waiting.';

  @override
  String get settingsHdrControlsDimming => 'Attenua Controlli in HDR';

  @override
  String get settingsHdrControlsDimmingDescription =>
      'Il bianco appare molto più luminoso accanto al video HDR, quindi durante la riproduzione i controlli del lettore vengono attenuati di questa quantità.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 a decoder esterno';

  @override
  String get settingsCinemaMode => 'Modalità cinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Riproduci trailer/preroll prima di un film principale';

  @override
  String get settingsCinemaModeEpisodes => 'Modalità cinema per gli episodi';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Riproduci i preroll anche prima degli episodi TV';

  @override
  String get settingsNextUpDisplayDescription =>
      'Esteso mostra una scheda completa con grafica e descrizione dell\'episodio. Minimal mostra una sovrapposizione compatta del conto alla rovescia. Disabilitato nasconde completamente il prompt.';

  @override
  String get settingsShort => 'Corto';

  @override
  String get settingsLong => 'Lungo';

  @override
  String get settingsVeryLong => 'Molto lungo';

  @override
  String get settingsVideoStartDelay => 'Ritardo avvio video';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Riproduzione diretta TV in diretta';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Abilita la riproduzione diretta per la TV in diretta';

  @override
  String get settingsOpenGroups => 'Watch Party aperte';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Avviane una o unisciti a una in corso';

  @override
  String get settingsSyncplayEnabled => 'Watch Party';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Guarda insieme agli amici su questo server, tutti in sincronia';

  @override
  String get settingsSyncplayButton => 'Pulsante Watch Party';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostra il pulsante Watch Party sulla barra di navigazione';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correzione avanzata';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ritardi e scostamento aggiuntivo';

  @override
  String get settingsSyncplaySyncCorrection =>
      'Correzione della sincronizzazione';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Mantieni questo dispositivo in sincronia con la stanza';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocità per sincronizzare';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Riproduci un po\' più veloce o più lento per recuperare';

  @override
  String get settingsSyncplaySkipToSync => 'Salta per sincronizzare';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Salta quando lo scarto è troppo grande';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Ritardo di velocità minima';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Ritardo velocità massima';

  @override
  String get settingsSyncplaySpeedDuration => 'Durata della velocità';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Ritardo minimo di salto';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Offset extra';

  @override
  String get onNow => 'Adesso';

  @override
  String get collections => 'Collezioni';

  @override
  String get lastPlayed => 'Ultima riproduzione';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return '$libraryName aggiunti di recente';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '$libraryName - Usciti di Recente';
  }

  @override
  String get autoplayNextEpisode =>
      'Riproduci Automaticamente l\'Episodio Successivo';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Riproduci automaticamente l\'episodio successivo quando disponibile.';

  @override
  String get skipSilenceTitle => 'Salta i silenzi';

  @override
  String get skipSilenceSubtitle =>
      'Salta automaticamente i segmenti audio silenziosi quando lo stream lo supporta.';

  @override
  String get allowExternalAudioEffectsTitle => 'Consenti effetti audio esterni';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Consenti alle app di equalizzazione ed effetti (es. Wavelet) di collegarsi alle sessioni di riproduzione Media3.';

  @override
  String get disableTunnelingTitle => 'Disabilita il tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Forza la riproduzione senza tunneling. Utile sui dispositivi con discontinuità audio/video dovute al tunneling.';

  @override
  String get enableTunnelingTitle => 'Abilita il tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Avanzato. Instrada audio e video attraverso un percorso hardware accoppiato. Disattivato per impostazione predefinita perché causa interruzioni audio/video su alcuni dispositivi.';

  @override
  String get mapDolbyVisionP7Title =>
      'Riproduci sempre Dolby Vision profilo 7 come HDR10';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Riproduci gli stream Dolby Vision profilo 7 come HEVC compatibile con HDR10 sui dispositivi senza Dolby Vision.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Riproduci Dolby Vision con HDR10+ come HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Rimuove il livello Dolby Vision dai video che hanno anche HDR10+. Attivalo se questi video vengono riprodotti con l\'audio ma con lo schermo nero.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Usa gli stili incorporati dei sottotitoli';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Applica colori, caratteri e posizionamento incorporati nella traccia dei sottotitoli. Disattiva per usare invece le tue preferenze di stile.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Usa le dimensioni del carattere incorporate nei sottotitoli';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Applica le indicazioni di dimensione del carattere incorporate nella traccia dei sottotitoli. Disattiva per usare la dimensione definita nelle tue preferenze di stile.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Mostra Dettagli Media';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Mostra i dettagli dell\'elemento selezionato in cima alle pagine della Libreria.';

  @override
  String get libraryCardTitles => 'Titoli Sotto i Poster';

  @override
  String get libraryCardTitlesDescription =>
      'Mostra il titolo e i dettagli di ogni elemento sotto la sua immagine nelle griglie della libreria.';

  @override
  String get useDetailedSubHeadings => 'Usa Sottotitoli Dettagliati';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Mostra una sottoriga dettagliata o minimale nelle pagine della Libreria.';

  @override
  String get savedThemesDeleteDialogTitle => 'Eliminare il tema salvato?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Rimuovere \"$themeName\" dalla cache di questo dispositivo?';
  }

  @override
  String get themeStore => 'Store dei Temi';

  @override
  String get themeStoreSubtitle => 'Sfoglia e salva i temi della community';

  @override
  String get themeStoreDescription =>
      'Salva un tema per usarlo come gli altri temi salvati.';

  @override
  String get themeStoreEmpty => 'Al momento non è disponibile alcun tema.';

  @override
  String get themeStoreLoadFailed =>
      'Impossibile caricare lo Store dei Temi. Controlla la connessione e riprova.';

  @override
  String get themeStoreSave => 'Salva';

  @override
  String get themeStoreSaveAndApply => 'Salva e applica';

  @override
  String get themeStoreSaved => 'Salvato';

  @override
  String get themeStoreInvalidMessage => 'Impossibile caricare questo tema.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" salvato.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" eliminato da questo dispositivo.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Impossibile eliminare \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Temi salvati';

  @override
  String get savedThemesDescription =>
      'Questi sono i temi scaricati dal plugin Moonfin per il server attuale. L\'eliminazione rimuove solo questa copia locale.';

  @override
  String get savedThemesEmpty =>
      'Nessun tema salvato trovato per questo server.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Attualmente attivo';
  }

  @override
  String get savedThemesDeleteTooltip => 'Elimina tema salvato';

  @override
  String get savedThemesManageSubtitle =>
      'Gestisci i temi del plugin scaricati su questo dispositivo';

  @override
  String get themeEditor => 'Editor Temi';

  @override
  String get themeEditorSubtitle =>
      'Apri l\'Editor Temi di Moonfin nel browser';

  @override
  String get homeScreen => 'Schermata Home';

  @override
  String get bottomBar => 'Barra Inferiore';

  @override
  String get homeRowsStyleClassic => 'Classico';

  @override
  String get homeRowsStyleModern => 'Moderno';

  @override
  String get homeRowsStyleCarousel => 'Carousel';

  @override
  String get homeRowsSection => 'Righe Home';

  @override
  String get rowsType => 'Tipo di Riga';

  @override
  String get rowsTypeDescription =>
      'Classico mantiene il tipo di immagine per riga e l\'overlay informativo. Moderno usa righe da verticale a sfondo.';

  @override
  String get modernCardsOnMyMediaRow =>
      'Schede moderne nella riga I Miei Media';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Mostra poster personalizzabili che si espandono al focus. Disabilita per mostrare sempre la miniatura orizzontale.';

  @override
  String get sortOrder => 'Ordine';

  @override
  String get ascending => 'Crescente';

  @override
  String get descending => 'Decrescente';

  @override
  String get displayFavoritesRows => 'Mostra Righe Preferiti';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Mostra Film Preferiti, Serie e altre righe di preferiti nelle Sezioni Home.';

  @override
  String get favoritesRowSorting => 'Ordinamento Righe Preferiti';

  @override
  String get favoritesRowSortingDescription =>
      'Ordina le righe Preferiti per data di aggiunta, data di uscita, alfabeticamente e altro.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Ordina le righe Preferiti in ordine crescente o decrescente.';

  @override
  String get displayCollectionsRows => 'Mostra Righe Collezioni';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Mostra le righe Collezioni nelle Sezioni Home.';

  @override
  String get collectionsRowSorting => 'Ordinamento Righe Collezioni';

  @override
  String get collectionsRowSortingDescription =>
      'Ordina le righe Collezioni per data di aggiunta, data di uscita, alfabeticamente e altro.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Ordina le righe Collezioni in ordine crescente o decrescente.';

  @override
  String get collectionsRowShowEpisodes => 'Mostra Singoli Episodi';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Espandi le serie TV per mostrare ogni episodio separatamente.';

  @override
  String get displayGenresRows => 'Mostra Righe Generi';

  @override
  String get displayGenresRowsSubtitle =>
      'Mostra le righe Generi nelle Sezioni Home.';

  @override
  String get genresRowSorting => 'Ordinamento Righe Generi';

  @override
  String get genresRowSortingDescription =>
      'Ordina le righe Generi per data di aggiunta, data di uscita, alfabeticamente e altro.';

  @override
  String get genresRowSortOrderDescription =>
      'Ordina le righe Generi in ordine crescente o decrescente.';

  @override
  String get genresRowItems => 'Elementi Righe Generi';

  @override
  String get genresRowItemsDescription =>
      'Mostra Film, Serie o entrambi nelle righe Generi.';

  @override
  String get displayStudiosRows => 'Mostra Riga Studi';

  @override
  String get displayStudiosRowsSubtitle =>
      'Mostra la riga Studi nelle Sezioni Home.';

  @override
  String get sinceYouWatched => 'Perché Hai Guardato';

  @override
  String get sinceYouWatchedRowTitle => 'Perché hai guardato';

  @override
  String sinceYouWatchedItemRowTitle(String title) {
    return 'Perché hai guardato \"$title\"';
  }

  @override
  String sinceYouWatchedRowNumber(int number) {
    return 'Riga Perché Hai Guardato $number';
  }

  @override
  String get displaySinceYouWatchedRows => 'Mostra Righe Perché Hai Guardato';

  @override
  String get displaySinceYouWatchedRowsSubtitle =>
      'Mostra e personalizza le righe Perché Hai Guardato nelle Sezioni Home.';

  @override
  String get sinceYouWatchedSource => 'Origine Raccomandazioni';

  @override
  String get sinceYouWatchedSourceDescription =>
      'Scegli l\'origine delle raccomandazioni (Suggerimenti Moonfin, algoritmo locale personalizzato; Suggerimenti Jellyfin, motore del server; oppure le metriche di similarità di TMDb. Nota: le raccomandazioni online richiedono l\'integrazione con Seerr).';

  @override
  String get sinceYouWatchedSourceLocal => 'Suggerimenti Moonfin';

  @override
  String get sinceYouWatchedSourceServer => 'Suggerimenti Jellyfin';

  @override
  String get sinceYouWatchedSourceOnline => 'Similarità TMDb';

  @override
  String get sinceYouWatchedSourceType => 'Tipo di Origine';

  @override
  String get sinceYouWatchedSourceTypeDescription =>
      'Scegli il tipo di elementi da raccomandare';

  @override
  String get sinceYouWatchedSourceItem => 'Elemento di Origine';

  @override
  String get sinceYouWatchedSourceItemDescription =>
      'Scegli su quale elemento basare le raccomandazioni';

  @override
  String get sinceYouWatchedRecentlyWatched => 'Visti di Recente';

  @override
  String get sinceYouWatchedNumRows => 'Numero di Righe da Aggiungere';

  @override
  String get sinceYouWatchedNumRowsDescription =>
      'Scegli quante righe Perché Hai Guardato mostrare (1-5)';

  @override
  String get sinceYouWatchedIncludeWatched => 'Includi Già Visti';

  @override
  String get sinceYouWatchedIncludeWatchedSubtitle =>
      'Includi gli elementi già visti nelle raccomandazioni';

  @override
  String get studiosRowSorting => 'Ordinamento Riga Studi';

  @override
  String get studiosRowSortingDescription =>
      'Ordina la riga Studi per nome, aggiunti di recente e altro.';

  @override
  String get studiosRowSortOrderDescription =>
      'Scegli l\'ordine crescente o decrescente.';

  @override
  String get selectStudiosToInclude => 'Seleziona gli Studi da Includere';

  @override
  String get selectStudiosToIncludeDescription =>
      'Seleziona quali studi includere nella riga home.';

  @override
  String get selectAllStudios => 'Seleziona Tutto';

  @override
  String get deselectAllStudios => 'Deseleziona Tutto';

  @override
  String get tvStudiosFilter => 'Studi TV';

  @override
  String get movieStudiosFilter => 'Studi Cinematografici';

  @override
  String get selectedStudiosFilter => 'Studi Selezionati';

  @override
  String get unselectedStudiosFilter => 'Studi Non Selezionati';

  @override
  String get filtersHeader => 'Filtri';

  @override
  String get showHeader => 'Mostra';

  @override
  String get displayPlaylistsRows => 'Mostra Righe Playlist';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Mostra le righe Playlist nelle Sezioni Home.';

  @override
  String get playlistsRowSorting => 'Ordinamento Righe Playlist';

  @override
  String get playlistsRowSortingDescription =>
      'Ordina le righe Playlist per data di aggiunta, data di uscita, alfabeticamente e altro.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Ordina le righe Playlist in ordine crescente o decrescente.';

  @override
  String get playlistsRowShowEpisodes => 'Mostra Singoli Episodi';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Espandi le serie TV per mostrare ogni episodio separatamente.';

  @override
  String get displayAudioRows => 'Mostra Righe Audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Mostra le righe Audio nelle Sezioni Home.';

  @override
  String get audioRowsSorting => 'Ordinamento righe Audio';

  @override
  String get audioRowsSortingDescription =>
      'Ordina le righe Audio per data di aggiunta, data di uscita, alfabeticamente e altro.';

  @override
  String get audioRowsSortOrderDescription =>
      'Ordina le righe Audio in ordine crescente o decrescente.';

  @override
  String get sorting => 'Ordinamento';

  @override
  String get imdbRowsSorting => 'Ordinamento Righe IMDb';

  @override
  String get imdbRowsSortingDescription =>
      'Ordina le righe IMDb per nome, data di uscita, valutazione e altro.';

  @override
  String get imdbRowsSortOrderDescription =>
      'Ordina le righe IMDb in ordine crescente o decrescente.';

  @override
  String get tmdbRowsSorting => 'Ordinamento Righe TMDB';

  @override
  String get tmdbRowsSortingDescription =>
      'Ordina le righe TMDB per nome, data di uscita, valutazione e altro.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'Ordina le righe TMDB in ordine crescente o decrescente.';

  @override
  String get seerrRowsSorting => 'Ordinamento Righe Seerr';

  @override
  String get seerrRowsSortingDescription =>
      'Ordina le righe Seerr per nome, data di uscita, valutazione e altro.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Ordina le righe Seerr in ordine crescente o decrescente.';

  @override
  String get externalRowSortDefault => 'Predefinito (Ordine della Lista)';

  @override
  String get externalRowSortName => 'Nome';

  @override
  String get externalRowSortReleaseDate => 'Data di uscita';

  @override
  String get externalRowSortRating => 'Valutazione';

  @override
  String get externalRowSortPopularity => 'Popolarità';

  @override
  String get externalRowSortShuffle => 'Casuale';

  @override
  String get audioPlaylists => 'Playlist Audio';

  @override
  String get appearance => 'Aspetto';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Tastiera';

  @override
  String get navButtons => 'Pulsanti';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'Configurazione MPV';

  @override
  String get cardSize => 'Dimensione Schede';

  @override
  String get externalPlayerApp => 'App lettore esterno';

  @override
  String get externalPlayerAppDescription =>
      'Imposta un lettore esterno per abilitare la riproduzione con pressione prolungata';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Mostra il selettore di app all\'avvio della riproduzione.';

  @override
  String get loadingInstalledPlayers => 'Caricamento dei lettori installati…';

  @override
  String get connection => 'Connessione';

  @override
  String get locallyDecodedCodecs => 'Codec Decodificati Localmente';

  @override
  String get transcodeTargetCodecs =>
      'Codec di Destinazione della Transcodifica';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Supportato su questo dispositivo';

  @override
  String get notSupportedOnThisDevice => 'Non supportato su questo dispositivo';

  @override
  String get mediaPlayerBehavior => 'Comportamento del Lettore Media';

  @override
  String get playbackEnhancements => 'Miglioramenti della Riproduzione';

  @override
  String get alwaysOn => 'Sempre attivo.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Sostituisci Salta Finale con la Schermata Prossimo';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Mostra l\'overlay Prossimo invece del pulsante Salta Finale.';

  @override
  String get playerRouting => 'Instradamento del Lettore';

  @override
  String get preferSoftwareDecoders => 'Preferisci i decoder software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Usa FFmpeg (audio) e libgav1 (AV1) prima dei decoder hardware. Disattiva se il passthrough audio HDMI non funziona.';

  @override
  String get hevcSoftwareDirectPlay =>
      'Riproduzione Diretta HEVC (Decodifica Software)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'Riproduci HEVC fino a 1080p dal file originale invece di chiedere al server di transcodificarlo. Questa Apple TV lo decodifica via software, quindi i file a 10 bit pesanti o con bitrate elevato potrebbero scattare.';

  @override
  String get av1SoftwareUhdDirectPlay =>
      'Riproduzione Diretta AV1 4K (Decodifica Software)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      'Riproduci AV1 oltre 1080p, incluso HDR10, dal file originale invece di chiedere al server di transcodificarlo. Questo dispositivo decodifica AV1 via software, quindi i file 4K pesanti o con bitrate elevato potrebbero scattare.';

  @override
  String get cadenceSlowdown => '24 fps Fluidi su TV a 60 Hz';

  @override
  String get cadenceSlowdownSubtitle =>
      'Quando Adatta frequenza fotogrammi è disattivato, rallenta dello 0,1% i video a 24 fps per adattarli alla TV senza perdere fotogrammi. Non viene usato quando l\'audio è inviato in passthrough a un ricevitore.';

  @override
  String get cadenceTipTitle => 'Attiva Adatta Frequenza Fotogrammi';

  @override
  String get cadenceTipMessage =>
      'Questo video non può essere riprodotto in modo fluido con la frequenza di aggiornamento attuale della TV. Sulla tua Apple TV apri Impostazioni > Video e audio > Adatta contenuto e attiva Adatta frequenza fotogrammi.';

  @override
  String get cadenceTipSlowdownHint =>
      'Oppure attiva 24 fps Fluidi su TV a 60 Hz in Moonfin, in Riproduzione > Qualità e Decodifica.';

  @override
  String get useExternalPlayer => 'Usa sempre il lettore esterno';

  @override
  String get useExternalPlayerSubtitle =>
      'Apri la riproduzione video nell\'app esterna selezionata su Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Solo TV Live';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Utilizza il lettore esterno per la TV in diretta e quello integrato per tutti gli altri contenuti.';

  @override
  String get automaticQueuing => 'Accodamento Automatico';

  @override
  String get preferSdhSubtitles => 'Preferisci i sottotitoli SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Dai priorità alle tracce di sottotitoli SDH/CC nella selezione automatica.';

  @override
  String get preferTextSubtitles => 'Preferisci i sottotitoli testuali';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Privilegia i sottotitoli testuali (SRT, VTT) rispetto a quelli grafici (PGS, VobSub).';

  @override
  String get preferExternalSubtitles => 'Preferisci i sottotitoli esterni';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Privilegia i sottotitoli esterni rispetto a quelli inclusi nel video.';

  @override
  String get webDiagnostics => 'Diagnostica web';

  @override
  String get webDiagnosticsTitle => 'Diagnostica Web di Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Usa questa pagina per diagnosticare i problemi di connettività del browser (CORS, contenuti misti e impostazioni di rilevamento).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Rilevato Errore di Contenuto Misto';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Rilevato Errore CORS/Preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin ha rilevato una pagina HTTPS che tenta di chiamare un URL server HTTP. I browser bloccano questa richiesta prima che raggiunga il tuo server.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin ha rilevato un errore di richiesta a livello di browser, comunemente causato da intestazioni CORS o preflight mancanti sul media server.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL di destinazione: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Dettaglio: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Contesto di Runtime Attuale';

  @override
  String get webDiagnosticsOrigin => 'Origine';

  @override
  String get webDiagnosticsScheme => 'Schema';

  @override
  String get webDiagnosticsPluginMode => 'Modalità Plugin';

  @override
  String get webDiagnosticsWebRtcScan => 'Scansione WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL Server Forzato';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL Server Predefinito';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL Proxy di Rilevamento';

  @override
  String get notConfigured => 'non configurato';

  @override
  String get webDiagnosticsMixedContent => 'Contenuto Misto';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Questa pagina è caricata via HTTPS, ma uno o più URL configurati sono HTTP. I browser impediscono alle pagine HTTPS di chiamare API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Soluzione: pubblica il tuo media server o l\'endpoint proxy via HTTPS, oppure carica Moonfin via HTTP solo su reti locali attendibili.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nessuna configurazione evidente di contenuto misto rilevata dalle impostazioni di runtime attuali.';

  @override
  String get webDiagnosticsCorsChecklist => 'Checklist CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Consenti l\'origine del browser in Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Includi Authorization, X-Emby-Authorization e X-Emby-Token in Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Esponi Content-Range e Accept-Ranges per lo streaming e la ricerca.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Rispondi con 204 alle richieste preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Esempio di Intestazioni (stile nginx)';

  @override
  String get note => 'Nota';

  @override
  String get webDiagnosticsNonWebNote =>
      'Questa pagina di diagnostica è pensata per le build web. Se la stai vedendo su un\'altra piattaforma, questi controlli potrebbero non essere pertinenti.';

  @override
  String get backToServerSelect => 'Torna alla Selezione Server';

  @override
  String get signOutAllUsers => 'Disconnetti Tutti gli Utenti';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'L\'autorizzazione al microfono è stata negata definitivamente. Abilitala nelle impostazioni di sistema.';

  @override
  String get voiceSearchPermissionRequired =>
      'L\'autorizzazione al microfono è necessaria per la ricerca vocale.';

  @override
  String get voiceSearchNoMatch => 'Non ho capito. Riprova.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nessuna voce rilevata.';

  @override
  String get voiceSearchMicrophoneError => 'Errore del microfono.';

  @override
  String get voiceSearchNeedsInternet =>
      'La ricerca vocale richiede una connessione a Internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Il servizio vocale è occupato. Riprova.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'L\'autorizzazione al microfono è stata negata definitivamente.';

  @override
  String get microphonePermissionDenied =>
      'L\'autorizzazione al microfono è stata negata.';

  @override
  String get speechRecognitionUnavailable =>
      'Il riconoscimento vocale non è disponibile su questo dispositivo.';

  @override
  String get openIosRoutePicker => 'Apri il selettore di uscita iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'Il selettore AirPlay non è disponibile su questo dispositivo.';

  @override
  String get videos => 'Video';

  @override
  String get programs => 'Programmi';

  @override
  String get songs => 'Brani';

  @override
  String get photoAlbums => 'Album Fotografici';

  @override
  String get photos => 'Foto';

  @override
  String get people => 'Persone';

  @override
  String get recentlyReleasedEpisodes => 'Episodi Usciti di Recente';

  @override
  String get watchAgain => 'Guarda di Nuovo';

  @override
  String get guestAppearances => 'Partecipazioni Speciali';

  @override
  String get appearancesSeerr => 'Apparizioni (Seerr)';

  @override
  String get crewContributionsSeerr => 'Contributi Troupe (Seerr)';

  @override
  String get personWebsite => 'Sito ufficiale';

  @override
  String get watchWithGroup => 'Guarda con il gruppo';

  @override
  String get watchPartyGroupSubtitles => 'Sottotitoli per tutti';

  @override
  String get watchPartyOwnSubtitles => 'Scelta di ciascuno';

  @override
  String get watchPartyLobby => 'In sala d\'attesa';

  @override
  String get watchPartyUpNextLabel => 'Prossimo';

  @override
  String get watchPartyRoomSettings => 'Impostazioni stanza';

  @override
  String get watchPartyCodeOrLink => 'Codice stanza o link di invito';

  @override
  String get watchPartyCopyInvite => 'Copia link di invito';

  @override
  String get watchPartyInviteCopied => 'Link di invito copiato';

  @override
  String get watchPartyLetEveryoneVote => 'Fai votare i film a tutti';

  @override
  String get watchPartyVoteHelp =>
      'Aggiungi film da far votare a tutti, poi riproduci quello che vuoi. Gli episodi delle serie TV li scegli sempre tu.';

  @override
  String get watchPartyGuestVoteHelp =>
      'Vota cosa vuoi guardare. L\'organizzatore ne riproduce uno.';

  @override
  String get watchPartySearchMovies => 'Cerca film';

  @override
  String get watchPartyNoSuggestions => 'Nessun film da votare ancora.';

  @override
  String get watchPartySuggested => 'Aggiunto alla votazione del Watch Party';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count voti',
      one: '$count voto',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => 'Watch Party';

  @override
  String get watchPartyUnavailable => 'Questo server non offre il Watch Party.';

  @override
  String get watchPartyRoomCode => 'Codice stanza';

  @override
  String get watchPartyStart => 'Avvia un Watch Party';

  @override
  String get watchPartyPickTitle =>
      'Apri un titolo e scegli Guarda con il gruppo per decidere cosa guardano tutti.';

  @override
  String get watchPartyWaitingForHost =>
      'In attesa che l\'organizzatore scelga qualcosa.';

  @override
  String get watchPartyShareCode =>
      'Gli altri si uniscono con questo codice dalla loro schermata Watch Party.';

  @override
  String get watchPartyReconnecting => 'Riconnessione…';

  @override
  String get watchPartyOffline => 'offline';

  @override
  String get watchPartyStartForEveryone => 'Avvia per tutti';

  @override
  String watchPartyResumeAt(String time) {
    return 'Riprendi da $time';
  }

  @override
  String get watchPartyStartFromBeginning => 'Avvia dall\'inizio';

  @override
  String watchPartyResumeWhere(String name) {
    return 'Punto raggiunto da $name, il meno avanzato tra i presenti.';
  }

  @override
  String get watchPartyResumeEarliest =>
      'Il punto meno avanzato tra i presenti.';

  @override
  String get watchPartyResumeYours => 'Dove eri rimasto. Tutti partono da lì.';

  @override
  String watchPartyResumeNotStarted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count persone non l\'hanno ancora iniziato.',
      one: '1 persona non l\'ha ancora iniziato.',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyBackToLobby => 'Torna alla sala d\'attesa';

  @override
  String get watchPartyGuestsCanPause =>
      'Gli ospiti possono riprodurre e mettere in pausa';

  @override
  String get watchPartyEnd => 'Termina Watch Party';

  @override
  String get watchPartyEnded => 'Il Watch Party è terminato.';

  @override
  String get watchPartyStaged => 'Scelto per il Watch Party';

  @override
  String watchPartyUpNext(String title) {
    return 'Prossimo: $title';
  }

  @override
  String get watchParties => 'Watch Party';

  @override
  String get watchPartyStartWith => 'Avvia le serate di visione con';

  @override
  String get watchPartyServiceMoonbaseHint =>
      'Chat, reazioni e votazioni. Funziona con Moonbase.';

  @override
  String get watchPartyServiceSyncPlayHint =>
      'Quello di Jellyfin. Possono unirsi anche gli amici con altre app Jellyfin.';

  @override
  String get watchPartyServiceNote =>
      'Puoi unirti a stanze di entrambi i tipi. Questa scelta vale solo per quelle che avvii tu.';

  @override
  String get watchPartyDuringParty => 'Durante la serata';

  @override
  String get watchPartyChatOverlay => 'Mostra la chat sopra il video';

  @override
  String get watchPartyChatOverlaySubtitle =>
      'I nuovi messaggi compaiono per qualche secondo';

  @override
  String get watchPartyAlerts => 'Avvisi Watch Party';

  @override
  String get watchPartyAlertsSubtitle =>
      'Avvisami quando qualcuno su questo server ne avvia uno';

  @override
  String get watchPartyJoinWithCode => 'Unisciti con un codice';

  @override
  String get watchPartyOnThisServer => 'Su questo server';

  @override
  String watchPartyCountOnServer(int count) {
    return '$count su questo server';
  }

  @override
  String get watchPartyRoomsHint =>
      'Per unirti devi avere accesso al contenuto. Una stanza si chiude quando esce l\'ultima persona.';

  @override
  String get watchPartyRoomsEmpty =>
      'Qui compaiono i Watch Party che puoi guardare. Hai ricevuto un codice? Scegli Unisciti con un codice.';

  @override
  String get watchPartyPasteHint =>
      'Puoi incollare qui anche un link di invito. Sul telefono, il link apre Moonfin direttamente nel Watch Party.';

  @override
  String watchPartyWatchingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count spettatori',
      one: '$count spettatore',
    );
    return '$_temp0';
  }

  @override
  String watchPartyHostsParty(String name) {
    return 'Serata di $name';
  }

  @override
  String get watchPartyEveryoneControlsShort => 'Controllano tutti';

  @override
  String get watchPartyVotingNow => 'Si vota cosa guardare';

  @override
  String get watchPartyNeedsMoonbase =>
      'I Watch Party richiedono Moonbase su questo server';

  @override
  String get watchPartyNeedsMoonbaseHint =>
      'Chiedi a chi gestisce il server di installare il plugin Moonbase. Su Jellyfin, SyncPlay funziona anche senza.';

  @override
  String get watchPartyWrongPin => 'PIN non corretto. Riprova.';

  @override
  String get watchPartyTooManyTries => 'Troppi tentativi. Attendi un minuto.';

  @override
  String get watchPartyFull => 'Questo Watch Party è al completo.';

  @override
  String get watchPartyNoSuchCode => 'Nessuna stanza ha questo codice.';

  @override
  String get watchPartyNoAccess =>
      'Non hai accesso a quello che stanno guardando.';

  @override
  String get watchPartyRemoved =>
      'L\'organizzatore ti ha rimosso dal Watch Party.';

  @override
  String get watchPartyYours => 'Il tuo Watch Party';

  @override
  String get watchPartyInviteHint =>
      'Incollalo in qualsiasi chat. Apre una pagina su questo server con un pulsante Apri in Moonfin.';

  @override
  String get watchPartySendInvite => 'Invia l\'invito';

  @override
  String get watchPartyScanInvite =>
      'Scansiona con il telefono per ottenere il link di invito, poi invialo da lì. Oppure condividi semplicemente il codice.';

  @override
  String get watchPartyStartsTogether =>
      'La riproduzione aspetta il lettore di tutti, al massimo 10 secondi, poi parte il conto alla rovescia 3, 2, 1.';

  @override
  String get watchPartyStatusInSync => 'Sincronizzato';

  @override
  String get watchPartyStatusCatchingUp => 'In recupero';

  @override
  String get watchPartyStatusBuffering => 'Buffering';

  @override
  String get watchPartyStatusNotWatching => 'Non sta guardando';

  @override
  String get watchPartyStatusReady => 'Pronto';

  @override
  String get watchPartyStatusJoining => 'Sta entrando';

  @override
  String get watchPartyHost => 'Organizzatore';

  @override
  String watchPartyWaitingFor(String name) {
    return 'In attesa del lettore di $name';
  }

  @override
  String watchPartyWaitingForCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'In attesa di $count lettori',
      one: 'In attesa di $count lettore',
    );
    return '$_temp0';
  }

  @override
  String watchPartyStartingAnyway(int seconds) {
    return 'Avvio comunque tra $seconds s';
  }

  @override
  String get watchPartyStartingTogether => 'Si parte tutti insieme';

  @override
  String watchPartyToastPaused(String name) {
    return '$name ha messo in pausa';
  }

  @override
  String watchPartyToastResumed(String name) {
    return '$name ha ripreso la riproduzione';
  }

  @override
  String watchPartyToastSkipped(String name, String time) {
    return '$name ha spostato la riproduzione a $time';
  }

  @override
  String watchPartyToastJoined(String name) {
    return '$name si è unito';
  }

  @override
  String watchPartyToastLeft(String name) {
    return '$name è uscito';
  }

  @override
  String watchPartyToastSwitched(String name, String title) {
    return '$name ha scelto $title';
  }

  @override
  String get watchPartyToastYouAreHost => 'Ora sei tu l\'organizzatore';

  @override
  String watchPartyToastNewHost(String name) {
    return 'Ora l\'organizzatore è $name';
  }

  @override
  String get watchPartyToastEveryoneControls =>
      'Ora tutti possono controllare la riproduzione';

  @override
  String get watchPartyToastHostControls =>
      'Ora solo l\'organizzatore controlla la riproduzione';

  @override
  String get watchPartyOnlyHostControls =>
      'Solo l\'organizzatore può controllare la riproduzione.';

  @override
  String get watchPartyToastReconnecting => 'Riconnessione al Watch Party…';

  @override
  String get watchPartyToastReconnected => 'Di nuovo nel Watch Party';

  @override
  String watchPartyToastEnded(String name) {
    return '$name ha terminato il Watch Party';
  }

  @override
  String get watchPartyChat => 'Chat';

  @override
  String get watchPartySendToParty => 'Scrivi a tutti';

  @override
  String get watchPartyBackToClose => 'Indietro per chiudere';

  @override
  String get watchPartyType => 'Scrivi';

  @override
  String get watchPartyReplyHaha => 'Ahah';

  @override
  String get watchPartyReplyNoWay => 'Ma dai!';

  @override
  String get watchPartyReplyPausePlease => 'Pausa, per favore';

  @override
  String get watchPartyReplyBrb => 'Torno subito';

  @override
  String get watchPartyReplyAgain => 'Ancora!';

  @override
  String get watchPartyReactionLove => 'Adoro';

  @override
  String get watchPartyReactionHaha => 'Ahah';

  @override
  String get watchPartyReactionWow => 'Wow';

  @override
  String get watchPartyReactionSad => 'Triste';

  @override
  String get watchPartyReactionFire => 'Fuoco';

  @override
  String get watchPartyReactionPopcorn => 'Popcorn';

  @override
  String get watchPartyMakeHost => 'Nomina organizzatore';

  @override
  String get watchPartyEveryoneControls =>
      'Tutti possono controllare la riproduzione';

  @override
  String get watchPartyEveryoneControlsHint =>
      'Chiunque può riprodurre, mettere in pausa e saltare';

  @override
  String get watchPartyRoomPin => 'PIN stanza';

  @override
  String get watchPartyRoomPinHint => 'Chiedi un PIN prima che qualcuno entri';

  @override
  String get watchPartyPinDigits => 'Da 4 a 8 cifre';

  @override
  String get watchPartyLeave => 'Esci';

  @override
  String watchPartyLeaveHandsOver(String name) {
    return 'Esci · passa a $name';
  }

  @override
  String watchPartyStartedBy(String name) {
    return '$name ha avviato un Watch Party';
  }

  @override
  String watchPartyInLobbyCount(String title, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$title · $count in sala d\'attesa',
      one: '$title · $count in sala d\'attesa',
    );
    return '$_temp0';
  }

  @override
  String get watchPartyFirstOnHome =>
      'È il primo nella riga Watch Party della Home';

  @override
  String watchPartyAddServerQuestion(String address) {
    return 'Questo invito è per un server che non hai ancora aggiunto, $address. Aggiungilo e accedi per unirti.';
  }

  @override
  String get disk => 'Disco';

  @override
  String get openInBrowser => 'Apri nel Browser';

  @override
  String get achievementBadges => 'Achievement Badges';

  @override
  String get achievementBadgesSubtitle =>
      'Badge, gradi e missioni ottenuti con ciò che guardi';

  @override
  String get achievementsBadges => 'Badge';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked badge su $total';
  }

  @override
  String get achievementsUnlockToasts => 'Notifiche di Sblocco';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Mostra una notifica quando sblocchi un badge';

  @override
  String get achievementsUnlockedNotification => 'Obiettivo sbloccato';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count obiettivi sbloccati',
      one: '$count obiettivo sbloccato',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count altri';
  }

  @override
  String get achievementsQuests => 'Missioni';

  @override
  String achievementsQuestCount(int count) {
    return '$count completate';
  }

  @override
  String get achievementsLeaderboard => 'Classifica';

  @override
  String get achievementsLeaderboardSubtitle =>
      'Come ti confronti con gli altri utenti di questo server';

  @override
  String get achievementsRecap => 'Riepilogo';

  @override
  String get achievementsRecapSubtitle => 'Cosa hai guardato di recente';

  @override
  String get achievementsLibraryCompletion => 'Completamento librerie';

  @override
  String achievementsLibraryCount(int count) {
    return '$count librerie';
  }

  @override
  String achievementsScore(int score) {
    return '$score punti';
  }

  @override
  String get achievementsScoreLabel => 'Punteggio';

  @override
  String get achievementsTopRank => 'Grado massimo raggiunto';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$points punti per $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days giorni di fila';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Record: $days giorni';
  }

  @override
  String get achievementsShowcase => 'Vetrina';

  @override
  String get achievementsUnlocked => 'Sbloccati';

  @override
  String get achievementsLocked => 'Bloccati';

  @override
  String get achievementsNothingHere => 'Non c\'è ancora nulla qui.';

  @override
  String get achievementsHiddenBadge => 'Obiettivo nascosto';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Sbloccato il $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points pt';
  }

  @override
  String get achievementsDailyQuests => 'Giornaliere';

  @override
  String get achievementsWeeklyQuests => 'Settimanali';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Rigenera missioni giornaliere';

  @override
  String get achievementsRerollWeekly => 'Rigenera missioni settimanali';

  @override
  String get achievementsRerollOffer =>
      'Sostituisci questo gruppo con uno diverso';

  @override
  String get achievementsRerollSpentDaily =>
      'Usato oggi, torna disponibile a mezzanotte UTC';

  @override
  String get achievementsRerollSpentWeekly =>
      'Usato questa settimana, torna disponibile lunedì UTC';

  @override
  String get achievementsRerollConfirm => 'Rigenerare queste missioni?';

  @override
  String get achievementsRerollConfirmBody =>
      'Hai una rigenerazione giornaliera e una settimanale: confermando, la consumi.';

  @override
  String get achievementsRerollFailed =>
      'Impossibile rigenerare queste missioni.';

  @override
  String get achievementsSuggested => 'Elementi suggeriti da guardare';

  @override
  String get achievementsNoSuggestions =>
      'Nulla da suggerire per questo badge.';

  @override
  String get achievementsProgressLabel => 'Avanzamento';

  @override
  String get achievementsLoadout => 'Equipaggiamento';

  @override
  String get achievementsLoadoutSubtitle =>
      'Punteggio da spendere e potenziamenti che possiedi';

  @override
  String get achievementsAppearance => 'Aspetto';

  @override
  String get achievementsAppearanceSubtitle =>
      'L\'avatar e il titolo del tuo profilo';

  @override
  String get achievementsAvatars => 'Avatar';

  @override
  String get achievementsTitles => 'Titoli';

  @override
  String get achievementsEquipped => 'In uso';

  @override
  String get achievementsOwned => 'Posseduto';

  @override
  String achievementsEarnedAt(int score) {
    return 'Si ottiene con $score punti totali';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'Questo server non ha avatar o titoli da usare.';

  @override
  String get achievementsAppearanceFailed =>
      'Impossibile cambiare l\'aspetto del profilo.';

  @override
  String get achievementsPowerUps => 'Potenziamenti';

  @override
  String get achievementsStats => 'Statistiche';

  @override
  String get achievementsStatsSubtitle =>
      'I tuoi record e l\'andamento del server';

  @override
  String get achievementsStatsWatched => 'Visti';

  @override
  String get achievementsStatsBests => 'Record';

  @override
  String get achievementsStatsHabits => 'Abitudini';

  @override
  String get achievementsStatsVariety => 'Varietà';

  @override
  String get achievementsStatsServer => 'Questo server';

  @override
  String get achievementsStatsClock => 'Quando guardi';

  @override
  String get achievementsStatItems => 'Elementi visti';

  @override
  String get achievementsStatMovies => 'Film visti';

  @override
  String get achievementsStatSeries => 'Serie completate';

  @override
  String get achievementsStatHours => 'Ore di visione';

  @override
  String get achievementsStatDays => 'Giorni di visione';

  @override
  String get achievementsStatRewatches => 'Rivisti';

  @override
  String get achievementsStatBestWatchStreak => 'Serie di visione più lunga';

  @override
  String get achievementsStatBestLoginStreak => 'Serie di accessi più lunga';

  @override
  String get achievementsStatMostEpisodes => 'Massimo di episodi in un giorno';

  @override
  String get achievementsStatMostMovies => 'Massimo di film in un giorno';

  @override
  String get achievementsStatLongestItem => 'Elemento singolo più lungo';

  @override
  String get achievementsStatBestCombo => 'Combo migliore';

  @override
  String get achievementsStatLateNight => 'Sessioni a tarda notte';

  @override
  String get achievementsStatEarlyMorning => 'Sessioni al mattino presto';

  @override
  String get achievementsStatWeekend => 'Sessioni nel weekend';

  @override
  String get achievementsStatDaysSignedIn => 'Giorni di accesso';

  @override
  String get achievementsStatLibraries => 'Librerie visitate';

  @override
  String get achievementsStatGenres => 'Generi visti';

  @override
  String get achievementsStatDecades => 'Decenni visti';

  @override
  String get achievementsStatCountries => 'Paesi visti';

  @override
  String get achievementsStatLanguages => 'Lingue viste';

  @override
  String get achievementsStatUsers => 'Utenti';

  @override
  String get achievementsStatBadgesUnlocked => 'Badge sbloccati';

  @override
  String get achievementsStatScoreEarned => 'Punteggio ottenuto';

  @override
  String get achievementsStatCommonBadge => 'Badge più comune';

  @override
  String get achievementsActivity => 'Attività';

  @override
  String get achievementsActivitySubtitle =>
      'Cosa è stato sbloccato di recente sul server';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user ha sbloccato $badge';
  }

  @override
  String get achievementsShop => 'Negozio';

  @override
  String get achievementsShopSubtitle =>
      'Spendi il punteggio per altri potenziamenti';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Nulla in vendita al momento.';

  @override
  String get achievementsBuyConfirm => 'Acquistare?';

  @override
  String get achievementsBuyConfirmBody =>
      'Viene scalato direttamente dalla tua riserva di punti.';

  @override
  String get achievementsBuyFailed => 'Impossibile completare l\'acquisto.';

  @override
  String get achievementsScoreBank => 'Riserva di punti';

  @override
  String get achievementsBoost => 'Boost XP';

  @override
  String get achievementsBoostBody =>
      'Raddoppia il punteggio per un\'ora. Se lo usi di nuovo, l\'ora riparte da capo.';

  @override
  String get achievementsDoubleCredit => 'Doppio Credito';

  @override
  String get achievementsDoubleCreditBody =>
      'La prossima cosa che finisci conta doppio per i badge.';

  @override
  String get achievementsStreakFreeze => 'Blocco Serie';

  @override
  String get achievementsStreakFreezeBody =>
      'Copre un giorno saltato. Puoi tenerne solo uno.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count posseduti',
      one: '1 posseduto',
      zero: 'Nessuno posseduto',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Attivo ora';

  @override
  String get achievementsUsePowerUp => 'Usare questo potenziamento?';

  @override
  String get achievementsUsePowerUpBody => 'Viene consumato appena confermi.';

  @override
  String get achievementsPowerUpFailed =>
      'Impossibile usare questo potenziamento.';

  @override
  String get achievementsHours => 'Ore';

  @override
  String get achievementsStreak => 'Serie consecutiva';

  @override
  String get achievementsPeriodWeek => 'Settimana';

  @override
  String get achievementsPeriodMonth => 'Mese';

  @override
  String get achievementsPeriodYear => 'Anno';

  @override
  String achievementsDaysWatched(int count) {
    return '$count giorni di visione';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count badge ottenuti';
  }

  @override
  String get achievementsTopDirectors => 'Registi più visti';

  @override
  String get achievementsTopActors => 'Attori più visti';

  @override
  String get achievementsLoadFailed => 'Impossibile caricare i tuoi obiettivi.';

  @override
  String get friends => 'Amici';

  @override
  String get friendsSubtitle =>
      'Vedi chi è online e chatta con le persone di questo server';

  @override
  String get friendsShowButton => 'Mostra Pulsante Amici';

  @override
  String get friendsShowButtonSubtitle =>
      'Amici e chat dal plugin Achievement Badges';

  @override
  String get friendsMessages => 'Messaggi';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messaggi non letti',
      one: '1 messaggio non letto',
      zero: 'Nessun messaggio non letto',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Richieste di amicizia';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count attendono la tua risposta',
      one: '1 attende la tua risposta',
      zero: 'Nulla in attesa',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Aggiungi amici';

  @override
  String get friendsAddSubtitle => 'Trova persone su questo server';

  @override
  String get friendsPrivacy => 'Privacy';

  @override
  String get friendsPrivacySubtitle => 'Cosa possono vedere i tuoi amici';

  @override
  String get friendsOnline => 'Online';

  @override
  String get friendsOffline => 'Offline';

  @override
  String get friendsNone =>
      'Nessun amico ancora. Aggiungi persone di questo server per vederle qui.';

  @override
  String friendsWatching(String title) {
    return 'Sta guardando $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Ultima visione: $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Ultimo accesso $time';
  }

  @override
  String get friendsLoadFailed =>
      'Impossibile caricare i dati. Controlla la connessione e riprova.';

  @override
  String get friendsActionFailed =>
      'Non ha funzionato. Riprova tra un momento.';

  @override
  String get friendsIncoming => 'Ricevute';

  @override
  String get friendsOutgoing => 'Inviate da te';

  @override
  String get friendsNoRequests => 'Nessuna richiesta di amicizia.';

  @override
  String get friendsAccept => 'Accetta';

  @override
  String get friendsDecline => 'Rifiuta';

  @override
  String get friendsCancelRequest => 'Annulla richiesta';

  @override
  String friendsRequestFrom(String name) {
    return '$name vuole aggiungerti agli amici';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Ritirare la richiesta inviata a $name?';
  }

  @override
  String get friendsSearchHint => 'Cerca persone';

  @override
  String get friendsNoMatches => 'Nessuno corrisponde a quel nome.';

  @override
  String friendsRequestSent(String name) {
    return 'Richiesta inviata a $name';
  }

  @override
  String get friendsSendRequest => 'Aggiungi agli amici';

  @override
  String get friendsSendMessage => 'Invia messaggio';

  @override
  String friendsOpenItem(String title) {
    return 'Apri $title';
  }

  @override
  String get friendsRemove => 'Rimuovi amico';

  @override
  String friendsRemoveBody(String name) {
    return 'Rimuovere $name dai tuoi amici? Potrai aggiungerlo di nuovo in seguito.';
  }

  @override
  String get friendsBlock => 'Blocca';

  @override
  String get friendsUnblock => 'Sblocca';

  @override
  String friendsBlockBody(String name) {
    return 'Bloccare $name? Nessuno dei due potrà scrivere direttamente all\'altro. Le chat di gruppo in comune restano aperte.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Sbloccare $name?';
  }

  @override
  String get friendsBlocked => 'Utenti bloccati';

  @override
  String friendsProfileHidden(String name) {
    return '$name ha un profilo privato.';
  }

  @override
  String get friendsAppearOffline => 'Mostrati Offline';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Gli amici ti vedono sempre offline';

  @override
  String get friendsHideNowPlaying => 'Nascondi Cosa Sto Guardando';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Gli amici ti vedono ancora online, ma non cosa stai guardando';

  @override
  String get friendsHideLastWatched => 'Nascondi Ultimo Visto';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Gli amici non vedranno cosa hai guardato per ultimo mentre sei offline';

  @override
  String get friendsMessageNotifications => 'Notifiche Messaggi';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Mostra un banner quando un amico ti scrive';

  @override
  String get friendsMuteDuringPlayback => 'Silenzia Durante la Riproduzione';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'Nessun banner dei messaggi mentre è in riproduzione un video o un gioco';

  @override
  String get friendsSaveFailed => 'Impossibile salvare le impostazioni.';

  @override
  String get chatNew => 'Nuovo messaggio';

  @override
  String get chatNewSubtitle => 'Avvia una chat con un amico';

  @override
  String get chatNewGroup => 'Nuovo gruppo';

  @override
  String get chatNewGroupSubtitle => 'Chatta con più amici contemporaneamente';

  @override
  String get chatNone => 'Nessun messaggio ancora.';

  @override
  String get chatYou => 'Tu';

  @override
  String chatYouSaid(String text) {
    return 'Tu: $text';
  }

  @override
  String get chatPhoto => 'Foto';

  @override
  String get chatEmoji => 'Emoji';

  @override
  String get chatEmojiSearch => 'Cerca emoji';

  @override
  String get chatNoRecentEmoji => 'Nessuna emoji recente';

  @override
  String get chatViewPhoto => 'Visualizza foto';

  @override
  String get chatHint => 'Scrivi un messaggio';

  @override
  String get chatAttach => 'Invia una foto';

  @override
  String get chatEdited => 'modificato';

  @override
  String get chatSeen => 'Visto';

  @override
  String get chatSent => 'Inviato';

  @override
  String get chatEditing => 'Modifica del messaggio';

  @override
  String get chatMessageOptions => 'Opzioni messaggio';

  @override
  String get chatDeleteBody => 'Eliminare questo messaggio per tutti?';

  @override
  String get chatClear => 'Cancella conversazione';

  @override
  String get chatClearBody =>
      'Eliminare tutti i messaggi di questa chat per tutti i partecipanti?';

  @override
  String get chatGroupInfo => 'Info gruppo';

  @override
  String get chatGroupName => 'Nome del gruppo';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membri',
      one: '1 membro',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Proprietario';

  @override
  String get chatAdmin => 'Amministratore';

  @override
  String get chatMakeAdmin => 'Rendi amministratore';

  @override
  String get chatRemoveAdmin => 'Rimuovi amministratore';

  @override
  String get chatRemoveMember => 'Rimuovi dal gruppo';

  @override
  String get chatAddMember => 'Aggiungi persone';

  @override
  String get chatNobodyToAdd => 'Nessun altro da aggiungere.';

  @override
  String get chatLeave => 'Lascia il gruppo';

  @override
  String get chatLeaveBody =>
      'Lasciare questo gruppo? Per rientrare, qualcuno dovrà aggiungerti di nuovo.';

  @override
  String get chatCreate => 'Crea gruppo';

  @override
  String get chatPickMembers => 'Scegli almeno due amici';

  @override
  String chatNewMessageFrom(String name) {
    return 'Nuovo messaggio da $name';
  }

  @override
  String get chatImageTooLarge => 'L\'immagine supera gli 8 MB.';

  @override
  String get chatImageUnsupported =>
      'Si possono inviare solo immagini PNG, JPEG, GIF e WebP.';

  @override
  String get embeddedBrowserNotAvailable =>
      'Il browser integrato non è disponibile su questa piattaforma.';

  @override
  String get adminRestartServerConfirmation =>
      'Sei sicuro di voler riavviare il server?';

  @override
  String get adminShutdownServerConfirmation =>
      'Sei sicuro di voler spegnere il server? Dovrai riavviarlo manualmente.';

  @override
  String get internal => 'Interno';

  @override
  String get idle => 'Inattivo';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nessun utente trovato';

  @override
  String get adminNoUsersMatchSearch =>
      'Nessun utente corrisponde alla ricerca';

  @override
  String get adminNoDevicesFound => 'Nessun dispositivo trovato';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nessun dispositivo corrisponde ai filtri attuali';

  @override
  String get remoteAccess => 'Accesso Remoto';

  @override
  String get localOnly => 'Solo Locale';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Impossibile caricare le statistiche dei media';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Statistiche combinate di tutte le librerie multimediali.';

  @override
  String get analyticsTopArtists => 'Artisti Principali';

  @override
  String get analyticsTopAuthors => 'Autori Principali';

  @override
  String get analyticsTopContributors => 'Collaboratori Principali';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Librerie',
      one: '1 Libreria',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Nessun totale di media indicizzati disponibile per questa selezione.';

  @override
  String get analyticsLibraryDetails => 'Dettagli Libreria';

  @override
  String get analyticsLibraryBreakdown => 'Ripartizione per Libreria';

  @override
  String get analyticsNoLibrariesAvailable => 'Nessuna libreria disponibile.';

  @override
  String get analyticsLibraryShare =>
      'Ripartizione degli elementi per libreria';

  @override
  String get analyticsTopRating => 'Classificazione più comune';

  @override
  String get analyticsTypicalRuntime => 'Durata tipica';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent% degli elementi';
  }

  @override
  String get adminServerAdministrationTitle => 'Amministrazione Server';

  @override
  String get adminServerPathData => 'Dati';

  @override
  String get adminServerPathImageCache => 'Cache Immagini';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Registri';

  @override
  String get adminServerPathMetadata => 'Metadati';

  @override
  String get adminServerPathTranscode => 'Transcodifica';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Nessun percorso restituito da questo server.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% usato';
  }

  @override
  String get userActivity => 'Attività Utente';

  @override
  String get systemEvents => 'Eventi di Sistema';

  @override
  String get needsAttention => 'Richiede Attenzione';

  @override
  String get homeVideos => 'Video Personali';

  @override
  String get mixedContent => 'Contenuti Misti';

  @override
  String get homeVideosAndPhotos => 'Video Personali e Foto';

  @override
  String get mixedMoviesAndShows => 'Film e Serie Misti';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nessuna registrazione trovata';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Nessuna pagina immagine trovata nell\'archivio .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Renderer integrato non riuscito ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Renderer EPUB non riuscito ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'File locale mancante per il lettore: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status durante l\'apertura dei dati del libro da $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nessun endpoint di lettura disponibile per il libro';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Formato di archivio fumetti non supportato: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Il plugin di estrazione CBR non è disponibile su questa piattaforma.';

  @override
  String get failedToExtractCbrArchive =>
      'Impossibile estrarre l\'archivio .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'L\'estrazione CB7 non è disponibile su questa piattaforma.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Il plugin di estrazione CB7 non è disponibile su questa piattaforma.';

  @override
  String get loadingShuffle => 'Caricamento riproduzione casuale…';

  @override
  String get libraryShuffleLabel => 'CASUALE DALLA LIBRERIA';

  @override
  String get randomShuffleLabel => 'CASUALE';

  @override
  String get genresShuffleLabel => 'CASUALE PER GENERE';

  @override
  String get autoHdrSwitching => 'Cambio HDR Automatico';

  @override
  String get autoHdrSwitchingDescription =>
      'Attiva automaticamente l\'HDR per la riproduzione di video HDR e ripristina la modalità di visualizzazione all\'uscita.';

  @override
  String get whenFullscreen => 'A schermo intero';

  @override
  String get changeArtwork => 'Cambia Immagine';

  @override
  String get missing => 'Mancante';

  @override
  String get clearAllArtworkButton => 'Cancellare tutte le immagini?';

  @override
  String get clearAllArtworkWarning =>
      'Sei sicuro di voler cancellare tutte le immagini scaricate?';

  @override
  String get confirmClear => 'Conferma Cancellazione';

  @override
  String confirmClearMessage(String itemType) {
    return 'Sei sicuro di voler cancellare questo $itemType?';
  }

  @override
  String get uploadButton => 'Caricare?';

  @override
  String get resolutionLabel => 'Risoluzione: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Mostra solo le immagini nella lingua dell\'interfaccia';

  @override
  String get confirmClearAll => 'Conferma Cancella Tutto';

  @override
  String get imageUploadSuccess => 'Immagine caricata con successo!';

  @override
  String imageUploadFailed(String error) {
    return 'Impossibile caricare l\'immagine: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Impossibile impostare l\'immagine: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Impossibile eliminare l\'immagine: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Impossibile cancellare tutte le immagini: $error';
  }

  @override
  String get yes => 'Sì';

  @override
  String get posterCategory => 'Poster';

  @override
  String get backdropsCategory => 'Sfondi';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatura';

  @override
  String get artCategory => 'Illustrazione';

  @override
  String get discArtCategory => 'Immagine Disco';

  @override
  String get screenshotCategory => 'Screenshot';

  @override
  String get boxCoverCategory => 'Copertina';

  @override
  String get boxRearCoverCategory => 'Retro Copertina';

  @override
  String get menuArtCategory => 'Immagine Menu';

  @override
  String get confirmItemPoster => 'poster';

  @override
  String get confirmItemBackdrop => 'sfondo';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatura';

  @override
  String get confirmItemArt => 'illustrazione';

  @override
  String get confirmItemDiscArt => 'immagine disco';

  @override
  String get confirmItemScreenshot => 'screenshot';

  @override
  String get confirmItemBoxCover => 'copertina';

  @override
  String get confirmItemBoxRearCover => 'retro copertina';

  @override
  String get confirmItemMenuArt => 'immagine menu';

  @override
  String get resolutionAll => 'Tutte';

  @override
  String get resolutionHigh => 'Alta (1080p+)';

  @override
  String get resolutionMedium => 'Media (720p)';

  @override
  String get resolutionLow => 'Bassa (<720p)';

  @override
  String get sources => 'Fonti';

  @override
  String get audiobookChapters => 'Capitoli';

  @override
  String get audiobookBookmarks => 'Segnalibri';

  @override
  String get audiobookNotes => 'Note';

  @override
  String get audiobookQueue => 'Coda';

  @override
  String get audiobookTimeline => 'Timeline';

  @override
  String get audiobookTimelineEmpty => 'La timeline è vuota';

  @override
  String get audiobookFocusedTimeline => 'Timeline Focalizzata';

  @override
  String get audiobookFullTimeline => 'Timeline Completa';

  @override
  String get audiobookExportBookmarks => 'Esporta Segnalibri';

  @override
  String get audiobookExportNotes => 'Esporta Note';

  @override
  String get audiobookExportAll => 'Esporta Tutto';

  @override
  String audiobookExportSuccess(String path) {
    return 'Esportato in $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Esportazione non riuscita: $error';
  }

  @override
  String get audiobookLyrics => 'Testi';

  @override
  String get audiobookAddBookmark => 'Aggiungi segnalibro';

  @override
  String get audiobookAddNote => 'Aggiungi nota';

  @override
  String get audiobookEditNote => 'Modifica nota';

  @override
  String get audiobookNoteHint => 'Scrivi una nota per questo momento';

  @override
  String get audiobookSleepTimer => 'Timer di spegnimento';

  @override
  String get audiobookSleepOff => 'Disattivato';

  @override
  String get audiobookSleepEndOfChapter => 'Fine del capitolo';

  @override
  String get audiobookSleepCustom => 'Personalizzato';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining rimanenti';
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
  String get audiobookPlaybackSpeed => 'Velocità di riproduzione';

  @override
  String get audiobookRemainingTime => 'Rimanente';

  @override
  String get audiobookElapsedTime => 'Trascorso';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Indietro ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Avanti ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Capitolo precedente';

  @override
  String get audiobookNextChapter => 'Capitolo successivo';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Capitolo $current di $total';
  }

  @override
  String get audiobookNoChapters => 'Nessun capitolo';

  @override
  String get audiobookNoBookmarks => 'Nessun segnalibro';

  @override
  String get audiobookNoNotes => 'Nessuna nota';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Segnalibro aggiunto a $position';
  }

  @override
  String get audiobookSpeedReset => 'Reimposta a 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Salva';

  @override
  String get audiobookCancel => 'Annulla';

  @override
  String get audiobookDelete => 'Elimina';

  @override
  String get subtitlePreferencesDescription =>
      'Modifica le modalità dei sottotitoli, le lingue predefinite, l\'aspetto e le opzioni di rendering.';

  @override
  String get subtitleRendering => 'Rendering Sottotitoli';

  @override
  String get displayOptions => 'Opzioni di Visualizzazione';

  @override
  String get releaseDateAscending => 'Data di Uscita (Crescente)';

  @override
  String get releaseDateDescending => 'Data di Uscita (Decrescente)';

  @override
  String get groupContributions => 'Raggruppa Contributi';

  @override
  String get groupMultipleRoles => 'Raggruppa più ruoli';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Avviso di Accesso in Scrittura alla Libreria';

  @override
  String get libraryWriteAccessHowToFix => 'Come risolvere:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Concedi i permessi di scrittura all\'utente del servizio Jellyfin (es. jellyfin o PUID/PGID di Docker) sulle cartelle della tua libreria multimediale sul server.\n\n2. Oppure, vai nella Dashboard di Jellyfin -> Librerie, modifica questa libreria e disattiva \'Salva le immagini nelle cartelle dei media\' per archiviare le immagini nel database interno di Jellyfin.';

  @override
  String get dismiss => 'Ignora';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'La tua libreria \"$libraryName\" è configurata per salvare le immagini direttamente nelle cartelle dei media (\'Salva le immagini nelle cartelle dei media\' è attivo). Tuttavia, Jellyfin ha verificato l\'accesso in scrittura e non ha il permesso di scrivere file in questa directory:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Sembra che Jellyfin non sia riuscito ad aggiornare l\'immagine. La tua libreria è configurata per salvare le immagini direttamente nelle cartelle dei media (\'Salva le immagini nelle cartelle dei media\' è attivo). Questo errore si verifica in genere quando il processo del server Jellyfin non ha il permesso di scrivere file nelle tue directory multimediali.';

  @override
  String get replay => 'Riproduci di Nuovo';

  @override
  String get fileInformation => 'Informazioni File';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Dimensione: $size  •  Formato: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Data di Aggiunta: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Mostra Tutte le ($count) Tracce Audio';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Mostra Tutte le ($count) Tracce Sottotitoli';
  }

  @override
  String get checkingDirectPlay =>
      'Verifica della capacità di Riproduzione Diretta…';

  @override
  String get directPlayCapabilityLabel => 'Capacità di Riproduzione Diretta: ';

  @override
  String get forced => 'Forzato';

  @override
  String get transcodeContainerNotSupported =>
      'Il formato del contenitore non è supportato dal lettore.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Il codec video non è supportato.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Il codec audio non è supportato.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Il formato dei sottotitoli non è supportato (richiede l\'incisione).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Il profilo audio non è supportato.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Il profilo video non è supportato.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Il livello video non è supportato.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'La risoluzione video non è supportata da questo dispositivo.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'La profondità di bit del video non è supportata.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'Il frame rate del video non è supportato.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Il bitrate del file supera il limite di streaming del lettore.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Il bitrate video supera il limite di streaming.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Il bitrate audio supera il limite di streaming.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Il numero di canali audio non è supportato.';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Il codec audio ($codec) non è supportato direttamente.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Suggerimento: se il tuo ricevitore audio o la soundbar supporta $codec, abilita Passthrough Audio nelle impostazioni Audio.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Il numero di canali audio (${channels}ch) supera il limite del lettore.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Suggerimento: regola \'Numero massimo di canali audio\' o il downmix multicanale nelle impostazioni Audio.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'I sottotitoli ASS/SSA richiedono la transcodifica perché la riproduzione diretta è disattivata.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Suggerimento: abilita \'Riproduzione Diretta ASS/SSA\' nelle impostazioni di Riproduzione per riprodurre direttamente senza transcodifica.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'I sottotitoli PGS richiedono la transcodifica perché la riproduzione diretta è disattivata.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Suggerimento: abilita \'Riproduzione Diretta PGS\' nelle impostazioni di Riproduzione per riprodurre direttamente senza transcodifica.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Il formato dei sottotitoli ($codec) non è supportato direttamente e richiede l\'incisione.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'Il bitrate del file ($fileBitrate) supera il limite di streaming configurato ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Suggerimento: aumenta \'Bitrate Massimo\' nelle impostazioni di Riproduzione per consentire lo streaming diretto.';

  @override
  String get transcodeResolutionHint =>
      'Suggerimento: aumenta \'Risoluzione Massima\' nelle impostazioni di Riproduzione per consentire lo streaming diretto.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'La gamma dinamica del video (es. Dolby Vision / HDR) non è supportata da questo schermo.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'La riproduzione diretta del livello di miglioramento Dolby Vision Profilo 7 è disattivata.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Suggerimento: abilita \'Dolby Vision Profilo 7 Riproduzione diretta\' nelle impostazioni di Riproduzione se il tuo schermo lo supporta.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'In base alle impostazioni dell\'utente, per il fallback Dolby Vision è preferita la transcodifica.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Suggerimento: imposta \'Fallback Dolby Vision\' su \'Riproduci come HDR10\' nelle impostazioni di Riproduzione per evitare la transcodifica.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Lo schermo collegato non dichiara il supporto per HDR o Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Lo schermo collegato non supporta HDR10, necessario per il fallback Dolby Vision.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'La frequenza di campionamento audio non è supportata.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'La profondità di bit audio non è supportata.';

  @override
  String get transcodeRefFramesNotSupported =>
      'I fotogrammi di riferimento del video superano i limiti del lettore.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Il video anamorfico non è supportato.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Il video interlacciato non è supportato.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Lo stream audio secondario richiede la transcodifica.';

  @override
  String get transcodeDirectPlayError =>
      'La riproduzione diretta non è supportata per questo formato.';

  @override
  String get sortServerOrder => 'Ordine del Server';

  @override
  String get sortAlphabetical => 'Alfabetico';

  @override
  String get sortReleaseAscending => 'Ordine di Uscita (Crescente)';

  @override
  String get sortReleaseDescending => 'Ordine di Uscita (Decrescente)';

  @override
  String get sortCustomDragDrop => 'Personalizzato (Trascina e Rilascia)';

  @override
  String sortCurrent(String option) {
    return 'Ordine: $option';
  }

  @override
  String get playlistSortOptions => 'Opzioni Ordinamento Playlist';

  @override
  String get resetSort => 'Ripristina Ordinamento';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rivedi S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rivedi Playlist';

  @override
  String get noSubtitlesFound => 'Nessun sottotitolo trovato.';

  @override
  String get adminControls => 'Controlli Amministratore';

  @override
  String get impellerRendering => 'Motore di rendering (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller è il moderno renderer GPU di Flutter, per animazioni più fluide e meno scatti. Su alcuni TV box e GPU datate può causare glitch o video nero; in tal caso disattivalo. Automatico sceglie l\'impostazione migliore per il tuo dispositivo. Riavvia Moonfin per applicare la modifica.';

  @override
  String get impellerAuto => 'Automatico';

  @override
  String get impellerOn => 'Attivo';

  @override
  String get impellerOff => 'Disattivo';

  @override
  String get impellerRestartTitle => 'Riavvio necessario';

  @override
  String get impellerRestartMessage =>
      'Moonfin deve riavviarsi per cambiare il motore di rendering. Chiudi l\'app ora, poi riaprila per applicare la modifica.';

  @override
  String get impellerCloseNow => 'Chiudi l\'app ora';

  @override
  String get adminRefreshLibrary => 'Aggiorna Libreria';

  @override
  String get adminRefreshAllLibraries => 'Aggiorna Tutte le Librerie';

  @override
  String get adminRepoSortDateOldest =>
      'Data di Aggiunta (Prima i Meno Recenti)';

  @override
  String get adminRepoSortDateNewest =>
      'Data di Aggiunta (Prima i Più Recenti)';

  @override
  String get adminRepoSortNameAsc => 'Alfabetico (dalla A alla Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabetico (dalla Z alla A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Caricamento delle statistiche del server... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Come la sorgente';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Film';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 Serie TV';

  @override
  String get imdbMostPopularMovies => 'Film Più Popolari su IMDb';

  @override
  String get imdbMostPopularTvShows => 'Serie TV Più Popolari su IMDb';

  @override
  String get imdbLowestRatedMovies => 'Film con Voto Più Basso su IMDb';

  @override
  String get imdbTopEnglishMovies => 'Migliori Film in Inglese su IMDb';

  @override
  String get addToWatchlist => 'Aggiungi alla Watchlist';

  @override
  String get removeFromWatchlist => 'Rimuovi dalla Watchlist';

  @override
  String get watchlistUpdateFailed => 'Impossibile aggiornare la watchlist';

  @override
  String get adminSearchParameters => 'Parametri di Ricerca';

  @override
  String get adminCurrentMetadata => 'Metadati Attuali';

  @override
  String get adminLabelYear => 'Anno';

  @override
  String get adminReplaceImages => 'Sostituisci le immagini esistenti';

  @override
  String get adminBackToSearch => 'Torna ai criteri di ricerca';

  @override
  String get grouping => 'Raggruppamento';

  @override
  String get groupByType => 'Raggruppa per Tipo';

  @override
  String get playlistTypes => 'Tipi di Playlist';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Video Musicale';

  @override
  String get playlistTypeAudio => 'Audio (Musica)';

  @override
  String get playlistTypeAudiobook => 'Audiolibro';

  @override
  String get playlistTypeBook => 'Libro';

  @override
  String get playlistTypePhoto => 'Foto';

  @override
  String get playlistTypeMixed => 'Miste';

  @override
  String get videoPlaylistsSection => 'Playlist Video';

  @override
  String get musicVideoPlaylistsSection => 'Playlist di Video Musicali';

  @override
  String get audioPlaylistsSection => 'Playlist Audio';

  @override
  String get audiobookPlaylistsSection => 'Playlist Audiolibri';

  @override
  String get bookPlaylistsSection => 'Playlist Libri';

  @override
  String get photoPlaylistsSection => 'Playlist Foto';

  @override
  String get mixedPlaylistsSection => 'Playlist Miste';

  @override
  String get currentTime => 'Ora Attuale';

  @override
  String get playbackTimeDisplay => 'Orari sulla Barra di Avanzamento';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Scegli quali indicazioni di tempo mostrare attorno alla barra di avanzamento.';

  @override
  String get playbackTimeTotal => 'Durata totale';

  @override
  String get playbackTimeRemaining => 'Tempo rimanente';

  @override
  String get playbackTimeEndsAt => 'Ora di fine';

  @override
  String get playbackTimeElapsed => 'Tempo trascorso';

  @override
  String get playbackTimeVideoSection => 'Lettore Video';

  @override
  String get playbackTimeMusicSection => 'Lettore Musicale';

  @override
  String get playbackTimeSlotDescription =>
      'Scegli cosa mostrare qui, oppure nascondilo.';

  @override
  String get playbackTimeAboveBarLeft => 'Sopra la barra, a sinistra';

  @override
  String get playbackTimeAboveBarCenter => 'Sopra la barra, al centro';

  @override
  String get playbackTimeAboveBarRight => 'Sopra la barra, a destra';

  @override
  String get playbackTimeBelowBarLeft => 'Sotto la barra, a sinistra';

  @override
  String get playbackTimeBelowBarCenter => 'Sotto la barra, al centro';

  @override
  String get playbackTimeBelowBarRight => 'Sotto la barra, a destra';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Scegli cosa mostrare a destra della barra di avanzamento della musica.';

  @override
  String get groupByTitle => 'Raggruppa per';

  @override
  String get groupByDecade => 'Decennio (Anno)';

  @override
  String get groupByParentalRating => 'Classificazione per Età';

  @override
  String get groupByStudio => 'Studio';

  @override
  String get showAlphabeticalFilters => 'Mostra Alfabeto';

  @override
  String get libraryFolderView => 'Vista Cartelle';

  @override
  String get personalRatingStyle => 'Stile della valutazione personale';

  @override
  String get personalRatingThumbs => 'Mi piace / Non mi piace';

  @override
  String get personalRatingStars => '5 stelle';

  @override
  String get personalRatingNumeric => 'Punteggio numerico su 10';

  @override
  String get rate => 'Valuta';

  @override
  String get like => 'Mi piace';

  @override
  String get dislike => 'Non mi piace';

  @override
  String get personalRatingClear => 'Rimuovi valutazione';

  @override
  String get personalRatingRated => 'Valutato';

  @override
  String get personalRatingMine => 'La Mia Valutazione';

  @override
  String get personalRatingSaveFailed => 'Impossibile salvare la valutazione';

  @override
  String get increase => 'Aumenta';

  @override
  String get decrease => 'Diminuisci';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'In Corso';

  @override
  String get filterUnreleased => 'Non Ancora Uscito';

  @override
  String get filterTrailers => 'Trailer';

  @override
  String get filterExtras => 'Contenuti Extra';

  @override
  String get filterThemeSongs => 'Sigle Musicali';

  @override
  String get filterThemeVideos => 'Video Sigla';

  @override
  String get source => 'Fonte';

  @override
  String get years => 'Anni';

  @override
  String get audioLanguage => 'Lingua Audio';

  @override
  String get subtitleLanguage => 'Lingua Sottotitoli';

  @override
  String get clearFilters => 'Cancella Filtri';

  @override
  String get seerrShortcutsRow => 'Sfoglia Seerr';

  @override
  String get seerrReleased => 'Uscita';

  @override
  String get seerrMinRating => 'Valutazione Minima';

  @override
  String get seerrMinVotes => 'Voti Minimi';

  @override
  String get seerrOriginalLanguage => 'Lingua Originale';

  @override
  String get seerrRuntime => 'Durata';

  @override
  String get subtitleHdrSeparate => 'Stile HDR Separato';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'Il bianco è molto più luminoso in HDR che in SDR, quindi uno stile più tenue qui evita l\'abbagliamento';

  @override
  String get subtitleBold => 'Testo in Grassetto';

  @override
  String get subtitleStrokeWidth => 'Spessore Contorno Testo';

  @override
  String get subtitleFont => 'Carattere';

  @override
  String get subtitleFontDescription =>
      'I caratteri vengono scaricati da Google Fonts la prima volta che li scegli';

  @override
  String subtitleFontDownloadFailed(String font) {
    return 'Impossibile scaricare $font';
  }

  @override
  String get subtitleShadow => 'Ombra Testo';

  @override
  String get subtitleShadowIntensity => 'Intensità Ombra';

  @override
  String get subtitleShadowOffset => 'Distanza Ombra';

  @override
  String get subtitleShadowBlur => 'Sfocatura Ombra';

  @override
  String get scrollSensitivity => 'Sensibilità Scorrimento';

  @override
  String get scrollSensitivitySubtitle =>
      'Quanto scorre un singolo scatto della rotella del mouse';

  @override
  String get mediaDetailsAndSpoilers => 'Dettagli Media e Spoiler';

  @override
  String get openTrailersExternally => 'Apri i Trailer in un\'App Esterna';

  @override
  String get openTrailersExternallySubtitle =>
      'I trailer si aprono nell\'app YouTube o nel browser invece che nel player integrato';

  @override
  String get hideDetailsMediaDescription => 'Nascondi descrizione media';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Nasconde il testo descrittivo del film o dell\'episodio.';

  @override
  String get detailUseSeriesThumbnails => 'Usa miniature della serie';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Sostituisce tutte le miniature nella pagina dettagli Classica con la miniatura della serie';

  @override
  String get hideHomeMediaDescription => 'Nascondi descrizione media';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Nasconde il testo descrittivo del film o dell\'episodio.';

  @override
  String get hideHomeWatchProgress => 'Nascondi Avanzamento Visione';

  @override
  String get hideHomeWatchProgressSubtitle =>
      'Nasconde la barra di avanzamento sui poster che hai iniziato a guardare.';

  @override
  String get hideHomeUnwatchedCount => 'Nascondi Numero Non Visti';

  @override
  String get hideHomeUnwatchedCountSubtitle =>
      'Nasconde il badge che indica quanti episodi restano da guardare.';

  @override
  String get continueWatchingAndNextUpHeader =>
      'Continua a Guardare e Prossimo';

  @override
  String get setupSkip => 'Salta configurazione';

  @override
  String get setupNavbarQuestion => 'Dove deve trovarsi la navigazione?';

  @override
  String get setupMediaBarQuestion =>
      'Come deve apparire la parte superiore della tua Home?';

  @override
  String get setupHomeRowsQuestion => 'Come devono apparire le tue righe?';

  @override
  String get setupDetailQuestion =>
      'Come deve apparire un film o una serie quando lo apri?';

  @override
  String get setupTourQuestion =>
      'Tutto pronto. Ecco cos\'altro c\'è qui dentro.';

  @override
  String get setupPlaybackLanguages => 'Lingue di riproduzione';

  @override
  String get setupOptional => 'Facoltativo';

  @override
  String get setupStyleClassic => 'Classico';

  @override
  String get setupStyleModern => 'Moderno';

  @override
  String get setupRowsClassicHint =>
      'Compatto. Più righe a schermo contemporaneamente.';

  @override
  String get setupRowsModernHint => 'Schede più grandi con i titoli sotto.';

  @override
  String get setupRowsCarouselHint =>
      'Posters with a large details panel underneath.';

  @override
  String get setupDetailClassicHint => 'Tutto centrato in un unico blocco.';

  @override
  String get setupDetailModernHint =>
      'Cinematico, con schede per cast e contenuti extra.';

  @override
  String get setupStyleSpotlight => 'In primo piano';

  @override
  String get setupDetailSpotlightHint =>
      'Immagine in primo piano, con schede a comparsa per cast e contenuti extra.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'A schermo intero, con sezioni in sequenza invece delle schede.';

  @override
  String get setupStyleMinimalist => 'Minimalista';

  @override
  String get setupDetailMinimalistHint =>
      'Immagini, un pulsante di riproduzione e gli episodi.';

  @override
  String get setupStyleStage => 'Palco';

  @override
  String get setupDetailStageHint =>
      'Il poster in primo piano, con il pulsante Riproduci sotto e i dettagli accanto.';

  @override
  String get setupStylePremiere => 'Premiere';

  @override
  String get setupDetailPremiereHint =>
      'Il titolo centrato su uno sfondo a schermo intero, con tutto il resto più in basso nella pagina.';

  @override
  String get setupStyleQuickLook => 'Anteprima rapida';

  @override
  String get setupDetailQuickLookHint =>
      'Un pannello sopra la schermata in cui eri, con Riproduci e le informazioni essenziali; la pagina completa è a un tasto di distanza.';

  @override
  String get setupStyleFrost => 'Brina';

  @override
  String get setupDetailFrostHint =>
      'Il titolo in una finestra di vetro sopra l\'immagine sfocata, con le schede sotto i pulsanti.';

  @override
  String get setupNavbarStyleQuestion =>
      'Come deve apparire la barra inferiore?';

  @override
  String get setupNavbarStyleDockHint =>
      'Una pillola fluttuante con le etichette sotto ogni scheda.';

  @override
  String get setupNavbarStyleSplitHint =>
      'La ricerca ha un pulsante tutto suo e la barra si riduce mentre scorri.';

  @override
  String get setupNavbarStyleStripHint =>
      'Una barra a tutta larghezza lungo il bordo inferiore.';

  @override
  String get setupPickALook => 'Scegli uno stile';

  @override
  String get setupTourMoreHeader =>
      'C\'è altro ad aspettarti nelle Impostazioni';

  @override
  String get setupTourBulletRequests => 'Richieste Seerr';

  @override
  String get setupTourBulletSyncPlay => 'Serate di visione SyncPlay';

  @override
  String get setupTourBulletThemes => 'Temi personalizzati';

  @override
  String get setupTourBulletDownloads => 'Download offline';

  @override
  String get setupTourBulletMore => 'E molto altro ancora';

  @override
  String setupStepOf(int current, int total) {
    return 'Passaggio $current di $total';
  }

  @override
  String get setupCurrent => 'Attuale';

  @override
  String get setupMoonbaseTitle => 'Aggiungi Moonbase al tuo server';

  @override
  String get setupMoonbaseHint =>
      'Un plugin gratuito per il server che sblocca altre funzioni di Moonfin';

  @override
  String get setupMoonbaseIntro =>
      'Moonbase è gratuito e funziona sul tuo server. Con Moonbase, Moonfin ottiene:';

  @override
  String get setupMoonbaseAskAdmin =>
      'Solo un amministratore del server può installarlo. Inviagli questo link.';

  @override
  String get setupMoonbaseManualSteps =>
      'L\'installazione richiede alcuni passaggi sul tuo server. Li trovi tutti a questo link.';

  @override
  String get setupMoonbaseInstalling => 'Installazione di Moonbase in corso…';

  @override
  String get setupMoonbaseInstalled =>
      'Moonbase è installato. Si attiva al riavvio del server, che interrompe tutto ciò che è in riproduzione in questo momento.';

  @override
  String get setupMoonbaseRestarting =>
      'Il server si sta riavviando. Moonbase si attiva appena torna disponibile.';

  @override
  String get moonbaseFeatureSync =>
      'Impostazioni sincronizzate tra i tuoi dispositivi';

  @override
  String get moonbaseFeatureRatings =>
      'Valutazioni aggiuntive e recensioni TMDB';

  @override
  String get moonbaseFeatureRows =>
      'Righe personalizzate dalle tue liste preferite';

  @override
  String get moonbaseFeatureGames =>
      'Giochi retrò con salvataggi sincronizzati';

  @override
  String get moonbaseFeatureCalendar => 'Un calendario delle uscite in arrivo';

  @override
  String get moonbaseFeatureCollections =>
      'Un ordine personalizzato per ogni collezione';

  @override
  String get moonbaseFeatureMessages =>
      'Messaggi dall\'amministratore del server';

  @override
  String setupMoonbaseInstallFailed(String error) {
    return 'Impossibile installare Moonbase. $error';
  }

  @override
  String get setupTvHint =>
      'Su e Giù per l\'anteprima · OK per scegliere · Indietro due volte per saltare';

  @override
  String get setupNavbarTopHint =>
      'Schede lungo la parte superiore dello schermo.';

  @override
  String get setupNavbarLeftHint =>
      'Una sottile colonna di icone sul lato sinistro.';

  @override
  String get setupNavbarBottomHint =>
      'Schede lungo il bordo inferiore, a portata di pollice.';

  @override
  String get setupMediaBarMoonfinHint =>
      'Immagini grandi con titolo, dettagli e panoramica sovrapposti.';

  @override
  String get setupMediaBarMakdHint =>
      'Immagini grandi dominate dal logo del titolo in grande.';

  @override
  String get setupMediaBarBookshelfHint =>
      'Titoli disposti come dorsi di libri, con quello in evidenza girato a mostrare la copertina.';

  @override
  String get setupMediaBarGalleryHint =>
      'Il titolo in evidenza aperto, con i successivi allineati accanto.';

  @override
  String get setupMediaBarBannerHint =>
      'Un banner più basso sopra le tue righe, così ne entrano di più sullo schermo.';

  @override
  String get setupMediaBarAyaHint =>
      'Prima le immagini, in un pannello incorniciato, con le tue righe subito sotto.';

  @override
  String get setupMediaBarOffHint =>
      'Nessuna area in evidenza. La Home si apre direttamente sulle tue righe.';

  @override
  String get runSetupAgain => 'Esegui di nuovo la configurazione';

  @override
  String get serverMessages => 'Messaggi';

  @override
  String get serverMessagesEmpty => 'Nessun messaggio dal tuo server ancora';

  @override
  String get serverMessagesMarkAllRead => 'Segna tutti come letti';

  @override
  String get serverMessagesShowButton => 'Mostra Pulsante Messaggi';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Aggiunge al menu un pulsante per i messaggi inviati dall\'amministratore del server';

  @override
  String get showBookDiscoverTab => 'Mostra Scopri nelle Librerie di Libri';

  @override
  String get showBookDiscoverTabDescription =>
      'Sfoglia titoli da Open Library e LibriVox nelle tue librerie di libri e audiolibri';

  @override
  String get bookFoldersAsSeries =>
      'Considera le cartelle dei libri come serie';

  @override
  String get bookFoldersAsSeriesDescription =>
      'Considera le cartelle che contengono libri come serie invece di basarsi sui metadati dei singoli libri';

  @override
  String get autoDownloadNewEpisodes =>
      'Scarica automaticamente i nuovi episodi';

  @override
  String get autoDownloadStop => 'Interrompi download automatico';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Scarica i nuovi episodi, fino a $count non visti alla volta',
      one: 'Scarica i nuovi episodi, fino a 1 non visto alla volta',
      zero: 'Scarica ogni nuovo episodio',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'Attivo • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Le qualità transcodificate si scaricano solo mentre Moonfin è aperto. La qualità originale si scarica anche in background.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'I download transcodificati non possono riprendere dopo un\'interruzione e ricominciano dall\'inizio. La qualità originale può riprendere.';

  @override
  String get autoDownloadForegroundOnly =>
      'Scarica solo mentre Moonfin è aperto';

  @override
  String get autoDownloadQualityTitle => 'Qualità download automatico';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Download automatici abilitati per $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Download automatico interrotto per $title';
  }

  @override
  String get smartDownloadsSection => 'Download intelligenti';

  @override
  String get smartDownloadsEnable => 'Scarica Episodi Successivi';

  @override
  String get smartDownloadsEnableDescription =>
      'Quando finisci un episodio su qualsiasi dispositivo, Moonfin scarica i successivi. Gli episodi scaricati in questo modo vengono eliminati una volta visti.';

  @override
  String get smartDownloadsKeepReady => 'Episodi da Tenere Scaricati';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tiene scaricati i prossimi $count episodi',
      one: 'Tiene scaricato il prossimo episodio',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Gli episodi già scaricati restano sul tuo dispositivo. Il nuovo numero vale per i download futuri.';

  @override
  String get autoDownloadSection => 'Download automatici';

  @override
  String get autoDownloadEnable => 'Abilita Download Automatici';

  @override
  String get autoDownloadEnableSubtitle =>
      'Scarica i nuovi episodi delle serie che segui. Gli episodi esistenti si possono ancora scaricare manualmente.';

  @override
  String get autoDownloadKeepUnwatched => 'Episodi Non Visti da Tenere';

  @override
  String get autoDownloadKeepAll => 'Tutti';

  @override
  String get autoDownloadDelete => 'Elimina Episodi Scaricati';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'Quando rimuovere gli episodi scaricati per le serie che segui, dopo averli guardati';

  @override
  String get removeWatchedDownloads => 'Rimuovi Download Visti';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'Quando rimuovere episodi e film che hai scaricato tu. Vengono rimossi solo quelli che guardi dopo aver attivato questa opzione';

  @override
  String get removeWatchedAsk => 'Chiedimelo';

  @override
  String get deleteFinishedDownloadTitle => 'Eliminare questo download?';

  @override
  String deleteFinishedDownloadMessage(String title) {
    return 'Hai finito $title. Elimina il download per liberare spazio, oppure tienilo e non ti verrà più chiesto.';
  }

  @override
  String get notNow => 'Non Ora';

  @override
  String get keepDownloaded => 'Mantieni Scaricato';

  @override
  String get keepDownloadedSubtitle =>
      'Non rimuoverlo mai automaticamente dopo la visione';

  @override
  String get autoDownloadDeleteNever => 'Mai';

  @override
  String get autoDownloadDeleteImmediately => 'Subito dopo la visione';

  @override
  String get autoDownloadDeleteAfterDay => '1 giorno dopo la visione';

  @override
  String get autoDownloadDeleteAfterWeek => '1 settimana dopo la visione';

  @override
  String get autoDownloadBackgroundRefresh => 'Controlla in Background';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Consenti al sistema di controllare periodicamente i nuovi episodi mentre Moonfin è chiuso';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      '\'Aggiorna app in background\' è disattivato per Moonfin. Attivalo nelle Impostazioni di iOS.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'L\'utilizzo in background è limitato per Moonfin nelle Impostazioni di Android.';

  @override
  String get autoDownloadCheckNow => 'Controlla Ora';

  @override
  String get autoDownloadChecking => 'Controllo in corso…';

  @override
  String get autoDownloadNeverChecked => 'Non ancora controllato';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued episodi in coda',
      one: '1 episodio in coda',
      zero: 'nulla di nuovo',
    );
    return 'Ultimo controllo $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Ultimo controllo $when non riuscito: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Serie seguite';

  @override
  String get autoDownloadNoSubscriptions =>
      'Apri una serie e scegli \"Scarica automaticamente i nuovi episodi\" dal suo menu di download';

  @override
  String get autoDownloadRemove => 'Smetti di seguire';

  @override
  String get autoDownloadStorageFull => 'Spazio di archiviazione insufficiente';

  @override
  String get autoDownloadWaitingForWifi => 'In attesa del WiFi';

  @override
  String get downloadNotificationRunning => 'Download in corso';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Download in corso ($done/$total)';
  }

  @override
  String downloadNotificationProgress(String name, int percent) {
    return '$name — $percent%';
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
    return '$name…';
  }

  @override
  String downloadNotificationCompleteTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Download completati',
      one: 'Download completato',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name salvato per l\'uso offline';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi salvati per l\'uso offline',
      one: '1 elemento salvato per l\'uso offline',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodi',
      one: '1 episodio',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Download non riuscito';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Messaggio remoto';

  @override
  String get serverMessagesNotificationReceived => 'Messaggio ricevuto';

  @override
  String get downloadStorageLimitReached =>
      'Limite di spazio raggiunto. Libera spazio o aumenta il limite.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Spazio insufficiente: servono $needed, liberi $free';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Spazio di archiviazione insufficiente per nuovi episodi';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodi sono in attesa di spazio.',
      one: '$name richiede $size.',
    );
    return '$_temp0 Libera spazio o aumenta il limite di download.';
  }

  @override
  String get pageTransitions => 'Transizioni Pagina';

  @override
  String get pageTransitionsSubtitle =>
      'Regola la durata della dissolvenza nel passaggio tra le pagine';

  @override
  String get navigationSpeed => 'Velocità Navigazione';

  @override
  String get navigationSpeedSubtitle =>
      'Regola la velocità con cui l\'indicatore del focus si sposta tra elementi e righe';

  @override
  String get modernCardsTransitionSpeed =>
      'Velocità Transizione Schede Moderne';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Regola la velocità dell\'animazione quando si espandono le schede moderne con il focus';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Ritarda Espansione Schede con Scorrimento Rapido';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Attende che il focus si fermi prima di espandere le schede moderne';

  @override
  String get animationSpeedExtraSlow => 'Molto Lenta';

  @override
  String get animationSpeedSlow => 'Lenta';

  @override
  String get animationSpeedMedium => 'Media';

  @override
  String get animationSpeedFast => 'Veloce';

  @override
  String get animationSpeedOff => 'Disattivata';

  @override
  String get pageTransitionFadeNone => 'Nessuna Dissolvenza';

  @override
  String get pageTransitionFadeShort => 'Dissolvenza Breve';

  @override
  String get pageTransitionFadeMedium => 'Dissolvenza Media';

  @override
  String get pageTransitionFadeLong => 'Dissolvenza Lunga';

  @override
  String get siriRemoteSwipeSensitivity => 'Sensibilità Scorrimento Touchpad';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'Quanto si sposta il focus a ogni scorrimento sul touchpad del Siri Remote';

  @override
  String get appleTvHomeScreen => 'Schermata Home di Apple TV';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'Cosa mostra la schermata Home di Apple TV sopra l\'icona di Moonfin quando è selezionata. Questa impostazione vale solo per questo dispositivo.';

  @override
  String get topShelfLatestMedia => 'Ultimi contenuti';

  @override
  String get topShelfAppBanner => 'Banner Moonfin';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Tieni il Video Lontano dalla Dynamic Island';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'In orizzontale l\'alloggiamento della fotocamera copre un bordo dello schermo. Questa opzione tiene l\'immagine lontana da quel bordo e ha effetto solo sui video abbastanza larghi da arrivarci.';

  @override
  String get bottomNavbarStyle => 'Stile Barra Inferiore';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Divisa';

  @override
  String get bottomNavbarStyleStrip => 'Striscia';

  @override
  String get bottomNavbarTabs => 'Schede Barra Inferiore';

  @override
  String get bottomNavbarTabsDescription =>
      'Fissa fino a 3 schede tra Home e Tu. Tutto il resto si trova nell\'hub della barra di navigazione inferiore.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automatico';

  @override
  String get bottomNavbarTabsPinned => 'Fissate';

  @override
  String get bottomNavbarTabsAvailable => 'Disponibili';

  @override
  String get bottomNavbarTabsReset => 'Ripristina Automatico';

  @override
  String get bottomNavbarTabsLimit =>
      'Puoi fissare fino a 3 schede. Rimuovine una per fissarne un\'altra.';

  @override
  String get bottomNavbarTabTurnedOff => 'Disattivata nei Pulsanti';

  @override
  String get bottomNavbarSplitSearchNote =>
      'Nello stile Divisa, Cerca ha sempre il suo pulsante.';

  @override
  String get bottomNavbarButtonsNote =>
      'Questi pulsanti stabiliscono cosa compare nell\'hub della barra di navigazione inferiore e quali schede puoi fissare nella barra inferiore. Le schede già presenti nella barra non sono elencate qui.';

  @override
  String get navYou => 'Tu';

  @override
  String get cinemaSkipPrerolls => 'Pulsante Salta in Modalità Cinema';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Mostra un pulsante Salta durante trailer, pubblicità e altri contenuti iniziali della Modalità Cinema.';

  @override
  String get detailsPage => 'Pagina Dettagli';

  @override
  String get storageAndDownloads => 'Archiviazione & Download';

  @override
  String get integrations => 'Integrazioni';

  @override
  String get settingsSync => 'Sincronizzazione Impostazioni';

  @override
  String get settingsSyncSubtitle =>
      'Sincronizzazione con il plugin Moonbase e profili di personalizzazione';

  @override
  String get navigationBar => 'Barra Navigazione';

  @override
  String get homeRows => 'Righe';

  @override
  String get homeRowsSubtitle =>
      'Attiva o disattiva le righe e cambiane l\'ordine';

  @override
  String get rowOptions => 'Opzioni Righe';

  @override
  String get rowOptionsSubtitle => 'Ordinamento e contenuti di ogni riga';

  @override
  String get imageTypePerRow => 'Tipo di Immagine per Riga';

  @override
  String get externalSources => 'Fonti Esterne';

  @override
  String get qualityAndDecoding => 'Qualità e Decodifica';

  @override
  String get qualityAndDecodingSubtitle =>
      'Bitrate, risoluzione, decodifica, HDR e Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Salto e Riproduzione Automatica';

  @override
  String get advancedPlayback => 'Riproduzione Avanzata';

  @override
  String get advancedPlaybackSubtitle =>
      'Instradamento del lettore, lettori esterni e mpv';

  @override
  String get settingsAccountSubtitle =>
      'Accesso, codice PIN, Modalità Bambini, controllo parentale e sincronizzazione impostazioni';

  @override
  String get settingsGeneralSubtitle => 'Lingua, orologio, input e prestazioni';

  @override
  String get settingsAppearanceSubtitle =>
      'Navigazione, schermata Home, librerie, pagina dettagli e temi';

  @override
  String get settingsHomeScreenSubtitle =>
      'Righe, barra media, aspetto e fonti esterne';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Visibilità, ordine e pagine delle librerie';

  @override
  String get settingsDetailsPageSubtitle =>
      'Layout, pulsanti, sezioni, valutazioni e musica tema';

  @override
  String get settingsPlaybackSubtitle =>
      'Lettore, qualità, audio, sottotitoli, salto e SyncPlay';

  @override
  String get settingsStorageSubtitle =>
      'Download, posizione di archiviazione e cache immagini';

  @override
  String get settingsServicesSubtitle => 'Seerr e Badge Obiettivi';

  @override
  String get settingsSignInSection => 'Accesso';

  @override
  String get settingsFamilySection => 'Famiglia';

  @override
  String get settingsServersSection => 'Server';

  @override
  String get settingsLanguageSection => 'Lingua';

  @override
  String get settingsInputSection => 'Input';

  @override
  String get settingsMotionSection => 'Animazioni';

  @override
  String get settingsContentsSection => 'Contenuti';

  @override
  String get settingsLooksSection => 'Aspetto';

  @override
  String get settingsAudioAndSubtitlesSection => 'Audio e Sottotitoli';

  @override
  String get settingsSkippingAndQueueSection => 'Salto e Coda';

  @override
  String get settingsWatchTogetherSection => 'Guarda Insieme';

  @override
  String get settingsAdvancedSection => 'Avanzate';

  @override
  String get settingsDecodingAndRenderingSection => 'Decodifica e Rendering';

  @override
  String get settingsAudioStreamSection => 'Traccia Audio';

  @override
  String get settingsAudioOutputSection => 'Uscita Audio';

  @override
  String get settingsPassthroughSettingsSection => 'Impostazioni Passthrough';

  @override
  String get settingsSeerrHomePageRowsSection => 'Righe Seerr nella Home';

  @override
  String get settingsSavedCustomHomeRowsSection =>
      'Righe Personalizzate Salvate';

  @override
  String get settingsRewatchSection => 'Da Rivedere';

  @override
  String get favoritesSwitchViewSection => 'Cambia Vista';

  @override
  String get playerSettingsSubtitle =>
      'Controlli, scorrimento, pulsanti del lettore e trickplay';

  @override
  String get siloPasswordChangeTitle => 'Scegli una nuova password';

  @override
  String get siloPasswordChangeMessage =>
      'Questo account ha una password temporanea. Scegline una nuova per completare l\'accesso.';

  @override
  String get siloPasswordChangeNew => 'Nuova password';

  @override
  String get siloPasswordChangeConfirm => 'Conferma nuova password';

  @override
  String get siloPasswordChangeSubmit => 'Cambia password';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usa almeno $count caratteri',
      one: 'Usa almeno 1 carattere',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => 'Questa password è troppo lunga';

  @override
  String get siloPasswordChangeMismatch => 'Le password non corrispondono';

  @override
  String get siloPasswordChangeSameAsTemporary =>
      'Scegli una password diversa da quella temporanea';

  @override
  String get siloPasswordChangeFailed =>
      'Impossibile cambiare la password. Riprova.';

  @override
  String get siloPasswordChangeUnavailable =>
      'Questo account ha una password temporanea e questo server non consente di cambiarla qui. Cambiala nell\'app web di Silo, poi accedi di nuovo.';

  @override
  String get siloPasswordChangedSignInAgain =>
      'La tua password è stata cambiata. Accedi con la nuova password.';

  @override
  String get siloServerRowSubtitle => 'Dal tuo server';

  @override
  String get playlistSortReleaseDate => 'Data di Uscita';

  @override
  String get playlistSortCriticRating => 'Valutazione Critica';

  @override
  String get playlistSortRuntime => 'Durata';

  @override
  String get playlistSortLastPlayed => 'Ultima Riproduzione';

  @override
  String get playlistSortPlayCount => 'Numero di Riproduzioni';

  @override
  String get playlistSortRandom => 'Casuale';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count attivi',
      one: '1 attivo',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks =>
      'Nessuna traccia corrisponde ai filtri attivi';

  @override
  String get librarySortPlaylistOrder => 'Ordine Playlist';

  @override
  String get librarySortDateAdded => 'Data di Aggiunta';

  @override
  String get librarySortDateEpisodeAdded => 'Data di Aggiunta Episodio';

  @override
  String get librarySortParentalRating => 'Classificazione per Età';

  @override
  String get librarySortMyRating => 'La Mia Valutazione';

  @override
  String get librarySortAlbumArtist => 'Artista Album';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Artista';

  @override
  String get librarySortTrackNumber => 'Numero Traccia';

  @override
  String get librarySortGenre => 'Genere';

  @override
  String get librarySortFoldersFirst => 'Prima le Cartelle';

  @override
  String get librarySortLength => 'Durata';

  @override
  String get homeScreenBackdrop => 'Sfondo Schermata Home';

  @override
  String get homeScreenBackdropFullScreen => 'Schermo Intero';

  @override
  String get homeScreenBackdropCorner => 'Angolo';

  @override
  String get homeScreenBackdropTop => 'In Alto';

  @override
  String get detailsScreenBackdrop => 'Sfondo Schermata Dettagli';

  @override
  String get detailsBackdropSize => 'Dimensione Sfondo';

  @override
  String get detailsBackdropFullScreen => 'Schermo Intero';

  @override
  String get detailsBackdropFit => 'Adatta';

  @override
  String get libraryBackdrops => 'Sfondi Libreria';

  @override
  String get playbackInfoChannel => 'Canale';

  @override
  String get playbackInfoProgram => 'Programma';

  @override
  String get playbackInfoWhy => 'Motivo';

  @override
  String get playbackInfoServerCompatibilityCheck =>
      'Controllo compatibilità del server';

  @override
  String get playbackInfoBitrateUnavailable => 'Bitrate non disponibile';

  @override
  String get playbackInfoQualityLimit => 'Limite Qualità';

  @override
  String get playbackInfoFrameRate => 'Frame Rate';

  @override
  String get playbackInfoDelivery => 'Modalità';

  @override
  String get playbackInfoFile => 'File';

  @override
  String get playbackInfoTechnical => 'Dati Tecnici';

  @override
  String get playbackInfoDevice => 'Dispositivo';

  @override
  String get playbackInfoAudioRoute => 'Percorso Audio';

  @override
  String get playbackInfoSurround51 => '5.1 surround';

  @override
  String get playbackInfoSurround71 => '7.1 surround';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count canali';
  }

  @override
  String get playbackInfoBurnedIn => 'Impressi nel video dal server';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value (originale $original)';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value (convertito da $source)';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name ($size, convertita da $source)';
  }

  @override
  String get playbackInfoNoteDirectPlay =>
      'Riproduzione del file originale così com\'è.';

  @override
  String get playbackInfoNoteDirectStream =>
      'Il server sta rimpacchettando il file senza convertirlo.';

  @override
  String get playbackInfoNoteLiveRelay =>
      'Il server sta ritrasmettendo il canale senza convertirlo.';

  @override
  String playbackInfoFrameRateFrom(String rate, String source) {
    return '$rate fps ($source)';
  }

  @override
  String get playbackInfoRateSourceHeader => 'intestazione dello stream';

  @override
  String get playbackInfoRateSourceMeasured => 'misurato';

  @override
  String get playbackInfoRateSourceServer => 'server';

  @override
  String get playbackInfoServerFrameRate => 'Frame Rate del Server';

  @override
  String get playbackInfoScan => 'Scansione';

  @override
  String get playbackInfoProgressive => 'Progressivo';

  @override
  String get playbackInfoInterlaced => 'Interlacciato';

  @override
  String get playbackInfoRepeatedFields => 'Telecine (campi ripetuti)';

  @override
  String get playbackInfoHdmiOutput => 'Uscita HDMI';

  @override
  String playbackInfoDisplayMode(String width, String height, String rate) {
    return '$width×$height @ $rate Hz';
  }

  @override
  String get playbackInfoRateCorrections => 'Correzioni Frequenza';

  @override
  String get playbackInfoAudioOutput => 'Uscita';

  @override
  String playbackInfoPassthroughOf(String codec) {
    return 'Passthrough ($codec)';
  }

  @override
  String playbackInfoDecodedTo(String channels) {
    return 'Decodificato ($channels)';
  }

  @override
  String get playbackInfoNoteTranscodeVideo =>
      'Il server sta convertendo il video così che questo dispositivo possa riprodurlo.';

  @override
  String get playbackInfoNoteTranscodeAudio =>
      'Il server sta convertendo l\'audio così che questo dispositivo possa riprodurlo.';

  @override
  String get playbackInfoNoteTranscodeBoth =>
      'Il server sta convertendo video e audio così che questo dispositivo possa riprodurli.';

  @override
  String get playbackInfoNoteTranscodeUnknown =>
      'Il server sta convertendo questo file così che questo dispositivo possa riprodurlo.';

  @override
  String get playbackInfoNoteOffline => 'Riproduzione di una copia scaricata.';

  @override
  String get playbackInfoWhyForced =>
      'La transcodifica è forzata nelle impostazioni';

  @override
  String get playbackInfoWhyBitrate =>
      'Il bitrate supera il limite di streaming';

  @override
  String get playbackInfoWhyContainer =>
      'Questo dispositivo non può riprodurre questo tipo di file';

  @override
  String get playbackInfoWhyVideo =>
      'Questo dispositivo non può riprodurre questo formato video';

  @override
  String get playbackInfoWhyHdr =>
      'Questo dispositivo non può visualizzare questo formato HDR';

  @override
  String get playbackInfoWhyAudio =>
      'Questo dispositivo non può riprodurre questo formato audio';

  @override
  String get playbackInfoWhySubtitles =>
      'I sottotitoli vengono impressi nel video';

  @override
  String get playbackInfoWhyOther =>
      'Impossibile riprodurre il file direttamente';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate supera il limite di streaming di $limit';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return 'Questo dispositivo non può aprire file $container';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return 'Questo dispositivo non può riprodurre video $codec';
  }

  @override
  String playbackInfoWhyVideoProfileUnknown(String codec) {
    return 'Il server non è riuscito a verificare il profilo $codec di questo stream.';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return 'Questo dispositivo non può riprodurre video $codec $profile';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return 'Questo dispositivo non può riprodurre video $codec di livello $level';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return 'Questo dispositivo non può riprodurre video a $bits bit';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return 'Questo dispositivo non può riprodurre video $resolution';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return 'Questo dispositivo non può riprodurre video a $fps fps';
  }

  @override
  String get playbackInfoWhyInterlaced =>
      'Questo dispositivo non può riprodurre video interlacciato';

  @override
  String get playbackInfoWhyAnamorphic =>
      'Questo dispositivo non può riprodurre video anamorfico';

  @override
  String playbackInfoWhyHdrName(String range) {
    return 'Questo dispositivo non può visualizzare $range';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return 'Questo dispositivo non può riprodurre audio $format';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return 'Questo dispositivo non può riprodurre $fullFormat';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return 'Questo dispositivo non può riprodurre audio $channels';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return 'Questo dispositivo non può riprodurre audio a $rate kHz';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return 'Questo dispositivo non può riprodurre audio a $bits bit';
  }

  @override
  String get playbackInfoWhyAudioExternal =>
      'La traccia audio è in un file separato';

  @override
  String get playbackInfoWhySecondaryAudio =>
      'Questo dispositivo può riprodurre solo la prima traccia audio';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return 'I sottotitoli $format vengono impressi nel video';
  }

  @override
  String get playbackInfoDroppedFrames => 'Fotogrammi Persi';

  @override
  String get playFromServer => 'Riproduci dal Server';

  @override
  String get settingsApplePlayerUi => 'Lettore video';

  @override
  String get settingsApplePlayerUiDescription =>
      'Il lettore nativo in stile Apple non ha i pulsanti Trasmetti, Ritardo audio e PiP, e il suo blocco della rotazione è disponibile solo in TV Live';

  @override
  String get settingsApplePlayerUiStandard => 'Standard';

  @override
  String get settingsApplePlayerUiNative => 'Stile Apple nativo';

  @override
  String get playerTransportPosition => 'Pulsanti di riproduzione';

  @override
  String get playerTransportPositionDescription =>
      'Mostra i comandi di riproduzione, salto e scorrimento al centro del video o ancorati nella barra inferiore';

  @override
  String get playerTransportOnScreen => 'Sullo schermo';

  @override
  String get playerTransportDocked => 'Ancorati';

  @override
  String get incompleteRecording => 'Incompleto';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '$recorded di $expected min';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return 'Trasmissione completa programmata per $dateTime';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return 'Copia completa registrata $dateTime';
  }

  @override
  String get noCompleteShowingFound => 'Nessuna trasmissione completa trovata';

  @override
  String get keepAsComplete => 'Segna come Completa';

  @override
  String get keptAsComplete => 'Segnata come completa';

  @override
  String get unableToKeepAsComplete => 'Impossibile segnare come completa';

  @override
  String recordPromptTitle(String name) {
    return 'Registra $name';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'Questa trasmissione è iniziata $minutes minuti fa, quindi la registrazione perderà l\'inizio.',
      one: 'Questa trasmissione è iniziata 1 minuto fa, quindi la registrazione perderà l\'inizio.',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater =>
      'Registrare anche la trasmissione futura per avere una registrazione completa?';

  @override
  String get recordPromptSearchLater =>
      'Registrare automaticamente anche una trasmissione futura appena ne viene trovata una, per avere una registrazione completa?';

  @override
  String get recordPromptNow => 'Ora';

  @override
  String get recordPromptLater => 'Trasmissione futura';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min già trasmessi',
      one: '1 min già trasmesso',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch =>
      'Corrispondenza solo per titolo e descrizione. Verifica che sia lo stesso programma.';

  @override
  String get recordPromptDescriptionsDiffer =>
      'Le descrizioni sono diverse, quindi potrebbe essere un altro programma.';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return 'Stesso episodio (S${season}E$episode)';
  }

  @override
  String get recordPromptAlreadyScheduled => 'Registrazione già programmata';

  @override
  String get recordPromptTomorrow => 'Domani';

  @override
  String get recordNowOnly => 'Registra Solo Ora';

  @override
  String recordNowAnd(String when) {
    return 'Registra Ora e $when';
  }

  @override
  String get recordNowAndLater => 'Registra Ora e Trasmissione Futura';

  @override
  String recordOnlyLater(String when) {
    return 'Registra Solo $when';
  }

  @override
  String get recordLaterShowingOnly => 'Registra Solo Trasmissione Futura';

  @override
  String get laterShowingOnlyRequested =>
      'La trasmissione futura verrà registrata.';

  @override
  String get unableToRequestLaterShowingOnly =>
      'Impossibile richiedere la trasmissione futura, quindi non verrà registrato nulla.';

  @override
  String get laterShowingRequested =>
      'Registrazione avviata. Verrà registrata anche una trasmissione futura.';

  @override
  String get unableToRequestLaterShowing =>
      'Registrazione avviata, ma impossibile richiedere una trasmissione futura.';

  @override
  String get siloCodeSignIn => 'Accedi con un codice';

  @override
  String siloCodeSignInInstruction(String address) {
    return 'Scansiona il codice QR con il telefono oppure vai su $address da un dispositivo su cui hai effettuato l\'accesso e inserisci questo codice:';
  }

  @override
  String get siloCodeSignInInstructionNoLink =>
      'Inserisci questo codice in Silo su un dispositivo in cui hai effettuato l\'accesso:';

  @override
  String get siloCodeSignInOpened =>
      'Codice trovato. Approva l\'accesso sull\'altro dispositivo.';

  @override
  String get siloCodeSignInDenied => 'Questo accesso è stato rifiutato.';

  @override
  String get siloCodeSignInNewCode => 'Ottieni un nuovo codice';

  @override
  String get siloCodeSignInOff =>
      'L\'accesso con un codice è disattivato su questo server.';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      'Questo account ha una password temporanea. Accedi una volta con la password per sostituirla.';

  @override
  String get siloApproveSignIn => 'Approva un accesso';

  @override
  String get siloApproveSignInHint => 'Codice mostrato sull\'altro dispositivo';

  @override
  String get siloApproveSignInApprove => 'Approva';

  @override
  String get siloApproveSignInDone =>
      'Approvato. L\'altro dispositivo sta effettuando l\'accesso.';

  @override
  String get siloApproveSignInNoRequest =>
      'Nessun accesso in attesa con questo codice. Controllalo oppure ottieni un nuovo codice sull\'altro dispositivo.';

  @override
  String get siloNativeOfferTitle => 'Connettersi direttamente a Silo?';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return 'Questo indirizzo è il servizio compatibile con Jellyfin di $serverName. Moonfin può connettersi direttamente a Silo su $address, con le funzioni proprie di Silo.';
  }

  @override
  String get siloNativeOfferUse => 'Usa Silo';

  @override
  String get siloNativeOfferKeep => 'Mantieni Jellyfin';

  @override
  String get siloAppUpdateRequired =>
      'Questo server Silo richiede una versione più recente di Moonfin. Aggiorna Moonfin per usarlo.';

  @override
  String get siloServerUpdateRequired =>
      'Questo server Silo è troppo vecchio per questa versione di Moonfin. Aggiorna Silo per usarlo.';

  @override
  String get siloTooManyAttempts => 'Troppi tentativi. Riprova più tardi.';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return 'Troppi tentativi. Riprova tra $wait.';
  }

  @override
  String get siloServerBusy =>
      'Il server è occupato o ancora in avvio. Riprova più tardi.';

  @override
  String siloServerBusyWait(String wait) {
    return 'Il server è occupato o ancora in avvio. Riprova tra $wait.';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count secondi',
      one: '1 secondo',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minuti',
      one: '1 minuto',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable =>
      'La riproduzione non è disponibile su questo server Silo.';

  @override
  String get siloPlaybackUpdateRequired =>
      'Questo server Silo richiede una versione più recente di Moonfin per la riproduzione.';

  @override
  String get siloPlaybackEndedOnServer =>
      'La riproduzione è stata interrotta sul server Silo.';

  @override
  String siloPinTitle(String name) {
    return 'PIN di $name';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => 'Sblocca';

  @override
  String get siloPinRemember => 'Ricorda il PIN su questo dispositivo';

  @override
  String get siloPinWrong => 'Il PIN non è corretto.';

  @override
  String get siloPinLocked => 'Troppi PIN errati. Riprova più tardi.';

  @override
  String siloPinLockedWait(String wait) {
    return 'Troppi PIN errati. Riprova tra $wait.';
  }

  @override
  String get siloPinFailed => 'Impossibile verificare il PIN. Riprova.';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trailer',
      one: '1 trailer',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return 'Trailer $number';
  }

  @override
  String get subtitled => 'Sottotitolato';

  @override
  String get rommAccount => 'Account RomM';

  @override
  String get rommAccountIntro =>
      'Collega il tuo account RomM per giocare dalla tua libreria RomM e mantenere i salvataggi in RomM.';

  @override
  String get rommLinkAccount => 'Collega account RomM';

  @override
  String get rommLinkInstructions =>
      'Accedi a RomM e inserisci questo codice per collegare il tuo account.';

  @override
  String rommLinkScanOrVisit(String url) {
    return 'Scansiona il codice QR con il telefono o vai su $url';
  }

  @override
  String get rommOpen => 'Apri RomM';

  @override
  String get rommWaitingForApproval =>
      'In attesa che approvi il codice in RomM…';

  @override
  String rommLinkedAs(String username) {
    return 'Collegato come $username';
  }

  @override
  String get rommLinked => 'Il tuo account RomM è collegato.';

  @override
  String get rommUnlinkNote =>
      'Se scolleghi l\'account, Moonfin smette di usare la tua chiave RomM. La chiave resta in RomM finché non la rimuovi dai tuoi token API.';

  @override
  String get rommUnlink => 'Scollega';

  @override
  String get rommLinkExpired =>
      'Il codice è scaduto prima dell\'approvazione. Collega di nuovo per riceverne uno nuovo.';

  @override
  String get rommLinkDenied => 'Il collegamento è stato rifiutato in RomM.';

  @override
  String get rommUnreachable =>
      'Moonfin non è riuscito a raggiungere RomM. Riprova tra un momento.';

  @override
  String get rommNotAvailable => 'Questo server non ha una libreria RomM.';

  @override
  String get rommAccountLoadFailed =>
      'Impossibile caricare il tuo account RomM.';

  @override
  String get reviews => 'Recensioni';

  @override
  String get detailSectionReviews => 'Recensioni';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count recensioni',
      one: '1 recensione',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => 'Leggi su TMDB';

  @override
  String get addServerButtonSubtitle =>
      'Per indirizzo o con un account Plex o Emby Connect';

  @override
  String get addServerChooseHow => 'Scegli come vuoi connetterti.';

  @override
  String get addServerAddressChoice =>
      'Jellyfin, Emby o Silo nella tua rete o online';

  @override
  String get addServerPlexChoice =>
      'Usa il tuo account Plex per trovarne i server';

  @override
  String get addServerAddressHelp =>
      'Lo stesso indirizzo che apriresti in un browser, porta inclusa.';

  @override
  String get addServerDetectNote =>
      'Funziona con Jellyfin, Emby e Silo. Un indirizzo Plex apre l\'accesso a Plex.';

  @override
  String addServerChecking(String address) {
    return 'Controllo di $address';
  }

  @override
  String get addServerUnreachableDetail =>
      'Controlla l\'indirizzo e la porta e che il server sia in esecuzione.';

  @override
  String get addServerFound => 'Server trovato';

  @override
  String get addServerFoundNote => 'Continua per scegliere chi accede.';

  @override
  String get addServerUseDifferentAddress => 'Usa un indirizzo diverso';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artisti',
      one: '1 artista',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count brani',
      one: '1 brano',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count playlist',
      one: '1 playlist',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ascolti',
      one: '1 ascolto',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => 'Tutti gli Artisti';

  @override
  String get libraryZToA => 'Dalla Z alla A';

  @override
  String get musicSortYear => 'Anno';

  @override
  String get musicFilter => 'Filtra';

  @override
  String get musicGenreFilterTitle => 'Filtra per Genere';

  @override
  String get openAlbum => 'Apri Album';

  @override
  String get openPlaylist => 'Apri Playlist';

  @override
  String get allSongsAToZ => 'Tutti i Brani dalla A alla Z';

  @override
  String get musicMix => 'Mix';

  @override
  String get musicMixEverything => 'Tutto';

  @override
  String get musicMixEverythingSubtitle => '300 brani a caso';

  @override
  String get mostPlayed => 'Più Ascoltati';

  @override
  String get musicMixMostPlayedSubtitle => 'I tuoi 100 più ascoltati';

  @override
  String get musicMixFreshArrivals => 'Nuovi Arrivi';

  @override
  String get musicMixFreshArrivalsSubtitle => 'I 100 brani più recenti';

  @override
  String get musicMixRediscover => 'Riscopri';

  @override
  String get musicMixRediscoverSubtitle =>
      'Preferiti che non ascolti da un po\'';

  @override
  String get musicSortMostAlbums => 'Più Album';

  @override
  String bookSeriesPosition(int index, int total) {
    return 'Libro $index di $total';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count preferiti',
      one: '1 preferito',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Dalla Z alla A';

  @override
  String get bookSortMostTitles => 'Più Titoli';

  @override
  String get bookSurpriseMe => 'Sorprendimi';

  @override
  String get bookShuffleAudiobooks => 'Audiolibro Casuale';

  @override
  String get bookStartReading => 'Inizia a Leggere';

  @override
  String get bookOtherBooks => 'Altri Libri';

  @override
  String get bookDiscoverSearchBooks => 'Cerca su Open Library';

  @override
  String get bookDiscoverSearchAudiobooks => 'Cerca su LibriVox';

  @override
  String get bookDiscoverFeatured => 'In evidenza';

  @override
  String get bookReaderControlsAutoHide =>
      'I controlli si nascondono automaticamente';

  @override
  String get bookReaderControlsStayVisible => 'I controlli restano visibili';

  @override
  String get settingsLivePreview => 'Anteprima in tempo reale';

  @override
  String settingsPreviewShowsOn(String screen) {
    return 'Visibile nell\'anteprima $screen';
  }

  @override
  String get settingsPreviewNotShown => 'Non visibile nell\'anteprima';

  @override
  String settingsPreviewAudioRowsOffInHomeRows(String group, String disabled) {
    return 'Album, Artisti e Playlist Audio sono tutti disattivati. Per mostrarne uno, vai in Righe, apri $group sotto $disabled e attivalo.';
  }

  @override
  String settingsPreviewAudioRowsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return 'Per vedere Album, Artisti o Playlist Audio nella Home, attiva prima $setting. Poi vai in Righe, apri $group sotto $disabled e attivane uno.';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRows(
    String group,
    String disabled,
  ) {
    return 'La riga Collezioni è disattivata. Per mostrarla, vai in Righe, apri $group sotto $disabled e attivala.';
  }

  @override
  String settingsPreviewCollectionsOffInHomeRowsSwitchOff(
    String setting,
    String group,
    String disabled,
  ) {
    return 'Per vedere la riga Collezioni nella Home, attiva prima $setting. Poi vai in Righe, apri $group sotto $disabled e attivala.';
  }

  @override
  String get settingsPreviewRowsOffInKidsMode =>
      'La Modalità Bambini tiene queste righe fuori dalla Home, quindi queste impostazioni non la cambiano.';

  @override
  String settingsPreviewNeedsRowInRows(String disabled) {
    return 'Attiva una riga in Righe, sotto $disabled';
  }

  @override
  String settingsPreviewNeedsSwitchAndRow(String setting) {
    return 'Attiva $setting, poi attiva una riga in Righe';
  }

  @override
  String get settingsPreviewKeptOffByKidsMode =>
      'La Modalità Bambini la tiene fuori dalla Home';

  @override
  String get settingsPreviewAudioRowsEmpty =>
      'Non c\'è musica da mostrare, quindi la Home non mostra queste righe.';

  @override
  String get settingsPreviewRowsEmpty =>
      'Non c\'è niente da mostrare in queste righe, quindi la Home non le mostra.';

  @override
  String get settingsPreviewCollectionsEmpty =>
      'Non ci sono collezioni da mostrare, quindi la Home non mostra questa riga.';

  @override
  String get settingsPreviewShowEpisodesNote =>
      'Cambia solo le righe di una singola collezione aggiunta in Righe. La riga Collezioni resta uguale.';

  @override
  String get settingsPreviewSaved => 'Salvato';

  @override
  String get smartSearch => 'Ricerca Intelligente';

  @override
  String smartSearchOnSeerr(String seerr) {
    return 'Ricerca Intelligente su $seerr';
  }

  @override
  String get calendar => 'Calendario';

  @override
  String get showCalendarButton => 'Mostra Pulsante Calendario';

  @override
  String get showCalendarButtonSubtitle =>
      'Mostra il calendario di episodi e film in arrivo nella barra di navigazione';

  @override
  String get calendarFullCalendar => 'Calendario completo';

  @override
  String get calendarUpcoming => 'In arrivo';

  @override
  String get calendarRecentlyAired => 'Trasmessi di recente';

  @override
  String get calendarRemindMe => 'Ricordamelo';

  @override
  String get calendarReminderSet => 'Promemoria impostato';

  @override
  String get calendarReminderFailed => 'Impossibile salvare il promemoria';

  @override
  String get calendarReadyToWatch => 'Pronti da guardare';

  @override
  String get calendarComingUpThisWeek => 'In arrivo questa settimana';

  @override
  String get calendarNothingUpcoming => 'Nulla in arrivo';

  @override
  String get calendarNothingRecent => 'Nulla trasmesso di recente';

  @override
  String get calendarEmptyDay => 'Nulla in questo giorno';

  @override
  String get calendarStartsIn => 'Inizia tra';

  @override
  String get calendarUnitDays => 'giorni';

  @override
  String get calendarUnitHours => 'ore';

  @override
  String get calendarUnitMinutes => 'min';

  @override
  String calendarDayAtTime(String day, String time) {
    return '$day alle $time';
  }

  @override
  String get calendarAllDay => 'Tutto il giorno';

  @override
  String get calendarBadgeSeriesPremiere => 'Prima della serie';

  @override
  String get calendarBadgeSeasonPremiere => 'Nuova stagione';

  @override
  String get calendarBadgeSeasonFinale => 'Finale di stagione';

  @override
  String get calendarBadgeMidseasonFinale => 'Finale di metà stagione';

  @override
  String get calendarBadgeSeriesFinale => 'Finale della serie';

  @override
  String get calendarBadgeNew => 'NUOVO';

  @override
  String get calendarStatusInLibrary => 'In libreria';

  @override
  String get calendarNotMonitored => 'Non monitorato';

  @override
  String get calendarMovieDetails => 'Dettagli film';

  @override
  String get calendarProblemAdminsOnly =>
      'Su questo server il calendario è riservato agli amministratori.';

  @override
  String get calendarProblemNeedsSeerr =>
      'Un amministratore deve accedere a Seerr in Moonfin prima che il calendario possa essere caricato.';

  @override
  String get calendarProblemNotConfigured =>
      'Nessun server Sonarr o Radarr è ancora collegato.';

  @override
  String get calendarProblemFailed => 'Impossibile caricare il calendario.';

  @override
  String get calendarSettingsSubtitle =>
      'Stile, filtri e azioni del calendario';

  @override
  String get calendarSettingsView => 'Visualizzazione';

  @override
  String get calendarSettingsStyle => 'Stile calendario';

  @override
  String get calendarSettingsStyleDescription =>
      'Cosa apre il pulsante Calendario. In entrambi gli stili il mese intero è a un pulsante di distanza.';

  @override
  String get calendarSettingsStyleAgenda => 'Agenda';

  @override
  String get calendarSettingsStyleCountdown => 'Conto alla rovescia';

  @override
  String get calendarSettingsWeekStart => 'Primo giorno della settimana';

  @override
  String get calendarSettingsWhatShows => 'Cosa mostrare';

  @override
  String get calendarSettingsScope => 'Mostra';

  @override
  String get calendarSettingsScopeDescription =>
      'Le mie serie mostra solo le serie che hai aggiunto ai preferiti o iniziato a guardare';

  @override
  String get calendarSettingsScopeEverything => 'Tutto';

  @override
  String get calendarSettingsScopeMyShows => 'Le mie serie';

  @override
  String get calendarSettingsUnmonitored => 'Includi non monitorati';

  @override
  String get calendarSettingsUnmonitoredSubtitle =>
      'Elenca anche episodi e film che Sonarr e Radarr non devono scaricare';

  @override
  String get calendarSettingsSpecials => 'Speciali';

  @override
  String get calendarSettingsSpecialsSubtitle =>
      'Episodi della stagione 0, come contenuti extra e speciali delle festività';

  @override
  String get calendarSettingsBadges => 'Tag di prima visione e finale';

  @override
  String get calendarSettingsBadgesSubtitle =>
      'Segna prime visioni, finali e nuove stagioni';

  @override
  String get calendarSettingsColorBy => 'Colora per';

  @override
  String get calendarSettingsColorByDescription =>
      'Tipo distingue episodi e film. Stato mostra cosa è già in libreria, in arrivo o mancante.';

  @override
  String get calendarSettingsColorByType => 'Tipo';

  @override
  String get calendarSettingsImageType => 'Immagine scheda';

  @override
  String get calendarSettingsImageTypeDescription =>
      'Le immagini delle righe Conto alla rovescia';

  @override
  String get calendarSettingsSpoilerSafe => 'Anti-spoiler';

  @override
  String get calendarSettingsSpoilerSafeSubtitle =>
      'Nascondi titoli e immagini degli episodi delle serie in cui sei rimasto indietro';

  @override
  String get calendarSettingsActions => 'Azioni';

  @override
  String get calendarSettingsSelectAction => 'Selezione di un elemento';

  @override
  String get calendarSettingsSelectActionDescription =>
      'Cosa succede premendo OK o toccando un elemento già nella tua libreria';

  @override
  String get calendarSettingsSelectDetails => 'Apri dettagli';

  @override
  String get calendarSettingsSelectPlay => 'Riproduci se in libreria';

  @override
  String get calendarSettingsRequestButton => 'Pulsante richiesta';

  @override
  String get calendarSettingsRequestButtonSubtitle =>
      'Mostra il pulsante di richiesta Seerr su film e stagioni mancanti';

  @override
  String get calendarSettingsReminders => 'Promemoria';

  @override
  String get calendarSettingsRemindersSubtitle =>
      'Mostra Ricordamelo, che invia una notifica quando un titolo arriva nella tua libreria';

  @override
  String get calendarRowSeeAll => 'Scheda Vedi Tutto';

  @override
  String get calendarRowSeeAllSubtitle =>
      'Chiudi le righe dei titoli in arrivo con una scheda che apre il calendario';

  @override
  String get showNextAirDate => 'Prossima messa in onda alla fine';

  @override
  String get showNextAirDateSubtitle =>
      'Quando il prossimo episodio non è ancora nella tua libreria, la scheda di fine episodio indica quando andrà in onda';

  @override
  String get afterHoursTitle => 'After Hours';

  @override
  String get afterHoursUnlocked => 'After Hours sbloccato';

  @override
  String afterHoursPressesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ancora $count pressioni',
      one: 'Ancora 1 pressione',
    );
    return '$_temp0';
  }

  @override
  String afterHoursTapsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ancora $count tocchi',
      one: 'Ancora 1 tocco',
    );
    return '$_temp0';
  }

  @override
  String get afterHoursPlay => 'Gioca';

  @override
  String get afterHoursLeaderboards => 'Classifiche';

  @override
  String get afterHoursTop3 => 'Top 3';

  @override
  String afterHoursScoresFrom(String server) {
    return 'Punteggi da $server';
  }

  @override
  String get afterHoursScoresOnDevice => 'Punteggi su questo dispositivo';

  @override
  String get afterHoursGameOver => 'Partita finita';

  @override
  String afterHoursNewRank(int rank) {
    return 'Nuovo $rank° posto in classifica';
  }

  @override
  String get afterHoursPlayAgain => 'Gioca di nuovo';

  @override
  String get afterHoursBackToArcade => 'Torna alla sala giochi';

  @override
  String get afterHoursArcade => 'Sala giochi';

  @override
  String get afterHoursLandscapeNote =>
      'Lo schermo passa in orizzontale mentre giochi';

  @override
  String get afterHoursTouch => 'Tocco';

  @override
  String get afterHoursNewTag => 'NUOVO';

  @override
  String get afterHoursNoScores => 'Nessun punteggio ancora';

  @override
  String get afterHoursPerfect => 'PERFETTO';

  @override
  String get afterHoursBoxSet => 'COFANETTO';

  @override
  String get afterHoursBufferRun => 'Buffer Run';

  @override
  String get afterHoursBufferRunGenre =>
      'Runner infinito con gravità invertibile';

  @override
  String get afterHoursBufferRunPitch =>
      'Il runner della schermata di caricamento ha finalmente un posto dove andare. Con il doppio salto la gravità si inverte e lo porta sul soffitto.';

  @override
  String get afterHoursBufferRunRemote =>
      'OK salta, di nuovo in aria per cambiare lato. Giù scivola. Sul soffitto Su e Giù si invertono.';

  @override
  String get afterHoursBufferRunTouch =>
      'Tocca per saltare e tocca di nuovo in aria per capovolgerti. Scorri verso il lato su cui corri per scivolare.';

  @override
  String get afterHoursFastForward => 'Fast Forward';

  @override
  String get afterHoursFastForwardGenre => 'Runner a tre corsie';

  @override
  String get afterHoursFastForwardPitch =>
      'Uno scatto lungo tre corridoi dell\'atrio del cinema. Salta gli ostacoli bassi e ricorda che i carrelli dei popcorn non si spostano per nessuno.';

  @override
  String get afterHoursFastForwardRemote =>
      'Su e Giù cambiano corsia. OK salta.';

  @override
  String get afterHoursFastForwardTouch =>
      'Scorri verso l\'alto o il basso per cambiare corsia. Tocca per saltare.';

  @override
  String get afterHoursCableCrawl => 'Cable Crawl';

  @override
  String get afterHoursCableCrawlGenre => 'Serpente su griglia';

  @override
  String get afterHoursCableCrawlPitch =>
      'Guida un cavo HDMI dietro il mobile della TV e collegalo al segnale. Ogni tacca lo allunga.';

  @override
  String get afterHoursCableCrawlRemote =>
      'Le frecce lo fanno girare. Il cavo non si ferma mai.';

  @override
  String get afterHoursCableCrawlTouch => 'Scorri per girare.';

  @override
  String get afterHoursCaseStack => 'Case Stack';

  @override
  String get afterHoursCaseStackGenre => 'Gioco di impilamento a un pulsante';

  @override
  String get afterHoursCaseStackPitch =>
      'Costruisci una torre di custodie Blu-ray alta come uno scaffale, ognuna un titolo della tua libreria. Quello che sporge dal bordo viene tagliato, quindi posale ben centrate.';

  @override
  String get afterHoursCaseStackRemote => 'OK lascia cadere la custodia.';

  @override
  String get afterHoursCaseStackTouch => 'Tocca ovunque per lasciarla cadere.';

  @override
  String get afterHoursPixelPurge => 'Pixel Purge';

  @override
  String get afterHoursPixelPurgeGenre => 'Spaccamattoni con racchetta';

  @override
  String get afterHoursPixelPurgePitch =>
      'Una codifica difettosa ha riempito l\'immagine di artefatti a blocchi, che scendono un po\' ogni secondo. Fai rimbalzare il pulsante play sulla barra di scorrimento per eliminarli prima che la raggiungano.';

  @override
  String get afterHoursPixelPurgeRemote =>
      'Sinistra e Destra spostano la barra di scorrimento. La palla parte da sola.';

  @override
  String get afterHoursPixelPurgeTouch =>
      'Trascina per spostare la barra di scorrimento.';

  @override
  String get afterHoursHowToPlay => 'Come si gioca';

  @override
  String get afterHoursStart => 'Inizia';

  @override
  String get afterHoursBackToGame => 'Torna al gioco';

  @override
  String get afterHoursEnemies => 'Nemici';

  @override
  String get afterHoursObstacles => 'Ostacoli';

  @override
  String get afterHoursPowerups => 'Potenziamenti';

  @override
  String get afterHoursCastShieldLine => 'Uno scudo che assorbe un colpo.';

  @override
  String get afterHoursCastPointsLine => '25 punti l\'uno.';

  @override
  String get afterHoursCastLagBat => 'Pipistrello Lag';

  @override
  String get afterHoursCastLagBatLine =>
      'Arriva in picchiata all\'altezza della testa. Scivolaci sotto.';

  @override
  String get afterHoursCastGremlin => 'Gremlin del Disturbo';

  @override
  String get afterHoursCastGremlinLine =>
      'Saltella verso di te sul pavimento o sul soffitto. Saltalo.';

  @override
  String get afterHoursCastCable => 'Cavo Arrotolato';

  @override
  String get afterHoursCastCableLine =>
      'Basso sul pavimento o sul soffitto. Saltalo.';

  @override
  String get afterHoursCastBanner => 'Cartello Buffering';

  @override
  String get afterHoursCastBannerLine =>
      'Scivola sotto il cartello. Dall\'altro lato il palo è un muro.';

  @override
  String get afterHoursCastSkipIntro => 'Salta Intro';

  @override
  String get afterHoursCastSkipIntroLine =>
      'Tre secondi di scatto che distrugge tutto.';

  @override
  String get afterHoursCastPopcorn => 'Popcorn';

  @override
  String get afterHoursCastRollingReel => 'Bobina in Fuga';

  @override
  String get afterHoursCastRollingReelLine =>
      'Rotola nella tua corsia più veloce di te. Saltala.';

  @override
  String get afterHoursCastUsher => 'Maschera';

  @override
  String get afterHoursCastUsherLine =>
      'Ti viene incontro e cambia corsia una volta.';

  @override
  String get afterHoursCastVelvetRope => 'Cordone';

  @override
  String get afterHoursCastVelvetRopeLine => 'Basso. Saltalo o cambia corsia.';

  @override
  String get afterHoursCastPopcornCart => 'Carrello Popcorn';

  @override
  String get afterHoursCastPopcornCartLine =>
      'Troppo alto da saltare. Cambia corsia.';

  @override
  String get afterHoursCastFrontRowPass => 'Pass Prima Fila';

  @override
  String get afterHoursCastMagnet => 'Calamita';

  @override
  String get afterHoursCastMagnetLine =>
      'Attira i biglietti da tutte le corsie per otto secondi.';

  @override
  String get afterHoursCastTicket => 'Biglietto';

  @override
  String get afterHoursCastBug => 'Cimice Interferente';

  @override
  String get afterHoursCastBugLine => 'Vaga a caso.';

  @override
  String get afterHoursCastTangle => 'Groviglio';

  @override
  String get afterHoursCastTangleLine => 'Insegue lentamente la tua spina.';

  @override
  String get afterHoursCastStatic => 'Disturbo';

  @override
  String get afterHoursCastStaticLine =>
      'Una cella morta. Ne compare una ogni tre segnali.';

  @override
  String get afterHoursCastBrick => 'Alimentatore';

  @override
  String get afterHoursCastBrickLine => 'Un blocco 2x2 ogni cinque segnali.';

  @override
  String get afterHoursCastGhost => 'Fantasma';

  @override
  String get afterHoursCastGhostLine =>
      'Cinque secondi per attraversare tutto tranne il bordo.';

  @override
  String get afterHoursCastSnip => 'Taglio';

  @override
  String get afterHoursCastSnipLine => 'Taglia il cavo a metà per punti bonus.';

  @override
  String get afterHoursCastSignal => 'Segnale';

  @override
  String get afterHoursCastSignalLine => 'Punti e due segmenti in più.';

  @override
  String get afterHoursCastShelfCat => 'Gatto sullo Scaffale';

  @override
  String get afterHoursCastShelfCatLine =>
      'Dà una zampata alla custodia in arrivo, che scorre più veloce.';

  @override
  String get afterHoursCastBluCase => 'Custodia Blu-ray';

  @override
  String get afterHoursCastBluCaseLine =>
      'Un titolo della tua libreria. La parte che sporge viene tagliata.';

  @override
  String get afterHoursCastSteelbook => 'Steelbook';

  @override
  String get afterHoursCastSteelbookLine =>
      'Una ogni dieci custodie. Scorre molto più veloce.';

  @override
  String get afterHoursCastPerfect => 'Caduta Perfetta';

  @override
  String get afterHoursCastPerfectLine =>
      'Centrala alla perfezione e la pila si allarga un po\'.';

  @override
  String get afterHoursCastBoxSet => 'Cofanetto';

  @override
  String get afterHoursCastBoxSetLine =>
      'Tre cadute perfette di fila allargano molto la pila.';

  @override
  String get afterHoursCastDeadPixel => 'Pixel Morto';

  @override
  String get afterHoursCastDeadPixelLine =>
      'Cade dai blocchi eliminati. Se lo prendi, la barra di scorrimento si accorcia.';

  @override
  String get afterHoursCastMacroblock => 'Macroblocco';

  @override
  String get afterHoursCastMacroblockLine => 'Basta un colpo per eliminarlo.';

  @override
  String get afterHoursCastKeyframe => 'Fotogramma Chiave';

  @override
  String get afterHoursCastKeyframeLine =>
      'Si rompe con tre colpi e lascia un potenziamento.';

  @override
  String get afterHoursCastHdrLine =>
      'Barra di scorrimento larga il doppio per otto secondi.';

  @override
  String get afterHoursCastBufferNet => 'Buffer';

  @override
  String get afterHoursCastBufferNetLine =>
      'Una rete sotto la barra di scorrimento che ti salva da una palla persa.';

  @override
  String get afterHoursBufferRunCardTouch =>
      'Tocca per saltare, di nuovo in aria per capovolgerti. Scorri verso il tuo lato per scivolare.';

  @override
  String get afterHoursPixelPurgeCardRemote =>
      'Sinistra e Destra spostano la barra di scorrimento.';

  @override
  String get clickpadSeeking => 'Allow Clickpad Seeking';

  @override
  String get clickpadSeekingDescription =>
      'When Left, Right and touchpad swipes can seek. Otherwise the first one brings up the controls.';

  @override
  String get clickpadSeekingControlsVisible => 'When controls are showing';

  @override
  String get clickpadSeekingPausedOnly => 'Only while paused';
}
