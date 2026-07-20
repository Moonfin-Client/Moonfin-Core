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
  String get accountPreferences => 'PREFERÊNCIAS DA CONTA';

  @override
  String get interfaceLanguage => 'Idioma da Interface';

  @override
  String get systemLanguageDefault => 'Padrão do Sistema';

  @override
  String get signIn => 'Entrar';

  @override
  String get empty => 'Vazio';

  @override
  String connectingToServer(String serverName) {
    return 'Conectando-se a $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get detailScreenStyle => 'Estilo da tela de detalhes';

  @override
  String get detailScreenStyleSubtitle =>
      'Clássico é o layout centralizado original do Moonfin. Moderno é um layout cinematográfico responsivo.';

  @override
  String get detailScreenStyleMoonfin => 'Clássico';

  @override
  String get detailScreenStyleModern => 'Moderno';

  @override
  String get expandedTabs => 'Abas Expandidas';

  @override
  String get expandedTabsSubtitle =>
      'Mostrar automaticamente o conteúdo das abas ao navegar entre elas. Desative para abrir e fechar cada aba manualmente.';

  @override
  String get showTechnicalDetails => 'Mostrar Detalhes Técnicos?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Mostrar informações de codec, resolução e stream no resumo do banner';

  @override
  String get recommendationSystem => 'Sistema de Recomendações';

  @override
  String get recommendationSystemSubtitle =>
      'Use o algoritmo de biblioteca local do Moonfin Recomenda ou as métricas de similaridade online do TMDb. Nota: as recomendações online exigem a integração com o Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recomenda';

  @override
  String get recommendationSystemTmdb => 'Similaridade TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Aplicar Limite de Classificação Etária?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limitar as sugestões do Moonfin Recomenda pela classificação etária do conteúdo de destino';

  @override
  String get interfaceStyle => 'Estilo da Interface';

  @override
  String get interfaceStyleSubtitle =>
      'Automático acompanha o seu dispositivo. Escolha Apple ou Material para forçar um visual.';

  @override
  String get interfaceStyleAutomatic => 'Automático';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Qualidade do Vidro';

  @override
  String get glassQualitySubtitle =>
      'Automático escolhe o melhor efeito de vidro para este dispositivo. Completo força desfoque real; Reduzido usa um vidro leve que poupa energia da GPU.';

  @override
  String get glassQualityAuto => 'Automático';

  @override
  String get glassQualityFull => 'Completo';

  @override
  String get glassQualityReduced => 'Reduzido';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alternar entre Moonfin e Neon Pulse sem reiniciar o aplicativo';

  @override
  String get customThemeTitle => 'Tema Personalizado';

  @override
  String get customThemeSubtitle =>
      'Os temas personalizados alteram elementos visuais em todo o Moonfin. Escolha uma destas opções para combinar com o seu estilo.';

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
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Estilo de vidro líquido com fundo em gradiente flutuante, superfícies foscas e destaque em azul Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Estilo retro em pixel art com paleta robusta, bordas em blocos, sombras marcadas e fonte de pixels';

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
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Em pausa';

  @override
  String get gameSaveState => 'Salvar estado';

  @override
  String get games => 'Jogos';

  @override
  String get gameLoadState => 'Carregar estado';

  @override
  String get gameFastForward => 'Avanço rápido';

  @override
  String get gameEmulatorSettings => 'Configurações do emulador';

  @override
  String get gameNoCoreOptions => 'Este core não tem opções ajustáveis.';

  @override
  String get gameHoldToOpenMenu => 'Segure para abrir o menu';

  @override
  String get gamePlaybackUnsupported =>
      'Este dispositivo ainda não suporta a execução de jogos.';

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
  String get latestBooks => 'Livros Recentes';

  @override
  String get latestAudiobooks => 'Audiolivros Recentes';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Livro';

  @override
  String get bookFormatAudiobook => 'Audiolivro';

  @override
  String bookPercentRead(int percent) {
    return '$percent% lido';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time restantes';
  }

  @override
  String get bookHeroRead => 'Ler';

  @override
  String get bookHeroListen => 'Ouvir';

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
      other: '$count audiolivros',
      one: '1 audiolivro',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista de Faixas';

  @override
  String get itemListPlaceholder => 'A lista de itens aparecerá aqui';

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
      other: '$count Temporadas',
      one: '1 Temporada',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Termina em $time';
  }

  @override
  String get items => 'Itens';

  @override
  String get extras => 'Extras';

  @override
  String get behindTheScenes => 'Bastidores';

  @override
  String get deletedScenes => 'Cenas Excluídas';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Entrevistas';

  @override
  String get scenes => 'Cenas';

  @override
  String get shorts => 'Curtas';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return '$time restantes';
  }

  @override
  String endsIn(String time) {
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
  String get castMembers => 'Cast';

  @override
  String get trailer => 'Trailer';

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
  String get finalizingDownload => 'Finalizing…';

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
  String failedToDeleteItemWithError(String error) {
    return 'Deletion operation failed with the following error: $error';
  }

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
  String get none => 'Nenhuma';

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
  String get directors => 'DIRETORES';

  @override
  String get writer => 'ROTEIRO';

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
      other: '$count faixas',
      one: '1 faixa',
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
  String get shuffleAllMusic => 'Reproduzir toda a música aleatoriamente';

  @override
  String get carSignInPrompt => 'Entre no Moonfin no seu telefone';

  @override
  String get carServerUnreachable =>
      'Não foi possível conectar ao seu servidor';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Correspondência perfeita';

  @override
  String channelsCount(int count) {
    return '$count canais';
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
  String guideNextProgram(String time, String title) {
    return 'A seguir: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m restantes';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h restantes';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m restantes';
  }

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
  String get record => 'Gravar';

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
  String get seerr => 'Seerr';

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
    return 'T$season E$episode';
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
    return 'T$number';
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
      other: '$count episódios',
      one: '1 episódio',
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
  String get themeMusicSettingsSubtitle =>
      'Páginas de detalhes, linhas do início e volume';

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
  String get loopThemeMusic => 'Repetir Música-Tema';

  @override
  String get loopThemeMusicSubtitle =>
      'Repetir a faixa em vez de reproduzi-la uma única vez';

  @override
  String get detailsBackgroundBlur => 'Desfoque do Fundo de Detalhes';

  @override
  String get detailsBackgroundOpacity => 'Details Background Opacity';

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
  String get settingsScrollWheelAction => 'Roda do mouse';

  @override
  String get settingsScrollWheelActionDescription =>
      'Escolha o que a rolagem da roda do mouse sobre o vídeo faz durante a reprodução.';

  @override
  String get scrollWheelActionOff => 'Desligado';

  @override
  String get scrollWheelActionSeek => 'Buscar (avançar / retroceder)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Ajustar';

  @override
  String get autoCrop => 'Corte Automático';

  @override
  String get stretch => 'Esticar';

  @override
  String get refreshRateSwitching => 'Troca de Taxa de Atualização';

  @override
  String get disabled => 'Desativado';

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
  String get fallbackAudioLanguage => 'Idioma de Áudio Alternativo';

  @override
  String get preferDefaultAudioTrack => 'Preferir Faixa de Áudio Padrão';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferir a faixa de áudio original em vez da dublagem localizada.';

  @override
  String get preferAudioDescription => 'Preferir Faixas de Audiodescrição';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferir faixas de audiodescrição em vez das faixas normais.';

  @override
  String get transcodingAudio => 'Transcodificação (Áudio)';

  @override
  String get directStreamRemux => 'Stream Direto (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcodificação (Taxa de Bits ou Resolução)';

  @override
  String get transcodingVideoAndAudio => 'Transcodificação (Vídeo e Áudio)';

  @override
  String get transcodingVideo => 'Transcodificação (Vídeo)';

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
  String get settingsAudioOutputModeDescription =>
      'Escolha como o áudio é decodificado. O Passthrough AVR envia streams Dolby/DTS brutos para o seu receptor; Automático ou Downmix decodificam localmente.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Passagem AVR';

  @override
  String get settingsAudioFallbackCodec => 'Codec substituto de áudio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Selecione o formato de destino para transcodificar áudio multicanal quando o stream de origem não puder ser reproduzido diretamente nem enviado por passthrough.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Detecção Automática\n(Recomendado)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Padrão)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Sem perdas)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Apenas Estéreo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Eficiente)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Sem perdas)';

  @override
  String get settingsMaxAudioChannels => 'Máximo de Canais de Áudio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configure o número máximo de canais da sua configuração de áudio. Streams multicanal que excedam este limite serão reduzidos (downmix) ou transcodificados.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Detecção Automática\n(Padrão do Hardware)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Estéreo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadrifônico';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

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
  String get settingsAudioRouteHeadphones => 'Fones de ouvido';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count canais PCM';
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
  String get subtitleMode => 'Modo de Legendas';

  @override
  String get subtitleModeFlagged => 'Marcadas';

  @override
  String get subtitleModeAlways => 'Sempre';

  @override
  String get subtitleModeForeign => 'Estrangeiras';

  @override
  String get subtitleModeForced => 'Forçadas';

  @override
  String get subtitleModeFlaggedDescription =>
      'Reproduz faixas marcadas internamente nos metadados do arquivo de mídia como \"default\" ou \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Carrega e exibe legendas automaticamente sempre que um vídeo começa.';

  @override
  String get subtitleModeForeignDescription =>
      'Ativa as legendas automaticamente se a faixa de áudio padrão estiver em um idioma estrangeiro.';

  @override
  String get subtitleModeForcedDescription =>
      'Carrega apenas legendas explicitamente marcadas com o sinalizador de metadados \"forced\".';

  @override
  String get subtitleModeNoneDescription =>
      'Desativa completamente o carregamento automático de legendas.';

  @override
  String get fallbackSubtitleLanguage => 'Idioma de Legendas Alternativo';

  @override
  String get subtitleStream => 'Stream de Legendas';

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
  String get reportDownloadsActivity => 'Mostrar downloads no servidor';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permitir que o administrador do servidor veja seus downloads transcodificados no painel';

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
  String get navbarAlwaysExpanded =>
      'Sempre Expandir Rótulos da Barra de Navegação';

  @override
  String get showSeerrButton => 'Mostrar Botão do Seerr';

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
  String get groupItemsIntoCollections => 'Agrupar Itens em Coleções';

  @override
  String get hideCollectionAssociatedItems =>
      'Ocultar itens da biblioteca associados a coleções ao navegar pelas bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Aviso de Agrupamento de Bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Para usar esta configuração, certifique-se de que as opções \"Agrupar filmes em coleções\" e/ou \"Agrupar séries em coleções\" estão ativadas nas configurações de Exibição da sua biblioteca no seu servidor Jellyfin ou Emby.';

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
      'Escolha entre vários estilos de barra de mídia ou desative a barra de mídia';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desativado';

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
  String get trailerAudio => 'Áudio do Trailer';

  @override
  String get enableTrailerAudio =>
      'Ativar o áudio dos trailers na barra de mídia';

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
  String get fullScreenRows => 'Linhas do Início Expandidas';

  @override
  String get fullScreenRowsDescription =>
      'Limitar as linhas do início a 1 linha por tela';

  @override
  String get homeRowsPadding => 'Home Row Padding';

  @override
  String get homeRowsPaddingDescription =>
      'Customize padding between home rows';

  @override
  String get perRowImageType => 'Tipo de Imagem por Linha';

  @override
  String get perRowSettings => 'Configurações por Linha';

  @override
  String get autoLogin => 'Login Automático';

  @override
  String get lastUser => 'Último Usuário';

  @override
  String get currentUser => 'Usuário Atual';

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
  String get clockModeStatic => 'Estático';

  @override
  String get clockModeBouncing => 'Saltitante';

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
  String get pluginLabel => 'Plug-in Moonbase';

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
  String get seerrDiscoveryRows => 'Linhas de Descoberta do Seerr';

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
  String get seerrNotificationsSection => 'Notificações';

  @override
  String get seerrNotifyNewRequestsTitle =>
      'Notificações de novas solicitações';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Avisar quando alguém enviar uma solicitação';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Atualizações de solicitações';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Aprovadas, recusadas e adicionadas à sua biblioteca';

  @override
  String get seerrNotifyIssuesTitle => 'Atualizações de problemas';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Novos problemas, respostas e resoluções';

  @override
  String loggedInAs(String username) {
    return 'Conectado como: $username';
  }

  @override
  String get discoverRows => 'Página de Descoberta do Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Habilite as linhas que deseja ver na página principal do Seerr. Arraste para reordenar. A ordem personalizada é sincronizada com o Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Habilite as linhas que deseja ver na página principal do Seerr. Arraste para reordenar. A ordem personalizada é sincronizada com o Moonbase.';

  @override
  String get enabled => 'Ativado';

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
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limite do cache de imagens';

  @override
  String get clearImageCache => 'Limpar cache de imagens';

  @override
  String get imageCacheCleared => 'Cache de imagens limpo';

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
  String seerrDownloadingPercent(int percent) {
    return 'Baixando · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importando';

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
  String get appearances => 'Participações';

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
  String get failedStatus => 'Falhou';

  @override
  String get processingStatus => 'Processando';

  @override
  String modifiedByName(String name) {
    return 'Modificado por $name';
  }

  @override
  String get completedStatus => 'Concluído';

  @override
  String get requestErrorDuplicate => 'Este título já foi solicitado';

  @override
  String get requestErrorQuota => 'Limite de solicitações atingido';

  @override
  String get requestErrorBlocklisted => 'Este título está na lista de bloqueio';

  @override
  String get requestErrorNoSeasons => 'Não há mais temporadas para solicitar';

  @override
  String get requestErrorPermission =>
      'Você não tem permissão para fazer esta solicitação';

  @override
  String get seerrRequestsTitle => 'Solicitações';

  @override
  String get seerrIssuesTitle => 'Problemas';

  @override
  String get sortNewest => 'Mais recentes';

  @override
  String get sortLastModified => 'Última modificação';

  @override
  String get noIssues => 'Nenhum problema';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining de $limit solicitações de filmes restantes';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining de $limit solicitações de temporadas restantes';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Parte de $name';
  }

  @override
  String get viewCollection => 'Ver Coleção';

  @override
  String get requestCollection => 'Solicitar Coleção';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmes · $available disponíveis';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Solicitar $count filmes';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Solicitando $current de $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count filmes solicitados';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok de $total filmes solicitados';
  }

  @override
  String get collectionAllRequested =>
      'Todos os filmes já estão disponíveis ou solicitados';

  @override
  String get reportIssue => 'Relatar Problema';

  @override
  String get issueTypeVideo => 'Vídeo';

  @override
  String get issueTypeAudio => 'Áudio';

  @override
  String get whatsWrong => 'Qual é o problema?';

  @override
  String get allEpisodes => 'Todos os Episódios';

  @override
  String get episode => 'Episódio';

  @override
  String get openStatus => 'Aberto';

  @override
  String get resolvedStatus => 'Resolvido';

  @override
  String get resolveAction => 'Resolver';

  @override
  String get reopenAction => 'Reabrir';

  @override
  String reportedByName(String name) {
    return 'Relatado por $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String get addComment => 'Adicionar um comentário';

  @override
  String get deleteIssueConfirm => 'Excluir este problema?';

  @override
  String get submitReport => 'Enviar Relato';

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
  String get remote => 'Controle remoto';

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
  String get trickplay => 'Trickplay';

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
  String get adminDrawerDisplay => 'Exibição';

  @override
  String get adminDrawerMetadata => 'Metadados';

  @override
  String get adminDrawerNfo => 'Configurações de NFO';

  @override
  String get adminDrawerTranscoding => 'Transcodificação';

  @override
  String get adminDrawerResume => 'Retomar';

  @override
  String get adminDrawerStreaming => 'Transmissão';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminActivitySeverityAll => 'Todas as severidades';

  @override
  String get adminActivityDateRange => 'Intervalo de datas';

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
  String adminRemoveDeviceConfirm(String name) {
    return 'Remover o dispositivo \'$name\'? O usuário precisará entrar novamente neste dispositivo.';
  }

  @override
  String get adminDeleteAllDevices => 'Excluir todos os dispositivos';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remover $count dispositivos? Os usuários afetados precisarão entrar novamente. O seu dispositivo atual não é afetado.';
  }

  @override
  String get adminDevicesDeletedAll => 'Dispositivos removidos';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Alguns dispositivos foram removidos; $count não puderam ser removidos.';
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
  String get adminLibraryTabPaths => 'Caminhos';

  @override
  String get adminLibraryTabOptions => 'Opções';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Gravadores de metadados';

  @override
  String get adminLibSubtitleDownloaders => 'Downloaders de legendas';

  @override
  String get adminLibLyricDownloaders => 'Downloaders de letras';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Downloaders de metadados: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Buscadores de imagens: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Este servidor não expõe downloaders para este tipo de biblioteca.';

  @override
  String get adminLibrarySectionGeneral => 'Geral';

  @override
  String get adminLibrarySectionMetadata => 'Metadados';

  @override
  String get adminLibrarySectionEmbedded => 'Informações Incorporadas';

  @override
  String get adminLibrarySectionSubtitles => 'Legendas';

  @override
  String get adminLibrarySectionImages => 'Imagens';

  @override
  String get adminLibrarySectionSeries => 'Séries';

  @override
  String get adminLibrarySectionMusic => 'Música';

  @override
  String get adminLibrarySectionMovies => 'Filmes';

  @override
  String get adminLibRealtimeMonitor => 'Ativar monitoramento em tempo real';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detectar alterações nos arquivos e processá-las automaticamente.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Tratar arquivos compactados como arquivos de mídia';

  @override
  String get adminLibEnablePhotos => 'Exibir fotos';

  @override
  String get adminLibSaveLocalMetadata => 'Salvar imagens nas pastas de mídia';

  @override
  String get adminLibRefreshInterval => 'Atualização automática de metadados';

  @override
  String get adminLibRefreshNever => 'Nunca';

  @override
  String get adminLibDefault => 'Padrão';

  @override
  String get adminLibDisplayTitle => 'Exibição';

  @override
  String get adminLibDisplaySection => 'Exibição da biblioteca';

  @override
  String get adminLibFolderView =>
      'Exibir uma visualização de pastas para mostrar pastas de mídia simples';

  @override
  String get adminLibSpecialsInSeasons =>
      'Exibir especiais dentro das temporadas em que foram exibidos';

  @override
  String get adminLibGroupMovies => 'Agrupar filmes em coleções';

  @override
  String get adminLibGroupShows => 'Agrupar séries em coleções';

  @override
  String get adminLibExternalSuggestions =>
      'Mostrar conteúdo externo nas sugestões';

  @override
  String get adminLibDateAddedSection => 'Comportamento da data de adição';

  @override
  String get adminLibDateAddedLabel => 'Usar data de adição de';

  @override
  String get adminLibDateAddedImport => 'Data da análise na biblioteca';

  @override
  String get adminLibDateAddedFile => 'Data de criação do arquivo';

  @override
  String get adminLibMetadataTitle => 'Metadados e Imagens';

  @override
  String get adminLibMetadataLangSection => 'Idioma preferido dos metadados';

  @override
  String get adminLibChaptersSection => 'Capítulos';

  @override
  String get adminLibDummyChapterDuration =>
      'Duração dos capítulos fictícios (segundos)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Duração dos capítulos gerados para mídias que não os possuem. Defina como 0 para desativar.';

  @override
  String get adminLibChapterImageResolution =>
      'Resolução das imagens de capítulo';

  @override
  String get adminLibNfoTitle => 'Configurações de NFO';

  @override
  String get adminLibNfoHelp =>
      'Os metadados NFO são compatíveis com o Kodi e clientes semelhantes. As configurações aplicam-se a todas as bibliotecas que salvam metadados NFO.';

  @override
  String get adminLibKodiUser =>
      'Usuário cujos dados de exibição serão armazenados nos arquivos NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Salvar caminhos das imagens nos arquivos NFO';

  @override
  String get adminLibPathSubstitution =>
      'Ativar substituição de caminhos para os caminhos de imagem NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copiar imagens extrafanart para uma pasta extrathumbs';

  @override
  String get adminLibNone => 'Nenhum';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dias';
  }

  @override
  String get adminLibEmbeddedTitles => 'Usar títulos incorporados';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Usar títulos incorporados para extras';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Usar informações de episódio incorporadas';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Permitir legendas incorporadas';

  @override
  String get adminLibEmbeddedAllowAll => 'Permitir todas';

  @override
  String get adminLibEmbeddedAllowText => 'Apenas texto';

  @override
  String get adminLibEmbeddedAllowImage => 'Apenas imagem';

  @override
  String get adminLibEmbeddedAllowNone => 'Nenhum';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Ignorar download se houver legendas incorporadas';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ignorar download se a faixa de áudio corresponder ao idioma do download';

  @override
  String get adminLibRequirePerfectMatch =>
      'Exigir correspondência exata de legendas';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Salvar legendas nas pastas de mídia';

  @override
  String get adminLibChapterImageExtraction => 'Extrair imagens de capítulo';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extrair imagens de capítulo durante a análise da biblioteca';

  @override
  String get adminLibTrickplayExtraction =>
      'Ativar extração de imagens trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extrair imagens trickplay durante a análise da biblioteca';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Salvar imagens trickplay nas pastas de mídia';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Mesclar automaticamente séries distribuídas por várias pastas';

  @override
  String get adminLibSeasonZeroName => 'Nome de exibição da temporada zero';

  @override
  String get adminLibLufsScan =>
      'Ativar análise LUFS para normalização de áudio';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferir a etiqueta de artistas não padrão';

  @override
  String get adminLibAutoAddToCollection =>
      'Adicionar filmes automaticamente às coleções';

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
  String get adminParentalControl => 'Controle Parental';

  @override
  String get adminMaxParentalRating => 'Classificação etária máxima permitida';

  @override
  String get adminMaxParentalRatingHint =>
      'O conteúdo com classificação superior será ocultado deste usuário.';

  @override
  String get adminParentalRatingNone => 'Nenhuma';

  @override
  String get adminBlockUnratedItems =>
      'Bloquear itens sem classificação ou com classificação não reconhecida';

  @override
  String get adminUnratedBook => 'Livros';

  @override
  String get adminUnratedChannelContent => 'Canais';

  @override
  String get adminUnratedLiveTvChannel => 'TV ao Vivo';

  @override
  String get adminUnratedMovie => 'Filmes';

  @override
  String get adminUnratedMusic => 'Música';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Séries';

  @override
  String get adminAccessSchedules => 'Horários de Acesso';

  @override
  String get adminAccessSchedulesHint =>
      'Permitir o acesso apenas durante os horários agendados abaixo. O acesso é permitido o dia todo quando nenhum horário é definido.';

  @override
  String get adminAddSchedule => 'Adicionar Horário';

  @override
  String get adminScheduleDay => 'Dia';

  @override
  String get adminScheduleStart => 'Início';

  @override
  String get adminScheduleEnd => 'Fim';

  @override
  String get adminDayEveryday => 'Todos os dias';

  @override
  String get adminDayWeekday => 'Dia de semana';

  @override
  String get adminDayWeekend => 'Fim de semana';

  @override
  String get adminDaySunday => 'Domingo';

  @override
  String get adminDayMonday => 'Segunda-feira';

  @override
  String get adminDayTuesday => 'Terça-feira';

  @override
  String get adminDayWednesday => 'Quarta-feira';

  @override
  String get adminDayThursday => 'Quinta-feira';

  @override
  String get adminDayFriday => 'Sexta-feira';

  @override
  String get adminDaySaturday => 'Sábado';

  @override
  String get adminAllowedTags => 'Etiquetas permitidas';

  @override
  String get adminAllowedTagsHint =>
      'Apenas o conteúdo com estas etiquetas é exibido. Deixe vazio para permitir tudo.';

  @override
  String get adminBlockedTags => 'Etiquetas bloqueadas';

  @override
  String get adminBlockedTagsHint =>
      'O conteúdo com estas etiquetas fica oculto para este usuário.';

  @override
  String get adminAddTag => 'Adicionar etiqueta';

  @override
  String get adminEnabledDevices => 'Dispositivos ativados';

  @override
  String get adminEnabledChannels => 'Canais ativados';

  @override
  String get adminAuthProvider => 'Provedor de autenticação';

  @override
  String get adminPasswordResetProvider => 'Provedor de redefinição de senha';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Máximo de tentativas de login malsucedidas antes do bloqueio';

  @override
  String get adminLoginAttemptsHint =>
      'Defina como 0 para o padrão ou -1 para desativar o bloqueio.';

  @override
  String get adminSyncPlayAccess => 'Acesso ao SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin => 'Permitir criar e entrar em grupos';

  @override
  String get adminSyncPlayJoin => 'Permitir entrar em grupos';

  @override
  String get adminSyncPlayNone => 'Sem acesso';

  @override
  String get adminContentDeletionFolders => 'Permitir exclusão de conteúdo de';

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
  String get adminBackupOptionsTitle => 'Criar Backup';

  @override
  String get adminBackupInclude => 'Escolha o que incluir no backup.';

  @override
  String get adminBackupDatabase => 'Banco de Dados';

  @override
  String get adminBackupDatabaseAlways => 'Sempre incluído';

  @override
  String get adminBackupMetadata => 'Metadados';

  @override
  String get adminBackupSubtitles => 'Legendas';

  @override
  String get adminBackupTrickplay => 'Imagens trickplay';

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
  String get adminEditTuner => 'Editar Sintonizador';

  @override
  String get adminTunerTypeM3u => 'Sintonizador M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Arquivo ou URL';

  @override
  String get adminTunerIpAddress => 'Endereço IP do sintonizador';

  @override
  String get adminTunerFriendlyName => 'Nome amigável';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limite de conexões simultâneas';

  @override
  String get adminTunerCountHelp =>
      'O número máximo de streams que o sintonizador permite ao mesmo tempo. Defina como 0 para ilimitado.';

  @override
  String get adminTunerFallbackBitrate =>
      'Taxa de bits máxima de streaming alternativa';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Importar apenas canais favoritos';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Permitir transcodificação por hardware';

  @override
  String get adminTunerAllowFmp4 =>
      'Permitir contêiner de transcodificação fMP4';

  @override
  String get adminTunerAllowStreamSharing =>
      'Permitir compartilhamento de stream';

  @override
  String get adminTunerEnableStreamLooping => 'Ativar repetição do stream';

  @override
  String get adminTunerIgnoreDts => 'Ignorar DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Ler a entrada na taxa de quadros nativa';

  @override
  String get adminEditProvider => 'Editar Provedor';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Arquivo ou URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefixo de filme';

  @override
  String get adminXmltvMovieCategories => 'Categorias de filmes';

  @override
  String get adminXmltvCategoriesHelp =>
      'Separe várias categorias com uma barra vertical.';

  @override
  String get adminXmltvKidsCategories => 'Categorias infantis';

  @override
  String get adminXmltvNewsCategories => 'Categorias de notícias';

  @override
  String get adminXmltvSportsCategories => 'Categorias de esportes';

  @override
  String get adminSdUsername => 'Nome de usuário';

  @override
  String get adminSdPassword => 'Senha';

  @override
  String get adminSdCountry => 'País';

  @override
  String get adminSdCountrySelect => 'Selecione um país';

  @override
  String get adminSdPostalCode => 'Código postal';

  @override
  String get adminSdGetListings => 'Obter listagens';

  @override
  String get adminSdListings => 'Listagens';

  @override
  String get adminEnableAllTuners => 'Ativar todos os sintonizadores';

  @override
  String get adminTunerType => 'Tipo de Sintonizador';

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
  String get adminTunerResetNotSupported =>
      'Este tipo de sintonizador não suporta reinicialização.';

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
  String get adminMovieRecordingPath => 'Caminho de gravação de filmes';

  @override
  String get adminGuideDays => 'Dias de dados do guia';

  @override
  String get adminGuideDaysAuto => 'Automático';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dias';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Caminho do aplicativo de pós-processamento';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumentos do pós-processador';

  @override
  String get adminSaveRecordingNfo => 'Salvar metadados NFO das gravações';

  @override
  String get adminSaveRecordingImages => 'Salvar imagens das gravações';

  @override
  String get adminLiveTvSectionTiming => 'Temporização';

  @override
  String get adminLiveTvSectionPaths => 'Caminhos de gravação';

  @override
  String get adminLiveTvSectionPostProcessing => 'Pós-processamento';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Dados do guia: $value';
  }

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
  String get adminRefreshGuideData => 'Atualizar Dados do Guia';

  @override
  String get adminGuideRefreshStarted =>
      'Atualização dos dados do guia iniciada';

  @override
  String get adminGuideRefreshUnavailable =>
      'A tarefa de atualização do guia não está disponível neste servidor.';

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
  String get adminMetadataIdentify => 'Identificar';

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
  String get adminBrandingSplashUpload => 'Enviar imagem';

  @override
  String get adminBrandingSplashUploaded => 'Tela de abertura atualizada';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Falha ao enviar a tela de abertura';

  @override
  String get adminBrandingSplashDeleted => 'Tela de abertura removida';

  @override
  String get adminBrandingNoSplash => 'Nenhuma tela de abertura personalizada';

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
  String get adminPlaybackQsvDevice => 'Dispositivo QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Ativar decodificador NVDEC aprimorado';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferir o decodificador de hardware nativo do sistema';

  @override
  String get adminPlaybackColorDepth =>
      'Profundidade de cor da decodificação por hardware';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Decodificação HEVC de 10 bits';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Decodificação VP9 de 10 bits';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Decodificação HEVC RExt de 8/10 bits';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Decodificação HEVC RExt de 12 bits';

  @override
  String get adminPlaybackHwEncodingSection => 'Codificação por hardware';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Permitir codificação HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Permitir codificação AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Ativar codificador H.264 de baixo consumo da Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Ativar codificador HEVC de baixo consumo da Intel';

  @override
  String get adminPlaybackToneMapping => 'Mapeamento de Tons';

  @override
  String get adminPlaybackEnableTonemapping => 'Ativar mapeamento de tons';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Ativar mapeamento de tons VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Ativar mapeamento de tons do VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Algoritmo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingMode => 'Modo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingRange => 'Intervalo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Dessaturação do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingPeak => 'Pico do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingParam => 'Parâmetro do mapeamento de tons';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Brilho do mapeamento de tons VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Contraste do mapeamento de tons VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Predefinições e Qualidade';

  @override
  String get adminPlaybackEncoderPreset => 'Predefinição do codificador';

  @override
  String get adminPlaybackH264Crf => 'CRF de codificação H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF de codificação H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Método de desentrelaçamento';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dobrar a taxa de quadros ao desentrelaçar';

  @override
  String get adminPlaybackAudioSection => 'Áudio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Ativar codificação de áudio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Reforço do downmix de áudio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritmo de downmix estéreo';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Tamanho máximo da fila de muxing';

  @override
  String get adminPlaybackAutoOption => 'Automático';

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
  String get adminRunningTasks => 'Tarefas em Execução';

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
      other: '$count horas',
      one: '1 hora',
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
    return '$day/$month';
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
  String get adminNetworkingPublicHttpPort => 'Porta HTTP pública';

  @override
  String get adminNetworkingRequireHttps => 'Exigir HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirecionar todas as solicitações remotas para HTTPS. Não tem efeito se o servidor não tiver um certificado válido.';

  @override
  String get adminNetworkingCertPassword => 'Senha do certificado';

  @override
  String get adminNetworkingIpSettings => 'Configurações de IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Ativar IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Ativar IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Ativar mapeamento automático de portas';

  @override
  String get adminNetworkingLocalSubnets => 'Redes LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Lista de endereços IP ou sub-redes CIDR, separados por vírgula ou por linha, tratados como pertencentes à rede local.';

  @override
  String get adminNetworkingPublishedUris => 'URIs publicados do servidor';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Mapeie uma sub-rede ou endereço para uma URL publicada, por exemplo, all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'Atraso de limitação (segundos)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Permitir extração de legendas em tempo real';

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
  String get adminGeneralEnableSlowResponse =>
      'Ativar avisos de resposta lenta';

  @override
  String get adminGeneralQuickConnect => 'Ativar o Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Servidor';

  @override
  String get adminGeneralSectionMetadata => 'Metadados';

  @override
  String get adminGeneralSectionPaths => 'Caminhos';

  @override
  String get adminGeneralSectionPerformance => 'Desempenho';

  @override
  String get adminGeneralCachePath => 'Caminho do cache';

  @override
  String get adminGeneralMetadataPath => 'Caminho dos metadados';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminGeneralDisplayLanguage => 'Idioma de exibição preferido';

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
      other: '# participantes',
      one: '# participante',
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# linhas descobertas',
      one: '# linha descoberta',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Você está offline';

  @override
  String get offlineBannerSubtitle => 'Mostrando seus downloads';

  @override
  String get offlineBannerAction => 'Downloads';

  @override
  String get serverUnreachableBannerTitle =>
      'Não foi possível conectar ao seu servidor';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Reproduzindo dos downloads até que ele volte';

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
    return 'Falha no Quick Connect: $message';
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
  String get contextMenuHideFromContinueWatching =>
      'Ocultar de Continuar Assistindo';

  @override
  String get contextMenuHideFromNextUp => 'Ocultar de A Seguir';

  @override
  String get contextMenuAddToCollection => 'Adicionar à Coleção';

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
  String get settingsConnectionSection => 'CONEXÃO';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Permitir certificados autoassinados';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Confiar em servidores que usam certificados TLS autoassinados ou de CA privada. Ative apenas para servidores que você controla. Isto desativa a validação de certificados em todas as conexões.';

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
  String get settingsDetailsScreen => 'Tela de Detalhes';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Estilo, desfoque de fundo e comportamento das abas';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Mostrar o botão do Seerr na barra de navegação';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Sempre mostrar rótulos de texto na barra de navegação superior';

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
      other: '# avisos de licença',
      one: '# aviso de licença',
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
  String get settingsMediaSegmentCountdown =>
      'Contagem Regressiva de Segmentos de Mídia';

  @override
  String get settingsProgressBar => 'Barra de Progresso';

  @override
  String get settingsTimer => 'Cronômetro';

  @override
  String get settingsNone => 'Nenhum';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Lançamentos recentes: $libraryName';
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
  String get enableTunnelingTitle => 'Ativar tunelamento';

  @override
  String get enableTunnelingSubtitle =>
      'Avançado. Encaminha áudio e vídeo por um caminho de hardware acoplado. Desativado por padrão porque causa falhas de áudio/vídeo em alguns dispositivos.';

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
  String get showMediaDetailsOnLibraryPage => 'Mostrar Detalhes da Mídia';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Mostrar os detalhes do item selecionado no topo das páginas da Biblioteca.';

  @override
  String get hideBackdropsInLibraries => 'Ocultar Panos de Fundo ao Navegar?';

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
  String get themeStore => 'Loja de Temas';

  @override
  String get themeStoreSubtitle => 'Explore e salve temas da comunidade';

  @override
  String get themeStoreDescription =>
      'Salve um tema para usá-lo como os seus outros temas salvos.';

  @override
  String get themeStoreEmpty => 'Nenhum tema disponível no momento.';

  @override
  String get themeStoreLoadFailed =>
      'Não foi possível carregar a Loja de Temas. Verifique sua conexão e tente novamente.';

  @override
  String get themeStoreSave => 'Salvar';

  @override
  String get themeStoreSaveAndApply => 'Salvar e aplicar';

  @override
  String get themeStoreSaved => 'Salvo';

  @override
  String get themeStoreInvalidMessage => 'Não foi possível carregar este tema.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" salvo.';
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
  String get homeRowDisplay => 'Exibição das Linhas do Início';

  @override
  String get homeRowSections => 'Seções das Linhas do Início';

  @override
  String get homeRowToggles => 'Alternadores das Linhas do Início';

  @override
  String get homeRowTogglesSubtitle =>
      'Ativar ou desativar categorias de linhas do início baseadas em bibliotecas';

  @override
  String get homeRowTogglesDescription =>
      'Ative os alternadores a seguir para exibir as linhas nas Seções Iniciais.';

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
  String get displayPlaylistsRows => 'Exibir Linhas de Listas de Reprodução';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Mostrar linhas de listas de reprodução nas Seções Iniciais.';

  @override
  String get playlistsRowSorting =>
      'Ordenação das Linhas de Listas de Reprodução';

  @override
  String get playlistsRowSortingDescription =>
      'Ordene as linhas de listas de reprodução por data de adição, data de lançamento, ordem alfabética e mais.';

  @override
  String get displayAudioRows => 'Exibir Linhas de Áudio';

  @override
  String get displayAudioRowsSubtitle =>
      'Mostrar linhas de áudio nas Seções Iniciais.';

  @override
  String get audioRowsSorting => 'Ordenação das linhas de áudio';

  @override
  String get audioRowsSortingDescription =>
      'Ordene as linhas de áudio por data de adição, data de lançamento, ordem alfabética e mais.';

  @override
  String get audioPlaylists => 'Listas de Reprodução de Áudio';

  @override
  String get appearance => 'Aparência';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Teclado';

  @override
  String get navButtons => 'Botões';

  @override
  String get rendering => 'Renderização';

  @override
  String get mpvConfiguration => 'Configuração do MPV';

  @override
  String get cardSize => 'Tamanho do cartão';

  @override
  String get externalPlayerApp => 'Aplicativo de player externo';

  @override
  String get externalPlayerAppDescription =>
      'Defina um reprodutor externo para ativar a opção de reprodução ao pressionar e segurar';

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
  String get crewContributionsSeerr => 'Contribuições da Equipe (Seerr)';

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
      other: '$count Bibliotecas',
      one: '1 Biblioteca',
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
  String get intelQuickSync => 'Intel Quick Sync';

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
  String get libraryShuffleLabel => 'ALEATÓRIO DA BIBLIOTECA';

  @override
  String get randomShuffleLabel => 'TOTALMENTE ALEATÓRIO';

  @override
  String get genresShuffleLabel => 'ALEATÓRIO POR GÊNEROS';

  @override
  String get autoHdrSwitching => 'Troca automática de HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Ative automaticamente o HDR para reprodução de vídeo HDR e restaure o modo de exibição ao sair.';

  @override
  String get whenFullscreen => 'Quando em tela cheia';

  @override
  String get changeArtwork => 'Alterar Imagens';

  @override
  String get missing => 'Ausente';

  @override
  String get transcodingLimits => 'Limites de transcodificação';

  @override
  String get clearAllArtworkButton => 'Limpar todas as imagens?';

  @override
  String get clearAllArtworkWarning =>
      'Tem certeza de que deseja limpar todas as imagens baixadas?';

  @override
  String get confirmClear => 'Confirmar Limpeza';

  @override
  String confirmClearMessage(String itemType) {
    return 'Tem certeza de que deseja limpar $itemType?';
  }

  @override
  String get uploadButton => 'Enviar?';

  @override
  String get resolutionLabel => 'Resolução: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Mostrar apenas imagens no idioma da interface';

  @override
  String get confirmClearAll => 'Confirmar Limpar Tudo';

  @override
  String get imageUploadSuccess => 'Imagem enviada com sucesso!';

  @override
  String imageUploadFailed(String error) {
    return 'Falha ao enviar a imagem: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Falha ao definir a imagem: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Falha ao excluir a imagem: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Falha ao limpar todas as imagens: $error';
  }

  @override
  String get yes => 'Sim';

  @override
  String get posterCategory => 'Pôster';

  @override
  String get backdropsCategory => 'Panos de Fundo';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logotipo';

  @override
  String get thumbnailCategory => 'Miniatura';

  @override
  String get artCategory => 'Arte';

  @override
  String get discArtCategory => 'Arte do Disco';

  @override
  String get screenshotCategory => 'Captura de Tela';

  @override
  String get boxCoverCategory => 'Capa da Caixa';

  @override
  String get boxRearCoverCategory => 'Capa Traseira da Caixa';

  @override
  String get menuArtCategory => 'Arte do Menu';

  @override
  String get confirmItemPoster => 'o pôster';

  @override
  String get confirmItemBackdrop => 'o pano de fundo';

  @override
  String get confirmItemBanner => 'o banner';

  @override
  String get confirmItemLogo => 'o logotipo';

  @override
  String get confirmItemThumbnail => 'a miniatura';

  @override
  String get confirmItemArt => 'a arte';

  @override
  String get confirmItemDiscArt => 'a arte do disco';

  @override
  String get confirmItemScreenshot => 'a captura de tela';

  @override
  String get confirmItemBoxCover => 'a capa da caixa';

  @override
  String get confirmItemBoxRearCover => 'a capa traseira da caixa';

  @override
  String get confirmItemMenuArt => 'a arte do menu';

  @override
  String get resolutionAll => 'Todas';

  @override
  String get resolutionHigh => 'Alta (1080p+)';

  @override
  String get resolutionMedium => 'Média (720p)';

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
  String get audiobookQueue => 'Fila';

  @override
  String get audiobookTimeline => 'Linha do Tempo';

  @override
  String get audiobookTimelineEmpty => 'A linha do tempo está vazia';

  @override
  String get audiobookWholeBook => 'Livro Inteiro';

  @override
  String get audiobookFocusedTimeline => 'Linha do Tempo Focada';

  @override
  String get audiobookExportBookmarks => 'Exportar Marcadores';

  @override
  String get audiobookExportNotes => 'Exportar Notas';

  @override
  String get audiobookExportAll => 'Exportar Tudo';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exportado para $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Falha na exportação: $error';
  }

  @override
  String get audiobookLyrics => 'Letras';

  @override
  String get audiobookAddBookmark => 'Adicionar marcador';

  @override
  String get audiobookAddNote => 'Adicionar nota';

  @override
  String get audiobookEditNote => 'Editar nota';

  @override
  String get audiobookNoteHint => 'Escreva uma nota para este momento';

  @override
  String get audiobookSleepTimer => 'Temporizador de sono';

  @override
  String get audiobookSleepOff => 'Desligado';

  @override
  String get audiobookSleepEndOfChapter => 'Fim do capítulo';

  @override
  String get audiobookSleepCustom => 'Personalizado';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining restantes';
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
  String get audiobookPlaybackSpeed => 'Velocidade de reprodução';

  @override
  String get audiobookRemainingTime => 'Restante';

  @override
  String get audiobookElapsedTime => 'Decorrido';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Voltar ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Avançar ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Capítulo anterior';

  @override
  String get audiobookNextChapter => 'Próximo capítulo';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Capítulo $current de $total';
  }

  @override
  String get audiobookNoChapters => 'Nenhum capítulo';

  @override
  String get audiobookNoBookmarks => 'Nenhum marcador ainda';

  @override
  String get audiobookNoNotes => 'Nenhuma nota ainda';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Marcador adicionado em $position';
  }

  @override
  String get audiobookSpeedReset => 'Redefinir para 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Salvar';

  @override
  String get audiobookCancel => 'Cancelar';

  @override
  String get audiobookDelete => 'Excluir';

  @override
  String get subtitlePreferences => 'Preferências de Legendas';

  @override
  String get subtitlePreferencesDescription =>
      'Altere os modos de legendas, os idiomas padrão, a aparência e as opções de renderização.';

  @override
  String get subtitleRendering => 'Renderização de Legendas';

  @override
  String get displayOptions => 'Opções de Exibição';

  @override
  String get releaseDateAscending => 'Data de Lançamento (Crescente)';

  @override
  String get releaseDateDescending => 'Data de Lançamento (Decrescente)';

  @override
  String get groupContributions => 'Agrupar Contribuições';

  @override
  String get groupMultipleRoles => 'Agrupar múltiplos papéis';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Aviso de Acesso de Escrita à Biblioteca';

  @override
  String get libraryWriteAccessHowToFix => 'Como corrigir:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Conceda permissões de escrita ao usuário do serviço Jellyfin (por exemplo, jellyfin ou PUID/PGID do Docker) para as pastas da sua biblioteca de mídia no servidor.\n\n2. Ou vá ao Painel do Jellyfin -> Bibliotecas, edite esta biblioteca e desative \'Salvar imagens nas pastas de mídia\' para armazenar as imagens no banco de dados interno do Jellyfin.';

  @override
  String get dismiss => 'Dispensar';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'A sua biblioteca \'$libraryName\' está configurada para salvar as imagens diretamente nas pastas de mídia (a opção \'Salvar imagens nas pastas de mídia\' está ativada). No entanto, o Jellyfin testou o acesso de escrita e não tem permissão para gravar arquivos neste diretório:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Parece que o Jellyfin não conseguiu atualizar as imagens. A sua biblioteca está configurada para salvar as imagens diretamente nas pastas de mídia (a opção \'Salvar imagens nas pastas de mídia\' está ativada). Este erro geralmente ocorre quando o processo do servidor Jellyfin não tem permissão para gravar arquivos nos seus diretórios de mídia.';

  @override
  String get externalLists => 'Listas Externas';

  @override
  String get replay => 'Reproduzir Novamente';

  @override
  String get fileInformation => 'Informações do Arquivo';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Tamanho: $size  •  Formato: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Mostrar Todas as ($count) Faixas de Áudio';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Mostrar Todas as ($count) Faixas de Legendas';
  }

  @override
  String get checkingDirectPlay =>
      'Verificando a capacidade de Reprodução Direta...';

  @override
  String get directPlayCapabilityLabel => 'Capacidade de Reprodução Direta: ';

  @override
  String get forced => 'Forçada';

  @override
  String get transcodeContainerNotSupported =>
      'O formato do contêiner não é suportado pelo reprodutor.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'O codec de vídeo não é suportado.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'O codec de áudio não é suportado.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'O formato de legendas não é suportado (requer incorporação).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'O perfil de áudio não é suportado.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'O perfil de vídeo não é suportado.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'O nível de vídeo não é suportado.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'A resolução do vídeo não é suportada por este dispositivo.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'A profundidade de bits do vídeo não é suportada.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'A taxa de quadros do vídeo não é suportada.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'A taxa de bits do arquivo excede o limite de streaming do reprodutor.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'A taxa de bits do vídeo excede o limite de streaming.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'A taxa de bits do áudio excede o limite de streaming.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'O número de canais de áudio não é suportado.';

  @override
  String get sortAlphabetical => 'Alfabética';

  @override
  String get sortReleaseAscending => 'Ordem de Lançamento (Crescente)';

  @override
  String get sortReleaseDescending => 'Ordem de Lançamento (Decrescente)';

  @override
  String get sortCustomDragDrop => 'Personalizada (Arrastar e Soltar)';

  @override
  String get playlistSortOptions =>
      'Opções de Ordenação da Lista de Reprodução';

  @override
  String get resetSort => 'Redefinir Ordenação';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rever T$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rever Lista de Reprodução';

  @override
  String get noSubtitlesFound => 'Nenhuma legenda encontrada.';

  @override
  String get adminControls => 'Controles de Administrador';

  @override
  String get impellerRendering => 'Mecanismo de renderização (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'O Impeller é o renderizador de GPU moderno do Flutter, para animações mais suaves e menos travamentos. Em alguns TV boxes e GPUs antigas, pode causar falhas gráficas ou vídeo preto; desative-o se notar isso. Automático escolhe o melhor padrão para o seu dispositivo. Reinicie o Moonfin para aplicar.';

  @override
  String get impellerAuto => 'Automático';

  @override
  String get impellerOn => 'Ligado';

  @override
  String get impellerOff => 'Desligado';

  @override
  String get impellerRestartTitle => 'Reinicialização necessária';

  @override
  String get impellerRestartMessage =>
      'O Moonfin precisa reiniciar para alterar o mecanismo de renderização. Feche o aplicativo agora e reabra-o para aplicar.';

  @override
  String get impellerCloseNow => 'Fechar o aplicativo agora';

  @override
  String get adminRefreshLibrary => 'Atualizar Biblioteca';

  @override
  String get adminRefreshAllLibraries => 'Atualizar Todas as Bibliotecas';

  @override
  String get adminRepoSortDateOldest =>
      'Data de Adição (Mais Antigas Primeiro)';

  @override
  String get adminRepoSortDateNewest =>
      'Data de Adição (Mais Recentes Primeiro)';

  @override
  String get adminRepoSortNameAsc => 'Alfabética (A a Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabética (Z a A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Carregando as Análises do Servidor... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Igual à origem';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Filmes';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 Séries';

  @override
  String get imdbMostPopularMovies => 'Filmes Mais Populares do IMDb';

  @override
  String get imdbMostPopularTvShows => 'Séries Mais Populares do IMDb';

  @override
  String get imdbLowestRatedMovies => 'Filmes com Pior Avaliação do IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'Filmes em Inglês Mais Bem Avaliados do IMDb';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'PREFERÊNCIAS DA CONTA';

  @override
  String get interfaceLanguage => 'Idioma da interface';

  @override
  String get systemLanguageDefault => 'Padrão do sistema';

  @override
  String get signIn => 'Entrar';

  @override
  String get empty => 'Vazio';

  @override
  String connectingToServer(String serverName) {
    return 'Conectando a $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get embyConnect => 'Conectar Emby';

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
  String get detailScreenStyle => 'Estilo da tela de detalhes';

  @override
  String get detailScreenStyleSubtitle =>
      'Clássico é o layout centralizado original do Moonfin. Moderno é um layout cinematográfico responsivo.';

  @override
  String get detailScreenStyleMoonfin => 'Clássico';

  @override
  String get detailScreenStyleModern => 'Moderno';

  @override
  String get expandedTabs => 'Abas expandidas';

  @override
  String get expandedTabsSubtitle =>
      'Mostrar o conteúdo da aba automaticamente ao navegar entre as abas. Desative para abrir e fechar cada aba manualmente.';

  @override
  String get showTechnicalDetails => 'Mostrar detalhes técnicos?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Mostrar codec, resolução e informações do stream no resumo do banner';

  @override
  String get recommendationSystem => 'Sistema de recomendações';

  @override
  String get recommendationSystemSubtitle =>
      'Use o algoritmo de biblioteca local do Moonfin Recommends ou as métricas de similaridade online do TMDb. Observação: recomendações online exigem a integração com o Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recommends';

  @override
  String get recommendationSystemTmdb => 'Similaridade do TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Aplicar limite de classificação indicativa?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limitar as sugestões do Moonfin Recommends pela classificação indicativa da mídia de destino';

  @override
  String get interfaceStyle => 'Estilo da interface';

  @override
  String get interfaceStyleSubtitle =>
      'Automático acompanha o seu dispositivo. Escolha Apple ou Material para forçar um visual.';

  @override
  String get interfaceStyleAutomatic => 'Automático';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Qualidade do vidro';

  @override
  String get glassQualitySubtitle =>
      'Automático escolhe o melhor efeito de vidro para este dispositivo. Completo força desfoque real; Reduzido usa um vidro leve que economiza GPU.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Completo';

  @override
  String get glassQualityReduced => 'Reduzido';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alterne entre Moonfin e Neon Pulse sem reiniciar o aplicativo';

  @override
  String get customThemeTitle => 'Tema personalizado';

  @override
  String get customThemeSubtitle =>
      'Temas personalizados alteram elementos visuais em todo o Moonfin. Escolha uma destas opções para combinar com o seu estilo.';

  @override
  String get keyboardPreferSystemIme => 'Preferir o teclado do sistema';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Usar o método de entrada do seu dispositivo por padrão para digitar';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Look atual do Moonfin que todos vocês adoraram';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Estilo Synthwave com brilho magenta, texto ciano e contraste cromado mais forte';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Estilo liquid glass com fundo em gradiente flutuante, superfícies foscas e destaque em azul Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Estilo retrô em pixel art com paleta marcante, bordas quadradas, sombras duras e fonte pixelada';

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
    return 'Não foi possível se conectar a $target';
  }

  @override
  String get exitApp => 'Sair do Moonfin?';

  @override
  String get exitAppConfirmation => 'Tem certeza de que deseja sair?';

  @override
  String get exit => 'Sair';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Pausado';

  @override
  String get gameSaveState => 'Salvar estado';

  @override
  String get games => 'Jogos';

  @override
  String get gameLoadState => 'Carregar estado';

  @override
  String get gameFastForward => 'Avanço rápido';

  @override
  String get gameEmulatorSettings => 'Configurações do emulador';

  @override
  String get gameNoCoreOptions => 'Este core não tem opções ajustáveis.';

  @override
  String get gameHoldToOpenMenu => 'Segure para abrir o menu';

  @override
  String get gamePlaybackUnsupported =>
      'Este dispositivo ainda não tem suporte a jogos.';

  @override
  String get noHomeRowsLoaded => 'Nenhuma seção pôde ser carregada';

  @override
  String get noHomeRowsHint => 'Tente atualizar ou reduzir as seções ativas.';

  @override
  String get retryHomeRows => 'Tentar carregar novamente as seções';

  @override
  String get guide => 'Guia';

  @override
  String get recordings => 'Gravações';

  @override
  String get schedule => 'Agendar';

  @override
  String get series => 'Séries';

  @override
  String get noItemsFound => 'Nenhum item encontrado';

  @override
  String get home => 'Início';

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
  String get resume => 'Continuar';

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
    return '$percent% completo';
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
    return '$count títulos organizados para priorizar a leitura.';
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
  String get playedStatus => 'Status reproduzido';

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
  String get latestBooks => 'Livros recentes';

  @override
  String get latestAudiobooks => 'Audiolivros recentes';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Livro';

  @override
  String get bookFormatAudiobook => 'Audiolivro';

  @override
  String bookPercentRead(int percent) {
    return '$percent% lido';
  }

  @override
  String bookTimeLeft(String time) {
    return 'Faltam $time';
  }

  @override
  String get bookHeroRead => 'Ler';

  @override
  String get bookHeroListen => 'Ouvir';

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
    return '$count seções';
  }

  @override
  String firstPublished(int year) {
    return 'Primeira publicação $year';
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
      other: '$count audiolivros',
      one: '1 audiolivro',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista de faixas';

  @override
  String get itemListPlaceholder => 'A lista de itens aparecerá aqui';

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
  String get musicVideos => 'Videoclipes';

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
    return 'Publicado em $year';
  }

  @override
  String get publicationDateUnknown => 'Data de publicação desconhecida';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Temporadas',
      one: '1 Temporada',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Termina em $time';
  }

  @override
  String get items => 'Itens';

  @override
  String get extras => 'Extras';

  @override
  String get behindTheScenes => 'Bastidores';

  @override
  String get deletedScenes => 'Cenas excluídas';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Entrevistas';

  @override
  String get scenes => 'Cenas';

  @override
  String get shorts => 'Curtas';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return 'Faltam $time';
  }

  @override
  String endsIn(String time) {
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
    return 'Continuar de $position';
  }

  @override
  String get play => 'Reproduzir';

  @override
  String get startOver => 'Recomeçar';

  @override
  String get restart => 'Reiniciar';

  @override
  String get readOffline => 'Ler off-line';

  @override
  String get playOffline => 'Reproduzir off-line';

  @override
  String get audio => 'Áudio';

  @override
  String get subtitles => 'Legendas';

  @override
  String get version => 'Versão';

  @override
  String get cast => 'Transmitir';

  @override
  String get trailer => 'Trailer';

  @override
  String get finished => 'Finalizado';

  @override
  String get favorited => 'Favoritado';

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
    return 'Excluir faixas de \"$title\"?';
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
    return 'Baixando $title ($count items)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Tem certeza que deseja deletar \"$name\" do servidor? Essa ação não pode ser desfeita.';
  }

  @override
  String get itemDeleted => 'Item excluído';

  @override
  String get noPlayableTrailerFound => 'Nenhum trailer encontrado.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Formato de livro não suportado: .$extension';
  }

  @override
  String get audioTrack => 'Faixa de áudio';

  @override
  String get subtitleTrack => 'Faixa de legenda';

  @override
  String get none => 'Nenhuma';

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
    return 'Nenhuma legenda encontrada para $language.';
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
    return 'Deletar arquivos locais para $typeLabel?\n\nIsso vai liberar espaço. Você pode baixar novamente depois.';
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
  String get directors => 'DIRETORES';

  @override
  String get writer => 'ESCRITOR';

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
      other: '$count faixas',
      one: '1 faixa',
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
  String get shuffle => 'Aleatório';

  @override
  String get shuffleAllMusic => 'Reproduzir tudo aleatoriamente';

  @override
  String get carSignInPrompt => 'Entre no Moonfin pelo seu celular';

  @override
  String get carServerUnreachable => 'Não foi possível acessar seu servidor';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Combinação perfeita';

  @override
  String channelsCount(int count) {
    return '$count canais';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Estéreo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'A $action remota de legendas exige a permissão de gerenciamento de legendas do Jellyfin para este usuário.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Este item não pôde ser encontrado no servidor para a $action remota de legendas.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Falha na $action remota de legendas: $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Falha na $action remota de legendas (HTTP $status).';
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
      'Não foi possível carregar o stream do trailer.';

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
    return 'Falha na ação $label: $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Erro ao alterar volume da transmissão: $error';
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
  String get pause => 'Pausar';

  @override
  String get syncPosition => 'Posição de sincronização';

  @override
  String stopCast(String label) {
    return 'Parar $label';
  }

  @override
  String get queueIsEmpty => 'A fila está vazia';

  @override
  String trackNumber(int number) {
    return 'Faixa $number';
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
  String get reset => 'Redefinir';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get playbackInformation => 'Informações de reprodução';

  @override
  String get playback => 'Reprodução';

  @override
  String get playMethod => 'Método de reprodução';

  @override
  String get directPlay => 'Reprodução direta';

  @override
  String get directStream => 'Transmissão direta';

  @override
  String get transcoding => 'Transcodificação';

  @override
  String get transcodeReasons => 'Razões de transcoding';

  @override
  String get player => 'Player';

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
  String get track => 'Faixa';

  @override
  String get channels => 'Canais';

  @override
  String get audioBitrate => 'Bitrate de Áudio';

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
    return 'Erro de sessão $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Falha ao carregar os detalhes do livro: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'A renderização de EPUB no aplicativo ainda não está disponível nesta plataforma.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Este formato (.$extension) ainda não pode ser exibido no aplicativo.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A renderização de documentos incorporados não está disponível nesta plataforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'Não foi possível abrir o visualizador externo.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Falha ao abrir o leitor do aplicativo: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Já existe um marcador salvo em $label.';
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
    return 'Falha ao atualizar o status de leitura: $error';
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
    return 'Esta plataforma não oferece suporte ao mecanismo de documentos integrado para arquivos $extension.';
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
  String guideNextProgram(String time, String title) {
    return 'A seguir: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return 'Faltam ${minutes}min';
  }

  @override
  String guideHoursLeft(int hours) {
    return 'Faltam ${hours}h';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return 'Faltam ${hours}h ${minutes}min';
  }

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
  String get record => 'Gravar';

  @override
  String get cancelRecordingAction => 'Cancelar gravação';

  @override
  String get programSetToRecord => 'Program configurado para gravar';

  @override
  String get recordingCancelled => 'Gravação cancelada';

  @override
  String get unableToCreateRecording => 'Não foi possível criar gravação';

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
    return 'Parar a gravação de \"$name\"?';
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
  String get seerr => 'Seerr';

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
    return 'T$season E$episode';
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
    return 'T$number';
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
      other: '$count episódios',
      one: '1 episódio',
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
    return 'do limite de $limit';
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
  String get themeMusicSettingsSubtitle =>
      'Páginas de detalhes, linhas iniciais e volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Música tema nas linhas iniciais';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Reproduzir enquanto navega na tela inicial';

  @override
  String get loopThemeMusic => 'Repetir música tema';

  @override
  String get loopThemeMusicSubtitle =>
      'Repetir a faixa em vez de reproduzi-la uma só vez';

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
  String get playerZoomMode => 'Modo de zoom do player';

  @override
  String get settingsScrollWheelAction => 'Roda do mouse';

  @override
  String get settingsScrollWheelActionDescription =>
      'Escolha o que a rolagem da roda do mouse sobre o vídeo faz durante a reprodução.';

  @override
  String get scrollWheelActionOff => 'Desligado';

  @override
  String get scrollWheelActionSeek => 'Buscar (avançar / retroceder)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Ajustar';

  @override
  String get autoCrop => 'Corte automático';

  @override
  String get stretch => 'Esticar';

  @override
  String get refreshRateSwitching => 'Mudança de taxa de atualização';

  @override
  String get disabled => 'Desativado';

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
  String get fallbackAudioLanguage => 'Idioma de áudio alternativo';

  @override
  String get preferDefaultAudioTrack => 'Preferir a faixa de áudio padrão';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferir a faixa de áudio original em vez da dublagem localizada.';

  @override
  String get preferAudioDescription => 'Preferir faixas de audiodescrição';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferir faixas de audiodescrição em vez das faixas normais.';

  @override
  String get transcodingAudio => 'Transcodificação (Áudio)';

  @override
  String get directStreamRemux => 'Transmissão direta (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcodificação (Taxa de bits ou resolução)';

  @override
  String get transcodingVideoAndAudio => 'Transcodificação (Vídeo e Áudio)';

  @override
  String get transcodingVideo => 'Transcodificação (Vídeo)';

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
  String get settingsAudioOutputModeDescription =>
      'Escolha como o áudio é decodificado. O AVR Passthrough envia os streams Dolby/DTS brutos para o seu receiver; Auto ou Downmix decodificam localmente.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'AVR Passthrough';

  @override
  String get settingsAudioFallbackCodec => 'Codec de áudio alternativo';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Selecione o formato de destino para transcodificar o áudio multicanal quando o stream de origem não puder ser reproduzido diretamente nem enviado por passthrough.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Detecção automática\n(Recomendado)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Padrão)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Sem perdas)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Somente estéreo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Eficiente)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Sem perdas)';

  @override
  String get settingsMaxAudioChannels => 'Máximo de canais de áudio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configure o número máximo de canais do seu sistema de áudio. Streams multicanal que excederem esse limite passarão por downmix ou transcodificação.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Detecção automática\n(Padrão do hardware)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Estéreo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadrafônico';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (Avançado)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough de codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ative apenas os formatos compatíveis com o seu AVR ou dispositivo HDMI.';

  @override
  String get settingsAudioEac3Passthrough => 'Passthrough EAC3';

  @override
  String get settingsAudioEac3JocPassthrough => 'Passthrough EAC3 JOC (Atmos)';

  @override
  String get settingsAudioDtsCorePassthrough => 'Passthrough DTS Core';

  @override
  String get settingsAudioDtsHdPassthrough => 'Passthrough DTS-HD MA';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passthrough TrueHD';

  @override
  String get settingsAudioTrueHdAtmosPassthrough => 'Passthrough TrueHD Atmos';

  @override
  String get settingsAudioBitstreamEac3ToExternalDecoder =>
      'Envia o bitstream Dolby Digital Plus (EAC3) para o decodificador externo.';

  @override
  String get settingsAudioBitstreamEac3JocToExternalDecoder =>
      'Envia o bitstream Dolby Atmos sobre EAC3 (JOC) para o decodificador externo.';

  @override
  String get settingsAudioBitstreamDtsHdToExternalDecoder =>
      'Envia o bitstream DTS-HD MA (inclui o DTS core) para o decodificador externo.';

  @override
  String get settingsAudioBitstreamTrueHdAtmosToExternalDecoder =>
      'Envia o bitstream Dolby TrueHD com metadados Atmos para o decodificador externo.';

  @override
  String get settingsDetectedAudioCapabilities =>
      'Recursos de áudio detectados';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Ainda não há um instantâneo dos recursos em tempo de execução.';

  @override
  String get settingsAudioRouteLabel => 'Rota';

  @override
  String get settingsAudioDecodeLabel => 'Decodificação';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

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
  String get settingsAudioRouteSpeaker => 'Alto-falante';

  @override
  String get settingsAudioRouteHeadphones => 'Fones de ouvido';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count canais PCM';
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
      'passthrough audio-spdif';

  @override
  String get settingsAudioDiagnosticsActiveAudioRoute => 'Rota de áudio ativa';

  @override
  String get settingsAudioDiagnosticsRouteHdAudioSupport =>
      'Suporte a áudio HD na rota';

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
    return 'Após $episodes episódios / ${hours}h';
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
  String get subtitleMode => 'Modo de legenda';

  @override
  String get subtitleModeFlagged => 'Sinalizadas';

  @override
  String get subtitleModeAlways => 'Sempre';

  @override
  String get subtitleModeForeign => 'Estrangeiras';

  @override
  String get subtitleModeForced => 'Forçadas';

  @override
  String get subtitleModeFlaggedDescription =>
      'Reproduz as faixas sinalizadas internamente como \"padrão\" ou \"forçada\" nos metadados do arquivo de mídia.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Carrega e exibe as legendas automaticamente sempre que um vídeo começa.';

  @override
  String get subtitleModeForeignDescription =>
      'Ativa as legendas automaticamente se a faixa de áudio padrão estiver em um idioma estrangeiro.';

  @override
  String get subtitleModeForcedDescription =>
      'Carrega apenas as legendas explicitamente marcadas com o sinalizador de metadados \"forçada\".';

  @override
  String get subtitleModeNoneDescription =>
      'Desativa completamente o carregamento automático de legendas.';

  @override
  String get fallbackSubtitleLanguage => 'Idioma de legenda alternativo';

  @override
  String get subtitleStream => 'Stream de legenda';

  @override
  String get subtitlePreviewText =>
      'A rápida raposa marrom salta sobre o cachorro preguiçoso';

  @override
  String get verticalOffset => 'Deslocamento vertical';

  @override
  String get pgsDirectPlay => 'Reprodução direta PGS';

  @override
  String get directPlayPgsSubtitles => 'Legendas PGS com reprodução direta';

  @override
  String get assSsaDirectPlay => 'Reprodução direta ASS/SSA';

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
    return 'Configurações do perfil $profile carregadas.';
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
  String get reportDownloadsActivity => 'Mostrar downloads no servidor';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permitir que o administrador do servidor veja seus downloads transcodificados no painel';

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
  String get navbarAlwaysExpanded =>
      'Sempre expandir os rótulos da barra de navegação';

  @override
  String get showSeerrButton => 'Mostrar botão do Seerr';

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
  String get posterLabel => 'Pôster';

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
  String get groupItemsIntoCollections => 'Agrupar itens em coleções';

  @override
  String get hideCollectionAssociatedItems =>
      'Ocultar os itens da biblioteca associados a coleções ao navegar pelas bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Aviso sobre agrupamento de bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Para usar esta configuração, verifique se as opções \"Agrupar filmes em coleções\" e/ou \"Agrupar séries em coleções\" estão ativadas nas configurações de exibição da sua biblioteca no servidor Jellyfin ou Emby.';

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
    return '$count selecionados';
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
      'Escolha entre vários estilos de barra de mídia ou desative a barra de mídia';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desativado';

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
  String get trailerAudio => 'Áudio do trailer';

  @override
  String get enableTrailerAudio =>
      'Ativar o áudio dos trailers na barra de mídia';

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
  String get fullScreenRows => 'Linhas iniciais expandidas';

  @override
  String get fullScreenRowsDescription => 'Limitar a 1 linha inicial por tela';

  @override
  String get perRowImageType => 'Tipo de imagem por linha';

  @override
  String get perRowSettings => 'Configurações por linha';

  @override
  String get autoLogin => 'Login automático';

  @override
  String get lastUser => 'Último usuário';

  @override
  String get currentUser => 'Usuário atual';

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
  String get clockModeStatic => 'Estático';

  @override
  String get clockModeBouncing => 'Flutuante';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (críticos)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (público)';

  @override
  String get imdb => 'IMDB';

  @override
  String get tmdb => 'TMDB';

  @override
  String get metacritic => 'Metacritic';

  @override
  String get metacriticUser => 'Metacritic (usuário)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Avaliações da comunidade';

  @override
  String get ratings => 'Avaliações';

  @override
  String get additionalRatings => 'Avaliações Adicionais';

  @override
  String get showMdbListAndTmdbRatings => 'Mostrar avaliações MDBList e TMDB';

  @override
  String get ratingLabels => 'Etiquetas de avaliação';

  @override
  String get showLabelsNextToIcons =>
      'Mostrar rótulos ao lado dos ícones de avaliação';

  @override
  String get ratingBadges => 'Selos de avaliação';

  @override
  String get showDecorativeBadges =>
      'Mostrar emblemas decorativos atrás das avaliações';

  @override
  String get episodeRatings => 'Avaliações de episódios';

  @override
  String get showRatingsOnEpisodes =>
      'Mostrar avaliações em episódios individuais';

  @override
  String get ratingSources => 'Fontes de avaliação';

  @override
  String get ratingSourcesDescription =>
      'Ative e reordene as fontes de avaliação mostradas em todo o aplicativo';

  @override
  String get pluginLabel => 'Plug-in Moonbase';

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
  String get seerrDiscoveryRows => 'Linhas de descoberta do Seerr';

  @override
  String get resetRowsToDefaults => 'Redefinir seções para os padrões';

  @override
  String get enableSeerr => 'Habilitar Seerr';

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
  String get seerrNotificationsSection => 'Notificações';

  @override
  String get seerrNotifyNewRequestsTitle =>
      'Notificações de novas solicitações';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Avisar quando alguém enviar uma solicitação';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Atualizações de solicitações';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Aprovadas, recusadas e adicionadas à sua biblioteca';

  @override
  String get seerrNotifyIssuesTitle => 'Atualizações de problemas';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Novos problemas, respostas e resoluções';

  @override
  String loggedInAs(String username) {
    return 'Logado como: $username';
  }

  @override
  String get discoverRows => 'Página de descoberta do Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Habilite as seções que você quer ver na página principal do Seerr. Arraste para reordenar. A ordem personalizada é sincronizada com o Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Habilite as seções que você quer ver na página principal do Seerr. Arraste para reordenar. A ordem personalizada é sincronizada com o Moonbase.';

  @override
  String get enabled => 'Ativado';

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
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'v$version disponível';
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
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limite do cache de imagens';

  @override
  String get clearImageCache => 'Limpar cache de imagens';

  @override
  String get imageCacheCleared => 'Cache de imagens limpo';

  @override
  String get clear => 'Limpar';

  @override
  String get browse => 'Navegar';

  @override
  String get noResults => 'Nenhum resultado';

  @override
  String get seerrAvailableStatus => 'Disponível';

  @override
  String get seerrRequestedStatus => 'Solicitado';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Baixando · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importando';

  @override
  String itemsCount(int count) {
    return '$count Itens';
  }

  @override
  String get seerrSettings => 'Configurações do Seerr';

  @override
  String get requestMore => 'Solicite mais';

  @override
  String get request => 'Solicitar';

  @override
  String get cancelRequest => 'Cancelar solicitação';

  @override
  String get playInMoonfin => 'Reproduzir no Moonfin';

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
    return 'Cancelar a solicitação de \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancelar $count solicitações de \"$title\"?';
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
  String get appearances => 'Participações';

  @override
  String get crewSection => 'Equipe';

  @override
  String ageValue(int age) {
    return '$age anos';
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
  String get failedStatus => 'Falhou';

  @override
  String get processingStatus => 'Processando';

  @override
  String modifiedByName(String name) {
    return 'Modificado por $name';
  }

  @override
  String get completedStatus => 'Concluído';

  @override
  String get requestErrorDuplicate => 'Este título já foi solicitado';

  @override
  String get requestErrorQuota => 'Limite de solicitações atingido';

  @override
  String get requestErrorBlocklisted => 'Este título está na lista de bloqueio';

  @override
  String get requestErrorNoSeasons => 'Não há mais temporadas para solicitar';

  @override
  String get requestErrorPermission =>
      'Você não tem permissão para fazer esta solicitação';

  @override
  String get seerrRequestsTitle => 'Solicitações';

  @override
  String get seerrIssuesTitle => 'Problemas';

  @override
  String get sortNewest => 'Mais recentes';

  @override
  String get sortLastModified => 'Última modificação';

  @override
  String get noIssues => 'Nenhum problema';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return 'Restam $remaining de $limit solicitações de filmes';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return 'Restam $remaining de $limit solicitações de temporadas';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Faz parte de $name';
  }

  @override
  String get viewCollection => 'Ver coleção';

  @override
  String get requestCollection => 'Solicitar coleção';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmes · $available disponíveis';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Solicitar $count filmes';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Solicitando $current de $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count filmes solicitados';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok de $total filmes solicitados';
  }

  @override
  String get collectionAllRequested =>
      'Todos os filmes já estão disponíveis ou solicitados';

  @override
  String get reportIssue => 'Relatar problema';

  @override
  String get issueTypeVideo => 'Vídeo';

  @override
  String get issueTypeAudio => 'Áudio';

  @override
  String get whatsWrong => 'O que está errado?';

  @override
  String get allEpisodes => 'Todos os episódios';

  @override
  String get episode => 'Episódio';

  @override
  String get openStatus => 'Aberto';

  @override
  String get resolvedStatus => 'Resolvido';

  @override
  String get resolveAction => 'Resolver';

  @override
  String get reopenAction => 'Reabrir';

  @override
  String reportedByName(String name) {
    return 'Relatado por $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String get addComment => 'Adicionar um comentário';

  @override
  String get deleteIssueConfirm => 'Excluir este problema?';

  @override
  String get submitReport => 'Enviar relato';

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
  String get processing => 'Processamento';

  @override
  String get profile => 'Perfil';

  @override
  String get provider => 'Provedor';

  @override
  String get refresh => 'Atualizar';

  @override
  String get remote => 'Controle remoto';

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
  String get search => 'Buscar';

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
  String get trickplay => 'Trickplay';

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
  String get mute => 'Silenciar';

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
  String get adminDrawerDisplay => 'Exibição';

  @override
  String get adminDrawerMetadata => 'Metadados';

  @override
  String get adminDrawerNfo => 'Configurações de NFO';

  @override
  String get adminDrawerTranscoding => 'Transcodificação';

  @override
  String get adminDrawerResume => 'Retomar';

  @override
  String get adminDrawerStreaming => 'Transmissão';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
    return 'Atualizações de plug-ins disponíveis: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plug-ins que exigem reinicialização: $count';
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
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Reproduzindo agora';

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
  String get adminActivitySeverityAll => 'Todas as severidades';

  @override
  String get adminActivityDateRange => 'Período';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Falha ao carregar o registro de atividades: $error';
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
    return 'Falha ao excluir o dispositivo: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Remover o dispositivo \'$name\'? O usuário precisará entrar novamente neste dispositivo.';
  }

  @override
  String get adminDeleteAllDevices => 'Excluir todos os dispositivos';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remover $count dispositivos? Os usuários afetados precisarão entrar novamente. Seu dispositivo atual não será afetado.';
  }

  @override
  String get adminDevicesDeletedAll => 'Dispositivos removidos';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Alguns dispositivos foram removidos; não foi possível remover $count.';
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
    return 'Falha ao excluir a biblioteca: $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Falha ao adicionar o caminho: $error';
  }

  @override
  String get adminRemovePath => 'Remover caminho';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remover \"$path\" desta biblioteca?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Falha ao remover o caminho: $error';
  }

  @override
  String get adminLibraryOptionsSaved => 'Opções de biblioteca salvas';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Falha ao salvar as opções: $error';
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
  String get adminLibraryTabPaths => 'Caminhos';

  @override
  String get adminLibraryTabOptions => 'Opções';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Gravadores de metadados';

  @override
  String get adminLibSubtitleDownloaders => 'Downloaders de legendas';

  @override
  String get adminLibLyricDownloaders => 'Downloaders de letras';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Downloaders de metadados: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Buscadores de imagens: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Este servidor não oferece downloaders para este tipo de biblioteca.';

  @override
  String get adminLibrarySectionGeneral => 'Geral';

  @override
  String get adminLibrarySectionMetadata => 'Metadados';

  @override
  String get adminLibrarySectionEmbedded => 'Informações incorporadas';

  @override
  String get adminLibrarySectionSubtitles => 'Legendas';

  @override
  String get adminLibrarySectionImages => 'Imagens';

  @override
  String get adminLibrarySectionSeries => 'Séries';

  @override
  String get adminLibrarySectionMusic => 'Música';

  @override
  String get adminLibrarySectionMovies => 'Filmes';

  @override
  String get adminLibRealtimeMonitor => 'Ativar monitoramento em tempo real';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detectar alterações nos arquivos e processá-las automaticamente.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Tratar arquivos compactados como arquivos de mídia';

  @override
  String get adminLibEnablePhotos => 'Exibir fotos';

  @override
  String get adminLibSaveLocalMetadata =>
      'Salvar as imagens nas pastas de mídia';

  @override
  String get adminLibRefreshInterval => 'Atualização automática de metadados';

  @override
  String get adminLibRefreshNever => 'Nunca';

  @override
  String get adminLibDefault => 'Padrão';

  @override
  String get adminLibDisplayTitle => 'Exibição';

  @override
  String get adminLibDisplaySection => 'Exibição da biblioteca';

  @override
  String get adminLibFolderView =>
      'Exibir uma visualização de pastas para mostrar as pastas de mídia simples';

  @override
  String get adminLibSpecialsInSeasons =>
      'Exibir os especiais nas temporadas em que foram exibidos';

  @override
  String get adminLibGroupMovies => 'Agrupar filmes em coleções';

  @override
  String get adminLibGroupShows => 'Agrupar séries em coleções';

  @override
  String get adminLibExternalSuggestions =>
      'Mostrar conteúdo externo nas sugestões';

  @override
  String get adminLibDateAddedSection => 'Comportamento da data de adição';

  @override
  String get adminLibDateAddedLabel => 'Usar a data de adição de';

  @override
  String get adminLibDateAddedImport => 'Data da verificação na biblioteca';

  @override
  String get adminLibDateAddedFile => 'Data de criação do arquivo';

  @override
  String get adminLibMetadataTitle => 'Metadados e imagens';

  @override
  String get adminLibMetadataLangSection => 'Idioma preferido dos metadados';

  @override
  String get adminLibChaptersSection => 'Capítulos';

  @override
  String get adminLibDummyChapterDuration =>
      'Duração dos capítulos fictícios (segundos)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Duração dos capítulos gerados para mídias que não os possuem. Defina 0 para desativar.';

  @override
  String get adminLibChapterImageResolution =>
      'Resolução das imagens de capítulo';

  @override
  String get adminLibNfoTitle => 'Configurações de NFO';

  @override
  String get adminLibNfoHelp =>
      'Os metadados NFO são compatíveis com o Kodi e clientes semelhantes. As configurações se aplicam a todas as bibliotecas que salvam metadados NFO.';

  @override
  String get adminLibKodiUser =>
      'Usuário cujos dados de exibição serão armazenados nos arquivos NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Salvar os caminhos das imagens nos arquivos NFO';

  @override
  String get adminLibPathSubstitution =>
      'Ativar a substituição de caminhos para os caminhos de imagem NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copiar as imagens extrafanart para uma pasta extrathumbs';

  @override
  String get adminLibNone => 'Nenhum';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dias';
  }

  @override
  String get adminLibEmbeddedTitles => 'Usar os títulos incorporados';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Usar os títulos incorporados para os extras';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Usar as informações de episódio incorporadas';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Permitir legendas incorporadas';

  @override
  String get adminLibEmbeddedAllowAll => 'Permitir todas';

  @override
  String get adminLibEmbeddedAllowText => 'Somente texto';

  @override
  String get adminLibEmbeddedAllowImage => 'Somente imagem';

  @override
  String get adminLibEmbeddedAllowNone => 'Nenhum';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Ignorar o download se houver legendas incorporadas';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ignorar o download se a faixa de áudio corresponder ao idioma do download';

  @override
  String get adminLibRequirePerfectMatch =>
      'Exigir correspondência exata da legenda';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Salvar as legendas nas pastas de mídia';

  @override
  String get adminLibChapterImageExtraction => 'Extrair imagens de capítulo';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extrair as imagens de capítulo durante a verificação da biblioteca';

  @override
  String get adminLibTrickplayExtraction =>
      'Ativar a extração de imagens trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extrair as imagens trickplay durante a verificação da biblioteca';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Salvar as imagens trickplay nas pastas de mídia';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Mesclar automaticamente as séries distribuídas em várias pastas';

  @override
  String get adminLibSeasonZeroName => 'Nome de exibição da temporada zero';

  @override
  String get adminLibLufsScan =>
      'Ativar a verificação LUFS para normalização de áudio';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferir a tag de artistas não padrão';

  @override
  String get adminLibAutoAddToCollection =>
      'Adicionar filmes automaticamente às coleções';

  @override
  String get adminLibraryNameRequired => 'O nome da biblioteca é obrigatório';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Falha ao criar a biblioteca: $error';
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
    return 'Desativar $name? Esse usuário não conseguirá entrar.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Ativar $name? Esse usuário poderá entrar novamente.';
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
    return 'Falha ao criar o usuário: $error';
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
  String get adminParentalControl => 'Controle parental';

  @override
  String get adminMaxParentalRating =>
      'Classificação indicativa máxima permitida';

  @override
  String get adminMaxParentalRatingHint =>
      'O conteúdo com classificação superior ficará oculto para este usuário.';

  @override
  String get adminParentalRatingNone => 'Nenhuma';

  @override
  String get adminBlockUnratedItems =>
      'Bloquear itens sem classificação ou com classificação não reconhecida';

  @override
  String get adminUnratedBook => 'Livros';

  @override
  String get adminUnratedChannelContent => 'Canais';

  @override
  String get adminUnratedLiveTvChannel => 'TV ao vivo';

  @override
  String get adminUnratedMovie => 'Filmes';

  @override
  String get adminUnratedMusic => 'Música';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Séries';

  @override
  String get adminAccessSchedules => 'Agendamentos de acesso';

  @override
  String get adminAccessSchedulesHint =>
      'Permitir o acesso apenas nos horários agendados abaixo. Sem nenhum agendamento definido, o acesso é permitido o dia todo.';

  @override
  String get adminAddSchedule => 'Adicionar agendamento';

  @override
  String get adminScheduleDay => 'Dia';

  @override
  String get adminScheduleStart => 'Início';

  @override
  String get adminScheduleEnd => 'Fim';

  @override
  String get adminDayEveryday => 'Todos os dias';

  @override
  String get adminDayWeekday => 'Dias de semana';

  @override
  String get adminDayWeekend => 'Fim de semana';

  @override
  String get adminDaySunday => 'Domingo';

  @override
  String get adminDayMonday => 'Segunda-feira';

  @override
  String get adminDayTuesday => 'Terça-feira';

  @override
  String get adminDayWednesday => 'Quarta-feira';

  @override
  String get adminDayThursday => 'Quinta-feira';

  @override
  String get adminDayFriday => 'Sexta-feira';

  @override
  String get adminDaySaturday => 'Sábado';

  @override
  String get adminAllowedTags => 'Tags permitidas';

  @override
  String get adminAllowedTagsHint =>
      'Apenas o conteúdo com estas tags é exibido. Deixe em branco para permitir tudo.';

  @override
  String get adminBlockedTags => 'Tags bloqueadas';

  @override
  String get adminBlockedTagsHint =>
      'O conteúdo com estas tags fica oculto para este usuário.';

  @override
  String get adminAddTag => 'Adicionar tag';

  @override
  String get adminEnabledDevices => 'Dispositivos habilitados';

  @override
  String get adminEnabledChannels => 'Canais habilitados';

  @override
  String get adminAuthProvider => 'Provedor de autenticação';

  @override
  String get adminPasswordResetProvider => 'Provedor de redefinição de senha';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Máximo de tentativas de login malsucedidas antes do bloqueio';

  @override
  String get adminLoginAttemptsHint =>
      'Defina 0 para o padrão ou -1 para desativar o bloqueio.';

  @override
  String get adminSyncPlayAccess => 'Acesso ao SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Permitir criar grupos e entrar neles';

  @override
  String get adminSyncPlayJoin => 'Permitir entrar em grupos';

  @override
  String get adminSyncPlayNone => 'Sem acesso';

  @override
  String get adminContentDeletionFolders => 'Permitir exclusão de conteúdo de';

  @override
  String get adminResetPasswordWarning =>
      'Isso removerá a senha. O usuário poderá fazer login sem senha.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'O servidor retornou HTTP $status';
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
    return 'Falha ao excluir o usuário: $error';
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
    return 'Falha ao criar a chave: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Token de chave ausente na resposta do servidor';

  @override
  String get adminRevokeApiKey => 'Revogar chave de API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revogar a chave de $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Chave de API revogada';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Falha ao revogar a chave: $error';
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
  String get adminBackupOptionsTitle => 'Criar backup';

  @override
  String get adminBackupInclude => 'Escolha o que incluir no backup.';

  @override
  String get adminBackupDatabase => 'Banco de dados';

  @override
  String get adminBackupDatabaseAlways => 'Sempre incluído';

  @override
  String get adminBackupMetadata => 'Metadados';

  @override
  String get adminBackupSubtitles => 'Legendas';

  @override
  String get adminBackupTrickplay => 'Imagens trickplay';

  @override
  String get adminCreatingBackup => 'Criando backup...';

  @override
  String get adminBackupCreated => 'Backup criado com sucesso';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Falha ao criar o backup: $error';
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
    return 'Falha ao salvar o arquivo: $error';
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
    return 'Falha ao carregar as tarefas: $error';
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
    return 'Falha ao parar a tarefa: $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Falha ao carregar a tarefa: $error';
  }

  @override
  String get adminRunNow => 'Corra agora';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Falha ao remover o gatilho: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Falha ao adicionar o gatilho: $error';
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
    return 'Falha ao alternar o plug-in: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstalar plug-in';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Tem certeza de que deseja desinstalar \"$name\"?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Falha ao desinstalar o plug-in: $error';
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
    return 'Falha ao carregar os plug-ins: $error';
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
    return 'Atualizando \"$name\" para a v$version...';
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
    return 'Falha ao salvar os repositórios: $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Falha ao carregar os repositórios: $error';
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
    return 'Não foi possível carregar as configurações do plug-in: $error';
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
  String get adminBaseUrlHint => 'por exemplo /jellyfin';

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
    return 'Falha ao carregar os metadados: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Falha ao salvar os metadados: $error';
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
    return 'Falha ao atualizar os metadados: $error';
  }

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
    return 'Imagem $imageType atualizada';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Falha ao baixar a imagem: $error';
  }

  @override
  String get adminUnsupportedImageFormat => 'Formato de imagem não suportado';

  @override
  String get adminImageReadFailed => 'Falha ao ler a imagem selecionada';

  @override
  String adminImageUploaded(String imageType) {
    return 'Imagem $imageType enviada';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Falha ao enviar a imagem: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Excluir imagem $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return 'Imagem $imageType excluída';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Falha ao excluir a imagem: $error';
  }

  @override
  String get adminAllProviders => 'Todos os provedores';

  @override
  String get adminNoRemoteImages => 'Nenhuma imagem remota encontrada';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Falha na descoberta de sintonizadores: $error';
  }

  @override
  String get adminAddTuner => 'Adicionar sintonizador';

  @override
  String get adminEditTuner => 'Editar sintonizador';

  @override
  String get adminTunerTypeM3u => 'Sintonizador M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Arquivo ou URL';

  @override
  String get adminTunerIpAddress => 'Endereço IP do sintonizador';

  @override
  String get adminTunerFriendlyName => 'Nome amigável';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limite de conexões simultâneas';

  @override
  String get adminTunerCountHelp =>
      'O número máximo de streams que o sintonizador permite ao mesmo tempo. Defina 0 para ilimitado.';

  @override
  String get adminTunerFallbackBitrate =>
      'Taxa de bits máxima de streaming alternativa';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Importar apenas os canais favoritos';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Permitir transcodificação por hardware';

  @override
  String get adminTunerAllowFmp4 =>
      'Permitir o contêiner de transcodificação fMP4';

  @override
  String get adminTunerAllowStreamSharing =>
      'Permitir compartilhamento de streams';

  @override
  String get adminTunerEnableStreamLooping => 'Ativar repetição de stream';

  @override
  String get adminTunerIgnoreDts => 'Ignorar DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Ler a entrada na taxa de quadros nativa';

  @override
  String get adminEditProvider => 'Editar provedor';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Arquivo ou URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefixo de filme';

  @override
  String get adminXmltvMovieCategories => 'Categorias de filmes';

  @override
  String get adminXmltvCategoriesHelp =>
      'Separe várias categorias com uma barra vertical.';

  @override
  String get adminXmltvKidsCategories => 'Categorias infantis';

  @override
  String get adminXmltvNewsCategories => 'Categorias de notícias';

  @override
  String get adminXmltvSportsCategories => 'Categorias de esportes';

  @override
  String get adminSdUsername => 'Nome de usuário';

  @override
  String get adminSdPassword => 'Senha';

  @override
  String get adminSdCountry => 'País';

  @override
  String get adminSdCountrySelect => 'Selecione um país';

  @override
  String get adminSdPostalCode => 'CEP';

  @override
  String get adminSdGetListings => 'Obter programação';

  @override
  String get adminSdListings => 'Programação';

  @override
  String get adminEnableAllTuners => 'Ativar todos os sintonizadores';

  @override
  String get adminTunerType => 'Tipo de sintonizador';

  @override
  String get adminTunerAdded => 'Sintonizador adicionado';

  @override
  String adminTunerAddFailed(String error) {
    return 'Falha ao adicionar o sintonizador: $error';
  }

  @override
  String get adminAddGuideProvider => 'Adicionar provedor de guia';

  @override
  String get adminProviderType => 'Tipo de provedor';

  @override
  String get adminProviderAdded => 'Provedor adicionado';

  @override
  String adminProviderAddFailed(String error) {
    return 'Falha ao adicionar o provedor: $error';
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
  String get adminTunerResetNotSupported =>
      'Este tipo de sintonizador não pode ser redefinido.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Falha ao remover o provedor: $error';
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
  String get adminMovieRecordingPath => 'Caminho de gravação de filmes';

  @override
  String get adminGuideDays => 'Dias de dados do guia';

  @override
  String get adminGuideDaysAuto => 'Automático';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dias';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Caminho do aplicativo de pós-processamento';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumentos do pós-processador';

  @override
  String get adminSaveRecordingNfo => 'Salvar metadados NFO da gravação';

  @override
  String get adminSaveRecordingImages => 'Salvar imagens da gravação';

  @override
  String get adminLiveTvSectionTiming => 'Tempo';

  @override
  String get adminLiveTvSectionPaths => 'Caminhos de gravação';

  @override
  String get adminLiveTvSectionPostProcessing => 'Pós-processamento';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Dados do guia: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Configurações de gravação salvas';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Falha ao salvar as configurações: $error';
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
    return 'Falha ao atualizar os mapeamentos: $error';
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
  String get adminRefreshGuideData => 'Atualizar dados do guia';

  @override
  String get adminGuideRefreshStarted =>
      'Atualização dos dados do guia iniciada';

  @override
  String get adminGuideRefreshUnavailable =>
      'A tarefa de atualização do guia não está disponível neste servidor.';

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
    return 'Caminho das séries: $path';
  }

  @override
  String adminPrePaddingDisplay(int minutes) {
    return 'Margem inicial: $minutes min';
  }

  @override
  String adminPostPaddingDisplay(int minutes) {
    return 'Margem final: $minutes min';
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
    return 'Restaurar o backup $name agora?';
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
  String get adminReset => 'Redefinir';

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
    return 'há ${minutes}min';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return 'há ${hours}h';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return 'há ${days}d';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Falha ao carregar $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count correspondências';
  }

  @override
  String get adminLogViewerNoMatches => 'Nenhuma linha correspondente';

  @override
  String get adminMetadataEditorTitle => 'Editor de metadados';

  @override
  String get adminMetadataIdentify => 'Identificar';

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
    return 'Imagem $imageType atualizada';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return 'Imagem $imageType enviada';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return 'Imagem $imageType excluída';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Falha ao baixar a imagem: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Falha ao ler a imagem selecionada';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Falha ao enviar a imagem: $error';
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
    return 'Falha ao excluir a imagem: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Escolher imagem $imageType';
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
    return 'Configurações do $name';
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
    return 'Falha ao carregar os repositórios: $error';
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
    return 'Falha ao salvar os repositórios: $error';
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
  String get adminBrandingSplashUpload => 'Enviar imagem';

  @override
  String get adminBrandingSplashUploaded => 'Tela de abertura atualizada';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Falha ao enviar a tela de abertura';

  @override
  String get adminBrandingSplashDeleted => 'Tela de abertura removida';

  @override
  String get adminBrandingNoSplash => 'Nenhuma tela de abertura personalizada';

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
  String get adminPlaybackQsvDevice => 'Dispositivo QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Ativar o decodificador NVDEC aprimorado';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferir o decodificador de hardware nativo do sistema';

  @override
  String get adminPlaybackColorDepth =>
      'Profundidade de cor da decodificação por hardware';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Decodificação HEVC de 10 bits';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Decodificação VP9 de 10 bits';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Decodificação HEVC RExt de 8/10 bits';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Decodificação HEVC RExt de 12 bits';

  @override
  String get adminPlaybackHwEncodingSection => 'Codificação por hardware';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Permitir codificação HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Permitir codificação AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Ativar o codificador Intel H.264 de baixo consumo';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Ativar o codificador Intel HEVC de baixo consumo';

  @override
  String get adminPlaybackToneMapping => 'Mapeamento de tons';

  @override
  String get adminPlaybackEnableTonemapping => 'Ativar o mapeamento de tons';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Ativar o mapeamento de tons VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Ativar o mapeamento de tons do VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Algoritmo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingMode => 'Modo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingRange => 'Faixa de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Dessaturação do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingPeak => 'Pico do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingParam => 'Parâmetro do mapeamento de tons';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Brilho do mapeamento de tons VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Contraste do mapeamento de tons VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Predefinições e qualidade';

  @override
  String get adminPlaybackEncoderPreset => 'Predefinição do codificador';

  @override
  String get adminPlaybackH264Crf => 'CRF de codificação H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF de codificação H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Método de desentrelaçamento';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Dobrar a taxa de quadros ao desentrelaçar';

  @override
  String get adminPlaybackAudioSection => 'Áudio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Ativar a codificação de áudio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Reforço do downmix de áudio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritmo de downmix estéreo';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Tamanho máximo da fila de muxing';

  @override
  String get adminPlaybackAutoOption => 'Auto';

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
  String get adminRunningTasks => 'Tarefas em execução';

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
    return 'Diariamente às $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Semanalmente, $day às $time';
  }

  @override
  String adminTaskTriggerInterval(String duration) {
    return 'A cada $duration';
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
      other: '$count horas',
      one: '1 hora',
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
    return 'há ${days}d';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return 'há ${hours}h';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'há ${minutes}min';
  }

  @override
  String get adminActivityNow => 'agora';

  @override
  String adminActivityMinutesShort(int minutes) {
    return '${minutes}min';
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
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Configure a geração de imagens trickplay para miniaturas de visualização de busca.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminNetworkingBaseUrl => 'URL base';

  @override
  String get adminNetworkingBaseUrlHint => 'por exemplo /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Porta HTTP pública';

  @override
  String get adminNetworkingRequireHttps => 'Exigir HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirecionar todas as solicitações remotas para HTTPS. Não tem efeito se o servidor não tiver um certificado válido.';

  @override
  String get adminNetworkingCertPassword => 'Senha do certificado';

  @override
  String get adminNetworkingIpSettings => 'Configurações de IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Ativar IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Ativar IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Ativar o mapeamento automático de portas';

  @override
  String get adminNetworkingLocalSubnets => 'Redes LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Lista de endereços IP ou sub-redes CIDR, separados por vírgula ou por linha, tratados como pertencentes à rede local.';

  @override
  String get adminNetworkingPublishedUris => 'URIs publicadas do servidor';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Mapeie uma sub-rede ou endereço para uma URL publicada, por exemplo: all=https://example.com';

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
  String get adminPlaybackThrottleDelay => 'Atraso de limitação (segundos)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Permitir a extração de legendas em tempo real';

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
  String get adminGeneralEnableSlowResponse =>
      'Ativar avisos de resposta lenta';

  @override
  String get adminGeneralQuickConnect => 'Ativar o Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Servidor';

  @override
  String get adminGeneralSectionMetadata => 'Metadados';

  @override
  String get adminGeneralSectionPaths => 'Caminhos';

  @override
  String get adminGeneralSectionPerformance => 'Desempenho';

  @override
  String get adminGeneralCachePath => 'Caminho do cache';

  @override
  String get adminGeneralMetadataPath => 'Caminho de metadados';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminGeneralDisplayLanguage => 'Idioma de exibição preferido';

  @override
  String get adminSettingsLoadFailed => 'Falha ao carregar as configurações';

  @override
  String get adminDiscover => 'Descobrir';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Falha ao atualizar os mapeamentos: $error';
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
      other: '# participantes',
      one: '# participante',
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
  String get syncPlayPlayNow => 'Reproduzir agora';

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
  String get syncPlayStatePlaying => 'Reproduzindo';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName entrou no grupo do SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName saiu do grupo do SyncPlay';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# linhas descobertas',
      one: '# linha descoberta',
    );
    return '$_temp0';
  }

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
  String get offlineBannerTitle => 'Você está offline';

  @override
  String get offlineBannerSubtitle => 'Mostrando seus downloads';

  @override
  String get offlineBannerAction => 'Downloads';

  @override
  String get serverUnreachableBannerTitle =>
      'Não foi possível acessar seu servidor';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Reproduzindo dos downloads até ele voltar';

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
    return 'Falha no controle do Cast: $error';
  }

  @override
  String castKindControls(String kind) {
    return 'Controles do $kind';
  }

  @override
  String get castDeviceVolume => 'Volume do dispositivo';

  @override
  String get castVolumeUnavailable => 'Indisponível';

  @override
  String castStopKind(String kind) {
    return 'Parar $kind';
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
    return 'Digite um PIN com $length digitos';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Digite seu PIN de $length digitos';
  }

  @override
  String get pinIncorrect => 'PIN incorreto';

  @override
  String get pinMismatch => 'Os PINs não correspondem';

  @override
  String get pinForgot => 'Esqueceu o PIN?';

  @override
  String get pinClear => 'Limpar';

  @override
  String get pinBackspace => 'Retrocesso';

  @override
  String get quickConnectAuthorized =>
      'Solicitação do Quick Connect autorizada.';

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
    return 'Falha no Quick Connect: $message';
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
  String get trackActionPlayNext => 'Reproduzir a seguir';

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
  String get imageTypePoster => 'Pôster';

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
  String get playNext => 'Reproduzir a seguir';

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
  String get continueWatchingAndNextUp => 'Continue assistindo e a seguir';

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
  String get contextMenuHideFromContinueWatching =>
      'Ocultar de Continuar assistindo';

  @override
  String get contextMenuHideFromNextUp => 'Ocultar de Próximo';

  @override
  String get contextMenuAddToCollection => 'Adicionar à coleção';

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
  String get settingsConnectionSection => 'CONEXÃO';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Permitir certificados autoassinados';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Confie em servidores que usam certificados TLS autoassinados ou de CA privada. Ative apenas para servidores que você controla. Isso desativa a validação de certificados em todas as conexões.';

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
  String get settingsDetailsScreen => 'Tela de detalhes';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Estilo, desfoque do fundo e comportamento das abas';

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
  String get settingsShowSeerrButtonInNavigation =>
      'Mostrar o botão do Seerr na barra de navegação';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Sempre mostrar os rótulos de texto na barra de navegação superior';

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
      'Pague um café para o desenvolvedor';

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
  String get settingsPoweredByFlutter => 'Desenvolvido com Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# avisos de licença',
      one: '# aviso de licença',
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
      'Recursos especializados do plater. Use com cuidado, pois algumas opções podem causar problemas de reprodução';

  @override
  String get settingsSkipIntrosAndOutros => 'Pular introduções e outros?';

  @override
  String get settingsMediaSegmentCountdown =>
      'Contagem regressiva do segmento de mídia';

  @override
  String get settingsProgressBar => 'Barra de progresso';

  @override
  String get settingsTimer => 'Cronômetro';

  @override
  String get settingsNone => 'Nenhum';

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
  String get onNow => 'Passando agora';

  @override
  String get collections => 'Coleções';

  @override
  String get lastPlayed => 'Reproduzido pela última vez';

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
    return '$libraryName lançados recentemente';
  }

  @override
  String get autoplayNextEpisode =>
      'Reproduzir o próximo episódio automaticamente';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Reproduzir automaticamente o próximo episódio quando disponível.';

  @override
  String get skipSilenceTitle => 'Pular silêncio';

  @override
  String get skipSilenceSubtitle =>
      'Pular automaticamente os trechos de áudio em silêncio quando o stream permitir.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Permitir efeitos de áudio externos';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permitir que aplicativos de equalização e efeitos (como o Wavelet) se conectem às sessões de reprodução do Media3.';

  @override
  String get disableTunnelingTitle => 'Desativar o tunelamento';

  @override
  String get disableTunnelingSubtitle =>
      'Forçar a reprodução sem tunelamento. Útil em dispositivos com falhas de sincronia de áudio/vídeo ao usar o tunelamento.';

  @override
  String get enableTunnelingTitle => 'Ativar o tunelamento';

  @override
  String get enableTunnelingSubtitle =>
      'Avançado. Encaminha o áudio e o vídeo por um caminho de hardware acoplado. Desativado por padrão porque causa falhas de áudio/vídeo em alguns dispositivos.';

  @override
  String get mapDolbyVisionP7Title =>
      'Mapear o perfil 7 do Dolby Vision para HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Reproduzir os streams do perfil 7 do Dolby Vision como HEVC compatível com HDR10 em dispositivos sem Dolby Vision.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Usar os estilos de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Aplicar as cores, fontes e o posicionamento incorporados na faixa de legenda. Desative para usar as suas preferências de estilo de legenda.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Usar os tamanhos de fonte de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Aplicar as sugestões de tamanho de fonte incorporadas na faixa de legenda. Desative para usar o tamanho de legenda das suas preferências de estilo.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Mostrar detalhes da mídia';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Mostrar os detalhes do item selecionado no topo das páginas de biblioteca.';

  @override
  String get hideBackdropsInLibraries => 'Ocultar planos de fundo ao navegar?';

  @override
  String get useDetailedSubHeadings => 'Usar subtítulos detalhados';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Mostrar a linha de subtítulos detalhada ou minimalista nas páginas de biblioteca.';

  @override
  String get savedThemesDeleteDialogTitle => 'Excluir o tema salvo?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remover \"$themeName\" do cache deste dispositivo?';
  }

  @override
  String get themeStore => 'Loja de temas';

  @override
  String get themeStoreSubtitle => 'Explore e salve temas da comunidade';

  @override
  String get themeStoreDescription =>
      'Salve um tema para usá-lo como os seus outros temas salvos.';

  @override
  String get themeStoreEmpty => 'Nenhum tema disponível no momento.';

  @override
  String get themeStoreLoadFailed =>
      'Não foi possível carregar a Loja de temas. Verifique sua conexão e tente novamente.';

  @override
  String get themeStoreSave => 'Salvar';

  @override
  String get themeStoreSaveAndApply => 'Salvar e aplicar';

  @override
  String get themeStoreSaved => 'Salvo';

  @override
  String get themeStoreInvalidMessage => 'Não foi possível carregar este tema.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" salvo.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" excluído deste dispositivo.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Não foi possível excluir \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Temas salvos';

  @override
  String get savedThemesDescription =>
      'Estes são os temas baixados do plug-in do Moonfin para o servidor atual. A exclusão remove apenas esta cópia local.';

  @override
  String get savedThemesEmpty =>
      'Nenhum tema salvo foi encontrado para este servidor.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Ativo no momento';
  }

  @override
  String get savedThemesDeleteTooltip => 'Excluir tema salvo';

  @override
  String get savedThemesManageSubtitle =>
      'Gerencie os temas de plug-in baixados neste dispositivo';

  @override
  String get themeEditor => 'Editor de temas';

  @override
  String get themeEditorSubtitle =>
      'Abra o Editor de Temas do Moonfin no seu navegador';

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
  String get homeRowDisplay => 'Exibição das linhas iniciais';

  @override
  String get homeRowSections => 'Seções das linhas iniciais';

  @override
  String get homeRowToggles => 'Ativação das linhas iniciais';

  @override
  String get homeRowTogglesSubtitle =>
      'Ative ou desative as categorias de linhas iniciais baseadas em bibliotecas';

  @override
  String get homeRowTogglesDescription =>
      'Ative as opções a seguir para exibir as linhas nas Seções do início.';

  @override
  String get rowsType => 'Rows Type';

  @override
  String get rowsTypeDescription =>
      'Clássico mantém o tipo de imagem e a sobreposição de informações por linha. Moderno usa linhas que vão de retrato a plano de fundo.';

  @override
  String get displayFavoritesRows => 'Exibir linhas de favoritos';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Mostrar as linhas de filmes e séries favoritos, entre outras, nas Seções do início.';

  @override
  String get favoritesRowSorting => 'Ordenação das linhas de favoritos';

  @override
  String get favoritesRowSortingDescription =>
      'Ordene as linhas de favoritos por data de adição, data de lançamento, ordem alfabética e muito mais.';

  @override
  String get displayCollectionsRows => 'Exibir linhas de coleções';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Mostrar as linhas de coleções nas Seções do início.';

  @override
  String get collectionsRowSorting => 'Ordenação das linhas de coleções';

  @override
  String get collectionsRowSortingDescription =>
      'Ordene as linhas de coleções por data de adição, data de lançamento, ordem alfabética e muito mais.';

  @override
  String get displayGenresRows => 'Exibir linhas de gêneros';

  @override
  String get displayGenresRowsSubtitle =>
      'Mostrar as linhas de gêneros nas Seções do início.';

  @override
  String get genresRowSorting => 'Ordenação das linhas de gêneros';

  @override
  String get genresRowSortingDescription =>
      'Ordene as linhas de gêneros por data de adição, data de lançamento, ordem alfabética e muito mais.';

  @override
  String get genresRowItems => 'Itens das linhas de gêneros';

  @override
  String get genresRowItemsDescription =>
      'Mostrar filmes, séries ou ambos nas linhas de gêneros.';

  @override
  String get displayPlaylistsRows => 'Exibir linhas de playlists';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Mostrar as linhas de playlists nas Seções do início.';

  @override
  String get playlistsRowSorting => 'Ordenação das linhas de playlists';

  @override
  String get playlistsRowSortingDescription =>
      'Ordene as linhas de playlists por data de adição, data de lançamento, ordem alfabética e muito mais.';

  @override
  String get displayAudioRows => 'Exibir linhas de áudio';

  @override
  String get displayAudioRowsSubtitle =>
      'Mostrar as linhas de áudio nas Seções do início.';

  @override
  String get audioRowsSorting => 'Ordenação das linhas de áudio';

  @override
  String get audioRowsSortingDescription =>
      'Ordene as linhas de áudio por data de adição, data de lançamento, ordem alfabética e muito mais.';

  @override
  String get audioPlaylists => 'Playlists de áudio';

  @override
  String get appearance => 'Aparência';

  @override
  String get layout => 'Layout';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Teclado';

  @override
  String get navButtons => 'Botões';

  @override
  String get rendering => 'Renderização';

  @override
  String get mpvConfiguration => 'Configuração do MPV';

  @override
  String get cardSize => 'Card Size';

  @override
  String get externalPlayerApp => 'Aplicativo de player externo';

  @override
  String get externalPlayerAppDescription =>
      'Defina um player externo para ativar a opção de reprodução ao pressionar e segurar';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Mostrar o seletor de aplicativos ao iniciar a reprodução.';

  @override
  String get loadingInstalledPlayers => 'Carregando os players instalados...';

  @override
  String get connection => 'Conexão';

  @override
  String get audioTranscodeTarget => 'Destino da transcodificação de áudio';

  @override
  String get passthrough => 'Passthrough';

  @override
  String get supportedOnThisDevice => 'Compatível com este dispositivo';

  @override
  String get notSupportedOnThisDevice => 'Não compatível com este dispositivo';

  @override
  String get settingsAudioDtsXPassthrough => 'Passthrough DTS:X (DTS UHD)';

  @override
  String get settingsAudioBitstreamDtsXToExternalDecoder =>
      'Envia o bitstream DTS:X (DTS UHD) para o decodificador externo.';

  @override
  String get settingsAudioTrueHdJocPassthrough =>
      'Passthrough TrueHD com Atmos (JOC)';

  @override
  String get mediaPlayerBehavior => 'Comportamento do player de mídia';

  @override
  String get playbackEnhancements => 'Aprimoramentos de reprodução';

  @override
  String get alwaysOn => 'Sempre ativo.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Substituir Pular encerramento pelo Próximo';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Mostrar a sobreposição do Próximo em vez do botão Pular encerramento.';

  @override
  String get playerRouting => 'Roteamento do player';

  @override
  String get preferSoftwareDecoders => 'Preferir decodificadores por software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Usar o FFmpeg (áudio) e a libgav1 (AV1) antes dos decodificadores de hardware. Desative se o passthrough de áudio HDMI falhar.';

  @override
  String get useExternalPlayer => 'Use external player';

  @override
  String get useExternalPlayerSubtitle =>
      'Abrir a reprodução de vídeo no aplicativo externo selecionado no Android TV.';

  @override
  String get automaticQueuing => 'Enfileiramento automático';

  @override
  String get preferSdhSubtitles => 'Preferir legendas SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Priorizar as faixas de legenda SDH/CC na seleção automática.';

  @override
  String get webDiagnostics => 'Diagnóstico da web';

  @override
  String get webDiagnosticsTitle => 'Diagnóstico da Web do Moonfin';

  @override
  String get webDiagnosticsIntro =>
      'Use esta página para diagnosticar problemas de conectividade do navegador (CORS, conteúdo misto e configurações de descoberta).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Falha de conteúdo misto detectada';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Falha de CORS/preflight detectada';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'O Moonfin detectou uma página HTTPS tentando chamar uma URL de servidor HTTP. Os navegadores bloqueiam essa solicitação antes que ela chegue ao seu servidor.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'O Moonfin detectou uma falha de solicitação no nível do navegador, geralmente causada pela ausência de cabeçalhos CORS ou de preflight no servidor de mídia.';

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
      'Contexto de execução atual';

  @override
  String get webDiagnosticsOrigin => 'Origem';

  @override
  String get webDiagnosticsScheme => 'Esquema';

  @override
  String get webDiagnosticsPluginMode => 'Modo de plug-in';

  @override
  String get webDiagnosticsWebRtcScan => 'Varredura WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL do servidor forçada';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL padrão do servidor';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL do proxy de descoberta';

  @override
  String get notConfigured => 'não configurado';

  @override
  String get webDiagnosticsMixedContent => 'Conteúdo misto';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Esta página é carregada por HTTPS, mas uma ou mais URLs configuradas usam HTTP. Os navegadores impedem que páginas HTTPS chamem APIs HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Correção: sirva seu servidor de mídia ou endpoint de proxy via HTTPS ou carregue o Moonfin por HTTP apenas em redes locais confiáveis.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nenhuma configuração óbvia de conteúdo misto foi detectada nas configurações de execução atuais.';

  @override
  String get webDiagnosticsCorsChecklist => 'Lista de verificação de CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Permita a origem do navegador em Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Inclua Authorization, X-Emby-Authorization e X-Emby-Token em Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Exponha Content-Range e Accept-Ranges para o streaming e a busca.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Retorne 204 para solicitações preflight OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemplo de trecho de cabeçalho (estilo nginx)';

  @override
  String get note => 'Observação';

  @override
  String get webDiagnosticsNonWebNote =>
      'Esta rota de diagnóstico é destinada às versões web. Se você estiver vendo isto em outra plataforma, estas verificações podem não se aplicar.';

  @override
  String get backToServerSelect => 'Voltar à seleção de servidor';

  @override
  String get signOutAllUsers => 'Sair de todas as contas';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'A permissão do microfone foi negada permanentemente. Ative-a nas configurações do sistema.';

  @override
  String get voiceSearchPermissionRequired =>
      'A permissão do microfone é necessária para a pesquisa por voz.';

  @override
  String get voiceSearchNoMatch => 'Não entendi. Tente novamente.';

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
  String get openIosRoutePicker => 'Abrir o seletor de rotas do iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'O seletor de rotas do AirPlay não está disponível neste dispositivo.';

  @override
  String get videos => 'Vídeos';

  @override
  String get programs => 'Programas';

  @override
  String get songs => 'Músicas';

  @override
  String get photoAlbums => 'Albums de fotos';

  @override
  String get photos => 'Fotos';

  @override
  String get people => 'Pessoas';

  @override
  String get recentlyReleasedEpisodes => 'Episódios lançados recentemente';

  @override
  String get watchAgain => 'Assistir novamente';

  @override
  String get guestAppearances => 'Participações especiais';

  @override
  String get appearancesSeerr => 'Participações (Seerr)';

  @override
  String get crewContributionsSeerr => 'Contribuições da equipe (Seerr)';

  @override
  String get watchWithGroup => 'Assistir em grupo';

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
      'Tem certeza de que deseja desligar o servidor? Você precisará reiniciá-lo manualmente.';

  @override
  String get internal => 'Interno';

  @override
  String get idle => 'Ocioso';

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
  String get passwordSet => 'Senha definida';

  @override
  String get noPasswordConfigured => 'Nenhuma senha configurada';

  @override
  String get remoteAccess => 'Acesso remoto';

  @override
  String get localOnly => 'Somente local';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Falha ao carregar a análise de mídia';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Análise combinada de todas as bibliotecas de mídia.';

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
      other: '$count Bibliotecas',
      one: '1 Biblioteca',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Ainda não há totais de mídia indexada para esta seleção.';

  @override
  String get analyticsLibraryDetails => 'Detalhes da biblioteca';

  @override
  String get analyticsLibraryBreakdown => 'Detalhamento por biblioteca';

  @override
  String get analyticsNoLibrariesAvailable => 'Nenhuma biblioteca disponível.';

  @override
  String get adminServerAdministrationTitle => 'Administração do servidor';

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
  String get adminServerPathTranscode => 'Transcodificação';

  @override
  String get adminServerPathWeb => 'Web';

  @override
  String get adminNoServerPathsReturned =>
      'Nenhum caminho foi retornado por este servidor.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% usado';
  }

  @override
  String get userActivity => 'Atividade dos usuários';

  @override
  String get systemEvents => 'Eventos do sistema';

  @override
  String get needsAttention => 'Requer atenção';

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
  String get mixedContent => 'Conteúdo misto';

  @override
  String get homeVideosAndPhotos => 'Vídeos caseiros e fotos';

  @override
  String get mixedMoviesAndShows => 'Filmes e séries mistos';

  @override
  String get intelQuickSync => 'Intel Quick Sync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
    return 'Falha no renderizador de EPUB ($code): $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Arquivo local ausente para o leitor: $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status ao abrir os dados do livro em $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Nenhum endpoint de leitura de livro disponível';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Formato de arquivo de quadrinhos não suportado: .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'O plug-in de extração de CBR não está disponível nesta plataforma.';

  @override
  String get failedToExtractCbrArchive => 'Falha ao extrair o arquivo .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'A extração de CB7 não está disponível nesta plataforma.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'O plug-in de extração de CB7 não está disponível nesta plataforma.';

  @override
  String get closeGenrePanel => 'Fechar o painel de gêneros';

  @override
  String get loadingShuffle => 'Carregando modo aleatório...';

  @override
  String get libraryShuffleLabel => 'ALEATÓRIO POR BIBLIOTECA';

  @override
  String get randomShuffleLabel => 'TOTALMENTE ALEATÓRIO';

  @override
  String get genresShuffleLabel => 'ALEATÓRIO POR GÊNEROS';

  @override
  String get autoHdrSwitching => 'Alternância automática de HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Ativar o HDR automaticamente na reprodução de vídeos HDR e restaurar o modo de exibição ao sair.';

  @override
  String get whenFullscreen => 'Quando em tela cheia';

  @override
  String get changeArtwork => 'Alterar imagens';

  @override
  String get missing => 'Ausente';

  @override
  String get transcodingLimits => 'Limites de transcodificação';

  @override
  String get clearAllArtworkButton => 'Limpar todas as imagens?';

  @override
  String get clearAllArtworkWarning =>
      'Tem certeza de que deseja limpar todas as imagens baixadas?';

  @override
  String get confirmClear => 'Confirmar limpeza';

  @override
  String confirmClearMessage(String itemType) {
    return 'Tem certeza de que deseja limpar esta imagem ($itemType)?';
  }

  @override
  String get uploadButton => 'Enviar?';

  @override
  String get resolutionLabel => 'Resolução: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Mostrar apenas as imagens no idioma da interface';

  @override
  String get confirmClearAll => 'Confirmar limpeza total';

  @override
  String get imageUploadSuccess => 'Imagem enviada com sucesso!';

  @override
  String imageUploadFailed(String error) {
    return 'Falha ao enviar a imagem: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Falha ao definir a imagem: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Falha ao excluir a imagem: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Falha ao limpar todas as imagens: $error';
  }

  @override
  String get yes => 'Sim';

  @override
  String get posterCategory => 'Pôster';

  @override
  String get backdropsCategory => 'Planos de fundo';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniatura';

  @override
  String get artCategory => 'Arte';

  @override
  String get discArtCategory => 'Arte do disco';

  @override
  String get screenshotCategory => 'Captura de tela';

  @override
  String get boxCoverCategory => 'Capa da caixa';

  @override
  String get boxRearCoverCategory => 'Contracapa da caixa';

  @override
  String get menuArtCategory => 'Arte do menu';

  @override
  String get confirmItemPoster => 'pôster';

  @override
  String get confirmItemBackdrop => 'plano de fundo';

  @override
  String get confirmItemBanner => 'banner';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniatura';

  @override
  String get confirmItemArt => 'arte';

  @override
  String get confirmItemDiscArt => 'arte do disco';

  @override
  String get confirmItemScreenshot => 'captura de tela';

  @override
  String get confirmItemBoxCover => 'capa da caixa';

  @override
  String get confirmItemBoxRearCover => 'contracapa da caixa';

  @override
  String get confirmItemMenuArt => 'arte do menu';

  @override
  String get resolutionAll => 'Todas';

  @override
  String get resolutionHigh => 'Alta (1080p+)';

  @override
  String get resolutionMedium => 'Média (720p)';

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
  String get audiobookQueue => 'Fila';

  @override
  String get audiobookTimeline => 'Linha do tempo';

  @override
  String get audiobookTimelineEmpty => 'A linha do tempo está vazia';

  @override
  String get audiobookWholeBook => 'Livro inteiro';

  @override
  String get audiobookFocusedTimeline => 'Linha do tempo focada';

  @override
  String get audiobookExportBookmarks => 'Exportar marcadores';

  @override
  String get audiobookExportNotes => 'Exportar notas';

  @override
  String get audiobookExportAll => 'Exportar tudo';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exportado para $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Falha na exportação: $error';
  }

  @override
  String get audiobookLyrics => 'Letras';

  @override
  String get audiobookAddBookmark => 'Adicionar marcador';

  @override
  String get audiobookAddNote => 'Adicionar nota';

  @override
  String get audiobookEditNote => 'Editar nota';

  @override
  String get audiobookNoteHint => 'Escreva uma nota para este momento';

  @override
  String get audiobookSleepTimer => 'Timer de desligamento';

  @override
  String get audiobookSleepOff => 'Desligado';

  @override
  String get audiobookSleepEndOfChapter => 'Fim do capítulo';

  @override
  String get audiobookSleepCustom => 'Personalizado';

  @override
  String audiobookSleepRemaining(String remaining) {
    return 'Faltam $remaining';
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
  String get audiobookPlaybackSpeed => 'Velocidade de reprodução';

  @override
  String get audiobookRemainingTime => 'Restante';

  @override
  String get audiobookElapsedTime => 'Decorrido';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Voltar ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Avançar ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Capítulo anterior';

  @override
  String get audiobookNextChapter => 'Próximo capítulo';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Capítulo $current de $total';
  }

  @override
  String get audiobookNoChapters => 'Nenhum capítulo';

  @override
  String get audiobookNoBookmarks => 'Ainda não há marcadores';

  @override
  String get audiobookNoNotes => 'Ainda não há notas';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Marcador adicionado em $position';
  }

  @override
  String get audiobookSpeedReset => 'Redefinir para 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Salvar';

  @override
  String get audiobookCancel => 'Cancelar';

  @override
  String get audiobookDelete => 'Excluir';

  @override
  String get subtitlePreferences => 'Preferências de legenda';

  @override
  String get subtitlePreferencesDescription =>
      'Altere os modos de legenda, os idiomas padrão, a aparência e as opções de renderização.';

  @override
  String get subtitleRendering => 'Renderização de legendas';

  @override
  String get displayOptions => 'Opções de exibição';

  @override
  String get releaseDateAscending => 'Data de lançamento (crescente)';

  @override
  String get releaseDateDescending => 'Data de lançamento (decrescente)';

  @override
  String get groupContributions => 'Agrupar contribuições';

  @override
  String get groupMultipleRoles => 'Agrupar múltiplos papéis';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Aviso de acesso de gravação à biblioteca';

  @override
  String get libraryWriteAccessHowToFix => 'Como corrigir:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Conceda permissões de gravação ao usuário do serviço Jellyfin (por exemplo, jellyfin ou o PUID/PGID do Docker) nas pastas da sua biblioteca de mídia no servidor.\n\n2. Ou acesse o Painel do Jellyfin -> Bibliotecas, edite esta biblioteca e desative a opção \'Salvar imagens nas pastas de mídia\' para armazenar as imagens no banco de dados interno do Jellyfin.';

  @override
  String get dismiss => 'Dispensar';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Sua biblioteca \'$libraryName\' está configurada para salvar as imagens diretamente nas pastas de mídia (a opção \'Salvar imagens nas pastas de mídia\' está ativada). No entanto, o Jellyfin testou o acesso de gravação e não tem permissão para gravar arquivos neste diretório:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Parece que o Jellyfin não conseguiu atualizar as imagens. Sua biblioteca está configurada para salvar as imagens diretamente nas pastas de mídia (a opção \'Salvar imagens nas pastas de mídia\' está ativada). Esse erro geralmente ocorre quando o processo do servidor Jellyfin não tem permissão para gravar arquivos nos seus diretórios de mídia.';

  @override
  String get externalLists => 'Listas externas';

  @override
  String get replay => 'Reproduzir novamente';

  @override
  String get fileInformation => 'Informações do arquivo';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Tamanho: $size  •  Formato: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Mostrar todas as ($count) faixas de áudio';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Mostrar todas as ($count) faixas de legenda';
  }

  @override
  String get checkingDirectPlay =>
      'Verificando a compatibilidade com reprodução direta...';

  @override
  String get directPlayCapabilityLabel =>
      'Compatibilidade com reprodução direta: ';

  @override
  String get forced => 'Forçada';

  @override
  String get transcodeContainerNotSupported =>
      'O formato do contêiner não é compatível com o player.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'O codec de vídeo não é compatível.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'O codec de áudio não é compatível.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'O formato da legenda não é compatível (exige incorporação).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'O perfil de áudio não é compatível.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'O perfil de vídeo não é compatível.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'O nível de vídeo não é compatível.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'A resolução do vídeo não é compatível com este dispositivo.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'A profundidade de bits do vídeo não é compatível.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'A taxa de quadros do vídeo não é compatível.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'A taxa de bits do arquivo excede o limite de streaming do player.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'A taxa de bits do vídeo excede o limite de streaming.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'A taxa de bits do áudio excede o limite de streaming.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'O número de canais de áudio não é compatível.';

  @override
  String get sortAlphabetical => 'Alfabética';

  @override
  String get sortReleaseAscending => 'Ordem de lançamento (crescente)';

  @override
  String get sortReleaseDescending => 'Ordem de lançamento (decrescente)';

  @override
  String get sortCustomDragDrop => 'Personalizada (arrastar e soltar)';

  @override
  String get playlistSortOptions => 'Opções de ordenação da playlist';

  @override
  String get resetSort => 'Redefinir ordenação';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rever T$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Playlist para rever';

  @override
  String get noSubtitlesFound => 'Nenhuma legenda encontrada.';

  @override
  String get adminControls => 'Controles de administração';

  @override
  String get impellerRendering => 'Mecanismo de renderização (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'O Impeller é o renderizador de GPU moderno do Flutter, com animações mais suaves e menos travamentos. Em alguns TV boxes e GPUs antigas, ele pode causar falhas visuais ou vídeo preto; desative-o se isso acontecer. Automático escolhe o melhor padrão para o seu dispositivo. Reinicie o Moonfin para aplicar.';

  @override
  String get impellerAuto => 'Automático';

  @override
  String get impellerOn => 'Ligado';

  @override
  String get impellerOff => 'Desligado';

  @override
  String get impellerRestartTitle => 'Reinicialização necessária';

  @override
  String get impellerRestartMessage =>
      'O Moonfin precisa ser reiniciado para alterar o mecanismo de renderização. Feche o aplicativo agora e abra-o novamente para aplicar.';

  @override
  String get impellerCloseNow => 'Fechar o aplicativo agora';

  @override
  String get adminRefreshLibrary => 'Atualizar biblioteca';

  @override
  String get adminRefreshAllLibraries => 'Atualizar todas as bibliotecas';

  @override
  String get adminRepoSortDateOldest =>
      'Data de adição (mais antigas primeiro)';

  @override
  String get adminRepoSortDateNewest =>
      'Data de adição (mais recentes primeiro)';

  @override
  String get adminRepoSortNameAsc => 'Alfabética (A a Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabética (Z a A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Carregando a análise do servidor... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Igual à origem';

  @override
  String get imdbTop250Movies => 'Top 250 Filmes do IMDb';

  @override
  String get imdbTop250TvShows => 'Top 250 Séries do IMDb';

  @override
  String get imdbMostPopularMovies => 'Filmes mais populares do IMDb';

  @override
  String get imdbMostPopularTvShows => 'Séries mais populares do IMDb';

  @override
  String get imdbLowestRatedMovies => 'Filmes com as piores notas do IMDb';

  @override
  String get imdbTopEnglishMovies => 'Melhores filmes em inglês do IMDb';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appTitle => 'Moonfin';

  @override
  String get accountPreferences => 'PREFERÊNCIAS DA CONTA';

  @override
  String get interfaceLanguage => 'Idioma da interface';

  @override
  String get systemLanguageDefault => 'Predefinição do sistema';

  @override
  String get signIn => 'Iniciar sessão';

  @override
  String get empty => 'Vazio';

  @override
  String connectingToServer(String serverName) {
    return 'A ligar a $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

  @override
  String get password => 'Palavra-passe';

  @override
  String get username => 'Nome de utilizador';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Introduz este código no painel web do teu servidor:';

  @override
  String get waitingForAuthorization => 'A aguardar autorização...';

  @override
  String get back => 'Voltar';

  @override
  String get serverUnavailable => 'O servidor não está disponível';

  @override
  String get loginFailed => 'Falha no início de sessão';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect indisponível: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect indisponível ($status): $detail';
  }

  @override
  String get whosWatching => 'Quem está a ver?';

  @override
  String get addUser => 'Adicionar utilizador';

  @override
  String get selectServer => 'Selecionar servidor';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin Versão $version';
  }

  @override
  String get savedServers => 'Servidores guardados';

  @override
  String get discoveredServers => 'Servidores descobertos';

  @override
  String get noneFound => 'Nenhum encontrado';

  @override
  String get unableToConnectToServer => 'Não foi possível ligar ao servidor';

  @override
  String get addServer => 'Adicionar servidor';

  @override
  String get embyConnect => 'Emby Connect';

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
  String get connectToServer => 'Ligar ao servidor';

  @override
  String get serverAddress => 'Endereço do servidor';

  @override
  String get serverAddressHint => 'https://seu-servidor.exemplo.com';

  @override
  String get connect => 'Ligar';

  @override
  String get secureStorageUnavailable => 'Armazenamento seguro indisponível';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin não conseguiu aceder ao chaveiro do teu sistema. O início de sessão pode continuar, mas o armazenamento seguro de tokens pode ficar indisponível até que o chaveiro seja desbloqueado.';

  @override
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Tema da aplicação';

  @override
  String get detailScreenStyle => 'Estilo do ecrã de detalhes';

  @override
  String get detailScreenStyleSubtitle =>
      'Clássico é a disposição centrada original do Moonfin. Moderno é uma disposição cinematográfica responsiva.';

  @override
  String get detailScreenStyleMoonfin => 'Clássico';

  @override
  String get detailScreenStyleModern => 'Moderno';

  @override
  String get expandedTabs => 'Separadores expandidos';

  @override
  String get expandedTabsSubtitle =>
      'Mostra automaticamente o conteúdo dos separadores enquanto navegas. Desativa para abrires e fechares cada separador manualmente.';

  @override
  String get showTechnicalDetails => 'Mostrar detalhes técnicos?';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Mostrar informações de codec, resolução e stream no resumo do banner';

  @override
  String get recommendationSystem => 'Sistema de recomendações';

  @override
  String get recommendationSystemSubtitle =>
      'Usa o algoritmo de biblioteca local do Moonfin Recomenda ou as métricas de semelhança online do TMDb. Nota: as recomendações online requerem a integração com o Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin Recomenda';

  @override
  String get recommendationSystemTmdb => 'Semelhança TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Aplicar limite de classificação etária?';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limitar as sugestões do Moonfin Recomenda pela classificação etária do conteúdo de destino';

  @override
  String get interfaceStyle => 'Estilo da interface';

  @override
  String get interfaceStyleSubtitle =>
      'Automático acompanha o teu dispositivo. Escolhe Apple ou Material para forçar um visual.';

  @override
  String get interfaceStyleAutomatic => 'Automático';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get glassQuality => 'Qualidade do vidro';

  @override
  String get glassQualitySubtitle =>
      'Auto escolhe o melhor efeito de vidro para este dispositivo. Completo força desfoque real; Reduzido usa um vidro leve que poupa energia da GPU.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Completo';

  @override
  String get glassQualityReduced => 'Reduzido';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Alterna entre Moonfin e Neon Pulse sem reiniciar a aplicação';

  @override
  String get customThemeTitle => 'Tema personalizado';

  @override
  String get customThemeSubtitle =>
      'Os temas personalizados alteram elementos visuais em todo o Moonfin. Escolhe uma destas opções para combinar com o teu estilo.';

  @override
  String get keyboardPreferSystemIme => 'Preferir o teclado do sistema';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Usa o método de entrada do teu dispositivo por predefinição para entrada de texto';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'O visual atual do Moonfin que todos adoram';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Estilo Synthwave com brilho magenta, texto ciano e contraste cromado mais forte';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Estilo de vidro líquido com fundo em gradiente flutuante, superfícies foscas e destaque em azul Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Estilo retro em pixel art com paleta robusta, bordas em blocos, sombras marcadas e um tipo de letra de pixels';

  @override
  String get embyConnectSignInSubtitle =>
      'Inicia sessão com a tua conta Emby Connect';

  @override
  String get emailOrUsername => 'E-mail ou nome de utilizador';

  @override
  String get selectAServer => 'Selecionar um servidor';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get noLinkedServers =>
      'Nenhum servidor associado a esta conta Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Credenciais Emby Connect inválidas';

  @override
  String get invalidEmbyConnectLogin =>
      'Nome de utilizador ou palavra-passe do Emby Connect inválidos';

  @override
  String get embyConnectExchangeNotSupported =>
      'O servidor não suporta a troca Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Erro de rede ao contactar o Emby Connect ou o servidor selecionado';

  @override
  String get loadingLinkedServers => 'A carregar servidores associados...';

  @override
  String get connectingToServerEllipsis => 'A ligar ao servidor...';

  @override
  String get noReachableAddress => 'Nenhum endereço acessível fornecido';

  @override
  String get invalidServerExchangeResponse =>
      'Resposta inválida do endpoint de troca do servidor';

  @override
  String unableToConnectTo(String target) {
    return 'Não foi possível ligar a $target';
  }

  @override
  String get exitApp => 'Sair do Moonfin?';

  @override
  String get exitAppConfirmation => 'Tens a certeza de que queres sair?';

  @override
  String get exit => 'Sair';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'Em pausa';

  @override
  String get gameSaveState => 'Guardar estado';

  @override
  String get games => 'Jogos';

  @override
  String get gameLoadState => 'Carregar estado';

  @override
  String get gameFastForward => 'Avanço rápido';

  @override
  String get gameEmulatorSettings => 'Definições do emulador';

  @override
  String get gameNoCoreOptions => 'Este core não tem opções ajustáveis.';

  @override
  String get gameHoldToOpenMenu => 'Mantém premido para abrir o menu';

  @override
  String get gamePlaybackUnsupported =>
      'Este dispositivo ainda não suporta a execução de jogos.';

  @override
  String get noHomeRowsLoaded => 'Nenhuma linha inicial pôde ser carregada';

  @override
  String get noHomeRowsHint =>
      'Tenta atualizar ou reduzir as secções iniciais ativas.';

  @override
  String get retryHomeRows => 'Tentar novamente as linhas iniciais';

  @override
  String get guide => 'Guia';

  @override
  String get recordings => 'Gravações';

  @override
  String get schedule => 'Agendamentos';

  @override
  String get series => 'Séries';

  @override
  String get noItemsFound => 'Nenhum item encontrado';

  @override
  String get home => 'Início';

  @override
  String get browseAll => 'Navegar por tudo';

  @override
  String get genres => 'Géneros';

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
  String get displaySettings => 'Definições de visualização';

  @override
  String get allGenres => 'Todos os géneros';

  @override
  String get noGenresFound => 'Nenhum género encontrado';

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
    return '$count itens';
  }

  @override
  String get continuing => 'Em continuação';

  @override
  String get ended => 'Terminado';

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
    return '$name — Géneros';
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
  String get bookmarks => 'Marcadores';

  @override
  String get noSavedBookmarks =>
      'Ainda não há marcadores guardados para este título.';

  @override
  String get openBook => 'Abrir livro';

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
      'Escolher quais feeds de assuntos serão apresentados no Discover.';

  @override
  String get apply => 'Aplicar';

  @override
  String get openLink => 'Abrir link';

  @override
  String get scanWithYourPhone => 'Digitaliza com o teu telemóvel';

  @override
  String get audiobookGenres => 'Géneros de audiolivros';

  @override
  String get pickAudiobookGenres =>
      'Escolher quais géneros mostrar no Audiobook Discover.';

  @override
  String get discoverAudiobooks => 'Descobre audiolivros';

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
      'Não foi possível carregar este género de momento.';

  @override
  String get continueReading => 'Continuar a ler';

  @override
  String get savedHighlights => 'Destaques guardados';

  @override
  String get continueListening => 'Continuar a ouvir';

  @override
  String get listen => 'Ouvir';

  @override
  String get resume => 'Retomar';

  @override
  String get failedToLoadLibrary => 'Falha ao carregar a biblioteca';

  @override
  String get popularNow => 'Popular agora';

  @override
  String get savedForLater => 'Guardar para mais tarde';

  @override
  String get topListens => 'Mais ouvidos';

  @override
  String get unreadDiscoveries => 'Descobertas por ler';

  @override
  String get pickUpAgain => 'Retomar';

  @override
  String get bookHighlightsDescription =>
      'Os teus livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get handPickedFromLibrary => 'Escolhido a dedo na tua biblioteca.';

  @override
  String get handPickedFromListeningQueue =>
      'Escolhido a dedo na tua fila de escuta.';

  @override
  String get booksWithHighlights =>
      'Livros com destaques, favoritos ou progresso de leitura.';

  @override
  String get jumpBackNarration =>
      'Volta para a narração sem procurar o teu lugar.';

  @override
  String get unreadBooksReady =>
      'Livros não lidos prontos para a próxima hora tranquila.';

  @override
  String get quickAccessFavorites =>
      'Acesso rápido aos livros que sempre consultas.';

  @override
  String get searchAudiobooks => 'Pesquisar audiolivros';

  @override
  String get searchYourLibrary => 'Pesquisa na tua biblioteca';

  @override
  String get pickUpStory => 'Continua a história de onde paraste';

  @override
  String get savedPlacesChapters =>
      'Os teus lugares guardados e capítulos por acabar';

  @override
  String authorsCount(int count) {
    return '$count autores';
  }

  @override
  String genresCount(int count) {
    return '$count géneros';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% concluído';
  }

  @override
  String get readyWhenYouAre => 'Pronto quando estiveres';

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
  String get browseByGenre => 'Navegar por género';

  @override
  String get discover => 'Descobrir';

  @override
  String get trendingTitlesOpenLibrary =>
      'Títulos populares por assunto da Open Library.';

  @override
  String get noBookmarkedItems => 'Ainda não há itens marcados como favoritos';

  @override
  String get nothingMatchesSection =>
      'Nada corresponde a esta secção ainda. Tenta outra guia ou volta após o término da sincronização da biblioteca.';

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
  String get readingStatus => 'Estado de leitura';

  @override
  String get playedStatus => 'Estado reproduzido';

  @override
  String get readStatus => 'Lido';

  @override
  String get watched => 'Visto';

  @override
  String get unread => 'Não lido';

  @override
  String get unwatched => 'Não visto';

  @override
  String get seriesStatus => 'Estado da série';

  @override
  String get allLibraries => 'Todas as bibliotecas';

  @override
  String get books => 'Livros';

  @override
  String get latestBooks => 'Livros recentes';

  @override
  String get latestAudiobooks => 'Audiolivros recentes';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livros',
      one: '1 livro',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Livro';

  @override
  String get bookFormatAudiobook => 'Audiolivro';

  @override
  String bookPercentRead(int percent) {
    return '$percent% lido';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time restantes';
  }

  @override
  String get bookHeroRead => 'Ler';

  @override
  String get bookHeroListen => 'Ouvir';

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
  String get openLinks => 'Ligações externas';

  @override
  String get librivoxPage => 'Página LibriVox';

  @override
  String get internetArchive => 'Arquivo da Internet';

  @override
  String get rssFeed => 'Feed RSS';

  @override
  String get downloadZip => 'Transferir Zip';

  @override
  String sectionCountLabel(int count) {
    return 'Secções: $count';
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
    return '$count autores';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count audiolivros',
      one: '1 audiolivro',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Lista de faixas';

  @override
  String get itemListPlaceholder => 'A lista de itens aparecerá aqui';

  @override
  String get failedToLoad => 'Falha ao carregar';

  @override
  String get delete => 'Eliminar';

  @override
  String get save => 'Guardar';

  @override
  String get moreLikeThis => 'Mais como este';

  @override
  String get castAndCrew => 'Elenco e equipa';

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
  String get authorDetails => 'Detalhes do Autor';

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
      other: '$count Temporadas',
      one: '1 Temporada',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Termina em $time';
  }

  @override
  String get items => 'Itens';

  @override
  String get extras => 'Extras';

  @override
  String get behindTheScenes => 'Bastidores';

  @override
  String get deletedScenes => 'Cenas eliminadas';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Entrevistas';

  @override
  String get scenes => 'Cenas';

  @override
  String get shorts => 'Curtas';

  @override
  String get trailers => 'Trailers';

  @override
  String timeRemaining(String time) {
    return '$time restantes';
  }

  @override
  String endsIn(String time) {
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
    return 'Retomar de $position';
  }

  @override
  String get play => 'Reproduzir';

  @override
  String get startOver => 'Recomeçar';

  @override
  String get restart => 'Reiniciar';

  @override
  String get readOffline => 'Ler offline';

  @override
  String get playOffline => 'Reproduzir offline';

  @override
  String get audio => 'Áudio';

  @override
  String get subtitles => 'Legendas';

  @override
  String get version => 'Versão';

  @override
  String get cast => 'Transmitir';

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
  String get downloaded => 'Transferido';

  @override
  String get downloadAll => 'Transferir tudo';

  @override
  String get download => 'Transferir';

  @override
  String get deleteDownloaded => 'Eliminar transferido';

  @override
  String get goToSeries => 'Ir para a série';

  @override
  String get editMetadata => 'Editar metadados';

  @override
  String get less => 'Menos';

  @override
  String get more => 'Mais';

  @override
  String get deleteItem => 'Eliminar item';

  @override
  String get deletePlaylist => 'Eliminar lista de reprodução';

  @override
  String get deletePlaylistMessage =>
      'Eliminar esta lista de reprodução do servidor?';

  @override
  String get deleteItemMessage => 'Eliminar este item do servidor?';

  @override
  String get failedToDeletePlaylist =>
      'Falha ao eliminar a lista de reprodução';

  @override
  String get failedToDeleteItem => 'Falha ao eliminar item';

  @override
  String get renamePlaylist => 'Renomear lista de reprodução';

  @override
  String get playlistName => 'Nome da lista de reprodução';

  @override
  String get deleteDownloadedAlbum => 'Eliminar álbum transferido';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Eliminar faixas transferidas de \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Faixas transferidas eliminadas';

  @override
  String get downloadedTracksDeleteFailed =>
      'Algumas faixas transferidas não puderam ser eliminadas';

  @override
  String get noTracksLoaded => 'Nenhuma faixa carregada';

  @override
  String noItemsLoaded(String itemLabel) {
    return 'Nenhum $itemLabel carregado';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'A transferir $title ($count itens)...';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Tens a certeza de que queres eliminar \"$name\" do servidor? Esta ação não pode ser desfeita.';
  }

  @override
  String get itemDeleted => 'Item eliminado';

  @override
  String get noPlayableTrailerFound =>
      'Nenhum trailer reproduzível encontrado.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Formato de livro não suportado: .$extension';
  }

  @override
  String get audioTrack => 'Faixa de áudio';

  @override
  String get subtitleTrack => 'Faixa de legenda';

  @override
  String get none => 'Nenhuma';

  @override
  String get downloadSubtitlesLabel => 'Transferir legendas...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Pesquisa usando o plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Transferir legendas';

  @override
  String get selectedSubtitleInvalid => 'A legenda selecionada é inválida.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Legenda transferida e selecionada: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Legenda transferida. Pode demorar um pouco a aparecer enquanto o Jellyfin atualiza o item.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Nenhuma legenda remota encontrada para $language.';
  }

  @override
  String get selectVersion => 'Selecionar a versão';

  @override
  String versionNumber(int number) {
    return 'Versão $number';
  }

  @override
  String get downloadAllQuality => 'Transferir tudo - qualidade';

  @override
  String get downloadQuality => 'Qualidade de transferência';

  @override
  String get originalFileNoReencoding => 'Ficheiro original, sem recodificação';

  @override
  String get originalFilesNoReencoding =>
      'Ficheiros originais, sem recodificação';

  @override
  String get noEpisodesLoaded => 'Nenhum episódio carregado';

  @override
  String downloadingItem(String name, String quality) {
    return 'A transferir $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Eliminar ficheiros transferidos';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Eliminar ficheiros locais para $typeLabel?\n\nIsto irá libertar espaço de armazenamento. Podes transferir novamente mais tarde.';
  }

  @override
  String get downloadedFilesDeleted => 'Ficheiros transferidos eliminados';

  @override
  String get failedToDeleteFiles => 'Falha ao eliminar ficheiros';

  @override
  String get deleteFiles => 'Eliminar ficheiros';

  @override
  String get director => 'REALIZAÇÃO';

  @override
  String get directors => 'REALIZAÇÃO';

  @override
  String get writer => 'ARGUMENTO';

  @override
  String get writers => 'ARGUMENTISTAS';

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
      other: '$count Faixas',
      one: '1 Faixa',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Capítulos',
      one: '1 Capítulo',
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
  String get readMore => 'Lê mais';

  @override
  String get shuffle => 'Aleatório';

  @override
  String get shuffleAllMusic => 'Reproduzir toda a música aleatoriamente';

  @override
  String get carSignInPrompt => 'Inicia sessão no Moonfin no teu telemóvel';

  @override
  String get carServerUnreachable =>
      'Não foi possível contactar o teu servidor';

  @override
  String downloadsCount(int count) {
    return '$count transferências';
  }

  @override
  String get perfectMatch => 'Combinação perfeita';

  @override
  String channelsCount(int count) {
    return '$count canais';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Estéreo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'A legenda remota $action requer a permissão de gestão de legendas Jellyfin para este utilizador.';
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
    return 'todos os episódios transferidos de \"$name\"';
  }

  @override
  String get deleteSeasonFiles =>
      'todos os episódios transferidos nesta temporada';

  @override
  String get stillWatching => 'Ainda está a ver?';

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
    return '$label Controlos';
  }

  @override
  String get deviceVolume => 'Volume do dispositivo';

  @override
  String get unavailable => 'Indisponível';

  @override
  String get pause => 'Pausar';

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
  String get longPressToUnlock => 'Pressiona e segura para desbloquear';

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
  String get reset => 'Repor';

  @override
  String get unknown => 'Desconhecido';

  @override
  String get playbackInformation => 'Informações de reprodução';

  @override
  String get playback => 'Reprodução';

  @override
  String get playMethod => 'Método de reprodução';

  @override
  String get directPlay => 'Reprodução direta';

  @override
  String get directStream => 'Transmissão direta';

  @override
  String get transcoding => 'Transcodificação';

  @override
  String get transcodeReasons => 'Razões de transcodificação';

  @override
  String get player => 'Leitor';

  @override
  String get container => 'Contentor';

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
  String get track => 'Faixa';

  @override
  String get channels => 'Canais';

  @override
  String get audioBitrate => 'Taxa de bits de áudio';

  @override
  String get sampleRate => 'Taxa de amostragem';

  @override
  String get format => 'Formato';

  @override
  String get external => 'Externo';

  @override
  String get embedded => 'Integrado';

  @override
  String castSessionError(String protocol) {
    return 'Erro de sessão $protocol';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Falha ao carregar detalhes do livro: $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'A renderização de EPUB na aplicação ainda não está disponível nesta plataforma.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Este formato (.$extension) ainda não pode ser renderizado na aplicação.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'A renderização de documentos incorporados não está disponível nesta plataforma.';

  @override
  String get couldNotOpenExternalViewer =>
      'Não foi possível abrir o visualizador externo.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Falha ao abrir o leitor na aplicação: $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Marcador já guardado em $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Marcador adicionado: $label';
  }

  @override
  String get noBookmarksYet =>
      'Ainda não há marcadores.\nToca no ícone de marcador durante a leitura para guardar a tua posição.';

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
  String get updating => 'A atualizar...';

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
  String get twoPageSpread => 'Vista de duas páginas';

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
  String get preparingInAppReader => 'A preparar leitor na aplicação...';

  @override
  String get pdfDataNotAvailable => 'Dados PDF não disponíveis.';

  @override
  String get readerFallbackModeActive => 'Modo alternativo do leitor ativo';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Esta plataforma não pode alojar o mecanismo de documento incorporado para ficheiros $extension.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Usa o Reload Reader depois de mudar para uma plataforma compatível (Android, iOS, macOS).';

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
  String get sports => 'Desportos';

  @override
  String get news => 'Notícias';

  @override
  String get kids => 'Infantil';

  @override
  String get premiere => 'Estreia';

  @override
  String get guideTimeline => 'Linha temporal do guia';

  @override
  String failedToLoadGuide(String error) {
    return 'Falha ao carregar o guia: $error';
  }

  @override
  String get noChannelsFound => 'Nenhum canal encontrado';

  @override
  String get liveBadge => 'AO VIVO';

  @override
  String guideNextProgram(String time, String title) {
    return 'A seguir: $time  $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}m restantes';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h restantes';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}m restantes';
  }

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
  String get record => 'Gravar';

  @override
  String get cancelRecordingAction => 'Cancelar gravação';

  @override
  String get programSetToRecord => 'Programa pronto para gravar';

  @override
  String get recordingCancelled => 'Gravação cancelada';

  @override
  String get unableToCreateRecording => 'Não foi possível criar a gravação';

  @override
  String get watch => 'Ver';

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
  String get failedToLoadSchedule => 'Falha ao carregar agendamentos';

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
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Tipo de conta Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Local';

  @override
  String get savedMedia => 'Conteúdo guardado';

  @override
  String get tvShows => 'Programas de TV';

  @override
  String get music => 'Música';

  @override
  String get musicAlbums => 'Álbuns de música';

  @override
  String get noMediaInFilter => 'Nenhum conteúdo neste filtro';

  @override
  String get noDownloadedMediaYet => 'Nenhum conteúdo transferido ainda';

  @override
  String get browseLibrary => 'Navegar na biblioteca';

  @override
  String get deleteDownload => 'Eliminar transferência';

  @override
  String removeItemAndFiles(String name) {
    return 'Remover \"$name\" e os seus ficheiros?';
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
    return 'Nenhuma faixa transferida encontrada para $name.';
  }

  @override
  String get season => 'Temporada';

  @override
  String get errorLoadingEpisodes => 'Erro ao carregar episódios';

  @override
  String get noDownloadedEpisodes => 'Nenhum episódio transferido';

  @override
  String get deleteEpisode => 'Eliminar episódio';

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
    return 'T$season E$episode';
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
  String get downloadedEpisodes => 'Episódios transferidos';

  @override
  String seasonNumber(int number) {
    return 'Temporada $number';
  }

  @override
  String seasonChip(int number) {
    return 'T$number';
  }

  @override
  String get specials => 'Especiais';

  @override
  String get deleteSeason => 'Eliminar temporada';

  @override
  String deleteAllEpisodesInSeason(String season) {
    return 'Eliminar todos os episódios transferidos em $season?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Episódios',
      one: '1 Episódio',
    );
    return '$_temp0';
  }

  @override
  String get storageManagement => 'Gestão de armazenamento';

  @override
  String get storageBreakdown => 'Divisão de armazenamento';

  @override
  String get downloadedItems => 'Itens transferidos';

  @override
  String get storageLimit => 'Limite de armazenamento';

  @override
  String get noLimit => 'Sem limite';

  @override
  String get deleteAllDownloads => 'Eliminar todas as transferências';

  @override
  String get deleteAllDownloadsWarning =>
      'Isto removerá todos os ficheiros de conteúdo transferidos e não poderá ser desfeito.';

  @override
  String get deleteAll => 'Eliminar tudo';

  @override
  String get deleteSelected => 'Eliminar selecionado';

  @override
  String deleteSelectedCount(int count) {
    return 'Eliminar $count itens transferidos?';
  }

  @override
  String get musicAndAudiobooks => 'Música e audiolivros';

  @override
  String get images => 'Imagens';

  @override
  String get database => 'Base de dados';

  @override
  String ofStorageLimit(String limit) {
    return 'do limite $limit';
  }

  @override
  String get settings => 'Definições';

  @override
  String get authentication => 'Autenticação';

  @override
  String get autoLoginServerManagement =>
      'Sessão automática, gestão de servidor';

  @override
  String get pinCode => 'Código PIN';

  @override
  String get setUpPinCodeProtection => 'Configurar proteção por código PIN';

  @override
  String get parentalControls => 'Controlo parental';

  @override
  String get contentRatingRestrictions => 'Restrições de classificação etária';

  @override
  String get bitRateResolutionBehavior =>
      'Taxa de bits, resolução, comportamento';

  @override
  String get languageSizeAppearance => 'Idioma, tamanho, aparência';

  @override
  String get qualityStorage => 'Qualidade, armazenamento';

  @override
  String get serverSyncAndPluginStatus =>
      'Sincronização do servidor e estado do plugin';

  @override
  String get mediaRequestIntegration => 'Integração de pedido de conteúdo';

  @override
  String get switchServer => 'Trocar servidor';

  @override
  String get signOut => 'Terminar sessão';

  @override
  String get versionLicenses => 'Versão, licenças';

  @override
  String get account => 'Conta';

  @override
  String get signInAndSecurity => 'Sessão e segurança';

  @override
  String get administration => 'Administração';

  @override
  String get serverSettingsUsersLibraries =>
      'Definições do servidor, utilizadores, bibliotecas';

  @override
  String get customization => 'Personalização';

  @override
  String get themeAndLayout => 'Tema e disposição';

  @override
  String get videoAndSubtitles => 'Vídeo e legendas';

  @override
  String get integrations => 'Integrações';

  @override
  String get pluginAndRequests => 'Plugins e pedidos';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personaliza a conta, a reprodução e o comportamento da interface';

  @override
  String optionsCount(int count) {
    return '$count opções';
  }

  @override
  String get themeAndAppearance => 'Tema e aparência';

  @override
  String get focusBorderColor => 'Cor da borda do foco';

  @override
  String get watchedIndicators => 'Indicadores vistos';

  @override
  String get always => 'Sempre';

  @override
  String get hideUnwatched => 'Ocultar não vistos';

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
      'Dimensionar cartões e blocos focados ou com cursor sobre eles';

  @override
  String get backgroundBackdrops => 'Cenários de fundo';

  @override
  String get showBackdropImages =>
      'Mostrar imagens de fundo por trás do conteúdo';

  @override
  String get seriesThumbnails => 'Miniaturas de séries';

  @override
  String get seriesThumbnailsDescription =>
      'Apenas episódios: usa a arte da série que corresponda a cada tipo de imagem de linha';

  @override
  String get homeRowInfoOverlay =>
      'Sobreposição de informações da linha inicial';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Mostrar título e metadados ao navegar nas linhas iniciais';

  @override
  String get clockDisplay => 'Visualização do relógio';

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
  String get themeMusicSettingsSubtitle =>
      'Páginas de detalhes, linhas iniciais e volume';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Música tema nas linhas iniciais';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Reproduzir ao navegar no ecrã inicial';

  @override
  String get loopThemeMusic => 'Repetir música-tema';

  @override
  String get loopThemeMusicSubtitle =>
      'Repetir a faixa em vez de a reproduzir uma única vez';

  @override
  String get detailsBackgroundBlur => 'Detalhes do desfoque de fundo';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Desfoque de fundo ao navegar';

  @override
  String get maxStreamingBitrate => 'Taxa máxima de bits de streaming';

  @override
  String get maxResolution => 'Resolução máxima';

  @override
  String get playerZoomMode => 'Modo de zoom do reprodutor';

  @override
  String get settingsScrollWheelAction => 'Roda do rato';

  @override
  String get settingsScrollWheelActionDescription =>
      'Escolhe o que acontece ao girar a roda do rato sobre o vídeo durante a reprodução.';

  @override
  String get scrollWheelActionOff => 'Desligado';

  @override
  String get scrollWheelActionSeek => 'Procurar (avançar / retroceder)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Ajustar';

  @override
  String get autoCrop => 'Corte automático';

  @override
  String get stretch => 'Esticar';

  @override
  String get refreshRateSwitching => 'Mudança de taxa de atualização';

  @override
  String get disabled => 'Desativado';

  @override
  String get scaleOnTv => 'Escala na TV';

  @override
  String get scaleOnDevice => 'Dimensionar no dispositivo';

  @override
  String get trickPlay => 'Reprodução avançada';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Mostrar miniaturas de visualização ao procurar';

  @override
  String get showDescriptionOnPause => 'Mostrar descrição em pausa';

  @override
  String get dimVideoShowOverview =>
      'Escurece o vídeo e mostra o texto de visão geral durante a pausa';

  @override
  String get osdLockButton => 'Botão de bloqueio OSD';

  @override
  String get osdLockButtonDescription =>
      'Mostrar um botão de bloqueio que bloqueia a entrada por toque até ser premido durante muito tempo';

  @override
  String get audioBehavior => 'Comportamento de áudio';

  @override
  String get downmixToStereo => 'Downmix para estéreo';

  @override
  String get defaultAudioLanguage => 'Idioma de áudio predefinido';

  @override
  String get fallbackAudioLanguage => 'Idioma de áudio alternativo';

  @override
  String get preferDefaultAudioTrack => 'Preferir faixa de áudio predefinida';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Preferir a faixa de áudio original em vez da dobragem localizada.';

  @override
  String get preferAudioDescription => 'Preferir faixas de audiodescrição';

  @override
  String get preferAudioDescriptionDescription =>
      'Preferir faixas de audiodescrição em vez das faixas normais.';

  @override
  String get transcodingAudio => 'Transcodificação (Áudio)';

  @override
  String get directStreamRemux => 'Transmissão direta (Remux)';

  @override
  String get transcodingBitrateOrResolution =>
      'Transcodificação (Taxa de bits ou Resolução)';

  @override
  String get transcodingVideoAndAudio => 'Transcodificação (Vídeo e Áudio)';

  @override
  String get transcodingVideo => 'Transcodificação (Vídeo)';

  @override
  String get autoServerDefault => 'Automático (predefinição do servidor)';

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
      'Áudio Bitstream DTS apenas para AVR; requer suporte de receptor e faixa de origem DTS';

  @override
  String get enableTrueHdAudio =>
      'Ativa o áudio TrueHD (pode não funcionar em todas as plataformas)';

  @override
  String get settingsAudioOutputMode => 'Modo de saída de áudio';

  @override
  String get settingsAudioOutputModeDescription =>
      'Escolhe como o áudio é descodificado. O Passthrough AVR envia streams Dolby/DTS em bruto para o teu recetor; Auto ou Downmix descodificam localmente.';

  @override
  String get settingsAudioOutputModeAvrPassthrough => 'Passagem AVR';

  @override
  String get settingsAudioFallbackCodec => 'Codec substituto de áudio';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Seleciona o formato de destino para transcodificar áudio multicanal quando o stream de origem não pode ser reproduzido diretamente nem enviado por passthrough.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Deteção automática\n(Recomendado)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Predefinição)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecTrueHd => 'TrueHD\n(Sem perdas)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Apenas estéreo)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Eficiente)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Sem perdas)';

  @override
  String get settingsMaxAudioChannels => 'Máximo de canais de áudio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configura o número máximo de canais da tua configuração de áudio. Os streams multicanal que excedam este limite serão reduzidos (downmix) ou transcodificados.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Deteção automática\n(Predefinição do hardware)';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Estéreo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadrifónico';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passagem (avançado)';

  @override
  String get settingsAudioCodecPassthrough => 'Passagem de codec';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Ativa apenas os formatos suportados pelo recetor AVR ou HDMI.';

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
  String get settingsAudioRouteHeadphones => 'Auscultadores';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count canais PCM';
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
  String get compressDynamicRange => 'Comprimir gama dinâmica';

  @override
  String get advancedMpv => 'Avançado mpv';

  @override
  String get enableCustomMpvConf => 'Ativar mpv.conf personalizado';

  @override
  String get applyMpvConfBeforePlayback =>
      'Aplica um mpv.conf especificado pelo utilizador antes do início da reprodução';

  @override
  String get unsafeAdvancedMpvOptions => 'Opções avançadas de mpv inseguras';

  @override
  String get unsafeMpvOptionsDescription =>
      'Permite um conjunto mais amplo de opções de mpv. Pode interromper o comportamento de reprodução.';

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
  String get nextUpTimeout => 'Próximo limite de tempo';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Enfileiramento de conteúdo';

  @override
  String get autoQueueNextEpisodes =>
      'Colocar automaticamente os próximos episódios na fila';

  @override
  String get stillWatchingPrompt => 'Ainda está a ver?';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Depois de episódios de $episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Retomar e avançar';

  @override
  String get resumeRewind => 'Retomar retroceder';

  @override
  String get unpauseRewind => 'Retomar retroceder';

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
  String get skipForwardLength => 'Comprimento do salto para a frente';

  @override
  String get customMpvConfPath => 'Caminho mpv.conf personalizado';

  @override
  String get notSetMpvConf =>
      'Não definido. Moonfin tentará um mpv.conf padrão nas pastas app/data.';

  @override
  String get selectMpvConf => 'Selecionar mpv.conf';

  @override
  String get pathToMpvConf => '/caminho/para/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'As definições de estilo (tamanho, cor, deslocamento) aplicam-se a legendas baseadas em texto (SRT, VTT, TTML). As legendas ASS/SSA usam o seu próprio estilo integrado, a menos que \"ASS/SSA Direct Play\" esteja desativado. Legendas de bitmap (PGS, DVB, VobSub) não podem ser reestilizadas.';

  @override
  String get defaultSubtitleLanguage => 'Idioma de legenda predefinido';

  @override
  String get defaultToNoSubtitles => 'Predefinido sem legendas';

  @override
  String get turnOffSubtitlesByDefault =>
      'Desativa as legendas por predefinição';

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
  String get subtitleMode => 'Modo de legendas';

  @override
  String get subtitleModeFlagged => 'Marcadas';

  @override
  String get subtitleModeAlways => 'Sempre';

  @override
  String get subtitleModeForeign => 'Estrangeiras';

  @override
  String get subtitleModeForced => 'Forçadas';

  @override
  String get subtitleModeFlaggedDescription =>
      'Reproduz faixas marcadas internamente nos metadados do ficheiro multimédia como \"default\" ou \"forced\".';

  @override
  String get subtitleModeAlwaysDescription =>
      'Carrega e mostra legendas automaticamente sempre que um vídeo começa.';

  @override
  String get subtitleModeForeignDescription =>
      'Ativa as legendas automaticamente se a faixa de áudio predefinida estiver num idioma estrangeiro.';

  @override
  String get subtitleModeForcedDescription =>
      'Carrega apenas legendas explicitamente marcadas com o sinalizador de metadados \"forced\".';

  @override
  String get subtitleModeNoneDescription =>
      'Desativa completamente o carregamento automático de legendas.';

  @override
  String get fallbackSubtitleLanguage => 'Idioma de legendas alternativo';

  @override
  String get subtitleStream => 'Stream de legendas';

  @override
  String get subtitlePreviewText =>
      'A rápida raposa castanha salta sobre o cão preguiçoso';

  @override
  String get verticalOffset => 'Deslocamento vertical';

  @override
  String get pgsDirectPlay => 'Reprodução direta PGS';

  @override
  String get directPlayPgsSubtitles => 'Legendas PGS com reprodução direta';

  @override
  String get assSsaDirectPlay => 'Reprodução direta ASS/SSA';

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
  String get semiTransparentBlack => 'Preto semitransparente';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Ambiente de trabalho';

  @override
  String get mobile => 'Móvel';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Definições de perfil $profile carregadas.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Falha ao carregar as definições do perfil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Definições locais sincronizadas com o perfil $profile.';
  }

  @override
  String get customizationProfile => 'Perfil de personalização';

  @override
  String get customizationProfileDescription =>
      'Escolhe o perfil para carregar, editar e sincronizar. Global aplica-se a todos os locais, a menos que um perfil de dispositivo o substitua. O ponto verde marca o perfil do teu dispositivo atual.';

  @override
  String get loadProfile => 'Carregar perfil';

  @override
  String get syncing => 'A sincronizar...';

  @override
  String get syncToProfile => 'Sincronizar com perfil';

  @override
  String get profileSyncHidden => 'Sincronização de perfil oculta';

  @override
  String get enablePluginSyncDescription =>
      'Ativa a sincronização do plugin do servidor nas definições do plugin para mostrar os controlos do perfil aqui.';

  @override
  String get quality => 'Qualidade';

  @override
  String get defaultDownloadQuality => 'Qualidade de transferência predefinida';

  @override
  String get network => 'Rede';

  @override
  String get wifiOnlyDownloads => 'Transferências apenas via Wi-Fi';

  @override
  String get reportDownloadsActivity => 'Mostrar transferências no servidor';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permitir que o administrador do servidor veja as tuas transferências transcodificadas no painel';

  @override
  String get onlyDownloadOnWifi => 'Transferir apenas quando ligado ao Wi-Fi';

  @override
  String get storage => 'Armazenamento';

  @override
  String get storageUsed => 'Armazenamento usado';

  @override
  String get manage => 'Gerir';

  @override
  String get calculating => 'A calcular...';

  @override
  String get downloadLocation => 'Localização de transferência';

  @override
  String get defaultLabel => 'Padrão';

  @override
  String get saveToDownloadsFolder => 'Guardar na pasta Downloads';

  @override
  String get downloadsVisibleToOtherApps =>
      'Transferências/Moonfin – visível para outras aplicações';

  @override
  String get dangerZone => 'Zona de perigo';

  @override
  String get clearAllDownloads => 'Limpar todas as transferências';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation => 'Alterar localização de transferência';

  @override
  String get changeDownloadLocationDescription =>
      'Novas transferências serão guardadas na pasta selecionada. As transferências existentes permanecerão na sua localização atual e poderão ser geridas nas definições de armazenamento.';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cannotWriteToFolder =>
      'Não é possível escrever na pasta selecionada. Escolhe um local diferente ou concede permissões de armazenamento.';

  @override
  String get saveToDownloadsFolderQuestion => 'Guardar na pasta Downloads?';

  @override
  String get saveToDownloadsFolderDescription =>
      'O conteúdo transferido será guardado em Downloads/Moonfin no teu dispositivo. Esses ficheiros ficarão visíveis para outras aplicações, como a tua galeria ou reprodutor de música.\n\nAs transferências existentes permanecerão na localização atual.';

  @override
  String get enable => 'Ativar';

  @override
  String get clearAllDownloadsWarning =>
      'Isto eliminará todo o conteúdo transferido e não poderá ser desfeito.';

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
  String get showGenresButton => 'Botão Mostrar géneros';

  @override
  String get showFavoritesButton => 'Mostrar botão Favoritos';

  @override
  String get showLibrariesInToolbar =>
      'Mostrar bibliotecas na barra de ferramentas';

  @override
  String get navbarAlwaysExpanded =>
      'Expandir sempre os rótulos da barra de navegação';

  @override
  String get showSeerrButton => 'Mostrar botão Seerr';

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
  String get brown => 'Castanho';

  @override
  String get darkRed => 'Vermelho Escuro';

  @override
  String get darkGreen => 'Verde Escuro';

  @override
  String get slate => 'Ardósia';

  @override
  String get indigo => 'Índigo';

  @override
  String get libraryDisplay => 'Visualização da Biblioteca';

  @override
  String get posterLabel => 'Póster';

  @override
  String get thumbnailLabel => 'Miniatura';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get overridePerLibrarySettings =>
      'Substituir definições por biblioteca';

  @override
  String get applyImageTypeToAllLibraries =>
      'Aplicar tipo de imagem a todas as bibliotecas';

  @override
  String get multiServerLibraries => 'Bibliotecas multiservidor';

  @override
  String get showLibrariesFromAllServers =>
      'Mostrar bibliotecas de todos os servidores ligados';

  @override
  String get enableFolderView => 'Ativar visualização de pasta';

  @override
  String get showFolderBrowsingOption => 'Mostrar opção de navegação em pastas';

  @override
  String get groupItemsIntoCollections => 'Agrupar itens em coleções';

  @override
  String get hideCollectionAssociatedItems =>
      'Ocultar itens da biblioteca associados a coleções ao navegar pelas bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogTitle =>
      'Aviso de agrupamento de bibliotecas';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Para usares esta definição, certifica-te de que as opções \"Agrupar filmes em coleções\" e/ou \"Agrupar séries em coleções\" estão ativadas nas definições de Visualização da tua biblioteca no teu servidor Jellyfin ou Emby.';

  @override
  String get libraryVisibility => 'Visibilidade da Biblioteca';

  @override
  String get libraryVisibilityDescription =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicia o Moonfin para que as alterações tenham efeito.';

  @override
  String get showInNavigation => 'Mostrar na navegação';

  @override
  String get showInLatestMedia => 'Mostrar no conteúdo mais recente';

  @override
  String get sourceLibraries => 'Bibliotecas de origem';

  @override
  String get sourceCollections => 'Coleções de origem';

  @override
  String get excludedGenres => 'Géneros eliminados';

  @override
  String get selectAll => 'Selecionar tudo';

  @override
  String itemsSelected(int count) {
    return '$count selecionado';
  }

  @override
  String get mediaBar => 'Barra de conteúdo';

  @override
  String get mediaSources => 'Fontes de conteúdo';

  @override
  String get behavior => 'Comportamento';

  @override
  String get seconds => 'segundos';

  @override
  String get localPreviews => 'Visualizações locais';

  @override
  String get localPreviewsDescription =>
      'Configura visualizações de trailer, conteúdo e áudio.';

  @override
  String get mediaBarMode => 'Estilo da barra de conteúdo';

  @override
  String get mediaBarModeDescription =>
      'Escolhe entre vários estilos de barra de conteúdo ou desativa a barra de conteúdo';

  @override
  String get mediaBarModeMoonfin => 'Moonfin';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desligado';

  @override
  String get enableMediaBar => 'Ativar barra de conteúdo';

  @override
  String get showFeaturedContentSlideshow =>
      'Mostrar apresentação de diapositivos de conteúdo em destaque na página inicial';

  @override
  String get contentType => 'Tipo de conteúdo';

  @override
  String get moviesAndTvShows => 'Filmes e séries de TV';

  @override
  String get moviesOnly => 'Apenas filmes';

  @override
  String get tvShowsOnly => 'Apenas séries de TV';

  @override
  String get itemCount => 'Contagem de itens';

  @override
  String get noneSelected => 'Nenhum selecionado';

  @override
  String get noneExcluded => 'Nenhum eliminado';

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
      'Reproduz trailers automaticamente na barra de conteúdo após 3 segundos';

  @override
  String get trailerAudio => 'Áudio do trailer';

  @override
  String get enableTrailerAudio =>
      'Ativar o áudio dos trailers na barra de conteúdo';

  @override
  String get episodePreview => 'Prévia do episódio';

  @override
  String get mediaPreview => 'Visualização de conteúdo';

  @override
  String get episodePreviewDescription =>
      'Reproduz uma pré-visualização inline de 30 segundos em cartões focados, com cursor sobre eles ou premidos durante muito tempo';

  @override
  String get mediaPreviewDescription =>
      'Reproduzir uma visualização in-line de 30 segundos em cartões focados, pairados ou pressionados por muito tempo';

  @override
  String get previewAudio => 'Pré-visualizar áudio';

  @override
  String get enablePreviewAudio =>
      'Ativar áudio para pré-visualizações de trailers e episódios';

  @override
  String get latestMedia => 'Últimos conteúdos';

  @override
  String get recentlyReleased => 'Lançado recentemente';

  @override
  String get myMedia => 'O meu conteúdo';

  @override
  String get myMediaSmall => 'O meu conteúdo (pequena)';

  @override
  String get continueWatching => 'Continuar a ver';

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
  String get homeSections => 'Secções iniciais';

  @override
  String get resetToDefaults => 'Repor predefinições';

  @override
  String get homeRowPosterSize => 'Tamanho do pôster da linha inicial';

  @override
  String get perRowImageTypeSelection => 'Seleção de tipo de imagem por linha';

  @override
  String get configureImageTypeForEachRow =>
      'Configura o tipo de imagem para cada linha inicial ativada';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Combinar «Continuar a Ver» e «Próximo»';

  @override
  String get combineBothRows =>
      'Combine as duas linhas em uma única secção inicial';

  @override
  String get fullScreenRows => 'Linhas iniciais expandidas';

  @override
  String get fullScreenRowsDescription =>
      'Limitar as linhas iniciais a 1 linha por ecrã';

  @override
  String get perRowImageType => 'Tipo de imagem por linha';

  @override
  String get perRowSettings => 'Definições por linha';

  @override
  String get autoLogin => 'Sessão automática';

  @override
  String get lastUser => 'Último utilizador';

  @override
  String get currentUser => 'Utilizador atual';

  @override
  String get alwaysAuthenticate => 'Sempre autenticar';

  @override
  String get requirePasswordWithToken =>
      'Exigir palavra-passe mesmo com token guardado';

  @override
  String get confirmExit => 'Confirmar saída';

  @override
  String get showConfirmationBeforeExiting =>
      'Mostrar confirmação antes de sair';

  @override
  String get blockContentWithRatings =>
      'Bloqueia conteúdo com as seguintes classificações:';

  @override
  String get noContentRatingsFound =>
      'Nenhuma classificação de conteúdo foi encontrada neste servidor ainda.';

  @override
  String get couldNotLoadServerRatings =>
      'Não foi possível carregar as classificações do servidor. A mostrar apenas classificações guardadas.';

  @override
  String get couldNotRefreshRatings =>
      'Não foi possível atualizar as classificações do servidor. A mostrar classificações guardadas.';

  @override
  String get enablePinCode => 'Ativar código PIN';

  @override
  String get requirePinToAccess => 'Exigir um PIN para aceder à tua conta';

  @override
  String get changePin => 'Alterar PIN';

  @override
  String get setNewPinCode => 'Definir um novo código PIN';

  @override
  String get removePin => 'Remover PIN';

  @override
  String get removePinProtection => 'Remover proteção do código PIN';

  @override
  String get screensaver => 'Protetor de ecrã';

  @override
  String get inAppScreensaver => 'Protetor de ecrã na aplicação';

  @override
  String get enableBuiltInScreensaver => 'Ativa o protetor de ecrã integrado';

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
  String get onlyShowRatedContent => 'Mostrar apenas conteúdo classificado';

  @override
  String get showClock => 'Mostrar relógio';

  @override
  String get displayClockDuringScreensaver =>
      'Mostrar relógio durante o protetor de ecrã';

  @override
  String get clockModeStatic => 'Estático';

  @override
  String get clockModeBouncing => 'Saltitante';

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
  String get metacriticUser => 'Metacritic (utilizador)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Letterboxd';

  @override
  String get myAnimeList => 'MyAnimeList';

  @override
  String get aniList => 'AniList';

  @override
  String get communityRating => 'Classificação da comunidade';

  @override
  String get ratings => 'Avaliações';

  @override
  String get additionalRatings => 'Classificações Adicionais';

  @override
  String get showMdbListAndTmdbRatings =>
      'Mostrar classificações MDBList e TMDB';

  @override
  String get ratingLabels => 'Etiquetas de classificação';

  @override
  String get showLabelsNextToIcons =>
      'Mostrar etiquetas ao lado dos ícones de classificação';

  @override
  String get ratingBadges => 'Selos de classificação';

  @override
  String get showDecorativeBadges =>
      'Mostrar emblemas decorativos atrás das classificações';

  @override
  String get episodeRatings => 'Classificações de episódios';

  @override
  String get showRatingsOnEpisodes =>
      'Mostrar classificações em episódios individuais';

  @override
  String get ratingSources => 'Fontes de classificação';

  @override
  String get ratingSourcesDescription =>
      'Ativa e reordena as fontes de classificação mostradas em toda a aplicação';

  @override
  String get pluginLabel => 'Plugin Moonbase';

  @override
  String get pluginDetected => 'Plugin detetado';

  @override
  String get pluginNotDetected => 'Plugin não detetado';

  @override
  String get pluginDetectedDescription =>
      'Plugin de servidor detetado. A sincronização é ativada automaticamente na primeira vez que o plugin é encontrado.';

  @override
  String get pluginNotDetectedDescription =>
      'O plugin do servidor não foi detetado de momento. As definições locais ainda usam os seus valores guardados ou predefinições integradas.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersão: $version';
  }

  @override
  String get availableServices => 'Serviços disponíveis';

  @override
  String get serverPluginSync => 'Sincronização de plugin de servidor';

  @override
  String get syncSettingsWithPlugin =>
      'Sincronizar definições com o plugin do servidor';

  @override
  String get whatSyncControls => 'Quais controlos de sincronização';

  @override
  String get syncControlsDescription =>
      'A sincronização controla apenas se as definições suportadas pelo plugin são enviadas e extraídas do servidor. A seleção de perfil e as ações de sincronização de perfil estão nas definições de personalização quando a sincronização do plugin está ativada.';

  @override
  String get recentRequests => 'Pedidos recentes';

  @override
  String get recentlyAdded => 'Adicionado recentemente';

  @override
  String get trending => 'Tendências';

  @override
  String get popularMovies => 'Filmes populares';

  @override
  String get movieGenres => 'Géneros de filmes';

  @override
  String get upcomingMovies => 'Próximos filmes';

  @override
  String get studios => 'Estúdios';

  @override
  String get popularSeries => 'Séries populares';

  @override
  String get seriesGenres => 'Géneros de séries';

  @override
  String get upcomingSeries => 'Próximas séries';

  @override
  String get networks => 'Redes';

  @override
  String get seerrDiscoveryRows => 'Linhas de descoberta Seerr';

  @override
  String get resetRowsToDefaults => 'Redefinir linhas para os padrões';

  @override
  String get enableSeerr => 'Ativar Seerr';

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
  String get seerrNotificationsSection => 'Notificações';

  @override
  String get seerrNotifyNewRequestsTitle => 'Notificações de novos pedidos';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'Avisar-me quando alguém enviar um pedido';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Atualizações de pedidos';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Aprovados, recusados e adicionados à tua biblioteca';

  @override
  String get seerrNotifyIssuesTitle => 'Atualizações de problemas';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Novos problemas, respostas e resoluções';

  @override
  String loggedInAs(String username) {
    return 'Sessão iniciada como: $username';
  }

  @override
  String get discoverRows => 'Página de Descoberta do Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Ativa as linhas que queres ver na página principal do Seerr. Arrasta para reordenar. A ordem personalizada é sincronizada com o Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Ativa as linhas que queres ver na página principal do Seerr. Arrasta para reordenar. A ordem personalizada é sincronizada com o Moonbase.';

  @override
  String get enabled => 'Ativado';

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
  String get sourceCode => 'Código fonte';

  @override
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

  @override
  String get checkForUpdatesNow => 'Verificar atualizações agora';

  @override
  String get checksLatestDesktopRelease =>
      'Verifica a versão de desktop mais recente para esta plataforma';

  @override
  String get youAreUpToDate => 'Estás atualizado.';

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
      'Aguarda antes de verificar novamente.';

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
  String get readReleaseNotes => 'Lê as notas de versão';

  @override
  String get downloadingUpdate => 'A transferir atualização...';

  @override
  String get updateDownloadFailed =>
      'Falha na transferência da atualização. Por favor, tenta novamente.';

  @override
  String get openReleasesPage => 'Abrir página de lançamentos';

  @override
  String get navigation => 'Navegação';

  @override
  String get watchedIndicatorsBackdrops => 'Indicadores vistos, cenários';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Cor do foco, indicadores vistos, cenários';

  @override
  String get navbarStyleToolbarAppearance =>
      'Estilo da barra de navegação, botões da barra de ferramentas, aparência';

  @override
  String get reorderToggleHomeRows => 'Reordenar e alternar linhas iniciais';

  @override
  String get featuredContentAppearance => 'Conteúdo em destaque, aparência';

  @override
  String get posterSizeImageTypeFolderView =>
      'Tamanho do póster, tipo de imagem, visualização de pasta';

  @override
  String get mdbListTmdbRatingSources =>
      'MDBList, TMDB e fontes de classificação';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String mbValue(int value) {
    return '$value MB';
  }

  @override
  String get imageCacheLimit => 'Limite da cache de imagens';

  @override
  String get clearImageCache => 'Limpar a cache de imagens';

  @override
  String get imageCacheCleared => 'Cache de imagens limpa';

  @override
  String get clear => 'Limpar';

  @override
  String get browse => 'Navegar';

  @override
  String get noResults => 'Nenhum resultado';

  @override
  String get seerrAvailableStatus => 'Disponível';

  @override
  String get seerrRequestedStatus => 'Pedida';

  @override
  String seerrDownloadingPercent(int percent) {
    return 'A transferir · $percent%';
  }

  @override
  String get seerrImportingStatus => 'A importar';

  @override
  String itemsCount(int count) {
    return '$count Itens';
  }

  @override
  String get seerrSettings => 'Definições do Seerr';

  @override
  String get requestMore => 'Pedir mais';

  @override
  String get request => 'Pedir';

  @override
  String get cancelRequest => 'Cancelar pedido';

  @override
  String get playInMoonfin => 'Reproduzir no Moonfin';

  @override
  String requestedByName(String name) {
    return 'Pedido por $name';
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
    return 'Cancelar pedido de \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancelar $count pedidos para \"$title\"?';
  }

  @override
  String get keep => 'Manter';

  @override
  String get itemNotFoundInLibrary =>
      'Item não encontrado na tua biblioteca Moonfin';

  @override
  String get errorSearchingLibrary => 'Erro ao pesquisar na biblioteca';

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
    return 'Pedir $type';
  }

  @override
  String get submitRequest => 'Enviar pedido';

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
  String get appearances => 'Participações';

  @override
  String get crewSection => 'Equipa';

  @override
  String ageValue(int age) {
    return 'idade $age';
  }

  @override
  String get noRequests => 'Nenhum pedido';

  @override
  String get pendingStatus => 'Pendente';

  @override
  String get declinedStatus => 'Recusado';

  @override
  String get partiallyAvailable => 'Parcialmente disponível';

  @override
  String get downloadingStatus => 'A transferir';

  @override
  String get approvedStatus => 'Aprovado';

  @override
  String get notRequestedStatus => 'Não pedido';

  @override
  String get blocklistedStatus => 'Na lista de bloqueio';

  @override
  String get deletedStatus => 'Eliminado';

  @override
  String get failedStatus => 'Falhou';

  @override
  String get processingStatus => 'Em processamento';

  @override
  String modifiedByName(String name) {
    return 'Modificado por $name';
  }

  @override
  String get completedStatus => 'Concluído';

  @override
  String get requestErrorDuplicate => 'Este título já foi pedido';

  @override
  String get requestErrorQuota => 'Limite de pedidos atingido';

  @override
  String get requestErrorBlocklisted => 'Este título está na lista de bloqueio';

  @override
  String get requestErrorNoSeasons => 'Não há mais temporadas para pedir';

  @override
  String get requestErrorPermission =>
      'Não tens permissão para fazer este pedido';

  @override
  String get seerrRequestsTitle => 'Pedidos';

  @override
  String get seerrIssuesTitle => 'Problemas';

  @override
  String get sortNewest => 'Mais recentes';

  @override
  String get sortLastModified => 'Última modificação';

  @override
  String get noIssues => 'Sem problemas';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining de $limit pedidos de filmes restantes';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining de $limit pedidos de temporadas restantes';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Parte de $name';
  }

  @override
  String get viewCollection => 'Ver coleção';

  @override
  String get requestCollection => 'Pedir coleção';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total filmes · $available disponíveis';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Pedir $count filmes';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'A pedir $current de $total...';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count filmes pedidos';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok de $total filmes pedidos';
  }

  @override
  String get collectionAllRequested =>
      'Todos os filmes já estão disponíveis ou pedidos';

  @override
  String get reportIssue => 'Comunicar problema';

  @override
  String get issueTypeVideo => 'Vídeo';

  @override
  String get issueTypeAudio => 'Áudio';

  @override
  String get whatsWrong => 'Qual é o problema?';

  @override
  String get allEpisodes => 'Todos os episódios';

  @override
  String get episode => 'Episódio';

  @override
  String get openStatus => 'Aberto';

  @override
  String get resolvedStatus => 'Resolvido';

  @override
  String get resolveAction => 'Resolver';

  @override
  String get reopenAction => 'Reabrir';

  @override
  String reportedByName(String name) {
    return 'Comunicado por $name';
  }

  @override
  String commentsCount(int count) {
    return '$count comentários';
  }

  @override
  String get addComment => 'Adicionar um comentário';

  @override
  String get deleteIssueConfirm => 'Eliminar este problema?';

  @override
  String get submitReport => 'Enviar relatório';

  @override
  String get tmdbScore => 'Pontuação TMDB';

  @override
  String get releaseDateLabel => 'Data de lançamento';

  @override
  String get firstAirDateLabel => 'Primeira data de transmissão';

  @override
  String get revenueLabel => 'Receita';

  @override
  String get runtimeLabel => 'Duração';

  @override
  String get budgetLabel => 'Orçamento';

  @override
  String get originalLanguageLabel => 'Idioma original';

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
  String get content => 'Conteúdo';

  @override
  String get copy => 'Cópia';

  @override
  String get create => 'Criar';

  @override
  String get disable => 'Desativar';

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
  String get next => 'Seguinte';

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
  String get remote => 'Controlo remoto';

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
  String get status => 'Estado';

  @override
  String get stop => 'Parar';

  @override
  String get streaming => 'Transmissão';

  @override
  String get time => 'Tempo';

  @override
  String get trickplay => 'Trickplay';

  @override
  String get uninstall => 'Desinstalar';

  @override
  String get up => 'Acima';

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
  String get adminDrawerAnalytics => 'Análise';

  @override
  String get adminDrawerSettings => 'Definições';

  @override
  String get adminDrawerBranding => 'Marca';

  @override
  String get adminDrawerUsers => 'Utilizadores';

  @override
  String get adminDrawerLibraries => 'Bibliotecas';

  @override
  String get adminDrawerDisplay => 'Visualização';

  @override
  String get adminDrawerMetadata => 'Metadados';

  @override
  String get adminDrawerNfo => 'Definições NFO';

  @override
  String get adminDrawerTranscoding => 'Transcodificação';

  @override
  String get adminDrawerResume => 'Retomar';

  @override
  String get adminDrawerStreaming => 'Transmissão';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminDrawerLogs => 'Registos';

  @override
  String get adminDrawerScheduledTasks => 'Tarefas agendadas';

  @override
  String get adminDrawerPlugins => 'Plugins';

  @override
  String get adminDrawerRepositories => 'Repositórios';

  @override
  String get adminDrawerLiveTv => 'TV ao vivo';

  @override
  String get adminExitTooltip => 'Sair do administrador';

  @override
  String get adminDashboardLoadFailed => 'Falha ao carregar o painel';

  @override
  String get adminMediaOverview => 'Vista geral do conteúdo';

  @override
  String get adminMediaTotalsError =>
      'Não foi possível carregar os totais de conteúdo do servidor.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Uma visão rápida sobre a quantidade de conteúdo neste servidor.';

  @override
  String adminPluginUpdatesAvailable(int count) {
    return 'Atualizações de plugin disponíveis: $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins que requerem reinício: $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tarefas agendadas com falha: $count';
  }

  @override
  String adminRecentAlertEntries(int count) {
    return 'Registos recentes de aviso/erro: $count';
  }

  @override
  String get analyticsMediaDistribution => 'Distribuição de conteúdo';

  @override
  String get analyticsVideoCodecs => 'Codecs de vídeo';

  @override
  String get analyticsAudioCodecs => 'Codecs de áudio';

  @override
  String get analyticsContainers => 'Recipientes';

  @override
  String get analyticsTopGenres => 'Principais géneros';

  @override
  String get analyticsReleaseYears => 'Anos de lançamento';

  @override
  String get analyticsContentRatings => 'Avaliações de conteúdo';

  @override
  String get analyticsRuntimeBuckets => 'Intervalos de duração';

  @override
  String get analyticsFileFormats => 'Formatos de ficheiro';

  @override
  String get analyticsNoData => 'Nenhum dado disponível.';

  @override
  String get adminServerInfo => 'Informação do servidor';

  @override
  String get adminRestartPending => 'Reinício pendente';

  @override
  String get adminServerPaths => 'Caminhos de servidor';

  @override
  String get adminServerActions => 'Ações do servidor';

  @override
  String get adminRestartServer => 'Reinicia o servidor';

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
  String get adminServerRebootInProgress => 'Reinício do servidor em curso';

  @override
  String get adminServerRebootMessage =>
      'Reinício do servidor em curso, reinicia o Moonfin';

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
  String get sessionNext => 'Seguinte';

  @override
  String get sessionVolumeDown => 'Volume –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'A reproduzir';

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
  String get adminActivitySeverityAll => 'Todas as severidades';

  @override
  String get adminActivityDateRange => 'Intervalo de datas';

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
  String get adminDeleteDevice => 'Eliminar dispositivo';

  @override
  String get adminDeviceDeleted => 'Dispositivo eliminado';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Falha ao eliminar dispositivo: $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Remover o dispositivo \'$name\'? O utilizador terá de iniciar sessão novamente neste dispositivo.';
  }

  @override
  String get adminDeleteAllDevices => 'Eliminar todos os dispositivos';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Remover $count dispositivos? Os utilizadores afetados terão de iniciar sessão novamente. O teu dispositivo atual não é afetado.';
  }

  @override
  String get adminDevicesDeletedAll => 'Dispositivos removidos';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Alguns dispositivos foram removidos; não foi possível remover $count.';
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
  String get adminScanAllLibraries => 'Digitalizar todas as bibliotecas';

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
  String get adminDeleteLibrary => 'Eliminar biblioteca';

  @override
  String adminLibraryDeleted(String name) {
    return 'Biblioteca \"$name\" eliminada';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Falha ao eliminar biblioteca: $error';
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
  String get adminLibraryOptionsSaved => 'Opções de biblioteca guardadas';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Falha ao guardar opções: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Falha ao carregar a biblioteca';

  @override
  String get adminNoMediaPaths => 'Nenhum caminho de conteúdo configurado';

  @override
  String get adminAddPath => 'Adicionar caminho';

  @override
  String get adminBrowseFilesystem =>
      'Navega pelo sistema de ficheiros do servidor:';

  @override
  String get adminSaveOptions => 'Guardar opções';

  @override
  String get adminPreferredMetadataLanguage => 'Idioma de metadados preferido';

  @override
  String get adminMetadataLanguageHint => 'por exemplo en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Código do país dos metadados';

  @override
  String get adminMetadataCountryHint => 'por exemplo EUA, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Caminhos';

  @override
  String get adminLibraryTabOptions => 'Opções';

  @override
  String get adminLibraryTabDownloaders => 'Downloaders';

  @override
  String get adminLibMetadataSavers => 'Gravadores de metadados';

  @override
  String get adminLibSubtitleDownloaders => 'Downloaders de legendas';

  @override
  String get adminLibLyricDownloaders => 'Downloaders de letras';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Downloaders de metadados: $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Fontes de imagens: $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Este servidor não expõe downloaders para este tipo de biblioteca.';

  @override
  String get adminLibrarySectionGeneral => 'Geral';

  @override
  String get adminLibrarySectionMetadata => 'Metadados';

  @override
  String get adminLibrarySectionEmbedded => 'Informações incorporadas';

  @override
  String get adminLibrarySectionSubtitles => 'Legendas';

  @override
  String get adminLibrarySectionImages => 'Imagens';

  @override
  String get adminLibrarySectionSeries => 'Séries';

  @override
  String get adminLibrarySectionMusic => 'Música';

  @override
  String get adminLibrarySectionMovies => 'Filmes';

  @override
  String get adminLibRealtimeMonitor => 'Ativar monitorização em tempo real';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Detetar alterações nos ficheiros e processá-las automaticamente.';

  @override
  String get adminLibArchiveMediaFiles =>
      'Tratar arquivos comprimidos como ficheiros multimédia';

  @override
  String get adminLibEnablePhotos => 'Mostrar fotografias';

  @override
  String get adminLibSaveLocalMetadata =>
      'Guardar imagens nas pastas de conteúdo';

  @override
  String get adminLibRefreshInterval => 'Atualização automática de metadados';

  @override
  String get adminLibRefreshNever => 'Nunca';

  @override
  String get adminLibDefault => 'Predefinição';

  @override
  String get adminLibDisplayTitle => 'Visualização';

  @override
  String get adminLibDisplaySection => 'Visualização da biblioteca';

  @override
  String get adminLibFolderView =>
      'Mostrar uma vista de pastas para apresentar pastas de conteúdo simples';

  @override
  String get adminLibSpecialsInSeasons =>
      'Mostrar especiais dentro das temporadas em que foram exibidos';

  @override
  String get adminLibGroupMovies => 'Agrupar filmes em coleções';

  @override
  String get adminLibGroupShows => 'Agrupar séries em coleções';

  @override
  String get adminLibExternalSuggestions =>
      'Mostrar conteúdo externo nas sugestões';

  @override
  String get adminLibDateAddedSection => 'Comportamento da data de adição';

  @override
  String get adminLibDateAddedLabel => 'Usar data de adição de';

  @override
  String get adminLibDateAddedImport => 'Data da digitalização na biblioteca';

  @override
  String get adminLibDateAddedFile => 'Data de criação do ficheiro';

  @override
  String get adminLibMetadataTitle => 'Metadados e imagens';

  @override
  String get adminLibMetadataLangSection => 'Idioma preferido dos metadados';

  @override
  String get adminLibChaptersSection => 'Capítulos';

  @override
  String get adminLibDummyChapterDuration =>
      'Duração dos capítulos fictícios (segundos)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Duração dos capítulos gerados para conteúdos que não os têm. Define como 0 para desativar.';

  @override
  String get adminLibChapterImageResolution =>
      'Resolução das imagens de capítulo';

  @override
  String get adminLibNfoTitle => 'Definições NFO';

  @override
  String get adminLibNfoHelp =>
      'Os metadados NFO são compatíveis com o Kodi e clientes semelhantes. As definições aplicam-se a todas as bibliotecas que guardam metadados NFO.';

  @override
  String get adminLibKodiUser =>
      'Utilizador cujos dados de visualização serão guardados nos ficheiros NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Guardar os caminhos das imagens nos ficheiros NFO';

  @override
  String get adminLibPathSubstitution =>
      'Ativar substituição de caminhos para os caminhos de imagem NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copiar imagens extrafanart para uma pasta extrathumbs';

  @override
  String get adminLibNone => 'Nenhum';

  @override
  String adminLibRefreshDays(int days) {
    return '$days dias';
  }

  @override
  String get adminLibEmbeddedTitles => 'Usar títulos incorporados';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Usar títulos incorporados para extras';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Usar informações de episódio incorporadas';

  @override
  String get adminLibAllowEmbeddedSubtitles => 'Permitir legendas incorporadas';

  @override
  String get adminLibEmbeddedAllowAll => 'Permitir todas';

  @override
  String get adminLibEmbeddedAllowText => 'Apenas texto';

  @override
  String get adminLibEmbeddedAllowImage => 'Apenas imagem';

  @override
  String get adminLibEmbeddedAllowNone => 'Nenhum';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Ignorar transferência se houver legendas incorporadas';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ignorar transferência se a faixa de áudio corresponder ao idioma da transferência';

  @override
  String get adminLibRequirePerfectMatch =>
      'Exigir correspondência exata de legendas';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Guardar legendas nas pastas de conteúdo';

  @override
  String get adminLibChapterImageExtraction => 'Extrair imagens de capítulo';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extrair imagens de capítulo durante a digitalização da biblioteca';

  @override
  String get adminLibTrickplayExtraction =>
      'Ativar extração de imagens trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extrair imagens trickplay durante a digitalização da biblioteca';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Guardar imagens trickplay nas pastas de conteúdo';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Unir automaticamente séries distribuídas por várias pastas';

  @override
  String get adminLibSeasonZeroName => 'Nome de apresentação da temporada zero';

  @override
  String get adminLibLufsScan =>
      'Ativar análise LUFS para normalização de áudio';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Preferir a etiqueta de artistas não padrão';

  @override
  String get adminLibAutoAddToCollection =>
      'Adicionar filmes automaticamente às coleções';

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
  String get adminDisableUser => 'Desativar utilizador';

  @override
  String get adminEnableUser => 'Ativar utilizador';

  @override
  String adminDisableUserConfirm(String name) {
    return 'Desativar $name? Não poderá iniciar sessão.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Ativar $name? Poderá iniciar sessão novamente.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Utilizador \"$name\" desativado';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Utilizador \"$name\" ativado';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Falha ao atualizar a política do utilizador: $error';
  }

  @override
  String get adminUsersLoadFailed => 'Falha ao carregar utilizadores';

  @override
  String get adminSearchUsers => 'Pesquisar utilizadores';

  @override
  String get adminEditUser => 'Editar utilizador';

  @override
  String get adminAddUser => 'Adicionar utilizador';

  @override
  String adminUserCreateFailed(String error) {
    return 'Falha ao criar utilizador: $error';
  }

  @override
  String get adminCreateUser => 'Criar utilizador';

  @override
  String get adminPasswordOptional => 'Palavra-passe (opcional)';

  @override
  String get adminUsernameRequired =>
      'O nome de utilizador não pode ficar vazio';

  @override
  String get adminNoProfileChanges =>
      'Nenhuma alteração de perfil para guardar';

  @override
  String get adminProfileSaved => 'Perfil guardado';

  @override
  String adminSaveFailed(String error) {
    return 'Falha ao guardar: $error';
  }

  @override
  String get adminPermissionsSaved => 'Permissões guardadas';

  @override
  String get adminPasswordsMismatch => 'As palavras-passe não coincidem';

  @override
  String adminFailed(String error) {
    return 'Falha: $error';
  }

  @override
  String get adminUserLoadFailed => 'Falha ao carregar utilizador';

  @override
  String get adminBackToUsers => 'Voltar a Utilizadores';

  @override
  String get adminSaveProfile => 'Guardar perfil';

  @override
  String get adminDeleteUser => 'Eliminar utilizador';

  @override
  String get admin => 'Administrador';

  @override
  String get adminFullAccessWarning =>
      'Os administradores têm acesso completo ao servidor. Conceda com cautela.';

  @override
  String get administrator => 'Administrador';

  @override
  String get adminHiddenUser => 'Utilizador oculto';

  @override
  String get adminAllowMediaPlayback => 'Permitir reprodução de conteúdo';

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
  String get adminAllowContentDeletion => 'Permitir eliminação de conteúdo';

  @override
  String get adminAllowContentDownloading =>
      'Permitir transferência de conteúdo';

  @override
  String get adminAllowPublicSharing => 'Permitir partilha pública';

  @override
  String get adminAllowRemoteControl =>
      'Permitir controlo remoto de outros utilizadores';

  @override
  String get adminAllowSharedDeviceControl =>
      'Permitir controlo de dispositivo partilhado';

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
  String get adminAllowLiveTvManagement => 'Permitir gestão de TV ao vivo';

  @override
  String get adminAllowCollectionManagement => 'Permitir gestão de coleção';

  @override
  String get adminAllowSubtitleManagement => 'Permitir gestão de legendas';

  @override
  String get adminAllowLyricManagement => 'Permitir gestão de letras';

  @override
  String get adminSavePermissions => 'Guardar permissões';

  @override
  String get adminEnableAllLibraryAccess =>
      'Ativa o acesso a todas as bibliotecas';

  @override
  String get adminSaveAccess => 'Guardar acesso';

  @override
  String get adminChangePassword => 'Alterar a palavra-passe';

  @override
  String get adminNewPassword => 'Nova palavra-passe';

  @override
  String get adminConfirmPassword => 'Confirma a tua palavra-passe';

  @override
  String get adminSetPassword => 'Definir palavra-passe';

  @override
  String get adminResetPassword => 'Repor palavra-passe';

  @override
  String get adminPasswordReset => 'Repor palavra-passe';

  @override
  String get adminPasswordUpdated => 'Palavra-passe atualizada';

  @override
  String get adminUserSettings => 'Definições do utilizador';

  @override
  String get adminLibraryAccess => 'Acesso à biblioteca';

  @override
  String get adminDeviceAndChannelAccess => 'Acesso a dispositivos e canais';

  @override
  String get adminEnableAllDevices => 'Ativa o acesso a todos os dispositivos';

  @override
  String get adminEnableAllChannels => 'Ativa o acesso a todos os canais';

  @override
  String get adminParentalControl => 'Controlo parental';

  @override
  String get adminMaxParentalRating => 'Classificação etária máxima permitida';

  @override
  String get adminMaxParentalRatingHint =>
      'O conteúdo com classificação superior será ocultado deste utilizador.';

  @override
  String get adminParentalRatingNone => 'Nenhuma';

  @override
  String get adminBlockUnratedItems =>
      'Bloquear itens sem classificação ou com classificação não reconhecida';

  @override
  String get adminUnratedBook => 'Livros';

  @override
  String get adminUnratedChannelContent => 'Canais';

  @override
  String get adminUnratedLiveTvChannel => 'TV ao vivo';

  @override
  String get adminUnratedMovie => 'Filmes';

  @override
  String get adminUnratedMusic => 'Música';

  @override
  String get adminUnratedTrailer => 'Trailers';

  @override
  String get adminUnratedSeries => 'Séries';

  @override
  String get adminAccessSchedules => 'Horários de acesso';

  @override
  String get adminAccessSchedulesHint =>
      'Permitir o acesso apenas durante os horários agendados abaixo. O acesso é permitido todo o dia quando não está definido nenhum horário.';

  @override
  String get adminAddSchedule => 'Adicionar horário';

  @override
  String get adminScheduleDay => 'Dia';

  @override
  String get adminScheduleStart => 'Início';

  @override
  String get adminScheduleEnd => 'Fim';

  @override
  String get adminDayEveryday => 'Todos os dias';

  @override
  String get adminDayWeekday => 'Dia útil';

  @override
  String get adminDayWeekend => 'Fim de semana';

  @override
  String get adminDaySunday => 'Domingo';

  @override
  String get adminDayMonday => 'Segunda-feira';

  @override
  String get adminDayTuesday => 'Terça-feira';

  @override
  String get adminDayWednesday => 'Quarta-feira';

  @override
  String get adminDayThursday => 'Quinta-feira';

  @override
  String get adminDayFriday => 'Sexta-feira';

  @override
  String get adminDaySaturday => 'Sábado';

  @override
  String get adminAllowedTags => 'Etiquetas permitidas';

  @override
  String get adminAllowedTagsHint =>
      'Apenas o conteúdo com estas etiquetas é mostrado. Deixa vazio para permitir tudo.';

  @override
  String get adminBlockedTags => 'Etiquetas bloqueadas';

  @override
  String get adminBlockedTagsHint =>
      'O conteúdo com estas etiquetas fica oculto para este utilizador.';

  @override
  String get adminAddTag => 'Adicionar etiqueta';

  @override
  String get adminEnabledDevices => 'Dispositivos ativados';

  @override
  String get adminEnabledChannels => 'Canais ativados';

  @override
  String get adminAuthProvider => 'Provedor de autenticação';

  @override
  String get adminPasswordResetProvider =>
      'Provedor de reposição da palavra-passe';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Número máximo de tentativas de início de sessão falhadas antes do bloqueio';

  @override
  String get adminLoginAttemptsHint =>
      'Define como 0 para a predefinição ou -1 para desativar o bloqueio.';

  @override
  String get adminSyncPlayAccess => 'Acesso ao SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Permitir criar e juntar-se a grupos';

  @override
  String get adminSyncPlayJoin => 'Permitir juntar-se a grupos';

  @override
  String get adminSyncPlayNone => 'Sem acesso';

  @override
  String get adminContentDeletionFolders =>
      'Permitir a eliminação de conteúdo de';

  @override
  String get adminResetPasswordWarning =>
      'Isto removerá a palavra-passe. O utilizador poderá iniciar sessão sem palavra-passe.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Servidor retornou HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Tens a certeza de que queres eliminar $name?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Utilizador \"$name\" eliminado';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Falha ao eliminar utilizador: $error';
  }

  @override
  String get adminCreateApiKey => 'Criar chave de API';

  @override
  String get adminAppName => 'Nome da aplicação';

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
  String get adminUnknownApp => 'Aplicação desconhecida';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCriado: $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Criar cópia de segurança';

  @override
  String get adminBackupInclude =>
      'Escolhe o que incluir na cópia de segurança.';

  @override
  String get adminBackupDatabase => 'Base de dados';

  @override
  String get adminBackupDatabaseAlways => 'Sempre incluída';

  @override
  String get adminBackupMetadata => 'Metadados';

  @override
  String get adminBackupSubtitles => 'Legendas';

  @override
  String get adminBackupTrickplay => 'Imagens trickplay';

  @override
  String get adminCreatingBackup => 'A criar cópia de segurança...';

  @override
  String get adminBackupCreated => 'Cópia de segurança criada com sucesso';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Falha ao criar cópia de segurança: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Caminho da cópia de segurança ausente na resposta do servidor';

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
  String get adminRestoringBackup => 'A restaurar cópia de segurança...';

  @override
  String adminRestoreFailed(String error) {
    return 'Falha ao restaurar a cópia de segurança: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Falha ao carregar cópias de segurança';

  @override
  String get adminCreateBackup => 'Criar cópia de segurança';

  @override
  String get adminNoBackups => 'Nenhuma cópia de segurança encontrada';

  @override
  String get adminViewDetails => 'Ver detalhes';

  @override
  String get restore => 'Restaurar';

  @override
  String get adminLogsLoadFailed => 'Falha ao carregar registos do servidor';

  @override
  String get adminNoLogFiles => 'Nenhum ficheiro de registo encontrado';

  @override
  String get adminLogCopied => 'Log copiado para a área de transferência';

  @override
  String get adminSaveLogFile => 'Guardar ficheiro de registo';

  @override
  String adminSavedTo(String path) {
    return 'Guardado em $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Falha ao guardar ficheiro: $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Falha ao carregar $fileName';
  }

  @override
  String get adminSearchInLog => 'Pesquisar no registo';

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
  String get adminRunNow => 'Executar agora';

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
  String get adminSearchPlugins => 'Pesquisar plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Falha ao alternar o plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Desinstalar plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Tens a certeza de que queres desinstalar \"$name\"?';
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
    return 'Falha ao carregar plugins: $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Nenhum plugin corresponde à tua pesquisa';

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
      'Nenhum pacote corresponde à tua pesquisa';

  @override
  String get adminNoPackagesAvailable => 'Nenhum pacote disponível';

  @override
  String get adminExperimentalIntegration => 'Integração Experimental';

  @override
  String get adminExperimentalWarning =>
      'A integração das definições do plugin ainda é experimental. Algumas páginas de definições podem não ser renderizadas corretamente.';

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
    return 'A atualizar \"$name\" para v$version...';
  }

  @override
  String get adminMissingAuthToken =>
      'Não é possível abrir as definições: token de autenticação ausente.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Falha ao carregar o plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin não encontrado';

  @override
  String adminPluginVersion(String version) {
    return 'Versão $version';
  }

  @override
  String get adminEnablePlugin => 'Ativar plugin';

  @override
  String get adminPluginSettingsPage => 'Página de definições do plugin';

  @override
  String get adminRevisionHistory => 'Histórico de revisões';

  @override
  String get adminNoChangelog => 'Nenhum registro de alterações disponível.';

  @override
  String get adminRemoveRepository => 'Remover repositório';

  @override
  String adminRemoveRepositoryConfirm(String name) {
    return 'Tens a certeza de que queres remover \"$name\"?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Falha ao guardar repositórios: $error';
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
    return 'Não foi possível carregar as definições do plugin: $error';
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
  String get adminGeneralSettings => 'Definições Gerais';

  @override
  String get adminServerName => 'Nome do servidor';

  @override
  String get adminPreferredMetadataCountry => 'País de metadados preferido';

  @override
  String get adminCachePath => 'Caminho da cache';

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
  String get adminBrandingSaved => 'Definições de marca guardadas';

  @override
  String get adminBrandingLoadFailed =>
      'Falha ao carregar as definições de marca';

  @override
  String get adminLoginDisclaimer => 'Aviso legal de início de sessão';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML apresentado abaixo do formulário de início de sessão';

  @override
  String get adminCustomCss => 'CSS personalizado';

  @override
  String get adminCustomCssHint => 'CSS personalizado aplicado à interface web';

  @override
  String get adminEnableSplashScreen => 'Ativar ecrã inicial';

  @override
  String get adminStreamingSaved => 'Definições de streaming guardadas';

  @override
  String get adminStreamingLoadFailed =>
      'Falha ao carregar as definições de streaming';

  @override
  String get adminStreamingDescription =>
      'Definir limites globais de taxa de bits de streaming para ligações remotas.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminLeaveEmptyForUnlimited =>
      'Deixe em branco ou 0 para ilimitado';

  @override
  String get adminPlaybackSaved => 'Definições de reprodução guardadas';

  @override
  String get adminPlaybackLoadFailed =>
      'Falha ao carregar as definições de reprodução';

  @override
  String get adminPlaybackTranscoding => 'Reprodução/Transcodificação';

  @override
  String get adminHardwareAcceleration => 'Aceleração de hardware';

  @override
  String get adminVaapiDevice => 'Dispositivo VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Ativar codificação de hardware';

  @override
  String get adminEnableHardwareDecoding =>
      'Ativa a descodificação de hardware para:';

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
  String get adminAllowSegmentDeletion => 'Permitir eliminação de segmento';

  @override
  String get adminSegmentKeepSeconds => 'Manter segmento (segundos)';

  @override
  String get adminThrottleBuffering => 'Buffer de aceleração';

  @override
  String get adminTrickplaySaved => 'Definições do Trickplay guardadas';

  @override
  String get adminTrickplayLoadFailed =>
      'Falha ao carregar as definições do trickplay';

  @override
  String get adminEnableHardwareAcceleration => 'Ativar aceleração de hardware';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Ativar extração apenas de quadro-chave';

  @override
  String get adminKeyFrameSubtitle => 'Mais rápido, mas com menor precisão';

  @override
  String get adminScanBehavior => 'Comportamento de verificação';

  @override
  String get adminProcessPriority => 'Prioridade do processo';

  @override
  String get adminImageSettings => 'Definições de imagem';

  @override
  String get adminIntervalMs => 'Intervalo (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Com que frequência capturar quadros';

  @override
  String get adminWidthResolutions => 'Resoluções de largura';

  @override
  String get adminTileWidth => 'Largura do mosaico';

  @override
  String get adminTileHeight => 'Altura do mosaico';

  @override
  String get adminQualitySubtitle =>
      'Valores mais baixos = melhor qualidade, ficheiros maiores';

  @override
  String get adminProcessThreads => 'Threads de processo';

  @override
  String get adminResumeSaved => 'Definições de retoma guardadas';

  @override
  String get adminResumeLoadFailed =>
      'Falha ao carregar as definições de retoma';

  @override
  String get adminResumeDescription =>
      'Configura quando o conteúdo deve ser marcado como reproduzido parcialmente ou totalmente.';

  @override
  String get adminMinResumePercentage => 'Percentagem mínima de retomar';

  @override
  String get adminMinResumeSubtitle =>
      'O conteúdo deve ser reproduzido além dessa percentagem para guardar o progresso';

  @override
  String get adminMaxResumePercentage => 'Percentagem máxima de retomar';

  @override
  String get adminMaxResumeSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta percentagem';

  @override
  String get adminMinResumeDuration => 'Duração mínima do retomar (segundos)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Itens menores que isso não são recuperáveis';

  @override
  String get adminMinAudiobookResume =>
      'Percentagem mínima de retomar de audiolivro';

  @override
  String get adminMaxAudiobookResume =>
      'Percentagem máxima de retomar de audiolivro';

  @override
  String get adminNetworkingSaved =>
      'Definições de rede guardadas. Pode ser necessário reiniciar o servidor.';

  @override
  String get adminNetworkingLoadFailed =>
      'Falha ao carregar as definições de rede';

  @override
  String get adminNetworkingWarning =>
      'As alterações nas definições de rede podem exigir o reinício do servidor.';

  @override
  String get adminEnableRemoteAccess => 'Ativar acesso remoto';

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
  String get adminBaseUrlHint => 'por exemplo /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Ativar HTTPS';

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
  String get adminMetadataSaved => 'Metadados guardados';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Falha ao carregar metadados: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Falha ao guardar metadados: $error';
  }

  @override
  String get adminRefreshMetadata => 'Atualizar metadados';

  @override
  String get recursive => 'Recursivo';

  @override
  String get adminReplaceAllMetadata => 'Substitui todos os metadados';

  @override
  String get adminReplaceAllImages => 'Substitui todas as imagens';

  @override
  String get adminMetadataRefreshRequested =>
      'Atualização de metadados solicitada';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Falha ao atualizar metadados: $error';
  }

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
    return 'Falha ao transferir imagem: $error';
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
    return 'Falha ao enviar a imagem: $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Eliminar imagem $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType imagem eliminada';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Falha ao eliminar imagem: $error';
  }

  @override
  String get adminAllProviders => 'Todos os fornecedores';

  @override
  String get adminNoRemoteImages => 'Nenhuma imagem remota encontrada';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Falha na descoberta do sintonizador: $error';
  }

  @override
  String get adminAddTuner => 'Adicionar sintonizador';

  @override
  String get adminEditTuner => 'Editar sintonizador';

  @override
  String get adminTunerTypeM3u => 'Sintonizador M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Ficheiro ou URL';

  @override
  String get adminTunerIpAddress => 'Endereço IP do sintonizador';

  @override
  String get adminTunerFriendlyName => 'Nome amigável';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limite de ligações simultâneas';

  @override
  String get adminTunerCountHelp =>
      'O número máximo de streams que o sintonizador permite em simultâneo. Define como 0 para ilimitado.';

  @override
  String get adminTunerFallbackBitrate =>
      'Taxa de bits máxima de streaming alternativa';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Importar apenas os canais favoritos';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Permitir transcodificação por hardware';

  @override
  String get adminTunerAllowFmp4 =>
      'Permitir contentor de transcodificação fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Permitir partilha de stream';

  @override
  String get adminTunerEnableStreamLooping => 'Ativar repetição do stream';

  @override
  String get adminTunerIgnoreDts => 'Ignorar DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Ler a entrada na taxa de fotogramas nativa';

  @override
  String get adminEditProvider => 'Editar fornecedor';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Ficheiro ou URL';

  @override
  String get adminXmltvMoviePrefix => 'Prefixo de filme';

  @override
  String get adminXmltvMovieCategories => 'Categorias de filmes';

  @override
  String get adminXmltvCategoriesHelp =>
      'Separa várias categorias com uma barra vertical.';

  @override
  String get adminXmltvKidsCategories => 'Categorias infantis';

  @override
  String get adminXmltvNewsCategories => 'Categorias de notícias';

  @override
  String get adminXmltvSportsCategories => 'Categorias de desporto';

  @override
  String get adminSdUsername => 'Nome de utilizador';

  @override
  String get adminSdPassword => 'Palavra-passe';

  @override
  String get adminSdCountry => 'País';

  @override
  String get adminSdCountrySelect => 'Seleciona um país';

  @override
  String get adminSdPostalCode => 'Código postal';

  @override
  String get adminSdGetListings => 'Obter listagens';

  @override
  String get adminSdListings => 'Listagens';

  @override
  String get adminEnableAllTuners => 'Ativar todos os sintonizadores';

  @override
  String get adminTunerType => 'Tipo de sintonizador';

  @override
  String get adminTunerAdded => 'Sintonizador adicionado';

  @override
  String adminTunerAddFailed(String error) {
    return 'Falha ao adicionar sintonizador: $error';
  }

  @override
  String get adminAddGuideProvider => 'Adicionar fornecedor de guia';

  @override
  String get adminProviderType => 'Tipo de fornecedor';

  @override
  String get adminProviderAdded => 'Fornecedor adicionado';

  @override
  String adminProviderAddFailed(String error) {
    return 'Falha ao adicionar fornecedor: $error';
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
  String get adminTunerResetNotSupported =>
      'Este tipo de sintonizador não suporta a reposição.';

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Falha ao remover provedor: $error';
  }

  @override
  String get adminRecordingSettings => 'Definições de gravação';

  @override
  String get adminPrePadding => 'Pré-preenchimento (minutos)';

  @override
  String get adminPostPadding => 'Pós-preenchimento (minutos)';

  @override
  String get adminRecordingPath => 'Caminho de gravação';

  @override
  String get adminSeriesRecordingPath => 'Caminho de gravação da série';

  @override
  String get adminMovieRecordingPath => 'Caminho de gravação de filmes';

  @override
  String get adminGuideDays => 'Dias de dados do guia';

  @override
  String get adminGuideDaysAuto => 'Automático';

  @override
  String adminGuideDaysValue(int days) {
    return '$days dias';
  }

  @override
  String get adminRecordingPostProcessor =>
      'Caminho da aplicação de pós-processamento';

  @override
  String get adminRecordingPostProcessorArgs => 'Argumentos do pós-processador';

  @override
  String get adminSaveRecordingNfo => 'Guardar metadados NFO das gravações';

  @override
  String get adminSaveRecordingImages => 'Guardar imagens das gravações';

  @override
  String get adminLiveTvSectionTiming => 'Temporização';

  @override
  String get adminLiveTvSectionPaths => 'Caminhos de gravação';

  @override
  String get adminLiveTvSectionPostProcessing => 'Pós-processamento';

  @override
  String adminGuideDaysDisplay(String value) {
    return 'Dados do guia: $value';
  }

  @override
  String get adminRecordingSettingsSaved => 'Definições de gravação guardadas';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Falha ao guardar definições: $error';
  }

  @override
  String get adminSetChannelMappings => 'Definir mapeamentos de canais';

  @override
  String get adminMappingJson => 'Mapeamento JSON';

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
  String get adminRefreshGuideData => 'Atualizar dados do guia';

  @override
  String get adminGuideRefreshStarted =>
      'Atualização dos dados do guia iniciada';

  @override
  String get adminGuideRefreshUnavailable =>
      'A tarefa de atualização do guia não está disponível neste servidor.';

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
  String get adminSettingsSaved => 'Definições guardadas';

  @override
  String get adminBackupsNotAvailable =>
      'As cópias de segurança não estão disponíveis nesta versão do servidor.';

  @override
  String get adminRestoreWarning1 =>
      'A restauração substituirá TODOS os dados atuais do servidor pelos dados da cópia de segurança.';

  @override
  String get adminRestoreWarning2 =>
      'As definições atuais do servidor, utilizadores e dados da biblioteca serão substituídos.';

  @override
  String get adminRestoreWarning3 =>
      'O servidor será reiniciado após a restauração.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restaurar cópia de segurança $name agora?';
  }

  @override
  String get adminRestoreRequested =>
      'Restauração solicitada. A reinicialização do servidor pode desconectar esta sessão.';

  @override
  String get adminBackupsTitle => 'Cópias de segurança';

  @override
  String get adminUnknownDate => 'Data desconhecida';

  @override
  String get adminUnnamedBackup => 'Cópia de segurança sem nome';

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
  String get adminReset => 'Repor';

  @override
  String get adminLogsTitle => 'Registos do servidor';

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
  String get adminMetadataIdentify => 'Identificar';

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
  String get adminMetadataGenres => 'Géneros';

  @override
  String get adminMetadataTags => 'Etiquetas';

  @override
  String get adminMetadataStudios => 'Estúdios';

  @override
  String get adminMetadataPeople => 'Pessoas';

  @override
  String get adminMetadataAddGenre => 'Adicionar género';

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
  String get adminMetadataImageBanner => 'Banner';

  @override
  String get adminMetadataImageThumb => 'Miniatura';

  @override
  String get adminMetadataRecursive => 'Recursivo';

  @override
  String get adminMetadataProvider => 'Fornecedor';

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
    return '$imageType imagem eliminada';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Falha ao transferir imagem: $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Falha ao ler a imagem selecionada';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Falha ao enviar a imagem: $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Eliminar imagem $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Isto remove a imagem atual do item.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Falha ao eliminar imagem: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Escolher a imagem $imageType';
  }

  @override
  String get adminMetadataUpload => 'Enviar';

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
      'Nenhum plugin corresponde à tua pesquisa';

  @override
  String get adminPluginsNoneInstalled => 'Nenhum plugin instalado';

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
  String get adminPluginsEnable => 'Ativar';

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
      'Nenhum pacote corresponde à tua pesquisa';

  @override
  String get adminPluginsCatalogEmpty => 'Nenhum pacote disponível';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" está a ser instalado...';
  }

  @override
  String get adminPluginDetailExperimental => 'Integração Experimental';

  @override
  String get adminPluginDetailExperimentalContent =>
      'A integração das definições do plugin ainda é experimental. Alguns campos ou esquemas podem ainda não ser renderizados corretamente.';

  @override
  String get adminPluginDetailToggle404 =>
      'Falha ao alternar o plugin. O servidor não conseguiu encontrar esta versão do plugin. Tenta atualizar os plugins e tenta novamente.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Falha ao alternar o plugin. Verifica os registos do servidor para obter detalhes.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Definições';
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
  String get adminPluginDetailEnablePlugin => 'Ativar plugin';

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
    return 'Tens a certeza de que queres remover \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Remover';

  @override
  String adminReposSaveFailed(String error) {
    return 'Falha ao guardar repositórios: $error';
  }

  @override
  String get adminReposEmpty => 'Nenhum repositório configurado';

  @override
  String get adminReposEmptySubtitle =>
      'Adiciona um repositório para navegar pelos plugins disponíveis';

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
  String get adminGeneralSettingsTitle => 'Definições Gerais';

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
      'As alterações nas definições de rede podem exigir o reinício do servidor.';

  @override
  String get adminNetworkingRemoteAccess => 'Ativar acesso remoto';

  @override
  String get adminNetworkingPorts => 'Portas';

  @override
  String get adminNetworkingHttpPort => 'Porta HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Porta HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Ativar HTTPS';

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
  String get adminBrandingLoginDisclaimer => 'Aviso legal de início de sessão';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML apresentado abaixo do formulário de início de sessão';

  @override
  String get adminBrandingCustomCss => 'CSS personalizado';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personalizado aplicado à interface web';

  @override
  String get adminBrandingEnableSplash => 'Ativar ecrã inicial';

  @override
  String get adminBrandingSplashUpload => 'Enviar imagem';

  @override
  String get adminBrandingSplashUploaded => 'Ecrã de arranque atualizado';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Falha ao enviar o ecrã de arranque';

  @override
  String get adminBrandingSplashDeleted => 'Ecrã de arranque removido';

  @override
  String get adminBrandingNoSplash => 'Sem ecrã de arranque personalizado';

  @override
  String get adminPlaybackHwAccel => 'Aceleração de Hardware';

  @override
  String get adminPlaybackHwAccelLabel => 'Aceleração de hardware';

  @override
  String get adminPlaybackEnableHwEncoding => 'Ativar codificação de hardware';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Ativa a descodificação de hardware para:';

  @override
  String get adminPlaybackQsvDevice => 'Dispositivo QSV';

  @override
  String get adminPlaybackEnhancedNvdec =>
      'Ativar descodificador NVDEC melhorado';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Preferir o descodificador de hardware nativo do sistema';

  @override
  String get adminPlaybackColorDepth =>
      'Profundidade de cor da descodificação por hardware';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Descodificação HEVC de 10 bits';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Descodificação VP9 de 10 bits';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Descodificação HEVC RExt de 8/10 bits';

  @override
  String get adminPlaybackColorDepth12HevcRext =>
      'Descodificação HEVC RExt de 12 bits';

  @override
  String get adminPlaybackHwEncodingSection => 'Codificação por hardware';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Permitir codificação HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Permitir codificação AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Ativar codificador H.264 de baixo consumo da Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Ativar codificador HEVC de baixo consumo da Intel';

  @override
  String get adminPlaybackToneMapping => 'Mapeamento de tons';

  @override
  String get adminPlaybackEnableTonemapping => 'Ativar mapeamento de tons';

  @override
  String get adminPlaybackEnableVppTonemapping =>
      'Ativar mapeamento de tons VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Ativar mapeamento de tons do VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm =>
      'Algoritmo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingMode => 'Modo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingRange => 'Intervalo de mapeamento de tons';

  @override
  String get adminPlaybackTonemappingDesat =>
      'Dessaturação do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingPeak => 'Pico do mapeamento de tons';

  @override
  String get adminPlaybackTonemappingParam => 'Parâmetro do mapeamento de tons';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Brilho do mapeamento de tons VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Contraste do mapeamento de tons VPP';

  @override
  String get adminPlaybackPresetsQuality => 'Predefinições e qualidade';

  @override
  String get adminPlaybackEncoderPreset => 'Predefinição do codificador';

  @override
  String get adminPlaybackH264Crf => 'CRF de codificação H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF de codificação H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Método de desentrelaçamento';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Duplicar a taxa de fotogramas ao desentrelaçar';

  @override
  String get adminPlaybackAudioSection => 'Áudio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Ativar codificação de áudio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Reforço do downmix de áudio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algoritmo de downmix estéreo';

  @override
  String get adminPlaybackMaxMuxingQueue => 'Tamanho máximo da fila de muxing';

  @override
  String get adminPlaybackAutoOption => 'Auto';

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
      'Percentagem mínima de retomar de audiolivro';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Percentagem máxima de retomar de audiolivro';

  @override
  String get adminStreamingBitrateLimit =>
      'Limite de taxa de bits do cliente remoto (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Deixe em branco ou 0 para ilimitado';

  @override
  String get adminTrickplayHwAccel => 'Ativar aceleração de hardware';

  @override
  String get adminTrickplayHwEncoding => 'Ativar codificação de hardware';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Ativar extração apenas de quadro-chave';

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
  String get adminTrickplayPriorityIdle => 'Inativo';

  @override
  String get adminTrickplayImageSettings => 'Definições de imagem';

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
      'Valores mais baixos = melhor qualidade, ficheiros maiores';

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
  String get adminTaskCancelling => 'A cancelar...';

  @override
  String get adminTaskRunning => 'A executar...';

  @override
  String get adminTaskNeverRun => 'Nunca executada';

  @override
  String get adminTaskStop => 'Parar';

  @override
  String get adminRunningTasks => 'Tarefas em execução';

  @override
  String get adminTaskRun => 'Executar';

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
  String get adminTaskTriggerStartup => 'Na inicialização da aplicação';

  @override
  String get adminTaskTriggerTypeDaily => 'Diário';

  @override
  String get adminTaskTriggerTypeWeekly => 'Semanalmente';

  @override
  String get adminTaskTriggerTypeInterval => 'Em intervalos';

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
      other: '$count horas',
      one: '1 hora',
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
  String get adminActivityOlder => 'Mais antigo';

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
    return '$day/$month';
  }

  @override
  String get adminTrickplayDescription =>
      'Configura a geração de imagens trickplay para miniaturas de visualização de procura.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Porta HTTPS pública';

  @override
  String get adminNetworkingBaseUrl => 'URL base';

  @override
  String get adminNetworkingBaseUrlHint => 'por exemplo /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingPublicHttpPort => 'Porta HTTP pública';

  @override
  String get adminNetworkingRequireHttps => 'Exigir HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Redirecionar todos os pedidos remotos para HTTPS. Não tem efeito se o servidor não tiver um certificado válido.';

  @override
  String get adminNetworkingCertPassword => 'Palavra-passe do certificado';

  @override
  String get adminNetworkingIpSettings => 'Definições de IP';

  @override
  String get adminNetworkingEnableIpv4 => 'Ativar IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Ativar IPv6';

  @override
  String get adminNetworkingAutoDiscovery =>
      'Ativar mapeamento automático de portas';

  @override
  String get adminNetworkingLocalSubnets => 'Redes LAN';

  @override
  String get adminNetworkingLocalSubnetsHint =>
      'Lista de endereços IP ou sub-redes CIDR, separados por vírgula ou por linha, tratados como pertencentes à rede local.';

  @override
  String get adminNetworkingPublishedUris => 'URIs publicados do servidor';

  @override
  String get adminNetworkingPublishedUriHint =>
      'Mapeia uma sub-rede ou endereço para um URL publicado, por exemplo, all=https://example.com';

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
  String get adminPlaybackSegmentDeletion => 'Permitir eliminação de segmento';

  @override
  String get adminPlaybackSegmentKeep => 'Manter segmento (segundos)';

  @override
  String get adminPlaybackThrottleBuffering => 'Buffer de aceleração';

  @override
  String get adminPlaybackThrottleDelay => 'Atraso de limitação (segundos)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Permitir extração de legendas em tempo real';

  @override
  String get adminResumeMinPct => 'Percentagem mínima para resumo';

  @override
  String get adminResumeMinPctSubtitle =>
      'É necessário reproduzir o conteúdo para além desta percentagem para guardar o progresso';

  @override
  String get adminResumeMaxPct => 'Percentagem máxima do resumo';

  @override
  String get adminResumeMaxPctSubtitle =>
      'O conteúdo é considerado totalmente reproduzido após esta percentagem';

  @override
  String get adminResumeMinDuration =>
      'Duração mínima da reativação (segundos)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Os itens mais curtos do que este não podem ser retomados';

  @override
  String get adminTrickplayScanBehavior => 'Comportamento de verificação';

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
  String get adminGeneralEnableSlowResponse =>
      'Ativar avisos de resposta lenta';

  @override
  String get adminGeneralQuickConnect => 'Ativar o Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Servidor';

  @override
  String get adminGeneralSectionMetadata => 'Metadados';

  @override
  String get adminGeneralSectionPaths => 'Caminhos';

  @override
  String get adminGeneralSectionPerformance => 'Desempenho';

  @override
  String get adminGeneralCachePath => 'Caminho do cache';

  @override
  String get adminGeneralMetadataPath => 'Caminho de metadados';

  @override
  String get adminGeneralServerName => 'Nome do servidor';

  @override
  String get adminGeneralDisplayLanguage => 'Idioma de apresentação preferido';

  @override
  String get adminSettingsLoadFailed => 'Falha ao carregar as definições';

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
      'Ativa o SyncPlay em Definições para usar a reprodução sincronizada.';

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
      other: '# participantes',
      one: '# participante',
    );
    return '$_temp0';
  }

  @override
  String get syncPlayIgnoreWait => 'Ignorar espera';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Não reter o grupo enquanto este dispositivo armazena em buffer';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continua localmente sem esperar por membros lentos';

  @override
  String get syncPlayRepeat => 'Repetir';

  @override
  String get syncPlayRepeatOne => 'Uma vez';

  @override
  String get syncPlayShuffleModeShuffled => 'Baralhado';

  @override
  String get syncPlayShuffleModeSorted => 'Classificado';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Sincronizar a fila de reprodução atual';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Substitui a fila do grupo pelo que está a ser reproduzido localmente';

  @override
  String get syncPlayLeaveGroup => 'Sair do grupo';

  @override
  String get syncPlayGroupQueue => 'Fila do grupo';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Reproduzir agora';

  @override
  String get syncPlayCreateNewGroup => 'Cria um novo grupo';

  @override
  String get syncPlayGroupName => 'Nome do grupo';

  @override
  String get syncPlayDefaultGroupName => 'O meu grupo SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Criar grupo';

  @override
  String get syncPlayAvailableGroups => 'Grupos disponíveis';

  @override
  String get syncPlayNoGroupsAvailable => 'Nenhum grupo disponível';

  @override
  String get syncPlayJoinGroupQuestion => 'Participar no grupo SyncPlay?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Participar num grupo SyncPlay pode substituir a tua fila de reprodução atual. Continuar?';

  @override
  String get syncPlayJoin => 'Participar';

  @override
  String get syncPlayStateIdle => 'Inativo';

  @override
  String get syncPlayStateWaiting => 'A aguardar';

  @override
  String get syncPlayStatePaused => 'Pausado';

  @override
  String get syncPlayStatePlaying => 'A reproduzir';

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
      'Não tens acesso a um ou mais itens neste grupo SyncPlay. Pede ao proprietário do grupo para verificar as permissões da biblioteca ou escolhe uma fila diferente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'A sincronizar a reprodução com $groupName';
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
      'Este dispositivo não pode decodificar conteúdo Dolby Vision diretamente. Usa o substituto HDR10 ou solicita a transcodificação do servidor.';

  @override
  String get rememberMyChoice => 'Lembrar a minha escolha';

  @override
  String get playHdr10Fallback => 'Reproduzir substituto HDR10';

  @override
  String get requestTranscode => 'Pedir transcodificação';

  @override
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# linhas descobertas',
      one: '# linha descoberta',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Ver tudo';

  @override
  String get noItems => 'Nenhum item';

  @override
  String get switchUser => 'Trocar utilizador';

  @override
  String get remoteControl => 'Controlo remoto';

  @override
  String get mediaBarLoading => 'A carregar barra multimédia...';

  @override
  String get mediaBarError => 'A barra de conteúdo não foi carregada';

  @override
  String get offlineServerUnavailable =>
      'Ligado à Internet, mas o servidor atual não está disponível.';

  @override
  String get offlineNoInternet =>
      'Está offline. Apenas o conteúdo transferido está disponível.';

  @override
  String get offlineFileNotAvailable => 'Ficheiro não disponível';

  @override
  String get offlineSwitchServer => 'Trocar servidor';

  @override
  String get offlineSavedMedia => 'Conteúdo guardado';

  @override
  String get offlineBannerTitle => 'Estás offline';

  @override
  String get offlineBannerSubtitle => 'A mostrar as tuas transferências';

  @override
  String get offlineBannerAction => 'Transferências';

  @override
  String get serverUnreachableBannerTitle =>
      'Não foi possível contactar o teu servidor';

  @override
  String get serverUnreachableBannerSubtitle =>
      'A reproduzir das transferências até voltar';

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
    return 'Falha no controlo de transmissão: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controlos';
  }

  @override
  String get castDeviceVolume => 'Volume do dispositivo';

  @override
  String get castVolumeUnavailable => 'Indisponível';

  @override
  String castStopKind(String kind) {
    return 'Parar $kind';
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
  String get pinReenterToConfirm =>
      'Introduz novamente o teu PIN para confirmar';

  @override
  String pinEnterNDigit(int length) {
    return 'Insira um PIN de $length dígitos';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Introduz o teu PIN de $length dígitos';
  }

  @override
  String get pinIncorrect => 'PIN incorreto';

  @override
  String get pinMismatch => 'Os PINs não correspondem';

  @override
  String get pinForgot => 'Esqueceu o PIN?';

  @override
  String get pinClear => 'Limpar';

  @override
  String get pinBackspace => 'Apagar';

  @override
  String get quickConnectAuthorized =>
      'Solicitação de Quick Connect autorizada.';

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
      'O Quick Connect está desativado neste servidor.';

  @override
  String get quickConnectForbidden =>
      'A tua conta não pode autorizar este pedido do Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'O código do Quick Connect não foi encontrado. Experimente um novo código.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Falha no Quick Connect: $message';
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
  String get remoteControlTitle => 'Controlo remoto';

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
  String get remoteNothingPlaying => 'Nada em reprodução nesta sessão';

  @override
  String get castingStarted =>
      'A transmissão começou no dispositivo selecionado';

  @override
  String castingFailed(String error) {
    return 'Falha ao iniciar a transmissão: $error';
  }

  @override
  String get noRemoteDevices =>
      'Não existem dispositivos de reprodução remota disponíveis.';

  @override
  String get noRemoteDevicesIos =>
      'Não existem dispositivos de reprodução remota disponíveis.\n\niOS, os destinos AirPlay podem não estar disponíveis no simulador.';

  @override
  String get trackActionPlayNext => 'Reproduzir Próximo';

  @override
  String get trackActionAddToQueue => 'Adicionar à fila';

  @override
  String get trackActionAddToPlaylist => 'Adicionar à lista de reprodução';

  @override
  String get trackActionCancelDownload => 'Cancelar transferência';

  @override
  String get trackActionDeleteFromPlaylist => 'Eliminar da lista de reprodução';

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
    return 'A transferir $name...';
  }

  @override
  String get trackActionDeletedFile => 'Ficheiro transferido eliminado';

  @override
  String get trackActionDeleteFileFailed =>
      'Não foi possível eliminar o ficheiro transferido';

  @override
  String get shuffleBy => 'Embaralhar por';

  @override
  String get shuffleSelectLibrary => 'Selecionar Biblioteca';

  @override
  String get shuffleSelectGenre => 'Selecionar o género';

  @override
  String get shuffleLibrary => 'Biblioteca';

  @override
  String get shuffleGenre => 'Género';

  @override
  String get shuffleNoLibraries => 'Nenhuma biblioteca compatível disponível.';

  @override
  String get shuffleNoGenres =>
      'Nenhum género encontrado para este modo aleatório.';

  @override
  String get posterDisplayTitle => 'Mostrar';

  @override
  String get posterImageType => 'Tipo de imagem';

  @override
  String get imageTypePoster => 'Póster';

  @override
  String get imageTypeThumbnail => 'Miniatura';

  @override
  String get imageTypeBanner => 'Faixa';

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
  String get playNext => 'Reproduzir a seguir';

  @override
  String get stillWatchingContent =>
      'A reprodução foi pausada. Ainda estás a ver?';

  @override
  String get stillWatchingStop => 'Parar';

  @override
  String get stillWatchingContinue => 'Continuar';

  @override
  String skipSegment(String segment) {
    return 'Saltar $segment';
  }

  @override
  String get liveTv => 'TV ao vivo';

  @override
  String get continueWatchingAndNextUp => 'Continuar a ver e a seguir';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'A transferir $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'A transferir $fileName';
  }

  @override
  String get nextEpisode => 'Próximo episódio';

  @override
  String get moreFromThisSeason => 'Mais desta temporada';

  @override
  String get playerTooltipPlaybackSpeed => 'Velocidade de reprodução';

  @override
  String get playerTooltipCastControls => 'Controlos de transmissão';

  @override
  String get playerTooltipPlaybackQuality => 'Taxa de bits';

  @override
  String get playerTooltipEnterFullscreen => 'Entrar em ecrã inteiro';

  @override
  String get playerTooltipExitFullscreen => 'Sair do ecrã inteiro';

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
  String get playerTooltipSeekBack => 'Procurar para trás';

  @override
  String get playerTooltipSeekForward => 'Procurar para a frente';

  @override
  String get contextMenuMarkWatched => 'Marcar como visto';

  @override
  String get contextMenuMarkUnwatched => 'Marcar como não visto';

  @override
  String get contextMenuAddToFavorites => 'Adicionar aos Favoritos';

  @override
  String get contextMenuRemoveFromFavorites => 'Remover dos Favoritos';

  @override
  String get contextMenuGoToSeries => 'Ir para a série';

  @override
  String get contextMenuHideFromContinueWatching =>
      'Ocultar de Continuar a ver';

  @override
  String get contextMenuHideFromNextUp => 'Ocultar de Próximo';

  @override
  String get contextMenuAddToCollection => 'Adicionar à coleção';

  @override
  String get settingsAdministrationSubtitle =>
      'Aceder ao painel de administração do servidor';

  @override
  String get settingsAccountSecurity => 'Conta e segurança';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Autenticação, código PIN e controlo parental';

  @override
  String get settingsPersonalization => 'Personalização';

  @override
  String get settingsPersonalizationSubtitle =>
      'Tema, navegação, linhas iniciais e visibilidade da biblioteca';

  @override
  String get settingsDynamicContent => 'Conteúdo Dinâmico';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barra de conteúdo e sobreposições visuais';

  @override
  String get settingsPlaybackSyncplay => 'Reprodução e SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Definições de áudio/vídeo, legendas, transferências e controlos do SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Sincronização de plugins, Seerr, classificações e muito mais';

  @override
  String get settingsAboutSubtitle =>
      'Versão da aplicação, informações legais e créditos';

  @override
  String get settingsAuthenticationSection => 'AUTENTICAÇÃO';

  @override
  String get settingsSortServersBy => 'Classificar servidores por';

  @override
  String get settingsLastUsed => 'Último uso';

  @override
  String get settingsAlphabetical => 'Alfabético';

  @override
  String get settingsConnectionSection => 'LIGAÇÃO';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Permitir certificados autoassinados';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Confiar em servidores que usam certificados TLS autoassinados ou de CA privada. Ativa apenas para servidores que controlas. Isto desativa a validação de certificados em todas as ligações.';

  @override
  String get settingsPrivacyAndSafetySection => 'PRIVACIDADE E SEGURANÇA';

  @override
  String get settingsBlockedRatings => 'Avaliações bloqueadas';

  @override
  String get settingsGeneralStyle => 'Estilo Geral';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Acentos temáticos, cenários, indicadores vistos e música temática';

  @override
  String get settingsDetailsScreen => 'Ecrã de detalhes';

  @override
  String get settingsDetailsScreenSubtitle =>
      'Estilo, desfoque de fundo e comportamento dos separadores';

  @override
  String get settingsHomePage => 'Página inicial';

  @override
  String get settingsHomePageSubtitle =>
      'Secções, tipos de imagens, sobreposições e visualizações de conteúdo';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilidade da biblioteca, visualização de pastas e comportamento multiservidor';

  @override
  String get settingsTwentyFourHourClock => 'Relógio de 24 horas';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Usa a formatação de 24 horas sempre que o relógio for mostrado';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Mostrar o botão aleatório na barra de navegação';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Mostrar o botão de géneros na barra de navegação';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Mostrar o botão de favoritos na barra de navegação';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Mostrar o botão de bibliotecas na barra de navegação';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Mostrar o botão Seerr na barra de navegação';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Mostrar sempre os rótulos de texto na barra de navegação superior';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Alternar a visibilidade da página inicial por biblioteca. Reinicia o Moonfin para que as alterações tenham efeito.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barra de conteúdo e visualizações locais';

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
  String get settingsOfflineDownloads => 'Transferencias off-line';

  @override
  String get settingsHigh => 'Alto';

  @override
  String get settingsLow => 'Baixo';

  @override
  String get settingsCustomPath => 'Caminho personalizado';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Introduzir o caminho da pasta de transferência';

  @override
  String get settingsConcurrentDownloads => 'Transferências simultâneas ';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Número máximo de itens para transferir de uma vez.';

  @override
  String get settingsAppInfo => 'INFORMAÇÕES DA APLICAÇÃO';

  @override
  String get settingsReportAnIssue => 'Informar um problema';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Abrir o rastreador de problemas no GitHub';

  @override
  String get settingsJoinDiscord => 'Juntar-se ao Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Conversa com a comunidade';

  @override
  String get settingsJoinTheDiscord => 'Participa no Discord';

  @override
  String get settingsSupportMoonfin => 'Apoia o Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Doe um café para o programador';

  @override
  String get settingsLegal => 'JURÍDICO';

  @override
  String get settingsLicenses => 'Licenças';

  @override
  String get settingsOpenSourceLicenseNotices =>
      'Avisos de licença de código aberto';

  @override
  String get settingsPrivacyPolicy => 'Política de Privacidade';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Como Moonfin trata os teus dados';

  @override
  String get settingsCheckForUpdates => 'Verifica se há atualizações';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Verifica o último lançamento do Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Desenvolvido por Flutter';

  @override
  String settingsLicenseNoticesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# avisos de licença',
      one: '# aviso de licença',
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
      'Mecanismo de vídeo principal e definições de qualidade de streaming';

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
      'Recursos especializados do reprodutor. Usa com cuidado, pois algumas opções podem causar problemas de reprodução';

  @override
  String get settingsSkipIntrosAndOutros => 'Saltar introduções e outros?';

  @override
  String get settingsMediaSegmentCountdown =>
      'Contagem regressiva de segmentos de conteúdo';

  @override
  String get settingsProgressBar => 'Barra de progresso';

  @override
  String get settingsTimer => 'Temporizador';

  @override
  String get settingsNone => 'Nenhum';

  @override
  String get settingsPromptUser => 'Pedir ao utilizador';

  @override
  String get settingsSkip => 'Saltar';

  @override
  String get settingsDoNothing => 'Não fazer nada';

  @override
  String get settingsMaxBitrateDescription =>
      'Limite a taxa de bits do streaming. O conteúdo acima desse limite será transcodificado para caber.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limite a resolução máxima que o reprodutor irá solicitar. O conteúdo de resolução mais alta será transcodificado.';

  @override
  String get settingsPlayerZoomDescription =>
      'Como o vídeo deve ser dimensionado para caber no ecrã.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Mecanismo de reprodução (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Escolher o mecanismo de reprodução padrão em dispositivos Android TV. As alterações são aplicadas à próxima sessão de reprodução.';

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
  String get settingsPreferHdr10Fallback => 'Preferir substituto HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Preferir a transcodificação do servidor';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Perfil Dolby Vision 7 Reprodução direta';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Controla se os fluxos de camada de aprimoramento do perfil Dolby Vision 7 devem direcionar a reprodução.';

  @override
  String get settingsAutoAftkrtEnabled => 'Automático (AFTKRT ativado)';

  @override
  String get settingsEnabledOnThisDevice => 'Ativado neste dispositivo';

  @override
  String get settingsDisabledPreferTranscode =>
      'Desativado (preferir transcodificação)';

  @override
  String get settingsResumeRewindDescription =>
      'Ao retomar a reprodução (a partir de Continuar a ver ou de uma página de item de conteúdo), quantos segundos devem ser retrocedidos?';

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
      'Ativa a reprodução direta para TV ao vivo';

  @override
  String get settingsOpenGroups => 'Grupos abertos';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Cria, participa ou gere grupos SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay ativado';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Ativa recursos de observação em grupo';

  @override
  String get settingsSyncplayButton => 'Botão SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Mostrar o botão SyncPlay na barra de navegação';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correção Avançada';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Ativar lógica de sincronização refinada';

  @override
  String get settingsSyncplaySyncCorrection => 'Correção de sincronização';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Ajusta automaticamente a reprodução para permanecer sincronizado';

  @override
  String get settingsSyncplaySpeedToSync => 'Velocidade para sincronizar';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Usa o ajuste da velocidade de reprodução para sincronizar';

  @override
  String get settingsSyncplaySkipToSync => 'Saltar para sincronizar';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Usa a procura para sincronizar';

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
  String recentlyReleasedLibraryName(String libraryName) {
    return 'Lançamentos recentes: $libraryName';
  }

  @override
  String get autoplayNextEpisode =>
      'Reproduzir automaticamente o próximo episódio';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Reproduzir automaticamente o próximo episódio quando disponível.';

  @override
  String get skipSilenceTitle => 'Saltar silêncio';

  @override
  String get skipSilenceSubtitle =>
      'Ignora automaticamente segmentos de áudio silenciosos quando suportado pelo stream.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Permitir efeitos de áudio externos';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Permitir que aplicações de equalizador e efeitos (por exemplo, Wavelet) sejam anexadas às sessões de reprodução Media3.';

  @override
  String get disableTunnelingTitle => 'Desativar tunelamento';

  @override
  String get disableTunnelingSubtitle =>
      'Forçar a reprodução sem tunelamento. Útil em dispositivos com descontinuidades de áudio/vídeo de tunelamento.';

  @override
  String get enableTunnelingTitle => 'Ativar tunelamento';

  @override
  String get enableTunnelingSubtitle =>
      'Avançado. Encaminha áudio e vídeo através de um caminho de hardware acoplado. Desativado por predefinição porque causa quedas de áudio/vídeo em alguns dispositivos.';

  @override
  String get mapDolbyVisionP7Title => 'Mapear Dolby Vision perfil 7 para HEVC';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Reproduzir fluxos de perfil Dolby Vision 7 como HEVC compatível com HDR10 em dispositivos não DV.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Usa estilos de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Aplica cores, fontes e posicionamento incorporados na faixa de legenda. Desativa para usar as tuas preferências de estilo de legenda.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Usa tamanhos de fonte de legenda incorporados';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Aplica dicas de tamanho de fonte incorporadas na faixa de legenda. Desativa o uso do tamanho da legenda nas tuas preferências de estilo.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Mostrar detalhes do conteúdo';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Mostrar os detalhes do item selecionado no topo das páginas da Biblioteca.';

  @override
  String get hideBackdropsInLibraries => 'Ocultar panos de fundo ao navegar?';

  @override
  String get useDetailedSubHeadings => 'Usa subtítulos detalhados';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Mostrar sublinha detalhada ou minimalista nas páginas da Biblioteca.';

  @override
  String get savedThemesDeleteDialogTitle => 'Eliminar tema guardado?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Remover \"$themeName\" do cache deste dispositivo?';
  }

  @override
  String get themeStore => 'Loja de temas';

  @override
  String get themeStoreSubtitle => 'Explora e guarda temas da comunidade';

  @override
  String get themeStoreDescription =>
      'Guarda um tema para o usares como os teus outros temas guardados.';

  @override
  String get themeStoreEmpty => 'Não há temas disponíveis neste momento.';

  @override
  String get themeStoreLoadFailed =>
      'Não foi possível carregar a Loja de temas. Verifica a tua ligação e tenta novamente.';

  @override
  String get themeStoreSave => 'Guardar';

  @override
  String get themeStoreSaveAndApply => 'Guardar e aplicar';

  @override
  String get themeStoreSaved => 'Guardado';

  @override
  String get themeStoreInvalidMessage => 'Não foi possível carregar este tema.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '\"$themeName\" guardado.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return 'Eliminado \"$themeName\" deste dispositivo.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Não foi possível eliminar \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Temas guardados';

  @override
  String get savedThemesDescription =>
      'Estes são temas transferidos do plugin Moonfin para o servidor atual. A exclusão remove apenas esta cópia local.';

  @override
  String get savedThemesEmpty =>
      'Nenhum tema guardado foi encontrado para este servidor.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Atualmente ativo';
  }

  @override
  String get savedThemesDeleteTooltip => 'Eliminar tema guardado';

  @override
  String get savedThemesManageSubtitle =>
      'Gerir temas de plugins baixados neste dispositivo';

  @override
  String get themeEditor => 'Editor de Tema';

  @override
  String get themeEditorSubtitle =>
      'Abre o Editor de Tema Moonfin no teu navegador';

  @override
  String get homeScreen => 'Ecrã inicial';

  @override
  String get bottomBar => 'Barra inferior';

  @override
  String get homeRowsStyleClassic => 'Clássico';

  @override
  String get homeRowsStyleModern => 'Moderno';

  @override
  String get homeRowsSection => 'Linhas iniciais';

  @override
  String get homeRowDisplay => 'Visualização da linha inicial';

  @override
  String get homeRowSections => 'Secções da linha inicial';

  @override
  String get homeRowToggles => 'Alternâncias da linha inicial';

  @override
  String get homeRowTogglesSubtitle =>
      'Ativar ou desativar categorias diferentes de linhas iniciais';

  @override
  String get homeRowTogglesDescription =>
      'Ativa as seguintes alternâncias para mostrar as linhas nas Secções Iniciais.';

  @override
  String get rowsType => 'Tipo de linhas';

  @override
  String get rowsTypeDescription =>
      'Classic mantém o tipo de imagem por linha e a sobreposição de informações. Moderno usa linhas do retrato ao pano de fundo.';

  @override
  String get displayFavoritesRows => 'Mostrar linhas de favoritos';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Mostrar filmes, séries favoritos e outras linhas favoritas nas secções iniciais.';

  @override
  String get favoritesRowSorting => 'Classificação de linhas de favoritos';

  @override
  String get favoritesRowSortingDescription =>
      'Classificar as linhas de Favoritos por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get displayCollectionsRows => 'Mostrar linhas de coleções';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Mostrar linhas de coleções nas secções iniciais.';

  @override
  String get collectionsRowSorting => 'Classificação de linhas de coleções';

  @override
  String get collectionsRowSortingDescription =>
      'Classificar as linhas das coleções por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get displayGenresRows => 'Mostrar linhas de géneros';

  @override
  String get displayGenresRowsSubtitle =>
      'Mostrar linhas de géneros nas secções iniciais.';

  @override
  String get genresRowSorting => 'Classificação de linha de géneros';

  @override
  String get genresRowSortingDescription =>
      'Classificar as linhas de géneros por data de adição, data de lançamento, em ordem alfabética e muito mais.';

  @override
  String get genresRowItems => 'Itens de linha de géneros';

  @override
  String get genresRowItemsDescription =>
      'Mostrar filmes, séries ou ambos nas linhas de géneros.';

  @override
  String get displayPlaylistsRows => 'Mostrar linhas de listas de reprodução';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Mostrar linhas de listas de reprodução nas Secções Iniciais.';

  @override
  String get playlistsRowSorting =>
      'Classificação de linhas de listas de reprodução';

  @override
  String get playlistsRowSortingDescription =>
      'Classificar linhas de listas de reprodução por data de adição, data de lançamento, ordem alfabética e muito mais.';

  @override
  String get displayAudioRows => 'Mostrar linhas de áudio';

  @override
  String get displayAudioRowsSubtitle =>
      'Mostrar linhas de áudio nas Secções iniciais.';

  @override
  String get audioRowsSorting => 'Ordenação das linhas de áudio';

  @override
  String get audioRowsSortingDescription =>
      'Ordena as linhas de áudio por data de adição, data de lançamento, ordem alfabética e mais.';

  @override
  String get audioPlaylists => 'Listas de reprodução de áudio';

  @override
  String get appearance => 'Aspeto';

  @override
  String get layout => 'Disposição';

  @override
  String get theme => 'Tema';

  @override
  String get keyboard => 'Teclado';

  @override
  String get navButtons => 'Botões';

  @override
  String get rendering => 'Renderização';

  @override
  String get mpvConfiguration => 'Configuração do MPV';

  @override
  String get cardSize => 'Tamanho do cartão';

  @override
  String get externalPlayerApp => 'Reprodutor externo';

  @override
  String get externalPlayerAppDescription =>
      'Define um reprodutor externo para ativar a opção de reprodução ao premir sem soltar';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Mostrar seletor de aplicações quando a reprodução começar.';

  @override
  String get loadingInstalledPlayers => 'A carregar reprodutores instalados...';

  @override
  String get connection => 'Ligação';

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
  String get mediaPlayerBehavior => 'Comportamento do reprodutor de conteúdo';

  @override
  String get playbackEnhancements => 'Melhorias de reprodução';

  @override
  String get alwaysOn => 'Sempre ligado.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      'Substitui Saltar outro pela apresentação seguinte';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Mostrar a sobreposição Next Up em vez do botão Saltar Outro.';

  @override
  String get playerRouting => 'Encaminhamento de Reprodutor';

  @override
  String get preferSoftwareDecoders => 'Preferir decodificadores de software';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Usa FFmpeg (áudio) e libgav1 (AV1) antes dos decodificadores de hardware. Desativa se a passagem de áudio HDMI for interrompida.';

  @override
  String get useExternalPlayer => 'Usar reprodutor externo';

  @override
  String get useExternalPlayerSubtitle =>
      'Abre a reprodução de vídeo na aplicação externa selecionada na Android TV.';

  @override
  String get automaticQueuing => 'Enfileiramento Automático';

  @override
  String get preferSdhSubtitles => 'Preferir legendas SDH';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Prioriza faixas de legenda SDH/CC ao selecionar automaticamente.';

  @override
  String get webDiagnostics => 'Diagnóstico da Web';

  @override
  String get webDiagnosticsTitle => 'Moonfin Diagnóstico da Web';

  @override
  String get webDiagnosticsIntro =>
      'Usa esta página para diagnosticar problemas de conectividade do navegador (CORS, conteúdo misto e definições de descoberta).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Falha de conteúdo misto detectada';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Falha de CORS/Preflight detectada';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin detetou uma página HTTPS a tentar chamar um URL de servidor HTTP. Os navegadores bloqueiam esse pedido antes que ele chegue ao teu servidor.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin detetou uma falha de pedido ao nível do navegador que geralmente é causada pela falta de CORS ou cabeçalhos de simulação no servidor de conteúdo.';

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
      'Correção: serve o teu servidor de conteúdo ou endpoint de proxy via HTTPS ou carrega Moonfin por HTTP apenas em redes locais fiáveis.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Nenhuma configuração óbvia de conteúdo misto detectada nas definições de tempo de execução atuais.';

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
      '• Expor Content-Range e Accept-Ranges para streaming e comportamento de procura.';

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
      'Esta rota de diagnóstico destina-se a compilações web. Se estiveres a ver isto noutra plataforma, estas verificações podem não se aplicar.';

  @override
  String get backToServerSelect => 'Voltar para seleção de servidor';

  @override
  String get signOutAllUsers => 'Terminar sessão de todos os utilizadores';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'A permissão do microfone foi negada permanentemente. Ativa-o nas definições do sistema.';

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
  String get openIosRoutePicker => 'Abrir o seletor de rota do iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'O seletor de rotas AirPlay não está disponível neste dispositivo.';

  @override
  String get videos => 'Vídeos';

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
  String get watchAgain => 'Ver novamente';

  @override
  String get guestAppearances => 'Participações de convidados';

  @override
  String get appearancesSeerr => 'Aparições (Seerr)';

  @override
  String get crewContributionsSeerr => 'Contribuições da equipa (Seerr)';

  @override
  String get watchWithGroup => 'Ver com o grupo';

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
      'Tens a certeza de que queres reiniciar o servidor?';

  @override
  String get adminShutdownServerConfirmation =>
      'Tens a certeza de que queres encerrar o servidor? Vais precisar de o reiniciar manualmente.';

  @override
  String get internal => 'Interno';

  @override
  String get idle => 'Parado';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Nenhum utilizador encontrado';

  @override
  String get adminNoUsersMatchSearch =>
      'Nenhum utilizador corresponde à tua pesquisa';

  @override
  String get adminNoDevicesFound => 'Nenhum dispositivo encontrado';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Nenhum dispositivo corresponde aos filtros atuais';

  @override
  String get passwordSet => 'Palavra-passe definida';

  @override
  String get noPasswordConfigured => 'Nenhuma palavra-passe configurada';

  @override
  String get remoteAccess => 'Acesso remoto';

  @override
  String get localOnly => 'Somente locais';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Falha ao carregar análise de conteúdo';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Análises combinadas em todas as bibliotecas de conteúdo.';

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
      other: '$count Bibliotecas',
      one: '1 Biblioteca',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Ainda não estão disponíveis totais de conteúdo indexado para esta selecção.';

  @override
  String get analyticsLibraryDetails => 'Detalhes da biblioteca';

  @override
  String get analyticsLibraryBreakdown => 'Análise da biblioteca';

  @override
  String get analyticsNoLibrariesAvailable => 'Não há bibliotecas disponíveis.';

  @override
  String get adminServerAdministrationTitle => 'Administração do Servidor';

  @override
  String get adminServerPathData => 'Dados';

  @override
  String get adminServerPathImageCache => 'Cache de imagens';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Registos';

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
  String get userActivity => 'Atividade do utilizador';

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
  String get mixedContent => 'Conteúdo Variado';

  @override
  String get homeVideosAndPhotos => 'Vídeos e fotos caseiros';

  @override
  String get mixedMoviesAndShows => 'Filmes e séries variados';

  @override
  String get intelQuickSync => 'Intel QuickSync';

  @override
  String get rockchipMpp => 'Rockchip MPP';

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
  String get closeGenrePanel => 'Fechar painel de género';

  @override
  String get loadingShuffle => 'A carregar ordem aleatória...';

  @override
  String get libraryShuffleLabel => 'Mistura da Biblioteca';

  @override
  String get randomShuffleLabel => 'Mistura Aleatória';

  @override
  String get genresShuffleLabel => 'Mistura de Géneros';

  @override
  String get autoHdrSwitching => 'Troca automática de HDR';

  @override
  String get autoHdrSwitchingDescription =>
      'Ativa automaticamente o HDR para reprodução de vídeo HDR e restaura o modo de apresentação ao sair.';

  @override
  String get whenFullscreen => 'Quando em ecrã inteiro';

  @override
  String get changeArtwork => 'Alterar imagens';

  @override
  String get missing => 'Em falta';

  @override
  String get transcodingLimits => 'Limites de transcodificação';

  @override
  String get clearAllArtworkButton => 'Limpar todas as imagens?';

  @override
  String get clearAllArtworkWarning =>
      'Tens a certeza de que queres limpar todas as imagens transferidas?';

  @override
  String get confirmClear => 'Confirmar limpeza';

  @override
  String confirmClearMessage(String itemType) {
    return 'Tens a certeza de que queres limpar $itemType?';
  }

  @override
  String get uploadButton => 'Enviar?';

  @override
  String get resolutionLabel => 'Resolução: ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Mostrar apenas imagens no idioma da interface';

  @override
  String get confirmClearAll => 'Confirmar limpar tudo';

  @override
  String get imageUploadSuccess => 'Imagem enviada com sucesso!';

  @override
  String imageUploadFailed(String error) {
    return 'Falha ao enviar a imagem: $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Falha ao definir a imagem: $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Falha ao eliminar a imagem: $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Falha ao limpar todas as imagens: $error';
  }

  @override
  String get yes => 'Sim';

  @override
  String get posterCategory => 'Póster';

  @override
  String get backdropsCategory => 'Panos de fundo';

  @override
  String get bannerCategory => 'Banner';

  @override
  String get logoCategory => 'Logótipo';

  @override
  String get thumbnailCategory => 'Miniatura';

  @override
  String get artCategory => 'Arte';

  @override
  String get discArtCategory => 'Arte do disco';

  @override
  String get screenshotCategory => 'Captura de ecrã';

  @override
  String get boxCoverCategory => 'Capa da caixa';

  @override
  String get boxRearCoverCategory => 'Contracapa da caixa';

  @override
  String get menuArtCategory => 'Arte do menu';

  @override
  String get confirmItemPoster => 'o póster';

  @override
  String get confirmItemBackdrop => 'o pano de fundo';

  @override
  String get confirmItemBanner => 'o banner';

  @override
  String get confirmItemLogo => 'o logótipo';

  @override
  String get confirmItemThumbnail => 'a miniatura';

  @override
  String get confirmItemArt => 'a arte';

  @override
  String get confirmItemDiscArt => 'a arte do disco';

  @override
  String get confirmItemScreenshot => 'a captura de ecrã';

  @override
  String get confirmItemBoxCover => 'a capa da caixa';

  @override
  String get confirmItemBoxRearCover => 'a contracapa da caixa';

  @override
  String get confirmItemMenuArt => 'a arte do menu';

  @override
  String get resolutionAll => 'Todas';

  @override
  String get resolutionHigh => 'Alta (1080p+)';

  @override
  String get resolutionMedium => 'Média (720p)';

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
  String get audiobookQueue => 'Fila';

  @override
  String get audiobookTimeline => 'Linha temporal';

  @override
  String get audiobookTimelineEmpty => 'A linha temporal está vazia';

  @override
  String get audiobookWholeBook => 'Livro completo';

  @override
  String get audiobookFocusedTimeline => 'Linha temporal focada';

  @override
  String get audiobookExportBookmarks => 'Exportar marcadores';

  @override
  String get audiobookExportNotes => 'Exportar notas';

  @override
  String get audiobookExportAll => 'Exportar tudo';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exportado para $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Falha na exportação: $error';
  }

  @override
  String get audiobookLyrics => 'Letras';

  @override
  String get audiobookAddBookmark => 'Adicionar marcador';

  @override
  String get audiobookAddNote => 'Adicionar nota';

  @override
  String get audiobookEditNote => 'Editar nota';

  @override
  String get audiobookNoteHint => 'Escreve uma nota para este momento';

  @override
  String get audiobookSleepTimer => 'Temporizador para dormir';

  @override
  String get audiobookSleepOff => 'Desligado';

  @override
  String get audiobookSleepEndOfChapter => 'Fim do capítulo';

  @override
  String get audiobookSleepCustom => 'Personalizado';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining restantes';
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
  String get audiobookPlaybackSpeed => 'Velocidade de reprodução';

  @override
  String get audiobookRemainingTime => 'Restante';

  @override
  String get audiobookElapsedTime => 'Decorrido';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Recuar ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Avançar ${seconds}s';
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
  String get audiobookNoChapters => 'Sem capítulos';

  @override
  String get audiobookNoBookmarks => 'Ainda sem marcadores';

  @override
  String get audiobookNoNotes => 'Ainda sem notas';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Marcador adicionado em $position';
  }

  @override
  String get audiobookSpeedReset => 'Repor para 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Guardar';

  @override
  String get audiobookCancel => 'Cancelar';

  @override
  String get audiobookDelete => 'Eliminar';

  @override
  String get subtitlePreferences => 'Preferências de legendas';

  @override
  String get subtitlePreferencesDescription =>
      'Altera os modos de legendas, os idiomas predefinidos, o aspeto e as opções de renderização.';

  @override
  String get subtitleRendering => 'Renderização de legendas';

  @override
  String get displayOptions => 'Opções de visualização';

  @override
  String get releaseDateAscending => 'Data de lançamento (crescente)';

  @override
  String get releaseDateDescending => 'Data de lançamento (decrescente)';

  @override
  String get groupContributions => 'Agrupar contribuições';

  @override
  String get groupMultipleRoles => 'Agrupar vários papéis';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Aviso de acesso de escrita à biblioteca';

  @override
  String get libraryWriteAccessHowToFix => 'Como corrigir:';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Concede permissões de escrita ao utilizador do serviço Jellyfin (por exemplo, jellyfin ou PUID/PGID do Docker) para as pastas da tua biblioteca de conteúdo no servidor.\n\n2. Ou vai ao Painel do Jellyfin -> Bibliotecas, edita esta biblioteca e desativa \'Guardar imagens nas pastas de conteúdo\' para armazenar as imagens na base de dados interna do Jellyfin.';

  @override
  String get dismiss => 'Dispensar';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'A tua biblioteca \'$libraryName\' está configurada para guardar as imagens diretamente nas pastas de conteúdo (a opção \'Guardar imagens nas pastas de conteúdo\' está ativada). No entanto, o Jellyfin testou o acesso de escrita e não tem permissão para escrever ficheiros neste diretório:\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Parece que o Jellyfin não conseguiu atualizar as imagens. A tua biblioteca está configurada para guardar as imagens diretamente nas pastas de conteúdo (a opção \'Guardar imagens nas pastas de conteúdo\' está ativada). Este erro ocorre normalmente quando o processo do servidor Jellyfin não tem permissão para escrever ficheiros nos teus diretórios de conteúdo.';

  @override
  String get externalLists => 'Listas externas';

  @override
  String get replay => 'Reproduzir novamente';

  @override
  String get fileInformation => 'Informações do ficheiro';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Tamanho: $size  •  Formato: $format';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Mostrar todas as ($count) faixas de áudio';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Mostrar todas as ($count) faixas de legendas';
  }

  @override
  String get checkingDirectPlay =>
      'A verificar a capacidade de Reprodução direta...';

  @override
  String get directPlayCapabilityLabel => 'Capacidade de Reprodução direta: ';

  @override
  String get forced => 'Forçada';

  @override
  String get transcodeContainerNotSupported =>
      'O formato do contentor não é suportado pelo reprodutor.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'O codec de vídeo não é suportado.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'O codec de áudio não é suportado.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'O formato de legendas não é suportado (requer incorporação).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'O perfil de áudio não é suportado.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'O perfil de vídeo não é suportado.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'O nível de vídeo não é suportado.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'A resolução do vídeo não é suportada por este dispositivo.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'A profundidade de bits do vídeo não é suportada.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'A taxa de fotogramas do vídeo não é suportada.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'A taxa de bits do ficheiro excede o limite de streaming do reprodutor.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'A taxa de bits do vídeo excede o limite de streaming.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'A taxa de bits do áudio excede o limite de streaming.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'O número de canais de áudio não é suportado.';

  @override
  String get sortAlphabetical => 'Alfabética';

  @override
  String get sortReleaseAscending => 'Ordem de lançamento (crescente)';

  @override
  String get sortReleaseDescending => 'Ordem de lançamento (decrescente)';

  @override
  String get sortCustomDragDrop => 'Personalizada (arrastar e largar)';

  @override
  String get playlistSortOptions =>
      'Opções de ordenação da lista de reprodução';

  @override
  String get resetSort => 'Repor ordenação';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Rever T$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Rever lista de reprodução';

  @override
  String get noSubtitlesFound => 'Nenhuma legenda encontrada.';

  @override
  String get adminControls => 'Controlos de administrador';

  @override
  String get impellerRendering => 'Motor de renderização (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'O Impeller é o renderizador de GPU moderno do Flutter, para animações mais suaves e menos engasgos. Em algumas TV boxes e GPUs antigas, pode causar falhas gráficas ou vídeo preto; desliga-o se notares isso. Automático escolhe a melhor predefinição para o teu dispositivo. Reinicia o Moonfin para aplicar.';

  @override
  String get impellerAuto => 'Automático';

  @override
  String get impellerOn => 'Ligado';

  @override
  String get impellerOff => 'Desligado';

  @override
  String get impellerRestartTitle => 'Reinício necessário';

  @override
  String get impellerRestartMessage =>
      'O Moonfin precisa de reiniciar para alterar o motor de renderização. Fecha a aplicação agora e volta a abri-la para aplicar.';

  @override
  String get impellerCloseNow => 'Fechar a aplicação agora';

  @override
  String get adminRefreshLibrary => 'Atualizar biblioteca';

  @override
  String get adminRefreshAllLibraries => 'Atualizar todas as bibliotecas';

  @override
  String get adminRepoSortDateOldest =>
      'Data de adição (mais antigas primeiro)';

  @override
  String get adminRepoSortDateNewest =>
      'Data de adição (mais recentes primeiro)';

  @override
  String get adminRepoSortNameAsc => 'Alfabética (A a Z)';

  @override
  String get adminRepoSortNameDesc => 'Alfabética (Z a A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'A carregar a análise do servidor... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource => 'Igual à origem';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 Filmes';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 Séries';

  @override
  String get imdbMostPopularMovies => 'Filmes mais populares do IMDb';

  @override
  String get imdbMostPopularTvShows => 'Séries mais populares do IMDb';

  @override
  String get imdbLowestRatedMovies => 'Filmes com pior avaliação do IMDb';

  @override
  String get imdbTopEnglishMovies =>
      'Filmes em inglês mais bem avaliados do IMDb';
}
