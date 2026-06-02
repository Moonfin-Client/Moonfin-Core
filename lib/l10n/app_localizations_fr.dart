// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Moonfin';

  @override
  String get signIn => 'Se connecter';

  @override
  String connectingToServer(String serverName) {
    return 'Connecting to $serverName';
  }

  @override
  String get quickConnect => 'Connexion rapide';

  @override
  String get password => 'Mot de passe';

  @override
  String get username => 'Nom d\'utilisateur';

  @override
  String get email => 'E-mail';

  @override
  String get quickConnectInstruction =>
      'Saisissez ce code dans le tableau de bord web de votre serveur :';

  @override
  String get waitingForAuthorization => 'En attente d\'autorisation...';

  @override
  String get back => 'Retour';

  @override
  String get serverUnavailable => 'Serveur indisponible';

  @override
  String get loginFailed => 'Échec de la connexion';

  @override
  String quickConnectUnavailable(String detail) {
    return 'QuickConnect unavailable: $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'QuickConnect unavailable ($status): $detail';
  }

  @override
  String get whosWatching => 'Qui regarde ?';

  @override
  String get addUser => 'Ajouter un utilisateur';

  @override
  String get selectServer => 'Sélectionner un serveur';

  @override
  String appVersionFooter(String version) {
    return 'Moonfin version $version';
  }

  @override
  String get savedServers => 'Serveurs enregistrés';

  @override
  String get discoveredServers => 'Serveurs détectés';

  @override
  String get noneFound => 'Aucun serveur trouvé';

  @override
  String get unableToConnectToServer => 'Impossible de se connecter au serveur';

  @override
  String get addServer => 'Ajouter un serveur';

  @override
  String get embyConnect => 'Emby Connecter';

  @override
  String get removeServer => 'Supprimer le serveur';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Remove \"$serverName\" from your servers?';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get remove => 'Supprimer';

  @override
  String get connectToServer => 'Se connecter au serveur';

  @override
  String get serverAddress => 'Adresse du serveur';

  @override
  String get serverAddressHint => 'https://votre-serveur.exemple.com';

  @override
  String get connect => 'Se connecter';

  @override
  String get secureStorageUnavailable => 'Stockage sécurisé indisponible';

  @override
  String get secureStorageUnavailableMessage =>
      'Moonfin n\'a pas pu accéder au trousseau de votre système. La connexion peut continuer, mais le stockage sécurisé des jetons peut rester indisponible tant que le trousseau n\'est pas déverrouillé.';

  @override
  String get ok => 'D\'ACCORD';

  @override
  String get settingsAppearanceTheme => 'Thème de l\'application';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Basculez entre Moonfin et Neon Pulse sans redémarrer l\'application';

  @override
  String get keyboardPreferSystemIme => 'Prefer system keyboard';

  @override
  String get keyboardPreferSystemImeDescription =>
      'Use your device input method by default for text entry';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Le look actuel de Moonfin que vous aimez tous';

  @override
  String get themeNeonPulse => 'Néon Impulsion';

  @override
  String get themeNeonPulseSubtitle =>
      'Style Synthwave avec lueur magenta, texte cyan et contraste chromé plus fort';

  @override
  String get embyConnectSignInSubtitle =>
      'Connectez-vous avec votre compte Emby Connect';

  @override
  String get emailOrUsername => 'E-mail ou nom d\'utilisateur';

  @override
  String get selectAServer => 'Sélectionner un serveur';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get noLinkedServers => 'Aucun serveur lié à ce compte Emby Connect';

  @override
  String get invalidEmbyConnectCredentials =>
      'Identifiants Emby Connect invalides';

  @override
  String get invalidEmbyConnectLogin =>
      'Nom d\'utilisateur ou mot de passe Emby Connect invalide';

  @override
  String get embyConnectExchangeNotSupported =>
      'Le serveur ne prend pas en charge l\'échange Emby Connect';

  @override
  String get embyConnectNetworkError =>
      'Erreur réseau lors du contact avec Emby Connect ou le serveur sélectionné';

  @override
  String get loadingLinkedServers => 'Chargement des serveurs liés...';

  @override
  String get connectingToServerEllipsis => 'Connexion au serveur...';

  @override
  String get noReachableAddress => 'Aucune adresse accessible fournie';

  @override
  String get invalidServerExchangeResponse =>
      'Réponse invalide du point de terminaison d\'échange du serveur';

  @override
  String unableToConnectTo(String target) {
    return 'Unable to connect to $target';
  }

  @override
  String get exitApp => 'Quitter Moonfin ?';

  @override
  String get exitAppConfirmation => 'Voulez-vous vraiment quitter ?';

  @override
  String get exit => 'Quitter';

  @override
  String get noHomeRowsLoaded =>
      'Impossible de charger les sections d\'accueil';

  @override
  String get noHomeRowsHint =>
      'Essayez d\'actualiser ou de réduire les sections d\'accueil actives.';

  @override
  String get retryHomeRows => 'Réessayer les sections d\'accueil';

  @override
  String get guide => 'Guide';

  @override
  String get recordings => 'Enregistrements';

  @override
  String get schedule => 'Programmation';

  @override
  String get series => 'Séries';

  @override
  String get noItemsFound => 'Aucun élément trouvé';

  @override
  String get home => 'Accueil';

  @override
  String get browseAll => 'Tout parcourir';

  @override
  String get genres => 'Genre';

  @override
  String get collectionPlaceholder =>
      'Les éléments de la collection apparaîtront ici';

  @override
  String get browseByLetter => 'Parcourir par lettre';

  @override
  String get alphabeticalBrowsePlaceholder =>
      'La navigation alphabétique apparaîtra ici';

  @override
  String get suggestions => 'Suggestions';

  @override
  String get suggestionsPlaceholder => 'Les éléments suggérés apparaîtront ici';

  @override
  String get failedToLoadLibraries => 'Impossible de charger les bibliothèques';

  @override
  String get noLibrariesFound => 'Aucune bibliothèque trouvée';

  @override
  String get library => 'Bibliothèque';

  @override
  String get displaySettings => 'Paramètres d\'affichage';

  @override
  String get allGenres => 'Tous les genres';

  @override
  String get noGenresFound => 'Aucun genre trouvé';

  @override
  String failedToLoadFolderError(String error) {
    return 'Failed to load folder: $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ce dossier est vide';

  @override
  String itemCountLabel(int count) {
    return '$count items';
  }

  @override
  String get failedToLoadFavorites => 'Impossible de charger les favoris';

  @override
  String get retry => 'Réessayer';

  @override
  String get noFavoritesYet => 'Aucun favori pour le moment';

  @override
  String get favorites => 'Favoris';

  @override
  String totalCountItems(int count) {
    return '$count Items';
  }

  @override
  String get continuing => 'En cours';

  @override
  String get ended => 'Terminée';

  @override
  String get sortAndFilter => 'Trier et filtrer';

  @override
  String get type => 'Taper';

  @override
  String get sortBy => 'Trier par';

  @override
  String get display => 'Affichage';

  @override
  String get imageType => 'Type d\'image';

  @override
  String get posterSize => 'Taille du poster';

  @override
  String get small => 'Petit';

  @override
  String get medium => 'Moyen';

  @override
  String get large => 'Grand';

  @override
  String get extraLarge => 'Très grand';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Vues';

  @override
  String get albums => 'Albums';

  @override
  String get albumArtists => 'Artistes d\'album';

  @override
  String get artists => 'Artistes';

  @override
  String get bookmarks => 'Marque-pages';

  @override
  String get noSavedBookmarks =>
      'Aucun marque-page enregistré pour ce titre pour le moment.';

  @override
  String get openBook => 'Ouvrir le livre';

  @override
  String get chapter => 'Chapitre';

  @override
  String get page => 'Page';

  @override
  String get bookmark => 'Marque-page';

  @override
  String get justNow => 'À l\'instant';

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
  String get discoverySubjects => 'Sujets de découverte';

  @override
  String get pickDiscoverySubjects =>
      'Choisissez quels flux de sujets afficher dans Découvrir.';

  @override
  String get apply => 'Appliquer';

  @override
  String get openLink => 'Ouvrir le lien';

  @override
  String get scanWithYourPhone => 'Scannez avec votre téléphone';

  @override
  String get audiobookGenres => 'Genres d\'audiolivres';

  @override
  String get pickAudiobookGenres =>
      'Choisissez quels genres afficher dans Découvrir les audiolivres.';

  @override
  String get discoverAudiobooks => 'Découvrir des audiolivres';

  @override
  String get librivoxDescription =>
      'Titres populaires du domaine public de LibriVox.';

  @override
  String titlesCount(int count) {
    return '$count titles';
  }

  @override
  String get scrollLeft => 'Faire défiler vers la gauche';

  @override
  String get scrollRight => 'Faire défiler vers la droite';

  @override
  String get couldNotLoadGenre =>
      'Impossible de charger ce genre pour le moment.';

  @override
  String get continueReading => 'Continuer la lecture';

  @override
  String get savedHighlights => 'Surlignages enregistrés';

  @override
  String get continueListening => 'Continuer l\'écoute';

  @override
  String get listen => 'Écouter';

  @override
  String get resume => 'Reprendre';

  @override
  String get failedToLoadLibrary => 'Impossible de charger la bibliothèque';

  @override
  String get popularNow => 'Populaire en ce moment';

  @override
  String get savedForLater => 'Enregistré pour plus tard';

  @override
  String get topListens => 'Les plus écoutés';

  @override
  String get unreadDiscoveries => 'Découvertes non lues';

  @override
  String get pickUpAgain => 'Reprendre';

  @override
  String get bookHighlightsDescription =>
      'Vos livres avec des surlignages, des favoris ou une progression de lecture.';

  @override
  String get handPickedFromLibrary => 'Sélectionnés dans votre bibliothèque.';

  @override
  String get handPickedFromListeningQueue =>
      'Sélectionnés dans votre file d\'écoute.';

  @override
  String get booksWithHighlights =>
      'Livres avec des surlignages, des favoris ou une progression de lecture.';

  @override
  String get jumpBackNarration =>
      'Reprenez l\'écoute sans chercher où vous en étiez.';

  @override
  String get unreadBooksReady =>
      'Des livres non lus pour votre prochaine heure de calme.';

  @override
  String get quickAccessFavorites =>
      'Accès rapide aux livres auxquels vous revenez souvent.';

  @override
  String get searchAudiobooks => 'Rechercher des audiolivres';

  @override
  String get searchYourLibrary => 'Rechercher dans votre bibliothèque';

  @override
  String get pickUpStory => 'Reprenez l\'histoire là où vous l\'avez laissée';

  @override
  String get savedPlacesChapters =>
      'Vos emplacements enregistrés et chapitres inachevés';

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
  String get readyWhenYouAre => 'Prêt quand vous l’êtes';

  @override
  String get details => 'Détails';

  @override
  String get listeningRoom => 'Salle d\'écoute';

  @override
  String get bookmarksAndProgress => 'Marque-pages et progression';

  @override
  String titlesArrangedForBrowsing(int count) {
    return '$count titles arranged for reading-first browsing.';
  }

  @override
  String get titles => 'Titres';

  @override
  String get allTitles => 'Tous les titres';

  @override
  String get authors => 'Auteurs';

  @override
  String get browseByAuthor => 'Parcourir par auteur';

  @override
  String get browseByGenre => 'Parcourir par genre';

  @override
  String get discover => 'Découvrir';

  @override
  String get trendingTitlesOpenLibrary =>
      'Titres tendance par sujet depuis Open Library.';

  @override
  String get noBookmarkedItems =>
      'Aucun élément dans les marque-pages pour le moment';

  @override
  String get nothingMatchesSection =>
      'Rien ne correspond encore à cette section. Essayez un autre onglet ou revenez une fois la synchronisation de la bibliothèque terminée.';

  @override
  String get audiobooks => 'Audiolivres';

  @override
  String noLabelFound(String label) {
    return 'No $label found';
  }

  @override
  String get folder => 'Dossier';

  @override
  String get filters => 'Filtres';

  @override
  String get readingStatus => 'Statut de lecture';

  @override
  String get playedStatus => 'Statut de visionnage';

  @override
  String get readStatus => 'Lu';

  @override
  String get watched => 'Vu';

  @override
  String get unread => 'Non lu';

  @override
  String get unwatched => 'Non vu';

  @override
  String get seriesStatus => 'Statut de la série';

  @override
  String get allLibraries => 'Toutes les bibliothèques';

  @override
  String get books => 'Livres';

  @override
  String get author => 'Auteur';

  @override
  String get unknownAuthor => 'Auteur inconnu';

  @override
  String get uncategorized => 'Non classé';

  @override
  String get overview => 'Aperçu';

  @override
  String get noLibrivoxDescription =>
      'Aucune description fournie par LibriVox pour ce titre pour le moment.';

  @override
  String get readers => 'Lecteurs';

  @override
  String get openLinks => 'Ouvrir les liens';

  @override
  String get librivoxPage => 'Page LibriVox';

  @override
  String get internetArchive => 'Archives Internet';

  @override
  String get rssFeed => 'Flux RSS';

  @override
  String get downloadZip => 'Télécharger le ZIP';

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
      'Aucun aperçu disponible depuis Open Library pour ce titre pour le moment.';

  @override
  String get subjects => 'Sujets';

  @override
  String get all => 'Tout';

  @override
  String booksCount(int count) {
    return '$count books';
  }

  @override
  String get couldNotLoadSubject =>
      'Impossible de charger ce sujet pour le moment.';

  @override
  String get audiobookDetails => 'Détails du livre audio';

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
  String get trackList => 'Liste des pistes';

  @override
  String get itemListPlaceholder => 'La liste des éléments apparaîtra ici';

  @override
  String get favoriteTracksPlaceholder =>
      'Les pistes favorites apparaîtront ici';

  @override
  String get failedToLoad => 'Impossible de charger';

  @override
  String get delete => 'Supprimer';

  @override
  String get save => 'Enregistrer';

  @override
  String get moreLikeThis => 'Plus comme ça';

  @override
  String get castAndCrew => 'Casting et équipe';

  @override
  String get collection => 'Collection';

  @override
  String get episodes => 'Épisodes';

  @override
  String get nextUp => 'À suivre';

  @override
  String get seasons => 'Saisons';

  @override
  String get chapters => 'Chapitres';

  @override
  String get features => 'Bonus';

  @override
  String get movies => 'Films';

  @override
  String get musicVideos => 'Music Videos';

  @override
  String get other => 'Autres';

  @override
  String get discography => 'Discographie';

  @override
  String get similarArtists => 'Artistes similaires';

  @override
  String get tableOfContents => 'Table des matières';

  @override
  String get tracklist => 'Liste des pistes';

  @override
  String discNumber(int number) {
    return 'Disc $number';
  }

  @override
  String get biography => 'Biographie';

  @override
  String get authorDetails => 'Détails de l\'auteur';

  @override
  String get noOverviewAvailable =>
      'Aucun résumé disponible pour ce titre pour le moment.';

  @override
  String get noBiographyAvailable =>
      'Aucune biographie disponible pour cet auteur.';

  @override
  String get noBooksFound => 'Aucun livre trouvé pour cet auteur.';

  @override
  String get unableToLoadAuthorDetails =>
      'Impossible de charger les détails de l\'auteur pour le moment.';

  @override
  String published(int year) {
    return 'Published $year';
  }

  @override
  String get publicationDateUnknown => 'Date de publication inconnue';

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
  String get view => 'Voir';

  @override
  String get resumeReading => 'Reprendre la lecture';

  @override
  String get read => 'Lire';

  @override
  String resumeFrom(String position) {
    return 'Resume from $position';
  }

  @override
  String get play => 'Lire';

  @override
  String get startOver => 'Recommencer';

  @override
  String get restart => 'Redémarrer';

  @override
  String get readOffline => 'Lire hors ligne';

  @override
  String get playOffline => 'Lire hors ligne';

  @override
  String get audio => 'Audio';

  @override
  String get subtitles => 'Sous-titres';

  @override
  String get version => 'Version';

  @override
  String get cast => 'Diffuser';

  @override
  String get trailer => 'Bande-annonce';

  @override
  String get finished => 'Terminé';

  @override
  String get favorited => 'En favori';

  @override
  String get favorite => 'Favori';

  @override
  String get playlist => 'Liste de lecture';

  @override
  String get downloaded => 'Téléchargé';

  @override
  String get downloadAll => 'Tout télécharger';

  @override
  String get download => 'Télécharger';

  @override
  String get deleteDownloaded => 'Supprimer les téléchargements';

  @override
  String get goToSeries => 'Aller à la série';

  @override
  String get editMetadata => 'Modifier les métadonnées';

  @override
  String get less => 'Moins';

  @override
  String get more => 'Plus';

  @override
  String get deleteItem => 'Supprimer l\'élément';

  @override
  String get deletePlaylist => 'Supprimer la liste de lecture';

  @override
  String get deletePlaylistMessage =>
      'Supprimer cette liste de lecture du serveur ?';

  @override
  String get deleteItemMessage => 'Supprimer cet élément du serveur ?';

  @override
  String get failedToDeletePlaylist =>
      'Échec de la suppression de la liste de lecture';

  @override
  String get failedToDeleteItem => 'Échec de la suppression de l\'élément';

  @override
  String get renamePlaylist => 'Renommer la liste de lecture';

  @override
  String get playlistName => 'Nom de la liste de lecture';

  @override
  String get deleteDownloadedAlbum => 'Supprimer l\'album téléchargé';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Delete downloaded tracks for \"$title\"?';
  }

  @override
  String get downloadedTracksDeleted => 'Pistes téléchargées supprimées';

  @override
  String get downloadedTracksDeleteFailed =>
      'Certaines pistes téléchargées n\'ont pas pu être supprimées';

  @override
  String get noTracksLoaded => 'Aucune piste chargée';

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
  String get itemDeleted => 'Élément supprimé';

  @override
  String get noPlayableTrailerFound => 'Aucune bande-annonce lisible trouvée.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Unsupported book format: .$extension';
  }

  @override
  String get audioTrack => 'Piste audio';

  @override
  String get subtitleTrack => 'Piste de sous-titres';

  @override
  String get none => 'Aucun';

  @override
  String get downloadSubtitlesLabel => 'Télécharger des sous-titres...';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Rechercher avec le plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Télécharger des sous-titres';

  @override
  String get selectedSubtitleInvalid =>
      'Le sous-titre sélectionné n\'est pas valide.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Subtitle downloaded and selected: $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Sous-titre téléchargé. Il peut mettre un moment à apparaître pendant que Jellyfin actualise l\'élément.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'No remote subtitles found for $language.';
  }

  @override
  String get selectVersion => 'Choisir une version';

  @override
  String versionNumber(int number) {
    return 'Version $number';
  }

  @override
  String get downloadAllQuality => 'Tout télécharger — Qualité';

  @override
  String get downloadQuality => 'Qualité du téléchargement';

  @override
  String get originalFileNoReencoding => 'Fichier original, sans réencodage';

  @override
  String get originalFilesNoReencoding => 'Fichiers originaux, sans réencodage';

  @override
  String get noEpisodesLoaded => 'Aucun épisode chargé';

  @override
  String downloadingItem(String name, String quality) {
    return 'Downloading $name ($quality)...';
  }

  @override
  String get deleteDownloadedFiles => 'Supprimer les fichiers téléchargés';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Delete local files for $typeLabel?\n\nThis will free up storage space. You can re-download later.';
  }

  @override
  String get downloadedFilesDeleted => 'Fichiers téléchargés supprimés';

  @override
  String get failedToDeleteFiles => 'Échec de la suppression des fichiers';

  @override
  String get deleteFiles => 'Supprimer les fichiers';

  @override
  String get director => 'RÉALISATEUR';

  @override
  String get writers => 'SCÉNARISTES';

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
  String get showLess => 'Voir moins';

  @override
  String get readMore => 'Lire plus';

  @override
  String get shuffle => 'Aléatoire';

  @override
  String downloadsCount(int count) {
    return '$count downloads';
  }

  @override
  String get perfectMatch => 'Correspondance parfaite';

  @override
  String channelsCount(int count) {
    return '${count}ch';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stéréo';

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
      'tous les épisodes téléchargés de cette saison';

  @override
  String get stillWatching => 'Vous regardez encore ?';

  @override
  String get unableToLoadTrailerStream =>
      'Impossible de charger le flux de la bande-annonce.';

  @override
  String get trailerTimedOut =>
      'Délai d\'attente dépassé lors du chargement de la bande-annonce.';

  @override
  String get playbackFailedForTrailer =>
      'La lecture de cette bande-annonce a échoué.';

  @override
  String photoCountOf(int current, int total) {
    return '$current / $total';
  }

  @override
  String get castingUnavailableOffline =>
      'La diffusion n\'est pas disponible pendant la lecture hors ligne.';

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
  String get deviceVolume => 'Volume de l\'appareil';

  @override
  String get unavailable => 'Indisponible';

  @override
  String get pause => 'Pause';

  @override
  String get syncPosition => 'Synchroniser la position';

  @override
  String stopCast(String label) {
    return 'Stop $label';
  }

  @override
  String get queueIsEmpty => 'La file d\'attente est vide';

  @override
  String trackNumber(int number) {
    return 'Track $number';
  }

  @override
  String get remotePlayback => 'Lecture à distance';

  @override
  String get castingToGoogleCast => 'Diffusion vers Google Cast';

  @override
  String get castingViaAirPlay => 'Diffusion via AirPlay';

  @override
  String get castingViaDlna => 'Diffusion via DLNA';

  @override
  String secondsCount(int seconds) {
    return '$seconds seconds';
  }

  @override
  String get longPressToUnlock => 'Appui long pour déverrouiller';

  @override
  String get off => 'Désactivé';

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
  String get bitrateOverride => 'Débit forcé';

  @override
  String get audioDelay => 'Décalage audio';

  @override
  String delayMinusMs(int value) {
    return '-${value}ms';
  }

  @override
  String delayPlusMs(int value) {
    return '+${value}ms';
  }

  @override
  String get subtitleDelay => 'Décalage des sous-titres';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get unknown => 'Inconnu';

  @override
  String get playbackInformation => 'Informations de lecture';

  @override
  String get playback => 'Lecture';

  @override
  String get playMethod => 'Méthode de lecture';

  @override
  String get directPlay => 'Lecture directe';

  @override
  String get directStream => 'Flux direct';

  @override
  String get transcoding => 'Transcodage';

  @override
  String get transcodeReasons => 'Raisons du transcodage';

  @override
  String get player => 'Lecteur';

  @override
  String get container => 'Conteneur';

  @override
  String get bitrate => 'Débit';

  @override
  String get video => 'Vidéo';

  @override
  String get resolution => 'Résolution';

  @override
  String get hdr => 'HDR';

  @override
  String get codec => 'Codec';

  @override
  String get videoBitrate => 'Débit vidéo';

  @override
  String get track => 'Piste';

  @override
  String get channels => 'Canaux';

  @override
  String get audioBitrate => 'Débit audio';

  @override
  String get sampleRate => 'Fréquence d\'échantillonnage';

  @override
  String get format => 'Format';

  @override
  String get external => 'Externe';

  @override
  String get embedded => 'Intégré';

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
      'Le rendu EPUB intégré n\'est pas encore disponible sur cette plateforme.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'This format (.$extension) cannot be rendered in-app yet.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Le rendu intégré des documents n\'est pas disponible sur cette plateforme.';

  @override
  String get couldNotOpenExternalViewer =>
      'Impossible d\'ouvrir la visionneuse externe.';

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
      'Aucun signet pour le moment.\nTouchez l\'icône de signet pendant la lecture pour enregistrer votre position.';

  @override
  String get noTableOfContentsAvailable =>
      'Aucune table des matières disponible';

  @override
  String pageLabel(int number) {
    return 'Page $number';
  }

  @override
  String get position => 'Position';

  @override
  String get bookReader => 'Lecteur de livres';

  @override
  String formatExtension(String extension) {
    return 'Format: .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% read';
  }

  @override
  String get updating => 'Mise à jour...';

  @override
  String get markUnread => 'Marquer comme non lu';

  @override
  String get markAsRead => 'Marquer comme lu';

  @override
  String get reloadReader => 'Recharger le lecteur';

  @override
  String get noPagesFound => 'Aucune page trouvée.';

  @override
  String get failedToDecodePageImage =>
      'Impossible de décoder l\'image de la page.';

  @override
  String resetZoom(String zoom) {
    return 'Reset Zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Page simple';

  @override
  String get twoPageSpread => 'Double page';

  @override
  String get addBookmark => 'Ajouter un signet';

  @override
  String get bookmarksEllipsis => 'Signets...';

  @override
  String get markedAsRead => 'Marqué comme lu';

  @override
  String get markedAsUnread => 'Marqué comme non lu';

  @override
  String failedToUpdateReadState(String error) {
    return 'Failed to update read state: $error';
  }

  @override
  String get themeSystem => 'Thème : Système';

  @override
  String get themeLight => 'Thème : Clair';

  @override
  String get themeDark => 'Thème : Sombre';

  @override
  String get themeSepia => 'Thème : Sépia';

  @override
  String get invertColorsFixedLayout =>
      'Inverser les couleurs (mise en page fixe)';

  @override
  String get invertColorsPdf => 'Inverser les couleurs (PDF)';

  @override
  String get preparingInAppReader => 'Préparation du lecteur intégré...';

  @override
  String get pdfDataNotAvailable => 'Données PDF indisponibles.';

  @override
  String get readerFallbackModeActive => 'Mode de secours du lecteur activé';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'This platform cannot host the embedded document engine for $extension files.';
  }

  @override
  String get reloadReaderPlatformHint =>
      'Utilisez « Recharger le lecteur » après être passé à une plateforme prise en charge (Android, iOS, macOS).';

  @override
  String get openExternally => 'Ouvrir à l’extérieur';

  @override
  String get noEpubChaptersFound => 'Aucun chapitre EPUB trouvé.';

  @override
  String get readerNotReady => 'Lecteur non prêt.';

  @override
  String get seriesRecordings => 'Enregistrements de séries';

  @override
  String get now => 'Maintenant';

  @override
  String get sports => 'Sportif';

  @override
  String get news => 'Actualités';

  @override
  String get kids => 'Enfants';

  @override
  String get premiere => 'Première';

  @override
  String get guideTimeline => 'Frise du guide';

  @override
  String failedToLoadGuide(String error) {
    return 'Failed to load guide: $error';
  }

  @override
  String get noChannelsFound => 'Aucune chaîne trouvée';

  @override
  String get liveBadge => 'EN DIRECT';

  @override
  String get movie => 'Film';

  @override
  String get removedFromFavoriteChannels => 'Retiré des chaînes favorites';

  @override
  String get addedToFavoriteChannels => 'Ajouté aux chaînes favorites';

  @override
  String get failedToUpdateFavoriteChannel =>
      'Échec de la mise à jour de la chaîne favorite';

  @override
  String get unfavoriteChannel => 'Retirer des favoris';

  @override
  String get favoriteChannel => 'Ajouter aux favoris';

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
  String get watch => 'Regarder';

  @override
  String get close => 'Fermer';

  @override
  String failedToPlayChannel(String name) {
    return 'Failed to play $name';
  }

  @override
  String get failedToLoadRecordings =>
      'Échec du chargement des enregistrements';

  @override
  String get scheduledInNext24Hours => 'Prévu dans les 24 prochaines heures';

  @override
  String get recentRecordings => 'Enregistrements récents';

  @override
  String get tvSeries => 'Séries TV';

  @override
  String get failedToLoadSchedule => 'Échec du chargement de la programmation';

  @override
  String get noScheduledRecordings => 'Aucun enregistrement programmé';

  @override
  String get cancelRecording => 'Annuler l’enregistrement ?';

  @override
  String cancelScheduledRecordingOf(String name) {
    return 'Cancel scheduled recording of \"$name\"?';
  }

  @override
  String get no => 'Non';

  @override
  String get yesCancel => 'Oui, annuler';

  @override
  String get failedToCancelRecording =>
      'Échec de l’annulation de l’enregistrement';

  @override
  String get failedToLoadSeriesRecordings =>
      'Échec du chargement des enregistrements de séries';

  @override
  String get noSeriesRecordings => 'Aucun enregistrement de série';

  @override
  String get cancelSeriesRecording => 'Annuler l’enregistrement de la série';

  @override
  String get cancelSeriesRecordingQuestion =>
      'Annuler l’enregistrement de la série ?';

  @override
  String stopRecordingName(String name) {
    return 'Stop recording \"$name\"?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Échec de l’annulation de l’enregistrement de la série';

  @override
  String get searchThisLibrary => 'Rechercher dans cette bibliothèque...';

  @override
  String get searchEllipsis => 'Rechercher...';

  @override
  String noResultsForQuery(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Search failed: $error';
  }

  @override
  String get seerr => 'Voyant';

  @override
  String get seerrAccountType => 'Type de compte Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Locale';

  @override
  String get savedMedia => 'Médias enregistrés';

  @override
  String get tvShows => 'Séries TV';

  @override
  String get music => 'Musique';

  @override
  String get musicAlbums => 'Albums musicaux';

  @override
  String get noMediaInFilter => 'Aucun média dans ce filtre';

  @override
  String get noDownloadedMediaYet => 'Aucun média téléchargé pour le moment';

  @override
  String get browseLibrary => 'Parcourir la bibliothèque';

  @override
  String get deleteDownload => 'Supprimer le téléchargement';

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
  String get playAlbum => 'Lire l’album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Failed to load album: $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'No downloaded tracks found for $name.';
  }

  @override
  String get season => 'Saison';

  @override
  String get errorLoadingEpisodes => 'Erreur lors du chargement des épisodes';

  @override
  String get noDownloadedEpisodes => 'Aucun épisode téléchargé';

  @override
  String get deleteEpisode => 'Supprimer l’épisode';

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
  String get seriesNotFound => 'Série introuvable';

  @override
  String get errorLoadingSeries => 'Erreur lors du chargement de la série';

  @override
  String get downloadedEpisodes => 'Épisodes téléchargés';

  @override
  String seasonNumber(int number) {
    return 'Season $number';
  }

  @override
  String seasonChip(int number) {
    return 'S$number';
  }

  @override
  String get specials => 'Spéciaux';

  @override
  String get deleteSeason => 'Supprimer la saison';

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
  String get storageManagement => 'Gestion du stockage';

  @override
  String get storageBreakdown => 'Répartition du stockage';

  @override
  String get downloadedItems => 'Éléments téléchargés';

  @override
  String get storageLimit => 'Limite de stockage';

  @override
  String get noLimit => 'Aucune limite';

  @override
  String get deleteAllDownloads => 'Supprimer tous les téléchargements';

  @override
  String get deleteAllDownloadsWarning =>
      'Cela supprimera tous les fichiers média téléchargés et ne pourra pas être annulé.';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get deleteSelected => 'Supprimer la sélection';

  @override
  String deleteSelectedCount(int count) {
    return 'Delete $count downloaded items?';
  }

  @override
  String get musicAndAudiobooks => 'Musique et livres audio';

  @override
  String get images => 'Images';

  @override
  String get database => 'Base de données';

  @override
  String ofStorageLimit(String limit) {
    return 'of $limit limit';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get authentication => 'Authentification';

  @override
  String get autoLoginServerManagement =>
      'Connexion auto, gestion des serveurs';

  @override
  String get pinCode => 'Code PIN';

  @override
  String get setUpPinCodeProtection => 'Configurer la protection par code PIN';

  @override
  String get parentalControls => 'Contrôle parental';

  @override
  String get contentRatingRestrictions => 'Restrictions de classification';

  @override
  String get bitRateResolutionBehavior => 'Débit, résolution, comportement';

  @override
  String get languageSizeAppearance => 'Langue, taille, apparence';

  @override
  String get qualityStorage => 'Qualité, stockage';

  @override
  String get serverSyncAndPluginStatus =>
      'Synchro du serveur et statut du plugin';

  @override
  String get mediaRequestIntegration => 'Intégration des demandes de médias';

  @override
  String get switchServer => 'Changer de serveur';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get versionLicenses => 'Version, licences';

  @override
  String get account => 'Compte';

  @override
  String get signInAndSecurity => 'Connexion et sécurité';

  @override
  String get administration => 'Administration';

  @override
  String get serverSettingsUsersLibraries =>
      'Paramètres serveur, utilisateurs, bibliothèques';

  @override
  String get customization => 'Personnalisation';

  @override
  String get themeAndLayout => 'Thème et mise en page';

  @override
  String get videoAndSubtitles => 'Vidéo et sous-titres';

  @override
  String get integrations => 'Intégrations';

  @override
  String get pluginAndRequests => 'Plugin et demandes';

  @override
  String get customizeAccountPlaybackInterface =>
      'Personnaliser le compte, la lecture et le comportement de l’interface';

  @override
  String optionsCount(int count) {
    return '$count options';
  }

  @override
  String get themeAndAppearance => 'Thème et apparence';

  @override
  String get focusBorderColor => 'Couleur de bordure du focus';

  @override
  String get watchedIndicators => 'Indicateurs de visionnage';

  @override
  String get always => 'Toujours';

  @override
  String get hideUnwatched => 'Masquer les non vus';

  @override
  String get episodesOnly => 'Épisodes uniquement';

  @override
  String get never => 'Jamais';

  @override
  String get focusExpansionAnimation => 'Animation d’agrandissement du focus';

  @override
  String get desktopUiScale => 'Échelle de l\'interface utilisateur de bureau';

  @override
  String get scaleFocusedCards =>
      'Agrandir les cartes et vignettes focalisées ou survolées';

  @override
  String get backgroundBackdrops => 'Arrière-plans illustrés';

  @override
  String get showBackdropImages =>
      'Afficher des images d’arrière-plan derrière le contenu';

  @override
  String get seriesThumbnails => 'Vignettes de séries';

  @override
  String get seriesThumbnailsDescription =>
      'Épisodes uniquement : utiliser l’illustration de la série correspondant au type d’image de chaque rangée';

  @override
  String get homeRowInfoOverlay =>
      'Superposition d’infos des rangées d’accueil';

  @override
  String get showTitleMetadataOnHomeRows =>
      'Afficher le titre et les métadonnées lors de la navigation sur l’accueil';

  @override
  String get clockDisplay => 'Affichage de l’horloge';

  @override
  String get inMenus => 'Dans les menus';

  @override
  String get inVideo => 'Dans la vidéo';

  @override
  String get seasonalEffects => 'Effets saisonniers';

  @override
  String get seasonalEffectsDescription =>
      'Effets visuels et décorations saisonnières';

  @override
  String get snow => 'Neige';

  @override
  String get fireworks => 'Feux d’artifice';

  @override
  String get confetti => 'Confettis';

  @override
  String get fallingLeaves => 'Feuilles tombantes';

  @override
  String get themeMusic => 'Musique du thème';

  @override
  String get playThemeMusicOnDetailPages =>
      'Lire la musique du thème sur les pages de détails';

  @override
  String get themeMusicVolume => 'Volume de la musique du thème';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Musique du thème sur l’accueil';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Lire lors de la navigation sur l’écran d’accueil';

  @override
  String get detailsBackgroundBlur => 'Flou d’arrière-plan des détails';

  @override
  String pixelValue(int value) {
    return '${value}px';
  }

  @override
  String get browsingBackgroundBlur => 'Flou d’arrière-plan de navigation';

  @override
  String get maxStreamingBitrate => 'Débit maximal en streaming';

  @override
  String get maxResolution => 'Résolution maximale';

  @override
  String get playerZoomMode => 'Mode de zoom du lecteur';

  @override
  String get fit => 'Ajuster';

  @override
  String get autoCrop => 'Recadrage auto';

  @override
  String get stretch => 'Étirer';

  @override
  String get refreshRateSwitching =>
      'Changement de fréquence de rafraîchissement';

  @override
  String get disabled => 'Désactivé';

  @override
  String get scaleOnTv => 'Mise à l’échelle sur TV';

  @override
  String get scaleOnDevice => 'Mise à l’échelle sur l’appareil';

  @override
  String get trickPlay => 'Aperçu de lecture';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Afficher les vignettes d’aperçu pendant la recherche';

  @override
  String get showDescriptionOnPause => 'Afficher la description en pause';

  @override
  String get dimVideoShowOverview =>
      'Assombrir la vidéo et afficher le résumé en pause';

  @override
  String get osdLockButton => 'Bouton de verrouillage OSD';

  @override
  String get osdLockButtonDescription =>
      'Afficher un bouton de verrouillage qui bloque les touches tactiles jusqu’à un appui long';

  @override
  String get audioBehavior => 'Comportement audio';

  @override
  String get downmixToStereo => 'Mixer en stéréo';

  @override
  String get defaultAudioLanguage => 'Langue audio par défaut';

  @override
  String get autoServerDefault => 'Auto (par défaut du serveur)';

  @override
  String get english => 'Anglais';

  @override
  String get spanish => 'Espagnol';

  @override
  String get french => 'Français';

  @override
  String get german => 'Allemand';

  @override
  String get italian => 'Italien';

  @override
  String get portuguese => 'Portugais';

  @override
  String get japanese => 'Japonais';

  @override
  String get korean => 'Coréen';

  @override
  String get chinese => 'Chinois';

  @override
  String get russian => 'Russe';

  @override
  String get arabic => 'Arabe';

  @override
  String get hindi => 'hindi';

  @override
  String get dutch => 'Néerlandais';

  @override
  String get swedish => 'Suédois';

  @override
  String get norwegian => 'Norvégien';

  @override
  String get danish => 'Danois';

  @override
  String get finnish => 'Finnois';

  @override
  String get polish => 'Polonais';

  @override
  String get ac3Passthrough => 'Pass-through AC3';

  @override
  String get dtsPassthrough => 'Passage DTS';

  @override
  String get trueHdSupport => 'Prise en charge de TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Audio Bitstream DTS vers AVR uniquement ; nécessite la prise en charge du récepteur et la piste source DTS';

  @override
  String get enableTrueHdAudio =>
      'Activer l’audio TrueHD (peut ne pas fonctionner sur toutes les plateformes)';

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
  String get nightMode => 'Mode nuit';

  @override
  String get compressDynamicRange => 'Compresser la plage dynamique';

  @override
  String get advancedMpv => 'mpv avancé';

  @override
  String get enableCustomMpvConf => 'Activer le mpv.conf personnalisé';

  @override
  String get applyMpvConfBeforePlayback =>
      'Appliquer un mpv.conf défini par l’utilisateur avant le début de la lecture';

  @override
  String get unsafeAdvancedMpvOptions => 'Options mpv avancées non sécurisées';

  @override
  String get unsafeMpvOptionsDescription =>
      'Autoriser un ensemble plus large d’options mpv. Peut perturber la lecture.';

  @override
  String get hardwareDecoding => 'Décodage matériel';

  @override
  String get hardwareDecodingSubtitle =>
      'Peut améliorer les performances mais peut entraîner des problèmes de lecture sur certains appareils.';

  @override
  String get nextUpAndQueuing => 'À suivre et file d’attente';

  @override
  String get nextUpDisplay => 'Comportement d’À suivre';

  @override
  String get extended => 'Étendu';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Délai d’À suivre';

  @override
  String secondsValue(int value) {
    return '${value}s';
  }

  @override
  String get mediaQueuing => 'Mise en file des médias';

  @override
  String get autoQueueNextEpisodes =>
      'Mettre automatiquement les épisodes suivants en file d’attente';

  @override
  String get stillWatchingPrompt => 'Invite « Vous regardez toujours ? »';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'After $episodes episodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Reprendre et sauter';

  @override
  String get resumeRewind => 'Retour arrière à la reprise';

  @override
  String get unpauseRewind => 'Reprendre le rembobinage';

  @override
  String get fiveSeconds => '5 secondes';

  @override
  String get tenSeconds => '10 secondes';

  @override
  String get fifteenSeconds => '15 secondes';

  @override
  String get thirtySeconds => '30 secondes';

  @override
  String get skipBackLength => 'Durée du retour arrière';

  @override
  String get skipForwardLength => 'Durée de l’avance';

  @override
  String get customMpvConfPath => 'Chemin du mpv.conf personnalisé';

  @override
  String get notSetMpvConf =>
      'Non défini. Moonfin tentera d’utiliser un mpv.conf par défaut dans les dossiers app/data.';

  @override
  String get selectMpvConf => 'Sélectionner mpv.conf';

  @override
  String get pathToMpvConf => '/chemin/vers/mpv.conf';

  @override
  String get subtitleStyleDescription =>
      'Les réglages de style (taille, couleur, décalage) s’appliquent aux sous-titres textuels (SRT, VTT, TTML). Les sous-titres ASS/SSA utilisent leur propre style intégré sauf si « Lecture directe ASS/SSA » est désactivé. Les sous-titres bitmap (PGS, DVB, VobSub) ne peuvent pas être restylés.';

  @override
  String get defaultSubtitleLanguage => 'Langue des sous-titres par défaut';

  @override
  String get defaultToNoSubtitles => 'Aucun sous-titre par défaut';

  @override
  String get turnOffSubtitlesByDefault =>
      'Désactiver les sous-titres par défaut';

  @override
  String get subtitleSize => 'Taille des sous-titres';

  @override
  String get textFillColor => 'Couleur de remplissage du texte';

  @override
  String get backgroundColor => 'Couleur d’arrière-plan';

  @override
  String get textStrokeColor => 'Couleur du contour du texte';

  @override
  String get subtitleCustomization => 'Personnalisation des sous-titres';

  @override
  String get subtitleCustomizationDescription =>
      'Personnaliser l\'apparence des sous-titres';

  @override
  String get subtitlePreviewText =>
      'Le renard brun rapide saute par-dessus le chien paresseux';

  @override
  String get verticalOffset => 'Décalage vertical';

  @override
  String get pgsDirectPlay => 'Lecture directe PGS';

  @override
  String get directPlayPgsSubtitles => 'Lire directement les sous-titres PGS';

  @override
  String get assSsaDirectPlay => 'Lecture directe ASS/SSA';

  @override
  String get directPlayAssSsaSubtitles =>
      'Lire directement les sous-titres ASS/SSA';

  @override
  String get white => 'Blanc';

  @override
  String get black => 'Noir';

  @override
  String get yellow => 'Jaune';

  @override
  String get green => 'Vert';

  @override
  String get cyan => 'Cyan';

  @override
  String get red => 'Rouge';

  @override
  String get transparent => 'Transparent';

  @override
  String get semiTransparentBlack => 'Noir semi-transparent';

  @override
  String get global => 'Mondial';

  @override
  String get desktop => 'Bureau';

  @override
  String get mobile => 'Mobile';

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
  String get customizationProfile => 'Profil de personnalisation';

  @override
  String get customizationProfileDescription =>
      'Choisissez le profil à charger, modifier et synchroniser. Global s’applique partout sauf si un profil d’appareil le remplace. Le point vert indique le profil de votre appareil actuel.';

  @override
  String get loadProfile => 'Charger le profil';

  @override
  String get syncing => 'Synchronisation...';

  @override
  String get syncToProfile => 'Synchroniser vers le profil';

  @override
  String get profileSyncHidden => 'Synchronisation de profil masquée';

  @override
  String get enablePluginSyncDescription =>
      'Activez la synchronisation du plugin serveur dans les paramètres du plugin pour afficher ici les contrôles du profil.';

  @override
  String get quality => 'Qualité';

  @override
  String get defaultDownloadQuality => 'Qualité de téléchargement par défaut';

  @override
  String get network => 'Réseau';

  @override
  String get wifiOnlyDownloads => 'Téléchargements Wi‑Fi uniquement';

  @override
  String get onlyDownloadOnWifi => 'Télécharger uniquement en Wi‑Fi';

  @override
  String get storage => 'Stockage';

  @override
  String get storageUsed => 'Stockage utilisé';

  @override
  String get manage => 'Gérer';

  @override
  String get calculating => 'Calcul...';

  @override
  String get downloadLocation => 'Emplacement de téléchargement';

  @override
  String get defaultLabel => 'Par défaut';

  @override
  String get saveToDownloadsFolder =>
      'Enregistrer dans le dossier Téléchargements';

  @override
  String get downloadsVisibleToOtherApps =>
      'Téléchargements/Moonfin — visible pour les autres applications';

  @override
  String get dangerZone => 'Zone dangereuse';

  @override
  String get clearAllDownloads => 'Supprimer tous les téléchargements';

  @override
  String get original => 'Original';

  @override
  String get changeDownloadLocation =>
      'Changer l’emplacement de téléchargement';

  @override
  String get changeDownloadLocationDescription =>
      'Les nouveaux téléchargements seront enregistrés dans le dossier sélectionné. Les téléchargements existants resteront à leur emplacement actuel et pourront être gérés dans les paramètres de stockage.';

  @override
  String get confirm => 'Confirmer';

  @override
  String get cannotWriteToFolder =>
      'Impossible d’écrire dans le dossier sélectionné. Choisissez un autre emplacement ou accordez les autorisations de stockage.';

  @override
  String get saveToDownloadsFolderQuestion =>
      'Enregistrer dans le dossier Téléchargements ?';

  @override
  String get saveToDownloadsFolderDescription =>
      'Les médias téléchargés seront enregistrés dans Téléchargements/Moonfin sur votre appareil. Ces fichiers seront visibles par d’autres applications, comme votre galerie ou votre lecteur de musique.\n\nLes téléchargements existants resteront à leur emplacement actuel.';

  @override
  String get enable => 'Activer';

  @override
  String get clearAllDownloadsWarning =>
      'Cela supprimera tous les médias téléchargés et ne peut pas être annulé.';

  @override
  String get clearAll => 'Tout supprimer';

  @override
  String get navigationStyle => 'Style de navigation';

  @override
  String get topBar => 'Barre supérieure';

  @override
  String get leftSidebar => 'Barre latérale gauche';

  @override
  String get showShuffleButton => 'Afficher le bouton Aléatoire';

  @override
  String get showGenresButton => 'Afficher le bouton Genres';

  @override
  String get showFavoritesButton => 'Afficher le bouton Favoris';

  @override
  String get showLibrariesInToolbar =>
      'Afficher les bibliothèques dans la barre d’outils';

  @override
  String get navbarOpacity => 'Opacité de la barre de navigation';

  @override
  String get navbarColor => 'Couleur de la barre de navigation';

  @override
  String get gray => 'Gris';

  @override
  String get darkBlue => 'Bleu foncé';

  @override
  String get purple => 'Violet';

  @override
  String get teal => 'Bleu canard';

  @override
  String get navy => 'Bleu marine';

  @override
  String get charcoal => 'Anthracite';

  @override
  String get brown => 'Marron';

  @override
  String get darkRed => 'Rouge foncé';

  @override
  String get darkGreen => 'Vert foncé';

  @override
  String get slate => 'Ardoise';

  @override
  String get indigo => 'Indigo';

  @override
  String get libraryDisplay => 'Affichage de la bibliothèque';

  @override
  String get posterLabel => 'Affiche';

  @override
  String get thumbnailLabel => 'Miniature';

  @override
  String get bannerLabel => 'Bannière';

  @override
  String get overridePerLibrarySettings =>
      'Remplacer les paramètres par bibliothèque';

  @override
  String get applyImageTypeToAllLibraries =>
      'Appliquer le type d’image à toutes les bibliothèques';

  @override
  String get multiServerLibraries => 'Bibliothèques multi-serveurs';

  @override
  String get showLibrariesFromAllServers =>
      'Afficher les bibliothèques de tous les serveurs connectés';

  @override
  String get enableFolderView => 'Activer la vue dossiers';

  @override
  String get showFolderBrowsingOption =>
      'Afficher l’option de navigation par dossiers';

  @override
  String get libraryVisibility => 'Visibilité de la bibliothèque';

  @override
  String get libraryVisibilityDescription =>
      'Basculez la visibilité de la page d\'accueil par bibliothèque. Redémarrez Moonfin pour que les modifications prennent effet.';

  @override
  String get showInNavigation => 'Afficher dans la navigation';

  @override
  String get showInLatestMedia => 'Afficher dans Derniers médias';

  @override
  String get sourceLibraries => 'Bibliothèques sources';

  @override
  String get sourceCollections => 'Collections sources';

  @override
  String get excludedGenres => 'Genres exclus';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String itemsSelected(int count) {
    return '$count selected';
  }

  @override
  String get mediaBar => 'Barre média';

  @override
  String get mediaSources => 'Sources médiatiques';

  @override
  String get behavior => 'Comportement';

  @override
  String get seconds => 'secondes';

  @override
  String get localPreviews => 'Aperçus locaux';

  @override
  String get localPreviewsDescription =>
      'Configurez les aperçus de la bande-annonce, des médias et de l\'audio.';

  @override
  String get mediaBarMode => 'Style de la barre média';

  @override
  String get mediaBarModeDescription =>
      'Choisissez Moonfin, MakD ou desactivez la barre media';

  @override
  String get mediaBarModeMoonfin => 'Aileron de lune';

  @override
  String get mediaBarModeMakd => 'MakD';

  @override
  String get mediaBarModeOff => 'Desactive';

  @override
  String get enableMediaBar => 'Activer la barre média';

  @override
  String get showFeaturedContentSlideshow =>
      'Afficher le diaporama du contenu à la une sur l’accueil';

  @override
  String get contentType => 'Type de contenu';

  @override
  String get moviesAndTvShows => 'Films et séries TV';

  @override
  String get moviesOnly => 'Films uniquement';

  @override
  String get tvShowsOnly => 'Séries TV uniquement';

  @override
  String get itemCount => 'Nombre d’éléments';

  @override
  String get noneSelected => 'Aucune sélection';

  @override
  String get noneExcluded => 'Aucune exclusion';

  @override
  String get autoAdvance => 'Avance automatique';

  @override
  String get autoAdvanceSlides =>
      'Passer automatiquement à la diapositive suivante';

  @override
  String get autoAdvanceInterval => 'Intervalle d’avance automatique';

  @override
  String get trailerPreview => 'Aperçu de bande-annonce';

  @override
  String get autoPlayTrailers =>
      'Lire automatiquement les bandes-annonces dans la barre média après 3 secondes';

  @override
  String get episodePreview => 'Aperçu d’épisode';

  @override
  String get mediaPreview => 'Aperçu des médias';

  @override
  String get episodePreviewDescription =>
      'Lire un aperçu intégré de 30 secondes sur les cartes ciblées, survolées ou maintenues';

  @override
  String get mediaPreviewDescription =>
      'Jouez un aperçu en ligne de 30 secondes sur des cartes ciblées, survolées ou enfoncées longuement';

  @override
  String get previewAudio => 'Audio de l’aperçu';

  @override
  String get enablePreviewAudio =>
      'Activer l’audio pour les aperçus de bandes-annonces et d’épisodes';

  @override
  String get latestMedia => 'Derniers médias';

  @override
  String get recentlyReleased => 'Récemment sortis';

  @override
  String get myMedia => 'Mes médias';

  @override
  String get myMediaSmall => 'Mes médias (petit)';

  @override
  String get continueWatching => 'Continuer à regarder';

  @override
  String get resumeAudio => 'Reprendre l’audio';

  @override
  String get resumeBooks => 'Reprendre les livres';

  @override
  String get activeRecordings => 'Enregistrements actifs';

  @override
  String get playlists => 'Listes de lecture';

  @override
  String get liveTV => 'TV en direct';

  @override
  String get homeSections => 'Sections de l’accueil';

  @override
  String get resetToDefaults => 'Réinitialiser aux valeurs par défaut';

  @override
  String get homeRowPosterSize => 'Taille des affiches des rangées d’accueil';

  @override
  String get perRowImageTypeSelection => 'Sélection du type d’image par rangée';

  @override
  String get configureImageTypeForEachRow =>
      'Configurer le type d’image pour chaque rangée d’accueil activée';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Fusionner Continuer à regarder et À suivre';

  @override
  String get combineBothRows =>
      'Combiner les deux rangées en une seule section d’accueil';

  @override
  String get perRowImageType => 'Type d’image par rangée';

  @override
  String get perRowSettings => 'Paramètres par rangée';

  @override
  String get autoLogin => 'Connexion automatique';

  @override
  String get lastUser => 'Dernier utilisateur';

  @override
  String get specificUser => 'Utilisateur spécifique';

  @override
  String get alwaysAuthenticate => 'Toujours s’authentifier';

  @override
  String get requirePasswordWithToken =>
      'Exiger le mot de passe même avec un jeton enregistré';

  @override
  String get confirmExit => 'Confirmer la sortie';

  @override
  String get showConfirmationBeforeExiting =>
      'Afficher une confirmation avant de quitter';

  @override
  String get blockContentWithRatings =>
      'Bloquer le contenu avec les classifications suivantes :';

  @override
  String get noContentRatingsFound =>
      'Aucune classification de contenu n’a encore été trouvée sur ce serveur.';

  @override
  String get couldNotLoadServerRatings =>
      'Impossible de charger les classifications du serveur. Affichage des classifications enregistrées uniquement.';

  @override
  String get couldNotRefreshRatings =>
      'Impossible d’actualiser les classifications depuis le serveur. Affichage des classifications enregistrées.';

  @override
  String get enablePinCode => 'Activer le code PIN';

  @override
  String get requirePinToAccess =>
      'Exiger un code PIN pour accéder à votre compte';

  @override
  String get changePin => 'Modifier le PIN';

  @override
  String get setNewPinCode => 'Définir un nouveau code PIN';

  @override
  String get removePin => 'Supprimer le PIN';

  @override
  String get removePinProtection => 'Supprimer la protection par code PIN';

  @override
  String get screensaver => 'Économiseur d’écran';

  @override
  String get inAppScreensaver => 'Économiseur d’écran intégré';

  @override
  String get enableBuiltInScreensaver =>
      'Activer l’économiseur d’écran intégré';

  @override
  String get mode => 'Mode';

  @override
  String get libraryArt => 'Illustrations de bibliothèque';

  @override
  String get logo => 'Logo';

  @override
  String get clock => 'Horloge';

  @override
  String get timeout => 'Délai';

  @override
  String minutesShort(int minutes) {
    return '$minutes min';
  }

  @override
  String get dimmingLevel => 'Niveau d’assombrissement';

  @override
  String get maxAgeRating => 'Classification d’âge maximale';

  @override
  String get any => 'Tous';

  @override
  String agePlusValue(int age) {
    return '$age+';
  }

  @override
  String get requireAgeRating => 'Exiger une classification d’âge';

  @override
  String get onlyShowRatedContent => 'Afficher uniquement le contenu classifié';

  @override
  String get showClock => 'Afficher l’horloge';

  @override
  String get displayClockDuringScreensaver =>
      'Afficher l’horloge pendant l’économiseur d’écran';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Critiques)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Public)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'BDTM';

  @override
  String get metacritic => 'Métacritique';

  @override
  String get metacriticUser => 'Metacritic (utilisateurs)';

  @override
  String get trakt => 'Trakt';

  @override
  String get letterboxd => 'Boîte aux lettres';

  @override
  String get myAnimeList => 'MaListeAnime';

  @override
  String get aniList => 'Liste d\'anis';

  @override
  String get communityRating => 'Note de la communauté';

  @override
  String get ratings => 'Notes';

  @override
  String get additionalRatings => 'Notes supplémentaires';

  @override
  String get showMdbListAndTmdbRatings => 'Afficher les notes MDBList et TMDB';

  @override
  String get ratingLabels => 'Libellés des notes';

  @override
  String get showLabelsNextToIcons =>
      'Afficher les libellés à côté des icônes de note';

  @override
  String get ratingBadges => 'Badges de note';

  @override
  String get showDecorativeBadges =>
      'Afficher des badges décoratifs derrière les notes';

  @override
  String get episodeRatings => 'Notes des épisodes';

  @override
  String get showRatingsOnEpisodes => 'Afficher les notes sur chaque épisode';

  @override
  String get ratingSources => 'Sources des notes';

  @override
  String get ratingSourcesDescription =>
      'Activer et réorganiser les sources de notes affichées dans l’app';

  @override
  String get pluginLabel => 'Plugin';

  @override
  String get pluginDetected => 'Plugin détecté';

  @override
  String get pluginNotDetected => 'Plugin non détecté';

  @override
  String get pluginDetectedDescription =>
      'Plugin serveur détecté. La synchronisation est activée automatiquement la première fois que le plugin est trouvé.';

  @override
  String get pluginNotDetectedDescription =>
      'Le plugin serveur n’est pas détecté actuellement. Les paramètres locaux utilisent toujours leurs valeurs enregistrées ou les valeurs par défaut intégrées.';

  @override
  String pluginStatusVersion(String status, String version) {
    return '$status\nVersion: $version';
  }

  @override
  String get availableServices => 'Services disponibles';

  @override
  String get serverPluginSync => 'Synchronisation du plugin serveur';

  @override
  String get syncSettingsWithPlugin =>
      'Synchroniser les paramètres avec le plugin serveur';

  @override
  String get whatSyncControls => 'Ce que contrôle la synchro';

  @override
  String get syncControlsDescription =>
      'La synchro contrôle seulement l’envoi et la récupération des paramètres pris en charge par le plugin sur le serveur. La sélection du profil et les actions de synchronisation du profil se trouvent dans les paramètres de personnalisation quand la synchro du plugin est activée.';

  @override
  String get recentRequests => 'Demandes récentes';

  @override
  String get recentlyAdded => 'Ajouts récents';

  @override
  String get trending => 'Tendances';

  @override
  String get popularMovies => 'Films populaires';

  @override
  String get movieGenres => 'Genres de films';

  @override
  String get upcomingMovies => 'Films à venir';

  @override
  String get studios => 'Ateliers';

  @override
  String get popularSeries => 'Séries populaires';

  @override
  String get seriesGenres => 'Genres de séries';

  @override
  String get upcomingSeries => 'Séries à venir';

  @override
  String get networks => 'Chaînes';

  @override
  String get resetRowsToDefaults => 'Réinitialiser les lignes par défaut';

  @override
  String get enableSeerr => 'Activer Seerr';

  @override
  String get showSeerrInNavigation =>
      'Afficher Seerr dans la navigation (plugin serveur requis)';

  @override
  String get seerrUnavailable =>
      'Indisponible, car la prise en charge de Seerr par le plugin serveur est désactivée.';

  @override
  String get nsfwFilter => 'Filtre NSFW';

  @override
  String get hideAdultContent => 'Masquer le contenu adulte dans les résultats';

  @override
  String loggedInAs(String username) {
    return 'Logged in as: $username';
  }

  @override
  String get discoverRows => 'Lignes de découverte';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Faites glisser pour réorganiser. Activez ou désactivez les lignes. L’ordre des lignes activées se synchronise avec le plugin Moonfin.';

  @override
  String get discoverRowsDescription =>
      'Faites glisser pour réorganiser. Activez ou désactivez les lignes.';

  @override
  String get enabled => 'Activé';

  @override
  String get hidden => 'Masqué';

  @override
  String get aboutTitle => 'À propos';

  @override
  String versionValue(String version) {
    return 'Version $version';
  }

  @override
  String get openSourceLicenses => 'Licences open source';

  @override
  String get sourceCode => 'Code source';

  @override
  String get sourceCodeUrl =>
      'https://github.com/Moonfin-Client/Mobile-Desktop';

  @override
  String get checkForUpdatesNow => 'Vérifier les mises à jour';

  @override
  String get checksLatestDesktopRelease =>
      'Vérifie la dernière version desktop pour cette plateforme';

  @override
  String get youAreUpToDate => 'Vous êtes à jour.';

  @override
  String get couldNotCheckForUpdates =>
      'Impossible de vérifier les mises à jour pour le moment.';

  @override
  String get noCompatibleUpdate =>
      'Aucun paquet de mise à jour compatible trouvé pour cette plateforme.';

  @override
  String get updateChecksNotSupported =>
      'La vérification des mises à jour n’est pas prise en charge sur cette plateforme.';

  @override
  String get updateNotificationsDisabled =>
      'Les notifications de mise à jour sont désactivées.';

  @override
  String get pleaseWaitBeforeChecking =>
      'Veuillez attendre avant de vérifier à nouveau.';

  @override
  String get latestUpdateAlreadyShown =>
      'La dernière mise à jour a déjà été affichée.';

  @override
  String get updateAvailable => 'Mise à jour disponible.';

  @override
  String updateAvailableVersion(String version) {
    return 'Update available: v$version';
  }

  @override
  String get updateNotifications => 'Notifications de mise à jour';

  @override
  String get showWhenUpdatesAvailable =>
      'Afficher quand des mises à jour sont disponibles';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Available';
  }

  @override
  String get readReleaseNotes => 'Lire les notes de version';

  @override
  String get downloadingUpdate => 'Téléchargement de la mise à jour...';

  @override
  String get updateDownloadFailed =>
      'Le téléchargement de la mise à jour a échoué. Veuillez réessayer.';

  @override
  String get openReleasesPage => 'Page des versions ouvertes';

  @override
  String get navigation => 'Navigation';

  @override
  String get watchedIndicatorsBackdrops => 'Indicateurs vus, arrière-plans';

  @override
  String get focusColorWatchedIndicatorsBackdrops =>
      'Couleur de focus, indicateurs vus, arrière-plans';

  @override
  String get navbarStyleToolbarAppearance =>
      'Style de la barre de navigation, boutons de la barre d’outils, apparence';

  @override
  String get reorderToggleHomeRows =>
      'Réorganiser et afficher/masquer les lignes d’accueil';

  @override
  String get featuredContentAppearance => 'Contenu à la une, apparence';

  @override
  String get posterSizeImageTypeFolderView =>
      'Taille des affiches, type d’image, vue des dossiers';

  @override
  String get mdbListTmdbRatingSources => 'MDBList, TMDB et sources des notes';

  @override
  String gbValue(String value) {
    return '$value GB';
  }

  @override
  String get clear => 'Effacer';

  @override
  String get browse => 'Parcourir';

  @override
  String get noResults => 'Aucun résultat';

  @override
  String get seerrAvailableStatus => 'Disponible';

  @override
  String get seerrRequestedStatus => 'Demandé';

  @override
  String itemsCount(int count) {
    return '$count Items';
  }

  @override
  String get seerrSettings => 'Paramètres Seerr';

  @override
  String get requestMore => 'Demander plus';

  @override
  String get request => 'Demander';

  @override
  String get cancelRequest => 'Annuler la demande';

  @override
  String get playInMoonfin => 'Lire dans Moonfin';

  @override
  String requestedByName(String name) {
    return 'Requested by $name';
  }

  @override
  String get approve => 'Approuver';

  @override
  String get declineAction => 'Refuser';

  @override
  String get similar => 'Similaires';

  @override
  String get recommendations => 'Recommandations';

  @override
  String cancelRequestForTitle(String title) {
    return 'Cancel request for \"$title\"?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Cancel $count requests for \"$title\"?';
  }

  @override
  String get keep => 'Conserver';

  @override
  String get itemNotFoundInLibrary =>
      'Élément introuvable dans votre bibliothèque Moonfin';

  @override
  String get errorSearchingLibrary =>
      'Erreur lors de la recherche dans la bibliothèque';

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
  String get submitRequest => 'Envoyer la demande';

  @override
  String get allSeasons => 'Toutes les saisons';

  @override
  String get advancedOptions => 'Options avancées';

  @override
  String get noServiceServersConfigured => 'Aucun serveur de service configuré';

  @override
  String get server => 'Serveur';

  @override
  String get qualityProfile => 'Profil de qualité';

  @override
  String get rootFolder => 'Dossier racine';

  @override
  String get showMore => 'Afficher plus';

  @override
  String get appearances => 'Apparitions';

  @override
  String get crewSection => 'Équipe';

  @override
  String ageValue(int age) {
    return 'age $age';
  }

  @override
  String get noRequests => 'Aucune demande';

  @override
  String get pendingStatus => 'En attente';

  @override
  String get declinedStatus => 'Refusé';

  @override
  String get partiallyAvailable => 'Partiellement disponible';

  @override
  String get downloadingStatus => 'Téléchargement';

  @override
  String get approvedStatus => 'Approuvé';

  @override
  String get notRequestedStatus => 'Non demandé';

  @override
  String get blocklistedStatus => 'Sur liste bloquée';

  @override
  String get deletedStatus => 'Supprimé';

  @override
  String get tmdbScore => 'Score TMDB';

  @override
  String get releaseDateLabel => 'Date de sortie';

  @override
  String get firstAirDateLabel => 'Première date de diffusion';

  @override
  String get revenueLabel => 'Revenu';

  @override
  String get runtimeLabel => 'Durée d\'exécution';

  @override
  String get budgetLabel => 'Budget';

  @override
  String get originalLanguageLabel => 'Langue originale';

  @override
  String get seasonsLabel => 'Saisons';

  @override
  String get episodesLabel => 'Épisodes';

  @override
  String get access => 'Accès';

  @override
  String get add => 'Ajouter';

  @override
  String get address => 'Adresse';

  @override
  String get analytics => 'Analyses';

  @override
  String get catalog => 'Catalogue';

  @override
  String get content => 'Contenu';

  @override
  String get copy => 'Copier';

  @override
  String get create => 'Créer';

  @override
  String get disable => 'Désactiver';

  @override
  String get done => 'Terminé';

  @override
  String get edit => 'Modifier';

  @override
  String get encoding => 'Encodage';

  @override
  String get error => 'Erreur';

  @override
  String get forward => 'Avancer';

  @override
  String get general => 'Général';

  @override
  String get go => 'Aller';

  @override
  String get install => 'Installer';

  @override
  String get installed => 'Installé';

  @override
  String get interval => 'Intervalle';

  @override
  String get name => 'Nom';

  @override
  String get networking => 'Réseau';

  @override
  String get next => 'Suivant';

  @override
  String get path => 'Chemin';

  @override
  String get paused => 'En pause';

  @override
  String get permissions => 'Autorisations';

  @override
  String get processing => 'Traitement';

  @override
  String get profile => 'Profil';

  @override
  String get provider => 'Fournisseur';

  @override
  String get refresh => 'Actualiser';

  @override
  String get remote => 'À distance';

  @override
  String get rename => 'Renommer';

  @override
  String get revoke => 'Révoquer';

  @override
  String get role => 'Rôle';

  @override
  String get root => 'Racine';

  @override
  String get run => 'Exécuter';

  @override
  String get search => 'Rechercher';

  @override
  String get select => 'Sélectionner';

  @override
  String get send => 'Envoyer';

  @override
  String get sessions => 'Séances';

  @override
  String get set => 'Définir';

  @override
  String get status => 'Statut';

  @override
  String get stop => 'Arrêter';

  @override
  String get streaming => 'Streaming';

  @override
  String get time => 'Heure';

  @override
  String get trickplay => 'Jeu de trucs';

  @override
  String get uninstall => 'Désinstaller';

  @override
  String get up => 'Haut';

  @override
  String get update => 'Mettre à jour';

  @override
  String get upload => 'Téléverser';

  @override
  String get unmute => 'Activer le son';

  @override
  String get mute => 'Couper le son';

  @override
  String get branding => 'Image de marque';

  @override
  String get adminDrawerDashboard => 'Tableau de bord';

  @override
  String get adminDrawerAnalytics => 'Analyses';

  @override
  String get adminDrawerSettings => 'Paramètres';

  @override
  String get adminDrawerBranding => 'Image de marque';

  @override
  String get adminDrawerUsers => 'Utilisateurs';

  @override
  String get adminDrawerLibraries => 'Bibliothèques';

  @override
  String get adminDrawerTranscoding => 'Transcodage';

  @override
  String get adminDrawerResume => 'Reprise';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Jeu de trucs';

  @override
  String get adminDrawerDevices => 'Appareils';

  @override
  String get adminDrawerActivity => 'Activité';

  @override
  String get adminDrawerNetworking => 'Réseau';

  @override
  String get adminDrawerApiKeys => 'Clés API';

  @override
  String get adminDrawerBackups => 'Sauvegardes';

  @override
  String get adminDrawerLogs => 'Journaux';

  @override
  String get adminDrawerScheduledTasks => 'Tâches planifiées';

  @override
  String get adminDrawerPlugins => 'Plugins';

  @override
  String get adminDrawerRepositories => 'Dépôts';

  @override
  String get adminDrawerLiveTv => 'TV en direct';

  @override
  String get adminExitTooltip => 'Quitter l’admin';

  @override
  String get adminDashboardLoadFailed =>
      'Impossible de charger le tableau de bord';

  @override
  String get adminMediaOverview => 'Vue d’ensemble des médias';

  @override
  String get adminMediaTotalsError =>
      'Impossible de charger les totaux des médias du serveur.';

  @override
  String get adminMediaOverviewSubtitle =>
      'Un aperçu rapide du volume de contenu sur ce serveur.';

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
  String get analyticsMediaDistribution => 'Répartition des médias';

  @override
  String get analyticsVideoCodecs => 'Codecs vidéo';

  @override
  String get analyticsAudioCodecs => 'Codecs audio';

  @override
  String get analyticsContainers => 'Conteneurs';

  @override
  String get analyticsTopGenres => 'Genres principaux';

  @override
  String get analyticsReleaseYears => 'Années de sortie';

  @override
  String get analyticsContentRatings => 'Classifications du contenu';

  @override
  String get analyticsRuntimeBuckets => 'Plages de durée';

  @override
  String get analyticsFileFormats => 'Formats de fichier';

  @override
  String get analyticsNoData => 'Aucune donnée disponible.';

  @override
  String get adminServerInfo => 'Infos serveur';

  @override
  String get adminRestartPending => 'Redémarrage en attente';

  @override
  String get adminServerPaths => 'Chemins du serveur';

  @override
  String get adminServerActions => 'Actions du serveur';

  @override
  String get adminRestartServer => 'Redémarrer le serveur';

  @override
  String get adminShutdownServer => 'Arrêter le serveur';

  @override
  String get adminScanLibraries => 'Analyser les bibliothèques';

  @override
  String get adminLibraryScanStarted => 'Analyse de la bibliothèque lancée';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String get adminServerRebootInProgress => 'Redémarrage du serveur en cours';

  @override
  String get adminServerRebootMessage =>
      'Redémarrage du serveur en cours, veuillez redémarrer Moonfin';

  @override
  String get adminActiveSessions => 'Sessions actives';

  @override
  String get adminSessionsLoadFailed => 'Échec du chargement des sessions';

  @override
  String get adminNoActiveSessions => 'Aucune session active';

  @override
  String get adminRecentActivity => 'Activité récente';

  @override
  String get adminNoRecentActivity => 'Aucune activité récente';

  @override
  String adminCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get adminSendMessage => 'Envoyer un message';

  @override
  String get adminMessageTextHint => 'Texte du message';

  @override
  String get adminSetVolume => 'Régler le volume';

  @override
  String get sessionPrev => 'Préc.';

  @override
  String get sessionRewind => 'Retour rapide';

  @override
  String get sessionForward => 'Avance rapide';

  @override
  String get sessionNext => 'Suiv.';

  @override
  String get sessionVolumeDown => 'Vol –';

  @override
  String get sessionVolumeUp => 'Vol +';

  @override
  String get uhd4k => '4K';

  @override
  String get nowPlaying => 'Lecture en cours';

  @override
  String get volume => 'Volume';

  @override
  String get actions => 'Actes';

  @override
  String get videoCodec => 'Codec vidéo';

  @override
  String get audioCodec => 'Codec audio';

  @override
  String get hwAccel => 'Accél. matérielle';

  @override
  String get completion => 'Progression';

  @override
  String get direct => 'Direct';

  @override
  String get adminDisconnect => 'Déconnecter';

  @override
  String get adminClearDates => 'Effacer les dates';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Failed to load activity log: $error';
  }

  @override
  String get adminNoActivityEntries => 'Aucune entrée d\'activité';

  @override
  String get adminEditDeviceName => 'Modifier le nom de l\'appareil';

  @override
  String get adminCustomName => 'Nom personnalisé';

  @override
  String get adminDeviceNameUpdated => 'Nom de l\'appareil mis à jour';

  @override
  String adminDeviceUpdateFailed(String error) {
    return 'Failed to update device: $error';
  }

  @override
  String get adminDeleteDevice => 'Supprimer l\'appareil';

  @override
  String get adminDeviceDeleted => 'Appareil supprimé';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Failed to delete device: $error';
  }

  @override
  String get adminDevicesLoadFailed => 'Échec du chargement des appareils';

  @override
  String get adminSearchDevices => 'Rechercher des appareils';

  @override
  String get adminThisDevice => 'Cet appareil';

  @override
  String get adminEditName => 'Modifier le nom';

  @override
  String get adminLibrariesLoadFailed =>
      'Échec du chargement des bibliothèques';

  @override
  String get adminNoLibraries => 'Aucune bibliothèque configurée';

  @override
  String get adminScanAllLibraries => 'Analyser toutes les bibliothèques';

  @override
  String get adminAddLibrary => 'Ajouter une bibliothèque';

  @override
  String adminScanFailed(String error) {
    return 'Failed to start scan: $error';
  }

  @override
  String get adminRenameLibrary => 'Renommer la bibliothèque';

  @override
  String get adminNewName => 'Nouveau nom';

  @override
  String adminLibraryRenamed(String name) {
    return 'Library renamed to \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Failed to rename: $error';
  }

  @override
  String get adminDeleteLibrary => 'Supprimer la bibliothèque';

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
  String get adminRemovePath => 'Supprimer le chemin';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Remove \"$path\" from this library?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Failed to remove path: $error';
  }

  @override
  String get adminLibraryOptionsSaved =>
      'Options de la bibliothèque enregistrées';

  @override
  String adminLibraryOptionsSaveFailed(String error) {
    return 'Failed to save options: $error';
  }

  @override
  String get adminLibraryLoadFailed => 'Échec du chargement de la bibliothèque';

  @override
  String get adminNoMediaPaths => 'Aucun chemin multimédia configuré';

  @override
  String get adminAddPath => 'Ajouter un chemin';

  @override
  String get adminBrowseFilesystem =>
      'Parcourir le système de fichiers du serveur :';

  @override
  String get adminSaveOptions => 'Enregistrer les options';

  @override
  String get adminPreferredMetadataLanguage =>
      'Langue préférée des métadonnées';

  @override
  String get adminMetadataLanguageHint => 'ex. : en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Code pays des métadonnées';

  @override
  String get adminMetadataCountryHint => 'ex. : US, DE, FR';

  @override
  String get adminLibraryNameRequired => 'Le nom de la bibliothèque est requis';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Failed to create library: $error';
  }

  @override
  String get adminLibraryName => 'Nom de la bibliothèque';

  @override
  String get adminSelectedPaths => 'Chemins sélectionnés :';

  @override
  String get adminNoPathsAdded =>
      'Aucun chemin ajouté (vous pourrez en ajouter plus tard)';

  @override
  String get adminCreateLibrary => 'Créer une bibliothèque';

  @override
  String get paths => 'Chemins :';

  @override
  String get adminDisableUser => 'Désactiver l\'utilisateur';

  @override
  String get adminEnableUser => 'Activer l\'utilisateur';

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
  String get adminUsersLoadFailed => 'Échec du chargement des utilisateurs';

  @override
  String get adminSearchUsers => 'Rechercher des utilisateurs';

  @override
  String get adminEditUser => 'Modifier l\'utilisateur';

  @override
  String get adminAddUser => 'Ajouter un utilisateur';

  @override
  String adminUserCreateFailed(String error) {
    return 'Failed to create user: $error';
  }

  @override
  String get adminCreateUser => 'Créer un utilisateur';

  @override
  String get adminPasswordOptional => 'Mot de passe (facultatif)';

  @override
  String get adminUsernameRequired =>
      'Le nom d\'utilisateur ne peut pas être vide';

  @override
  String get adminNoProfileChanges =>
      'Aucune modification du profil à enregistrer';

  @override
  String get adminProfileSaved => 'Profil enregistré';

  @override
  String adminSaveFailed(String error) {
    return 'Failed to save: $error';
  }

  @override
  String get adminPermissionsSaved => 'Autorisations enregistrées';

  @override
  String get adminPasswordsMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String adminFailed(String error) {
    return 'Failed: $error';
  }

  @override
  String get adminUserLoadFailed => 'Échec du chargement de l\'utilisateur';

  @override
  String get adminBackToUsers => 'Retour aux utilisateurs';

  @override
  String get adminSaveProfile => 'Enregistrer le profil';

  @override
  String get adminDeleteUser => 'Supprimer l\'utilisateur';

  @override
  String get admin => 'Administrateur';

  @override
  String get adminFullAccessWarning =>
      'Les administrateurs ont un accès complet au serveur. Accordez ce droit avec prudence.';

  @override
  String get administrator => 'Administrateur';

  @override
  String get adminHiddenUser => 'Utilisateur masqué';

  @override
  String get adminAllowMediaPlayback => 'Autoriser la lecture des médias';

  @override
  String get adminAllowAudioTranscoding => 'Autoriser le transcodage audio';

  @override
  String get adminAllowVideoTranscoding => 'Autoriser le transcodage vidéo';

  @override
  String get adminAllowRemuxing => 'Autoriser le remuxage';

  @override
  String get adminForceRemoteTranscoding =>
      'Forcer le transcodage des sources distantes';

  @override
  String get adminAllowContentDeletion => 'Autoriser la suppression du contenu';

  @override
  String get adminAllowContentDownloading =>
      'Autoriser le téléchargement du contenu';

  @override
  String get adminAllowPublicSharing => 'Autoriser le partage public';

  @override
  String get adminAllowRemoteControl =>
      'Autoriser le contrôle à distance des autres utilisateurs';

  @override
  String get adminAllowSharedDeviceControl =>
      'Autoriser le contrôle des appareils partagés';

  @override
  String get adminAllowRemoteAccess => 'Autoriser l\'accès à distance';

  @override
  String get adminRemoteBitrateLimit =>
      'Limite de débit du client distant (bps)';

  @override
  String get adminLeaveEmptyNoLimit => 'Laisser vide pour aucune limite';

  @override
  String get adminMaxActiveSessions => 'Nombre max. de sessions actives';

  @override
  String get adminAllowLiveTvAccess => 'Autoriser l\'accès à la TV en direct';

  @override
  String get adminAllowLiveTvManagement =>
      'Autoriser la gestion de la TV en direct';

  @override
  String get adminAllowCollectionManagement =>
      'Autoriser la gestion des collections';

  @override
  String get adminAllowSubtitleManagement =>
      'Autoriser la gestion des sous-titres';

  @override
  String get adminAllowLyricManagement => 'Autoriser la gestion des paroles';

  @override
  String get adminSavePermissions => 'Enregistrer les autorisations';

  @override
  String get adminEnableAllLibraryAccess =>
      'Activer l\'accès à toutes les bibliothèques';

  @override
  String get adminSaveAccess => 'Enregistrer l\'accès';

  @override
  String get adminChangePassword => 'Changer le mot de passe';

  @override
  String get adminNewPassword => 'Nouveau mot de passe';

  @override
  String get adminConfirmPassword => 'Confirmer le mot de passe';

  @override
  String get adminSetPassword => 'Définir le mot de passe';

  @override
  String get adminResetPassword => 'Réinitialiser le mot de passe';

  @override
  String get adminPasswordReset => 'Réinitialisation du mot de passe';

  @override
  String get adminPasswordUpdated => 'Mot de passe mis à jour';

  @override
  String get adminUserSettings => 'Paramètres utilisateur';

  @override
  String get adminLibraryAccess => 'Accès à la bibliothèque';

  @override
  String get adminDeviceAndChannelAccess =>
      'Accès aux appareils et aux chaînes';

  @override
  String get adminEnableAllDevices => 'Activer l\'accès à tous les appareils';

  @override
  String get adminEnableAllChannels => 'Activer l\'accès à toutes les chaînes';

  @override
  String get adminResetPasswordWarning =>
      'Cela supprimera le mot de passe. L\'utilisateur pourra se connecter sans mot de passe.';

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
  String get adminCreateApiKey => 'Créer une clé API';

  @override
  String get adminAppName => 'Nom de l\'application';

  @override
  String get adminApiKeyCreated => 'Clé API créée';

  @override
  String get adminApiKeyCreatedNoToken =>
      'Clé créée avec succès. Le serveur n\'a pas renvoyé le jeton. Vérifiez les clés API du serveur.';

  @override
  String get adminKeyCopied => 'Clé copiée dans le presse-papiers';

  @override
  String adminApiKeyCreateFailed(String error) {
    return 'Failed to create key: $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Jeton de clé absent dans la réponse du serveur';

  @override
  String get adminRevokeApiKey => 'Révoquer la clé API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Revoke key for $name?';
  }

  @override
  String get adminApiKeyRevoked => 'Clé API révoquée';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Failed to revoke key: $error';
  }

  @override
  String get adminApiKeysLoadFailed => 'Échec du chargement des clés API';

  @override
  String get adminApiKeysTitle => 'Clés API';

  @override
  String get adminCreateKey => 'Créer une clé';

  @override
  String get adminNoApiKeys => 'Aucune clé API trouvée';

  @override
  String get adminUnknownApp => 'Application inconnue';

  @override
  String adminApiKeyTokenCreated(String token, String created) {
    return 'Token: $token\\nCreated: $created';
  }

  @override
  String get adminCreatingBackup => 'Création de la sauvegarde...';

  @override
  String get adminBackupCreated => 'Sauvegarde créée avec succès';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Failed to create backup: $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Chemin de sauvegarde absent dans la réponse du serveur';

  @override
  String adminBackupManifest(String name) {
    return 'Manifest: $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Failed to load manifest: $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmer la restauration';

  @override
  String get adminRestoringBackup => 'Restauration de la sauvegarde...';

  @override
  String adminRestoreFailed(String error) {
    return 'Failed to restore backup: $error';
  }

  @override
  String get adminBackupsLoadFailed => 'Échec du chargement des sauvegardes';

  @override
  String get adminCreateBackup => 'Créer une sauvegarde';

  @override
  String get adminNoBackups => 'Aucune sauvegarde trouvée';

  @override
  String get adminViewDetails => 'Voir les détails';

  @override
  String get restore => 'Restaurer';

  @override
  String get adminLogsLoadFailed =>
      'Échec du chargement des journaux du serveur';

  @override
  String get adminNoLogFiles => 'Aucun fichier journal trouvé';

  @override
  String get adminLogCopied => 'Journal copié dans le presse-papiers';

  @override
  String get adminSaveLogFile => 'Enregistrer le fichier journal';

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
  String get adminSearchInLog => 'Rechercher dans le journal';

  @override
  String get adminNoMatchingLines => 'Aucune ligne correspondante';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Failed to load tasks: $error';
  }

  @override
  String get adminNoScheduledTasks => 'Aucune tâche planifiée trouvée';

  @override
  String get adminNoTasksMatchFilter =>
      'Aucune tâche ne correspond au filtre actuel';

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
  String get adminRunNow => 'Exécuter maintenant';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Failed to remove trigger: $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Failed to add trigger: $error';
  }

  @override
  String get adminLastExecution => 'Dernière exécution';

  @override
  String get adminTriggers => 'Déclencheurs';

  @override
  String get adminAddTrigger => 'Ajouter un déclencheur';

  @override
  String get adminNoTriggers => 'Aucun déclencheur configuré';

  @override
  String get adminTriggerType => 'Type de déclencheur';

  @override
  String get adminTimeLimit => 'Limite de temps (facultatif)';

  @override
  String get adminNoLimit => 'Aucune limite';

  @override
  String adminHours(String hours) {
    return '$hours hour(s)';
  }

  @override
  String get adminDayOfWeek => 'Jour de la semaine';

  @override
  String get adminSearchPlugins => 'Rechercher des plugins...';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Failed to toggle plugin: $error';
  }

  @override
  String get adminUninstallPlugin => 'Désinstaller le plugin';

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
      'Aucun plugin ne correspond à votre recherche';

  @override
  String get adminNoPluginsInstalled => 'Aucun plugin installé';

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
      'Aucun paquet ne correspond à votre recherche';

  @override
  String get adminNoPackagesAvailable => 'Aucun paquet disponible';

  @override
  String get adminExperimentalIntegration => 'Intégration expérimentale';

  @override
  String get adminExperimentalWarning =>
      'L\'intégration des paramètres des plugins est encore expérimentale. Certaines pages peuvent ne pas s\'afficher correctement.';

  @override
  String get continueAction => 'Continuer';

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
      'Impossible d\'ouvrir les paramètres : jeton d\'authentification manquant.';

  @override
  String adminPluginLoadFailed(String error) {
    return 'Failed to load plugin: $error';
  }

  @override
  String get adminPluginNotFound => 'Plugin introuvable';

  @override
  String adminPluginVersion(String version) {
    return 'Version $version';
  }

  @override
  String get adminEnablePlugin => 'Activer le plugin';

  @override
  String get adminPluginSettingsPage => 'Page des paramètres du plugin';

  @override
  String get adminRevisionHistory => 'Historique des révisions';

  @override
  String get adminNoChangelog => 'Aucun journal des modifications disponible.';

  @override
  String get adminRemoveRepository => 'Supprimer le dépôt';

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
  String get adminRepositoryNameHint => 'ex. Jellyfin Stable';

  @override
  String get adminRepositoryUrl => 'URL du dépôt';

  @override
  String get adminAddEntry => 'Ajouter une entrée';

  @override
  String get adminInvalidUrl => 'URL invalide';

  @override
  String adminPluginSettingsLoadFailed(String error) {
    return 'Unable to load plugin settings: $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Could not open $uri';
  }

  @override
  String get adminOpenInBrowser => 'Ouvrir dans le navigateur';

  @override
  String get adminOpenExternally => 'Ouvrir en externe';

  @override
  String get adminGeneralSettings => 'Paramètres généraux';

  @override
  String get adminServerName => 'Nom du serveur';

  @override
  String get adminPreferredMetadataCountry =>
      'Pays préféré pour les métadonnées';

  @override
  String get adminCachePath => 'Chemin du cache';

  @override
  String get adminMetadataPath => 'Chemin des métadonnées';

  @override
  String get adminLibraryScanConcurrency =>
      'Parallélisme d\'analyse de la médiathèque';

  @override
  String get adminParallelImageEncodingLimit =>
      'Limite d\'encodage d\'images en parallèle';

  @override
  String get adminSlowResponseThreshold => 'Seuil de réponse lente (ms)';

  @override
  String get adminBrandingSaved => 'Paramètres de marque enregistrés';

  @override
  String get adminBrandingLoadFailed =>
      'Impossible de charger les paramètres de marque';

  @override
  String get adminLoginDisclaimer => 'Avertissement de connexion';

  @override
  String get adminLoginDisclaimerHint =>
      'HTML affiché sous le formulaire de connexion';

  @override
  String get adminCustomCss => 'CSS personnalisé';

  @override
  String get adminCustomCssHint =>
      'CSS personnalisé appliqué à l\'interface web';

  @override
  String get adminEnableSplashScreen => 'Activer l\'écran de démarrage';

  @override
  String get adminStreamingSaved => 'Paramètres de streaming enregistrés';

  @override
  String get adminStreamingLoadFailed =>
      'Impossible de charger les paramètres de streaming';

  @override
  String get adminStreamingDescription =>
      'Définissez les limites globales de débit du streaming pour les connexions distantes.';

  @override
  String get adminRemoteBitrateLimitMbps =>
      'Limite de débit du client distant (Mbit/s)';

  @override
  String get adminLeaveEmptyForUnlimited => 'Laissez vide ou 0 pour illimité';

  @override
  String get adminPlaybackSaved => 'Paramètres de lecture enregistrés';

  @override
  String get adminPlaybackLoadFailed =>
      'Impossible de charger les paramètres de lecture';

  @override
  String get adminPlaybackTranscoding => 'Lecture / Transcodage';

  @override
  String get adminHardwareAcceleration => 'Accélération matérielle';

  @override
  String get adminVaapiDevice => 'Périphérique VA-API';

  @override
  String get adminEnableHardwareEncoding => 'Activer l\'encodage matériel';

  @override
  String get adminEnableHardwareDecoding =>
      'Activer le décodage matériel pour :';

  @override
  String get adminEncodingThreads => 'Threads d\'encodage';

  @override
  String get adminAutomatic => '0 = automatique';

  @override
  String get adminTranscodingTempPath => 'Chemin temporaire du transcodage';

  @override
  String get adminEnableFallbackFont => 'Activer la police de secours';

  @override
  String get adminFallbackFontPath => 'Chemin de la police de secours';

  @override
  String get adminAllowSegmentDeletion =>
      'Autoriser la suppression des segments';

  @override
  String get adminSegmentKeepSeconds => 'Conservation des segments (secondes)';

  @override
  String get adminThrottleBuffering => 'Limiter la mise en mémoire tampon';

  @override
  String get adminTrickplaySaved => 'Paramètres de trickplay enregistrés';

  @override
  String get adminTrickplayLoadFailed =>
      'Impossible de charger les paramètres de trickplay';

  @override
  String get adminEnableHardwareAcceleration =>
      'Activer l\'accélération matérielle';

  @override
  String get adminEnableKeyFrameExtraction =>
      'Activer l\'extraction des images clés uniquement';

  @override
  String get adminKeyFrameSubtitle => 'Plus rapide mais moins précis';

  @override
  String get adminScanBehavior => 'Comportement de l\'analyse';

  @override
  String get adminProcessPriority => 'Priorité du processus';

  @override
  String get adminImageSettings => 'Paramètres des images';

  @override
  String get adminIntervalMs => 'Intervalle (ms)';

  @override
  String get adminCaptureFrameSubtitle => 'Fréquence de capture des images';

  @override
  String get adminWidthResolutions => 'Résolutions en largeur';

  @override
  String get adminTileWidth => 'Largeur des tuiles';

  @override
  String get adminTileHeight => 'Hauteur des tuiles';

  @override
  String get adminQualitySubtitle =>
      'Valeurs plus faibles = meilleure qualité, fichiers plus volumineux';

  @override
  String get adminProcessThreads => 'Threads du processus';

  @override
  String get adminResumeSaved => 'Paramètres de reprise enregistrés';

  @override
  String get adminResumeLoadFailed =>
      'Impossible de charger les paramètres de reprise';

  @override
  String get adminResumeDescription =>
      'Définissez à quel moment le contenu doit être marqué comme partiellement ou entièrement lu.';

  @override
  String get adminMinResumePercentage => 'Pourcentage minimal de reprise';

  @override
  String get adminMinResumeSubtitle =>
      'Le contenu doit dépasser ce pourcentage pour enregistrer la progression';

  @override
  String get adminMaxResumePercentage => 'Pourcentage maximal de reprise';

  @override
  String get adminMaxResumeSubtitle =>
      'Le contenu est considéré comme entièrement lu après ce pourcentage';

  @override
  String get adminMinResumeDuration => 'Durée minimale de reprise (secondes)';

  @override
  String get adminMinResumeDurationSubtitle =>
      'Les éléments plus courts ne peuvent pas être repris';

  @override
  String get adminMinAudiobookResume =>
      'Pourcentage minimal de reprise des livres audio';

  @override
  String get adminMaxAudiobookResume =>
      'Pourcentage maximal de reprise des livres audio';

  @override
  String get adminNetworkingSaved =>
      'Paramètres réseau enregistrés. Un redémarrage du serveur peut être nécessaire.';

  @override
  String get adminNetworkingLoadFailed =>
      'Impossible de charger les paramètres réseau';

  @override
  String get adminNetworkingWarning =>
      'Les modifications des paramètres réseau peuvent nécessiter un redémarrage du serveur.';

  @override
  String get adminEnableRemoteAccess => 'Activer l\'accès à distance';

  @override
  String get ports => 'Ports';

  @override
  String get adminHttpPort => 'Port HTTP';

  @override
  String get adminHttpsPort => 'Port HTTPS';

  @override
  String get adminPublicHttpsPort => 'Port HTTPS public';

  @override
  String get adminBaseUrl => 'URL de base';

  @override
  String get adminBaseUrlHint => 'ex. /jellyfin';

  @override
  String get https => 'HTTPS';

  @override
  String get adminEnableHttps => 'Activer HTTPS';

  @override
  String get adminLocalNetwork => 'Réseau local';

  @override
  String get adminLocalNetworkAddresses => 'Adresses du réseau local';

  @override
  String get adminKnownProxies => 'Proxys connus';

  @override
  String get adminRemoteIpFilter => 'Filtre d\'IP distantes';

  @override
  String get adminRemoteIpFilterEntries => 'Filtre d\'IP distantes';

  @override
  String get adminCertificatePath => 'Chemin du certificat';

  @override
  String get whitelist => 'Liste blanche';

  @override
  String get blacklist => 'Liste noire';

  @override
  String get notSet => 'Non défini';

  @override
  String get adminMetadataSaved => 'Métadonnées enregistrées';

  @override
  String adminMetadataLoadFailed(String error) {
    return 'Failed to load metadata: $error';
  }

  @override
  String adminMetadataSaveFailed(String error) {
    return 'Failed to save metadata: $error';
  }

  @override
  String get adminRefreshMetadata => 'Actualiser les métadonnées';

  @override
  String get recursive => 'Récursif';

  @override
  String get adminReplaceAllMetadata => 'Remplacer toutes les métadonnées';

  @override
  String get adminReplaceAllImages => 'Remplacer toutes les images';

  @override
  String get adminMetadataRefreshRequested =>
      'Actualisation des métadonnées demandée';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Failed to refresh metadata: $error';
  }

  @override
  String get adminSearchRemotePerson => 'Rechercher une personne distante';

  @override
  String get adminNoRemoteMatches => 'Aucun résultat distant trouvé';

  @override
  String get adminRemoteResults => 'Résultats distants';

  @override
  String get adminRemoteMetadataApplied => 'Métadonnées distantes appliquées';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Remote search failed: $error';
  }

  @override
  String get adminUpdateContentType => 'Mettre à jour le type de contenu';

  @override
  String get adminContentType => 'Type de contenu';

  @override
  String get adminContentTypeUpdated => 'Type de contenu mis à jour';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminMetadataEditorLoadFailed =>
      'Impossible de charger l\'éditeur de métadonnées';

  @override
  String get adminNoPeopleEntries => 'Aucune entrée de personne';

  @override
  String get adminNoExternalIds => 'Aucun ID externe disponible';

  @override
  String adminImageUpdated(String imageType) {
    return '$imageType image updated';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Failed to download image: $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Format d\'image non pris en charge';

  @override
  String get adminImageReadFailed => 'Impossible de lire l\'image sélectionnée';

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
  String get adminAllProviders => 'Tous les fournisseurs';

  @override
  String get adminNoRemoteImages => 'Aucune image distante trouvée';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Tuner discovery failed: $error';
  }

  @override
  String get adminAddTuner => 'Ajouter un tuner';

  @override
  String get adminTunerType => 'Type de tuner';

  @override
  String get adminTunerTypeHint => 'HDHomeRun, M3U, autre';

  @override
  String get adminUrlPath => 'URL / Chemin';

  @override
  String get adminNameOptional => 'Nom (facultatif)';

  @override
  String get adminTunerAdded => 'Tuner ajouté';

  @override
  String adminTunerAddFailed(String error) {
    return 'Failed to add tuner: $error';
  }

  @override
  String get adminAddGuideProvider => 'Ajouter un fournisseur de guide';

  @override
  String get adminProviderType => 'Type de fournisseur';

  @override
  String get adminProviderTypeHint => 'SchedulesDirect ou XMLTV';

  @override
  String get adminUsernameOptional => 'Nom d\'utilisateur (facultatif)';

  @override
  String get adminRefreshInterval => 'Intervalle d\'actualisation (heures)';

  @override
  String get adminProviderAdded => 'Fournisseur ajouté';

  @override
  String adminProviderAddFailed(String error) {
    return 'Failed to add provider: $error';
  }

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Failed to remove tuner: $error';
  }

  @override
  String get adminTunerResetRequested => 'Réinitialisation du tuner demandée';

  @override
  String adminTunerResetFailed(String error) {
    return 'Failed to reset tuner: $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Failed to remove provider: $error';
  }

  @override
  String get adminRecordingSettings => 'Paramètres d\'enregistrement';

  @override
  String get adminPrePadding => 'Marge avant (minutes)';

  @override
  String get adminPostPadding => 'Marge après (minutes)';

  @override
  String get adminRecordingPath => 'Chemin d\'enregistrement';

  @override
  String get adminSeriesRecordingPath => 'Chemin d\'enregistrement des séries';

  @override
  String get adminRecordingSettingsSaved =>
      'Paramètres d\'enregistrement enregistrés';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Failed to save settings: $error';
  }

  @override
  String get adminSetChannelMappings =>
      'Définir les correspondances des chaînes';

  @override
  String get adminMappingJson => 'JSON de correspondance';

  @override
  String get adminMappingJsonHint => 'Exemple : mappages de charge utile JSON';

  @override
  String get adminChannelMappingsUpdated =>
      'Correspondances des chaînes mises à jour';

  @override
  String adminMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String get adminLiveTvLoadFailed =>
      'Impossible de charger l\'administration de la TV en direct';

  @override
  String get adminTunerDevices => 'Périphériques tuner';

  @override
  String get adminNoTunerHosts => 'Aucun hôte tuner configuré';

  @override
  String get adminGuideProviders => 'Fournisseurs de guide';

  @override
  String get adminAddProvider => 'Ajouter un fournisseur';

  @override
  String get adminNoListingProviders => 'Aucun fournisseur de guide configuré';

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
  String get adminTunerDiscovery => 'Détection des tuners';

  @override
  String get adminChannelMappings => 'Mappage des chaînes';

  @override
  String get adminNoDiscoveredTuners => 'Aucun tuner détecté pour l’instant';

  @override
  String get adminSettingsSaved => 'Paramètres enregistrés';

  @override
  String get adminBackupsNotAvailable =>
      'Les sauvegardes ne sont pas disponibles sur cette version du serveur.';

  @override
  String get adminRestoreWarning1 =>
      'La restauration remplacera TOUTES les données actuelles du serveur par celles de la sauvegarde.';

  @override
  String get adminRestoreWarning2 =>
      'Les paramètres, utilisateurs et données de bibliothèque actuels du serveur seront écrasés.';

  @override
  String get adminRestoreWarning3 =>
      'Le serveur redémarrera après la restauration.';

  @override
  String adminRestoreConfirmMessage(String name) {
    return 'Restore backup $name now?';
  }

  @override
  String get adminRestoreRequested =>
      'Restauration demandée. Le redémarrage du serveur peut déconnecter cette session.';

  @override
  String get adminBackupsTitle => 'Sauvegardes';

  @override
  String get adminUnknownDate => 'Date inconnue';

  @override
  String get adminUnnamedBackup => 'Sauvegarde sans nom';

  @override
  String get adminLiveTvNotAvailable =>
      'L’administration de la TV en direct n’est pas disponible sur cette version du serveur.';

  @override
  String get adminLiveTvTitle => 'Administration de la TV en direct';

  @override
  String get adminApply => 'Appliquer';

  @override
  String get adminNotSet => 'Non défini';

  @override
  String get adminReset => 'Réinitialiser';

  @override
  String get adminLogsTitle => 'Journaux du serveur';

  @override
  String get adminLogsNewestFirst => 'Plus récents d’abord';

  @override
  String get adminLogsOldestFirst => 'Plus anciens d’abord';

  @override
  String get adminLogsJustNow => 'À l’instant';

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
  String get adminLogViewerNoMatches => 'Aucune ligne correspondante';

  @override
  String get adminMetadataEditorTitle => 'Éditeur de métadonnées';

  @override
  String get adminMetadataRemote => 'Distant';

  @override
  String get adminMetadataType => 'Taper';

  @override
  String get adminMetadataDetails => 'Détails';

  @override
  String get adminMetadataExternalIds => 'ID externes';

  @override
  String get adminMetadataImages => 'Images';

  @override
  String get adminMetadataFieldTitle => 'Titre';

  @override
  String get adminMetadataFieldSortTitle => 'Titre de tri';

  @override
  String get adminMetadataFieldOriginalTitle => 'Titre original';

  @override
  String get adminMetadataFieldPremiereDate => 'Date de première (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldEndDate => 'Date de fin (YYYY-MM-DD)';

  @override
  String get adminMetadataFieldProductionYear => 'Année de production';

  @override
  String get adminMetadataFieldOfficialRating => 'Classification officielle';

  @override
  String get adminMetadataFieldCommunityRating => 'Note de la communauté';

  @override
  String get adminMetadataFieldCriticRating => 'Note des critiques';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Synopsis';

  @override
  String get adminMetadataGenres => 'Genre';

  @override
  String get adminMetadataTags => 'Balises';

  @override
  String get adminMetadataStudios => 'Ateliers';

  @override
  String get adminMetadataPeople => 'Personnes';

  @override
  String get adminMetadataAddGenre => 'Ajouter un genre';

  @override
  String get adminMetadataAddTag => 'Ajouter un tag';

  @override
  String get adminMetadataAddStudio => 'Ajouter un studio';

  @override
  String get adminMetadataAddPerson => 'Ajouter une personne';

  @override
  String get adminMetadataEditPerson => 'Modifier la personne';

  @override
  String get adminMetadataRole => 'Rôle';

  @override
  String get adminMetadataImagePrimary => 'Principale';

  @override
  String get adminMetadataImageBackdrop => 'Arrière-plan';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Bannière';

  @override
  String get adminMetadataImageThumb => 'Vignette';

  @override
  String get adminMetadataRecursive => 'Récursif';

  @override
  String get adminMetadataProvider => 'Fournisseur';

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
      'Impossible de lire l’image sélectionnée';

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
      'Ceci supprime l’image actuelle de l’élément.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Failed to delete image: $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choose $imageType image';
  }

  @override
  String get adminMetadataUpload => 'Téléverser';

  @override
  String get adminMetadataUpdate => 'Mettre à jour';

  @override
  String get adminMetadataRemoteImage => 'Image distante';

  @override
  String get adminPluginsInstalled => 'Installés';

  @override
  String get adminPluginsCatalog => 'Catalogue';

  @override
  String get adminPluginsActive => 'Actifs';

  @override
  String get adminPluginsRestart => 'Redémarrer';

  @override
  String get adminPluginsNoSearchResults =>
      'Aucun plugin ne correspond à votre recherche';

  @override
  String get adminPluginsNoneInstalled => 'Aucun plugin installé';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Update available: v$version';
  }

  @override
  String get adminPluginsUpdateAvailableGeneric => 'Mise à jour disponible';

  @override
  String get adminPluginsPendingRemoval =>
      'Suppression en attente après redémarrage';

  @override
  String get adminPluginsChangesPending =>
      'Modifications en attente de redémarrage';

  @override
  String get adminPluginsEnable => 'Activer';

  @override
  String get adminPluginsDisable => 'Désactiver';

  @override
  String get adminPluginsInstallUpdate => 'Installer la mise à jour';

  @override
  String adminPluginsInstallUpdateVersioned(String version) {
    return 'Install update (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Aucun paquet ne correspond à votre recherche';

  @override
  String get adminPluginsCatalogEmpty => 'Aucun paquet disponible';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" is being installed...';
  }

  @override
  String get adminPluginDetailExperimental => 'Intégration expérimentale';

  @override
  String get adminPluginDetailExperimentalContent =>
      'L’intégration des paramètres des plugins est encore expérimentale. Certains champs ou mises en page peuvent ne pas encore s’afficher correctement.';

  @override
  String get adminPluginDetailToggle404 =>
      'Impossible d’activer ou désactiver le plugin. Le serveur n’a pas trouvé cette version du plugin. Actualisez les plugins, puis réessayez.';

  @override
  String get adminPluginDetailToggleDioError =>
      'Impossible d’activer ou désactiver le plugin. Consultez les journaux du serveur pour plus de détails.';

  @override
  String adminPluginDetailSettingsTitle(String name) {
    return '$name Settings';
  }

  @override
  String get adminPluginDetailDetails => 'Détails';

  @override
  String get adminPluginDetailDeveloper => 'Développeur';

  @override
  String get adminPluginDetailRepository => 'Dépôt';

  @override
  String get adminPluginDetailBundled => 'Inclus';

  @override
  String get adminPluginDetailEnablePlugin => 'Activer le plugin';

  @override
  String get adminPluginDetailRestartRequired =>
      'Un redémarrage du serveur est nécessaire pour appliquer les modifications.';

  @override
  String get adminPluginDetailRemovalPending =>
      'Ce plugin sera supprimé après le redémarrage du serveur.';

  @override
  String get adminPluginDetailMalfunctioned =>
      'Ce plugin présente un dysfonctionnement et peut ne pas fonctionner correctement.';

  @override
  String get adminPluginDetailNotSupported =>
      'Ce plugin n’est pas pris en charge par la version actuelle du serveur.';

  @override
  String get adminPluginDetailSuperseded =>
      'Ce plugin a été remplacé par une version plus récente.';

  @override
  String adminReposLoadFailed(String error) {
    return 'Failed to load repositories: $error';
  }

  @override
  String get adminReposRemoveTitle => 'Supprimer le dépôt';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Are you sure you want to remove \"$name\"?';
  }

  @override
  String get adminReposRemove => 'Supprimer';

  @override
  String adminReposSaveFailed(String error) {
    return 'Failed to save repositories: $error';
  }

  @override
  String get adminReposEmpty => 'Aucun dépôt configuré';

  @override
  String get adminReposEmptySubtitle =>
      'Ajoutez un dépôt pour parcourir les plugins disponibles';

  @override
  String get adminReposUnnamed => '(sans nom)';

  @override
  String get adminReposEditTitle => 'Modifier le dépôt';

  @override
  String get adminReposAddTitle => 'Ajouter un dépôt';

  @override
  String get adminReposUrl => 'URL du dépôt';

  @override
  String get adminReposNameHint => 'ex. Jellyfin Stable';

  @override
  String get adminPluginSettingsInvalidUrl => 'URL invalide';

  @override
  String get adminGeneralSettingsTitle => 'Paramètres généraux';

  @override
  String get adminGeneralMetadataLanguage => 'Langue de métadonnées préférée';

  @override
  String get adminGeneralMetadataLanguageHint => 'ex. en, de, fr';

  @override
  String get adminGeneralMetadataCountry => 'Pays de métadonnées préféré';

  @override
  String get adminGeneralMetadataCountryHint => 'ex. US, DE, FR';

  @override
  String get adminGeneralLibraryScanConcurrency =>
      'Parallélisme d’analyse de la bibliothèque';

  @override
  String get adminGeneralImageEncodingLimit =>
      'Limite d’encodage d’images en parallèle';

  @override
  String get adminUnknownError => 'Erreur inconnue';

  @override
  String get adminBrowse => 'Parcourir';

  @override
  String get adminCloseBrowser => 'Fermer le navigateur';

  @override
  String get adminNetworkingTitle => 'Réseau';

  @override
  String get adminNetworkingRestartWarning =>
      'Les modifications des paramètres réseau peuvent nécessiter un redémarrage du serveur.';

  @override
  String get adminNetworkingRemoteAccess => 'Activer l’accès à distance';

  @override
  String get adminNetworkingPorts => 'Ports';

  @override
  String get adminNetworkingHttpPort => 'Port HTTP';

  @override
  String get adminNetworkingHttpsPort => 'Port HTTPS';

  @override
  String get adminNetworkingEnableHttps => 'Activer HTTPS';

  @override
  String get adminNetworkingLocalNetwork => 'Réseau local';

  @override
  String get adminNetworkingLocalAddresses => 'Adresses du réseau local';

  @override
  String get adminNetworkingAddressHint => 'ex. 192.168.1.0/24';

  @override
  String get adminNetworkingKnownProxies => 'Proxys connus';

  @override
  String get adminNetworkingProxyHint => 'ex. 10.0.0.1';

  @override
  String get adminNetworkingWhitelist => 'Liste blanche';

  @override
  String get adminNetworkingBlacklist => 'Liste noire';

  @override
  String get adminNetworkingAddEntry => 'Ajouter une entrée';

  @override
  String get adminBrandingTitle => 'Personnalisation';

  @override
  String get adminBrandingLoginDisclaimer => 'Avertissement de connexion';

  @override
  String get adminBrandingLoginDisclaimerHint =>
      'HTML affiché sous le formulaire de connexion';

  @override
  String get adminBrandingCustomCss => 'CSS personnalisé';

  @override
  String get adminBrandingCustomCssHint =>
      'CSS personnalisé appliqué à l’interface web';

  @override
  String get adminBrandingEnableSplash => 'Activer l’écran de démarrage';

  @override
  String get adminPlaybackHwAccel => 'Accélération matérielle';

  @override
  String get adminPlaybackHwAccelLabel => 'Accélération matérielle';

  @override
  String get adminPlaybackEnableHwEncoding => 'Activer l’encodage matériel';

  @override
  String get adminPlaybackEnableHwDecoding =>
      'Activer le décodage matériel pour :';

  @override
  String get adminPlaybackEncoding => 'Encodage';

  @override
  String get adminPlaybackEncodingThreads => 'Threads d’encodage';

  @override
  String get adminPlaybackFallbackFont => 'Activer la police de secours';

  @override
  String get adminPlaybackFallbackFontPath => 'Chemin de la police de secours';

  @override
  String get adminPlaybackStreaming => 'Streaming';

  @override
  String get adminResumeVideo => 'Vidéo';

  @override
  String get adminResumeAudiobooks => 'Livres audio';

  @override
  String get adminResumeMinAudiobookPct =>
      'Pourcentage minimal de reprise des livres audio';

  @override
  String get adminResumeMaxAudiobookPct =>
      'Pourcentage maximal de reprise des livres audio';

  @override
  String get adminStreamingBitrateLimit =>
      'Limite de débit du client distant (Mbps)';

  @override
  String get adminStreamingBitrateLimitHint =>
      'Laisser vide ou 0 pour illimité';

  @override
  String get adminTrickplayHwAccel => 'Activer l’accélération matérielle';

  @override
  String get adminTrickplayHwEncoding => 'Activer l’encodage matériel';

  @override
  String get adminTrickplayKeyFrameOnly =>
      'Activer l’extraction des images clés uniquement';

  @override
  String get adminTrickplayKeyFrameOnlySubtitle =>
      'Plus rapide mais moins précis';

  @override
  String get adminTrickplayNonBlocking => 'Non bloquant';

  @override
  String get adminTrickplayBlocking => 'Bloquant';

  @override
  String get adminTrickplayPriorityHigh => 'Haute';

  @override
  String get adminTrickplayPriorityAboveNormal => 'Supérieure à la normale';

  @override
  String get adminTrickplayPriorityNormal => 'Normale';

  @override
  String get adminTrickplayPriorityBelowNormal => 'Inférieure à la normale';

  @override
  String get adminTrickplayPriorityIdle => 'Inactive';

  @override
  String get adminTrickplayImageSettings => 'Paramètres d’image';

  @override
  String get adminTrickplayInterval => 'Intervalle (ms)';

  @override
  String get adminTrickplayIntervalSubtitle =>
      'Fréquence de capture des images';

  @override
  String get adminTrickplayWidthResolutionsHint =>
      'Largeurs en pixels séparées par des virgules (ex. 320)';

  @override
  String get adminTrickplayQuality => 'Qualité';

  @override
  String get adminTrickplayQScale => 'Échelle de qualité';

  @override
  String get adminTrickplayQScaleSubtitle =>
      'Valeurs plus faibles = meilleure qualité, fichiers plus volumineux';

  @override
  String get adminTrickplayJpegQuality => 'Qualité JPEG';

  @override
  String get adminTrickplayProcessing => 'Traitement';

  @override
  String get adminTasksEmpty => 'Aucune tâche planifiée trouvée';

  @override
  String get adminTasksNoFilterMatch =>
      'Aucune tâche ne correspond au filtre actuel';

  @override
  String get adminTaskCancelling => 'Annulation...';

  @override
  String get adminTaskRunning => 'En cours...';

  @override
  String get adminTaskNeverRun => 'Jamais exécutée';

  @override
  String get adminTaskStop => 'Arrêter';

  @override
  String get adminTaskRun => 'Exécuter';

  @override
  String get adminTaskDetailLastExecution => 'Dernière exécution';

  @override
  String get adminTaskDetailStarted => 'Début';

  @override
  String get adminTaskDetailEnded => 'Fin';

  @override
  String get adminTaskDetailDuration => 'Durée';

  @override
  String get adminTaskDetailErrorLabel => 'Erreur :';

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
  String get adminTaskTriggerStartup => 'Au démarrage de l\'application';

  @override
  String get adminTaskTriggerTypeDaily => 'Quotidien';

  @override
  String get adminTaskTriggerTypeWeekly => 'Hebdomadaire';

  @override
  String get adminTaskTriggerTypeInterval => 'À intervalle régulier';

  @override
  String get adminTaskTriggerIntervalLabel => 'Intervalle';

  @override
  String get adminTaskTriggerEveryHour => 'Toutes les heures';

  @override
  String get adminTaskTriggerEvery6Hours => 'Toutes les 6 heures';

  @override
  String get adminTaskTriggerEvery12Hours => 'Toutes les 12 heures';

  @override
  String get adminTaskTriggerEvery24Hours => 'Toutes les 24 heures';

  @override
  String get adminTaskTriggerEvery2Days => 'Tous les 2 jours';

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
  String get adminTaskTriggerTime => 'Heure';

  @override
  String get adminTaskTriggerNoLimit => 'Sans limite';

  @override
  String get adminActivityJustNow => 'À l\'instant';

  @override
  String get adminActivityLastHour => 'Dernière heure';

  @override
  String get adminActivityToday => 'Aujourd\'hui';

  @override
  String get adminActivityYesterday => 'Hier';

  @override
  String get adminActivityOlder => 'Plus ancien';

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
  String get adminActivityNow => 'maintenant';

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
      'Configurez la génération d\'images trickplay pour les miniatures d\'aperçu lors de la recherche.';

  @override
  String get adminNetworkingPublicHttpsPort => 'Port HTTPS public';

  @override
  String get adminNetworkingBaseUrl => 'URL de base';

  @override
  String get adminNetworkingBaseUrlHint => 'ex. /jellyfin';

  @override
  String get adminNetworkingHttps => 'HTTPS';

  @override
  String get adminNetworkingCertPath => 'Chemin du certificat';

  @override
  String get adminNetworkingRemoteIpFilter => 'Filtre IP distant';

  @override
  String get adminNetworkingRemoteIpFilterLabel => 'Filtre IP distant';

  @override
  String get adminPlaybackVaapiDevice => 'Périphérique VA-API';

  @override
  String get adminPlaybackAutomatic => '0 = automatique';

  @override
  String get adminPlaybackTranscodeTempPath =>
      'Chemin temporaire de transcodage';

  @override
  String get adminPlaybackSegmentDeletion =>
      'Autoriser la suppression des segments';

  @override
  String get adminPlaybackSegmentKeep => 'Conservation des segments (secondes)';

  @override
  String get adminPlaybackThrottleBuffering =>
      'Limiter la mise en mémoire tampon';

  @override
  String get adminResumeMinPct => 'Pourcentage minimum de reprise';

  @override
  String get adminResumeMinPctSubtitle =>
      'Le contenu doit être lu au-delà de ce pourcentage pour enregistrer la progression';

  @override
  String get adminResumeMaxPct => 'Pourcentage maximum de reprise';

  @override
  String get adminResumeMaxPctSubtitle =>
      'Le contenu est considéré comme entièrement lu après ce pourcentage';

  @override
  String get adminResumeMinDuration => 'Durée minimale de reprise (secondes)';

  @override
  String get adminResumeMinDurationSubtitle =>
      'Les éléments plus courts ne peuvent pas être repris';

  @override
  String get adminTrickplayScanBehavior => 'Comportement d\'analyse';

  @override
  String get adminTrickplayProcessPriority => 'Priorité du processus';

  @override
  String get adminTrickplayTileWidth => 'Largeur des tuiles';

  @override
  String get adminTrickplayTileHeight => 'Hauteur des tuiles';

  @override
  String get adminTrickplayProcessThreads => 'Threads du processus';

  @override
  String get adminTrickplayWidthResolutions => 'Résolutions en largeur';

  @override
  String get adminMetadataDefault => 'Par défaut';

  @override
  String get adminMetadataContentTypeUpdated => 'Type de contenu mis à jour';

  @override
  String adminMetadataContentTypeFailed(String error) {
    return 'Failed to update content type: $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Seuil de réponse lente (ms)';

  @override
  String get adminGeneralCachePath => 'Chemin du cache';

  @override
  String get adminGeneralMetadataPath => 'Chemin des métadonnées';

  @override
  String get adminGeneralServerName => 'Nom du serveur';

  @override
  String get adminSettingsLoadFailed => 'Échec du chargement des paramètres';

  @override
  String get adminDiscover => 'Découvrir';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Failed to update mappings: $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Time limit: $duration';
  }

  @override
  String get folders => 'Dossiers';

  @override
  String get libraries => 'Bibliothèques';

  @override
  String get syncPlay => 'SyncPlay';

  @override
  String get syncPlayDisabledTitle => 'SyncPlay désactivé';

  @override
  String get syncPlayDisabledMessage =>
      'Activez SyncPlay dans Paramètres pour utiliser la lecture synchronisée.';

  @override
  String get syncPlayServerUnsupportedTitle => 'Serveur non pris en charge';

  @override
  String get syncPlayServerUnsupportedMessage =>
      'SyncPlay nécessite un serveur Jellyfin. Le serveur actuel ne le prend pas en charge.';

  @override
  String get syncPlayGroupFallbackName => 'Groupe SyncPlay';

  @override
  String get syncPlayGroupTooltip => 'Groupe SyncPlay';

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
  String get syncPlayIgnoreWait => 'Ignorer l\'attente';

  @override
  String get syncPlayIgnoreWaitSubtitle =>
      'Ne retenez pas le groupe pendant que cet appareil est en mémoire tampon';

  @override
  String get syncPlayContinueLocallyNoWait =>
      'Continuez localement sans attendre les membres lents';

  @override
  String get syncPlayRepeat => 'Répéter';

  @override
  String get syncPlayRepeatOne => 'Un';

  @override
  String get syncPlayShuffleModeShuffled => 'Mélange';

  @override
  String get syncPlayShuffleModeSorted => 'Trié';

  @override
  String get syncPlaySyncCurrentQueue =>
      'Synchroniser la file d\'attente de lecture actuelle';

  @override
  String get syncPlaySyncCurrentQueueSubtitle =>
      'Remplacez la file d\'attente du groupe par ce qui est lu localement';

  @override
  String get syncPlayLeaveGroup => 'Quitter le groupe';

  @override
  String get syncPlayGroupQueue => 'File d\'attente de groupe';

  @override
  String syncPlayQueueItemFallback(int index) {
    return 'Item $index';
  }

  @override
  String get syncPlayPlayNow => 'Jouez maintenant';

  @override
  String get syncPlayCreateNewGroup => 'Créer un nouveau groupe';

  @override
  String get syncPlayGroupName => 'Nom du groupe';

  @override
  String get syncPlayDefaultGroupName => 'Mon groupe SyncPlay';

  @override
  String get syncPlayCreateGroup => 'Créer un groupe';

  @override
  String get syncPlayAvailableGroups => 'Groupes disponibles';

  @override
  String get syncPlayNoGroupsAvailable => 'Aucun groupe disponible';

  @override
  String get syncPlayJoinGroupQuestion => 'Rejoindre le groupe SyncPlay ?';

  @override
  String get syncPlayJoinGroupWarning =>
      'Rejoindre un groupe SyncPlay peut remplacer votre file d\'attente de lecture actuelle. Continuer?';

  @override
  String get syncPlayJoin => 'Rejoindre';

  @override
  String get syncPlayStateIdle => 'Inactif';

  @override
  String get syncPlayStateWaiting => 'En attendant';

  @override
  String get syncPlayStatePaused => 'En pause';

  @override
  String get syncPlayStatePlaying => 'Jouant';

  @override
  String syncPlayUserJoinedGroup(String userName) {
    return '$userName joined SyncPlay group';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName left SyncPlay group';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Accès SyncPlay refusé';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Vous n\'avez pas accès à un ou plusieurs éléments de ce groupe SyncPlay. Demandez au propriétaire du groupe de vérifier les autorisations de la bibliothèque ou de choisir une autre file d\'attente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Syncing playback to $groupName';
  }

  @override
  String get voiceSearchUnavailable =>
      'La recherche vocale n\'est pas disponible.';

  @override
  String get dolbyVisionDirectPlayFailedTitle =>
      'Échec de la lecture directe Dolby Vision';

  @override
  String get dolbyVisionDirectPlayFailedMessage =>
      'La lecture directe n\'a pas pu démarrer pour ce flux Dolby Vision. Réessayer en utilisant le transcodage du serveur ?';

  @override
  String get retryWithTranscode => 'Réessayez avec le transcodage';

  @override
  String get dolbyVisionNotSupportedTitle => 'Dolby Vision non pris en charge';

  @override
  String get dolbyVisionNotSupportedMessage =>
      'Cet appareil ne peut pas décoder directement le contenu Dolby Vision. Utilisez la solution de secours HDR10 ou demandez le transcodage du serveur.';

  @override
  String get rememberMyChoice => 'Souviens-toi de mon choix';

  @override
  String get playHdr10Fallback => 'Lire la solution de secours HDR10';

  @override
  String get requestTranscode => 'Demander un transcodage';

  @override
  String get homeScreenSectionsIntegrationDescription =>
      'Détectez les lignes exposées par le plugin « Home Screen Sections » d\'IAmParadox27. Les lignes peuvent être activées et réorganisées ci-dessous.';

  @override
  String get homeScreenSectionsIntegrationNoServers =>
      'Aucun serveur Jellyfin n\'a encore signalé le plugin.';

  @override
  String get kefinTweaksIntegrationDescription =>
      'Détectez les lignes configurées via le plugin \"KefinTweaks\" de ranaldsgift. Les sections personnalisées, récemment publiées, à revoir, saisonnières et récemment ajoutées à la bibliothèque sont reflétées à partir de la configuration KefinTweaks sur chaque serveur Jellyfin.';

  @override
  String get kefinTweaksIntegrationNoServers =>
      'Aucun serveur Jellyfin ne signale KefinTweaks pour le moment.';

  @override
  String get integrationOpenHomeSections => 'Sections d\'accueil ouvertes';

  @override
  String get integrationOpenHomeSectionsSubtitle =>
      'Activer, désactiver et réorganiser les lignes';

  @override
  String get integrationInstalledButDisabled => 'Installé mais désactivé';

  @override
  String get integrationNotInstalled => 'Non installé';

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
  String get seeAll => 'Voir tout';

  @override
  String get noItems => 'Aucun élément';

  @override
  String get switchUser => 'Changer d\'utilisateur';

  @override
  String get remoteControl => 'Télécommande';

  @override
  String get mediaBarLoading => 'Chargement de la barre multimédia...';

  @override
  String get mediaBarError => 'Échec du chargement de la barre multimédia';

  @override
  String get offlineServerUnavailable =>
      'Connecté à Internet, mais le serveur actuel est indisponible.';

  @override
  String get offlineNoInternet =>
      'Vous êtes hors ligne. Seul le contenu téléchargé est disponible.';

  @override
  String get offlineFileNotAvailable => 'Fichier non disponible';

  @override
  String get offlineSwitchServer => 'Changer de serveur';

  @override
  String get offlineSavedMedia => 'Médias enregistrés';

  @override
  String get castGoogleCast => 'Google Cast';

  @override
  String get castAirPlay => 'AirPlay';

  @override
  String get castDlna => 'DLNA';

  @override
  String get castRemotePlayback => 'Lecture à distance';

  @override
  String castControlFailed(String error) {
    return 'Cast control failed: $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Controls';
  }

  @override
  String get castDeviceVolume => 'Volume de l\'appareil';

  @override
  String get castVolumeUnavailable => 'Indisponible';

  @override
  String castStopKind(String kind) {
    return 'Stop $kind';
  }

  @override
  String get audioLabel => 'Audio';

  @override
  String get subtitlesLabel => 'Sous-titres';

  @override
  String get pinConfirmTitle => 'Confirmer le PIN';

  @override
  String get pinSetTitle => 'Définir un PIN';

  @override
  String get pinEnterTitle => 'Saisir le PIN';

  @override
  String get pinReenterToConfirm =>
      'Saisissez à nouveau votre PIN pour confirmer';

  @override
  String pinEnterNDigit(int length) {
    return 'Enter a $length-digit PIN';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Enter your $length-digit PIN';
  }

  @override
  String get pinIncorrect => 'PIN incorrect';

  @override
  String get pinMismatch => 'Les PIN ne correspondent pas';

  @override
  String get pinForgot => 'PIN oublié ?';

  @override
  String get pinClear => 'Effacer';

  @override
  String get pinBackspace => 'Retour arrière';

  @override
  String get quickConnectAuthorized => 'Demande de connexion rapide autorisée.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Le code de connexion rapide est invalide ou expiré.';

  @override
  String get quickConnectNotSupported =>
      'La connexion rapide n\'est pas prise en charge sur ce serveur.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Échec de l\'autorisation du code de connexion rapide.';

  @override
  String get quickConnectDisabled =>
      'La connexion rapide est désactivée sur ce serveur.';

  @override
  String get quickConnectForbidden =>
      'Votre compte ne peut pas autoriser cette demande de connexion rapide.';

  @override
  String get quickConnectNotFound =>
      'Code de connexion rapide introuvable. Essayez un nouveau code.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Quick Connect failed: $message';
  }

  @override
  String get quickConnectEnterCode => 'Saisir le code';

  @override
  String get quickConnectAuthorize => 'Autoriser';

  @override
  String remoteCommandFailed(String error) {
    return 'Command failed: $error';
  }

  @override
  String get remoteControlTitle => 'Télécommande';

  @override
  String get remoteFailedToLoadSessions => 'Échec du chargement des sessions';

  @override
  String get remoteNoSessions => 'Aucune session contrôlable';

  @override
  String get remoteStartPlayback => 'Démarrer la lecture sur un autre appareil';

  @override
  String get unknownUser => 'Inconnu';

  @override
  String get unknownItem => 'Inconnu';

  @override
  String get remoteNothingPlaying =>
      'Rien n\'est en cours de lecture sur cette session';

  @override
  String get castingStarted =>
      'La diffusion a commencé sur l\'appareil sélectionné';

  @override
  String castingFailed(String error) {
    return 'Failed to start casting: $error';
  }

  @override
  String get noRemoteDevices =>
      'Aucun appareil de lecture à distance disponible.';

  @override
  String get noRemoteDevicesIos =>
      'Aucun appareil de lecture à distance disponible.\n\nSur iOS, les cibles AirPlay peuvent être indisponibles dans le simulateur.';

  @override
  String get trackActionPlayNext => 'Lire ensuite';

  @override
  String get trackActionAddToQueue => 'Ajouter à la file d\'attente';

  @override
  String get trackActionAddToPlaylist => 'Ajouter à la playlist';

  @override
  String get trackActionCancelDownload => 'Annuler le téléchargement';

  @override
  String get trackActionDeleteFromPlaylist => 'Supprimer de la playlist';

  @override
  String get trackActionMoveUp => 'Déplacer vers le haut';

  @override
  String get trackActionMoveDown => 'Déplacer vers le bas';

  @override
  String get trackActionRemoveFromFavorites => 'Retirer des favoris';

  @override
  String get trackActionAddToFavorites => 'Ajouter aux favoris';

  @override
  String get trackActionGoToAlbum => 'Aller à l\'album';

  @override
  String get trackActionGoToArtist => 'Aller à l\'artiste';

  @override
  String trackActionDownloading(String name) {
    return 'Downloading $name...';
  }

  @override
  String get trackActionDeletedFile => 'Fichier téléchargé supprimé';

  @override
  String get trackActionDeleteFileFailed =>
      'Impossible de supprimer le fichier téléchargé';

  @override
  String get shuffleBy => 'Mélanger par';

  @override
  String get shuffleSelectLibrary => 'Sélectionner une bibliothèque';

  @override
  String get shuffleSelectGenre => 'Sélectionner un genre';

  @override
  String get shuffleLibrary => 'Bibliothèque';

  @override
  String get shuffleGenre => 'Genre';

  @override
  String get shuffleNoLibraries => 'Aucune bibliothèque compatible disponible.';

  @override
  String get shuffleNoGenres => 'Aucun genre trouvé pour ce mode aléatoire.';

  @override
  String get posterDisplayTitle => 'Affichage';

  @override
  String get posterImageType => 'Type d\'image';

  @override
  String get imageTypePoster => 'Affiche';

  @override
  String get imageTypeThumbnail => 'Miniature';

  @override
  String get imageTypeBanner => 'Bannière';

  @override
  String get playlistAddFailed => 'Échec de l\'ajout à la playlist';

  @override
  String get playlistCreateFailed => 'Échec de la création de la playlist';

  @override
  String get playlistNew => 'Nouvelle playlist';

  @override
  String get playlistCreate => 'Créer';

  @override
  String get playlistCreateNew => 'Créer une nouvelle playlist';

  @override
  String get playlistNoneFound => 'Aucune playlist trouvée';

  @override
  String get addToPlaylist => 'Ajouter à la playlist';

  @override
  String get lyricsNotAvailable => 'Paroles non disponibles';

  @override
  String get upNext => 'À suivre';

  @override
  String get playNext => 'Lire ensuite';

  @override
  String get stillWatchingContent =>
      'La lecture a été mise en pause. Regardez-vous toujours ?';

  @override
  String get stillWatchingStop => 'Arrêter';

  @override
  String get stillWatchingContinue => 'Continuer';

  @override
  String skipSegment(String segment) {
    return 'Skip $segment';
  }

  @override
  String get liveTv => 'TV en direct';

  @override
  String get continueWatchingAndNextUp => 'Reprendre la lecture et À suivre';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Downloading $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Downloading $fileName';
  }

  @override
  String get nextEpisode => 'Épisode suivant';

  @override
  String get moreFromThisSeason => 'Plus de cette saison';

  @override
  String get playerTooltipPlaybackSpeed => 'Vitesse de lecture';

  @override
  String get playerTooltipCastControls => 'Commandes Cast';

  @override
  String get playerTooltipPlaybackQuality => 'Débit';

  @override
  String get playerTooltipEnterFullscreen => 'Passer en plein écran';

  @override
  String get playerTooltipExitFullscreen => 'Quitter le plein écran';

  @override
  String get playerTooltipFloatOnTop => 'Flottez au dessus';

  @override
  String get playerTooltipExitFloatOnTop => 'Désactiver le flottement en haut';

  @override
  String get playerTooltipLockLandscape => 'Paysage de verrouillage';

  @override
  String get playerTooltipUnlockOrientation => 'Autoriser la rotation';

  @override
  String get playerTooltipPrevious => 'Précédent';

  @override
  String get playerTooltipSeekBack => 'Reculer';

  @override
  String get playerTooltipSeekForward => 'Avancer';

  @override
  String get contextMenuMarkWatched => 'Marquer comme vu';

  @override
  String get contextMenuMarkUnwatched => 'Marquer comme non vu';

  @override
  String get contextMenuAddToFavorites => 'Ajouter aux favoris';

  @override
  String get contextMenuRemoveFromFavorites => 'Retirer des favoris';

  @override
  String get contextMenuGoToSeries => 'Aller à la série';

  @override
  String get settingsAdministrationSubtitle =>
      'Accéder au panneau d\'administration du serveur';

  @override
  String get settingsAccountSecurity => 'Compte et sécurité';

  @override
  String get settingsAccountSecuritySubtitle =>
      'Authentification, code PIN et contrôle parental';

  @override
  String get settingsPersonalization => 'Personnalisation';

  @override
  String get settingsPersonalizationSubtitle =>
      'Thème, navigation, lignes d\'accueil et visibilité de la bibliothèque';

  @override
  String get settingsDynamicContent => 'Contenu dynamique';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barre média et superpositions visuelles';

  @override
  String get settingsPlaybackSyncplay => 'Lecture & SyncPlay';

  @override
  String get settingsPlaybackSyncplaySubtitle =>
      'Paramètres audio/vidéo, sous-titres, téléchargements et commandes SyncPlay';

  @override
  String get settingsIntegrationsSubtitle =>
      'Synchronisation des plugins, Seerr, évaluations et plus encore';

  @override
  String get settingsAboutSubtitle =>
      'Version de l\'application, informations légales et crédits';

  @override
  String get settingsAuthenticationSection => 'AUTHENTIFICATION';

  @override
  String get settingsSortServersBy => 'Trier les serveurs par';

  @override
  String get settingsLastUsed => 'Dernière utilisation';

  @override
  String get settingsAlphabetical => 'Alphabétique';

  @override
  String get settingsPrivacyAndSafetySection => 'CONFIDENTIALITÉ ET SÉCURITÉ';

  @override
  String get settingsBlockedRatings => 'Notes bloquées';

  @override
  String get settingsGeneralStyle => 'Style général';

  @override
  String get settingsGeneralStyleSubtitle =>
      'Accents de thème, arrière-plans, indicateurs regardés et musique de thème';

  @override
  String get settingsHomePage => 'Page d\'accueil';

  @override
  String get settingsHomePageSubtitle =>
      'Sections, types d\'images, superpositions et aperçus multimédias';

  @override
  String get settingsLibrariesSubtitle =>
      'Visibilité de la bibliothèque, vue des dossiers et comportement multi-serveur';

  @override
  String get settingsTwentyFourHourClock => 'Horloge 24 heures';

  @override
  String get settingsTwentyFourHourClockSubtitle =>
      'Utilisez le format d\'heure sur 24 heures partout où l\'horloge est affichée';

  @override
  String get settingsShowShuffleButtonInNavigation =>
      'Afficher le bouton de lecture aléatoire dans la barre de navigation';

  @override
  String get settingsShowGenresButtonInNavigation =>
      'Afficher le bouton des genres dans la barre de navigation';

  @override
  String get settingsShowFavoritesButtonInNavigation =>
      'Afficher le bouton Favoris dans la barre de navigation';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Afficher le bouton des bibliothèques dans la barre de navigation';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Basculez la visibilité de la page d\'accueil par bibliothèque. Redémarrez Moonfin pour que les modifications prennent effet.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barre multimédia et aperçus locaux';

  @override
  String get settingsVisualOverlays => 'Superpositions visuelles';

  @override
  String get settingsSeasonalSurprise => 'Surprise saisonnière';

  @override
  String get settingsMetadataAndRatings => 'Métadonnées et évaluations';

  @override
  String get settingsPluginScreenDescription =>
      'Moonbase alimente les intégrations côté serveur, notamment des sources de notation supplémentaires, des requêtes Seerr et des préférences synchronisées.';

  @override
  String get settingsOfflineDownloads => 'Téléchargements hors ligne';

  @override
  String get settingsHigh => 'Haut';

  @override
  String get settingsLow => 'Faible';

  @override
  String get settingsCustomPath => 'Chemin personnalisé';

  @override
  String get settingsEnterDownloadFolderPath =>
      'Entrez le chemin du dossier de téléchargement';

  @override
  String get settingsConcurrentDownloads => 'Téléchargements simultanés';

  @override
  String get settingsConcurrentDownloadsDescription =>
      'Nombre maximum d\'éléments à télécharger en même temps.';

  @override
  String get settingsAppInfo => 'INFORMATIONS SUR L\'APPLICATION';

  @override
  String get settingsReportAnIssue => 'Signaler un problème';

  @override
  String get settingsReportAnIssueSubtitle =>
      'Ouvrez le suivi des problèmes sur GitHub';

  @override
  String get settingsJoinDiscord => 'Rejoignez Discorde';

  @override
  String get settingsJoinDiscordSubtitle => 'Discutez avec la communauté';

  @override
  String get settingsJoinTheDiscord => 'Rejoignez le Discord';

  @override
  String get settingsSupportMoonfin => 'Soutenir Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle =>
      'Star le projet sur GitHub ou contribuer';

  @override
  String get settingsLegal => 'LÉGAL';

  @override
  String get settingsLicenses => 'Licences';

  @override
  String get settingsOpenSourceLicenseNotices => 'Avis de licence open source';

  @override
  String get settingsPrivacyPolicy => 'politique de confidentialité';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Comment Moonfin gère vos données';

  @override
  String get settingsCheckForUpdates => 'Vérifier les mises à jour';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Recherchez la dernière version de Moonfin';

  @override
  String get settingsPoweredByFlutter => 'Propulsé par Flutter';

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
  String get settingsBoth => 'Les deux';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filtre de type de contenu aléatoire';

  @override
  String get settingsVideoPlaybackPreferences => 'Préférences de lecture vidéo';

  @override
  String get settingsVideoPlaybackPreferencesSubtitle =>
      'Moteur vidéo de base et paramètres de qualité de streaming';

  @override
  String get settingsAudioPreferences => 'Préférences audio';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Pistes audio, options de traitement et de relais';

  @override
  String get settingsAutomationAndQueue => 'Automatisation et file d\'attente';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Lecture et séquençage automatisés';

  @override
  String get settingsOfflineDownloadsSubtitle =>
      'Qualité du téléchargement, limites de stockage et taille de la file d\'attente';

  @override
  String get settingsSyncplaySubtitle =>
      'Logique de synchronisation pour les sessions de groupe';

  @override
  String get settingsAdvancedOptionsSubtitle =>
      'Fonctionnalités de lecteur spécialisées. À utiliser avec prudence, car certaines options peuvent entraîner des problèmes de lecture';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Ignorer les intros et les outros ?';

  @override
  String get settingsPromptUser => 'Inviter l\'utilisateur';

  @override
  String get settingsSkip => 'Sauter';

  @override
  String get settingsDoNothing => 'Ne rien faire';

  @override
  String get settingsMaxBitrateDescription =>
      'Limitez le débit binaire du streaming. Le contenu au-dessus de ce seuil sera transcodé pour s\'adapter.';

  @override
  String get settingsMaxResolutionDescription =>
      'Limitez la résolution maximale que le joueur demandera. Le contenu à plus haute résolution sera transcodé vers le bas.';

  @override
  String get settingsPlayerZoomDescription =>
      'Comment la vidéo doit être mise à l\'échelle pour s\'adapter à l\'écran.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Moteur de lecture (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Choisissez le moteur de lecture par défaut sur les appareils Android TV. Les modifications s\'appliquent à la prochaine session de lecture.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recommandé)';

  @override
  String get settingsPlaybackEngineMedia3Legacy => 'Media3 (legacy)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ancien)';

  @override
  String get settingsPlaybackEngineMpvRecommended => 'mpv (recommended)';

  @override
  String get settingsDolbyVisionFallback => 'Solution de repli Dolby Vision';

  @override
  String get settingsDolbyVisionFallbackDescription =>
      'Comportement des titres Dolby Vision sur les appareils sans décodage Dolby Vision.';

  @override
  String get settingsAskEachTime => 'Demander à chaque fois';

  @override
  String get settingsPreferHdr10Fallback => 'Préférer le repli HDR10';

  @override
  String get settingsPreferServerTranscode =>
      'Préférer le transcodage du serveur';

  @override
  String get settingsDolbyVisionProfile7DirectPlay =>
      'Dolby Vision Profile 7 Lecture directe';

  @override
  String get settingsDolbyVisionProfile7DirectPlayDescription =>
      'Contrôle si les flux de couche d\'amélioration du profil Dolby Vision 7 doivent être lus directement.';

  @override
  String get settingsAutoAftkrtEnabled => 'Auto (AFTKRT activé)';

  @override
  String get settingsEnabledOnThisDevice => 'Activé sur cet appareil';

  @override
  String get settingsDisabledPreferTranscode =>
      'Désactivé (préférer le transcodage)';

  @override
  String get settingsResumeRewindDescription =>
      'Lors de la reprise de la lecture (à partir de Continuer à regarder ou d\'une page d\'élément multimédia), combien de secondes doivent être rembobinées ?';

  @override
  String get settingsUnpauseRewindDescription =>
      'Lors de la reprise de la lecture après avoir appuyé sur le bouton pause, combien de secondes doivent être rembobinées ?';

  @override
  String get settingsSkipBackLengthDescription =>
      'Combien de secondes faut-il revenir en arrière après avoir appuyé sur le bouton de rembobinage.';

  @override
  String get settingsOneSecond => '1 seconde';

  @override
  String get settingsThreeSeconds => '3 secondes';

  @override
  String get settingsFortyFiveSeconds => '45 secondes';

  @override
  String get settingsSixtySeconds => '60 secondes';

  @override
  String get settingsSkipForwardLengthDescription =>
      'Combien de secondes faut-il avancer après avoir appuyé sur le bouton d\'avance rapide.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 vers décodeur externe';

  @override
  String get settingsCinemaMode => 'Mode cinéma';

  @override
  String get settingsCinemaModeSubtitle =>
      'Lire des bandes-annonces/prerolls avant un long métrage principal';

  @override
  String get settingsNextUpDisplayDescription =>
      'Extended affiche une carte complète avec les illustrations et la description de l\'épisode. Minimal montre une superposition de compte à rebours compacte. Désactivé masque entièrement l’invite.';

  @override
  String get settingsShort => 'Court';

  @override
  String get settingsLong => 'Long';

  @override
  String get settingsVeryLong => 'Très longtemps';

  @override
  String get settingsVideoStartDelay => 'Délai de démarrage de la vidéo';

  @override
  String settingsMillisecondsValue(int value) {
    return '$value ms';
  }

  @override
  String get settingsLiveTvDirect => 'Télévision en direct en direct';

  @override
  String get settingsLiveTvDirectSubtitle =>
      'Activer la lecture directe pour la télévision en direct';

  @override
  String get settingsOpenGroups => 'Groupes ouverts';

  @override
  String get settingsOpenGroupsSubtitle =>
      'Créer, rejoindre ou gérer des groupes SyncPlay';

  @override
  String get settingsSyncplayEnabled => 'SyncPlay activé';

  @override
  String get settingsSyncplayEnabledSubtitle =>
      'Activer les fonctionnalités de surveillance de groupe';

  @override
  String get settingsSyncplayButton => 'Bouton SyncPlay';

  @override
  String get settingsSyncplayButtonSubtitle =>
      'Afficher le bouton SyncPlay sur la barre de navigation';

  @override
  String get settingsSyncplayAdvancedCorrection => 'Correction avancée';

  @override
  String get settingsSyncplayAdvancedCorrectionSubtitle =>
      'Activer une logique de synchronisation fine';

  @override
  String get settingsSyncplaySyncCorrection => 'Correction de synchronisation';

  @override
  String get settingsSyncplaySyncCorrectionSubtitle =>
      'Ajustez automatiquement la lecture pour rester synchronisée';

  @override
  String get settingsSyncplaySpeedToSync => 'Vitesse de synchronisation';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Utilisez le réglage de la vitesse de lecture pour synchroniser';

  @override
  String get settingsSyncplaySkipToSync => 'Passer à la synchronisation';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Utiliser la recherche de synchronisation';

  @override
  String get settingsSyncplayMinimumSpeedDelay => 'Délai de vitesse minimum';

  @override
  String get settingsSyncplayMaximumSpeedDelay => 'Délai de vitesse maximale';

  @override
  String get settingsSyncplaySpeedDuration => 'Durée de la vitesse';

  @override
  String get settingsSyncplayMinimumSkipDelay => 'Délai de saut minimum';

  @override
  String get settingsSyncplayExtraOffset => 'Décalage supplémentaire SyncPlay';

  @override
  String get onNow => 'En cours maintenant';

  @override
  String get collections => 'Collections';

  @override
  String get lastPlayed => 'Dernière lecture';

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
