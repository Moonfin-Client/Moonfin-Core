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
  String get animeMarkerFiller => 'Filler';

  @override
  String get animeMarkerMixed => 'Mixte';

  @override
  String get animeMarkerAnimeCanon => 'Canon anime';

  @override
  String get animeMarkerMangaCanon => 'Canon manga';

  @override
  String get animeMarkerSubbed => 'Sous-titré';

  @override
  String get animeMarkerDubbed => 'Doublé';

  @override
  String get animeMarkerSubbedAndDubbed => 'Sous-titré/doublé';

  @override
  String get animeMarkerSubbedShort => 'Sub';

  @override
  String get animeMarkerDubbedShort => 'Dub';

  @override
  String get animeMarkerSubbedAndDubbedShort => 'Sub/Dub';

  @override
  String get animeMarkerPending => 'En attente';

  @override
  String get animeMarkerRecap => 'Récap';

  @override
  String get interfaceLanguage => 'Langage de l\'interface';

  @override
  String get systemLanguageDefault => 'Langue du système';

  @override
  String get signIn => 'Se connecter';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get empty => 'Vide';

  @override
  String connectingToServer(String serverName) {
    return 'Connexion à $serverName';
  }

  @override
  String get quickConnect => 'Quick Connect';

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
  String get quickConnectScanHint =>
      'Ou scannez ce code avec un téléphone connecté à votre serveur';

  @override
  String get quickConnectTapOrScanHint =>
      'Touchez le code pour approuver dans votre navigateur, ou scannez-le avec un autre appareil';

  @override
  String get timesUpTitle => 'Temps écoulé';

  @override
  String get timesUpMessage =>
      'Ce compte n\'est pas disponible pour le moment.';

  @override
  String timesUpResumesToday(String time) {
    return 'Vous pourrez l\'utiliser à nouveau aujourd\'hui à $time.';
  }

  @override
  String timesUpResumesTomorrow(String time) {
    return 'Vous pourrez l\'utiliser à nouveau demain à $time.';
  }

  @override
  String timesUpResumesOn(String day, String time) {
    return 'Vous pourrez l\'utiliser à nouveau $day à $time.';
  }

  @override
  String get waitingForAuthorization => 'En attente d\'autorisation…';

  @override
  String get back => 'Retour';

  @override
  String get serverUnavailable => 'Serveur indisponible';

  @override
  String get loginFailed => 'Échec de la connexion';

  @override
  String get loginForbidden =>
      'Impossible de se connecter avec ce compte pour le moment. Il est peut-être hors des horaires autorisés, verrouillé ou désactivé. Réessayez plus tard ou contactez un administrateur.';

  @override
  String quickConnectUnavailable(String detail) {
    return 'Quick Connect indisponible : $detail';
  }

  @override
  String quickConnectUnavailableWithStatus(String status, String detail) {
    return 'Quick Connect indisponible ($status) : $detail';
  }

  @override
  String get whosWatching => 'Qui regarde ?';

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
  String get embyConnect => 'Emby Connect';

  @override
  String get removeServer => 'Supprimer le serveur';

  @override
  String removeServerConfirmation(String serverName) {
    return 'Supprimer « $serverName » de vos serveurs ?';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get remove => 'Retirer';

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
  String get ok => 'OK';

  @override
  String get settingsAppearanceTheme => 'Thème de l\'application';

  @override
  String get detailScreenStyle => 'Style de l\'écran de détails';

  @override
  String get detailScreenStyleSubtitle =>
      'Classique correspond à la mise en page centrée d\'origine de Moonfin. Moderne propose une mise en page cinématographique et adaptative. Spotlight met en avant un grand visuel, avec des fenêtres surgissantes pour le contenu. Nouveau occupe tout l\'écran, avec des sections empilées les unes sous les autres. Minimaliste se résume au visuel, à un bouton de lecture et aux épisodes.';

  @override
  String get detailScreenStyleMoonfin => 'Classique';

  @override
  String get detailScreenStyleModern => 'Moderne';

  @override
  String get detailScreenStyleSpotlight => 'Spotlight';

  @override
  String get spotlightMoreActions => 'Plus d\'actions';

  @override
  String get spotlightCastCrewStudios =>
      'Distribution, équipe technique et studios';

  @override
  String get spotlightChaptersExtras => 'Chapitres et bonus';

  @override
  String get spotlightFileDetails => 'Détails du fichier';

  @override
  String get spotlightSimilarRecommendations =>
      'Titres similaires et recommandations';

  @override
  String get spotlightSeasonsEpisodes => 'Saisons et épisodes';

  @override
  String get spotlightMoreEpisodes => 'Plus d\'épisodes';

  @override
  String get spotlightFilmography => 'Filmographie';

  @override
  String get spotlightCollectionsCard => 'Collections';

  @override
  String get spotlightPlaylistOrder => 'Ordre de visionnage';

  @override
  String get spotlightMoviesAndShows => 'Films et séries';

  @override
  String get spotlightSimilarSeerr => 'Titres similaires (Seerr)';

  @override
  String get spotlightRecommendationsSeerr => 'Recommandations (Seerr)';

  @override
  String spotlightPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personnes',
      one: '$count personne',
    );
    return '$_temp0';
  }

  @override
  String spotlightFactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count informations',
      one: '$count information',
    );
    return '$_temp0';
  }

  @override
  String spotlightTagsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tags',
      one: '$count tag',
    );
    return '$_temp0';
  }

  @override
  String spotlightStudiosCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count studios',
      one: '$count studio',
    );
    return '$_temp0';
  }

  @override
  String spotlightChaptersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapitres',
      one: '$count chapitre',
    );
    return '$_temp0';
  }

  @override
  String spotlightExtrasCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bonus',
      one: '$count bonus',
    );
    return '$_temp0';
  }

  @override
  String spotlightSeasonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saisons',
      one: '$count saison',
    );
    return '$_temp0';
  }

  @override
  String spotlightEpisodesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count épisodes',
      one: '$count épisode',
    );
    return '$_temp0';
  }

  @override
  String spotlightMoviesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count films',
      one: '$count film',
    );
    return '$_temp0';
  }

  @override
  String spotlightShowsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count séries',
      one: '$count série',
    );
    return '$_temp0';
  }

  @override
  String spotlightTracksCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistes',
      one: '$count piste',
    );
    return '$_temp0';
  }

  @override
  String spotlightItemsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '$count élément',
    );
    return '$_temp0';
  }

  @override
  String spotlightAlbumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count albums',
      one: '$count album',
    );
    return '$_temp0';
  }

  @override
  String spotlightCollectionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count collections',
      one: '$count collection',
    );
    return '$_temp0';
  }

  @override
  String spotlightTitlesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titres',
      one: '$count titre',
    );
    return '$_temp0';
  }

  @override
  String get detailScreenStyleNouveau => 'Nouveau';

  @override
  String get detailScreenStyleMinimalist => 'Minimaliste';

  @override
  String get expandedTabs => 'Onglets déployés';

  @override
  String get expandedTabsSubtitle =>
      'Affiche automatiquement le contenu des onglets pendant que vous les parcourez. Désactivez cette option pour ouvrir et fermer chaque onglet manuellement.';

  @override
  String get showTechnicalDetails => 'Afficher les détails techniques';

  @override
  String get showTechnicalDetailsSubtitle =>
      'Afficher le codec, la résolution et les informations de flux dans le résumé de la bannière';

  @override
  String get recommendationSystem => 'Système de recommandation';

  @override
  String get recommendationSystemSubtitle =>
      'Utilisez l\'algorithme local « Moonfin recommande », le serveur « Jellyfin recommande » ou les mesures de similarité TMDb en ligne. Remarque : les recommandations en ligne nécessitent l\'intégration Seerr.';

  @override
  String get recommendationSystemMoonfin => 'Moonfin recommande';

  @override
  String get recommendationSystemJellyfin => 'Recommandé par Jellyfin';

  @override
  String get recommendationSystemTmdb => 'Similarité TMDb';

  @override
  String get recommendationsApplyParentalRatingCap =>
      'Appliquer la limite de classification parentale aux recommandations';

  @override
  String get recommendationsApplyParentalRatingCapSubtitle =>
      'Limiter les suggestions de « Moonfin recommande » selon la classification parentale du média ciblé';

  @override
  String get interfaceStyle => 'Style de l\'interface';

  @override
  String get interfaceStyleSubtitle =>
      'Automatique s\'adapte à votre appareil. Choisissez Apple ou Material pour forcer une apparence.';

  @override
  String get interfaceStyleAutomatic => 'Automatique';

  @override
  String get interfaceStyleApple => 'Apple';

  @override
  String get interfaceStyleMaterial => 'Material';

  @override
  String get interfaceLayout => 'Type d\'interface';

  @override
  String get interfaceLayoutSubtitle =>
      'Remplacer le type détecté si votre appareil n\'est pas reconnu correctement. Redémarrez Moonfin pour appliquer les modifications.';

  @override
  String get interfaceLayoutAutomatic => 'Automatique';

  @override
  String get interfaceLayoutTv => 'TV';

  @override
  String get interfaceLayoutDesktop => 'Ordinateur';

  @override
  String get interfaceLayoutPhone => 'Téléphone';

  @override
  String get glassQuality => 'Qualité de l\'effet verre';

  @override
  String get oledMode => 'Mode OLED';

  @override
  String get oledModeSubtitle =>
      'Approfondit les noirs et enrichit les visuels. Idéal sur les écrans OLED.';

  @override
  String get oledModeSubtle => 'Subtil';

  @override
  String get oledModeVivid => 'Éclatant';

  @override
  String get glassQualitySubtitle =>
      'Auto choisit le meilleur effet verre pour cet appareil. Complet force un vrai flou ; Réduite utilise un effet verre léger qui économise le GPU.';

  @override
  String get glassQualityAuto => 'Auto';

  @override
  String get glassQualityFull => 'Complète';

  @override
  String get glassQualityReduced => 'Réduite';

  @override
  String get performanceMode => 'Performance';

  @override
  String get performanceModeSubtitle =>
      'La fonction « Auto » analyse cet appareil et limite l\'utilisation des modèles disposant d\'une mémoire insuffisante, ce qui réduit le nombre d\'images stockées en mémoire et convertit les bandes-annonces en images fixes. Cette modification prendra pleinement effet lors du prochain démarrage.';

  @override
  String get performanceModeAuto => 'Auto';

  @override
  String get performanceModeStandard => 'Standard';

  @override
  String get performanceModeReduced => 'Réduit';

  @override
  String get rendererMode => 'Moteur de rendu';

  @override
  String get rendererModeSubtitle =>
      'Auto utilise Impeller sur les boîtiers TV dont la puce graphique le gère sans saccades et Skia partout ailleurs. Choisissez Skia si les animations ou la vidéo s\'affichent mal. Prend effet au prochain démarrage.';

  @override
  String get rendererModeAuto => 'Auto';

  @override
  String get rendererModeSkia => 'Skia';

  @override
  String get trailerPreviewHeldBack =>
      'Désactivé car le paramètre « Performances » est réglé sur « Réduit » pour cet appareil';

  @override
  String get settingsAppearanceThemeSubtitle =>
      'Appliquez un thème entièrement personnalisé et basculez entre une interface d\'inspiration Apple ou Material.';

  @override
  String get customThemeTitle => 'Thème personnalisé';

  @override
  String get customThemeSubtitle =>
      'Les thèmes personnalisés modifient les éléments visuels dans tout Moonfin. Choisissez l\'une de ces options selon votre style.';

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
  String get controller => 'Contrôleur';

  @override
  String get gamepadNavigation => 'Navigation à la manette';

  @override
  String get gamepadNavigationDescription =>
      'Permettre à une manette de jeu connectée de déplacer le curseur et de sélectionner des éléments';

  @override
  String get themeMoonfin => 'Moonfin';

  @override
  String get themeMoonfinSubtitle =>
      'Le look actuel de Moonfin que vous aimez tous.';

  @override
  String get themeNeonPulse => 'Neon Pulse';

  @override
  String get themeNeonPulseSubtitle =>
      'Style Synthwave avec lueur magenta, texte cyan et contraste chromé plus fort';

  @override
  String get themeGlass => 'Glass';

  @override
  String get themeGlassSubtitle =>
      'Style \"Verre liquide\" avec arrière-plan en dégradé animé, surfaces dépolies et touches de bleu Apple';

  @override
  String get theme8BitHero => '8-bit Hero';

  @override
  String get theme8BitHeroSubtitle =>
      'Style pixel-art rétro avec une palette épaisse, des bordures carrées, des ombres portées franches et une police pixelisée';

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
  String get loadingLinkedServers => 'Chargement des serveurs liés…';

  @override
  String get connectingToServerEllipsis => 'Connexion au serveur…';

  @override
  String get noReachableAddress => 'Aucune adresse accessible fournie';

  @override
  String get invalidServerExchangeResponse =>
      'Réponse invalide du point de terminaison d\'échange du serveur';

  @override
  String unableToConnectTo(String target) {
    return 'Impossible de se connecter à $target';
  }

  @override
  String get exitApp => 'Quitter Moonfin ?';

  @override
  String get exitAppConfirmation => 'Voulez-vous vraiment quitter ?';

  @override
  String get exit => 'Quitter';

  @override
  String get gameMenu => 'Menu';

  @override
  String get gamePaused => 'En pause';

  @override
  String get gameSaveState => 'Sauvegarder';

  @override
  String get games => 'Jeux';

  @override
  String get gameLoadState => 'Charger une sauvegarde';

  @override
  String get gameFastForward => 'Avance rapide';

  @override
  String get gameOrientation => 'Orientation du jeu';

  @override
  String get gameOrientationSubtitle =>
      'Orientation de l\'écran pendant les jeux';

  @override
  String get landscape => 'Paysage';

  @override
  String get portrait => 'Portrait';

  @override
  String get gameEmulatorSettings => 'Paramètres d\'émulateur';

  @override
  String get gameNoCoreOptions => 'Ce cœur ne propose aucune option réglable.';

  @override
  String get gameHoldToOpenMenu => 'Gardez appuyé pour ouvrir le menu';

  @override
  String get gameKeepPlaying => 'Continuer à jouer';

  @override
  String get gameSaveAndExit => 'Sauvegarder et quitter';

  @override
  String get gameExitGame => 'Quitter le jeu';

  @override
  String get gameSavingBeforeExit => 'Sauvegarde…';

  @override
  String get gameSaveFailedStillPlaying =>
      'Échec de la sauvegarde. Le jeu continue.';

  @override
  String get gamePlaybackUnsupported =>
      'La lecture de jeux n\'est pas encore prise en charge sur cet appareil.';

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
  String get genres => 'Genres';

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
    return 'Échec du chargement du dossier : $error';
  }

  @override
  String get thisFolderIsEmpty => 'Ce dossier est vide';

  @override
  String itemCountLabel(int count) {
    return '$count éléments';
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
    return '$count Articles';
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
  String get uiScaleGrandparents => 'Grand-mère';

  @override
  String get uiScaleGreatGrandparents => 'Arrière-grand-mère';

  @override
  String get scrollDirection => 'Sens de défilement';

  @override
  String get scrollDirectionVertical => 'Vertical';

  @override
  String get scrollDirectionHorizontal => 'Horizontal';

  @override
  String libraryGenresTitle(String name) {
    return '$name — Genres';
  }

  @override
  String get views => 'Vues';

  @override
  String get albums => 'Albums';

  @override
  String get albumArtists => 'Artistes de l\'album';

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
    return 'il y a ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'il y a ${count}h';
  }

  @override
  String daysAgo(int count) {
    return 'il y a ${count}j';
  }

  @override
  String get discoverySubjects => 'Sujets de découverte';

  @override
  String get apply => 'Appliquer';

  @override
  String get openLink => 'Ouvrir le lien';

  @override
  String get scanWithYourPhone => 'Scannez avec votre téléphone';

  @override
  String get audiobookGenres => 'Genres de livres audio';

  @override
  String get scrollLeft => 'Faire défiler vers la gauche';

  @override
  String get scrollRight => 'Faire défiler vers la droite';

  @override
  String get scrollToTop => 'Revenir en haut';

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
      'Vos livres favoris, en cours de lecture ou contenant des passages surlignés.';

  @override
  String get handPickedFromLibrary => 'Sélectionnés dans votre bibliothèque.';

  @override
  String get handPickedFromListeningQueue =>
      'Sélectionnés dans votre file d\'écoute.';

  @override
  String get booksWithHighlights =>
      'Livres favoris, en cours de lecture ou contenant des passages surlignés.';

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
  String get searchAudiobooks => 'Rechercher des livres audio';

  @override
  String get searchYourLibrary => 'Rechercher dans votre bibliothèque';

  @override
  String get pickUpStory => 'Reprenez l\'histoire là où vous l\'avez laissée';

  @override
  String get savedPlacesChapters =>
      'Vos emplacements enregistrés et chapitres inachevés';

  @override
  String authorsCount(int count) {
    return '$count auteurs';
  }

  @override
  String genresCount(int count) {
    return '$count genres';
  }

  @override
  String percentCompleted(int percent) {
    return '$percent% terminé';
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
    return '$count titres organisés pour une navigation privilégiant la lecture.';
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
  String get noBookmarkedItems =>
      'Aucun élément dans les marque-pages pour le moment';

  @override
  String get nothingMatchesSection =>
      'Rien ne correspond encore à cette section. Essayez un autre onglet ou revenez une fois la synchronisation de la bibliothèque terminée.';

  @override
  String get audiobooks => 'Livres audio';

  @override
  String noLabelFound(String label) {
    return 'Aucun $label trouvé';
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
  String get latestBooks => 'Livres récemment ajoutés';

  @override
  String get latestAudiobooks => 'Livres audio récemment ajoutés';

  @override
  String get latestComics => 'Dernières bandes dessinées';

  @override
  String get comics => 'Bandes dessinées';

  @override
  String bookSeriesItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres',
      one: '$count livre',
    );
    return '$_temp0';
  }

  @override
  String get bookFormatBook => 'Livre';

  @override
  String get bookFormatAudiobook => 'Livre audio';

  @override
  String get bookFormatComic => 'Bande dessinée';

  @override
  String get noBooksFound => 'Aucun livre trouvé pour cet auteur.';

  @override
  String get noBooksFoundDescription =>
      'Cette bibliothèque ne contient encore aucun livre, livre audio ni bande dessinée.';

  @override
  String bookPercentRead(int percent) {
    return '$percent% lu';
  }

  @override
  String bookTimeLeft(String time) {
    return '$time restant';
  }

  @override
  String get bookHeroRead => 'Lire';

  @override
  String get bookHeroListen => 'Écouter';

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
  String get internetArchive => 'Internet Archive';

  @override
  String get rssFeed => 'Flux RSS';

  @override
  String get downloadZip => 'Télécharger le ZIP';

  @override
  String sectionCountLabel(int count) {
    return '$count rubriques';
  }

  @override
  String firstPublished(int year) {
    return 'Première publication $year';
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
    return '$count livres';
  }

  @override
  String get couldNotLoadSubject =>
      'Impossible de charger ce sujet pour le moment.';

  @override
  String get audiobookDetails => 'Détails du livre audio';

  @override
  String authorsCountTitle(int count) {
    return '$count Auteurs';
  }

  @override
  String audiobookCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count livres audio',
      one: '$count livre audio',
    );
    return '$_temp0';
  }

  @override
  String get trackList => 'Liste des pistes';

  @override
  String get itemListPlaceholder => 'La liste des éléments apparaîtra ici';

  @override
  String get failedToLoad => 'Impossible de charger';

  @override
  String get delete => 'Supprimer';

  @override
  String get save => 'Enregistrer';

  @override
  String get moreLikeThis => 'Plus de ce genre';

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
  String get musicVideos => 'Vidéoclips';

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
    return 'Disque $number';
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
  String get unableToLoadAuthorDetails =>
      'Impossible de charger les détails de l\'auteur pour le moment.';

  @override
  String published(int year) {
    return 'Publié $year';
  }

  @override
  String get publicationDateUnknown => 'Date de publication inconnue';

  @override
  String seasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saisons',
      one: '$count saison',
    );
    return '$_temp0';
  }

  @override
  String endsAt(String time) {
    return 'Se termine à $time';
  }

  @override
  String get items => 'Objets';

  @override
  String get extras => 'Extras';

  @override
  String get additionalParts => 'Parties supplémentaires';

  @override
  String get behindTheScenes => 'Coulisses';

  @override
  String get deletedScenes => 'Scènes supprimées';

  @override
  String get featurettes => 'Featurettes';

  @override
  String get interviews => 'Interviews';

  @override
  String get scenes => 'Scènes';

  @override
  String get shorts => 'Courts-métrages';

  @override
  String get trailers => 'Bandes-annonces';

  @override
  String timeRemaining(String time) {
    return '$time restante';
  }

  @override
  String endsIn(String time) {
    return 'Fin dans $time';
  }

  @override
  String get view => 'Voir';

  @override
  String get resumeReading => 'Reprendre la lecture';

  @override
  String get read => 'Lire';

  @override
  String resumeFrom(String position) {
    return 'Reprendre de $position';
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
  String get castMembers => 'Distribution';

  @override
  String get trailer => 'Bande-annonce';

  @override
  String get finished => 'Terminé';

  @override
  String get favorited => 'En favori';

  @override
  String get favorite => 'Favori';

  @override
  String get playlist => 'Playlist';

  @override
  String get downloaded => 'Téléchargé';

  @override
  String get finalizingDownload => 'Finalisation…';

  @override
  String get queuedDownload => 'En file d\'attente';

  @override
  String queuedMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count autres en file d\'attente',
      one: '$count autre en file d\'attente',
    );
    return '$_temp0';
  }

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
  String get deletePlaylist => 'Supprimer la Playlist';

  @override
  String get deletePlaylistMessage => 'Supprimer cette Playlist du serveur ?';

  @override
  String get deleteItemMessage => 'Supprimer cet élément du serveur ?';

  @override
  String get failedToDeletePlaylist => 'Échec de la suppression de la playlist';

  @override
  String get failedToDeleteItem => 'Échec de la suppression de l\'élément';

  @override
  String failedToDeleteItemWithError(String error) {
    return 'Échec de la suppression avec l\'erreur suivante : $error';
  }

  @override
  String get renamePlaylist => 'Renommer la Playlist';

  @override
  String get playlistName => 'Nom de la Playlist';

  @override
  String get deleteDownloadedAlbum => 'Supprimer l\'album téléchargé';

  @override
  String deleteDownloadedTracksMessage(String title) {
    return 'Supprimer les pistes téléchargées pour \"$title\" ?';
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
    return 'Aucun $itemLabel chargé';
  }

  @override
  String downloadingTitle(String title, int count) {
    return 'Téléchargement de $title ($count éléments)…';
  }

  @override
  String deleteConfirmMessage(String name) {
    return 'Êtes-vous sûr de vouloir supprimer « $name » du serveur ? Cette action ne peut pas être annulée.';
  }

  @override
  String get itemDeleted => 'Élément supprimé';

  @override
  String get noPlayableTrailerFound => 'Aucune bande-annonce lisible trouvée.';

  @override
  String unsupportedBookFormat(String extension) {
    return 'Format de livre non pris en charge : .$extension';
  }

  @override
  String get audioTrack => 'Piste audio';

  @override
  String get subtitleTrack => 'Piste de sous-titres';

  @override
  String get none => 'Aucun';

  @override
  String get downloadSubtitlesLabel => 'Télécharger des sous-titres…';

  @override
  String get searchOpenSubtitlesPlugin =>
      'Rechercher avec le plugin OpenSubtitles';

  @override
  String get downloadSubtitles => 'Télécharger des sous-titres';

  @override
  String get searchingSubtitles => 'Recherche de sous-titres…';

  @override
  String get fetchingSubtitles => 'Chargement des sous-titres';

  @override
  String get downloadingSubtitle => 'Téléchargement du sous-titre…';

  @override
  String get selectedSubtitleInvalid =>
      'Le sous-titre sélectionné n\'est pas valide.';

  @override
  String subtitleDownloadedSelected(String name) {
    return 'Sous-titre téléchargé et sélectionné : $name';
  }

  @override
  String get subtitleDownloadedPending =>
      'Sous-titre téléchargé. Il peut mettre un moment à apparaître pendant que Jellyfin actualise l\'élément.';

  @override
  String noRemoteSubtitlesFound(String language) {
    return 'Aucun sous-titre distant trouvé pour $language.';
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
  String get downloadScopeTitle => 'Éléments à télécharger';

  @override
  String get downloadAllEpisodes => 'Tous les épisodes';

  @override
  String get downloadUnwatchedEpisodes => 'Tous les épisodes non vus';

  @override
  String get downloadAllMovies => 'Tous les films';

  @override
  String get downloadUnwatchedMovies => 'Tous les films non vus';

  @override
  String get downloadScopeLoading => 'Chargement des éléments…';

  @override
  String get downloadScopeLoadFailed =>
      'Impossible de charger les éléments à télécharger';

  @override
  String downloadEstimateTotal(String size) {
    return '~$size au total';
  }

  @override
  String downloadBytesOfTotal(String received, String total) {
    return '$received sur $total';
  }

  @override
  String downloadSpeed(String speed) {
    return '$speed/s';
  }

  @override
  String downloadSizeTotal(String size) {
    return '$size au total';
  }

  @override
  String downloadEstimateUnknownCount(int count) {
    return '$count de taille inconnue';
  }

  @override
  String downloadingItem(String name, String quality) {
    return 'Téléchargement de $name ($quality)…';
  }

  @override
  String get deleteDownloadedFiles => 'Supprimer les fichiers téléchargés';

  @override
  String deleteLocalFilesMessage(String typeLabel) {
    return 'Supprimer les fichiers locaux pour $typeLabel ?\n\nCela libérera de l\'espace de stockage. Vous pourrez retélécharger plus tard.';
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
  String get starring => 'AVEC';

  @override
  String get directors => 'RÉALISATEURS';

  @override
  String get writer => 'SCÉNARISTE';

  @override
  String get writers => 'SCÉNARISTES';

  @override
  String get studio => 'STUDIO';

  @override
  String studioMoreCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '+$count autres',
      one: '+$count autre',
    );
    return '$_temp0';
  }

  @override
  String totalEpisodes(int count) {
    return '$count Épisodes';
  }

  @override
  String episodeProgress(int watched, int total) {
    return '$watched / $total';
  }

  @override
  String episodeLabel(int number) {
    return 'Épisode $number';
  }

  @override
  String chapterNumber(int number) {
    return 'Chapitre $number';
  }

  @override
  String trackCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistes',
      one: '$count piste',
    );
    return '$_temp0';
  }

  @override
  String chapterCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chapitres',
      one: '$count chapitre',
    );
    return '$_temp0';
  }

  @override
  String born(String date) {
    return 'Né $date';
  }

  @override
  String died(String date) {
    return 'Décédé $date';
  }

  @override
  String age(int age) {
    return 'Âge $age';
  }

  @override
  String get showLess => 'Voir moins';

  @override
  String get readMore => 'Lire plus';

  @override
  String get shuffle => 'Aléatoire';

  @override
  String get shuffleAll => 'Tout lire en aléatoire';

  @override
  String get shuffleAllMusic => 'Lire toute la musique en aléatoire';

  @override
  String get carSignInPrompt => 'Connectez-vous à Moonfin sur votre téléphone';

  @override
  String get carServerUnreachable => 'Impossible de joindre votre serveur';

  @override
  String downloadsCount(int count) {
    return '$count téléchargements';
  }

  @override
  String get perfectMatch => 'Correspondance parfaite';

  @override
  String get aiTranslated => 'Traduit par IA';

  @override
  String get machineTranslated => 'Traduit automatiquement';

  @override
  String get hearingImpaired => 'SME';

  @override
  String framerateFps(String rate) {
    return '$rate fps';
  }

  @override
  String get mono => 'Mono';

  @override
  String get stereo => 'Stéréo';

  @override
  String remoteSubtitlePermissionError(String action) {
    return 'Les sous-titres distants $action nécessitent l\'autorisation de gestion des sous-titres Jellyfin pour cet utilisateur.';
  }

  @override
  String remoteSubtitleNotFoundError(String action) {
    return 'Cet élément est introuvable sur le serveur pour le sous-titre distant $action.';
  }

  @override
  String remoteSubtitleDetailError(String action, String detail) {
    return 'Le sous-titre distant $action a échoué : $detail';
  }

  @override
  String remoteSubtitleHttpError(String action, int status) {
    return 'Le sous-titre distant $action a échoué (HTTP $status).';
  }

  @override
  String remoteSubtitleGenericError(String action) {
    return 'Échec de la $action sous-titres distants.';
  }

  @override
  String deleteSeriesFiles(String name) {
    return 'tous les épisodes téléchargés pour \"$name\"';
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
    return '$label échec de l\'action : $error';
  }

  @override
  String failedToSetCastVolume(String error) {
    return 'Échec de la définition du volume de diffusion : $error';
  }

  @override
  String castControlsTitle(String label) {
    return '$label Contrôles';
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
    return 'Arrêtez $label';
  }

  @override
  String get queueIsEmpty => 'La file d\'attente est vide';

  @override
  String trackNumber(int number) {
    return 'Suivre $number';
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
    return '$seconds secondes';
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
    return '$mbps Mbit/s';
  }

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
  String get showMpvStats => 'Afficher les statistiques mpv (Maj+I)';

  @override
  String get hideMpvStats => 'Masquer les statistiques mpv (Maj+I)';

  @override
  String get keyboardShortcutsTitle => 'Raccourcis clavier';

  @override
  String get keyboardShortcutsSubtitle =>
      'Application, lecteur vidéo et liseuse';

  @override
  String get keyboardShortcutsPlayerHint =>
      'Appuyez sur ? ou F1 pendant la lecture pour consulter cette liste sans quitter le lecteur.';

  @override
  String get keyboardShortcutsSectionApp => 'Partout';

  @override
  String get keyboardShortcutsSectionAppScope => 'Sur tous les écrans';

  @override
  String get keyboardShortcutsSectionPlayer => 'Lecteur vidéo';

  @override
  String get keyboardShortcutsSectionPlayerScope =>
      'Quand une vidéo est ouverte, en lecture ou en pause';

  @override
  String get keyboardShortcutsSectionReader => 'Liseuse de livres et de BD';

  @override
  String get keyboardShortcutsSectionReaderScope =>
      'Pendant la lecture d\'un livre ou d\'une BD';

  @override
  String get keyNameArrowKeys => 'Les flèches';

  @override
  String get keyNameSpace => 'Espace';

  @override
  String get keyNameEnter => 'Entrée';

  @override
  String get keyNameEsc => 'Échap';

  @override
  String get keyNameBackspace => 'Retour arrière';

  @override
  String get keyNameDelete => 'Suppr';

  @override
  String get keyNamePageUp => 'Page Up';

  @override
  String get keyNamePageDown => 'Page Down';

  @override
  String get keyNameHome => 'Home';

  @override
  String get keyNameEnd => 'End';

  @override
  String get keyNameShift => 'Maj';

  @override
  String get keyNameCtrl => 'Ctrl';

  @override
  String get keyNameAlt => 'Alt';

  @override
  String get keyNameScrollWheel => 'Molette';

  @override
  String get shortcutMoveFocus => 'Se déplacer entre les éléments';

  @override
  String get shortcutActivate => 'Ouvrir l\'élément sélectionné';

  @override
  String get shortcutGoBack => 'Revenir en arrière';

  @override
  String get shortcutToggleFullscreen => 'Activer ou quitter le plein écran';

  @override
  String get shortcutQuit => 'Quitter Moonfin';

  @override
  String get shortcutPlayPause => 'Lecture ou pause';

  @override
  String get shortcutShowControlsOrPlayPause =>
      'Afficher les commandes, ou lecture/pause si elles sont déjà visibles';

  @override
  String get shortcutSeekBack =>
      'Reculer (maintenir pour des sauts plus longs)';

  @override
  String get shortcutSeekForward =>
      'Avancer (maintenir pour des sauts plus longs)';

  @override
  String get shortcutVolumeUp => 'Augmenter le volume';

  @override
  String get shortcutVolumeDown => 'Baisser le volume';

  @override
  String get shortcutMute => 'Couper ou rétablir le son';

  @override
  String get shortcutToggleSubtitles => 'Activer ou désactiver les sous-titres';

  @override
  String get shortcutSlower => 'Ralentir';

  @override
  String get shortcutFaster => 'Accélérer';

  @override
  String get shortcutPlaybackInfo => 'Afficher les informations de lecture';

  @override
  String get shortcutMpvStats => 'Activer ou désactiver les statistiques mpv';

  @override
  String get shortcutRecropBlackBars => 'Rogner les bandes noires';

  @override
  String get shortcutLeaveFullscreenOrStop =>
      'Quitter le plein écran, ou arrêter la lecture si déjà quitté';

  @override
  String get shortcutHideControls => 'Masquer les commandes';

  @override
  String get shortcutStopPlayback => 'Arrêter la lecture';

  @override
  String get shortcutNextItem => 'Élément suivant';

  @override
  String get shortcutPreviousItem => 'Élément précédent';

  @override
  String get shortcutSkipSegment =>
      'Ignorer l\'intro ou le générique lorsque c\'est proposé';

  @override
  String get shortcutShowShortcuts => 'Afficher cette liste';

  @override
  String get shortcutNextPage => 'Page suivante';

  @override
  String get shortcutPreviousPage => 'Page précédente';

  @override
  String get shortcutScrollPage => 'Faire défiler la page (livres numériques)';

  @override
  String get shortcutFirstPage => 'Première page, ou début du chapitre';

  @override
  String get shortcutLastPage => 'Dernière page, ou fin du chapitre';

  @override
  String get shortcutZoom => 'Zoomer ou dézoomer (BD)';

  @override
  String get shortcutResetZoom => 'Réinitialiser le zoom (BD)';

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
  String get videoRenderer => 'Moteur de rendu vidéo';

  @override
  String get videoRendererDescription =>
      'La fenêtre native offre le mouvement le plus fluide et transmet le HDR à l\'écran sans le modifier. Essayez une autre option si la vidéo pose problème.';

  @override
  String get videoRendererNativeWindow => 'Fenêtre native (recommandé)';

  @override
  String get videoRendererNativeHdrOnly =>
      'Fenêtre native pour le HDR uniquement';

  @override
  String get videoRendererInApp => 'Dans l\'application (ancien)';

  @override
  String get track => 'Piste';

  @override
  String get channels => 'Canaux';

  @override
  String get format => 'Format';

  @override
  String get external => 'Externe';

  @override
  String get embedded => 'Intégré';

  @override
  String castSessionError(String protocol) {
    return '$protocol erreur de session';
  }

  @override
  String failedToLoadBookDetails(String error) {
    return 'Échec du chargement des détails du livre : $error';
  }

  @override
  String get epubUnavailableOnPlatform =>
      'Le rendu EPUB intégré n\'est pas encore disponible sur cette plateforme.';

  @override
  String get bookReadingUnavailableTitle => 'Books can\'t be read on Apple TV';

  @override
  String get bookReadingUnavailableMessage =>
      'Open it in Moonfin on a phone, tablet or computer to read it. Audiobooks still play here.';

  @override
  String formatCannotRenderInApp(String extension) {
    return 'Ce format (.$extension) ne peut pas encore être rendu dans l\'application.';
  }

  @override
  String get embeddedRenderingUnavailable =>
      'Le rendu intégré des documents n\'est pas disponible sur cette plateforme.';

  @override
  String get couldNotOpenExternalViewer =>
      'Impossible d\'ouvrir la visionneuse externe.';

  @override
  String failedToOpenInAppReader(String error) {
    return 'Échec de l\'ouverture du lecteur intégré à l\'application : $error';
  }

  @override
  String bookmarkAlreadySaved(String label) {
    return 'Signet déjà enregistré sur $label.';
  }

  @override
  String bookmarkAdded(String label) {
    return 'Signet ajouté : $label';
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
    return 'Format : .$extension';
  }

  @override
  String percentRead(String percent) {
    return '$percent% lu';
  }

  @override
  String get updating => 'Mise à jour…';

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
    return 'Réinitialiser le zoom (${zoom}x)';
  }

  @override
  String get singlePage => 'Page simple';

  @override
  String get twoPageSpread => 'Double page';

  @override
  String get addBookmark => 'Ajouter un signet';

  @override
  String get bookmarksEllipsis => 'Signets…';

  @override
  String get markedAsRead => 'Marqué comme lu';

  @override
  String get markedAsUnread => 'Marqué comme non lu';

  @override
  String failedToUpdateReadState(String error) {
    return 'Échec de la mise à jour de l\'état de lecture : $error';
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
  String get preparingInAppReader => 'Préparation du lecteur intégré…';

  @override
  String get pdfDataNotAvailable => 'Données PDF indisponibles.';

  @override
  String get readerFallbackModeActive => 'Mode de secours du lecteur activé';

  @override
  String platformCannotHostDocumentEngine(String extension) {
    return 'Cette plateforme ne peut pas héberger le moteur de documents intégré pour les fichiers $extension.';
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
  String get guideRepeatBadge => 'Rediffusion';

  @override
  String get guideTimeline => 'Grille des Programmes';

  @override
  String failedToLoadGuide(String error) {
    return 'Échec du chargement du guide : $error';
  }

  @override
  String get noChannelsFound => 'Aucune chaîne trouvée';

  @override
  String get noProgramData => 'Aucune info de programme';

  @override
  String get liveBadge => 'EN DIRECT';

  @override
  String get liveTvJumpToLive => 'Revenir au direct';

  @override
  String guideNextProgram(String time, String title) {
    return 'A suivre : $time   $title';
  }

  @override
  String guideMinutesLeft(int minutes) {
    return '${minutes}min restantes';
  }

  @override
  String guideHoursLeft(int hours) {
    return '${hours}h restantes';
  }

  @override
  String guideHoursMinutesLeft(int hours, int minutes) {
    return '${hours}h ${minutes}min restantes';
  }

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
  String get record => 'Enregistrer';

  @override
  String nextSeriesRecording(String dateTime) {
    return 'Prochain enregistrement de la série : $dateTime';
  }

  @override
  String get noUpcomingSeriesRecording =>
      'L\'enregistrement de la série est programmé, mais le guide n\'annonce aucun épisode à venir';

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
  String get recordCurrentEpisode => 'Enregistrer cet épisode';

  @override
  String get recordCurrentProgram => 'Enregistrer ce programme';

  @override
  String get cancelCurrentRecording => 'Annuler cet enregistrement';

  @override
  String get cancelRecordingAction => 'Annuler l\'enregistrement';

  @override
  String get programSetToRecord => 'Programme prêt à enregistrer';

  @override
  String get recordingCancelled => 'Enregistrement annulé';

  @override
  String get unableToCreateRecording => 'Impossible de créer un enregistrement';

  @override
  String get recordSeries => 'Enregistrer la série';

  @override
  String get seriesSetToRecord => 'Enregistrement de la série programmé';

  @override
  String get seriesRecordingCancelled => 'Enregistrement de la série annulé';

  @override
  String get unableToCreateSeriesRecording =>
      'Impossible de programmer l\'enregistrement de la série';

  @override
  String get watch => 'Regarder';

  @override
  String get watchChannelLive => 'Regarder la chaîne en direct';

  @override
  String get close => 'Fermer';

  @override
  String failedToPlayChannel(String name) {
    return 'Échec de la lecture de $name';
  }

  @override
  String get playbackStreamLost =>
      'La lecture s\'est interrompue et n\'a pas pu reprendre.';

  @override
  String get playbackVideoUnsupported =>
      'Cet appareil ne peut pas lire le format de cette vidéo. Essayez un lecteur externe.';

  @override
  String liveReconnecting(int attempt, int total) {
    return 'Reconnexion… ($attempt sur $total)';
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
    return 'Annuler l\'enregistrement programmé de \"$name\" ?';
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
    return 'Arrêter l\'enregistrement de \"$name\" ?';
  }

  @override
  String get failedToCancelSeriesRecording =>
      'Échec de l’annulation de l’enregistrement de la série';

  @override
  String get searchThisLibrary => 'Rechercher dans cette bibliothèque…';

  @override
  String get searchEllipsis => 'Rechercher…';

  @override
  String noResultsForQuery(String query) {
    return 'Aucun résultat pour \"$query\"';
  }

  @override
  String searchFailedError(String error) {
    return 'Échec de la recherche : $error';
  }

  @override
  String get seerr => 'Seerr';

  @override
  String get seerrAccountType => 'Type de compte Seerr';

  @override
  String get jellyfinAccount => 'Jellyfin';

  @override
  String get localAccount => 'Local';

  @override
  String get savedMedia => 'Téléchargements';

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
    return 'Supprimer \"$name\" et ses fichiers ?';
  }

  @override
  String tracksCount(int count) {
    return '$count pistes';
  }

  @override
  String get album => 'Album';

  @override
  String get playAlbum => 'Lire l’album';

  @override
  String failedToLoadAlbum(String error) {
    return 'Échec du chargement de l\'album : $error';
  }

  @override
  String noDownloadedTracksForAlbum(String name) {
    return 'Aucune piste téléchargée trouvée pour $name.';
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
    return 'Supprimer \"$name\" ?';
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
    return 'Épisode $number';
  }

  @override
  String get seriesNotFound => 'Série introuvable';

  @override
  String get errorLoadingSeries => 'Erreur lors du chargement de la série';

  @override
  String get downloadedEpisodes => 'Épisodes téléchargés';

  @override
  String seasonNumber(int number) {
    return 'Saison $number';
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
    return 'Supprimer tous les épisodes téléchargés dans $season ?';
  }

  @override
  String episodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count épisodes',
      one: '$count épisode',
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
  String get activeDownloads => 'Téléchargements en cours';

  @override
  String savedMediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '$count élément',
    );
    return '$_temp0';
  }

  @override
  String savedMediaOfLimit(String used, String limit) {
    return '$used sur $limit';
  }

  @override
  String get savedMediaSelectItems => 'Sélectionner des éléments';

  @override
  String get savedMediaNoDownloads => 'Aucun téléchargement pour l\'instant';

  @override
  String get savedMediaNoDownloadsDetail =>
      'Vos téléchargements apparaissent ici et se lisent sans connexion.';

  @override
  String get savedMediaNoActiveDownloads => 'Aucun téléchargement en cours';

  @override
  String get savedMediaNoResults =>
      'Aucun téléchargement ne correspond à cette recherche';

  @override
  String get savedMediaPlayFromStart => 'Lire depuis le début';

  @override
  String get savedMediaGoToDetails => 'Voir les détails';

  @override
  String get savedMediaDeleteDownload => 'Supprimer le téléchargement';

  @override
  String savedMediaDeleteSeason(String season) {
    return 'Supprimer $season';
  }

  @override
  String savedMediaDeleteEpisodes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Supprimer $count épisodes',
      one: 'Supprimer $count épisode',
    );
    return '$_temp0';
  }

  @override
  String get savedMediaOpenShow => 'Ouvrir la série';

  @override
  String get savedMediaPlayNextUnwatched => 'Lire le prochain épisode non vu';

  @override
  String get savedMediaRead => 'Lire';

  @override
  String get savedMediaCancelDownload => 'Annuler le téléchargement';

  @override
  String get sortBySize => 'Taille';

  @override
  String get sortByName => 'Nom';

  @override
  String get sortByDateAdded => 'Date d\'ajout';

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
    return 'Supprimer $count éléments téléchargés ?';
  }

  @override
  String get musicAndAudiobooks => 'Musique et livres audio';

  @override
  String get images => 'Images';

  @override
  String get database => 'Base de données';

  @override
  String ofStorageLimit(String limit) {
    return 'de $limit limite';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get settingsSearchHint => 'Rechercher dans les réglages';

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
  String get focusBorderColor => 'Couleur de la bordure de sélection';

  @override
  String get watchedIndicators => 'Indicateurs de visionnage';

  @override
  String get always => 'Toujours';

  @override
  String get mixedRowsOnly => 'Rangées mixtes uniquement';

  @override
  String get hideUnwatched => 'Masquer les non vus';

  @override
  String get episodesOnly => 'Épisodes uniquement';

  @override
  String get never => 'Jamais';

  @override
  String get focusExpansionAnimation => 'Animation d’agrandissement du focus';

  @override
  String get desktopUiScale => 'Taille de l\'interface utilisateur';

  @override
  String get scaleFocusedCards =>
      'Agrandir les cartes et vignettes focalisées ou survolées';

  @override
  String get seriesThumbnails => 'Afficher le visuel de la série';

  @override
  String get seriesThumbnailsDescription =>
      'Pour les séries TV, utiliser le visuel principal de la série au lieu de la miniature de l\'épisode.';

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
  String get loadingAnimation => 'Animation de chargement';

  @override
  String get loadingAnimationDescription =>
      'Personnalisez les animations de chargement utilisées dans Moonfin';

  @override
  String get loadingAnimationConfiguration =>
      'Configuration de l\'animation de chargement';

  @override
  String get loadingAnimationImage => 'Image';

  @override
  String get loadingAnimationImageMoonfinLogo => 'Logo Moonfin';

  @override
  String get loadingAnimationImageSpinner => 'Roue de chargement';

  @override
  String get loadingAnimationImageRunner => 'Runner';

  @override
  String get loadingAnimationImageMoonPhases => 'Phases Moon';

  @override
  String get loadingAnimationImageMoonfinPhases => 'Phases Moonfin';

  @override
  String get loadingAnimationImageNeonfinPhases => 'Phases Neonfin';

  @override
  String get loadingAnimationSize => 'Taille de l\'animation';

  @override
  String get loadingAnimationSizeThumbnail => 'Miniature';

  @override
  String get loadingAnimationSizeSmall => 'Petite';

  @override
  String get loadingAnimationSizeMedium => 'Moyenne';

  @override
  String get loadingAnimationSizeLarge => 'Grande';

  @override
  String get loadingAnimationPosition => 'Position de l\'animation';

  @override
  String get loadingAnimationPositionTopLeft => 'En haut à gauche';

  @override
  String get loadingAnimationPositionTopCenter => 'En haut au centre';

  @override
  String get loadingAnimationPositionTopRight => 'En haut à droite';

  @override
  String get loadingAnimationPositionMiddleLeft => 'Au milieu à gauche';

  @override
  String get loadingAnimationPositionMiddle => 'Au centre';

  @override
  String get loadingAnimationPositionMiddleRight => 'Au milieu à droite';

  @override
  String get loadingAnimationPositionBottomLeft => 'En bas à gauche';

  @override
  String get loadingAnimationPositionBottomCenter => 'En bas au centre';

  @override
  String get loadingAnimationPositionBottomRight => 'En bas à droite';

  @override
  String get loadingAnimationPositionBouncing => 'Rebondissante';

  @override
  String get loadingAnimationSpeed => 'Vitesse de l\'animation';

  @override
  String get loadingAnimationSpeedSlow => 'Lente';

  @override
  String get loadingAnimationSpeedModerate => 'Modérée';

  @override
  String get loadingAnimationSpeedFast => 'Rapide';

  @override
  String get loadingAnimationSpeedUltra => 'Ultra';

  @override
  String get showLoadingAnimationText => 'Afficher le texte';

  @override
  String get loadingAnimationPreview => 'Aperçu';

  @override
  String get snow => 'Neige';

  @override
  String get fireworks => 'Feux d’artifice';

  @override
  String get confetti => 'Confettis';

  @override
  String get fallingLeaves => 'Feuilles tombantes';

  @override
  String get seasonalChristmas => 'Noël';

  @override
  String get seasonalPetals => 'Pétales de printemps';

  @override
  String get seasonalFireflies => 'Lucioles';

  @override
  String get seasonalHalloween => 'Halloween';

  @override
  String get seasonalDensity => 'Densité';

  @override
  String get seasonalDensityLight => 'Légère';

  @override
  String get seasonalDensityNormal => 'Normale';

  @override
  String get seasonalDensityHeavy => 'Dense';

  @override
  String get seasonalFollower => 'Focus Follower';

  @override
  String get seasonalFollowerDescription =>
      'A holiday piece, like Halloween\'s planchette, follows what you select on Home';

  @override
  String get seasonalFollowerPointerDescription =>
      'A holiday piece, like Halloween\'s planchette, replaces the mouse pointer on Home';

  @override
  String get seasonalRow => 'Rangée saisonnière';

  @override
  String get seasonalRowDescription =>
      'Afficher une rangée de films de fêtes issus de votre bibliothèque, avec des suggestions Seerr lorsqu\'elles sont disponibles.';

  @override
  String get seasonalRowSubtitle => 'Saisonnier';

  @override
  String get seasonalRowCountry => 'Pays';

  @override
  String get seasonalRowCountryAuto => 'Automatique';

  @override
  String get countryUnitedStates => 'États-Unis';

  @override
  String get countryCanada => 'Canada';

  @override
  String get seasonalRowCountryOther => 'Autre';

  @override
  String get seasonalRowHolidays => 'Fêtes';

  @override
  String get seasonalRowHolidaysHint =>
      'Décochez une fête pour masquer sa rangée.';

  @override
  String get holidayNewYear => 'Nouvel An';

  @override
  String get holidayValentines => 'Saint-Valentin';

  @override
  String get holidayEaster => 'Pâques';

  @override
  String get holidayPride => 'Mois des fiertés';

  @override
  String get holidayHalloween => 'Halloween';

  @override
  String get holidayThanksgiving => 'Thanksgiving';

  @override
  String get holidayChristmas => 'Films de Noël';

  @override
  String get holidayLunarNewYear => 'Nouvel An lunaire';

  @override
  String get holidayDiwali => 'Diwali';

  @override
  String get themeMusic => 'Thème musical';

  @override
  String get playThemeMusicOnDetailPages =>
      'Lire le thème musical sur les pages de détail';

  @override
  String get themeMusicVolume => 'Volume du thème musical';

  @override
  String percentValue(int value) {
    return '$value%';
  }

  @override
  String get themeMusicOnHomeRows => 'Thème musical sur les rangées d\'accueil';

  @override
  String get playWhenBrowsingHomeScreen =>
      'Lire lors de la navigation sur l’écran d’accueil';

  @override
  String get loopThemeMusic => 'Lire le thème musical en boucle';

  @override
  String get loopThemeMusicSubtitle =>
      'Répéter la piste au lieu de la lire une seule fois';

  @override
  String get detailsBackgroundBlur => 'Flou d\'arrière-plan des détails';

  @override
  String get detailsBackgroundOpacity => 'Opacité de l\'arrière-plan';

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
  String get playerZoomMode => 'Zoom du lecteur';

  @override
  String get settingsScrollWheelAction => 'Molette de la souris';

  @override
  String get settingsScrollWheelActionDescription =>
      'Choisir l\'action du défilement avec la molette de la souris durant la lecture.';

  @override
  String get scrollWheelActionOff => 'Désactivé';

  @override
  String get scrollWheelActionSeek => 'Défilement (avant / arrière)';

  @override
  String get scrollWheelActionVolume => 'Volume';

  @override
  String get playerTooltipVolume => 'Volume';

  @override
  String get fit => 'Ajuster';

  @override
  String get autoCrop => 'Remplir l\'écran';

  @override
  String get cropBlackBars => 'Rogner les bandes noires';

  @override
  String get settingsCropBlackBarsDescription =>
      'Détecte les bandes noires encodées après le démarrage de la lecture, les rogne, puis remplit l\'écran. Relancez le rognage depuis le bouton de zoom du lecteur.';

  @override
  String get cropBlackBarsRecropInterval => 'Intervalle de rognage';

  @override
  String get cropBlackBarsOnce => 'Une fois au démarrage';

  @override
  String get cropBlackBarsEverySecond => 'Chaque seconde';

  @override
  String get settingsCropBlackBarsIntervalDescription =>
      'Suit les changements de format d\'image pendant la lecture.';

  @override
  String get playerRecroppingBlackBars => 'Nouveau rognage des bandes noires';

  @override
  String get stretch => 'Étirer';

  @override
  String get refreshRateSwitching =>
      'Changement de fréquence de rafraîchissement';

  @override
  String get disabled => 'Désactivé';

  @override
  String get manual => 'Manuel';

  @override
  String get autoDetect => 'Détection automatique';

  @override
  String get scaleOnTv => 'Mise à l’échelle sur TV';

  @override
  String get scaleOnDevice => 'Mise à l’échelle sur l’appareil';

  @override
  String get trickPlay => 'Aperçu de lecture';

  @override
  String get showPreviewThumbnailsWhenSeeking =>
      'Afficher les miniatures d’aperçu pendant la recherche';

  @override
  String get trickplayDisplayStyleSingle => 'Miniature unique';

  @override
  String get trickplayDisplayStyleStrip => 'Pellicule';

  @override
  String get trickplayModeFull => 'Plein écran';

  @override
  String get trickplaySettingsPreviewHint =>
      'Faites glisser le curseur pour prévisualiser le défilement';

  @override
  String get trickplayPreviewScale => 'Taille de l\'aperçu';

  @override
  String get trickplayVerticalOffset => 'Distance à la barre de progression';

  @override
  String get trickplayFollowScrubPosition => 'Suivre la position du curseur';

  @override
  String get trickplayFollowScrubPositionSubtitle =>
      'L\'aperçu se déplace le long de la barre de progression au lieu de rester centré';

  @override
  String get trickplayPauseWhileScrubbing =>
      'Mettre en pause pendant le défilement';

  @override
  String get trickplayPauseWhileScrubbingSubtitle =>
      'La lecture se met en pause pendant la recherche et reprend quand vous appuyez sur lecture. Désactivez pour continuer la lecture et sauter directement au nouvel emplacement';

  @override
  String get showDescriptionOnPause => 'Afficher la description en pause';

  @override
  String get dimVideoShowOverview =>
      'Assombrir la vidéo et afficher le résumé pendant la pause';

  @override
  String get showChapterMarkers => 'Repères de chapitre';

  @override
  String get showChapterMarkersDescription =>
      'Marque le début de chaque chapitre sur la barre de progression';

  @override
  String get osdLockButton => 'Bouton de verrouillage OSD';

  @override
  String get osdLockButtonDescription =>
      'Afficher un bouton de verrouillage qui bloque les touches tactiles jusqu’à un appui long';

  @override
  String get playerSwipeGestures => 'Gestes de volume et de luminosité';

  @override
  String get playerSwipeGesturesDescription =>
      'Glissez vers le haut ou le bas sur le lecteur : à gauche pour la luminosité, à droite pour le volume';

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
  String get osdButtons => 'Boutons du lecteur';

  @override
  String get osdButtonsDescription =>
      'Choisir les boutons affichés par le lecteur';

  @override
  String get osdButtonsSectionDescription =>
      'Les commandes de lecture sont toujours affichées. Le reste est à votre choix, et chaque type d\'appareil conserve sa propre liste.';

  @override
  String get detailButtons => 'Boutons d\'action';

  @override
  String get detailButtonsDescription =>
      'Choisir les boutons affichés sur l\'écran de détails';

  @override
  String get detailButtonsSectionDescription =>
      'Le bouton Lecture est toujours en premier et les boutons verrouillés sont toujours affichés. Le reste est à votre choix, et chaque type d\'appareil conserve sa propre liste.';

  @override
  String get actionButtonsOnScreen => 'Boutons d\'action affichés';

  @override
  String get actionButtonsOnScreenDescription =>
      'Choisissez combien de boutons d\'action restent visibles avant d\'être regroupés dans le menu Plus d\'actions.';

  @override
  String get actionButtonsOnScreenAuto => 'Auto (thème par défaut)';

  @override
  String get actionButtonsOnScreenPlayOnly => '1 (lecture uniquement)';

  @override
  String get actionButtonsOnScreenAll => 'Tous (défilement horizontal)';

  @override
  String get detailMetadata => 'Affichage des métadonnées';

  @override
  String get detailMetadataDescription =>
      'Choisissez les métadonnées affichées sur l\'écran de détails et leur ordre';

  @override
  String get detailMetadataSectionDescription =>
      'Activez ou désactivez les métadonnées et organisez leur ordre d\'affichage sur l\'écran de détails. Chaque type d\'appareil conserve sa propre liste.';

  @override
  String get detailMetadataYear => 'Année de sortie';

  @override
  String get detailMetadataParentalRating => 'Classification parentale';

  @override
  String get detailMetadataRuntimeAndSeasons => 'Durée et saisons';

  @override
  String get detailMetadataStatus => 'Statut de la série';

  @override
  String get detailMetadataStatusSubtitle =>
      'Indique si la série est en cours, terminée ou en attente d\'une nouvelle saison';

  @override
  String get detailMetadataGenres => 'Genres';

  @override
  String get detailMetadataSeerrAvailability => 'Disponibilité Seerr';

  @override
  String get detailMetadataSeerrAvailabilitySubtitle =>
      'Indique l\'état des demandes et la disponibilité des médias d\'après Seerr';

  @override
  String get detailMetadataUpcomingEpisodeDate => 'Prochains épisodes';

  @override
  String get detailMetadataUpcomingEpisodeDateSubtitle =>
      'Utilise Sonarr et TMDB pour afficher les dates de sortie à venir';

  @override
  String get detailSections => 'Sections';

  @override
  String get detailSectionsDescription =>
      'Choisissez les parties de l\'écran de détails à afficher';

  @override
  String get detailSectionsScreenDescription =>
      'Seules les sections compatibles avec le style d\'écran de détails actuel sont listées. En masquer une la masque dans tous les styles qui la proposent.';

  @override
  String get detailSectionGroupHeader => 'En-tête';

  @override
  String get detailSectionGroupSections => 'Sections';

  @override
  String get detailSectionGroupPerson => 'Pages des personnes';

  @override
  String get detailSectionGroupCollection => 'Pages de collection';

  @override
  String get detailSectionGroupOther => 'Autres';

  @override
  String get detailSectionLogo => 'Logo';

  @override
  String get detailSectionLogoSubtitle =>
      'Affiche le titre en texte lorsque l\'option est désactivée';

  @override
  String get detailSectionTagline => 'Accroche';

  @override
  String get detailSectionPoster => 'Affiche';

  @override
  String get detailSectionVersionBadge => 'Badge de version';

  @override
  String get detailSectionUpNext => 'Prochain épisode';

  @override
  String get detailSectionLyrics => 'Paroles';

  @override
  String get detailSectionCast => 'Distribution';

  @override
  String get detailSectionCastSubtitle =>
      'Également sur les pages de collection';

  @override
  String get detailSectionCrew => 'Réalisation et scénario';

  @override
  String get detailSectionStudios => 'Studios';

  @override
  String get detailSectionChapters => 'Chapitres';

  @override
  String get detailSectionExtras => 'Bonus';

  @override
  String get detailSectionCollections => 'Collections';

  @override
  String get detailSectionMoreLikeThis => 'Titres similaires';

  @override
  String get detailSectionMoreLikeThisSubtitle =>
      'Également les albums et artistes similaires';

  @override
  String get detailSectionMoreEpisodes => 'Autres épisodes';

  @override
  String get detailSectionMoreEpisodesSubtitle => 'Sur les pages d\'épisode';

  @override
  String get detailSectionMediaInfo => 'Informations du média';

  @override
  String get detailSectionMediaInfoSubtitle =>
      'Fichier, pistes et vérification de la lecture directe';

  @override
  String get detailSectionSeerrGenresTags => 'Genres et tags';

  @override
  String get detailSectionSeerrStats => 'Statistiques';

  @override
  String get detailSectionSeerrStreaming => 'Streaming services';

  @override
  String get seerrStreamingOn => 'Streaming on';

  @override
  String get detailSectionSeerrRecommendations => 'Recommandations';

  @override
  String get detailSectionSeerrSimilar => 'Titres similaires';

  @override
  String get detailSectionSeerrCollection => 'Bannière de collection';

  @override
  String get detailSectionSeerrPersonAppearances => 'Apparitions';

  @override
  String get detailSectionSeerrPersonCrew => 'Équipe technique';

  @override
  String get detailSectionPersonPagesSubtitle => 'Sur les pages des personnes';

  @override
  String get detailSectionBiography => 'Biographie';

  @override
  String get detailSectionBirthplace => 'Lieu de naissance';

  @override
  String get detailSectionPersonLinks => 'Links';

  @override
  String get detailSectionPersonLinksSubtitle => 'IMDb, TMDB and social media';

  @override
  String get detailSectionGuestAppearances => 'Apparitions d\'invités';

  @override
  String get detailSectionMusicVideos => 'Vidéoclips';

  @override
  String get detailSectionPlaylistOrder => 'Ordre de visionnage';

  @override
  String get detailSectionBookGenres => 'Genres du livre';

  @override
  String get detailSectionPhotoExif => 'Détails de la photo';

  @override
  String upcomingEpisodeNext(String date, int season, int episode) {
    return 'Prochainement : $date (S$season:E$episode)';
  }

  @override
  String get upcomingEpisodeToday => 'Aujourd\'hui';

  @override
  String get upcomingEpisodeTomorrow => 'Demain';

  @override
  String get moveUp => 'Monter';

  @override
  String get moveDown => 'Descendre';

  @override
  String get buttonOrderHint =>
      'Utilisez les flèches pour modifier l\'ordre. Avec une télécommande, les touches gauche et droite déplacent le bouton sélectionné. Désactiver un bouton le place en bas de la liste.';

  @override
  String get buttonShownInSyncPlayGroup =>
      'S\'affiche uniquement lorsque vous êtes dans un groupe SyncPlay';

  @override
  String get orientationLock => 'Verrouillage de l\'orientation';

  @override
  String get fullscreen => 'Plein écran';

  @override
  String get audioBehavior => 'Comportement audio';

  @override
  String get downmixToStereo => 'Mixer en stéréo';

  @override
  String get defaultAudioLanguage => 'Langue audio par défaut';

  @override
  String get fallbackAudioLanguage => 'Langue audio secondaire';

  @override
  String get preferDefaultAudioTrack => 'Préférer la piste audio par défaut';

  @override
  String get preferDefaultAudioTrackDescription =>
      'Préférer la piste audio originale au doublage.';

  @override
  String get preferAudioDescription =>
      'Préférer les pistes d\'audiodescription';

  @override
  String get preferAudioDescriptionDescription =>
      'Préférer les pistes d\'audiodescription aux pistes normales.';

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
  String get ac3Passthrough => 'Passthrough AC3';

  @override
  String get dtsPassthrough => 'Passthrough DTS';

  @override
  String get trueHdSupport => 'Prise en charge de TrueHD';

  @override
  String get enableDtsPassthrough =>
      'Audio Bitstream DTS vers AVR uniquement ; nécessite la piste source DTS et sa prise en charge par l\'AVR';

  @override
  String get settingsAudioFallbackCodec => 'Codec audio de secours';

  @override
  String get settingsAudioFallbackCodecDescription =>
      'Sélectionnez le format cible pour transcoder l\'audio multicanal lorsque le flux source ne peut pas être lu directement ou transmis en passthrough.';

  @override
  String get transcodeAudioCodecs => 'Transcode Audio Codecs';

  @override
  String get transcodeAudioCodecsDescription =>
      'The server converts audio in these formats instead of sending it as is.';

  @override
  String get settingsAudioFallbackCodecAuto =>
      'Détection automatique\n(Recommandé)';

  @override
  String get settingsAudioFallbackCodecAac => 'AAC\n(Par défaut)';

  @override
  String get settingsAudioFallbackCodecAc3 => 'AC3\n(Dolby Digital)';

  @override
  String get settingsAudioFallbackCodecEac3 => 'EAC3\n(Dolby Digital Plus)';

  @override
  String get settingsAudioFallbackCodecMp3 => 'MP3\n(Stéréo uniquement)';

  @override
  String get settingsAudioFallbackCodecOpus => 'Opus\n(Efficace)';

  @override
  String get settingsAudioFallbackCodecFlac => 'FLAC\n(Sans perte)';

  @override
  String get settingsMaxAudioChannels => 'Nombre maximum de canaux audio';

  @override
  String get settingsMaxAudioChannelsDescription =>
      'Configurez le nombre maximum de canaux de votre installation audio. Les flux multicanaux dépassant cette limite feront l\'objet d\'un downmix ou d\'un transcodage.';

  @override
  String get settingsMaxAudioChannelsAuto =>
      'Détection automatique\n(Réglage matériel par défaut))';

  @override
  String get settingsMaxAudioChannelsMono => '1.0 Mono';

  @override
  String get settingsMaxAudioChannelsStereo => '2.0 Stéréo';

  @override
  String get settingsMaxAudioChannels3_0 => '3.0 / 2.1 Surround';

  @override
  String get settingsMaxAudioChannels4_0 => '4.0 / 3.1 Quadraphonique';

  @override
  String get settingsMaxAudioChannels5_0 => '5.0 / 4.1 Surround';

  @override
  String get settingsMaxAudioChannels5_1 => '5.1 Surround';

  @override
  String get settingsMaxAudioChannels6_1 => '6.1 Surround';

  @override
  String get settingsMaxAudioChannels7_1 => '7.1 Surround';

  @override
  String get settingsAudioPassthroughAdvanced => 'Passthrough (avancé)';

  @override
  String get settingsAudioCodecPassthrough => 'Passthrough de codecs';

  @override
  String get settingsAudioCodecPassthroughDescription =>
      'Activez uniquement les formats pris en charge par votre récepteur AVR ou HDMI.';

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
      'Comment le son surround compressé est transmis à votre téléviseur ou ampli.';

  @override
  String get settingsAudioPassthroughModeDisabled =>
      'Désactivé (toujours décoder sur cet appareil)';

  @override
  String get settingsAudioPassthroughModeAuto =>
      'Auto (selon la prise en charge détectée)';

  @override
  String get settingsAudioPassthroughModeManual =>
      'Manuel (choisir les formats ci-dessous)';

  @override
  String get settingsAudioPassthroughOutput => 'Sortie Passthrough';

  @override
  String get settingsAudioPassthroughOutputDescription =>
      'Détermine quel composant encapsule le flux binaire envoyé en HDMI. Essayez l\'encapsulation par l\'application si le Passthrough reste muet ou produit des artefacts sur cet appareil.';

  @override
  String get settingsAudioPassthroughOutputPlatform =>
      'Automatique, encapsulation système (AudioTrack RAW)';

  @override
  String get settingsAudioPassthroughOutputIec =>
      'Encapsulation par l\'app (AudioTrack IEC)';

  @override
  String get settingsAudioPassthroughOutputIecLabel => 'App (IEC)';

  @override
  String get settingsDownmixToStereoDescription =>
      'Réduit tout l\'audio décodé à deux canaux.';

  @override
  String get settingsAudioEac3IncludesAtmos =>
      'Transmet le flux E-AC-3, y compris Dolby Atmos (JOC).';

  @override
  String get settingsAudioDtsHdIncludesDtsX =>
      'Transmet le flux DTS-HD, y compris DTS:X.';

  @override
  String get settingsAudioTrueHdIncludesAtmos =>
      'Transmet le flux TrueHD, y compris Dolby Atmos.';

  @override
  String get settingsAudioTrueHdPassthrough => 'Passthrough TrueHD';

  @override
  String get settingsDetectedAudioCapabilities => 'Capacités audio détectées';

  @override
  String get settingsDetectedAudioCapabilitiesUnavailable =>
      'Aucun instantané des capacités d\'exécution n\'est encore disponible.';

  @override
  String get settingsAudioRouteLabel => 'Sortie';

  @override
  String get settingsAudioDecodeLabel => 'Décodage';

  @override
  String get settingsAudioPassthroughLabel => 'Passthrough';

  @override
  String get settingsAudioHdRoute => 'Sortie audio HD';

  @override
  String get settingsAudioRouteHdmi => 'HDMI';

  @override
  String get settingsAudioRouteArc => 'ARC';

  @override
  String get settingsAudioRouteEarc => 'eARC';

  @override
  String get settingsAudioRouteBluetooth => 'Bluetooth';

  @override
  String get settingsAudioRouteSpeaker => 'Enceintes';

  @override
  String get settingsAudioRouteHeadphones => 'Écouteurs';

  @override
  String settingsAudioPcmChannels(int count) {
    return '$count canaux PCM';
  }

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
  String get nextUpDisplay => 'Affichage du prochain épisode';

  @override
  String get extended => 'Étendu';

  @override
  String get minimal => 'Minimal';

  @override
  String get nextUpTimeout => 'Délai d\'affichage du prochain épisode';

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
  String get stillWatchingPrompt => 'Vérification de présence';

  @override
  String afterEpisodesAndHours(int episodes, double hours) {
    return 'Après $episodes épisodes / ${hours}h';
  }

  @override
  String get resumeAndSkip => 'Reprendre et sauter';

  @override
  String get resumeRewind => 'Retour en arrière à la reprise';

  @override
  String get unpauseRewind => 'Retour en arrière après la pause';

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
  String get subtitleDownloadLanguages =>
      'Langues de téléchargement des sous-titres';

  @override
  String get subtitleDownloadLanguagesDescription =>
      'Langues à rechercher lors du téléchargement de sous-titres, 5 au maximum. « Auto » recherche une seule langue, déduite de votre langue de sous-titres par défaut ou de la vidéo.';

  @override
  String get preferredSecondarySubtitleLanguage =>
      'Langue préférée des sous-titres secondaires';

  @override
  String get secondarySubtitlesEnabledSubtitle =>
      'Show a second subtitle track at the same time. The subtitle menu then asks for the primary or secondary track first';

  @override
  String get defaultToNoSubtitles => 'Aucun sous-titre par défaut';

  @override
  String get turnOffSubtitlesByDefault =>
      'Désactiver les sous-titres par défaut';

  @override
  String get subtitleSize => 'Taille des sous-titres';

  @override
  String get primarySubtitleSlot => 'Principal';

  @override
  String get secondarySubtitleSlot => 'Secondaire';

  @override
  String get secondarySubtitleTrack => 'Piste de sous-titres secondaire';

  @override
  String get secondaryDelayAdjustment => 'Secondary Delay Adjustment';

  @override
  String decreaseValue(String setting) {
    return 'Diminuer : $setting';
  }

  @override
  String increaseValue(String setting) {
    return 'Augmenter : $setting';
  }

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
  String get subtitleMode => 'Sélection des sous-titres';

  @override
  String get subtitleModeFlagged => 'Par défaut';

  @override
  String get subtitleModeAlways => 'Toujours';

  @override
  String get subtitleModeForeign => 'Langue étrangère';

  @override
  String get subtitleModeForced => 'Forcés';

  @override
  String get subtitleModeFlaggedDescription =>
      'Lit les pistes définies comme « par défaut » ou « forcées » dans les métadonnées du fichier.';

  @override
  String get subtitleModeAlwaysDescription =>
      'Charge et affiche automatiquement les sous-titres à chaque démarrage d\'une vidéo.';

  @override
  String get subtitleModeForeignDescription =>
      'Active automatiquement les sous-titres si la piste audio par défaut est dans une langue étrangère.';

  @override
  String get subtitleModeForcedDescription =>
      'Ne charge que les sous-titres explicitement marqués comme « forcés » dans les métadonnées.';

  @override
  String get subtitleModeNoneDescription =>
      'Désactive complètement le chargement automatique des sous-titres.';

  @override
  String get fallbackSubtitleLanguage => 'Langue de sous-titres secondaire';

  @override
  String get subtitleStream => 'Piste de sous-titres';

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
  String get semiTransparentWhite => 'Blanc semi-transparent';

  @override
  String get lightGray => 'Gris clair';

  @override
  String get darkGray => 'Gris foncé';

  @override
  String get blue => 'Bleu';

  @override
  String get magenta => 'Magenta';

  @override
  String get global => 'Global';

  @override
  String get desktop => 'Bureau';

  @override
  String get mobile => 'Mobile';

  @override
  String get tv => 'TV';

  @override
  String loadedProfileSettings(String profile) {
    return 'Paramètres de profil $profile chargés.';
  }

  @override
  String failedToLoadProfileSettings(String profile) {
    return 'Échec du chargement des paramètres de profil $profile.';
  }

  @override
  String syncedSettingsToProfile(String profile) {
    return 'Paramètres locaux synchronisés avec le profil $profile.';
  }

  @override
  String get syncing => 'Synchronisation…';

  @override
  String resetProfileTitle(String profile) {
    return 'Réinitialiser $profile ?';
  }

  @override
  String resetProfileDescription(String profile) {
    return 'Supprime le profil $profile du serveur et rétablit tous les réglages synchronisés de cet appareil à leurs valeurs par défaut.';
  }

  @override
  String get resetGlobalProfileDescription =>
      'Supprime tous les profils enregistrés du serveur et rétablit tous les réglages synchronisés de cet appareil à leurs valeurs par défaut.';

  @override
  String profileReset(String profile) {
    return 'Profil $profile réinitialisé aux valeurs par défaut.';
  }

  @override
  String get resetRatingsTitle => 'Réinitialiser les notes ?';

  @override
  String get resetRatingsDescription =>
      'Rétablit tous les réglages de notes à leurs valeurs par défaut, y compris les sources affichées et leur ordre d\'apparition.';

  @override
  String get ratingsReset => 'Notes réinitialisées aux valeurs par défaut.';

  @override
  String failedToResetProfile(String profile) {
    return 'Échec de la réinitialisation du profil $profile.';
  }

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
  String get tvOfflineDownloads => 'Activer les téléchargements hors ligne';

  @override
  String get tvOfflineDownloadsSubtitle =>
      'Afficher les actions de téléchargement sur les pages des médias';

  @override
  String get reportDownloadsActivity =>
      'Afficher les téléchargements sur le serveur';

  @override
  String get reportDownloadsActivitySubtitle =>
      'Permettre à l\'administrateur du serveur de voir vos téléchargements transcodés dans le tableau de bord';

  @override
  String get onlyDownloadOnWifi => 'Télécharger uniquement en Wi‑Fi';

  @override
  String get storage => 'Stockage';

  @override
  String get storageUsed => 'Stockage utilisé';

  @override
  String get manage => 'Gérer';

  @override
  String get calculating => 'Calcul en cours…';

  @override
  String get downloadLocation => 'Emplacement de téléchargement';

  @override
  String get defaultLabel => 'Par défaut';

  @override
  String get sdCard => 'Carte SD';

  @override
  String get downloadLocationLimitedByAndroid =>
      'Android autorise Moonfin à écrire uniquement dans ses propres dossiers, et cet appareil n\'a pas de stockage amovible. Activez « Enregistrer dans le dossier Téléchargements » ci-dessus pour que vos téléchargements soient accessibles.';

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
  String get transcodingTimeRemainingUnavailable =>
      'Transcodage : temps restant indisponible';

  @override
  String get enable => 'Activer';

  @override
  String get clearAllDownloadsWarning =>
      'Cela supprimera tous les médias téléchargés et ne peut pas être annulé.';

  @override
  String get clearAll => 'Tout supprimer';

  @override
  String get navigationStyle => 'Emplacement de la navigation';

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
  String get showLiveTvButton => 'Afficher le bouton TV en direct';

  @override
  String get showDownloadsButton => 'Afficher le bouton Téléchargements';

  @override
  String get showLibrariesInToolbar =>
      'Afficher les bibliothèques dans la barre d’outils';

  @override
  String get showLibrariesIndividually => 'Show Libraries Individually';

  @override
  String get showLibrariesIndividuallySubtitle =>
      'Show each library as its own button in the navigation bar instead of in the Libraries menu';

  @override
  String get navbarAlwaysExpanded =>
      'Toujours afficher les libellés de la barre de navigation';

  @override
  String get showSeerrButton => 'Afficher le bouton Seerr';

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
      'Écraser les paramètres par bibliothèque';

  @override
  String get applyImageTypeToAllLibraries =>
      'Appliquer le type d’image à toutes les bibliothèques';

  @override
  String get multiServerLibraries => 'Bibliothèques multi-serveurs';

  @override
  String get showLibrariesFromAllServers =>
      'Afficher les bibliothèques de tous les serveurs connectés';

  @override
  String get mergeRecentRowsByType => 'Fusionner les rangées récentes par type';

  @override
  String get mergeRecentRowsByTypeDescription =>
      'Regroupe les bibliothèques distinctes de même type dans les rangées d\'accueil « Ajouts récents » et « Sorties récentes ».';

  @override
  String get libraryView => 'Vue de la bibliothèque';

  @override
  String get libraryStyle => 'Style de la bibliothèque vidéo';

  @override
  String get libraryStyleDescription =>
      'Classique correspond à l\'en-tête d\'origine, avec des boutons en icônes. Moderne réunit la recherche et les boutons de tri, de regroupement et de filtre, avec leurs libellés, dans une seule barre. Dock déplace les commandes et l\'index alphabétique dans un panneau latéral.';

  @override
  String get libraryStyleDescriptionPhone =>
      'Classique correspond à l\'en-tête d\'origine, avec des boutons en icônes. Moderne ajoute sous la recherche des boutons de tri, de regroupement et de filtre, avec leurs libellés. Dock garde les commandes dans une barre en bas de l\'écran.';

  @override
  String get libraryStyleClassic => 'Classique';

  @override
  String get libraryStyleModern => 'Moderne';

  @override
  String get libraryStyleDocked => 'Dock';

  @override
  String get bookLibraryStyle => 'Style de la bibliothèque de livres';

  @override
  String get bookLibraryStyleDescription =>
      'Classique correspond aux étagères d\'origine, sous un titre mis en avant. Salle de lecture commence par vos lectures en cours, sur de grands visuels. Librairie parcourt toute la bibliothèque en grille.';

  @override
  String get bookLibraryStyleClassic => 'Classique';

  @override
  String get bookLibraryStyleReadingRoom => 'Salle de lecture';

  @override
  String get bookLibraryStyleBookstore => 'Librairie';

  @override
  String get musicLibraryStyle => 'Style de la bibliothèque musicale';

  @override
  String get musicLibraryStyleDescription =>
      'Classique correspond aux rangées d\'origine, sous un visuel « Reprendre l\'écoute ». Accès rapide commence par une grille de vos albums et playlists récents. Immersif met en avant l\'album que vous écoutez.';

  @override
  String get musicLibraryStyleClassic => 'Classique';

  @override
  String get musicLibraryStyleQuickAccess => 'Accès rapide';

  @override
  String get musicLibraryStyleImmersive => 'Immersif';

  @override
  String get jumpBackIn => 'Reprendre l\'écoute';

  @override
  String get yourPlaylists => 'Vos playlists';

  @override
  String get fromThisAlbum => 'De cet album';

  @override
  String get searchMusic => 'Rechercher de la musique';

  @override
  String bookSeriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count séries',
      one: '$count série',
    );
    return '$_temp0';
  }

  @override
  String bookInProgressCount(int count) {
    return '$count en cours';
  }

  @override
  String bookBrowseAllTitles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Parcourir tous les $count titres',
      one: 'Parcourir $count titre',
    );
    return '$_temp0';
  }

  @override
  String get searchBooks => 'Rechercher des livres';

  @override
  String get libraryShowLabel => 'Afficher';

  @override
  String get libraryAToZ => 'A à Z';

  @override
  String get libraryJumpToLetter => 'Aller à une lettre';

  @override
  String get groupItemsIntoCollections =>
      'Regrouper les éléments en collections';

  @override
  String get hideCollectionAssociatedItems =>
      'Masquer les éléments appartenant à une collection lors de la navigation dans les bibliothèques';

  @override
  String get groupItemsIntoCollectionsDialogTitle => 'À propos du regroupement';

  @override
  String get groupItemsIntoCollectionsDialogMessage =>
      'Pour utiliser ce réglage, assurez-vous que les options « Regrouper les films en collections » et/ou « Regrouper les séries en collections » sont activées dans les réglages d\'affichage de votre bibliothèque, sur votre serveur Jellyfin ou Emby.';

  @override
  String get libraryVisibility => 'Visibilité des bibliothèques';

  @override
  String get libraryVisibilityDescription =>
      'Affichez ou masquez chaque bibliothèque sur la page d\'accueil. Redémarrez Moonfin pour appliquer les modifications.';

  @override
  String get showInNavigation => 'Afficher dans la navigation';

  @override
  String get showInLatestMedia =>
      'Afficher dans les médias récemment ajoutés ou sortis';

  @override
  String get libraryOrder => 'Ordre des bibliothèques';

  @override
  String get libraryOrderSubtitle => 'Choisissez l\'ordre de vos bibliothèques';

  @override
  String get libraryOrderDescription =>
      'Vos bibliothèques apparaissent dans cet ordre sur Mes médias, dans les rangées des ajouts récents et dans la barre de navigation. L\'ordre est enregistré sur votre compte serveur, les autres applications où vous vous connectez l\'utilisent donc aussi.';

  @override
  String get libraryOrderTvHint =>
      'Appuyez sur gauche ou droite pour déplacer la bibliothèque sélectionnée.';

  @override
  String get libraryOrderSaveFailed =>
      'Impossible d\'enregistrer l\'ordre des bibliothèques';

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
    return '$count sélectionné';
  }

  @override
  String get mediaBar => 'Barre média';

  @override
  String get mediaSources => 'Média sources';

  @override
  String get behavior => 'Comportement';

  @override
  String get seconds => 'secondes';

  @override
  String get mediaBarMode => 'Style de la barre média';

  @override
  String get mediaBarModeDescription =>
      'Choisissez parmi différents styles de barre média, ou désactivez-la';

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
  String get mediaBarModeOff => 'Désactivé';

  @override
  String get mediaBarModeBookshelf => 'Étagère';

  @override
  String get mediaBarModeGallery => 'Galerie';

  @override
  String get mediaBarModeBanner => 'Bannière';

  @override
  String get mediaBarModeAya => 'Aya';

  @override
  String get enableMediaBar => 'Activer la barre média';

  @override
  String get showFeaturedContentSlideshow =>
      'Afficher le diaporama du contenu à la une sur l’accueil';

  @override
  String get contentType => 'Type de contenu';

  @override
  String get mediaBarSourceType => 'Source';

  @override
  String get mediaBarSourceRandom => 'Aléatoire';

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
  String get trailerPreview => 'Aperçu de la bande-annonce';

  @override
  String get autoPlayTrailers =>
      'Lire automatiquement les bandes-annonces dans la barre média après 3 secondes';

  @override
  String get trailerAudio => 'Audio des bandes-annonces';

  @override
  String get enableTrailerAudio =>
      'Activer l\'audio des bandes-annonces dans la barre média';

  @override
  String get trailerVolume => 'Trailer Volume';

  @override
  String get trailerVolumeDescription => 'How loud media bar trailers play';

  @override
  String get trailerCaptions => 'Sous-titres des bandes-annonces';

  @override
  String get trailerCaptionsDescription =>
      'Afficher les sous-titres des bandes-annonces YouTube dans la barre média';

  @override
  String get episodePreview => 'Aperçu de l\'épisode';

  @override
  String get mediaPreview => 'Aperçu des médias';

  @override
  String get episodePreviewDescription =>
      'Lire un aperçu intégré de 30 secondes lorsqu\'un visuel est sélectionné, survolé ou maintenu appuyé';

  @override
  String get mediaPreviewDescription =>
      'Lire un aperçu intégré de 30 secondes lorsqu\'un visuel est sélectionné, survolé ou maintenu appuyé';

  @override
  String get previewAudio => 'Aperçu de l\'audio';

  @override
  String get enablePreviewAudio =>
      'Activer l\'audio pour les aperçus des médias';

  @override
  String get previewVolume => 'Preview Volume';

  @override
  String get previewVolumeDescription =>
      'How loud media previews on cards play';

  @override
  String get latestMedia => 'Médias récemment ajoutés';

  @override
  String get recentlyReleased => 'Récemment sortis';

  @override
  String get recentlyReleasedSeriesType => 'Tri des séries récemment sorties';

  @override
  String get recentlyReleasedSeriesTypeDescription =>
      'Trie les rangées d\'accueil « Séries récemment sorties » par série, dernière saison ou date de diffusion du dernier épisode';

  @override
  String get myMedia => 'Mes médias';

  @override
  String get myMediaSmall => 'Mes médias (petit)';

  @override
  String get continueWatching => 'Continuer de regarder';

  @override
  String get resumeAudio => 'Reprendre l’audio';

  @override
  String get resumeBooks => 'Reprendre les livres';

  @override
  String get activeRecordings => 'Enregistrements actifs';

  @override
  String get playlists => 'Playlists';

  @override
  String get liveTV => 'TV en direct';

  @override
  String get favoriteChannels => 'Chaînes favorites';

  @override
  String get resetToDefaults => 'Réinitialiser aux valeurs par défaut';

  @override
  String get homeRowPosterSize => 'Taille des affiches des rangées d’accueil';

  @override
  String get configureImageTypeForEachRow =>
      'Configurer le type d’image pour chaque rangée d’accueil activée';

  @override
  String get mergeContinueWatchingAndNextUp =>
      'Fusionner Continuer de regarder et À suivre';

  @override
  String get combineBothRows =>
      'Combiner les deux rangées en une seule section d’accueil';

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
  String get nextUpMaxDays => 'Nombre de jours maximum dans « À suivre »';

  @override
  String get nextUpMaxDaysDescription =>
      'Durée pendant laquelle une série reste dans « À suivre » après votre dernier visionnage';

  @override
  String daysValue(int days) {
    return '$days jours';
  }

  @override
  String get fullScreenRows => 'Rangées étendues';

  @override
  String get fullScreenRowsDescription =>
      'Limiter les rangées d\'accueil à une par écran';

  @override
  String get homeRowsPadding => 'Espacement des rangées';

  @override
  String get homeRowsPaddingDescription =>
      'Personnaliser l\'espacement entre les rangées d\'accueil';

  @override
  String get homeRowsGenresAndStudios => 'Genres et studios';

  @override
  String get homeRowsExternalLists => 'Listes externes';

  @override
  String get perRowSettings => 'Paramètres par rangée';

  @override
  String get autoLogin => 'Connexion automatique';

  @override
  String get lastUser => 'Dernier utilisateur';

  @override
  String get currentUser => 'Utilisateur actuel';

  @override
  String get alwaysAuthenticate => 'Toujours s’authentifier';

  @override
  String get requirePasswordWithToken =>
      'Exiger le mot de passe même avec un jeton enregistré';

  @override
  String get confirmExit => 'Confirmer la fermeture';

  @override
  String get showConfirmationBeforeExiting =>
      'Afficher une confirmation avant de quitter l\'app';

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
  String get pinSynced => 'PIN synced';

  @override
  String get pinResetFailed =>
      'The PIN on the server could not be cleared. If it is still set, ask a server administrator to remove it.';

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
  String get libraryArt => 'Visuels de bibliothèque';

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
  String get dimmingLevel => 'Intensité de l\'assombrissement';

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
  String get displayClockDuringScreensaver =>
      'Afficher l’horloge pendant l’économiseur d’écran';

  @override
  String get clockModeStatic => 'Statique';

  @override
  String get clockModeBouncing => 'Rebondissant';

  @override
  String get screensaverGeneralSettings => 'Paramètres généraux';

  @override
  String get screensaverVisualComponents => 'Composants visuels';

  @override
  String get screensaverLibraryContent => 'Contenu de la bibliothèque';

  @override
  String get screensaverBackdrop => 'Vignette';

  @override
  String get screensaverBackdropBlack => 'Noir';

  @override
  String get screensaverBackdropMoonfin => 'Moonfin';

  @override
  String get screensaverBackdropCalm => 'Apaisé';

  @override
  String get screensaverBackdropNeonPulse => 'Neon Pulse';

  @override
  String get screensaverBackdropAurora => 'Aurora';

  @override
  String get screensaverAdditionalComponent => 'Composant supplémentaire';

  @override
  String get screensaverComponentMoonfinLogo => 'Logo Moonfin';

  @override
  String get screensaverComponentRunner => 'Runner';

  @override
  String get screensaverComponentMovement => 'Mouvement du composant';

  @override
  String get screensaverComponentPosition => 'Position du composant';

  @override
  String get screensaverComponentSize => 'Taille du composant';

  @override
  String get screensaverSourceLibrariesDefault => 'Toutes (par défaut)';

  @override
  String get rottenTomatoesCritics => 'Rotten Tomatoes (Critiques)';

  @override
  String get rottenTomatoesAudience => 'Rotten Tomatoes (Public)';

  @override
  String get imdb => 'IMDb';

  @override
  String get tmdb => 'TMDB';

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
  String get pluginDetected => 'Plugin détecté';

  @override
  String get pluginNotDetected => 'Plugin non détecté';

  @override
  String get pluginNotDetectedDescription =>
      'Le plugin serveur n’est pas détecté actuellement. Les paramètres locaux utilisent toujours leurs valeurs enregistrées ou les valeurs par défaut intégrées.';

  @override
  String get moonbaseAddress => 'Moonbase Address';

  @override
  String get pluginConnected => 'Connecté';

  @override
  String pluginConnectedVersion(String version) {
    return 'Connecté, version $version';
  }

  @override
  String get pluginSyncOn => 'Synchro activée';

  @override
  String get pluginSyncOff => 'Synchro désactivée';

  @override
  String get syncProfileDescription =>
      'Cet appareil reste synchronisé avec le profil choisi tant que vous n\'en choisissez pas un autre.';

  @override
  String get profileAppliesEverywhere => 'S\'applique partout';

  @override
  String get profileOverridesGlobal => 'Remplace le réglage global';

  @override
  String get profileThisDevice => 'Cet appareil';

  @override
  String get profileLoad => 'Charger';

  @override
  String get profileLoadSubtitle => 'Du serveur vers cet appareil';

  @override
  String get profileSaveSubtitle => 'De cet appareil vers le serveur';

  @override
  String resetNamedProfile(String profile) {
    return 'Réinitialiser le profil $profile';
  }

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
  String get studios => 'Studios';

  @override
  String get popularSeries => 'Séries populaires';

  @override
  String get seriesGenres => 'Genres de séries';

  @override
  String get upcomingSeries => 'Séries à venir';

  @override
  String get networks => 'Diffuseurs';

  @override
  String get tags => 'Tags';

  @override
  String get genresAndTags => 'Genres et tags';

  @override
  String get seerrDiscoveryRows => 'Découvertes Seerr';

  @override
  String get seerrDiscoverSliders => 'Rangées de découverte Seerr';

  @override
  String get yourWatchlist => 'Ma liste';

  @override
  String get resetRowsToDefaults => 'Réinitialiser les rangées par défaut';

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
  String get showMissingCollectionItems =>
      'Afficher les éléments manquants des collections';

  @override
  String get showMissingCollectionItemsDesc =>
      'Inclut les éléments manquants sur les pages de collection';

  @override
  String get showSeerrAvailabilityBadges =>
      'Afficher les badges de disponibilité Seerr';

  @override
  String get showSeerrAvailabilityBadgesDescription =>
      'Affiche les badges de disponibilité des saisons sur les écrans de détails des médias';

  @override
  String get seerrNotificationsSection => 'Notifications';

  @override
  String get seerrNotifyNewRequestsTitle =>
      'Notifications de nouvelles demandes';

  @override
  String get seerrNotifyNewRequestsSubtitle =>
      'M\'avertir lorsque quelqu\'un soumet une demande';

  @override
  String get seerrNotifyLibraryAddedTitle => 'Suivi des demandes';

  @override
  String get seerrNotifyLibraryAddedSubtitle =>
      'Approuvées, refusées et ajoutées à votre bibliothèque';

  @override
  String get seerrNotifyIssuesTitle => 'Suivi des problèmes';

  @override
  String get seerrNotifyIssuesSubtitle =>
      'Nouveaux problèmes, réponses et résolutions';

  @override
  String get seerrNotifyNewMediaTitle => 'Nouveau média ajouté';

  @override
  String get seerrNotifyNewMediaSubtitle =>
      'Tout nouvel ajout à la bibliothèque du serveur';

  @override
  String loggedInAs(String username) {
    return 'Connecté en tant que : $username';
  }

  @override
  String get discoverRows => 'Page de découverte Seerr';

  @override
  String get discoverRowsDescriptionPlugin =>
      'Activez les rangées à afficher sur la page d\'accueil de Seerr. Faites glisser pour réorganiser. L\'ordre personnalisé se synchronise avec Moonbase.';

  @override
  String get discoverRowsDescription =>
      'Activez les rangées à afficher sur la page d\'accueil de Seerr. Faites glisser pour réorganiser. L\'ordre personnalisé se synchronise avec Moonbase.';

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
  String get sourceCodeUrl => 'https://github.com/Moonfin-Client/Moonfin-Core';

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
    return 'Mise à jour disponible : v$version';
  }

  @override
  String get updateNotifications => 'Notifications de mise à jour';

  @override
  String get showWhenUpdatesAvailable =>
      'Afficher quand des mises à jour sont disponibles';

  @override
  String updateAvailableTitle(String version) {
    return 'v$version Disponible';
  }

  @override
  String get readReleaseNotes => 'Lire les notes de version';

  @override
  String get downloadingUpdate => 'Téléchargement de la mise à jour…';

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
      'Emplacement de la barre de navigation, boutons d\'outils et apparence';

  @override
  String get featuredContentAppearance => 'Contenu à la une, apparence';

  @override
  String gbValue(String value) {
    return '$value Go';
  }

  @override
  String mbValue(int value) {
    return '$value Mo';
  }

  @override
  String get imageCacheLimit => 'Limite du cache d\'images';

  @override
  String get clearImageCache => 'Vider le cache d\'images';

  @override
  String get imageCacheCleared => 'Cache d\'images vidé';

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
  String get seerrDownloading => 'Téléchargement en cours';

  @override
  String seerrDownloadingSize(String done, String total) {
    return 'Téléchargement · $done / $total';
  }

  @override
  String seerrDownloadedOfTotal(String done, String total) {
    return '$done / $total';
  }

  @override
  String seerrPercentValue(int percent) {
    return '$percent %';
  }

  @override
  String seerrDownloadingPercent(int percent) {
    return 'Téléchargement · $percent%';
  }

  @override
  String get seerrImportingStatus => 'Importation en cours';

  @override
  String itemsCount(int count) {
    return '$count Articles';
  }

  @override
  String get seerrSettings => 'Paramètres Seerr';

  @override
  String get requestMore => 'Demander plus';

  @override
  String get requestMore4k => 'Demander davantage en 4K';

  @override
  String get request => 'Demander';

  @override
  String get request4k => 'Demander en 4K';

  @override
  String get requested4k => 'Demande 4K envoyée';

  @override
  String get cancelRequest => 'Annuler la demande';

  @override
  String get cancelRequest4k => 'Annuler la demande 4K';

  @override
  String get playInMoonfin => 'Lire dans Moonfin';

  @override
  String get requestedByLabel => 'Demandé par';

  @override
  String requestedByName(String name) {
    return 'Demandé par $name';
  }

  @override
  String get manageRequests => 'Gérer les demandes';

  @override
  String get watchlist => 'Liste à voir';

  @override
  String get onWatchlist => 'Dans la liste à voir';

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
    return 'Annuler la demande pour \"$title\" ?';
  }

  @override
  String cancelCountRequestsForTitle(int count, String title) {
    return 'Annuler les demandes $count pour \"$title\" ?';
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
    return 'Budget : \$$amount';
  }

  @override
  String revenueAmount(String amount) {
    return 'Revenu : \$$amount';
  }

  @override
  String seasonsCount(int count, String label) {
    return '$count $label';
  }

  @override
  String requestSeriesOrMovie(String type) {
    return 'Demande $type';
  }

  @override
  String requestSeriesOrMovie4k(String type) {
    return 'Demander en 4K : $type';
  }

  @override
  String get submitRequest => 'Envoyer la demande';

  @override
  String get allSeasons => 'Toutes les saisons';

  @override
  String get seerrSeriesContinuing =>
      'Série en cours · Les prochaines saisons peuvent être demandées';

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
    return 'âge $age';
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
  String get failedStatus => 'Échoué';

  @override
  String get processingStatus => 'En cours de traitement';

  @override
  String modifiedByName(String name) {
    return 'Modifié par $name';
  }

  @override
  String get completedStatus => 'Terminé';

  @override
  String get requestErrorDuplicate => 'Ce titre a déjà été demandé';

  @override
  String get requestErrorQuota => 'Limite de demandes atteinte';

  @override
  String get requestErrorBlocklisted => 'Ce titre est sur la liste de blocage';

  @override
  String get requestErrorNoSeasons => 'Aucune saison à demander';

  @override
  String get requestErrorPermission =>
      'Vous n\'avez pas l\'autorisation d\'effectuer cette demande';

  @override
  String get seerrRequestsTitle => 'Demandes';

  @override
  String get seerrIssuesTitle => 'Problèmes';

  @override
  String get sortNewest => 'Plus récentes';

  @override
  String get sortLastModified => 'Dernière modification';

  @override
  String get noIssues => 'Aucun problème';

  @override
  String movieQuotaRemaining(int remaining, int limit) {
    return '$remaining demandes de films restantes sur $limit';
  }

  @override
  String seasonQuotaRemaining(int remaining, int limit) {
    return '$remaining demandes de saisons restantes sur $limit';
  }

  @override
  String partOfCollectionName(String name) {
    return 'Fait partie de $name';
  }

  @override
  String get viewCollection => 'Voir la collection';

  @override
  String get requestCollection => 'Demander la collection';

  @override
  String collectionMoviesSummary(int total, int available) {
    return '$total films · $available disponibles';
  }

  @override
  String requestMoviesCount(int count) {
    return 'Demander $count films';
  }

  @override
  String requestingProgress(int current, int total) {
    return 'Demande $current sur $total…';
  }

  @override
  String requestedMoviesCount(int count) {
    return '$count films demandés';
  }

  @override
  String requestedMoviesPartial(int ok, int total) {
    return '$ok films demandés sur $total';
  }

  @override
  String get collectionAllRequested =>
      'Tous les films sont déjà disponibles ou demandés';

  @override
  String get reportIssue => 'Signaler un problème';

  @override
  String get issueTypeVideo => 'Vidéo';

  @override
  String get issueTypeAudio => 'Audio';

  @override
  String get whatsWrong => 'Quel est le problème ?';

  @override
  String get allEpisodes => 'Tous les épisodes';

  @override
  String get episode => 'Épisode';

  @override
  String get openStatus => 'Ouvert';

  @override
  String get resolvedStatus => 'Résolu';

  @override
  String get resolveAction => 'Résoudre';

  @override
  String get reopenAction => 'Rouvrir';

  @override
  String reportedByName(String name) {
    return 'Signalé par $name';
  }

  @override
  String commentsCount(int count) {
    return '$count commentaires';
  }

  @override
  String get addComment => 'Ajouter un commentaire';

  @override
  String get deleteIssueConfirm => 'Supprimer ce problème ?';

  @override
  String get submitReport => 'Envoyer le signalement';

  @override
  String get tmdbScore => 'Score TMDB';

  @override
  String get releaseDateLabel => 'Date de sortie';

  @override
  String get firstAirDateLabel => 'Première date de diffusion';

  @override
  String get revenueLabel => 'Revenu';

  @override
  String get runtimeLabel => 'Durée';

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
  String get remote => 'Télécommande';

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
  String get trickplay => 'Trickplay';

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
  String get adminDrawerDisplay => 'Affichage';

  @override
  String get adminDrawerMetadata => 'Métadonnées';

  @override
  String get adminDrawerNfo => 'Paramètres NFO';

  @override
  String get adminDrawerTranscoding => 'Transcodage';

  @override
  String get adminDrawerResume => 'Reprendre';

  @override
  String get adminDrawerStreaming => 'Streaming';

  @override
  String get adminDrawerTrickplay => 'Trickplay';

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
  String get adminPremiereNoteLiveTv =>
      'La TV en direct nécessite Emby Premiere. Sans lui, le serveur n\'importe aucune chaîne et n\'enregistre rien.';

  @override
  String get adminPremiereNoteBackups =>
      'Backup & Restore nécessite Emby Premiere une fois sa période d\'essai terminée.';

  @override
  String get adminGeneralRunAtStartup => 'Lancer le serveur au démarrage';

  @override
  String get adminGeneralLaunchWebApp =>
      'Ouvrir l\'application web dans un navigateur au démarrage du serveur';

  @override
  String get adminGeneralBannerText =>
      'Texte de la bannière de l\'écran d\'accueil';

  @override
  String get adminGeneralBannerTextHelp =>
      'Affiché à tous les utilisateurs sur leur écran d\'accueil';

  @override
  String get adminGeneralSectionMaintenance => 'Mode maintenance';

  @override
  String get adminGeneralMaintenanceMode =>
      'Mettre le serveur en mode maintenance';

  @override
  String get adminGeneralMaintenanceModeHelp =>
      'Les utilisateurs ne voient que le message de maintenance.';

  @override
  String get adminGeneralMaintenanceMessage => 'Message de maintenance';

  @override
  String get adminGeneralMaintenanceMessageHelp =>
      'Laissez vide pour afficher un message générique dans la langue de chaque utilisateur.';

  @override
  String get adminGeneralSectionUpdates => 'Mises à jour automatiques';

  @override
  String get adminGeneralAutoUpdate =>
      'Mettre à jour le serveur automatiquement';

  @override
  String get adminGeneralAutoRestart =>
      'Redémarrer automatiquement pour appliquer les mises à jour';

  @override
  String get adminGeneralAutoRestartHelp =>
      'Le serveur ne redémarre que lorsqu\'aucun utilisateur n\'est actif.';

  @override
  String adminTaskTriggerSystemEvent(String event) {
    return 'Après un événement système ($event)';
  }

  @override
  String get adminPluginNeedsPremiere =>
      'Nécessite Emby Premiere après un essai gratuit de 14 jours';

  @override
  String get adminEmbyBackupsHelp =>
      'Emby effectue ses sauvegardes via son plugin Backup & Restore.';

  @override
  String get adminEmbyBackupsNoPlugin =>
      'Le plugin Backup & Restore n\'est pas installé. Installez-le depuis le catalogue de plugins pour sauvegarder ce serveur.';

  @override
  String get adminEmbyBackupNow => 'Sauvegarder maintenant';

  @override
  String get adminEmbyFullBackup => 'Sauvegarde complète';

  @override
  String get adminEmbyLightBackups => 'Sauvegardes de la base de données';

  @override
  String adminEmbyBackupServerVersion(String version) {
    return 'Emby $version';
  }

  @override
  String adminEmbyRestoreConfirm(String name) {
    return 'Restaurer $name ? Cela remplace les bibliothèques, les paramètres, les utilisateurs et les mots de passe de ce serveur, et le serveur s\'arrête une fois l\'opération terminée. Vous devrez peut-être le redémarrer vous-même.';
  }

  @override
  String get adminEmbyRestoreServerId => 'Restaurer l\'ID du serveur';

  @override
  String get adminEmbyRestoreServerIdHelp =>
      'Désactivez cette option si vous restaurez la même sauvegarde sur plusieurs serveurs.';

  @override
  String get adminEmbyRestoreShuttingDown =>
      'La restauration est terminée et le serveur s\'arrête. Redémarrez-le s\'il ne repart pas de lui-même.';

  @override
  String get adminHiddenRemotely =>
      'Masquer des écrans de connexion lors d\'un accès à distance';

  @override
  String get adminHiddenFromUnusedDevices =>
      'Masquer des écrans de connexion sur les appareils jamais utilisés pour se connecter';

  @override
  String get adminSimultaneousStreamLimitHelp =>
      'Limite le nombre de vidéos que cet utilisateur peut lire simultanément.';

  @override
  String get adminUnlimited => 'Illimité';

  @override
  String get adminAutoRemoteQuality =>
      'Qualité automatique à distance (Mbit/s)';

  @override
  String get adminAutoRemoteQualityHelp =>
      'Utilisée à distance lorsque le lecteur est réglé sur la qualité automatique. Laisser vide pour la détecter.';

  @override
  String get adminAllowCameraUpload => 'Autoriser le téléversement des photos';

  @override
  String get adminAllowSubtitleDownloading =>
      'Autoriser le téléchargement des sous-titres';

  @override
  String get adminAllowMediaConversion => 'Autoriser la conversion des médias';

  @override
  String get adminAllowSyncTranscoding =>
      'Autoriser les téléchargements nécessitant un transcodage';

  @override
  String get adminAllowSharingPersonalItems =>
      'Autoriser le partage des playlists avec les autres utilisateurs';

  @override
  String get adminAllowPreferenceAccess =>
      'Autoriser la modification de son mot de passe et de son image de profil';

  @override
  String get adminTagMode => 'Mode des tags';

  @override
  String get adminEmbyConnect => 'Emby Connect';

  @override
  String get adminEmbyConnectUser =>
      'Nom d\'utilisateur ou e-mail Emby Connect';

  @override
  String get adminEmbyConnectHelp =>
      'Permet à cet utilisateur de se connecter depuis n\'importe quelle application Emby sans connaître l\'adresse du serveur.';

  @override
  String get adminEmbyConnectLink => 'Lier';

  @override
  String get adminEmbyConnectUnlink => 'Dissocier';

  @override
  String get adminEmbyConnectLinked => 'Lié à Emby Connect';

  @override
  String get adminEmbyConnectPending =>
      'Invitation envoyée. Le lien sera établi une fois qu\'elle sera acceptée.';

  @override
  String get adminEmbyConnectUnlinked => 'Lien Emby Connect supprimé';

  @override
  String get adminEmbyConnectNotFound =>
      'Aucun compte Emby Connect ne correspond à ce nom d\'utilisateur ou à cet e-mail.';

  @override
  String get adminLibImportPlaylists => 'Importer les fichiers de playlist';

  @override
  String get adminLibExcludeFromSearch => 'Exclure de la recherche globale';

  @override
  String get adminLibForcedSubtitlesOnly =>
      'Télécharger uniquement les sous-titres forcés';

  @override
  String get adminLibImportCollections =>
      'Importer les collections depuis les téléchargeurs de métadonnées';

  @override
  String get adminLibThumbnailInterval => 'Intervalle des miniatures d\'aperçu';

  @override
  String adminLibThumbnailEverySeconds(int count) {
    return 'Toutes les $count secondes';
  }

  @override
  String get adminLibThumbnailAtChapters => 'Aux marqueurs de chapitre';

  @override
  String get adminLibSaveThumbnailsWithMedia =>
      'Enregistrer les miniatures d\'aperçu dans les dossiers multimédias';

  @override
  String get adminLibrarySectionMarkers => 'Marqueurs d\'intro';

  @override
  String get adminLibIntroDetection => 'Détecter les intros';

  @override
  String get adminLibIntroDetectionDuringScan =>
      'Détecter les intros pendant l\'analyse de la bibliothèque';

  @override
  String get adminProviderEmbyGuide => 'Données de guide Emby';

  @override
  String get adminLiveTvEmbyGuideSelectLineup =>
      'Sélectionnez une grille de chaînes. Si aucune n\'apparaît, vérifiez le code postal. Les grilles de chaînes nécessitent Emby Premiere.';

  @override
  String get adminLiveTvWakeServer =>
      'Réveiller le serveur pour les enregistrements';

  @override
  String get adminDrawerLiveTvChannels => 'Chaînes TV en direct';

  @override
  String get adminPageDescLiveTvChannels =>
      'Activer ou désactiver les chaînes et définir leur ordre';

  @override
  String get adminLiveTvChannelsEmpty =>
      'Aucune chaîne pour l\'instant. Elles apparaîtront ici une fois un tuner configuré et ses chaînes importées par le serveur.';

  @override
  String get adminTranscodingHwaAdvanced => 'Avancé';

  @override
  String get adminTranscodingHwaHelp =>
      'Le mode Avancé permet de choisir les codecs matériels et leur ordre.';

  @override
  String get adminTranscodingHwDecoders => 'Décodeurs matériels préférés';

  @override
  String get adminTranscodingHwEncoders => 'Encodeurs matériels préférés';

  @override
  String get adminTranscodingTempPathHelp =>
      'Emplacement des fichiers de travail du transcodeur. Laissez le champ vide pour utiliser le dossier de données du serveur.';

  @override
  String get adminTranscodingThrottleHelp =>
      'Ralentit le transcodage une fois la mémoire tampon suffisamment remplie, pour réduire l\'utilisation du processeur.';

  @override
  String get adminTranscodingDownmixHelp =>
      'Augmente le volume lors du downmix audio. 1 conserve le volume d\'origine.';

  @override
  String get adminTranscodingFontExtraction =>
      'Autoriser l\'extraction des polices à la volée';

  @override
  String get adminTranscodingMaxResolution =>
      'Résolution maximale de transcodage';

  @override
  String get adminTranscodingMaxResolutionHelp =>
      'Limite appliquée à tous les transcodages, quelle que soit la qualité demandée par l\'application.';

  @override
  String get adminTranscodingToneMapSoftware =>
      'Tone mapping dans les transcodages logiciels';

  @override
  String get adminTranscodingToneMapHardware =>
      'Tone mapping dans les transcodages matériels';

  @override
  String get adminTranscodingToneMapHelp =>
      'Évite que la vidéo HDR paraisse sombre et délavée lors du transcodage.';

  @override
  String get adminNetworkingLocalAddress => 'Adresse IP locale';

  @override
  String get adminNetworkingLocalAddressHelp =>
      'Adresse locale que le serveur communique aux applications. Laissez le champ vide pour la détecter automatiquement.';

  @override
  String get adminNetworkingBehindProxy =>
      'HTTPS est géré par un reverse proxy';

  @override
  String get adminNetworkingExternalDomain => 'Domaine externe';

  @override
  String get adminNetworkingExternalDomainHelp =>
      'Domaine ou nom DNS dynamique pour les connexions distantes, sans le protocole ni le port. Nécessaire pour un certificat personnalisé.';

  @override
  String get adminNetworkingUpnp =>
      'Activer la redirection automatique des ports';

  @override
  String get adminNetworkingUpnpHelp =>
      'Tente de rediriger le port public vers le port local via UPnP. Certains routeurs ne le prennent pas en charge.';

  @override
  String get adminNetworkingProxyHeaders =>
      'Lire les en-têtes de proxy pour les adresses des clients';

  @override
  String get adminNetworkingProxyHeadersHelp =>
      'Utilise des en-têtes comme X-Forwarded-For pour déterminer l\'adresse de chaque client. À n\'activer que derrière un reverse proxy.';

  @override
  String get adminNetworkingProxyHeadersRemote =>
      'Uniquement si elles contiennent des adresses distantes';

  @override
  String get adminNetworkingIpv4Only =>
      'Utiliser IPv4 pour les requêtes sortantes';

  @override
  String get adminNetworkingIpv4OnlyHelp =>
      'Utile lorsque les fournisseurs de métadonnées et d\'autres services sont inaccessibles en IPv6.';

  @override
  String get adminOnePerLine => 'Un par ligne';

  @override
  String get adminStreamingStreamLimit =>
      'Nombre maximal de flux vidéo simultanés';

  @override
  String get adminStreamingStreamLimitHelp =>
      'Nombre de vidéos pouvant être lues simultanément sur l\'ensemble du serveur. 0 signifie aucune limite.';

  @override
  String get adminSyncJobsConversions => 'Tâches de conversion';

  @override
  String get adminSyncJobsDownloads => 'Tâches de téléchargement';

  @override
  String get adminSyncJobsEmpty => 'Aucune tâche';

  @override
  String get adminSyncJobCancel => 'Annuler la tâche';

  @override
  String adminSyncJobCancelConfirm(String name) {
    return 'Annuler $name et retirer cette tâche de la liste ?';
  }

  @override
  String get adminSyncJobConverting => 'Conversion en cours';

  @override
  String get adminSyncJobReady => 'Prêt à transférer';

  @override
  String get adminSyncJobTransferring => 'Transfert en cours';

  @override
  String get adminSyncJobCompletedWithError => 'Terminé avec des erreurs';

  @override
  String adminSyncJobItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '$count élément',
    );
    return '$_temp0';
  }

  @override
  String get adminDrawerDatabase => 'Base de données';

  @override
  String get adminPageDescDatabase => 'Taille du cache et maintenance';

  @override
  String get adminDatabaseWarning =>
      'Ces options sont avancées. Laissez-les à leurs valeurs par défaut, sauf si vous avez une raison de les modifier.';

  @override
  String get adminDatabaseCacheSize =>
      'Taille du cache de la base de données (Mo)';

  @override
  String get adminDatabaseCacheSizeHelp =>
      'Part de chaque fichier de base de données que le serveur garde en mémoire. Plus elle est élevée, plus le serveur peut être rapide. Prend effet après un redémarrage.';

  @override
  String get adminDatabaseOptimize =>
      'Optimiser la base de données à l\'arrêt du serveur';

  @override
  String get adminDatabaseOptimizeHelp =>
      'La plupart du temps, cela ne fait rien, mais de temps en temps une analyse est lancée pour accélérer les requêtes du serveur. Les arrêts peuvent durer plus longtemps.';

  @override
  String get adminDatabaseAnalysisLimit => 'Limite de lignes analysées';

  @override
  String get adminDatabaseAnalysisLimitHelp =>
      'Nombre approximatif de lignes de chaque index que l\'étape d\'optimisation lit. Plus il y a de lignes, meilleur est le résultat, mais les arrêts peuvent être plus lents.';

  @override
  String get adminDatabaseVacuum =>
      'Compacter la base de données au prochain démarrage';

  @override
  String get adminDatabaseVacuumHelp =>
      'Reconstruit le fichier de base de données pour qu\'il occupe le moins d\'espace possible, ce qui peut améliorer les performances. Le serveur est inutilisable pendant l\'opération et n\'affiche aucune progression. Ne forcez pas sa fermeture. L\'option se désactive d\'elle-même après ce démarrage.';

  @override
  String get adminDrawerCinemaIntros => 'Intros de cinéma';

  @override
  String get adminPageDescCinemaIntros =>
      'Bandes-annonces et intros avant la lecture';

  @override
  String get adminCinemaIntrosPlayBefore => 'Lire les intros avant';

  @override
  String get adminCinemaIntrosUpcoming =>
      'Inclure les bandes-annonces des films récents et à venir';

  @override
  String get adminCinemaIntrosOlder =>
      'Inclure les bandes-annonces des films plus anciens';

  @override
  String get adminCinemaIntrosLibrary =>
      'Inclure les bandes-annonces des films de mes bibliothèques';

  @override
  String get adminCinemaIntrosLibraryHelp =>
      'Les bandes-annonces locales doivent être configurées.';

  @override
  String get adminCinemaIntrosCount => 'Nombre de bandes-annonces à lire';

  @override
  String get adminCinemaIntrosParental => 'Contrôle parental intelligent';

  @override
  String get adminCinemaIntrosParentalHelp =>
      'Ne retient que les bandes-annonces dont la classification est identique ou inférieure à celle du contenu en cours de lecture.';

  @override
  String get adminCinemaIntrosUnwatchedOnly =>
      'Lire les intros uniquement avant un contenu non vu';

  @override
  String get adminCinemaIntrosSimilarOnly =>
      'Lire uniquement les bandes-annonces similaires au contenu en cours de lecture';

  @override
  String get adminCinemaIntrosSimilarOnlyHelp =>
      'D\'après les genres, tags, studios et autres éléments en commun.';

  @override
  String get adminCinemaIntrosCustom => 'Intros personnalisées';

  @override
  String get adminCinemaIntrosCustomPath => 'Dossier des intros personnalisées';

  @override
  String get adminCinemaIntrosCustomPathHelp =>
      'Un dossier de vidéos. L\'une d\'elles est choisie au hasard et lue après les bandes-annonces.';

  @override
  String get adminCinemaIntrosCodecPath => 'Dossier des intros de codec';

  @override
  String get adminCinemaIntrosCodecPathHelp =>
      'Un dossier de vidéos. Celle dont le nom de fichier correspond au codec vidéo, au codec audio, au profil audio ou à un tag est lue avant le film principal.';

  @override
  String get adminDrawerDlna => 'DLNA';

  @override
  String get adminPageDescDlna =>
      'La lecture sur les appareils (Play To) et le serveur DLNA';

  @override
  String get adminDlnaPlayTo =>
      'Activer la lecture sur les appareils DLNA (Play To)';

  @override
  String get adminDlnaPlayToHelp =>
      'Emby peut détecter les appareils de votre réseau et les contrôler à distance.';

  @override
  String get adminDlnaServer => 'Activer le serveur DLNA';

  @override
  String get adminDlnaServerHelp =>
      'Permet au serveur de diffuser des médias vers les appareils DLNA.';

  @override
  String get adminDlnaDefaultUser => 'Utilisateur par défaut';

  @override
  String get adminDlnaDefaultUserHelp =>
      'Les appareils connectés voient les bibliothèques de cet utilisateur. Un profil d\'appareil peut remplacer ce choix.';

  @override
  String get adminDlnaDebugLog => 'Activer les journaux de débogage DLNA';

  @override
  String get adminDlnaDebugLogHelp =>
      'Produit des fichiers de journal volumineux. Ne l\'activez que le temps d\'un diagnostic.';

  @override
  String get adminDrawerCameraUpload => 'Téléversement des photos';

  @override
  String get adminPageDescCameraUpload =>
      'Où sont enregistrées les photos venant des téléphones';

  @override
  String get adminCameraUploadPath => 'Dossier de téléversement des photos';

  @override
  String get adminCameraUploadPathHelp =>
      'Laissez le champ vide pour utiliser le dossier par défaut. Un dossier personnalisé doit aussi être ajouté comme bibliothèque.';

  @override
  String get adminCameraUploadSubfolders =>
      'Créer un sous-dossier par appareil';

  @override
  String get adminDrawerConversions => 'Conversions';

  @override
  String get adminPageDescConversions => 'Médias convertis et téléchargements';

  @override
  String get adminConversionsTempPath => 'Dossier des fichiers temporaires';

  @override
  String get adminConversionsTempPathHelp =>
      'Emplacement où les médias sont conservés pendant leur conversion.';

  @override
  String get adminConversionsFullSpeed => 'Convertir à pleine vitesse';

  @override
  String get adminConversionsFullSpeedHelp =>
      'Par défaut, les conversions sont ralenties pour limiter la charge.';

  @override
  String get adminDrawerPremiere => 'Emby Premiere';

  @override
  String get adminPageDescPremiere => 'Statut et clé de licence';

  @override
  String get adminPremiereActive => 'Premiere est actif sur ce serveur.';

  @override
  String get adminPremiereInactive => 'Ce serveur n\'a pas de clé Premiere.';

  @override
  String get adminPremiereKeyInvalid =>
      'Une clé est renseignée mais elle n\'est pas active. Elle est peut-être mal saisie ou expirée.';

  @override
  String get adminPremiereCurrentKey => 'Clé actuelle';

  @override
  String get adminPremiereNewKey => 'Nouvelle clé';

  @override
  String get adminPremiereNewKeyHint =>
      'Collez la clé reçue dans votre e-mail Emby Premiere.';

  @override
  String get adminPremiereSaveKey => 'Enregistrer la clé';

  @override
  String get adminPremiereRemoveKey => 'Supprimer la clé';

  @override
  String get adminPremiereKeyRejected =>
      'Emby a enregistré la clé mais ne l\'a pas acceptée.';

  @override
  String get adminPremiereLoadFailed =>
      'Impossible de charger le statut Premiere';

  @override
  String get embyPremiereRequiredTitle => 'Emby Premiere requis';

  @override
  String get embyPremiereRequiredBody =>
      'Nécessite un abonnement Emby Premiere actif sur le serveur.';

  @override
  String get embyPremiereRequiredSaveBody =>
      'Nécessite un abonnement Emby Premiere actif. Emby conserve le paramètre mais ne l\'utilisera pas tant que Premiere n\'est pas actif.';

  @override
  String get embyPremiereLearnMore => 'En savoir plus';

  @override
  String get embyPremiereSaveAnyway => 'Enregistrer quand même';

  @override
  String get embyPremiereEnterKey => 'Saisir la clé';

  @override
  String get adminPremiereNote =>
      'Nécessite Emby Premiere. Le serveur conserve ce paramètre mais ne l\'utilisera pas tant que Premiere n\'est pas actif.';

  @override
  String adminExternalIdLabel(String name) {
    return 'ID $name';
  }

  @override
  String get adminExternalIdTypePerson => 'Personne';

  @override
  String get adminExternalIdTypeArtist => 'Artiste';

  @override
  String get adminExternalIdTypeAlbumArtist => 'Artiste de l\'album';

  @override
  String get adminExternalIdTypeOtherArtist => 'Autre artiste';

  @override
  String get adminExternalIdTypeReleaseGroup => 'Release Group';

  @override
  String get adminExternalIdTypeBook => 'Livre';

  @override
  String get adminPlaybackHwAccelWarning =>
      'L\'accélération matérielle peut être instable sur certains systèmes. Maintenez le système d\'exploitation et les pilotes vidéo à jour, et revenez à « Aucun » si la vidéo ne se lit plus.';

  @override
  String get adminLibMetadataChangeHelp =>
      'Les modifications des paramètres de métadonnées s\'appliquent aux nouveaux contenus. Pour mettre à jour un contenu existant, actualisez-le depuis son écran de détails ou actualisez la bibliothèque.';

  @override
  String get adminLibFetcherSettings => 'Paramètres du récupérateur';

  @override
  String adminLibImageOptionsTitle(String type) {
    return 'Options d\'images pour $type';
  }

  @override
  String get adminLibFetchImages => 'Récupérer les images';

  @override
  String get adminLibMaxBackdrops => 'Nombre maximal de vignettes par élément';

  @override
  String get adminLibMinBackdropWidth =>
      'Largeur minimale des vignettes à télécharger';

  @override
  String get adminImageTypeArt => 'Visuel détouré';

  @override
  String get adminImageTypeBox => 'Jaquette';

  @override
  String get adminImageTypeBoxRear => 'Jaquette (dos)';

  @override
  String get adminImageTypeDisc => 'Disque';

  @override
  String get adminImageTypeMenu => 'Menu';

  @override
  String get adminActivityMediaDetails => 'Détails du média';

  @override
  String get adminNetworkingOtherPublishedUriHint =>
      'ex. 192.168.1.0/24=http://192.168.1.5:8096';

  @override
  String get adminMetadataFieldOriginalLanguage => 'Langue originale';

  @override
  String get adminMetadataFieldDateAdded => 'Date d\'ajout';

  @override
  String get adminMetadataFieldArtists => 'Artistes';

  @override
  String get adminMetadataFieldAlbumArtists => 'Artistes de l\'album';

  @override
  String get adminMetadataFieldAlbum => 'Album';

  @override
  String get adminMetadataFieldSeriesName => 'Nom de la série';

  @override
  String get adminMetadataFieldEpisodeNumber => 'Numéro d\'épisode';

  @override
  String get adminMetadataFieldSeasonNumber => 'Numéro de saison';

  @override
  String get adminMetadataFieldTrackNumber => 'Numéro de piste';

  @override
  String get adminMetadataFieldDiscNumber => 'Numéro de disque';

  @override
  String get adminMetadataFieldAirTime => 'Heure de diffusion';

  @override
  String get adminMetadataFieldRuntime => 'Durée en minutes';

  @override
  String get adminMetadataFieldPlaceOfBirth => 'Lieu de naissance';

  @override
  String get adminMetadataFieldBirthDate => 'Date de naissance';

  @override
  String get adminMetadataFieldBirthYear => 'Année de naissance';

  @override
  String get adminMetadataFieldDeathDate => 'Date de décès';

  @override
  String get adminMetadataFieldAspectRatio => 'Format d\'image original';

  @override
  String get adminMetadataFieldAirsBeforeSeason => 'Diffusé avant la saison';

  @override
  String get adminMetadataFieldAirsAfterSeason => 'Diffusé après la saison';

  @override
  String get adminMetadataFieldAirsBeforeEpisode => 'Diffusé avant l\'épisode';

  @override
  String get adminMetadataNamesHelp =>
      'Séparez plusieurs noms par un point-virgule.';

  @override
  String get adminMetadataSectionRatings => 'Notes';

  @override
  String get adminMetadataItemLocked =>
      'Les métadonnées de cet élément sont verrouillées. Déverrouillez-les avant de l\'identifier.';

  @override
  String get adminMetadataNameOrIdRequired =>
      'Saisissez un nom ou un ID externe.';

  @override
  String get adminLibMetadataReaders => 'Lecteurs de métadonnées';

  @override
  String adminLibSimilarProvidersFor(String type) {
    return 'Fournisseurs d\'éléments similaires : $type';
  }

  @override
  String get adminLibMediaSegmentProviders => 'Fournisseurs de segments média';

  @override
  String get adminLibEnableLibrary => 'Activer la bibliothèque';

  @override
  String get adminLibEnableLibraryHelp =>
      'Désactiver la bibliothèque la masque dans toutes les vues des utilisateurs.';

  @override
  String get adminLibSaveLyricsWithMedia =>
      'Enregistrer les paroles dans les dossiers multimédias';

  @override
  String get adminLibUseCustomTagDelimiters =>
      'Utiliser un délimiteur de tags personnalisé';

  @override
  String get adminLibCustomTagDelimiters => 'Délimiteur de tags personnalisé';

  @override
  String get adminLibCustomTagDelimitersHelp =>
      'Caractères à traiter comme des délimiteurs séparant les tags.';

  @override
  String get adminLibDelimiterWhitelist => 'Liste blanche de délimiteurs';

  @override
  String get adminLibDelimiterWhitelistHelp =>
      'Éléments à exclure de la séparation des tags, un par ligne.';

  @override
  String get adminLibDownloadLanguages => 'Langues à télécharger';

  @override
  String get adminLibraryFolderRequired =>
      'Ajoutez au moins un dossier à cette bibliothèque.';

  @override
  String get adminRenameLibraryWarning =>
      'Renommer une bibliothèque efface toutes ses métadonnées. Procédez avec prudence.';

  @override
  String adminDeleteLibraryConfirm(String name) {
    return 'Supprimer la bibliothèque « $name » ? Les fichiers sur le disque ne sont pas supprimés.';
  }

  @override
  String get adminDeleteLibraryLocations =>
      'Ces emplacements de médias seront retirés de la bibliothèque :';

  @override
  String get adminRefreshMode => 'Mode d\'actualisation';

  @override
  String get adminRefreshModeScan =>
      'Rechercher les fichiers nouveaux et modifiés';

  @override
  String get adminRefreshModeMissing => 'Rechercher les métadonnées manquantes';

  @override
  String get adminReplaceTrickplayImages =>
      'Remplacer les images trickplay existantes';

  @override
  String get adminRefreshDialogHelp =>
      'Les métadonnées sont actualisées selon les paramètres et les services internet activés dans le tableau de bord.';

  @override
  String adminActivityCount(String shown, String total) {
    return '$shown sur $total';
  }

  @override
  String get adminLiveTvTabSources => 'Tuners et guide';

  @override
  String get adminLiveTvTabRecordings => 'Enregistrements';

  @override
  String get adminLiveTvAddTuner => 'Ajouter un périphérique tuner';

  @override
  String get adminLiveTvEditTuner => 'Modifier le périphérique tuner';

  @override
  String get adminLiveTvTunerType => 'Type de tuner';

  @override
  String get adminLiveTvDetectDevices => 'Détecter mes périphériques';

  @override
  String get adminLiveTvNoNewDevices => 'Aucun nouveau périphérique trouvé';

  @override
  String get adminLiveTvDrmNote =>
      'Les chaînes protégées par DRM ne seront pas importées.';

  @override
  String get adminLiveTvTunerSaved => 'Tuner enregistré';

  @override
  String get adminLiveTvDeleteTuner => 'Supprimer le périphérique tuner';

  @override
  String get adminLiveTvDeleteTunerConfirm =>
      'Êtes-vous sûr de vouloir supprimer ce périphérique tuner ?';

  @override
  String get adminLiveTvDeleteProvider => 'Supprimer le fournisseur de guide';

  @override
  String get adminLiveTvDeleteProviderConfirm =>
      'Êtes-vous sûr de vouloir supprimer ce fournisseur de guide ?';

  @override
  String get adminLiveTvProviderSaved => 'Fournisseur de guide enregistré';

  @override
  String get adminLiveTvAddProvider => 'Ajouter un fournisseur';

  @override
  String get adminLiveTvRefreshGuide => 'Actualiser les données du guide';

  @override
  String get adminLiveTvMapChannels => 'Mapper les chaînes';

  @override
  String get adminLiveTvNoTunerChannels => 'Aucune chaîne de tuner trouvée';

  @override
  String get adminLiveTvXmltvPathHelp =>
      'Chemin ou URL d\'un fichier XMLTV. Le serveur le lit et vérifie s\'il a été mis à jour. C\'est à vous de créer et de mettre à jour ce fichier.';

  @override
  String adminLiveTvSdCreateAccount(String url) {
    return 'Créez un compte sur $url';
  }

  @override
  String get adminLiveTvSdSignIn => 'Se connecter';

  @override
  String get adminLiveTvSdLineup => 'Grille de chaînes';

  @override
  String get adminLiveTvSdSelectLineup =>
      'Sélectionnez une grille de chaînes. Si aucune n\'apparaît, vérifiez votre nom d\'utilisateur, votre mot de passe et le code postal.';

  @override
  String get adminLiveTvGuideDays =>
      'Nombre de jours de données du guide à télécharger';

  @override
  String get adminLiveTvGuideDaysHelp =>
      'Un nombre de jours élevé permet de programmer plus loin à l\'avance et d\'afficher plus de programmes, mais le téléchargement prend plus de temps. Le réglage Automatique choisit une valeur d\'après le nombre de chaînes.';

  @override
  String get adminLiveTvRecordingPath => 'Chemin d\'enregistrement par défaut';

  @override
  String get adminLiveTvRecordingPathHelp =>
      'Emplacement où les enregistrements sont stockés. Si le champ est vide, le dossier de données du serveur est utilisé.';

  @override
  String get adminLiveTvStartWhenPossible => 'Démarrer si possible';

  @override
  String get adminLiveTvStopWhenPossible => 'Arrêter si possible';

  @override
  String get adminLiveTvMinutesBefore => 'minutes avant';

  @override
  String get adminLiveTvMinutesAfter => 'minutes après';

  @override
  String get adminLiveTvSectionGuide => 'Données du guide';

  @override
  String get adminLiveTvSectionDefaultRecording =>
      'Paramètres d\'enregistrement par défaut';

  @override
  String get adminLiveTvSectionMetadata => 'Métadonnées des enregistrements';

  @override
  String adminUserLastActivity(String time) {
    return 'Dernière activité : $time';
  }

  @override
  String get adminCurrentPassword => 'Mot de passe actuel';

  @override
  String get adminChannelAccess => 'Accès aux chaînes';

  @override
  String get adminDeviceAccess => 'Accès aux appareils';

  @override
  String get adminDeleteFromAllLibraries => 'Toutes les bibliothèques';

  @override
  String get adminUserDisabledBanner =>
      'Cet utilisateur est désactivé. Désactivez l\'option « Désactivé » dans « Autorisations » pour lui permettre de se reconnecter.';

  @override
  String get adminNewPasswordEmpty =>
      'Le nouveau mot de passe ne peut pas être vide';

  @override
  String get adminScheduleStartBeforeEnd =>
      'L\'heure de début doit précéder l\'heure de fin';

  @override
  String get adminDashboardAlerts => 'Alertes';

  @override
  String get adminSessionGoHome => 'Aller à l\'écran d\'accueil';

  @override
  String get adminPlayMethodRemux => 'Remuxage';

  @override
  String get adminPlayMethodDirectStream => 'Flux direct';

  @override
  String get adminPlayMethodDirectPlay => 'Lecture directe';

  @override
  String get adminLogLevelTrace => 'Trace';

  @override
  String get adminLogLevelDebug => 'Débogage';

  @override
  String get adminLogLevelInformation => 'Information';

  @override
  String get adminLogLevelWarning => 'Avertissement';

  @override
  String get adminLogLevelError => 'Erreur';

  @override
  String get adminLogLevelCritical => 'Critique';

  @override
  String get adminLogLevelNone => 'Aucun';

  @override
  String get adminActivityAllUsers => 'Tous les utilisateurs';

  @override
  String adminTaskLastRan(String time, String duration) {
    return 'Dernière exécution $time, durée : $duration.';
  }

  @override
  String get adminTaskResultFailed => 'Échouée';

  @override
  String get adminTaskResultCancelled => 'Annulée';

  @override
  String get adminTaskResultAborted => 'Interrompue par l\'arrêt du serveur';

  @override
  String adminDurationSecondsShort(String seconds) {
    return '${seconds}s';
  }

  @override
  String get adminDeleteTaskTrigger => 'Supprimer le déclencheur';

  @override
  String get adminDeleteTaskTriggerConfirm =>
      'Êtes-vous sûr de vouloir supprimer ce déclencheur ?';

  @override
  String adminTaskTriggerEveryMinutes(String minutes) {
    return 'Toutes les $minutes minutes';
  }

  @override
  String adminTaskTriggerEveryHours(String hours) {
    return 'Toutes les $hours heures';
  }

  @override
  String adminTaskMinutesValue(String minutes) {
    return '$minutes minutes';
  }

  @override
  String adminTaskHoursValue(String hours) {
    return '$hours heures';
  }

  @override
  String get adminTimeLimitHours => 'Limite de temps (heures)';

  @override
  String get adminTranscodingDecodingFor => 'Activer le décodage matériel pour';

  @override
  String get adminTranscodingThreadCountHelp =>
      'Nombre maximal de threads qu\'un transcodage peut utiliser. Moins de threads sollicitent moins le processeur, mais risquent d\'être trop lents pour une lecture fluide.';

  @override
  String get adminTranscodingThreadMax => 'Max';

  @override
  String get adminTranscodingFfmpegPath => 'Chemin de FFmpeg';

  @override
  String get adminTranscodingFfmpegPathHelp =>
      'Le FFmpeg utilisé par le serveur. Il se configure sur le serveur, pas ici.';

  @override
  String get adminTranscodingAudioSeek => 'Stratégie de recherche audio';

  @override
  String get adminTranscodingAudioSeekHelp =>
      'Comment le serveur gère l\'audio lorsque vous effectuez une recherche dans un flux HLS.';

  @override
  String get adminTranscodingTrimCopiedAudio => 'Rogner l\'audio copié';

  @override
  String get adminTranscodingTranscodeAudio => 'Transcoder l\'audio';

  @override
  String get adminResumeMinAudiobookMinutes =>
      'Reprise minimale des livres audio (minutes)';

  @override
  String get adminResumeMinAudiobookHelp =>
      'Les livres audio arrêtés avant cette durée sont considérés comme non lus.';

  @override
  String get adminResumeAudiobookRemaining =>
      'Minutes restantes pour reprendre un livre audio';

  @override
  String get adminResumeAudiobookRemainingHelp =>
      'Les livres audio arrêtés à moins de ce nombre de minutes de la fin sont considérés comme lus.';

  @override
  String get adminBrandingSplashSection => 'Écran de démarrage';

  @override
  String get adminBrandingSectionWebClient => 'Client web';

  @override
  String get adminBrandingSplashSizeHint =>
      'Les images personnalisées doivent avoir un rapport de 16x9 et une taille minimale de 1920x1080.';

  @override
  String get adminNetworkingSectionServerAddress =>
      'Paramètres d\'adresse du serveur';

  @override
  String get adminNetworkingSectionHttps => 'Paramètres HTTPS';

  @override
  String get adminNetworkingSectionRemoteAccess =>
      'Paramètres d\'accès distant';

  @override
  String get adminNetworkingSectionIpProtocols => 'Protocoles IP';

  @override
  String get adminNetworkingSectionDiscovery => 'Découverte réseau';

  @override
  String get adminNetworkingSectionFirewall =>
      'Paramètres de pare-feu et de proxy';

  @override
  String get adminNetworkingLocalHttpPort => 'Numéro de port HTTP local';

  @override
  String get adminNetworkingLocalHttpPortHelp =>
      'Numéro de port TCP du serveur HTTP.';

  @override
  String get adminNetworkingEnableHttpsHelp =>
      'Écoute sur le port HTTPS. Un certificat valide doit également être configuré pour que cela prenne effet.';

  @override
  String get adminNetworkingLocalHttpsPort => 'Numéro de port HTTPS local';

  @override
  String get adminNetworkingLocalHttpsPortHelp =>
      'Numéro de port TCP du serveur HTTPS.';

  @override
  String get adminNetworkingBaseUrlHelp =>
      'Ajoute un sous-répertoire à l\'URL du serveur, par exemple https://example.com/jellyfin.';

  @override
  String get adminNetworkingBindAddress => 'Lier à l\'adresse du réseau local';

  @override
  String get adminNetworkingBindAddressHelp =>
      'Remplace l\'adresse IP locale du serveur HTTP. Laissez le champ vide pour écouter sur toutes les adresses. Toute modification nécessite un redémarrage.';

  @override
  String get adminNetworkingLanNetworksHelp =>
      'Adresses IP ou entrées IP/masque des réseaux considérés comme locaux pour les limites de bande passante et d\'accès distant. Laissez le champ vide pour considérer toutes les adresses RFC1918 comme locales.';

  @override
  String get adminNetworkingKnownProxiesHelp =>
      'Adresses IP ou noms d\'hôte des proxys placés devant ce serveur. Nécessaire pour lire les en-têtes X-Forwarded-For. Toute modification nécessite un redémarrage.';

  @override
  String get adminNetworkingCustomCertPath =>
      'Chemin du certificat SSL personnalisé';

  @override
  String get adminNetworkingCertPathHelp =>
      'Chemin d\'un fichier PKCS #12 contenant un certificat et une clé privée, pour le TLS sur un domaine personnalisé.';

  @override
  String get adminNetworkingCertPasswordHelp =>
      'Saisissez le mot de passe si votre certificat en exige un.';

  @override
  String get adminNetworkingAllowRemote =>
      'Autoriser les connexions distantes à ce serveur';

  @override
  String get adminNetworkingAllowRemoteHelp =>
      'Si cette option est désactivée, toutes les connexions distantes sont bloquées.';

  @override
  String get adminNetworkingRemoteIpFilterHelp =>
      'Adresses IP ou entrées IP/masque des réseaux distants. Laissez le champ vide pour autoriser toutes les adresses distantes.';

  @override
  String get adminNetworkingRemoteIpFilterMode => 'Mode du filtre IP distant';

  @override
  String get adminNetworkingPublicHttpPortHelp =>
      'Port public associé au port HTTP local.';

  @override
  String get adminNetworkingPublicHttpsPortHelp =>
      'Port public associé au port HTTPS local.';

  @override
  String get adminNetworkingAutoDiscoveryLabel =>
      'Activer la découverte automatique';

  @override
  String get adminNetworkingAutoDiscoveryHelp =>
      'Permet aux applications de trouver ce serveur sur le port UDP 7359.';

  @override
  String get adminNetworkingSamePublishedUri =>
      'Utiliser la même URI publiée du serveur pour l\'accès interne et externe';

  @override
  String get adminNetworkingPublishedUri => 'URI publiée du serveur';

  @override
  String get adminNetworkingPublishedUriHelp =>
      'Remplace l\'URI communiquée par le serveur, selon l\'interface ou l\'adresse IP du client.';

  @override
  String get adminNetworkingInternalUri => 'URI interne';

  @override
  String get adminNetworkingInternalUriHelp =>
      'URI publiée du serveur pour l\'accès interne.';

  @override
  String get adminNetworkingExternalUri => 'URI externe';

  @override
  String get adminNetworkingExternalUriHelp =>
      'URI publiée du serveur pour l\'accès externe.';

  @override
  String get adminNetworkingOtherPublishedUris => 'Autres URI publiées';

  @override
  String get adminNetworkingOtherPublishedUrisHelp =>
      'URI propres à un sous-réseau ou à une interface, au format sous-réseau=URI.';

  @override
  String get adminBackupsHelp =>
      'Créez et restaurez des instantanés de votre serveur. Ils peuvent inclure la base de données, les métadonnées, les sous-titres et les images trickplay.';

  @override
  String get adminBackupDisclaimer =>
      'Selon la taille de votre bibliothèque, la sauvegarde peut prendre un certain temps.';

  @override
  String get adminBackupTasksWarningTitle =>
      'Des tâches planifiées sont en cours';

  @override
  String get adminBackupTasksWarning =>
      'Arrêtez ces tâches ou attendez qu\'elles se terminent avant de créer une sauvegarde.';

  @override
  String get adminBackupArchiveNotFound =>
      'Le serveur n\'a pas trouvé cette archive de sauvegarde.';

  @override
  String get adminRestoreInProgress => 'Restauration en cours';

  @override
  String get adminRestoreWaitingForServer =>
      'En attente du retour en ligne du serveur.';

  @override
  String get adminRestoreSucceeded => 'Restauration terminée';

  @override
  String get adminLogWatch => 'Suivre en direct';

  @override
  String get adminLogStopWatching => 'Arrêter le suivi';

  @override
  String get adminPluginInstallConfirmTitle =>
      'Confirmer l\'installation du plugin';

  @override
  String get adminPluginInstallDisclaimer =>
      'Installer un plugin tiers comporte des risques. Il peut contenir du code instable ou malveillant, et il peut changer à tout moment. N\'installez que des plugins d\'auteurs de confiance, en sachant ce qu\'ils peuvent faire : interroger des services externes, ralentir l\'analyse des bibliothèques ou ajouter des traitements en arrière-plan.';

  @override
  String get adminGroupOverview => 'Vue d\'ensemble';

  @override
  String get adminGroupLibrary => 'Bibliothèque';

  @override
  String get adminGroupPlayback => 'Lecture';

  @override
  String get adminGroupPeople => 'Personnes';

  @override
  String get adminGroupSystem => 'Système';

  @override
  String get adminAreasLabel => 'Zones d\'administration';

  @override
  String get adminPagesLabel => 'Pages';

  @override
  String get adminPageDescDashboard =>
      'État du serveur, sessions et activité récente';

  @override
  String get adminPageDescAnalytics =>
      'Tailles des bibliothèques, codecs et formats';

  @override
  String get adminPageDescActivity => 'Tout ce qui s\'est passé sur le serveur';

  @override
  String get adminPageDescTasks => 'Analyses, nettoyages et leurs déclencheurs';

  @override
  String get adminPageDescLibraries =>
      'Dossiers, analyseurs et récupérateurs de métadonnées';

  @override
  String get adminPageDescDisplay =>
      'Comment les bibliothèques s\'affichent aux utilisateurs';

  @override
  String get adminPageDescMetadata => 'Langue, pays et images par défaut';

  @override
  String get adminPageDescNfo => 'Lecture et enregistrement des NFO Kodi';

  @override
  String get adminPageDescLiveTv =>
      'Tuners, données du guide et enregistrements';

  @override
  String get adminPageDescTranscoding =>
      'Accélération matérielle, encodeurs, tone mapping';

  @override
  String get adminPageDescResume =>
      'Quand un élément est considéré comme commencé ou lu';

  @override
  String get adminPageDescStreaming =>
      'Limite de débit des connexions distantes';

  @override
  String get adminPageDescTrickplay =>
      'Miniatures d\'aperçu lors de la recherche';

  @override
  String get adminPageDescUsers => 'Comptes, accès et contrôle parental';

  @override
  String get adminPageDescDevices => 'Appareils connectés et leurs noms';

  @override
  String get adminPageDescApiKeys =>
      'Clés pour les applications et les scripts';

  @override
  String get adminPageDescSettings =>
      'Nom du serveur, langue, chemins, performances';

  @override
  String get adminPageDescBranding =>
      'Message de connexion, CSS personnalisé, écran de démarrage';

  @override
  String get adminPageDescNetworking =>
      'Ports, HTTPS, réseau local et accès distant';

  @override
  String get adminPageDescPlugins => 'Plugins installés et catalogue';

  @override
  String get adminPageDescRepositories => 'D\'où viennent les plugins';

  @override
  String get adminPageDescBackups =>
      'Créer et restaurer les sauvegardes du serveur';

  @override
  String get adminPageDescLogs => 'Fichiers journaux du serveur';

  @override
  String adminSearchSettingsHint(int count) {
    return 'Rechercher parmi $count paramètres';
  }

  @override
  String get adminSearchNoResults => 'Aucun paramètre correspondant';

  @override
  String get adminSearchClear => 'Effacer la recherche';

  @override
  String get adminUnsavedChanges => 'Modifications non enregistrées';

  @override
  String get adminDiscard => 'Abandonner';

  @override
  String get adminLeaveTitle =>
      'Abandonner les modifications non enregistrées ?';

  @override
  String get adminLeaveMessage =>
      'Les modifications de cette page n\'ont pas encore été enregistrées.';

  @override
  String get adminKeepEditing => 'Continuer l\'édition';

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
    return 'Mises à jour du plugin disponibles : $count';
  }

  @override
  String adminPluginsRequiringRestart(int count) {
    return 'Plugins nécessitant un redémarrage : $count';
  }

  @override
  String adminFailedScheduledTasks(int count) {
    return 'Tâches planifiées ayant échoué : $count';
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
  String get adminLibraryScanStarted => 'Analyse de la bibliothèque lancée';

  @override
  String errorGeneric(String error) {
    return 'Erreur : $error';
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
    return 'Échec de la commande : $error';
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
  String get sessionForward => 'Avancer';

  @override
  String get sessionNext => 'Suivant';

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
  String get adminClearDates => 'Effacer les dates';

  @override
  String get adminActivitySeverityAll => 'Toutes les gravités';

  @override
  String get adminActivityDateRange => 'Plage de dates';

  @override
  String adminActivityLoadFailed(String error) {
    return 'Échec du chargement du journal d\'activité : $error';
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
    return 'Échec de la mise à jour de l\'appareil : $error';
  }

  @override
  String get adminDeleteDevice => 'Supprimer l\'appareil';

  @override
  String get adminDeviceDeleted => 'Appareil supprimé';

  @override
  String adminDeviceDeleteFailed(String error) {
    return 'Échec de la suppression de l\'appareil : $error';
  }

  @override
  String adminRemoveDeviceConfirm(String name) {
    return 'Supprimer l\'appareil « $name » ? L\'utilisateur devra se reconnecter sur cet appareil.';
  }

  @override
  String get adminDeleteAllDevices => 'Supprimer tous les appareils';

  @override
  String adminDeleteAllDevicesConfirm(int count) {
    return 'Supprimer $count appareils ? Les utilisateurs concernés devront se reconnecter. Votre appareil actuel n\'est pas affecté.';
  }

  @override
  String get adminDevicesDeletedAll => 'Appareils supprimés';

  @override
  String adminDevicesDeletedPartial(int count) {
    return 'Certains appareils ont été supprimés ; $count n\'ont pas pu l\'être.';
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
    return 'Échec du démarrage de l\'analyse : $error';
  }

  @override
  String get adminRenameLibrary => 'Renommer la bibliothèque';

  @override
  String get adminNewName => 'Nouveau nom';

  @override
  String adminLibraryRenamed(String name) {
    return 'Bibliothèque renommée \"$name\"';
  }

  @override
  String adminRenameFailed(String error) {
    return 'Échec du changement de nom : $error';
  }

  @override
  String get adminDeleteLibrary => 'Supprimer la bibliothèque';

  @override
  String adminLibraryDeleted(String name) {
    return 'Bibliothèque \"$name\" supprimée';
  }

  @override
  String adminLibraryDeleteFailed(String error) {
    return 'Échec de la suppression de la bibliothèque : $error';
  }

  @override
  String adminAddPathFailed(String error) {
    return 'Échec de l\'ajout du chemin : $error';
  }

  @override
  String get adminRemovePath => 'Supprimer le chemin';

  @override
  String adminRemovePathConfirm(String path) {
    return 'Supprimer \"$path\" de cette bibliothèque ?';
  }

  @override
  String adminRemovePathFailed(String error) {
    return 'Échec de la suppression du chemin : $error';
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
  String get adminPreferredMetadataLanguage =>
      'Langue préférée des métadonnées';

  @override
  String get adminMetadataLanguageHint => 'ex. : en, de, fr';

  @override
  String get adminMetadataCountryCode => 'Code pays des métadonnées';

  @override
  String get adminMetadataCountryHint => 'ex. : US, DE, FR';

  @override
  String get adminLibraryTabPaths => 'Chemins';

  @override
  String get adminLibraryTabOptions => 'Options';

  @override
  String get adminLibraryTabDownloaders => 'Téléchargeurs';

  @override
  String get adminLibMetadataSavers => 'Enregistreurs de métadonnées';

  @override
  String get adminLibSubtitleDownloaders => 'Téléchargeurs de sous-titres';

  @override
  String get adminLibLyricDownloaders => 'Téléchargeurs de paroles';

  @override
  String adminLibMetadataDownloadersFor(String type) {
    return 'Téléchargeurs de métadonnées : $type';
  }

  @override
  String adminLibImageFetchersFor(String type) {
    return 'Récupérateurs d\'images : $type';
  }

  @override
  String get adminLibNoDownloaders =>
      'Ce serveur ne propose aucun téléchargeur pour ce type de bibliothèque.';

  @override
  String get adminLibrarySectionGeneral => 'Général';

  @override
  String get adminLibrarySectionMetadata => 'Métadonnées';

  @override
  String get adminLibrarySectionEmbedded => 'Informations intégrées';

  @override
  String get adminLibrarySectionSubtitles => 'Sous-titres';

  @override
  String get adminLibrarySectionImages => 'Images';

  @override
  String get adminLibrarySectionSeries => 'Séries';

  @override
  String get adminLibrarySectionMusic => 'Musique';

  @override
  String get adminLibrarySectionMovies => 'Films';

  @override
  String get adminLibRealtimeMonitor => 'Activer la surveillance en temps réel';

  @override
  String get adminLibRealtimeMonitorHint =>
      'Détecter les modifications de fichiers et les traiter automatiquement.';

  @override
  String get adminLibEnablePhotos => 'Afficher les photos';

  @override
  String get adminLibSaveLocalMetadata =>
      'Enregistrer les visuels dans les dossiers multimédias';

  @override
  String get adminLibRefreshInterval =>
      'Actualisation automatique des métadonnées';

  @override
  String get adminLibRefreshNever => 'Jamais';

  @override
  String get adminLibDefault => 'Par défaut';

  @override
  String get adminLibDisplayTitle => 'Affichage';

  @override
  String get adminLibDisplaySection => 'Affichage de la bibliothèque';

  @override
  String get adminLibFolderView =>
      'Afficher une vue dossier pour montrer les dossiers multimédias bruts';

  @override
  String get adminLibSpecialsInSeasons =>
      'Afficher les épisodes spéciaux dans les saisons où ils ont été diffusés';

  @override
  String get adminLibGroupMovies => 'Regrouper les films en collections';

  @override
  String get adminLibGroupShows => 'Regrouper les séries en collections';

  @override
  String get adminLibExternalSuggestions =>
      'Afficher du contenu externe dans les suggestions';

  @override
  String get adminLibDateAddedSection => 'Comportement de la date d\'ajout';

  @override
  String get adminLibDateAddedLabel => 'Utiliser la date d\'ajout provenant de';

  @override
  String get adminLibDateAddedImport => 'Date d\'analyse dans la bibliothèque';

  @override
  String get adminLibDateAddedFile => 'Date de création du fichier';

  @override
  String get adminLibMetadataTitle => 'Métadonnées et images';

  @override
  String get adminLibMetadataLangSection => 'Langue préférée des métadonnées';

  @override
  String get adminLibChaptersSection => 'Chapitres';

  @override
  String get adminLibDummyChapterDuration =>
      'Durée des chapitres factices (secondes)';

  @override
  String get adminLibDummyChapterDurationHint =>
      'Durée des chapitres générés pour les médias qui n\'en ont pas. Réglez sur 0 pour désactiver.';

  @override
  String get adminLibChapterImageResolution =>
      'Résolution des images de chapitre';

  @override
  String get adminLibNfoTitle => 'Paramètres NFO';

  @override
  String get adminLibNfoHelp =>
      'Les métadonnées NFO sont compatibles avec Kodi et les clients similaires. Ces paramètres s\'appliquent à toutes les bibliothèques qui enregistrent des métadonnées NFO.';

  @override
  String get adminLibKodiUser =>
      'Utilisateur dont les données de visionnage sont enregistrées dans les fichiers NFO';

  @override
  String get adminLibSaveImagePaths =>
      'Enregistrer les chemins d\'images dans les fichiers NFO';

  @override
  String get adminLibPathSubstitution =>
      'Activer la substitution de chemin pour les chemins d\'images NFO';

  @override
  String get adminLibExtraThumbs =>
      'Copier les images extrafanart dans un dossier extrathumbs';

  @override
  String get adminLibNone => 'Aucun';

  @override
  String adminLibRefreshDays(int days) {
    return '$days jours';
  }

  @override
  String get adminLibEmbeddedTitles => 'Utiliser les titres intégrés';

  @override
  String get adminLibEmbeddedExtrasTitles =>
      'Utiliser les titres intégrés pour les extras';

  @override
  String get adminLibEmbeddedEpisodeInfos =>
      'Utiliser les informations d\'épisode intégrées';

  @override
  String get adminLibAllowEmbeddedSubtitles =>
      'Autoriser les sous-titres intégrés';

  @override
  String get adminLibEmbeddedAllowAll => 'Tout autoriser';

  @override
  String get adminLibEmbeddedAllowText => 'Texte uniquement';

  @override
  String get adminLibEmbeddedAllowImage => 'Image uniquement';

  @override
  String get adminLibEmbeddedAllowNone => 'Aucun';

  @override
  String get adminLibSkipIfEmbeddedSubs =>
      'Ignorer le téléchargement si des sous-titres intégrés sont présents';

  @override
  String get adminLibSkipIfAudioMatches =>
      'Ignorer le téléchargement si la piste audio correspond à la langue de téléchargement';

  @override
  String get adminLibRequirePerfectMatch =>
      'Exiger une correspondance parfaite des sous-titres';

  @override
  String get adminLibSaveSubtitlesWithMedia =>
      'Enregistrer les sous-titres dans les dossiers multimédias';

  @override
  String get adminLibChapterImageExtraction =>
      'Extraire les images de chapitre';

  @override
  String get adminLibChapterImagesDuringScan =>
      'Extraire les images de chapitre pendant l\'analyse de la bibliothèque';

  @override
  String get adminLibTrickplayExtraction =>
      'Activer l\'extraction des images trickplay';

  @override
  String get adminLibTrickplayDuringScan =>
      'Extraire les images trickplay pendant l\'analyse de la bibliothèque';

  @override
  String get adminLibSaveTrickplayWithMedia =>
      'Enregistrer les images trickplay dans les dossiers multimédias';

  @override
  String get adminLibAutomaticSeriesGrouping =>
      'Fusionner automatiquement les séries réparties sur plusieurs dossiers';

  @override
  String get adminLibSeasonZeroName => 'Nom d\'affichage de la saison zéro';

  @override
  String get adminLibLufsScan =>
      'Activer l\'analyse LUFS pour la normalisation audio';

  @override
  String get adminLibPreferNonstandardArtist =>
      'Préférer le tag d\'artistes non standard';

  @override
  String get adminLibAutoAddToCollection =>
      'Ajouter automatiquement les films aux collections';

  @override
  String get adminLibraryNameRequired => 'Le nom de la bibliothèque est requis';

  @override
  String adminLibraryCreateFailed(String error) {
    return 'Échec de la création de la bibliothèque : $error';
  }

  @override
  String get adminLibraryName => 'Nom de la bibliothèque';

  @override
  String get adminSelectedPaths => 'Chemins sélectionnés :';

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
    return 'Désactiver $name ? Ils ne pourront pas se connecter.';
  }

  @override
  String adminEnableUserConfirm(String name) {
    return 'Activer $name ? Ils pourront se reconnecter.';
  }

  @override
  String adminUserDisabled(String name) {
    return 'Utilisateur \"$name\" désactivé';
  }

  @override
  String adminUserEnabled(String name) {
    return 'Utilisateur \"$name\" activé';
  }

  @override
  String adminUserPolicyUpdateFailed(String error) {
    return 'Échec de la mise à jour de la stratégie utilisateur : $error';
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
    return 'Échec de la création de l\'utilisateur : $error';
  }

  @override
  String get adminCreateUser => 'Créer un utilisateur';

  @override
  String get adminPasswordOptional => 'Mot de passe (facultatif)';

  @override
  String get adminUsernameRequired =>
      'Le nom d\'utilisateur ne peut pas être vide';

  @override
  String adminSaveFailed(String error) {
    return 'Échec de l\'enregistrement : $error';
  }

  @override
  String get adminPasswordsMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String adminFailed(String error) {
    return 'Échec : $error';
  }

  @override
  String get adminUserLoadFailed => 'Échec du chargement de l\'utilisateur';

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
  String get adminEnableAllLibraryAccess =>
      'Activer l\'accès à toutes les bibliothèques';

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
  String get adminEnableAllDevices => 'Activer l\'accès à tous les appareils';

  @override
  String get adminEnableAllChannels => 'Activer l\'accès à toutes les chaînes';

  @override
  String get adminParentalControl => 'Contrôle parental';

  @override
  String get adminMaxParentalRating =>
      'Classification parentale maximale autorisée';

  @override
  String get adminMaxParentalRatingHint =>
      'Le contenu dont la classification est supérieure sera masqué à cet utilisateur.';

  @override
  String get adminParentalRatingNone => 'Aucune';

  @override
  String get adminBlockUnratedItems =>
      'Bloquer les éléments sans classification ou dont la classification n\'est pas reconnue';

  @override
  String get adminUnratedBook => 'Livres';

  @override
  String get adminUnratedChannelContent => 'Chaînes';

  @override
  String get adminUnratedLiveTvChannel => 'TV en direct';

  @override
  String get adminUnratedMovie => 'Films';

  @override
  String get adminUnratedMusic => 'Musique';

  @override
  String get adminUnratedTrailer => 'Bandes-annonces';

  @override
  String get adminUnratedSeries => 'Séries';

  @override
  String get adminAccessSchedules => 'Horaires d\'accès';

  @override
  String get adminAccessSchedulesHint =>
      'N\'autoriser l\'accès que pendant les plages horaires ci-dessous. L\'accès est autorisé toute la journée si aucun horaire n\'est défini.';

  @override
  String get adminAddSchedule => 'Ajouter un horaire';

  @override
  String get adminScheduleDay => 'Jour';

  @override
  String get adminScheduleStart => 'Début';

  @override
  String get adminScheduleEnd => 'Fin';

  @override
  String get adminDayEveryday => 'Tous les jours';

  @override
  String get adminDayWeekday => 'En semaine';

  @override
  String get adminDayWeekend => 'Week-end';

  @override
  String get adminDaySunday => 'Dimanche';

  @override
  String get adminDayMonday => 'Lundi';

  @override
  String get adminDayTuesday => 'Mardi';

  @override
  String get adminDayWednesday => 'Mercredi';

  @override
  String get adminDayThursday => 'Jeudi';

  @override
  String get adminDayFriday => 'Vendredi';

  @override
  String get adminDaySaturday => 'Samedi';

  @override
  String get adminAllowedTags => 'Tags autorisés';

  @override
  String get adminAllowedTagsHint =>
      'Seul le contenu portant ces tags est affiché. Laissez vide pour tout autoriser.';

  @override
  String get adminBlockedTags => 'Tags bloqués';

  @override
  String get adminBlockedTagsHint =>
      'Le contenu portant ces tags est masqué à cet utilisateur.';

  @override
  String get adminAddTag => 'Ajouter un tag';

  @override
  String get adminAuthProvider => 'Fournisseur d\'authentification';

  @override
  String get adminPasswordResetProvider =>
      'Fournisseur de réinitialisation du mot de passe';

  @override
  String get adminLoginAttemptsBeforeLockout =>
      'Nombre maximal de tentatives de connexion échouées avant verrouillage';

  @override
  String get adminLoginAttemptsHint =>
      'Réglez sur 0 pour la valeur par défaut, ou sur -1 pour désactiver le verrouillage.';

  @override
  String get adminSyncPlayAccess => 'Accès SyncPlay';

  @override
  String get adminSyncPlayCreateAndJoin =>
      'Autoriser la création de groupes et la participation';

  @override
  String get adminSyncPlayJoin => 'Autoriser la participation aux groupes';

  @override
  String get adminSyncPlayNone => 'Aucun accès';

  @override
  String get adminContentDeletionFolders =>
      'Autoriser la suppression de contenu depuis';

  @override
  String get adminResetPasswordWarning =>
      'Cela supprimera le mot de passe. L\'utilisateur pourra se connecter sans mot de passe.';

  @override
  String adminServerReturnedHttp(int status) {
    return 'Le serveur a renvoyé HTTP $status';
  }

  @override
  String adminDeleteUserConfirm(String name) {
    return 'Êtes-vous sûr de vouloir supprimer $name ?';
  }

  @override
  String adminUserDeleted(String name) {
    return 'Utilisateur \"$name\" supprimé';
  }

  @override
  String adminUserDeleteFailed(String error) {
    return 'Échec de la suppression de l\'utilisateur : $error';
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
    return 'Échec de la création de la clé : $error';
  }

  @override
  String get adminKeyTokenMissing =>
      'Jeton de clé absent dans la réponse du serveur';

  @override
  String get adminRevokeApiKey => 'Révoquer la clé API';

  @override
  String adminRevokeKeyConfirm(String name) {
    return 'Révoquer la clé pour $name ?';
  }

  @override
  String get adminApiKeyRevoked => 'Clé API révoquée';

  @override
  String adminApiKeyRevokeFailed(String error) {
    return 'Échec de la révocation de la clé : $error';
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
    return 'Jeton : $token\\nCréé : $created';
  }

  @override
  String get adminBackupOptionsTitle => 'Créer une sauvegarde';

  @override
  String get adminBackupDatabase => 'Base de données';

  @override
  String get adminBackupDatabaseAlways => 'Toujours incluse';

  @override
  String get adminBackupMetadata => 'Métadonnées';

  @override
  String get adminBackupSubtitles => 'Sous-titres';

  @override
  String get adminBackupTrickplay => 'Images trickplay';

  @override
  String get adminCreatingBackup => 'Création de la sauvegarde…';

  @override
  String get adminBackupCreated => 'Sauvegarde créée avec succès';

  @override
  String adminBackupCreateFailed(String error) {
    return 'Échec de la création de la sauvegarde : $error';
  }

  @override
  String get adminBackupPathMissing =>
      'Chemin de sauvegarde absent dans la réponse du serveur';

  @override
  String adminBackupManifest(String name) {
    return 'Manifeste : $name';
  }

  @override
  String adminManifestLoadFailed(String error) {
    return 'Échec du chargement du manifeste : $error';
  }

  @override
  String get adminConfirmRestore => 'Confirmer la restauration';

  @override
  String get adminRestoringBackup => 'Restauration de la sauvegarde…';

  @override
  String adminRestoreFailed(String error) {
    return 'Échec de la restauration de la sauvegarde : $error';
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
    return 'Enregistré dans $path';
  }

  @override
  String adminFileSaveFailed(String error) {
    return 'Échec de l\'enregistrement du fichier : $error';
  }

  @override
  String adminLogFileLoadFailed(String fileName) {
    return 'Échec du chargement de $fileName';
  }

  @override
  String get adminSearchInLog => 'Rechercher dans le journal';

  @override
  String get adminNoMatchingLines => 'Aucune ligne correspondante';

  @override
  String adminTasksLoadFailed(String error) {
    return 'Échec du chargement des tâches : $error';
  }

  @override
  String get adminNoScheduledTasks => 'Aucune tâche planifiée trouvée';

  @override
  String get adminNoTasksMatchFilter =>
      'Aucune tâche ne correspond au filtre actuel';

  @override
  String adminTaskStartFailed(String error) {
    return 'Échec du démarrage de la tâche : $error';
  }

  @override
  String adminTaskStopFailed(String error) {
    return 'Échec de l\'arrêt de la tâche : $error';
  }

  @override
  String adminTaskLoadFailed(String error) {
    return 'Échec du chargement de la tâche : $error';
  }

  @override
  String get adminRunNow => 'Exécuter maintenant';

  @override
  String adminTriggerRemoveFailed(String error) {
    return 'Échec de la suppression du déclencheur : $error';
  }

  @override
  String adminTriggerAddFailed(String error) {
    return 'Échec de l\'ajout du déclencheur : $error';
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
  String get adminNoLimit => 'Aucune limite';

  @override
  String adminHours(String hours) {
    return '$hours heure(s)';
  }

  @override
  String get adminDayOfWeek => 'Jour de la semaine';

  @override
  String get adminSearchPlugins => 'Rechercher des plugins…';

  @override
  String adminPluginToggleFailed(String error) {
    return 'Échec du basculement du plugin : $error';
  }

  @override
  String get adminUninstallPlugin => 'Désinstaller le plugin';

  @override
  String adminUninstallPluginConfirm(String name) {
    return 'Etes-vous sûr de vouloir désinstaller \"$name\" ?';
  }

  @override
  String adminPluginUninstallFailed(String error) {
    return 'Échec de la désinstallation du plugin : $error';
  }

  @override
  String adminPackageInstallFailed(String error) {
    return 'Échec de l\'installation du package : $error';
  }

  @override
  String adminPluginUpdateFailed(String error) {
    return 'Échec de l\'installation de la mise à jour : $error';
  }

  @override
  String adminPluginsLoadFailed(String error) {
    return 'Échec du chargement des plugins : $error';
  }

  @override
  String get adminNoPluginsMatchSearch =>
      'Aucun plugin ne correspond à votre recherche';

  @override
  String get adminNoPluginsInstalled => 'Aucun plugin installé';

  @override
  String adminInstallUpdate(String version) {
    return 'Installer la mise à jour (v$version)';
  }

  @override
  String adminCatalogLoadFailed(String error) {
    return 'Échec du chargement du catalogue : $error';
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
    return '\"$name\" sera supprimé après le redémarrage du serveur';
  }

  @override
  String adminUninstallFailed(String error) {
    return 'Échec de la désinstallation : $error';
  }

  @override
  String adminPluginUpdating(String name, String version) {
    return 'Mise à jour de \"$name\" vers v$version…';
  }

  @override
  String adminPluginLoadFailed(String error) {
    return 'Échec du chargement du plugin : $error';
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
    return 'Êtes-vous sûr de vouloir supprimer « $name » ?';
  }

  @override
  String adminRepositoriesSaveFailed(String error) {
    return 'Échec de l\'enregistrement des référentiels : $error';
  }

  @override
  String adminRepositoriesLoadFailed(String error) {
    return 'Échec du chargement des référentiels : $error';
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
    return 'Impossible de charger les paramètres du plugin : $error';
  }

  @override
  String adminCouldNotOpenUrl(String uri) {
    return 'Impossible d\'ouvrir $uri';
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
  String get adminPlaybackLoadFailed =>
      'Impossible de charger les paramètres de lecture';

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
  String adminMetadataLoadFailed(String error) {
    return 'Échec du chargement des métadonnées : $error';
  }

  @override
  String get adminRefreshMetadata => 'Actualiser les métadonnées';

  @override
  String get recursive => 'Récursif';

  @override
  String get adminReplaceAllMetadata => 'Remplacer toutes les métadonnées';

  @override
  String get adminMetadataRefreshRequested =>
      'Actualisation des métadonnées demandée';

  @override
  String adminMetadataRefreshFailed(String error) {
    return 'Échec de l\'actualisation des métadonnées : $error';
  }

  @override
  String get adminNoRemoteMatches => 'Aucun résultat distant trouvé';

  @override
  String get adminRemoteResults => 'Résultats distants';

  @override
  String get adminRemoteMetadataApplied => 'Métadonnées distantes appliquées';

  @override
  String adminRemoteSearchFailed(String error) {
    return 'Échec de la recherche à distance : $error';
  }

  @override
  String get adminUpdateContentType => 'Mettre à jour le type de contenu';

  @override
  String get adminContentType => 'Type de contenu';

  @override
  String get adminContentTypeUpdated => 'Type de contenu mis à jour';

  @override
  String adminContentTypeUpdateFailed(String error) {
    return 'Échec de la mise à jour du type de contenu : $error';
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
    return '$imageType image mise à jour';
  }

  @override
  String adminImageDownloadFailed(String error) {
    return 'Échec du téléchargement de l\'image : $error';
  }

  @override
  String get adminUnsupportedImageFormat =>
      'Format d\'image non pris en charge';

  @override
  String get adminImageReadFailed => 'Impossible de lire l\'image sélectionnée';

  @override
  String adminImageUploaded(String imageType) {
    return '$imageType image téléchargée';
  }

  @override
  String adminImageUploadFailed(String error) {
    return 'Échec du téléchargement de l\'image : $error';
  }

  @override
  String adminDeleteImage(String imageType) {
    return 'Supprimer l\'image $imageType';
  }

  @override
  String adminImageDeleted(String imageType) {
    return '$imageType image supprimée';
  }

  @override
  String adminImageDeleteFailed(String error) {
    return 'Échec de la suppression de l\'image : $error';
  }

  @override
  String get adminAllProviders => 'Tous les fournisseurs';

  @override
  String get adminNoRemoteImages => 'Aucune image distante trouvée';

  @override
  String adminTunerDiscoveryFailed(String error) {
    return 'Échec de la découverte du tuner : $error';
  }

  @override
  String get adminTunerTypeM3u => 'Tuner M3U';

  @override
  String get adminTunerTypeHdHomerun => 'HDHomeRun';

  @override
  String get adminTunerFileOrUrl => 'Fichier ou URL';

  @override
  String get adminTunerIpAddress => 'Adresse IP du tuner';

  @override
  String get adminTunerFriendlyName => 'Nom convivial';

  @override
  String get adminTunerUserAgent => 'User agent';

  @override
  String get adminTunerCount => 'Limite de connexions simultanées';

  @override
  String get adminTunerCountHelp =>
      'Nombre maximal de flux que le tuner autorise simultanément. Réglez sur 0 pour un nombre illimité.';

  @override
  String get adminTunerFallbackBitrate =>
      'Débit de streaming maximal de secours';

  @override
  String get adminTunerImportFavoritesOnly =>
      'Importer uniquement les chaînes favorites';

  @override
  String get adminTunerAllowHwTranscoding =>
      'Autoriser le transcodage matériel';

  @override
  String get adminTunerAllowFmp4 =>
      'Autoriser le conteneur de transcodage fMP4';

  @override
  String get adminTunerAllowStreamSharing => 'Autoriser le partage de flux';

  @override
  String get adminTunerEnableStreamLooping =>
      'Activer la lecture en boucle du flux';

  @override
  String get adminTunerIgnoreDts => 'Ignorer les DTS';

  @override
  String get adminTunerReadAtNativeFramerate =>
      'Lire l\'entrée à la fréquence d\'images native';

  @override
  String get adminProviderXmltv => 'XMLTV';

  @override
  String get adminProviderSchedulesDirect => 'Schedules Direct';

  @override
  String get adminXmltvPath => 'Fichier ou URL';

  @override
  String get adminXmltvMoviePrefix => 'Préfixe des films';

  @override
  String get adminXmltvMovieCategories => 'Catégories de films';

  @override
  String get adminXmltvCategoriesHelp =>
      'Séparez plusieurs catégories par une barre verticale.';

  @override
  String get adminXmltvKidsCategories => 'Catégories jeunesse';

  @override
  String get adminXmltvNewsCategories => 'Catégories actualités';

  @override
  String get adminXmltvSportsCategories => 'Catégories sports';

  @override
  String get adminSdUsername => 'Nom d\'utilisateur';

  @override
  String get adminSdPassword => 'Mot de passe';

  @override
  String get adminSdCountry => 'Pays';

  @override
  String get adminSdCountrySelect => 'Sélectionner un pays';

  @override
  String get adminSdPostalCode => 'Code postal';

  @override
  String get adminEnableAllTuners => 'Activer tous les tuners';

  @override
  String adminTunerRemoveFailed(String error) {
    return 'Échec de la suppression du tuner : $error';
  }

  @override
  String adminProviderRemoveFailed(String error) {
    return 'Échec de la suppression du fournisseur : $error';
  }

  @override
  String get adminSeriesRecordingPath => 'Chemin d\'enregistrement des séries';

  @override
  String get adminMovieRecordingPath => 'Chemin d\'enregistrement des films';

  @override
  String get adminGuideDaysAuto => 'Automatique';

  @override
  String get adminRecordingPostProcessor =>
      'Chemin de l\'application de post-traitement';

  @override
  String get adminRecordingPostProcessorArgs => 'Arguments du post-traitement';

  @override
  String get adminSaveRecordingNfo =>
      'Enregistrer les métadonnées NFO des enregistrements';

  @override
  String get adminSaveRecordingImages =>
      'Enregistrer les images des enregistrements';

  @override
  String get adminLiveTvSectionPaths => 'Chemins d\'enregistrement';

  @override
  String get adminLiveTvSectionPostProcessing => 'Post-traitement';

  @override
  String adminSettingsSaveFailed(String error) {
    return 'Échec de l\'enregistrement des paramètres : $error';
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
  String get adminGuideRefreshStarted =>
      'Actualisation des données du guide lancée';

  @override
  String get adminGuideRefreshUnavailable =>
      'La tâche d\'actualisation du guide n\'est pas disponible sur ce serveur.';

  @override
  String get adminNoListingProviders => 'Aucun fournisseur de guide configuré';

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
    return 'Restaurer la sauvegarde $name maintenant ?';
  }

  @override
  String get adminBackupsTitle => 'Sauvegardes';

  @override
  String get adminUnknownDate => 'Date inconnue';

  @override
  String get adminUnnamedBackup => 'Sauvegarde sans nom';

  @override
  String get adminApply => 'Appliquer';

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
    return 'il y a ${minutes}m';
  }

  @override
  String adminLogsHoursAgo(int hours) {
    return '${hours}h il y a';
  }

  @override
  String adminLogsDaysAgo(int days) {
    return '${days}d il y a';
  }

  @override
  String adminLogViewerLoadFailed(String fileName) {
    return 'Échec du chargement de $fileName';
  }

  @override
  String adminLogViewerMatches(int count) {
    return '$count correspondances';
  }

  @override
  String get adminLogViewerNoMatches => 'Aucune ligne correspondante';

  @override
  String get adminMetadataEditorTitle => 'Éditeur de métadonnées';

  @override
  String get adminMetadataIdentify => 'Identifier';

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
  String get adminMetadataFieldCustomRating => 'Classification personnalisée';

  @override
  String get adminMetadataFieldTagline => 'Slogan';

  @override
  String get adminMetadataFieldOverview => 'Synopsis';

  @override
  String get adminMetadataFieldDisplayOrder => 'Ordre d\'affichage';

  @override
  String get adminMetadataDisplayOrderAired => 'Diffusion';

  @override
  String get adminMetadataDisplayOrderOriginalAirDate =>
      'Date de diffusion originale';

  @override
  String get adminMetadataDisplayOrderAbsolute => 'Absolu';

  @override
  String get adminMetadataDisplayOrderDvd => 'DVD';

  @override
  String get adminMetadataDisplayOrderDigital => 'Numérique';

  @override
  String get adminMetadataDisplayOrderStoryArc => 'Arc narratif';

  @override
  String get adminMetadataDisplayOrderProduction => 'Production';

  @override
  String get adminMetadataDisplayOrderTv => 'TV';

  @override
  String get adminMetadataDisplayOrderAlternate => 'Alternatif';

  @override
  String get adminMetadataDisplayOrderRegional => 'Régional';

  @override
  String get adminMetadataDisplayOrderAlternateDvd => 'DVD alternatif';

  @override
  String get adminMetadataDisplayOrderDateModified => 'Date de modification';

  @override
  String get adminMetadataDisplayOrderSortName => 'Nom de tri';

  @override
  String get adminMetadataDisplayOrderReleaseDate => 'Date de sortie';

  @override
  String get adminMetadataSettings => 'Paramètres des métadonnées';

  @override
  String get adminMetadataDownloadLanguage =>
      'Langue de téléchargement préférée';

  @override
  String get adminMetadataCountryRegion => 'Pays/Région';

  @override
  String get adminMetadataInheritHelp =>
      'Laissez sur « Par défaut » pour hériter du réglage de l\'élément parent ou de la valeur par défaut du serveur.';

  @override
  String get adminMetadataField3DFormat => 'Format 3D';

  @override
  String get adminMetadataPersonKindActor => 'Acteur';

  @override
  String get adminMetadataPersonKindDirector => 'Réalisateur';

  @override
  String get adminMetadataPersonKindComposer => 'Compositeur';

  @override
  String get adminMetadataPersonKindWriter => 'Scénariste';

  @override
  String get adminMetadataPersonKindGuestStar => 'Guest star';

  @override
  String get adminMetadataPersonKindProducer => 'Producteur';

  @override
  String get adminMetadataPersonKindConductor => 'Chef d\'orchestre';

  @override
  String get adminMetadataPersonKindLyricist => 'Parolier';

  @override
  String get adminMetadataPersonKindArranger => 'Arrangeur';

  @override
  String get adminMetadataPersonKindEngineer => 'Ingénieur du son';

  @override
  String get adminMetadataPersonKindMixer => 'Mixeur';

  @override
  String get adminMetadataPersonKindRemixer => 'Remixeur';

  @override
  String get adminMetadataPersonKindCreator => 'Créateur';

  @override
  String get adminMetadataPersonKindArtist => 'Artiste';

  @override
  String get adminMetadataPersonKindAlbumArtist => 'Artiste de l\'album';

  @override
  String get adminMetadataPersonKindAuthor => 'Auteur';

  @override
  String get adminMetadataPersonKindIllustrator => 'Illustrateur';

  @override
  String get adminMetadataPersonKindPenciller => 'Dessinateur';

  @override
  String get adminMetadataPersonKindInker => 'Encreur';

  @override
  String get adminMetadataPersonKindColorist => 'Coloriste';

  @override
  String get adminMetadataPersonKindLetterer => 'Lettreur';

  @override
  String get adminMetadataPersonKindCoverArtist => 'Illustrateur de couverture';

  @override
  String get adminMetadataPersonKindEditor => 'Monteur';

  @override
  String get adminMetadataPersonKindTranslator => 'Traducteur';

  @override
  String get adminMetadataPersonKindNarrator => 'Narrateur';

  @override
  String get adminMetadataAirDays => 'Jours de diffusion';

  @override
  String get adminMetadataLockItem =>
      'Verrouiller cet élément pour empêcher toute modification future des métadonnées';

  @override
  String get adminMetadataEnabledFields => 'Champs activés';

  @override
  String get adminMetadataEnabledFieldsHelp =>
      'Décochez un champ pour le verrouiller et empêcher la modification de ses données.';

  @override
  String get adminMetadataLockFieldName => 'Nom';

  @override
  String get adminMetadataLockFieldOverview => 'Résumé';

  @override
  String get adminMetadataLockFieldGenres => 'Genres';

  @override
  String get adminMetadataLockFieldOfficialRating => 'Classification parentale';

  @override
  String get adminMetadataLockFieldCast => 'Personnes';

  @override
  String get adminMetadataLockFieldProductionLocations => 'Lieux de production';

  @override
  String get adminMetadataLockFieldBirthLocation => 'Lieu de naissance';

  @override
  String get adminMetadataLockFieldRuntime => 'Durée';

  @override
  String get adminMetadataLockFieldStudios => 'Studios';

  @override
  String get adminMetadataLockFieldTags => 'Tags';

  @override
  String get adminMetadataGenres => 'Genres';

  @override
  String get adminMetadataTags => 'Balises';

  @override
  String get adminMetadataStudios => 'Studios';

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
  String get adminMetadataImageBackdrop => 'Vignette';

  @override
  String get adminMetadataImageLogo => 'Logo';

  @override
  String get adminMetadataImageBanner => 'Bannière';

  @override
  String get adminMetadataImageThumb => 'Miniature';

  @override
  String get adminMetadataProvider => 'Fournisseur';

  @override
  String adminMetadataImageUpdated(String imageType) {
    return '$imageType image mise à jour';
  }

  @override
  String adminMetadataImageUploaded(String imageType) {
    return '$imageType image téléchargée';
  }

  @override
  String adminMetadataImageDeleted(String imageType) {
    return '$imageType image supprimée';
  }

  @override
  String adminMetadataImageDownloadFailed(String error) {
    return 'Échec du téléchargement de l\'image : $error';
  }

  @override
  String get adminMetadataImageReadFailed =>
      'Impossible de lire l’image sélectionnée';

  @override
  String adminMetadataImageUploadFailed(String error) {
    return 'Échec du téléchargement de l\'image : $error';
  }

  @override
  String adminMetadataDeleteImageTitle(String imageType) {
    return 'Supprimer l\'image $imageType';
  }

  @override
  String get adminMetadataDeleteImageContent =>
      'Ceci supprime l’image actuelle de l’élément.';

  @override
  String adminMetadataImageDeleteFailed(String error) {
    return 'Échec de la suppression de l\'image : $error';
  }

  @override
  String adminMetadataChooseImage(String imageType) {
    return 'Choisissez l\'image $imageType';
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
  String get adminPluginsRestartRequired => 'Redémarrage requis';

  @override
  String get adminPluginsNoSearchResults =>
      'Aucun plugin ne correspond à votre recherche';

  @override
  String get adminPluginsNoneInstalled => 'Aucun plugin installé';

  @override
  String get adminPluginsNoneActive => 'Aucun plugin actif';

  @override
  String get adminPluginsNoneRequireRestart =>
      'Aucun plugin ne nécessite de redémarrage du serveur';

  @override
  String adminPluginsUpdateAvailable(String version) {
    return 'Mise à jour disponible : v$version';
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
    return 'Installer la mise à jour (v$version)';
  }

  @override
  String get adminPluginsCatalogNoSearchResults =>
      'Aucun paquet ne correspond à votre recherche';

  @override
  String get adminPluginsCatalogEmpty => 'Aucun paquet disponible';

  @override
  String adminPluginsInstalling(String name) {
    return '\"$name\" est en cours d\'installation…';
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
    return '$name Paramètres';
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
    return 'Échec du chargement des référentiels : $error';
  }

  @override
  String get adminReposRemoveTitle => 'Supprimer le dépôt';

  @override
  String adminReposRemoveConfirm(String name) {
    return 'Êtes-vous sûr de vouloir supprimer « $name » ?';
  }

  @override
  String get adminReposRemove => 'Retirer';

  @override
  String adminReposSaveFailed(String error) {
    return 'Échec de l\'enregistrement des référentiels : $error';
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
  String get adminNetworkingEnableHttps => 'Activer HTTPS';

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
  String get adminBrandingSplashUpload => 'Téléverser une image';

  @override
  String get adminBrandingSplashUploaded => 'Écran de démarrage mis à jour';

  @override
  String get adminBrandingSplashUploadFailed =>
      'Échec du téléversement de l\'écran de démarrage';

  @override
  String get adminBrandingSplashDeleted => 'Écran de démarrage supprimé';

  @override
  String get adminBrandingNoSplash => 'Aucun écran de démarrage personnalisé';

  @override
  String get adminPlaybackHwAccel => 'Accélération matérielle';

  @override
  String get adminPlaybackHwAccelLabel => 'Accélération matérielle';

  @override
  String get adminPlaybackEnableHwEncoding => 'Activer l’encodage matériel';

  @override
  String get adminPlaybackQsvDevice => 'Périphérique QSV';

  @override
  String get adminPlaybackEnhancedNvdec => 'Activer le décodeur NVDEC amélioré';

  @override
  String get adminPlaybackPreferNativeDecoder =>
      'Préférer le décodeur matériel natif du système';

  @override
  String get adminPlaybackColorDepth10Hevc => 'Décodage HEVC 10 bits';

  @override
  String get adminPlaybackColorDepth10Vp9 => 'Décodage VP9 10 bits';

  @override
  String get adminPlaybackColorDepth10HevcRext =>
      'Décodage HEVC RExt 8/10 bits';

  @override
  String get adminPlaybackColorDepth12HevcRext => 'Décodage HEVC RExt 12 bits';

  @override
  String get adminPlaybackHwEncodingSection => 'Encodage matériel';

  @override
  String get adminPlaybackAllowHevcEncoding => 'Autoriser l\'encodage HEVC';

  @override
  String get adminPlaybackAllowAv1Encoding => 'Autoriser l\'encodage AV1';

  @override
  String get adminPlaybackIntelLowPowerH264 =>
      'Activer l\'encodeur H.264 basse consommation Intel';

  @override
  String get adminPlaybackIntelLowPowerHevc =>
      'Activer l\'encodeur HEVC basse consommation Intel';

  @override
  String get adminPlaybackToneMapping => 'Tone mapping';

  @override
  String get adminPlaybackEnableTonemapping => 'Activer le tone mapping';

  @override
  String get adminPlaybackEnableVppTonemapping => 'Activer le tone mapping VPP';

  @override
  String get adminPlaybackEnableVtTonemapping =>
      'Activer le tone mapping VideoToolbox';

  @override
  String get adminPlaybackTonemappingAlgorithm => 'Algorithme de tone mapping';

  @override
  String get adminPlaybackTonemappingMode => 'Mode de tone mapping';

  @override
  String get adminPlaybackTonemappingRange => 'Plage de tone mapping';

  @override
  String get adminPlaybackTonemappingDesat => 'Désaturation du tone mapping';

  @override
  String get adminPlaybackTonemappingPeak => 'Pic de tone mapping';

  @override
  String get adminPlaybackTonemappingParam => 'Paramètre de tone mapping';

  @override
  String get adminPlaybackVppTonemappingBrightness =>
      'Luminosité du tone mapping VPP';

  @override
  String get adminPlaybackVppTonemappingContrast =>
      'Contraste du tone mapping VPP';

  @override
  String get adminPlaybackEncoderPreset => 'Préréglage de l\'encodeur';

  @override
  String get adminPlaybackH264Crf => 'CRF d\'encodage H.264';

  @override
  String get adminPlaybackH265Crf => 'CRF d\'encodage H.265 (HEVC)';

  @override
  String get adminPlaybackDeinterlaceMethod => 'Méthode de désentrelacement';

  @override
  String get adminPlaybackDeinterlaceDoubleRate =>
      'Doubler la fréquence d\'images lors du désentrelacement';

  @override
  String get adminPlaybackAudioSection => 'Audio';

  @override
  String get adminPlaybackEnableAudioVbr => 'Activer l\'encodage audio VBR';

  @override
  String get adminPlaybackDownmixBoost => 'Amplification du downmix audio';

  @override
  String get adminPlaybackDownmixAlgorithm => 'Algorithme de downmix stéréo';

  @override
  String get adminPlaybackMaxMuxingQueue =>
      'Taille maximale de la file de multiplexage';

  @override
  String get adminPlaybackAutoOption => 'Auto';

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
  String get adminTaskCancelling => 'Annulation…';

  @override
  String get adminTaskRunning => 'En cours…';

  @override
  String get adminTaskNeverRun => 'Jamais exécutée';

  @override
  String get adminTaskStop => 'Arrêter';

  @override
  String get adminRunningTasks => 'Tâches en cours';

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
    return 'Tous les jours à $time';
  }

  @override
  String adminTaskTriggerWeekly(String day, String time) {
    return 'Chaque $day à $time';
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
  String adminTaskTriggerHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count heures',
      one: '$count heure',
    );
    return '$_temp0';
  }

  @override
  String get adminTaskTriggerTime => 'Heure';

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
    return '${days}d il y a';
  }

  @override
  String adminActivityHoursAgo(int hours) {
    return '${hours}h il y a';
  }

  @override
  String adminActivityMinutesAgo(int minutes) {
    return 'il y a ${minutes}m';
  }

  @override
  String get adminActivityNow => 'maintenant';

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
    return '${days}j';
  }

  @override
  String adminActivityDateShort(int month, int day) {
    return '$day/$month';
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
  String get adminNetworkingPublicHttpPort => 'Port HTTP public';

  @override
  String get adminNetworkingRequireHttps => 'Exiger HTTPS';

  @override
  String get adminNetworkingRequireHttpsHint =>
      'Rediriger toutes les requêtes distantes vers HTTPS. Sans effet si le serveur ne possède pas de certificat valide.';

  @override
  String get adminNetworkingCertPassword => 'Mot de passe du certificat';

  @override
  String get adminNetworkingEnableIpv4 => 'Activer IPv4';

  @override
  String get adminNetworkingEnableIpv6 => 'Activer IPv6';

  @override
  String get adminNetworkingLocalSubnets => 'Réseaux locaux (LAN)';

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
  String get adminPlaybackThrottleDelay => 'Délai de limitation (secondes)';

  @override
  String get adminPlaybackEnableSubtitleExtraction =>
      'Autoriser l\'extraction des sous-titres à la volée';

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
    return 'Échec de la mise à jour du type de contenu : $error';
  }

  @override
  String get adminGeneralSlowResponseThreshold => 'Seuil de réponse lente (ms)';

  @override
  String get adminGeneralEnableSlowResponse =>
      'Activer les avertissements de réponse lente';

  @override
  String get adminGeneralQuickConnect => 'Activer Quick Connect';

  @override
  String get adminGeneralSectionServer => 'Serveur';

  @override
  String get adminGeneralSectionMetadata => 'Métadonnées';

  @override
  String get adminGeneralSectionPaths => 'Chemins';

  @override
  String get adminGeneralSectionPerformance => 'Performances';

  @override
  String get adminGeneralCachePath => 'Chemin du cache';

  @override
  String get adminGeneralMetadataPath => 'Chemin des métadonnées';

  @override
  String get adminGeneralServerName => 'Nom du serveur';

  @override
  String get adminGeneralDisplayLanguage => 'Langue d\'affichage préférée';

  @override
  String get adminSettingsLoadFailed => 'Échec du chargement des paramètres';

  @override
  String adminChannelMappingsUpdateFailed(String error) {
    return 'Échec de la mise à jour des mappages : $error';
  }

  @override
  String adminTimeLimitDuration(String duration) {
    return 'Limite de temps : $duration';
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
    return 'Objet $index';
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
      'Rejoindre un groupe SyncPlay peut remplacer votre lecture en cours. Continuer ?';

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
    return '$userName a rejoint le groupe SyncPlay';
  }

  @override
  String syncPlayUserLeftGroup(String userName) {
    return '$userName gauche SyncPlay groupe';
  }

  @override
  String get syncPlayAccessDeniedTitle => 'Accès SyncPlay refusé';

  @override
  String get syncPlayAccessDeniedMessage =>
      'Vous n\'avez pas accès à un ou plusieurs éléments de ce groupe SyncPlay. Demandez au propriétaire du groupe de vérifier les autorisations de la bibliothèque ou de choisir une autre file d\'attente.';

  @override
  String syncPlaySyncingPlaybackToGroup(String groupName) {
    return 'Synchronisation de la lecture avec $groupName';
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
  String integrationRowsDiscoveredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# rangées découvertes',
      one: '# rangée découverte',
    );
    return '$_temp0';
  }

  @override
  String get seeAll => 'Voir tout';

  @override
  String get noItems => 'Aucun élément';

  @override
  String get switchUser => 'Changer d\'utilisateur';

  @override
  String get remoteControl => 'Télécommande';

  @override
  String get mediaBarLoading => 'Chargement de la barre multimédia…';

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
  String get offlineSavedMedia => 'Téléchargements';

  @override
  String get offlineBannerTitle => 'Vous êtes hors ligne';

  @override
  String get offlineBannerSubtitle => 'Affichage de vos téléchargements';

  @override
  String get serverUnreachableBannerTitle =>
      'Impossible de joindre votre serveur';

  @override
  String get serverUnreachableBannerSubtitle =>
      'Lecture depuis vos téléchargements en attendant son retour';

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
    return 'Échec du contrôle de diffusion : $error';
  }

  @override
  String castKindControls(String kind) {
    return '$kind Contrôles';
  }

  @override
  String get castDeviceVolume => 'Volume de l\'appareil';

  @override
  String get castVolumeUnavailable => 'Indisponible';

  @override
  String castStopKind(String kind) {
    return 'Arrêtez $kind';
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
    return 'Saisissez un code PIN à $length chiffres';
  }

  @override
  String pinEnterYourNDigit(int length) {
    return 'Entrez votre code PIN $length à chiffres';
  }

  @override
  String get kidsMode => 'Mode enfants';

  @override
  String get kidsModeSubtitle =>
      'Simplifie l\'application et verrouille la sortie avec un code PIN';

  @override
  String get kidsModeExit => 'Quitter le mode enfants';

  @override
  String get kidsModeExitSubtitle =>
      'Saisissez votre PIN pour restaurer l\'application complète';

  @override
  String get pinIncorrect => 'PIN incorrect';

  @override
  String pinTryAgainIn(String wait) {
    return 'Trop de tentatives. Réessayez dans $wait.';
  }

  @override
  String get pinMismatch => 'Les PIN ne correspondent pas';

  @override
  String get pinForgot => 'PIN oublié ?';

  @override
  String get pinClear => 'Effacer';

  @override
  String get pinBackspace => 'Retour arrière';

  @override
  String get quickConnectAuthorized => 'Requête Quick Connect autorisée.';

  @override
  String get quickConnectInvalidOrExpired =>
      'Le code Quick Connect est invalide ou expiré.';

  @override
  String get quickConnectNotSupported =>
      'Quick Connect n\'est pas pris en charge sur ce serveur.';

  @override
  String get quickConnectAuthorizeFailed =>
      'Échec de l\'autorisation du code Quick Connect.';

  @override
  String get quickConnectDisabled =>
      'Quick Connect est désactivé sur ce serveur.';

  @override
  String get quickConnectForbidden =>
      'Votre compte ne peut pas autoriser cette requête Quick Connect.';

  @override
  String get quickConnectNotFound =>
      'Code Quick Connect introuvable. Essayez un nouveau code.';

  @override
  String quickConnectFailedWithMessage(String message) {
    return 'Échec de Quick Connect : $message';
  }

  @override
  String get quickConnectEnterCode => 'Saisir le code';

  @override
  String get quickConnectAuthorize => 'Autoriser';

  @override
  String remoteCommandFailed(String error) {
    return 'Échec de la commande : $error';
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
    return 'Échec du démarrage de la diffusion : $error';
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
  String get trackActionViewDetails => 'Voir les détails';

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
    return 'Téléchargement de $name…';
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
    return 'Ignorer $segment';
  }

  @override
  String get liveTv => 'TV en direct';

  @override
  String get continueWatchingAndNextUp => 'Continuer de regarder & À suivre';

  @override
  String downloadingBatchProgress(int current, int total, String fileName) {
    return 'Téléchargement de $current/$total — $fileName';
  }

  @override
  String downloadingFile(String fileName) {
    return 'Téléchargement de $fileName';
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
  String get playerTooltipMinimize => 'Réduire le lecteur';

  @override
  String get miniPlayerOpenPlayer => 'Ouvrir le lecteur';

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
  String get contextMenuHideFromContinueWatching =>
      'Masquer de « Continuer de regarder »';

  @override
  String get contextMenuHideFromNextUp => 'Masquer de « À suivre »';

  @override
  String get contextMenuAddToCollection => 'Ajouter à une collection';

  @override
  String get contextMenuRemoveFromCollection => 'Retirer de la collection';

  @override
  String removeFromCollectionConfirm(String item, String collection) {
    return 'Retirer $item de $collection ? L\'élément reste dans votre bibliothèque.';
  }

  @override
  String get removeFromCollectionFailed =>
      'Échec de la suppression de la collection';

  @override
  String get settingsAdministrationSubtitle =>
      'Accéder au panneau d\'administration du serveur';

  @override
  String get settingsDynamicContent => 'Contenu dynamique';

  @override
  String get settingsDynamicContentSubtitle =>
      'Barre média et superpositions visuelles';

  @override
  String get settingsAboutSubtitle =>
      'Version de l\'application, informations légales et crédits';

  @override
  String get settingsSortServersBy => 'Trier les serveurs par';

  @override
  String get settingsLastUsed => 'Dernière utilisation';

  @override
  String get settingsAlphabetical => 'Alphabétique';

  @override
  String get settingsAllowSelfSignedCerts =>
      'Autoriser les certificats auto-signés';

  @override
  String get settingsAllowSelfSignedCertsSubtitle =>
      'Faire confiance aux serveurs utilisant des certificats TLS auto-signés ou émis par une autorité privée. N\'activez cette option que pour les serveurs que vous contrôlez. Elle désactive la validation des certificats pour toutes les connexions.';

  @override
  String get untrustedServerCertificate =>
      'Le certificat de ce serveur n\'est pas approuvé. S\'il s\'agit de votre propre serveur et qu\'il utilise un certificat auto-signé ou privé, vous pouvez l\'autoriser ici.';

  @override
  String get clientCertTitle => 'Certificat client';

  @override
  String clientCertHost(String host) {
    return 'Certificat pour $host';
  }

  @override
  String get clientCertChooseFile => 'Choisir un fichier';

  @override
  String get clientCertPassword => 'Mot de passe du certificat';

  @override
  String get clientCertStartUpload => 'Envoyer depuis un téléphone';

  @override
  String get clientCertUploadHint =>
      'Scannez ce code avec votre téléphone, ou ouvrez l\'adresse dans son navigateur, puis choisissez le fichier et saisissez son mot de passe.';

  @override
  String get clientCertStopUpload => 'Arrêter l\'attente';

  @override
  String get clientCertNoFileData =>
      'Lecture du fichier impossible. Réessayez.';

  @override
  String get clientCertPickFailed =>
      'Ouverture du sélecteur de fichiers impossible.';

  @override
  String get clientCertUploadFailed =>
      'Ouverture de la page de téléversement impossible. Réessayez.';

  @override
  String get clientCertNoSecureStorage =>
      'Cet appareil n\'a pas de stockage sécurisé, le certificat ne peut donc pas être enregistré. Sous Linux, installez libsecret et réessayez.';

  @override
  String get clientCertDecodeFailed =>
      'Impossible de lire ce fichier comme un certificat. Vérifiez qu\'il s\'agit bien d\'un .p12 ou d\'un .pfx.';

  @override
  String get clientCertWrongPassword =>
      'Ce mot de passe ne déverrouille pas ce certificat.';

  @override
  String get clientCertRequired =>
      'Ce serveur exige un certificat client (mTLS). Ajoutez-en un pour cet hôte afin de continuer.';

  @override
  String clientCertExpired(String date) {
    return 'Le certificat de ce serveur a expiré le $date. Remplacez-le pour continuer.';
  }

  @override
  String get clientCertAddButton => 'Ajouter un certificat client';

  @override
  String get settingsClientCertificates => 'Certificats client';

  @override
  String get settingsClientCertificatesSubtitle =>
      'Certificats que cette application présente aux serveurs qui en exigent un (mTLS)';

  @override
  String get clientCertSubject => 'Sujet';

  @override
  String clientCertExpires(String date) {
    return 'Expire le $date';
  }

  @override
  String get clientCertReplace => 'Remplacer';

  @override
  String get clientCertAdd => 'Ajouter un certificat';

  @override
  String get clientCertAddHostPrompt =>
      'Quel hôte de serveur a besoin d\'un certificat ?';

  @override
  String get itemBlockedByParentalControls => 'Non disponible';

  @override
  String get blockedRatingsCeilingHint =>
      'Bloquer une classification bloque aussi tout ce qui est plus restrictif.';

  @override
  String get blockedRatingsUnrankedSection =>
      'Ne bloque que cette classification';

  @override
  String get settingsHomePage => 'Page d\'accueil';

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
  String get settingsShowLiveTvButtonInNavigation =>
      'Affiche le bouton TV en direct dans la barre de navigation si le serveur dispose d\'une bibliothèque TV en direct';

  @override
  String get settingsShowLibrariesButtonInNavigation =>
      'Afficher le bouton des bibliothèques dans la barre de navigation';

  @override
  String get settingsShowSeerrButtonInNavigation =>
      'Afficher le bouton Seerr dans la barre de navigation';

  @override
  String get settingsAlwaysExpandNavbarLabels =>
      'Toujours afficher les libellés dans la barre de navigation supérieure';

  @override
  String get settingsLibraryVisibilitySubtitle =>
      'Affichez ou masquez chaque bibliothèque sur la page d\'accueil. Redémarrez Moonfin pour appliquer les modifications.';

  @override
  String get settingsMediaBarAndLocalPreviews =>
      'Barre multimédia et aperçus locaux';

  @override
  String get settingsVisualOverlays => 'Superpositions visuelles';

  @override
  String get settingsSeasonalSurprise => 'Surprise saisonnière';

  @override
  String get useNativeEmulator => 'Émulation native';

  @override
  String get useNativeEmulatorSubtitle =>
      'Jouer avec des cores natifs au lieu du lecteur web EmulatorJS';

  @override
  String get emulatorCores => 'Cores d\'émulateur';

  @override
  String get emulatorCoresSubtitle =>
      'Télécharger des systèmes pour jouer nativement';

  @override
  String get emulatorCoresDescription =>
      'Choisir les systèmes à installer. Les cores sont fournis par le projet libretro et permettent d\'exécuter les jeux nativement plutôt que dans une vue navigateur.';

  @override
  String get emulatorCoreDownloading => 'Téléchargement…';

  @override
  String get emulatorCoreUnavailable => 'Non disponible sur cet appareil';

  @override
  String get emulatorCoreDownloadFailed =>
      'Impossible de télécharger le core. Vérifiez votre connexion et réessayez.';

  @override
  String emulatorCoreResetSettings(String system) {
    return 'Réinitialiser les paramètres $system aux valeurs par défaut';
  }

  @override
  String get emulatorCoreSettingsReset =>
      'Paramètres réinitialisés aux valeurs par défaut.';

  @override
  String get emulatorCoreResetSettingsFailed =>
      'Impossible de réinitialiser les paramètres. Vérifiez votre connexion et réessayez.';

  @override
  String get downloadedGames => 'Jeux téléchargés';

  @override
  String get downloadedGamesSubtitle =>
      'Libérer l\'espace utilisé par les fichiers de jeux';

  @override
  String get downloadedGamesDescription =>
      'Les jeux sont copiés sur cet appareil avant d\'être lancés. Supprimez ceux que vous avez terminés pour libérer de l\'espace. Les sauvegardes sont conservées sur le serveur et ne sont pas supprimées.';

  @override
  String get downloadedGamesEmpty =>
      'Aucun jeu n\'a encore été téléchargé sur cet appareil.';

  @override
  String downloadedGamesTotal(int count, String size) {
    return '$count jeux, $size';
  }

  @override
  String get removeAllDownloadedGames => 'Tout supprimer';

  @override
  String removeDownloadedGameConfirm(String title) {
    return 'Supprimer $title de cet appareil ? Le jeu sera de nouveau téléchargé lors de votre prochaine partie.';
  }

  @override
  String get removeAllDownloadedGamesConfirm =>
      'Supprimer tous les jeux téléchargés de cet appareil ? Ils seront de nouveau téléchargés lors de votre prochaine partie.';

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
  String get settingsJoinDiscord => 'Rejoignez Discord';

  @override
  String get settingsJoinDiscordSubtitle => 'Discutez avec la communauté';

  @override
  String get settingsJoinTheDiscord => 'Rejoignez le Discord';

  @override
  String get settingsSupportMoonfin => 'Soutenir Moonfin';

  @override
  String get settingsSupportMoonfinSubtitle => 'Offrez un café au développeur';

  @override
  String get settingsLegal => 'LÉGAL';

  @override
  String get settingsLicenses => 'Licences';

  @override
  String get settingsOpenSourceLicenseNotices => 'Avis de licence open source';

  @override
  String get settingsPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get settingsPrivacyPolicySubtitle =>
      'Comment Moonfin gère vos données';

  @override
  String get settingsCheckForUpdates => 'Vérifier les mises à jour';

  @override
  String get settingsCheckForUpdatesSubtitle =>
      'Recherchez la dernière version de Moonfin';

  @override
  String get settingsBoth => 'Les deux';

  @override
  String get settingsShuffleContentTypeFilter =>
      'Filtre de type de contenu aléatoire';

  @override
  String get settingsAudioPreferencesSubtitle =>
      'Pistes audio, options de traitement et de relais';

  @override
  String get settingsAutomationAndQueueSubtitle =>
      'Lecture et séquençage automatisés';

  @override
  String get settingsSyncplaySubtitle =>
      'Logique de synchronisation pour les sessions de groupe';

  @override
  String get settingsSkipIntrosAndOutros =>
      'Ignorer les intros et les outros ?';

  @override
  String settingsMediaSegmentTypeAction(String segment) {
    return 'Segments $segment';
  }

  @override
  String get settingsMediaSegmentCountdown => 'Compte à rebours des segments';

  @override
  String get settingsProgressBar => 'Barre de progression';

  @override
  String get settingsTimer => 'Minuteur';

  @override
  String get settingsNone => 'Aucun';

  @override
  String get settingsSkipButtonAutoHide =>
      'Masquer automatiquement le bouton Passer';

  @override
  String get settingsSkipButtonAutoHideDescription =>
      'Masque automatiquement le bouton « Passer l\'intro » ou « Passer le générique » après quelques secondes.';

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
      'Comment la vidéo doit être mise à l\'échelle pour s\'adapter à l\'écran. « Remplir l\'écran » agrandit l\'image jusqu\'à couvrir tout l\'écran, en rognant les bords. Ce mode ne détecte pas les bandes noires.';

  @override
  String get settingsPlaybackEngineAndroidTv =>
      'Moteur de lecture (Android TV)';

  @override
  String get settingsPlaybackEngineAndroidTvDescription =>
      'Choisissez le moteur de lecture par défaut sur les appareils Android TV. Les modifications s\'appliquent à la prochaine session de lecture.';

  @override
  String get settingsPlaybackEngineMedia3Recommended => 'Media3 (recommandé)';

  @override
  String get settingsPlaybackEngineMpvLegacy => 'mpv (ancien)';

  @override
  String get settingsRedetectDisplay => 'Redétecter l\'écran';

  @override
  String get settingsRedetectDisplayDescription =>
      'Redemande au téléviseur les formats HDR qu\'il gère. Utile si vos titres HDR sont transcodés après un allumage tardif du téléviseur ou de l\'ampli AV.';

  @override
  String get settingsDisplayIsSdr => 'Ma TV n\'est pas compatible HDR';

  @override
  String get settingsDisplayIsSdrDescription =>
      'Cesse d\'annoncer la prise en charge du HDR pour cet écran. À n\'utiliser que si la détection signale un HDR que votre TV ne sait pas afficher.';

  @override
  String settingsDisplayRedetected(String formats) {
    return 'Écran redétecté : $formats';
  }

  @override
  String get settingsDisplayNoHdrDetected => 'Aucun format HDR détecté';

  @override
  String get settingsDisplayMarkedSdr => 'Écran enregistré comme SDR';

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
  String get settingsAutoAftkrtEnabled => 'Auto';

  @override
  String get settingsEnabledOnThisDevice => 'Activé';

  @override
  String get settingsDisabledPreferTranscode => 'Désactivé';

  @override
  String get settingsResumeRewindDescription =>
      'Nombre de secondes à revenir en arrière à la reprise de la lecture (depuis « Continuer à regarder » ou la fiche d\'un média).';

  @override
  String get settingsUnpauseRewindDescription =>
      'Nombre de secondes à revenir en arrière après une pause.';

  @override
  String get settingsSkipBackLengthDescription =>
      'Nombre de secondes à revenir en arrière à chaque appui sur le bouton.';

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
      'Nombre de secondes à avancer à chaque appui sur le bouton.';

  @override
  String get settingsBitstreamAc3ToExternalDecoder =>
      'Bitstream AC3 vers décodeur externe';

  @override
  String get settingsCinemaMode => 'Mode cinéma';

  @override
  String get settingsCinemaModeSubtitle =>
      'Lire des bandes-annonces/prerolls avant un long métrage principal';

  @override
  String get settingsCinemaModeEpisodes => 'Mode cinéma pour les épisodes';

  @override
  String get settingsCinemaModeEpisodesSubtitle =>
      'Diffuser aussi les bandes-annonces avant les épisodes de série';

  @override
  String get settingsNextUpDisplayDescription =>
      'Étendu affiche la notification détaillée, avec le visuel et la description de l\'épisode. Minimal affiche une notification compacte avec compte à rebours. Désactivé masque entièrement la notification.';

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
  String get settingsLiveTvDirect => 'Lecture directe pour la TV en direct';

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
      'Activer les fonctionnalités de visionnage en groupe';

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
      'Ajuster automatiquement la lecture pour rester synchronisé';

  @override
  String get settingsSyncplaySpeedToSync => 'Vitesse de synchronisation';

  @override
  String get settingsSyncplaySpeedToSyncSubtitle =>
      'Utiliser le réglage de la vitesse de lecture pour synchroniser';

  @override
  String get settingsSyncplaySkipToSync => 'Saut pour synchroniser';

  @override
  String get settingsSyncplaySkipToSyncSubtitle =>
      'Utiliser le saut dans la lecture pour synchroniser';

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
    return '$libraryName, ajouts récents';
  }

  @override
  String recentlyReleasedLibraryName(String libraryName) {
    return '$libraryName, sorties récentes';
  }

  @override
  String get autoplayNextEpisode => 'Lecture automatique de l\'épisode suivant';

  @override
  String get autoplayNextEpisodeSubtitle =>
      'Lisez automatiquement l\'épisode suivant lorsqu\'il est disponible.';

  @override
  String get skipSilenceTitle => 'Ignorer les silences';

  @override
  String get skipSilenceSubtitle =>
      'Ignorez automatiquement les segments audio silencieux lorsqu\'ils sont pris en charge par le flux.';

  @override
  String get allowExternalAudioEffectsTitle =>
      'Autoriser les effets audio externes';

  @override
  String get allowExternalAudioEffectsSubtitle =>
      'Autorisez les applications d\'égalisation et d\'effets (par exemple Wavelet) à se connecter aux sessions de lecture Media3.';

  @override
  String get disableTunnelingTitle => 'Désactiver le tunneling';

  @override
  String get disableTunnelingSubtitle =>
      'Forcer la lecture sans tunnel. Utile sur les appareils avec des discontinuités audio/vidéo tunnel.';

  @override
  String get enableTunnelingTitle => 'Activer le tunnel vidéo';

  @override
  String get enableTunnelingSubtitle =>
      'Avancé. Achemine l’audio et la vidéo via un passage matériel couplé. Désactivé par défaut, car cela peut provoquer des coupures audio/vidéo sur certains appareils.';

  @override
  String get mapDolbyVisionP7Title =>
      'Toujours lire le profil Dolby Vision 7 en HDR10';

  @override
  String get mapDolbyVisionP7Subtitle =>
      'Ignore la conversion vers le profil 8 et convertit les flux Dolby Vision profil 7 en HEVC compatible HDR10. À utiliser si les flux convertis s\'affichent mal.';

  @override
  String get stripDolbyVisionHdr10PlusTitle =>
      'Play Dolby Vision with HDR10+ as HDR10+';

  @override
  String get stripDolbyVisionHdr10PlusSubtitle =>
      'Drop the Dolby Vision layer from videos that also have HDR10+. Turn this on if those videos play with sound but a black screen.';

  @override
  String get subtitlesUseEmbeddedStyles =>
      'Utiliser les styles intégrés aux sous-titres';

  @override
  String get subtitlesUseEmbeddedStylesSubtitle =>
      'Appliquer les couleurs, polices et positionnement intégrés à la piste de sous-titres. Désactiver pour utiliser plutôt vos préférences de style.';

  @override
  String get subtitlesUseEmbeddedFontSizes =>
      'Utiliser les tailles de police intégrées aux sous-titres';

  @override
  String get subtitlesUseEmbeddedFontSizesSubtitle =>
      'Appliquer les indications de taille de police intégrées à la piste de sous-titres. Désactiver pour utiliser la taille définie dans vos préférences de style.';

  @override
  String get showMediaDetailsOnLibraryPage => 'Afficher les détails du média';

  @override
  String get showMediaDetailsOnLibraryPageDescription =>
      'Afficher les détails de l\'élément sélectionné en haut des pages de la bibliothèque.';

  @override
  String get libraryCardTitles => 'Titles Under Posters';

  @override
  String get libraryCardTitlesDescription =>
      'Show each item\'s title and details below its artwork in library grids.';

  @override
  String get useDetailedSubHeadings => 'Informations détaillées sous le titre';

  @override
  String get useDetailedSubHeadingsDescription =>
      'Afficher des informations supplémentaire sous le titre, sur les pages de la bibliothèque.';

  @override
  String get savedThemesDeleteDialogTitle => 'Supprimer le thème enregistré ?';

  @override
  String savedThemesDeleteDialogMessage(String themeName) {
    return 'Supprimer \"$themeName\" du cache de cet appareil ?';
  }

  @override
  String get themeStore => 'Boutique de thèmes';

  @override
  String get themeStoreSubtitle =>
      'Parcourir et enregistrer les thèmes de la communauté';

  @override
  String get themeStoreDescription =>
      'Enregistrez un thème pour le retrouver parmi vos thèmes enregistrés.';

  @override
  String get themeStoreEmpty => 'Aucun thème n\'est disponible pour le moment.';

  @override
  String get themeStoreLoadFailed =>
      'Impossible de charger la boutique de thèmes. Vérifiez votre connexion et réessayez.';

  @override
  String get themeStoreSave => 'Enregistrer';

  @override
  String get themeStoreSaveAndApply => 'Enregistrer et appliquer';

  @override
  String get themeStoreSaved => 'Enregistré';

  @override
  String get themeStoreInvalidMessage => 'Le thème n\'a pas pu être chargé.';

  @override
  String themeStoreSavedMessage(String themeName) {
    return '$themeName sauvegardé.';
  }

  @override
  String savedThemesDeletedMessage(String themeName) {
    return '\"$themeName\" supprimé de cet appareil.';
  }

  @override
  String savedThemesDeleteFailedMessage(String themeName) {
    return 'Impossible de supprimer \"$themeName\".';
  }

  @override
  String get savedThemesTitle => 'Thèmes enregistrés';

  @override
  String get savedThemesDescription =>
      'Ce sont des thèmes téléchargés depuis le plugin Moonfin pour le serveur actuel. La suppression supprime uniquement cette copie locale.';

  @override
  String get savedThemesEmpty =>
      'Aucun thème enregistré n\'a été trouvé pour ce serveur.';

  @override
  String savedThemesCurrentThemeId(String themeId) {
    return '$themeId • Actuellement actif';
  }

  @override
  String get savedThemesDeleteTooltip => 'Supprimer le thème enregistré';

  @override
  String get savedThemesManageSubtitle =>
      'Gérer les thèmes de plugin téléchargés sur cet appareil';

  @override
  String get themeEditor => 'Éditeur de thème';

  @override
  String get themeEditorSubtitle =>
      'Ouvrez l\'éditeur de thème Moonfin dans votre navigateur';

  @override
  String get homeScreen => 'Écran d\'accueil';

  @override
  String get bottomBar => 'Barre inférieure';

  @override
  String get homeRowsStyleClassic => 'Classique';

  @override
  String get homeRowsStyleModern => 'Moderne';

  @override
  String get homeRowsSection => 'Rangées d\'accueil';

  @override
  String get rowsType => 'Type de rangée';

  @override
  String get rowsTypeDescription =>
      'Classique conserve la disposition classique en portrait. Moderne passe du portrait à la vignette au survol.';

  @override
  String get modernCardsOnMyMediaRow =>
      'Visuels modernes dans la rangée Mes médias';

  @override
  String get modernCardsOnMyMediaRowDescription =>
      'Affiche des affiches personnalisables qui s\'agrandissent à la sélection. Désactivez pour toujours afficher la miniature au format paysage.';

  @override
  String get sortOrder => 'Ordre de tri';

  @override
  String get ascending => 'Croissant';

  @override
  String get descending => 'Décroissant';

  @override
  String get displayFavoritesRows => 'Afficher les rangées de favoris';

  @override
  String get displayFavoritesRowsSubtitle =>
      'Afficher les films, séries et autres rangées préférées dans les sections d\'accueil.';

  @override
  String get favoritesRowSorting => 'Tri des rangées de favoris';

  @override
  String get favoritesRowSortingDescription =>
      'Triez les rangées de favoris par date d\'ajout, date de sortie, par ordre alphabétique, etc.';

  @override
  String get favoritesRowSortOrderDescription =>
      'Trie les rangées de favoris par ordre croissant ou décroissant.';

  @override
  String get displayCollectionsRows => 'Afficher les rangées de collections';

  @override
  String get displayCollectionsRowsSubtitle =>
      'Afficher les rangées de collections dans les sections d\'accueil.';

  @override
  String get collectionsRowSorting => 'Tri des rangées de collections';

  @override
  String get collectionsRowSortingDescription =>
      'Triez les rangées de collections par date d\'ajout, date de sortie, par ordre alphabétique, etc.';

  @override
  String get collectionsRowSortOrderDescription =>
      'Trie les rangées de collections par ordre croissant ou décroissant.';

  @override
  String get collectionsRowShowEpisodes =>
      'Afficher les épisodes individuellement';

  @override
  String get collectionsRowShowEpisodesSubtitle =>
      'Affiche chaque épisode séparément plutôt que la série entière.';

  @override
  String get displayGenresRows => 'Afficher les rangées de genres';

  @override
  String get displayGenresRowsSubtitle =>
      'Afficher les rangées de genres dans les sections d\'accueil.';

  @override
  String get genresRowSorting => 'Tri des rangées par genre';

  @override
  String get genresRowSortingDescription =>
      'Triez les rangées de genres par date d\'ajout, date de sortie, par ordre alphabétique, etc.';

  @override
  String get genresRowSortOrderDescription =>
      'Trie les rangées de genres par ordre croissant ou décroissant.';

  @override
  String get genresRowItems => 'Éléments de rangée de genres';

  @override
  String get genresRowItemsDescription =>
      'Afficher des films, des séries ou les deux dans les rangées de genres.';

  @override
  String get displayStudiosRows => 'Afficher la rangée des studios';

  @override
  String get displayStudiosRowsSubtitle =>
      'Afficher la rangée des studios dans les sections d\'accueil.';

  @override
  String get studiosRowSorting => 'Tri de la rangée des studios';

  @override
  String get studiosRowSortingDescription =>
      'Trie la rangée des studios par nom, ajout récent, et plus encore.';

  @override
  String get studiosRowSortOrderDescription =>
      'Choisir l\'ordre de tri croissant ou décroissant.';

  @override
  String get selectStudiosToInclude => 'Sélectionner les studios à inclure';

  @override
  String get selectStudiosToIncludeDescription =>
      'Choisir les studios à afficher dans la rangée d\'accueil.';

  @override
  String get selectAllStudios => 'Tout sélectionner';

  @override
  String get deselectAllStudios => 'Tout désélectionner';

  @override
  String get tvStudiosFilter => 'Studios TV';

  @override
  String get movieStudiosFilter => 'Studios de cinéma';

  @override
  String get selectedStudiosFilter => 'Studios sélectionnés';

  @override
  String get unselectedStudiosFilter => 'Studios non sélectionnés';

  @override
  String get filtersHeader => 'Filtres';

  @override
  String get showHeader => 'Afficher';

  @override
  String get displayPlaylistsRows => 'Afficher les rangées de playlists';

  @override
  String get displayPlaylistsRowsSubtitle =>
      'Afficher les rangées de playlists dans les sections de l\'accueil.';

  @override
  String get playlistsRowSorting => 'Tri des rangées de playlists';

  @override
  String get playlistsRowSortingDescription =>
      'Triez les rangées de playlists par date d\'ajout, date de sortie, ordre alphabétique, et plus encore.';

  @override
  String get playlistsRowSortOrderDescription =>
      'Trie les rangées de playlists par ordre croissant ou décroissant.';

  @override
  String get playlistsRowShowEpisodes =>
      'Afficher les épisodes individuellement';

  @override
  String get playlistsRowShowEpisodesSubtitle =>
      'Affiche chaque épisode séparément plutôt que la série entière.';

  @override
  String get displayAudioRows => 'Afficher les rangées audio';

  @override
  String get displayAudioRowsSubtitle =>
      'Afficher les rangées audio dans les sections de l\'accueil.';

  @override
  String get audioRowsSorting => 'Tri des rangées audio';

  @override
  String get audioRowsSortingDescription =>
      'Triez les rangées audio par date d\'ajout, date de sortie, par ordre alphabétique, etc.';

  @override
  String get audioRowsSortOrderDescription =>
      'Trie les rangées audio par ordre croissant ou décroissant.';

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
  String get audioPlaylists => 'Playlists audio';

  @override
  String get appearance => 'Apparence';

  @override
  String get layout => 'Mise en page';

  @override
  String get theme => 'Thème';

  @override
  String get keyboard => 'Clavier';

  @override
  String get navButtons => 'Boutons';

  @override
  String get rendering => 'Rendu';

  @override
  String get mpvConfiguration => 'Configuration mpv';

  @override
  String get cardSize => 'Taille des visuels';

  @override
  String get externalPlayerApp => 'Application de lecteur externe';

  @override
  String get externalPlayerAppDescription =>
      'Définir un lecteur externe pour activer l\'option de lecture par appui long';

  @override
  String get externalPlayerAskEachTimeSubtitle =>
      'Afficher le sélecteur d\'application lorsque la lecture démarre.';

  @override
  String get loadingInstalledPlayers => 'Chargement des lecteurs installés…';

  @override
  String get connection => 'Connexion';

  @override
  String get locallyDecodedCodecs => 'Codecs décodés localement';

  @override
  String get transcodeTargetCodecs => 'Codecs cibles du transcodage';

  @override
  String get passthrough => 'Passage';

  @override
  String get supportedOnThisDevice => 'Pris en charge sur cet appareil';

  @override
  String get notSupportedOnThisDevice => 'Non pris en charge sur cet appareil';

  @override
  String get mediaPlayerBehavior => 'Comportement du lecteur';

  @override
  String get playbackEnhancements => 'Améliorations de la lecture';

  @override
  String get alwaysOn => 'Toujours allumé.';

  @override
  String get replaceSkipOutroWithNextUpDisplay =>
      '« Prochain épisode » au lieu du générique';

  @override
  String get replaceSkipOutroWithNextUpDisplaySubtitle =>
      'Afficher la notification du prochain épisode au lieu du bouton « Ignorer le générique ».';

  @override
  String get playerRouting => 'Routage du lecteur';

  @override
  String get preferSoftwareDecoders => 'Préférer les décodeurs logiciels';

  @override
  String get preferSoftwareDecodersSubtitle =>
      'Utilisez FFmpeg (audio) et libgav1 (AV1) avant les décodeurs matériels. Désactivez-le si le passage audio HDMI est interrompu.';

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
  String get useExternalPlayer => 'Toujours utiliser un lecteur externe';

  @override
  String get useExternalPlayerSubtitle =>
      'Ouvrez la lecture vidéo dans votre application externe sélectionnée sur Android TV.';

  @override
  String get externalPlayerLiveTvOnly => 'Live TV Only';

  @override
  String get externalPlayerLiveTvOnlySubtitle =>
      'Use the external player for Live TV and keep everything else in the built-in player.';

  @override
  String get automaticQueuing => 'File d\'attente automatique';

  @override
  String get preferSdhSubtitles => 'Préférer les sous-titres SME';

  @override
  String get preferSdhSubtitlesSubtitle =>
      'Donnez la priorité aux pistes de sous-titres SME/CC lors de la sélection automatique.';

  @override
  String get preferTextSubtitles => 'Préférer les sous-titres au format texte';

  @override
  String get preferTextSubtitlesSubtitle =>
      'Donnez la priorité aux sous-titres au format texte (SRT, VTT) plutôt qu\'aux formats image (PGS, VobSub).';

  @override
  String get preferExternalSubtitles => 'Préférer les sous-titres externes';

  @override
  String get preferExternalSubtitlesSubtitle =>
      'Donnez la priorité aux fichiers de sous-titres externes plutôt qu\'aux pistes intégrées.';

  @override
  String get webDiagnostics => 'Diagnostic Web';

  @override
  String get webDiagnosticsTitle => 'Moonfin Diagnostic Web';

  @override
  String get webDiagnosticsIntro =>
      'Utilisez cette page pour diagnostiquer les problèmes de connectivité du navigateur (CORS, contenu mixte et paramètres de découverte).';

  @override
  String get webDiagnosticsDetectedMixedContentFailure =>
      'Échec de contenu mixte détecté';

  @override
  String get webDiagnosticsDetectedCorsPreflightFailure =>
      'Échec CORS/Preflight détecté';

  @override
  String get webDiagnosticsMixedContentFailureBody =>
      'Moonfin a détecté une page HTTPS essayant d\'appeler une URL de serveur HTTP. Les navigateurs bloquent cette demande avant qu\'elle n\'atteigne votre serveur.';

  @override
  String get webDiagnosticsCorsFailureBody =>
      'Moonfin a détecté un échec de requête au niveau du navigateur, généralement provoqué par l\'absence d\'en-têtes CORS ou de contrôle en amont sur le serveur multimédia.';

  @override
  String webDiagnosticsTargetUrl(String url) {
    return 'URL cible : $url';
  }

  @override
  String webDiagnosticsDetail(String detail) {
    return 'Détail : $detail';
  }

  @override
  String get webDiagnosticsCurrentRuntimeContext =>
      'Contexte d\'exécution actuel';

  @override
  String get webDiagnosticsOrigin => 'Origine';

  @override
  String get webDiagnosticsScheme => 'Schème';

  @override
  String get webDiagnosticsPluginMode => 'Mode plugin';

  @override
  String get webDiagnosticsWebRtcScan => 'Analyse WebRTC';

  @override
  String get webDiagnosticsForcedServerUrl => 'URL du serveur forcé';

  @override
  String get webDiagnosticsDefaultServerUrl => 'URL du serveur par défaut';

  @override
  String get webDiagnosticsDiscoveryProxyUrl => 'URL du proxy de découverte';

  @override
  String get notConfigured => 'non configuré';

  @override
  String get webDiagnosticsMixedContent => 'Contenu mixte';

  @override
  String get webDiagnosticsMixedContentDetected =>
      'Cette page est chargée via HTTPS, mais une ou plusieurs URL configurées sont HTTP. Les navigateurs empêchent les pages HTTPS d\'appeler les API HTTP.';

  @override
  String get webDiagnosticsMixedContentFix =>
      'Correctif : servez votre serveur multimédia ou point de terminaison proxy via HTTPS, ou chargez Moonfin via HTTP sur les réseaux locaux de confiance uniquement.';

  @override
  String get webDiagnosticsNoMixedContentDetected =>
      'Aucune configuration de contenu mixte évidente détectée à partir des paramètres d\'exécution actuels.';

  @override
  String get webDiagnosticsCorsChecklist => 'Liste de contrôle CORS';

  @override
  String get webDiagnosticsCorsChecklistItem1 =>
      '• Autorisez l\'origine du navigateur dans Access-Control-Allow-Origin.';

  @override
  String get webDiagnosticsCorsChecklistItem2 =>
      '• Incluez l\'autorisation, X-Emby-Authorization et X-Emby-Token dans Access-Control-Allow-Headers.';

  @override
  String get webDiagnosticsCorsChecklistItem3 =>
      '• Exposez Content-Range et Accept-Ranges pour le comportement de diffusion en continu et de recherche.';

  @override
  String get webDiagnosticsCorsChecklistItem4 =>
      '• Retourner 204 aux demandes de contrôle en amont OPTIONS.';

  @override
  String get webDiagnosticsHeaderSnippetTitle =>
      'Exemple d\'extrait d\'en-tête (style nginx)';

  @override
  String get note => 'Note';

  @override
  String get webDiagnosticsNonWebNote =>
      'Cette route de diagnostic est destinée aux builds Web. Si vous voyez cela sur une autre plateforme, ces vérifications peuvent ne pas s\'appliquer.';

  @override
  String get backToServerSelect => 'Retour au serveur Sélectionner';

  @override
  String get signOutAllUsers => 'Déconnecter tous les utilisateurs';

  @override
  String get voiceSearchPermissionPermanentlyDenied =>
      'L\'autorisation du microphone est définitivement refusée. Activez-le dans les paramètres système.';

  @override
  String get voiceSearchPermissionRequired =>
      'L\'autorisation du microphone est requise pour la recherche vocale.';

  @override
  String get voiceSearchNoMatch =>
      'Je n\'ai pas compris ça. Essayer à nouveau.';

  @override
  String get voiceSearchNoSpeechDetected => 'Aucune parole détectée.';

  @override
  String get voiceSearchMicrophoneError => 'Erreur de microphone.';

  @override
  String get voiceSearchNeedsInternet =>
      'La recherche vocale nécessite Internet.';

  @override
  String get voiceSearchServiceBusy =>
      'Le service vocal est occupé. Essayer à nouveau.';

  @override
  String get microphonePermissionPermanentlyDenied =>
      'L\'autorisation du microphone est définitivement refusée.';

  @override
  String get microphonePermissionDenied =>
      'L\'autorisation du microphone est refusée.';

  @override
  String get speechRecognitionUnavailable =>
      'La reconnaissance vocale n\'est pas disponible sur cet appareil.';

  @override
  String get openIosRoutePicker => 'Ouvrir le sélecteur d\'itinéraire iOS';

  @override
  String get airPlayRoutePickerUnavailable =>
      'AirPlay le sélecteur d\'itinéraire n\'est pas disponible sur cet appareil.';

  @override
  String get videos => 'Vidéos';

  @override
  String get programs => 'Programmes';

  @override
  String get songs => 'Chansons';

  @override
  String get photoAlbums => 'Albums photos';

  @override
  String get photos => 'Photos';

  @override
  String get people => 'Personnes';

  @override
  String get recentlyReleasedEpisodes => 'Épisodes récemment sortis';

  @override
  String get watchAgain => 'Regarder à nouveau';

  @override
  String get guestAppearances => 'Apparitions d\'invités';

  @override
  String get appearancesSeerr => 'Apparitions (Seerr)';

  @override
  String get crewContributionsSeerr => 'Contributions techniques (Seerr)';

  @override
  String get personWebsite => 'Official website';

  @override
  String get watchWithGroup => 'Regarder en groupe';

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
  String get disk => 'Disque';

  @override
  String get openInBrowser => 'Ouvrir dans le navigateur';

  @override
  String get achievementBadges => 'Succès';

  @override
  String get achievementBadgesSubtitle =>
      'Succès, rangs et quêtes obtenus grâce à ce que vous regardez';

  @override
  String get achievementsBadges => 'Liste des succès';

  @override
  String achievementsBadgeCount(int unlocked, int total) {
    return '$unlocked succès sur $total';
  }

  @override
  String get achievementsUnlockToasts => 'Notifications de succès';

  @override
  String get achievementsUnlockToastsSubtitle =>
      'Affiche une notification lorsque vous débloquez un succès';

  @override
  String get achievementsUnlockedNotification => 'Succès débloqué';

  @override
  String achievementsUnlockedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count succès débloqués',
      one: '$count succès débloqué',
    );
    return '$_temp0';
  }

  @override
  String achievementsUnlockedMore(int count) {
    return '+$count autres';
  }

  @override
  String get achievementsQuests => 'Quêtes';

  @override
  String achievementsQuestCount(int count) {
    return 'Quêtes terminées : $count';
  }

  @override
  String get achievementsLeaderboard => 'Classement';

  @override
  String get achievementsLeaderboardSubtitle =>
      'Votre position par rapport aux autres utilisateurs de ce serveur';

  @override
  String get achievementsRecap => 'Récap';

  @override
  String get achievementsRecapSubtitle => 'Ce que vous avez regardé récemment';

  @override
  String get achievementsLibraryCompletion => 'Avancement des bibliothèques';

  @override
  String achievementsLibraryCount(int count) {
    return 'Bibliothèques : $count';
  }

  @override
  String achievementsScore(int score) {
    return '$score points';
  }

  @override
  String get achievementsScoreLabel => 'Score';

  @override
  String get achievementsTopRank => 'Rang maximal atteint';

  @override
  String achievementsPointsToNextRank(int points, String tier) {
    return '$points points avant $tier';
  }

  @override
  String achievementsCurrentStreak(int days) {
    return 'Série de $days jours';
  }

  @override
  String achievementsBestStreak(int days) {
    return 'Record : $days jours';
  }

  @override
  String get achievementsShowcase => 'Vitrine';

  @override
  String get achievementsUnlocked => 'Débloqués';

  @override
  String get achievementsLocked => 'Verrouillé';

  @override
  String get achievementsNothingHere => 'Rien ici pour le moment.';

  @override
  String get achievementsHiddenBadge => 'Succès caché';

  @override
  String achievementsUnlockedOn(String date) {
    return 'Débloqué le $date';
  }

  @override
  String achievementsPoints(int points) {
    return '$points pts';
  }

  @override
  String get achievementsDailyQuests => 'Quotidien';

  @override
  String get achievementsWeeklyQuests => 'Hebdomadaire';

  @override
  String achievementsQuestReward(int points) {
    return '+$points';
  }

  @override
  String get achievementsRerollDaily => 'Relancer les quêtes quotidiennes';

  @override
  String get achievementsRerollWeekly => 'Relancer les quêtes hebdomadaires';

  @override
  String get achievementsRerollOffer => 'Échanger cet ensemble contre un autre';

  @override
  String get achievementsRerollSpentDaily =>
      'Utilisé aujourd\'hui, revient à minuit UTC';

  @override
  String get achievementsRerollSpentWeekly =>
      'Utilisé cette semaine, revient lundi UTC';

  @override
  String get achievementsRerollConfirm => 'Relancer ces quêtes ?';

  @override
  String get achievementsRerollConfirmBody =>
      'Vous disposez d\'une relance quotidienne et d\'une relance hebdomadaire, et cette action l\'utilise.';

  @override
  String get achievementsRerollFailed => 'Impossible de relancer ces quêtes.';

  @override
  String get achievementsSuggested => 'Titres suggérés à regarder';

  @override
  String get achievementsNoSuggestions => 'Rien à suggérer pour ce succès.';

  @override
  String get achievementsProgressLabel => 'Progression';

  @override
  String get achievementsLoadout => 'Équipement';

  @override
  String get achievementsLoadoutSubtitle =>
      'Le score à dépenser et les bonus en votre possession';

  @override
  String get achievementsAppearance => 'Apparence';

  @override
  String get achievementsAppearanceSubtitle =>
      'L\'avatar et le titre de votre profil';

  @override
  String get achievementsAvatars => 'Avatars';

  @override
  String get achievementsTitles => 'Titres';

  @override
  String get achievementsEquipped => 'Équipé';

  @override
  String get achievementsOwned => 'Possédé';

  @override
  String achievementsEarnedAt(int score) {
    return 'Débloqué à $score points de score cumulé';
  }

  @override
  String get achievementsAppearanceEmpty =>
      'Ce serveur ne propose aucun avatar ni titre à porter.';

  @override
  String get achievementsAppearanceFailed =>
      'Impossible de modifier l\'apparence du profil.';

  @override
  String get achievementsPowerUps => 'Bonus';

  @override
  String get achievementsStats => 'Statistiques';

  @override
  String get achievementsStatsSubtitle => 'Vos records et l\'état du serveur';

  @override
  String get achievementsStatsWatched => 'Vu';

  @override
  String get achievementsStatsBests => 'Records';

  @override
  String get achievementsStatsHabits => 'Habitudes';

  @override
  String get achievementsStatsVariety => 'Diversité';

  @override
  String get achievementsStatsServer => 'Ce serveur';

  @override
  String get achievementsStatsClock => 'Quand vous regardez';

  @override
  String get achievementsStatItems => 'Éléments visionnés';

  @override
  String get achievementsStatMovies => 'Films visionnés';

  @override
  String get achievementsStatSeries => 'Séries terminées';

  @override
  String get achievementsStatHours => 'Heures visionnées';

  @override
  String get achievementsStatDays => 'Jours visionnés';

  @override
  String get achievementsStatRewatches => 'Revisionnages';

  @override
  String get achievementsStatBestWatchStreak => 'Meilleure série de visionnage';

  @override
  String get achievementsStatBestLoginStreak => 'Meilleure série de connexions';

  @override
  String get achievementsStatMostEpisodes =>
      'Le plus d\'épisodes en une journée';

  @override
  String get achievementsStatMostMovies => 'Le plus de films en une journée';

  @override
  String get achievementsStatLongestItem => 'Élément le plus long';

  @override
  String get achievementsStatBestCombo => 'Meilleur combo';

  @override
  String get achievementsStatLateNight => 'Sessions nocturnes';

  @override
  String get achievementsStatEarlyMorning => 'Sessions matinales';

  @override
  String get achievementsStatWeekend => 'Sessions du week-end';

  @override
  String get achievementsStatDaysSignedIn => 'Jours connectés';

  @override
  String get achievementsStatLibraries => 'Bibliothèques visitées';

  @override
  String get achievementsStatGenres => 'Genres visionnés';

  @override
  String get achievementsStatDecades => 'Décennies visionnées';

  @override
  String get achievementsStatCountries => 'Pays visionnés';

  @override
  String get achievementsStatLanguages => 'Langues visionnées';

  @override
  String get achievementsStatUsers => 'Utilisateurs';

  @override
  String get achievementsStatBadgesUnlocked => 'Succès débloqués';

  @override
  String get achievementsStatScoreEarned => 'Score gagné';

  @override
  String get achievementsStatCommonBadge => 'Succès le plus courant';

  @override
  String get achievementsActivity => 'Activité';

  @override
  String get achievementsActivitySubtitle =>
      'Ce que le serveur a débloqué récemment';

  @override
  String achievementsActivityUnlocked(String user, String badge) {
    return '$user a débloqué $badge';
  }

  @override
  String get achievementsShop => 'Boutique';

  @override
  String get achievementsShopSubtitle => 'Dépenser du score pour plus de bonus';

  @override
  String achievementsShopPack(String name, int count) {
    return '$name ×$count';
  }

  @override
  String get achievementsShopEmpty => 'Rien à vendre pour le moment.';

  @override
  String get achievementsBuyConfirm => 'Acheter ceci ?';

  @override
  String get achievementsBuyConfirmBody =>
      'Le montant est prélevé directement sur votre réserve de score.';

  @override
  String get achievementsBuyFailed => 'Impossible d\'acheter cet article.';

  @override
  String get achievementsScoreBank => 'Réserve de score';

  @override
  String get achievementsBoost => 'Boost d\'XP';

  @override
  String get achievementsBoostBody =>
      'Double le score pendant une heure. Une nouvelle utilisation relance le décompte.';

  @override
  String get achievementsDoubleCredit => 'Crédit double';

  @override
  String get achievementsDoubleCreditBody =>
      'Le prochain élément terminé compte double pour les succès.';

  @override
  String get achievementsStreakFreeze => 'Gel de série';

  @override
  String get achievementsStreakFreezeBody =>
      'Couvre un jour manqué. Un seul peut être mis en réserve.';

  @override
  String achievementsPowerUpHeld(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count en stock',
      one: '$count en stock',
    );
    return '$_temp0';
  }

  @override
  String get achievementsPowerUpActive => 'En cours';

  @override
  String get achievementsUsePowerUp => 'Utiliser ce bonus ?';

  @override
  String get achievementsUsePowerUpBody =>
      'Il est dépensé dès que vous confirmez.';

  @override
  String get achievementsPowerUpFailed => 'Impossible d\'utiliser ce bonus.';

  @override
  String get achievementsHours => 'Heures';

  @override
  String get achievementsStreak => 'Série';

  @override
  String get achievementsPeriodWeek => 'Semaine';

  @override
  String get achievementsPeriodMonth => 'Mois';

  @override
  String get achievementsPeriodYear => 'Année';

  @override
  String achievementsDaysWatched(int count) {
    return 'Jours regardés : $count';
  }

  @override
  String achievementsBadgesEarned(int count) {
    return 'Succès obtenus : $count';
  }

  @override
  String get achievementsTopDirectors => 'Réalisateurs les plus vus';

  @override
  String get achievementsTopActors => 'Acteurs les plus vus';

  @override
  String get achievementsLoadFailed => 'Impossible de charger vos succès.';

  @override
  String get friends => 'Amis';

  @override
  String get friendsSubtitle =>
      'Voyez qui est en ligne et discutez avec des personnes de ce serveur';

  @override
  String get friendsShowButton => 'Afficher le bouton Amis';

  @override
  String get friendsShowButtonSubtitle =>
      'Amis et messagerie du plugin Achievement Badges';

  @override
  String get friendsMessages => 'Messages';

  @override
  String friendsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages non lus',
      one: '$count message non lu',
    );
    return '$_temp0';
  }

  @override
  String get friendsRequests => 'Demandes d\'amis';

  @override
  String friendsRequestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count demandes en attente',
      one: '$count demande en attente',
    );
    return '$_temp0';
  }

  @override
  String get friendsAdd => 'Ajouter des amis';

  @override
  String get friendsAddSubtitle => 'Trouver des personnes sur ce serveur';

  @override
  String get friendsPrivacy => 'Confidentialité';

  @override
  String get friendsPrivacySubtitle => 'Ce que vos amis peuvent voir';

  @override
  String get friendsOnline => 'En ligne';

  @override
  String get friendsOffline => 'Hors ligne';

  @override
  String get friendsNone =>
      'Aucun ami pour l\'instant. Ajoutez des personnes depuis ce serveur pour les voir ici.';

  @override
  String friendsWatching(String title) {
    return 'Regarde $title';
  }

  @override
  String friendsLastWatched(String title) {
    return 'Dernier visionnage : $title';
  }

  @override
  String friendsLastSeen(String time) {
    return 'Dernière connexion : $time';
  }

  @override
  String get friendsLoadFailed =>
      'Impossible de charger ce contenu. Vérifiez votre connexion et réessayez.';

  @override
  String get friendsActionFailed =>
      'Cette action a échoué. Réessayez dans un instant.';

  @override
  String get friendsIncoming => 'En attente de votre réponse';

  @override
  String get friendsOutgoing => 'Envoyées par vous';

  @override
  String get friendsNoRequests => 'Aucune demande d\'ami.';

  @override
  String get friendsAccept => 'Accepter';

  @override
  String get friendsDecline => 'Refuser';

  @override
  String get friendsCancelRequest => 'Annuler la demande';

  @override
  String friendsRequestFrom(String name) {
    return 'Demande d\'ami de $name';
  }

  @override
  String friendsCancelRequestBody(String name) {
    return 'Annuler la demande envoyée à $name ?';
  }

  @override
  String get friendsSearchHint => 'Rechercher des personnes';

  @override
  String get friendsNoMatches => 'Personne ne correspond à ce nom.';

  @override
  String friendsRequestSent(String name) {
    return 'Demande envoyée à $name';
  }

  @override
  String get friendsSendRequest => 'Ajouter comme ami';

  @override
  String get friendsSendMessage => 'Envoyer un message';

  @override
  String friendsOpenItem(String title) {
    return 'Ouvrir $title';
  }

  @override
  String get friendsRemove => 'Retirer l\'ami';

  @override
  String friendsRemoveBody(String name) {
    return 'Retirer $name de vos amis ? Vous pourrez l\'ajouter de nouveau plus tard.';
  }

  @override
  String get friendsBlock => 'Bloquer';

  @override
  String get friendsUnblock => 'Débloquer';

  @override
  String friendsBlockBody(String name) {
    return 'Bloquer $name ? Vous ne pourrez plus vous envoyer de messages directs l\'un à l\'autre. Les groupes que vous partagez restent ouverts.';
  }

  @override
  String friendsUnblockBody(String name) {
    return 'Débloquer $name ?';
  }

  @override
  String get friendsBlocked => 'Utilisateurs bloqués';

  @override
  String friendsProfileHidden(String name) {
    return '$name garde son profil privé.';
  }

  @override
  String get friendsAppearOffline => 'Apparaître hors ligne';

  @override
  String get friendsAppearOfflineSubtitle =>
      'Vos amis vous voient toujours comme hors ligne';

  @override
  String get friendsHideNowPlaying => 'Masquer ce que je regarde';

  @override
  String get friendsHideNowPlayingSubtitle =>
      'Vos amis vous voient toujours en ligne, mais pas ce que vous regardez';

  @override
  String get friendsHideLastWatched =>
      'Masquer ce que j\'ai regardé en dernier';

  @override
  String get friendsHideLastWatchedSubtitle =>
      'Vos amis ne verront pas ce que vous avez regardé en dernier lorsque vous êtes hors ligne';

  @override
  String get friendsMessageNotifications => 'Notifications de messages';

  @override
  String get friendsMessageNotificationsSubtitle =>
      'Affiche une bannière lorsqu\'un ami vous envoie un message';

  @override
  String get friendsMuteDuringPlayback => 'Couper pendant la lecture';

  @override
  String get friendsMuteDuringPlaybackSubtitle =>
      'Aucune bannière de message pendant la lecture d\'une vidéo ou d\'un jeu';

  @override
  String get friendsSaveFailed => 'Impossible d\'enregistrer vos paramètres.';

  @override
  String get chatNew => 'Nouveau message';

  @override
  String get chatNewSubtitle => 'Démarre une discussion avec un ami';

  @override
  String get chatNewGroup => 'Nouveau groupe';

  @override
  String get chatNewGroupSubtitle => 'Discute avec plusieurs amis à la fois';

  @override
  String get chatNone => 'Aucun message pour le moment.';

  @override
  String get chatYou => 'Vous';

  @override
  String chatYouSaid(String text) {
    return 'Vous : $text';
  }

  @override
  String get chatPhoto => 'Photo';

  @override
  String get chatEmoji => 'Émoji';

  @override
  String get chatEmojiSearch => 'Rechercher un émoji';

  @override
  String get chatNoRecentEmoji => 'Aucun emoji récent';

  @override
  String get chatViewPhoto => 'Voir la photo';

  @override
  String get chatHint => 'Écrivez un message';

  @override
  String get chatAttach => 'Envoyer une photo';

  @override
  String get chatEdited => 'modifié';

  @override
  String get chatSeen => 'Vu';

  @override
  String get chatSent => 'Envoyé';

  @override
  String get chatEditing => 'Modification du message';

  @override
  String get chatMessageOptions => 'Options du message';

  @override
  String get chatDeleteBody => 'Supprimer ce message pour tout le monde ?';

  @override
  String get chatClear => 'Effacer la conversation';

  @override
  String get chatClearBody =>
      'Supprimer tous les messages de cette conversation pour tout le monde ?';

  @override
  String get chatGroupInfo => 'Infos du groupe';

  @override
  String get chatGroupName => 'Nom du groupe';

  @override
  String chatMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count membres',
      one: '$count membre',
    );
    return '$_temp0';
  }

  @override
  String get chatOwner => 'Propriétaire';

  @override
  String get chatAdmin => 'Admin';

  @override
  String get chatMakeAdmin => 'Nommer admin';

  @override
  String get chatRemoveAdmin => 'Retirer des admins';

  @override
  String get chatRemoveMember => 'Retirer du groupe';

  @override
  String get chatAddMember => 'Ajouter des personnes';

  @override
  String get chatNobodyToAdd => 'Plus personne à ajouter.';

  @override
  String get chatLeave => 'Quitter le groupe';

  @override
  String get chatLeaveBody =>
      'Quitter ce groupe ? Quelqu\'un devra vous ajouter de nouveau pour que vous puissiez le rejoindre.';

  @override
  String get chatCreate => 'Créer un groupe';

  @override
  String get chatPickMembers => 'Choisissez au moins deux amis';

  @override
  String chatNewMessageFrom(String name) {
    return 'Nouveau message de $name';
  }

  @override
  String get chatImageTooLarge => 'Cette image dépasse 8 Mo.';

  @override
  String get chatImageUnsupported =>
      'Seules les images PNG, JPEG, GIF et WebP peuvent être envoyées.';

  @override
  String get embeddedBrowserNotAvailable =>
      'Le navigateur intégré n\'est pas disponible sur cette plateforme.';

  @override
  String get adminRestartServerConfirmation =>
      'Êtes-vous sûr de vouloir redémarrer le serveur ?';

  @override
  String get adminShutdownServerConfirmation =>
      'Êtes-vous sûr de vouloir arrêter le serveur ? Vous devrez le redémarrer manuellement.';

  @override
  String get internal => 'Interne';

  @override
  String get idle => 'Inactif';

  @override
  String get os => 'OS';

  @override
  String get adminNoUsersFound => 'Aucun utilisateur trouvé';

  @override
  String get adminNoUsersMatchSearch =>
      'Aucun utilisateur ne correspond à votre recherche';

  @override
  String get adminNoDevicesFound => 'Aucun appareil trouvé';

  @override
  String get adminNoDevicesMatchCurrentFilters =>
      'Aucun appareil ne correspond aux filtres actuels';

  @override
  String get remoteAccess => 'Accès à distance';

  @override
  String get localOnly => 'Local uniquement';

  @override
  String get adminMediaAnalyticsLoadFailed =>
      'Échec du chargement de l\'analyse des médias';

  @override
  String get analyticsCombinedAcrossLibraries =>
      'Analyses combinées dans toutes les médiathèques.';

  @override
  String get analyticsTopArtists => 'Meilleurs artistes';

  @override
  String get analyticsTopAuthors => 'Meilleurs auteurs';

  @override
  String get analyticsTopContributors => 'Meilleurs contributeurs';

  @override
  String analyticsLibrariesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bibliothèques',
      one: '1 Bibliothèque',
    );
    return '$_temp0';
  }

  @override
  String get analyticsNoIndexedMediaTotals =>
      'Aucun total de médias indexés n\'est encore disponible pour cette sélection.';

  @override
  String get analyticsLibraryDetails => 'Détails de la bibliothèque';

  @override
  String get analyticsLibraryBreakdown => 'Répartition de la bibliothèque';

  @override
  String get analyticsNoLibrariesAvailable =>
      'Aucune bibliothèque n\'est disponible.';

  @override
  String get analyticsLibraryShare =>
      'Répartition des éléments par bibliothèque';

  @override
  String get analyticsTopRating => 'Classification la plus fréquente';

  @override
  String get analyticsTypicalRuntime => 'Durée habituelle';

  @override
  String analyticsShareOfItems(String percent) {
    return '$percent % des éléments';
  }

  @override
  String get adminServerAdministrationTitle => 'Administration du serveur';

  @override
  String get adminServerPathData => 'Données';

  @override
  String get adminServerPathImageCache => 'Cache d\'images';

  @override
  String get adminServerPathCache => 'Cache';

  @override
  String get adminServerPathLogs => 'Journaux';

  @override
  String get adminServerPathMetadata => 'Métadonnées';

  @override
  String get adminServerPathTranscode => 'Transcoder';

  @override
  String get adminServerPathWeb => 'Internet';

  @override
  String get adminNoServerPathsReturned =>
      'Aucun chemin de serveur renvoyé par ce serveur.';

  @override
  String adminPercentUsed(int percent) {
    return '$percent% utilisé';
  }

  @override
  String get userActivity => 'Activité de l\'utilisateur';

  @override
  String get systemEvents => 'Événements système';

  @override
  String get needsAttention => 'A besoin d\'attention';

  @override
  String get homeVideos => 'Vidéos Accueil';

  @override
  String get mixedContent => 'Contenu mixte';

  @override
  String get homeVideosAndPhotos => 'Accueil Vidéos et photos';

  @override
  String get mixedMoviesAndShows => 'Films et émissions mixtes';

  @override
  String get dolbyVision => 'Dolby Vision';

  @override
  String get noRecordingsFound => 'Aucun enregistrement trouvé';

  @override
  String noImagePagesFoundInArchive(String extension) {
    return 'Aucune page d\'image trouvée dans l\'archive .$extension.';
  }

  @override
  String embeddedRendererFailed(int code, String description) {
    return 'Échec du moteur de rendu intégré ($code) : $description';
  }

  @override
  String epubRendererFailed(int code, String description) {
    return 'Échec du moteur de rendu EPUB ($code) : $description';
  }

  @override
  String missingLocalFileForReader(String uri) {
    return 'Fichier local manquant pour le lecteur : $uri';
  }

  @override
  String httpStatusWhileOpeningBookData(int status, String uri) {
    return 'HTTP $status lors de l\'ouverture des données du livre à partir de $uri';
  }

  @override
  String get noReadableBookEndpointAvailable =>
      'Aucun point de terminaison de livre lisible disponible';

  @override
  String unsupportedComicArchiveFormat(String extension) {
    return 'Format d\'archive de bande dessinée non pris en charge : .$extension';
  }

  @override
  String get cbrExtractionPluginUnavailable =>
      'Le plugin d\'extraction CBR n\'est pas disponible sur cette plateforme.';

  @override
  String get failedToExtractCbrArchive =>
      'Échec de l\'extraction de l\'archive .cbr.';

  @override
  String get cb7ExtractionUnavailable =>
      'L\'extraction CB7 n\'est pas disponible sur cette plateforme.';

  @override
  String get cb7ExtractionPluginUnavailable =>
      'Le plugin d\'extraction CB7 n\'est pas disponible sur cette plateforme.';

  @override
  String get loadingShuffle => 'Chargement de la lecture aléatoire…';

  @override
  String get libraryShuffleLabel => 'BIBLIOTHÈQUE ALÉATOIRE';

  @override
  String get randomShuffleLabel => 'TRI ALÉATOIRE';

  @override
  String get genresShuffleLabel => 'GENRES ALÉATOIRE';

  @override
  String get autoHdrSwitching => 'Commutation HDR automatique';

  @override
  String get autoHdrSwitchingDescription =>
      'Activez automatiquement le HDR pour la lecture vidéo HDR et restaurez le mode d\'affichage à la sortie.';

  @override
  String get whenFullscreen => 'En plein écran';

  @override
  String get changeArtwork => 'Changer le visuel';

  @override
  String get missing => 'Manquant';

  @override
  String get clearAllArtworkButton => 'Effacer tous les visuels ?';

  @override
  String get clearAllArtworkWarning =>
      'Êtes-vous sûr de vouloir supprimer tous les visuels téléchargés ?';

  @override
  String get confirmClear => 'Confirmer la suppression';

  @override
  String confirmClearMessage(String itemType) {
    return 'Êtes-vous sûr de vouloir effacer ce $itemType ?';
  }

  @override
  String get uploadButton => 'Envoyer ?';

  @override
  String get resolutionLabel => 'Résolution : ';

  @override
  String get onlyShowInterfaceLanguage =>
      'Afficher uniquement les visuels dans la langue de l\'interface';

  @override
  String get confirmClearAll => 'Confirmer la suppression';

  @override
  String get imageUploadSuccess => 'Image envoyée avec succès !';

  @override
  String imageUploadFailed(String error) {
    return 'Échec de l\'envoi de l\'image : $error';
  }

  @override
  String imageDownloadFailed(String error) {
    return 'Impossible de définir l\'image : $error';
  }

  @override
  String imageDeleteFailed(String error) {
    return 'Impossible de supprimer l\'image : $error';
  }

  @override
  String clearAllArtworkFailed(String error) {
    return 'Impossible d\'effacer tous les visuels : $error';
  }

  @override
  String get yes => 'Oui';

  @override
  String get posterCategory => 'Affiche';

  @override
  String get backdropsCategory => 'Vignettes';

  @override
  String get bannerCategory => 'Bannière';

  @override
  String get logoCategory => 'Logo';

  @override
  String get thumbnailCategory => 'Miniature';

  @override
  String get artCategory => 'Visuel';

  @override
  String get discArtCategory => 'Visuel du disque';

  @override
  String get screenshotCategory => 'Capture d\'écran';

  @override
  String get boxCoverCategory => 'Jaquette';

  @override
  String get boxRearCoverCategory => 'Jaquette arrière';

  @override
  String get menuArtCategory => 'Visuel du menu';

  @override
  String get confirmItemPoster => 'affiche';

  @override
  String get confirmItemBackdrop => 'vignette';

  @override
  String get confirmItemBanner => 'bannière';

  @override
  String get confirmItemLogo => 'logo';

  @override
  String get confirmItemThumbnail => 'miniature';

  @override
  String get confirmItemArt => 'visuel';

  @override
  String get confirmItemDiscArt => 'visuel du disque';

  @override
  String get confirmItemScreenshot => 'capture d\'écran';

  @override
  String get confirmItemBoxCover => 'jaquette';

  @override
  String get confirmItemBoxRearCover => 'jaquette arrière';

  @override
  String get confirmItemMenuArt => 'visuel du menu';

  @override
  String get resolutionAll => 'Toutes';

  @override
  String get resolutionHigh => 'Élevée (1080p+)';

  @override
  String get resolutionMedium => 'Moyenne (720p)';

  @override
  String get resolutionLow => 'Basse (<720p)';

  @override
  String get sources => 'Sources';

  @override
  String get audiobookChapters => 'Chapitres';

  @override
  String get audiobookBookmarks => 'Marque-pages';

  @override
  String get audiobookNotes => 'Notes';

  @override
  String get audiobookQueue => 'File d\'attente';

  @override
  String get audiobookTimeline => 'Chronologie';

  @override
  String get audiobookTimelineEmpty => 'La chronologie est vide';

  @override
  String get audiobookFocusedTimeline => 'Chronologie ciblée';

  @override
  String get audiobookFullTimeline => 'Timeline complète';

  @override
  String get audiobookExportBookmarks => 'Exporter les marque-pages';

  @override
  String get audiobookExportNotes => 'Exporter les notes';

  @override
  String get audiobookExportAll => 'Toute exporter';

  @override
  String audiobookExportSuccess(String path) {
    return 'Exporter vers $path';
  }

  @override
  String audiobookExportFailed(String error) {
    return 'Export échoué : $error';
  }

  @override
  String get audiobookLyrics => 'Paroles';

  @override
  String get audiobookAddBookmark => 'Ajouter un marque-page';

  @override
  String get audiobookAddNote => 'Ajouter une note';

  @override
  String get audiobookEditNote => 'Modifier une note';

  @override
  String get audiobookNoteHint => 'Écrire une note pour ce passage';

  @override
  String get audiobookSleepTimer => 'Minuteur de veille';

  @override
  String get audiobookSleepOff => 'Désactivé';

  @override
  String get audiobookSleepEndOfChapter => 'Fin du chapitre';

  @override
  String get audiobookSleepCustom => 'Personalisé';

  @override
  String audiobookSleepRemaining(String remaining) {
    return '$remaining restant';
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
  String get audiobookPlaybackSpeed => 'Vitesse de lecture';

  @override
  String get audiobookRemainingTime => 'Restant';

  @override
  String get audiobookElapsedTime => 'Écoulé';

  @override
  String audiobookSkipBackSeconds(int seconds) {
    return 'Reculer de ${seconds}s';
  }

  @override
  String audiobookSkipForwardSeconds(int seconds) {
    return 'Avancer de ${seconds}s';
  }

  @override
  String get audiobookPreviousChapter => 'Chapitre précédent';

  @override
  String get audiobookNextChapter => 'Chapitre suivant';

  @override
  String audiobookChapterIndicator(int current, int total) {
    return 'Chapitre $current sur $total';
  }

  @override
  String get audiobookNoChapters => 'Pas de chapitre';

  @override
  String get audiobookNoBookmarks => 'Pas encore de marque-pages';

  @override
  String get audiobookNoNotes => 'Pas encore de notes';

  @override
  String audiobookBookmarkAdded(String position) {
    return 'Marque-page ajoutée à $position';
  }

  @override
  String get audiobookSpeedReset => 'Réinitialiser a 1.0x';

  @override
  String audiobookSpeedCustomLabel(String value) {
    return '${value}x';
  }

  @override
  String get audiobookSave => 'Enregistrer';

  @override
  String get audiobookCancel => 'Annuler';

  @override
  String get audiobookDelete => 'Supprimer';

  @override
  String get subtitlePreferencesDescription =>
      'Modifier les modes de sous-titres, les langues par défaut, l\'apparence et les options de rendu.';

  @override
  String get subtitleRendering => 'Rendu des sous-titres';

  @override
  String get displayOptions => 'Options d\'affichage';

  @override
  String get releaseDateAscending => 'Date de sortie (croissant)';

  @override
  String get releaseDateDescending => 'Date de sortie (décroissant)';

  @override
  String get groupContributions => 'Regrouper les contributions';

  @override
  String get groupMultipleRoles => 'Regrouper les rôles d\'une même personne';

  @override
  String get libraryWriteAccessWarningTitle =>
      'Avertissement d\'accès en écriture à la bibliothèque';

  @override
  String get libraryWriteAccessHowToFix => 'Comment résoudre ce problème :';

  @override
  String get libraryWriteAccessFixSteps =>
      '1. Accordez les permissions d\'écriture à l\'utilisateur du service Jellyfin (par exemple, jellyfin ou le PUID/PGID Docker) sur les dossiers de votre bibliothèque multimédia, côté serveur.\n\n2. Ou, dans le tableau de bord Jellyfin (Bibliothèques), modifiez cette bibliothèque et désactivez « Enregistrer les visuels dans les dossiers multimédias » pour stocker les visuels dans la base de données interne de Jellyfin.';

  @override
  String get dismiss => 'Ignorer';

  @override
  String libraryWriteAccessProactiveBody(
    String libraryName,
    String failedPath,
  ) {
    return 'Votre bibliothèque « $libraryName » est configurée pour enregistrer les visuels directement dans les dossiers multimédias (l\'option « Enregistrer les visuels dans les dossiers multimédias » est activée). Cependant, Jellyfin a testé l\'accès en écriture et n\'a pas la permission d\'écrire des fichiers dans ce répertoire :\n\n$failedPath';
  }

  @override
  String get libraryWriteAccessReactiveBody =>
      'Il semble que Jellyfin n\'ait pas réussi à mettre à jour le visuel. Votre bibliothèque est configurée pour enregistrer les visuels directement dans les dossiers multimédias (l\'option « Enregistrer les visuels dans les dossiers multimédias » est activée). Cette erreur survient généralement lorsque le serveur Jellyfin n\'a pas la permission d\'écrire dans vos répertoires multimédias.';

  @override
  String get replay => 'Rejouer';

  @override
  String get fileInformation => 'Informations du fichier';

  @override
  String fileSizeFormat(Object size, Object format) {
    return 'Taille : $size  •  Format : $format';
  }

  @override
  String dateCreatedFormat(Object date) {
    return 'Ajouté le $date';
  }

  @override
  String showAllAudioTracks(int count) {
    return 'Afficher les ($count) pistes audios';
  }

  @override
  String showAllSubtitleTracks(int count) {
    return 'Afficher les ($count) pistes de sous-titre';
  }

  @override
  String get checkingDirectPlay => 'Vérification de la lecture directe…';

  @override
  String get directPlayCapabilityLabel => 'Possibilité de lecture directe : ';

  @override
  String get forced => 'Forcé';

  @override
  String get transcodeContainerNotSupported =>
      'Le format du conteneur n\'est pas supporté par le lecteur.';

  @override
  String get transcodeVideoCodecNotSupported =>
      'Le codec vidéo n\'est pas supporté.';

  @override
  String get transcodeAudioCodecNotSupported =>
      'Le codec audio n\'est pas supporté.';

  @override
  String get transcodeSubtitleCodecNotSupported =>
      'Le format de sous-titre n\'est pas supporté (burn-in requis).';

  @override
  String get transcodeAudioProfileNotSupported =>
      'Le profil audio n\'est pas supporté.';

  @override
  String get transcodeVideoProfileNotSupported =>
      'Le profil vidéo n\'est pas supporté.';

  @override
  String get transcodeVideoLevelNotSupported =>
      'Le niveau vidéo n\'est pas supporté.';

  @override
  String get transcodeVideoResolutionNotSupported =>
      'Cette résolution n\'est pas supportée par cet appareil.';

  @override
  String get transcodeVideoBitDepthNotSupported =>
      'La profondeur de bits vidéo n\'est pas supportée.';

  @override
  String get transcodeVideoFramerateNotSupported =>
      'La fréquence vidéo n\'est pas supporté.';

  @override
  String get transcodeContainerBitrateExceedsLimit =>
      'Le débit du fichier dépasse la limite de streaming du lecteur.';

  @override
  String get transcodeVideoBitrateExceedsLimit =>
      'Le débit vidéo dépasse la limite de streaming.';

  @override
  String get transcodeAudioBitrateExceedsLimit =>
      'Le débit audio dépasse la limite de streaming.';

  @override
  String get transcodeAudioChannelsNotSupported =>
      'Ce nombre de canaux audio n\'est pas supporté.';

  @override
  String transcodeAudioCodecWithCodec(String codec) {
    return 'Le codec audio ($codec) n\'est pas pris en charge directement.';
  }

  @override
  String transcodeAudioCodecHintPassthrough(String codec) {
    return 'Astuce : si votre ampli AV ou votre barre de son gère le $codec, activez le Passthrough audio dans les paramètres audio.';
  }

  @override
  String transcodeAudioChannelsExceeded(int channels) {
    return 'Le nombre de canaux audio ($channels canaux) dépasse la limite du lecteur.';
  }

  @override
  String get transcodeAudioChannelsHint =>
      'Astuce : ajustez « Canaux audio maximum » ou le mixage multicanal dans les paramètres audio.';

  @override
  String get transcodeSubtitleBurnInAssDisabled =>
      'Les sous-titres ASS/SSA nécessitent un transcodage, car la lecture directe est désactivée.';

  @override
  String get transcodeSubtitleBurnInAssHint =>
      'Astuce : activez « Lecture directe ASS/SSA » dans les paramètres de lecture pour lire sans transcodage.';

  @override
  String get transcodeSubtitleBurnInPgsDisabled =>
      'Les sous-titres PGS nécessitent un transcodage, car la lecture directe est désactivée.';

  @override
  String get transcodeSubtitleBurnInPgsHint =>
      'Astuce : activez « Lecture directe PGS » dans les paramètres de lecture pour lire sans transcodage.';

  @override
  String transcodeSubtitleNotSupportedWithCodec(String codec) {
    return 'Le format de sous-titres ($codec) n\'est pas pris en charge directement et doit être incrusté.';
  }

  @override
  String transcodeBitrateExceededWithValues(
    String fileBitrate,
    String maxBitrate,
  ) {
    return 'Le débit du fichier ($fileBitrate) dépasse la limite de streaming configurée ($maxBitrate).';
  }

  @override
  String get transcodeBitrateHint =>
      'Astuce : augmentez « Débit maximum » dans les paramètres de lecture pour autoriser la diffusion directe.';

  @override
  String get transcodeResolutionHint =>
      'Astuce : augmentez « Résolution maximum » dans les paramètres de lecture pour autoriser la diffusion directe.';

  @override
  String get transcodeVideoRangeNotSupported =>
      'La plage dynamique de la vidéo (Dolby Vision, HDR…) n\'est pas prise en charge par cet écran.';

  @override
  String get transcodeDolbyVisionProfile7ElDisabled =>
      'La lecture directe de la couche d\'amélioration Dolby Vision Profil 7 est désactivée.';

  @override
  String get transcodeDolbyVisionProfile7ElHint =>
      'Astuce : activez « Dolby Vision Profile 7 Lecture directe » dans les paramètres de lecture si votre écran le permet.';

  @override
  String get transcodeDolbyVisionFallbackPreferenceTranscode =>
      'Vos paramètres privilégient le transcodage comme solution secondaire pour le Dolby Vision.';

  @override
  String get transcodeDolbyVisionFallbackHint =>
      'Astuce : réglez « Solution de repli Dolby Vision » sur « Lire en HDR10 » dans les paramètres de lecture pour éviter le transcodage.';

  @override
  String get transcodeDisplayReportsNoHdr =>
      'L\'écran ne déclare aucune prise en charge du HDR ni du Dolby Vision.';

  @override
  String get transcodeDisplayLacksHdr10ForFallback =>
      'L\'écran ne gère pas le HDR10, nécessaire au repli Dolby Vision.';

  @override
  String get transcodeAudioSampleRateNotSupported =>
      'La fréquence d\'échantillonnage audio n\'est pas prise en charge.';

  @override
  String get transcodeAudioBitDepthNotSupported =>
      'La profondeur de bits audio n\'est pas prise en charge.';

  @override
  String get transcodeRefFramesNotSupported =>
      'Le nombre d\'images de référence dépasse les limites du lecteur.';

  @override
  String get transcodeAnamorphicVideoNotSupported =>
      'La vidéo anamorphique n\'est pas prise en charge.';

  @override
  String get transcodeInterlacedVideoNotSupported =>
      'La vidéo entrelacée n\'est pas prise en charge.';

  @override
  String get transcodeSecondaryAudioNotSupported =>
      'La piste audio secondaire nécessite un transcodage.';

  @override
  String get transcodeDirectPlayError =>
      'La lecture directe n\'est pas prise en charge pour ce format de média.';

  @override
  String get sortServerOrder => 'Server Order';

  @override
  String get sortAlphabetical => 'Alphabétique';

  @override
  String get sortReleaseAscending => 'Ordre de sortie (Ascendant)';

  @override
  String get sortReleaseDescending => 'Ordre de sortie (Descendant)';

  @override
  String get sortCustomDragDrop => 'Personnalisé (Drag-and-Drop)';

  @override
  String sortCurrent(String option) {
    return 'Sort: $option';
  }

  @override
  String get playlistSortOptions => 'Options de tri de la playlist';

  @override
  String get resetSort => 'Réinitialiser le tri';

  @override
  String rewatchSeasonEpisode(int season, int episode) {
    return 'Revoir S$season:E$episode';
  }

  @override
  String get rewatchPlaylist => 'Revoir la playlist';

  @override
  String get noSubtitlesFound => 'Aucun sous-titre trouvé.';

  @override
  String get adminControls => 'Contrôles d\'administration';

  @override
  String get impellerRendering => 'Moteur de rendu (Impeller)';

  @override
  String get impellerRenderingSubtitle =>
      'Impeller est le moteur de rendu GPU moderne de Flutter : animations plus fluides et moins de saccades. Sur certains boîtiers TV et GPU anciens, il peut provoquer des artefacts ou une image noire ; désactivez-le si vous constatez ces problèmes. Automatique choisit le meilleur réglage pour votre appareil. Redémarrez Moonfin pour appliquer.';

  @override
  String get impellerAuto => 'Automatique';

  @override
  String get impellerOn => 'Activé';

  @override
  String get impellerOff => 'Désactivé';

  @override
  String get impellerRestartTitle => 'Redémarrage requis';

  @override
  String get impellerRestartMessage =>
      'Moonfin doit redémarrer pour changer de moteur de rendu. Fermez l\'application maintenant, puis rouvrez-la pour appliquer le changement.';

  @override
  String get impellerCloseNow => 'Fermer l\'application immédiatement';

  @override
  String get adminRefreshLibrary => 'Actualiser la bibliothèque';

  @override
  String get adminRefreshAllLibraries => 'Actualiser toutes les bibliothèques';

  @override
  String get adminRepoSortDateOldest =>
      'Date d\'ajout (les plus anciens d\'abord)';

  @override
  String get adminRepoSortDateNewest =>
      'Date d\'ajout (les plus récents d\'abord)';

  @override
  String get adminRepoSortNameAsc => 'Alphabétique (A à Z)';

  @override
  String get adminRepoSortNameDesc => 'Alphabétique (Z à A)';

  @override
  String adminAnalyticsLoadingProgress(int percentage) {
    return 'Chargement des statistiques du serveur... $percentage%';
  }

  @override
  String get adminLibChapterImageResolutionMatchSource =>
      'Identique à la source';

  @override
  String get imdbTop250Movies => 'IMDb Top 250 des films';

  @override
  String get imdbTop250TvShows => 'IMDb Top 250 des séries TV';

  @override
  String get imdbMostPopularMovies => 'IMDb Films les plus populaires';

  @override
  String get imdbMostPopularTvShows => 'IMDb Séries TV les plus populaires';

  @override
  String get imdbLowestRatedMovies => 'IMDb Films les moins bien notés';

  @override
  String get imdbTopEnglishMovies => 'IMDb Meilleurs films anglophones';

  @override
  String get addToWatchlist => 'Ajouter à votre liste';

  @override
  String get removeFromWatchlist => 'Retirer de votre liste';

  @override
  String get watchlistUpdateFailed => 'Impossible de mettre à jour votre liste';

  @override
  String get adminSearchParameters => 'Paramètres de recherche';

  @override
  String get adminCurrentMetadata => 'Métadonnées actuelles';

  @override
  String get adminLabelYear => 'Année';

  @override
  String get adminReplaceImages => 'Remplacer les images existantes';

  @override
  String get adminBackToSearch => 'Retour aux critères de recherche';

  @override
  String get grouping => 'Regroupement';

  @override
  String get groupByType => 'Regrouper par type';

  @override
  String get playlistTypes => 'Types de playlists';

  @override
  String get playlistTypeVideo => 'Vidéo';

  @override
  String get playlistTypeMusicVideo => 'Vidéoclip';

  @override
  String get playlistTypeAudio => 'Audio (musique)';

  @override
  String get playlistTypeAudiobook => 'Livre audio';

  @override
  String get playlistTypeBook => 'Livre';

  @override
  String get playlistTypePhoto => 'Photo';

  @override
  String get playlistTypeMixed => 'Mixte';

  @override
  String get videoPlaylistsSection => 'Playlists vidéo';

  @override
  String get musicVideoPlaylistsSection => 'Playlists de vidéoclips';

  @override
  String get audioPlaylistsSection => 'Playlists audio';

  @override
  String get audiobookPlaylistsSection => 'Playlists de livres audio';

  @override
  String get bookPlaylistsSection => 'Playlists de livres';

  @override
  String get photoPlaylistsSection => 'Playlists photo';

  @override
  String get mixedPlaylistsSection => 'Playlists mixtes';

  @override
  String get currentTime => 'Heure actuelle';

  @override
  String get playbackTimeDisplay => 'Temps sur la barre de progression';

  @override
  String get settingsPlaybackTimeDisplayDescription =>
      'Choisir les indications de temps affichées autour de la barre de progression.';

  @override
  String get playbackTimeTotal => 'Durée totale';

  @override
  String get playbackTimeRemaining => 'Temps restant';

  @override
  String get playbackTimeEndsAt => 'Fin à';

  @override
  String get playbackTimeElapsed => 'Temps écoulé';

  @override
  String get playbackTimeVideoSection => 'Lecteur vidéo';

  @override
  String get playbackTimeMusicSection => 'Lecteur de musique';

  @override
  String get playbackTimeSlotDescription =>
      'Choisir ce qui s\'affiche ici, ou ne rien afficher.';

  @override
  String get playbackTimeAboveBarLeft => 'Au-dessus, à gauche';

  @override
  String get playbackTimeAboveBarCenter => 'Au-dessus, au centre';

  @override
  String get playbackTimeAboveBarRight => 'Au-dessus, à droite';

  @override
  String get playbackTimeBelowBarLeft => 'En dessous, à gauche';

  @override
  String get playbackTimeBelowBarCenter => 'En dessous, au centre';

  @override
  String get playbackTimeBelowBarRight => 'En dessous, à droite';

  @override
  String get settingsMusicPlaybackTimeDescription =>
      'Choisir ce qui s\'affiche à droite de la barre de progression musicale.';

  @override
  String get groupByTitle => 'Regrouper par';

  @override
  String get groupByDecade => 'Décennie (année)';

  @override
  String get groupByParentalRating => 'Classification parentale';

  @override
  String get groupByStudio => 'Studio';

  @override
  String get showAlphabeticalFilters => 'Afficher l\'alphabet';

  @override
  String get libraryFolderView => 'Folder View';

  @override
  String get personalRatingStyle => 'Style de notation';

  @override
  String get personalRatingThumbs => 'J\'aime / Je n\'aime pas';

  @override
  String get personalRatingStars => '5 étoiles';

  @override
  String get personalRatingNumeric => 'Note sur 10';

  @override
  String get rate => 'Noter';

  @override
  String get like => 'J\'aime';

  @override
  String get dislike => 'Je n\'aime pas';

  @override
  String get personalRatingClear => 'Effacer la note';

  @override
  String get personalRatingRated => 'Noté';

  @override
  String get personalRatingMine => 'Ma note';

  @override
  String get personalRatingSaveFailed => 'Impossible d\'enregistrer la note';

  @override
  String get increase => 'Augmenter';

  @override
  String get decrease => 'Diminuer';

  @override
  String personalRatingOutOfTen(String rating) {
    return '$rating / 10';
  }

  @override
  String personalRatingOutOfFive(String rating) {
    return '$rating / 5';
  }

  @override
  String get filterInProgress => 'En cours';

  @override
  String get filterUnreleased => 'Non sorti';

  @override
  String get filterTrailers => 'Bandes-annonces';

  @override
  String get filterExtras => 'Bonus';

  @override
  String get filterThemeSongs => 'Thèmes musicaux';

  @override
  String get filterThemeVideos => 'Vidéos de thème';

  @override
  String get source => 'Source';

  @override
  String get years => 'Années';

  @override
  String get audioLanguage => 'Langue audio';

  @override
  String get subtitleLanguage => 'Langue des sous-titres';

  @override
  String get clearFilters => 'Effacer les filtres';

  @override
  String get seerrShortcutsRow => 'Parcourir Seerr';

  @override
  String get seerrReleased => 'Sorti';

  @override
  String get seerrMinRating => 'Note minimale';

  @override
  String get seerrMinVotes => 'Nombre de votes minimum';

  @override
  String get seerrOriginalLanguage => 'Langue originale';

  @override
  String get seerrRuntime => 'Durée';

  @override
  String get subtitleHdrSeparate => 'Style HDR distinct';

  @override
  String get subtitleHdrSeparateSubtitle =>
      'Le blanc est bien plus lumineux en HDR qu\'en SDR : un style de sous-titres plus sombre évite l\'éblouissement';

  @override
  String get scrollSensitivity => 'Sensibilité du défilement';

  @override
  String get scrollSensitivitySubtitle =>
      'Distance parcourue par un cran de molette';

  @override
  String get mediaDetailsAndSpoilers => 'Détails et spoilers';

  @override
  String get openTrailersExternally =>
      'Ouvrir les bandes-annonces dans une app externe';

  @override
  String get openTrailersExternallySubtitle =>
      'Les bandes-annonces s\'ouvrent dans l\'app YouTube ou le navigateur au lieu du lecteur intégré';

  @override
  String get hideDetailsMediaDescription => 'Masquer la description';

  @override
  String get hideDetailsMediaDescriptionSubtitle =>
      'Masque le texte descriptif du film ou de l\'épisode.';

  @override
  String get detailUseSeriesThumbnails => 'Utiliser les miniatures de la série';

  @override
  String get detailUseSeriesThumbnailsSubtitle =>
      'Remplace toutes les miniatures de la page de détails Classique par celle de la série';

  @override
  String get hideHomeMediaDescription => 'Masquer la description';

  @override
  String get hideHomeMediaDescriptionSubtitle =>
      'Masque le texte descriptif du film ou de l\'épisode.';

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
      'Continuer à regarder et prochain épisode';

  @override
  String get setupSkip => 'Ignorer la configuration';

  @override
  String get setupNavbarQuestion => 'Où placer la navigation ?';

  @override
  String get setupMediaBarQuestion =>
      'Quelle apparence pour le haut de votre écran d\'accueil ?';

  @override
  String get setupHomeRowsQuestion => 'Quelle apparence pour vos rangées ?';

  @override
  String get setupDetailQuestion =>
      'Quelle apparence pour la fiche d\'un film ou d\'une série ?';

  @override
  String get setupTourQuestion =>
      'C\'est prêt. Voici ce que vous pouvez encore découvrir.';

  @override
  String get setupPlaybackLanguages => 'Langues de lecture';

  @override
  String get setupOptional => 'Facultatif';

  @override
  String get setupStyleClassic => 'Classique';

  @override
  String get setupStyleModern => 'Moderne';

  @override
  String get setupRowsClassicHint =>
      'Compact. Plus de rangées visibles à l\'écran.';

  @override
  String get setupRowsModernHint =>
      'Cartes plus grandes, avec les titres en dessous.';

  @override
  String get setupDetailClassicHint =>
      'Tout est centré, sur une seule colonne.';

  @override
  String get setupDetailModernHint =>
      'Cinématique, avec des onglets pour la distribution et les bonus.';

  @override
  String get setupStyleSpotlight => 'Spotlight';

  @override
  String get setupDetailSpotlightHint =>
      'Grand visuel mise en avant, avec des fenêtres pour la distribution et les bonus.';

  @override
  String get setupStyleNouveau => 'Nouveau';

  @override
  String get setupDetailNouveauHint =>
      'Plein écran, avec des sections empilées au lieu d\'onglets.';

  @override
  String get setupStyleMinimalist => 'Minimaliste';

  @override
  String get setupDetailMinimalistHint =>
      'Le visuel, un bouton de lecture et les épisodes.';

  @override
  String get setupNavbarStyleQuestion =>
      'Quelle apparence pour la barre du bas ?';

  @override
  String get setupNavbarStyleDockHint =>
      'Une pastille flottante avec des libellés sous chaque onglet.';

  @override
  String get setupNavbarStyleSplitHint =>
      'La recherche dispose de son propre bouton, et la barre se réduit pendant le défilement.';

  @override
  String get setupNavbarStyleStripHint =>
      'Une barre pleine largeur le long du bord inférieur.';

  @override
  String get setupPickALook => 'Choisissez une apparence';

  @override
  String get setupTourMoreHeader =>
      'D\'autres options vous attendent dans les réglages';

  @override
  String get setupTourBulletRequests => 'Demandes Seerr';

  @override
  String get setupTourBulletSyncPlay => 'Sessions de visionnage SyncPlay';

  @override
  String get setupTourBulletThemes => 'Thèmes personnalisés';

  @override
  String get setupTourBulletDownloads => 'Téléchargements hors ligne';

  @override
  String get setupTourBulletMore => 'Et bien plus encore';

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
  String get runSetupAgain => 'Relancer la configuration';

  @override
  String get serverMessages => 'Messages';

  @override
  String get serverMessagesEmpty =>
      'Aucun message de votre serveur pour l\'instant';

  @override
  String get serverMessagesMarkAllRead => 'Tout marquer comme lu';

  @override
  String get serverMessagesShowButton => 'Afficher le bouton Messages';

  @override
  String get serverMessagesShowButtonSubtitle =>
      'Ajoute au menu un bouton pour les messages envoyés par l\'admin du serveur';

  @override
  String get showBookDiscoverTab =>
      'Afficher la découverte dans les bibliothèques de livres';

  @override
  String get showBookDiscoverTabDescription =>
      'Parcourez des titres d\'Open Library et de LibriVox dans vos bibliothèques de livres et de livres audio';

  @override
  String get autoDownloadNewEpisodes =>
      'Télécharger automatiquement les nouveaux épisodes';

  @override
  String get autoDownloadStop => 'Arrêter le téléchargement automatique';

  @override
  String autoDownloadKeepUnwatchedSubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Télécharge les nouveaux épisodes, en conservant $count épisodes non vus à la fois',
      one:
          'Télécharge les nouveaux épisodes, en conservant $count épisode non vu à la fois',
      zero: 'Télécharge chaque nouvel épisode',
    );
    return '$_temp0';
  }

  @override
  String autoDownloadStopSubtitle(String quality) {
    return 'Activé · $quality';
  }

  @override
  String get autoDownloadTranscodedForegroundNote =>
      'Les qualités transcodées ne se téléchargent que lorsque Moonfin est ouvert. La qualité d\'origine se télécharge aussi en arrière-plan.';

  @override
  String get autoDownloadTranscodedRunningNote =>
      'Les téléchargements transcodés ne reprennent pas après une interruption et redémarrent depuis le début. La qualité d\'origine, elle, peut reprendre.';

  @override
  String get autoDownloadForegroundOnly =>
      'Télécharge uniquement lorsque Moonfin est ouvert';

  @override
  String get autoDownloadQualityTitle =>
      'Qualité des téléchargements automatiques';

  @override
  String autoDownloadEnabledFor(String title) {
    return 'Téléchargement automatique activé : $title';
  }

  @override
  String autoDownloadStoppedFor(String title) {
    return 'Téléchargement automatique arrêté : $title';
  }

  @override
  String get smartDownloadsSection => 'Téléchargements intelligents';

  @override
  String get smartDownloadsEnable => 'Télécharger les épisodes suivants';

  @override
  String get smartDownloadsEnableDescription =>
      'Lorsque vous terminez un épisode sur n\'importe quel appareil, Moonfin télécharge les suivants. Les épisodes qu\'il télécharge sont supprimés une fois vus.';

  @override
  String get smartDownloadsKeepReady => 'Épisodes à garder téléchargés';

  @override
  String smartDownloadsKeepReadySubtitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Conserve les $count prochains épisodes téléchargés',
      one: 'Conserve le prochain épisode téléchargé',
    );
    return '$_temp0';
  }

  @override
  String get smartDownloadsKeepReadyLowered =>
      'Les épisodes déjà téléchargés restent sur votre appareil. Le nouveau nombre s\'applique aux prochains téléchargements.';

  @override
  String get autoDownloadSection => 'Téléchargements automatiques';

  @override
  String get autoDownloadEnable => 'Activer les téléchargements automatiques';

  @override
  String get autoDownloadEnableSubtitle =>
      'Télécharge les nouveaux épisodes des séries que vous suivez. Les épisodes déjà parus restent téléchargeables manuellement.';

  @override
  String get autoDownloadKeepUnwatched => 'Épisodes non vus à conserver';

  @override
  String get autoDownloadKeepAll => 'Tous';

  @override
  String get autoDownloadDelete => 'Suppression des épisodes téléchargés';

  @override
  String get autoDownloadDeleteFollowedSubtitle =>
      'Quand supprimer les épisodes téléchargés pour les séries que vous suivez, après les avoir vus';

  @override
  String get removeWatchedDownloads => 'Supprimer les téléchargements vus';

  @override
  String get removeWatchedDownloadsSubtitle =>
      'Quand supprimer les épisodes et films que vous avez téléchargés vous-même. Seuls ceux que vous regardez après l\'activation de ce réglage sont supprimés';

  @override
  String get keepDownloaded => 'Conserver le téléchargement';

  @override
  String get keepDownloadedSubtitle =>
      'Ne jamais supprimer ce téléchargement automatiquement après visionnage';

  @override
  String get autoDownloadDeleteNever => 'Jamais';

  @override
  String get autoDownloadDeleteImmediately => 'Juste après le visionnage';

  @override
  String get autoDownloadDeleteAfterDay => '1 jour après le visionnage';

  @override
  String get autoDownloadDeleteAfterWeek => '1 semaine après le visionnage';

  @override
  String get autoDownloadBackgroundRefresh => 'Vérifier en arrière-plan';

  @override
  String get autoDownloadBackgroundRefreshSubtitle =>
      'Autorise le système à rechercher périodiquement de nouveaux épisodes lorsque Moonfin est fermé';

  @override
  String get autoDownloadBackgroundRefreshDenied =>
      'L\'actualisation en arrière-plan est désactivée pour Moonfin. Activez-la dans les réglages iOS.';

  @override
  String get autoDownloadBackgroundRestrictedAndroid =>
      'L\'utilisation en arrière-plan est restreinte pour Moonfin dans les paramètres Android.';

  @override
  String get autoDownloadCheckNow => 'Vérifier maintenant';

  @override
  String get autoDownloadChecking => 'Vérification…';

  @override
  String get autoDownloadNeverChecked => 'Aucune vérification effectuée';

  @override
  String autoDownloadLastCheck(String when, int queued) {
    String _temp0 = intl.Intl.pluralLogic(
      queued,
      locale: localeName,
      other: '$queued épisodes en file d\'attente',
      one: '$queued épisode en file d\'attente',
      zero: 'rien de nouveau',
    );
    return 'Dernière vérification $when : $_temp0';
  }

  @override
  String autoDownloadLastCheckFailed(String when, String error) {
    return 'Échec de la dernière vérification $when : $error';
  }

  @override
  String get autoDownloadFollowedSeries => 'Séries suivies';

  @override
  String get autoDownloadNoSubscriptions =>
      'Ouvrez une série et choisissez « Télécharger automatiquement les nouveaux épisodes » dans son menu de téléchargement';

  @override
  String get autoDownloadRemove => 'Ne plus suivre';

  @override
  String get autoDownloadStorageFull => 'Espace de stockage insuffisant';

  @override
  String get autoDownloadWaitingForWifi => 'En attente du Wi-Fi';

  @override
  String get downloadNotificationRunning => 'Téléchargement en cours';

  @override
  String downloadNotificationRunningBatch(int done, int total) {
    return 'Téléchargement ($done / $total)';
  }

  @override
  String downloadNotificationProgress(String name, int percent) {
    return '$name · $percent %';
  }

  @override
  String downloadNotificationTransfer(
    String name,
    String progress,
    String timeRemaining,
  ) {
    return '$name · $progress · $timeRemaining';
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
      other: 'Téléchargements terminés',
      one: 'Téléchargement terminé',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSaved(String name) {
    return '$name enregistré hors ligne';
  }

  @override
  String downloadNotificationSavedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments enregistrés hors ligne',
      one: '$count élément enregistré hors ligne',
    );
    return '$_temp0';
  }

  @override
  String downloadNotificationSeriesEpisodes(String series, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count épisodes',
      one: '$count épisode',
    );
    return '$series : $_temp0';
  }

  @override
  String get downloadNotificationFailedTitle => 'Échec du téléchargement';

  @override
  String downloadNotificationFailedBody(String name, String error) {
    return '$name : $error';
  }

  @override
  String get serverMessagesNotificationTitle => 'Message distant';

  @override
  String get serverMessagesNotificationReceived => 'Message reçu';

  @override
  String get downloadStorageLimitReached =>
      'Limite de stockage atteinte. Libérez de l\'espace ou augmentez la limite.';

  @override
  String downloadNotEnoughStorage(String needed, String free) {
    return 'Espace insuffisant : $needed nécessaires, $free disponibles';
  }

  @override
  String get autoDownloadStorageFullTitle =>
      'Espace insuffisant pour les nouveaux épisodes';

  @override
  String autoDownloadStorageFullBody(int count, String name, String size) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count épisodes attendent de la place.',
      one: '$name nécessite $size.',
    );
    return '$_temp0 Libérez de l\'espace ou augmentez la limite de téléchargement.';
  }

  @override
  String get pageTransitions => 'Transitions de page';

  @override
  String get pageTransitionsSubtitle =>
      'Ajuste la durée du fondu lors du passage d\'une page à l\'autre';

  @override
  String get navigationSpeed => 'Vitesse de navigation';

  @override
  String get navigationSpeedSubtitle =>
      'Ajuste la vitesse de déplacement de l\'indicateur de sélection entre les éléments et les rangées';

  @override
  String get modernCardsTransitionSpeed =>
      'Vitesse de transition des visuels modernes';

  @override
  String get modernCardsTransitionSpeedSubtitle =>
      'Ajuste la vitesse d\'agrandissement des visuels modernes sélectionnés';

  @override
  String get delayCardExpansionOnRapidScroll =>
      'Retarder l\'agrandissement lors d\'un défilement rapide';

  @override
  String get delayCardExpansionOnRapidScrollSubtitle =>
      'Attend une pause dans le déplacement avant d\'agrandir les visuels modernes';

  @override
  String get animationSpeedExtraSlow => 'Très lente';

  @override
  String get animationSpeedSlow => 'Lente';

  @override
  String get animationSpeedMedium => 'Moyenne';

  @override
  String get animationSpeedFast => 'Rapide';

  @override
  String get animationSpeedOff => 'Désactivée';

  @override
  String get pageTransitionFadeNone => 'Aucun fondu';

  @override
  String get pageTransitionFadeShort => 'Fondu court';

  @override
  String get pageTransitionFadeMedium => 'Fondu moyen';

  @override
  String get pageTransitionFadeLong => 'Fondu long';

  @override
  String get siriRemoteSwipeSensitivity =>
      'Sensibilité du glissé sur le pavé tactile';

  @override
  String get siriRemoteSwipeSensitivityDescription =>
      'Distance parcourue par la sélection à chaque glissé sur le pavé tactile de la Siri Remote';

  @override
  String get appleTvHomeScreen => 'Écran d\'accueil Apple TV';

  @override
  String get topShelf => 'Top Shelf';

  @override
  String get topShelfDescription =>
      'Ce que l\'écran d\'accueil de l\'Apple TV affiche au-dessus de l\'icône Moonfin lorsqu\'elle est sélectionnée. Ce paramètre ne s\'applique qu\'à cet appareil.';

  @override
  String get topShelfLatestMedia => 'Médias récemment ajoutés';

  @override
  String get topShelfAppBanner => 'Bannière Moonfin';

  @override
  String get keepVideoClearOfDynamicIsland =>
      'Garder la vidéo à l\'écart de la Dynamic Island';

  @override
  String get keepVideoClearOfDynamicIslandDescription =>
      'En mode paysage, le logement de la caméra recouvre un bord de l\'écran. Ce réglage retient l\'image en retrait de cette zone ; il n\'a d\'effet que sur une vidéo assez large pour l\'atteindre.';

  @override
  String get bottomNavbarStyle => 'Style de la barre inférieure';

  @override
  String get bottomNavbarStyleDock => 'Dock';

  @override
  String get bottomNavbarStyleSplit => 'Scindé';

  @override
  String get bottomNavbarStyleStrip => 'Bandeau';

  @override
  String get bottomNavbarTabs => 'Onglets de la barre inférieure';

  @override
  String get bottomNavbarTabsDescription =>
      'Épinglez jusqu\'à 3 onglets entre Accueil et Vous. Tout le reste se trouve dans le menu de la barre inférieure.';

  @override
  String get bottomNavbarTabsAutomatic => 'Automatique';

  @override
  String get bottomNavbarTabsPinned => 'Épinglés';

  @override
  String get bottomNavbarTabsAvailable => 'Disponible';

  @override
  String get bottomNavbarTabsReset => 'Réinitialiser en mode automatique';

  @override
  String get bottomNavbarTabsLimit =>
      'Vous pouvez épingler jusqu\'à 3 onglets. Retirez-en un pour en épingler un autre.';

  @override
  String get bottomNavbarTabTurnedOff => 'Désactivé dans « Boutons »';

  @override
  String get bottomNavbarSplitSearchNote =>
      'Dans le style Scindé, Rechercher a toujours son propre bouton.';

  @override
  String get bottomNavbarButtonsNote =>
      'Ils déterminent ce qui apparaît dans le menu de la barre inférieure et les onglets que vous pouvez épingler à la barre. Les onglets déjà présents sur la barre n\'apparaissent pas ici.';

  @override
  String get navYou => 'Vous';

  @override
  String get cinemaSkipPrerolls => 'Cinema Mode Skip Button';

  @override
  String get cinemaSkipPrerollsDescription =>
      'Show a Skip button during Cinema Mode trailers, commercials, and other pre-rolls.';

  @override
  String get detailsPage => 'Page de détails';

  @override
  String get storageAndDownloads => 'Stockage et téléchargements';

  @override
  String get integrations => 'Intégrations';

  @override
  String get settingsSync => 'Synchro des paramètres';

  @override
  String get settingsSyncSubtitle =>
      'Synchronisation du plugin Moonbase et profils de personnalisation';

  @override
  String get navigationBar => 'Barre de navigation';

  @override
  String get homeRows => 'Rangées';

  @override
  String get homeRowsSubtitle =>
      'Activez ou désactivez les rangées et modifiez leur ordre';

  @override
  String get rowOptions => 'Options des rangées';

  @override
  String get rowOptionsSubtitle => 'Tri et contenu de chaque rangée';

  @override
  String get imageTypePerRow => 'Type d\'image par rangée';

  @override
  String get externalSources => 'Sources externes';

  @override
  String get qualityAndDecoding => 'Qualité et décodage';

  @override
  String get qualityAndDecodingSubtitle =>
      'Débit, résolution, décodage, HDR et Dolby Vision';

  @override
  String get skippingAndAutoplay => 'Saut et lecture automatique';

  @override
  String get advancedPlayback => 'Lecture avancée';

  @override
  String get advancedPlaybackSubtitle =>
      'Routage du lecteur, lecteurs externes et mpv';

  @override
  String get settingsAccountSubtitle =>
      'Connexion, code PIN, mode enfants, contrôle parental et synchronisation des paramètres';

  @override
  String get settingsGeneralSubtitle =>
      'Langue, horloge, saisie et performances';

  @override
  String get settingsAppearanceSubtitle =>
      'Navigation, écran d\'accueil, bibliothèques, page de détails et thèmes';

  @override
  String get settingsHomeScreenSubtitle =>
      'Rangées, barre média, apparence et sources externes';

  @override
  String get settingsLibrariesEntrySubtitle =>
      'Visibilité des bibliothèques, ordre et pages de bibliothèque';

  @override
  String get settingsDetailsPageSubtitle =>
      'Mise en page, boutons, sections, notes et thème musical';

  @override
  String get settingsPlaybackSubtitle =>
      'Lecteur, qualité, audio, sous-titres, passage des séquences et SyncPlay';

  @override
  String get settingsStorageSubtitle =>
      'Téléchargements, emplacement de stockage et cache d\'images';

  @override
  String get settingsServicesSubtitle => 'Seerr et Succès';

  @override
  String get settingsSignInSection => 'Connexion';

  @override
  String get settingsFamilySection => 'Famille';

  @override
  String get settingsServersSection => 'Serveurs';

  @override
  String get settingsLanguageSection => 'Langue';

  @override
  String get settingsInputSection => 'Saisie';

  @override
  String get settingsMotionSection => 'Animations';

  @override
  String get settingsContentsSection => 'Contenus';

  @override
  String get settingsLooksSection => 'Apparence';

  @override
  String get settingsAudioAndSubtitlesSection => 'Audio et sous-titres';

  @override
  String get settingsSkippingAndQueueSection => 'Saut et file d\'attente';

  @override
  String get settingsWatchTogetherSection => 'Regarder ensemble';

  @override
  String get settingsAdvancedSection => 'Avancé';

  @override
  String get playerSettingsSubtitle =>
      'Commandes, sauts dans la vidéo, boutons du lecteur et aperçu de lecture';

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
  String get playlistSortReleaseDate => 'Date de sortie';

  @override
  String get playlistSortCriticRating => 'Note des critiques';

  @override
  String get playlistSortRuntime => 'Durée';

  @override
  String get playlistSortLastPlayed => 'Dernière lecture';

  @override
  String get playlistSortPlayCount => 'Nombre de lectures';

  @override
  String get playlistSortRandom => 'Aléatoire';

  @override
  String playlistFilterActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filtres',
      one: '$count filtre',
    );
    return '$_temp0';
  }

  @override
  String get playlistNoMatchingTracks =>
      'Aucune piste ne correspond aux filtres actifs';

  @override
  String get librarySortPlaylistOrder => 'Ordre de la playlist';

  @override
  String get librarySortDateAdded => 'Date d\'ajout';

  @override
  String get librarySortDateEpisodeAdded => 'Date d\'ajout de l\'épisode';

  @override
  String get librarySortParentalRating => 'Classification parentale';

  @override
  String get librarySortMyRating => 'Ma note';

  @override
  String get librarySortAlbumArtist => 'Artiste de l\'album';

  @override
  String get librarySortAlbum => 'Album';

  @override
  String get librarySortArtist => 'Artiste';

  @override
  String get librarySortTrackNumber => 'Numéro de piste';

  @override
  String get librarySortGenre => 'Genre';

  @override
  String get librarySortFoldersFirst => 'Dossiers en premier';

  @override
  String get librarySortLength => 'Durée';

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
