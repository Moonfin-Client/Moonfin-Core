// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => 'Entrar';

  @override
  String connectingToServer(String serverName) {
    return 'Conectando-se a $serverName';
  }

  @override
  String get quickConnect => 'Conexão Rápida';

  @override
  String get password => 'Senha';

  @override
  String get username => 'Usuário';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Insira este código no painel web do seu servidor:';

  @override
  String get waitingForAuthorization => 'Aguardando autorização...';

  @override
  String get back => 'Voltar';

  @override
  String get serverUnavailable => 'Servidor indisponível';

  @override
  String get loginFailed => 'Falha no login';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect indisponível: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect indisponível ($status): $detail';
  }

  @override
  String get whosWatching => 'Quem está assistindo?';

  @override
  String get addUser => 'Adicionar Usuário';

  @override
  String get selectServer => 'Selecionar Servidor';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versão $version';
  }

  @override
  String get savedServers => 'Servidores Salvos';

  @override
  String get discoveredServers => 'Servidores Descobertos';

  @override
  String get noneFound => 'Nenhum encontrado';

  @override
  String get unableToConnectToServer => 'Não foi possível conectar ao servidor';

  @override
  String get addServer => 'Adicionar Servidor';

  @override
  String get embyConnect => 'Emby Conectar';

  @override
  String get removeServer => 'Remover Servidor';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remover \"$serverName\" dos seus servidores?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Remover';

  @override
  String get connectToServer => 'Conectar ao Servidor';

  @override
  String get serverAddress => 'Endereço do Servidor';

  @override
  String get serverAddressHint => 'https://seu-servidor.exemplo.com';

  @override
  String get connect => 'Conectar';

  @override
  String get secureStorageUnavailable => 'Armazenamento Seguro Indisponível';

  @override
  String get secureStorageUnavailableMessage =>
      'O Moonfin não conseguiu acessar o chaveiro do sistema. O login pode continuar, mas o armazenamento seguro de tokens pode ficar indisponível até que o chaveiro seja desbloqueado.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema do aplicativo';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alternar entre Moonfin e Neon Pulse sem reiniciar o aplicativo';

  @override
  String get keyboardPreferSystemIme => 'Prefira o teclado do sistema';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use o método de entrada do seu dispositivo por padrão para entrada de texto';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Visual Moonfin atual que todos vocês adoraram';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Estilo Synthwave com brilho magenta, texto ciano e contraste cromado mais forte';

  @override
  String get embyConnectSignInSubtitle => 'Entre com sua conta Emby Connect';

  @override
  String get emailOrUsername => 'E-mail ou Usuário';

  @override
  String get selectAServer => 'Selecione um Servidor';

  @override
  String get tryAgain => 'Tentar Novamente';

  @override
  String get noLinkedServers =>
      'Nenhum servidor vinculado a esta conta Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Credenciais do Emby Connect inválidas';

  @override
  String get invalidEmbyConnectLogin =>
      'Usuário ou senha do Emby Connect inválidos';

  @override
  String get embyConnectExchangeNotSupported =>
      'O servidor não suporta troca via Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Erro de rede ao contatar o Emby Connect ou o servidor selecionado';

  @override
  String get loadingLinkedServers => 'Carregando servidores vinculados...';

  @override
  String get connectingToServerEllipsis => 'Conectando ao servidor...';

  @override
  String get noReachableAddress => 'Nenhum endereço acessível fornecido';

  @override
  String get invalidServerExchangeResponse =>
      'Resposta inválida do endpoint de troca do servidor';

  @override
  String unableToConnectTo(String target) {
    return 'Não foi possível conectar-se a $target';
  }

  @override
  String get exitApp => 'Sair do Moonfin?';

  @override
  String get exitAppConfirmation => 'Tem certeza que deseja sair?';

  @override
  String get exit => 'Sair';

  @override
  String get noHomeRowsLoaded =>
      'Nenhuma seção da tela inicial pôde ser carregada';

  @override
  String get noHomeRowsHint =>
      'Tente atualizar ou reduzir as seções ativas da tela inicial.';

  @override
  String get retryHomeRows => 'Tentar Novamente';

  @override
  String get guide => 'Guia';

  @override
  String get recordings => 'Gravações';

  @override
  String get schedule => 'Agenda';

  @override
  String get series => 'Séries';

  @override
  String get noItemsFound => 'Nenhum item encontrado';

  @override
  String get home => 'Início';

  @override
  String get browseAll => 'Ver Tudo';

  @override
  String get genres => 'Gêneros';

  @override
  String get collectionPlaceholder => 'Os itens da coleção aparecerão aqui';

  @override
  String get browseByLetter => 'Navegar por Letra';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'A navegação alfabética aparecerá aqui';

  @override
  String get suggestions => 'Sugestões';

  @override
  String get suggestionsPlaceholder => 'Os itens sugeridos aparecerão aqui';

  @override
  String get failedToLoadLibraries => 'Falha ao carregar bibliotecas';

  @override
  String get noLibrariesFound => 'Nenhuma biblioteca encontrada';

  @override
  String get library => 'Biblioteca';

  @override
  String get displaySettings => 'Configurações de Exibição';

  @override
  String get allGenres => 'Todos os Gêneros';

  @override
  String get noGenresFound => 'Nenhum gênero encontrado';

  @override
  String failedToLoadFolderError(String error) {
    return 'Falha ao carregar pasta: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Esta pasta está vazia';

  @override
  String itemCountLabel(int count) {
    return '$count itens';
  }

  @override
  String get failedToLoadFavorites => 'Falha ao carregar favoritos';

  @override
  String get retry => 'Tentar Novamente';

  @override
  String get noFavoritesYet => 'Nenhum favorito ainda';

  @override
  String get favorites => 'Favoritos';

  @override
  String totalCountItems(int count) {
    return '$count Itens';
  }

  @override
  String get continuing => 'Em andamento';

  @override
  String get ended => 'Encerrada';

  @override
  String get sortAndFilter => 'Ordenar e Filtrar';

  @override
  String get type => 'Tipo';

  @override
  String get sortBy => 'Ordenar Por';

  @override
  String get display => 'Exibição';

  @override
  String get imageType => 'Tipo de Imagem';

  @override
  String get posterSize => 'Tamanho do Pôster';

  @override
  String get small => 'Pequeno';

  @override
  String get medium => 'Médio';

  @override
  String get large => 'Grande';

  @override
  String get extraLarge => 'Extra Grande';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Gêneros';
  }

  @override
  String get views => 'Visualizações';

  @override
  String get albums => 'Álbuns';

  @override
  String get albumArtists => 'Artistas de Álbum';

  @override
  String get artists => 'Artistas';

  @override
  String get bookmarks => 'Marcadores';

  @override
  String get noSavedBookmarks =>
      'Nenhum marcador salvo para este título ainda.';

  @override
  String get openBook => 'Abrir Livro';

  @override
  String get chapter => 'Capítulo';

  @override
  String get page => 'Página';

  @override
  String get bookmark => 'Marcador';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String minutesAgo(int count) {
    return '${count}m atrás';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h atrás';
  }

  @override
  String daysAgo(int count) {
    return '${count}d atrás';
  }

  @override
  String get discoverySubjects => 'Assuntos para Descobrir';

  @override
  String get pickDiscoverySubjects =>
      'Escolha quais feeds de assunto exibir em Descobrir.';

  @override
  String get apply => 'Aplicar';

  @override
  String get openLink => 'Abrir link';

  @override
  String get scanWithYourPhone => 'Digitalize com seu telefone';

  @override
  String get audiobookGenres => 'Gêneros de Audiolivros';

  @override
  String get pickAudiobookGenres =>
      'Escolha quais gêneros exibir em Descobrir Audiolivros.';

  @override
  String get discoverAudiobooks => 'Descobrir Audiolivros';

  @override
  String get librivoxDescription =>
      'Títulos populares de domínio público do LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count títulos';
  }

  @override
  String get scrollLeft => 'Rolar para a esquerda';

  @override
  String get scrollRight => 'Rolar para a direita';

  @override
  String get couldNotLoadGenre =>
      'Não foi possível carregar este gênero agora.';

  @override
  String get continueReading => 'Continuar Lendo';

  @override
  String get savedHighlights => 'Destaques Salvos';

  @override
  String get continueListening => 'Continuar Ouvindo';

  @override
  String get listen => 'Ouvir';

  @override
  String get resume => 'Continuar';

  @override
  String get failedToLoadLibrary => 'Falha ao carregar biblioteca';

  @override
  String get popularNow => 'Popular Agora';

  @override
  String get savedForLater => 'Salvos Para Depois';

  @override
  String get topListens => 'Mais Ouvidos';

  @override
  String get unreadDiscoveries => 'Descobertas Não Lidas';

  @override
  String get pickUpAgain => 'Retomar';

  @override
  String get bookHighlightsDescription =>
      'Seus livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get handPickedFromLibrary => 'Selecionados da sua biblioteca.';

  @override
  String get handPickedFromListeningQueue =>
      'Selecionados da sua fila de audição.';

  @override
  String get booksWithHighlights =>
      'Livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get jumpBackNarration =>
      'Retome a narração sem precisar procurar onde parou.';

  @override
  String get unreadBooksReady =>
      'Livros não lidos prontos para a próxima hora tranquila.';

  @override
  String get quickAccessFavorites =>
      'Acesso rápido aos livros que você sempre revisita.';

  @override
  String get searchAudiobooks => 'Pesquisar audiolivros';

  @override
  String get searchYourLibrary => 'Pesquisar sua biblioteca';

  @override
  String get pickUpStory => 'Continue a história de onde parou';

  @override
  String get savedPlacesChapters => 'Seus marcadores e capítulos inacabados';

  @override
  String authorsCount(int count) {
    return '$count autores';
  }

  @override
  String genresCount(int count) {
    return '$count gêneros';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% concluído';
  }

  @override
  String get readyWhenYouAre => 'Pronto quando você estiver';

  @override
  String get details => 'Detalhes';

  @override
  String get listeningRoom => 'Sala de Audição';

  @override
  String get bookmarksAndProgress => 'Marcadores e Progresso';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count títulos organizados para navegação com leitura inicial.';
  }

  @override
  String get titles => 'Títulos';

  @override
  String get allTitles => 'Todos os Títulos';

  @override
  String get authors => 'Autores';

  @override
  String get browseByAuthor => 'Navegar por Autor';

  @override
  String get browseByGenre => 'Navegar por Gênero';

  @override
  String get discover => 'Descobrir';

  @override
  String get trendingTitlesOpenLibrary =>
      'Títulos em alta por assunto do Open Library.';

  @override
  String get noBookmarkedItems => 'Nenhum item marcado ainda';

  @override
  String get nothingMatchesSection =>
      'Nada corresponde a esta seção ainda. Tente outra aba ou volte após a sincronização da biblioteca.';

  @override
  String get audiobooks => 'Audiolivros';

  @override
  String noLabelFound(String label) {
    return 'Nenhum $label encontrado';
  }

  @override
  String get folder => 'Pasta';

  @override
  String get filters => 'Filtros';

  @override
  String get readingStatus => 'Status de Leitura';

  @override
  String get playedStatus => 'Status de Reprodução';

  @override
  String get readStatus => 'Lido';

  @override
  String get watched => 'Assistido';

  @override
  String get unread => 'Não lido';

  @override
  String get unwatched => 'Não assistido';

  @override
  String get seriesStatus => 'Status da Série';

  @override
  String get allLibraries => 'Todas as Bibliotecas';

  @override
  String get books => 'Livros';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Autor Desconhecido';

  @override
  String get uncategorized => 'Sem Categoria';

  @override
  String get overview => 'Sinopse';

  @override
  String get noLibrivoxDescription =>
      'Nenhuma descrição fornecida pelo LibriVox para este título ainda.';

  @override
  String get readers => 'Leitores';

  @override
  String get openLinks => 'Abrir Links';

  @override
  String get librivoxPage => 'Página do LibriVox';

  @override
  String get internetArchive => 'Arquivo da Internet';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Baixar Zip';

  @override
  String sectionCountLabel(int count) {
    return 'Seções $count';
  }

  @override
  String firstPublished(int year) {
    return 'Publicado pela primeira vez $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Nenhuma sinopse disponível do Open Library para este título ainda.';

  @override
  String get subjects => 'Assuntos';

  @override
  String get all => 'Todos';

  @override
  String booksCount(int count) {
    return '$count livros';
  }

  @override
  String get couldNotLoadSubject =>
      'Não foi possível carregar este assunto agora.';

  @override
  String get audiobookDetails => 'Detalhes do Audiolivro';

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
  String get trackList => 'Lista de Faixas';

  @override
  String get itemListPlaceholder => 'A lista de itens aparecerá aqui';

  @override
  String get favoriteTracksPlaceholder => 'As faixas favoritas aparecerão aqui';

  @override
  String get failedToLoad => 'Falha ao carregar';

  @override
  String get delete => 'Excluir';

  @override
  String get save => 'Salvar';

  @override
  String get moreLikeThis => 'Mais Como Este';

  @override
  String get castAndCrew => 'Elenco e Equipe';

  @override
  String get collection => 'Coleção';

  @override
  String get episodes => 'Episódios';

  @override
  String get nextUp => 'A Seguir';

  @override
  String get seasons => 'Temporadas';

  @override
  String get chapters => 'Capítulos';

  @override
  String get features => 'Extras';

  @override
  String get movies => 'Filmes';

  @override
  String get musicVideos => 'Vídeos musicais';

  @override
  String get other => 'Outros';

  @override
  String get discography => 'Discografia';

  @override
  String get similarArtists => 'Artistas Semelhantes';

  @override
  String get tableOfContents => 'Índice';

  @override
  String get tracklist => 'Lista de Faixas';

  @override
  String discNumber(int number) {
    return 'Disco $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'Detalhes do Autor';

  @override
  String get noOverviewAvailable =>
      'Nenhuma sinopse disponível para este título ainda.';

  @override
  String get noBiographyAvailable =>
      'Nenhuma biografia disponível para este autor.';

  @override
  String get noBooksFound => 'Nenhum livro encontrado para este autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'Não foi possível carregar os detalhes do autor agora.';

  @override
  String published(int year) {
    return 'Publicado $year';
  }

  @override
  String get publicationDateUnknown => 'Data de publicação desconhecida';

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
    return 'Termina em $time';
  }

  @override
  String get view => 'Visualizar';

  @override
  String get resumeReading => 'Continuar Lendo';

  @override
  String get read => 'Ler';

  @override
  String resumeFrom(String position) {
    return 'Currículo de $position';
  }

  @override
  String get play => 'Reproduzir';

  @override
  String get startOver => 'Recomeçar';

  @override
  String get restart => 'Reiniciar';

  @override
  String get readOffline => 'Ler Offline';

  @override
  String get playOffline => 'Reproduzir Offline';

  @override
  String get audio => 'Áudio';

  @override
  String get subtitles => 'Legendas';

  @override
  String get version => 'Versão';

  @override
  String get cast => 'Transmitir';

  @override
  String get trailer => 'Reboque';

  @override
  String get finished => 'Concluído';

  @override
  String get favorited => 'Favoritado';

  @override
  String get favorite => 'Favorito';

  @override
  String get playlist => 'Lista de reprodução';

  @override
  String get downloaded => 'Baixado';

  @override
  String get downloadAll => 'Baixar Tudo';

  @override
  String get download => 'Baixar';

  @override
  String get deleteDownloaded => 'Excluir Baixados';

  @override
  String get goToSeries => 'Ir para a Série';

  @override
  String get editMetadata => 'Editar Metadados';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Mais';

  @override
  String get deleteItem => 'Excluir Item';

  @override
  String get deletePlaylist => 'Excluir Playlist';

  @override
  String get deletePlaylistMessage => 'Excluir esta playlist do servidor?';

  @override
  String get deleteItemMessage => 'Excluir este item do servidor?';

  @override
  String get failedToDeletePlaylist => 'Falha ao excluir playlist';

  @override
  String get failedToDeleteItem => 'Falha ao excluir item';

  @override
  String get renamePlaylist => 'Renomear Playlist';

  @override
  String get playlistName => 'Nome da playlist';

  @override
  String get deleteDownloadedAlbum => 'Excluir Álbum Baixado';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Excluir faixas baixadas de \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Faixas baixadas excluídas';

  @override
  String get downloadedTracksDeleteFailed =>
      'Algumas faixas baixadas não puderam ser excluídas';

  @override
  String get noTracksLoaded => 'Nenhuma faixa carregada';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Nenhum $itemLabel carregado';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Baixando $title ($count itens)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Tem certeza de que deseja excluir \"$name\" do servidor? Esta ação não pode ser desfeita.';
  }

  @override
  String get itemDeleted => 'Item excluído';

  @override
  String get noPlayableTrailerFound =>
      'Nenhum trailer reproduzível encontrado.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Formato de livro não suportado: .$extension';
  }

  @override
  String get audioTrack => 'Faixa de Áudio';

  @override
  String get subtitleTrack => 'Faixa de Legenda';

  @override
  String get none => 'Nenhum';

  @override
  String get downloadSubtitlesLabel => 'Baixar legendas...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Pesquisar usando o plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Baixar Legendas';

  @override
  String get selectedSubtitleInvalid => 'A legenda selecionada é inválida.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Legenda baixada e selecionada: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Legenda baixada. Pode levar um momento para aparecer enquanto o Jellyfin atualiza o item.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nenhuma legenda remota encontrada para $language.';
  }

  @override
  String get selectVersion => 'Selecionar Versão';

  @override
  String versionNumber(int number) {
    return 'Versão $number';
  }

  @override
  String get downloadAllQuality => 'Baixar Tudo - Qualidade';

  @override
  String get downloadQuality => 'Qualidade do Download';

  @override
  String get originalFileNoReencoding => 'Arquivo original, sem recodificação';

  @override
  String get originalFilesNoReencoding =>
      'Arquivos originais, sem recodificação';

  @override
  String get noEpisodesLoaded => 'Nenhum episódio carregado';

  @override
  String downloadingItem(String name, String quality) {
    return 'Baixando $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Excluir Arquivos Baixados';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Excluir arquivos locais para $typeLabel?\n\nIsso irá liberar espaço de armazenamento. Você pode baixar novamente mais tarde.';
  }

  @override
  String get downloadedFilesDeleted => 'Arquivos baixados excluídos';

  @override
  String get failedToDeleteFiles => 'Falha ao excluir arquivos';

  @override
  String get deleteFiles => 'Excluir Arquivos';

  @override
  String get director => 'DIRETOR';

  @override
  String get writers => 'ROTEIRISTAS';

  @override
  String get studio => 'ESTÚDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count mais';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episódios';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episódio $number';
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
    return 'Nasceu $date';
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
  String get showLess => 'Mostrar Menos';

  @override
  String get readMore => 'Ler Mais';

  @override
  String get shuffle => 'Aleatório';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Correspondência perfeita';

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
    return 'A legenda remota $action requer a permissão de gerenciamento de legendas Jellyfin para este usuário.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Este item não foi encontrado no servidor para legenda remota $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Legenda remota $action falhou: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'A legenda remota $action falhou (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Falha ao $action legendas remotas.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'todos os episódios baixados de \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'todos os episódios baixados desta temporada';

  @override
  String get stillWatching => 'Ainda Assistindo?';

  @override
  String get unableToLoadTrailerStream =>
      'Não foi possível carregar o stream do trailer.';

  @override
  String get trailerTimedOut => 'O trailer expirou durante o carregamento.';

  @override
  String get playbackFailedForTrailer =>
      'A reprodução falhou para este trailer.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'A transmissão não está disponível durante a reprodução offline.';

  @override
  String castActionFailed(String label, String error) {
    return '$label ação falhou: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Falha ao definir o volume de transmissão: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controles';
  }

  @override
  String get deviceVolume => 'Volume do Dispositivo';

  @override
  String get unavailable => 'Indisponível';

  @override
  String get pause => 'Pausar';

  @override
  String get syncPosition => 'Sincronizar Posição';

  @override
  String stopCast(String label) {
    return 'Pare $label';
  }

  @override
  String get queueIsEmpty => 'A fila está vazia';

  @override
  String trackNumber(int number) {
    return 'Rastrear $number';
  }

  @override
  String get remotePlayback => 'Reprodução Remota';

  @override
  String get castingToGoogleCast => 'Transmitindo via Google Cast';

  @override
  String get castingViaAirPlay => 'Transmitindo via AirPlay';

  @override
  String get castingViaDlna => 'Transmitindo via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds segundos';
  }

  @override
  String get longPressToUnlock => 'Pressione e segure para desbloquear';

  @override
  String get off => 'Desligado';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Automático';

  @override
  String bitrateValueMbps(int mbps) {
    return '${mbps}Mbps';
  }

  @override
  String get bitrateOverride => 'Override de taxa de bits';

  @override
  String get audioDelay => 'Atraso de Áudio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Atraso de Legenda';

  @override
  String get reset => 'Redefinir';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get playbackInformation => 'Informações de Reprodução';

  @override
  String get playback => 'Reprodução';

  @override
  String get playMethod => 'Método de Reprodução';

  @override
  String get directPlay => 'Reprodução Direta';

  @override
  String get directStream => 'Stream Direto';

  @override
  String get transcoding => 'Transcodificação';

  @override
  String get transcodeReasons => 'Motivos da Transcodificação';

  @override
  String get player => 'Reprodutor';

  @override
  String get container => 'Recipiente';

  @override
  String get bitrate => 'Taxa de Bits';

  @override
  String get video => 'Vídeo';

  @override
  String get resolution => 'Resolução';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Taxa de Bits do Vídeo';

  @override
  String get track => 'Faixa';

  @override
  String get channels => 'Canais';

  @override
  String get audioBitrate => 'Taxa de Bits do Áudio';

  @override
  String get sampleRate => 'Taxa de Amostragem';

  @override
  String get format => 'Formato';

  @override
  String get external => 'Externo';

  @override
  String get embedded => 'Embutido';

  @override
  String castSessionError(String protocol) {
    return '$protocol erro de sessão';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Falha ao carregar detalhes do livro: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'A renderização de EPUB no app ainda não está disponível nesta plataforma.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Este formato (.$extension) ainda não pode ser renderizado no aplicativo.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A renderização de documentos embutidos não está disponível nesta plataforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'Não foi possível abrir o visualizador externo.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Falha ao abrir o leitor no aplicativo: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Marcador já salvo em $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Marcador adicionado: $label';
  }

  @override
  String get noBookmarksYet =>
      'Nenhum marcador ainda.\nToque no ícone de marcador enquanto lê para salvar sua posição.';

  @override
  String get noTableOfContentsAvailable => 'Índice não disponível';

  @override
  String pageLabel(int number) {
    return 'Página $number';
  }

  @override
  String get position => 'Posição';

  @override
  String get bookReader => 'Leitor de Livros';

  @override
  String formatExtension(String extension) {
    return 'Formato: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% lido';
  }

  @override
  String get updating => 'Atualizando...';

  @override
  String get markUnread => 'Marcar como Não Lido';

  @override
  String get markAsRead => 'Marcar como Lido';

  @override
  String get reloadReader => 'Recarregar Leitor';

  @override
  String get noPagesFound => 'Nenhuma página encontrada.';

  @override
  String get failedToDecodePageImage =>
      'Falha ao decodificar a imagem da página.';

  @override
  String resetZoom(String zoom) {
    return 'Redefinir zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Página Única';

  @override
  String get twoPageSpread => 'Páginas Duplas';

  @override
  String get addBookmark => 'Adicionar Marcador';

  @override
  String get bookmarksEllipsis => 'Marcadores...';

  @override
  String get markedAsRead => 'Marcado como lido';

  @override
  String get markedAsUnread => 'Marcado como não lido';

  @override
  String failedToUpdateReadState(String error) {
    return 'Falha ao atualizar o estado de leitura: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Claro';

  @override
  String get themeDark => 'Tema: Escuro';

  @override
  String get themeSepia => 'Tema: Sépia';

  @override
  String get invertColorsFixedLayout => 'Inverter Cores (layout fixo)';

  @override
  String get invertColorsPdf => 'Inverter Cores (PDF)';

  @override
  String get preparingInAppReader => 'Preparando leitor integrado...';

  @override
  String get pdfDataNotAvailable => 'Dados do PDF não disponíveis.';

  @override
  String get readerFallbackModeActive => 'Modo alternativo do leitor ativo';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Esta plataforma não pode hospedar o mecanismo de documento incorporado para arquivos $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Use Recarregar Leitor após mudar para uma plataforma suportada (Android, iOS, macOS).';

  @override
  String get openExternally => 'Abrir Externamente';

  @override
  String get noEpubChaptersFound => 'Nenhum capítulo EPUB encontrado.';

  @override
  String get readerNotReady => 'Leitor não está pronto.';

  @override
  String get seriesRecordings => 'Gravações de Séries';

  @override
  String get now => 'Agora';

  @override
  String get sports => 'Esportes';

  @override
  String get news => 'Notícias';

  @override
  String get kids => 'Infantil';

  @override
  String get premiere => 'Estreia';

  @override
  String get guideTimeline => 'Linha do Tempo do Guia';

  @override
  String failedToLoadGuide(String error) {
    return 'Falha ao carregar o guia: $error';
  }

  @override
  String get noChannelsFound => 'Nenhum canal encontrado';

  @override
  String get liveBadge => 'AO VIVO';

  @override
  String get movie => 'Filme';

  @override
  String get removedFromFavoriteChannels => 'Removido dos canais favoritos';

  @override
  String get addedToFavoriteChannels => 'Adicionado aos canais favoritos';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Falha ao atualizar canal favorito';

  @override
  String get unfavoriteChannel => 'Desfavoritar Canal';

  @override
  String get favoriteChannel => 'Favoritar Canal';

  @override
  String get record => 'Registro';

  @override
  String get cancelRecordingAction => 'Cancelar gravação';

  @override
  String get programSetToRecord => 'Programa pronto para gravar';

  @override
  String get recordingCancelled => 'Gravação cancelada';

  @override
  String get unableToCreateRecording => 'Não foi possível criar a gravação';

  @override
  String get watch => 'Assistir';

  @override
  String get close => 'Fechar';

  @override
  String failedToPlayChannel(String name) {
    return 'Falha ao reproduzir $name';
  }

  @override
  String get failedToLoadRecordings => 'Falha ao carregar gravações';

  @override
  String get scheduledInNext24Hours => 'Agendados nas Próximas 24 Horas';

  @override
  String get recentRecordings => 'Gravações Recentes';

  @override
  String get tvSeries => 'Séries de TV';

  @override
  String get failedToLoadSchedule => 'Falha ao carregar agenda';

  @override
  String get noScheduledRecordings => 'Nenhuma gravação agendada';

  @override
  String get cancelRecording => 'Cancelar Gravação?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancelar a gravação agendada de \"$name\"?';
  }

  @override
  String get no => 'Não';

  @override
  String get yesCancel => 'Sim, Cancelar';

  @override
  String get failedToCancelRecording => 'Falha ao cancelar gravação';

  @override
  String get failedToLoadSeriesRecordings =>
      'Falha ao carregar gravações de séries';

  @override
  String get noSeriesRecordings => 'Nenhuma gravação de série';

  @override
  String get cancelSeriesRecording => 'Cancelar Gravação de Série';

  @override
  String get cancelSeriesRecordingQuestion => 'Cancelar Gravação de Série?';

  @override
  String stopRecordingName(String name) {
    return 'Parar de gravar \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Falha ao cancelar gravação de série';

  @override
  String get searchThisLibrary => 'Pesquisar nesta biblioteca...';

  @override
  String get searchEllipsis => 'Pesquisar...';

  @override
  String noResultsForQuery(String query) {
    return 'Nenhum resultado para \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Falha na pesquisa: $error';
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
  String get savedMedia => 'Mídia Salva';

  @override
  String get tvShows => 'Séries de TV';

  @override
  String get music => 'Música';

  @override
  String get musicAlbums => 'Álbuns de Música';

  @override
  String get noMediaInFilter => 'Nenhuma mídia neste filtro';

  @override
  String get noDownloadedMediaYet => 'Nenhuma mídia baixada ainda';

  @override
  String get browseLibrary => 'Navegar na Biblioteca';

  @override
  String get deleteDownload => 'Excluir Download';

  @override
  String removeItemAndFiles(String name) {
    return 'Remover \"$name\" e seus arquivos?';
  }

  @override
  String tracksCount(int count) {
    return '$count faixas';
  }

  @override
  String get album => 'Álbum';

  @override
  String get playAlbum => 'Reproduzir Álbum';

  @override
  String failedToLoadAlbum(String error) {
    return 'Falha ao carregar o álbum: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nenhuma faixa baixada encontrada para $name.';
  }

  @override
  String get season => 'Temporada';

  @override
  String get errorLoadingEpisodes => 'Erro ao carregar episódios';

  @override
  String get noDownloadedEpisodes => 'Nenhum episódio baixado';

  @override
  String get deleteEpisode => 'Excluir Episódio';

  @override
  String removeName(String name) {
    return 'Remover \"$name\"?';
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
    return 'Episódio $number';
  }

  @override
  String get seriesNotFound => 'Série não encontrada';

  @override
  String get errorLoadingSeries => 'Erro ao carregar série';

  @override
  String get downloadedEpisodes => 'Episódios Baixados';

  @override
  String seasonNumber(int number) {
    return 'Temporada $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Especiais';

  @override
  String get deleteSeason => 'Excluir Temporada';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Excluir todos os episódios baixados em $season?';
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
  String get storageManagement => 'Gerenciamento de Armazenamento';

  @override
  String get storageBreakdown => 'Detalhamento do Armazenamento';

  @override
  String get downloadedItems => 'Itens Baixados';

  @override
  String get storageLimit => 'Limite de Armazenamento';

  @override
  String get noLimit => 'Sem limite';

  @override
  String get deleteAllDownloads => 'Excluir Todos os Downloads';

  @override
  String get deleteAllDownloadsWarning =>
      'Isso removerá todos os arquivos de mídia baixados e não pode ser desfeito.';

  @override
  String get deleteAll => 'Excluir Tudo';

  @override
  String get deleteSelected => 'Excluir Selecionados';

  @override
  String deleteSelectedCount(int count) {
    return 'Excluir $count itens baixados?';
  }

  @override
  String get musicAndAudiobooks => 'Música e Audiolivros';

  @override
  String get images => 'Imagens';

  @override
  String get database => 'Banco de Dados';

  @override
  String ofStorageLimit(String limit) {
    return 'do limite $limit';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get authentication => 'Autenticação';

  @override
  String get autoLoginServerManagement =>
      'Login automático, gerenciamento de servidores';

  @override
  String get pinCode => 'Código PIN';

  @override
  String get setUpPinCodeProtection => 'Configurar proteção por código PIN';

  @override
  String get parentalControls => 'Controles Parentais';

  @override
  String get contentRatingRestrictions =>
      'Restrições de classificação de conteúdo';

  @override
  String get bitRateResolutionBehavior =>
      'Taxa de bits, resolução, comportamento';

  @override
  String get languageSizeAppearance => 'Idioma, tamanho, aparência';

  @override
  String get qualityStorage => 'Qualidade, armazenamento';

  @override
  String get serverSyncAndPluginStatus =>
      'Sincronização do servidor e status do plugin';

  @override
  String get mediaRequestIntegration => 'Integração de solicitações de mídia';

  @override
  String get switchServer => 'Trocar Servidor';

  @override
  String get signOut => 'Sair';

  @override
  String get versionLicenses => 'Versão, licenças';

  @override
  String get account => 'Conta';

  @override
  String get signInAndSecurity => 'Login e segurança';

  @override
  String get administration => 'Administração';

  @override
  String get serverSettingsUsersLibraries =>
      'Configurações do servidor, usuários, bibliotecas';

  @override
  String get customization => 'Personalização';

  @override
  String get themeAndLayout => 'Tema e layout';

  @override
  String get videoAndSubtitles => 'Vídeo e legendas';

  @override
  String get integrations => 'Integrações';

  @override
  String get pluginAndRequests => 'Plugin e solicitações';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalize conta, reprodução e comportamento da interface';

  @override
  String optionsCount(int count) {
    return '$count opções';
  }

  @override
  String get themeAndAppearance => 'Tema e Aparência';

  @override
  String get focusBorderColor => 'Cor da Borda de Foco';

  @override
  String get watchedIndicators => 'Indicadores de Assistido';

  @override
  String get always => 'Sempre';

  @override
  String get hideUnwatched => 'Ocultar Não Assistidos';

  @override
  String get episodesOnly => 'Apenas Episódios';

  @override
  String get never => 'Nunca';

  @override
  String get focusExpansionAnimation => 'Animação de Expansão do Foco';

  @override
  String get desktopUiScale => 'Escala de UI de desktop';

  @override
  String get scaleFocusedCards =>
      'Redimensionar cards focados ou com cursor sobre eles';

  @override
  String get backgroundBackdrops => 'Imagens de Fundo';

  @override
  String get showBackdropImages => 'Mostrar imagens de fundo atrás do conteúdo';

  @override
  String get seriesThumbnails => 'Miniaturas de Séries';

  @override
  String get seriesThumbnailsDescription =>
      'Apenas episódios: usar arte da série que corresponda ao tipo de imagem de cada linha';

  @override
  String get homeRowInfoOverlay => 'Sobreposição de Info na Tela Inicial';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Mostrar título e metadados ao navegar as linhas da tela inicial';

  @override
  String get clockDisplay => 'Exibição do Relógio';

  @override
  String get inMenus => 'Nos Menus';

  @override
  String get inVideo => 'No Vídeo';

  @override
  String get seasonalEffects => 'Efeitos Sazonais';

  @override
  String get seasonalEffectsDescription =>
      'Efeitos visuais e decorações sazonais';

  @override
  String get snow => 'Neve';

  @override
  String get fireworks => 'Fogos de Artifício';

  @override
  String get confetti => 'Confete';

  @override
  String get fallingLeaves => 'Folhas Caindo';

  @override
  String get themeMusic => 'Música Tema';

  @override
  String get playThemeMusicOnDetailPages =>
      'Reproduzir música tema nas páginas de detalhes';

  @override
  String get themeMusicVolume => 'Volume da Música Tema';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Música Tema nas Linhas Iniciais';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Reproduzir ao navegar na tela inicial';

  @override
  String get detailsBackgroundBlur => 'Desfoque do Fundo de Detalhes';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Desfoque do Fundo de Navegação';

  @override
  String get maxStreamingBitrate => 'Taxa de Bits Máxima de Streaming';

  @override
  String get maxResolution => 'Resolução Máxima';

  @override
  String get playerZoomMode => 'Modo de Zoom do Reprodutor';

  @override
  String get fit => 'Ajustar';

  @override
  String get autoCrop => 'Corte Automático';

  @override
  String get stretch => 'Esticar';

  @override
  String get refreshRateSwitching => 'Troca de Taxa de Atualização';

  @override
  String get disabled => 'Desabilitado';

  @override
  String get scaleOnTv => 'Ajustar na TV';

  @override
  String get scaleOnDevice => 'Ajustar no Dispositivo';

  @override
  String get trickPlay => 'Truque';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Mostrar miniaturas de pré-visualização ao avançar';

  @override
  String get showDescriptionOnPause => 'Mostrar Descrição ao Pausar';

  @override
  String get dimVideoShowOverview =>
      'Escurecer vídeo e mostrar descrição enquanto pausado';

  @override
  String get osdLockButton => 'Botão de Bloqueio do OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostrar um botão de bloqueio que bloqueia a entrada de toque até ser pressionado longamente';

  @override
  String get audioBehavior => 'Comportamento de Áudio';

  @override
  String get downmixToStereo => 'Reduzir para Estéreo';

  @override
  String get defaultAudioLanguage => 'Idioma de Áudio Padrão';

  @override
  String get autoServerDefault => 'Automático (Padrão do Servidor)';

  @override
  String get english => 'Inglês';

  @override
  String get spanish => 'Espanhol';

  @override
  String get french => 'Francês';

  @override
  String get german => 'Alemão';

  @override
  String get italian => 'Italiano';

  @override
  String get portuguese => 'Português';

  @override
  String get japanese => 'Japonês';

  @override
  String get korean => 'Coreano';

  @override
  String get chinese => 'Chinês';

  @override
  String get russian => 'Russo';

  @override
  String get arabic => 'Árabe';

  @override
  String get hindi => 'Híndi';

  @override
  String get dutch => 'Holandês';

  @override
  String get swedish => 'Sueco';

  @override
  String get norwegian => 'Norueguês';

  @override
  String get danish => 'Dinamarquês';

  @override
  String get finnish => 'Finlandês';

  @override
  String get polish => 'Polonês';

  @override
  String get ac3Passthrough => 'Passthrough AC3';

  @override
  String get dtsPassthrough => 'Passagem DTS';

  @override
  String get trueHdSupport => 'Suporte a TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Áudio Bitstream DTS apenas para AVR; requer suporte de receptor e trilha de origem DTS';

  @override
  String get enableTrueHdAudio =>
      'Habilitar áudio TrueHD (pode não funcionar em todas as plataformas)';

  @override
  String get settingsAudioOutputMode => 'Modo de saída de áudio';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Passagem AVR';

  @override
  String get settingsAudioFallbackCodec => 'Codec substituto de áudio';

  @override
  String get settingsAudioFallbackAacStereo => 'Estéreo AAC';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passagem (avançado)';

  @override
  String get settingsAudioCodecPassthrough => 'Passagem de codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ative apenas os formatos suportados pelo coletor AVR ou HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Passagem EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Passagem EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passagem principal DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passagem DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passagem TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Passagem TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) para decodificador externo.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos sobre EAC3 (JOC) para decodificador externo.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (inclui núcleo DTS) para decodificador externo.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD com metadados Atmos para decodificador externo.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Capacidades de áudio detectadas';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Nenhum instantâneo de capacidade de tempo de execução disponível ainda.';

  @override
  String get settingsAudioRouteLabel => 'Rota';

  @override
  String get settingsAudioDecodeLabel => 'Decodificar';

  @override
  String get settingsAudioPassthroughLabel => 'Passagem';

  @override
  String get settingsAudioHdRoute => 'Rota de áudio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Palestrante';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnóstico';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Nível de vídeo';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Faixa de vídeo';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Codec de legenda';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Codecs de áudio permitidos';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Codecs de áudio HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Codecs de áudio HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'passagem de áudio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Rota de áudio ativa';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Suporte de áudio HD de rota';

  @override
  String get nightMode => 'Modo Noturno';

  @override
  String get compressDynamicRange => 'Comprimir faixa dinâmica';

  @override
  String get advancedMpv => 'mpv Avançado';

  @override
  String get enableCustomMpvConf => 'Habilitar mpv.conf Personalizado';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplicar um mpv.conf especificado pelo usuário antes de iniciar a reprodução';

  @override
  String get unsafeAdvancedMpvOptions => 'Opções Avançadas Inseguras do mpv';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permitir um conjunto mais amplo de opções do mpv. Pode quebrar o comportamento da reprodução.';

  @override
  String get hardwareDecoding => 'Decodificação de hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Pode melhorar o desempenho, mas pode causar problemas de reprodução em alguns dispositivos.';

  @override
  String get nextUpAndQueuing => 'A Seguir e Fila';

  @override
  String get nextUpDisplay => 'Comportamento do A Seguir';

  @override
  String get extended => 'Estendido';

  @override
  String get minimal => 'Mínimo';

  @override
  String get nextUpTimeout => 'Tempo Limite do A Seguir';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Enfileiramento de Mídia';

  @override
  String get autoQueueNextEpisodes =>
      'Enfileirar automaticamente os próximos episódios';

  @override
  String get stillWatchingPrompt => 'Aviso de Ainda Assistindo';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Depois de episódios de $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Retomar e Pular';

  @override
  String get resumeRewind => 'Retroceder ao Retomar';

  @override
  String get unpauseRewind => 'Retomar retrocesso';

  @override
  String get fiveSeconds => '5 segundos';

  @override
  String get tenSeconds => '10 segundos';

  @override
  String get fifteenSeconds => '15 segundos';

  @override
  String get thirtySeconds => '30 segundos';

  @override
  String get skipBackLength => 'Duração do Retrocesso';

  @override
  String get skipForwardLength => 'Duração do Avanço';

  @override
  String get customMpvConfPath => 'Caminho do mpv.conf Personalizado';

  @override
  String get notSetMpvConf =>
      'Não definido. O Moonfin tentará um mpv.conf padrão nas pastas do app/dados.';

  @override
  String get selectMpvConf => 'Selecionar mpv.conf';

  @override
  String get pathToMpvConf => '/caminho/para/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'As configurações de estilo (tamanho, cor, deslocamento) se aplicam a legendas baseadas em texto (SRT, VTT, TTML). Legendas ASS/SSA usam seu próprio estilo embutido, a menos que \"Reprodução Direta ASS/SSA\" esteja desativada. Legendas bitmap (PGS, DVB, VobSub) não podem ser reestilizadas.';

  @override
  String get defaultSubtitleLanguage => 'Idioma de Legenda Padrão';

  @override
  String get defaultToNoSubtitles => 'Padrão Sem Legendas';

  @override
  String get turnOffSubtitlesByDefault => 'Desativar legendas por padrão';

  @override
  String get subtitleSize => 'Tamanho da Legenda';

  @override
  String get textFillColor => 'Cor de preenchimento de texto';

  @override
  String get backgroundColor => 'Cor de Fundo';

  @override
  String get textStrokeColor => 'Cor do traço do texto';

  @override
  String get subtitleCustomization => 'Personalização de legendas';

  @override
  String get subtitleCustomizationDescription =>
      'Personalize a aparência das legendas';

  @override
  String get subtitlePreviewText =>
      'A rápida raposa marrom salta sobre o cachorro preguiçoso';

  @override
  String get verticalOffset => 'Deslocamento Vertical';

  @override
  String get pgsDirectPlay => 'Reprodução Direta PGS';

  @override
  String get directPlayPgsSubtitles => 'Reproduzir diretamente legendas PGS';

  @override
  String get assSsaDirectPlay => 'Reprodução Direta ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Reproduzir diretamente legendas ASS/SSA';

  @override
  String get white => 'Branco';

  @override
  String get black => 'Preto';

  @override
  String get yellow => 'Amarelo';

  @override
  String get green => 'Verde';

  @override
  String get cyan => 'Ciano';

  @override
  String get red => 'Vermelho';

  @override
  String get transparent => 'Transparente';

  @override
  String get semiTransparentBlack => 'Preto Semitransparente';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Área de trabalho';

  @override
  String get mobile => 'Celular';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Configurações de perfil $profile carregadas.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Falha ao carregar as configurações do perfil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Configurações locais sincronizadas com o perfil $profile.';
  }

  @override
  String get customizationProfile => 'Perfil de Personalização';

  @override
  String get customizationProfileDescription =>
      'Escolha o perfil para carregar, editar e sincronizar. O Global se aplica em todos os lugares, a menos que um perfil de dispositivo o substitua. O ponto verde marca o perfil do seu dispositivo atual.';

  @override
  String get loadProfile => 'Carregar Perfil';

  @override
  String get syncing => 'Sincronizando...';

  @override
  String get syncToProfile => 'Sincronizar com Perfil';

  @override
  String get profileSyncHidden => 'Sincronização de Perfil Oculta';

  @override
  String get enablePluginSyncDescription =>
      'Habilite a Sincronização do Plugin do Servidor nas configurações de Plugin para mostrar os controles de perfil aqui.';

  @override
  String get quality => 'Qualidade';

  @override
  String get defaultDownloadQuality => 'Qualidade de Download Padrão';

  @override
  String get network => 'Rede';

  @override
  String get wifiOnlyDownloads => 'Downloads Apenas por WiFi';

  @override
  String get onlyDownloadOnWifi => 'Baixar apenas quando conectado ao WiFi';

  @override
  String get storage => 'Armazenamento';

  @override
  String get storageUsed => 'Armazenamento Usado';

  @override
  String get manage => 'Gerenciar';

  @override
  String get calculating => 'Calculando...';

  @override
  String get downloadLocation => 'Local de Download';

  @override
  String get defaultLabel => 'Padrão';

  @override
  String get saveToDownloadsFolder => 'Salvar na pasta Downloads';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin - visível para outros apps';

  @override
  String get dangerZone => 'Zona de Perigo';

  @override
  String get clearAllDownloads => 'Limpar Todos os Downloads';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Alterar Local de Download';

  @override
  String get changeDownloadLocationDescription =>
      'Novos downloads serão salvos na pasta selecionada. Downloads existentes permanecerão em seu local atual e podem ser gerenciados nas configurações de Armazenamento.';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cannotWriteToFolder =>
      'Não é possível gravar na pasta selecionada. Escolha outro local ou conceda permissões de armazenamento.';

  @override
  String get saveToDownloadsFolderQuestion => 'Salvar na pasta Downloads?';

  @override
  String get saveToDownloadsFolderDescription =>
      'A mídia baixada será salva em Downloads/Moonfin no seu dispositivo. Esses arquivos serão visíveis para outros apps como sua galeria ou reprodutor de música.\n\nDownloads existentes permanecerão em seu local atual.';

  @override
  String get enable => 'Habilitar';

  @override
  String get clearAllDownloadsWarning =>
      'Isso excluirá todas as mídias baixadas e não pode ser desfeito.';

  @override
  String get clearAll => 'Limpar Tudo';

  @override
  String get navigationStyle => 'Estilo de Navegação';

  @override
  String get topBar => 'Barra Superior';

  @override
  String get leftSidebar => 'Barra Lateral Esquerda';

  @override
  String get showShuffleButton => 'Mostrar Botão Aleatório';

  @override
  String get showGenresButton => 'Mostrar Botão de Gêneros';

  @override
  String get showFavoritesButton => 'Mostrar Botão de Favoritos';

  @override
  String get showLibrariesInToolbar =>
      'Mostrar Bibliotecas na Barra de Ferramentas';

  @override
  String get navbarOpacity => 'Opacidade da Barra de Navegação';

  @override
  String get navbarColor => 'Cor da Barra de Navegação';

  @override
  String get gray => 'Cinza';

  @override
  String get darkBlue => 'Azul Escuro';

  @override
  String get purple => 'Roxo';

  @override
  String get teal => 'Azul-petróleo';

  @override
  String get navy => 'Azul Marinho';

  @override
  String get charcoal => 'Carvão';

  @override
  String get brown => 'Marrom';

  @override
  String get darkRed => 'Vermelho Escuro';

  @override
  String get darkGreen => 'Verde Escuro';

  @override
  String get slate => 'Ardósia';

  @override
  String get indigo => 'Índigo';

  @override
  String get libraryDisplay => 'Exibição da Biblioteca';

  @override
  String get posterLabel => 'Pôster';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Bandeira';

  @override
  String get overridePerLibrarySettings =>
      'Substituir Configurações por Biblioteca';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplicar tipo de imagem a todas as bibliotecas';

  @override
  String get multiServerLibraries => 'Bibliotecas Multi-Servidor';

  @override
  String get showLibrariesFromAllServers =>
      'Mostrar bibliotecas de todos os servidores conectados';

  @override
  String get enableFolderView => 'Habilitar Visualização de Pastas';

  @override
  String get showFolderBrowsingOption =>
      'Mostrar opção de navegação por pastas';

  @override
  String get libraryVisibility => 'Visibilidade da Biblioteca';

  @override
  String get libraryVisibilityDescription =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicie Moonfin para que as alterações tenham efeito.';

  @override
  String get showInNavigation => 'Mostrar na navegação';

  @override
  String get showInLatestMedia => 'Mostrar nas mídias recentes';

  @override
  String get sourceLibraries => 'Bibliotecas de Origem';

  @override
  String get sourceCollections => 'Coleções de Origem';

  @override
  String get excludedGenres => 'Gêneros Excluídos';

  @override
  String get selectAll => 'Selecionar Tudo';

  @override
  String itemsSelected(int count) {
    return '$count selecionado';
  }

  @override
  String get mediaBar => 'Barra de Mídia';

  @override
  String get mediaSources => 'Fontes de mídia';

  @override
  String get behavior => 'Comportamento';

  @override
  String get seconds => 'segundos';

  @override
  String get localPreviews => 'Visualizações locais';

  @override
  String get localPreviewsDescription =>
      'Configure visualizações de trailer, mídia e áudio.';

  @override
  String get mediaBarMode => 'Estilo da barra de mídia';

  @override
  String get mediaBarModeDescription =>
      'Escolha entre Moonfin, MakD ou desative a barra de mídia';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desativada';

  @override
  String get enableMediaBar => 'Habilitar Barra de Mídia';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostrar apresentação de conteúdo em destaque na tela inicial';

  @override
  String get contentType => 'Tipo de Conteúdo';

  @override
  String get moviesAndTvShows => 'Filmes e Séries de TV';

  @override
  String get moviesOnly => 'Apenas Filmes';

  @override
  String get tvShowsOnly => 'Apenas Séries de TV';

  @override
  String get itemCount => 'Quantidade de Itens';

  @override
  String get noneSelected => 'Nenhum selecionado';

  @override
  String get noneExcluded => 'Nenhum excluído';

  @override
  String get autoAdvance => 'Avanço Automático';

  @override
  String get autoAdvanceSlides =>
      'Avançar automaticamente para o próximo slide';

  @override
  String get autoAdvanceInterval => 'Intervalo do Avanço Automático';

  @override
  String get trailerPreview => 'Pré-visualização do Trailer';

  @override
  String get autoPlayTrailers =>
      'Reproduzir trailers automaticamente na barra de mídia após 3 segundos';

  @override
  String get episodePreview => 'Pré-visualização de Episódio';

  @override
  String get mediaPreview => 'Visualização de mídia';

  @override
  String get episodePreviewDescription =>
      'Reproduzir uma pré-visualização de 30 segundos em cards focados, com cursor ou pressionados longamente';

  @override
  String get mediaPreviewDescription =>
      'Reproduza uma visualização in-line de 30 segundos em cartões focados, pairados ou pressionados por muito tempo';

  @override
  String get previewAudio => 'Áudio da Pré-visualização';

  @override
  String get enablePreviewAudio =>
      'Habilitar áudio para pré-visualizações de trailers e episódios';

  @override
  String get latestMedia => 'Mídias Recentes';

  @override
  String get recentlyReleased => 'Lançados Recentemente';

  @override
  String get myMedia => 'Minha Mídia';

  @override
  String get myMediaSmall => 'Minha Mídia (Pequeno)';

  @override
  String get continueWatching => 'Continuar Assistindo';

  @override
  String get resumeAudio => 'Retomar Áudio';

  @override
  String get resumeBooks => 'Retomar Livros';

  @override
  String get activeRecordings => 'Gravações Ativas';

  @override
  String get playlists => 'Listas de reprodução';

  @override
  String get liveTV => 'TV ao Vivo';

  @override
  String get homeSections => 'Seções Iniciais';

  @override
  String get resetToDefaults => 'Restaurar padrões';

  @override
  String get homeRowPosterSize => 'Tamanho do Pôster nas Linhas Iniciais';

  @override
  String get perRowImageTypeSelection => 'Seleção de Tipo de Imagem por Linha';

  @override
  String get configureImageTypeForEachRow =>
      'Configurar tipo de imagem para cada linha inicial habilitada';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Mesclar Continuar Assistindo e A Seguir';

  @override
  String get combineBothRows => 'Combinar ambas as linhas em uma única seção';

  @override
  String get perRowImageType => 'Tipo de Imagem por Linha';

  @override
  String get perRowSettings => 'Configurações por Linha';

  @override
  String get autoLogin => 'Login Automático';

  @override
  String get lastUser => 'Último Usuário';

  @override
  String get specificUser => 'Usuário Específico';

  @override
  String get alwaysAuthenticate => 'Sempre Autenticar';

  @override
  String get requirePasswordWithToken =>
      'Exigir senha mesmo com token armazenado';

  @override
  String get confirmExit => 'Confirmar Saída';

  @override
  String get showConfirmationBeforeExiting =>
      'Mostrar confirmação antes de sair';

  @override
  String get blockContentWithRatings =>
      'Bloquear conteúdo com as seguintes classificações:';

  @override
  String get noContentRatingsFound =>
      'Nenhuma classificação de conteúdo foi encontrada neste servidor ainda.';

  @override
  String get couldNotLoadServerRatings =>
      'Não foi possível carregar as classificações do servidor. Mostrando apenas classificações salvas.';

  @override
  String get couldNotRefreshRatings =>
      'Não foi possível atualizar as classificações do servidor. Mostrando classificações salvas.';

  @override
  String get enablePinCode => 'Habilitar Código PIN';

  @override
  String get requirePinToAccess => 'Exigir um PIN para acessar sua conta';

  @override
  String get changePin => 'Alterar PIN';

  @override
  String get setNewPinCode => 'Definir um novo código PIN';

  @override
  String get removePin => 'Remover PIN';

  @override
  String get removePinProtection => 'Remover proteção por código PIN';

  @override
  String get screensaver => 'Proteção de Tela';

  @override
  String get inAppScreensaver => 'Proteção de Tela do App';

  @override
  String get enableBuiltInScreensaver =>
      'Habilitar a proteção de tela integrada';

  @override
  String get mode => 'Modo';

  @override
  String get libraryArt => 'Arte da Biblioteca';

  @override
  String get logo => 'Logotipo';

  @override
  String get clock => 'Relógio';

  @override
  String get timeout => 'Tempo Limite';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Nível de Escurecimento';

  @override
  String get maxAgeRating => 'Classificação Etária Máxima';

  @override
  String get any => 'Qualquer';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Exigir Classificação Etária';

  @override
  String get onlyShowRatedContent => 'Mostrar apenas conteúdo classificado';

  @override
  String get showClock => 'Mostrar Relógio';

  @override
  String get displayClockDuringScreensaver =>
      'Mostrar relógio durante a proteção de tela';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Críticos)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Público)';

  @override
  String get imdb => 'IMDB';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacrítico';

  @override
  String get metacriticUser => 'Metacritic (Usuários)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Caixa de correio';

  @override
  String get myAnimeList => 'Minha lista de animes';

  @override
  String get aniList => 'ListaAni';

  @override
  String get communityRating => 'Avaliação da Comunidade';

  @override
  String get ratings => 'Avaliações';

  @override
  String get additionalRatings => 'Avaliações Adicionais';

  @override
  String get showMdbListAndTmdbRatings =>
      'Mostrar avaliações do MDBList e TMDB';

  @override
  String get ratingLabels => 'Rótulos de Avaliação';

  @override
  String get showLabelsNextToIcons =>
      'Mostrar rótulos ao lado dos ícones de avaliação';

  @override
  String get ratingBadges => 'Emblemas de Avaliação';

  @override
  String get showDecorativeBadges =>
      'Mostrar emblemas decorativos atrás das avaliações';

  @override
  String get episodeRatings => 'Avaliações de Episódios';

  @override
  String get showRatingsOnEpisodes =>
      'Mostrar avaliações em episódios individuais';

  @override
  String get ratingSources => 'Fontes de Avaliação';

  @override
  String get ratingSourcesDescription =>
      'Habilite e reordene as fontes de avaliação exibidas em todo o app';

  @override
  String get pluginLabel => 'Plug-in';

  @override
  String get pluginDetected => 'Plugin Detectado';

  @override
  String get pluginNotDetected => 'Plugin Não Detectado';

  @override
  String get pluginDetectedDescription =>
      'Plugin do servidor detectado. A sincronização é habilitada automaticamente na primeira vez que o plugin é encontrado.';

  @override
  String get pluginNotDetectedDescription =>
      'O plugin do servidor não foi detectado. As configurações locais ainda usam seus valores salvos ou padrões.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersão: $version';
  }

  @override
  String get availableServices => 'Serviços Disponíveis';

  @override
  String get serverPluginSync => 'Sincronização do Plugin do Servidor';

  @override
  String get syncSettingsWithPlugin =>
      'Sincronizar configurações com o plugin do servidor';

  @override
  String get whatSyncControls => 'O que a sincronização controla';

  @override
  String get syncControlsDescription =>
      'A sincronização controla apenas se as configurações do plugin são enviadas e recebidas do servidor. A seleção de perfil e ações de sincronização de perfil estão nas configurações de Personalização quando a sincronização do plugin está habilitada.';

  @override
  String get recentRequests => 'Solicitações Recentes';

  @override
  String get recentlyAdded => 'Adicionados Recentemente';

  @override
  String get trending => 'Em Alta';

  @override
  String get popularMovies => 'Filmes Populares';

  @override
  String get movieGenres => 'Gêneros de Filmes';

  @override
  String get upcomingMovies => 'Próximos Filmes';

  @override
  String get studios => 'Estúdios';

  @override
  String get popularSeries => 'Séries Populares';

  @override
  String get seriesGenres => 'Gêneros de Séries';

  @override
  String get upcomingSeries => 'Próximas Séries';

  @override
  String get networks => 'Emissoras';

  @override
  String get resetRowsToDefaults => 'Restaurar linhas para os padrões';

  @override
  String get enableSeerr => 'Habilitar Seerr';

  @override
  String get showSeerrInNavigation =>
      'Mostrar Seerr na navegação (requer plugin do servidor)';

  @override
  String get seerrUnavailable =>
      'Indisponível porque o suporte a Seerr do plugin do servidor está desativado.';

  @override
  String get nsfwFilter => 'Filtro NSFW';

  @override
  String get hideAdultContent => 'Ocultar conteúdo adulto nos resultados';

  @override
  String loggedInAs(String username) {
    return 'Conectado como: $username';
  }

  @override
  String get discoverRows => 'Linhas de Descoberta';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Arraste para reordenar. Habilite ou desabilite linhas. A ordem das linhas habilitadas sincroniza com o plugin Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Arraste para reordenar. Habilite ou desabilite linhas.';

  @override
  String get enabled => 'Habilitado';

  @override
  String get hidden => 'Oculto';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String versionValue(String version) {
    return 'Versão $version';
  }

  @override
  String get openSourceLicenses => 'Licenças de Código Aberto';

  @override
  String get sourceCode => 'Código Fonte';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Verificar Atualizações Agora';

  @override
  String get checksLatestDesktopRelease =>
      'Verifica a versão desktop mais recente para esta plataforma';

  @override
  String get youAreUpToDate => 'Você está atualizado.';

  @override
  String get couldNotCheckForUpdates =>
      'Não foi possível verificar atualizações agora.';

  @override
  String get noCompatibleUpdate =>
      'Nenhum pacote de atualização compatível encontrado para esta plataforma.';

  @override
  String get updateChecksNotSupported =>
      'Verificação de atualizações não é suportada nesta plataforma.';

  @override
  String get updateNotificationsDisabled =>
      'Notificações de atualização estão desabilitadas.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Aguarde antes de verificar novamente.';

  @override
  String get latestUpdateAlreadyShown =>
      'A atualização mais recente já foi exibida.';

  @override
  String get updateAvailable => 'Atualização disponível.';

  @override
  String updateAvailableVersion(String version) {
    return 'Atualização disponível: v$version';
  }

  @override
  String get updateNotifications => 'Notificações de Atualização';

  @override
  String get showWhenUpdatesAvailable =>
      'Mostrar quando atualizações estiverem disponíveis';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Disponível';
  }

  @override
  String get readReleaseNotes => 'Leia as notas de versão';

  @override
  String get downloadingUpdate => 'Baixando atualização...';

  @override
  String get updateDownloadFailed =>
      'Falha no download da atualização. Por favor, tente novamente.';

  @override
  String get openReleasesPage => 'Abrir página de lançamentos';

  @override
  String get navigation => 'Navegação';

  @override
  String get watchedIndicatorsBackdrops =>
      'Indicadores de assistido, panos de fundo';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Cor de foco, indicadores de assistido, panos de fundo';

  @override
  String get navbarStyleToolbarAppearance =>
      'Estilo da barra de navegação, botões da barra de ferramentas, aparência';

  @override
  String get reorderToggleHomeRows => 'Reordenar e alternar linhas iniciais';

  @override
  String get featuredContentAppearance => 'Conteúdo em destaque, aparência';

  @override
  String get posterSizeImageTypeFolderView =>
      'Tamanho do pôster, tipo de imagem, visualização de pastas';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB e fontes de avaliação';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Limpar';

  @override
  String get browse => 'Navegar';

  @override
  String get noResults => 'Sem resultados';

  @override
  String get seerrAvailableStatus => 'Disponível';

  @override
  String get seerrRequestedStatus => 'Solicitado';

  @override
  String itemsCount(int count) {
    return '$count Itens';
  }

  @override
  String get seerrSettings => 'Configurações do Seerr';

  @override
  String get requestMore => 'Solicitar Mais';

  @override
  String get request => 'Solicitar';

  @override
  String get cancelRequest => 'Cancelar Solicitação';

  @override
  String get playInMoonfin => 'Reproduzir no Moonfin';

  @override
  String requestedByName(String name) {
    return 'Solicitado por $name';
  }

  @override
  String get approve => 'Aprovar';

  @override
  String get declineAction => 'Recusar';

  @override
  String get similar => 'Semelhantes';

  @override
  String get recommendations => 'Recomendações';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancelar solicitação de \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancelar solicitações $count para \"$title\"?';
  }

  @override
  String get keep => 'Manter';

  @override
  String get itemNotFoundInLibrary =>
      'Item não encontrado na sua biblioteca Moonfin';

  @override
  String get errorSearchingLibrary => 'Erro ao pesquisar biblioteca';

  @override
  String budgetAmount(String amount) {
    return 'Orçamento: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Receita: \$$amount';
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
  String get submitRequest => 'Enviar Solicitação';

  @override
  String get allSeasons => 'Todas as Temporadas';

  @override
  String get advancedOptions => 'Opções Avançadas';

  @override
  String get noServiceServersConfigured =>
      'Nenhum servidor de serviço configurado';

  @override
  String get server => 'Servidor';

  @override
  String get qualityProfile => 'Perfil de Qualidade';

  @override
  String get rootFolder => 'Pasta Raiz';

  @override
  String get showMore => 'Mostrar Mais';

  @override
  String get appearances => 'Aparições';

  @override
  String get crewSection => 'Equipe';

  @override
  String ageValue(int age) {
    return 'idade $age';
  }

  @override
  String get noRequests => 'Nenhuma solicitação';

  @override
  String get pendingStatus => 'Pendente';

  @override
  String get declinedStatus => 'Recusado';

  @override
  String get partiallyAvailable => 'Parcialmente Disponível';

  @override
  String get downloadingStatus => 'Baixando';

  @override
  String get approvedStatus => 'Aprovado';

  @override
  String get notRequestedStatus => 'Não solicitado';

  @override
  String get blocklistedStatus => 'Na lista de bloqueio';

  @override
  String get deletedStatus => 'Excluído';

  @override
  String get tmdbScore => 'Pontuação TMDB';

  @override
  String get releaseDateLabel => 'Data de lançamento';

  @override
  String get firstAirDateLabel => 'Primeira data de transmissão';

  @override
  String get revenueLabel => 'Receita';

  @override
  String get runtimeLabel => 'Tempo de execução';

  @override
  String get budgetLabel => 'Orçamento';

  @override
  String get originalLanguageLabel => 'Idioma Original';

  @override
  String get seasonsLabel => 'Temporadas';

  @override
  String get episodesLabel => 'Episódios';

  @override
  String get access => 'Acesso';

  @override
  String get add => 'Adicionar';

  @override
  String get address => 'Endereço';

  @override
  String get analytics => 'Análises';

  @override
  String get catalog => 'Catálogo';

  @override
  String get content => 'Conteúdo';

  @override
  String get copy => 'Copiar';

  @override
  String get create => 'Criar';

  @override
  String get disable => 'Desabilitar';

  @override
  String get done => 'Concluído';

  @override
  String get edit => 'Editar';

  @override
  String get encoding => 'Codificação';

  @override
  String get error => 'Erro';

  @override
  String get forward => 'Avançar';

  @override
  String get general => 'Geral';

  @override
  String get go => 'Ir';

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
  String get next => 'Próximo';

  @override
  String get path => 'Caminho';

  @override
  String get paused => 'Pausado';

  @override
  String get permissions => 'Permissões';

  @override
  String get processing => 'Processando';

  @override
  String get profile => 'Perfil';

  @override
  String get provider => 'Provedor';

  @override
  String get refresh => 'Atualizar';

  @override
  String get remote => 'Remoto';

  @override
  String get rename => 'Renomear';

  @override
  String get revoke => 'Revogar';

  @override
  String get role => 'Papel';

  @override
  String get root => 'Raiz';

  @override
  String get run => 'Executar';

  @override
  String get search => 'Pesquisar';

  @override
  String get select => 'Selecionar';

  @override
  String get send => 'Enviar';

  @override
  String get sessions => 'Sessões';

  @override
  String get set => 'Definir';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Parar';

  @override
  String get streaming => 'Transmissão';

  @override
  String get time => 'Hora';

  @override
  String get trickplay => 'Truques';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get up => 'Subir';

  @override
  String get update => 'Atualizar';

  @override
  String get upload => 'Enviar';

  @override
  String get unmute => 'Ativar som';

  @override
  String get mute => 'Silenciar';

  @override
  String get branding => 'Marca';

  @override
  String get adminDrawerDashboard => 'Painel';

  @override
  String get adminDrawerAnalytics => 'Análises';

  @override
  String get adminDrawerSettings => 'Configurações';

  @override
  String get adminDrawerBranding => 'Marca';

  @override
  String get adminDrawerUsers => 'Usuários';

  @override
  String get adminDrawerLibraries => 'Bibliotecas';

  @override
  String get adminDrawerTranscoding => 'Transcodificação';

  @override
  String get adminDrawerResume => 'Retomar';

  @override
  String get adminDrawerStreaming => 'Transmissão';

  @override
  String get adminDrawerTrickplay => 'Truques';

  @override
  String get adminDrawerDevices => 'Dispositivos';

  @override
  String get adminDrawerActivity => 'Atividade';

  @override
  String get adminDrawerNetworking => 'Rede';

  @override
  String get adminDrawerApiKeys => 'Chaves de API';

  @override
  String get adminDrawerBackups => 'Cópias de segurança';

  @override
  String get adminDrawerLogs => 'Registros';

  @override
  String get adminDrawerScheduledTasks => 'Tarefas Agendadas';

  @override
  String get adminDrawerPlugins => 'Plug-ins';

  @override
  String get adminDrawerRepositories => 'Repositórios';

  @override
  String get adminDrawerLiveTv => 'TV ao Vivo';

  @override
  String get adminExitTooltip => 'Sair do Administrador';

  @override
  String get adminDashboardLoadFailed => 'Falha ao carregar o painel';

  @override
  String get adminMediaOverview => 'Visão Geral da Mídia';

  @override
  String get adminMediaTotalsError =>
      'Não foi possível carregar os totais de mídia do servidor.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Uma visão rápida de quanto conteúdo há neste servidor.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Atualizações de plug-in disponíveis: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins que requerem reinicialização: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tarefas agendadas com falha: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Entradas recentes de aviso/erro: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribuição de Mídia';

  @override
  String get analyticsVideoCodecs => 'Codecs de Vídeo';

  @override
  String get analyticsAudioCodecs => 'Codecs de Áudio';

  @override
  String get analyticsContainers => 'Contêineres';

  @override
  String get analyticsTopGenres => 'Gêneros Principais';

  @override
  String get analyticsReleaseYears => 'Anos de Lançamento';

  @override
  String get analyticsContentRatings => 'Classificações de Conteúdo';

  @override
  String get analyticsRuntimeBuckets => 'Faixas de Duração';

  @override
  String get analyticsFileFormats => 'Formatos de Arquivo';

  @override
  String get analyticsNoData => 'Nenhum Dado Disponível.';

  @override
  String get adminServerInfo => 'Informações do Servidor';

  @override
  String get adminRestartPending => 'Reinício Pendente';

  @override
  String get adminServerPaths => 'Caminhos do Servidor';

  @override
  String get adminServerActions => 'Ações do Servidor';

  @override
  String get adminRestartServer => 'Reiniciar Servidor';

  @override
  String get adminShutdownServer => 'Desligar Servidor';

  @override
  String get adminScanLibraries => 'Escanear Bibliotecas';

  @override
  String get adminLibraryScanStarted => 'Escaneamento da biblioteca iniciado';

  @override
  String errorGeneric(String error) {
    return 'Erro: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Reinício do servidor em andamento';

  @override
  String get adminServerRebootMessage =>
      'Reinício do servidor em andamento, por favor reinicie o Moonfin';

  @override
  String get adminActiveSessions => 'Sessões Ativas';

  @override
  String get adminSessionsLoadFailed => 'Falha ao carregar sessões';

  @override
  String get adminNoActiveSessions => 'Nenhuma sessão ativa';

  @override
  String get adminRecentActivity => 'Atividade Recente';

  @override
  String get adminNoRecentActivity => 'Nenhuma atividade recente';

  @override
  String adminCommandFailed(String error) {
    return 'Falha no comando: $error';
  }

  @override
  String get adminSendMessage => 'Enviar Mensagem';

  @override
  String get adminMessageTextHint => 'Texto da mensagem';

  @override
  String get adminSetVolume => 'Definir Volume';

  @override
  String get sessionPrev => 'Anterior';

  @override
  String get sessionRewind => 'Retroceder';

  @override
  String get sessionForward => 'Avançar';

  @override
  String get sessionNext => 'Próximo';

  @override
  String get sessionVolumeDown => 'Volume –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Reproduzindo Agora';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Ações';

  @override
  String get videoCodec => 'Codec de Vídeo';

  @override
  String get audioCodec => 'Codec de Áudio';

  @override
  String get hwAccel => 'Aceleração HW';

  @override
  String get completion => 'Conclusão';

  @override
  String get direct => 'Direto';

  @override
  String get adminDisconnect => 'Desconectar';

  @override
  String get adminClearDates => 'Limpar datas';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Falha ao carregar o log de atividades: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nenhuma entrada de atividade';

  @override
  String get adminEditDeviceName => 'Editar Nome do Dispositivo';

  @override
  String get adminCustomName => 'Nome Personalizado';

  @override
  String get adminDeviceNameUpdated => 'Nome do dispositivo atualizado';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Falha ao atualizar o dispositivo: $error';
  }

  @override
  String get adminDeleteDevice => 'Excluir Dispositivo';

  @override
  String get adminDeviceDeleted => 'Dispositivo excluído';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Falha ao excluir dispositivo: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Falha ao carregar dispositivos';

  @override
  String get adminSearchDevices => 'Pesquisar dispositivos';

  @override
  String get adminThisDevice => 'Este Dispositivo';

  @override
  String get adminEditName => 'Editar Nome';

  @override
  String get adminLibrariesLoadFailed => 'Falha ao carregar bibliotecas';

  @override
  String get adminNoLibraries => 'Nenhuma biblioteca configurada';

  @override
  String get adminScanAllLibraries => 'Escanear Todas as Bibliotecas';

  @override
  String get adminAddLibrary => 'Adicionar Biblioteca';

  @override
  String adminScanFailed(String error) {
    return 'Falha ao iniciar a verificação: $error';
  }

  @override
  String get adminRenameLibrary => 'Renomear Biblioteca';

  @override
  String get adminNewName => 'Novo nome';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteca renomeada para \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Falha ao renomear: $error';
  }

  @override
  String get adminDeleteLibrary => 'Excluir Biblioteca';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteca \"$name\" excluída';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Falha ao excluir biblioteca: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Falha ao adicionar caminho: $error';
  }

  @override
  String get adminRemovePath => 'Remover Caminho';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remover \"$path\" desta biblioteca?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Falha ao remover caminho: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opções da biblioteca salvas';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Falha ao salvar opções: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Falha ao carregar biblioteca';

  @override
  String get adminNoMediaPaths => 'Nenhum caminho de mídia configurado';

  @override
  String get adminAddPath => 'Adicionar Caminho';

  @override
  String get adminBrowseFilesystem =>
      'Navegar pelo sistema de arquivos do servidor:';

  @override
  String get adminSaveOptions => 'Salvar Opções';

  @override
  String get adminPreferredMetadataLanguage => 'Idioma preferido de metadados';

  @override
  String get adminMetadataLanguageHint => 'ex: en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Código do país para metadados';

  @override
  String get adminMetadataCountryHint => 'ex: US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'O nome da biblioteca é obrigatório';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Falha ao criar biblioteca: $error';
  }

  @override
  String get adminLibraryName => 'Nome da Biblioteca';

  @override
  String get adminSelectedPaths => 'Caminhos Selecionados:';

  @override
  String get adminNoPathsAdded =>
      'Nenhum caminho adicionado (pode ser adicionado depois)';

  @override
  String get adminCreateLibrary => 'Criar Biblioteca';

  @override
  String get paths => 'Caminhos:';

  @override
  String get adminDisableUser => 'Desabilitar Usuário';

  @override
  String get adminEnableUser => 'Habilitar Usuário';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Desativar $name? Eles não poderão fazer login.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Habilitar $name? Eles poderão fazer login novamente.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Usuário \"$name\" desativado';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Usuário \"$name\" ativado';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Falha ao atualizar a política do usuário: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Falha ao carregar usuários';

  @override
  String get adminSearchUsers => 'Pesquisar usuários';

  @override
  String get adminEditUser => 'Editar Usuário';

  @override
  String get adminAddUser => 'Adicionar Usuário';

  @override
  String adminUserCreateFailed(String error) {
    return 'Falha ao criar usuário: $error';
  }

  @override
  String get adminCreateUser => 'Criar Usuário';

  @override
  String get adminPasswordOptional => 'Senha (opcional)';

  @override
  String get adminUsernameRequired => 'O nome de usuário não pode estar vazio';

  @override
  String get adminNoProfileChanges => 'Nenhuma alteração de perfil para salvar';

  @override
  String get adminProfileSaved => 'Perfil salvo';

  @override
  String adminSaveFailed(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permissões salvas';

  @override
  String get adminPasswordsMismatch => 'As senhas não coincidem';

  @override
  String adminFailed(String error) {
    return 'Falha: $error';
  }

  @override
  String get adminUserLoadFailed => 'Falha ao carregar usuário';

  @override
  String get adminBackToUsers => 'Voltar para Usuários';

  @override
  String get adminSaveProfile => 'Salvar Perfil';

  @override
  String get adminDeleteUser => 'Excluir Usuário';

  @override
  String get admin => 'Administrador';

  @override
  String get adminFullAccessWarning =>
      'Administradores têm acesso completo ao servidor. Conceda com cautela.';

  @override
  String get administrator => 'Administrador';

  @override
  String get adminHiddenUser => 'Usuário oculto';

  @override
  String get adminAllowMediaPlayback => 'Permitir reprodução de mídia';

  @override
  String get adminAllowAudioTranscoding => 'Permitir transcodificação de áudio';

  @override
  String get adminAllowVideoTranscoding => 'Permitir transcodificação de vídeo';

  @override
  String get adminAllowRemuxing => 'Permitir remuxing';

  @override
  String get adminForceRemoteTranscoding =>
      'Forçar transcodificação de fonte remota';

  @override
  String get adminAllowContentDeletion => 'Permitir exclusão de conteúdo';

  @override
  String get adminAllowContentDownloading => 'Permitir download de conteúdo';

  @override
  String get adminAllowPublicSharing => 'Permitir compartilhamento público';

  @override
  String get adminAllowRemoteControl =>
      'Permitir controle remoto de outros usuários';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permitir controle de dispositivo compartilhado';

  @override
  String get adminAllowRemoteAccess => 'Permitir acesso remoto';

  @override
  String get adminRemoteBitrateLimit =>
      'Limite de bitrate do cliente remoto (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Deixe vazio para sem limite';

  @override
  String get adminMaxActiveSessions => 'Máximo de sessões ativas';

  @override
  String get adminAllowLiveTvAccess => 'Permitir acesso à TV ao Vivo';

  @override
  String get adminAllowLiveTvManagement =>
      'Permitir gerenciamento de TV ao Vivo';

  @override
  String get adminAllowCollectionManagement =>
      'Permitir gerenciamento de coleções';

  @override
  String get adminAllowSubtitleManagement =>
      'Permitir gerenciamento de legendas';

  @override
  String get adminAllowLyricManagement => 'Permitir gerenciamento de letras';

  @override
  String get adminSavePermissions => 'Salvar Permissões';

  @override
  String get adminEnableAllLibraryAccess =>
      'Habilitar acesso a todas as bibliotecas';

  @override
  String get adminSaveAccess => 'Salvar Acesso';

  @override
  String get adminChangePassword => 'Alterar Senha';

  @override
  String get adminNewPassword => 'Nova Senha';

  @override
  String get adminConfirmPassword => 'Confirmar Senha';

  @override
  String get adminSetPassword => 'Definir Senha';

  @override
  String get adminResetPassword => 'Redefinir Senha';

  @override
  String get adminPasswordReset => 'Redefinição de senha';

  @override
  String get adminPasswordUpdated => 'Senha atualizada';

  @override
  String get adminUserSettings => 'Configurações do usuário';

  @override
  String get adminLibraryAccess => 'Acesso à biblioteca';

  @override
  String get adminDeviceAndChannelAccess => 'Acesso a dispositivos e canais';

  @override
  String get adminEnableAllDevices =>
      'Habilite o acesso a todos os dispositivos';

  @override
  String get adminEnableAllChannels => 'Habilite o acesso a todos os canais';

  @override
  String get adminResetPasswordWarning =>
      'Isso removerá a senha. O usuário poderá fazer login sem senha.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Servidor retornou HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Usuário \"$name\" excluído';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Falha ao excluir usuário: $error';
  }

  @override
  String get adminCreateApiKey => 'Criar Chave de API';

  @override
  String get adminAppName => 'Nome do app';

  @override
  String get adminApiKeyCreated => 'Chave de API Criada';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Chave criada com sucesso. O servidor não retornou o token. Verifique as chaves de API do servidor.';

  @override
  String get adminKeyCopied => 'Chave copiada para a área de transferência';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Falha ao criar chave: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token da chave ausente na resposta do servidor';

  @override
  String get adminRevokeApiKey => 'Revogar Chave de API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revogar chave para $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Chave de API revogada';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Falha ao revogar chave: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Falha ao carregar chaves de API';

  @override
  String get adminApiKeysTitle => 'Chaves de API';

  @override
  String get adminCreateKey => 'Criar Chave';

  @override
  String get adminNoApiKeys => 'Nenhuma chave de API encontrada';

  @override
  String get adminUnknownApp => 'Aplicativo desconhecido';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCriado: $created';
  }

  @override
  String get adminCreatingBackup => 'Criando backup...';

  @override
  String get adminBackupCreated => 'Backup criado com sucesso';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Falha ao criar backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Caminho do backup ausente na resposta do servidor';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesto: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Falha ao carregar o manifesto: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmar Restauração';

  @override
  String get adminRestoringBackup => 'Restaurando backup...';

  @override
  String adminRestoreFailed(String error) {
    return 'Falha ao restaurar o backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Falha ao carregar backups';

  @override
  String get adminCreateBackup => 'Criar Backup';

  @override
  String get adminNoBackups => 'Nenhum backup encontrado';

  @override
  String get adminViewDetails => 'Ver Detalhes';

  @override
  String get restore => 'Restaurar';

  @override
  String get adminLogsLoadFailed => 'Falha ao carregar logs do servidor';

  @override
  String get adminNoLogFiles => 'Nenhum arquivo de log encontrado';

  @override
  String get adminLogCopied => 'Log copiado para a área de transferência';

  @override
  String get adminSaveLogFile => 'Salvar arquivo de log';

  @override
  String adminSavedTo(String path) {
    return 'Salvo em $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Falha ao salvar arquivo: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Falha ao carregar $fileName';
  }

  @override
  String get adminSearchInLog => 'Pesquisar no log';

  @override
  String get adminNoMatchingLines => 'Nenhuma linha correspondente';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Falha ao carregar tarefas: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nenhuma tarefa agendada encontrada';

  @override
  String get adminNoTasksMatchFilter =>
      'Nenhuma tarefa corresponde ao filtro atual';

  @override
  String adminTaskStartFailed(String error) {
    return 'Falha ao iniciar a tarefa: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Falha ao interromper a tarefa: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Falha ao carregar tarefa: $error';
  }

  @override
  String get adminRunNow => 'Executar Agora';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Falha ao remover o gatilho: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Falha ao adicionar gatilho: $error';
  }

  @override
  String get adminLastExecution => 'Última Execução';

  @override
  String get adminTriggers => 'Acionadores';

  @override
  String get adminAddTrigger => 'Adicionar Acionador';

  @override
  String get adminNoTriggers => 'Nenhum acionador configurado';

  @override
  String get adminTriggerType => 'Tipo de Acionador';

  @override
  String get adminTimeLimit => 'Limite de tempo (opcional)';

  @override
  String get adminNoLimit => 'Sem limite';

  @override
  String adminHours(String hours) {
    return '$hours hora(s)';
  }

  @override
  String get adminDayOfWeek => 'Dia da semana';

  @override
  String get adminSearchPlugins => 'Pesquisar plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Falha ao alternar o plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstalar Plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Tem certeza de que deseja desinstalar \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Falha ao desinstalar o plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Falha ao instalar o pacote: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Falha ao instalar a atualização: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Falha ao carregar plug-ins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nenhum plugin corresponde à sua pesquisa';

  @override
  String get adminNoPluginsInstalled => 'Nenhum plugin instalado';

  @override
  String adminInstallUpdate(String version) {
    return 'Instalar atualização (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Falha ao carregar o catálogo: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Nenhum pacote corresponde à sua pesquisa';

  @override
  String get adminNoPackagesAvailable => 'Nenhum pacote disponível';

  @override
  String get adminExperimentalIntegration => 'Integração Experimental';

  @override
  String get adminExperimentalWarning =>
      'A integração de configurações de plugins ainda é experimental. Algumas páginas de configurações podem não ser renderizadas corretamente.';

  @override
  String get continueAction => 'Continuar';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" será removido após a reinicialização do servidor';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Falha ao desinstalar: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Atualizando \"$name\" para v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Não foi possível abrir configurações: token de autenticação ausente.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Falha ao carregar o plug-in: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin não encontrado';

  @override
  String adminPluginVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get adminEnablePlugin => 'Habilitar Plugin';

  @override
  String get adminPluginSettingsPage => 'Página de configurações do plugin';

  @override
  String get adminRevisionHistory => 'Histórico de Revisões';

  @override
  String get adminNoChangelog => 'Nenhum changelog disponível.';

  @override
  String get adminRemoveRepository => 'Remover Repositório';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Tem certeza de que deseja remover \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Falha ao salvar repositórios: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Falha ao carregar repositórios: $error';
  }

  @override
  String get adminRepositoryNameHint => 'ex: Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL do Repositório';

  @override
  String get adminAddEntry => 'Adicionar entrada';

  @override
  String get adminInvalidUrl => 'URL inválida';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Não foi possível carregar as configurações do plugin: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Não foi possível abrir $uri';
  }

  @override
  String get adminOpenInBrowser => 'Abrir no Navegador';

  @override
  String get adminOpenExternally => 'Abrir externamente';

  @override
  String get adminGeneralSettings => 'Configurações Gerais';

  @override
  String get adminServerName => 'Nome do servidor';

  @override
  String get adminPreferredMetadataCountry => 'País preferido para metadados';

  @override
  String get adminCachePath => 'Caminho do cache';

  @override
  String get adminMetadataPath => 'Caminho dos metadados';

  @override
  String get adminLibraryScanConcurrency =>
      'Concorrência de escaneamento de biblioteca';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limite de codificação de imagens paralelas';

  @override
  String get adminSlowResponseThreshold => 'Limite de resposta lenta (ms)';

  @override
  String get adminBrandingSaved => 'Configurações de marca salvas';

  @override
  String get adminBrandingLoadFailed =>
      'Falha ao carregar configurações de marca';

  @override
  String get adminLoginDisclaimer => 'Aviso no login';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML exibido abaixo do formulário de login';

  @override
  String get adminCustomCss => 'CSS Personalizado';

  @override
  String get adminCustomCssHint => 'CSS personalizado aplicado à interface web';

  @override
  String get adminEnableSplashScreen => 'Habilitar tela de apresentação';

  @override
  String get adminStreamingSaved => 'Configurações de transmissão salvas';

  @override
  String get adminStreamingLoadFailed =>
      'Falha ao carregar configurações de transmissão';

  @override
  String get adminStreamingDescription =>
      'Defina limites globais de bitrate de transmissão para conexões remotas.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limite de bitrate do cliente remoto (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Deixe vazio ou 0 para ilimitado';

  @override
  String get adminPlaybackSaved => 'Configurações de reprodução salvas';

  @override
  String get adminPlaybackLoadFailed =>
      'Falha ao carregar configurações de reprodução';

  @override
  String get adminPlaybackTranscoding => 'Reprodução / Transcodificação';

  @override
  String get adminHardwareAcceleration => 'Aceleração de hardware';

  @override
  String get adminVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminEnableHardwareEncoding =>
      'Habilitar codificação por hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Habilitar decodificação por hardware para:';

  @override
  String get adminEncodingThreads => 'Threads de codificação';

  @override
  String get adminAutomatic => '0 = automático';

  @override
  String get adminTranscodingTempPath =>
      'Caminho temporário de transcodificação';

  @override
  String get adminEnableFallbackFont => 'Habilitar fonte alternativa';

  @override
  String get adminFallbackFontPath => 'Caminho da fonte alternativa';

  @override
  String get adminAllowSegmentDeletion => 'Permitir exclusão de segmentos';

  @override
  String get adminSegmentKeepSeconds => 'Manter segmento (segundos)';

  @override
  String get adminThrottleBuffering => 'Limitar buffering';

  @override
  String get adminTrickplaySaved => 'Configurações de trickplay salvas';

  @override
  String get adminTrickplayLoadFailed =>
      'Falha ao carregar configurações de trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Habilitar aceleração de hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Habilitar extração apenas de quadros-chave';

  @override
  String get adminKeyFrameSubtitle => 'Mais rápido, mas menor precisão';

  @override
  String get adminScanBehavior => 'Comportamento de escaneamento';

  @override
  String get adminProcessPriority => 'Prioridade do processo';

  @override
  String get adminImageSettings => 'Configurações de Imagem';

  @override
  String get adminIntervalMs => 'Intervalo (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Frequência de captura de quadros';

  @override
  String get adminWidthResolutions => 'Resoluções de largura';

  @override
  String get adminTileWidth => 'Largura do mosaico';

  @override
  String get adminTileHeight => 'Altura do mosaico';

  @override
  String get adminQualitySubtitle =>
      'Valores menores = melhor qualidade, arquivos maiores';

  @override
  String get adminProcessThreads => 'Threads de processo';

  @override
  String get adminResumeSaved => 'Configurações de retomada salvas';

  @override
  String get adminResumeLoadFailed =>
      'Falha ao carregar configurações de retomada';

  @override
  String get adminResumeDescription =>
      'Configure quando o conteúdo deve ser marcado como parcialmente reproduzido ou totalmente reproduzido.';

  @override
  String get adminMinResumePercentage => 'Porcentagem mínima de retomada';

  @override
  String get adminMinResumeSubtitle =>
      'O conteúdo deve ser reproduzido além desta porcentagem para salvar o progresso';

  @override
  String get adminMaxResumePercentage => 'Porcentagem máxima de retomada';

  @override
  String get adminMaxResumeSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta porcentagem';

  @override
  String get adminMinResumeDuration => 'Duração mínima de retomada (segundos)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Itens mais curtos que isso não são retomáveis';

  @override
  String get adminMinAudiobookResume =>
      'Porcentagem mínima de retomada de audiolivros';

  @override
  String get adminMaxAudiobookResume =>
      'Porcentagem máxima de retomada de audiolivros';

  @override
  String get adminNetworkingSaved =>
      'Configurações de rede salvas. Pode ser necessário reiniciar o servidor.';

  @override
  String get adminNetworkingLoadFailed =>
      'Falha ao carregar configurações de rede';

  @override
  String get adminNetworkingWarning =>
      'Alterações nas configurações de rede podem exigir reinício do servidor.';

  @override
  String get adminEnableRemoteAccess => 'Habilitar acesso remoto';

  @override
  String get ports => 'Portas';

  @override
  String get adminHttpPort => 'Porta HTTP';

  @override
  String get adminHttpsPort => 'Porta HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminBaseUrl => 'URL Base';

  @override
  String get adminBaseUrlHint => 'ex: /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Habilitar HTTPS';

  @override
  String get adminLocalNetwork => 'Rede Local';

  @override
  String get adminLocalNetworkAddresses => 'Endereços de rede local';

  @override
  String get adminKnownProxies => 'Proxies conhecidos';

  @override
  String get adminRemoteIpFilter => 'Filtro de IP Remoto';

  @override
  String get adminRemoteIpFilterEntries => 'Filtro de IP remoto';

  @override
  String get adminCertificatePath => 'Caminho do certificado';

  @override
  String get whitelist => 'Lista branca';

  @override
  String get blacklist => 'Lista negra';

  @override
  String get notSet => 'Não definido';

  @override
  String get adminMetadataSaved => 'Metadados salvos';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Falha ao carregar metadados: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Falha ao salvar metadados: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atualizar Metadados';

  @override
  String get recursive => 'Recursivo';

  @override
  String get adminReplaceAllMetadata => 'Substituir todos os metadados';

  @override
  String get adminReplaceAllImages => 'Substituir todas as imagens';

  @override
  String get adminMetadataRefreshRequested =>
      'Atualização de metadados solicitada';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Falha ao atualizar metadados: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Pesquisar Pessoa Remota';

  @override
  String get adminNoRemoteMatches =>
      'Nenhuma correspondência remota encontrada';

  @override
  String get adminRemoteResults => 'Resultados Remotos';

  @override
  String get adminRemoteMetadataApplied => 'Metadados remotos aplicados';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Falha na pesquisa remota: $error';
  }

  @override
  String get adminUpdateContentType => 'Atualizar Tipo de Conteúdo';

  @override
  String get adminContentType => 'Tipo de conteúdo';

  @override
  String get adminContentTypeUpdated => 'Tipo de conteúdo atualizado';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Falha ao atualizar o tipo de conteúdo: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Falha ao carregar editor de metadados';

  @override
  String get adminNoPeopleEntries => 'Nenhuma entrada de pessoas';

  @override
  String get adminNoExternalIds => 'Nenhum ID externo disponível';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType imagem atualizada';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Falha ao baixar imagem: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Formato de imagem não suportado';

  @override
  String get adminImageReadFailed => 'Falha ao ler a imagem selecionada';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType imagem enviada';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Falha ao fazer upload da imagem: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Excluir imagem $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType imagem excluída';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Falha ao excluir imagem: $error';
  }

  @override
  String get adminAllProviders => 'Todos os provedores';

  @override
  String get adminNoRemoteImages => 'Nenhuma imagem remota encontrada';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Falha na descoberta do sintonizador: $error';
  }

  @override
  String get adminAddTuner => 'Adicionar Sintonizador';

  @override
  String get adminTunerType => 'Tipo de Sintonizador';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Outro';

  @override
  String get adminUrlPath => 'URL / Caminho';

  @override
  String get adminNameOptional => 'Nome (opcional)';

  @override
  String get adminTunerAdded => 'Sintonizador adicionado';

  @override
  String adminTunerAddFailed(String error) {
    return 'Falha ao adicionar sintonizador: $error';
  }

  @override
  String get adminAddGuideProvider => 'Adicionar Provedor de Guia';

  @override
  String get adminProviderType => 'Tipo de Provedor';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect ou XMLTV';

  @override
  String get adminUsernameOptional => 'Nome de usuário (opcional)';

  @override
  String get adminRefreshInterval => 'Intervalo de atualização (horas)';

  @override
  String get adminProviderAdded => 'Provedor adicionado';

  @override
  String adminProviderAddFailed(String error) {
    return 'Falha ao adicionar provedor: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Falha ao remover o sintonizador: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'Redefinição do sintonizador solicitada';

  @override
  String adminTunerResetFailed(String error) {
    return 'Falha ao redefinir o sintonizador: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Falha ao remover provedor: $error';
  }

  @override
  String get adminRecordingSettings => 'Configurações de Gravação';

  @override
  String get adminPrePadding => 'Pré-margem (minutos)';

  @override
  String get adminPostPadding => 'Pós-margem (minutos)';

  @override
  String get adminRecordingPath => 'Caminho de gravação';

  @override
  String get adminSeriesRecordingPath => 'Caminho de gravação de séries';

  @override
  String get adminRecordingSettingsSaved => 'Configurações de gravação salvas';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Falha ao salvar configurações: $error';
  }

  @override
  String get adminSetChannelMappings => 'Definir Mapeamentos de Canais';

  @override
  String get adminMappingJson => 'JSON de Mapeamento';

  @override
  String get adminMappingJsonHint => 'Exemplo: mapeamentos de carga JSON';

  @override
  String get adminChannelMappingsUpdated => 'Mapeamentos de canais atualizados';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Falha ao atualizar mapeamentos: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Falha ao carregar a administração de TV ao Vivo';

  @override
  String get adminTunerDevices => 'Dispositivos Sintonizadores';

  @override
  String get adminNoTunerHosts => 'Nenhum sintonizador configurado';

  @override
  String get adminGuideProviders => 'Provedores de Guia';

  @override
  String get adminAddProvider => 'Adicionar Provedor';

  @override
  String get adminNoListingProviders =>
      'Nenhum provedor de listagem configurado';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Caminho de gravação: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Caminho da série: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Pré-preenchimento: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Pós-preenchimento: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Descoberta de Sintonizadores';

  @override
  String get adminChannelMappings => 'Mapeamentos de Canais';

  @override
  String get adminNoDiscoveredTuners => 'Nenhum sintonizador descoberto ainda';

  @override
  String get adminSettingsSaved => 'Configurações salvas';

  @override
  String get adminBackupsNotAvailable =>
      'Backups não estão disponíveis nesta versão do servidor.';

  @override
  String get adminRestoreWarning1 =>
      'A restauração substituirá TODOS os dados atuais do servidor pelos dados do backup.';

  @override
  String get adminRestoreWarning2 =>
      'Configurações, usuários e dados da biblioteca do servidor atual serão sobrescritos.';

  @override
  String get adminRestoreWarning3 =>
      'O servidor será reiniciado após a restauração.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restaurar backup $name agora?';
  }

  @override
  String get adminRestoreRequested =>
      'Restauração solicitada. O reinício do servidor pode desconectar esta sessão.';

  @override
  String get adminBackupsTitle => 'Cópias de segurança';

  @override
  String get adminUnknownDate => 'Data desconhecida';

  @override
  String get adminUnnamedBackup => 'Backup Sem Nome';

  @override
  String get adminLiveTvNotAvailable =>
      'A administração de TV ao Vivo não está disponível nesta versão do servidor.';

  @override
  String get adminLiveTvTitle => 'Administração de TV ao Vivo';

  @override
  String get adminApply => 'Aplicar';

  @override
  String get adminNotSet => 'Não definido';

  @override
  String get adminReset => 'Redefinir';

  @override
  String get adminLogsTitle => 'Logs do Servidor';

  @override
  String get adminLogsNewestFirst => 'Mais Recentes Primeiro';

  @override
  String get adminLogsOldestFirst => 'Mais Antigos Primeiro';

  @override
  String get adminLogsJustNow => 'Agora mesmo';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m atrás';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h atrás';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d atrás';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Falha ao carregar $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count corresponde';
  }

  @override
  String get adminLogViewerNoMatches => 'Nenhuma linha correspondente';

  @override
  String get adminMetadataEditorTitle => 'Editor de Metadados';

  @override
  String get adminMetadataRemote => 'Remoto';

  @override
  String get adminMetadataType => 'Tipo';

  @override
  String get adminMetadataDetails => 'Detalhes';

  @override
  String get adminMetadataExternalIds => 'IDs Externos';

  @override
  String get adminMetadataImages => 'Imagens';

  @override
  String get adminMetadataFieldTitle => 'Título';

  @override
  String get adminMetadataFieldSortTitle => 'Título para ordenação';

  @override
  String get adminMetadataFieldOriginalTitle => 'Título original';

  @override
  String get adminMetadataFieldPremiereDate => 'Data de estreia (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data de encerramento (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Ano de produção';

  @override
  String get adminMetadataFieldOfficialRating => 'Classificação oficial';

  @override
  String get adminMetadataFieldCommunityRating => 'Avaliação da comunidade';

  @override
  String get adminMetadataFieldCriticRating => 'Avaliação da crítica';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Sinopse';

  @override
  String get adminMetadataGenres => 'Gêneros';

  @override
  String get adminMetadataTags => 'Etiquetas';

  @override
  String get adminMetadataStudios => 'Estúdios';

  @override
  String get adminMetadataPeople => 'Pessoas';

  @override
  String get adminMetadataAddGenre => 'Adicionar gênero';

  @override
  String get adminMetadataAddTag => 'Adicionar tag';

  @override
  String get adminMetadataAddStudio => 'Adicionar estúdio';

  @override
  String get adminMetadataAddPerson => 'Adicionar Pessoa';

  @override
  String get adminMetadataEditPerson => 'Editar Pessoa';

  @override
  String get adminMetadataRole => 'Papel';

  @override
  String get adminMetadataImagePrimary => 'Principal';

  @override
  String get adminMetadataImageBackdrop => 'Pano de Fundo';

  @override
  String get adminMetadataImageLogo => 'Logotipo';

  @override
  String get adminMetadataImageBanner => 'Bandeira';

  @override
  String get adminMetadataImageThumb => 'Miniatura';

  @override
  String get adminMetadataRecursive => 'Recursivo';

  @override
  String get adminMetadataProvider => 'Provedor';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType imagem atualizada';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType imagem enviada';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType imagem excluída';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Falha ao baixar imagem: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Falha ao ler a imagem selecionada';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Falha ao fazer upload da imagem: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Excluir imagem $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Isso remove a imagem atual do item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Falha ao excluir imagem: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Escolha a imagem $imageType';
  }

  @override
  String get adminMetadataUpload => 'Enviar';

  @override
  String get adminMetadataUpdate => 'Atualizar';

  @override
  String get adminMetadataRemoteImage => 'Imagem remota';

  @override
  String get adminPluginsInstalled => 'Instalados';

  @override
  String get adminPluginsCatalog => 'Catálogo';

  @override
  String get adminPluginsActive => 'Ativos';

  @override
  String get adminPluginsRestart => 'Reiniciar';

  @override
  String get adminPluginsNoSearchResults =>
      'Nenhum plugin corresponde à sua pesquisa';

  @override
  String get adminPluginsNoneInstalled => 'Nenhum plugin instalado';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Atualização disponível: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Atualização disponível';

  @override
  String get adminPluginsPendingRemoval => 'Remoção pendente após reinício';

  @override
  String get adminPluginsChangesPending => 'Alterações pendentes de reinício';

  @override
  String get adminPluginsEnable => 'Habilitar';

  @override
  String get adminPluginsDisable => 'Desabilitar';

  @override
  String get adminPluginsInstallUpdate => 'Instalar atualização';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instalar atualização (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nenhum pacote corresponde à sua pesquisa';

  @override
  String get adminPluginsCatalogEmpty => 'Nenhum pacote disponível';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" está sendo instalado...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integração Experimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'A integração de configurações de plugins ainda é experimental. Alguns campos ou layouts podem não ser renderizados corretamente ainda.';

  @override
  String get adminPluginDetailToggle404 =>
      'Falha ao alternar plugin. O servidor não encontrou esta versão do plugin. Tente atualizar plugins e tente novamente.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Falha ao alternar plugin. Verifique os logs do servidor para detalhes.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Configurações';
  }

  @override
  String get adminPluginDetailDetails => 'Detalhes';

  @override
  String get adminPluginDetailDeveloper => 'Desenvolvedor';

  @override
  String get adminPluginDetailRepository => 'Repositório';

  @override
  String get adminPluginDetailBundled => 'Integrado';

  @override
  String get adminPluginDetailEnablePlugin => 'Habilitar Plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'É necessário reiniciar o servidor para que as alterações tenham efeito.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Este plugin será removido após reinício do servidor.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Este plugin apresentou mau funcionamento e pode não funcionar corretamente.';

  @override
  String get adminPluginDetailNotSupported =>
      'Este plugin não é suportado pela versão atual do servidor.';

  @override
  String get adminPluginDetailSuperseded =>
      'Este plugin foi substituído por uma versão mais recente.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Falha ao carregar repositórios: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Remover Repositório';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Tem certeza de que deseja remover \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Remover';

  @override
  String adminReposSaveFailed(String error) {
    return 'Falha ao salvar repositórios: $error';
  }

  @override
  String get adminReposEmpty => 'Nenhum repositório configurado';

  @override
  String get adminReposEmptySubtitle =>
      'Adicione um repositório para navegar pelos plugins disponíveis';

  @override
  String get adminReposUnnamed => '(sem nome)';

  @override
  String get adminReposEditTitle => 'Editar Repositório';

  @override
  String get adminReposAddTitle => 'Adicionar Repositório';

  @override
  String get adminReposUrl => 'URL do Repositório';

  @override
  String get adminReposNameHint => 'ex: Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL inválida';

  @override
  String get adminGeneralSettingsTitle => 'Configurações Gerais';

  @override
  String get adminGeneralMetadataLanguage => 'Idioma preferido de metadados';

  @override
  String get adminGeneralMetadataLanguageHint => 'ex: en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'País preferido para metadados';

  @override
  String get adminGeneralMetadataCountryHint => 'ex: US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Concorrência de escaneamento de biblioteca';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limite de codificação de imagens paralelas';

  @override
  String get adminUnknownError => 'Erro desconhecido';

  @override
  String get adminBrowse => 'Navegar';

  @override
  String get adminCloseBrowser => 'Fechar navegador';

  @override
  String get adminNetworkingTitle => 'Rede';

  @override
  String get adminNetworkingRestartWarning =>
      'Alterações nas configurações de rede podem exigir reinício do servidor.';

  @override
  String get adminNetworkingRemoteAccess => 'Habilitar acesso remoto';

  @override
  String get adminNetworkingPorts => 'Portas';

  @override
  String get adminNetworkingHttpPort => 'Porta HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Porta HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Habilitar HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Rede Local';

  @override
  String get adminNetworkingLocalAddresses => 'Endereços de rede local';

  @override
  String get adminNetworkingAddressHint => 'ex: 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxies conhecidos';

  @override
  String get adminNetworkingProxyHint => 'ex: 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista branca';

  @override
  String get adminNetworkingBlacklist => 'Lista negra';

  @override
  String get adminNetworkingAddEntry => 'Adicionar entrada';

  @override
  String get adminBrandingTitle => 'Marca';

  @override
  String get adminBrandingLoginDisclaimer => 'Aviso no login';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML exibido abaixo do formulário de login';

  @override
  String get adminBrandingCustomCss => 'CSS Personalizado';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizado aplicado à interface web';

  @override
  String get adminBrandingEnableSplash => 'Habilitar tela de apresentação';

  @override
  String get adminPlaybackHwAccel => 'Aceleração de Hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Aceleração de hardware';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Habilitar codificação por hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Habilitar decodificação por hardware para:';

  @override
  String get adminPlaybackEncoding => 'Codificação';

  @override
  String get adminPlaybackEncodingThreads => 'Threads de codificação';

  @override
  String get adminPlaybackFallbackFont => 'Habilitar fonte alternativa';

  @override
  String get adminPlaybackFallbackFontPath => 'Caminho da fonte alternativa';

  @override
  String get adminPlaybackStreaming => 'Transmissão';

  @override
  String get adminResumeVideo => 'Vídeo';

  @override
  String get adminResumeAudiobooks => 'Audiolivros';

  @override
  String get adminResumeMinAudiobookPct =>
      'Porcentagem mínima de retomada de audiolivros';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Porcentagem máxima de retomada de audiolivros';

  @override
  String get adminStreamingBitrateLimit =>
      'Limite de bitrate do cliente remoto (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Deixe vazio ou 0 para ilimitado';

  @override
  String get adminTrickplayHwAccel => 'Habilitar aceleração de hardware';

  @override
  String get adminTrickplayHwEncoding => 'Habilitar codificação por hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Habilitar extração apenas de quadros-chave';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Mais rápido, mas menor precisão';

  @override
  String get adminTrickplayNonBlocking => 'Não Bloqueante';

  @override
  String get adminTrickplayBlocking => 'Bloqueante';

  @override
  String get adminTrickplayPriorityHigh => 'Alta';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Acima do Normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Abaixo do Normal';

  @override
  String get adminTrickplayPriorityIdle => 'Inativo';

  @override
  String get adminTrickplayImageSettings => 'Configurações de Imagem';

  @override
  String get adminTrickplayInterval => 'Intervalo (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Frequência de captura de quadros';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Larguras de pixel separadas por vírgula (ex: 320)';

  @override
  String get adminTrickplayQuality => 'Qualidade';

  @override
  String get adminTrickplayQScale => 'Escala de qualidade';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valores menores = melhor qualidade, arquivos maiores';

  @override
  String get adminTrickplayJpegQuality => 'Qualidade JPEG';

  @override
  String get adminTrickplayProcessing => 'Processamento';

  @override
  String get adminTasksEmpty => 'Nenhuma tarefa agendada encontrada';

  @override
  String get adminTasksNoFilterMatch =>
      'Nenhuma tarefa corresponde ao filtro atual';

  @override
  String get adminTaskCancelling => 'Cancelando...';

  @override
  String get adminTaskRunning => 'Executando...';

  @override
  String get adminTaskNeverRun => 'Nunca executada';

  @override
  String get adminTaskStop => 'Parar';

  @override
  String get adminTaskRun => 'Executar';

  @override
  String get adminTaskDetailLastExecution => 'Última Execução';

  @override
  String get adminTaskDetailStarted => 'Iniciada';

  @override
  String get adminTaskDetailEnded => 'Encerrada';

  @override
  String get adminTaskDetailDuration => 'Duração';

  @override
  String get adminTaskDetailErrorLabel => 'Erro:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Diariamente em $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Cada $day em $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Cada $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Na inicialização do aplicativo';

  @override
  String get adminTaskTriggerTypeDaily => 'Diário';

  @override
  String get adminTaskTriggerTypeWeekly => 'Semanal';

  @override
  String get adminTaskTriggerTypeInterval => 'Em um intervalo';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalo';

  @override
  String get adminTaskTriggerEveryHour => 'A cada hora';

  @override
  String get adminTaskTriggerEvery6Hours => 'A cada 6 horas';

  @override
  String get adminTaskTriggerEvery12Hours => 'A cada 12 horas';

  @override
  String get adminTaskTriggerEvery24Hours => 'A cada 24 horas';

  @override
  String get adminTaskTriggerEvery2Days => 'A cada 2 dias';

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
  String get adminTaskTriggerTime => 'Horário';

  @override
  String get adminTaskTriggerNoLimit => 'Sem limite';

  @override
  String get adminActivityJustNow => 'Agora mesmo';

  @override
  String get adminActivityLastHour => 'Última hora';

  @override
  String get adminActivityToday => 'Hoje';

  @override
  String get adminActivityYesterday => 'Ontem';

  @override
  String get adminActivityOlder => 'Mais antigos';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d atrás';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h atrás';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m atrás';
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
      'Configure a geração de imagens trickplay para miniaturas de pré-visualização ao buscar.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminNetworkingBaseUrl => 'URL Base';

  @override
  String get adminNetworkingBaseUrlHint => 'ex: /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Caminho do certificado';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filtro de IP Remoto';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtro de IP remoto';

  @override
  String get adminPlaybackVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automático';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Caminho temporário de transcodificação';

  @override
  String get adminPlaybackSegmentDeletion => 'Permitir exclusão de segmentos';

  @override
  String get adminPlaybackSegmentKeep => 'Manter segmento (segundos)';

  @override
  String get adminPlaybackThrottleBuffering => 'Limitar buffering';

  @override
  String get adminResumeMinPct => 'Porcentagem mínima de retomada';

  @override
  String get adminResumeMinPctSubtitle =>
      'O conteúdo deve ser reproduzido além desta porcentagem para salvar o progresso';

  @override
  String get adminResumeMaxPct => 'Porcentagem máxima de retomada';

  @override
  String get adminResumeMaxPctSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta porcentagem';

  @override
  String get adminResumeMinDuration => 'Duração mínima de retomada (segundos)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Itens mais curtos que isso não são retomáveis';

  @override
  String get adminTrickplayScanBehavior => 'Comportamento de escaneamento';

  @override
  String get adminTrickplayProcessPriority => 'Prioridade do processo';

  @override
  String get adminTrickplayTileWidth => 'Largura do mosaico';

  @override
  String get adminTrickplayTileHeight => 'Altura do mosaico';

  @override
  String get adminTrickplayProcessThreads => 'Threads de processo';

  @override
  String get adminTrickplayWidthResolutions => 'Resoluções de largura';

  @override
  String get adminMetadataDefault => 'Padrão';

  @override
  String get adminMetadataContentTypeUpdated => 'Tipo de conteúdo atualizado';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Falha ao atualizar o tipo de conteúdo: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Limite de resposta lenta (ms)';

  @override
  String get adminGeneralCachePath => 'Caminho do cache';

  @override
  String get adminGeneralMetadataPath => 'Caminho dos metadados';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminSettingsLoadFailed => 'Falha ao carregar configurações';

  @override
  String get adminDiscover => 'Descobrir';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Falha ao atualizar mapeamentos: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limite de tempo: $duration';
  }

  @override
  String get folders => 'Pastas';

  @override
  String get libraries => 'Bibliotecas';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay desativado';

  @override
  String get syncPlayDisabledMessage =>
      'Habilite SyncPlay em Configurações para usar a reprodução sincronizada.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Servidor não compatível';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay requer um servidor Jellyfin. O servidor atual não oferece suporte.';

  @override
  String get syncPlayGroupFallbackName => 'SyncPlay Grupo';

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
  String get syncPlayIgnoreWait => 'Ignorar espera';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Não segure o grupo enquanto este dispositivo armazena em buffer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continue localmente sem esperar por membros lentos';

  @override
  String get syncPlayRepeat => 'Repita';

  @override
  String get syncPlayRepeatOne => 'Um';

  @override
  String get syncPlayShuffleModeShuffled => 'Embaralhado';

  @override
  String get syncPlayShuffleModeSorted => 'Classificado';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronizar a fila de reprodução atual';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Substitua a fila do grupo pelo que está sendo reproduzido localmente';

  @override
  String get syncPlayLeaveGroup => 'Sair do grupo';

  @override
  String get syncPlayGroupQueue => 'Fila de grupo';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Jogue agora';

  @override
  String get syncPlayCreateNewGroup => 'Crie um novo grupo';

  @override
  String get syncPlayGroupName => 'Nome do grupo';

  @override
  String get syncPlayDefaultGroupName => 'Meu grupo SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Criar grupo';

  @override
  String get syncPlayAvailableGroups => 'Grupos disponíveis';

  @override
  String get syncPlayNoGroupsAvailable => 'Nenhum grupo disponível';

  @override
  String get syncPlayJoinGroupQuestion => 'Participar do grupo SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Participar de um grupo SyncPlay pode substituir sua fila de reprodução atual. Continuar?';

  @override
  String get syncPlayJoin => 'Juntar';

  @override
  String get syncPlayStateIdle => 'Parado';

  @override
  String get syncPlayStateWaiting => 'Esperando';

  @override
  String get syncPlayStatePaused => 'Pausado';

  @override
  String get syncPlayStatePlaying => 'Jogando';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName juntou-se ao grupo SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName saiu do grupo SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'SyncPlay acesso negado';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Você não tem acesso a um ou mais itens neste grupo SyncPlay. Peça ao proprietário do grupo para verificar as permissões da biblioteca ou escolha uma fila diferente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sincronizando a reprodução com $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'A pesquisa por voz não está disponível.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Dolby Vision Falha na reprodução direta';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'Falha ao iniciar a reprodução direta para este stream Dolby Vision. Tentar novamente usando a transcodificação do servidor?';

  @override
  String get retryWithTranscode => 'Tentar novamente com transcodificação';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision Não compatível';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Este dispositivo não pode decodificar conteúdo Dolby Vision diretamente. Use o substituto HDR10 ou solicite a transcodificação do servidor.';

  @override
  String get rememberMyChoice => 'Lembre-se da minha escolha';

  @override
  String get playHdr10Fallback => 'Reproduzir substituto HDR10';

  @override
  String get requestTranscode => 'Solicitar transcodificação';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Detecte linhas expostas pelo plugin \"Home Screen Sections\" do IAmParadox27. As linhas podem ser habilitadas e reordenadas abaixo.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Nenhum servidor Jellyfin reportando o plugin ainda.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Detecte linhas configuradas por meio do plugin \"KefinTweaks\" do ranaldsgift. Seções personalizadas, lançadas recentemente, assistidas novamente, sazonais e adicionadas recentemente na biblioteca são espelhadas da configuração KefinTweaks em cada servidor Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Nenhum servidor Jellyfin reportando KefinTweaks ainda.';

  @override
  String get integrationOpenHomeSections => 'Abrir seções iniciais';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Ativar, desativar e reordenar linhas';

  @override
  String get integrationInstalledButDisabled => 'Instalado, mas desativado';

  @override
  String get integrationNotInstalled => 'Não instalado';

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
  String get seeAll => 'Ver Tudo';

  @override
  String get noItems => 'Nenhum item';

  @override
  String get switchUser => 'Trocar Usuário';

  @override
  String get remoteControl => 'Controle Remoto';

  @override
  String get mediaBarLoading => 'Carregando barra de mídia...';

  @override
  String get mediaBarError => 'Falha ao carregar a barra de mídia';

  @override
  String get offlineServerUnavailable =>
      'Conectado à internet, mas o servidor atual está indisponível.';

  @override
  String get offlineNoInternet =>
      'Você está offline. Apenas conteúdo baixado está disponível.';

  @override
  String get offlineFileNotAvailable => 'Arquivo não disponível';

  @override
  String get offlineSwitchServer => 'Trocar Servidor';

  @override
  String get offlineSavedMedia => 'Mídia Salva';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Reprodução Remota';

  @override
  String castControlFailed(String error) {
    return 'Falha no controle de transmissão: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controles';
  }

  @override
  String get castDeviceVolume => 'Volume do Dispositivo';

  @override
  String get castVolumeUnavailable => 'Indisponível';

  @override
  String castStopKind(String kind) {
    return 'Pare $kind';
  }

  @override
  String get audioLabel => 'Áudio';

  @override
  String get subtitlesLabel => 'Legendas';

  @override
  String get pinConfirmTitle => 'Confirmar PIN';

  @override
  String get pinSetTitle => 'Definir PIN';

  @override
  String get pinEnterTitle => 'Digitar PIN';

  @override
  String get pinReenterToConfirm => 'Digite novamente o PIN para confirmar';

  @override
  String pinEnterNDigit(int length) {
    return 'Insira um PIN de $length dígitos';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Digite seu PIN de $length dígitos';
  }

  @override
  String get pinIncorrect => 'PIN incorreto';

  @override
  String get pinMismatch => 'Os PINs não coincidem';

  @override
  String get pinForgot => 'Esqueceu o PIN?';

  @override
  String get pinClear => 'Limpar';

  @override
  String get pinBackspace => 'Apagar';

  @override
  String get quickConnectAuthorized => 'Solicitação Quick Connect autorizada.';

  @override
  String get quickConnectInvalidOrExpired =>
      'O código Quick Connect é inválido ou expirou.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect não é suportado neste servidor.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Falha ao autorizar código Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect está desabilitado neste servidor.';

  @override
  String get quickConnectForbidden =>
      'Sua conta não pode autorizar esta solicitação Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Código Quick Connect não encontrado. Tente um novo código.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Falha na conexão rápida: $message';
  }

  @override
  String get quickConnectEnterCode => 'Digitar código';

  @override
  String get quickConnectAuthorize => 'Autorizar';

  @override
  String remoteCommandFailed(String error) {
    return 'Falha no comando: $error';
  }

  @override
  String get remoteControlTitle => 'Controle Remoto';

  @override
  String get remoteFailedToLoadSessions => 'Falha ao carregar sessões';

  @override
  String get remoteNoSessions => 'Nenhuma sessão controlável';

  @override
  String get remoteStartPlayback => 'Iniciar reprodução em outro dispositivo';

  @override
  String get unknownUser => 'Desconhecido';

  @override
  String get unknownItem => 'Desconhecido';

  @override
  String get remoteNothingPlaying => 'Nada reproduzindo nesta sessão';

  @override
  String get castingStarted =>
      'Transmissão iniciada no dispositivo selecionado';

  @override
  String castingFailed(String error) {
    return 'Falha ao iniciar a transmissão: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nenhum dispositivo de reprodução remota disponível.';

  @override
  String get noRemoteDevicesIos =>
      'Nenhum dispositivo de reprodução remota disponível.\n\nNo iOS, destinos AirPlay podem estar indisponíveis no simulador.';

  @override
  String get trackActionPlayNext => 'Reproduzir a Seguir';

  @override
  String get trackActionAddToQueue => 'Adicionar à Fila';

  @override
  String get trackActionAddToPlaylist => 'Adicionar à Playlist';

  @override
  String get trackActionCancelDownload => 'Cancelar Download';

  @override
  String get trackActionDeleteFromPlaylist => 'Excluir da Playlist';

  @override
  String get trackActionMoveUp => 'Mover para Cima';

  @override
  String get trackActionMoveDown => 'Mover para Baixo';

  @override
  String get trackActionRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get trackActionAddToFavorites => 'Adicionar aos Favoritos';

  @override
  String get trackActionGoToAlbum => 'Ir para o Álbum';

  @override
  String get trackActionGoToArtist => 'Ir para o Artista';

  @override
  String trackActionDownloading(String name) {
    return 'Baixando $name...';
  }

  @override
  String get trackActionDeletedFile => 'Arquivo baixado excluído';

  @override
  String get trackActionDeleteFileFailed =>
      'Não foi possível excluir o arquivo baixado';

  @override
  String get shuffleBy => 'Embaralhar Por';

  @override
  String get shuffleSelectLibrary => 'Selecionar Biblioteca';

  @override
  String get shuffleSelectGenre => 'Selecionar Gênero';

  @override
  String get shuffleLibrary => 'Biblioteca';

  @override
  String get shuffleGenre => 'Gênero';

  @override
  String get shuffleNoLibraries => 'Nenhuma biblioteca compatível disponível.';

  @override
  String get shuffleNoGenres =>
      'Nenhum gênero encontrado para este modo de embaralhamento.';

  @override
  String get posterDisplayTitle => 'Exibição';

  @override
  String get posterImageType => 'Tipo de Imagem';

  @override
  String get imageTypePoster => 'Pôster';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Bandeira';

  @override
  String get playlistAddFailed => 'Falha ao adicionar à playlist';

  @override
  String get playlistCreateFailed => 'Falha ao criar playlist';

  @override
  String get playlistNew => 'Nova Playlist';

  @override
  String get playlistCreate => 'Criar';

  @override
  String get playlistCreateNew => 'Criar Nova Playlist';

  @override
  String get playlistNoneFound => 'Nenhuma playlist encontrada';

  @override
  String get addToPlaylist => 'Adicionar à Playlist';

  @override
  String get lyricsNotAvailable => 'Nenhuma letra disponível';

  @override
  String get upNext => 'A Seguir';

  @override
  String get playNext => 'Reproduzir a Seguir';

  @override
  String get stillWatchingContent =>
      'A reprodução foi pausada. Você ainda está assistindo?';

  @override
  String get stillWatchingStop => 'Parar';

  @override
  String get stillWatchingContinue => 'Continuar';

  @override
  String skipSegment(String segment) {
    return 'Pular $segment';
  }

  @override
  String get liveTv => 'TV ao Vivo';

  @override
  String get continueWatchingAndNextUp => 'Continuar Assistindo e A Seguir';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Baixando $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Baixando $fileName';
  }

  @override
  String get nextEpisode => 'Próximo Episódio';

  @override
  String get moreFromThisSeason => 'Mais Desta Temporada';

  @override
  String get playerTooltipPlaybackSpeed => 'Velocidade de reprodução';

  @override
  String get playerTooltipCastControls => 'Controles de transmissão';

  @override
  String get playerTooltipPlaybackQuality => 'Taxa de bits';

  @override
  String get playerTooltipEnterFullscreen => 'Entrar em tela cheia';

  @override
  String get playerTooltipExitFullscreen => 'Sair da tela cheia';

  @override
  String get playerTooltipFloatOnTop => 'Flutuar no topo';

  @override
  String get playerTooltipExitFloatOnTop => 'Desativar flutuação no topo';

  @override
  String get playerTooltipLockLandscape => 'Bloquear paisagem';

  @override
  String get playerTooltipUnlockOrientation => 'Permitir rotação';

  @override
  String get playerTooltipPrevious => 'Anterior';

  @override
  String get playerTooltipSeekBack => 'Retroceder';

  @override
  String get playerTooltipSeekForward => 'Avançar';

  @override
  String get contextMenuMarkWatched => 'Marcar como assistido';

  @override
  String get contextMenuMarkUnwatched => 'Marcar como não assistido';

  @override
  String get contextMenuAddToFavorites => 'Adicionar aos favoritos';

  @override
  String get contextMenuRemoveFromFavorites => 'Remover dos favoritos';

  @override
  String get contextMenuGoToSeries => 'Ir para a série';

  @override
  String get settingsAdministrationSubtitle =>
      'Acesse o painel de administração do servidor';

  @override
  String get settingsAccountSecurity => 'Conta e segurança';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autenticação, código PIN e controle dos pais';

  @override
  String get settingsPersonalization => 'Personalização';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navegação, linhas iniciais e visibilidade da biblioteca';

  @override
  String get settingsDynamicContent => 'Conteúdo Dinâmico';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra de mídia e sobreposições visuais';

  @override
  String get settingsPlaybackSyncplay => 'Reprodução e SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Configurações de áudio/vídeo, legendas, downloads e controles SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sincronização de plug-ins, Seerr, classificações e muito mais';

  @override
  String get settingsAboutSubtitle =>
      'Versão do aplicativo, informações legais e créditos';

  @override
  String get settingsAuthenticationSection => 'AUTENTICAÇÃO';

  @override
  String get settingsSortServersBy => 'Classificar servidores por';

  @override
  String get settingsLastUsed => 'Último uso';

  @override
  String get settingsAlphabetical => 'Alfabético';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACIDADE E SEGURANÇA';

  @override
  String get settingsBlockedRatings => 'Avaliações bloqueadas';

  @override
  String get settingsGeneralStyle => 'Estilo Geral';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Acentos temáticos, cenários, indicadores assistidos e música temática';

  @override
  String get settingsHomePage => 'Página inicial';

  @override
  String get settingsHomePageSubtitle =>
      'Seções, tipos de imagens, sobreposições e visualizações de mídia';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilidade da biblioteca, visualização de pastas e comportamento multiservidor';

  @override
  String get settingsTwentyFourHourClock => 'Relógio de 24 horas';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Use a formatação de 24 horas sempre que o relógio for mostrado';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Mostrar o botão aleatório na barra de navegação';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Mostrar o botão de gêneros na barra de navegação';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Mostrar o botão de favoritos na barra de navegação';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostrar o botão de bibliotecas na barra de navegação';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicie Moonfin para que as alterações tenham efeito.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barra de mídia e visualizações locais';

  @override
  String get settingsVisualOverlays => 'Sobreposições visuais';

  @override
  String get settingsSeasonalSurprise => 'Surpresa sazonal';

  @override
  String get settingsMetadataAndRatings => 'Metadados e classificações';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase potencializa integrações do lado do servidor, incluindo fontes de classificação adicionais, solicitações Seerr e preferências sincronizadas.';

  @override
  String get settingsOfflineDownloads => 'Downloads off-line';

  @override
  String get settingsHigh => 'Alto';

  @override
  String get settingsLow => 'Baixo';

  @override
  String get settingsCustomPath => 'Caminho personalizado';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Digite o caminho da pasta de download';

  @override
  String get settingsConcurrentDownloads => 'Downloads simultâneos';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Número máximo de itens para download de uma vez.';

  @override
  String get settingsAppInfo => 'INFORMAÇÕES DO APLICATIVO';

  @override
  String get settingsReportAnIssue => 'Informar um problema';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Abra o rastreador de problemas em GitHub';

  @override
  String get settingsJoinDiscord => 'Junte-se a Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Converse com a comunidade';

  @override
  String get settingsJoinTheDiscord => 'Participe do Discord';

  @override
  String get settingsSupportMoonfin => 'Suporte Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Doe um café para o desenvolvedor';

  @override
  String get settingsLegal => 'JURÍDICO';

  @override
  String get settingsLicenses => 'Licenças';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avisos de licença de código aberto';

  @override
  String get settingsPrivacyPolicy => 'política de Privacidade';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Como Moonfin lida com seus dados';

  @override
  String get settingsCheckForUpdates => 'Verifique se há atualizações';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Verifique a versão mais recente de Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Desenvolvido por Flutter';

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
      'Filtro de tipo de conteúdo aleatório';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferências de reprodução de vídeo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Mecanismo de vídeo principal e configurações de qualidade de streaming';

  @override
  String get settingsAudioPreferences => 'Preferências de áudio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Faixas de áudio, processamento e opções de passagem';

  @override
  String get settingsAutomationAndQueue => 'Automação e fila';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Reprodução e sequenciamento automatizados';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Qualidade de download, limites de armazenamento e tamanho da fila';

  @override
  String get settingsSyncplaySubtitle =>
      'Lógica de sincronização para sessões de grupo';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Recursos especializados do jogador. Use com cuidado, pois algumas opções podem causar problemas de reprodução';

  @override
  String get settingsSkipIntrosAndOutros => 'Pular introduções e outros?';

  @override
  String get settingsPromptUser => 'Solicitar ao usuário';

  @override
  String get settingsSkip => 'Pular';

  @override
  String get settingsDoNothing => 'Não faça nada';

  @override
  String get settingsMaxBitrateDescription =>
      'Limite a taxa de bits do streaming. O conteúdo acima desse limite será transcodificado para caber.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limite a resolução máxima que o player irá solicitar. O conteúdo de resolução mais alta será transcodificado.';

  @override
  String get settingsPlayerZoomDescription =>
      'Como o vídeo deve ser dimensionado para caber na tela.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Mecanismo de reprodução (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Escolha o mecanismo de reprodução padrão em dispositivos Android TV. As alterações se aplicam à próxima sessão de reprodução.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recomendado)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legado)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (legado)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recomendado)';

  @override
  String get settingsDolbyVisionFallback => 'Dolby Vision substituto';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportamento para títulos Dolby Vision em dispositivos sem decodificação Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Pergunte sempre';

  @override
  String get settingsPreferHdr10Fallback => 'Prefira o substituto HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Prefira a transcodificação do servidor';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Perfil 7 Jogo direto';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controla se os fluxos da camada de aprimoramento do perfil Dolby Vision 7 devem direcionar a reprodução.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automático (AFTKRT habilitado)';

  @override
  String get settingsEnabledOnThisDevice => 'Ativado neste dispositivo';

  @override
  String get settingsDisabledPreferTranscode =>
      'Desativado (prefira transcodificação)';

  @override
  String get settingsResumeRewindDescription =>
      'Ao retomar a reprodução (a partir de Continuar assistindo ou de uma página de item de mídia), quantos segundos devem ser retrocedidos?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Ao retomar a reprodução após pressionar o botão de pausa, quantos segundos devem ser retrocedidos?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Quantos segundos para voltar depois de pressionar o botão de retrocesso.';

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
      'Quantos segundos para avançar depois de pressionar o botão de avanço rápido.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 para decodificador externo';

  @override
  String get settingsCinemaMode => 'Modo Cinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Reproduza trailers/prerolls antes de um filme principal';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended mostra um cartão completo com a arte e a descrição do episódio. Mínimo mostra uma sobreposição compacta de contagem regressiva. Desativado oculta totalmente o prompt.';

  @override
  String get settingsShort => 'Curto';

  @override
  String get settingsLong => 'Longo';

  @override
  String get settingsVeryLong => 'Muito Longo';

  @override
  String get settingsVideoStartDelay => 'Atraso no início do vídeo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV ao vivo direto';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Ative a reprodução direta para TV ao vivo';

  @override
  String get settingsOpenGroups => 'Grupos abertos';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Crie, participe ou gerencie SyncPlay grupos';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay Ativado';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Habilite recursos de observação em grupo';

  @override
  String get settingsSyncplayButton => 'Botão SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostrar o botão SyncPlay na barra de navegação';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correção Avançada';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Habilitar lógica de sincronização refinada';

  @override
  String get settingsSyncplaySyncCorrection => 'Correção de sincronização';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Ajuste automaticamente a reprodução para permanecer sincronizado';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocidade para sincronizar';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Use o ajuste da velocidade de reprodução para sincronizar';

  @override
  String get settingsSyncplaySkipToSync => 'Pular para sincronizar';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Use a busca para sincronizar';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Atraso mínimo de velocidade';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Atraso de velocidade máxima';

  @override
  String get settingsSyncplaySpeedDuration => 'Duração da velocidade';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Atraso mínimo para ignorar';

  @override
  String get settingsSyncplayExtraOffset => 'SyncPlay Compensação Extra';

  @override
  String get onNow => 'Ativado agora';

  @override
  String get collections => 'Coleções';

  @override
  String get lastPlayed => 'Jogado pela última vez';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Último $libraryName';
  }

  @override
  String get autoplayNextEpisode =>
      'Reproduzir automaticamente o próximo episódio';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Reproduza automaticamente o próximo episódio quando disponível.';

  @override
  String get skipSilenceTitle => 'Pular silêncio';

  @override
  String get skipSilenceSubtitle =>
      'Ignora automaticamente segmentos de áudio silenciosos quando suportado pelo stream.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Permitir efeitos de áudio externos';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permitir que aplicativos de equalizador e efeitos (por exemplo, Wavelet) sejam anexados às sessões de reprodução Media3.';

  @override
  String get disableTunnelingTitle => 'Desabilitar tunelamento';

  @override
  String get disableTunnelingSubtitle =>
      'Forçar a reprodução sem tunelamento. Útil em dispositivos com descontinuidades de áudio/vídeo de tunelamento.';

  @override
  String get mapDolbyVisionP7Title => 'Mapear Dolby Vision perfil 7 para HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Reproduza fluxos de perfil Dolby Vision 7 como HEVC compatível com HDR10 em dispositivos não DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Use estilos de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Aplique cores, fontes e posicionamento incorporados na faixa de legenda. Desative para usar suas preferências de estilo de legenda.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Use tamanhos de fonte de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Aplique dicas de tamanho de fonte incorporadas na faixa de legenda. Desative o uso do tamanho da legenda em suas preferências de estilo.';

  @override
  String get useDetailedSubHeadings => 'Use subtítulos detalhados';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Mostrar sub-rows detalhado ou mínimo nas páginas da Biblioteca.';

  @override
  String get savedThemesDeleteDialogTitle => 'Excluir tema salvo?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remover \"$themeName\" do cache deste dispositivo?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Excluído \"$themeName\" deste dispositivo.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Não foi possível excluir \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Temas salvos';

  @override
  String get savedThemesDescription =>
      'Estes são temas baixados do plugin Moonfin para o servidor atual. A exclusão remove apenas esta cópia local.';

  @override
  String get savedThemesEmpty =>
      'Nenhum tema salvo foi encontrado para este servidor.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Atualmente ativo';
  }

  @override
  String get savedThemesDeleteTooltip => 'Excluir tema salvo';

  @override
  String get savedThemesManageSubtitle =>
      'Gerenciar temas de plug-ins baixados neste dispositivo';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Seções da tela inicial';

  @override
  String get themeEditor => 'Editor de Tema';

  @override
  String get themeEditorSubtitle =>
      'Abra o Editor de Tema Moonfin em seu navegador';

  @override
  String get homeScreen => 'Tela inicial';

  @override
  String get bottomBar => 'Barra inferior';

  @override
  String get homeRowsStyleClassic => 'Clássico';

  @override
  String get homeRowsStyleModern => 'Moderno';

  @override
  String get homeRowsSection => 'Linhas iniciais';

  @override
  String get rowsType => 'Tipo de linhas';

  @override
  String get rowsTypeDescription =>
      'Classic mantém o tipo de imagem por linha e a sobreposição de informações. Moderno usa linhas do retrato ao pano de fundo.';

  @override
  String get displayFavoritesRows => 'Exibir linhas de favoritos';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Mostre filmes, séries favoritos e outras linhas favoritas nas seções iniciais.';

  @override
  String get favoritesRowSorting => 'Classificação de linhas de favoritos';

  @override
  String get favoritesRowSortingDescription =>
      'Classifique as linhas de Favoritos por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get displayCollectionsRows => 'Exibir linhas de coleções';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Mostrar linhas de coleções nas seções iniciais.';

  @override
  String get collectionsRowSorting => 'Classificação de linhas de coleções';

  @override
  String get collectionsRowSortingDescription =>
      'Classifique as linhas das coleções por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get displayGenresRows => 'Exibir linhas de gêneros';

  @override
  String get displayGenresRowsSubtitle =>
      'Mostrar linhas de gêneros nas seções iniciais.';

  @override
  String get genresRowSorting => 'Classificação de linha de gêneros';

  @override
  String get genresRowSortingDescription =>
      'Classifique as linhas de gêneros por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get genresRowItems => 'Itens de linha de gêneros';

  @override
  String get genresRowItemsDescription =>
      'Mostre filmes, séries ou ambos nas linhas de gêneros.';

  @override
  String get appearance => 'Aparência';

  @override
  String get cardSize => 'Tamanho do cartão';

  @override
  String get externalPlayerApp => 'Aplicativo de player externo';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Mostrar seletor de aplicativos quando a reprodução começar.';

  @override
  String get loadingInstalledPlayers => 'Carregando players instalados...';

  @override
  String get connection => 'Conexão';

  @override
  String get audioTranscodeTarget => 'Alvo de transcodificação de áudio';

  @override
  String get passthrough => 'Passagem';

  @override
  String get supportedOnThisDevice => 'Compatível com este dispositivo';

  @override
  String get notSupportedOnThisDevice => 'Não compatível com este dispositivo';

  @override
  String get settingsAudioDtsXPassthrough => 'Passagem DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) para decodificador externo.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Passagem TrueHD com Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Comportamento do reprodutor de mídia';

  @override
  String get playbackEnhancements => 'Melhorias de reprodução';

  @override
  String get alwaysOn => 'Sempre ligado.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Substitua Pular outro pela exibição seguinte';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Mostre a sobreposição Next Up em vez do botão Pular Outro.';

  @override
  String get playerRouting => 'Roteamento de Jogador';

  @override
  String get preferSoftwareDecoders => 'Prefira decodificadores de software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Use FFmpeg (áudio) e libgav1 (AV1) antes dos decodificadores de hardware. Desative se a passagem de áudio HDMI for interrompida.';

  @override
  String get useExternalPlayer => 'Usar reprodutor externo';

  @override
  String get useExternalPlayerSubtitle =>
      'Abra a reprodução de vídeo no aplicativo externo selecionado na Android TV.';

  @override
  String get automaticQueuing => 'Enfileiramento Automático';

  @override
  String get preferSdhSubtitles => 'Prefira legendas SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorize faixas de legenda SDH/CC ao selecionar automaticamente.';

  @override
  String get webDiagnostics => 'Diagnóstico da Web';

  @override
  String get webDiagnosticsTitle => 'Moonfin Diagnóstico da Web';

  @override
  String get webDiagnosticsIntro =>
      'Use esta página para diagnosticar problemas de conectividade do navegador (CORS, conteúdo misto e configurações de descoberta).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Falha de conteúdo misto detectada';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Falha de CORS/Preflight detectada';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detectou uma página HTTPS tentando chamar um URL de servidor HTTP. Os navegadores bloqueiam essa solicitação antes que ela chegue ao seu servidor.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detectou uma falha de solicitação no nível do navegador que geralmente é causada pela falta de CORS ou cabeçalhos de simulação no servidor de mídia.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL de destino: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalhe: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Contexto de tempo de execução atual';

  @override
  String get webDiagnosticsOrigin => 'Origem';

  @override
  String get webDiagnosticsScheme => 'Esquema';

  @override
  String get webDiagnosticsPluginMode => 'Modo Plug-in';

  @override
  String get webDiagnosticsWebRtcScan => 'Verificação WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL do servidor forçado';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL do servidor padrão';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL do proxy de descoberta';

  @override
  String get notConfigured => 'não configurado';

  @override
  String get webDiagnosticsMixedContent => 'Conteúdo Misto';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Esta página é carregada por HTTPS, mas um ou mais URLs configurados são HTTP. Os navegadores impedem que páginas HTTPS chamem APIs HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Correção: sirva seu servidor de mídia ou endpoint de proxy via HTTPS ou carregue Moonfin por HTTP apenas em redes locais confiáveis.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nenhuma configuração óbvia de conteúdo misto detectada nas configurações de tempo de execução atuais.';

  @override
  String get webDiagnosticsCorsChecklist => 'Lista de verificação do CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permitir a origem do navegador em Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Incluir autorização, X-Emby-Authorization e X-Emby-Token em Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expor Content-Range e Accept-Ranges para streaming e comportamento de busca.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Retornar 204 para solicitações de comprovação de OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemplo de snippet de cabeçalho (estilo nginx)';

  @override
  String get note => 'Observação';

  @override
  String get webDiagnosticsNonWebNote =>
      'Esta rota de diagnóstico destina-se a compilações web. Se você estiver vendo isso em outra plataforma, essas verificações podem não se aplicar.';

  @override
  String get backToServerSelect => 'Voltar para seleção de servidor';

  @override
  String get signOutAllUsers => 'Desconectar todos os usuários';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'A permissão do microfone foi negada permanentemente. Habilite-o nas configurações do sistema.';

  @override
  String get voiceSearchPermissionRequired =>
      'A permissão do microfone é necessária para pesquisa por voz.';

  @override
  String get voiceSearchNoMatch => 'Não entendi isso. Tente novamente.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nenhuma fala detectada.';

  @override
  String get voiceSearchMicrophoneError => 'Erro no microfone.';

  @override
  String get voiceSearchNeedsInternet =>
      'A pesquisa por voz precisa de internet.';

  @override
  String get voiceSearchServiceBusy =>
      'O serviço de voz está ocupado. Tente novamente.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'A permissão do microfone foi negada permanentemente.';

  @override
  String get microphonePermissionDenied =>
      'A permissão do microfone foi negada.';

  @override
  String get speechRecognitionUnavailable =>
      'O reconhecimento de fala não está disponível neste dispositivo.';

  @override
  String get openIosRoutePicker => 'Abra o seletor de rota do iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay o seletor de rota não está disponível neste dispositivo.';

  @override
  String get videos => 'Vídeos';

  @override
  String get trailers => 'Reboques';

  @override
  String get programs => 'Programas';

  @override
  String get songs => 'Músicas';

  @override
  String get photoAlbums => 'Álbuns de fotos';

  @override
  String get photos => 'Fotos';

  @override
  String get people => 'Pessoas';

  @override
  String get recentlyReleasedEpisodes => 'Episódios lançados recentemente';

  @override
  String get watchAgain => 'Assistir novamente';

  @override
  String get guestAppearances => 'Participações de convidados';

  @override
  String get appearancesSeerr => 'Aparições (Seerr)';

  @override
  String get watchWithGroup => 'Assista com grupo';

  @override
  String get errors => 'Erros';

  @override
  String get warnings => 'Avisos';

  @override
  String get disk => 'Disco';

  @override
  String get openInBrowser => 'Abrir no navegador';

  @override
  String get embeddedBrowserNotAvailable =>
      'O navegador incorporado não está disponível nesta plataforma.';

  @override
  String get adminRestartServerConfirmation =>
      'Tem certeza de que deseja reiniciar o servidor?';

  @override
  String get adminShutdownServerConfirmation =>
      'Tem certeza de que deseja encerrar o servidor? Você precisará reiniciá-lo manualmente.';

  @override
  String get internal => 'Interno';

  @override
  String get idle => 'Parado';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nenhum usuário encontrado';

  @override
  String get adminNoUsersMatchSearch =>
      'Nenhum usuário corresponde à sua pesquisa';

  @override
  String get adminNoDevicesFound => 'Nenhum dispositivo encontrado';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nenhum dispositivo corresponde aos filtros atuais';

  @override
  String get passwordSet => 'Conjunto de senha';

  @override
  String get noPasswordConfigured => 'Nenhuma senha configurada';

  @override
  String get remoteAccess => 'Acesso remoto';

  @override
  String get localOnly => 'Somente locais';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Falha ao carregar análise de mídia';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Análises combinadas em todas as bibliotecas de mídia.';

  @override
  String get analyticsTopArtists => 'Principais artistas';

  @override
  String get analyticsTopAuthors => 'Principais autores';

  @override
  String get analyticsTopContributors => 'Principais colaboradores';

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
      'Nenhum total de mídia indexada está disponível para esta seleção ainda.';

  @override
  String get analyticsLibraryDetails => 'Detalhes da biblioteca';

  @override
  String get analyticsLibraryBreakdown => 'Divisão da Biblioteca';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Nenhuma biblioteca está disponível.';

  @override
  String get adminServerAdministrationTitle => 'Administração de Servidor';

  @override
  String get adminServerPathData => 'Dados';

  @override
  String get adminServerPathImageCache => 'Cache de imagens';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Registros';

  @override
  String get adminServerPathMetadata => 'Metadados';

  @override
  String get adminServerPathTranscode => 'Transcodificar';

  @override
  String get adminServerPathWeb => 'Rede';

  @override
  String get adminNoServerPathsReturned =>
      'Nenhum caminho de servidor retornado por este servidor.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% usado';
  }

  @override
  String get userActivity => 'Atividade do usuário';

  @override
  String get systemEvents => 'Eventos do sistema';

  @override
  String get needsAttention => 'Precisa de atenção';

  @override
  String get adminDrawerSectionServer => 'Servidor';

  @override
  String get adminDrawerSectionPlayback => 'Reprodução';

  @override
  String get adminDrawerSectionDevices => 'Dispositivos';

  @override
  String get adminDrawerSectionAdvanced => 'Avançado';

  @override
  String get adminDrawerSectionPlugins => 'Plug-ins';

  @override
  String get adminDrawerSectionLiveTv => 'TV ao vivo';

  @override
  String get homeVideos => 'Vídeos caseiros';

  @override
  String get mixedContent => 'Conteúdo Misto';

  @override
  String get homeVideosAndPhotos => 'Vídeos e fotos caseiras';

  @override
  String get mixedMoviesAndShows => 'Filmes e programas mistos';

  @override
  String get intelQuickSync => 'Sincronização rápida Intel';

  @override
  String get rockchipMpp => 'MPP Rockchip';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nenhuma gravação encontrada';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Nenhuma página de imagem encontrada no arquivo .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Falha no renderizador incorporado ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Falha no renderizador EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Arquivo local ausente para leitor: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status ao abrir dados do livro de $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nenhum endpoint de livro legível disponível';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Formato de arquivo de quadrinhos não suportado: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'O plugin de extração CBR não está disponível nesta plataforma.';

  @override
  String get failedToExtractCbrArchive => 'Falha ao extrair o arquivo .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'A extração CB7 não está disponível nesta plataforma.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'O plugin de extração CB7 não está disponível nesta plataforma.';

  @override
  String get closeGenrePanel => 'Fechar painel de gênero';

  @override
  String get loadingShuffle => 'Carregando ordem aleatória...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Troca automática de HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Ative automaticamente o HDR para reprodução de vídeo HDR e restaure o modo de exibição ao sair.';

  @override
  String get whenFullscreen => 'Quando em tela cheia';

  @override
  String get transcodingLimits => 'Limites de transcodificação';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Barbatana Lunar';

  @override
  String get signIn => 'Entrar';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Conexão rápida';

  @override
  String get password => 'Senha';

  @override
  String get username => 'Nome de usuário';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Insira este código no painel web do seu servidor:';

  @override
  String get waitingForAuthorization => 'Aguardando autorização...';

  @override
  String get back => 'Voltar';

  @override
  String get serverUnavailable => 'O servidor não está disponível';

  @override
  String get loginFailed => 'falha no login';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Quem está assistindo?';

  @override
  String get addUser => 'Adicionar usuário';

  @override
  String get selectServer => 'Selecione Servidor';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Servidores salvos';

  @override
  String get discoveredServers => 'Servidores descobertos';

  @override
  String get noneFound => 'Nenhum encontrado';

  @override
  String get unableToConnectToServer => 'Não foi possível conectar ao servidor';

  @override
  String get addServer => 'Adicionar servidor';

  @override
  String get embyConnect => 'Emby Conectar';

  @override
  String get removeServer => 'Remover servidor';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Remover';

  @override
  String get connectToServer => 'Conecte-se ao servidor';

  @override
  String get serverAddress => 'Endereço do servidor';

  @override
  String get serverAddressHint => 'https://seu-servidor.exemplo.com';

  @override
  String get connect => 'Conectar';

  @override
  String get secureStorageUnavailable => 'Armazenamento seguro indisponível';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin não conseguiu acessar o chaveiro do seu sistema. O login pode continuar, mas o armazenamento seguro de tokens pode ficar indisponível até que o chaveiro seja desbloqueado.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema do aplicativo';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alterne entre Moonfin e Neon Pulse sem reiniciar o aplicativo';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Barbatana Lunar';

  @override
  String get themeMoonfinSubtitle =>
      'Look atual do Moonfin que todos vocês adoraram';

  @override
  String get themeNeonPulse => 'Pulso de néon';

  @override
  String get themeNeonPulseSubtitle =>
      'Estilo Synthwave com brilho magenta, texto ciano e contraste cromado mais forte';

  @override
  String get embyConnectSignInSubtitle =>
      'Faça login com sua conta Emby Connect';

  @override
  String get emailOrUsername => 'E-mail ou nome de usuário';

  @override
  String get selectAServer => 'Selecione um servidor';

  @override
  String get tryAgain => 'Tente novamente';

  @override
  String get noLinkedServers =>
      'Nenhum servidor vinculado a esta conta Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Credenciais Emby Connect inválidas';

  @override
  String get invalidEmbyConnectLogin =>
      'Nome de usuário ou senha do Emby Connect inválidos';

  @override
  String get embyConnectExchangeNotSupported =>
      'O servidor não suporta troca Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Erro de rede ao entrar em contato com o Emby Connect ou o servidor selecionado';

  @override
  String get loadingLinkedServers => 'Carregando servidores vinculados...';

  @override
  String get connectingToServerEllipsis => 'Conectando ao servidor...';

  @override
  String get noReachableAddress => 'Nenhum endereço acessível fornecido';

  @override
  String get invalidServerExchangeResponse =>
      'Resposta inválida do endpoint de troca do servidor';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Sair do Moonfin?';

  @override
  String get exitAppConfirmation => 'Tem certeza de que deseja sair?';

  @override
  String get exit => 'Saída';

  @override
  String get noHomeRowsLoaded => 'Nenhuma linha inicial pôde ser carregada';

  @override
  String get noHomeRowsHint =>
      'Tente atualizar ou reduzir as seções iniciais ativas.';

  @override
  String get retryHomeRows => 'Tentar novamente as linhas iniciais';

  @override
  String get guide => 'Guia';

  @override
  String get recordings => 'Gravações';

  @override
  String get schedule => 'Agendar';

  @override
  String get series => 'Série';

  @override
  String get noItemsFound => 'Nenhum item encontrado';

  @override
  String get home => 'Lar';

  @override
  String get browseAll => 'Navegar por tudo';

  @override
  String get genres => 'Gêneros';

  @override
  String get collectionPlaceholder => 'Os itens da coleção aparecerão aqui';

  @override
  String get browseByLetter => 'Navegar por letra';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'A navegação alfabética aparecerá aqui';

  @override
  String get suggestions => 'Sugestões';

  @override
  String get suggestionsPlaceholder => 'Itens sugeridos aparecerão aqui';

  @override
  String get failedToLoadLibraries => 'Falha ao carregar bibliotecas';

  @override
  String get noLibrariesFound => 'Nenhuma biblioteca encontrada';

  @override
  String get library => 'Biblioteca';

  @override
  String get displaySettings => 'Configurações de exibição';

  @override
  String get allGenres => 'Todos os gêneros';

  @override
  String get noGenresFound => 'Nenhum gênero encontrado';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Esta pasta está vazia';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Falha ao carregar favoritos';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get noFavoritesYet => 'Ainda não há favoritos';

  @override
  String get favorites => 'Favoritos';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'Continuando';

  @override
  String get ended => 'Terminou';

  @override
  String get sortAndFilter => 'Classificar e filtrar';

  @override
  String get type => 'Tipo';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get display => 'Mostrar';

  @override
  String get imageType => 'Tipo de imagem';

  @override
  String get posterSize => 'Tamanho do pôster';

  @override
  String get small => 'Pequeno';

  @override
  String get medium => 'Médio';

  @override
  String get large => 'Grande';

  @override
  String get extraLarge => 'Extra Grande';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Visualizações';

  @override
  String get albums => 'Álbuns';

  @override
  String get albumArtists => 'Artistas do álbum';

  @override
  String get artists => 'Artistas';

  @override
  String get bookmarks => 'Favoritos';

  @override
  String get noSavedBookmarks =>
      'Ainda não há marcadores salvos para este título.';

  @override
  String get openBook => 'Livro aberto';

  @override
  String get chapter => 'Capítulo';

  @override
  String get page => 'Página';

  @override
  String get bookmark => 'Marcador';

  @override
  String get justNow => 'Agora mesmo';

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
  String get discoverySubjects => 'Assuntos de descoberta';

  @override
  String get pickDiscoverySubjects =>
      'Escolha quais feeds de assuntos serão exibidos no Discover.';

  @override
  String get apply => 'Aplicar';

  @override
  String get openLink => 'Abrir link';

  @override
  String get scanWithYourPhone => 'Digitalize com seu telefone';

  @override
  String get audiobookGenres => 'Gêneros de audiolivros';

  @override
  String get pickAudiobookGenres =>
      'Escolha quais gêneros mostrar no Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Descubra audiolivros';

  @override
  String get librivoxDescription =>
      'Títulos populares de domínio público do LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Role para a esquerda';

  @override
  String get scrollRight => 'Role para a direita';

  @override
  String get couldNotLoadGenre =>
      'Não foi possível carregar este gênero no momento.';

  @override
  String get continueReading => 'Continuar lendo';

  @override
  String get savedHighlights => 'Destaques salvos';

  @override
  String get continueListening => 'Continuar ouvindo';

  @override
  String get listen => 'Ouvir';

  @override
  String get resume => 'Retomar';

  @override
  String get failedToLoadLibrary => 'Falha ao carregar a biblioteca';

  @override
  String get popularNow => 'Popular agora';

  @override
  String get savedForLater => 'Salvo para mais tarde';

  @override
  String get topListens => 'Principais escutas';

  @override
  String get unreadDiscoveries => 'Descobertas não lidas';

  @override
  String get pickUpAgain => 'Pegue novamente';

  @override
  String get bookHighlightsDescription =>
      'Seus livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get handPickedFromLibrary => 'Escolhido a dedo em sua biblioteca.';

  @override
  String get handPickedFromListeningQueue =>
      'Escolhido a dedo na sua fila de escuta.';

  @override
  String get booksWithHighlights =>
      'Livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get jumpBackNarration =>
      'Volte para a narração sem procurar seu lugar.';

  @override
  String get unreadBooksReady =>
      'Livros não lidos prontos para a próxima hora tranquila.';

  @override
  String get quickAccessFavorites =>
      'Acesso rápido aos livros que você sempre consulta.';

  @override
  String get searchAudiobooks => 'Pesquisar audiolivros';

  @override
  String get searchYourLibrary => 'Pesquise na sua biblioteca';

  @override
  String get pickUpStory => 'Continue a história de onde você parou';

  @override
  String get savedPlacesChapters =>
      'Seus lugares salvos e capítulos inacabados';

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
  String get readyWhenYouAre => 'Pronto quando você estiver';

  @override
  String get details => 'Detalhes';

  @override
  String get listeningRoom => 'Sala de escuta';

  @override
  String get bookmarksAndProgress => 'Marcadores e progresso';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
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
  String get browseByGenre => 'Navegar por gênero';

  @override
  String get discover => 'Descobrir';

  @override
  String get trendingTitlesOpenLibrary =>
      'Títulos populares por assunto da Open Library.';

  @override
  String get noBookmarkedItems => 'Ainda não há itens marcados como favoritos';

  @override
  String get nothingMatchesSection =>
      'Nada corresponde a esta seção ainda. Tente outra guia ou volte após o término da sincronização da biblioteca.';

  @override
  String get audiobooks => 'Audiolivros';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Pasta';

  @override
  String get filters => 'Filtros';

  @override
  String get readingStatus => 'Status de leitura';

  @override
  String get playedStatus => 'Status jogado';

  @override
  String get readStatus => 'Ler';

  @override
  String get watched => 'Assistido';

  @override
  String get unread => 'Não lido';

  @override
  String get unwatched => 'Não assistido';

  @override
  String get seriesStatus => 'Status da série';

  @override
  String get allLibraries => 'Todas as bibliotecas';

  @override
  String get books => 'Livros';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Autor desconhecido';

  @override
  String get uncategorized => 'Sem categoria';

  @override
  String get overview => 'Visão geral';

  @override
  String get noLibrivoxDescription =>
      'Nenhuma descrição fornecida pelo LibriVox para este título ainda.';

  @override
  String get readers => 'Leitores';

  @override
  String get openLinks => 'Links abertos';

  @override
  String get librivoxPage => 'Página LibriVox';

  @override
  String get internetArchive => 'Arquivo da Internet';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Baixar Zip';

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
      'Nenhuma visão geral disponível na Open Library para este título ainda.';

  @override
  String get subjects => 'Assuntos';

  @override
  String get all => 'Todos';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Não foi possível carregar este assunto agora.';

  @override
  String get audiobookDetails => 'Detalhes do audiolivro';

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
  String get trackList => 'Lista de faixas';

  @override
  String get itemListPlaceholder => 'A lista de itens aparecerá aqui';

  @override
  String get favoriteTracksPlaceholder => 'As faixas favoritas aparecerão aqui';

  @override
  String get failedToLoad => 'Falha ao carregar';

  @override
  String get delete => 'Excluir';

  @override
  String get save => 'Salvar';

  @override
  String get moreLikeThis => 'Mais como este';

  @override
  String get castAndCrew => 'Elenco e equipe';

  @override
  String get collection => 'Coleção';

  @override
  String get episodes => 'Episódios';

  @override
  String get nextUp => 'Próximo';

  @override
  String get seasons => 'Temporadas';

  @override
  String get chapters => 'Capítulos';

  @override
  String get features => 'Características';

  @override
  String get movies => 'Filmes';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Outro';

  @override
  String get discography => 'Discografia';

  @override
  String get similarArtists => 'Artistas semelhantes';

  @override
  String get tableOfContents => 'Índice';

  @override
  String get tracklist => 'Lista de faixas';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'Detalhes do autor';

  @override
  String get noOverviewAvailable =>
      'Nenhuma visão geral disponível para este título ainda.';

  @override
  String get noBiographyAvailable =>
      'Nenhuma biografia disponível para este autor.';

  @override
  String get noBooksFound => 'Nenhum livro encontrado deste autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'Não é possível carregar os detalhes do autor no momento.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Data de publicação desconhecida';

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
  String get view => 'Visualizar';

  @override
  String get resumeReading => 'Retomar leitura';

  @override
  String get read => 'Ler';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Jogar';

  @override
  String get startOver => 'Recomeçar';

  @override
  String get restart => 'Reiniciar';

  @override
  String get readOffline => 'Ler off-line';

  @override
  String get playOffline => 'Jogue off-line';

  @override
  String get audio => 'Áudio';

  @override
  String get subtitles => 'Legendas';

  @override
  String get version => 'Versão';

  @override
  String get cast => 'Elenco';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Finalizado';

  @override
  String get favorited => 'Favorito';

  @override
  String get favorite => 'Favorito';

  @override
  String get playlist => 'Lista de reprodução';

  @override
  String get downloaded => 'Baixado';

  @override
  String get downloadAll => 'Baixar tudo';

  @override
  String get download => 'Download';

  @override
  String get deleteDownloaded => 'Excluir baixado';

  @override
  String get goToSeries => 'Ir para a série';

  @override
  String get editMetadata => 'Editar metadados';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Mais';

  @override
  String get deleteItem => 'Excluir item';

  @override
  String get deletePlaylist => 'Excluir lista de reprodução';

  @override
  String get deletePlaylistMessage => 'Excluir esta playlist do servidor?';

  @override
  String get deleteItemMessage => 'Excluir este item do servidor?';

  @override
  String get failedToDeletePlaylist => 'Falha ao excluir a playlist';

  @override
  String get failedToDeleteItem => 'Falha ao excluir item';

  @override
  String get renamePlaylist => 'Renomear lista de reprodução';

  @override
  String get playlistName => 'Nome da lista de reprodução';

  @override
  String get deleteDownloadedAlbum => 'Excluir álbum baixado';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Faixas baixadas excluídas';

  @override
  String get downloadedTracksDeleteFailed =>
      'Algumas faixas baixadas não puderam ser excluídas';

  @override
  String get noTracksLoaded => 'Nenhuma faixa carregada';

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
  String get itemDeleted => 'Item excluído';

  @override
  String get noPlayableTrailerFound => 'Nenhum trailer jogável encontrado.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Faixa de áudio';

  @override
  String get subtitleTrack => 'Faixa de legenda';

  @override
  String get none => 'Nenhum';

  @override
  String get downloadSubtitlesLabel => 'Baixar legendas...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Pesquise usando o plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Baixar legendas';

  @override
  String get selectedSubtitleInvalid => 'A legenda selecionada é inválida.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Legenda baixada. Pode demorar um pouco para aparecer enquanto o Jellyfin atualiza o item.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Selecione a versão';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Baixe tudo - qualidade';

  @override
  String get downloadQuality => 'Qualidade de download';

  @override
  String get originalFileNoReencoding => 'Arquivo original, sem recodificação';

  @override
  String get originalFilesNoReencoding =>
      'Arquivos originais, sem recodificação';

  @override
  String get noEpisodesLoaded => 'Nenhum episódio carregado';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Excluir arquivos baixados';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Arquivos baixados excluídos';

  @override
  String get failedToDeleteFiles => 'Falha ao excluir arquivos';

  @override
  String get deleteFiles => 'Excluir arquivos';

  @override
  String get director => 'DIRETOR';

  @override
  String get writers => 'ESCRITORES';

  @override
  String get studio => 'ESTÚDIO';

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
  String get showLess => 'Mostrar menos';

  @override
  String get readMore => 'Leia mais';

  @override
  String get shuffle => 'Embaralhar';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Combinação perfeita';

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
  String get deleteSeasonFiles => 'todos os episódios baixados nesta temporada';

  @override
  String get stillWatching => 'Ainda está assistindo?';

  @override
  String get unableToLoadTrailerStream =>
      'Não foi possível carregar o fluxo do trailer.';

  @override
  String get trailerTimedOut =>
      'O tempo limite do trailer expirou durante o carregamento.';

  @override
  String get playbackFailedForTrailer => 'Falha na reprodução deste trailer.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'A transmissão não está disponível durante a reprodução offline.';

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
  String get deviceVolume => 'Volume do dispositivo';

  @override
  String get unavailable => 'Indisponível';

  @override
  String get pause => 'Pausa';

  @override
  String get syncPosition => 'Posição de sincronização';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'A fila está vazia';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Reprodução Remota';

  @override
  String get castingToGoogleCast => 'Transmitindo para o Google Cast';

  @override
  String get castingViaAirPlay => 'Transmissão via AirPlay';

  @override
  String get castingViaDlna => 'Transmissão via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Pressione e segure para desbloquear';

  @override
  String get off => 'Desligado';

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
  String get bitrateOverride => 'Substituição de taxa de bits';

  @override
  String get audioDelay => 'Atraso de áudio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Atraso de legenda';

  @override
  String get reset => 'Reiniciar';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get playbackInformation => 'Informações de reprodução';

  @override
  String get playback => 'Reprodução';

  @override
  String get playMethod => 'Método de jogo';

  @override
  String get directPlay => 'Jogo direto';

  @override
  String get directStream => 'Transmissão direta';

  @override
  String get transcoding => 'Transcodificação';

  @override
  String get transcodeReasons => 'Razões de transcodificação';

  @override
  String get player => 'Jogador';

  @override
  String get container => 'Recipiente';

  @override
  String get bitrate => 'Taxa de bits';

  @override
  String get video => 'Vídeo';

  @override
  String get resolution => 'Resolução';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Taxa de bits de vídeo';

  @override
  String get track => 'Acompanhar';

  @override
  String get channels => 'Canais';

  @override
  String get audioBitrate => 'Taxa de bits de áudio';

  @override
  String get sampleRate => 'Taxa de amostragem';

  @override
  String get format => 'Formatar';

  @override
  String get external => 'Externo';

  @override
  String get embedded => 'Integrado';

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
      'A renderização de EPUB no aplicativo ainda não está disponível nesta plataforma.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A renderização de documentos incorporados não está disponível nesta plataforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'Não foi possível abrir o visualizador externo.';

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
      'Ainda não há favoritos.\nToque no ícone de marcador durante a leitura para salvar sua posição.';

  @override
  String get noTableOfContentsAvailable => 'Nenhum índice disponível';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Posição';

  @override
  String get bookReader => 'Leitor de livros';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Atualizando...';

  @override
  String get markUnread => 'Marcar como não lido';

  @override
  String get markAsRead => 'Marcar como lido';

  @override
  String get reloadReader => 'Recarregar leitor';

  @override
  String get noPagesFound => 'Nenhuma página encontrada.';

  @override
  String get failedToDecodePageImage =>
      'Falha ao decodificar a imagem da página.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Página única';

  @override
  String get twoPageSpread => 'Spread de duas páginas';

  @override
  String get addBookmark => 'Adicionar marcador';

  @override
  String get bookmarksEllipsis => 'Marcadores...';

  @override
  String get markedAsRead => 'Marcado como lido';

  @override
  String get markedAsUnread => 'Marcado como não lido';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Luz';

  @override
  String get themeDark => 'Tema: Escuro';

  @override
  String get themeSepia => 'Tema: Sépia';

  @override
  String get invertColorsFixedLayout => 'Inverter cores (layout fixo)';

  @override
  String get invertColorsPdf => 'Inverter cores (PDF)';

  @override
  String get preparingInAppReader => 'Preparando leitor no aplicativo...';

  @override
  String get pdfDataNotAvailable => 'Dados PDF não disponíveis.';

  @override
  String get readerFallbackModeActive => 'Modo substituto do leitor ativo';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Use o Reload Reader depois de mudar para uma plataforma compatível (Android, iOS, macOS).';

  @override
  String get openExternally => 'Abrir externamente';

  @override
  String get noEpubChaptersFound => 'Nenhum capítulo do EPUB encontrado.';

  @override
  String get readerNotReady => 'Leitor não está pronto.';

  @override
  String get seriesRecordings => 'Gravações de séries';

  @override
  String get now => 'Agora';

  @override
  String get sports => 'Esportes';

  @override
  String get news => 'Notícias';

  @override
  String get kids => 'Crianças';

  @override
  String get premiere => 'Estreia';

  @override
  String get guideTimeline => 'Linha do tempo do guia';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Nenhum canal encontrado';

  @override
  String get liveBadge => 'AO VIVO';

  @override
  String get movie => 'Filme';

  @override
  String get removedFromFavoriteChannels => 'Removido dos canais favoritos';

  @override
  String get addedToFavoriteChannels => 'Adicionado aos canais favoritos';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Falha ao atualizar canal favorito';

  @override
  String get unfavoriteChannel => 'Canal não favorito';

  @override
  String get favoriteChannel => 'Canal favorito';

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
  String get watch => 'Assistir';

  @override
  String get close => 'Fechar';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings => 'Falha ao carregar gravações';

  @override
  String get scheduledInNext24Hours => 'Agendado para as próximas 24 horas';

  @override
  String get recentRecordings => 'Gravações recentes';

  @override
  String get tvSeries => 'Série de TV';

  @override
  String get failedToLoadSchedule => 'Falha ao carregar agendamento';

  @override
  String get noScheduledRecordings => 'Nenhuma gravação agendada';

  @override
  String get cancelRecording => 'Cancelar gravação?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Não';

  @override
  String get yesCancel => 'Sim, cancelar';

  @override
  String get failedToCancelRecording => 'Falha ao cancelar a gravação';

  @override
  String get failedToLoadSeriesRecordings =>
      'Falha ao carregar gravações da série';

  @override
  String get noSeriesRecordings => 'Sem gravações de série';

  @override
  String get cancelSeriesRecording => 'Cancelar gravação de série';

  @override
  String get cancelSeriesRecordingQuestion => 'Cancelar a gravação da série?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Falha ao cancelar a gravação da série';

  @override
  String get searchThisLibrary => 'Pesquisar nesta biblioteca...';

  @override
  String get searchEllipsis => 'Procurar...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
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
  String get savedMedia => 'Mídia salva';

  @override
  String get tvShows => 'Programas de TV';

  @override
  String get music => 'Música';

  @override
  String get musicAlbums => 'Álbuns de música';

  @override
  String get noMediaInFilter => 'Nenhuma mídia neste filtro';

  @override
  String get noDownloadedMediaYet => 'Nenhuma mídia baixada ainda';

  @override
  String get browseLibrary => 'Navegar na biblioteca';

  @override
  String get deleteDownload => 'Excluir download';

  @override
  String removeItemAndFiles(String name) {
    return 'Remove \"$name\" and its files?';
  }

  @override
  String tracksCount(int count) {
    return '$count tracks';
  }

  @override
  String get album => 'Álbum';

  @override
  String get playAlbum => 'Reproduzir álbum';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Temporada';

  @override
  String get errorLoadingEpisodes => 'Erro ao carregar episódios';

  @override
  String get noDownloadedEpisodes => 'Nenhum episódio baixado';

  @override
  String get deleteEpisode => 'Excluir episódio';

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
  String get seriesNotFound => 'Série não encontrada';

  @override
  String get errorLoadingSeries => 'Erro ao carregar a série';

  @override
  String get downloadedEpisodes => 'Episódios baixados';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Especiais';

  @override
  String get deleteSeason => 'Excluir temporada';

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
  String get storageManagement => 'Gerenciamento de armazenamento';

  @override
  String get storageBreakdown => 'Divisão de armazenamento';

  @override
  String get downloadedItems => 'Itens baixados';

  @override
  String get storageLimit => 'Limite de armazenamento';

  @override
  String get noLimit => 'Sem limite';

  @override
  String get deleteAllDownloads => 'Excluir todos os downloads';

  @override
  String get deleteAllDownloadsWarning =>
      'Isso removerá todos os arquivos de mídia baixados e não poderá ser desfeito.';

  @override
  String get deleteAll => 'Excluir tudo';

  @override
  String get deleteSelected => 'Excluir selecionado';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Música e audiolivros';

  @override
  String get images => 'Imagens';

  @override
  String get database => 'Banco de dados';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get authentication => 'Autenticação';

  @override
  String get autoLoginServerManagement =>
      'Login automático, gerenciamento de servidor';

  @override
  String get pinCode => 'Código PIN';

  @override
  String get setUpPinCodeProtection => 'Configurar proteção por código PIN';

  @override
  String get parentalControls => 'Controles dos pais';

  @override
  String get contentRatingRestrictions =>
      'Restrições de classificação de conteúdo';

  @override
  String get bitRateResolutionBehavior =>
      'Taxa de bits, resolução, comportamento';

  @override
  String get languageSizeAppearance => 'Idioma, tamanho, aparência';

  @override
  String get qualityStorage => 'Qualidade, armazenamento';

  @override
  String get serverSyncAndPluginStatus =>
      'Sincronização do servidor e status do plugin';

  @override
  String get mediaRequestIntegration => 'Integração de solicitação de mídia';

  @override
  String get switchServer => 'Trocar servidor';

  @override
  String get signOut => 'Sair';

  @override
  String get versionLicenses => 'Versão, licenças';

  @override
  String get account => 'Conta';

  @override
  String get signInAndSecurity => 'Login e segurança';

  @override
  String get administration => 'Administração';

  @override
  String get serverSettingsUsersLibraries =>
      'Configurações do servidor, usuários, bibliotecas';

  @override
  String get customization => 'Personalização';

  @override
  String get themeAndLayout => 'Tema e layout';

  @override
  String get videoAndSubtitles => 'Vídeo e legendas';

  @override
  String get integrations => 'Integrações';

  @override
  String get pluginAndRequests => 'Plug-in e solicitações';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalize a conta, a reprodução e o comportamento da interface';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Tema e aparência';

  @override
  String get focusBorderColor => 'Cor da borda do foco';

  @override
  String get watchedIndicators => 'Indicadores observados';

  @override
  String get always => 'Sempre';

  @override
  String get hideUnwatched => 'Ocultar não assistido';

  @override
  String get episodesOnly => 'Apenas episódios';

  @override
  String get never => 'Nunca';

  @override
  String get focusExpansionAnimation => 'Animação de expansão de foco';

  @override
  String get desktopUiScale => 'Escala de UI de desktop';

  @override
  String get scaleFocusedCards =>
      'Dimensione cartões e blocos focados ou pairados';

  @override
  String get backgroundBackdrops => 'Cenários de fundo';

  @override
  String get showBackdropImages =>
      'Mostrar imagens de fundo por trás do conteúdo';

  @override
  String get seriesThumbnails => 'Miniaturas de séries';

  @override
  String get seriesThumbnailsDescription =>
      'Somente episódios: use arte da série que corresponda a cada tipo de imagem de linha';

  @override
  String get homeRowInfoOverlay =>
      'Sobreposição de informações da linha inicial';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Mostrar título e metadados ao navegar nas linhas iniciais';

  @override
  String get clockDisplay => 'Exibição do relógio';

  @override
  String get inMenus => 'Nos menus';

  @override
  String get inVideo => 'Em vídeo';

  @override
  String get seasonalEffects => 'Efeitos sazonais';

  @override
  String get seasonalEffectsDescription =>
      'Efeitos visuais e decorações sazonais';

  @override
  String get snow => 'Neve';

  @override
  String get fireworks => 'Fogos de artifício';

  @override
  String get confetti => 'Confete';

  @override
  String get fallingLeaves => 'Folhas caindo';

  @override
  String get themeMusic => 'Música Temática';

  @override
  String get playThemeMusicOnDetailPages =>
      'Reproduzir música tema nas páginas de detalhes';

  @override
  String get themeMusicVolume => 'Volume da música temática';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Música tema nas linhas iniciais';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Jogue enquanto navega na tela inicial';

  @override
  String get detailsBackgroundBlur => 'Detalhes do desfoque de fundo';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Navegando em desfoque de fundo';

  @override
  String get maxStreamingBitrate => 'Taxa máxima de bits de streaming';

  @override
  String get maxResolution => 'Resolução máxima';

  @override
  String get playerZoomMode => 'Modo de zoom do jogador';

  @override
  String get fit => 'Ajustar';

  @override
  String get autoCrop => 'Corte automático';

  @override
  String get stretch => 'Esticar';

  @override
  String get refreshRateSwitching => 'Mudança de taxa de atualização';

  @override
  String get disabled => 'Desabilitado';

  @override
  String get scaleOnTv => 'Escala na TV';

  @override
  String get scaleOnDevice => 'Dimensionar no dispositivo';

  @override
  String get trickPlay => 'Truque';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Mostrar miniaturas de visualização ao pesquisar';

  @override
  String get showDescriptionOnPause => 'Mostrar descrição em pausa';

  @override
  String get dimVideoShowOverview =>
      'Escureça o vídeo e mostre o texto de visão geral durante a pausa';

  @override
  String get osdLockButton => 'Botão de bloqueio OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostrar um botão de bloqueio que bloqueia a entrada por toque até ser pressionado por muito tempo';

  @override
  String get audioBehavior => 'Comportamento de áudio';

  @override
  String get downmixToStereo => 'Downmix para estéreo';

  @override
  String get defaultAudioLanguage => 'Idioma de áudio padrão';

  @override
  String get autoServerDefault => 'Automático (padrão do servidor)';

  @override
  String get english => 'Inglês';

  @override
  String get spanish => 'Espanhol';

  @override
  String get french => 'Francês';

  @override
  String get german => 'Alemão';

  @override
  String get italian => 'italiano';

  @override
  String get portuguese => 'Português';

  @override
  String get japanese => 'japonês';

  @override
  String get korean => 'coreano';

  @override
  String get chinese => 'chinês';

  @override
  String get russian => 'russo';

  @override
  String get arabic => 'árabe';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'Holandês';

  @override
  String get swedish => 'sueco';

  @override
  String get norwegian => 'norueguês';

  @override
  String get danish => 'dinamarquês';

  @override
  String get finnish => 'finlandês';

  @override
  String get polish => 'polonês';

  @override
  String get ac3Passthrough => 'Passagem AC3';

  @override
  String get dtsPassthrough => 'Passagem DTS';

  @override
  String get trueHdSupport => 'Suporte TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Áudio Bitstream DTS apenas para AVR; requer suporte de receptor e trilha de origem DTS';

  @override
  String get enableTrueHdAudio =>
      'Ative o áudio TrueHD (pode não funcionar em todas as plataformas)';

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
  String get nightMode => 'Modo noturno';

  @override
  String get compressDynamicRange => 'Comprimir faixa dinâmica';

  @override
  String get advancedMpv => 'Avançado mpv';

  @override
  String get enableCustomMpvConf => 'Habilitar mpv.conf personalizado';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplique um mpv.conf especificado pelo usuário antes do início da reprodução';

  @override
  String get unsafeAdvancedMpvOptions => 'Opções avançadas de mpv inseguras';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permita um conjunto mais amplo de opções de mpv. Pode interromper o comportamento de reprodução.';

  @override
  String get hardwareDecoding => 'Decodificação de hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Pode melhorar o desempenho, mas pode causar problemas de reprodução em alguns dispositivos.';

  @override
  String get nextUpAndQueuing => 'Próximo e na fila';

  @override
  String get nextUpDisplay => 'Próximo display';

  @override
  String get extended => 'Estendido';

  @override
  String get minimal => 'Mínimo';

  @override
  String get nextUpTimeout => 'Próximo tempo limite';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Enfileiramento de mídia';

  @override
  String get autoQueueNextEpisodes =>
      'Colocar automaticamente os próximos episódios na fila';

  @override
  String get stillWatchingPrompt => 'Ainda assistindo ao prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Retomar e pular';

  @override
  String get resumeRewind => 'Retomar retrocesso';

  @override
  String get unpauseRewind => 'Retomar retrocesso';

  @override
  String get fiveSeconds => '5 segundos';

  @override
  String get tenSeconds => '10 segundos';

  @override
  String get fifteenSeconds => '15 segundos';

  @override
  String get thirtySeconds => '30 segundos';

  @override
  String get skipBackLength => 'Comprimento do salto para trás';

  @override
  String get skipForwardLength => 'Pular comprimento para frente';

  @override
  String get customMpvConfPath => 'Caminho mpv.conf personalizado';

  @override
  String get notSetMpvConf =>
      'Não definido. Moonfin tentará um mpv.conf padrão nas pastas app/data.';

  @override
  String get selectMpvConf => 'Selecione mpv.conf';

  @override
  String get pathToMpvConf => '/caminho/para/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'As configurações de estilo (tamanho, cor, deslocamento) aplicam-se a legendas baseadas em texto (SRT, VTT, TTML). As legendas ASS/SSA usam seu próprio estilo incorporado, a menos que \"ASS/SSA Direct Play\" esteja desativado. Legendas de bitmap (PGS, DVB, VobSub) não podem ser reestilizadas.';

  @override
  String get defaultSubtitleLanguage => 'Idioma de legenda padrão';

  @override
  String get defaultToNoSubtitles => 'Padrão sem legendas';

  @override
  String get turnOffSubtitlesByDefault => 'Desative as legendas por padrão';

  @override
  String get subtitleSize => 'Tamanho da legenda';

  @override
  String get textFillColor => 'Cor de preenchimento de texto';

  @override
  String get backgroundColor => 'Cor de fundo';

  @override
  String get textStrokeColor => 'Cor do traço do texto';

  @override
  String get subtitleCustomization => 'Personalização de legendas';

  @override
  String get subtitleCustomizationDescription =>
      'Personalize a aparência das legendas';

  @override
  String get subtitlePreviewText =>
      'A rápida raposa marrom salta sobre o cachorro preguiçoso';

  @override
  String get verticalOffset => 'Deslocamento vertical';

  @override
  String get pgsDirectPlay => 'Jogo direto PGS';

  @override
  String get directPlayPgsSubtitles => 'Legendas PGS com reprodução direta';

  @override
  String get assSsaDirectPlay => 'Jogo direto ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Legendas ASS/SSA com reprodução direta';

  @override
  String get white => 'Branco';

  @override
  String get black => 'Preto';

  @override
  String get yellow => 'Amarelo';

  @override
  String get green => 'Verde';

  @override
  String get cyan => 'Ciano';

  @override
  String get red => 'Vermelho';

  @override
  String get transparent => 'Transparente';

  @override
  String get semiTransparentBlack => 'Preto Semitransparente';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Área de trabalho';

  @override
  String get mobile => 'Móvel';

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
  String get customizationProfile => 'Perfil de personalização';

  @override
  String get customizationProfileDescription =>
      'Escolha o perfil para carregar, editar e sincronizar. Global se aplica a todos os lugares, a menos que um perfil de dispositivo o substitua. O ponto verde marca o perfil do seu dispositivo atual.';

  @override
  String get loadProfile => 'Carregar perfil';

  @override
  String get syncing => 'Sincronizando...';

  @override
  String get syncToProfile => 'Sincronizar com perfil';

  @override
  String get profileSyncHidden => 'Sincronização de perfil oculta';

  @override
  String get enablePluginSyncDescription =>
      'Ative a sincronização do plug-in do servidor nas configurações do plug-in para mostrar os controles do perfil aqui.';

  @override
  String get quality => 'Qualidade';

  @override
  String get defaultDownloadQuality => 'Qualidade de download padrão';

  @override
  String get network => 'Rede';

  @override
  String get wifiOnlyDownloads => 'Downloads somente WiFi';

  @override
  String get onlyDownloadOnWifi => 'Baixe apenas quando conectado ao WiFi';

  @override
  String get storage => 'Armazenar';

  @override
  String get storageUsed => 'Armazenamento usado';

  @override
  String get manage => 'Gerenciar';

  @override
  String get calculating => 'Calculando...';

  @override
  String get downloadLocation => 'Local de download';

  @override
  String get defaultLabel => 'Padrão';

  @override
  String get saveToDownloadsFolder => 'Salvar na pasta Downloads';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin – visível para outros aplicativos';

  @override
  String get dangerZone => 'Zona de perigo';

  @override
  String get clearAllDownloads => 'Limpar todos os downloads';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Alterar local de download';

  @override
  String get changeDownloadLocationDescription =>
      'Novos downloads serão salvos na pasta selecionada. Os downloads existentes permanecerão em seu local atual e poderão ser gerenciados nas configurações de armazenamento.';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cannotWriteToFolder =>
      'Não é possível gravar na pasta selecionada. Escolha um local diferente ou conceda permissões de armazenamento.';

  @override
  String get saveToDownloadsFolderQuestion => 'Salvar na pasta Downloads?';

  @override
  String get saveToDownloadsFolderDescription =>
      'A mídia baixada será salva em Downloads/Moonfin no seu dispositivo. Esses arquivos ficarão visíveis para outros aplicativos, como sua galeria ou reprodutor de música.\n\nOs downloads existentes permanecerão no local atual.';

  @override
  String get enable => 'Habilitar';

  @override
  String get clearAllDownloadsWarning =>
      'Isso excluirá todas as mídias baixadas e não poderá ser desfeito.';

  @override
  String get clearAll => 'Limpar tudo';

  @override
  String get navigationStyle => 'Estilo de navegação';

  @override
  String get topBar => 'Barra superior';

  @override
  String get leftSidebar => 'Barra lateral esquerda';

  @override
  String get showShuffleButton => 'Mostrar botão aleatório';

  @override
  String get showGenresButton => 'Botão Mostrar gêneros';

  @override
  String get showFavoritesButton => 'Mostrar botão Favoritos';

  @override
  String get showLibrariesInToolbar =>
      'Mostrar bibliotecas na barra de ferramentas';

  @override
  String get navbarOpacity => 'Opacidade da barra de navegação';

  @override
  String get navbarColor => 'Cor da barra de navegação';

  @override
  String get gray => 'Cinza';

  @override
  String get darkBlue => 'Azul escuro';

  @override
  String get purple => 'Roxo';

  @override
  String get teal => 'Cerceta';

  @override
  String get navy => 'Marinha';

  @override
  String get charcoal => 'Carvão';

  @override
  String get brown => 'Marrom';

  @override
  String get darkRed => 'Vermelho Escuro';

  @override
  String get darkGreen => 'Verde Escuro';

  @override
  String get slate => 'Ardósia';

  @override
  String get indigo => 'Índigo';

  @override
  String get libraryDisplay => 'Exibição da Biblioteca';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Bandeira';

  @override
  String get overridePerLibrarySettings =>
      'Substituir configurações por biblioteca';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplicar tipo de imagem a todas as bibliotecas';

  @override
  String get multiServerLibraries => 'Bibliotecas multiservidor';

  @override
  String get showLibrariesFromAllServers =>
      'Mostrar bibliotecas de todos os servidores conectados';

  @override
  String get enableFolderView => 'Ativar visualização de pasta';

  @override
  String get showFolderBrowsingOption => 'Mostrar opção de navegação em pastas';

  @override
  String get libraryVisibility => 'Visibilidade da Biblioteca';

  @override
  String get libraryVisibilityDescription =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicie o Moonfin para que as alterações tenham efeito.';

  @override
  String get showInNavigation => 'Mostrar na navegação';

  @override
  String get showInLatestMedia => 'Mostrar na mídia mais recente';

  @override
  String get sourceLibraries => 'Bibliotecas de origem';

  @override
  String get sourceCollections => 'Coleções de origem';

  @override
  String get excludedGenres => 'Gêneros excluídos';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Barra de mídia';

  @override
  String get mediaSources => 'Fontes de mídia';

  @override
  String get behavior => 'Comportamento';

  @override
  String get seconds => 'segundos';

  @override
  String get localPreviews => 'Visualizações locais';

  @override
  String get localPreviewsDescription =>
      'Configure visualizações de trailer, mídia e áudio.';

  @override
  String get mediaBarMode => 'Estilo da barra de mídia';

  @override
  String get mediaBarModeDescription =>
      'Escolha entre Moonfin, MakD ou desligue a barra de mídia';

  @override
  String get mediaBarModeMoonfin => 'Barbatana Lunar';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desligado';

  @override
  String get enableMediaBar => 'Ativar barra de mídia';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostrar apresentação de slides de conteúdo em destaque na página inicial';

  @override
  String get contentType => 'Tipo de conteúdo';

  @override
  String get moviesAndTvShows => 'Filmes e programas de TV';

  @override
  String get moviesOnly => 'Apenas filmes';

  @override
  String get tvShowsOnly => 'Somente programas de TV';

  @override
  String get itemCount => 'Contagem de itens';

  @override
  String get noneSelected => 'Nenhum selecionado';

  @override
  String get noneExcluded => 'Nenhum excluído';

  @override
  String get autoAdvance => 'Avanço automático';

  @override
  String get autoAdvanceSlides =>
      'Avançar automaticamente para o próximo slide';

  @override
  String get autoAdvanceInterval => 'Intervalo de avanço automático';

  @override
  String get trailerPreview => 'Pré-visualização do trailer';

  @override
  String get autoPlayTrailers =>
      'Reproduza trailers automaticamente na barra de mídia após 3 segundos';

  @override
  String get episodePreview => 'Prévia do episódio';

  @override
  String get mediaPreview => 'Visualização de mídia';

  @override
  String get episodePreviewDescription =>
      'Reproduza uma visualização in-line de 30 segundos em cartões focados, pairados ou pressionados por muito tempo';

  @override
  String get mediaPreviewDescription =>
      'Reproduza uma visualização in-line de 30 segundos em cartões focados, pairados ou pressionados por muito tempo';

  @override
  String get previewAudio => 'Visualizar áudio';

  @override
  String get enablePreviewAudio =>
      'Ativar áudio para prévias de trailers e episódios';

  @override
  String get latestMedia => 'Últimas mídias';

  @override
  String get recentlyReleased => 'Lançado recentemente';

  @override
  String get myMedia => 'Minha mídia';

  @override
  String get myMediaSmall => 'Minha mídia (pequena)';

  @override
  String get continueWatching => 'Continuar assistindo';

  @override
  String get resumeAudio => 'Retomar áudio';

  @override
  String get resumeBooks => 'Retomar livros';

  @override
  String get activeRecordings => 'Gravações Ativas';

  @override
  String get playlists => 'Listas de reprodução';

  @override
  String get liveTV => 'TV ao vivo';

  @override
  String get homeSections => 'Seções iniciais';

  @override
  String get resetToDefaults => 'Redefinir para os padrões';

  @override
  String get homeRowPosterSize => 'Tamanho do pôster da linha inicial';

  @override
  String get perRowImageTypeSelection => 'Seleção de tipo de imagem por linha';

  @override
  String get configureImageTypeForEachRow =>
      'Configure o tipo de imagem para cada linha inicial habilitada';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Mesclar Continuar Assistindo e Próximo';

  @override
  String get combineBothRows =>
      'Combine as duas linhas em uma única seção inicial';

  @override
  String get perRowImageType => 'Tipo de imagem por linha';

  @override
  String get perRowSettings => 'Configurações por linha';

  @override
  String get autoLogin => 'Login automático';

  @override
  String get lastUser => 'Último usuário';

  @override
  String get specificUser => 'Usuário específico';

  @override
  String get alwaysAuthenticate => 'Sempre autenticar';

  @override
  String get requirePasswordWithToken =>
      'Exigir senha mesmo com token armazenado';

  @override
  String get confirmExit => 'Confirmar saída';

  @override
  String get showConfirmationBeforeExiting =>
      'Mostrar confirmação antes de sair';

  @override
  String get blockContentWithRatings =>
      'Bloqueie conteúdo com as seguintes classificações:';

  @override
  String get noContentRatingsFound =>
      'Nenhuma classificação de conteúdo foi encontrada neste servidor ainda.';

  @override
  String get couldNotLoadServerRatings =>
      'Não foi possível carregar as classificações do servidor. Mostrando apenas avaliações salvas.';

  @override
  String get couldNotRefreshRatings =>
      'Não foi possível atualizar as classificações do servidor. Mostrando avaliações salvas.';

  @override
  String get enablePinCode => 'Ativar código PIN';

  @override
  String get requirePinToAccess => 'Exigir um PIN para acessar sua conta';

  @override
  String get changePin => 'Alterar PIN';

  @override
  String get setNewPinCode => 'Defina um novo código PIN';

  @override
  String get removePin => 'Remover PIN';

  @override
  String get removePinProtection => 'Remover proteção do código PIN';

  @override
  String get screensaver => 'Protetor de tela';

  @override
  String get inAppScreensaver => 'Protetor de tela no aplicativo';

  @override
  String get enableBuiltInScreensaver =>
      'Habilite o protetor de tela integrado';

  @override
  String get mode => 'Modo';

  @override
  String get libraryArt => 'Arte da Biblioteca';

  @override
  String get logo => 'Logotipo';

  @override
  String get clock => 'Relógio';

  @override
  String get timeout => 'Tempo esgotado';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Nível de escurecimento';

  @override
  String get maxAgeRating => 'Classificação etária máxima';

  @override
  String get any => 'Qualquer';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Exigir classificação etária';

  @override
  String get onlyShowRatedContent => 'Mostrar apenas conteúdo avaliado';

  @override
  String get showClock => 'Mostrar relógio';

  @override
  String get displayClockDuringScreensaver =>
      'Exibir relógio durante o protetor de tela';

  @override
  String get rottenTomatoesCritics => 'Tomates podres (críticos)';

  @override
  String get rottenTomatoesAudience => 'Tomates podres (público)';

  @override
  String get imdb => 'IMDB';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacrítico';

  @override
  String get metacriticUser => 'Metacrítico (usuário)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Caixa de correio';

  @override
  String get myAnimeList => 'Minha lista de animes';

  @override
  String get aniList => 'ListaAni';

  @override
  String get communityRating => 'Classificação da comunidade';

  @override
  String get ratings => 'Avaliações';

  @override
  String get additionalRatings => 'Avaliações Adicionais';

  @override
  String get showMdbListAndTmdbRatings =>
      'Mostrar classificações MDBList e TMDB';

  @override
  String get ratingLabels => 'Etiquetas de classificação';

  @override
  String get showLabelsNextToIcons =>
      'Mostrar rótulos ao lado dos ícones de classificação';

  @override
  String get ratingBadges => 'Selos de classificação';

  @override
  String get showDecorativeBadges =>
      'Mostrar emblemas decorativos atrás das avaliações';

  @override
  String get episodeRatings => 'Avaliações de episódios';

  @override
  String get showRatingsOnEpisodes =>
      'Mostrar classificações em episódios individuais';

  @override
  String get ratingSources => 'Fontes de classificação';

  @override
  String get ratingSourcesDescription =>
      'Ative e reordene as fontes de classificação mostradas em todo o aplicativo';

  @override
  String get pluginLabel => 'Plug-in';

  @override
  String get pluginDetected => 'Plug-in detectado';

  @override
  String get pluginNotDetected => 'Plug-in não detectado';

  @override
  String get pluginDetectedDescription =>
      'Plug-in de servidor detectado. A sincronização é ativada automaticamente na primeira vez que o plugin é encontrado.';

  @override
  String get pluginNotDetectedDescription =>
      'O plugin do servidor não foi detectado no momento. As configurações locais ainda usam seus valores salvos ou padrões integrados.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Serviços disponíveis';

  @override
  String get serverPluginSync => 'Sincronização de plug-in de servidor';

  @override
  String get syncSettingsWithPlugin =>
      'Sincronizar configurações com o plugin do servidor';

  @override
  String get whatSyncControls => 'Quais controles de sincronização';

  @override
  String get syncControlsDescription =>
      'A sincronização controla apenas se as configurações apoiadas pelo plug-in são enviadas e extraídas do servidor. A seleção de perfil e as ações de sincronização de perfil estão nas configurações de personalização quando a sincronização do plug-in está habilitada.';

  @override
  String get recentRequests => 'Solicitações recentes';

  @override
  String get recentlyAdded => 'Adicionado recentemente';

  @override
  String get trending => 'Tendências';

  @override
  String get popularMovies => 'Filmes populares';

  @override
  String get movieGenres => 'Gêneros de filmes';

  @override
  String get upcomingMovies => 'Próximos filmes';

  @override
  String get studios => 'Estúdios';

  @override
  String get popularSeries => 'Séries populares';

  @override
  String get seriesGenres => 'Gêneros de séries';

  @override
  String get upcomingSeries => 'Próximas séries';

  @override
  String get networks => 'Redes';

  @override
  String get resetRowsToDefaults => 'Redefinir linhas para os padrões';

  @override
  String get enableSeerr => 'Habilitar Seer';

  @override
  String get showSeerrInNavigation =>
      'Mostrar Seerr na navegação (requer plugin de servidor)';

  @override
  String get seerrUnavailable =>
      'Indisponível porque o suporte do plugin do servidor Seerr está desativado.';

  @override
  String get nsfwFilter => 'Filtro NSFW';

  @override
  String get hideAdultContent => 'Ocultar conteúdo adulto nos resultados';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Descubra linhas';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Arraste para reordenar. Habilite ou desabilite linhas. A ordem das linhas habilitada é sincronizada com o plugin Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Arraste para reordenar. Habilite ou desabilite linhas.';

  @override
  String get enabled => 'Habilitado';

  @override
  String get hidden => 'Escondido';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Licenças de código aberto';

  @override
  String get sourceCode => 'Código Fonte';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Verifique se há atualizações agora';

  @override
  String get checksLatestDesktopRelease =>
      'Verifica a versão de desktop mais recente para esta plataforma';

  @override
  String get youAreUpToDate => 'Você está atualizado.';

  @override
  String get couldNotCheckForUpdates =>
      'Não foi possível verificar atualizações no momento.';

  @override
  String get noCompatibleUpdate =>
      'Nenhum pacote de atualização compatível encontrado para esta plataforma.';

  @override
  String get updateChecksNotSupported =>
      'As verificações de atualização não são suportadas nesta plataforma.';

  @override
  String get updateNotificationsDisabled =>
      'As notificações de atualização estão desativadas.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Aguarde antes de verificar novamente.';

  @override
  String get latestUpdateAlreadyShown =>
      'A última atualização já foi mostrada.';

  @override
  String get updateAvailable => 'Atualização disponível.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Notificações de atualização';

  @override
  String get showWhenUpdatesAvailable =>
      'Mostrar quando atualizações estão disponíveis';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Leia as notas de versão';

  @override
  String get downloadingUpdate => 'Baixando atualização...';

  @override
  String get updateDownloadFailed =>
      'Falha no download da atualização. Por favor, tente novamente.';

  @override
  String get openReleasesPage => 'Abrir página de lançamentos';

  @override
  String get navigation => 'Navegação';

  @override
  String get watchedIndicatorsBackdrops => 'Indicadores observados, cenários';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Cor do foco, indicadores observados, cenários';

  @override
  String get navbarStyleToolbarAppearance =>
      'Estilo da barra de navegação, botões da barra de ferramentas, aparência';

  @override
  String get reorderToggleHomeRows => 'Reordenar e alternar linhas iniciais';

  @override
  String get featuredContentAppearance => 'Conteúdo em destaque, aparência';

  @override
  String get posterSizeImageTypeFolderView =>
      'Tamanho do pôster, tipo de imagem, visualização de pasta';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB e fontes de classificação';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Claro';

  @override
  String get browse => 'Navegar';

  @override
  String get noResults => 'Nenhum resultado';

  @override
  String get seerrAvailableStatus => 'Disponível';

  @override
  String get seerrRequestedStatus => 'Solicitado';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Configurações do visualizador';

  @override
  String get requestMore => 'Solicite mais';

  @override
  String get request => 'Solicitar';

  @override
  String get cancelRequest => 'Cancelar solicitação';

  @override
  String get playInMoonfin => 'Jogue em Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Aprovar';

  @override
  String get declineAction => 'Declínio';

  @override
  String get similar => 'Semelhante';

  @override
  String get recommendations => 'Recomendações';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Manter';

  @override
  String get itemNotFoundInLibrary =>
      'Item não encontrado em sua biblioteca Moonfin';

  @override
  String get errorSearchingLibrary => 'Erro ao pesquisar biblioteca';

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
  String get submitRequest => 'Enviar solicitação';

  @override
  String get allSeasons => 'Todas as temporadas';

  @override
  String get advancedOptions => 'Opções Avançadas';

  @override
  String get noServiceServersConfigured =>
      'Nenhum servidor de serviço configurado';

  @override
  String get server => 'Servidor';

  @override
  String get qualityProfile => 'Perfil de qualidade';

  @override
  String get rootFolder => 'Pasta raiz';

  @override
  String get showMore => 'Mostrar mais';

  @override
  String get appearances => 'Aparências';

  @override
  String get crewSection => 'Equipe';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Nenhuma solicitação';

  @override
  String get pendingStatus => 'Pendente';

  @override
  String get declinedStatus => 'Recusado';

  @override
  String get partiallyAvailable => 'Parcialmente disponível';

  @override
  String get downloadingStatus => 'Baixando';

  @override
  String get approvedStatus => 'Aprovado';

  @override
  String get notRequestedStatus => 'Não solicitado';

  @override
  String get blocklistedStatus => 'Na lista de bloqueio';

  @override
  String get deletedStatus => 'Excluído';

  @override
  String get tmdbScore => 'Pontuação TMDB';

  @override
  String get releaseDateLabel => 'Data de lançamento';

  @override
  String get firstAirDateLabel => 'Primeira data de transmissão';

  @override
  String get revenueLabel => 'Receita';

  @override
  String get runtimeLabel => 'Tempo de execução';

  @override
  String get budgetLabel => 'Orçamento';

  @override
  String get originalLanguageLabel => 'Idioma Original';

  @override
  String get seasonsLabel => 'Temporadas';

  @override
  String get episodesLabel => 'Episódios';

  @override
  String get access => 'Acesso';

  @override
  String get add => 'Adicionar';

  @override
  String get address => 'Endereço';

  @override
  String get analytics => 'Análise';

  @override
  String get catalog => 'Catálogo';

  @override
  String get content => 'Contente';

  @override
  String get copy => 'Cópia';

  @override
  String get create => 'Criar';

  @override
  String get disable => 'Desativar';

  @override
  String get done => 'Feito';

  @override
  String get edit => 'Editar';

  @override
  String get encoding => 'Codificação';

  @override
  String get error => 'Erro';

  @override
  String get forward => 'Avançar';

  @override
  String get general => 'Em geral';

  @override
  String get go => 'Ir';

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
  String get next => 'Próximo';

  @override
  String get path => 'Caminho';

  @override
  String get paused => 'Pausado';

  @override
  String get permissions => 'Permissões';

  @override
  String get processing => 'Processamento';

  @override
  String get profile => 'Perfil';

  @override
  String get provider => 'Provedor';

  @override
  String get refresh => 'Atualizar';

  @override
  String get remote => 'Remoto';

  @override
  String get rename => 'Renomear';

  @override
  String get revoke => 'Revogar';

  @override
  String get role => 'Papel';

  @override
  String get root => 'Raiz';

  @override
  String get run => 'Correr';

  @override
  String get search => 'Procurar';

  @override
  String get select => 'Selecione';

  @override
  String get send => 'Enviar';

  @override
  String get sessions => 'Sessões';

  @override
  String get set => 'Definir';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Parar';

  @override
  String get streaming => 'Transmissão';

  @override
  String get time => 'Tempo';

  @override
  String get trickplay => 'Truques';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get up => 'Acima';

  @override
  String get update => 'Atualizar';

  @override
  String get upload => 'Carregar';

  @override
  String get unmute => 'Ativar som';

  @override
  String get mute => 'Mudo';

  @override
  String get branding => 'Marca';

  @override
  String get adminDrawerDashboard => 'Painel';

  @override
  String get adminDrawerAnalytics => 'Análise';

  @override
  String get adminDrawerSettings => 'Configurações';

  @override
  String get adminDrawerBranding => 'Marca';

  @override
  String get adminDrawerUsers => 'Usuários';

  @override
  String get adminDrawerLibraries => 'Bibliotecas';

  @override
  String get adminDrawerTranscoding => 'Transcodificação';

  @override
  String get adminDrawerResume => 'Retomar';

  @override
  String get adminDrawerStreaming => 'Transmissão';

  @override
  String get adminDrawerTrickplay => 'Truques';

  @override
  String get adminDrawerDevices => 'Dispositivos';

  @override
  String get adminDrawerActivity => 'Atividade';

  @override
  String get adminDrawerNetworking => 'Rede';

  @override
  String get adminDrawerApiKeys => 'Chaves de API';

  @override
  String get adminDrawerBackups => 'Cópias de segurança';

  @override
  String get adminDrawerLogs => 'Registros';

  @override
  String get adminDrawerScheduledTasks => 'Tarefas agendadas';

  @override
  String get adminDrawerPlugins => 'Plug-ins';

  @override
  String get adminDrawerRepositories => 'Repositórios';

  @override
  String get adminDrawerLiveTv => 'TV ao vivo';

  @override
  String get adminExitTooltip => 'Sair do administrador';

  @override
  String get adminDashboardLoadFailed => 'Falha ao carregar o painel';

  @override
  String get adminMediaOverview => 'Visão geral da mídia';

  @override
  String get adminMediaTotalsError =>
      'Não foi possível carregar os totais de mídia do servidor.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Uma leitura rápida sobre a quantidade de conteúdo neste servidor.';

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
  String get analyticsMediaDistribution => 'Distribuição de mídia';

  @override
  String get analyticsVideoCodecs => 'Codecs de vídeo';

  @override
  String get analyticsAudioCodecs => 'Codecs de áudio';

  @override
  String get analyticsContainers => 'Recipientes';

  @override
  String get analyticsTopGenres => 'Principais gêneros';

  @override
  String get analyticsReleaseYears => 'Anos de lançamento';

  @override
  String get analyticsContentRatings => 'Avaliações de conteúdo';

  @override
  String get analyticsRuntimeBuckets => 'Baldes de tempo de execução';

  @override
  String get analyticsFileFormats => 'Formatos de arquivo';

  @override
  String get analyticsNoData => 'Nenhum dado disponível.';

  @override
  String get adminServerInfo => 'Informações do servidor';

  @override
  String get adminRestartPending => 'Reinicialização pendente';

  @override
  String get adminServerPaths => 'Caminhos de servidor';

  @override
  String get adminServerActions => 'Ações do servidor';

  @override
  String get adminRestartServer => 'Reinicie o servidor';

  @override
  String get adminShutdownServer => 'Desligar servidor';

  @override
  String get adminScanLibraries => 'Digitalizar bibliotecas';

  @override
  String get adminLibraryScanStarted => 'Verificação da biblioteca iniciada';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Reinicialização do servidor em andamento';

  @override
  String get adminServerRebootMessage =>
      'Reinicialização do servidor em andamento, reinicie o Moonfin';

  @override
  String get adminActiveSessions => 'Sessões ativas';

  @override
  String get adminSessionsLoadFailed => 'Falha ao carregar sessões';

  @override
  String get adminNoActiveSessions => 'Nenhuma sessão ativa';

  @override
  String get adminRecentActivity => 'Atividade recente';

  @override
  String get adminNoRecentActivity => 'Nenhuma atividade recente';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Enviar mensagem';

  @override
  String get adminMessageTextHint => 'Texto da mensagem';

  @override
  String get adminSetVolume => 'Definir volume';

  @override
  String get sessionPrev => 'Anterior';

  @override
  String get sessionRewind => 'Retroceder';

  @override
  String get sessionForward => 'Avançar';

  @override
  String get sessionNext => 'Próximo';

  @override
  String get sessionVolumeDown => 'Volume –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Agora jogando';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Ações';

  @override
  String get videoCodec => 'Codec de vídeo';

  @override
  String get audioCodec => 'Codec de áudio';

  @override
  String get hwAccel => 'Aceleração de hardware';

  @override
  String get completion => 'Conclusão';

  @override
  String get direct => 'Direto';

  @override
  String get adminDisconnect => 'Desconectar';

  @override
  String get adminClearDates => 'Limpar datas';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nenhuma entrada de atividade';

  @override
  String get adminEditDeviceName => 'Editar nome do dispositivo';

  @override
  String get adminCustomName => 'Nome personalizado';

  @override
  String get adminDeviceNameUpdated => 'Nome do dispositivo atualizado';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Excluir dispositivo';

  @override
  String get adminDeviceDeleted => 'Dispositivo excluído';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Falha ao carregar dispositivos';

  @override
  String get adminSearchDevices => 'Pesquisar dispositivos';

  @override
  String get adminThisDevice => 'Este dispositivo';

  @override
  String get adminEditName => 'Editar nome';

  @override
  String get adminLibrariesLoadFailed => 'Falha ao carregar bibliotecas';

  @override
  String get adminNoLibraries => 'Nenhuma biblioteca configurada';

  @override
  String get adminScanAllLibraries => 'Digitalize todas as bibliotecas';

  @override
  String get adminAddLibrary => 'Adicionar biblioteca';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Renomear biblioteca';

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
  String get adminDeleteLibrary => 'Excluir biblioteca';

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
  String get adminRemovePath => 'Remover caminho';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opções de biblioteca salvas';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Falha ao carregar a biblioteca';

  @override
  String get adminNoMediaPaths => 'Nenhum caminho de mídia configurado';

  @override
  String get adminAddPath => 'Adicionar caminho';

  @override
  String get adminBrowseFilesystem =>
      'Navegue pelo sistema de arquivos do servidor:';

  @override
  String get adminSaveOptions => 'Salvar opções';

  @override
  String get adminPreferredMetadataLanguage => 'Idioma de metadados preferido';

  @override
  String get adminMetadataLanguageHint => 'por exemplo en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Código do país dos metadados';

  @override
  String get adminMetadataCountryHint => 'por exemplo EUA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'O nome da biblioteca é obrigatório';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Nome da Biblioteca';

  @override
  String get adminSelectedPaths => 'Caminhos selecionados:';

  @override
  String get adminNoPathsAdded =>
      'Nenhum caminho adicionado (pode ser adicionado posteriormente)';

  @override
  String get adminCreateLibrary => 'Criar biblioteca';

  @override
  String get paths => 'Caminhos:';

  @override
  String get adminDisableUser => 'Desabilitar usuário';

  @override
  String get adminEnableUser => 'Habilitar usuário';

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
  String get adminUsersLoadFailed => 'Falha ao carregar usuários';

  @override
  String get adminSearchUsers => 'Pesquisar usuários';

  @override
  String get adminEditUser => 'Editar usuário';

  @override
  String get adminAddUser => 'Adicionar usuário';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Criar usuário';

  @override
  String get adminPasswordOptional => 'Senha (opcional)';

  @override
  String get adminUsernameRequired => 'O nome de usuário não pode ficar vazio';

  @override
  String get adminNoProfileChanges => 'Nenhuma alteração de perfil para salvar';

  @override
  String get adminProfileSaved => 'Perfil salvo';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permissões salvas';

  @override
  String get adminPasswordsMismatch => 'As senhas não coincidem';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Falha ao carregar usuário';

  @override
  String get adminBackToUsers => 'Voltar para Usuários';

  @override
  String get adminSaveProfile => 'Salvar perfil';

  @override
  String get adminDeleteUser => 'Excluir usuário';

  @override
  String get admin => 'Administrador';

  @override
  String get adminFullAccessWarning =>
      'Os administradores têm acesso completo ao servidor. Conceda com cautela.';

  @override
  String get administrator => 'Administrador';

  @override
  String get adminHiddenUser => 'Usuário oculto';

  @override
  String get adminAllowMediaPlayback => 'Permitir reprodução de mídia';

  @override
  String get adminAllowAudioTranscoding => 'Permitir transcodificação de áudio';

  @override
  String get adminAllowVideoTranscoding => 'Permitir transcodificação de vídeo';

  @override
  String get adminAllowRemuxing => 'Permitir remixagem';

  @override
  String get adminForceRemoteTranscoding =>
      'Forçar transcodificação de fonte remota';

  @override
  String get adminAllowContentDeletion => 'Permitir exclusão de conteúdo';

  @override
  String get adminAllowContentDownloading => 'Permitir download de conteúdo';

  @override
  String get adminAllowPublicSharing => 'Permitir compartilhamento público';

  @override
  String get adminAllowRemoteControl =>
      'Permitir controle remoto de outros usuários';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permitir controle de dispositivo compartilhado';

  @override
  String get adminAllowRemoteAccess => 'Permitir acesso remoto';

  @override
  String get adminRemoteBitrateLimit =>
      'Limite de taxa de bits do cliente remoto (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Deixe em branco sem limite';

  @override
  String get adminMaxActiveSessions => 'Máximo de sessões ativas';

  @override
  String get adminAllowLiveTvAccess => 'Permitir acesso à TV ao vivo';

  @override
  String get adminAllowLiveTvManagement =>
      'Permitir gerenciamento de TV ao vivo';

  @override
  String get adminAllowCollectionManagement =>
      'Permitir gerenciamento de coleção';

  @override
  String get adminAllowSubtitleManagement =>
      'Permitir gerenciamento de legendas';

  @override
  String get adminAllowLyricManagement => 'Permitir gerenciamento de letras';

  @override
  String get adminSavePermissions => 'Salvar permissões';

  @override
  String get adminEnableAllLibraryAccess =>
      'Habilite o acesso a todas as bibliotecas';

  @override
  String get adminSaveAccess => 'Salvar acesso';

  @override
  String get adminChangePassword => 'Alterar a senha';

  @override
  String get adminNewPassword => 'Nova Senha';

  @override
  String get adminConfirmPassword => 'Confirme sua senha';

  @override
  String get adminSetPassword => 'Definir senha';

  @override
  String get adminResetPassword => 'Redefinir senha';

  @override
  String get adminPasswordReset => 'Redefinição de senha';

  @override
  String get adminPasswordUpdated => 'Senha atualizada';

  @override
  String get adminUserSettings => 'Configurações do usuário';

  @override
  String get adminLibraryAccess => 'Acesso à biblioteca';

  @override
  String get adminDeviceAndChannelAccess => 'Acesso a dispositivos e canais';

  @override
  String get adminEnableAllDevices =>
      'Habilite o acesso a todos os dispositivos';

  @override
  String get adminEnableAllChannels => 'Habilite o acesso a todos os canais';

  @override
  String get adminResetPasswordWarning =>
      'Isso removerá a senha. O usuário poderá fazer login sem senha.';

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
  String get adminCreateApiKey => 'Criar chave de API';

  @override
  String get adminAppName => 'Nome do aplicativo';

  @override
  String get adminApiKeyCreated => 'Chave de API criada';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Chave criada com sucesso. O servidor não retornou o token. Verifique as chaves de API do servidor.';

  @override
  String get adminKeyCopied => 'Chave copiada para a área de transferência';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token de chave ausente na resposta do servidor';

  @override
  String get adminRevokeApiKey => 'Revogar chave de API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Chave de API revogada';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Falha ao carregar chaves de API';

  @override
  String get adminApiKeysTitle => 'Chaves de API';

  @override
  String get adminCreateKey => 'Criar chave';

  @override
  String get adminNoApiKeys => 'Nenhuma chave de API encontrada';

  @override
  String get adminUnknownApp => 'Aplicativo desconhecido';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Criando backup...';

  @override
  String get adminBackupCreated => 'Backup criado com sucesso';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Caminho de backup ausente na resposta do servidor';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmar restauração';

  @override
  String get adminRestoringBackup => 'Restaurando backup...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Falha ao carregar backups';

  @override
  String get adminCreateBackup => 'Criar backup';

  @override
  String get adminNoBackups => 'Nenhum backup encontrado';

  @override
  String get adminViewDetails => 'Ver detalhes';

  @override
  String get restore => 'Restaurar';

  @override
  String get adminLogsLoadFailed => 'Falha ao carregar logs do servidor';

  @override
  String get adminNoLogFiles => 'Nenhum arquivo de log encontrado';

  @override
  String get adminLogCopied => 'Log copiado para a área de transferência';

  @override
  String get adminSaveLogFile => 'Salvar arquivo de registro';

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
  String get adminSearchInLog => 'Pesquisar no registro';

  @override
  String get adminNoMatchingLines => 'Nenhuma linha correspondente';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nenhuma tarefa agendada encontrada';

  @override
  String get adminNoTasksMatchFilter =>
      'Nenhuma tarefa corresponde ao filtro atual';

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
  String get adminRunNow => 'Corra agora';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Última Execução';

  @override
  String get adminTriggers => 'Gatilhos';

  @override
  String get adminAddTrigger => 'Adicionar gatilho';

  @override
  String get adminNoTriggers => 'Nenhum gatilho configurado';

  @override
  String get adminTriggerType => 'Tipo de gatilho';

  @override
  String get adminTimeLimit => 'Limite de tempo (opcional)';

  @override
  String get adminNoLimit => 'Sem limite';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Dia da semana';

  @override
  String get adminSearchPlugins => 'Pesquisar plug-ins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstalar plug-in';

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
      'Nenhum plug-in corresponde à sua pesquisa';

  @override
  String get adminNoPluginsInstalled => 'Nenhum plug-in instalado';

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
      'Nenhum pacote corresponde à sua pesquisa';

  @override
  String get adminNoPackagesAvailable => 'Nenhum pacote disponível';

  @override
  String get adminExperimentalIntegration => 'Integração Experimental';

  @override
  String get adminExperimentalWarning =>
      'A integração das configurações do plugin ainda é experimental. Algumas páginas de configurações podem não ser renderizadas corretamente.';

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
      'Não é possível abrir as configurações: token de autenticação ausente.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plug-in não encontrado';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Habilitar plug-in';

  @override
  String get adminPluginSettingsPage => 'Página de configurações do plug-in';

  @override
  String get adminRevisionHistory => 'Histórico de revisões';

  @override
  String get adminNoChangelog => 'Nenhum registro de alterações disponível.';

  @override
  String get adminRemoveRepository => 'Remover repositório';

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
  String get adminRepositoryNameHint => 'por exemplo Estável Jellyfin';

  @override
  String get adminRepositoryUrl => 'URL do repositório';

  @override
  String get adminAddEntry => 'Adicionar entrada';

  @override
  String get adminInvalidUrl => 'URL inválido';

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
  String get adminGeneralSettings => 'Configurações Gerais';

  @override
  String get adminServerName => 'Nome do servidor';

  @override
  String get adminPreferredMetadataCountry => 'País de metadados preferido';

  @override
  String get adminCachePath => 'Caminho do cache';

  @override
  String get adminMetadataPath => 'Caminho de metadados';

  @override
  String get adminLibraryScanConcurrency =>
      'Simultaneidade de verificação de biblioteca';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limite de codificação de imagem paralela';

  @override
  String get adminSlowResponseThreshold => 'Limite de resposta lenta (ms)';

  @override
  String get adminBrandingSaved => 'Configurações de marca salvas';

  @override
  String get adminBrandingLoadFailed =>
      'Falha ao carregar as configurações de marca';

  @override
  String get adminLoginDisclaimer => 'Isenção de responsabilidade de login';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML exibido abaixo do formulário de login';

  @override
  String get adminCustomCss => 'CSS personalizado';

  @override
  String get adminCustomCssHint => 'CSS personalizado aplicado à interface web';

  @override
  String get adminEnableSplashScreen => 'Ativar tela inicial';

  @override
  String get adminStreamingSaved => 'Configurações de streaming salvas';

  @override
  String get adminStreamingLoadFailed =>
      'Falha ao carregar as configurações de streaming';

  @override
  String get adminStreamingDescription =>
      'Defina limites globais de taxa de bits de streaming para conexões remotas.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Deixe em branco ou 0 para ilimitado';

  @override
  String get adminPlaybackSaved => 'Configurações de reprodução salvas';

  @override
  String get adminPlaybackLoadFailed =>
      'Falha ao carregar as configurações de reprodução';

  @override
  String get adminPlaybackTranscoding => 'Reprodução/Transcodificação';

  @override
  String get adminHardwareAcceleration => 'Aceleração de hardware';

  @override
  String get adminVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Habilitar codificação de hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Habilite a decodificação de hardware para:';

  @override
  String get adminEncodingThreads => 'Codificação de threads';

  @override
  String get adminAutomatic => '0 = automático';

  @override
  String get adminTranscodingTempPath =>
      'Caminho temporário de transcodificação';

  @override
  String get adminEnableFallbackFont => 'Ativar fonte substituta';

  @override
  String get adminFallbackFontPath => 'Caminho da fonte substituta';

  @override
  String get adminAllowSegmentDeletion => 'Permitir exclusão de segmento';

  @override
  String get adminSegmentKeepSeconds => 'Manter segmento (segundos)';

  @override
  String get adminThrottleBuffering => 'Buffer de aceleração';

  @override
  String get adminTrickplaySaved => 'Configurações do Trickplay salvas';

  @override
  String get adminTrickplayLoadFailed =>
      'Falha ao carregar as configurações do trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Habilitar aceleração de hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Ativar extração somente de quadro-chave';

  @override
  String get adminKeyFrameSubtitle => 'Mais rápido, mas com menor precisão';

  @override
  String get adminScanBehavior => 'Comportamento de verificação';

  @override
  String get adminProcessPriority => 'Prioridade do processo';

  @override
  String get adminImageSettings => 'Configurações de imagem';

  @override
  String get adminIntervalMs => 'Intervalo (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Com que frequência capturar quadros';

  @override
  String get adminWidthResolutions => 'Resoluções de largura';

  @override
  String get adminTileWidth => 'Largura do ladrilho';

  @override
  String get adminTileHeight => 'Altura do ladrilho';

  @override
  String get adminQualitySubtitle =>
      'Valores mais baixos = melhor qualidade, arquivos maiores';

  @override
  String get adminProcessThreads => 'Threads de processo';

  @override
  String get adminResumeSaved => 'Retomar configurações salvas';

  @override
  String get adminResumeLoadFailed =>
      'Falha ao carregar as configurações de currículo';

  @override
  String get adminResumeDescription =>
      'Configure quando o conteúdo deve ser marcado como reproduzido parcialmente ou totalmente.';

  @override
  String get adminMinResumePercentage => 'Porcentagem mínima de currículo';

  @override
  String get adminMinResumeSubtitle =>
      'O conteúdo deve ser reproduzido além dessa porcentagem para salvar o progresso';

  @override
  String get adminMaxResumePercentage => 'Porcentagem máxima de currículo';

  @override
  String get adminMaxResumeSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta porcentagem';

  @override
  String get adminMinResumeDuration => 'Duração mínima do currículo (segundos)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Itens menores que isso não são recuperáveis';

  @override
  String get adminMinAudiobookResume =>
      'Porcentagem mínima de currículo de audiolivro';

  @override
  String get adminMaxAudiobookResume =>
      'Porcentagem máxima de currículo de audiolivro';

  @override
  String get adminNetworkingSaved =>
      'Configurações de rede salvas. Pode ser necessário reiniciar o servidor.';

  @override
  String get adminNetworkingLoadFailed =>
      'Falha ao carregar as configurações de rede';

  @override
  String get adminNetworkingWarning =>
      'As alterações nas configurações de rede podem exigir a reinicialização do servidor.';

  @override
  String get adminEnableRemoteAccess => 'Habilitar acesso remoto';

  @override
  String get ports => 'Portas';

  @override
  String get adminHttpPort => 'Porta HTTP';

  @override
  String get adminHttpsPort => 'Porta HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminBaseUrl => 'URL base';

  @override
  String get adminBaseUrlHint => 'por exemplo /geleia';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Habilitar HTTPS';

  @override
  String get adminLocalNetwork => 'Rede local';

  @override
  String get adminLocalNetworkAddresses => 'Endereços de rede local';

  @override
  String get adminKnownProxies => 'Proxies conhecidos';

  @override
  String get adminRemoteIpFilter => 'Filtro IP remoto';

  @override
  String get adminRemoteIpFilterEntries => 'Filtro IP remoto';

  @override
  String get adminCertificatePath => 'Caminho do certificado';

  @override
  String get whitelist => 'Lista de permissões';

  @override
  String get blacklist => 'Lista negra';

  @override
  String get notSet => 'Não definido';

  @override
  String get adminMetadataSaved => 'Metadados salvos';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atualizar metadados';

  @override
  String get recursive => 'Recursivo';

  @override
  String get adminReplaceAllMetadata => 'Substitua todos os metadados';

  @override
  String get adminReplaceAllImages => 'Substitua todas as imagens';

  @override
  String get adminMetadataRefreshRequested =>
      'Atualização de metadados solicitada';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Pesquisar Pessoa Remota';

  @override
  String get adminNoRemoteMatches =>
      'Nenhuma correspondência remota encontrada';

  @override
  String get adminRemoteResults => 'Resultados remotos';

  @override
  String get adminRemoteMetadataApplied => 'Metadados remotos aplicados';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Atualizar tipo de conteúdo';

  @override
  String get adminContentType => 'Tipo de conteúdo';

  @override
  String get adminContentTypeUpdated => 'Tipo de conteúdo atualizado';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Falha ao carregar o editor de metadados';

  @override
  String get adminNoPeopleEntries => 'Nenhuma entrada de pessoas';

  @override
  String get adminNoExternalIds => 'Nenhum ID externo disponível';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Formato de imagem não suportado';

  @override
  String get adminImageReadFailed => 'Falha ao ler a imagem selecionada';

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
  String get adminNoRemoteImages => 'Nenhuma imagem remota encontrada';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Adicionar sintonizador';

  @override
  String get adminTunerType => 'Tipo de sintonizador';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Outro';

  @override
  String get adminUrlPath => 'URL/Caminho';

  @override
  String get adminNameOptional => 'Nome (opcional)';

  @override
  String get adminTunerAdded => 'Sintonizador adicionado';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Adicionar provedor de guia';

  @override
  String get adminProviderType => 'Tipo de provedor';

  @override
  String get adminProviderTypeHint => 'HoráriosDirect ou XMLTV';

  @override
  String get adminUsernameOptional => 'Nome de usuário (opcional)';

  @override
  String get adminRefreshInterval => 'Intervalo de atualização (horas)';

  @override
  String get adminProviderAdded => 'Provedor adicionado';

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
      'Solicitação de redefinição do sintonizador';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Configurações de gravação';

  @override
  String get adminPrePadding => 'Pré-preenchimento (minutos)';

  @override
  String get adminPostPadding => 'Pós-preenchimento (minutos)';

  @override
  String get adminRecordingPath => 'Caminho de gravação';

  @override
  String get adminSeriesRecordingPath => 'Caminho de gravação da série';

  @override
  String get adminRecordingSettingsSaved => 'Configurações de gravação salvas';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings => 'Definir mapeamentos de canais';

  @override
  String get adminMappingJson => 'Mapeando JSON';

  @override
  String get adminMappingJsonHint => 'Exemplo: mapeamentos de carga JSON';

  @override
  String get adminChannelMappingsUpdated => 'Mapeamentos de canais atualizados';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Falha ao carregar a administração de TV ao vivo';

  @override
  String get adminTunerDevices => 'Dispositivos sintonizadores';

  @override
  String get adminNoTunerHosts => 'Nenhum host do sintonizador configurado';

  @override
  String get adminGuideProviders => 'Provedores de guias';

  @override
  String get adminAddProvider => 'Adicionar provedor';

  @override
  String get adminNoListingProviders =>
      'Nenhum provedor de listagem configurado';

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
  String get adminTunerDiscovery => 'Descoberta do sintonizador';

  @override
  String get adminChannelMappings => 'Mapeamentos de canais';

  @override
  String get adminNoDiscoveredTuners => 'Nenhum sintonizador descoberto ainda';

  @override
  String get adminSettingsSaved => 'Configurações salvas';

  @override
  String get adminBackupsNotAvailable =>
      'Os backups não estão disponíveis nesta compilação de servidor.';

  @override
  String get adminRestoreWarning1 =>
      'A restauração substituirá TODOS os dados atuais do servidor pelos dados de backup.';

  @override
  String get adminRestoreWarning2 =>
      'As configurações atuais do servidor, usuários e dados da biblioteca serão substituídos.';

  @override
  String get adminRestoreWarning3 =>
      'O servidor será reiniciado após a restauração.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Restauração solicitada. A reinicialização do servidor pode desconectar esta sessão.';

  @override
  String get adminBackupsTitle => 'Cópias de segurança';

  @override
  String get adminUnknownDate => 'Data desconhecida';

  @override
  String get adminUnnamedBackup => 'Backup sem nome';

  @override
  String get adminLiveTvNotAvailable =>
      'A administração de TV ao vivo não está disponível nesta versão de servidor.';

  @override
  String get adminLiveTvTitle => 'Administração de TV ao vivo';

  @override
  String get adminApply => 'Aplicar';

  @override
  String get adminNotSet => 'Não definido';

  @override
  String get adminReset => 'Reiniciar';

  @override
  String get adminLogsTitle => 'Registros do servidor';

  @override
  String get adminLogsNewestFirst => 'Mais novo primeiro';

  @override
  String get adminLogsOldestFirst => 'Mais antigo primeiro';

  @override
  String get adminLogsJustNow => 'Agora mesmo';

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
  String get adminLogViewerNoMatches => 'Nenhuma linha correspondente';

  @override
  String get adminMetadataEditorTitle => 'Editor de metadados';

  @override
  String get adminMetadataRemote => 'Remoto';

  @override
  String get adminMetadataType => 'Tipo';

  @override
  String get adminMetadataDetails => 'Detalhes';

  @override
  String get adminMetadataExternalIds => 'IDs externos';

  @override
  String get adminMetadataImages => 'Imagens';

  @override
  String get adminMetadataFieldTitle => 'Título';

  @override
  String get adminMetadataFieldSortTitle => 'Classificar título';

  @override
  String get adminMetadataFieldOriginalTitle => 'Título original';

  @override
  String get adminMetadataFieldPremiereDate => 'Data de estreia (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data de término (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Ano de produção';

  @override
  String get adminMetadataFieldOfficialRating => 'Classificação oficial';

  @override
  String get adminMetadataFieldCommunityRating => 'Avaliação da comunidade';

  @override
  String get adminMetadataFieldCriticRating => 'Avaliação crítica';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Visão geral';

  @override
  String get adminMetadataGenres => 'Gêneros';

  @override
  String get adminMetadataTags => 'Etiquetas';

  @override
  String get adminMetadataStudios => 'Estúdios';

  @override
  String get adminMetadataPeople => 'Pessoas';

  @override
  String get adminMetadataAddGenre => 'Adicionar gênero';

  @override
  String get adminMetadataAddTag => 'Adicionar etiqueta';

  @override
  String get adminMetadataAddStudio => 'Adicionar estúdio';

  @override
  String get adminMetadataAddPerson => 'Adicionar pessoa';

  @override
  String get adminMetadataEditPerson => 'Editar pessoa';

  @override
  String get adminMetadataRole => 'Papel';

  @override
  String get adminMetadataImagePrimary => 'Primário';

  @override
  String get adminMetadataImageBackdrop => 'Pano de fundo';

  @override
  String get adminMetadataImageLogo => 'Logotipo';

  @override
  String get adminMetadataImageBanner => 'Bandeira';

  @override
  String get adminMetadataImageThumb => 'Dedão';

  @override
  String get adminMetadataRecursive => 'Recursivo';

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
      'Falha ao ler a imagem selecionada';

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
      'Isso remove a imagem atual do item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Carregar';

  @override
  String get adminMetadataUpdate => 'Atualizar';

  @override
  String get adminMetadataRemoteImage => 'Imagem remota';

  @override
  String get adminPluginsInstalled => 'Instalado';

  @override
  String get adminPluginsCatalog => 'Catálogo';

  @override
  String get adminPluginsActive => 'Ativo';

  @override
  String get adminPluginsRestart => 'Reiniciar';

  @override
  String get adminPluginsNoSearchResults =>
      'Nenhum plug-in corresponde à sua pesquisa';

  @override
  String get adminPluginsNoneInstalled => 'Nenhum plug-in instalado';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Atualização disponível';

  @override
  String get adminPluginsPendingRemoval =>
      'Remoção pendente após reinicialização';

  @override
  String get adminPluginsChangesPending =>
      'Alterações pendentes de reinicialização';

  @override
  String get adminPluginsEnable => 'Habilitar';

  @override
  String get adminPluginsDisable => 'Desativar';

  @override
  String get adminPluginsInstallUpdate => 'Instalar atualização';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nenhum pacote corresponde à sua pesquisa';

  @override
  String get adminPluginsCatalogEmpty => 'Nenhum pacote disponível';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integração Experimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'A integração das configurações do plugin ainda é experimental. Alguns campos ou layouts podem ainda não ser renderizados corretamente.';

  @override
  String get adminPluginDetailToggle404 =>
      'Falha ao alternar o plugin. O servidor não conseguiu encontrar esta versão do plugin. Tente atualizar os plug-ins e tente novamente.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Falha ao alternar o plugin. Verifique os logs do servidor para obter detalhes.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Detalhes';

  @override
  String get adminPluginDetailDeveloper => 'Desenvolvedor';

  @override
  String get adminPluginDetailRepository => 'Repositório';

  @override
  String get adminPluginDetailBundled => 'Empacotado';

  @override
  String get adminPluginDetailEnablePlugin => 'Habilitar plug-in';

  @override
  String get adminPluginDetailRestartRequired =>
      'É necessário reiniciar o servidor para que as alterações tenham efeito.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Este plugin será removido após a reinicialização do servidor.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Este plugin não funcionou corretamente e pode não funcionar corretamente.';

  @override
  String get adminPluginDetailNotSupported =>
      'Este plugin não é compatível com a versão atual do servidor.';

  @override
  String get adminPluginDetailSuperseded =>
      'Este plugin foi substituído por uma versão mais recente.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Remover repositório';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Remover';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Nenhum repositório configurado';

  @override
  String get adminReposEmptySubtitle =>
      'Adicione um repositório para navegar pelos plug-ins disponíveis';

  @override
  String get adminReposUnnamed => '(sem nome)';

  @override
  String get adminReposEditTitle => 'Editar repositório';

  @override
  String get adminReposAddTitle => 'Adicionar repositório';

  @override
  String get adminReposUrl => 'URL do repositório';

  @override
  String get adminReposNameHint => 'por exemplo Estável Jellyfin';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL inválido';

  @override
  String get adminGeneralSettingsTitle => 'Configurações Gerais';

  @override
  String get adminGeneralMetadataLanguage => 'Idioma de metadados preferido';

  @override
  String get adminGeneralMetadataLanguageHint => 'por exemplo en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'País de metadados preferido';

  @override
  String get adminGeneralMetadataCountryHint => 'por exemplo EUA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Simultaneidade de verificação de biblioteca';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limite de codificação de imagem paralela';

  @override
  String get adminUnknownError => 'Erro desconhecido';

  @override
  String get adminBrowse => 'Navegar';

  @override
  String get adminCloseBrowser => 'Fechar navegador';

  @override
  String get adminNetworkingTitle => 'Rede';

  @override
  String get adminNetworkingRestartWarning =>
      'As alterações nas configurações de rede podem exigir a reinicialização do servidor.';

  @override
  String get adminNetworkingRemoteAccess => 'Habilitar acesso remoto';

  @override
  String get adminNetworkingPorts => 'Portas';

  @override
  String get adminNetworkingHttpPort => 'Porta HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Porta HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Habilitar HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Rede local';

  @override
  String get adminNetworkingLocalAddresses => 'Endereços de rede local';

  @override
  String get adminNetworkingAddressHint => 'por exemplo 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxies conhecidos';

  @override
  String get adminNetworkingProxyHint => 'por exemplo 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista de permissões';

  @override
  String get adminNetworkingBlacklist => 'Lista negra';

  @override
  String get adminNetworkingAddEntry => 'Adicionar entrada';

  @override
  String get adminBrandingTitle => 'Marca';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Isenção de responsabilidade de login';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML exibido abaixo do formulário de login';

  @override
  String get adminBrandingCustomCss => 'CSS personalizado';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizado aplicado à interface web';

  @override
  String get adminBrandingEnableSplash => 'Ativar tela inicial';

  @override
  String get adminPlaybackHwAccel => 'Aceleração de Hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Aceleração de hardware';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Habilitar codificação de hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Habilite a decodificação de hardware para:';

  @override
  String get adminPlaybackEncoding => 'Codificação';

  @override
  String get adminPlaybackEncodingThreads => 'Codificação de threads';

  @override
  String get adminPlaybackFallbackFont => 'Ativar fonte substituta';

  @override
  String get adminPlaybackFallbackFontPath => 'Caminho da fonte substituta';

  @override
  String get adminPlaybackStreaming => 'Transmissão';

  @override
  String get adminResumeVideo => 'Vídeo';

  @override
  String get adminResumeAudiobooks => 'Audiolivros';

  @override
  String get adminResumeMinAudiobookPct =>
      'Porcentagem mínima de currículo de audiolivro';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Porcentagem máxima de currículo de audiolivro';

  @override
  String get adminStreamingBitrateLimit =>
      'Limite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Deixe em branco ou 0 para ilimitado';

  @override
  String get adminTrickplayHwAccel => 'Habilitar aceleração de hardware';

  @override
  String get adminTrickplayHwEncoding => 'Habilitar codificação de hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Ativar extração somente de quadro-chave';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Mais rápido, mas com menor precisão';

  @override
  String get adminTrickplayNonBlocking => 'Sem bloqueio';

  @override
  String get adminTrickplayBlocking => 'Bloqueio';

  @override
  String get adminTrickplayPriorityHigh => 'Alto';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Acima do normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Abaixo do normal';

  @override
  String get adminTrickplayPriorityIdle => 'Parado';

  @override
  String get adminTrickplayImageSettings => 'Configurações de imagem';

  @override
  String get adminTrickplayInterval => 'Intervalo (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Com que frequência capturar quadros';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Larguras de pixels separadas por vírgula (por exemplo, 320)';

  @override
  String get adminTrickplayQuality => 'Qualidade';

  @override
  String get adminTrickplayQScale => 'Escala de qualidade';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valores mais baixos = melhor qualidade, arquivos maiores';

  @override
  String get adminTrickplayJpegQuality => 'Qualidade JPEG';

  @override
  String get adminTrickplayProcessing => 'Processamento';

  @override
  String get adminTasksEmpty => 'Nenhuma tarefa agendada encontrada';

  @override
  String get adminTasksNoFilterMatch =>
      'Nenhuma tarefa corresponde ao filtro atual';

  @override
  String get adminTaskCancelling => 'Cancelando...';

  @override
  String get adminTaskRunning => 'Correndo...';

  @override
  String get adminTaskNeverRun => 'Nunca corra';

  @override
  String get adminTaskStop => 'Parar';

  @override
  String get adminTaskRun => 'Correr';

  @override
  String get adminTaskDetailLastExecution => 'Última Execução';

  @override
  String get adminTaskDetailStarted => 'Iniciado';

  @override
  String get adminTaskDetailEnded => 'Terminou';

  @override
  String get adminTaskDetailDuration => 'Duração';

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
  String get adminTaskTriggerStartup => 'Na inicialização do aplicativo';

  @override
  String get adminTaskTriggerTypeDaily => 'Diário';

  @override
  String get adminTaskTriggerTypeWeekly => 'Semanalmente';

  @override
  String get adminTaskTriggerTypeInterval => 'Em um intervalo';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalo';

  @override
  String get adminTaskTriggerEveryHour => 'A cada hora';

  @override
  String get adminTaskTriggerEvery6Hours => 'A cada 6 horas';

  @override
  String get adminTaskTriggerEvery12Hours => 'A cada 12 horas';

  @override
  String get adminTaskTriggerEvery24Hours => 'A cada 24 horas';

  @override
  String get adminTaskTriggerEvery2Days => 'A cada 2 dias';

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
  String get adminTaskTriggerNoLimit => 'Sem limite';

  @override
  String get adminActivityJustNow => 'Agora mesmo';

  @override
  String get adminActivityLastHour => 'Última hora';

  @override
  String get adminActivityToday => 'Hoje';

  @override
  String get adminActivityYesterday => 'Ontem';

  @override
  String get adminActivityOlder => 'Mais velho';

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
      'Configure a geração de imagens trickplay para miniaturas de visualização de busca.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminNetworkingBaseUrl => 'URL base';

  @override
  String get adminNetworkingBaseUrlHint => 'por exemplo /geleia';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Caminho do certificado';

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
      'Caminho temporário de transcodificação';

  @override
  String get adminPlaybackSegmentDeletion => 'Permitir exclusão de segmento';

  @override
  String get adminPlaybackSegmentKeep => 'Manter segmento (segundos)';

  @override
  String get adminPlaybackThrottleBuffering => 'Buffer de aceleração';

  @override
  String get adminResumeMinPct => 'Porcentagem mínima de currículo';

  @override
  String get adminResumeMinPctSubtitle =>
      'O conteúdo deve ser reproduzido além dessa porcentagem para salvar o progresso';

  @override
  String get adminResumeMaxPct => 'Porcentagem máxima de currículo';

  @override
  String get adminResumeMaxPctSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta porcentagem';

  @override
  String get adminResumeMinDuration => 'Duração mínima do currículo (segundos)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Itens menores que isso não são recuperáveis';

  @override
  String get adminTrickplayScanBehavior => 'Comportamento de verificação';

  @override
  String get adminTrickplayProcessPriority => 'Prioridade do processo';

  @override
  String get adminTrickplayTileWidth => 'Largura do ladrilho';

  @override
  String get adminTrickplayTileHeight => 'Altura do ladrilho';

  @override
  String get adminTrickplayProcessThreads => 'Threads de processo';

  @override
  String get adminTrickplayWidthResolutions => 'Resoluções de largura';

  @override
  String get adminMetadataDefault => 'Padrão';

  @override
  String get adminMetadataContentTypeUpdated => 'Tipo de conteúdo atualizado';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Limite de resposta lenta (ms)';

  @override
  String get adminGeneralCachePath => 'Caminho do cache';

  @override
  String get adminGeneralMetadataPath => 'Caminho de metadados';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminSettingsLoadFailed => 'Falha ao carregar as configurações';

  @override
  String get adminDiscover => 'Descobrir';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Pastas';

  @override
  String get libraries => 'Bibliotecas';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay desativado';

  @override
  String get syncPlayDisabledMessage =>
      'Ative o SyncPlay em Configurações para usar a reprodução sincronizada.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Servidor não suportado';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay requer um servidor Jellyfin. O servidor atual não oferece suporte.';

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
  String get syncPlayIgnoreWait => 'Ignorar espera';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Não segure o grupo enquanto este dispositivo armazena em buffer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continue localmente sem esperar por membros lentos';

  @override
  String get syncPlayRepeat => 'Repita';

  @override
  String get syncPlayRepeatOne => 'Um';

  @override
  String get syncPlayShuffleModeShuffled => 'Embaralhado';

  @override
  String get syncPlayShuffleModeSorted => 'Classificado';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronizar a fila de reprodução atual';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Substitua a fila do grupo pelo que está sendo reproduzido localmente';

  @override
  String get syncPlayLeaveGroup => 'Sair do grupo';

  @override
  String get syncPlayGroupQueue => 'Fila de grupo';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Jogue agora';

  @override
  String get syncPlayCreateNewGroup => 'Crie um novo grupo';

  @override
  String get syncPlayGroupName => 'Nome do grupo';

  @override
  String get syncPlayDefaultGroupName => 'Meu grupo SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Criar grupo';

  @override
  String get syncPlayAvailableGroups => 'Grupos disponíveis';

  @override
  String get syncPlayNoGroupsAvailable => 'Nenhum grupo disponível';

  @override
  String get syncPlayJoinGroupQuestion => 'Participar do grupo SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Participar de um grupo SyncPlay pode substituir sua fila de reprodução atual. Continuar?';

  @override
  String get syncPlayJoin => 'Juntar';

  @override
  String get syncPlayStateIdle => 'Parado';

  @override
  String get syncPlayStateWaiting => 'Esperando';

  @override
  String get syncPlayStatePaused => 'Pausado';

  @override
  String get syncPlayStatePlaying => 'Jogando';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Acesso ao SyncPlay negado';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Você não tem acesso a um ou mais itens neste grupo SyncPlay. Peça ao proprietário do grupo para verificar as permissões da biblioteca ou escolha uma fila diferente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'A pesquisa por voz não está disponível.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Falha na reprodução direta do Dolby Vision';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'A reprodução direta não foi iniciada para esta transmissão Dolby Vision. Tentar novamente usando a transcodificação do servidor?';

  @override
  String get retryWithTranscode => 'Tentar novamente com transcodificação';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision não compatível';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Este dispositivo não pode decodificar conteúdo Dolby Vision diretamente. Use o substituto HDR10 ou solicite a transcodificação do servidor.';

  @override
  String get rememberMyChoice => 'Lembre-se da minha escolha';

  @override
  String get playHdr10Fallback => 'Reproduzir substituto HDR10';

  @override
  String get requestTranscode => 'Solicitar transcodificação';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Detecte linhas expostas pelo plugin \"Home Screen Sections\" do IAmParadox27. As linhas podem ser habilitadas e reordenadas abaixo.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Nenhum servidor Jellyfin reportando o plugin ainda.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Detecte linhas configuradas por meio do plugin \"KefinTweaks\" do ranaldsgift. Seções personalizadas, lançadas recentemente, assistidas novamente, sazonais e adicionadas recentemente na biblioteca são espelhadas da configuração KefinTweaks em cada servidor Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Nenhum servidor Jellyfin reportando KefinTweaks ainda.';

  @override
  String get integrationOpenHomeSections => 'Abrir seções iniciais';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Ativar, desativar e reordenar linhas';

  @override
  String get integrationInstalledButDisabled => 'Instalado, mas desativado';

  @override
  String get integrationNotInstalled => 'Não instalado';

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
  String get seeAll => 'Ver tudo';

  @override
  String get noItems => 'Nenhum item';

  @override
  String get switchUser => 'Trocar usuário';

  @override
  String get remoteControl => 'Controle remoto';

  @override
  String get mediaBarLoading => 'Carregando barra de mídia...';

  @override
  String get mediaBarError => 'A barra de mídia não foi carregada';

  @override
  String get offlineServerUnavailable =>
      'Conectado à Internet, mas o servidor atual não está disponível.';

  @override
  String get offlineNoInternet =>
      'Você está off-line. Apenas o conteúdo baixado está disponível.';

  @override
  String get offlineFileNotAvailable => 'Arquivo não disponível';

  @override
  String get offlineSwitchServer => 'Trocar servidor';

  @override
  String get offlineSavedMedia => 'Mídia salva';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Reprodução Remota';

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
  String get castVolumeUnavailable => 'Indisponível';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Áudio';

  @override
  String get subtitlesLabel => 'Legendas';

  @override
  String get pinConfirmTitle => 'Confirmar PIN';

  @override
  String get pinSetTitle => 'Definir PIN';

  @override
  String get pinEnterTitle => 'Insira o PIN';

  @override
  String get pinReenterToConfirm => 'Digite novamente seu PIN para confirmar';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN incorreto';

  @override
  String get pinMismatch => 'Os PINs não correspondem';

  @override
  String get pinForgot => 'Esqueceu o PIN?';

  @override
  String get pinClear => 'Claro';

  @override
  String get pinBackspace => 'Retrocesso';

  @override
  String get quickConnectAuthorized =>
      'Solicitação de conexão rápida autorizada.';

  @override
  String get quickConnectInvalidOrExpired =>
      'O código do Quick Connect é inválido ou expirou.';

  @override
  String get quickConnectNotSupported =>
      'O Quick Connect não é compatível com este servidor.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Falha ao autorizar o código do Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'O Quick Connect está desabilitado neste servidor.';

  @override
  String get quickConnectForbidden =>
      'Sua conta não pode autorizar esta solicitação do Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'O código do Quick Connect não foi encontrado. Experimente um novo código.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Insira o código';

  @override
  String get quickConnectAuthorize => 'Autorizar';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Controle remoto';

  @override
  String get remoteFailedToLoadSessions => 'Falha ao carregar sessões';

  @override
  String get remoteNoSessions => 'Sem sessões controláveis';

  @override
  String get remoteStartPlayback => 'Iniciar a reprodução em outro dispositivo';

  @override
  String get unknownUser => 'Desconhecido';

  @override
  String get unknownItem => 'Desconhecido';

  @override
  String get remoteNothingPlaying => 'Nada tocando nesta sessão';

  @override
  String get castingStarted =>
      'A transmissão começou no dispositivo selecionado';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nenhum dispositivo de reprodução remota disponível.';

  @override
  String get noRemoteDevicesIos =>
      'Nenhum dispositivo de reprodução remota disponível.\n\nNo iOS, os alvos AirPlay podem estar indisponíveis no simulador.';

  @override
  String get trackActionPlayNext => 'Jogue a seguir';

  @override
  String get trackActionAddToQueue => 'Adicionar à fila';

  @override
  String get trackActionAddToPlaylist => 'Adicionar à lista de reprodução';

  @override
  String get trackActionCancelDownload => 'Cancelar download';

  @override
  String get trackActionDeleteFromPlaylist => 'Excluir da lista de reprodução';

  @override
  String get trackActionMoveUp => 'Subir';

  @override
  String get trackActionMoveDown => 'Mover para baixo';

  @override
  String get trackActionRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get trackActionAddToFavorites => 'Adicionar aos Favoritos';

  @override
  String get trackActionGoToAlbum => 'Ir para o álbum';

  @override
  String get trackActionGoToArtist => 'Ir para o Artista';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Arquivo baixado excluído';

  @override
  String get trackActionDeleteFileFailed =>
      'Não foi possível excluir o arquivo baixado';

  @override
  String get shuffleBy => 'Embaralhar por';

  @override
  String get shuffleSelectLibrary => 'Selecione Biblioteca';

  @override
  String get shuffleSelectGenre => 'Selecione o gênero';

  @override
  String get shuffleLibrary => 'Biblioteca';

  @override
  String get shuffleGenre => 'Gênero';

  @override
  String get shuffleNoLibraries => 'Nenhuma biblioteca compatível disponível.';

  @override
  String get shuffleNoGenres =>
      'Nenhum gênero encontrado para este modo aleatório.';

  @override
  String get posterDisplayTitle => 'Mostrar';

  @override
  String get posterImageType => 'Tipo de imagem';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Bandeira';

  @override
  String get playlistAddFailed => 'Falha ao adicionar à playlist';

  @override
  String get playlistCreateFailed => 'Falha ao criar lista de reprodução';

  @override
  String get playlistNew => 'Nova lista de reprodução';

  @override
  String get playlistCreate => 'Criar';

  @override
  String get playlistCreateNew => 'Criar nova lista de reprodução';

  @override
  String get playlistNoneFound => 'Nenhuma playlist encontrada';

  @override
  String get addToPlaylist => 'Adicionar à lista de reprodução';

  @override
  String get lyricsNotAvailable => 'Nenhuma letra disponível';

  @override
  String get upNext => 'A seguir';

  @override
  String get playNext => 'Jogue a seguir';

  @override
  String get stillWatchingContent =>
      'A reprodução foi pausada. Você ainda está assistindo?';

  @override
  String get stillWatchingStop => 'Parar';

  @override
  String get stillWatchingContinue => 'Continuar';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV ao vivo';

  @override
  String get continueWatchingAndNextUp => 'Continue assistindo e próximo';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Próximo episódio';

  @override
  String get moreFromThisSeason => 'Mais desta temporada';

  @override
  String get playerTooltipPlaybackSpeed => 'Velocidade de reprodução';

  @override
  String get playerTooltipCastControls => 'Controles de transmissão';

  @override
  String get playerTooltipPlaybackQuality => 'Taxa de bits';

  @override
  String get playerTooltipEnterFullscreen => 'Entrar em tela cheia';

  @override
  String get playerTooltipExitFullscreen => 'Sair da tela cheia';

  @override
  String get playerTooltipFloatOnTop => 'Flutuar no topo';

  @override
  String get playerTooltipExitFloatOnTop => 'Desativar flutuação no topo';

  @override
  String get playerTooltipLockLandscape => 'Bloquear paisagem';

  @override
  String get playerTooltipUnlockOrientation => 'Permitir rotação';

  @override
  String get playerTooltipPrevious => 'Anterior';

  @override
  String get playerTooltipSeekBack => 'Procure de volta';

  @override
  String get playerTooltipSeekForward => 'Procure avançar';

  @override
  String get contextMenuMarkWatched => 'Marcar como assistido';

  @override
  String get contextMenuMarkUnwatched => 'Marcar como não assistido';

  @override
  String get contextMenuAddToFavorites => 'Adicionar aos Favoritos';

  @override
  String get contextMenuRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get contextMenuGoToSeries => 'Ir para a série';

  @override
  String get settingsAdministrationSubtitle =>
      'Acesse o painel de administração do servidor';

  @override
  String get settingsAccountSecurity => 'Conta e segurança';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autenticação, código PIN e controle dos pais';

  @override
  String get settingsPersonalization => 'Personalização';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navegação, linhas iniciais e visibilidade da biblioteca';

  @override
  String get settingsDynamicContent => 'Conteúdo Dinâmico';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra de mídia e sobreposições visuais';

  @override
  String get settingsPlaybackSyncplay => 'Reprodução e SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Configurações de áudio/vídeo, legendas, downloads e controles do SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sincronização de plug-ins, Seerr, classificações e muito mais';

  @override
  String get settingsAboutSubtitle =>
      'Versão do aplicativo, informações legais e créditos';

  @override
  String get settingsAuthenticationSection => 'AUTENTICAÇÃO';

  @override
  String get settingsSortServersBy => 'Classificar servidores por';

  @override
  String get settingsLastUsed => 'Último uso';

  @override
  String get settingsAlphabetical => 'Alfabético';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACIDADE E SEGURANÇA';

  @override
  String get settingsBlockedRatings => 'Avaliações bloqueadas';

  @override
  String get settingsGeneralStyle => 'Estilo Geral';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Acentos temáticos, cenários, indicadores assistidos e música temática';

  @override
  String get settingsHomePage => 'Página inicial';

  @override
  String get settingsHomePageSubtitle =>
      'Seções, tipos de imagens, sobreposições e visualizações de mídia';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilidade da biblioteca, visualização de pastas e comportamento multiservidor';

  @override
  String get settingsTwentyFourHourClock => 'Relógio de 24 horas';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Use a formatação de 24 horas sempre que o relógio for mostrado';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Mostrar o botão aleatório na barra de navegação';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Mostrar o botão de gêneros na barra de navegação';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Mostrar o botão de favoritos na barra de navegação';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostrar o botão de bibliotecas na barra de navegação';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicie o Moonfin para que as alterações tenham efeito.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barra de mídia e visualizações locais';

  @override
  String get settingsVisualOverlays => 'Sobreposições visuais';

  @override
  String get settingsSeasonalSurprise => 'Surpresa sazonal';

  @override
  String get settingsMetadataAndRatings => 'Metadados e classificações';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase possibilita integrações do lado do servidor, incluindo fontes de classificação adicionais, solicitações Seerr e preferências sincronizadas.';

  @override
  String get settingsOfflineDownloads => 'Downloads off-line';

  @override
  String get settingsHigh => 'Alto';

  @override
  String get settingsLow => 'Baixo';

  @override
  String get settingsCustomPath => 'Caminho personalizado';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Digite o caminho da pasta de download';

  @override
  String get settingsConcurrentDownloads => 'Downloads simultâneos';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Número máximo de itens para download de uma vez.';

  @override
  String get settingsAppInfo => 'INFORMAÇÕES DO APLICATIVO';

  @override
  String get settingsReportAnIssue => 'Informar um problema';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Abra o rastreador de problemas no GitHub';

  @override
  String get settingsJoinDiscord => 'Junte-se a Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Converse com a comunidade';

  @override
  String get settingsJoinTheDiscord => 'Participe do Discord';

  @override
  String get settingsSupportMoonfin => 'Apoie Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Donate a coffee to the developer';

  @override
  String get settingsLegal => 'JURÍDICO';

  @override
  String get settingsLicenses => 'Licenças';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avisos de licença de código aberto';

  @override
  String get settingsPrivacyPolicy => 'política de Privacidade';

  @override
  String get settingsPrivacyPolicySubtitle => 'Como Moonfin trata seus dados';

  @override
  String get settingsCheckForUpdates => 'Verifique se há atualizações';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Verifique o último lançamento do Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Desenvolvido por Flutter';

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
      'Filtro de tipo de conteúdo aleatório';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferências de reprodução de vídeo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Mecanismo de vídeo principal e configurações de qualidade de streaming';

  @override
  String get settingsAudioPreferences => 'Preferências de áudio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Faixas de áudio, processamento e opções de passagem';

  @override
  String get settingsAutomationAndQueue => 'Automação e fila';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Reprodução e sequenciamento automatizados';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Qualidade de download, limites de armazenamento e tamanho da fila';

  @override
  String get settingsSyncplaySubtitle =>
      'Lógica de sincronização para sessões de grupo';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Recursos especializados do jogador. Use com cuidado, pois algumas opções podem causar problemas de reprodução';

  @override
  String get settingsSkipIntrosAndOutros => 'Pular introduções e outros?';

  @override
  String get settingsPromptUser => 'Solicitar usuário';

  @override
  String get settingsSkip => 'Pular';

  @override
  String get settingsDoNothing => 'Não faça nada';

  @override
  String get settingsMaxBitrateDescription =>
      'Limite a taxa de bits do streaming. O conteúdo acima desse limite será transcodificado para caber.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limite a resolução máxima que o player irá solicitar. O conteúdo de resolução mais alta será transcodificado.';

  @override
  String get settingsPlayerZoomDescription =>
      'Como o vídeo deve ser dimensionado para caber na tela.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Mecanismo de reprodução (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Escolha o mecanismo de reprodução padrão em dispositivos Android TV. As alterações se aplicam à próxima sessão de reprodução.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recomendado)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (legado)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Substituição Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportamento para títulos Dolby Vision em dispositivos sem decodificação Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Pergunte sempre';

  @override
  String get settingsPreferHdr10Fallback => 'Prefira substituto HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Prefira a transcodificação do servidor';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Perfil Dolby Vision 7 Reprodução direta';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controla se os fluxos de camada de aprimoramento do perfil Dolby Vision 7 devem direcionar a reprodução.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automático (AFTKRT habilitado)';

  @override
  String get settingsEnabledOnThisDevice => 'Ativado neste dispositivo';

  @override
  String get settingsDisabledPreferTranscode =>
      'Desativado (prefira transcodificação)';

  @override
  String get settingsResumeRewindDescription =>
      'Ao retomar a reprodução (a partir de Continuar assistindo ou de uma página de item de mídia), quantos segundos devem ser retrocedidos?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Ao retomar a reprodução após pressionar o botão de pausa, quantos segundos devem ser retrocedidos?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Quantos segundos para voltar depois de pressionar o botão de retrocesso.';

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
      'Quantos segundos para avançar depois de pressionar o botão de avanço rápido.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 para decodificador externo';

  @override
  String get settingsCinemaMode => 'Modo Cinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Reproduzir trailers/prerolls antes de um filme principal';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended mostra um cartão completo com a arte e a descrição do episódio. Mínimo mostra uma sobreposição compacta de contagem regressiva. Desativado oculta totalmente o prompt.';

  @override
  String get settingsShort => 'Curto';

  @override
  String get settingsLong => 'Longo';

  @override
  String get settingsVeryLong => 'Muito Longo';

  @override
  String get settingsVideoStartDelay => 'Atraso no início do vídeo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV ao vivo direto';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Ative a reprodução direta para TV ao vivo';

  @override
  String get settingsOpenGroups => 'Grupos abertos';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Crie, participe ou gerencie grupos SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ativado';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Habilite recursos de observação em grupo';

  @override
  String get settingsSyncplayButton => 'Botão SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostrar o botão SyncPlay na barra de navegação';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correção Avançada';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Habilitar lógica de sincronização refinada';

  @override
  String get settingsSyncplaySyncCorrection => 'Correção de sincronização';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Ajuste automaticamente a reprodução para permanecer sincronizado';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocidade para sincronizar';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Use o ajuste da velocidade de reprodução para sincronizar';

  @override
  String get settingsSyncplaySkipToSync => 'Pular para sincronizar';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Use a busca para sincronizar';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Atraso mínimo de velocidade';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Atraso de velocidade máxima';

  @override
  String get settingsSyncplaySpeedDuration => 'Duração da velocidade';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Atraso mínimo para ignorar';

  @override
  String get settingsSyncplayExtraOffset => 'Deslocamento extra do SyncPlay';

  @override
  String get onNow => 'Ativado agora';

  @override
  String get collections => 'Coleções';

  @override
  String get lastPlayed => 'Jogado pela última vez';

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
  String get whenFullscreen => 'Quando em tela cheia';

  @override
  String get transcodingLimits => 'Limites de transcodificação';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appTitle => 'Barbatana Lunar';

  @override
  String get signIn => 'Entrar';

  @override
  String connectingToServer(String serverName) {
    return 'Conectando-se a $serverName';
  }

  @override
  String get quickConnect => 'Conexão rápida';

  @override
  String get password => 'Senha';

  @override
  String get username => 'Nome de usuário';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Insira este código no painel web do seu servidor:';

  @override
  String get waitingForAuthorization => 'Aguardando autorização...';

  @override
  String get back => 'Voltar';

  @override
  String get serverUnavailable => 'O servidor não está disponível';

  @override
  String get loginFailed => 'falha no login';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect indisponível: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect indisponível ($status): $detail';
  }

  @override
  String get whosWatching => 'Quem está assistindo?';

  @override
  String get addUser => 'Adicionar usuário';

  @override
  String get selectServer => 'Selecione Servidor';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin versão $version';
  }

  @override
  String get savedServers => 'Servidores salvos';

  @override
  String get discoveredServers => 'Servidores descobertos';

  @override
  String get noneFound => 'Nenhum encontrado';

  @override
  String get unableToConnectToServer => 'Não foi possível conectar ao servidor';

  @override
  String get addServer => 'Adicionar servidor';

  @override
  String get embyConnect => 'Emby Conectar';

  @override
  String get removeServer => 'Remover servidor';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remover \"$serverName\" dos seus servidores?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get remove => 'Remover';

  @override
  String get connectToServer => 'Conecte-se ao servidor';

  @override
  String get serverAddress => 'Endereço do servidor';

  @override
  String get serverAddressHint => 'https://seu-servidor.exemplo.com';

  @override
  String get connect => 'Conectar';

  @override
  String get secureStorageUnavailable => 'Armazenamento seguro indisponível';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin não conseguiu acessar o chaveiro do seu sistema. O login pode continuar, mas o armazenamento seguro de tokens pode ficar indisponível até que o chaveiro seja desbloqueado.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema do aplicativo';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alterne entre Moonfin e Neon Pulse sem reiniciar o aplicativo';

  @override
  String get keyboardPreferSystemIme => 'Prefira o teclado do sistema';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use o método de entrada do seu dispositivo por padrão para entrada de texto';

  @override
  String get themeMoonfin => 'Barbatana Lunar';

  @override
  String get themeMoonfinSubtitle =>
      'Look atual do Moonfin que todos vocês adoraram';

  @override
  String get themeNeonPulse => 'Pulso de néon';

  @override
  String get themeNeonPulseSubtitle =>
      'Estilo Synthwave com brilho magenta, texto ciano e contraste cromado mais forte';

  @override
  String get embyConnectSignInSubtitle =>
      'Faça login com sua conta Emby Connect';

  @override
  String get emailOrUsername => 'E-mail ou nome de usuário';

  @override
  String get selectAServer => 'Selecione um servidor';

  @override
  String get tryAgain => 'Tente novamente';

  @override
  String get noLinkedServers =>
      'Nenhum servidor vinculado a esta conta Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Credenciais Emby Connect inválidas';

  @override
  String get invalidEmbyConnectLogin =>
      'Nome de usuário ou senha do Emby Connect inválidos';

  @override
  String get embyConnectExchangeNotSupported =>
      'O servidor não suporta troca Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Erro de rede ao entrar em contato com o Emby Connect ou o servidor selecionado';

  @override
  String get loadingLinkedServers => 'Carregando servidores vinculados...';

  @override
  String get connectingToServerEllipsis => 'Conectando ao servidor...';

  @override
  String get noReachableAddress => 'Nenhum endereço acessível fornecido';

  @override
  String get invalidServerExchangeResponse =>
      'Resposta inválida do endpoint de troca do servidor';

  @override
  String unableToConnectTo(String target) {
    return 'Não foi possível conectar-se a $target';
  }

  @override
  String get exitApp => 'Sair do Moonfin?';

  @override
  String get exitAppConfirmation => 'Tem certeza de que deseja sair?';

  @override
  String get exit => 'Saída';

  @override
  String get noHomeRowsLoaded => 'Nenhuma linha inicial pôde ser carregada';

  @override
  String get noHomeRowsHint =>
      'Tente atualizar ou reduzir as seções iniciais ativas.';

  @override
  String get retryHomeRows => 'Tentar novamente as linhas iniciais';

  @override
  String get guide => 'Guia';

  @override
  String get recordings => 'Gravações';

  @override
  String get schedule => 'Agendar';

  @override
  String get series => 'Série';

  @override
  String get noItemsFound => 'Nenhum item encontrado';

  @override
  String get home => 'Lar';

  @override
  String get browseAll => 'Navegar por tudo';

  @override
  String get genres => 'Gêneros';

  @override
  String get collectionPlaceholder => 'Os itens da coleção aparecerão aqui';

  @override
  String get browseByLetter => 'Navegar por letra';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'A navegação alfabética aparecerá aqui';

  @override
  String get suggestions => 'Sugestões';

  @override
  String get suggestionsPlaceholder => 'Itens sugeridos aparecerão aqui';

  @override
  String get failedToLoadLibraries => 'Falha ao carregar bibliotecas';

  @override
  String get noLibrariesFound => 'Nenhuma biblioteca encontrada';

  @override
  String get library => 'Biblioteca';

  @override
  String get displaySettings => 'Configurações de exibição';

  @override
  String get allGenres => 'Todos os gêneros';

  @override
  String get noGenresFound => 'Nenhum gênero encontrado';

  @override
  String failedToLoadFolderError(String error) {
    return 'Falha ao carregar pasta: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Esta pasta está vazia';

  @override
  String itemCountLabel(int count) {
    return '$count itens';
  }

  @override
  String get failedToLoadFavorites => 'Falha ao carregar favoritos';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get noFavoritesYet => 'Ainda não há favoritos';

  @override
  String get favorites => 'Favoritos';

  @override
  String totalCountItems(int count) {
    return '$count Itens';
  }

  @override
  String get continuing => 'Continuando';

  @override
  String get ended => 'Terminou';

  @override
  String get sortAndFilter => 'Classificar e filtrar';

  @override
  String get type => 'Tipo';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get display => 'Mostrar';

  @override
  String get imageType => 'Tipo de imagem';

  @override
  String get posterSize => 'Tamanho do pôster';

  @override
  String get small => 'Pequeno';

  @override
  String get medium => 'Médio';

  @override
  String get large => 'Grande';

  @override
  String get extraLarge => 'Extra Grande';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Gêneros';
  }

  @override
  String get views => 'Visualizações';

  @override
  String get albums => 'Álbuns';

  @override
  String get albumArtists => 'Artistas do álbum';

  @override
  String get artists => 'Artistas';

  @override
  String get bookmarks => 'Favoritos';

  @override
  String get noSavedBookmarks =>
      'Ainda não há marcadores salvos para este título.';

  @override
  String get openBook => 'Livro aberto';

  @override
  String get chapter => 'Capítulo';

  @override
  String get page => 'Página';

  @override
  String get bookmark => 'Marcador';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String minutesAgo(int count) {
    return '${count}m atrás';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h atrás';
  }

  @override
  String daysAgo(int count) {
    return '${count}d atrás';
  }

  @override
  String get discoverySubjects => 'Assuntos de descoberta';

  @override
  String get pickDiscoverySubjects =>
      'Escolha quais feeds de assuntos serão exibidos no Discover.';

  @override
  String get apply => 'Aplicar';

  @override
  String get openLink => 'Abrir link';

  @override
  String get scanWithYourPhone => 'Digitalize com seu telefone';

  @override
  String get audiobookGenres => 'Gêneros de audiolivros';

  @override
  String get pickAudiobookGenres =>
      'Escolha quais gêneros mostrar no Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Descubra audiolivros';

  @override
  String get librivoxDescription =>
      'Títulos populares de domínio público do LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count títulos';
  }

  @override
  String get scrollLeft => 'Role para a esquerda';

  @override
  String get scrollRight => 'Role para a direita';

  @override
  String get couldNotLoadGenre =>
      'Não foi possível carregar este gênero no momento.';

  @override
  String get continueReading => 'Continuar lendo';

  @override
  String get savedHighlights => 'Destaques salvos';

  @override
  String get continueListening => 'Continuar ouvindo';

  @override
  String get listen => 'Ouvir';

  @override
  String get resume => 'Retomar';

  @override
  String get failedToLoadLibrary => 'Falha ao carregar a biblioteca';

  @override
  String get popularNow => 'Popular agora';

  @override
  String get savedForLater => 'Salvo para mais tarde';

  @override
  String get topListens => 'Principais escutas';

  @override
  String get unreadDiscoveries => 'Descobertas não lidas';

  @override
  String get pickUpAgain => 'Pegue novamente';

  @override
  String get bookHighlightsDescription =>
      'Seus livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get handPickedFromLibrary => 'Escolhido a dedo em sua biblioteca.';

  @override
  String get handPickedFromListeningQueue =>
      'Escolhido a dedo na sua fila de escuta.';

  @override
  String get booksWithHighlights =>
      'Livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get jumpBackNarration =>
      'Volte para a narração sem procurar seu lugar.';

  @override
  String get unreadBooksReady =>
      'Livros não lidos prontos para a próxima hora tranquila.';

  @override
  String get quickAccessFavorites =>
      'Acesso rápido aos livros que você sempre consulta.';

  @override
  String get searchAudiobooks => 'Pesquisar audiolivros';

  @override
  String get searchYourLibrary => 'Pesquise na sua biblioteca';

  @override
  String get pickUpStory => 'Continue a história de onde você parou';

  @override
  String get savedPlacesChapters =>
      'Seus lugares salvos e capítulos inacabados';

  @override
  String authorsCount(int count) {
    return '$count autores';
  }

  @override
  String genresCount(int count) {
    return '$count gêneros';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% concluído';
  }

  @override
  String get readyWhenYouAre => 'Pronto quando você estiver';

  @override
  String get details => 'Detalhes';

  @override
  String get listeningRoom => 'Sala de escuta';

  @override
  String get bookmarksAndProgress => 'Marcadores e progresso';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count títulos organizados para navegação com leitura inicial.';
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
  String get browseByGenre => 'Navegar por gênero';

  @override
  String get discover => 'Descobrir';

  @override
  String get trendingTitlesOpenLibrary =>
      'Títulos populares por assunto da Open Library.';

  @override
  String get noBookmarkedItems => 'Ainda não há itens marcados como favoritos';

  @override
  String get nothingMatchesSection =>
      'Nada corresponde a esta seção ainda. Tente outra guia ou volte após o término da sincronização da biblioteca.';

  @override
  String get audiobooks => 'Audiolivros';

  @override
  String noLabelFound(String label) {
    return 'Nenhum $label encontrado';
  }

  @override
  String get folder => 'Pasta';

  @override
  String get filters => 'Filtros';

  @override
  String get readingStatus => 'Status de leitura';

  @override
  String get playedStatus => 'Status jogado';

  @override
  String get readStatus => 'Ler';

  @override
  String get watched => 'Assistido';

  @override
  String get unread => 'Não lido';

  @override
  String get unwatched => 'Não assistido';

  @override
  String get seriesStatus => 'Status da série';

  @override
  String get allLibraries => 'Todas as bibliotecas';

  @override
  String get books => 'Livros';

  @override
  String get author => 'Autor';

  @override
  String get unknownAuthor => 'Autor desconhecido';

  @override
  String get uncategorized => 'Sem categoria';

  @override
  String get overview => 'Visão geral';

  @override
  String get noLibrivoxDescription =>
      'Nenhuma descrição fornecida pelo LibriVox para este título ainda.';

  @override
  String get readers => 'Leitores';

  @override
  String get openLinks => 'Links abertos';

  @override
  String get librivoxPage => 'Página LibriVox';

  @override
  String get internetArchive => 'Arquivo da Internet';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Baixar Zip';

  @override
  String sectionCountLabel(int count) {
    return 'Seções $count';
  }

  @override
  String firstPublished(int year) {
    return 'Publicado pela primeira vez $year';
  }

  @override
  String get noOpenLibraryOverview =>
      'Nenhuma visão geral disponível na Open Library para este título ainda.';

  @override
  String get subjects => 'Assuntos';

  @override
  String get all => 'Todos';

  @override
  String booksCount(int count) {
    return '$count livros';
  }

  @override
  String get couldNotLoadSubject =>
      'Não foi possível carregar este assunto agora.';

  @override
  String get audiobookDetails => 'Detalhes do audiolivro';

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
  String get trackList => 'Lista de faixas';

  @override
  String get itemListPlaceholder => 'A lista de itens aparecerá aqui';

  @override
  String get favoriteTracksPlaceholder => 'As faixas favoritas aparecerão aqui';

  @override
  String get failedToLoad => 'Falha ao carregar';

  @override
  String get delete => 'Excluir';

  @override
  String get save => 'Salvar';

  @override
  String get moreLikeThis => 'Mais como este';

  @override
  String get castAndCrew => 'Elenco e equipe';

  @override
  String get collection => 'Coleção';

  @override
  String get episodes => 'Episódios';

  @override
  String get nextUp => 'Próximo';

  @override
  String get seasons => 'Temporadas';

  @override
  String get chapters => 'Capítulos';

  @override
  String get features => 'Características';

  @override
  String get movies => 'Filmes';

  @override
  String get musicVideos => 'Vídeos musicais';

  @override
  String get other => 'Outro';

  @override
  String get discography => 'Discografia';

  @override
  String get similarArtists => 'Artistas semelhantes';

  @override
  String get tableOfContents => 'Índice';

  @override
  String get tracklist => 'Lista de faixas';

  @override
  String discNumber(int number) {
    return 'Disco $number';
  }

  @override
  String get biography => 'Biografia';

  @override
  String get authorDetails => 'Detalhes do autor';

  @override
  String get noOverviewAvailable =>
      'Nenhuma visão geral disponível para este título ainda.';

  @override
  String get noBiographyAvailable =>
      'Nenhuma biografia disponível para este autor.';

  @override
  String get noBooksFound => 'Nenhum livro encontrado deste autor.';

  @override
  String get unableToLoadAuthorDetails =>
      'Não é possível carregar os detalhes do autor no momento.';

  @override
  String published(int year) {
    return 'Publicado $year';
  }

  @override
  String get publicationDateUnknown => 'Data de publicação desconhecida';

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
    return 'Termina em $time';
  }

  @override
  String get view => 'Visualizar';

  @override
  String get resumeReading => 'Retomar leitura';

  @override
  String get read => 'Ler';

  @override
  String resumeFrom(String position) {
    return 'Currículo de $position';
  }

  @override
  String get play => 'Jogar';

  @override
  String get startOver => 'Recomeçar';

  @override
  String get restart => 'Reiniciar';

  @override
  String get readOffline => 'Ler off-line';

  @override
  String get playOffline => 'Jogue off-line';

  @override
  String get audio => 'Áudio';

  @override
  String get subtitles => 'Legendas';

  @override
  String get version => 'Versão';

  @override
  String get cast => 'Elenco';

  @override
  String get trailer => 'Reboque';

  @override
  String get finished => 'Finalizado';

  @override
  String get favorited => 'Favorito';

  @override
  String get favorite => 'Favorito';

  @override
  String get playlist => 'Lista de reprodução';

  @override
  String get downloaded => 'Baixado';

  @override
  String get downloadAll => 'Baixar tudo';

  @override
  String get download => 'Download';

  @override
  String get deleteDownloaded => 'Excluir baixado';

  @override
  String get goToSeries => 'Ir para a série';

  @override
  String get editMetadata => 'Editar metadados';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Mais';

  @override
  String get deleteItem => 'Excluir item';

  @override
  String get deletePlaylist => 'Excluir lista de reprodução';

  @override
  String get deletePlaylistMessage => 'Excluir esta playlist do servidor?';

  @override
  String get deleteItemMessage => 'Excluir este item do servidor?';

  @override
  String get failedToDeletePlaylist => 'Falha ao excluir a playlist';

  @override
  String get failedToDeleteItem => 'Falha ao excluir item';

  @override
  String get renamePlaylist => 'Renomear lista de reprodução';

  @override
  String get playlistName => 'Nome da lista de reprodução';

  @override
  String get deleteDownloadedAlbum => 'Excluir álbum baixado';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Excluir faixas baixadas de \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Faixas baixadas excluídas';

  @override
  String get downloadedTracksDeleteFailed =>
      'Algumas faixas baixadas não puderam ser excluídas';

  @override
  String get noTracksLoaded => 'Nenhuma faixa carregada';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Nenhum $itemLabel carregado';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Baixando $title ($count itens)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Tem certeza de que deseja excluir \"$name\" do servidor? Esta ação não pode ser desfeita.';
  }

  @override
  String get itemDeleted => 'Item excluído';

  @override
  String get noPlayableTrailerFound => 'Nenhum trailer jogável encontrado.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Formato de livro não suportado: .$extension';
  }

  @override
  String get audioTrack => 'Faixa de áudio';

  @override
  String get subtitleTrack => 'Faixa de legenda';

  @override
  String get none => 'Nenhum';

  @override
  String get downloadSubtitlesLabel => 'Baixar legendas...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Pesquise usando o plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Baixar legendas';

  @override
  String get selectedSubtitleInvalid => 'A legenda selecionada é inválida.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Legenda baixada e selecionada: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Legenda baixada. Pode demorar um pouco para aparecer enquanto o Jellyfin atualiza o item.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nenhuma legenda remota encontrada para $language.';
  }

  @override
  String get selectVersion => 'Selecione a versão';

  @override
  String versionNumber(int number) {
    return 'Versão $number';
  }

  @override
  String get downloadAllQuality => 'Baixe tudo - qualidade';

  @override
  String get downloadQuality => 'Qualidade de download';

  @override
  String get originalFileNoReencoding => 'Arquivo original, sem recodificação';

  @override
  String get originalFilesNoReencoding =>
      'Arquivos originais, sem recodificação';

  @override
  String get noEpisodesLoaded => 'Nenhum episódio carregado';

  @override
  String downloadingItem(String name, String quality) {
    return 'Baixando $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Excluir arquivos baixados';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Excluir arquivos locais para $typeLabel?\n\nIsso irá liberar espaço de armazenamento. Você pode baixar novamente mais tarde.';
  }

  @override
  String get downloadedFilesDeleted => 'Arquivos baixados excluídos';

  @override
  String get failedToDeleteFiles => 'Falha ao excluir arquivos';

  @override
  String get deleteFiles => 'Excluir arquivos';

  @override
  String get director => 'DIRETOR';

  @override
  String get writers => 'ESCRITORES';

  @override
  String get studio => 'ESTÚDIO';

  @override
  String studioMoreCount(int count) {
    return '+$count mais';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Episódios';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Episódio $number';
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
    return 'Nasceu $date';
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
  String get readMore => 'Leia mais';

  @override
  String get shuffle => 'Embaralhar';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Combinação perfeita';

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
    return 'A legenda remota $action requer a permissão de gerenciamento de legendas Jellyfin para este usuário.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Este item não foi encontrado no servidor para legenda remota $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Legenda remota $action falhou: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'A legenda remota $action falhou (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Falha ao $action legendas remotas.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'todos os episódios baixados de \"$name\"';
  }

  @override
  String get deleteSeasonFiles => 'todos os episódios baixados nesta temporada';

  @override
  String get stillWatching => 'Ainda está assistindo?';

  @override
  String get unableToLoadTrailerStream =>
      'Não foi possível carregar o fluxo do trailer.';

  @override
  String get trailerTimedOut =>
      'O tempo limite do trailer expirou durante o carregamento.';

  @override
  String get playbackFailedForTrailer => 'Falha na reprodução deste trailer.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'A transmissão não está disponível durante a reprodução offline.';

  @override
  String castActionFailed(String label, String error) {
    return '$label ação falhou: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Falha ao definir o volume de transmissão: $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Controles';
  }

  @override
  String get deviceVolume => 'Volume do dispositivo';

  @override
  String get unavailable => 'Indisponível';

  @override
  String get pause => 'Pausa';

  @override
  String get syncPosition => 'Posição de sincronização';

  @override
  String stopCast(String label) {
    return 'Pare $label';
  }

  @override
  String get queueIsEmpty => 'A fila está vazia';

  @override
  String trackNumber(int number) {
    return 'Rastrear $number';
  }

  @override
  String get remotePlayback => 'Reprodução Remota';

  @override
  String get castingToGoogleCast => 'Transmitindo para o Google Cast';

  @override
  String get castingViaAirPlay => 'Transmissão via AirPlay';

  @override
  String get castingViaDlna => 'Transmissão via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds segundos';
  }

  @override
  String get longPressToUnlock => 'Pressione e segure para desbloquear';

  @override
  String get off => 'Desligado';

  @override
  String streamTypeFallback(String streamType, int number) {
    return '$streamType $number';
  }

  @override
  String get auto => 'Auto';

  @override
  String bitrateValueMbps(int mbps) {
    return '${mbps}Mbps';
  }

  @override
  String get bitrateOverride => 'Substituição de taxa de bits';

  @override
  String get audioDelay => 'Atraso de áudio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Atraso de legenda';

  @override
  String get reset => 'Reiniciar';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get playbackInformation => 'Informações de reprodução';

  @override
  String get playback => 'Reprodução';

  @override
  String get playMethod => 'Método de jogo';

  @override
  String get directPlay => 'Jogo direto';

  @override
  String get directStream => 'Transmissão direta';

  @override
  String get transcoding => 'Transcodificação';

  @override
  String get transcodeReasons => 'Razões de transcodificação';

  @override
  String get player => 'Jogador';

  @override
  String get container => 'Recipiente';

  @override
  String get bitrate => 'Taxa de bits';

  @override
  String get video => 'Vídeo';

  @override
  String get resolution => 'Resolução';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Taxa de bits de vídeo';

  @override
  String get track => 'Acompanhar';

  @override
  String get channels => 'Canais';

  @override
  String get audioBitrate => 'Taxa de bits de áudio';

  @override
  String get sampleRate => 'Taxa de amostragem';

  @override
  String get format => 'Formatar';

  @override
  String get external => 'Externo';

  @override
  String get embedded => 'Integrado';

  @override
  String castSessionError(String protocol) {
    return '$protocol erro de sessão';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Falha ao carregar detalhes do livro: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'A renderização de EPUB no aplicativo ainda não está disponível nesta plataforma.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Este formato (.$extension) ainda não pode ser renderizado no aplicativo.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A renderização de documentos incorporados não está disponível nesta plataforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'Não foi possível abrir o visualizador externo.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Falha ao abrir o leitor no aplicativo: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Marcador já salvo em $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Marcador adicionado: $label';
  }

  @override
  String get noBookmarksYet =>
      'Ainda não há favoritos.\nToque no ícone de marcador durante a leitura para salvar sua posição.';

  @override
  String get noTableOfContentsAvailable => 'Nenhum índice disponível';

  @override
  String pageLabel(int number) {
    return 'Página $number';
  }

  @override
  String get position => 'Posição';

  @override
  String get bookReader => 'Leitor de livros';

  @override
  String formatExtension(String extension) {
    return 'Formato: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% lido';
  }

  @override
  String get updating => 'Atualizando...';

  @override
  String get markUnread => 'Marcar como não lido';

  @override
  String get markAsRead => 'Marcar como lido';

  @override
  String get reloadReader => 'Recarregar leitor';

  @override
  String get noPagesFound => 'Nenhuma página encontrada.';

  @override
  String get failedToDecodePageImage =>
      'Falha ao decodificar a imagem da página.';

  @override
  String resetZoom(String zoom) {
    return 'Redefinir zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Página única';

  @override
  String get twoPageSpread => 'Spread de duas páginas';

  @override
  String get addBookmark => 'Adicionar marcador';

  @override
  String get bookmarksEllipsis => 'Marcadores...';

  @override
  String get markedAsRead => 'Marcado como lido';

  @override
  String get markedAsUnread => 'Marcado como não lido';

  @override
  String failedToUpdateReadState(String error) {
    return 'Falha ao atualizar o estado de leitura: $error';
  }

  @override
  String get themeSystem => 'Tema: Sistema';

  @override
  String get themeLight => 'Tema: Luz';

  @override
  String get themeDark => 'Tema: Escuro';

  @override
  String get themeSepia => 'Tema: Sépia';

  @override
  String get invertColorsFixedLayout => 'Inverter cores (layout fixo)';

  @override
  String get invertColorsPdf => 'Inverter cores (PDF)';

  @override
  String get preparingInAppReader => 'Preparando leitor no aplicativo...';

  @override
  String get pdfDataNotAvailable => 'Dados PDF não disponíveis.';

  @override
  String get readerFallbackModeActive => 'Modo substituto do leitor ativo';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Esta plataforma não pode hospedar o mecanismo de documento incorporado para arquivos $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Use o Reload Reader depois de mudar para uma plataforma compatível (Android, iOS, macOS).';

  @override
  String get openExternally => 'Abrir externamente';

  @override
  String get noEpubChaptersFound => 'Nenhum capítulo do EPUB encontrado.';

  @override
  String get readerNotReady => 'Leitor não está pronto.';

  @override
  String get seriesRecordings => 'Gravações de séries';

  @override
  String get now => 'Agora';

  @override
  String get sports => 'Esportes';

  @override
  String get news => 'Notícias';

  @override
  String get kids => 'Crianças';

  @override
  String get premiere => 'Estreia';

  @override
  String get guideTimeline => 'Linha do tempo do guia';

  @override
  String failedToLoadGuide(String error) {
    return 'Falha ao carregar o guia: $error';
  }

  @override
  String get noChannelsFound => 'Nenhum canal encontrado';

  @override
  String get liveBadge => 'AO VIVO';

  @override
  String get movie => 'Filme';

  @override
  String get removedFromFavoriteChannels => 'Removido dos canais favoritos';

  @override
  String get addedToFavoriteChannels => 'Adicionado aos canais favoritos';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Falha ao atualizar canal favorito';

  @override
  String get unfavoriteChannel => 'Canal não favorito';

  @override
  String get favoriteChannel => 'Canal favorito';

  @override
  String get record => 'Registro';

  @override
  String get cancelRecordingAction => 'Cancelar gravação';

  @override
  String get programSetToRecord => 'Programa pronto para gravar';

  @override
  String get recordingCancelled => 'Gravação cancelada';

  @override
  String get unableToCreateRecording => 'Não foi possível criar a gravação';

  @override
  String get watch => 'Assistir';

  @override
  String get close => 'Fechar';

  @override
  String failedToPlayChannel(String name) {
    return 'Falha ao reproduzir $name';
  }

  @override
  String get failedToLoadRecordings => 'Falha ao carregar gravações';

  @override
  String get scheduledInNext24Hours => 'Agendado para as próximas 24 horas';

  @override
  String get recentRecordings => 'Gravações recentes';

  @override
  String get tvSeries => 'Série de TV';

  @override
  String get failedToLoadSchedule => 'Falha ao carregar agendamento';

  @override
  String get noScheduledRecordings => 'Nenhuma gravação agendada';

  @override
  String get cancelRecording => 'Cancelar gravação?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancelar a gravação agendada de \"$name\"?';
  }

  @override
  String get no => 'Não';

  @override
  String get yesCancel => 'Sim, cancelar';

  @override
  String get failedToCancelRecording => 'Falha ao cancelar a gravação';

  @override
  String get failedToLoadSeriesRecordings =>
      'Falha ao carregar gravações da série';

  @override
  String get noSeriesRecordings => 'Sem gravações de série';

  @override
  String get cancelSeriesRecording => 'Cancelar gravação de série';

  @override
  String get cancelSeriesRecordingQuestion => 'Cancelar a gravação da série?';

  @override
  String stopRecordingName(String name) {
    return 'Parar de gravar \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Falha ao cancelar a gravação da série';

  @override
  String get searchThisLibrary => 'Pesquisar nesta biblioteca...';

  @override
  String get searchEllipsis => 'Procurar...';

  @override
  String noResultsForQuery(String query) {
    return 'Nenhum resultado para \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Falha na pesquisa: $error';
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
  String get savedMedia => 'Mídia salva';

  @override
  String get tvShows => 'Programas de TV';

  @override
  String get music => 'Música';

  @override
  String get musicAlbums => 'Álbuns de música';

  @override
  String get noMediaInFilter => 'Nenhuma mídia neste filtro';

  @override
  String get noDownloadedMediaYet => 'Nenhuma mídia baixada ainda';

  @override
  String get browseLibrary => 'Navegar na biblioteca';

  @override
  String get deleteDownload => 'Excluir download';

  @override
  String removeItemAndFiles(String name) {
    return 'Remover \"$name\" e seus arquivos?';
  }

  @override
  String tracksCount(int count) {
    return '$count faixas';
  }

  @override
  String get album => 'Álbum';

  @override
  String get playAlbum => 'Reproduzir álbum';

  @override
  String failedToLoadAlbum(String error) {
    return 'Falha ao carregar o álbum: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Nenhuma faixa baixada encontrada para $name.';
  }

  @override
  String get season => 'Temporada';

  @override
  String get errorLoadingEpisodes => 'Erro ao carregar episódios';

  @override
  String get noDownloadedEpisodes => 'Nenhum episódio baixado';

  @override
  String get deleteEpisode => 'Excluir episódio';

  @override
  String removeName(String name) {
    return 'Remover \"$name\"?';
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
    return 'Episódio $number';
  }

  @override
  String get seriesNotFound => 'Série não encontrada';

  @override
  String get errorLoadingSeries => 'Erro ao carregar a série';

  @override
  String get downloadedEpisodes => 'Episódios baixados';

  @override
  String seasonNumber(int number) {
    return 'Temporada $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Especiais';

  @override
  String get deleteSeason => 'Excluir temporada';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Excluir todos os episódios baixados em $season?';
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
  String get storageManagement => 'Gerenciamento de armazenamento';

  @override
  String get storageBreakdown => 'Divisão de armazenamento';

  @override
  String get downloadedItems => 'Itens baixados';

  @override
  String get storageLimit => 'Limite de armazenamento';

  @override
  String get noLimit => 'Sem limite';

  @override
  String get deleteAllDownloads => 'Excluir todos os downloads';

  @override
  String get deleteAllDownloadsWarning =>
      'Isso removerá todos os arquivos de mídia baixados e não poderá ser desfeito.';

  @override
  String get deleteAll => 'Excluir tudo';

  @override
  String get deleteSelected => 'Excluir selecionado';

  @override
  String deleteSelectedCount(int count) {
    return 'Excluir $count itens baixados?';
  }

  @override
  String get musicAndAudiobooks => 'Música e audiolivros';

  @override
  String get images => 'Imagens';

  @override
  String get database => 'Banco de dados';

  @override
  String ofStorageLimit(String limit) {
    return 'do limite $limit';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get authentication => 'Autenticação';

  @override
  String get autoLoginServerManagement =>
      'Login automático, gerenciamento de servidor';

  @override
  String get pinCode => 'Código PIN';

  @override
  String get setUpPinCodeProtection => 'Configurar proteção por código PIN';

  @override
  String get parentalControls => 'Controles dos pais';

  @override
  String get contentRatingRestrictions =>
      'Restrições de classificação de conteúdo';

  @override
  String get bitRateResolutionBehavior =>
      'Taxa de bits, resolução, comportamento';

  @override
  String get languageSizeAppearance => 'Idioma, tamanho, aparência';

  @override
  String get qualityStorage => 'Qualidade, armazenamento';

  @override
  String get serverSyncAndPluginStatus =>
      'Sincronização do servidor e status do plugin';

  @override
  String get mediaRequestIntegration => 'Integração de solicitação de mídia';

  @override
  String get switchServer => 'Trocar servidor';

  @override
  String get signOut => 'Sair';

  @override
  String get versionLicenses => 'Versão, licenças';

  @override
  String get account => 'Conta';

  @override
  String get signInAndSecurity => 'Login e segurança';

  @override
  String get administration => 'Administração';

  @override
  String get serverSettingsUsersLibraries =>
      'Configurações do servidor, usuários, bibliotecas';

  @override
  String get customization => 'Personalização';

  @override
  String get themeAndLayout => 'Tema e layout';

  @override
  String get videoAndSubtitles => 'Vídeo e legendas';

  @override
  String get integrations => 'Integrações';

  @override
  String get pluginAndRequests => 'Plug-in e solicitações';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personalize a conta, a reprodução e o comportamento da interface';

  @override
  String optionsCount(int count) {
    return '$count opções';
  }

  @override
  String get themeAndAppearance => 'Tema e aparência';

  @override
  String get focusBorderColor => 'Cor da borda do foco';

  @override
  String get watchedIndicators => 'Indicadores observados';

  @override
  String get always => 'Sempre';

  @override
  String get hideUnwatched => 'Ocultar não assistido';

  @override
  String get episodesOnly => 'Apenas episódios';

  @override
  String get never => 'Nunca';

  @override
  String get focusExpansionAnimation => 'Animação de expansão de foco';

  @override
  String get desktopUiScale => 'Escala de UI de desktop';

  @override
  String get scaleFocusedCards =>
      'Dimensione cartões e blocos focados ou pairados';

  @override
  String get backgroundBackdrops => 'Cenários de fundo';

  @override
  String get showBackdropImages =>
      'Mostrar imagens de fundo por trás do conteúdo';

  @override
  String get seriesThumbnails => 'Miniaturas de séries';

  @override
  String get seriesThumbnailsDescription =>
      'Somente episódios: use arte da série que corresponda a cada tipo de imagem de linha';

  @override
  String get homeRowInfoOverlay =>
      'Sobreposição de informações da linha inicial';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Mostrar título e metadados ao navegar nas linhas iniciais';

  @override
  String get clockDisplay => 'Exibição do relógio';

  @override
  String get inMenus => 'Nos menus';

  @override
  String get inVideo => 'Em vídeo';

  @override
  String get seasonalEffects => 'Efeitos sazonais';

  @override
  String get seasonalEffectsDescription =>
      'Efeitos visuais e decorações sazonais';

  @override
  String get snow => 'Neve';

  @override
  String get fireworks => 'Fogos de artifício';

  @override
  String get confetti => 'Confete';

  @override
  String get fallingLeaves => 'Folhas caindo';

  @override
  String get themeMusic => 'Música Temática';

  @override
  String get playThemeMusicOnDetailPages =>
      'Reproduzir música tema nas páginas de detalhes';

  @override
  String get themeMusicVolume => 'Volume da música temática';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Música tema nas linhas iniciais';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Jogue enquanto navega na tela inicial';

  @override
  String get detailsBackgroundBlur => 'Detalhes do desfoque de fundo';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Navegando em desfoque de fundo';

  @override
  String get maxStreamingBitrate => 'Taxa máxima de bits de streaming';

  @override
  String get maxResolution => 'Resolução máxima';

  @override
  String get playerZoomMode => 'Modo de zoom do jogador';

  @override
  String get fit => 'Ajustar';

  @override
  String get autoCrop => 'Corte automático';

  @override
  String get stretch => 'Esticar';

  @override
  String get refreshRateSwitching => 'Mudança de taxa de atualização';

  @override
  String get disabled => 'Desabilitado';

  @override
  String get scaleOnTv => 'Escala na TV';

  @override
  String get scaleOnDevice => 'Dimensionar no dispositivo';

  @override
  String get trickPlay => 'Truque';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Mostrar miniaturas de visualização ao pesquisar';

  @override
  String get showDescriptionOnPause => 'Mostrar descrição em pausa';

  @override
  String get dimVideoShowOverview =>
      'Escureça o vídeo e mostre o texto de visão geral durante a pausa';

  @override
  String get osdLockButton => 'Botão de bloqueio OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostrar um botão de bloqueio que bloqueia a entrada por toque até ser pressionado por muito tempo';

  @override
  String get audioBehavior => 'Comportamento de áudio';

  @override
  String get downmixToStereo => 'Downmix para estéreo';

  @override
  String get defaultAudioLanguage => 'Idioma de áudio padrão';

  @override
  String get autoServerDefault => 'Automático (padrão do servidor)';

  @override
  String get english => 'Inglês';

  @override
  String get spanish => 'Espanhol';

  @override
  String get french => 'Francês';

  @override
  String get german => 'Alemão';

  @override
  String get italian => 'italiano';

  @override
  String get portuguese => 'Português';

  @override
  String get japanese => 'japonês';

  @override
  String get korean => 'coreano';

  @override
  String get chinese => 'chinês';

  @override
  String get russian => 'russo';

  @override
  String get arabic => 'árabe';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'Holandês';

  @override
  String get swedish => 'sueco';

  @override
  String get norwegian => 'norueguês';

  @override
  String get danish => 'dinamarquês';

  @override
  String get finnish => 'finlandês';

  @override
  String get polish => 'polonês';

  @override
  String get ac3Passthrough => 'Passagem AC3';

  @override
  String get dtsPassthrough => 'Passagem DTS';

  @override
  String get trueHdSupport => 'Suporte TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Áudio Bitstream DTS apenas para AVR; requer suporte de receptor e trilha de origem DTS';

  @override
  String get enableTrueHdAudio =>
      'Ative o áudio TrueHD (pode não funcionar em todas as plataformas)';

  @override
  String get settingsAudioOutputMode => 'Modo de saída de áudio';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Passagem AVR';

  @override
  String get settingsAudioFallbackCodec => 'Codec substituto de áudio';

  @override
  String get settingsAudioFallbackAacStereo => 'Estéreo AAC';

  @override
  String get settingsAudioFallbackAc35_1 => 'AC3 5.1';

  @override
  String get settingsAudioFallbackEac35_1 => 'EAC3 5.1';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passagem (avançado)';

  @override
  String get settingsAudioCodecPassthrough => 'Passagem de codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ative apenas os formatos suportados pelo coletor AVR ou HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Passagem EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Passagem EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passagem principal DTS';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passagem DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passagem TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Passagem TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Bitstream Dolby Digital Plus (EAC3) para decodificador externo.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Bitstream Dolby Atmos sobre EAC3 (JOC) para decodificador externo.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Bitstream DTS-HD MA (inclui núcleo DTS) para decodificador externo.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Bitstream Dolby TrueHD com metadados Atmos para decodificador externo.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Capacidades de áudio detectadas';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Nenhum instantâneo de capacidade de tempo de execução disponível ainda.';

  @override
  String get settingsAudioRouteLabel => 'Rota';

  @override
  String get settingsAudioDecodeLabel => 'Decodificar';

  @override
  String get settingsAudioPassthroughLabel => 'Passagem';

  @override
  String get settingsAudioHdRoute => 'Rota de áudio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Palestrante';

  @override
  String settingsAudioPcmChannels(int count) {
    return '${count}ch PCM';
  }

  @override
  String get settingsAudioDiagnostics => 'Diagnóstico';

  @override
  String get settingsAudioDiagnosticsVideoLevel => 'Nível de vídeo';

  @override
  String get settingsAudioDiagnosticsVideoRange => 'Faixa de vídeo';

  @override
  String get settingsAudioDiagnosticsSubtitleCodec => 'Codec de legenda';

  @override
  String get settingsAudioDiagnosticsAllowedAudioCodecs =>
      'Codecs de áudio permitidos';

  @override
  String get settingsAudioDiagnosticsHlsMpegTsAudioCodecs =>
      'Codecs de áudio HLS MPEG-TS';

  @override
  String get settingsAudioDiagnosticsHlsFmp4AudioCodecs =>
      'Codecs de áudio HLS fMP4';

  @override
  String get settingsAudioDiagnosticsAudioSpdifPassthrough =>
      'passagem de áudio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Rota de áudio ativa';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Suporte de áudio HD de rota';

  @override
  String get nightMode => 'Modo noturno';

  @override
  String get compressDynamicRange => 'Comprimir faixa dinâmica';

  @override
  String get advancedMpv => 'Avançado mpv';

  @override
  String get enableCustomMpvConf => 'Habilitar mpv.conf personalizado';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplique um mpv.conf especificado pelo usuário antes do início da reprodução';

  @override
  String get unsafeAdvancedMpvOptions => 'Opções avançadas de mpv inseguras';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permita um conjunto mais amplo de opções de mpv. Pode interromper o comportamento de reprodução.';

  @override
  String get hardwareDecoding => 'Decodificação de hardware';

  @override
  String get hardwareDecodingSubtitle =>
      'Pode melhorar o desempenho, mas pode causar problemas de reprodução em alguns dispositivos.';

  @override
  String get nextUpAndQueuing => 'Próximo e na fila';

  @override
  String get nextUpDisplay => 'Próximo display';

  @override
  String get extended => 'Estendido';

  @override
  String get minimal => 'Mínimo';

  @override
  String get nextUpTimeout => 'Próximo tempo limite';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Enfileiramento de mídia';

  @override
  String get autoQueueNextEpisodes =>
      'Colocar automaticamente os próximos episódios na fila';

  @override
  String get stillWatchingPrompt => 'Ainda assistindo ao prompt';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Depois de episódios de $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Retomar e pular';

  @override
  String get resumeRewind => 'Retomar retrocesso';

  @override
  String get unpauseRewind => 'Retomar retrocesso';

  @override
  String get fiveSeconds => '5 segundos';

  @override
  String get tenSeconds => '10 segundos';

  @override
  String get fifteenSeconds => '15 segundos';

  @override
  String get thirtySeconds => '30 segundos';

  @override
  String get skipBackLength => 'Comprimento do salto para trás';

  @override
  String get skipForwardLength => 'Pular comprimento para frente';

  @override
  String get customMpvConfPath => 'Caminho mpv.conf personalizado';

  @override
  String get notSetMpvConf =>
      'Não definido. Moonfin tentará um mpv.conf padrão nas pastas app/data.';

  @override
  String get selectMpvConf => 'Selecione mpv.conf';

  @override
  String get pathToMpvConf => '/caminho/para/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'As configurações de estilo (tamanho, cor, deslocamento) aplicam-se a legendas baseadas em texto (SRT, VTT, TTML). As legendas ASS/SSA usam seu próprio estilo incorporado, a menos que \"ASS/SSA Direct Play\" esteja desativado. Legendas de bitmap (PGS, DVB, VobSub) não podem ser reestilizadas.';

  @override
  String get defaultSubtitleLanguage => 'Idioma de legenda padrão';

  @override
  String get defaultToNoSubtitles => 'Padrão sem legendas';

  @override
  String get turnOffSubtitlesByDefault => 'Desative as legendas por padrão';

  @override
  String get subtitleSize => 'Tamanho da legenda';

  @override
  String get textFillColor => 'Cor de preenchimento de texto';

  @override
  String get backgroundColor => 'Cor de fundo';

  @override
  String get textStrokeColor => 'Cor do traço do texto';

  @override
  String get subtitleCustomization => 'Personalização de legendas';

  @override
  String get subtitleCustomizationDescription =>
      'Personalize a aparência das legendas';

  @override
  String get subtitlePreviewText =>
      'A rápida raposa marrom salta sobre o cachorro preguiçoso';

  @override
  String get verticalOffset => 'Deslocamento vertical';

  @override
  String get pgsDirectPlay => 'Jogo direto PGS';

  @override
  String get directPlayPgsSubtitles => 'Legendas PGS com reprodução direta';

  @override
  String get assSsaDirectPlay => 'Jogo direto ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Legendas ASS/SSA com reprodução direta';

  @override
  String get white => 'Branco';

  @override
  String get black => 'Preto';

  @override
  String get yellow => 'Amarelo';

  @override
  String get green => 'Verde';

  @override
  String get cyan => 'Ciano';

  @override
  String get red => 'Vermelho';

  @override
  String get transparent => 'Transparente';

  @override
  String get semiTransparentBlack => 'Preto Semitransparente';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Área de trabalho';

  @override
  String get mobile => 'Móvel';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Configurações de perfil $profile carregadas.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Falha ao carregar as configurações do perfil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Configurações locais sincronizadas com o perfil $profile.';
  }

  @override
  String get customizationProfile => 'Perfil de personalização';

  @override
  String get customizationProfileDescription =>
      'Escolha o perfil para carregar, editar e sincronizar. Global se aplica a todos os lugares, a menos que um perfil de dispositivo o substitua. O ponto verde marca o perfil do seu dispositivo atual.';

  @override
  String get loadProfile => 'Carregar perfil';

  @override
  String get syncing => 'Sincronizando...';

  @override
  String get syncToProfile => 'Sincronizar com perfil';

  @override
  String get profileSyncHidden => 'Sincronização de perfil oculta';

  @override
  String get enablePluginSyncDescription =>
      'Ative a sincronização do plug-in do servidor nas configurações do plug-in para mostrar os controles do perfil aqui.';

  @override
  String get quality => 'Qualidade';

  @override
  String get defaultDownloadQuality => 'Qualidade de download padrão';

  @override
  String get network => 'Rede';

  @override
  String get wifiOnlyDownloads => 'Downloads somente WiFi';

  @override
  String get onlyDownloadOnWifi => 'Baixe apenas quando conectado ao WiFi';

  @override
  String get storage => 'Armazenar';

  @override
  String get storageUsed => 'Armazenamento usado';

  @override
  String get manage => 'Gerenciar';

  @override
  String get calculating => 'Calculando...';

  @override
  String get downloadLocation => 'Local de download';

  @override
  String get defaultLabel => 'Padrão';

  @override
  String get saveToDownloadsFolder => 'Salvar na pasta Downloads';

  @override
  String get downloadsVisibleToOtherApps =>
      'Downloads/Moonfin – visível para outros aplicativos';

  @override
  String get dangerZone => 'Zona de perigo';

  @override
  String get clearAllDownloads => 'Limpar todos os downloads';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Alterar local de download';

  @override
  String get changeDownloadLocationDescription =>
      'Novos downloads serão salvos na pasta selecionada. Os downloads existentes permanecerão em seu local atual e poderão ser gerenciados nas configurações de armazenamento.';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cannotWriteToFolder =>
      'Não é possível gravar na pasta selecionada. Escolha um local diferente ou conceda permissões de armazenamento.';

  @override
  String get saveToDownloadsFolderQuestion => 'Salvar na pasta Downloads?';

  @override
  String get saveToDownloadsFolderDescription =>
      'A mídia baixada será salva em Downloads/Moonfin no seu dispositivo. Esses arquivos ficarão visíveis para outros aplicativos, como sua galeria ou reprodutor de música.\n\nOs downloads existentes permanecerão no local atual.';

  @override
  String get enable => 'Habilitar';

  @override
  String get clearAllDownloadsWarning =>
      'Isso excluirá todas as mídias baixadas e não poderá ser desfeito.';

  @override
  String get clearAll => 'Limpar tudo';

  @override
  String get navigationStyle => 'Estilo de navegação';

  @override
  String get topBar => 'Barra superior';

  @override
  String get leftSidebar => 'Barra lateral esquerda';

  @override
  String get showShuffleButton => 'Mostrar botão aleatório';

  @override
  String get showGenresButton => 'Botão Mostrar gêneros';

  @override
  String get showFavoritesButton => 'Mostrar botão Favoritos';

  @override
  String get showLibrariesInToolbar =>
      'Mostrar bibliotecas na barra de ferramentas';

  @override
  String get navbarOpacity => 'Opacidade da barra de navegação';

  @override
  String get navbarColor => 'Cor da barra de navegação';

  @override
  String get gray => 'Cinza';

  @override
  String get darkBlue => 'Azul escuro';

  @override
  String get purple => 'Roxo';

  @override
  String get teal => 'Cerceta';

  @override
  String get navy => 'Marinha';

  @override
  String get charcoal => 'Carvão';

  @override
  String get brown => 'Marrom';

  @override
  String get darkRed => 'Vermelho Escuro';

  @override
  String get darkGreen => 'Verde Escuro';

  @override
  String get slate => 'Ardósia';

  @override
  String get indigo => 'Índigo';

  @override
  String get libraryDisplay => 'Exibição da Biblioteca';

  @override
  String get posterLabel => 'Poster';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Bandeira';

  @override
  String get overridePerLibrarySettings =>
      'Substituir configurações por biblioteca';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplicar tipo de imagem a todas as bibliotecas';

  @override
  String get multiServerLibraries => 'Bibliotecas multiservidor';

  @override
  String get showLibrariesFromAllServers =>
      'Mostrar bibliotecas de todos os servidores conectados';

  @override
  String get enableFolderView => 'Ativar visualização de pasta';

  @override
  String get showFolderBrowsingOption => 'Mostrar opção de navegação em pastas';

  @override
  String get libraryVisibility => 'Visibilidade da Biblioteca';

  @override
  String get libraryVisibilityDescription =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicie o Moonfin para que as alterações tenham efeito.';

  @override
  String get showInNavigation => 'Mostrar na navegação';

  @override
  String get showInLatestMedia => 'Mostrar na mídia mais recente';

  @override
  String get sourceLibraries => 'Bibliotecas de origem';

  @override
  String get sourceCollections => 'Coleções de origem';

  @override
  String get excludedGenres => 'Gêneros excluídos';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String itemsSelected(int count) {
    return '$count selecionado';
  }

  @override
  String get mediaBar => 'Barra de mídia';

  @override
  String get mediaSources => 'Fontes de mídia';

  @override
  String get behavior => 'Comportamento';

  @override
  String get seconds => 'segundos';

  @override
  String get localPreviews => 'Visualizações locais';

  @override
  String get localPreviewsDescription =>
      'Configure visualizações de trailer, mídia e áudio.';

  @override
  String get mediaBarMode => 'Estilo da barra de mídia';

  @override
  String get mediaBarModeDescription =>
      'Escolha entre Moonfin, MakD ou desligue a barra de mídia';

  @override
  String get mediaBarModeMoonfin => 'Barbatana Lunar';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desligado';

  @override
  String get enableMediaBar => 'Ativar barra de mídia';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostrar apresentação de slides de conteúdo em destaque na página inicial';

  @override
  String get contentType => 'Tipo de conteúdo';

  @override
  String get moviesAndTvShows => 'Filmes e programas de TV';

  @override
  String get moviesOnly => 'Apenas filmes';

  @override
  String get tvShowsOnly => 'Somente programas de TV';

  @override
  String get itemCount => 'Contagem de itens';

  @override
  String get noneSelected => 'Nenhum selecionado';

  @override
  String get noneExcluded => 'Nenhum excluído';

  @override
  String get autoAdvance => 'Avanço automático';

  @override
  String get autoAdvanceSlides =>
      'Avançar automaticamente para o próximo slide';

  @override
  String get autoAdvanceInterval => 'Intervalo de avanço automático';

  @override
  String get trailerPreview => 'Pré-visualização do trailer';

  @override
  String get autoPlayTrailers =>
      'Reproduza trailers automaticamente na barra de mídia após 3 segundos';

  @override
  String get episodePreview => 'Prévia do episódio';

  @override
  String get mediaPreview => 'Visualização de mídia';

  @override
  String get episodePreviewDescription =>
      'Reproduza uma visualização in-line de 30 segundos em cartões focados, pairados ou pressionados por muito tempo';

  @override
  String get mediaPreviewDescription =>
      'Reproduza uma visualização in-line de 30 segundos em cartões focados, pairados ou pressionados por muito tempo';

  @override
  String get previewAudio => 'Visualizar áudio';

  @override
  String get enablePreviewAudio =>
      'Ativar áudio para prévias de trailers e episódios';

  @override
  String get latestMedia => 'Últimas mídias';

  @override
  String get recentlyReleased => 'Lançado recentemente';

  @override
  String get myMedia => 'Minha mídia';

  @override
  String get myMediaSmall => 'Minha mídia (pequena)';

  @override
  String get continueWatching => 'Continuar assistindo';

  @override
  String get resumeAudio => 'Retomar áudio';

  @override
  String get resumeBooks => 'Retomar livros';

  @override
  String get activeRecordings => 'Gravações Ativas';

  @override
  String get playlists => 'Listas de reprodução';

  @override
  String get liveTV => 'TV ao vivo';

  @override
  String get homeSections => 'Seções iniciais';

  @override
  String get resetToDefaults => 'Redefinir para os padrões';

  @override
  String get homeRowPosterSize => 'Tamanho do pôster da linha inicial';

  @override
  String get perRowImageTypeSelection => 'Seleção de tipo de imagem por linha';

  @override
  String get configureImageTypeForEachRow =>
      'Configure o tipo de imagem para cada linha inicial habilitada';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Mesclar Continuar Assistindo e Próximo';

  @override
  String get combineBothRows =>
      'Combine as duas linhas em uma única seção inicial';

  @override
  String get perRowImageType => 'Tipo de imagem por linha';

  @override
  String get perRowSettings => 'Configurações por linha';

  @override
  String get autoLogin => 'Login automático';

  @override
  String get lastUser => 'Último usuário';

  @override
  String get specificUser => 'Usuário específico';

  @override
  String get alwaysAuthenticate => 'Sempre autenticar';

  @override
  String get requirePasswordWithToken =>
      'Exigir senha mesmo com token armazenado';

  @override
  String get confirmExit => 'Confirmar saída';

  @override
  String get showConfirmationBeforeExiting =>
      'Mostrar confirmação antes de sair';

  @override
  String get blockContentWithRatings =>
      'Bloqueie conteúdo com as seguintes classificações:';

  @override
  String get noContentRatingsFound =>
      'Nenhuma classificação de conteúdo foi encontrada neste servidor ainda.';

  @override
  String get couldNotLoadServerRatings =>
      'Não foi possível carregar as classificações do servidor. Mostrando apenas avaliações salvas.';

  @override
  String get couldNotRefreshRatings =>
      'Não foi possível atualizar as classificações do servidor. Mostrando avaliações salvas.';

  @override
  String get enablePinCode => 'Ativar código PIN';

  @override
  String get requirePinToAccess => 'Exigir um PIN para acessar sua conta';

  @override
  String get changePin => 'Alterar PIN';

  @override
  String get setNewPinCode => 'Defina um novo código PIN';

  @override
  String get removePin => 'Remover PIN';

  @override
  String get removePinProtection => 'Remover proteção do código PIN';

  @override
  String get screensaver => 'Protetor de tela';

  @override
  String get inAppScreensaver => 'Protetor de tela no aplicativo';

  @override
  String get enableBuiltInScreensaver =>
      'Habilite o protetor de tela integrado';

  @override
  String get mode => 'Modo';

  @override
  String get libraryArt => 'Arte da Biblioteca';

  @override
  String get logo => 'Logotipo';

  @override
  String get clock => 'Relógio';

  @override
  String get timeout => 'Tempo esgotado';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Nível de escurecimento';

  @override
  String get maxAgeRating => 'Classificação etária máxima';

  @override
  String get any => 'Qualquer';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Exigir classificação etária';

  @override
  String get onlyShowRatedContent => 'Mostrar apenas conteúdo avaliado';

  @override
  String get showClock => 'Mostrar relógio';

  @override
  String get displayClockDuringScreensaver =>
      'Exibir relógio durante o protetor de tela';

  @override
  String get rottenTomatoesCritics => 'Tomates podres (críticos)';

  @override
  String get rottenTomatoesAudience => 'Tomates podres (público)';

  @override
  String get imdb => 'IMDB';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacrítico';

  @override
  String get metacriticUser => 'Metacrítico (usuário)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Caixa de correio';

  @override
  String get myAnimeList => 'Minha lista de animes';

  @override
  String get aniList => 'ListaAni';

  @override
  String get communityRating => 'Classificação da comunidade';

  @override
  String get ratings => 'Avaliações';

  @override
  String get additionalRatings => 'Avaliações Adicionais';

  @override
  String get showMdbListAndTmdbRatings =>
      'Mostrar classificações MDBList e TMDB';

  @override
  String get ratingLabels => 'Etiquetas de classificação';

  @override
  String get showLabelsNextToIcons =>
      'Mostrar rótulos ao lado dos ícones de classificação';

  @override
  String get ratingBadges => 'Selos de classificação';

  @override
  String get showDecorativeBadges =>
      'Mostrar emblemas decorativos atrás das avaliações';

  @override
  String get episodeRatings => 'Avaliações de episódios';

  @override
  String get showRatingsOnEpisodes =>
      'Mostrar classificações em episódios individuais';

  @override
  String get ratingSources => 'Fontes de classificação';

  @override
  String get ratingSourcesDescription =>
      'Ative e reordene as fontes de classificação mostradas em todo o aplicativo';

  @override
  String get pluginLabel => 'Plug-in';

  @override
  String get pluginDetected => 'Plug-in detectado';

  @override
  String get pluginNotDetected => 'Plug-in não detectado';

  @override
  String get pluginDetectedDescription =>
      'Plug-in de servidor detectado. A sincronização é ativada automaticamente na primeira vez que o plugin é encontrado.';

  @override
  String get pluginNotDetectedDescription =>
      'O plugin do servidor não foi detectado no momento. As configurações locais ainda usam seus valores salvos ou padrões integrados.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersão: $version';
  }

  @override
  String get availableServices => 'Serviços disponíveis';

  @override
  String get serverPluginSync => 'Sincronização de plug-in de servidor';

  @override
  String get syncSettingsWithPlugin =>
      'Sincronizar configurações com o plugin do servidor';

  @override
  String get whatSyncControls => 'Quais controles de sincronização';

  @override
  String get syncControlsDescription =>
      'A sincronização controla apenas se as configurações apoiadas pelo plug-in são enviadas e extraídas do servidor. A seleção de perfil e as ações de sincronização de perfil estão nas configurações de personalização quando a sincronização do plug-in está habilitada.';

  @override
  String get recentRequests => 'Solicitações recentes';

  @override
  String get recentlyAdded => 'Adicionado recentemente';

  @override
  String get trending => 'Tendências';

  @override
  String get popularMovies => 'Filmes populares';

  @override
  String get movieGenres => 'Gêneros de filmes';

  @override
  String get upcomingMovies => 'Próximos filmes';

  @override
  String get studios => 'Estúdios';

  @override
  String get popularSeries => 'Séries populares';

  @override
  String get seriesGenres => 'Gêneros de séries';

  @override
  String get upcomingSeries => 'Próximas séries';

  @override
  String get networks => 'Redes';

  @override
  String get resetRowsToDefaults => 'Redefinir linhas para os padrões';

  @override
  String get enableSeerr => 'Habilitar Seer';

  @override
  String get showSeerrInNavigation =>
      'Mostrar Seerr na navegação (requer plugin de servidor)';

  @override
  String get seerrUnavailable =>
      'Indisponível porque o suporte do plugin do servidor Seerr está desativado.';

  @override
  String get nsfwFilter => 'Filtro NSFW';

  @override
  String get hideAdultContent => 'Ocultar conteúdo adulto nos resultados';

  @override
  String loggedInAs(String username) {
    return 'Conectado como: $username';
  }

  @override
  String get discoverRows => 'Descubra linhas';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Arraste para reordenar. Habilite ou desabilite linhas. A ordem das linhas habilitada é sincronizada com o plugin Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Arraste para reordenar. Habilite ou desabilite linhas.';

  @override
  String get enabled => 'Habilitado';

  @override
  String get hidden => 'Escondido';

  @override
  String get aboutTitle => 'Sobre';

  @override
  String versionValue(String version) {
    return 'Versão $version';
  }

  @override
  String get openSourceLicenses => 'Licenças de código aberto';

  @override
  String get sourceCode => 'Código Fonte';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Verifique se há atualizações agora';

  @override
  String get checksLatestDesktopRelease =>
      'Verifica a versão de desktop mais recente para esta plataforma';

  @override
  String get youAreUpToDate => 'Você está atualizado.';

  @override
  String get couldNotCheckForUpdates =>
      'Não foi possível verificar atualizações no momento.';

  @override
  String get noCompatibleUpdate =>
      'Nenhum pacote de atualização compatível encontrado para esta plataforma.';

  @override
  String get updateChecksNotSupported =>
      'As verificações de atualização não são suportadas nesta plataforma.';

  @override
  String get updateNotificationsDisabled =>
      'As notificações de atualização estão desativadas.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Aguarde antes de verificar novamente.';

  @override
  String get latestUpdateAlreadyShown =>
      'A última atualização já foi mostrada.';

  @override
  String get updateAvailable => 'Atualização disponível.';

  @override
  String updateAvailableVersion(String version) {
    return 'Atualização disponível: v$version';
  }

  @override
  String get updateNotifications => 'Notificações de atualização';

  @override
  String get showWhenUpdatesAvailable =>
      'Mostrar quando atualizações estão disponíveis';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Disponível';
  }

  @override
  String get readReleaseNotes => 'Leia as notas de versão';

  @override
  String get downloadingUpdate => 'Baixando atualização...';

  @override
  String get updateDownloadFailed =>
      'Falha no download da atualização. Por favor, tente novamente.';

  @override
  String get openReleasesPage => 'Abrir página de lançamentos';

  @override
  String get navigation => 'Navegação';

  @override
  String get watchedIndicatorsBackdrops => 'Indicadores observados, cenários';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Cor do foco, indicadores observados, cenários';

  @override
  String get navbarStyleToolbarAppearance =>
      'Estilo da barra de navegação, botões da barra de ferramentas, aparência';

  @override
  String get reorderToggleHomeRows => 'Reordenar e alternar linhas iniciais';

  @override
  String get featuredContentAppearance => 'Conteúdo em destaque, aparência';

  @override
  String get posterSizeImageTypeFolderView =>
      'Tamanho do pôster, tipo de imagem, visualização de pasta';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB e fontes de classificação';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Claro';

  @override
  String get browse => 'Navegar';

  @override
  String get noResults => 'Nenhum resultado';

  @override
  String get seerrAvailableStatus => 'Disponível';

  @override
  String get seerrRequestedStatus => 'Solicitado';

  @override
  String itemsCount(int count) {
    return '$count Itens';
  }

  @override
  String get seerrSettings => 'Configurações do visualizador';

  @override
  String get requestMore => 'Solicite mais';

  @override
  String get request => 'Solicitar';

  @override
  String get cancelRequest => 'Cancelar solicitação';

  @override
  String get playInMoonfin => 'Jogue em Moonfin';

  @override
  String requestedByName(String name) {
    return 'Solicitado por $name';
  }

  @override
  String get approve => 'Aprovar';

  @override
  String get declineAction => 'Declínio';

  @override
  String get similar => 'Semelhante';

  @override
  String get recommendations => 'Recomendações';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancelar solicitação de \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancelar solicitações $count para \"$title\"?';
  }

  @override
  String get keep => 'Manter';

  @override
  String get itemNotFoundInLibrary =>
      'Item não encontrado em sua biblioteca Moonfin';

  @override
  String get errorSearchingLibrary => 'Erro ao pesquisar biblioteca';

  @override
  String budgetAmount(String amount) {
    return 'Orçamento: \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Receita: \$$amount';
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
  String get submitRequest => 'Enviar solicitação';

  @override
  String get allSeasons => 'Todas as temporadas';

  @override
  String get advancedOptions => 'Opções Avançadas';

  @override
  String get noServiceServersConfigured =>
      'Nenhum servidor de serviço configurado';

  @override
  String get server => 'Servidor';

  @override
  String get qualityProfile => 'Perfil de qualidade';

  @override
  String get rootFolder => 'Pasta raiz';

  @override
  String get showMore => 'Mostrar mais';

  @override
  String get appearances => 'Aparências';

  @override
  String get crewSection => 'Equipe';

  @override
  String ageValue(int age) {
    return 'idade $age';
  }

  @override
  String get noRequests => 'Nenhuma solicitação';

  @override
  String get pendingStatus => 'Pendente';

  @override
  String get declinedStatus => 'Recusado';

  @override
  String get partiallyAvailable => 'Parcialmente disponível';

  @override
  String get downloadingStatus => 'Baixando';

  @override
  String get approvedStatus => 'Aprovado';

  @override
  String get notRequestedStatus => 'Não solicitado';

  @override
  String get blocklistedStatus => 'Na lista de bloqueio';

  @override
  String get deletedStatus => 'Excluído';

  @override
  String get tmdbScore => 'Pontuação TMDB';

  @override
  String get releaseDateLabel => 'Data de lançamento';

  @override
  String get firstAirDateLabel => 'Primeira data de transmissão';

  @override
  String get revenueLabel => 'Receita';

  @override
  String get runtimeLabel => 'Tempo de execução';

  @override
  String get budgetLabel => 'Orçamento';

  @override
  String get originalLanguageLabel => 'Idioma Original';

  @override
  String get seasonsLabel => 'Temporadas';

  @override
  String get episodesLabel => 'Episódios';

  @override
  String get access => 'Acesso';

  @override
  String get add => 'Adicionar';

  @override
  String get address => 'Endereço';

  @override
  String get analytics => 'Análise';

  @override
  String get catalog => 'Catálogo';

  @override
  String get content => 'Contente';

  @override
  String get copy => 'Cópia';

  @override
  String get create => 'Criar';

  @override
  String get disable => 'Desativar';

  @override
  String get done => 'Feito';

  @override
  String get edit => 'Editar';

  @override
  String get encoding => 'Codificação';

  @override
  String get error => 'Erro';

  @override
  String get forward => 'Avançar';

  @override
  String get general => 'Em geral';

  @override
  String get go => 'Ir';

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
  String get next => 'Próximo';

  @override
  String get path => 'Caminho';

  @override
  String get paused => 'Pausado';

  @override
  String get permissions => 'Permissões';

  @override
  String get processing => 'Processamento';

  @override
  String get profile => 'Perfil';

  @override
  String get provider => 'Provedor';

  @override
  String get refresh => 'Atualizar';

  @override
  String get remote => 'Remoto';

  @override
  String get rename => 'Renomear';

  @override
  String get revoke => 'Revogar';

  @override
  String get role => 'Papel';

  @override
  String get root => 'Raiz';

  @override
  String get run => 'Correr';

  @override
  String get search => 'Procurar';

  @override
  String get select => 'Selecione';

  @override
  String get send => 'Enviar';

  @override
  String get sessions => 'Sessões';

  @override
  String get set => 'Definir';

  @override
  String get status => 'Status';

  @override
  String get stop => 'Parar';

  @override
  String get streaming => 'Transmissão';

  @override
  String get time => 'Tempo';

  @override
  String get trickplay => 'Truques';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get up => 'Acima';

  @override
  String get update => 'Atualizar';

  @override
  String get upload => 'Carregar';

  @override
  String get unmute => 'Ativar som';

  @override
  String get mute => 'Mudo';

  @override
  String get branding => 'Marca';

  @override
  String get adminDrawerDashboard => 'Painel';

  @override
  String get adminDrawerAnalytics => 'Análise';

  @override
  String get adminDrawerSettings => 'Configurações';

  @override
  String get adminDrawerBranding => 'Marca';

  @override
  String get adminDrawerUsers => 'Usuários';

  @override
  String get adminDrawerLibraries => 'Bibliotecas';

  @override
  String get adminDrawerTranscoding => 'Transcodificação';

  @override
  String get adminDrawerResume => 'Retomar';

  @override
  String get adminDrawerStreaming => 'Transmissão';

  @override
  String get adminDrawerTrickplay => 'Truques';

  @override
  String get adminDrawerDevices => 'Dispositivos';

  @override
  String get adminDrawerActivity => 'Atividade';

  @override
  String get adminDrawerNetworking => 'Rede';

  @override
  String get adminDrawerApiKeys => 'Chaves de API';

  @override
  String get adminDrawerBackups => 'Cópias de segurança';

  @override
  String get adminDrawerLogs => 'Registros';

  @override
  String get adminDrawerScheduledTasks => 'Tarefas agendadas';

  @override
  String get adminDrawerPlugins => 'Plug-ins';

  @override
  String get adminDrawerRepositories => 'Repositórios';

  @override
  String get adminDrawerLiveTv => 'TV ao vivo';

  @override
  String get adminExitTooltip => 'Sair do administrador';

  @override
  String get adminDashboardLoadFailed => 'Falha ao carregar o painel';

  @override
  String get adminMediaOverview => 'Visão geral da mídia';

  @override
  String get adminMediaTotalsError =>
      'Não foi possível carregar os totais de mídia do servidor.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Uma leitura rápida sobre a quantidade de conteúdo neste servidor.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Atualizações de plug-in disponíveis: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins que requerem reinicialização: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tarefas agendadas com falha: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Entradas recentes de aviso/erro: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribuição de mídia';

  @override
  String get analyticsVideoCodecs => 'Codecs de vídeo';

  @override
  String get analyticsAudioCodecs => 'Codecs de áudio';

  @override
  String get analyticsContainers => 'Recipientes';

  @override
  String get analyticsTopGenres => 'Principais gêneros';

  @override
  String get analyticsReleaseYears => 'Anos de lançamento';

  @override
  String get analyticsContentRatings => 'Avaliações de conteúdo';

  @override
  String get analyticsRuntimeBuckets => 'Baldes de tempo de execução';

  @override
  String get analyticsFileFormats => 'Formatos de arquivo';

  @override
  String get analyticsNoData => 'Nenhum dado disponível.';

  @override
  String get adminServerInfo => 'Informações do servidor';

  @override
  String get adminRestartPending => 'Reinicialização pendente';

  @override
  String get adminServerPaths => 'Caminhos de servidor';

  @override
  String get adminServerActions => 'Ações do servidor';

  @override
  String get adminRestartServer => 'Reinicie o servidor';

  @override
  String get adminShutdownServer => 'Desligar servidor';

  @override
  String get adminScanLibraries => 'Digitalizar bibliotecas';

  @override
  String get adminLibraryScanStarted => 'Verificação da biblioteca iniciada';

  @override
  String errorGeneric(String error) {
    return 'Erro: $error';
  }

  @override
  String get adminServerRebootInProgress =>
      'Reinicialização do servidor em andamento';

  @override
  String get adminServerRebootMessage =>
      'Reinicialização do servidor em andamento, reinicie o Moonfin';

  @override
  String get adminActiveSessions => 'Sessões ativas';

  @override
  String get adminSessionsLoadFailed => 'Falha ao carregar sessões';

  @override
  String get adminNoActiveSessions => 'Nenhuma sessão ativa';

  @override
  String get adminRecentActivity => 'Atividade recente';

  @override
  String get adminNoRecentActivity => 'Nenhuma atividade recente';

  @override
  String adminCommandFailed(String error) {
    return 'Falha no comando: $error';
  }

  @override
  String get adminSendMessage => 'Enviar mensagem';

  @override
  String get adminMessageTextHint => 'Texto da mensagem';

  @override
  String get adminSetVolume => 'Definir volume';

  @override
  String get sessionPrev => 'Anterior';

  @override
  String get sessionRewind => 'Retroceder';

  @override
  String get sessionForward => 'Avançar';

  @override
  String get sessionNext => 'Próximo';

  @override
  String get sessionVolumeDown => 'Volume –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Agora jogando';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Ações';

  @override
  String get videoCodec => 'Codec de vídeo';

  @override
  String get audioCodec => 'Codec de áudio';

  @override
  String get hwAccel => 'Aceleração de hardware';

  @override
  String get completion => 'Conclusão';

  @override
  String get direct => 'Direto';

  @override
  String get adminDisconnect => 'Desconectar';

  @override
  String get adminClearDates => 'Limpar datas';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Falha ao carregar o log de atividades: $error';
  }

  @override
  String get adminNoActivityEntries => 'Nenhuma entrada de atividade';

  @override
  String get adminEditDeviceName => 'Editar nome do dispositivo';

  @override
  String get adminCustomName => 'Nome personalizado';

  @override
  String get adminDeviceNameUpdated => 'Nome do dispositivo atualizado';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Falha ao atualizar o dispositivo: $error';
  }

  @override
  String get adminDeleteDevice => 'Excluir dispositivo';

  @override
  String get adminDeviceDeleted => 'Dispositivo excluído';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Falha ao excluir dispositivo: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Falha ao carregar dispositivos';

  @override
  String get adminSearchDevices => 'Pesquisar dispositivos';

  @override
  String get adminThisDevice => 'Este dispositivo';

  @override
  String get adminEditName => 'Editar nome';

  @override
  String get adminLibrariesLoadFailed => 'Falha ao carregar bibliotecas';

  @override
  String get adminNoLibraries => 'Nenhuma biblioteca configurada';

  @override
  String get adminScanAllLibraries => 'Digitalize todas as bibliotecas';

  @override
  String get adminAddLibrary => 'Adicionar biblioteca';

  @override
  String adminScanFailed(String error) {
    return 'Falha ao iniciar a verificação: $error';
  }

  @override
  String get adminRenameLibrary => 'Renomear biblioteca';

  @override
  String get adminNewName => 'Novo nome';

  @override
  String adminLibraryRenamed(String name) {
    return 'Biblioteca renomeada para \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Falha ao renomear: $error';
  }

  @override
  String get adminDeleteLibrary => 'Excluir biblioteca';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteca \"$name\" excluída';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Falha ao excluir biblioteca: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Falha ao adicionar caminho: $error';
  }

  @override
  String get adminRemovePath => 'Remover caminho';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remover \"$path\" desta biblioteca?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Falha ao remover caminho: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opções de biblioteca salvas';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Falha ao salvar opções: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Falha ao carregar a biblioteca';

  @override
  String get adminNoMediaPaths => 'Nenhum caminho de mídia configurado';

  @override
  String get adminAddPath => 'Adicionar caminho';

  @override
  String get adminBrowseFilesystem =>
      'Navegue pelo sistema de arquivos do servidor:';

  @override
  String get adminSaveOptions => 'Salvar opções';

  @override
  String get adminPreferredMetadataLanguage => 'Idioma de metadados preferido';

  @override
  String get adminMetadataLanguageHint => 'por exemplo en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Código do país dos metadados';

  @override
  String get adminMetadataCountryHint => 'por exemplo EUA, DE, FR';

  @override
  String get adminLibraryNameRequired => 'O nome da biblioteca é obrigatório';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Falha ao criar biblioteca: $error';
  }

  @override
  String get adminLibraryName => 'Nome da Biblioteca';

  @override
  String get adminSelectedPaths => 'Caminhos selecionados:';

  @override
  String get adminNoPathsAdded =>
      'Nenhum caminho adicionado (pode ser adicionado posteriormente)';

  @override
  String get adminCreateLibrary => 'Criar biblioteca';

  @override
  String get paths => 'Caminhos:';

  @override
  String get adminDisableUser => 'Desabilitar usuário';

  @override
  String get adminEnableUser => 'Habilitar usuário';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Desativar $name? Eles não poderão fazer login.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Habilitar $name? Eles poderão fazer login novamente.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Usuário \"$name\" desativado';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Usuário \"$name\" ativado';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Falha ao atualizar a política do usuário: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Falha ao carregar usuários';

  @override
  String get adminSearchUsers => 'Pesquisar usuários';

  @override
  String get adminEditUser => 'Editar usuário';

  @override
  String get adminAddUser => 'Adicionar usuário';

  @override
  String adminUserCreateFailed(String error) {
    return 'Falha ao criar usuário: $error';
  }

  @override
  String get adminCreateUser => 'Criar usuário';

  @override
  String get adminPasswordOptional => 'Senha (opcional)';

  @override
  String get adminUsernameRequired => 'O nome de usuário não pode ficar vazio';

  @override
  String get adminNoProfileChanges => 'Nenhuma alteração de perfil para salvar';

  @override
  String get adminProfileSaved => 'Perfil salvo';

  @override
  String adminSaveFailed(String error) {
    return 'Falha ao salvar: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permissões salvas';

  @override
  String get adminPasswordsMismatch => 'As senhas não coincidem';

  @override
  String adminFailed(String error) {
    return 'Falha: $error';
  }

  @override
  String get adminUserLoadFailed => 'Falha ao carregar usuário';

  @override
  String get adminBackToUsers => 'Voltar para Usuários';

  @override
  String get adminSaveProfile => 'Salvar perfil';

  @override
  String get adminDeleteUser => 'Excluir usuário';

  @override
  String get admin => 'Administrador';

  @override
  String get adminFullAccessWarning =>
      'Os administradores têm acesso completo ao servidor. Conceda com cautela.';

  @override
  String get administrator => 'Administrador';

  @override
  String get adminHiddenUser => 'Usuário oculto';

  @override
  String get adminAllowMediaPlayback => 'Permitir reprodução de mídia';

  @override
  String get adminAllowAudioTranscoding => 'Permitir transcodificação de áudio';

  @override
  String get adminAllowVideoTranscoding => 'Permitir transcodificação de vídeo';

  @override
  String get adminAllowRemuxing => 'Permitir remixagem';

  @override
  String get adminForceRemoteTranscoding =>
      'Forçar transcodificação de fonte remota';

  @override
  String get adminAllowContentDeletion => 'Permitir exclusão de conteúdo';

  @override
  String get adminAllowContentDownloading => 'Permitir download de conteúdo';

  @override
  String get adminAllowPublicSharing => 'Permitir compartilhamento público';

  @override
  String get adminAllowRemoteControl =>
      'Permitir controle remoto de outros usuários';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permitir controle de dispositivo compartilhado';

  @override
  String get adminAllowRemoteAccess => 'Permitir acesso remoto';

  @override
  String get adminRemoteBitrateLimit =>
      'Limite de taxa de bits do cliente remoto (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Deixe em branco sem limite';

  @override
  String get adminMaxActiveSessions => 'Máximo de sessões ativas';

  @override
  String get adminAllowLiveTvAccess => 'Permitir acesso à TV ao vivo';

  @override
  String get adminAllowLiveTvManagement =>
      'Permitir gerenciamento de TV ao vivo';

  @override
  String get adminAllowCollectionManagement =>
      'Permitir gerenciamento de coleção';

  @override
  String get adminAllowSubtitleManagement =>
      'Permitir gerenciamento de legendas';

  @override
  String get adminAllowLyricManagement => 'Permitir gerenciamento de letras';

  @override
  String get adminSavePermissions => 'Salvar permissões';

  @override
  String get adminEnableAllLibraryAccess =>
      'Habilite o acesso a todas as bibliotecas';

  @override
  String get adminSaveAccess => 'Salvar acesso';

  @override
  String get adminChangePassword => 'Alterar a senha';

  @override
  String get adminNewPassword => 'Nova Senha';

  @override
  String get adminConfirmPassword => 'Confirme sua senha';

  @override
  String get adminSetPassword => 'Definir senha';

  @override
  String get adminResetPassword => 'Redefinir senha';

  @override
  String get adminPasswordReset => 'Redefinição de senha';

  @override
  String get adminPasswordUpdated => 'Senha atualizada';

  @override
  String get adminUserSettings => 'Configurações do usuário';

  @override
  String get adminLibraryAccess => 'Acesso à biblioteca';

  @override
  String get adminDeviceAndChannelAccess => 'Acesso a dispositivos e canais';

  @override
  String get adminEnableAllDevices =>
      'Habilite o acesso a todos os dispositivos';

  @override
  String get adminEnableAllChannels => 'Habilite o acesso a todos os canais';

  @override
  String get adminResetPasswordWarning =>
      'Isso removerá a senha. O usuário poderá fazer login sem senha.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Servidor retornou HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Tem certeza de que deseja excluir $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Usuário \"$name\" excluído';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Falha ao excluir usuário: $error';
  }

  @override
  String get adminCreateApiKey => 'Criar chave de API';

  @override
  String get adminAppName => 'Nome do aplicativo';

  @override
  String get adminApiKeyCreated => 'Chave de API criada';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Chave criada com sucesso. O servidor não retornou o token. Verifique as chaves de API do servidor.';

  @override
  String get adminKeyCopied => 'Chave copiada para a área de transferência';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Falha ao criar chave: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token de chave ausente na resposta do servidor';

  @override
  String get adminRevokeApiKey => 'Revogar chave de API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revogar chave para $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Chave de API revogada';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Falha ao revogar chave: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Falha ao carregar chaves de API';

  @override
  String get adminApiKeysTitle => 'Chaves de API';

  @override
  String get adminCreateKey => 'Criar chave';

  @override
  String get adminNoApiKeys => 'Nenhuma chave de API encontrada';

  @override
  String get adminUnknownApp => 'Aplicativo desconhecido';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCriado: $created';
  }

  @override
  String get adminCreatingBackup => 'Criando backup...';

  @override
  String get adminBackupCreated => 'Backup criado com sucesso';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Falha ao criar backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Caminho de backup ausente na resposta do servidor';

  @override
  String adminBackupManifest(String name) {
    return 'Manifesto: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Falha ao carregar o manifesto: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmar restauração';

  @override
  String get adminRestoringBackup => 'Restaurando backup...';

  @override
  String adminRestoreFailed(String error) {
    return 'Falha ao restaurar o backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Falha ao carregar backups';

  @override
  String get adminCreateBackup => 'Criar backup';

  @override
  String get adminNoBackups => 'Nenhum backup encontrado';

  @override
  String get adminViewDetails => 'Ver detalhes';

  @override
  String get restore => 'Restaurar';

  @override
  String get adminLogsLoadFailed => 'Falha ao carregar logs do servidor';

  @override
  String get adminNoLogFiles => 'Nenhum arquivo de log encontrado';

  @override
  String get adminLogCopied => 'Log copiado para a área de transferência';

  @override
  String get adminSaveLogFile => 'Salvar arquivo de registro';

  @override
  String adminSavedTo(String path) {
    return 'Salvo em $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Falha ao salvar arquivo: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Falha ao carregar $fileName';
  }

  @override
  String get adminSearchInLog => 'Pesquisar no registro';

  @override
  String get adminNoMatchingLines => 'Nenhuma linha correspondente';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Falha ao carregar tarefas: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Nenhuma tarefa agendada encontrada';

  @override
  String get adminNoTasksMatchFilter =>
      'Nenhuma tarefa corresponde ao filtro atual';

  @override
  String adminTaskStartFailed(String error) {
    return 'Falha ao iniciar a tarefa: $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Falha ao interromper a tarefa: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Falha ao carregar tarefa: $error';
  }

  @override
  String get adminRunNow => 'Corra agora';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Falha ao remover o gatilho: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Falha ao adicionar gatilho: $error';
  }

  @override
  String get adminLastExecution => 'Última Execução';

  @override
  String get adminTriggers => 'Gatilhos';

  @override
  String get adminAddTrigger => 'Adicionar gatilho';

  @override
  String get adminNoTriggers => 'Nenhum gatilho configurado';

  @override
  String get adminTriggerType => 'Tipo de gatilho';

  @override
  String get adminTimeLimit => 'Limite de tempo (opcional)';

  @override
  String get adminNoLimit => 'Sem limite';

  @override
  String adminHours(String hours) {
    return '$hours hora(s)';
  }

  @override
  String get adminDayOfWeek => 'Dia da semana';

  @override
  String get adminSearchPlugins => 'Pesquisar plug-ins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Falha ao alternar o plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstalar plug-in';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Tem certeza de que deseja desinstalar \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Falha ao desinstalar o plugin: $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Falha ao instalar o pacote: $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Falha ao instalar a atualização: $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Falha ao carregar plug-ins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nenhum plug-in corresponde à sua pesquisa';

  @override
  String get adminNoPluginsInstalled => 'Nenhum plug-in instalado';

  @override
  String adminInstallUpdate(String version) {
    return 'Instalar atualização (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Falha ao carregar o catálogo: $error';
  }

  @override
  String get adminNoPackagesMatchSearch =>
      'Nenhum pacote corresponde à sua pesquisa';

  @override
  String get adminNoPackagesAvailable => 'Nenhum pacote disponível';

  @override
  String get adminExperimentalIntegration => 'Integração Experimental';

  @override
  String get adminExperimentalWarning =>
      'A integração das configurações do plugin ainda é experimental. Algumas páginas de configurações podem não ser renderizadas corretamente.';

  @override
  String get continueAction => 'Continuar';

  @override
  String adminPluginRemoveAfterRestart(String name) {
    return '\"$name\" será removido após a reinicialização do servidor';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Falha ao desinstalar: $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Atualizando \"$name\" para v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Não é possível abrir as configurações: token de autenticação ausente.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Falha ao carregar o plug-in: $error';
  }

  @override
  String get adminPluginNotFound => 'Plug-in não encontrado';

  @override
  String adminPluginVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get adminEnablePlugin => 'Habilitar plug-in';

  @override
  String get adminPluginSettingsPage => 'Página de configurações do plug-in';

  @override
  String get adminRevisionHistory => 'Histórico de revisões';

  @override
  String get adminNoChangelog => 'Nenhum registro de alterações disponível.';

  @override
  String get adminRemoveRepository => 'Remover repositório';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Tem certeza de que deseja remover \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Falha ao salvar repositórios: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Falha ao carregar repositórios: $error';
  }

  @override
  String get adminRepositoryNameHint => 'por exemplo Estável Jellyfin';

  @override
  String get adminRepositoryUrl => 'URL do repositório';

  @override
  String get adminAddEntry => 'Adicionar entrada';

  @override
  String get adminInvalidUrl => 'URL inválido';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Não foi possível carregar as configurações do plugin: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Não foi possível abrir $uri';
  }

  @override
  String get adminOpenInBrowser => 'Abrir no navegador';

  @override
  String get adminOpenExternally => 'Abrir externamente';

  @override
  String get adminGeneralSettings => 'Configurações Gerais';

  @override
  String get adminServerName => 'Nome do servidor';

  @override
  String get adminPreferredMetadataCountry => 'País de metadados preferido';

  @override
  String get adminCachePath => 'Caminho do cache';

  @override
  String get adminMetadataPath => 'Caminho de metadados';

  @override
  String get adminLibraryScanConcurrency =>
      'Simultaneidade de verificação de biblioteca';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limite de codificação de imagem paralela';

  @override
  String get adminSlowResponseThreshold => 'Limite de resposta lenta (ms)';

  @override
  String get adminBrandingSaved => 'Configurações de marca salvas';

  @override
  String get adminBrandingLoadFailed =>
      'Falha ao carregar as configurações de marca';

  @override
  String get adminLoginDisclaimer => 'Isenção de responsabilidade de login';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML exibido abaixo do formulário de login';

  @override
  String get adminCustomCss => 'CSS personalizado';

  @override
  String get adminCustomCssHint => 'CSS personalizado aplicado à interface web';

  @override
  String get adminEnableSplashScreen => 'Ativar tela inicial';

  @override
  String get adminStreamingSaved => 'Configurações de streaming salvas';

  @override
  String get adminStreamingLoadFailed =>
      'Falha ao carregar as configurações de streaming';

  @override
  String get adminStreamingDescription =>
      'Defina limites globais de taxa de bits de streaming para conexões remotas.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Deixe em branco ou 0 para ilimitado';

  @override
  String get adminPlaybackSaved => 'Configurações de reprodução salvas';

  @override
  String get adminPlaybackLoadFailed =>
      'Falha ao carregar as configurações de reprodução';

  @override
  String get adminPlaybackTranscoding => 'Reprodução/Transcodificação';

  @override
  String get adminHardwareAcceleration => 'Aceleração de hardware';

  @override
  String get adminVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Habilitar codificação de hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Habilite a decodificação de hardware para:';

  @override
  String get adminEncodingThreads => 'Codificação de threads';

  @override
  String get adminAutomatic => '0 = automático';

  @override
  String get adminTranscodingTempPath =>
      'Caminho temporário de transcodificação';

  @override
  String get adminEnableFallbackFont => 'Ativar fonte substituta';

  @override
  String get adminFallbackFontPath => 'Caminho da fonte substituta';

  @override
  String get adminAllowSegmentDeletion => 'Permitir exclusão de segmento';

  @override
  String get adminSegmentKeepSeconds => 'Manter segmento (segundos)';

  @override
  String get adminThrottleBuffering => 'Buffer de aceleração';

  @override
  String get adminTrickplaySaved => 'Configurações do Trickplay salvas';

  @override
  String get adminTrickplayLoadFailed =>
      'Falha ao carregar as configurações do trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Habilitar aceleração de hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Ativar extração somente de quadro-chave';

  @override
  String get adminKeyFrameSubtitle => 'Mais rápido, mas com menor precisão';

  @override
  String get adminScanBehavior => 'Comportamento de verificação';

  @override
  String get adminProcessPriority => 'Prioridade do processo';

  @override
  String get adminImageSettings => 'Configurações de imagem';

  @override
  String get adminIntervalMs => 'Intervalo (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Com que frequência capturar quadros';

  @override
  String get adminWidthResolutions => 'Resoluções de largura';

  @override
  String get adminTileWidth => 'Largura do ladrilho';

  @override
  String get adminTileHeight => 'Altura do ladrilho';

  @override
  String get adminQualitySubtitle =>
      'Valores mais baixos = melhor qualidade, arquivos maiores';

  @override
  String get adminProcessThreads => 'Threads de processo';

  @override
  String get adminResumeSaved => 'Retomar configurações salvas';

  @override
  String get adminResumeLoadFailed =>
      'Falha ao carregar as configurações de currículo';

  @override
  String get adminResumeDescription =>
      'Configure quando o conteúdo deve ser marcado como reproduzido parcialmente ou totalmente.';

  @override
  String get adminMinResumePercentage => 'Porcentagem mínima de currículo';

  @override
  String get adminMinResumeSubtitle =>
      'O conteúdo deve ser reproduzido além dessa porcentagem para salvar o progresso';

  @override
  String get adminMaxResumePercentage => 'Porcentagem máxima de currículo';

  @override
  String get adminMaxResumeSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta porcentagem';

  @override
  String get adminMinResumeDuration => 'Duração mínima do currículo (segundos)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Itens menores que isso não são recuperáveis';

  @override
  String get adminMinAudiobookResume =>
      'Porcentagem mínima de currículo de audiolivro';

  @override
  String get adminMaxAudiobookResume =>
      'Porcentagem máxima de currículo de audiolivro';

  @override
  String get adminNetworkingSaved =>
      'Configurações de rede salvas. Pode ser necessário reiniciar o servidor.';

  @override
  String get adminNetworkingLoadFailed =>
      'Falha ao carregar as configurações de rede';

  @override
  String get adminNetworkingWarning =>
      'As alterações nas configurações de rede podem exigir a reinicialização do servidor.';

  @override
  String get adminEnableRemoteAccess => 'Habilitar acesso remoto';

  @override
  String get ports => 'Portas';

  @override
  String get adminHttpPort => 'Porta HTTP';

  @override
  String get adminHttpsPort => 'Porta HTTPS';

  @override
  String get adminPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminBaseUrl => 'URL base';

  @override
  String get adminBaseUrlHint => 'por exemplo /geleia';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Habilitar HTTPS';

  @override
  String get adminLocalNetwork => 'Rede local';

  @override
  String get adminLocalNetworkAddresses => 'Endereços de rede local';

  @override
  String get adminKnownProxies => 'Proxies conhecidos';

  @override
  String get adminRemoteIpFilter => 'Filtro IP remoto';

  @override
  String get adminRemoteIpFilterEntries => 'Filtro IP remoto';

  @override
  String get adminCertificatePath => 'Caminho do certificado';

  @override
  String get whitelist => 'Lista de permissões';

  @override
  String get blacklist => 'Lista negra';

  @override
  String get notSet => 'Não definido';

  @override
  String get adminMetadataSaved => 'Metadados salvos';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Falha ao carregar metadados: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Falha ao salvar metadados: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atualizar metadados';

  @override
  String get recursive => 'Recursivo';

  @override
  String get adminReplaceAllMetadata => 'Substitua todos os metadados';

  @override
  String get adminReplaceAllImages => 'Substitua todas as imagens';

  @override
  String get adminMetadataRefreshRequested =>
      'Atualização de metadados solicitada';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Falha ao atualizar metadados: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Pesquisar Pessoa Remota';

  @override
  String get adminNoRemoteMatches =>
      'Nenhuma correspondência remota encontrada';

  @override
  String get adminRemoteResults => 'Resultados remotos';

  @override
  String get adminRemoteMetadataApplied => 'Metadados remotos aplicados';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Falha na pesquisa remota: $error';
  }

  @override
  String get adminUpdateContentType => 'Atualizar tipo de conteúdo';

  @override
  String get adminContentType => 'Tipo de conteúdo';

  @override
  String get adminContentTypeUpdated => 'Tipo de conteúdo atualizado';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Falha ao atualizar o tipo de conteúdo: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Falha ao carregar o editor de metadados';

  @override
  String get adminNoPeopleEntries => 'Nenhuma entrada de pessoas';

  @override
  String get adminNoExternalIds => 'Nenhum ID externo disponível';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType imagem atualizada';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Falha ao baixar imagem: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Formato de imagem não suportado';

  @override
  String get adminImageReadFailed => 'Falha ao ler a imagem selecionada';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType imagem enviada';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Falha ao fazer upload da imagem: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Excluir imagem $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType imagem excluída';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Falha ao excluir imagem: $error';
  }

  @override
  String get adminAllProviders => 'Todos os provedores';

  @override
  String get adminNoRemoteImages => 'Nenhuma imagem remota encontrada';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Falha na descoberta do sintonizador: $error';
  }

  @override
  String get adminAddTuner => 'Adicionar sintonizador';

  @override
  String get adminTunerType => 'Tipo de sintonizador';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, Outro';

  @override
  String get adminUrlPath => 'URL/Caminho';

  @override
  String get adminNameOptional => 'Nome (opcional)';

  @override
  String get adminTunerAdded => 'Sintonizador adicionado';

  @override
  String adminTunerAddFailed(String error) {
    return 'Falha ao adicionar sintonizador: $error';
  }

  @override
  String get adminAddGuideProvider => 'Adicionar provedor de guia';

  @override
  String get adminProviderType => 'Tipo de provedor';

  @override
  String get adminProviderTypeHint => 'HoráriosDirect ou XMLTV';

  @override
  String get adminUsernameOptional => 'Nome de usuário (opcional)';

  @override
  String get adminRefreshInterval => 'Intervalo de atualização (horas)';

  @override
  String get adminProviderAdded => 'Provedor adicionado';

  @override
  String adminProviderAddFailed(String error) {
    return 'Falha ao adicionar provedor: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Falha ao remover o sintonizador: $error';
  }

  @override
  String get adminTunerResetRequested =>
      'Solicitação de redefinição do sintonizador';

  @override
  String adminTunerResetFailed(String error) {
    return 'Falha ao redefinir o sintonizador: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Falha ao remover provedor: $error';
  }

  @override
  String get adminRecordingSettings => 'Configurações de gravação';

  @override
  String get adminPrePadding => 'Pré-preenchimento (minutos)';

  @override
  String get adminPostPadding => 'Pós-preenchimento (minutos)';

  @override
  String get adminRecordingPath => 'Caminho de gravação';

  @override
  String get adminSeriesRecordingPath => 'Caminho de gravação da série';

  @override
  String get adminRecordingSettingsSaved => 'Configurações de gravação salvas';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Falha ao salvar configurações: $error';
  }

  @override
  String get adminSetChannelMappings => 'Definir mapeamentos de canais';

  @override
  String get adminMappingJson => 'Mapeando JSON';

  @override
  String get adminMappingJsonHint => 'Exemplo: mapeamentos de carga JSON';

  @override
  String get adminChannelMappingsUpdated => 'Mapeamentos de canais atualizados';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Falha ao atualizar mapeamentos: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Falha ao carregar a administração de TV ao vivo';

  @override
  String get adminTunerDevices => 'Dispositivos sintonizadores';

  @override
  String get adminNoTunerHosts => 'Nenhum host do sintonizador configurado';

  @override
  String get adminGuideProviders => 'Provedores de guias';

  @override
  String get adminAddProvider => 'Adicionar provedor';

  @override
  String get adminNoListingProviders =>
      'Nenhum provedor de listagem configurado';

  @override
  String adminRecordingPathDisplay(String path) {
    return 'Caminho de gravação: $path';
  }

  @override
  String adminSeriesPathDisplay(String path) {
    return 'Caminho da série: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Pré-preenchimento: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Pós-preenchimento: $minutes min';
  }

  @override
  String get adminTunerDiscovery => 'Descoberta do sintonizador';

  @override
  String get adminChannelMappings => 'Mapeamentos de canais';

  @override
  String get adminNoDiscoveredTuners => 'Nenhum sintonizador descoberto ainda';

  @override
  String get adminSettingsSaved => 'Configurações salvas';

  @override
  String get adminBackupsNotAvailable =>
      'Os backups não estão disponíveis nesta compilação de servidor.';

  @override
  String get adminRestoreWarning1 =>
      'A restauração substituirá TODOS os dados atuais do servidor pelos dados de backup.';

  @override
  String get adminRestoreWarning2 =>
      'As configurações atuais do servidor, usuários e dados da biblioteca serão substituídos.';

  @override
  String get adminRestoreWarning3 =>
      'O servidor será reiniciado após a restauração.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restaurar backup $name agora?';
  }

  @override
  String get adminRestoreRequested =>
      'Restauração solicitada. A reinicialização do servidor pode desconectar esta sessão.';

  @override
  String get adminBackupsTitle => 'Cópias de segurança';

  @override
  String get adminUnknownDate => 'Data desconhecida';

  @override
  String get adminUnnamedBackup => 'Backup sem nome';

  @override
  String get adminLiveTvNotAvailable =>
      'A administração de TV ao vivo não está disponível nesta versão de servidor.';

  @override
  String get adminLiveTvTitle => 'Administração de TV ao vivo';

  @override
  String get adminApply => 'Aplicar';

  @override
  String get adminNotSet => 'Não definido';

  @override
  String get adminReset => 'Reiniciar';

  @override
  String get adminLogsTitle => 'Registros do servidor';

  @override
  String get adminLogsNewestFirst => 'Mais novo primeiro';

  @override
  String get adminLogsOldestFirst => 'Mais antigo primeiro';

  @override
  String get adminLogsJustNow => 'Agora mesmo';

  @override
  String adminLogsMinutesAgo(int minutes) {
    return '${minutes}m atrás';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h atrás';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d atrás';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Falha ao carregar $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count corresponde';
  }

  @override
  String get adminLogViewerNoMatches => 'Nenhuma linha correspondente';

  @override
  String get adminMetadataEditorTitle => 'Editor de metadados';

  @override
  String get adminMetadataRemote => 'Remoto';

  @override
  String get adminMetadataType => 'Tipo';

  @override
  String get adminMetadataDetails => 'Detalhes';

  @override
  String get adminMetadataExternalIds => 'IDs externos';

  @override
  String get adminMetadataImages => 'Imagens';

  @override
  String get adminMetadataFieldTitle => 'Título';

  @override
  String get adminMetadataFieldSortTitle => 'Classificar título';

  @override
  String get adminMetadataFieldOriginalTitle => 'Título original';

  @override
  String get adminMetadataFieldPremiereDate => 'Data de estreia (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Data de término (AAAA-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Ano de produção';

  @override
  String get adminMetadataFieldOfficialRating => 'Classificação oficial';

  @override
  String get adminMetadataFieldCommunityRating => 'Avaliação da comunidade';

  @override
  String get adminMetadataFieldCriticRating => 'Avaliação crítica';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Visão geral';

  @override
  String get adminMetadataGenres => 'Gêneros';

  @override
  String get adminMetadataTags => 'Etiquetas';

  @override
  String get adminMetadataStudios => 'Estúdios';

  @override
  String get adminMetadataPeople => 'Pessoas';

  @override
  String get adminMetadataAddGenre => 'Adicionar gênero';

  @override
  String get adminMetadataAddTag => 'Adicionar etiqueta';

  @override
  String get adminMetadataAddStudio => 'Adicionar estúdio';

  @override
  String get adminMetadataAddPerson => 'Adicionar pessoa';

  @override
  String get adminMetadataEditPerson => 'Editar pessoa';

  @override
  String get adminMetadataRole => 'Papel';

  @override
  String get adminMetadataImagePrimary => 'Primário';

  @override
  String get adminMetadataImageBackdrop => 'Pano de fundo';

  @override
  String get adminMetadataImageLogo => 'Logotipo';

  @override
  String get adminMetadataImageBanner => 'Bandeira';

  @override
  String get adminMetadataImageThumb => 'Dedão';

  @override
  String get adminMetadataRecursive => 'Recursivo';

  @override
  String get adminMetadataProvider => 'Provedor';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType imagem atualizada';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType imagem enviada';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType imagem excluída';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Falha ao baixar imagem: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Falha ao ler a imagem selecionada';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Falha ao fazer upload da imagem: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Excluir imagem $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Isso remove a imagem atual do item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Falha ao excluir imagem: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Escolha a imagem $imageType';
  }

  @override
  String get adminMetadataUpload => 'Carregar';

  @override
  String get adminMetadataUpdate => 'Atualizar';

  @override
  String get adminMetadataRemoteImage => 'Imagem remota';

  @override
  String get adminPluginsInstalled => 'Instalado';

  @override
  String get adminPluginsCatalog => 'Catálogo';

  @override
  String get adminPluginsActive => 'Ativo';

  @override
  String get adminPluginsRestart => 'Reiniciar';

  @override
  String get adminPluginsNoSearchResults =>
      'Nenhum plug-in corresponde à sua pesquisa';

  @override
  String get adminPluginsNoneInstalled => 'Nenhum plug-in instalado';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Atualização disponível: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Atualização disponível';

  @override
  String get adminPluginsPendingRemoval =>
      'Remoção pendente após reinicialização';

  @override
  String get adminPluginsChangesPending =>
      'Alterações pendentes de reinicialização';

  @override
  String get adminPluginsEnable => 'Habilitar';

  @override
  String get adminPluginsDisable => 'Desativar';

  @override
  String get adminPluginsInstallUpdate => 'Instalar atualização';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Instalar atualização (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Nenhum pacote corresponde à sua pesquisa';

  @override
  String get adminPluginsCatalogEmpty => 'Nenhum pacote disponível';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" está sendo instalado...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integração Experimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'A integração das configurações do plugin ainda é experimental. Alguns campos ou layouts podem ainda não ser renderizados corretamente.';

  @override
  String get adminPluginDetailToggle404 =>
      'Falha ao alternar o plugin. O servidor não conseguiu encontrar esta versão do plugin. Tente atualizar os plug-ins e tente novamente.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Falha ao alternar o plugin. Verifique os logs do servidor para obter detalhes.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Configurações';
  }

  @override
  String get adminPluginDetailDetails => 'Detalhes';

  @override
  String get adminPluginDetailDeveloper => 'Desenvolvedor';

  @override
  String get adminPluginDetailRepository => 'Repositório';

  @override
  String get adminPluginDetailBundled => 'Empacotado';

  @override
  String get adminPluginDetailEnablePlugin => 'Habilitar plug-in';

  @override
  String get adminPluginDetailRestartRequired =>
      'É necessário reiniciar o servidor para que as alterações tenham efeito.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Este plugin será removido após a reinicialização do servidor.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Este plugin não funcionou corretamente e pode não funcionar corretamente.';

  @override
  String get adminPluginDetailNotSupported =>
      'Este plugin não é compatível com a versão atual do servidor.';

  @override
  String get adminPluginDetailSuperseded =>
      'Este plugin foi substituído por uma versão mais recente.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Falha ao carregar repositórios: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Remover repositório';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Tem certeza de que deseja remover \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Remover';

  @override
  String adminReposSaveFailed(String error) {
    return 'Falha ao salvar repositórios: $error';
  }

  @override
  String get adminReposEmpty => 'Nenhum repositório configurado';

  @override
  String get adminReposEmptySubtitle =>
      'Adicione um repositório para navegar pelos plug-ins disponíveis';

  @override
  String get adminReposUnnamed => '(sem nome)';

  @override
  String get adminReposEditTitle => 'Editar repositório';

  @override
  String get adminReposAddTitle => 'Adicionar repositório';

  @override
  String get adminReposUrl => 'URL do repositório';

  @override
  String get adminReposNameHint => 'por exemplo Estável Jellyfin';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL inválido';

  @override
  String get adminGeneralSettingsTitle => 'Configurações Gerais';

  @override
  String get adminGeneralMetadataLanguage => 'Idioma de metadados preferido';

  @override
  String get adminGeneralMetadataLanguageHint => 'por exemplo en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'País de metadados preferido';

  @override
  String get adminGeneralMetadataCountryHint => 'por exemplo EUA, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Simultaneidade de verificação de biblioteca';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limite de codificação de imagem paralela';

  @override
  String get adminUnknownError => 'Erro desconhecido';

  @override
  String get adminBrowse => 'Navegar';

  @override
  String get adminCloseBrowser => 'Fechar navegador';

  @override
  String get adminNetworkingTitle => 'Rede';

  @override
  String get adminNetworkingRestartWarning =>
      'As alterações nas configurações de rede podem exigir a reinicialização do servidor.';

  @override
  String get adminNetworkingRemoteAccess => 'Habilitar acesso remoto';

  @override
  String get adminNetworkingPorts => 'Portas';

  @override
  String get adminNetworkingHttpPort => 'Porta HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Porta HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Habilitar HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Rede local';

  @override
  String get adminNetworkingLocalAddresses => 'Endereços de rede local';

  @override
  String get adminNetworkingAddressHint => 'por exemplo 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxies conhecidos';

  @override
  String get adminNetworkingProxyHint => 'por exemplo 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Lista de permissões';

  @override
  String get adminNetworkingBlacklist => 'Lista negra';

  @override
  String get adminNetworkingAddEntry => 'Adicionar entrada';

  @override
  String get adminBrandingTitle => 'Marca';

  @override
  String get adminBrandingLoginDisclaimer =>
      'Isenção de responsabilidade de login';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML exibido abaixo do formulário de login';

  @override
  String get adminBrandingCustomCss => 'CSS personalizado';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizado aplicado à interface web';

  @override
  String get adminBrandingEnableSplash => 'Ativar tela inicial';

  @override
  String get adminPlaybackHwAccel => 'Aceleração de Hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Aceleração de hardware';

  @override
  String get adminPlaybackEnableHwEncoding =>
      'Habilitar codificação de hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Habilite a decodificação de hardware para:';

  @override
  String get adminPlaybackEncoding => 'Codificação';

  @override
  String get adminPlaybackEncodingThreads => 'Codificação de threads';

  @override
  String get adminPlaybackFallbackFont => 'Ativar fonte substituta';

  @override
  String get adminPlaybackFallbackFontPath => 'Caminho da fonte substituta';

  @override
  String get adminPlaybackStreaming => 'Transmissão';

  @override
  String get adminResumeVideo => 'Vídeo';

  @override
  String get adminResumeAudiobooks => 'Audiolivros';

  @override
  String get adminResumeMinAudiobookPct =>
      'Porcentagem mínima de currículo de audiolivro';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Porcentagem máxima de currículo de audiolivro';

  @override
  String get adminStreamingBitrateLimit =>
      'Limite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Deixe em branco ou 0 para ilimitado';

  @override
  String get adminTrickplayHwAccel => 'Habilitar aceleração de hardware';

  @override
  String get adminTrickplayHwEncoding => 'Habilitar codificação de hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Ativar extração somente de quadro-chave';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Mais rápido, mas com menor precisão';

  @override
  String get adminTrickplayNonBlocking => 'Sem bloqueio';

  @override
  String get adminTrickplayBlocking => 'Bloqueio';

  @override
  String get adminTrickplayPriorityHigh => 'Alto';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Acima do normal';

  @override
  String get adminTrickplayPriorityNormal => 'Normal';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Abaixo do normal';

  @override
  String get adminTrickplayPriorityIdle => 'Parado';

  @override
  String get adminTrickplayImageSettings => 'Configurações de imagem';

  @override
  String get adminTrickplayInterval => 'Intervalo (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Com que frequência capturar quadros';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Larguras de pixels separadas por vírgula (por exemplo, 320)';

  @override
  String get adminTrickplayQuality => 'Qualidade';

  @override
  String get adminTrickplayQScale => 'Escala de qualidade';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valores mais baixos = melhor qualidade, arquivos maiores';

  @override
  String get adminTrickplayJpegQuality => 'Qualidade JPEG';

  @override
  String get adminTrickplayProcessing => 'Processamento';

  @override
  String get adminTasksEmpty => 'Nenhuma tarefa agendada encontrada';

  @override
  String get adminTasksNoFilterMatch =>
      'Nenhuma tarefa corresponde ao filtro atual';

  @override
  String get adminTaskCancelling => 'Cancelando...';

  @override
  String get adminTaskRunning => 'Correndo...';

  @override
  String get adminTaskNeverRun => 'Nunca corra';

  @override
  String get adminTaskStop => 'Parar';

  @override
  String get adminTaskRun => 'Correr';

  @override
  String get adminTaskDetailLastExecution => 'Última Execução';

  @override
  String get adminTaskDetailStarted => 'Iniciado';

  @override
  String get adminTaskDetailEnded => 'Terminou';

  @override
  String get adminTaskDetailDuration => 'Duração';

  @override
  String get adminTaskDetailErrorLabel => 'Erro:';

  @override
  String adminTaskTriggerDaily(String time) {
    return 'Diariamente em $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Cada $day em $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'Cada $duration';
  }

  @override
  String get adminTaskTriggerStartup => 'Na inicialização do aplicativo';

  @override
  String get adminTaskTriggerTypeDaily => 'Diário';

  @override
  String get adminTaskTriggerTypeWeekly => 'Semanalmente';

  @override
  String get adminTaskTriggerTypeInterval => 'Em um intervalo';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalo';

  @override
  String get adminTaskTriggerEveryHour => 'A cada hora';

  @override
  String get adminTaskTriggerEvery6Hours => 'A cada 6 horas';

  @override
  String get adminTaskTriggerEvery12Hours => 'A cada 12 horas';

  @override
  String get adminTaskTriggerEvery24Hours => 'A cada 24 horas';

  @override
  String get adminTaskTriggerEvery2Days => 'A cada 2 dias';

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
  String get adminTaskTriggerNoLimit => 'Sem limite';

  @override
  String get adminActivityJustNow => 'Agora mesmo';

  @override
  String get adminActivityLastHour => 'Última hora';

  @override
  String get adminActivityToday => 'Hoje';

  @override
  String get adminActivityYesterday => 'Ontem';

  @override
  String get adminActivityOlder => 'Mais velho';

  @override
  String adminActivityDaysAgo(int days) {
    return '${days}d atrás';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h atrás';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return '${minutes}m atrás';
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
      'Configure a geração de imagens trickplay para miniaturas de visualização de busca.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminNetworkingBaseUrl => 'URL base';

  @override
  String get adminNetworkingBaseUrlHint => 'por exemplo /geleia';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Caminho do certificado';

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
      'Caminho temporário de transcodificação';

  @override
  String get adminPlaybackSegmentDeletion => 'Permitir exclusão de segmento';

  @override
  String get adminPlaybackSegmentKeep => 'Manter segmento (segundos)';

  @override
  String get adminPlaybackThrottleBuffering => 'Buffer de aceleração';

  @override
  String get adminResumeMinPct => 'Porcentagem mínima de currículo';

  @override
  String get adminResumeMinPctSubtitle =>
      'O conteúdo deve ser reproduzido além dessa porcentagem para salvar o progresso';

  @override
  String get adminResumeMaxPct => 'Porcentagem máxima de currículo';

  @override
  String get adminResumeMaxPctSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta porcentagem';

  @override
  String get adminResumeMinDuration => 'Duração mínima do currículo (segundos)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Itens menores que isso não são recuperáveis';

  @override
  String get adminTrickplayScanBehavior => 'Comportamento de verificação';

  @override
  String get adminTrickplayProcessPriority => 'Prioridade do processo';

  @override
  String get adminTrickplayTileWidth => 'Largura do ladrilho';

  @override
  String get adminTrickplayTileHeight => 'Altura do ladrilho';

  @override
  String get adminTrickplayProcessThreads => 'Threads de processo';

  @override
  String get adminTrickplayWidthResolutions => 'Resoluções de largura';

  @override
  String get adminMetadataDefault => 'Padrão';

  @override
  String get adminMetadataContentTypeUpdated => 'Tipo de conteúdo atualizado';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Falha ao atualizar o tipo de conteúdo: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold =>
      'Limite de resposta lenta (ms)';

  @override
  String get adminGeneralCachePath => 'Caminho do cache';

  @override
  String get adminGeneralMetadataPath => 'Caminho de metadados';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminSettingsLoadFailed => 'Falha ao carregar as configurações';

  @override
  String get adminDiscover => 'Descobrir';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Falha ao atualizar mapeamentos: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limite de tempo: $duration';
  }

  @override
  String get folders => 'Pastas';

  @override
  String get libraries => 'Bibliotecas';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay desativado';

  @override
  String get syncPlayDisabledMessage =>
      'Ative o SyncPlay em Configurações para usar a reprodução sincronizada.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Servidor não suportado';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay requer um servidor Jellyfin. O servidor atual não oferece suporte.';

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
  String get syncPlayIgnoreWait => 'Ignorar espera';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Não segure o grupo enquanto este dispositivo armazena em buffer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continue localmente sem esperar por membros lentos';

  @override
  String get syncPlayRepeat => 'Repita';

  @override
  String get syncPlayRepeatOne => 'Um';

  @override
  String get syncPlayShuffleModeShuffled => 'Embaralhado';

  @override
  String get syncPlayShuffleModeSorted => 'Classificado';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronizar a fila de reprodução atual';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Substitua a fila do grupo pelo que está sendo reproduzido localmente';

  @override
  String get syncPlayLeaveGroup => 'Sair do grupo';

  @override
  String get syncPlayGroupQueue => 'Fila de grupo';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Jogue agora';

  @override
  String get syncPlayCreateNewGroup => 'Crie um novo grupo';

  @override
  String get syncPlayGroupName => 'Nome do grupo';

  @override
  String get syncPlayDefaultGroupName => 'Meu grupo SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Criar grupo';

  @override
  String get syncPlayAvailableGroups => 'Grupos disponíveis';

  @override
  String get syncPlayNoGroupsAvailable => 'Nenhum grupo disponível';

  @override
  String get syncPlayJoinGroupQuestion => 'Participar do grupo SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Participar de um grupo SyncPlay pode substituir sua fila de reprodução atual. Continuar?';

  @override
  String get syncPlayJoin => 'Juntar';

  @override
  String get syncPlayStateIdle => 'Parado';

  @override
  String get syncPlayStateWaiting => 'Esperando';

  @override
  String get syncPlayStatePaused => 'Pausado';

  @override
  String get syncPlayStatePlaying => 'Jogando';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName juntou-se ao grupo SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName saiu do grupo SyncPlay';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Acesso ao SyncPlay negado';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Você não tem acesso a um ou mais itens neste grupo SyncPlay. Peça ao proprietário do grupo para verificar as permissões da biblioteca ou escolha uma fila diferente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Sincronizando a reprodução com $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'A pesquisa por voz não está disponível.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Falha na reprodução direta do Dolby Vision';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'A reprodução direta não foi iniciada para esta transmissão Dolby Vision. Tentar novamente usando a transcodificação do servidor?';

  @override
  String get retryWithTranscode => 'Tentar novamente com transcodificação';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision não compatível';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Este dispositivo não pode decodificar conteúdo Dolby Vision diretamente. Use o substituto HDR10 ou solicite a transcodificação do servidor.';

  @override
  String get rememberMyChoice => 'Lembre-se da minha escolha';

  @override
  String get playHdr10Fallback => 'Reproduzir substituto HDR10';

  @override
  String get requestTranscode => 'Solicitar transcodificação';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Detecte linhas expostas pelo plugin \"Home Screen Sections\" do IAmParadox27. As linhas podem ser habilitadas e reordenadas abaixo.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Nenhum servidor Jellyfin reportando o plugin ainda.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Detecte linhas configuradas por meio do plugin \"KefinTweaks\" do ranaldsgift. Seções personalizadas, lançadas recentemente, assistidas novamente, sazonais e adicionadas recentemente na biblioteca são espelhadas da configuração KefinTweaks em cada servidor Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Nenhum servidor Jellyfin reportando KefinTweaks ainda.';

  @override
  String get integrationOpenHomeSections => 'Abrir seções iniciais';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Ativar, desativar e reordenar linhas';

  @override
  String get integrationInstalledButDisabled => 'Instalado, mas desativado';

  @override
  String get integrationNotInstalled => 'Não instalado';

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
  String get seeAll => 'Ver tudo';

  @override
  String get noItems => 'Nenhum item';

  @override
  String get switchUser => 'Trocar usuário';

  @override
  String get remoteControl => 'Controle remoto';

  @override
  String get mediaBarLoading => 'Carregando barra de mídia...';

  @override
  String get mediaBarError => 'A barra de mídia não foi carregada';

  @override
  String get offlineServerUnavailable =>
      'Conectado à Internet, mas o servidor atual não está disponível.';

  @override
  String get offlineNoInternet =>
      'Você está off-line. Apenas o conteúdo baixado está disponível.';

  @override
  String get offlineFileNotAvailable => 'Arquivo não disponível';

  @override
  String get offlineSwitchServer => 'Trocar servidor';

  @override
  String get offlineSavedMedia => 'Mídia salva';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Reprodução Remota';

  @override
  String castControlFailed(String error) {
    return 'Falha no controle de transmissão: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controles';
  }

  @override
  String get castDeviceVolume => 'Volume do dispositivo';

  @override
  String get castVolumeUnavailable => 'Indisponível';

  @override
  String castStopKind(String kind) {
    return 'Pare $kind';
  }

  @override
  String get audioLabel => 'Áudio';

  @override
  String get subtitlesLabel => 'Legendas';

  @override
  String get pinConfirmTitle => 'Confirmar PIN';

  @override
  String get pinSetTitle => 'Definir PIN';

  @override
  String get pinEnterTitle => 'Insira o PIN';

  @override
  String get pinReenterToConfirm => 'Digite novamente seu PIN para confirmar';

  @override
  String pinEnterNDigit(int length) {
    return 'Insira um PIN de $length dígitos';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Digite seu PIN de $length dígitos';
  }

  @override
  String get pinIncorrect => 'PIN incorreto';

  @override
  String get pinMismatch => 'Os PINs não correspondem';

  @override
  String get pinForgot => 'Esqueceu o PIN?';

  @override
  String get pinClear => 'Claro';

  @override
  String get pinBackspace => 'Retrocesso';

  @override
  String get quickConnectAuthorized =>
      'Solicitação de conexão rápida autorizada.';

  @override
  String get quickConnectInvalidOrExpired =>
      'O código do Quick Connect é inválido ou expirou.';

  @override
  String get quickConnectNotSupported =>
      'O Quick Connect não é compatível com este servidor.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Falha ao autorizar o código do Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'O Quick Connect está desabilitado neste servidor.';

  @override
  String get quickConnectForbidden =>
      'Sua conta não pode autorizar esta solicitação do Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'O código do Quick Connect não foi encontrado. Experimente um novo código.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Falha na conexão rápida: $message';
  }

  @override
  String get quickConnectEnterCode => 'Insira o código';

  @override
  String get quickConnectAuthorize => 'Autorizar';

  @override
  String remoteCommandFailed(String error) {
    return 'Falha no comando: $error';
  }

  @override
  String get remoteControlTitle => 'Controle remoto';

  @override
  String get remoteFailedToLoadSessions => 'Falha ao carregar sessões';

  @override
  String get remoteNoSessions => 'Sem sessões controláveis';

  @override
  String get remoteStartPlayback => 'Iniciar a reprodução em outro dispositivo';

  @override
  String get unknownUser => 'Desconhecido';

  @override
  String get unknownItem => 'Desconhecido';

  @override
  String get remoteNothingPlaying => 'Nada tocando nesta sessão';

  @override
  String get castingStarted =>
      'A transmissão começou no dispositivo selecionado';

  @override
  String castingFailed(String error) {
    return 'Falha ao iniciar a transmissão: $error';
  }

  @override
  String get noRemoteDevices =>
      'Nenhum dispositivo de reprodução remota disponível.';

  @override
  String get noRemoteDevicesIos =>
      'Nenhum dispositivo de reprodução remota disponível.\n\nNo iOS, os alvos AirPlay podem estar indisponíveis no simulador.';

  @override
  String get trackActionPlayNext => 'Jogue a seguir';

  @override
  String get trackActionAddToQueue => 'Adicionar à fila';

  @override
  String get trackActionAddToPlaylist => 'Adicionar à lista de reprodução';

  @override
  String get trackActionCancelDownload => 'Cancelar download';

  @override
  String get trackActionDeleteFromPlaylist => 'Excluir da lista de reprodução';

  @override
  String get trackActionMoveUp => 'Subir';

  @override
  String get trackActionMoveDown => 'Mover para baixo';

  @override
  String get trackActionRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get trackActionAddToFavorites => 'Adicionar aos Favoritos';

  @override
  String get trackActionGoToAlbum => 'Ir para o álbum';

  @override
  String get trackActionGoToArtist => 'Ir para o Artista';

  @override
  String trackActionDownloading(String name) {
    return 'Baixando $name...';
  }

  @override
  String get trackActionDeletedFile => 'Arquivo baixado excluído';

  @override
  String get trackActionDeleteFileFailed =>
      'Não foi possível excluir o arquivo baixado';

  @override
  String get shuffleBy => 'Embaralhar por';

  @override
  String get shuffleSelectLibrary => 'Selecione Biblioteca';

  @override
  String get shuffleSelectGenre => 'Selecione o gênero';

  @override
  String get shuffleLibrary => 'Biblioteca';

  @override
  String get shuffleGenre => 'Gênero';

  @override
  String get shuffleNoLibraries => 'Nenhuma biblioteca compatível disponível.';

  @override
  String get shuffleNoGenres =>
      'Nenhum gênero encontrado para este modo aleatório.';

  @override
  String get posterDisplayTitle => 'Mostrar';

  @override
  String get posterImageType => 'Tipo de imagem';

  @override
  String get imageTypePoster => 'Poster';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Bandeira';

  @override
  String get playlistAddFailed => 'Falha ao adicionar à playlist';

  @override
  String get playlistCreateFailed => 'Falha ao criar lista de reprodução';

  @override
  String get playlistNew => 'Nova lista de reprodução';

  @override
  String get playlistCreate => 'Criar';

  @override
  String get playlistCreateNew => 'Criar nova lista de reprodução';

  @override
  String get playlistNoneFound => 'Nenhuma playlist encontrada';

  @override
  String get addToPlaylist => 'Adicionar à lista de reprodução';

  @override
  String get lyricsNotAvailable => 'Nenhuma letra disponível';

  @override
  String get upNext => 'A seguir';

  @override
  String get playNext => 'Jogue a seguir';

  @override
  String get stillWatchingContent =>
      'A reprodução foi pausada. Você ainda está assistindo?';

  @override
  String get stillWatchingStop => 'Parar';

  @override
  String get stillWatchingContinue => 'Continuar';

  @override
  String skipSegment(String segment) {
    return 'Pular $segment';
  }

  @override
  String get liveTv => 'TV ao vivo';

  @override
  String get continueWatchingAndNextUp => 'Continue assistindo e próximo';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Baixando $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Baixando $fileName';
  }

  @override
  String get nextEpisode => 'Próximo episódio';

  @override
  String get moreFromThisSeason => 'Mais desta temporada';

  @override
  String get playerTooltipPlaybackSpeed => 'Velocidade de reprodução';

  @override
  String get playerTooltipCastControls => 'Controles de transmissão';

  @override
  String get playerTooltipPlaybackQuality => 'Taxa de bits';

  @override
  String get playerTooltipEnterFullscreen => 'Entrar em tela cheia';

  @override
  String get playerTooltipExitFullscreen => 'Sair da tela cheia';

  @override
  String get playerTooltipFloatOnTop => 'Flutuar no topo';

  @override
  String get playerTooltipExitFloatOnTop => 'Desativar flutuação no topo';

  @override
  String get playerTooltipLockLandscape => 'Bloquear paisagem';

  @override
  String get playerTooltipUnlockOrientation => 'Permitir rotação';

  @override
  String get playerTooltipPrevious => 'Anterior';

  @override
  String get playerTooltipSeekBack => 'Procure de volta';

  @override
  String get playerTooltipSeekForward => 'Procure avançar';

  @override
  String get contextMenuMarkWatched => 'Marcar como assistido';

  @override
  String get contextMenuMarkUnwatched => 'Marcar como não assistido';

  @override
  String get contextMenuAddToFavorites => 'Adicionar aos Favoritos';

  @override
  String get contextMenuRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get contextMenuGoToSeries => 'Ir para a série';

  @override
  String get settingsAdministrationSubtitle =>
      'Acesse o painel de administração do servidor';

  @override
  String get settingsAccountSecurity => 'Conta e segurança';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autenticação, código PIN e controle dos pais';

  @override
  String get settingsPersonalization => 'Personalização';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navegação, linhas iniciais e visibilidade da biblioteca';

  @override
  String get settingsDynamicContent => 'Conteúdo Dinâmico';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra de mídia e sobreposições visuais';

  @override
  String get settingsPlaybackSyncplay => 'Reprodução e SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Configurações de áudio/vídeo, legendas, downloads e controles do SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sincronização de plug-ins, Seerr, classificações e muito mais';

  @override
  String get settingsAboutSubtitle =>
      'Versão do aplicativo, informações legais e créditos';

  @override
  String get settingsAuthenticationSection => 'AUTENTICAÇÃO';

  @override
  String get settingsSortServersBy => 'Classificar servidores por';

  @override
  String get settingsLastUsed => 'Último uso';

  @override
  String get settingsAlphabetical => 'Alfabético';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACIDADE E SEGURANÇA';

  @override
  String get settingsBlockedRatings => 'Avaliações bloqueadas';

  @override
  String get settingsGeneralStyle => 'Estilo Geral';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Acentos temáticos, cenários, indicadores assistidos e música temática';

  @override
  String get settingsHomePage => 'Página inicial';

  @override
  String get settingsHomePageSubtitle =>
      'Seções, tipos de imagens, sobreposições e visualizações de mídia';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilidade da biblioteca, visualização de pastas e comportamento multiservidor';

  @override
  String get settingsTwentyFourHourClock => 'Relógio de 24 horas';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Use a formatação de 24 horas sempre que o relógio for mostrado';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Mostrar o botão aleatório na barra de navegação';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Mostrar o botão de gêneros na barra de navegação';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Mostrar o botão de favoritos na barra de navegação';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostrar o botão de bibliotecas na barra de navegação';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicie o Moonfin para que as alterações tenham efeito.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barra de mídia e visualizações locais';

  @override
  String get settingsVisualOverlays => 'Sobreposições visuais';

  @override
  String get settingsSeasonalSurprise => 'Surpresa sazonal';

  @override
  String get settingsMetadataAndRatings => 'Metadados e classificações';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase possibilita integrações do lado do servidor, incluindo fontes de classificação adicionais, solicitações Seerr e preferências sincronizadas.';

  @override
  String get settingsOfflineDownloads => 'Downloads off-line';

  @override
  String get settingsHigh => 'Alto';

  @override
  String get settingsLow => 'Baixo';

  @override
  String get settingsCustomPath => 'Caminho personalizado';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Digite o caminho da pasta de download';

  @override
  String get settingsConcurrentDownloads => 'Downloads simultâneos';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Número máximo de itens para download de uma vez.';

  @override
  String get settingsAppInfo => 'INFORMAÇÕES DO APLICATIVO';

  @override
  String get settingsReportAnIssue => 'Informar um problema';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Abra o rastreador de problemas no GitHub';

  @override
  String get settingsJoinDiscord => 'Junte-se a Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Converse com a comunidade';

  @override
  String get settingsJoinTheDiscord => 'Participe do Discord';

  @override
  String get settingsSupportMoonfin => 'Apoie Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Doe um café para o desenvolvedor';

  @override
  String get settingsLegal => 'JURÍDICO';

  @override
  String get settingsLicenses => 'Licenças';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avisos de licença de código aberto';

  @override
  String get settingsPrivacyPolicy => 'política de Privacidade';

  @override
  String get settingsPrivacyPolicySubtitle => 'Como Moonfin trata seus dados';

  @override
  String get settingsCheckForUpdates => 'Verifique se há atualizações';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Verifique o último lançamento do Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Desenvolvido por Flutter';

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
      'Filtro de tipo de conteúdo aleatório';

  @override
  String get settingsVideoPlaybackPreferences =>
      'Preferências de reprodução de vídeo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Mecanismo de vídeo principal e configurações de qualidade de streaming';

  @override
  String get settingsAudioPreferences => 'Preferências de áudio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Faixas de áudio, processamento e opções de passagem';

  @override
  String get settingsAutomationAndQueue => 'Automação e fila';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Reprodução e sequenciamento automatizados';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Qualidade de download, limites de armazenamento e tamanho da fila';

  @override
  String get settingsSyncplaySubtitle =>
      'Lógica de sincronização para sessões de grupo';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Recursos especializados do jogador. Use com cuidado, pois algumas opções podem causar problemas de reprodução';

  @override
  String get settingsSkipIntrosAndOutros => 'Pular introduções e outros?';

  @override
  String get settingsPromptUser => 'Solicitar usuário';

  @override
  String get settingsSkip => 'Pular';

  @override
  String get settingsDoNothing => 'Não faça nada';

  @override
  String get settingsMaxBitrateDescription =>
      'Limite a taxa de bits do streaming. O conteúdo acima desse limite será transcodificado para caber.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limite a resolução máxima que o player irá solicitar. O conteúdo de resolução mais alta será transcodificado.';

  @override
  String get settingsPlayerZoomDescription =>
      'Como o vídeo deve ser dimensionado para caber na tela.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Mecanismo de reprodução (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Escolha o mecanismo de reprodução padrão em dispositivos Android TV. As alterações se aplicam à próxima sessão de reprodução.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recomendado)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legado)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (legado)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recomendado)';

  @override
  String get settingsDolbyVisionFallback => 'Substituição Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportamento para títulos Dolby Vision em dispositivos sem decodificação Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Pergunte sempre';

  @override
  String get settingsPreferHdr10Fallback => 'Prefira substituto HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Prefira a transcodificação do servidor';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Perfil Dolby Vision 7 Reprodução direta';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controla se os fluxos de camada de aprimoramento do perfil Dolby Vision 7 devem direcionar a reprodução.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automático (AFTKRT habilitado)';

  @override
  String get settingsEnabledOnThisDevice => 'Ativado neste dispositivo';

  @override
  String get settingsDisabledPreferTranscode =>
      'Desativado (prefira transcodificação)';

  @override
  String get settingsResumeRewindDescription =>
      'Ao retomar a reprodução (a partir de Continuar assistindo ou de uma página de item de mídia), quantos segundos devem ser retrocedidos?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Ao retomar a reprodução após pressionar o botão de pausa, quantos segundos devem ser retrocedidos?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Quantos segundos para voltar depois de pressionar o botão de retrocesso.';

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
      'Quantos segundos para avançar depois de pressionar o botão de avanço rápido.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 para decodificador externo';

  @override
  String get settingsCinemaMode => 'Modo Cinema';

  @override
  String get settingsCinemaModeSubtitle =>
      'Reproduzir trailers/prerolls antes de um filme principal';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended mostra um cartão completo com a arte e a descrição do episódio. Mínimo mostra uma sobreposição compacta de contagem regressiva. Desativado oculta totalmente o prompt.';

  @override
  String get settingsShort => 'Curto';

  @override
  String get settingsLong => 'Longo';

  @override
  String get settingsVeryLong => 'Muito Longo';

  @override
  String get settingsVideoStartDelay => 'Atraso no início do vídeo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'TV ao vivo direto';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Ative a reprodução direta para TV ao vivo';

  @override
  String get settingsOpenGroups => 'Grupos abertos';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Crie, participe ou gerencie grupos SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ativado';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Habilite recursos de observação em grupo';

  @override
  String get settingsSyncplayButton => 'Botão SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostrar o botão SyncPlay na barra de navegação';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correção Avançada';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Habilitar lógica de sincronização refinada';

  @override
  String get settingsSyncplaySyncCorrection => 'Correção de sincronização';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Ajuste automaticamente a reprodução para permanecer sincronizado';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocidade para sincronizar';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Use o ajuste da velocidade de reprodução para sincronizar';

  @override
  String get settingsSyncplaySkipToSync => 'Pular para sincronizar';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Use a busca para sincronizar';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Atraso mínimo de velocidade';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Atraso de velocidade máxima';

  @override
  String get settingsSyncplaySpeedDuration => 'Duração da velocidade';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Atraso mínimo para ignorar';

  @override
  String get settingsSyncplayExtraOffset => 'Deslocamento extra do SyncPlay';

  @override
  String get onNow => 'Ativado agora';

  @override
  String get collections => 'Coleções';

  @override
  String get lastPlayed => 'Jogado pela última vez';

  @override
  String libraryNameWithServer(String libraryName, String serverName) {
    return '$libraryName ($serverName)';
  }

  @override
  String latestLibraryName(String libraryName) {
    return 'Último $libraryName';
  }

  @override
  String get autoplayNextEpisode =>
      'Reproduzir automaticamente o próximo episódio';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Reproduza automaticamente o próximo episódio quando disponível.';

  @override
  String get skipSilenceTitle => 'Pular silêncio';

  @override
  String get skipSilenceSubtitle =>
      'Ignora automaticamente segmentos de áudio silenciosos quando suportado pelo stream.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Permitir efeitos de áudio externos';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permitir que aplicativos de equalizador e efeitos (por exemplo, Wavelet) sejam anexados às sessões de reprodução Media3.';

  @override
  String get disableTunnelingTitle => 'Desabilitar tunelamento';

  @override
  String get disableTunnelingSubtitle =>
      'Forçar a reprodução sem tunelamento. Útil em dispositivos com descontinuidades de áudio/vídeo de tunelamento.';

  @override
  String get mapDolbyVisionP7Title => 'Mapear Dolby Vision perfil 7 para HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Reproduza fluxos de perfil Dolby Vision 7 como HEVC compatível com HDR10 em dispositivos não DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Use estilos de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Aplique cores, fontes e posicionamento incorporados na faixa de legenda. Desative para usar suas preferências de estilo de legenda.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Use tamanhos de fonte de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Aplique dicas de tamanho de fonte incorporadas na faixa de legenda. Desative o uso do tamanho da legenda em suas preferências de estilo.';

  @override
  String get useDetailedSubHeadings => 'Use subtítulos detalhados';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Mostrar sub-rows detalhado ou mínimo nas páginas da Biblioteca.';

  @override
  String get savedThemesDeleteDialogTitle => 'Excluir tema salvo?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remover \"$themeName\" do cache deste dispositivo?';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Excluído \"$themeName\" deste dispositivo.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Não foi possível excluir \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Temas salvos';

  @override
  String get savedThemesDescription =>
      'Estes são temas baixados do plugin Moonfin para o servidor atual. A exclusão remove apenas esta cópia local.';

  @override
  String get savedThemesEmpty =>
      'Nenhum tema salvo foi encontrado para este servidor.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Atualmente ativo';
  }

  @override
  String get savedThemesDeleteTooltip => 'Excluir tema salvo';

  @override
  String get savedThemesManageSubtitle =>
      'Gerenciar temas de plug-ins baixados neste dispositivo';

  @override
  String get kefinTweaksTitle => 'KefinTweaks';

  @override
  String get homeScreenSectionsTitle => 'Seções da tela inicial';

  @override
  String get themeEditor => 'Editor de Tema';

  @override
  String get themeEditorSubtitle =>
      'Abra o Editor de Tema Moonfin em seu navegador';

  @override
  String get homeScreen => 'Tela inicial';

  @override
  String get bottomBar => 'Barra inferior';

  @override
  String get homeRowsStyleClassic => 'Clássico';

  @override
  String get homeRowsStyleModern => 'Moderno';

  @override
  String get homeRowsSection => 'Linhas iniciais';

  @override
  String get rowsType => 'Tipo de linhas';

  @override
  String get rowsTypeDescription =>
      'Classic mantém o tipo de imagem por linha e a sobreposição de informações. Moderno usa linhas do retrato ao pano de fundo.';

  @override
  String get displayFavoritesRows => 'Exibir linhas de favoritos';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Mostre filmes, séries favoritos e outras linhas favoritas nas seções iniciais.';

  @override
  String get favoritesRowSorting => 'Classificação de linhas de favoritos';

  @override
  String get favoritesRowSortingDescription =>
      'Classifique as linhas de Favoritos por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get displayCollectionsRows => 'Exibir linhas de coleções';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Mostrar linhas de coleções nas seções iniciais.';

  @override
  String get collectionsRowSorting => 'Classificação de linhas de coleções';

  @override
  String get collectionsRowSortingDescription =>
      'Classifique as linhas das coleções por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get displayGenresRows => 'Exibir linhas de gêneros';

  @override
  String get displayGenresRowsSubtitle =>
      'Mostrar linhas de gêneros nas seções iniciais.';

  @override
  String get genresRowSorting => 'Classificação de linha de gêneros';

  @override
  String get genresRowSortingDescription =>
      'Classifique as linhas de gêneros por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get genresRowItems => 'Itens de linha de gêneros';

  @override
  String get genresRowItemsDescription =>
      'Mostre filmes, séries ou ambos nas linhas de gêneros.';

  @override
  String get appearance => 'Aparência';

  @override
  String get cardSize => 'Tamanho do cartão';

  @override
  String get externalPlayerApp => 'Aplicativo de player externo';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Mostrar seletor de aplicativos quando a reprodução começar.';

  @override
  String get loadingInstalledPlayers => 'Carregando players instalados...';

  @override
  String get connection => 'Conexão';

  @override
  String get audioTranscodeTarget => 'Alvo de transcodificação de áudio';

  @override
  String get passthrough => 'Passagem';

  @override
  String get supportedOnThisDevice => 'Compatível com este dispositivo';

  @override
  String get notSupportedOnThisDevice => 'Não compatível com este dispositivo';

  @override
  String get settingsAudioDtsXPassthrough => 'Passagem DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Bitstream DTS:X (DTS UHD) para decodificador externo.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Passagem TrueHD com Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Comportamento do reprodutor de mídia';

  @override
  String get playbackEnhancements => 'Melhorias de reprodução';

  @override
  String get alwaysOn => 'Sempre ligado.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Substitua Pular outro pela exibição seguinte';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Mostre a sobreposição Next Up em vez do botão Pular Outro.';

  @override
  String get playerRouting => 'Roteamento de Jogador';

  @override
  String get preferSoftwareDecoders => 'Prefira decodificadores de software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Use FFmpeg (áudio) e libgav1 (AV1) antes dos decodificadores de hardware. Desative se a passagem de áudio HDMI for interrompida.';

  @override
  String get useExternalPlayer => 'Usar reprodutor externo';

  @override
  String get useExternalPlayerSubtitle =>
      'Abra a reprodução de vídeo no aplicativo externo selecionado na Android TV.';

  @override
  String get automaticQueuing => 'Enfileiramento Automático';

  @override
  String get preferSdhSubtitles => 'Prefira legendas SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorize faixas de legenda SDH/CC ao selecionar automaticamente.';

  @override
  String get webDiagnostics => 'Diagnóstico da Web';

  @override
  String get webDiagnosticsTitle => 'Moonfin Diagnóstico da Web';

  @override
  String get webDiagnosticsIntro =>
      'Use esta página para diagnosticar problemas de conectividade do navegador (CORS, conteúdo misto e configurações de descoberta).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Falha de conteúdo misto detectada';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Falha de CORS/Preflight detectada';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detectou uma página HTTPS tentando chamar um URL de servidor HTTP. Os navegadores bloqueiam essa solicitação antes que ela chegue ao seu servidor.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detectou uma falha de solicitação no nível do navegador que geralmente é causada pela falta de CORS ou cabeçalhos de simulação no servidor de mídia.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL de destino: $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Detalhe: $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Contexto de tempo de execução atual';

  @override
  String get webDiagnosticsOrigin => 'Origem';

  @override
  String get webDiagnosticsScheme => 'Esquema';

  @override
  String get webDiagnosticsPluginMode => 'Modo Plug-in';

  @override
  String get webDiagnosticsWebRtcScan => 'Verificação WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL do servidor forçado';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL do servidor padrão';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL do proxy de descoberta';

  @override
  String get notConfigured => 'não configurado';

  @override
  String get webDiagnosticsMixedContent => 'Conteúdo Misto';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Esta página é carregada por HTTPS, mas um ou mais URLs configurados são HTTP. Os navegadores impedem que páginas HTTPS chamem APIs HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Correção: sirva seu servidor de mídia ou endpoint de proxy via HTTPS ou carregue Moonfin por HTTP apenas em redes locais confiáveis.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nenhuma configuração óbvia de conteúdo misto detectada nas configurações de tempo de execução atuais.';

  @override
  String get webDiagnosticsCorsChecklist => 'Lista de verificação do CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permitir a origem do navegador em Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Incluir autorização, X-Emby-Authorization e X-Emby-Token em Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Expor Content-Range e Accept-Ranges para streaming e comportamento de busca.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Retornar 204 para solicitações de comprovação de OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemplo de snippet de cabeçalho (estilo nginx)';

  @override
  String get note => 'Observação';

  @override
  String get webDiagnosticsNonWebNote =>
      'Esta rota de diagnóstico destina-se a compilações web. Se você estiver vendo isso em outra plataforma, essas verificações podem não se aplicar.';

  @override
  String get backToServerSelect => 'Voltar para seleção de servidor';

  @override
  String get signOutAllUsers => 'Desconectar todos os usuários';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'A permissão do microfone foi negada permanentemente. Habilite-o nas configurações do sistema.';

  @override
  String get voiceSearchPermissionRequired =>
      'A permissão do microfone é necessária para pesquisa por voz.';

  @override
  String get voiceSearchNoMatch => 'Não entendi isso. Tente novamente.';

  @override
  String get voiceSearchNoSpeechDetected => 'Nenhuma fala detectada.';

  @override
  String get voiceSearchMicrophoneError => 'Erro no microfone.';

  @override
  String get voiceSearchNeedsInternet =>
      'A pesquisa por voz precisa de internet.';

  @override
  String get voiceSearchServiceBusy =>
      'O serviço de voz está ocupado. Tente novamente.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'A permissão do microfone foi negada permanentemente.';

  @override
  String get microphonePermissionDenied =>
      'A permissão do microfone foi negada.';

  @override
  String get speechRecognitionUnavailable =>
      'O reconhecimento de fala não está disponível neste dispositivo.';

  @override
  String get openIosRoutePicker => 'Abra o seletor de rota do iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay o seletor de rota não está disponível neste dispositivo.';

  @override
  String get videos => 'Vídeos';

  @override
  String get trailers => 'Reboques';

  @override
  String get programs => 'Programas';

  @override
  String get songs => 'Músicas';

  @override
  String get photoAlbums => 'Álbuns de fotos';

  @override
  String get photos => 'Fotos';

  @override
  String get people => 'Pessoas';

  @override
  String get recentlyReleasedEpisodes => 'Episódios lançados recentemente';

  @override
  String get watchAgain => 'Assistir novamente';

  @override
  String get guestAppearances => 'Participações de convidados';

  @override
  String get appearancesSeerr => 'Aparições (Seerr)';

  @override
  String get watchWithGroup => 'Assista com grupo';

  @override
  String get errors => 'Erros';

  @override
  String get warnings => 'Avisos';

  @override
  String get disk => 'Disco';

  @override
  String get openInBrowser => 'Abrir no navegador';

  @override
  String get embeddedBrowserNotAvailable =>
      'O navegador incorporado não está disponível nesta plataforma.';

  @override
  String get adminRestartServerConfirmation =>
      'Tem certeza de que deseja reiniciar o servidor?';

  @override
  String get adminShutdownServerConfirmation =>
      'Tem certeza de que deseja encerrar o servidor? Você precisará reiniciá-lo manualmente.';

  @override
  String get internal => 'Interno';

  @override
  String get idle => 'Parado';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nenhum usuário encontrado';

  @override
  String get adminNoUsersMatchSearch =>
      'Nenhum usuário corresponde à sua pesquisa';

  @override
  String get adminNoDevicesFound => 'Nenhum dispositivo encontrado';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nenhum dispositivo corresponde aos filtros atuais';

  @override
  String get passwordSet => 'Conjunto de senha';

  @override
  String get noPasswordConfigured => 'Nenhuma senha configurada';

  @override
  String get remoteAccess => 'Acesso remoto';

  @override
  String get localOnly => 'Somente locais';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Falha ao carregar análise de mídia';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Análises combinadas em todas as bibliotecas de mídia.';

  @override
  String get analyticsTopArtists => 'Principais artistas';

  @override
  String get analyticsTopAuthors => 'Principais autores';

  @override
  String get analyticsTopContributors => 'Principais colaboradores';

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
      'Nenhum total de mídia indexada está disponível para esta seleção ainda.';

  @override
  String get analyticsLibraryDetails => 'Detalhes da biblioteca';

  @override
  String get analyticsLibraryBreakdown => 'Divisão da Biblioteca';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Nenhuma biblioteca está disponível.';

  @override
  String get adminServerAdministrationTitle => 'Administração de Servidor';

  @override
  String get adminServerPathData => 'Dados';

  @override
  String get adminServerPathImageCache => 'Cache de imagens';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Registros';

  @override
  String get adminServerPathMetadata => 'Metadados';

  @override
  String get adminServerPathTranscode => 'Transcodificar';

  @override
  String get adminServerPathWeb => 'Rede';

  @override
  String get adminNoServerPathsReturned =>
      'Nenhum caminho de servidor retornado por este servidor.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% usado';
  }

  @override
  String get userActivity => 'Atividade do usuário';

  @override
  String get systemEvents => 'Eventos do sistema';

  @override
  String get needsAttention => 'Precisa de atenção';

  @override
  String get adminDrawerSectionServer => 'Servidor';

  @override
  String get adminDrawerSectionPlayback => 'Reprodução';

  @override
  String get adminDrawerSectionDevices => 'Dispositivos';

  @override
  String get adminDrawerSectionAdvanced => 'Avançado';

  @override
  String get adminDrawerSectionPlugins => 'Plug-ins';

  @override
  String get adminDrawerSectionLiveTv => 'TV ao vivo';

  @override
  String get homeVideos => 'Vídeos caseiros';

  @override
  String get mixedContent => 'Conteúdo Misto';

  @override
  String get homeVideosAndPhotos => 'Vídeos e fotos caseiras';

  @override
  String get mixedMoviesAndShows => 'Filmes e programas mistos';

  @override
  String get intelQuickSync => 'Sincronização rápida Intel';

  @override
  String get rockchipMpp => 'MPP Rockchip';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Nenhuma gravação encontrada';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Nenhuma página de imagem encontrada no arquivo .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Falha no renderizador incorporado ($code): $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Falha no renderizador EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Arquivo local ausente para leitor: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status ao abrir dados do livro de $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nenhum endpoint de livro legível disponível';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Formato de arquivo de quadrinhos não suportado: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'O plugin de extração CBR não está disponível nesta plataforma.';

  @override
  String get failedToExtractCbrArchive => 'Falha ao extrair o arquivo .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'A extração CB7 não está disponível nesta plataforma.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'O plugin de extração CB7 não está disponível nesta plataforma.';

  @override
  String get closeGenrePanel => 'Fechar painel de gênero';

  @override
  String get loadingShuffle => 'Carregando ordem aleatória...';

  @override
  String get libraryShuffleLabel => 'LIBRARY SHUFFLE';

  @override
  String get randomShuffleLabel => 'RANDOM SHUFFLE';

  @override
  String get genresShuffleLabel => 'GENRES SHUFFLE';

  @override
  String get autoHdrSwitching => 'Troca automática de HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Ative automaticamente o HDR para reprodução de vídeo HDR e restaure o modo de exibição ao sair.';

  @override
  String get whenFullscreen => 'Quando em tela cheia';

  @override
  String get transcodingLimits => 'Limites de transcodificação';
}
