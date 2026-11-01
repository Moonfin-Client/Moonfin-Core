// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

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
  String get interfaceLanguage => 'Idioma da interface';

  @override
  String get systemLanguageDefault => 'Predeterminado do sistema';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Baleiro';

  @override
  String connectingToServer(String serverName) {
    return 'Conectando a $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Contrasinal';

  @override
  String get username => 'Nome de usuario';

  @override
  String get email => 'Correo electrónico';

  @override
  String get quickConnectInstruction =>
      'Introduce este código no panel web do teu servidor:';

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
  String get waitingForAuthorization => 'Agardando autorización...';

  @override
  String get back => 'Atrás';

  @override
  String get serverUnavailable => 'O servidor non está dispoñible';

  @override
  String get loginFailed => 'Fallou o inicio de sesión';

  @override
  String get loginForbidden =>
      'This account can\'t sign in right now. It may be outside its allowed hours, locked or disabled. Try again later or ask an administrator.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect non dispoñible: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect non dispoñible ($status): $detail';
  }

  @override
  String get whosWatching => 'Quen está mirando?';

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
  String get addUser => 'Engadir usuario';

  @override
  String get selectServer => 'Seleccione Servidor';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versión $version';
  }

  @override
  String get savedServers => 'Servidores gardados';

  @override
  String get discoveredServers => 'Servidores descubertos';

  @override
  String get noneFound => 'Non se atopou ningún';

  @override
  String get unableToConnectToServer => 'Non se puido conectar ao servidor';

  @override
  String get addServer => 'Engadir servidor';

  @override
  String get embyConnect => 'Emby Conectar';

  @override
  String get removeServer => 'Eliminar servidor';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Queres eliminar \"$serverName\" dos teus servidores?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Retirar';

  @override
  String get connectToServer => 'Conectar ao servidor';

  @override
  String get serverAddress => 'Enderezo do servidor';

  @override
  String get serverAddressHint => 'https://o-teu-servidor.exemplo.com';

  @override
  String get connect => 'Conectar';

  @override
  String get secureStorageUnavailable => 'Almacenamento seguro non dispoñible';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin non puido acceder ao teu anel de chaves do sistema. O inicio de sesión pode continuar, pero é posible que o almacenamento seguro de tokens non estea dispoñible ata que se desbloquee o anel de chaves.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema da aplicación';

  @override
  String get detailScreenStyle => 'Estilo da pantalla de detalles';

  @override
  String get detailScreenStyleSubtitle =>
      'Clásico é a disposición centrada orixinal de Moonfin. Moderno é unha disposición cinematográfica adaptable.';

  @override
  String get detailScreenStyleMoonfin => 'Clásico';

  @override
  String get detailScreenStyleModern => 'Moderno';

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
  String get expandedTabs => 'Pestanas despregadas';

  @override
  String get expandedTabsSubtitle =>
      'Mostra automaticamente o contido das pestanas mentres navegas por elas. Desactívao para abrir e pechar cada pestana manualmente.';

  @override
  String get showTechnicalDetails => 'Mostrar os detalles técnicos?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Mostra o códec, a resolución e a información do fluxo no resumo do báner';

  @override
  String get recommendationSystem => 'Sistema de recomendacións';

  @override
  String get recommendationSystemSubtitle =>
      'Usa o algoritmo local de recomendacións de Moonfin (Recomendacións Moonfin) ou as métricas de similitude en liña de TMDb. Nota: as recomendacións en liña requiren a integración con Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Recomendacións Moonfin';

  @override
  String get recommendationSystemJellyfin => 'Jellyfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Similitude de TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Aplicar o límite de clasificación parental?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limita as suxestións de Recomendacións Moonfin segundo a clasificación parental do contido de destino';

  @override
  String get interfaceStyle => 'Estilo da interface';

  @override
  String get interfaceStyleSubtitle =>
      'Automático adáptase ao teu dispositivo. Escolle Apple ou Material para forzar un aspecto concreto.';

  @override
  String get interfaceStyleAutomatic => 'Automático';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Interface Layout';

  @override
  String get interfaceLayoutSubtitle =>
      'Override the detected layout when this device is read wrong. Restart Moonfin for changes to take effect.';

  @override
  String get interfaceLayoutAutomatic => 'Automatic';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Desktop';

  @override
  String get interfaceLayoutPhone => 'Phone';

  @override
  String get glassQuality => 'Calidade de Glass';

  @override
  String get oledMode => 'OLED Mode';

  @override
  String get oledModeSubtitle =>
      'Deepen blacks and enrich artwork. Best on OLED displays.';

  @override
  String get oledModeSubtle => 'Subtle';

  @override
  String get oledModeVivid => 'Vivid';

  @override
  String get glassQualitySubtitle =>
      'Auto escolle o mellor efecto Glass para este dispositivo. Completo forza un desenfoque real; Reducido usa un efecto lixeiro que aforra enerxía da GPU.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Completo';

  @override
  String get glassQualityReduced => 'Reducido';

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
      'Cambia entre Moonfin e Neon Pulse sen reiniciar a aplicación';

  @override
  String get customThemeTitle => 'Tema personalizado';

  @override
  String get customThemeSubtitle =>
      'Os temas personalizados modifican os elementos visuais de todo Moonfin. Escolle unha destas opcións segundo o teu estilo.';

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
      'Look actual de Moonfin que todos che gustaron';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Estilo Synthwave con brillo magenta, texto cian e contraste cromado máis forte';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Estilo Liquid Glass cun fondo de degradado en movemento, superficies esmeriladas e acento azul Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Estilo retro de pixel art cunha paleta contundente, bordos cadrados, sombras marcadas e unha tipografía de píxeles';

  @override
  String get embyConnectSignInSubtitle =>
      'Inicia sesión coa túa conta de Emby Connect';

  @override
  String get emailOrUsername => 'Correo electrónico ou nome de usuario';

  @override
  String get selectAServer => 'Seleccione un servidor';

  @override
  String get tryAgain => 'Téntao de novo';

  @override
  String get noLinkedServers =>
      'Non hai servidores vinculados a esta conta de Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'As credenciais de Emby Connect non son válidas';

  @override
  String get invalidEmbyConnectLogin =>
      'Nome de usuario ou contrasinal de Emby Connect non válido';

  @override
  String get embyConnectExchangeNotSupported =>
      'O servidor non admite o intercambio Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Erro de rede ao contactar con Emby Connect ou co servidor seleccionado';

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
  String get loadingLinkedServers => 'Cargando servidores vinculados...';

  @override
  String get connectingToServerEllipsis => 'Conectando ao servidor...';

  @override
  String get noReachableAddress =>
      'Non se proporcionou ningún enderezo accesible';

  @override
  String get invalidServerExchangeResponse =>
      'Resposta non válida do punto final de intercambio do servidor';

  @override
  String unableToConnectTo(String target) {
    return 'Non se puido conectar a $target';
  }

  @override
  String get exitApp => 'Saír de Moonfin?';

  @override
  String get exitAppConfirmation => 'Estás seguro de que queres saír?';

  @override
  String get exit => 'Saír';

  @override
  String get gameMenu => 'Menú';

  @override
  String get gamePaused => 'Pausado';

  @override
  String get gameSaveState => 'Gardar estado';

  @override
  String get games => 'Xogos';

  @override
  String get gameLoadState => 'Cargar estado';

  @override
  String get gameFastForward => 'Avance rápido';

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
  String get gameEmulatorSettings => 'Configuración do emulador';

  @override
  String get gameNoCoreOptions => 'Este núcleo non ten opcións axustables.';

  @override
  String get gameHoldToOpenMenu => 'Mantén premido para abrir o menú';

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
      'Aínda non se poden executar xogos neste dispositivo.';

  @override
  String get noHomeRowsLoaded => 'Non se puideron cargar filas de inicio';

  @override
  String get noHomeRowsHint =>
      'Proba a actualizar ou reducir as seccións de casa activas.';

  @override
  String get retryHomeRows => 'Volve tentar as filas de inicio';

  @override
  String get guide => 'Guía';

  @override
  String get recordings => 'Gravacións';

  @override
  String get schedule => 'Horario';

  @override
  String get series => 'Series';

  @override
  String get noItemsFound => 'Non se atoparon elementos';

  @override
  String get home => 'Inicio';

  @override
  String get browseAll => 'Explorar todo';

  @override
  String get genres => 'Xéneros';

  @override
  String get collectionPlaceholder =>
      'Os elementos da colección aparecerán aquí';

  @override
  String get browseByLetter => 'Navega por letra';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'A navegación alfabética aparecerá aquí';

  @override
  String get suggestions => 'Suxestións';

  @override
  String get suggestionsPlaceholder => 'Os elementos suxeridos aparecerán aquí';

  @override
  String get failedToLoadLibraries =>
      'Produciuse un erro ao cargar as bibliotecas';

  @override
  String get noLibrariesFound => 'Non se atoparon bibliotecas';

  @override
  String get library => 'Biblioteca';

  @override
  String get displaySettings => 'Configuración de visualización';

  @override
  String get allGenres => 'Todos os xéneros';

  @override
  String get noGenresFound => 'Non se atopou ningún xénero';

  @override
  String failedToLoadFolderError(String error) {
    return 'Produciuse un erro ao cargar o cartafol: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Este cartafol está baleiro';

  @override
  String itemCountLabel(int count) {
    return '$count elementos';
  }

  @override
  String get failedToLoadFavorites =>
      'Produciuse un erro ao cargar os favoritos';

  @override
  String get retry => 'Volve tentar';

  @override
  String get noFavoritesYet => 'Aínda non hai favoritos';

  @override
  String get favorites => 'Favoritos';

  @override
  String totalCountItems(int count) {
    return '$count Elementos';
  }

  @override
  String get continuing => 'Continuando';

  @override
  String get ended => 'Rematou';

  @override
  String get sortAndFilter => 'Ordenar e filtrar';

  @override
  String get type => 'Tipo';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get display => 'Mostrar';

  @override
  String get imageType => 'Tipo de imaxe';

  @override
  String get posterSize => 'Tamaño do póster';

  @override
  String get small => 'Pequeno';

  @override
  String get medium => 'Medio';

  @override
  String get large => 'Grande';

  @override
  String get extraLarge => 'Extra grande';

  @override
  String get uiScaleGrandparents => 'Grandparents';

  @override
  String get uiScaleGreatGrandparents => 'Great-Grandparents';

  @override
  String get scrollDirection => 'Scroll Direction';

  @override
  String get scrollDirectionVertical => 'Vertical';

  @override
  String get scrollDirectionHorizontal => 'Horizontal';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Xéneros';
  }

  @override
  String get views => 'Vistas';

  @override
  String get albums => 'Álbums';

  @override
  String get albumArtists => 'Artistas do álbum';

  @override
  String get artists => 'Artistas';

  @override
  String get bookmarks => 'Marcadores';

  @override
  String get noSavedBookmarks =>
      'Aínda non se gardou ningún marcador para este título.';

  @override
  String get openBook => 'Libro Aberto';

  @override
  String get chapter => 'Capítulo';

  @override
  String get page => 'Páx';

  @override
  String get bookmark => 'Marcador';

  @override
  String get justNow => 'Xusto agora';

  @override
  String minutesAgo(int count) {
    return 'hai ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'hai ${count}h';
  }

  @override
  String daysAgo(int count) {
    return '${count}d hai';
  }

  @override
  String get discoverySubjects => 'Materias de descubrimento';

  @override
  String get apply => 'Aplicar';

  @override
  String get openLink => 'Abrir ligazón';

  @override
  String get scanWithYourPhone => 'Escanee co seu teléfono';

  @override
  String get audiobookGenres => 'Xéneros de audiolibros';

  @override
  String get scrollLeft => 'Desprácese á esquerda';

  @override
  String get scrollRight => 'Desprácese á dereita';

  @override
  String get scrollToTop => 'Scroll to top';

  @override
  String get couldNotLoadGenre =>
      'Non se puido cargar este xénero neste momento.';

  @override
  String get continueReading => 'Continúe lendo';

  @override
  String get savedHighlights => 'Destacados gardados';

  @override
  String get continueListening => 'Seguir escoitando';

  @override
  String get listen => 'Escoita';

  @override
  String get resume => 'Retomar';

  @override
  String get failedToLoadLibrary => 'Produciuse un erro ao cargar a biblioteca';

  @override
  String get popularNow => 'Popular agora';

  @override
  String get savedForLater => 'Gardado para máis tarde';

  @override
  String get topListens => 'Principais escoitas';

  @override
  String get unreadDiscoveries => 'Descubrimentos sen ler';

  @override
  String get pickUpAgain => 'Recoller de novo';

  @override
  String get bookHighlightsDescription =>
      'Os teus libros con elementos destacados, favoritos ou progreso da lectura.';

  @override
  String get handPickedFromLibrary => 'Escollido a dedo da túa biblioteca.';

  @override
  String get handPickedFromListeningQueue =>
      'Escollido a dedo da túa cola de escoita.';

  @override
  String get booksWithHighlights =>
      'Libros con aspectos destacados, favoritos ou progreso da lectura.';

  @override
  String get jumpBackNarration => 'Volve á narración sen buscar o teu lugar.';

  @override
  String get unreadBooksReady =>
      'Libros sen ler listos para a próxima hora tranquila.';

  @override
  String get quickAccessFavorites =>
      'Acceso rápido aos libros aos que segues volvendo.';

  @override
  String get searchAudiobooks => 'Busca audiolibros';

  @override
  String get searchYourLibrary => 'Busca na túa biblioteca';

  @override
  String get pickUpStory => 'Retoma a historia onde a deixaches';

  @override
  String get savedPlacesChapters =>
      'Os teus lugares gardados e capítulos sen rematar';

  @override
  String authorsCount(int count) {
    return '$count autores';
  }

  @override
  String genresCount(int count) {
    return '$count xéneros';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent % completado';
  }

  @override
  String get readyWhenYouAre => 'Listo cando estea';

  @override
  String get details => 'Detalles';

  @override
  String get listeningRoom => 'Sala de audición';

  @override
  String get bookmarksAndProgress => 'Marcadores e progreso';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count títulos dispostos para a primeira lectura.';
  }

  @override
  String get titles => 'Títulos';

  @override
  String get allTitles => 'Todos os títulos';

  @override
  String get authors => 'Autores';

  @override
  String get browseByAuthor => 'Navegar por autor';

  @override
  String get browseByGenre => 'Buscar por xénero';

  @override
  String get discover => 'Descubrir';

  @override
  String get noBookmarkedItems =>
      'Aínda non hai elementos marcados como favoritos';

  @override
  String get nothingMatchesSection =>
      'Aínda non hai nada que coincida con esta sección. Proba con outra pestana ou volve despois de que remate a sincronización da biblioteca.';

  @override
  String get audiobooks => 'Audiolibros';

  @override
  String noLabelFound(String label) {
    return 'Non se atopou $label';
  }

  @override
  String get folder => 'Cartafol';

  @override
  String get filters => 'Filtros';

  @override
  String get readingStatus => 'Estado de lectura';

  @override
  String get playedStatus => 'Estado de xogo';

  @override
  String get readStatus => 'Ler';

  @override
  String get watched => 'Visto';

  @override
  String get unread => 'Non lido';

  @override
  String get unwatched => 'Non visto';

  @override
  String get seriesStatus => 'Estado da serie';

  @override
  String get allLibraries => 'Todas as bibliotecas';

  @override
  String get books => 'Libros';

  @override
  String get latestBooks => 'Últimos libros';

  @override
  String get latestAudiobooks => 'Últimos audiolibros';

  @override
  String get latestComics => 'Latest Comics';

  @override
  String get comics => 'Comics';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count libros',
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
  String get noBooksFound => 'Non se atoparon libros para este autor.';

  @override
  String get noBooksFoundDescription =>
      'This library does not contain any books, audiobooks, or comics yet.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% lido';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Quedan $time';
  }

  @override
  String get bookHeroRead => 'Ler';

  @override
  String get bookHeroListen => 'Escoitar';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Autor descoñecido';

  @override
  String get uncategorized => 'Sen categorizar';

  @override
  String get overview => 'Visión xeral';

  @override
  String get noLibrivoxDescription =>
      'LibriVox aínda non proporcionou ningunha descrición para este título.';

  @override
  String get readers => 'Lectores';

  @override
  String get openLinks => 'Abrir Ligazóns';

  @override
  String get librivoxPage => 'Páxina de LibriVox';

  @override
  String get internetArchive => 'Arquivo de Internet';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Descargar Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count seccións';
  }

  @override
  String firstPublished(int year) {
    return 'Publicado por primeira vez $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Aínda non hai unha visión xeral dispoñible en Open Library para este título.';

  @override
  String get subjects => 'Materias';

  @override
  String get all => 'Todos';

  @override
  String booksCount(int count) {
    return '$count libros';
  }

  @override
  String get couldNotLoadSubject =>
      'Non se puido cargar este asunto neste momento.';

  @override
  String get audiobookDetails => 'Detalles do audiolibro';

  @override
  String authorsCountTitle(int count) {
    return '$count Autores';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiolibros',
      one: '1 audiolibro',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista de pistas';

  @override
  String get itemListPlaceholder => 'A lista de elementos aparecerá aquí';

  @override
  String get failedToLoad => 'Produciuse un erro ao cargar';

  @override
  String get delete => 'Eliminar';

  @override
  String get save => 'Gardar';

  @override
  String get moreLikeThis => 'Máis así';

  @override
  String get castAndCrew => 'Elenco e equipo';

  @override
  String get collection => 'Colección';

  @override
  String get episodes => 'Episodios';

  @override
  String get nextUp => 'A continuación';

  @override
  String get seasons => 'Tempadas';

  @override
  String get chapters => 'Capítulos';

  @override
  String get features => 'Características';

  @override
  String get movies => 'Películas';

  @override
  String get musicVideos => 'Videos musicais';

  @override
  String get other => 'Outros';

  @override
  String get discography => 'Discografía';

  @override
  String get similarArtists => 'Artistas similares';

  @override
  String get tableOfContents => 'Índice';

  @override
  String get tracklist => 'Lista de cancións';

  @override
  String discNumber(int number) {
    return 'Disco $number';
  }

  @override
  String get biography => 'Biografía';

  @override
  String get authorDetails => 'Detalles do autor';

  @override
  String get noOverviewAvailable =>
      'Aínda non hai unha visión xeral dispoñible para este título.';

  @override
  String get noBiographyAvailable =>
      'Non hai biografía dispoñible para este autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'Non se poden cargar os detalles do autor neste momento.';

  @override
  String published(int year) {
    return 'Publicado $year';
  }

  @override
  String get publicationDateUnknown => 'Data de publicación descoñecida';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tempadas',
      one: '1 tempada',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Remata en $time';
  }

  @override
  String get items => 'Elementos';

  @override
  String get extras => 'Extras';

  @override
  String get additionalParts => 'Additional Parts';

  @override
  String get behindTheScenes => 'Tras as cámaras';

  @override
  String get deletedScenes => 'Escenas eliminadas';

  @override
  String get featurettes => 'Reportaxes';

  @override
  String get interviews => 'Entrevistas';

  @override
  String get scenes => 'Escenas';

  @override
  String get shorts => 'Curtametraxes';

  @override
  String get trailers => 'Tráilers';

  @override
  String timeRemaining(String time) {
    return 'Quedan $time';
  }

  @override
  String endsIn(String time) {
    return 'Remata en $time';
  }

  @override
  String get view => 'Ver';

  @override
  String get resumeReading => 'Retomar a lectura';

  @override
  String get read => 'Ler';

  @override
  String resumeFrom(String position) {
    return 'Retomar de $position';
  }

  @override
  String get play => 'Reproducir';

  @override
  String get startOver => 'Comezar de novo';

  @override
  String get restart => 'Reiniciar';

  @override
  String get readOffline => 'Ler sen conexión';

  @override
  String get playOffline => 'Xoga sen conexión';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Subtítulos';

  @override
  String get version => 'Versión';

  @override
  String get cast => 'Transmitir';

  @override
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Tráiler';

  @override
  String get finished => 'Rematou';

  @override
  String get favorited => 'Favorito';

  @override
  String get favorite => 'Favorito';

  @override
  String get playlist => 'Lista de reprodución';

  @override
  String get downloaded => 'Descargado';

  @override
  String get finalizingDownload => 'Finalizing…';

  @override
  String get queuedDownload => 'Queued';

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
  String get downloadAll => 'Descargar Todo';

  @override
  String get download => 'Descargar';

  @override
  String get deleteDownloaded => 'Eliminar descargado';

  @override
  String get goToSeries => 'Ir á Serie';

  @override
  String get editMetadata => 'Editar metadatos';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Máis';

  @override
  String get deleteItem => 'Eliminar elemento';

  @override
  String get deletePlaylist => 'Eliminar lista de reprodución';

  @override
  String get deletePlaylistMessage =>
      'Queres eliminar esta lista de reprodución do servidor?';

  @override
  String get deleteItemMessage => 'Queres eliminar este elemento do servidor?';

  @override
  String get failedToDeletePlaylist =>
      'Produciuse un erro ao eliminar a lista de reprodución';

  @override
  String get failedToDeleteItem => 'Produciuse un erro ao eliminar o elemento';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

  @override
  String get renamePlaylist => 'Cambiar o nome da lista de reprodución';

  @override
  String get playlistName => 'Nome da lista de reprodución';

  @override
  String get deleteDownloadedAlbum => 'Eliminar o álbum descargado';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Queres eliminar as pistas descargadas para \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Elimináronse as pistas descargadas';

  @override
  String get downloadedTracksDeleteFailed =>
      'Non se puideron eliminar algunhas pistas descargadas';

  @override
  String get noTracksLoaded => 'Non se cargaron pistas';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Non se cargaron $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Descargando elementos $title ($count)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Estás seguro de que queres eliminar \"$name\" do servidor? Esta acción non se pode desfacer.';
  }

  @override
  String get itemDeleted => 'Elemento eliminado';

  @override
  String get noPlayableTrailerFound =>
      'Non se atopou ningún tráiler reproducible.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Formato de libro non compatible: .$extension';
  }

  @override
  String get audioTrack => 'Pista de audio';

  @override
  String get subtitleTrack => 'Pista de subtítulos';

  @override
  String get none => 'Ningún';

  @override
  String get downloadSubtitlesLabel => 'Descargar subtítulos...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Busca usando o complemento OpenSubtitles';

  @override
  String get downloadSubtitles => 'Descargar subtítulos';

  @override
  String get searchingSubtitles => 'Searching for subtitles…';

  @override
  String get fetchingSubtitles => 'Fetching subtitles';

  @override
  String get downloadingSubtitle => 'Downloading subtitle…';

  @override
  String get selectedSubtitleInvalid =>
      'O subtítulo seleccionado non é válido.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtítulo descargado e seleccionado: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtítulos descargados. Pode tardar un momento en aparecer mentres Jellyfin actualiza o elemento.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Non se atoparon subtítulos remotos para $language.';
  }

  @override
  String get selectVersion => 'Seleccione Versión';

  @override
  String versionNumber(int number) {
    return 'Versión $number';
  }

  @override
  String get downloadAllQuality => 'Descargar todo — Calidade';

  @override
  String get downloadQuality => 'Descargar Calidade';

  @override
  String get originalFileNoReencoding =>
      'Ficheiro orixinal, sen recodificación';

  @override
  String get originalFilesNoReencoding =>
      'Ficheiros orixinais, sen recodificación';

  @override
  String get noEpisodesLoaded => 'Non se cargaron episodios';

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
    return 'Descargando $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Eliminar ficheiros descargados';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Queres eliminar ficheiros locais para $typeLabel?\n\nIsto liberará espazo de almacenamento. Podes volver descargar máis tarde.';
  }

  @override
  String get downloadedFilesDeleted => 'Elimináronse os ficheiros descargados';

  @override
  String get failedToDeleteFiles =>
      'Produciuse un erro ao eliminar os ficheiros';

  @override
  String get deleteFiles => 'Eliminar ficheiros';

  @override
  String get director => 'DIRECTOR';

  @override
  String get starring => 'STARRING';

  @override
  String get directors => 'DIRECTORES';

  @override
  String get writer => 'GUIONISTA';

  @override
  String get writers => 'GUIONISTAS';

  @override
  String get studio => 'ESTUDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count máis';
  }

  @override
  String totalEpisodes(int count) {
    return 'Episodios de $count';
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
    return 'Capítulo $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistas',
      one: '1 pista',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count capítulos',
      one: '1 capítulo',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Nacido $date';
  }

  @override
  String died(String date) {
    return 'Morreu $date';
  }

  @override
  String age(int age) {
    return 'Idade $age';
  }

  @override
  String get showLess => 'Mostrar menos';

  @override
  String get readMore => 'Ler máis';

  @override
  String get shuffle => 'Aleatorio';

  @override
  String get shuffleAll => 'Shuffle All';

  @override
  String get shuffleAllMusic => 'Reproducir toda a música en modo aleatorio';

  @override
  String get carSignInPrompt => 'Inicia sesión en Moonfin no teu teléfono';

  @override
  String get carServerUnreachable => 'Non se pode conectar co teu servidor';

  @override
  String downloadsCount(int count) {
    return '$count descargas';
  }

  @override
  String get perfectMatch => 'Combinación perfecta';

  @override
  String get aiTranslated => 'AI Translated';

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
  String get stereo => 'Estéreo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'O subtítulo remoto $action require o permiso de xestión de subtítulos Jellyfin para este usuario.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Non se puido atopar este elemento no servidor para o subtítulo remoto $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Fallou o subtítulo remoto $action: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Fallou o subtítulo remoto $action (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Produciuse un erro aos subtítulos remotos de $action.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'todos os episodios descargados para \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'todos os episodios descargados desta tempada';

  @override
  String get stillWatching => 'Aínda estás vendo?';

  @override
  String get unableToLoadTrailerStream =>
      'Non se puido cargar a emisión do tráiler.';

  @override
  String get trailerTimedOut =>
      'Esgotouse o tempo de espera do tráiler durante a carga.';

  @override
  String get playbackFailedForTrailer =>
      'Produciuse un erro na reprodución deste tráiler.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'A emisión non está dispoñible durante a reprodución sen conexión.';

  @override
  String castActionFailed(String label, String error) {
    return 'Fallou a acción de $label: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Produciuse un erro ao establecer o volume de emisión: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controis';
  }

  @override
  String get deviceVolume => 'Volume do dispositivo';

  @override
  String get unavailable => 'Non dispoñible';

  @override
  String get pause => 'Pausa';

  @override
  String get syncPosition => 'Posición de sincronización';

  @override
  String stopCast(String label) {
    return 'Detén $label';
  }

  @override
  String get queueIsEmpty => 'A cola está baleira';

  @override
  String trackNumber(int number) {
    return 'Seguimento $number';
  }

  @override
  String get remotePlayback => 'Reprodución remota';

  @override
  String get castingToGoogleCast => 'Emitindo a Google Cast';

  @override
  String get castingViaAirPlay => 'Emisión a través de AirPlay';

  @override
  String get castingViaDlna => 'Emisión a través de DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds segundos';
  }

  @override
  String get longPressToUnlock => 'Mantén presionado para desbloquear';

  @override
  String get off => 'Desactivado';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automático';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get audioDelay => 'Retraso de audio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Retraso de subtítulos';

  @override
  String get reset => 'Restablecer';

  @override
  String get unknown => 'Descoñecido';

  @override
  String get playbackInformation => 'Información de reprodución';

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
  String get playback => 'Reprodución';

  @override
  String get playMethod => 'Método de xogo';

  @override
  String get directPlay => 'Xoga en directo';

  @override
  String get directStream => 'Transmisión directa';

  @override
  String get transcoding => 'Transcodificación';

  @override
  String get transcodeReasons => 'Razóns de transcodificación';

  @override
  String get player => 'Reprodutor';

  @override
  String get container => 'Recipiente';

  @override
  String get bitrate => 'Taxa de bits';

  @override
  String get video => 'Vídeo';

  @override
  String get resolution => 'Resolución';

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
  String get track => 'Pista';

  @override
  String get channels => 'Canles';

  @override
  String get format => 'Formato';

  @override
  String get external => 'Externo';

  @override
  String get embedded => 'Incrustado';

  @override
  String castSessionError(String protocol) {
    return 'Erro de sesión $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Produciuse un erro ao cargar os detalles do libro: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'A representación EPUB na aplicación aínda non está dispoñible nesta plataforma.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Este formato (.$extension) aínda non se pode renderizar na aplicación.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A representación de documentos incorporados non está dispoñible nesta plataforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'Non se puido abrir o visor externo.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Produciuse un erro ao abrir o lector na aplicación: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'O marcador xa se gardou en $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Engadiuse o marcador: $label';
  }

  @override
  String get noBookmarksYet =>
      'Aínda non hai marcadores.\nToca a icona do marcador mentres les para gardar a túa posición.';

  @override
  String get noTableOfContentsAvailable =>
      'Non hai táboa de contido dispoñible';

  @override
  String pageLabel(int number) {
    return 'Páxina $number';
  }

  @override
  String get position => 'Posición';

  @override
  String get bookReader => 'Lector de libros';

  @override
  String formatExtension(String extension) {
    return 'Formato: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% de lectura';
  }

  @override
  String get updating => 'Actualizando...';

  @override
  String get markUnread => 'Marcar como non lido';

  @override
  String get markAsRead => 'Marcar como lido';

  @override
  String get reloadReader => 'Recargar lector';

  @override
  String get noPagesFound => 'Non se atopou ningunha páxina.';

  @override
  String get failedToDecodePageImage =>
      'Produciuse un erro ao descodificar a imaxe da páxina.';

  @override
  String resetZoom(String zoom) {
    return 'Restablecer o zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Páxina única';

  @override
  String get twoPageSpread => 'Difusión de dúas páxinas';

  @override
  String get addBookmark => 'Engadir marcador';

  @override
  String get bookmarksEllipsis => 'Marcadores...';

  @override
  String get markedAsRead => 'Marcado como lido';

  @override
  String get markedAsUnread => 'Marcado como non lido';

  @override
  String failedToUpdateReadState(String error) {
    return 'Produciuse un erro ao actualizar o estado de lectura: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Luz';

  @override
  String get themeDark => 'Tema: Escuro';

  @override
  String get themeSepia => 'Temática: Sepia';

  @override
  String get invertColorsFixedLayout => 'Inverter cores (disposición fixa)';

  @override
  String get invertColorsPdf => 'Inverter cores (PDF)';

  @override
  String get preparingInAppReader => 'Preparando o lector na aplicación...';

  @override
  String get pdfDataNotAvailable => 'Datos PDF non dispoñibles.';

  @override
  String get readerFallbackModeActive => 'Modo alternativo do lector activo';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Esta plataforma non pode aloxar o motor de documentos incorporado para ficheiros $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Use Reload Reader despois de cambiar a unha plataforma de destino compatible (Android, iOS, macOS).';

  @override
  String get openExternally => 'Abrir Externamente';

  @override
  String get noEpubChaptersFound => 'Non se atoparon capítulos EPUB.';

  @override
  String get readerNotReady => 'O lector non está preparado.';

  @override
  String get seriesRecordings => 'Gravacións da serie';

  @override
  String get now => 'Agora';

  @override
  String get sports => 'Deportes';

  @override
  String get news => 'Novas';

  @override
  String get kids => 'Nenos';

  @override
  String get premiere => 'Estrea';

  @override
  String get guideRepeatBadge => 'Repeat';

  @override
  String get guideTimeline => 'Cronoloxía da guía';

  @override
  String failedToLoadGuide(String error) {
    return 'Produciuse un erro ao cargar a guía: $error';
  }

  @override
  String get noChannelsFound => 'Non se atopou ningunha canle';

  @override
  String get noProgramData => 'No program data';

  @override
  String get liveBadge => 'EN VIVO';

  @override
  String get liveTvJumpToLive => 'Jump to Live';

  @override
  String guideNextProgram(String time, String title) {
    return 'A continuación: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '$minutes min restantes';
  }

  @override
  String guideHoursLeft(int hours) {
    return '$hours h restantes';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '$hours h $minutes min restantes';
  }

  @override
  String get movie => 'Película';

  @override
  String get removedFromFavoriteChannels => 'Quitouse das canles favoritas';

  @override
  String get addedToFavoriteChannels => 'Engadida ás canles favoritas';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Produciuse un erro ao actualizar a canle favorita';

  @override
  String get unfavoriteChannel => 'Eliminar a canle de favoritos';

  @override
  String get favoriteChannel => 'Canal favorito';

  @override
  String get record => 'Gravar';

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
  String get cancelRecordingAction => 'Cancelar a gravación';

  @override
  String get programSetToRecord => 'Programa configurado para gravar';

  @override
  String get recordingCancelled => 'Cancelouse a gravación';

  @override
  String get unableToCreateRecording => 'Non se puido crear a gravación';

  @override
  String get recordSeries => 'Record Series';

  @override
  String get seriesSetToRecord => 'Series set to record';

  @override
  String get seriesRecordingCancelled => 'Series recording cancelled';

  @override
  String get unableToCreateSeriesRecording =>
      'Unable to create series recording';

  @override
  String get watch => 'Ver';

  @override
  String get watchChannelLive => 'Watch channel live';

  @override
  String get close => 'Pechar';

  @override
  String failedToPlayChannel(String name) {
    return 'Produciuse un erro ao xogar $name';
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
  String get failedToLoadRecordings =>
      'Produciuse un erro ao cargar as gravacións';

  @override
  String get scheduledInNext24Hours => 'Programado nas próximas 24 horas';

  @override
  String get recentRecordings => 'Gravacións recentes';

  @override
  String get tvSeries => 'Serie de TV';

  @override
  String get failedToLoadSchedule =>
      'Produciuse un erro ao cargar a programación';

  @override
  String get noScheduledRecordings => 'Non hai gravacións programadas';

  @override
  String get cancelRecording => 'Cancelar a gravación?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancelar a gravación programada de \"$name\"?';
  }

  @override
  String get no => 'Non';

  @override
  String get yesCancel => 'Si, cancela';

  @override
  String get failedToCancelRecording =>
      'Produciuse un erro ao cancelar a gravación';

  @override
  String get failedToLoadSeriesRecordings =>
      'Produciuse un erro ao cargar as gravacións da serie';

  @override
  String get noSeriesRecordings => 'Non hai gravacións en serie';

  @override
  String get cancelSeriesRecording => 'Cancelar a gravación da serie';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Queres cancelar a gravación da serie?';

  @override
  String stopRecordingName(String name) {
    return 'Queres deixar de gravar \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Produciuse un erro ao cancelar a gravación da serie';

  @override
  String get searchThisLibrary => 'Busca nesta biblioteca...';

  @override
  String get searchEllipsis => 'Busca...';

  @override
  String noResultsForQuery(String query) {
    return 'Non hai resultados para \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Produciuse un erro na busca: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Tipo de conta Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Local';

  @override
  String get savedMedia => 'Medios gardados';

  @override
  String get tvShows => 'Programas de TV';

  @override
  String get music => 'Música';

  @override
  String get musicAlbums => 'Álbums musicais';

  @override
  String get noMediaInFilter => 'Non hai contido multimedia neste filtro';

  @override
  String get noDownloadedMediaYet =>
      'Aínda non hai ningún contido multimedia descargado';

  @override
  String get browseLibrary => 'Explorar biblioteca';

  @override
  String get deleteDownload => 'Eliminar a descarga';

  @override
  String removeItemAndFiles(String name) {
    return 'Queres eliminar \"$name\" e os seus ficheiros?';
  }

  @override
  String tracksCount(int count) {
    return '$count pistas';
  }

  @override
  String get album => 'Álbum';

  @override
  String get playAlbum => 'Reproducir álbum';

  @override
  String failedToLoadAlbum(String error) {
    return 'Produciuse un erro ao cargar o álbum: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Non se atoparon pistas descargadas para $name.';
  }

  @override
  String get season => 'Tempada';

  @override
  String get errorLoadingEpisodes =>
      'Produciuse un erro ao cargar os episodios';

  @override
  String get noDownloadedEpisodes => 'Non hai episodios descargados';

  @override
  String get deleteEpisode => 'Eliminar Episodio';

  @override
  String removeName(String name) {
    return 'Eliminar \"$name\"?';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes mín';
  }

  @override
  String seasonEpisodeLabel(int season, int episode) {
    return 'T$season E$episode';
  }

  @override
  String episodeNumber(int number) {
    return 'Episodio $number';
  }

  @override
  String get seriesNotFound => 'Serie non atopada';

  @override
  String get errorLoadingSeries => 'Erro ao cargar a serie';

  @override
  String get downloadedEpisodes => 'Episodios descargados';

  @override
  String seasonNumber(int number) {
    return 'Tempada $number';
  }

  @override
  String seasonChip(int number) {
    return 'T$number';
  }

  @override
  String get specials => 'Especiais';

  @override
  String get deleteSeason => 'Eliminar tempada';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Queres eliminar todos os episodios descargados en $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodios',
      one: '1 episodio',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Xestión de almacenamento';

  @override
  String get storageBreakdown => 'Avaría de almacenamento';

  @override
  String get downloadedItems => 'Elementos descargados';

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
  String get storageLimit => 'Límite de almacenamento';

  @override
  String get noLimit => 'Sen límite';

  @override
  String get deleteAllDownloads => 'Eliminar todas as descargas';

  @override
  String get deleteAllDownloadsWarning =>
      'Isto eliminará todos os ficheiros multimedia descargados e non se pode desfacer.';

  @override
  String get deleteAll => 'Eliminar todo';

  @override
  String get deleteSelected => 'Eliminar o seleccionado';

  @override
  String deleteSelectedCount(int count) {
    return 'Queres eliminar $count os elementos descargados?';
  }

  @override
  String get musicAndAudiobooks => 'Música e audiolibros';

  @override
  String get images => 'Imaxes';

  @override
  String get database => 'Base de datos';

  @override
  String ofStorageLimit(String limit) {
    return 'límite de $limit';
  }

  @override
  String get settings => 'Configuración';

  @override
  String get settingsSearchHint => 'Search settings';

  @override
  String get authentication => 'Autenticación';

  @override
  String get autoLoginServerManagement =>
      'Inicio de sesión automático, xestión do servidor';

  @override
  String get pinCode => 'Código PIN';

  @override
  String get setUpPinCodeProtection => 'Configura a protección do código PIN';

  @override
  String get parentalControls => 'Controis parentais';

  @override
  String get contentRatingRestrictions =>
      'Restricións de clasificación do contido';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, resolución, comportamento';

  @override
  String get languageSizeAppearance => 'Lingua, tamaño, aparencia';

  @override
  String get qualityStorage => 'Calidade, almacenamento';

  @override
  String get mediaRequestIntegration => 'Integración de solicitudes de medios';

  @override
  String get switchServer => 'Cambiar servidor';

  @override
  String get signOut => 'Pechar sesión';

  @override
  String get versionLicenses => 'Versión, licenzas';

  @override
  String get account => 'Conta';

  @override
  String get signInAndSecurity => 'Inicio de sesión e seguridade';

  @override
  String get administration => 'Administración';

  @override
  String get serverSettingsUsersLibraries =>
      'Configuración do servidor, usuarios, bibliotecas';

  @override
  String get customization => 'Personalización';

  @override
  String get themeAndLayout => 'Tema e maquetación';

  @override
  String get videoAndSubtitles => 'Vídeo e subtítulos';

  @override
  String get pluginAndRequests => 'Plugin e solicitudes';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personaliza a conta, a reprodución e o comportamento da interface';

  @override
  String optionsCount(int count) {
    return '$count opcións';
  }

  @override
  String get themeAndAppearance => 'Tema e aparencia';

  @override
  String get focusBorderColor => 'Cor do bordo do foco';

  @override
  String get watchedIndicators => 'Indicadores observados';

  @override
  String get always => 'Sempre';

  @override
  String get mixedRowsOnly => 'Mixed rows only';

  @override
  String get hideUnwatched => 'Ocultar sen vixiar';

  @override
  String get episodesOnly => 'Só episodios';

  @override
  String get never => 'Nunca';

  @override
  String get focusExpansionAnimation => 'Animación de expansión de foco';

  @override
  String get desktopUiScale => 'Escala de IU de escritorio';

  @override
  String get scaleFocusedCards =>
      'Escala tarxetas e fichas enfocadas ou enfocadas';

  @override
  String get seriesThumbnails => 'Miniaturas da serie';

  @override
  String get seriesThumbnailsDescription =>
      'Só episodios: usa obras de arte da serie que coincidan con cada tipo de imaxe de fila';

  @override
  String get homeRowInfoOverlay =>
      'Superposición de información da fila de inicio';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Mostra o título e os metadatos ao explorar as filas de inicio';

  @override
  String get clockDisplay => 'Visualización do reloxo';

  @override
  String get inMenus => 'En Menús';

  @override
  String get inVideo => 'En Vídeo';

  @override
  String get seasonalEffects => 'Efectos estacionais';

  @override
  String get seasonalEffectsDescription =>
      'Efectos visuais e decoración estacional';

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
  String get fireworks => 'Fogos artificiais';

  @override
  String get confetti => 'Confeti';

  @override
  String get fallingLeaves => 'Follas Caídas';

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
  String get themeMusic => 'Música temática';

  @override
  String get playThemeMusicOnDetailPages =>
      'Reproducir música temática nas páxinas de detalles';

  @override
  String get themeMusicVolume => 'Tema Musical Volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Música temática en Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Xoga ao navegar pola pantalla de inicio';

  @override
  String get loopThemeMusic => 'Música do tema en bucle';

  @override
  String get loopThemeMusicSubtitle =>
      'Repite a pista en vez de reproducila unha soa vez';

  @override
  String get detailsBackgroundBlur => 'Detalles desenfoque de fondo';

  @override
  String get detailsBackgroundOpacity => 'Background Opacity';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Desenfoque de fondo de navegación';

  @override
  String get maxStreamingBitrate => 'Velocidade de bits de transmisión máxima';

  @override
  String get maxResolution => 'Resolución máxima';

  @override
  String get playerZoomMode => 'Modo de zoom do xogador';

  @override
  String get settingsScrollWheelAction => 'Roda do rato';

  @override
  String get settingsScrollWheelActionDescription =>
      'Escolle o que fai desprazar a roda do rato sobre o vídeo durante a reprodución.';

  @override
  String get scrollWheelActionOff => 'Desactivado';

  @override
  String get scrollWheelActionSeek => 'Buscar (adiante / atrás)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Encaixar';

  @override
  String get autoCrop => 'Recorte automático';

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
  String get stretch => 'Estirar';

  @override
  String get refreshRateSwitching => 'Cambio da taxa de actualización';

  @override
  String get disabled => 'Desactivado';

  @override
  String get manual => 'Manual';

  @override
  String get autoDetect => 'Auto Detect';

  @override
  String get scaleOnTv => 'Escala na TV';

  @override
  String get scaleOnDevice => 'Escala no dispositivo';

  @override
  String get trickPlay => 'Xogo de truco';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Mostrar miniaturas de vista previa ao buscar';

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
  String get showDescriptionOnPause => 'Mostrar a descrición en pausa';

  @override
  String get dimVideoShowOverview =>
      'Atenua o vídeo e mostra o texto xeral mentres está en pausa';

  @override
  String get showChapterMarkers => 'Chapter Marks';

  @override
  String get showChapterMarkersDescription =>
      'Mark where each chapter starts on the seek bar';

  @override
  String get osdLockButton => 'Botón de bloqueo OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostra un botón de bloqueo que bloquea a entrada táctil ata que se preme durante moito tempo';

  @override
  String get playerSwipeGestures => 'Volume and Brightness Swipes';

  @override
  String get playerSwipeGesturesDescription =>
      'Slide up or down on the player to change brightness on the left and volume on the right';

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
  String get osdButtons => 'Player Buttons';

  @override
  String get osdButtonsDescription => 'Choose which buttons the player shows';

  @override
  String get osdButtonsSectionDescription =>
      'Playback controls are always shown. Everything below is up to you, and each kind of device keeps its own list.';

  @override
  String get detailButtons => 'Action Buttons';

  @override
  String get detailButtonsDescription =>
      'Choose which buttons the details screen shows';

  @override
  String get detailButtonsSectionDescription =>
      'Play is always first and the locked buttons are always shown. Everything else is up to you, and each kind of device keeps its own list.';

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
  String get moveUp => 'Move Up';

  @override
  String get moveDown => 'Move Down';

  @override
  String get buttonOrderHint =>
      'Use the arrows to change the order. On a remote, left and right move the highlighted button. Switching one off drops it below the rest.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'Only shows while you\'re in a SyncPlay group';

  @override
  String get orientationLock => 'Orientation Lock';

  @override
  String get fullscreen => 'Fullscreen';

  @override
  String get audioBehavior => 'Comportamento de audio';

  @override
  String get downmixToStereo => 'Downmix a estéreo';

  @override
  String get defaultAudioLanguage => 'Idioma de audio predeterminado';

  @override
  String get fallbackAudioLanguage => 'Idioma de audio alternativo';

  @override
  String get preferDefaultAudioTrack =>
      'Preferir a pista de audio predeterminada';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Prefire a pista de audio orixinal en vez da dobraxe localizada.';

  @override
  String get preferAudioDescription => 'Preferir as pistas de audiodescrición';

  @override
  String get preferAudioDescriptionDescription =>
      'Prefire as pistas de audiodescrición en vez das normais.';

  @override
  String get autoServerDefault => 'Automático (Servidor predeterminado)';

  @override
  String get english => 'inglés';

  @override
  String get spanish => 'español';

  @override
  String get french => 'francés';

  @override
  String get german => 'alemán';

  @override
  String get italian => 'italiano';

  @override
  String get portuguese => 'portugués';

  @override
  String get japanese => 'xaponés';

  @override
  String get korean => 'coreano';

  @override
  String get chinese => 'chinés';

  @override
  String get russian => 'ruso';

  @override
  String get arabic => 'árabe';

  @override
  String get hindi => 'Hindi';

  @override
  String get dutch => 'holandés';

  @override
  String get swedish => 'sueco';

  @override
  String get norwegian => 'noruegués';

  @override
  String get danish => 'danés';

  @override
  String get finnish => 'finés';

  @override
  String get polish => 'polaco';

  @override
  String get ac3Passthrough => 'Paso AC3';

  @override
  String get dtsPassthrough => 'Paso DTS';

  @override
  String get trueHdSupport => 'Soporte TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Audio Bitstream DTS só para AVR; require soporte do receptor e pista fonte DTS';

  @override
  String get settingsAudioFallbackCodec => 'Codec alternativo de audio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Escolle o formato de destino para transcodificar o audio multicanle cando o fluxo de orixe non se pode reproducir de forma nativa nin transmitir directamente.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Detección automática\n(Recomendado)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Predeterminado)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Só estéreo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Eficiente)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Sen perdas)';

  @override
  String get settingsMaxAudioChannels => 'Máximo de canles de audio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configura o número máximo de canles da túa configuración de audio. Os fluxos multicanle que superen este límite reduciranse (downmix) ou transcodificaranse.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Detección automática\n(Predeterminado do hardware)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Estéreo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Cuadrafónico';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Paso directo (avanzado)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough do códec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Activa só os formatos compatibles coa túa receptora AVR ou HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Paso EAC3';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passthrough DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Paso DTS-HD MA';

  @override
  String get settingsAudioPassthroughMode => 'Passthrough';

  @override
  String get settingsAudioPassthroughModeDescription =>
      'How compressed surround sound reaches your TV or receiver.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Disabled (always decode on this device)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Auto (match detected device support)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Manual (choose formats below)';

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
      'Mix all decoded audio down to two channels.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Bitstream E-AC-3, including Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Bitstream DTS-HD, including DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Bitstream TrueHD, including Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passthrough TrueHD';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Capacidades de audio detectadas';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Aínda non hai ningunha captura de capacidades en tempo de execución.';

  @override
  String get settingsAudioRouteLabel => 'Ruta';

  @override
  String get settingsAudioDecodeLabel => 'Decodificación';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Ruta de audio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Altofalante';

  @override
  String get settingsAudioRouteHeadphones => 'Auriculares';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count can. PCM';
  }

  @override
  String get nightMode => 'Modo nocturno';

  @override
  String get compressDynamicRange => 'Comprimir rango dinámico';

  @override
  String get advancedMpv => 'mpv avanzado';

  @override
  String get enableCustomMpvConf => 'Activar mpv.conf personalizado';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplique un mpv.conf especificado polo usuario antes de comezar a reprodución';

  @override
  String get unsafeAdvancedMpvOptions => 'Opcións avanzadas de mpv non seguras';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permitir un conxunto máis amplo de opcións mpv. Pode romper o comportamento de reprodución.';

  @override
  String get hardwareDecoding => 'Decodificación de hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Pode mellorar o rendemento, pero pode causar problemas de reprodución nalgúns dispositivos.';

  @override
  String get nextUpAndQueuing => 'Seguinte e cola';

  @override
  String get nextUpDisplay => 'Visualización seguinte';

  @override
  String get extended => 'Estendido';

  @override
  String get minimal => 'Mínimo';

  @override
  String get nextUpTimeout => 'Próximo tempo de espera';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Cola de medios';

  @override
  String get autoQueueNextEpisodes =>
      'Poñer en cola automaticamente os próximos episodios';

  @override
  String get stillWatchingPrompt => 'Aínda mirando o aviso';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Despois de $episodes episodios / $hours h';
  }

  @override
  String get resumeAndSkip => 'Reanudar e ignorar';

  @override
  String get resumeRewind => 'Reanudar o rebobinado';

  @override
  String get unpauseRewind => 'Desactivar o rebobinado';

  @override
  String get fiveSeconds => '5 segundos';

  @override
  String get tenSeconds => '10 segundos';

  @override
  String get fifteenSeconds => '15 segundos';

  @override
  String get thirtySeconds => '30 segundos';

  @override
  String get skipBackLength => 'Lonxitude de salto atrás';

  @override
  String get skipForwardLength => 'Lonxitude de salto adiante';

  @override
  String get customMpvConfPath => 'Ruta personalizada mpv.conf';

  @override
  String get notSetMpvConf =>
      'Non definido. Moonfin probará un mpv.conf predeterminado nos cartafoles aplicación/datos.';

  @override
  String get selectMpvConf => 'Seleccione mpv.conf';

  @override
  String get pathToMpvConf => '/ruta/a/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Os axustes de estilo (tamaño, cor, compensación) aplícanse aos subtítulos baseados en texto (SRT, VTT, TTML). Os subtítulos ASS/SSA usan o seu propio estilo incrustado a menos que se desactive a \"Reprodución directa ASS/SSA\". Os subtítulos de mapas de bits (PGS, DVB, VobSub) non se poden modificar.';

  @override
  String get defaultSubtitleLanguage => 'Idioma de subtítulos predeterminado';

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
  String get defaultToNoSubtitles => 'O predeterminado é Sen subtítulos';

  @override
  String get turnOffSubtitlesByDefault =>
      'Desactiva os subtítulos de forma predeterminada';

  @override
  String get subtitleSize => 'Tamaño do subtítulo';

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
  String get textFillColor => 'Cor de recheo do texto';

  @override
  String get backgroundColor => 'Cor de fondo';

  @override
  String get textStrokeColor => 'Cor do trazo do texto';

  @override
  String get subtitleCustomization => 'Personalización de subtítulos';

  @override
  String get subtitleCustomizationDescription =>
      'Personaliza o aspecto dos subtítulos';

  @override
  String get subtitleMode => 'Modo de subtítulos';

  @override
  String get subtitleModeFlagged => 'Marcados';

  @override
  String get subtitleModeAlways => 'Sempre';

  @override
  String get subtitleModeForeign => 'Estranxeiro';

  @override
  String get subtitleModeForced => 'Forzados';

  @override
  String get subtitleModeFlaggedDescription =>
      'Reproduce as pistas marcadas internamente nos metadatos do ficheiro como \"predeterminada\" ou \"forzada\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Carga e mostra automaticamente os subtítulos cada vez que comeza un vídeo.';

  @override
  String get subtitleModeForeignDescription =>
      'Activa automaticamente os subtítulos se a pista de audio predeterminada está nun idioma estranxeiro.';

  @override
  String get subtitleModeForcedDescription =>
      'Só carga os subtítulos marcados explicitamente co indicador de metadatos \"forzado\".';

  @override
  String get subtitleModeNoneDescription =>
      'Desactiva completamente a carga automática de subtítulos.';

  @override
  String get fallbackSubtitleLanguage => 'Idioma de subtítulos alternativo';

  @override
  String get subtitleStream => 'Fluxo de subtítulos';

  @override
  String get subtitlePreviewText =>
      'O raposo marrón rápido salta sobre o can preguiceiro';

  @override
  String get verticalOffset => 'Desfase vertical';

  @override
  String get pgsDirectPlay => 'Reprodución directa de PGS';

  @override
  String get directPlayPgsSubtitles => 'Subtítulos PGS de reprodución directa';

  @override
  String get assSsaDirectPlay => 'Reprodución directa de ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Reprodución directa de subtítulos ASS/SSA';

  @override
  String get white => 'Branco';

  @override
  String get black => 'Negro';

  @override
  String get yellow => 'Amarelo';

  @override
  String get green => 'Verde';

  @override
  String get cyan => 'Cian';

  @override
  String get red => 'Vermello';

  @override
  String get transparent => 'Transparente';

  @override
  String get semiTransparentBlack => 'Negro semitransparente';

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
  String get global => 'Global';

  @override
  String get desktop => 'Escritorio';

  @override
  String get mobile => 'Móbil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Cargouse a configuración do perfil $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Non se puido cargar a configuración do perfil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Sincronizouse a configuración local co perfil $profile.';
  }

  @override
  String get syncing => 'Sincronizando...';

  @override
  String resetProfileTitle(String profile) {
    return 'Reset $profile?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'This deletes the $profile profile from the server and puts every synced setting on this device back to its default.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'This deletes every saved profile from the server and puts every synced setting on this device back to its default.';

  @override
  String profileReset(String profile) {
    return 'Reset $profile profile to defaults.';
  }

  @override
  String get resetRatingsTitle => 'Reset ratings?';

  @override
  String get resetRatingsDescription =>
      'This puts every ratings setting back to its default, including which sources show and the order they appear in.';

  @override
  String get ratingsReset => 'Reset ratings to defaults.';

  @override
  String failedToResetProfile(String profile) {
    return 'Failed to reset $profile profile.';
  }

  @override
  String get profileSyncHidden => 'Sincronización de perfil oculto';

  @override
  String get enablePluginSyncDescription =>
      'Activa a sincronización do complemento do servidor na configuración do complemento para mostrar aquí os controis do perfil.';

  @override
  String get quality => 'Calidade';

  @override
  String get defaultDownloadQuality => 'Calidade de descarga predeterminada';

  @override
  String get network => 'Rede';

  @override
  String get wifiOnlyDownloads => 'Descargas só para WiFi';

  @override
  String get tvOfflineDownloads => 'Enable Offline Downloads';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Show download actions on item pages';

  @override
  String get reportDownloadsActivity => 'Mostrar as descargas no servidor';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permite que o administrador do servidor vexa as túas descargas transcodificadas no panel';

  @override
  String get onlyDownloadOnWifi => 'Descarga só cando está conectado a WiFi';

  @override
  String get storage => 'Almacenamento';

  @override
  String get storageUsed => 'Almacenamento utilizado';

  @override
  String get manage => 'Xestionar';

  @override
  String get calculating => 'Calculando...';

  @override
  String get downloadLocation => 'Descargar Localización';

  @override
  String get defaultLabel => 'Por defecto';

  @override
  String get sdCard => 'SD card';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android only lets Moonfin write to the folders it owns, and this device has no removable storage. Turn on Save to Downloads folder above to keep downloads somewhere other apps can reach.';

  @override
  String get saveToDownloadsFolder => 'Gardar no cartafol Descargas';

  @override
  String get downloadsVisibleToOtherApps =>
      'Descargas/Moonfin: visible para outras aplicacións';

  @override
  String get dangerZone => 'Zona de perigo';

  @override
  String get clearAllDownloads => 'Borrar todas as descargas';

  @override
  String get original => 'Orixinal';

  @override
  String get changeDownloadLocation => 'Cambiar a localización de descarga';

  @override
  String get changeDownloadLocationDescription =>
      'As novas descargas gardaranse no cartafol seleccionado. As descargas existentes permanecerán na súa localización actual e pódense xestionar desde a configuración de almacenamento.';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cannotWriteToFolder =>
      'Non se pode escribir no cartafol seleccionado. Escolle unha localización diferente ou concede permisos de almacenamento.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Queres gardar no cartafol Descargas?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Os medios descargados gardaranse en Descargas/Moonfin no teu dispositivo. Estes ficheiros serán visibles para outras aplicacións, como a túa galería ou reprodutor de música.\n\nAs descargas existentes permanecerán na súa localización actual.';

  @override
  String get transcodingTimeRemainingUnavailable =>
      'Transcoding: Time Remaining Unavailable';

  @override
  String get enable => 'Activar';

  @override
  String get clearAllDownloadsWarning =>
      'Isto eliminará todos os medios descargados e non se pode desfacer.';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get navigationStyle => 'Estilo de navegación';

  @override
  String get topBar => 'Barra superior';

  @override
  String get leftSidebar => 'Barra lateral esquerda';

  @override
  String get showShuffleButton => 'Mostrar o botón Shuffle';

  @override
  String get showGenresButton => 'Botón Mostrar xéneros';

  @override
  String get showFavoritesButton => 'Mostrar botón de favoritos';

  @override
  String get showLiveTvButton => 'Show Live TV Button';

  @override
  String get showDownloadsButton => 'Show Downloads Button';

  @override
  String get showLibrariesInToolbar =>
      'Mostrar bibliotecas na barra de ferramentas';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Mostrar sempre as etiquetas da barra de navegación';

  @override
  String get showSeerrButton => 'Mostrar o botón de Seerr';

  @override
  String get navbarOpacity => 'Opacidade da barra de navegación';

  @override
  String get navbarColor => 'Cor da barra de navegación';

  @override
  String get gray => 'Gris';

  @override
  String get darkBlue => 'Azul escuro';

  @override
  String get purple => 'Roxo';

  @override
  String get teal => 'Cerceta';

  @override
  String get navy => 'Mariña';

  @override
  String get charcoal => 'Carbón vexetal';

  @override
  String get brown => 'marrón';

  @override
  String get darkRed => 'Vermello Escuro';

  @override
  String get darkGreen => 'Verde escuro';

  @override
  String get slate => 'Lousa';

  @override
  String get indigo => 'Índigo';

  @override
  String get libraryDisplay => 'Exposición da biblioteca';

  @override
  String get posterLabel => 'Cartel';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Bandeira';

  @override
  String get overridePerLibrarySettings =>
      'Anular a configuración por biblioteca';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplicar tipo de imaxe a todas as bibliotecas';

  @override
  String get multiServerLibraries => 'Bibliotecas multiservidor';

  @override
  String get showLibrariesFromAllServers =>
      'Mostra as bibliotecas de todos os servidores conectados';

  @override
  String get mergeRecentRowsByType => 'Merge Recent Rows by Type';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Combine separate libraries of the same type for Recently Added and Recently Released home rows.';

  @override
  String get libraryView => 'Library View';

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
  String get groupItemsIntoCollections => 'Agrupar os elementos en coleccións';

  @override
  String get hideCollectionAssociatedItems =>
      'Ocultar os elementos asociados a coleccións ao navegar polas bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Aviso sobre a agrupación de bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Para usar esta opción, asegúrate de que as opcións de biblioteca \"Agrupar as películas en coleccións\" e/ou \"Agrupar as series en coleccións\" estean activadas na configuración de visualización da túa biblioteca no servidor de Jellyfin ou Emby.';

  @override
  String get libraryVisibility => 'Visibilidade da biblioteca';

  @override
  String get libraryVisibilityDescription =>
      'Alterna a visibilidade da páxina de inicio por biblioteca. Reinicia Moonfin para que os cambios teñan efecto.';

  @override
  String get showInNavigation => 'Mostrar na navegación';

  @override
  String get showInLatestMedia => 'Mostra nos últimos medios';

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
  String get sourceLibraries => 'Bibliotecas de orixe';

  @override
  String get sourceCollections => 'Coleccións Fonte';

  @override
  String get excludedGenres => 'Xéneros excluídos';

  @override
  String get selectAll => 'Seleccione Todo';

  @override
  String itemsSelected(int count) {
    return '$count seleccionados';
  }

  @override
  String get mediaBar => 'Barra de medios';

  @override
  String get mediaSources => 'Fontes de medios';

  @override
  String get behavior => 'Comportamento';

  @override
  String get seconds => 'segundos';

  @override
  String get mediaBarMode => 'Estilo de barra multimedia';

  @override
  String get mediaBarModeDescription =>
      'Escolla entre varios estilos de barra multimedia ou desactive a barra multimedia';

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
  String get mediaBarModeOff => 'Desactivado';

  @override
  String get mediaBarModeBookshelf => 'Bookshelf';

  @override
  String get mediaBarModeGallery => 'Gallery';

  @override
  String get mediaBarModeBanner => 'Banner';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Activar a barra multimedia';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostrar presentación de diapositivas de contido destacado na casa';

  @override
  String get contentType => 'Tipo de contido';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Random';

  @override
  String get moviesAndTvShows => 'Películas e programas de televisión';

  @override
  String get moviesOnly => 'Só películas';

  @override
  String get tvShowsOnly => 'Só programas de televisión';

  @override
  String get itemCount => 'Número de elementos';

  @override
  String get noneSelected => 'Ningún seleccionado';

  @override
  String get noneExcluded => 'Ningún excluído';

  @override
  String get autoAdvance => 'Avance automático';

  @override
  String get autoAdvanceSlides =>
      'Avanza automaticamente á seguinte diapositiva';

  @override
  String get autoAdvanceInterval => 'Intervalo de avance automático';

  @override
  String get trailerPreview => 'Vista previa do tráiler';

  @override
  String get autoPlayTrailers =>
      'Reproduce automaticamente tráilers na barra multimedia despois de 3 segundos';

  @override
  String get trailerAudio => 'Audio dos tráilers';

  @override
  String get enableTrailerAudio =>
      'Activar o audio dos tráilers na barra multimedia';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Trailer Captions';

  @override
  String get trailerCaptionsDescription => 'Show captions on YouTube trailers';

  @override
  String get episodePreview => 'Vista previa do episodio';

  @override
  String get mediaPreview => 'Vista previa multimedia';

  @override
  String get episodePreviewDescription =>
      'Xoga unha vista previa en liña de 30 segundos en tarxetas enfocadas, sobrepasadas ou presionadas durante moito tempo';

  @override
  String get mediaPreviewDescription =>
      'Xoga unha vista previa en liña de 30 segundos en tarxetas enfocadas, sobrepasadas ou presionadas durante moito tempo';

  @override
  String get previewAudio => 'Vista previa de audio';

  @override
  String get enablePreviewAudio =>
      'Activa o audio para as vistas previas do tráiler e dos episodios';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Últimos Medios';

  @override
  String get recentlyReleased => 'Lanzado recentemente';

  @override
  String get recentlyReleasedSeriesType => 'Recently Released Series Sort By';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Sort Recently Released Series home rows by series, latest season, or latest episode air date';

  @override
  String get myMedia => 'Os meus medios';

  @override
  String get myMediaSmall => 'Os meus medios (pequeno)';

  @override
  String get continueWatching => 'Seguir vendo';

  @override
  String get resumeAudio => 'Reanudar o audio';

  @override
  String get resumeBooks => 'Libros de curriculum vitae';

  @override
  String get activeRecordings => 'Gravacións activas';

  @override
  String get playlists => 'Listas de reprodución';

  @override
  String get liveTV => 'TV en directo';

  @override
  String get favoriteChannels => 'Favorite Channels';

  @override
  String get resetToDefaults => 'Restablecer os valores predeterminados';

  @override
  String get homeRowPosterSize => 'Tamaño do póster da fila de inicio';

  @override
  String get configureImageTypeForEachRow =>
      'Configure o tipo de imaxe para cada fila de inicio activada';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Combina Continuar vendo e Seguinte';

  @override
  String get combineBothRows =>
      'Combina ambas filas nunha única sección de inicio';

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
  String get nextUpMaxDays => 'Max days in Next Up';

  @override
  String get nextUpMaxDaysDescription =>
      'How long a show stays in Next Up after you last watched it';

  @override
  String daysValue(int days) {
    return '$days days';
  }

  @override
  String get fullScreenRows => 'Filas de inicio expandidas';

  @override
  String get fullScreenRowsDescription =>
      'Limita as filas de inicio a 1 fila por pantalla';

  @override
  String get homeRowsPadding => 'Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get homeRowsGenresAndStudios => 'Genres and Studios';

  @override
  String get homeRowsExternalLists => 'External Lists';

  @override
  String get perRowSettings => 'Configuración por fila';

  @override
  String get autoLogin => 'Inicio de sesión automático';

  @override
  String get lastUser => 'Último Usuario';

  @override
  String get currentUser => 'Usuario actual';

  @override
  String get alwaysAuthenticate => 'Autenticarse sempre';

  @override
  String get requirePasswordWithToken =>
      'Require contrasinal incluso co token almacenado';

  @override
  String get confirmExit => 'Confirmar a saída';

  @override
  String get showConfirmationBeforeExiting =>
      'Mostra a confirmación antes de saír';

  @override
  String get blockContentWithRatings =>
      'Bloquear contido coas seguintes clasificacións:';

  @override
  String get noContentRatingsFound =>
      'Aínda non se atoparon clasificacións de contido neste servidor.';

  @override
  String get couldNotLoadServerRatings =>
      'Non se puideron cargar as valoracións do servidor. Mostrando só as valoracións gardadas.';

  @override
  String get couldNotRefreshRatings =>
      'Non se puideron actualizar as valoracións do servidor. Mostrando valoracións gardadas.';

  @override
  String get enablePinCode => 'Activa o código PIN';

  @override
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

  @override
  String get requirePinToAccess => 'Solicita un PIN para acceder á túa conta';

  @override
  String get changePin => 'Cambiar o PIN';

  @override
  String get setNewPinCode => 'Establece un novo código PIN';

  @override
  String get removePin => 'Eliminar o PIN';

  @override
  String get removePinProtection => 'Eliminar a protección do código PIN';

  @override
  String get screensaver => 'Salvapantallas';

  @override
  String get inAppScreensaver => 'Salvapantallas na aplicación';

  @override
  String get enableBuiltInScreensaver =>
      'Activa o protector de pantalla integrado';

  @override
  String get mode => 'Modo';

  @override
  String get libraryArt => 'Biblioteca Arte';

  @override
  String get logo => 'Logotipo';

  @override
  String get clock => 'Reloxo';

  @override
  String get timeout => 'Tempo de espera';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Nivel de atenuación';

  @override
  String get maxAgeRating => 'Clasificación de idade máxima';

  @override
  String get any => 'Calquera';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Require clasificación de idade';

  @override
  String get onlyShowRatedContent => 'Mostra só contido clasificado';

  @override
  String get displayClockDuringScreensaver =>
      'Mostra o reloxo durante o protector de pantalla';

  @override
  String get clockModeStatic => 'Estático';

  @override
  String get clockModeBouncing => 'Rebotando';

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
  String get rottenTomatoesCritics => 'Rotten Tomatoes (críticos)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Público)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacrítico';

  @override
  String get metacriticUser => 'Metacritic (usuario)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Valoración da comunidade';

  @override
  String get ratings => 'Valoracións';

  @override
  String get additionalRatings => 'Valoracións adicionais';

  @override
  String get showMdbListAndTmdbRatings =>
      'Mostra as clasificacións de MDBList e TMDB';

  @override
  String get ratingLabels => 'Etiquetas de valoración';

  @override
  String get showLabelsNextToIcons =>
      'Mostra as etiquetas xunto ás iconas de valoración';

  @override
  String get ratingBadges => 'Insignias de valoración';

  @override
  String get showDecorativeBadges =>
      'Mostra distintivos decorativos detrás das valoracións';

  @override
  String get episodeRatings => 'Clasificación dos episodios';

  @override
  String get showRatingsOnEpisodes =>
      'Mostrar valoracións en episodios individuais';

  @override
  String get ratingSources => 'Fontes de valoración';

  @override
  String get ratingSourcesDescription =>
      'Activa e reordena as fontes de valoración que se mostran na aplicación';

  @override
  String get pluginDetected => 'Complemento detectado';

  @override
  String get pluginNotDetected => 'Plugin non detectado';

  @override
  String get pluginNotDetectedDescription =>
      'Actualmente non se detecta o complemento do servidor. A configuración local aínda usa os seus valores gardados ou os valores predeterminados integrados.';

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
  String get recentRequests => 'Solicitudes recentes';

  @override
  String get recentlyAdded => 'Engadido recentemente';

  @override
  String get trending => 'Tendencias';

  @override
  String get popularMovies => 'Películas populares';

  @override
  String get movieGenres => 'Xéneros cinematográficos';

  @override
  String get upcomingMovies => 'Próximas películas';

  @override
  String get studios => 'Estudios';

  @override
  String get popularSeries => 'Serie Popular';

  @override
  String get seriesGenres => 'Xéneros da serie';

  @override
  String get upcomingSeries => 'Próxima serie';

  @override
  String get networks => 'Redes';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres and Tags';

  @override
  String get seerrDiscoveryRows => 'Filas de descubrimento de Seerr';

  @override
  String get seerrDiscoverSliders => 'Seerr Discover Sliders';

  @override
  String get yourWatchlist => 'Your Watchlist';

  @override
  String get resetRowsToDefaults =>
      'Restablecer as filas aos valores predeterminados';

  @override
  String get enableSeerr => 'Activar Seerr';

  @override
  String get showSeerrInNavigation =>
      'Mostrar Seerr na navegación (require o complemento do servidor)';

  @override
  String get seerrUnavailable =>
      'Non dispoñible porque a compatibilidade con Seerr do complemento do servidor está desactivada.';

  @override
  String get nsfwFilter => 'Filtro NSFW';

  @override
  String get hideAdultContent => 'Ocultar contido para adultos nos resultados';

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
  String get seerrNotificationsSection => 'Notificacións';

  @override
  String get seerrNotifyNewRequestsTitle =>
      'Notificacións de solicitudes novas';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Avísame cando alguén envíe unha solicitude';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Actualizacións das solicitudes';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Aprobadas, rexeitadas e engadidas á túa biblioteca';

  @override
  String get seerrNotifyIssuesTitle => 'Actualizacións dos problemas';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Problemas novos, respostas e resolucións';

  @override
  String get seerrNotifyNewMediaTitle => 'New Media Added';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Anything new added to the server library';

  @override
  String loggedInAs(String username) {
    return 'Sesión iniciada como: $username';
  }

  @override
  String get discoverRows => 'Páxina de descubrimento de Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Activa as filas que queres ver na páxina principal de Seerr. Arrastra para reordenar. A orde personalizada sincronízase con Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Activa as filas que queres ver na páxina principal de Seerr. Arrastra para reordenar. A orde personalizada sincronízase con Moonbase.';

  @override
  String get enabled => 'Activado';

  @override
  String get hidden => 'Oculto';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String versionValue(String version) {
    return 'Versión $version';
  }

  @override
  String get openSourceLicenses => 'Licenzas de código aberto';

  @override
  String get sourceCode => 'Código fonte';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Busca actualizacións agora';

  @override
  String get checksLatestDesktopRelease =>
      'Consulta a última versión de escritorio desta plataforma';

  @override
  String get youAreUpToDate => 'Estás ao día.';

  @override
  String get couldNotCheckForUpdates =>
      'Non se puideron buscar actualizacións neste momento.';

  @override
  String get noCompatibleUpdate =>
      'Non se atopou ningún paquete de actualización compatible para esta plataforma.';

  @override
  String get updateChecksNotSupported =>
      'As comprobacións de actualización non son compatibles nesta plataforma.';

  @override
  String get updateNotificationsDisabled =>
      'As notificacións de actualización están desactivadas.';

  @override
  String get pleaseWaitBeforeChecking => 'Agarde antes de comprobar de novo.';

  @override
  String get latestUpdateAlreadyShown =>
      'Xa se mostrou a última actualización.';

  @override
  String get updateAvailable => 'Actualización dispoñible.';

  @override
  String updateAvailableVersion(String version) {
    return 'Actualización dispoñible: v$version';
  }

  @override
  String get updateNotifications => 'Actualizar notificacións';

  @override
  String get showWhenUpdatesAvailable =>
      'Mostra cando hai actualizacións dispoñibles';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version dispoñible';
  }

  @override
  String get readReleaseNotes => 'Ler as notas da versión';

  @override
  String get downloadingUpdate => 'Descargando actualización...';

  @override
  String get updateDownloadFailed =>
      'Fallou a descarga da actualización. Téntao de novo.';

  @override
  String get openReleasesPage => 'Abre a páxina de lanzamentos';

  @override
  String get navigation => 'Navegación';

  @override
  String get watchedIndicatorsBackdrops => 'Indicadores observados, fondos';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Cor do foco, indicadores observados, fondos';

  @override
  String get navbarStyleToolbarAppearance =>
      'Estilo da barra de navegación, botóns da barra de ferramentas, aparencia';

  @override
  String get featuredContentAppearance => 'Contido destacado, aparencia';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Límite da caché de imaxes';

  @override
  String get clearImageCache => 'Limpar a caché de imaxes';

  @override
  String get imageCacheCleared => 'Limpouse a caché de imaxes';

  @override
  String get clear => 'Limpar';

  @override
  String get browse => 'Explorar';

  @override
  String get noResults => 'Sen resultados';

  @override
  String get seerrAvailableStatus => 'Dispoñible';

  @override
  String get seerrRequestedStatus => 'Solicitado';

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
    return 'Descargando · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importando';

  @override
  String itemsCount(int count) {
    return '$count elementos';
  }

  @override
  String get seerrSettings => 'Configuración de Seerr';

  @override
  String get requestMore => 'Solicita máis';

  @override
  String get requestMore4k => 'Request More in 4K';

  @override
  String get request => 'Solicitude';

  @override
  String get request4k => 'Request 4K';

  @override
  String get requested4k => '4K Requested';

  @override
  String get cancelRequest => 'Cancelar solicitude';

  @override
  String get cancelRequest4k => 'Cancel 4K Request';

  @override
  String get playInMoonfin => 'Xoga en Moonfin';

  @override
  String get requestedByLabel => 'Requested by';

  @override
  String requestedByName(String name) {
    return 'Solicitado por $name';
  }

  @override
  String get manageRequests => 'Manage Requests';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get onWatchlist => 'On Watchlist';

  @override
  String get approve => 'Aprobar';

  @override
  String get declineAction => 'Declinar';

  @override
  String get similar => 'Semellante';

  @override
  String get recommendations => 'Recomendacións';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancelar a solicitude de \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancelar $count solicitudes de \"$title\"?';
  }

  @override
  String get keep => 'Manteña';

  @override
  String get itemNotFoundInLibrary =>
      'Non se atopou o elemento na túa biblioteca de Moonfin';

  @override
  String get errorSearchingLibrary =>
      'Produciuse un erro ao buscar na biblioteca';

  @override
  String budgetAmount(String amount) {
    return 'Orzamento: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Ingresos: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Solicitar $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Request 4K $type';
  }

  @override
  String get submitRequest => 'Enviar solicitude';

  @override
  String get allSeasons => 'Todas as estacións';

  @override
  String get seerrSeriesContinuing =>
      'Series Continuing · Future Seasons Can Be Requested';

  @override
  String get advancedOptions => 'Opcións avanzadas';

  @override
  String get noServiceServersConfigured =>
      'Non se configuraron servidores de servizo';

  @override
  String get server => 'Servidor';

  @override
  String get qualityProfile => 'Perfil de calidade';

  @override
  String get rootFolder => 'Cartafol raíz';

  @override
  String get showMore => 'Mostrar máis';

  @override
  String get appearances => 'Aparicións';

  @override
  String get crewSection => 'Tripulación';

  @override
  String ageValue(int age) {
    return 'idade $age';
  }

  @override
  String get noRequests => 'Sen solicitudes';

  @override
  String get pendingStatus => 'Pendente';

  @override
  String get declinedStatus => 'Rexeitou';

  @override
  String get partiallyAvailable => 'Dispoñible parcialmente';

  @override
  String get downloadingStatus => 'Descargando';

  @override
  String get approvedStatus => 'Aprobado';

  @override
  String get notRequestedStatus => 'Non solicitado';

  @override
  String get blocklistedStatus => 'Bloqueado';

  @override
  String get deletedStatus => 'Eliminado';

  @override
  String get failedStatus => 'Fallou';

  @override
  String get processingStatus => 'En proceso';

  @override
  String modifiedByName(String name) {
    return 'Modificado por $name';
  }

  @override
  String get completedStatus => 'Completada';

  @override
  String get requestErrorDuplicate => 'Este título xa se solicitou';

  @override
  String get requestErrorQuota => 'Acadaches o límite de solicitudes';

  @override
  String get requestErrorBlocklisted => 'Este título está na lista de bloqueo';

  @override
  String get requestErrorNoSeasons => 'Non quedan tempadas por solicitar';

  @override
  String get requestErrorPermission =>
      'Non tes permiso para facer esta solicitude';

  @override
  String get seerrRequestsTitle => 'Solicitudes';

  @override
  String get seerrIssuesTitle => 'Problemas';

  @override
  String get sortNewest => 'Máis recentes';

  @override
  String get sortLastModified => 'Última modificación';

  @override
  String get noIssues => 'Non hai problemas';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Quédanche $remaining de $limit solicitudes de películas';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Quédanche $remaining de $limit solicitudes de tempadas';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Forma parte de $name';
  }

  @override
  String get viewCollection => 'Ver a colección';

  @override
  String get requestCollection => 'Solicitar a colección';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total películas · $available dispoñibles';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Solicitar $count películas';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Solicitando $current de $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Solicitáronse $count películas';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Solicitáronse $ok de $total películas';
  }

  @override
  String get collectionAllRequested =>
      'Todas as películas xa están dispoñibles ou solicitadas';

  @override
  String get reportIssue => 'Informar dun problema';

  @override
  String get issueTypeVideo => 'Vídeo';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Que ocorre?';

  @override
  String get allEpisodes => 'Todos os episodios';

  @override
  String get episode => 'Episodio';

  @override
  String get openStatus => 'Aberto';

  @override
  String get resolvedStatus => 'Resolto';

  @override
  String get resolveAction => 'Resolver';

  @override
  String get reopenAction => 'Reabrir';

  @override
  String reportedByName(String name) {
    return 'Informado por $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comentarios';
  }

  @override
  String get addComment => 'Engadir un comentario';

  @override
  String get deleteIssueConfirm => 'Eliminar este problema?';

  @override
  String get submitReport => 'Enviar o informe';

  @override
  String get tmdbScore => 'Puntuación TMDB';

  @override
  String get releaseDateLabel => 'Data de lanzamento';

  @override
  String get firstAirDateLabel => 'Primeira cita de emisión';

  @override
  String get revenueLabel => 'Ingresos';

  @override
  String get runtimeLabel => 'Tempo de execución';

  @override
  String get budgetLabel => 'Orzamento';

  @override
  String get originalLanguageLabel => 'Lingua orixinal';

  @override
  String get seasonsLabel => 'Tempadas';

  @override
  String get episodesLabel => 'Episodios';

  @override
  String get access => 'Acceso';

  @override
  String get add => 'Engadir';

  @override
  String get address => 'Enderezo';

  @override
  String get analytics => 'Analítica';

  @override
  String get catalog => 'Catálogo';

  @override
  String get content => 'Contido';

  @override
  String get copy => 'Copiar';

  @override
  String get create => 'Crear';

  @override
  String get disable => 'Desactivar';

  @override
  String get done => 'Feito';

  @override
  String get edit => 'Editar';

  @override
  String get encoding => 'Codificación';

  @override
  String get error => 'Erro';

  @override
  String get forward => 'Avanzar';

  @override
  String get general => 'Xeral';

  @override
  String get go => 'Vaia';

  @override
  String get install => 'Instalar';

  @override
  String get installed => 'Instalado';

  @override
  String get interval => 'Intervalo';

  @override
  String get name => 'Nome';

  @override
  String get networking => 'Rede';

  @override
  String get next => 'Seguinte';

  @override
  String get path => 'Camiño';

  @override
  String get paused => 'En pausa';

  @override
  String get permissions => 'Permisos';

  @override
  String get processing => 'Procesamento';

  @override
  String get profile => 'Perfil';

  @override
  String get provider => 'Provedor';

  @override
  String get refresh => 'Actualizar';

  @override
  String get remote => 'Mando a distancia';

  @override
  String get rename => 'Cambiar o nome';

  @override
  String get revoke => 'Revogar';

  @override
  String get role => 'Papel';

  @override
  String get root => 'Raíz';

  @override
  String get run => 'Corre';

  @override
  String get search => 'Buscar';

  @override
  String get select => 'Seleccione';

  @override
  String get send => 'Enviar';

  @override
  String get sessions => 'Sesións';

  @override
  String get set => 'Establecer';

  @override
  String get status => 'Estado';

  @override
  String get stop => 'Deter';

  @override
  String get streaming => 'Transmisión en directo';

  @override
  String get time => 'Tempo';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get up => 'Arriba';

  @override
  String get update => 'Actualizar';

  @override
  String get upload => 'Cargar';

  @override
  String get unmute => 'Activar o silencio';

  @override
  String get mute => 'Silenciar';

  @override
  String get branding => 'Marca';

  @override
  String get adminDrawerDashboard => 'Panel de control';

  @override
  String get adminDrawerAnalytics => 'Analítica';

  @override
  String get adminDrawerSettings => 'Configuración';

  @override
  String get adminDrawerBranding => 'Marca';

  @override
  String get adminDrawerUsers => 'Usuarios';

  @override
  String get adminDrawerLibraries => 'Bibliotecas';

  @override
  String get adminDrawerDisplay => 'Visualización';

  @override
  String get adminDrawerMetadata => 'Metadatos';

  @override
  String get adminDrawerNfo => 'Configuración NFO';

  @override
  String get adminDrawerTranscoding => 'Transcodificación';

  @override
  String get adminDrawerResume => 'Retomar';

  @override
  String get adminDrawerStreaming => 'Transmisión en directo';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Dispositivos';

  @override
  String get adminDrawerActivity => 'Actividade';

  @override
  String get adminDrawerNetworking => 'Rede';

  @override
  String get adminDrawerApiKeys => 'Claves API';

  @override
  String get adminDrawerBackups => 'Copias de seguridade';

  @override
  String get adminDrawerLogs => 'Rexistros';

  @override
  String get adminDrawerScheduledTasks => 'Tarefas programadas';

  @override
  String get adminDrawerPlugins => 'Complementos';

  @override
  String get adminDrawerRepositories => 'Repositorios';

  @override
  String get adminDrawerLiveTv => 'TV en directo';

  @override
  String get adminExitTooltip => 'Saír do administrador';

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
  String get adminDashboardLoadFailed => 'Produciuse un erro ao cargar o panel';

  @override
  String get adminMediaOverview => 'Visión xeral dos medios';

  @override
  String get adminMediaTotalsError =>
      'Non se puideron cargar os totais de medios do servidor.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Unha lectura rápida sobre canto contido hai neste servidor.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Actualizacións de complementos dispoñibles: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Complementos que requiren reinicio: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tarefas programadas fallidas: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribución de medios';

  @override
  String get analyticsVideoCodecs => 'Códecs de vídeo';

  @override
  String get analyticsAudioCodecs => 'Codecs de audio';

  @override
  String get analyticsContainers => 'Contenedores';

  @override
  String get analyticsTopGenres => 'Xéneros principais';

  @override
  String get analyticsReleaseYears => 'Anos de lanzamento';

  @override
  String get analyticsContentRatings => 'Valoracións do contido';

  @override
  String get analyticsRuntimeBuckets => 'Cubos de tempo de execución';

  @override
  String get analyticsFileFormats => 'Formatos de ficheiros';

  @override
  String get analyticsNoData => 'Non hai datos dispoñibles.';

  @override
  String get adminServerInfo => 'Información do servidor';

  @override
  String get adminRestartPending => 'Reiniciar pendente';

  @override
  String get adminServerPaths => 'Rutas do servidor';

  @override
  String get adminServerActions => 'Accións do servidor';

  @override
  String get adminRestartServer => 'Reinicie o servidor';

  @override
  String get adminShutdownServer => 'Apagar o servidor';

  @override
  String get adminLibraryScanStarted => 'Comezou a exploración da biblioteca';

  @override
  String errorGeneric(String error) {
    return 'Erro: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Reinicio do servidor en curso';

  @override
  String get adminServerRebootMessage =>
      'Reinicio do servidor en curso, reinicie Moonfin';

  @override
  String get adminActiveSessions => 'Sesións activas';

  @override
  String get adminSessionsLoadFailed =>
      'Produciuse un erro ao cargar as sesións';

  @override
  String get adminNoActiveSessions => 'Non hai sesións activas';

  @override
  String get adminRecentActivity => 'Actividade recente';

  @override
  String get adminNoRecentActivity => 'Non hai actividade recente';

  @override
  String adminCommandFailed(String error) {
    return 'Fallou o comando: $error';
  }

  @override
  String get adminSendMessage => 'Enviar mensaxe';

  @override
  String get adminMessageTextHint => 'Texto da mensaxe';

  @override
  String get adminSetVolume => 'Establecer volume';

  @override
  String get sessionPrev => 'Ant.';

  @override
  String get sessionRewind => 'Rebobinar';

  @override
  String get sessionForward => 'Avanzar';

  @override
  String get sessionNext => 'Seguinte';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Agora xogando';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Accións';

  @override
  String get videoCodec => 'Códec de vídeo';

  @override
  String get audioCodec => 'Codec de audio';

  @override
  String get hwAccel => 'Acel. HW';

  @override
  String get completion => 'Finalización';

  @override
  String get adminClearDates => 'Datas claras';

  @override
  String get adminActivitySeverityAll => 'Todas as gravidades';

  @override
  String get adminActivityDateRange => 'Intervalo de datas';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Produciuse un erro ao cargar o rexistro de actividade: $error';
  }

  @override
  String get adminNoActivityEntries => 'Non hai entradas de actividade';

  @override
  String get adminEditDeviceName => 'Editar o nome do dispositivo';

  @override
  String get adminCustomName => 'Nome personalizado';

  @override
  String get adminDeviceNameUpdated => 'Actualizouse o nome do dispositivo';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Produciuse un erro ao actualizar o dispositivo: $error';
  }

  @override
  String get adminDeleteDevice => 'Eliminar dispositivo';

  @override
  String get adminDeviceDeleted => 'Eliminouse o dispositivo';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Produciuse un erro ao eliminar o dispositivo: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Eliminar o dispositivo \'$name\'? O usuario terá que iniciar sesión de novo neste dispositivo.';
  }

  @override
  String get adminDeleteAllDevices => 'Eliminar todos os dispositivos';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Eliminar $count dispositivos? Os usuarios afectados terán que iniciar sesión de novo. O teu dispositivo actual non se verá afectado.';
  }

  @override
  String get adminDevicesDeletedAll => 'Elimináronse os dispositivos';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Elimináronse algúns dispositivos; $count non se puideron eliminar.';
  }

  @override
  String get adminDevicesLoadFailed =>
      'Produciuse un erro ao cargar os dispositivos';

  @override
  String get adminSearchDevices => 'Busca dispositivos';

  @override
  String get adminThisDevice => 'Este dispositivo';

  @override
  String get adminEditName => 'Editar o nome';

  @override
  String get adminLibrariesLoadFailed =>
      'Produciuse un erro ao cargar as bibliotecas';

  @override
  String get adminNoLibraries => 'Non hai bibliotecas configuradas';

  @override
  String get adminScanAllLibraries => 'Escanear todas as bibliotecas';

  @override
  String get adminAddLibrary => 'Engadir biblioteca';

  @override
  String adminScanFailed(String error) {
    return 'Produciuse un erro ao iniciar a exploración: $error';
  }

  @override
  String get adminRenameLibrary => 'Cambiar o nome da biblioteca';

  @override
  String get adminNewName => 'Novo nome';

  @override
  String adminLibraryRenamed(String name) {
    return 'Renomeouse a biblioteca como \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Produciuse un erro ao renomear: $error';
  }

  @override
  String get adminDeleteLibrary => 'Eliminar biblioteca';

  @override
  String adminLibraryDeleted(String name) {
    return 'Eliminouse a biblioteca \"$name\"';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Produciuse un erro ao eliminar a biblioteca: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Produciuse un erro ao engadir o camiño: $error';
  }

  @override
  String get adminRemovePath => 'Eliminar o camiño';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Quitar \"$path\" desta biblioteca?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Produciuse un erro ao quitar o camiño: $error';
  }

  @override
  String get adminLibraryLoadFailed =>
      'Produciuse un erro ao cargar a biblioteca';

  @override
  String get adminNoMediaPaths => 'Non se configuraron rutas multimedia';

  @override
  String get adminAddPath => 'Engadir camiño';

  @override
  String get adminBrowseFilesystem =>
      'Explorar o sistema de ficheiros do servidor:';

  @override
  String get adminPreferredMetadataLanguage => 'Idioma de metadatos preferido';

  @override
  String get adminMetadataLanguageHint => 'p.ex. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Código de país de metadatos';

  @override
  String get adminMetadataCountryHint => 'p.ex. EU, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Camiños';

  @override
  String get adminLibraryTabOptions => 'Opcións';

  @override
  String get adminLibraryTabDownloaders => 'Descargadores';

  @override
  String get adminLibMetadataSavers => 'Gardadores de metadatos';

  @override
  String get adminLibSubtitleDownloaders => 'Descargadores de subtítulos';

  @override
  String get adminLibLyricDownloaders => 'Descargadores de letras';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Descargadores de metadatos: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Obtedores de imaxes: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Este servidor non ofrece ningún descargador para este tipo de biblioteca.';

  @override
  String get adminLibrarySectionGeneral => 'Xeral';

  @override
  String get adminLibrarySectionMetadata => 'Metadatos';

  @override
  String get adminLibrarySectionEmbedded => 'Información incrustada';

  @override
  String get adminLibrarySectionSubtitles => 'Subtítulos';

  @override
  String get adminLibrarySectionImages => 'Imaxes';

  @override
  String get adminLibrarySectionSeries => 'Series';

  @override
  String get adminLibrarySectionMusic => 'Música';

  @override
  String get adminLibrarySectionMovies => 'Películas';

  @override
  String get adminLibRealtimeMonitor => 'Activar a supervisión en tempo real';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detecta os cambios nos ficheiros e procésaos automaticamente.';

  @override
  String get adminLibEnablePhotos => 'Mostrar as fotos';

  @override
  String get adminLibSaveLocalMetadata =>
      'Gardar as ilustracións nos cartafoles multimedia';

  @override
  String get adminLibRefreshInterval =>
      'Actualización automática dos metadatos';

  @override
  String get adminLibRefreshNever => 'Nunca';

  @override
  String get adminLibDefault => 'Predeterminado';

  @override
  String get adminLibDisplayTitle => 'Visualización';

  @override
  String get adminLibDisplaySection => 'Visualización da biblioteca';

  @override
  String get adminLibFolderView =>
      'Mostrar unha vista de cartafoles para ver os cartafoles multimedia simples';

  @override
  String get adminLibSpecialsInSeasons =>
      'Mostrar os especiais dentro das tempadas nas que se emitiron';

  @override
  String get adminLibGroupMovies => 'Agrupar as películas en coleccións';

  @override
  String get adminLibGroupShows => 'Agrupar as series en coleccións';

  @override
  String get adminLibExternalSuggestions =>
      'Mostrar contido externo nas suxestións';

  @override
  String get adminLibDateAddedSection => 'Comportamento da data de engadido';

  @override
  String get adminLibDateAddedLabel => 'Usar a data de engadido de';

  @override
  String get adminLibDateAddedImport => 'Data de exploración na biblioteca';

  @override
  String get adminLibDateAddedFile => 'Data de creación do ficheiro';

  @override
  String get adminLibMetadataTitle => 'Metadatos e imaxes';

  @override
  String get adminLibMetadataLangSection => 'Idioma de metadatos preferido';

  @override
  String get adminLibChaptersSection => 'Capítulos';

  @override
  String get adminLibDummyChapterDuration =>
      'Duración dos capítulos simulados (segundos)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Duración dos capítulos xerados para o contido que non ten ningún. Establece 0 para desactivalo.';

  @override
  String get adminLibChapterImageResolution =>
      'Resolución das imaxes dos capítulos';

  @override
  String get adminLibNfoTitle => 'Configuración NFO';

  @override
  String get adminLibNfoHelp =>
      'Os metadatos NFO son compatibles con Kodi e clientes similares. A configuración aplícase a todas as bibliotecas que gardan metadatos NFO.';

  @override
  String get adminLibKodiUser =>
      'Usuario do que se gardarán os datos de visualización nos ficheiros NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Gardar os camiños das imaxes nos ficheiros NFO';

  @override
  String get adminLibPathSubstitution =>
      'Activar a substitución de camiños para os camiños de imaxe dos NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copiar as imaxes de extrafanart nun cartafol extrathumbs';

  @override
  String get adminLibNone => 'Ningún';

  @override
  String adminLibRefreshDays(int days) {
    return '$days días';
  }

  @override
  String get adminLibEmbeddedTitles => 'Usar os títulos incrustados';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Usar os títulos incrustados para os extras';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Usar a información de episodio incrustada';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Permitir os subtítulos incrustados';

  @override
  String get adminLibEmbeddedAllowAll => 'Permitir todo';

  @override
  String get adminLibEmbeddedAllowText => 'Só texto';

  @override
  String get adminLibEmbeddedAllowImage => 'Só imaxe';

  @override
  String get adminLibEmbeddedAllowNone => 'Ningún';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Omitir a descarga se hai subtítulos incrustados';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Omitir a descarga se a pista de audio coincide co idioma de descarga';

  @override
  String get adminLibRequirePerfectMatch =>
      'Esixir unha coincidencia perfecta dos subtítulos';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Gardar os subtítulos nos cartafoles multimedia';

  @override
  String get adminLibChapterImageExtraction =>
      'Extraer as imaxes dos capítulos';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extraer as imaxes dos capítulos durante a exploración da biblioteca';

  @override
  String get adminLibTrickplayExtraction =>
      'Activar a extracción de imaxes de Trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extraer as imaxes de Trickplay durante a exploración da biblioteca';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Gardar as imaxes de Trickplay nos cartafoles multimedia';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Combinar automaticamente as series repartidas en varios cartafoles';

  @override
  String get adminLibSeasonZeroName => 'Nome que se mostra para a tempada cero';

  @override
  String get adminLibLufsScan =>
      'Activar a análise LUFS para a normalización do audio';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferir a etiqueta de artistas non estándar';

  @override
  String get adminLibAutoAddToCollection =>
      'Engadir automaticamente as películas ás coleccións';

  @override
  String get adminLibraryNameRequired => 'O nome da biblioteca é necesario';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Produciuse un erro ao crear a biblioteca: $error';
  }

  @override
  String get adminLibraryName => 'Nome da biblioteca';

  @override
  String get adminSelectedPaths => 'Camiños seleccionados:';

  @override
  String get adminCreateLibrary => 'Crear biblioteca';

  @override
  String get paths => 'Camiños:';

  @override
  String get adminDisableUser => 'Desactivar Usuario';

  @override
  String get adminEnableUser => 'Activar Usuario';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Desactivar a $name? Non poderá iniciar sesión.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Activar a $name? Poderá iniciar sesión de novo.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Desactivouse o usuario \"$name\"';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Activouse o usuario \"$name\"';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Produciuse un erro ao actualizar a política do usuario: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Produciuse un erro ao cargar os usuarios';

  @override
  String get adminSearchUsers => 'Busca usuarios';

  @override
  String get adminEditUser => 'Editar Usuario';

  @override
  String get adminAddUser => 'Engadir usuario';

  @override
  String adminUserCreateFailed(String error) {
    return 'Produciuse un erro ao crear o usuario: $error';
  }

  @override
  String get adminCreateUser => 'Crear usuario';

  @override
  String get adminPasswordOptional => 'Contrasinal (opcional)';

  @override
  String get adminUsernameRequired =>
      'O nome de usuario non pode estar baleiro';

  @override
  String adminSaveFailed(String error) {
    return 'Produciuse un erro ao gardar: $error';
  }

  @override
  String get adminPasswordsMismatch => 'Os contrasinais non coinciden';

  @override
  String adminFailed(String error) {
    return 'Fallou: $error';
  }

  @override
  String get adminUserLoadFailed => 'Produciuse un erro ao cargar o usuario';

  @override
  String get adminDeleteUser => 'Eliminar usuario';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Os administradores teñen acceso completo ao servidor. Concede con precaución.';

  @override
  String get administrator => 'Administrador';

  @override
  String get adminHiddenUser => 'Usuario oculto';

  @override
  String get adminAllowMediaPlayback => 'Permitir a reprodución multimedia';

  @override
  String get adminAllowAudioTranscoding =>
      'Permitir a transcodificación de audio';

  @override
  String get adminAllowVideoTranscoding =>
      'Permitir a transcodificación de vídeo';

  @override
  String get adminAllowRemuxing => 'Permitir a remuxaxe';

  @override
  String get adminForceRemoteTranscoding =>
      'Forzar a transcodificación da fonte remota';

  @override
  String get adminAllowContentDownloading => 'Permitir a descarga de contido';

  @override
  String get adminAllowPublicSharing => 'Permitir compartir en público';

  @override
  String get adminAllowRemoteControl =>
      'Permitir o control remoto doutros usuarios';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permitir o control de dispositivos compartidos';

  @override
  String get adminAllowRemoteAccess => 'Permitir o acceso remoto';

  @override
  String get adminLeaveEmptyNoLimit => 'Deixe baleiro sen límite';

  @override
  String get adminMaxActiveSessions => 'Máximo de sesións activas';

  @override
  String get adminAllowLiveTvAccess => 'Permitir o acceso á TV en directo';

  @override
  String get adminAllowLiveTvManagement =>
      'Permitir a xestión de TV en directo';

  @override
  String get adminAllowCollectionManagement =>
      'Permitir a xestión da recadación';

  @override
  String get adminAllowSubtitleManagement => 'Permitir a xestión de subtítulos';

  @override
  String get adminAllowLyricManagement => 'Permitir a xestión da letra';

  @override
  String get adminEnableAllLibraryAccess =>
      'Activa o acceso a todas as bibliotecas';

  @override
  String get adminChangePassword => 'Cambiar contrasinal';

  @override
  String get adminNewPassword => 'Contrasinal novo';

  @override
  String get adminConfirmPassword => 'Confirme o contrasinal';

  @override
  String get adminSetPassword => 'Establecer contrasinal';

  @override
  String get adminResetPassword => 'Restablecer o contrasinal';

  @override
  String get adminPasswordReset => 'Restablecer o contrasinal';

  @override
  String get adminPasswordUpdated => 'Contrasinal actualizado';

  @override
  String get adminUserSettings => 'Configuración de usuario';

  @override
  String get adminLibraryAccess => 'Acceso á biblioteca';

  @override
  String get adminEnableAllDevices => 'Activa o acceso a todos os dispositivos';

  @override
  String get adminEnableAllChannels => 'Activa o acceso a todas as canles';

  @override
  String get adminParentalControl => 'Control parental';

  @override
  String get adminMaxParentalRating =>
      'Clasificación parental máxima permitida';

  @override
  String get adminMaxParentalRatingHint =>
      'O contido cunha clasificación superior ocultarase a este usuario.';

  @override
  String get adminParentalRatingNone => 'Ningunha';

  @override
  String get adminBlockUnratedItems =>
      'Bloquear os elementos sen clasificación ou con clasificación non recoñecida';

  @override
  String get adminUnratedBook => 'Libros';

  @override
  String get adminUnratedChannelContent => 'Canles';

  @override
  String get adminUnratedLiveTvChannel => 'TV en directo';

  @override
  String get adminUnratedMovie => 'Películas';

  @override
  String get adminUnratedMusic => 'Música';

  @override
  String get adminUnratedTrailer => 'Tráilers';

  @override
  String get adminUnratedSeries => 'Series';

  @override
  String get adminAccessSchedules => 'Horarios de acceso';

  @override
  String get adminAccessSchedulesHint =>
      'Permite o acceso só durante os horarios programados a continuación. Se non se define ningún horario, o acceso permítese todo o día.';

  @override
  String get adminAddSchedule => 'Engadir un horario';

  @override
  String get adminScheduleDay => 'Día';

  @override
  String get adminScheduleStart => 'Inicio';

  @override
  String get adminScheduleEnd => 'Fin';

  @override
  String get adminDayEveryday => 'Todos os días';

  @override
  String get adminDayWeekday => 'Día laborable';

  @override
  String get adminDayWeekend => 'Fin de semana';

  @override
  String get adminDaySunday => 'Domingo';

  @override
  String get adminDayMonday => 'Luns';

  @override
  String get adminDayTuesday => 'Martes';

  @override
  String get adminDayWednesday => 'Mércores';

  @override
  String get adminDayThursday => 'Xoves';

  @override
  String get adminDayFriday => 'Venres';

  @override
  String get adminDaySaturday => 'Sábado';

  @override
  String get adminAllowedTags => 'Etiquetas permitidas';

  @override
  String get adminAllowedTagsHint =>
      'Só se mostra o contido con estas etiquetas. Déixao baleiro para permitir todo.';

  @override
  String get adminBlockedTags => 'Etiquetas bloqueadas';

  @override
  String get adminBlockedTagsHint =>
      'O contido con estas etiquetas ocúltase a este usuario.';

  @override
  String get adminAddTag => 'Engadir unha etiqueta';

  @override
  String get adminAuthProvider => 'Provedor de autenticación';

  @override
  String get adminPasswordResetProvider =>
      'Provedor de restablecemento do contrasinal';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Máximo de intentos de inicio de sesión fallidos antes do bloqueo';

  @override
  String get adminLoginAttemptsHint =>
      'Establece 0 para o valor predeterminado, ou -1 para desactivar o bloqueo.';

  @override
  String get adminSyncPlayAccess => 'Acceso a SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Permitir crear grupos e unirse a eles';

  @override
  String get adminSyncPlayJoin => 'Permitir unirse a grupos';

  @override
  String get adminSyncPlayNone => 'Sen acceso';

  @override
  String get adminContentDeletionFolders =>
      'Permitir a eliminación de contido de';

  @override
  String get adminResetPasswordWarning =>
      'Isto eliminará o contrasinal. O usuario poderá iniciar sesión sen contrasinal.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'O servidor devolveu HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Seguro que queres eliminar a $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Eliminouse o usuario \"$name\"';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Produciuse un erro ao eliminar o usuario: $error';
  }

  @override
  String get adminCreateApiKey => 'Crear clave de API';

  @override
  String get adminAppName => 'Nome da aplicación';

  @override
  String get adminApiKeyCreated => 'Clave da API creada';

  @override
  String get adminApiKeyCreatedNoToken =>
      'A chave creouse correctamente. O servidor non devolveu o token. Comproba as claves da API do servidor.';

  @override
  String get adminKeyCopied => 'Copiouse a clave no portapapeis';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Produciuse un erro ao crear a clave: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Falta o token de chave na resposta do servidor';

  @override
  String get adminRevokeApiKey => 'Revogar a chave da API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revogar a clave de $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Revogouse a chave da API';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Produciuse un erro ao revogar a clave: $error';
  }

  @override
  String get adminApiKeysLoadFailed =>
      'Produciuse un erro ao cargar as claves da API';

  @override
  String get adminApiKeysTitle => 'Claves API';

  @override
  String get adminCreateKey => 'Crear clave';

  @override
  String get adminNoApiKeys => 'Non se atoparon chaves API';

  @override
  String get adminUnknownApp => 'Aplicación descoñecida';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreada: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Crear unha copia de seguranza';

  @override
  String get adminBackupDatabase => 'Base de datos';

  @override
  String get adminBackupDatabaseAlways => 'Sempre incluída';

  @override
  String get adminBackupMetadata => 'Metadatos';

  @override
  String get adminBackupSubtitles => 'Subtítulos';

  @override
  String get adminBackupTrickplay => 'Imaxes de Trickplay';

  @override
  String get adminCreatingBackup => 'Creando copia de seguranza...';

  @override
  String get adminBackupCreated => 'Creouse a copia de seguranza correctamente';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Produciuse un erro ao crear a copia de seguranza: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Falta a ruta da copia de seguranza na resposta do servidor';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesto: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Produciuse un erro ao cargar o manifesto: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmar a restauración';

  @override
  String get adminRestoringBackup => 'Restaurando a copia de seguranza...';

  @override
  String adminRestoreFailed(String error) {
    return 'Produciuse un erro ao restaurar a copia de seguranza: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'Produciuse un erro ao cargar as copias de seguranza';

  @override
  String get adminCreateBackup => 'Crear copia de seguranza';

  @override
  String get adminNoBackups => 'Non se atoparon copias de seguranza';

  @override
  String get adminViewDetails => 'Ver detalles';

  @override
  String get restore => 'Restaurar';

  @override
  String get adminLogsLoadFailed =>
      'Produciuse un erro ao cargar os rexistros do servidor';

  @override
  String get adminNoLogFiles => 'Non se atoparon ficheiros de rexistro';

  @override
  String get adminLogCopied => 'Copiouse o rexistro no portapapeis';

  @override
  String get adminSaveLogFile => 'Gardar ficheiro de rexistro';

  @override
  String adminSavedTo(String path) {
    return 'Gardouse en $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Produciuse un erro ao gardar o ficheiro: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Produciuse un erro ao cargar $fileName';
  }

  @override
  String get adminSearchInLog => 'Busca no rexistro';

  @override
  String get adminNoMatchingLines => 'Non hai liñas coincidentes';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Produciuse un erro ao cargar as tarefas: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Non se atoparon tarefas programadas';

  @override
  String get adminNoTasksMatchFilter =>
      'Ningunha tarefa coincide co filtro actual';

  @override
  String adminTaskStartFailed(String error) {
    return 'Produciuse un erro ao iniciar a tarefa: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Produciuse un erro ao deter a tarefa: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Produciuse un erro ao cargar a tarefa: $error';
  }

  @override
  String get adminRunNow => 'Corre agora';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Produciuse un erro ao quitar o disparador: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Produciuse un erro ao engadir o disparador: $error';
  }

  @override
  String get adminLastExecution => 'Última Execución';

  @override
  String get adminTriggers => 'Disparadores';

  @override
  String get adminAddTrigger => 'Engadir disparador';

  @override
  String get adminNoTriggers => 'Non hai activadores configurados';

  @override
  String get adminTriggerType => 'Tipo de disparador';

  @override
  String get adminNoLimit => 'Sen límite';

  @override
  String adminHours(String hours) {
    return '$hours hora(s)';
  }

  @override
  String get adminDayOfWeek => 'Día da semana';

  @override
  String get adminSearchPlugins => 'Busca complementos...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Produciuse un erro ao activar ou desactivar o complemento: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstalar o complemento';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Seguro que queres desinstalar \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Produciuse un erro ao desinstalar o complemento: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Produciuse un erro ao instalar o paquete: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Produciuse un erro ao instalar a actualización: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Produciuse un erro ao cargar os complementos: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Ningún complemento coincide coa túa busca';

  @override
  String get adminNoPluginsInstalled => 'Non hai complementos instalados';

  @override
  String adminInstallUpdate(String version) {
    return 'Instalar a actualización (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Produciuse un erro ao cargar o catálogo: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Ningún paquete coincide coa túa busca';

  @override
  String get adminNoPackagesAvailable => 'Non hai paquetes dispoñibles';

  @override
  String get adminExperimentalIntegration => 'Integración experimental';

  @override
  String get adminExperimentalWarning =>
      'A integración da configuración do complemento aínda é experimental. É posible que algunhas páxinas de configuración non se mostren correctamente.';

  @override
  String get continueAction => 'Continuar';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" quitarase despois de reiniciar o servidor';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Produciuse un erro ao desinstalar: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Actualizando \"$name\" á v$version...';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Produciuse un erro ao cargar o complemento: $error';
  }

  @override
  String get adminPluginNotFound => 'Non se atopou o complemento';

  @override
  String adminPluginVersion(String version) {
    return 'Versión $version';
  }

  @override
  String get adminEnablePlugin => 'Activar o complemento';

  @override
  String get adminPluginSettingsPage =>
      'Páxina de configuración do complemento';

  @override
  String get adminRevisionHistory => 'Historial de revisións';

  @override
  String get adminNoChangelog => 'Non hai rexistro de cambios dispoñible.';

  @override
  String get adminRemoveRepository => 'Eliminar repositorio';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Seguro que queres quitar \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Produciuse un erro ao gardar os repositorios: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Produciuse un erro ao cargar os repositorios: $error';
  }

  @override
  String get adminRepositoryNameHint => 'p.ex. Establo Jellyfin';

  @override
  String get adminRepositoryUrl => 'URL do repositorio';

  @override
  String get adminAddEntry => 'Engadir entrada';

  @override
  String get adminInvalidUrl => 'URL non válido';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Non foi posible cargar a configuración do complemento: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Non foi posible abrir $uri';
  }

  @override
  String get adminOpenInBrowser => 'Abrir no navegador';

  @override
  String get adminOpenExternally => 'Abrir externamente';

  @override
  String get adminGeneralSettings => 'Configuración xeral';

  @override
  String get adminServerName => 'Nome do servidor';

  @override
  String get adminPreferredMetadataCountry => 'País de metadatos preferido';

  @override
  String get adminCachePath => 'Ruta da caché';

  @override
  String get adminMetadataPath => 'Camiño dos metadatos';

  @override
  String get adminLibraryScanConcurrency =>
      'Simultánea de exploración da biblioteca';

  @override
  String get adminParallelImageEncodingLimit =>
      'Límite de codificación de imaxes paralelas';

  @override
  String get adminSlowResponseThreshold => 'Limiar de resposta lenta (ms)';

  @override
  String get adminBrandingLoadFailed =>
      'Produciuse un erro ao cargar a configuración de marca';

  @override
  String get adminLoginDisclaimer =>
      'Exención de responsabilidade de inicio de sesión';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML que aparece debaixo do formulario de inicio de sesión';

  @override
  String get adminCustomCss => 'CSS personalizado';

  @override
  String get adminCustomCssHint => 'CSS personalizado aplicado á interface web';

  @override
  String get adminEnableSplashScreen => 'Activar a pantalla de inicio';

  @override
  String get adminStreamingLoadFailed =>
      'Produciuse un erro ao cargar a configuración de streaming';

  @override
  String get adminStreamingDescription =>
      'Establece límites de bitrate de transmisión global para conexións remotas.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Límite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Deixa baleiro ou 0 para ilimitado';

  @override
  String get adminPlaybackLoadFailed =>
      'Produciuse un erro ao cargar a configuración de reprodución';

  @override
  String get adminHardwareAcceleration => 'Aceleración de hardware';

  @override
  String get adminVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Activa a codificación de hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Activar a decodificación de hardware para:';

  @override
  String get adminEncodingThreads => 'Codificación de fíos';

  @override
  String get adminAutomatic => '0 = automático';

  @override
  String get adminTranscodingTempPath => 'Ruta temporal de transcodificación';

  @override
  String get adminEnableFallbackFont => 'Activa o tipo de letra alternativo';

  @override
  String get adminFallbackFontPath => 'Ruta de letra alternativa';

  @override
  String get adminAllowSegmentDeletion => 'Permitir a eliminación de segmentos';

  @override
  String get adminSegmentKeepSeconds => 'Mantemento de segmentos (segundos)';

  @override
  String get adminThrottleBuffering => 'Buffer do acelerador';

  @override
  String get adminTrickplayLoadFailed =>
      'Produciuse un erro ao cargar a configuración de Trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Activa a aceleración de hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Activa a extracción só de fotogramas clave';

  @override
  String get adminKeyFrameSubtitle => 'Máis rápido pero con menor precisión';

  @override
  String get adminScanBehavior => 'Comportamento da exploración';

  @override
  String get adminProcessPriority => 'Prioridade do proceso';

  @override
  String get adminImageSettings => 'Configuración da imaxe';

  @override
  String get adminIntervalMs => 'Intervalo (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Cantas veces capturar fotogramas';

  @override
  String get adminWidthResolutions => 'Resolucións de ancho';

  @override
  String get adminTileWidth => 'Ancho da tella';

  @override
  String get adminTileHeight => 'Altura da tella';

  @override
  String get adminQualitySubtitle =>
      'Valores máis baixos = mellor calidade, ficheiros máis grandes';

  @override
  String get adminProcessThreads => 'Procesar fíos';

  @override
  String get adminResumeLoadFailed =>
      'Produciuse un erro ao cargar a configuración do currículo';

  @override
  String get adminResumeDescription =>
      'Configure cando se debe marcar o contido como reproducido parcialmente ou totalmente.';

  @override
  String get adminMinResumePercentage => 'Porcentaxe mínima de currículo';

  @override
  String get adminMinResumeSubtitle =>
      'O contido debe reproducirse por encima desta porcentaxe para gardar o progreso';

  @override
  String get adminMaxResumePercentage => 'Porcentaxe máxima de currículo';

  @override
  String get adminMaxResumeSubtitle =>
      'Considérase que o contido se reproduciu completamente despois desta porcentaxe';

  @override
  String get adminMinResumeDuration =>
      'Duración mínima do currículo (segundos)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Os elementos máis curtos que este non se poden retomar';

  @override
  String get adminMinAudiobookResume =>
      'Porcentaxe mínima de currículo de audiolibro';

  @override
  String get adminMaxAudiobookResume =>
      'Porcentaxe máxima de currículo de audiolibro';

  @override
  String get adminNetworkingLoadFailed =>
      'Produciuse un erro ao cargar a configuración de rede';

  @override
  String get adminNetworkingWarning =>
      'Os cambios na configuración de rede poden requirir un reinicio do servidor.';

  @override
  String get adminEnableRemoteAccess => 'Activa o acceso remoto';

  @override
  String get ports => 'Portos';

  @override
  String get adminHttpPort => 'Porto HTTP';

  @override
  String get adminHttpsPort => 'Porto HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porto HTTPS público';

  @override
  String get adminBaseUrl => 'URL base';

  @override
  String get adminBaseUrlHint => 'p.ex. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Activa HTTPS';

  @override
  String get adminLocalNetwork => 'Rede local';

  @override
  String get adminLocalNetworkAddresses => 'Enderezos de redes locais';

  @override
  String get adminKnownProxies => 'Proxies coñecidos';

  @override
  String get adminRemoteIpFilter => 'Filtro IP remoto';

  @override
  String get adminRemoteIpFilterEntries => 'Filtro IP remoto';

  @override
  String get adminCertificatePath => 'Camiño do certificado';

  @override
  String get whitelist => 'Lista branca';

  @override
  String get blacklist => 'Lista negra';

  @override
  String get notSet => 'Non definido';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Produciuse un erro ao cargar os metadatos: $error';
  }

  @override
  String get adminRefreshMetadata => 'Actualizar metadatos';

  @override
  String get recursive => 'Recursiva';

  @override
  String get adminReplaceAllMetadata => 'Substitúe todos os metadatos';

  @override
  String get adminMetadataRefreshRequested =>
      'Solicitude de actualización de metadatos';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Produciuse un erro ao actualizar os metadatos: $error';
  }

  @override
  String get adminNoRemoteMatches => 'Non se atoparon coincidencias remotas';

  @override
  String get adminRemoteResults => 'Resultados remotos';

  @override
  String get adminRemoteMetadataApplied => 'Aplicáronse metadatos remotos';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Fallou a busca remota: $error';
  }

  @override
  String get adminUpdateContentType => 'Actualizar o tipo de contido';

  @override
  String get adminContentType => 'Tipo de contido';

  @override
  String get adminContentTypeUpdated => 'Tipo de contido actualizado';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Produciuse un erro ao actualizar o tipo de contido: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Produciuse un erro ao cargar o editor de metadatos';

  @override
  String get adminNoPeopleEntries => 'Non hai entradas de persoas';

  @override
  String get adminNoExternalIds => 'Non hai ID externos dispoñibles';

  @override
  String adminImageUpdated(String imageType) {
    return 'Actualizouse a imaxe $imageType';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Produciuse un erro ao descargar a imaxe: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Formato de imaxe non compatible';

  @override
  String get adminImageReadFailed =>
      'Produciuse un erro ao ler a imaxe seleccionada';

  @override
  String adminImageUploaded(String imageType) {
    return 'Cargouse a imaxe $imageType';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Produciuse un erro ao cargar a imaxe: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Eliminar a imaxe $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Eliminouse a imaxe $imageType';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Produciuse un erro ao eliminar a imaxe: $error';
  }

  @override
  String get adminAllProviders => 'Todos os provedores';

  @override
  String get adminNoRemoteImages => 'Non se atoparon imaxes remotas';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Produciuse un erro no descubrimento do sintonizador: $error';
  }

  @override
  String get adminTunerTypeM3u => 'Sintonizador M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Ficheiro ou URL';

  @override
  String get adminTunerIpAddress => 'Enderezo IP do sintonizador';

  @override
  String get adminTunerFriendlyName => 'Nome descritivo';

  @override
  String get adminTunerUserAgent => 'Axente de usuario';

  @override
  String get adminTunerCount => 'Límite de conexións simultáneas';

  @override
  String get adminTunerCountHelp =>
      'Número máximo de fluxos que permite o sintonizador á vez. Establece 0 para ilimitado.';

  @override
  String get adminTunerFallbackBitrate =>
      'Taxa de bits máxima de transmisión alternativa';

  @override
  String get adminTunerImportFavoritesOnly => 'Importar só as canles favoritas';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Permitir a transcodificación por hardware';

  @override
  String get adminTunerAllowFmp4 =>
      'Permitir o contedor de transcodificación fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Permitir compartir fluxos';

  @override
  String get adminTunerEnableStreamLooping => 'Activar a repetición de fluxos';

  @override
  String get adminTunerIgnoreDts => 'Ignorar DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Ler a entrada á velocidade de fotogramas nativa';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Ficheiro ou URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefixo de película';

  @override
  String get adminXmltvMovieCategories => 'Categorías de películas';

  @override
  String get adminXmltvCategoriesHelp =>
      'Separa as categorías cunha barra vertical.';

  @override
  String get adminXmltvKidsCategories => 'Categorías infantís';

  @override
  String get adminXmltvNewsCategories => 'Categorías de novas';

  @override
  String get adminXmltvSportsCategories => 'Categorías de deportes';

  @override
  String get adminSdUsername => 'Nome de usuario';

  @override
  String get adminSdPassword => 'Contrasinal';

  @override
  String get adminSdCountry => 'País';

  @override
  String get adminSdCountrySelect => 'Selecciona un país';

  @override
  String get adminSdPostalCode => 'Código postal';

  @override
  String get adminEnableAllTuners => 'Activar todos os sintonizadores';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Produciuse un erro ao quitar o sintonizador: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Produciuse un erro ao quitar o provedor: $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Camiño de gravación da serie';

  @override
  String get adminMovieRecordingPath => 'Camiño de gravación de películas';

  @override
  String get adminGuideDaysAuto => 'Automático';

  @override
  String get adminRecordingPostProcessor =>
      'Camiño da aplicación de posprocesamento';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumentos do posprocesador';

  @override
  String get adminSaveRecordingNfo => 'Gardar os metadatos NFO das gravacións';

  @override
  String get adminSaveRecordingImages => 'Gardar as imaxes das gravacións';

  @override
  String get adminLiveTvSectionPaths => 'Camiños de gravación';

  @override
  String get adminLiveTvSectionPostProcessing => 'Posprocesamento';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Produciuse un erro ao gardar a configuración: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Produciuse un erro ao cargar a administración de TV en directo';

  @override
  String get adminTunerDevices => 'Dispositivos sintonizadores';

  @override
  String get adminNoTunerHosts => 'Non se configuraron hosts de sintonizador';

  @override
  String get adminGuideProviders => 'Provedores de guías';

  @override
  String get adminGuideRefreshStarted =>
      'Comezou a actualización dos datos da guía';

  @override
  String get adminGuideRefreshUnavailable =>
      'A tarefa de actualización da guía non está dispoñible neste servidor.';

  @override
  String get adminNoListingProviders =>
      'Non se configuraron provedores de listas';

  @override
  String get adminSettingsSaved => 'Configuración gardada';

  @override
  String get adminBackupsNotAvailable =>
      'As copias de seguranza non están dispoñibles nesta compilación do servidor.';

  @override
  String get adminRestoreWarning1 =>
      'A restauración substituirá TODOS os datos actuais do servidor polos datos de copia de seguranza.';

  @override
  String get adminRestoreWarning2 =>
      'Sobrescribiranse a configuración actual do servidor, os usuarios e os datos da biblioteca.';

  @override
  String get adminRestoreWarning3 =>
      'O servidor reiniciarase despois da restauración.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restaurar agora a copia de seguranza $name?';
  }

  @override
  String get adminBackupsTitle => 'Copias de seguridade';

  @override
  String get adminUnknownDate => 'Data descoñecida';

  @override
  String get adminUnnamedBackup => 'Copia de seguranza sen nome';

  @override
  String get adminApply => 'Aplicar';

  @override
  String get adminLogsTitle => 'Rexistros do servidor';

  @override
  String get adminLogsNewestFirst => 'O máis novo primeiro';

  @override
  String get adminLogsOldestFirst => 'Primeiro máis vello';

  @override
  String get adminLogsJustNow => 'Xusto agora';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'hai $minutes min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'hai $hours h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'hai $days d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Produciuse un erro ao cargar $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count coincidencias';
  }

  @override
  String get adminLogViewerNoMatches => 'Non hai liñas coincidentes';

  @override
  String get adminMetadataEditorTitle => 'Editor de metadatos';

  @override
  String get adminMetadataIdentify => 'Identificar';

  @override
  String get adminMetadataType => 'Tipo';

  @override
  String get adminMetadataDetails => 'Detalles';

  @override
  String get adminMetadataExternalIds => 'Identificacións externas';

  @override
  String get adminMetadataImages => 'Imaxes';

  @override
  String get adminMetadataFieldTitle => 'Título';

  @override
  String get adminMetadataFieldSortTitle => 'Ordenar título';

  @override
  String get adminMetadataFieldOriginalTitle => 'Título orixinal';

  @override
  String get adminMetadataFieldPremiereDate => 'Data de estrea (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data de finalización (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Ano de produción';

  @override
  String get adminMetadataFieldOfficialRating => 'Clasificación oficial';

  @override
  String get adminMetadataFieldCommunityRating => 'Valoración da comunidade';

  @override
  String get adminMetadataFieldCriticRating => 'Valoración da crítica';

  @override
  String get adminMetadataFieldCustomRating => 'Custom rating';

  @override
  String get adminMetadataFieldTagline => 'Eslogan';

  @override
  String get adminMetadataFieldOverview => 'Visión xeral';

  @override
  String get adminMetadataFieldDisplayOrder => 'Display order';

  @override
  String get adminMetadataDisplayOrderAired => 'Aired';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate => 'Original air date';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolute';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Digital';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Story arc';

  @override
  String get adminMetadataDisplayOrderProduction => 'Production';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternate';

  @override
  String get adminMetadataDisplayOrderRegional => 'Regional';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'Alternate DVD';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Date modified';

  @override
  String get adminMetadataDisplayOrderSortName => 'Sort name';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Release date';

  @override
  String get adminMetadataSettings => 'Metadata Settings';

  @override
  String get adminMetadataDownloadLanguage => 'Preferred download language';

  @override
  String get adminMetadataCountryRegion => 'Country/Region';

  @override
  String get adminMetadataInheritHelp =>
      'Leave this on Default to inherit the setting from a parent item, or from the server default.';

  @override
  String get adminMetadataField3DFormat => '3D format';

  @override
  String get adminMetadataPersonKindActor => 'Actor';

  @override
  String get adminMetadataPersonKindDirector => 'Director';

  @override
  String get adminMetadataPersonKindComposer => 'Composer';

  @override
  String get adminMetadataPersonKindWriter => 'Writer';

  @override
  String get adminMetadataPersonKindGuestStar => 'Guest star';

  @override
  String get adminMetadataPersonKindProducer => 'Producer';

  @override
  String get adminMetadataPersonKindConductor => 'Conductor';

  @override
  String get adminMetadataPersonKindLyricist => 'Lyricist';

  @override
  String get adminMetadataPersonKindArranger => 'Arranger';

  @override
  String get adminMetadataPersonKindEngineer => 'Engineer';

  @override
  String get adminMetadataPersonKindMixer => 'Mixer';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixer';

  @override
  String get adminMetadataPersonKindCreator => 'Creator';

  @override
  String get adminMetadataPersonKindArtist => 'Artist';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Album artist';

  @override
  String get adminMetadataPersonKindAuthor => 'Author';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustrator';

  @override
  String get adminMetadataPersonKindPenciller => 'Penciller';

  @override
  String get adminMetadataPersonKindInker => 'Inker';

  @override
  String get adminMetadataPersonKindColorist => 'Colorist';

  @override
  String get adminMetadataPersonKindLetterer => 'Letterer';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Cover artist';

  @override
  String get adminMetadataPersonKindEditor => 'Editor';

  @override
  String get adminMetadataPersonKindTranslator => 'Translator';

  @override
  String get adminMetadataPersonKindNarrator => 'Narrator';

  @override
  String get adminMetadataAirDays => 'Air days';

  @override
  String get adminMetadataLockItem =>
      'Lock this item to prevent future metadata changes';

  @override
  String get adminMetadataEnabledFields => 'Enabled Fields';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Uncheck a field to lock it and prevent its data from being changed.';

  @override
  String get adminMetadataLockFieldName => 'Name';

  @override
  String get adminMetadataLockFieldOverview => 'Overview';

  @override
  String get adminMetadataLockFieldGenres => 'Genres';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Parental rating';

  @override
  String get adminMetadataLockFieldCast => 'People';

  @override
  String get adminMetadataLockFieldProductionLocations =>
      'Production locations';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Birth location';

  @override
  String get adminMetadataLockFieldRuntime => 'Runtime';

  @override
  String get adminMetadataLockFieldStudios => 'Studios';

  @override
  String get adminMetadataLockFieldTags => 'Tags';

  @override
  String get adminMetadataGenres => 'Xéneros';

  @override
  String get adminMetadataTags => 'Etiquetas';

  @override
  String get adminMetadataStudios => 'Estudios';

  @override
  String get adminMetadataPeople => 'Persoas';

  @override
  String get adminMetadataAddGenre => 'Engadir xénero';

  @override
  String get adminMetadataAddTag => 'Engadir etiqueta';

  @override
  String get adminMetadataAddStudio => 'Engadir estudio';

  @override
  String get adminMetadataAddPerson => 'Engadir persoa';

  @override
  String get adminMetadataEditPerson => 'Editar persoa';

  @override
  String get adminMetadataRole => 'Papel';

  @override
  String get adminMetadataImagePrimary => 'Primaria';

  @override
  String get adminMetadataImageBackdrop => 'Fondo';

  @override
  String get adminMetadataImageLogo => 'Logotipo';

  @override
  String get adminMetadataImageBanner => 'Bandeira';

  @override
  String get adminMetadataImageThumb => 'Polgar';

  @override
  String get adminMetadataProvider => 'Provedor';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'Actualizouse a imaxe $imageType';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Cargouse a imaxe $imageType';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Eliminouse a imaxe $imageType';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Produciuse un erro ao descargar a imaxe: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Produciuse un erro ao ler a imaxe seleccionada';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Produciuse un erro ao cargar a imaxe: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Eliminar a imaxe $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Isto elimina a imaxe actual do elemento.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Produciuse un erro ao eliminar a imaxe: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Escoller a imaxe $imageType';
  }

  @override
  String get adminMetadataUpload => 'Cargar';

  @override
  String get adminMetadataUpdate => 'Actualizar';

  @override
  String get adminMetadataRemoteImage => 'Imaxe remota';

  @override
  String get adminPluginsInstalled => 'Instalado';

  @override
  String get adminPluginsCatalog => 'Catálogo';

  @override
  String get adminPluginsActive => 'Activo';

  @override
  String get adminPluginsRestart => 'Reiniciar';

  @override
  String get adminPluginsRestartRequired => 'Restart required';

  @override
  String get adminPluginsNoSearchResults =>
      'Ningún complemento coincide coa túa busca';

  @override
  String get adminPluginsNoneInstalled => 'Non hai complementos instalados';

  @override
  String get adminPluginsNoneActive => 'No active plugins';

  @override
  String get adminPluginsNoneRequireRestart =>
      'No plugins require a server restart';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Actualización dispoñible: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Actualización dispoñible';

  @override
  String get adminPluginsPendingRemoval =>
      'Pendente de eliminación despois do reinicio';

  @override
  String get adminPluginsChangesPending => 'Cambios pendentes de reiniciar';

  @override
  String get adminPluginsEnable => 'Activar';

  @override
  String get adminPluginsDisable => 'Desactivar';

  @override
  String get adminPluginsInstallUpdate => 'Instalar actualización';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instalar a actualización (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ningún paquete coincide coa túa busca';

  @override
  String get adminPluginsCatalogEmpty => 'Non hai paquetes dispoñibles';

  @override
  String adminPluginsInstalling(String name) {
    return 'Estase instalando \"$name\"...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integración experimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'A integración da configuración do complemento aínda é experimental. É posible que algúns campos ou deseños aínda non se mostren correctamente.';

  @override
  String get adminPluginDetailToggle404 =>
      'Produciuse un erro ao alternar o complemento. O servidor non puido atopar esta versión do complemento. Proba a actualizar os complementos e despois téntao de novo.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Produciuse un erro ao alternar o complemento. Consulte os rexistros do servidor para obter máis detalles.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return 'Configuración de $name';
  }

  @override
  String get adminPluginDetailDetails => 'Detalles';

  @override
  String get adminPluginDetailDeveloper => 'Desenvolvedor';

  @override
  String get adminPluginDetailRepository => 'Repositorio';

  @override
  String get adminPluginDetailBundled => 'Empaquetado';

  @override
  String get adminPluginDetailEnablePlugin => 'Activar o complemento';

  @override
  String get adminPluginDetailRestartRequired =>
      'É necesario reiniciar o servidor para que os cambios teñan efecto.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Este complemento eliminarase despois de reiniciar o servidor.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Este complemento non funcionou correctamente e é posible que non funcione correctamente.';

  @override
  String get adminPluginDetailNotSupported =>
      'Este complemento non é compatible coa versión actual do servidor.';

  @override
  String get adminPluginDetailSuperseded =>
      'Este complemento foi substituído por unha versión máis recente.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Produciuse un erro ao cargar os repositorios: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Eliminar repositorio';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Seguro que queres quitar \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Retirar';

  @override
  String adminReposSaveFailed(String error) {
    return 'Produciuse un erro ao gardar os repositorios: $error';
  }

  @override
  String get adminReposEmpty => 'Non hai repositorios configurados';

  @override
  String get adminReposEmptySubtitle =>
      'Engade un repositorio para buscar complementos dispoñibles';

  @override
  String get adminReposUnnamed => '(sen nome)';

  @override
  String get adminReposEditTitle => 'Editar repositorio';

  @override
  String get adminReposAddTitle => 'Engadir repositorio';

  @override
  String get adminReposUrl => 'URL do repositorio';

  @override
  String get adminReposNameHint => 'p.ex. Establo Jellyfin';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL non válido';

  @override
  String get adminGeneralSettingsTitle => 'Configuración xeral';

  @override
  String get adminGeneralMetadataLanguage => 'Idioma de metadatos preferido';

  @override
  String get adminGeneralMetadataLanguageHint => 'p.ex. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'País de metadatos preferido';

  @override
  String get adminGeneralMetadataCountryHint => 'p.ex. EU, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Simultánea de exploración da biblioteca';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Límite de codificación de imaxes paralelas';

  @override
  String get adminUnknownError => 'Erro descoñecido';

  @override
  String get adminBrowse => 'Explorar';

  @override
  String get adminCloseBrowser => 'Pechar o navegador';

  @override
  String get adminNetworkingTitle => 'Rede';

  @override
  String get adminNetworkingRestartWarning =>
      'Os cambios na configuración de rede poden requirir un reinicio do servidor.';

  @override
  String get adminNetworkingEnableHttps => 'Activa HTTPS';

  @override
  String get adminNetworkingAddressHint => 'p.ex. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxies coñecidos';

  @override
  String get adminNetworkingProxyHint => 'p.ex. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista branca';

  @override
  String get adminNetworkingBlacklist => 'Lista negra';

  @override
  String get adminNetworkingAddEntry => 'Engadir entrada';

  @override
  String get adminBrandingTitle => 'Marca';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Exención de responsabilidade de inicio de sesión';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML que aparece debaixo do formulario de inicio de sesión';

  @override
  String get adminBrandingCustomCss => 'CSS personalizado';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizado aplicado á interface web';

  @override
  String get adminBrandingEnableSplash => 'Activar a pantalla de inicio';

  @override
  String get adminBrandingSplashUpload => 'Cargar unha imaxe';

  @override
  String get adminBrandingSplashUploaded => 'Actualizouse a pantalla de inicio';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Produciuse un erro ao cargar a pantalla de inicio';

  @override
  String get adminBrandingSplashDeleted => 'Eliminouse a pantalla de inicio';

  @override
  String get adminBrandingNoSplash =>
      'Non hai ningunha pantalla de inicio personalizada';

  @override
  String get adminPlaybackHwAccel => 'Aceleración de hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Aceleración de hardware';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Activa a codificación de hardware';

  @override
  String get adminPlaybackQsvDevice => 'Dispositivo QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Activar o decodificador NVDEC mellorado';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferir o decodificador por hardware nativo do sistema';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Decodificación HEVC de 10 bits';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Decodificación VP9 de 10 bits';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Decodificación HEVC RExt de 8/10 bits';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Decodificación HEVC RExt de 12 bits';

  @override
  String get adminPlaybackHwEncodingSection => 'Codificación por hardware';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Permitir a codificación HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Permitir a codificación AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Activar o codificador H.264 de baixo consumo de Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Activar o codificador HEVC de baixo consumo de Intel';

  @override
  String get adminPlaybackToneMapping => 'Mapeamento de tons';

  @override
  String get adminPlaybackEnableTonemapping => 'Activar o mapeamento de tons';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Activar o mapeamento de tons VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Activar o mapeamento de tons de VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Algoritmo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingMode => 'Modo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingRange => 'Rango de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Desaturación do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingPeak => 'Pico do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingParam => 'Parámetro do mapeamento de tons';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Brillo do mapeamento de tons VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Contraste do mapeamento de tons VPP';

  @override
  String get adminPlaybackEncoderPreset => 'Predefinición do codificador';

  @override
  String get adminPlaybackH264Crf => 'CRF de codificación H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF de codificación H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Método de desentrelazado';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Duplicar a velocidade de fotogramas ao desentrelazar';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr =>
      'Activar a codificación de audio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Amplificación do downmix de audio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritmo de downmix a estéreo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Tamaño máximo da cola de multiplexación';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Codificación';

  @override
  String get adminPlaybackEncodingThreads => 'Codificación de fíos';

  @override
  String get adminPlaybackFallbackFont => 'Activa o tipo de letra alternativo';

  @override
  String get adminPlaybackFallbackFontPath => 'Ruta de letra alternativa';

  @override
  String get adminPlaybackStreaming => 'Transmisión en directo';

  @override
  String get adminResumeVideo => 'Vídeo';

  @override
  String get adminResumeAudiobooks => 'Audiolibros';

  @override
  String get adminStreamingBitrateLimit =>
      'Límite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Deixa baleiro ou 0 para ilimitado';

  @override
  String get adminTrickplayHwAccel => 'Activa a aceleración de hardware';

  @override
  String get adminTrickplayHwEncoding => 'Activa a codificación de hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Activa a extracción só de fotogramas clave';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Máis rápido pero con menor precisión';

  @override
  String get adminTrickplayNonBlocking => 'Sen bloqueo';

  @override
  String get adminTrickplayBlocking => 'Bloqueo';

  @override
  String get adminTrickplayPriorityHigh => 'Alto';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Por riba do normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Por debaixo do normal';

  @override
  String get adminTrickplayPriorityIdle => 'Inactivo';

  @override
  String get adminTrickplayImageSettings => 'Configuración da imaxe';

  @override
  String get adminTrickplayInterval => 'Intervalo (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Cantas veces capturar fotogramas';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Ancho de píxeles separados por comas (por exemplo, 320)';

  @override
  String get adminTrickplayQuality => 'Calidade';

  @override
  String get adminTrickplayQScale => 'Escala de calidade';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valores máis baixos = mellor calidade, ficheiros máis grandes';

  @override
  String get adminTrickplayJpegQuality => 'Calidade JPEG';

  @override
  String get adminTrickplayProcessing => 'Procesamento';

  @override
  String get adminTasksEmpty => 'Non se atoparon tarefas programadas';

  @override
  String get adminTasksNoFilterMatch =>
      'Ningunha tarefa coincide co filtro actual';

  @override
  String get adminTaskCancelling => 'Cancelando...';

  @override
  String get adminTaskRunning => 'Correndo...';

  @override
  String get adminTaskNeverRun => 'Nunca corras';

  @override
  String get adminTaskStop => 'Deter';

  @override
  String get adminRunningTasks => 'Tarefas en execución';

  @override
  String get adminTaskRun => 'Corre';

  @override
  String get adminTaskDetailLastExecution => 'Última Execución';

  @override
  String get adminTaskDetailStarted => 'Comezou';

  @override
  String get adminTaskDetailEnded => 'Rematou';

  @override
  String get adminTaskDetailDuration => 'Duración';

  @override
  String get adminTaskDetailErrorLabel => 'Erro:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Diariamente ás $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Cada $day ás $time';
  }

  @override
  String get adminTaskTriggerStartup => 'No inicio da aplicación';

  @override
  String get adminTaskTriggerTypeDaily => 'Diariamente';

  @override
  String get adminTaskTriggerTypeWeekly => 'Semanalmente';

  @override
  String get adminTaskTriggerTypeInterval => 'Nun intervalo';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalo';

  @override
  String get adminTaskTriggerEveryHour => 'Cada hora';

  @override
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count horas',
      one: '1 hora',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Tempo';

  @override
  String get adminActivityJustNow => 'Xusto agora';

  @override
  String get adminActivityLastHour => 'Última hora';

  @override
  String get adminActivityToday => 'Hoxe';

  @override
  String get adminActivityYesterday => 'Onte';

  @override
  String get adminActivityOlder => 'Máis vello';

  @override
  String adminActivityDaysAgo(int days) {
    return 'hai $days d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'hai $hours h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'hai $minutes min';
  }

  @override
  String get adminActivityNow => 'agora';

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
    return '$days d';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Configura a xeración de imaxes de Trickplay para as miniaturas de vista previa ao buscar.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porto HTTPS público';

  @override
  String get adminNetworkingBaseUrl => 'URL base';

  @override
  String get adminNetworkingBaseUrlHint => 'p.ex. /jellyfin';

  @override
  String get adminNetworkingPublicHttpPort => 'Porto HTTP público';

  @override
  String get adminNetworkingRequireHttps => 'Esixir HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirixe todas as solicitudes remotas a HTTPS. Non ten efecto se o servidor non ten un certificado válido.';

  @override
  String get adminNetworkingCertPassword => 'Contrasinal do certificado';

  @override
  String get adminNetworkingEnableIpv4 => 'Activar IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Activar IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Redes LAN';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtro IP remoto';

  @override
  String get adminPlaybackVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automático';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Ruta temporal de transcodificación';

  @override
  String get adminPlaybackSegmentDeletion =>
      'Permitir a eliminación de segmentos';

  @override
  String get adminPlaybackSegmentKeep => 'Mantemento de segmentos (segundos)';

  @override
  String get adminPlaybackThrottleBuffering => 'Buffer do acelerador';

  @override
  String get adminPlaybackThrottleDelay => 'Atraso de limitación (segundos)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Permitir a extracción de subtítulos sobre a marcha';

  @override
  String get adminResumeMinPct => 'Porcentaxe mínima de currículo';

  @override
  String get adminResumeMinPctSubtitle =>
      'O contido debe reproducirse por encima desta porcentaxe para gardar o progreso';

  @override
  String get adminResumeMaxPct => 'Porcentaxe máxima de currículo';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Considérase que o contido se reproduciu completamente despois desta porcentaxe';

  @override
  String get adminResumeMinDuration =>
      'Duración mínima do currículo (segundos)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Os elementos máis curtos que este non se poden retomar';

  @override
  String get adminTrickplayScanBehavior => 'Comportamento da exploración';

  @override
  String get adminTrickplayProcessPriority => 'Prioridade do proceso';

  @override
  String get adminTrickplayTileWidth => 'Ancho da tella';

  @override
  String get adminTrickplayTileHeight => 'Altura da tella';

  @override
  String get adminTrickplayProcessThreads => 'Procesar fíos';

  @override
  String get adminTrickplayWidthResolutions => 'Resolucións de ancho';

  @override
  String get adminMetadataDefault => 'Por defecto';

  @override
  String get adminMetadataContentTypeUpdated => 'Tipo de contido actualizado';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Produciuse un erro ao actualizar o tipo de contido: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Limiar de resposta lenta (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Activar os avisos de resposta lenta';

  @override
  String get adminGeneralQuickConnect => 'Activar Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Servidor';

  @override
  String get adminGeneralSectionMetadata => 'Metadatos';

  @override
  String get adminGeneralSectionPaths => 'Camiños';

  @override
  String get adminGeneralSectionPerformance => 'Rendemento';

  @override
  String get adminGeneralCachePath => 'Ruta da caché';

  @override
  String get adminGeneralMetadataPath => 'Camiño dos metadatos';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminGeneralDisplayLanguage => 'Idioma de visualización preferido';

  @override
  String get adminSettingsLoadFailed =>
      'Produciuse un erro ao cargar a configuración';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Produciuse un erro ao actualizar as asignacións: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Límite de tempo: $duration';
  }

  @override
  String get folders => 'Cartafoles';

  @override
  String get libraries => 'Bibliotecas';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay desactivado';

  @override
  String get syncPlayDisabledMessage =>
      'Activa SyncPlay en Configuración para usar a reprodución sincronizada.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Servidor non compatible';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay require un servidor Jellyfin. O servidor actual non o admite.';

  @override
  String get syncPlayGroupFallbackName => 'Grupo SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Grupo SyncPlay';

  @override
  String syncPlayParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# participantes',
      one: '# participante',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignora esperar';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Non manteñas o grupo mentres este dispositivo se almacena no búfer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continúa localmente sen esperar membros lentos';

  @override
  String get syncPlayRepeat => 'Repetir';

  @override
  String get syncPlayRepeatOne => 'Un';

  @override
  String get syncPlayShuffleModeShuffled => 'Barallado';

  @override
  String get syncPlayShuffleModeSorted => 'Ordenado';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronizar a cola de reprodución actual';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Substitúe a cola do grupo polo que se reproduce localmente';

  @override
  String get syncPlayLeaveGroup => 'Deixa o grupo';

  @override
  String get syncPlayGroupQueue => 'Fila de grupo';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Elemento $index';
  }

  @override
  String get syncPlayPlayNow => 'Xoga agora';

  @override
  String get syncPlayCreateNewGroup => 'Crear un novo grupo';

  @override
  String get syncPlayGroupName => 'Nome do grupo';

  @override
  String get syncPlayDefaultGroupName => 'O meu grupo SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Crear grupo';

  @override
  String get syncPlayAvailableGroups => 'Grupos dispoñibles';

  @override
  String get syncPlayNoGroupsAvailable => 'Non hai grupos dispoñibles';

  @override
  String get syncPlayJoinGroupQuestion => 'Queres unirte ao grupo de SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Ao unirte a un grupo de SyncPlay pode substituír a túa cola de reprodución actual. Queres continuar?';

  @override
  String get syncPlayJoin => 'Únete';

  @override
  String get syncPlayStateIdle => 'Inactivo';

  @override
  String get syncPlayStateWaiting => 'Agardando';

  @override
  String get syncPlayStatePaused => 'En pausa';

  @override
  String get syncPlayStatePlaying => 'Xogando';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName uniuse ao grupo de SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName saíu do grupo de SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Acceso a SyncPlay denegado';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Non tes acceso a un ou varios elementos deste grupo de SyncPlay. Pídalle ao propietario do grupo que verifique os permisos da biblioteca ou que elixa unha cola diferente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sincronizando a reprodución con $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'A busca por voz non está dispoñible.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Produciuse un erro na reprodución directa de Dolby Vision';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Non se puido iniciar a reprodución directa para esta emisión de Dolby Vision. Volver tentar usar a transcodificación do servidor?';

  @override
  String get retryWithTranscode => 'Volve tentar coa transcodificación';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision non é compatible';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Este dispositivo non pode decodificar directamente o contido Dolby Vision. Use HDR10 alternativo ou solicite a transcodificación do servidor.';

  @override
  String get rememberMyChoice => 'Lembra a miña elección';

  @override
  String get playHdr10Fallback => 'Reproducir HDR10 alternativa';

  @override
  String get requestTranscode => 'Solicitar transcodificación';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# filas descubertas',
      one: '# fila descuberta',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Ver Todo';

  @override
  String get noItems => 'Non hai elementos';

  @override
  String get switchUser => 'Cambiar usuario';

  @override
  String get remoteControl => 'Control remoto';

  @override
  String get mediaBarLoading => 'Cargando barra multimedia...';

  @override
  String get mediaBarError => 'Non se puido cargar a barra multimedia';

  @override
  String get offlineServerUnavailable =>
      'Conectado a Internet, pero o servidor actual non está dispoñible.';

  @override
  String get offlineNoInternet =>
      'Estás sen conexión. Só está dispoñible o contido descargado.';

  @override
  String get offlineFileNotAvailable => 'Ficheiro non dispoñible';

  @override
  String get offlineSwitchServer => 'Cambiar servidor';

  @override
  String get offlineSavedMedia => 'Medios gardados';

  @override
  String get offlineBannerTitle => 'Non tes conexión';

  @override
  String get offlineBannerSubtitle => 'Móstranse as túas descargas';

  @override
  String get serverUnreachableBannerTitle =>
      'Non se pode conectar co teu servidor';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Reproducindo desde as descargas ata que volva';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Reprodución remota';

  @override
  String castControlFailed(String error) {
    return 'Fallou o control de Cast: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Controis de $kind';
  }

  @override
  String get castDeviceVolume => 'Volume do dispositivo';

  @override
  String get castVolumeUnavailable => 'Non dispoñible';

  @override
  String castStopKind(String kind) {
    return 'Deter $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Subtítulos';

  @override
  String get pinConfirmTitle => 'Confirmar o PIN';

  @override
  String get pinSetTitle => 'Establecer PIN';

  @override
  String get pinEnterTitle => 'Introduce o PIN';

  @override
  String get pinReenterToConfirm => 'Volve introducir o teu PIN para confirmar';

  @override
  String pinEnterNDigit(int length) {
    return 'Introduce un PIN de $length díxitos';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Introduce o teu PIN de $length díxitos';
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
  String get pinIncorrect => 'PIN incorrecto';

  @override
  String pinTryAgainIn(String wait) {
    return 'Too many attempts. Try again in $wait.';
  }

  @override
  String get pinMismatch => 'Os PIN non coinciden';

  @override
  String get pinForgot => 'Esqueciches o PIN?';

  @override
  String get pinClear => 'Limpar';

  @override
  String get pinBackspace => 'Retroceso';

  @override
  String get quickConnectAuthorized =>
      'Solicitude de Quick Connect autorizada.';

  @override
  String get quickConnectInvalidOrExpired =>
      'O código de Quick Connect non é válido ou caducou.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect non é compatible neste servidor.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Produciuse un erro ao autorizar o código de Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect está desactivado neste servidor.';

  @override
  String get quickConnectForbidden =>
      'A túa conta non pode autorizar esta solicitude de Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Non se atopou o código de Quick Connect. Proba cun novo código.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Fallou Quick Connect: $message';
  }

  @override
  String get quickConnectEnterCode => 'Introduce o código';

  @override
  String get quickConnectAuthorize => 'Autorizar';

  @override
  String remoteCommandFailed(String error) {
    return 'Fallou o comando: $error';
  }

  @override
  String get remoteControlTitle => 'Control remoto';

  @override
  String get remoteFailedToLoadSessions =>
      'Produciuse un erro ao cargar as sesións';

  @override
  String get remoteNoSessions => 'Sen sesións controlables';

  @override
  String get remoteStartPlayback => 'Inicia a reprodución noutro dispositivo';

  @override
  String get unknownUser => 'Descoñecido';

  @override
  String get unknownItem => 'Descoñecido';

  @override
  String get remoteNothingPlaying => 'Non se xoga nada nesta sesión';

  @override
  String get castingStarted => 'A emisión comezou no dispositivo seleccionado';

  @override
  String castingFailed(String error) {
    return 'Produciuse un erro ao iniciar o Cast: $error';
  }

  @override
  String get noRemoteDevices =>
      'Non hai dispositivos de reprodución remota dispoñibles.';

  @override
  String get noRemoteDevicesIos =>
      'Non hai dispositivos de reprodución remota dispoñibles.\n\nEn iOS, os obxectivos de AirPlay poden non estar dispoñibles no simulador.';

  @override
  String get trackActionPlayNext => 'Xoga a seguinte';

  @override
  String get trackActionViewDetails => 'View Details';

  @override
  String get trackActionAddToQueue => 'Engadir á cola';

  @override
  String get trackActionAddToPlaylist => 'Engadir á lista de reprodución';

  @override
  String get trackActionCancelDownload => 'Cancelar a descarga';

  @override
  String get trackActionDeleteFromPlaylist =>
      'Eliminar da lista de reprodución';

  @override
  String get trackActionMoveUp => 'Mover arriba';

  @override
  String get trackActionMoveDown => 'Mover abaixo';

  @override
  String get trackActionRemoveFromFavorites => 'Eliminar dos favoritos';

  @override
  String get trackActionAddToFavorites => 'Engadir a Favoritos';

  @override
  String get trackActionGoToAlbum => 'Ir ao álbum';

  @override
  String get trackActionGoToArtist => 'Ir a Artista';

  @override
  String trackActionDownloading(String name) {
    return 'Descargando $name...';
  }

  @override
  String get trackActionDeletedFile => 'Ficheiro descargado eliminado';

  @override
  String get trackActionDeleteFileFailed =>
      'Non se puido eliminar o ficheiro descargado';

  @override
  String get shuffleBy => 'Barallar por';

  @override
  String get shuffleSelectLibrary => 'Seleccione Biblioteca';

  @override
  String get shuffleSelectGenre => 'Seleccione Xénero';

  @override
  String get shuffleLibrary => 'Biblioteca';

  @override
  String get shuffleGenre => 'Xénero';

  @override
  String get shuffleNoLibraries =>
      'Non hai bibliotecas compatibles dispoñibles.';

  @override
  String get shuffleNoGenres =>
      'Non se atopou ningún xénero para este modo aleatorio.';

  @override
  String get posterDisplayTitle => 'Mostrar';

  @override
  String get posterImageType => 'Tipo de imaxe';

  @override
  String get imageTypePoster => 'Cartel';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Bandeira';

  @override
  String get playlistAddFailed =>
      'Produciuse un erro ao engadir á lista de reprodución';

  @override
  String get playlistCreateFailed =>
      'Produciuse un erro ao crear a lista de reprodución';

  @override
  String get playlistNew => 'Nova lista de reprodución';

  @override
  String get playlistCreate => 'Crear';

  @override
  String get playlistCreateNew => 'Crear unha nova lista de reprodución';

  @override
  String get playlistNoneFound => 'Non se atoparon listas de reprodución';

  @override
  String get addToPlaylist => 'Engadir á lista de reprodución';

  @override
  String get lyricsNotAvailable => 'Non hai letras dispoñibles';

  @override
  String get upNext => 'A continuación';

  @override
  String get playNext => 'Xoga a seguinte';

  @override
  String get stillWatchingContent =>
      'Detívose a reprodución. Aínda estás vendo?';

  @override
  String get stillWatchingStop => 'Deter';

  @override
  String get stillWatchingContinue => 'Continuar';

  @override
  String skipSegment(String segment) {
    return 'Omitir $segment';
  }

  @override
  String get liveTv => 'TV en directo';

  @override
  String get continueWatchingAndNextUp => 'Seguir vendo e seguinte';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Descargando $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Descargando $fileName';
  }

  @override
  String get nextEpisode => 'Próximo Episodio';

  @override
  String get moreFromThisSeason => 'Máis desta tempada';

  @override
  String get playerTooltipPlaybackSpeed => 'Velocidade de reprodución';

  @override
  String get playerTooltipCastControls => 'Controis de emisión';

  @override
  String get playerTooltipPlaybackQuality => 'Taxa de bits';

  @override
  String get playerTooltipEnterFullscreen => 'Entra en pantalla completa';

  @override
  String get playerTooltipExitFullscreen => 'Saír da pantalla completa';

  @override
  String get playerTooltipFloatOnTop => 'Flota enriba';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Desactivar flotar na parte superior';

  @override
  String get playerTooltipLockLandscape => 'Bloquear paisaxe';

  @override
  String get playerTooltipUnlockOrientation => 'Permitir a rotación';

  @override
  String get playerTooltipPrevious => 'Anterior';

  @override
  String get playerTooltipSeekBack => 'Busca atrás';

  @override
  String get playerTooltipSeekForward => 'Busca adiante';

  @override
  String get playerTooltipMinimize => 'Minimize player';

  @override
  String get miniPlayerOpenPlayer => 'Open player';

  @override
  String get contextMenuMarkWatched => 'Marcar como visto';

  @override
  String get contextMenuMarkUnwatched => 'Marcar como non vixiado';

  @override
  String get contextMenuAddToFavorites => 'Engadir a Favoritos';

  @override
  String get contextMenuRemoveFromFavorites => 'Eliminar dos favoritos';

  @override
  String get contextMenuGoToSeries => 'Ir á Serie';

  @override
  String get contextMenuHideFromContinueWatching => 'Ocultar de Seguir vendo';

  @override
  String get contextMenuHideFromNextUp => 'Ocultar de A continuación';

  @override
  String get contextMenuAddToCollection => 'Engadir a unha colección';

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
      'Acceda ao panel de administración do servidor';

  @override
  String get settingsDynamicContent => 'Contido dinámico';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra multimedia e superposicións visuais';

  @override
  String get settingsAboutSubtitle =>
      'Versión da aplicación, información legal e créditos';

  @override
  String get settingsSortServersBy => 'Ordenar servidores por';

  @override
  String get settingsLastUsed => 'Último uso';

  @override
  String get settingsAlphabetical => 'Alfabético';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Permitir os certificados autoasinados';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Confía nos servidores que usan certificados TLS autoasinados ou dunha CA privada. Actívao só para os servidores que controles. Isto desactiva a validación de certificados en todas as conexións.';

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
  String get settingsHomePage => 'Páxina de inicio';

  @override
  String get settingsTwentyFourHourClock => 'Reloxo de 24 horas';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Usa o formato de 24 horas onde se mostre o reloxo';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Mostra o botón aleatorio na barra de navegación';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Mostra o botón de xéneros na barra de navegación';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Mostra o botón de favoritos na barra de navegación';

  @override
  String get settingsShowLiveTvButtonInNavigation =>
      'Show the Live TV button in the navigation bar when the server has a Live TV library';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostra o botón de bibliotecas na barra de navegación';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Mostrar o botón de Seerr na barra de navegación';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Mostrar sempre as etiquetas de texto na barra de navegación superior';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Alterna a visibilidade da páxina de inicio por biblioteca. Reinicia Moonfin para que os cambios teñan efecto.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barra multimedia e vistas previas locais';

  @override
  String get settingsVisualOverlays => 'Superposicións visuais';

  @override
  String get settingsSeasonalSurprise => 'Sorpresa estacional';

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
  String emulatorCoreResetSettings(String system) {
    return 'Reset $system settings to defaults';
  }

  @override
  String get emulatorCoreSettingsReset => 'Settings reset to defaults.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Could not reset settings. Check your connection and try again.';

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
  String get settingsHigh => 'Alto';

  @override
  String get settingsLow => 'Baixo';

  @override
  String get settingsCustomPath => 'Camiño personalizado';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Introduza o camiño do cartafol de descarga';

  @override
  String get settingsConcurrentDownloads => 'Descargas simultáneas';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Número máximo de elementos para descargar á vez.';

  @override
  String get settingsAppInfo => 'INFORMACIÓN DA APLICACIÓN';

  @override
  String get settingsReportAnIssue => 'Informar dun problema';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Abre o rastreador de problemas en GitHub';

  @override
  String get settingsJoinDiscord => 'Únete a Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Chatea coa comunidade';

  @override
  String get settingsJoinTheDiscord => 'Únete ao Discord';

  @override
  String get settingsSupportMoonfin => 'Apoio Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Invita a un café ao desenvolvedor';

  @override
  String get settingsLegal => 'LEGAL';

  @override
  String get settingsLicenses => 'Licenzas';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avisos de licenza de código aberto';

  @override
  String get settingsPrivacyPolicy => 'Política de privacidade';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Como manexa Moonfin os teus datos';

  @override
  String get settingsCheckForUpdates => 'Consulta as actualizacións';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Consulta a última versión de Moonfin';

  @override
  String get settingsBoth => 'Ambos';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filtro de tipo de contido aleatorio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Pistas de audio, procesamento e opcións de paso';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Reproducción e secuenciación automatizadas';

  @override
  String get settingsSyncplaySubtitle =>
      'Lóxica de sincronización para sesións de grupo';

  @override
  String get settingsSkipIntrosAndOutros => 'Omitir intros e outros?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return '$segment Segments';
  }

  @override
  String get settingsMediaSegmentCountdown =>
      'Conta atrás dos segmentos multimedia';

  @override
  String get settingsProgressBar => 'Barra de progreso';

  @override
  String get settingsTimer => 'Temporizador';

  @override
  String get settingsNone => 'Ningún';

  @override
  String get settingsSkipButtonAutoHide => 'Auto Hide Skip Button';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Automatically dismiss the skip intro and outro button after a few seconds.';

  @override
  String get settingsPromptUser => 'Usuario avisado';

  @override
  String get settingsSkip => 'Saltar';

  @override
  String get settingsDoNothing => 'Non facer nada';

  @override
  String get settingsMaxBitrateDescription =>
      'Limita a taxa de bits de transmisión. O contido superior a este limiar transcodificarase para que se axuste.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limita a resolución máxima que solicitará o xogador. O contido de maior resolución transcodificarase cara abaixo.';

  @override
  String get settingsPlayerZoomDescription =>
      'Como se debe escalar o vídeo para que se axuste á pantalla.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Motor de reprodución (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Escolle o motor de reprodución predeterminado nos dispositivos Android TV. Os cambios aplícanse á seguinte sesión de reprodución.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recomendado)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (herdado)';

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
  String get settingsDolbyVisionFallback => 'Dolby Vision Alternativa';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportamento dos títulos Dolby Vision en dispositivos sen decodificación Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Pregunta cada vez';

  @override
  String get settingsPreferHdr10Fallback => 'Prefiro o HDR10 alternativo';

  @override
  String get settingsPreferServerTranscode =>
      'Prefire a transcodificación do servidor';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Perfil 7 Reprodución directa';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controla se os fluxos da capa de mellora do perfil Dolby Vision 7 deben reproducir directamente.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automático (AFTKRT activado)';

  @override
  String get settingsEnabledOnThisDevice => 'Activado neste dispositivo';

  @override
  String get settingsDisabledPreferTranscode =>
      'Desactivado (preferir transcodificación)';

  @override
  String get settingsResumeRewindDescription =>
      'Ao retomar a reprodución (desde Continuar a visualización ou desde a páxina dun elemento multimedia), cantos segundos se deben rebobinar?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Ao retomar a reprodución despois de premer o botón de pausa, cantos segundos se deben rebobinar?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Cantos segundos para retroceder despois de premer o botón de rebobinado.';

  @override
  String get settingsOneSecond => '1 segundo';

  @override
  String get settingsThreeSeconds => '3 segundos';

  @override
  String get settingsFortyFiveSeconds => '45 segundos';

  @override
  String get settingsSixtySeconds => '60 segundos';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Cantos segundos para saltar cara adiante despois de premer o botón de avance rápido.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 ao decodificador externo';

  @override
  String get settingsCinemaMode => 'Modo Cine';

  @override
  String get settingsCinemaModeSubtitle =>
      'Reproduce tráilers/prerolls antes dunha función principal';

  @override
  String get settingsCinemaModeEpisodes => 'Cinema Mode for episodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Also play prerolls before TV episodes';

  @override
  String get settingsNextUpDisplayDescription =>
      'A extensión ampliada mostra unha tarxeta completa con ilustración e descrición do episodio. Minimal mostra unha superposición de conta atrás compacta. Desactivado oculta o aviso por completo.';

  @override
  String get settingsShort => 'Curto';

  @override
  String get settingsLong => 'Longo';

  @override
  String get settingsVeryLong => 'Moi longo';

  @override
  String get settingsVideoStartDelay => 'Retraso de inicio do vídeo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV en directo directo';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Activa a reprodución directa para a TV en directo';

  @override
  String get settingsOpenGroups => 'Grupos Abertos';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Crea, únete ou xestiona grupos de SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay activado';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Activa as funcións de visualización en grupo';

  @override
  String get settingsSyncplayButton => 'Botón SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostra o botón SyncPlay na barra de navegación';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Corrección avanzada';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Activa a lóxica de sincronización detallada';

  @override
  String get settingsSyncplaySyncCorrection => 'Corrección de sincronización';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Axusta automaticamente a reprodución para estar sincronizada';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocidade para sincronizar';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Usa o axuste da velocidade de reprodución para sincronizar';

  @override
  String get settingsSyncplaySkipToSync => 'Saltar a Sincronización';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Usa a busca para sincronizar';

  @override
  String get settingsSyncplayMinimumSpeedDelay =>
      'Retraso de velocidade mínima';

  @override
  String get settingsSyncplayMaximumSpeedDelay =>
      'Retraso de velocidade máxima';

  @override
  String get settingsSyncplaySpeedDuration => 'Duración da velocidade';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Retraso mínimo de salto';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Compensación extra';

  @override
  String get onNow => 'En agora';

  @override
  String get collections => 'Coleccións';

  @override
  String get lastPlayed => 'Última xogada';

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
    return 'Lanzamentos recentes de $libraryName';
  }

  @override
  String get autoplayNextEpisode =>
      'Reproducir automaticamente o seguinte episodio';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Reproduce automaticamente o seguinte episodio cando estea dispoñible.';

  @override
  String get skipSilenceTitle => 'Omitir os silencios';

  @override
  String get skipSilenceSubtitle =>
      'Omite automaticamente os segmentos de audio silenciosos cando o fluxo o admita.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Permitir efectos de audio externos';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permite que as aplicacións de ecualización e efectos (p. ex. Wavelet) se conecten ás sesións de reprodución de Media3.';

  @override
  String get disableTunnelingTitle => 'Desactivar a tunelización';

  @override
  String get disableTunnelingSubtitle =>
      'Forza a reprodución sen tunelización. Útil en dispositivos con descontinuidades de audio/vídeo ao tunelizar.';

  @override
  String get enableTunnelingTitle => 'Activar a tunelización';

  @override
  String get enableTunnelingSubtitle =>
      'Avanzado. Encamiña o audio e o vídeo por unha ruta de hardware acoplada. Está desactivado de forma predeterminada porque provoca cortes de audio/vídeo nalgúns dispositivos.';

  @override
  String get mapDolbyVisionP7Title =>
      'Asignar o perfil 7 de Dolby Vision a HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Reproduce os fluxos do perfil 7 de Dolby Vision como HEVC compatible con HDR10 en dispositivos sen Dolby Vision.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Usar os estilos de subtítulos incrustados';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Aplica as cores, os tipos de letra e a posición incrustados na pista de subtítulos. Desactívao para usar as túas preferencias de estilo.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Usar os tamaños de letra dos subtítulos incrustados';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Aplica as suxestións de tamaño de letra incrustadas na pista de subtítulos. Desactívao para usar o tamaño dos subtítulos das túas preferencias de estilo.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Mostrar os detalles do contido';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Mostra os detalles do elemento seleccionado na parte superior das páxinas de Biblioteca.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Usar subcabeceiras detalladas';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Mostra unha subfila detallada ou mínima nas páxinas de Biblioteca.';

  @override
  String get savedThemesDeleteDialogTitle => 'Eliminar o tema gardado?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Quitar \"$themeName\" da caché deste dispositivo?';
  }

  @override
  String get themeStore => 'Tenda de temas';

  @override
  String get themeStoreSubtitle => 'Explora e garda temas da comunidade';

  @override
  String get themeStoreDescription =>
      'Garda un tema para usalo como os demais temas gardados.';

  @override
  String get themeStoreEmpty => 'Non hai ningún tema dispoñible neste momento.';

  @override
  String get themeStoreLoadFailed =>
      'Non foi posible cargar a Tenda de temas. Comproba a túa conexión e téntao de novo.';

  @override
  String get themeStoreSave => 'Gardar';

  @override
  String get themeStoreSaveAndApply => 'Gardar e aplicar';

  @override
  String get themeStoreSaved => 'Gardado';

  @override
  String get themeStoreInvalidMessage => 'Non foi posible cargar este tema.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Gardouse \"$themeName\".';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Eliminouse \"$themeName\" deste dispositivo.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Non foi posible eliminar \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Temas gardados';

  @override
  String get savedThemesDescription =>
      'Estes son os temas descargados desde o complemento de Moonfin para o servidor actual. Ao eliminalos só se quita esta copia local.';

  @override
  String get savedThemesEmpty =>
      'Non se atopou ningún tema gardado para este servidor.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Activo actualmente';
  }

  @override
  String get savedThemesDeleteTooltip => 'Eliminar o tema gardado';

  @override
  String get savedThemesManageSubtitle =>
      'Xestiona os temas do complemento descargados neste dispositivo';

  @override
  String get themeEditor => 'Editor de temas';

  @override
  String get themeEditorSubtitle =>
      'Abre o Editor de temas de Moonfin no teu navegador';

  @override
  String get homeScreen => 'Pantalla de inicio';

  @override
  String get bottomBar => 'Barra inferior';

  @override
  String get homeRowsStyleClassic => 'Clásico';

  @override
  String get homeRowsStyleModern => 'Moderno';

  @override
  String get homeRowsSection => 'Filas de inicio';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Clásico mantén o tipo de imaxe e a superposición de información por fila. Moderno usa filas de retrato a imaxe de fondo.';

  @override
  String get modernCardsOnMyMediaRow => 'Modern cards on My Media row';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Display customizable posters that expand on focus. Disable to always show landscape thumbnail.';

  @override
  String get sortOrder => 'Sort Order';

  @override
  String get ascending => 'Ascending';

  @override
  String get descending => 'Descending';

  @override
  String get displayFavoritesRows => 'Mostrar as filas de favoritos';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Mostra as filas de películas favoritas, series e outras filas de favoritos nas seccións de inicio.';

  @override
  String get favoritesRowSorting => 'Ordenación das filas de favoritos';

  @override
  String get favoritesRowSortingDescription =>
      'Ordena as filas de favoritos por data de engadido, data de lanzamento, alfabeticamente e máis.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Sort Favorites rows in ascending or descending order.';

  @override
  String get displayCollectionsRows => 'Mostrar as filas de coleccións';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Mostra as filas de coleccións nas seccións de inicio.';

  @override
  String get collectionsRowSorting => 'Ordenación das filas de coleccións';

  @override
  String get collectionsRowSortingDescription =>
      'Ordena as filas de coleccións por data de engadido, data de lanzamento, alfabeticamente e máis.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Sort Collections rows in ascending or descending order.';

  @override
  String get collectionsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayGenresRows => 'Mostrar as filas de xéneros';

  @override
  String get displayGenresRowsSubtitle =>
      'Mostra as filas de xéneros nas seccións de inicio.';

  @override
  String get genresRowSorting => 'Ordenación das filas de xéneros';

  @override
  String get genresRowSortingDescription =>
      'Ordena as filas de xéneros por data de engadido, data de lanzamento, alfabeticamente e máis.';

  @override
  String get genresRowSortOrderDescription =>
      'Sort Genres rows in ascending or descending order.';

  @override
  String get genresRowItems => 'Elementos das filas de xéneros';

  @override
  String get genresRowItemsDescription =>
      'Mostra películas, series ou ambas nas filas de xéneros.';

  @override
  String get displayStudiosRows => 'Display Studio Row';

  @override
  String get displayStudiosRowsSubtitle => 'Show Studio row in Home Sections.';

  @override
  String get studiosRowSorting => 'Studio Row Sorting';

  @override
  String get studiosRowSortingDescription =>
      'Studio row by name, recently added, and more.';

  @override
  String get studiosRowSortOrderDescription =>
      'Choose Ascending or Descending sort order.';

  @override
  String get selectStudiosToInclude => 'Select Studios to Include';

  @override
  String get selectStudiosToIncludeDescription =>
      'Select which studios should be included on the home row.';

  @override
  String get selectAllStudios => 'Select All';

  @override
  String get deselectAllStudios => 'Deselect All';

  @override
  String get tvStudiosFilter => 'TV Studios';

  @override
  String get movieStudiosFilter => 'Movie Studios';

  @override
  String get selectedStudiosFilter => 'Selected Studios';

  @override
  String get unselectedStudiosFilter => 'Unselected Studios';

  @override
  String get filtersHeader => 'Filters';

  @override
  String get showHeader => 'Show';

  @override
  String get displayPlaylistsRows =>
      'Mostrar as filas de listas de reprodución';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Mostra as filas de listas de reprodución nas seccións de inicio.';

  @override
  String get playlistsRowSorting =>
      'Ordenación das filas de listas de reprodución';

  @override
  String get playlistsRowSortingDescription =>
      'Ordena as filas de listas de reprodución por data de engadido, data de lanzamento, alfabeticamente e máis.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Sort Playlist rows in ascending or descending order.';

  @override
  String get playlistsRowShowEpisodes => 'Show Individual Episodes';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Expand TV shows to display each episode separately.';

  @override
  String get displayAudioRows => 'Mostrar as filas de audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Mostra as filas de audio nas seccións de inicio.';

  @override
  String get audioRowsSorting => 'Ordenación das filas de audio';

  @override
  String get audioRowsSortingDescription =>
      'Ordena as filas de audio por data de engadido, data de lanzamento, alfabeticamente e máis.';

  @override
  String get audioRowsSortOrderDescription =>
      'Sort Audio rows in ascending or descending order.';

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
  String get audioPlaylists => 'Listas de reprodución de audio';

  @override
  String get appearance => 'Aparencia';

  @override
  String get layout => 'Disposición';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Teclado';

  @override
  String get navButtons => 'Botóns';

  @override
  String get rendering => 'Renderización';

  @override
  String get mpvConfiguration => 'Configuración de MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Aplicación de reprodutor externo';

  @override
  String get externalPlayerAppDescription =>
      'Define un reprodutor externo para activar a opción de reproducir cunha pulsación longa';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Mostra o selector de aplicacións cando comece a reprodución.';

  @override
  String get loadingInstalledPlayers =>
      'Cargando os reprodutores instalados...';

  @override
  String get connection => 'Conexión';

  @override
  String get locallyDecodedCodecs => 'Locally Decoded Codecs';

  @override
  String get transcodeTargetCodecs => 'Transcode Target Codecs';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Compatible con este dispositivo';

  @override
  String get notSupportedOnThisDevice => 'Non compatible con este dispositivo';

  @override
  String get mediaPlayerBehavior => 'Comportamento do reprodutor multimedia';

  @override
  String get playbackEnhancements => 'Melloras da reprodución';

  @override
  String get alwaysOn => 'Sempre activo.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Substituír Omitir créditos pola vista de A continuación';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Mostra a superposición de A continuación en vez do botón Omitir créditos.';

  @override
  String get playerRouting => 'Encamiñamento do reprodutor';

  @override
  String get preferSoftwareDecoders =>
      'Preferir os decodificadores por software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Usa FFmpeg (audio) e libgav1 (AV1) antes que os decodificadores por hardware. Desactívao se falla o passthrough de audio por HDMI.';

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
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Abre a reprodución de vídeo na aplicación externa seleccionada en Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'Cola automática';

  @override
  String get preferSdhSubtitles => 'Preferir os subtítulos SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioriza as pistas de subtítulos SDH/CC ao seleccionar automaticamente.';

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
  String get webDiagnostics => 'Diagnóstico web';

  @override
  String get webDiagnosticsTitle => 'Diagnóstico web de Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Usa esta páxina para diagnosticar problemas de conectividade do navegador (CORS, contido mixto e configuración de descubrimento).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Detectouse un fallo de contido mixto';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Detectouse un fallo de CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detectou unha páxina HTTPS que tenta chamar a un URL de servidor HTTP. Os navegadores bloquean esta solicitude antes de que chegue ao teu servidor.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detectou un fallo de solicitude a nivel de navegador que adoita deberse á falta de cabeceiras CORS ou de preflight no servidor multimedia.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL de destino: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalle: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Contexto de execución actual';

  @override
  String get webDiagnosticsOrigin => 'Orixe';

  @override
  String get webDiagnosticsScheme => 'Esquema';

  @override
  String get webDiagnosticsPluginMode => 'Modo de complemento';

  @override
  String get webDiagnosticsWebRtcScan => 'Exploración WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL de servidor forzado';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL de servidor predeterminado';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL do proxy de descubrimento';

  @override
  String get notConfigured => 'non configurado';

  @override
  String get webDiagnosticsMixedContent => 'Contido mixto';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Esta páxina cárgase por HTTPS, pero un ou máis URL configurados son HTTP. Os navegadores bloquean que as páxinas HTTPS chamen a API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Solución: serve o teu servidor multimedia ou o punto final do proxy por HTTPS, ou carga Moonfin por HTTP só en redes locais de confianza.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Non se detectou ningunha configuración obvia de contido mixto na configuración de execución actual.';

  @override
  String get webDiagnosticsCorsChecklist => 'Lista de comprobación de CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permite a orixe do navegador en Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Inclúe Authorization, X-Emby-Authorization e X-Emby-Token en Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expón Content-Range e Accept-Ranges para o comportamento de transmisión e busca.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Devolve 204 ás solicitudes de preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemplo de fragmento de cabeceiras (estilo nginx)';

  @override
  String get note => 'Nota';

  @override
  String get webDiagnosticsNonWebNote =>
      'Esta ruta de diagnóstico está pensada para compilacións web. Se ves isto noutra plataforma, é posible que estas comprobacións non se apliquen.';

  @override
  String get backToServerSelect => 'Volver á selección de servidor';

  @override
  String get signOutAllUsers => 'Pechar a sesión de todos os usuarios';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'O permiso do micrófono está denegado permanentemente. Actívao na configuración do sistema.';

  @override
  String get voiceSearchPermissionRequired =>
      'Requírese o permiso do micrófono para a busca por voz.';

  @override
  String get voiceSearchNoMatch => 'Non se entendeu. Téntao de novo.';

  @override
  String get voiceSearchNoSpeechDetected => 'Non se detectou ningunha fala.';

  @override
  String get voiceSearchMicrophoneError => 'Erro do micrófono.';

  @override
  String get voiceSearchNeedsInternet =>
      'A busca por voz precisa conexión a internet.';

  @override
  String get voiceSearchServiceBusy =>
      'O servizo de voz está ocupado. Téntao de novo.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'O permiso do micrófono está denegado permanentemente.';

  @override
  String get microphonePermissionDenied =>
      'O permiso do micrófono está denegado.';

  @override
  String get speechRecognitionUnavailable =>
      'O recoñecemento de voz non está dispoñible neste dispositivo.';

  @override
  String get openIosRoutePicker => 'Abrir o selector de rutas de iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'O selector de rutas de AirPlay non está dispoñible neste dispositivo.';

  @override
  String get videos => 'Vídeos';

  @override
  String get programs => 'Programas';

  @override
  String get songs => 'Cancións';

  @override
  String get photoAlbums => 'Álbums de fotos';

  @override
  String get photos => 'Fotos';

  @override
  String get people => 'Persoas';

  @override
  String get recentlyReleasedEpisodes => 'Episodios lanzados recentemente';

  @override
  String get watchAgain => 'Ver de novo';

  @override
  String get guestAppearances => 'Aparicións como convidado';

  @override
  String get appearancesSeerr => 'Aparicións (Seerr)';

  @override
  String get crewContributionsSeerr => 'Contribucións do equipo (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Ver co grupo';

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
  String get openInBrowser => 'Abrir no navegador';

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
      'O navegador incrustado non está dispoñible nesta plataforma.';

  @override
  String get adminRestartServerConfirmation =>
      'Seguro que queres reiniciar o servidor?';

  @override
  String get adminShutdownServerConfirmation =>
      'Seguro que queres apagar o servidor? Terás que reinicialo manualmente.';

  @override
  String get internal => 'Interno';

  @override
  String get idle => 'Inactivo';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Non se atopou ningún usuario';

  @override
  String get adminNoUsersMatchSearch => 'Ningún usuario coincide coa túa busca';

  @override
  String get adminNoDevicesFound => 'Non se atopou ningún dispositivo';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Ningún dispositivo coincide cos filtros actuais';

  @override
  String get remoteAccess => 'Acceso remoto';

  @override
  String get localOnly => 'Só local';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Produciuse un erro ao cargar a analítica multimedia';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Analítica combinada de todas as bibliotecas multimedia.';

  @override
  String get analyticsTopArtists => 'Artistas principais';

  @override
  String get analyticsTopAuthors => 'Autores principais';

  @override
  String get analyticsTopContributors => 'Colaboradores principais';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bibliotecas',
      one: '1 biblioteca',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Aínda non hai totais de contido indexado para esta selección.';

  @override
  String get analyticsLibraryDetails => 'Detalles da biblioteca';

  @override
  String get analyticsLibraryBreakdown => 'Distribución por biblioteca';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Non hai ningunha biblioteca dispoñible.';

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
  String get adminServerAdministrationTitle => 'Administración do servidor';

  @override
  String get adminServerPathData => 'Datos';

  @override
  String get adminServerPathImageCache => 'Caché de imaxes';

  @override
  String get adminServerPathCache => 'Caché';

  @override
  String get adminServerPathLogs => 'Rexistros';

  @override
  String get adminServerPathMetadata => 'Metadatos';

  @override
  String get adminServerPathTranscode => 'Transcodificación';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Este servidor non devolveu ningún camiño.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% usado';
  }

  @override
  String get userActivity => 'Actividade dos usuarios';

  @override
  String get systemEvents => 'Eventos do sistema';

  @override
  String get needsAttention => 'Precisa atención';

  @override
  String get homeVideos => 'Vídeos caseiros';

  @override
  String get mixedContent => 'Contido mixto';

  @override
  String get homeVideosAndPhotos => 'Vídeos caseiros e fotos';

  @override
  String get mixedMoviesAndShows => 'Películas e series mixtas';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Non se atopou ningunha gravación';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Non se atoparon páxinas de imaxe no arquivo .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Fallou o renderizador incrustado ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Fallou o renderizador de EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Falta o ficheiro local para o lector: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status ao abrir os datos do libro desde $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Non hai ningún punto final de libro lexible dispoñible';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Formato de arquivo de banda deseñada non admitido: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'O complemento de extracción de CBR non está dispoñible nesta plataforma.';

  @override
  String get failedToExtractCbrArchive =>
      'Produciuse un erro ao extraer o arquivo .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'A extracción de CB7 non está dispoñible nesta plataforma.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'O complemento de extracción de CB7 non está dispoñible nesta plataforma.';

  @override
  String get loadingShuffle => 'Cargando a reprodución aleatoria...';

  @override
  String get libraryShuffleLabel => 'ALEATORIO POR BIBLIOTECA';

  @override
  String get randomShuffleLabel => 'ALEATORIO TOTAL';

  @override
  String get genresShuffleLabel => 'ALEATORIO POR XÉNEROS';

  @override
  String get autoHdrSwitching => 'Cambio automático a HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Activa automaticamente o HDR na reprodución de vídeo HDR e restaura o modo de pantalla ao saír.';

  @override
  String get whenFullscreen => 'En pantalla completa';

  @override
  String get changeArtwork => 'Cambiar a ilustración';

  @override
  String get missing => 'Falta';

  @override
  String get clearAllArtworkButton => 'Limpar todas as ilustracións?';

  @override
  String get clearAllArtworkWarning =>
      'Seguro que queres limpar todas as ilustracións descargadas?';

  @override
  String get confirmClear => 'Confirmar a limpeza';

  @override
  String confirmClearMessage(String itemType) {
    return 'Seguro que queres limpar esta imaxe ($itemType)?';
  }

  @override
  String get uploadButton => 'Cargar?';

  @override
  String get resolutionLabel => 'Resolución: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Mostrar só as ilustracións no idioma da interface';

  @override
  String get confirmClearAll => 'Confirmar a limpeza de todo';

  @override
  String get imageUploadSuccess => 'A imaxe cargouse correctamente!';

  @override
  String imageUploadFailed(String error) {
    return 'Produciuse un erro ao cargar a imaxe: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Produciuse un erro ao definir a imaxe: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Produciuse un erro ao eliminar a imaxe: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Produciuse un erro ao limpar todas as ilustracións: $error';
  }

  @override
  String get yes => 'Si';

  @override
  String get posterCategory => 'Cartel';

  @override
  String get backdropsCategory => 'Fondos';

  @override
  String get bannerCategory => 'Báner';

  @override
  String get logoCategory => 'Logotipo';

  @override
  String get thumbnailCategory => 'Miniatura';

  @override
  String get artCategory => 'Arte';

  @override
  String get discArtCategory => 'Arte do disco';

  @override
  String get screenshotCategory => 'Captura de pantalla';

  @override
  String get boxCoverCategory => 'Portada da caixa';

  @override
  String get boxRearCoverCategory => 'Contraportada da caixa';

  @override
  String get menuArtCategory => 'Arte do menú';

  @override
  String get confirmItemPoster => 'cartel';

  @override
  String get confirmItemBackdrop => 'fondo';

  @override
  String get confirmItemBanner => 'báner';

  @override
  String get confirmItemLogo => 'logotipo';

  @override
  String get confirmItemThumbnail => 'miniatura';

  @override
  String get confirmItemArt => 'arte';

  @override
  String get confirmItemDiscArt => 'arte do disco';

  @override
  String get confirmItemScreenshot => 'captura de pantalla';

  @override
  String get confirmItemBoxCover => 'portada da caixa';

  @override
  String get confirmItemBoxRearCover => 'contraportada da caixa';

  @override
  String get confirmItemMenuArt => 'arte do menú';

  @override
  String get resolutionAll => 'Todas';

  @override
  String get resolutionHigh => 'Alta (1080p+)';

  @override
  String get resolutionMedium => 'Media (720p)';

  @override
  String get resolutionLow => 'Baixa (<720p)';

  @override
  String get sources => 'Fontes';

  @override
  String get audiobookChapters => 'Capítulos';

  @override
  String get audiobookBookmarks => 'Marcadores';

  @override
  String get audiobookNotes => 'Notas';

  @override
  String get audiobookQueue => 'Cola';

  @override
  String get audiobookTimeline => 'Cronoloxía';

  @override
  String get audiobookTimelineEmpty => 'A cronoloxía está baleira';

  @override
  String get audiobookFocusedTimeline => 'Cronoloxía enfocada';

  @override
  String get audiobookFullTimeline => 'Full Timeline';

  @override
  String get audiobookExportBookmarks => 'Exportar os marcadores';

  @override
  String get audiobookExportNotes => 'Exportar as notas';

  @override
  String get audiobookExportAll => 'Exportar todo';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exportouse a $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Fallou a exportación: $error';
  }

  @override
  String get audiobookLyrics => 'Letras';

  @override
  String get audiobookAddBookmark => 'Engadir un marcador';

  @override
  String get audiobookAddNote => 'Engadir unha nota';

  @override
  String get audiobookEditNote => 'Editar a nota';

  @override
  String get audiobookNoteHint => 'Escribe unha nota para este momento';

  @override
  String get audiobookSleepTimer => 'Temporizador de sono';

  @override
  String get audiobookSleepOff => 'Desactivado';

  @override
  String get audiobookSleepEndOfChapter => 'Fin do capítulo';

  @override
  String get audiobookSleepCustom => 'Personalizado';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Quedan $remaining';
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
  String get audiobookPlaybackSpeed => 'Velocidade de reprodución';

  @override
  String get audiobookRemainingTime => 'Restante';

  @override
  String get audiobookElapsedTime => 'Transcorrido';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Atrás ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Adiante ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Capítulo anterior';

  @override
  String get audiobookNextChapter => 'Capítulo seguinte';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Capítulo $current de $total';
  }

  @override
  String get audiobookNoChapters => 'Non hai capítulos';

  @override
  String get audiobookNoBookmarks => 'Aínda non hai marcadores';

  @override
  String get audiobookNoNotes => 'Aínda non hai notas';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Marcador engadido en $position';
  }

  @override
  String get audiobookSpeedReset => 'Restablecer a 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Gardar';

  @override
  String get audiobookCancel => 'Cancelar';

  @override
  String get audiobookDelete => 'Eliminar';

  @override
  String get subtitlePreferencesDescription =>
      'Cambia os modos de subtítulos, os idiomas predeterminados, a aparencia e as opcións de renderización.';

  @override
  String get subtitleRendering => 'Renderización dos subtítulos';

  @override
  String get displayOptions => 'Opcións de visualización';

  @override
  String get releaseDateAscending => 'Data de lanzamento (ascendente)';

  @override
  String get releaseDateDescending => 'Data de lanzamento (descendente)';

  @override
  String get groupContributions => 'Agrupar as contribucións';

  @override
  String get groupMultipleRoles => 'Agrupar múltiples roles';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Aviso de acceso de escritura á biblioteca';

  @override
  String get libraryWriteAccessHowToFix => 'Como solucionalo:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Concede permisos de escritura ao usuario do servizo Jellyfin (p. ex., jellyfin ou o PUID/PGID de Docker) para os cartafoles da túa biblioteca multimedia no servidor.\n\n2. Ou ben vai ao panel de control de Jellyfin -> Bibliotecas, edita esta biblioteca e desactiva \'Gardar as ilustracións nos cartafoles multimedia\' para almacenalas na base de datos interna de Jellyfin.';

  @override
  String get dismiss => 'Descartar';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'A túa biblioteca \'$libraryName\' está configurada para gardar as ilustracións directamente nos cartafoles multimedia (\'Gardar as ilustracións nos cartafoles multimedia\' está activado). Non obstante, Jellyfin comprobou o acceso de escritura e non ten permiso para escribir ficheiros neste directorio:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Semella que Jellyfin non puido actualizar a ilustración. A túa biblioteca está configurada para gardar as ilustracións directamente nos cartafoles multimedia (\'Gardar as ilustracións nos cartafoles multimedia\' está activado). Este erro adoita producirse cando o proceso do servidor Jellyfin non ten permiso para escribir ficheiros nos teus directorios multimedia.';

  @override
  String get replay => 'Reproducir de novo';

  @override
  String get fileInformation => 'Información do ficheiro';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Tamaño: $size  •  Formato: $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Date Added: $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Mostrar todas as pistas de audio ($count)';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Mostrar todas as pistas de subtítulos ($count)';
  }

  @override
  String get checkingDirectPlay =>
      'Comprobando a capacidade de reprodución directa...';

  @override
  String get directPlayCapabilityLabel => 'Capacidade de reprodución directa: ';

  @override
  String get forced => 'Forzado';

  @override
  String get transcodeContainerNotSupported =>
      'O reprodutor non admite o formato do contedor.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'O códec de vídeo non é compatible.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'O códec de audio non é compatible.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'O formato dos subtítulos non é compatible (require incrustalos no vídeo).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'O perfil de audio non é compatible.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'O perfil de vídeo non é compatible.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'O nivel de vídeo non é compatible.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Este dispositivo non admite a resolución do vídeo.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'A profundidade de bits do vídeo non é compatible.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'A velocidade de fotogramas do vídeo non é compatible.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'A taxa de bits do ficheiro supera o límite de transmisión do reprodutor.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'A taxa de bits do vídeo supera o límite de transmisión.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'A taxa de bits do audio supera o límite de transmisión.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'O número de canles de audio non é compatible.';

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
  String get sortAlphabetical => 'Alfabético';

  @override
  String get sortReleaseAscending => 'Orde de lanzamento (ascendente)';

  @override
  String get sortReleaseDescending => 'Orde de lanzamento (descendente)';

  @override
  String get sortCustomDragDrop => 'Personalizado (arrastrar e soltar)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions =>
      'Opcións de ordenación da lista de reprodución';

  @override
  String get resetSort => 'Restablecer a ordenación';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Ver de novo T$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Ver de novo a lista de reprodución';

  @override
  String get noSubtitlesFound => 'Non se atoparon subtítulos.';

  @override
  String get adminControls => 'Controis de administración';

  @override
  String get impellerRendering => 'Motor de renderización (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller é o renderizador de GPU moderno de Flutter, para animacións máis fluídas e menos interrupcións. Nalgúns descodificadores de TV e GPU antigas pode provocar defectos visuais ou vídeo en negro; desactívao se os detectas. Automático escolle o mellor valor predeterminado para o teu dispositivo. Reinicia Moonfin para aplicalo.';

  @override
  String get impellerAuto => 'Automático';

  @override
  String get impellerOn => 'Activado';

  @override
  String get impellerOff => 'Desactivado';

  @override
  String get impellerRestartTitle => 'Cómpre reiniciar';

  @override
  String get impellerRestartMessage =>
      'Moonfin ten que reiniciarse para cambiar o motor de renderización. Pecha a aplicación agora e ábrea de novo para aplicalo.';

  @override
  String get impellerCloseNow => 'Pechar a aplicación agora';

  @override
  String get adminRefreshLibrary => 'Actualizar a biblioteca';

  @override
  String get adminRefreshAllLibraries => 'Actualizar todas as bibliotecas';

  @override
  String get adminRepoSortDateOldest =>
      'Data de engadido (máis antigas primeiro)';

  @override
  String get adminRepoSortDateNewest =>
      'Data de engadido (máis recentes primeiro)';

  @override
  String get adminRepoSortNameAsc => 'Alfabético (A a Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabético (Z a A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Cargando a analítica do servidor... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Igual que a orixe';

  @override
  String get imdbTop250Movies => 'Top 250 películas de IMDb';

  @override
  String get imdbTop250TvShows => 'Top 250 series de TV de IMDb';

  @override
  String get imdbMostPopularMovies => 'Películas máis populares de IMDb';

  @override
  String get imdbMostPopularTvShows => 'Series de TV máis populares de IMDb';

  @override
  String get imdbLowestRatedMovies => 'Películas peor valoradas de IMDb';

  @override
  String get imdbTopEnglishMovies => 'Mellores películas en inglés de IMDb';

  @override
  String get addToWatchlist => 'Add to Watchlist';

  @override
  String get removeFromWatchlist => 'Remove from Watchlist';

  @override
  String get watchlistUpdateFailed => 'Couldn\'t update watchlist';

  @override
  String get adminSearchParameters => 'Search Parameters';

  @override
  String get adminCurrentMetadata => 'Current Metadata';

  @override
  String get adminLabelYear => 'Year';

  @override
  String get adminReplaceImages => 'Replace existing images';

  @override
  String get adminBackToSearch => 'Back to Search Criteria';

  @override
  String get grouping => 'Grouping';

  @override
  String get groupByType => 'Group by Type';

  @override
  String get playlistTypes => 'Playlist Types';

  @override
  String get playlistTypeVideo => 'Video';

  @override
  String get playlistTypeMusicVideo => 'Music Video';

  @override
  String get playlistTypeAudio => 'Audio (Music)';

  @override
  String get playlistTypeAudiobook => 'Audiobook';

  @override
  String get playlistTypeBook => 'Book';

  @override
  String get playlistTypePhoto => 'Photo';

  @override
  String get playlistTypeMixed => 'Mixed';

  @override
  String get videoPlaylistsSection => 'Video Playlists';

  @override
  String get musicVideoPlaylistsSection => 'Music Video Playlists';

  @override
  String get audioPlaylistsSection => 'Audio Playlists';

  @override
  String get audiobookPlaylistsSection => 'Audiobook Playlists';

  @override
  String get bookPlaylistsSection => 'Book Playlists';

  @override
  String get photoPlaylistsSection => 'Photo Playlists';

  @override
  String get mixedPlaylistsSection => 'Mixed Playlists';

  @override
  String get currentTime => 'Current Time';

  @override
  String get playbackTimeDisplay => 'Progress Bar Time';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Choose which time labels appear around the playback progress bar.';

  @override
  String get playbackTimeTotal => 'Total duration';

  @override
  String get playbackTimeRemaining => 'Time remaining';

  @override
  String get playbackTimeEndsAt => 'Ends at';

  @override
  String get playbackTimeElapsed => 'Time elapsed';

  @override
  String get playbackTimeVideoSection => 'Video Player';

  @override
  String get playbackTimeMusicSection => 'Music Player';

  @override
  String get playbackTimeSlotDescription =>
      'Choose what is shown here, or hide it.';

  @override
  String get playbackTimeAboveBarLeft => 'Above bar, left';

  @override
  String get playbackTimeAboveBarCenter => 'Above bar, center';

  @override
  String get playbackTimeAboveBarRight => 'Above bar, right';

  @override
  String get playbackTimeBelowBarLeft => 'Below bar, left';

  @override
  String get playbackTimeBelowBarCenter => 'Below bar, center';

  @override
  String get playbackTimeBelowBarRight => 'Below bar, right';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Choose what is shown on the right side of the music progress bar.';

  @override
  String get groupByTitle => 'Group By';

  @override
  String get groupByDecade => 'Decade (Year)';

  @override
  String get groupByParentalRating => 'Parental Rating';

  @override
  String get groupByStudio => 'Studio';

  @override
  String get showAlphabeticalFilters => 'Show Alphabet';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => 'Personal Rating Style';

  @override
  String get personalRatingThumbs => 'Like / dislike';

  @override
  String get personalRatingStars => '5 stars';

  @override
  String get personalRatingNumeric => 'Numeric score out of 10';

  @override
  String get rate => 'Rate';

  @override
  String get like => 'Like';

  @override
  String get dislike => 'Dislike';

  @override
  String get personalRatingClear => 'Clear rating';

  @override
  String get personalRatingRated => 'Rated';

  @override
  String get personalRatingMine => 'My Rating';

  @override
  String get personalRatingSaveFailed => 'Could not save rating';

  @override
  String get increase => 'Increase';

  @override
  String get decrease => 'Decrease';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'In Progress';

  @override
  String get filterUnreleased => 'Unreleased';

  @override
  String get filterTrailers => 'Trailers';

  @override
  String get filterExtras => 'Extras';

  @override
  String get filterThemeSongs => 'Theme Songs';

  @override
  String get filterThemeVideos => 'Theme Videos';

  @override
  String get source => 'Source';

  @override
  String get years => 'Years';

  @override
  String get audioLanguage => 'Audio Language';

  @override
  String get subtitleLanguage => 'Subtitle Language';

  @override
  String get clearFilters => 'Clear Filters';

  @override
  String get seerrShortcutsRow => 'Seerr Browse';

  @override
  String get seerrReleased => 'Released';

  @override
  String get seerrMinRating => 'Minimum Rating';

  @override
  String get seerrMinVotes => 'Minimum Votes';

  @override
  String get seerrOriginalLanguage => 'Original Language';

  @override
  String get seerrRuntime => 'Runtime';

  @override
  String get subtitleHdrSeparate => 'Separate HDR Style';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'White is much brighter in HDR than in SDR, so a dimmer style here avoids the glare';

  @override
  String get scrollSensitivity => 'Scroll Sensitivity';

  @override
  String get scrollSensitivitySubtitle =>
      'How far one mouse wheel notch scrolls';

  @override
  String get mediaDetailsAndSpoilers => 'Media Details and Spoilers';

  @override
  String get openTrailersExternally => 'Open Trailers in External App';

  @override
  String get openTrailersExternallySubtitle =>
      'Trailers open in the YouTube app or browser instead of the built-in player';

  @override
  String get hideDetailsMediaDescription => 'Hide Media Description';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Hide the movie or episode descriptive text.';

  @override
  String get detailUseSeriesThumbnails => 'Use Series Thumbnails';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Replace all thumbnails on Classic details page with series thumbnail';

  @override
  String get hideHomeMediaDescription => 'Hide Media Description';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Hide the movie or episode descriptive text.';

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
  String get continueWatchingAndNextUpHeader => 'Continue Watching and Next Up';

  @override
  String get setupSkip => 'Skip setup';

  @override
  String get setupNavbarQuestion => 'Where should navigation go?';

  @override
  String get setupMediaBarQuestion =>
      'How should the top of your Home screen look?';

  @override
  String get setupHomeRowsQuestion => 'How should your rows look?';

  @override
  String get setupDetailQuestion =>
      'How should a movie or show look when you open it?';

  @override
  String get setupTourQuestion => 'You\'re set. Here\'s what else is in here.';

  @override
  String get setupPlaybackLanguages => 'Playback languages';

  @override
  String get setupOptional => 'Optional';

  @override
  String get setupStyleClassic => 'Classic';

  @override
  String get setupStyleModern => 'Modern';

  @override
  String get setupRowsClassicHint => 'Compact. More rows on screen at once.';

  @override
  String get setupRowsModernHint => 'Larger cards with titles underneath.';

  @override
  String get setupDetailClassicHint => 'Everything centred in one stack.';

  @override
  String get setupDetailModernHint =>
      'Cinematic, with tabs for cast and extras.';

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
  String get setupPickALook => 'Pick a look';

  @override
  String get setupTourMoreHeader => 'There is more waiting in Settings';

  @override
  String get setupTourBulletRequests => 'Seerr requests';

  @override
  String get setupTourBulletSyncPlay => 'SyncPlay watch parties';

  @override
  String get setupTourBulletThemes => 'Custom themes';

  @override
  String get setupTourBulletDownloads => 'Offline downloads';

  @override
  String get setupTourBulletMore => 'And plenty more';

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
  String get runSetupAgain => 'Run setup again';

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
  String get integrations => 'Integracións';

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
