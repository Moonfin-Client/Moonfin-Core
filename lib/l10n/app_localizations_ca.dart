// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'Preferències del compte';

  @override
  String get interfaceLanguage => 'Idioma de la interfície';

  @override
  String get systemLanguageDefault => 'Predeterminat del sistema';

  @override
  String get signIn => 'Iniciar sessió';

  @override
  String get empty => 'Buit';

  @override
  String connectingToServer(String serverName) {
    return 'S\'està connectant a $serverName';
  }

  @override
  String get quickConnect => 'Connexió ràpida';

  @override
  String get password => 'Contrasenya';

  @override
  String get username => 'Nom d\'usuari';

  @override
  String get email => 'Correu electrònic';

  @override
  String get quickConnectInstruction =>
      'Introduïu aquest codi al tauler web del vostre servidor:';

  @override
  String get waitingForAuthorization => 'Esperant l\'autorització...';

  @override
  String get back => 'Enrere';

  @override
  String get serverUnavailable => 'El servidor no està disponible';

  @override
  String get loginFailed => 'No s\'ha pogut iniciar la sessió';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect no disponible: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect no disponible ($status): $detail';
  }

  @override
  String get whosWatching => 'Qui està mirant?';

  @override
  String get addUser => 'Afegeix usuari';

  @override
  String get selectServer => 'Seleccioneu Servidor';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versió $version';
  }

  @override
  String get savedServers => 'Servidors guardats';

  @override
  String get discoveredServers => 'Servidors descoberts';

  @override
  String get noneFound => 'No s\'ha trobat cap';

  @override
  String get unableToConnectToServer => 'No es pot connectar al servidor';

  @override
  String get addServer => 'Afegeix servidor';

  @override
  String get embyConnect => 'Emby Connecta';

  @override
  String get removeServer => 'Elimina el servidor';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Vols suprimir \"$serverName\" dels teus servidors?';
  }

  @override
  String get cancel => 'Cancel·la';

  @override
  String get remove => 'Eliminar';

  @override
  String get connectToServer => 'Connecteu-vos al servidor';

  @override
  String get serverAddress => 'Adreça del servidor';

  @override
  String get serverAddressHint => 'https://your-server.example.com';

  @override
  String get connect => 'Connecta\'t';

  @override
  String get secureStorageUnavailable => 'Emmagatzematge segur no disponible';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin no ha pogut accedir al teu anell de claus del sistema. L\'inici de sessió pot continuar, però és possible que l\'emmagatzematge de testimoni segur no estigui disponible fins que no es desbloquegi l\'anell de claus.';

  @override
  String get ok => 'D\'acord';

  @override
  String get settingsAppearanceTheme => 'Tema de l\'aplicació';

  @override
  String get detailScreenStyle => 'Detail screen style';

  @override
  String get detailScreenStyleSubtitle =>
      'Classic is the original centered moonfin layout. Modern is a responsive cinematic layout.';

  @override
  String get detailScreenStyleMoonfin => 'Classic';

  @override
  String get detailScreenStyleModern => 'Modern';

  @override
  String get expandedTabs => 'Expanded Tabs';

  @override
  String get expandedTabsSubtitle =>
      'Automatically show tab content while browsing tabs. Turn off to open and close each tab manually.';

  @override
  String get recommendationSystem => 'Recommendation System';

  @override
  String get recommendationSystemSubtitle =>
      'Use the Moonfin Recommends local-library algorithm or the online TMDb\'s Similarity Metrics. Note: Online recommendations require Seerr integration.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'TMDb Similarity';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Apply Parental Rating Cap?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limit Moonfin Recommends suggestions by parental rating of target media';

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
  String get glassQuality => 'Glass Quality';

  @override
  String get glassQualitySubtitle =>
      'Auto picks the best glass effect for this device. Full forces real blur; Reduced uses a lightweight glass that saves GPU power.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Full';

  @override
  String get glassQualityReduced => 'Reduced';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Canvia entre Moonfin i Neon Pulse sense reiniciar l\'aplicació';

  @override
  String get customThemeTitle => 'Custom Theme';

  @override
  String get customThemeSubtitle =>
      'Custom themes alter visual elements across Moonfin. Choose one of these options to suit your style.';

  @override
  String get keyboardPreferSystemIme => 'Preferiu el teclat del sistema';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Utilitzeu el mètode d\'entrada del dispositiu de manera predeterminada per a l\'entrada de text';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'L\'aspecte actual de Moonfin que tots us heu encantat';

  @override
  String get themeNeonPulse => 'pols de neó';

  @override
  String get themeNeonPulseSubtitle =>
      'Estil Synthwave amb resplendor magenta, text cian i contrast de crom més fort';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Estil Liquid Glass amb un fons de gradient en moviment, superfícies esmerilades i accent blau Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Retro pixel-art styling with a chunky palette, blocky borders, hard drop-shadows, and a pixel font';

  @override
  String get embyConnectSignInSubtitle =>
      'Inicieu la sessió amb el vostre compte Emby Connect';

  @override
  String get emailOrUsername => 'Correu electrònic o nom d\'usuari';

  @override
  String get selectAServer => 'Seleccioneu un servidor';

  @override
  String get tryAgain => 'Torna-ho a provar';

  @override
  String get noLinkedServers =>
      'No hi ha cap servidor enllaçat a aquest compte Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Credencials Emby Connect no vàlides';

  @override
  String get invalidEmbyConnectLogin =>
      'El nom d\'usuari o la contrasenya de Emby Connect no són vàlids';

  @override
  String get embyConnectExchangeNotSupported =>
      'El servidor no admet l\'intercanvi Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Error de xarxa en contactar amb Emby Connect o amb el servidor seleccionat';

  @override
  String get loadingLinkedServers =>
      'S\'estan carregant servidors enllaçats...';

  @override
  String get connectingToServerEllipsis => 'S\'està connectant al servidor...';

  @override
  String get noReachableAddress =>
      'No s\'ha proporcionat cap adreça accessible';

  @override
  String get invalidServerExchangeResponse =>
      'Resposta no vàlida del punt final d\'intercanvi de servidors';

  @override
  String unableToConnectTo(String target) {
    return 'No es pot connectar a $target';
  }

  @override
  String get exitApp => 'Sortir de Moonfin?';

  @override
  String get exitAppConfirmation => 'Esteu segur que voleu sortir?';

  @override
  String get exit => 'Sortida';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Paused';

  @override
  String get gameSaveState => 'Save state';

  @override
  String get gameLoadState => 'Load state';

  @override
  String get gameFastForward => 'Fast-forward';

  @override
  String get gameEmulatorSettings => 'Emulator settings';

  @override
  String get gameNoCoreOptions => 'This core has no adjustable options.';

  @override
  String get gameHoldToOpenMenu => 'Hold to open menu';

  @override
  String get gamePlaybackUnsupported =>
      'Game playback is not supported on this device yet.';

  @override
  String get noHomeRowsLoaded => 'No s\'ha pogut carregar cap fila inicial';

  @override
  String get noHomeRowsHint =>
      'Proveu d\'actualitzar o reduir les seccions de casa actives.';

  @override
  String get retryHomeRows => 'Torneu a provar les files d\'inici';

  @override
  String get guide => 'Guia';

  @override
  String get recordings => 'Enregistraments';

  @override
  String get schedule => 'Horari';

  @override
  String get series => 'Sèrie';

  @override
  String get noItemsFound => 'No s\'han trobat elements';

  @override
  String get home => 'a casa';

  @override
  String get browseAll => 'Exploreu-ho tot';

  @override
  String get genres => 'Gèneres';

  @override
  String get collectionPlaceholder =>
      'Els elements de la col·lecció apareixeran aquí';

  @override
  String get browseByLetter => 'Navega per lletra';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'La navegació alfabètica apareixerà aquí';

  @override
  String get suggestions => 'Suggeriments';

  @override
  String get suggestionsPlaceholder =>
      'Els elements suggerits apareixeran aquí';

  @override
  String get failedToLoadLibraries =>
      'No s\'han pogut carregar les biblioteques';

  @override
  String get noLibrariesFound => 'No s\'han trobat biblioteques';

  @override
  String get library => 'Biblioteca';

  @override
  String get displaySettings => 'Configuració de la pantalla';

  @override
  String get allGenres => 'Tots els Gèneres';

  @override
  String get noGenresFound => 'No s\'han trobat gèneres';

  @override
  String failedToLoadFolderError(String error) {
    return 'No s\'ha pogut carregar la carpeta: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Aquesta carpeta està buida';

  @override
  String itemCountLabel(int count) {
    return '$count elements';
  }

  @override
  String get failedToLoadFavorites => 'No s\'han pogut carregar els preferits';

  @override
  String get retry => 'Torna-ho a provar';

  @override
  String get noFavoritesYet => 'Encara no hi ha cap favorit';

  @override
  String get favorites => 'Preferits';

  @override
  String totalCountItems(int count) {
    return '$count Elements';
  }

  @override
  String get continuing => 'Continuant';

  @override
  String get ended => 'S\'ha acabat';

  @override
  String get sortAndFilter => 'Ordena i filtra';

  @override
  String get type => 'Tipus';

  @override
  String get sortBy => 'Ordena per';

  @override
  String get display => 'Mostra';

  @override
  String get imageType => 'Tipus d\'imatge';

  @override
  String get posterSize => 'Mida del cartell';

  @override
  String get small => 'Petit';

  @override
  String get medium => 'Mitjana';

  @override
  String get large => 'Gran';

  @override
  String get extraLarge => 'Extragran';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Gèneres';
  }

  @override
  String get views => 'Vistes';

  @override
  String get albums => 'Àlbums';

  @override
  String get albumArtists => 'Artistes de l\'àlbum';

  @override
  String get artists => 'Artistes';

  @override
  String get bookmarks => 'Adreces d\'interès';

  @override
  String get noSavedBookmarks =>
      'Encara no hi ha cap marcador desat per a aquest títol.';

  @override
  String get openBook => 'Llibre Obert';

  @override
  String get chapter => 'Capítol';

  @override
  String get page => 'Pàgina';

  @override
  String get bookmark => 'Marcador';

  @override
  String get justNow => 'Just ara';

  @override
  String minutesAgo(int count) {
    return 'Fa ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'Fa ${count}h';
  }

  @override
  String daysAgo(int count) {
    return 'Fa ${count}d';
  }

  @override
  String get discoverySubjects => 'Matèries de descoberta';

  @override
  String get pickDiscoverySubjects =>
      'Trieu quins feeds de temes voleu mostrar a Discover.';

  @override
  String get apply => 'Aplicar';

  @override
  String get openLink => 'Obriu l\'enllaç';

  @override
  String get scanWithYourPhone => 'Escaneja amb el teu telèfon';

  @override
  String get audiobookGenres => 'Gèneres d\'audiollibres';

  @override
  String get pickAudiobookGenres =>
      'Trieu quins gèneres voleu mostrar a Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Descobreix Audiollibres';

  @override
  String get librivoxDescription =>
      'Títols de domini públic populars de LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count títols';
  }

  @override
  String get scrollLeft => 'Desplaça\'t cap a l\'esquerra';

  @override
  String get scrollRight => 'Desplaceu-vos cap a la dreta';

  @override
  String get couldNotLoadGenre =>
      'No s\'ha pogut carregar aquest gènere en aquest moment.';

  @override
  String get continueReading => 'Continuar llegint';

  @override
  String get savedHighlights => 'Destacats destacats';

  @override
  String get continueListening => 'Continuar escoltant';

  @override
  String get listen => 'Escolta';

  @override
  String get resume => 'Currículum';

  @override
  String get failedToLoadLibrary => 'No s\'ha pogut carregar la biblioteca';

  @override
  String get popularNow => 'Popular ara';

  @override
  String get savedForLater => 'Guardat per a més tard';

  @override
  String get topListens => 'Les millors escoltes';

  @override
  String get unreadDiscoveries => 'Descobriments no llegits';

  @override
  String get pickUpAgain => 'Tornar a recollir';

  @override
  String get bookHighlightsDescription =>
      'Els teus llibres amb els aspectes més destacats, els preferits o el progrés de la lectura.';

  @override
  String get handPickedFromLibrary => 'Triat a mà de la vostra biblioteca.';

  @override
  String get handPickedFromListeningQueue =>
      'Triat a mà de la vostra cua d\'escolta.';

  @override
  String get booksWithHighlights =>
      'Llibres amb aspectes destacats, preferits o progrés de lectura.';

  @override
  String get jumpBackNarration =>
      'Torna a la narració sense buscar el teu lloc.';

  @override
  String get unreadBooksReady =>
      'Llibres sense llegir preparats per a la propera hora tranquil·la.';

  @override
  String get quickAccessFavorites =>
      'Accés ràpid als llibres als quals continues tornant.';

  @override
  String get searchAudiobooks => 'Cerca audiollibres';

  @override
  String get searchYourLibrary => 'Cerca a la teva biblioteca';

  @override
  String get pickUpStory => 'Reprèn la història on ho vas deixar';

  @override
  String get savedPlacesChapters =>
      'Els vostres llocs desats i capítols sense acabar';

  @override
  String authorsCount(int count) {
    return '$count autors';
  }

  @override
  String genresCount(int count) {
    return '$count gèneres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% completat';
  }

  @override
  String get readyWhenYouAre => 'A punt quan estiguis';

  @override
  String get details => 'Detalls';

  @override
  String get listeningRoom => 'Sala d\'escolta';

  @override
  String get bookmarksAndProgress => 'Adreces d\'interès i progrés';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count Títols disposats per a la primera lectura.';
  }

  @override
  String get titles => 'Títols';

  @override
  String get allTitles => 'Tots els títols';

  @override
  String get authors => 'Autors';

  @override
  String get browseByAuthor => 'Navega per autor';

  @override
  String get browseByGenre => 'Navega per gènere';

  @override
  String get discover => 'Descobreix';

  @override
  String get trendingTitlesOpenLibrary =>
      'Títols de tendència per assignatura d\'Open Library.';

  @override
  String get noBookmarkedItems => 'Encara no hi ha cap element marcat';

  @override
  String get nothingMatchesSection =>
      'Encara no hi ha res que coincideixi amb aquesta secció. Prova una altra pestanya o torna quan finalitzi la sincronització de la biblioteca.';

  @override
  String get audiobooks => 'Audiollibres';

  @override
  String noLabelFound(String label) {
    return 'No s\'ha trobat cap $label';
  }

  @override
  String get folder => 'Carpeta';

  @override
  String get filters => 'Filtres';

  @override
  String get readingStatus => 'Estat de lectura';

  @override
  String get playedStatus => 'Estat de reproducció';

  @override
  String get readStatus => 'Llegeix';

  @override
  String get watched => 'Mirat';

  @override
  String get unread => 'Sense llegir';

  @override
  String get unwatched => 'Sense mirar';

  @override
  String get seriesStatus => 'Estat de la sèrie';

  @override
  String get allLibraries => 'Totes les Biblioteques';

  @override
  String get books => 'Llibres';

  @override
  String get latestBooks => 'Latest Books';

  @override
  String get latestAudiobooks => 'Latest Audiobooks';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count books',
      one: '1 book',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Book';

  @override
  String get bookFormatAudiobook => 'Audiobook';

  @override
  String bookPercentRead(int percent) {
    return '$percent% read';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time left';
  }

  @override
  String get bookHeroRead => 'Read';

  @override
  String get bookHeroListen => 'Listen';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Autor desconegut';

  @override
  String get uncategorized => 'Sense categoria';

  @override
  String get overview => 'Visió general';

  @override
  String get noLibrivoxDescription =>
      'LibriVox encara no ha proporcionat cap descripció per a aquest títol.';

  @override
  String get readers => 'Lectors';

  @override
  String get openLinks => 'Obriu Enllaços';

  @override
  String get librivoxPage => 'Pàgina de LibriVox';

  @override
  String get internetArchive => 'Arxiu d\'Internet';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Descarrega Zip';

  @override
  String sectionCountLabel(int count) {
    return '$count seccions';
  }

  @override
  String firstPublished(int year) {
    return 'Publicat per primera vegada $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Encara no hi ha cap visió general disponible a Open Library per a aquest títol.';

  @override
  String get subjects => 'Matèries';

  @override
  String get all => 'Tots';

  @override
  String booksCount(int count) {
    return '$count llibres';
  }

  @override
  String get couldNotLoadSubject =>
      'No s\'ha pogut carregar aquest tema ara mateix.';

  @override
  String get audiobookDetails => 'Detalls del audiollibre';

  @override
  String authorsCountTitle(int count) {
    return '$count Autors';
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
  String get trackList => 'Llista de pistes';

  @override
  String get itemListPlaceholder => 'La llista d\'elements apareixerà aquí';

  @override
  String get favoriteTracksPlaceholder =>
      'Les cançons preferides apareixeran aquí';

  @override
  String get failedToLoad => 'No s\'ha pogut carregar';

  @override
  String get delete => 'Suprimeix';

  @override
  String get save => 'Desa';

  @override
  String get moreLikeThis => 'Més així';

  @override
  String get castAndCrew => 'Repartiment i equip';

  @override
  String get collection => 'Col·lecció';

  @override
  String get episodes => 'Episodis';

  @override
  String get nextUp => 'A continuació';

  @override
  String get seasons => 'Temporades';

  @override
  String get chapters => 'Capítols';

  @override
  String get features => 'Característiques';

  @override
  String get movies => 'Pel·lícules';

  @override
  String get musicVideos => 'Vídeos musicals';

  @override
  String get other => 'Altres';

  @override
  String get discography => 'Discografia';

  @override
  String get similarArtists => 'Artistes similars';

  @override
  String get tableOfContents => 'Taula de continguts';

  @override
  String get tracklist => 'Llista de cançons';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'Detalls de l\'autor';

  @override
  String get noOverviewAvailable =>
      'Encara no hi ha cap descripció general disponible per a aquest títol.';

  @override
  String get noBiographyAvailable =>
      'No hi ha biografia disponible per a aquest autor.';

  @override
  String get noBooksFound => 'No s\'han trobat llibres per a aquest autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'No es poden carregar els detalls de l\'autor en aquest moment.';

  @override
  String published(int year) {
    return 'Publicat $year';
  }

  @override
  String get publicationDateUnknown => 'Data de publicació desconeguda';

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
    return 'Acaba a $time';
  }

  @override
  String get items => 'Items';

  @override
  String get extras => 'Extras';

  @override
  String get behindTheScenes => 'Behind the Scenes';

  @override
  String get deletedScenes => 'Deleted Scenes';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scenes';

  @override
  String get shorts => 'Shorts';

  @override
  String get trailers => 'Remolcs';

  @override
  String timeRemaining(String time) {
    return '$time remaining';
  }

  @override
  String endsIn(String time) {
    return 'Finalitza en $time';
  }

  @override
  String get view => 'Veure';

  @override
  String get resumeReading => 'Reprendre la lectura';

  @override
  String get read => 'Llegeix';

  @override
  String resumeFrom(String position) {
    return 'Resum de $position';
  }

  @override
  String get play => 'Reproduir';

  @override
  String get startOver => 'Torna a començar';

  @override
  String get restart => 'Reinicieu';

  @override
  String get readOffline => 'Llegeix fora de línia';

  @override
  String get playOffline => 'Reproducció fora de línia';

  @override
  String get audio => 'Àudio';

  @override
  String get subtitles => 'Subtítols';

  @override
  String get version => 'Versió';

  @override
  String get cast => 'Cast';

  @override
  String get trailer => 'Tràiler';

  @override
  String get finished => 'Acabat';

  @override
  String get favorited => 'Favorit';

  @override
  String get favorite => 'Favorit';

  @override
  String get playlist => 'Llista de reproducció';

  @override
  String get downloaded => 'Descarregat';

  @override
  String get downloadAll => 'Descarrega-ho tot';

  @override
  String get download => 'Descarregar';

  @override
  String get deleteDownloaded => 'Suprimeix els descarregats';

  @override
  String get goToSeries => 'Vés a Sèrie';

  @override
  String get editMetadata => 'Edita les metadades';

  @override
  String get less => 'Menys';

  @override
  String get more => 'Més';

  @override
  String get deleteItem => 'Suprimeix l\'element';

  @override
  String get deletePlaylist => 'Suprimeix la llista de reproducció';

  @override
  String get deletePlaylistMessage =>
      'Vols suprimir aquesta llista de reproducció del servidor?';

  @override
  String get deleteItemMessage => 'Vols suprimir aquest element del servidor?';

  @override
  String get failedToDeletePlaylist =>
      'No s\'ha pogut suprimir la llista de reproducció';

  @override
  String get failedToDeleteItem => 'No s\'ha pogut suprimir l\'element';

  @override
  String get renamePlaylist => 'Canvia el nom de la llista de reproducció';

  @override
  String get playlistName => 'Nom de la llista de reproducció';

  @override
  String get deleteDownloadedAlbum => 'Suprimeix l\'àlbum baixat';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Vols suprimir les pistes baixades per a \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'S\'han suprimit les pistes baixades';

  @override
  String get downloadedTracksDeleteFailed =>
      'Algunes pistes baixades no s\'han pogut suprimir';

  @override
  String get noTracksLoaded => 'No s\'ha carregat cap pista';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'No s\'ha carregat $itemLabel';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'S\'estan baixant elements $title ($count)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Esteu segur que voleu suprimir \"$name\" del servidor? Aquesta acció no es pot desfer.';
  }

  @override
  String get itemDeleted => 'Element suprimit';

  @override
  String get noPlayableTrailerFound => 'No s\'ha trobat cap tràiler.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Format de llibre no compatible: .$extension';
  }

  @override
  String get audioTrack => 'Pista d\'àudio';

  @override
  String get subtitleTrack => 'Pista de subtítols';

  @override
  String get none => 'Cap';

  @override
  String get downloadSubtitlesLabel => 'Descarrega els subtítols...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Cerca amb el connector OpenSubtitles';

  @override
  String get downloadSubtitles => 'Descarrega els subtítols';

  @override
  String get selectedSubtitleInvalid => 'El subtítol seleccionat no és vàlid.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtítol baixat i seleccionat: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Subtítols descarregats. Pot trigar un moment a aparèixer mentre Jellyfin actualitza l\'element.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No s\'han trobat subtítols remots per a $language.';
  }

  @override
  String get selectVersion => 'Seleccioneu Versió';

  @override
  String versionNumber(int number) {
    return 'Versió $number';
  }

  @override
  String get downloadAllQuality => 'Baixeu-ho tot — Qualitat';

  @override
  String get downloadQuality => 'Qualitat de descàrrega';

  @override
  String get originalFileNoReencoding => 'Fitxer original, sense recodificació';

  @override
  String get originalFilesNoReencoding =>
      'Fitxers originals, sense recodificació';

  @override
  String get noEpisodesLoaded => 'No s\'ha carregat cap capítol';

  @override
  String downloadingItem(String name, String quality) {
    return 'S\'està baixant $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Suprimeix els fitxers descarregats';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Vols suprimir els fitxers locals per a $typeLabel?\n\nAixò alliberarà espai d\'emmagatzematge. Podeu tornar a descarregar-lo més tard.';
  }

  @override
  String get downloadedFilesDeleted => 'S\'han suprimit els fitxers baixats';

  @override
  String get failedToDeleteFiles => 'No s\'han pogut suprimir els fitxers';

  @override
  String get deleteFiles => 'Suprimeix fitxers';

  @override
  String get director => 'DIRECTORA';

  @override
  String get directors => 'DIRECTORS';

  @override
  String get writer => 'GUIONISTA';

  @override
  String get writers => 'ESCRITORS';

  @override
  String get studio => 'ESTUDI';

  @override
  String studioMoreCount(int count) {
    return '+$count més';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episodis';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episodi $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Capítol $number';
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
    return 'Nascut $date';
  }

  @override
  String died(String date) {
    return 'Mort $date';
  }

  @override
  String age(int age) {
    return 'Edat $age';
  }

  @override
  String get showLess => 'Mostra menys';

  @override
  String get readMore => 'Llegeix més';

  @override
  String get shuffle => 'Barrejar';

  @override
  String get shuffleAllMusic => 'Shuffle all music';

  @override
  String get carSignInPrompt => 'Sign in to Moonfin on your phone';

  @override
  String get carServerUnreachable => 'Can\'t reach your server';

  @override
  String downloadsCount(int count) {
    return '$count descàrregues';
  }

  @override
  String get perfectMatch => 'Partit perfecte';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'estèreo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'El subtítol remot $action requereix el permís de gestió de subtítols Jellyfin per a aquest usuari.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Aquest element no s\'ha pogut trobar al servidor per al subtítol remot $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'El subtítol remot $action ha fallat: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'El subtítol remot $action ha fallat (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Error en $action subtítols remots.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'tots els episodis baixats per a \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'tots els episodis baixats d\'aquesta temporada';

  @override
  String get stillWatching => 'Encara estàs mirant?';

  @override
  String get unableToLoadTrailerStream =>
      'No es pot carregar el flux del tràiler.';

  @override
  String get trailerTimedOut => 'El tràiler s\'ha esgotat durant la càrrega.';

  @override
  String get playbackFailedForTrailer =>
      'La reproducció d\'aquest tràiler ha fallat.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'L\'emissió no està disponible durant la reproducció fora de línia.';

  @override
  String castActionFailed(String label, String error) {
    return 'L\'acció $label ha fallat: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'No s\'ha pogut establir el volum d\'emissió: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controls';
  }

  @override
  String get deviceVolume => 'Volum del dispositiu';

  @override
  String get unavailable => 'No disponible';

  @override
  String get pause => 'Pausa';

  @override
  String get syncPosition => 'Posició de sincronització';

  @override
  String stopCast(String label) {
    return 'Atura $label';
  }

  @override
  String get queueIsEmpty => 'La cua està buida';

  @override
  String trackNumber(int number) {
    return 'Seguiment $number';
  }

  @override
  String get remotePlayback => 'Reproducció remota';

  @override
  String get castingToGoogleCast => 'Emet a Google Cast';

  @override
  String get castingViaAirPlay => 'Emissió mitjançant AirPlay';

  @override
  String get castingViaDlna => 'Emissió mitjançant DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds segons';
  }

  @override
  String get longPressToUnlock => 'Premeu llargament per desbloquejar';

  @override
  String get off => 'Apagat';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automàtic';

  @override
  String bitrateValueMbps(int mbps) {
    return '$mbps Mbps';
  }

  @override
  String get bitrateOverride => 'Anulació de la taxa de bits';

  @override
  String get audioDelay => 'Retard d\'àudio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Retard dels subtítols';

  @override
  String get reset => 'Restableix';

  @override
  String get unknown => 'Desconegut';

  @override
  String get playbackInformation => 'Informació de reproducció';

  @override
  String get playback => 'Reproducció';

  @override
  String get playMethod => 'Mètode de reproducció';

  @override
  String get directPlay => 'Reproducció nativa';

  @override
  String get directStream => 'Transmissió directa';

  @override
  String get transcoding => 'Transcodificació';

  @override
  String get transcodeReasons => 'Raons de transcodificació';

  @override
  String get player => 'Reproductor';

  @override
  String get container => 'Contenidor';

  @override
  String get bitrate => 'Taxa de bits';

  @override
  String get video => 'Vídeo';

  @override
  String get resolution => 'Resolució';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Còdec';

  @override
  String get videoBitrate => 'Velocitat de bits de vídeo';

  @override
  String get track => 'Pista';

  @override
  String get channels => 'Canals';

  @override
  String get audioBitrate => 'Taxa de bits d\'àudio';

  @override
  String get sampleRate => 'Freqüència de mostreig';

  @override
  String get format => 'Format';

  @override
  String get external => 'Extern';

  @override
  String get embedded => 'Incrustat';

  @override
  String castSessionError(String protocol) {
    return 'Error de sessió $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'No s\'han pogut carregar els detalls del llibre: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'La representació d\'EPUB a l\'aplicació encara no està disponible en aquesta plataforma.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Aquest format (.$extension) encara no es pot representar a l\'aplicació.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'La representació de documents incrustats no està disponible en aquesta plataforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'No s\'ha pogut obrir el visualitzador extern.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'No s\'ha pogut obrir el lector de l\'aplicació: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'El marcador ja s\'ha desat a $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Marcador afegit: $label';
  }

  @override
  String get noBookmarksYet =>
      'Encara no hi ha cap marcador.\nToqueu la icona del marcador mentre llegiu per desar la vostra posició.';

  @override
  String get noTableOfContentsAvailable => 'No hi ha contingut disponible';

  @override
  String pageLabel(int number) {
    return 'Pàgina $number';
  }

  @override
  String get position => 'Posició';

  @override
  String get bookReader => 'Lector de llibres';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% llegit';
  }

  @override
  String get updating => 'S\'està actualitzant...';

  @override
  String get markUnread => 'Marca com no llegit';

  @override
  String get markAsRead => 'Marca com a llegit';

  @override
  String get reloadReader => 'Torna a carregar el lector';

  @override
  String get noPagesFound => 'No s\'han trobat pàgines.';

  @override
  String get failedToDecodePageImage =>
      'No s\'ha pogut descodificar la imatge de la pàgina.';

  @override
  String resetZoom(String zoom) {
    return 'Restableix el zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Pàgina única';

  @override
  String get twoPageSpread => 'Difusió de dues pàgines';

  @override
  String get addBookmark => 'Afegeix un marcador';

  @override
  String get bookmarksEllipsis => 'Adreces d\'interès...';

  @override
  String get markedAsRead => 'Marcat com a llegit';

  @override
  String get markedAsUnread => 'Marcat com a no llegit';

  @override
  String failedToUpdateReadState(String error) {
    return 'No s\'ha pogut actualitzar l\'estat de lectura: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Llum';

  @override
  String get themeDark => 'Tema: fosc';

  @override
  String get themeSepia => 'Tema: Sèpia';

  @override
  String get invertColorsFixedLayout =>
      'Inverteix els colors (disposició fixa)';

  @override
  String get invertColorsPdf => 'Inverteix els colors (PDF)';

  @override
  String get preparingInAppReader =>
      'S\'està preparant el lector de l\'aplicació...';

  @override
  String get pdfDataNotAvailable => 'Dades PDF no disponibles.';

  @override
  String get readerFallbackModeActive => 'Mode de reserva del lector actiu';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Aquesta plataforma no pot allotjar el motor de documents incrustat per als fitxers $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Utilitzeu Reload Reader després de canviar a un objectiu de plataforma compatible (Android, iOS, macOS).';

  @override
  String get openExternally => 'Obrir Externament';

  @override
  String get noEpubChaptersFound => 'No s\'han trobat capítols EPUB.';

  @override
  String get readerNotReady => 'El lector no està preparat.';

  @override
  String get seriesRecordings => 'Enregistraments de sèries';

  @override
  String get now => 'Ara';

  @override
  String get sports => 'Esports';

  @override
  String get news => 'Notícies';

  @override
  String get kids => 'Nens';

  @override
  String get premiere => 'Estrena';

  @override
  String get guideTimeline => 'Cronologia de la guia';

  @override
  String failedToLoadGuide(String error) {
    return 'No s\'ha pogut carregar la guia: $error';
  }

  @override
  String get noChannelsFound => 'No s\'han trobat canals';

  @override
  String get liveBadge => 'EN VIU';

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
  String get movie => 'Pel·lícula';

  @override
  String get removedFromFavoriteChannels =>
      'S\'ha eliminat dels canals preferits';

  @override
  String get addedToFavoriteChannels => 'S\'ha afegit als canals preferits';

  @override
  String get failedToUpdateFavoriteChannel =>
      'No s\'ha pogut actualitzar el canal preferit';

  @override
  String get unfavoriteChannel => 'Desafavoreix el canal';

  @override
  String get favoriteChannel => 'Canal preferit';

  @override
  String get record => 'Registre';

  @override
  String get cancelRecordingAction => 'Cancel·la la gravació';

  @override
  String get programSetToRecord => 'Programa configurat per gravar';

  @override
  String get recordingCancelled => 'Enregistrament cancel·lat';

  @override
  String get unableToCreateRecording => 'No es pot crear la gravació';

  @override
  String get watch => 'Mira';

  @override
  String get close => 'Tancar';

  @override
  String failedToPlayChannel(String name) {
    return 'No s\'ha pogut reproduir $name';
  }

  @override
  String get failedToLoadRecordings =>
      'No s\'han pogut carregar les gravacions';

  @override
  String get scheduledInNext24Hours => 'Programat en les properes 24 hores';

  @override
  String get recentRecordings => 'Enregistraments recents';

  @override
  String get tvSeries => 'Sèrie de televisió';

  @override
  String get failedToLoadSchedule => 'No s\'ha pogut carregar la programació';

  @override
  String get noScheduledRecordings => 'No hi ha enregistraments programats';

  @override
  String get cancelRecording => 'Cancel·lar la gravació?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel·lar l\'enregistrament programat de \"$name\"?';
  }

  @override
  String get no => 'No';

  @override
  String get yesCancel => 'Sí, cancel·la';

  @override
  String get failedToCancelRecording => 'No s\'ha pogut cancel·lar la gravació';

  @override
  String get failedToLoadSeriesRecordings =>
      'No s\'han pogut carregar els enregistraments de la sèrie';

  @override
  String get noSeriesRecordings => 'No hi ha enregistraments de sèrie';

  @override
  String get cancelSeriesRecording => 'Cancel·la la gravació de la sèrie';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Cancel·lar la gravació de la sèrie?';

  @override
  String stopRecordingName(String name) {
    return 'Voleu deixar de gravar \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'No s\'ha pogut cancel·lar la gravació de la sèrie';

  @override
  String get searchThisLibrary => 'Cerca en aquesta biblioteca...';

  @override
  String get searchEllipsis => 'Cerca...';

  @override
  String noResultsForQuery(String query) {
    return 'No hi ha resultats per a \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'La cerca ha fallat: $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Tipus de compte de Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Local';

  @override
  String get savedMedia => 'Mitjans desats';

  @override
  String get tvShows => 'Programes de televisió';

  @override
  String get music => 'Música';

  @override
  String get musicAlbums => 'Àlbums de música';

  @override
  String get noMediaInFilter =>
      'No hi ha contingut multimèdia en aquest filtre';

  @override
  String get noDownloadedMediaYet => 'Encara no s\'ha baixat cap mitjà';

  @override
  String get browseLibrary => 'Explora la biblioteca';

  @override
  String get deleteDownload => 'Suprimeix la descàrrega';

  @override
  String removeItemAndFiles(String name) {
    return 'Vols suprimir \"$name\" i els seus fitxers?';
  }

  @override
  String tracksCount(int count) {
    return '$count pistes';
  }

  @override
  String get album => 'Àlbum';

  @override
  String get playAlbum => 'Reprodueix l\'àlbum';

  @override
  String failedToLoadAlbum(String error) {
    return 'No s\'ha pogut carregar l\'àlbum: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No s\'han trobat cançons baixades per a $name.';
  }

  @override
  String get season => 'Temporada';

  @override
  String get errorLoadingEpisodes =>
      'S\'ha produït un error en carregar els episodis';

  @override
  String get noDownloadedEpisodes => 'No s\'ha baixat cap episodi';

  @override
  String get deleteEpisode => 'Suprimeix l\'episodi';

  @override
  String removeName(String name) {
    return 'Eliminar \"$name\"?';
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
    return 'Episodi $number';
  }

  @override
  String get seriesNotFound => 'No s\'ha trobat la sèrie';

  @override
  String get errorLoadingSeries =>
      'S\'ha produït un error en carregar la sèrie';

  @override
  String get downloadedEpisodes => 'Episodis descarregats';

  @override
  String seasonNumber(int number) {
    return 'Temporada $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Especials';

  @override
  String get deleteSeason => 'Suprimeix la temporada';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Vols suprimir tots els episodis baixats a $season?';
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
  String get storageManagement => 'Gestió d\'emmagatzematge';

  @override
  String get storageBreakdown => 'Avaria de l\'emmagatzematge';

  @override
  String get downloadedItems => 'Elements descarregats';

  @override
  String get storageLimit => 'Límit d\'emmagatzematge';

  @override
  String get noLimit => 'Sense límit';

  @override
  String get deleteAllDownloads => 'Suprimeix totes les descàrregues';

  @override
  String get deleteAllDownloadsWarning =>
      'Això eliminarà tots els fitxers multimèdia descarregats i no es pot desfer.';

  @override
  String get deleteAll => 'Suprimeix-ho tot';

  @override
  String get deleteSelected => 'Suprimeix el seleccionat';

  @override
  String deleteSelectedCount(int count) {
    return 'Vols suprimir $count els elements baixats?';
  }

  @override
  String get musicAndAudiobooks => 'Música i audiollibres';

  @override
  String get images => 'Imatges';

  @override
  String get database => 'Base de dades';

  @override
  String ofStorageLimit(String limit) {
    return 'del límit de $limit';
  }

  @override
  String get settings => 'Configuració';

  @override
  String get authentication => 'Autenticació';

  @override
  String get autoLoginServerManagement =>
      'Inici de sessió automàtic, gestió del servidor';

  @override
  String get pinCode => 'Codi PIN';

  @override
  String get setUpPinCodeProtection => 'Configura la protecció del codi PIN';

  @override
  String get parentalControls => 'Controls parentals';

  @override
  String get contentRatingRestrictions =>
      'Restriccions de classificació del contingut';

  @override
  String get bitRateResolutionBehavior => 'Bitrate, resolució, comportament';

  @override
  String get languageSizeAppearance => 'Llengua, mida, aparença';

  @override
  String get qualityStorage => 'Qualitat, emmagatzematge';

  @override
  String get serverSyncAndPluginStatus =>
      'Sincronització del servidor i estat del connector';

  @override
  String get mediaRequestIntegration => 'Integració de sol·licituds de mitjans';

  @override
  String get switchServer => 'Canvia de servidor';

  @override
  String get signOut => 'Tanca la sessió';

  @override
  String get versionLicenses => 'Versió, llicències';

  @override
  String get account => 'Compte';

  @override
  String get signInAndSecurity => 'Inici de sessió i seguretat';

  @override
  String get administration => 'Administració';

  @override
  String get serverSettingsUsersLibraries =>
      'Configuració del servidor, usuaris, biblioteques';

  @override
  String get customization => 'Personalització';

  @override
  String get themeAndLayout => 'Tema i maquetació';

  @override
  String get videoAndSubtitles => 'Vídeo i subtítols';

  @override
  String get integrations => 'Integracions';

  @override
  String get pluginAndRequests => 'Connector i peticions';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalitza el comportament del compte, la reproducció i la interfície';

  @override
  String optionsCount(int count) {
    return '$count opcions';
  }

  @override
  String get themeAndAppearance => 'Tema i aparença';

  @override
  String get focusBorderColor => 'Color de la vora del focus';

  @override
  String get watchedIndicators => 'Indicadors observats';

  @override
  String get always => 'Sempre';

  @override
  String get hideUnwatched => 'Amaga sense veure';

  @override
  String get episodesOnly => 'Només episodis';

  @override
  String get never => 'Mai';

  @override
  String get focusExpansionAnimation => 'Animació d\'expansió del focus';

  @override
  String get desktopUiScale => 'Escala d\'interfície d\'usuari d\'escriptori';

  @override
  String get scaleFocusedCards =>
      'Escala targetes i fitxes enfocades o posades';

  @override
  String get backgroundBackdrops => 'Fons de fons';

  @override
  String get showBackdropImages =>
      'Mostra imatges de fons darrere del contingut';

  @override
  String get seriesThumbnails => 'Miniatures de la sèrie';

  @override
  String get seriesThumbnailsDescription =>
      'Només els episodis: utilitzeu obres d\'art de sèrie que coincideixin amb cada tipus d\'imatge de fila';

  @override
  String get homeRowInfoOverlay =>
      'Superposició d\'informació de la fila inicial';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Mostra el títol i les metadades quan navegueu per les files d\'inici';

  @override
  String get clockDisplay => 'Visualització del rellotge';

  @override
  String get inMenus => 'En Menús';

  @override
  String get inVideo => 'En vídeo';

  @override
  String get seasonalEffects => 'Efectes estacionals';

  @override
  String get seasonalEffectsDescription =>
      'Efectes visuals i decoracions de temporada';

  @override
  String get snow => 'Neu';

  @override
  String get fireworks => 'Focs artificials';

  @override
  String get confetti => 'Confetti';

  @override
  String get fallingLeaves => 'Fulles que cauen';

  @override
  String get themeMusic => 'Tema Música';

  @override
  String get playThemeMusicOnDetailPages =>
      'Reprodueix música temàtica a les pàgines de detalls';

  @override
  String get themeMusicVolume => 'Tema Música Volum';

  @override
  String get themeMusicSettingsSubtitle =>
      'Detail pages, home rows, and volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Música temàtica a Home Rows';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Reprodueix quan navegues per la pantalla d\'inici';

  @override
  String get loopThemeMusic => 'Loop Theme Music';

  @override
  String get loopThemeMusicSubtitle =>
      'Repeat the track instead of playing it once';

  @override
  String get detailsBackgroundBlur => 'Detalls Desenfocament de fons';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Desenfocament de fons de navegació';

  @override
  String get maxStreamingBitrate => 'Taxa de bits de transmissió màxima';

  @override
  String get maxResolution => 'Resolució màxima';

  @override
  String get playerZoomMode => 'Mode de zoom del reproductor';

  @override
  String get settingsScrollWheelAction => 'rodeta del ratolí';

  @override
  String get settingsScrollWheelActionDescription =>
      'Escolliu què fa la rodeta del ratolí durant la reproducció del vídeo.';

  @override
  String get scrollWheelActionOff => 'Desactivar';

  @override
  String get scrollWheelActionSeek => 'Salta (endavant / enrere)';

  @override
  String get scrollWheelActionVolume => 'Volum';

  @override
  String get playerTooltipVolume => 'Volum';

  @override
  String get fit => 'Fit';

  @override
  String get autoCrop => 'Retall automàtic';

  @override
  String get stretch => 'Estirar';

  @override
  String get refreshRateSwitching => 'Canvi de freqüència d\'actualització';

  @override
  String get disabled => 'Inhabilitat';

  @override
  String get scaleOnTv => 'Escala a la televisió';

  @override
  String get scaleOnDevice => 'Escala al dispositiu';

  @override
  String get trickPlay => 'Joc de trucs';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Mostra les miniatures de previsualització quan cerques';

  @override
  String get showDescriptionOnPause => 'Mostra la descripció a Pausa';

  @override
  String get dimVideoShowOverview =>
      'Atenua el vídeo i mostra el text general mentre estàs en pausa';

  @override
  String get osdLockButton => 'Botó de bloqueig OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostra un botó de bloqueig que bloqueja l\'entrada tàctil fins que estigui premut durant molt de temps';

  @override
  String get audioBehavior => 'Comportament d\'àudio';

  @override
  String get downmixToStereo => 'Downmix a estèreo';

  @override
  String get defaultAudioLanguage => 'Idioma d\'àudio per defecte';

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
  String get directStreamRemux => 'Direct Stream (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcoding (Bitrate or Resolution)';

  @override
  String get transcodingVideoAndAudio => 'Transcoding (Video & Audio)';

  @override
  String get transcodingVideo => 'Transcoding (Video)';

  @override
  String get autoServerDefault => 'Automàtic (Servidor per defecte)';

  @override
  String get english => 'Anglès';

  @override
  String get spanish => 'espanyol';

  @override
  String get french => 'francès';

  @override
  String get german => 'alemany';

  @override
  String get italian => 'italià';

  @override
  String get portuguese => 'portuguès';

  @override
  String get japanese => 'japonès';

  @override
  String get korean => 'coreà';

  @override
  String get chinese => 'xinès';

  @override
  String get russian => 'rus';

  @override
  String get arabic => 'àrab';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'holandès';

  @override
  String get swedish => 'suec';

  @override
  String get norwegian => 'noruec';

  @override
  String get danish => 'danès';

  @override
  String get finnish => 'finès';

  @override
  String get polish => 'polonès';

  @override
  String get ac3Passthrough => 'Passthrough AC3';

  @override
  String get dtsPassthrough => 'Passthrough DTS';

  @override
  String get trueHdSupport => 'Suport TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Bitstream DTS d\'àudio només a AVR; requereix suport de receptor i pista font DTS';

  @override
  String get enableTrueHdAudio =>
      'Activa l\'àudio TrueHD (pot ser que no funcioni a totes les plataformes)';

  @override
  String get settingsAudioOutputMode => 'Mode de sortida d\'àudio';

  @override
  String get settingsAudioOutputModeDescription => '';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Passthrough AVR';

  @override
  String get settingsAudioFallbackCodec => 'Còdec de reserva d\'àudio';

  @override
  String get settingsAudioFallbackCodecDescription => '';

  @override
  String get settingsAudioFallbackCodecAuto => '';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Predeterminat)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Sense perdues)';

  @override
  String get settingsAudioFallbackCodecMp3 => '';

  @override
  String get settingsAudioFallbackCodecOpus => '';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Sense perdua)';

  @override
  String get settingsMaxAudioChannels => '';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configura el nombre màxim de canals de la teva configuració d’àudio. Els fluxos multicanal que superin aquest límit es reduiran a una versió mesclada o es transcodificaran.';

  @override
  String get settingsMaxAudioChannelsAuto => '';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stereo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadraphonic';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (avançat)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough del còdec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Activa només els formats que admet el teu AVR o HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Passthrough EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'EAC3 JOC (Atmos) Passthrough';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passthrough DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passthrough DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'TrueHD Passthrough';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'TrueHD Atmos Passthrough';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) a un descodificador extern.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos sobre EAC3 (JOC) a un descodificador extern.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (inclou el nucli DTS) al descodificador extern.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD amb metadades Atmos al descodificador extern.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Capacitats d\'àudio detectades';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Encara no hi ha cap instantània de la capacitat d\'execució disponible.';

  @override
  String get settingsAudioRouteLabel => 'Ruta';

  @override
  String get settingsAudioDecodeLabel => 'Descodificar';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Ruta d\'àudio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Altaveu';

  @override
  String get settingsAudioRouteHeadphones => 'Headphones';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnòstics';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Nivell de vídeo';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Gamma de vídeo';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Còdec de subtítols';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Còdecs d\'àudio permesos';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Còdecs d\'àudio HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Còdecs d\'àudio HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'pas d\'àudio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Ruta d\'àudio actiu';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Ruta de suport d\'àudio HD';

  @override
  String get nightMode => 'Mode nocturn';

  @override
  String get compressDynamicRange => 'Comprimir el rang dinàmic';

  @override
  String get advancedMpv => 'mpv avançat';

  @override
  String get enableCustomMpvConf => 'Activa mpv.conf personalitzat';

  @override
  String get applyMpvConfBeforePlayback =>
      'Apliqueu un mpv.conf especificat per l\'usuari abans que comenci la reproducció';

  @override
  String get unsafeAdvancedMpvOptions => 'Opcions avançades mpv no segures';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permet un conjunt més ampli d\'opcions mpv. Pot trencar el comportament de reproducció.';

  @override
  String get hardwareDecoding => 'Descodificació de maquinari';

  @override
  String get hardwareDecodingSubtitle =>
      'Pot millorar el rendiment, però pot causar problemes de reproducció en alguns dispositius.';

  @override
  String get nextUpAndQueuing => 'Següent i fent cua';

  @override
  String get nextUpDisplay => 'Visualització següent';

  @override
  String get extended => 'Estesa';

  @override
  String get minimal => 'Mínim';

  @override
  String get nextUpTimeout => 'Següent temps d\'espera';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Cua de mitjans';

  @override
  String get autoQueueNextEpisodes =>
      'Posa en cua automàticament els propers episodis';

  @override
  String get stillWatchingPrompt => 'Encara està mirant el missatge';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Després dels episodis $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Reprendre i saltar';

  @override
  String get resumeRewind => 'Reprèn el rebobinat';

  @override
  String get unpauseRewind => 'Desactiva el rebobinat';

  @override
  String get fiveSeconds => '5 segons';

  @override
  String get tenSeconds => '10 segons';

  @override
  String get fifteenSeconds => '15 segons';

  @override
  String get thirtySeconds => '30 segons';

  @override
  String get skipBackLength => 'Saltar la longitud enrere';

  @override
  String get skipForwardLength => 'Saltar cap endavant';

  @override
  String get customMpvConfPath => 'Camí personalitzat mpv.conf';

  @override
  String get notSetMpvConf =>
      'No configurat. Moonfin provarà un mpv.conf predeterminat a les carpetes d\'aplicacions/dades.';

  @override
  String get selectMpvConf => 'Seleccioneu mpv.conf';

  @override
  String get pathToMpvConf => '/camí/a/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Els paràmetres d\'estil (mida, color, desplaçament) s\'apliquen als subtítols basats en text (SRT, VTT, TTML). Els subtítols ASS/SSA utilitzen el seu propi estil incrustat tret que \"ASS/SSA Direct Play\" estigui desactivat. Els subtítols de mapes de bits (PGS, DVB, VobSub) no es poden modificar.';

  @override
  String get defaultSubtitleLanguage => 'Idioma dels subtítols per defecte';

  @override
  String get defaultToNoSubtitles => 'Per defecte, Sense subtítols';

  @override
  String get turnOffSubtitlesByDefault =>
      'Desactiva els subtítols de manera predeterminada';

  @override
  String get subtitleSize => 'Mida del subtítol';

  @override
  String get textFillColor => 'Color de farciment de text';

  @override
  String get backgroundColor => 'Color de fons';

  @override
  String get textStrokeColor => 'Color del traç del text';

  @override
  String get subtitleCustomization => 'Personalització de subtítols';

  @override
  String get subtitleCustomizationDescription =>
      'Personalitza l\'aspecte dels subtítols';

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
      'La ràpida guineu marró salta per sobre del gos mandrós';

  @override
  String get verticalOffset => 'Desplaçament vertical';

  @override
  String get pgsDirectPlay => 'PGS Direct Play';

  @override
  String get directPlayPgsSubtitles => 'Reproducció directa de subtítols PGS';

  @override
  String get assSsaDirectPlay => 'ASS/SSA Direct Play';

  @override
  String get directPlayAssSsaSubtitles =>
      'Reproducció directa de subtítols ASS/SSA';

  @override
  String get white => 'Blanc';

  @override
  String get black => 'Negre';

  @override
  String get yellow => 'groc';

  @override
  String get green => 'Verd';

  @override
  String get cyan => 'Cian';

  @override
  String get red => 'Vermell';

  @override
  String get transparent => 'Transparent';

  @override
  String get semiTransparentBlack => 'Negre semitransparent';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Escriptori';

  @override
  String get mobile => 'Mòbil';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'S\'ha carregat la configuració del perfil $profile.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'No s\'ha pogut carregar la configuració del perfil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'S\'ha sincronitzat la configuració local amb el perfil $profile.';
  }

  @override
  String get customizationProfile => 'Perfil de personalització';

  @override
  String get customizationProfileDescription =>
      'Trieu el perfil per carregar, editar i sincronitzar. Global s\'aplica a tot arreu tret que un perfil de dispositiu el substitueixi. El punt verd marca el perfil actual del dispositiu.';

  @override
  String get loadProfile => 'Carrega el perfil';

  @override
  String get syncing => 'S\'està sincronitzant...';

  @override
  String get syncToProfile => 'Sincronitza amb el perfil';

  @override
  String get profileSyncHidden => 'Sincronització de perfils amagat';

  @override
  String get enablePluginSyncDescription =>
      'Activeu la sincronització del connector del servidor a la configuració del connector per mostrar els controls del perfil aquí.';

  @override
  String get quality => 'Qualitat';

  @override
  String get defaultDownloadQuality => 'Qualitat de descàrrega per defecte';

  @override
  String get network => 'Xarxa';

  @override
  String get wifiOnlyDownloads => 'Descàrregues només per a WiFi';

  @override
  String get onlyDownloadOnWifi => 'Baixa només quan està connectat a WiFi';

  @override
  String get storage => 'Emmagatzematge';

  @override
  String get storageUsed => 'Emmagatzematge utilitzat';

  @override
  String get manage => 'Gestionar';

  @override
  String get calculating => 'Calculant...';

  @override
  String get downloadLocation => 'Descarrega la ubicació';

  @override
  String get defaultLabel => 'Per defecte';

  @override
  String get saveToDownloadsFolder => 'Desa a la carpeta Baixades';

  @override
  String get downloadsVisibleToOtherApps =>
      'Descàrregues/Moonfin: visible per a altres aplicacions';

  @override
  String get dangerZone => 'Zona de perill';

  @override
  String get clearAllDownloads => 'Esborra totes les baixades';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Canvia la ubicació de descàrrega';

  @override
  String get changeDownloadLocationDescription =>
      'Les baixades noves es desaran a la carpeta seleccionada. Les baixades existents romandran a la seva ubicació actual i es podran gestionar des de la configuració d\'emmagatzematge.';

  @override
  String get confirm => 'Confirmeu';

  @override
  String get cannotWriteToFolder =>
      'No es pot escriure a la carpeta seleccionada. Si us plau, trieu una ubicació diferent o concediu permisos d\'emmagatzematge.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Vols desar a la carpeta Baixades?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Els mitjans descarregats es desaran a Descàrregues/Moonfin al vostre dispositiu. Aquests fitxers seran visibles per a altres aplicacions, com ara la galeria o el reproductor de música.\n\nLes baixades existents es mantindran a la seva ubicació actual.';

  @override
  String get enable => 'Activa';

  @override
  String get clearAllDownloadsWarning =>
      'Això suprimirà tots els mitjans descarregats i no es pot desfer.';

  @override
  String get clearAll => 'Esborra-ho tot';

  @override
  String get navigationStyle => 'Estil de navegació';

  @override
  String get topBar => 'Barra superior';

  @override
  String get leftSidebar => 'Barra lateral esquerra';

  @override
  String get showShuffleButton => 'Mostra el botó de barreja';

  @override
  String get showGenresButton => 'Botó Mostra els gèneres';

  @override
  String get showFavoritesButton => 'Mostra el botó de Preferits';

  @override
  String get showLibrariesInToolbar =>
      'Mostra les biblioteques a la barra d\'eines';

  @override
  String get navbarAlwaysExpanded => 'Always Expand Navbar Labels';

  @override
  String get showSeerrButton => 'Mostra botó de Seerr';

  @override
  String get navbarOpacity => 'Opacitat de la barra de navegació';

  @override
  String get navbarColor => 'Color de la barra de navegació';

  @override
  String get gray => 'Gris';

  @override
  String get darkBlue => 'Blau fosc';

  @override
  String get purple => 'Lila';

  @override
  String get teal => 'Teal';

  @override
  String get navy => 'Marina';

  @override
  String get charcoal => 'Carbó vegetal';

  @override
  String get brown => 'Marró';

  @override
  String get darkRed => 'Vermell fosc';

  @override
  String get darkGreen => 'Verd fosc';

  @override
  String get slate => 'Pissarra';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Exhibició de la biblioteca';

  @override
  String get posterLabel => 'Cartell';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Bandera';

  @override
  String get overridePerLibrarySettings =>
      'Substituïu la configuració per biblioteca';

  @override
  String get applyImageTypeToAllLibraries =>
      'Apliqueu el tipus d\'imatge a totes les biblioteques';

  @override
  String get multiServerLibraries => 'Biblioteques multiservidor';

  @override
  String get showLibrariesFromAllServers =>
      'Mostra les biblioteques de tots els servidors connectats';

  @override
  String get enableFolderView => 'Activa la vista de carpetes';

  @override
  String get showFolderBrowsingOption =>
      'Mostra l\'opció de navegació de carpetes';

  @override
  String get groupItemsIntoCollections => '';

  @override
  String get hideCollectionAssociatedItems => '';

  @override
  String get groupItemsIntoCollectionsDialogTitle => '';

  @override
  String get groupItemsIntoCollectionsDialogMessage => '';

  @override
  String get libraryVisibility => 'Visibilitat de la biblioteca';

  @override
  String get libraryVisibilityDescription =>
      'Commuta la visibilitat de la pàgina d\'inici per biblioteca. Reinicieu Moonfin perquè els canvis tinguin efecte.';

  @override
  String get showInNavigation => 'Mostra a la navegació';

  @override
  String get showInLatestMedia => 'Mostra als últims mitjans';

  @override
  String get sourceLibraries => 'Biblioteques font';

  @override
  String get sourceCollections => 'Col·leccions font';

  @override
  String get excludedGenres => 'Gèneres exclosos';

  @override
  String get selectAll => 'Seleccioneu Tot';

  @override
  String itemsSelected(int count) {
    return '$count seleccionat';
  }

  @override
  String get mediaBar => 'Barra de mitjans';

  @override
  String get mediaSources => 'Fonts de mitjans';

  @override
  String get behavior => 'Comportament';

  @override
  String get seconds => 'segons';

  @override
  String get localPreviews => 'Previsualitzacions locals';

  @override
  String get localPreviewsDescription =>
      'Configura les visualitzacions prèvies de tràiler, multimèdia i àudio.';

  @override
  String get mediaBarMode => 'Estil de barra multimèdia';

  @override
  String get mediaBarModeDescription =>
      'Trieu entre Moonfin, MakD o desactiva la barra multimèdia';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Apagat';

  @override
  String get enableMediaBar => 'Activa la barra multimèdia';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostra la presentació de diapositives de contingut destacat a casa';

  @override
  String get contentType => 'Tipus de contingut';

  @override
  String get moviesAndTvShows => 'Pel·lícules i programes de televisió';

  @override
  String get moviesOnly => 'Només pel·lícules';

  @override
  String get tvShowsOnly => 'Només programes de televisió';

  @override
  String get itemCount => 'Recompte d\'articles';

  @override
  String get noneSelected => 'Cap seleccionat';

  @override
  String get noneExcluded => 'Cap exclòs';

  @override
  String get autoAdvance => 'Avançament automàtic';

  @override
  String get autoAdvanceSlides =>
      'Avança automàticament a la diapositiva següent';

  @override
  String get autoAdvanceInterval => 'Interval d\'avanç automàtic';

  @override
  String get trailerPreview => 'Vista prèvia del tràiler';

  @override
  String get autoPlayTrailers =>
      'Reprodueix automàticament els tràilers a la barra multimèdia després de 3 segons';

  @override
  String get trailerAudio => 'Trailer Audio';

  @override
  String get enableTrailerAudio => 'Enable audio for trailers in media bar';

  @override
  String get episodePreview => 'Vista prèvia de l\'episodi';

  @override
  String get mediaPreview => 'Vista prèvia dels mitjans';

  @override
  String get episodePreviewDescription =>
      'Reprodueix una vista prèvia en línia de 30 segons en cartes centrades, posades al ratolí o premudes llargament';

  @override
  String get mediaPreviewDescription =>
      'Reprodueix una vista prèvia en línia de 30 segons en cartes centrades, posades al ratolí o premudes llargament';

  @override
  String get previewAudio => 'Vista prèvia d\'àudio';

  @override
  String get enablePreviewAudio =>
      'Activa l\'àudio per a les previsualitzacions de tràilers i episodis';

  @override
  String get latestMedia => 'Últims mitjans';

  @override
  String get recentlyReleased => 'Publicat recentment';

  @override
  String get myMedia => 'Els meus mitjans';

  @override
  String get myMediaSmall => 'Els meus mitjans (petits)';

  @override
  String get continueWatching => 'Continuar mirant';

  @override
  String get resumeAudio => 'Reprendre l\'àudio';

  @override
  String get resumeBooks => 'Llibres de currículums';

  @override
  String get activeRecordings => 'Enregistraments actius';

  @override
  String get playlists => 'Llistes de reproducció';

  @override
  String get liveTV => 'TV en directe';

  @override
  String get homeSections => 'Seccions d\'inici';

  @override
  String get resetToDefaults => 'Restableix els valors predeterminats';

  @override
  String get homeRowPosterSize => 'Mida del pòster de la fila d\'inici';

  @override
  String get perRowImageTypeSelection =>
      'Selecció del tipus d\'imatge per fila';

  @override
  String get configureImageTypeForEachRow =>
      'Configura el tipus d\'imatge per a cada fila d\'inici activada';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Combina Continua mirant i Següent';

  @override
  String get combineBothRows =>
      'Combina les dues files en una sola secció d\'inici';

  @override
  String get fullScreenRows => 'Files d\'inici ampliades';

  @override
  String get fullScreenRowsDescription => 'Limita a una sola fila per pantalla';

  @override
  String get perRowImageType => 'Tipus d\'imatge per fila';

  @override
  String get perRowSettings => 'Configuració per fila';

  @override
  String get autoLogin => 'Inici de sessió automàtic';

  @override
  String get lastUser => 'Últim usuari';

  @override
  String get currentUser => 'Usuari actual';

  @override
  String get alwaysAuthenticate => 'Autenticar-se sempre';

  @override
  String get requirePasswordWithToken =>
      'Requereix contrasenya fins i tot amb el testimoni emmagatzemat';

  @override
  String get confirmExit => 'Confirmeu la sortida';

  @override
  String get showConfirmationBeforeExiting =>
      'Mostra la confirmació abans de sortir';

  @override
  String get blockContentWithRatings =>
      'Bloqueja el contingut amb les classificacions següents:';

  @override
  String get noContentRatingsFound =>
      'Encara no s\'han trobat classificacions de contingut en aquest servidor.';

  @override
  String get couldNotLoadServerRatings =>
      'No s\'han pogut carregar les puntuacions del servidor. Es mostren només les puntuacions desades.';

  @override
  String get couldNotRefreshRatings =>
      'No s\'han pogut actualitzar les puntuacions del servidor. Es mostren les puntuacions desades.';

  @override
  String get enablePinCode => 'Activa el codi PIN';

  @override
  String get requirePinToAccess => 'Requereix un PIN per accedir al teu compte';

  @override
  String get changePin => 'Canvia el PIN';

  @override
  String get setNewPinCode => 'Establiu un codi PIN nou';

  @override
  String get removePin => 'Elimina el PIN';

  @override
  String get removePinProtection => 'Elimina la protecció del codi PIN';

  @override
  String get screensaver => 'Salvapantalles';

  @override
  String get inAppScreensaver => 'Salvapantalles a l\'aplicació';

  @override
  String get enableBuiltInScreensaver =>
      'Activa l\'estalvi de pantalla integrat';

  @override
  String get mode => 'Mode';

  @override
  String get libraryArt => 'Art de la Biblioteca';

  @override
  String get logo => 'Logotip';

  @override
  String get clock => 'Rellotge';

  @override
  String get timeout => 'Temps mort';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Nivell d\'atenuació';

  @override
  String get maxAgeRating => 'Classificació d\'edat màxima';

  @override
  String get any => 'Qualsevol';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Requereix classificació d\'edat';

  @override
  String get onlyShowRatedContent => 'Mostra només contingut classificat';

  @override
  String get showClock => 'Mostra el rellotge';

  @override
  String get displayClockDuringScreensaver =>
      'Mostra el rellotge durant l\'estalvi de pantalla';

  @override
  String get clockModeStatic => 'Estàtic';

  @override
  String get clockModeBouncing => 'Oscil·lant';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (crítics)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Públic)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacrític';

  @override
  String get metacriticUser => 'Metacritic (usuari)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Bústia d';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Valoració de la comunitat';

  @override
  String get ratings => 'Valoracions';

  @override
  String get additionalRatings => 'Valoracions addicionals';

  @override
  String get showMdbListAndTmdbRatings =>
      'Mostra les classificacions MDBList i TMDB';

  @override
  String get ratingLabels => 'Etiquetes de qualificació';

  @override
  String get showLabelsNextToIcons =>
      'Mostra les etiquetes al costat de les icones de valoració';

  @override
  String get ratingBadges => 'Insígnies de valoració';

  @override
  String get showDecorativeBadges =>
      'Mostra insígnies decoratives darrere de les puntuacions';

  @override
  String get episodeRatings => 'Valoracions d\'episodis';

  @override
  String get showRatingsOnEpisodes =>
      'Mostra les puntuacions d\'episodis individuals';

  @override
  String get ratingSources => 'Fonts de valoració';

  @override
  String get ratingSourcesDescription =>
      'Activa i reordena les fonts de classificació que es mostren a l\'aplicació';

  @override
  String get pluginLabel => 'Connector';

  @override
  String get pluginDetected => 'S\'ha detectat connector';

  @override
  String get pluginNotDetected => 'Connector no detectat';

  @override
  String get pluginDetectedDescription =>
      'S\'ha detectat un connector del servidor. La sincronització s\'activa automàticament la primera vegada que es troba el connector.';

  @override
  String get pluginNotDetectedDescription =>
      'Actualment no s\'ha detectat el connector del servidor. La configuració local encara utilitza els seus valors desats o els valors predeterminats integrats.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersió: $version';
  }

  @override
  String get availableServices => 'Serveis disponibles';

  @override
  String get serverPluginSync => 'Sincronització del connector del servidor';

  @override
  String get syncSettingsWithPlugin =>
      'Sincronitza la configuració amb el connector del servidor';

  @override
  String get whatSyncControls => 'Què controla la sincronització';

  @override
  String get syncControlsDescription =>
      'La sincronització només controla si la configuració amb una còpia de seguretat de connectors s\'envia i s\'extreu del servidor. La selecció de perfils i les accions de sincronització de perfils es troben a la configuració de personalització quan la sincronització dels connectors està activada.';

  @override
  String get recentRequests => 'Sol·licituds recents';

  @override
  String get recentlyAdded => 'Afegit recentment';

  @override
  String get trending => 'Tendència';

  @override
  String get popularMovies => 'Pel·lícules populars';

  @override
  String get movieGenres => 'Gèneres de pel·lícules';

  @override
  String get upcomingMovies => 'Pròximes pel·lícules';

  @override
  String get studios => 'Estudis';

  @override
  String get popularSeries => 'Sèrie Popular';

  @override
  String get seriesGenres => 'Gèneres de sèries';

  @override
  String get upcomingSeries => 'Pròxima Sèrie';

  @override
  String get networks => 'Xarxes';

  @override
  String get seerrDiscoveryRows => 'Fileres de descoberta Seerr';

  @override
  String get resetRowsToDefaults =>
      'Restableix les files als valors predeterminats';

  @override
  String get enableSeerr => 'Activa Seerr';

  @override
  String get showSeerrInNavigation =>
      'Mostra Seerr a la navegació (requereix un connector del servidor)';

  @override
  String get seerrUnavailable =>
      'No disponible perquè el suport de Seerr del connector del servidor està desactivat.';

  @override
  String get nsfwFilter => 'Filtre NSFW';

  @override
  String get hideAdultContent => 'Amaga contingut per a adults als resultats';

  @override
  String get seerrNotificationsSection => 'Notifications';

  @override
  String get seerrNotifyNewRequestsTitle => 'New request notifications';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Alert me when someone submits a request';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Request updates';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Approved, declined, and added to your library';

  @override
  String get seerrNotifyIssuesTitle => 'Issue updates';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'New issues, replies, and resolutions';

  @override
  String loggedInAs(String username) {
    return 'Inicieu sessió com a: $username';
  }

  @override
  String get discoverRows => 'Descobriu les files';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Arrossegueu per reordenar. Activa o desactiva les files. S\'han activat les sincronitzacions d\'ordre de files amb el connector Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Arrossegueu per reordenar. Activa o desactiva les files.';

  @override
  String get enabled => 'Habilitat';

  @override
  String get hidden => 'Ocult';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String versionValue(String version) {
    return 'Versió $version';
  }

  @override
  String get openSourceLicenses => 'Llicències de codi obert';

  @override
  String get sourceCode => 'Codi font';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Comproveu si hi ha actualitzacions ara';

  @override
  String get checksLatestDesktopRelease =>
      'Comprova la darrera versió d\'escriptori d\'aquesta plataforma';

  @override
  String get youAreUpToDate => 'Estàs al dia.';

  @override
  String get couldNotCheckForUpdates =>
      'No s\'han pogut comprovar si hi ha actualitzacions en aquest moment.';

  @override
  String get noCompatibleUpdate =>
      'No s\'ha trobat cap paquet d\'actualització compatible per a aquesta plataforma.';

  @override
  String get updateChecksNotSupported =>
      'Les comprovacions d\'actualització no són compatibles amb aquesta plataforma.';

  @override
  String get updateNotificationsDisabled =>
      'Les notificacions d\'actualització estan desactivades.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Espereu abans de tornar a comprovar-ho.';

  @override
  String get latestUpdateAlreadyShown =>
      'Ja s\'ha mostrat la darrera actualització.';

  @override
  String get updateAvailable => 'Actualització disponible.';

  @override
  String updateAvailableVersion(String version) {
    return 'Actualització disponible: v$version';
  }

  @override
  String get updateNotifications => 'Notificacions d\'actualització';

  @override
  String get showWhenUpdatesAvailable =>
      'Mostra quan hi ha actualitzacions disponibles';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Disponible';
  }

  @override
  String get readReleaseNotes => 'Llegeix les notes de la versió';

  @override
  String get downloadingUpdate => 'S\'està baixant l\'actualització...';

  @override
  String get updateDownloadFailed =>
      'La descàrrega de l\'actualització ha fallat. Si us plau, torna-ho a provar.';

  @override
  String get openReleasesPage => 'Obriu la pàgina de versions';

  @override
  String get navigation => 'Navegació';

  @override
  String get watchedIndicatorsBackdrops =>
      'Indicadors observats, telons de fons';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Color del focus, indicadors observats, fons';

  @override
  String get navbarStyleToolbarAppearance =>
      'Estil de la barra de navegació, botons de la barra d\'eines, aspecte';

  @override
  String get reorderToggleHomeRows => 'Reordena i canvia les files d\'inici';

  @override
  String get featuredContentAppearance => 'Contingut destacat, aparença';

  @override
  String get posterSizeImageTypeFolderView =>
      'Mida del pòster, tipus d\'imatge, vista de carpeta';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB i fonts de qualificació';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Clar';

  @override
  String get browse => 'Navega';

  @override
  String get noResults => 'Sense resultats';

  @override
  String get seerrAvailableStatus => 'Disponible';

  @override
  String get seerrRequestedStatus => 'Sol·licitat';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Downloading · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importing';

  @override
  String itemsCount(int count) {
    return '$count Elements';
  }

  @override
  String get seerrSettings => 'Configuració de Seerr';

  @override
  String get requestMore => 'Demana més';

  @override
  String get request => 'Sol·licitud';

  @override
  String get cancelRequest => 'Cancel·la la sol·licitud';

  @override
  String get playInMoonfin => 'Reprodueix a Moonfin';

  @override
  String requestedByName(String name) {
    return 'Sol·licitat per $name';
  }

  @override
  String get approve => 'Aprovar';

  @override
  String get declineAction => 'Declinar';

  @override
  String get similar => 'Similars';

  @override
  String get recommendations => 'Recomanacions';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel·lar la sol·licitud de \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel·lar $count les sol·licituds de \"$title\"?';
  }

  @override
  String get keep => 'Mantenir';

  @override
  String get itemNotFoundInLibrary =>
      'No s\'ha trobat l\'element a la vostra biblioteca de Moonfin';

  @override
  String get errorSearchingLibrary =>
      'S\'ha produït un error en cercar la biblioteca';

  @override
  String budgetAmount(String amount) {
    return 'Pressupost: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Ingressos: \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Sol·licitud $type';
  }

  @override
  String get submitRequest => 'Enviar sol·licitud';

  @override
  String get allSeasons => 'Totes les estacions';

  @override
  String get advancedOptions => 'Opcions avançades';

  @override
  String get noServiceServersConfigured =>
      'No s\'ha configurat cap servidor de servei';

  @override
  String get server => 'Servidor';

  @override
  String get qualityProfile => 'Perfil de qualitat';

  @override
  String get rootFolder => 'Carpeta arrel';

  @override
  String get showMore => 'Mostra\'n més';

  @override
  String get appearances => 'Aparicions';

  @override
  String get crewSection => 'Equip';

  @override
  String ageValue(int age) {
    return 'edat $age';
  }

  @override
  String get noRequests => 'No hi ha peticions';

  @override
  String get pendingStatus => 'Pendent';

  @override
  String get declinedStatus => 'Declinat';

  @override
  String get partiallyAvailable => 'Disponible parcialment';

  @override
  String get downloadingStatus => 'Descàrrega';

  @override
  String get approvedStatus => 'Aprovat';

  @override
  String get notRequestedStatus => 'No sol·licitat';

  @override
  String get blocklistedStatus => 'A la llista de bloqueig';

  @override
  String get deletedStatus => 'S\'ha suprimit';

  @override
  String get failedStatus => 'Failed';

  @override
  String get processingStatus => 'Processing';

  @override
  String modifiedByName(String name) {
    return 'Modified by $name';
  }

  @override
  String get completedStatus => 'Completed';

  @override
  String get requestErrorDuplicate => 'This title was already requested';

  @override
  String get requestErrorQuota => 'Request limit reached';

  @override
  String get requestErrorBlocklisted => 'This title is blocklisted';

  @override
  String get requestErrorNoSeasons => 'No seasons left to request';

  @override
  String get requestErrorPermission =>
      'You don\'t have permission to make this request';

  @override
  String get seerrRequestsTitle => 'Requests';

  @override
  String get seerrIssuesTitle => 'Issues';

  @override
  String get sortNewest => 'Newest';

  @override
  String get sortLastModified => 'Last Modified';

  @override
  String get noIssues => 'No issues';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit movie requests remaining';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining of $limit season requests remaining';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Part of $name';
  }

  @override
  String get viewCollection => 'View Collection';

  @override
  String get requestCollection => 'Request Collection';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total movies · $available available';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Request $count movies';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Requesting $current of $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return 'Requested $count movies';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return 'Requested $ok of $total movies';
  }

  @override
  String get collectionAllRequested =>
      'All movies are already available or requested';

  @override
  String get reportIssue => 'Report Issue';

  @override
  String get issueTypeVideo => 'Video';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'What\'s wrong?';

  @override
  String get allEpisodes => 'All Episodes';

  @override
  String get episode => 'Episode';

  @override
  String get openStatus => 'Open';

  @override
  String get resolvedStatus => 'Resolved';

  @override
  String get resolveAction => 'Resolve';

  @override
  String get reopenAction => 'Reopen';

  @override
  String reportedByName(String name) {
    return 'Reported by $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comments';
  }

  @override
  String get addComment => 'Add a comment';

  @override
  String get deleteIssueConfirm => 'Delete this issue?';

  @override
  String get submitReport => 'Submit Report';

  @override
  String get tmdbScore => 'Puntuació TMDB';

  @override
  String get releaseDateLabel => 'Data de llançament';

  @override
  String get firstAirDateLabel => 'Primera cita d\'emissió';

  @override
  String get revenueLabel => 'Ingressos';

  @override
  String get runtimeLabel => 'Temps d\'execució';

  @override
  String get budgetLabel => 'Pressupost';

  @override
  String get originalLanguageLabel => 'Idioma original';

  @override
  String get seasonsLabel => 'Temporades';

  @override
  String get episodesLabel => 'Episodis';

  @override
  String get access => 'Accés';

  @override
  String get add => 'Afegeix';

  @override
  String get address => 'Adreça';

  @override
  String get analytics => 'Analítica';

  @override
  String get catalog => 'Catàleg';

  @override
  String get content => 'Contingut';

  @override
  String get copy => 'Còpia';

  @override
  String get create => 'Crear';

  @override
  String get disable => 'Desactivar';

  @override
  String get done => 'Fet';

  @override
  String get edit => 'Edita';

  @override
  String get encoding => 'Codificació';

  @override
  String get error => 'Error';

  @override
  String get forward => 'Endavant';

  @override
  String get general => 'General';

  @override
  String get go => 'Vés';

  @override
  String get install => 'Instal·lar';

  @override
  String get installed => 'Instal·lat';

  @override
  String get interval => 'Interval';

  @override
  String get name => 'Nom';

  @override
  String get networking => 'Treball en xarxa';

  @override
  String get next => 'A continuació';

  @override
  String get path => 'Camí';

  @override
  String get paused => 'En pausa';

  @override
  String get permissions => 'Permisos';

  @override
  String get processing => 'Tramitació';

  @override
  String get profile => 'Perfil';

  @override
  String get provider => 'Proveïdor';

  @override
  String get refresh => 'Actualitzar';

  @override
  String get remote => 'Remot';

  @override
  String get rename => 'Canvia el nom';

  @override
  String get revoke => 'Revocar';

  @override
  String get role => 'Rol';

  @override
  String get root => 'Arrel';

  @override
  String get run => 'Corre';

  @override
  String get search => 'Cerca';

  @override
  String get select => 'Seleccioneu';

  @override
  String get send => 'Enviar';

  @override
  String get sessions => 'Sessions';

  @override
  String get set => 'Set';

  @override
  String get status => 'Estat';

  @override
  String get stop => 'Atureu-vos';

  @override
  String get streaming => 'Transmissió en continu';

  @override
  String get time => 'Temps';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Desinstal·la';

  @override
  String get up => 'Amunt';

  @override
  String get update => 'Actualització';

  @override
  String get upload => 'Carrega';

  @override
  String get unmute => 'Activa el so';

  @override
  String get mute => 'Silenciar';

  @override
  String get branding => 'Marca';

  @override
  String get adminDrawerDashboard => 'Tauler de control';

  @override
  String get adminDrawerAnalytics => 'Analítica';

  @override
  String get adminDrawerSettings => 'Configuració';

  @override
  String get adminDrawerBranding => 'Marca';

  @override
  String get adminDrawerUsers => 'Usuaris';

  @override
  String get adminDrawerLibraries => 'Biblioteques';

  @override
  String get adminDrawerDisplay => 'Display';

  @override
  String get adminDrawerMetadata => 'Metadata';

  @override
  String get adminDrawerNfo => 'NFO Settings';

  @override
  String get adminDrawerTranscoding => 'Transcodificació';

  @override
  String get adminDrawerResume => 'Currículum';

  @override
  String get adminDrawerStreaming => 'Transmissió en continu';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

  @override
  String get adminDrawerDevices => 'Dispositius';

  @override
  String get adminDrawerActivity => 'Activitat';

  @override
  String get adminDrawerNetworking => 'Treball en xarxa';

  @override
  String get adminDrawerApiKeys => 'Claus API';

  @override
  String get adminDrawerBackups => 'Còpies de seguretat';

  @override
  String get adminDrawerLogs => 'Registres';

  @override
  String get adminDrawerScheduledTasks => 'Tasques programades';

  @override
  String get adminDrawerPlugins => 'Connectors';

  @override
  String get adminDrawerRepositories => 'Repositoris';

  @override
  String get adminDrawerLiveTv => 'TV en directe';

  @override
  String get adminExitTooltip => 'Sortir de l\'administrador';

  @override
  String get adminDashboardLoadFailed => 'No s\'ha pogut carregar el tauler';

  @override
  String get adminMediaOverview => 'Visió general dels mitjans';

  @override
  String get adminMediaTotalsError =>
      'No s\'han pogut carregar els totals dels mitjans del servidor.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Una lectura ràpida de quant de contingut hi ha en aquest servidor.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Actualitzacions del connector disponibles: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Connectors que requereixen reinici: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tasques programades fallides: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Entrades d\'avís/error recents: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribució de mitjans';

  @override
  String get analyticsVideoCodecs => 'Còdecs de vídeo';

  @override
  String get analyticsAudioCodecs => 'Còdecs d\'àudio';

  @override
  String get analyticsContainers => 'Contenidors';

  @override
  String get analyticsTopGenres => 'Gèneres principals';

  @override
  String get analyticsReleaseYears => 'Anys de llançament';

  @override
  String get analyticsContentRatings => 'Classificacions de contingut';

  @override
  String get analyticsRuntimeBuckets => 'Cubs de temps d\'execució';

  @override
  String get analyticsFileFormats => 'Formats de fitxer';

  @override
  String get analyticsNoData => 'No hi ha dades disponibles.';

  @override
  String get adminServerInfo => 'Informació del servidor';

  @override
  String get adminRestartPending => 'Reiniciar pendent';

  @override
  String get adminServerPaths => 'Rutes del servidor';

  @override
  String get adminServerActions => 'Accions del servidor';

  @override
  String get adminRestartServer => 'Reinicieu el servidor';

  @override
  String get adminShutdownServer => 'Apagar el servidor';

  @override
  String get adminScanLibraries => 'Escaneja biblioteques';

  @override
  String get adminLibraryScanStarted =>
      'S\'ha iniciat l\'exploració de la biblioteca';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Reinici del servidor en curs';

  @override
  String get adminServerRebootMessage =>
      'S\'està reiniciant el servidor, reinicieu Moonfin';

  @override
  String get adminActiveSessions => 'Sessions actives';

  @override
  String get adminSessionsLoadFailed => 'No s\'han pogut carregar les sessions';

  @override
  String get adminNoActiveSessions => 'No hi ha sessions actives';

  @override
  String get adminRecentActivity => 'Activitat recent';

  @override
  String get adminNoRecentActivity => 'Cap activitat recent';

  @override
  String adminCommandFailed(String error) {
    return 'L\'ordre ha fallat: $error';
  }

  @override
  String get adminSendMessage => 'Enviar missatge';

  @override
  String get adminMessageTextHint => 'Text del missatge';

  @override
  String get adminSetVolume => 'Estableix el volum';

  @override
  String get sessionPrev => 'Anterior';

  @override
  String get sessionRewind => 'Rebobinar';

  @override
  String get sessionForward => 'Endavant';

  @override
  String get sessionNext => 'A continuació';

  @override
  String get sessionVolumeDown => 'Vol -';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Reproduint';

  @override
  String get volume => 'Volum';

  @override
  String get actions => 'Accions';

  @override
  String get videoCodec => 'Còdec de vídeo';

  @override
  String get audioCodec => 'Còdec d\'àudio';

  @override
  String get hwAccel => 'HW Accel';

  @override
  String get completion => 'Finalització';

  @override
  String get direct => 'Directe';

  @override
  String get adminDisconnect => 'Desconnecta';

  @override
  String get adminClearDates => 'Dates clares';

  @override
  String get adminActivitySeverityAll => 'All severities';

  @override
  String get adminActivityDateRange => 'Date range';

  @override
  String adminActivityLoadFailed(String error) {
    return 'No s\'ha pogut carregar el registre d\'activitat: $error';
  }

  @override
  String get adminNoActivityEntries => 'No hi ha entrades d\'activitat';

  @override
  String get adminEditDeviceName => 'Edita el nom del dispositiu';

  @override
  String get adminCustomName => 'Nom personalitzat';

  @override
  String get adminDeviceNameUpdated =>
      'S\'ha actualitzat el nom del dispositiu';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'No s\'ha pogut actualitzar el dispositiu: $error';
  }

  @override
  String get adminDeleteDevice => 'Suprimeix el dispositiu';

  @override
  String get adminDeviceDeleted => 'S\'ha suprimit el dispositiu';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'No s\'ha pogut suprimir el dispositiu: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Remove device \'$name\'? The user will need to sign in again on this device.';
  }

  @override
  String get adminDeleteAllDevices => 'Delete all devices';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remove $count devices? Affected users will need to sign in again. Your current device is not affected.';
  }

  @override
  String get adminDevicesDeletedAll => 'Devices removed';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Removed some devices; $count could not be removed.';
  }

  @override
  String get adminDevicesLoadFailed =>
      'No s\'han pogut carregar els dispositius';

  @override
  String get adminSearchDevices => 'Dispositius de cerca';

  @override
  String get adminThisDevice => 'Aquest dispositiu';

  @override
  String get adminEditName => 'Edita el nom';

  @override
  String get adminLibrariesLoadFailed =>
      'No s\'han pogut carregar les biblioteques';

  @override
  String get adminNoLibraries => 'No s\'ha configurat cap biblioteca';

  @override
  String get adminScanAllLibraries => 'Escaneja totes les biblioteques';

  @override
  String get adminAddLibrary => 'Afegeix biblioteca';

  @override
  String adminScanFailed(String error) {
    return 'No s\'ha pogut iniciar l\'exploració: $error';
  }

  @override
  String get adminRenameLibrary => 'Canvia el nom de la biblioteca';

  @override
  String get adminNewName => 'Nou nom';

  @override
  String adminLibraryRenamed(String name) {
    return 'S\'ha canviat el nom de la biblioteca a \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'No s\'ha pogut canviar el nom: $error';
  }

  @override
  String get adminDeleteLibrary => 'Suprimeix la biblioteca';

  @override
  String adminLibraryDeleted(String name) {
    return 'S\'ha suprimit la biblioteca \"$name\"';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'No s\'ha pogut suprimir la biblioteca: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'No s\'ha pogut afegir el camí: $error';
  }

  @override
  String get adminRemovePath => 'Elimina el camí';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Vols suprimir \"$path\" d\'aquesta biblioteca?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'No s\'ha pogut eliminar el camí: $error';
  }

  @override
  String get adminLibraryOptionsSaved =>
      'S\'han desat les opcions de la biblioteca';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'No s\'han pogut desar les opcions: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'No s\'ha pogut carregar la biblioteca';

  @override
  String get adminNoMediaPaths => 'No s\'ha configurat cap camí multimèdia';

  @override
  String get adminAddPath => 'Afegeix un camí';

  @override
  String get adminBrowseFilesystem =>
      'Navega pel sistema de fitxers del servidor:';

  @override
  String get adminSaveOptions => 'Desa les opcions';

  @override
  String get adminPreferredMetadataLanguage => 'Idioma de metadades preferit';

  @override
  String get adminMetadataLanguageHint => 'p. ex. en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Codi de país de metadades';

  @override
  String get adminMetadataCountryHint => 'p. ex. EUA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Paths';

  @override
  String get adminLibraryTabOptions => 'Options';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Metadata savers';

  @override
  String get adminLibSubtitleDownloaders => 'Subtitle downloaders';

  @override
  String get adminLibLyricDownloaders => 'Lyric downloaders';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Metadata downloaders: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Image fetchers: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'This server exposes no downloaders for this library type.';

  @override
  String get adminLibrarySectionGeneral => 'General';

  @override
  String get adminLibrarySectionMetadata => 'Metadata';

  @override
  String get adminLibrarySectionEmbedded => 'Embedded Info';

  @override
  String get adminLibrarySectionSubtitles => 'Subtitles';

  @override
  String get adminLibrarySectionImages => 'Images';

  @override
  String get adminLibrarySectionSeries => 'Series';

  @override
  String get adminLibrarySectionMusic => 'Music';

  @override
  String get adminLibrarySectionMovies => 'Movies';

  @override
  String get adminLibRealtimeMonitor => 'Enable real-time monitoring';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detect file changes and process them automatically.';

  @override
  String get adminLibArchiveMediaFiles => 'Treat archives as media files';

  @override
  String get adminLibEnablePhotos => 'Display photos';

  @override
  String get adminLibSaveLocalMetadata => 'Save artwork into media folders';

  @override
  String get adminLibRefreshInterval => 'Automatic metadata refresh';

  @override
  String get adminLibRefreshNever => 'Never';

  @override
  String get adminLibDefault => 'Default';

  @override
  String get adminLibDisplayTitle => 'Display';

  @override
  String get adminLibDisplaySection => 'Library display';

  @override
  String get adminLibFolderView =>
      'Display a folder view to show plain media folders';

  @override
  String get adminLibSpecialsInSeasons =>
      'Display specials within seasons they aired in';

  @override
  String get adminLibGroupMovies => 'Group movies into collections';

  @override
  String get adminLibGroupShows => 'Group shows into collections';

  @override
  String get adminLibExternalSuggestions =>
      'Show external content in suggestions';

  @override
  String get adminLibDateAddedSection => 'Date added behavior';

  @override
  String get adminLibDateAddedLabel => 'Use date added from';

  @override
  String get adminLibDateAddedImport => 'Date scanned into the library';

  @override
  String get adminLibDateAddedFile => 'Date the file was created';

  @override
  String get adminLibMetadataTitle => 'Metadata and Images';

  @override
  String get adminLibMetadataLangSection => 'Preferred metadata language';

  @override
  String get adminLibChaptersSection => 'Chapters';

  @override
  String get adminLibDummyChapterDuration => 'Dummy chapter duration (seconds)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Length of chapters generated for media that has none. Set to 0 to disable.';

  @override
  String get adminLibChapterImageResolution => 'Chapter image resolution';

  @override
  String get adminLibNfoTitle => 'NFO Settings';

  @override
  String get adminLibNfoHelp =>
      'NFO metadata is compatible with Kodi and similar clients. Settings apply to all libraries that save NFO metadata.';

  @override
  String get adminLibKodiUser => 'User to store watch data for in NFO files';

  @override
  String get adminLibSaveImagePaths => 'Save image paths within NFO files';

  @override
  String get adminLibPathSubstitution =>
      'Enable path substitution for NFO image paths';

  @override
  String get adminLibExtraThumbs =>
      'Copy extrafanart images into an extrathumbs folder';

  @override
  String get adminLibNone => 'None';

  @override
  String adminLibRefreshDays(int days) {
    return '$days days';
  }

  @override
  String get adminLibEmbeddedTitles => 'Use embedded titles';

  @override
  String get adminLibEmbeddedExtrasTitles => 'Use embedded titles for extras';

  @override
  String get adminLibEmbeddedEpisodeInfos => 'Use embedded episode information';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Allow embedded subtitles';

  @override
  String get adminLibEmbeddedAllowAll => 'Allow all';

  @override
  String get adminLibEmbeddedAllowText => 'Text only';

  @override
  String get adminLibEmbeddedAllowImage => 'Image only';

  @override
  String get adminLibEmbeddedAllowNone => 'None';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Skip download if embedded subtitles are present';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Skip download if the audio track matches the download language';

  @override
  String get adminLibRequirePerfectMatch => 'Require a perfect subtitle match';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Save subtitles into media folders';

  @override
  String get adminLibChapterImageExtraction => 'Extract chapter images';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extract chapter images during the library scan';

  @override
  String get adminLibTrickplayExtraction => 'Enable trickplay image extraction';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extract trickplay images during the library scan';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Save trickplay images into media folders';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Automatically merge series that are spread across multiple folders';

  @override
  String get adminLibSeasonZeroName => 'Season zero display name';

  @override
  String get adminLibLufsScan => 'Enable LUFS scan for audio normalization';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Prefer non-standard artists tag';

  @override
  String get adminLibAutoAddToCollection =>
      'Automatically add movies to collections';

  @override
  String get adminLibraryNameRequired =>
      'El nom de la biblioteca és obligatori';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'No s\'ha pogut crear la biblioteca: $error';
  }

  @override
  String get adminLibraryName => 'Nom de la biblioteca';

  @override
  String get adminSelectedPaths => 'Camins seleccionats:';

  @override
  String get adminNoPathsAdded =>
      'No s\'ha afegit cap camí (es pot afegir més tard)';

  @override
  String get adminCreateLibrary => 'Crear biblioteca';

  @override
  String get paths => 'Camins:';

  @override
  String get adminDisableUser => 'Desactiva l\'usuari';

  @override
  String get adminEnableUser => 'Habilita l\'usuari';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Vols desactivar $name? No podran iniciar la sessió.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Habilitar $name? Podran tornar a iniciar la sessió.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Usuari \"$name\" desactivat';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Usuari \"$name\" habilitat';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'No s\'ha pogut actualitzar la política d\'usuari: $error';
  }

  @override
  String get adminUsersLoadFailed => 'No s\'han pogut carregar els usuaris';

  @override
  String get adminSearchUsers => 'Cerca usuaris';

  @override
  String get adminEditUser => 'Edita usuari';

  @override
  String get adminAddUser => 'Afegeix usuari';

  @override
  String adminUserCreateFailed(String error) {
    return 'No s\'ha pogut crear l\'usuari: $error';
  }

  @override
  String get adminCreateUser => 'Crea usuari';

  @override
  String get adminPasswordOptional => 'Contrasenya (opcional)';

  @override
  String get adminUsernameRequired => 'El nom d\'usuari no pot estar buit';

  @override
  String get adminNoProfileChanges => 'No hi ha canvis de perfil per desar';

  @override
  String get adminProfileSaved => 'S\'ha desat el perfil';

  @override
  String adminSaveFailed(String error) {
    return 'No s\'ha pogut desar: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permisos desats';

  @override
  String get adminPasswordsMismatch => 'Les contrasenyes no coincideixen';

  @override
  String adminFailed(String error) {
    return 'Error: $error';
  }

  @override
  String get adminUserLoadFailed => 'No s\'ha pogut carregar l\'usuari';

  @override
  String get adminBackToUsers => 'Torna a Usuaris';

  @override
  String get adminSaveProfile => 'Desa el perfil';

  @override
  String get adminDeleteUser => 'Suprimeix l\'usuari';

  @override
  String get admin => 'Admin';

  @override
  String get adminFullAccessWarning =>
      'Els administradors tenen accés complet al servidor. Concediu amb precaució.';

  @override
  String get administrator => 'Administrador';

  @override
  String get adminHiddenUser => 'Usuari ocult';

  @override
  String get adminAllowMediaPlayback => 'Permet la reproducció multimèdia';

  @override
  String get adminAllowAudioTranscoding =>
      'Permet la transcodificació d\'àudio';

  @override
  String get adminAllowVideoTranscoding =>
      'Permet la transcodificació de vídeo';

  @override
  String get adminAllowRemuxing => 'Permet el remuxatge';

  @override
  String get adminForceRemoteTranscoding =>
      'Força la transcodificació de la font remota';

  @override
  String get adminAllowContentDeletion => 'Permet la supressió de contingut';

  @override
  String get adminAllowContentDownloading => 'Permet la baixada de contingut';

  @override
  String get adminAllowPublicSharing => 'Permet la compartició pública';

  @override
  String get adminAllowRemoteControl =>
      'Permetre el control remot d\'altres usuaris';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permet el control compartit del dispositiu';

  @override
  String get adminAllowRemoteAccess => 'Permet l\'accés remot';

  @override
  String get adminRemoteBitrateLimit =>
      'Límit de bitrate del client remot (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Deixeu buit sense límit';

  @override
  String get adminMaxActiveSessions => 'Màxim de sessions actives';

  @override
  String get adminAllowLiveTvAccess =>
      'Permet l\'accés a la televisió en directe';

  @override
  String get adminAllowLiveTvManagement => 'Permet la gestió de TV en directe';

  @override
  String get adminAllowCollectionManagement =>
      'Permetre la gestió de la col·lecció';

  @override
  String get adminAllowSubtitleManagement => 'Permet la gestió de subtítols';

  @override
  String get adminAllowLyricManagement => 'Permetre la gestió de les lletres';

  @override
  String get adminSavePermissions => 'Desa els permisos';

  @override
  String get adminEnableAllLibraryAccess =>
      'Habilita l\'accés a totes les biblioteques';

  @override
  String get adminSaveAccess => 'Desa l\'accés';

  @override
  String get adminChangePassword => 'Canvia la contrasenya';

  @override
  String get adminNewPassword => 'Contrasenya nova';

  @override
  String get adminConfirmPassword => 'Confirmeu la contrasenya';

  @override
  String get adminSetPassword => 'Estableix la contrasenya';

  @override
  String get adminResetPassword => 'Restableix la contrasenya';

  @override
  String get adminPasswordReset => 'Restableix la contrasenya';

  @override
  String get adminPasswordUpdated => 'Contrasenya actualitzada';

  @override
  String get adminUserSettings => 'Configuració d\'usuari';

  @override
  String get adminLibraryAccess => 'Accés a la Biblioteca';

  @override
  String get adminDeviceAndChannelAccess => 'Accés al dispositiu i canal';

  @override
  String get adminEnableAllDevices => 'Activa l\'accés a tots els dispositius';

  @override
  String get adminEnableAllChannels => 'Activa l\'accés a tots els canals';

  @override
  String get adminParentalControl => 'Parental Control';

  @override
  String get adminMaxParentalRating => 'Maximum allowed parental rating';

  @override
  String get adminMaxParentalRatingHint =>
      'Content with a higher rating will be hidden from this user.';

  @override
  String get adminParentalRatingNone => 'None';

  @override
  String get adminBlockUnratedItems =>
      'Block items with no or unrecognized rating information';

  @override
  String get adminUnratedBook => 'Books';

  @override
  String get adminUnratedChannelContent => 'Channels';

  @override
  String get adminUnratedLiveTvChannel => 'Live TV';

  @override
  String get adminUnratedMovie => 'Movies';

  @override
  String get adminUnratedMusic => 'Music';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Shows';

  @override
  String get adminAccessSchedules => 'Access Schedules';

  @override
  String get adminAccessSchedulesHint =>
      'Allow access only during the scheduled times below. Access is allowed all day when no schedule is set.';

  @override
  String get adminAddSchedule => 'Add Schedule';

  @override
  String get adminScheduleDay => 'Day';

  @override
  String get adminScheduleStart => 'Start';

  @override
  String get adminScheduleEnd => 'End';

  @override
  String get adminDayEveryday => 'Every day';

  @override
  String get adminDayWeekday => 'Weekday';

  @override
  String get adminDayWeekend => 'Weekend';

  @override
  String get adminDaySunday => 'Sunday';

  @override
  String get adminDayMonday => 'Monday';

  @override
  String get adminDayTuesday => 'Tuesday';

  @override
  String get adminDayWednesday => 'Wednesday';

  @override
  String get adminDayThursday => 'Thursday';

  @override
  String get adminDayFriday => 'Friday';

  @override
  String get adminDaySaturday => 'Saturday';

  @override
  String get adminAllowedTags => 'Allowed tags';

  @override
  String get adminAllowedTagsHint =>
      'Only content with these tags is shown. Leave empty to allow all.';

  @override
  String get adminBlockedTags => 'Blocked tags';

  @override
  String get adminBlockedTagsHint =>
      'Content with these tags is hidden from this user.';

  @override
  String get adminAddTag => 'Add tag';

  @override
  String get adminEnabledDevices => 'Enabled devices';

  @override
  String get adminEnabledChannels => 'Enabled channels';

  @override
  String get adminAuthProvider => 'Authentication provider';

  @override
  String get adminPasswordResetProvider => 'Password reset provider';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Maximum failed login attempts before lockout';

  @override
  String get adminLoginAttemptsHint =>
      'Set to 0 for the default, or -1 to disable lockout.';

  @override
  String get adminSyncPlayAccess => 'SyncPlay access';

  @override
  String get adminSyncPlayCreateAndJoin => 'Allow creating and joining groups';

  @override
  String get adminSyncPlayJoin => 'Allow joining groups';

  @override
  String get adminSyncPlayNone => 'No access';

  @override
  String get adminContentDeletionFolders => 'Allow content deletion from';

  @override
  String get adminResetPasswordWarning =>
      'Això eliminarà la contrasenya. L\'usuari podrà iniciar sessió sense contrasenya.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'El servidor ha retornat HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Esteu segur que voleu suprimir $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'S\'ha suprimit l\'usuari \"$name\"';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'No s\'ha pogut suprimir l\'usuari: $error';
  }

  @override
  String get adminCreateApiKey => 'Crea una clau d\'API';

  @override
  String get adminAppName => 'Nom de l\'aplicació';

  @override
  String get adminApiKeyCreated => 'S\'ha creat la clau de l\'API';

  @override
  String get adminApiKeyCreatedNoToken =>
      'La clau s\'ha creat correctament. El servidor no ha retornat el testimoni. Comproveu les claus de l\'API del servidor.';

  @override
  String get adminKeyCopied => 'S\'ha copiat la clau al porta-retalls';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'No s\'ha pogut crear la clau: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Falta el testimoni de clau a la resposta del servidor';

  @override
  String get adminRevokeApiKey => 'Revoca la clau de l\'API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Voleu revocar la clau per a $name?';
  }

  @override
  String get adminApiKeyRevoked => 'S\'ha revocat la clau de l\'API';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'No s\'ha pogut revocar la clau: $error';
  }

  @override
  String get adminApiKeysLoadFailed =>
      'No s\'han pogut carregar les claus de l\'API';

  @override
  String get adminApiKeysTitle => 'Claus API';

  @override
  String get adminCreateKey => 'Crea clau';

  @override
  String get adminNoApiKeys => 'No s\'han trobat claus API';

  @override
  String get adminUnknownApp => 'Aplicació desconeguda';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreat: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Create Backup';

  @override
  String get adminBackupInclude => 'Choose what to include in the backup.';

  @override
  String get adminBackupDatabase => 'Database';

  @override
  String get adminBackupDatabaseAlways => 'Always included';

  @override
  String get adminBackupMetadata => 'Metadata';

  @override
  String get adminBackupSubtitles => 'Subtitles';

  @override
  String get adminBackupTrickplay => 'Trickplay images';

  @override
  String get adminCreatingBackup => 'S\'està creant una còpia de seguretat...';

  @override
  String get adminBackupCreated => 'Còpia de seguretat creada correctament';

  @override
  String adminBackupCreateFailed(String error) {
    return 'No s\'ha pogut crear una còpia de seguretat: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Falta la ruta de còpia de seguretat a la resposta del servidor';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'No s\'ha pogut carregar el manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmeu la restauració';

  @override
  String get adminRestoringBackup =>
      'S\'està restaurant la còpia de seguretat...';

  @override
  String adminRestoreFailed(String error) {
    return 'No s\'ha pogut restaurar la còpia de seguretat: $error';
  }

  @override
  String get adminBackupsLoadFailed =>
      'No s\'han pogut carregar les còpies de seguretat';

  @override
  String get adminCreateBackup => 'Crea una còpia de seguretat';

  @override
  String get adminNoBackups => 'No s\'han trobat còpies de seguretat';

  @override
  String get adminViewDetails => 'Veure detalls';

  @override
  String get restore => 'Restaurar';

  @override
  String get adminLogsLoadFailed =>
      'No s\'han pogut carregar els registres del servidor';

  @override
  String get adminNoLogFiles => 'No s\'han trobat fitxers de registre';

  @override
  String get adminLogCopied => 'S\'ha copiat el registre al porta-retalls';

  @override
  String get adminSaveLogFile => 'Desa el fitxer de registre';

  @override
  String adminSavedTo(String path) {
    return 'Desat a $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'No s\'ha pogut desar el fitxer: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'No s\'ha pogut carregar $fileName';
  }

  @override
  String get adminSearchInLog => 'Cerca al registre';

  @override
  String get adminNoMatchingLines => 'No hi ha línies coincidents';

  @override
  String adminTasksLoadFailed(String error) {
    return 'No s\'han pogut carregar les tasques: $error';
  }

  @override
  String get adminNoScheduledTasks => 'No s\'han trobat tasques programades';

  @override
  String get adminNoTasksMatchFilter =>
      'Cap tasca coincideix amb el filtre actual';

  @override
  String adminTaskStartFailed(String error) {
    return 'No s\'ha pogut iniciar la tasca: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'No s\'ha pogut aturar la tasca: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'No s\'ha pogut carregar la tasca: $error';
  }

  @override
  String get adminRunNow => 'Corre ara';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'No s\'ha pogut eliminar l\'activador: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'No s\'ha pogut afegir l\'activador: $error';
  }

  @override
  String get adminLastExecution => 'Última Execució';

  @override
  String get adminTriggers => 'Disparadors';

  @override
  String get adminAddTrigger => 'Afegeix un disparador';

  @override
  String get adminNoTriggers => 'No s\'ha configurat cap activador';

  @override
  String get adminTriggerType => 'Tipus de disparador';

  @override
  String get adminTimeLimit => 'Límit de temps (opcional)';

  @override
  String get adminNoLimit => 'Sense límit';

  @override
  String adminHours(String hours) {
    return '$hours hora(es)';
  }

  @override
  String get adminDayOfWeek => 'Dia de la setmana';

  @override
  String get adminSearchPlugins => 'Cerca connectors...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'No s\'ha pogut canviar el connector: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstal·leu el connector';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Esteu segur que voleu desinstal·lar \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'No s\'ha pogut desinstal·lar el connector: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'No s\'ha pogut instal·lar el paquet: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'No s\'ha pogut instal·lar l\'actualització: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'No s\'han pogut carregar els connectors: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Cap connector coincideix amb la vostra cerca';

  @override
  String get adminNoPluginsInstalled => 'No hi ha connectors instal·lats';

  @override
  String adminInstallUpdate(String version) {
    return 'Instal·la l\'actualització (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'No s\'ha pogut carregar el catàleg: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'No hi ha cap paquet que coincideixi amb la vostra cerca';

  @override
  String get adminNoPackagesAvailable => 'No hi ha paquets disponibles';

  @override
  String get adminExperimentalIntegration => 'Integració experimental';

  @override
  String get adminExperimentalWarning =>
      'La integració de la configuració del connector encara és experimental. És possible que algunes pàgines de configuració no es mostrin correctament.';

  @override
  String get continueAction => 'Continua';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" s\'eliminarà després de reiniciar el servidor';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'No s\'ha pogut desinstal·lar: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'S\'està actualitzant \"$name\" a v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'No es pot obrir la configuració: falta el testimoni d\'autenticació.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'No s\'ha pogut carregar el connector: $error';
  }

  @override
  String get adminPluginNotFound => 'No s\'ha trobat el connector';

  @override
  String adminPluginVersion(String version) {
    return 'Versió $version';
  }

  @override
  String get adminEnablePlugin => 'Activa el connector';

  @override
  String get adminPluginSettingsPage => 'Pàgina de configuració del connector';

  @override
  String get adminRevisionHistory => 'Historial de revisions';

  @override
  String get adminNoChangelog => 'No hi ha registre de canvis disponible.';

  @override
  String get adminRemoveRepository => 'Elimina el repositori';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Esteu segur que voleu eliminar \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'No s\'han pogut desar els dipòsits: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'No s\'han pogut carregar els dipòsits: $error';
  }

  @override
  String get adminRepositoryNameHint => 'p. ex. Jellyfin Estable';

  @override
  String get adminRepositoryUrl => 'URL del repositori';

  @override
  String get adminAddEntry => 'Afegeix una entrada';

  @override
  String get adminInvalidUrl => 'URL no vàlid';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'No es pot carregar la configuració del connector: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'No s\'ha pogut obrir $uri';
  }

  @override
  String get adminOpenInBrowser => 'Obre al navegador';

  @override
  String get adminOpenExternally => 'Obrir a l\'exterior';

  @override
  String get adminGeneralSettings => 'Configuració general';

  @override
  String get adminServerName => 'Nom del servidor';

  @override
  String get adminPreferredMetadataCountry => 'País de metadades preferit';

  @override
  String get adminCachePath => 'Camí de la memòria cau';

  @override
  String get adminMetadataPath => 'Camí de metadades';

  @override
  String get adminLibraryScanConcurrency =>
      'Concurrència d\'exploració de biblioteques';

  @override
  String get adminParallelImageEncodingLimit =>
      'Límit de codificació d\'imatges paral·leles';

  @override
  String get adminSlowResponseThreshold => 'Llindar de resposta lenta (ms)';

  @override
  String get adminBrandingSaved => 'S\'ha desat la configuració de la marca';

  @override
  String get adminBrandingLoadFailed =>
      'No s\'ha pogut carregar la configuració de marca';

  @override
  String get adminLoginDisclaimer =>
      'Exempció de responsabilitat d\'inici de sessió';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML que es mostra a sota del formulari d\'inici de sessió';

  @override
  String get adminCustomCss => 'CSS personalitzat';

  @override
  String get adminCustomCssHint =>
      'CSS personalitzat aplicat a la interfície web';

  @override
  String get adminEnableSplashScreen => 'Activa la pantalla de presentació';

  @override
  String get adminStreamingSaved =>
      'S\'ha desat la configuració de reproducció en temps real';

  @override
  String get adminStreamingLoadFailed =>
      'No s\'ha pogut carregar la configuració de transmissió';

  @override
  String get adminStreamingDescription =>
      'Estableix límits globals de velocitat de bits de transmissió per a connexions remotes.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Límit de velocitat de bits del client remot (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Deixeu buit o 0 per il·limitat';

  @override
  String get adminPlaybackSaved => 'S\'ha desat la configuració de reproducció';

  @override
  String get adminPlaybackLoadFailed =>
      'No s\'ha pogut carregar la configuració de reproducció';

  @override
  String get adminPlaybackTranscoding => 'Reproducció / Transcodificació';

  @override
  String get adminHardwareAcceleration => 'Acceleració de maquinari';

  @override
  String get adminVaapiDevice => 'Dispositiu VA-API';

  @override
  String get adminEnableHardwareEncoding =>
      'Activa la codificació de maquinari';

  @override
  String get adminEnableHardwareDecoding =>
      'Activa la descodificació de maquinari per a:';

  @override
  String get adminEncodingThreads => 'Codificació de fils';

  @override
  String get adminAutomatic => '0 = automàtic';

  @override
  String get adminTranscodingTempPath => 'Ruta temporal de transcodificació';

  @override
  String get adminEnableFallbackFont => 'Activa el tipus de lletra alternatiu';

  @override
  String get adminFallbackFontPath => 'Ruta de la font alternativa';

  @override
  String get adminAllowSegmentDeletion => 'Permet la supressió de segments';

  @override
  String get adminSegmentKeepSeconds => 'Manteniment del segment (segons)';

  @override
  String get adminThrottleBuffering => 'Amortiment de l\'accelerador';

  @override
  String get adminTrickplaySaved => 'S\'ha desat la configuració de Trickplay';

  @override
  String get adminTrickplayLoadFailed =>
      'No s\'ha pogut carregar la configuració de trucada';

  @override
  String get adminEnableHardwareAcceleration =>
      'Activa l\'acceleració de maquinari';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Activa l\'extracció només de fotogrames clau';

  @override
  String get adminKeyFrameSubtitle => 'Més ràpid però amb menor precisió';

  @override
  String get adminScanBehavior => 'Comportament d\'escaneig';

  @override
  String get adminProcessPriority => 'Prioritat del procés';

  @override
  String get adminImageSettings => 'Configuració de la imatge';

  @override
  String get adminIntervalMs => 'Interval (ms)';

  @override
  String get adminCaptureFrameSubtitle =>
      'Amb quina freqüència capturar fotogrames';

  @override
  String get adminWidthResolutions => 'Resolucions d\'amplada';

  @override
  String get adminTileWidth => 'Amplada de rajoles';

  @override
  String get adminTileHeight => 'Alçada de rajoles';

  @override
  String get adminQualitySubtitle =>
      'Valors més baixos = millor qualitat, fitxers més grans';

  @override
  String get adminProcessThreads => 'Processar fils';

  @override
  String get adminResumeSaved => 'Reprèn la configuració desada';

  @override
  String get adminResumeLoadFailed =>
      'No s\'ha pogut carregar la configuració del currículum';

  @override
  String get adminResumeDescription =>
      'Configureu quan s\'ha de marcar el contingut com a reproduït parcialment o totalment.';

  @override
  String get adminMinResumePercentage => 'Percentatge mínim de currículum';

  @override
  String get adminMinResumeSubtitle =>
      'El contingut s\'ha de reproduir més enllà d\'aquest percentatge per desar el progrés';

  @override
  String get adminMaxResumePercentage => 'Percentatge màxim de currículum';

  @override
  String get adminMaxResumeSubtitle =>
      'El contingut es considera que s\'ha reproduït completament després d\'aquest percentatge';

  @override
  String get adminMinResumeDuration => 'Durada mínima del currículum (segons)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Els elements més curts que aquest no es poden reprendre';

  @override
  String get adminMinAudiobookResume =>
      'Percentatge mínim de currículum d\'audiollibre';

  @override
  String get adminMaxAudiobookResume =>
      'Percentatge màxim de currículum d\'audiollibres';

  @override
  String get adminNetworkingSaved =>
      'S\'ha desat la configuració de la xarxa. És possible que sigui necessari un reinici del servidor.';

  @override
  String get adminNetworkingLoadFailed =>
      'No s\'ha pogut carregar la configuració de xarxa';

  @override
  String get adminNetworkingWarning =>
      'Els canvis a la configuració de la xarxa poden requerir un reinici del servidor.';

  @override
  String get adminEnableRemoteAccess => 'Activa l\'accés remot';

  @override
  String get ports => 'Ports';

  @override
  String get adminHttpPort => 'Port HTTP';

  @override
  String get adminHttpsPort => 'Port HTTPS';

  @override
  String get adminPublicHttpsPort => 'Port HTTPS públic';

  @override
  String get adminBaseUrl => 'URL base';

  @override
  String get adminBaseUrlHint => 'p. ex. /gelatina';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Activa HTTPS';

  @override
  String get adminLocalNetwork => 'Xarxa local';

  @override
  String get adminLocalNetworkAddresses => 'Adreces de xarxa local';

  @override
  String get adminKnownProxies => 'Proxies coneguts';

  @override
  String get adminRemoteIpFilter => 'Filtre IP remot';

  @override
  String get adminRemoteIpFilterEntries => 'Filtre IP remot';

  @override
  String get adminCertificatePath => 'Ruta del certificat';

  @override
  String get whitelist => 'Llista blanca';

  @override
  String get blacklist => 'Llista negra';

  @override
  String get notSet => 'No configurat';

  @override
  String get adminMetadataSaved => 'Metadades desades';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'No s\'han pogut carregar les metadades: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'No s\'han pogut desar les metadades: $error';
  }

  @override
  String get adminRefreshMetadata => 'Actualitza les metadades';

  @override
  String get recursive => 'Recursiu';

  @override
  String get adminReplaceAllMetadata => 'Substituïu totes les metadades';

  @override
  String get adminReplaceAllImages => 'Substituïu totes les imatges';

  @override
  String get adminMetadataRefreshRequested =>
      'S\'ha sol·licitat l\'actualització de metadades';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'No s\'han pogut actualitzar les metadades: $error';
  }

  @override
  String get adminNoRemoteMatches => 'No s\'han trobat coincidències remotes';

  @override
  String get adminRemoteResults => 'Resultats a distància';

  @override
  String get adminRemoteMetadataApplied => 'S\'han aplicat metadades remotes';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'La cerca remota ha fallat: $error';
  }

  @override
  String get adminUpdateContentType => 'Actualitza el tipus de contingut';

  @override
  String get adminContentType => 'Tipus de contingut';

  @override
  String get adminContentTypeUpdated =>
      'S\'ha actualitzat el tipus de contingut';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'No s\'ha pogut actualitzar el tipus de contingut: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'No s\'ha pogut carregar l\'editor de metadades';

  @override
  String get adminNoPeopleEntries => 'No hi ha entrades de persones';

  @override
  String get adminNoExternalIds =>
      'No hi ha cap identificació externa disponible';

  @override
  String adminImageUpdated(String imageType) {
    return 'S\'ha actualitzat la imatge $imageType';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'No s\'ha pogut baixar la imatge: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Format d\'imatge no compatible';

  @override
  String get adminImageReadFailed =>
      'No s\'ha pogut llegir la imatge seleccionada';

  @override
  String adminImageUploaded(String imageType) {
    return 'S\'ha penjat la imatge $imageType';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'No s\'ha pogut carregar la imatge: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Suprimeix la imatge $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'S\'ha suprimit la imatge $imageType';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'No s\'ha pogut suprimir la imatge: $error';
  }

  @override
  String get adminAllProviders => 'Tots els proveïdors';

  @override
  String get adminNoRemoteImages => 'No s\'han trobat imatges remotes';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Ha fallat el descobriment del sintonitzador: $error';
  }

  @override
  String get adminAddTuner => 'Afegeix un sintonitzador';

  @override
  String get adminTunerType => 'Tipus de sintonitzador';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Altres';

  @override
  String get adminUrlPath => 'URL / Camí';

  @override
  String get adminNameOptional => 'Nom (opcional)';

  @override
  String get adminTunerAdded => 'S\'ha afegit el sintonitzador';

  @override
  String adminTunerAddFailed(String error) {
    return 'No s\'ha pogut afegir el sintonitzador: $error';
  }

  @override
  String get adminAddGuideProvider => 'Afegeix un proveïdor de guia';

  @override
  String get adminProviderType => 'Tipus de proveïdor';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect o XMLTV';

  @override
  String get adminUsernameOptional => 'Nom d\'usuari (opcional)';

  @override
  String get adminRefreshInterval => 'Interval d\'actualització (hores)';

  @override
  String get adminProviderAdded => 'S\'ha afegit el proveïdor';

  @override
  String adminProviderAddFailed(String error) {
    return 'No s\'ha pogut afegir el proveïdor: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'No s\'ha pogut eliminar el sintonitzador: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'S\'ha sol·licitat el restabliment del sintonitzador';

  @override
  String adminTunerResetFailed(String error) {
    return 'No s\'ha pogut restablir el sintonitzador: $error';
  }

  @override
  String get adminTunerResetNotSupported =>
      'This tuner type does not support resetting.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'No s\'ha pogut eliminar el proveïdor: $error';
  }

  @override
  String get adminRecordingSettings => 'Configuració de gravació';

  @override
  String get adminPrePadding => 'Encoixinat previ (minuts)';

  @override
  String get adminPostPadding => 'Post-encoixinat (minuts)';

  @override
  String get adminRecordingPath => 'Ruta de gravació';

  @override
  String get adminSeriesRecordingPath => 'Ruta d\'enregistrament de la sèrie';

  @override
  String get adminMovieRecordingPath => 'Movie recording path';

  @override
  String get adminGuideDays => 'Guide data days';

  @override
  String get adminGuideDaysAuto => 'Automatic';

  @override
  String adminGuideDaysValue(int days) {
    return '$days days';
  }

  @override
  String get adminRecordingPostProcessor => 'Post-processing application path';

  @override
  String get adminRecordingPostProcessorArgs => 'Post-processor arguments';

  @override
  String get adminSaveRecordingNfo => 'Save recording NFO metadata';

  @override
  String get adminSaveRecordingImages => 'Save recording images';

  @override
  String get adminLiveTvSectionTiming => 'Timing';

  @override
  String get adminLiveTvSectionPaths => 'Recording paths';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-processing';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Guide data: $value';
  }

  @override
  String get adminRecordingSettingsSaved =>
      'S\'ha guardat la configuració de gravació';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'No s\'ha pogut desar la configuració: $error';
  }

  @override
  String get adminSetChannelMappings => 'Estableix mapes de canals';

  @override
  String get adminMappingJson => 'Mapeig JSON';

  @override
  String get adminMappingJsonHint => 'Exemple: mapes de càrrega útil JSON';

  @override
  String get adminChannelMappingsUpdated => 'Mapes de canals actualitzats';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'No s\'han pogut actualitzar els mapes: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'No s\'ha pogut carregar l\'administració de TV en directe';

  @override
  String get adminTunerDevices => 'Dispositius sintonitzadors';

  @override
  String get adminNoTunerHosts =>
      'No s\'ha configurat cap host de sintonitzador';

  @override
  String get adminGuideProviders => 'Proveïdors de guies';

  @override
  String get adminRefreshGuideData => 'Refresh Guide Data';

  @override
  String get adminGuideRefreshStarted => 'Guide data refresh started';

  @override
  String get adminGuideRefreshUnavailable =>
      'Guide refresh task is not available on this server.';

  @override
  String get adminAddProvider => 'Afegeix un proveïdor';

  @override
  String get adminNoListingProviders =>
      'No s\'ha configurat cap proveïdor de llista';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Camí d\'enregistrament: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Camí de la sèrie: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Farciment previ: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Encoixinat posterior: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Descobriment del sintonitzador';

  @override
  String get adminChannelMappings => 'Mapes de canals';

  @override
  String get adminNoDiscoveredTuners =>
      'Encara no s\'han trobat sintonitzadors';

  @override
  String get adminSettingsSaved => 'S\'ha desat la configuració';

  @override
  String get adminBackupsNotAvailable =>
      'Les còpies de seguretat no estan disponibles en aquesta compilació del servidor.';

  @override
  String get adminRestoreWarning1 =>
      'La restauració substituirà TOTES les dades actuals del servidor per les dades de còpia de seguretat.';

  @override
  String get adminRestoreWarning2 =>
      'La configuració actual del servidor, els usuaris i les dades de la biblioteca se sobreescriuran.';

  @override
  String get adminRestoreWarning3 =>
      'El servidor es reiniciarà després de la restauració.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Voleu restaurar la còpia de seguretat $name ara?';
  }

  @override
  String get adminRestoreRequested =>
      'S\'ha sol·licitat la restauració. El reinici del servidor pot desconnectar aquesta sessió.';

  @override
  String get adminBackupsTitle => 'Còpies de seguretat';

  @override
  String get adminUnknownDate => 'Data desconeguda';

  @override
  String get adminUnnamedBackup => 'Còpia de seguretat sense nom';

  @override
  String get adminLiveTvNotAvailable =>
      'L\'administració de TV en directe no està disponible en aquesta compilació de servidor.';

  @override
  String get adminLiveTvTitle => 'Administració de TV en directe';

  @override
  String get adminApply => 'Aplicar';

  @override
  String get adminNotSet => 'No configurat';

  @override
  String get adminReset => 'Restableix';

  @override
  String get adminLogsTitle => 'Registres del servidor';

  @override
  String get adminLogsNewestFirst => 'El més nou primer';

  @override
  String get adminLogsOldestFirst => 'El més vell primer';

  @override
  String get adminLogsJustNow => 'Just ara';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return 'Fa ${minutes}m';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'Fa ${hours}h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'Fa ${days}d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'No s\'ha pogut carregar $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count coincideixen';
  }

  @override
  String get adminLogViewerNoMatches => 'No hi ha línies coincidents';

  @override
  String get adminMetadataEditorTitle => 'Editor de metadades';

  @override
  String get adminMetadataIdentify => 'Identify';

  @override
  String get adminMetadataType => 'Tipus';

  @override
  String get adminMetadataDetails => 'Detalls';

  @override
  String get adminMetadataExternalIds => 'Identificadors externs';

  @override
  String get adminMetadataImages => 'Imatges';

  @override
  String get adminMetadataFieldTitle => 'Títol';

  @override
  String get adminMetadataFieldSortTitle => 'Ordena el títol';

  @override
  String get adminMetadataFieldOriginalTitle => 'Títol original';

  @override
  String get adminMetadataFieldPremiereDate => 'Data d\'estrena (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data de finalització (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Any de producció';

  @override
  String get adminMetadataFieldOfficialRating => 'Classificació oficial';

  @override
  String get adminMetadataFieldCommunityRating => 'Valoració de la comunitat';

  @override
  String get adminMetadataFieldCriticRating => 'Valoració de la crítica';

  @override
  String get adminMetadataFieldTagline => 'Eslogan';

  @override
  String get adminMetadataFieldOverview => 'Visió general';

  @override
  String get adminMetadataGenres => 'Gèneres';

  @override
  String get adminMetadataTags => 'Etiquetes';

  @override
  String get adminMetadataStudios => 'Estudis';

  @override
  String get adminMetadataPeople => 'Gent';

  @override
  String get adminMetadataAddGenre => 'Afegeix gènere';

  @override
  String get adminMetadataAddTag => 'Afegeix una etiqueta';

  @override
  String get adminMetadataAddStudio => 'Afegeix estudi';

  @override
  String get adminMetadataAddPerson => 'Afegeix una persona';

  @override
  String get adminMetadataEditPerson => 'Edita la persona';

  @override
  String get adminMetadataRole => 'Rol';

  @override
  String get adminMetadataImagePrimary => 'primària';

  @override
  String get adminMetadataImageBackdrop => 'Teló de fons';

  @override
  String get adminMetadataImageLogo => 'Logotip';

  @override
  String get adminMetadataImageBanner => 'Bandera';

  @override
  String get adminMetadataImageThumb => 'polze';

  @override
  String get adminMetadataRecursive => 'Recursiu';

  @override
  String get adminMetadataProvider => 'Proveïdor';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return 'S\'ha actualitzat la imatge $imageType';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'S\'ha penjat la imatge $imageType';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'S\'ha suprimit la imatge $imageType';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'No s\'ha pogut baixar la imatge: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'No s\'ha pogut llegir la imatge seleccionada';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'No s\'ha pogut carregar la imatge: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Suprimeix la imatge $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Això elimina la imatge actual de l\'element.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'No s\'ha pogut suprimir la imatge: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Trieu la imatge $imageType';
  }

  @override
  String get adminMetadataUpload => 'Carrega';

  @override
  String get adminMetadataUpdate => 'Actualització';

  @override
  String get adminMetadataRemoteImage => 'Imatge remota';

  @override
  String get adminPluginsInstalled => 'Instal·lat';

  @override
  String get adminPluginsCatalog => 'Catàleg';

  @override
  String get adminPluginsActive => 'Actius';

  @override
  String get adminPluginsRestart => 'Reinicieu';

  @override
  String get adminPluginsNoSearchResults =>
      'Cap connector coincideix amb la vostra cerca';

  @override
  String get adminPluginsNoneInstalled => 'No hi ha connectors instal·lats';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Actualització disponible: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Actualització disponible';

  @override
  String get adminPluginsPendingRemoval =>
      'Pendent d\'eliminació després del reinici';

  @override
  String get adminPluginsChangesPending => 'Canvis pendents de reinici';

  @override
  String get adminPluginsEnable => 'Activa';

  @override
  String get adminPluginsDisable => 'Desactivar';

  @override
  String get adminPluginsInstallUpdate => 'Instal·leu l\'actualització';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instal·la l\'actualització (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'No hi ha cap paquet que coincideixi amb la vostra cerca';

  @override
  String get adminPluginsCatalogEmpty => 'No hi ha paquets disponibles';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" s\'està instal·lant...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integració experimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'La integració de la configuració del connector encara és experimental. És possible que alguns camps o dissenys encara no es representin correctament.';

  @override
  String get adminPluginDetailToggle404 =>
      'No s\'ha pogut canviar el connector. El servidor no ha pogut trobar aquesta versió del connector. Prova d\'actualitzar els connectors i, a continuació, torna-ho a provar.';

  @override
  String get adminPluginDetailToggleDioError =>
      'No s\'ha pogut canviar el connector. Si us plau, comproveu els registres del servidor per obtenir més informació.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Configuració';
  }

  @override
  String get adminPluginDetailDetails => 'Detalls';

  @override
  String get adminPluginDetailDeveloper => 'Desenvolupador';

  @override
  String get adminPluginDetailRepository => 'Repositori';

  @override
  String get adminPluginDetailBundled => 'Empaquetat';

  @override
  String get adminPluginDetailEnablePlugin => 'Activa el connector';

  @override
  String get adminPluginDetailRestartRequired =>
      'Cal reiniciar el servidor perquè els canvis tinguin efecte.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Aquest connector s\'eliminarà després de reiniciar el servidor.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Aquest connector ha funcionat malament i és possible que no funcioni correctament.';

  @override
  String get adminPluginDetailNotSupported =>
      'Aquest connector no és compatible amb la versió actual del servidor.';

  @override
  String get adminPluginDetailSuperseded =>
      'Aquest connector ha estat substituït per una versió més recent.';

  @override
  String adminReposLoadFailed(String error) {
    return 'No s\'han pogut carregar els dipòsits: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Elimina el repositori';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Esteu segur que voleu eliminar \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Eliminar';

  @override
  String adminReposSaveFailed(String error) {
    return 'No s\'han pogut desar els dipòsits: $error';
  }

  @override
  String get adminReposEmpty => 'No s\'ha configurat cap repositori';

  @override
  String get adminReposEmptySubtitle =>
      'Afegiu un repositori per explorar els connectors disponibles';

  @override
  String get adminReposUnnamed => '(sense nom)';

  @override
  String get adminReposEditTitle => 'Edita el repositori';

  @override
  String get adminReposAddTitle => 'Afegeix un repositori';

  @override
  String get adminReposUrl => 'URL del repositori';

  @override
  String get adminReposNameHint => 'p. ex. Jellyfin Estable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL no vàlid';

  @override
  String get adminGeneralSettingsTitle => 'Configuració general';

  @override
  String get adminGeneralMetadataLanguage => 'Idioma de metadades preferit';

  @override
  String get adminGeneralMetadataLanguageHint => 'p. ex. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'País de metadades preferit';

  @override
  String get adminGeneralMetadataCountryHint => 'p. ex. EUA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Concurrència d\'exploració de biblioteques';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Límit de codificació d\'imatges paral·leles';

  @override
  String get adminUnknownError => 'Error desconegut';

  @override
  String get adminBrowse => 'Navega';

  @override
  String get adminCloseBrowser => 'Tanca el navegador';

  @override
  String get adminNetworkingTitle => 'Treball en xarxa';

  @override
  String get adminNetworkingRestartWarning =>
      'Els canvis a la configuració de la xarxa poden requerir un reinici del servidor.';

  @override
  String get adminNetworkingRemoteAccess => 'Activa l\'accés remot';

  @override
  String get adminNetworkingPorts => 'Ports';

  @override
  String get adminNetworkingHttpPort => 'Port HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Port HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Activa HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Xarxa local';

  @override
  String get adminNetworkingLocalAddresses => 'Adreces de xarxa local';

  @override
  String get adminNetworkingAddressHint => 'p. ex. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxies coneguts';

  @override
  String get adminNetworkingProxyHint => 'p. ex. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Llista blanca';

  @override
  String get adminNetworkingBlacklist => 'Llista negra';

  @override
  String get adminNetworkingAddEntry => 'Afegeix una entrada';

  @override
  String get adminBrandingTitle => 'Marca';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Exempció de responsabilitat d\'inici de sessió';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML que es mostra a sota del formulari d\'inici de sessió';

  @override
  String get adminBrandingCustomCss => 'CSS personalitzat';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalitzat aplicat a la interfície web';

  @override
  String get adminBrandingEnableSplash => 'Activa la pantalla de presentació';

  @override
  String get adminBrandingSplashUpload => 'Upload image';

  @override
  String get adminBrandingSplashUploaded => 'Splashscreen updated';

  @override
  String get adminBrandingSplashUploadFailed => 'Failed to upload splashscreen';

  @override
  String get adminBrandingSplashDeleted => 'Splashscreen removed';

  @override
  String get adminBrandingNoSplash => 'No custom splashscreen';

  @override
  String get adminPlaybackHwAccel => 'Acceleració de maquinari';

  @override
  String get adminPlaybackHwAccelLabel => 'Acceleració de maquinari';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Activa la codificació de maquinari';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Activa la descodificació de maquinari per a:';

  @override
  String get adminPlaybackQsvDevice => 'QSV device';

  @override
  String get adminPlaybackEnhancedNvdec => 'Enable enhanced NVDEC decoder';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Prefer system native hardware decoder';

  @override
  String get adminPlaybackColorDepth => 'Hardware decoding color depth';

  @override
  String get adminPlaybackColorDepth10Hevc => '10-bit HEVC decoding';

  @override
  String get adminPlaybackColorDepth10Vp9 => '10-bit VP9 decoding';

  @override
  String get adminPlaybackColorDepth10HevcRext => 'HEVC RExt 8/10-bit decoding';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'HEVC RExt 12-bit decoding';

  @override
  String get adminPlaybackHwEncodingSection => 'Hardware encoding';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Allow HEVC encoding';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Allow AV1 encoding';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Enable Intel low-power H.264 encoder';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Enable Intel low-power HEVC encoder';

  @override
  String get adminPlaybackToneMapping => 'Tone Mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Enable tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Enable VPP tone mapping';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Enable VideoToolbox tone mapping';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Tone mapping algorithm';

  @override
  String get adminPlaybackTonemappingMode => 'Tone mapping mode';

  @override
  String get adminPlaybackTonemappingRange => 'Tone mapping range';

  @override
  String get adminPlaybackTonemappingDesat => 'Tone mapping desaturation';

  @override
  String get adminPlaybackTonemappingPeak => 'Tone mapping peak';

  @override
  String get adminPlaybackTonemappingParam => 'Tone mapping parameter';

  @override
  String get adminPlaybackPresetsQuality => 'Presets & Quality';

  @override
  String get adminPlaybackEncoderPreset => 'Encoder preset';

  @override
  String get adminPlaybackH264Crf => 'H.264 encoding CRF';

  @override
  String get adminPlaybackH265Crf => 'H.265 (HEVC) encoding CRF';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Deinterlace method';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Enable audio VBR encoding';

  @override
  String get adminPlaybackDownmixBoost => 'Audio downmix boost';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Stereo downmix algorithm';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Max muxing queue size';

  @override
  String get adminPlaybackAutoOption => 'Auto';

  @override
  String get adminPlaybackEncoding => 'Codificació';

  @override
  String get adminPlaybackEncodingThreads => 'Codificació de fils';

  @override
  String get adminPlaybackFallbackFont =>
      'Activa el tipus de lletra alternatiu';

  @override
  String get adminPlaybackFallbackFontPath => 'Ruta de la font alternativa';

  @override
  String get adminPlaybackStreaming => 'Transmissió en continu';

  @override
  String get adminResumeVideo => 'Vídeo';

  @override
  String get adminResumeAudiobooks => 'Audiollibres';

  @override
  String get adminResumeMinAudiobookPct =>
      'Percentatge mínim de currículum d\'audiollibre';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Percentatge màxim de currículum d\'audiollibres';

  @override
  String get adminStreamingBitrateLimit =>
      'Límit de velocitat de bits del client remot (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint => 'Deixeu buit o 0 per il·limitat';

  @override
  String get adminTrickplayHwAccel => 'Activa l\'acceleració de maquinari';

  @override
  String get adminTrickplayHwEncoding => 'Activa la codificació de maquinari';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Activa l\'extracció només de fotogrames clau';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Més ràpid però amb menor precisió';

  @override
  String get adminTrickplayNonBlocking => 'Sense bloqueig';

  @override
  String get adminTrickplayBlocking => 'Bloqueig';

  @override
  String get adminTrickplayPriorityHigh => 'Alt';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Per sobre del normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Per sota de la normalitat';

  @override
  String get adminTrickplayPriorityIdle => 'Inactiu';

  @override
  String get adminTrickplayImageSettings => 'Configuració de la imatge';

  @override
  String get adminTrickplayInterval => 'Interval (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Amb quina freqüència capturar fotogrames';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Amplades de píxels separades per comes (p. ex., 320)';

  @override
  String get adminTrickplayQuality => 'Qualitat';

  @override
  String get adminTrickplayQScale => 'Escala de qualitat';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valors més baixos = millor qualitat, fitxers més grans';

  @override
  String get adminTrickplayJpegQuality => 'Qualitat JPEG';

  @override
  String get adminTrickplayProcessing => 'Tramitació';

  @override
  String get adminTasksEmpty => 'No s\'han trobat tasques programades';

  @override
  String get adminTasksNoFilterMatch =>
      'Cap tasca coincideix amb el filtre actual';

  @override
  String get adminTaskCancelling => 'S\'està cancel·lant...';

  @override
  String get adminTaskRunning => 'Córrer...';

  @override
  String get adminTaskNeverRun => 'No córrer mai';

  @override
  String get adminTaskStop => 'Atureu-vos';

  @override
  String get adminRunningTasks => 'Running Tasks';

  @override
  String get adminTaskRun => 'Corre';

  @override
  String get adminTaskDetailLastExecution => 'Última Execució';

  @override
  String get adminTaskDetailStarted => 'Començat';

  @override
  String get adminTaskDetailEnded => 'S\'ha acabat';

  @override
  String get adminTaskDetailDuration => 'Durada';

  @override
  String get adminTaskDetailErrorLabel => 'Error:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Cada dia a $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Cada $day a $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Cada $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'A l\'inici de l\'aplicació';

  @override
  String get adminTaskTriggerTypeDaily => 'Diàriament';

  @override
  String get adminTaskTriggerTypeWeekly => 'Setmanalment';

  @override
  String get adminTaskTriggerTypeInterval => 'En un interval';

  @override
  String get adminTaskTriggerIntervalLabel => 'Interval';

  @override
  String get adminTaskTriggerEveryHour => 'Cada hora';

  @override
  String get adminTaskTriggerEvery6Hours => 'Cada 6 hores';

  @override
  String get adminTaskTriggerEvery12Hours => 'Cada 12 hores';

  @override
  String get adminTaskTriggerEvery24Hours => 'Cada 24 hores';

  @override
  String get adminTaskTriggerEvery2Days => 'Cada 2 dies';

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
  String get adminTaskTriggerTime => 'Temps';

  @override
  String get adminTaskTriggerNoLimit => 'Sense límit';

  @override
  String get adminActivityJustNow => 'Just ara';

  @override
  String get adminActivityLastHour => 'Última hora';

  @override
  String get adminActivityToday => 'Avui';

  @override
  String get adminActivityYesterday => 'Ahir';

  @override
  String get adminActivityOlder => 'Més vell';

  @override
  String adminActivityDaysAgo(int days) {
    return 'Fa ${days}d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'Fa ${hours}h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'Fa ${minutes}m';
  }

  @override
  String get adminActivityNow => 'ara';

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
      'Configura la generació d\'imatges Trickplay per a les miniatures de previsualització de cerca.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Port HTTPS públic';

  @override
  String get adminNetworkingBaseUrl => 'URL base';

  @override
  String get adminNetworkingBaseUrlHint => 'p. ex. /gelatina';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Public HTTP port';

  @override
  String get adminNetworkingRequireHttps => 'Require HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirect all remote requests to HTTPS. Has no effect if the server has no valid certificate.';

  @override
  String get adminNetworkingCertPassword => 'Certificate password';

  @override
  String get adminNetworkingIpSettings => 'IP Settings';

  @override
  String get adminNetworkingEnableIpv4 => 'Enable IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Enable IPv6';

  @override
  String get adminNetworkingAutoDiscovery => 'Enable automatic port mapping';

  @override
  String get adminNetworkingLocalSubnets => 'LAN networks';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Comma or line separated list of IP addresses or CIDR subnets treated as being on the local network.';

  @override
  String get adminNetworkingPublishedUris => 'Published server URIs';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Map a subnet or address to a published URL, e.g. all=https://example.com';

  @override
  String get adminNetworkingCertPath => 'Ruta del certificat';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filtre IP remot';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtre IP remot';

  @override
  String get adminPlaybackVaapiDevice => 'Dispositiu VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automàtic';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Ruta temporal de transcodificació';

  @override
  String get adminPlaybackSegmentDeletion => 'Permet la supressió de segments';

  @override
  String get adminPlaybackSegmentKeep => 'Manteniment del segment (segons)';

  @override
  String get adminPlaybackThrottleBuffering => 'Amortiment de l\'accelerador';

  @override
  String get adminResumeMinPct => 'Percentatge mínim de currículum';

  @override
  String get adminResumeMinPctSubtitle =>
      'El contingut s\'ha de reproduir més enllà d\'aquest percentatge per desar el progrés';

  @override
  String get adminResumeMaxPct => 'Percentatge màxim de currículum';

  @override
  String get adminResumeMaxPctSubtitle =>
      'El contingut es considera que s\'ha reproduït completament després d\'aquest percentatge';

  @override
  String get adminResumeMinDuration => 'Durada mínima del currículum (segons)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Els elements més curts que aquest no es poden reprendre';

  @override
  String get adminTrickplayScanBehavior => 'Comportament d\'escaneig';

  @override
  String get adminTrickplayProcessPriority => 'Prioritat del procés';

  @override
  String get adminTrickplayTileWidth => 'Amplada de rajoles';

  @override
  String get adminTrickplayTileHeight => 'Alçada de rajoles';

  @override
  String get adminTrickplayProcessThreads => 'Processar fils';

  @override
  String get adminTrickplayWidthResolutions => 'Resolucions d\'amplada';

  @override
  String get adminMetadataDefault => 'Per defecte';

  @override
  String get adminMetadataContentTypeUpdated =>
      'S\'ha actualitzat el tipus de contingut';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'No s\'ha pogut actualitzar el tipus de contingut: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Llindar de resposta lenta (ms)';

  @override
  String get adminGeneralEnableSlowResponse => 'Enable slow response warnings';

  @override
  String get adminGeneralQuickConnect => 'Enable Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Server';

  @override
  String get adminGeneralSectionMetadata => 'Metadata';

  @override
  String get adminGeneralSectionPaths => 'Paths';

  @override
  String get adminGeneralSectionPerformance => 'Performance';

  @override
  String get adminGeneralCachePath => 'Camí de la memòria cau';

  @override
  String get adminGeneralMetadataPath => 'Camí de metadades';

  @override
  String get adminGeneralServerName => 'Nom del servidor';

  @override
  String get adminSettingsLoadFailed =>
      'No s\'ha pogut carregar la configuració';

  @override
  String get adminDiscover => 'Descobreix';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'No s\'han pogut actualitzar els mapes: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Límit de temps: $duration';
  }

  @override
  String get folders => 'Carpetes';

  @override
  String get libraries => 'Biblioteques';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay desactivat';

  @override
  String get syncPlayDisabledMessage =>
      'Activeu SyncPlay a Configuració per utilitzar la reproducció sincronitzada.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Servidor no compatible';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay requereix un servidor Jellyfin. El servidor actual no ho admet.';

  @override
  String get syncPlayGroupFallbackName => 'Grup SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Grup SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ignora l\'espera';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'No mantingueu el grup aixecat mentre aquest dispositiu es guarda a la memòria intermèdia';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continueu localment sense esperar membres lents';

  @override
  String get syncPlayRepeat => 'Repetiu';

  @override
  String get syncPlayRepeatOne => 'Un';

  @override
  String get syncPlayShuffleModeShuffled => 'Remenat';

  @override
  String get syncPlayShuffleModeSorted => 'Ordenat';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronitza la cua de reproducció actual';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Substituïu la cua del grup pel que es reprodueix localment';

  @override
  String get syncPlayLeaveGroup => 'Abandonar el grup';

  @override
  String get syncPlayGroupQueue => 'Cua de grup';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Element $index';
  }

  @override
  String get syncPlayPlayNow => 'Reprodueix';

  @override
  String get syncPlayCreateNewGroup => 'Crea un grup nou';

  @override
  String get syncPlayGroupName => 'Nom del grup';

  @override
  String get syncPlayDefaultGroupName => 'El meu grup de SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Crear grup';

  @override
  String get syncPlayAvailableGroups => 'Grups disponibles';

  @override
  String get syncPlayNoGroupsAvailable => 'No hi ha grups disponibles';

  @override
  String get syncPlayJoinGroupQuestion => 'Vols unir-te al grup de SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Unir-se a un grup de SyncPlay pot substituir la vostra cua de reproducció actual. Continuar?';

  @override
  String get syncPlayJoin => 'Uneix-te';

  @override
  String get syncPlayStateIdle => 'Inactiu';

  @override
  String get syncPlayStateWaiting => 'Esperant';

  @override
  String get syncPlayStatePaused => 'En pausa';

  @override
  String get syncPlayStatePlaying => 'Reproduint';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName s\'ha unit al grup SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName va sortir del grup SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Accés a SyncPlay denegat';

  @override
  String get syncPlayAccessDeniedMessage =>
      'No teniu accés a un o més elements d\'aquest grup de SyncPlay. Demaneu al propietari del grup que verifiqui els permisos de la biblioteca o escolliu una cua diferent.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'S\'està sincronitzant la reproducció amb $groupName';
  }

  @override
  String get voiceSearchUnavailable => 'La cerca per veu no està disponible.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'La reproducció directa de Dolby Vision ha fallat';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'La reproducció directa no s\'ha pogut iniciar per a aquest flux de Dolby Vision. Tornar a provar d\'utilitzar la transcodificació del servidor?';

  @override
  String get retryWithTranscode => 'Torna-ho a provar amb la transcodificació';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision no compatible';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Aquest dispositiu no pot descodificar el contingut Dolby Vision directament. Utilitzeu la alternativa HDR10 o sol·liciteu la transcodificació del servidor.';

  @override
  String get rememberMyChoice => 'Recordeu la meva elecció';

  @override
  String get playHdr10Fallback => 'Reprodueix HDR10 alternativa';

  @override
  String get requestTranscode => 'Sol·licita la transcodificació';

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
  String get seeAll => 'Veure-ho tot';

  @override
  String get noItems => 'No hi ha articles';

  @override
  String get switchUser => 'Canvia d\'usuari';

  @override
  String get remoteControl => 'Control remot';

  @override
  String get mediaBarLoading => 'S\'està carregant la barra multimèdia...';

  @override
  String get mediaBarError => 'La barra multimèdia no s\'ha pogut carregar';

  @override
  String get offlineServerUnavailable =>
      'Connectat a Internet, però el servidor actual no està disponible.';

  @override
  String get offlineNoInternet =>
      'Estàs fora de línia. Només el contingut descarregat està disponible.';

  @override
  String get offlineFileNotAvailable => 'Fitxer no disponible';

  @override
  String get offlineSwitchServer => 'Canvia de servidor';

  @override
  String get offlineSavedMedia => 'Mitjans desats';

  @override
  String get offlineBannerTitle => 'You\'re offline';

  @override
  String get offlineBannerSubtitle => 'Showing your downloads';

  @override
  String get offlineBannerAction => 'Downloads';

  @override
  String get serverUnreachableBannerTitle => 'Can\'t reach your server';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Playing from downloads until it\'s back';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Reproducció remota';

  @override
  String castControlFailed(String error) {
    return 'El control de l\'emissió ha fallat: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Volum del dispositiu';

  @override
  String get castVolumeUnavailable => 'No disponible';

  @override
  String castStopKind(String kind) {
    return 'Atura $kind';
  }

  @override
  String get audioLabel => 'Àudio';

  @override
  String get subtitlesLabel => 'Subtítols';

  @override
  String get pinConfirmTitle => 'Confirmeu el PIN';

  @override
  String get pinSetTitle => 'Estableix el PIN';

  @override
  String get pinEnterTitle => 'Introduïu el PIN';

  @override
  String get pinReenterToConfirm =>
      'Torna a introduir el teu PIN per confirmar';

  @override
  String pinEnterNDigit(int length) {
    return 'Introduïu un PIN de $length';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Introduïu el vostre PIN de dígits $length';
  }

  @override
  String get pinIncorrect => 'PIN incorrecte';

  @override
  String get pinMismatch => 'Els PIN no coincideixen';

  @override
  String get pinForgot => 'Heu oblidat el PIN?';

  @override
  String get pinClear => 'Clar';

  @override
  String get pinBackspace => 'Retrocés';

  @override
  String get quickConnectAuthorized =>
      'S\'ha autoritzat la sol·licitud de connexió ràpida.';

  @override
  String get quickConnectInvalidOrExpired =>
      'El codi de connexió ràpida no és vàlid o ha caducat.';

  @override
  String get quickConnectNotSupported =>
      'La connexió ràpida no és compatible amb aquest servidor.';

  @override
  String get quickConnectAuthorizeFailed =>
      'No s\'ha pogut autoritzar el codi de connexió ràpida.';

  @override
  String get quickConnectDisabled =>
      'La connexió ràpida està desactivada en aquest servidor.';

  @override
  String get quickConnectForbidden =>
      'El vostre compte no pot autoritzar aquesta sol·licitud de connexió ràpida.';

  @override
  String get quickConnectNotFound =>
      'No s\'ha trobat el codi de connexió ràpida. Prova amb un codi nou.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'La connexió ràpida ha fallat: $message';
  }

  @override
  String get quickConnectEnterCode => 'Introduïu el codi';

  @override
  String get quickConnectAuthorize => 'Autoritzar';

  @override
  String remoteCommandFailed(String error) {
    return 'L\'ordre ha fallat: $error';
  }

  @override
  String get remoteControlTitle => 'Control remot';

  @override
  String get remoteFailedToLoadSessions =>
      'No s\'han pogut carregar les sessions';

  @override
  String get remoteNoSessions => 'Sense sessions controlables';

  @override
  String get remoteStartPlayback =>
      'Inicia la reproducció en un altre dispositiu';

  @override
  String get unknownUser => 'Desconegut';

  @override
  String get unknownItem => 'Desconegut';

  @override
  String get remoteNothingPlaying => 'No es reprodueix res en aquesta sessió';

  @override
  String get castingStarted =>
      'L\'emissió ha començat al dispositiu seleccionat';

  @override
  String castingFailed(String error) {
    return 'No s\'ha pogut començar a emetre: $error';
  }

  @override
  String get noRemoteDevices =>
      'No hi ha cap dispositiu de reproducció remota disponible.';

  @override
  String get noRemoteDevicesIos =>
      'No hi ha cap dispositiu de reproducció remota disponible.\n\nA iOS, és possible que els objectius d\'AirPlay no estiguin disponibles al simulador.';

  @override
  String get trackActionPlayNext => 'Reproduir a continuació';

  @override
  String get trackActionAddToQueue => 'Afegeix a la cua';

  @override
  String get trackActionAddToPlaylist => 'Afegeix a la llista de reproducció';

  @override
  String get trackActionCancelDownload => 'Cancel·la la descàrrega';

  @override
  String get trackActionDeleteFromPlaylist =>
      'Suprimeix de la llista de reproducció';

  @override
  String get trackActionMoveUp => 'Mou cap amunt';

  @override
  String get trackActionMoveDown => 'Mou cap avall';

  @override
  String get trackActionRemoveFromFavorites => 'Elimina dels preferits';

  @override
  String get trackActionAddToFavorites => 'Afegeix a Preferits';

  @override
  String get trackActionGoToAlbum => 'Vés a l\'àlbum';

  @override
  String get trackActionGoToArtist => 'Vés a Artista';

  @override
  String trackActionDownloading(String name) {
    return 'S\'està baixant $name...';
  }

  @override
  String get trackActionDeletedFile => 'S\'ha suprimit el fitxer descarregat';

  @override
  String get trackActionDeleteFileFailed =>
      'No s\'ha pogut suprimir el fitxer baixat';

  @override
  String get shuffleBy => 'Barrejar per';

  @override
  String get shuffleSelectLibrary => 'Seleccioneu Biblioteca';

  @override
  String get shuffleSelectGenre => 'Seleccioneu Gènere';

  @override
  String get shuffleLibrary => 'Biblioteca';

  @override
  String get shuffleGenre => 'Gènere';

  @override
  String get shuffleNoLibraries =>
      'No hi ha biblioteques compatibles disponibles.';

  @override
  String get shuffleNoGenres =>
      'No s\'han trobat gèneres per a aquest mode aleatori.';

  @override
  String get posterDisplayTitle => 'Mostra';

  @override
  String get posterImageType => 'Tipus d\'imatge';

  @override
  String get imageTypePoster => 'Cartell';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Bandera';

  @override
  String get playlistAddFailed =>
      'No s\'ha pogut afegir a la llista de reproducció';

  @override
  String get playlistCreateFailed =>
      'No s\'ha pogut crear la llista de reproducció';

  @override
  String get playlistNew => 'Nova llista de reproducció';

  @override
  String get playlistCreate => 'Crear';

  @override
  String get playlistCreateNew => 'Crea una nova llista de reproducció';

  @override
  String get playlistNoneFound => 'No s\'han trobat llistes de reproducció';

  @override
  String get addToPlaylist => 'Afegeix a la llista de reproducció';

  @override
  String get lyricsNotAvailable => 'No hi ha lletra disponible';

  @override
  String get upNext => 'A continuació';

  @override
  String get playNext => 'Reproduir a continuació';

  @override
  String get stillWatchingContent =>
      'La reproducció s\'ha posat en pausa. Encara estàs mirant?';

  @override
  String get stillWatchingStop => 'Atureu-vos';

  @override
  String get stillWatchingContinue => 'Continua';

  @override
  String skipSegment(String segment) {
    return 'Omet $segment';
  }

  @override
  String get liveTv => 'TV en directe';

  @override
  String get continueWatchingAndNextUp => 'Continueu mirant i a continuació';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'S\'està baixant $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'S\'està baixant $fileName';
  }

  @override
  String get nextEpisode => 'Següent episodi';

  @override
  String get moreFromThisSeason => 'Més d\'aquesta temporada';

  @override
  String get playerTooltipPlaybackSpeed => 'Velocitat de reproducció';

  @override
  String get playerTooltipCastControls => 'Controls d\'emissió';

  @override
  String get playerTooltipPlaybackQuality => 'Taxa de bits';

  @override
  String get playerTooltipEnterFullscreen => 'Entra a pantalla completa';

  @override
  String get playerTooltipExitFullscreen => 'Sortir de pantalla completa';

  @override
  String get playerTooltipFloatOnTop => 'Flota a sobre';

  @override
  String get playerTooltipExitFloatOnTop =>
      'Desactiva el flotador a la part superior';

  @override
  String get playerTooltipLockLandscape => 'Paisatge de bloqueig';

  @override
  String get playerTooltipUnlockOrientation => 'Permetre la rotació';

  @override
  String get playerTooltipPrevious => 'Anterior';

  @override
  String get playerTooltipSeekBack => 'Busca enrere';

  @override
  String get playerTooltipSeekForward => 'Busca endavant';

  @override
  String get contextMenuMarkWatched => 'Marca com a vist';

  @override
  String get contextMenuMarkUnwatched => 'Marca com a no observat';

  @override
  String get contextMenuAddToFavorites => 'Afegeix a Preferits';

  @override
  String get contextMenuRemoveFromFavorites => 'Elimina dels preferits';

  @override
  String get contextMenuGoToSeries => 'Vés a Sèrie';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Hide from Continue Watching';

  @override
  String get contextMenuHideFromNextUp => 'Hide from Next Up';

  @override
  String get contextMenuAddToCollection => 'Add to Collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Accediu al panell d\'administració del servidor';

  @override
  String get settingsAccountSecurity => 'Compte i seguretat';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autenticació, codi PIN i controls parentals';

  @override
  String get settingsPersonalization => 'Personalització';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navegació, files d\'inici i visibilitat de la biblioteca';

  @override
  String get settingsDynamicContent => 'Contingut dinàmic';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra multimèdia i superposicions visuals';

  @override
  String get settingsPlaybackSyncplay => 'Reproducció i SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Configuració d\'àudio/vídeo, subtítols, descàrregues i controls de SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sincronització de connectors, Seerr, puntuacions i molt més';

  @override
  String get settingsAboutSubtitle =>
      'Versió de l\'aplicació, informació legal i crèdits';

  @override
  String get settingsAuthenticationSection => 'Autenticació';

  @override
  String get settingsSortServersBy => 'Ordena servidors per';

  @override
  String get settingsLastUsed => 'Darrer ús';

  @override
  String get settingsAlphabetical => 'Alfabètic';

  @override
  String get settingsConnectionSection => 'CONNECTION';

  @override
  String get settingsAllowSelfSignedCerts => 'Allow self-signed certificates';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Trust servers using self-signed or private-CA TLS certificates. Only enable for servers you control. This disables certificate validation for all connections.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACITAT I SEGURETAT';

  @override
  String get settingsBlockedRatings => 'Classificacions bloquejades';

  @override
  String get settingsGeneralStyle => 'Estil general';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Accents temàtics, fons, indicadors de visualització i música de tema';

  @override
  String get settingsDetailsScreen => 'Details Screen';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Style, background blur, and tab behavior';

  @override
  String get settingsHomePage => 'Pàgina d\'inici';

  @override
  String get settingsHomePageSubtitle =>
      'Seccions, tipus d\'imatge, superposicions i previsualitzacions multimèdia';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilitat de la biblioteca, visualització de carpetes i comportament multiservidor';

  @override
  String get settingsTwentyFourHourClock => 'Rellotge de 24 hores';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Utilitzeu el format de 24 hores allà on es mostri el rellotge';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Mostra el botó de reproducció aleatòria a la barra de navegació';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Mostra el botó de gèneres a la barra de navegació';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Mostra el botó de preferits a la barra de navegació';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostra el botó de biblioteques a la barra de navegació';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Mostra el botó de Seerr a la barra de navegació';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Always show text labels in the top navigation bar';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Commuta la visibilitat de la pàgina d\'inici per biblioteca. Reinicieu Moonfin perquè els canvis tinguin efecte.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barra multimèdia i visualitzacions prèvies locals';

  @override
  String get settingsVisualOverlays => 'Superposicions visuals';

  @override
  String get settingsSeasonalSurprise => 'Sorpresa de temporada';

  @override
  String get settingsMetadataAndRatings => 'Metadades i puntuacions';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase potencia les integracions del servidor, incloses fonts de qualificació addicionals, sol·licituds de Seerr i preferències sincronitzades.';

  @override
  String get settingsOfflineDownloads => 'Descàrregues fora de línia';

  @override
  String get settingsHigh => 'Alt';

  @override
  String get settingsLow => 'Baixa';

  @override
  String get settingsCustomPath => 'Camí personalitzat';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Introduïu el camí de la carpeta de descàrrega';

  @override
  String get settingsConcurrentDownloads => 'Descàrregues concurrents';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Nombre màxim d\'elements per descarregar alhora.';

  @override
  String get settingsAppInfo => 'INFORMACIÓ DE L\'APP';

  @override
  String get settingsReportAnIssue => 'Informar d\'un problema';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Obriu el rastrejador de problemes a GitHub';

  @override
  String get settingsJoinDiscord => 'Uneix-te a Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Xateja amb la comunitat';

  @override
  String get settingsJoinTheDiscord => 'Uneix-te al Discord';

  @override
  String get settingsSupportMoonfin => 'Suport Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Dona un cafè al desenvolupador';

  @override
  String get settingsLegal => 'LEGAL';

  @override
  String get settingsLicenses => 'Llicències';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avisos de llicència de codi obert';

  @override
  String get settingsPrivacyPolicy => 'Política de privadesa';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Com Moonfin gestiona les vostres dades';

  @override
  String get settingsCheckForUpdates => 'Comproveu si hi ha actualitzacions';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Comproveu l\'últim llançament de Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Desenvolupat per Flutter';

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
  String get settingsBoth => 'Tots dos';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Barreja el filtre de tipus de contingut';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferències de reproducció de vídeo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Motor de vídeo bàsic i configuració de qualitat de transmissió';

  @override
  String get settingsAudioPreferences => 'Preferències d\'àudio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Pistes d\'àudio, processament i opcions de transmissió';

  @override
  String get settingsAutomationAndQueue => 'Automatització i cua';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Reproducció i seqüenciació automàtica';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Qualitat de la baixada, límits d\'emmagatzematge i mida de la cua';

  @override
  String get settingsSyncplaySubtitle =>
      'Lògica de sincronització per a sessions de grup';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Característiques especialitzades del reproductor. Feu servir amb precaució, ja que algunes opcions poden causar problemes de reproducció';

  @override
  String get settingsSkipIntrosAndOutros => 'Ometeu introduccions i altres?';

  @override
  String get settingsMediaSegmentCountdown => 'Compte enrere per els segments';

  @override
  String get settingsProgressBar => 'Barra de progrés';

  @override
  String get settingsTimer => 'Temporitzador';

  @override
  String get settingsNone => 'Cap';

  @override
  String get settingsPromptUser => 'Usuari prompte';

  @override
  String get settingsSkip => 'Saltar';

  @override
  String get settingsDoNothing => 'No fer res';

  @override
  String get settingsMaxBitrateDescription =>
      'Limiteu la taxa de bits de transmissió. El contingut per sobre d\'aquest llindar es transcodificarà per adaptar-se.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limiteu la resolució màxima que demanarà el reproductor. El contingut de més alta resolució es transcodificarà cap avall.';

  @override
  String get settingsPlayerZoomDescription =>
      'Com s\'ha d\'escalar el vídeo per adaptar-se a la pantalla.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Motor de reproducció (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Trieu el motor de reproducció predeterminat als dispositius Android TV. Els canvis s\'apliquen a la següent sessió de reproducció.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recomanat)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (herència)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (legat)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recomanat)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision Alternativa';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportament dels títols Dolby Vision en dispositius sense descodificació Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Preguntar cada cop';

  @override
  String get settingsPreferHdr10Fallback => 'Preferiu la alternativa HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Prefereix la transcodificació del servidor';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Perfil 7 Direct Play';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controla si els fluxos de capa de millora del perfil Dolby Vision 7 han de dirigir la reproducció.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automàtic (AFTKRT habilitat)';

  @override
  String get settingsEnabledOnThisDevice => 'Habilitat en aquest dispositiu';

  @override
  String get settingsDisabledPreferTranscode =>
      'Desactivat (prefereix la transcodificació)';

  @override
  String get settingsResumeRewindDescription =>
      'Quan es reprèn la reproducció (des de Continuar mirant o des de la pàgina d\'un element multimèdia), quants segons s\'han de rebobinar?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Quan es reprèn la reproducció després de prémer el botó de pausa, quants segons s\'han de rebobinar?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Quants segons cal saltar enrere després de prémer el botó de rebobinar.';

  @override
  String get settingsOneSecond => '1 segon';

  @override
  String get settingsThreeSeconds => '3 segons';

  @override
  String get settingsFortyFiveSeconds => '45 segons';

  @override
  String get settingsSixtySeconds => '60 segons';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Quants segons cal saltar endavant després de prémer el botó d\'avançament ràpid.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 a descodificador extern';

  @override
  String get settingsCinemaMode => 'Mode cinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Reprodueix tràilers/prerolls abans d\'una funció principal';

  @override
  String get settingsNextUpDisplayDescription =>
      'Ampliat mostra una targeta completa amb il·lustració i descripció de l\'episodi. Minimal mostra una superposició de compte enrere compacta. Desactivat amaga completament el missatge.';

  @override
  String get settingsShort => 'Curta';

  @override
  String get settingsLong => 'Llarg';

  @override
  String get settingsVeryLong => 'Molt llarg';

  @override
  String get settingsVideoStartDelay => 'Retard d\'inici de vídeo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV en directe';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Activa la reproducció directa per a la televisió en directe';

  @override
  String get settingsOpenGroups => 'Grups oberts';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Crea, uneix-te o gestiona grups de SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay habilitat';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Activa les funcions de visualització en grup';

  @override
  String get settingsSyncplayButton => 'Botó SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostra el botó SyncPlay a la barra de navegació';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correcció avançada';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Activa la lògica de sincronització detallada';

  @override
  String get settingsSyncplaySyncCorrection => 'Correcció de sincronització';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Ajusta automàticament la reproducció per mantenir-se sincronitzat';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocitat per sincronitzar';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Utilitzeu l\'ajust de velocitat de reproducció per sincronitzar';

  @override
  String get settingsSyncplaySkipToSync => 'Passeu a la sincronització';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Utilitzeu la cerca de sincronització';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Retard de velocitat mínima';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Retard de velocitat màxima';

  @override
  String get settingsSyncplaySpeedDuration => 'Velocitat Durada';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Retard mínim de salt';

  @override
  String get settingsSyncplayExtraOffset =>
      'Desplaçament addicional de SyncPlay';

  @override
  String get onNow => 'En Ara';

  @override
  String get collections => 'Col·leccions';

  @override
  String get lastPlayed => 'Última reproducció';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Última $libraryName';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '';
  }

  @override
  String get autoplayNextEpisode =>
      'Reprodueix automàticament el següent episodi';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Reprodueix automàticament el següent episodi quan estigui disponible.';

  @override
  String get skipSilenceTitle => 'Saltar el silenci';

  @override
  String get skipSilenceSubtitle =>
      'Omet automàticament els segments d\'àudio silenciosos quan el flux ho admet.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Permet efectes d\'àudio externs';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permet que les aplicacions d\'equalitzador i efectes (per exemple, Wavelet) s\'adjuntin a les sessions de reproducció Media3.';

  @override
  String get disableTunnelingTitle => 'Desactiva el túnel';

  @override
  String get disableTunnelingSubtitle =>
      'Força la reproducció sense túnel. Útil en dispositius amb discontinuïtats d\'àudio/vídeo de túnel.';

  @override
  String get enableTunnelingTitle => 'Habilita tunneling';

  @override
  String get enableTunnelingSubtitle =>
      'Avançat. Envia àudio i vídeo a través d\'una ruta de maquinari acoblada. Desactivat per defecte perquè causa caigudes d\'àudio / vídeo en alguns dispositius.';

  @override
  String get mapDolbyVisionP7Title => 'Assigna el perfil Dolby Vision 7 a HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Reprodueix 7 reproduccions del perfil HDR10 com a HEVC compatible amb HDR10 en dispositius que no siguin DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Utilitzeu estils de subtítols incrustats';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Apliqueu colors, tipus de lletra i posicionament incrustats a la pista de subtítols. Desactiva l\'ús de les teves preferències d\'estil de subtítols.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Utilitzeu mides de lletra de subtítols incrustades';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Apliqueu consells de mida de lletra incrustats a la pista de subtítols. Desactiveu l\'ús de la mida dels subtítols de les vostres preferències d\'estil.';

  @override
  String get showMediaDetailsOnLibraryPage =>
      'Mostra els detalls del contingut multimèdia';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Mostra els detalls de l\'item seleccionat a dalt la pàgina de Biblioteca.';

  @override
  String get useDetailedSubHeadings => 'Utilitzeu subtítols detallats';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Mostra una subfila detallada o mínima a les pàgines de la biblioteca.';

  @override
  String get savedThemesDeleteDialogTitle => 'Vols suprimir el tema desat?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Vols suprimir \"$themeName\" de la memòria cau d\'aquest dispositiu?';
  }

  @override
  String get themeStore => 'Botiga de temes';

  @override
  String get themeStoreSubtitle => 'Cerca i guarda temes de la comunitat';

  @override
  String get themeStoreDescription =>
      'Guarda un tema per a usarlo com els altres temes guardats.';

  @override
  String get themeStoreEmpty => 'No hi ha temes disponibles en aquest moment.';

  @override
  String get themeStoreLoadFailed =>
      'No s\'ha pogut carregar la botiga de temes. Verifica la teva conexió i intenta-ho de nou.';

  @override
  String get themeStoreSave => 'Guardar';

  @override
  String get themeStoreSaveAndApply => 'Guardar i aplicar';

  @override
  String get themeStoreSaved => 'Guardat';

  @override
  String get themeStoreInvalidMessage => 'Aquest tema no s\'ha pogut carregar.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return 'Guardat \"$themeName\".';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'S\'ha suprimit \"$themeName\" d\'aquest dispositiu.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'No s\'ha pogut suprimir \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Temes guardats';

  @override
  String get savedThemesDescription =>
      'Aquests són temes baixats del connector Moonfin per al servidor actual. En suprimir, només s\'elimina aquesta còpia local.';

  @override
  String get savedThemesEmpty =>
      'No s\'ha trobat cap tema desat per a aquest servidor.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Actualment actiu';
  }

  @override
  String get savedThemesDeleteTooltip => 'Suprimeix el tema desat';

  @override
  String get savedThemesManageSubtitle =>
      'Gestiona els temes de connectors baixats en aquest dispositiu';

  @override
  String get themeEditor => 'Editor de temes';

  @override
  String get themeEditorSubtitle =>
      'Obriu l\'editor de temes Moonfin al vostre navegador';

  @override
  String get homeScreen => 'Pantalla d\'inici';

  @override
  String get bottomBar => 'Barra inferior';

  @override
  String get homeRowsStyleClassic => 'Clàssic';

  @override
  String get homeRowsStyleModern => 'Modern';

  @override
  String get homeRowsSection => 'Files d\'inici';

  @override
  String get homeRowDisplay => 'Visualització de les fileres d\'inici';

  @override
  String get homeRowSections => 'Seccions de les fileres d\'inici';

  @override
  String get homeRowToggles => 'Activació de les fileres d\'inici';

  @override
  String get homeRowTogglesSubtitle => '';

  @override
  String get homeRowTogglesDescription => '';

  @override
  String get rowsType => 'Tipus de files';

  @override
  String get rowsTypeDescription =>
      'El clàssic manté el tipus d\'imatge per fila i la superposició d\'informació. Modern utilitza files de retrat a fons.';

  @override
  String get displayFavoritesRows => 'Mostra les files de preferits';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Mostra pel·lícules, sèries i altres files preferides a les seccions d\'inici.';

  @override
  String get favoritesRowSorting => 'Classificació de files de preferits';

  @override
  String get favoritesRowSortingDescription =>
      'Ordena les files de Preferits per data afegida, data de llançament, alfabèticament i molt més.';

  @override
  String get displayCollectionsRows => 'Mostra les files de les col·leccions';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Mostra les files de les col·leccions a les seccions d\'inici.';

  @override
  String get collectionsRowSorting => 'Classificació de files de col·leccions';

  @override
  String get collectionsRowSortingDescription =>
      'Ordena les files de les col·leccions per data afegida, data de llançament, alfabèticament i molt més.';

  @override
  String get displayGenresRows => 'Mostra les files de gèneres';

  @override
  String get displayGenresRowsSubtitle =>
      'Mostra les files de gèneres a les seccions d\'inici.';

  @override
  String get genresRowSorting => 'Classificació de files de gèneres';

  @override
  String get genresRowSortingDescription =>
      'Ordena les files de gèneres per data afegida, data de llançament, alfabèticament i molt més.';

  @override
  String get genresRowItems => 'Gèneres Elements de fila';

  @override
  String get genresRowItemsDescription =>
      'Mostra pel·lícules, sèries o totes dues a les files Gèneres.';

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
  String get appearance => 'Aparença';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Theme';

  @override
  String get keyboard => 'Keyboard';

  @override
  String get navButtons => 'Buttons';

  @override
  String get rendering => 'Rendering';

  @override
  String get mpvConfiguration => 'MPV configuration';

  @override
  String get cardSize => 'Mida de la targeta';

  @override
  String get externalPlayerApp => 'Aplicació de reproductor extern';

  @override
  String get externalPlayerAppDescription => '';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Mostra el selector d\'aplicacions quan s\'iniciï la reproducció.';

  @override
  String get loadingInstalledPlayers =>
      'S\'estan carregant els reproductors instal·lats...';

  @override
  String get connection => 'Connexió';

  @override
  String get audioTranscodeTarget => 'Destí de transcodificació d\'àudio';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Compatible amb aquest dispositiu';

  @override
  String get notSupportedOnThisDevice =>
      'No és compatible amb aquest dispositiu';

  @override
  String get settingsAudioDtsXPassthrough => 'Transferència DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) a un descodificador extern.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'TrueHD amb Atmos (JOC) Passthrough';

  @override
  String get mediaPlayerBehavior => 'Comportament del reproductor multimèdia';

  @override
  String get playbackEnhancements => 'Millores de reproducció';

  @override
  String get alwaysOn => 'Sempre encès.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Substituïu Skip Outro per Next Up Display';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Mostra la superposició Next Up en lloc del botó Salta Outro.';

  @override
  String get playerRouting => 'Encaminament del reproductor';

  @override
  String get preferSoftwareDecoders =>
      'Preferiu els descodificadors de programari';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Utilitzeu FFmpeg (àudio) i libgav1 (AV1) abans dels descodificadors de maquinari. Desactiveu-lo si es trenca el pas d\'àudio HDMI.';

  @override
  String get useExternalPlayer => 'Utilitzeu un reproductor extern';

  @override
  String get useExternalPlayerSubtitle =>
      'Obriu la reproducció de vídeo a l\'aplicació externa seleccionada a Android TV.';

  @override
  String get automaticQueuing => 'Cua automàtica';

  @override
  String get preferSdhSubtitles => 'Preferiu els subtítols SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Doneu prioritat a les pistes de subtítols SDH/CC quan feu la selecció automàtica.';

  @override
  String get webDiagnostics => 'Diagnòstic web';

  @override
  String get webDiagnosticsTitle => 'Moonfin Diagnòstic web';

  @override
  String get webDiagnosticsIntro =>
      'Utilitzeu aquesta pàgina per diagnosticar problemes de connectivitat del navegador (CORS, contingut mixt i configuració de descobriment).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'S\'ha detectat un error de contingut mixt';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'S\'ha detectat una fallada CORS/preflight';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin ha detectat una pàgina HTTPS que intentava trucar a un URL de servidor HTTP. Els navegadors bloquegen aquesta sol·licitud abans que arribi al vostre servidor.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin ha detectat un error de sol·licitud a nivell de navegador que sol ser causat per la falta de capçaleres CORS o de comprovació prèvia al servidor multimèdia.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL de destinació: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detall: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Context d\'execució actual';

  @override
  String get webDiagnosticsOrigin => 'Origen';

  @override
  String get webDiagnosticsScheme => 'Esquema';

  @override
  String get webDiagnosticsPluginMode => 'Mode de connector';

  @override
  String get webDiagnosticsWebRtcScan => 'Escaneig WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL del servidor forçat';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL del servidor predeterminat';

  @override
  String get webDiagnosticsDiscoveryProxyUrl =>
      'URL del servidor intermediari de descoberta';

  @override
  String get notConfigured => 'no configurat';

  @override
  String get webDiagnosticsMixedContent => 'Contingut mixt';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Aquesta pàgina es carrega mitjançant HTTPS, però un o més URL configurats són HTTP. Els navegadors impedeixen que les pàgines HTTPS cridin a les API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Solució: doneu servei al vostre servidor multimèdia o punt final del servidor intermediari mitjançant HTTPS o carregueu Moonfin mitjançant HTTP només a xarxes locals de confiança.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'No s\'ha detectat cap configuració òbvia de contingut mixt des de la configuració actual del temps d\'execució.';

  @override
  String get webDiagnosticsCorsChecklist => 'Llista de verificació CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permet l\'origen del navegador a Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Inclou Autorització, X-Emby-Autorització i X-Emby-Token a Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Exposa Content-Range i Accept-Ranges per a la transmissió i el comportament de recerca.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Retorna el 204 a les sol·licituds de vol previ a OPCIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemple de fragment de capçalera (estil nginx)';

  @override
  String get note => 'Nota';

  @override
  String get webDiagnosticsNonWebNote =>
      'Aquesta ruta de diagnòstic està pensada per a compilacions web. Si ho veieu en una altra plataforma, és possible que aquestes comprovacions no s\'apliquin.';

  @override
  String get backToServerSelect => 'Torna a la selecció del servidor';

  @override
  String get signOutAllUsers => 'Tanqueu la sessió de tots els usuaris';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'El permís del micròfon està denegat permanentment. Activeu-lo a la configuració del sistema.';

  @override
  String get voiceSearchPermissionRequired =>
      'Es requereix permís de micròfon per a la cerca per veu.';

  @override
  String get voiceSearchNoMatch => 'No ho vaig agafar. Torna-ho a provar.';

  @override
  String get voiceSearchNoSpeechDetected => 'No s\'ha detectat cap parla.';

  @override
  String get voiceSearchMicrophoneError => 'Error del micròfon.';

  @override
  String get voiceSearchNeedsInternet => 'La cerca per veu necessita Internet.';

  @override
  String get voiceSearchServiceBusy =>
      'El servei de veu està ocupat. Torna-ho a provar.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'El permís del micròfon està denegat permanentment.';

  @override
  String get microphonePermissionDenied =>
      'S\'ha denegat el permís del micròfon.';

  @override
  String get speechRecognitionUnavailable =>
      'El reconeixement de veu no està disponible en aquest dispositiu.';

  @override
  String get openIosRoutePicker => 'Obriu el selector de rutes d\'iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'El selector de rutes AirPlay no està disponible en aquest dispositiu.';

  @override
  String get videos => 'Vídeos';

  @override
  String get programs => 'Programes';

  @override
  String get songs => 'Cançons';

  @override
  String get photoAlbums => 'Àlbums de fotos';

  @override
  String get photos => 'Fotos';

  @override
  String get people => 'Gent';

  @override
  String get recentlyReleasedEpisodes => 'Episodis publicats recentment';

  @override
  String get watchAgain => 'Mira de nou';

  @override
  String get guestAppearances => 'Aparicions de convidats';

  @override
  String get appearancesSeerr => 'Aparicions (Seerr)';

  @override
  String get crewContributionsSeerr => '';

  @override
  String get watchWithGroup => 'Veure amb grup';

  @override
  String get errors => 'Errors';

  @override
  String get warnings => 'Avisos';

  @override
  String get disk => 'Disc';

  @override
  String get openInBrowser => 'Obre al navegador';

  @override
  String get embeddedBrowserNotAvailable =>
      'El navegador incrustat no està disponible en aquesta plataforma.';

  @override
  String get adminRestartServerConfirmation =>
      'Esteu segur que voleu reiniciar el servidor?';

  @override
  String get adminShutdownServerConfirmation =>
      'Esteu segur que voleu tancar el servidor? Haureu de reiniciar-lo manualment.';

  @override
  String get internal => 'Interna';

  @override
  String get idle => 'Inactiu';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'No s\'han trobat usuaris';

  @override
  String get adminNoUsersMatchSearch =>
      'Cap usuari coincideix amb la teva cerca';

  @override
  String get adminNoDevicesFound => 'No s\'ha trobat cap dispositiu';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Cap dispositiu coincideix amb els filtres actuals';

  @override
  String get passwordSet => 'Contrasenya establerta';

  @override
  String get noPasswordConfigured => 'No s\'ha configurat cap contrasenya';

  @override
  String get remoteAccess => 'Accés remot';

  @override
  String get localOnly => 'Només local';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'No s\'han pogut carregar les analítiques multimèdia';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Analítiques combinades a totes les biblioteques multimèdia.';

  @override
  String get analyticsTopArtists => 'Els millors artistes';

  @override
  String get analyticsTopAuthors => 'Autors principals';

  @override
  String get analyticsTopContributors => 'Col·laboradors principals';

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
      'Encara no hi ha cap total de mitjans indexats disponible per a aquesta selecció.';

  @override
  String get analyticsLibraryDetails => 'Detalls de la biblioteca';

  @override
  String get analyticsLibraryBreakdown => 'Desglossament de la biblioteca';

  @override
  String get analyticsNoLibrariesAvailable =>
      'No hi ha biblioteques disponibles.';

  @override
  String get adminServerAdministrationTitle => 'Administració del servidor';

  @override
  String get adminServerPathData => 'Dades';

  @override
  String get adminServerPathImageCache => 'Memòria cau d\'imatges';

  @override
  String get adminServerPathCache => 'Memòria cau';

  @override
  String get adminServerPathLogs => 'Registres';

  @override
  String get adminServerPathMetadata => 'Metadades';

  @override
  String get adminServerPathTranscode => 'Transcodificar';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Aquest servidor no ha retornat cap camí de servidor.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% utilitzat';
  }

  @override
  String get userActivity => 'Activitat de l\'usuari';

  @override
  String get systemEvents => 'Esdeveniments del sistema';

  @override
  String get needsAttention => 'Necessita atenció';

  @override
  String get adminDrawerSectionServer => 'Servidor';

  @override
  String get adminDrawerSectionPlayback => 'Reproducció';

  @override
  String get adminDrawerSectionDevices => 'Dispositius';

  @override
  String get adminDrawerSectionAdvanced => 'Avançat';

  @override
  String get adminDrawerSectionPlugins => 'Connectors';

  @override
  String get adminDrawerSectionLiveTv => 'TV en directe';

  @override
  String get homeVideos => 'Vídeos de la llar';

  @override
  String get mixedContent => 'Contingut mixt';

  @override
  String get homeVideosAndPhotos => 'Vídeos i fotos d\'inici';

  @override
  String get mixedMoviesAndShows => 'Pel·lícules i programes mixtes';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'No s\'han trobat enregistraments';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'No s\'han trobat pàgines d\'imatge dins de l\'arxiu .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Ha fallat el renderitzador incrustat ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'El renderitzador EPUB ha fallat ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Falta el fitxer local per al lector: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status mentre obre les dades del llibre de $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'No hi ha cap punt final de llibre llegible disponible';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Format d\'arxiu de còmics no compatible: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'El connector d\'extracció CBR no està disponible en aquesta plataforma.';

  @override
  String get failedToExtractCbrArchive =>
      'No s\'ha pogut extreure l\'arxiu .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'L\'extracció CB7 no està disponible en aquesta plataforma.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'El connector d\'extracció CB7 no està disponible en aquesta plataforma.';

  @override
  String get closeGenrePanel => 'Tanca el tauler de gènere';

  @override
  String get loadingShuffle => 'S\'està carregant la reproducció aleatòria...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Canvi automàtic HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Activa automàticament HDR per a la reproducció de vídeo HDR i restaura el mode de visualització en sortir.';

  @override
  String get whenFullscreen => 'Quan a pantalla completa';

  @override
  String get changeArtwork => '';

  @override
  String get missing => '';

  @override
  String get transcodingLimits => 'Límits de transcodificació';

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
  String get audiobookChapters => 'Chapters';

  @override
  String get audiobookBookmarks => 'Bookmarks';

  @override
  String get audiobookNotes => 'Notes';

  @override
  String get audiobookQueue => 'Queue';

  @override
  String get audiobookTimeline => 'Timeline';

  @override
  String get audiobookTimelineEmpty => 'Timeline is empty';

  @override
  String get audiobookWholeBook => 'Whole Book';

  @override
  String get audiobookFocusedTimeline => 'Focused Timeline';

  @override
  String get audiobookExportBookmarks => 'Export Bookmarks';

  @override
  String get audiobookExportNotes => 'Export Notes';

  @override
  String get audiobookExportAll => 'Export All';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exported to $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get audiobookLyrics => 'Lyrics';

  @override
  String get audiobookAddBookmark => 'Add bookmark';

  @override
  String get audiobookAddNote => 'Add note';

  @override
  String get audiobookEditNote => 'Edit note';

  @override
  String get audiobookNoteHint => 'Write a note for this moment';

  @override
  String get audiobookSleepTimer => 'Sleep timer';

  @override
  String get audiobookSleepOff => 'Off';

  @override
  String get audiobookSleepEndOfChapter => 'End of chapter';

  @override
  String get audiobookSleepCustom => 'Custom';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining left';
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
  String get audiobookPlaybackSpeed => 'Playback speed';

  @override
  String get audiobookRemainingTime => 'Remaining';

  @override
  String get audiobookElapsedTime => 'Elapsed';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Back ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Forward ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Previous chapter';

  @override
  String get audiobookNextChapter => 'Next chapter';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Chapter $current of $total';
  }

  @override
  String get audiobookNoChapters => 'No chapters';

  @override
  String get audiobookNoBookmarks => 'No bookmarks yet';

  @override
  String get audiobookNoNotes => 'No notes yet';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Bookmark added at $position';
  }

  @override
  String get audiobookSpeedReset => 'Reset to 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Save';

  @override
  String get audiobookCancel => 'Cancel';

  @override
  String get audiobookDelete => 'Delete';

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
  String get externalLists => 'External Lists';

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

  @override
  String get impellerRendering => 'Rendering engine (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller is Flutter\'s modern GPU renderer for smoother animations and less stutter. On some TV boxes and older GPUs it can cause glitches or black video; switch it Off if you see those. Automatic picks the best default for your device. Restart Moonfin to apply.';

  @override
  String get impellerAuto => 'Automatic';

  @override
  String get impellerOn => 'On';

  @override
  String get impellerOff => 'Off';

  @override
  String get impellerRestartTitle => 'Restart required';

  @override
  String get impellerRestartMessage =>
      'Moonfin needs to restart to change the rendering engine. Close the app now, then reopen it to apply.';

  @override
  String get impellerCloseNow => 'Close app now';

  @override
  String get adminRefreshLibrary => 'Refresh Library';

  @override
  String get adminRefreshAllLibraries => 'Refresh All Libraries';

  @override
  String get adminRepoSortDateOldest => 'Date Added (Oldest First)';

  @override
  String get adminRepoSortDateNewest => 'Date Added (Newest First)';

  @override
  String get adminRepoSortNameAsc => 'Alphabetical (A to Z)';

  @override
  String get adminRepoSortNameDesc => 'Alphabetical (Z to A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Loading Server Analytics... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Match source';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Movies';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 TV Shows';

  @override
  String get imdbMostPopularMovies => 'IMDb Most Popular Movies';

  @override
  String get imdbMostPopularTvShows => 'IMDb Most Popular TV Shows';

  @override
  String get imdbLowestRatedMovies => 'IMDb Lowest Rated Movies';

  @override
  String get imdbTopEnglishMovies => 'IMDb Top Rated English Movies';
}
