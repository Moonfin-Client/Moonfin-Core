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
  String get animeMarkerMixed => 'Mixed';

  @override
  String get animeMarkerAnimeCanon => 'Anime Canon';

  @override
  String get animeMarkerMangaCanon => 'Manga Canon';

  @override
  String get animeMarkerSubbed => 'Subbed';

  @override
  String get animeMarkerDubbed => 'Dubbed';

  @override
  String get animeMarkerSubbedAndDubbed => 'Subbed/Dubbed';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'Pending';

  @override
  String get animeMarkerRecap => 'Recap';

  @override
  String get interfaceLanguage => 'Lingua dell’interfaccia';

  @override
  String get systemLanguageDefault => 'Predefinito di sistema';

  @override
  String get signIn => 'Accedi';

  @override
  String get signingIn => 'Signing in...';

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
      'Or scan this with a phone that\'s signed in to your server';

  @override
  String get quickConnectTapOrScanHint =>
      'Tap to approve in your browser, or scan this with another device';

  @override
  String get timesUpTitle => 'Time\'s up';

  @override
  String get timesUpMessage => 'This account isn\'t available right now.';

  @override
  String timesUpResumesToday(String time) {
    return 'You can use it again today at $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'You can use it again tomorrow at $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'You can use it again on $day at $time.';
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
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

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
  String get signedInOnThisDevice => 'Signed in on this device';

  @override
  String get pinRequired => 'PIN required';

  @override
  String get passwordRequired => 'Password required';

  @override
  String continueAsUser(String name) {
    return 'Continue as $name';
  }

  @override
  String switchToUser(String name) {
    return 'Switch to $name';
  }

  @override
  String signedInAsOnServer(String user, String server) {
    return 'Signed in as $user on $server';
  }

  @override
  String get accountActive => 'Active';

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
      'Classica utilizza il layout Moonfin originale con contenuti centrati. Moderna offre un layout cinematografico e adattivo.';

  @override
  String get detailScreenStyleMoonfin => 'Classica';

  @override
  String get detailScreenStyleModern => 'Moderna';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'More Actions';

  @override
  String get spotlightCastCrewStudios => 'Cast, Crew, and Studios';

  @override
  String get spotlightChaptersExtras => 'Chapters and Extras';

  @override
  String get spotlightFileDetails => 'File Details';

  @override
  String get spotlightSimilarRecommendations => 'Similar and Recommendations';

  @override
  String get spotlightSeasonsEpisodes => 'Seasons and Episodes';

  @override
  String get spotlightMoreEpisodes => 'More Episodes';

  @override
  String get spotlightFilmography => 'Filmography';

  @override
  String get spotlightCollectionsCard => 'Collections';

  @override
  String get spotlightPlaylistOrder => 'Playlist Order';

  @override
  String get spotlightMoviesAndShows => 'Movies & Shows';

  @override
  String get spotlightSimilarSeerr => 'Similar (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Recommendations (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count facts',
      one: '1 fact',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tags',
      one: '1 tag',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count studios',
      one: '1 studio',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapters',
      one: '1 chapter',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count extras',
      one: '1 extra',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seasons',
      one: '1 season',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count movies',
      one: '1 movie',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count shows',
      one: '1 show',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tracks',
      one: '1 track',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count albums',
      one: '1 album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count collections',
      one: '1 collection',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titles',
      one: '1 title',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimalist';

  @override
  String get expandedTabs => 'Schede Espanse';

  @override
  String get expandedTabsSubtitle =>
      'Mostra automaticamente il contenuto delle schede durante la navigazione. Disattiva per aprire e chiudere ogni scheda manualmente.';

  @override
  String get showTechnicalDetails => 'Mostrare i Dettagli Tecnici?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Mostra informazioni su codec, risoluzione e stream nel riepilogo del banner';

  @override
  String get recommendationSystem => 'Sistema di raccomandazione';

  @override
  String get recommendationSystemSubtitle =>
      'Usa l\'algoritmo locale di Suggerimenti Moonfin oppure le metriche di similarità di TMDb. Nota: le raccomandazioni online richiedono l\'integrazione con Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Suggerimenti Moonfin';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Similarità TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Applicare il limite di classificazione per età?';

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
  String get rendererMode => 'Renderer';

  @override
  String get rendererModeSubtitle =>
      'Auto uses Impeller on boxes whose graphics run it smoothly and Skia everywhere else. Pick Skia if animations or video look wrong. Takes effect on the next launch.';

  @override
  String get rendererModeAuto => 'Auto';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Off because Performance is set to Reduced for this device';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Passa da Moonfin a Neon Pulse senza riavviare l\'app.';

  @override
  String get customThemeTitle => 'Tema personalizzato';

  @override
  String get customThemeSubtitle =>
      'I temi personalizzati modificano l\'aspetto di Moonfin. Scegli quello più adatto al tuo stile.';

  @override
  String get keyboardStyle => 'Keyboard Style';

  @override
  String get keyboardStyleDescription =>
      'Native uses your TV\'s own keyboard. Classic is the original Moonfin keyboard. Glass is a frosted panel with larger keys. Docked fills the bottom of the screen and shows what you type above the keys.';

  @override
  String get keyboardStyleNative => 'Native';

  @override
  String get keyboardStyleClassic => 'Classic';

  @override
  String get keyboardStyleGlass => 'Glass';

  @override
  String get keyboardStyleDocked => 'Docked';

  @override
  String get keyboardSpace => 'space';

  @override
  String get keyboardHoldForAccents => 'hold for accents';

  @override
  String get keyboardClose => 'close';

  @override
  String get controller => 'Controller';

  @override
  String get gamepadNavigation => 'Gamepad Navigation';

  @override
  String get gamepadNavigationDescription =>
      'Let a connected game controller move focus and select items';

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
  String get signInWithPlex => 'Sign in with Plex';

  @override
  String get plexLinkInstructions =>
      'Go to plex.tv/link on any device and enter this code';

  @override
  String get plexOpenLink => 'Open plex.tv/link';

  @override
  String get plexWaitingForApproval => 'Waiting for you to approve the code...';

  @override
  String get plexSignInWithPassword => 'Sign in with a password';

  @override
  String get plexVerificationCode => 'Verification code';

  @override
  String get plexNoServers => 'No Plex servers found on this account';

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
  String get gameOrientation => 'Game orientation';

  @override
  String get gameOrientationSubtitle =>
      'Screen orientation while playing games';

  @override
  String get landscape => 'Landscape';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'Impostazioni dell\'emulatore';

  @override
  String get gameNoCoreOptions =>
      'Questo core non dispone di opzioni configurabili.';

  @override
  String get gameHoldToOpenMenu => 'Tieni premuto per aprire il menu';

  @override
  String get gameKeepPlaying => 'Keep playing';

  @override
  String get gameSaveAndExit => 'Save & exit';

  @override
  String get gameExitGame => 'Exit game';

  @override
  String get gameSavingBeforeExit => 'Saving…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Could not save state. Still playing.';

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
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

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
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

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
  String get bookFormatComic => 'Comic';

  @override
  String get noBooksFound => 'Nessun libro trovato per questo autore.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

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
  String get additionalParts => 'Additional Parts';

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
      other: '$count more queued',
      one: '1 more queued',
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
  String get subtitleTrack => 'Traccia Sottotitoli';

  @override
  String get none => 'Nessuno';

  @override
  String get downloadSubtitlesLabel => 'Scarica sottotitoli…';

  @override
  String get searchOpenSubtitlesPlugin => 'Cerca con il plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Scarica Sottotitoli';

  @override
  String get searchingSubtitles => 'Ricerca sottotitoli…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

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
  String get machineTranslated => 'Machine Translated';

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
  String get showMpvStats => 'Show mpv Statistics (Shift+I)';

  @override
  String get hideMpvStats => 'Hide mpv Statistics (Shift+I)';

  @override
  String get keyboardShortcutsTitle => 'Keyboard shortcuts';

  @override
  String get keyboardShortcutsSubtitle =>
      'Keys for the app, video player and reader';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Press ? or F1 while a video plays to see this list without leaving the player.';

  @override
  String get keyboardShortcutsSectionApp => 'Everywhere';

  @override
  String get keyboardShortcutsSectionAppScope => 'On any screen';

  @override
  String get keyboardShortcutsSectionPlayer => 'Video player';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'While a video is open, playing or paused';

  @override
  String get keyboardShortcutsSectionReader => 'Book and comic reader';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'While reading a book or comic';

  @override
  String get keyNameArrowKeys => 'Arrow keys';

  @override
  String get keyNameSpace => 'Space';

  @override
  String get keyNameEnter => 'Enter';

  @override
  String get keyNameEsc => 'Esc';

  @override
  String get keyNameBackspace => 'Backspace';

  @override
  String get keyNameDelete => 'Delete';

  @override
  String get keyNamePageUp => 'Page Up';

  @override
  String get keyNamePageDown => 'Page Down';

  @override
  String get keyNameHome => 'Home';

  @override
  String get keyNameEnd => 'End';

  @override
  String get keyNameShift => 'Shift';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => 'Scroll wheel';

  @override
  String get shortcutMoveFocus => 'Move between items';

  @override
  String get shortcutActivate => 'Open the selected item';

  @override
  String get shortcutGoBack => 'Go back';

  @override
  String get shortcutToggleFullscreen => 'Fullscreen on or off';

  @override
  String get shortcutQuit => 'Quit Moonfin';

  @override
  String get shortcutPlayPause => 'Play or pause';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Show controls, or play/pause if shown';

  @override
  String get shortcutSeekBack => 'Seek back (hold for bigger jumps)';

  @override
  String get shortcutSeekForward => 'Seek forward (hold for bigger jumps)';

  @override
  String get shortcutVolumeUp => 'Volume up';

  @override
  String get shortcutVolumeDown => 'Volume down';

  @override
  String get shortcutMute => 'Mute or unmute';

  @override
  String get shortcutToggleSubtitles => 'Subtitles on or off';

  @override
  String get shortcutSlower => 'Slow down';

  @override
  String get shortcutFaster => 'Speed up';

  @override
  String get shortcutPlaybackInfo => 'Show playback information';

  @override
  String get shortcutMpvStats => 'mpv statistics on or off';

  @override
  String get shortcutRecropBlackBars => 'Recrop black bars';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Exit fullscreen, or stop if not fullscreen';

  @override
  String get shortcutHideControls => 'Hide controls';

  @override
  String get shortcutStopPlayback => 'Stop playback';

  @override
  String get shortcutNextItem => 'Next item';

  @override
  String get shortcutPreviousItem => 'Previous item';

  @override
  String get shortcutSkipSegment => 'Skip intro or credits when offered';

  @override
  String get shortcutShowShortcuts => 'Show this list';

  @override
  String get shortcutNextPage => 'Next page';

  @override
  String get shortcutPreviousPage => 'Previous page';

  @override
  String get shortcutScrollPage => 'Scroll the page (ebooks)';

  @override
  String get shortcutFirstPage => 'First page, or start of chapter';

  @override
  String get shortcutLastPage => 'Last page, or end of chapter';

  @override
  String get shortcutZoom => 'Zoom in or out (comics)';

  @override
  String get shortcutResetZoom => 'Reset zoom (comics)';

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
  String get videoRenderer => 'Video Renderer';

  @override
  String get videoRendererDescription =>
      'Native window gives the smoothest motion and sends HDR to the display untouched. Try another option if video misbehaves.';

  @override
  String get videoRendererNativeWindow => 'Native window (recommended)';

  @override
  String get videoRendererNativeHdrOnly => 'Native window for HDR only';

  @override
  String get videoRendererInApp => 'In-app (legacy)';

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
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

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
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Timeline Guida';

  @override
  String failedToLoadGuide(String error) {
    return 'Impossibile caricare la guida: $error';
  }

  @override
  String get noChannelsFound => 'Nessun canale trovato';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'IN ONDA';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

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
    return 'Next series recording: $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'Series recording is scheduled, but the guide has no upcoming episodes';

  @override
  String get seriesRecordingSkipsShowing =>
      'The series recording will skip this showing';

  @override
  String get seriesRecordingEpisodesQuestion =>
      'Which episodes should be recorded?';

  @override
  String get seriesRecordingAllEpisodes => 'All Episodes';

  @override
  String get seriesRecordingAllEpisodesDescription =>
      'Every showing, including repeats';

  @override
  String get seriesRecordingNotRecordedEpisodes =>
      'Episodes Not Already Recorded';

  @override
  String get seriesRecordingNotRecordedEpisodesDescription =>
      'Skips episodes already in your library and records each episode once';

  @override
  String get seriesRecordingNewEpisodesOnly => 'New Episodes Only';

  @override
  String get seriesRecordingNewEpisodesOnlyDescription =>
      'First airings only, no repeats';

  @override
  String get seriesRecordingSettings => 'Series Settings';

  @override
  String get seriesRecordingUpdated => 'Series recording updated';

  @override
  String get failedToUpdateSeriesRecording =>
      'Unable to update series recording';

  @override
  String get recordCurrentEpisode => 'Record This Episode';

  @override
  String get recordCurrentProgram => 'Record This Program';

  @override
  String get cancelCurrentRecording => 'Cancel This Recording';

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
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Chiudi';

  @override
  String failedToPlayChannel(String name) {
    return 'Impossibile riprodurre $name';
  }

  @override
  String get playbackStreamLost =>
      'Playback stopped and could not be recovered.';

  @override
  String get playbackVideoUnsupported =>
      'This device can\'t play this video\'s format. Try an external player.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Reconnecting… ($attempt of $total)';
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
  String get savedMedia => 'Media Salvati';

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
  String get activeDownloads => 'Active Downloads';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used of $limit';
  }

  @override
  String get savedMediaSelectItems => 'Select items';

  @override
  String get savedMediaNoDownloads => 'Nothing saved yet';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Downloads you start appear here and play without a connection.';

  @override
  String get savedMediaNoActiveDownloads => 'Nothing downloading right now';

  @override
  String get savedMediaNoResults => 'No downloads match that search';

  @override
  String get savedMediaPlayFromStart => 'Play from start';

  @override
  String get savedMediaGoToDetails => 'Go to details';

  @override
  String get savedMediaDeleteDownload => 'Delete download';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Delete $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delete $count episodes',
      one: 'Delete 1 episode',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Open show';

  @override
  String get savedMediaPlayNextUnwatched => 'Play next unwatched';

  @override
  String get savedMediaRead => 'Read';

  @override
  String get savedMediaCancelDownload => 'Cancel download';

  @override
  String get sortBySize => 'Size';

  @override
  String get sortByName => 'Name';

  @override
  String get sortByDateAdded => 'Date added';

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
  String get showLoadingAnimationText => 'Show Text';

  @override
  String get loadingAnimationPreview => 'Preview';

  @override
  String get snow => 'Neve';

  @override
  String get fireworks => 'Fuochi d\'Artificio';

  @override
  String get confetti => 'Coriandoli';

  @override
  String get fallingLeaves => 'Foglie Cadenti';

  @override
  String get seasonalChristmas => 'Christmas';

  @override
  String get seasonalPetals => 'Spring Petals';

  @override
  String get seasonalFireflies => 'Fireflies';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Density';

  @override
  String get seasonalDensityLight => 'Light';

  @override
  String get seasonalDensityNormal => 'Normal';

  @override
  String get seasonalDensityHeavy => 'Heavy';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => 'Seasonal Row';

  @override
  String get seasonalRowDescription =>
      'Show a row of holiday movies from your library, with Seerr suggestions when available.';

  @override
  String get seasonalRowSubtitle => 'Seasonal';

  @override
  String get seasonalRowCountry => 'Country';

  @override
  String get seasonalRowCountryAuto => 'Automatic';

  @override
  String get countryUnitedStates => 'United States';

  @override
  String get countryCanada => 'Canada';

  @override
  String get seasonalRowCountryOther => 'Other';

  @override
  String get seasonalRowHolidays => 'Holidays';

  @override
  String get seasonalRowHolidaysHint => 'Untick a holiday to hide its row.';

  @override
  String get holidayNewYear => 'New Year\'s';

  @override
  String get holidayValentines => 'Valentine\'s Day';

  @override
  String get holidayEaster => 'Easter';

  @override
  String get holidayPride => 'Pride';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Thanksgiving';

  @override
  String get holidayChristmas => 'Christmas Movies';

  @override
  String get holidayLunarNewYear => 'Lunar New Year';

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
  String get detailsBackgroundBlur => 'Sfocatura Sfondo Dettagli';

  @override
  String get detailsBackgroundOpacity => 'Opacità dello sfondo Dettagli';

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
  String get autoCrop => 'Ritaglio Automatico';

  @override
  String get cropBlackBars => 'Crop Black Bars';

  @override
  String get settingsCropBlackBarsDescription =>
      'Detect encoded letterbox bars after playback starts, crop them, then fill the screen. Recrop from the player zoom button.';

  @override
  String get cropBlackBarsRecropInterval => 'Recrop Interval';

  @override
  String get cropBlackBarsOnce => 'Once at start';

  @override
  String get cropBlackBarsEverySecond => 'Every second';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Follow aspect ratio changes during playback.';

  @override
  String get playerRecroppingBlackBars => 'Recropping black bars';

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
  String get trickplayDisplayStyleSingle => 'Single Thumbnail';

  @override
  String get trickplayDisplayStyleStrip => 'Filmstrip';

  @override
  String get trickplayModeFull => 'Full Screen';

  @override
  String get trickplaySettingsPreviewHint =>
      'Drag the slider to preview scrubbing';

  @override
  String get trickplayPreviewScale => 'Preview Size';

  @override
  String get trickplayVerticalOffset => 'Distance From Seekbar';

  @override
  String get trickplayFollowScrubPosition => 'Follow Scrub Position';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'Preview slides along the seekbar as you scrub, instead of staying centered';

  @override
  String get trickplayPauseWhileScrubbing => 'Pause While Scrubbing';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'Playback pauses while you seek and resumes when you press play. Turn this off to keep playing and jump straight to the new spot';

  @override
  String get showDescriptionOnPause => 'Mostra Descrizione in Pausa';

  @override
  String get dimVideoShowOverview =>
      'Oscura il video e mostra il testo della panoramica in pausa';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

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
  String get invertGestureIndicators => 'Invert Gesture Indicators';

  @override
  String get invertGestureIndicatorsDescription =>
      'Place brightness and volume visual indicators on same or opposite side of screen from swipe';

  @override
  String get gestureIndicatorSame => 'Same';

  @override
  String get gestureIndicatorInverted => 'Inverted';

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
  String get actionButtonsOnScreen => 'Action Buttons on Screen';

  @override
  String get actionButtonsOnScreenDescription =>
      'Customize how many action buttons appear before folding into the More Actions menu.';

  @override
  String get actionButtonsOnScreenAuto => 'Auto (Theme Default)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (Play only)';

  @override
  String get actionButtonsOnScreenAll => 'All (Horizontal Scroll)';

  @override
  String get detailMetadata => 'Metadata Row';

  @override
  String get detailMetadataDescription =>
      'Choose and reorder what metadata the details screen shows';

  @override
  String get detailMetadataSectionDescription =>
      'Turn metadata items on or off, and arrange the order they appear on the details screen. Each kind of device keeps its own list.';

  @override
  String get detailMetadataYear => 'Release Year';

  @override
  String get detailMetadataParentalRating => 'Parental Rating';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Runtime & Seasons';

  @override
  String get detailMetadataStatus => 'Series Status';

  @override
  String get detailMetadataStatusSubtitle =>
      'Shows whether the series is continuing, ended, or returning';

  @override
  String get detailMetadataGenres => 'Genres';

  @override
  String get detailMetadataSeerrAvailability => 'Seerr Availability';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Shows request and media availability status from Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Upcoming Episodes';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Uses Sonarr and TMDB to show upcoming release dates';

  @override
  String get detailSections => 'Sections';

  @override
  String get detailSectionsDescription =>
      'Choose which parts of the Details screen to show';

  @override
  String get detailSectionsScreenDescription =>
      'Only the sections the current Details screen style can show are listed. Hiding one hides it in every style that has it.';

  @override
  String get detailSectionGroupHeader => 'Header';

  @override
  String get detailSectionGroupSections => 'Sections';

  @override
  String get detailSectionGroupPerson => 'Person pages';

  @override
  String get detailSectionGroupCollection => 'Collection pages';

  @override
  String get detailSectionGroupOther => 'Other';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle => 'Shows the title as text when off';

  @override
  String get detailSectionTagline => 'Tagline';

  @override
  String get detailSectionPoster => 'Poster';

  @override
  String get detailSectionVersionBadge => 'Version badge';

  @override
  String get detailSectionUpNext => 'Next Up';

  @override
  String get detailSectionLyrics => 'Lyrics';

  @override
  String get detailSectionCast => 'Cast';

  @override
  String get detailSectionCastSubtitle => 'Also on collection pages';

  @override
  String get detailSectionCrew => 'Directors & writers';

  @override
  String get detailSectionStudios => 'Studios';

  @override
  String get detailSectionChapters => 'Chapters';

  @override
  String get detailSectionExtras => 'Extras';

  @override
  String get detailSectionCollections => 'Collections';

  @override
  String get detailSectionMoreLikeThis => 'More Like This';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Also similar albums and artists';

  @override
  String get detailSectionMoreEpisodes => 'More episodes';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'On episode pages';

  @override
  String get detailSectionMediaInfo => 'Media info';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'File, streams and Direct Play check';

  @override
  String get detailSectionSeerrGenresTags => 'Genres & tags';

  @override
  String get detailSectionSeerrStats => 'Stats';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => 'Recommendations';

  @override
  String get detailSectionSeerrSimilar => 'Similar titles';

  @override
  String get detailSectionSeerrCollection => 'Collection banner';

  @override
  String get detailSectionSeerrPersonAppearances => 'Appearances';

  @override
  String get detailSectionSeerrPersonCrew => 'Crew credits';

  @override
  String get detailSectionPersonPagesSubtitle => 'On person pages';

  @override
  String get detailSectionBiography => 'Biography';

  @override
  String get detailSectionBirthplace => 'Birthplace';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => 'Guest appearances';

  @override
  String get detailSectionMusicVideos => 'Music videos';

  @override
  String get detailSectionPlaylistOrder => 'Playlist order';

  @override
  String get detailSectionBookGenres => 'Book genres';

  @override
  String get detailSectionPhotoExif => 'Photo details';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Next: $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Today';

  @override
  String get upcomingEpisodeTomorrow => 'Tomorrow';

  @override
  String get moveUp => 'Sposta Su';

  @override
  String get moveDown => 'Sposta Giù';

  @override
  String get buttonOrderHint =>
      'Usa le frecce per cambiare l\'ordine. Con un telecomando, sinistra e destra spostano il pulsante evidenziato. Se ne disattivi uno, questo finisce in fondo all\'elenco.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Only shows while you\'re in a SyncPlay group';

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
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

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
  String get settingsAudioPassthroughOutput => 'Passthrough Output';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Who packs bitstreams for the HDMI link. Try the app packer if passthrough is silent or glitchy on this device.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatic, system packer (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec => 'App packer (AudioTrack IEC)';

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
  String get subtitleDownloadLanguages => 'Subtitle Download Languages';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Languages to search when downloading subtitles, up to 5. Auto searches one language picked from your default subtitle language or the video.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Preferred Secondary Subtitle Language';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Show a second subtitle track at the same time. The subtitle menu then asks for the primary or secondary track first';

  @override
  String get defaultToNoSubtitles => 'Nessun Sottotitolo Predefinito';

  @override
  String get turnOffSubtitlesByDefault =>
      'Disattiva i sottotitoli per impostazione predefinita';

  @override
  String get subtitleSize => 'Dimensione Sottotitoli';

  @override
  String get primarySubtitleSlot => 'Primary Track';

  @override
  String get secondarySubtitleSlot => 'Secondary Track';

  @override
  String get secondarySubtitleTrack => 'Secondary Subtitles';

  @override
  String get secondaryDelayAdjustment => 'Secondary Delay Adjustment';

  @override
  String decreaseValue(String setting) {
    return 'Decrease $setting';
  }

  @override
  String increaseValue(String setting) {
    return 'Increase $setting';
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
  String get semiTransparentWhite => 'Semi-transparent White';

  @override
  String get lightGray => 'Light Gray';

  @override
  String get darkGray => 'Dark Gray';

  @override
  String get blue => 'Blue';

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
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar => 'Mostra Librerie nella Barra Strumenti';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

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
  String get mergeRecentRowsByType => 'Unisci Righe Recenti per Tipo';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Combina le librerie separate dello stesso tipo nelle righe home Aggiunti di Recente e Usciti di Recente.';

  @override
  String get libraryView => 'Vista Libreria';

  @override
  String get libraryStyle => 'Video Library Style';

  @override
  String get libraryStyleDescription =>
      'Classic is the original header with icon buttons. Modern puts search and labeled sort, group and filter buttons in one bar. Docked moves the controls and the letters into a side panel.';

  @override
  String get libraryStyleDescriptionPhone =>
      'Classic is the original header with icon buttons. Modern adds labeled sort, group and filter chips under the search. Docked keeps the controls in a bar at the bottom of the screen.';

  @override
  String get libraryStyleClassic => 'Classic';

  @override
  String get libraryStyleModern => 'Modern';

  @override
  String get libraryStyleDocked => 'Docked';

  @override
  String get bookLibraryStyle => 'Book Library Style';

  @override
  String get bookLibraryStyleDescription =>
      'Classic is the original shelves under a featured title. Reading Room leads with what you\'re reading on large cards. Bookstore browses the whole library in a grid.';

  @override
  String get bookLibraryStyleClassic => 'Classic';

  @override
  String get bookLibraryStyleReadingRoom => 'Reading Room';

  @override
  String get bookLibraryStyleBookstore => 'Bookstore';

  @override
  String get musicLibraryStyle => 'Music Library Style';

  @override
  String get musicLibraryStyleDescription =>
      'Classic is the original rows under a Jump Back In card. Quick Access starts with a grid of your recent albums and playlists. Immersive leads with the album you\'re listening to.';

  @override
  String get musicLibraryStyleClassic => 'Classic';

  @override
  String get musicLibraryStyleQuickAccess => 'Quick Access';

  @override
  String get musicLibraryStyleImmersive => 'Immersive';

  @override
  String get jumpBackIn => 'Jump Back In';

  @override
  String get yourPlaylists => 'Your Playlists';

  @override
  String get fromThisAlbum => 'From This Album';

  @override
  String get searchMusic => 'Search Music';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count series',
      one: '1 series',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count in progress';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Browse all $count titles',
      one: 'Browse 1 title',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Search books';

  @override
  String get libraryShowLabel => 'Show';

  @override
  String get libraryAToZ => 'A to Z';

  @override
  String get libraryJumpToLetter => 'Jump to letter';

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
  String get libraryOrder => 'Library Order';

  @override
  String get libraryOrderSubtitle => 'Choose the order of your libraries';

  @override
  String get libraryOrderDescription =>
      'Your libraries appear in this order on My Media, the recently added rows and the navigation bar. The order is saved to your server account, so other apps you sign in to use it too.';

  @override
  String get libraryOrderTvHint =>
      'Press left or right to move the highlighted library.';

  @override
  String get libraryOrderSaveFailed => 'Couldn\'t save the library order';

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
  String get peekHomeRows => 'Peek Home Rows';

  @override
  String get peekHomeRowsDescription =>
      'Show the top half of the first row along the bottom of the media bar';

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
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Sottotitoli dei Trailer';

  @override
  String get trailerCaptionsDescription =>
      'Mostra i sottotitoli sui trailer di YouTube nella barra media';

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
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

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
  String get continueWatchingDefaultAction => 'Default Action';

  @override
  String get continueWatchingDefaultActionDescription =>
      'What selecting a Continue Watching or Next Up item does';

  @override
  String get goToDetailsScreen => 'Go to Details';

  @override
  String get playImmediately => 'Play immediately';

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
  String get fullScreenRows => 'Righe Home Espanse';

  @override
  String get fullScreenRowsDescription =>
      'Limita le righe home a 1 per schermata';

  @override
  String get homeRowsPadding => 'Margine interno della riga Home';

  @override
  String get homeRowsPaddingDescription =>
      'Personalizza il margine interno tra le righe della Home';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get moonbaseAddress => 'Moonbase Address';

  @override
  String get pluginConnected => 'Connected';

  @override
  String pluginConnectedVersion(String version) {
    return 'Connected, version $version';
  }

  @override
  String get pluginSyncOn => 'Sync on';

  @override
  String get pluginSyncOff => 'Sync off';

  @override
  String get syncProfileDescription =>
      'This device syncs with the profile you pick until you pick another.';

  @override
  String get profileAppliesEverywhere => 'Applies everywhere';

  @override
  String get profileOverridesGlobal => 'Overrides Global';

  @override
  String get profileThisDevice => 'This device';

  @override
  String get profileLoad => 'Load';

  @override
  String get profileLoadSubtitle => 'Server to this device';

  @override
  String get profileSaveSubtitle => 'This device to server';

  @override
  String resetNamedProfile(String profile) {
    return 'Reset $profile Profile';
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
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

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
  String get showMissingCollectionItems => 'Show Missing Collection Items';

  @override
  String get showMissingCollectionItemsDesc =>
      'Include missing items on Collection pages';

  @override
  String get showSeerrAvailabilityBadges => 'Show Seerr Availability Badges';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Show season availability badges on media details pages';

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
  String get seerrDownloading => 'Downloading';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Downloading · $done / $total';
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
  String get requestedByLabel => 'Requested by';

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
      'Live TV needs Emby Premiere. Without it the server doesn\'t import channels or record anything.';

  @override
  String get adminPremiereNoteBackups =>
      'Backup & Restore needs Emby Premiere once its trial ends.';

  @override
  String get adminGeneralRunAtStartup => 'Run the server at startup';

  @override
  String get adminGeneralLaunchWebApp =>
      'Open the web app in a browser when the server starts';

  @override
  String get adminGeneralBannerText => 'Home screen banner text';

  @override
  String get adminGeneralBannerTextHelp =>
      'Shown to every user on their home screen';

  @override
  String get adminGeneralSectionMaintenance => 'Maintenance mode';

  @override
  String get adminGeneralMaintenanceMode =>
      'Put the server into maintenance mode';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Users only see the maintenance message.';

  @override
  String get adminGeneralMaintenanceMessage => 'Maintenance message';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Leave it blank for a general message in each user\'s language.';

  @override
  String get adminGeneralSectionUpdates => 'Automatic updates';

  @override
  String get adminGeneralAutoUpdate => 'Update the server automatically';

  @override
  String get adminGeneralAutoRestart =>
      'Restart automatically to apply updates';

  @override
  String get adminGeneralAutoRestartHelp =>
      'The server only restarts while no users are active.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'After a system event ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Needs Emby Premiere after a 14-day free trial';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby backs up through its Backup & Restore plugin.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'The Backup & Restore plugin isn\'t installed. Install it from the plugin catalog to back up this server.';

  @override
  String get adminEmbyBackupNow => 'Back up now';

  @override
  String get adminEmbyFullBackup => 'Full backup';

  @override
  String get adminEmbyLightBackups => 'Database backups';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return 'Restore $name? It replaces this server\'s libraries, settings, users and passwords, and the server shuts down when it\'s done. You may need to start it again yourself.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Restore the server ID';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Turn this off when you restore the same backup onto more than one server.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'The restore is done and the server is shutting down. Start it again if it doesn\'t restart by itself.';

  @override
  String get adminHiddenRemotely =>
      'Hide from login screens when connected remotely';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Hide from login screens on devices they\'ve never signed in on';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Limits how many videos this user can play at once.';

  @override
  String get adminUnlimited => 'Unlimited';

  @override
  String get adminAutoRemoteQuality => 'Auto remote quality (Mbps)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Used remotely when the player is set to auto quality. Leave empty to detect it.';

  @override
  String get adminAllowCameraUpload => 'Allow camera upload';

  @override
  String get adminAllowSubtitleDownloading => 'Allow subtitle downloading';

  @override
  String get adminAllowMediaConversion => 'Allow media conversion';

  @override
  String get adminAllowSyncTranscoding =>
      'Allow downloads that need transcoding';

  @override
  String get adminAllowSharingPersonalItems =>
      'Allow sharing playlists with other users';

  @override
  String get adminAllowPreferenceAccess =>
      'Allow changing their own password and profile image';

  @override
  String get adminTagMode => 'Tag mode';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser => 'Emby Connect username or email';

  @override
  String get adminEmbyConnectHelp =>
      'Lets this user sign in from any Emby app without knowing the server address.';

  @override
  String get adminEmbyConnectLink => 'Link';

  @override
  String get adminEmbyConnectUnlink => 'Unlink';

  @override
  String get adminEmbyConnectLinked => 'Linked to Emby Connect';

  @override
  String get adminEmbyConnectPending =>
      'Invitation sent. The link is made once they accept it.';

  @override
  String get adminEmbyConnectUnlinked => 'Emby Connect link removed';

  @override
  String get adminEmbyConnectNotFound =>
      'No Emby Connect account has that username or email.';

  @override
  String get adminLibImportPlaylists => 'Import playlist files';

  @override
  String get adminLibExcludeFromSearch => 'Exclude from global search';

  @override
  String get adminLibForcedSubtitlesOnly => 'Download forced subtitles only';

  @override
  String get adminLibImportCollections =>
      'Import collections from metadata downloaders';

  @override
  String get adminLibThumbnailInterval => 'Preview thumbnail interval';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Every $count seconds';
  }

  @override
  String get adminLibThumbnailAtChapters => 'At chapter markers';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Save preview thumbnails into media folders';

  @override
  String get adminLibrarySectionMarkers => 'Intro markers';

  @override
  String get adminLibIntroDetection => 'Detect intros';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Detect intros during the library scan';

  @override
  String get adminProviderEmbyGuide => 'Emby Guide Data';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Select a lineup. If none are listed, check the postal code. Lineups need Emby Premiere.';

  @override
  String get adminLiveTvWakeServer => 'Wake the server for recordings';

  @override
  String get adminDrawerLiveTvChannels => 'Live TV Channels';

  @override
  String get adminPageDescLiveTvChannels =>
      'Turn channels on and off and set their order';

  @override
  String get adminLiveTvChannelsEmpty =>
      'No channels yet. They show up here once a tuner is set up and the server has imported its channels.';

  @override
  String get adminTranscodingHwaAdvanced => 'Advanced';

  @override
  String get adminTranscodingHwaHelp =>
      'Advanced lets you pick and order the hardware codecs.';

  @override
  String get adminTranscodingHwDecoders => 'Preferred hardware decoders';

  @override
  String get adminTranscodingHwEncoders => 'Preferred hardware encoders';

  @override
  String get adminTranscodingTempPathHelp =>
      'Where the transcoder keeps its working files. Leave it empty to use the server\'s data folder.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Slows transcoding down once enough is buffered, to lower CPU use.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Raises the volume when audio is downmixed. 1 keeps the original volume.';

  @override
  String get adminTranscodingFontExtraction =>
      'Allow font extraction on the fly';

  @override
  String get adminTranscodingMaxResolution => 'Max transcoding resolution';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'A limit on every transcode, whatever quality the app asks for.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tone mapping in software transcodes';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tone mapping in hardware transcodes';

  @override
  String get adminTranscodingToneMapHelp =>
      'Keeps HDR video from looking dim and washed out when it\'s transcoded.';

  @override
  String get adminNetworkingLocalAddress => 'Local IP address';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'The local address the server gives to apps. Leave it empty to detect it automatically.';

  @override
  String get adminNetworkingBehindProxy =>
      'HTTPS is handled by a reverse proxy';

  @override
  String get adminNetworkingExternalDomain => 'External domain';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'A domain or dynamic DNS name for remote connections, without the protocol or port. A custom certificate needs it.';

  @override
  String get adminNetworkingUpnp => 'Enable automatic port mapping';

  @override
  String get adminNetworkingUpnpHelp =>
      'Tries to map the public port to the local port with UPnP. Some routers don\'t support it.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Read proxy headers for client addresses';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Uses headers like X-Forwarded-For to find each client\'s address. Only turn this on behind a reverse proxy.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Only when they hold remote addresses';

  @override
  String get adminNetworkingIpv4Only => 'Use IPv4 for outgoing requests';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'For when metadata providers and other services can\'t be reached over IPv6.';

  @override
  String get adminOnePerLine => 'One per line';

  @override
  String get adminStreamingStreamLimit => 'Max simultaneous video streams';

  @override
  String get adminStreamingStreamLimitHelp =>
      'How many videos can play at once across the server. 0 means no limit.';

  @override
  String get adminSyncJobsConversions => 'Conversion jobs';

  @override
  String get adminSyncJobsDownloads => 'Download jobs';

  @override
  String get adminSyncJobsEmpty => 'No jobs';

  @override
  String get adminSyncJobCancel => 'Cancel job';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return 'Cancel $name and remove it from the list?';
  }

  @override
  String get adminSyncJobConverting => 'Converting';

  @override
  String get adminSyncJobReady => 'Ready to transfer';

  @override
  String get adminSyncJobTransferring => 'Transferring';

  @override
  String get adminSyncJobCompletedWithError => 'Completed with errors';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Database';

  @override
  String get adminPageDescDatabase => 'Cache size and upkeep';

  @override
  String get adminDatabaseWarning =>
      'These are advanced options. Leave them at their defaults unless you have a reason to change them.';

  @override
  String get adminDatabaseCacheSize => 'Database cache size (MB)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'How much of each database file the server keeps in memory. More can make the server faster. Takes effect after a restart.';

  @override
  String get adminDatabaseOptimize =>
      'Optimize the database when the server shuts down';

  @override
  String get adminDatabaseOptimizeHelp =>
      'Usually this does nothing, but now and then it runs an analysis that helps the server\'s queries. Shutdowns can take longer.';

  @override
  String get adminDatabaseAnalysisLimit => 'Analysis row limit';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'About how many rows of each index the optimize step reads. More rows work better but can slow shutdowns.';

  @override
  String get adminDatabaseVacuum => 'Vacuum the database on the next startup';

  @override
  String get adminDatabaseVacuumHelp =>
      'Rebuilds the database file so it takes up the least space, which can help performance. The server can\'t be used while it runs and shows no progress, so don\'t force it closed. It turns itself back off after that startup.';

  @override
  String get adminDrawerCinemaIntros => 'Cinema Intros';

  @override
  String get adminPageDescCinemaIntros => 'Trailers and intros before playback';

  @override
  String get adminCinemaIntrosPlayBefore => 'Play intros before';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Include trailers from new and upcoming movies';

  @override
  String get adminCinemaIntrosOlder => 'Include trailers from older movies';

  @override
  String get adminCinemaIntrosLibrary =>
      'Include trailers from movies in my libraries';

  @override
  String get adminCinemaIntrosLibraryHelp => 'Needs local trailers set up.';

  @override
  String get adminCinemaIntrosCount => 'Number of trailers to play';

  @override
  String get adminCinemaIntrosParental => 'Smart parental control';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Only picks trailers rated the same as or lower than what\'s being watched.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Only play intros before unwatched content';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Only play trailers similar to what\'s being watched';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'Based on shared genres, tags, studios and so on.';

  @override
  String get adminCinemaIntrosCustom => 'Custom intros';

  @override
  String get adminCinemaIntrosCustomPath => 'Custom intros folder';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'A folder of videos. One is picked at random and plays after the trailers.';

  @override
  String get adminCinemaIntrosCodecPath => 'Codec intros folder';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'A folder of videos. One whose file name matches the video codec, audio codec, audio profile or a tag plays before the main feature.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna => 'Play To and the DLNA server';

  @override
  String get adminDlnaPlayTo => 'Enable DLNA Play To';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby can find devices on your network and control them remotely.';

  @override
  String get adminDlnaServer => 'Enable the DLNA server';

  @override
  String get adminDlnaServerHelp =>
      'Lets the server stream media to DLNA devices.';

  @override
  String get adminDlnaDefaultUser => 'Default user';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Whose libraries connected devices see. A device profile can override it.';

  @override
  String get adminDlnaDebugLog => 'Enable DLNA debug logging';

  @override
  String get adminDlnaDebugLogHelp =>
      'Makes large log files. Only turn it on while troubleshooting.';

  @override
  String get adminDrawerCameraUpload => 'Camera Upload';

  @override
  String get adminPageDescCameraUpload => 'Where photos from phones are saved';

  @override
  String get adminCameraUploadPath => 'Camera upload folder';

  @override
  String get adminCameraUploadPathHelp =>
      'Leave it blank to use the default folder. A custom folder also has to be added as a library.';

  @override
  String get adminCameraUploadSubfolders => 'Make a subfolder for each device';

  @override
  String get adminDrawerConversions => 'Conversions';

  @override
  String get adminPageDescConversions => 'Converted media and downloads';

  @override
  String get adminConversionsTempPath => 'Temporary file folder';

  @override
  String get adminConversionsTempPathHelp =>
      'Where media is kept while it\'s being converted.';

  @override
  String get adminConversionsFullSpeed => 'Convert at full speed';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Conversions run slowly by default to keep the load down.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'License status and key';

  @override
  String get adminPremiereActive => 'Premiere is active on this server.';

  @override
  String get adminPremiereInactive => 'This server has no Premiere key.';

  @override
  String get adminPremiereKeyInvalid =>
      'A key is set but isn\'t active. It may be mistyped or expired.';

  @override
  String get adminPremiereCurrentKey => 'Current key';

  @override
  String get adminPremiereNewKey => 'New key';

  @override
  String get adminPremiereNewKeyHint =>
      'Paste the key from your Emby Premiere email.';

  @override
  String get adminPremiereSaveKey => 'Save key';

  @override
  String get adminPremiereRemoveKey => 'Remove key';

  @override
  String get adminPremiereKeyRejected =>
      'Emby saved the key but didn\'t accept it.';

  @override
  String get adminPremiereLoadFailed => 'Couldn\'t load the Premiere status';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere required';

  @override
  String get embyPremiereRequiredBody =>
      'This needs an active Emby Premiere subscription on the server.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'This needs an active Emby Premiere subscription. Emby keeps the setting but won\'t use it until Premiere is active.';

  @override
  String get embyPremiereLearnMore => 'Learn more';

  @override
  String get embyPremiereSaveAnyway => 'Save anyway';

  @override
  String get embyPremiereEnterKey => 'Enter key';

  @override
  String get adminPremiereNote =>
      'Needs Emby Premiere. The server keeps this setting but won\'t use it until Premiere is active.';

  @override
  String adminExternalIdLabel(String name) {
    return '$name Id';
  }

  @override
  String get adminExternalIdTypePerson => 'Person';

  @override
  String get adminExternalIdTypeArtist => 'Artist';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Album Artist';

  @override
  String get adminExternalIdTypeOtherArtist => 'Other Artist';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Release Group';

  @override
  String get adminExternalIdTypeBook => 'Book';

  @override
  String get adminPlaybackHwAccelWarning =>
      'Hardware acceleration can be unstable on some systems. Keep the operating system and video drivers up to date, and set this back to None if video stops playing.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Changes to metadata settings apply to new content. To update existing content, refresh it from its detail page or refresh the library.';

  @override
  String get adminLibFetcherSettings => 'Fetcher settings';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Image options for $type';
  }

  @override
  String get adminLibFetchImages => 'Fetch images';

  @override
  String get adminLibMaxBackdrops => 'Maximum number of backdrops per item';

  @override
  String get adminLibMinBackdropWidth => 'Minimum backdrop download width';

  @override
  String get adminImageTypeArt => 'Clearart';

  @override
  String get adminImageTypeBox => 'Box';

  @override
  String get adminImageTypeBoxRear => 'Box (back)';

  @override
  String get adminImageTypeDisc => 'Disc';

  @override
  String get adminImageTypeMenu => 'Menu';

  @override
  String get adminActivityMediaDetails => 'Media details';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'e.g. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Original language';

  @override
  String get adminMetadataFieldDateAdded => 'Date added';

  @override
  String get adminMetadataFieldArtists => 'Artists';

  @override
  String get adminMetadataFieldAlbumArtists => 'Album artists';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Series name';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Episode number';

  @override
  String get adminMetadataFieldSeasonNumber => 'Season number';

  @override
  String get adminMetadataFieldTrackNumber => 'Track number';

  @override
  String get adminMetadataFieldDiscNumber => 'Disc number';

  @override
  String get adminMetadataFieldAirTime => 'Air time';

  @override
  String get adminMetadataFieldRuntime => 'Runtime in minutes';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Place of birth';

  @override
  String get adminMetadataFieldBirthDate => 'Birth date';

  @override
  String get adminMetadataFieldBirthYear => 'Birth year';

  @override
  String get adminMetadataFieldDeathDate => 'Death date';

  @override
  String get adminMetadataFieldAspectRatio => 'Original aspect ratio';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Airs before season';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Airs after season';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Airs before episode';

  @override
  String get adminMetadataNamesHelp =>
      'Separate several names with a semicolon.';

  @override
  String get adminMetadataSectionRatings => 'Ratings';

  @override
  String get adminMetadataItemLocked =>
      'This item\'s metadata is locked. Unlock it before you identify it.';

  @override
  String get adminMetadataNameOrIdRequired => 'Enter a name or an external ID.';

  @override
  String get adminLibMetadataReaders => 'Metadata readers';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Similar item providers: $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Media segment providers';

  @override
  String get adminLibEnableLibrary => 'Enable the library';

  @override
  String get adminLibEnableLibraryHelp =>
      'Disabling the library hides it from all user views.';

  @override
  String get adminLibSaveLyricsWithMedia => 'Save lyrics into media folders';

  @override
  String get adminLibUseCustomTagDelimiters => 'Use custom tag delimiter';

  @override
  String get adminLibCustomTagDelimiters => 'Custom tag delimiter';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Characters to treat as delimiters that separate tags.';

  @override
  String get adminLibDelimiterWhitelist => 'Delimiter whitelist';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Items to leave out of tag splitting, one per line.';

  @override
  String get adminLibDownloadLanguages => 'Download languages';

  @override
  String get adminLibraryFolderRequired =>
      'Add at least one folder to this library.';

  @override
  String get adminRenameLibraryWarning =>
      'Renaming a library loses all of its metadata. Proceed with caution.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Remove the library \"$name\"? Files on disk are not deleted.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'These media locations will be removed from the library:';

  @override
  String get adminRefreshMode => 'Refresh mode';

  @override
  String get adminRefreshModeScan => 'Scan for new and updated files';

  @override
  String get adminRefreshModeMissing => 'Search for missing metadata';

  @override
  String get adminReplaceTrickplayImages => 'Replace existing trickplay images';

  @override
  String get adminRefreshDialogHelp =>
      'Metadata is refreshed based on the settings and internet services enabled in the dashboard.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown of $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuners and guide';

  @override
  String get adminLiveTvTabRecordings => 'Recordings';

  @override
  String get adminLiveTvAddTuner => 'Add tuner device';

  @override
  String get adminLiveTvEditTuner => 'Edit tuner device';

  @override
  String get adminLiveTvTunerType => 'Tuner type';

  @override
  String get adminLiveTvDetectDevices => 'Detect my devices';

  @override
  String get adminLiveTvNoNewDevices => 'No new devices found';

  @override
  String get adminLiveTvDrmNote => 'Channels with DRM will not be imported.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner saved';

  @override
  String get adminLiveTvDeleteTuner => 'Delete tuner device';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Are you sure you want to delete this tuner device?';

  @override
  String get adminLiveTvDeleteProvider => 'Delete guide provider';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Are you sure you want to delete this guide provider?';

  @override
  String get adminLiveTvProviderSaved => 'Guide provider saved';

  @override
  String get adminLiveTvAddProvider => 'Add provider';

  @override
  String get adminLiveTvRefreshGuide => 'Refresh guide data';

  @override
  String get adminLiveTvMapChannels => 'Map channels';

  @override
  String get adminLiveTvNoTunerChannels => 'No tuner channels found';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'A path or URL to an XMLTV file. The server reads it and checks it for updates. You are responsible for creating and updating the file.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Create an account at $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Sign in';

  @override
  String get adminLiveTvSdLineup => 'Lineup';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Select a lineup. If none are listed, check your username, password and postal code.';

  @override
  String get adminLiveTvGuideDays => 'Number of days of guide data to download';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'More days let you schedule further ahead and see more listings, but the download takes longer. Automatic picks a value from the number of channels.';

  @override
  String get adminLiveTvRecordingPath => 'Default recording path';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Where recordings are saved. If empty, the server\'s program data folder is used.';

  @override
  String get adminLiveTvStartWhenPossible => 'Start when possible';

  @override
  String get adminLiveTvStopWhenPossible => 'Stop when possible';

  @override
  String get adminLiveTvMinutesBefore => 'minutes before';

  @override
  String get adminLiveTvMinutesAfter => 'minutes after';

  @override
  String get adminLiveTvSectionGuide => 'Guide data';

  @override
  String get adminLiveTvSectionDefaultRecording => 'Default recording settings';

  @override
  String get adminLiveTvSectionMetadata => 'Recording metadata';

  @override
  String adminUserLastActivity(String time) {
    return 'Last activity $time';
  }

  @override
  String get adminCurrentPassword => 'Current password';

  @override
  String get adminChannelAccess => 'Channel access';

  @override
  String get adminDeviceAccess => 'Device access';

  @override
  String get adminDeleteFromAllLibraries => 'All libraries';

  @override
  String get adminUserDisabledBanner =>
      'This user is disabled. Turn off Disabled under Permissions to let them sign in again.';

  @override
  String get adminNewPasswordEmpty => 'New password cannot be empty';

  @override
  String get adminScheduleStartBeforeEnd =>
      'The start time must be before the end time';

  @override
  String get adminDashboardAlerts => 'Alerts';

  @override
  String get adminSessionGoHome => 'Go to home screen';

  @override
  String get adminPlayMethodRemux => 'Remuxing';

  @override
  String get adminPlayMethodDirectStream => 'Direct streaming';

  @override
  String get adminPlayMethodDirectPlay => 'Direct playing';

  @override
  String get adminLogLevelTrace => 'Trace';

  @override
  String get adminLogLevelDebug => 'Debug';

  @override
  String get adminLogLevelInformation => 'Information';

  @override
  String get adminLogLevelWarning => 'Warning';

  @override
  String get adminLogLevelError => 'Error';

  @override
  String get adminLogLevelCritical => 'Critical';

  @override
  String get adminLogLevelNone => 'None';

  @override
  String get adminActivityAllUsers => 'All users';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Last ran $time, taking $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Failed';

  @override
  String get adminTaskResultCancelled => 'Cancelled';

  @override
  String get adminTaskResultAborted => 'Aborted by server shutdown';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '${seconds}s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Delete task trigger';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Are you sure you want to delete this task trigger?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Every $minutes minutes';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Every $hours hours';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes minutes';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours hours';
  }

  @override
  String get adminTimeLimitHours => 'Time limit (hours)';

  @override
  String get adminTranscodingDecodingFor => 'Enable hardware decoding for';

  @override
  String get adminTranscodingThreadCountHelp =>
      'The most threads a transcode can use. Fewer threads lower CPU use but may be too slow for smooth playback.';

  @override
  String get adminTranscodingThreadMax => 'Max';

  @override
  String get adminTranscodingFfmpegPath => 'FFmpeg path';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'The FFmpeg the server runs. It is set on the server, not here.';

  @override
  String get adminTranscodingAudioSeek => 'Audio seek strategy';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'How the server handles audio when you seek in an HLS stream.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Trim copied audio';

  @override
  String get adminTranscodingTranscodeAudio => 'Transcode audio';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Minimum audiobook resume (minutes)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Audiobooks stopped before this time count as unplayed.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Audiobook remaining minutes to resume';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Audiobooks stopped with less than this many minutes left count as played.';

  @override
  String get adminBrandingSplashSection => 'Splash screen';

  @override
  String get adminBrandingSectionWebClient => 'Web client';

  @override
  String get adminBrandingSplashSizeHint =>
      'Custom images should be in a 16x9 aspect ratio at a minimum size of 1920x1080.';

  @override
  String get adminNetworkingSectionServerAddress => 'Server address settings';

  @override
  String get adminNetworkingSectionHttps => 'HTTPS settings';

  @override
  String get adminNetworkingSectionRemoteAccess => 'Remote access settings';

  @override
  String get adminNetworkingSectionIpProtocols => 'IP protocols';

  @override
  String get adminNetworkingSectionDiscovery => 'Network discovery';

  @override
  String get adminNetworkingSectionFirewall => 'Firewall and proxy settings';

  @override
  String get adminNetworkingLocalHttpPort => 'Local HTTP port number';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'The TCP port number for the HTTP server.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Listen on the HTTPS port. A valid certificate must also be set for this to take effect.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Local HTTPS port number';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'The TCP port number for the HTTPS server.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Adds a subdirectory to the server URL, for example https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress => 'Bind to local network address';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Overrides the local IP address of the HTTP server. Leave it empty to bind to all addresses. A change needs a restart.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'IP addresses or IP/netmask entries of networks treated as local for bandwidth and remote access limits. Leave it empty to treat all RFC1918 addresses as local.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'IP addresses or host names of the proxies in front of this server. Needed to read X-Forwarded-For headers. A change needs a restart.';

  @override
  String get adminNetworkingCustomCertPath => 'Custom SSL certificate path';

  @override
  String get adminNetworkingCertPathHelp =>
      'Path to a PKCS #12 file with a certificate and private key, for TLS on a custom domain.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Enter the password if your certificate needs one.';

  @override
  String get adminNetworkingAllowRemote =>
      'Allow remote connections to this server';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'When off, all remote connections are blocked.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'IP addresses or IP/netmask entries of remote networks. Leave it empty to allow every remote address.';

  @override
  String get adminNetworkingRemoteIpFilterMode =>
      'Remote IP address filter mode';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'The public port mapped to the local HTTP port.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'The public port mapped to the local HTTPS port.';

  @override
  String get adminNetworkingAutoDiscoveryLabel => 'Enable auto discovery';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Lets apps find this server on UDP port 7359.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Use the same published server URI for internal and external access';

  @override
  String get adminNetworkingPublishedUri => 'Published server URI';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Overrides the URI the server gives out, based on the interface or the client IP address.';

  @override
  String get adminNetworkingInternalUri => 'Internal URI';

  @override
  String get adminNetworkingInternalUriHelp =>
      'Published server URI for internal access.';

  @override
  String get adminNetworkingExternalUri => 'External URI';

  @override
  String get adminNetworkingExternalUriHelp =>
      'Published server URI for external access.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Other published URIs';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URIs for one subnet or interface, written as subnet=URI.';

  @override
  String get adminBackupsHelp =>
      'Create and restore snapshots of your server. They can include the database, metadata, subtitles and trickplay images.';

  @override
  String get adminBackupDisclaimer =>
      'Depending on the size of your library, the backup can take a while.';

  @override
  String get adminBackupTasksWarningTitle => 'Scheduled tasks are running';

  @override
  String get adminBackupTasksWarning =>
      'Stop these tasks or wait for them to finish before you create a backup.';

  @override
  String get adminBackupArchiveNotFound =>
      'The server could not find this backup archive.';

  @override
  String get adminRestoreInProgress => 'Restore in progress';

  @override
  String get adminRestoreWaitingForServer =>
      'Waiting for the server to come back.';

  @override
  String get adminRestoreSucceeded => 'Restore completed';

  @override
  String get adminLogWatch => 'Watch';

  @override
  String get adminLogStopWatching => 'Stop watching';

  @override
  String get adminPluginInstallConfirmTitle => 'Confirm plugin installation';

  @override
  String get adminPluginInstallDisclaimer =>
      'Installing a third party plugin carries risks. It may contain unstable or malicious code, and it can change at any time. Only install plugins from authors you trust, and know what they can do, such as query outside services, slow down library scans or add background work.';

  @override
  String get adminGroupOverview => 'Overview';

  @override
  String get adminGroupLibrary => 'Library';

  @override
  String get adminGroupPlayback => 'Playback';

  @override
  String get adminGroupPeople => 'People';

  @override
  String get adminGroupSystem => 'System';

  @override
  String get adminAreasLabel => 'Admin areas';

  @override
  String get adminPagesLabel => 'Pages';

  @override
  String get adminPageDescDashboard =>
      'Server health, sessions and recent activity';

  @override
  String get adminPageDescAnalytics => 'Library sizes, codecs and formats';

  @override
  String get adminPageDescActivity => 'Everything that happened on the server';

  @override
  String get adminPageDescTasks => 'Scans, cleanups and their triggers';

  @override
  String get adminPageDescLibraries =>
      'Folders, scanners and metadata fetchers';

  @override
  String get adminPageDescDisplay => 'How libraries show to users';

  @override
  String get adminPageDescMetadata => 'Default language, country and images';

  @override
  String get adminPageDescNfo => 'Kodi NFO reading and saving';

  @override
  String get adminPageDescLiveTv => 'Tuners, guide data and recordings';

  @override
  String get adminPageDescTranscoding =>
      'Hardware acceleration, encoders, tone mapping';

  @override
  String get adminPageDescResume => 'When items count as started or played';

  @override
  String get adminPageDescStreaming => 'Remote bitrate limit';

  @override
  String get adminPageDescTrickplay => 'Seek preview thumbnails';

  @override
  String get adminPageDescUsers => 'Accounts, access and parental control';

  @override
  String get adminPageDescDevices => 'Signed in devices and their names';

  @override
  String get adminPageDescApiKeys => 'Keys for apps and scripts';

  @override
  String get adminPageDescSettings =>
      'Server name, language, paths, performance';

  @override
  String get adminPageDescBranding =>
      'Login message, custom CSS, splash screen';

  @override
  String get adminPageDescNetworking => 'Ports, HTTPS, LAN and remote access';

  @override
  String get adminPageDescPlugins => 'Installed plugins and the catalog';

  @override
  String get adminPageDescRepositories => 'Where plugins come from';

  @override
  String get adminPageDescBackups => 'Create and restore server backups';

  @override
  String get adminPageDescLogs => 'Server log files';

  @override
  String adminSearchSettingsHint(int count) {
    return 'Search $count settings';
  }

  @override
  String get adminSearchNoResults => 'No settings match';

  @override
  String get adminSearchClear => 'Clear search';

  @override
  String get adminUnsavedChanges => 'Unsaved changes';

  @override
  String get adminDiscard => 'Discard';

  @override
  String get adminLeaveTitle => 'Discard unsaved changes?';

  @override
  String get adminLeaveMessage =>
      'The changes on this page haven\'t been saved yet.';

  @override
  String get adminKeepEditing => 'Keep editing';

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
    return 'Rimuovere il dispositivo \'$name\'? L\'utente dovrà accedere di nuovo su questo dispositivo.';
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
      other: '# partecipanti',
      one: '# partecipante',
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
  String get syncPlayRepeatOne => 'Uno';

  @override
  String get syncPlayShuffleModeShuffled => 'Casuale';

  @override
  String get syncPlayShuffleModeSorted => 'Ordinato';

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
  String get syncPlayGroupName => 'Nome del gruppo';

  @override
  String get syncPlayDefaultGroupName => 'Il mio gruppo SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Crea gruppo';

  @override
  String get syncPlayAvailableGroups => 'Gruppi disponibili';

  @override
  String get syncPlayNoGroupsAvailable => 'Nessun gruppo disponibile';

  @override
  String get syncPlayJoinGroupQuestion => 'Partecipare al gruppo SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'L\'adesione a un gruppo SyncPlay potrebbe sostituire la coda di riproduzione corrente. Continuare?';

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
  String get offlineSavedMedia => 'Media Salvati';

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
  String get kidsMode => 'Kids Mode';

  @override
  String get kidsModeSubtitle =>
      'Simplify the app and lock the way out with a PIN';

  @override
  String get kidsModeExit => 'Exit Kids Mode';

  @override
  String get kidsModeExitSubtitle => 'Enter your PIN to restore the full app';

  @override
  String get pinIncorrect => 'PIN errato';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
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
  String get trackActionViewDetails => 'View Details';

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
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

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
  String get contextMenuRemoveFromCollection => 'Remove from Collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Remove $item from $collection? The item stays in your library.';
  }

  @override
  String get removeFromCollectionFailed => 'Failed to remove from collection';

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
      'This server\'s certificate isn\'t trusted. If it\'s your own server and uses a self-signed or private certificate, you can allow it here.';

  @override
  String get clientCertTitle => 'Client certificate';

  @override
  String clientCertHost(String host) {
    return 'Certificate for $host';
  }

  @override
  String get clientCertChooseFile => 'Choose file';

  @override
  String get clientCertPassword => 'Certificate password';

  @override
  String get clientCertStartUpload => 'Send from phone';

  @override
  String get clientCertUploadHint =>
      'Scan this code with your phone, or open the address in its browser, then pick the file and enter its password.';

  @override
  String get clientCertStopUpload => 'Stop waiting';

  @override
  String get clientCertNoFileData => 'Couldn\'t read the file. Try again.';

  @override
  String get clientCertPickFailed => 'Couldn\'t open the file picker.';

  @override
  String get clientCertUploadFailed =>
      'Couldn\'t start the upload page. Try again.';

  @override
  String get clientCertNoSecureStorage =>
      'This device has no secure storage, so the certificate can\'t be saved. On Linux, install libsecret and try again.';

  @override
  String get clientCertDecodeFailed =>
      'Couldn\'t read that file as a certificate. Make sure it\'s a .p12 or .pfx.';

  @override
  String get clientCertWrongPassword =>
      'That password doesn\'t unlock this certificate.';

  @override
  String get clientCertRequired =>
      'This server needs a client certificate (mTLS). Add one for this host to continue.';

  @override
  String clientCertExpired(String date) {
    return 'The certificate for this server expired on $date. Replace it to continue.';
  }

  @override
  String get clientCertAddButton => 'Add client certificate';

  @override
  String get settingsClientCertificates => 'Client certificates';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Certificates this app presents to servers that require one (mTLS)';

  @override
  String get clientCertSubject => 'Subject';

  @override
  String clientCertExpires(String date) {
    return 'Expires $date';
  }

  @override
  String get clientCertReplace => 'Replace';

  @override
  String get clientCertAdd => 'Add certificate';

  @override
  String get clientCertAddHostPrompt =>
      'Which server host needs a certificate?';

  @override
  String get itemBlockedByParentalControls => 'This isn\'t available';

  @override
  String get blockedRatingsCeilingHint =>
      'Blocking a rating also blocks everything stronger than it.';

  @override
  String get blockedRatingsUnrankedSection => 'Only blocks itself';

  @override
  String get settingsHomePage => 'Pagina iniziale';

  @override
  String get settingsTwentyFourHourClock => 'Orologio 24 ore';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Utilizza la formattazione dell\'ora a 24 ore ovunque venga visualizzato l\'orologio';

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
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

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
      'Logica di sincronizzazione per sessioni di gruppo';

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
      'Come ridimensionare il video per adattarlo allo schermo.';

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
  String get settingsRedetectDisplay => 'Re-detect display';

  @override
  String get settingsRedetectDisplayDescription =>
      'Ask the TV again what HDR formats it supports. Use this if Dolby Vision or HDR10 titles are being transcoded after the TV or receiver was powered on late.';

  @override
  String get settingsDisplayIsSdr => 'My TV is not HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Stop advertising HDR support for this display. Use this only if detection keeps reporting HDR your TV can\'t actually show.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Display re-detected: $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'No HDR formats detected';

  @override
  String get settingsDisplayMarkedSdr => 'Display saved as SDR';

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
  String get settingsLiveTvDirect => 'Diretta TV in diretta';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Abilita la riproduzione diretta per la TV in diretta';

  @override
  String get settingsOpenGroups => 'Gruppi aperti';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Crea, unisciti o gestisci gruppi SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Abilitato';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Abilita le funzionalità di visione di gruppo';

  @override
  String get settingsSyncplayButton => 'Pulsante SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostra il pulsante SyncPlay sulla barra di navigazione';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correzione avanzata';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Abilita la logica di sincronizzazione a grana fine';

  @override
  String get settingsSyncplaySyncCorrection =>
      'Correzione della sincronizzazione';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Regola automaticamente la riproduzione per rimanere sincronizzata';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocità per sincronizzare';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Utilizzare la regolazione della velocità di riproduzione per sincronizzare';

  @override
  String get settingsSyncplaySkipToSync => 'Salta per sincronizzare';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Utilizza la ricerca per sincronizzare';

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
      'Converti il profilo Dolby Vision 7 in HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Riproduci gli stream Dolby Vision profilo 7 come HEVC compatibile con HDR10 sui dispositivi senza Dolby Vision.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

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
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

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
  String get homeRowsSection => 'Righe Home';

  @override
  String get rowsType => 'Tipo di Riga';

  @override
  String get rowsTypeDescription =>
      'Classico mantiene il tipo di immagine per riga e l\'overlay informativo. Moderno usa righe da verticale a sfondo.';

  @override
  String get modernCardsOnMyMediaRow => 'Modern cards on My Media row';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Display customizable posters that expand on focus. Disable to always show landscape thumbnail.';

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
  String get sorting => 'Sorting';

  @override
  String get imdbRowsSorting => 'IMDb Row Sorting';

  @override
  String get imdbRowsSortingDescription =>
      'Sort IMDb rows by name, release date, rating, and more.';

  @override
  String get imdbRowsSortOrderDescription =>
      'Sort IMDb rows in ascending or descending order.';

  @override
  String get tmdbRowsSorting => 'TMDB Row Sorting';

  @override
  String get tmdbRowsSortingDescription =>
      'Sort TMDB rows by name, release date, rating, and more.';

  @override
  String get tmdbRowsSortOrderDescription =>
      'Sort TMDB rows in ascending or descending order.';

  @override
  String get seerrRowsSorting => 'Seerr Row Sorting';

  @override
  String get seerrRowsSortingDescription =>
      'Sort Seerr rows by name, release date, rating, and more.';

  @override
  String get seerrRowsSortOrderDescription =>
      'Sort Seerr rows in ascending or descending order.';

  @override
  String get externalRowSortDefault => 'Default (List Order)';

  @override
  String get externalRowSortName => 'Name';

  @override
  String get externalRowSortReleaseDate => 'Release Date';

  @override
  String get externalRowSortRating => 'Rating';

  @override
  String get externalRowSortPopularity => 'Popularity';

  @override
  String get externalRowSortShuffle => 'Shuffle';

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
  String get cardSize => 'Dimensione Schede Righe Home';

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
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

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
  String get hevcSoftwareDirectPlay => 'Direct Play HEVC (Software Decode)';

  @override
  String get hevcSoftwareDirectPlaySubtitle =>
      'Play HEVC up to 1080p from the original file instead of asking the server to transcode it. This Apple TV decodes it in software, so heavy 10-bit or high bitrate files may stutter.';

  @override
  String get av1SoftwareUhdDirectPlay => 'Direct Play 4K AV1 (Software Decode)';

  @override
  String get av1SoftwareUhdDirectPlaySubtitle =>
      'Play AV1 above 1080p, including HDR10, from the original file instead of asking the server to transcode it. This device decodes AV1 in software, so heavy 4K or high bitrate files may stutter.';

  @override
  String get useExternalPlayer => 'Usa sempre il lettore esterno';

  @override
  String get useExternalPlayerSubtitle =>
      'Apri la riproduzione video nell\'app esterna selezionata su Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Accodamento Automatico';

  @override
  String get preferSdhSubtitles => 'Preferisci i sottotitoli SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Dai priorità alle tracce di sottotitoli SDH/CC nella selezione automatica.';

  @override
  String get preferTextSubtitles => 'Prefer Text Subtitles';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Prioritize text-based subtitles (SRT, VTT) over image-based formats (PGS, VobSub).';

  @override
  String get preferExternalSubtitles => 'Prefer External Subtitles';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Prioritize external subtitle files over embedded tracks.';

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
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Guarda con il gruppo';

  @override
  String get watchPartyGroupSubtitles => 'Subtitles for everyone';

  @override
  String get watchPartyOwnSubtitles => 'Each person\'s choice';

  @override
  String get watchPartyLobby => 'In the lobby';

  @override
  String get watchPartyUpNextLabel => 'Up next';

  @override
  String get watchPartyRoomSettings => 'Room settings';

  @override
  String get watchPartyCodeOrLink => 'Room code or invite link';

  @override
  String get watchPartyCopyInvite => 'Copy invite link';

  @override
  String get watchPartyInviteCopied => 'Invite link copied';

  @override
  String get watchPartyLetEveryoneVote => 'Let everyone vote on movies';

  @override
  String get watchPartyVoteHelp =>
      'Add movies for everyone to vote on, then play the one you want. TV episodes are still your pick.';

  @override
  String get watchPartyGuestVoteHelp =>
      'Vote for what you want to watch. The host plays one.';

  @override
  String get watchPartySearchMovies => 'Search movies';

  @override
  String get watchPartyNoSuggestions => 'No movies to vote on yet.';

  @override
  String get watchPartySuggested => 'Added to the Watch Party vote';

  @override
  String watchPartyVoteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count votes',
      one: '$count vote',
    );
    return '$_temp0';
  }

  @override
  String get watchParty => 'Watch Party';

  @override
  String get watchPartyUnavailable => 'This server doesn\'t offer Watch Party.';

  @override
  String get watchPartyRoomCode => 'Room code';

  @override
  String get watchPartyStart => 'Start a Watch Party';

  @override
  String get watchPartyPickTitle =>
      'Open a title and choose Watch with group to pick what everyone watches.';

  @override
  String get watchPartyWaitingForHost =>
      'Waiting for the host to pick something.';

  @override
  String get watchPartyShareCode =>
      'Others join with this code from their Watch Party screen.';

  @override
  String get watchPartyReconnecting => 'Reconnecting...';

  @override
  String get watchPartyOffline => 'offline';

  @override
  String get watchPartyStartForEveryone => 'Start for everyone';

  @override
  String get watchPartyBackToLobby => 'Back to the lobby';

  @override
  String get watchPartyGuestsCanPause => 'Guests can play and pause';

  @override
  String get watchPartyEnd => 'End Watch Party';

  @override
  String get watchPartyEnded => 'The Watch Party has ended.';

  @override
  String get watchPartyStaged => 'Picked for the Watch Party';

  @override
  String watchPartyUpNext(String title) {
    return 'Up next: $title';
  }

  @override
  String get disk => 'Disco';

  @override
  String get openInBrowser => 'Apri nel Browser';

  @override
  String get achievementBadges => 'Achievement Badges';

  @override
  String get achievementBadgesSubtitle =>
      'Badges, ranks and quests earned from what you watch';

  @override
  String get achievementsBadges => 'Badges';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked of $total badges';
  }

  @override
  String get achievementsUnlockToasts => 'Unlock Notifications';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Show a notification when you unlock a badge';

  @override
  String get achievementsUnlockedNotification => 'Achievement unlocked';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count achievements unlocked',
      one: '$count achievement unlocked',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count more';
  }

  @override
  String get achievementsQuests => 'Quests';

  @override
  String achievementsQuestCount(int count) {
    return '$count completed';
  }

  @override
  String get achievementsLeaderboard => 'Leaderboard';

  @override
  String get achievementsLeaderboardSubtitle =>
      'How you compare with other users on this server';

  @override
  String get achievementsRecap => 'Recap';

  @override
  String get achievementsRecapSubtitle => 'What you watched recently';

  @override
  String get achievementsLibraryCompletion => 'Library completion';

  @override
  String achievementsLibraryCount(int count) {
    return '$count libraries';
  }

  @override
  String achievementsScore(int score) {
    return '$score points';
  }

  @override
  String get achievementsScoreLabel => 'Score';

  @override
  String get achievementsTopRank => 'Top rank reached';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$points points to $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return '$days day streak';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Best: $days days';
  }

  @override
  String get achievementsShowcase => 'Showcase';

  @override
  String get achievementsUnlocked => 'Unlocked';

  @override
  String get achievementsLocked => 'Locked';

  @override
  String get achievementsNothingHere => 'Nothing here yet.';

  @override
  String get achievementsHiddenBadge => 'Hidden achievement';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Unlocked $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points pts';
  }

  @override
  String get achievementsDailyQuests => 'Daily';

  @override
  String get achievementsWeeklyQuests => 'Weekly';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Reroll daily quests';

  @override
  String get achievementsRerollWeekly => 'Reroll weekly quests';

  @override
  String get achievementsRerollOffer => 'Swap this set for a different one';

  @override
  String get achievementsRerollSpentDaily =>
      'Used today, comes back at midnight UTC';

  @override
  String get achievementsRerollSpentWeekly =>
      'Used this week, comes back Monday UTC';

  @override
  String get achievementsRerollConfirm => 'Reroll these quests?';

  @override
  String get achievementsRerollConfirmBody =>
      'You get one daily and one weekly reroll, and this spends it.';

  @override
  String get achievementsRerollFailed => 'Could not reroll those quests.';

  @override
  String get achievementsSuggested => 'Suggested items to watch';

  @override
  String get achievementsNoSuggestions => 'Nothing to suggest for this badge.';

  @override
  String get achievementsProgressLabel => 'Progress';

  @override
  String get achievementsLoadout => 'Loadout';

  @override
  String get achievementsLoadoutSubtitle =>
      'Score to spend and the boosts you hold';

  @override
  String get achievementsAppearance => 'Appearance';

  @override
  String get achievementsAppearanceSubtitle =>
      'The avatar and title on your profile';

  @override
  String get achievementsAvatars => 'Avatars';

  @override
  String get achievementsTitles => 'Titles';

  @override
  String get achievementsEquipped => 'Equipped';

  @override
  String get achievementsOwned => 'Owned';

  @override
  String achievementsEarnedAt(int score) {
    return 'Earned at $score lifetime score';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'This server has no avatars or titles to wear.';

  @override
  String get achievementsAppearanceFailed =>
      'Could not change how the profile looks.';

  @override
  String get achievementsPowerUps => 'Power-ups';

  @override
  String get achievementsStats => 'Stats';

  @override
  String get achievementsStatsSubtitle =>
      'Your records and how the server is doing';

  @override
  String get achievementsStatsWatched => 'Watched';

  @override
  String get achievementsStatsBests => 'Bests';

  @override
  String get achievementsStatsHabits => 'Habits';

  @override
  String get achievementsStatsVariety => 'Variety';

  @override
  String get achievementsStatsServer => 'This server';

  @override
  String get achievementsStatsClock => 'When you watch';

  @override
  String get achievementsStatItems => 'Items watched';

  @override
  String get achievementsStatMovies => 'Films watched';

  @override
  String get achievementsStatSeries => 'Series finished';

  @override
  String get achievementsStatHours => 'Hours watched';

  @override
  String get achievementsStatDays => 'Days watched';

  @override
  String get achievementsStatRewatches => 'Rewatches';

  @override
  String get achievementsStatBestWatchStreak => 'Best watch streak';

  @override
  String get achievementsStatBestLoginStreak => 'Best login streak';

  @override
  String get achievementsStatMostEpisodes => 'Most episodes in a day';

  @override
  String get achievementsStatMostMovies => 'Most films in a day';

  @override
  String get achievementsStatLongestItem => 'Longest single item';

  @override
  String get achievementsStatBestCombo => 'Best combo';

  @override
  String get achievementsStatLateNight => 'Late night sessions';

  @override
  String get achievementsStatEarlyMorning => 'Early morning sessions';

  @override
  String get achievementsStatWeekend => 'Weekend sessions';

  @override
  String get achievementsStatDaysSignedIn => 'Days signed in';

  @override
  String get achievementsStatLibraries => 'Libraries visited';

  @override
  String get achievementsStatGenres => 'Genres watched';

  @override
  String get achievementsStatDecades => 'Decades watched';

  @override
  String get achievementsStatCountries => 'Countries watched';

  @override
  String get achievementsStatLanguages => 'Languages watched';

  @override
  String get achievementsStatUsers => 'Users';

  @override
  String get achievementsStatBadgesUnlocked => 'Badges unlocked';

  @override
  String get achievementsStatScoreEarned => 'Score earned';

  @override
  String get achievementsStatCommonBadge => 'Most common badge';

  @override
  String get achievementsActivity => 'Activity';

  @override
  String get achievementsActivitySubtitle =>
      'What the server has unlocked lately';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user unlocked $badge';
  }

  @override
  String get achievementsShop => 'Shop';

  @override
  String get achievementsShopSubtitle => 'Spend score on more boosts';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Nothing for sale right now.';

  @override
  String get achievementsBuyConfirm => 'Buy this?';

  @override
  String get achievementsBuyConfirmBody =>
      'It comes straight out of your score bank.';

  @override
  String get achievementsBuyFailed => 'Could not buy that.';

  @override
  String get achievementsScoreBank => 'Score bank';

  @override
  String get achievementsBoost => 'XP Boost';

  @override
  String get achievementsBoostBody =>
      'Doubles score for an hour. Using it again restarts the hour.';

  @override
  String get achievementsDoubleCredit => 'Double Credit';

  @override
  String get achievementsDoubleCreditBody =>
      'The next thing you finish counts twice towards badges.';

  @override
  String get achievementsStreakFreeze => 'Streak Freeze';

  @override
  String get achievementsStreakFreezeBody =>
      'Covers one missed day. Only one can be banked.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count held',
      one: '1 held',
      zero: 'None held',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'Running now';

  @override
  String get achievementsUsePowerUp => 'Use this power-up?';

  @override
  String get achievementsUsePowerUpBody =>
      'It\'s spent as soon as you confirm.';

  @override
  String get achievementsPowerUpFailed => 'Could not use that power-up.';

  @override
  String get achievementsHours => 'Hours';

  @override
  String get achievementsStreak => 'Streak';

  @override
  String get achievementsPeriodWeek => 'Week';

  @override
  String get achievementsPeriodMonth => 'Month';

  @override
  String get achievementsPeriodYear => 'Year';

  @override
  String achievementsDaysWatched(int count) {
    return '$count days watched';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return '$count badges earned';
  }

  @override
  String get achievementsTopDirectors => 'Top directors';

  @override
  String get achievementsTopActors => 'Top actors';

  @override
  String get achievementsLoadFailed => 'Could not load your achievements.';

  @override
  String get friends => 'Friends';

  @override
  String get friendsSubtitle =>
      'See who\'s online and chat with people on this server';

  @override
  String get friendsShowButton => 'Show Friends Button';

  @override
  String get friendsShowButtonSubtitle =>
      'Friends and chat from the Achievement Badges plugin';

  @override
  String get friendsMessages => 'Messages';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count unread messages',
      one: '1 unread message',
      zero: 'No unread messages',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Friend requests';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count waiting for you',
      one: '1 waiting for you',
      zero: 'Nothing waiting',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Add friends';

  @override
  String get friendsAddSubtitle => 'Find people on this server';

  @override
  String get friendsPrivacy => 'Privacy';

  @override
  String get friendsPrivacySubtitle => 'What your friends can see';

  @override
  String get friendsOnline => 'Online';

  @override
  String get friendsOffline => 'Offline';

  @override
  String get friendsNone =>
      'No friends yet. Add people from this server to see them here.';

  @override
  String friendsWatching(String title) {
    return 'Watching $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Last watched $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Last seen $time';
  }

  @override
  String get friendsLoadFailed =>
      'Could not load this. Check your connection and try again.';

  @override
  String get friendsActionFailed => 'That didn\'t work. Try again in a moment.';

  @override
  String get friendsIncoming => 'Waiting for you';

  @override
  String get friendsOutgoing => 'Sent by you';

  @override
  String get friendsNoRequests => 'No friend requests.';

  @override
  String get friendsAccept => 'Accept';

  @override
  String get friendsDecline => 'Decline';

  @override
  String get friendsCancelRequest => 'Cancel request';

  @override
  String friendsRequestFrom(String name) {
    return '$name wants to be friends';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Take back the request you sent to $name?';
  }

  @override
  String get friendsSearchHint => 'Search people';

  @override
  String get friendsNoMatches => 'No one matches that name.';

  @override
  String friendsRequestSent(String name) {
    return 'Request sent to $name';
  }

  @override
  String get friendsSendRequest => 'Add as friend';

  @override
  String get friendsSendMessage => 'Send message';

  @override
  String friendsOpenItem(String title) {
    return 'Open $title';
  }

  @override
  String get friendsRemove => 'Remove friend';

  @override
  String friendsRemoveBody(String name) {
    return 'Remove $name from your friends? You can add them again later.';
  }

  @override
  String get friendsBlock => 'Block';

  @override
  String get friendsUnblock => 'Unblock';

  @override
  String friendsBlockBody(String name) {
    return 'Block $name? Neither of you will be able to message the other directly. Group chats you share stay open.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Unblock $name?';
  }

  @override
  String get friendsBlocked => 'Blocked users';

  @override
  String friendsProfileHidden(String name) {
    return '$name keeps their profile private.';
  }

  @override
  String get friendsAppearOffline => 'Appear Offline';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Friends always see you as offline';

  @override
  String get friendsHideNowPlaying => 'Hide What I\'m Watching';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Friends still see you online, but not what\'s playing';

  @override
  String get friendsHideLastWatched => 'Hide My Last Watched';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Friends won\'t see what you watched last while you\'re offline';

  @override
  String get friendsMessageNotifications => 'Message Notifications';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Show a banner when a friend messages you';

  @override
  String get friendsMuteDuringPlayback => 'Mute During Playback';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'No message banners while a video or game is playing';

  @override
  String get friendsSaveFailed => 'Could not save your settings.';

  @override
  String get chatNew => 'New message';

  @override
  String get chatNewSubtitle => 'Start a chat with a friend';

  @override
  String get chatNewGroup => 'New group';

  @override
  String get chatNewGroupSubtitle => 'Chat with several friends at once';

  @override
  String get chatNone => 'No messages yet.';

  @override
  String get chatYou => 'You';

  @override
  String chatYouSaid(String text) {
    return 'You: $text';
  }

  @override
  String get chatPhoto => 'Photo';

  @override
  String get chatEmoji => 'Emoji';

  @override
  String get chatEmojiSearch => 'Search emoji';

  @override
  String get chatNoRecentEmoji => 'No recent emoji';

  @override
  String get chatViewPhoto => 'View photo';

  @override
  String get chatHint => 'Write a message';

  @override
  String get chatAttach => 'Send a photo';

  @override
  String get chatEdited => 'edited';

  @override
  String get chatSeen => 'Seen';

  @override
  String get chatSent => 'Sent';

  @override
  String get chatEditing => 'Editing message';

  @override
  String get chatMessageOptions => 'Message options';

  @override
  String get chatDeleteBody => 'Delete this message for everyone?';

  @override
  String get chatClear => 'Clear conversation';

  @override
  String get chatClearBody =>
      'Delete every message in this chat for everyone in it?';

  @override
  String get chatGroupInfo => 'Group info';

  @override
  String get chatGroupName => 'Group name';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Owner';

  @override
  String get chatAdmin => 'Admin';

  @override
  String get chatMakeAdmin => 'Make admin';

  @override
  String get chatRemoveAdmin => 'Remove admin';

  @override
  String get chatRemoveMember => 'Remove from group';

  @override
  String get chatAddMember => 'Add people';

  @override
  String get chatNobodyToAdd => 'No one left to add.';

  @override
  String get chatLeave => 'Leave group';

  @override
  String get chatLeaveBody =>
      'Leave this group? Someone will have to add you back to rejoin.';

  @override
  String get chatCreate => 'Create group';

  @override
  String get chatPickMembers => 'Pick at least two friends';

  @override
  String chatNewMessageFrom(String name) {
    return 'New message from $name';
  }

  @override
  String get chatImageTooLarge => 'That image is over 8 MB.';

  @override
  String get chatImageUnsupported =>
      'Only PNG, JPEG, GIF and WebP images can be sent.';

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
  String get analyticsLibraryShare => 'Share of items by library';

  @override
  String get analyticsTopRating => 'Most common rating';

  @override
  String get analyticsTypicalRuntime => 'Typical runtime';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent% of items';
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
  String get audiobookFullTimeline => 'Full Timeline';

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
    return 'La tua libreria \'$libraryName\' è configurata per salvare le immagini direttamente nelle cartelle dei media (\'Salva le immagini nelle cartelle dei media\' è attivo). Tuttavia, Jellyfin ha verificato l\'accesso in scrittura e non ha il permesso di scrivere file in questa directory:\n\n$failedPath';
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
    return 'Date Added: $date';
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
    return 'Audio codec ($codec) is not supported directly.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Tip: If your audio receiver or soundbar supports $codec, enable Audio Passthrough in Audio settings.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Audio channel count (${channels}ch) exceeds the player limit.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Tip: Adjust \'Max Audio Channels\' or multichannel downmixing in Audio settings.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'ASS/SSA subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Tip: Enable \'ASS/SSA Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'PGS subtitles require transcoding because direct play is turned off.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Tip: Enable \'PGS Direct Play\' in Playback settings to play directly without transcoding.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Subtitle format ($codec) is not supported directly and must be burned in.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'File bitrate ($fileBitrate) exceeds the configured streaming limit ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Tip: Increase \'Maximum Bitrate\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeResolutionHint =>
      'Tip: Increase \'Maximum Resolution\' in Playback settings to allow direct streaming.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'Video dynamic range (e.g. Dolby Vision / HDR) is not supported by this display.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'Dolby Vision Profile 7 enhancement layer direct play is disabled.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Tip: Enable \'Dolby Vision Profile 7 Direct Play\' in Playback settings if your display supports it.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Transcoding is preferred for Dolby Vision fallback per user settings.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Tip: Set \'Dolby Vision Fallback\' to \'Play as HDR10\' in Playback settings to avoid transcoding.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'Connected display does not report support for HDR or Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'Connected display lacks HDR10 support needed for Dolby Vision fallback.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'Audio sample rate is not supported.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'Audio bit depth is not supported.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Video reference frames exceed player limits.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'Anamorphic video is not supported.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'Interlaced video is not supported.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'Secondary audio stream requires transcoding.';

  @override
  String get transcodeDirectPlayError =>
      'Direct play is not supported for this media format.';

  @override
  String get sortServerOrder => 'Server Order';

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
    return 'Sort: $option';
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
  String get playlistTypeMusicVideo => 'Music Video';

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
  String get musicVideoPlaylistsSection => 'Music Video Playlists';

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
  String get currentTime => 'Current Time';

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
  String get libraryFolderView => 'Folder View';

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
  String get hideDetailsMediaDescription =>
      'Nascondi Descrizione Media nella Pagina Dettagli';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Nasconde il testo descrittivo del film o dell\'episodio.';

  @override
  String get detailUseSeriesThumbnails =>
      'Usa Miniature Serie nella Pagina Dettagli';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Sostituisce tutte le miniature nella pagina dettagli Classica con la miniatura della serie';

  @override
  String get hideHomeMediaDescription =>
      'Nascondi Descrizione Media nella Home';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Nasconde il testo descrittivo del film o dell\'episodio.';

  @override
  String get hideHomeWatchProgress => 'Hide Watch Progress';

  @override
  String get hideHomeWatchProgressSubtitle =>
      'Hide the progress bar on posters you\'ve started watching.';

  @override
  String get hideHomeUnwatchedCount => 'Hide Unwatched Count';

  @override
  String get hideHomeUnwatchedCountSubtitle =>
      'Hide the badge showing how many episodes are left to watch.';

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
  String get setupPlaybackLanguages => 'Playback languages';

  @override
  String get setupOptional => 'Optional';

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
  String get setupDetailClassicHint => 'Tutto centrato in un unico blocco.';

  @override
  String get setupDetailModernHint =>
      'Cinematico, con schede per cast e contenuti extra.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      'Hero-first, with pop-up cards for cast and extras.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Full-screen, with sections stacked instead of tabs.';

  @override
  String get setupStyleMinimalist => 'Minimalist';

  @override
  String get setupDetailMinimalistHint =>
      'Artwork, one play button and the episodes.';

  @override
  String get setupNavbarStyleQuestion => 'How should the bottom bar look?';

  @override
  String get setupNavbarStyleDockHint =>
      'A floating pill with labels under every tab.';

  @override
  String get setupNavbarStyleSplitHint =>
      'Search gets its own button, and the bar shrinks while you scroll.';

  @override
  String get setupNavbarStyleStripHint =>
      'A full-width bar along the bottom edge.';

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
    return 'Step $current of $total';
  }

  @override
  String get setupCurrent => 'Current';

  @override
  String get setupTvHint =>
      'Up and down to preview · OK to choose · Back twice to skip';

  @override
  String get setupNavbarTopHint => 'Tabs across the top of the screen.';

  @override
  String get setupNavbarLeftHint => 'A slim rail of icons down the left side.';

  @override
  String get setupNavbarBottomHint =>
      'Tabs along the bottom edge, in easy reach of your thumb.';

  @override
  String get setupMediaBarMoonfinHint =>
      'Large artwork with the title, details and overview laid over it.';

  @override
  String get setupMediaBarMakdHint => 'Large artwork led by a big title logo.';

  @override
  String get setupMediaBarBookshelfHint =>
      'Titles shelved as book spines, with the featured one face out.';

  @override
  String get setupMediaBarGalleryHint =>
      'The featured title opened up, with the next few lined up beside it.';

  @override
  String get setupMediaBarBannerHint =>
      'A shorter banner above your rows, so more of them fit on screen.';

  @override
  String get setupMediaBarAyaHint =>
      'Artwork first in a framed panel, with your rows right underneath.';

  @override
  String get setupMediaBarOffHint =>
      'No featured area. Home opens straight onto your rows.';

  @override
  String get runSetupAgain => 'Esegui di nuovo la configurazione';

  @override
  String get serverMessages => 'Messages';

  @override
  String get serverMessagesEmpty => 'No messages from your server yet';

  @override
  String get serverMessagesMarkAllRead => 'Mark all as read';

  @override
  String get serverMessagesShowButton => 'Show Messages Button';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Adds a button to the menu for messages sent by your server admin';

  @override
  String get showBookDiscoverTab => 'Show Book Library Discovery';

  @override
  String get showBookDiscoverTabDescription =>
      'Browse titles from Open Library and LibriVox in your book and audiobook libraries';

  @override
  String get autoDownloadNewEpisodes => 'Auto-download new episodes';

  @override
  String get autoDownloadStop => 'Stop auto-download';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Downloads new episodes, up to $count unwatched at a time',
      one: 'Downloads new episodes, up to 1 unwatched at a time',
      zero: 'Downloads every new episode',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'On • $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Transcoded qualities only download while Moonfin is open. Original quality also downloads in the background.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Transcoded downloads can\'t resume after an interruption and start over from the beginning. Original quality can resume.';

  @override
  String get autoDownloadForegroundOnly =>
      'Downloads only while Moonfin is open';

  @override
  String get autoDownloadQualityTitle => 'Auto-download quality';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Auto-download enabled for $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Auto-download stopped for $title';
  }

  @override
  String get smartDownloadsSection => 'Smart downloads';

  @override
  String get smartDownloadsEnable => 'Download Next Episodes';

  @override
  String get smartDownloadsEnableDescription =>
      'When you finish an episode on any device, Moonfin downloads the next ones. Episodes it downloads are deleted once watched.';

  @override
  String get smartDownloadsKeepReady => 'Episodes to Keep Downloaded';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keeps the next $count episodes downloaded',
      one: 'Keeps the next episode downloaded',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Episodes already downloaded stay on your device. The new number applies to future downloads.';

  @override
  String get autoDownloadSection => 'Automatic downloads';

  @override
  String get autoDownloadEnable => 'Enable Automatic Downloads';

  @override
  String get autoDownloadEnableSubtitle =>
      'Downloads new episodes of the series you follow. Existing episodes can still be downloaded manually.';

  @override
  String get autoDownloadKeepUnwatched => 'Keep Unwatched Episodes';

  @override
  String get autoDownloadKeepAll => 'All';

  @override
  String get autoDownloadDelete => 'Delete Downloaded Episodes';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'When to remove episodes downloaded for series you follow, after you watch them';

  @override
  String get removeWatchedDownloads => 'Remove Watched Downloads';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'When to remove episodes and movies you downloaded yourself. Only those you watch after turning this on are removed';

  @override
  String get keepDownloaded => 'Keep Downloaded';

  @override
  String get keepDownloadedSubtitle =>
      'Never remove this automatically after watching';

  @override
  String get autoDownloadDeleteNever => 'Never';

  @override
  String get autoDownloadDeleteImmediately => 'Right after watching';

  @override
  String get autoDownloadDeleteAfterDay => '1 day after watching';

  @override
  String get autoDownloadDeleteAfterWeek => '1 week after watching';

  @override
  String get autoDownloadBackgroundRefresh => 'Check in the Background';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Allow the system to check for new episodes periodically while Moonfin is closed';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'Background App Refresh is disabled for Moonfin. Enable it in iOS Settings.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'Background usage is restricted for Moonfin in Android Settings.';

  @override
  String get autoDownloadCheckNow => 'Check Now';

  @override
  String get autoDownloadChecking => 'Checking...';

  @override
  String get autoDownloadNeverChecked => 'Not checked yet';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued episodes queued',
      one: '1 episode queued',
      zero: 'nothing new',
    );
    return 'Last check $when: $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Last check $when failed: $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Followed series';

  @override
  String get autoDownloadNoSubscriptions =>
      'Open a series and choose \"Auto-download new episodes\" from its download menu';

  @override
  String get autoDownloadRemove => 'Stop following';

  @override
  String get autoDownloadStorageFull => 'Not enough storage';

  @override
  String get autoDownloadWaitingForWifi => 'Waiting for WiFi';

  @override
  String get downloadNotificationRunning => 'Downloading';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Downloading ($done/$total)';
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
    return '$name...';
  }

  @override
  String downloadNotificationCompleteTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Downloads complete',
      one: 'Download complete',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name saved for offline';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items saved for offline',
      one: '1 item saved for offline',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$series: $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Download failed';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name: $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Remote message';

  @override
  String get serverMessagesNotificationReceived => 'Message received';

  @override
  String get downloadStorageLimitReached =>
      'Storage limit reached. Free up space or increase the limit.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Not enough storage: $needed needed, $free free';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Not enough storage for new episodes';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes are waiting for space.',
      one: '$name needs $size.',
    );
    return '$_temp0 Free up space or raise the download limit.';
  }

  @override
  String get pageTransitions => 'Page Transitions';

  @override
  String get pageTransitionsSubtitle =>
      'Adjusts fade time when navigating between pages';

  @override
  String get navigationSpeed => 'Navigation Speed';

  @override
  String get navigationSpeedSubtitle =>
      'Adjusts how quickly the focus indicator moves between items and rows';

  @override
  String get modernCardsTransitionSpeed => 'Modern Cards Transition Speed';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Adjusts animation speed when expanding focused modern cards';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Delay Card Expansion on Rapid Scroll';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Waits for focus movement to pause before expanding modern cards';

  @override
  String get animationSpeedExtraSlow => 'Extra Slow';

  @override
  String get animationSpeedSlow => 'Slow';

  @override
  String get animationSpeedMedium => 'Medium';

  @override
  String get animationSpeedFast => 'Fast';

  @override
  String get animationSpeedOff => 'Off';

  @override
  String get pageTransitionFadeNone => 'No Fade';

  @override
  String get pageTransitionFadeShort => 'Short Fade';

  @override
  String get pageTransitionFadeMedium => 'Medium Fade';

  @override
  String get pageTransitionFadeLong => 'Long Fade';

  @override
  String get siriRemoteSwipeSensitivity => 'Touchpad Swipe Sensitivity';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'How far focus moves for each swipe on the Siri Remote touchpad';

  @override
  String get appleTvHomeScreen => 'Apple TV home screen';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'What the Apple TV home screen shows above the Moonfin icon when it is selected. This setting stays on this device.';

  @override
  String get topShelfLatestMedia => 'Latest media';

  @override
  String get topShelfAppBanner => 'Moonfin banner';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Keep Video Clear of the Dynamic Island';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'In landscape the camera housing covers one edge of the screen. This holds the picture back from it, which only changes anything for video wide enough to reach that far.';

  @override
  String get bottomNavbarStyle => 'Bottom Bar Style';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Split';

  @override
  String get bottomNavbarStyleStrip => 'Strip';

  @override
  String get bottomNavbarTabs => 'Bottom Bar Tabs';

  @override
  String get bottomNavbarTabsDescription =>
      'Pin up to 3 tabs between Home and You. Everything else is in the bottom navbar hub.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automatic';

  @override
  String get bottomNavbarTabsPinned => 'Pinned';

  @override
  String get bottomNavbarTabsAvailable => 'Available';

  @override
  String get bottomNavbarTabsReset => 'Reset to Automatic';

  @override
  String get bottomNavbarTabsLimit =>
      'You can pin up to 3 tabs. Remove one to pin another.';

  @override
  String get bottomNavbarTabTurnedOff => 'Turned off under Buttons';

  @override
  String get bottomNavbarSplitSearchNote =>
      'In the Split style, Search always has its own button.';

  @override
  String get bottomNavbarButtonsNote =>
      'These decide what shows in the bottom navbar hub and which tabs you can pin to the bottom bar. Tabs already on the bar aren\'t listed here.';

  @override
  String get navYou => 'You';

  @override
  String get cinemaSkipPrerolls => 'Cinema Mode Skip Button';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Show a Skip button during Cinema Mode trailers, commercials, and other pre-rolls.';

  @override
  String get detailsPage => 'Details Page';

  @override
  String get storageAndDownloads => 'Storage & Downloads';

  @override
  String get integrations => 'Integrazioni';

  @override
  String get settingsSync => 'Settings Sync';

  @override
  String get settingsSyncSubtitle =>
      'Moonbase plugin sync and customization profiles';

  @override
  String get navigationBar => 'Navigation Bar';

  @override
  String get homeRows => 'Rows';

  @override
  String get homeRowsSubtitle => 'Turn rows on or off and change their order';

  @override
  String get rowOptions => 'Row Options';

  @override
  String get rowOptionsSubtitle => 'Sorting and content for each row';

  @override
  String get imageTypePerRow => 'Image Type per Row';

  @override
  String get externalSources => 'External Sources';

  @override
  String get qualityAndDecoding => 'Quality & Decoding';

  @override
  String get qualityAndDecodingSubtitle =>
      'Bitrate, resolution, decoding, HDR, and Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Skipping & Autoplay';

  @override
  String get advancedPlayback => 'Advanced Playback';

  @override
  String get advancedPlaybackSubtitle =>
      'Player routing, external players, and mpv';

  @override
  String get settingsAccountSubtitle =>
      'Sign-in, PIN code, Kids Mode, parental controls, and settings sync';

  @override
  String get settingsGeneralSubtitle =>
      'Language, clock, input, and performance';

  @override
  String get settingsAppearanceSubtitle =>
      'Navigation, home screen, libraries, details page, and themes';

  @override
  String get settingsHomeScreenSubtitle =>
      'Rows, media bar, looks, and external sources';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Library visibility, order, and library pages';

  @override
  String get settingsDetailsPageSubtitle =>
      'Layout, buttons, sections, ratings, and theme music';

  @override
  String get settingsPlaybackSubtitle =>
      'Player, quality, audio, subtitles, skipping, and SyncPlay';

  @override
  String get settingsStorageSubtitle =>
      'Downloads, storage location, and the image cache';

  @override
  String get settingsServicesSubtitle => 'Seerr and Achievement Badges';

  @override
  String get settingsSignInSection => 'Sign-in';

  @override
  String get settingsFamilySection => 'Family';

  @override
  String get settingsServersSection => 'Servers';

  @override
  String get settingsLanguageSection => 'Language';

  @override
  String get settingsInputSection => 'Input';

  @override
  String get settingsMotionSection => 'Motion';

  @override
  String get settingsContentsSection => 'Contents';

  @override
  String get settingsLooksSection => 'Looks';

  @override
  String get settingsAudioAndSubtitlesSection => 'Audio & Subtitles';

  @override
  String get settingsSkippingAndQueueSection => 'Skipping & Queue';

  @override
  String get settingsWatchTogetherSection => 'Watch Together';

  @override
  String get settingsAdvancedSection => 'Advanced';

  @override
  String get playerSettingsSubtitle =>
      'Controls, seeking, player buttons, and trick play';

  @override
  String get siloPasswordChangeTitle => 'Choose a new password';

  @override
  String get siloPasswordChangeMessage =>
      'This account has a temporary password. Choose a new one to finish signing in.';

  @override
  String get siloPasswordChangeNew => 'New password';

  @override
  String get siloPasswordChangeConfirm => 'Confirm new password';

  @override
  String get siloPasswordChangeSubmit => 'Change password';

  @override
  String siloPasswordChangeTooShort(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Use at least $count characters',
      one: 'Use at least 1 character',
    );
    return '$_temp0';
  }

  @override
  String get siloPasswordChangeTooLong => 'That password is too long';

  @override
  String get siloPasswordChangeMismatch => 'The passwords don\'t match';

  @override
  String get siloPasswordChangeSameAsTemporary =>
      'Choose a password different from the temporary one';

  @override
  String get siloPasswordChangeFailed =>
      'Couldn\'t change the password. Try again.';

  @override
  String get siloPasswordChangeUnavailable =>
      'This account has a temporary password, and this server doesn\'t allow changing it here. Change it in Silo\'s web app, then sign in again.';

  @override
  String get siloPasswordChangedSignInAgain =>
      'Your password was changed. Sign in with the new password.';

  @override
  String get siloServerRowSubtitle => 'From your server';

  @override
  String get playlistSortReleaseDate => 'Release Date';

  @override
  String get playlistSortCriticRating => 'Critic Rating';

  @override
  String get playlistSortRuntime => 'Runtime';

  @override
  String get playlistSortLastPlayed => 'Last Played';

  @override
  String get playlistSortPlayCount => 'Play Count';

  @override
  String get playlistSortRandom => 'Random';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active',
      one: '1 active',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks => 'No tracks match the active filters';

  @override
  String get librarySortPlaylistOrder => 'Playlist Order';

  @override
  String get librarySortDateAdded => 'Date Added';

  @override
  String get librarySortDateEpisodeAdded => 'Date Episode Added';

  @override
  String get librarySortParentalRating => 'Parental Rating';

  @override
  String get librarySortMyRating => 'My Rating';

  @override
  String get librarySortAlbumArtist => 'Album Artist';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Artist';

  @override
  String get librarySortTrackNumber => 'Track Number';

  @override
  String get librarySortGenre => 'Genre';

  @override
  String get librarySortFoldersFirst => 'Folders First';

  @override
  String get librarySortLength => 'Length';

  @override
  String get homeScreenBackdrop => 'Home Screen Backdrop';

  @override
  String get homeScreenBackdropFullScreen => 'Full Screen';

  @override
  String get homeScreenBackdropCorner => 'Corner';

  @override
  String get homeScreenBackdropTop => 'Top';

  @override
  String get detailsScreenBackdrop => 'Details Screen Backdrop';

  @override
  String get detailsBackdropSize => 'Backdrop Size';

  @override
  String get detailsBackdropFullScreen => 'Full Screen';

  @override
  String get detailsBackdropFit => 'Fit';

  @override
  String get libraryBackdrops => 'Library Backdrops';

  @override
  String get playbackInfoChannel => 'Channel';

  @override
  String get playbackInfoProgram => 'Program';

  @override
  String get playbackInfoWhy => 'Why';

  @override
  String get playbackInfoQualityLimit => 'Quality Limit';

  @override
  String get playbackInfoFrameRate => 'Frame Rate';

  @override
  String get playbackInfoDelivery => 'Delivery';

  @override
  String get playbackInfoFile => 'File';

  @override
  String get playbackInfoTechnical => 'Technical';

  @override
  String get playbackInfoDevice => 'Device';

  @override
  String get playbackInfoAudioRoute => 'Audio Route';

  @override
  String get playbackInfoSurround51 => '5.1 surround';

  @override
  String get playbackInfoSurround71 => '7.1 surround';

  @override
  String playbackInfoChannelCount(int count) {
    return '$count channels';
  }

  @override
  String get playbackInfoBurnedIn => 'Burned in by the server';

  @override
  String playbackInfoOriginal(String value, String original) {
    return '$value (original $original)';
  }

  @override
  String playbackInfoConvertedFrom(String value, String source) {
    return '$value (converted from $source)';
  }

  @override
  String playbackInfoResolutionConverted(
    String name,
    String size,
    String source,
  ) {
    return '$name ($size, converted from $source)';
  }

  @override
  String get playbackInfoNoteDirectPlay => 'Playing the original file as is.';

  @override
  String get playbackInfoNoteDirectStream =>
      'The server is repackaging the file without converting it.';

  @override
  String get playbackInfoNoteTranscodeVideo =>
      'The server is converting the video so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeAudio =>
      'The server is converting the audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeBoth =>
      'The server is converting the video and audio so this device can play it.';

  @override
  String get playbackInfoNoteTranscodeUnknown =>
      'The server is converting this file so this device can play it.';

  @override
  String get playbackInfoNoteOffline => 'Playing a downloaded copy.';

  @override
  String get playbackInfoWhyForced => 'Transcoding is forced in settings';

  @override
  String get playbackInfoWhyBitrate =>
      'The bitrate is above the streaming limit';

  @override
  String get playbackInfoWhyContainer =>
      'This device can\'t play this file type';

  @override
  String get playbackInfoWhyVideo =>
      'This device can\'t play this video format';

  @override
  String get playbackInfoWhyHdr => 'This device can\'t display this HDR format';

  @override
  String get playbackInfoWhyAudio =>
      'This device can\'t play this audio format';

  @override
  String get playbackInfoWhySubtitles =>
      'Subtitles are being burned into the video';

  @override
  String get playbackInfoWhyOther => 'The file couldn\'t be played directly';

  @override
  String playbackInfoWhyBitrateLimit(String bitrate, String limit) {
    return '$bitrate is above the $limit streaming limit';
  }

  @override
  String playbackInfoWhyContainerName(String container) {
    return 'This device can\'t open $container files';
  }

  @override
  String playbackInfoWhyVideoCodec(String codec) {
    return 'This device can\'t play $codec video';
  }

  @override
  String playbackInfoWhyVideoProfile(String codec, String profile) {
    return 'This device can\'t play $codec $profile video';
  }

  @override
  String playbackInfoWhyVideoLevel(String codec, String level) {
    return 'This device can\'t play $codec level $level video';
  }

  @override
  String playbackInfoWhyVideoBitDepth(int bits) {
    return 'This device can\'t play $bits-bit video';
  }

  @override
  String playbackInfoWhyVideoResolution(String resolution) {
    return 'This device can\'t play $resolution video';
  }

  @override
  String playbackInfoWhyVideoFrameRate(String fps) {
    return 'This device can\'t play $fps fps video';
  }

  @override
  String get playbackInfoWhyInterlaced =>
      'This device can\'t play interlaced video';

  @override
  String get playbackInfoWhyAnamorphic =>
      'This device can\'t play anamorphic video';

  @override
  String playbackInfoWhyHdrName(String range) {
    return 'This device can\'t display $range';
  }

  @override
  String playbackInfoWhyAudioCodec(String format) {
    return 'This device can\'t play $format audio';
  }

  @override
  String playbackInfoWhyAudioProfile(String fullFormat) {
    return 'This device can\'t play $fullFormat';
  }

  @override
  String playbackInfoWhyAudioChannels(String channels) {
    return 'This device can\'t play $channels audio';
  }

  @override
  String playbackInfoWhyAudioSampleRate(String rate) {
    return 'This device can\'t play $rate kHz audio';
  }

  @override
  String playbackInfoWhyAudioBitDepth(int bits) {
    return 'This device can\'t play $bits-bit audio';
  }

  @override
  String get playbackInfoWhyAudioExternal =>
      'The audio track is in a separate file';

  @override
  String get playbackInfoWhySecondaryAudio =>
      'This device can only play the first audio track';

  @override
  String playbackInfoWhySubtitleFormat(String format) {
    return '$format subtitles are being burned into the video';
  }

  @override
  String get playbackInfoDroppedFrames => 'Dropped Frames';

  @override
  String get playFromServer => 'Play from Server';

  @override
  String get settingsApplePlayerUi => 'Video player';

  @override
  String get settingsApplePlayerUiDescription =>
      'The native Apple style player has no casting, audio delay or PiP button, and its rotation lock is only in Live TV';

  @override
  String get settingsApplePlayerUiStandard => 'Standard';

  @override
  String get settingsApplePlayerUiNative => 'Native Apple style';

  @override
  String get playerTransportPosition => 'Play buttons';

  @override
  String get playerTransportPositionDescription =>
      'Show play, skip and seek in the middle of the video or docked in the bottom bar';

  @override
  String get playerTransportOnScreen => 'On screen';

  @override
  String get playerTransportDocked => 'Docked';

  @override
  String get incompleteRecording => 'Incomplete';

  @override
  String incompleteRecordingMinutes(int recorded, int expected) {
    return '$recorded of $expected min';
  }

  @override
  String completeShowingScheduled(String dateTime) {
    return 'Complete showing scheduled $dateTime';
  }

  @override
  String completeCopyRecorded(String dateTime) {
    return 'Complete copy recorded $dateTime';
  }

  @override
  String get noCompleteShowingFound => 'No complete showing found';

  @override
  String get keepAsComplete => 'Keep as Complete';

  @override
  String get keptAsComplete => 'Marked as complete';

  @override
  String get unableToKeepAsComplete => 'Unable to mark as complete';

  @override
  String recordPromptTitle(String name) {
    return 'Record $name';
  }

  @override
  String recordPromptStarted(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other:
          'This showing started $minutes minutes ago, so the recording will miss the start.',
      one: 'This showing started 1 minute ago, so the recording will miss the start.',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptAlsoRecordLater =>
      'Also record the future showing to get a complete recording?';

  @override
  String get recordPromptSearchLater =>
      'Also record a future showing automatically once one is found, to get a complete recording?';

  @override
  String get recordPromptNow => 'Now';

  @override
  String get recordPromptLater => 'Future showing';

  @override
  String recordPromptAired(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes min already aired',
      one: '1 min already aired',
    );
    return '$_temp0';
  }

  @override
  String get recordPromptUncertainMatch =>
      'Matched by title and description only. Check it\'s the same program.';

  @override
  String get recordPromptDescriptionsDiffer =>
      'The descriptions differ, so this may be a different program.';

  @override
  String recordPromptSameEpisode(int season, int episode) {
    return 'Same episode (S${season}E$episode)';
  }

  @override
  String get recordPromptAlreadyScheduled => 'Already set to record';

  @override
  String get recordPromptTomorrow => 'Tomorrow';

  @override
  String get recordNowOnly => 'Record Now Only';

  @override
  String recordNowAnd(String when) {
    return 'Record Now and $when';
  }

  @override
  String get recordNowAndLater => 'Record Now and Future Showing';

  @override
  String recordOnlyLater(String when) {
    return 'Record $when Only';
  }

  @override
  String get recordLaterShowingOnly => 'Record Future Showing Only';

  @override
  String get laterShowingOnlyRequested =>
      'The future showing will be recorded.';

  @override
  String get unableToRequestLaterShowingOnly =>
      'Couldn\'t request the future showing, so nothing will be recorded.';

  @override
  String get laterShowingRequested =>
      'Recording started. A future showing will be recorded too.';

  @override
  String get unableToRequestLaterShowing =>
      'Recording started, but couldn\'t request a future showing.';

  @override
  String get siloCodeSignIn => 'Sign in with a code';

  @override
  String siloCodeSignInInstruction(String address) {
    return 'Scan the QR code with your phone, or go to $address on any signed-in device and enter this code:';
  }

  @override
  String get siloCodeSignInInstructionNoLink =>
      'Enter this code in Silo on a device where you\'re signed in:';

  @override
  String get siloCodeSignInOpened =>
      'Code found. Approve the sign-in on your other device.';

  @override
  String get siloCodeSignInDenied => 'This sign-in was declined.';

  @override
  String get siloCodeSignInNewCode => 'Get a new code';

  @override
  String get siloCodeSignInOff =>
      'Signing in with a code is turned off on this server.';

  @override
  String get siloCodeSignInPasswordChangeRequired =>
      'This account has a temporary password. Sign in with the password once to replace it.';

  @override
  String get siloApproveSignIn => 'Approve a sign-in';

  @override
  String get siloApproveSignInHint => 'Code shown on the other device';

  @override
  String get siloApproveSignInApprove => 'Approve';

  @override
  String get siloApproveSignInDone =>
      'Approved. The other device is signing in.';

  @override
  String get siloApproveSignInNoRequest =>
      'No sign-in is waiting with that code. Check it, or get a new code on the other device.';

  @override
  String get siloNativeOfferTitle => 'Connect to Silo directly?';

  @override
  String siloNativeOfferMessage(String serverName, String address) {
    return 'This address is the Jellyfin-compatible service of $serverName. Moonfin can connect to Silo directly at $address, with Silo\'s own features.';
  }

  @override
  String get siloNativeOfferUse => 'Use Silo';

  @override
  String get siloNativeOfferKeep => 'Keep Jellyfin';

  @override
  String get siloAppUpdateRequired =>
      'This Silo server needs a newer version of Moonfin. Update Moonfin to use it.';

  @override
  String get siloServerUpdateRequired =>
      'This Silo server is too old for this version of Moonfin. Update Silo to use it.';

  @override
  String get siloTooManyAttempts => 'Too many attempts. Try again later.';

  @override
  String siloTooManyAttemptsWait(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get siloServerBusy =>
      'The server is busy or still starting. Try again later.';

  @override
  String siloServerBusyWait(String wait) {
    return 'The server is busy or still starting. Try again in $wait.';
  }

  @override
  String siloWaitSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seconds',
      one: '1 second',
    );
    return '$_temp0';
  }

  @override
  String siloWaitMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String get siloPlaybackUnavailable =>
      'Playback isn\'t available on this Silo server.';

  @override
  String get siloPlaybackUpdateRequired =>
      'This Silo server needs a newer version of Moonfin to play.';

  @override
  String get siloPlaybackEndedOnServer =>
      'Playback was ended on the Silo server.';

  @override
  String siloPinTitle(String name) {
    return 'PIN for $name';
  }

  @override
  String get siloPinHint => 'PIN';

  @override
  String get siloPinUnlock => 'Unlock';

  @override
  String get siloPinWrong => 'That PIN isn\'t right.';

  @override
  String get siloPinLocked => 'Too many wrong PINs. Try again later.';

  @override
  String siloPinLockedWait(String wait) {
    return 'Too many wrong PINs. Try again in $wait.';
  }

  @override
  String get siloPinFailed => 'The PIN couldn\'t be checked. Try again.';

  @override
  String get siloSignOutAccount => 'Sign out of the Silo account';

  @override
  String trailerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trailers',
      one: '1 trailer',
    );
    return '$_temp0';
  }

  @override
  String trailerNumber(int number) {
    return 'Trailer $number';
  }

  @override
  String get subtitled => 'Subtitled';

  @override
  String get rommAccount => 'RomM account';

  @override
  String get rommAccountIntro =>
      'Link your RomM account to play from your own RomM library and keep your saves in RomM.';

  @override
  String get rommLinkAccount => 'Link RomM account';

  @override
  String get rommLinkInstructions =>
      'Sign in to RomM and enter this code to link your account.';

  @override
  String rommLinkScanOrVisit(String url) {
    return 'Scan the QR code with your phone, or go to $url';
  }

  @override
  String get rommOpen => 'Open RomM';

  @override
  String get rommWaitingForApproval =>
      'Waiting for you to approve the code in RomM...';

  @override
  String rommLinkedAs(String username) {
    return 'Linked as $username';
  }

  @override
  String get rommLinked => 'Your RomM account is linked.';

  @override
  String get rommUnlinkNote =>
      'Unlinking stops Moonfin from using your RomM key. The key stays in RomM until you remove it from your API tokens there.';

  @override
  String get rommUnlink => 'Unlink';

  @override
  String get rommLinkExpired =>
      'The code expired before it was approved. Link again to get a new one.';

  @override
  String get rommLinkDenied => 'The link was turned down in RomM.';

  @override
  String get rommUnreachable =>
      'Moonfin couldn\'t reach RomM. Try again in a moment.';

  @override
  String get rommNotAvailable => 'This server has no RomM library.';

  @override
  String get rommAccountLoadFailed => 'Couldn\'t load your RomM account.';

  @override
  String get reviews => 'Reviews';

  @override
  String get detailSectionReviews => 'Reviews';

  @override
  String spotlightReviewsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reviews',
      one: '1 review',
    );
    return '$_temp0';
  }

  @override
  String get readOnTmdb => 'Read on TMDB';

  @override
  String get addServerButtonSubtitle =>
      'By address, or with a Plex or Emby Connect account';

  @override
  String get addServerChooseHow => 'Choose how you\'d like to connect.';

  @override
  String get addServerAddressChoice =>
      'Jellyfin, Emby or Silo on your network or online';

  @override
  String get addServerPlexChoice => 'Use your Plex account to find its servers';

  @override
  String get addServerAddressHelp =>
      'The same address you\'d open in a browser, including the port.';

  @override
  String get addServerDetectNote =>
      'Works with Jellyfin, Emby and Silo. A Plex address opens the Plex sign-in.';

  @override
  String addServerChecking(String address) {
    return 'Checking $address';
  }

  @override
  String get addServerUnreachableDetail =>
      'Check the address and port, and that the server is running.';

  @override
  String get addServerFound => 'Server found';

  @override
  String get addServerFoundNote => 'Continue to choose who\'s signing in.';

  @override
  String get addServerUseDifferentAddress => 'Use a different address';

  @override
  String musicArtistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count artists',
      one: '1 artist',
    );
    return '$_temp0';
  }

  @override
  String musicSongCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count songs',
      one: '1 song',
    );
    return '$_temp0';
  }

  @override
  String musicPlaylistCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count playlists',
      one: '1 playlist',
    );
    return '$_temp0';
  }

  @override
  String musicPlayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count plays',
      one: '1 play',
    );
    return '$_temp0';
  }

  @override
  String get allArtists => 'All Artists';

  @override
  String get libraryZToA => 'Z to A';

  @override
  String get musicSortYear => 'Year';

  @override
  String get musicFilter => 'Filter';

  @override
  String get musicGenreFilterTitle => 'Filter by Genre';

  @override
  String get openAlbum => 'Open Album';

  @override
  String get openPlaylist => 'Open Playlist';

  @override
  String get allSongsAToZ => 'All Songs A to Z';

  @override
  String get musicMix => 'Mix';

  @override
  String get musicMixEverything => 'Everything';

  @override
  String get musicMixEverythingSubtitle => '300 songs at random';

  @override
  String get mostPlayed => 'Most Played';

  @override
  String get musicMixMostPlayedSubtitle => 'Your top 100';

  @override
  String get musicMixFreshArrivals => 'Fresh Arrivals';

  @override
  String get musicMixFreshArrivalsSubtitle => 'The newest 100 songs';

  @override
  String get musicMixRediscover => 'Rediscover';

  @override
  String get musicMixRediscoverSubtitle =>
      'Favorites you haven\'t played lately';

  @override
  String get musicSortMostAlbums => 'Most Albums';

  @override
  String bookSeriesPosition(int index, int total) {
    return 'Book $index of $total';
  }

  @override
  String bookFavoriteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count favorites',
      one: '1 favorite',
    );
    return '$_temp0';
  }

  @override
  String get bookSortZToA => 'Z to A';

  @override
  String get bookSortMostTitles => 'Most Titles';

  @override
  String get bookSurpriseMe => 'Surprise Me';

  @override
  String get bookShuffleAudiobooks => 'Shuffle Audiobooks';

  @override
  String get bookStartReading => 'Start Reading';

  @override
  String get bookOtherBooks => 'Other Books';

  @override
  String get bookDiscoverSearchBooks => 'Search Open Library';

  @override
  String get bookDiscoverSearchAudiobooks => 'Search LibriVox';

  @override
  String get bookDiscoverFeatured => 'Featured';

  @override
  String get bookReaderControlsAutoHide => 'Controls hide automatically';

  @override
  String get bookReaderControlsStayVisible => 'Controls stay visible';

  @override
  String get settingsLivePreview => 'Live preview';

  @override
  String settingsPreviewShowsOn(String screen) {
    return 'Shows on the $screen preview';
  }

  @override
  String get settingsPreviewNotShown => 'Not shown in the preview';

  @override
  String get settingsPreviewSaved => 'Saved';
}
