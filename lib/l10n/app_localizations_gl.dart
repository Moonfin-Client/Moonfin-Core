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
  String get signIn => 'Iniciar sesión';

  @override
  String connectingToServer(String serverName) {
    return 'Conectando a $serverName';
  }

  @override
  String get quickConnect => 'Conexión rápida';

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
  String get waitingForAuthorization => 'Agardando autorización...';

  @override
  String get back => 'De volta';

  @override
  String get serverUnavailable => 'O servidor non está dispoñible';

  @override
  String get loginFailed => 'Fallou o inicio de sesión';

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
  String get remove => 'Eliminar';

  @override
  String get connectToServer => 'Conectar ao servidor';

  @override
  String get serverAddress => 'Enderezo do servidor';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

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
  String get settingsAppearanceThemeSubtitle =>
      'Cambia entre Moonfin e Neon Pulse sen reiniciar a aplicación';

  @override
  String get keyboardPreferSystemIme => 'Prefire o teclado do sistema';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Usa o método de entrada do teu dispositivo de forma predeterminada para introducir texto';

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
  String get series => 'Serie';

  @override
  String get noItemsFound => 'Non se atoparon elementos';

  @override
  String get home => 'Casa';

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
  String get pickDiscoverySubjects =>
      'Escolle que fontes de temas queres mostrar en Discover.';

  @override
  String get apply => 'Solicitar';

  @override
  String get openLink => 'Abrir ligazón';

  @override
  String get scanWithYourPhone => 'Escanee co seu teléfono';

  @override
  String get audiobookGenres => 'Xéneros de audiolibros';

  @override
  String get pickAudiobookGenres =>
      'Escolle os xéneros que queres mostrar en Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Descubre os audiolibros';

  @override
  String get librivoxDescription =>
      'Títulos populares de dominio público de LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count títulos';
  }

  @override
  String get scrollLeft => 'Desprácese á esquerda';

  @override
  String get scrollRight => 'Desprácese á dereita';

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
  String get resume => 'Currículo';

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
  String get trendingTitlesOpenLibrary =>
      'Títulos de tendencia por materia de Open Library.';

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
  String get watched => 'Vixiado';

  @override
  String get unread => 'Non lido';

  @override
  String get unwatched => 'Sen vixiar';

  @override
  String get seriesStatus => 'Estado da serie';

  @override
  String get allLibraries => 'Todas as bibliotecas';

  @override
  String get books => 'Libros';

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
      other: '$count audiobooks',
      one: '1 audiobook',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista de pistas';

  @override
  String get itemListPlaceholder => 'A lista de elementos aparecerá aquí';

  @override
  String get favoriteTracksPlaceholder =>
      'As cancións favoritas aparecerán aquí';

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
  String get seasons => 'Estacións';

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
  String get noBooksFound => 'Non se atoparon libros para este autor.';

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
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
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
  String get play => 'Xogar';

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
  String get cast => 'Cast';

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
  String get writers => 'ESCRITORES';

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
  String get shuffle => 'Barallar';

  @override
  String downloadsCount(int count) {
    return '$count descargas';
  }

  @override
  String get perfectMatch => 'Combinación perfecta';

  @override
  String channelsCount(int count) {
    return '${count}ch';
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
  String get bitrateOverride => 'Anulación da taxa de bits';

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
  String get player => 'Xogador';

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
  String get codec => 'Códec';

  @override
  String get videoBitrate => 'Bitrate de vídeo';

  @override
  String get track => 'Pista';

  @override
  String get channels => 'Canles';

  @override
  String get audioBitrate => 'Taxa de bits de audio';

  @override
  String get sampleRate => 'Frecuencia de mostraxe';

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
  String get guideTimeline => 'Cronoloxía da guía';

  @override
  String failedToLoadGuide(String error) {
    return 'Produciuse un erro ao cargar a guía: $error';
  }

  @override
  String get noChannelsFound => 'Non se atopou ningunha canle';

  @override
  String get liveBadge => 'EN VIVO';

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
  String get cancelRecordingAction => 'Cancelar a gravación';

  @override
  String get programSetToRecord => 'Programa configurado para gravar';

  @override
  String get recordingCancelled => 'Cancelouse a gravación';

  @override
  String get unableToCreateRecording => 'Non se puido crear a gravación';

  @override
  String get watch => 'Observa';

  @override
  String get close => 'Pechar';

  @override
  String failedToPlayChannel(String name) {
    return 'Produciuse un erro ao xogar $name';
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
  String get seerr => 'Vidente';

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
    return 'S$season E$episode';
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
    return 'S$number';
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
      other: '$count episodes',
      one: '1 episode',
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
  String get serverSyncAndPluginStatus =>
      'Sincronización do servidor e estado do complemento';

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
  String get integrations => 'Integracións';

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
  String get backgroundBackdrops => 'Fondos de fondo';

  @override
  String get showBackdropImages => 'Mostra imaxes de fondo detrás do contido';

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
  String get snow => 'Neve';

  @override
  String get fireworks => 'Fogos artificiais';

  @override
  String get confetti => 'Confeti';

  @override
  String get fallingLeaves => 'Follas Caídas';

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
  String get detailsBackgroundBlur => 'Detalles desenfoque de fondo';

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
  String get fit => 'Encaixar';

  @override
  String get autoCrop => 'Recorte automático';

  @override
  String get stretch => 'Estirar';

  @override
  String get refreshRateSwitching => 'Cambio da taxa de actualización';

  @override
  String get disabled => 'Desactivado';

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
  String get showDescriptionOnPause => 'Mostrar a descrición en pausa';

  @override
  String get dimVideoShowOverview =>
      'Atenua o vídeo e mostra o texto xeral mentres está en pausa';

  @override
  String get osdLockButton => 'Botón de bloqueo OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostra un botón de bloqueo que bloquea a entrada táctil ata que se preme durante moito tempo';

  @override
  String get audioBehavior => 'Comportamento de audio';

  @override
  String get downmixToStereo => 'Downmix a estéreo';

  @override
  String get defaultAudioLanguage => 'Idioma de audio predeterminado';

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
  String get enableTrueHdAudio =>
      'Activa o audio TrueHD (pode que non funcione en todas as plataformas)';

  @override
  String get settingsAudioOutputMode => 'Modo de saída de audio';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Paso AVR';

  @override
  String get settingsAudioFallbackCodec => 'Codec alternativo de audio';

  @override
  String get settingsAudioFallbackAacStereo => 'AAC estéreo';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Paso directo (avanzado)';

  @override
  String get settingsAudioCodecPassthrough => 'Codec Passthrough';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Activa só os formatos compatibles coa túa receptora AVR ou HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Paso EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'DTS Core Passthrough';

  @override
  String get settingsAudioDtsHdPassthrough => 'Paso DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) ao decodificador externo.';

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
    return 'After $episodes episodes / ${hours}h';
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
  String get defaultToNoSubtitles => 'O predeterminado é Sen subtítulos';

  @override
  String get turnOffSubtitlesByDefault =>
      'Desactiva os subtítulos de forma predeterminada';

  @override
  String get subtitleSize => 'Tamaño do subtítulo';

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
  String get subtitlePreviewText =>
      'O raposo marrón rápido salta sobre o can preguiceiro';

  @override
  String get verticalOffset => 'Desfase vertical';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'Subtítulos PGS de reprodución directa';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

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
  String get global => 'Global';

  @override
  String get desktop => 'Escritorio';

  @override
  String get mobile => 'Móbil';

  @override
  String get tv => 'TV';

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
  String get customizationProfile => 'Perfil de personalización';

  @override
  String get customizationProfileDescription =>
      'Escolla o perfil para cargar, editar e sincronizar. O global aplícase en todas partes a menos que un perfil de dispositivo o anule. O punto verde marca o teu perfil actual do dispositivo.';

  @override
  String get loadProfile => 'Cargar perfil';

  @override
  String get syncing => 'Sincronizando...';

  @override
  String get syncToProfile => 'Sincronizar co perfil';

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
  String get showLibrariesInToolbar =>
      'Mostrar bibliotecas na barra de ferramentas';

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
  String get indigo => 'Indigo';

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
  String get enableFolderView => 'Activar a vista de cartafoles';

  @override
  String get showFolderBrowsingOption =>
      'Mostrar a opción de navegación por cartafoles';

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
  String get sourceLibraries => 'Bibliotecas de orixe';

  @override
  String get sourceCollections => 'Coleccións Fonte';

  @override
  String get excludedGenres => 'Xéneros excluídos';

  @override
  String get selectAll => 'Seleccione Todo';

  @override
  String itemsSelected(int count) {
    return '$count selected';
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
  String get localPreviews => 'Vistas previas locais';

  @override
  String get localPreviewsDescription =>
      'Configura as vistas previas do tráiler, multimedia e audio.';

  @override
  String get mediaBarMode => 'Estilo de barra multimedia';

  @override
  String get mediaBarModeDescription =>
      'Escolle entre Moonfin, MakD ou desactiva a barra multimedia';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desactivado';

  @override
  String get enableMediaBar => 'Activar a barra multimedia';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostrar presentación de diapositivas de contido destacado na casa';

  @override
  String get contentType => 'Tipo de contido';

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
  String get latestMedia => 'Últimos Medios';

  @override
  String get recentlyReleased => 'Lanzado recentemente';

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
  String get homeSections => 'Seccións de inicio';

  @override
  String get resetToDefaults => 'Restablecer os valores predeterminados';

  @override
  String get homeRowPosterSize => 'Tamaño do póster da fila de inicio';

  @override
  String get perRowImageTypeSelection => 'Selección de tipo de imaxe por fila';

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
  String get perRowImageType => 'Tipo de imaxe por fila';

  @override
  String get perRowSettings => 'Configuración por fila';

  @override
  String get autoLogin => 'Inicio de sesión automático';

  @override
  String get lastUser => 'Último Usuario';

  @override
  String get specificUser => 'Usuario específico';

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
  String get showClock => 'Mostrar o reloxo';

  @override
  String get displayClockDuringScreensaver =>
      'Mostra o reloxo durante o protector de pantalla';

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
  String get pluginLabel => 'Engadido';

  @override
  String get pluginDetected => 'Complemento detectado';

  @override
  String get pluginNotDetected => 'Plugin non detectado';

  @override
  String get pluginDetectedDescription =>
      'Detectouse o complemento do servidor. A sincronización actívase automaticamente a primeira vez que se atopa o complemento.';

  @override
  String get pluginNotDetectedDescription =>
      'Actualmente non se detecta o complemento do servidor. A configuración local aínda usa os seus valores gardados ou os valores predeterminados integrados.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Servizos Dispoñibles';

  @override
  String get serverPluginSync => 'Sincronización do complemento do servidor';

  @override
  String get syncSettingsWithPlugin =>
      'Sincronizar a configuración co complemento do servidor';

  @override
  String get whatSyncControls => 'Que controla a sincronización';

  @override
  String get syncControlsDescription =>
      'A sincronización só controla se as configuracións respaldadas por complementos son enviadas ao servidor e extraídas do servidor. A selección de perfil e as accións de sincronización de perfil están na configuración de personalización cando a sincronización de complementos está activada.';

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
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Descubre filas';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Arrastra para reordenar. Activa ou desactiva filas. As sincronizacións de orde de filas activadas co complemento Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Arrastra para reordenar. Activa ou desactiva filas.';

  @override
  String get enabled => 'Activado';

  @override
  String get hidden => 'Oculto';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Licenzas de código aberto';

  @override
  String get sourceCode => 'Código fonte';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

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
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Actualizar notificacións';

  @override
  String get showWhenUpdatesAvailable =>
      'Mostra cando hai actualizacións dispoñibles';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
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
  String get reorderToggleHomeRows => 'Reordena e alterna as filas de inicio';

  @override
  String get featuredContentAppearance => 'Contido destacado, aparencia';

  @override
  String get posterSizeImageTypeFolderView =>
      'Tamaño do póster, tipo de imaxe, vista do cartafol';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB e fontes de clasificación';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

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
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Configuración de Seerr';

  @override
  String get requestMore => 'Solicita máis';

  @override
  String get request => 'Solicitude';

  @override
  String get cancelRequest => 'Cancelar solicitude';

  @override
  String get playInMoonfin => 'Xoga en Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

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
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
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
  String get submitRequest => 'Enviar solicitude';

  @override
  String get allSeasons => 'Todas as estacións';

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
  String get appearances => 'Aparencias';

  @override
  String get crewSection => 'Tripulación';

  @override
  String ageValue(int age) {
    return 'age $age';
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
  String get seasonsLabel => 'Estacións';

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
  String get forward => 'Adiante';

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
  String get next => 'A continuación';

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
  String get search => 'Busca';

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
  String get stop => 'Pare';

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
  String get adminDrawerTranscoding => 'Transcodificación';

  @override
  String get adminDrawerResume => 'Currículo';

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
  String get adminScanLibraries => 'Escanear bibliotecas';

  @override
  String get adminLibraryScanStarted => 'Comezou a exploración da biblioteca';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
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
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Enviar mensaxe';

  @override
  String get adminMessageTextHint => 'Texto da mensaxe';

  @override
  String get adminSetVolume => 'Establecer volume';

  @override
  String get sessionPrev => 'Prev';

  @override
  String get sessionRewind => 'Rebobinar';

  @override
  String get sessionForward => 'Adiante';

  @override
  String get sessionNext => 'A continuación';

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
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Finalización';

  @override
  String get direct => 'Directo';

  @override
  String get adminDisconnect => 'Desconectar';

  @override
  String get adminClearDates => 'Datas claras';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
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
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Eliminar dispositivo';

  @override
  String get adminDeviceDeleted => 'Eliminouse o dispositivo';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
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
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Cambiar o nome da biblioteca';

  @override
  String get adminNewName => 'Novo nome';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Eliminar biblioteca';

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
  String get adminRemovePath => 'Eliminar o camiño';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Gardáronse as opcións da biblioteca';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
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
  String get adminSaveOptions => 'Opcións de gardar';

  @override
  String get adminPreferredMetadataLanguage => 'Idioma de metadatos preferido';

  @override
  String get adminMetadataLanguageHint => 'p.ex. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Código de país de metadatos';

  @override
  String get adminMetadataCountryHint => 'p.ex. EU, DE, FR';

  @override
  String get adminLibraryNameRequired => 'O nome da biblioteca é necesario';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Nome da biblioteca';

  @override
  String get adminSelectedPaths => 'Camiños seleccionados:';

  @override
  String get adminNoPathsAdded =>
      'Non se engadiron camiños (pódense engadir máis tarde)';

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
  String get adminUsersLoadFailed => 'Produciuse un erro ao cargar os usuarios';

  @override
  String get adminSearchUsers => 'Busca usuarios';

  @override
  String get adminEditUser => 'Editar Usuario';

  @override
  String get adminAddUser => 'Engadir usuario';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Crear usuario';

  @override
  String get adminPasswordOptional => 'Contrasinal (opcional)';

  @override
  String get adminUsernameRequired =>
      'O nome de usuario non pode estar baleiro';

  @override
  String get adminNoProfileChanges => 'Non hai cambios de perfil para gardar';

  @override
  String get adminProfileSaved => 'Perfil gardado';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permisos gardados';

  @override
  String get adminPasswordsMismatch => 'Os contrasinais non coinciden';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Produciuse un erro ao cargar o usuario';

  @override
  String get adminBackToUsers => 'Volver a Usuarios';

  @override
  String get adminSaveProfile => 'Gardar o perfil';

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
  String get adminAllowContentDeletion => 'Permitir a eliminación de contido';

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
  String get adminRemoteBitrateLimit =>
      'Límite de bitrate de cliente remoto (bps)';

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
  String get adminSavePermissions => 'Gardar permisos';

  @override
  String get adminEnableAllLibraryAccess =>
      'Activa o acceso a todas as bibliotecas';

  @override
  String get adminSaveAccess => 'Gardar acceso';

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
  String get adminDeviceAndChannelAccess => 'Acceso ao dispositivo e á canle';

  @override
  String get adminEnableAllDevices => 'Activa o acceso a todos os dispositivos';

  @override
  String get adminEnableAllChannels => 'Activa o acceso a todas as canles';

  @override
  String get adminResetPasswordWarning =>
      'Isto eliminará o contrasinal. O usuario poderá iniciar sesión sen contrasinal.';

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
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Falta o token de chave na resposta do servidor';

  @override
  String get adminRevokeApiKey => 'Revogar a chave da API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Revogouse a chave da API';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
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
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Creando copia de seguranza...';

  @override
  String get adminBackupCreated => 'Creouse a copia de seguranza correctamente';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Falta a ruta da copia de seguranza na resposta do servidor';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmar a restauración';

  @override
  String get adminRestoringBackup => 'Restaurando a copia de seguranza...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
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
  String get adminSearchInLog => 'Busca no rexistro';

  @override
  String get adminNoMatchingLines => 'Non hai liñas coincidentes';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Non se atoparon tarefas programadas';

  @override
  String get adminNoTasksMatchFilter =>
      'Ningunha tarefa coincide co filtro actual';

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
  String get adminRunNow => 'Corre agora';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
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
  String get adminTimeLimit => 'Límite de tempo (opcional)';

  @override
  String get adminNoLimit => 'Sen límite';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Día da semana';

  @override
  String get adminSearchPlugins => 'Busca complementos...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstalar o complemento';

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
      'Ningún complemento coincide coa túa busca';

  @override
  String get adminNoPluginsInstalled => 'Non hai complementos instalados';

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
      'Non se puido abrir a configuración: falta o token de autenticación.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Non se atopou o complemento';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
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
  String get adminRepositoryNameHint => 'p.ex. Establo Jellyfin';

  @override
  String get adminRepositoryUrl => 'URL do repositorio';

  @override
  String get adminAddEntry => 'Engadir entrada';

  @override
  String get adminInvalidUrl => 'URL non válido';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
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
  String get adminBrandingSaved => 'Gardouse a configuración de marca';

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
  String get adminStreamingSaved => 'Gardouse a configuración de emisión';

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
  String get adminPlaybackSaved => 'Gardouse a configuración de reprodución';

  @override
  String get adminPlaybackLoadFailed =>
      'Produciuse un erro ao cargar a configuración de reprodución';

  @override
  String get adminPlaybackTranscoding => 'Reproducción / Transcodificación';

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
  String get adminTrickplaySaved => 'Gardouse a configuración de Trickplay';

  @override
  String get adminTrickplayLoadFailed =>
      'Produciuse un erro ao cargar a configuración de truco';

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
  String get adminResumeSaved => 'Retomar a configuración gardada';

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
  String get adminNetworkingSaved =>
      'Gardouse a configuración da rede. Pode ser necesario reiniciar o servidor.';

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
  String get adminBaseUrlHint => 'p.ex. /aleta';

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
  String get adminMetadataSaved => 'Gardáronse os metadatos';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Actualizar metadatos';

  @override
  String get recursive => 'Recursiva';

  @override
  String get adminReplaceAllMetadata => 'Substitúe todos os metadatos';

  @override
  String get adminReplaceAllImages => 'Substitúe todas as imaxes';

  @override
  String get adminMetadataRefreshRequested =>
      'Solicitude de actualización de metadatos';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Busca persoa remota';

  @override
  String get adminNoRemoteMatches => 'Non se atoparon coincidencias remotas';

  @override
  String get adminRemoteResults => 'Resultados remotos';

  @override
  String get adminRemoteMetadataApplied => 'Aplicáronse metadatos remotos';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Actualizar o tipo de contido';

  @override
  String get adminContentType => 'Tipo de contido';

  @override
  String get adminContentTypeUpdated => 'Tipo de contido actualizado';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
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
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Formato de imaxe non compatible';

  @override
  String get adminImageReadFailed =>
      'Produciuse un erro ao ler a imaxe seleccionada';

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
  String get adminAllProviders => 'Todos os provedores';

  @override
  String get adminNoRemoteImages => 'Non se atoparon imaxes remotas';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Engadir sintonizador';

  @override
  String get adminTunerType => 'Tipo de sintonizador';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Outros';

  @override
  String get adminUrlPath => 'URL/Ruta';

  @override
  String get adminNameOptional => 'Nome (opcional)';

  @override
  String get adminTunerAdded => 'Engadiuse o sintonizador';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Engadir provedor de guías';

  @override
  String get adminProviderType => 'Tipo de provedor';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect ou XMLTV';

  @override
  String get adminUsernameOptional => 'Nome de usuario (opcional)';

  @override
  String get adminRefreshInterval => 'Intervalo de actualización (horas)';

  @override
  String get adminProviderAdded => 'Engadiuse o provedor';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'Solicitouse o reinicio do sintonizador';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Configuración de gravación';

  @override
  String get adminPrePadding => 'Relleno previo (minutos)';

  @override
  String get adminPostPadding => 'Post-recheo (minutos)';

  @override
  String get adminRecordingPath => 'Camiño de gravación';

  @override
  String get adminSeriesRecordingPath => 'Camiño de gravación da serie';

  @override
  String get adminRecordingSettingsSaved =>
      'Gardouse a configuración da gravación';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Establecer asignacións de canles';

  @override
  String get adminMappingJson => 'Asignación de JSON';

  @override
  String get adminMappingJsonHint => 'Exemplo: asignacións de carga útil JSON';

  @override
  String get adminChannelMappingsUpdated =>
      'Actualizáronse as asignacións de canles';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
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
  String get adminAddProvider => 'Engadir provedor';

  @override
  String get adminNoListingProviders =>
      'Non se configuraron provedores de listas';

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
  String get adminTunerDiscovery => 'Descubrimento do sintonizador';

  @override
  String get adminChannelMappings => 'Asignacións de canles';

  @override
  String get adminNoDiscoveredTuners =>
      'Aínda non se descubriu ningún sintonizador';

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
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Solicitude de restauración. O reinicio do servidor pode desconectar esta sesión.';

  @override
  String get adminBackupsTitle => 'Copias de seguridade';

  @override
  String get adminUnknownDate => 'Data descoñecida';

  @override
  String get adminUnnamedBackup => 'Copia de seguranza sen nome';

  @override
  String get adminLiveTvNotAvailable =>
      'A administración de TV en directo non está dispoñible nesta compilación de servidor.';

  @override
  String get adminLiveTvTitle => 'Administración de TV en directo';

  @override
  String get adminApply => 'Solicitar';

  @override
  String get adminNotSet => 'Non definido';

  @override
  String get adminReset => 'Restablecer';

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
  String get adminLogViewerNoMatches => 'Non hai liñas coincidentes';

  @override
  String get adminMetadataEditorTitle => 'Editor de metadatos';

  @override
  String get adminMetadataRemote => 'Mando a distancia';

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
  String get adminMetadataFieldTagline => 'Eslogan';

  @override
  String get adminMetadataFieldOverview => 'Visión xeral';

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
  String get adminMetadataRecursive => 'Recursiva';

  @override
  String get adminMetadataProvider => 'Provedor';

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
      'Produciuse un erro ao ler a imaxe seleccionada';

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
      'Isto elimina a imaxe actual do elemento.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
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
  String get adminPluginsNoSearchResults =>
      'Ningún complemento coincide coa túa busca';

  @override
  String get adminPluginsNoneInstalled => 'Non hai complementos instalados';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
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
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Ningún paquete coincide coa túa busca';

  @override
  String get adminPluginsCatalogEmpty => 'Non hai paquetes dispoñibles';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
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
    return '$name Settings';
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
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Eliminar repositorio';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Eliminar';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
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
  String get adminNetworkingRemoteAccess => 'Activa o acceso remoto';

  @override
  String get adminNetworkingPorts => 'Portos';

  @override
  String get adminNetworkingHttpPort => 'Porto HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Porto HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Activa HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Rede local';

  @override
  String get adminNetworkingLocalAddresses => 'Enderezos de redes locais';

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
  String get adminPlaybackHwAccel => 'Aceleración de hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Aceleración de hardware';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Activa a codificación de hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Activar a decodificación de hardware para:';

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
  String get adminResumeMinAudiobookPct =>
      'Porcentaxe mínima de currículo de audiolibro';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Porcentaxe máxima de currículo de audiolibro';

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
  String get adminTaskStop => 'Pare';

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
  String get adminTaskTriggerEvery6Hours => 'Cada 6 horas';

  @override
  String get adminTaskTriggerEvery12Hours => 'Cada 12 horas';

  @override
  String get adminTaskTriggerEvery24Hours => 'Cada 24 horas';

  @override
  String get adminTaskTriggerEvery2Days => 'Cada 2 días';

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
  String get adminTaskTriggerTime => 'Tempo';

  @override
  String get adminTaskTriggerNoLimit => 'Sen límite';

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
  String get adminActivityNow => 'agora';

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
      'Configura a xeración de imaxes de truco para buscar miniaturas de vista previa.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porto HTTPS público';

  @override
  String get adminNetworkingBaseUrl => 'URL base';

  @override
  String get adminNetworkingBaseUrlHint => 'p.ex. /aleta';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Camiño do certificado';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filtro IP remoto';

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
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Limiar de resposta lenta (ms)';

  @override
  String get adminGeneralCachePath => 'Ruta da caché';

  @override
  String get adminGeneralMetadataPath => 'Camiño dos metadatos';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminSettingsLoadFailed =>
      'Produciuse un erro ao cargar a configuración';

  @override
  String get adminDiscover => 'Descubrir';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
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
      other: '# participants',
      one: '# participant',
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
    return 'Item $index';
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
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Acceso a SyncPlay denegado';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Non tes acceso a un ou varios elementos deste grupo de SyncPlay. Pídalle ao propietario do grupo que verifique os permisos da biblioteca ou que elixa unha cola diferente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
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
  String get homeScreenSectionsIntegrationDescription =>
      'Detecta filas expostas polo complemento \"Seccións da pantalla de inicio\" de IAmParadox27. As filas pódense activar e reordenar a continuación.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Aínda non hai servidores Jellyfin que informen do complemento.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Detecta filas configuradas mediante o complemento \"KefinTweaks\" de ranaldsgift. As seccións personalizadas, publicadas recentemente, ver de novo, estacionais e engadidas recentemente na biblioteca reflícanse desde a configuración de KefinTweaks en cada servidor Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Aínda non hai servidores Jellyfin que informen de KefinTweaks.';

  @override
  String get integrationOpenHomeSections => 'Abrir seccións de inicio';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Activa, desactiva e reordena as filas';

  @override
  String get integrationInstalledButDisabled => 'Instalado pero desactivado';

  @override
  String get integrationNotInstalled => 'Non instalado';

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
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Reprodución remota';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Volume do dispositivo';

  @override
  String get castVolumeUnavailable => 'Non dispoñible';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
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
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN incorrecto';

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
      'Solicitude de conexión rápida autorizada.';

  @override
  String get quickConnectInvalidOrExpired =>
      'O código de conexión rápida non é válido ou caducou.';

  @override
  String get quickConnectNotSupported =>
      'A conexión rápida non é compatible neste servidor.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Produciuse un erro ao autorizar o código de conexión rápida.';

  @override
  String get quickConnectDisabled =>
      'A conexión rápida está desactivada neste servidor.';

  @override
  String get quickConnectForbidden =>
      'A túa conta non pode autorizar esta solicitude de conexión rápida.';

  @override
  String get quickConnectNotFound =>
      'Non se atopou o código de conexión rápida. Proba cun novo código.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Introduce o código';

  @override
  String get quickConnectAuthorize => 'Autorizar';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
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
    return 'Failed to start casting: $error';
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
    return 'Downloading $name...';
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
  String get stillWatchingStop => 'Pare';

  @override
  String get stillWatchingContinue => 'Continuar';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV en directo';

  @override
  String get continueWatchingAndNextUp => 'Seguir vendo e seguinte';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
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
  String get settingsAdministrationSubtitle =>
      'Acceda ao panel de administración do servidor';

  @override
  String get settingsAccountSecurity => 'Conta e Seguridade';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autenticación, código PIN e controis parentais';

  @override
  String get settingsPersonalization => 'Personalización';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navegación, filas de inicio e visibilidade da biblioteca';

  @override
  String get settingsDynamicContent => 'Contido dinámico';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra multimedia e superposicións visuais';

  @override
  String get settingsPlaybackSyncplay => 'Reprodución e SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Configuración de audio/vídeo, subtítulos, descargas e controis de SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sincronización de complementos, Seerr, valoracións e moito máis';

  @override
  String get settingsAboutSubtitle =>
      'Versión da aplicación, información legal e créditos';

  @override
  String get settingsAuthenticationSection => 'AUTENTICACIÓN';

  @override
  String get settingsSortServersBy => 'Ordenar servidores por';

  @override
  String get settingsLastUsed => 'Último uso';

  @override
  String get settingsAlphabetical => 'Alfabético';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACIDADE E SEGURIDADE';

  @override
  String get settingsBlockedRatings => 'Clasificacións bloqueadas';

  @override
  String get settingsGeneralStyle => 'Estilo xeral';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Acentos temáticos, fondos, indicadores vistos e música temática';

  @override
  String get settingsHomePage => 'Páxina de inicio';

  @override
  String get settingsHomePageSubtitle =>
      'Seccións, tipos de imaxes, superposicións e previsualizacións multimedia';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilidade da biblioteca, vista de cartafoles e comportamento multiservidor';

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
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostra o botón de bibliotecas na barra de navegación';

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
  String get settingsMetadataAndRatings => 'Metadatos e valoracións';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase potencia as integracións no servidor, incluíndo fontes de clasificación adicionais, solicitudes de Seerr e preferencias sincronizadas.';

  @override
  String get settingsOfflineDownloads => 'Descargas sen conexión';

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
      'Donate a coffee to the developer';

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
  String get settingsPoweredByFlutter => 'Impulsado por Flutter';

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
  String get settingsBoth => 'Ambos';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filtro de tipo de contido aleatorio';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferencias de reprodución de vídeo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Motor de vídeo principal e configuración de calidade de transmisión';

  @override
  String get settingsAudioPreferences => 'Preferencias de audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Pistas de audio, procesamento e opcións de paso';

  @override
  String get settingsAutomationAndQueue => 'Automatización e cola';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Reproducción e secuenciación automatizadas';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Calidade de descarga, límites de almacenamento e tamaño da cola';

  @override
  String get settingsSyncplaySubtitle =>
      'Lóxica de sincronización para sesións de grupo';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Características de xogadores especializadas. Use con precaución, xa que algunhas opcións poden causar problemas de reprodución';

  @override
  String get settingsSkipIntrosAndOutros => 'Omitir intros e outros?';

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
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (herdado)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

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
